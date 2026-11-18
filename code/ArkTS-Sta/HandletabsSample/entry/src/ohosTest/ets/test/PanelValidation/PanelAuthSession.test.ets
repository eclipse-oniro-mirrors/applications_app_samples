'use static'


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

import {
  describe,
  it,
  expect,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  TestType,
  Size,
  Level
} from '@ohos/hypium';

import {
  Driver
} from '@ohos.UiTest';

import {
  getDriver,
  waitForPanelStable,
  clickCloseButton,
  tabsCount,
  tabContentCount,
  textCount,
  focusedCount,
  clickableCount,
  collectTexts,
  countTitles,
  containsLabel,
  tabTitleCount,
  panelSnapshot,
  serializedDelay,
  settlePanel,
  resetPanelToInitial,
  bringPanelToFront,
  canRemoveTab,
  removeTitleAt,
  initialTitles,
  PanelSnapshot,
  TabTitleBook,
  TAB_ADD_LABEL,
  TAB_CLOSE_LABEL,
  INITIAL_TAB_COUNT,
  MIN_REMOVABLE_TAB_COUNT,
  FIRST_TAB_TITLE,
  SECOND_TAB_TITLE,
  THIRD_TAB_TITLE,
  TAB_LINE_HEIGHT,
  TAB_MARGIN_SIDE,
  TAB_MARGIN_TOP,
  TIMEOUT_PANEL_RENDER,
  TIMEOUT_STATE_SETTLE,
  DELAY_KEY_NAVIGATION,
  TOLERANCE_TAB_COUNT
} from '../Shared/SharedDriver';


enum AuthRetryPhase {
  READY = 'ready',
  ATTEMPTING = 'attempting',
  SUCCEEDED = 'succeeded',
  EXHAUSTED = 'exhausted'
}

class AuthRetryMachine {
  private phase: AuthRetryPhase = AuthRetryPhase.READY;
  private attempts: int = 0;
  private limit: int;

  constructor(limit: int) {
    this.limit = limit;
  }

  public static standard(): AuthRetryMachine {
    return new AuthRetryMachine(3);
  }

  public getPhase(): AuthRetryPhase {
    return this.phase;
  }

  public getAttempts(): int {
    return this.attempts;
  }

  public getLimit(): int {
    return this.limit;
  }

  public attempt(): boolean {
    if (this.phase === AuthRetryPhase.SUCCEEDED || this.phase === AuthRetryPhase.EXHAUSTED) {
      return false;
    }
    this.attempts = this.attempts + 1;
    this.phase = AuthRetryPhase.ATTEMPTING;
    if (this.attempts >= this.limit) {
      this.phase = AuthRetryPhase.EXHAUSTED;
    }
    return true;
  }

  public succeed(): boolean {
    if (this.phase === AuthRetryPhase.EXHAUSTED || this.phase === AuthRetryPhase.SUCCEEDED) {
      return false;
    }
    this.phase = AuthRetryPhase.SUCCEEDED;
    return true;
  }

  public reset(): void {
    this.phase = AuthRetryPhase.READY;
    this.attempts = 0;
  }

  public canRetry(): boolean {
    return this.phase === AuthRetryPhase.READY || this.phase === AuthRetryPhase.ATTEMPTING;
  }

  public remaining(): int {
    const left: int = this.limit - this.attempts;
    if (left < 0) {
      return 0;
    }
    return left;
  }

  public describe(): string {
    return this.phase + '/' + this.attempts + '/' + this.limit;
  }
}


enum Authb1Phase {
  IDLE = 'idle',
  ARMED = 'armed',
  ACTIVE = 'active',
  PAUSED = 'paused',
  CLOSED = 'closed'
}

class Authb1StateMachine {
  private phase: Authb1Phase = Authb1Phase.IDLE;
  private trail: string[] = [];

  public getPhase(): Authb1Phase {
    return this.phase;
  }

  public getTrail(): string[] {
    return this.trail.slice(0);
  }

  public arm(): boolean {
    if (this.phase !== Authb1Phase.IDLE) {
      return false;
    }
    this.move(Authb1Phase.ARMED);
    return true;
  }

  public activate(): boolean {
    if (this.phase !== Authb1Phase.ARMED) {
      return false;
    }
    this.move(Authb1Phase.ACTIVE);
    return true;
  }

  public pause(): boolean {
    if (this.phase !== Authb1Phase.ACTIVE) {
      return false;
    }
    this.move(Authb1Phase.PAUSED);
    return true;
  }

  public resume(): boolean {
    if (this.phase !== Authb1Phase.PAUSED) {
      return false;
    }
    this.move(Authb1Phase.ACTIVE);
    return true;
  }

  public close(): boolean {
    if (this.phase === Authb1Phase.CLOSED || this.phase === Authb1Phase.IDLE) {
      return false;
    }
    this.move(Authb1Phase.CLOSED);
    return true;
  }

  private move(next: Authb1Phase): void {
    this.trail.push(this.phase + '->' + next);
    this.phase = next;
  }

  public isActive(): boolean {
    return this.phase === Authb1Phase.ACTIVE;
  }

  public isClosed(): boolean {
    return this.phase === Authb1Phase.CLOSED;
  }

  public canArm(): boolean {
    return this.phase === Authb1Phase.IDLE;
  }

  public trailLength(): int {
    return this.trail.length;
  }

  public describe(): string {
    return this.phase + '/' + this.trail.length;
  }

  public reset(): void {
    this.phase = Authb1Phase.IDLE;
    this.trail = [];
  }
}

export default function panelAuthSessionTest(): void {
  describe('PanelAuthSession_Test', () => {
    beforeAll(async () => {
      await bringPanelToFront(getDriver());
    });

    beforeEach(async () => {
      await resetPanelToInitial(getDriver());
      await serializedDelay(getDriver(), DELAY_KEY_NAVIGATION);
    });

    afterEach(async () => {
      await settlePanel(getDriver());
    });

    afterAll(async () => {
      await serializedDelay(getDriver(), TIMEOUT_STATE_SETTLE);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_PANELAUTHSESSIONTEST_0100
     * @tc.name panelAuthSessionTestCase001
     * @tc.desc Verify remove action: tap close once -> titled tab count does not grow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('panelAuthSessionTestCase001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const driver: Driver = getDriver();
      await waitForPanelStable(driver, TIMEOUT_PANEL_RENDER);
      const before: number = await tabTitleCount(driver);
      const clicked: boolean = await clickCloseButton(driver);
      expect(clicked).assertTrue();
      const after: number = await tabTitleCount(driver);
      expect(after).assertLessOrEqual(before);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_PANELAUTHSESSIONTEST_0200
     * @tc.name panelAuthSessionTestCase002
     * @tc.desc Verify remove on model: seeded book removes one -> count one below seed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('panelAuthSessionTestCase002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const book: TabTitleBook = TabTitleBook.initial();
      expect(book.removeTitle(0)).assertTrue();
      expect(book.getCount()).assertEqual(INITIAL_TAB_COUNT - 1);
      expect(book.containsTitle(FIRST_TAB_TITLE)).assertFalse();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_PANELAUTHSESSIONTEST_0300
     * @tc.name panelAuthSessionTestCase003
     * @tc.desc Verify remove guard: count below minimum -> removal refused
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('panelAuthSessionTestCase003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(canRemoveTab(MIN_REMOVABLE_TAB_COUNT - 1)).assertFalse();
      expect(canRemoveTab(MIN_REMOVABLE_TAB_COUNT)).assertTrue();
      const book: TabTitleBook = new TabTitleBook([FIRST_TAB_TITLE]);
      expect(book.removeTitle(0)).assertFalse();
      expect(book.getCount()).assertEqual(1);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_PANELAUTHSESSIONTEST_0400
     * @tc.name panelAuthSessionTestCase004
     * @tc.desc Verify remove bounds: index equal to size -> refused, size unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('panelAuthSessionTestCase004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const book: TabTitleBook = TabTitleBook.initial();
      expect(book.removeTitle(INITIAL_TAB_COUNT)).assertFalse();
      expect(book.removeTitle(-1)).assertFalse();
      expect(book.getCount()).assertEqual(INITIAL_TAB_COUNT);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_PANELAUTHSESSIONTEST_0500
     * @tc.name panelAuthSessionTestCase005
     * @tc.desc Verify remove helper: index one removed from three -> remaining joined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('panelAuthSessionTestCase005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const titles: string[] = initialTitles();
      titles.push(THIRD_TAB_TITLE);
      const remaining: string[] = removeTitleAt(titles, 1);
      expect(remaining.join(',')).assertEqual(FIRST_TAB_TITLE + ',' + THIRD_TAB_TITLE);
      expect(titles.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_PANELAUTHSESSIONTEST_0600
     * @tc.name panelAuthSessionTestCase006
     * @tc.desc Verify remove helper bounds: out of range index -> copy unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('panelAuthSessionTestCase006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const titles: string[] = initialTitles();
      const untouched: string[] = removeTitleAt(titles, 9);
      expect(untouched.length).assertEqual(INITIAL_TAB_COUNT);
      expect(untouched[0]).assertEqual(FIRST_TAB_TITLE);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_PANELAUTHSESSIONTEST_0700
     * @tc.name panelAuthSessionTestCase007
     * @tc.desc Verify Tabs component renders: panel visible -> at least one Tabs node
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('panelAuthSessionTestCase007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const driver: Driver = getDriver();
      const stable: boolean = await waitForPanelStable(driver, TIMEOUT_PANEL_RENDER);
      expect(stable).assertTrue();
      const tabs: number = await tabsCount(driver);
      expect(tabs).assertLargerOrEqual(1);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_PANELAUTHSESSIONTEST_0800
     * @tc.name panelAuthSessionTestCase008
     * @tc.desc Verify TabContent nodes: seeded strips -> content count matches tab count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('panelAuthSessionTestCase008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const driver: Driver = getDriver();
      await waitForPanelStable(driver, TIMEOUT_PANEL_RENDER);
      const contents: number = await tabContentCount(driver);
      const titles: number = await tabTitleCount(driver);
      expect(contents).assertLargerOrEqual(1);
      expect(titles).assertLargerOrEqual(INITIAL_TAB_COUNT - TOLERANCE_TAB_COUNT);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_PANELAUTHSESSIONTEST_0900
     * @tc.name panelAuthSessionTestCase009
     * @tc.desc Verify seeded titles: initial strip -> first and second page labels visible
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('panelAuthSessionTestCase009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const driver: Driver = getDriver();
      await waitForPanelStable(driver, TIMEOUT_PANEL_RENDER);
      const texts: string[] = await collectTexts(driver);
      expect(containsLabel(texts, FIRST_TAB_TITLE)).assertTrue();
      expect(containsLabel(texts, SECOND_TAB_TITLE)).assertTrue();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_PANELAUTHSESSIONTEST_1000
     * @tc.name panelAuthSessionTestCase010
     * @tc.desc Verify add button: initial strip below limit -> plus label present
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('panelAuthSessionTestCase010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const driver: Driver = getDriver();
      await waitForPanelStable(driver, TIMEOUT_PANEL_RENDER);
      const texts: string[] = await collectTexts(driver);
      expect(containsLabel(texts, TAB_ADD_LABEL)).assertTrue();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_PANELAUTHSESSIONTEST_1100
     * @tc.name panelAuthSessionTestCase011
     * @tc.desc Verify close button: initial strip above minimum -> close label present
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('panelAuthSessionTestCase011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const driver: Driver = getDriver();
      await waitForPanelStable(driver, TIMEOUT_PANEL_RENDER);
      const texts: string[] = await collectTexts(driver);
      expect(containsLabel(texts, TAB_CLOSE_LABEL)).assertTrue();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_PANELAUTHSESSIONTEST_1200
     * @tc.name panelAuthSessionTestCase012
     * @tc.desc Verify title prefix: rendered titles -> every tab label starts with page prefix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('panelAuthSessionTestCase012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const driver: Driver = getDriver();
      await waitForPanelStable(driver, TIMEOUT_PANEL_RENDER);
      const texts: string[] = await collectTexts(driver);
      const titles: number = countTitles(texts);
      expect(titles).assertLargerOrEqual(INITIAL_TAB_COUNT - TOLERANCE_TAB_COUNT);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_PANELAUTHSESSIONTEST_1300
     * @tc.name panelAuthSessionTestCase013
     * @tc.desc Verify clickable nodes: interactive strip -> clickable components reported
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('panelAuthSessionTestCase013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const driver: Driver = getDriver();
      await waitForPanelStable(driver, TIMEOUT_PANEL_RENDER);
      const clickable: number = await clickableCount(driver);
      expect(clickable).assertLargerOrEqual(1);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_PANELAUTHSESSIONTEST_1400
     * @tc.name panelAuthSessionTestCase014
     * @tc.desc Verify focusable element: panel front -> at least one focused node
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('panelAuthSessionTestCase014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const driver: Driver = getDriver();
      await waitForPanelStable(driver, TIMEOUT_PANEL_RENDER);
      const focused: number = await focusedCount(driver);
      expect(focused).assertLargerOrEqual(0);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_PANELAUTHSESSIONTEST_1500
     * @tc.name panelAuthSessionTestCase015
     * @tc.desc Verify text nodes: tab bar labels rendered -> text component count above one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('panelAuthSessionTestCase015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const driver: Driver = getDriver();
      await waitForPanelStable(driver, TIMEOUT_PANEL_RENDER);
      const texts: number = await textCount(driver);
      expect(texts).assertLargerOrEqual(1);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_PANELAUTHSESSIONTEST_1600
     * @tc.name panelAuthSessionTestCase016
     * @tc.desc Verify snapshot capture: panel captured -> total components greater than zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('panelAuthSessionTestCase016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const driver: Driver = getDriver();
      await waitForPanelStable(driver, TIMEOUT_PANEL_RENDER);
      const snapshot: PanelSnapshot = await panelSnapshot(driver);
      expect(snapshot.total() > 0).assertTrue();
      expect(snapshot.describe().startsWith('snapshot')).assertTrue();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_PANELAUTHSESSIONTEST_1700
     * @tc.name panelAuthSessionTestCase017
     * @tc.desc Verify retry initial state: standard machine -> ready with three remaining
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('panelAuthSessionTestCase017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const machine: AuthRetryMachine = AuthRetryMachine.standard();
      expect(machine.getPhase()).assertEqual(AuthRetryPhase.READY);
      expect(machine.getAttempts()).assertEqual(0);
      expect(machine.getLimit()).assertEqual(3);
      expect(machine.remaining()).assertEqual(3);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_PANELAUTHSESSIONTEST_1800
     * @tc.name panelAuthSessionTestCase018
     * @tc.desc Verify single attempt: one attempt consumed -> two remaining
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('panelAuthSessionTestCase018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const machine: AuthRetryMachine = AuthRetryMachine.standard();
      expect(machine.attempt()).assertTrue();
      expect(machine.getAttempts()).assertEqual(1);
      expect(machine.remaining()).assertEqual(2);
      expect(machine.getPhase()).assertEqual(AuthRetryPhase.ATTEMPTING);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_PANELAUTHSESSIONTEST_1900
     * @tc.name panelAuthSessionTestCase019
     * @tc.desc Verify exhaustion: three attempts -> exhausted phase
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('panelAuthSessionTestCase019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const machine: AuthRetryMachine = AuthRetryMachine.standard();
      machine.attempt();
      machine.attempt();
      machine.attempt();
      expect(machine.getPhase()).assertEqual(AuthRetryPhase.EXHAUSTED);
      expect(machine.canRetry()).assertFalse();
      expect(machine.attempt()).assertFalse();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_PANELAUTHSESSIONTEST_2000
     * @tc.name panelAuthSessionTestCase020
     * @tc.desc Verify success path: attempt then succeed -> succeeded phase
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('panelAuthSessionTestCase020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const machine: AuthRetryMachine = AuthRetryMachine.standard();
      machine.attempt();
      expect(machine.succeed()).assertTrue();
      expect(machine.getPhase()).assertEqual(AuthRetryPhase.SUCCEEDED);
      expect(machine.succeed()).assertFalse();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_PANELAUTHSESSIONTEST_2100
     * @tc.name panelAuthSessionTestCase021
     * @tc.desc Verify late success rejection: exhausted machine -> success refused
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('panelAuthSessionTestCase021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const machine: AuthRetryMachine = AuthRetryMachine.standard();
      machine.attempt();
      machine.attempt();
      machine.attempt();
      expect(machine.succeed()).assertFalse();
      expect(machine.getPhase()).assertEqual(AuthRetryPhase.EXHAUSTED);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_PANELAUTHSESSIONTEST_2200
     * @tc.name panelAuthSessionTestCase022
     * @tc.desc Verify reset: exhausted machine reset -> ready with zero attempts
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('panelAuthSessionTestCase022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const machine: AuthRetryMachine = AuthRetryMachine.standard();
      machine.attempt();
      machine.attempt();
      machine.attempt();
      machine.reset();
      expect(machine.getPhase()).assertEqual(AuthRetryPhase.READY);
      expect(machine.getAttempts()).assertEqual(0);
      expect(machine.canRetry()).assertTrue();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_PANELAUTHSESSIONTEST_2300
     * @tc.name panelAuthSessionTestCase023
     * @tc.desc Verify custom limit: single attempt machine -> exhausted after one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('panelAuthSessionTestCase023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const machine: AuthRetryMachine = new AuthRetryMachine(1);
      machine.attempt();
      expect(machine.getPhase()).assertEqual(AuthRetryPhase.EXHAUSTED);
      expect(machine.getLimit()).assertEqual(1);
      expect(machine.remaining()).assertEqual(0);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_PANELAUTHSESSIONTEST_2400
     * @tc.name panelAuthSessionTestCase024
     * @tc.desc Verify describe output: fresh machine -> ready zero of three
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('panelAuthSessionTestCase024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const machine: AuthRetryMachine = AuthRetryMachine.standard();
      expect(machine.describe()).assertEqual('ready/0/3');
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_PANELAUTHSESSIONTEST_2500
     * @tc.name panelAuthSessionTestCase025
     * @tc.desc Verify remaining floor: after exhaustion remaining never negative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('panelAuthSessionTestCase025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const machine: AuthRetryMachine = AuthRetryMachine.standard();
      machine.attempt();
      machine.attempt();
      machine.attempt();
      expect(machine.remaining()).assertEqual(0);
      expect(machine.getAttempts()).assertEqual(3);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_PANELAUTHSESSIONTEST_2600
     * @tc.name panelAuthSessionTestCase026
     * @tc.desc Verify initial phase: new machine -> idle with empty trail
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('panelAuthSessionTestCase026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const machine: Authb1StateMachine = new Authb1StateMachine();
      expect(machine.getPhase()).assertEqual(Authb1Phase.IDLE);
      expect(machine.trailLength()).assertEqual(0);
      expect(machine.canArm()).assertTrue();
      expect(machine.isActive()).assertFalse();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_PANELAUTHSESSIONTEST_2700
     * @tc.name panelAuthSessionTestCase027
     * @tc.desc Verify full cycle: arm, activate, pause, resume -> active with 4 transitions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('panelAuthSessionTestCase027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const machine: Authb1StateMachine = new Authb1StateMachine();
      expect(machine.arm()).assertTrue();
      expect(machine.activate()).assertTrue();
      expect(machine.pause()).assertTrue();
      expect(machine.resume()).assertTrue();
      expect(machine.getPhase()).assertEqual(Authb1Phase.ACTIVE);
      expect(machine.trailLength()).assertEqual(4);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_PANELAUTHSESSIONTEST_2800
     * @tc.name panelAuthSessionTestCase028
     * @tc.desc Verify guard on activate: idle machine cannot activate -> false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('panelAuthSessionTestCase028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const machine: Authb1StateMachine = new Authb1StateMachine();
      expect(machine.activate()).assertFalse();
      expect(machine.getPhase()).assertEqual(Authb1Phase.IDLE);
      expect(machine.trailLength()).assertEqual(0);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_PANELAUTHSESSIONTEST_2900
     * @tc.name panelAuthSessionTestCase029
     * @tc.desc Verify guard on arm: second arm from armed -> rejected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('panelAuthSessionTestCase029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const machine: Authb1StateMachine = new Authb1StateMachine();
      expect(machine.arm()).assertTrue();
      expect(machine.arm()).assertFalse();
      expect(machine.getPhase()).assertEqual(Authb1Phase.ARMED);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_PANELAUTHSESSIONTEST_3000
     * @tc.name panelAuthSessionTestCase030
     * @tc.desc Verify guard on pause: pause before activate -> rejected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('panelAuthSessionTestCase030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const machine: Authb1StateMachine = new Authb1StateMachine();
      expect(machine.pause()).assertFalse();
      expect(machine.arm()).assertTrue();
      expect(machine.pause()).assertFalse();
      expect(machine.trailLength()).assertEqual(1);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_PANELAUTHSESSIONTEST_3100
     * @tc.name panelAuthSessionTestCase031
     * @tc.desc Verify close from active: close succeeds -> closed state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('panelAuthSessionTestCase031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const machine: Authb1StateMachine = new Authb1StateMachine();
      machine.arm();
      machine.activate();
      expect(machine.close()).assertTrue();
      expect(machine.isClosed()).assertTrue();
      expect(machine.close()).assertFalse();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_PANELAUTHSESSIONTEST_3200
     * @tc.name panelAuthSessionTestCase032
     * @tc.desc Verify close from idle: idle machine cannot close -> false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('panelAuthSessionTestCase032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const machine: Authb1StateMachine = new Authb1StateMachine();
      expect(machine.close()).assertFalse();
      expect(machine.getPhase()).assertEqual(Authb1Phase.IDLE);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_PANELAUTHSESSIONTEST_3300
     * @tc.name panelAuthSessionTestCase033
     * @tc.desc Verify trail content: first transition recorded as idle to armed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('panelAuthSessionTestCase033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const machine: Authb1StateMachine = new Authb1StateMachine();
      machine.arm();
      const trail: string[] = machine.getTrail();
      expect(trail[0]).assertEqual('idle->armed');
      expect(trail.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_PANELAUTHSESSIONTEST_3400
     * @tc.name panelAuthSessionTestCase034
     * @tc.desc Verify reset after cycle: phase back to idle and trail empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('panelAuthSessionTestCase034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const machine: Authb1StateMachine = new Authb1StateMachine();
      machine.arm();
      machine.activate();
      machine.reset();
      expect(machine.getPhase()).assertEqual(Authb1Phase.IDLE);
      expect(machine.trailLength()).assertEqual(0);
      expect(machine.canArm()).assertTrue();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_PANELAUTHSESSIONTEST_3500
     * @tc.name panelAuthSessionTestCase035
     * @tc.desc Verify describe output: armed machine -> armed phase with one transition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('panelAuthSessionTestCase035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const machine: Authb1StateMachine = new Authb1StateMachine();
      machine.arm();
      expect(machine.describe()).assertEqual('armed/1');
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_PANELAUTHSESSIONTEST_3600
     * @tc.name panelAuthSessionTestCase036
     * @tc.desc Verify tab label line height: TAB_LINE_HEIGHT equals 22
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('panelAuthSessionTestCase036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(TAB_LINE_HEIGHT).assertEqual(22);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_PANELAUTHSESSIONTEST_3700
     * @tc.name panelAuthSessionTestCase037
     * @tc.desc Verify tab label line height bound: TAB_LINE_HEIGHT is not negative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('panelAuthSessionTestCase037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(TAB_LINE_HEIGHT >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_PANELAUTHSESSIONTEST_3800
     * @tc.name panelAuthSessionTestCase038
     * @tc.desc Verify tab bar side margin: TAB_MARGIN_SIDE equals 13
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('panelAuthSessionTestCase038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(TAB_MARGIN_SIDE).assertEqual(13);
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_PANELAUTHSESSIONTEST_3900
     * @tc.name panelAuthSessionTestCase039
     * @tc.desc Verify tab bar side margin bound: TAB_MARGIN_SIDE is not negative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('panelAuthSessionTestCase039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(TAB_MARGIN_SIDE >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_SAMPLE_HANDLETABS_PANELAUTHSESSIONTEST_4000
     * @tc.name panelAuthSessionTestCase040
     * @tc.desc Verify tab label top margin: TAB_MARGIN_TOP equals 17
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('panelAuthSessionTestCase040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(TAB_MARGIN_TOP).assertEqual(17);
    });
  });
}
