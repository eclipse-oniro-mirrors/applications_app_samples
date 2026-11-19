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
import { afterEach, beforeAll, describe, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { Component, Driver, ON, Rect } from '@ohos.UiTest';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { hilog } from '@kit.PerformanceAnalysisKit';

const BUNDLE: string = 'com.samples.imageviewer';
const ABILITY: string = 'EntryAbility';
const DOMAIN: number = 0xF814;
const TAG: string = 'PreviewUiStateTest';
const IMAGE_ID: string = 'scale_image';
const STACK_ID: string = 'preview_stack';
const LIST_ID: string = 'preview_list';
const RENDER_WAIT: number = 700;
const POSITION_TOLERANCE: number = 3;

const delegator = AbilityDelegatorRegistry.getAbilityDelegator();

function log(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

function sleep(duration: number): Promise<void> {
  return new Promise<void>((resolve: () => void) => {
    setTimeout(() => {
      resolve();
    }, duration);
  });
}

async function exists(driver: Driver, id: string): Promise<boolean> {
  const bounds: Rect | null = await getBoundsOrNull(driver, id);
  return bounds !== null;
}

async function getBoundsOrNull(driver: Driver, id: string): Promise<Rect | null> {
  try {
    const component: Component = await driver.findComponent(ON.id(id));
    if (component === undefined || component === null) {
      return null;
    }
    return await component.getBounds();
  } catch (error) {
    log('getBounds failed: ' + id + ' -> ' + String(error));
    return null;
  }
}

async function getBounds(driver: Driver, id: string): Promise<Rect> {
  const component: Component = await driver.findComponent(ON.id(id));
  return await component.getBounds();
}

async function ensurePrepared(driver: Driver): Promise<boolean> {
  for (let i: number = 0; i < 3; i++) {
    if (await exists(driver, IMAGE_ID)) {
      return true;
    }
    await sleep(1000);
  }
  try {
    await delegator.startAbility({ bundleName: BUNDLE, abilityName: ABILITY });
    await sleep(2000);
  } catch (error) {
    log('ensurePrepared startAbility failed: ' + String(error));
  }
  return await exists(driver, IMAGE_ID);
}

async function doubleClickImage(driver: Driver): Promise<boolean> {
  const bounds: Rect | null = await getBoundsOrNull(driver, IMAGE_ID);
  if (bounds === null) {
    return false;
  }
  const x: number = Math.floor((bounds.left + bounds.right) / 2);
  const y: number = Math.floor((bounds.top + bounds.bottom) / 2);
  try {
    // 60ms 间隔的两次单击更贴近真实双击节奏，driver.doubleClick 的默认间隔偶尔超出应用双击识别窗口
    await driver.click(x, y);
    await sleep(60);
    await driver.click(x, y);
  } catch (error) {
    log('doubleClickImage failed: ' + String(error));
  }
  await sleep(RENDER_WAIT);
  return true;
}

async function resetImage(driver: Driver): Promise<void> {
  for (let i: number = 0; i < 4; i++) {
    const before: Rect | null = await getBoundsOrNull(driver, IMAGE_ID);
    if (before === null) {
      return;
    }
    if (!(await doubleClickImage(driver))) {
      return;
    }
    const after: Rect | null = await getBoundsOrNull(driver, IMAGE_ID);
    if (after === null || after.top > before.top + POSITION_TOLERANCE) {
      return;
    }
  }
}

export default function previewUiStateTest(): void {
  describe('PreviewUiStateTest', () => {
    beforeAll(async () => {
      log('beforeAll start');
      try {
        await delegator.startAbility({ bundleName: BUNDLE, abilityName: ABILITY });
      } catch (error) {
        log('beforeAll startAbility failed: ' + String(error));
      }
      await sleep(2500);
      log('beforeAll end');
    });

    afterEach(async () => {
      const driver: Driver = Driver.create();
      await resetImage(driver);
      const actual: boolean = await exists(driver, IMAGE_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, IMAGE_ID)=${actual}`);
      expect(actual).assertTrue();
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_PREVIEWUI_0601
     * @tc.name      testPreviewUi0601
     * @tc.desc      Verify the preview page exposes image, stack and list.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPreviewUi0601', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testPreviewUi0601 begin');
      const driver: Driver = Driver.create();
      const actual2: boolean = await ensurePrepared(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue ensurePrepared(driver)=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: boolean = await exists(driver, STACK_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, STACK_ID)=${actual3}`);
      expect(actual3).assertTrue();
      const actual4: boolean = await exists(driver, LIST_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, LIST_ID)=${actual4}`);
      expect(actual4).assertTrue();
      log('testPreviewUi0601 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_PREVIEWUI_0602
     * @tc.name      testPreviewUi0602
     * @tc.desc      Verify the preview image is loaded with visible bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPreviewUi0602', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testPreviewUi0602 begin');
      const driver: Driver = Driver.create();
      const actual5: boolean = await ensurePrepared(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue ensurePrepared(driver)=${actual5}`);
      expect(actual5).assertTrue();
      const bounds: Rect = await getBounds(driver, IMAGE_ID);
      const width: number = bounds.right - bounds.left;
      const height: number = bounds.bottom - bounds.top;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger width=${width}, expected=0`);
      expect(width).assertLarger(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger height=${height}, expected=0`);
      expect(height).assertLarger(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${width / height > 0.2 && width / height < 5}`);
      expect(width / height > 0.2 && width / height < 5).assertTrue();
      log('testPreviewUi0602 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_PREVIEWUI_0603
     * @tc.name      testPreviewUi0603
     * @tc.desc      Verify the loaded image fits inside the display size.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPreviewUi0603', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testPreviewUi0603 begin');
      const driver: Driver = Driver.create();
      const actual6: boolean = await ensurePrepared(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue ensurePrepared(driver)=${actual6}`);
      expect(actual6).assertTrue();
      const bounds: Rect = await getBounds(driver, IMAGE_ID);
      const display = await driver.getDisplaySize();
      const width: number = bounds.right - bounds.left;
      const height: number = bounds.bottom - bounds.top;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger width=${width}, expected=0`);
      expect(width).assertLarger(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue width <= display.x=${width <= display.x}`);
      expect(width <= display.x).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue height <= display.y=${height <= display.y}`);
      expect(height <= display.y).assertTrue();
      log('testPreviewUi0603 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_PREVIEWUI_0604
     * @tc.name      testPreviewUi0604
     * @tc.desc      Verify a double click enlarges the image vertically.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPreviewUi0604', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testPreviewUi0604 begin');
      const driver: Driver = Driver.create();
      const actual7: boolean = await ensurePrepared(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue ensurePrepared(driver)=${actual7}`);
      expect(actual7).assertTrue();
      const before: Rect = await getBounds(driver, IMAGE_ID);
      await doubleClickImage(driver);
      const after: Rect = await getBounds(driver, IMAGE_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLess after.top=${after.top}, expected=before.top`);
      expect(after.top).assertLess(before.top);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger after.bottom=${after.bottom}, expected=before.bottom`);
      expect(after.bottom).assertLarger(before.bottom);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger after.bottom - after.top=${after.bottom - after.top}`);
      expect(after.bottom - after.top).assertLarger(before.bottom - before.top);
      log('testPreviewUi0604 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_PREVIEWUI_0605
     * @tc.name      testPreviewUi0605
     * @tc.desc      Verify a double click enlarges the image horizontally.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPreviewUi0605', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testPreviewUi0605 begin');
      const driver: Driver = Driver.create();
      const actual8: boolean = await ensurePrepared(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue ensurePrepared(driver)=${actual8}`);
      expect(actual8).assertTrue();
      const before: Rect = await getBounds(driver, IMAGE_ID);
      await doubleClickImage(driver);
      const after: Rect = await getBounds(driver, IMAGE_ID);
      const beforeWidth: number = before.right - before.left;
      const afterWidth: number = after.right - after.left;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger afterWidth=${afterWidth}, expected=beforeWidth`);
      expect(afterWidth).assertLarger(beforeWidth);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue afterWidth / beforeWidth > 1=${afterWidth / beforeWidth > 1}`);
      expect(afterWidth / beforeWidth > 1).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLess after.left=${after.left}, expected=before.left`);
      expect(after.left).assertLess(before.left);
      log('testPreviewUi0605 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_PREVIEWUI_0606
     * @tc.name      testPreviewUi0606
     * @tc.desc      Verify a second double click restores the default size.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPreviewUi0606', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testPreviewUi0606 begin');
      const driver: Driver = Driver.create();
      const actual9: boolean = await ensurePrepared(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue ensurePrepared(driver)=${actual9}`);
      expect(actual9).assertTrue();
      const base: Rect = await getBounds(driver, IMAGE_ID);
      await doubleClickImage(driver);
      const enlarged: Rect = await getBounds(driver, IMAGE_ID);
      await doubleClickImage(driver);
      const restored: Rect = await getBounds(driver, IMAGE_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLess enlarged.top=${enlarged.top}, expected=base.top`);
      expect(enlarged.top).assertLess(base.top);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger restored.top=${restored.top}, expected=enlarged.top`);
      expect(restored.top).assertLarger(enlarged.top);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue Math.abs(restored.top - base.top) < POSITION_TOLERANCE`);
      expect(Math.abs(restored.top - base.top) < POSITION_TOLERANCE).assertTrue();
      log('testPreviewUi0606 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_PREVIEWUI_0607
     * @tc.name      testPreviewUi0607
     * @tc.desc      Verify a pinch out gesture enlarges the image.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPreviewUi0607', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testPreviewUi0607 begin');
      const driver: Driver = Driver.create();
      const actual10: boolean = await ensurePrepared(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue ensurePrepared(driver)=${actual10}`);
      expect(actual10).assertTrue();
      const before: Rect = await getBounds(driver, IMAGE_ID);
      const image: Component = await driver.findComponent(ON.id(IMAGE_ID));
      await image.pinchOut(1.1);
      await sleep(RENDER_WAIT);
      const after: Rect = await getBounds(driver, IMAGE_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLess after.top=${after.top}, expected=before.top`);
      expect(after.top).assertLess(before.top);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger after.right - after.left=${after.right - after.left}`);
      expect(after.right - after.left).assertLarger(before.right - before.left);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger after.bottom=${after.bottom}, expected=before.bottom`);
      expect(after.bottom).assertLarger(before.bottom);
      log('testPreviewUi0607 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_PREVIEWUI_0608
     * @tc.name      testPreviewUi0608
     * @tc.desc      Verify pinching in after zoom shrinks the zoomed image.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPreviewUi0608', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testPreviewUi0608 begin');
      const driver: Driver = Driver.create();
      const actual11: boolean = await ensurePrepared(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue ensurePrepared(driver)=${actual11}`);
      expect(actual11).assertTrue();
      const base: Rect = await getBounds(driver, IMAGE_ID);
      await doubleClickImage(driver);
      const enlarged: Rect = await getBounds(driver, IMAGE_ID);
      const image: Component = await driver.findComponent(ON.id(IMAGE_ID));
      await image.pinchIn(0.5);
      await sleep(RENDER_WAIT);
      const restored: Rect = await getBounds(driver, IMAGE_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLess enlarged.top=${enlarged.top}, expected=base.top`);
      expect(enlarged.top).assertLess(base.top);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger restored.top=${restored.top}, expected=enlarged.top`);
      expect(restored.top).assertLarger(enlarged.top);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger restored.bottom - restored.top=${restored.bottom - restored.top}`);
      expect(restored.bottom - restored.top).assertLarger(base.bottom - base.top);
      log('testPreviewUi0608 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_PREVIEWUI_0609
     * @tc.name      testPreviewUi0609
     * @tc.desc      Verify a zoomed image can be dragged upward.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPreviewUi0609', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testPreviewUi0609 begin');
      const driver: Driver = Driver.create();
      const actual12: boolean = await ensurePrepared(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue ensurePrepared(driver)=${actual12}`);
      expect(actual12).assertTrue();
      const image: Component = await driver.findComponent(ON.id(IMAGE_ID));
      await image.pinchOut(1.1);
      await sleep(RENDER_WAIT);
      const before: Rect = await getBounds(driver, IMAGE_ID);
      await driver.swipe(240, 360, 240, 240);
      await sleep(RENDER_WAIT);
      const after: Rect = await getBounds(driver, IMAGE_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLess after.top=${after.top}, expected=before.top`);
      expect(after.top).assertLess(before.top);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLess after.bottom=${after.bottom}, expected=before.bottom`);
      expect(after.bottom).assertLess(before.bottom);
      const actual13: boolean = await exists(driver, IMAGE_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, IMAGE_ID)=${actual13}`);
      expect(actual13).assertTrue();
      log('testPreviewUi0609 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_PREVIEWUI_0610
     * @tc.name      testPreviewUi0610
     * @tc.desc      Verify a zoomed image can be dragged downward.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPreviewUi0610', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testPreviewUi0610 begin');
      const driver: Driver = Driver.create();
      const actual14: boolean = await ensurePrepared(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue ensurePrepared(driver)=${actual14}`);
      expect(actual14).assertTrue();
      const image: Component = await driver.findComponent(ON.id(IMAGE_ID));
      await image.pinchOut(1.1);
      await sleep(RENDER_WAIT);
      await driver.swipe(240, 360, 240, 240);
      await sleep(RENDER_WAIT);
      const before: Rect = await getBounds(driver, IMAGE_ID);
      await driver.swipe(240, 240, 240, 360);
      await sleep(RENDER_WAIT);
      const after: Rect = await getBounds(driver, IMAGE_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger after.top=${after.top}, expected=before.top`);
      expect(after.top).assertLarger(before.top);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger after.bottom=${after.bottom}, expected=before.bottom`);
      expect(after.bottom).assertLarger(before.bottom);
      const actual15: boolean = await exists(driver, IMAGE_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, IMAGE_ID)=${actual15}`);
      expect(actual15).assertTrue();
      log('testPreviewUi0610 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_PREVIEWUI_0611
     * @tc.name      testPreviewUi0611
     * @tc.desc      Verify repeated double clicks cycle size states stably.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPreviewUi0611', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testPreviewUi0611 begin');
      const driver: Driver = Driver.create();
      const actual16: boolean = await ensurePrepared(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue ensurePrepared(driver)=${actual16}`);
      expect(actual16).assertTrue();
      const base: Rect = await getBounds(driver, IMAGE_ID);
      await doubleClickImage(driver);
      const firstTop: number = (await getBounds(driver, IMAGE_ID)).top;
      await doubleClickImage(driver);
      const secondTop: number = (await getBounds(driver, IMAGE_ID)).top;
      await doubleClickImage(driver);
      const thirdTop: number = (await getBounds(driver, IMAGE_ID)).top;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLess firstTop=${firstTop}, expected=base.top`);
      expect(firstTop).assertLess(base.top);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${Math.abs(secondTop - base.top) < POSITION_TOLERANCE}`);
      expect(Math.abs(secondTop - base.top) < POSITION_TOLERANCE).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLess thirdTop=${thirdTop}, expected=base.top`);
      expect(thirdTop).assertLess(base.top);
      log('testPreviewUi0611 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_PREVIEWUI_0612
     * @tc.name      testPreviewUi0612
     * @tc.desc      Verify a pinch out after double click zoom keeps the image filling the view.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPreviewUi0612', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testPreviewUi0612 begin');
      const driver: Driver = Driver.create();
      const actual17: boolean = await ensurePrepared(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue ensurePrepared(driver)=${actual17}`);
      expect(actual17).assertTrue();
      const stack: Rect = await getBounds(driver, STACK_ID);
      await doubleClickImage(driver);
      const image: Component = await driver.findComponent(ON.id(IMAGE_ID));
      await image.pinchOut(1.1);
      await sleep(RENDER_WAIT);
      const after: Rect = await getBounds(driver, IMAGE_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue after.top=${after.top} <= stack.top=${stack.top}`);
      expect(after.top <= stack.top + POSITION_TOLERANCE).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue after.bottom=${after.bottom} >= stack.bottom=${stack.bottom}`);
      expect(after.bottom >= stack.bottom - POSITION_TOLERANCE).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger after.right - after.left=${after.right - after.left}`);
      expect(after.right - after.left).assertLarger(0);
      const actual18: boolean = await exists(driver, IMAGE_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, IMAGE_ID)=${actual18}`);
      expect(actual18).assertTrue();
      log('testPreviewUi0612 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_PREVIEWUI_0613
     * @tc.name      testPreviewUi0613
     * @tc.desc      Verify a double click restores after pinch out zoom.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPreviewUi0613', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testPreviewUi0613 begin');
      const driver: Driver = Driver.create();
      const actual19: boolean = await ensurePrepared(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue ensurePrepared(driver)=${actual19}`);
      expect(actual19).assertTrue();
      const base: Rect = await getBounds(driver, IMAGE_ID);
      const image: Component = await driver.findComponent(ON.id(IMAGE_ID));
      await image.pinchOut(1.1);
      await sleep(RENDER_WAIT);
      const enlarged: Rect = await getBounds(driver, IMAGE_ID);
      await doubleClickImage(driver);
      const restored: Rect = await getBounds(driver, IMAGE_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLess enlarged.top=${enlarged.top}, expected=base.top`);
      expect(enlarged.top).assertLess(base.top);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger restored.top=${restored.top}, expected=enlarged.top`);
      expect(restored.top).assertLarger(enlarged.top);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue Math.abs(restored.top - base.top) < POSITION_TOLERANCE`);
      expect(Math.abs(restored.top - base.top) < POSITION_TOLERANCE).assertTrue();
      log('testPreviewUi0613 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_PREVIEWUI_0614
     * @tc.name      testPreviewUi0614
     * @tc.desc      Verify clicking the preview list keeps the viewer stable.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPreviewUi0614', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testPreviewUi0614 begin');
      const driver: Driver = Driver.create();
      const actual20: boolean = await ensurePrepared(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue ensurePrepared(driver)=${actual20}`);
      expect(actual20).assertTrue();
      const list: Component = await driver.findComponent(ON.id(LIST_ID));
      await list.click();
      await sleep(RENDER_WAIT);
      const actual21: boolean = await exists(driver, IMAGE_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, IMAGE_ID)=${actual21}`);
      expect(actual21).assertTrue();
      const actual22: boolean = await exists(driver, STACK_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, STACK_ID)=${actual22}`);
      expect(actual22).assertTrue();
      const actual23: boolean = await exists(driver, LIST_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue exists(driver, LIST_ID)=${actual23}`);
      expect(actual23).assertTrue();
      log('testPreviewUi0614 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_PREVIEWUI_0615
     * @tc.name      testPreviewUi0615
     * @tc.desc      Verify the idle preview image bounds stay unchanged.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testPreviewUi0615', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      log('testPreviewUi0615 begin');
      const driver: Driver = Driver.create();
      const actual24: boolean = await ensurePrepared(driver);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue ensurePrepared(driver)=${actual24}`);
      expect(actual24).assertTrue();
      const first: Rect = await getBounds(driver, IMAGE_ID);
      await sleep(1500);
      const second: Rect = await getBounds(driver, IMAGE_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual second.right - second.left=${second.right - second.left}`);
      expect(second.right - second.left).assertEqual(first.right - first.left);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual second.bottom - second.top=${second.bottom - second.top}`);
      expect(second.bottom - second.top).assertEqual(first.bottom - first.top);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual second.top=${second.top}, expected=first.top`);
      expect(second.top).assertEqual(first.top);
      log('testPreviewUi0615 end');
    })
  })
}
