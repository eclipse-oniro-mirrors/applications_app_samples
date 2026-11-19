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
import {
  getDriver,
  ensureIndexPageInitial,
  logInfo,
  logError,
  sleepMs,
  launchEntryAbility,
  doAbilityForeground,
  doAbilityBackground,
  checkTextContent,
  waitForIndexPageStable,
  waitForTextVisible,
  pageComponentCount,
  measureElapsed,
  isWithinBudget,
  DELAY_AFTER_BACKGROUND,
  TIMEOUT_ABILITY_LAUNCH,
  TOLERANCE_COMPONENT_COUNT,
  PAGE_TEXT_INITIAL,
  PAGE_TEXT_CLICKED
} from '../Shared/SharedDriver';

enum LifecyclePhase {
  CREATE = 'onCreate',
  WINDOW_STAGE_CREATE = 'onWindowStageCreate',
  FOREGROUND = 'onForeground',
  BACKGROUND = 'onBackground',
  WINDOW_STAGE_DESTROY = 'onWindowStageDestroy',
  DESTROY = 'onDestroy'
}

interface LifecycleRecord {
  phase: LifecyclePhase;
  timestamp: number;
  sequence: number;
}

class LifecycleTracker {
  private records: LifecycleRecord[] = [];
  private nextSequence: number = 0;

  public record(phase: LifecyclePhase): LifecycleRecord {
    const record: LifecycleRecord = {
      phase: phase,
      timestamp: Date.now(),
      sequence: this.nextSequence
    };
    this.nextSequence++;
    this.records.push(record);
    return record;
  }

  public recordMany(phases: LifecyclePhase[]): number {
    let recorded: number = 0;
    for (let i = 0; i < phases.length; i++) {
      this.record(phases[i]);
      recorded++;
    }
    return recorded;
  }

  public getRecords(): LifecycleRecord[] {
    return this.records.slice(0);
  }

  public size(): number {
    return this.records.length;
  }

  public hasPhase(phase: LifecyclePhase): boolean {
    return this.indexOf(phase) >= 0;
  }

  public indexOf(phase: LifecyclePhase): number {
    for (let i = 0; i < this.records.length; i++) {
      if (this.records[i].phase === phase) {
        return i;
      }
    }
    return -1;
  }

  public countOf(phase: LifecyclePhase): number {
    let count: number = 0;
    for (let i = 0; i < this.records.length; i++) {
      if (this.records[i].phase === phase) {
        count++;
      }
    }
    return count;
  }

  public getPhaseAt(index: number): LifecyclePhase | null {
    if (index < 0 || index >= this.records.length) {
      return null;
    }
    return this.records[index].phase;
  }

  public getSequenceAt(index: number): number {
    if (index < 0 || index >= this.records.length) {
      return -1;
    }
    return this.records[index].sequence;
  }

  public getTimestampAt(index: number): number {
    if (index < 0 || index >= this.records.length) {
      return -1;
    }
    return this.records[index].timestamp;
  }

  public isChronological(): boolean {
    for (let i = 1; i < this.records.length; i++) {
      if (this.records[i].timestamp < this.records[i - 1].timestamp) {
        return false;
      }
      if (this.records[i].sequence <= this.records[i - 1].sequence) {
        return false;
      }
    }
    return true;
  }

  public duplicateCount(): number {
    let duplicates: number = 0;
    for (let i = 0; i < this.records.length; i++) {
      for (let j = 0; j < i; j++) {
        if (this.records[j].phase === this.records[i].phase) {
          duplicates++;
          break;
        }
      }
    }
    return duplicates;
  }

  public distinctPhaseCount(): number {
    const seen: LifecyclePhase[] = [];
    for (let i = 0; i < this.records.length; i++) {
      if (seen.indexOf(this.records[i].phase) < 0) {
        seen.push(this.records[i].phase);
      }
    }
    return seen.length;
  }

  public reset(): void {
    this.records = [];
    this.nextSequence = 0;
  }
}

class PhaseCountTable {
  private counts: number[] = [0, 0, 0, 0, 0, 0];

  public record(phaseIndex: number): boolean {
    if (phaseIndex < 0 || phaseIndex >= this.counts.length) {
      return false;
    }
    this.counts[phaseIndex]++;
    return true;
  }

  public getCount(phaseIndex: number): number {
    if (phaseIndex < 0 || phaseIndex >= this.counts.length) {
      return 0;
    }
    return this.counts[phaseIndex];
  }

  public getTotal(): number {
    let total: number = 0;
    for (let i = 0; i < this.counts.length; i++) {
      total += this.counts[i];
    }
    return total;
  }

  public getMaxCount(): number {
    let max: number = 0;
    for (let i = 0; i < this.counts.length; i++) {
      if (this.counts[i] > max) {
        max = this.counts[i];
      }
    }
    return max;
  }

  public getDistinctCount(): number {
    let distinct: number = 0;
    for (let i = 0; i < this.counts.length; i++) {
      if (this.counts[i] > 0) {
        distinct++;
      }
    }
    return distinct;
  }

  public reset(): void {
    this.counts = [0, 0, 0, 0, 0, 0];
  }
}

class LifecyclePhaseComparator {
  private static readonly ORDER: LifecyclePhase[] = [
    LifecyclePhase.CREATE,
    LifecyclePhase.WINDOW_STAGE_CREATE,
    LifecyclePhase.FOREGROUND,
    LifecyclePhase.BACKGROUND,
    LifecyclePhase.WINDOW_STAGE_DESTROY,
    LifecyclePhase.DESTROY
  ];

  public static indexOf(phase: LifecyclePhase): number {
    return LifecyclePhaseComparator.ORDER.indexOf(phase);
  }

  public static isBefore(first: LifecyclePhase, second: LifecyclePhase): boolean {
    return LifecyclePhaseComparator.indexOf(first) < LifecyclePhaseComparator.indexOf(second);
  }

  public static isAfter(first: LifecyclePhase, second: LifecyclePhase): boolean {
    return LifecyclePhaseComparator.indexOf(first) > LifecyclePhaseComparator.indexOf(second);
  }

  public static orderLength(): number {
    return LifecyclePhaseComparator.ORDER.length;
  }
}

class LifecycleAuditor {
  private expected: LifecyclePhase[] = [];

  public setExpected(sequence: LifecyclePhase[]): void {
    this.expected = sequence.slice(0);
  }

  public getExpectedLength(): number {
    return this.expected.length;
  }

  public matchesPrefix(records: LifecycleRecord[]): boolean {
    if (records.length < this.expected.length) {
      return false;
    }
    for (let i = 0; i < this.expected.length; i++) {
      if (records[i].phase !== this.expected[i]) {
        return false;
      }
    }
    return true;
  }

  public firstMismatchIndex(records: LifecycleRecord[]): number {
    const limit: number = records.length < this.expected.length ? records.length : this.expected.length;
    for (let i = 0; i < limit; i++) {
      if (records[i].phase !== this.expected[i]) {
        return i;
      }
    }
    return -1;
  }
}

class StageTransitionRecorder {
  private fromIndexes: number[] = [];
  private toIndexes: number[] = [];

  public record(fromPhase: LifecyclePhase, toPhase: LifecyclePhase): void {
    this.fromIndexes.push(LifecyclePhaseComparator.indexOf(fromPhase));
    this.toIndexes.push(LifecyclePhaseComparator.indexOf(toPhase));
  }

  public getTransitionCount(): number {
    return this.fromIndexes.length;
  }

  public hasTransition(fromPhase: LifecyclePhase, toPhase: LifecyclePhase): boolean {
    const fromIndex: number = LifecyclePhaseComparator.indexOf(fromPhase);
    const toIndex: number = LifecyclePhaseComparator.indexOf(toPhase);
    for (let i = 0; i < this.fromIndexes.length; i++) {
      if (this.fromIndexes[i] === fromIndex && this.toIndexes[i] === toIndex) {
        return true;
      }
    }
    return false;
  }

  public countTransitions(fromPhase: LifecyclePhase, toPhase: LifecyclePhase): number {
    const fromIndex: number = LifecyclePhaseComparator.indexOf(fromPhase);
    const toIndex: number = LifecyclePhaseComparator.indexOf(toPhase);
    let count: number = 0;
    for (let i = 0; i < this.fromIndexes.length; i++) {
      if (this.fromIndexes[i] === fromIndex && this.toIndexes[i] === toIndex) {
        count++;
      }
    }
    return count;
  }
}

class MockEntryAbility {
  private tracker: LifecycleTracker;
  private transitionRecorder: StageTransitionRecorder = new StageTransitionRecorder();
  private currentPhase: LifecyclePhase | null = null;
  private launchCount: number = 0;

  constructor(tracker: LifecycleTracker) {
    this.tracker = tracker;
  }

  private moveTo(phase: LifecyclePhase): void {
    if (this.currentPhase !== null) {
      this.transitionRecorder.record(this.currentPhase, phase);
    }
    this.currentPhase = phase;
    this.tracker.record(phase);
  }

  public onCreate(): void {
    this.launchCount++;
    this.moveTo(LifecyclePhase.CREATE);
  }

  public onWindowStageCreate(): void {
    this.moveTo(LifecyclePhase.WINDOW_STAGE_CREATE);
  }

  public onForeground(): void {
    this.moveTo(LifecyclePhase.FOREGROUND);
  }

  public onBackground(): void {
    this.moveTo(LifecyclePhase.BACKGROUND);
  }

  public onWindowStageDestroy(): void {
    this.moveTo(LifecyclePhase.WINDOW_STAGE_DESTROY);
  }

  public onDestroy(): void {
    this.moveTo(LifecyclePhase.DESTROY);
  }

  public coldStart(): void {
    this.onCreate();
    this.onWindowStageCreate();
    this.onForeground();
  }

  public backgroundRound(): void {
    this.onBackground();
    this.onForeground();
  }

  public fullDestroy(): void {
    this.onBackground();
    this.onWindowStageDestroy();
    this.onDestroy();
  }

  public getCurrentPhase(): LifecyclePhase | null {
    return this.currentPhase;
  }

  public getLaunchCount(): number {
    return this.launchCount;
  }

  public getTransitions(): StageTransitionRecorder {
    return this.transitionRecorder;
  }
}

class LifecycleHealthChecker {
  private totalRecords: number = 0;
  private distinctPhases: number = 0;
  private foregroundCount: number = 0;
  private backgroundCount: number = 0;

  public analyze(records: LifecycleRecord[]): void {
    this.totalRecords = records.length;
    const seen: LifecyclePhase[] = [];
    this.foregroundCount = 0;
    this.backgroundCount = 0;
    for (let i = 0; i < records.length; i++) {
      const phase: LifecyclePhase = records[i].phase;
      if (seen.indexOf(phase) < 0) {
        seen.push(phase);
      }
      if (phase === LifecyclePhase.FOREGROUND) {
        this.foregroundCount++;
      }
      if (phase === LifecyclePhase.BACKGROUND) {
        this.backgroundCount++;
      }
    }
    this.distinctPhases = seen.length;
  }

  public getTotal(): number {
    return this.totalRecords;
  }

  public getDistinct(): number {
    return this.distinctPhases;
  }

  public getForegroundCount(): number {
    return this.foregroundCount;
  }

  public getBackgroundCount(): number {
    return this.backgroundCount;
  }

  public isBalanced(): boolean {
    return this.foregroundCount === this.backgroundCount ||
      this.foregroundCount === this.backgroundCount + 1;
  }
}

async function isForegroundVisible(driver: Driver): Promise<boolean> {
  return await waitForIndexPageStable(driver);
}

function realPhaseMarker(visible: boolean): LifecyclePhase {
  if (visible) {
    return LifecyclePhase.FOREGROUND;
  }
  return LifecyclePhase.BACKGROUND;
}

export default function abilityLifecycleTest(): void {
  describe('AbilityLifecycleTest', () => {
    let driver: Driver = getDriver();

    beforeAll(async () => {
      logInfo('AbilityLifecycleTest beforeAll: launching EntryAbility');
      try {
        await launchEntryAbility();
        await waitForIndexPageStable(driver);
        await ensureIndexPageInitial(driver);
      } catch (error) {
        logError(`AbilityLifecycleTest beforeAll error: ${error}`);
      }
    })

    afterAll(async () => {
      logInfo('AbilityLifecycleTest afterAll: restoring foreground state');
      try {
        await doAbilityForeground();
        await sleepMs(DELAY_AFTER_BACKGROUND);
      } catch (error) {
        logError(`AbilityLifecycleTest afterAll error: ${error}`);
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_ABILITYCYCLE_0100
     * @tc.name testLifecycleCanonicalColdStartOrder
     * @tc.desc Verify mock EntryAbility cold start records onCreate -> onWindowStageCreate -> onForeground in order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLifecycleCanonicalColdStartOrder', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const tracker: LifecycleTracker = new LifecycleTracker();
          const ability: MockEntryAbility = new MockEntryAbility(tracker);
          ability.coldStart();
          expect(tracker.size()).assertEqual(3);
          expect(tracker.getPhaseAt(0)).assertEqual(LifecyclePhase.CREATE);
          expect(tracker.getPhaseAt(1)).assertEqual(LifecyclePhase.WINDOW_STAGE_CREATE);
          expect(tracker.getPhaseAt(2)).assertEqual(LifecyclePhase.FOREGROUND);
          expect(ability.getCurrentPhase()).assertEqual(LifecyclePhase.FOREGROUND);
          expect(tracker.isChronological()).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ABILITYCYCLE_0200
     * @tc.name testLifecycleTimestampMonotonic
     * @tc.desc Verify timestamps and sequence numbers stay monotonic across cold start and background round
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLifecycleTimestampMonotonic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const tracker: LifecycleTracker = new LifecycleTracker();
          const ability: MockEntryAbility = new MockEntryAbility(tracker);
          ability.coldStart();
          await sleepMs(10);
          ability.backgroundRound();
          expect(tracker.size()).assertEqual(5);
          expect(tracker.isChronological()).assertTrue();
          expect(tracker.getTimestampAt(4) >= tracker.getTimestampAt(0)).assertTrue();
          expect(tracker.getSequenceAt(0)).assertEqual(0);
          expect(tracker.getSequenceAt(4)).assertEqual(4);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ABILITYCYCLE_0300
     * @tc.name testLifecycleDuplicatePhaseCount
     * @tc.desc Verify repeated onForeground calls produce count 3 and duplicate count 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLifecycleDuplicatePhaseCount', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const tracker: LifecycleTracker = new LifecycleTracker();
          tracker.record(LifecyclePhase.FOREGROUND);
          tracker.record(LifecyclePhase.FOREGROUND);
          tracker.record(LifecyclePhase.FOREGROUND);
          expect(tracker.countOf(LifecyclePhase.FOREGROUND)).assertEqual(3);
          expect(tracker.duplicateCount()).assertEqual(2);
          expect(tracker.distinctPhaseCount()).assertEqual(1);
          expect(tracker.countOf(LifecyclePhase.CREATE)).assertEqual(0);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ABILITYCYCLE_0400
     * @tc.name testLifecycleBackgroundAfterForeground
     * @tc.desc Verify background transition happens after foreground and window stage destroy follows background
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLifecycleBackgroundAfterForeground', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const tracker: LifecycleTracker = new LifecycleTracker();
          const ability: MockEntryAbility = new MockEntryAbility(tracker);
          ability.coldStart();
          ability.fullDestroy();
          const foregroundIndex: number = tracker.indexOf(LifecyclePhase.FOREGROUND);
          const backgroundIndex: number = tracker.indexOf(LifecyclePhase.BACKGROUND);
          const windowDestroyIndex: number = tracker.indexOf(LifecyclePhase.WINDOW_STAGE_DESTROY);
          const destroyIndex: number = tracker.indexOf(LifecyclePhase.DESTROY);
          expect(foregroundIndex).assertEqual(2);
          expect(backgroundIndex > foregroundIndex).assertTrue();
          expect(windowDestroyIndex > backgroundIndex).assertTrue();
          expect(destroyIndex).assertEqual(5);
          expect(ability.getCurrentPhase()).assertEqual(LifecyclePhase.DESTROY);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ABILITYCYCLE_0500
     * @tc.name testLifecycleSequenceNumbersStrictlyIncreasing
     * @tc.desc Verify sequence numbers assigned by tracker grow by exactly one per record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLifecycleSequenceNumbersStrictlyIncreasing', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const tracker: LifecycleTracker = new LifecycleTracker();
          const recorded: number = tracker.recordMany([
            LifecyclePhase.CREATE,
            LifecyclePhase.WINDOW_STAGE_CREATE,
            LifecyclePhase.FOREGROUND,
            LifecyclePhase.BACKGROUND
          ]);
          expect(recorded).assertEqual(4);
          expect(tracker.size()).assertEqual(4);
          for (let i = 0; i < 4; i++) {
            expect(tracker.getSequenceAt(i)).assertEqual(i);
          }
          expect(tracker.isChronological()).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ABILITYCYCLE_0600
     * @tc.name testLifecycleResetClearsRecords
     * @tc.desc Verify tracker reset clears all records and restarts sequence numbering at zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLifecycleResetClearsRecords', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const tracker: LifecycleTracker = new LifecycleTracker();
          tracker.recordMany([LifecyclePhase.CREATE, LifecyclePhase.FOREGROUND]);
          expect(tracker.size()).assertEqual(2);
          tracker.reset();
          expect(tracker.size()).assertEqual(0);
          expect(tracker.hasPhase(LifecyclePhase.CREATE)).assertFalse();
          expect(tracker.getPhaseAt(0) === null).assertTrue();
          const record: LifecycleRecord = tracker.record(LifecyclePhase.BACKGROUND);
          expect(record.sequence).assertEqual(0);
          expect(tracker.size()).assertEqual(1);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ABILITYCYCLE_0700
     * @tc.name testLifecycleAuditorPrefixMatch
     * @tc.desc Verify auditor accepts canonical cold start prefix and reports mismatch index for wrong order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLifecycleAuditorPrefixMatch', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const tracker: LifecycleTracker = new LifecycleTracker();
          const auditor: LifecycleAuditor = new LifecycleAuditor();
          auditor.setExpected([
            LifecyclePhase.CREATE,
            LifecyclePhase.WINDOW_STAGE_CREATE,
            LifecyclePhase.FOREGROUND
          ]);
          tracker.recordMany([
            LifecyclePhase.CREATE,
            LifecyclePhase.WINDOW_STAGE_CREATE,
            LifecyclePhase.FOREGROUND,
            LifecyclePhase.BACKGROUND
          ]);
          expect(auditor.getExpectedLength()).assertEqual(3);
          expect(auditor.matchesPrefix(tracker.getRecords())).assertTrue();
          expect(auditor.firstMismatchIndex(tracker.getRecords())).assertEqual(-1);
          const wrongTracker: LifecycleTracker = new LifecycleTracker();
          wrongTracker.recordMany([LifecyclePhase.CREATE, LifecyclePhase.FOREGROUND]);
          expect(auditor.matchesPrefix(wrongTracker.getRecords())).assertFalse();
          expect(auditor.firstMismatchIndex(wrongTracker.getRecords())).assertEqual(1);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ABILITYCYCLE_0800
     * @tc.name testLifecyclePhaseComparatorOrder
     * @tc.desc Verify phase comparator ranks destroy last and reports before relations correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLifecyclePhaseComparatorOrder', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(LifecyclePhaseComparator.orderLength()).assertEqual(6);
          expect(LifecyclePhaseComparator.indexOf(LifecyclePhase.CREATE)).assertEqual(0);
          expect(LifecyclePhaseComparator.indexOf(LifecyclePhase.DESTROY)).assertEqual(5);
          expect(LifecyclePhaseComparator.isBefore(LifecyclePhase.CREATE, LifecyclePhase.FOREGROUND)).assertTrue();
          expect(LifecyclePhaseComparator.isAfter(LifecyclePhase.DESTROY, LifecyclePhase.BACKGROUND)).assertTrue();
          expect(LifecyclePhaseComparator.isBefore(LifecyclePhase.DESTROY, LifecyclePhase.CREATE)).assertFalse();
          expect(LifecyclePhaseComparator.isAfter(LifecyclePhase.CREATE, LifecyclePhase.CREATE)).assertFalse();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ABILITYCYCLE_0900
     * @tc.name testLifecyclePhaseCountTableBoundary
     * @tc.desc Verify count table rejects indexes -1 and 6 while accumulating valid phase indexes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLifecyclePhaseCountTableBoundary', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const table: PhaseCountTable = new PhaseCountTable();
          expect(table.record(-1)).assertFalse();
          expect(table.record(6)).assertFalse();
          expect(table.record(0)).assertTrue();
          expect(table.record(2)).assertTrue();
          expect(table.record(2)).assertTrue();
          expect(table.getCount(0)).assertEqual(1);
          expect(table.getCount(2)).assertEqual(2);
          expect(table.getCount(5)).assertEqual(0);
          expect(table.getTotal()).assertEqual(3);
          expect(table.getMaxCount()).assertEqual(2);
          expect(table.getDistinctCount()).assertEqual(2);
          table.reset();
          expect(table.getTotal()).assertEqual(0);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ABILITYCYCLE_1000
     * @tc.name testLifecycleRealLaunchRendersIndexPage
     * @tc.desc Verify real EntryAbility launch renders Index page with initial Hello World text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLifecycleRealLaunchRendersIndexPage', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          await launchEntryAbility();
          const stable: boolean = await waitForIndexPageStable(driver);
          expect(stable).assertTrue();
          const hasInitial: boolean = await checkTextContent(driver, PAGE_TEXT_INITIAL);
          const hasClicked: boolean = await checkTextContent(driver, PAGE_TEXT_CLICKED);
          expect(hasInitial || hasClicked).assertTrue();
          const componentTotal: number = await pageComponentCount(driver);
          expect(componentTotal > 0).assertTrue();
          logInfo(`testLifecycleRealLaunchRendersIndexPage: component total ${componentTotal}`);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ABILITYCYCLE_1100
     * @tc.name testLifecycleRealBackgroundKeepsPageReadable
     * @tc.desc Verify page text stays readable after real background then foreground round trip
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLifecycleRealBackgroundKeepsPageReadable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          await doAbilityForeground();
          await sleepMs(DELAY_AFTER_BACKGROUND);
          await doAbilityBackground();
          await sleepMs(DELAY_AFTER_BACKGROUND);
          await doAbilityForeground();
          const stable: boolean = await waitForIndexPageStable(driver);
          expect(stable).assertTrue();
          const initialReadable: boolean =
            await waitForTextVisible(driver, PAGE_TEXT_INITIAL, TIMEOUT_ABILITY_LAUNCH);
          const clickedReadable: boolean =
            await waitForTextVisible(driver, PAGE_TEXT_CLICKED, TIMEOUT_ABILITY_LAUNCH);
          expect(initialReadable || clickedReadable).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ABILITYCYCLE_1200
     * @tc.name testLifecyclePhasePresenceAfterRealRoundTrip
     * @tc.desc Verify mock tracker foreground marker survives a real background and foreground round trip
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLifecyclePhasePresenceAfterRealRoundTrip', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const tracker: LifecycleTracker = new LifecycleTracker();
          const initialVisible: boolean = await isForegroundVisible(driver);
          expect(initialVisible).assertTrue();
          tracker.record(realPhaseMarker(initialVisible));
          await doAbilityBackground();
          await sleepMs(DELAY_AFTER_BACKGROUND);
          tracker.record(LifecyclePhase.BACKGROUND);
          await doAbilityForeground();
          await sleepMs(DELAY_AFTER_BACKGROUND);
          tracker.record(LifecyclePhase.FOREGROUND);
          expect(tracker.hasPhase(LifecyclePhase.FOREGROUND)).assertTrue();
          expect(tracker.countOf(LifecyclePhase.FOREGROUND)).assertEqual(2);
          expect(tracker.countOf(LifecyclePhase.BACKGROUND)).assertEqual(1);
          const visible: boolean = await waitForIndexPageStable(driver);
          expect(visible).assertTrue();
          expect(tracker.isChronological()).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ABILITYCYCLE_1300
     * @tc.name testLifecycleRealLaunchTimeBudget
     * @tc.desc Verify cold launch plus page stable completes within ten times the launch timeout budget
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLifecycleRealLaunchTimeBudget', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const startTime: number = Date.now();
          await launchEntryAbility();
          const stable: boolean = await waitForIndexPageStable(driver);
          const elapsed: number = measureElapsed(startTime);
          expect(stable).assertTrue();
          expect(elapsed > 0).assertTrue();
          expect(isWithinBudget(elapsed, TIMEOUT_ABILITY_LAUNCH * 10)).assertTrue();
          logInfo(`testLifecycleRealLaunchTimeBudget: elapsed ${elapsed} ms`);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ABILITYCYCLE_1400
     * @tc.name testLifecycleComponentCountStableAcrossBackground
     * @tc.desc Verify Index component count does not drift beyond tolerance after background round trip
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLifecycleComponentCountStableAcrossBackground', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          await waitForIndexPageStable(driver);
          const beforeCount: number = await pageComponentCount(driver);
          expect(beforeCount > 0).assertTrue();
          await doAbilityBackground();
          await sleepMs(DELAY_AFTER_BACKGROUND);
          await doAbilityForeground();
          await waitForIndexPageStable(driver);
          const afterCount: number = await pageComponentCount(driver);
          const drift: number = afterCount - beforeCount;
          const absDrift: number = drift < 0 ? -drift : drift;
          expect(absDrift <= TOLERANCE_COMPONENT_COUNT).assertTrue();
          logInfo(`testLifecycleComponentCountStableAcrossBackground: before ${beforeCount}, after ${afterCount}`);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ABILITYCYCLE_1500
     * @tc.name testLifecycleTransitionRecorderPairs
     * @tc.desc Verify transition recorder counts create to window stage and background to foreground pairs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLifecycleTransitionRecorderPairs', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const tracker: LifecycleTracker = new LifecycleTracker();
          const ability: MockEntryAbility = new MockEntryAbility(tracker);
          ability.coldStart();
          ability.backgroundRound();
          ability.backgroundRound();
          const transitions: StageTransitionRecorder = ability.getTransitions();
          expect(transitions.getTransitionCount()).assertEqual(6);
          expect(transitions.hasTransition(LifecyclePhase.CREATE, LifecyclePhase.WINDOW_STAGE_CREATE)).assertTrue();
          expect(transitions.hasTransition(LifecyclePhase.BACKGROUND, LifecyclePhase.FOREGROUND)).assertTrue();
          expect(transitions.countTransitions(LifecyclePhase.BACKGROUND, LifecyclePhase.FOREGROUND)).assertEqual(2);
          expect(transitions.countTransitions(LifecyclePhase.CREATE, LifecyclePhase.DESTROY)).assertEqual(0);
          expect(ability.getLaunchCount()).assertEqual(1);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ABILITYCYCLE_1600
     * @tc.name testLifecycleHealthBalancedForegroundBackground
     * @tc.desc Verify health checker reports balanced foreground and background counts after one round trip
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLifecycleHealthBalancedForegroundBackground', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const tracker: LifecycleTracker = new LifecycleTracker();
          const ability: MockEntryAbility = new MockEntryAbility(tracker);
          ability.coldStart();
          ability.backgroundRound();
          const checker: LifecycleHealthChecker = new LifecycleHealthChecker();
          checker.analyze(tracker.getRecords());
          expect(checker.getTotal()).assertEqual(5);
          expect(checker.getForegroundCount()).assertEqual(2);
          expect(checker.getBackgroundCount()).assertEqual(1);
          expect(checker.isBalanced()).assertTrue();
          expect(checker.getDistinct()).assertEqual(4);
        } finally {
          done();
        }
      })
  })
}
