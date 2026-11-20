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
import { PageConstants, ResourceHelper, SystemConfigConstants } from 'library';

const TAG: string = SystemConfigConstants.TAG;
const DOMAIN: number = SystemConfigConstants.DOMAIN;

/**
 * EntryAbility is the entry ability of the application; it creates the window and loads the home page.
 * Logs are emitted in the lifecycle callbacks to aid debugging and tracing.
 */
export default class EntryAbility extends UIAbility {
  /**
   * Ability creation callback; performs initialization.
   * @param {Want} want - Startup request parameters
   * @param {AbilityConstant.LaunchParam} launchParam - Launch parameters
   */
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    hilog.info(DOMAIN, TAG, 'Ability onCreate');
    ResourceHelper.init(this.context);
  }

  /**
   * Ability destroy callback; releases resources.
   */
  onDestroy(): void {
    hilog.info(DOMAIN, TAG, 'Ability onDestroy');
  }

  /**
   * Window stage creation callback; loads the home page content.
   * @param {window.WindowStage} windowStage - Window stage object
   */
  onWindowStageCreate(windowStage: window.WindowStage): void {
    hilog.info(DOMAIN, TAG, 'Ability onWindowStageCreate');
    windowStage.loadContent(PageConstants.PAGE_INDEX, (err) => {
      if (err.code) {
        hilog.error(DOMAIN, TAG, 'Failed to load content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      hilog.info(DOMAIN, TAG, 'Succeeded in loading the content.');
    });
  }

  /**
   * Window stage destroy callback.
   */
  onWindowStageDestroy(): void {
    hilog.info(DOMAIN, TAG, 'Ability onWindowStageDestroy');
  }

  /**
   * Callback invoked when the application moves to the foreground.
   */
  onForeground(): void {
    hilog.info(DOMAIN, TAG, 'Ability onForeground');
  }

  /**
   * Callback invoked when the application moves to the background.
   */
  onBackground(): void {
    hilog.info(DOMAIN, TAG, 'Ability onBackground');
  }
}
