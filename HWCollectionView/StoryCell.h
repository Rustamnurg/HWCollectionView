//
//  StoryCell.h
//  HWCollectionView
//
//  Created by Rustam N on 01.12.16.
//  Copyright © 2016 com.itis.iosLab. All rights reserved.
//

#import "CollectionViewCell.h"

@interface StoryCell : CollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *storyImage;
@property (weak, nonatomic) IBOutlet UILabel *loginLabel;

@end
