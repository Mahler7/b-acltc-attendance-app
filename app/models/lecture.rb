class Lecture < ActiveRecord::Base
  belongs_to :cohort
  has_many :attendances
  has_many :students, through: :attendances

  validates :name, :start_time, :end_time, :cohort_id, presence: true

  def friendly_start_time 
    start_time.utc.strftime("%D %I:%M %p")
  end

  def friendly_end_time 
    end_time.utc.strftime("%D %I:%M %p")
  end
end
