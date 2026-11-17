/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 */

import { SubtitleStyleModel } from '../model/SubtitleStyleModel';

@Component
export struct SubtitleSettingsPanel {
  @ObjectLink style: SubtitleStyleModel;

  build() {
    Scroll() {
      Column({ space: 16 }) {
        Row() {
          Text($r('app.string.subtitle_visible')).layoutWeight(1)
          Toggle({ type: ToggleType.Switch, isOn: this.style.visible })
            .onChange((value: boolean) => this.style.visible = value)
        }.width('100%')
        Text($r('app.string.subtitle_size')).width('100%')
        Select([
          { value: $r('app.string.playback_subtitle_style_small') },
          { value: $r('app.string.playback_subtitle_style_medium') },
          { value: $r('app.string.playback_subtitle_style_large') }
        ]).selected(this.style.sizeIndex)
          .onSelect((index: number) => this.style.sizeIndex = index)
          .width('100%')
        Text($r('app.string.subtitle_color')).width('100%')
        Select([
          { value: $r('app.string.subtitle_white') },
          { value: $r('app.string.subtitle_yellow') },
          { value: $r('app.string.subtitle_cyan') }
        ]).selected(this.style.colorIndex)
          .onSelect((index: number) => this.style.colorIndex = index)
          .width('100%')
        Text($r('app.string.subtitle_background')).width('100%')
        Select([
          { value: $r('app.string.subtitle_transparent') },
          { value: $r('app.string.subtitle_translucent') },
          { value: $r('app.string.subtitle_dark') }
        ]).selected(this.style.backgroundIndex)
          .onSelect((index: number) => this.style.backgroundIndex = index)
          .width('100%')
        Text($r('app.string.subtitle_position')).width('100%')
        Select([
          { value: $r('app.string.subtitle_bottom') },
          { value: $r('app.string.subtitle_top') }
        ]).selected(this.style.positionIndex)
          .onSelect((index: number) => this.style.positionIndex = index)
          .width('100%')
        Text($r('app.string.subtitle_preview'))
          .fontSize(this.style.fontSize())
          .fontColor(this.style.fontColor())
          .backgroundColor(this.style.backgroundColor())
          .textShadow({ radius: 2, color: '#FF000000', offsetX: 1, offsetY: 1 })
          .padding(12)
        Button($r('app.string.subtitle_reset')).onClick(() => this.style.reset())
      }.width('100%').padding(20)
    }.scrollBar(BarState.Auto)
  }
}
