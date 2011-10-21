#import "HCDeleteMethod.h"


@implementation HCDeleteMethod

-(NSString*) name {
  return HC_HTTP_METHOD_DELETE;
}

-(BOOL) useBody {
  return NO;
}

@end
