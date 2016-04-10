//
//  WKWebImageManager.m
//  StepCounter
//
//  Created by Welkin Xie on 3/10/16.
//  Copyright © 2016 WelkinXie. All rights reserved.
//

#import "WKWebImageManager.h"
#import <CommonCrypto/CommonDigest.h>

#define HOME_PATH [NSString stringWithFormat:@"%@/Documents/WKWebImageCache/", NSHomeDirectory()]

static WKWebImageManager *downloader;
static NSUInteger downloading;

@interface WKWebImageManager ()
@property (strong, nonatomic) NSCache *images;

@end

@implementation WKWebImageManager

+ (instancetype)sharedManager {
    static dispatch_once_t token;
    dispatch_once(&token, ^{
        downloader = [[super allocWithZone:NULL] init];
        downloader.images = [[NSCache alloc] init];
        downloader.images.countLimit = 15;
        
        BOOL isDir;
        NSFileManager *fileManager = [NSFileManager defaultManager];
        if (![fileManager fileExistsAtPath:HOME_PATH isDirectory:&isDir]) {
            [fileManager createDirectoryAtPath:HOME_PATH withIntermediateDirectories:YES attributes:nil error:nil];
        }
    });
    return downloader;
}

- (id)copyWithZone:(NSZone *)zone {
    return self;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    return [self sharedManager];
}

- (void)fetchImageWithURL:(NSURL *)url completion:(void (^)(UIImage *image))comletion {
//    NSLog(@"count: %ld", _images.countLimit);
    NSString *md5 = [self keyForUrl:url.absoluteString];
    UIImage *image = [_images objectForKey:md5];
    
    if (!image) {
        BOOL isDir;
        
        NSString *imagePath = [HOME_PATH stringByAppendingString:[NSString stringWithFormat:@"%@.%@", md5, url.absoluteString.pathExtension]];
        NSFileManager *fileManager = [NSFileManager defaultManager];
        if ([fileManager fileExistsAtPath:imagePath isDirectory:&isDir]) {
            NSData *imageData = [NSData dataWithContentsOfFile:imagePath];
            image = [UIImage imageWithData:imageData];
            
            [_images setObject:image forKey:md5];
            
            comletion(image);
        }
        else {
//            downloading ++;
//            NSLog(@"is downloading %lu", (unsigned long)downloading);
            
            NSURLSession *session = [NSURLSession sharedSession];
            NSURLSessionDataTask *task = [session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                
//                downloading --;
//                NSLog(@"is downloading %lu", (unsigned long)downloading);
                
                UIImage *downloadedImage = [UIImage imageWithData:data];
                
                [_images setObject:downloadedImage forKey:md5];
                
                NSString *imagePath = [HOME_PATH stringByAppendingString:[NSString stringWithFormat:@"%@.%@", md5, url.absoluteString.pathExtension]];
                [data writeToFile:imagePath atomically:YES];
                
                comletion(downloadedImage);
            }];
            [task resume];
        }
    }
    else {
        comletion(image);
    }
}

- (void)clearMemory {
    [_images removeAllObjects];
}

- (void)clearDisk {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error = nil;
    NSArray *fileList = [fileManager contentsOfDirectoryAtPath:HOME_PATH error:&error];
    
    for (NSString *fileName in fileList) {
        [fileManager removeItemAtPath:[HOME_PATH stringByAppendingPathComponent:fileName] error:&error];
    }
}

- (NSString *)keyForUrl:(NSString *)str {
    const char *cStr = [str UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(cStr, (int)strlen(cStr), result);
    
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}

@end
