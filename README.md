#WKWebImage
一行代码实现UIImageView的异步加载、缓存图片。

##演示
**pod 'WKWebImage'** 并 **#import "WKWebImage.h"**

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
    [WKWebImage clearMemory];
    
    // 清除本地的缓存
    [WKWebImage clearDisk];

##许可
**WKWebImage** 以 [__MIT License__](https://github.com/WelkinXie/WKWebImage/blob/master/LICENSE) 标准发布.