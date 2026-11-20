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

import { DemoTitle } from '../common/DemoTitle';
import { DemoNodeController, DemoRenderNode } from '../common/DemoRenderNode';
import { ScenePanel } from '../common/ScenePanel';
import { SCENE_SHAPE, SceneOption, SHAPE_CIRCLE } from '../common/SceneType';
import { Logger } from '../common/Logger';

// 生命周期演示：设置 label、触发重绘、销毁与重建渲染节点。
@Entry
@Component
struct LifecycleDemo {
  private controller: DemoNodeController = new DemoNodeController();
  private options: SceneOption[] = [new SceneOption($r('app.string.scene_shape_circle'), SHAPE_CIRCLE)];
  private labelIndex: number = 0;
  @State private disposed: boolean = false;

  aboutToDisappear(): void {
    this.controller.disposeNode();
  }

  private setLabel(): void {
    const node: DemoRenderNode | null = this.controller.getNode();
    if (node === null) {
      return;
    }
    this.labelIndex += 1;
    node.label = 'ndr-node-' + this.labelIndex;
    Logger.info('render node label=' + node.label);
  }

  private disposeNode(): void {
    this.controller.disposeNode();
    this.disposed = true;
  }

  private rebuildNode(): void {
    this.controller.rebuild();
    this.controller.setScene(SCENE_SHAPE, SHAPE_CIRCLE);
    this.disposed = false;
  }

  build() {
    Column() {
      DemoTitle({ title: $r('app.string.lifecycle_title'), pageKey: 'lifecycle' })
      Text($r('app.string.lifecycle_desc'))
        .fontSize(12)
        .fontColor($r('app.color.text_secondary'))
        .width('100%')
        .margin({ top: 4, bottom: 8 })
      Column() {
        ScenePanel({
          controller: this.controller,
          options: this.options,
          scene: SCENE_SHAPE,
          pageKey: 'lifecycle'
        })
      }
      .width('100%')
      .layoutWeight(1)
      Row() {
        Text($r('app.string.state_disposed'))
          .fontSize(12)
          .fontColor($r('app.color.text_secondary'))
        Text(this.disposed ? 'true' : 'false')
          .id('lifecycle_disposed')
          .fontSize(12)
          .fontColor(this.disposed ? $r('app.color.accent') : $r('app.color.text_primary'))
          .margin({ left: 4 })
      }
      .width('100%')
      .justifyContent(FlexAlign.Center)
      .margin({ top: 8 })
      Row() {
        Button($r('app.string.lifecycle_label'))
          .id('lifecycle_label')
          .fontSize(14)
          .height(32)
          .margin(4)
          .backgroundColor($r('app.color.panel'))
          .fontColor($r('app.color.text_primary'))
          .onClick(() => {
            this.setLabel();
          })
        Button($r('app.string.lifecycle_invalidate'))
          .id('lifecycle_invalidate')
          .fontSize(14)
          .height(32)
          .margin(4)
          .backgroundColor($r('app.color.primary'))
          .onClick(() => {
            this.controller.invalidate();
          })
        Button($r('app.string.lifecycle_dispose'))
          .id('lifecycle_dispose')
          .fontSize(14)
          .height(32)
          .margin(4)
          .backgroundColor($r('app.color.panel'))
          .fontColor($r('app.color.text_primary'))
          .onClick(() => {
            this.disposeNode();
          })
        Button($r('app.string.lifecycle_recreate'))
          .id('lifecycle_recreate')
          .fontSize(14)
          .height(32)
          .margin(4)
          .backgroundColor($r('app.color.primary'))
          .onClick(() => {
            this.rebuildNode();
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
