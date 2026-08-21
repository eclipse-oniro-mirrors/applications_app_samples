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

// [Start the_arkts_interface_is_exposed_on_the_node_api_side]
// entry5/src/main/cpp/types/libentry5/index.d.ts
export function nativeWebInit(webName: string): void {}
export function createWebMessagePorts(webName: string): void {}
export function postMessage(webName: string): void {}
export function postNoneMessage(webName: string): void {}
export function setMessageEventHandler(webName: string): void {}
export function closeMessagePort(webName: string): void {}
export function destroyMessagePort(webName: string): void {}
export function postBufferMessage(webName: string): void {}
export function destroyNullMessagePort(webName: string): void {}
export function setMessageEventHandlerThread(webName: string): void {}
export function postMessageThread(webName: string): void {}
// [End the_arkts_interface_is_exposed_on_the_node_api_side]