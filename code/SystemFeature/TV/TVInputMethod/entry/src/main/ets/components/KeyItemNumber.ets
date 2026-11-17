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
import { ConstantNum, inputStyleConfig, KeyStyle } from '../common/StyleConfiguration';
import { getKey, keyInfo } from '../model/FocusInfo';
import { lpx } from './KeyMenu';
import { EventUtil } from '../common/EventUtil';
import { emitter } from '@kit.BasicServicesKit';

const TAG = 'keyItemNumber aboutToAppear';

@Extend(Text)
function keyWord1() {
  .fontFamily('sans-serif')
  .fontSize(lpx(inputStyleConfig.BUTTON_TEXT_SIZE))
  .lineHeight(lpx(ConstantNum.NUM_24))
  .fontColor($r('app.color.button_white'))
  .fontWeight(FontWeight.Regular)
  .width('100%')
  .height('100%')
  .textAlign(TextAlign.Center)
}

@Extend(Text)
function keyWord2() {
  .fontFamily('sans-serif')
  .fontSize(lpx(inputStyleConfig.BUTTON_TEXT_SIZE))
  .lineHeight(lpx(ConstantNum.NUM_24))
  .fontColor($r('app.color.button_white'))
  .fontWeight(FontWeight.Regular)
  .width('12vp')
  .height('12vp')
  .textAlign(TextAlign.Center)
}

@Extend(Text)
function keyWord3() {
  .fontFamily('sans-serif')
  .fontSize(lpx(inputStyleConfig.BUTTON_TEXT_SIZE)) // .fontSize(this.inputStyle.en_fontSize)
  .fontColor(Color.White)
  .fontWeight(FontWeight.Regular)
}

//有大小写的按键组件
@Component
export struct keyItemNumber {
  private keyValue: keySourceListType = {
    title: '',
    content: '',
    upperContent: ''
  }
  @Link upper: number;
  @Link inputStyle: KeyStyle;
  @State isChinese: boolean = AppStorage.get<boolean>('isChinese') ?? false;
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
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
      if (this.inputStyle.deviceType == 'phone_landSpace') {
        Stack({ alignContent: Alignment.TopEnd }) {
          Text(this.isChinese ? this.keyValue.upperContent :
            this.upper === 0 ? this.keyValue.content : this.keyValue.upperContent)
            .keyWord1()
          Text(this.keyValue.title)
            .keyWord2()
            .margin({ top: 1, right: 1 })
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
        .width('100%')
        .height('100%')
      } else {
        Text(this.isChinese ? this.keyValue.upperContent :
          this.upper === 0 ? this.keyValue.content : this.keyValue.upperContent)
          .keyWord3()
          .focusable(true)
          .id(getKey(this.keyItem))
          .onBlur(() => {
            this.isFocus = false;
          })
          .onFocus(() => {
            this.isFocus = true;
            AppStorage.setOrCreate('focusItem', getKey(this.keyItem));
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
    .buttonWidth()
  }

  @Styles
  buttonWidth() {
    .width(lpx(inputStyleConfig.BUTTON_WIDTH))
    .height(lpx(inputStyleConfig.BUTTON_HEIGHT))
    .backgroundColor(this.isFocus ? $r('app.color.key_item_focus') : $r('app.color.key_item_normal'))
    .border({
      width: lpx(inputStyleConfig.BUTTON_BORDER_WIDTH),
      radius: lpx(inputStyleConfig.BUTTON_BORDER_RADIUS),
      color: $r('app.color.button_border')
    })
    .margin({ left: lpx(inputStyleConfig.BUTTON_MARGIN_LEFT) })
  }
}
