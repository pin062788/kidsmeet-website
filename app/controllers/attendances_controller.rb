class AttendancesController < ApplicationController
  before_action :set_attendance, only: [:show, :edit, :update, :destroy]

  # GET /attendances
  # GET /attendances.json
  def index
    @attendances = Attendance.all
  end

  # GET /attendances/1
  # GET /attendances/1.json
  def show
  end

  # GET /attendances/new
  def new
    @attendance = Attendance.new
  end

  # GET /attendances/1/edit
  def edit
  end

  # POST /attendances
  # POST /attendances.json
  def join
      @attendance = Attendance.new(attendance_params)

    begin

      raise ArgumentError if params[:attendance][:phone_number].empty? ||
                             params[:attendance][:email].empty? ||
                             params[:attendance][:username].empty?

      user =  attendance_user
      event = attendance_event

      #if event.users.include?(user)
      #  respond_to do |format|
      #      format.html { redirect_to event, notice: '感谢您的支持，您已经报名过了哦！' }
      #  end
      #  return
      #end

      respond_to do |format|
        @attendance.user = user
        @attendance.event = event
        if @attendance.save
          format.html { redirect_to attendance_event, notice: '感谢您的关注，我们已收到您的报名信息，将尽快联系您！' }
          format.json { render :show, status: :created, location: attendance_event }
        else
          format.html { render :new }
          format.json { render json: @attendance.errors, status: :unprocessable_entity }
        end
      end
    rescue
      #Log the error
      respond_to do |format|
        format.html { redirect_to attendance_event }
      end
      return
    end

    end

  # PATCH/PUT /attendances/1
  # PATCH/PUT /attendances/1.json
  def update
    respond_to do |format|
      if @attendance.update(attendance_params)
        format.html { redirect_to @attendance, notice: 'Attendance was successfully updated.' }
        format.json { render :show, status: :ok, location: @attendance }
      else
        format.html { render :edit }
        format.json { render json: @attendance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attendances/1
  # DELETE /attendances/1.json
  def destroy
    @attendance.destroy
    respond_to do |format|
      format.html { redirect_to attendances_url, notice: 'Attendance was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attendance
      @attendance = Attendance.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def attendance_params
      params.require(:attendance).permit(:username, :phone_number, :email, :children_number, :adults_number)
    end

    def attendance_user
      user = User.find_by(:phone_number => params[:attendance][:phone_number])
      if user.nil?
        user = User.new({:username=>params[:attendance][:username],
                         :email => params[:attendance][:email],
                         :phone_number => params[:attendance][:phone_number]})
        user.save
      end
      user
    end

    def attendance_event
      Event.find(params[:attendance][:event_id])
    end
end
