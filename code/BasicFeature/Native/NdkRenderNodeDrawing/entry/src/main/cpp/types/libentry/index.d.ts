/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { DrawContext } from '@kit.ArkUI';
import { image } from '@kit.ImageKit';

export interface TextMeasureResult {
  width: number;
  height: number;
}

/**
 * 在 RenderNode 的绘制回调中调用，将绘制工作转交 Native Drawing。
 *
 * @param context DrawContext，由 RenderNode.draw 提供
 * @param width 画布宽度，单位像素，取自 DrawContext.sizeInPixel
 * @param height 画布高度，单位像素，取自 DrawContext.sizeInPixel
 * @param scene 场景编号，见 SceneType.ets
 * @param kind 场景内种类编号
 * @param pixelMap 图片场景必填，其余场景可省略
 */
export const nativeRenderDraw: (context: DrawContext, width: number, height: number, scene: number,
  kind: number, pixelMap?: image.PixelMap) => void;

/**
 * 能力域统一绘制入口：按 group + scene 分派到对应的 native 能力模块。
 *
 * @param context DrawContext，由 RenderNode.draw 提供
 * @param width 画布宽度，单位像素
 * @param height 画布高度，单位像素
 * @param group 能力域编号，见 core/SchemaTypes.ets 的 GROUP_* 常量
 * @param scene 能力域内场景编号，与 schema 中的 SceneSpec.id 一致
 * @param params 参数数组，下标顺序与 schema 中的 ParamSpec 声明顺序一致
 * @param pixelMap 像素图能力域可选传入，省略或解析失败时场景降级为示意图
 */
export const nativeRenderScene: (context: DrawContext, width: number, height: number, group: number,
  scene: number, params: number[], pixelMap?: image.PixelMap) => void;

/**
 * 测量文本占用尺寸，失败时返回 undefined。
 *
 * @param text 待测量文本
 * @param fontSize 字号，单位像素
 * @param maxWidth 最大排版宽度，单位像素
 */
export const nativeMeasureText: (text: string, fontSize: number, maxWidth: number) =>
  TextMeasureResult | undefined;
