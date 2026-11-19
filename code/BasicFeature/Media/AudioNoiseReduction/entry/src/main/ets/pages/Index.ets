/*
* Copyright (C) 2026 Huawei Device Co., Ltd.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
* http://www.apache.org/licenses/LICENSE-2.0
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
  aboutToAppear(): void {
    AppStorage.setOrCreate('apiMode', 'C API');
    AppStorage.setOrCreate('defaultSourceType', 'LIVE');
    AppStorage.setOrCreate('defaultSamplingRate', '44100');
    AppStorage.setOrCreate('defaultChannels', '2ch');
    AppStorage.setOrCreate('defaultContentType', 'MUSIC');
    AppStorage.setOrCreate('defaultPlaybackRate', '44100');
    AppStorage.setOrCreate('defaultPlaybackChannels', '2ch');
    AppStorage.setOrCreate('logLimit', 50);
  }

  build() {
    Column() {
      Text($r('app.string.index_title'))
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 40, bottom: 30 })

      Button($r('app.string.index_enter_demo'))
        .width('80%')
        .height(48)
        .fontSize(16)
        .margin({ top: 10, bottom: 10 })
        .onClick(() => router.pushUrl({ url: 'pages/NoiseReductionMain' }))

      Button($r('app.string.index_simple_example'))
        .width('80%')
        .height(48)
        .fontSize(16)
        .margin({ top: 10, bottom: 10 })
        .onClick(() => router.pushUrl({ url: 'pages/NoiseReductionSimpleExample' }))
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .backgroundColor('#F1F3F5')
  }
}
