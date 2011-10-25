//
//  DSMasterViewController.h
//  DataStorage
//
//  Created by developer on 11/10/25.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DSDetailViewController;

@interface DSMasterViewController : UITableViewController <NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) DSDetailViewController *detailViewController;

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (nonatomic,strong) NSManagedObjectContext *managedObjectContext;

@end
