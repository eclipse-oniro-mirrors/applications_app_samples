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

import { AbilityConstant, UIAbility, Want, common } from '@kit.AbilityKit';
import { window } from '@kit.ArkUI';
import { bindStrings } from '../../../main/ets/i18n/Strings';
import { logWarning } from '../../../main/ets/services/Logger';
import { UiTestSession, claimUiTestSession } from '../support/UiTestRuntime';
import { attachRecycleUiQaAbility, detachRecycleUiQaAbility, finishRecycleUiQa,
  RecycleUiQaAbilitySession } from '../support/RecycleUiQaSupport';

/** Test-only Ability; a session nonce and the allowlisted page are both required. */
export default class FeatureQaAbility extends UIAbility {
  private scenario: string = 'empty';
  private allowed: boolean = false;
  private stage: window.WindowStage | undefined = undefined;
  private qaSession: RecycleUiQaAbilitySession | undefined = undefined;
  private uiSession: UiTestSession | undefined = undefined;
  private ownedContext: common.UIAbilityContext | undefined = undefined;

  onCreate(want: Want, _launchParam: AbilityConstant.LaunchParam): void { this.selectPage(want); }
  onNewWant(want: Want, _launchParam: AbilityConstant.LaunchParam): void {
    const existing = this.uiSession;
    if (existing !== undefined) {
      const parameters = want.parameters;
      if (parameters === undefined || parameters['testPage'] !== 'RecycleUiQa' ||
        parameters['sampleUiSession'] !== existing.id) { return; }
      // A valid same-nonce repeat is also idempotent: preserve this fixture, resources and page.
      return;
    }
    // A stale nonce must not reload, reset resources or terminate a valid newer instance.
    if (!this.selectPage(want)) { return; }
    const stage = this.stage;
    if (stage !== undefined) { this.loadPage(stage); }
  }
  private selectPage(want: Want): boolean {
    const parameters = want.parameters;
    if (parameters === undefined || parameters['testPage'] !== 'RecycleUiQa') { return false; }
    const context = this.context;
    const session = claimUiTestSession(want, context);
    if (session === undefined) { return false; }
    // Save the exact lease and Context even on a retired late attach, so onDestroy can acknowledge it.
    this.uiSession = session;
    this.ownedContext = context;
    try { session.requireLive(); } catch (_) { return false; }
    if (this.qaSession === undefined) {
      this.qaSession = attachRecycleUiQaAbility(context, session);
    } else if (this.qaSession.runtime !== session) {
      session.failInitialization('ability-session-reuse');
      return false;
    }
    const scenario = parameters['qaScenario'];
    this.scenario = typeof scenario === 'string' ? scenario : 'empty';
    this.allowed = true;
    bindStrings(context.getApplicationContext());
    return true;
  }
  onWindowStageCreate(stage: window.WindowStage): void { this.stage = stage; this.loadPage(stage); }
  onWindowStageDestroy(): void { this.stage = undefined; }
  onDestroy(): void {
    const owner = this.qaSession;
    const session = this.uiSession;
    const context = this.ownedContext;
    this.qaSession = undefined; this.uiSession = undefined; this.ownedContext = undefined;
    this.allowed = false; this.stage = undefined;
    try {
      if (owner !== undefined) { finishRecycleUiQa(owner); }
    } catch (_) { if (session !== undefined) { session.failCleanup('owner-fixture-cleanup'); } }
    finally {
      try {
        if (owner !== undefined) { detachRecycleUiQaAbility(owner); }
      } catch (_) {
        if (session !== undefined) { session.failCleanup('owner-detach'); }
      } finally {
        // markDestroyed is last, after all fixture/resource cleanup, with the saved exact Context.
        if (session !== undefined && context !== undefined) { session.markDestroyed(context); }
      }
    }
  }
  private loadPage(stage: window.WindowStage): void {
    const session = this.uiSession;
    if (!this.allowed || session === undefined) { return; }
    try { session.requireLive(); } catch (_) { return; }
    const storage = new LocalStorage();
    storage.setOrCreate('qaScenario', this.scenario);
    storage.setOrCreate('qaSessionId', session.id);
    try {
      stage.loadContent('testpages/RecycleUiQaHarness', storage, (error): void => {
        if (error.code) {
          session.failInitialization('loadContent', error.code);
          logWarning(`Recycle QA page load failed; code=${error.code}`);
        }
      });
    } catch (_) { session.failInitialization('loadContent-dispatch'); }
  }
}
