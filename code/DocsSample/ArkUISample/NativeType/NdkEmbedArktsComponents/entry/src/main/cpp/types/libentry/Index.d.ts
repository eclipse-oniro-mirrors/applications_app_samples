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
// [Start bridge_index]
import { NodeContent } from '@kit.ArkUI';

export const createNativeRoot: (content: NodeContent) => void;
export const destroyNativeRoot: () => void;

export const registerCreateMixedRefreshNode: (callback: (value: Object) => Object) => void;
export const registerUpdateMixedRefreshNode: (
  callback: (refresh: Object, childSlot: Object, value: Object) => void) => void;
// [End bridge_index]
