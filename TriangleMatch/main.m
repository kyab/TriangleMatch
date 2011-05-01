//
//  main.m
//  TriangleMatch
//
//  Created by koji on 11/05/01.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

#import <MacRuby/MacRuby.h>

int main(int argc, char *argv[])
{
	return macruby_main("rb_main.rb", argc, argv);
}
