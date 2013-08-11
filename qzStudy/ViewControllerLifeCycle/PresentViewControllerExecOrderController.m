//
//  PresentViewControllerExecOrderController.m
//  ViewControllerLifeCycle
//
//  Created by 侯 坤明 on 13-8-7.
//  Copyright (c) 2013年 侯 坤明. All rights reserved.
//

#import "PresentViewControllerExecOrderController.h"
#import "PresentViewControllerExecOrderView.h"
#import "ViewController2.h"

@interface PresentViewControllerExecOrderController ()<PresentViewDelegate, ModalController>

@end

@implementation PresentViewControllerExecOrderController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (IBAction)goNext:(id)sender {
    ViewController2 *c2 = [[ViewController2 alloc] initWithNibName:@"ViewController2" bundle:nil];
    [self presentViewController:c2 animated:YES completion:^{
        
    }];
    c2.delegate = self;
}
- (IBAction)goHome:(id)sender {
    [self goHome];
}
-(void)goHome
{
    [self.presentingViewController dismissViewControllerAnimated:YES completion:^{
        
    }];
}

-(void)goPre
{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    ((PresentViewControllerExecOrderView *)self.view).delegate = self;
    NSLog(@"viewDidLoad");
    NSLog(@"isViewLoaded is %@", [self isViewLoaded] ? @"YES" : @"NO");
    NSLog(@"isBeingPresented is %@", self.isBeingPresented ? @"YES" : @"NO");
}

-(void)viewWillUnload
{
    [super viewWillUnload];
    NSLog(@"viewWillUnload");
}

-(void)viewDidUnload
{
    [super viewDidUnload];
    NSLog(@"viewDidUnload");
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSLog(@"viewWillAppear");
    NSLog(@"isBeingPresented is %@", self.isBeingPresented ? @"YES" : @"NO");
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    NSLog(@"viewDidAppear");
    NSLog(@"isBeingPresented is %@", self.isBeingPresented ? @"YES" : @"NO");
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    NSLog(@"viewWillDisappear");
    NSLog(@"isBeingDismissed is %@", self.isBeingDismissed ? @"YES" : @"NO");
}

-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    NSLog(@"viewDidDisappear");
    NSLog(@"isBeingDismissed is %@", self.isBeingDismissed ? @"YES" : @"NO");
}

-(void)gotoBackPage:(id)sender
{
    NSLog(@"isBeingDismissed is %@", self.isBeingDismissed ? @"YES" : @"NO");
//    [self dismissViewControllerAnimated:YES completion:^{
//        NSLog(@"completion,isBeingDismissed is %@", self.isBeingDismissed ? @"YES" : @"NO");
//    }];
    [self.presentingViewController dismissViewControllerAnimated:YES completion:^{
        
    }];
    NSLog(@"last, isBeingDismissed is %@", self.isBeingDismissed ? @"YES" : @"NO");
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
