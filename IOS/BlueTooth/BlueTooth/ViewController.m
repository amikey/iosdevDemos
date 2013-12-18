//
//  ViewController.m
//  BlueTooth
//
//  Created by 侯 坤明 on 13-12-13.
//  Copyright (c) 2013年 SAGO. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    UITextField *_input;
    CGFloat _currentY;
    MessageListView *_messageListView;
    UIView *_bottomBar;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor grayColor];
	
    _messageListView = [[MessageListView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, SCREEN_H - 40)];
    [self.view addSubview:_messageListView];
    
    _bottomBar = [[UIView alloc] initWithFrame:CGRectMake(0, SCREEN_H - 40, SCREEN_W, 40)];
    _bottomBar.backgroundColor = [UIColor blackColor];
    
    _input = [[UITextField alloc] initWithFrame:CGRectMake(2, 5, SCREEN_W - 54, 30)];
    _input.borderStyle = UITextBorderStyleRoundedRect;
    UIButton *sendBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    sendBtn.frame = CGRectMake(SCREEN_W - 50, 5, 50, 30);
    sendBtn.backgroundColor = [UIColor orangeColor];
    [sendBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [sendBtn setTitle:@"send" forState:UIControlStateNormal];
    
    [_bottomBar addSubview:_input];
    [_bottomBar addSubview:sendBtn];
    [self.view addSubview:_bottomBar];
    
    [sendBtn addTarget:self action:@selector(sendMessage) forControlEvents:UIControlEventTouchUpInside];
    
    _currentY = sendBtn.bounds.origin.y + sendBtn.bounds.size.height + 10;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(touched:)];
    [self.view addGestureRecognizer:tap];
    
    [self connect];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillApear:) name:UIKeyboardWillChangeFrameNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillDisapear:) name:UIKeyboardWillHideNotification object:nil];

}

- (void)sendMessage
{
    NSString *msg = _input.text;
    _input.text = @"";
    if(msg.length){
        [self sendDataToAllPeer:[msg dataUsingEncoding:NSUTF8StringEncoding]];
        [_messageListView addMessage:msg from:FROM_ME];
    }
}

- (void) receiveData:(NSData *)data
            fromPeer:(NSString *)peer
           inSession:(GKSession *)session
             context:(void *)context
{
    NSString *msg = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    [_messageListView addMessage:msg from:FROM_FRIEND];
}

- (void)touched: (id)sender
{
    [_input resignFirstResponder];
}

- (void)keyboardWillApear: (NSNotification *)keyboardNotification
{
    NSDictionary *info = keyboardNotification.userInfo;
    CGSize keyboardSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    CGRect frame = _bottomBar.frame;
    frame.origin.y = SCREEN_H - keyboardSize.height - frame.size.height;
    CGRect scrollFrame = _messageListView.frame;
    scrollFrame.size.height = SCREEN_H - keyboardSize.height - frame.size.height;
    [UIView animateWithDuration:0.2 animations:^{
        _bottomBar.frame = frame;
        _messageListView.frame = scrollFrame;
    }];
    [_messageListView scrollToBottom];
}

- (void)keyboardWillDisapear: (NSNotification *)keyboardNotification
{
    CGRect frame = _bottomBar.frame;
    frame.origin.y = SCREEN_H - 40;
    CGRect scrollFrame = _messageListView.frame;
    scrollFrame.size.height = SCREEN_H - frame.size.height;

    [UIView animateWithDuration:0.2 animations:^{
        _bottomBar.frame = frame;
        _messageListView.frame = scrollFrame;
    }];
    [_messageListView scrollToBottom];
}

@end
