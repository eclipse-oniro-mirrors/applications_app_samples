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
  getDriver, startBrowserApp, serializedDelay, componentByIdExists, countById,
  clickById, deviceIsPhone, PAD_HOME_PAGE, PHONE_HOME_PAGE, MAX_TAB_COUNT,
  ID_INPUT_URL, ID_NAV_HOME, ID_ACTION_ADD, ID_CANCEL_TAB, TIMEOUT_COMPONENT
} from '../Shared/BrowserTestKit';
import { MockBrowser, MockBrowserTab } from '../Shared/BrowserMock';

const TAG: string = 'BrowserCompatibilityTest';

/** Desktop user agent handed to the Web component on the tablet layout. */
const PAD_USER_AGENT: string =
  'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.105 Safari/537.36';

/** Mobile user agent handed to the Web component on the phone layout. */
const PHONE_USER_AGENT: string = 'SampleBrowser/12.0.4.1';

/** deviceType values that shipped products report through @ohos.deviceInfo. */
const DEVICE_TYPE_DEFAULT: string = 'default';
const DEVICE_TYPE_PHONE: string = 'phone';
const DEVICE_TYPE_TABLET: string = 'tablet';
const DEVICE_TYPE_WEARABLE: string = 'wearable';
const DEVICE_TYPE_TV: string = 'tv';
const DEVICE_TYPE_CAR: string = 'car';

/** Screen width buckets used by OpenHarmony responsive layouts, in vp. */
const WIDTH_SMALL_MAX: number = 320;
const WIDTH_MEDIUM_MAX: number = 600;
const WIDTH_LARGE_MAX: number = 840;

/** Capability names gated by the runtime API level. */
const CAP_MEDIA_QUERY: string = 'mediaquery';
const CAP_JS_PROXY: string = 'javascriptProxy';
const CAP_NEW_WINDOW: string = 'windowNew';
const CAP_WEBVIEW: string = 'webview';
const CAP_TAB_STRIP: string = 'tabStrip';

/** Minimum API level of the sample: every newer capability is optional. */
const BASELINE_API_LEVEL: number = 9;

/**
 * One row of the compatibility matrix.
 *
 * Index.ets only compares deviceInfo.deviceType against 'default', therefore
 * every non default deviceType - including tablet, tv, wearable and car -
 * resolves to the phone layout with phone.html and the mobile user agent.
 */
class CompatProfile {
  deviceType: string;
  isPhone: boolean;
  layoutName: string;
  homePage: string;
  userAgent: string;
  tabStripVisible: boolean;

  constructor(deviceType: string) {
    this.deviceType = deviceType;
    this.isPhone = deviceIsPhone(deviceType);
    this.layoutName = this.isPhone ? 'PhoneLayout' : 'TabletTitle';
    this.homePage = this.isPhone ? PHONE_HOME_PAGE : PAD_HOME_PAGE;
    this.userAgent = this.isPhone ? PHONE_USER_AGENT : PAD_USER_AGENT;
    this.tabStripVisible = !this.isPhone;
  }

  /** Home navigation always renders the rawfile page of the active form. */
  homeUrl(): string {
    return 'resource://rawfile/' + this.homePage;
  }

  /** Only the tablet title bar owns the tab close strip. */
  supportsTabStrip(): boolean {
    return this.tabStripVisible;
  }

  /** Both layouts receive the windowNew callback from the Web component. */
  supportsNewWindow(): boolean {
    return true;
  }

  /** True when the layout uses the desktop UA. */
  usesDesktopUserAgent(): boolean {
    return this.userAgent === PAD_USER_AGENT;
  }

  describe(): string {
    return `${this.deviceType}:${this.layoutName}`;
  }
}

/** Physical screen description used by the responsive assertions. */
class ScreenSpec {
  widthVp: number;
  heightVp: number;
  densityDpi: number;

  constructor(widthVp: number, heightVp: number, densityDpi: number = 320) {
    this.widthVp = widthVp;
    this.heightVp = heightVp;
    this.densityDpi = densityDpi;
  }

  isLandscape(): boolean {
    return this.widthVp > this.heightVp;
  }

  isPortrait(): boolean {
    return this.heightVp >= this.widthVp;
  }

  /** Responsive bucket derived from the shortest usable width. */
  category(): string {
    const shortestSide: number = Math.min(this.widthVp, this.heightVp);
    if (shortestSide <= WIDTH_SMALL_MAX) {
      return 'small';
    }
    if (shortestSide <= WIDTH_MEDIUM_MAX) {
      return 'medium';
    }
    if (shortestSide <= WIDTH_LARGE_MAX) {
      return 'large';
    }
    return 'xlarge';
  }

  /** Density bucket of the display, as used by resource qualifiers. */
  densityBucket(): string {
    if (this.densityDpi <= 160) {
      return 'mdpi';
    }
    if (this.densityDpi <= 240) {
      return 'hdpi';
    }
    if (this.densityDpi <= 320) {
      return 'xhdpi';
    }
    return 'xxhdpi';
  }

  /** Rotation keeps the diagonal but swaps the two axes. */
  rotated(): ScreenSpec {
    return new ScreenSpec(this.heightVp, this.widthVp, this.densityDpi);
  }

  diagonal(): number {
    return Math.sqrt(this.widthVp * this.widthVp + this.heightVp * this.heightVp);
  }
}

/** Row contract of the compatibility matrix table. */
interface CompatRow {
  deviceType: string;
  expectPhone: boolean;
  homePage: string;
  desktopAgent: boolean;
}

function buildMatrix(): CompatRow[] {
  return [
    { deviceType: DEVICE_TYPE_DEFAULT, expectPhone: false, homePage: PAD_HOME_PAGE, desktopAgent: true },
    { deviceType: DEVICE_TYPE_PHONE, expectPhone: true, homePage: PHONE_HOME_PAGE, desktopAgent: false },
    { deviceType: DEVICE_TYPE_TABLET, expectPhone: true, homePage: PHONE_HOME_PAGE, desktopAgent: false },
    { deviceType: DEVICE_TYPE_WEARABLE, expectPhone: true, homePage: PHONE_HOME_PAGE, desktopAgent: false },
    { deviceType: DEVICE_TYPE_TV, expectPhone: true, homePage: PHONE_HOME_PAGE, desktopAgent: false },
    { deviceType: DEVICE_TYPE_CAR, expectPhone: true, homePage: PHONE_HOME_PAGE, desktopAgent: false }
  ];
}

/**
 * Runtime capability gate.
 *
 * The sample targets API 9. A device that reports an older level must still be
 * able to browse: the Web component stays mandatory while the optional
 * capabilities (media query listener, JavaScript proxy, windowNew) degrade to
 * no-ops instead of breaking the page.
 */
class ApiGate {
  apiLevel: number;

  constructor(apiLevel: number) {
    this.apiLevel = apiLevel;
  }

  isBaseline(): boolean {
    return this.apiLevel >= BASELINE_API_LEVEL;
  }

  supports(capability: string): boolean {
    if (capability === CAP_WEBVIEW) {
      return true;
    }
    if (capability === CAP_TAB_STRIP) {
      return this.apiLevel >= BASELINE_API_LEVEL;
    }
    return this.isBaseline();
  }

  /** Capabilities silently unavailable below the baseline. */
  degradedCapabilities(): string[] {
    const all: string[] = [CAP_MEDIA_QUERY, CAP_JS_PROXY, CAP_NEW_WINDOW];
    if (this.isBaseline()) {
      return [];
    }
    return all.slice(0);
  }

  /** The browser keeps the core navigation contract on every API level. */
  canBrowse(): boolean {
    return this.supports(CAP_WEBVIEW);
  }
}

/** Builds the profile of every device type of the matrix. */
function buildProfiles(): CompatProfile[] {
  const rows: CompatRow[] = buildMatrix();
  const profiles: CompatProfile[] = [];
  for (let index = 0; index < rows.length; index++) {
    profiles.push(new CompatProfile(rows[index].deviceType));
  }
  return profiles;
}

/** Selects the rawfile entry page for a device type. */
function selectHomePage(deviceType: string): string {
  return deviceIsPhone(deviceType) ? PHONE_HOME_PAGE : PAD_HOME_PAGE;
}

/** Selects the user agent for a device type. */
function selectUserAgent(deviceType: string): string {
  return deviceIsPhone(deviceType) ? PHONE_USER_AGENT : PAD_USER_AGENT;
}

/** Feature list registered through registerJavaScriptProxy in TitleBar.ets. */
function jsProxyMethods(): string[] {
  return ['test', 'searchWord'];
}

/**
 * Aggregates the matrix so a single assertion can guard the whole table.
 *
 * The audit is requestionally derived from the matrix instead of hard coded
 * counts: adding a new deviceType row must not silently break the suite.
 */
class CompatAudit {
  profiles: CompatProfile[];

  constructor(deviceTypes: string[]) {
    this.profiles = [];
    for (let index = 0; index < deviceTypes.length; index++) {
      this.profiles.push(new CompatProfile(deviceTypes[index]));
    }
  }

  phoneCount(): number {
    let total: number = 0;
    for (let index = 0; index < this.profiles.length; index++) {
      if (this.profiles[index].isPhone) {
        total += 1;
      }
    }
    return total;
  }

  tabletCount(): number {
    return this.profiles.length - this.phoneCount();
  }

  desktopAgentCount(): number {
    let total: number = 0;
    for (let index = 0; index < this.profiles.length; index++) {
      if (this.profiles[index].usesDesktopUserAgent()) {
        total += 1;
      }
    }
    return total;
  }

  homePages(): string[] {
    const result: string[] = [];
    for (let index = 0; index < this.profiles.length; index++) {
      if (result.indexOf(this.profiles[index].homePage) < 0) {
        result.push(this.profiles[index].homePage);
      }
    }
    return result;
  }

  describe(): string {
    return `rows=${this.profiles.length},phone=${this.phoneCount()},tablet=${this.tabletCount()}`;
  }
}

/** All deviceType values exercised by the compatibility matrix. */
function allDeviceTypes(): string[] {
  return [
    DEVICE_TYPE_DEFAULT, DEVICE_TYPE_PHONE, DEVICE_TYPE_TABLET,
    DEVICE_TYPE_WEARABLE, DEVICE_TYPE_TV, DEVICE_TYPE_CAR
  ];
}

export default function browserCompatibilityTest() {
  describe('browserCompatibilityTest', () => {
    let driver: Driver = getDriver();

    beforeAll(async () => {
      TestLogger.info(TAG, 'compatibility matrix suite begin');
      await startBrowserApp();
      await serializedDelay(driver, TIMEOUT_COMPONENT / 2);
    });

    afterAll(() => {
      TestLogger.info(TAG, TestLogger.summary(TAG));
    });

    it('Browser_Integration_Compat_001', 0, async () => {
      TestLogger.step(TAG, 'deviceType default resolves to the tablet layout');
      const profile: CompatProfile = new CompatProfile(DEVICE_TYPE_DEFAULT);
      expect(profile.isPhone).assertFalse();
      expect(profile.layoutName).assertEqual('TabletTitle');
      expect(profile.homePage).assertEqual(PAD_HOME_PAGE);
      expect(profile.userAgent).assertEqual(PAD_USER_AGENT);
      expect(profile.supportsTabStrip()).assertTrue();
      expect(profile.describe()).assertEqual('default:TabletTitle');
    });

    it('Browser_Integration_Compat_002', 0, async () => {
      TestLogger.step(TAG, 'deviceType phone resolves to the phone layout');
      const profile: CompatProfile = new CompatProfile(DEVICE_TYPE_PHONE);
      expect(profile.isPhone).assertTrue();
      expect(profile.layoutName).assertEqual('PhoneLayout');
      expect(profile.homePage).assertEqual(PHONE_HOME_PAGE);
      expect(profile.userAgent).assertEqual(PHONE_USER_AGENT);
      expect(profile.supportsTabStrip()).assertFalse();
      expect(profile.usesDesktopUserAgent()).assertFalse();
    });

    it('Browser_Integration_Compat_003', 0, async () => {
      TestLogger.step(TAG, 'deviceType tablet still uses the phone layout');
      const profile: CompatProfile = new CompatProfile(DEVICE_TYPE_TABLET);
      expect(profile.isPhone).assertTrue();
      expect(profile.homePage).assertEqual(PHONE_HOME_PAGE);
      expect(selectHomePage(DEVICE_TYPE_TABLET)).assertEqual(PHONE_HOME_PAGE);
      expect(selectUserAgent(DEVICE_TYPE_TABLET)).assertEqual(PHONE_USER_AGENT);
      expect(deviceIsPhone(DEVICE_TYPE_TABLET)).assertTrue();
    });

    it('Browser_Integration_Compat_004', 0, async () => {
      TestLogger.step(TAG, 'wearable devices fall back to the phone layout');
      const profile: CompatProfile = new CompatProfile(DEVICE_TYPE_WEARABLE);
      expect(profile.isPhone).assertTrue();
      expect(profile.layoutName).assertEqual('PhoneLayout');
      expect(profile.homeUrl()).assertEqual('resource://rawfile/phone.html');
      expect(profile.supportsNewWindow()).assertTrue();
    });

    it('Browser_Integration_Compat_005', 0, async () => {
      TestLogger.step(TAG, 'television devices fall back to the phone layout');
      const profile: CompatProfile = new CompatProfile(DEVICE_TYPE_TV);
      expect(profile.isPhone).assertTrue();
      expect(profile.homePage).assertEqual('phone.html');
      expect(profile.userAgent.indexOf('SampleBrowser')).assertEqual(0);
      expect(profile.userAgent.indexOf('Chrome/92')).assertEqual(-1);
    });

    it('Browser_Integration_Compat_006', 0, async () => {
      TestLogger.step(TAG, 'car devices fall back to the phone layout');
      const profile: CompatProfile = new CompatProfile(DEVICE_TYPE_CAR);
      expect(profile.isPhone).assertTrue();
      expect(profile.layoutName).assertEqual('PhoneLayout');
      expect(profile.tabStripVisible).assertFalse();
      expect(profile.homeUrl()).assertEqual('resource://rawfile/phone.html');
    });

    it('Browser_Integration_Compat_007', 0, async () => {
      TestLogger.step(TAG, 'full matrix keeps exactly one tablet layout row');
      const profiles: CompatProfile[] = buildProfiles();
      expect(profiles.length).assertEqual(6);
      let tabletRows: number = 0;
      let phoneRows: number = 0;
      for (let index = 0; index < profiles.length; index++) {
        if (profiles[index].isPhone) {
          phoneRows += 1;
        } else {
          tabletRows += 1;
        }
        TestLogger.info(TAG, `row ${profiles[index].describe()}`);
      }
      expect(tabletRows).assertEqual(1);
      expect(phoneRows).assertEqual(5);
    });

    it('Browser_Integration_Compat_008', 0, async () => {
      TestLogger.step(TAG, 'pad user agent advertises a desktop chrome build');
      const profile: CompatProfile = new CompatProfile(DEVICE_TYPE_DEFAULT);
      expect(profile.userAgent).assertEqual(PAD_USER_AGENT);
      expect(profile.userAgent.indexOf('Windows NT 10.0')).assertLarger(0);
      expect(profile.userAgent.indexOf('AppleWebKit')).assertLarger(0);
      expect(profile.userAgent.indexOf('Chrome/92.0.4515.105')).assertLarger(0);
      expect(profile.userAgent.indexOf('SampleBrowser')).assertEqual(-1);
      expect(profile.usesDesktopUserAgent()).assertTrue();
    });

    it('Browser_Integration_Compat_009', 0, async () => {
      TestLogger.step(TAG, 'phone user agent keeps the SampleBrowser token');
      const profile: CompatProfile = new CompatProfile(DEVICE_TYPE_PHONE);
      expect(profile.userAgent).assertEqual(PHONE_USER_AGENT);
      expect(profile.userAgent.indexOf('Windows NT')).assertEqual(-1);
      expect(profile.userAgent.length).assertLess(PAD_USER_AGENT.length);
      expect(selectUserAgent(DEVICE_TYPE_PHONE)).assertEqual(PHONE_USER_AGENT);
    });

    it('Browser_Integration_Compat_010', 0, async () => {
      TestLogger.step(TAG, 'home page picks pad.html or phone.html per form factor');
      const pad: CompatProfile = new CompatProfile(DEVICE_TYPE_DEFAULT);
      const phone: CompatProfile = new CompatProfile(DEVICE_TYPE_PHONE);
      expect(pad.homePage).assertEqual('pad.html');
      expect(phone.homePage).assertEqual('phone.html');
      expect(pad.homePage === phone.homePage).assertFalse();
      expect(pad.homeUrl()).assertEqual('resource://rawfile/pad.html');
      expect(selectHomePage(DEVICE_TYPE_CAR)).assertEqual('phone.html');
    });

    it('Browser_Integration_Compat_011', 0, async () => {
      TestLogger.step(TAG, 'screen width buckets honour the responsive thresholds');
      const small: ScreenSpec = new ScreenSpec(320, 480);
      const medium: ScreenSpec = new ScreenSpec(480, 800);
      const large: ScreenSpec = new ScreenSpec(840, 1180);
      const xlarge: ScreenSpec = new ScreenSpec(1280, 1600);
      expect(small.category()).assertEqual('small');
      expect(medium.category()).assertEqual('medium');
      expect(large.category()).assertEqual('large');
      expect(xlarge.category()).assertEqual('xlarge');
      expect(new ScreenSpec(321, 480).category()).assertEqual('medium');
    });

    it('Browser_Integration_Compat_012', 0, async () => {
      TestLogger.step(TAG, 'landscape and portrait are decided by the axis order');
      const landscape: ScreenSpec = new ScreenSpec(1280, 800);
      const portrait: ScreenSpec = new ScreenSpec(800, 1280);
      expect(landscape.isLandscape()).assertTrue();
      expect(landscape.isPortrait()).assertFalse();
      expect(portrait.isPortrait()).assertTrue();
      expect(portrait.isLandscape()).assertFalse();
      expect(new ScreenSpec(800, 800).isPortrait()).assertTrue();
      expect(landscape.rotated().isPortrait()).assertTrue();
      expect(landscape.rotated().widthVp).assertEqual(800);
    });

    it('Browser_Integration_Compat_013', 0, async () => {
      TestLogger.step(TAG, 'density buckets map dpi ranges to resource qualifiers');
      expect(new ScreenSpec(400, 800, 160).densityBucket()).assertEqual('mdpi');
      expect(new ScreenSpec(400, 800, 240).densityBucket()).assertEqual('hdpi');
      expect(new ScreenSpec(400, 800, 320).densityBucket()).assertEqual('xhdpi');
      expect(new ScreenSpec(400, 800, 480).densityBucket()).assertEqual('xxhdpi');
      expect(new ScreenSpec(400, 800, 480).diagonal() > new ScreenSpec(400, 800, 160).diagonal()).assertFalse();
    });

    it('Browser_Integration_Compat_014', 0, async () => {
      TestLogger.step(TAG, 'API 9 baseline exposes every optional capability');
      const gate: ApiGate = new ApiGate(BASELINE_API_LEVEL);
      expect(gate.isBaseline()).assertTrue();
      expect(gate.supports(CAP_MEDIA_QUERY)).assertTrue();
      expect(gate.supports(CAP_JS_PROXY)).assertTrue();
      expect(gate.supports(CAP_NEW_WINDOW)).assertTrue();
      expect(gate.supports(CAP_WEBVIEW)).assertTrue();
      expect(gate.degradedCapabilities().length).assertEqual(0);
      expect(gate.canBrowse()).assertTrue();
    });

    it('Browser_Integration_Compat_015', 0, async () => {
      TestLogger.step(TAG, 'older API levels degrade optional capabilities');
      const gate: ApiGate = new ApiGate(8);
      expect(gate.isBaseline()).assertFalse();
      expect(gate.supports(CAP_MEDIA_QUERY)).assertFalse();
      expect(gate.supports(CAP_JS_PROXY)).assertFalse();
      expect(gate.supports(CAP_NEW_WINDOW)).assertFalse();
      expect(gate.degradedCapabilities().length).assertEqual(3);
      expect(gate.degradedCapabilities()[0]).assertEqual(CAP_MEDIA_QUERY);
    });

    it('Browser_Integration_Compat_016', 0, async () => {
      TestLogger.step(TAG, 'degradation keeps the core web view usable');
      const degraded: ApiGate = new ApiGate(8);
      const baseline: ApiGate = new ApiGate(BASELINE_API_LEVEL);
      expect(degraded.canBrowse()).assertTrue();
      expect(baseline.canBrowse()).assertTrue();
      expect(degraded.supports(CAP_WEBVIEW)).assertEqual(baseline.supports(CAP_WEBVIEW));
      expect(degraded.supports(CAP_TAB_STRIP)).assertFalse();
      expect(new ApiGate(12).supports(CAP_TAB_STRIP)).assertTrue();
    });

    it('Browser_Integration_Compat_017', 0, async () => {
      TestLogger.step(TAG, 'tab strip exists only on the tablet layout');
      const tablet: CompatProfile = new CompatProfile(DEVICE_TYPE_DEFAULT);
      const all: CompatProfile[] = buildProfiles();
      expect(tablet.supportsTabStrip()).assertTrue();
      let stripRows: number = 0;
      for (let index = 0; index < all.length; index++) {
        if (all[index].supportsTabStrip()) {
          stripRows += 1;
        }
      }
      expect(stripRows).assertEqual(1);
      expect(all[0].supportsTabStrip()).assertTrue();
      expect(all[1].supportsTabStrip()).assertFalse();
    });

    it('Browser_Integration_Compat_018', 0, async () => {
      TestLogger.step(TAG, 'windowNew callback is wired on every layout');
      const all: CompatProfile[] = buildProfiles();
      for (let index = 0; index < all.length; index++) {
        expect(all[index].supportsNewWindow()).assertTrue();
        expect(all[index].homePage.length).assertLarger(4);
      }
      const browser: MockBrowser = new MockBrowser();
      browser.loadUrl('www.sample.com');
      expect(browser.onWindowNew('https://developer.sample.com')).assertTrue();
      expect(browser.onWindowNew('about:blank')).assertFalse();
    });

    it('Browser_Integration_Compat_019', 0, async () => {
      TestLogger.step(TAG, 'javascript proxy contract stays stable across layouts');
      const methods: string[] = jsProxyMethods();
      expect(methods.length).assertEqual(2);
      expect(methods[0]).assertEqual('test');
      expect(methods[1]).assertEqual('searchWord');
      expect(methods.join(',')).assertEqual('test,searchWord');
      const browser: MockBrowser = new MockBrowser();
      const tab: MockBrowserTab | null = browser.getCurrentTab();
      expect(tab === null).assertFalse();
      if (tab !== null) {
        tab.controller.runJavaScript('test()');
        expect(tab.controller.javaScriptCalls.length).assertEqual(1);
        expect(tab.controller.javaScriptCalls[0]).assertEqual('test()');
      }
    });

    it('Browser_Integration_Compat_020', 0, async () => {
      TestLogger.step(TAG, 'matrix table rows agree with the resolved profiles');
      const rows: CompatRow[] = buildMatrix();
      for (let index = 0; index < rows.length; index++) {
        const row: CompatRow = rows[index];
        const profile: CompatProfile = new CompatProfile(row.deviceType);
        TestLogger.info(TAG, `verify ${row.deviceType} expectPhone=${row.expectPhone}`);
        expect(profile.isPhone).assertEqual(row.expectPhone);
        expect(profile.homePage).assertEqual(row.homePage);
        expect(profile.usesDesktopUserAgent()).assertEqual(row.desktopAgent);
      }
    });

    it('Browser_Integration_Compat_021', 0, async () => {
      TestLogger.step(TAG, 'every deviceType of the matrix is unique');
      const rows: CompatRow[] = buildMatrix();
      const seen: string[] = [];
      for (let index = 0; index < rows.length; index++) {
        expect(seen.indexOf(rows[index].deviceType)).assertEqual(-1);
        seen.push(rows[index].deviceType);
      }
      expect(seen.length).assertEqual(6);
      expect(seen.indexOf('car')).assertLarger(0);
      expect(seen.indexOf(DEVICE_TYPE_DEFAULT)).assertEqual(0);
    });

    it('Browser_Integration_Compat_022', 0, async () => {
      TestLogger.step(TAG, 'layout choice is exactly one of tablet or phone');
      const all: CompatProfile[] = buildProfiles();
      for (let index = 0; index < all.length; index++) {
        const isTablet: boolean = all[index].layoutName === 'TabletTitle';
        const isPhone: boolean = all[index].layoutName === 'PhoneLayout';
        expect(isTablet !== isPhone).assertTrue();
        expect(all[index].layoutName.length).assertLarger(0);
      }
    });

    it('Browser_Integration_Compat_023', 0, async () => {
      TestLogger.step(TAG, 'user agents are never empty and differ per layout');
      const all: CompatProfile[] = buildProfiles();
      for (let index = 0; index < all.length; index++) {
        expect(all[index].userAgent.length).assertLarger(10);
      }
      expect(PAD_USER_AGENT === PHONE_USER_AGENT).assertFalse();
      expect(PAD_USER_AGENT.indexOf('Mozilla/5.0')).assertEqual(0);
      expect(PHONE_USER_AGENT.indexOf('SampleBrowser')).assertEqual(0);
    });

    it('Browser_Integration_Compat_024', 0, async () => {
      TestLogger.step(TAG, 'rotation preserves the diagonal and swaps both axes');
      const spec: ScreenSpec = new ScreenSpec(1280, 800, 240);
      const flipped: ScreenSpec = spec.rotated();
      expect(flipped.widthVp).assertEqual(spec.heightVp);
      expect(flipped.heightVp).assertEqual(spec.widthVp);
      expect(flipped.densityDpi).assertEqual(spec.densityDpi);
      expect(Math.round(flipped.diagonal())).assertEqual(Math.round(spec.diagonal()));
      expect(flipped.isLandscape()).assertFalse();
    });

    it('Browser_Integration_Compat_025', 0, async () => {
      TestLogger.step(TAG, 'ui: url input exists on the active layout');
      const inputPresent: boolean = await componentByIdExists(driver, ID_INPUT_URL);
      TestLogger.info(TAG, `url input present=${inputPresent}`);
      if (!inputPresent) {
        TestLogger.fail(TAG, 'Browser_Integration_Compat_025', 'url input not rendered');
        expect().assertFail();
        return;
      }
      expect(inputPresent).assertTrue();
    });

    it('Browser_Integration_Compat_026', 0, async () => {
      TestLogger.step(TAG, 'ui: home button follows the active layout');
      const homePresent: boolean = await componentByIdExists(driver, ID_NAV_HOME);
      const tabletProfile: CompatProfile = new CompatProfile(DEVICE_TYPE_DEFAULT);
      TestLogger.info(TAG, `home present=${homePresent}, tablet=${!tabletProfile.isPhone}`);
      if (!homePresent) {
        TestLogger.fail(TAG, 'Browser_Integration_Compat_026', 'home button missing');
        expect().assertFail();
        return;
      }
      expect(homePresent).assertTrue();
      expect(tabletProfile.homeUrl()).assertEqual('resource://rawfile/pad.html');
    });

    it('Browser_Integration_Compat_027', 0, async () => {
      TestLogger.step(TAG, 'ui: tab strip count matches the rendered layout');
      const stripCount: number = await countById(driver, ID_CANCEL_TAB);
      const addCount: number = await countById(driver, ID_ACTION_ADD);
      TestLogger.info(TAG, `close buttons=${stripCount}, add buttons=${addCount}`);
      if (stripCount > 0) {
        expect(addCount).assertLarger(0);
        expect(stripCount <= MAX_TAB_COUNT + 1).assertTrue();
      } else {
        expect(addCount).assertEqual(0);
      }
    });

    it('Browser_Integration_Compat_028', 0, async () => {
      TestLogger.step(TAG, 'ui: home navigation is clickable on the active layout');
      const ready: boolean = await componentByIdExists(driver, ID_NAV_HOME);
      if (!ready) {
        TestLogger.warn(TAG, 'home button unavailable, layout without pad title bar');
        expect(ready).assertFalse();
        return;
      }
      const clicked: boolean = await clickById(driver, ID_NAV_HOME);
      await serializedDelay(driver, TIMEOUT_COMPONENT / 2);
      TestLogger.info(TAG, `home clicked=${clicked}`);
      if (!clicked) {
        TestLogger.fail(TAG, 'Browser_Integration_Compat_028', 'home click rejected');
        expect().assertFail();
        return;
      }
      expect(clicked).assertTrue();
    });

    it('Browser_Integration_Compat_029', 0, async () => {
      TestLogger.step(TAG, 'audit derives layout counts from the device matrix');
      const audit: CompatAudit = new CompatAudit(allDeviceTypes());
      expect(audit.profiles.length).assertEqual(6);
      expect(audit.phoneCount()).assertEqual(5);
      expect(audit.tabletCount()).assertEqual(1);
      expect(audit.desktopAgentCount()).assertEqual(1);
      expect(audit.describe()).assertEqual('rows=6,phone=5,tablet=1');
    });

    it('Browser_Integration_Compat_030', 0, async () => {
      TestLogger.step(TAG, 'audit keeps exactly two distinct home page variants');
      const audit: CompatAudit = new CompatAudit(allDeviceTypes());
      const pages: string[] = audit.homePages();
      expect(pages.length).assertEqual(2);
      expect(pages.indexOf('pad.html')).assertLarger(-1);
      expect(pages.indexOf('phone.html')).assertLarger(-1);
      expect(pages[0] === pages[1]).assertFalse();
    });

    it('Browser_Integration_Compat_031', 0, async () => {
      TestLogger.step(TAG, 'every screen size keeps a usable category after rotation');
      const sizes: number[][] = [[320, 480], [480, 800], [600, 960], [840, 1180], [1280, 1600]];
      for (let index = 0; index < sizes.length; index++) {
        const spec: ScreenSpec = new ScreenSpec(sizes[index][0], sizes[index][1]);
        const flipped: ScreenSpec = spec.rotated();
        expect(spec.category().length).assertLarger(0);
        expect(flipped.category()).assertEqual(spec.category());
        expect(spec.isPortrait() !== flipped.isPortrait()).assertTrue();
        TestLogger.info(TAG, `size ${spec.widthVp}x${spec.heightVp} -> ${spec.category()}`);
      }
    });

    it('Browser_Integration_Compat_032', 0, async () => {
      TestLogger.step(TAG, 'api level sweep degrades capabilities below the baseline');
      const levels: number[] = [7, 8, 9, 10, 12];
      for (let index = 0; index < levels.length; index++) {
        const gate: ApiGate = new ApiGate(levels[index]);
        const expectedBaseline: boolean = levels[index] >= BASELINE_API_LEVEL;
        expect(gate.isBaseline()).assertEqual(expectedBaseline);
        expect(gate.canBrowse()).assertTrue();
        TestLogger.info(TAG, `api ${levels[index]} baseline=${expectedBaseline}`);
      }
      expect(new ApiGate(7).degradedCapabilities().length).assertEqual(3);
      expect(new ApiGate(12).degradedCapabilities().length).assertEqual(0);
    });
  });
}
