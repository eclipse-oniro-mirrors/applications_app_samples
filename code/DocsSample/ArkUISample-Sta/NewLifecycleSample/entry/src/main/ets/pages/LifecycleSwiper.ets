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
import { NavDestination, $r } from '@kit.ArkUI';
// [Start LifecycleSwiper]
import { SwiperExample } from './SwiperPage';
import { Entry, Component, State, RelativeContainer, Text, Button } from '@kit.ArkUI';

@Entry
@Component
struct LifecycleSwiperIndex {
  @State message: string = 'Hello World';
  @State show: boolean = false;
  @State currentTabIndex: number = 0;

  build() {
    RelativeContainer() {
      Text('start')
        .fontSize(50)
        .fontColor('#000')
        .id('text')
        .onClick(() => {
          // this.show为true，创建SwiperExample；this.show为false，销毁SwiperExample
          this.show = !this.show;
        })
      if (this.show) {
        SwiperExample()
          .id('TableExample')
          .width('100%')
          .height('auto')
        Button('delete')
          .onClick(() => {
            // 此时this.show为true，按下后this.show为false，销毁SwiperExample
            this.show = !this.show;
          })
      }
    }
    .height('100%')
    .width('100%')
  }
}
// [End LifecycleSwiper]

@Builder
export function lifecycleSwiper(): void {
  NavDestination() {
    LifecycleSwiperIndex();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.lifecycle_swiper_title'))
}
