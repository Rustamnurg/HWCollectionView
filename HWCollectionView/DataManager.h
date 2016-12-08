//
//  DataManager.h
//  HWCollectionView
//
//  Created by Rustam N on 08.12.16.
//  Copyright © 2016 com.itis.iosLab. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDB.h"

@interface DataManager : NSObject
+ (instancetype)sharedInstance;
- (void)createTable;
@end
