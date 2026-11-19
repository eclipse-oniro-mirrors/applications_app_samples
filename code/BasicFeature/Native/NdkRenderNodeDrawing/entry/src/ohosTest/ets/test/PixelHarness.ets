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
import { DrawContext, FrameNode, NodeController, RenderNode, Size, UIContext } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';
import { image } from '@kit.ImageKit';
import { hilog } from '@kit.PerformanceAnalysisKit';

const TAG: string = '[Sample_NdkRenderNodeHarness]';
const DOMAIN: number = 0xF811;
// 探针画布边长，与测试页上的 NodeContainer 尺寸保持一致。
export const HARNESS_SIZE: number = 96;
// 组件快照按该 id 定位。
export const HARNESS_ID: string = 'ndrPixelHarness';

export function logHarness(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

// 探针节点：把「能力域 + 场景 + 参数」交给 native 绘制，画布由 ArkUI 提供。
export class HarnessRenderNode extends RenderNode {
  public group: number = 1;
  public scene: number = 0;
  public params: number[] = [];
  // 像素图能力域的可选入参：其余能力域忽略该项，缺省时该域降级为示意图。
  public pixelMap: image.PixelMap | undefined = undefined;
  // 入参覆写：null 表示用真实尺寸/编号，非 null 时以此值调用 native，供入参契约用例注入非法值。
  public argWidth: number | null = null;
  public argHeight: number | null = null;
  public argGroup: number | null = null;
  public argScene: number | null = null;
  public draws: number = 0;
  public armed: boolean = false;

  draw(context: DrawContext): void {
    this.draws += 1;
    const size: Size = context.sizeInPixel;
    if (this.draws <= 8) {
      // 只打印前若干帧，避免诊断日志淹没用例输出。
      logHarness('harness draw#' + this.draws.toString() + ' armed=' + this.armed.toString() +
        ' group=' + this.group.toString() + ' scene=' + this.scene.toString() +
        ' map=' + (this.pixelMap === undefined ? 'none' : 'yes') +
        ' size=' + size.width.toString() + 'x' + size.height.toString() +
        ' frame=' + this.frame.width.toString() + 'x' + this.frame.height.toString());
    }
    if (!this.armed) {
      // 未装载场景时保持空白，作为像素比对的基线。
      return;
    }
    // 覆写值只在入参契约用例里出现，缺省时与真实调用完全一致。
    const width: number = this.argWidth === null ? size.width : this.argWidth;
    const height: number = this.argHeight === null ? size.height : this.argHeight;
    const group: number = this.argGroup === null ? this.group : this.argGroup;
    const scene: number = this.argScene === null ? this.scene : this.argScene;
    bridge.nativeRenderScene(context, width, height, group, scene, this.params, this.pixelMap);
  }
}

// 探针控制器：宿主节点由测试页上的 NodeContainer 创建。
export class HarnessController extends NodeController {
  private frameNode: FrameNode | null = null;
  private renderNode: HarnessRenderNode | null = null;
  private pendingWidth: number = 0;
  private pendingHeight: number = 0;
  private attached: boolean = false;
  // 测试进程内没有可用的窗口句柄，UIContext 由测试页在 aboutToAppear 时回传。
  private ui: UIContext | null = null;

  makeNode(uiContext: UIContext): FrameNode | null {
    this.frameNode = new FrameNode(uiContext);
    this.attached = true;
    const host: RenderNode | null = this.frameNode.getRenderNode();
    if (host === null) {
      logHarness('harness makeNode failed, root render node is null');
      return this.frameNode;
    }
    this.renderNode = new HarnessRenderNode();
    this.renderNode.armed = false;
    this.applyFrame();
    try {
      host.appendChild(this.renderNode);
      logHarness('harness appendChild done, frame=' + this.renderNode.frame.width.toString() +
        'x' + this.renderNode.frame.height.toString());
    } catch (error) {
      logHarness('harness appendChild failed, message=' + (error as BusinessError).message);
    }
    return this.frameNode;
  }

  isAttached(): boolean {
    return this.attached && this.renderNode !== null;
  }

  // 测试页就绪（节点已建好且 UIContext 已回传）才能做组件快照。
  attachUi(ui: UIContext): void {
    this.ui = ui;
  }

  isReady(): boolean {
    return this.isAttached() && this.ui !== null;
  }

  uiContext(): UIContext | null {
    return this.ui;
  }

  node(): HarnessRenderNode | null {
    return this.renderNode;
  }

  resize(width: number, height: number): void {
    if (width <= 0 || height <= 0) {
      return;
    }
    logHarness('harness resize ' + width.toString() + 'x' + height.toString());
    this.pendingWidth = width;
    this.pendingHeight = height;
    this.applyFrame();
    this.invalidate();
  }

  // 装载场景并请求重绘；armed=false 时绘制空帧，pixelMap 省略即按缺图处理。
  load(group: number, scene: number, params: number[], armed: boolean, pixelMap?: image.PixelMap): void {
    if (this.renderNode === null) {
      return;
    }
    this.renderNode.group = group;
    this.renderNode.scene = scene;
    this.renderNode.params = params;
    this.renderNode.pixelMap = pixelMap;
    this.renderNode.armed = armed;
    this.clearArgOverrides();
    this.invalidate();
  }

  // 入参契约专用：按真实场景装载，同时把尺寸/编号/场景换成可控值。
  loadArgs(group: number, scene: number, params: number[], width: number | null, height: number | null,
    groupArg: number | null, sceneArg: number | null): void {
    if (this.renderNode === null) {
      return;
    }
    this.renderNode.group = group;
    this.renderNode.scene = scene;
    this.renderNode.params = params;
    this.renderNode.argWidth = width;
    this.renderNode.argHeight = height;
    this.renderNode.argGroup = groupArg;
    this.renderNode.argScene = sceneArg;
    this.renderNode.armed = true;
    this.invalidate();
  }

  // 复位覆写值并停止绘制，回到空白基线。
  clearArgs(): void {
    if (this.renderNode === null) {
      return;
    }
    this.renderNode.armed = false;
    this.clearArgOverrides();
    this.invalidate();
  }

  private clearArgOverrides(): void {
    if (this.renderNode === null) {
      return;
    }
    this.renderNode.argWidth = null;
    this.renderNode.argHeight = null;
    this.renderNode.argGroup = null;
    this.renderNode.argScene = null;
  }

  clearScene(): void {
    this.load(1, 0, [], false);
  }

  drawCount(): number {
    return this.renderNode === null ? 0 : this.renderNode.draws;
  }

  // 当前 RenderNode 的实际宽高，供画布尺寸链路用例断言 resize 是否被接受。
  frameWidth(): number {
    return this.renderNode === null ? 0 : this.renderNode.frame.width;
  }

  frameHeight(): number {
    return this.renderNode === null ? 0 : this.renderNode.frame.height;
  }

  invalidate(): void {
    if (this.renderNode !== null && !this.renderNode.isDisposed()) {
      try {
        this.renderNode.invalidate();
      } catch (error) {
        logHarness('harness invalidate failed, message=' + (error as BusinessError).message);
      }
    }
  }

  disposeNode(): void {
    if (this.renderNode !== null && !this.renderNode.isDisposed()) {
      this.renderNode.dispose();
    }
    this.renderNode = null;
    this.frameNode = null;
    this.attached = false;
  }

  private applyFrame(): void {
    if (this.renderNode === null || this.pendingWidth <= 0 || this.pendingHeight <= 0) {
      return;
    }
    this.renderNode.frame = { x: 0, y: 0, width: this.pendingWidth, height: this.pendingHeight };
  }
}

// 单例：测试页负责挂载，测试用例负责装载场景与快照。
export const HARNESS: HarnessController = new HarnessController();
