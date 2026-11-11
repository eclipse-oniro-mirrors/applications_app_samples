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

import { router } from '@kit.ArkUI';

@Entry
@Component
struct Index {
  build() {
    Column({ space: 16 }) {
      Text($r('app.string.index_title'))
        .fontSize(22)
        .fontWeight(FontWeight.Bold)
      Text($r('app.string.index_intro'))
        .fontSize(14)
        .fontColor(Color.Gray)
      Button($r('app.string.nav_tree'))
        .width('80%')
        .id('navTreeButton')
        .onClick(() => {
          router.pushUrl({ url: 'pages/TreePage' });
        })
      Button($r('app.string.nav_command'))
        .width('80%')
        .id('navCommandButton')
        .onClick(() => {
          router.pushUrl({ url: 'pages/CommandPage' });
        })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }
}
