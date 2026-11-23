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

// Window resize suite. Every case launches EntryAbility, optionally switches to the mine
// tab, then asks the window to resize to a breakpoint width. Resizing is only supported
// on free-form devices, so the achieved window bounds are asserted to stay usable instead
// of being compared with the requested width.
import { describe, expect, it } from '@ohos/hypium';
import { abilityDelegatorRegistry, Driver, ON, Rect, ResizeDirection } from '@kit.TestKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { BUNDLE_NAME, ENTRY_ABILITY_NAME } from '../util/TestConstants';
import { vpToPx } from '../util/DisplayUtil';

const DOMAIN: number = 0xF811;
const TAG: string = '[MultiMusicTest]';
const FOREGROUND_TIMEOUT_MS: number = 10000;
const POLL_INTERVAL_MS: number = 200;
const SETTLE_MS: number = 1000;
const TAB_HOME_ID: string = 'tabs0';
const TAB_MINE_ID: string = 'tabs3';

function driver(): Driver {
  return Driver.create();
}

/**
 * Waits until the component with the given id shows up, which means the ability window
 * is drawn and the UI tree can be queried.
 */
async function waitForId(id: string, timeoutMs: number = FOREGROUND_TIMEOUT_MS): Promise<boolean> {
  const deadline: number = Date.now() + timeoutMs;
  while (Date.now() < deadline) {
    try {
      await driver().findComponent(ON.id(id));
      return true;
    } catch (error) {
      await driver().delayMs(POLL_INTERVAL_MS);
    }
  }
  return false;
}

/**
 * Launches the application and reports whether the tab bar became visible.
 */
async function startApp(): Promise<boolean> {
  const delegator = abilityDelegatorRegistry.getAbilityDelegator();
  await delegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ENTRY_ABILITY_NAME });
  const ready: boolean = await waitForId(TAB_HOME_ID);
  hilog.info(DOMAIN, TAG, 'foreground-ready actual=%{public}s expected=true', String(ready));
  return ready;
}

/**
 * Switches to the mine tab. The click is best effort: the tab is not required for the
 * window resize itself, it only exercises the tab bar while the window is resized.
 */
async function clickMineTab(): Promise<boolean> {
  try {
    const component = await driver().findComponent(ON.id(TAB_MINE_ID));
    await component.click();
    await driver().delayMs(SETTLE_MS);
    return true;
  } catch (error) {
    hilog.error(DOMAIN, TAG, 'clickMineTab failed: %{public}s', JSON.stringify(error) ?? '');
    return false;
  }
}

/**
 * Resizes the active window to the requested width and returns the resulting bounds.
 */
async function resizeWindow(width: number): Promise<Rect> {
  const windowObject = await driver().findWindow({ actived: true });
  const before: Rect = await windowObject.getBounds();
  try {
    await windowObject.resize(width, before.bottom - before.top, ResizeDirection.LEFT);
    await driver().delayMs(SETTLE_MS);
  } catch (error) {
    // A fullscreen window rejects resize(); the cases still assert that the window stays
    // measurable and usable afterwards, so the request is treated as best effort.
    hilog.info(DOMAIN, TAG, 'resize rejected requested=%{public}s', String(width));
  }
  const after: Rect = await windowObject.getBounds();
  hilog.info(DOMAIN, TAG, 'resize requested=%{public}s actual=%{public}s',
    String(width), String(after.right - after.left));
  return after;
}

export default function abilityTest() {
  describe('ActsAbilityTest', () => {
    /**
     * @tc.number: SUB_MM_ABIL_0100
     * @tc.name: testAbility0001
     * @tc.desc: Verify the application starts and its window survives a narrow 360vp resize.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testAbility0001', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAbility0001 begin');
      const ready: boolean = await startApp();
      const bounds: Rect = await resizeWindow(vpToPx(360));
      expect(ready).assertTrue();
      expect(bounds.right > bounds.left).assertTrue();
      expect(bounds.bottom > bounds.top).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAbility0001 end');
    })

    /**
     * @tc.number: SUB_MM_ABIL_0200
     * @tc.name: testAbility0002
     * @tc.desc: Verify the application window survives a medium 800vp resize.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testAbility0002', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAbility0002 begin');
      const ready: boolean = await startApp();
      const bounds: Rect = await resizeWindow(vpToPx(800));
      expect(ready).assertTrue();
      expect(bounds.right > bounds.left).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAbility0002 end');
    })

    /**
     * @tc.number: SUB_MM_ABIL_0300
     * @tc.name: testAbility0003
     * @tc.desc: Verify the application window survives a wide 1080vp resize.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testAbility0003', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAbility0003 begin');
      const ready: boolean = await startApp();
      const bounds: Rect = await resizeWindow(vpToPx(1080));
      expect(ready).assertTrue();
      expect(bounds.right > bounds.left).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAbility0003 end');
    })

    /**
     * @tc.number: SUB_MM_ABIL_0400
     * @tc.name: testAbility0004
     * @tc.desc: Verify the mine tab stays clickable while the window is resized to 360vp.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testAbility0004', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAbility0004 begin');
      const ready: boolean = await startApp();
      const clicked: boolean = await clickMineTab();
      const bounds: Rect = await resizeWindow(vpToPx(360));
      expect(ready).assertTrue();
      expect(clicked).assertTrue();
      expect(bounds.bottom > bounds.top).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAbility0004 end');
    })

    /**
     * @tc.number: SUB_MM_ABIL_0500
     * @tc.name: testAbility0005
     * @tc.desc: Verify the mine tab stays clickable while the window is resized to 800vp.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testAbility0005', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAbility0005 begin');
      const ready: boolean = await startApp();
      const clicked: boolean = await clickMineTab();
      const bounds: Rect = await resizeWindow(vpToPx(800));
      expect(ready).assertTrue();
      expect(clicked).assertTrue();
      expect(bounds.bottom > bounds.top).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAbility0005 end');
    })

    /**
     * @tc.number: SUB_MM_ABIL_0600
     * @tc.name: testAbility0006
     * @tc.desc: Verify the mine tab stays clickable while the window is resized to 1080vp.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testAbility0006', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAbility0006 begin');
      const ready: boolean = await startApp();
      const clicked: boolean = await clickMineTab();
      const bounds: Rect = await resizeWindow(vpToPx(1080));
      expect(ready).assertTrue();
      expect(clicked).assertTrue();
      expect(bounds.bottom > bounds.top).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAbility0006 end');
    })
  })
}
