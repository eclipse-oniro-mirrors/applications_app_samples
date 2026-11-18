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

#include "custdata_sample_common.h"
#include "custdata_sample_publish.h"
#include "custdata_sample_refresh.h"

enum {
    CD_ROLE_MENU_PUBLISH = 0,
    CD_ROLE_MENU_REFRESH,
    CD_ROLE_MENU_EXIT,
};

static void PrintRoleMenu(void)
{
    char localName[DEVICE_NAME_BUF_LEN] = {0};
    CdGetLocalDeviceName(localName, sizeof(localName));
    printf("\n===== 设备互联演示 (本机: %s) =====\n",
        localName[0] != '\0' ? localName : "unknown");
    printf("  0 - 发布端（等待被发现）\n");
    printf("  1 - 发现端（发现附近设备）\n");
    printf("  2 - 退出\n");
    printf("=======================================\n");
}

int main(void)
{
    bool isWorking = true;
    while (isWorking) {
        PrintRoleMenu();
        int32_t choice = CdGetInputNumber("请选择:");
        switch (choice) {
            case CD_ROLE_MENU_PUBLISH:
                CdMenuPublish();
                break;
            case CD_ROLE_MENU_REFRESH:
                CdMenuRefresh();
                break;
            case CD_ROLE_MENU_EXIT:
                printf("BYE\n");
                isWorking = false;
                break;
            default:
                printf("无效输入: %d\n", choice);
                break;
        }
    }
    return 0;
}