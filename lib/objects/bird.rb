class Bird

  def initialize(window)
    @window = window

    @bird_numbers = 20

    @image = Gosu::Image::load_tiles("./media/white-bird.png", 27, 28, :tileable => false)
    @image_explosion = Gosu::Image::load_tiles("./media/explosion.png", 100, 100, :tileable => false)
    @explosion = Gosu::Sample.new("./media/explosion.wav")
    @miss = Gosu::Sample.new("./media/errou.wav")

    @current_image = @image[0]
    @current_tile = 0
    @animate_speed = 20
    @request = 0

    @birds = initial_birds
  end

  def update
    @birds.each do |item|
      if item[:state] == 1
        # reset cloud position when it exceeds window with
        item[:x] = -300 if item[:x] >= 700

        # increment x-axis to make cloud movement based on it speed
        item[:x] += item[:speed]

        if @request % @animate_speed == 0
          item[:frame] = 0 if @image[item[:frame]].nil?

          item[:image] = @image[item[:frame]]
          item[:frame] += 1
        end
      end

      if item[:state] == 0
        if !@image_explosion[item[:frame]].nil?
          item[:image] = @image_explosion[item[:frame]]
          item[:frame] += 1
        end
      end
    end

    @request += 1
  end

  def up(id)
    hit = 0
    if id == Gosu::MsLeft
       @birds.each do |item|
        if item[:state] == 1
          if (item[:x]..item[:x]+27) === @window.mouse_x && (item[:y]..item[:y]+28) === @window.mouse_y
            item[:state] = 0
            item[:frame] = 1
            item[:image] = @image_explosion[0]
            hit = 1
          end
        end
      end
      #@image = Gosu::Image::load_tiles("./media/explosion.png", 100, 100, :tileable => false)
      #@current_tile = 0
      #@animate_speed = 1
      #@explosion.play
      @miss.play if hit == 0

    end
  end

  def draw
    @birds.each do |item|
      item[:image].draw(item[:x], item[:y], 0)  if item[:state] == 1

      item[:image].draw(item[:x]-35, item[:y]-40, 0)  if item[:state] == 0
    end
  end

  private

  def reset_tile
    @current_tile = 0 if @current_tile > @image.size-1
  end

  def initial_birds
    Array.new(@bird_numbers) { generate_bird }
  end

  def generate_bird
    x = rand(-100..600)
    y = rand(0..300)

    {
      frame: 0,
      image: @image,
      x:     x,
      y:     y,
      speed: rand(0.1..0.9),
      state: 1, # 1 == 'lived' 0 == 'dead'
      width: x+27,
      height: y+28
    }
  end
end
