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

import { common } from '@kit.AbilityKit';
import { image } from '@kit.ImageKit';
import { DemoTitle } from '../common/DemoTitle';
import { DemoNodeController } from '../common/DemoRenderNode';
import { Logger } from '../common/Logger';
import { ScenePanel } from '../common/ScenePanel';
import { loadPixelMap, releasePixelMap } from '../common/PixelMapUtil';
import { IMAGE_OPTIONS, SCENE_IMAGE } from '../common/SceneType';

// 图片绘制演示：拉伸、最近邻采样、线性采样与缩放视图。
@Entry
@Component
struct ImageDemo {
  private controller: DemoNodeController = new DemoNodeController();
  private pixelMap: image.PixelMap | undefined = undefined;
  @State private imageReady: boolean = false;

  aboutToAppear(): void {
    // getHostContext 替代已废弃的全局 getContext。
    const context: common.Context | undefined = this.getUIContext().getHostContext();
    if (context === undefined) {
      Logger.warn('host context is unavailable');
      return;
    }
    loadPixelMap(context.resourceManager, 'test.jpg').then((pMap: image.PixelMap | undefined) => {
      if (pMap === undefined) {
        return;
      }
      this.pixelMap = pMap;
      this.imageReady = true;
      this.controller.setPixelMap(pMap);
    });
  }

  aboutToDisappear(): void {
    releasePixelMap(this.pixelMap).then(() => {
      this.pixelMap = undefined;
      this.imageReady = false;
    });
    this.controller.disposeNode();
  }

  build() {
    Column() {
      DemoTitle({ title: $r('app.string.image_title'), pageKey: 'image' })
      Text($r('app.string.image_desc'))
        .fontSize(12)
        .fontColor($r('app.color.text_secondary'))
        .width('100%')
        .margin({ top: 4, bottom: 8 })
      if (!this.imageReady) {
        Text($r('app.string.image_missing'))
          .fontSize(12)
          .fontColor($r('app.color.accent'))
          .width('100%')
          .margin({ bottom: 4 })
      }
      Column() {
        ScenePanel({
          controller: this.controller,
          options: IMAGE_OPTIONS,
          scene: SCENE_IMAGE,
          pageKey: 'image'
        })
      }
      .width('100%')
      .layoutWeight(1)
    }
    .width('100%')
    .height('100%')
    .padding(16)
    .backgroundColor($r('app.color.canvas_background'))
  }
}
