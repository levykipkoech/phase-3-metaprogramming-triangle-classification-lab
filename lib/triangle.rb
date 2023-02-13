# class Triangle
#    def initialize(x, y, z)
#      @x = x
#      @y = y
#      @z = z
#    end
#    def kind
#       if @x == @y && @x == @z
#         :equilateral

#       elsif @x == @y || @x == @z || @y == @z
#         :isosceles

#       elsif @y != @z && @y != @x
#         :scalene

#       end
#    end
#     class TriangleError < StandardError 
#       def initialize(x, y, z)
#         if x <= 0 || y <= 0 || z <= 0
#           raise ArgumentError, "Sides of a triangle must have positive length"
#         elsif x + y <= z || x + z <= y || y + z <= x
#           raise ArgumentError, "Triangle inequality violated"
#         end
#       end
#     end
# end

class Triangle
  attr_reader :side1, :side2, :side3

  def initialize(side1, side2, side3)
    @side1 = side1
    @side2 = side2
    @side3 = side3
  end

  def kind
    raise TriangleError, "Invalid triangle" if invalid_triangle?
     return :equilateral if side1 == side2 && side2 == side3
     return :isosceles if side1 == side2 || side1 == side3 || side2 == side3
    :scalene
  end

  private

  def invalid_triangle?
    sides = [side1, side2, side3]
    sides.any? { |side| side <= 0 } || sides.sort[0] + sides.sort[1] <= sides.sort[2]
  end

  class TriangleError < StandardError; end
end

