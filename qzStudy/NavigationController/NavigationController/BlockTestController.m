//
//  BlockTestController.m
//  NavigationController
//
//  Created by 侯 坤明 on 13-8-5.
//  Copyright (c) 2013年 侯 坤明. All rights reserved.
//

#import "BlockTestController.h"
#import "AsyncImage.h"

@interface BlockTestController ()<AsyncImage>

@end

@implementation BlockTestController

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
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn setTitle:@"1.正确的block变量引用" forState:UIControlStateNormal];
    btn.frame = CGRectMake(10, 20, 300, 30);
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(runBlockTest:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn2 setTitle:@"2.错误的block变量引用" forState:UIControlStateNormal];
    btn2.frame = CGRectMake(10, 60, 300, 30);
    [self.view addSubview:btn2];
    [btn2 addTarget:self action:@selector(runWrongBlockTest:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *btn3 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn3 setTitle:@"3.block+(assign)delegate导致野指针" forState:UIControlStateNormal];
    btn3.frame = CGRectMake(10, 100, 300, 30);
    [self.view addSubview:btn3];
    [btn3 addTarget:self action:@selector(runWrongBlockTest_assign_error:) forControlEvents:UIControlEventTouchUpInside];

    
    UIButton *btn4 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn4 setTitle:@"4.修正block+(assign)delegate野指针错误" forState:UIControlStateNormal];
    btn4.frame = CGRectMake(10, 140, 300, 30);
    [self.view addSubview:btn4];
    [btn4 addTarget:self action:@selector(runWrongBlockTest_assign_right:) forControlEvents:UIControlEventTouchUpInside];

    
    self.title = @"Block Demos";
    UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(10, 180, [UIScreen mainScreen].bounds.size.width - 20, 220)];
    textView.font = [UIFont fontWithName:@"arial" size:12];
    textView.text = @"这是一个block测试demo，运行结果要看log出来的dealloc顺序和时间，测试方法：点击一个上面的按钮，然后马上点击导航栏的Home，可以看到不同的log时间间隔和顺序\n 1. 正确的block通过使用__weak前缀重定义为弱引用类型避免了循环引用，当block未执行完就点击导航栏的返回按钮时，__weak类型的变量会自动清空成nil, 'Right Block'页面、'AsyncImage'页面和'DeallocTest页面都能及时dealloc; \n 2. 错误的block未使用__weak前缀，默认为strong强引用，使得使用block的页面(AsyncImage)的dealloc需要等到block执行完成才能调用到，如果block中出现问题一直未执行，则这里的变量则一直得不到释放而产生内存泄露;\n 3. 错误的block + (assign)delegate, 导致delegate被释放后形成野指针而crash; \n 4. block + (assign)delegate 强制把delegate转换成weak，解决野指针问题";
    [self.view addSubview:textView];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//运行正确的block demo
//这里跟下面三个有一点不一样，_asyncLoad是当前controller的成员变量，所以其dealloc的调用是在点击导航栏的Home按钮即当前controller dealloc后才会被调用，而后面的 AsyncImage 申明方式是在方法内部，当点击运行正确的block（第4个）的按钮后马上就dealloc了

-(IBAction)runBlockTest:(id)sender
{
    _asyncLoad = [[AsyncImage alloc] init];
    _asyncLoad.delegate = self;
    [_asyncLoad loadImageWithUrl:@"http://img.xoyin.com/hulu/1/20120906/ccc2dfa7-e483-436c-b707-dfeb3d42143f.jpg"];
}

//运行错误的block demo
-(IBAction)runWrongBlockTest:(id)sender
{
    AsyncImage *testAsyncImage = [[AsyncImage alloc] init];
    testAsyncImage.delegate = self;
    [testAsyncImage wrongBlock_loadImageWithUrl:@"http://img.xoyin.com/hulu/1/20120906/ccc2dfa7-e483-436c-b707-dfeb3d42143f.jpg"];
}

//产生野指针demo
-(IBAction)runWrongBlockTest_assign_error:(id)sender
{
    AsyncImage *testAsyncImage = [[AsyncImage alloc] init];
    testAsyncImage.assignDelegate = self;
    [testAsyncImage assignDelegate_wrong_loadImageWithUrl:@"http://img.xoyin.com/hulu/1/20120906/ccc2dfa7-e483-436c-b707-dfeb3d42143f.jpg"];
}

//解决野指针demo
-(IBAction)runWrongBlockTest_assign_right:(id)sender
{
    AsyncImage *testAsyncImage = [[AsyncImage alloc] init];
    testAsyncImage.assignDelegate = self;
    [testAsyncImage assignDelegate_changeToWeak_loadImageWithUrl:@"http://img.xoyin.com/hulu/1/20120906/ccc2dfa7-e483-436c-b707-dfeb3d42143f.jpg"];
}


-(void)loadedImage:(UIImage *)image
{
    NSLog(@"loaded image");
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    imageView.frame = CGRectMake(10, 300, 300, 200);
    [self.view addSubview:imageView];
}

-(void)dealloc
{
    NSLog(@"Block test page dealloced");
}


@end
