class Lecture < ActiveRecord::Base
  belongs_to :cohort
  has_many :attendances
  has_many :students, through: :attendances

  def friendly_start_time 
    start_time.strftime("%D %I:%M %p")
  end

  def friendly_end_time 
    end_time.strftime("%D %I:%M %p")
  end
end
