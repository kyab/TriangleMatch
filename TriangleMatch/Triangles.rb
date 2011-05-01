#
#  Triangles.rb
#  TriangleMatch
#
#  Created by koji on 11/05/01.
#  Copyright 2011 __MyCompanyName__. All rights reserved.
#


class ActualTriangle
	def initialize
		@base_shift = 8.0
	end
	
	def value(x)
		if (x < @base_shift)
			0.0
		elsif (x < @base_shift + 3.0)
			3.0*(x-@base_shift)
		elsif (x < @base_shift + 3.0 + 9.0)
			-1.0 * (x - (@base_shift + 3.0 + 9.0))
		else
			0
		end
	end
end

class UnitTriangle
	def initialize
	end
	
	def value(x)
		if (x < 0.0)
			0.0
		elsif (x < 1.0)
			3.0 * x
		elsif (x < 4.0)
			-1.0 * (x - 4.0)
		else
			0
		end
	end
	
	def valueFor(x, shiftX, scaleX, scaleY)
		1.0 * scaleY * value( (x - shiftX) / scaleX )
	end
end
