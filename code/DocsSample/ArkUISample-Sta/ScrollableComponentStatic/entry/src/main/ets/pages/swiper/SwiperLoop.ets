'use static';

/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { ComponentCard } from '../../common/Card';

import {
  Entry,
  Column,
  Component,
  $r,
  Padding,
  ColumnOptions,
  Swiper,
  Text,
  Color,
  TextAlign,
  NavDestination
} from '@kit.ArkUI';

@Entry
@Component
export struct SwiperLoop {
  build(): void {
    NavDestination() {
      Column({ space: 12 } as ColumnOptions) {
        ComponentCard({ title: $r('app.string.SwiperLoop_titleTrue') }) {
          // [Start loop_with_true]
          Swiper() {
            Text('0')
              .width('90%')
              .height('100%')
              .backgroundColor(Color.Gray)
              .textAlign(TextAlign.Center)
              .fontSize(30);

            Text('1')
              .width('90%')
              .height('100%')
              .backgroundColor(Color.Green)
              .textAlign(TextAlign.Center)
              .fontSize(30);

            Text('2')
              .width('90%')
              .height('100%')
              .backgroundColor(Color.Pink)
              .textAlign(TextAlign.Center)
              .fontSize(30);
          }
          // [StartExclude loop_with_true]
          .height(200)
      // [EndExclude loop_with_true]
      .loop(true)
    // [End loop_with_true]
  };

  ComponentCard({ title: $r('app.string.SwiperLoop_titleFalse') }) {
    // [Start loop_with_false]
    Swiper() {
      // [StartExclude loop_with_false]
      Text('0')
        .width('90%')
        .height('100%')
        .backgroundColor(Color.Gray)
        .textAlign(TextAlign.Center)
        .fontSize(30);

      Text('1')
        .width('90%')
        .height('100%')
        .backgroundColor(Color.Green)
        .textAlign(TextAlign.Center)
        .fontSize(30);

      Text('2')
        .width('90%')
        .height('100%')
        .backgroundColor(Color.Pink)
        .textAlign(TextAlign.Center)
        .fontSize(30);
      // [EndExclude loop_with_false]
    }
          // [StartExclude loop_with_false]
          .height(200)
      // [EndExclude loop_with_false]
      .loop(false);
    // [End loop_with_false]
  }
}
      .width('100%')
  .height('100%')
  .padding({ left: 12, right: 12 } as Padding)
    }
    .backgroundColor('#f1f2f3')
  .title($r('app.string.SwiperLoop_title'))
  }
}