//
//  ViewController.m
//  testNotifiction
//
//  Created by syswin on 2020/8/24.
//  Copyright © 2020 syswin. All rights reserved.
//

#import "ViewController.h"
#import "TQNotifTool.h"

@interface ViewController ()
@property(nonatomic ,weak)UILabel  * lable;

@property(nonatomic ,strong)NSTimer * timer;
@end

@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
//// 1


  [[TQNotifTool  share]  registAction:^{
      NSLog(@"1123214123451");
        
    } name:@"atest" withObjc:self];

    

  
    



    
    //4
  

    
//    dispatch_async(dispatch_get_main_queue(), ^{
//        NSLog(@"1");
//
//    });
//
//    dispatch_async(dispatch_get_global_queue(0, 0), ^{
//        NSLog(@"3");
//        NSLog(@"%@",[NSThread  currentThread]);
//
//         });
//
//        NSLog(@"4");
//
//    dispatch_sync(dispatch_get_global_queue(0, 0), ^{
//        NSLog(@"22%@",[NSThread  currentThread]);
//        NSLog(@"2");
//
//
//    });
//
//
    

//        cc = nil;
    
//    NSLog(@"%@",c);
    
//    NSLog(@"%ld",CFGetRetainCount((__bridge    CFTypeRef)(cc)));

    

//    NSLog(@"外面%@",[NSThread  currentThread]);
  

    //2

    


    


    //3
    

    //2 和 3优先级一样顺序执行 也都是在主线程中

    
  

    //
     
    

    
    


    
    

    
//    UILabel * lable = [UILabel new];
//    _lable = lable;
//    [self.view addSubview:lable];
    
//    __block int blockLocal  = 100;
//      static int staticLocal  = 100;
//
//      void (^aBlock)(void) = ^(void){
//
//          blockLocal++;
//          staticLocal++;
//      };
//
//      NSLog(@"----blockLocal--%d",blockLocal);
//      NSLog(@"---staticLocal--%d",staticLocal);
//
//      aBlock();
//
//      NSLog(@"----blockLocal--%d",blockLocal);
//      NSLog(@"---staticLocal--%d",staticLocal);
    
    // Do any additional setup after loading the view.
}

-(void)viewDidAppear:(BOOL)animated{
//    [super viewWillAppear: YES];
//    [[TQNotifTool share] postActionWithName:@"atest"];
}



-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    [[TQNotifTool  share] postActionWithName:@"atest"];

    [self.navigationController pushViewController:[NSClassFromString(@"SecondViewController") new] animated:YES];

}

@end
