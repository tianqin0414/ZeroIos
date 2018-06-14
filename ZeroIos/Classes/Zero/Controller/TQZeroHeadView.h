//
//  TQZeroheadView.h
//  ZeroIos
//
//  Created by Tianq on 2018/6/13.
//  Copyright © 2018年 zeluo. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TQZeroheadView;
typedef void(^TQActionButtonBlock)(BOOL isClicked);
@interface TQZeroheadView : UIView
-(void)show;
@property (nonatomic, copy) TQActionButtonBlock buttonBlock;
- (instancetype)initWithClick:(TQActionButtonBlock)clicked;
@end
