//
//  TQNotifTool.m
//  testNotifiction
//
//  Created by syswin on 2020/8/24.
//  Copyright © 2020 syswin. All rights reserved.
//

#import "TQNotifTool.h"
#import <objc/runtime.h>

static TQNotifTool *sigel = nil;

@implementation TQNotifTool

+(instancetype)share{
    return [[self  alloc]init];
}


+(instancetype)allocWithZone:(struct _NSZone *)zone{
  static dispatch_once_t onceToken;
       dispatch_once(&onceToken, ^{
           sigel = [super allocWithZone:zone];
       });
       return sigel;
}

-(void)registAction:(void(^)(void))block  name:(NSString *)str  withObjc:(NSObject *)objc{
    
    objc_setAssociatedObject([ TQNotifTool share], (__bridge const void * _Nonnull)(str) , [self customAddblock:block  withStr:str withObjc:objc], OBJC_ASSOCIATION_RETAIN);
    NSLog(@"%@",NSStringFromSelector(_cmd));

}

-(void)removeBlockWithObjc:(NSObject *)objc withName:(NSString *)str{
    NSMutableDictionary * dic = objc_getAssociatedObject([TQNotifTool share], CFBridgingRetain(str));
//    NSMutableDictionary * dic
    if (dic) {
        NSInteger  count = dic.count;
        while (count) {
            if ([dic.allKeys[count-1] isEqualToString:objc.description]) {
                [dic removeObjectForKey:objc.description];
            }
            count--;
        }
           
    }

}

-(void)postActionWithName:(NSString *)str{
    NSMutableDictionary * dic = objc_getAssociatedObject([TQNotifTool share], CFBridgingRetain(str));
    if (dic) {
            for (int i = 0; i < dic.allValues.count ; i++) {
            void(^block)(void) = dic.allValues[i];
            block();
        }
    }

}

-(NSMutableDictionary *)customAddblock:(void(^)(void))block  withStr:(NSString *)name  withObjc:(NSObject *)objc{
    
    NSMutableDictionary * dic = objc_getAssociatedObject([TQNotifTool share], CFBridgingRetain(name));;
        if (dic == nil) {
            dic = [NSMutableDictionary dictionary];
            [dic setValue:block forKey:objc.description];
        }else{
            if (![dic.allValues containsObject:block]) {
               [dic setValue:block forKey:objc.description];
            }
        }
    return  dic;
}

-(void)removeActionWithName:(NSString *)str{
        objc_setAssociatedObject([ TQNotifTool share], (__bridge const void * _Nonnull)(str) , nil, OBJC_ASSOCIATION_RETAIN);
           NSLog(@"%@",NSStringFromSelector(_cmd));
        

}

@end
