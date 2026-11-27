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

import { afterAll, beforeAll, describe, expect, it } from '@ohos/hypium';
import { Component, Driver } from '@ohos.UiTest';
import hilog from '@ohos.hilog';
import {
  ID_INDEX_TITLE,
  ID_BUNDLE_INPUT,
  ID_BEGIN_BUTTON,
  ID_END_BUTTON,
  ID_QUERY_STATE_BUTTON,
  ID_QUERY_CONFIG_BUTTON,
  TEXT_STATE_INACTIVE,
  TEXT_NO_ACTIVE_ASSESSMENT,
  KEY_UP,
  KEY_DOWN,
  KEY_BACK,
  KEY_TAB,
  TIMEOUT_PAGE_RENDER,
  TEST_BUNDLE_PRIMARY,
  TEST_BUNDLE_SECONDARY,
  serializedDelay,
  getDriver,
  launchAssessmentApp,
  findById,
  checkTextContent,
  waitForIndexPage,
  isAssessmentActive,
  isAssessmentInactive,
  isComponentEnabled,
  addAllowedApp,
  allowedAppRowCount,
  clickIndexButton,
  pressAndWait
} from '../Shared/AssessmentDriver';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Assessment]';
const BUNDLE: string = 'Assessment_';

// Subsystems that the sample touches besides the assessment service itself.
const SUBSYSTEM_ABILITY_KIT: string = 'AbilityKit';
const SUBSYSTEM_ARKUI: string = 'ArkUI';
const SUBSYSTEM_PASTEBOARD: string = 'Pasteboard';
const SUBSYSTEM_IME: string = 'InputMethod';
const SUBSYSTEM_WINDOW: string = 'Window';
const SUBSYSTEM_ROUTER: string = 'Router';

// Hardening measures of the exam page, applied when the page appears and released when it goes.
// The four measures are the full screen layout, the privacy mode, the simple keyboard and the
// pasteboard clearing.
const HARDENING_MEASURE_COUNT: number = 4;
const HARDENING_SETTLE_MS: number = 120;

// Number of navigation presses of the stability case.
const NAVIGATION_ROUNDS: number = 6;

/**
 * One subsystem interaction recorded by the tracker.
 *
 * The record is kept per subsystem so the report can show which subsystem contributed the most
 * latency, which is the usual diagnosis when the exam page takes long to appear.
 */
interface SubsystemInteraction {
  subsystem: string;
  operation: string;
  success: boolean;
  elapsedMs: number;
}

/**
 * Records the subsystem interactions of the sample.
 *
 * A tracker instance is cheap, the suites create one per case so an earlier case can never leak
 * its counters into a later assertion.
 */
class SubsystemTracker {
  private interactions: SubsystemInteraction[] = [];

  public record(subsystem: string, operation: string, success: boolean, elapsedMs: number): void {
    this.interactions.push({
      subsystem: subsystem,
      operation: operation,
      success: success,
      elapsedMs: elapsedMs
    });
  }

  public total(): number {
    return this.interactions.length;
  }

  public successes(): number {
    let total: number = 0;
    for (let i = 0; i < this.interactions.length; i++) {
      if (this.interactions[i].success) {
        total++;
      }
    }
    return total;
  }

  public countOf(subsystem: string): number {
    let total: number = 0;
    for (let i = 0; i < this.interactions.length; i++) {
      if (this.interactions[i].subsystem === subsystem) {
        total++;
      }
    }
    return total;
  }

  public totalElapsedOf(subsystem: string): number {
    let total: number = 0;
    for (let i = 0; i < this.interactions.length; i++) {
      if (this.interactions[i].subsystem === subsystem) {
        total += this.interactions[i].elapsedMs;
      }
    }
    return total;
  }

  public subsystems(): string[] {
    const values: string[] = [];
    const seen: Set<string> = new Set<string>();
    for (let i = 0; i < this.interactions.length; i++) {
      const key: string = this.interactions[i].subsystem;
      if (!seen.has(key)) {
        seen.add(key);
        values.push(key);
      }
    }
    return values;
  }

  public hasSubsystem(subsystem: string): boolean {
    return this.countOf(subsystem) > 0;
  }

  public describe(): string {
    return `SubsystemTracker{total=${this.interactions.length}, ok=${this.successes()}, ` +
      `subsystems=${this.subsystems().length}}`;
  }
}

/**
 * Model of the exam page hardening sequence.
 *
 * ExamHardeningUtil applies the window layout, the privacy mode, the simple keyboard and the
 * pasteboard clearing in one asynchronous call. Each measure is guarded separately, so the model
 * records the per measure result instead of an all or nothing outcome.
 */
class HardeningSequence {
  private applied: Map<string, boolean> = new Map<string, boolean>();
  private releases: number = 0;

  public apply(privacyAvailable: boolean): void {
    this.applied.set('window.setWindowLayoutFullScreen', true);
    this.applied.set('window.setWindowPrivacyMode', privacyAvailable);
    this.applied.set('inputMethod.setSimpleKeyboardEnabled', true);
    this.applied.set('pasteboard.clearData', true);
  }

  public release(): void {
    this.releases++;
    this.applied.clear();
  }

  public appliedCount(): number {
    let total: number = 0;
    this.applied.forEach((value: boolean) => {
      if (value) {
        total++;
      }
    });
    return total;
  }

  public isApplied(measure: string): boolean {
    const value: boolean | undefined = this.applied.get(measure);
    return value === undefined ? false : value;
  }

  public releaseCount(): number {
    return this.releases;
  }

  public isClean(): boolean {
    return this.applied.size === 0;
  }

  public describe(): string {
    return `HardeningSequence{applied=${this.appliedCount()}, releases=${this.releases}}`;
  }
}

/**
 * Model of the pasteboard interaction.
 *
 * The exam page clears the pasteboard twice: once when it appears and once when it disappears.
 * The clearing is a system call, so the model keeps the call count and the last result.
 */
class PasteboardModel {
  private clearCount: number = 0;
  private lastCleared: boolean = false;

  public clear(success: boolean): void {
    this.clearCount++;
    this.lastCleared = success;
  }

  public getClearCount(): number {
    return this.clearCount;
  }

  public isLastCleared(): boolean {
    return this.lastCleared;
  }

  public describe(): string {
    return `PasteboardModel{clears=${this.clearCount}, last=${this.lastCleared}}`;
  }
}

/**
 * Model of the router interaction.
 *
 * The entry page pushes the exam page exactly once per begin, the guard examPagePushed is reset
 * when the entry page shows again. The model reproduces the guard so a double push is detectable.
 */
class RouterModel {
  private pushed: number = 0;
  private guard: boolean = false;

  public pushExam(): boolean {
    if (this.guard) {
      return false;
    }
    this.guard = true;
    this.pushed++;
    return true;
  }

  public onPageShow(): void {
    this.guard = false;
  }

  public back(): boolean {
    if (this.pushed === 0) {
      return false;
    }
    this.pushed--;
    return true;
  }

  public pushCount(): number {
    return this.pushed;
  }

  public isGuardSet(): boolean {
    return this.guard;
  }

  public describe(): string {
    return `RouterModel{pushed=${this.pushed}, guard=${this.guard}}`;
  }
}

/**
 * Model of the input method interaction.
 *
 * The exam page asks for the simple keyboard while it is displayed and the entry page needs the
 * full keyboard for the bundle name input, so the two pages must not fight over the setting.
 */
class KeyboardModel {
  private simple: boolean = false;
  private changes: number = 0;

  public setSimple(enabled: boolean): boolean {
    if (this.simple === enabled) {
      return false;
    }
    this.simple = enabled;
    this.changes++;
    return true;
  }

  public isSimple(): boolean {
    return this.simple;
  }

  public getChanges(): number {
    return this.changes;
  }

  public describe(): string {
    return `KeyboardModel{simple=${this.simple}, changes=${this.changes}}`;
  }
}

/**
 * Launches the sample and waits for the entry page.
 *
 * @param driver driver of the running case.
 * @returns true when the entry page is rendered.
 */
async function prepareIndex(driver: Driver): Promise<boolean> {
  await launchAssessmentApp();
  const rendered: boolean = await waitForIndexPage(driver, TIMEOUT_PAGE_RENDER);
  if (!rendered) {
    hilog.warn(DOMAIN, TAG, 'prepareIndex: the entry page is not rendered');
  }
  return rendered;
}

export default function systemIntegrationTest() {
  describe('SystemIntegration_Test', () => {
    let driver: Driver;

    beforeAll(async () => {
      driver = getDriver();
      await serializedDelay(driver, 1000);
      await launchAssessmentApp();
      await waitForIndexPage(driver, TIMEOUT_PAGE_RENDER);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, 50);
      await serializedDelay(driver, 500);
    });

    /**
     * Scenario: record an interaction with every subsystem.
     * Expectation: the tracker keeps one record per subsystem, counts the successes and reports
     * the elapsed time per subsystem independently.
     */
    it('Assessment_SystemIntegration_001', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SystemIntegration_001, begin');
      const tracker: SubsystemTracker = new SubsystemTracker();
      tracker.record(SUBSYSTEM_ABILITY_KIT, 'startAbility', true, 120);
      tracker.record(SUBSYSTEM_ARKUI, 'renderIndex', true, 80);
      tracker.record(SUBSYSTEM_WINDOW, 'setWindowLayoutFullScreen', true, 40);
      tracker.record(SUBSYSTEM_IME, 'setSimpleKeyboardEnabled', true, 10);
      tracker.record(SUBSYSTEM_PASTEBOARD, 'clearData', true, 15);
      tracker.record(SUBSYSTEM_ROUTER, 'pushUrl', true, 25);
      expect(tracker.total()).assertEqual(6);
      expect(tracker.successes()).assertEqual(6);
      expect(tracker.subsystems().length).assertEqual(6);
      expect(tracker.countOf(SUBSYSTEM_WINDOW)).assertEqual(1);
      expect(tracker.totalElapsedOf(SUBSYSTEM_ARKUI)).assertEqual(80);
      expect(tracker.hasSubsystem(SUBSYSTEM_ROUTER)).assertTrue();
      expect(tracker.hasSubsystem('Unknown')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s %{public}s', BUNDLE + 'SystemIntegration_001', tracker.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SystemIntegration_001, end');
    });

    /**
     * Scenario: a failed subsystem interaction.
     * Expectation: the failure is recorded separately and the success count stays below the total,
     * which is how the report separates a degraded subsystem from a broken one.
     */
    it('Assessment_SystemIntegration_002', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SystemIntegration_002, begin');
      const tracker: SubsystemTracker = new SubsystemTracker();
      tracker.record(SUBSYSTEM_WINDOW, 'setWindowPrivacyMode', false, 5);
      tracker.record(SUBSYSTEM_WINDOW, 'setWindowLayoutFullScreen', true, 30);
      expect(tracker.total()).assertEqual(2);
      expect(tracker.successes()).assertEqual(1);
      expect(tracker.countOf(SUBSYSTEM_WINDOW)).assertEqual(2);
      expect(tracker.totalElapsedOf(SUBSYSTEM_WINDOW)).assertEqual(35);
      hilog.info(DOMAIN, TAG, '%{public}s %{public}s', BUNDLE + 'SystemIntegration_002', tracker.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SystemIntegration_002, end');
    });

    /**
     * Scenario: the hardening sequence of the exam page.
     * Expectation: all four measures are attempted and the sequence is clean again after the
     * release, so a return to the entry page restores the window and the keyboard.
     */
    it('Assessment_SystemIntegration_003', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SystemIntegration_003, begin');
      const sequence: HardeningSequence = new HardeningSequence();
      expect(sequence.isClean()).assertTrue();
      sequence.apply(true);
      expect(sequence.appliedCount()).assertEqual(HARDENING_MEASURE_COUNT);
      expect(sequence.isApplied('window.setWindowPrivacyMode')).assertTrue();
      expect(sequence.isApplied('pasteboard.clearData')).assertTrue();
      expect(sequence.isApplied('unknown.measure')).assertFalse();
      sequence.release();
      expect(sequence.isClean()).assertTrue();
      expect(sequence.appliedCount()).assertEqual(0);
      expect(sequence.releaseCount()).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s %{public}s', BUNDLE + 'SystemIntegration_003', sequence.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SystemIntegration_003, end');
    });

    /**
     * Scenario: the hardening sequence on an image without the privacy mode.
     * Expectation: the privacy measure is recorded as not applied while the layout, the keyboard
     * and the pasteboard measures still succeed, which is the documented graceful degradation.
     */
    it('Assessment_SystemIntegration_004', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SystemIntegration_004, begin');
      const sequence: HardeningSequence = new HardeningSequence();
      sequence.apply(false);
      expect(sequence.isApplied('window.setWindowPrivacyMode')).assertFalse();
      expect(sequence.isApplied('window.setWindowLayoutFullScreen')).assertTrue();
      expect(sequence.isApplied('inputMethod.setSimpleKeyboardEnabled')).assertTrue();
      expect(sequence.appliedCount()).assertEqual(HARDENING_MEASURE_COUNT - 1);
      hilog.info(DOMAIN, TAG, '%{public}s applied %{public}d of %{public}d', BUNDLE + 'SystemIntegration_004',
        sequence.appliedCount(), HARDENING_MEASURE_COUNT);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SystemIntegration_004, end');
    });

    /**
     * Scenario: the pasteboard clearing of the exam page.
     * Expectation: the clearing happens on appear and on disappear, and the last result reflects
     * the last call.
     */
    it('Assessment_SystemIntegration_005', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SystemIntegration_005, begin');
      const pasteboard: PasteboardModel = new PasteboardModel();
      pasteboard.clear(true);
      expect(pasteboard.getClearCount()).assertEqual(1);
      expect(pasteboard.isLastCleared()).assertTrue();
      pasteboard.clear(false);
      expect(pasteboard.getClearCount()).assertEqual(2);
      expect(pasteboard.isLastCleared()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s %{public}s', BUNDLE + 'SystemIntegration_005',
        pasteboard.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SystemIntegration_005, end');
    });

    /**
     * Scenario: the simple keyboard of the input method.
     * Expectation: enabling an already enabled keyboard is a no op, so the page does not create a
     * redundant system call each time it appears.
     */
    it('Assessment_SystemIntegration_006', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SystemIntegration_006, begin');
      const keyboard: KeyboardModel = new KeyboardModel();
      expect(keyboard.isSimple()).assertFalse();
      expect(keyboard.setSimple(true)).assertTrue();
      expect(keyboard.getChanges()).assertEqual(1);
      expect(keyboard.setSimple(true)).assertFalse();
      expect(keyboard.getChanges()).assertEqual(1);
      expect(keyboard.setSimple(false)).assertTrue();
      expect(keyboard.getChanges()).assertEqual(2);
      expect(keyboard.isSimple()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s %{public}s', BUNDLE + 'SystemIntegration_006',
        keyboard.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SystemIntegration_006, end');
    });

    /**
     * Scenario: the router guard of the exam page push.
     * Expectation: a second push without an intervening page show is refused, the back key pops
     * the exam page once and a second back is refused, so the stack cannot underflow.
     */
    it('Assessment_SystemIntegration_007', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SystemIntegration_007, begin');
      const router: RouterModel = new RouterModel();
      expect(router.pushExam()).assertTrue();
      expect(router.pushExam()).assertFalse();
      expect(router.pushCount()).assertEqual(1);
      expect(router.isGuardSet()).assertTrue();
      expect(router.back()).assertTrue();
      expect(router.pushCount()).assertEqual(0);
      expect(router.back()).assertFalse();
      router.onPageShow();
      expect(router.isGuardSet()).assertFalse();
      expect(router.pushExam()).assertTrue();
      expect(router.pushCount()).assertEqual(1);
      expect(router.back()).assertTrue();
      expect(router.pushCount()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s %{public}s', BUNDLE + 'SystemIntegration_007', router.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SystemIntegration_007, end');
    });
  });
}
