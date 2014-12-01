class AgentsController < ApplicationController
  before_action :set_agent, only: [:show]

  # GET /agents
  # GET /agents.json
  def index
    @agents = Agent.all.page params[:page]
  end

  # GET /agents/1
  # GET /agents/1.json
  def show
    @history_events = Event.where("end_time < ? AND agent_id = ?", Time.new, @agent.id).limit(5).order('id asc')
    @upcoming_events = Event.where("end_time > ? AND agent_id = ?", Time.new, @agent.id).limit(5).order('id asc')

    respond_to do |format|
      format.json { render :json => {
          :agent => @agent.as_json,
          :histories_events => @history_events.as_json(:except => [:content, :agent_id]),
          :upcoming_events  => @upcoming_events.as_json(:except => [:content, :agent_id])
        }
      }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_agent
    @agent = Agent.find(params[:id])
  end
end
