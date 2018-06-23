//
//  TQZeroFrame.m
//  ZeroIos
//
//  Created by Tianq on 2018/6/23.
//  Copyright © 2018年 zeluo. All rights reserved.
//

#import "TQZeroFrame.h"
#define FTLineBorder 0.5
@implementation TQZeroFrame

//masonry
+(UIView *)addTitleWithView:(UIView *)topView
            tq_TitleHeight :(CGFloat)tq_TitleHeight
             isEquaToBottom:(BOOL)isEquaToBottom
                titleLabel : (NSString *)labelText
                   spaceToView : (CGFloat)spaceToView
{
    //view1想看到的用户
    UIView *newView=[[UIView alloc]init];
    newView.backgroundColor=[UIColor yellowColor];
    
    UILabel *titleLabel=[[UILabel alloc]init];
    titleLabel.text=labelText;
    titleLabel.textColor=[UIColor greenColor];
    [newView addSubview:titleLabel];
    [topView addSubview:newView];
    
    [newView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(isEquaToBottom?topView.mas_bottom : @0);
        make.left.equalTo(@0);
        make.width.equalTo(topView.mas_width);
        make.height.equalTo(@(tq_TitleHeight));
    }];
    
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(newView);
        make.left.equalTo(@(spaceToView));
        make.width.equalTo(topView.mas_width);
        make.height.equalTo(@(tq_TitleHeight));
    }];
    return newView;
}

@end
