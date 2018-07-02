//
//  TQVCDemo.m
//  ZeroIos
//
//  Created by Tianq on 2018/6/29.
//  Copyright © 2018年 zeluo. All rights reserved.
//

#import "TQVCDemo.h"
#import "TQRiseSheet.h"

@interface TQVCDemo ()
@property (strong, nonatomic) UIScrollView* scrollView;
@end

@implementation TQVCDemo

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
    }];
    
    UIView* contentView = UIView.new;
    [self.scrollView addSubview:contentView];
    [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.scrollView);
        make.width.equalTo(self.scrollView);
    }];
}

-(void)didMoreClick{
    XMGLogFunc;
    __weak TQVCDemo *weakSelf=self;
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
