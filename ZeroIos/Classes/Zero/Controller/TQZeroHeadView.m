//
//  TQZeroheadView.m
//  ZeroIos
//
//  Created by Tianq on 2018/6/13.
//  Copyright © 2018年 zeluo. All rights reserved.
//

#import "TQZeroHeadView.h"

@implementation TQZeroheadView

- (instancetype)initWithClick:(TQActionButtonBlock)clicked{
    self = [super init]; //用于初始化父类
    if (self) {
        self.buttonBlock = clicked;
    CGFloat margin = 14;
        //        do something
        UIImageView *divisionView=[[UIImageView alloc]init];
        divisionView.backgroundColor=DivisionColor;
        [divisionView setFrame:CGRectMake(0, 0, SCREEN_WIDTH, 8)];
        [self addSubview:divisionView];
        
        //content
        UIView *view1=[[UIView alloc]init];
        view1.backgroundColor=[UIColor whiteColor];
        [view1 setFrame:CGRectMake(0, divisionView.size.height, SCREEN_WIDTH, 50)];
        [self addSubview:view1];
        
        UILabel *label1=[[UILabel alloc]init];
        [view1 addSubview:label1];
        label1.text=localized_PeopleNearby;
        label1.sd_layout
        .leftSpaceToView(view1, margin)
        .widthIs(200)
        .heightIs(view1.size.height);
    
        UIButton *fliterButton = [UIButton buttonWithType:UIButtonTypeCustom];
           [fliterButton setBackgroundImage:[UIImage imageNamed:@"iconFliter"] forState:UIControlStateNormal];
        
        [fliterButton addTarget:self action:@selector(didClickFliter:) forControlEvents:UIControlEventTouchUpInside];
        [view1 addSubview:fliterButton];
        fliterButton.sd_layout
        .rightSpaceToView(view1, margin)
        .widthIs(20)
        .heightIs(20)
        .centerYEqualToView(view1);
        

        

        UIImageView *divisionView1=[[UIImageView alloc]init];
        divisionView1.backgroundColor=DivisionColor;
        [divisionView1  setFrame:CGRectMake(0, divisionView.size.height+view1.size.height , SCREEN_WIDTH ,1)];
        [self addSubview:divisionView1];
        
        [self  setFrame:CGRectMake(0, 0, SCREEN_WIDTH  ,divisionView.size.height+view1.size.height+divisionView1.size.height)];
        
     
        
        
        //        do something
     
    }
    return self;
    
}

-(void)didClickFliter:(UIButton *)fliter{
    self.buttonBlock(YES);
}
-(void)show{
    UIImageView *divisionView=[[UIImageView alloc]init];
    divisionView.backgroundColor=DivisionColor;
    [divisionView setFrame:CGRectMake(0, 0, SCREEN_WIDTH, 5)];
    [self addSubview:divisionView];
    
    UIView *view1=[[UIView alloc]init];
    view1.backgroundColor=[UIColor whiteColor];
    [view1 setFrame:CGRectMake(0, 0, SCREEN_WIDTH, 30+divisionView.size.height)];
     [self addSubview:view1];
    
}

@end
