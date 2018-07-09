//
//  TQLoginHomeVC.m
//  ZeroIosDemo
//
//  Created by Tianq on 2018/7/8.
//  Copyright © 2018年 zeluo. All rights reserved.
//

#import "TQLoginHomeVC.h"
#import "AFNetworking.h"

@interface TQLoginHomeVC ()

@end

@implementation TQLoginHomeVC




- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSString *url = @"http://118.25.105.109:8001/Help/Api/POST-Customer-LoginCustomer";
    //创建请求地址
    //NSString *url=@"http://api.nohttp.net/postBody";
    //构造参数
    NSDictionary *Body = @{@"CellphoneNo": @"18969123461",
                           @"PassWord": @"12345"};
    NSDictionary *parameters=@{@"Body":Body};//TQ0709

   
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
   
    [manager POST:url parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {

    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
 NSLog(@"responseObject-->%@",responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
NSLog(@"error-->%@",error);
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
