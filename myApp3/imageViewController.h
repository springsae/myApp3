//
//  imageViewController.h
//  myApp3
//
//  Created by Saeko Fuse on 2015/02/06.
//  Copyright (c) 2015年 Saeko Fuse. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AssetsLibrary/AssetsLibrary.h>

@interface imageViewController : UIViewController
{
    NSString *_assetsUrl;    //assetsUrlを格納するインスタンス
    ALAssetsLibrary *_library;
}

@property (weak, nonatomic) IBOutlet UIButton *backCamera;
@property (weak, nonatomic) IBOutlet UIButton *callComment;
- (IBAction)tapBackCamera:(id)sender;
- (IBAction)tapCallComment:(id)sender;

@property (weak, nonatomic) IBOutlet UIImageView *showImage;
@property (nonatomic,assign) NSString *assetsurl;
@end
