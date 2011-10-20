#import <Foundation/Foundation.h>

@interface URLDelegate : NSObject //<NSURLConnectionDelegate>
{
  NSMutableData* contents;
  BOOL finished;
}

-(NSData*) contents;
-(BOOL) finishDelegate;

@end

@implementation URLDelegate

-(id) init {
  if ((self = [super init]) != nil) {
    contents = [[[NSMutableData alloc] init] autorelease];
    finished = NO ;
  }
  return self;
}

-(void) dealloc {
  [contents release];
  [super dealloc];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
  [contents appendData:data];

  //NSString* str = [[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding] autorelease];
  //NSLog(@"--> %@", str);
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
  NSLog(@"finish");
  finished = YES;
}

-(NSData*) contents {
  return contents;
}

-(BOOL) finishDelegate {
  return finished;
}

@end

void send() {

  NSURLRequest *req;
  NSString* url = @"https://raw.github.com/k16shikano/xml2tex/master/sample/sample.xml";
  url = @"http://www11.atpages.jp/~shingoureds/index.php?cmd=rss&ver=1.0";

  req = [[[NSURLRequest alloc]
		  initWithURL:[NSURL URLWithString:url]]
	  autorelease];
  URLDelegate* delegate = [[[URLDelegate alloc] init] autorelease];

  NSURLConnection* connection = [NSURLConnection connectionWithRequest:req delegate:delegate] ;

  //[[NSRunLoop currentRunLoop] run];

  while (![delegate finishDelegate]) {
    [[NSRunLoop currentRunLoop] runMode: NSRunLoopCommonModes
				beforeDate: [NSDate distantFuture]];
  }
  NSString* str = [[[NSString alloc] initWithData:[delegate contents] encoding:NSUTF8StringEncoding] autorelease];
  NSLog(@"--> %@", str);


  //NSURLConnection* connection = [[[NSURLConnection alloc] initWithRequest:req delegate:delegate] autorelease];



}


int main(int argc, char ** argv) {

  id pool = [[NSAutoreleasePool alloc] init];

  send();

  [pool release];
  return 0;
}
