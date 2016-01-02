//
//  ViewController.m
//  02-tomcat
//
//  Created by zhanglu1988em on 16/1/2.
//  Copyright © 2016年 wbder. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)knockout:(UIButton *)sender {
    [self perfAnimationWithName:@"knockout" :81];
}

- (IBAction)eatBird:(id)sender {

    [self perfAnimationWithName:@"eat" :40];
    
    
}

-(IBAction) actionAnimation:(UIButton*) button
{
     [self perfAnimationWithName:button.currentTitle :button.tag];
}

/*
 imageNamed:  存放比较常用的图片 ，有系统负责回收内存，不能把不常用，并且耗内存的图片存放到 Assets.xcassets 里面，否则pathForResource 无法找到图片
 imageWithContentsOfFile: 适合临时用，非常耗内存。
 
 */
-(void) perfAnimationWithName :(NSString*)name :(int) imageCount
{
    
    if ([self.imageView isAnimating]) {
        return;
    }
    NSMutableArray *arryM = [NSMutableArray array];
    for (int i = 0; i < imageCount;  ++i ) {
        NSString *imageName = [NSString stringWithFormat:@"%@_%02d.jpg",name,i];
        //[arryM addObject:[UIImage imageNamed:imageName]];
        NSString *path = [[NSBundle mainBundle] pathForResource:imageName ofType:nil];
        [arryM addObject:[UIImage imageWithContentsOfFile:path]];
    }
    
#if 1 // 首位动画
    [self.imageView setAnimationImages:arryM];
    [self.imageView setAnimationDuration: imageCount * 0.075];
    [self.imageView setAnimationRepeatCount:1];
    [self.imageView startAnimating];
    
    [self.imageView performSelector:@selector(setAnimationImages:) withObject:nil afterDelay:self.imageView.animationDuration ];
#endif
}

@end
