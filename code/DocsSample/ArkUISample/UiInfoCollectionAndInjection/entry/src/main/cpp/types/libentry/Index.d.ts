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
import type { NodeContent, UIContext } from '@kit.ArkUI';
import type { image } from '@kit.ImageKit';

export interface TreeOptions {
  visibleOnly: boolean;
  filterLayout: boolean;
  interaction: boolean;
  accessibility: boolean;
  visual: boolean;
  functional: boolean;
}

export interface CommandResult {
  result: number;
}

// [Start ui_command_bridge_type]
export const injectCommand: (context: UIContext, nodeId: number, command: string) => Promise<CommandResult>;
// [End ui_command_bridge_type]

export const collectTree: (context: UIContext, options: TreeOptions) => string;

export const collectTreeAsync: (context: UIContext, options: TreeOptions) => Promise<string>;

// [Start ndk_image_result_type]
export interface ImageItemResult {
  // Node id of this item. The framework returns one item per requested id, failures included.
  nodeId: number;
  // Result of consuming the item from the collection. 0 means the item was consumed.
  takeError: number;
  // Result of collecting this node image. Non-zero means this item has no image.
  itemError: number;
  // Image size in pixels. Both fields are absent when the item has no image.
  width?: number;
  height?: number;
  // Collected image. The sample releases nothing here: ArkTS owns the object.
  pixelMap?: image.PixelMap;
}

export interface ImageCollectionResult {
  // Result of submitting the request. Non-zero means the request was rejected and no item exists.
  submitError: number;
  // Overall result reported by the callback. Partial failure still delivers every item. A rejected
  // request reports the same code as submitError, because the callback never runs.
  overallError: number;
  items: ImageItemResult[];
}
// [End ndk_image_result_type]

// [Start ndk_image_bridge_type]
// nodeIds are the unique ids of the target nodes.
export const collectImages: (nodeIds: number[]) => Promise<ImageCollectionResult>;
// [End ndk_image_bridge_type]

// [Start ndk_image_anchor_type]
// The page hosts a native anchor node in a NodeContent, and the capture context is resolved from it.
export const attachImageAnchor: (content: NodeContent) => void;

export const detachImageAnchor: () => void;
// [End ndk_image_anchor_type]
