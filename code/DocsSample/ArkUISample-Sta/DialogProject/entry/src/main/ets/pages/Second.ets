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
  Column,
  Button,
  Entry,
  Component,
  FontWeight,
  ResourceStr,
  $r
} from '@kit.ArkUI';
import { State } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct Second {
  // 请将$r('app.string.back')替换为实际资源文件，在本示例中该资源文件的value值为"点击返回"
  @State message: ResourceStr = $r('app.string.back');
  build(): void {
    Column() {
      Button(this.message)
        .fontSize(50)
        .fontWeight(FontWeight.Bold).onClick(() => {
        this.getUIContext().getRouter().back();
      })
    }.width('100%').height('100%').margin({ top: 20 })
  }
}