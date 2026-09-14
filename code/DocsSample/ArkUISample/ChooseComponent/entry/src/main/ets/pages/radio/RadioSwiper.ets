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

// [Start radio_control_swiper_function]
// xxx.ets
@Entry
@Component
export struct RadioSwiperSample {
  // 当前展示的页面索引
  @State currentIndex: number = 0;
  // 各页面的主题色
  private colors: string[] = ['#699eec', '#699eec', '#699eec'];
  // 各页面的标题文字
  private titles: string[] = ['Spring', 'Summer', 'Autumn'];
  // 各页面对应的独立Radio分组名称，不同页面的分组互不影响
  private groups: string[] = ['springGroup', 'summerGroup', 'autumnGroup'];
  // 各页面独立的可选项
  private options: string[][] = [
    ['Bloom', 'Spring outing', 'Kite'],
    ['Swim', 'Cool off', 'Watermelon'],
    ['Moon', 'Climb', 'Autumn outing']
  ];

  build() {
    // [StartExclude radio_control_swiper_function]
    NavDestination() {
      // [EndExclude radio_control_swiper_function]
      Column({ space: 16 }) {
        Text(`Current page: ${this.titles[this.currentIndex]}`)
          .fontSize(18)
          .fontWeight(FontWeight.Medium)

        // Swiper每页内包含一组独立的Radio，滑动切页后各页选中状态互不影响
        Swiper() {
          ForEach(this.titles, (title: string, index: number) => {
            Column({ space: 16 }) {
              Text(title)
                .fontSize(48)
                .fontColor('#fff')
              // 当前页的Radio分组，group名称随页面变化，与其他页相互独立
              Row({ space: 24 }) {
                ForEach(this.options[index], (option: string) => {
                  Column() {
                    Radio({ value: option, group: this.groups[index] })
                    Text(option)
                      .fontSize(14)
                      .fontColor('#fff')
                      .margin({ top: 4 })
                  }
                })
              }
              .justifyContent(FlexAlign.Center)
            }
            .width('100%')
            .height(240)
            .justifyContent(FlexAlign.Center)
            .backgroundColor(this.colors[index])
            .borderRadius(16)
          })
        }
        .index(this.currentIndex)
        .indicator(true)
        .loop(false)
        .onChange((index: number) => {
          // 滑动切换页面时，更新当前页索引
          this.currentIndex = index;
        })
      }
      .width('100%')
      .height('100%')
      .padding({ left: 16, right: 16 })
      .alignItems(HorizontalAlign.Center)
      // [StartExclude radio_control_swiper_function]
    }
    // [EndExclude radio_control_swiper_function]
  }
}
// [End radio_control_swiper_function]
