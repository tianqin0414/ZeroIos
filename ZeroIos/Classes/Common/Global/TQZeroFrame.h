//
//  TQZeroFrame.h
//  ZeroIos
//
//  Created by Tianq on 2018/6/23.
//  Copyright © 2018年 zeluo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TTRangeSlider.h"

@interface TQZeroFrame : UIView
+(UIView *)addTitleWithView:(UIView *)topView
            tq_TitleHeight :(CGFloat)tq_TitleHeight
             isEquaToBottom:(BOOL)isEquaToBottom
                titleLabel : (NSString *)labelText
               spaceToView : (CGFloat)spaceToView;

+(NSMutableArray *)viewArrWithContentView:(UIView *)contentView
                                viewOnTop:(UIView *)viewOnTop
                               viewHeight:(CGFloat)viewHeight
                                viewCount:(int)viewCount
                                spaceToLeft:(CGFloat)spaceToLeft;

+(void)addLines:(UIView *)view
leftspaceToview:(CGFloat)leftSpace
       isBottom:(BOOL)isBottom;

+(TTRangeSlider *)sliderInit;
@end
