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

#ifndef OHOS_IPC_TEST_EVENT_CALLBACK_PROXY_H
#define OHOS_IPC_TEST_EVENT_CALLBACK_PROXY_H

#include "itest_event_callback.h"

namespace OHOS {
namespace IPC {

class TestEventCallbackProxy : public ITestEventCallback {
public:
    explicit TestEventCallbackProxy(OHIPCRemoteProxy* remote) : remoteProxy_(remote) {}
    ~TestEventCallbackProxy() override = default;

    OHIPCRemoteProxy* GetRemoteProxy() const
    {
        return remoteProxy_;
    }

    ErrCode WriteRemoteObject(OHIPCParcel* parcel) const override;

    ErrCode OnConnected(int32_t clientId, const std::string& welcome) override;
    ErrCode OnDisconnected(const std::string& reason) override;
    ErrCode GetVersion(std::string& result) override;
    ErrCode GetTaiheVersion(std::string& result) override;

private:
    OHIPCRemoteProxy* remoteProxy_ = nullptr;
};

} // namespace IPC
} // namespace OHOS

#endif // OHOS_IPC_TEST_EVENT_CALLBACK_PROXY_H
