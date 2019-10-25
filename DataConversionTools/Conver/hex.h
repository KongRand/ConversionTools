//
//  hex.h
//  DataConversionTools
//
//  Created by kong on 2019/10/24.
//  Copyright © 2019 core. All rights reserved.
//

#ifndef hex_h
#define hex_h

#include <stdio.h>

/// determine whether ch is hex
/// @param ch input ch
int isHex(char *ch);


/// hex conver to bytes
/// @param hex hex value
/// @param bytes bytes value
void hexToBytes(const char *hex, char *bytes);


/// bytes conver to hex
/// @param bytes bytes value
/// @param hex hex value
int bytesToHex(char *bytes, char *hex);


/// hex conver to c array
/// @param hex hex info
/// @param array array
void hexToArray(const char *hex, char *array);

#endif /* hex_h */
