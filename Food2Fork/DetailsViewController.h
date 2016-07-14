//
//  detailViewController.h
//  Food2Fork
//
//  Created by Ray Sabbineni on 5/8/16.
//  Copyright © 2016 Ray Sabbineni. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MealsData.h"


@interface DetailsViewController : UIViewController


@property(nonatomic)NSInteger indexNumberDetailView;
@property(nonatomic, strong) NSMutableArray * mealsFromApi;

@property(nonatomic, retain) MealsData * meal;



@property (weak, nonatomic) IBOutlet UILabel *nameTitle;
@property (weak, nonatomic) IBOutlet UILabel *publisher;
@property (weak, nonatomic) IBOutlet UIImageView * fImage;
@property (weak, nonatomic) IBOutlet UITextView *sourceUrl;

@property (weak, nonatomic) IBOutlet UITextView *ingredientsTextView;





@property(strong, nonatomic)NSString * stringWithImage;
@property(nonatomic)NSString * recipeId;
@property(nonatomic, strong)NSArray * recipeArray;
@property(nonatomic, strong) NSArray * ingredients;




@end
