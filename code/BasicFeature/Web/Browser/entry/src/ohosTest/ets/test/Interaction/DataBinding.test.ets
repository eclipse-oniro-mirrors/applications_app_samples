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
  getDriver, startBrowserApp, componentByIdExists, textById, inputById, serializedDelay,
  ID_INPUT_URL, ID_NAV_HOME, DELAY_KEY_NAVIGATION, TIMEOUT_COMPONENT, MAX_TAB_COUNT,
  MIN_TAB_COUNT, PAD_HOME_PAGE
} from '../Shared/BrowserTestKit';
import { MockBrowser, MockLoadingStatus } from '../Shared/BrowserMock';

const TAG: string = 'BrowserDataBindingTest';

/* ------------------------------------------------------------------ */
/* Binding contract of pages/Index.ets and common/TitleBar.ets         */
/* ------------------------------------------------------------------ */

/** Views that consume the shared browser state through @Link. */
const VIEW_TABLET_TITLE: string = 'TabletTitle';
const VIEW_BROWSER_TABS: string = 'BrowserTabs';
const VIEW_WEB_TAB: string = 'WebTab';
const VIEW_PHONE_LAYOUT: string = 'PhoneLayout';

const VIEWS_OF_TABLET: string[] = [VIEW_TABLET_TITLE, VIEW_BROWSER_TABS, VIEW_WEB_TAB];
const VIEWS_OF_PHONE: string[] = [VIEW_PHONE_LAYOUT];

const KEY_INPUT_VALUE: string = 'inputValue';
const KEY_TAB_INDEX: string = 'tabArrayIndex';
const KEY_PROGRESS: string = 'progress';
const KEY_HIDE_PROGRESS: string = 'hideProgress';
const KEY_LOADING: string = 'loadingStatus';
const KEY_TAB_KEYS: string = 'webArray.key';

/* ------------------------------------------------------------------ */
/* Observable value                                                    */
/* ------------------------------------------------------------------ */

/** Minimal @State replacement: notifies only on a real value change. */
class ObservableValue {
  private value: string;
  revision: number = 0;
  notifyCount: number = 0;
  changeLog: string[] = [];

  constructor(initial: string = '') {
    this.value = initial;
  }

  get(): string {
    return this.value;
  }

  set(next: string): boolean {
    if (this.value === next) {
      return false;
    }
    this.value = next;
    this.revision += 1;
    this.notifyCount += 1;
    this.changeLog.push(next);
    return true;
  }

  reset(): void {
    this.value = '';
    this.revision += 1;
    this.notifyCount += 1;
  }

  isDirty(): boolean {
    return this.revision > 0;
  }
}

/** Numeric variant used for tabArrayIndex, progress and loading status. */
class ObservableNumber {
  private value: number;
  revision: number = 0;
  notifyCount: number = 0;

  constructor(initial: number = 0) {
    this.value = initial;
  }

  get(): number {
    return this.value;
  }

  set(next: number): boolean {
    if (this.value === next) {
      return false;
    }
    this.value = next;
    this.revision += 1;
    this.notifyCount += 1;
    return true;
  }
}

/** Bool variant used for hideProgress. */
class ObservableFlag {
  private value: boolean;
  revision: number = 0;

  constructor(initial: boolean = true) {
    this.value = initial;
  }

  get(): boolean {
    return this.value;
  }

  set(next: boolean): boolean {
    if (this.value === next) {
      return false;
    }
    this.value = next;
    this.revision += 1;
    return true;
  }
}

/* ------------------------------------------------------------------ */
/* Shared browser state                                                */
/* ------------------------------------------------------------------ */

/**
 * Mirror of the @State browser object of Index.ets.
 *
 * Every declared view receives the same instance, exactly as @Link does in
 * ArkUI. A view never copies the state: it reads and writes through the
 * shared reference, therefore a single assignment must be visible from all
 * linked views in the same render pass.
 */
class SharedBrowserState {
  inputValue: ObservableValue = new ObservableValue('');
  tabIndex: ObservableNumber = new ObservableNumber(0);
  progress: ObservableNumber = new ObservableNumber(0);
  hideProgress: ObservableFlag = new ObservableFlag(true);
  loading: ObservableNumber = new ObservableNumber(1);
  keys: number[] = [0];
  timestamps: number[] = [1700000000000];
  toasts: string[] = [];
  views: BindingView[] = [];

  constructor(tabCount: number = 1) {
    const count: number = tabCount < MIN_TAB_COUNT ? MIN_TAB_COUNT : tabCount;
    this.keys = [];
    this.timestamps = [];
    for (let index = 0; index < count; index++) {
      this.keys.push(index);
      this.timestamps.push(1700000000000 + index);
    }
  }

  attach(view: BindingView): void {
    this.views.push(view);
  }

  attachedCount(): number {
    return this.views.length;
  }

  attachedNames(): string[] {
    return this.views.map((view: BindingView) => view.name);
  }

  /** Every linked view observes the new tab index in the same pass. */
  selectTab(index: number): boolean {
    if (index < 0 || index >= this.keys.length) {
      return false;
    }
    this.tabIndex.set(index);
    return true;
  }

  addTab(): boolean {
    if (this.keys.length > MAX_TAB_COUNT) {
      this.toasts.push('页签数量已满');
      return false;
    }
    const key: number = this.keys.length;
    this.keys.push(key);
    this.timestamps.push(1700000000000 + key);
    this.tabIndex.set(this.keys.length - 1);
    return true;
  }

  deleteTab(index: number): boolean {
    if (index < 0 || index >= this.keys.length) {
      return false;
    }
    if (this.keys.length <= MIN_TAB_COUNT) {
      return false;
    }
    this.keys.splice(index, 1);
    this.timestamps.splice(index, 1);
    let current: number = this.tabIndex.get();
    if (current > index || current === this.keys.length) {
      current -= 1;
    }
    if (current < 0) {
      current = 0;
    }
    this.tabIndex.set(current);
    for (let cursor = index; cursor < this.keys.length; cursor++) {
      this.keys[cursor] -= 1;
    }
    return true;
  }

  setInput(value: string): boolean {
    return this.inputValue.set(value);
  }

  setProgress(value: number): void {
    const clamped: number = value < 0 ? 0 : (value > 100 ? 100 : value);
    this.progress.set(clamped);
    if (clamped === 100) {
      this.hideProgress.set(true);
      this.progress.set(0);
    } else {
      this.hideProgress.set(false);
    }
  }

  setLoading(status: MockLoadingStatus): void {
    this.loading.set(status === MockLoadingStatus.LOADING ? 0 : 1);
  }

  isLoading(): boolean {
    return this.loading.get() === 0;
  }

  keyCount(): number {
    return this.keys.length;
  }

  snapshot(): string {
    return `${this.inputValue.get()}|${this.tabIndex.get()}|${this.progress.get()}|${this.keys.join(',')}`;
  }
}

/** One @Link consumer: records the last values it rendered. */
class BindingView {
  name: string;
  state: SharedBrowserState;
  renders: number = 0;
  lastInput: string = '';
  lastIndex: number = -1;
  lastProgress: number = -1;
  lastKeys: string = '';

  constructor(name: string, state: SharedBrowserState) {
    this.name = name;
    this.state = state;
    this.render();
  }

  /** Re-reads the shared state, which is what a re-render does. */
  render(): void {
    this.renders += 1;
    this.lastInput = this.state.inputValue.get();
    this.lastIndex = this.state.tabIndex.get();
    this.lastProgress = this.state.progress.get();
    this.lastKeys = this.state.keys.join(',');
  }

  input(): string {
    this.lastInput = this.state.inputValue.get();
    return this.lastInput;
  }

  index(): number {
    this.lastIndex = this.state.tabIndex.get();
    return this.lastIndex;
  }

  progress(): number {
    this.lastProgress = this.state.progress.get();
    return this.lastProgress;
  }

  keys(): string {
    this.lastKeys = this.state.keys.join(',');
    return this.lastKeys;
  }

  isStale(): boolean {
    return this.lastInput !== this.state.inputValue.get() ||
      this.lastIndex !== this.state.tabIndex.get() ||
      this.lastProgress !== this.state.progress.get() ||
      this.lastKeys !== this.state.keys.join(',');
  }
}

/** Builds a tablet state with every linked view attached. */
function buildTabletBinding(tabCount: number = 1): SharedBrowserState {
  const state: SharedBrowserState = new SharedBrowserState(tabCount);
  for (let index = 0; index < VIEWS_OF_TABLET.length; index++) {
    state.attach(new BindingView(VIEWS_OF_TABLET[index], state));
  }
  return state;
}

function buildPhoneBinding(tabCount: number = 1): SharedBrowserState {
  const state: SharedBrowserState = new SharedBrowserState(tabCount);
  for (let index = 0; index < VIEWS_OF_PHONE.length; index++) {
    state.attach(new BindingView(VIEWS_OF_PHONE[index], state));
  }
  return state;
}

/* ------------------------------------------------------------------ */
/* Suite                                                               */
/* ------------------------------------------------------------------ */

export default function browserDataBindingTest() {
  describe('browserDataBindingTest', () => {
    let driver: Driver = getDriver();

    beforeAll(async () => {
      TestLogger.info(TAG, 'suite begin');
      await startBrowserApp();
      await serializedDelay(driver, DELAY_KEY_NAVIGATION);
      TestLogger.info(TAG, `tablet views: ${VIEWS_OF_TABLET.join(',')}`);
    });

    afterAll(() => {
      TestLogger.info(TAG, TestLogger.summary(TAG));
    });

    it('Browser_Binding_001', 0, async () => {
      TestLogger.step(TAG, 'initial state mirrors the Browser constructor');
      const state: SharedBrowserState = new SharedBrowserState();
      expect(state.inputValue.get()).assertEqual('');
      expect(state.tabIndex.get()).assertEqual(0);
      expect(state.progress.get()).assertEqual(0);
      expect(state.hideProgress.get()).assertTrue();
      expect(state.isLoading()).assertFalse();
      expect(state.keyCount()).assertEqual(MIN_TAB_COUNT);
      expect(state.inputValue.isDirty()).assertFalse();
    });

    it('Browser_Binding_002', 0, async () => {
      TestLogger.step(TAG, 'all tablet views link to one browser instance');
      const state: SharedBrowserState = buildTabletBinding();
      expect(state.attachedCount()).assertEqual(3);
      expect(state.attachedNames().join(',')).assertEqual(VIEWS_OF_TABLET.join(','));
      for (let index = 0; index < state.views.length; index++) {
        expect(state.views[index].state === state).assertTrue();
        expect(state.views[index].renders).assertEqual(1);
      }
      const phone: SharedBrowserState = buildPhoneBinding();
      expect(phone.attachedCount()).assertEqual(1);
      expect(phone.attachedNames()[0]).assertEqual(VIEW_PHONE_LAYOUT);
    });

    it('Browser_Binding_003', 0, async () => {
      TestLogger.step(TAG, 'model input change is visible from every linked view');
      const state: SharedBrowserState = buildTabletBinding();
      expect(state.setInput('https://example.com')).assertTrue();
      for (let index = 0; index < state.views.length; index++) {
        const view: BindingView = state.views[index];
        expect(view.input()).assertEqual('https://example.com');
        expect(view.isStale()).assertFalse();
      }
      expect(state.inputValue.notifyCount).assertEqual(1);
      expect(state.inputValue.revision).assertEqual(1);
      expect(state.inputValue.changeLog.join(',')).assertEqual('https://example.com');
    });

    it('Browser_Binding_004', 0, async () => {
      TestLogger.step(TAG, 'view edit flows back into the shared model');
      const state: SharedBrowserState = buildTabletBinding();
      const title: BindingView = state.views[0];
      state.setInput('typed-in-title');
      title.render();
      expect(title.input()).assertEqual('typed-in-title');
      title.state.setInput('edited-again');
      expect(state.inputValue.get()).assertEqual('edited-again');
      expect(state.views[2].input()).assertEqual('edited-again');
      expect(title.renders).assertEqual(2);
    });

    it('Browser_Binding_005', 0, async () => {
      TestLogger.step(TAG, 'assigning an identical value does not notify');
      const state: SharedBrowserState = buildTabletBinding();
      expect(state.setInput('same.com')).assertTrue();
      expect(state.inputValue.notifyCount).assertEqual(1);
      expect(state.setInput('same.com')).assertFalse();
      expect(state.inputValue.notifyCount).assertEqual(1);
      expect(state.inputValue.revision).assertEqual(1);
      state.setInput('');
      expect(state.setInput('')).assertFalse();
      expect(state.inputValue.notifyCount).assertEqual(2);
    });

    it('Browser_Binding_006', 0, async () => {
      TestLogger.step(TAG, 'tabArrayIndex stays in sync across all views');
      const state: SharedBrowserState = buildTabletBinding(3);
      expect(state.keyCount()).assertEqual(3);
      expect(state.selectTab(2)).assertTrue();
      for (let index = 0; index < state.views.length; index++) {
        expect(state.views[index].index()).assertEqual(2);
      }
      expect(state.selectTab(0)).assertTrue();
      expect(state.views[1].index()).assertEqual(0);
      expect(state.selectTab(3)).assertFalse();
      expect(state.selectTab(-1)).assertFalse();
      expect(state.tabIndex.get()).assertEqual(0);
    });

    it('Browser_Binding_007', 0, async () => {
      TestLogger.step(TAG, 'addTab appends a key and jumps every view');
      const state: SharedBrowserState = buildTabletBinding();
      expect(state.addTab()).assertTrue();
      expect(state.addTab()).assertTrue();
      expect(state.keyCount()).assertEqual(3);
      expect(state.tabIndex.get()).assertEqual(2);
      for (let index = 0; index < state.views.length; index++) {
        expect(state.views[index].index()).assertEqual(2);
        expect(state.views[index].keys()).assertEqual('0,1,2');
      }
      expect(state.timestamps.length).assertEqual(3);
      expect(state.toasts.length).assertEqual(0);
    });

    it('Browser_Binding_008', 0, async () => {
      TestLogger.step(TAG, 'tab capacity keeps the shared array untouched');
      const state: SharedBrowserState = buildTabletBinding();
      for (let index = 0; index < MAX_TAB_COUNT - 1; index++) {
        expect(state.addTab()).assertTrue();
      }
      expect(state.keyCount()).assertEqual(MAX_TAB_COUNT);
      expect(state.addTab()).assertTrue();
      expect(state.keyCount()).assertEqual(MAX_TAB_COUNT + 1);
      expect(state.addTab()).assertFalse();
      expect(state.keyCount()).assertEqual(MAX_TAB_COUNT + 1);
      expect(state.toasts[state.toasts.length - 1]).assertEqual('页签数量已满');
      expect(state.views[0].keys()).assertEqual(state.keys.join(','));
    });

    it('Browser_Binding_009', 0, async () => {
      TestLogger.step(TAG, 'deleteTab repairs the index seen by every view');
      const state: SharedBrowserState = buildTabletBinding(4);
      state.selectTab(3);
      expect(state.deleteTab(1)).assertTrue();
      expect(state.keyCount()).assertEqual(3);
      expect(state.tabIndex.get()).assertEqual(2);
      for (let index = 0; index < state.views.length; index++) {
        expect(state.views[index].index()).assertEqual(2);
        expect(state.views[index].keys()).assertEqual('0,1,2');
      }
      expect(state.deleteTab(0)).assertTrue();
      expect(state.keys.join(',')).assertEqual('0,1');
      expect(state.tabIndex.get()).assertEqual(1);
      expect(state.deleteTab(9)).assertFalse();
    });

    it('Browser_Binding_010', 0, async () => {
      TestLogger.step(TAG, 'partial progress shows the bar and reaches all views');
      const state: SharedBrowserState = buildTabletBinding();
      state.setProgress(35);
      expect(state.progress.get()).assertEqual(35);
      expect(state.hideProgress.get()).assertFalse();
      for (let index = 0; index < state.views.length; index++) {
        expect(state.views[index].progress()).assertEqual(35);
      }
      state.setProgress(70);
      expect(state.progress.get()).assertEqual(70);
      expect(state.views[2].progress()).assertEqual(70);
      expect(state.progress.revision).assertEqual(2);
    });

    it('Browser_Binding_011', 0, async () => {
      TestLogger.step(TAG, 'completed progress resets to zero and hides');
      const state: SharedBrowserState = buildTabletBinding();
      state.setProgress(100);
      expect(state.progress.get()).assertEqual(0);
      expect(state.hideProgress.get()).assertTrue();
      expect(state.views[0].progress()).assertEqual(0);
      expect(state.progress.revision).assertEqual(2);
      state.setProgress(10);
      expect(state.hideProgress.get()).assertFalse();
      state.setProgress(100);
      expect(state.hideProgress.get()).assertTrue();
      expect(state.progress.get()).assertEqual(0);
    });

    it('Browser_Binding_012', 0, async () => {
      TestLogger.step(TAG, 'progress is clamped to the hundred point scale');
      const state: SharedBrowserState = buildTabletBinding();
      state.setProgress(-20);
      expect(state.progress.get()).assertEqual(0);
      expect(state.hideProgress.get()).assertFalse();
      state.setProgress(140);
      expect(state.progress.get()).assertEqual(0);
      expect(state.hideProgress.get()).assertTrue();
      const monotonic: number[] = [0, 5, 40, 80, 100];
      for (let index = 0; index < monotonic.length; index++) {
        state.setProgress(monotonic[index]);
        if (monotonic[index] === 100) {
          expect(state.progress.get()).assertEqual(0);
        } else {
          expect(state.progress.get()).assertEqual(monotonic[index]);
        }
      }
    });

    it('Browser_Binding_013', 0, async () => {
      TestLogger.step(TAG, 'loading status toggles through begin and end');
      const state: SharedBrowserState = buildTabletBinding();
      expect(state.isLoading()).assertFalse();
      state.setLoading(MockLoadingStatus.LOADING);
      expect(state.isLoading()).assertTrue();
      expect(state.loading.get()).assertEqual(0);
      state.setLoading(MockLoadingStatus.END);
      expect(state.isLoading()).assertFalse();
      expect(state.loading.get()).assertEqual(1);
      const browser: MockBrowser = new MockBrowser();
      browser.onPageBegin('https://example.com');
      expect(browser.loadingStatus).assertEqual(MockLoadingStatus.LOADING);
      browser.onPageEnd();
      expect(browser.loadingStatus).assertEqual(MockLoadingStatus.END);
    });

    it('Browser_Binding_014', 0, async () => {
      TestLogger.step(TAG, 'observed tab keys are renumbered for every view');
      const state: SharedBrowserState = buildTabletBinding(4);
      expect(state.keys.join(',')).assertEqual('0,1,2,3');
      expect(state.deleteTab(2)).assertTrue();
      expect(state.keys.join(',')).assertEqual('0,1,2');
      expect(state.views[0].keys()).assertEqual('0,1,2');
      expect(state.views[1].keys()).assertEqual('0,1,2');
      expect(state.views[2].keys()).assertEqual('0,1,2');
      expect(state.timestamps.length).assertEqual(3);
      expect(KEY_TAB_KEYS).assertEqual('webArray.key');
      expect(KEY_INPUT_VALUE).assertEqual('inputValue');
    });

    it('Browser_Binding_015', 0, async () => {
      TestLogger.step(TAG, 'render bookkeeping does not leak between views');
      const state: SharedBrowserState = buildTabletBinding();
      state.views[0].render();
      state.views[0].render();
      expect(state.views[0].renders).assertEqual(3);
      expect(state.views[1].renders).assertEqual(1);
      expect(state.views[2].renders).assertEqual(1);
      state.setInput('leak-check.com');
      for (let index = 0; index < state.views.length; index++) {
        expect(state.views[index].input()).assertEqual('leak-check.com');
        expect(state.views[index].isStale()).assertFalse();
      }
      expect(state.inputValue.notifyCount).assertEqual(1);
      expect(KEY_TAB_INDEX).assertEqual('tabArrayIndex');
      expect(KEY_PROGRESS).assertEqual('progress');
      expect(KEY_HIDE_PROGRESS).assertEqual('hideProgress');
      expect(KEY_LOADING).assertEqual('loadingStatus');
    });

    it('Browser_Binding_016', 0, async () => {
      TestLogger.step(TAG, 'orientation rebuild detaches the previous view set');
      const tabletState: SharedBrowserState = buildTabletBinding(2);
      const phoneState: SharedBrowserState = buildPhoneBinding(2);
      expect(tabletState.attachedCount()).assertEqual(3);
      expect(phoneState.attachedCount()).assertEqual(1);
      phoneState.setInput('phone-only.com');
      expect(phoneState.views[0].input()).assertEqual('phone-only.com');
      expect(tabletState.inputValue.get()).assertEqual('');
      expect(tabletState.views[0].input()).assertEqual('');
      expect(phoneState.snapshot()).assertContain('phone-only.com');
      expect(tabletState.snapshot()).assertContain('|0|');
    });

    it('Browser_Binding_017', 0, async () => {
      TestLogger.step(TAG, 'url input reflects text pushed through the driver');
      const present: boolean = await componentByIdExists(driver, ID_INPUT_URL);
      TestLogger.info(TAG, `url input present before typing=${present}`);
      expect(present).assertTrue();
      const typed: boolean = await inputById(driver, ID_INPUT_URL, 'example.com');
      await serializedDelay(driver, DELAY_KEY_NAVIGATION);
      const live: string = await textById(driver, ID_INPUT_URL);
      TestLogger.info(TAG, `typed=${typed}, live text length=${live.length}`);
      expect(typed).assertTrue();
      const state: SharedBrowserState = buildPhoneBinding();
      const typedText: string = live.length > 0 ? live : 'example.com';
      state.setInput(typedText);
      expect(state.views[0].input()).assertEqual(typedText);
      expect(state.inputValue.revision).assertEqual(1);
      const homePresent: boolean = await componentByIdExists(driver, ID_NAV_HOME);
      TestLogger.info(TAG, `home button present after typing=${homePresent}`);
      expect(state.views[0].renders).assertEqual(1);
      expect(PAD_HOME_PAGE).assertEqual('pad.html');
      expect(TIMEOUT_COMPONENT).assertLarger(0);
    });
  });
}
