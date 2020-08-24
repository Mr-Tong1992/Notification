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

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[TQNotifTool share] removeActionWithName:@"atest"];
    // Do any additional setup after loading the view.
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
