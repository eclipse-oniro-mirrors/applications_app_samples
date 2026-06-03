'use static'

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

// [Start SubWindowLambda]
// SubWindowLambda.ets
import { MyNodeControllerLambda } from './EnvLambdaClosure';
import { Entry, Text, Column, Component, Button, ClickEvent, NodeContainer, ColumnOptions } from '@kit.ArkUI';
import { common } from '@kit.AbilityKit';
import window from '@ohos.window';

@Entry
@Component
struct SubWindowLambda {
  private nodeController: MyNodeControllerLambda = new MyNodeControllerLambda();

  build() {
    Column({ space: 10 } as ColumnOptions) {
      Text(`SubWindow`)
      // 第四步：在第一步中已在创建globalBuilderNode。将globalBuilderNode下的节点挂子窗的NodeContainer的占位节点下
      Button('add node to tree').width(200)
        .onClick((e: ClickEvent) => {
          this.nodeController.addBuilderNode();
        })
      // 从子窗口的NodeContainer的占位节点下移除globalBuilderNode下的节点
      Button('remove node from tree').width(200)
        .onClick((e: ClickEvent) => {
          this.nodeController.removeBuilderNode();
        })
      // 销毁globalBuilderNode下的节点
      Button('dispose node').width(200)
        .onClick((e: ClickEvent) => {
          this.nodeController.disposeNode();
        })
      NodeContainer(this.nodeController).backgroundColor('#FFEEF0')
    }
    .height('100%')
    .width('100%')
    .backgroundColor('#0D9FFB')
  }
}
// [End SubWindowLambda]