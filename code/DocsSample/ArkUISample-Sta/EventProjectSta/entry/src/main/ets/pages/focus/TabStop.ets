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

// [Start dynamic_focus_tab_stop]
import { $r, Button, Column, ColumnOptions, Component, Entry, Margin, NavDestination } from '@kit.ArkUI';

@Entry
@Component
export struct TabStopExample {
  build() {
    NavDestination() {
      Column({ space: 20 } as ColumnOptions) {
        Button('Button1')
          .width(140)
          .height(45)
          .margin({ top: 5, bottom: 5, left: 5, right: 5 } as Margin)
        Column() {
          Button('Button2')
            .width(140)
            .height(45)
            .margin({ top: 5, bottom: 5, left: 5, right: 5 } as Margin)
          Button('Button3')
            .width(140)
            .height(45)
            .margin({ top: 5, bottom: 5, left: 5, right: 5 } as Margin)
        }.tabStop(true)
      }.width('100%')
    }
    // [StartExclude dynamic_focus_tab_stop]
    .backgroundColor('#f1f2f3')
    // 请将$r('app.string.Tab_Index_TabStop_title')替换为实际资源文件，在本示例中该资源文件的value值为"标签暂停/TabStop"
    .title($r('app.string.Tab_Index_TabStop_title'))
    // [EndExclude dynamic_focus_tab_stop]
  }
}
// [End dynamic_focus_tab_stop]