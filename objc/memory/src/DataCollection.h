#ifndef DATACOLLECTION_H
#define DATACOLLECTION_H

#import <Foundation/NSObject.h>
#import <Foundation/NSArray.h>
#import <Foundation/NSString.h>

@protocol DataCollection

-(void) addData:(NSString*)aName;
-(void) removeDataAt: (NSUInteger)index;
-(void) clear;
-(NSString*)dataString;
-(NSInteger) count;

@end

@interface DataArray : NSObject <DataCollection>
{
  NSMutableArray* array;
}

-(id)initWithArray:(NSMutableArray*) data;
-(id)createData:(NSUInteger)dataId dataName:(NSString*) aName;

@end

#endif
