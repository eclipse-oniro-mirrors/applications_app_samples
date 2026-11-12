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

import { ConstantNum, KeyStyle } from '../common/StyleConfiguration';

@Component
export struct PinYinView {
  @Link inputStyle: KeyStyle;
  @StorageLink('pinyin') pinyin: string = '';
  @StorageProp('size4K') size4K: boolean = false;

  build() {
    Row() {
      if (this.pinyin.length > 0) {
        Stack() {
          Row() {
            Text(this.pinyin)
              .fontColor($r('app.color.normalStyles_BG'))
              .padding({ left: ConstantNum.NUM_12, right: ConstantNum.NUM_12 })
              .textAlign(TextAlign.Center)
          }
          .height('100%')
          .alignItems(VerticalAlign.Center)
        }
        .height('100%')
        .borderRadius({ topLeft: ConstantNum.NUM_4, topRight: ConstantNum.NUM_4 })
        .backgroundColor($r('app.color.pinyin_BG'))
        .borderColor($r('app.color.color_border'))
        .borderWidth(0.5)
      } else {
        Stack() {
          Row() {
            Text('')
              .textAlign(TextAlign.Center)
          }
          .height('100%')
          .alignItems(VerticalAlign.Center)
        }
      }
    }.backgroundColor($r('app.color.pinyin_BG'))
    .height(this.inputStyle.pinyinBarHeight)
  }
}
