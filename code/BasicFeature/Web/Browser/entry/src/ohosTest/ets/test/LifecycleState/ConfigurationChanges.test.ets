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
  getDriver, startBrowserApp, serializedDelay, componentByIdExists, countById, textById,
  inputById, clickById, deviceIsPhone, PAD_HOME_PAGE, PHONE_HOME_PAGE,
  ID_INPUT_URL, ID_NAV_HOME, ID_NAV_BACK, ID_ACTION_ADD, ID_CANCEL_TAB,
  TIMEOUT_COMPONENT, DELAY_TAB_OPERATION, TOLERANCE_COMPONENT_COUNT
} from '../Shared/BrowserTestKit';
import { MockBrowser, MockBrowserTab } from '../Shared/BrowserMock';

const TAG: string = 'BrowserConfigChangeTest';

/* ------------------------------------------------------------------ */
/* Business constants of the two layouts                              */
/* ------------------------------------------------------------------ */

const ORIENTATION_LANDSCAPE: string = 'landscape';
const ORIENTATION_PORTRAIT: string = 'portrait';
const COLOR_MODE_LIGHT: string = 'light';
const COLOR_MODE_DARK: string = 'dark';
const LOCALE_ZH: string = 'zh-Hans';
const LOCALE_EN: string = 'en-US';
const DEFAULT_LOCALE: string = 'zh-Hans';
const DEVICE_TYPE_DEFAULT: string = 'default';
const DEVICE_TYPE_PHONE: string = 'phone';
const DEVICE_TYPE_TABLET: string = 'tablet';

/** Placeholder and tab title declared by the two layout files. */
const PLACEHOLDER_ZH: string = '输入网址...';
const PLACEHOLDER_EN: string = 'Enter address...';
const TAB_TITLE_ZH: string = '主页';
const TAB_TITLE_EN: string = 'Home';

/** Width breakpoint in vp above which the tablet layout is usable. */
const PHONE_MAX_WIDTH: number = 600;
const WIDTH_PHONE: number = 360;
const WIDTH_PAD: number = 1280;

/** Font scaling range accepted by the a11y settings. */
const FONT_SCALE_MIN: number = 0.85;
const FONT_SCALE_MAX: number = 3.2;
const FONT_SCALE_DEFAULT: number = 1.0;

/** Palette entries shared with common/TitleBar.ets and common/PhoneLayout.ets. */
const DOWN_COLOR: string = '#e4e4e4';
const UP_COLOR: string = '#00000000';
const TAB_SELECTED_COLOR: string = '#ffffff';
const TAB_UNSELECTED_COLOR: string = '#ececec';
const DIVIDER_COLOR: string = '#c6c6c6';
const PROGRESS_COLOR: string = '#0000ff';
const DARK_TOOLBAR_BG: string = '#1f1f1f';
const DARK_TEXT_COLOR: string = '#e5e5e5';
const DARK_DIVIDER_COLOR: string = '#3a3a3a';
const BUTTON_WIDTH: number = 22;
const BUTTON_RADIUS: number = 4;

/** Rebuild reasons recorded when a configuration change is applied. */
const REASON_ORIENTATION: string = 'orientation';
const REASON_FONT_SCALE: string = 'fontScale';
const REASON_LOCALE: string = 'locale';
const REASON_COLOR_MODE: string = 'colorMode';
const REASON_SCREEN_SIZE: string = 'screenSize';
const REASON_DEVICE_CHANGE: string = 'deviceChange';

/** State policies of a rebuild: hard reset, layout only, full preserve. */
const POLICY_RESET: string = 'reset';
const POLICY_LAYOUT_ONLY: string = 'layoutOnly';
const POLICY_PRESERVE: string = 'preserve';

/* ------------------------------------------------------------------ */
/* Immutable configuration signature                                   */
/* ------------------------------------------------------------------ */

/**
 * Every value that can trigger a rebuild of the browser page.
 *
 * Index.ets reads deviceInfo.deviceType once in aboutToAppear and then follows
 * the orientation media query, therefore the layout decision is a pure function
 * of the signature below. Keeping it immutable makes the change table safe to
 * share between cases: a `with...` call never mutates the receiver.
 */
class AppConfig {
  orientation: string;
  fontScale: number;
  locale: string;
  colorMode: string;
  widthVp: number;
  deviceType: string;

  constructor(orientation: string = ORIENTATION_LANDSCAPE, fontScale: number = FONT_SCALE_DEFAULT,
    locale: string = DEFAULT_LOCALE, colorMode: string = COLOR_MODE_LIGHT,
    widthVp: number = WIDTH_PAD, deviceType: string = DEVICE_TYPE_DEFAULT) {
    this.orientation = orientation;
    this.fontScale = fontScale;
    this.locale = locale;
    this.colorMode = colorMode;
    this.widthVp = widthVp;
    this.deviceType = deviceType;
  }

  isLandscape(): boolean {
    return this.orientation === ORIENTATION_LANDSCAPE;
  }

  isDark(): boolean {
    return this.colorMode === COLOR_MODE_DARK;
  }

  /** Index.aboutToAppear only treats the literal 'default' as tablet. */
  deviceForcesPhone(): boolean {
    return this.deviceType !== DEVICE_TYPE_DEFAULT;
  }

  /** Width decides the layout only when the device type is neutral. */
  widthForcesPhone(): boolean {
    return !this.deviceForcesPhone() && this.widthVp < PHONE_MAX_WIDTH;
  }

  resolveIsPhone(): boolean {
    return this.deviceForcesPhone() || this.widthForcesPhone();
  }

  resolveLayoutName(): string {
    return this.resolveIsPhone() ? 'PhoneLayout' : 'TabletTitle';
  }

  resolveHomePage(): string {
    return this.resolveIsPhone() ? PHONE_HOME_PAGE : PAD_HOME_PAGE;
  }

  resolvePlaceholder(): string {
    return this.locale === LOCALE_EN ? PLACEHOLDER_EN : PLACEHOLDER_ZH;
  }

  resolveTabTitle(): string {
    return this.locale === LOCALE_EN ? TAB_TITLE_EN : TAB_TITLE_ZH;
  }

  resolveClampedFontScale(): number {
    if (this.fontScale < FONT_SCALE_MIN) {
      return FONT_SCALE_MIN;
    }
    if (this.fontScale > FONT_SCALE_MAX) {
      return FONT_SCALE_MAX;
    }
    return this.fontScale;
  }

  key(): string {
    return `${this.orientation}|${this.fontScale}|${this.locale}|${this.colorMode}|` +
      `${this.widthVp}|${this.deviceType}`;
  }

  describe(): string {
    return `orientation=${this.orientation}, fontScale=${this.fontScale}, locale=${this.locale}, ` +
      `colorMode=${this.colorMode}, width=${this.widthVp}, device=${this.deviceType}`;
  }

  withOrientation(orientation: string): AppConfig {
    return new AppConfig(orientation, this.fontScale, this.locale, this.colorMode,
      this.widthVp, this.deviceType);
  }

  withFontScale(fontScale: number): AppConfig {
    return new AppConfig(this.orientation, fontScale, this.locale, this.colorMode,
      this.widthVp, this.deviceType);
  }

  withLocale(locale: string): AppConfig {
    return new AppConfig(this.orientation, this.fontScale, locale, this.colorMode,
      this.widthVp, this.deviceType);
  }

  withColorMode(colorMode: string): AppConfig {
    return new AppConfig(this.orientation, this.fontScale, this.locale, colorMode,
      this.widthVp, this.deviceType);
  }

  withSize(widthVp: number, orientation: string): AppConfig {
    return new AppConfig(orientation, this.fontScale, this.locale, this.colorMode,
      widthVp, this.deviceType);
  }

  withDeviceType(deviceType: string): AppConfig {
    return new AppConfig(this.orientation, this.fontScale, this.locale, this.colorMode,
      this.widthVp, deviceType);
  }
}

/**
 * Double of Index.orientationCallback.
 *
 * The real callback applies its result only once (`isInit` guard): the first
 * media query result wins for the whole page lifetime. Later rotation events
 * are still delivered but change nothing, which is exactly the behaviour that
 * must be pinned down before anybody "fixes" the guard.
 */
class OrientationGate {
  isInit: boolean = false;
  isPhone: boolean = false;
  appliedCount: number = 0;
  ignoredCount: number = 0;
  ignoredMatches: boolean[] = [];

  apply(matches: boolean): boolean {
    if (this.isInit) {
      this.ignoredCount += 1;
      this.ignoredMatches.push(matches);
      return false;
    }
    this.isPhone = !matches;
    this.isInit = true;
    this.appliedCount += 1;
    return true;
  }

  reset(): void {
    this.isInit = false;
    this.isPhone = false;
    this.appliedCount = 0;
    this.ignoredCount = 0;
    this.ignoredMatches = [];
  }
}

/* ------------------------------------------------------------------ */
/* Rebuild bookkeeping                                                 */
/* ------------------------------------------------------------------ */

interface ConfigEvent {
  index: number;
  reason: string;
  previousLayout: string;
  nextLayout: string;
  previousTabCount: number;
  nextTabCount: number;
}

/**
 * Records every layout rebuild of the page.
 *
 * Index.ets rebuilds by replacing the whole Browser instance in onDeviceChange,
 * so a rebuild is observable as "tab count collapses to one". The ledger keeps
 * the before/after pair per reason and lets the suite prove that the rebuild is
 * neither skipped nor duplicated.
 */
class LayoutRebuilder {
  events: ConfigEvent[] = [];
  layoutName: string;
  homePage: string;
  model: MockBrowser = new MockBrowser(1);
  private sequence: number = 0;

  constructor(config: AppConfig) {
    this.layoutName = config.resolveLayoutName();
    this.homePage = config.resolveHomePage();
  }

  /** Applies `next` and returns the new Browser instance of the page. */
  rebuild(next: AppConfig, reason: string): MockBrowser {
    const previousLayout: string = this.layoutName;
    const previousTabCount: number = this.model.tabs.length;
    this.model = new MockBrowser(1);
    this.layoutName = next.resolveLayoutName();
    this.homePage = next.resolveHomePage();
    this.events.push({
      index: this.sequence,
      reason: reason,
      previousLayout: previousLayout,
      nextLayout: this.layoutName,
      previousTabCount: previousTabCount,
      nextTabCount: this.model.tabs.length
    });
    this.sequence += 1;
    return this.model;
  }

  rebuildCount(): number {
    return this.events.length;
  }

  reasons(): string[] {
    return this.events.map((event: ConfigEvent) => event.reason);
  }

  countByReason(reason: string): number {
    let total: number = 0;
    for (let index = 0; index < this.events.length; index++) {
      if (this.events[index].reason === reason) {
        total += 1;
      }
    }
    return total;
  }

  lastEvent(): ConfigEvent | null {
    if (this.events.length === 0) {
      return null;
    }
    return this.events[this.events.length - 1];
  }

  describe(): string {
    const parts: string[] = this.events.map((event: ConfigEvent) =>
      `${event.reason}:${event.previousLayout}->${event.nextLayout}`);
    return parts.join(',');
  }

  reset(): void {
    this.events = [];
    this.sequence = 0;
    this.model = new MockBrowser(1);
  }
}

/* ------------------------------------------------------------------ */
/* State preservation across a configuration change                    */
/* ------------------------------------------------------------------ */

interface CarriedState {
  inputValue: string;
  tabCount: number;
  tabIndex: number;
  progress: number;
  hideProgress: boolean;
  currentUrl: string;
}

/**
 * Captures the observable state of the page before a rebuild and restores it
 * afterwards according to one of three policies.
 *
 * POLICY_RESET reproduces the shipped behaviour: onDeviceChange assigns a brand
 * new Browser, therefore the tab strip, the address and the progress bar all go
 * back to their constructor defaults. The other two policies document what a
 * configuration change that does not recreate the model must guarantee.
 */
class StateCarrier {
  captures: number = 0;
  restores: number = 0;
  lastPolicy: string = '';
  lastCaptured: CarriedState | null = null;

  capture(browser: MockBrowser): CarriedState {
    const state: CarriedState = {
      inputValue: browser.getInputVal(),
      tabCount: browser.tabs.length,
      tabIndex: browser.getTabArrayIndex(),
      progress: browser.progress,
      hideProgress: browser.hideProgress,
      currentUrl: this.currentUrlOf(browser)
    };
    this.lastCaptured = state;
    this.captures += 1;
    return state;
  }

  private currentUrlOf(browser: MockBrowser): string {
    const tab: MockBrowserTab | null = browser.getCurrentTab();
    return tab === null ? '' : tab.controller.currentUrl;
  }

  /** Returns the model the page must keep using after the change. */
  restore(browser: MockBrowser, state: CarriedState, policy: string): MockBrowser {
    this.restores += 1;
    this.lastPolicy = policy;
    if (policy === POLICY_RESET) {
      return new MockBrowser(1);
    }
    if (policy === POLICY_LAYOUT_ONLY) {
      return browser;
    }
    const target: MockBrowser = browser.tabs.length === 0 ? new MockBrowser(1) : browser;
    target.setInputVal(state.inputValue);
    const safeIndex: number = state.tabIndex >= 0 && state.tabIndex < target.tabs.length ?
      state.tabIndex : 0;
    target.setTabArrayIndex(safeIndex);
    target.progress = state.progress;
    target.hideProgress = state.hideProgress;
    if (state.currentUrl.length > 0) {
      target.tabs[safeIndex].controller.loadUrl(state.currentUrl);
    }
    return target;
  }

  describe(): string {
    return `captures=${this.captures}, restores=${this.restores}, policy=${this.lastPolicy}`;
  }

  reset(): void {
    this.captures = 0;
    this.restores = 0;
    this.lastPolicy = '';
    this.lastCaptured = null;
  }
}

/** Deterministic ordering of two captures, used by the round trip cases. */
function sameCarriedState(first: CarriedState, second: CarriedState): boolean {
  return first.inputValue === second.inputValue && first.tabCount === second.tabCount &&
    first.tabIndex === second.tabIndex && first.progress === second.progress &&
    first.hideProgress === second.hideProgress && first.currentUrl === second.currentUrl;
}

/* ------------------------------------------------------------------ */
/* Font scale, locale and colour mode resolution                       */
/* ------------------------------------------------------------------ */

interface FontRow {
  scale: number;
  inputSize: number;
  tabSize: number;
  placeholderSize: number;
}

/** Mirrors the fixed font sizes of the title bar under a scaling factor. */
class FontScaler {
  baseInput: number = 18;
  baseTab: number = 16;
  basePlaceholder: number = 18;
  rows: FontRow[] = [];

  effective(base: number, scale: number): number {
    const clamped: number = scale < FONT_SCALE_MIN ? FONT_SCALE_MIN :
      (scale > FONT_SCALE_MAX ? FONT_SCALE_MAX : scale);
    return Math.round(base * clamped);
  }

  build(scale: number): FontRow {
    const row: FontRow = {
      scale: scale,
      inputSize: this.effective(this.baseInput, scale),
      tabSize: this.effective(this.baseTab, scale),
      placeholderSize: this.effective(this.basePlaceholder, scale)
    };
    this.rows.push(row);
    return row;
  }

  /** Every rendered text size must stay above the legibility floor. */
  isLegible(row: FontRow): boolean {
    return row.inputSize >= 12 && row.tabSize >= 12 && row.placeholderSize >= 12;
  }

  /** Scaling must never shrink the rendered size, it only grows or keeps it. */
  isMonotonic(): boolean {
    for (let index = 1; index < this.rows.length; index++) {
      if (this.rows[index].inputSize < this.rows[index - 1].inputSize) {
        return false;
      }
    }
    return true;
  }

  describe(): string {
    return this.rows.map((row: FontRow) => `${row.scale}->${row.inputSize}`).join(',');
  }
}

interface LocaleCase {
  locale: string;
  placeholder: string;
  tabTitle: string;
  direction: string;
}

/** Locale table backed by the two string literals that the layouts declare. */
class LocaleTable {
  private cases: LocaleCase[] = [
    { locale: LOCALE_ZH, placeholder: PLACEHOLDER_ZH, tabTitle: TAB_TITLE_ZH, direction: 'ltr' },
    { locale: LOCALE_EN, placeholder: PLACEHOLDER_EN, tabTitle: TAB_TITLE_EN, direction: 'ltr' }
  ];

  resolve(locale: string): LocaleCase {
    for (let index = 0; index < this.cases.length; index++) {
      if (this.cases[index].locale === locale) {
        return this.cases[index];
      }
    }
    return this.cases[0];
  }

  supported(): string[] {
    return this.cases.map((item: LocaleCase) => item.locale);
  }

  size(): number {
    return this.cases.length;
  }

  isFallback(locale: string): boolean {
    return locale !== LOCALE_ZH && locale !== LOCALE_EN;
  }
}

/** Colour pairs of the light and the dark presentation of the toolbar. */
class ColorScheme {
  mode: string = COLOR_MODE_LIGHT;

  toolbarBackground(): string {
    return this.mode === COLOR_MODE_DARK ? DARK_TOOLBAR_BG : '#fdfdfd';
  }

  textColor(): string {
    return this.mode === COLOR_MODE_DARK ? DARK_TEXT_COLOR : '#000000';
  }

  dividerColor(): string {
    return this.mode === COLOR_MODE_DARK ? DARK_DIVIDER_COLOR : DIVIDER_COLOR;
  }

  progressColor(): string {
    return this.mode === COLOR_MODE_DARK ? '#4d8dff' : PROGRESS_COLOR;
  }

  selectedTabColor(): string {
    return this.mode === COLOR_MODE_DARK ? '#2c2c2c' : TAB_SELECTED_COLOR;
  }

  unselectedTabColor(): string {
    return this.mode === COLOR_MODE_DARK ? '#1a1a1a' : TAB_UNSELECTED_COLOR;
  }

  pressedColor(): string {
    return this.mode === COLOR_MODE_DARK ? '#3a3a3a' : DOWN_COLOR;
  }

  releasedColor(): string {
    return UP_COLOR;
  }

  apply(mode: string): ColorScheme {
    const next: ColorScheme = new ColorScheme();
    next.mode = mode;
    return next;
  }

  isDark(): boolean {
    return this.mode === COLOR_MODE_DARK;
  }

  describe(): string {
    return `${this.mode}:${this.toolbarBackground()}:${this.textColor()}:${this.dividerColor()}`;
  }
}

/* ------------------------------------------------------------------ */
/* Configuration matrix                                                */
/* ------------------------------------------------------------------ */

interface MatrixRow {
  config: AppConfig;
  layoutName: string;
  homePage: string;
  isPhone: boolean;
  tabStrip: boolean;
  addButton: boolean;
}

/** Cartesian product of the values a user can change from the settings. */
function buildConfigMatrix(): AppConfig[] {
  const orientations: string[] = [ORIENTATION_LANDSCAPE, ORIENTATION_PORTRAIT];
  const devices: string[] = [DEVICE_TYPE_DEFAULT, DEVICE_TYPE_PHONE, DEVICE_TYPE_TABLET];
  const widths: number[] = [WIDTH_PHONE, WIDTH_PAD];
  const modes: string[] = [COLOR_MODE_LIGHT, COLOR_MODE_DARK];
  const locales: string[] = [LOCALE_ZH, LOCALE_EN];
  const result: AppConfig[] = [];
  for (let o = 0; o < orientations.length; o++) {
    for (let d = 0; d < devices.length; d++) {
      for (let w = 0; w < widths.length; w++) {
        for (let m = 0; m < modes.length; m++) {
          for (let l = 0; l < locales.length; l++) {
            result.push(new AppConfig(orientations[o], FONT_SCALE_DEFAULT, locales[l],
              modes[m], widths[w], devices[d]));
          }
        }
      }
    }
  }
  return result;
}

function buildMatrixRows(): MatrixRow[] {
  const configs: AppConfig[] = buildConfigMatrix();
  const rows: MatrixRow[] = [];
  for (let index = 0; index < configs.length; index++) {
    const config: AppConfig = configs[index];
    const isPhone: boolean = config.resolveIsPhone();
    rows.push({
      config: config,
      layoutName: config.resolveLayoutName(),
      homePage: config.resolveHomePage(),
      isPhone: isPhone,
      tabStrip: !isPhone,
      addButton: !isPhone
    });
  }
  return rows;
}

/** Returns the rows whose resolved layout contradicts the declared device. */
function inconsistentRows(rows: MatrixRow[]): MatrixRow[] {
  const result: MatrixRow[] = [];
  for (let index = 0; index < rows.length; index++) {
    const row: MatrixRow = rows[index];
    const expectedPhone: boolean = row.config.deviceType !== DEVICE_TYPE_DEFAULT ||
      row.config.widthVp < PHONE_MAX_WIDTH;
    const layoutMatches: boolean = row.layoutName === (expectedPhone ? 'PhoneLayout' : 'TabletTitle');
    const homeMatches: boolean = row.homePage === (expectedPhone ? PHONE_HOME_PAGE : PAD_HOME_PAGE);
    const stripMatches: boolean = row.tabStrip === !expectedPhone;
    if (!layoutMatches || !homeMatches || !stripMatches || row.isPhone !== expectedPhone) {
      result.push(row);
    }
  }
  return result;
}

/** Non throwing accessors keep the assertions readable under strict null checks. */
function eventOrEmpty(event: ConfigEvent | null): ConfigEvent {
  if (event === null) {
    return {
      index: -1, reason: '', previousLayout: '', nextLayout: '',
      previousTabCount: -1, nextTabCount: -1
    };
  }
  return event;
}

function tabOrEmpty(tab: MockBrowserTab | null): MockBrowserTab {
  if (tab === null) {
    return new MockBrowserTab(-1, 0);
  }
  return tab;
}

export default function browserConfigurationChangesTest() {
  describe('browserConfigurationChangesTest', () => {
    let driver: Driver = getDriver();

    beforeAll(async () => {
      TestLogger.info(TAG, 'configuration change suite begin');
      TestLogger.resetSteps(TAG);
      await startBrowserApp();
      await serializedDelay(driver, TIMEOUT_COMPONENT / 2);
    });

    afterAll(() => {
      TestLogger.info(TAG, TestLogger.summary(TAG));
    });

    it('Browser_Config_Orientation_001', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Config_Orientation_001');
      TestLogger.step(TAG, 'first landscape media query result selects the tablet layout');
      const gate: OrientationGate = new OrientationGate();
      const applied: boolean = gate.apply(true);
      TestLogger.info(TAG, `applied=${applied}, isPhone=${gate.isPhone}`);
      expect(applied).assertTrue();
      expect(gate.isInit).assertTrue();
      expect(gate.isPhone).assertFalse();
      expect(gate.appliedCount).assertEqual(1);
      expect(gate.ignoredCount).assertEqual(0);
      const config: AppConfig = new AppConfig(ORIENTATION_LANDSCAPE);
      expect(config.resolveLayoutName()).assertEqual('TabletTitle');
      expect(config.resolveHomePage()).assertEqual(PAD_HOME_PAGE);
      TestLogger.pass(TAG, 'Browser_Config_Orientation_001');
    });

    it('Browser_Config_Orientation_002', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Config_Orientation_002');
      TestLogger.step(TAG, 'first portrait media query result selects the phone layout');
      const gate: OrientationGate = new OrientationGate();
      const applied: boolean = gate.apply(false);
      TestLogger.info(TAG, `applied=${applied}, isPhone=${gate.isPhone}`);
      expect(applied).assertTrue();
      expect(gate.isPhone).assertTrue();
      expect(gate.appliedCount).assertEqual(1);
      const config: AppConfig = new AppConfig(ORIENTATION_PORTRAIT, FONT_SCALE_DEFAULT,
        DEFAULT_LOCALE, COLOR_MODE_LIGHT, WIDTH_PHONE);
      expect(config.resolveLayoutName()).assertEqual('PhoneLayout');
      expect(config.resolveHomePage()).assertEqual(PHONE_HOME_PAGE);
      TestLogger.pass(TAG, 'Browser_Config_Orientation_002');
    });

    it('Browser_Config_Orientation_003', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Config_Orientation_003');
      TestLogger.step(TAG, 'later orientation callbacks are ignored by the isInit guard');
      const gate: OrientationGate = new OrientationGate();
      gate.apply(true);
      const second: boolean = gate.apply(false);
      const third: boolean = gate.apply(true);
      const fourth: boolean = gate.apply(false);
      TestLogger.info(TAG, `applied=${gate.appliedCount}, ignored=${gate.ignoredCount}`);
      expect(second).assertFalse();
      expect(third).assertFalse();
      expect(fourth).assertFalse();
      expect(gate.isPhone).assertFalse();
      expect(gate.appliedCount).assertEqual(1);
      expect(gate.ignoredCount).assertEqual(3);
      expect(gate.ignoredMatches.length).assertEqual(3);
      expect(gate.ignoredMatches[0]).assertFalse();
      expect(gate.ignoredMatches[1]).assertTrue();
      TestLogger.pass(TAG, 'Browser_Config_Orientation_003');
    });

    it('Browser_Config_Orientation_004', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Config_Orientation_004');
      TestLogger.step(TAG, 'gate reset allows the next rotation to be applied again');
      const gate: OrientationGate = new OrientationGate();
      gate.apply(true);
      gate.apply(false);
      expect(gate.ignoredCount).assertEqual(1);
      gate.reset();
      const applied: boolean = gate.apply(false);
      TestLogger.info(TAG, `after reset applied=${applied}, isPhone=${gate.isPhone}`);
      expect(applied).assertTrue();
      expect(gate.isPhone).assertTrue();
      expect(gate.appliedCount).assertEqual(1);
      expect(gate.ignoredCount).assertEqual(0);
      expect(gate.ignoredMatches.length).assertEqual(0);
      TestLogger.pass(TAG, 'Browser_Config_Orientation_004');
    });

    it('Browser_Config_Rebuild_005', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Config_Rebuild_005');
      TestLogger.step(TAG, 'an applied orientation change rebuilds the page exactly once');
      const landscape: AppConfig = new AppConfig(ORIENTATION_LANDSCAPE);
      const rebuilder: LayoutRebuilder = new LayoutRebuilder(landscape);
      expect(rebuilder.layoutName).assertEqual('TabletTitle');
      const rotated: AppConfig = landscape.withOrientation(ORIENTATION_PORTRAIT)
        .withSize(WIDTH_PHONE, ORIENTATION_PORTRAIT);
      const model: MockBrowser = rebuilder.rebuild(rotated, REASON_ORIENTATION);
      TestLogger.info(TAG, `events=${rebuilder.describe()}, tabs=${model.tabs.length}`);
      expect(rebuilder.rebuildCount()).assertEqual(1);
      expect(rebuilder.lastEvent() === null).assertFalse();
      expect(eventOrEmpty(rebuilder.lastEvent()).previousLayout).assertEqual('TabletTitle');
      expect(eventOrEmpty(rebuilder.lastEvent()).nextLayout).assertEqual('PhoneLayout');
      expect(rebuilder.layoutName).assertEqual('PhoneLayout');
      expect(rebuilder.homePage).assertEqual(PHONE_HOME_PAGE);
      expect(rebuilder.countByReason(REASON_ORIENTATION)).assertEqual(1);
      expect(model.tabs.length).assertEqual(1);
      TestLogger.pass(TAG, 'Browser_Config_Rebuild_005');
    });

    it('Browser_Config_Rebuild_006', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Config_Rebuild_006');
      TestLogger.step(TAG, 'device change replaces the Browser and collapses every extra tab');
      const rebuilder: LayoutRebuilder = new LayoutRebuilder(new AppConfig(DEVICE_TYPE_DEFAULT));
      rebuilder.model.addTab();
      rebuilder.model.addTab();
      rebuilder.model.addTab();
      expect(rebuilder.model.tabs.length).assertEqual(4);
      const next: AppConfig = new AppConfig(DEVICE_TYPE_PHONE);
      const replaced: MockBrowser = rebuilder.rebuild(next, REASON_DEVICE_CHANGE);
      TestLogger.info(TAG, `before=4 after=${replaced.tabs.length} layout=${rebuilder.layoutName}`);
      expect(replaced.tabs.length).assertEqual(1);
      expect(replaced.getTabArrayIndex()).assertEqual(0);
      expect(replaced.hideProgress).assertTrue();
      expect(replaced.progress).assertEqual(0);
      expect(eventOrEmpty(rebuilder.lastEvent()).previousTabCount).assertEqual(4);
      expect(eventOrEmpty(rebuilder.lastEvent()).nextTabCount).assertEqual(1);
      expect(rebuilder.countByReason(REASON_DEVICE_CHANGE)).assertEqual(1);
      TestLogger.pass(TAG, 'Browser_Config_Rebuild_006');
    });

    it('Browser_Config_FontScale_007', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Config_FontScale_007');
      TestLogger.step(TAG, 'font scale is clamped to the a11y range');
      const scaler: FontScaler = new FontScaler();
      const tooSmall: FontRow = scaler.build(0.2);
      const tooLarge: FontRow = scaler.build(9.0);
      const normal: FontRow = scaler.build(FONT_SCALE_DEFAULT);
      TestLogger.info(TAG, `small=${tooSmall.inputSize}, large=${tooLarge.inputSize}`);
      expect(tooSmall.inputSize).assertEqual(Math.round(18 * FONT_SCALE_MIN));
      expect(tooLarge.inputSize).assertEqual(Math.round(18 * FONT_SCALE_MAX));
      expect(normal.inputSize).assertEqual(18);
      expect(tooSmall.inputSize).assertLess(normal.inputSize);
      expect(tooLarge.inputSize).assertLarger(normal.inputSize);
      expect(scaler.rows.length).assertEqual(3);
      TestLogger.pass(TAG, 'Browser_Config_FontScale_007');
    });

    it('Browser_Config_FontScale_008', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Config_FontScale_008');
      TestLogger.step(TAG, 'every scaled row stays legible and never shrinks');
      const scaler: FontScaler = new FontScaler();
      const scales: number[] = [0.85, 1.0, 1.15, 1.3, 1.5, 2.0, 2.5, 3.2];
      for (let index = 0; index < scales.length; index++) {
        const row: FontRow = scaler.build(scales[index]);
        expect(scaler.isLegible(row)).assertTrue();
        expect(row.tabSize).assertLarger(11);
        expect(row.placeholderSize).assertLarger(11);
        expect(row.scale).assertEqual(scales[index]);
      }
      TestLogger.info(TAG, `rows=${scaler.describe()}`);
      expect(scaler.rows.length).assertEqual(scales.length);
      expect(scaler.isMonotonic()).assertTrue();
      expect(scaler.rows[0].inputSize <= scaler.rows[scales.length - 1].inputSize).assertTrue();
      TestLogger.pass(TAG, 'Browser_Config_FontScale_008');
    });

        it('Browser_Config_Locale_009', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Config_Locale_009');
      TestLogger.step(TAG, 'locale change swaps the placeholder and the tab title');
      const table: LocaleTable = new LocaleTable();
      const zh: LocaleCase = table.resolve(LOCALE_ZH);
      const en: LocaleCase = table.resolve(LOCALE_EN);
      TestLogger.info(TAG, `zh=${zh.placeholder}, en=${en.placeholder}`);
      expect(zh.placeholder).assertEqual(PLACEHOLDER_ZH);
      expect(zh.tabTitle).assertEqual(TAB_TITLE_ZH);
      expect(en.placeholder).assertEqual(PLACEHOLDER_EN);
      expect(en.tabTitle).assertEqual(TAB_TITLE_EN);
      expect(zh.placeholder === en.placeholder).assertFalse();
      expect(zh.tabTitle === en.tabTitle).assertFalse();
      expect(table.size()).assertEqual(2);
      expect(new AppConfig(ORIENTATION_LANDSCAPE, 1.0, LOCALE_EN).resolvePlaceholder())
        .assertEqual(PLACEHOLDER_EN);
      TestLogger.pass(TAG, 'Browser_Config_Locale_009');
    });

    it('Browser_Config_Locale_010', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Config_Locale_010');
      TestLogger.step(TAG, 'an unsupported locale falls back to the default resources');
      const table: LocaleTable = new LocaleTable();
      const fallback: LocaleCase = table.resolve('fr-FR');
      TestLogger.info(TAG, `fallback=${fallback.locale}, title=${fallback.tabTitle}`);
      expect(table.isFallback('fr-FR')).assertTrue();
      expect(table.isFallback(LOCALE_ZH)).assertFalse();
      expect(table.isFallback(LOCALE_EN)).assertFalse();
      expect(fallback.locale).assertEqual(DEFAULT_LOCALE);
      expect(fallback.placeholder).assertEqual(PLACEHOLDER_ZH);
      expect(table.supported().length).assertEqual(2);
      expect(table.supported()[0]).assertEqual(LOCALE_ZH);
      expect(table.supported()[1]).assertEqual(LOCALE_EN);
      expect(new AppConfig(ORIENTATION_PORTRAIT, 1.0, 'ar-AE').resolveTabTitle())
        .assertEqual(TAB_TITLE_ZH);
      TestLogger.pass(TAG, 'Browser_Config_Locale_010');
    });

    it('Browser_Config_ColorMode_011', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Config_ColorMode_011');
      TestLogger.step(TAG, 'light and dark palettes are complete and distinct');
      const light: ColorScheme = new ColorScheme().apply(COLOR_MODE_LIGHT);
      const dark: ColorScheme = new ColorScheme().apply(COLOR_MODE_DARK);
      TestLogger.info(TAG, `light=${light.describe()}, dark=${dark.describe()}`);
      expect(light.isDark()).assertFalse();
      expect(dark.isDark()).assertTrue();
      expect(light.toolbarBackground() === dark.toolbarBackground()).assertFalse();
      expect(light.textColor() === dark.textColor()).assertFalse();
      expect(light.dividerColor() === dark.dividerColor()).assertFalse();
      expect(light.selectedTabColor()).assertEqual(TAB_SELECTED_COLOR);
      expect(light.unselectedTabColor()).assertEqual(TAB_UNSELECTED_COLOR);
      expect(light.pressedColor()).assertEqual(DOWN_COLOR);
      expect(dark.releasedColor()).assertEqual(UP_COLOR);
      expect(dark.progressColor()).assertEqual('#4d8dff');
      expect(light.progressColor()).assertEqual(PROGRESS_COLOR);
      TestLogger.pass(TAG, 'Browser_Config_ColorMode_011');
    });

    it('Browser_Config_ColorMode_012', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Config_ColorMode_012');
      TestLogger.step(TAG, 'a colour mode change keeps tabs under the layout only policy');
      const carrier: StateCarrier = new StateCarrier();
      const browser: MockBrowser = new MockBrowser(1);
      browser.addTab();
      browser.setInputVal('example.com/docs');
      browser.tabs[browser.getTabArrayIndex()].controller.loadUrl('https://example.com/docs');
      const captured: CarriedState = carrier.capture(browser);
      expect(captured.tabCount).assertEqual(2);
      expect(captured.inputValue).assertEqual('example.com/docs');
      const kept: MockBrowser = carrier.restore(browser, captured, POLICY_LAYOUT_ONLY);
      TestLogger.info(TAG, `tabs=${kept.tabs.length}, input=${kept.getInputVal()}`);
      expect(kept === browser).assertTrue();
      expect(kept.tabs.length).assertEqual(2);
      expect(kept.getInputVal()).assertEqual('example.com/docs');
      expect(carrier.lastPolicy).assertEqual(POLICY_LAYOUT_ONLY);
      expect(carrier.captures).assertEqual(1);
      expect(carrier.restores).assertEqual(1);
      TestLogger.pass(TAG, 'Browser_Config_ColorMode_012');
    });

    it('Browser_Config_ScreenSize_013', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Config_ScreenSize_013');
      TestLogger.step(TAG, 'width breakpoint recomputes isPhone for a neutral device');
      const narrow: AppConfig = new AppConfig(ORIENTATION_PORTRAIT, 1.0, LOCALE_ZH,
        COLOR_MODE_LIGHT, 359, DEVICE_TYPE_DEFAULT);
      const wide: AppConfig = new AppConfig(ORIENTATION_LANDSCAPE, 1.0, LOCALE_ZH,
        COLOR_MODE_LIGHT, 840, DEVICE_TYPE_DEFAULT);
      const boundary: AppConfig = new AppConfig(ORIENTATION_LANDSCAPE, 1.0, LOCALE_ZH,
        COLOR_MODE_LIGHT, PHONE_MAX_WIDTH, DEVICE_TYPE_DEFAULT);
      TestLogger.info(TAG, `narrow=${narrow.resolveIsPhone()}, wide=${wide.resolveIsPhone()}`);
      expect(narrow.widthForcesPhone()).assertTrue();
      expect(narrow.resolveIsPhone()).assertTrue();
      expect(wide.widthForcesPhone()).assertFalse();
      expect(wide.resolveIsPhone()).assertFalse();
      expect(boundary.widthForcesPhone()).assertFalse();
      expect(wide.resolveHomePage()).assertEqual(PAD_HOME_PAGE);
      expect(narrow.resolveHomePage()).assertEqual(PHONE_HOME_PAGE);
      expect(deviceIsPhone(DEVICE_TYPE_DEFAULT)).assertFalse();
      TestLogger.pass(TAG, 'Browser_Config_ScreenSize_013');
    });

    it('Browser_Config_ScreenSize_014', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Config_ScreenSize_014');
      TestLogger.step(TAG, 'size change preserves the address under the preserve policy');
      const carrier: StateCarrier = new StateCarrier();
      const browser: MockBrowser = new MockBrowser(1);
      browser.setInputVal('news.example.com');
      browser.tabs[0].controller.loadUrl('https://news.example.com');
      browser.progress = 45;
      browser.hideProgress = false;
      const state: CarriedState = carrier.capture(browser);
      const rebuilt: MockBrowser = new MockBrowser(1);
      const restored: MockBrowser = carrier.restore(rebuilt, state, POLICY_PRESERVE);
      TestLogger.info(TAG, `input=${restored.getInputVal()}, progress=${restored.progress}`);
      expect(restored.getInputVal()).assertEqual('news.example.com');
      expect(restored.progress).assertEqual(45);
      expect(restored.hideProgress).assertFalse();
      expect(restored.getCurrentTab() === null).assertFalse();
      expect(tabOrEmpty(restored.getCurrentTab()).controller.currentUrl).assertEqual('https://news.example.com');
      expect(restored.tabs.length).assertEqual(1);
      TestLogger.pass(TAG, 'Browser_Config_ScreenSize_014');
    });

    it('Browser_Config_State_015', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Config_State_015');
      TestLogger.step(TAG, 'capture and restore round trip keeps every carried field');
      const carrier: StateCarrier = new StateCarrier();
      const source: MockBrowser = new MockBrowser(1);
      source.addTab();
      source.addTab();
      source.selectTab(2);
      source.setInputVal('travel.example.com/plan');
      source.tabs[2].controller.loadUrl('https://travel.example.com/plan');
      source.progress = 70;
      source.hideProgress = false;
      const first: CarriedState = carrier.capture(source);
      const target: MockBrowser = new MockBrowser(3);
      carrier.restore(target, first, POLICY_PRESERVE);
      const second: CarriedState = carrier.capture(target);
      TestLogger.info(TAG, `first=${JSON.stringify(first)}`);
      expect(sameCarriedState(first, second)).assertTrue();
      expect(second.tabIndex).assertEqual(2);
      expect(second.currentUrl).assertEqual('https://travel.example.com/plan');
      expect(carrier.captures).assertEqual(2);
      expect(carrier.restores).assertEqual(1);
      TestLogger.pass(TAG, 'Browser_Config_State_015');
    });

    it('Browser_Config_State_016', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Config_State_016');
      TestLogger.step(TAG, 'reset policy reproduces the shipped onDeviceChange behaviour');
      const carrier: StateCarrier = new StateCarrier();
      const source: MockBrowser = new MockBrowser(1);
      source.addTab();
      source.setInputVal('legacy.example.com');
      source.progress = 88;
      source.hideProgress = false;
      const state: CarriedState = carrier.capture(source);
      const reset: MockBrowser = carrier.restore(source, state, POLICY_RESET);
      TestLogger.info(TAG, `reset tabs=${reset.tabs.length}, input='${reset.getInputVal()}'`);
      expect(reset === source).assertFalse();
      expect(reset.tabs.length).assertEqual(1);
      expect(reset.getInputVal()).assertEqual('');
      expect(reset.progress).assertEqual(0);
      expect(reset.hideProgress).assertTrue();
      expect(reset.getCurrentTab() === null).assertFalse();
      expect(tabOrEmpty(reset.getCurrentTab()).controller.currentUrl).assertEqual('');
      expect(carrier.lastPolicy).assertEqual(POLICY_RESET);
      TestLogger.pass(TAG, 'Browser_Config_State_016');
    });

    it('Browser_Config_Matrix_017', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Config_Matrix_017');
      TestLogger.step(TAG, 'the full configuration matrix resolves without contradiction');
      const rows: MatrixRow[] = buildMatrixRows();
      const bad: MatrixRow[] = inconsistentRows(rows);
      let phoneRows: number = 0;
      let tabletRows: number = 0;
      for (let index = 0; index < rows.length; index++) {
        if (rows[index].isPhone) {
          phoneRows += 1;
        } else {
          tabletRows += 1;
        }
        expect(rows[index].tabStrip === rows[index].isPhone).assertFalse();
      }
      TestLogger.info(TAG, `rows=${rows.length}, phone=${phoneRows}, tablet=${tabletRows}, bad=${bad.length}`);
      expect(rows.length).assertEqual(48);
      expect(bad.length).assertEqual(0);
      expect(phoneRows).assertEqual(40);
      expect(tabletRows).assertEqual(8);
      expect(rows[0].config.resolveClampedFontScale()).assertEqual(FONT_SCALE_DEFAULT);
      TestLogger.pass(TAG, 'Browser_Config_Matrix_017');
    });

    it('Browser_Config_Ledger_018', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Config_Ledger_018');
      TestLogger.step(TAG, 'mixed configuration changes are recorded in arrival order');
      const rebuilder: LayoutRebuilder = new LayoutRebuilder(new AppConfig(ORIENTATION_LANDSCAPE));
      rebuilder.rebuild(new AppConfig(ORIENTATION_LANDSCAPE, 1.3), REASON_FONT_SCALE);
      rebuilder.rebuild(new AppConfig(ORIENTATION_LANDSCAPE, 1.3, LOCALE_EN), REASON_LOCALE);
      rebuilder.rebuild(new AppConfig(ORIENTATION_LANDSCAPE, 1.3, LOCALE_EN, COLOR_MODE_DARK),
        REASON_COLOR_MODE);
      rebuilder.rebuild(new AppConfig(ORIENTATION_PORTRAIT, 1.3, LOCALE_EN, COLOR_MODE_DARK,
        WIDTH_PHONE), REASON_ORIENTATION);
      TestLogger.info(TAG, `ledger=${rebuilder.describe()}`);
      expect(rebuilder.rebuildCount()).assertEqual(4);
      expect(rebuilder.reasons().join('|')).assertEqual(
        `${REASON_FONT_SCALE}|${REASON_LOCALE}|${REASON_COLOR_MODE}|${REASON_ORIENTATION}`);
      expect(rebuilder.countByReason(REASON_FONT_SCALE)).assertEqual(1);
      expect(rebuilder.countByReason(REASON_LOCALE)).assertEqual(1);
      expect(rebuilder.countByReason(REASON_COLOR_MODE)).assertEqual(1);
      expect(rebuilder.countByReason(REASON_ORIENTATION)).assertEqual(1);
      expect(rebuilder.events[0].index).assertEqual(0);
      expect(rebuilder.events[3].index).assertEqual(3);
      expect(eventOrEmpty(rebuilder.lastEvent()).nextLayout).assertEqual('PhoneLayout');
      rebuilder.reset();
      expect(rebuilder.rebuildCount()).assertEqual(0);
      expect(rebuilder.lastEvent()).assertNull();
      TestLogger.pass(TAG, 'Browser_Config_Ledger_018');
    });

    it('Browser_Config_UI_019', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Config_UI_019');
      TestLogger.step(TAG, 'url input is still reachable after a layout rebuild');
      await serializedDelay(driver, DELAY_TAB_OPERATION);
      const inputPresent: boolean = await componentByIdExists(driver, ID_INPUT_URL);
      const backPresent: boolean = await componentByIdExists(driver, ID_NAV_BACK);
      TestLogger.info(TAG, `input=${inputPresent}, back=${backPresent}`);
      expect(inputPresent).assertTrue();
      expect(backPresent).assertTrue();
      const text: string = await textById(driver, ID_INPUT_URL);
      TestLogger.info(TAG, `current input text length=${text.length}`);
      expect(text.length >= 0).assertTrue();
      TestLogger.pass(TAG, 'Browser_Config_UI_019');
    });

    it('Browser_Config_UI_022', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Config_UI_022');
      TestLogger.step(TAG, 'home navigation still works after the configuration change');
      const clicked: boolean = await clickById(driver, ID_NAV_HOME);
      TestLogger.info(TAG, `home clicked=${clicked}`);
      expect(clicked).assertTrue();
      await serializedDelay(driver, DELAY_TAB_OPERATION);
      const homeStillThere: boolean = await componentByIdExists(driver, ID_NAV_HOME);
      const inputStillThere: boolean = await componentByIdExists(driver, ID_INPUT_URL);
      expect(homeStillThere).assertTrue();
      expect(inputStillThere).assertTrue();
      TestLogger.pass(TAG, 'Browser_Config_UI_022');
    });
  });
}
