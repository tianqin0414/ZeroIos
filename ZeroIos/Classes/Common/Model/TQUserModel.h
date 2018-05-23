//
//  TQUserModel.h
//  ZeroIos
//
//  Created by Tianq on 2018/5/18.
//  Copyright © 2018年 zeluo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TQUserModel : NSObject
@property (nonatomic, copy) NSString *Id;
@property (nonatomic, copy) NSString *nickName;
@property (nonatomic, copy) NSString *imageName;
@property (nonatomic, copy) NSString *realName;
@property (nonatomic, copy) NSNumber *distance;
@property (nonatomic, assign) BOOL gender;
@end
