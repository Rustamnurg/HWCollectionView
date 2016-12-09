//
//  User.h
//  HWCollectionView
//
//  Created by Rustam N on 09.12.16.
//  Copyright © 2016 com.itis.iosLab. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property (strong, nonatomic) NSString *username;
@property (strong, nonatomic) NSString *firstName;
@property (strong, nonatomic) NSString *email;
@property (strong, nonatomic) NSString *phone;
@property (strong, nonatomic) NSString *website;
@property (strong, nonatomic) NSString *bio;
@property (strong, nonatomic) NSString *gendor;

- (id) initWithUserName:(NSString*)username andFirstName:(NSString*)firstName andEmail:(NSString*)email andPhone:(NSString*)phone andWebsite:(NSString*)website andBio:(NSString*)bio andGendor:(NSString*)gendor;

@end
