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

// [Start polymorphicEffect_popup]
// 请将$r('app.media.xxx')替换为实际资源文件
import {
  Entry,
  Component,
  Column,
  Row,
  RowOptions,
  Button,
  Text,
  Image,
  NavDestination,
  Builder,
  Placement,
  Color,
  FlexAlign,
  PropRef,
  ForEach,
  CommonMethod,
  $r
} from '@kit.ArkUI';
import { State } from '@ohos.arkui.stateManagement';

@Entry
@Component
export struct PolymorphicEffectPopupExample {
  // 请在resources\base\element\string.json文件中配置name为'xxx',value为非空字符串的资源
  @State scan: string =
    this.getUIContext().getHostContext()?.resourceManager.getStringByNameSync('Scan_title') as string;
  @State createGroupChat: string =
    this.getUIContext().getHostContext()?.resourceManager.getStringByNameSync('Create_group_chat') as string;
  @State electronicWorkCard: string =
    this.getUIContext().getHostContext()?.resourceManager.getStringByNameSync('Electronic_work_card') as string;
  private menus: Array<string> = [this.scan, this.createGroupChat, this.electronicWorkCard];

  // popup构造器定义弹框内容
  @Builder
  popupItemBuilder(name: string, action: string): void {
    PopupItemChild({ childName: name, childAction: action })
  }

  // popup构造器定义弹框内容
  @Builder
  popupBuilder(): void {
    Column() {
      ForEach(
        this.menus,
        (item: string) => {
          this.popupItemBuilder(item, String(this.menus.indexOf(item)))
        })
    }
    .padding(8)
  }

  @State customPopup: boolean = false;

  build(): void {
    NavDestination() {
      Column() {
        Button('click me')
          .id('click me')
          .onClick((): void => {
            this.customPopup = !this.customPopup
          })
          .bindPopup(
            this.customPopup,
            {
              builder: this.popupBuilder, // 气泡的内容
              placement: Placement.Bottom, // 气泡的弹出位置
              popupColor: Color.White, // 气泡的背景色
              onStateChange: (event): void => {
                if (!event.isVisible) {
                  this.customPopup = false
                }
              }
            })
      }
      .width('100%')
      .justifyContent(FlexAlign.Center)
    }
    // [StartExclude polymorphicEffect_popup]
    // 请将$r('app.string.AvoidSoftKeyboardPopupExample_title')替换为实际资源文件，在本示例中该资源文件的value值为"设置气泡内的多态效果"
    .title($r('app.string.PolymorphicEffectPopupExample_title'))
    // [EndExclude polymorphicEffect_popup]
  }
}

@Component
struct PopupItemChild {
  @PropRef childName: string = '';
  @PropRef childAction: string = '';
  @State selected: string =
    this.getUIContext().getHostContext()?.resourceManager.getStringByNameSync('Selected') as string;

  build(): void {
    Row({ space: 8 } as RowOptions) {
      Image($r('app.media.startIcon'))
        .width(24)
        .height(24)
      Text(this.childName)
        .fontSize(16)
    }
    .width(130)
    .height(50)
    .padding(8)
    .onClick((): void => {
      this.getUIContext().getPromptAction().showToast({ message: this.selected + this.childName })
    })
    .stateStyles({
      normal: (instance: CommonMethod): void => {
        instance.backgroundColor(Color.White)
      },
      pressed: (instance: CommonMethod): void => {
        instance.backgroundColor('#d4f1ff')
      }
    })
  }
}
// [End polymorphicEffect_popup]