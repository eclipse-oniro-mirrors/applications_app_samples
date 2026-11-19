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
import { DemoNodeController } from '../common/DemoRenderNode';
import { ScenePanel } from '../common/ScenePanel';
import { SCENE_SHAPE, SHAPE_OPTIONS } from '../common/SceneType';

// 几何图元演示：点、线、圆、椭圆、矩形、圆角矩形、圆弧、路径、区域。
@Entry
@Component
struct PrimitiveDemo {
  private controller: DemoNodeController = new DemoNodeController();

  aboutToDisappear(): void {
    this.controller.disposeNode();
  }

  build() {
    Column() {
      DemoTitle({ title: $r('app.string.primitive_title'), pageKey: 'primitive' })
      Text($r('app.string.primitive_desc'))
        .fontSize(12)
        .fontColor($r('app.color.text_secondary'))
        .width('100%')
        .margin({ top: 4, bottom: 8 })
      Column() {
        ScenePanel({
          controller: this.controller,
          options: SHAPE_OPTIONS,
          scene: SCENE_SHAPE,
          pageKey: 'primitive'
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
