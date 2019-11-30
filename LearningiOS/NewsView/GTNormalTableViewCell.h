//
//  GTNormalTableViewCell.h
//  LearningiOS
//
//  Created by 张啸宇 on 2019/11/28.
//  Copyright © 2019 xiaoyuu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol GTNormalTableViewCellDelegate <NSObject>

- (void)tableViewCell:(UITableViewCell *)tableViewCell clickDeleteButton:(UIButton *)deleteButton;

@end

@interface GTNormalTableViewCell : UITableViewCell
@property(nonatomic,weak,readwrite) id<GTNormalTableViewCellDelegate> delegate;
-(void) layoutTableViewCell;

@end

NS_ASSUME_NONNULL_END
