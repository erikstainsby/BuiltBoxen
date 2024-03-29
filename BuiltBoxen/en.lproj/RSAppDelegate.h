//
//  RSAppDelegate.h
//  BuiltBoxen
//
//  Created by Erik Stainsby on 2012-08-26.
//  Copyright (c) 2012 Erik Stainsby. All rights reserved.
//

#import <Cocoa/Cocoa.h>
@class RSWindowController;

@interface RSAppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;
@property (strong) IBOutlet RSWindowController * windowController;

@end
