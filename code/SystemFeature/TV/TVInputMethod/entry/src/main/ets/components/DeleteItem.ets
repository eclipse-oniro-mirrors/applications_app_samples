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

//删除组件
@Component
export struct DeleteItem {
  @Link inputStyle: KeyStyle;
  @StorageLink('pinyin') pinyin: string = '';
  @StorageLink('isChinese') isChinese: boolean = false;
  @State isNineKey: boolean = AppStorage.get<boolean>('isNineKey') ?? false;
  keyItem: keyInfo = {} as keyInfo;
  @State isDelKeyFocus: boolean = false;

  aboutToAppear() {
    emitter.on('auto_focus', (data) => {
      let title: string = String(data?.data);
      if (this.getUniqueId().toString() == title) {
        return;
      }
      this.isDelKeyFocus = false;
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
    .margin({
      bottom: lpx(inputStyleConfig.BUTTON_MARGIN_BUTTON),
      left: lpx(inputStyleConfig.BUTTON_MARGIN_LEFT),
      right: lpx(inputStyleConfig.BUTTON_MARGIN_LEFT)
    })
  }

  build() {
    Stack() {
      Column() {
        Text($r('app.string.string_text_DeleteX'))
          .fontColor($r('app.color.button_white'))
          .fontFamily('sans-serif')
          .fontSize(lpx(inputStyleConfig.DELETE_TEXT_SIZE))
          .id(getKey(this.keyItem))
          .focusable(true)
          .onFocus(() => {
            this.isDelKeyFocus = true;
            AppStorage.setOrCreate('focusItem', getKey(this.keyItem));
          })
          .onBlur(() => {
            this.isDelKeyFocus = false;
          })
      }
      .width(this.inputStyle.featurePicSize)
      .height(this.inputStyle.featurePicSize)
      .justifyContent(FlexAlign.Center)
      .alignItems(HorizontalAlign.Center)

    }
    .onHover((isHover: boolean) => {
      this.isDelKeyFocus = isHover;
      if (isHover) {
        EventUtil.onHoverDetail(getKey(this.keyItem), this.getUniqueId());
      }
    })
    .onClick(() => {
      this.getUIContext().getFocusController().requestFocus(getKey(this.keyItem));
      AppStorage.setOrCreate('focusItem', getKey(this.keyItem));
      EventUtil.keyEventEntry();
    })
    .backgroundColor(this.isDelKeyFocus ? $r('app.color.key_item_focus') : $r('app.color.kip_button_BG'))
    .buttonWidth()
  }
}
