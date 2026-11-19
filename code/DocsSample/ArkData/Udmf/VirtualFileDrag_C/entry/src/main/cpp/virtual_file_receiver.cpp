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
#include "virtual_file_receiver.h"

#include <database/udmf/uds.h>
#include <database/udmf/udmf.h>
#include <database/udmf/udmf_err_code.h>
#include <memory>

// [Start virtual_drag_c_receive_data]
bool GetDroppedFileUris(ArkUI_DragEvent* event, std::vector<std::string>& uris)
{
    std::unique_ptr<OH_UdmfData, decltype(&OH_UdmfData_Destroy)> data(
        OH_UdmfData_Create(), OH_UdmfData_Destroy);
    if (!data || OH_ArkUI_DragEvent_GetUdmfData(event, data.get()) != 0) {
        return false;
    }
    unsigned int count = 0;
    // records及各record由data持有，不能单独销毁。
    OH_UdmfRecord** records = OH_UdmfData_GetRecords(data.get(), &count);
    if (records == nullptr) {
        return false;
    }
    for (unsigned int index = 0; index < count; ++index) {
        std::unique_ptr<OH_UdsFileUri, decltype(&OH_UdsFileUri_Destroy)> fileUri(
            OH_UdsFileUri_Create(), OH_UdsFileUri_Destroy);
        if (!fileUri || OH_UdmfRecord_GetFileUri(records[index], fileUri.get()) != UDMF_E_OK) {
            continue;
        }
        const char* uri = OH_UdsFileUri_GetFileUri(fileUri.get());
        if (uri != nullptr && uri[0] != '\0') {
            // 复制字符串后交给业务使用，不保留临时对象中的指针。
            uris.emplace_back(uri);
        }
    }
    return !uris.empty();
}
// [End virtual_drag_c_receive_data]
