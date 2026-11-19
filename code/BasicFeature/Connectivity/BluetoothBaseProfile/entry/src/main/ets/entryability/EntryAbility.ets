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

import { AbilityConstant, UIAbility, Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { window } from '@kit.ArkUI';
import { BluetoothConstants } from 'library';

const TAG: string = BluetoothConstants.TAG;
const DOMAIN: number = BluetoothConstants.DOMAIN;

/**
 * EntryAbility is the entry ability of the application.
 * It creates the window and loads the home page.
 */
export default class EntryAbility extends UIAbility {
  /**
   * Called when the ability is created.
   * @param {Want} want - The want object containing ability information
   * @param {AbilityConstant.LaunchParam} launchParam - The launch parameters
   */
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    hilog.info(DOMAIN, TAG, 'Ability onCreate');
  }

  /**
   * Called when the ability is destroyed.
   */
  onDestroy(): void {
    hilog.info(DOMAIN, TAG, 'Ability onDestroy');
  }

  /**
   * Called when the window stage is created.
   * Loads the main page content.
   * @param {window.WindowStage} windowStage - The window stage object
   */
  onWindowStageCreate(windowStage: window.WindowStage): void {
    hilog.info(DOMAIN, TAG, 'Ability onWindowStageCreate');
    windowStage.loadContent('pages/Index', (err) => {
      if (err.code) {
        hilog.error(DOMAIN, TAG, 'Failed to load content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      hilog.info(DOMAIN, TAG, 'Succeeded in loading the content.');
    });
  }

  /**
   * Called when the window stage is destroyed.
   */
  onWindowStageDestroy(): void {
    hilog.info(DOMAIN, TAG, 'Ability onWindowStageDestroy');
  }

  /**
   * Called when the ability moves to the foreground.
   */
  onForeground(): void {
    hilog.info(DOMAIN, TAG, 'Ability onForeground');
  }

  /**
   * Called when the ability moves to the background.
   */
  onBackground(): void {
    hilog.info(DOMAIN, TAG, 'Ability onBackground');
  }
}
