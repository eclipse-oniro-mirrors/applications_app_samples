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

#include <stdio.h>

#include "video_sample_common.h"
#include "video_sample_bind.h"
#include "video_sample_listen.h"

enum {
    VS_ROLE_MENU_BIND = 0,
    VS_ROLE_MENU_LISTEN,
    VS_ROLE_MENU_ONLINE,
    VS_ROLE_MENU_EXIT,
};

static void PrintRoleMenu(void)
{
    char localName[VS_DEVICE_NAME_LEN] = {0};
    VsGetLocalDeviceName(localName, sizeof(localName));
    printf("\n===== 视频投屏 Sample (本机: %s) =====\n",
        localName[0] != '\0' ? localName : "unknown");
    printf("  0 - 投屏 (相机/发送端)\n");
    printf("  1 - 接收 (电视/接收端)\n");
    printf("  2 - 查看在线设备\n");
    printf("  3 - 退出\n");
    printf("======================================\n");
}

int main(void)
{
    bool isWorking = true;
    while (isWorking) {
        PrintRoleMenu();
        int32_t choice = VsGetInputNumber("请选择:");
        switch (choice) {
            case VS_ROLE_MENU_BIND:
                VsMenuBind();
                isWorking = false;
                break;
            case VS_ROLE_MENU_LISTEN:
                VsMenuListen();
                isWorking = false;
                break;
            case VS_ROLE_MENU_ONLINE:
                VsPrintOnlineDevices();
                break;
            case VS_ROLE_MENU_EXIT:
                printf("BYE\n");
                isWorking = false;
                break;
            default:
                printf("无效输入: %d\n", choice);
                break;
        }
    }
}