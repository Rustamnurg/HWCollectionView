//
//  StoryCell.m
//  HWCollectionView
//
//  Created by Rustam N on 01.12.16.
//  Copyright © 2016 com.itis.iosLab. All rights reserved.
//

#import "StoryCell.h"

@implementation StoryCell

//
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    _storyImage.clipsToBounds = true;
    _storyImage.layer.cornerRadius = _storyImage.frame.size.width/2;
}


@end
