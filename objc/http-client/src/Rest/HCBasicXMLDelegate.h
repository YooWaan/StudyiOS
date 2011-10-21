#ifndef HCBASICXMLDELEGATE_H
#define HCBASICXMLDELEGATE_H

#import <Foundation/Foundation.h>

@interface HCBasicXMLDelegate : NSObject <NSXMLParserDelegate>
{
  BOOL parseText;
  NSString* textData;
}

- (void) prepareText;
- (void) clearText;
- (BOOL) hasFoundText;

@end

#endif
