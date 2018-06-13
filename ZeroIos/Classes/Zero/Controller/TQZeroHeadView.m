//
//  TQZeroheadView.m
//  ZeroIos
//
//  Created by Tianq on 2018/6/13.
//  Copyright © 2018年 zeluo. All rights reserved.
//

#import "TQZeroHeadView.h"

@implementation TQZeroheadView
- (instancetype)init{
    self = [super init]; //用于初始化父类
    if (self) {
      
        //[self  setFrame:CGRectMake(0, 0, SCREEN_WIDTH ,35)];//divisionView.size.height+view1.size.height-1)];
        //        do something
        UIImageView *divisionView=[[UIImageView alloc]init];
        divisionView.backgroundColor=DivisionColor;
        [divisionView setFrame:CGRectMake(0, 0, SCREEN_WIDTH, 8)];
        [self addSubview:divisionView];
        
        //content
        UIView *view1=[[UIView alloc]init];
        view1.backgroundColor=[UIColor whiteColor];
        [view1 setFrame:CGRectMake(0, divisionView.size.height, SCREEN_WIDTH, 40)];
        [self addSubview:view1];
        
        UILabel *label1=[[UILabel alloc]init];
        label1.text=localized_PeopleNearby;
        label1.textColor=[UIColor redColor];
        label1.sd_layout
        .leftSpaceToView(self, 150)
        .widthIs(200)
        .heightIs(view1.size.height);
        [view1 addSubview:label1];
        

        UIImageView *divisionView1=[[UIImageView alloc]init];
        divisionView1.backgroundColor=DivisionColor;
        [divisionView1  setFrame:CGRectMake(0, divisionView.size.height+view1.size.height , SCREEN_WIDTH ,1)];
        [self addSubview:divisionView1];
        
        [self  setFrame:CGRectMake(0, 0, SCREEN_WIDTH  ,divisionView.size.height+view1.size.height+divisionView1.size.height)];
        
     
        
        
        //        do something
     
    }
    return self;
    
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
