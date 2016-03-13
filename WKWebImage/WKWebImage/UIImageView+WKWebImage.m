//
//  UIImageView+WKWebImage.m
//  WKWebImage
//
//  Created by Welkin Xie on 3/9/16.
//  Copyright © 2016 WelkinXie. All rights reserved.
//

#import "UIImageView+WKWebImage.h"
#import <objc/runtime.h>
#import "WKWebImageManager.h"

@implementation UIImageView (WKWebImage)

- (NSString *)token {
    return objc_getAssociatedObject(self, "token");
}

- (void)setToken:(NSString *)token {
    objc_setAssociatedObject(self, "token", token, OBJC_ASSOCIATION_COPY);
}

- (void)wk_setImageWithURL:(NSURL *)url {
    [self wk_setImageWithURL:url placeholder:nil completion:nil];
}

- (void)wk_setImageWithURL:(NSURL *)url placeholder:(UIImage *)placeholder {
    [self wk_setImageWithURL:url placeholder:placeholder completion:nil];
}

- (void)wk_setImageWithURL:(NSURL *)url completion:(void (^)(UIImage *))completion {
    [self wk_setImageWithURL:url placeholder:nil completion:completion];
}

- (void)wk_setImageWithURL:(NSURL *)url placeholder:(UIImage *)placeholder completion:(void (^)(UIImage *))comletion {
    self.image = placeholder;
    self.token = url.absoluteString;
    
    [[WKWebImageManager sharedManager] fetchImageWithURL:url completion:^(UIImage *image) {
        if ([self.token isEqualToString:url.absoluteString]) {
            dispatch_async(dispatch_get_main_queue(), ^{
                self.image = image;
                if (comletion != nil) {
                    comletion(image);
                }
            });
        }
    }];
}

@end
