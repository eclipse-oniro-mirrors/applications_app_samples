/*
 * Copyright (c) 2022-2026 Huawei Device Co., Ltd.
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

import Ability from '@ohos.app.ability.UIAbility';
import AbilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry';
import AbilityConstant from '@ohos.app.ability.AbilityConstant';
import { Configuration } from '@ohos.app.ability.Configuration';
import Want from '@ohos.app.ability.Want';
import window from '@ohos.window';
import hilog from '@ohos.hilog';
import { Hypium } from '@ohos/hypium';
import { startBrowserApp } from '../test/Shared/BrowserTestKit';
import testsuite from '../test/List.test';

const DOMAIN: number = 0xF811;
const TAG: string = 'BrowserTestAbility';
const FORMAT: string = '%{public}s';

/** Entry ability of the sample under test. */
const TARGET_ABILITY: string = 'MainAbility';

/** Delay that lets the window manager settle before the app is started. */
const LAUNCH_DELAY_MS: number = 1000;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, FORMAT, message);
}

function logError(message: string): void {
  hilog.error(DOMAIN, TAG, FORMAT, message);
}

/**
 * Serializes a value for logging without ever throwing.
 *
 * `JSON.stringify` aborts on circular structures, and an exception inside
 * `onCreate` would take the whole test ability down before any suite runs.
 */
function safeJson(value: Object): string {
  try {
    const text: string = JSON.stringify(value);
    return text === undefined ? '' : text;
  } catch (error) {
    return '[unserializable]';
  }
}

/**
 * Starts the browser sample so that UI suites have a live window.
 *
 * The ohosTest ability and the application under test are two different
 * abilities, therefore the sample must be launched explicitly before Hypium
 * begins to drive the UiTest driver. The launch helper bounds its waits so a
 * stuck ability manager cannot freeze the suite.
 */

/**
 * Runs the hypium suite in both the happy and the degraded path.
 *
 * A failed application launch must not hide the assertion results, otherwise a
 * broken sample would silently turn into "no test executed".
 */
function runHypiumSuite(reason: string): void {
  logInfo(`run hypium suite, reason: ${reason}`);
  const delegator = AbilityDelegatorRegistry.getAbilityDelegator();
  const args = AbilityDelegatorRegistry.getArguments();
  Hypium.hypiumTest(delegator, args, testsuite);
}

export default class TestAbility extends Ability {
  private started: boolean = false;

  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    logInfo('TestAbility onCreate');
    logInfo(`want: ${safeJson(want)}`);
    logInfo(`launchParam: ${safeJson(launchParam)}`);
    logInfo('schedule browser launch and suite execution');
    setTimeout(() => {
      startBrowserApp()
        .then(() => {
          this.started = true;
          logInfo('browser application launched');
          runHypiumSuite('application launched');
        })
        .catch((error: Error) => {
          this.started = false;
          logError(`failed to launch browser application: ${error.message}`);
          runHypiumSuite('launch failed, fallback to direct run');
        });
    }, LAUNCH_DELAY_MS);
  }

  onDestroy(): void {
    logInfo(`TestAbility onDestroy, started=${this.started}`);
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    logInfo('TestAbility onWindowStageCreate');
    windowStage.loadContent('testability/pages/Index', (err, data) => {
      if (err.code) {
        logError(`failed to load the content: ${JSON.stringify(err)}`);
        return;
      }
      logInfo(`succeeded in loading the content: ${JSON.stringify(data)}`);
    });
    this.keepScreenOn(windowStage);
  }

  /**
   * Keeps the panel awake for the whole run.
   *
   * A full suite takes far longer than the TV idle timeout, and the standby
   * service launches com.ohos.screensaver when no input arrives. That puts the
   * test ability in the background, freezes the process and leaves `aa test`
   * waiting forever (the runner then reports "Expected N tests, received M").
   */
  private keepScreenOn(windowStage: window.WindowStage): void {
    try {
      const mainWindow: window.Window = windowStage.getMainWindowSync();
      mainWindow.setWindowKeepScreenOn(true).then(() => {
        logInfo('keep screen on enabled for the test run');
      }).catch((error: Error) => {
        logError(`setWindowKeepScreenOn failed: ${error.message}`);
      });
    } catch (error) {
      logError(`getMainWindowSync failed: ${JSON.stringify(error)}`);
    }
  }

  onWindowStageDestroy(): void {
    logInfo('TestAbility onWindowStageDestroy');
  }

  onWindowStageRestore(windowStage: window.WindowStage): void {
    logInfo('TestAbility onWindowStageRestore');
  }

  onForeground(): void {
    logInfo('TestAbility onForeground');
  }

  onBackground(): void {
    logInfo('TestAbility onBackground');
  }

  onConfigurationUpdate(newConfig: Configuration): void {
    logInfo(`TestAbility onConfigurationUpdate: ${JSON.stringify(newConfig)}`);
  }
}
