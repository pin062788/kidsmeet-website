class Event < ActiveRecord::Base
  has_many :attendances
  belongs_to :agent
  has_many :pictures, :class_name=> "Ckeditor::Picture", :autosave => true
  accepts_nested_attributes_for :pictures, :allow_destroy => true

  scope :histories, ->(time) { where("end_time < ?", time) }

  validates :agent, presence: true
  validates :title, presence: true
  validates :category, presence: true
  validates :abstract, presence: true
  validates :content, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true


  def adults_number
    attendances.inject(0) { |result, item|
      result + item.adults_number
    }
  end

  def children_number
    attendances.inject(0) { |result, item|
      result + item.children_number
    }
  end

  def is_expired?
    end_time < Time.new
  end

  def detail_image_url
    brand_image_url.gsub('medium','large')
  end

  def brand_image_url
    "#{CONFIG['image_server']}/#{main_image.id}/original_#{main_image.data_file_name}"
  end

  def main_image
    pictures.first
  end

  def users
    #User.in(id: attendances.map(&:user_id))
  end

  def duration
    end_time - start_time
  end

  def as_json(options = { })
    json = super(options)
    json[:url] = "#{CONFIG['domain_name']}/events/#{id}"
    json
  end
end
