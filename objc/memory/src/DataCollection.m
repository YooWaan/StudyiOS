#import <Foundation/NSArray.h>

#import "DataCollection.h"
#import "Data.h"

@implementation DataArray

-(id)initWithArray:(NSMutableArray*) data {
  self = [self init];
  if (self != nil) {
	array = data;
  }
  return self;
}

-(id)createData:(NSUInteger)dataId dataName:(NSString*) aName {
  return [[Data alloc] initWithIdAndName:dataId dataName:aName];
}

-(void) addData:(NSString*)aName {
  id dat = [self createData:[array count] dataName: aName];
  //id dat = [[Data alloc] initWithIdAndName:[array count] dataName:aName];
  [array addObject: dat];
  //[dat autorelease];
}

-(void) removeDataAt:(NSUInteger)index {
  [array removeObjectAtIndex:index];
}

-(void) clear {
  [array removeAllObjects];
}

-(NSInteger) count {
  return [array count];
}

-(NSString*) dataString {
  NSMutableString * str = [[NSMutableString alloc] init];
  int count = [array count];
  int i;
  for (i = 0; i < count; i++) {
	id obj = [array objectAtIndex: i];
	[str appendString:[obj dataString]];
	[str appendString:@"\n"];
  }
  return str;
}

-(void) dealloc {
  [array release];
  [super dealloc];
}

@end
