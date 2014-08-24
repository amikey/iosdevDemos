//
//  HighLightViewController.m
//  TextKitDemo
//
//  Created by 侯 坤明 on 14-8-14.
//  Copyright (c) 2014年 侯 坤明. All rights reserved.
//

#import "HighLightViewController.h"

@interface HighLightViewController ()

@property (strong, nonatomic)NSTextStorage *textStorage;
@property (strong, nonatomic)UITextView *textView;

@end

@implementation HighLightViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSString *string = [NSString stringWithContentsOfURL:[NSBundle.mainBundle URLForResource:@"text" withExtension:@"txt"] usedEncoding:NULL error:NULL];
    
    _textStorage = [[NSTextStorage alloc] initWithString:string];
    
    NSLayoutManager *layoutManager = [[NSLayoutManager alloc] init];
    [_textStorage addLayoutManager:layoutManager];
    
    NSTextContainer *textContainer = [NSTextContainer new];
    [layoutManager addTextContainer:textContainer];
    
    NSRegularExpression *regular = [NSRegularExpression regularExpressionWithPattern:@"周易|易经" options:0 error:NULL];
    [regular enumerateMatchesInString:string options:0 range:NSMakeRange(0, string.length) usingBlock:^(NSTextCheckingResult *result, NSMatchingFlags flags, BOOL *stop) {
        [_textStorage addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:result.range];
    }];
    
    
    _textView = [[UITextView alloc] initWithFrame:self.view.bounds textContainer:textContainer];
    [self.view addSubview:_textView];
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
