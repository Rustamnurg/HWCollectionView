//
//  Photo.h
//  HWCollectionView
//
//  Created by Rustam N on 09.12.16.
//  Copyright © 2016 com.itis.iosLab. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Photo : NSObject

@property(strong, nonatomic) NSString *author;
@property(strong, nonatomic) NSString *photoName;
@property(strong, nonatomic) NSString *createDate;

- (id) initWithAuthor:(NSString*)author andPhotoName:(NSString*)photoName andCreateDate:(NSString*)createDate;
@end

