//
//  ViewController.m
//  SKExtension
//
//  Created by CFsyk on 2017/10/16.
//  Copyright © 2017年 CFsyk. All rights reserved.
//

#import "ViewController.h"
#import "SKExtension.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImage *img = [UIColor createImageWithColor:[UIColor redColor]];
    UIImageView *imageV = [UIImageView new];
    imageV.frame = CGRectMake(0, 0, 100, 100);
    imageV.image = img;
    [self.view addSubview:imageV];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
