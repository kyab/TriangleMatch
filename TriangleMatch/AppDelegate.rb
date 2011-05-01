#
#  AppDelegate.rb
#  TriangleMatch
#
#  Created by koji on 11/05/01.
#  Copyright 2011 __MyCompanyName__. All rights reserved.
#

class AppDelegate
	attr_accessor :window
	def applicationDidFinishLaunching(a_notification)
		# Insert code here to initialize your application
	end
	
	def applicationShouldTerminateAfterLastWindowClosed(sender)
		puts "last window closed"
		return true
	end
end

