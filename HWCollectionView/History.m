//
//  History.m
//  HWCollectionView
//
//  Created by Rustam N on 09.12.16.
//  Copyright © 2016 com.itis.iosLab. All rights reserved.
//

#import "History.h"

@implementation History
- (id) initWithAuthor:(NSString*)author andHistoryName:(NSString*)historyName andCreatDate:(NSString*)creatDate{
    self = [super init];
    if (self != nil) {
        _author = author;
        _historyName = historyName;
        _createDate = creatDate;
    }
    return self;
}
@end
