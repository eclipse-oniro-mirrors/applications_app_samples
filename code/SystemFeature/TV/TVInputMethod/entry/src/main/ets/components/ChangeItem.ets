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

import { inputStyleConfig, KeyStyle } from '../common/StyleConfiguration';
import { getKey, keyInfo } from '../model/FocusInfo';
import { getString, lpx } from './KeyMenu';
import { EventUtil } from '../common/EventUtil';
import { emitter } from '@kit.BasicServicesKit';

// 中英文切换
@Component
export struct ChangeItem {
  @Link inputStyle: KeyStyle;
  private keyValue: string = '';
  @Link menuType: number;
  @State isChinese: boolean = AppStorage.get<boolean>('isChinese') ?? false;
  keyItem: keyInfo = {} as keyInfo;
  @State isFocus: boolean = false;

  @Styles
  buttonWidth() {
    .width(lpx(inputStyleConfig.BUTTON_WIDTH))
    .height(lpx(inputStyleConfig.BUTTON_HEIGHT))
    .backgroundColor(this.isFocus ? $r('app.color.key_item_focus') : $r('app.color.kip_button_BG'))
    .border({
      width: lpx(inputStyleConfig.BUTTON_BORDER_WIDTH),
      radius: lpx(inputStyleConfig.BUTTON_BORDER_RADIUS),
      color: $r('app.color.button_border')
    })
    .margin({ left: lpx(inputStyleConfig.BUTTON_MARGIN_LEFT) })
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
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
      Row() {
        if (this.menuType == 3) {
          Text(getString($r('app.string.ZN_CN')))
            .fontSize(lpx(inputStyleConfig.SELECT_SIZE))
            .fontColor('#ffffffff')
          Text('/' + getString($r('app.string.en')))
            .fontSize(lpx(inputStyleConfig.BUTTON_TEXT_SIZE))
            .fontColor('#ccffffff')
            .id(getKey(this.keyItem))
            .focusable(true)
            .onFocus(() => {
              AppStorage.setOrCreate('focusItem', getKey(this.keyItem));
              this.isFocus = true;
            })
            .onBlur(() => {
              this.isFocus = false;
            })
        } else {
          Text(getString($r('app.string.en')))
            .fontSize(lpx(inputStyleConfig.SELECT_SIZE))
            .fontColor('#ffffffff')
          Text('/' + getString($r('app.string.ZN_CN')))
            .fontSize(lpx(inputStyleConfig.BUTTON_TEXT_SIZE))
            .fontColor('#ccffffff')
            .id(getKey(this.keyItem))
            .focusable(true)
            .onFocus(() => {
              AppStorage.setOrCreate('focusItem', getKey(this.keyItem));
              this.isFocus = true;
            })
            .onBlur(() => {
              this.isFocus = false;
            })
        }
      }
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
    .borderRadius(6)
    .borderColor(Color.White)
    .borderWidth(1)
    .buttonWidth()
    .shadow({ radius: 1, color: '#76787c', offsetY: 3 })
  }
}
