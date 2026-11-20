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
import { Log, ConfigData, MIRACAST_SETTINGS_KEY } from 'library';
import { settings } from '@kit.BasicServicesKit';
import { common } from '@kit.AbilityKit';

// Screen projection view
const TAG = 'ProjectionScreenView';
const ON = '1';

@Component
export struct ProjectionScreenView {
  @State deviceName: string = '';

  aboutToAppear(): void {
    Log.info(TAG, `aboutToAppear`);
    this.deviceName = this.getSystemName() || this.getSystemNameStart();
    Log.info(TAG, `aboutToAppear, deviceName = ${this.deviceName}`);
  }

  getSystemName(): string {
    const context: common.UIAbilityContext = getContext(this) as common.UIAbilityContext;
    let deviceName = settings.getValueSync(context, ConfigData.SETTINGSDATA_DEVICE_NAME, '');
    Log.info(TAG, `get system name success: ${deviceName}`);
    return deviceName;
  }

  getSystemNameStart(): string {
    const context: common.UIAbilityContext = getContext(this) as common.UIAbilityContext;
    let deviceName = settings.getValueSync(context, ConfigData.SETTINGSDATA_DEVICE_NAME, '');
    Log.info(TAG, `get system name success: ${deviceName}`);
    return deviceName;
  }

  build() {
    Column() {
      Image($r('app.media.toupingda'))
        .width('320lpx')
        .height('280lpx');

      Text($r('app.string.wireless_projection_screen'))
        .fontColor($r('app.color.white'))
        .fontSize('36lpx')
        .fontWeight(500)
        .opacity(0.4)
        .margin({ top: '20lpx' });

      Row() {
        Text(this.deviceName)
          .fontColor($r('app.color.white'))
          .fontSize('32lpx')
          .fontWeight(500)
          .opacity(0.4);

        Text($r('app.string.waiting_for_conning'))
          .fontColor($r('app.color.white'))
          .fontSize('32lpx')
          .fontWeight(500)
          .opacity(0.4);
      }
      .margin({ top: '24lpx' });

    }
    .width('100%')
    .height('100%')
    .alignItems(HorizontalAlign.Center)
    .justifyContent(FlexAlign.Start);
  }
}
