//
//  ViewController.h
//  Food2Fork
//
//  Created by Ray Sabbineni on 5/8/16.
//  Copyright © 2016 Ray Sabbineni. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UINavigationControllerDelegate, UITableViewDataSource, UITableViewDelegate>




@property (weak, nonatomic) IBOutlet UITableView *tableView;





@property(nonatomic, strong) NSArray * recipeArray;
@property(nonatomic, strong)NSMutableArray * arrayWithMealObjects;




@end

