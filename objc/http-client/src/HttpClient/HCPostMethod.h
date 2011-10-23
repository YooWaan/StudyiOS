#ifndef HCPOSTMETHOD_H
#define HCPOSTMETHOD_H

#import "HCBasicMethod.h"

@interface HCPostMethod : HCBasicMethod
{
  NSData* bodyData;
  NSInputStream* bodyStream;
}

-(void) setBody:(NSData*) data;
-(void) setBodyStream:(NSInputStream*) stream;

@end


#endif
