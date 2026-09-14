/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 */

import { MediaInfoRow, MediaInfoSection } from '../model/MediaInfoModel';

@Component
export struct MediaInfoPanel {
  @Prop sections: MediaInfoSection[] = [];

  @Builder
  private rowView(row: MediaInfoRow) {
    Row() {
      Text(row.label).width('42%').fontSize('14fp').fontColor('#66727D')
      Text(row.value).width('58%').fontSize('14fp').fontColor('#182431')
    }
    .width('100%')
    .alignItems(VerticalAlign.Top)
  }

  @Builder
  private sectionView(section: MediaInfoSection) {
    Column({ space: 8 }) {
      Text(section.title).width('100%').fontSize('18fp').fontWeight(FontWeight.Bold).fontColor('#182431')
      ForEach(section.rows, (row: MediaInfoRow) => this.rowView(row), (row: MediaInfoRow) => row.label)
      if (section.rawText.length > 0) {
        Text(section.rawText)
          .width('100%').fontSize('12fp').fontFamily('monospace').fontColor('#E6EDF3')
          .backgroundColor('#202830').borderRadius('8vp').padding('12vp')
      }
    }
    .width('100%').alignItems(HorizontalAlign.Start).backgroundColor(Color.White)
    .borderRadius('8vp').padding('14vp')
  }

  build() {
    Scroll() {
      Column({ space: 12 }) {
        ForEach(this.sections, (section: MediaInfoSection) => this.sectionView(section),
          (section: MediaInfoSection) => section.title)
      }
      .width('100%').padding({ left: '16vp', right: '16vp', bottom: '24vp' })
    }
    .size({ width: '100%', height: '100%' }).scrollBar(BarState.Auto)
  }
}
