//
//  TextAndPictureViewController.m
//  TextKitDemo
//
//  Created by 侯 坤明 on 14-8-13.
//  Copyright (c) 2014年 侯 坤明. All rights reserved.
//

#import "TextAndPictureViewController.h"

@interface TextAndPictureViewController ()

@property (strong, nonatomic) UITextView *textView;
@property (strong, nonatomic) NSTextStorage *textStorage;

@end

@implementation TextAndPictureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSLayoutManager *layoutManager = [NSLayoutManager new];
    NSString *string = [NSString stringWithContentsOfURL:[NSBundle.mainBundle URLForResource:@"text" withExtension:@"txt"] usedEncoding:NULL error:NULL];
    _textStorage = [[NSTextStorage alloc] initWithString:string];
    [_textStorage addLayoutManager:layoutManager];
    NSTextContainer *textContainer = [NSTextContainer new];
    [layoutManager addTextContainer:textContainer];
    _textView = [[UITextView alloc] initWithFrame:self.view.bounds textContainer:textContainer];
    [self.view addSubview:_textView];
    
    UIImage *image = [UIImage imageNamed:@"pic1"];
    
    CGRect rect = CGRectMake(5, 5, 100, 100);
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:rect];
    imageView.image = image;
    
    CGRect pathRect = CGRectMake(rect.origin.x - 2, rect.origin.y - 8, rect.size.width + 4, rect.size.height+4);
    
    CGRect rect2 = CGRectMake(80, 150, 100, 100);
    UIImageView *imageView2 = [[UIImageView alloc] initWithFrame:rect2];
    imageView2.image = image;
    imageView2.layer.masksToBounds = YES;
    imageView2.layer.cornerRadius = 50;
    [self.textView addSubview:imageView2];
    
    textContainer.exclusionPaths = @[[UIBezierPath bezierPathWithRect:pathRect],
                                     [UIBezierPath bezierPathWithOvalInRect:CGRectMake(rect2.origin.x - 2, rect2.origin.y - 8, rect2.size.width + 4, rect2.size.height + 4)]
                                     ];
    
    [self.textView addSubview:imageView];
    
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
