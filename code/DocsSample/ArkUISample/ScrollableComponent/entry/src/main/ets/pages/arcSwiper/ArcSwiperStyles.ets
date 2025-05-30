/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
  ArcSwiper,
  ArcSwiperAttribute,
  ArcDotIndicator,
  ArcDirection,
  ArcSwiperController
} from '@kit.ArkUI';
import { ComponentCard } from '../../common/Card';

@Entry
@Component
export struct ArcSwiperStyles {
  @State message: string = 'Hello World';

  build() {
    NavDestination() {
      Column({ space: 12 }) {
        ComponentCard({ title: $r('app.string.ArcSwiperStyles_titleDefault') }) {
          ArcSwiper() {
            Text('0')
              .width(233)
              .height(233)
              .backgroundColor(Color.Gray)
              .textAlign(TextAlign.Center)
              .fontSize(30)

            Text('1')
              .width(233)
              .height(233)
              .backgroundColor(Color.Green)
              .textAlign(TextAlign.Center)
              .fontSize(30)

            Text('2')
              .width(233)
              .height(233)
              .backgroundColor(Color.Pink)
              .textAlign(TextAlign.Center)
              .fontSize(30)
          }
        }

        ComponentCard({ title: $r('app.string.ArcSwiperStyles_titleCustomize') }) {
          ArcSwiper() {
            Text('0')
              .width(233)
              .height(233)
              .backgroundColor(Color.Gray)
              .textAlign(TextAlign.Center)
              .fontSize(30)

            Text('1')
              .width(233)
              .height(233)
              .backgroundColor(Color.Green)
              .textAlign(TextAlign.Center)
              .fontSize(30)

            Text('2')
              .width(233)
              .height(233)
              .backgroundColor(Color.Pink)
              .textAlign(TextAlign.Center)
              .fontSize(30)
          }
          .indicator(
            new ArcDotIndicator()
              .arcDirection(ArcDirection.SIX_CLOCK_DIRECTION) // 设置导航点位于6点钟方向
              .itemColor(Color.Red) // 设置导航点颜色为红色
              .selectedItemColor(Color.Blue) // 设置选中导航点颜色为蓝色
          )
        }
      }
      .width('100%')
      .height('100%')
      .padding({ left: 12, right: 12 })
    }
    .backgroundColor('#f1f2f3')
    .title($r('app.string.ArcSwiperStyles_title'))
  }
}