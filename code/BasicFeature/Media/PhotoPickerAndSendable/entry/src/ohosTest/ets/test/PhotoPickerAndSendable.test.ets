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

import { describe, beforeAll, beforeEachIt, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { abilityDelegatorRegistry, Component, Driver, ON } from '@kit.TestKit';
import { Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { ColorMatrixUtil, MediaFilterType } from 'photopickersendable';

/** Log domain of the sample application. */
const DOMAIN: number = 0xF811;
/** Suite tag used by every log line emitted outside a single case, such as beforeAll. */
const SUITE_TAG: string = '[Sample_PhotoPickerAndSendable]';
/** Ability that has to be started before the UI cases run. */
const APP_ABILITY: string = 'EntryAbility';
/** Maximum time in milliseconds to wait for one component. */
const WAIT_TIME: number = 5000;
/** Delay in milliseconds inserted between two UI interactions. */
const STEP_DELAY: number = 1000;
/** Number of values expected in one color matrix. */
const MATRIX_SIZE: number = 20;
/** Normalized red channel offset produced by the warm preset filter, effectKit expects offsets in [-1, 1]. */
const WARM_OFFSET: number = 0.14;

/** Driver shared by every case of the suite. */
const driver: Driver = Driver.create();

/**
 * Asserts that one component exists on the current page.
 * Fails the current case with error 17000003 when the component is absent.
 * @param id Component id declared in the page under test.
 */
async function assertExists(id: string): Promise<void> {
  // Assert on the driver so a missing component raises a test failure.
  await driver.assertComponentExist(ON.id(id));
  // Wait for the UI to settle before the next assertion runs.
  await driver.delayMs(STEP_DELAY);
}

/**
 * Clicks one component and waits for the step delay afterwards.
 * @param id Component id declared in the page under test.
 */
async function clickById(id: string): Promise<void> {
  // Wait for the component to appear inside the maximum wait time.
  const component: Component = await driver.waitForComponent(ON.id(id), WAIT_TIME);
  // Trigger the click on the found component.
  await component.click();
  // Wait for the UI to settle before the next assertion runs.
  await driver.delayMs(STEP_DELAY);
}

/**
 * Presses the back key and waits for the step delay afterwards.
 */
async function backToHome(): Promise<void> {
  // Press the system back key so the sample returns to the home page.
  await driver.pressBack();
  // Wait for the navigation animation to settle.
  await driver.delayMs(STEP_DELAY);
}

async function yieldToEventLoop(): Promise<void> {
  // A timer returns control to EventHandler; resolved promises only drain microtasks.
  await new Promise<void>((resolve: () => void): void => {
    setTimeout(resolve, 1);
  });
}

/**
 * Registers every test case of the sample application.
 */
export default function photoPickerAndSendableTest() {
  // Root-level beforeEachIt is inherited by every child suite.
  beforeEachIt(yieldToEventLoop);
  // Group every case under one suite name reported by hypium.
  describe('PhotoPickerAndSendableTest', () => {
    // Start the sample ability once before the first case runs.
    beforeAll(async () => {
      // Log the suite start so the hilog stream is easy to split per run.
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', SUITE_TAG + ' beforeAll start');
      // Take the delegator used to start the ability under test.
      const delegator = abilityDelegatorRegistry.getAbilityDelegator();
      // Read the arguments injected by the test framework.
      const args = abilityDelegatorRegistry.getArguments();
      // Describe the ability that has to be started.
      const want: Want = {
        bundleName: args.bundleName,
        abilityName: APP_ABILITY
      };
      // Start the sample ability so the UI cases can drive it.
      await delegator.startAbility(want);
      // Wait for the ability window to become visible.
      await driver.delayMs(STEP_DELAY * 2);
      // Log the suite setup end.
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', SUITE_TAG + ' beforeAll end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_UI_HOMEPAGE_0100
     * @tc.name      testHomePage0001
     * @tc.desc      Verify the home page shows the title and the picker
     *               and cache scene entries.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testHomePage0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testHomePage0001';
      // Log the case start.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Assert that the home title is visible.
      await assertExists('id_home_title');
      // Assert that the picker scene entry is visible.
      await assertExists('id_home_scene_picker');
      // Assert that the cache scene entry is visible.
      await assertExists('id_home_scene_cache');
      // Log the case end.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_UI_PICKER_0100
     * @tc.name      testPickerScene0001
     * @tc.desc      Verify the picker scene opens with its pick hint, open
     *               picker button and confirm button.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testPickerScene0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testPickerScene0001';
      // Log the case start.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Open the picker scene from the home page.
      await clickById('id_home_scene_picker');
      // Assert that the hint text is visible.
      await assertExists('id_picker_hint');
      // Assert that the open picker button is visible.
      await assertExists('id_picker_open');
      // Assert that the confirm button is visible.
      await assertExists('id_picker_confirm');
      // Return to the home page for the next case.
      await backToHome();
      // Log the case end.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_UI_RECENT_0100
     * @tc.name      testRecentScene0001
     * @tc.desc      Verify the recent photo scene opens with its query button
     *               and auto refresh switch.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testRecentScene0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testRecentScene0001';
      // Log the case start.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Open the recent photo scene from the home page.
      await clickById('id_home_scene_recent');
      // Assert that the query button is visible.
      await assertExists('id_recent_query');
      // Assert that the auto refresh switch is visible.
      await assertExists('id_recent_autorefresh_toggle');
      // Return to the home page for the next case.
      await backToHome();
      // Log the case end.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_UI_GALLERY_0100
     * @tc.name      testGalleryScene0001
     * @tc.desc      Verify the gallery scene opens and shows the loaded media
     *               item count text.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testGalleryScene0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testGalleryScene0001';
      // Log the case start.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Open the gallery scene from the home page.
      await clickById('id_home_scene_gallery');
      // Assert that the item count text is visible.
      await assertExists('id_gallery_count');
      // Return to the home page for the next case.
      await backToHome();
      // Log the case end.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_UI_EDIT_0100
     * @tc.name      testEditScene0001
     * @tc.desc      Verify the editor scene shows the empty source tip when no
     *               image is selected.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testEditScene0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testEditScene0001';
      // Log the case start.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Open the editor scene from the home page.
      await clickById('id_home_scene_edit');
      // Assert that the empty source tip is visible.
      await assertExists('id_edit_no_source');
      // Return to the home page for the next case.
      await backToHome();
      // Log the case end.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_UI_CACHE_0100
     * @tc.name      testCacheScene0001
     * @tc.desc      Verify the cache scene opens and shows the total size card
     *               and the export entry.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testCacheScene0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testCacheScene0001';
      // Log the case start.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Open the cache scene from the home page.
      await clickById('id_home_scene_cache');
      // Assert that the total size card is visible.
      await assertExists('id_cache_total');
      // Assert that the export button is visible.
      await assertExists('id_cache_export');
      // Return to the home page for the next case.
      await backToHome();
      // Log the case end.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_COLORMATRIX_0100
     * @tc.name      testColorMatrix0001
     * @tc.desc      Verify the neutral color matrix built by ColorMatrixUtil
     *               keeps unit factors and zero offsets.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testColorMatrix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testColorMatrix0001';
      // Log the case start.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Build the matrix with both multipliers at one to obtain the neutral transform.
      const matrix: number[] = ColorMatrixUtil.build(1, 1, MediaFilterType.ORIGINAL);
      // Log the produced matrix length.
      hilog.info(DOMAIN, TAG, '%{public}s', 'matrix size: ' + matrix.length);
      // Assert that the matrix holds the expected number of values.
      expect(matrix.length).assertEqual(MATRIX_SIZE);
      // Log the red channel factor of the neutral matrix.
      hilog.info(DOMAIN, TAG, '%{public}s', 'red factor: ' + matrix[0]);
      // Assert that the red factor is one.
      expect(matrix[0]).assertEqual(1);
      // Log the red channel offset of the neutral matrix.
      hilog.info(DOMAIN, TAG, '%{public}s', 'red offset: ' + matrix[4]);
      // Assert that the red offset is zero.
      expect(matrix[4]).assertEqual(0);
      // Log the alpha factor of the neutral matrix.
      hilog.info(DOMAIN, TAG, '%{public}s', 'alpha factor: ' + matrix[18]);
      // Assert that the alpha factor is one.
      expect(matrix[18]).assertEqual(1);
      // Log the case end.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_COLORMATRIX_0200
     * @tc.name      testColorMatrix0002
     * @tc.desc      Verify the contrast, grayscale and warm preset branches of
     *               the ColorMatrixUtil build.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testColorMatrix0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testColorMatrix0002';
      // Log the case start.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Build the matrix of the contrast branch.
      const contrastMatrix: number[] = ColorMatrixUtil.build(2, 1, MediaFilterType.ORIGINAL);
      // Log the produced contrast factor.
      hilog.info(DOMAIN, TAG, '%{public}s', 'contrast factor: ' + contrastMatrix[0]);
      // Assert that the contrast multiplier reaches the red factor.
      expect(contrastMatrix[0]).assertEqual(2);
      // Build the matrix of the full grayscale branch.
      const grayMatrix: number[] = ColorMatrixUtil.build(1, 0, MediaFilterType.ORIGINAL);
      // Read the luma weight stored in the red factor.
      const lumaRed: number = grayMatrix[0];
      // Log the produced luma weight.
      hilog.info(DOMAIN, TAG, '%{public}s', 'luma red: ' + lumaRed);
      // Assert that the luma weight matches the standard red coefficient.
      expect(Math.abs(lumaRed - 0.2126) < 0.0001).assertTrue();
      // Build the matrix of the warm preset branch.
      const warmMatrix: number[] = ColorMatrixUtil.build(1, 1, MediaFilterType.WARM);
      // Log the produced warm red offset.
      hilog.info(DOMAIN, TAG, '%{public}s', 'warm red offset: ' + warmMatrix[4]);
      // Assert that the warm preset lifts the red channel.
      expect(warmMatrix[4]).assertEqual(WARM_OFFSET);
      // Log the produced warm blue offset.
      hilog.info(DOMAIN, TAG, '%{public}s', 'warm blue offset: ' + warmMatrix[14]);
      // Assert that the warm preset lowers the blue channel.
      expect(warmMatrix[14]).assertEqual(-WARM_OFFSET);
      // Log the case end.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    it('testEventLoopYield0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async (): Promise<void> => {
      let timerHandled: boolean = false;
      const timerId: number = setTimeout(() => {
        timerHandled = true;
      }, 0);
      try {
        await yieldToEventLoop();
        expect(timerHandled).assertTrue();
      } finally {
        clearTimeout(timerId);
      }
    });
  });
}
