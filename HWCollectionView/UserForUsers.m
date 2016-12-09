//
//  UserForUsers.m
//  HWCollectionView
//
//  Created by Rustam N on 09.12.16.
//  Copyright © 2016 com.itis.iosLab. All rights reserved.
//

#import "UserForUsers.h"

@implementation UserForUsers

- (id)initWithUserName:(NSString*)username andFirstName:(NSString*)firstName andWebsite:(NSString*)website andBio:(NSString*)bio{
    self = [super init];
    if (self != nil) {
        _username = username;
        _firstName = firstName;
        _website = website;
        _bio = bio;
    }
    return self;
}
@end
