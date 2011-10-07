#include <unistd.h>
#include <string.h>
#include <stdio.h>

#import <Foundation/NSAutoreleasePool.h>
#import <Foundation/NSString.h>

#import "DataCollection.h"
#import "GCArray.h"

@interface DataTool : NSObject
{

}

- (id) createDataArray:(BOOL) useGCArray;
- (void) addData:(id) dataArray;

@end

@implementation DataTool

- (id) createDataArray:(BOOL) useGCArray {
  NSMutableArray* data = [[NSMutableArray alloc] init];
  id darray;
  if (useGCArray) {
	darray = [[GCArray alloc] initWithArray:data];
  } else {
	darray = [[DataArray alloc] initWithArray:data];
  }
  return darray;
}

- (void) addData:(id) dataArray {
  FILE* file;
  unsigned int size = 1024;
  char buff[size];
  if ((file = fopen("data/dat.csv","r")) == NULL) {
	return;
  }
  while (fgets(buff, size-1, file) != NULL) {
	buff[ strlen(buff) -1] = '\0';
	[dataArray addData:[NSString stringWithUTF8String: buff]];
  }
  fclose(file);
}

@end

int main(int argc, char* argv[]) {
  BOOL useGCArray = NO;
  int i;
  for (i = 0; i < argc; i++) {
	if (strcmp("-gc", argv[i]) == 0) {
	  useGCArray = YES;
	}
  }
  id pool = [[NSAutoreleasePool alloc] init];
  id tool = [[[DataTool alloc] init] autorelease];
  id data = [tool createDataArray: useGCArray];

  for (i = 0; i < 500 ; i++) {
	[tool addData:data];
	usleep(10);
	[data clear];
	usleep(10);
  }

  [pool release];
  return 0;
}
