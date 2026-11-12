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

//无大小写的灰色组件
@Component
export struct keyItemGray {
  @Prop keyValue: string = '';
  @Prop keyButton: boolean = false;
  @Link inputStyle: KeyStyle;
  @Link menuType: number;
  @State isChinese: boolean = AppStorage.get<boolean>('isChinese') ?? false;
  @State isNineKey: boolean = AppStorage.get<boolean>('isNineKey') ?? false;
  @State isNineKeyBack: boolean = AppStorage.get<boolean>('isNineKeyBack') ?? false;
  keyItem: keyInfo = {} as keyInfo;
  @State isFocus: boolean = false;
  marginValue: Padding = {
    left: lpx(inputStyleConfig.BUTTON_MARGIN_LEFT),
    bottom: lpx(inputStyleConfig.BUTTON_MARGIN_BUTTON)
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

  @Styles
  buttonWidth() {
    .width(lpx(inputStyleConfig.BUTTON_WIDTH))
    .height(lpx(inputStyleConfig.BUTTON_HEIGHT))
    .border({
      width: lpx(inputStyleConfig.BUTTON_BORDER_WIDTH),
      radius: lpx(inputStyleConfig.BUTTON_BORDER_RADIUS),
      color: $r('app.color.button_border')
    })
    .margin(!this.keyButton ? this.marginValue : { left: lpx(inputStyleConfig.BUTTON_MARGIN_LEFT), bottom: 0 })
  }

  checkBGColor(): ResourceStr {
    switch (this.keyValue) {
      case '~':
      case '€':
        return $r('app.color.key_item_normal');
    }
    return $r('app.color.kip_button_BG');
  }

  build() {
    Stack() {
      Text(this.keyValue)
        .fontSize(lpx(inputStyleConfig.BUTTON_TEXT_SIZE))
        .fontColor(Color.White)
        .focusable(true)
        .id(getKey(this.keyItem))
        .onFocus(() => {
          this.isFocus = true;
          AppStorage.setOrCreate('focusItem', getKey(this.keyItem));
        })
        .onBlur(() => {
          this.isFocus = false;
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
      EventUtil.keyEventEntry();
    })
    .backgroundColor(this.isFocus ? $r('app.color.key_item_focus') : this.checkBGColor())
    .buttonWidth()
  }
}
