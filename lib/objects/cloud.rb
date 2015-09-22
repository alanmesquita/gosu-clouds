class Cloud

  def initialize()
    @cloud_numbers = 30
    @max_height    = 300
     @images        = [
       Gosu::Image.new("./media/p-cloud.png", :tileable => false),
       Gosu::Image.new("./media/p-cloud2.png", :tileable => false),
       Gosu::Image.new("./media/p-cloud3.png", :tileable => false),
       Gosu::Image.new("./media/p-cloud4.png", :tileable => false),
       Gosu::Image.new("./media/p-cloud5.png", :tileable => false),
       Gosu::Image.new("./media/p-cloud6.png", :tileable => false),
       Gosu::Image.new("./media/p-cloud7.png", :tileable => false),
       Gosu::Image.new("./media/p-cloud8.png", :tileable => false),
       Gosu::Image.new("./media/p-cloud9.png", :tileable => false),
       Gosu::Image.new("./media/p-cloud10.png", :tileable => false),
       Gosu::Image.new("./media/p-cloud11.png", :tileable => false),
       Gosu::Image.new("./media/p-cloud12.png", :tileable => false)
     ]
    @clouds = initial_clouds

  end

  def update
    @clouds.each do |item|
      # reset cloud position when it exceeds window with
      item[:x] = -300 if item[:x] >= 700

      # increment x-axis to make cloud movement based on it speed
      item[:x] += item[:speed]
    end
  end

  def draw
    @clouds.each do |item|
      # Draws the image rotated, with its rotational center at (x, y).
      item[:image].draw_rot(
        item[:x],
        item[:y],
        0,
        0,
        0.5,
        0.5,
        item[:size],
        item[:size],
        Gosu::Color.new(0xff_ffffff)
      )
    end
  end

  private

  # generate the clouds when the window is oppened
  def initial_clouds
    Array.new(@cloud_numbers) { generate_cloud }
  end

  # generate one cloud with randon configuration
  def generate_cloud
    {
      image: @images.sample,
      x:     rand(-100..600),
      y:     rand(-25..@max_height),
      speed: rand(0.1..0.3),
      size:  rand(0.1..1)
    }
  end
end
