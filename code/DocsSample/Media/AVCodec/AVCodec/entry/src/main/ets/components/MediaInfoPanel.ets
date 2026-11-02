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

import { MediaInfoRow, MediaInfoSection } from '../model/MediaInfoModel';

@Component
export struct MediaInfoPanel {
  @Prop sections: MediaInfoSection[] = [];
  @State expandedRawTitles: string[] = [];

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
        Button(this.expandedRawTitles.indexOf(section.title) >= 0 ?
          $r('app.string.media_info_raw_hide') : $r('app.string.media_info_raw_show'))
          .width('100%')
          .height('36vp')
          .fontSize('12fp')
          .onClick((): void => this.toggleRawSection(section.title))
        if (this.expandedRawTitles.indexOf(section.title) >= 0) {
          Text(section.rawText)
            .width('100%').fontSize('12fp').fontFamily('monospace').fontColor('#E6EDF3')
            .backgroundColor('#202830').borderRadius('8vp').padding('12vp')
        }
      }
    }
    .width('100%').alignItems(HorizontalAlign.Start).backgroundColor(Color.White)
    .borderRadius('8vp').padding('14vp')
  }

  private toggleRawSection(title: string): void {
    const sectionIndex: number = this.expandedRawTitles.indexOf(title);
    if (sectionIndex >= 0) {
      this.expandedRawTitles.splice(sectionIndex, 1);
    } else {
      this.expandedRawTitles.push(title);
    }
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
