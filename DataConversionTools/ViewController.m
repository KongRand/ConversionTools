//
//  ViewController.m
//  DataConversionTools
//
//  Created by kong on 2019/10/24.
//  Copyright © 2019 core. All rights reserved.
//

#import "ViewController.h"
#include "Base64.h"
#include "hex.h"

@interface ViewController()

// get the input value from input_textview
@property (unsafe_unretained) IBOutlet NSTextView *input_textview;

// get the output value from output_textview
@property (unsafe_unretained) IBOutlet NSTextView *output_textview;

// tip info text field
@property (weak) IBOutlet NSTextField *tip_textfield;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)judgeHexFormat:(char *)ch
{
    _tip_textfield.stringValue = @"";
    if (isHex(ch))
        _tip_textfield.stringValue = @"input value is not hex";
}

#pragma mark - Any BASE64
- (IBAction)str2base64:(id)sender {
    NSString *inputStr = _input_textview.string;
    NSString *b64 = [inputStr base64EncodedString];
    [_output_textview setString:b64];
}
- (IBAction)base64str:(id)sender {
    NSString *inputStr = _input_textview.string;
    NSString *b64 =  [inputStr base64DecodedString];
    [_output_textview setString:b64];
}

#pragma mark - Hex BASE64
- (IBAction)hex2base64:(id)sender {
    NSString *inputStr = _input_textview.string;
    char *hex     = (char *)[inputStr UTF8String];
    char *bytes   = malloc(inputStr.length + 1);
    hexToBytes(hex, bytes);
    NSData   *byt = [NSData dataWithBytes:bytes length:inputStr.length / 2];
    NSString *b64 = [byt base64EncodedString];
    [_output_textview setString:b64];
    free(bytes);
}

- (IBAction)base642hex:(id)sender {
    NSString *inputStr = _input_textview.string;
    NSData *data = [inputStr base64DecodedData];
    char *bytes  = (char *)[data bytes];
    char *hex    = (char *)malloc(inputStr.length * 2 + 1);
    bytesToHex(bytes, hex);
    NSString *str = [NSString stringWithFormat:@"%s", hex];
    [_output_textview setString:str];
    free(hex);
}

#pragma mark - Bytes Hex
- (IBAction)bytes2hex:(id)sender {
    NSString *inputStr = _input_textview.string;
    char *bytes = (char *)[inputStr UTF8String];
    char *hex   = (char *)malloc(inputStr.length * 2 + 1);
    bytesToHex(bytes, hex);
    NSString *str = [NSString stringWithFormat:@"%s", hex];
    [_output_textview setString:str];
    free(hex);
}
- (IBAction)hex2bytes:(id)sender {
    NSString *inputStr = _input_textview.string;
    char *ch    = (char *)[inputStr UTF8String];
    char *bytes = (char *)malloc(inputStr.length + 1);
    hexToBytes(ch, bytes);
    NSString *str = [NSString stringWithFormat:@"%s", bytes];
    [_output_textview setString:str];
    free(bytes);
}

#pragma mark - C Array
- (IBAction)hex2CArray:(id)sender {
    NSString *inputStr = _input_textview.string;
    char *hex   = (char *)[inputStr UTF8String];
    char *array = (char *)malloc(inputStr.length * 4 + 1);
    hexToArray(hex, array);
    NSString *str = [NSString stringWithFormat:@"%s", array];
    [_output_textview setString:str];
    free(array);
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}


@end
