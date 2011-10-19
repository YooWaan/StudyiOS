#ifndef HCFILECONTENTSDELEGATE_H
#define HCFILECONTENTSDELEGATE_H

#import <Foundation/Foundation.h>

#import "HCBasicContentsDelegate.h"

@interface HCFileContentsDeleate : HCBasicContentsDelegate
{
 @protected
  NSString* filePath;
}

-(id) initWithFilepath:(NSString*) path;

-(NSString*) filepath;

-(NSInputStream*) inputstream;

-(NSData*) load;

@end

#endif
