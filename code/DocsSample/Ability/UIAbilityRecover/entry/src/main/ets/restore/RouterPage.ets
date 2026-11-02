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

/**
 * 方案 C 示例：纯 @ohos.router。页面自 API 14 起 recoverable 默认 true，
 * 应用只需开启总开关并保存/恢复业务数据。
 */
@Entry
@Component
struct RouterPage {
  @State message: string = 'router 页面';

  build() {
    Column({ space: 12 }) {
      Text(this.message)
        .fontSize(22)
        .fontWeight(FontWeight.Bold)
      Text('本页使用 @ohos.router 路由，默认参与系统页面栈恢复（API 14 起 recoverable 默认 true）')
        .fontSize(14)
        .fontColor(Color.Gray)
        .textAlign(TextAlign.Center)
        .padding(12)
      // [Start router_exclude]
      Button('跳转广告页（不参与恢复）')
        .width('80%')
        .onClick(() => {
          router.pushUrl({
            url: 'restore/AdvertPage',
            // 广告页等无需恢复的页面显式排除
            recoverable: false
          });
        })
      // [End router_exclude]
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }
}
