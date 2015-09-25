Bundler.require :default

require './lib/objects/cloud.rb'
require './lib/objects/sight.rb'
require './lib/objects/bird.rb'

class GameWindow < Gosu::Window
  def initialize
    super 600, 300
    self.caption = "Teste"

    @background_image = Gosu::Image.new("./media/sky.jpg", :tileable => false)
    @cursor = Gosu::Image::load_tiles(self, "./media/sight-sprite.png", 40, 40, false)

    play_theme
    @cloud = Cloud.new
    @sight = Sight.new(self)
    @bird = Bird.new(self)
  end

  def update
    @cloud.update
    @sight.update
    @bird.update
  end

  #def needs_cursor?
  #  true
  #end

  def button_down(id)
    @sight.down(id)
  end

  def button_up(id)
    @sight.up(id)
    @bird.up(id)
  end

  def draw
    @background_image.draw(0, 0, 0)
    @cloud.draw
    @bird.draw
    @sight.draw
  end

  private

  def play_theme
    @theme = Gosu::Sample.new("./media/theme.wav")
    @theme.play(0.5,1, true)
  end
end
