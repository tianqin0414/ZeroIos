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

        TQBody *body = [TQBody mj_objectWithKeyValues:responseObject[@"Body"]];
//        Body *user = [Body mj_objectWithKeyValues:responseObject];//TQ0711
        NSLog(@"responseObject-->%@",body);
        
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
