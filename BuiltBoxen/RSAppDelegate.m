//
//  RSAppDelegate.m
//  BuiltBoxen
//
//  Created by Erik Stainsby on 2012-08-26.
//  Copyright (c) 2012 Erik Stainsby. All rights reserved.
//

#import "RSAppDelegate.h"
#import "RSWindowController.h"

@implementation RSAppDelegate

@synthesize windowController;
- (void) awakeFromNib {
    windowController = [[RSWindowController alloc] init];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
}

- (BOOL) applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)sender {
    return YES;
}


@end
