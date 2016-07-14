//
//  CustomCell.h
//  Food2Fork
//
//  Created by Ray Sabbineni on 5/8/16.
//  Copyright © 2016 Ray Sabbineni. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *publisherLabel;


@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) IBOutlet UIImageView *foodImage;



@end
