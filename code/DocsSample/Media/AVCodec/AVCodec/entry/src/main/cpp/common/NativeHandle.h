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

#ifndef AVCODEC_SAMPLE_NATIVE_HANDLE_H
#define AVCODEC_SAMPLE_NATIVE_HANDLE_H

#include <type_traits>
#include <cstdint>
#include <utility>

// 调用方先停止使用者和回调，再显式Close检查结果。析构只兜底，不替代会话退出协议。
template<typename T, auto Destroy>
class NativeHandle {
public:
    NativeHandle() = default;
    ~NativeHandle() { (void)Close(); }
    NativeHandle(const NativeHandle &) = delete;
    NativeHandle &operator=(const NativeHandle &) = delete;
    NativeHandle(NativeHandle &&other) noexcept : handle_(std::exchange(other.handle_, nullptr)) {}
    NativeHandle &operator=(NativeHandle &&other) noexcept
    {
        if (this != &other) { (void)Close(); handle_ = std::exchange(other.handle_, nullptr); }
        return *this;
    }
    NativeHandle &operator=(T *handle)
    {
        if (handle_ != handle) { (void)Close(); handle_ = handle; }
        return *this;
    }
    operator T *() const { return handle_; }
    T *Get() const { return handle_; }
    T **Put() { (void)Close(); return &handle_; }
    int32_t Close()
    {
        T *handle = std::exchange(handle_, nullptr);
        if (handle == nullptr) { return 0; }
        // 不重试已交给Destroy的地址，避免释放结果不明时误销毁复用的句柄。
        if constexpr (std::is_void_v<decltype(Destroy(handle))>) {
            Destroy(handle);
            return 0;
        } else {
            return static_cast<int32_t>(Destroy(handle));
        }
    }
private:
    T *handle_ = nullptr;
};
#endif
