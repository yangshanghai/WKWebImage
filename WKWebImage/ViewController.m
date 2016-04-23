//
//  ViewController.m
//  WKWebImage
//
//  Created by Welkin Xie on 3/10/16.
//  Copyright © 2016 WelkinXie. All rights reserved.
//
//  Github: https://github.com/WelkinXie/WKWebImage
//

#import "ViewController.h"
#import "WKWebImage.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 方案一
    //
//    [_imageView wk_setImageWithURL:[NSURL URLWithString:@"http://7xneqd.com1.z0.glb.clouddn.com/fiveinarow.png"]];
    
    // 方案二
    // 设置placeholder
    [_imageView wk_setImageWithURL:[NSURL URLWithString:@"http://7xneqd.com1.z0.glb.clouddn.com/fiveinarow.png"] placeholder:[UIImage imageNamed:@"Spaceship"]];
    
    // 方案三
    // 设置回调
//    [_imageView wk_setImageWithURL:[NSURL URLWithString:@"http://7xneqd.com1.z0.glb.clouddn.com/fiveinarow.png"] completion:^(UIImage *image) {
//        NSLog(@"%@", image);
//    }];
    
    // 方案四
    // placeholder + 回调
//    [_imageView wk_setImageWithURL:[NSURL URLWithString:@"http://7xneqd.com1.z0.glb.clouddn.com/fiveinarow.png"] placeholder:[UIImage imageNamed:@"Spaceship"] completion:^(UIImage *image) {
//        NSLog(@"%@", image);
//    }];
    
    // 清除内存中的缓存
//    [[WKWebImageManager sharedManager] clearMemory];
    
    //清除本地的缓存
    [[WKWebImageManager sharedManager] clearDisk];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
