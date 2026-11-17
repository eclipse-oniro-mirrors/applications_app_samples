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

import { describe, it, expect, beforeAll } from '@ohos/hypium';
import { Driver, Component, ON } from '@ohos.UiTest';
import Logger from '../../utils/Logger';
import {
  BUNDLE,
  CANVAS_COUNT,
  CANVAS_HEIGHT_PX,
  CANVAS_WIDTH_PX,
  ID_DESTROY_ANIMATION,
  ID_PAUSE,
  ID_PLAY,
  ID_PLAY_ORDER,
  ID_SELECT_ANIMATION,
  ID_SPEED,
  ID_START_PLAY,
  ID_SUSPEND,
  TAB_BAR_MAX_HEIGHT,
  TAB_BAR_MAX_LEFT,
  TAB_BAR_MAX_WIDTH,
  TIMEOUT_TEXT,
  SuiteTag,
  UiText
} from '../common/TestConstant';
import {
  BoundsInfo,
  createDriver,
  ensureAppVisible,
  findById,
  findTabBar,
  getComponentBounds,
  waitForText
} from '../common/UiFlowHelper';

const TAG: string = SuiteTag.LAYOUT;

async function assertControlExists(driver: Driver, id: string): Promise<void> {
  const component: Component | null = await findById(driver, id);
  expect(component !== null).assertTrue();
}

/**
 * Structural contract of the single page of the sample. The suite proves that
 * every addressable control and both canvases exist with the declared geometry
 * so that the interaction suites can rely on stable anchors.
 */
export default function pageLayoutTest(): void {
  describe('LottiePageLayoutTest', (): void => {
    let driver: Driver;

    beforeAll(async (): Promise<void> => {
      driver = await createDriver();
      await ensureAppVisible(driver);
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_LAYOUT_0100
     * @tc.name pageTitleVisible001
     * @tc.desc Verify the page title of the Lottie sample is rendered
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it(BUNDLE + 'pageTitleVisible_001', 0, async (): Promise<void> => {
      Logger.info(TAG, 'pageTitleVisible_001 begin');
      const visible: boolean = await waitForText(driver, UiText.PAGE_TITLE, TIMEOUT_TEXT);
      const check01: boolean = visible;
      Logger.info(TAG, 'pageTitleVisible_001, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'pageTitleVisible_001 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_LAYOUT_0200
     * @tc.name playControlPresent002
     * @tc.desc Verify the top play/pause control is addressable by id
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it(BUNDLE + 'playControlPresent_002', 0, async (): Promise<void> => {
      Logger.info(TAG, 'playControlPresent_002 begin');
      await assertControlExists(driver, ID_PLAY);
      Logger.info(TAG, 'playControlPresent_002 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_LAYOUT_0300
     * @tc.name stopControlPresent003
     * @tc.desc Verify the top stop control is addressable by id
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it(BUNDLE + 'stopControlPresent_003', 0, async (): Promise<void> => {
      Logger.info(TAG, 'stopControlPresent_003 begin');
      await assertControlExists(driver, ID_SUSPEND);
      Logger.info(TAG, 'stopControlPresent_003 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_LAYOUT_0400
     * @tc.name pauseControlPresent004
     * @tc.desc Verify the top pause control is addressable by id
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it(BUNDLE + 'pauseControlPresent_004', 0, async (): Promise<void> => {
      Logger.info(TAG, 'pauseControlPresent_004 begin');
      await assertControlExists(driver, ID_PAUSE);
      Logger.info(TAG, 'pauseControlPresent_004 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_LAYOUT_0500
     * @tc.name startControlPresent005
     * @tc.desc Verify the top start control is addressable by id
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it(BUNDLE + 'startControlPresent_005', 0, async (): Promise<void> => {
      Logger.info(TAG, 'startControlPresent_005 begin');
      await assertControlExists(driver, ID_START_PLAY);
      Logger.info(TAG, 'startControlPresent_005 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_LAYOUT_0600
     * @tc.name speedControlPresent006
     * @tc.desc Verify the speed menu anchor is addressable by id
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it(BUNDLE + 'speedControlPresent_006', 0, async (): Promise<void> => {
      Logger.info(TAG, 'speedControlPresent_006 begin');
      await assertControlExists(driver, ID_SPEED);
      Logger.info(TAG, 'speedControlPresent_006 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_LAYOUT_0700
     * @tc.name orderControlPresent007
     * @tc.desc Verify the play order menu anchor is addressable by id
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it(BUNDLE + 'orderControlPresent_007', 0, async (): Promise<void> => {
      Logger.info(TAG, 'orderControlPresent_007 begin');
      await assertControlExists(driver, ID_PLAY_ORDER);
      Logger.info(TAG, 'orderControlPresent_007 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_LAYOUT_0800
     * @tc.name destroyControlPresent008
     * @tc.desc Verify the destroy anchor is addressable by id
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it(BUNDLE + 'destroyControlPresent_008', 0, async (): Promise<void> => {
      Logger.info(TAG, 'destroyControlPresent_008 begin');
      await assertControlExists(driver, ID_DESTROY_ANIMATION);
      Logger.info(TAG, 'destroyControlPresent_008 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_LAYOUT_0900
     * @tc.name topPanelLabelsPresent009
     * @tc.desc Verify the labels of the top control panel are rendered
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'topPanelLabelsPresent_009', 0, async (): Promise<void> => {
      Logger.info(TAG, 'topPanelLabelsPresent_009 begin');
      const check01: boolean = await waitForText(driver, UiText.LABEL_SPEED, TIMEOUT_TEXT);
      Logger.info(TAG, 'topPanelLabelsPresent_009, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      const check02: boolean = await waitForText(driver, UiText.LABEL_ORDER, TIMEOUT_TEXT);
      Logger.info(TAG, 'topPanelLabelsPresent_009, check02=' + JSON.stringify(check02));
      expect(check02).assertTrue();
      const check03: boolean = await waitForText(driver, UiText.LABEL_DESTROY, TIMEOUT_TEXT);
      Logger.info(TAG, 'topPanelLabelsPresent_009, check03=' + JSON.stringify(check03));
      expect(check03).assertTrue();
      Logger.info(TAG, 'topPanelLabelsPresent_009 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_LAYOUT_1000
     * @tc.name tabBarPresent010
     * @tc.desc Verify the vertical tab bar is present in the page tree
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it(BUNDLE + 'tabBarPresent_010', 0, async (): Promise<void> => {
      Logger.info(TAG, 'tabBarPresent_010 begin');
      const bar: Component | null = await findTabBar(driver);
      const check01: boolean = bar !== null;
      Logger.info(TAG, 'tabBarPresent_010, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'tabBarPresent_010 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_LAYOUT_1100
     * @tc.name tabBarWidthBounded011
     * @tc.desc Verify the tab bar width is positive and within the declared bar width
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'tabBarWidthBounded_011', 0, async (): Promise<void> => {
      Logger.info(TAG, 'tabBarWidthBounded_011 begin');
      const bar: Component | null = await findTabBar(driver);
      const check01: boolean = bar !== null;
      Logger.info(TAG, 'tabBarWidthBounded_011, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      if (bar === null) {
        return;
      }
      const bounds: BoundsInfo = await getComponentBounds(bar);
      const check02: number = bounds.right - bounds.left;
      Logger.info(TAG, 'tabBarWidthBounded_011, check02=' + JSON.stringify(check02));
      expect(check02 > 0).assertTrue();
      const check03: boolean = check02 <= TAB_BAR_MAX_WIDTH;
      Logger.info(TAG, 'tabBarWidthBounded_011, check03=' + JSON.stringify(check03));
      expect(check03).assertTrue();
      Logger.info(TAG, 'tabBarWidthBounded_011 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_LAYOUT_1200
     * @tc.name tabBarHeightBounded012
     * @tc.desc Verify the tab bar height is positive and fits the tabs block
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'tabBarHeightBounded_012', 0, async (): Promise<void> => {
      Logger.info(TAG, 'tabBarHeightBounded_012 begin');
      const bar: Component | null = await findTabBar(driver);
      const check01: boolean = bar !== null;
      Logger.info(TAG, 'tabBarHeightBounded_012, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      if (bar === null) {
        return;
      }
      const bounds: BoundsInfo = await getComponentBounds(bar);
      const check02: number = bounds.bottom - bounds.top;
      Logger.info(TAG, 'tabBarHeightBounded_012, check02=' + JSON.stringify(check02));
      expect(check02 > 0).assertTrue();
      const check03: boolean = check02 <= TAB_BAR_MAX_HEIGHT;
      Logger.info(TAG, 'tabBarHeightBounded_012, check03=' + JSON.stringify(check03));
      expect(check03).assertTrue();
      Logger.info(TAG, 'tabBarHeightBounded_012 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_LAYOUT_1300
     * @tc.name byNameContentVisible013
     * @tc.desc Verify the default tab content explains the by-name control mode
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'byNameContentVisible_013', 0, async (): Promise<void> => {
      Logger.info(TAG, 'byNameContentVisible_013 begin');
      const visible: boolean = await waitForText(driver, UiText.CONTENT_BY_NAME, TIMEOUT_TEXT);
      const check01: boolean = visible;
      Logger.info(TAG, 'byNameContentVisible_013, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'byNameContentVisible_013 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_LAYOUT_1400
     * @tc.name twoCanvasesPresent014
     * @tc.desc Verify both animation canvases are part of the page
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it(BUNDLE + 'twoCanvasesPresent_014', 0, async (): Promise<void> => {
      Logger.info(TAG, 'twoCanvasesPresent_014 begin');
      const canvases: Array<Component> = await driver.findComponents(ON.type('Canvas'));
      const check01: boolean = canvases.length >= CANVAS_COUNT;
      Logger.info(TAG, 'twoCanvasesPresent_014, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'twoCanvasesPresent_014 end, count=' + canvases.length);
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_LAYOUT_1500
     * @tc.name canvasGeometry015
     * @tc.desc Verify each canvas keeps the declared 540px by 360px geometry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'canvasGeometry_015', 0, async (): Promise<void> => {
      Logger.info(TAG, 'canvasGeometry_015 begin');
      const canvases: Array<Component> = await driver.findComponents(ON.type('Canvas'));
      const check01: boolean = canvases.length >= CANVAS_COUNT;
      Logger.info(TAG, 'canvasGeometry_015, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      if (canvases.length < CANVAS_COUNT) {
        return;
      }
      for (let i: number = 0; i < CANVAS_COUNT; i++) {
        const bounds: BoundsInfo = await getComponentBounds(canvases[i]);
        const check02: number = bounds.right - bounds.left;
        Logger.info(TAG, 'canvasGeometry_015, check02=' + JSON.stringify(check02));
        expect(check02).assertEqual(CANVAS_WIDTH_PX);
        const check03: number = bounds.bottom - bounds.top;
        Logger.info(TAG, 'canvasGeometry_015, check03=' + JSON.stringify(check03));
        expect(check03).assertEqual(CANVAS_HEIGHT_PX);
      }
      Logger.info(TAG, 'canvasGeometry_015 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_LAYOUT_1600
     * @tc.name scrollContainerPresent016
     * @tc.desc Verify the page uses a scroll container for the long control stack
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'scrollContainerPresent_016', 0, async (): Promise<void> => {
      Logger.info(TAG, 'scrollContainerPresent_016 begin');
      const scrolls: Array<Component> = await driver.findComponents(ON.type('Scroll'));
      const check01: boolean = scrolls.length >= 1;
      Logger.info(TAG, 'scrollContainerPresent_016, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'scrollContainerPresent_016 end, count=' + scrolls.length);
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_LAYOUT_1700
     * @tc.name tabsContainerPresent017
     * @tc.desc Verify the page embeds the tabs container that hosts five control groups
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'tabsContainerPresent_017', 0, async (): Promise<void> => {
      Logger.info(TAG, 'tabsContainerPresent_017 begin');
      const tabs: Array<Component> = await driver.findComponents(ON.type('Tabs'));
      const check01: boolean = tabs.length >= 1;
      Logger.info(TAG, 'tabsContainerPresent_017, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'tabsContainerPresent_017 end, count=' + tabs.length);
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_LAYOUT_1800
     * @tc.name topPanelImagesPresent018
     * @tc.desc Verify the top control panel renders its icon images
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'topPanelImagesPresent_018', 0, async (): Promise<void> => {
      Logger.info(TAG, 'topPanelImagesPresent_018 begin');
      const images: Array<Component> = await driver.findComponents(ON.type('Image'));
      const check01: boolean = images.length >= 10;
      Logger.info(TAG, 'topPanelImagesPresent_018, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'topPanelImagesPresent_018 end, count=' + images.length);
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_LAYOUT_1900
     * @tc.name selectorTextMatchesState019
     * @tc.desc Verify the selector text is one of the two supported animation names or the initial hint
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'selectorTextMatchesState_019', 0, async (): Promise<void> => {
      Logger.info(TAG, 'selectorTextMatchesState_019 begin');
      const selector: Component | null = await findById(driver, ID_SELECT_ANIMATION);
      const check01: boolean = selector !== null;
      Logger.info(TAG, 'selectorTextMatchesState_019, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      const hint: boolean = await waitForText(driver, UiText.PLACEHOLDER, 600);
      const grunt: boolean = await waitForText(driver, UiText.GRUNT, 600);
      const year: boolean = await waitForText(driver, UiText.YEAR, 600);
      const check02: boolean = hint || grunt || year;
      Logger.info(TAG, 'selectorTextMatchesState_019, check02=' + JSON.stringify(check02));
      expect(check02).assertTrue();
      Logger.info(TAG, 'selectorTextMatchesState_019 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_LAYOUT_2000
     * @tc.name topPanelPlayLabelsPresent020
     * @tc.desc Verify the four playback labels of the top control panel are rendered
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'topPanelPlayLabelsPresent_020', 0, async (): Promise<void> => {
      Logger.info(TAG, 'topPanelPlayLabelsPresent_020 begin');
      const check01: boolean = await waitForText(driver, UiText.TAB_PLAY_PAUSE, TIMEOUT_TEXT);
      Logger.info(TAG, 'topPanelPlayLabelsPresent_020, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      const check02: boolean = await waitForText(driver, UiText.LABEL_STOP, TIMEOUT_TEXT);
      Logger.info(TAG, 'topPanelPlayLabelsPresent_020, check02=' + JSON.stringify(check02));
      expect(check02).assertTrue();
      const check03: boolean = await waitForText(driver, UiText.LABEL_PAUSE, TIMEOUT_TEXT);
      Logger.info(TAG, 'topPanelPlayLabelsPresent_020, check03=' + JSON.stringify(check03));
      expect(check03).assertTrue();
      const check04: boolean = await waitForText(driver, UiText.LABEL_START, TIMEOUT_TEXT);
      Logger.info(TAG, 'topPanelPlayLabelsPresent_020, check04=' + JSON.stringify(check04));
      expect(check04).assertTrue();
      const duplicates: Array<Component> = await driver.findComponents(ON.text(UiText.TAB_PLAY_PAUSE));
      const check05: boolean = duplicates.length >= 2;
      Logger.info(TAG, 'topPanelPlayLabelsPresent_020, check05=' + JSON.stringify(check05));
      expect(check05).assertTrue();
      const check06: boolean = duplicates.length <= 10;
      Logger.info(TAG, 'topPanelPlayLabelsPresent_020, check06=' + JSON.stringify(check06));
      expect(check06).assertTrue();
      const stopLabels: Array<Component> = await driver.findComponents(ON.text(UiText.LABEL_STOP));
      const check07: boolean = stopLabels.length >= 1;
      Logger.info(TAG, 'topPanelPlayLabelsPresent_020, check07=' + JSON.stringify(check07));
      expect(check07).assertTrue();
      const check08: boolean = await waitForText(driver, UiText.PAGE_TITLE, TIMEOUT_TEXT);
      Logger.info(TAG, 'topPanelPlayLabelsPresent_020, check08=' + JSON.stringify(check08));
      expect(check08).assertTrue();
      // The top panel and the two play tabs legitimately share the play label.
      Logger.info(TAG, 'topPanelPlayLabelsPresent_020 end, duplicates=' + duplicates.length);
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_LAYOUT_2100
     * @tc.name tabBarInsideTabsContainer021
     * @tc.desc Verify the tab bar is nested at the left edge of the tabs container
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'tabBarInsideTabsContainer_021', 0, async (): Promise<void> => {
      Logger.info(TAG, 'tabBarInsideTabsContainer_021 begin');
      const bar: Component | null = await findTabBar(driver);
      const check01: boolean = bar !== null;
      Logger.info(TAG, 'tabBarInsideTabsContainer_021, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      if (bar === null) {
        return;
      }
      const bounds: BoundsInfo = await getComponentBounds(bar);
      const tabsList: Array<Component> = await driver.findComponents(ON.type('Tabs'));
      const check02: boolean = tabsList.length > 0;
      Logger.info(TAG, 'tabBarInsideTabsContainer_021, check02=' + JSON.stringify(check02));
      expect(check02).assertTrue();
      if (!check02) {
        return;
      }
      const tabsBounds: BoundsInfo = await getComponentBounds(tabsList[0]);
      const check03: boolean = bounds.left >= tabsBounds.left;
      Logger.info(TAG, 'tabBarInsideTabsContainer_021, check03=' + JSON.stringify(check03));
      expect(check03).assertTrue();
      const check04: boolean = bounds.right <= tabsBounds.right;
      Logger.info(TAG, 'tabBarInsideTabsContainer_021, check04=' + JSON.stringify(check04));
      expect(check04).assertTrue();
      const check05: boolean = (bounds.right - bounds.left) < (tabsBounds.right - tabsBounds.left);
      Logger.info(TAG, 'tabBarInsideTabsContainer_021, check05=' + JSON.stringify(check05));
      expect(check05).assertTrue();
      Logger.info(TAG, 'tabBarInsideTabsContainer_021 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_LAYOUT_2200
     * @tc.name canvasPairAlignment022
     * @tc.desc Verify both canvases share the same left edge and the same size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'canvasPairAlignment_022', 0, async (): Promise<void> => {
      Logger.info(TAG, 'canvasPairAlignment_022 begin');
      const canvases: Array<Component> = await driver.findComponents(ON.type('Canvas'));
      const check01: boolean = canvases.length >= CANVAS_COUNT;
      Logger.info(TAG, 'canvasPairAlignment_022, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      if (canvases.length < CANVAS_COUNT) {
        return;
      }
      const first: BoundsInfo = await getComponentBounds(canvases[0]);
      const second: BoundsInfo = await getComponentBounds(canvases[1]);
      const check02: number = second.left;
      Logger.info(TAG, 'canvasPairAlignment_022, check02=' + JSON.stringify(check02));
      expect(check02).assertEqual(first.left);
      const check03: number = second.right - second.left;
      Logger.info(TAG, 'canvasPairAlignment_022, check03=' + JSON.stringify(check03));
      expect(check03).assertEqual(first.right - first.left);
      const check04: number = second.bottom - second.top;
      Logger.info(TAG, 'canvasPairAlignment_022, check04=' + JSON.stringify(check04));
      expect(check04).assertEqual(first.bottom - first.top);
      Logger.info(TAG, 'canvasPairAlignment_022 end');
    });
  });
}
