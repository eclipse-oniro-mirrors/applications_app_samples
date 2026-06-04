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
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import {
  $r,
  Column,
  Component,
  CopyOptions,
  EditMenuOptions,
  Entry,
  NavDestination,
  Text,
  TextMenuItem,
  TextMenuItemId,
  TextRange,
  OnCreateMenuCallback,
  OnPrepareMenuCallback,
  OnMenuItemClickCallback
} from '@kit.ArkUI';
import { State } from '@ohos.arkui.stateManagement';
import hilog from '@ohos.hilog';

// 请将$r('app.media.xxx')替换为实际资源文件
const DOMAIN = 0x0000;

@Entry
@Component
export struct PrepareMenu {
  @State text: string = 'Text editMenuOptions';
  @State endIndex: int = 0;
  onCreateMenu: OnCreateMenuCallback = (menuItems: Array<TextMenuItem>) => {
    let item1: TextMenuItem = {
      content: 'create1',
      icon: $r('app.media.startIcon'),
      id: TextMenuItemId.of('create1'),
    };
    let item2: TextMenuItem = {
      content: 'create2',
      id: TextMenuItemId.of('create2'),
      icon: $r('app.media.startIcon'),
    };
    menuItems.push(item1);
    menuItems.unshift(item2);
    return menuItems;
  }
  onMenuItemClick: OnMenuItemClickCallback = (menuItem: TextMenuItem, textRange: TextRange) => {
    if (menuItem.id.equals(TextMenuItemId.of('create2'))) {
      hilog.info(DOMAIN, 'testTag', '%{public}s',
        'intercept id: create2 start:' + textRange.start + '; end:' + textRange.end);
      return true;
    }
    if (menuItem.id.equals(TextMenuItemId.of('prepare1'))) {
      hilog.info(DOMAIN, 'testTag', '%{public}s',
        'intercept id: prepare1 start:' + textRange.start + '; end:' + textRange.end);
      return true;
    }
    if (menuItem.id.equals(TextMenuItemId.COPY)) {
      hilog.info(DOMAIN, 'testTag', '%{public}s', 'intercept COPY start:' + textRange.start + '; end:' + textRange.end);
      return true;
    }
    if (menuItem.id.equals(TextMenuItemId.SELECT_ALL)) {
      hilog.info(DOMAIN, 'testTag', '%{public}s',
        'No interception SELECT_ALL start:' + textRange.start + '; end:' + textRange.end);
      return false;
    }
    return false;
  }
  onPrepareMenu: OnPrepareMenuCallback = (menuItems: Array<TextMenuItem>) => {
    let item1: TextMenuItem = {
      content: 'prepare1_' + this.endIndex,
      icon: $r('app.media.startIcon'),
      id: TextMenuItemId.of('prepare1'),
    };
    menuItems.unshift(item1);
    return menuItems;
  }
  @State editMenuOptions: EditMenuOptions = {
    onCreateMenu: this.onCreateMenu,
    onMenuItemClick: this.onMenuItemClick,
    onPrepareMenu: this.onPrepareMenu
  } as EditMenuOptions;

  build(): void {
    NavDestination() {
      Column() {
        Text(this.text)
          .fontSize(20)
          .copyOption(CopyOptions.LocalDevice)
          .editMenuOptions(this.editMenuOptions)
          .margin({ top: 100 })
          .onTextSelectionChange((selectionStart: int, selectionEnd: int) => {
            this.endIndex = selectionEnd;
          })
      }
      .width('90%')
      .margin('5%')
    }
    // [StartExclude Prepare_Menu]
    .backgroundColor('#f1f 2f3')
    .title($r('app.string.Prepare_Menu'))

    // [EndExclude Prepare_Menu]
  }
}

// [End Prepare_Menu]
