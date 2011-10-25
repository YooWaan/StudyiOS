//
//  Note.h
//  DataStorage
//
//  Created by developer on 11/10/25.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Note : NSManagedObject

@property (nonatomic, retain) NSString * message;
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSDate * date;

@end
