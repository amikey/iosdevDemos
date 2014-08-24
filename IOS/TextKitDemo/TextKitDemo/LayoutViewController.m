//
//  LayoutViewController.m
//  TextKitDemo
//
//  Created by 侯 坤明 on 14-8-14.
//  Copyright (c) 2014年 侯 坤明. All rights reserved.
//

#import "LayoutViewController.h"
#import "MyLayoutManager.h"

@interface LayoutViewController ()

@property (strong, nonatomic)NSTextStorage *textStorage;
@property (strong, nonatomic)UITextView *textView;

@end

@implementation LayoutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSString *string = [NSString stringWithContentsOfURL:[NSBundle.mainBundle URLForResource:@"text" withExtension:@"txt"] usedEncoding:NULL error:NULL];
    
    _textStorage = [NSTextStorage new];
    [_textStorage replaceCharactersInRange:NSMakeRange(0, 0) withString:string];
    
    MyLayoutManager *layoutManager = [MyLayoutManager new];
    [_textStorage addLayoutManager:layoutManager];
    
    NSTextContainer *textContainer = [NSTextContainer new];
    [layoutManager addTextContainer:textContainer];
    
    _textView = [[UITextView alloc] initWithFrame:self.view.bounds textContainer:textContainer];
    [self.view addSubview:_textView];
    
    
    NSRegularExpression *regular = [[NSRegularExpression alloc] initWithPattern:@"周易|易经" options:0 error:NULL];
    [regular enumerateMatchesInString:string options:0 range:NSMakeRange(0, string.length) usingBlock:^(NSTextCheckingResult *result, NSMatchingFlags flags, BOOL *stop) {
        [_textStorage addAttribute:NSUnderlineStyleAttributeName value:@(NSUnderlineStyleDouble) range:result.range];
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
