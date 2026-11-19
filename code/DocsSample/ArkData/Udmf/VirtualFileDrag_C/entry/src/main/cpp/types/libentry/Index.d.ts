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

import type { NodeContent } from '@kit.ArkUI';

// 创建原生拖起区和落入区，onReceive接收URI列表，dropLabel为本地化文字。
export const createNativeNode:
  (content: NodeContent, onReceive: (uris: string[]) => void, dropLabel: string) => void;
// 释放当前页面创建的原生节点与业务回调引用。
export const destroyNativeNode: () => void;
// 设置导出场景与本地化的拖起区文字。
export const configure: (directory: boolean, compressed: boolean, sourceLabel: string) => void;
