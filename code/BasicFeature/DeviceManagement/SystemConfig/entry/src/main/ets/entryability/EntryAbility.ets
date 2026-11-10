/*
 * Copyright (c) 2024 Hunan OpenValley Digital Industry Development Co., Ltd.
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

const TAG: string = '[Sample_SystemConfig]';
const DOMAIN: number = 0x0000;

/**
 * EntryAbility 是应用的入口 Ability，负责创建窗口并加载首页。
 * 在生命周期回调中输出日志以便调试追踪。
 */
export default class EntryAbility extends UIAbility {
  /**
   * 应用创建回调，执行初始化操作。
   * @param {Want} want - 启动请求参数
   * @param {AbilityConstant.LaunchParam} launchParam - 启动参数
   */
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    hilog.info(DOMAIN, TAG, 'Ability onCreate');
  }

  /**
   * 应用销毁回调，执行资源释放操作。
   */
  onDestroy(): void {
    hilog.info(DOMAIN, TAG, 'Ability onDestroy');
  }

  /**
   * 窗口创建回调，加载首页内容。
   * @param {window.WindowStage} windowStage - 窗口阶段对象
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
   * 窗口销毁回调。
   */
  onWindowStageDestroy(): void {
    hilog.info(DOMAIN, TAG, 'Ability onWindowStageDestroy');
  }

  /**
   * 应用切换到前台回调。
   */
  onForeground(): void {
    hilog.info(DOMAIN, TAG, 'Ability onForeground');
  }

  /**
   * 应用切换到后台回调。
   */
  onBackground(): void {
    hilog.info(DOMAIN, TAG, 'Ability onBackground');
  }
}
