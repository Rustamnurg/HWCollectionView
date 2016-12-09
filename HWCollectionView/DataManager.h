//
//  DataManager.h
//  HWCollectionView
//
//  Created by Rustam N on 08.12.16.
//  Copyright © 2016 com.itis.iosLab. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDB.h"
#import "User.h"
#import "Photo.h"
#import "History.h"

@interface DataManager : NSObject

+ (instancetype)sharedInstance;
- (void)createTable;
- (void)addUsers:(User*)user;
- (void)addPhoto:(Photo*)photo;
- (void)addHistory:(History*)history;
- (NSArray*)getAllPhoto;
- (NSArray*)getAllHistory;

@end
