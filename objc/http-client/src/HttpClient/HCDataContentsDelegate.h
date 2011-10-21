#ifndef HCDATACONTENTSDELEGATE_H
#define HCDATACONTENTSDELEGATE_H

#import <Foundation/Foundation.h>

#import "HCBasicMethodDelegate.h"


@interface HCDataContentsDelegate : HCBasicMethodDelegate
{
 @protected
  NSMutableData* contentsData;
}

-(NSData*) contents;

@end

#endif
