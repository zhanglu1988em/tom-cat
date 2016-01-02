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

-(void) perfAnimationWithName :(NSString*)name :(int) imageCount
{
    
    if ([self.imageView isAnimating]) {
        return;
    }
    NSMutableArray *arryM = [NSMutableArray array];
    for (int i = 0; i < imageCount;  ++i ) {
        NSString *imageName = [NSString stringWithFormat:@"%@_%02d.jpg",name,i];
        [arryM addObject:[UIImage imageNamed:imageName]];
    }
    [self.imageView setAnimationImages:arryM];
    [self.imageView setAnimationDuration: imageCount * 0.075];
    [self.imageView setAnimationRepeatCount:1];
    [self.imageView startAnimating];
}

@end
