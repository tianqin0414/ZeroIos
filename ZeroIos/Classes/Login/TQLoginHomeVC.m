//
//  TQLoginHomeVC.m
//  ZeroIosDemo
//
//  Created by Tianq on 2018/7/8.
//  Copyright © 2018年 zeluo. All rights reserved.
//

#import "TQLoginHomeVC.h"
#import "AFNetworking.h"
#import "TQUserModel.h"
#import <MJExtension/MJExtension.h>

@interface TQLoginHomeVC ()

@end

@implementation TQLoginHomeVC




- (void)viewDidLoad {
    [super viewDidLoad];
    
    //初始化
    TIMManager * manager = [TIMManager sharedInstance];
    
    TIMSdkConfig *config = [[TIMSdkConfig alloc] init];
    config.sdkAppId = 1400087480 ;
    config.accountType = @"26011";
    config.disableCrashReport = NO;
    config.logLevel=1;
    //config.connListener = self;
    config.disableLogPrint = YES;
    int i = [manager initSdk:config];
    //NSLog(@"数字是----->%d",i);
    //创建请求地址
    NSString *url = @"http://118.25.105.109:8001/Customer/LoginCustomer";
   
    //构造参数
    NSDictionary *body = @{@"CellphoneNo": @"18969123461",
                           @"PassWord": @"12345"};
    NSDictionary *parameters=@{@"Body":body};//TQ0709

   
    //AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
   
    // 获得请求管理者
    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    

    [session POST:url parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {

//        TQBody *body = [TQBody mj_objectWithKeyValues:responseObject[@"Body"]];
        TQUserModel *body = [TQUserModel mj_objectWithKeyValues:responseObject[@"Body"]];
        NSString *sig = body.SourceSysNo;
        NSLog(@"responseObject-->%@",sig);
        TIMLoginParam * login_param = [[TIMLoginParam alloc ]init];
        // identifier 为用户名，userSig 为用户登录凭证
        // appidAt3rd 在私有帐号情况下，填写与 sdkAppId 一样
        login_param.identifier =@"Sign10";
        login_param.userSig = sig;
        login_param.appidAt3rd = @"1400087480";
        [[TIMManager sharedInstance] login: login_param succ:^(){
            NSLog(@"Login Succ");
        } fail:^(int code, NSString * err) {
            NSLog(@"Login Failed: %d->%@", code, err);
        }];
        TIMConversation *conversation = [TIMConversation new];
        TIMTextElem * text_elem = [[TIMTextElem alloc] init];
        [text_elem setText:@"this is a text message"];
        TIMMessage * msg = [[TIMMessage alloc] init];
        [msg addElem:text_elem];
        [conversation sendMessage:msg succ:^(){
            NSLog(@"SendMsg Succ");
        }fail:^(int code, NSString * err) {
            NSLog(@"SendMsg Failed:%d->%@", code, err);
        }];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//NSLog(@"error-->%@",error);
    }];
    
    
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
