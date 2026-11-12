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

#include "virtual_file_provider.h"

#include <database/udmf/uds.h>
#include <database/udmf/udmf_err_code.h>
#include <hilog/log.h>
#include <zlib.h>
#include <algorithm>
#include <chrono>
#include <cstring>
#include <map>
#include <memory>
#include <mutex>
#include <string>
#include <vector>

namespace {
constexpr uint32_t MAX_READ = 5 * 1024 * 1024;
constexpr uint32_t SAMPLE_LOG_DOMAIN = 0xD004101;
constexpr char SAMPLE_LOG_TAG[] = "VirtualFileDragC";

struct SourceFile {
    std::string name;
    std::string id;
    int64_t modifyTime = 0;
    int64_t size = 0;
    std::vector<uint8_t> content;
    std::vector<uint8_t> compressed;
};

struct ProviderContext {
    std::mutex mutex;
    std::map<std::string, SourceFile> files;
};

OH_UDMF_VirtualItem* CreateFile(const SourceFile& file)
{
    auto* item = OH_UDMF_CreateVirtualFileItem(file.name.c_str(), file.id.c_str(), file.modifyTime);
    if (item == nullptr || OH_UDMF_SetVirtualFileSize(item, file.size) != UDMF_E_OK) {
        OH_UDMF_DestroyVirtualItem(item);
        return nullptr;
    }
    return item;
}

// [Start virtual_drag_c_callbacks]
OH_UDMF_VirtualItem* OnStat(void* opaque, const char* id)
{
    if (opaque == nullptr || id == nullptr) {
        return nullptr;
    }
    auto* context = static_cast<ProviderContext*>(opaque);
    std::lock_guard<std::mutex> lock(context->mutex);
    auto source = context->files.find(id);
    // 返回独立节点，返回后由 UDMF 接管，不能再次销毁该节点。
    return source == context->files.end() ? nullptr : CreateFile(source->second);
}

int OnRead(void* opaque, const char* id, int64_t offset, uint32_t length,
    uint8_t* data, uint32_t* bytesRead)
{
    if (opaque == nullptr || id == nullptr || data == nullptr || bytesRead == nullptr ||
        offset < 0 || length == 0 || length > MAX_READ) {
        return UDMF_ERR;
    }
    *bytesRead = 0;
    auto* context = static_cast<ProviderContext*>(opaque);
    std::lock_guard<std::mutex> lock(context->mutex);
    auto source = context->files.find(id);
    if (source == context->files.end()) {
        return UDMF_ERR;
    }
    SourceFile& file = source->second;
    if (offset >= file.size) {
        return UDMF_E_OK;
    }
    if (file.content.empty() && !file.compressed.empty()) {
        // 示例压缩数据在准备阶段生成；到第一次读取时才解压。
        std::vector<uint8_t> decoded(static_cast<size_t>(file.size));
        uLongf actual = decoded.size();
        if (uncompress(decoded.data(), &actual, file.compressed.data(), file.compressed.size()) != Z_OK ||
            actual != static_cast<uLongf>(file.size)) {
            return UDMF_ERR;
        }
        file.content = std::move(decoded);
    }
    const auto count = static_cast<uint32_t>(std::min<int64_t>(length, file.size - offset));
    if (static_cast<uint64_t>(offset) + count > file.content.size()) {
        return UDMF_ERR;
    }
    // data 由 UDMF 提供，本回调只填充数据，不释放、不保存该地址。
    std::memcpy(data, file.content.data() + offset, count);
    *bytesRead = count;
    OH_LOG_Print(LOG_APP, LOG_INFO, SAMPLE_LOG_DOMAIN, SAMPLE_LOG_TAG,
        "onRead id=%{public}s offset=%{public}lld bytes=%{public}u", id,
        static_cast<long long>(offset), count);
    return UDMF_E_OK;
}

int OnCancel(void* opaque, const char* const* idList, uint32_t count)
{
    // 此示例无异步读取任务；真实提供方可在此停止对应 id 的待处理任务。
    if (opaque == nullptr || (count > 0 && idList == nullptr)) {
        return UDMF_ERR;
    }
    OH_LOG_Print(LOG_APP, LOG_INFO, SAMPLE_LOG_DOMAIN, SAMPLE_LOG_TAG, "onCancel count=%{public}u", count);
    return UDMF_E_OK;
}

void Finalize(void* opaque)
{
    delete static_cast<ProviderContext*>(opaque);
}
// [End virtual_drag_c_callbacks]

bool AddFile(ProviderContext& context, int index, bool compressed)
{
    SourceFile file;
    file.id = "document-" + std::to_string(index);
    file.name = "document-" + std::to_string(index + 1) + ".txt";
    file.modifyTime = std::chrono::duration_cast<std::chrono::milliseconds>(
        std::chrono::system_clock::now().time_since_epoch()).count();
    std::string text = "OpenHarmony virtual document " + std::to_string(index + 1) +
        "\nContent is supplied when the target reads the file.\n";
    file.size = static_cast<int64_t>(text.size());
    file.content.assign(text.begin(), text.end());
    if (compressed) {
        uLongf length = compressBound(file.content.size());
        file.compressed.resize(length);
        if (compress(file.compressed.data(), &length, file.content.data(), file.content.size()) != Z_OK) {
            return false;
        }
        file.compressed.resize(length);
        file.content.clear();
    }
    context.files.emplace(file.id, std::move(file));
    return true;
}

bool AddChild(OH_UDMF_VirtualItem* parent, OH_UDMF_VirtualItem* child)
{
    const bool result = child != nullptr && OH_UDMF_AddVirtualItemChild(parent, child) == UDMF_E_OK;
    // AddChild 复制节点，调用方仍须释放原节点。
    OH_UDMF_DestroyVirtualItem(child);
    return result;
}

OH_UDMF_VirtualItem* CreateRoot(const ProviderContext& context, bool directory)
{
    if (!directory) {
        return CreateFile(context.files.begin()->second);
    }
    const auto time = context.files.begin()->second.modifyTime;
    auto* root = OH_UDMF_CreateVirtualDirectoryItem("exported-documents", time);
    auto* folder = OH_UDMF_CreateVirtualDirectoryItem("attachments", time);
    if (root == nullptr || folder == nullptr) {
        OH_UDMF_DestroyVirtualItem(root);
        OH_UDMF_DestroyVirtualItem(folder);
        return nullptr;
    }
    bool ok = true;
    for (const auto& pair : context.files) {
        ok = AddChild(folder, CreateFile(pair.second)) && ok;
    }
    ok = AddChild(root, folder) && ok;
    if (!ok) {
        OH_UDMF_DestroyVirtualItem(root);
        return nullptr;
    }
    return root;
}
} // namespace

// [Start virtual_drag_c_data]
OH_UdmfData* CreateVirtualDragData(bool directory, bool compressed)
{
    auto context = std::make_unique<ProviderContext>();
    for (int index = 0; index < (directory ? 3 : 1); ++index) {
        if (!AddFile(*context, index, compressed)) {
            return nullptr;
        }
    }
    auto* root = CreateRoot(*context, directory);
    OH_UDMF_VirtualFileCallbacks callbacks {};
    callbacks.structSize = sizeof(callbacks);
    callbacks.onStat = OnStat;
    callbacks.onRead = OnRead;
    callbacks.onCancel = OnCancel;
    auto* info = OH_UDMF_CreateVirtualFileInfo(root, &callbacks, context.get(), Finalize);
    OH_UDMF_DestroyVirtualItem(root);
    if (info == nullptr) {
        return nullptr; // context 仍由调用方管理。
    }
    context.release(); // 创建成功，交由 UDMF 在最后一个引用释放后调用 Finalize。
    auto* uri = OH_UdsFileUri_Create();
    auto* record = OH_UdmfRecord_Create();
    auto* data = OH_UdmfData_Create();
    bool ok = uri != nullptr && record != nullptr && data != nullptr;
    if (ok) {
        ok = OH_UdsFileUri_SetFileUri(uri, directory ? "file:///virtual/exported-documents" :
            "file:///virtual/document-1.txt") == UDMF_E_OK &&
            OH_UdsFileUri_SetFileType(uri, directory ? "general.directory" : "general.file") == UDMF_E_OK &&
            OH_UDMF_SetFileUriVirtualEntry(uri, info) == UDMF_E_OK &&
            OH_UdmfRecord_AddFileUri(record, uri) == UDMF_E_OK &&
            OH_UdmfData_AddRecord(data, record) == UDMF_E_OK;
    }
    // Record 已持有独立引用，可清理临时包装对象。
    if (uri != nullptr) {
        OH_UDMF_ClearFileUriVirtualEntry(uri);
    }
    OH_UDMF_DestroyVirtualFileInfo(info);
    OH_UdsFileUri_Destroy(uri);
    OH_UdmfRecord_Destroy(record);
    if (!ok) {
        OH_UdmfData_Destroy(data);
        return nullptr;
    }
    return data;
}
// [End virtual_drag_c_data]
