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
import { window } from '@kit.ArkUI';
import { bindStrings } from '../../../main/ets/i18n/Strings';
import { logWarning } from '../../../main/ets/services/Logger';
import { attachRecycleUiQaAbility, detachRecycleUiQaAbility,
  RecycleUiQaAbilitySession } from '../support/RecycleUiQaSupport';

/** This ability is installed only in entry_test; it never starts EntryAbility. */
export default class FeatureQaAbility extends UIAbility {
  private scenario: string = 'empty';
  private allowed: boolean = false;
  private stage: window.WindowStage | undefined = undefined;
  private qaSession: RecycleUiQaAbilitySession | undefined = undefined;

  onCreate(want: Want, _launchParam: AbilityConstant.LaunchParam): void {
    // Native UI uses the real device locale, never the pure-model baseline provider.
    bindStrings(this.context.getApplicationContext());
    this.selectPage(want);
  }

  onNewWant(want: Want, _launchParam: AbilityConstant.LaunchParam): void {
    this.selectPage(want);
    const stage = this.stage;
    if (stage !== undefined) {
      this.loadPage(stage);
    }
  }

  private selectPage(want: Want): void {
    const parameters = want.parameters;
    this.allowed = parameters !== undefined && parameters['testPage'] === 'RecycleUiQa';
    const scenario = parameters === undefined ? undefined : parameters['qaScenario'];
    this.scenario = typeof scenario === 'string' ? scenario : 'empty';
    if (this.allowed && this.qaSession === undefined) {
      this.qaSession = attachRecycleUiQaAbility(this.context);
    }
  }

  onWindowStageCreate(stage: window.WindowStage): void {
    this.stage = stage;
    this.loadPage(stage);
  }

  onWindowStageDestroy(): void {
    this.stage = undefined;
  }

  onDestroy(): void {
    const session = this.qaSession;
    this.qaSession = undefined;
    if (session !== undefined) { detachRecycleUiQaAbility(session); }
  }

  private loadPage(stage: window.WindowStage): void {
    if (!this.allowed) {
      logWarning('FeatureQaAbility requires allowlisted testPage=RecycleUiQa');
      return;
    }
    const storage = new LocalStorage();
    storage.setOrCreate('qaScenario', this.scenario);
    stage.loadContent('testpages/RecycleUiQaHarness', storage, (error): void => {
      if (error.code) {
        logWarning(`Recycle QA page load failed; code=${error.code}`);
      }
    });
  }
}
