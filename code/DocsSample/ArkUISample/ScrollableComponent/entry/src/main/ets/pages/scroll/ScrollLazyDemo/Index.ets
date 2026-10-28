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
 * WITHOUT OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

// [Start ScrollLazyDemo]
@Entry
@Component
struct ScrollLazyDemo {
  @State items: string[] = ScrollLazyDemo.initItems()
  private timer: number = -1

  aboutToAppear() {
    this.timer = setInterval(() => {
      this.items[this.items.length - 1] += '0123456789\n'
    }, 400)
  }

  aboutToDisappear() {
    clearInterval(this.timer)
  }

  private static initItems(): string[] {
    const arr: string[] = []
    for (let i = 0; i < 50; i++) {
      arr.push(`Item ${i + 1} \n`)
    }
    return arr
  }

  build() {
    Scroll() {
      LazyVGridLayout() {
        ForEach(this.items, (item: string) => {
          Text(item)
            .width('100%')
            .padding(12)
            .backgroundColor('#fff4f4f4')
            .borderRadius(8)
            .margin({ top: 4, bottom: 4 })
        })
      }
    }
    .initialOffset({ yOffset: Infinity })
    .width('100%')
    .height('100%')
  }
}
// [End ScrollLazyDemo]

@Builder
export function ScrollLazyDemoDestination() {
  ScrollLazyDemoPage();
}

@Entry
@Component
struct ScrollLazyDemoPage {
  build() {
    NavDestination() {
      ScrollLazyDemo()
    }
    .title('Scroll+LazyVGridLayout', {
      backgroundColor: $r('app.color.navigation_background'),
      barStyle: BarStyle.STACK
    })
  }
}
