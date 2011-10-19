#ifndef HCDATACONTENTSDELEGATE_H
#define HCDATACONTENTSDELEGATE_H

#import <Foundation/Foundation.h>

#import "HCBasicContentsDelegate.h"


@interface HCDataContentsDelegate : HCBasicContentsDelegate
{
 @protected
  NSMutableData* contentsData;
}

-(NSData*) contents;

@end

#endif
