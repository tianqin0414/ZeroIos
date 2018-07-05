//
//  TQZeroUserDetailVC.m
//  ZeroIos
//
//  Created by Tianq on 2018/6/29.
//  Copyright © 2018年 zeluo. All rights reserved.
//

#import "TQZeroUserDetailVC.h"
#import "TQRiseSheet.h"
#import "TQZeroFrame.h"
#import "UIImage+Extension.h"
#define BOTTOM_H 55
#define DIVISION_H 10
#define SPACETO_VIEW 12

@interface TQZeroUserDetailVC ()
@property (strong, nonatomic) UIScrollView* scrollView;
@end

@implementation TQZeroUserDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    self.navigationController.navigationBar.barTintColor = NavigationColor;
    //更多按钮
    UIButton * moreBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    moreBtn.frame = CGRectMake(0, 0, 25,25);
    [moreBtn setImage:[UIImage imageNamed:@"iconMoreAcross"] forState:0];
    [moreBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    UIBarButtonItem * moreBarBtn = [[UIBarButtonItem alloc]initWithCustomView:moreBtn];;
    self.navigationItem.rightBarButtonItems = @[moreBarBtn];
    [moreBtn addTarget:self action:@selector(didMoreClick) forControlEvents:UIControlEventTouchUpInside];
    
    UIScrollView *scrollView = [[UIScrollView alloc]init];
    self.scrollView=scrollView;
    scrollView.backgroundColor=DivisionColor;
    [self.view addSubview:scrollView];
    
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
        make.bottom.equalTo(self.view).offset(-BOTTOM_H);
    }];
    
    UIView* contentView = UIView.new;
    contentView.backgroundColor = DivisionColor;
    [self.scrollView addSubview:contentView];
    [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.scrollView);
        make.width.equalTo(self.scrollView);
    }];
    UIView *lastView = [UIView new];
    UIView* topView=[TQZeroFrame addTitleWithView:contentView tq_TitleHeight:DIVISION_H isEquaToBottom:NO titleLabel:@"" spaceToView:0];
    NSMutableArray *iconViews = [TQZeroFrame viewArrWithContentView:contentView viewOnTop:topView viewHeight:120 viewCount:1 spaceToLeft:0];
    [self iconViews:iconViews];
    
    
    NSMutableArray *switchView =  [TQZeroFrame viewArrWithContentView:contentView viewOnTop:iconViews[0] viewHeight:SCREEN_HEIGHT * 1.9  viewCount:3 spaceToLeft:20];
    lastView = switchView[0];
    [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(lastView);
    }];
    [self bottomBtn];
}

//头像
-(void)iconViews:(NSMutableArray *)iconViews{
    UIView *apartView = iconViews[0];
    UIImageView *iconV = [UIImageView new];
    [apartView addSubview:iconV];
//    iconV.image = [UIImage createImageWithColor:[UIColor redColor]];
    iconV.image = [UIImage imageNamed:@"2.jpg"];
    [iconV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(SPACETO_VIEW));
        make.height.width.equalTo(@(90));
        make.centerY.equalTo(apartView);
    }];
    
    UILabel *nickName = [UILabel new];
    nickName.text = @"ceshiceshi";
    
    [apartView addSubview:nickName];
    [nickName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(iconV.mas_top);
        make.left.equalTo(iconV.mas_right).offset(1.5 * SPACETO_VIEW);
        
    }];
    
}

//底部按钮
-(void)bottomBtn{
    UIView *bottomView = [UIView new];
    
    [self.view addSubview:bottomView];
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view.mas_bottom);
        make.width.equalTo(self.view);
        make.height.equalTo(@(BOTTOM_H));
    }];
    //对话
    UIButton *dialogueBtn = [UIButton new];
     [dialogueBtn addTarget:self action:@selector(didDialogueClick) forControlEvents:UIControlEventTouchUpInside];
    UIImage *bgImage = [UIImage imageNamed:@"bgImage_H"];
    [dialogueBtn setBackgroundImage:bgImage forState:UIControlStateHighlighted];//TQ0715
   
    
    dialogueBtn.backgroundColor = ZEROColor;
    [bottomView addSubview:dialogueBtn];
    [dialogueBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(bottomView);
        make.width.equalTo(@(SCREEN_WIDTH/2));
        make.height.equalTo(bottomView);
        make.top.equalTo(bottomView);
    }];
    UILabel *dialogueLabel = [UILabel new];
    dialogueLabel.text = @"对话";
    dialogueLabel.font = [UIFont systemFontOfSize:20];
    dialogueLabel.textColor = [UIColor whiteColor];
    [dialogueBtn addSubview:dialogueLabel];
    [dialogueLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(dialogueBtn);
        make.centerY.equalTo(dialogueBtn);
    }];
    
    
    //关注
    UIButton *attentionBtn = [UIButton new];
    [attentionBtn addTarget:self action:@selector(didAttentionClick) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    attentionBtn.backgroundColor = ZEROColor;
    [bottomView addSubview:attentionBtn];
    [attentionBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(dialogueBtn.mas_right);;
        make.width.equalTo(@(SCREEN_WIDTH/2));
        make.height.equalTo(bottomView);
        make.top.equalTo(bottomView);
    }];
    UILabel *attentionLabel = [UILabel new];
    attentionLabel.text = @"关注";
    attentionLabel.font = [UIFont systemFontOfSize:20];
    attentionLabel.textColor = [UIColor whiteColor];
    [attentionBtn addSubview:attentionLabel];
    [attentionLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(attentionBtn);
        make.centerY.equalTo(attentionBtn);
    }];
}


-(void)didDialogueClick{
    XMGLogFunc;
   
    
}
-(void)didAttentionClick{
    XMGLogFunc;
}

-(void)didMoreClick{
    XMGLogFunc;
    __weak TQZeroUserDetailVC *weakSelf=self;
    NSDictionary *Dic =@{@"zs":@"iconMoreAcross",@"备注备注":@"iconMoreAcross",@"ls":@"iconMoreAcross",@"bz":@"iconMoreAcross"};
    
    TQRiseSheet *riseSheet=[[TQRiseSheet alloc]initWithDic:Dic clicked:^(NSInteger buttonIndex) {
        switch(buttonIndex){
            case 0:
                [weakSelf takeVideo];
                break;
            case 1:
                [weakSelf takeVideo];
                break;
            case 2:
                [weakSelf takeVideo];
                break;
            case 3:
                [weakSelf takeVideo];
                break;
        }
    }];
    [riseSheet show];
}

-(void)takeVideo{
    XMGLogFunc;
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
