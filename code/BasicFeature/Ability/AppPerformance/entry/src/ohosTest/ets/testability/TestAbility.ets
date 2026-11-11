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
import { logError } from '../../../main/ets/core/Logger';
import { attachUiTestAbility, detachUiTestAbility, UiTestAbilitySession } from '../support/UiTestSupport';

/** Test-module routing only. The original ReactiveUi launch remains the default. */
export default class TestAbility extends UIAbility {
  private page: string = 'testability/pages/ReactivePage';
  private scenario: string = 'empty';
  private stage: window.WindowStage | undefined = undefined;
  private session: UiTestAbilitySession | undefined = undefined;

  onCreate(want: Want, _launchParam: AbilityConstant.LaunchParam): void {
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
    // Never load an arbitrary route supplied by a Want.
    const requested = want.parameters === undefined ? undefined : want.parameters['testPage'];
    this.page = requested === 'SeriesUiQa' ? 'testpages/SeriesUiQaHarness' : 'testability/pages/ReactivePage';
    const scenario = want.parameters === undefined ? undefined : want.parameters['qaScenario'];
    this.scenario = typeof scenario === 'string' ? scenario : 'empty';
    if (this.session === undefined) {
      this.session = attachUiTestAbility(this.context);
    }
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    this.stage = windowStage;
    this.loadPage(windowStage);
  }

  onWindowStageDestroy(): void {
    this.stage = undefined;
  }

  onDestroy(): void {
    const session = this.session;
    this.session = undefined;
    if (session !== undefined) { detachUiTestAbility(session); }
  }

  private loadPage(stage: window.WindowStage): void {
    const storage = new LocalStorage();
    storage.setOrCreate('qaScenario', this.scenario);
    const page = this.page;
    const session = this.session;
    const generation = session === undefined ? 0 : session.beginLoad(page);
    try {
      stage.loadContent(page, storage, (error): void => {
        const failure = error !== undefined && error.code ? `${error.code} ${error.message}` : '';
        if (session !== undefined) { session.finishLoad(generation, page, failure); }
        if (failure.length > 0) { logError(`Test page load failed: ${failure}`); }
      });
    } catch (error) {
      const failure = (error as Error).message;
      if (session !== undefined) { session.finishLoad(generation, page, failure); }
      logError(`Test page load failed: ${failure}`);
    }
  }
}
