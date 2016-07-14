//
//  ViewController.m
//  Food2Fork
//
//  Created by Ray Sabbineni on 5/8/16.
//  Copyright © 2016 Ray Sabbineni. All rights reserved.
//

#import "ViewController.h"
#import "CustomCell.h"
#import "MealsData.h"
#import "DetailsViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.arrayWithMealObjects = [[NSMutableArray alloc]init];

    //  Search request with API string
    NSURLSession * session = [NSURLSession sharedSession];
    NSURLSessionDataTask * dataTask =
    [session dataTaskWithURL:[NSURL URLWithString:@"http://food2fork.com/api/search?key=37176991437f37ccf1cc0d18a51739c7"] completionHandler:^(NSData * data, NSURLResponse * response, NSError * _Nullable error) {
    
        NSDictionary * json = [NSJSONSerialization JSONObjectWithData:data options:0 error: nil];
        self.recipeArray = [json valueForKey:@"recipes"];
        
        for(NSInteger x = 0; x<self.recipeArray.count; x++) {
            
            MealsData * mealObject = [[MealsData alloc]init];
            mealObject.publisher = [self.recipeArray[x] valueForKey:@"title"];
            mealObject.title = [self.recipeArray[x] valueForKey:@"publisher"];
            mealObject.imageString = [self.recipeArray[x] valueForKey:@"image_url"];
            mealObject.source_url = [self.recipeArray[x] valueForKey:@"source_url"];
            mealObject.recipe_id = [self.recipeArray[x] valueForKey:@"recipe_id"];
            [self.arrayWithMealObjects addObject:mealObject];

        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
           [self.tableView reloadData]; 
        });
        
    }];
 
    [dataTask resume];

}
                                       


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    

    return self.arrayWithMealObjects.count;
    
}


-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString * identifier = @"TableCell";
    CustomCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    MealsData * dataObj = [self.arrayWithMealObjects objectAtIndex:indexPath.row];
    cell.publisherLabel.text = dataObj.publisher;
    cell.titleLabel.text = dataObj.title;
    

    cell.foodImage.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:dataObj.imageString]]]; 

    return cell;
}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}






-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

    if([[segue identifier] isEqualToString:@"detailSegue"])
        
    {
        
        
        DetailsViewController * vc = [ segue destinationViewController];
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];

        
        vc.meal = self.arrayWithMealObjects[indexPath.row];

    
        

    }
    
    
}

                                       
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
