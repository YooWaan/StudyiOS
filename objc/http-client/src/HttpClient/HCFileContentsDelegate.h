#ifndef HCFILECONTENTSDELEGATE_H
#define HCFILECONTENTSDELEGATE_H

#import <Foundation/Foundation.h>

#import "HCBasicMethodDelegate.h"

@interface HCFileContentsDelegate : HCBasicMethodDelegate
{
 @protected
  NSString* filePath;
  NSFileHandle* fileHandle;
}

-(id) initWithFilepath:(NSString*) path;

-(NSString*) filepath;

-(NSInputStream*) inputstream;

-(NSData*) load;

@end

#endif
