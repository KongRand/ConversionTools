//
//  hex.c
//  DataConversionTools
//
//  Created by kong on 2019/10/24.
//  Copyright © 2019 core. All rights reserved.
//

#include "hex.h"
#include <string.h>
#include <assert.h>

/* 0 is success, 1 is false */
int hex(char ch)
{
    printf("%c\n",ch);
    if (ch >= '0' && ch <= '9')
        return 0;
    if (ch >= 'A' && ch <= 'F')
        return 0;
    if (ch >= 'a' && ch <= 'f')
        return 0;
    return 1;
}

/* 0 is success, 1 is false */
int isHex(char *ch)
{
    assert(ch);
    while (ch) {
        if (hex(*ch))
            break;
        ++ch;
    }
    return 0;
}

/* conver hex to bytes */
void hexToBytes(const char *hex, char *bytes)
{
    int i, len;
    char v;
    len = (int) strlen(hex);
    i = 0;
    while (i < len / 2) {
        char c = hex[2 * i];
        if (c >= '0' && c <= '9')
            v = (char) (c - '0');
        else if (c >= 'A' && c <= 'F')
            v = (char) (c - 'A' + 10);
        else if (c >= 'a' && c <= 'f')
            v = (char) (c - 'a' + 10);
        else
            v = 0;
        v <<= 4;
        c = hex[2 * i + 1];
        if (c >= '0' && c <= '9')
            v += c - '0';
        else if (c >= 'A' && c <= 'F')
            v += c - 'A' + 10;
        else if (c >= 'a' && c <= 'f')
            v += c - 'a' + 10;
        else
            v = 0;
        bytes[i] = v;
        i ++;
    }
}

/* conver bytes to hex */
int bytesToHex(char *bytes, char *hex)
{
    char tmp[3] = {0};
    int i, len;
    i = 0;
    len = (int)strlen(bytes);
    for (; i < len; i++) {
        sprintf(tmp, "%02x", bytes[i]);
        strcat(hex, tmp);
    }
    if (strlen(hex) == 0)
        return 1;
   return 0;
}

void hexToArray(const char *hex, char *array)
{
    char tmp[7] = {0};
    char val[3] = {0};
    int i, len;
    i = 0;
    len = (int )strlen(hex);
    strcat(array, "{ ");
    while (i < len) {
        val[0] = hex[i];
        val[1] = hex[i + 1];
        sprintf(tmp, " 0x%s,", val);
        strcat(array, tmp);
        i+=2;
    }
    strcat(array, " }");
}
