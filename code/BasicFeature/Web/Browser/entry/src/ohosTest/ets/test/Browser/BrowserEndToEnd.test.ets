/*
 * Copyright (c) 2026 Sample Device Co., Ltd.
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

import { describe, it, expect, beforeAll, afterAll } from '@ohos/hypium';
import { Driver } from '@ohos.UiTest';
import TestLogger from '../Shared/TestLogger';
import {
  getDriver, startBrowserApp, serializedDelay, clickById, inputById, waitForId,
  normalizeUrl, deviceIsPhone, PAD_HOME_PAGE, PHONE_HOME_PAGE, ID_INPUT_URL,
  ID_ACTION_SUBMIT, ID_NAV_BACK, ID_NAV_FORWARD, ID_NAV_REFRESH, ID_NAV_HOME,
  ID_ACTION_ADD, ID_CANCEL_TAB, TIMEOUT_TAB_SWITCH, TIMEOUT_PAGE_LOAD, DELAY_TAB_OPERATION
} from '../Shared/BrowserTestKit';
import { MockBrowser, MockBrowserTab, MockWebController, MockLoadingStatus } from '../Shared/BrowserMock';

const TAG: string = 'BrowserEndToEndTest';

/** Addresses of the scripted user journey. */
const ADDRESS_ALPHA: string = 'www.example.com/alpha';
const ADDRESS_BETA: string = 'www.example.com/beta';
const ADDRESS_GAMMA: string = 'www.example.com/gamma';
const TOLERANCE_STEP_COUNT: number = 0;

/** One observable step of a user journey. */
interface JourneyStep {
  phase: string;
  action: string;
  expected: string;
  actual: string;
  passed: boolean;
}

/**
 * Chronological record of a user journey.
 *
 * An end to end script spans half a dozen business features; when it fails the
 * plain assertion message does not say which phase broke. The log keeps every
 * phase with its expectation and its observed value, so a failure report can
 * be read top down exactly like the user walked through the application.
 */
class JourneyLog {
  steps: JourneyStep[] = [];

  record(phase: string, action: string, expected: string, actual: string): boolean {
    const passed: boolean = expected === actual;
    this.steps.push({
      phase: phase,
      action: action,
      expected: expected,
      actual: actual,
      passed: passed
    });
    return passed;
  }

  recordTrue(phase: string, action: string, actual: boolean): boolean {
    return this.record(phase, action, 'true', actual ? 'true' : 'false');
  }

  size(): number {
    return this.steps.length;
  }

  passedCount(): number {
    return this.steps.filter((step: JourneyStep) => step.passed).length;
  }

  failedSteps(): JourneyStep[] {
    return this.steps.filter((step: JourneyStep) => !step.passed);
  }

  phases(): string[] {
    return this.steps.map((step: JourneyStep) => step.phase);
  }

  /** Number of distinct phases touched by the journey. */
  distinctPhases(): number {
    return new Set<string>(this.phases()).size;
  }

  render(): string {
    return this.steps.map((step: JourneyStep) =>
      `${step.phase}${step.passed ? '=ok' : '=FAIL'}`).join(' > ');
  }

  reset(): void {
    this.steps = [];
  }
}

/**
 * Drives the browser model the same way a user drives the sample.
 *
 * The runner owns no UI: it replays the exact call order of TitleBar.ets and
 * PhoneLayout.ets (submit, page begin, progress, page end, navigation buttons)
 * against the behavioural mirror. Every phase appends one line to the journey
 * log, which keeps the end to end scripts linear and readable.
 */
class JourneyRunner {
  model: MockBrowser;
  log: JourneyLog = new JourneyLog();

  constructor(tabCount: number = 1) {
    this.model = new MockBrowser(tabCount);
  }

  /** App launch: the first tab exists and no page is loading. */
  launch(): boolean {
    const ready: boolean = this.model.tabs.length === 1 &&
      this.model.loadingStatus === MockLoadingStatus.END &&
      this.model.getTabArrayIndex() === 0;
    return this.log.recordTrue('launch', 'first tab ready', ready);
  }

  /** The user types an address and presses the submit button. */
  typeAndSubmit(address: string): string {
    this.model.setInputVal(address);
    const accepted: boolean = this.model.loadUrl(address);
    this.log.recordTrue('input', `submit ${address}`, accepted);
    const tab: MockBrowserTab | null = this.model.getCurrentTab();
    return tab === null ? '' : tab.controller.currentUrl;
  }

  /** The Web component reports the load lifecycle of the current page. */
  completeLoad(url: string): boolean {
    this.model.onPageBegin(url);
    const started: boolean = this.model.loadingStatus === MockLoadingStatus.LOADING;
    this.model.onProgressChange(50);
    const midway: boolean = this.model.hideProgress === false;
    this.model.onProgressChange(100);
    this.model.onPageEnd();
    const finished: boolean = this.model.loadingStatus === MockLoadingStatus.END;
    this.log.recordTrue('load', 'begin/progress/end', started && midway && finished);
    return started && midway && finished;
  }

  goBack(): boolean {
    const moved: boolean = this.model.back();
    this.log.record('history', 'back', 'true', moved ? 'true' : 'false');
    return moved;
  }

  goForward(): boolean {
    const moved: boolean = this.model.forward();
    this.log.record('history', 'forward', 'true', moved ? 'true' : 'false');
    return moved;
  }

  refresh(): boolean {
    const tab: MockBrowserTab | null = this.model.getCurrentTab();
    if (tab === null) {
      return false;
    }
    const before: number = tab.controller.refreshCount;
    this.model.refresh();
    const grew: boolean = tab.controller.refreshCount === before + 1;
    this.log.recordTrue('refresh', 'refresh count grows', grew);
    return grew;
  }

  openTab(): boolean {
    const before: number = this.model.tabs.length;
    const opened: boolean = this.model.addTab();
    const grew: boolean = this.model.tabs.length === before + 1;
    this.log.recordTrue('tab', 'open new tab', opened && grew);
    return opened && grew;
  }

  switchTo(index: number): boolean {
    const selected: boolean = this.model.selectTab(index);
    const aligned: boolean = this.model.getTabArrayIndex() === index;
    this.log.recordTrue('tab', `switch to ${index}`, selected && aligned);
    return selected && aligned;
  }

  closeTab(index: number): boolean {
    const before: number = this.model.tabs.length;
    const closed: boolean = this.model.deleteTab(index);
    const shrank: boolean = this.model.tabs.length === before - 1;
    this.log.recordTrue('tab', `close ${index}`, closed && shrank);
    return closed && shrank;
  }

  goHome(homePage: string): boolean {
    this.model.resetToHome(homePage);
    const tab: MockBrowserTab | null = this.model.getCurrentTab();
    const landed: boolean = tab !== null && tab.controller.currentUrl === homePage &&
      this.model.getInputVal() === '';
    this.log.recordTrue('home', `reset to ${homePage}`, landed);
    return landed;
  }

  currentUrl(): string {
    const tab: MockBrowserTab | null = this.model.getCurrentTab();
    return tab === null ? '' : tab.controller.currentUrl;
  }

  controllerOf(index: number): MockWebController {
    return this.model.tabs[index].controller;
  }
}

/**
 * Resolves the bundled home page of the current form factor.
 *
 * Index.ets treats every device type other than 'default' as the phone layout,
 * which loads phone.html; tablets load pad.html. Keeping the rule in one place
 * lets the journey assert the home button on both form factors.
 */
function resolveHomePage(deviceType: string): string {
  return deviceIsPhone(deviceType) ? PHONE_HOME_PAGE : PAD_HOME_PAGE;
}

export default function browserEndToEndTest() {
  describe('browserEndToEndTest', () => {
    let driver: Driver = getDriver();

    beforeAll(async () => {
      TestLogger.info(TAG, 'end to end suite begin');
      TestLogger.resetSteps(TAG);
      await startBrowserApp();
    });

    afterAll(() => {
      TestLogger.info(TAG, TestLogger.summary(TAG));
    });

    it('Browser_E2E_Launch_001', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_E2E_Launch_001');
      TestLogger.step(TAG, 'start the application and inspect the first tab');
      const runner: JourneyRunner = new JourneyRunner(1);
      expect(runner.launch()).assertTrue();
      const model: MockBrowser = runner.model;
      TestLogger.info(TAG, `phases=${runner.log.phases().join(',')} render=${runner.log.render()}`);
      expect(model.tabs.length).assertEqual(1);
      expect(model.getTabArrayIndex()).assertEqual(0);
      expect(model.loadingStatus).assertEqual(MockLoadingStatus.END);
      expect(model.hideProgress).assertTrue();
      expect(model.progress).assertEqual(0);
      expect(model.getInputVal()).assertEqual('');
      expect(runner.log.size()).assertEqual(1);
      expect(runner.log.passedCount()).assertEqual(1);
      TestLogger.pass(TAG, 'Browser_E2E_Launch_001');
    });

    it('Browser_E2E_Input_002', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_E2E_Input_002');
      TestLogger.step(TAG, 'type an address and submit it from the title bar');
      const runner: JourneyRunner = new JourneyRunner(1);
      const url: string = runner.typeAndSubmit(ADDRESS_ALPHA);
      const controller: MockWebController = runner.controllerOf(0);
      TestLogger.info(TAG, `url=${url} pending=${controller.getPendingUrl()} loads=${controller.loadCount}`);
      expect(url).assertEqual(normalizeUrl(ADDRESS_ALPHA));
      expect(url).assertEqual('https://www.example.com/alpha');
      expect(controller.getPendingUrl()).assertEqual(url);
      expect(controller.loadCount).assertEqual(1);
      expect(controller.history.length).assertEqual(1);
      expect(runner.model.getInputVal()).assertEqual(ADDRESS_ALPHA);
      expect(runner.log.failedSteps().length).assertEqual(0);
      TestLogger.pass(TAG, 'Browser_E2E_Input_002');
    });

    it('Browser_E2E_Load_003', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_E2E_Load_003');
      TestLogger.step(TAG, 'walk a page from begin to progress to end');
      const runner: JourneyRunner = new JourneyRunner(1);
      const url: string = runner.typeAndSubmit(ADDRESS_BETA);
      expect(runner.completeLoad(url)).assertTrue();
      TestLogger.info(TAG, `status=${runner.model.loadingStatus} progress=${runner.model.progress}`);
      expect(runner.model.loadingStatus).assertEqual(MockLoadingStatus.END);
      expect(runner.model.progress).assertEqual(0);
      expect(runner.model.hideProgress).assertTrue();
      expect(runner.model.getInputVal()).assertEqual(url);
      expect(runner.controllerOf(0).javaScriptCalls.length).assertEqual(1);
      expect(runner.log.distinctPhases()).assertEqual(2);
      TestLogger.pass(TAG, 'Browser_E2E_Load_003');
    });

    it('Browser_E2E_History_004', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_E2E_History_004');
      TestLogger.step(TAG, 'load two pages then press back');
      const runner: JourneyRunner = new JourneyRunner(1);
      const first: string = runner.typeAndSubmit(ADDRESS_ALPHA);
      runner.completeLoad(first);
      const second: string = runner.typeAndSubmit(ADDRESS_BETA);
      runner.completeLoad(second);
      const before: string = runner.currentUrl();
      expect(runner.goBack()).assertTrue();
      const after: string = runner.currentUrl();
      TestLogger.info(TAG, `before=${before} after=${after}`);
      expect(before).assertEqual(normalizeUrl(ADDRESS_BETA));
      expect(after).assertEqual(normalizeUrl(ADDRESS_ALPHA));
      expect(runner.controllerOf(0).historyIndex).assertEqual(0);
      expect(runner.controllerOf(0).accessBackward()).assertFalse();
      expect(runner.controllerOf(0).accessForward()).assertTrue();
      TestLogger.pass(TAG, 'Browser_E2E_History_004');
    });

    it('Browser_E2E_History_005', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_E2E_History_005');
      TestLogger.step(TAG, 'restore the forward page after a back step');
      const runner: JourneyRunner = new JourneyRunner(1);
      runner.typeAndSubmit(ADDRESS_ALPHA);
      runner.typeAndSubmit(ADDRESS_BETA);
      runner.typeAndSubmit(ADDRESS_GAMMA);
      expect(runner.goBack()).assertTrue();
      expect(runner.goBack()).assertTrue();
      expect(runner.currentUrl()).assertEqual(normalizeUrl(ADDRESS_ALPHA));
      expect(runner.goForward()).assertTrue();
      const restored: string = runner.currentUrl();
      TestLogger.info(TAG, `restored=${restored} index=${runner.controllerOf(0).historyIndex}`);
      expect(restored).assertEqual(normalizeUrl(ADDRESS_BETA));
      expect(runner.goForward()).assertTrue();
      expect(runner.currentUrl()).assertEqual(normalizeUrl(ADDRESS_GAMMA));
      expect(runner.controllerOf(0).accessForward()).assertFalse();
      TestLogger.pass(TAG, 'Browser_E2E_History_005');
    });

    it('Browser_E2E_History_006', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_E2E_History_006');
      TestLogger.step(TAG, 'press back and forward at both history boundaries');
      const runner: JourneyRunner = new JourneyRunner(1);
      const url: string = runner.typeAndSubmit(ADDRESS_ALPHA);
      const backAtStart: boolean = runner.model.back();
      const forwardAtEnd: boolean = runner.model.forward();
      runner.log.recordTrue('history', 'back at start rejected', !backAtStart);
      runner.log.recordTrue('history', 'forward at end rejected', !forwardAtEnd);
      TestLogger.info(TAG, `backAtStart=${backAtStart} forwardAtEnd=${forwardAtEnd} url=${runner.currentUrl()}`);
      expect(backAtStart).assertFalse();
      expect(forwardAtEnd).assertFalse();
      expect(runner.currentUrl()).assertEqual(url);
      expect(runner.controllerOf(0).historyIndex).assertEqual(0);
      expect(runner.controllerOf(0).history.length).assertEqual(1);
      expect(runner.log.failedSteps().length).assertEqual(0);
      TestLogger.pass(TAG, 'Browser_E2E_History_006');
    });

    it('Browser_E2E_Refresh_007', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_E2E_Refresh_007');
      TestLogger.step(TAG, 'refresh the current page three times');
      const runner: JourneyRunner = new JourneyRunner(1);
      const url: string = runner.typeAndSubmit(ADDRESS_ALPHA);
      runner.completeLoad(url);
      expect(runner.refresh()).assertTrue();
      expect(runner.refresh()).assertTrue();
      expect(runner.refresh()).assertTrue();
      const controller: MockWebController = runner.controllerOf(0);
      TestLogger.info(TAG, `refreshCount=${controller.refreshCount} url=${controller.currentUrl}`);
      expect(controller.refreshCount).assertEqual(3);
      expect(controller.currentUrl).assertEqual(url);
      expect(controller.history.length).assertEqual(1);
      expect(controller.historyIndex).assertEqual(0);
      expect(controller.loadCount).assertEqual(1);
      expect(runner.log.failedSteps().length).assertEqual(0);
      TestLogger.pass(TAG, 'Browser_E2E_Refresh_007');
    });

    it('Browser_E2E_NewTab_008', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_E2E_NewTab_008');
      TestLogger.step(TAG, 'open a second tab from the title bar');
      const runner: JourneyRunner = new JourneyRunner(1);
      const firstUrl: string = runner.typeAndSubmit(ADDRESS_ALPHA);
      runner.completeLoad(firstUrl);
      expect(runner.openTab()).assertTrue();
      const model: MockBrowser = runner.model;
      TestLogger.info(TAG, `tabs=${model.tabs.length} index=${model.getTabArrayIndex()} keys=${model.getTabKeys().join(',')}`);
      expect(model.tabs.length).assertEqual(2);
      expect(model.getTabArrayIndex()).assertEqual(1);
      expect(model.getTabKeys()).assertDeepEquals([0, 1]);
      expect(runner.currentUrl()).assertEqual('');
      expect(runner.controllerOf(0).currentUrl).assertEqual(firstUrl);
      expect(runner.controllerOf(0).currentUrl === runner.currentUrl()).assertFalse();
      expect(runner.log.distinctPhases() >= 3).assertTrue();
      TestLogger.pass(TAG, 'Browser_E2E_NewTab_008');
    });

    it('Browser_E2E_Switch_009', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_E2E_Switch_009');
      TestLogger.step(TAG, 'switch between two tabs and compare their urls');
      const runner: JourneyRunner = new JourneyRunner(1);
      const alpha: string = runner.typeAndSubmit(ADDRESS_ALPHA);
      runner.completeLoad(alpha);
      expect(runner.openTab()).assertTrue();
      const beta: string = runner.typeAndSubmit(ADDRESS_BETA);
      runner.completeLoad(beta);
      expect(runner.switchTo(0)).assertTrue();
      expect(runner.currentUrl()).assertEqual(alpha);
      expect(runner.switchTo(1)).assertTrue();
      expect(runner.currentUrl()).assertEqual(beta);
      TestLogger.info(TAG, `tab0=${runner.controllerOf(0).currentUrl} tab1=${runner.controllerOf(1).currentUrl}`);
      expect(runner.controllerOf(0).currentUrl === runner.controllerOf(1).currentUrl).assertFalse();
      expect(runner.model.getTabArrayIndex()).assertEqual(1);
      expect(runner.model.lastChangedIndex).assertEqual(1);
      TestLogger.pass(TAG, 'Browser_E2E_Switch_009');
    });

    it('Browser_E2E_Close_010', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_E2E_Close_010');
      TestLogger.step(TAG, 'close the middle tab and verify the renumbering');
      const runner: JourneyRunner = new JourneyRunner(3);
      runner.typeAndSubmit(ADDRESS_ALPHA);
      runner.switchTo(1);
      runner.typeAndSubmit(ADDRESS_BETA);
      runner.switchTo(2);
      runner.typeAndSubmit(ADDRESS_GAMMA);
      expect(runner.closeTab(1)).assertTrue();
      const model: MockBrowser = runner.model;
      const keys: number[] = model.getTabKeys();
      TestLogger.info(TAG, `tabs=${model.tabs.length} keys=${keys.join(',')} index=${model.getTabArrayIndex()}`);
      expect(model.tabs.length).assertEqual(2);
      expect(keys).assertDeepEquals([0, 1]);
      expect(model.getTabArrayIndex()).assertEqual(1);
      expect(runner.currentUrl()).assertEqual(normalizeUrl(ADDRESS_GAMMA));
      expect(runner.controllerOf(0).currentUrl).assertEqual(normalizeUrl(ADDRESS_ALPHA));
      expect(model.getCurrentTab() !== null).assertTrue();
      TestLogger.pass(TAG, 'Browser_E2E_Close_010');
    });

    it('Browser_E2E_Home_011', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_E2E_Home_011');
      TestLogger.step(TAG, 'press home on both form factors');
      const padRunner: JourneyRunner = new JourneyRunner(1);
      const padUrl: string = padRunner.typeAndSubmit(ADDRESS_ALPHA);
      padRunner.completeLoad(padUrl);
      const padHome: string = resolveHomePage('default');
      expect(padRunner.goHome(padHome)).assertTrue();
      const phoneRunner: JourneyRunner = new JourneyRunner(1);
      const phoneUrl: string = phoneRunner.typeAndSubmit(ADDRESS_BETA);
      phoneRunner.completeLoad(phoneUrl);
      const phoneHome: string = resolveHomePage('phone');
      expect(phoneRunner.goHome(phoneHome)).assertTrue();
      TestLogger.info(TAG, `pad=${padHome}/${padRunner.currentUrl()} phone=${phoneHome}/${phoneRunner.currentUrl()}`);
      expect(padHome).assertEqual(PAD_HOME_PAGE);
      expect(phoneHome).assertEqual(PHONE_HOME_PAGE);
      expect(padRunner.currentUrl()).assertEqual(PAD_HOME_PAGE);
      expect(phoneRunner.currentUrl()).assertEqual(PHONE_HOME_PAGE);
      expect(padRunner.model.getInputVal()).assertEqual('');
      expect(phoneRunner.model.getInputVal()).assertEqual('');
      TestLogger.pass(TAG, 'Browser_E2E_Home_011');
    });

    it('Browser_E2E_Journey_012', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_E2E_Journey_012');
      TestLogger.step(TAG, 'replay the full launch to home user journey');
      const runner: JourneyRunner = new JourneyRunner(1);
      expect(runner.launch()).assertTrue();
      const alpha: string = runner.typeAndSubmit(ADDRESS_ALPHA);
      expect(runner.completeLoad(alpha)).assertTrue();
      const beta: string = runner.typeAndSubmit(ADDRESS_BETA);
      expect(runner.completeLoad(beta)).assertTrue();
      expect(runner.goBack()).assertTrue();
      expect(runner.goForward()).assertTrue();
      expect(runner.currentUrl()).assertEqual(normalizeUrl(ADDRESS_BETA));
      expect(runner.refresh()).assertTrue();
      expect(runner.openTab()).assertTrue();
      const gamma: string = runner.typeAndSubmit(ADDRESS_GAMMA);
      expect(runner.completeLoad(gamma)).assertTrue();
      expect(runner.switchTo(0)).assertTrue();
      expect(runner.currentUrl()).assertEqual(normalizeUrl(ADDRESS_BETA));
      expect(runner.closeTab(1)).assertTrue();
      expect(runner.goHome(PAD_HOME_PAGE)).assertTrue();
      const phases: string[] = runner.log.phases();
      TestLogger.info(TAG, `steps=${runner.log.size()} phases=${runner.log.distinctPhases()} render=${runner.log.render()}`);
      expect(runner.log.failedSteps().length).assertEqual(0);
      expect(runner.log.passedCount()).assertEqual(runner.log.size());
      expect(runner.log.size()).assertLarger(11);
      expect(phases[0]).assertEqual('launch');
      expect(phases.indexOf('home') >= 0).assertTrue();
      expect(runner.model.tabs.length).assertEqual(1);
      expect(runner.currentUrl()).assertEqual(PAD_HOME_PAGE);
      TestLogger.pass(TAG, 'Browser_E2E_Journey_012');
    });

    it('Browser_E2E_MultiTab_013', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_E2E_MultiTab_013');
      TestLogger.step(TAG, 'run independent journeys on three tabs');
      const runner: JourneyRunner = new JourneyRunner(3);
      const addresses: string[] = [ADDRESS_ALPHA, ADDRESS_BETA, ADDRESS_GAMMA];
      for (let index = 0; index < addresses.length; index++) {
        expect(runner.switchTo(index)).assertTrue();
        const url: string = runner.typeAndSubmit(addresses[index]);
        expect(runner.completeLoad(url)).assertTrue();
        expect(runner.refresh()).assertTrue();
      }
      for (let index = 0; index < addresses.length; index++) {
        expect(runner.switchTo(index)).assertTrue();
        expect(runner.currentUrl()).assertEqual(normalizeUrl(addresses[index]));
        expect(runner.controllerOf(index).refreshCount).assertEqual(1);
      }
      TestLogger.info(TAG, `render=${runner.log.render()}`);
      expect(runner.model.tabs.length).assertEqual(3);
      expect(runner.controllerOf(0).currentUrl === runner.controllerOf(1).currentUrl).assertFalse();
      expect(runner.controllerOf(1).currentUrl === runner.controllerOf(2).currentUrl).assertFalse();
      expect(runner.log.failedSteps().length).assertEqual(0);
      TestLogger.pass(TAG, 'Browser_E2E_MultiTab_013');
    });

    it('Browser_E2E_Log_014', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_E2E_Log_014');
      TestLogger.step(TAG, 'verify the journey log records failures verbatim');
      const log: JourneyLog = new JourneyLog();
      expect(log.record('launch', 'tab ready', 'true', 'true')).assertTrue();
      expect(log.record('input', 'submit', 'https://a.example.com', 'https://b.example.com')).assertFalse();
      log.recordTrue('home', 'landed', false);
      const failed: JourneyStep[] = log.failedSteps();
      TestLogger.info(TAG, `steps=${log.size()} failed=${failed.length} render=${log.render()}`);
      expect(log.size()).assertEqual(3);
      expect(log.passedCount()).assertEqual(1);
      expect(failed.length).assertEqual(2);
      expect(failed[0].phase).assertEqual('input');
      expect(failed[0].expected).assertEqual('https://a.example.com');
      expect(failed[0].actual).assertEqual('https://b.example.com');
      expect(failed[1].phase).assertEqual('home');
      expect(log.distinctPhases()).assertEqual(3);
      expect(TOLERANCE_STEP_COUNT).assertEqual(0);
      log.reset();
      expect(log.size()).assertEqual(0);
      expect(log.passedCount()).assertEqual(0);
      TestLogger.pass(TAG, 'Browser_E2E_Log_014');
    });

    it('Browser_E2E_UI_015', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_E2E_UI_015');
      TestLogger.step(TAG, 'type an address and submit it on the real device');
      const inputReady: boolean = await waitForId(driver, ID_INPUT_URL, TIMEOUT_TAB_SWITCH);
      expect(inputReady).assertTrue();
      try {
        const typed: boolean = await inputById(driver, ID_INPUT_URL, 'example.com');
        expect(typed).assertTrue();
        await serializedDelay(driver, DELAY_TAB_OPERATION);
        const submitted: boolean = await clickById(driver, ID_ACTION_SUBMIT);
        expect(submitted).assertTrue();
        const loaded: boolean = await waitForId(driver, ID_NAV_BACK, TIMEOUT_PAGE_LOAD);
        TestLogger.info(TAG, `submitted=${submitted} navigationBar=${loaded}`);
        expect(loaded).assertTrue();
      } finally {
        await serializedDelay(driver, DELAY_TAB_OPERATION);
        TestLogger.info(TAG, 'address submission probe finished');
      }
      TestLogger.pass(TAG, 'Browser_E2E_UI_015');
    });

    it('Browser_E2E_UI_016', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_E2E_UI_016');
      TestLogger.step(TAG, 'walk the navigation buttons on the real device');
      try {
        const refreshClicked: boolean = await clickById(driver, ID_NAV_REFRESH);
        await serializedDelay(driver, DELAY_TAB_OPERATION);
        const homeClicked: boolean = await clickById(driver, ID_NAV_HOME);
        await serializedDelay(driver, DELAY_TAB_OPERATION);
        const backClicked: boolean = await clickById(driver, ID_NAV_BACK);
        await serializedDelay(driver, DELAY_TAB_OPERATION);
        const forwardClicked: boolean = await clickById(driver, ID_NAV_FORWARD);
        await serializedDelay(driver, DELAY_TAB_OPERATION);
        const addClicked: boolean = await clickById(driver, ID_ACTION_ADD);
        await serializedDelay(driver, DELAY_TAB_OPERATION);
        TestLogger.info(TAG, `refresh=${refreshClicked} home=${homeClicked} back=${backClicked} forward=${forwardClicked}`);
        expect(refreshClicked).assertTrue();
        expect(homeClicked).assertTrue();
        expect(backClicked).assertTrue();
        expect(forwardClicked).assertTrue();
        expect(addClicked).assertTrue();
        const closeButtons: number = await waitForId(driver, ID_CANCEL_TAB, TIMEOUT_TAB_SWITCH) ? 1 : 0;
        expect(closeButtons).assertEqual(1);
      } finally {
        await serializedDelay(driver, DELAY_TAB_OPERATION);
        TestLogger.info(TAG, 'navigation button walk finished');
      }
      TestLogger.pass(TAG, 'Browser_E2E_UI_016');
    });
  });
}
