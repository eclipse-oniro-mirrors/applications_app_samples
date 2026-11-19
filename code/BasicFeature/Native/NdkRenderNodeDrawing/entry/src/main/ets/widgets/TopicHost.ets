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
import { GroupSpec, SceneSpec } from '../core/SchemaTypes';
import { TopicEngine } from '../core/TopicEngine';
import { TopicNodeController } from '../core/TopicNode';
import { TopicStats } from '../core/TopicTypes';
import { ParamPanel } from './ParamPanel';

const EMPTY_GROUP: GroupSpec = new GroupSpec(0, 'empty', 'Empty', '', []);
const EMPTY_SCENE: SceneSpec = new SceneSpec(0, 'Empty', '', []);

// 专题页宿主：与 GroupHost 同构，区别只在控制器换成 TopicNodeController，
// 场景下发走 TopicEngine，并把触摸回调的命中结果写回状态栏。
@Component
export struct TopicHost {
  public group: GroupSpec = EMPTY_GROUP;
  @State private sceneIndex: number = 0;
  @State private values: number[] = [];
  @State private status: string = '';
  private controller: TopicNodeController = new TopicNodeController();

  aboutToAppear(): void {
    this.controller.setNotifier((text: string) => {
      this.status = text + ' · ' + this.counterText();
    });
    if (this.group.scenes.length === 0) {
      Logger.warn('TopicHost has no scene, group=' + this.group.key);
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

  // 状态栏尾部的计数器，触摸与重绘都会改变它。
  private counterText(): string {
    const stats: TopicStats = this.controller.stats();
    return 'nodes ' + stats.nodes.toString() + ' · draws ' + stats.draws.toString() + ' · touches ' +
      stats.touches.toString() + ' · rebuilds ' + stats.rebuilds.toString();
  }

  private selectScene(index: number): void {
    if (index < 0 || index >= this.group.scenes.length) {
      return;
    }
    this.sceneIndex = index;
    const spec: SceneSpec = this.group.scenes[index];
    const values: number[] = ParamEngine.defaults(spec);
    this.values = values;
    this.applyCurrent(spec, values);
  }

  private onParamChange(index: number, value: number): void {
    const spec: SceneSpec = this.currentScene();
    const next: number[] = ParamEngine.withValue(spec, this.values, index, value);
    this.values = next;
    this.applyCurrent(spec, next);
  }

  // 重新下发当前场景，用于读取最新计数器，不改变参数。
  private reapply(): void {
    const spec: SceneSpec = this.currentScene();
    this.applyCurrent(spec, this.values);
  }

  private resetParams(): void {
    const spec: SceneSpec = this.currentScene();
    const values: number[] = ParamEngine.defaults(spec);
    this.values = values;
    this.applyCurrent(spec, values);
  }

  private applyCurrent(spec: SceneSpec, values: number[]): void {
    const result: string = TopicEngine.apply(this.group.id, spec.id, values, this.controller);
    this.status = result + ' · ' + this.counterText();
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
        }, (item: SceneSpec) => this.group.key + '-topic-' + item.id.toString())
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
        Button($r('app.string.label_reapply'))
          .id('params_reapply_' + this.group.key)
          .fontSize(12)
          .height(26)
          .margin({ right: 6 })
          .backgroundColor($r('app.color.panel'))
          .fontColor($r('app.color.text_primary'))
          .onClick(() => {
            this.reapply();
          })
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
