//
//  ImageViewController.m
//  FoundtionPractive
//
//  Created by qitmac000370 on 2020/3/22.
//  Copyright © 2020 wch. All rights reserved.
//

#import "ImageViewController.h"
#import "UIImageView+WebCache.h"
#import "ScrollPageView.h"

@interface ImageViewController ()

@property(nonatomic,strong) UIImageView *imgView;

@end

@implementation ImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"Image";
    
    self.navigationController.interactivePopGestureRecognizer.delegate = (id)self;
    
    
//    _imgView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 100, 200, 100)];
//    [self.view addSubview:_imgView];
    
    
    UIButton *a = [[UIButton alloc] initWithFrame:CGRectMake(50, 250, 50, 50)];
    a.backgroundColor = [UIColor grayColor];
    [a addTarget:self action:@selector(aaaaa) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:a];
    
    
//    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(20, 320, 320, 200)];
//    scrollView.backgroundColor = [UIColor lightGrayColor];
//    for(int i=0;i<20;i++){
//        UILabel *l = [[UILabel alloc] initWithFrame:CGRectMake(1, i*50, 200, 50)];
//        l.text = [NSString stringWithFormat:@"%d",i];
//        [scrollView addSubview:l];
//        scrollView.contentSize = CGSizeMake(scrollView.width, l.bottom);
//    }
//    [self.view addSubview:scrollView];
    
//    [imgView sd_setImageWithURL:[NSURL URLWithString:@"http://192.168.1.115:8000/test.jpg"] placeholderImage:[UIImage imageNamed:@"placeholder"]];
}

-(void)aaaaa{

    ScrollPageView *scrollV = [[ScrollPageView alloc] init];
    [scrollV showInParent:self.view];

//    NSLog(@"wch-------------aaaaa");
////    [_imgView sd_setImageWithURL:[NSURL URLWithString:@"http://192.168.1.115:8000/test.jpg"] placeholderImage:[UIImage imageNamed:@"placeholder"]];
//
//    NSURL *imageURL = [NSURL URLWithString:@"http://192.168.1.115:8000/test.jpg"];
//    //下载图片
//    NSData *imageData = [NSData dataWithContentsOfURL:imageURL];
//
//    __weak typeof(self) weakSelf = self;
//    dispatch_async(dispatch_get_global_queue(0, 0), ^{
////        UIImage *decodeImage = [weakSelf AFInflatedImageFromResponseWithDataAtScale:imageData];
//    UIImage *decodeImage = [weakSelf sd_decompressedImageWithImage:imageData];
//        dispatch_sync(dispatch_get_main_queue(), ^{
//            weakSelf.imgView.image = decodeImage;
//        });
//    });
    
//    UIImage *image = [UIImage imageWithData:imageData];
//    _imgView.image = image;
}

//AFN的图片解码
-(UIImage *)AFInflatedImageFromResponseWithDataAtScale:(NSData *)data{

    CGImageRef imageRef = NULL;
    CGDataProviderRef dataProvider = CGDataProviderCreateWithCFData((__bridge CFDataRef)data);

    imageRef = CGImageCreateWithJPEGDataProvider(dataProvider, NULL, true, kCGRenderingIntentDefault);

    if (imageRef) {
        CGColorSpaceRef imageColorSpace = CGImageGetColorSpace(imageRef);
        CGColorSpaceModel imageColorSpaceModel = CGColorSpaceGetModel(imageColorSpace);

        // CGImageCreateWithJPEGDataProvider does not properly handle CMKY, so fall back to AFImageWithDataAtScale
        if (imageColorSpaceModel == kCGColorSpaceModelCMYK) {
            CGImageRelease(imageRef);
            imageRef = NULL;
        }
    }

    CGDataProviderRelease(dataProvider);

//    UIImage *image = AFImageWithDataAtScale(data, scale);
    
    UIImage *image = [UIImage imageWithData:data];
//    if (imageA.images) {
//        return image;
//    }
//    UIImage *image = [[UIImage alloc] initWithCGImage:[image CGImage] scale:scale orientation:image.imageOrientation];
    
    if (!imageRef) {
        if (image.images || !image) {
            return image;
        }

        imageRef = CGImageCreateCopy([image CGImage]);
        if (!imageRef) {
            return nil;
        }
    }

    size_t width = CGImageGetWidth(imageRef);
    size_t height = CGImageGetHeight(imageRef);
    size_t bitsPerComponent = CGImageGetBitsPerComponent(imageRef);

//    if (width * height > 1024 * 1024 || bitsPerComponent > 8) {
//        CGImageRelease(imageRef);
//
//        return image;
//    }

    // CGImageGetBytesPerRow() calculates incorrectly in iOS 5.0, so defer to CGBitmapContextCreate
    size_t bytesPerRow = 0;
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGColorSpaceModel colorSpaceModel = CGColorSpaceGetModel(colorSpace);
    CGBitmapInfo bitmapInfo = CGImageGetBitmapInfo(imageRef);

    if (colorSpaceModel == kCGColorSpaceModelRGB) {
        uint32_t alpha = (bitmapInfo & kCGBitmapAlphaInfoMask);
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wassign-enum"
        if (alpha == kCGImageAlphaNone) {
            bitmapInfo &= ~kCGBitmapAlphaInfoMask;
            bitmapInfo |= kCGImageAlphaNoneSkipFirst;
        } else if (!(alpha == kCGImageAlphaNoneSkipFirst || alpha == kCGImageAlphaNoneSkipLast)) {
            bitmapInfo &= ~kCGBitmapAlphaInfoMask;
            bitmapInfo |= kCGImageAlphaPremultipliedFirst;
        }
#pragma clang diagnostic pop
    }

    CGContextRef context = CGBitmapContextCreate(NULL, width, height, bitsPerComponent, bytesPerRow, colorSpace, bitmapInfo);

    CGColorSpaceRelease(colorSpace);

    if (!context) {
        CGImageRelease(imageRef);

        return image;
    }

    CGContextDrawImage(context, CGRectMake(0.0f, 0.0f, width, height), imageRef);
    CGImageRef inflatedImageRef = CGBitmapContextCreateImage(context);

    CGContextRelease(context);

    UIImage *inflatedImage = [[UIImage alloc] initWithCGImage:inflatedImageRef scale:1 orientation:image.imageOrientation];

    CGImageRelease(inflatedImageRef);
    CGImageRelease(imageRef);

    return inflatedImage;
}

//SDWebImage的解码
- (nullable UIImage *)sd_decompressedImageWithImage:(NSData *)data {

    UIImage *image = [UIImage imageWithData:data];
    
    // autorelease the bitmap context and all vars to help system to free memory when there are memory warning.
    // on iOS7, do not forget to call [[SDImageCache sharedImageCache] clearMemory];
    @autoreleasepool{

        CGImageRef imageRef = image.CGImage;
        // device color space
        CGColorSpaceRef colorspaceRef = CGColorSpaceCreateDeviceRGB();
//        BOOL hasAlpha = SDCGImageRefContainsAlpha(imageRef);
        
        
        CGImageAlphaInfo alphaInfo = CGImageGetAlphaInfo(imageRef);
        BOOL hasAlpha = !(alphaInfo == kCGImageAlphaNone ||
                          alphaInfo == kCGImageAlphaNoneSkipFirst ||
                          alphaInfo == kCGImageAlphaNoneSkipLast);
        
        // iOS display alpha info (BRGA8888/BGRX8888)
        CGBitmapInfo bitmapInfo = kCGBitmapByteOrder32Host;
        bitmapInfo |= hasAlpha ? kCGImageAlphaPremultipliedFirst : kCGImageAlphaNoneSkipFirst;

        size_t width = CGImageGetWidth(imageRef);
        size_t height = CGImageGetHeight(imageRef);

        const size_t kBitsPerComponent = 8;
        // kCGImageAlphaNone is not supported in CGBitmapContextCreate.
        // Since the original image here has no alpha info, use kCGImageAlphaNoneSkipLast
        // to create bitmap graphics contexts without alpha info.
        CGContextRef context = CGBitmapContextCreate(NULL,
                                                     width,
                                                     height,
                                                     kBitsPerComponent,
                                                     0,
                                                     colorspaceRef,
                                                     bitmapInfo);
        if (context == NULL) {
            return image;
        }

        // Draw the image into the context and retrieve the new bitmap image without alpha
        CGContextDrawImage(context, CGRectMake(0, 0, width, height), imageRef);
        CGImageRef imageRefWithoutAlpha = CGBitmapContextCreateImage(context);
        UIImage *imageWithoutAlpha = [[UIImage alloc] initWithCGImage:imageRefWithoutAlpha scale:image.scale orientation:image.imageOrientation];
        CGContextRelease(context);
        CGImageRelease(imageRefWithoutAlpha);

        return imageWithoutAlpha;
    }
}

@end
