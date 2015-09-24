Bundler.require :default

require './lib/objects/cloud.rb'
require './lib/objects/sight.rb'

class GameWindow < Gosu::Window
  def initialize
    super 600, 300
    self.caption = "Teste"

    @background_image = Gosu::Image.new("./media/sky.jpg", :tileable => false)
    @cursor = Gosu::Image::load_tiles(self, "./media/sight-sprite.png", 40, 40, false)

    @theme = Gosu::Sample.new("./media/theme.wav")
    @theme.play(1,1, true)
    @cloud = Cloud.new
    @sight = Sight.new(self)
  end

  def update
    @cloud.update
    @sight.update
  end

  #def needs_cursor?
  #  true
  #end

  def button_down(id)
    @sight.down(id)
  end

  def button_up(id)
    @sight.up(id)
  end

  def draw

    @background_image.draw(0, 0, 0)
    @cloud.draw
    @sight.draw
  end
end
