#import <Foundation/NSString.h>
#import <Foundation/NSDateFormatter.h>

#import "Data.h"

@implementation Data

-(id) initWithIdAndName:(NSUInteger)aId dataName:(NSString*) aName {
  self = [self init];
  if (self != nil) {
	dataId = aId;
	name = [aName retain];
	date = [NSDate date];
  }
  return self;
}

-(NSUInteger) getId {
  return dataId;
}

-(id) getName {
  return name;
}

-(NSDate*) getDate {
  return date;
}

-(NSString*)dataString {
  return [NSString stringWithFormat:@"%d:%@:%@",dataId,name,[date description]];
}

- (NSUInteger) hash {
  return [name hash];
}

- (void) dealloc {
  NSLog(@"Data -> dealoc\n");
  [name release];
  [date release];
  [super dealloc];
}

@end
