//
//  GLRSAUtils.h
//  GLRSA
//
//  Created by jiaguanglei on 16/1/21.
//  Copyright © 2016年 roseonly. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RSAUtil : NSObject

#pragma mark - Instance Methods

-(void) loadPublicKeyFromFile: (NSString*) derFilePath;


-(void) loadPrivateKeyFromFile: (NSString*) p12FilePath password:(NSString*)p12Password;


-(NSString*) rsaEncryptString:(NSString*)string;


-(NSString*) rsaDecryptString:(NSString*)string;






#pragma mark - Class Methods

+(void)setSharedInstance:(RSAUtil *)instance;
+(RSAUtil *) sharedInstance;

@end

