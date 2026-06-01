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

// [Start parallelNoList_start]
// ArkTS-Sta示例
import { Entry, Column, Component, Image, Text, Stack, $r, ImageFit, FontWeight, Margin } from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';
import { ParallelizeUI } from '@ohos.arkui.Parallelize';

class CardInfo {
  title: string
  desc: string
  cover: string

  constructor(title: string, desc: string, cover: string) {
    this.title = title
    this.desc = desc
    this.cover = cover
  }
}

@Entry
@Component
struct ParallelDemo {
  @State arr: Array<Int> = [1]

  aboutToAppear() {
    // 构造并行循环创建的数据源，创建10个Stack组件
    for (let i = 2; i <= 10; i++) {
      this.arr.push(i)
    }
  }

  build() {
    Column() {
      Text('ParallelizeUI 循环创建示例')
        .fontSize(22)
        .fontWeight(FontWeight.Bold)
        .fontColor('#333')
        .margin({ bottom: 12 } as Margin)

      // 循环并行创建
      ParallelizeUI<Int, CardInfo>({ enable: true }, this.arr,
        (item: Int, index: Int) => {
          const coverIndex = ((item - 1) % 5) + 1
          return new CardInfo(
            `卡片 ${item}`,
            `描述信息 ${item}`,
            `app.media.cover${coverIndex}`
          )
        },
        (param: CardInfo) => {
          // 每个卡片UI
          Stack() {
            Image($r(param.cover))
              .width('100%')
              .height(180)
              .borderRadius(10)
              .objectFit(ImageFit.Cover)

            Column() {
              Text(param.title) // 卡片标题
                .fontSize(18)
                .fontWeight(FontWeight.Medium)
                .fontColor('#FFF')

              Text(param.desc) // 卡片描述
                .fontSize(14)
                .fontColor('#DDD')
            }
            .padding(10)
          }
          .width('100%')
          .borderRadius(10)
        }
      )
    }
    .width('100%')
    .padding(16)
    .backgroundColor('#FAFAFA')
  }
}
// [End parallelNoList_start]
