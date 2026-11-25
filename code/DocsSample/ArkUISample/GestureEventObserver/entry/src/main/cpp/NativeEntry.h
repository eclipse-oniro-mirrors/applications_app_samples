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
// NativeEntry.h
#ifndef GESTURE_EVENT_OBSERVER_NATIVE_ENTRY_H
#define GESTURE_EVENT_OBSERVER_NATIVE_ENTRY_H

#include "napi/native_api.h"

namespace GestureEventObserver {

// ArkTS侧调用入口：入参为UIContext，注册交互事件观察者。
napi_value RegisterObserver(napi_env env, napi_callback_info info);

// ArkTS侧调用入口：注销已注册的交互事件观察者。
napi_value UnregisterObserver(napi_env env, napi_callback_info info);

} // namespace GestureEventObserver

#endif // GESTURE_EVENT_OBSERVER_NATIVE_ENTRY_H
