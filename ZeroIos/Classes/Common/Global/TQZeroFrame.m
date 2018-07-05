//
//  TQZeroFrame.m
//  ZeroIos
//
//  Created by Tianq on 2018/6/23.
//  Copyright © 2018年 zeluo. All rights reserved.
//

#import "TQZeroFrame.h"
#import "TTRangeSlider.h"

#define FTLineBorder 0.5
#define SPACETO_VIEW 12
#define FTLineColor  [UIColor lightGrayColor]


@implementation TQZeroFrame

//masonry
+(UIView *)addTitleWithView:(UIView *)topView
            tq_TitleHeight :(CGFloat)tq_TitleHeight
             isEquaToBottom:(BOOL)isEquaToBottom
                titleLabel : (NSString *)labelText
                   spaceToView : (CGFloat)spaceToView
{

    UIView *newView=[[UIView alloc]init];
    //newView.backgroundColor=[UIColor grayColor];
    
    UILabel *titleLabel=[[UILabel alloc]init];
    titleLabel.text=labelText;
    titleLabel.textColor=[UIColor grayColor];
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
//slider
+(TTRangeSlider *)sliderInit{
    TTRangeSlider *Slider=[[TTRangeSlider alloc]init];
    Slider.selectedHandleDiameterMultiplier = 1.2;
    Slider.tintColorBetweenHandles = SColor;
    Slider.handleColor=SColor;
    Slider.maxLabelColour=[UIColor blackColor];
    Slider.minLabelColour=[UIColor blackColor];
    Slider.tintColor=[UIColor grayColor];
    return Slider;
}

//Masonry viewDic
+(NSMutableArray *)viewArrWithContentView:(UIView *)contentView
                                viewOnTop:(UIView *)viewOnTop
                               viewHeight:(CGFloat)viewHeight
                                viewCount:(int)viewCount
                              spaceToLeft:(CGFloat)spaceToLeft{
    NSMutableArray *viewArr=[[NSMutableArray alloc]init];
    UIView *fullView=[[UIView alloc]init];
    fullView.backgroundColor=[UIColor whiteColor];
    [contentView addSubview:fullView];

    [fullView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(viewOnTop.mas_bottom);
        make.left.equalTo(@0);
        make.width.equalTo(viewOnTop.mas_width);
        make.height.equalTo(@(viewHeight + FTLineBorder * viewCount * 0 ));
    }];
    
        [self addLines:fullView leftspaceToview:0 isBottom:NO addBottomLine:NO];

        [self addLines:fullView leftspaceToview:0 isBottom:YES addBottomLine:YES];

   

    [viewArr addObject:fullView];
    if (viewCount==1) {
        return viewArr;
    }

    UIView *baseView=[[UIView alloc]init];
    for (int i = 0 ; i < viewCount; i++) {
        UIView *apartView=[[UIView alloc]init];
        apartView.backgroundColor=[UIColor whiteColor];
        [fullView addSubview:apartView];
      
            baseView=viewArr[i];

        
        [apartView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(i==0?fullView.mas_top:baseView.mas_bottom);            make.left.equalTo(@(0));
            make.width.equalTo(@(SCREEN_WIDTH));
            make.height.equalTo(@(viewHeight/viewCount ));
        }];


        if (i!=(viewCount-1)) {
            [self addLines:apartView leftspaceToview:spaceToLeft isBottom:YES addBottomLine:NO];
     }
        
        [viewArr addObject:apartView];
    }
    
    return viewArr;
}

+(void)addLines:(UIView *)view
leftspaceToview:(CGFloat)leftSpace
       isBottom:(BOOL)isBottom
  addBottomLine:(BOOL)isAdd{
    
    UIView *lineView  = [[UIView alloc] init];
    lineView.backgroundColor = FTLineColor;
    [view addSubview:lineView];
    
    
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        if (isAdd) {
               make.top.equalTo(isBottom?view.mas_bottom:view.mas_top).offset(FTLineBorder);
        }else{
                  make.bottom.equalTo(isBottom?view.mas_bottom:view.mas_top).offset(-FTLineBorder);
        }
 
        make.left.equalTo(@(leftSpace));
        make.width.equalTo(@(SCREEN_WIDTH-leftSpace));
        make.height.equalTo(@(FTLineBorder));
        
    }];
    
}
@end
