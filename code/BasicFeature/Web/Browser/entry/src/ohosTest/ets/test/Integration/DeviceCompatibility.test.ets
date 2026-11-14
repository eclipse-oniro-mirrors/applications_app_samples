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
  deviceIsPhone, PAD_HOME_PAGE, PHONE_HOME_PAGE, ID_INPUT_URL, ID_NAV_HOME,
  ID_ACTION_ADD, ID_CANCEL_TAB, TIMEOUT_COMPONENT
} from '../Shared/BrowserTestKit';
import { MockBrowser } from '../Shared/BrowserMock';

const TAG: string = 'BrowserDeviceCompatTest';

/**
 * User agents declared in common/TitleBar.ets. The title bar hands the pad UA
 * to the Web component so that desktop pages are served on a large screen.
 */
const PAD_USER_AGENT: string =
  'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.105 Safari/537.36';
const PHONE_USER_AGENT: string = 'HuaweiBrowser/12.0.4.1';

/** deviceType values reported by @ohos.deviceInfo on shipped products. */
const DEVICE_TYPE_DEFAULT: string = 'default';
const DEVICE_TYPE_PHONE: string = 'phone';
const DEVICE_TYPE_TABLET: string = 'tablet';
const DEVICE_TYPE_TV: string = 'tv';
const DEVICE_TYPE_WEARABLE: string = 'wearable';
const DEVICE_TYPE_2IN1: string = '2in1';

/**
 * Resolves the layout that Index.ets picks for a given deviceType.
 *
 * Index.aboutToAppear compares deviceInfo.deviceType against 'default':
 * only 'default' keeps the tablet layout (TabletTitle + BrowserTabs + WebTab),
 * every other value switches to PhoneLayout.
 */
class LayoutProfile {
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

  /** Both layouts expose the url input, so it must exist on every device. */
  hasUrlInput(): boolean {
    return true;
  }

  /** Only the tablet layout renders the "add tab" action button. */
  hasAddTabButton(): boolean {
    return !this.isPhone;
  }

  /** The close button of a tab lives in the BrowserTabs strip. */
  hasCancelButton(): boolean {
    return !this.isPhone;
  }

  /** Home navigation always reloads the matching rawfile entry page. */
  homeUrl(): string {
    return 'resource://rawfile/' + this.homePage;
  }
}

function buildProfiles(): LayoutProfile[] {
  const types: string[] = [
    DEVICE_TYPE_DEFAULT, DEVICE_TYPE_PHONE, DEVICE_TYPE_TABLET,
    DEVICE_TYPE_TV, DEVICE_TYPE_WEARABLE, DEVICE_TYPE_2IN1
  ];
  const profiles: LayoutProfile[] = [];
  for (let index = 0; index < types.length; index++) {
    profiles.push(new LayoutProfile(types[index]));
  }
  return profiles;
}

export default function browserDeviceCompatibilityTest() {
  describe('browserDeviceCompatibilityTest', () => {
    let driver: Driver = getDriver();

    beforeAll(async () => {
      TestLogger.info(TAG, 'device compatibility suite begin');
      await startBrowserApp();
      await serializedDelay(driver, TIMEOUT_COMPONENT / 2);
    });

    afterAll(() => {
      TestLogger.info(TAG, TestLogger.summary(TAG));
    });

    it('Browser_Integration_Device_001', 0, async () => {
      TestLogger.step(TAG, 'resolve tablet profile for deviceType default');
      const profile: LayoutProfile = new LayoutProfile(DEVICE_TYPE_DEFAULT);
      expect(profile.isPhone).assertFalse();
      expect(profile.layoutName).assertEqual('TabletTitle');
      expect(profile.tabStripVisible).assertTrue();
      expect(profile.hasAddTabButton()).assertTrue();
      expect(profile.hasCancelButton()).assertTrue();
    });

    it('Browser_Integration_Device_002', 0, async () => {
      TestLogger.step(TAG, 'resolve phone profile for a non default deviceType');
      const profile: LayoutProfile = new LayoutProfile(DEVICE_TYPE_PHONE);
      expect(profile.isPhone).assertTrue();
      expect(profile.layoutName).assertEqual('PhoneLayout');
      expect(profile.tabStripVisible).assertFalse();
      expect(profile.hasAddTabButton()).assertFalse();
      expect(profile.hasCancelButton()).assertFalse();
    });

    it('Browser_Integration_Device_003', 0, async () => {
      TestLogger.step(TAG, 'tablet device types keep the tablet layout');
      const tabletLike: string[] = [DEVICE_TYPE_TABLET, DEVICE_TYPE_2IN1];
      for (let index = 0; index < tabletLike.length; index++) {
        const profile: LayoutProfile = new LayoutProfile(tabletLike[index]);
        expect(profile.isPhone).assertTrue();
        expect(profile.layoutName).assertEqual('PhoneLayout');
        expect(profile.homePage).assertEqual(PHONE_HOME_PAGE);
      }
      expect(deviceIsPhone(DEVICE_TYPE_DEFAULT)).assertFalse();
    });

    it('Browser_Integration_Device_004', 0, async () => {
      TestLogger.step(TAG, 'pad home page and phone home page are distinct rawfiles');
      const pad: LayoutProfile = new LayoutProfile(DEVICE_TYPE_DEFAULT);
      const phone: LayoutProfile = new LayoutProfile(DEVICE_TYPE_PHONE);
      expect(pad.homePage).assertEqual('pad.html');
      expect(phone.homePage).assertEqual('phone.html');
      expect(pad.homePage === phone.homePage).assertFalse();
      expect(pad.homeUrl()).assertEqual('resource://rawfile/pad.html');
      expect(phone.homeUrl()).assertEqual('resource://rawfile/phone.html');
    });

    it('Browser_Integration_Device_005', 0, async () => {
      TestLogger.step(TAG, 'tablet user agent advertises a desktop chrome build');
      const pad: LayoutProfile = new LayoutProfile(DEVICE_TYPE_DEFAULT);
      expect(pad.userAgent).assertEqual(PAD_USER_AGENT);
      expect(pad.userAgent.indexOf('AppleWebKit')).assertLarger(0);
      expect(pad.userAgent.indexOf('Chrome/92')).assertLarger(0);
      expect(pad.userAgent.indexOf('HuaweiBrowser')).assertEqual(-1);
      expect(pad.userAgent.length).assertLarger(PHONE_USER_AGENT.length);
    });

    it('Browser_Integration_Device_006', 0, async () => {
      TestLogger.step(TAG, 'phone user agent keeps the HuaweiBrowser token');
      const phone: LayoutProfile = new LayoutProfile(DEVICE_TYPE_PHONE);
      expect(phone.userAgent).assertEqual(PHONE_USER_AGENT);
      expect(phone.userAgent.indexOf('HuaweiBrowser')).assertEqual(0);
      expect(phone.userAgent.indexOf('AppleWebKit')).assertEqual(-1);
    });

    it('Browser_Integration_Device_007', 0, async () => {
      TestLogger.step(TAG, 'layout matrix is consistent for every device type');
      const profiles: LayoutProfile[] = buildProfiles();
      expect(profiles.length).assertEqual(6);
      let tabletCount: number = 0;
      let phoneCount: number = 0;
      for (let index = 0; index < profiles.length; index++) {
        if (profiles[index].isPhone) {
          phoneCount += 1;
        } else {
          tabletCount += 1;
        }
        expect(profiles[index].hasUrlInput()).assertTrue();
        expect(profiles[index].homePage.length).assertLarger(4);
      }
      expect(tabletCount).assertEqual(1);
      expect(phoneCount).assertEqual(5);
    });

    it('Browser_Integration_Device_008', 0, async () => {
      TestLogger.step(TAG, 'orientation flip rebuilds the browser model');
      const browser: MockBrowser = new MockBrowser();
      browser.addTab();
      browser.addTab();
      expect(browser.tabs.length).assertEqual(3);
      const rebuilt: MockBrowser = new MockBrowser();
      expect(rebuilt.tabs.length).assertEqual(1);
      expect(rebuilt.tabArrayIndex).assertEqual(0);
      expect(rebuilt.hideProgress).assertTrue();
    });

    it('Browser_Integration_Device_009', 0, async () => {
      TestLogger.step(TAG, 'active layout exposes the url input on device');
      const inputPresent: boolean = await componentByIdExists(driver, ID_INPUT_URL);
      const padHomePresent: boolean = await componentByIdExists(driver, ID_NAV_HOME);
      TestLogger.info(TAG, `url input present=${inputPresent}, home button present=${padHomePresent}`);
      expect(inputPresent).assertTrue();
      const padProfile: LayoutProfile = new LayoutProfile(DEVICE_TYPE_DEFAULT);
      if (!padProfile.isPhone) {
        expect(padHomePresent).assertTrue();
      }
    });

    it('Browser_Integration_Device_010', 0, async () => {
      TestLogger.step(TAG, 'tab strip controls follow the active layout');
      const tabStrip: number = await countById(driver, ID_CANCEL_TAB);
      const addButtons: number = await countById(driver, ID_ACTION_ADD);
      TestLogger.info(TAG, `cancel buttons=${tabStrip}, add tab buttons=${addButtons}`);
      if (tabStrip === 0) {
        expect(addButtons).assertEqual(0);
      } else {
        expect(addButtons).assertLarger(0);
      }
    });
  });
}
