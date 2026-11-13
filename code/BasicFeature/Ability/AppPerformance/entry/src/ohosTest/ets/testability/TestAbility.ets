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
import { claimUiTestSession, UiTestSession } from '../support/UiTestRuntime';
import { releaseSeriesUiQa } from '../support/SeriesUiQaSupport';

/** Test-module routing and exact Want/session ownership; no production Ability is replaced. */
export default class TestAbility extends UIAbility {
  private page: string = 'testability/pages/ReactivePage';
  private scenario: string = 'empty';
  private stage: window.WindowStage | undefined = undefined;
  private session: UiTestSession | undefined = undefined;
  private loadGeneration: number = 0;

  onCreate(want: Want, _launchParam: AbilityConstant.LaunchParam): void {
    if (!this.selectPage(want) && this.session === undefined) {
      this.context.terminateSelf().catch((): void => { logError('Obsolete test Ability could not terminate'); });
    }
  }

  onNewWant(want: Want, _launchParam: AbilityConstant.LaunchParam): void {
    // An obsolete nonce delivered to a valid later instance must not destroy or reset that instance.
    if (this.session !== undefined) {
      const claimed = claimUiTestSession(want, this.context);
      if (claimed !== this.session) { return; }
      return; // Duplicate Want for this exact lease is not a new launch or route change.
    }
    if (this.selectPage(want) && this.stage !== undefined) { this.loadPage(this.stage); }
  }

  private selectPage(want: Want): boolean {
    const session = claimUiTestSession(want, this.context);
    if (session === undefined) { return false; }
    this.session = session;
    try { session.requireLive(); } catch (error) {
      session.failInitialization('obsolete-onCreate');
      session.close().catch((): void => { logError('Late owned test Ability cleanup failed'); });
      return false;
    }
    const requested = want.parameters === undefined ? undefined : want.parameters['testPage'];
    this.page = requested === 'SeriesUiQa' ? 'testpages/SeriesUiQaHarness' : 'testability/pages/ReactivePage';
    const scenario = want.parameters === undefined ? undefined : want.parameters['qaScenario'];
    this.scenario = typeof scenario === 'string' ? scenario : 'empty';
    return true;
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    this.stage = windowStage;
    this.loadPage(windowStage);
  }
  onWindowStageDestroy(): void { this.stage = undefined; }

  onDestroy(): void {
    const session = this.session; this.session = undefined; this.loadGeneration++;
    if (session === undefined) { return; }
    try {
      releaseSeriesUiQa(session);
    } catch (error) {
      session.failCleanup('series-fixture-release');
    } finally {
      // Restores this session's saved provider before the final destruction acknowledgement.
      session.markDestroyed(this.context);
    }
  }

  private loadPage(stage: window.WindowStage): void {
    const session = this.session;
    if (session === undefined) { return; }
    try {
      session.requireLive();
      const storage = new LocalStorage();
      storage.setOrCreate('qaScenario', this.scenario);
      storage.setOrCreate('uiSessionId', session.id);
      const generation = ++this.loadGeneration;
      stage.loadContent(this.page, storage, (error): void => {
        if (this.session !== session || generation !== this.loadGeneration) { return; }
        if (error !== undefined && error.code) {
          session.failInitialization('loadContent', error.code);
          logError('Owned test page load failed');
        }
      });
    } catch (error) {
      session.failInitialization('loadContent-dispatch');
      logError('Owned test page load dispatch failed');
    }
  }
}
