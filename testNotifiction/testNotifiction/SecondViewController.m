//
//  SecondViewController.m
//  testNotifiction
//
//  Created by syswin on 2020/8/24.
//  Copyright © 2020 syswin. All rights reserved.
//

#import "SecondViewController.h"
#import "TQNotifTool.h"

@interface SecondViewController ()
@property(nonatomic ,strong)NSTimer * timer;

@property(nonatomic ,strong)NSString  * text;
@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[TQNotifTool  share]  registAction:^{
        NSLog(@"fafaf");

    } name:@"atest" withObjc:self];
    
    [[TQNotifTool  share]  registAction:^{
        NSLog(@"fafaf");
          
      } name:@"atest" withObjc:self];

}


-(void)dealloc{
    [[TQNotifTool share] removeBlockWithObjc:self withName:@"atest"];
    [[TQNotifTool  share] postActionWithName:@"atest"];

    NSLog(@"%@dealloc",NSStringFromClass(self.class));
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [[TQNotifTool  share] postActionWithName:@"atest"];
    
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
