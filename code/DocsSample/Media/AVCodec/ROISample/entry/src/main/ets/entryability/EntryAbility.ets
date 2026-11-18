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

import { abilityAccessCtrl, AbilityConstant, UIAbility, Want } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { display, window } from '@kit.ArkUI';
import Logger from '../common/utils/Logger';
import { CommonConstants } from '../common/CommonConstants';
import { WindowUtil } from '../common/utils/WindowUtils';

const TAG = '[Sample_HMOSLiveStream]';

export default class EntryAbility extends UIAbility {
  public static readonly KEY_UI_CONTEXT: string = CommonConstants.KEY_PREFIX + 'UIContext';
  private uiContext?: UIContext;
  private windowUtil?: WindowUtil = WindowUtil.getInstance();
  public static readonly KEY_CURRENT_WIDTH_BREAKPOINT: string = CommonConstants.KEY_PREFIX + 'currentWidthBreakpoint';
  public static readonly KEY_STATUS_BAR_HEIGHT: string = CommonConstants.KEY_PREFIX + 'statusBarHeight';

  onCreate(_: Want, __: AbilityConstant.LaunchParam): void {
    Logger.info(TAG, 'Ability onCreate');
  }

  onDestroy(): void {
    Logger.info(TAG, 'Ability onDestroy');
  }

  private onWindowSizeChange: (windowSize: window.Size) => void = (windowSize: window.Size) => {
    let widthBp: WidthBreakpoint = this.uiContext!.getWindowWidthBreakpoint();
    let heightBp: HeightBreakpoint = this.uiContext!.getWindowHeightBreakpoint();

    Logger.info(TAG, 'widthBp & heightBp:' + widthBp + ',' + heightBp);

    AppStorage.setOrCreate(EntryAbility.KEY_CURRENT_WIDTH_BREAKPOINT,
      widthBp === 0 ? 'xs' : widthBp === 1 ? 'sm' : widthBp === 2 ? 'md' : widthBp === 3 ? 'lg' : 'xl');
  };

  onWindowStageCreate(windowStage: window.WindowStage): void {
    // Main window is created, set main page for this ability
    Logger.info(TAG, 'Ability onWindowStageCreate');

    try {
      let atManager = abilityAccessCtrl.createAtManager();
      atManager.requestPermissionsFromUser(this.context,
        ['ohos.permission.CAMERA', 'ohos.permission.MICROPHONE', 'ohos.permission.DISTRIBUTED_DATASYNC'])
        .then((data) => {
          Logger.info(TAG, `requestPre() data: ${JSON.stringify(data)}.`);
        }).catch((err: BusinessError) => {
        Logger.error(TAG, `requestPre() data failed, errCode = ${err.code}, errMessage = ${err.message}.`);
      })
    } catch (error) {
      let err = error as BusinessError;
      Logger.error(TAG, `requestPre() data failed, errCode = ${err.code}, errMessage = ${err.message}.`);
    }

    try {
      windowStage.getMainWindowSync().setWindowKeepScreenOn(true).catch((err: BusinessError) => {
        Logger.error(TAG, `setWindowKeepScreenOn failed, errCode = ${err.code}, errMessage = ${err.message}.`);
      });
    } catch (error) {
      let err = error as BusinessError;
      Logger.error(TAG, `setWindowKeepScreenOn failed, errCode = ${err.code}, errMessage = ${err.message}.`);
    }

    try {
      windowStage.getMainWindowSync().setWindowLayoutFullScreen(true)
        .catch((err: BusinessError) => {
          Logger.error(TAG, `setWindowLayoutFullScreen failed, errCode = ${err.code}, errMessage = ${err.message}.`);
        });
    } catch (error) {
      let err = error as BusinessError;
      Logger.error(TAG, `setWindowLayoutFullScreen failed, errCode = ${err.code}, errMessage = ${err.message}.`);
    }

    windowStage.loadContent('pages/Index', (err) => {
      if (err.code) {
        Logger.error(TAG, `Failed to load the content, errCode = ${err.code}, errMessage = ${err.message}.`);
        return;
      }
      try {
        AppStorage.setOrCreate(EntryAbility.KEY_UI_CONTEXT, windowStage.getMainWindowSync().getUIContext());
      } catch (error) {
        let err = error as BusinessError;
        Logger.error(TAG, `create uiContext failed, errCode = ${err.code}, errMessage = ${err.message}.`);
      }
      Logger.info(TAG, 'Succeeded in loading the content.');
      if (this.windowUtil !== undefined) {
        this.windowUtil.setWindowStage(windowStage);
      }
      windowStage.getMainWindow().then((data: window.Window) => {
        this.uiContext = data.getUIContext();
        let widthBp: WidthBreakpoint = this.uiContext!.getWindowWidthBreakpoint();
        let heightBp: HeightBreakpoint = this.uiContext!.getWindowHeightBreakpoint();
        Logger.info(TAG, 'widthBp & heightBp:' + widthBp + ',' + heightBp);
        AppStorage.setOrCreate(EntryAbility.KEY_CURRENT_WIDTH_BREAKPOINT,
          widthBp === 0 ? 'xs' : widthBp === 1 ? 'sm' : widthBp === 2 ? 'md' : widthBp === 3 ? 'lg' : 'xl');
        try {
          let avoidArea = data.getWindowAvoidArea(window.AvoidAreaType.TYPE_SYSTEM);
          let statusBarHeight = avoidArea.topRect.height / display.getDefaultDisplaySync().densityPixels;
          AppStorage.setOrCreate(EntryAbility.KEY_STATUS_BAR_HEIGHT, statusBarHeight);
        } catch (error) {
          let err = error as BusinessError;
          Logger.error(TAG, `getStatusBarHeight failed, errCode = ${err.code}, errMessage = ${err.message}.`);
          AppStorage.setOrCreate(EntryAbility.KEY_STATUS_BAR_HEIGHT, 48);
        }
        data.on('windowSizeChange', this.onWindowSizeChange);
      }).catch((err: BusinessError) => {
        Logger.error(TAG, `Failed to obtain the main window. code = ${err.code}, message = ${err.message}`);
      });
    });
  }

  onWindowStageDestroy(): void {
    // Main window is destroyed, release UI related resources
    Logger.info(TAG, 'Ability onWindowStageDestroy');
  }

  onForeground(): void {
    // Ability has brought to foreground
    Logger.info(TAG, 'Ability onForeground');
  }

  onBackground(): void {
    // Ability has back to background
    Logger.info(TAG, 'Ability onBackground');
  }
};