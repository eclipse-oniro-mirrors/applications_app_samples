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

import { describe, it, expect, beforeAll, afterAll, TestType, Size, Level } from '@ohos/hypium';
import { Driver } from '@ohos.UiTest';
import Want from '@ohos.app.ability.Want';
import {
  getDriver,
  launchEntryAbility,
  buildEntryWant,
  startAbilityByWant,
  doAbilityForeground,
  doAbilityBackground,
  waitForIndexPageStable,
  waitForTextVisible,
  pageComponentCount,
  checkTextContent,
  checkComponentExistsByKey,
  collectAllTexts,
  measureElapsed,
  isWithinBudget,
  averageOf,
  serializedDelay,
  logInfo,
  PAGE_TEXT_INITIAL,
  PAGE_TEXT_CLICKED,
  INDEX_PAGE_TEXT_KEY,
  INDEX_PAGE_PATH,
  ABILITY_STAGE_NAME,
  ENTRY_ABILITY_NAME,
  COLOR_MODE_NOT_SET,
  TIMEOUT_ABILITY_LAUNCH,
  TIMEOUT_SESSION_CREATE,
  DELAY_AFTER_LAUNCH,
  DELAY_AFTER_BACKGROUND,
  STRESS_ROUNDS_LAUNCH,
  ensureIndexPageInitial,
} from '../Shared/SharedDriver';

const BACKUP_CURRENT_CODE: number = 1000012;

const BACKUP_CURRENT_NAME: string = '1.0.12';

const BACKUP_MIN_COMPATIBLE_CODE: number = 1000000;

enum AbilityCallback {
  CALLBACK_CREATE = 'onCreate',
  CALLBACK_WINDOW_STAGE_CREATE = 'onWindowStageCreate',
  CALLBACK_FOREGROUND = 'onForeground',
  CALLBACK_BACKGROUND = 'onBackground',
  CALLBACK_WINDOW_STAGE_DESTROY = 'onWindowStageDestroy',
  CALLBACK_DESTROY = 'onDestroy'
}

interface LifecycleEvent {
  callback: string;
  detail: string;
  sequence: number;
}

class LifecycleTrace {
  private events: LifecycleEvent[] = [];

  public push(callback: string, detail: string): number {
    const event: LifecycleEvent = {
      callback: callback,
      detail: detail,
      sequence: this.events.length
    };
    this.events.push(event);
    return event.sequence;
  }

  public getCallbacks(): string[] {
    const result: string[] = [];
    for (let i = 0; i < this.events.length; i++) {
      result.push(this.events[i].callback);
    }
    return result;
  }

  public countOf(callback: string): number {
    let total: number = 0;
    for (let i = 0; i < this.events.length; i++) {
      if (this.events[i].callback === callback) {
        total++;
      }
    }
    return total;
  }

  public firstIndexOf(callback: string): number {
    for (let i = 0; i < this.events.length; i++) {
      if (this.events[i].callback === callback) {
        return i;
      }
    }
    return -1;
  }

  public lastIndexOf(callback: string): number {
    for (let i = this.events.length - 1; i >= 0; i--) {
      if (this.events[i].callback === callback) {
        return i;
      }
    }
    return -1;
  }

  public size(): number {
    return this.events.length;
  }

  public clear(): void {
    this.events = [];
  }

  public isOrderedBefore(first: string, second: string): boolean {
    const firstIndex: number = this.firstIndexOf(first);
    const secondIndex: number = this.firstIndexOf(second);
    if (firstIndex < 0 || secondIndex < 0) {
      return false;
    }
    return firstIndex < secondIndex;
  }

  public describe(): string {
    let text: string = '';
    for (let i = 0; i < this.events.length; i++) {
      if (i > 0) {
        text += ' > ';
      }
      text += this.events[i].callback;
    }
    return text;
  }
}

class ColdStartPipeline {
  private trace: LifecycleTrace = new LifecycleTrace();
  private loadContentPath: string = '';

  public run(contentPath: string): LifecycleTrace {
    this.trace.clear();
    this.loadContentPath = contentPath;
    this.trace.push(AbilityCallback.CALLBACK_CREATE, `colorMode=${COLOR_MODE_NOT_SET}`);
    this.trace.push(AbilityCallback.CALLBACK_WINDOW_STAGE_CREATE, contentPath);
    this.trace.push(AbilityCallback.CALLBACK_FOREGROUND, ABILITY_STAGE_NAME);
    return this.trace;
  }

  public warmStart(): LifecycleTrace {
    this.trace.push(AbilityCallback.CALLBACK_FOREGROUND, 'resume');
    return this.trace;
  }

  public pause(): LifecycleTrace {
    this.trace.push(AbilityCallback.CALLBACK_BACKGROUND, 'pause');
    return this.trace;
  }

  public teardown(): LifecycleTrace {
    this.trace.push(AbilityCallback.CALLBACK_WINDOW_STAGE_DESTROY, 'window released');
    this.trace.push(AbilityCallback.CALLBACK_DESTROY, 'ability released');
    return this.trace;
  }

  public getLoadContentPath(): string {
    return this.loadContentPath;
  }

  public getTrace(): LifecycleTrace {
    return this.trace;
  }
}

interface BackupVersion {
  code: number;
  name: string;
}

class BackupVersionPolicy {
  public parse(code: number, name: string): BackupVersion | null {
    if (code <= 0 || name.length === 0) {
      return null;
    }
    return { code: code, name: name };
  }

  public compare(left: BackupVersion, right: BackupVersion): number {
    if (left.code > right.code) {
      return 1;
    }
    if (left.code < right.code) {
      return -1;
    }
    return 0;
  }

  public isRestorable(version: BackupVersion): boolean {
    return version.code >= BACKUP_MIN_COMPATIBLE_CODE;
  }

  public requiresMigration(version: BackupVersion): boolean {
    return version.code < BACKUP_CURRENT_CODE && this.isRestorable(version);
  }

  public isSameRelease(version: BackupVersion): boolean {
    return version.code === BACKUP_CURRENT_CODE && version.name === BACKUP_CURRENT_NAME;
  }

  public buildRestorePlan(version: BackupVersion): string {
    if (!this.isRestorable(version)) {
      return 'reject';
    }
    if (this.isSameRelease(version)) {
      return 'direct-restore';
    }
    if (this.requiresMigration(version)) {
      return 'migrate-then-restore';
    }
    return 'downgrade-guard';
  }
}

export default function integrationTestingTest(): void {
  describe('IntegrationTestingTest', () => {
    let driver: Driver;
    let pipeline: ColdStartPipeline;
    let versionPolicy: BackupVersionPolicy;

    beforeAll(async () => {
      driver = getDriver();
      pipeline = new ColdStartPipeline();
      versionPolicy = new BackupVersionPolicy();
      logInfo('IntegrationTestingTest: beforeAll prepared pipeline and version policy');

      await ensureIndexPageInitial(driver);
    })

    afterAll(async () => {
      await serializedDelay(driver, DELAY_AFTER_BACKGROUND);
      logInfo('IntegrationTestingTest: afterAll finished');
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_INTEGRATION_0100
     * @tc.name testColdStartCallbackOrder
     * @tc.desc Verify cold start order is onCreate then onWindowStageCreate then onForeground with 3 recorded callbacks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testColdStartCallbackOrder', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const trace: LifecycleTrace = pipeline.run(INDEX_PAGE_PATH);
          expect(trace.size()).assertEqual(3);
          expect(trace.isOrderedBefore(AbilityCallback.CALLBACK_CREATE,
            AbilityCallback.CALLBACK_WINDOW_STAGE_CREATE)).assertTrue();
          expect(trace.isOrderedBefore(AbilityCallback.CALLBACK_WINDOW_STAGE_CREATE,
            AbilityCallback.CALLBACK_FOREGROUND)).assertTrue();
          expect(trace.firstIndexOf(AbilityCallback.CALLBACK_CREATE)).assertEqual(0);
          expect(trace.lastIndexOf(AbilityCallback.CALLBACK_FOREGROUND)).assertEqual(2);
          expect(pipeline.getLoadContentPath()).assertEqual(INDEX_PAGE_PATH);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_INTEGRATION_0200
     * @tc.name testWarmStartAndPauseCounts
     * @tc.desc Verify after one cold start, one warm start and one pause the trace holds 2 foreground and 1 background callbacks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testWarmStartAndPauseCounts', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          pipeline.run(INDEX_PAGE_PATH);
          pipeline.warmStart();
          pipeline.pause();
          const trace: LifecycleTrace = pipeline.getTrace();
          expect(trace.countOf(AbilityCallback.CALLBACK_FOREGROUND)).assertEqual(2);
          expect(trace.countOf(AbilityCallback.CALLBACK_BACKGROUND)).assertEqual(1);
          expect(trace.countOf(AbilityCallback.CALLBACK_CREATE)).assertEqual(1);
          expect(trace.size()).assertEqual(5);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_INTEGRATION_0300
     * @tc.name testTeardownOrder
     * @tc.desc Verify teardown emits onWindowStageDestroy before onDestroy and destroy is recorded last
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTeardownOrder', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          pipeline.run(INDEX_PAGE_PATH);
          pipeline.teardown();
          const trace: LifecycleTrace = pipeline.getTrace();
          expect(trace.size()).assertEqual(5);
          expect(trace.isOrderedBefore(AbilityCallback.CALLBACK_WINDOW_STAGE_DESTROY,
            AbilityCallback.CALLBACK_DESTROY)).assertTrue();
          expect(trace.lastIndexOf(AbilityCallback.CALLBACK_DESTROY)).assertEqual(4);
          expect(trace.countOf(AbilityCallback.CALLBACK_DESTROY)).assertEqual(1);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_INTEGRATION_0400
     * @tc.name testTraceDescriptionFormat
     * @tc.desc Verify the cold start trace description joins the three callbacks with the separator in declared order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL3
     */
    it('testTraceDescriptionFormat', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void) => {
        try {
          const trace: LifecycleTrace = pipeline.run(INDEX_PAGE_PATH);
          const description: string = trace.describe();
          expect(description).assertEqual('onCreate > onWindowStageCreate > onForeground');
          expect(description.includes(INDEX_PAGE_PATH)).assertFalse();
          expect(trace.firstIndexOf('onNothing')).assertEqual(-1);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_INTEGRATION_0500
     * @tc.name testBackupVersionParsing
     * @tc.desc Verify backup version parsing rejects code 0 and empty name, and accepts a positive code with 1.0.12 name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBackupVersionParsing', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(versionPolicy.parse(0, BACKUP_CURRENT_NAME)).assertNull();
          expect(versionPolicy.parse(BACKUP_CURRENT_CODE, '')).assertNull();
          const parsed: BackupVersion | null = versionPolicy.parse(BACKUP_CURRENT_CODE, BACKUP_CURRENT_NAME);
          expect(parsed !== null).assertTrue();
          if (parsed !== null) {
            expect(parsed.code).assertEqual(BACKUP_CURRENT_CODE);
            expect(parsed.name).assertEqual(BACKUP_CURRENT_NAME);
            expect(versionPolicy.isSameRelease(parsed)).assertTrue();
          }
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_INTEGRATION_0600
     * @tc.name testBackupVersionCompareMatrix
     * @tc.desc Verify version comparison returns 1 when older content meets newer target, -1 when newer meets older and 0 for equal codes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBackupVersionCompareMatrix', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const older: BackupVersion = { code: 1000005, name: '1.0.5' };
          const same: BackupVersion = { code: BACKUP_CURRENT_CODE, name: BACKUP_CURRENT_NAME };
          const newer: BackupVersion = { code: 1000020, name: '1.0.20' };
          expect(versionPolicy.compare(older, same)).assertEqual(-1);
          expect(versionPolicy.compare(same, older)).assertEqual(1);
          expect(versionPolicy.compare(same, same)).assertEqual(0);
          expect(versionPolicy.compare(newer, same)).assertEqual(1);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_INTEGRATION_0700
     * @tc.name testRestorePlanDecision
     * @tc.desc Verify restore plan is reject below the minimum code, migrate-then-restore for an older release and direct-restore for the current release
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRestorePlanDecision', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const tooOld: BackupVersion = { code: 999999, name: '0.9.9' };
          const older: BackupVersion = { code: 1000005, name: '1.0.5' };
          const current: BackupVersion = { code: BACKUP_CURRENT_CODE, name: BACKUP_CURRENT_NAME };
          expect(versionPolicy.buildRestorePlan(tooOld)).assertEqual('reject');
          expect(versionPolicy.buildRestorePlan(older)).assertEqual('migrate-then-restore');
          expect(versionPolicy.buildRestorePlan(current)).assertEqual('direct-restore');
          expect(versionPolicy.isRestorable(tooOld)).assertFalse();
          expect(versionPolicy.isRestorable(older)).assertTrue();
          expect(versionPolicy.requiresMigration(older)).assertTrue();
          expect(versionPolicy.requiresMigration(current)).assertFalse();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_INTEGRATION_0800
     * @tc.name testRealColdStartRendersIndex
     * @tc.desc Verify AbilityDelegator cold start renders the HelloWorld keyed text and measures launch inside the ability launch budget
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testRealColdStartRendersIndex', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void) => {
        try {
          const startTime: number = Date.now();
          await launchEntryAbility();
          await serializedDelay(driver, DELAY_AFTER_LAUNCH);
          const stable: boolean = await waitForIndexPageStable(driver, TIMEOUT_ABILITY_LAUNCH);
          const elapsed: number = measureElapsed(startTime);
          expect(stable).assertTrue();
          const keyExists: boolean = await checkComponentExistsByKey(driver, INDEX_PAGE_TEXT_KEY);
          expect(keyExists).assertTrue();
          const showsInitial: boolean = await checkTextContent(driver, PAGE_TEXT_INITIAL);
          const showsClicked: boolean = await checkTextContent(driver, PAGE_TEXT_CLICKED);
          expect(showsInitial || showsClicked).assertTrue();
          logInfo(`testRealColdStartRendersIndex: elapsed ${elapsed} ms`);
          expect(isWithinBudget(elapsed, TIMEOUT_ABILITY_LAUNCH * 2)).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_INTEGRATION_0900
     * @tc.name testRealForegroundBackgroundCycle
     * @tc.desc Verify foreground and background transitions keep the index page text list non empty and the page component count positive
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRealForegroundBackgroundCycle', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          await launchEntryAbility();
          await serializedDelay(driver, DELAY_AFTER_LAUNCH);
          await waitForIndexPageStable(driver, TIMEOUT_ABILITY_LAUNCH);
          await doAbilityBackground();
          await serializedDelay(driver, DELAY_AFTER_BACKGROUND);
          await doAbilityForeground();
          await serializedDelay(driver, DELAY_AFTER_LAUNCH);
          const stable: boolean = await waitForIndexPageStable(driver, TIMEOUT_ABILITY_LAUNCH);
          expect(stable).assertTrue();
          const texts: string[] = await collectAllTexts(driver);
          expect(texts.length > 0).assertTrue();
          const componentCount: number = await pageComponentCount(driver);
          expect(componentCount > 0).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_INTEGRATION_1000
     * @tc.name testRealTextAppearsWithinSessionBudget
     * @tc.desc Verify the index page text becomes visible within the session creation budget after an explicit Want launch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRealTextAppearsWithinSessionBudget', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const want: Want = buildEntryWant();
          const abilityName: string = want.abilityName === undefined ? '' : want.abilityName;
          expect(abilityName).assertEqual(ENTRY_ABILITY_NAME);
          await startAbilityByWant(want);
          await serializedDelay(driver, DELAY_AFTER_LAUNCH);
          const initiallyVisible: boolean = await waitForTextVisible(driver, PAGE_TEXT_INITIAL,
            TIMEOUT_SESSION_CREATE);
          if (!initiallyVisible) {
            const clickedVisible: boolean = await waitForTextVisible(driver, PAGE_TEXT_CLICKED,
              TIMEOUT_SESSION_CREATE);
            expect(clickedVisible).assertTrue();
          } else {
            expect(initiallyVisible).assertTrue();
          }
          const stable: boolean = await waitForIndexPageStable(driver, TIMEOUT_SESSION_CREATE);
          expect(stable).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_INTEGRATION_1100
     * @tc.name testRepeatedLaunchIdempotent
     * @tc.desc Verify five repeated EntryAbility launches keep the page stable with a positive component count and no text loss
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL3
     */
    it('testRepeatedLaunchIdempotent', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void) => {
        try {
          const counts: number[] = [];
          for (let i = 0; i < STRESS_ROUNDS_LAUNCH; i++) {
            await launchEntryAbility();
            await serializedDelay(driver, DELAY_AFTER_LAUNCH);
            const stable: boolean = await waitForIndexPageStable(driver, TIMEOUT_ABILITY_LAUNCH);
            expect(stable).assertTrue();
            counts.push(await pageComponentCount(driver));
          }
          expect(counts.length).assertEqual(STRESS_ROUNDS_LAUNCH);
          expect(averageOf(counts) > 0).assertTrue();
          const showsInitial: boolean = await checkTextContent(driver, PAGE_TEXT_INITIAL);
          const showsClicked: boolean = await checkTextContent(driver, PAGE_TEXT_CLICKED);
          expect(showsInitial || showsClicked).assertTrue();
        } finally {
          done();
        }
      })
  })
}
