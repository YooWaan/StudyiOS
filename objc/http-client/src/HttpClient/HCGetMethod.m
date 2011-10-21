#import "HCGetMethod.h"


@implementation HCGetMethod

-(NSString*) name {
  return HC_HTTP_METHOD_GET;
}

-(BOOL) useBody {
  return NO;
}

@end
