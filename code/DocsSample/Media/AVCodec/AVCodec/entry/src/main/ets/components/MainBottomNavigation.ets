/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

@Component
export struct MainBottomNavigation {
  @Prop activeIndex: number = 0;
  onTabSelected: (index: number) => void = (_index: number): void => {};

  build() {
    Row({ space: '4vp' }) {
      Button() {
        Column({ space: '2vp' }) {
          SymbolGlyph($r('sys.symbol.play_fill'))
            .fontSize('18fp')
            .fontColor([this.activeIndex === 0 ? '#0A59F7' : '#667085'])
          Text($r('app.string.tab_player'))
            .fontSize('12fp')
            .fontWeight(this.activeIndex === 0 ? FontWeight.Medium : FontWeight.Regular)
            .fontColor(this.activeIndex === 0 ? '#0A59F7' : '#667085')
        }
        .width('100%')
        .alignItems(HorizontalAlign.Center)
      }
      .layoutWeight(1)
      .height('52vp')
      .padding(0)
      .type(ButtonType.Normal)
      .backgroundColor(this.activeIndex === 0 ? '#EAF1FF' : Color.Transparent)
      .borderRadius('14vp')
      .accessibilityText($r('app.string.tab_player'))
      .onClick(() => this.onTabSelected(0))
      Button() {
        Column({ space: '2vp' }) {
          SymbolGlyph($r('sys.symbol.folder_fill'))
            .fontSize('18fp')
            .fontColor([this.activeIndex === 1 ? '#0A59F7' : '#667085'])
          Text($r('app.string.tab_library'))
            .fontSize('12fp')
            .fontWeight(this.activeIndex === 1 ? FontWeight.Medium : FontWeight.Regular)
            .fontColor(this.activeIndex === 1 ? '#0A59F7' : '#667085')
        }
        .width('100%')
        .alignItems(HorizontalAlign.Center)
      }
      .layoutWeight(1)
      .height('52vp')
      .padding(0)
      .type(ButtonType.Normal)
      .backgroundColor(this.activeIndex === 1 ? '#EAF1FF' : Color.Transparent)
      .borderRadius('14vp')
      .accessibilityText($r('app.string.tab_library'))
      .onClick(() => this.onTabSelected(1))
      Button() {
        Column({ space: '2vp' }) {
          SymbolGlyph($r('sys.symbol.video_fill'))
            .fontSize('18fp')
            .fontColor([this.activeIndex === 2 ? '#0A59F7' : '#667085'])
          Text($r('app.string.tab_recorder'))
            .fontSize('12fp')
            .fontWeight(this.activeIndex === 2 ? FontWeight.Medium : FontWeight.Regular)
            .fontColor(this.activeIndex === 2 ? '#0A59F7' : '#667085')
        }
        .width('100%')
        .alignItems(HorizontalAlign.Center)
      }
      .layoutWeight(1)
      .height('52vp')
      .padding(0)
      .type(ButtonType.Normal)
      .backgroundColor(this.activeIndex === 2 ? '#EAF1FF' : Color.Transparent)
      .borderRadius('14vp')
      .accessibilityText($r('app.string.tab_recorder'))
      .onClick(() => this.onTabSelected(2))
      Button() {
        Column({ space: '2vp' }) {
          SymbolGlyph($r('sys.symbol.arrow_clockwise'))
            .fontSize('18fp')
            .fontColor([this.activeIndex === 3 ? '#0A59F7' : '#667085'])
          Text($r('app.string.tab_transcode'))
            .fontSize('12fp')
            .maxLines(1)
            .minFontSize('10fp')
            .maxFontSize('12fp')
            .fontWeight(this.activeIndex === 3 ? FontWeight.Medium : FontWeight.Regular)
            .fontColor(this.activeIndex === 3 ? '#0A59F7' : '#667085')
        }
        .width('100%')
        .alignItems(HorizontalAlign.Center)
      }
      .layoutWeight(1)
      .height('52vp')
      .padding(0)
      .type(ButtonType.Normal)
      .backgroundColor(this.activeIndex === 3 ? '#EAF1FF' : Color.Transparent)
      .borderRadius('14vp')
      .accessibilityText($r('app.string.tab_transcode'))
      .onClick(() => this.onTabSelected(3))
      Button() {
        Column({ space: '2vp' }) {
          SymbolGlyph($r('sys.symbol.info_circle_fill'))
            .fontSize('18fp')
            .fontColor([this.activeIndex === 4 ? '#0A59F7' : '#667085'])
          Text($r('app.string.tab_device'))
            .fontSize('12fp')
            .fontWeight(this.activeIndex === 4 ? FontWeight.Medium : FontWeight.Regular)
            .fontColor(this.activeIndex === 4 ? '#0A59F7' : '#667085')
        }
        .width('100%')
        .alignItems(HorizontalAlign.Center)
      }
      .layoutWeight(1)
      .height('52vp')
      .padding(0)
      .type(ButtonType.Normal)
      .backgroundColor(this.activeIndex === 4 ? '#EAF1FF' : Color.Transparent)
      .borderRadius('14vp')
      .accessibilityText($r('app.string.tab_device'))
      .onClick(() => this.onTabSelected(4))
    }
    .width('100%')
    .padding({ left: '12vp', right: '12vp', top: '6vp', bottom: '6vp' })
    .backgroundColor('#F7F8FA')
  }
}
