//
//  UIImageView+WKWebImage.h
//  WKWebImage
//
//  Created by Welkin Xie on 3/9/16.
//  Copyright © 2016 WelkinXie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (WKWebImage)

@property (copy, nonatomic) NSString *token;

- (void)wk_setImageWithURL:(NSURL *)url;

- (void)wk_setImageWithURL:(NSURL *)url placeholder:(UIImage *)placeholder;

- (void)wk_setImageWithURL:(NSURL *)url completion:(void (^)(UIImage *image))comletion;

- (void)wk_setImageWithURL:(NSURL *)url placeholder:(UIImage *)placeholder completion:(void (^)(UIImage *image))comletion;

@end
