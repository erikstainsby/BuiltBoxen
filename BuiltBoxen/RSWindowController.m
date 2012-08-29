//
//  RSWindowController.m
//  BuiltBoxen
//
//  Created by Erik Stainsby on 2012-08-26.
//  Copyright (c) 2012 Erik Stainsby. All rights reserved.
//

#import "RSWindowController.h"
#import "RSTableRowView.h"
#import "RSPerson.h"
#import "NSView+RSPositionView.h"

@interface RSWindowController ()

@end

@implementation RSWindowController

@synthesize _tableView;
@synthesize m_tableContent;

- (id)init
{
    self = [super initWithWindowNibName:@"RSMainWindow" owner:self];
    if (self) {
        
        m_tableContent = [NSMutableArray array];
        [[self window] makeKeyAndOrderFront:self];
    }
    return self;
}

- (void)windowDidLoad
{
    [super windowDidLoad];
    
    RSPerson * egor = [RSPerson new];
    [m_tableContent addObject: egor];
    
    RSPerson * ogre = [RSPerson new];
    ogre.firstName = @"Ogre";
    ogre.lastName = @"Muppet";
    ogre.phoneNumbers = [NSArray arrayWithObjects:@"123 456 7890",@"+01 604 367 5717", @"603 331 4083", @"604 331 3603", nil];
    
    [m_tableContent addObject:ogre];
    
    [_tableView reloadData];
}

- (NSInteger) numberOfRowsInTableView:(NSTableView *)tableView {
    return m_tableContent.count;
}

- (id)tableView:(NSTableView *)tableView objectValueForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
    
    NSLog(@" [%04d] %s column: %@, row: %lu",__LINE__,__PRETTY_FUNCTION__, [tableColumn identifier], row);
    
    RSPerson * person = [m_tableContent objectAtIndex:row];
    
    if( [[tableColumn identifier] isEqualToString:@"firstName"]){
        return person.firstName;
    }
    else if([[tableColumn identifier] isEqualToString:@"lastName"]) {
        return person.lastName;
    }
    else if([[tableColumn identifier] isEqualToString:@"phoneNumbers"]) {
        return person.phoneNumbers;
    }
    else if([[tableColumn identifier] isEqualToString:@"emailAddresses"]) {
        return person.emailAddresses;
    }
    return nil;
}


- (NSTableRowView*) tableView:(NSTableView *)tableView rowViewForRow:(NSInteger)row {
    NSLog(@" [%04d] %s row number: %lu",__LINE__,__PRETTY_FUNCTION__, row);
    RSTableRowView * rowView = [[RSTableRowView alloc] init];
    [rowView setObjectValue:[m_tableContent objectAtIndex:row]];
    return rowView;
}

- (NSView*) tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
    
    NSLog(@" [%04d] %s row number: %lu",__LINE__,__PRETTY_FUNCTION__, row);
    
    RSPerson * person = [m_tableContent objectAtIndex:row];
    
    NSTableCellView * cellview = [NSTableCellView new];
    
    if( [[tableColumn identifier] isEqualToString:@"firstName"]){
        cellview = [tableView makeViewWithIdentifier:@"firstNameCellView" owner:self];
        cellview.textField.stringValue = person.firstName;
    }
    else if([[tableColumn identifier] isEqualToString:@"lastName"]) {
        cellview = [tableView makeViewWithIdentifier:@"lastNameCellView" owner:self];
        cellview.textField.stringValue = person.lastName;
    }
    else if([[tableColumn identifier] isEqualToString:@"phoneNumbers"]) {
        
        cellview = [tableView makeViewWithIdentifier:@"phoneNumbersCellView" owner:self];
        [cellview setFrameSize:NSMakeSize(130,60)];
        
        NSView * documentView = [[NSView alloc] initWithFrame:[cellview frame]];


        NSScrollView * scrollView = [[NSScrollView alloc] initWithFrame:[cellview frame]];
        [scrollView setHasVerticalScroller:YES];
        [scrollView setHorizontalScroller:NO];
        [scrollView setAutohidesScrollers:YES];
        [scrollView setBorderType:NSNoBorder];
        [scrollView setDrawsBackground:NO];
        [scrollView setDocumentView:documentView];
        
        
        [documentView setFrameSize:NSMakeSize([cellview bounds].size.width,(3>person.phoneNumbers.count)?3*20:person.phoneNumbers.count*20.0)];
        [documentView setBounds:[documentView frame]];
        
        CGFloat documentHeight = 0.0;
        NSPoint prevOrigin = NSMakePoint(0.0, [documentView frame].size.height);
        
        for(NSString * num in person.phoneNumbers)
        {
            NSTextField * tf = [NSTextField new];
            tf.stringValue = num;
            [tf sizeToFit];
            [tf setBordered:NO];
            [tf setDrawsBackground:NO];
            documentHeight += 20.0;
            
            [tf setFrameTopLeftPoint:prevOrigin];
            prevOrigin = [tf frame].origin;
            [documentView addSubview:tf];
        }
               
        [scrollView setFrameTopLeftPoint:NSMakePoint(0.0,[cellview frame].size.height)];
        
        [cellview addSubview:scrollView];
    }
    else if([[tableColumn identifier] isEqualToString:@"emailAddresses"]) {
        cellview = [tableView makeViewWithIdentifier:@"emailAddressesCellView" owner:self];
        CGFloat cellHeight = 0.0;
        for(NSString * num in person.emailAddresses)
        {
            NSTextField * tf = [NSTextField new];
            tf.stringValue = num;
            [tf sizeToFit];
            
            [tf setBordered:NO];
            [tf setDrawsBackground:NO];
            cellHeight += 20.0;
            [tf setFrameTopLeftPoint:NSMakePoint(0.0, cellHeight-2)];
            [cellview addSubview:tf];
        }
        NSSize newsize = NSMakeSize(cellview.frame.size.width, cellHeight);
        [cellview setFrameSize:newsize];
    }
        
    return cellview;
}


@end
