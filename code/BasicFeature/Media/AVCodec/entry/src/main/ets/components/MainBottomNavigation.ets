/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 */

@Component
export struct MainBottomNavigation {
  @Prop activeIndex: number = 0;
  onTabSelected: (index: number) => void = (_index: number): void => {};

  build() {
    Row({ space: '8vp' }) {
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
      .type(ButtonType.Normal)
      .backgroundColor(this.activeIndex === 2 ? '#EAF1FF' : Color.Transparent)
      .borderRadius('14vp')
      .accessibilityText($r('app.string.tab_recorder'))
      .onClick(() => this.onTabSelected(2))
    }
    .width('100%')
    .padding({ left: '12vp', right: '12vp', top: '6vp', bottom: '6vp' })
    .backgroundColor('#F7F8FA')
  }
}
