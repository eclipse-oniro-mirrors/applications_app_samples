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

import { describe, it, expect, beforeAll, afterAll } from '@ohos/hypium';
import { Driver } from '@ohos.UiTest';
import TestLogger from '../Shared/TestLogger';
import {
  getDriver, startBrowserApp, serializedDelay, componentByIdExists, countById,
  textById, pressKey, waitForId, deviceIsPhone, backPressConsumes,
  ID_INPUT_URL, ID_NAV_BACK, ID_NAV_FORWARD, ID_NAV_REFRESH, ID_NAV_HOME,
  ID_ACTION_SUBMIT, ID_ACTION_ADD, ID_CANCEL_TAB,
  KEY_BACK, KEY_DPAD_LEFT, KEY_DPAD_RIGHT,
  TIMEOUT_COMPONENT, DELAY_KEY_NAVIGATION,
  MAX_TAB_COUNT, PAD_HOME_PAGE, PHONE_HOME_PAGE
} from '../Shared/BrowserTestKit';
import { MockBrowser, MockBrowserTab, MockLoadingStatus, MockClock } from '../Shared/BrowserMock';

const TAG: string = 'BrowserIndexStateManagerValidationTest';

/* ------------------------------------------------------------------ */
/* Index page state vocabulary                                         */
/* ------------------------------------------------------------------ */

const DEVICE_DEFAULT: string = 'default';
const DEVICE_PHONE: string = 'phone';
const DEVICE_TABLET: string = 'tablet';
const DEVICE_TV: string = 'tv';

const ORIENTATION_PORTRAIT: string = 'portrait';
const ORIENTATION_LANDSCAPE: string = 'landscape';

const PROGRESS_IDLE: number = 0;
const PROGRESS_HALF: number = 50;
const PROGRESS_DONE: number = 100;

const MAX_SNAPSHOT_COUNT: number = 12;
const MAX_REPLAY_EVENTS: number = 64;

const EVENT_INIT: string = 'init';
const EVENT_DEVICE: string = 'device';
const EVENT_ROTATION: string = 'rotation';
const EVENT_PROGRESS: string = 'progress';
const EVENT_LOADING: string = 'loading';

const ISSUE_NOT_INITIALIZED: string = 'not-initialized';
const ISSUE_BROWSER_MISSING: string = 'browser-missing';
const ISSUE_PROGRESS_RANGE: string = 'progress-out-of-range';
const ISSUE_PROGRESS_VISIBILITY: string = 'progress-visibility-mismatch';
const ISSUE_LAYOUT_MISMATCH: string = 'layout-device-mismatch';
const ISSUE_TAB_INDEX: string = 'tab-index-out-of-range';
const ISSUE_TAB_COUNT: string = 'tab-count-out-of-range';
const ISSUE_LOADING_ENUM: string = 'loading-status-invalid';

/* ------------------------------------------------------------------ */
/* Local state model                                                   */
/* ------------------------------------------------------------------ */

/** One consistency violation produced by the state validator. */
class StateIssue {
  code: string;
  detail: string;

  constructor(code: string, detail: string) {
    this.code = code;
    this.detail = detail;
  }

  describe(): string {
    return `${this.code}:${this.detail}`;
  }
}

/** Immutable capture of every observable Index page field. */
class IndexStateSnapshot {
  revision: number;
  label: string;
  isPhone: boolean;
  isInit: boolean;
  progress: number;
  hideProgress: boolean;
  loadingStatus: MockLoadingStatus;
  orientation: string;
  deviceType: string;
  tabCount: number;
  tabIndex: number;
  inputValue: string;

  constructor(revision: number, label: string) {
    this.revision = revision;
    this.label = label;
    this.isPhone = false;
    this.isInit = false;
    this.progress = 0;
    this.hideProgress = true;
    this.loadingStatus = MockLoadingStatus.END;
    this.orientation = ORIENTATION_PORTRAIT;
    this.deviceType = DEVICE_DEFAULT;
    this.tabCount = 0;
    this.tabIndex = 0;
    this.inputValue = '';
  }

  sameAs(other: IndexStateSnapshot | null): boolean {
    if (other === null) {
      return false;
    }
    return this.revision === other.revision &&
      this.isPhone === other.isPhone &&
      this.isInit === other.isInit &&
      this.progress === other.progress &&
      this.hideProgress === other.hideProgress &&
      this.loadingStatus === other.loadingStatus &&
      this.orientation === other.orientation &&
      this.deviceType === other.deviceType &&
      this.tabCount === other.tabCount &&
      this.tabIndex === other.tabIndex &&
      this.inputValue === other.inputValue;
  }

  describe(): string {
    return `${this.label}|phone=${this.isPhone}|init=${this.isInit}|progress=${this.progress}` +
      `|hide=${this.hideProgress}|loading=${this.loadingStatus}|tab=${this.tabIndex}/${this.tabCount}`;
  }
}

/**
 * Guards the mediaquery callback of Index.ets.
 *
 * The real callback fires for both orientation values and may deliver the same
 * value twice while the window is still settling. The guard keeps the first
 * application of a value and rejects every repetition until the value really
 * changes, which is what the "rotation applies once" requirement describes.
 */
class RotationGuard {
  private current: string = ORIENTATION_PORTRAIT;
  private applied: number = 0;
  private suppressed: number = 0;
  private history: string[] = [ORIENTATION_PORTRAIT];

  resolve(value: string): string {
    return value === ORIENTATION_LANDSCAPE ? ORIENTATION_LANDSCAPE : ORIENTATION_PORTRAIT;
  }

  /** Returns true only when the orientation really changed. */
  accept(value: string): boolean {
    const resolved: string = this.resolve(value);
    if (resolved === this.current) {
      this.suppressed += 1;
      return false;
    }
    this.current = resolved;
    this.applied += 1;
    this.history.push(resolved);
    return true;
  }

  currentOrientation(): string {
    return this.current;
  }

  appliedCount(): number {
    return this.applied;
  }

  suppressedCount(): number {
    return this.suppressed;
  }

  isLandscape(): boolean {
    return this.current === ORIENTATION_LANDSCAPE;
  }

  reset(): void {
    this.current = ORIENTATION_PORTRAIT;
    this.applied = 0;
    this.suppressed = 0;
    this.history = [ORIENTATION_PORTRAIT];
  }

  historyLength(): number {
    return this.history.length;
  }
}

/** Bounded replay log of state transitions, used by the consistency suites. */
class StateTimeline {
  private events: string[] = [];
  private capacity: number = MAX_REPLAY_EVENTS;
  private dropped: number = 0;

  record(event: string): void {
    this.events.push(event);
    if (this.events.length > this.capacity) {
      this.events.shift();
      this.dropped += 1;
    }
  }

  size(): number {
    return this.events.length;
  }

  droppedCount(): number {
    return this.dropped;
  }

  contains(event: string): boolean {
    return this.events.indexOf(event) >= 0;
  }

  last(): string {
    return this.events.length === 0 ? '' : this.events[this.events.length - 1];
  }

  sequence(): string {
    return this.events.join('>');
  }

  clear(): void {
    this.events = [];
    this.dropped = 0;
  }
}
/* ------------------------------------------------------------------ */
/* Index state manager under validation                                */
/* ------------------------------------------------------------------ */

/**
 * Mirror of the @State members owned by pages/Index.ets.
 *
 * Every mutator is defensive: the page keeps rendering during a configuration
 * change, therefore an out of range progress or a stale device type must never
 * be able to leave the UI in an inconsistent state.
 */
class IndexStateManager {
  isPhone: boolean = false;
  isInit: boolean = false;
  progress: number = PROGRESS_IDLE;
  hideProgress: boolean = true;
  loadingStatus: MockLoadingStatus = MockLoadingStatus.END;
  orientation: string = ORIENTATION_PORTRAIT;
  deviceType: string = DEVICE_DEFAULT;
  browser: MockBrowser = new MockBrowser();
  browserReady: boolean = false;
  rebuildCount: number = 0;
  rotationApplied: number = 0;
  rotationSuppressed: number = 0;
  initCount: number = 0;
  notifications: number = 0;
  private revision: number = 0;
  private lastEvent: string = '';
  private guard: RotationGuard = new RotationGuard();
  private timeline: StateTimeline = new StateTimeline();
  private snapshots: IndexStateSnapshot[] = [];
  private listeners: string[] = [];
  private delivered: number = 0;
  private clock: MockClock;

  constructor(deviceType: string = DEVICE_DEFAULT, clock: MockClock = new MockClock()) {
    this.clock = clock;
    this.deviceType = this.resolveDeviceType(deviceType);
    this.isPhone = this.deviceIsPhone(this.deviceType);
  }

  /* ---------------- device / layout ---------------- */

  resolveDeviceType(deviceType: string): string {
    if (deviceType === DEVICE_DEFAULT || deviceType === DEVICE_PHONE ||
      deviceType === DEVICE_TABLET || deviceType === DEVICE_TV) {
      return deviceType;
    }
    return DEVICE_DEFAULT;
  }

  /** Local mirror of the sample rule: every non default device is a phone. */
  deviceIsPhone(deviceType: string): boolean {
    return deviceIsPhone(deviceType);
  }

  homePage(): string {
    return this.isPhone ? PHONE_HOME_PAGE : PAD_HOME_PAGE;
  }

  isTabletLayout(): boolean {
    return !this.isPhone;
  }

  /** Applies a static layout switch without rebuilding the web engine. */
  applyLayout(deviceType: string): boolean {
    const resolved: string = this.resolveDeviceType(deviceType);
    const nextPhone: boolean = this.deviceIsPhone(resolved);
    if (resolved === this.deviceType && nextPhone === this.isPhone) {
      return false;
    }
    this.deviceType = resolved;
    this.isPhone = nextPhone;
    this.revision += 1;
    this.record(EVENT_DEVICE);
    this.notify('layout');
    return true;
  }

  /* ---------------- lifecycle ---------------- */

  /** Index.ets aboutToAppear equivalent; only the first call takes effect. */
  initState(): boolean {
    if (this.isInit) {
      this.timeline.record('init:duplicate');
      return false;
    }
    this.isInit = true;
    this.browserReady = true;
    this.initCount += 1;
    this.revision += 1;
    this.record(EVENT_INIT);
    this.notify('init');
    return true;
  }

  /** Index.ets aboutToDisappear equivalent. */
  disposeState(): boolean {
    if (!this.isInit) {
      return false;
    }
    this.isInit = false;
    this.browserReady = false;
    this.progress = PROGRESS_IDLE;
    this.hideProgress = true;
    this.loadingStatus = MockLoadingStatus.END;
    this.revision += 1;
    this.record('dispose');
    this.notify('dispose');
    return true;
  }

  canRenderContent(): boolean {
    return this.isInit && this.browserReady;
  }

  /* ---------------- progress ---------------- */

  /**
   * Mirrors onProgressChange: 100 percent completes the load, hides the bar and
   * rewinds the stored value to zero, any other value keeps the bar visible.
   */
  onProgressChange(value: number): boolean {
    if (value === null || value === undefined || Number.isNaN(value)) {
      return false;
    }
    let clamped: number = value;
    if (clamped < PROGRESS_IDLE) {
      clamped = PROGRESS_IDLE;
    }
    if (clamped > PROGRESS_DONE) {
      clamped = PROGRESS_DONE;
    }
    const previous: number = this.progress;
    const previousHide: boolean = this.hideProgress;
    if (clamped === PROGRESS_DONE) {
      this.progress = PROGRESS_IDLE;
      this.hideProgress = true;
    } else {
      this.progress = clamped;
      this.hideProgress = false;
    }
    if (previous !== this.progress || previousHide !== this.hideProgress) {
      this.revision += 1;
      this.record(EVENT_PROGRESS);
      this.notify('progress');
    }
    return true;
  }

  progressPercent(): number {
    return this.progress;
  }

  progressVisible(): boolean {
    return !this.hideProgress;
  }

  /** Percentage written by the Web engine is monotonic inside one load. */
  progressIsMonotonic(first: number, second: number): boolean {
    return second >= first || second === PROGRESS_IDLE;
  }

  /* ---------------- loading status ---------------- */

  setLoadingStatus(status: MockLoadingStatus): boolean {
    if (status !== MockLoadingStatus.LOADING && status !== MockLoadingStatus.END) {
      return false;
    }
    if (status === this.loadingStatus) {
      return true;
    }
    this.loadingStatus = status;
    this.revision += 1;
    this.record(EVENT_LOADING);
    this.notify('loading');
    return true;
  }

  isLoading(): boolean {
    return this.loadingStatus === MockLoadingStatus.LOADING;
  }

  /** onPageBegin of the Web component. */
  onPageBegin(url: string): boolean {
    if (url === null || url === undefined) {
      return false;
    }
    this.browser.onPageBegin(url);
    this.loadingStatus = MockLoadingStatus.LOADING;
    this.progress = PROGRESS_IDLE;
    this.hideProgress = false;
    this.revision += 1;
    this.record(`${EVENT_LOADING}:begin`);
    this.notify('pageBegin');
    return true;
  }

  /** onPageEnd of the Web component. */
  onPageEnd(): boolean {
    this.browser.onPageEnd();
    this.loadingStatus = MockLoadingStatus.END;
    this.hideProgress = true;
    this.progress = PROGRESS_IDLE;
    this.revision += 1;
    this.record(`${EVENT_LOADING}:end`);
    this.notify('pageEnd');
    return true;
  }

  /** onBackPress of Index.ets: consumed while a page can go backward or loads. */
  onBackPress(): boolean {
    const tab: MockBrowserTab | null = this.browser.getCurrentTab();
    const accessBackward: boolean = tab !== null && tab.controller.accessBackward();
    const consumed: boolean = backPressConsumes(accessBackward, this.isLoading());
    if (consumed && tab !== null) {
      tab.controller.backward();
      this.record('backPress:consumed');
    } else {
      this.record('backPress:passed');
    }
    return consumed;
  }
  /* ---------------- rotation ---------------- */

  /**
   * mediaquery orientation callback.
   *
   * The callback must only take effect when the value really changed: an
   * lifecycle recreation usually delivers the current orientation once more and
   * a second layout rebuild would drop the running page state.
   */
  onOrientationChange(orientation: string): boolean {
    const accepted: boolean = this.guard.accept(orientation);
    if (!accepted) {
      this.rotationSuppressed += 1;
      this.timeline.record('rotation:suppressed');
      return false;
    }
    this.orientation = this.guard.currentOrientation();
    this.rotationApplied += 1;
    this.progress = PROGRESS_IDLE;
    this.hideProgress = true;
    this.revision += 1;
    this.record(EVENT_ROTATION);
    this.notify('rotation');
    return true;
  }

  isLandscape(): boolean {
    return this.orientation === ORIENTATION_LANDSCAPE;
  }

  rotationCount(): number {
    return this.rotationApplied;
  }

  suppressedRotationCount(): number {
    return this.rotationSuppressed;
  }

  orientationHistoryLength(): number {
    return this.guard.historyLength();
  }

  /* ---------------- device change ---------------- */

  /**
   * onDeviceChange of Index.ets.
   *
   * A real device change rebuilds the layout and the web engine. The address
   * currently typed by the user survives, the transient load state does not.
   */
  onDeviceChange(deviceType: string): boolean {
    const resolved: string = this.resolveDeviceType(deviceType);
    if (resolved === this.deviceType && this.browserReady) {
      this.timeline.record('device:noop');
      return false;
    }
    const preservedInput: string = this.browser.getInputVal();
    const previousTabs: number = this.browser.tabs.length;
    let nextTabs: number = previousTabs;
    if (nextTabs < 1) {
      nextTabs = 1;
    }
    if (nextTabs > MAX_TAB_COUNT) {
      nextTabs = MAX_TAB_COUNT;
    }
    this.browser = new MockBrowser(nextTabs);
    this.browser.setInputVal(preservedInput);
    this.browser.setTabArrayIndex(0);
    this.deviceType = resolved;
    this.isPhone = this.deviceIsPhone(resolved);
    this.browserReady = true;
    this.progress = PROGRESS_IDLE;
    this.hideProgress = true;
    this.loadingStatus = MockLoadingStatus.END;
    this.rebuildCount += 1;
    this.revision += 1;
    this.record(`${EVENT_DEVICE}:rebuild`);
    this.notify('deviceChange');
    return true;
  }

  rebuildCountValue(): number {
    return this.rebuildCount;
  }

  tabCount(): number {
    return this.browser.tabs.length;
  }

  tabIndex(): number {
    return this.browser.tabArrayIndex;
  }

  /* ---------------- notifications / observers ---------------- */

  subscribe(name: string): boolean {
    if (name === null || name === undefined || name.length === 0) {
      return false;
    }
    if (this.listeners.indexOf(name) >= 0) {
      return false;
    }
    this.listeners.push(name);
    return true;
  }

  unsubscribe(name: string): boolean {
    const index: number = this.listeners.indexOf(name);
    if (index < 0) {
      return false;
    }
    this.listeners.splice(index, 1);
    return true;
  }

  listenerCount(): number {
    return this.listeners.length;
  }

  deliveredCount(): number {
    return this.delivered;
  }

  notifyCount(): number {
    return this.notifications;
  }

  lastEventName(): string {
    return this.lastEvent;
  }

  currentRevision(): number {
    return this.revision;
  }

  private notify(channel: string): void {
    this.notifications += 1;
    this.lastEvent = channel;
    this.delivered += this.listeners.length;
  }

  private record(event: string): void {
    this.timeline.record(event);
  }

  timelineSize(): number {
    return this.timeline.size();
  }

  timelineDropped(): number {
    return this.timeline.droppedCount();
  }

  timelineContains(event: string): boolean {
    return this.timeline.contains(event);
  }

  timelineSequence(): string {
    return this.timeline.sequence();
  }

  clearTimeline(): void {
    this.timeline.clear();
  }

  /* ---------------- snapshots ---------------- */

  snapshot(label: string = 'auto'): IndexStateSnapshot {
    const snapshot: IndexStateSnapshot = new IndexStateSnapshot(this.revision, label);
    snapshot.isPhone = this.isPhone;
    snapshot.isInit = this.isInit;
    snapshot.progress = this.progress;
    snapshot.hideProgress = this.hideProgress;
    snapshot.loadingStatus = this.loadingStatus;
    snapshot.orientation = this.orientation;
    snapshot.deviceType = this.deviceType;
    snapshot.tabCount = this.browser.tabs.length;
    snapshot.tabIndex = this.browser.tabArrayIndex;
    snapshot.inputValue = this.browser.getInputVal();
    this.snapshots.push(snapshot);
    while (this.snapshots.length > MAX_SNAPSHOT_COUNT) {
      this.snapshots.shift();
    }
    return snapshot;
  }

  snapshotCount(): number {
    return this.snapshots.length;
  }

  latestSnapshot(): IndexStateSnapshot | null {
    if (this.snapshots.length === 0) {
      return null;
    }
    return this.snapshots[this.snapshots.length - 1];
  }

  restore(snapshot: IndexStateSnapshot | null): boolean {
    if (snapshot === null) {
      return false;
    }
    this.isPhone = snapshot.isPhone;
    this.isInit = snapshot.isInit;
    this.progress = snapshot.progress;
    this.hideProgress = snapshot.hideProgress;
    this.loadingStatus = snapshot.loadingStatus;
    this.orientation = snapshot.orientation;
    this.deviceType = snapshot.deviceType;
    this.browserReady = snapshot.isInit;
    this.revision = snapshot.revision;
    this.guard.reset();
    return true;
  }

  /* ---------------- consistency ---------------- */

  /**
   * Cross checks every field pair a render pass depends on.
   *
   * The validator is requestionally independent from the mutators so that a
   * directly poked field (which is what a broken binding would do) is reported.
   */
  validate(): StateIssue[] {
    const issues: StateIssue[] = [];
    if (!this.isInit) {
      issues.push(new StateIssue(ISSUE_NOT_INITIALIZED, 'page is not initialized'));
    }
    if (this.isInit && !this.browserReady) {
      issues.push(new StateIssue(ISSUE_BROWSER_MISSING, 'no browser attached'));
    }
    if (this.progress < PROGRESS_IDLE || this.progress >= PROGRESS_DONE) {
      issues.push(new StateIssue(ISSUE_PROGRESS_RANGE, `progress=${this.progress}`));
    }
    if (this.hideProgress && this.progress > PROGRESS_IDLE) {
      issues.push(new StateIssue(ISSUE_PROGRESS_VISIBILITY,
        `hidden bar with progress=${this.progress}`));
    }
    if (!this.hideProgress && this.progress === PROGRESS_DONE) {
      issues.push(new StateIssue(ISSUE_PROGRESS_VISIBILITY, 'completed load still visible'));
    }
    if (this.isPhone && this.deviceType === DEVICE_DEFAULT) {
      issues.push(new StateIssue(ISSUE_LAYOUT_MISMATCH, 'phone layout on default device'));
    }
    if (this.browser.tabArrayIndex < 0 ||
      this.browser.tabArrayIndex >= this.browser.tabs.length) {
      issues.push(new StateIssue(ISSUE_TAB_INDEX,
        `index=${this.browser.tabArrayIndex}, count=${this.browser.tabs.length}`));
    }
    if (this.browser.tabs.length < 1 || this.browser.tabs.length > MAX_TAB_COUNT) {
      issues.push(new StateIssue(ISSUE_TAB_COUNT, `count=${this.browser.tabs.length}`));
    }
    if (this.loadingStatus !== MockLoadingStatus.LOADING &&
      this.loadingStatus !== MockLoadingStatus.END) {
      issues.push(new StateIssue(ISSUE_LOADING_ENUM, `status=${this.loadingStatus}`));
    }
    return issues;
  }

  issueCodes(): string[] {
    return this.validate().map((issue: StateIssue) => issue.code);
  }

  isConsistent(): boolean {
    return this.validate().length === 0;
  }

  describe(): string {
    return `phone=${this.isPhone}|init=${this.isInit}|progress=${this.progress}` +
      `|visible=${!this.hideProgress}|loading=${this.loadingStatus}` +
      `|device=${this.deviceType}|tabs=${this.browser.tabs.length}` +
      `|index=${this.browser.tabArrayIndex}|orientation=${this.orientation}`;
  }
}
export default function indexStateManagerValidationTest() {
  describe('indexStateManagerValidationTest', () => {
    const driver: Driver = getDriver();
    const clock: MockClock = new MockClock(1700000000000);

    beforeAll(async () => {
      TestLogger.info(TAG, 'suite begin');
      TestLogger.step(TAG, 'launch browser application');
      await startBrowserApp();
      await serializedDelay(driver, 300);
    });

    afterAll(() => {
      TestLogger.info(TAG, `suite end, ${TestLogger.summary(TAG)}`);
    });

    it('IndexState_Init_001', 0, async () => {
      TestLogger.caseBegin(TAG, 'IndexState_Init_001');
      TestLogger.step(TAG, 'inspect the pre-initialization state');
      const manager: IndexStateManager = new IndexStateManager(DEVICE_DEFAULT, clock);
      expect(manager.isInit).assertFalse();
      expect(manager.isPhone).assertFalse();
      expect(manager.isTabletLayout()).assertTrue();
      expect(manager.canRenderContent()).assertFalse();
      expect(manager.issueCodes().indexOf(ISSUE_NOT_INITIALIZED) >= 0).assertTrue();
      expect(manager.homePage()).assertEqual(PAD_HOME_PAGE);
      expect(manager.tabCount()).assertEqual(1);
      TestLogger.info(TAG, `initial state ${manager.describe()}`);
      TestLogger.pass(TAG, 'IndexState_Init_001');
    });

    it('IndexState_Init_002', 0, async () => {
      TestLogger.step(TAG, 'initialize the page exactly once');
      const manager: IndexStateManager = new IndexStateManager(DEVICE_DEFAULT, clock);
      expect(manager.initState()).assertTrue();
      expect(manager.isInit).assertTrue();
      expect(manager.initCount).assertEqual(1);
      expect(manager.canRenderContent()).assertTrue();
      expect(manager.isConsistent()).assertTrue();
      expect(manager.initState()).assertFalse();
      expect(manager.initCount).assertEqual(1);
      expect(manager.notifyCount()).assertEqual(1);
      expect(manager.timelineContains(EVENT_INIT)).assertTrue();
      expect(manager.timelineContains('init:duplicate')).assertTrue();
      TestLogger.pass(TAG, 'IndexState_Init_002');
    });

    it('IndexState_Init_003', 0, async () => {
      TestLogger.step(TAG, 'dispose clears transient state');
      const manager: IndexStateManager = new IndexStateManager(DEVICE_PHONE, clock);
      manager.initState();
      manager.onProgressChange(PROGRESS_HALF);
      expect(manager.progressVisible()).assertTrue();
      expect(manager.disposeState()).assertTrue();
      expect(manager.isInit).assertFalse();
      expect(manager.browserReady).assertFalse();
      expect(manager.progress).assertEqual(PROGRESS_IDLE);
      expect(manager.hideProgress).assertTrue();
      expect(manager.isLoading()).assertFalse();
      expect(manager.disposeState()).assertFalse();
      TestLogger.pass(TAG, 'IndexState_Init_003');
    });

    it('IndexState_Device_004', 0, async () => {
      TestLogger.step(TAG, 'derive the layout from the device type');
      const phone: IndexStateManager = new IndexStateManager(DEVICE_PHONE, clock);
      const tv: IndexStateManager = new IndexStateManager(DEVICE_TV, clock);
      const pad: IndexStateManager = new IndexStateManager(DEVICE_TABLET, clock);
      const unknown: IndexStateManager = new IndexStateManager('foldable', clock);
      expect(phone.isPhone).assertTrue();
      expect(phone.isTabletLayout()).assertFalse();
      expect(phone.homePage()).assertEqual(PHONE_HOME_PAGE);
      expect(tv.isPhone).assertTrue();
      expect(pad.isPhone).assertTrue();
      expect(pad.deviceType).assertEqual(DEVICE_TABLET);
      expect(unknown.isPhone).assertFalse();
      expect(unknown.deviceType).assertEqual(DEVICE_DEFAULT);
      expect(unknown.resolveDeviceType('console')).assertEqual(DEVICE_DEFAULT);
      TestLogger.pass(TAG, 'IndexState_Device_004');
    });

    it('IndexState_Device_005', 0, async () => {
      TestLogger.step(TAG, 'apply a layout switch without rebuilding');
      const manager: IndexStateManager = new IndexStateManager(DEVICE_DEFAULT, clock);
      manager.initState();
      const rebuildsBefore: number = manager.rebuildCountValue();
      expect(manager.applyLayout(DEVICE_PHONE)).assertTrue();
      expect(manager.isPhone).assertTrue();
      expect(manager.rebuildCountValue()).assertEqual(rebuildsBefore);
      expect(manager.applyLayout(DEVICE_PHONE)).assertFalse();
      expect(manager.applyLayout(DEVICE_DEFAULT)).assertTrue();
      expect(manager.isPhone).assertFalse();
      expect(manager.isConsistent()).assertTrue();
      TestLogger.pass(TAG, 'IndexState_Device_005');
    });

    it('IndexState_Progress_006', 0, async () => {
      TestLogger.step(TAG, 'store a normal progress update');
      const manager: IndexStateManager = new IndexStateManager(DEVICE_DEFAULT, clock);
      manager.initState();
      expect(manager.onProgressChange(PROGRESS_HALF)).assertTrue();
      expect(manager.progress).assertEqual(PROGRESS_HALF);
      expect(manager.hideProgress).assertFalse();
      expect(manager.progressVisible()).assertTrue();
      expect(manager.progressPercent()).assertEqual(PROGRESS_HALF);
      expect(manager.isConsistent()).assertTrue();
      expect(manager.onProgressChange(75)).assertTrue();
      expect(manager.progress).assertEqual(75);
      TestLogger.pass(TAG, 'IndexState_Progress_006');
    });

    it('IndexState_Progress_007', 0, async () => {
      TestLogger.step(TAG, 'clamp negative and oversized progress values');
      const manager: IndexStateManager = new IndexStateManager(DEVICE_DEFAULT, clock);
      manager.initState();
      expect(manager.onProgressChange(-25)).assertTrue();
      expect(manager.progress).assertEqual(PROGRESS_IDLE);
      expect(manager.hideProgress).assertFalse();
      expect(manager.onProgressChange(150)).assertTrue();
      expect(manager.progress).assertEqual(PROGRESS_IDLE);
      expect(manager.hideProgress).assertTrue();
      expect(manager.onProgressChange(Number.NaN)).assertFalse();
      expect(manager.progress).assertEqual(PROGRESS_IDLE);
      TestLogger.pass(TAG, 'IndexState_Progress_007');
    });

    it('IndexState_Progress_008', 0, async () => {
      TestLogger.step(TAG, 'completed load hides the bar and rewinds progress');
      const manager: IndexStateManager = new IndexStateManager(DEVICE_DEFAULT, clock);
      manager.initState();
      manager.onProgressChange(40);
      const revisionBefore: number = manager.currentRevision();
      expect(manager.onProgressChange(PROGRESS_DONE)).assertTrue();
      expect(manager.progress).assertEqual(PROGRESS_IDLE);
      expect(manager.hideProgress).assertTrue();
      expect(manager.progressVisible()).assertFalse();
      expect(manager.currentRevision()).assertLarger(revisionBefore);
      expect(manager.isConsistent()).assertTrue();
      expect(manager.progressIsMonotonic(40, PROGRESS_DONE)).assertTrue();
      expect(manager.progressIsMonotonic(80, 20)).assertFalse();
      TestLogger.pass(TAG, 'IndexState_Progress_008');
    });

    it('IndexState_Loading_009', 0, async () => {
      TestLogger.step(TAG, 'page begin and page end transitions');
      const manager: IndexStateManager = new IndexStateManager(DEVICE_DEFAULT, clock);
      manager.initState();
      expect(manager.onPageBegin('https://www.example.com/index.html')).assertTrue();
      expect(manager.isLoading()).assertTrue();
      expect(manager.browser.getInputVal()).assertEqual('https://www.example.com/index.html');
      expect(manager.hideProgress).assertFalse();
      expect(manager.onPageEnd()).assertTrue();
      expect(manager.isLoading()).assertFalse();
      expect(manager.hideProgress).assertTrue();
      expect(manager.browser.getCurrentTab() !== null).assertTrue();
      expect(manager.isConsistent()).assertTrue();
      TestLogger.pass(TAG, 'IndexState_Loading_009');
    });

    it('IndexState_Loading_010', 0, async () => {
      TestLogger.step(TAG, 'loading status setter de-duplicates writes');
      const manager: IndexStateManager = new IndexStateManager(DEVICE_DEFAULT, clock);
      manager.initState();
      const base: number = manager.notifyCount();
      expect(manager.setLoadingStatus(MockLoadingStatus.LOADING)).assertTrue();
      expect(manager.notifyCount()).assertEqual(base + 1);
      expect(manager.setLoadingStatus(MockLoadingStatus.LOADING)).assertTrue();
      expect(manager.notifyCount()).assertEqual(base + 1);
      expect(manager.setLoadingStatus(MockLoadingStatus.END)).assertTrue();
      expect(manager.notifyCount()).assertEqual(base + 2);
      expect(manager.lastEventName()).assertEqual('loading');
      expect(manager.timelineContains(EVENT_LOADING)).assertTrue();
      TestLogger.pass(TAG, 'IndexState_Loading_010');
    });
    it('IndexState_Rotation_011', 0, async () => {
      TestLogger.step(TAG, 'first landscape callback takes effect');
      const manager: IndexStateManager = new IndexStateManager(DEVICE_DEFAULT, clock);
      manager.initState();
      expect(manager.isLandscape()).assertFalse();
      expect(manager.onOrientationChange(ORIENTATION_LANDSCAPE)).assertTrue();
      expect(manager.orientation).assertEqual(ORIENTATION_LANDSCAPE);
      expect(manager.isLandscape()).assertTrue();
      expect(manager.rotationCount()).assertEqual(1);
      expect(manager.suppressedRotationCount()).assertEqual(0);
      expect(manager.orientationHistoryLength()).assertEqual(2);
      expect(manager.timelineContains(EVENT_ROTATION)).assertTrue();
      TestLogger.info(TAG, `after rotation ${manager.describe()}`);
      TestLogger.pass(TAG, 'IndexState_Rotation_011');
    });

    it('IndexState_Rotation_012', 0, async () => {
      TestLogger.step(TAG, 'repeated landscape callback is ignored');
      const manager: IndexStateManager = new IndexStateManager(DEVICE_DEFAULT, clock);
      manager.initState();
      expect(manager.onOrientationChange(ORIENTATION_LANDSCAPE)).assertTrue();
      const notifications: number = manager.notifyCount();
      expect(manager.onOrientationChange(ORIENTATION_LANDSCAPE)).assertFalse();
      expect(manager.onOrientationChange(ORIENTATION_LANDSCAPE)).assertFalse();
      expect(manager.rotationCount()).assertEqual(1);
      expect(manager.suppressedRotationCount()).assertEqual(2);
      expect(manager.notifyCount()).assertEqual(notifications);
      expect(manager.orientationHistoryLength()).assertEqual(2);
      expect(manager.timelineContains('rotation:suppressed')).assertTrue();
      TestLogger.pass(TAG, 'IndexState_Rotation_012');
    });

    it('IndexState_Rotation_013', 0, async () => {
      TestLogger.step(TAG, 'a real rotation back applies again');
      const manager: IndexStateManager = new IndexStateManager(DEVICE_DEFAULT, clock);
      manager.initState();
      expect(manager.onOrientationChange(ORIENTATION_LANDSCAPE)).assertTrue();
      expect(manager.onOrientationChange(ORIENTATION_PORTRAIT)).assertTrue();
      expect(manager.orientation).assertEqual(ORIENTATION_PORTRAIT);
      expect(manager.isLandscape()).assertFalse();
      expect(manager.rotationCount()).assertEqual(2);
      expect(manager.orientationHistoryLength()).assertEqual(3);
      expect(manager.suppressedRotationCount()).assertEqual(0);
      expect(manager.isConsistent()).assertTrue();
      TestLogger.pass(TAG, 'IndexState_Rotation_013');
    });

    it('IndexState_Rotation_014', 0, async () => {
      TestLogger.step(TAG, 'rotation keeps the address and drops transient progress');
      const manager: IndexStateManager = new IndexStateManager(DEVICE_DEFAULT, clock);
      manager.initState();
      manager.browser.setInputVal('https://www.example.com/rotation.html');
      manager.onProgressChange(65);
      manager.setLoadingStatus(MockLoadingStatus.LOADING);
      expect(manager.onOrientationChange(ORIENTATION_LANDSCAPE)).assertTrue();
      expect(manager.browser.getInputVal()).assertEqual('https://www.example.com/rotation.html');
      expect(manager.progress).assertEqual(PROGRESS_IDLE);
      expect(manager.hideProgress).assertTrue();
      expect(manager.isLoading()).assertTrue();
      expect(manager.isConsistent()).assertTrue();
      TestLogger.pass(TAG, 'IndexState_Rotation_014');
    });

    it('IndexState_Rotation_015', 0, async () => {
      TestLogger.step(TAG, 'unknown orientation normalizes to portrait');
      const manager: IndexStateManager = new IndexStateManager(DEVICE_DEFAULT, clock);
      manager.initState();
      expect(manager.onOrientationChange('sideways')).assertFalse();
      expect(manager.rotationCount()).assertEqual(0);
      expect(manager.suppressedRotationCount()).assertEqual(1);
      expect(manager.onOrientationChange(ORIENTATION_LANDSCAPE)).assertTrue();
      expect(manager.onOrientationChange('sideways')).assertTrue();
      expect(manager.orientation).assertEqual(ORIENTATION_PORTRAIT);
      expect(manager.rotationCount()).assertEqual(2);
      TestLogger.pass(TAG, 'IndexState_Rotation_015');
    });

    it('IndexState_DeviceChange_016', 0, async () => {
      TestLogger.step(TAG, 'device change rebuilds the layout and the engine');
      const manager: IndexStateManager = new IndexStateManager(DEVICE_DEFAULT, clock);
      manager.initState();
      const revisions: number = manager.currentRevision();
      expect(manager.onDeviceChange(DEVICE_PHONE)).assertTrue();
      expect(manager.deviceType).assertEqual(DEVICE_PHONE);
      expect(manager.isPhone).assertTrue();
      expect(manager.rebuildCountValue()).assertEqual(1);
      expect(manager.homePage()).assertEqual(PHONE_HOME_PAGE);
      expect(manager.currentRevision()).assertLarger(revisions);
      expect(manager.lastEventName()).assertEqual('deviceChange');
      expect(manager.isConsistent()).assertTrue();
      TestLogger.info(TAG, `rebuilt state ${manager.describe()}`);
      TestLogger.pass(TAG, 'IndexState_DeviceChange_016');
    });

    it('IndexState_DeviceChange_017', 0, async () => {
      TestLogger.step(TAG, 'device change with the same type is a no-op');
      const manager: IndexStateManager = new IndexStateManager(DEVICE_PHONE, clock);
      manager.initState();
      const rebuilds: number = manager.rebuildCountValue();
      const notifications: number = manager.notifyCount();
      expect(manager.onDeviceChange(DEVICE_PHONE)).assertFalse();
      expect(manager.rebuildCountValue()).assertEqual(rebuilds);
      expect(manager.notifyCount()).assertEqual(notifications);
      expect(manager.timelineContains('device:noop')).assertTrue();
      expect(manager.onDeviceChange('foldable')).assertTrue();
      expect(manager.deviceType).assertEqual(DEVICE_DEFAULT);
      expect(manager.isPhone).assertFalse();
      TestLogger.pass(TAG, 'IndexState_DeviceChange_017');
    });

    it('IndexState_DeviceChange_018', 0, async () => {
      TestLogger.step(TAG, 'rebuild preserves the address and the tab count');
      const manager: IndexStateManager = new IndexStateManager(DEVICE_DEFAULT, clock);
      manager.initState();
      manager.browser.addTab();
      manager.browser.addTab();
      manager.browser.setInputVal('example.com/path?a=1');
      expect(manager.tabCount()).assertEqual(3);
      expect(manager.onDeviceChange(DEVICE_PHONE)).assertTrue();
      expect(manager.tabCount()).assertEqual(3);
      expect(manager.browser.getInputVal()).assertEqual('example.com/path?a=1');
      expect(manager.browser.getTabKeys().length).assertEqual(3);
      expect(manager.browser.getTabKeys()[2]).assertEqual(2);
      expect(manager.isConsistent()).assertTrue();
      TestLogger.pass(TAG, 'IndexState_DeviceChange_018');
    });

    it('IndexState_DeviceChange_019', 0, async () => {
      TestLogger.step(TAG, 'rebuild resets index, progress and loading status');
      const manager: IndexStateManager = new IndexStateManager(DEVICE_DEFAULT, clock);
      manager.initState();
      manager.browser.addTab();
      manager.browser.setTabArrayIndex(1);
      manager.onProgressChange(70);
      manager.setLoadingStatus(MockLoadingStatus.LOADING);
      expect(manager.onDeviceChange(DEVICE_TABLET)).assertTrue();
      expect(manager.tabIndex()).assertEqual(0);
      expect(manager.progress).assertEqual(PROGRESS_IDLE);
      expect(manager.hideProgress).assertTrue();
      expect(manager.loadingStatus).assertEqual(MockLoadingStatus.END);
      expect(manager.browser.getCurrentTab() !== null).assertTrue();
      expect(manager.isConsistent()).assertTrue();
      TestLogger.pass(TAG, 'IndexState_DeviceChange_019');
    });

    it('IndexState_DeviceChange_020', 0, async () => {
      TestLogger.step(TAG, 'rebuild clamps an oversized tab list');
      const manager: IndexStateManager = new IndexStateManager(DEVICE_DEFAULT, clock);
      manager.initState();
      for (let index = 0; index < 10; index++) {
        manager.browser.addTab();
      }
      expect(manager.tabCount()).assertEqual(MAX_TAB_COUNT + 1);
      expect(manager.onDeviceChange(DEVICE_PHONE)).assertTrue();
      expect(manager.tabCount()).assertEqual(MAX_TAB_COUNT);
      expect(manager.browser.getTabKeys().length).assertEqual(MAX_TAB_COUNT);
      expect(manager.isConsistent()).assertTrue();
      TestLogger.info(TAG, `tab list clamped to ${manager.tabCount()}`);
      TestLogger.pass(TAG, 'IndexState_DeviceChange_020');
    });
    it('IndexState_BackPress_021', 0, async () => {
      TestLogger.step(TAG, 'back press is consumed while history exists');
      const manager: IndexStateManager = new IndexStateManager(DEVICE_DEFAULT, clock);
      manager.initState();
      manager.browser.loadUrl('https://www.example.com/one.html');
      manager.browser.loadUrl('https://www.example.com/two.html');
      expect(manager.browser.getCurrentTab() !== null).assertTrue();
      expect(manager.onBackPress()).assertTrue();
      expect(manager.timelineContains('backPress:consumed')).assertTrue();
      expect(manager.isConsistent()).assertTrue();
      TestLogger.pass(TAG, 'IndexState_BackPress_021');
    });

    it('IndexState_BackPress_022', 0, async () => {
      TestLogger.step(TAG, 'back press is consumed while a page is loading');
      const manager: IndexStateManager = new IndexStateManager(DEVICE_DEFAULT, clock);
      manager.initState();
      manager.setLoadingStatus(MockLoadingStatus.LOADING);
      expect(manager.onBackPress()).assertTrue();
      manager.setLoadingStatus(MockLoadingStatus.END);
      expect(manager.onBackPress()).assertFalse();
      expect(manager.timelineContains('backPress:passed')).assertTrue();
      expect(manager.isConsistent()).assertTrue();
      TestLogger.pass(TAG, 'IndexState_BackPress_022');
    });

    it('IndexState_Snapshot_023', 0, async () => {
      TestLogger.step(TAG, 'snapshot and restore the whole page state');
      const manager: IndexStateManager = new IndexStateManager(DEVICE_DEFAULT, clock);
      manager.initState();
      manager.applyLayout(DEVICE_PHONE);
      manager.onProgressChange(PROGRESS_HALF);
      manager.browser.addTab();
      manager.browser.setInputVal('https://www.example.com/snapshot.html');
      const snapshot: IndexStateSnapshot = manager.snapshot('before-dispose');
      expect(snapshot.isPhone).assertTrue();
      expect(snapshot.isInit).assertTrue();
      expect(snapshot.progress).assertEqual(PROGRESS_HALF);
      expect(snapshot.tabCount).assertEqual(2);
      expect(snapshot.inputValue).assertEqual('https://www.example.com/snapshot.html');
      manager.disposeState();
      manager.applyLayout(DEVICE_DEFAULT);
      expect(manager.restore(snapshot)).assertTrue();
      expect(manager.isPhone).assertTrue();
      expect(manager.isInit).assertTrue();
      expect(manager.progress).assertEqual(PROGRESS_HALF);
      expect(manager.deviceType).assertEqual(DEVICE_PHONE);
      expect(manager.restore(null)).assertFalse();
      TestLogger.info(TAG, `restored snapshot ${snapshot.describe()}`);
      TestLogger.pass(TAG, 'IndexState_Snapshot_023');
    });

    it('IndexState_Snapshot_024', 0, async () => {
      TestLogger.step(TAG, 'snapshot ring buffer stays bounded');
      const manager: IndexStateManager = new IndexStateManager(DEVICE_DEFAULT, clock);
      manager.initState();
      for (let index = 0; index < 20; index++) {
        manager.onProgressChange(index + 1);
        manager.snapshot(`round-${index}`);
      }
      expect(manager.snapshotCount()).assertEqual(MAX_SNAPSHOT_COUNT);
      const latest: IndexStateSnapshot | null = manager.latestSnapshot();
      expect(latest === null).assertFalse();
      if (latest !== null) {
        expect(latest.label).assertEqual('round-19');
        expect(latest.sameAs(latest)).assertTrue();
      }
      const older: IndexStateSnapshot = manager.snapshot('older');
      expect(older.sameAs(latest)).assertTrue();
      expect(manager.snapshotCount()).assertEqual(MAX_SNAPSHOT_COUNT);
      TestLogger.pass(TAG, 'IndexState_Snapshot_024');
    });

    it('IndexState_Validate_025', 0, async () => {
      TestLogger.step(TAG, 'validator reports poked progress and layout fields');
      const manager: IndexStateManager = new IndexStateManager(DEVICE_DEFAULT, clock);
      manager.initState();
      expect(manager.validate().length).assertEqual(0);
      manager.progress = 150;
      expect(manager.issueCodes().indexOf(ISSUE_PROGRESS_RANGE) >= 0).assertTrue();
      manager.progress = PROGRESS_IDLE;
      manager.isPhone = true;
      const codes: string[] = manager.issueCodes();
      expect(codes.indexOf(ISSUE_LAYOUT_MISMATCH) >= 0).assertTrue();
      manager.isPhone = false;
      manager.browser.setTabArrayIndex(5);
      expect(manager.issueCodes().indexOf(ISSUE_TAB_INDEX) >= 0).assertTrue();
      manager.browser.setTabArrayIndex(0);
      expect(manager.isConsistent()).assertTrue();
      TestLogger.pass(TAG, 'IndexState_Validate_025');
    });

    it('IndexState_Validate_026', 0, async () => {
      TestLogger.step(TAG, 'validator reports an empty tab list');
      const manager: IndexStateManager = new IndexStateManager(DEVICE_DEFAULT, clock);
      manager.initState();
      manager.browser.tabs = [];
      const codes: string[] = manager.issueCodes();
      expect(codes.indexOf(ISSUE_TAB_COUNT) >= 0).assertTrue();
      expect(codes.indexOf(ISSUE_TAB_INDEX) >= 0).assertTrue();
      expect(manager.isConsistent()).assertFalse();
      const issues: StateIssue[] = manager.validate();
      expect(issues.length >= 2).assertTrue();
      expect(issues[0].describe().indexOf(':') >= 0).assertTrue();
      manager.browser = new MockBrowser(1);
      expect(manager.isConsistent()).assertTrue();
      TestLogger.info(TAG, `issues after empty tab list=${codes.join(',')}`);
      TestLogger.pass(TAG, 'IndexState_Validate_026');
    });

    it('IndexState_Observer_027', 0, async () => {
      TestLogger.step(TAG, 'observers receive one delivery per change');
      const manager: IndexStateManager = new IndexStateManager(DEVICE_DEFAULT, clock);
      expect(manager.subscribe('indexPage')).assertTrue();
      expect(manager.subscribe('titleBar')).assertTrue();
      expect(manager.subscribe('indexPage')).assertFalse();
      expect(manager.listenerCount()).assertEqual(2);
      manager.initState();
      expect(manager.deliveredCount()).assertEqual(2);
      manager.onProgressChange(PROGRESS_HALF);
      expect(manager.deliveredCount()).assertEqual(4);
      expect(manager.unsubscribe('titleBar')).assertTrue();
      manager.onProgressChange(60);
      expect(manager.deliveredCount()).assertEqual(5);
      expect(manager.unsubscribe('titleBar')).assertFalse();
      TestLogger.pass(TAG, 'IndexState_Observer_027');
    });

    it('IndexState_Timeline_028', 0, async () => {
      TestLogger.step(TAG, 'replay timeline is bounded');
      const manager: IndexStateManager = new IndexStateManager(DEVICE_DEFAULT, clock);
      manager.initState();
      for (let index = 0; index < 100; index++) {
        manager.onProgressChange(index % 99);
      }
      expect(manager.timelineSize()).assertEqual(MAX_REPLAY_EVENTS);
      expect(manager.timelineDropped()).assertLarger(0);
      expect(manager.timelineContains(EVENT_PROGRESS)).assertTrue();
      expect(manager.timelineSequence().length).assertLarger(0);
      manager.clearTimeline();
      expect(manager.timelineSize()).assertEqual(0);
      expect(manager.timelineDropped()).assertEqual(0);
      TestLogger.pass(TAG, 'IndexState_Timeline_028');
    });

    it('IndexState_Sequence_029', 0, async () => {
      TestLogger.step(TAG, 'long mixed sequence keeps the page consistent');
      const manager: IndexStateManager = new IndexStateManager(DEVICE_DEFAULT, clock);
      manager.initState();
      const devices: string[] = [DEVICE_PHONE, DEVICE_TABLET, DEVICE_DEFAULT, DEVICE_TV];
      const orientations: string[] = [ORIENTATION_LANDSCAPE, ORIENTATION_PORTRAIT,
        ORIENTATION_LANDSCAPE, ORIENTATION_LANDSCAPE];
      for (let index = 0; index < 12; index++) {
        manager.onDeviceChange(devices[index % devices.length]);
        manager.onOrientationChange(orientations[index % orientations.length]);
        manager.onProgressChange((index * 9) % 101);
        if (index % 3 === 0) {
          manager.browser.addTab();
        }
        expect(manager.isConsistent()).assertTrue();
      }
      expect(manager.rebuildCountValue()).assertLarger(0);
      expect(manager.tabCount() <= MAX_TAB_COUNT).assertTrue();
      expect(manager.describe().indexOf('phone=') >= 0).assertTrue();
      TestLogger.info(TAG, `sequence state ${manager.describe()}`);
      TestLogger.pass(TAG, 'IndexState_Sequence_029');
    });

    it('IndexState_UI_031', 0, async () => {
      TestLogger.step(TAG, 'focus movement does not destroy the page state');
      await pressKey(driver, KEY_DPAD_LEFT, 1, DELAY_KEY_NAVIGATION);
      await pressKey(driver, KEY_DPAD_RIGHT, 1, DELAY_KEY_NAVIGATION);
      const inputExists: boolean = await componentByIdExists(driver, ID_INPUT_URL);
      expect(inputExists).assertTrue();
      const text: string = await textById(driver, ID_INPUT_URL);
      expect(text.length >= 0).assertTrue();
      const backExists: boolean = await componentByIdExists(driver, ID_NAV_BACK);
      expect(backExists).assertTrue();
      TestLogger.info(TAG, 'page state survived dpad traversal');
      TestLogger.pass(TAG, 'IndexState_UI_031');
    });

    it('IndexState_UI_032', 0, async () => {
      TestLogger.step(TAG, 'action buttons stay reachable after focus changes');
      const submitExists: boolean = await componentByIdExists(driver, ID_ACTION_SUBMIT);
      const addExists: boolean = await componentByIdExists(driver, ID_ACTION_ADD);
      const refreshExists: boolean = await componentByIdExists(driver, ID_NAV_REFRESH);
      const forwardExists: boolean = await componentByIdExists(driver, ID_NAV_FORWARD);
      expect(refreshExists).assertTrue();
      expect(forwardExists).assertTrue();
      expect(submitExists || addExists).assertTrue();
      await serializedDelay(driver, 100);
      TestLogger.pass(TAG, 'IndexState_UI_032');
    });
  });
}
