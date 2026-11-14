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
  getDriver, startBrowserApp, componentByIdExists, countById, textById,
  waitForId, serializedDelay,
  ID_INPUT_URL, ID_NAV_BACK, ID_NAV_FORWARD, ID_NAV_REFRESH, ID_NAV_HOME,
  ID_ACTION_SUBMIT, ID_ACTION_ADD, ID_CANCEL_TAB,
  PAD_HOME_PAGE, PHONE_HOME_PAGE, deviceIsPhone
} from '../Shared/BrowserTestKit';
import { MockClock } from '../Shared/BrowserMock';

const TAG: string = 'BrowserConfigurationManagerValidationTest';

/* ------------------------------------------------------------------ */
/* Configuration vocabulary mirrored from the browser sample           */
/* ------------------------------------------------------------------ */

const DEVICE_DEFAULT: string = 'default';
const DEVICE_PHONE: string = 'phone';
const DEVICE_TABLET: string = 'tablet';
const DEVICE_TV: string = 'tv';
const DEVICE_WEARABLE: string = 'wearable';

const ORIENTATION_PORTRAIT: string = 'portrait';
const ORIENTATION_LANDSCAPE: string = 'landscape';

const BREAKPOINT_COMPACT: string = 'compact';
const BREAKPOINT_MEDIUM: string = 'medium';
const BREAKPOINT_EXPANDED: string = 'expanded';

const COMPACT_MAX_WIDTH: number = 599;
const MEDIUM_MAX_WIDTH: number = 839;

const PAD_USER_AGENT: string =
  'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) ' +
  'Chrome/92.0.4515.105 Safari/537.36';
const PHONE_USER_AGENT: string = 'SampleBrowser/12.0.4.1';

const KEY_DEVICE_TYPE: string = 'deviceType';
const KEY_ORIENTATION: string = 'orientation';
const KEY_BREAKPOINT: string = 'breakpoint';
const KEY_USER_AGENT: string = 'userAgent';
const KEY_HOME_PAGE: string = 'homePage';
const KEY_LAYOUT_MODE: string = 'layoutMode';
const KEY_TAB_STRIP: string = 'tabStripVisible';
const KEY_NAV_COUNT: string = 'navigationCount';
const KEY_LANGUAGE: string = 'language';

const LAYOUT_PAD: string = 'padLayout';
const LAYOUT_PHONE: string = 'phoneLayout';

const SOURCE_RESOURCE: string = 'resource';
const SOURCE_MEDIAQUERY: string = 'mediaquery';
const SOURCE_RUNTIME: string = 'runtime';
const SOURCE_FORCED: string = 'forced';

const PRIORITY_DEFAULT: number = 0;
const PRIORITY_RESOURCE: number = 10;
const PRIORITY_MEDIAQUERY: number = 20;
const PRIORITY_RUNTIME: number = 30;
const PRIORITY_FORCED: number = 40;

const DEFAULT_LANGUAGE: string = 'zh-Hans';
const FALLBACK_BREAKPOINT: string = BREAKPOINT_MEDIUM;

const TABLET_NAVIGATION_COUNT: number = 4;
const PHONE_NAVIGATION_COUNT: number = 4;
const MAX_SNAPSHOT_COUNT: number = 16;

/* ------------------------------------------------------------------ */
/* Local configuration model                                           */
/* ------------------------------------------------------------------ */

/** One resolved configuration value plus its provenance. */
class ConfigEntry {
  key: string;
  value: string;
  priority: number;
  source: string;
  revision: number;
  timestamp: number;

  constructor(key: string, value: string, priority: number, source: string,
    revision: number, timestamp: number) {
    this.key = key;
    this.value = value;
    this.priority = priority;
    this.source = source;
    this.revision = revision;
    this.timestamp = timestamp;
  }

  clone(): ConfigEntry {
    return new ConfigEntry(this.key, this.value, this.priority, this.source,
      this.revision, this.timestamp);
  }

  sameValue(other: ConfigEntry | null): boolean {
    if (other === null) {
      return false;
    }
    return this.key === other.key && this.value === other.value;
  }

  describe(): string {
    return `${this.key}=${this.value}@${this.source}:${this.priority}`;
  }
}

/** Frozen copy of the whole configuration map. */
class ConfigSnapshot {
  revision: number;
  takenAt: number;
  label: string;
  entries: ConfigEntry[] = [];

  constructor(revision: number, takenAt: number, label: string) {
    this.revision = revision;
    this.takenAt = takenAt;
    this.label = label;
  }

  size(): number {
    return this.entries.length;
  }

  findKey(key: string): ConfigEntry | null {
    for (let index = 0; index < this.entries.length; index++) {
      if (this.entries[index].key === key) {
        return this.entries[index];
      }
    }
    return null;
  }

  valueOf(key: string, fallback: string = ''): string {
    const entry: ConfigEntry | null = this.findKey(key);
    return entry === null ? fallback : entry.value;
  }

  keys(): string[] {
    return this.entries.map((entry: ConfigEntry) => entry.key);
  }

  sameAs(other: ConfigSnapshot | null): boolean {
    if (other === null || other.size() !== this.size()) {
      return false;
    }
    for (let index = 0; index < this.entries.length; index++) {
      const mine: ConfigEntry = this.entries[index];
      const theirs: ConfigEntry | null = other.findKey(mine.key);
      if (theirs === null || theirs.value !== mine.value) {
        return false;
      }
    }
    return true;
  }
}

/** Layout description derived from the device configuration. */
class LayoutProfile {
  isPhone: boolean;
  homePage: string;
  userAgent: string;
  navigationCount: number;
  tabStripVisible: boolean;

  constructor(isPhone: boolean) {
    this.isPhone = isPhone;
    this.homePage = isPhone ? PHONE_HOME_PAGE : PAD_HOME_PAGE;
    this.userAgent = isPhone ? PHONE_USER_AGENT : PAD_USER_AGENT;
    this.navigationCount = isPhone ? PHONE_NAVIGATION_COUNT : TABLET_NAVIGATION_COUNT;
    this.tabStripVisible = !isPhone;
  }

  describe(): string {
    const mode: string = this.isPhone ? LAYOUT_PHONE : LAYOUT_PAD;
    return `${mode}|${this.homePage}|${this.navigationCount}|${this.tabStripVisible}`;
  }
}
/* ------------------------------------------------------------------ */
/* Configuration manager under validation                              */
/* ------------------------------------------------------------------ */

const KNOWN_DEVICE_TYPES: string[] = [
  DEVICE_DEFAULT, DEVICE_PHONE, DEVICE_TABLET, DEVICE_TV, DEVICE_WEARABLE
];

/**
 * Layered configuration store.
 *
 * Values are written with an explicit priority, the highest priority wins and
 * an equal priority write replaces the previous value (last writer wins). Every
 * rejection keeps the previous state, so an illegal configuration can never
 * corrupt the layout description consumed by Index.ets.
 */
class ConfigurationManager {
  private defaults: Map<string, string> = new Map<string, string>();
  private entries: Map<string, ConfigEntry> = new Map<string, ConfigEntry>();
  private revision: number = 0;
  private notifications: number = 0;
  private lastKey: string = '';
  private lastValue: string = '';
  private rejected: number = 0;
  private rejectedKeys: string[] = [];
  private delivered: number = 0;
  private snapshots: ConfigSnapshot[] = [];
  private clock: MockClock;
  private listeners: string[] = [];

  constructor(clock: MockClock = new MockClock()) {
    this.clock = clock;
    this.installDefaults();
  }

  private installDefaults(): void {
    this.defaults.set(KEY_DEVICE_TYPE, DEVICE_DEFAULT);
    this.defaults.set(KEY_ORIENTATION, ORIENTATION_PORTRAIT);
    this.defaults.set(KEY_BREAKPOINT, BREAKPOINT_MEDIUM);
    this.defaults.set(KEY_USER_AGENT, PAD_USER_AGENT);
    this.defaults.set(KEY_HOME_PAGE, PAD_HOME_PAGE);
    this.defaults.set(KEY_LAYOUT_MODE, LAYOUT_PAD);
    this.defaults.set(KEY_TAB_STRIP, 'true');
    this.defaults.set(KEY_NAV_COUNT, `${TABLET_NAVIGATION_COUNT}`);
    this.defaults.set(KEY_LANGUAGE, DEFAULT_LANGUAGE);
  }

  /* ---------------- defaults ---------------- */

  getDefault(key: string): string {
    const value: string | undefined = this.defaults.get(key);
    return value === undefined ? '' : value;
  }

  setDefault(key: string, value: string): void {
    if (key === null || key === undefined || key.length === 0) {
      return;
    }
    this.defaults.set(key, value);
  }

  defaultKeys(): string[] {
    const result: string[] = [];
    this.defaults.forEach((value: string, key: string) => {
      result.push(key);
    });
    result.sort();
    return result;
  }

  defaultCount(): number {
    return this.defaults.size;
  }

  /* ---------------- write path ---------------- */

  /** Writes a value; illegal keys or values are rejected without side effect. */
  set(key: string, value: string, priority: number = PRIORITY_RUNTIME,
    source: string = SOURCE_RUNTIME): boolean {
    const keyOk: boolean = key !== null && key !== undefined && key.length > 0;
    const valueOk: boolean = value !== null && value !== undefined && value.length > 0;
    if (!keyOk || !valueOk || !this.isValueAccepted(key, value)) {
      this.rejected += 1;
      if (keyOk) {
        this.rejectedKeys.push(key);
      }
      return false;
    }
    const current: ConfigEntry | undefined = this.entries.get(key);
    if (current !== undefined && current.priority > priority) {
      this.rejected += 1;
      this.rejectedKeys.push(key);
      return false;
    }
    if (current !== undefined && current.priority === priority &&
      current.value === value && current.source === source) {
      return true;
    }
    const previousValue: string = this.get(key);
    this.revision += 1;
    const entry: ConfigEntry = new ConfigEntry(key, value, priority, source,
      this.revision, this.clock.now());
    this.entries.set(key, entry);
    if (previousValue !== value) {
      this.notifications += 1;
      this.lastKey = key;
      this.lastValue = value;
      this.publish(key, value);
    }
    return true;
  }

  /** A value is accepted only when it fits the vocabulary of its key. */
  private isValueAccepted(key: string, value: string): boolean {
    if (key === KEY_DEVICE_TYPE) {
      return this.isKnownDeviceType(value);
    }
    if (key === KEY_ORIENTATION) {
      return value === ORIENTATION_PORTRAIT || value === ORIENTATION_LANDSCAPE;
    }
    if (key === KEY_BREAKPOINT) {
      return value === BREAKPOINT_COMPACT || value === BREAKPOINT_MEDIUM ||
        value === BREAKPOINT_EXPANDED;
    }
    if (key === KEY_USER_AGENT) {
      return value.length >= 8;
    }
    if (key === KEY_HOME_PAGE) {
      return value === PAD_HOME_PAGE || value === PHONE_HOME_PAGE;
    }
    if (key === KEY_LAYOUT_MODE) {
      return value === LAYOUT_PAD || value === LAYOUT_PHONE;
    }
    if (key === KEY_TAB_STRIP) {
      return value === 'true' || value === 'false';
    }
    if (key === KEY_NAV_COUNT) {
      const parsed: number = Number(value);
      return !Number.isNaN(parsed) && parsed >= 0 && parsed <= 8;
    }
    if (key === KEY_LANGUAGE) {
      return value.length >= 2 && value.length <= 16;
    }
    return value.length > 0;
  }

  isKnownDeviceType(deviceType: string): boolean {
    return KNOWN_DEVICE_TYPES.indexOf(deviceType) >= 0;
  }

  /* ---------------- read path ---------------- */

  /** Reads the effective value: override first, default second, empty last. */
  get(key: string): string {
    const entry: ConfigEntry | undefined = this.entries.get(key);
    if (entry !== undefined) {
      return entry.value;
    }
    const fallback: string | undefined = this.defaults.get(key);
    return fallback === undefined ? '' : fallback;
  }

  getOrDefault(key: string, fallback: string): string {
    const value: string = this.get(key);
    return value.length === 0 ? fallback : value;
  }

  entryOf(key: string): ConfigEntry | null {
    const entry: ConfigEntry | undefined = this.entries.get(key);
    return entry === undefined ? null : entry.clone();
  }

  has(key: string): boolean {
    return this.get(key).length > 0;
  }

  isOverridden(key: string): boolean {
    return this.entries.has(key);
  }

  overrideCount(): number {
    return this.entries.size;
  }

  effectiveKeys(): string[] {
    const result: string[] = this.defaultKeys();
    this.entries.forEach((entry: ConfigEntry, key: string) => {
      if (result.indexOf(key) < 0) {
        result.push(key);
      }
    });
    result.sort();
    return result;
  }

  /* ---------------- removal / reset ---------------- */

  remove(key: string): boolean {
    if (!this.entries.has(key)) {
      return false;
    }
    this.entries.delete(key);
    this.revision += 1;
    this.notifications += 1;
    this.lastKey = key;
    this.lastValue = this.get(key);
    this.publish(key, this.lastValue);
    return true;
  }

  clearOverrides(): void {
    this.entries.clear();
    this.revision += 1;
  }

  resetAll(): void {
    this.entries.clear();
    this.revision = 0;
    this.notifications = 0;
    this.rejected = 0;
    this.rejectedKeys = [];
    this.lastKey = '';
    this.lastValue = '';
    this.snapshots = [];
  }
  /* ---------------- observation ---------------- */

  private publish(key: string, value: string): void {
    this.lastKey = key;
    this.lastValue = value;
    this.delivered += this.listeners.length;
  }

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

  /** Number of listener callbacks delivered so far. */
  deliveredCount(): number {
    return this.delivered;
  }

  notificationCount(): number {
    return this.notifications;
  }

  lastChangedKey(): string {
    return this.lastKey;
  }

  rejectedCount(): number {
    return this.rejected;
  }

  rejectedKeyList(): string[] {
    return this.rejectedKeys.slice(0);
  }

  currentRevision(): number {
    return this.revision;
  }

  /* ---------------- derived layout configuration ---------------- */

  /** Media query orientation: only landscape counts as a layout change. */
  isLandscape(orientation: string): boolean {
    return orientation === ORIENTATION_LANDSCAPE;
  }

  resolveOrientation(orientation: string): string {
    if (orientation === ORIENTATION_PORTRAIT || orientation === ORIENTATION_LANDSCAPE) {
      return orientation;
    }
    return ORIENTATION_PORTRAIT;
  }

  /** Width driven breakpoint of the responsive grid. */
  resolveBreakpoint(width: number): string {
    if (Number.isNaN(width) || width < 0) {
      return FALLBACK_BREAKPOINT;
    }
    if (width <= COMPACT_MAX_WIDTH) {
      return BREAKPOINT_COMPACT;
    }
    if (width <= MEDIUM_MAX_WIDTH) {
      return BREAKPOINT_MEDIUM;
    }
    return BREAKPOINT_EXPANDED;
  }

  isTabletWidth(width: number): boolean {
    return this.resolveBreakpoint(width) === BREAKPOINT_EXPANDED;
  }

  /** Unknown device types degrade to the dual form 'default' device. */
  resolveDeviceType(deviceType: string): string {
    if (!this.isKnownDeviceType(deviceType)) {
      return DEVICE_DEFAULT;
    }
    return deviceType;
  }

  /** Index.ets: every non 'default' device renders the phone layout. */
  isPhoneDevice(deviceType: string): boolean {
    // Tablets and 2in1 devices keep the pad layout; only handheld form factors
    // switch to the phone layout.
    const resolved: string = this.resolveDeviceType(deviceType);
    return resolved === DEVICE_PHONE || resolved === DEVICE_TV || resolved === DEVICE_WEARABLE;
  }

  layoutFor(deviceType: string): LayoutProfile {
    return new LayoutProfile(this.isPhoneDevice(deviceType));
  }

  resolveUserAgent(deviceType: string): string {
    return this.layoutFor(deviceType).userAgent;
  }

  resolveHomePage(deviceType: string): string {
    const page: string = this.get(KEY_HOME_PAGE);
    if (page === PAD_HOME_PAGE || page === PHONE_HOME_PAGE) {
      return page;
    }
    return this.layoutFor(deviceType).homePage;
  }

  /** Applies a device type from the runtime layer and returns the new layout. */
  applyDeviceType(deviceType: string): boolean {
    const resolved: string = this.resolveDeviceType(deviceType);
    const applied: boolean = this.set(KEY_DEVICE_TYPE, resolved, PRIORITY_RUNTIME, SOURCE_RUNTIME);
    if (!applied) {
      return false;
    }
    const layout: LayoutProfile = this.layoutFor(resolved);
    this.set(KEY_USER_AGENT, layout.userAgent, PRIORITY_RESOURCE, SOURCE_RESOURCE);
    this.set(KEY_HOME_PAGE, layout.homePage, PRIORITY_RESOURCE, SOURCE_RESOURCE);
    this.set(KEY_LAYOUT_MODE, layout.isPhone ? LAYOUT_PHONE : LAYOUT_PAD,
      PRIORITY_RESOURCE, SOURCE_RESOURCE);
    this.set(KEY_TAB_STRIP, layout.tabStripVisible ? 'true' : 'false',
      PRIORITY_RESOURCE, SOURCE_RESOURCE);
    this.set(KEY_NAV_COUNT, `${layout.navigationCount}`, PRIORITY_RESOURCE, SOURCE_RESOURCE);
    return true;
  }

  /** Applies an orientation from the mediaquery layer. */
  applyOrientation(orientation: string): boolean {
    const resolved: string = this.resolveOrientation(orientation);
    this.set(KEY_BREAKPOINT, this.isLandscape(resolved) ? BREAKPOINT_EXPANDED : BREAKPOINT_COMPACT,
      PRIORITY_MEDIAQUERY, SOURCE_MEDIAQUERY);
    return this.set(KEY_ORIENTATION, resolved, PRIORITY_MEDIAQUERY, SOURCE_MEDIAQUERY);
  }

  /* ---------------- merge ---------------- */

  /**
   * Merges another configuration into this one.
   *
   * Only values that beat the local priority are copied, which mirrors the
   * resource < mediaquery < runtime < forced precedence of the sample.
   */
  merge(other: ConfigurationManager, priority: number = PRIORITY_RUNTIME): number {
    const keys: string[] = other.effectiveKeys();
    let applied: number = 0;
    for (let index = 0; index < keys.length; index++) {
      const key: string = keys[index];
      const incoming: ConfigEntry | null = other.entryOf(key);
      const value: string = other.get(key);
      if (value.length === 0) {
        continue;
      }
      const source: string = incoming === null ? SOURCE_RESOURCE : incoming.source;
      if (this.set(key, value, priority, source)) {
        applied += 1;
      }
    }
    return applied;
  }

  /* ---------------- snapshots ---------------- */

  snapshot(label: string = 'auto'): ConfigSnapshot {
    const snapshot: ConfigSnapshot = new ConfigSnapshot(this.revision, this.clock.now(), label);
    this.entries.forEach((entry: ConfigEntry) => {
      snapshot.entries.push(entry.clone());
    });
    snapshot.entries.sort((left: ConfigEntry, right: ConfigEntry) =>
      left.key < right.key ? -1 : (left.key > right.key ? 1 : 0));
    this.snapshots.push(snapshot);
    while (this.snapshots.length > MAX_SNAPSHOT_COUNT) {
      this.snapshots.shift();
    }
    return snapshot;
  }

  snapshotCount(): number {
    return this.snapshots.length;
  }

  latestSnapshot(): ConfigSnapshot | null {
    if (this.snapshots.length === 0) {
      return null;
    }
    return this.snapshots[this.snapshots.length - 1];
  }

  /** Restores a snapshot, dropping overrides that appeared afterwards. */
  restore(snapshot: ConfigSnapshot | null): boolean {
    if (snapshot === null || snapshot.size() === 0) {
      return false;
    }
    this.entries.clear();
    for (let index = 0; index < snapshot.entries.length; index++) {
      this.entries.set(snapshot.entries[index].key, snapshot.entries[index].clone());
    }
    this.revision = snapshot.revision;
    return true;
  }

  /* ---------------- consistency ---------------- */

  /** Returns the list of inconsistencies of the current effective values. */
  validate(): string[] {
    const issues: string[] = [];
    const deviceType: string = this.get(KEY_DEVICE_TYPE);
    if (!this.isKnownDeviceType(deviceType)) {
      issues.push('unknown-device-type');
    }
    const layout: LayoutProfile = this.layoutFor(deviceType);
    if (this.get(KEY_USER_AGENT) !== layout.userAgent &&
      !this.isOverridden(KEY_USER_AGENT)) {
      issues.push('user-agent-mismatch');
    }
    if (this.get(KEY_HOME_PAGE) !== layout.homePage && !this.isOverridden(KEY_HOME_PAGE)) {
      issues.push('home-page-mismatch');
    }
    const tabStrip: string = this.get(KEY_TAB_STRIP);
    if (tabStrip !== 'true' && tabStrip !== 'false') {
      issues.push('tab-strip-invalid');
    }
    const navCount: number = Number(this.get(KEY_NAV_COUNT));
    if (Number.isNaN(navCount) || navCount < 0) {
      issues.push('navigation-count-invalid');
    }
    const orientation: string = this.get(KEY_ORIENTATION);
    if (orientation !== ORIENTATION_PORTRAIT && orientation !== ORIENTATION_LANDSCAPE) {
      issues.push('orientation-invalid');
    }
    return issues;
  }

  /** Human readable dump used by the failure branch of the suite. */
  describeAll(): string {
    const keys: string[] = this.effectiveKeys();
    const parts: string[] = [];
    for (let index = 0; index < keys.length; index++) {
      parts.push(`${keys[index]}=${this.get(keys[index])}`);
    }
    return parts.join(';');
  }
}
export default function configurationManagerValidationTest() {
  describe('configurationManagerValidationTest', () => {
    const driver: Driver = getDriver();
    let clock: MockClock = new MockClock(1700000000000);

    beforeAll(async () => {
      TestLogger.info(TAG, 'suite begin');
      TestLogger.step(TAG, 'launch browser application');
      await startBrowserApp();
      await serializedDelay(driver, 300);
    });

    afterAll(() => {
      TestLogger.info(TAG, `suite end, ${TestLogger.summary(TAG)}`);
    });

    it('Configuration_Default_001', 0, async () => {
      TestLogger.caseBegin(TAG, 'Configuration_Default_001');
      TestLogger.step(TAG, 'read default device type and derived layout');
      const manager: ConfigurationManager = new ConfigurationManager(clock);
      expect(manager.get(KEY_DEVICE_TYPE)).assertEqual(DEVICE_DEFAULT);
      expect(manager.isPhoneDevice(DEVICE_DEFAULT)).assertFalse();
      expect(manager.layoutFor(DEVICE_DEFAULT).homePage).assertEqual(PAD_HOME_PAGE);
      expect(manager.layoutFor(DEVICE_DEFAULT).tabStripVisible).assertTrue();
      TestLogger.info(TAG, `defaults resolved: ${manager.describeAll()}`);
      TestLogger.pass(TAG, 'Configuration_Default_001');
    });

    it('Configuration_Default_002', 0, async () => {
      TestLogger.step(TAG, 'enumerate default key table');
      const manager: ConfigurationManager = new ConfigurationManager(clock);
      const keys: string[] = manager.defaultKeys();
      expect(keys.length).assertEqual(9);
      expect(keys[0]).assertEqual(KEY_BREAKPOINT);
      expect(keys.indexOf(KEY_DEVICE_TYPE) >= 0).assertTrue();
      expect(keys.indexOf(KEY_USER_AGENT) >= 0).assertTrue();
      expect(manager.defaultCount()).assertEqual(9);
      expect(manager.getDefault(KEY_LANGUAGE)).assertEqual(DEFAULT_LANGUAGE);
      TestLogger.info(TAG, `default key count=${keys.length}`);
      TestLogger.pass(TAG, 'Configuration_Default_002');
    });

    it('Configuration_Breakpoint_003', 0, async () => {
      TestLogger.step(TAG, 'evaluate breakpoint boundaries');
      const manager: ConfigurationManager = new ConfigurationManager(clock);
      expect(manager.resolveBreakpoint(0)).assertEqual(BREAKPOINT_COMPACT);
      expect(manager.resolveBreakpoint(COMPACT_MAX_WIDTH)).assertEqual(BREAKPOINT_COMPACT);
      expect(manager.resolveBreakpoint(COMPACT_MAX_WIDTH + 1)).assertEqual(BREAKPOINT_MEDIUM);
      expect(manager.resolveBreakpoint(MEDIUM_MAX_WIDTH)).assertEqual(BREAKPOINT_MEDIUM);
      expect(manager.resolveBreakpoint(MEDIUM_MAX_WIDTH + 1)).assertEqual(BREAKPOINT_EXPANDED);
      expect(manager.isTabletWidth(MEDIUM_MAX_WIDTH + 1)).assertTrue();
      expect(manager.isTabletWidth(MEDIUM_MAX_WIDTH)).assertFalse();
      TestLogger.pass(TAG, 'Configuration_Breakpoint_003');
    });

    it('Configuration_Breakpoint_004', 0, async () => {
      TestLogger.step(TAG, 'reject negative and NaN widths');
      const manager: ConfigurationManager = new ConfigurationManager(clock);
      expect(manager.resolveBreakpoint(-1)).assertEqual(FALLBACK_BREAKPOINT);
      expect(manager.resolveBreakpoint(-1920)).assertEqual(FALLBACK_BREAKPOINT);
      expect(manager.resolveBreakpoint(Number.NaN)).assertEqual(FALLBACK_BREAKPOINT);
      expect(manager.isTabletWidth(-1)).assertFalse();
      expect(manager.resolveOrientation('sideways')).assertEqual(ORIENTATION_PORTRAIT);
      expect(manager.isLandscape(ORIENTATION_LANDSCAPE)).assertTrue();
      expect(manager.isLandscape(ORIENTATION_PORTRAIT)).assertFalse();
      TestLogger.pass(TAG, 'Configuration_Breakpoint_004');
    });

    it('Configuration_Layout_005', 0, async () => {
      TestLogger.step(TAG, 'verify pad layout profile');
      const manager: ConfigurationManager = new ConfigurationManager(clock);
      const profile: LayoutProfile = manager.layoutFor(DEVICE_DEFAULT);
      expect(profile.isPhone).assertFalse();
      expect(profile.homePage).assertEqual(PAD_HOME_PAGE);
      expect(profile.userAgent).assertEqual(PAD_USER_AGENT);
      expect(profile.navigationCount).assertEqual(TABLET_NAVIGATION_COUNT);
      expect(profile.tabStripVisible).assertTrue();
      expect(profile.describe()).assertContain(LAYOUT_PAD);
      TestLogger.info(TAG, `pad profile=${profile.describe()}`);
      TestLogger.pass(TAG, 'Configuration_Layout_005');
    });

    it('Configuration_Layout_006', 0, async () => {
      TestLogger.step(TAG, 'verify phone layout profile');
      const manager: ConfigurationManager = new ConfigurationManager(clock);
      const profile: LayoutProfile = manager.layoutFor(DEVICE_PHONE);
      expect(profile.isPhone).assertTrue();
      expect(profile.homePage).assertEqual(PHONE_HOME_PAGE);
      expect(profile.userAgent).assertEqual(PHONE_USER_AGENT);
      expect(profile.navigationCount).assertEqual(PHONE_NAVIGATION_COUNT);
      expect(profile.tabStripVisible).assertFalse();
      expect(profile.describe()).assertContain(LAYOUT_PHONE);
      TestLogger.pass(TAG, 'Configuration_Layout_006');
    });

    it('Configuration_UserAgent_007', 0, async () => {
      TestLogger.step(TAG, 'select user agent per device type');
      const manager: ConfigurationManager = new ConfigurationManager(clock);
      expect(manager.resolveUserAgent(DEVICE_DEFAULT)).assertEqual(PAD_USER_AGENT);
      expect(manager.resolveUserAgent(DEVICE_TABLET)).assertEqual(PAD_USER_AGENT);
      expect(manager.resolveUserAgent(DEVICE_PHONE)).assertEqual(PHONE_USER_AGENT);
      expect(manager.resolveUserAgent(DEVICE_TV)).assertEqual(PHONE_USER_AGENT);
      expect(manager.resolveUserAgent(DEVICE_WEARABLE)).assertEqual(PHONE_USER_AGENT);
      expect(PAD_USER_AGENT.indexOf('Chrome/92')).assertLarger(0);
      expect(PHONE_USER_AGENT.startsWith('SampleBrowser/')).assertTrue();
      TestLogger.pass(TAG, 'Configuration_UserAgent_007');
    });

    it('Configuration_Fallback_008', 0, async () => {
      TestLogger.step(TAG, 'fallback of unknown device type');
      const manager: ConfigurationManager = new ConfigurationManager(clock);
      expect(manager.resolveDeviceType('foldable')).assertEqual(DEVICE_DEFAULT);
      expect(manager.resolveDeviceType('')).assertEqual(DEVICE_DEFAULT);
      expect(manager.resolveDeviceType(DEVICE_TABLET)).assertEqual(DEVICE_TABLET);
      expect(manager.isKnownDeviceType('foldable')).assertFalse();
      expect(manager.isKnownDeviceType(DEVICE_WEARABLE)).assertTrue();
      expect(manager.layoutFor('foldable').homePage).assertEqual(PAD_HOME_PAGE);
      TestLogger.pass(TAG, 'Configuration_Fallback_008');
    });

    it('Configuration_Fallback_009', 0, async () => {
      TestLogger.step(TAG, 'illegal value keeps the previous configuration');
      const manager: ConfigurationManager = new ConfigurationManager(clock);
      expect(manager.set(KEY_DEVICE_TYPE, 'tablet', PRIORITY_RESOURCE, SOURCE_RESOURCE)).assertTrue();
      expect(manager.set(KEY_DEVICE_TYPE, 'console', PRIORITY_FORCED, SOURCE_FORCED)).assertFalse();
      expect(manager.get(KEY_DEVICE_TYPE)).assertEqual(DEVICE_TABLET);
      expect(manager.set(KEY_TAB_STRIP, 'yes')).assertFalse();
      expect(manager.get(KEY_TAB_STRIP)).assertEqual('true');
      expect(manager.set(KEY_NAV_COUNT, '99')).assertFalse();
      expect(manager.set(KEY_USER_AGENT, 'short')).assertFalse();
      expect(manager.rejectedCount()).assertEqual(4);
      TestLogger.info(TAG, `rejected keys=${manager.rejectedKeyList().join(',')}`);
      TestLogger.pass(TAG, 'Configuration_Fallback_009');
    });

    it('Configuration_Priority_010', 0, async () => {
      TestLogger.step(TAG, 'higher priority layer wins');
      const manager: ConfigurationManager = new ConfigurationManager(clock);
      manager.set(KEY_ORIENTATION, ORIENTATION_LANDSCAPE, PRIORITY_FORCED, SOURCE_FORCED);
      expect(manager.set(KEY_ORIENTATION, ORIENTATION_PORTRAIT, PRIORITY_RUNTIME,
        SOURCE_RUNTIME)).assertFalse();
      expect(manager.get(KEY_ORIENTATION)).assertEqual(ORIENTATION_LANDSCAPE);
      expect(manager.set(KEY_LANGUAGE, 'en-US', PRIORITY_RESOURCE, SOURCE_RESOURCE)).assertTrue();
      expect(manager.set(KEY_LANGUAGE, 'zh-Hans', PRIORITY_RUNTIME, SOURCE_RUNTIME)).assertTrue();
      expect(manager.get(KEY_LANGUAGE)).assertEqual('zh-Hans');
      const languageEntry: ConfigEntry | null = manager.entryOf(KEY_LANGUAGE);
      expect(languageEntry === null).assertFalse();
      if (languageEntry !== null) {
        expect(languageEntry.priority).assertEqual(PRIORITY_RUNTIME);
      }
      TestLogger.pass(TAG, 'Configuration_Priority_010');
    });

    it('Configuration_Priority_011', 0, async () => {
      TestLogger.step(TAG, 'equal priority last writer wins');
      const manager: ConfigurationManager = new ConfigurationManager(clock);
      manager.set(KEY_LANGUAGE, 'en-US', PRIORITY_RUNTIME, SOURCE_RUNTIME);
      manager.set(KEY_LANGUAGE, 'ja-JP', PRIORITY_RUNTIME, SOURCE_RUNTIME);
      expect(manager.get(KEY_LANGUAGE)).assertEqual('ja-JP');
      expect(manager.notificationCount()).assertEqual(2);
      expect(manager.lastChangedKey()).assertEqual(KEY_LANGUAGE);
      expect(manager.currentRevision()).assertLarger(1);
      manager.set(KEY_LANGUAGE, 'ja-JP', PRIORITY_RUNTIME, SOURCE_RUNTIME);
      expect(manager.notificationCount()).assertEqual(2);
      TestLogger.pass(TAG, 'Configuration_Priority_011');
    });

    it('Configuration_Merge_012', 0, async () => {
      TestLogger.step(TAG, 'merge two configuration layers');
      const base: ConfigurationManager = new ConfigurationManager(clock);
      const incoming: ConfigurationManager = new ConfigurationManager(clock);
      incoming.set(KEY_LANGUAGE, 'en-US', PRIORITY_RUNTIME, SOURCE_RUNTIME);
      incoming.set(KEY_ORIENTATION, ORIENTATION_LANDSCAPE, PRIORITY_MEDIAQUERY,
        SOURCE_MEDIAQUERY);
      const applied: number = base.merge(incoming, PRIORITY_RUNTIME);
      expect(applied).assertLarger(1);
      expect(base.get(KEY_LANGUAGE)).assertEqual('en-US');
      expect(base.get(KEY_ORIENTATION)).assertEqual(ORIENTATION_LANDSCAPE);
      base.set(KEY_LANGUAGE, 'fr-FR', PRIORITY_FORCED, SOURCE_FORCED);
      expect(base.merge(incoming, PRIORITY_RESOURCE)).assertEqual(0);
      expect(base.get(KEY_LANGUAGE)).assertEqual('fr-FR');
      TestLogger.info(TAG, `merged entries applied=${applied}`);
      TestLogger.pass(TAG, 'Configuration_Merge_012');
    });
    it('Configuration_Snapshot_013', 0, async () => {
      TestLogger.step(TAG, 'snapshot stays frozen after later writes');
      const manager: ConfigurationManager = new ConfigurationManager(clock);
      manager.set(KEY_DEVICE_TYPE, DEVICE_PHONE, PRIORITY_RUNTIME, SOURCE_RUNTIME);
      manager.set(KEY_HOME_PAGE, PHONE_HOME_PAGE, PRIORITY_RUNTIME, SOURCE_RUNTIME);
      const snapshot: ConfigSnapshot = manager.snapshot('before-rotate');
      expect(snapshot.size()).assertEqual(2);
      expect(snapshot.revision).assertEqual(manager.currentRevision());
      expect(snapshot.valueOf(KEY_DEVICE_TYPE)).assertEqual(DEVICE_PHONE);
      manager.set(KEY_DEVICE_TYPE, DEVICE_TABLET, PRIORITY_FORCED, SOURCE_FORCED);
      expect(snapshot.valueOf(KEY_DEVICE_TYPE)).assertEqual(DEVICE_PHONE);
      expect(manager.get(KEY_DEVICE_TYPE)).assertEqual(DEVICE_TABLET);
      expect(snapshot.keys().indexOf(KEY_HOME_PAGE) >= 0).assertTrue();
      TestLogger.info(TAG, `snapshot label=${snapshot.label} size=${snapshot.size()}`);
      TestLogger.pass(TAG, 'Configuration_Snapshot_013');
    });

    it('Configuration_Snapshot_014', 0, async () => {
      TestLogger.step(TAG, 'restore returns to the captured values');
      const manager: ConfigurationManager = new ConfigurationManager(clock);
      manager.set(KEY_LANGUAGE, 'en-US', PRIORITY_RUNTIME, SOURCE_RUNTIME);
      manager.set(KEY_BREAKPOINT, BREAKPOINT_COMPACT, PRIORITY_MEDIAQUERY,
        SOURCE_MEDIAQUERY);
      const snapshot: ConfigSnapshot = manager.snapshot('baseline');
      manager.set(KEY_LANGUAGE, 'de-DE', PRIORITY_FORCED, SOURCE_FORCED);
      manager.set(KEY_LAYOUT_MODE, LAYOUT_PHONE, PRIORITY_RUNTIME, SOURCE_RUNTIME);
      expect(manager.restore(snapshot)).assertTrue();
      expect(manager.get(KEY_LANGUAGE)).assertEqual('en-US');
      expect(manager.isOverridden(KEY_LAYOUT_MODE)).assertFalse();
      expect(manager.get(KEY_BREAKPOINT)).assertEqual(BREAKPOINT_COMPACT);
      expect(manager.restore(null)).assertFalse();
      TestLogger.pass(TAG, 'Configuration_Snapshot_014');
    });

    it('Configuration_Snapshot_015', 0, async () => {
      TestLogger.step(TAG, 'snapshot ring buffer stays bounded');
      const manager: ConfigurationManager = new ConfigurationManager(clock);
      for (let index = 0; index < 20; index++) {
        manager.set(KEY_LANGUAGE, `lang-${index}`, PRIORITY_RUNTIME, SOURCE_RUNTIME);
        manager.snapshot(`round-${index}`);
      }
      expect(manager.snapshotCount()).assertEqual(MAX_SNAPSHOT_COUNT);
      const latest: ConfigSnapshot | null = manager.latestSnapshot();
      expect(latest === null).assertFalse();
      if (latest !== null) {
        expect(latest.label).assertEqual('round-19');
      }
      expect(manager.snapshot('extra').label).assertEqual('extra');
      expect(manager.snapshotCount()).assertEqual(MAX_SNAPSHOT_COUNT);
      TestLogger.pass(TAG, 'Configuration_Snapshot_015');
    });

    it('Configuration_Remove_016', 0, async () => {
      TestLogger.step(TAG, 'removing an override falls back to the default');
      const manager: ConfigurationManager = new ConfigurationManager(clock);
      manager.set(KEY_USER_AGENT, 'Mozilla/5.0 CustomAgent', PRIORITY_RUNTIME,
        SOURCE_RUNTIME);
      expect(manager.isOverridden(KEY_USER_AGENT)).assertTrue();
      const revisionBefore: number = manager.currentRevision();
      expect(manager.remove(KEY_USER_AGENT)).assertTrue();
      expect(manager.isOverridden(KEY_USER_AGENT)).assertFalse();
      expect(manager.get(KEY_USER_AGENT)).assertEqual(PAD_USER_AGENT);
      expect(manager.currentRevision()).assertLarger(revisionBefore);
      expect(manager.remove(KEY_USER_AGENT)).assertFalse();
      TestLogger.pass(TAG, 'Configuration_Remove_016');
    });

    it('Configuration_Notify_017', 0, async () => {
      TestLogger.step(TAG, 'notifications only fire on effective changes');
      const manager: ConfigurationManager = new ConfigurationManager(clock);
      const base: number = manager.notificationCount();
      manager.set(KEY_LANGUAGE, 'en-US', PRIORITY_RUNTIME, SOURCE_RUNTIME);
      expect(manager.notificationCount()).assertEqual(base + 1);
      manager.set(KEY_LANGUAGE, 'en-US', PRIORITY_RUNTIME, SOURCE_RUNTIME);
      expect(manager.notificationCount()).assertEqual(base + 1);
      manager.set(KEY_LANGUAGE, 'en-GB', PRIORITY_RUNTIME, SOURCE_RUNTIME);
      expect(manager.notificationCount()).assertEqual(base + 2);
      expect(manager.lastChangedKey()).assertEqual(KEY_LANGUAGE);
      expect(manager.overrideCount()).assertEqual(1);
      TestLogger.pass(TAG, 'Configuration_Notify_017');
    });

    it('Configuration_Subscribe_018', 0, async () => {
      TestLogger.step(TAG, 'register and drop configuration listeners');
      const manager: ConfigurationManager = new ConfigurationManager(clock);
      expect(manager.listenerCount()).assertEqual(0);
      expect(manager.subscribe('indexPage')).assertTrue();
      expect(manager.subscribe('titleBar')).assertTrue();
      expect(manager.subscribe('indexPage')).assertFalse();
      expect(manager.subscribe('')).assertFalse();
      expect(manager.listenerCount()).assertEqual(2);
      expect(manager.unsubscribe('titleBar')).assertTrue();
      expect(manager.unsubscribe('titleBar')).assertFalse();
      expect(manager.listenerCount()).assertEqual(1);
      expect(manager.has(KEY_DEVICE_TYPE)).assertTrue();
      expect(manager.getOrDefault('missingKey', 'fallback')).assertEqual('fallback');
      TestLogger.pass(TAG, 'Configuration_Subscribe_018');
    });

    it('Configuration_Apply_019', 0, async () => {
      TestLogger.step(TAG, 'apply a device type and derive the layout values');
      const manager: ConfigurationManager = new ConfigurationManager(clock);
      expect(manager.applyDeviceType(DEVICE_PHONE)).assertTrue();
      expect(manager.get(KEY_DEVICE_TYPE)).assertEqual(DEVICE_PHONE);
      expect(manager.get(KEY_USER_AGENT)).assertEqual(PHONE_USER_AGENT);
      expect(manager.get(KEY_HOME_PAGE)).assertEqual(PHONE_HOME_PAGE);
      expect(manager.get(KEY_LAYOUT_MODE)).assertEqual(LAYOUT_PHONE);
      expect(manager.get(KEY_TAB_STRIP)).assertEqual('false');
      expect(manager.resolveHomePage(DEVICE_PHONE)).assertEqual(PHONE_HOME_PAGE);
      expect(manager.applyDeviceType('unknown')).assertTrue();
      expect(manager.get(KEY_DEVICE_TYPE)).assertEqual(DEVICE_DEFAULT);
      expect(manager.get(KEY_LAYOUT_MODE)).assertEqual(LAYOUT_PAD);
      TestLogger.info(TAG, `applied config: ${manager.describeAll()}`);
      TestLogger.pass(TAG, 'Configuration_Apply_019');
    });

    it('Configuration_Orientation_020', 0, async () => {
      TestLogger.step(TAG, 'mediaquery orientation drives the breakpoint');
      const manager: ConfigurationManager = new ConfigurationManager(clock);
      expect(manager.applyOrientation(ORIENTATION_LANDSCAPE)).assertTrue();
      expect(manager.get(KEY_ORIENTATION)).assertEqual(ORIENTATION_LANDSCAPE);
      expect(manager.get(KEY_BREAKPOINT)).assertEqual(BREAKPOINT_EXPANDED);
      expect(manager.isLandscape(manager.get(KEY_ORIENTATION))).assertTrue();
      expect(manager.applyOrientation(ORIENTATION_PORTRAIT)).assertTrue();
      expect(manager.get(KEY_ORIENTATION)).assertEqual(ORIENTATION_PORTRAIT);
      expect(manager.get(KEY_BREAKPOINT)).assertEqual(BREAKPOINT_COMPACT);
      const entry: ConfigEntry | null = manager.entryOf(KEY_BREAKPOINT);
      expect(entry === null).assertFalse();
      if (entry !== null) {
        expect(entry.priority).assertEqual(PRIORITY_MEDIAQUERY);
        expect(entry.source).assertEqual(SOURCE_MEDIAQUERY);
      }
      TestLogger.pass(TAG, 'Configuration_Orientation_020');
    });

    it('Configuration_Validate_021', 0, async () => {
      TestLogger.step(TAG, 'consistency validator reports clean and dirty states');
      const manager: ConfigurationManager = new ConfigurationManager(clock);
      expect(manager.validate().length).assertEqual(0);
      manager.setDefault(KEY_NAV_COUNT, 'many');
      const issues: string[] = manager.validate();
      expect(issues.indexOf('navigation-count-invalid') >= 0).assertTrue();
      manager.setDefault(KEY_NAV_COUNT, '4');
      manager.setDefault(KEY_TAB_STRIP, 'maybe');
      expect(manager.validate().indexOf('tab-strip-invalid') >= 0).assertTrue();
      manager.setDefault(KEY_TAB_STRIP, 'true');
      manager.setDefault(KEY_ORIENTATION, 'tilted');
      expect(manager.validate().indexOf('orientation-invalid') >= 0).assertTrue();
      expect(manager.validate().length).assertEqual(1);
      TestLogger.info(TAG, `validator issues=${manager.validate().join(',')}`);
      TestLogger.pass(TAG, 'Configuration_Validate_021');
    });

    it('Configuration_Edge_022', 0, async () => {
      TestLogger.step(TAG, 'empty keys, resets and revision bookkeeping');
      const manager: ConfigurationManager = new ConfigurationManager(clock);
      expect(manager.set('', 'value')).assertFalse();
      expect(manager.set(KEY_LANGUAGE, '')).assertFalse();
      expect(manager.rejectedCount()).assertEqual(2);
      manager.set(KEY_LANGUAGE, 'en-US', PRIORITY_RUNTIME, SOURCE_RUNTIME);
      // The manager owns nine documented configuration keys.
      expect(manager.effectiveKeys().length).assertEqual(9);
      manager.clearOverrides();
      expect(manager.overrideCount()).assertEqual(0);
      expect(manager.get(KEY_LANGUAGE)).assertEqual(DEFAULT_LANGUAGE);
      manager.set(KEY_LANGUAGE, 'en-US');
      manager.resetAll();
      expect(manager.currentRevision()).assertEqual(0);
      expect(manager.snapshotCount()).assertEqual(0);
      expect(manager.notificationCount()).assertEqual(0);
      expect(manager.rejectedCount()).assertEqual(0);
      TestLogger.pass(TAG, 'Configuration_Edge_022');
    });

    it('Configuration_UI_023', 0, async () => {
      TestLogger.step(TAG, 'UI exposes the home navigation button');
      TestLogger.caseBegin(TAG, 'Configuration_UI_023');
      const exists: boolean = await waitForId(driver, ID_NAV_HOME, 2000);
      expect(exists).assertTrue();
      await serializedDelay(driver, 100);
      TestLogger.pass(TAG, 'Configuration_UI_023');
    });

    it('Configuration_UI_025', 0, async () => {
      TestLogger.step(TAG, 'UI renders the four navigation controls');
      const backExists: boolean = await componentByIdExists(driver, ID_NAV_BACK);
      const forwardExists: boolean = await componentByIdExists(driver, ID_NAV_FORWARD);
      const refreshExists: boolean = await componentByIdExists(driver, ID_NAV_REFRESH);
      const homeExists: boolean = await componentByIdExists(driver, ID_NAV_HOME);
      expect(backExists).assertTrue();
      expect(forwardExists).assertTrue();
      expect(refreshExists).assertTrue();
      expect(homeExists).assertTrue();
      const submitExists: boolean = await componentByIdExists(driver, ID_ACTION_SUBMIT);
      const addExists: boolean = await componentByIdExists(driver, ID_ACTION_ADD);
      TestLogger.info(TAG, `navigation controls verified, submit=${submitExists}`);
      expect(submitExists || addExists).assertTrue();
      TestLogger.pass(TAG, 'Configuration_UI_025');
    });
  });
}
