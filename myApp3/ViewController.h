//
//  ViewController.h
//  myApp3
//
//  Created by Saeko Fuse on 2015/02/06.
//  Copyright (c) 2015年 Saeko Fuse. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "imageViewController.h"
#import <AssetsLibrary/AssetsLibrary.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *callCamera;
- (IBAction)tapCallCamera:(id)sender;

@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIView *albumView;

@property (weak, nonatomic) IBOutlet UITabBar *myTabBar;


@end

