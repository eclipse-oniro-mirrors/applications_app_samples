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
  // 本结果项的节点ID。每个请求的节点ID都有一项，失败项也包含在内。
  nodeId: number;
  // 从集合中取出该项的结果。0表示取出成功。
  takeError: number;
  // 该节点图片的采集结果。非0表示该项没有图片。
  itemError: number;
  // 图片的像素尺寸。该项没有图片时这两个字段不存在。
  width?: number;
  height?: number;
  // 采集到的图片。示例在此不释放，对象由ArkTS持有。
  pixelMap?: image.PixelMap;
}

export interface ImageCollectionResult {
  // 请求的受理结果。非0表示请求被拒绝，没有任何结果项。
  submitError: number;
  // 回调上报的整体结果。部分失败时仍会返回全部结果项。
  // 请求被拒绝时不会执行回调，此处与submitError相同。
  overallError: number;
  items: ImageItemResult[];
}
// [End ndk_image_result_type]

// [Start ndk_image_bridge_type]
// nodeIds为各目标节点的唯一节点ID。
export const collectImages: (nodeIds: number[]) => Promise<ImageCollectionResult>;
// [End ndk_image_bridge_type]

// [Start ndk_image_anchor_type]
// 页面通过NodeContent挂载一个native锚点节点，采集上下文从该节点反查获得。
export const attachImageAnchor: (content: NodeContent) => void;

export const detachImageAnchor: () => void;
// [End ndk_image_anchor_type]
