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
import { InputHandler } from '../model/KeyboardController';
import Log from '../model/Log';

const TAG = 'DownMenu';

//下拉按钮
@Component
export struct DownMenu {
  @Link inputStyle: KeyStyle;
  @StorageLink('promptText') promptText: string = ''; // 搜索关键字 在各个字母点击事件内调用接口

  build() {
    Flex({ justifyContent: FlexAlign.End, alignItems: ItemAlign.Center }) {
      Stack() {

        Image($rawfile('down.svg'))
          .width(this.inputStyle.downMenuPicWidth)
          .height(this.inputStyle.downMenuPicHeight)
          .margin({ right: ConstantNum.NUM_20 })
      }
      .height(ConstantNum.NUM_40)
      .width(ConstantNum.NUM_60)
      .onClick(() => {
        Log.showInfo(TAG, `DownMenu-new: ${'Action'}`);
        InputHandler.getInstance().hideKeyboardSelf();
      })


      .borderRadius(ConstantNum.NUM_4)
      .height('100%')
    }
    .width('100%')
    .height(this.inputStyle.downMenuHeight)
    .padding(1)
    .backgroundColor($r('app.color.normal_BG'))
    .borderColor($r('app.color.shadow'))
    .borderWidth(ConstantNum.NUM_0_5)
  }
}
