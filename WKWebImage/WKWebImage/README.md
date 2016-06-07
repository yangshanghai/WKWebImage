#WKWebImage

Simply one line, downloads and shows an image in an UIImageView asynchronously.

##Usage
**pod 'WKWebImage'** and **#import \<WKWebImage.h>**

###Method
Include four methods：

	// Download and show asynchronously. (default)
	- (void)wk_setImageWithURL:(NSURL *)url;
	
	// default + placeholder
	- (void)wk_setImageWithURL:(NSURL *)url placeholder:(UIImage *)placeholder;
	
	// default + call back
	- (void)wk_setImageWithURL:(NSURL *)url completion:(void (^)(UIImage *image))comletion;

	// default + placeholder + call back
	- (void)wk_setImageWithURL:(NSURL *)url placeholder:(UIImage *)placeholder completion:(void (^)(UIImage *image))comletion;

e.g.

	[_imageView wk_setImageWithURL:[NSURL URLWithString:@"http://7xneqd.com1.z0.glb.clouddn.com/fiveinarow.png"]];

Simply one line! :)

###Clear the Cache
**WKWebImage** will cache the image. Remove them with the below methods:

	// Clear the cache in RAM.
    [[WKWebImageManager sharedManager] clearMemory];
    
    // Clear the cache in disk.
    [[WKWebImageManager sharedManager] clearDisk];

##License
**WKWebImage** is released under [__MIT License__](https://github.com/WelkinXie/WKWebImage/blob/master/LICENSE).

--

# 中文说明
一行代码实现UIImageView的异步加载、缓存图片。

##演示
**pod 'WKWebImage'** 并 **#import \<WKWebImage.h>**

###异步加载图片
包含以下四种设置方法：

	// 异步加载图片
	- (void)wk_setImageWithURL:(NSURL *)url;
	
	// 加载 + 设置placeholder
	- (void)wk_setImageWithURL:(NSURL *)url placeholder:(UIImage *)placeholder;
	
	// 加载 + 设置回调
	- (void)wk_setImageWithURL:(NSURL *)url completion:(void (^)(UIImage *image))comletion;

	// 加载 + placeholder + 回调
	- (void)wk_setImageWithURL:(NSURL *)url placeholder:(UIImage *)placeholder completion:(void (^)(UIImage *image))comletion;

例如

	[_imageView wk_setImageWithURL:[NSURL URLWithString:@"http://7xneqd.com1.z0.glb.clouddn.com/fiveinarow.png"]];

一行代码即可 :)

###清除缓存
**WKWebImage** 会把已加载的图片缓存到本地，如果要清除缓存，可调用以下方法：

	// 清除内存中的缓存
    [[WKWebImageManager sharedManager] clearMemory];
    
    // 清除本地的缓存
    [[WKWebImageManager sharedManager] clearDisk];

##许可
**WKWebImage** 以 [__MIT License__](https://github.com/WelkinXie/WKWebImage/blob/master/LICENSE) 发布.