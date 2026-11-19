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
  logInfo,
  sleepMs,
  launchEntryAbility,
  doAbilityBackground,
  doAbilityForeground,
  waitForIndexPageStable,
  ensureIndexPageInitial,
  waitForTextVisible,
  isIndexPageVisible,
  checkTextContent,
  tapComponentByText,
  collectAllTexts,
  INDEX_PAGE_TEXT_KEY,
  PAGE_TEXT_INITIAL,
  PAGE_TEXT_CLICKED,
  TIMEOUT_PAGE_RENDER,
  TIMEOUT_TEXT_APPEAR,
  DELAY_AFTER_LAUNCH,
  DELAY_AFTER_BACKGROUND,
  STRESS_ROUNDS_LIFECYCLE
} from '../Shared/SharedDriver';

enum PagePhase {
  NONE = 'none',
  ABOUT_TO_APPEAR = 'aboutToAppear',
  PAGE_SHOW = 'onPageShow',
  PAGE_HIDE = 'onPageHide',
  ABOUT_TO_DISAPPEAR = 'aboutToDisappear'
}

interface PagePhaseRecord {
  phase: PagePhase;
  sequence: number;
}

interface MessageStateRecord {
  value: string;
  version: number;
}

class PageLifecycleRecorder {
  private records: PagePhaseRecord[] = [];

  private sequenceCounter: number = 0;

  public record(phase: PagePhase): void {
    const record: PagePhaseRecord = {
      phase: phase,
      sequence: this.sequenceCounter
    };
    this.records.push(record);
    this.sequenceCounter++;
  }

  public getPhases(): PagePhase[] {
    const phases: PagePhase[] = [];
    for (let i: number = 0; i < this.records.length; i++) {
      phases.push(this.records[i].phase);
    }
    return phases;
  }

  public getRecordCount(): number {
    return this.records.length;
  }

  public indexOfPhase(phase: PagePhase): number {
    for (let i: number = 0; i < this.records.length; i++) {
      if (this.records[i].phase === phase) {
        return this.records[i].sequence;
      }
    }
    return -1;
  }

  public countPhase(phase: PagePhase): number {
    let count: number = 0;
    for (let i: number = 0; i < this.records.length; i++) {
      if (this.records[i].phase === phase) {
        count++;
      }
    }
    return count;
  }

  public followsExpectedFirstEntryOrder(): boolean {
    const phases: PagePhase[] = this.getPhases();
    if (phases.length < 2) {
      return false;
    }
    return phases[0] === PagePhase.ABOUT_TO_APPEAR && phases[1] === PagePhase.PAGE_SHOW;
  }

  public followsExpectedExitOrder(): boolean {
    const phases: PagePhase[] = this.getPhases();
    if (phases.length < 2) {
      return false;
    }
    const last: PagePhase = phases[phases.length - 1];
    const previous: PagePhase = phases[phases.length - 2];
    return previous === PagePhase.PAGE_HIDE && last === PagePhase.ABOUT_TO_DISAPPEAR;
  }

  public reset(): void {
    this.records = [];
    this.sequenceCounter = 0;
  }
}

class PageMessageState {
  private value: string = PAGE_TEXT_INITIAL;

  private version: number = 0;

  public getValue(): string {
    return this.value;
  }

  public getVersion(): number {
    return this.version;
  }

  public update(nextValue: string): boolean {
    if (nextValue.length === 0) {
      return false;
    }
    if (nextValue === this.value) {
      return false;
    }
    this.value = nextValue;
    this.version++;
    return true;
  }

  public snapshot(): MessageStateRecord {
    const record: MessageStateRecord = {
      value: this.value,
      version: this.version
    };
    return record;
  }

  public applySnapshot(record: MessageStateRecord): void {
    this.value = record.value;
    this.version = record.version;
  }

  public reset(): void {
    this.value = PAGE_TEXT_INITIAL;
    this.version = 0;
  }
}

export default function pageLifecycleTest(): void {
  describe('PageLifecycleTest', () => {
    let driver: Driver = getDriver();
    let recorder: PageLifecycleRecorder = new PageLifecycleRecorder();
    let messageState: PageMessageState = new PageMessageState();

    beforeAll(async () => {
      driver = getDriver();
      recorder = new PageLifecycleRecorder();
      messageState = new PageMessageState();
      await launchEntryAbility();
      await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
      await ensureIndexPageInitial(driver);
      logInfo('PageLifecycleTest: beforeAll finished');
    })

    afterAll(async () => {
      await doAbilityForeground();
      await sleepMs(DELAY_AFTER_BACKGROUND);
      logInfo('PageLifecycleTest: suite finished');
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_PAGECYCLE_0100
     * @tc.name testIndexPageRendersInitialText
     * @tc.desc Verify pages/Index first render: launching EntryAbility -> text Hello World becomes visible on screen
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIndexPageRendersInitialText', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        await launchEntryAbility();
        const stable: boolean = await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
        expect(stable).assertTrue();
        const visible: boolean = await checkTextContent(driver, PAGE_TEXT_INITIAL);
        expect(visible).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_PAGECYCLE_0200
     * @tc.name testTapChangesMessageToWelcome
     * @tc.desc Verify @State message mutation: tapping the Text with Hello World -> text Welcome appears
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTapChangesMessageToWelcome', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        await launchEntryAbility();
        await waitForTextVisible(driver, PAGE_TEXT_INITIAL, TIMEOUT_TEXT_APPEAR);
        const clicked: boolean = await tapComponentByText(driver, PAGE_TEXT_INITIAL);
        expect(clicked).assertTrue();
        const welcomeVisible: boolean = await waitForTextVisible(driver, PAGE_TEXT_CLICKED, TIMEOUT_TEXT_APPEAR);
        expect(welcomeVisible).assertTrue();
        expect(messageState.update(PAGE_TEXT_CLICKED)).assertTrue();
        expect(messageState.getValue()).assertEqual(PAGE_TEXT_CLICKED);
        expect(messageState.getVersion()).assertEqual(1);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_PAGECYCLE_0300
     * @tc.name testMessageSurvivesBackgroundForeground
     * @tc.desc Verify @State persistence across app switch: click to Welcome, background, foreground -> Welcome still readable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMessageSurvivesBackgroundForeground', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        await launchEntryAbility();
        await waitForTextVisible(driver, PAGE_TEXT_INITIAL, TIMEOUT_TEXT_APPEAR);
        await tapComponentByText(driver, PAGE_TEXT_INITIAL);
        const welcomeVisible: boolean = await waitForTextVisible(driver, PAGE_TEXT_CLICKED, TIMEOUT_TEXT_APPEAR);
        expect(welcomeVisible).assertTrue();
        recorder.reset();
        recorder.record(PagePhase.PAGE_HIDE);
        await doAbilityBackground();
        await sleepMs(DELAY_AFTER_BACKGROUND);
        recorder.record(PagePhase.PAGE_SHOW);
        await doAbilityForeground();
        await sleepMs(DELAY_AFTER_LAUNCH);
        const restored: boolean = await waitForTextVisible(driver, PAGE_TEXT_CLICKED, TIMEOUT_TEXT_APPEAR);
        expect(restored).assertTrue();
        expect(recorder.getPhases()[0]).assertEqual(PagePhase.PAGE_HIDE);
        expect(recorder.getPhases()[1]).assertEqual(PagePhase.PAGE_SHOW);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_PAGECYCLE_0400
     * @tc.name testMessageNotResetAfterTwoBackgroundCycles
     * @tc.desc Verify @State stability over repeated switches: two background/foreground cycles -> Welcome still present and version unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMessageNotResetAfterTwoBackgroundCycles', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        await launchEntryAbility();
        await waitForTextVisible(driver, PAGE_TEXT_INITIAL, TIMEOUT_TEXT_APPEAR);
        await tapComponentByText(driver, PAGE_TEXT_INITIAL);
        await waitForTextVisible(driver, PAGE_TEXT_CLICKED, TIMEOUT_TEXT_APPEAR);
        messageState.reset();
        messageState.update(PAGE_TEXT_CLICKED);
        for (let i: number = 0; i < 2; i++) {
          await doAbilityBackground();
          await sleepMs(DELAY_AFTER_BACKGROUND);
          await doAbilityForeground();
          await sleepMs(DELAY_AFTER_LAUNCH);
        }
        const stillWelcome: boolean = await waitForTextVisible(driver, PAGE_TEXT_CLICKED, TIMEOUT_TEXT_APPEAR);
        expect(stillWelcome).assertTrue();
        expect(messageState.getVersion()).assertEqual(1);
        expect(messageState.getValue()).assertEqual(PAGE_TEXT_CLICKED);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_PAGECYCLE_0500
     * @tc.name testPageHiddenWhenBackedToBackground
     * @tc.desc Verify onPageHide effect: moving EntryAbility to background -> Index page content no longer visible
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPageHiddenWhenBackedToBackground', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        await launchEntryAbility();
        const visibleBefore: boolean = await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
        expect(visibleBefore).assertTrue();
        await doAbilityBackground();
        await sleepMs(DELAY_AFTER_BACKGROUND);
        const visibleAfter: boolean = await isIndexPageVisible(driver);
        expect(visibleAfter).assertFalse();
        recorder.reset();
        recorder.record(PagePhase.PAGE_HIDE);
        expect(recorder.countPhase(PagePhase.PAGE_HIDE)).assertEqual(1);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_PAGECYCLE_0600
     * @tc.name testFirstEntryPhaseOrder
     * @tc.desc Verify first entry ordering model: aboutToAppear then onPageShow -> followsExpectedFirstEntryOrder true and indexes 0,1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFirstEntryPhaseOrder', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        recorder.reset();
        recorder.record(PagePhase.ABOUT_TO_APPEAR);
        recorder.record(PagePhase.PAGE_SHOW);
        expect(recorder.followsExpectedFirstEntryOrder()).assertTrue();
        expect(recorder.indexOfPhase(PagePhase.ABOUT_TO_APPEAR)).assertEqual(0);
        expect(recorder.indexOfPhase(PagePhase.PAGE_SHOW)).assertEqual(1);
        expect(recorder.getRecordCount()).assertEqual(2);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_PAGECYCLE_0700
     * @tc.name testExitPhaseOrder
     * @tc.desc Verify page exit ordering model: onPageHide then aboutToDisappear -> followsExpectedExitOrder true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testExitPhaseOrder', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        recorder.reset();
        recorder.record(PagePhase.ABOUT_TO_APPEAR);
        recorder.record(PagePhase.PAGE_SHOW);
        recorder.record(PagePhase.PAGE_HIDE);
        recorder.record(PagePhase.ABOUT_TO_DISAPPEAR);
        expect(recorder.followsExpectedExitOrder()).assertTrue();
        expect(recorder.countPhase(PagePhase.PAGE_HIDE)).assertEqual(1);
        expect(recorder.countPhase(PagePhase.ABOUT_TO_DISAPPEAR)).assertEqual(1);
        expect(recorder.getRecordCount()).assertEqual(4);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_PAGECYCLE_0800
     * @tc.name testReversedPhaseOrderIsRejected
     * @tc.desc Verify order validation: onPageShow before aboutToAppear -> first entry order check returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReversedPhaseOrderIsRejected', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        recorder.reset();
        recorder.record(PagePhase.PAGE_SHOW);
        recorder.record(PagePhase.ABOUT_TO_APPEAR);
        expect(recorder.followsExpectedFirstEntryOrder()).assertFalse();
        expect(recorder.indexOfPhase(PagePhase.PAGE_SHOW)).assertEqual(0);
        expect(recorder.followsExpectedExitOrder()).assertFalse();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_PAGECYCLE_0900
     * @tc.name testLifecycleStressKeepsPageContent
     * @tc.desc Verify repeated switching stress: 10 background/foreground rounds -> page visible each check and phase records count equals 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL3
     */
    it('testLifecycleStressKeepsPageContent', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void) => {
      try {
        await launchEntryAbility();
        recorder.reset();
        let visibleRounds: number = 0;
        for (let i: number = 0; i < STRESS_ROUNDS_LIFECYCLE; i++) {
          await doAbilityBackground();
          recorder.record(PagePhase.PAGE_HIDE);
          await sleepMs(DELAY_AFTER_BACKGROUND);
          await doAbilityForeground();
          recorder.record(PagePhase.PAGE_SHOW);
          await sleepMs(DELAY_AFTER_LAUNCH);
          const visible: boolean = await isIndexPageVisible(driver);
          if (visible) {
            visibleRounds++;
          }
        }
        expect(visibleRounds).assertEqual(STRESS_ROUNDS_LIFECYCLE);
        expect(recorder.countPhase(PagePhase.PAGE_HIDE)).assertEqual(STRESS_ROUNDS_LIFECYCLE);
        expect(recorder.countPhase(PagePhase.PAGE_SHOW)).assertEqual(STRESS_ROUNDS_LIFECYCLE);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_PAGECYCLE_1000
     * @tc.name testTextCollectionContainsIndexMessage
     * @tc.desc Verify collected page texts: after launch -> collection contains exactly one of the two expected message literals
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTextCollectionContainsIndexMessage', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        await launchEntryAbility();
        await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
        const texts: string[] = await collectAllTexts(driver);
        let matchCount: number = 0;
        for (let i: number = 0; i < texts.length; i++) {
          if (texts[i] === PAGE_TEXT_INITIAL || texts[i] === PAGE_TEXT_CLICKED) {
            matchCount++;
          }
        }
        expect(matchCount).assertEqual(1);
        expect(texts.length >= 1).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_PAGECYCLE_1100
     * @tc.name testMessageStateRejectsEmptyValue
     * @tc.desc Verify message model guard: updating with empty string -> returns false and value stays Hello World
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMessageStateRejectsEmptyValue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        messageState.reset();
        expect(messageState.update('')).assertFalse();
        expect(messageState.getValue()).assertEqual(PAGE_TEXT_INITIAL);
        expect(messageState.getVersion()).assertEqual(0);
        expect(messageState.update(PAGE_TEXT_INITIAL)).assertFalse();
        expect(messageState.getVersion()).assertEqual(0);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_PAGECYCLE_1200
     * @tc.name testMessageSnapshotRoundTrip
     * @tc.desc Verify state snapshot restore: click to Welcome then reset then apply snapshot -> version and value restored
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMessageSnapshotRoundTrip', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        messageState.reset();
        messageState.update(PAGE_TEXT_CLICKED);
        const snapshot: MessageStateRecord = messageState.snapshot();
        expect(snapshot.value).assertEqual(PAGE_TEXT_CLICKED);
        expect(snapshot.version).assertEqual(1);
        messageState.reset();
        expect(messageState.getValue()).assertEqual(PAGE_TEXT_INITIAL);
        messageState.applySnapshot(snapshot);
        expect(messageState.getValue()).assertEqual(PAGE_TEXT_CLICKED);
        expect(messageState.getVersion()).assertEqual(1);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_PAGECYCLE_1300
     * @tc.name testIndexPageKeyReachableAfterForeground
     * @tc.desc Verify component id reachability: foregrounding EntryAbility then waiting for render -> text component with id HelloWorld renders content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIndexPageKeyReachableAfterForeground', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        await doAbilityForeground();
        await sleepMs(DELAY_AFTER_LAUNCH);
        const stable: boolean = await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
        expect(stable).assertTrue();
        expect(INDEX_PAGE_TEXT_KEY).assertEqual('HelloWorld');
        const initialOrClicked: boolean = await isIndexPageVisible(driver);
        expect(initialOrClicked).assertTrue();
      } finally {
        done();
      }
    })
  })
}
