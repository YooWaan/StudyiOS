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

//- (id) createDataArray:(BOOL) useGCArray;
//- (void) addData:(DataArray*) dataArray;

@end

@implementation DataTool
/*
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
(void) addData:(id) dataArray {
  FILE* file;
  unsigned int size = 1024;
  char buff[size];
  if ((file = fopen("data/dat.csv","r")) == NULL) {
	return;
  }
  while (fgets(buff, size-1, file) != NULL) {
	buff[ strlen(buff) -1] = '\0';
	//NSLog(@"%@\n", [NSString stringWithUTF8String: buff]);
	[dataArray addData:[NSString stringWithUTF8String: buff]];
  }
  fclose(file);
}
*/

@end

void addData(id dataArray) {
  FILE* file;
  unsigned int size = 1024;
  char buff[size];
  if ((file = fopen("data/dat.csv","r")) == NULL) {
	return;
  }
  while (fgets(buff, size-1, file) != NULL) {
	buff[ strlen(buff) -1] = '\0';
	id string = [NSString stringWithUTF8String: buff];
	[dataArray addData:string];
	[string release];
  }
  fclose(file);
}


id createDataArray(BOOL useGCArray) {
  NSMutableArray* data = [[NSMutableArray alloc] init];
  id darray;
  if (useGCArray) {
	darray = [[GCArray alloc] initWithArray:data];
  } else {
	darray = [[DataArray alloc] initWithArray:data];
  }
  return darray;
}

int main(int argc, char* argv[]) {
  BOOL useGCArray = NO;
  int i;
  for (i = 0; i < argc; i++) {
	if (strcmp("-gc", argv[i]) == 0) {
	  useGCArray = YES;
	}
  }

  id data = createDataArray(useGCArray);

  for (i = 0; i < 200 ; i++) {
	id pool = [[NSAutoreleasePool alloc] init];
	addData(data);
	//usleep(10);
	//NSLog(@"-- ADD --%@\n", [data dataString]);
	[data clear];
	//NSLog(@"-- CLEAR --%d\n", [data count]);
	//usleep(10);
	[pool release];
  }

  [data release];

  return 0;
}
