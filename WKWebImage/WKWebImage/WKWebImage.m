//
//  WKWebImage.m
//  StepCounter
//
//  Created by Welkin Xie on 3/10/16.
//  Copyright © 2016 WelkinXie. All rights reserved.
//

#import "WKWebImage.h"

@implementation WKWebImage

+ (void)clearMemory {
    [[WKWebImageManager sharedManager] clearMemory];
}

+ (void)clearDisk {
    [[WKWebImageManager sharedManager] clearDisk];
}

@end
