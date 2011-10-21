#import "HCPostMethod.h"


@implementation HCPostMethod

-(NSString*) name {
  return HC_HTTP_METHOD_PUT;
}

-(BOOL) useBody {
  return NO;
}

@end
