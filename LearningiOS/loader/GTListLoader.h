//
//  GTListLoader.h
//  LearningiOS
//
//  Created by 张啸宇 on 2019/11/30.
//  Copyright © 2019 xiaoyuu. All rights reserved.
//

#import <Foundation/Foundation.h>

@class GTListItem;
NS_ASSUME_NONNULL_BEGIN

typedef void(^GTListLoaderFinishBlock)(BOOL success, NSArray<GTListItem *> *dataArray);

@interface GTListLoader : NSObject
- (void)loadListDataWithFinishBlock:(GTListLoaderFinishBlock)finishBlock;
@end

NS_ASSUME_NONNULL_END
