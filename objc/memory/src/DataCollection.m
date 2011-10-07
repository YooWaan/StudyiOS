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
  [array addObject: dat];
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

-(void) dealloc {
  [array release];
  [super dealloc];
}

@end
