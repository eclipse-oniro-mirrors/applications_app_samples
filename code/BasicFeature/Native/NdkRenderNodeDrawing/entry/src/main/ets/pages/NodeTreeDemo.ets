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

import { FrameNode, NodeController, RenderNode } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';
import { DemoTitle } from '../common/DemoTitle';
import { DemoRenderNode } from '../common/DemoRenderNode';
import { Logger } from '../common/Logger';
import {
  SCENE_SHAPE,
  SHAPE_CIRCLE,
  SHAPE_REGION,
  SHAPE_ROUND_RECT
} from '../common/SceneType';
import { toVp } from '../common/UnitUtil';

const MAX_CHILD_COUNT: number = 6;
const COLUMN_COUNT: number = 3;

// 节点树控制器：根节点承载背景，子节点按网格排布，可在运行时增删。
class TreeController extends NodeController {
  private frameNode: FrameNode | null = null;
  private rootNode: DemoRenderNode | null = null;
  private children: DemoRenderNode[] = [];
  private width: number = 0;
  private height: number = 0;

  makeNode(uiContext: UIContext): FrameNode | null {
    this.frameNode = new FrameNode(uiContext);
    const host: RenderNode | null = this.frameNode.getRenderNode();
    if (host === null) {
      Logger.error('TreeController makeNode failed, root render node is null');
      return this.frameNode;
    }
    this.rootNode = new DemoRenderNode();
    this.rootNode.setScene(SCENE_SHAPE, SHAPE_REGION);
    try {
      host.appendChild(this.rootNode);
    } catch (error) {
      Logger.error('append root node failed, message=' + (error as BusinessError).message);
    }
    this.layout();
    return this.frameNode;
  }

  resize(width: number, height: number): void {
    this.width = width;
    this.height = height;
    this.layout();
  }

  addChild(): number {
    if (this.rootNode === null || this.children.length >= MAX_CHILD_COUNT) {
      return this.children.length;
    }
    const child: DemoRenderNode = new DemoRenderNode();
    child.setScene(SCENE_SHAPE, this.children.length % 2 === 0 ? SHAPE_CIRCLE : SHAPE_ROUND_RECT);
    try {
      this.rootNode.appendChild(child);
    } catch (error) {
      Logger.error('append child node failed, message=' + (error as BusinessError).message);
      return this.children.length;
    }
    this.children.push(child);
    this.layout();
    return this.children.length;
  }

  removeChild(): number {
    const child: DemoRenderNode | undefined = this.children.pop();
    if (child === undefined) {
      return 0;
    }
    if (this.rootNode !== null) {
      this.rootNode.removeChild(child);
    }
    if (!child.isDisposed()) {
      child.dispose();
    }
    this.layout();
    return this.children.length;
  }

  reset(): number {
    while (this.children.length > 0) {
      this.removeChild();
    }
    return 0;
  }

  // 根节点铺满画布，子节点按三列网格依次排布。
  private layout(): void {
    if (this.rootNode === null || this.width <= 0 || this.height <= 0) {
      return;
    }
    this.rootNode.frame = { x: 0, y: 0, width: this.width, height: this.height };
    this.rootNode.invalidate();
    const childWidth: number = this.width / COLUMN_COUNT;
    const childHeight: number = this.height / COLUMN_COUNT;
    this.children.forEach((child: DemoRenderNode, index: number) => {
      const column: number = index % COLUMN_COUNT;
      const row: number = Math.floor(index / COLUMN_COUNT);
      child.frame = {
        x: column * childWidth,
        y: row * childHeight,
        width: childWidth,
        height: childHeight
      };
      child.invalidate();
    });
  }
}

// 节点树演示：在根节点上动态添加与移除子渲染节点。
@Entry
@Component
struct NodeTreeDemo {
  private controller: TreeController = new TreeController();
  @State private childCount: number = 0;

  aboutToDisappear(): void {
    this.controller.reset();
  }

  build() {
    Column() {
      DemoTitle({ title: $r('app.string.node_tree_title'), pageKey: 'node_tree' })
      Text($r('app.string.node_tree_desc'))
        .fontSize(12)
        .fontColor($r('app.color.text_secondary'))
        .width('100%')
        .margin({ top: 4, bottom: 8 })
      NodeContainer(this.controller)
        .id('node_tree_canvas')
        .width('100%')
        .layoutWeight(1)
        .backgroundColor($r('app.color.canvas_background'))
        .borderRadius(12)
        .clip(true)
        .onAreaChange((_oldValue: Area, newValue: Area) => {
          this.controller.resize(toVp(newValue.width), toVp(newValue.height));
        })
      Row() {
        Text($r('app.string.state_child_count'))
          .fontSize(12)
          .fontColor($r('app.color.text_secondary'))
        Text(this.childCount.toString())
          .id('node_tree_child_count')
          .fontSize(12)
          .fontColor($r('app.color.text_primary'))
          .margin({ left: 4 })
      }
      .width('100%')
      .justifyContent(FlexAlign.Center)
      .margin({ top: 8 })
      Row() {
        Button($r('app.string.btn_add_child'))
          .id('node_tree_add')
          .fontSize(14)
          .height(32)
          .margin(4)
          .backgroundColor($r('app.color.primary'))
          .onClick(() => {
            this.childCount = this.controller.addChild();
          })
        Button($r('app.string.btn_remove_child'))
          .id('node_tree_remove')
          .fontSize(14)
          .height(32)
          .margin(4)
          .backgroundColor($r('app.color.panel'))
          .fontColor($r('app.color.text_primary'))
          .onClick(() => {
            this.childCount = this.controller.removeChild();
          })
        Button($r('app.string.btn_reset'))
          .id('node_tree_reset')
          .fontSize(14)
          .height(32)
          .margin(4)
          .backgroundColor($r('app.color.panel'))
          .fontColor($r('app.color.text_primary'))
          .onClick(() => {
            this.childCount = this.controller.reset();
          })
      }
      .width('100%')
      .justifyContent(FlexAlign.Center)
    }
    .width('100%')
    .height('100%')
    .padding(16)
    .backgroundColor($r('app.color.canvas_background'))
  }
}
