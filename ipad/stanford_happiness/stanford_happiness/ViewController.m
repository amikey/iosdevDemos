//
//  ViewController.m
//  stanford_happiness
//
//  Created by 侯 坤明 on 13-7-6.
//  Copyright (c) 2013年 侯 坤明. All rights reserved.
//

#import "ViewController.h"
#import "FaceView.h"

@interface ViewController ()<FaceViewDataSource>
@property (nonatomic, weak) IBOutlet FaceView *faceView;
@end

@implementation ViewController
@synthesize happiness = _happiness;
@synthesize faceView = _faceView;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}
-(void)setHappiness:(NSInteger)happiness
{
    _happiness = happiness;
    [self.faceView setNeedsDisplay];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setFaceView:(FaceView *)faceView{
    _faceView = faceView;
    UIGestureRecognizer *gesture = [[UIPinchGestureRecognizer alloc] initWithTarget:self.faceView action:@selector(pinch:)];
    [self.faceView addGestureRecognizer:gesture];
    [self.faceView addGestureRecognizer:[[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panHandle:)]];
    self.faceView.dataSource = self;
}

-(float)smileForFaceView:(FaceView *)sender
{
    return (self.happiness - 50)/50.0;
}
-(void)panHandle:(UIPanGestureRecognizer *)gesture
{ 
    if(gesture.state == UIGestureRecognizerStateChanged || gesture.state == UIGestureRecognizerStateEnded)
    {
        CGPoint translation = [gesture translationInView:self.faceView];
        self.happiness -= translation.y/2;
        [gesture setTranslation:CGPointZero inView:self.faceView];
    }
}

@end
