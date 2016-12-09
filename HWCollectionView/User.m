//
//  User.m
//  HWCollectionView
//
//  Created by Rustam N on 09.12.16.
//  Copyright © 2016 com.itis.iosLab. All rights reserved.
//

#import "User.h"

@implementation User


- (id) initWithUserName:(NSString*)username andFirstName:(NSString*)firstName andEmail:(NSString*)email andPhone:(NSString*)phone andWebsite:(NSString*)website andBio:(NSString*)bio andGendor:(NSString*)gendor {
    self = [super init];
    if (self != nil) {
        _username = username;
        _firstName = firstName;
        _email = email;
        _phone = phone;
        _website = website;
        _bio = bio;
        _gendor = gendor;
    }
    return self;
}

@end
