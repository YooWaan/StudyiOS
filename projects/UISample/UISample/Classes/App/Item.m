//
//  Item.m
//  UISample
//
//  Created by developer on 11/10/24.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "Item.h"

@implementation Item

@synthesize name;
@synthesize viewClass;
@synthesize nib;

-(id)initWithItem:(NSString *)itemName withViewClass:(NSString *)viewClassName withNibName:(NSString *)nibName {
    if ((self = [super init]) != nil) {
        self.name = itemName;
        self.viewClass = viewClassName;
        self.nib = nibName;
    }
    return self;
}

@end
