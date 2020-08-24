//
//  TQNotifTool.h
//  testNotifiction
//
//  Created by syswin on 2020/8/24.
//  Copyright © 2020 syswin. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TQNotifTool : NSObject

+(instancetype)share;

-(void)registAction:(void(^)(void))block   name:(NSString *)str;

-(void)postActionWithName:(NSString *)str;

-(void)removeActionWithName:(NSString *)str;

@end

NS_ASSUME_NONNULL_END
