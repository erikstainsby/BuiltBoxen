//
//  RSObject.h
//  NestedBoxen
//
//  Created by Erik Stainsby on 2012-08-25.
//  Copyright (c) 2012 Erik Stainsby. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RSPerson : NSObject

@property (strong) IBOutlet NSString * firstName;
@property (strong) IBOutlet NSString * lastName;
@property (strong) IBOutlet NSArray * phoneNumbers;
@property (strong) IBOutlet NSArray * emailAddresses;

@end
