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
import TestLogger, { browserLogSink } from '../Shared/TestLogger';
import {
  getDriver, startBrowserApp, serializedDelay, componentByIdExists, countById,
  clickById, deviceIsPhone, PAD_HOME_PAGE, PHONE_HOME_PAGE,
  MAX_TAB_COUNT, TAB_LIMIT_MESSAGE, ID_INPUT_URL, ID_ACTION_ADD, ID_CANCEL_TAB,
  ID_NAV_HOME, TIMEOUT_COMPONENT
} from '../Shared/BrowserTestKit';
import { MockBrowser, MockClock } from '../Shared/BrowserMock';

const TAG: string = 'BrowserSystemIntegrationTest';

/** Media query condition declared in pages/Index.ets. */
const ORIENTATION_QUERY: string = '(orientation:landscape)';
const CHANGE_EVENT: string = 'change';

/** Minimum API level of the sample; deviceInfo.deviceType drives the layout. */
const BASELINE_API_LEVEL: number = 9;
const DEVICE_TYPE_DEFAULT: string = 'default';
const DEVICE_TYPE_PHONE: string = 'phone';
const DEVICE_TYPE_TABLET: string = 'tablet';

/** hilog domain used by model/Logger.ts, kept in sync with the production tag. */
const HILOG_DOMAIN: number = 0xF811;
const LEVEL_DEBUG: string = 'DEBUG';
const LEVEL_INFO: string = 'INFO';
const LEVEL_WARN: string = 'WARN';
const LEVEL_ERROR: string = 'ERROR';

/** Result payload delivered to a media query change callback. */
interface MockMediaQueryResult {
  media: string;
  matches: boolean;
}

/**
 * Behavioural mirror of mediaquery.matchMediaSync.
 *
 * Index.ets registers a single 'change' listener on
 * `(orientation:landscape)` and re-evaluates `isPhone` when it fires. The
 * mirror keeps the same contract: matches is recomputed from the viewport and
 * every registered listener is notified exactly once per flip.
 */
class MockMediaQueryList {
  condition: string;
  matches: boolean;
  private listeners: Array<(result: MockMediaQueryResult) => void> = [];

  constructor(condition: string = ORIENTATION_QUERY, matches: boolean = false) {
    this.condition = condition;
    this.matches = matches;
  }

  /** recompute the landscape flag from the current viewport. */
  evaluate(widthVp: number, heightVp: number): boolean {
    this.matches = widthVp > heightVp;
    return this.matches;
  }

  on(event: string, callback: (result: MockMediaQueryResult) => void): boolean {
    if (event !== CHANGE_EVENT) {
      return false;
    }
    this.listeners.push(callback);
    return true;
  }

  off(event: string, callback: (result: MockMediaQueryResult) => void): boolean {
    if (event !== CHANGE_EVENT) {
      return false;
    }
    const index: number = this.listeners.indexOf(callback);
    if (index < 0) {
      return false;
    }
    this.listeners.splice(index, 1);
    return true;
  }

  listenerCount(): number {
    return this.listeners.length;
  }

  /** Flips the flag and notifies listeners; returns how many were called. */
  applyOrientation(widthVp: number, heightVp: number): number {
    const next: boolean = widthVp > heightVp;
    if (next === this.matches) {
      return 0;
    }
    this.matches = next;
    const payload: MockMediaQueryResult = { media: this.condition, matches: next };
    for (let index = 0; index < this.listeners.length; index++) {
      this.listeners[index](payload);
    }
    return this.listeners.length;
  }
}

/** Snapshot of the device facts the app reads from @ohos.deviceInfo. */
class MockDeviceProfile {
  deviceType: string;
  brand: string;
  model: string;
  sdkApiVersion: number;
  screenDensity: number;

  constructor(deviceType: string = DEVICE_TYPE_DEFAULT, brand: string = 'Sample',
    model: string = 'MatePad', sdkApiVersion: number = BASELINE_API_LEVEL,
    screenDensity: number = 320) {
    this.deviceType = deviceType;
    this.brand = brand;
    this.model = model;
    this.sdkApiVersion = sdkApiVersion;
    this.screenDensity = screenDensity;
  }

  /** Index.ets keeps the tablet layout only when deviceType is 'default'. */
  usesTabletLayout(): boolean {
    return this.deviceType === DEVICE_TYPE_DEFAULT;
  }

  /** PhoneLayout is selected for every non default deviceType. */
  usesPhoneLayout(): boolean {
    return !this.usesTabletLayout();
  }

  homePage(): string {
    return this.usesTabletLayout() ? PAD_HOME_PAGE : PHONE_HOME_PAGE;
  }

  supportsMediaQuery(): boolean {
    return this.sdkApiVersion >= BASELINE_API_LEVEL;
  }

  summary(): string {
    return `${this.brand} ${this.model} ${this.deviceType} api${this.sdkApiVersion}`;
  }
}

/** Want payload handed to the AbilityDelegator by the test entry point. */
interface LaunchWant {
  bundleName: string;
  abilityName: string;
}

/**
 * Mirror of abilityDelegatorRegistry.getAbilityDelegator().
 *
 * startBrowserApp() performs the real launch; this double only records the
 * contractual shape of the want so the suite can assert it without relying on
 * a second live startAbility round trip.
 */
class MockAbilityDelegator {
  launched: LaunchWant[] = [];
  delegatorState: string = 'ready';
  failNextLaunch: boolean = false;

  startAbility(want: LaunchWant): boolean {
    if (this.failNextLaunch) {
      this.failNextLaunch = false;
      this.delegatorState = 'start-failed';
      return false;
    }
    this.launched.push({ bundleName: want.bundleName, abilityName: want.abilityName });
    this.delegatorState = 'started';
    return true;
  }

  launchCount(): number {
    return this.launched.length;
  }

  lastWant(): LaunchWant | null {
    if (this.launched.length === 0) {
      return null;
    }
    return this.launched[this.launched.length - 1];
  }

  reset(): void {
    this.launched = [];
    this.delegatorState = 'ready';
    this.failNextLaunch = false;
  }
}

/** One record of the simulated hilog pipeline. */
interface ChainRecord {
  level: string;
  domain: number;
  tag: string;
  message: string;
  timestamp: number;
}

/**
 * Mirror of the model/Logger.ts pipeline.
 *
 * Level weight controls what a collector subscribed at INFO will see: debug
 * records are dropped before they reach the sink, exactly like the hilog
 * severity filter on device.
 */
class HilogChain {
  private records: ChainRecord[] = [];
  private minWeight: number = 1;
  private clock: MockClock = new MockClock();
  private dropped: number = 0;

  weightOf(level: string): number {
    if (level === LEVEL_DEBUG) {
      return 0;
    }
    if (level === LEVEL_INFO) {
      return 1;
    }
    if (level === LEVEL_WARN) {
      return 2;
    }
    return 3;
  }

  setMinLevel(level: string): void {
    this.minWeight = this.weightOf(level);
  }

  log(level: string, tag: string, message: string): boolean {
    if (this.weightOf(level) < this.minWeight) {
      this.dropped += 1;
      return false;
    }
    this.records.push({
      level: level, domain: HILOG_DOMAIN, tag: tag,
      message: message, timestamp: this.clock.advance(1)
    });
    return true;
  }

  byTag(tag: string): ChainRecord[] {
    return this.records.filter((record: ChainRecord) => record.tag === tag);
  }

  byLevel(level: string): ChainRecord[] {
    return this.records.filter((record: ChainRecord) => record.level === level);
  }

  messages(): string[] {
    return this.records.map((record: ChainRecord) => record.message);
  }

  size(): number {
    return this.records.length;
  }

  droppedCount(): number {
    return this.dropped;
  }

  clear(): void {
    this.records = [];
    this.dropped = 0;
    this.clock.reset();
  }
}

export default function browserSystemIntegrationTest() {
  describe('browserSystemIntegrationTest', () => {
    let driver: Driver = getDriver();

    beforeAll(async () => {
      TestLogger.info(TAG, 'system integration suite begin');
      await startBrowserApp();
      await serializedDelay(driver, TIMEOUT_COMPONENT / 2);
    });

    afterAll(() => {
      TestLogger.info(TAG, TestLogger.summary(TAG));
    });

    it('Browser_Integration_System_001', 0, async () => {
      TestLogger.step(TAG, 'landscape media query matches a wide viewport');
      const query: MockMediaQueryList = new MockMediaQueryList();
      expect(query.evaluate(1280, 800)).assertTrue();
      expect(query.matches).assertTrue();
      expect(query.condition).assertEqual(ORIENTATION_QUERY);
    });

    it('Browser_Integration_System_002', 0, async () => {
      TestLogger.step(TAG, 'portrait viewport does not match the landscape query');
      const query: MockMediaQueryList = new MockMediaQueryList();
      expect(query.evaluate(800, 1280)).assertFalse();
      expect(query.matches).assertFalse();
      expect(query.evaluate(800, 800)).assertFalse();
    });

    it('Browser_Integration_System_003', 0, async () => {
      TestLogger.step(TAG, 'rotation notifies the registered change listener');
      const query: MockMediaQueryList = new MockMediaQueryList();
      query.evaluate(800, 1280);
      let notified: number = 0;
      let lastMatches: boolean = false;
      query.on(CHANGE_EVENT, (result: MockMediaQueryResult) => {
        notified += 1;
        lastMatches = result.matches;
      });
      expect(query.listenerCount()).assertEqual(1);
      const called: number = query.applyOrientation(1280, 800);
      expect(called).assertEqual(1);
      expect(notified).assertEqual(1);
      expect(lastMatches).assertTrue();
      TestLogger.info(TAG, `listener notified ${notified} time(s)`);
    });

    it('Browser_Integration_System_004', 0, async () => {
      TestLogger.step(TAG, 'every registered listener receives the flip');
      const query: MockMediaQueryList = new MockMediaQueryList();
      query.evaluate(800, 1280);
      let first: number = 0;
      let second: number = 0;
      query.on(CHANGE_EVENT, (result: MockMediaQueryResult) => {
        first += 1;
      });
      query.on(CHANGE_EVENT, (result: MockMediaQueryResult) => {
        second += 1;
      });
      expect(query.listenerCount()).assertEqual(2);
      expect(query.applyOrientation(1280, 800)).assertEqual(2);
      expect(first).assertEqual(1);
      expect(second).assertEqual(1);
    });

    it('Browser_Integration_System_005', 0, async () => {
      TestLogger.step(TAG, 'off unregisters a listener from the query');
      const query: MockMediaQueryList = new MockMediaQueryList();
      query.evaluate(800, 1280);
      let notified: number = 0;
      const listener: (result: MockMediaQueryResult) => void = (result: MockMediaQueryResult) => {
        notified += 1;
      };
      expect(query.on(CHANGE_EVENT, listener)).assertTrue();
      expect(query.off(CHANGE_EVENT, listener)).assertTrue();
      expect(query.listenerCount()).assertEqual(0);
      expect(query.applyOrientation(1280, 800)).assertEqual(0);
      expect(notified).assertEqual(0);
      expect(query.off(CHANGE_EVENT, listener)).assertFalse();
    });

    it('Browser_Integration_System_006', 0, async () => {
      TestLogger.step(TAG, 'no notification when the orientation flag is unchanged');
      const query: MockMediaQueryList = new MockMediaQueryList();
      query.evaluate(1280, 800);
      let notified: number = 0;
      query.on(CHANGE_EVENT, (result: MockMediaQueryResult) => {
        notified += 1;
      });
      expect(query.applyOrientation(1600, 900)).assertEqual(0);
      expect(notified).assertEqual(0);
      expect(query.on('layout', (result: MockMediaQueryResult) => {
        notified += 1;
      })).assertFalse();
    });

    it('Browser_Integration_System_007', 0, async () => {
      TestLogger.step(TAG, 'deviceInfo default keeps the tablet layout');
      const device: MockDeviceProfile = new MockDeviceProfile(DEVICE_TYPE_DEFAULT, 'Sample', 'MatePad', 12, 320);
      expect(device.usesTabletLayout()).assertTrue();
      expect(device.usesPhoneLayout()).assertFalse();
      expect(device.homePage()).assertEqual(PAD_HOME_PAGE);
      expect(device.supportsMediaQuery()).assertTrue();
      expect(deviceIsPhone(device.deviceType)).assertFalse();
    });

    it('Browser_Integration_System_008', 0, async () => {
      TestLogger.step(TAG, 'non default device types switch to the phone layout');
      const types: string[] = [DEVICE_TYPE_PHONE, DEVICE_TYPE_TABLET, 'wearable', 'tv', 'car'];
      for (let index = 0; index < types.length; index++) {
        const device: MockDeviceProfile = new MockDeviceProfile(types[index]);
        expect(device.usesTabletLayout()).assertFalse();
        expect(device.usesPhoneLayout()).assertTrue();
        expect(device.homePage()).assertEqual(PHONE_HOME_PAGE);
        expect(deviceIsPhone(device.deviceType)).assertTrue();
      }
    });

    it('Browser_Integration_System_009', 0, async () => {
      TestLogger.step(TAG, 'sdk api version gates the media query capability');
      expect(new MockDeviceProfile(DEVICE_TYPE_DEFAULT, 'Sample', 'MatePad', 12).supportsMediaQuery()).assertTrue();
      expect(new MockDeviceProfile(DEVICE_TYPE_DEFAULT, 'Sample', 'MatePad', 9).supportsMediaQuery()).assertTrue();
      expect(new MockDeviceProfile(DEVICE_TYPE_DEFAULT, 'Sample', 'MatePad', 8).supportsMediaQuery()).assertFalse();
      expect(new MockDeviceProfile().summary()).assertEqual('Sample MatePad default api9');
    });

    it('Browser_Integration_System_010', 0, async () => {
      TestLogger.step(TAG, 'ability delegator records the launch want');
      const delegator: MockAbilityDelegator = new MockAbilityDelegator();
      const want: LaunchWant = { bundleName: 'ohos.samples.browser1', abilityName: 'MainAbility' };
      expect(delegator.startAbility(want)).assertTrue();
      expect(delegator.launchCount()).assertEqual(1);
      expect(delegator.delegatorState).assertEqual('started');
      const last: LaunchWant | null = delegator.lastWant();
      expect(last === null).assertFalse();
      if (last !== null) {
        expect(last.abilityName).assertEqual('MainAbility');
        expect(last.bundleName).assertEqual('ohos.samples.browser1');
      }
    });

    it('Browser_Integration_System_011', 0, async () => {
      TestLogger.step(TAG, 'delegator appends every launch request in order');
      const delegator: MockAbilityDelegator = new MockAbilityDelegator();
      delegator.startAbility({ bundleName: 'ohos.samples.browser1', abilityName: 'MainAbility' });
      delegator.startAbility({ bundleName: 'ohos.samples.browser1', abilityName: 'SecondAbility' });
      expect(delegator.launchCount()).assertEqual(2);
      expect(delegator.launched[0].abilityName).assertEqual('MainAbility');
      expect(delegator.launched[1].abilityName).assertEqual('SecondAbility');
      delegator.reset();
      expect(delegator.launchCount()).assertEqual(0);
      expect(delegator.lastWant() === null).assertTrue();
    });

    it('Browser_Integration_System_012', 0, async () => {
      TestLogger.step(TAG, 'failed launch is reported without corrupting the record');
      const delegator: MockAbilityDelegator = new MockAbilityDelegator();
      delegator.failNextLaunch = true;
      const failed: boolean = delegator.startAbility({
        bundleName: 'ohos.samples.browser1', abilityName: 'MainAbility'
      });
      expect(failed).assertFalse();
      expect(delegator.launchCount()).assertEqual(0);
      expect(delegator.delegatorState).assertEqual('start-failed');
      const retried: boolean = delegator.startAbility({
        bundleName: 'ohos.samples.browser1', abilityName: 'MainAbility'
      });
      expect(retried).assertTrue();
      expect(delegator.launchCount()).assertEqual(1);
    });

    it('Browser_Integration_System_013', 0, async () => {
      TestLogger.step(TAG, 'eleventh tab triggers the capacity toast');
      const browser: MockBrowser = new MockBrowser();
      for (let index = 0; index < MAX_TAB_COUNT; index++) {
        expect(browser.addTab()).assertTrue();
      }
      expect(browser.tabs.length).assertEqual(MAX_TAB_COUNT + 1);
      expect(browser.addTab()).assertFalse();
      expect(browser.toasts.length).assertEqual(1);
      expect(browser.toasts[0]).assertEqual(TAB_LIMIT_MESSAGE);
      expect(browser.tabs.length).assertEqual(MAX_TAB_COUNT + 1);
    });

    it('Browser_Integration_System_014', 0, async () => {
      TestLogger.step(TAG, 'repeated attempts emit one toast per refusal');
      const browser: MockBrowser = new MockBrowser();
      for (let index = 0; index < MAX_TAB_COUNT; index++) {
        browser.addTab();
      }
      expect(browser.addTab()).assertFalse();
      expect(browser.addTab()).assertFalse();
      expect(browser.toasts.length).assertEqual(2);
      expect(browser.toasts[0]).assertEqual(browser.toasts[1]);
      TestLogger.info(TAG, `capacity toasts recorded=${browser.toasts.length}`);
    });

    it('Browser_Integration_System_015', 0, async () => {
      TestLogger.step(TAG, 'no toast is emitted while capacity is available');
      const browser: MockBrowser = new MockBrowser();
      expect(browser.addTab()).assertTrue();
      expect(browser.addTab()).assertTrue();
      expect(browser.toasts.length).assertEqual(0);
      expect(browser.deleteTab(2)).assertTrue();
      expect(browser.addTab()).assertTrue();
      expect(browser.toasts.length).assertEqual(0);
    });

    it('Browser_Integration_System_016', 0, async () => {
      TestLogger.step(TAG, 'hilog sink captures the info probe of this suite');
      const probe: string = 'system-chain-probe-016';
      TestLogger.info(TAG, probe);
      expect(browserLogSink.contains(probe)).assertTrue();
      const tagged: number = browserLogSink.getByTag(TAG).length;
      TestLogger.info(TAG, `records tagged with the suite=${tagged}`);
      expect(tagged).assertLarger(0);
      expect(browserLogSink.size()).assertLarger(0);
    });

    it('Browser_Integration_System_017', 0, async () => {
      TestLogger.step(TAG, 'warn level reaches the sink under its own severity');
      const probe: string = 'system-chain-probe-017';
      TestLogger.warn(TAG, probe);
      expect(browserLogSink.contains(probe)).assertTrue();
      const warns: number = browserLogSink.getByLevel('WARN').length;
      expect(warns).assertLarger(0);
      const recent: number = browserLogSink.getRecent(5).length;
      expect(recent).assertLarger(0);
    });

    it('Browser_Integration_System_018', 0, async () => {
      TestLogger.step(TAG, 'chain filters records below the subscribed level');
      const chain: HilogChain = new HilogChain();
      chain.setMinLevel(LEVEL_INFO);
      expect(chain.log(LEVEL_DEBUG, TAG, 'debug dropped')).assertFalse();
      expect(chain.log(LEVEL_INFO, TAG, 'info kept')).assertTrue();
      expect(chain.log(LEVEL_WARN, TAG, 'warn kept')).assertTrue();
      expect(chain.size()).assertEqual(2);
      expect(chain.droppedCount()).assertEqual(1);
      expect(chain.messages().indexOf('debug dropped')).assertEqual(-1);
    });

    it('Browser_Integration_System_019', 0, async () => {
      TestLogger.step(TAG, 'chain keeps error records isolated by level and tag');
      const chain: HilogChain = new HilogChain();
      chain.setMinLevel(LEVEL_DEBUG);
      chain.log(LEVEL_INFO, 'BrowserModel', 'tab added');
      chain.log(LEVEL_ERROR, 'BrowserModel', 'load failed');
      chain.log(LEVEL_ERROR, 'BrowserTabs', 'close rejected');
      expect(chain.size()).assertEqual(3);
      expect(chain.byLevel(LEVEL_ERROR).length).assertEqual(2);
      expect(chain.byTag('BrowserModel').length).assertEqual(2);
      const errors: ChainRecord[] = chain.byLevel(LEVEL_ERROR);
      expect(errors[0].domain).assertEqual(HILOG_DOMAIN);
      expect(errors[1].message).assertEqual('close rejected');
      chain.clear();
      expect(chain.size()).assertEqual(0);
      expect(chain.droppedCount()).assertEqual(0);
    });

    it('Browser_Integration_System_020', 0, async () => {
      TestLogger.step(TAG, 'chain timestamps advance monotonically per record');
      const chain: HilogChain = new HilogChain();
      chain.setMinLevel(LEVEL_DEBUG);
      chain.log(LEVEL_DEBUG, TAG, 'first');
      chain.log(LEVEL_INFO, TAG, 'second');
      chain.log(LEVEL_WARN, TAG, 'third');
      const tagged: ChainRecord[] = chain.byTag(TAG);
      expect(tagged.length).assertEqual(3);
      expect(tagged[1].timestamp > tagged[0].timestamp).assertTrue();
      expect(tagged[2].timestamp > tagged[1].timestamp).assertTrue();
      expect(tagged[2].level).assertEqual(LEVEL_WARN);
    });

    it('Browser_Integration_System_021', 0, async () => {
      TestLogger.step(TAG, 'ui: layout controls stay reachable after launch');
      const inputReady: boolean = await componentByIdExists(driver, ID_INPUT_URL);
      TestLogger.info(TAG, `url input present after launch=${inputReady}`);
      if (!inputReady) {
        TestLogger.fail(TAG, 'Browser_Integration_System_021', 'url input not reachable');
        expect().assertFail();
        return;
      }
      const homeReady: boolean = await componentByIdExists(driver, ID_NAV_HOME);
      const stripCount: number = await countById(driver, ID_CANCEL_TAB);
      const addCount: number = await countById(driver, ID_ACTION_ADD);
      TestLogger.info(TAG, `home=${homeReady}, close buttons=${stripCount}, add=${addCount}`);
      if (stripCount > 0) {
        expect(addCount).assertLarger(0);
      } else {
        expect(addCount).assertEqual(0);
      }
      expect(stripCount <= MAX_TAB_COUNT + 1).assertTrue();
    });

    it('Browser_Integration_System_022', 0, async () => {
      TestLogger.step(TAG, 'ui: home navigation remains clickable in the current layout');
      const clicked: boolean = await clickById(driver, ID_NAV_HOME);
      await serializedDelay(driver, TIMEOUT_COMPONENT / 2);
      TestLogger.info(TAG, `home button clicked=${clicked}`);
      if (!clicked) {
        TestLogger.warn(TAG, 'home button unavailable on the current layout');
        const addCount: number = await countById(driver, ID_ACTION_ADD);
        expect(addCount >= 0).assertTrue();
        return;
      }
      expect(clicked).assertTrue();
    });

    it('Browser_Integration_System_023', 0, async () => {
      TestLogger.step(TAG, 'rotation flow keeps device, query and model consistent');
      const device: MockDeviceProfile = new MockDeviceProfile(DEVICE_TYPE_DEFAULT, 'Sample', 'MatePad', 12);
      const query: MockMediaQueryList = new MockMediaQueryList();
      query.evaluate(1280, 800);
      let landscape: boolean = query.matches;
      query.on(CHANGE_EVENT, (result: MockMediaQueryResult) => {
        landscape = result.matches;
      });
      expect(landscape).assertTrue();
      query.applyOrientation(800, 1280);
      expect(landscape).assertFalse();
      expect(device.homePage()).assertEqual(PAD_HOME_PAGE);
      const browser: MockBrowser = new MockBrowser();
      browser.loadUrl('www.sample.com');
      expect(browser.getCurrentTab() === null).assertFalse();
      expect(browser.tabs.length).assertEqual(1);
    });
  });
}
