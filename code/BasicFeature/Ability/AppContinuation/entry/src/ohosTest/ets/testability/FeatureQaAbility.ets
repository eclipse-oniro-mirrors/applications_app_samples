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
import { UiTestSession, claimUiTestSession } from '../support/UiTestRuntime';
import { testError } from '../support/TestLog';
import {
  WorkspaceBackupUiQaFixture, mountWorkspaceBackupUiQa, releaseWorkspaceBackupUiQa
} from '../support/WorkspaceBackupUiQaSupport';

/** Test-only owned host. A stale Want must never replace or terminate another session. */
export default class FeatureQaAbility extends UIAbility {
  private selection: string = '';
  private fixture: WorkspaceBackupUiQaFixture | undefined = undefined;
  private session: UiTestSession | undefined = undefined;
  private owner: common.UIAbilityContext | undefined = undefined;
  private stage: window.WindowStage | undefined = undefined;

  public onCreate(want: Want, _launchParam: AbilityConstant.LaunchParam): void {
    this.initialize(want);
  }

  public onNewWant(want: Want, _launchParam: AbilityConstant.LaunchParam): void {
    if (!this.initialize(want)) { return; }
    const stage = this.stage;
    if (stage !== undefined) { this.loadHarness(stage); }
  }

  private initialize(want: Want): boolean {
    const owner = this.owner === undefined ? this.context : this.owner;
    let session: UiTestSession | undefined = undefined;
    try { session = claimUiTestSession(want, owner); }
    catch (error) { testError('backup session claim failed; existing host was not changed'); return false; }
    if (session === undefined) { return false; }
    if (this.session !== undefined && this.session !== session) {
      session.failInitialization('backup.ownerReuse');
      return false;
    }
    this.session = session;
    this.owner = owner;
    try {
      session.requireLive();
      const parameters = want.parameters;
      if (parameters === undefined || parameters['testPage'] !== 'WorkspaceBackupUiQa') {
        throw new Error('UI test page is not allowlisted');
      }
      const supplied = parameters['qaScenario'];
      const selection: string = typeof supplied === 'string' ? supplied : 'empty';
      if (this.fixture !== undefined) {
        if (this.selection !== selection) { throw new Error('An owned UI fixture cannot change selection'); }
        return false;
      }
      this.selection = selection;
      this.fixture = mountWorkspaceBackupUiQa(selection, owner, session);
      return true;
    } catch (error) {
      session.failInitialization('backup.mount');
      return false;
    }
  }

  public onWindowStageCreate(stage: window.WindowStage): void {
    this.stage = stage;
    this.loadHarness(stage);
  }

  public onWindowStageDestroy(): void { this.stage = undefined; }

  public onDestroy(): void {
    const fixture = this.fixture;
    const session = this.session;
    const owner = this.owner;
    this.fixture = undefined;
    try {
      if (fixture !== undefined) {
        try { releaseWorkspaceBackupUiQa(fixture); }
        catch (error) { session?.failCleanup('backup.fixture'); }
      }
    } finally {
      this.stage = undefined;
      this.session = undefined;
      this.owner = undefined;
      // Acknowledge only after all exact-fixture cleanup steps have been attempted.
      if (session !== undefined && owner !== undefined) { session.markDestroyed(owner); }
    }
  }

  private loadHarness(stage: window.WindowStage): void {
    const session = this.session;
    if (session === undefined || this.fixture === undefined) { return; }
    try {
      session.requireLive();
      const storage = new LocalStorage();
      storage.setOrCreate('qaScenario', this.selection);
      storage.setOrCreate('uiSessionId', session.id);
      stage.loadContent('testpages/WorkspaceBackupUiQaHarness', storage, (error): void => {
        if (error.code) { session.failInitialization('backup.loadContent', error.code); }
      });
    } catch (error) {
      session.failInitialization('backup.loadDispatch');
    }
  }
}
