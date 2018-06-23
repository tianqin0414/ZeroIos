//
//  TQZeroFrame.h
//  ZeroIos
//
//  Created by Tianq on 2018/6/23.
//  Copyright © 2018年 zeluo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TQZeroFrame : UIView
+(UIView *)addTitleWithView:(UIView *)topView
            tq_TitleHeight :(CGFloat)tq_TitleHeight
             isEquaToBottom:(BOOL)isEquaToBottom
                titleLabel : (NSString *)labelText
               spaceToView : (CGFloat)spaceToView;
@end
