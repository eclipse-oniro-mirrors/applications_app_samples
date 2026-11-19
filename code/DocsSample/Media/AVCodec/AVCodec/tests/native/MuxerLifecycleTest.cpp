/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include "TestCheck.h"
#include "capabilities/include/muxer.h"

struct OH_AVMuxer {};

namespace {
constexpr int32_t OUTPUT_FD = 23;
OH_AVMuxer g_muxer;
OH_AVErrCode g_destroyStatus = AV_ERR_OK;
int32_t g_destroyCalls = 0;
using TestSupport::Require;

// 直接调用生产Muxer，检查显式释放和析构均不重复销毁句柄。
void TestExplicitRelease(OH_AVErrCode destroyStatus)
{
    g_destroyStatus = destroyStatus;
    g_destroyCalls = 0;
    {
        Muxer muxer;
        Require(muxer.Release() == AVCODEC_SAMPLE_ERR_OK && g_destroyCalls == 0,
            "Empty muxer release does not call Destroy");
        Require(muxer.Create(OUTPUT_FD, AV_OUTPUT_FORMAT_MPEG_4) == AVCODEC_SAMPLE_ERR_OK, "Create muxer");
        Require(muxer.Release() == AVCODEC_SAMPLE_ERR_OK && g_destroyCalls == 1,
            "Release keeps its existing return contract and destroys the handle once");
        Require(muxer.Release() == AVCODEC_SAMPLE_ERR_OK && g_destroyCalls == 1,
            "Repeated release does not retry the consumed handle");
    }
    Require(g_destroyCalls == 1, "Destructor does not destroy an explicitly released muxer again");
}

void TestDestructorCleanup()
{
    g_destroyStatus = AV_ERR_OK;
    g_destroyCalls = 0;
    {
        Muxer muxer;
        Require(muxer.Create(OUTPUT_FD, AV_OUTPUT_FORMAT_MPEG_4) == AVCODEC_SAMPLE_ERR_OK, "Create owned muxer");
    }
    Require(g_destroyCalls == 1, "Destructor releases a remaining muxer handle");
}
}

extern "C" OH_AVMuxer *FakeMuxerCreate(int32_t fd, OH_AVOutputFormat format)
    __asm__("OH_AVMuxer_Create");
extern "C" OH_AVMuxer *FakeMuxerCreate(int32_t fd, OH_AVOutputFormat format)
{
    Require(fd == OUTPUT_FD && format == AV_OUTPUT_FORMAT_MPEG_4, "Create preserves the fd and container format");
    return &g_muxer;
}

extern "C" OH_AVErrCode FakeMuxerDestroy(OH_AVMuxer *muxer)
    __asm__("OH_AVMuxer_Destroy");
extern "C" OH_AVErrCode FakeMuxerDestroy(OH_AVMuxer *muxer)
{
    Require(muxer == &g_muxer, "Destroy uses the created handle");
    ++g_destroyCalls;
    return g_destroyStatus;
}

extern "C" int FakeLogPrint(LogType, LogLevel, unsigned int, const char *, const char *, ...)
    __asm__("OH_LOG_Print");
extern "C" int FakeLogPrint(LogType, LogLevel, unsigned int, const char *, const char *, ...)
{
    return 0;
}

int main()
{
    TestExplicitRelease(AV_ERR_OK);
    TestExplicitRelease(AV_ERR_UNKNOWN);
    TestDestructorCleanup();
    std::cout << "Muxer production lifecycle passed" << std::endl;
}
