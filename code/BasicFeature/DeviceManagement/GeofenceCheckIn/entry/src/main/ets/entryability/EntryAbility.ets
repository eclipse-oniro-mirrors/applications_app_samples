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
import { window } from '@kit.ArkUI';
import { hiTraceMeter } from '@kit.PerformanceAnalysisKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { Logger } from 'library';

// Module-level counter that produces a unique task id for every trace span.
let traceTaskIdCounter: number = 0;

/**
 * Entry ability of the geofence check-in sample.
 *
 * It owns the ability and window lifecycle, loads the main page and applies
 * the system color mode so the UI follows the current dark or light theme.
 */
export default class EntryAbility extends UIAbility {
  /**
   * Called when the ability is created.
   *
   * @param want - Launch parameters carried by the system.
   * @param launchParam - Launch reason and related parameters.
   */
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    const taskId: number = ++traceTaskIdCounter;
    hiTraceMeter.startTrace('EntryAbility#onCreate', taskId);
    try {
      // Record the creation moment for lifecycle diagnostics.
      Logger.info('EntryAbility#onCreate: ability created');
    } finally {
      hiTraceMeter.finishTrace('EntryAbility#onCreate', taskId);
    }
  }

  /**
   * Called when the ability is destroyed.
   */
  onDestroy(): void {
    const taskId: number = ++traceTaskIdCounter;
    hiTraceMeter.startTrace('EntryAbility#onDestroy', taskId);
    try {
      // Record the destruction moment for lifecycle diagnostics.
      Logger.info('EntryAbility#onDestroy: ability destroyed');
    } finally {
      hiTraceMeter.finishTrace('EntryAbility#onDestroy', taskId);
    }
  }

  /**
   * Called when the window stage is created; loads the main page content.
   *
   * @param windowStage - Window stage used to load the page content.
   */
  onWindowStageCreate(windowStage: window.WindowStage): void {
    const taskId: number = ++traceTaskIdCounter;
    hiTraceMeter.startTrace('EntryAbility#onWindowStageCreate', taskId);
    try {
      Logger.info('EntryAbility#onWindowStageCreate: window stage created');
      // Load the Index page as the root content of the window.
      windowStage.loadContent('pages/Index', (error: BusinessError) => {
        if (error.code) {
          // Surface the failure code and message when page loading fails.
          Logger.error('EntryAbility#onWindowStageCreate: loadContent failed: ' + error.code + ', ' + error.message);
          return;
        }
        Logger.info('EntryAbility#onWindowStageCreate: loadContent success');
      });
      // Follow the system dark or light setting instead of forcing a fixed mode.
      try {
        this.context.getApplicationContext().setColorMode(ConfigurationConstant.ColorMode.COLOR_MODE_NOT_SET);
      } catch (error) {
        const err: BusinessError = error as BusinessError;
        Logger.error('EntryAbility#onWindowStageCreate: setColorMode failed: ' + err.code + ', ' + err.message);
      }
    } finally {
      hiTraceMeter.finishTrace('EntryAbility#onWindowStageCreate', taskId);
    }
  }

  /**
   * Called when the window stage is destroyed.
   */
  onWindowStageDestroy(): void {
    // Record the teardown moment for lifecycle diagnostics.
    Logger.info('EntryAbility#onWindowStageDestroy: window stage destroyed');
  }

  /**
   * Called when the ability moves to the foreground.
   */
  onForeground(): void {
    const taskId: number = ++traceTaskIdCounter;
    hiTraceMeter.startTrace('EntryAbility#onForeground', taskId);
    try {
      // Record the foreground switch for lifecycle diagnostics.
      Logger.info('EntryAbility#onForeground: ability moved to foreground');
    } finally {
      hiTraceMeter.finishTrace('EntryAbility#onForeground', taskId);
    }
  }

  /**
   * Called when the ability moves to the background.
   */
  onBackground(): void {
    const taskId: number = ++traceTaskIdCounter;
    hiTraceMeter.startTrace('EntryAbility#onBackground', taskId);
    try {
      // Record the background switch for lifecycle diagnostics.
      Logger.info('EntryAbility#onBackground: ability moved to background');
    } finally {
      hiTraceMeter.finishTrace('EntryAbility#onBackground', taskId);
    }
  }
}
