#
#  MatchView.rb
#  TriangleMatch
#
#  Created by koji on 11/05/01.
#  Copyright 2011 __MyCompanyName__. All rights reserved.
#
require "Triangles"

class MatchView < NSView
	attr_accessor :targetline
	
	attr_accessor :shiftX, :scaleX, :scaleY
	def initWithFrame(frame)
		super
		@unit = UnitTriangle.new
		@shiftX = 0.0
		@scaleX = 1.0
		@scaleY = 1.0	
		self
	end
	def setShiftX(val)
		@shiftX = val
		self.setNeedsDisplay(true)
	end
	
	def setScaleX(val)
		@scaleX = val
		self.setNeedsDisplay(true)
	end
	
	def setScaleY(val)
		@scaleY = val
		self.setNeedsDisplay(true)
	end
	
	def drawRect(rect)
		NSColor.blackColor.set
		NSRectFill(self.bounds)
		
		return if @targetline.nil?
		
		#puts "ther are target line"
		
		path = NSBezierPath.bezierPath
		path.moveToPoint(NSMakePoint(0,0))
		(0.0).step(100.0, 0.1) do |x|
			y = @targetline.value(x)
			pointX = x * (self.bounds.size.width / 30.0)
			pointY = y * (self.bounds.size.height / 20.0)
			path.lineToPoint( NSMakePoint(pointX, pointY))
		end
		NSColor.yellowColor.set
		path.lineWidth = 2.0
		path.stroke
		
		#puts "draw the unit triangle"
		path = NSBezierPath.bezierPath
		path.moveToPoint(NSMakePoint(0,0))
		(0.0).step(100.0, 0.1) do |x|
			y = @unit.valueFor(x, @shiftX, @scaleX, @scaleY)
			pointX = x * (self.bounds.size.width / 30.0)
			pointY = y * (self.bounds.size.height / 20.0)
			path.lineToPoint( NSMakePoint(pointX, pointY))
		end
		NSColor.blueColor.set
		path.lineWidth = 2.0
		path.stroke		
	
	end
end
		
