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

import { TestJs } from './PasteboardModel'
// [Start pasteboard_permission]
import abilityAccessCtrl, { Context, PermissionRequestResult, Permissions } from '@ohos.abilityAccessCtrl'
import { BusinessError } from '@ohos.base'
import common from '@ohos.app.ability.common'
import dataPreferences from '@ohos.data.preferences'
import EntryAbility from '../entryability/EntryAbility'
import { Entry, Text, Column, RichEditorController, Component, Scroller, Button, ClickEvent, Row, TextArea, RichEditorOptions } from '@ohos.arkui.component'
import hilog from '@ohos.hilog'
import pasteboard from '@ohos.pasteboard'
import { State } from '@ohos.arkui.stateManagement'

const permissions: Array<Permissions> = ['ohos.permission.READ_PASTEBOARD'];
const systemPasteboard: pasteboard.SystemPasteboard = pasteboard.getSystemPasteboard();
const patterns: pasteboard.Pattern[] = [pasteboard.Pattern.URL, pasteboard.Pattern.EMAIL_ADDRESS];
const context = EntryAbility.getContext();
let options: dataPreferences.Options = { name: 'myStore' };
let mdataPreferences: dataPreferences.Preferences = dataPreferences.getPreferencesSync(context, options);
// [StartExclude pasteboard_permission]
const LOG_DOMAIN = 0x1C04;
const LOG_TAG = "PBDEMO";

// [EndExclude pasteboard_permission]
async function isNeedGetPermissionFromUser(): Promise<boolean> {
  try {
    let hasData: boolean = await systemPasteboard.hasData();
    if (!hasData) {
      // 剪贴板不存在数据，无需申请权限
      return false;
    }
    // 获取剪贴板的内容变化次数
    let result: long = systemPasteboard.getChangeCount();
    hilog.info(0xFF00, '[Sample_pasteboard]', `Succeeded in getting the ChangeCount. Result: ${result}`);
    // 从 Preferences 中读取上次保存的 changeCount
    let storedChangeCount = await mdataPreferences!.get('pasteboardChangeCount', 0);
    if (result === storedChangeCount) {
      // 剪贴板无数据变化，无需申请权限
      return false;
    }
  } catch (err) {
    let error = err as BusinessError;
    hilog.error(0xFF00, '[Sample_pasteboard]', `Failed to get the ChangeCount. Cause: ${error.message}`);
    return false;
  }

  // 查询剪贴板是否存在应用所需数据类型
  try {
    // (可选)判断是否有应用需要的数据类型
    let result: boolean = systemPasteboard.hasDataType(pasteboard.MIMETYPE_TEXT_PLAIN);
    hilog.info(0xFF00, '[Sample_pasteboard]', `Succeeded in checking the DataType. Result: ${result}`);
    if (!result) {
      // 剪贴板不存在应用所需数据类型，无需申请权限
      return false;
    }
    // (可选)涉及口令等应用自身特殊复制内容的，使用detectPatterns过滤口令格式
    let data: pasteboard.Pattern[] = await systemPasteboard.detectPatterns(patterns);
    if (patterns.sort().join('') != data.sort().join('')) {
      hilog.info(0xFF00, '[Sample_pasteboard]', 'Not all needed patterns detected, no need to get data.');
      return false;
    }
  } catch (err) {
    let error = err as BusinessError;
    hilog.error(0xFF00, '[Sample_pasteboard]', `Failed to check the DataType. Cause: ${error.message}`);
    return false;
  }
  return true;
}

@Entry
@Component
struct Index {
  // [StartExclude pasteboard_permission]
  @State data: string = '';
  @State text: string = '';
  controller: RichEditorController = new RichEditorController();
  options: RichEditorOptions = { controller: this.controller };
  scroller: Scroller = new Scroller();

  printLog(content: string): void {
    hilog.info(LOG_DOMAIN, LOG_TAG, content);
    this.controller.addTextSpan(content);
  }
  // [EndExclude pasteboard_permission]

  async handlePaste(): Promise<void> {
    if (!await isNeedGetPermissionFromUser()) {
      hilog.info(0xFF00, '[Sample_pasteboard]', 'No neded to bring up the permission pop-up window');
      return;
    }
    let atManager: abilityAccessCtrl.AtManager = abilityAccessCtrl.createAtManager();
    // requestPermissionsFromUser会判断权限的授权状态来决定是否唤起弹窗。
    try {
      let contexts: Context = this.getUIContext().getHostContext() as common.UIAbilityContext;
      let data: PermissionRequestResult = await atManager.requestPermissionsFromUser(contexts, permissions);
      let grantStatus: Array<int> = data.authResults;
      for (let i = 0; i < grantStatus.length; i++) {
        if (grantStatus[i] === 0) {
          // 用户授权，使用get操作读取剪贴板内容。
          // [StartExclude pasteboard_permission]
          try {
            let ret: string = await TestJs.getPlainData(pasteboard.MIMETYPE_TEXT_PLAIN);
            this.text = ret;
          } catch (err) {
            let error = err as BusinessError;
            this.printLog('get failed.');
          }
          // [EndExclude pasteboard_permission]
          // 执行判断口令逻辑，如果是本应用口令，建议获取完数据后使用cleardata清除剪贴板口令内容
          try {
            await systemPasteboard.clearData();
            hilog.info(0xFF00, '[Sample_pasteboard]', 'Succeeded in clearing the pasteboard.');
          } catch (err) {
            let error = err as BusinessError;
            hilog.error(0xFF00, '[Sample_pasteboard]', `Failed to clear the pasteboard. Cause: ${error.message}`);
          }
          // 获取当前 ChangeCount
          let currentChangeCount: long = systemPasteboard.getChangeCount();
          hilog.info(0xFF00, '[Sample_pasteboard]', 'Current ChangeCount: ' + currentChangeCount);
          // 更新 Preferences 中的 ChangeCount
          if (mdataPreferences) {
            mdataPreferences!.putSync('pasteboardChangeCount', currentChangeCount);
            mdataPreferences!.flushSync(); // 确保数据写入持久化存储
            hilog.info(0xFF00, '[Sample_pasteboard]', 'ChangeCount has been updated to: ' + currentChangeCount);
          }
        } else {
          // 用户拒绝授权，提示用户必须授权才能访问当前页面的功能，并引导用户到系统设置中打开相应的权限。
          return;
        }
      }
      // 授权成功。
    } catch (err) {
      let error = err as BusinessError;
      hilog.error(0xFF00, '[Sample_pasteboard]', `Failed to request permissions from user. Cause: ${error.message}`);
    }
  }
  build() {
    Row() {
      Column() {
        // [StartExclude pasteboard_permission]
        Button('复制')
          .fontSize(20)
          .margin({ top: 4, left: 4 })
          .width('210')
          .height('30')
          .backgroundColor('#f32dc400')
          .onClick(() => {
            TestJs.setPlainData(this.data);
          })
        TextArea().width(300)
          .onChange((value: string) => {
            this.data = value;
          })
        // [EndExclude pasteboard_permission]
        Button('粘贴')
          // [StartExclude pasteboard_permission]
          .fontSize(20)
          .margin({ top: 4, left: 4 })
          .width('210')
          .height('30')
          .backgroundColor('#f32dc400')
          // [EndExclude pasteboard_permission]
          .onClick(() => {
            this.handlePaste();
          })
        // [StartExclude pasteboard_permission]
        Text(this.text)
          .baselineOffset(5)
        // [EndExclude pasteboard_permission]
      }
      // [StartExclude pasteboard_permission]
      .width('100%')
      // [EndExclude pasteboard_permission]
    }
    // [StartExclude pasteboard_permission]
    .height('100%')
    // [EndExclude pasteboard_permission]
  }
}
// [End pasteboard_permission]