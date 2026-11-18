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

import bridge from 'libentry.so';
import { DrawContext, FrameNode, NodeController, RenderNode, Size } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';
import { image } from '@kit.ImageKit';
import { Logger } from '../common/Logger';
import { GROUP_CANVAS } from './SchemaTypes';

// 通用能力域渲染节点：场景编号与参数数组直传 native，绘制逻辑全部在 C++ 侧。
export class CapabilityRenderNode extends RenderNode {
  private group: number = GROUP_CANVAS;
  private sceneId: number = 0;
  private params: number[] = [];
  // 像素图能力域需要外部图片，其余能力域保持 undefined，native 侧对应场景降级为示意。
  private pixelMap: image.PixelMap | undefined = undefined;

  applyScene(group: number, sceneId: number, params: number[]): void {
    this.group = group;
    this.sceneId = sceneId;
    this.params = params;
    this.invalidateSafely();
  }

  applyPixelMap(pixelMap: image.PixelMap | undefined): void {
    this.pixelMap = pixelMap;
    this.invalidateSafely();
  }

  groupId(): number {
    return this.group;
  }

  sceneNumber(): number {
    return this.sceneId;
  }

  draw(context: DrawContext): void {
    // sizeInPixel 直接给出像素尺寸，与 native 侧坐标系一致。
    const size: Size = context.sizeInPixel;
    // 第 7 个参数是可选 PixelMap：像素图能力域拿到它才会真实贴图，缺失时画示意图。
    bridge.nativeRenderScene(context, size.width, size.height, this.group, this.sceneId, this.params,
      this.pixelMap);
  }

  private invalidateSafely(): void {
    try {
      if (!this.isDisposed()) {
        this.invalidate();
      }
    } catch (error) {
      Logger.error('invalidate render node failed, message=' + (error as BusinessError).message);
    }
  }
}

// 能力域节点控制器：负责创建根 FrameNode、挂载渲染节点并维护尺寸。
export class CapabilityController extends NodeController {
  private frameNode: FrameNode | null = null;
  private renderNode: CapabilityRenderNode | null = null;
  // NodeContainer 第一次布局前到达的场景与尺寸必须先缓存，否则首帧会用默认值绘制。
  private pendingGroup: number = GROUP_CANVAS;
  private pendingScene: number = 0;
  private pendingParams: number[] = [];
  private pendingWidth: number = 0;
  private pendingHeight: number = 0;
  private pendingPixelMap: image.PixelMap | undefined = undefined;

  makeNode(uiContext: UIContext): FrameNode | null {
    this.frameNode = new FrameNode(uiContext);
    const host: RenderNode | null = this.frameNode.getRenderNode();
    if (host === null) {
      Logger.error('CapabilityController makeNode failed, root render node is null');
      return this.frameNode;
    }
    this.renderNode = new CapabilityRenderNode();
    // 此刻尺寸仍为 0，补发场景只会画出空帧，统一等第一个有效尺寸到达后再补发。
    this.applyPendingSize();
    try {
      host.appendChild(this.renderNode);
    } catch (error) {
      Logger.error('append capability node failed, message=' + (error as BusinessError).message);
    }
    if (this.pendingPixelMap !== undefined) {
      // 图片通常在节点挂载之后才解码完成，挂载时补一次以免首帧丢失。
      this.renderNode.applyPixelMap(this.pendingPixelMap);
    }
    return this.frameNode;
  }

  getNode(): CapabilityRenderNode | null {
    return this.renderNode;
  }

  applyScene(group: number, sceneId: number, params: number[]): void {
    this.pendingGroup = group;
    this.pendingScene = sceneId;
    this.pendingParams = params;
    if (this.renderNode === null) {
      return;
    }
    this.renderNode.applyScene(group, sceneId, params);
  }

  // 像素图能力域的图片通道：页面异步解码完成后把 PixelMap 交给渲染节点。
  applyPixelMap(pixelMap: image.PixelMap | undefined): void {
    this.pendingPixelMap = pixelMap;
    if (this.renderNode === null) {
      return;
    }
    this.renderNode.applyPixelMap(pixelMap);
  }

  resize(width: number, height: number): void {
    if (width <= 0 || height <= 0) {
      return;
    }
    this.pendingWidth = width;
    this.pendingHeight = height;
    if (this.renderNode === null) {
      return;
    }
    try {
      this.applyPendingSize();
      // 页面在节点挂载前就选定的场景在此补发，applyScene 内部会触发重绘。
      this.renderNode.applyScene(this.pendingGroup, this.pendingScene, this.pendingParams);
    } catch (error) {
      Logger.error('resize capability node failed, message=' + (error as BusinessError).message);
    }
  }

  private applyPendingSize(): void {
    if (this.renderNode === null || this.pendingWidth <= 0 || this.pendingHeight <= 0) {
      return;
    }
    this.renderNode.frame = { x: 0, y: 0, width: this.pendingWidth, height: this.pendingHeight };
  }

  disposeNode(): void {
    if (this.renderNode !== null && !this.renderNode.isDisposed()) {
      this.renderNode.dispose();
    }
    this.renderNode = null;
    this.frameNode = null;
    this.pendingPixelMap = undefined;
  }
}
