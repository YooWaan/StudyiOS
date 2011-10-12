#import "GCArray.h"
#import "Data.h"

@implementation GCArray

-(id)initWithArray:(NSMutableArray*) data {
  return [super initWithArray: data];
}

-(id)createData:(NSUInteger)dataId dataName:(NSString*) aName {
  return [[[Data alloc] initWithIdAndName:dataId dataName:aName] autorelease];
}

-(void) addData:(NSString*)aName {
  [super addData:aName];
}

-(void) clear {
  [super clear];
}

-(NSString*)dataString {
  return [super dataString];
}

-(NSInteger) count {
  return [super count];
}


@end
