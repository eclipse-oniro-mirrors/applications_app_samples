/**
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

import { KeyStyle, ConstantNum } from '../common/StyleConfiguration';
import { InputHandler } from '../model/KeyboardController';
import { TextItem } from './TextItem';
import { emitter } from '@kit.BasicServicesKit';
import { lpx } from './KeyMenu';

const ROW_GAP = 57;
const SELECT_TEXT = 74;

const SELECT_RIGHT = 20;

// 文字选择键盘
@Component
export struct SelectText {
  @Link inputStyle: KeyStyle;
  @StorageLink('pinyin') @Watch('resetLength') pinyin: string = '';
  @StorageLink('isMoreText') isMoreText: boolean = false;
  @StorageLink('isKeySet') isKeySet: boolean = false;
  @State isChinese: boolean = AppStorage.get<boolean>('isChinese') ?? false;
  private scroller: Scroller = new Scroller();

  resetLength() {
    AppStorage.delete('SelectTextLength');
  }

  aboutToAppear(): void {
    let innerEvent: emitter.InnerEvent = {
      eventId: 120,
    };
    emitter.on(innerEvent, (eventData: emitter.EventData) => {
      if (eventData.data) {
        let index: number = eventData.data['index'];
        this.scroller.scrollToIndex(index);
      }
    });
  }

  aboutToDisappear(): void {
    emitter.off('SelectTextTo');
  }

  build() {
    Column() {
      if (this.pinyin.length <= 0) {
        Row() {
          Stack() {
            Image($r('app.media.ic_keyboard'))
              .width(this.inputStyle.returnPicSize)
              .height(this.inputStyle.returnPicSize)
              .visibility(Visibility.Hidden)
              .onClick(() => {
                AppStorage.setOrCreate('isKeySet', true);
              })
          }
          .width(this.inputStyle.downMenuWidth)
          .borderRadius(ConstantNum.NUM_4)
          .height('100%')

          Blank()
        }
        .width('100%')
        .height(this.inputStyle.downMenuHeight)
        .padding(1)
        .backgroundColor($r('app.color.color_select_BG'))
        .borderColor('#76787c')
        .borderWidth(ConstantNum.NUM_0_5)
      } else {
        Flex({
          direction: FlexDirection.Row,
          justifyContent: FlexAlign.Center,
          alignItems: ItemAlign.Center
        }) {
          Row() {
            Image($r('app.media.ic_arrow_left'))
              .height(lpx(ConstantNum.NUM_20))
              .margin({ right: ConstantNum.NUM_20 })
            Grid(this.scroller) {
              LazyForEach(InputHandler.getInstance().getDataSource(), (item: string, index: number) => {
                GridItem() {
                  Column() {
                    TextItem({
                      item: item,
                      inputStyle: $inputStyle,
                      keyItem: { index: index, col: 0, panel: 'ChineseMenu' }
                    })
                  }
                  .justifyContent(FlexAlign.Center)
                }
              }, (item: string, index: number) => item + `${index}`)
            }
            .height('100%')
            .cachedCount(ConstantNum.NUM_5)
            .padding({ left: ConstantNum.NUM_10, right: ConstantNum.NUM_10 })
            .columnsGap(lpx(ROW_GAP))
            .rowsTemplate('1fr')
            .onScrollIndex((_) => {

            })
            .width('85%')
            .scrollBar(BarState.Off)
            .margin({ right: lpx(SELECT_RIGHT) })

            Image($r('app.media.ic_arrow_right'))
              .height(lpx(ConstantNum.NUM_20))
              .margin({ left: ConstantNum.NUM_20 })
          }

        }
        .width('100%')
      }
    }
    .height(lpx(SELECT_TEXT))
    .justifyContent(FlexAlign.Center)
    .width('100%')
    .backgroundColor($r('app.color.color_select_BG'))
    .borderColor($r('app.color.color_border'))
    .borderWidth(ConstantNum.NUM_0_5)
  }
}
