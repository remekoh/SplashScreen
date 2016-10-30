//
//  ViewController.m
//  SplashScreen
//
//  Created by rem{e}koh on 10/12/16.
//  Copyright © 2016 rem{e}koh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, weak) IBOutlet UILabel *splashScreenMessage;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    BOOL hasAnimationLoaded = [userDefaults boolForKey:@"IsFirstTimeLoadingApp"];

    
    if (hasAnimationLoaded == NO) {
        [self displayAnimation];
    } else {
        
        HomeScreenViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"HomeStoryboard"];
        
        [self.navigationController pushViewController:controller animated:YES
         ];
        
    }
}


-(void) displayAnimation {
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setBool:YES forKey:@"IsFirstTimeLoadingApp"];
    [userDefaults synchronize];
    
    
    [UIView animateWithDuration:2.5 animations:^{
        
        self.splashScreenMessage.alpha = 1.0;
    
    }completion:^(BOOL finished){
        
        [UIView animateWithDuration:2.5 animations:^{
            self.splashScreenMessage.alpha = 0.0;
            
        }completion:^(BOOL finished) {
        
            HomeScreenViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"HomeStoryboard"];
            
            [self.navigationController pushViewController:controller animated:YES
             ];
        }];
    }];
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
