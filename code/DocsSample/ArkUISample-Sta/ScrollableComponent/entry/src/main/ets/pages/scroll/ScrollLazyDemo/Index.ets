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
  BarStyle,
  Builder,
  Component,
  Entry,
  ForEach,
  LazyVGridLayout,
  NavDestination,
  OffsetOptions,
  Scroll,
  State,
  Text,
  $r
} from '@kit.ArkUI';

// [Start ScrollLazyDemo]
@Component
export struct ScrollLazyDemo {
  @State items: Array<string> = new Array<string>();
  private timer: int = -1;

  aboutToAppear(): void {
    for (let i = 0; i < 50; i++) {
      this.items.push(`Item ${i + 1} \n`);
    }
    this.timer = setInterval(() => {
      this.items[this.items.length - 1] += '0123456789\n';
    }, 400);
  }

  aboutToDisappear(): void {
    clearInterval(this.timer);
  }

  build(): void {
    Scroll() {
      LazyVGridLayout() {
        ForEach(this.items, (item: string) => {
          Text(item)
            .width('100%')
            .padding(12)
            .backgroundColor('#fff4f4f4')
            .borderRadius(8)
            .margin({ top: 4, bottom: 4 })
        }, (item: string) => item)
      }
    }
    .initialOffset({ yOffset: Infinity } as OffsetOptions)
    .width('100%')
    .height('100%')
  }
}
// [End ScrollLazyDemo]

@Builder
export function ScrollLazyDemoDestination(): void {
  ScrollLazyDemoPage();
}

@Entry
@Component
struct ScrollLazyDemoPage {
  build(): void {
    NavDestination() {
      ScrollLazyDemo()
    }
    .backgroundColor($r('app.color.navigation_background'))
    .title('Scroll+LazyVGridLayout', {
      backgroundColor: $r('app.color.navigation_background'),
      barStyle: BarStyle.STACK
    })
  }
}
