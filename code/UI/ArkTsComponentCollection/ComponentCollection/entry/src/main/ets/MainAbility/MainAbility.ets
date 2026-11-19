/*
 * Copyright (c) 2022-2024 Huawei Device Co., Ltd.
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

/**
 * @file entry/src/main/ets/MainAbility/MainAbility.ets
 * 文件职责：MainAbility 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：MainAbility。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import UIAbility from '@ohos.app.ability.UIAbility'
import Logger from '../util/Logger'
import window from '@ohos.window';
import { KeyboardAvoidMode } from '@ohos.arkui.UIContext';
import { AbilityConstant, Want } from '@kit.AbilityKit';

const TAG: string = 'MainAbility'

/**
 * MainAbility：类定义，承载本文件对应的逻辑与数据。
 */
export default class MainAbility extends UIAbility {
  /**
   * onCreate：Ability 创建时回调。
   */
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam) {
    Logger.info(TAG, 'onCreate');
    AppStorage.setOrCreate('context', this.context);
  }

  /**
   * onDestroy：Ability 销毁时回调。
   */
  onDestroy() {
    Logger.info(TAG, 'onDestroy')
  }

  /**
   * onWindowStageCreate：窗口舞台创建时回调。
   */
  onWindowStageCreate(windowStage: window.WindowStage) {
    // Main window is created, set main page for this ability
    Logger.info(TAG, 'onWindowStageCreate')
    try {
      let windowClass: window.Window | undefined = undefined;
      window.getLastWindow(this.context, (err, data) => {
        if (err.code) {
          Logger.error('Failed to obtain the top window. Cause: ' + JSON.stringify(err));
          return;
        }
        Logger.info('Succeeded in obtaining the top window. Data: ' + JSON.stringify(data));
        windowClass = data;
        let systemBarProperties: window.SystemBarProperties = {};
        windowClass.setWindowSystemBarProperties(systemBarProperties, (err) => {
          if (err.code) {
            Logger.error('Failed to set the system bar properties. Cause: ' + JSON.stringify(err));
            return;
          }
          Logger.info('Succeeded in setting the system bar properties.');
        })
        windowClass.on('keyboardHeightChange', (data: number) => {
          AppStorage.setOrCreate('keyboardHeight', data);
        })
      })
    } catch (exception) {
      Logger.error('Failed to obtain the top window. Cause: ' + JSON.stringify(exception));
    }
    windowStage.loadContent('pages/Index', (err, data) => {
      let a = windowStage.getMainWindowSync().getUIContext().getKeyboardAvoidMode();
      windowStage.getMainWindowSync().getUIContext().setKeyboardAvoidMode(KeyboardAvoidMode.OFFSET);
      if (err) {
        Logger.error(TAG, `Failed to load the content. Cause: ${JSON.stringify(err)}`)
        return
      }
      Logger.info(TAG, `Succeeded in loading the content. Data: ${JSON.stringify(data)}`)
    })
  }

  /**
   * onWindowStageDestroy：窗口舞台销毁时回调。
   */
  onWindowStageDestroy() {
    // Main window is destroyed, release UI related resources
    Logger.info(TAG, 'onWindowStageDestroy')
  }

  /**
   * onForeground：应用进入前台时回调。
   */
  onForeground() {
    // Ability has brought to foreground
    Logger.info(TAG, 'onForeground')
  }

  /**
   * onBackground：应用退到后台时回调。
   */
  onBackground() {
    // Ability has back to background
    Logger.info(TAG, 'onBackground')
  }
}