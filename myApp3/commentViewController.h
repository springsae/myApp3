//
//  commentViewController.h
//  myApp3
//
//  Created by Saeko Fuse on 2015/02/06.
//  Copyright (c) 2015年 Saeko Fuse. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AssetsLibrary/AssetsLibrary.h>

@interface commentViewController : UIViewController<UIPickerViewDelegate>
{
    NSString *_assetsUrl;    //assetsUrlを格納するインスタンス
    ALAssetsLibrary *_library;
    NSArray *_categoryArray;

}


@property (weak, nonatomic) IBOutlet UIButton *backImageButton;
- (IBAction)tapBackImage:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *okButton;
- (IBAction)tapOkButton:(id)sender;

@property (weak, nonatomic) IBOutlet UIPickerView *picker;

@property (weak, nonatomic) IBOutlet UITextView *textField;

@property (weak, nonatomic) IBOutlet UIImageView *smallImage;

@property (nonatomic,assign) NSString *assetsurl;

@property NSUserDefaults *userDefaults;

@property NSMutableArray *photoData;


@end
