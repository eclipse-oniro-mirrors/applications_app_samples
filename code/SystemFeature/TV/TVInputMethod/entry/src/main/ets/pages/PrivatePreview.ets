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

import { inputMethod } from '@kit.IMEKit';
import Log from '../model/Log';
import { BusinessError } from '@kit.BasicServicesKit';
import { promptAction } from '@kit.ArkUI';
import { InputHandler } from '../model/KeyboardController';
import { ConstantNum } from '../common/StyleConfiguration';

const TAG: string = 'PrivatePreview->';

@Entry
@Component
struct PrivatePreview {
  @State preViewText: string = '';
  controllerPreview: TextInputController = new TextInputController();
  @State imList: inputMethod.InputMethodProperty[] = [];
  @State showImeChooseSheet: boolean = false;
  @StorageLink('currentIME') currentIME: string = '';
  @State isTouched: boolean = false;
  @State focusSwitch: boolean = false;

  aboutToAppear() {
    this.addLog(`private preview aboutToAppear begin!`);
    inputMethod.getSetting().getAllInputMethods().then(val => {
      this.imList = val;
      Log.showInfo(TAG, `kikaInput-val=1==: ${JSON.stringify(val)}`);

      inputMethod.switchInputMethod(val[0]).then(() => {
      })
        .catch((reason: BusinessError) => {
          promptAction.showToast({ message: reason.message });
        })

    });
    let nowIMEInfo: inputMethod.InputMethodProperty = inputMethod.getCurrentInputMethod();
    Log.showInfo(TAG, `kikaInput-nowIMEInfo===: ${JSON.stringify(nowIMEInfo)}`);
    if (nowIMEInfo) {
      Log.showInfo(TAG, `kikaInput-nowIMEInfo=1==: ${JSON.stringify(nowIMEInfo)}`);
    } else {
      Log.showInfo(TAG, `kikaInput-nowIMEInfo=2==: ${JSON.stringify(nowIMEInfo)}`);
    }
    // 获取输入法控制器
    let inputMethodController = inputMethod.getController();
    // 关闭输入法软键盘
    inputMethodController.stopInputSession();
  }

  onPageShow() {
    this.addLog(`private command onPageShow!`);
  }

  addLog(message: string): void {
    Log.showInfo(TAG, `kikaInput-new: ${message}`);
  }

  @Builder
  imeChooseSheet() {
    List({ space: ConstantNum.NUM_12 }) {
      ForEach(this.imList, (im: inputMethod.InputMethodProperty) => {
        ListItem() {
          Row({ space: ConstantNum.NUM_12 }) {
            Text(im.label ?? im.name)
            Radio({
              group: 'ime',
              value: im.id
            })
              .checked(this.currentIME == im.label || this.currentIME == im.name)
              .onChange(val => {
                if (val) {
                  inputMethod.switchInputMethod(im).then(() => {
                    this.currentIME = im.label ?? im.name;
                    this.showImeChooseSheet = false;
                  })
                    .catch((reason: BusinessError) => {
                      promptAction.showToast({ message: reason.message });
                    })
                }
              })
          }
          .height(ConstantNum.NUM_56)
          .borderRadius(ConstantNum.NUM_18)
          .width('100%')
          .padding(ConstantNum.NUM_12)
          .justifyContent(FlexAlign.SpaceBetween)
          .backgroundColor($r('app.color.start_window_background'))
        }
      })
    }
    .height(ConstantNum.NUM_500)
    .padding(ConstantNum.NUM_12)
  }

  build() {
    Column() {

      Navigation()
        .title($r('app.string.chinese_input_method'))
        .hideToolBar(true)
        .align(Alignment.Start)
        .width('100%')
        .height('56vp')
        .hideBackButton(true)
        .titleMode(NavigationTitleMode.Mini)

      Column({ space: ConstantNum.NUM_12 }) {
        Text($r('app.string.input_method_manage'))
          .width('100%')
          .height(ConstantNum.NUM_56)
          .fontFamily('HarmonyHeiTi-Medium')
          .fontSize('16fp')
          .fontColor('#182431')
          .lineHeight(ConstantNum.NUM_22)
          .fontWeight(ConstantNum.NUM_500)

        Flex({ justifyContent: FlexAlign.SpaceBetween, alignItems: ItemAlign.Center }) {
          Row() {
            Text($r('app.string.default_input_method'))
              .fontSize(ConstantNum.NUM_16)
              .lineHeight(ConstantNum.NUM_22)
              .fontWeight(FontWeight.Medium)
              .margin({ left: ConstantNum.NUM_8 })
              .textAlign(TextAlign.Start);
          }

          Row() {
            Text(this.currentIME)
              .fontSize(ConstantNum.NUM_14)
              .lineHeight(ConstantNum.NUM_19)
              .fontWeight(FontWeight.Regular)
              .fontColor($r('sys.color.ohos_id_color_text_secondary'))
              .margin({ right: ConstantNum.NUM_4 })
              .textAlign(TextAlign.End);
            Image($r('app.media.ic_arrow_right'))
              .width(ConstantNum.NUM_12)
              .height(ConstantNum.NUM_24)
              .margin({ right: ConstantNum.NUM_8 })
              .fillColor($r('sys.color.ohos_id_color_primary'))
              .opacity(ConstantNum.NUM_2)
          }
        }
        // .height(ComponentConfig.WH_100_100)
        .width('100%')
        .borderRadius(ConstantNum.NUM_18)
        .backgroundColor(this.isTouched ? '#43777777' : $r('app.color.start_window_background'))
        .onClick(() => {
          this.showImeChooseSheet = true;
        })
        .bindSheet(this.showImeChooseSheet, this.imeChooseSheet, {
          onDisappear: () => this.showImeChooseSheet = false,
          dragBar: false,
          showClose: $r('app.media.ic_public_close'),
          title: {
            title: $r('app.string.select_input_method')
          }
        });
      }
      .margin({ bottom: ConstantNum.NUM_48 })

      Text($r('app.string.input_test'))
        .width('100%')
        .height(ConstantNum.NUM_56)
        .fontFamily('HarmonyHeiTi-Medium')
        .fontSize('16fp')
        .fontColor('#182431')
        .lineHeight(ConstantNum.NUM_22)
        .fontWeight(ConstantNum.NUM_500)

      TextInput({
        text: this.preViewText,
        placeholder: $r('app.string.input_text_hint'),
        controller: this.controllerPreview
      })
        .placeholderFont({ size: ConstantNum.NUM_16, weight: ConstantNum.NUM_400 })
        .width('100%')
        .height(ConstantNum.NUM_56)
        .margin(ConstantNum.NUM_10)
        .fontColor($r('app.color.text_normal'))
        .backgroundColor($r('app.color.start_window_background'))
        .border({ width: 1, color: Color.Gray, radius: ConstantNum.NUM_18 })
        .maxLength(ConstantNum.NUM_50)
        .onChange((value: string) => {
          this.addLog('preViewText onChange.');
        })
        .onSubmit(() => {
          this.addLog('preViewText onSubmit.');
        })
    }
    .width('100%')

  }
}
