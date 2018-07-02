//
//  TQRiseSheet.m
//  ZeroIos
//
//  Created by Tianq on 2018/6/29.
//  Copyright © 2018年 zeluo. All rights reserved.
//

#import "TQRiseSheet.h"
#import "UIImage+Extension.h"
#define BUTTON_H 70.0f
#define MARGIN  SCREEN_WIDTH/12

@interface TQRiseSheet ()
@property (nonatomic, strong) UIWindow *backWindow;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) NSDictionary *Dic;
@end
@implementation TQRiseSheet

-(instancetype)initWithDic:(NSDictionary *)Dic
                        clicked:(TQActionSheetBlock)clicked{
    if (self=[super init]) {
        self.Dic=Dic;
        self.clickedBlock = clicked;
    }
    return self;
}

- (void)setupMainView {
    // 暗黑色的view
    UIView *darkView = [[UIView alloc] init];
    [darkView setAlpha:0.3];
    
    //    [darkView setUserInteractionEnabled:NO];
    [darkView setFrame:(CGRect){0, 0, SCREEN_WIDTH,SCREEN_HEIGHT}];
    [darkView setBackgroundColor:KColor(46, 49, 50)];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismiss)];
    [darkView addGestureRecognizer:tap];
    [self addSubview:darkView];
   
    
    UIView *bottomView = [[UIView alloc] init];
     [bottomView setBackgroundColor:[UIColor whiteColor]];//maincolor  #f4f4ea


    //[self addSubview:bottomView];
[bottomView setFrame:CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT/2)];
    UIScrollView *scrollView = [[UIScrollView alloc]init];
    self.scrollView=scrollView;
    scrollView.backgroundColor=DivisionColor;
    [self addSubview:scrollView];
    
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.mas_bottom);
        make.width.equalTo(@(SCREEN_WIDTH));
        make.height.lessThanOrEqualTo(@(SCREEN_HEIGHT/3*2));
        make.height.equalTo(@(BUTTON_H * self.Dic.count)).priorityLow();

    }];
    
  
    UIView* contentView = UIView.new;
    [self.scrollView addSubview:contentView];
    [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.scrollView);
        make.width.equalTo(self.scrollView);
    }];
    UIButton *lastBtn= [[UIButton alloc]init];
      int i = 0;
    for(NSString *key in self.Dic){
      
        
        UIButton *btn = [[UIButton alloc] init];
         [btn setBackgroundColor:[UIColor whiteColor]];
             [btn addTarget:self action:@selector(didClickBtn:) forControlEvents:UIControlEventTouchUpInside];//UIControlEventTouchUpInside
        UIImage *bgImage = [UIImage imageNamed:@"bgImage_H"];
        [btn setBackgroundImage:bgImage forState:UIControlStateHighlighted];
        

        [btn setTag:i];
        
        [contentView addSubview:btn];
        
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(i==0?contentView.mas_top:lastBtn.mas_bottom);
            make.width.equalTo(@(SCREEN_WIDTH));
            make.height.equalTo(@(BUTTON_H));
        }];
        UIImageView *imgV = [[UIImageView alloc]init];
        imgV.image = [UIImage imageNamed:self.Dic[key]];
        [btn addSubview:imgV];
        [imgV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(@(MARGIN));
            make.centerY.equalTo(btn);
        }];
        
        UILabel *btnLabel = [UILabel new];
        btnLabel.text=key;
        btnLabel.textColor =SHEETFontGray; //#7B8085
         [btn addSubview:btnLabel];
        [btnLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(imgV.mas_right).offset(MARGIN);
            make.centerY.equalTo(btn);
        }];
        
            lastBtn=btn;
        i++;
    }
    [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(lastBtn.mas_bottom);
    }];
}

- (void)didClickBtn:(UIButton *)btn {
    //btn.backgroundColor=[UIColor grayColor];//[UIColor stringTOColor:@"#f4f4ea"];
    self.clickedBlock(btn.tag);
}

- (UIWindow *)backWindow {
    if (_backWindow == nil) {
        _backWindow = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        _backWindow.windowLevel       = UIWindowLevelStatusBar;
        _backWindow.backgroundColor   = [UIColor clearColor];
        _backWindow.hidden = NO;
    }
    return _backWindow;
}



-(void)show{
   [self setupMainView];

    self.frame=CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);//
    
    
    [self.backWindow addSubview:self];
}
-(void)dismiss{
    XMGLogFunc;
    self.backWindow.hidden = YES;
}

@end
