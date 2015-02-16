//
//  AlbumViewController.m
//  myApp3
//
//  Created by Saeko Fuse on 2015/02/09.
//  Copyright (c) 2015年 Saeko Fuse. All rights reserved.
//

#import "AlbumViewController.h"

@interface AlbumViewController ()

@end

@implementation AlbumViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIImage *image = [UIImage imageNamed:@"preview.jpg"];
    UIImageView *imagev = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 160, 160)];
    imagev.image = image;
    
    [self.view addSubview:imagev];

    UIImageView *imagev2 = [[UIImageView alloc]initWithFrame:CGRectMake(160, 0, 160, 160)];
    imagev2.image = image;
    
    [self.view addSubview:imagev2];
    
    UIImageView *imagev3 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 160, 160, 160)];
    imagev3.image = image;
    
    [self.view addSubview:imagev3];
    
    UIImageView *imagev4 = [[UIImageView alloc]initWithFrame:CGRectMake(160, 160, 160, 160)];
    imagev4.image = image;
    
    [self.view addSubview:imagev4];
    
    UIImageView *imagev5 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 320 , 160, 160)];
    imagev5.image = image;
    
    [self.view addSubview:imagev5];
    
    UIImageView *imagev6 = [[UIImageView alloc]initWithFrame:CGRectMake(160, 320 , 160, 160)];
    imagev6.image = image;
    
    [self.view addSubview:imagev6];
    
    UIImageView *imagev7 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 480, 160, 160)];
    imagev7.image = image;
    
    [self.view addSubview:imagev7];
    
    UIImageView *imagev8 = [[UIImageView alloc]initWithFrame:CGRectMake(160, 480 , 160, 160)];
    imagev8.image = image;
    
    [self.view addSubview:imagev8];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
