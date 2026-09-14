/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include "napi/native_api.h"
#include <cstring>
#include <filemanagement/archive/oh_archive.h>
#include <napi/native_api.h>
#include <cstdio>
#include <cstdlib>
#include <string>
#include <iostream>
#include <fstream>

#define MALLOC_THRESHOLD (2 * 1024 * 1024 * 1024)

#define ULL unsigned long long
static ULL g_seed = 123456789LL;

static uint64_t WriteHandler(const void *data, uint64_t size, void *userData)
{
    uint8_t *out = reinterpret_cast<uint8_t *>(userData);
    const uint8_t *in = reinterpret_cast<const uint8_t *>(data);
    for (uint64_t i = 0; i < size; i++) {
        out[i] = in[i];
    }
    return size;
}

static inline ULL IRand(void)
{
    g_seed = (g_seed * 0x41C64E6D + 0x3039) & 0x7FFFFFFF;
    return g_seed;
}

static int TestRandomInt(int min, int max)
{
    if (max <= min) {
        return min;
    }
    return IRand() % (max - min) + min;
}

static void FillBufferWithRandomData(void *buff, ULL size)
{
    if (!buff) {
        return;
    }
    char *p = static_cast<char *>(buff);
    for (ULL i = 0; i < size; i++) {
        p[i] = static_cast<char>(TestRandomInt(33, 126)); // 33-126 字符范围
    }
}

static int ReadFileData(const char *fileName, char **data, uint64_t *dataLength)
{
    FILE *file = fopen(fileName, "rb");
    if (file == nullptr) {
        return -1;
    }
    fseeko(file, 0, SEEK_END);
    int64_t fileSize = ftello(file);
    if (fileSize < 0) {
        return -1;
    }
    char *buffer = static_cast<char *>(malloc(fileSize * sizeof(char)));
    if (buffer == nullptr) {
        return -1;
    }
    fseeko(file, 0, SEEK_SET);
    (void)fread(buffer, 1, fileSize, file);
    (void)fclose(file);
    *data = buffer;
    *dataLength = fileSize;
    return 0;
}

static uint64_t WriteCallBack(const void *data, uint64_t size, void *userData)
{
    FILE *file = static_cast<FILE *>(userData);
    return fwrite(data, 1, size, file);
}

static void CreateRandomFile(const char *fileName, size_t fileSize)
{
    if (fileSize == 0 || fileSize > MALLOC_THRESHOLD) {
        return;
    }
    void *fileData = static_cast<void *>(malloc(fileSize * sizeof(char)));
    if (fileData == nullptr) {
        return;
    }
    FillBufferWithRandomData(fileData, fileSize);

    FILE *file = fopen(fileName, "wb");
    (void)fwrite(fileData, 1, fileSize, file);
    (void)fclose(file);
    free(fileData);
}

#define PATH_BUFFER_SIZE 4096

// [Start buffer_compress_example]
static napi_value BufferCompress(napi_env env, napi_callback_info info)
{
    // 获取输入文件路径和输出文件路径
    size_t argc = 2;
    napi_value argv[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);

    size_t inPathSize;
    size_t outPathSize;
    char inPathBuf[PATH_BUFFER_SIZE];
    char outPathBuf[PATH_BUFFER_SIZE];
    napi_get_value_string_utf8(env, argv[0], inPathBuf, sizeof(inPathBuf), &inPathSize);
    napi_get_value_string_utf8(env, argv[1], outPathBuf, sizeof(outPathBuf), &outPathSize);

    CreateRandomFile(inPathBuf, 1024 * 1024); // 创建1024K大小的测试文件
    // 读取文件数据到内存缓冲区
    char *source = nullptr;
    uint64_t sourceLen;
    ReadFileData(inPathBuf, &source, &sourceLen);

    uint64_t destLen = 0;
    uint8_t *dest = nullptr;

    // 计算压缩后数据所需的最大输出缓冲区大小
    uint64_t bound = OH_Archive_BufferWriteCompressBound(OH_ARCHIVE_COMPRESS_DEFLATE, sourceLen);
    if (bound > MALLOC_THRESHOLD) {
        return nullptr;
    }
    dest = (uint8_t *)malloc(bound);
    if (dest == nullptr) {
        free(source);
        return nullptr;
    }
    destLen = bound;

    // 对缓冲区数据进行压缩，使用DEFLATE算法，压缩级别为0
    OH_Archive_ErrCode ret = OH_Archive_BufferWrite(dest, &destLen, reinterpret_cast<uint8_t *>(source), sourceLen,
                                                    OH_ARCHIVE_COMPRESS_DEFLATE, 0);

    free(source);
    free(dest);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
// [End buffer_compress_example]

// [Start stream_compress_example]

static void InitStreamConfig(OH_Archive_Stream_Config *config)
{
    config->blockSize = 65536; // 设置block大小为65536 bytes
    config->threadNum = 4;     // 设置线程数为4
    config->method = OH_ARCHIVE_COMPRESS_DEFLATE; // 设置压缩算法为DEFLATE
    config->checksum = OH_ARCHIVE_CRC32;          // 设置校验方式为CRC32
}

static napi_value StreamCompress(napi_env env, napi_callback_info info)
{
    // 获取输入文件路径和输出文件路径
    size_t argc = 2;
    napi_value argv[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);

    size_t inPathSize;
    size_t outPathSize;
    char inPathBuf[PATH_BUFFER_SIZE];
    char outPathBuf[PATH_BUFFER_SIZE];
    napi_get_value_string_utf8(env, argv[0], inPathBuf, sizeof(inPathBuf), &inPathSize);
    napi_get_value_string_utf8(env, argv[1], outPathBuf, sizeof(outPathBuf), &outPathSize);

    // 初始化流式压缩配置并创建流式压缩写入器
    OH_Archive_Stream_Config config = {0};
    InitStreamConfig(&config);
    OH_Archive_StreamWrite_Ctx ctx = OH_Archive_StreamWrite_Create(config);

    const int bufferSize = 32 * 1024 * 4 + 2; // 设置读取缓冲区大小
    unsigned char buffer[bufferSize];

    CreateRandomFile(inPathBuf, 1024 * 1024); // 创建1024K大小的测试文件

    // 打开输出文件，用于写入压缩后的数据
    FILE *fout = fopen(outPathBuf, "wb");
    if (!fout) {
        return nullptr;
    }
    OH_Archive_ErrCode result = OH_ARCHIVE_OK;
    result = OH_Archive_StreamWrite_SetCompressLevel(ctx, 6); // 设置压缩等级为6
    // 启动流式压缩，通过WriteCallBack回调将压缩数据写入文件
    result = OH_Archive_StreamWrite_Start(ctx, WriteCallBack, fout);
    uint64_t totalSize = 0;
    FILE *fi = fopen(inPathBuf, "rb");
    if (!fi) {
        (void)fclose(fout);
        return nullptr;
    }
    (void)fseek(fi, 0, SEEK_SET);

    // 循环读取文件数据并输入到压缩器进行压缩
    uint64_t read = 0;
    while ((read = fread(buffer, 1, bufferSize, fi)) > 0) {
        totalSize += read;
        result = OH_Archive_StreamWrite_Update(ctx, buffer, read);
        if (result != OH_ARCHIVE_OK) {
            break;
        }
    }
    (void)fclose(fi);
    // 结束流式压缩并获取压缩结果信息
    OH_Archive_StreamInfo streamInfo;
    result = OH_Archive_StreamWrite_End(ctx, &streamInfo);
    (void)fclose(fout);

    napi_value retVal = nullptr;
    napi_create_int32(env, result, &retVal);
    return retVal;
}
// [End stream_compress_example]

// [Start stream_compress_cancel_example]
static napi_value StreamCompressCancel(napi_env env, napi_callback_info info)
{
    // 获取输入文件路径和输出文件路径
    size_t argc = 2;
    napi_value argv[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);

    char inPathBuf[PATH_BUFFER_SIZE];
    char outPathBuf[PATH_BUFFER_SIZE];
    napi_get_value_string_utf8(env, argv[0], inPathBuf, sizeof(inPathBuf), nullptr);
    napi_get_value_string_utf8(env, argv[1], outPathBuf, sizeof(outPathBuf), nullptr);

    // 初始化流式压缩配置并创建流式压缩写入器
    OH_Archive_Stream_Config config;
    InitStreamConfig(&config);
    OH_Archive_StreamWrite_Ctx ctx = OH_Archive_StreamWrite_Create(config);

    CreateRandomFile(inPathBuf, 1024 * 1024); // 创建1024K大小的测试文件
    // 打开输出文件，用于写入压缩后的数据
    FILE *fout = fopen(outPathBuf, "wb");
    if (!fout) {
        return nullptr;
    }
    OH_Archive_ErrCode result = OH_ARCHIVE_OK;
    result = OH_Archive_StreamWrite_SetCompressLevel(ctx, 6); // 设置压缩等级为6
    // 启动流式压缩，通过WriteCallBack回调将压缩数据写入文件
    result = OH_Archive_StreamWrite_Start(ctx, WriteCallBack, fout);
    const int bufferSize = 32 * 1024 * 4 + 2; // 设置读取缓冲区大小
    unsigned char buffer[bufferSize];
    uint64_t totalSize = 0;
    FILE *fi = fopen(inPathBuf, "rb");
    if (!fi) {
        (void)fclose(fout);
        return nullptr;
    }

    // 循环读取文件数据并输入到压缩器进行压缩，累计数据量超过阈值时取消压缩
    uint64_t read = 0;
    uint64_t cancelThreshold = 2000; // 设置取消阈值为2000 bytes
    while ((read = fread(buffer, 1, bufferSize, fi)) > 0) {
        totalSize += read;
        if (totalSize > cancelThreshold) {
            // 累计数据量超过阈值，取消流式压缩
            result = OH_Archive_StreamWrite_Cancel(ctx);
            break;
        } else {
            result = OH_Archive_StreamWrite_Update(ctx, buffer, read);
        }
        if (result != OH_ARCHIVE_OK) {
            break;
        }
    }
    (void)fclose(fi);
    // 结束流式压缩，取消场景下不获取压缩结果信息
    result = OH_Archive_StreamWrite_End(ctx, nullptr);
    (void)fclose(fout);
    napi_value retVal = nullptr;
    napi_create_int32(env, result, &retVal);
    return retVal;
}
// [End stream_compress_cancel_example]


// [Start buffer_decompress_example]
static napi_value BufferDecompress(napi_env env, napi_callback_info info)
{
    size_t argc = 0;
    napi_get_cb_info(env, info, &argc, nullptr, nullptr, nullptr);

    int ret;
    // 生成随机测试数据
    uint64_t dataSize = 1024 * 1024;
    uint8_t *srcBuffer = (uint8_t *)malloc(dataSize);
    if (srcBuffer == nullptr) {
        return nullptr;
    }

    for (size_t i = 0; i < dataSize; ++i) {
        srcBuffer[i] = static_cast<uint8_t>(TestRandomInt(0, 256)); // 小于256, byte范围内
    }

    // 先压缩数据，用于后续解压缩验证
    uint64_t bound = OH_Archive_BufferWriteCompressBound(OH_ARCHIVE_COMPRESS_DEFLATE, dataSize);
    uint64_t compressedSize = bound;
    uint8_t *compressedBuffer = (uint8_t *)malloc(compressedSize);
    if (compressedBuffer == nullptr) {
        return nullptr;
    }
    ret = OH_Archive_BufferWrite(compressedBuffer, &compressedSize, srcBuffer, dataSize, OH_ARCHIVE_COMPRESS_DEFLATE,
                                 int32_t(6)); // 压缩等级为6
    // 分配解压缩输出缓冲区并执行解压缩
    uint8_t *decompressedBuffer = (uint8_t *)malloc(dataSize);
    if (decompressedBuffer == nullptr) {
        return nullptr;
    }
    uint64_t decompressedSize = dataSize;
    ret = OH_Archive_BufferRead(decompressedBuffer, &decompressedSize, compressedBuffer, compressedSize,
                                OH_ARCHIVE_COMPRESS_DEFLATE);
    // 校验解压缩后的数据与原始数据是否一致
    bool isEqual = std::memcmp(decompressedBuffer, srcBuffer, dataSize) == 0;
    free(srcBuffer);
    free(compressedBuffer);
    free(decompressedBuffer);

    napi_value result = nullptr;
    napi_create_int32(env, !isEqual, &result);
    return result;
}
// [End buffer_decompress_example]

static void CreateFileWithStreamWrite(OH_Archive_Stream_Config *config, uint64_t srcSize, void *zipBuffer,
                                      OH_Archive_StreamInfo *compressInfo)
{
    int ret;
    OH_Archive_StreamWrite_Ctx writeCtx = OH_Archive_StreamWrite_Create(*config);

    ret = OH_Archive_StreamWrite_SetCompressLevel(writeCtx, int32_t(6)); // 压缩等级为6
    if (srcSize > MALLOC_THRESHOLD) {
        return;
    }
    uint8_t *srcBuffer = (uint8_t *)malloc(srcSize);
    if (srcBuffer == nullptr) {
        return;
    }
    for (uint64_t i = 0; i < srcSize; ++i) {
        srcBuffer[i] = static_cast<uint8_t>(TestRandomInt(0, 256)); // 小于256, byte范围内
    }

    ret = OH_Archive_StreamWrite_Start(writeCtx, WriteHandler, zipBuffer);

    uint8_t *ptr = srcBuffer;
    size_t left = srcSize;

    while (left > 0) {
        size_t chunkSize = (left > 1024) ? 1024 : left;
        ret = OH_Archive_StreamWrite_Update(writeCtx, ptr, chunkSize);
        ptr += chunkSize;
        left -= chunkSize;
    }

    ret = OH_Archive_StreamWrite_End(writeCtx, compressInfo);

    OH_Archive_StreamWrite_Destroy(writeCtx);
    free(srcBuffer);
}

// [Start stream_decompress_example]
static napi_value StreamDecompress(napi_env env, napi_callback_info info)
{
    size_t argc = 0;
    napi_get_cb_info(env, info, &argc, nullptr, nullptr, nullptr);

    int ret;
    // 初始化流式压缩配置，解压缩配置需与压缩时保持一致
    OH_Archive_Stream_Config config = {0};
    InitStreamConfig(&config);

    // 先通过流式压缩生成测试用的压缩数据
    uint64_t srcSize = 30 * 1024; // 数据长度为30 * 1024
    uint64_t zipSize = srcSize * 1.1;
    void *zipBuffer = reinterpret_cast<void *>(malloc(zipSize));
    OH_Archive_StreamInfo compressInfo = {0, 0, 0};
    CreateFileWithStreamWrite(&config, srcSize, zipBuffer, &compressInfo);

    // 创建流式解压缩读取器
    OH_Archive_StreamRead_Ctx readCtx = OH_Archive_StreamRead_Create(config);

    uint64_t unzipSize = srcSize;
    void *unzipBuffer = reinterpret_cast<void *>(malloc(unzipSize));

    // 启动流式解压缩，通过WriteHandler回调将解压后的数据写入unzipBuffer
    ret = OH_Archive_StreamRead_Start(readCtx, WriteHandler, unzipBuffer);

    // 分段输入压缩数据进行解压缩
    uint8_t *unzPtr = (uint8_t *)zipBuffer;
    size_t unzLeft = compressInfo.totalOutSize;

    while (unzLeft > 0) {
        size_t unzchunk = (unzLeft > 1024) ? 1024 : unzLeft; // 每次最多处理1024 bytes
        ret = OH_Archive_StreamRead_Update(readCtx, unzPtr, unzchunk);

        unzPtr += unzchunk;
        unzLeft -= unzchunk;
    }

    // 结束流式解压缩并获取解压缩结果信息
    OH_Archive_StreamInfo decompressInfo2 = {};
    ret = OH_Archive_StreamRead_End(readCtx, &decompressInfo2);

    // 销毁流式解压缩读取器，释放资源
    OH_Archive_StreamRead_Destroy(readCtx);

    free(zipBuffer);
    free(unzipBuffer);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
// [End stream_decompress_example]

// [Start stream_decompress_cancel_example]
static napi_value StreamDecompressCancel(napi_env env, napi_callback_info info)
{
    size_t argc = 0;
    napi_get_cb_info(env, info, &argc, nullptr, nullptr, nullptr);

    int ret;

    // 初始化流式压缩配置，解压缩配置需与压缩时保持一致
    OH_Archive_Stream_Config config = {0};
    InitStreamConfig(&config);

    // 先通过流式压缩生成测试用的压缩数据
    uint64_t srcSize = 30 * 1024; // 数据长度为30 * 1024
    uint64_t zipSize = srcSize * 1.1;
    void *zipBuffer = reinterpret_cast<void *>(malloc(zipSize));
    OH_Archive_StreamInfo compressInfo = {0, 0, 0};
    CreateFileWithStreamWrite(&config, srcSize, zipBuffer, &compressInfo);
    // 创建流式解压缩读取器
    OH_Archive_StreamRead_Ctx readCtx = OH_Archive_StreamRead_Create(config);

    uint64_t unzipSize = srcSize;
    void *unzipBuffer = reinterpret_cast<void *>(malloc(unzipSize));

    // 启动流式解压缩，通过WriteHandler回调将解压后的数据写入unzipBuffer
    ret = OH_Archive_StreamRead_Start(readCtx, WriteHandler, unzipBuffer);
    uint8_t *unzPtr = (uint8_t *)zipBuffer;
    size_t unzLeft = compressInfo.totalOutSize;

    // 分段输入压缩数据进行解压缩，剩余数据量小于阈值时取消解压缩
    while (unzLeft > 0) {
        size_t unzchunk = (unzLeft > 1024) ? 1024 : unzLeft; // 每次最多处理1024 bytes
        if (unzLeft < 20 * 1024) { // 剩余数据小于 20 * 1024 bytes时取消
            // 取消流式解压缩
            ret = OH_Archive_StreamRead_Cancel(readCtx);
            ret = OH_Archive_StreamRead_Update(readCtx, unzPtr, unzchunk);
            break;
        }
        ret = OH_Archive_StreamRead_Update(readCtx, unzPtr, unzchunk);

        unzPtr += unzchunk;
        unzLeft -= unzchunk;
    }

    // 结束流式解压缩，取消场景下不获取解压缩结果信息
    OH_Archive_StreamInfo *decompressInfo2 = nullptr;
    ret = OH_Archive_StreamRead_End(readCtx, decompressInfo2);
    // 销毁流式解压缩读取器，释放资源
    OH_Archive_StreamRead_Destroy(readCtx);

    free(zipBuffer);
    free(unzipBuffer);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
// [End stream_decompress_cancel_example]

static OH_Archive_ProgressType ProgressHandler(int progress, void *userData)
{
    if (progress > 0) {
        printf("\rProgress: %d%%\n", progress);
    }
    return OH_ARCHIVE_PROGRESS_CONTINUE;
}

// [Start zip_file_compress_example]
static napi_value ZipFileCompress(napi_env env, napi_callback_info info)
{
    // 获取输入文件路径和输出归档文件路径
    size_t argc = 2;
    napi_value argv[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);

    size_t inPathSize;
    size_t zipPathSize;
    char inPathBuf[PATH_BUFFER_SIZE];
    char zipPathBuf[PATH_BUFFER_SIZE];
    napi_get_value_string_utf8(env, argv[0], inPathBuf, sizeof(inPathBuf), &inPathSize);
    napi_get_value_string_utf8(env, argv[1], zipPathBuf, sizeof(zipPathBuf), &zipPathSize);

    // 创建测试文件并写入内容
    std::string content = "test content这是测试内容Hello, hello!第一行数据";
    std::string file(inPathBuf);
    std::ofstream stdfile(file, std::ios::out | std::ios::trunc);
    if (stdfile.is_open()) {
        stdfile << content;
        stdfile.close();
    }
    std::vector<const char *> srcFiles;
    srcFiles.push_back(file.c_str());

    int ret;
    // 打开归档文件并创建写入器，指定ZIP格式
    OH_Archive_Writer_Ctx arc = OH_Archive_Writer_OpenFile(zipPathBuf, OH_ARCHIVE_OPEN_MODE_CREATE, OH_ARCHIVE_FMT_ZIP);
    // 设置压缩算法为DEFLATE，压缩级别为6
    ret = OH_Archive_Writer_SetCompressMethod(arc, OH_ARCHIVE_COMPRESS_DEFLATE, int32_t(6)); // 压缩等级为6

    // 设置进度回调，用于获取压缩进度信息
    OH_Archive_ProgressHandlerWithData progressHandlerFunc = ProgressHandler;
    ret = OH_Archive_Writer_SetProgressHandlerWithData(arc, progressHandlerFunc, nullptr);
    // 添加文件到归档中
    ret = OH_Archive_Writer_Add(arc, srcFiles.data(), srcFiles.size());
    // 关闭归档写入器，完成压缩并释放资源
    ret = OH_Archive_Writer_Close(arc);
    napi_value retVal = nullptr;
    napi_create_int32(env, ret, &retVal);
    return retVal;
}
// [End zip_file_compress_example]

static int ArchiveCompressFile(const char *srcFile, const char *destFile)
{
    int ret;
    std::string content = "test content这是测试内容Hello, hello!第一行数据";
    std::string file(srcFile);
    std::ofstream stdfile(file, std::ios::out | std::ios::trunc);
    if (stdfile.is_open()) {
        stdfile << content;
        stdfile.close();
    }
    std::vector<const char *> src;
    src.push_back(file.c_str());

    std::string zipfile(destFile);
    OH_Archive_Writer_Ctx arc =
        OH_Archive_Writer_OpenFile(zipfile.c_str(), OH_ARCHIVE_OPEN_MODE_CREATE, OH_ARCHIVE_FMT_ZIP);
    if (arc == nullptr) {
        return -1;
    }

    ret = OH_Archive_Writer_SetCompressMethod(arc, OH_ARCHIVE_COMPRESS_DEFLATE, int32_t(6)); // 压缩等级为6
    if (ret != OH_ARCHIVE_OK) {
        return ret;
    }

    OH_Archive_ProgressHandlerWithData progressHandlerFunc = ProgressHandler;
    ret = OH_Archive_Writer_SetProgressHandlerWithData(arc, progressHandlerFunc, nullptr);
    if (ret != OH_ARCHIVE_OK) {
        return ret;
    }

    ret = OH_Archive_Writer_Add(arc, src.data(), 1);
    if (ret != OH_ARCHIVE_OK) {
        return ret;
    }

    ret = OH_Archive_Writer_Close(arc);
    if (ret != OH_ARCHIVE_OK) {
        return ret;
    }
    return OH_ARCHIVE_OK;
}

// [Start zip_file_decompress_example]
static napi_value ZipFileDecompress(napi_env env, napi_callback_info info)
{
    // 获取输入文件路径、归档文件路径和解压输出目录路径
    size_t argc = 3;
    napi_value argv[3] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);

    size_t inPathSize;
    size_t zipPathSize;
    size_t outDirSize;
    char inPathBuf[PATH_BUFFER_SIZE];
    char zipPathBuf[PATH_BUFFER_SIZE];
    char outDirBuf[PATH_BUFFER_SIZE];
    napi_get_value_string_utf8(env, argv[0], inPathBuf, sizeof(inPathBuf), &inPathSize);
    napi_get_value_string_utf8(env, argv[1], zipPathBuf, sizeof(zipPathBuf), &zipPathSize);
    napi_get_value_string_utf8(env, argv[2], outDirBuf, sizeof(outDirBuf), &outDirSize); // 第2个参数

    // 先压缩文件生成归档文件，用于后续解压缩
    int ret = ArchiveCompressFile(inPathBuf, zipPathBuf);
    // 打开归档文件并创建读取器
    OH_Archive_Reader_Ctx ctx = OH_Archive_Reader_OpenFile(zipPathBuf);
    int userData[2] = {0};
    // 设置解压缩进度回调
    ret = OH_Archive_Reader_SetProgressHandlerWithData(ctx, ProgressHandler, (void *)userData);
    // 解压缩归档文件中的所有文件到指定目录
    ret = OH_Archive_Reader_ExtractAllFile(ctx, outDirBuf);
    // 关闭归档读取器，释放资源
    ret = OH_Archive_Reader_Close(ctx);

    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
// [End zip_file_decompress_example]

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"BufferCompress", nullptr, BufferCompress, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"BufferDecompress", nullptr, BufferDecompress, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"StreamCompress", nullptr, StreamCompress, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"StreamDecompress", nullptr, StreamDecompress, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"StreamDecompressCancel", nullptr, StreamDecompressCancel, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ZipFileCompress", nullptr, ZipFileCompress, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ZipFileDecompress", nullptr, ZipFileDecompress, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"StreamCompressCancel", nullptr, StreamCompressCancel, nullptr, nullptr, nullptr, napi_default, nullptr},
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}
EXTERN_C_END

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "entry",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void) { napi_module_register(&demoModule); }