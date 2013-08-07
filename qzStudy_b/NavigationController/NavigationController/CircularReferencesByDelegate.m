//
//  CircularReferencesByDelegate.m
//  NavigationController
//
//  Created by 侯 坤明 on 13-8-6.
//  Copyright (c) 2013年 侯 坤明. All rights reserved.
//

#import "CircularReferencesByDelegate.h"
#import "WrongDelegateClass.h"

@interface CircularReferencesByDelegate ()

@end

@implementation CircularReferencesByDelegate

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //这里循环引用了
    self.wrongDelegate= [[WrongDelegateClass alloc] init];
    self.wrongDelegate.delegate = self;
    
    
    UILabel *lable = [[UILabel alloc] init];
    lable.text = @"这是一个delegate循环引用的实例，此页面把一个强引用的delegate指向了自己，在点击返回按钮时此页面将无法释放, dealloc无法调用，DOMO效果需要查看log";
    lable.frame = CGRectMake(10, 50, 300, 200);
    lable.lineBreakMode = UILineBreakModeWordWrap;
    lable.numberOfLines = 0;
    [self.view addSubview:lable];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn setTitle:@"返回" forState:UIControlStateNormal];
    btn.frame = CGRectMake(50, 10, 100, 30);
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(backup:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)backup:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:^{
        NSLog(@"CircularReferencesPage dismissViewController complete");
    }];
}

-(void)dealloc
{
    NSLog(@"CircurlarReferencesByDelegate have realloced");
}

@end
