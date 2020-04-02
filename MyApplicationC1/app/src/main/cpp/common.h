#ifndef COMMON_H_
#define COMMON_H_

#include <unistd.h>
#include <fcntl.h>
#include <stdint.h>

#ifdef __cplusplus
extern "C"{
#endif

char* md5_hex2str(unsigned char* in_md5_hex, char* out_md5_str);
char* MD5_Digest(unsigned char* cleartext, char* out_md5_str);

#ifdef __cplusplus
}
#endif

#endif // COMMON_H_