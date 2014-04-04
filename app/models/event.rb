class Event < ActiveRecord::Base
  validates_presence_of :date, :start_time, :url
  validates :url, format: { with: /\A(http|https)\/\// }

end
