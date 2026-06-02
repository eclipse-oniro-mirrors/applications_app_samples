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

import {
  $r, Column, Component, Entry, FlexAlign, NavDestination, Text
} from '@kit.ArkUI';
import { State } from '@ohos.arkui.stateManagement';

@Entry
@Component
export struct TextLong {
  // 'Text_Long_String'资源文件中的value值为'这是一段超长文本'
  @State message: string = this.getUIContext()
    .getHostContext()!.resourceManager.getStringByNameSync('Text_Long_String').repeat(50);

  build(): void {
    NavDestination() {
      Column() {
        Text(this.message)
          .height('auto')
          .maxLines(3)
      }
      .height(200)
      .width('80%')
      .margin('10%')
      .borderWidth(1)
      .justifyContent(FlexAlign.Center)
    }
    // [StartExclude Text_Long]
    .backgroundColor('#f1f 2f3')
    .title($r('app.string.Text_Long'))

    // [EndExclude Text_Long]
  }
}

// [End Text_Long]
