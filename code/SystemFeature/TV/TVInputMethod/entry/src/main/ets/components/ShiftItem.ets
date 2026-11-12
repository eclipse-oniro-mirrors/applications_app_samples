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
import { KeyStyle, inputStyleConfig } from '../common/StyleConfiguration';
import { getKey, keyInfo } from '../model/FocusInfo';
import { KeyState } from '../model/KeyboardKeyData';
import { lpx } from './KeyMenu';
import { emitter } from '@kit.BasicServicesKit';

@Component
export struct ShiftItem {
  @State isShiftKeyFocus: boolean = false;
  @StorageLink('keyState') keyState: number = 0;
  @Link inputStyle: KeyStyle;
  keyItem: keyInfo = {} as keyInfo;

  @Styles
  buttonWidth() {
    .width(lpx(inputStyleConfig.BUTTON_WIDTH))
    .height(lpx(inputStyleConfig.BUTTON_HEIGHT))
    .backgroundColor(this.isShiftKeyFocus ? $r('app.color.key_item_focus') : $r('app.color.kip_button_BG'))
    .border({
      width: lpx(inputStyleConfig.BUTTON_BORDER_WIDTH),
      radius: lpx(inputStyleConfig.BUTTON_BORDER_RADIUS),
      color: $r('app.color.button_border')
    })
    .margin({ left: lpx(inputStyleConfig.BUTTON_MARGIN_LEFT), bottom: lpx(inputStyleConfig.BUTTON_MARGIN_BUTTON) })
  }

  aboutToAppear() {
    emitter.on('auto_focus', (data) => {
      let title: string = String(data?.data);
      if (this.getUniqueId().toString() == title) {
        return;
      }
      this.isShiftKeyFocus = false;
    })
  }

  build() {
    Column() {
      Stack() {
        Image($rawfile(this.keyState === KeyState.ONCE_UPPER_CASE ? 'shift light.svg' :
          this.keyState === KeyState.UPPER_CASE ? 'shift light long.svg' : 'shift.svg'))
          .height('80%')
          .fillColor(Color.White)
          .focusable(true)
          .id(getKey(this.keyItem))
          .onFocus(() => {
            this.isShiftKeyFocus = true;
            AppStorage.setOrCreate('focusItem', getKey(this.keyItem));
          })
          .onBlur(() => {
            this.isShiftKeyFocus = false;
          })
      }
      .onHover((isHover: boolean) => {
        this.isShiftKeyFocus = isHover;
        if (isHover) {
          EventUtil.onHoverDetail(getKey(this.keyItem), this.getUniqueId());
        }
      })
      .onClick(() => {
        this.getUIContext().getFocusController().requestFocus(getKey(this.keyItem));
        AppStorage.setOrCreate('focusItem', getKey(this.keyItem));
        EventUtil.keyEventEntry();
      })
      .width('100%')
      .height('100%')
    }
    .buttonWidth()
  }
}
