//
//  Photo.m
//  HWCollectionView
//
//  Created by Rustam N on 09.12.16.
//  Copyright © 2016 com.itis.iosLab. All rights reserved.
//

#import "Photo.h"

@implementation Photo

- (id) initWithAuthor:(NSString*)author andPhotoName:(NSString*)photoName andCreateDate:(NSString*)createDate{
    self = [super init];
    if (self != nil) {
        _author = author;
        _photoName = photoName;
        _createDate = createDate;
    }
    return self;
}

@end
