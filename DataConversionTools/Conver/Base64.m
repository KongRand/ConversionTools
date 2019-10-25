//
//  Base64.m
//  DataConversionTools
//
//  Created by kong on 2019/10/24.
//  Copyright © 2019 core. All rights reserved.
//

#import "Base64.h"

@implementation NSData(Base64)

- (NSData *)base64EncodedData
{
    NSData *data = [self base64EncodedDataWithOptions:NSDataBase64EncodingEndLineWithLineFeed];
    return data;
}

- (NSString *)base64EncodedString
{
    NSString *str = [self base64EncodedStringWithOptions:NSDataBase64EncodingEndLineWithLineFeed];
    return str;
}


- (NSData *)base64DecodedData
{
    NSData *data = [[NSData alloc] initWithBase64EncodedData:self options:0];
    return data;
}

- (NSString *)base64DecodedString
{
    NSData *data  = [self base64DecodedData];
    NSString *str = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    return str;
}

@end

@implementation NSString(Base64)

- (NSData *)base64EncodedData
{
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    return [data base64EncodedData];
}

- (NSString *)base64EncodedString
{
    NSData   *data = [self base64EncodedData];
    NSString *str  = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    return str;
}

- (NSData *)base64DecodedData
{
    NSData *data = [[NSData alloc] initWithBase64EncodedString:self options:0];
    return data;
}

- (NSString *)base64DecodedString
{
    NSData   *data = [self base64DecodedData];
    NSString *str  = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    return str;
}

@end
