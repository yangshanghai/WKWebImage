//
//  WKWebImageManager.h
//  StepCounter
//
//  Created by Welkin Xie on 3/10/16.
//  Copyright © 2016 WelkinXie. All rights reserved.
//
//  Github: https://github.com/WelkinXie/WKWebImage
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface WKWebImageManager : NSObject <NSCopying>

+ (instancetype)sharedManager;

- (void)fetchImageWithURL:(NSURL *)url completion:(void (^)(UIImage *image))comletion;

- (void)clearMemory;

- (void)clearDisk;

@end
