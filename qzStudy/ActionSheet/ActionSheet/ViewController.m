//
//  ViewController.m
//  ActionSheet
//
//  Created by 侯 坤明 on 13-8-12.
//  Copyright (c) 2013年 侯 坤明. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIAlertViewDelegate, UIActionSheetDelegate>
{
    UIAlertView *alert;
    UIActionSheet *actionSheet;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
}
- (IBAction)showNormalAlert:(id)sender {
    alert = [[UIAlertView alloc] initWithTitle:@"title" message:@"msg" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
    alert.title = @"Title";
    alert.message = @"message";
    
    alert.alertViewStyle = UIAlertViewStyleDefault;
    alert.delegate = self;
    [alert show];
    
}
- (IBAction)inputAlert:(id)sender {
    alert = [[UIAlertView alloc] initWithTitle:@"input alert" message:@"msg" delegate:self cancelButtonTitle:@"NO" otherButtonTitles:@"YES", nil];
    alert.alertViewStyle = UIAlertViewStylePlainTextInput;
    [alert show];
}
- (IBAction)secureInputAlert:(id)sender {
    alert = [[UIAlertView alloc] initWithTitle:@"secure input alert" message:@"msg" delegate:self cancelButtonTitle:@"NO" otherButtonTitles:@"YES", nil];
    alert.alertViewStyle = UIAlertViewStyleSecureTextInput;
    [alert show];
}

- (IBAction)loginAlert:(id)sender {
    alert = [[UIAlertView alloc] initWithTitle:@"secure input alert" message:@"msg" delegate:self cancelButtonTitle:@"NO" otherButtonTitles:@"YES", nil];
    alert.alertViewStyle = UIAlertViewStyleLoginAndPasswordInput;
    [alert textFieldAtIndex:0].text = @"default";
    [alert show];
}
- (IBAction)acSheet:(id)sender {
    actionSheet = [[UIActionSheet alloc] initWithTitle:@"title" delegate:self cancelButtonTitle:@"NO" destructiveButtonTitle:@"OK" otherButtonTitles:@"other", nil];
    [actionSheet showInView:self.view];
}
- (IBAction)acSheet2:(id)sender {
    actionSheet = [[UIActionSheet alloc] initWithTitle:@"title" delegate:self cancelButtonTitle:@"NO" destructiveButtonTitle:@"OK" otherButtonTitles:@"other", nil];
    actionSheet.actionSheetStyle = UIActionSheetStyleBlackOpaque;
    [actionSheet showInView:self.view];
}
- (IBAction)acSheet3:(id)sender {
    actionSheet = [[UIActionSheet alloc] initWithTitle:@"title" delegate:self cancelButtonTitle:@"NO" destructiveButtonTitle:@"OK" otherButtonTitles:@"other", nil];
    actionSheet.actionSheetStyle = UIActionSheetStyleBlackTranslucent;
    [actionSheet showInView:self.view];
}
- (IBAction)acSheet4:(id)sender {
    actionSheet = [[UIActionSheet alloc] initWithTitle:@"title" delegate:self cancelButtonTitle:@"NO" destructiveButtonTitle:@"OK" otherButtonTitles:@"other", nil];
    actionSheet.actionSheetStyle = UIActionSheetStyleAutomatic;
    [actionSheet showInView:self.view];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)alertView:()alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSLog(@"you clicked %d", buttonIndex);
    
    if(alert.alertViewStyle == UIAlertViewStyleSecureTextInput || alert.alertViewStyle == UIAlertViewStylePlainTextInput){
        UITextField *t1 = [alert textFieldAtIndex:0];
        NSLog(t1.text);
    }
    
    if(alert.alertViewStyle == UIAlertViewStyleLoginAndPasswordInput){
        UITextField *t1 = [alert textFieldAtIndex:0];
        NSLog(t1.text);
        UITextField *t2 = [alert textFieldAtIndex:1];
        NSLog(t2.text);
    }
    
    
}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSLog(@"you clicked %d", buttonIndex);
}



@end
