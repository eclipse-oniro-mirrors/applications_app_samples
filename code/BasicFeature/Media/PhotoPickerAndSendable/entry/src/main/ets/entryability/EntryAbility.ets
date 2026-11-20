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
import { BusinessError } from '@kit.BasicServicesKit';
import { Logger, Trace } from 'photopickersendable';

// Module-scoped log tag so ability sessions can be filtered out of the shared hilog stream.
const TAG: string = 'EntryAbility';

/**
 * Application entry ability.
 * Only lifecycle glue lives here: page loading, colour mode and observability hooks,
 * so that every other module stays free of ability-level concerns.
 */
export default class EntryAbility extends UIAbility {
  /**
   * Called once when the ability instance is created.
   * The UI does not exist yet, so only bookkeeping work is allowed here.
   * @param want Launch parameters supplied by the caller.
   * @param launchParam Launch reason and timestamp supplied by the framework.
   */
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    // Wrap the callback in a trace slice so cold-start latency can be split per stage.
    Trace.withSync('EntryAbility.onCreate', () => {
      // Log the creation event without printing want payload, which may hold user data.
      Logger.info(TAG, 'onCreate');
    });
  }

  /**
   * Called when the ability is destroyed; used as the last chance to release resources.
   */
  onDestroy(): void {
    // Trace the destruction so the ability lifetime appears as a closed slice in the trace view.
    Trace.withSync('EntryAbility.onDestroy', () => {
      // Record the destruction event for lifetime accounting.
      Logger.info(TAG, 'onDestroy');
    });
  }

  /**
   * Called after the window stage is created, which is where the first page gets attached.
   * @param windowStage Window stage owned by this ability.
   */
  onWindowStageCreate(windowStage: window.WindowStage): void {
    // Trace the whole stage creation, including content loading and colour-mode setup.
    Trace.withSync('EntryAbility.onWindowStageCreate', () => {
      // Announce the stage before loading content so the log order mirrors the real sequence.
      Logger.info(TAG, 'onWindowStageCreate');
      // Load the home page; the callback reports bundle resolution or rendering errors.
      windowStage.loadContent('pages/Index', (err: BusinessError) => {
        // A non-zero code means the page could not be resolved or loaded.
        if (err.code) {
          // Dump the full error object so the failure stays diagnosable on a real device.
          Logger.error(TAG, 'Failed to load the content. Cause: ' + JSON.stringify(err));
          // Stop before touching the stage, leaving the failure visible instead of masking it.
          return;
        }
        // Success path: the page is attached to the stage and the first frame will follow.
        Logger.info(TAG, 'Succeeded in loading the content.');
      });

      // Colour mode is applied after content loading to keep the original call order.
      try {
        // Follow the system theme instead of pinning the app to one colour mode.
        this.context.getApplicationContext().setColorMode(ConfigurationConstant.ColorMode.COLOR_MODE_NOT_SET);
        // Record the applied mode so later day/night issues can be diffed against expectations.
        Logger.debug(TAG, 'setColorMode COLOR_MODE_NOT_SET');
      } catch (error) {
        // Colour mode only affects appearance, so the failure is logged and never rethrown.
        Logger.error(TAG, 'Failed to set colorMode. Cause: ' + JSON.stringify(error));
      }
    });
  }

  /**
   * Called when the window stage is destroyed; the UI tree is no longer usable afterwards.
   */
  onWindowStageDestroy(): void {
    // Trace the teardown to keep the stage lifetime visible next to its creation slice.
    Trace.withSync('EntryAbility.onWindowStageDestroy', () => {
      // Record the teardown event before the stage reference becomes invalid.
      Logger.info(TAG, 'onWindowStageDestroy');
    });
  }

  /**
   * Called when the ability moves to the foreground and becomes interactive.
   */
  onForeground(): void {
    // Trace the foreground transition so user-visible latency can be measured.
    Trace.withSync('EntryAbility.onForeground', () => {
      // Record the transition for foreground/background session accounting.
      Logger.info(TAG, 'onForeground');
    });
  }

  /**
   * Called when the ability moves to the background and stops being interactive.
   */
  onBackground(): void {
    // Trace the background transition so the visible session gets a closing slice.
    Trace.withSync('EntryAbility.onBackground', () => {
      // Record the transition for foreground/background session accounting.
      Logger.info(TAG, 'onBackground');
    });
  }
}
