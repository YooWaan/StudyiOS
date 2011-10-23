#ifndef HCAUTHENTICATION_H
#define HCAUTHENTICATION_H

typedef enum hcAuthenticationState {
  kHCSuccessAuthentication = 1,
  kHCFailedAuthentication  = 2,
  kHCAlreadyLogin          = 3,
  kHCAlreadyLogout         = 4
} HCAuthenticationState;


@protocol HCAuthentication

-(HCAuthenticationState) login;

-(HCAuthenticationState) logout;

@end

#endif
