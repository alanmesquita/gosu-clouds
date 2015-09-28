class Sight

  def initialize(window)
    @window = window
    @cursor = Gosu::Image::load_tiles("./media/sight-sprite.png", 40, 40, :tileable => false)
    @fire = Gosu::Sample.new("./media/laser.wav")

    @current_image = @cursor[0]
  end

  def update
  end

  def down(id)
    if id == Gosu::MsLeft
      @current_image = @cursor[1]
    end
  end

  def up(id)
    if id == Gosu::MsLeft
      @current_image = @cursor[0]
      @fire.play(0.5)
    end
  end

  def draw
    @current_image.draw(@window.mouse_x, @window.mouse_y, 0, 0.5, 0.5)
  end
end
