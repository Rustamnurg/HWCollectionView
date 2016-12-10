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
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
 

    // Configure the view for the selected state
}

- (void)drawRect:(CGRect)rect {
    _userProfilePhoto.clipsToBounds = true;
    _userProfilePhoto.layer.cornerRadius = _userProfilePhoto.frame.size.width/2;
}

@end
