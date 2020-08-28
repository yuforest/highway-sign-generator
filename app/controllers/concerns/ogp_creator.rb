class OgpCreator
  require 'mini_magick'
  BASE_IMAGE_PATH = './app/assets/images/ogp-background.jpg'
  GRAVITY = 'center'
  TEXT_POSITION = '0,-100'
  ENGLISH_TEXT_POSITION = '0,20'
  FONT = './app/assets/fonts/bold.otf'
  FONT_SIZE = 95
  INDENTION_COUNT = 11
  ROW_LIMIT = 5

  def self.build(text, english_text)
    text = prepare_text(text)
    english_text = prepare_text(english_text)
    image = MiniMagick::Image.open(BASE_IMAGE_PATH)
    image.combine_options do |config|
      config.font FONT
      config.fill 'white'
      config.gravity GRAVITY
      config.pointsize FONT_SIZE
      config.draw "text #{TEXT_POSITION} '#{text}'"
    end
    image.combine_options do |config|
      config.font FONT
      config.fill 'white'
      config.gravity GRAVITY
      config.pointsize FONT_SIZE
      config.draw "text #{ENGLISH_TEXT_POSITION} '#{english_text}'"
    end
  end

  private
  def self.prepare_text(text)
    text.to_s.scan(/.{1,#{INDENTION_COUNT}}/)[0...ROW_LIMIT].join("\n")
  end
end