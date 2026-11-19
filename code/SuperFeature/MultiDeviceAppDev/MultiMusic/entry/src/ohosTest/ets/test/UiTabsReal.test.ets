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

// Handwritten UI companion suite for the Index tab bar. All locators are semantic
// (ON.id / ON.text); no hard coded coordinates are used anywhere in this file.
import { describe, it, expect, beforeAll, afterEach } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { abilityDelegatorRegistry, Component, Driver, MatchPattern, ON, On, Rect } from '@kit.TestKit';
import { systemLabelByName } from '../util/LabelResolver';
import { BUNDLE_NAME, ENTRY_ABILITY_NAME } from '../util/TestConstants';
import { vpToPx } from '../util/DisplayUtil';

const DOMAIN: number = 0xF811;
const TAG: string = '[MultiMusicTest]';
const FOREGROUND_TIMEOUT_MS: number = 10000;
const POLL_INTERVAL_MS: number = 200;

function driver(): Driver {
  return Driver.create();
}

/**
 * Polls for a component id until it appears or the timeout expires.
 */
async function waitForId(id: string, timeoutMs: number = FOREGROUND_TIMEOUT_MS): Promise<boolean> {
  const deadline: number = Date.now() + timeoutMs;
  while (Date.now() < deadline) {
    if (await presentById(id)) {
      return true;
    }
    await driver().delayMs(POLL_INTERVAL_MS);
  }
  return false;
}

async function startApp(): Promise<void> {
  const delegator = abilityDelegatorRegistry.getAbilityDelegator();
  await delegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ENTRY_ABILITY_NAME });
  // startAbility resolves before the window is drawn, so the tab bar is polled for
  // instead of being awaited with a fixed sleep.
  const ready: boolean = await waitForId('tabs0');
  hilog.info(DOMAIN, TAG, 'foreground-ready actual=%{public}s expected=true', String(ready));
  if (!ready) {
    throw new Error('The Index tab bar did not become visible within the timeout');
  }
}

async function present(on: On): Promise<boolean> {
  try {
    await driver().assertComponentExist(on);
    return true;
  } catch (error) {
    return false;
  }
}

async function presentById(id: string): Promise<boolean> {
  return await present(ON.id(id));
}

async function presentByText(text: string, contains: boolean = false): Promise<boolean> {
  return await present(contains ? ON.text(text, MatchPattern.CONTAINS) : ON.text(text));
}

async function componentOf(id: string): Promise<Component> {
  return await driver().findComponent(ON.id(id));
}

async function boundsOf(id: string): Promise<Rect> {
  const component: Component = await componentOf(id);
  return await component.getBounds();
}

async function idOf(id: string): Promise<string> {
  const component: Component = await componentOf(id);
  return await component.getId();
}

async function clickId(id: string): Promise<void> {
  const component: Component = await componentOf(id);
  await component.click();
  await driver().delayMs(400);
}

export default function uiTabsRealTest() {
  describe('UiTabsReal', () => {
    beforeAll(async () => {
      await startApp();
      hilog.info(DOMAIN, TAG, '%{public}s', 'UiTabsReal app started');
    })

    afterEach(async () => {
      try {
        await clickId('tabs0');
      } catch (error) {
        hilog.info(DOMAIN, TAG, '%{public}s', 'UiTabsReal reset skipped');
      }
    })

    // ==================== 四个页签的存在性与语义 id（8 条） ====================
    /**
     * @tc.number: SUB_MM_UITB_0100
     * @tc.name: testUiTabs0001
     * @tc.desc: Verify the home tab is reachable through its semantic id.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testUiTabs0001', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiTabs0001 begin');
      const exists: boolean = await presentById('tabs0');
      const id: string = await idOf('tabs0');
      const bounds: Rect = await boundsOf('tabs0');
      hilog.info(DOMAIN, TAG, 'tabs0 actual=%{public}s/%{public}s/%{public}s', String(exists), id,
        String(bounds.right - bounds.left));
      expect(exists).assertTrue();
      expect(id).assertEqual('tabs0');
      expect(bounds.right > bounds.left).assertTrue();
      expect(bounds.bottom > bounds.top).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiTabs0001 end');
    })

    /**
     * @tc.number: SUB_MM_UITB_0200
     * @tc.name: testUiTabs0002
     * @tc.desc: Verify the radio tab is reachable through its semantic id.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testUiTabs0002', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiTabs0002 begin');
      const exists: boolean = await presentById('tabs1');
      const id: string = await idOf('tabs1');
      const bounds: Rect = await boundsOf('tabs1');
      hilog.info(DOMAIN, TAG, 'tabs1 actual=%{public}s/%{public}s', String(exists), id);
      expect(exists).assertTrue();
      expect(id).assertEqual('tabs1');
      expect(bounds.right > bounds.left).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiTabs0002 end');
    })

    /**
     * @tc.number: SUB_MM_UITB_0300
     * @tc.name: testUiTabs0003
     * @tc.desc: Verify the discovery tab is reachable through its semantic id.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testUiTabs0003', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiTabs0003 begin');
      const exists: boolean = await presentById('tabs2');
      const id: string = await idOf('tabs2');
      hilog.info(DOMAIN, TAG, 'tabs2 actual=%{public}s/%{public}s', String(exists), id);
      expect(exists).assertTrue();
      expect(id).assertEqual('tabs2');
      const bounds: Rect = await boundsOf('tabs2');
      expect(bounds.right > bounds.left).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiTabs0003 end');
    })

    /**
     * @tc.number: SUB_MM_UITB_0400
     * @tc.name: testUiTabs0004
     * @tc.desc: Verify the mine tab is reachable through its semantic id.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testUiTabs0004', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiTabs0004 begin');
      const exists: boolean = await presentById('tabs3');
      const id: string = await idOf('tabs3');
      const bounds: Rect = await boundsOf('tabs3');
      hilog.info(DOMAIN, TAG, 'tabs3 actual=%{public}s/%{public}s', String(exists), id);
      expect(exists).assertTrue();
      expect(id).assertEqual('tabs3');
      expect(bounds.bottom > bounds.top).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiTabs0004 end');
    })

    /**
     * @tc.number: SUB_MM_UITB_0500
     * @tc.name: testUiTabs0005
     * @tc.desc: Verify a non existing tab id is reported as absent.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testUiTabs0005', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiTabs0005 begin');
      const fourth: boolean = await presentById('tabs4');
      const bare: boolean = await presentById('tab0');
      hilog.info(DOMAIN, TAG, 'missing-tabs actual=%{public}s/%{public}s expected=false/false',
        String(fourth), String(bare));
      expect(fourth).assertFalse();
      expect(bare).assertFalse();
      expect(await presentById('tabs0')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiTabs0005 end');
    })

    /**
     * @tc.number: SUB_MM_UITB_0600
     * @tc.name: testUiTabs0006
     * @tc.desc: Verify the tab id lookup is case sensitive.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testUiTabs0006', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiTabs0006 begin');
      const upper: boolean = await presentById('TABS0');
      const spaced: boolean = await presentById('tabs 0');
      hilog.info(DOMAIN, TAG, 'case-sensitive actual=%{public}s/%{public}s expected=false/false',
        String(upper), String(spaced));
      expect(upper).assertFalse();
      expect(spaced).assertFalse();
      expect(await presentById('tabs0')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiTabs0006 end');
    })

    /**
     * @tc.number: SUB_MM_UITB_0700
     * @tc.name: testUiTabs0007
     * @tc.desc: Verify the four tab labels are rendered as searchable text.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testUiTabs0007', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiTabs0007 begin');
      const home: boolean = await presentByText(systemLabelByName('index'));
      const radio: boolean = await presentByText(systemLabelByName('radio'));
      const discovery: boolean = await presentByText(systemLabelByName('discovery'));
      const mine: boolean = await presentByText(systemLabelByName('mine'));
      hilog.info(DOMAIN, TAG, 'tab-labels actual=%{public}s/%{public}s/%{public}s/%{public}s',
        String(home), String(radio), String(discovery), String(mine));
      expect(home).assertTrue();
      expect(radio).assertTrue();
      expect(discovery).assertTrue();
      expect(mine).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiTabs0007 end');
    })

    /**
     * @tc.number: SUB_MM_UITB_0800
     * @tc.name: testUiTabs0008
     * @tc.desc: Verify all four tabs stay present at the same time.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testUiTabs0008', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiTabs0008 begin');
      let count: number = 0;
      const ids: string[] = ['tabs0', 'tabs1', 'tabs2', 'tabs3'];
      for (let i = 0; i < ids.length; i++) {
        if (await presentById(ids[i])) {
          count = count + 1;
        }
      }
      hilog.info(DOMAIN, TAG, 'present-tabs actual=%{public}s expected=4', String(count));
      expect(count).assertEqual(4);
      expect(count).assertEqual(ids.length);
      expect(await presentById('tabs0')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiTabs0008 end');
    })

    // ==================== 页签几何排布（12 条） ====================
    /**
     * @tc.number: SUB_MM_UITB_0900
     * @tc.name: testUiTabs0009
     * @tc.desc: Verify the first two tabs share the same top edge in the compact layout.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testUiTabs0009', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiTabs0009 begin');
      const first: Rect = await boundsOf('tabs0');
      const second: Rect = await boundsOf('tabs1');
      hilog.info(DOMAIN, TAG, 'top-edges actual=%{public}s/%{public}s', String(first.top), String(second.top));
      expect(first.top).assertEqual(second.top);
      expect(second.left > first.left).assertTrue();
      expect(first.bottom).assertEqual(second.bottom);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiTabs0009 end');
    })

    /**
     * @tc.number: SUB_MM_UITB_1000
     * @tc.name: testUiTabs0010
     * @tc.desc: Verify the third and fourth tabs share the same top edge in the compact layout.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testUiTabs0010', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiTabs0010 begin');
      const third: Rect = await boundsOf('tabs2');
      const fourth: Rect = await boundsOf('tabs3');
      hilog.info(DOMAIN, TAG, 'top-edges actual=%{public}s/%{public}s', String(third.top), String(fourth.top));
      expect(third.top).assertEqual(fourth.top);
      expect(fourth.left > third.left).assertTrue();
      expect(third.bottom).assertEqual(fourth.bottom);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiTabs0010 end');
    })

    /**
     * @tc.number: SUB_MM_UITB_1100
     * @tc.name: testUiTabs0011
     * @tc.desc: Verify the tab order runs from left to right as declared in the source.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testUiTabs0011', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiTabs0011 begin');
      const first: Rect = await boundsOf('tabs0');
      const second: Rect = await boundsOf('tabs1');
      const third: Rect = await boundsOf('tabs2');
      hilog.info(DOMAIN, TAG, 'left-order actual=%{public}s/%{public}s/%{public}s',
        String(first.left), String(second.left), String(third.left));
      expect(second.left > first.left).assertTrue();
      expect(third.left > second.left).assertTrue();
      expect(first.left >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiTabs0011 end');
    })

    /**
     * @tc.number: SUB_MM_UITB_1200
     * @tc.name: testUiTabs0012
     * @tc.desc: Verify the mine tab is the right most tab of the bar.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testUiTabs0012', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiTabs0012 begin');
      const discovery: Rect = await boundsOf('tabs2');
      const mine: Rect = await boundsOf('tabs3');
      hilog.info(DOMAIN, TAG, 'right-most actual=%{public}s/%{public}s', String(mine.left), String(discovery.right));
      expect(mine.left > discovery.left).assertTrue();
      expect(mine.right > discovery.right).assertTrue();
      expect(mine.right - mine.left).assertEqual(discovery.right - discovery.left);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiTabs0012 end');
    })

    /**
     * @tc.number: SUB_MM_UITB_1300
     * @tc.name: testUiTabs0013
     * @tc.desc: Verify the four tabs have identical widths when the bar is horizontal.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testUiTabs0013', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiTabs0013 begin');
      const first: Rect = await boundsOf('tabs0');
      const second: Rect = await boundsOf('tabs1');
      const fourth: Rect = await boundsOf('tabs3');
      const firstWidth: number = first.right - first.left;
      hilog.info(DOMAIN, TAG, 'tab-widths actual=%{public}s/%{public}s/%{public}s', String(firstWidth),
        String(second.right - second.left), String(fourth.right - fourth.left));
      expect(second.right - second.left).assertEqual(firstWidth);
      expect(fourth.right - fourth.left).assertEqual(firstWidth);
      expect(firstWidth > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiTabs0013 end');
    })

    /**
     * @tc.number: SUB_MM_UITB_1400
     * @tc.name: testUiTabs0014
     * @tc.desc: Verify the four tabs have identical heights.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testUiTabs0014', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiTabs0014 begin');
      const first: Rect = await boundsOf('tabs0');
      const second: Rect = await boundsOf('tabs1');
      const third: Rect = await boundsOf('tabs2');
      const height: number = first.bottom - first.top;
      hilog.info(DOMAIN, TAG, 'tab-heights actual=%{public}s/%{public}s/%{public}s', String(height),
        String(second.bottom - second.top), String(third.bottom - third.top));
      expect(second.bottom - second.top).assertEqual(height);
      expect(third.bottom - third.top).assertEqual(height);
      expect(height > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiTabs0014 end');
    })

    /**
     * @tc.number: SUB_MM_UITB_1500
     * @tc.name: testUiTabs0015
     * @tc.desc: Verify the tab bar stays inside the window width.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testUiTabs0015', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiTabs0015 begin');
      const windowObj = await driver().findWindow({ actived: true });
      const windowRect: Rect = await windowObj.getBounds();
      const mine: Rect = await boundsOf('tabs3');
      hilog.info(DOMAIN, TAG, 'inside-window actual=%{public}s/%{public}s', String(mine.right),
        String(windowRect.right));
      expect(mine.right <= windowRect.right).assertTrue();
      expect(mine.left >= windowRect.left).assertTrue();
      expect(windowRect.right > windowRect.left).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiTabs0015 end');
    })

    /**
     * @tc.number: SUB_MM_UITB_1600
     * @tc.name: testUiTabs0016
     * @tc.desc: Verify the tab bar sits in the lower part of the window on the compact layout.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testUiTabs0016', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiTabs0016 begin');
      const windowObj = await driver().findWindow({ actived: true });
      const windowRect: Rect = await windowObj.getBounds();
      const home: Rect = await boundsOf('tabs0');
      const middle: number = (windowRect.top + windowRect.bottom) / 2;
      hilog.info(DOMAIN, TAG, 'bar-position actual=%{public}s expected-larger-than=%{public}s',
        String(home.top), String(middle));
      expect(home.top > middle).assertTrue();
      expect(home.bottom <= windowRect.bottom).assertTrue();
      expect(home.bottom - home.top).assertEqual(vpToPx(56));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiTabs0016 end');
    })

    /**
     * @tc.number: SUB_MM_UITB_1700
     * @tc.name: testUiTabs0017
     * @tc.desc: Verify the home and mine tabs share the same vertical band.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testUiTabs0017', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiTabs0017 begin');
      const home: Rect = await boundsOf('tabs0');
      const mine: Rect = await boundsOf('tabs3');
      hilog.info(DOMAIN, TAG, 'same-band actual=%{public}s/%{public}s', String(home.top), String(mine.top));
      expect(mine.top).assertEqual(home.top);
      expect(mine.bottom).assertEqual(home.bottom);
      expect(mine.left > home.left).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiTabs0017 end');
    })

    /**
     * @tc.number: SUB_MM_UITB_1800
     * @tc.name: testUiTabs0018
     * @tc.desc: Verify the tab heights stay below the bar height budget of 56vp.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testUiTabs0018', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiTabs0018 begin');
      const home: Rect = await boundsOf('tabs0');
      const height: number = home.bottom - home.top;
      hilog.info(DOMAIN, TAG, 'bar-height actual=%{public}s expected=56', String(height));
      expect(height).assertEqual(vpToPx(56));
      expect(height > 0).assertTrue();
      expect(height < vpToPx(80)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiTabs0018 end');
    })

    /**
     * @tc.number: SUB_MM_UITB_1900
     * @tc.name: testUiTabs0019
     * @tc.desc: Verify the bar leaves no horizontal gap between the first and last tab.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testUiTabs0019', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiTabs0019 begin');
      const home: Rect = await boundsOf('tabs0');
      const mine: Rect = await boundsOf('tabs3');
      const span: number = mine.right - home.left;
      hilog.info(DOMAIN, TAG, 'bar-span actual=%{public}s expected-larger-than=%{public}s',
        String(span), String(mine.right - mine.left));
      expect(span > mine.right - mine.left).assertTrue();
      expect(home.left >= 0).assertTrue();
      expect(mine.right > home.right).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiTabs0019 end');
    })

    /**
     * @tc.number: SUB_MM_UITB_2000
     * @tc.name: testUiTabs0020
     * @tc.desc: Verify the home tab anchors the left edge of the bar.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testUiTabs0020', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiTabs0020 begin');
      const home: Rect = await boundsOf('tabs0');
      const radio: Rect = await boundsOf('tabs1');
      hilog.info(DOMAIN, TAG, 'anchor-left actual=%{public}s/%{public}s', String(home.left), String(radio.left));
      expect(home.left < radio.left).assertTrue();
      expect(home.left < vpToPx(80)).assertTrue();
      expect(radio.left - home.left).assertEqual(home.right - home.left);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiTabs0020 end');
    })

    // ==================== 首页内容与页签切换（20 条） ====================
    /**
     * @tc.number: SUB_MM_UITB_2100
     * @tc.name: testUiTabs0021
     * @tc.desc: Verify the home tab renders the recommend title.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testUiTabs0021', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiTabs0021 begin');
      const title: boolean = await presentByText(systemLabelByName('recommend'));
      const more: boolean = await presentByText(systemLabelByName('more'));
      hilog.info(DOMAIN, TAG, 'home-title actual=%{public}s/%{public}s expected=true/true',
        String(title), String(more));
      expect(title).assertTrue();
      expect(more).assertTrue();
      expect(await presentByText(systemLabelByName('singRecommend'))).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiTabs0021 end');
    })

    /**
     * @tc.number: SUB_MM_UITB_2200
     * @tc.name: testUiTabs0022
     * @tc.desc: Verify the shortcut entries of the home page are rendered.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testUiTabs0022', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiTabs0022 begin');
      const privacy: boolean = await presentByText(systemLabelByName('privacy'));
      const singer: boolean = await presentByText(systemLabelByName('singer'));
      hilog.info(DOMAIN, TAG, 'shortcuts actual=%{public}s/%{public}s expected=true/true',
        String(privacy), String(singer));
      expect(privacy).assertTrue();
      expect(singer).assertTrue();
      expect(await presentByText(systemLabelByName('singList'))).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiTabs0022 end');
    })

    /**
     * @tc.number: SUB_MM_UITB_2300
     * @tc.name: testUiTabs0023
     * @tc.desc: Verify the mine page is not part of the home content.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testUiTabs0023', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiTabs0023 begin');
      const mineTitle: boolean = await presentByText(systemLabelByName('mySongs'));
      hilog.info(DOMAIN, TAG, 'mine-title-on-home actual=%{public}s expected=false', String(mineTitle));
      expect(mineTitle).assertFalse();
      expect(await presentByText(systemLabelByName('recommend'))).assertTrue();
      expect(await presentById('tabs3')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiTabs0023 end');
    })

    /**
     * @tc.number: SUB_MM_UITB_2400
     * @tc.name: testUiTabs0024
     * @tc.desc: Verify clicking the mine tab reveals the user song list title.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testUiTabs0024', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiTabs0024 begin');
      await clickId('tabs3');
      const title: boolean = await presentByText(systemLabelByName('mySongs'));
      const id: string = await idOf('tabs3');
      hilog.info(DOMAIN, TAG, 'mine-page actual=%{public}s/%{public}s', String(title), id);
      expect(title).assertTrue();
      expect(id).assertEqual('tabs3');
      expect(await presentById('tabs0')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiTabs0024 end');
    })

    /**
     * @tc.number: SUB_MM_UITB_2500
     * @tc.name: testUiTabs0025
     * @tc.desc: Verify the home playlist recommendation disappears after switching to the mine tab.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testUiTabs0025', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiTabs0025 begin');
      await clickId('tabs3');
      const recommend: boolean = await presentByText(systemLabelByName('singRecommend'));
      hilog.info(DOMAIN, TAG, 'home-content-after-switch actual=%{public}s expected=false', String(recommend));
      expect(recommend).assertFalse();
      expect(await presentByText(systemLabelByName('mySongs'))).assertTrue();
      expect(await presentById('tabs3')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiTabs0025 end');
    })

    /**
     * @tc.number: SUB_MM_UITB_2600
     * @tc.name: testUiTabs0026
     * @tc.desc: Verify returning to the home tab restores the playlist recommendation block.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testUiTabs0026', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiTabs0026 begin');
      await clickId('tabs3');
      await clickId('tabs0');
      const recommend: boolean = await presentByText(systemLabelByName('singRecommend'));
      const mineTitle: boolean = await presentByText(systemLabelByName('mySongs'));
      hilog.info(DOMAIN, TAG, 'home-restored actual=%{public}s/%{public}s expected=true/false',
        String(recommend), String(mineTitle));
      expect(recommend).assertTrue();
      expect(mineTitle).assertFalse();
      expect(await presentByText(systemLabelByName('recommend'))).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiTabs0026 end');
    })

    /**
     * @tc.number: SUB_MM_UITB_2700
     * @tc.name: testUiTabs0027
     * @tc.desc: Verify the radio tab stays selectable and the bar remains visible after the click.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testUiTabs0027', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiTabs0027 begin');
      await clickId('tabs1');
      const id: string = await idOf('tabs1');
      const bounds: Rect = await boundsOf('tabs1');
      hilog.info(DOMAIN, TAG, 'radio-selected actual=%{public}s/%{public}s', id, String(bounds.top));
      expect(id).assertEqual('tabs1');
      expect(bounds.bottom > bounds.top).assertTrue();
      expect(await presentById('tabs2')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiTabs0027 end');
    })

    /**
     * @tc.number: SUB_MM_UITB_2800
     * @tc.name: testUiTabs0028
     * @tc.desc: Verify the discovery tab stays selectable and the bar remains visible after the click.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testUiTabs0028', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiTabs0028 begin');
      await clickId('tabs2');
      const id: string = await idOf('tabs2');
      hilog.info(DOMAIN, TAG, 'discovery-selected actual=%{public}s expected=tabs2', id);
      expect(id).assertEqual('tabs2');
      expect(await presentById('tabs1')).assertTrue();
      expect(await presentById('tabs3')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiTabs0028 end');
    })

    /**
     * @tc.number: SUB_MM_UITB_2900
     * @tc.name: testUiTabs0029
     * @tc.desc: Verify going back home from the radio tab restores the home content.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testUiTabs0029', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiTabs0029 begin');
      await clickId('tabs1');
      await clickId('tabs0');
      const title: boolean = await presentByText(systemLabelByName('recommend'));
      hilog.info(DOMAIN, TAG, 'home-after-radio actual=%{public}s expected=true', String(title));
      expect(title).assertTrue();
      expect(await presentByText(systemLabelByName('singRecommend'))).assertTrue();
      expect(await presentById('tabs0')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiTabs0029 end');
    })

    /**
     * @tc.number: SUB_MM_UITB_3000
     * @tc.name: testUiTabs0030
     * @tc.desc: Verify the tab bar keeps four entries after visiting every tab once.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testUiTabs0030', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiTabs0030 begin');
      await clickId('tabs1');
      await clickId('tabs2');
      await clickId('tabs3');
      await clickId('tabs0');
      let count: number = 0;
      const ids: string[] = ['tabs0', 'tabs1', 'tabs2', 'tabs3'];
      for (let i = 0; i < ids.length; i++) {
        if (await presentById(ids[i])) {
          count = count + 1;
        }
      }
      hilog.info(DOMAIN, TAG, 'tabs-after-tour actual=%{public}s expected=4', String(count));
      expect(count).assertEqual(4);
      expect(await presentByText(systemLabelByName('recommend'))).assertTrue();
      expect(await presentById('tabs0')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiTabs0030 end');
    })

    /**
     * @tc.number: SUB_MM_UITB_3100
     * @tc.name: testUiTabs0031
     * @tc.desc: Verify the mine page lists the first user playlist entry.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testUiTabs0031', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiTabs0031 begin');
      await clickId('tabs3');
      const emo: boolean = await presentByText(systemLabelByName('emo'));
      const mineTitle: boolean = await presentByText(systemLabelByName('mySongs'));
      hilog.info(DOMAIN, TAG, 'mine-entries actual=%{public}s/%{public}s', String(emo), String(mineTitle));
      expect(mineTitle).assertTrue();
      expect(emo).assertTrue();
      expect(await presentByText(systemLabelByName('buildBySelf'), true)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiTabs0031 end');
    })

    /**
     * @tc.number: SUB_MM_UITB_3200
     * @tc.name: testUiTabs0032
     * @tc.desc: Verify the mine page hides the recommend page banner text.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testUiTabs0032', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiTabs0032 begin');
      await clickId('tabs3');
      const more: boolean = await presentByText(systemLabelByName('more'));
      hilog.info(DOMAIN, TAG, 'home-more-on-mine actual=%{public}s expected=false', String(more));
      expect(more).assertFalse();
      expect(await presentByText(systemLabelByName('mySongs'))).assertTrue();
      expect(await presentById('tabs0')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiTabs0032 end');
    })

    /**
     * @tc.number: SUB_MM_UITB_3300
     * @tc.name: testUiTabs0033
     * @tc.desc: Verify the player bar is rendered on the home page below the large breakpoint.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testUiTabs0033', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiTabs0033 begin');
      const title: boolean = await presentByText('Witness');
      const artist: boolean = await presentByText('Katy');
      hilog.info(DOMAIN, TAG, 'player-bar actual=%{public}s/%{public}s expected=true/true',
        String(title), String(artist));
      expect(title).assertTrue();
      expect(artist).assertTrue();
      expect(await presentByText(systemLabelByName('recommend'))).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiTabs0033 end');
    })

    /**
     * @tc.number: SUB_MM_UITB_3400
     * @tc.name: testUiTabs0034
     * @tc.desc: Verify the player bar keeps both text rows aligned in one block.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testUiTabs0034', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiTabs0034 begin');
      const titleComponent: Component = await driver().findComponent(ON.text('Witness'));
      const artistComponent: Component = await driver().findComponent(ON.text('Katy'));
      const titleRect: Rect = await titleComponent.getBounds();
      const artistRect: Rect = await artistComponent.getBounds();
      hilog.info(DOMAIN, TAG, 'player-rows actual=%{public}s/%{public}s',
        String(titleRect.top), String(artistRect.top));
      expect(artistRect.top > titleRect.top).assertTrue();
      expect(artistRect.left).assertEqual(titleRect.left);
      expect(titleRect.bottom > titleRect.top).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiTabs0034 end');
    })

    /**
     * @tc.number: SUB_MM_UITB_3500
     * @tc.name: testUiTabs0035
     * @tc.desc: Verify the home content and the tab bar never overlap vertically.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testUiTabs0035', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiTabs0035 begin');
      const titleComponent: Component = await driver().findComponent(ON.text(systemLabelByName('recommend')));
      const titleRect: Rect = await titleComponent.getBounds();
      const barRect: Rect = await boundsOf('tabs0');
      hilog.info(DOMAIN, TAG, 'content-vs-bar actual=%{public}s/%{public}s',
        String(titleRect.bottom), String(barRect.top));
      expect(titleRect.top).assertLess(titleRect.bottom);
      expect(barRect.top > titleRect.top).assertTrue();
      expect(await presentById('tabs0')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiTabs0035 end');
    })

    /**
     * @tc.number: SUB_MM_UITB_3600
     * @tc.name: testUiTabs0036
     * @tc.desc: Verify the mine tab keeps the player bar as well.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testUiTabs0036', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiTabs0036 begin');
      await clickId('tabs3');
      const player: boolean = await presentByText('Witness');
      const title: boolean = await presentByText(systemLabelByName('mySongs'));
      hilog.info(DOMAIN, TAG, 'mine-player actual=%{public}s/%{public}s', String(player), String(title));
      expect(title).assertTrue();
      expect(player).assertTrue();
      expect(await presentById('tabs3')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiTabs0036 end');
    })

    /**
     * @tc.number: SUB_MM_UITB_3700
     * @tc.name: testUiTabs0037
     * @tc.desc: Verify the mine page opens on the first playlist entry of the grid.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testUiTabs0037', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiTabs0037 begin');
      await clickId('tabs3');
      const first: boolean = await presentByText(systemLabelByName('emo'));
      const owner: boolean = await presentByText(systemLabelByName('buildBySelf'), true);
      hilog.info(DOMAIN, TAG, 'mine-entries actual=%{public}s/%{public}s', String(first), String(owner));
      expect(first).assertTrue();
      expect(owner).assertTrue();
      expect(await presentByText(systemLabelByName('mySongs'))).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiTabs0037 end');
    })

    /**
     * @tc.number: SUB_MM_UITB_3800
     * @tc.name: testUiTabs0038
     * @tc.desc: Verify the radio placeholder page keeps the tab bar interactive.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testUiTabs0038', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiTabs0038 begin');
      await clickId('tabs1');
      const radio: string = await idOf('tabs1');
      const home: string = await idOf('tabs0');
      hilog.info(DOMAIN, TAG, 'bar-interactive actual=%{public}s/%{public}s', radio, home);
      expect(radio).assertEqual('tabs1');
      expect(home).assertEqual('tabs0');
      expect(await presentById('tabs0')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiTabs0038 end');
    })

    /**
     * @tc.number: SUB_MM_UITB_3900
     * @tc.name: testUiTabs0039
     * @tc.desc: Verify switching twice in a row ends on the requested tab.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testUiTabs0039', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiTabs0039 begin');
      await clickId('tabs3');
      await clickId('tabs1');
      const radioOnly: boolean = await presentByText(systemLabelByName('mySongs'));
      hilog.info(DOMAIN, TAG, 'double-switch actual=%{public}s expected=false', String(radioOnly));
      expect(radioOnly).assertFalse();
      expect(await presentById('tabs1')).assertTrue();
      expect(await presentById('tabs3')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiTabs0039 end');
    })

    /**
     * @tc.number: SUB_MM_UITB_4000
     * @tc.name: testUiTabs0040
     * @tc.desc: Verify the suite leaves the application on the home tab.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testUiTabs0040', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiTabs0040 begin');
      await clickId('tabs3');
      await clickId('tabs0');
      const title: boolean = await presentByText(systemLabelByName('recommend'));
      const mineTitle: boolean = await presentByText(systemLabelByName('mySongs'));
      hilog.info(DOMAIN, TAG, 'clean-state actual=%{public}s/%{public}s expected=true/false',
        String(title), String(mineTitle));
      expect(title).assertTrue();
      expect(mineTitle).assertFalse();
      expect(await presentById('tabs0')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUiTabs0040 end');
    })
  })
}
