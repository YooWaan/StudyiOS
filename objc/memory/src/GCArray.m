#import "GCArray.h"
#import "Data.h"

@implementation GCArray

-(id)createData:(NSUInteger)dataId dataName:(NSString*) aName {
  return [[[Data alloc] initWithIdAndName:dataId dataName:aName] autorelease];
}

@end
