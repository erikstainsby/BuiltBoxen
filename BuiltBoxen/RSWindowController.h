//
//  RSWindowController.h
//  BuiltBoxen
//
//  Created by Erik Stainsby on 2012-08-26.
//  Copyright (c) 2012 Erik Stainsby. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface RSWindowController : NSWindowController < NSTableViewDelegate, NSTableViewDataSource >

@property (strong) IBOutlet NSTableView * _tableView;
@property (strong) IBOutlet NSMutableArray * m_tableContent;

- (NSInteger) numberOfRowsInTableView:(NSTableView *)tableView;
- (id)tableView:(NSTableView *)tableView objectValueForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row;

@end
