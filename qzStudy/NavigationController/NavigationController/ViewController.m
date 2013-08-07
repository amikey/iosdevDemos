//
//  ViewController.m
//  NavigationController
//
//  Created by 侯 坤明 on 13-8-5.
//  Copyright (c) 2013年 侯 坤明. All rights reserved.
//

#import "ViewController.h"
#import "BlockTestController.h"
#import "CircularReferencesByDelegate.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.title = @"HOME";
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20, 150, 300, 200)];
    label.lineBreakMode = UILineBreakModeWordWrap;
    label.numberOfLines = 0;
    label.text = @"指针释放在block和delegate两种场景的测试demo";
    label.backgroundColor = [UIColor clearColor];
    [self.view addSubview:label];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn setTitle:@"block 中变量引用DEMO" forState:UIControlStateNormal];
    btn.frame = CGRectMake(20, 50, 260, 30);
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(gotoBlockPage:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn2 setTitle:@"Delegate 循环引用DEMO" forState:UIControlStateNormal];
    btn2.frame = CGRectMake(50, 100, 200, 30);
    [self.view addSubview:btn2];
    
    [btn2 addTarget:self action:@selector(gotoCircularReferencesPage:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)gotoBlockPage:(id)sender
{
    BlockTestController *blockPage = [[BlockTestController alloc] init];
    [self.navigationController pushViewController:blockPage animated:YES];
}

-(IBAction)gotoCircularReferencesPage:(id)sender
{
    CircularReferencesByDelegate *page = [[CircularReferencesByDelegate alloc] init];
    [self presentViewController:page animated:YES completion:^{
        NSLog(@"presentViewController complete, presented is: %@", self.presentedViewController);
        
    }];
}

@end
