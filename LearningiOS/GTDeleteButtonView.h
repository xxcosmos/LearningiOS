//
//  GTDeleteButtonView.h
//  LearningiOS
//
//  Created by 张啸宇 on 2019/11/29.
//  Copyright © 2019 xiaoyuu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GTDeleteButtonView : UIView
- (void)showDeleteViewFromPoint:(CGPoint)point clickBlock:(dispatch_block_t) clickBlock;
@end

NS_ASSUME_NONNULL_END
