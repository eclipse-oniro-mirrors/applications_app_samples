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
import { SCENE_SHAPE, SceneOption, SHAPE_RECT } from '../common/SceneType';

const TRANSLUCENT_BLUE: number = 0xFF93C5FD;
const TRANSPARENT: number = 0x00000000;

// 渲染属性演示：通过开关切换 RenderNode 的背景色、透明度、裁剪、阴影、缩放与旋转。
@Entry
@Component
struct RenderPropertyDemo {
  private controller: DemoNodeController = new DemoNodeController();
  private options: SceneOption[] = [new SceneOption($r('app.string.scene_shape_rect'), SHAPE_RECT)];
  @State private backgroundOn: boolean = false;
  @State private opacityOn: boolean = false;
  @State private clipOn: boolean = false;
  @State private shadowOn: boolean = false;
  @State private scaleOn: boolean = false;
  @State private rotationOn: boolean = false;

  aboutToDisappear(): void {
    this.controller.disposeNode();
  }

  private applyProperties(): void {
    const node: DemoRenderNode | null = this.controller.getNode();
    if (node === null) {
      return;
    }
    node.backgroundColor = this.backgroundOn ? TRANSLUCENT_BLUE : TRANSPARENT;
    node.opacity = this.opacityOn ? 0.6 : 1.0;
    node.clipToFrame = this.clipOn;
    node.shadowColor = 0x55000000;
    node.shadowOffset = { x: 6, y: 6 };
    node.shadowAlpha = this.shadowOn ? 0.5 : 0.0;
    node.shadowRadius = this.shadowOn ? 12 : 0;
    node.scale = { x: this.scaleOn ? 0.8 : 1.0, y: this.scaleOn ? 0.8 : 1.0 };
    node.rotation = { x: 0, y: 0, z: this.rotationOn ? 20 : 0 };
    node.invalidate();
  }

  build() {
    Column() {
      DemoTitle({ title: $r('app.string.render_property_title'), pageKey: 'render_property' })
      Text($r('app.string.render_property_desc'))
        .fontSize(12)
        .fontColor($r('app.color.text_secondary'))
        .width('100%')
        .margin({ top: 4, bottom: 8 })
      Column() {
        ScenePanel({
          controller: this.controller,
          options: this.options,
          scene: SCENE_SHAPE,
          pageKey: 'render_property'
        })
      }
      .width('100%')
      .layoutWeight(1)
      Row() {
        Text($r('app.string.prop_background'))
          .fontSize(14)
          .fontColor($r('app.color.text_primary'))
          .layoutWeight(1)
        Toggle({ type: ToggleType.Switch, isOn: this.backgroundOn })
          .id('prop_background_toggle')
          .selectedColor($r('app.color.primary'))
          .onChange((isOn: boolean) => {
            this.backgroundOn = isOn;
            this.applyProperties();
          })
      }
      .width('100%')
      .height(36)
      Row() {
        Text($r('app.string.prop_opacity'))
          .fontSize(14)
          .fontColor($r('app.color.text_primary'))
          .layoutWeight(1)
        Toggle({ type: ToggleType.Switch, isOn: this.opacityOn })
          .id('prop_opacity_toggle')
          .selectedColor($r('app.color.primary'))
          .onChange((isOn: boolean) => {
            this.opacityOn = isOn;
            this.applyProperties();
          })
      }
      .width('100%')
      .height(36)
      Row() {
        Text($r('app.string.prop_clip'))
          .fontSize(14)
          .fontColor($r('app.color.text_primary'))
          .layoutWeight(1)
        Toggle({ type: ToggleType.Switch, isOn: this.clipOn })
          .id('prop_clip_toggle')
          .selectedColor($r('app.color.primary'))
          .onChange((isOn: boolean) => {
            this.clipOn = isOn;
            this.applyProperties();
          })
      }
      .width('100%')
      .height(36)
      Row() {
        Text($r('app.string.prop_shadow'))
          .fontSize(14)
          .fontColor($r('app.color.text_primary'))
          .layoutWeight(1)
        Toggle({ type: ToggleType.Switch, isOn: this.shadowOn })
          .id('prop_shadow_toggle')
          .selectedColor($r('app.color.primary'))
          .onChange((isOn: boolean) => {
            this.shadowOn = isOn;
            this.applyProperties();
          })
      }
      .width('100%')
      .height(36)
      Row() {
        Text($r('app.string.prop_scale'))
          .fontSize(14)
          .fontColor($r('app.color.text_primary'))
          .layoutWeight(1)
        Toggle({ type: ToggleType.Switch, isOn: this.scaleOn })
          .id('prop_scale_toggle')
          .selectedColor($r('app.color.primary'))
          .onChange((isOn: boolean) => {
            this.scaleOn = isOn;
            this.applyProperties();
          })
      }
      .width('100%')
      .height(36)
      Row() {
        Text($r('app.string.prop_rotation'))
          .fontSize(14)
          .fontColor($r('app.color.text_primary'))
          .layoutWeight(1)
        Toggle({ type: ToggleType.Switch, isOn: this.rotationOn })
          .id('prop_rotation_toggle')
          .selectedColor($r('app.color.primary'))
          .onChange((isOn: boolean) => {
            this.rotationOn = isOn;
            this.applyProperties();
          })
      }
      .width('100%')
      .height(36)
    }
    .width('100%')
    .height('100%')
    .padding(16)
    .backgroundColor($r('app.color.canvas_background'))
  }
}
