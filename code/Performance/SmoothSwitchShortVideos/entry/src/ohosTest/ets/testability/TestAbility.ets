/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import UIAbility from '@ohos.app.ability.UIAbility';
import registry from '@ohos.app.ability.abilityDelegatorRegistry';
import hilog from '@ohos.hilog';
import window from '@ohos.window';
import { runHypiumSession } from '../test/Shared/HypiumSession';
import testsuite from '../test/List.test';

const DOMAIN: number = 0x0000;
const TAG: string = 'ShortVideoTestAbility';
const TEST_PAGE: string = 'testability/pages/Index';
const DEFAULT_CASE_TIMEOUT: string = '90000';

export default class TestAbility extends UIAbility {
  private loading: boolean = false;
  private pageReady: boolean = false;
  private foreground: boolean = false;
  private started: boolean = false;
  private destroyed: boolean = false;

  onCreate(): void {
    hilog.info(DOMAIN, TAG, 'Test ability created');
  }

  onWindowStageCreate(stage: window.WindowStage): void {
    if (this.loading) {
      hilog.warn(DOMAIN, TAG, 'Ignoring duplicate window-stage creation');
      return;
    }
    this.loading = true;
    this.loadTestPageAndRun(stage);
  }

  private async loadTestPageAndRun(stage: window.WindowStage): Promise<void> {
    const delegator = registry.getAbilityDelegator();
    try {
      hilog.info(DOMAIN, TAG, 'Loading instrumentation page');
      await stage.getMainWindowSync().setWindowKeepScreenOn(true);
      await stage.loadContent(TEST_PAGE);
      if (this.destroyed) {
        await delegator.finishTest('Test ability destroyed before registration', 1);
        return;
      }
      this.pageReady = true;
      this.startWhenReady();
    } catch (error) {
      hilog.error(DOMAIN, TAG, 'Test initialization failed: %{public}s', String(error));
      await delegator.finishTest('Unable to initialize the Hypium test session', 1);
    }
  }

  private startWhenReady(): void {
    if (!this.pageReady || !this.foreground || this.started || this.destroyed) {
      return;
    }
    this.started = true;
    setTimeout((): void => {
      if (!this.destroyed) {
        this.runTests();
      }
    }, 0);
  }

  private async runTests(): Promise<void> {
    const delegator = registry.getAbilityDelegator();
    const args = registry.getArguments();
    if (!args.parameters['timeout'] && !args.parameters['-s timeout']) {
      args.parameters['timeout'] = DEFAULT_CASE_TIMEOUT;
    }
    try {
      hilog.info(DOMAIN, TAG, 'Registering Hypium suites after foreground');
      await runHypiumSession(delegator, args, testsuite);
    } catch (error) {
      hilog.error(DOMAIN, TAG, 'Test registration failed: %{public}s', String(error));
      await delegator.finishTest('Unable to register the Hypium test session', 1);
    }
  }

  // Keep lifecycle logging useful when a device test moves the demo to the background.
  // Neither foreground nor background callbacks register suites again.
  onWindowStageDestroy(): void {
    hilog.info(DOMAIN, TAG, 'Test window stage destroyed');
  }

  onForeground(): void {
    this.foreground = true;
    hilog.info(DOMAIN, TAG, 'Test ability in foreground');
    this.startWhenReady();
  }

  onBackground(): void {
    this.foreground = false;
    hilog.info(DOMAIN, TAG, 'Test ability in background');
  }

  onDestroy(): void {
    this.destroyed = true;
    hilog.info(DOMAIN, TAG, 'Test ability destroyed');
  }
}
