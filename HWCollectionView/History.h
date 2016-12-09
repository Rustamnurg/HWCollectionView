//
//  History.h
//  HWCollectionView
//
//  Created by Rustam N on 09.12.16.
//  Copyright © 2016 com.itis.iosLab. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface History : NSObject

@property(strong, nonatomic) NSString *author;
@property(strong, nonatomic) NSString *historyName;
@property(strong, nonatomic) NSString *createDate;

- (id) initWithAuthor:(NSString*)author andHistoryName:(NSString*)historyName andCreatDate:(NSString*)creatDate;
    
@end
