//
//  WKWebImageManager.h
//  StepCounter
//
//  Created by Welkin Xie on 3/10/16.
//  Copyright © 2016 WelkinXie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface WKWebImageManager : NSObject <NSCopying>

+ (instancetype)sharedManager;

- (void)fetchImageByURL:(NSURL *)url completion:(void (^)(UIImage *image))comletion;

- (void)clearMemory;

- (void)clearDisk;

@end
