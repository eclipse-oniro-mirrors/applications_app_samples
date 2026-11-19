'use static'
/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF InputStyle KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import {
  Entry,
  StorageLink,
  Watch,
  Component,
  Column,
  Stack,
  Color,
  FlexAlign,
  AppStorage
} from '@kit.ArkUI';
import { deviceInfo } from '@kit.BasicServicesKit';
import Log from '../../model/Log';
import { InputHandler } from '../model/KeyboardController';
import { KeyMenu } from '../../components/KeyMenu';
import { StyleConfiguration, KeyStyle } from '../../common/StyleConfiguration';
import { TopMenu } from '../../components/TopMenu';
import { inputMethodEngine } from '@kit.IMEKit';


const DEVICE_TYPE: string = deviceInfo.deviceType;
const TAG: string = 'index->';

@Entry
@Component
struct Index {
  @StorageLink('isLandscape') @Watch('change') isLandscape: boolean = false;
  @StorageLink('isRkDevice') isRkDevice: boolean = false;
  @StorageLink('inputStyle') inputStyle: KeyStyle =
    StyleConfiguration.getInputStyle(this.isLandscape, this.isRkDevice, DEVICE_TYPE);
  @StorageLink('isSplitKeyboard') isSplitKeyboard: boolean = false;

  onBackPress(): boolean {
    Log.showInfo(TAG, 'kikaInput onBackPress');
    InputHandler.getInstance().hideKeyboardSelf();
    return true;
  }

  change(value: string): void {
    AppStorage.setOrCreate('inputStyle', StyleConfiguration.getInputStyle(this.isLandscape, this.isRkDevice, DEVICE_TYPE));
  }

  build(): void {
    Stack() {
      Column() {
        TopMenu()
        Column() {
          KeyMenu()
        }
        .width('100%')
        .layoutWeight(1)
        .justifyContent(FlexAlign.Center)
        .backgroundColor(this.isSplitKeyboard ? Color.Transparent : '#D5D8DD')
      }
      .height('100%')
    }
    .id('keyboardRoot')
    .height('100%')
    .backgroundColor(this.isSplitKeyboard ? Color.Transparent : Color.White)
  }
}