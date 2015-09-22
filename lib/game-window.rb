Bundler.require :default

require './lib/objects/cloud.rb'

class GameWindow < Gosu::Window
  def initialize
    super 600, 300
    self.caption = "Teste"

    @background_image = Gosu::Image.new("./media/sky.jpg", :tileable => false)

    @cloud = Cloud.new
  end

  def update
    @cloud.update
  end

  def draw
    @background_image.draw(0, 0, 0)
    @cloud.draw
  end
end
