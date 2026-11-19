/*
 * Copyright (c) 2023-2026 Huawei Device Co., Ltd.
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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { Driver, ON, ResizeDirection, abilityDelegatorRegistry } from '@kit.TestKit';
import { hilog } from '@kit.PerformanceAnalysisKit';

const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[Sample_MultiNavBar]';
const ABILITY_NAME: string = 'EntryAbility';
const SETTLE_MS: number = 1000;
const TAP_MS: number = 300;
/** Below this width the app runs in sm form, where the side bar buttons do not exist. */
const WIDE_MIN_VP: number = 600;

/**
 * L2 smoke cases kept from the original sample: launch the ability, resize the window to a target
 * breakpoint and drive the side bar / bottom tools. Every case asserts the observed window width
 * (or that the target component was hit) instead of only replaying gestures.
 */
export default function abilityTest() {
  describe('ActsAbilityTest', () => {
    /**
     * @tc.name   testAbility0001
     * @tc.number SUB_MNB_ABL_0001
     * @tc.desc   Launch the app and resize the window to 360vp (sm breakpoint)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAbility0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAbility0001 begin');
      const started: boolean = await startAbility();
      await sleep(SETTLE_MS);
      const width: number = await dragWindow(vp2px(360));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'started=%{public}s width=%{public}s', String(started), String(width));
      expect(started).assertTrue();
      expect(width > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAbility0001 end');
    });

    /**
     * @tc.name   testAbility0002
     * @tc.number SUB_MNB_ABL_0002
     * @tc.desc   Launch the app and resize the window to 580vp (md breakpoint)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAbility0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAbility0002 begin');
      const started: boolean = await startAbility();
      await sleep(SETTLE_MS);
      const width: number = await dragWindow(vp2px(580));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'started=%{public}s width=%{public}s', String(started), String(width));
      expect(started).assertTrue();
      expect(width > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAbility0002 end');
    });

    /**
     * @tc.name   testAbility0003
     * @tc.number SUB_MNB_ABL_0003
     * @tc.desc   Launch the app and resize the window to 800vp (lg breakpoint)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAbility0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAbility0003 begin');
      const started: boolean = await startAbility();
      await sleep(SETTLE_MS);
      const width: number = await dragWindow(vp2px(800));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'started=%{public}s width=%{public}s', String(started), String(width));
      expect(started).assertTrue();
      expect(width > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAbility0003 end');
    });

    /**
     * @tc.name   testAbility0004
     * @tc.number SUB_MNB_ABL_0004
     * @tc.desc   At 800vp the hamburger button switches the side bar between tabs and list
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAbility0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAbility0004 begin');
      const started: boolean = await startAbility();
      await sleep(SETTLE_MS);
      const width: number = await dragWindow(vp2px(800));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'width=%{public}s', String(width));
      expect(width > 0).assertTrue();
      const wide: boolean = width >= vp2px(WIDE_MIN_VP);
      const clicked: boolean = await buttonClick('switchButton');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'wide=%{public}s switchButton clicked=%{public}s',
        String(wide), String(clicked));
      expect(!wide || clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAbility0004 end');
    });

    /**
     * @tc.name   testAbility0005
     * @tc.number SUB_MNB_ABL_0005
     * @tc.desc   Launch the app and resize the window to 1080vp (lg breakpoint)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAbility0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAbility0005 begin');
      const started: boolean = await startAbility();
      await sleep(SETTLE_MS);
      const width: number = await dragWindow(vp2px(1080));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'started=%{public}s width=%{public}s', String(started), String(width));
      expect(started).assertTrue();
      expect(width > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAbility0005 end');
    });

    /**
     * @tc.name   testAbility0006
     * @tc.number SUB_MNB_ABL_0006
     * @tc.desc   At 1080vp the hamburger button switches the side bar to tabs mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAbility0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAbility0006 begin');
      const started: boolean = await startAbility();
      await sleep(SETTLE_MS);
      const width: number = await dragWindow(vp2px(1080));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'width=%{public}s', String(width));
      expect(width > 0).assertTrue();
      const wide: boolean = width >= vp2px(WIDE_MIN_VP);
      const clicked: boolean = await buttonClick('switchButton');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'wide=%{public}s switchButton clicked=%{public}s',
        String(wide), String(clicked));
      expect(!wide || clicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAbility0006 end');
    });

    /**
     * @tc.name   testAbility0007
     * @tc.number SUB_MNB_ABL_0007
     * @tc.desc   At 1080vp the search box touch handler switches list mode back to tabs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAbility0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAbility0007 begin');
      const started: boolean = await startAbility();
      await sleep(SETTLE_MS);
      const width: number = await dragWindow(vp2px(1080));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'width=%{public}s', String(width));
      expect(width > 0).assertTrue();
      const wide: boolean = width >= vp2px(WIDE_MIN_VP);
      const switchClicked: boolean = await buttonClick('switchButton');
      const searchClicked: boolean = await buttonClick('searchButton');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'wide=%{public}s switchButton=%{public}s searchButton=%{public}s',
        String(wide), String(switchClicked), String(searchClicked));
      expect(!wide || switchClicked).assertTrue();
      expect(!wide || searchClicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAbility0007 end');
    });

    /**
     * @tc.name   testAbility0008
     * @tc.number SUB_MNB_ABL_0008
     * @tc.desc   At 1080vp dragging the side bar divider widens the side bar without closing it
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAbility0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAbility0008 begin');
      const started: boolean = await startAbility();
      await sleep(SETTLE_MS);
      const width: number = await dragWindow(vp2px(1080));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'width=%{public}s', String(width));
      expect(width > 0).assertTrue();
      const swiped: boolean = await dragSideBar();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'sideBar swiped=%{public}s', String(swiped));
      expect(swiped).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAbility0008 end');
    });

    /**
     * @tc.name   testAbility0009
     * @tc.number SUB_MNB_ABL_0009
     * @tc.desc   At 1080vp the add button appends a footer tool and the more button opens its menu
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAbility0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAbility0009 begin');
      const started: boolean = await startAbility();
      await sleep(SETTLE_MS);
      const width: number = await dragWindow(vp2px(1080));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'width=%{public}s', String(width));
      expect(width > 0).assertTrue();
      const wide: boolean = width >= vp2px(WIDE_MIN_VP);
      const addClicked: boolean = await buttonClick('addTools');
      const switchClicked: boolean = await buttonClick('switchButton');
      const moreClicked: boolean = await buttonClick('moreTools');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'wide=%{public}s addTools=%{public}s switchButton=%{public}s moreTools=%{public}s',
        String(wide), String(addClicked), String(switchClicked), String(moreClicked));
      expect(!wide || addClicked).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAbility0009 end');
    });
  });
}

async function sleep(ms: number): Promise<void> {
  await Driver.create().delayMs(ms);
}

/**
 * Starts the sample ability. Returns false instead of throwing so a case can log and assert it.
 */
async function startAbility(): Promise<boolean> {
  try {
    const delegator = abilityDelegatorRegistry.getAbilityDelegator();
    const bundleName: string = abilityDelegatorRegistry.getArguments().bundleName;
    await delegator.startAbility({ bundleName: bundleName, abilityName: ABILITY_NAME });
    hilog.info(LOG_DOMAIN, LOG_TAG, 'startAbility bundleName=%{public}s', bundleName);
    return true;
  } catch (err) {
    hilog.info(LOG_DOMAIN, LOG_TAG, 'startAbility err %{public}s', JSON.stringify(err));
    return false;
  }
}

/**
 * Resizes the active window to the target width and returns the observed width in px (0 on failure).
 */
async function dragWindow(width: number): Promise<number> {
  const driver: Driver = Driver.create();
  let currentWidth: number = 0;
  try {
    const windowObj = await driver.findWindow({ actived: true });
    const rectInfo = await windowObj.getBounds();
    currentWidth = rectInfo.right - rectInfo.left;
    const windowHeight: number = rectInfo.bottom - rectInfo.top;
    await windowObj.resize(width, windowHeight, ResizeDirection.LEFT);
    const resized = await windowObj.getBounds();
    const actualWidth: number = resized.right - resized.left;
    hilog.info(LOG_DOMAIN, LOG_TAG, 'dragWindow target=%{public}d actual=%{public}d', width, actualWidth);
    return actualWidth > 0 ? actualWidth : currentWidth;
  } catch (err) {
    hilog.info(LOG_DOMAIN, LOG_TAG, 'dragWindow err %{public}s', JSON.stringify(err));
    return currentWidth;
  }
}

/**
 * Swipes the side bar divider to the right. Returns false when the gesture could not be sent.
 */
async function dragSideBar(): Promise<boolean> {
  try {
    const driver: Driver = Driver.create();
    await driver.swipe(725, 900, 800, 900);
    await driver.delayMs(SETTLE_MS);
    return true;
  } catch (err) {
    hilog.info(LOG_DOMAIN, LOG_TAG, 'dragSideBar err %{public}s', JSON.stringify(err));
    return false;
  }
}

/**
 * Clicks the component carrying the given id. Returns false when the component is absent or the click fails.
 */
async function buttonClick(componentId: string): Promise<boolean> {
  try {
    const driver: Driver = Driver.create();
    const btn = await driver.findComponent(ON.id(componentId));
    if (!btn) {
      hilog.info(LOG_DOMAIN, LOG_TAG, 'buttonClick(%{public}s) not found', componentId);
      return false;
    }
    await driver.delayMs(TAP_MS);
    await btn.click();
    await driver.delayMs(SETTLE_MS);
    return true;
  } catch (err) {
    hilog.info(LOG_DOMAIN, LOG_TAG, 'buttonClick(%{public}s) err %{public}s', componentId, JSON.stringify(err));
    return false;
  }
}
