//
//  commentViewController.m
//  myApp3
//
//  Created by Saeko Fuse on 2015/02/06.
//  Copyright (c) 2015年 Saeko Fuse. All rights reserved.
//

#import "commentViewController.h"
#import "imageViewController.h"

@interface commentViewController ()<UITextFieldDelegate>

@end

@implementation commentViewController

- (void)viewDidLoad
{
    if (_library ==nil)
    {
        _library = [[ALAssetsLibrary alloc]init];
    }
    
    if (_photolist ==nil)
    {
        _photolist = [[NSMutableArray alloc]init];
    }
    
    [self showPhoto:self.assetsurl];
    
    self.picker.delegate = self;
    _categoryArray = [NSArray arrayWithObjects:
                     @"Place",@"Food",@"View",@"Other",nil];
    
    //UserDefaultObjectを用意する
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    //保存されたデータを取り出す
    _photolist = [[defaults objectForKey:@"photoData"] mutableCopy];
    
    
    _textField.delegate = self;
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    //カメラライブラリから選んだ写真のURLを取得。
    _assetsUrl = [(NSURL *)[info objectForKey:@"UIImagePickerControllerReferenceURL"] absoluteString];
    
    [self showPhoto:_assetsUrl];
    
    if (!_assetsUrl)
    {
        UIImage *originalImage = (UIImage *)[info objectForKey:UIImagePickerControllerOriginalImage];
        self.smallImage.image = originalImage;
    }
    
}

//assetsから取得した画像を表示する
-(void)showPhoto:(NSString *)url
{
    //URLからALAssetを取得
    [_library assetForURL:[NSURL URLWithString:url]
              resultBlock:^(ALAsset *asset)
     {
         
         //画像があればYES、無ければNOを返す
         if(asset)
         {
             NSLog(@"データがあります");
             //ALAssetRepresentationクラスのインスタンスの作成
             ALAssetRepresentation *assetRepresentation = [asset defaultRepresentation];
             
             //ALAssetRepresentationを使用して、フルスクリーン用の画像をUIImageに変換
             //fullScreenImageで元画像と同じ解像度の写真を取得する。
             UIImage *fullscreenImage = [UIImage imageWithCGImage:[assetRepresentation fullScreenImage]];
             self.smallImage.image = fullscreenImage; //イメージをセット
         }else
         {
             NSLog(@"データがありません");
         }
         
     } failureBlock: nil];
    
}


//横方向の個数を指定
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

// pickerViewの縦の長さを決める
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    int cnt = [_categoryArray count];
    return cnt;
}

//ピッカービューの行のタイトルを返す
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [_categoryArray objectAtIndex:row];
}


//選択された行番号を取得
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    NSInteger selectedRow = [pickerView selectedRowInComponent:0];
    NSLog(@"%ld",(long)selectedRow);
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//- (void)setObject:(id)anObject forKey:(id)aKey
//{
//    //コメントページのdictionaryを作成
//    NSMutableDictionary *myDictionary = [[NSMutableDictionary alloc] init];
//    [myDictionary setObject:_assetsurl forKey:@"photo"];
//    [myDictionary setObject:_categoryArray[[self.picker selectedRowInComponent:0]] forKey:@"title"];
//    [myDictionary setObject:_textField.text forKey:@"comment"];
//    
//    //NSMutableArrayにdictionaryを挿入
//    NSMutableArray *_photoList = [NSMutableArray array];
//    [_photoList addObject:myDictionary];
//    
//    
//}

//// ユーザーデフォルトから読み込み
//- (void)loadFromUserDefaults
//{
//    NSData *listData = [_userDefaults objectForKey:@"UDPhotoData"];
//    _photoData = [[NSMutableArray alloc] init];
//    _photoData = [NSKeyedUnarchiver unarchiveObjectWithData:listData];
//}
//
////ユーザーデフォルトに保存
//- (void)saveToUserDefaults
//{
//    _photoData = [[NSMutableArray alloc] initWithArray:_photoData];
//    [_photoData addObject:_photolist];
//    NSData *listData = [NSKeyedArchiver archivedDataWithRootObject:_photoData];
//    [_userDefaults setObject:listData forKey:@"UDPhotoData"];
//    [_userDefaults synchronize];
//
//}

- (BOOL) textFieldShouldReturn:(UITextField *)textField
{
    // キーボードの非表示.
    [self.view endEditing:YES];
    // 改行しない.
    return NO;
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)tapBackImage:(id)sender
{
    
    [self.inputViewController dismissViewControllerAnimated:YES completion:nil];
    
}


- (IBAction)tapOkButton:(id)sender
{
    [self performSegueWithIdentifier:@"saveToAlbum" sender:self];
    
    //コメントページのdictionaryを作成
    NSMutableDictionary *myDictionary = [[NSMutableDictionary alloc] init];
    [myDictionary setObject:_assetsurl forKey:@"photo"];
    [myDictionary setObject:_categoryArray[[self.picker selectedRowInComponent:0]] forKey:@"title"];
    [myDictionary setObject:_textField.text forKey:@"comment"];
    
    //NSMutableArrayにdictionaryを挿入
    //NSMutableArray *_photoList = [[NSMutableArray alloc] init];
    [_photolist addObject:myDictionary];
    
    NSLog(@"%@データあり",myDictionary);
    
    //UserDefaultObjectを用意する
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    //画像を保存
    [defaults setObject:_photolist forKey:@"photoData"];
    [defaults synchronize];
    
    NSLog(@"%@保存",_photolist);
    
    
    
}



-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"backImageView"])
    {
        imageViewController *iVC = [segue destinationViewController];
        iVC.assetsurl = self.assetsurl;
    }
}


@end
