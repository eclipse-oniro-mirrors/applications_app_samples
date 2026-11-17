/*
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

import router from '@ohos.router';
import { DetailModel, DetailRow } from '../feature/DetailModel';

@Entry
@Component
struct DetailPage {
  @State rows: Array<DetailRow> = [];

  aboutToAppear(): void {
    const name: string | undefined = AppStorage.get<string>('detailName');
    const uri: string | undefined = AppStorage.get<string>('detailUri');
    const size: number | undefined = AppStorage.get<number>('detailSize');
    const modified: number | undefined = AppStorage.get<number>('detailModified');
    const fileName: string = name !== undefined ? name : '';
    this.rows = DetailModel.build(fileName, uri !== undefined ? uri : '', size !== undefined ? size : -1,
      modified !== undefined ? modified : 0, false);
  }

  build() {
    Column() {
      Row() {
        Image($r('app.media.ic_public_back'))
          .width('24vp')
          .height('24vp')
          .margin({ right: '12vp' })
          .id('detail_back')
          .onClick(() => {
            router.back();
          })
        Text('文件详情')
          .fontSize('20vp')
          .fontWeight(700)
          .fontColor($r('app.color.font_color_182431'))
          .id('detail_title')
      }
      .width('100%')
      .padding({ left: '16vp', right: '16vp', top: '12vp', bottom: '12vp' })
      .backgroundColor($r('app.color.white_bg_color'))

      List({ space: '1vp' }) {
        ForEach(this.rows, (row: DetailRow, index: number) => {
          ListItem() {
            Row() {
              Text(row.label)
                .fontSize('14vp')
                .fontColor($r('app.color.color_666666_grey'))
                .width('96vp')
              Text(row.value)
                .fontSize('14vp')
                .fontColor($r('app.color.font_color_182431'))
                .layoutWeight(1)
                .textAlign(TextAlign.End)
                .maxLines(2)
                .textOverflow({ overflow: TextOverflow.Ellipsis })
                .id('detail_value_' + index.toString())
            }
            .width('100%')
            .padding({ left: '16vp', right: '16vp', top: '14vp', bottom: '14vp' })
            .backgroundColor($r('app.color.white_bg_color'))
          }
          .id('detail_row_' + index.toString())
        }, (row: DetailRow, index: number): string => row.label + '_' + index.toString())
      }
      .layoutWeight(1)
      .width('100%')
      .padding({ top: '8vp' })
    }
    .justifyContent(FlexAlign.Start)
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.index_background'))
  }
}
