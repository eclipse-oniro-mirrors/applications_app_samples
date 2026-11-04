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
import { ConstantNum, inputStyleConfig, KeyStyle } from '../common/StyleConfiguration';
import { getKey, keyInfo } from '../model/FocusInfo';
import { lpx } from './KeyMenu';
import { emitter } from '@kit.BasicServicesKit';

//空格组件
@Component
export struct SpaceItem {
  @Link inputStyle: KeyStyle;
  keyItem: keyInfo = {} as keyInfo;
  @State isFocus: boolean = false;
  @StorageProp('4kSize') is4k: boolean = false;

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
      Text()
        .fontSize(lpx(inputStyleConfig.BUTTON_TEXT_SIZE))
        .fontColor(Color.White)
        .id(getKey(this.keyItem))
        .focusable(true)
        .onFocus(() => {
          this.isFocus = true;
          AppStorage.setOrCreate('focusItem', getKey(this.keyItem));
        })
        .onBlur(() => {
          this.isFocus = false;
        })
      Image($r('app.media.ic_space')).height('16lpx').align(Alignment.Center).margin({ top: '4lpx' })
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
    .width(lpx(inputStyleConfig.BUTTON_WIDTH * ConstantNum.NUM_2 +
      (this.is4k ? ConstantNum.NUM_30 : ConstantNum.NUM_16)))
    .buttonWidth()
    .height(lpx(inputStyleConfig.BUTTON_HEIGHT))
  }

  @Styles
  buttonWidth() {
    .backgroundColor(this.isFocus ? $r('app.color.key_item_focus') : $r('app.color.key_item_normal'))
    .border({
      width: lpx(inputStyleConfig.BUTTON_BORDER_WIDTH),
      radius: lpx(inputStyleConfig.BUTTON_BORDER_RADIUS),
      color: $r('app.color.button_border')
    })
    .margin({ left: lpx(inputStyleConfig.BUTTON_MARGIN_LEFT) })
  }
}
