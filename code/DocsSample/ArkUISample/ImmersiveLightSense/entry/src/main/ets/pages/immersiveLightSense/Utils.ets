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
import { ChipGroup, ChipGroupItemOptions, SymbolGlyphModifier, uiMaterial } from "@kit.ArkUI"
export interface ListItemData {
  name: Resource,
  image: Resource
  id: string
}

export const listItems: ListItemData[] = [
  { id: '1', name: $r('app.string.discovery'), image: $r('sys.symbol.compass') },
  { id: '2', name: $r('app.string.trend'), image: $r('sys.symbol.flame') },
  { id: '3', name: $r('app.string.new'), image: $r('sys.symbol.picture') },
  { id: '4', name: $r('app.string.limited_time'), image: $r('sys.symbol.timer') },
  { id: '5', name: $r('app.string.featured'), image: $r('sys.symbol.star_fill') },
  { id: '6', name: $r('app.string.rank'), image: $r('sys.symbol.flame_fill') },
  { id: '7', name: $r('app.string.classic'), image: $r('sys.symbol.heart') },
  { id: '8', name: $r('app.string.unique'), image: $r('sys.symbol.arrow_clockwise') },
  { id: '9', name: $r('app.string.popularity'), image: $r('sys.symbol.flag') },
  { id: '10', name: $r('app.string.new_product'), image: $r('sys.symbol.arrow_clockwise') },
  { id: '11', name: $r('app.string.rave_reviews'), image: $r('sys.symbol.hand_thumbsdown_fill') },
  { id: '12', name: $r('app.string.recommendation'), image: $r('sys.symbol.star_fill')}
]

// [Start classify_component]
@ComponentV2
export struct ClassifyComponent {
  @Local selectedIndexes: Array<number> = [0]
  info: Array<ChipGroupItemOptions> = []

  aboutToAppear(): void {
    let classifyType: string[] = ['策略', '动作', '竞技', '射击', '卡牌', '体育', '休闲', '音乐']

    for (let index: number = 0; index < classifyType.length; index++) {
      this.info.push({label: {text: classifyType[index]}, prefixSymbol: {
        activated: new SymbolGlyphModifier($r('sys.symbol.star_fill')).fontSize(20).fontColor(['#d3d3d3']),
        normal: new SymbolGlyphModifier($r('sys.symbol.star_fill')).fontSize(20).fontColor([Color.Black])
      }})
    }
  }

  build() {
    ChipGroup({
      items: this.info,
      itemStyle: {
        backgroundColor: Color.Transparent,
        selectedFontColor: '#d3d3d3'
      },
      backgroundSystemMaterial: new uiMaterial.ImmersiveMaterial({
        colorInvert: true,
        interactive: true
      }),
      selectedIndexes: this.selectedIndexes,
      onChange: (activeIndexes: Array<number>) => {
        this.selectedIndexes = activeIndexes
      }
    })
  }
}
// [End classify_component]