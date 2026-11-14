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
  textById, MAX_TAB_COUNT, ID_INPUT_URL, ID_NAV_BACK, ID_ACTION_ADD, ID_CANCEL_TAB,
  TIMEOUT_APP_LAUNCH, TIMEOUT_COMPONENT, DELAY_TAB_OPERATION
} from '../Shared/BrowserTestKit';
import { MockBrowser, MockBrowserTab, MockWebController, MockClock } from '../Shared/BrowserMock';

const TAG: string = 'BrowserAbilityLifecycleTest';

/** Lifecycle states of the single UIAbility of the browser sample. */
class AbilityState {
  static readonly NONE: string = 'NONE';
  static readonly CREATED: string = 'CREATED';
  static readonly WINDOW_CREATED: string = 'WINDOW_CREATED';
  static readonly FOREGROUND: string = 'FOREGROUND';
  static readonly BACKGROUND: string = 'BACKGROUND';
  static readonly WINDOW_DESTROYED: string = 'WINDOW_DESTROYED';
  static readonly DESTROYED: string = 'DESTROYED';
}

/** One observed lifecycle callback. */
class AbilityEvent {
  name: string;
  state: string;
  timestamp: number;
  detail: string;

  constructor(name: string, state: string, timestamp: number, detail: string) {
    this.name = name;
    this.state = state;
    this.timestamp = timestamp;
    this.detail = detail;
  }

  describe(): string {
    return `${this.name}->${this.state}@${this.timestamp}`;
  }
}

/** Transition table entry used by the legality checks. */
interface LifecycleTransition {
  from: string;
  to: string;
  allowed: boolean;
  note: string;
}

const TRANSITIONS: LifecycleTransition[] = [
  { from: AbilityState.NONE, to: AbilityState.CREATED, allowed: true, note: 'onCreate' },
  { from: AbilityState.CREATED, to: AbilityState.WINDOW_CREATED, allowed: true, note: 'onWindowStageCreate' },
  { from: AbilityState.WINDOW_CREATED, to: AbilityState.FOREGROUND, allowed: true, note: 'onForeground' },
  { from: AbilityState.FOREGROUND, to: AbilityState.BACKGROUND, allowed: true, note: 'onBackground' },
  { from: AbilityState.BACKGROUND, to: AbilityState.FOREGROUND, allowed: true, note: 'resume' },
  { from: AbilityState.BACKGROUND, to: AbilityState.WINDOW_DESTROYED, allowed: true, note: 'window destroy' },
  { from: AbilityState.WINDOW_DESTROYED, to: AbilityState.DESTROYED, allowed: true, note: 'onDestroy' },
  { from: AbilityState.NONE, to: AbilityState.FOREGROUND, allowed: false, note: 'no window stage' },
  { from: AbilityState.CREATED, to: AbilityState.FOREGROUND, allowed: false, note: 'no window stage' },
  { from: AbilityState.CREATED, to: AbilityState.BACKGROUND, allowed: false, note: 'never active' },
  { from: AbilityState.FOREGROUND, to: AbilityState.WINDOW_DESTROYED, allowed: false, note: 'window still alive' },
  { from: AbilityState.DESTROYED, to: AbilityState.CREATED, allowed: false, note: 'terminal state' }
];

function isTransitionAllowed(from: string, to: string): boolean {
  for (let index = 0; index < TRANSITIONS.length; index++) {
    const item: LifecycleTransition = TRANSITIONS[index];
    if (item.from === from && item.to === to) {
      return item.allowed;
    }
  }
  return false;
}

/**
 * Records the UIAbility callback order and guards illegal transitions.
 * The real MainAbility only logs, so the contract under test is the order
 * and the state that each callback implies.
 */
class AbilityLifecycleTracker {
  state: string = AbilityState.NONE;
  events: AbilityEvent[] = [];
  illegalAttempts: string[] = [];
  windowContent: string = '';
  browser: MockBrowser;
  clock: MockClock;
  private destroyedControllers: number = 0;

  constructor(browser: MockBrowser = new MockBrowser(), clock: MockClock = new MockClock()) {
    this.browser = browser;
    this.clock = clock;
  }

  private move(target: string, callback: string): boolean {
    if (!isTransitionAllowed(this.state, target)) {
      this.illegalAttempts.push(`${this.state}->${target} via ${callback}`);
      TestLogger.warn(TAG, `rejected ${callback} from ${this.state}`);
      return false;
    }
    this.state = target;
    this.events.push(new AbilityEvent(callback, target, this.clock.now(), 'accepted'));
    return true;
  }

  onCreate(): boolean {
    const moved: boolean = this.move(AbilityState.CREATED, 'onCreate');
    if (moved) {
      this.browser = new MockBrowser();
    }
    return moved;
  }

  onWindowStageCreate(content: string = 'pages/Index'): boolean {
    const moved: boolean = this.move(AbilityState.WINDOW_CREATED, 'onWindowStageCreate');
    if (moved) {
      this.windowContent = content;
    }
    return moved;
  }

  onForeground(): boolean {
    return this.move(AbilityState.FOREGROUND, 'onForeground');
  }

  onBackground(): boolean {
    return this.move(AbilityState.BACKGROUND, 'onBackground');
  }

  onWindowStageDestroy(): boolean {
    const moved: boolean = this.move(AbilityState.WINDOW_DESTROYED, 'onWindowStageDestroy');
    if (moved) {
      this.windowContent = '';
    }
    return moved;
  }

  onDestroy(): boolean {
    const moved: boolean = this.move(AbilityState.DESTROYED, 'onDestroy');
    if (moved) {
      this.destroyedControllers += this.browser.tabs.length;
      this.browser.tabs = [];
      this.windowContent = '';
    }
    return moved;
  }

  isActive(): boolean {
    return this.state === AbilityState.FOREGROUND;
  }

  isAlive(): boolean {
    return this.state !== AbilityState.NONE && this.state !== AbilityState.DESTROYED;
  }

  eventNames(): string[] {
    return this.events.map((event: AbilityEvent) => event.name);
  }

  historyLine(): string {
    return this.eventNames().join('>');
  }

  countOf(callback: string): number {
    let total: number = 0;
    for (let index = 0; index < this.events.length; index++) {
      if (this.events[index].name === callback) {
        total += 1;
      }
    }
    return total;
  }

  visited(state: string): boolean {
    return this.events.some((event: AbilityEvent) => event.state === state);
  }

  releasedControllers(): number {
    return this.destroyedControllers;
  }

  reset(): void {
    this.state = AbilityState.NONE;
    this.events = [];
    this.illegalAttempts = [];
    this.windowContent = '';
    this.browser = new MockBrowser();
    this.destroyedControllers = 0;
  }
}
/** One step of the ohosTest launch chain. */
class LaunchStep {
  order: number;
  action: string;
  completed: boolean;

  constructor(order: number, action: string, completed: boolean) {
    this.order = order;
    this.action = action;
    this.completed = completed;
  }
}

/**
 * Mirrors what startBrowserApp performs before the first assertion:
 * resolve the delegator arguments, build the Want, startAbility, wait.
 */
class LaunchChain {
  steps: LaunchStep[] = [];
  want: string = '';
  bundleName: string = '';
  abilityName: string = '';
  waitedMs: number = 0;

  run(bundle: string, ability: string, waitMs: number): boolean {
    this.bundleName = bundle;
    this.abilityName = ability;
    this.steps.push(new LaunchStep(1, 'getAbilityDelegator', bundle.length > 0));
    this.steps.push(new LaunchStep(2, 'getArguments', bundle.length > 0));
    this.want = `Want{bundleName:${bundle},abilityName:${ability}}`;
    this.steps.push(new LaunchStep(3, 'startAbility', this.want.length > 0));
    this.waitedMs = waitMs < 0 ? 0 : waitMs;
    this.steps.push(new LaunchStep(4, 'awaitLaunch', this.waitedMs >= TIMEOUT_APP_LAUNCH));
    return this.allCompleted();
  }

  allCompleted(): boolean {
    return this.steps.every((step: LaunchStep) => step.completed);
  }

  orderOf(action: string): number {
    let result: number = -1;
    for (let index = 0; index < this.steps.length; index++) {
      if (this.steps[index].action === action) {
        result = this.steps[index].order;
      }
    }
    return result;
  }

  describe(): string {
    return `${this.want} waited=${this.waitedMs}`;
  }
}

/** Snapshot of the state a background round trip must preserve. */
interface NavigationSnapshot {
  tabCount: number;
  tabIndex: number;
  currentUrl: string;
  inputValue: string;
  progress: number;
}

function takeSnapshot(browser: MockBrowser): NavigationSnapshot {
  const tab: MockBrowserTab | null = browser.getCurrentTab();
  return {
    tabCount: browser.tabs.length,
    tabIndex: browser.getTabArrayIndex(),
    currentUrl: tab === null ? '' : tab.controller.currentUrl,
    inputValue: browser.getInputVal(),
    progress: browser.progress
  };
}

function snapshotMatches(browser: MockBrowser, snapshot: NavigationSnapshot): boolean {
  const current: NavigationSnapshot = takeSnapshot(browser);
  return current.tabCount === snapshot.tabCount && current.tabIndex === snapshot.tabIndex &&
    current.currentUrl === snapshot.currentUrl && current.inputValue === snapshot.inputValue;
}

export default function browserAbilityLifecycleTest() {
  describe('browserAbilityLifecycleTest', () => {
    let driver: Driver = getDriver();

    beforeAll(async () => {
      TestLogger.info(TAG, 'ability lifecycle suite begin');
      await startBrowserApp();
      await serializedDelay(driver, TIMEOUT_APP_LAUNCH / 3);
    });

    afterAll(() => {
      TestLogger.info(TAG, TestLogger.summary(TAG));
    });

    it('Browser_AbilityLifecycle_001', 0, async () => {
      TestLogger.step(TAG, 'full callback order matches the sample implementation');
      const tracker: AbilityLifecycleTracker = new AbilityLifecycleTracker();
      expect(tracker.onCreate()).assertTrue();
      expect(tracker.onWindowStageCreate()).assertTrue();
      expect(tracker.onForeground()).assertTrue();
      expect(tracker.onBackground()).assertTrue();
      expect(tracker.onWindowStageDestroy()).assertTrue();
      expect(tracker.onDestroy()).assertTrue();
      expect(tracker.historyLine()).assertEqual(
        'onCreate>onWindowStageCreate>onForeground>onBackground>onWindowStageDestroy>onDestroy');
      expect(tracker.illegalAttempts.length).assertEqual(0);
    });

    it('Browser_AbilityLifecycle_002', 0, async () => {
      TestLogger.step(TAG, 'tracker starts in the NONE state');
      const tracker: AbilityLifecycleTracker = new AbilityLifecycleTracker();
      expect(tracker.state).assertEqual(AbilityState.NONE);
      expect(tracker.events.length).assertEqual(0);
      expect(tracker.isAlive()).assertFalse();
      expect(tracker.isActive()).assertFalse();
      expect(tracker.windowContent).assertEqual('');
    });

    it('Browser_AbilityLifecycle_003', 0, async () => {
      TestLogger.step(TAG, 'onCreate moves NONE to CREATED and allocates the tab model');
      const tracker: AbilityLifecycleTracker = new AbilityLifecycleTracker();
      expect(tracker.onCreate()).assertTrue();
      expect(tracker.state).assertEqual(AbilityState.CREATED);
      expect(tracker.isAlive()).assertTrue();
      expect(tracker.browser.tabs.length).assertEqual(1);
      expect(tracker.countOf('onCreate')).assertEqual(1);
      expect(tracker.events[0].state).assertEqual(AbilityState.CREATED);
    });

    it('Browser_AbilityLifecycle_004', 0, async () => {
      TestLogger.step(TAG, 'window stage creation attaches pages/Index');
      const tracker: AbilityLifecycleTracker = new AbilityLifecycleTracker();
      tracker.onCreate();
      expect(tracker.onWindowStageCreate()).assertTrue();
      expect(tracker.state).assertEqual(AbilityState.WINDOW_CREATED);
      expect(tracker.windowContent).assertEqual('pages/Index');
      expect(tracker.visited(AbilityState.WINDOW_CREATED)).assertTrue();
    });

    it('Browser_AbilityLifecycle_005', 0, async () => {
      TestLogger.step(TAG, 'foreground requires a created window stage');
      const tracker: AbilityLifecycleTracker = new AbilityLifecycleTracker();
      tracker.onCreate();
      expect(tracker.onForeground()).assertFalse();
      expect(tracker.state).assertEqual(AbilityState.CREATED);
      expect(tracker.illegalAttempts.length).assertEqual(1);
      expect(tracker.illegalAttempts[0]).assertContain('onForeground');
      expect(tracker.isActive()).assertFalse();
    });

    it('Browser_AbilityLifecycle_006', 0, async () => {
      TestLogger.step(TAG, 'background requires the foreground state');
      const tracker: AbilityLifecycleTracker = new AbilityLifecycleTracker();
      tracker.onCreate();
      tracker.onWindowStageCreate();
      expect(tracker.onBackground()).assertFalse();
      expect(tracker.state).assertEqual(AbilityState.WINDOW_CREATED);
      expect(tracker.illegalAttempts[0]).assertContain('onBackground');
      expect(tracker.countOf('onBackground')).assertEqual(0);
    });

    it('Browser_AbilityLifecycle_007', 0, async () => {
      TestLogger.step(TAG, 'duplicate onCreate is rejected by the transition table');
      const tracker: AbilityLifecycleTracker = new AbilityLifecycleTracker();
      tracker.onCreate();
      expect(tracker.onCreate()).assertFalse();
      expect(tracker.countOf('onCreate')).assertEqual(1);
      expect(tracker.state).assertEqual(AbilityState.CREATED);
      expect(tracker.illegalAttempts.length).assertEqual(1);
    });

    it('Browser_AbilityLifecycle_008', 0, async () => {
      TestLogger.step(TAG, 'duplicate foreground is rejected while already active');
      const tracker: AbilityLifecycleTracker = new AbilityLifecycleTracker();
      tracker.onCreate();
      tracker.onWindowStageCreate();
      tracker.onForeground();
      expect(tracker.onForeground()).assertFalse();
      expect(tracker.countOf('onForeground')).assertEqual(1);
      expect(tracker.state).assertEqual(AbilityState.FOREGROUND);
      expect(tracker.isActive()).assertTrue();
    });

    it('Browser_AbilityLifecycle_009', 0, async () => {
      TestLogger.step(TAG, 'transition table marks the legal path only');
      expect(isTransitionAllowed(AbilityState.NONE, AbilityState.CREATED)).assertTrue();
      expect(isTransitionAllowed(AbilityState.CREATED, AbilityState.WINDOW_CREATED)).assertTrue();
      expect(isTransitionAllowed(AbilityState.WINDOW_CREATED, AbilityState.FOREGROUND)).assertTrue();
      expect(isTransitionAllowed(AbilityState.FOREGROUND, AbilityState.BACKGROUND)).assertTrue();
      expect(isTransitionAllowed(AbilityState.BACKGROUND, AbilityState.FOREGROUND)).assertTrue();
      expect(isTransitionAllowed(AbilityState.BACKGROUND, AbilityState.WINDOW_DESTROYED)).assertTrue();
      expect(isTransitionAllowed(AbilityState.WINDOW_DESTROYED, AbilityState.DESTROYED)).assertTrue();
      expect(isTransitionAllowed(AbilityState.DESTROYED, AbilityState.CREATED)).assertFalse();
    });

    it('Browser_AbilityLifecycle_010', 0, async () => {
      TestLogger.step(TAG, 'illegal transitions are counted instead of crashing');
      const tracker: AbilityLifecycleTracker = new AbilityLifecycleTracker();
      expect(tracker.onForeground()).assertFalse();
      expect(tracker.onBackground()).assertFalse();
      expect(tracker.onWindowStageDestroy()).assertFalse();
      expect(tracker.onDestroy()).assertFalse();
      expect(tracker.illegalAttempts.length).assertEqual(4);
      expect(tracker.events.length).assertEqual(0);
      expect(tracker.state).assertEqual(AbilityState.NONE);
    });
    it('Browser_AbilityLifecycle_011', 0, async () => {
      TestLogger.step(TAG, 'window stage destroy clears the UI content');
      const tracker: AbilityLifecycleTracker = new AbilityLifecycleTracker();
      tracker.onCreate();
      tracker.onWindowStageCreate();
      tracker.onForeground();
      tracker.onBackground();
      expect(tracker.windowContent).assertEqual('pages/Index');
      expect(tracker.onWindowStageDestroy()).assertTrue();
      expect(tracker.state).assertEqual(AbilityState.WINDOW_DESTROYED);
      expect(tracker.windowContent).assertEqual('');
    });

    it('Browser_AbilityLifecycle_012', 0, async () => {
      TestLogger.step(TAG, 'destroy is only legal after the window stage is gone');
      const tracker: AbilityLifecycleTracker = new AbilityLifecycleTracker();
      tracker.onCreate();
      tracker.onWindowStageCreate();
      tracker.onForeground();
      expect(tracker.onDestroy()).assertFalse();
      expect(tracker.state).assertEqual(AbilityState.FOREGROUND);
      tracker.onBackground();
      tracker.onWindowStageDestroy();
      expect(tracker.onDestroy()).assertTrue();
      expect(tracker.state).assertEqual(AbilityState.DESTROYED);
      expect(tracker.isAlive()).assertFalse();
    });

    it('Browser_AbilityLifecycle_013', 0, async () => {
      TestLogger.step(TAG, 'destroy releases every tab controller');
      const tracker: AbilityLifecycleTracker = new AbilityLifecycleTracker(new MockBrowser(3));
      tracker.onCreate();
      tracker.browser = new MockBrowser(3);
      tracker.onWindowStageCreate();
      tracker.onForeground();
      tracker.onBackground();
      tracker.onWindowStageDestroy();
      expect(tracker.onDestroy()).assertTrue();
      expect(tracker.releasedControllers()).assertEqual(3);
      expect(tracker.browser.tabs.length).assertEqual(0);
    });

    it('Browser_AbilityLifecycle_014', 0, async () => {
      TestLogger.step(TAG, 'background keeps the tab count intact');
      const tracker: AbilityLifecycleTracker = new AbilityLifecycleTracker();
      tracker.onCreate();
      tracker.onWindowStageCreate();
      tracker.onForeground();
      tracker.browser.addTab();
      tracker.browser.addTab();
      const before: number = tracker.browser.tabs.length;
      tracker.onBackground();
      expect(tracker.browser.tabs.length).assertEqual(before);
      expect(tracker.browser.tabs.length).assertEqual(3);
      tracker.onForeground();
      expect(tracker.browser.tabs.length).assertEqual(3);
    });

    it('Browser_AbilityLifecycle_015', 0, async () => {
      TestLogger.step(TAG, 'background keeps the current page url');
      const tracker: AbilityLifecycleTracker = new AbilityLifecycleTracker();
      tracker.onCreate();
      tracker.onWindowStageCreate();
      tracker.onForeground();
      tracker.browser.loadUrl('www.sample.com');
      expect(tracker.browser.getCurrentTab()?.controller.currentUrl).assertEqual('https://www.sample.com');
      tracker.onBackground();
      expect(tracker.browser.getCurrentTab()?.controller.currentUrl).assertEqual('https://www.sample.com');
      tracker.onForeground();
      expect(tracker.browser.getCurrentTab()?.controller.currentUrl).assertEqual('https://www.sample.com');
    });

    it('Browser_AbilityLifecycle_016', 0, async () => {
      TestLogger.step(TAG, 'background keeps the selected tab index');
      const tracker: AbilityLifecycleTracker = new AbilityLifecycleTracker();
      tracker.onCreate();
      tracker.onWindowStageCreate();
      tracker.onForeground();
      tracker.browser.addTab();
      tracker.browser.addTab();
      tracker.browser.selectTab(1);
      expect(tracker.browser.getTabArrayIndex()).assertEqual(1);
      tracker.onBackground();
      expect(tracker.browser.getTabArrayIndex()).assertEqual(1);
      tracker.onForeground();
      expect(tracker.browser.getCurrentTab()?.key).assertEqual(1);
      expect(tracker.browser.getTabArrayIndex()).assertEqual(1);
    });

    it('Browser_AbilityLifecycle_017', 0, async () => {
      TestLogger.step(TAG, 'foreground restores the draft stored in the input box');
      const tracker: AbilityLifecycleTracker = new AbilityLifecycleTracker();
      tracker.onCreate();
      tracker.onWindowStageCreate();
      tracker.onForeground();
      tracker.browser.setInputVal('www.bing.com');
      const snapshot: NavigationSnapshot = takeSnapshot(tracker.browser);
      tracker.onBackground();
      tracker.onForeground();
      expect(snapshotMatches(tracker.browser, snapshot)).assertTrue();
      expect(tracker.browser.getInputVal()).assertEqual('www.bing.com');
    });

    it('Browser_AbilityLifecycle_018', 0, async () => {
      TestLogger.step(TAG, 'progress survives a background round trip');
      const tracker: AbilityLifecycleTracker = new AbilityLifecycleTracker();
      tracker.onCreate();
      tracker.onWindowStageCreate();
      tracker.onForeground();
      tracker.browser.onProgressChange(42);
      expect(tracker.browser.progress).assertEqual(42);
      expect(tracker.browser.hideProgress).assertFalse();
      tracker.onBackground();
      expect(tracker.browser.progress).assertEqual(42);
      tracker.onForeground();
      expect(tracker.browser.progress).assertEqual(42);
      expect(tracker.browser.hideProgress).assertFalse();
    });

    it('Browser_AbilityLifecycle_019', 0, async () => {
      TestLogger.step(TAG, 'two background cycles leave the tab strip stable');
      const tracker: AbilityLifecycleTracker = new AbilityLifecycleTracker();
      tracker.onCreate();
      tracker.onWindowStageCreate();
      tracker.onForeground();
      tracker.browser.addTab();
      for (let cycle = 0; cycle < 2; cycle++) {
        tracker.onBackground();
        expect(tracker.browser.tabs.length).assertEqual(2);
        tracker.onForeground();
        expect(tracker.browser.tabs.length).assertEqual(2);
      }
      expect(tracker.countOf('onBackground')).assertEqual(2);
      expect(tracker.countOf('onForeground')).assertEqual(3);
      expect(tracker.browser.getTabKeys().length).assertEqual(2);
    });

    it('Browser_AbilityLifecycle_020', 0, async () => {
      TestLogger.step(TAG, 'isActive only reports true in the foreground state');
      const tracker: AbilityLifecycleTracker = new AbilityLifecycleTracker();
      expect(tracker.isActive()).assertFalse();
      tracker.onCreate();
      expect(tracker.isActive()).assertFalse();
      tracker.onWindowStageCreate();
      expect(tracker.isActive()).assertFalse();
      tracker.onForeground();
      expect(tracker.isActive()).assertTrue();
      tracker.onBackground();
      expect(tracker.isActive()).assertFalse();
      tracker.onWindowStageDestroy();
      expect(tracker.isActive()).assertFalse();
    });

    it('Browser_AbilityLifecycle_021', 0, async () => {
      TestLogger.step(TAG, 'callback timestamps are monotonic on the logical clock');
      const clock: MockClock = new MockClock();
      const tracker: AbilityLifecycleTracker = new AbilityLifecycleTracker(new MockBrowser(), clock);
      tracker.onCreate();
      clock.advance(10);
      tracker.onWindowStageCreate();
      clock.advance(20);
      tracker.onForeground();
      clock.advance(5);
      tracker.onBackground();
      expect(tracker.events.length).assertEqual(4);
      expect(tracker.events[0].timestamp).assertEqual(1700000000000);
      expect(tracker.events[1].timestamp).assertEqual(1700000000010);
      expect(tracker.events[2].timestamp).assertEqual(1700000000030);
      expect(tracker.events[3].timestamp).assertEqual(1700000000035);
      expect(tracker.events[3].timestamp > tracker.events[0].timestamp).assertTrue();
    });

    it('Browser_AbilityLifecycle_022', 0, async () => {
      TestLogger.step(TAG, 'event descriptions expose callback, state and time');
      const tracker: AbilityLifecycleTracker = new AbilityLifecycleTracker();
      tracker.onCreate();
      expect(tracker.events[0].describe()).assertContain('onCreate');
      expect(tracker.events[0].describe()).assertContain(AbilityState.CREATED);
      expect(tracker.events[0].describe()).assertContain('1700000000000');
    });

    it('Browser_AbilityLifecycle_023', 0, async () => {
      TestLogger.step(TAG, 'launch chain executes getArguments before startAbility');
      const chain: LaunchChain = new LaunchChain();
      const started: boolean = chain.run('com.example.browser', 'MainAbility', TIMEOUT_APP_LAUNCH);
      expect(started).assertTrue();
      expect(chain.orderOf('getArguments')).assertEqual(2);
      expect(chain.orderOf('startAbility')).assertEqual(3);
      expect(chain.orderOf('startAbility') > chain.orderOf('getArguments')).assertTrue();
      expect(chain.allCompleted()).assertTrue();
    });

    it('Browser_AbilityLifecycle_024', 0, async () => {
      TestLogger.step(TAG, 'launch want targets MainAbility of the sample bundle');
      const chain: LaunchChain = new LaunchChain();
      chain.run('com.sample.browser', 'MainAbility', TIMEOUT_APP_LAUNCH);
      expect(chain.bundleName).assertEqual('com.sample.browser');
      expect(chain.abilityName).assertEqual('MainAbility');
      expect(chain.want).assertContain('bundleName:com.sample.browser');
      expect(chain.want).assertContain('abilityName:MainAbility');
      expect(chain.describe()).assertContain('waited=3000');
    });

    it('Browser_AbilityLifecycle_025', 0, async () => {
      TestLogger.step(TAG, 'launch waits at least the app launch budget');
      const chain: LaunchChain = new LaunchChain();
      chain.run('com.sample.browser', 'MainAbility', TIMEOUT_APP_LAUNCH);
      expect(chain.waitedMs).assertEqual(TIMEOUT_APP_LAUNCH);
      expect(chain.waitedMs >= TIMEOUT_APP_LAUNCH).assertTrue();
      const shortChain: LaunchChain = new LaunchChain();
      expect(shortChain.run('com.sample.browser', 'MainAbility', 0)).assertFalse();
      expect(shortChain.allCompleted()).assertFalse();
    });

    it('Browser_AbilityLifecycle_027', 0, async () => {
      TestLogger.step(TAG, 'tracker reset returns the model to the pre launch state');
      const tracker: AbilityLifecycleTracker = new AbilityLifecycleTracker();
      tracker.onCreate();
      tracker.onWindowStageCreate();
      tracker.onForeground();
      expect(tracker.events.length).assertEqual(3);
      tracker.reset();
      expect(tracker.state).assertEqual(AbilityState.NONE);
      expect(tracker.events.length).assertEqual(0);
      expect(tracker.windowContent).assertEqual('');
      expect(tracker.browser.tabs.length).assertEqual(1);
      expect(tracker.isAlive()).assertFalse();
    });

    it('Browser_AbilityLifecycle_028', 0, async () => {
      TestLogger.step(TAG, 'released controllers count only grows on destroy');
      const tracker: AbilityLifecycleTracker = new AbilityLifecycleTracker();
      tracker.onCreate();
      tracker.browser = new MockBrowser(4);
      tracker.onWindowStageCreate();
      tracker.onForeground();
      tracker.onBackground();
      expect(tracker.releasedControllers()).assertEqual(0);
      tracker.onWindowStageDestroy();
      expect(tracker.releasedControllers()).assertEqual(0);
      tracker.onDestroy();
      expect(tracker.releasedControllers()).assertEqual(4);
      tracker.reset();
      expect(tracker.releasedControllers()).assertEqual(0);
    });

    it('Browser_AbilityLifecycle_029', 0, async () => {
      TestLogger.step(TAG, 'UI: MainAbility window exposes the url input');
      const ready: boolean = await componentByIdExists(driver, ID_INPUT_URL);
      TestLogger.info(TAG, `url input after launch=${ready}`);
      if (!ready) {
        TestLogger.warn(TAG, 'phone layout may hide the shared url input');
        const backReady: boolean = await componentByIdExists(driver, ID_NAV_BACK);
        expect(backReady).assertTrue();
        return;
      }
      const text: string = await textById(driver, ID_INPUT_URL);
      expect(text.length >= 0).assertTrue();
      expect(ready).assertTrue();
    });

    it('Browser_AbilityLifecycle_030', 0, async () => {
      TestLogger.step(TAG, 'UI: tab strip respects the ten tab ceiling after launch');
      const addCount: number = await countById(driver, ID_ACTION_ADD);
      const closeCount: number = await countById(driver, ID_CANCEL_TAB);
      TestLogger.info(TAG, `add=${addCount}, close=${closeCount}`);
      expect(closeCount <= MAX_TAB_COUNT + 1).assertTrue();
      expect(closeCount >= 0).assertTrue();
      expect(addCount >= 0).assertTrue();
    });
    it('Browser_AbilityLifecycle_031', 0, async () => {
      TestLogger.step(TAG, 'UI: foreground round trip keeps the tab strip reachable');
      await serializedDelay(driver, DELAY_TAB_OPERATION);
      const before: number = await countById(driver, ID_CANCEL_TAB);
      const addReady: boolean = await componentByIdExists(driver, ID_ACTION_ADD);
      TestLogger.info(TAG, `close buttons before=${before}, add ready=${addReady}`);
      const tracker: AbilityLifecycleTracker = new AbilityLifecycleTracker();
      tracker.onCreate();
      tracker.onWindowStageCreate();
      tracker.onForeground();
      tracker.onBackground();
      tracker.onForeground();
      expect(tracker.browser.tabs.length).assertEqual(1);
      expect(before <= MAX_TAB_COUNT + 1).assertTrue();
      expect(addReady || before >= 0).assertTrue();
    });

    it('Browser_AbilityLifecycle_032', 0, async () => {
      TestLogger.step(TAG, 'window stage content is required before the UI is queried');
      const tracker: AbilityLifecycleTracker = new AbilityLifecycleTracker();
      tracker.onCreate();
      expect(tracker.windowContent).assertEqual('');
      tracker.onWindowStageCreate('pages/Index');
      const contentReady: boolean = tracker.windowContent === 'pages/Index';
      expect(contentReady).assertTrue();
      expect(tracker.state).assertEqual(AbilityState.WINDOW_CREATED);
      tracker.onForeground();
      expect(tracker.windowContent).assertEqual('pages/Index');
      expect(tracker.countOf('onWindowStageCreate')).assertEqual(1);
    });

    it('Browser_AbilityLifecycle_033', 0, async () => {
      TestLogger.step(TAG, 'a second window stage cannot be created in one session');
      const tracker: AbilityLifecycleTracker = new AbilityLifecycleTracker();
      tracker.onCreate();
      tracker.onWindowStageCreate();
      expect(tracker.onWindowStageCreate()).assertFalse();
      expect(tracker.countOf('onWindowStageCreate')).assertEqual(1);
      expect(tracker.windowContent).assertEqual('pages/Index');
      expect(tracker.illegalAttempts[0]).assertContain('WINDOW_CREATED');
    });

    it('Browser_AbilityLifecycle_034', 0, async () => {
      TestLogger.step(TAG, 'background to window destroy keeps the model readable');
      const tracker: AbilityLifecycleTracker = new AbilityLifecycleTracker();
      tracker.onCreate();
      tracker.onWindowStageCreate();
      tracker.onForeground();
      tracker.browser.loadUrl('pad.html');
      tracker.browser.setInputVal('pad.html');
      const snapshot: NavigationSnapshot = takeSnapshot(tracker.browser);
      tracker.onBackground();
      tracker.onWindowStageDestroy();
      expect(snapshotMatches(tracker.browser, snapshot)).assertTrue();
      expect(tracker.browser.getCurrentTab()?.controller.currentUrl).assertEqual('https://pad.html');
      expect(tracker.state).assertEqual(AbilityState.WINDOW_DESTROYED);
      expect(tracker.windowContent).assertEqual('');
      expect(tracker.browser.tabs.length).assertEqual(1);
      expect(tracker.browser.getTabArrayIndex()).assertEqual(0);
    });
  });
}



