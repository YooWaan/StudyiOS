#ifndef HCRESTSESSION_H
#define HCRESTSESSION_H

#import "HCSession.h"


@interface HCRestSession : HCSession
{
 @protected
  NSString* username;
  NSString* password;
}

-(id) initWithConnectionAndUserAndPassword:(NSString*) hostName specifiedPort:(NSUInteger) portNumber webContextPath:(NSString*) context secureFlag:(BOOL) flag
				loginUsername:(NSString*) user loginPassword:(NSString*) pass;

-(NSString*) username;
-(NSString*) password;

@end

#endif
