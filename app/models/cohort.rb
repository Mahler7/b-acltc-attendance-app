class Cohort < ActiveRecord::Base
  belongs_to :teacher
  has_many :students
  has_many :lectures

  validates :name, :start_date, :end_date, :timezone, presence: true

  def friendly_start_date
    start_date.strftime("%D")
  end

  def friendly_end_date
    end_date.strftime("%D")
  end
end
