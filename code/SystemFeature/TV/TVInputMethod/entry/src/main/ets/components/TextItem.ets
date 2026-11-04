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

import { EventUtil } from '../common/EventUtil';
import { ConstantNum, KeyStyle } from '../common/StyleConfiguration';
import { getKey, keyInfo } from '../model/FocusInfo';
import { emitter } from '@kit.BasicServicesKit';

@Component
export struct TextItem {
  @State item: string = '';
  @Link inputStyle: KeyStyle;
  keyItem: keyInfo = {} as keyInfo;
  @State isFocus: boolean = false;

  aboutToAppear() {
    emitter.on('auto_focus', (data) => {
      let title: string = String(data?.data);
      if (this.getUniqueId().toString() == title) {
        return;
      }
      this.isFocus = false;
    })
  }

  build() {
    Column({ space: 1 }) {
      Text(this.item)
        .fontSize(this.inputStyle.switchNumberFontSize)
        .fontColor($r('app.color.normal_BG'))
        .fontWeight(FontWeight.Regular)
        .textAlign(TextAlign.Center)
        .focusable(true)
        .id(getKey(this.keyItem))
        .onFocus(() => {
          this.isFocus = true;
          AppStorage.setOrCreate('focusItem', getKey(this.keyItem));
          AppStorage.setOrCreate('TextItem', this.item);
        })
        .onBlur(() => {
          this.isFocus = false;
        })
        .borderWidth(this.isFocus ? 1 : 0)
        .padding({
          top: ConstantNum.NUM_10,
          bottom: ConstantNum.NUM_5,
          left: ConstantNum.NUM_5,
          right: ConstantNum.NUM_5
        })
        .backgroundColor(this.isFocus ? $r('app.color.key_item_focus') : '#00000000')
        .onVisibleAreaChange([0.0, 1.0], (isVisible: boolean, currentRatio: number) => {
          if (isVisible && currentRatio >= 0.7) {
            AppStorage.setOrCreate('TextItem_' + `${this.keyItem.index}`, true);
            console.info('TextItem_' + `${this.keyItem.index}` + true);
          }

          if (!isVisible && currentRatio <= 0.3) {
            AppStorage.setOrCreate('TextItem_' + `${this.keyItem.index}`, false);
            console.info('TextItem_' + `${this.keyItem.index}` + false);
          }
        })
        .onAppear(() => {
          AppStorage.setOrCreate('TextItem_' + `${this.keyItem.index}`, true);
        })
        .onDisAppear(() => {
          AppStorage.setOrCreate('TextItem_' + `${this.keyItem.index}`, false);
        })
    }
    .onHover((isHover: boolean) => {
      this.isFocus = isHover;
      if (isHover) {
        EventUtil.onHoverDetail(getKey(this.keyItem), this.getUniqueId());
      }
    })
    .onClick(() => {
      this.getUIContext().getFocusController().requestFocus(getKey(this.keyItem));
      AppStorage.setOrCreate('focusItem', getKey(this.keyItem));
      AppStorage.setOrCreate('TextItem', this.item);
      EventUtil.keyEventEntry();
    })
    .alignItems(HorizontalAlign.Center)
  }
}
