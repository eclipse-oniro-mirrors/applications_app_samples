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

import {
  keySourceListData,
  numberSourceListData,
  symbolSourceListData,
  keySourceListType,
  sourceListType,
  keyNineChinaType,
  keyNineChinaData,
  chineseSourceListData,
  MenuType,
  numberSourceListDataVice,
  SymbolKey
} from '../model/KeyboardKeyData';
import { SelectText } from '../components/SelectText';
import { keyMenu, lpx } from '../components/KeyMenu';
import { NumberMenu } from '../components/NumberMenu';
import { SymbolMenu } from '../components/SymbolMenu';
import { ChineseKeyMenu } from '../components/ChineseKeyMenu';
import { NineChinaKeyMenu } from '../components/NineChinaKeyMenu';
import { PinYinView } from '../components/PinYinView';
import { KeySetView } from '../components/KeySetView';

import { deviceInfo, BusinessError } from '@kit.BasicServicesKit';
import { common } from '@kit.AbilityKit';
import { InputHandler, keyboardController } from '../model/KeyboardController';
import { KeyStyle, StyleConfiguration, ConstantNum, inputStyleConfig } from '../common/StyleConfiguration';
import { EventUtil } from '../common/EventUtil';

let deviceType = deviceInfo.deviceType;
let TAG: string = 'index->';
const HEIGHT_INPUT = 377;

export function getString(res: Resource): string {
  return getContext().resourceManager.getStringSync(res.id);
}

getRawFd();

@Entry
@Component
export struct Index {
  private ninekeyList: keyNineChinaType[] = keyNineChinaData;
  private chineseKeyList: keySourceListType[] = chineseSourceListData;
  private keyList: keySourceListType[] = keySourceListData;
  private numberList: sourceListType[] = numberSourceListData;
  private symbolList: sourceListType[] = symbolSourceListData;
  @StorageLink('menuType') @Watch('updateMenuType') menuType: number = 0;
  @StorageLink('pinyin') pinyin: string = '';
  @StorageLink('isMoreText') isMoreText: boolean = false;
  @StorageLink('isChinese') isChinese: boolean = false;
  @StorageLink('isNineKey') isNineKey: boolean = false;
  @StorageLink('isKeySet') isKeySet: boolean = false;
  @State switchScreen: boolean = false;
  @StorageLink('isLandscape') @Watch('change') isLandscape: boolean = false;
  @StorageLink('isRkDevice') isRkDevice: boolean = false;
  @StorageLink('inputStyle') inputStyle: KeyStyle =
    StyleConfiguration.getInputStyle(this.isLandscape, this.isRkDevice, deviceType);
  // 在已有@StorageLink声明后添加
  @StorageLink('preViewText') preViewText: string = '';
  @StorageProp('4kSize') is4k: boolean = false;

  updateMenuType() {
    if (this.menuType === 0 || this.menuType === 1 || this.menuType === ConstantNum.NUM_2) {
      InputHandler.getInstance().resetPinyin();
    }
  }

  change() {
    AppStorage.set('inputStyle', StyleConfiguration.getInputStyle(this.isLandscape, this.isRkDevice, deviceType));
  }

  build() {
    Stack() {
      Column() {
        // 拼音显示区域
        PinYinView({ inputStyle: $inputStyle })
        // 根据菜单类型显示候选词栏或下拉菜单
        // 选词栏
        SelectText({ inputStyle: $inputStyle })
        if (this.isKeySet === true) {
          // 键盘主体区域
          KeySetView({ inputStyle: $inputStyle })
        } else if (!this.isMoreText || this.pinyin.length <= 0) {
          Column() {
            if (this.menuType === 0) {
              keyMenu({ keyList: this.keyList, menuType: $menuType, inputStyle: $inputStyle });
            } else if (this.menuType === 1) {
              NumberMenu({
                numberList: this.numberList,
                numberViceList: numberSourceListDataVice,
                menuType: $menuType,
                inputStyle: $inputStyle
              })
            } else if (this.menuType === ConstantNum.NUM_2) {
              SymbolMenu({ symbolList: this.symbolList, menuType: $menuType, inputStyle: $inputStyle })
            } else {
              if (this.isNineKey == true) {
                NineChinaKeyMenu({
                  keyList: this.ninekeyList,
                  switchScreen: $switchScreen,
                  menuType: $menuType,
                  inputStyle: $inputStyle
                })
              } else {
                ChineseKeyMenu({
                  keyList: this.chineseKeyList, menuType: $menuType,
                  inputStyle: $inputStyle
                })
              }
            }
          }.width('100%')
          .height(this.is4k ? lpx(520) : lpx(303))
          .backgroundColor($r('app.color.BG_Key'))
        }
        Row().height(lpx(20))
      }
      .width('100%')
      .height(lpx(HEIGHT_INPUT))
      .alignItems(HorizontalAlign.Center)
      .padding({ bottom: lpx(32) })
    }
    .alignContent(Alignment.Center)
    .alignSelf(ItemAlign.Center)
    .onTouch((event) => {
      EventUtil.isTouchEvent(event);
    })

  }
}

function getRawFd() {
  try {
    InputHandler.getInstance().addLog('getRawFd');
    let context = getContext() as common.UIAbilityContext;
    context.resourceManager.getRawFd('dict_pinyin.dat').then(value => {
      InputHandler.getInstance().initPinyin(value, context.filesDir);
    }).catch((error: BusinessError) => {
    });
  } catch (error) {
  }
}
