class Event < ActiveRecord::Base
  validates_presence_of :date, :start_time, :url
  validates :url, format: { with: /\A(http|https):\/\// }

  scope :chronologically, -> { order(:date, :start_time) }

  def pull_data_from_web!
    preview = LinkThumbnailer.generate(url)
    self.image_url = get_image_url(preview)
    self.title ||= preview.title
  end

  private

  def get_image_url(preview)
    # TODO: replace this logic when link_thumbnailer is updated to v2.0
    # https://github.com/gottfrois/link_thumbnailer/issues/32
    img = preview.images.first
    if img.is_a? FastImage
      img.source_url
    else
      img[:source_url]
    end
  end
end
