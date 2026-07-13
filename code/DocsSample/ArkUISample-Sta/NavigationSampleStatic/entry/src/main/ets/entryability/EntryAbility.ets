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
import { AbilityConstant, ConfigurationConstant, UIAbility, Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { display } from '@kit.ArkUI';
import uiObserver from '@ohos.arkui.observer';
import window from '@ohos.window';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { BusinessError } from '@ohos.base'

const DOMAIN = 0x0000;

function callBackFunc(info: uiObserver.NavDestinationSwitchInfo) {
  hilog.info(DOMAIN, 'testTag', 'testTag navDestinationSwitch from:', JSON.stringify(info.from), 'to: ',
    JSON.stringify(info.to));
}

function callBackFunc2(info: uiObserver.NavDestinationSwitchInfo) {
  hilog.info(DOMAIN, 'testTag', 'testTag2 navDestinationSwitch from:', JSON.stringify(info.from), 'to: ',
    JSON.stringify(info.to));
}

export default class EntryAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    this.context.getApplicationContext().setColorMode(ConfigurationConstant.ColorMode.COLOR_MODE_NOT_SET);
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'Ability onCreate');
    uiObserver.onNavDestinationSwitch(this.context, callBackFunc);
    uiObserver.onNavDestinationSwitch(this.context, {
      navigationId: 'myNavId'
    }, callBackFunc2);
  }

  onDestroy(): void {
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'Ability onDestroy');
    uiObserver.offNavDestinationSwitch(this.context, callBackFunc);
    uiObserver.offNavDestinationSwitch(this.context, {
      navigationId: 'myNavId'
    }, callBackFunc);
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    // Main window is created, set main page for this ability
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'Ability onWindowStageCreate');
    let mainWindow: window.Window;
    try {
      mainWindow = windowStage.getMainWindowSync();
      let displayClass: display.Display = display.getDefaultDisplaySync();
      AppStorage.setOrCreate('orientation', displayClass.orientation);
      // 监听窗口的windowsSizeChange事件，旋转屏时会触发该事件
      mainWindow.onWindowSizeChange((data) => {
        hilog.info(DOMAIN, 'testTag', 'Succeeded in enabling the listener for window size changes. Data:',
          JSON.stringify(data));
        let displayClass: display.Display | null = null;
        try {
          displayClass = display.getDefaultDisplaySync();
          hilog.info(DOMAIN, 'testTag', 'display orientation is ',
            JSON.stringify(displayClass.orientation));
          // 获取屏幕的显示方向
          AppStorage.set('orientation', displayClass.orientation);
        } catch(e) {
          return;
        }
      })
    } catch(e) {
      hilog.info(0x0000, 'testTag', '%{public}s', 'error');
      return;
    }
    try {
      windowStage.loadContent('pages/Index', (err: BusinessError<void> | null): void => {
        hilog.info(0x0000, 'testTag', 'loadContent entering');
        if (err && err.code) {
          hilog.info(0x0000, 'testTag', 'loadContent error');
          return;
        }
        hilog.info(0x0000, 'testTag', 'loadContent ok');
      });
    } catch (e) {
      hilog.info(0x0000, 'testTag', 'loadContent catch error：-----------' + e.message);
    }
  }

  onWindowStageDestroy(): void {
    // Main window is destroyed, release UI related resources
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'Ability onWindowStageDestroy');
  }

  onForeground(): void {
    // Ability has brought to foreground
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'Ability onForeground');
  }

  onBackground(): void {
    // Ability has back to background
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'Ability onBackground');
  }
}