//
//  ViewController.m
//  RSA
//
//  Created by pingui on 2016/12/14.
//  Copyright © 2016年 Jay. All rights reserved.
//

#import "ViewController.h"
#import "RSAUtil.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSString *mima = @"今天星期三,Wednesday,3";
    
    RSAUtil * rsa = [[RSAUtil alloc] init];
    NSString* publicKeyPath = [[NSBundle mainBundle] pathForResource:@"public_key" ofType:@"der"];
    NSString* privateKeyPath = [[NSBundle mainBundle] pathForResource:@"private_key" ofType:@"p12"];
    
    [rsa loadPublicKeyFromFile: publicKeyPath];
    // 这里需要密码
    [rsa loadPrivateKeyFromFile: privateKeyPath password:@"88888888"];
    
    NSString *jiami = [rsa rsaEncryptString:mima];
    NSLog(@"加密: \n%@", jiami);
    
    NSString *jiemi = [rsa rsaDecryptString: jiami];
    NSLog(@"解密: %@", jiemi);

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
