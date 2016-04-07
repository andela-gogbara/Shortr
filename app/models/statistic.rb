class Statistic < ActiveRecord::Base
  belongs_to :link

  def format_date
    created_at.strftime("%m/%d/%Y")
  end
end
