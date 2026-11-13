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

import { AbilityConstant, common, UIAbility, Want } from '@kit.AbilityKit';
import { window } from '@kit.ArkUI';
import { getTextResolver, setTextResolver, TextResolver } from '../../../main/ets/autostart/text/LocalizedText';
import { claimUiTestSession, UiTestSession } from '../support/UiTestRuntime';
import { ArchiveUiQaFixture, archiveQaErrorCode, disposeArchiveUiQa, mountArchiveUiQa } from '../support/ArchiveUiQaSupport';
import { testFailure } from '../support/TestLog';

/** One exact session owns this Ability, its fixture, and its destruction acknowledgment. */
export default class FeatureQaAbility extends UIAbility {
  private scenario: string = 'empty';
  private stage: window.WindowStage | undefined = undefined;
  private session: UiTestSession | undefined = undefined;
  private owner: common.UIAbilityContext | undefined = undefined;
  private fixture: ArchiveUiQaFixture | undefined = undefined;
  private previousResolver: TextResolver | undefined = undefined;
  private installedResolver: TextResolver | undefined = undefined;

  onCreate(want: Want, _launchParam: AbilityConstant.LaunchParam): void {
    this.selectPage(want);
  }

  onNewWant(want: Want, _launchParam: AbilityConstant.LaunchParam): void {
    const existing = this.session;
    if (existing !== undefined) {
      // A delayed Want from A must never close or mutate the valid B instance.
      if (want.parameters === undefined || want.parameters['sampleUiSession'] !== existing.id) {
        testFailure('Stale Archive QA Want rejected without changing the current owner');
      }
      return; // A duplicate same-session launch is idempotent, not a second fixture mount.
    }
    this.selectPage(want);
    const stage = this.stage;
    if (stage !== undefined) { this.loadPage(stage); }
  }

  private selectPage(want: Want): void {
    const owner = this.context;
    const session = claimUiTestSession(want, owner);
    if (session === undefined) {
      testFailure('Archive QA launch did not claim its exact UI session');
      void owner.terminateSelf().catch((): void => {
        testFailure('Unclaimed Archive QA Ability termination failed');
      });
      return;
    }
    this.session = session;
    this.owner = owner;
    try {
      session.requireLive();
    } catch (_) {
      // A timed-out start may arrive late. Never load it or attach it to a later case.
      void session.close().catch((): void => {
        testFailure('Retired Archive QA owner is draining through its session cleanup');
      });
      return;
    }
    const parameters = want.parameters;
    if (parameters === undefined || parameters['testPage'] !== 'ArchiveUiQa') {
      session.failInitialization('archive-page-allowlist');
      return;
    }
    const scenario = parameters['qaScenario'];
    this.scenario = typeof scenario === 'string' ? scenario : 'empty';
  }

  onWindowStageCreate(stage: window.WindowStage): void {
    this.stage = stage;
    this.loadPage(stage);
  }

  onWindowStageDestroy(): void { this.stage = undefined; }

  private loadPage(stage: window.WindowStage): void {
    const session = this.session;
    const owner = this.owner;
    if (session === undefined || owner === undefined) { return; }
    try { session.requireLive(); } catch (_) { return; }
    if (this.fixture !== undefined) {
      session.failInitialization('archive-fixture-ownership');
      return;
    }
    let phase: string = 'archive-resource-context';
    try {
      // Bind the real Ability locale before constructing any model or initial notice.
      this.previousResolver = getTextResolver();
      const resolver: TextResolver = (key: string): string => owner.resourceManager.getStringByNameSync(key);
      this.installedResolver = resolver;
      setTextResolver(resolver);
      phase = 'archive-fixture-ownership';
      const fixture = mountArchiveUiQa(session, owner);
      this.fixture = fixture;
      void this.initializePage(stage, session, fixture);
    } catch (error) {
      session.failInitialization(phase, archiveQaErrorCode(error as Error));
    }
  }

  private async initializePage(stage: window.WindowStage, session: UiTestSession,
    fixture: ArchiveUiQaFixture): Promise<void> {
    let phase: string = 'archive-fixture-initialize';
    try {
      await fixture.initialize(this.scenario);
      session.requireLive();
      if (this.stage !== stage || this.session !== session || this.fixture !== fixture) {
        throw new Error('Archive owner changed before page load');
      }
      phase = 'archive-load-content';
      const storage = new LocalStorage();
      storage.setOrCreate('qaSessionId', session.id);
      stage.loadContent('testpages/ArchiveUiQaHarness', storage, (error): void => {
        if (error.code) { session.failInitialization('archive-load-content', error.code); }
      });
    } catch (error) {
      session.failInitialization(phase, archiveQaErrorCode(error as Error));
    }
  }

  onDestroy(): void {
    const session = this.session;
    const owner = this.owner;
    const fixture = this.fixture;
    this.session = undefined;
    this.owner = undefined;
    this.fixture = undefined;
    this.stage = undefined;
    if (session === undefined || owner === undefined) { return; }
    session.retire();
    const previousResolver = this.previousResolver;
    const installedResolver = this.installedResolver;
    this.previousResolver = undefined;
    this.installedResolver = undefined;
    // A rejected fixture cleanup must not skip resource restoration or destruction acknowledgment.
    void this.disposeOwned(session, owner, fixture, previousResolver, installedResolver);
  }

  private async disposeOwned(session: UiTestSession, owner: common.UIAbilityContext,
    fixture: ArchiveUiQaFixture | undefined, previousResolver: TextResolver | undefined,
    installedResolver: TextResolver | undefined): Promise<void> {
    try {
      if (fixture !== undefined) {
        try {
          await disposeArchiveUiQa(fixture);
        } catch (error) {
          session.failCleanup('archive-fixture-dispose', archiveQaErrorCode(error as Error));
        }
      }
      try {
        // An old owner may restore only the resolver it actually installed.
        if (installedResolver !== undefined && getTextResolver() === installedResolver) {
          setTextResolver(previousResolver);
        }
      } catch (error) {
        session.failCleanup('archive-resource-restore', archiveQaErrorCode(error as Error));
      }
    } finally {
      session.markDestroyed(owner);
    }
  }
}
