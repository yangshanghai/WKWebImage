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
    [self wk_setImageWithURL:url completion:nil];
}

- (void)wk_setImageWithURL:(NSURL *)url placeholder:(UIImage *)placeholder {
    [self wk_setImageWithURL:url placeholder:placeholder completion:nil];
}

- (void)wk_setImageWithURL:(NSURL *)url completion:(void (^)(UIImage *))comletion {
    [self wk_setImageWithURL:url placeholder:nil completion:nil];
}

- (void)wk_setImageWithURL:(NSURL *)url placeholder:(UIImage *)placeholder completion:(void (^)(UIImage *))comletion {
    self.image = placeholder;
    
    self.token = @([NSDate date].timeIntervalSince1970).stringValue;
    NSString *oldToken = self.token;
    
    [[WKWebImageManager sharedManager] fetchImageByURL:url completion:^(UIImage *image) {
        if (self.token == oldToken) {
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
