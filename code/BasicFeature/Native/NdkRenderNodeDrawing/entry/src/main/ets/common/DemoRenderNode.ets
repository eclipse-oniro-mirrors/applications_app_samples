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
import { Logger } from './Logger';
import { SCENE_SHAPE, SHAPE_POINT } from './SceneType';

// 演示用 RenderNode：持有场景参数，绘制时通过 NAPI 交给 Native Drawing 完成。
export class DemoRenderNode extends RenderNode {
  private scene: number = SCENE_SHAPE;
  private kind: number = SHAPE_POINT;
  private pixelMap: image.PixelMap | undefined = undefined;

  setScene(scene: number, kind: number): void {
    this.scene = scene;
    this.kind = kind;
  }

  setPixelMap(pixelMap: image.PixelMap | undefined): void {
    this.pixelMap = pixelMap;
  }

  draw(context: DrawContext): void {
    // sizeInPixel 直接给出像素尺寸，避免调用 API 18 起废弃的全局 vp2px。
    const size: Size = context.sizeInPixel;
    bridge.nativeRenderDraw(context, size.width, size.height, this.scene, this.kind, this.pixelMap);
  }
}

// 通用节点控制器：负责创建根 FrameNode、挂载 RenderNode 并维护其尺寸。
export class DemoNodeController extends NodeController {
  private frameNode: FrameNode | null = null;
  private renderNode: DemoRenderNode | null = null;

  makeNode(uiContext: UIContext): FrameNode | null {
    this.frameNode = new FrameNode(uiContext);
    const host: RenderNode | null = this.frameNode.getRenderNode();
    if (host === null) {
      Logger.error('makeNode failed, root render node is null');
      return this.frameNode;
    }
    this.renderNode = new DemoRenderNode();
    try {
      host.appendChild(this.renderNode);
    } catch (error) {
      Logger.error('appendChild failed, message=' + (error as BusinessError).message);
    }
    return this.frameNode;
  }

  getNode(): DemoRenderNode | null {
    return this.renderNode;
  }

  setScene(scene: number, kind: number): void {
    if (this.renderNode === null) {
      return;
    }
    this.renderNode.setScene(scene, kind);
    this.renderNode.invalidate();
  }

  setPixelMap(pixelMap: image.PixelMap | undefined): void {
    if (this.renderNode === null) {
      return;
    }
    this.renderNode.setPixelMap(pixelMap);
    this.renderNode.invalidate();
  }

  resize(width: number, height: number): void {
    if (this.renderNode === null || width <= 0 || height <= 0) {
      return;
    }
    this.renderNode.frame = { x: 0, y: 0, width: width, height: height };
    this.renderNode.invalidate();
  }

  invalidate(): void {
    if (this.renderNode !== null && !this.renderNode.isDisposed()) {
      this.renderNode.invalidate();
    }
  }

  // 页面退出时释放底层节点，避免 RenderNode 泄漏。
  disposeNode(): void {
    if (this.renderNode !== null && !this.renderNode.isDisposed()) {
      this.renderNode.dispose();
      Logger.info('render node disposed');
    }
    this.renderNode = null;
  }
}
