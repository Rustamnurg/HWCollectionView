//
//  UserForUsers.h
//  HWCollectionView
//
//  Created by Rustam N on 09.12.16.
//  Copyright © 2016 com.itis.iosLab. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserForUsers : NSObject

@property (strong, nonatomic) NSString *username;
@property (strong, nonatomic) NSString *firstName;
@property (strong, nonatomic) NSString *website;
@property (strong, nonatomic) NSString *bio;
@property (strong, nonatomic) NSString *photo;

- (id)initWithUserName:(NSString*)username andFirstName:(NSString*)firstName andWebsite:(NSString*)website andBio:(NSString*)bio andPhoto:(NSString*)photo;

@end
