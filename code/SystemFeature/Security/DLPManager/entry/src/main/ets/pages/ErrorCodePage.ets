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
import { ErrorInfo } from '../core/ErrorCodeCore';
import { ErrorCenterModel, categoryLabel } from '../feature/ErrorCenterModel';

@Entry
@Component
struct ErrorCodePage {
  @State entries: ErrorInfo[] = [];
  @State keyword: string = '';
  @State catKey: string = 'all';

  aboutToAppear(): void {
    this.applyFilter();
  }

  private applyFilter(): void {
    this.entries = ErrorCenterModel.filter(this.keyword, this.catKey);
  }

  build() {
    Column() {
      Row() {
        Image($r('app.media.ic_public_back'))
          .width('24vp')
          .height('24vp')
          .margin({ right: '12vp' })
          .id('error_back')
          .onClick(() => {
            router.back();
          })
        Text('错误码中心')
          .fontSize('20vp')
          .fontWeight(700)
          .fontColor($r('app.color.font_color_182431'))
          .layoutWeight(1)
          .id('error_title')
        Text(this.entries.length.toString() + ' 条')
          .fontSize('12vp')
          .fontColor($r('app.color.color_666666_grey'))
          .id('error_count')
      }
      .width('100%')
      .padding({ left: '16vp', right: '16vp', top: '12vp', bottom: '12vp' })
      .backgroundColor($r('app.color.white_bg_color'))

      TextInput({ placeholder: '输入错误码或关键字' })
        .height('36vp')
        .fontSize('14vp')
        .backgroundColor($r('app.color.input_background'))
        .borderRadius('8vp')
        .margin({ left: '16vp', right: '16vp', top: '8vp' })
        .id('error_search_input')
        .onChange((value: string) => {
          this.keyword = value;
          this.applyFilter();
        })

      Scroll() {
        Row() {
          this.CatChip('全部', 'all', 'cat_all')
          this.CatChip('文件不存在', 'file_not_found', 'cat_file')
          this.CatChip('权限不足', 'permission_denied', 'cat_permission')
          this.CatChip('DLP 策略', 'dlp_policy', 'cat_dlp')
          this.CatChip('存储空间', 'storage_full', 'cat_storage')
        }
        .padding({ left: '16vp', right: '16vp' })
      }
      .scrollable(ScrollDirection.Horizontal)
      .scrollBar(BarState.Off)
      .width('100%')
      .padding({ top: '10vp', bottom: '6vp' })

      if (this.entries.length === 0) {
        Column() {
          Text('没有匹配的错误码')
            .fontSize('16vp')
            .fontColor($r('app.color.color_999999_grey'))
            .id('error_empty')
        }
        .layoutWeight(1)
        .width('100%')
        .justifyContent(FlexAlign.Center)
      } else {
        List({ space: '8vp' }) {
          ForEach(this.entries, (info: ErrorInfo, index: number) => {
            ListItem() {
              Column() {
                Row() {
                  Text(ErrorCenterModel.formattedCode(info))
                    .fontSize('14vp')
                    .fontColor($r('app.color.main_blue'))
                    .width('120vp')
                    .id('error_code_' + index.toString())
                  Text(info.message)
                    .fontSize('14vp')
                    .fontColor($r('app.color.font_color_182431'))
                    .layoutWeight(1)
                  Text(ErrorCenterModel.retryableLabel(info))
                    .fontSize('12vp')
                    .fontColor(info.retryable ? $r('app.color.main_blue') : $r('app.color.color_999999_grey'))
                }
                .width('100%')
                Row() {
                  Text(categoryLabel(info.category))
                    .fontSize('12vp')
                    .fontColor($r('app.color.color_666666_grey'))
                    .width('120vp')
                  Text(info.hint)
                    .fontSize('12vp')
                    .fontColor($r('app.color.color_666666_grey'))
                    .layoutWeight(1)
                    .maxLines(2)
                    .textOverflow({ overflow: TextOverflow.Ellipsis })
                }
                .width('100%')
                .margin({ top: '6vp' })
              }
              .width('100%')
              .padding({ left: '16vp', right: '16vp', top: '12vp', bottom: '12vp' })
              .backgroundColor($r('app.color.white_bg_color'))
              .borderRadius('12vp')
            }
            .id('error_item_' + index.toString())
          }, (info: ErrorInfo): string => info.code.toString())
        }
        .layoutWeight(1)
        .width('100%')
        .padding({ left: '12vp', right: '12vp', bottom: '8vp' })
      }
    }
    .justifyContent(FlexAlign.Start)
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.index_background'))
  }

  @Builder
  CatChip(label: string, key: string, itemId: string) {
    Text(label)
      .fontSize('14vp')
      .fontColor(this.catKey === key ? '#FFFFFF' : $r('app.color.font_color_182431'))
      .backgroundColor(this.catKey === key ? $r('app.color.main_blue') : $r('app.color.color_button_grey'))
      .padding({ left: '12vp', right: '12vp', top: '6vp', bottom: '6vp' })
      .borderRadius('14vp')
      .margin({ right: '8vp' })
      .id(itemId)
      .onClick(() => {
        this.catKey = key;
        this.applyFilter();
      })
  }
}
