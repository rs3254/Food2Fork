//
//  detailViewController.m
//  Food2Fork
//
//  Created by Ray Sabbineni on 5/8/16.
//  Copyright © 2016 Ray Sabbineni. All rights reserved.
//

#import "DetailsViewController.h"

@interface DetailsViewController ()

@end

@implementation DetailsViewController





- (void)viewDidLoad {
    [super viewDidLoad];
  
    
    // set properties
    self.nameTitle.text = self.meal.title;
    self.publisher.text = self.meal.publisher;
    
    
    self.fImage.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:self.meal.imageString]]];
    
    self.sourceUrl.text = self.meal.source_url;
    self.sourceUrl.editable = NO;
    self.sourceUrl.dataDetectorTypes = UIDataDetectorTypeAll;
    
    
    //  GET request with API string
    
    NSString * urlString = [NSString stringWithFormat:@"http://food2fork.com/api/get?key=37176991437f37ccf1cc0d18a51739c7&rId=%@", self.meal.recipe_id];
    
    NSURLSession * session = [NSURLSession sharedSession];
    NSURLSessionDataTask * dataTask = [session dataTaskWithURL:[NSURL URLWithString:urlString] completionHandler:^(NSData *  data, NSURLResponse *  response, NSError *  error) {
        
        NSDictionary * json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        self.recipeArray = [json valueForKey:@"recipe"];
        self.ingredients = [self.recipeArray valueForKey:@"ingredients"];
        
        NSString * stringForIngredientsTextView = [self.ingredients componentsJoinedByString:@"\n"];
        dispatch_async(dispatch_get_main_queue(), ^{
            self.ingredientsTextView.text = stringForIngredientsTextView;
            

        });
    }];
    
    [dataTask resume];
    
}



@end
