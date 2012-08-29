//
//  RSObject.m
//  NestedBoxen
//
//  Created by Erik Stainsby on 2012-08-25.
//  Copyright (c) 2012 Erik Stainsby. All rights reserved.
//

#import "RSPerson.h"

@implementation RSPerson

@synthesize firstName;
@synthesize lastName;
@synthesize phoneNumbers;
@synthesize emailAddresses;

- (id)init
{
  self = [super init];
  if (self) {
      NSLog(@" [%04d] %s %@",__LINE__,__PRETTY_FUNCTION__, @"");
    firstName = @"Egor";
    lastName = @"Eyesore";
    phoneNumbers = [NSArray arrayWithObjects:@"604.345.5432",@"604 367 5717", nil];
    emailAddresses = [NSArray arrayWithObject:@"egor@eyesore.com"];
  }
  return self;
}

@end
