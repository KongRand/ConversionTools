//
//  Base64.h
//  DataConversionTools
//
//  Created by kong on 2019/10/24.
//  Copyright © 2019 core. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSData(Base64)

/* Data Encoded To Base64 Data */
- (NSData *)base64EncodedData;

/* Data Encoded To Base64 String */
- (NSString *)base64EncodedString;

/* Data Decoded To Base64 Data */
- (NSData *)base64DecodedData;

/* Data Decoded To Base64 String */
- (NSString *)base64DecodedString;

@end

@interface NSString(Base64)

/* String Encoded To Base64 Data */
- (NSData *)base64EncodedData;

/* String Encoded To Base4 String */
- (NSString *)base64EncodedString;

/* String Decoded To Base64 Data */
- (NSData *)base64DecodedData;

/* String Decoded To Base4 String */
- (NSString *)base64DecodedString;

@end

NS_ASSUME_NONNULL_END
