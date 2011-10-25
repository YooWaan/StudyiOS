//
//  DSDetailViewController.h
//  DataStorage
//
//  Created by developer on 11/10/25.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DSDetailViewController : UIViewController <UISplitViewControllerDelegate>

@property (strong, nonatomic) id detailItem;

@property (strong, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@property (strong, nonatomic) IBOutlet UITextField *titleField;

@property (strong, nonatomic) IBOutlet UITextField *messageArea;


@end
