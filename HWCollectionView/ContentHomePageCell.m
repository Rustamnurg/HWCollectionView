//
//  ContentHomePageCell.m
//  HWCollectionView
//
//  Created by Rustam N on 01.12.16.
//  Copyright © 2016 com.itis.iosLab. All rights reserved.
//

#import "ContentHomePageCell.h"

@implementation ContentHomePageCell

- (void)awakeFromNib {
    [super awakeFromNib];
//    UITapGestureRecognizer* gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(userTappedOnLink:)];
//    
//    [_userNameLabel setUserInteractionEnabled:YES];
//    [_userNameLabel addGestureRecognizer:gesture];
}


//- (void)userTappedOnLink:(UIGestureRecognizer*)gestureRecognizer{
//    NSLog(@"tap");
//    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//    UIViewController *descriptionVC = [mainStoryboard instantiateViewControllerWithIdentifier:@"AnotherUserPage"];
//    [self presentViewController:descriptionVC animated:NO completion:nil];
//
//
//}




- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
 

    // Configure the view for the selected state
}

- (void)drawRect:(CGRect)rect {
    _userProfilePhoto.clipsToBounds = true;
    _userProfilePhoto.layer.cornerRadius = _userProfilePhoto.frame.size.width/2;
}

@end
