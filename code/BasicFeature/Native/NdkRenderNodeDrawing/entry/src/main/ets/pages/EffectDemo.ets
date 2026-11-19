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
import { EFFECT_OPTIONS, SCENE_EFFECT } from '../common/SceneType';

// 绘制效果演示：填充描边、混合模式、路径效果、渐变、颜色滤波、蒙版滤波。
@Entry
@Component
struct EffectDemo {
  private controller: DemoNodeController = new DemoNodeController();

  aboutToDisappear(): void {
    this.controller.disposeNode();
  }

  build() {
    Column() {
      DemoTitle({ title: $r('app.string.effect_title'), pageKey: 'effect' })
      Text($r('app.string.effect_desc'))
        .fontSize(12)
        .fontColor($r('app.color.text_secondary'))
        .width('100%')
        .margin({ top: 4, bottom: 8 })
      Column() {
        ScenePanel({
          controller: this.controller,
          options: EFFECT_OPTIONS,
          scene: SCENE_EFFECT,
          pageKey: 'effect'
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
