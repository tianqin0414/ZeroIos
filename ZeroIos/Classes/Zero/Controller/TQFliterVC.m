//
//  TQFliterVC.m
//  ZeroIos
//
//  Created by Tianq on 2018/6/22.
//  Copyright © 2018年 zeluo. All rights reserved.
//

#import "TQFliterVC.h"
#import "TQZeroViewController.h"
#import "TTRangeSlider.h"
#import "TQZeroFrame.h"

#define SPACETO_VIEW 12
#define CFSize [UIFont systemFontOfSize:20.0f]//ContentFontSize
#define TitleHeight self.navigationController.navigationBar.frame.size.height
#define BtnHeight TitleHeight*1.5
#define SliderHeight TitleHeight*1.7

#define FTLineColor  [UIColor lightGrayColor] //fliter line color
#define FTLineBorder 0.5
#define Switch_H 60
#define Margin 25

@interface TQFliterVC ()
@property (strong, nonatomic) UIScrollView* scrollView;
@end

@implementation TQFliterVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIScrollView *scrollView = [[UIScrollView alloc]init];
    self.scrollView=scrollView;
    scrollView.backgroundColor=[UIColor redColor];
    [self.view addSubview:scrollView];
    
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    
    UIView* contentView = UIView.new;
    [self.scrollView addSubview:contentView];
    
    [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.scrollView);
        make.width.equalTo(self.scrollView);
    }];
    


    UIView* view5=[TQZeroFrame addTitleWithView:contentView tq_TitleHeight:TitleHeight isEquaToBottom:NO titleLabel:@"!!!" spaceToView:SPACETO_VIEW];
    
    
    UIView *fullView=[[UIView alloc]init];
    fullView.backgroundColor=[UIColor whiteColor];
    [contentView addSubview:fullView];
    
    
    [fullView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(view5.mas_bottom);
        make.left.equalTo(@0);
        make.width.equalTo(view5.mas_width);
        make.height.equalTo(@(400));
    }];
    NSLog(@"%@",@"dddd");//TQ0623
    NSLog(@"fullView--%f",fullView.width);
     NSLog(@"fullView--%f",fullView.frame.size.width);
    
    
    [self addLines:fullView leftspaceToview:0 isBottom:NO];
    
    [self addLines:fullView leftspaceToview:0 isBottom:YES];
    
    [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(fullView.mas_bottom);
    }];
    
    
}




-(void)addLines:(UIView *)view
leftspaceToview:(CGFloat)leftSpace
       isBottom:(BOOL)isBottom{
    UIView *lineView  = [[UIView alloc] init];
    lineView.backgroundColor = [UIColor blueColor];//FTLineColor;
    [view addSubview:lineView];

        
        [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(isBottom?view.mas_bottom:view.mas_top);
            make.left.equalTo(@(leftSpace));
            make.width.equalTo(@(200-50));
            make.height.equalTo(@(0.5));
           
        }];
   
    NSLog(@"width%f",view.frame.size.width);
    NSLog(@"width%f",view.width);
}

-(NSDictionary *)viewDic:(UIView *)mainView
               viewOnTop:(UIView *)viewOnTop
              viewHeight:(CGFloat)viewHeight
               viewCount:(int)viewCount{
    NSDictionary *viewDic=[[NSDictionary alloc]init];
    NSMutableArray *viewArr=[[NSMutableArray alloc]init];
    UIView *view=[[UIView alloc]init];
    //[viewArr addObject:view];
    
    
    UIView *bigView=[[UIView alloc]init];
    bigView.backgroundColor=[UIColor whiteColor];
    [mainView addSubview:bigView];
    bigView.sd_layout
    .topSpaceToView(viewOnTop, 0)
    .widthIs(SCREEN_WIDTH)
    .heightIs(viewHeight);
    UIView *baseView=[[UIView alloc]init];
    for (int i = 0 ; i < viewCount; i++) {
        UIView *smallView=[[UIView alloc]init];
        //[smallView setTag:i];
        smallView.backgroundColor=[UIColor grayColor];
        [bigView addSubview:smallView];
        if (i==0) {
            baseView=bigView;
        }
        else{
            baseView=viewArr[i-1];
        }
        
        smallView.sd_layout
        //.topEqualToView(baseView)
        .topSpaceToView(baseView, 0)
        .widthIs(SCREEN_WIDTH)
        .heightIs(viewHeight/viewCount);
        
        if (i==0) {
            [self addLines:smallView leftspaceToview:0 isBottom:NO];
        }
        if (i==viewCount-1){
            [self addLines:smallView leftspaceToview:0 isBottom:YES];
            //[self addLines:smallView leftspaceToview:Margin isBottom:NO];
        }else{
            [self addLines:smallView leftspaceToview:Margin isBottom:YES];//TQ0620
        }
        
        [viewArr addObject:smallView];
    }
    
    //    UIView *heightSliderV=[[UIView alloc]init];
    //    heightSliderV.backgroundColor=[UIColor grayColor];
    //    [bigView addSubview:heightSliderV];
    //    heightSliderV.sd_layout
    //    .topEqualToView(bigView)
    //    .widthIs(SCREEN_WIDTH)
    //    .heightIs(viewHeight/viewCount);
    //
    //    [self addLines:heightSliderV leftspaceToview:0 isBottom:NO];
    //
    //    UIView *weightSliderV=[[UIView alloc]init];
    //
    //    [bigView addSubview:weightSliderV];
    //    weightSliderV.sd_layout
    //    .topSpaceToView(heightSliderV, 0)
    //    .widthIs(SCREEN_WIDTH)
    //    .heightIs(viewHeight/viewCount);
    //    weightSliderV.backgroundColor=[UIColor yellowColor];
    //    [self addLines:heightSliderV leftspaceToview:Margin isBottom:YES];
    //    [self addLines:weightSliderV leftspaceToview:0 isBottom:YES];
    
    return viewDic;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
