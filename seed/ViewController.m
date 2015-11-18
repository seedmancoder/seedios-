//
//  ViewController.m
//  seed
//
//  Created by seedman on 15/10/29.
//  Copyright © 2015年 seedman. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *topView;
@property (weak, nonatomic) IBOutlet UIImageView *pictureView;
@property (weak, nonatomic) IBOutlet UILabel *wordsText;
@property (weak, nonatomic) IBOutlet UIButton *frontButton;
@property (weak, nonatomic) IBOutlet UIButton *nextButton;

@property(nonatomic,assign) int index;
@property(nonatomic,strong) NSArray *photodct;

@end

@implementation ViewController

- (NSArray *)photodct{
    if (!_photodct) {
        NSString *path =[[NSBundle mainBundle] pathForResource:@"Property List.plist" ofType:nil ];
        _photodct = [NSArray arrayWithContentsOfFile:path];
        
    }
    return _photodct;
    
}

- (IBAction)frontButtonClick:(id)sender {
    self.index--;
    [self btnClickChange];
}
- (IBAction)nextButtonClick:(id)sender {
    
    self.index++;
    [self btnClickChange];
}

- (void)btnClickChange{
    self.topView.text= [NSString stringWithFormat:@"%d/%d",(self.index + 1),self.photodct.count];
    self.wordsText.text=self.photodct[self.index][@"description"];
    self.pictureView.image =[UIImage imageNamed:self.photodct[self.index][@"name"]];
    
    self.frontButton.enabled=(self.index !=0);
    self.nextButton.enabled=(self.index !=2);
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
