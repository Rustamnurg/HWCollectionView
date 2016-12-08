//
//  DataManager.m
//  HWCollectionView
//
//  Created by Rustam N on 08.12.16.
//  Copyright © 2016 com.itis.iosLab. All rights reserved.
//

#import "DataManager.h"

@implementation DataManager
{
    FMDatabase *dataBase;
}

+ (instancetype)sharedInstance{
    static id _sinngleTon = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sinngleTon = [[self alloc] init];
    });
    return _sinngleTon;
}

- (instancetype)init
{
    self = [super init];
    if(self){
        NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
        NSString *path = [docPath stringByAppendingPathComponent:@"sqllDB"];
        dataBase = [[FMDatabase alloc]initWithPath:path];
        [dataBase open];
        NSLog(@"%@", path);
    }
    return self;
}

- (void)createTable{
    
}
@end














































