#import "HCPutMethod.h"


@implementation HCPutMethod

-(NSString*) name {
  return HC_HTTP_METHOD_PUT;
}

-(BOOL) useBody {
  return NO;
}

@end
