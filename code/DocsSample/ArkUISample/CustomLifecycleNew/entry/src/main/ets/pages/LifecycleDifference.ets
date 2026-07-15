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

// [Start LifecycleDifference]
// Index.ets
import { SwiperExample } from './SwiperPage';

@Entry
@Component
struct Index {
  @State message: string = 'Hello World';
  @State show: boolean = false;

  build() {
    RelativeContainer() {
      Text('start')
        .fontSize(50)
        .fontColor('#000')
        .id('text')
        .alignRules({
          top: { anchor: '__container__', align: VerticalAlign.Top },
          middle: { anchor: '__container__', align: HorizontalAlign.Center }
        })
        .onClick(() => {
          // this.show为true，创建SwiperExample；this.show为false，销毁SwiperExample
          this.show = !this.show;
        })
      if (this.show) {
        SwiperExample()
          .id('TableExample')
          .alignRules({
            bottom: { anchor: '__container__', align: VerticalAlign.Bottom },
            middle: { anchor: '__container__', align: HorizontalAlign.Center }
          })
          .width('100%')
          .height('auto')
      }
    }
    .height('100%')
    .width('100%')
  }
}
// [End LifecycleDifference]

@Builder
export function lifecycleDifference() {
  NavDestination() {
    Index()
  }
}
