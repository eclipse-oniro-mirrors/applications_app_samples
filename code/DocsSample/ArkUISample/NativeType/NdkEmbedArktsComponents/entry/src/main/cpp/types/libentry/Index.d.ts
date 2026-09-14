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
import { ComponentContent, NodeContent, RefreshModifier } from '@kit.ArkUI';

interface NativeRefreshAttribute {
  isRefreshing: boolean;
  width?: number;
  height?: number;
  backgroundColor?: number;
  refreshOffset?: number;
  pullToRefresh?: boolean;
  onRefreshing?: () => void;
  onOffsetChange?: (offset: number) => void;
}

interface RefreshAttribute {
  isRefreshing: boolean;
  modifier?: RefreshModifier;
  slot?: NodeContent;
  onRefreshing?: () => void;
  onOffsetChange?: (offset: number) => void;
}

interface MixedModuleResult {
  content: ComponentContent<RefreshAttribute>;
  childSlot: NodeContent;
}

export const createNativeRoot: (content: NodeContent) => void;
export const destroyNativeRoot: () => void;

export const registerCreateMixedRefreshNode: (
  callback: (value: NativeRefreshAttribute) => MixedModuleResult) => void;
export const registerUpdateMixedRefreshNode: (
  callback: (refresh: ComponentContent<RefreshAttribute>, childSlot: NodeContent,
    value: NativeRefreshAttribute) => void) => void;
// [End bridge_index]
