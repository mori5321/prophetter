class ImageTextMixer
  require "mini_magick"

  BASE_IMAGE_PATH = Rails.root.join("app", "assets", "images", "twitter_post_v2.png")
  # BASE_IMAGE_PATH = "#{RAILS_ROOT}/app/assets/images/twitter_post.png"
  GRAVITY = 'west'
  TEXT_POSITION = '40,0'
  FONT = Rails.root.join("app", "assets", "fonts", "NotoSansJP-Black.otf")
  # FONT = "#{RAILS_ROOT}/app/assets/font/NotoSansJP-Black.otf"
  FONT_SIZE = 60
  INDENTATION_COUNT = 15

  def self.build(text, date)
    text = prepare_text(text, date)
    image = MiniMagick::Image.open(BASE_IMAGE_PATH)
    image.combine_options do |config|
      config.font FONT
      config.fill 'gray'
      config.gravity GRAVITY
      config.pointsize FONT_SIZE
      config.draw "text #{TEXT_POSITION} '#{text}'"
    end
  end

  private
    def self.prepare_text(text ,date)
      date + "\n" + text.scan(/.{1,#{INDENTATION_COUNT}}/).join("\n")

    end
end
