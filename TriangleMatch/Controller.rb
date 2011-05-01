
class Controller
	attr_accessor :view
	
	attr_accessor :shiftX, :scaleX, :scaleY
	
	def setShiftX(val)
		@shiftX = val
		@view.setShiftX(val)
		calcConvolution(nil)
	end
	
	def setScaleX(val)
		@scaleX = val
		@view.setScaleX(val)
		calcConvolution(nil)
	end
	
	def setScaleY(val)
		@scaleY = val
		@view.setScaleY(val)
		calcConvolution(nil)
	end	
	
	def initialize
		@shiftX = 0.0
		@scaleX = 1.0
		@scaleY = 1.0	
	end
		
	def awakeFromNib
		puts "#{self.class} awaked from nib"
		@actual_triangle = ActualTriangle.new
		@unit_triangle = UnitTriangle.new
		
		@view.targetline = @actual_triangle
		
		@shiftX = 0.0
		@scaleX = 1.0
		@scaleY = 1.0		

	end

	
	LIMIT = 30
	STEP = 0.1	
	
	def calcConvolution(sender)
		puts "convolution = #{self.convolution}"
	end
	
	def doMatch(sender)
		
		puts "find best shiftX"
		shiftX_arr = (0.0).step(LIMIT, STEP).to_a
		convs = []
		shiftX_arr.each do |shiftX|
			convs << convolutionFor(shiftX, @scaleX, @scaleY)
		end
		
		max_value = 0
		max_index = 0
		for i in (0..(convs.size-1)) 
			if max_value < convs[i]
				max_value = convs[i]
				max_index = i
			end
		end
		
		puts "max = #{max_value}, shift = #{shiftX_arr[max_index]} , index = #{max_index}"
		
		self.setShiftX(shiftX_arr[max_index])
		
	end

	def convolution()
		convolutionFor(@shiftX, @scaleX, @scaleY)
	end
	
	def convolutionFor(shiftX, scaleX, scaleY)
		sum = 0
		(0.0).step(LIMIT, STEP) do |x|
			sum += @actual_triangle.value(x) * @unit_triangle.valueFor(x, shiftX, scaleX, scaleY)
		end
		sum
	end
end



class MatchResult
	def resultFor(translateX, scaleX, scaleY)
	end
end
























