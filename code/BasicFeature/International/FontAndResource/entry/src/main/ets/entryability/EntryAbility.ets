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

// Import the ability lifecycle types used by this entry ability.
import { AbilityConstant, UIAbility, Want } from '@kit.AbilityKit';
// Import the window module used to load the entry page.
import { window } from '@kit.ArkUI';
// Import the shared logging facade and trace helper from the library.
import { Logger, TraceUtil } from 'library';

// The module tag used for every log line emitted by this ability.
const TAG: string = 'EntryAbility';

// The application entry ability that owns the window stage lifecycle.
export default class EntryAbility extends UIAbility {
  // Called when the ability is created, before any window exists.
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    // Open a trace section around the creation phase.
    const taskId: number = TraceUtil.begin('EntryAbility.onCreate');
    // Log the creation with the launch parameters for diagnostics.
    Logger.info(TAG, `onCreate, launchReason=${launchParam.launchReason}`);
    // Close the trace section immediately after the synchronous body.
    TraceUtil.end('EntryAbility.onCreate', taskId);
  }

  // Called when the ability is destroyed, the last lifecycle callback.
  onDestroy(): void {
    // Log the destruction for lifecycle tracing.
    Logger.info(TAG, 'onDestroy');
  }

  // Called when the window stage is created and ready to load content.
  onWindowStageCreate(windowStage: window.WindowStage): void {
    // Open a trace section around the window stage setup.
    const taskId: number = TraceUtil.begin('EntryAbility.onWindowStageCreate');
    // Log the start of the window stage setup.
    Logger.info(TAG, 'onWindowStageCreate');
    // Load the entry page into the main window.
    windowStage.loadContent('pages/Index', (err) => {
      // Handle the load failure branch first.
      if (err.code) {
        // Log the failure with the full error payload.
        Logger.error(TAG, `Failed to load the content. Cause: ${JSON.stringify(err)}`);
        // Close the trace section on the failure path.
        TraceUtil.end('EntryAbility.onWindowStageCreate', taskId);
        // Stop after reporting the failure.
        return;
      }
      // Log the successful content load.
      Logger.info(TAG, 'Succeeded in loading the content.');
      // Close the trace section on the success path.
      TraceUtil.end('EntryAbility.onWindowStageCreate', taskId);
    });
  }

  // Called when the window stage is about to be destroyed.
  onWindowStageDestroy(): void {
    // Log the window stage teardown for lifecycle tracing.
    Logger.info(TAG, 'onWindowStageDestroy');
  }

  // Called when the ability moves to the foreground.
  onForeground(): void {
    // Log the foreground transition for lifecycle tracing.
    Logger.info(TAG, 'onForeground');
  }

  // Called when the ability moves to the background.
  onBackground(): void {
    // Log the background transition for lifecycle tracing.
    Logger.info(TAG, 'onBackground');
  }
}
