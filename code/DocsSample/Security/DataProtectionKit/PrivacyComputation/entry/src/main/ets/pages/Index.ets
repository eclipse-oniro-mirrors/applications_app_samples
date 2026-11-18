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

import { psiFlow, pirFlow } from '../operations';

@Entry
@Component
struct Index {
  @State message1: string = 'PSI Flow';
  @State message2: string = 'PIR Flow';

  build() {
    Column() {
      Text($r('app.string.title'))
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 20 });

      Button(this.message1)
        .width('70%')
        .margin(3)
        .onClick(async () => {
          psiFlow().then(str => this.message1 = str);
        });

      Button(this.message2)
        .width('70%')
        .margin(3)
        .onClick(async () => {
          pirFlow().then(str => this.message2 = str);
        });
    }
    .width('100%')
    .height('100%')
    .backgroundColor(0xF1F3F5)
    .alignItems(HorizontalAlign.Center)
  }
}
