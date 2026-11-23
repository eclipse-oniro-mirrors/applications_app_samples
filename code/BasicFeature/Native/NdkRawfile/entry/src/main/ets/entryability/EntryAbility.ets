/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
 * @file entry/src/main/ets/entryability/EntryAbility.ets
 * 文件职责：EntryAbility 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：EntryAbility。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import AbilityConstant from '@ohos.app.ability.AbilityConstant';
import UIAbility from '@ohos.app.ability.UIAbility';
import Want from '@ohos.app.ability.Want';
import { Logger } from '../utils/Logger';
import window from '@ohos.window';

/**
 * EntryAbility：类定义，承载本文件对应的逻辑与数据。
 */
export default class EntryAbility extends UIAbility {
  /**
   * onCreate：Ability 创建时回调。
   */
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam) {
    Logger.info('Ability onCreate');
  }

  /**
   * onDestroy：Ability 销毁时回调。
   */
  onDestroy() {
    Logger.info('Ability onDestroy');
  }

  /**
   * onWindowStageCreate：窗口舞台创建时回调。
   */
  onWindowStageCreate(windowStage: window.WindowStage) {
    // Main window is created, set main page for this ability
    Logger.info('Ability onWindowStageCreate');

    windowStage.loadContent('pages/Index', (err, data) => {
      if (err.code) {
        Logger.error('Failed to load the content. Cause: ' + JSON.stringify(err));
        return;
      }
      Logger.info('Succeeded in loading the content. Data: ' + JSON.stringify(data));
    });
  }

  /**
   * onWindowStageDestroy：窗口舞台销毁时回调。
   */
  onWindowStageDestroy() {
    // Main window is destroyed, release UI related resources
    Logger.info('Ability onWindowStageDestroy');
  }

  /**
   * onForeground：应用进入前台时回调。
   */
  onForeground() {
    // Ability has brought to foreground
    Logger.info('Ability onForeground');
  }

  /**
   * onBackground：应用退到后台时回调。
   */
  onBackground() {
    // Ability has back to background
    Logger.info('Ability onBackground');
  }
};
