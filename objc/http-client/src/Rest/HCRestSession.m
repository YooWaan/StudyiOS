#import "HCRestSession.h"


@implementation HCRestSession

-(id) initWithConnectionAndUserAndPassword:(NSString*) hostName specifiedPort:(NSUInteger) portNumber webContextPath:(NSString*) context secureFlag:(BOOL) flag
				loginUsername:(NSString*) user loginPassword:(NSString*) pass
{
  if ((self = [super initWithConnection:hostName specifiedPort:portNumber webContextPath:context secureFlag:flag]) != nil) {
	username = [user copy];
	password = [pass copy];
  }
  return self;
}

-(id) copyWithZone:(NSZone*)zone {
  return [[[self class] allocWithZone:zone] initWithConnectionAndUserAndPassword:hostname
																   specifiedPort:portnumber
																  webContextPath:webcontextpath
																	  secureFlag:secureMode
																   loginUsername:username
																   loginPassword:password];
}

#ifdef ARC_OFF
-(void) dealloc {
  [username release];
  [password release];
  [super dealloc];
}
#endif

-(NSString*) username {
  return username;
}
-(NSString*) password {
  return password;
}


@end
