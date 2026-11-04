/*
 * Copyright (C) 2026 HiHope Open Source Organization.
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

import { display, promptAction, router } from '@kit.ArkUI';
import { settings } from '@kit.BasicServicesKit';
import { ConfigData, Log } from 'library';
import { common } from '@kit.AbilityKit';
import { KeyCode } from '@kit.InputKit';
import MiracastPlayerServiceClient from '../serviceextability/MiracastPlayerServiceClient';

const TAG = 'ChangeNamePage.ets';

@Entry
@Component
struct ChangeNamePage {
  @State inputFocus: boolean = false;
  @State btnFocus: boolean = false;
  @State screenWidth: number = display.getDefaultDisplaySync().width;
  @State screenHeight: number = display.getDefaultDisplaySync().height;
  @State systemName: string = '';
  private changeEnabled: boolean = true;
  private client: MiracastPlayerServiceClient | null = null;

  aboutToAppear(): void {
    this.systemName = this.getSystemName();
    this.client = globalThis.client;
    Log.info(TAG, `===>aboutToAppear this.systemName ${this.systemName}`);
  }

  getSystemName(): string {
    const context: common.UIAbilityContext = getContext(this) as common.UIAbilityContext;
    let deviceName = settings.getValueSync(context, ConfigData.SETTINGSDATA_DEVICE_NAME, '');
    if (!deviceName) {
      try {
        deviceName = settings.getValueSync(context, ConfigData.MIRACAST_SYSTEM_KEY, '') || '';
      } catch (e) {
        Log.error(TAG, `getSystemName failed: ${JSON.stringify(e)}`);
        deviceName = '';
      }
    }
    Log.info(TAG, `get system name success: ${deviceName}`);
    return deviceName;
  }

  private validateDeviceName(name: string): boolean {
    if (!name || name.trim().length === 0) {
      promptAction.showToast({
        message: '投屏设备名称不能为空！',
        duration: 2000
      });
      return false;
    }

    if (/\s/.test(name)) {
      promptAction.showToast({
        message: '投屏设备名称不能包含空格符！',
        duration: 2000
      });
      return false;
    }
    return true;
  }

  setSystemName(name: string) {
    if (!this.changeEnabled) {
      return;
    }
    this.changeEnabled = false;
    Log.info(TAG, 'setSystemName name:' + name);
    if (!this.validateDeviceName(name)) {
      Log.error(TAG, 'Device name validation failed');
      this.changeEnabled = true;
      return;
    }
    if (this.client) {
      this.client.stopMiracastService((errCode: number, returnValue: number) => {
        Log.info(TAG, 'stopMiracastService callback errcode:' + errCode + ', returnValue:' + returnValue);
        if (errCode == 0) {
          setTimeout(async () => {
            await this.changeSystemName(name);
            this.client?.startMiracastService((errCode: number, returnValue: number) => {
              Log.info(TAG, 'startMiracastService callback errcode:' + errCode + ', returnValue:' + returnValue);
            });
            router.back();
          }, 1000);
        }
      });
    } else {
      this.changeSystemName(name);
      router.back();
    }
  }

  async changeSystemName(name: string) {
    const context: common.UIAbilityContext = getContext(this) as common.UIAbilityContext;
    let res = settings.setValueSync(context, ConfigData.SETTINGSDATA_DEVICE_NAME, name);
    let resName = await settings.setValue(context, 'miracastName', name);
    try {
      settings.setValueSync(context, ConfigData.MIRACAST_SYSTEM_KEY, name);
    } catch (e) {
      Log.error(TAG, `setSystemName failed: ${JSON.stringify(e)}`);
    }
    Log.info(TAG, `setSystemName, name: ${name}, res = ${res} settingDataName:${resName}`);
    let savedName = '';
    try {
      savedName = settings.getValueSync(context, 'persist.castengine.name', '') || '';
    } catch (e) {
      Log.error(TAG, `get Persist.castengine.name failed: ${JSON.stringify(e)}`);
    }
    Log.info(TAG, `===>changeSystemName get Persist.castengine.name ${savedName}`);
  }

  build() {
    Column() {
      Text('投屏设备名称')
        .fontColor('#e6ffffff')
        .fontSize(`64lpx`)
        .fontWeight(500)
        .margin({ top: `102lpx`, bottom: `61.99lpx` });

      Row() {
        Text('设备名称')
          .fontColor(this.inputFocus ? '#db000000' : '#dbffffff')
          .opacity(0.86)
          .fontSize(`36lpx`)
          .fontWeight(500)
          .margin({ left: `24lpx`, right: `24lpx` });

        TextInput({ text: this.systemName })
          .textAlign(TextAlign.End)
          .backgroundColor(Color.Transparent)
          .layoutWeight(1)
          .fontColor(this.inputFocus ? '#db000000' : '#dbffffff')
          .maxLength(23)
          .defaultFocus(true)
          .fontWeight(500)
          .fontSize(`36lpx`)
          .margin({ right: `24lpx` })
          .onChange(v => {
            this.systemName = v;
          })
          .onSubmit(() => {
            focusControl.requestFocus('save');
          });
      }
      .alignItems(VerticalAlign.Center)
      .width(`864lpx`)
      .height(`114lpx`)
      .borderRadius(`18lpx`)
      .backgroundColor(this.inputFocus ? '#dbffffff' : '#33ffffff')
      .onHover(() => {
        this.inputFocus = true;
        this.btnFocus = false;
      })
      .onFocus(() => {
        this.inputFocus = true;
      })
      .onBlur(() => {
        this.inputFocus = false;
      });

      Button('保存')
        .width(`248lpx`)
        .height(`72lpx`)
        .fontSize(`36lpx`)
        .id('save')
        .focusable(true)
        .focusOnTouch(true)
        .fontWeight(500)
        .fontColor(this.btnFocus ? '#e6000000' : '#dbffffff')
        .backgroundColor(this.btnFocus ? '#dbffffff' : '#33ffffff')
        .margin({ top: `54.32lpx` })
        .stateStyles({
          focused: {
            .border({
              color: Color.Transparent
            });
          }
        })
        .onHover(() => {
          this.btnFocus = true;
          this.inputFocus = false;
        })
        .onFocus(() => {
          this.btnFocus = true;
        })
        .onBlur(() => {
          this.btnFocus = false;
        })
        .onClick(() => {
          this.setSystemName(this.systemName);
        });

    }
    .backgroundColor('#db000000')
    .alignItems(HorizontalAlign.Center)
    .justifyContent(FlexAlign.Start)
    .width('100%')
    .height('100%')
    // 输入框会先吃掉 DPAD 的 Down，仅 Up 能冒泡到此处；故不能限制为 KeyType.Down，否则下键无法切到「保存」
    .onKeyEvent((e: KeyEvent) => {
      if (e.keyCode === KeyCode.KEYCODE_DPAD_DOWN) {
        focusControl.requestFocus('save');
        return;
      }
      if (e.type === KeyType.Down &&
        (e.keyCode === KeyCode.KEYCODE_ENTER || e.keyCode === KeyCode.KEYCODE_DPAD_CENTER)) {
        focusControl.requestFocus('save');
      }
    });
  }
}
