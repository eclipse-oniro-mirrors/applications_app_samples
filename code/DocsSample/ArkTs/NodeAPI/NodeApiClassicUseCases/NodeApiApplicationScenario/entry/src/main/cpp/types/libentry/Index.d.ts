/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
// [Start napi_ark_runtime_dts]
export const createArkRuntime: () => object;
// [End napi_ark_runtime_dts]
// [Start napi_event_loop_dts]
export const runEventLoop: (isDefault: boolean) => object;
// [End napi_event_loop_dts]
// [Start napi_call_threadsafe_function_with_priority_dts]
export const callThreadSafeWithPriority: (cb: (a: number, b: number) => number) => void;
// [End napi_call_threadsafe_function_with_priority_dts]