#ifndef DATA_H
#define DATA_H

#import <Foundation/NSObject.h>
#import <Foundation/NSString.h>
#import <Foundation/NSDate.h>

@interface Data : NSObject
{
  NSUInteger dataId;
  id name;
  NSDate* date;
}

-(id) initWithIdAndName:(NSUInteger)aId dataName:(NSString*) aName;

//@property(readonly, copy) int id;
//@property(getter=getName,setter=setName,retain) NSString* name;

-(NSUInteger) getId;
-(id) getName;
-(NSDate*) getDate;

-(NSString*) dataString;

@end

#endif
