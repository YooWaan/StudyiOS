#ifndef DATA_H
#define DATA_H

#import <Foundation/NSObject.h>
#import <Foundation/NSString.h>
#import <Foundation/NSDate.h>

@interface Data : NSObject
{
  unsigned int dataId;
  NSString* name;
  NSDate* date;
}

-(id) initWithIdAndName:(unsigned int)aId dataName:(NSString*) aName;

//@property(readonly, copy) int id;
//@property(getter=getName,setter=setName,retain) NSString* name;

-(unsigned int) getId;
-(NSString*) getName;
-(NSDate*) getDate;

@end

#endif
