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

// [Start EventHubPage2]
import { Entry, Text, Column, Row, Component, FontWeight, List, ListItem, FlexAlign, Color, ListItemAlign} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import { common } from '@kit.AbilityKit';

@Entry
@Component
struct EventHubPage2 {
  private context: common.UIAbilityContext = this.getUIContext().getHostContext() as common.UIAbilityContext;

  eventHubFunc(): void {
    // 不带参数触发自定义“event1”事件
    this.context.eventHub.emit('event1');
    // 带1个参数触发自定义“event1”事件
    this.context.eventHub.emit('event1', 1);
    // 带2个参数触发自定义“event1”事件
    this.context.eventHub.emit('event1', 2, 'test');
    // 开发者可以根据实际的业务场景设计事件传递的参数
  }

  build() {
    Column() {
      List({ initialIndex: 0 }) {
        ListItem() {
          Row() {
            // [StartExclude EventHubPage2]
            Text('EventHubFuncA')
              .fontColor('#FFFFFF')
              .fontWeight(FontWeight.Bold)
            // [EndExclude EventHubPage2]
          }
          .onClick(() => {
            this.eventHubFunc();
            this.getUIContext().getPromptAction().showToast({
              message: 'EventHubFuncA'
            });
          })
          // [StartExclude EventHubPage2]
          .id('EventHubFuncA')
          .width('60%').height(50)
          .backgroundColor(Color.Blue)
          .borderRadius(25)
          .justifyContent(FlexAlign.Center)
          // [EndExclude EventHubPage2]
        }

        ListItem() {
          Row() {
            // [StartExclude EventHubPage2]
            Text('EventHubFuncB')
              .fontColor('#FFFFFF')
              .fontWeight(FontWeight.Bold)
            // [EndExclude EventHubPage2]
          }
          .onClick(() => {
            this.context.eventHub.off('event1');
            this.getUIContext().getPromptAction().showToast({
              message: 'EventHubFuncB'
            });
          })
          // [StartExclude EventHubPage2]
          .id('EventHubFuncB')
          .width('60%').height(50)
          .backgroundColor(Color.Blue)
          .borderRadius(25)
          .margin({top: 8})
          .justifyContent(FlexAlign.Center)
          // [EndExclude EventHubPage2]
        }
      }
      // [StartExclude EventHubPage2]
      .alignListItem(ListItemAlign.Center)
      // [EndExclude EventHubPage2]
    }
    // [StartExclude EventHubPage2]
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    // [EndExclude EventHubPage2]
  }
}
// [End EventHubPage2]