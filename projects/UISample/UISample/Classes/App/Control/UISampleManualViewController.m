//
//  UISampleManualViewController.m
//  UISample
//
//  Created by developer on 11/10/24.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "UISampleManualViewController.h"

#import "SampleView.h"

@implementation UISampleManualViewController

-(void) loadView {
    NSString* labelString = @"Manual View";
    CGRect screen = [[UIScreen mainScreen] bounds];
    SampleView* view = [[SampleView alloc] initWithFrame:screen];
    [view setBackgroundColor:[UIColor whiteColor]];

    int margin = 10;
    int positionY = margin;

    // Label
    CGSize size = [labelString sizeWithFont:[UIFont systemFontOfSize:17.0]];
    UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake((screen.size.width-size.width)/2, positionY, size.width, size.height)];
    label.text = labelString;
    [view addSubview:label];
    
    positionY += size.height + margin;

    // TextField
    UITextField* textfield = [[UITextField alloc] initWithFrame:CGRectMake(margin, positionY, screen.size.width-2*margin, size.height)];
    textfield.borderStyle = UITextBorderStyleRoundedRect;
    [view addSubview:textfield];

    positionY += size.height + margin;

    // Button
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    labelString = NSLocalizedString(@"Manual Button", @"Button");
    size = [labelString sizeWithFont:[UIFont systemFontOfSize:17.0]];
    [button setTitle:labelString forState:UIControlStateNormal];
    button.frame = CGRectMake((screen.size.width-size.width)/2, positionY, size.width+margin, size.height+margin);
    [view addSubview:button];

    self.view=view;
}

@end
