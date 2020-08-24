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

-(void)registAction:(void(^)(void))block  name:(NSString *)str{
    
    objc_setAssociatedObject([ TQNotifTool share], (__bridge const void * _Nonnull)(str) , [self customAddblock:block  withStr:str], OBJC_ASSOCIATION_RETAIN);
    NSLog(@"%@",NSStringFromSelector(_cmd));

}
-(void)postActionWithName:(NSString *)str{
    NSMutableArray * array = objc_getAssociatedObject([TQNotifTool share], CFBridgingRetain(str));
    if (array) {
            for (int i = 0; i < array.count ; i++) {
            void(^block)(void) = array[i];
            block();
        }
    }

}

-(NSMutableArray *)customAddblock:(void(^)(void))block  withStr:(NSString *)name {
    
    NSMutableArray * array = objc_getAssociatedObject([TQNotifTool share], CFBridgingRetain(name));;
        if (array == nil) {
            array = [NSMutableArray new];
            [array addObject:block];
        }else{
            if (![array containsObject:block]) {
                [array addObject:block];
            }
        }
    return  array;
}

-(void)removeActionWithName:(NSString *)str{
        objc_setAssociatedObject([ TQNotifTool share], (__bridge const void * _Nonnull)(str) , nil, OBJC_ASSOCIATION_RETAIN);
           NSLog(@"%@",NSStringFromSelector(_cmd));
        

}

@end
