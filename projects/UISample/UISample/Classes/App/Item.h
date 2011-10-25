//
//  Item.h
//  UISample
//
//  Created by developer on 11/10/24.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Item : NSObject
@property(nonatomic,retain) NSString* name;
@property(nonatomic,retain) NSString* viewClass;
@property(nonatomic,retain) NSString* nib;
-(id)initWithItem:(NSString*) itemName withViewClass:(NSString*)viewClassName withNibName:(NSString*) nibName;
@end
