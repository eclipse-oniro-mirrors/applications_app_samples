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

import { DemoNodeController } from './DemoRenderNode';
import { SCENE_SHAPE, SceneOption } from './SceneType';
import { toVp } from './UnitUtil';

// 通用演示面板：上方为 RenderNode 画布，下方为场景切换按钮。
@Component
export struct ScenePanel {
  public controller: DemoNodeController = new DemoNodeController();
  public options: SceneOption[] = [];
  public scene: number = SCENE_SHAPE;
  // 页面标识：同一 scene 会被多个页面复用，控件 id 必须再带页面前缀才能全模块唯一。
  public pageKey: string = '';
  @State private selectedKind: number = -1;

  aboutToAppear(): void {
    if (this.options.length > 0) {
      this.applyScene(this.options[0].kind);
    }
  }

  applyScene(kind: number): void {
    this.selectedKind = kind;
    this.controller.setScene(this.scene, kind);
  }

  build() {
    Column() {
      NodeContainer(this.controller)
        .id('demo_canvas_' + this.pageKey)
        .width('100%')
        .layoutWeight(1)
        .backgroundColor($r('app.color.canvas_background'))
        .borderRadius(12)
        .clip(true)
        .onAreaChange((_oldValue: Area, newValue: Area) => {
          this.controller.resize(toVp(newValue.width), toVp(newValue.height));
        })
        .onAppear(() => {
          if (this.options.length > 0) {
            this.applyScene(this.selectedKind >= 0 ? this.selectedKind : this.options[0].kind);
          }
        })
      Flex({ wrap: FlexWrap.Wrap, justifyContent: FlexAlign.Center, alignItems: ItemAlign.Center }) {
        ForEach(this.options, (item: SceneOption) => {
          Button(item.label)
            .id('demo_scene_' + this.pageKey + '_' + item.kind.toString())
            .fontSize(14)
            .height(32)
            .margin(4)
            .padding({ left: 12, right: 12 })
            .backgroundColor(item.kind === this.selectedKind ? $r('app.color.primary') : $r('app.color.panel'))
            .fontColor(item.kind === this.selectedKind ? $r('app.color.text_on_primary') : $r('app.color.text_primary'))
            .onClick(() => {
              this.applyScene(item.kind);
            })
        }, (item: SceneOption) => item.kind.toString())
      }
      .width('100%')
      .margin({ top: 8 })
    }
    .width('100%')
    .height('100%')
  }
}
