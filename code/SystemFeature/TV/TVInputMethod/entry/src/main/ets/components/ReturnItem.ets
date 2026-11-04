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
import { inputStyleConfig, KeyStyle } from '../common/StyleConfiguration';
import { getKey, keyInfo } from '../model/FocusInfo';
import { lpx } from './KeyMenu';
import { emitter } from '@kit.BasicServicesKit';

//返回组件
@Component
export struct ReturnItem {
  @Link inputStyle: KeyStyle;
  keyItem: keyInfo = {} as keyInfo;
  @State isFocus: boolean = false;
  @StorageProp('4kSize') is4k: boolean = false;

  @Styles
  buttonWidth() {
    .width(lpx(inputStyleConfig.BUTTON_WIDTH))
    .height(lpx(inputStyleConfig.BUTTON_HEIGHT * 2 + 10))
    .backgroundColor(this.isFocus ? $r('app.color.key_item_focus') : $r('app.color.kip_button_BG'))
    .border({
      width: lpx(inputStyleConfig.BUTTON_BORDER_WIDTH),
      radius: lpx(inputStyleConfig.BUTTON_BORDER_RADIUS),
      color: $r('app.color.button_border')
    })
    .margin({ left: lpx(inputStyleConfig.BUTTON_MARGIN_LEFT), right: lpx(inputStyleConfig.BUTTON_MARGIN_LEFT) })
  }

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
    Stack() {
      Column() {
        Text($r('app.string.string_text_Complete'))
          .fontSize(lpx(inputStyleConfig.DELETE_TEXT_SIZE))
          .fontColor($r('app.color.button_white'))
          .id(getKey(this.keyItem))
          .textAlign(TextAlign.Center)
          .focusable(true)
          .onFocus(() => {
            AppStorage.setOrCreate('focusItem', getKey(this.keyItem));
            this.isFocus = true;
          })
          .onBlur(() => {
            this.isFocus = false;
          })
      }
      .width(this.inputStyle.returnPicSize)
      .height(this.inputStyle.returnPicSize)
      .justifyContent(FlexAlign.Center)
      .alignItems(HorizontalAlign.Center)
      .margin({ bottom: this.is4k ? lpx(18) : 0 })
    }
    .focusable(true)
    .buttonWidth()
    .onAppear(() => {
      try {
        this.getUIContext().getFocusController().requestFocus(`${this.keyItem.panel}_${2}_${11}`);
        AppStorage.setOrCreate('UIContext', this.getUIContext());
      } catch (e) {
        console.log('HmLog--> requestFocus error.', e);
      }
    })
    .onHover((isHover: boolean) => {
      this.isFocus = isHover;
      if (isHover) {
        EventUtil.onHoverDetail(getKey(this.keyItem), this.getUniqueId());
      }
    })
    .onClick(() => {
      this.getUIContext().getFocusController().requestFocus(getKey(this.keyItem));
      AppStorage.setOrCreate('focusItem', getKey(this.keyItem));
      EventUtil.keyEventEntry();
    })
  }
}
