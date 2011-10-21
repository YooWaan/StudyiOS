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
  return [[[self class] allocWithZone:zone] initWithConnectionAndUserAndPassword:host specifiedPort:port webContextPath:contextpath secureFlag:secure
																				loginUsername:username loginPassword:password];
}

-(void) dealloc {
  [username release];
  [password release];
  [super dealloc];
}

-(NSString*) username {
  return username;
}
-(NSString*) password {
  return password;
}


@end
