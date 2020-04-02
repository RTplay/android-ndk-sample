#include "common.h"
#include <openssl/md5.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

char* MD5_Digest(unsigned char* cleartext, char* out_md5_str)
{
    unsigned char tmp[16] = {0};

    MD5(cleartext, strlen((char*)cleartext), tmp);
    md5_hex2str(tmp, out_md5_str);
    return out_md5_str;
}

/* 将hex编码的MD5转换成字符串 */
char* md5_hex2str(unsigned char* in_md5_hex, char* out_md5_str)
{
    int i = 0;

    for (i = 0; i < MD5_DIGEST_LENGTH; ++i) {
        sprintf(out_md5_str + i * 2, "%.2x", in_md5_hex[i]);
    }
    out_md5_str[MD5_DIGEST_LENGTH * 2] = '\0';

    return out_md5_str;
}
