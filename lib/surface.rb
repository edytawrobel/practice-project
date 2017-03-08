class Surface

  attr_reader :width, :height

  def initialize(args)
    @width = args[:width].to_i
    @height = args[:height].to_i
  end
end
