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
import { keySourceListType } from '../model/KeyboardKeyData';
import { inputStyleConfig, KeyStyle } from '../common/StyleConfiguration';
import { InputHandler } from '../model/KeyboardController';
import { getKey, keyInfo } from '../model/FocusInfo';
import { lpx } from './KeyMenu';
import { EventUtil } from '../common/EventUtil';
import { emitter } from '@kit.BasicServicesKit';

//无大小写的按键组件
@Component
export struct keyItem {
  private keyValue: keySourceListType = {
    title: '',
    content: '',
    upperContent: ''
  }
  @Link inputStyle: KeyStyle;
  keyItem: keyInfo = {} as keyInfo;
  @State isFocus: boolean = false;
  @StorageProp('size4K') size4K: boolean = false;

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
  }

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
      if (this.keyValue.content == ' ') {
        Image($r('app.media.ic_space'))
          .width('50%')
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
        Text(this.keyValue.content)
          .fontSize(lpx(inputStyleConfig.BUTTON_TEXT_SIZE))
          .fontColor(Color.White)
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
    .backgroundColor(this.isFocus ? $r('app.color.key_item_focus') : $r('app.color.key_item_normal'))
    .buttonWidth()
  }
}
