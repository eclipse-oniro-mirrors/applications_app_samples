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

import { Logger } from '../common/Logger';
import { toVp } from '../common/UnitUtil';
import { ParamEngine } from '../core/ParamEngine';
import { CapabilityController } from '../core/SceneRenderNode';
import { GroupSpec, SceneSpec } from '../core/SchemaTypes';
import { ParamPanel } from './ParamPanel';

const EMPTY_GROUP: GroupSpec = new GroupSpec(0, 'empty', 'Empty', '', []);
const EMPTY_SCENE: SceneSpec = new SceneSpec(0, 'Empty', '', []);

// 通用能力域宿主：场景切换 + 参数面板 + RenderNode 画布，所有能力域页面共用这一套布局。
@Component
export struct GroupHost {
  public group: GroupSpec = EMPTY_GROUP;
  // 控制器回传：页面拿到它之后才能在异步资源（如 PixelMap）就绪时补充到渲染节点。
  public onControllerReady: (controller: CapabilityController) => void = () => {};
  @State private sceneIndex: number = 0;
  @State private values: number[] = [];
  @State private status: string = '';
  private controller: CapabilityController = new CapabilityController();

  aboutToAppear(): void {
    // 先回传控制器，页面可能在资源就绪后立刻需要它。
    this.onControllerReady(this.controller);
    if (this.group.scenes.length === 0) {
      Logger.warn('GroupHost has no scene, group=' + this.group.key);
      return;
    }
    this.selectScene(0);
  }

  aboutToDisappear(): void {
    this.controller.disposeNode();
  }

  private currentScene(): SceneSpec {
    if (this.sceneIndex < 0 || this.sceneIndex >= this.group.scenes.length) {
      return EMPTY_SCENE;
    }
    return this.group.scenes[this.sceneIndex];
  }

  private selectScene(index: number): void {
    if (index < 0 || index >= this.group.scenes.length) {
      return;
    }
    this.sceneIndex = index;
    const spec: SceneSpec = this.group.scenes[index];
    const values: number[] = ParamEngine.defaults(spec);
    this.values = values;
    this.controller.applyScene(this.group.id, spec.id, values);
    this.status = 'scene ' + spec.id.toString() + ' · ' + ParamEngine.summary(spec, values);
  }

  private onParamChange(index: number, value: number): void {
    const spec: SceneSpec = this.currentScene();
    const next: number[] = ParamEngine.withValue(spec, this.values, index, value);
    this.values = next;
    this.controller.applyScene(this.group.id, spec.id, next);
    this.status = 'scene ' + spec.id.toString() + ' · ' + ParamEngine.summary(spec, next);
  }

  private resetParams(): void {
    const spec: SceneSpec = this.currentScene();
    const values: number[] = ParamEngine.defaults(spec);
    this.values = values;
    this.controller.applyScene(this.group.id, spec.id, values);
    this.status = 'scene ' + spec.id.toString() + ' · ' + ParamEngine.summary(spec, values);
  }

  private goBack(): void {
    // Router.back 同步返回 void，失败时直接抛异常，此处不再叠加 Promise 链。
    this.getUIContext().getRouter().back();
  }

  build() {
    Column() {
      Row() {
        Button($r('app.string.back'))
          .id('nav_back_' + this.group.key)
          .fontSize(12)
          .height(28)
          .backgroundColor($r('app.color.panel'))
          .fontColor($r('app.color.text_primary'))
          .onClick(() => {
            this.goBack();
          })
        Column() {
          Text(this.group.title)
            .id('group_title_' + this.group.key)
            .fontSize(18)
            .fontWeight(FontWeight.Bold)
            .fontColor($r('app.color.text_primary'))
            .width('100%')
          Text(this.group.desc)
            .id('group_desc_' + this.group.key)
            .fontSize(11)
            .fontColor($r('app.color.text_secondary'))
            .maxLines(2)
            .width('100%')
        }
        .layoutWeight(1)
        .alignItems(HorizontalAlign.Start)
        .margin({ left: 8 })
      }
      .width('100%')
      .margin({ top: 4, bottom: 6 })

      Text(this.currentScene().desc)
        .id('scene_desc_' + this.group.key + '_' + this.currentScene().id.toString())
        .fontSize(11)
        .fontColor($r('app.color.text_secondary'))
        .width('100%')
        .maxLines(2)
        .margin({ bottom: 6 })

      NodeContainer(this.controller)
        .id('group_canvas_' + this.group.key)
        .width('100%')
        .layoutWeight(1)
        .backgroundColor($r('app.color.canvas_background'))
        .borderRadius(12)
        .clip(true)
        .onAreaChange((_oldValue: Area, newValue: Area) => {
          this.controller.resize(toVp(newValue.width), toVp(newValue.height));
        })

      Flex({ wrap: FlexWrap.Wrap, justifyContent: FlexAlign.Center, alignItems: ItemAlign.Center }) {
        ForEach(this.group.scenes, (item: SceneSpec, index: number) => {
          Button(item.title)
            .id('scene_btn_' + this.group.key + '_' + item.id.toString())
            .fontSize(12)
            .height(28)
            .margin(3)
            .padding({ left: 10, right: 10 })
            .backgroundColor(index === this.sceneIndex ? $r('app.color.primary') : $r('app.color.panel'))
            .fontColor(index === this.sceneIndex ? $r('app.color.text_on_primary') : $r('app.color.text_primary'))
            .onClick(() => {
              this.selectScene(index);
            })
        }, (item: SceneSpec) => this.group.key + '-' + item.id.toString())
      }
      .width('100%')
      .margin({ top: 6 })

      Row() {
        Text($r('app.string.label_parameters'))
          .id('params_title_' + this.group.key)
          .fontSize(12)
          .fontWeight(FontWeight.Medium)
          .fontColor($r('app.color.text_primary'))
          .layoutWeight(1)
        Button($r('app.string.btn_reset'))
          .id('params_reset_' + this.group.key)
          .fontSize(12)
          .height(26)
          .backgroundColor($r('app.color.panel'))
          .fontColor($r('app.color.text_primary'))
          .onClick(() => {
            this.resetParams();
          })
      }
      .width('100%')
      .margin({ top: 6, bottom: 2 })

      ParamPanel({
        // slice 保证每次传入新数组引用，@Prop 才能感知场景切换。
        specs: this.currentScene().params.slice(),
        sceneKey: this.group.key + '-' + this.currentScene().id.toString(),
        values: $values,
        onValueChange: (index: number, value: number) => {
          this.onParamChange(index, value);
        }
      })

      Text(this.status)
        .id('group_status_' + this.group.key)
        .fontSize(10)
        .fontColor($r('app.color.text_secondary'))
        .width('100%')
        .maxLines(2)
        .margin({ top: 4 })
    }
    .width('100%')
    .height('100%')
    .padding(12)
    .backgroundColor($r('app.color.canvas_background'))
  }
}
