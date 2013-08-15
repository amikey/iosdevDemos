//
//  ViewController.m
//  Animate
//
//  Created by 侯 坤明 on 13-8-11.
//  Copyright (c) 2013年 侯 坤明. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource

@end

@implementation ViewController
- (IBAction)btnClicked:(id)sender {
    [UIView animateWithDuration:4 delay:0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
        CGRect rect = self.btn.frame;
        rect.origin.x = arc4random() % (int)self.view.bounds.size.width;
        rect.origin.y = arc4random() % (int)self.view.bounds.size.height;
        self.btn.frame = rect;
    }completion:^(BOOL finished){
    }];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
