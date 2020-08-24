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

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[TQNotifTool share] registAction:^{
        
        NSLog(@"1234");
        
    }  name:@"atest"];
    
    
    
    [[TQNotifTool share] registAction:^{
          
          NSLog(@"456");
          
      }  name:@"atest"];
      
     [[TQNotifTool share] registAction:^{
          
          NSLog(@"789");
          
      }  name:@"atesrrrt"];
      
    
    
    // Do any additional setup after loading the view.
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [[TQNotifTool share] postActionWithName:@"atest"];
    
   // [self.navigationController pushViewController:[NSClassFromString(@"SecondViewController") new] animated:YES];

}

@end
