#import <Foundation/Foundation.h>

@interface URLDelegate : NSObject <NSURLConnectionDelegate>
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
    //contents = [[[NSMutableData alloc] init] autorelease];
    contents = [[NSMutableData alloc] init];
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

  NSString* url = @"http://192.168.5.160/data/list.xml";

  NSURLRequest * req = [[[NSURLRequest alloc] initWithURL:[NSURL URLWithString:url]] autorelease];
  URLDelegate* delegate = [[[URLDelegate alloc] init] autorelease];

  //NSURLConnection* connection = [NSURLConnection connectionWithRequest:req delegate:delegate] ;
  [NSURLConnection connectionWithRequest:req delegate:delegate] ;

  //[[NSRunLoop currentRunLoop] run];

  NSRunLoop* loop = [NSRunLoop currentRunLoop];
  while ([delegate finishDelegate] == NO && [loop runMode:NSDefaultRunLoopMode beforeDate:[[NSDate distantFuture] autorelease]]);

  NSString* str = [[[NSString alloc] initWithData:[delegate contents] encoding:NSUTF8StringEncoding] autorelease];
  NSLog(@"--> %@", str);

  NSLog(@"endSend");
}


int main(int argc, char ** argv) {

  NSAutoreleasePool* pool = [[NSAutoreleasePool alloc] init];

  send();

  NSLog(@"release");
  [pool release];
  NSLog(@"exit");
  return 0;
}
