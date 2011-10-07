
#import "BasicMethod.h"

#import <Foundation/NSAutoreleasePool.h>

int main(int argc, char ** argv) {

  id pool = [[NSAutoreleasePool alloc] init];

  id mtd = [BasicMethod alloc];
  [mtd execute];

  [pool release];
  return 0;
}
