//
//  TQUserModel.h
//  ZeroIos
//
//  Created by Tianq on 2018/5/18.
//  Copyright © 2018年 zeluo. All rights reserved.
//

#import <Foundation/Foundation.h>
@class TQIdNumber;
@interface TQUserModel : NSObject
@property (nonatomic, copy) NSArray<TQIdNumber *> *idNumberArray;
@property (nonatomic, copy) NSString *nickName;
@property (nonatomic, copy) NSString *imageName;
@property (nonatomic, copy) NSString *realName;
@property (nonatomic, copy) NSNumber *distance;
@property (nonatomic, copy) NSString *signature;
@property (nonatomic, copy) NSString *SourceSysNo;
@property (nonatomic, assign) BOOL gender;
@end

@interface TQIdNumber : NSObject
@property (nonatomic, copy) NSNumber *idNumber;
@property (nonatomic, copy) NSNumber *idValue;
@end
