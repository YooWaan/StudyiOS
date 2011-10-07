#import "Data.h"

@implementation Data

-(id) initWithIdAndName:(unsigned int)aId dataName:(NSString*) aName {
  self = [self init];
  if (self != nil) {
	dataId = aId;
	name = aName;
	date = [NSDate date];
  }
  return self;
}

-(unsigned int) getId {
  return dataId;
}

-(NSString*) getName {
  return name;
}

-(NSDate*) getDate {
  return date;
}

- (NSUInteger) hash {
  return [name hash];
}

- (void) dealloc {
  [name release];
  [super dealloc];
}

@end
