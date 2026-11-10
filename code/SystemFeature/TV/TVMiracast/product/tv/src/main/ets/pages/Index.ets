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

import { display, router } from '@kit.ArkUI';
import { Log, MIRACAST_SETTINGS_KEY } from 'library';
import { common, Want } from '@kit.AbilityKit';
import { SettingView } from '../components/SettingView';
import { ProjectionScreenView } from '../components/ProjectionScreenView';
import MiracastPlayerServiceClient from '../serviceextability/MiracastPlayerServiceClient';
import {
  onConnectCallback,
  onDisconnectCallback,
  DeviceConnectListener
} from '../serviceextability/DeviceConnectListener';
import { KeyCode } from '@kit.InputKit';
import { settings } from '@kit.BasicServicesKit';
import { deviceInfo } from '@kit.BasicServicesKit';

const TAG = 'Index.ets';

class MyListener extends DeviceConnectListener {
  onConnect(deviceId: string, deviceName: string, deviceType: number, callback: onConnectCallback): void {
    Log.info(TAG, 'MyListener.onConnect');
    callback(0);
  }

  onDisconnect(deviceId: string, callback: onDisconnectCallback): void {
    Log.info(TAG, 'MyListener.onDisconnect');
    callback(0);
  }
}

@Entry
@Component
struct Index {
  @State showSettingView: boolean = false;
  @State tab_miracast_focused: boolean = false;
  @State tabSettingsFocused: boolean = false;
  @State exitButtonFocused: boolean = false;
  @State screenWidth: number = display.getDefaultDisplaySync().width;
  @State screenHeight: number = display.getDefaultDisplaySync().height;
  @Provide stopTabFocus: boolean = false;

  aboutToAppear(): void {
    Log.info(TAG, 'aboutToAppear');
    this.tabStartClick();
  }

  tabStartClick() {
    try {
      setTimeout(() => {
        focusControl.requestFocus('switchBtn');
      }, 50);
    } catch (e) {
      Log.error(TAG, 'focus request failed: ' + JSON.stringify(e));
    }
  }

  aboutToDisappear(): void {
    Log.info(TAG, 'aboutToDisappear');
  }

  private listener = new MyListener('Index');
  private client: MiracastPlayerServiceClient | null = null;
  private connectionId: number = -1;
  private isConnecting: boolean = false;

  isSwitchOn() {
    let isSwitchOn = false;
    try {
      isSwitchOn =
        settings.getValueSync(getContext(this), MIRACAST_SETTINGS_KEY, '1', settings.domainName.DEVICE_SHARED) == '1';
      Log.info(TAG, 'get miracast_switch from settings, isSwitchOn: ' + isSwitchOn);
    } catch (err) {
      isSwitchOn = false;
    }
    let isLow = deviceInfo.productModel == 'Hi3751V352';
    Log.info(TAG, `isSwitchOn isLow:${isLow} isSwitchOn:${isSwitchOn}`);
    return isLow && isSwitchOn;
  }

  connectService() {
    if (this.isConnecting) {
      Log.info(TAG, 'connectService skip: connecting');
      return;
    }
    this.isConnecting = true;
    Log.info(TAG, 'connectService');
    let want: Want = {
      bundleName: 'com.samples.miracast',
      abilityName: 'ServiceExtTvAbility'
    };
    let options: common.ConnectOptions = {
      onConnect: (elementName, remote) => {
        Log.info(TAG, 'ServiceExtensionAbility callback onConnect');
        this.isConnecting = false;
        this.client = new MiracastPlayerServiceClient(remote);
        globalThis.client = this.client;
        this.client.registerDeviceConnectListener(this.listener, (errCode: number, returnValue: number) => {
          Log.info(TAG, 'registerDeviceConnectListener callback errcode:' + errCode + ', returnValue:' + returnValue);
        });
        // if (this.isSwitchOn()){
        this.client.startMiracastService(() => {
        });
        // }
      },
      onDisconnect: (elementName) => {
        Log.info(TAG, 'ServiceExtensionAbility callback onDisconnect');
        this.isConnecting = false;
        this.client = null;
      },
      onFailed: (code) => {
        Log.info(TAG, 'ServiceExtensionAbility callback onFailed');
        this.isConnecting = false;
      }
    };
    let context: common.UIAbilityContext = getContext(this) as common.UIAbilityContext; // UIAbilityContext
    this.connectionId = context.connectServiceExtensionAbility(want, options);
  }

  onPageShow(): void {
    if (globalThis.playerNeedReconnect === true) {
      Log.info(TAG, 'onPageShow: playerNeedReconnect true, reconnect service');
      globalThis.playerNeedReconnect = false;
      let context: common.UIAbilityContext = getContext(this) as common.UIAbilityContext;
      if (this.connectionId >= 0) {
        try {
          context.disconnectServiceExtensionAbility(this.connectionId);
        } catch (error) {
          Log.error(TAG, `disconnect old service failed: ${JSON.stringify(error)}`);
        }
        this.connectionId = -1;
      }
      this.client = null;
      this.isConnecting = false;
      // Wait for stopMiracastService teardown to settle before reconnecting to avoid stop/start races.
      setTimeout(() => {
        this.connectService();
      }, 400);
      return;
    }
    if (this.client == null) {
      this.connectService();
      return;
    }
    // After leaving the page the client may still exist while discovery stopped; restart discovery here.
    this.client.startMiracastService((errCode: number, returnValue: number) => {
      Log.info(TAG, `onPageShow startMiracastService callback errcode:${errCode}, returnValue:${returnValue}`);
    });
  }

  build() {

    Stack({ alignContent: Alignment.TopStart }) {
      Text($r('app.string.quick_screen_projection'))
        .fontSize('64lpx')
        .fontColor($r('app.color.white'))
        .opacity(0.9)
        .fontWeight(500)
        .focusable(false)
        .width('100%')
        .margin({ left: '96lpx', top: '53lpx' });

      Row() {
        Text($r('app.string.miracast_screen_casting'))
          .id('miracast_screen_casting')
          .width('260lpx')
          .height('60lpx')
          .defaultFocus(true)
          .borderRadius('36lpx')
          .fontSize('36lpx')
          .textAlign(TextAlign.Center)
          .focusable(this.stopTabFocus ? false : true)
          .focusOnTouch(true)
          .stateStyles({
            focused: {
              .border({
                color: Color.Transparent
              });
            }
          })
          .fontWeight(FontWeight.Medium)
          .fontColor(this.tab_miracast_focused ? '#db000000' : '#dbffffff')
          .backgroundColor(this.tab_miracast_focused ? '#dbffffff' : '#33ffffff')
          .onHover((isHover: boolean) => {
            this.tab_miracast_focused = isHover;
            this.tabSettingsFocused = false;
          })
          .onBlur(() => {
            this.tab_miracast_focused = false;
          })
          .onFocus(() => {
            this.tab_miracast_focused = true;
            this.showSettingView = false;
          })
          .onClick(() => {
            this.showSettingView = false;
          });

        Text($r('app.string.projection_Settings'))
          .id('projection_Settings')
          .width('220lpx')
          .height('60lpx')
          .borderRadius('36lpx')
          .fontSize('36lpx')
          .margin({ left: '48.15lpx' })
          .textAlign(TextAlign.Center)
          .focusable(true)
          .focusOnTouch(true)
          .fontWeight(FontWeight.Medium)
          .fontColor(this.tabSettingsFocused ? '#db000000' : '#dbffffff')
          .backgroundColor(this.tabSettingsFocused ? '#dbffffff' : '#33ffffff')
          .stateStyles({
            focused: {
              .border({
                color: Color.Transparent
              });
            }
          })
          .onHover((isHover: boolean) => {
            this.tabSettingsFocused = isHover;
            this.tab_miracast_focused = false;
          })
          .onBlur(() => {
            this.tabSettingsFocused = false;
          })
          .onFocus(() => {
            this.tabSettingsFocused = true;
            this.showSettingView = true;
          })
          .onClick(() => {
            this.showSettingView = true;
          });
      }
      .alignSelf(ItemAlign.Start)
      .margin({ left: '96lpx', top: '187.56lpx' });

      Column() {
        if (this.showSettingView) {
          SettingView();
        } else {
          ProjectionScreenView();
        }
      }
      .height('728lpx')
      .width('1744lpx')
      .margin({ left: '80lpx', top: '304lpx' });

    }
    .width('100%')
    .height('100%')
    .backgroundColor('#18181A')
    .onTouch((event) => {
      if (event.type === TouchType.Down) {
        this.tabStartClick();
      }
    });
  }
}
