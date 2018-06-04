//
//  TQActionSheet.m
//  PodTest
//
//  Created by Tianq on 2018/6/3.
//  Copyright © 2018年 zeluo. All rights reserved.
//

#import "TQActionSheet.h"
@interface TQActionSheet ()
@property (nonatomic, strong) NSMutableArray *buttonTitles;

@property (nonatomic, strong) UIView *darkView;

@property (nonatomic, strong) UIView *bottomView;

@property (nonatomic, strong) UIWindow *backWindow;

@end

@implementation TQActionSheet

- (void)setupMainView {

    // 暗黑色的view
    UIView *darkView = [[UIView alloc] init];
    [darkView setAlpha:0];
    [darkView setUserInteractionEnabled:NO];
    [darkView setFrame:(CGRect){0, 0, 414,736}];
    [darkView setBackgroundColor:KColor(46, 49, 50)];
   
    [self addSubview:darkView];
    
    [self setFrame:(CGRect){0, 0, 414, 736}];
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
    self.frame=CGRectMake(0, 0, 414, 736);

    UIView *abc=[[UIView alloc]init];
    abc.backgroundColor=[UIColor redColor];
//    abc.sd_layout
//    .centerYIs(self.height/2)
//    .centerXIs(self.width/2)
//    .heightIs(313)
//    .widthEqualToHeight();
//
    abc.frame=CGRectMake(0,0, 60, 60);
    abc.center=self.center;
   [self addSubview:abc];
    
    [self.backWindow addSubview:self];
}

@end
