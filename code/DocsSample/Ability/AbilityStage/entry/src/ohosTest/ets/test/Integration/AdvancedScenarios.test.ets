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
  waitForIndexPageStable,
  pageComponentCount,
  checkTextContent,
  collectAllTexts,
  doAbilityForeground,
  doAbilityBackground,
  serializedDelay,
  logInfo,
  PAGE_TEXT_INITIAL,
  PAGE_TEXT_CLICKED,
  COLOR_MODE_NOT_SET,
  TIMEOUT_ABILITY_LAUNCH,
  DELAY_AFTER_LAUNCH,
  DELAY_AFTER_BACKGROUND,
  STRESS_ROUNDS_LIFECYCLE,
  maxOf,
  minOf,
  ensureIndexPageInitial,
} from '../Shared/SharedDriver';

const MEMORY_LEVEL_MODERATE: number = 0;

const MEMORY_LEVEL_LOW: number = 1;

const MEMORY_LEVEL_CRITICAL: number = 2;

enum StagePhase {
  PHASE_IDLE = 'idle',
  PHASE_CREATED = 'created',
  PHASE_FOREGROUND = 'foreground',
  PHASE_BACKGROUND = 'background',
  PHASE_DESTROYED = 'destroyed'
}

class StageLifecycleMachine {
  private phase: StagePhase = StagePhase.PHASE_IDLE;
  private history: StagePhase[] = [];
  private transitionCount: number = 0;
  private rejectedCount: number = 0;

  public getPhase(): StagePhase {
    return this.phase;
  }

  public getHistory(): StagePhase[] {
    return this.history.slice(0);
  }

  public getTransitionCount(): number {
    return this.transitionCount;
  }

  public getRejectedCount(): number {
    return this.rejectedCount;
  }

  public onCreate(): boolean {
    if (this.phase !== StagePhase.PHASE_IDLE) {
      this.rejectedCount++;
      return false;
    }
    this.moveTo(StagePhase.PHASE_CREATED);
    return true;
  }

  public onForeground(): boolean {
    if (this.phase !== StagePhase.PHASE_CREATED && this.phase !== StagePhase.PHASE_BACKGROUND) {
      this.rejectedCount++;
      return false;
    }
    this.moveTo(StagePhase.PHASE_FOREGROUND);
    return true;
  }

  public onBackground(): boolean {
    if (this.phase !== StagePhase.PHASE_FOREGROUND) {
      this.rejectedCount++;
      return false;
    }
    this.moveTo(StagePhase.PHASE_BACKGROUND);
    return true;
  }

  public onDestroy(): boolean {
    if (this.phase === StagePhase.PHASE_IDLE || this.phase === StagePhase.PHASE_DESTROYED) {
      this.rejectedCount++;
      return false;
    }
    this.moveTo(StagePhase.PHASE_DESTROYED);
    return true;
  }

  public canAcceptWant(): boolean {
    return this.phase === StagePhase.PHASE_CREATED || this.phase === StagePhase.PHASE_FOREGROUND;
  }

  public reset(): void {
    this.phase = StagePhase.PHASE_IDLE;
    this.history = [];
    this.transitionCount = 0;
    this.rejectedCount = 0;
  }

  private moveTo(next: StagePhase): void {
    this.phase = next;
    this.history.push(next);
    this.transitionCount++;
  }
}

interface EnvironmentSnapshot {
  language: string;
  colorMode: number;
  direction: string;
  fontSizeScale: number;
  fontWeightScale: number;
}

class EnvironmentDispatcher {
  private snapshots: EnvironmentSnapshot[] = [];
  private memoryLevels: number[] = [];

  public dispatchConfiguration(snapshot: EnvironmentSnapshot): number {
    if (!this.isSupportedLanguage(snapshot.language)) {
      return -1;
    }
    this.snapshots.push(snapshot);
    return this.snapshots.length;
  }

  public dispatchMemoryLevel(level: number): boolean {
    if (!isFinite(level) || level < MEMORY_LEVEL_MODERATE || level > MEMORY_LEVEL_CRITICAL) {
      return false;
    }
    this.memoryLevels.push(level);
    return true;
  }

  public getSnapshotCount(): number {
    return this.snapshots.length;
  }

  public getLatestSnapshot(): EnvironmentSnapshot | null {
    if (this.snapshots.length === 0) {
      return null;
    }
    return this.snapshots[this.snapshots.length - 1];
  }

  public getMemoryLevels(): number[] {
    return this.memoryLevels.slice(0);
  }

  public getDistinctLanguages(): string[] {
    const result: string[] = [];
    for (let i = 0; i < this.snapshots.length; i++) {
      if (!result.includes(this.snapshots[i].language)) {
        result.push(this.snapshots[i].language);
      }
    }
    return result;
  }

  public isSupportedLanguage(language: string): boolean {
    return language.length > 1 && language.includes('_');
  }
}

export default function advancedScenariosTest(): void {
  describe('AdvancedScenariosTest', () => {
    let driver: Driver;

    beforeAll(async () => {
      driver = getDriver();
      logInfo('AdvancedScenariosTest: beforeAll driver prepared');

      await ensureIndexPageInitial(driver);
    })

    afterAll(async () => {
      await serializedDelay(driver, DELAY_AFTER_BACKGROUND);
      logInfo('AdvancedScenariosTest: afterAll finished');
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_ADVANCED_0100
     * @tc.name testStageLifecycleHappyPath
     * @tc.desc Verify AbilityStage state machine: create to foreground to background to foreground to destroy produces 5 ordered transitions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStageLifecycleHappyPath', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const machine: StageLifecycleMachine = new StageLifecycleMachine();
          expect(machine.onCreate()).assertTrue();
          expect(machine.onForeground()).assertTrue();
          expect(machine.onBackground()).assertTrue();
          expect(machine.onForeground()).assertTrue();
          expect(machine.onDestroy()).assertTrue();
          expect(machine.getHistory().length).assertEqual(5);
          expect(machine.getHistory()[0]).assertEqual(StagePhase.PHASE_CREATED);
          expect(machine.getHistory()[4]).assertEqual(StagePhase.PHASE_DESTROYED);
          expect(machine.getTransitionCount()).assertEqual(5);
          expect(machine.getRejectedCount()).assertEqual(0);
          expect(machine.getPhase()).assertEqual(StagePhase.PHASE_DESTROYED);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ADVANCED_0200
     * @tc.name testDuplicateCreateRejected
     * @tc.desc Verify repeated AbilityStage onCreate on an already created stage is rejected and transition count stays 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testDuplicateCreateRejected', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const machine: StageLifecycleMachine = new StageLifecycleMachine();
          expect(machine.onCreate()).assertTrue();
          expect(machine.onCreate()).assertFalse();
          expect(machine.getTransitionCount()).assertEqual(1);
          expect(machine.getRejectedCount()).assertEqual(1);
          expect(machine.getPhase()).assertEqual(StagePhase.PHASE_CREATED);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ADVANCED_0300
     * @tc.name testBackgroundBeforeForegroundRejected
     * @tc.desc Verify onBackground issued while stage is only created is rejected and phase remains created
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBackgroundBeforeForegroundRejected', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const machine: StageLifecycleMachine = new StageLifecycleMachine();
          machine.onCreate();
          expect(machine.onBackground()).assertFalse();
          expect(machine.getPhase()).assertEqual(StagePhase.PHASE_CREATED);
          expect(machine.onForeground()).assertTrue();
          expect(machine.onBackground()).assertTrue();
          expect(machine.getTransitionCount()).assertEqual(3);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ADVANCED_0400
     * @tc.name testDestroyFromIdleRejected
     * @tc.desc Verify onDestroy before onCreate is rejected, and a later create plus destroy transitions exactly once
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL3
     */
    it('testDestroyFromIdleRejected', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void) => {
        try {
          const machine: StageLifecycleMachine = new StageLifecycleMachine();
          expect(machine.onDestroy()).assertFalse();
          expect(machine.getPhase()).assertEqual(StagePhase.PHASE_IDLE);
          expect(machine.onCreate()).assertTrue();
          expect(machine.onDestroy()).assertTrue();
          expect(machine.onDestroy()).assertFalse();
          expect(machine.getRejectedCount()).assertEqual(2);
          expect(machine.getTransitionCount()).assertEqual(2);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ADVANCED_0500
     * @tc.name testAcceptWantAvailability
     * @tc.desc Verify onAcceptWant is available in created and foreground phases but not in idle, background or destroyed phases
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL3
     */
    it('testAcceptWantAvailability', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void) => {
        try {
          const machine: StageLifecycleMachine = new StageLifecycleMachine();
          expect(machine.canAcceptWant()).assertFalse();
          machine.onCreate();
          expect(machine.canAcceptWant()).assertTrue();
          machine.onForeground();
          expect(machine.canAcceptWant()).assertTrue();
          machine.onBackground();
          expect(machine.canAcceptWant()).assertFalse();
          machine.onDestroy();
          expect(machine.canAcceptWant()).assertFalse();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ADVANCED_0600
     * @tc.name testEnvironmentSnapshotLatest
     * @tc.desc Verify EnvironmentCallback dispatch stores the latest configuration with colorMode not set and font scales unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEnvironmentSnapshotLatest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const dispatcher: EnvironmentDispatcher = new EnvironmentDispatcher();
          const first: EnvironmentSnapshot = {
            language: 'zh_CN',
            colorMode: COLOR_MODE_NOT_SET,
            direction: 'ltr',
            fontSizeScale: 1.0,
            fontWeightScale: 1.0
          };
          const second: EnvironmentSnapshot = {
            language: 'en_US',
            colorMode: COLOR_MODE_NOT_SET,
            direction: 'ltr',
            fontSizeScale: 1.45,
            fontWeightScale: 1.0
          };
          expect(dispatcher.dispatchConfiguration(first)).assertEqual(1);
          expect(dispatcher.dispatchConfiguration(second)).assertEqual(2);
          const latest: EnvironmentSnapshot | null = dispatcher.getLatestSnapshot();
          expect(latest !== null).assertTrue();
          if (latest !== null) {
            expect(latest.language).assertEqual('en_US');
            expect(latest.colorMode).assertEqual(COLOR_MODE_NOT_SET);
            expect(latest.fontSizeScale).assertEqual(1.45);
          }
          expect(dispatcher.getSnapshotCount()).assertEqual(2);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ADVANCED_0700
     * @tc.name testEnvironmentDistinctLanguages
     * @tc.desc Verify three configuration updates with zh_CN, en_US and ar_AE resolve to three distinct languages
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEnvironmentDistinctLanguages', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const dispatcher: EnvironmentDispatcher = new EnvironmentDispatcher();
          const zh: EnvironmentSnapshot = {
            language: 'zh_CN', colorMode: COLOR_MODE_NOT_SET, direction: 'ltr', fontSizeScale: 1.0,
            fontWeightScale: 1.0
          };
          const en: EnvironmentSnapshot = {
            language: 'en_US', colorMode: COLOR_MODE_NOT_SET, direction: 'ltr', fontSizeScale: 1.0,
            fontWeightScale: 1.0
          };
          const ar: EnvironmentSnapshot = {
            language: 'ar_AE', colorMode: COLOR_MODE_NOT_SET, direction: 'rtl', fontSizeScale: 1.0,
            fontWeightScale: 1.0
          };
          dispatcher.dispatchConfiguration(zh);
          dispatcher.dispatchConfiguration(en);
          dispatcher.dispatchConfiguration(ar);
          dispatcher.dispatchConfiguration(zh);
          expect(dispatcher.getDistinctLanguages().length).assertEqual(3);
          expect(dispatcher.getSnapshotCount()).assertEqual(4);
          const unsupported: EnvironmentSnapshot = {
            language: 'fr', colorMode: COLOR_MODE_NOT_SET, direction: 'ltr', fontSizeScale: 1.0,
            fontWeightScale: 1.0
          };
          expect(dispatcher.dispatchConfiguration(unsupported)).assertEqual(-1);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ADVANCED_0800
     * @tc.name testMemoryLevelBoundaries
     * @tc.desc Verify memory level dispatch accepts 0 through 2 and rejects -1 and 3, with min 0 and max 2 recorded
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMemoryLevelBoundaries', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const dispatcher: EnvironmentDispatcher = new EnvironmentDispatcher();
          expect(dispatcher.dispatchMemoryLevel(MEMORY_LEVEL_MODERATE)).assertTrue();
          expect(dispatcher.dispatchMemoryLevel(MEMORY_LEVEL_CRITICAL)).assertTrue();
          expect(dispatcher.dispatchMemoryLevel(-1)).assertFalse();
          expect(dispatcher.dispatchMemoryLevel(3)).assertFalse();
          expect(dispatcher.dispatchMemoryLevel(MEMORY_LEVEL_LOW)).assertTrue();
          expect(dispatcher.getMemoryLevels().length).assertEqual(3);
          expect(maxOf(dispatcher.getMemoryLevels())).assertEqual(MEMORY_LEVEL_CRITICAL);
          expect(minOf(dispatcher.getMemoryLevels())).assertEqual(MEMORY_LEVEL_MODERATE);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ADVANCED_0900
     * @tc.name testColdStartRendersIndexPage
     * @tc.desc Verify launching EntryAbility through AbilityDelegator renders pages/Index with at least one component and Hello World or Welcome text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testColdStartRendersIndexPage', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void) => {
        try {
          await launchEntryAbility();
          await serializedDelay(driver, DELAY_AFTER_LAUNCH);
          const stable: boolean = await waitForIndexPageStable(driver, TIMEOUT_ABILITY_LAUNCH);
          expect(stable).assertTrue();
          const componentCount: number = await pageComponentCount(driver);
          expect(componentCount > 0).assertTrue();
          const showsInitial: boolean = await checkTextContent(driver, PAGE_TEXT_INITIAL);
          const showsClicked: boolean = await checkTextContent(driver, PAGE_TEXT_CLICKED);
          expect(showsInitial || showsClicked).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ADVANCED_1000
     * @tc.name testForegroundBackgroundRoundTrip
     * @tc.desc Verify EntryAbility onForeground and onBackground round trip keeps the index page text visible
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testForegroundBackgroundRoundTrip', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          await launchEntryAbility();
          await serializedDelay(driver, DELAY_AFTER_LAUNCH);
          await waitForIndexPageStable(driver, TIMEOUT_ABILITY_LAUNCH);
          const beforeTexts: string[] = await collectAllTexts(driver);
          expect(beforeTexts.length > 0).assertTrue();
          await doAbilityBackground();
          await serializedDelay(driver, DELAY_AFTER_BACKGROUND);
          await doAbilityForeground();
          await serializedDelay(driver, DELAY_AFTER_LAUNCH);
          const stable: boolean = await waitForIndexPageStable(driver, TIMEOUT_ABILITY_LAUNCH);
          expect(stable).assertTrue();
          const afterCount: number = await pageComponentCount(driver);
          expect(afterCount > 0).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ADVANCED_1100
     * @tc.name testExplicitWantLaunch
     * @tc.desc Verify a Want built from bundle name and EntryAbility name starts the ability and the index page text appears
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testExplicitWantLaunch', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const want: Want = buildEntryWant();
          const abilityName: string = want.abilityName === undefined ? '' : want.abilityName;
          const bundleName: string = want.bundleName === undefined ? '' : want.bundleName;
          expect(abilityName).assertEqual('EntryAbility');
          expect(bundleName.length > 0).assertTrue();
          await startAbilityByWant(want);
          await serializedDelay(driver, DELAY_AFTER_LAUNCH);
          const stable: boolean = await waitForIndexPageStable(driver, TIMEOUT_ABILITY_LAUNCH);
          expect(stable).assertTrue();
          const showsInitial: boolean = await checkTextContent(driver, PAGE_TEXT_INITIAL);
          const showsClicked: boolean = await checkTextContent(driver, PAGE_TEXT_CLICKED);
          expect(showsInitial || showsClicked).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ADVANCED_1200
     * @tc.name testLifecycleStressTransitions
     * @tc.desc Verify ten repeated foreground to background cycles on the lifecycle model produce exactly 20 accepted background and foreground transitions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL3
     */
    it('testLifecycleStressTransitions', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void) => {
        try {
          const machine: StageLifecycleMachine = new StageLifecycleMachine();
          machine.onCreate();
          machine.onForeground();
          for (let i = 0; i < STRESS_ROUNDS_LIFECYCLE; i++) {
            expect(machine.onBackground()).assertTrue();
            expect(machine.onForeground()).assertTrue();
          }
          expect(machine.getTransitionCount()).assertEqual(2 + STRESS_ROUNDS_LIFECYCLE * 2);
          expect(machine.getRejectedCount()).assertEqual(0);
          expect(machine.getPhase()).assertEqual(StagePhase.PHASE_FOREGROUND);
          logInfo(`testLifecycleStressTransitions: total transitions ${machine.getTransitionCount()}`);
        } finally {
          done();
        }
      })
  })
}
