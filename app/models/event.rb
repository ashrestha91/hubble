class Event < ActiveRecord::Base
  validates_presence_of :date, :start_time, :url
  validates :url, format: { with: /\A(http|https):\/\// }

  def image_url
    # TODO: replace this logic when link_thumbnailer is updated to v2.0
    # https://github.com/gottfrois/link_thumbnailer/issues/32
    img = preview.images.first
    if img.is_a? FastImage
      img.source_url
    else
      img[:source_url]
    end
  end

  def title
    preview.title
  end

  private

  def preview
    @preview ||= LinkThumbnailer.generate(url)
  end
end
