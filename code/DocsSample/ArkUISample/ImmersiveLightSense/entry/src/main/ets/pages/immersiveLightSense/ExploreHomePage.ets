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
import { uiMaterial } from '@kit.ArkUI'
import {listItems, ListItemData, ClassifyComponent} from './Utils'

@Builder
export function explorePageBuilder() {
  ExploreHomePage()
}

// [Start explore_home_page]
@ComponentV2
struct ExploreHomePage {
  @Local currentIndex: number = 0
  @Local searchOpacity: number = 1
  @Local classifyType: Array<string> = []
  totalTitleHeight = 110
  @Local titleHeight:number = this.totalTitleHeight
  @Local scrollOffset: number = 0
  @Local titleOffset: number = 0
  @Builder
  exploreTitleBar() {
    Column() {
      Row() {
        Text('探索').fontSize(28).fontWeight(FontWeight.Bold).fontColor('#1A1A1A')
        Blank()
        Search({ placeholder: '探索探索' })
          .searchButton('搜索')
          .height(40)
          .width(220)
          .systemMaterial(new uiMaterial.ImmersiveMaterial({}))
      }.expandSafeArea([SafeAreaType.SYSTEM])
      .width('100%')
      .opacity(this.searchOpacity)
      .height(50)

      ClassifyComponent()
    }.expandSafeArea([SafeAreaType.SYSTEM])
    .width('100%')
    .height(this.titleHeight)
    .padding({ left: 20, right: 20})
    .position({x: 0, y: -this.titleOffset})
  }

  build() {
    NavDestination() {
      Scroll() {
        // 滑动区域的具体内容
        Column() {
          Image($r('app.media.startIcon')).width('100%').height(180)
            .borderRadius(12)
            .backgroundColor('#e0e0e0')
            .objectFit(ImageFit.Cover)

          List() {
            ForEach(listItems, (item: ListItemData) => {
              ListItem() {
                Row() {
                  SymbolGlyph(item.image).fontSize(36)
                    .fontColor(['#007dff'])
                    .margin({ right: 16})
                  Text(item.name).fontSize(16)
                    .fontColor('#333333')
                }.width('100%')
                .padding({ left: 20, right: 20, top: 14, bottom: 14 })
              }
            }, (item: ListItemData) => item.id)
          }
        }
      }
      // 避让标题栏显示区域
      .contentStartOffset(this.totalTitleHeight)
      .scrollable(ScrollDirection.Vertical)
      .scrollBar(BarState.Off)
      .edgeEffect(EdgeEffect.Spring)
      .width('100%')
      .height('100%')
      .onDidScroll((xOffset: number, yOffset: number, state: ScrollState) => {
        this.scrollOffset += yOffset
        // 搜索框大小范围内
        if (this.scrollOffset <= 50) {
          this.titleOffset = this.scrollOffset;
          this.titleHeight = this.totalTitleHeight - this.titleOffset
          this.searchOpacity = 1 - this.titleOffset / 50
        }
      })
    }.title(
      { builder: this.exploreTitleBar, height: this.titleHeight },
      { barStyle: BarStyle.STACK,
        // 设置标题栏模糊
        scrollEffectOptions: {
          scrollEffectType: ScrollEffectType.GRADUAL_BLUR
        }
      }
    ).hideBackButton(true)
    .expandSafeArea([SafeAreaType.SYSTEM])
  }
}
// [End export_home_page]