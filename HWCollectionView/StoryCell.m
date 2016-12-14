//
//  StoryCell.m
//  HWCollectionView
//
//  Created by Rustam N on 01.12.16.
//  Copyright © 2016 com.itis.iosLab. All rights reserved.
//

#import "StoryCell.h"

@implementation StoryCell

- (void)drawRect:(CGRect)rect {
    _storyImage.clipsToBounds = true;
    _storyImage.layer.cornerRadius = _storyImage.frame.size.width/2;
}


@end
