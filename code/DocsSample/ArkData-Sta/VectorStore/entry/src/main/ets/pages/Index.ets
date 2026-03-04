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
import { Entry, Column, Component, Button, ButtonType, FontWeight } from  '@kit.ArkUI';  // TextAttribute should be insert by ui-plugins
import { State} from '@ohos.arkui.stateManagement' // should be insert by ui-plugins
import { common } from '@kit.AbilityKit';
import { getVectorStore } from './crud/vectorStoreCTUD';

@Entry
@Component
struct Index {
  @State message: string = 'Hello World';
  build() {
    Column() {
      Button('getVectorStore_TS')
      .fontSize(18)
      .fontWeight(FontWeight.Bold)
      .type(ButtonType.Capsule)
      .margin({ top: 50 })
      .width('50%')
      .height('8%')
      .backgroundColor('#0D9FFB')
      .onClick(() => {
        // [Start vector_TS_context]
        const context: common.UIAbilityContext = this.getUIContext().getHostContext() as common.UIAbilityContext;
        // [End vector_TS_context]
        getVectorStore(context);
      })
    }
    .height('100%')
    .width('100%')
  }
}