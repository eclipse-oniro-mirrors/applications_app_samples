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

import { describe, it, expect, beforeAll, beforeEach, afterEach, afterAll } from '@ohos/hypium';
import { BreakpointUtils } from '../../../main/ets/utils/BreakpointUtils';
import { DeviceInfoUtils } from '../../../main/ets/utils/DeviceInfoUtils';
import { PromptUtils } from '../../../main/ets/utils/PromptUtils';
import {
  clickId,
  clickText,
  existsId,
  pressBack,
  runCase,
  scrollToId,
  startApp,
  textOfId,
  waitId,
  waitText
} from '../testkit/SharedDriver';

const BUNDLE_NAME: string = 'com.samples.popupsandprompts';
const ABILITY_NAME: string = 'EntryAbility';

export default function edgeTest() {
  describe('PopupsEdgeTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })
    /**
     * @tc.number SUB_POPUPS_EDGE_0100
     * @tc.name testPopupsEdgeRange0001
     * @tc.desc Verify zero, negative, reversed, and single-item range boundaries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPopupsEdgeRange0001', 0, async (done: Function) => {
      await runCase('testPopupsEdgeRange0001', async () => {
        expect(PromptUtils.clampRange(0, 0, 0).join('-')).assertEqual('0-0');
        expect(PromptUtils.clampRange(-1, -2, 10).join('-')).assertEqual('0-0');
        expect(PromptUtils.clampRange(10, 20, 10).join('-')).assertEqual('10-10');
        expect(PromptUtils.clampRange(20, 10, 10).join('-')).assertEqual('10-10');
        expect(PromptUtils.clampRange(0, 10, 1).join('-')).assertEqual('0-1');
        expect(PromptUtils.clampRange(1, 0, 1).join('-')).assertEqual('0-1');
        expect(PromptUtils.clampRange(2, 8, 8).join('-')).assertEqual('2-8');
        expect(PromptUtils.selectionSummary(0, 0, 0)).assertEqual('selected 0-0 of 0');
        expect(PromptUtils.selectionSummary(9, 2, 5)).assertEqual('selected 2-5 of 5');
        expect(PromptUtils.selectionSummary(5, 5, 5)).assertEqual('selected 5-5 of 5');
      }, done);
    });

    /**
     * @tc.number SUB_POPUPS_EDGE_0200
     * @tc.name testPopupsEdgeSummary0002
     * @tc.desc Verify empty labels, negative counters, and repeated toggle behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPopupsEdgeSummary0002', 0, async (done: Function) => {
      await runCase('testPopupsEdgeSummary0002', async () => {
        expect(PromptUtils.formatCount('', 0)).assertEqual(': 0');
        expect(PromptUtils.formatCount('x', -1)).assertEqual('x: -1');
        expect(PromptUtils.actionSummary('', 0)).assertEqual(' x0');
        expect(PromptUtils.actionSummary('menu', -2)).assertEqual('menu x-2');
        expect(PromptUtils.describeRange(-3, -1)).assertEqual('range=-3--1');
        expect(PromptUtils.toggleShown(PromptUtils.toggleShown(true))).assertTrue();
        expect(PromptUtils.toggleShown(PromptUtils.toggleShown(false))).assertFalse();
      }, done);
    });

    /**
     * @tc.number SUB_POPUPS_EDGE_0300
     * @tc.name testPopupsEdgeBacks0003
     * @tc.desc Verify exception prompt pages return through their back buttons
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPopupsEdgeBacks0003', 0, async (done: Function) => {
      await runCase('testPopupsEdgeBacks0003', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardException');
        await waitId('exceptionStatus');
        await clickId('exceptionBack');
        await waitId('pageTitle');
        await clickId('cardExceptionV2');
        await waitId('exceptionV2Status');
        await clickId('exceptionV2Back');
        await waitId('pageTitle');
      }, done);
    });

    /**
     * @tc.number SUB_POPUPS_MATRIX_0100
     * @tc.name testPopupsMatrixRange0006
     * @tc.desc Verify reversed, single-item, and zero-maximum ranges
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPopupsMatrixRange0006', 0, async (done: Function) => {
      await runCase('testPopupsMatrixRange0006', async () => {
        expect(PromptUtils.clampRange(10, 5, 10).join('-')).assertEqual('5-10');
        expect(PromptUtils.clampRange(10, 5, 5).join('-')).assertEqual('5-5');
        expect(PromptUtils.clampRange(-5, 5, 0).join('-')).assertEqual('0-0');
        expect(PromptUtils.selectionSummary(10, 5, 10)).assertEqual('selected 5-10 of 10');
      }, done);
    });

    /**
     * @tc.number SUB_POPUPS_MATRIX_0200
     * @tc.name testPopupsMatrixSummary0007
     * @tc.desc Verify large negative counts and zero-length labels
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPopupsMatrixSummary0007', 0, async (done: Function) => {
      await runCase('testPopupsMatrixSummary0007', async () => {
        expect(PromptUtils.formatCount('count', -100)).assertEqual('count: -100');
        expect(PromptUtils.actionSummary('tap', 0)).assertEqual('tap x0');
        expect(PromptUtils.describeRange(0, 0)).assertEqual('range=0-0');
        expect(PromptUtils.toggleShown(PromptUtils.toggleShown(PromptUtils.toggleShown(
          PromptUtils.toggleShown(true))))).assertTrue();
      }, done);
    });

    /**
     * @tc.number SUB_POPUPS_MATRIX_0300
     * @tc.name testPopupsMatrixSelection0008
     * @tc.desc Verify negative and out-of-range selection summaries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPopupsMatrixSelection0008', 0, async (done: Function) => {
      await runCase('testPopupsMatrixSelection0008', async () => {
        expect(PromptUtils.selectionSummary(-10, -5, 10)).assertEqual('selected 0-0 of 10');
        expect(PromptUtils.selectionSummary(10, 20, 10)).assertEqual('selected 10-10 of 10');
        expect(PromptUtils.selectionSummary(0, 10, 5)).assertEqual('selected 0-5 of 5');
        expect(PromptUtils.selectionSummary(5, 0, 5)).assertEqual('selected 0-5 of 5');
      }, done);
    });

    /**
     * @tc.number SUB_POPUPS_MATRIX_0400
     * @tc.name testPopupsMatrixToggle0009
     * @tc.desc Verify repeated toggle calls alternate deterministically
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPopupsMatrixToggle0009', 0, async (done: Function) => {
      await runCase('testPopupsMatrixToggle0009', async () => {
        expect(PromptUtils.toggleShown(PromptUtils.toggleShown(true))).assertTrue();
        expect(PromptUtils.toggleShown(PromptUtils.toggleShown(false))).assertFalse();
        expect(PromptUtils.toggleShown(PromptUtils.toggleShown(PromptUtils.toggleShown(true)))).assertFalse();
      }, done);
    });

    /**
     * @tc.number SUB_POPUPS_MATRIX_0500
     * @tc.name testPopupsMatrixCounters0010
     * @tc.desc Verify counter and range formatting at zero and negative values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPopupsMatrixCounters0010', 0, async (done: Function) => {
      await runCase('testPopupsMatrixCounters0010', async () => {
        expect(PromptUtils.formatCount('x', 0)).assertEqual('x: 0');
        expect(PromptUtils.formatCount('x', 1)).assertEqual('x: 1');
        expect(PromptUtils.formatCount('x', 999)).assertEqual('x: 999');
        expect(PromptUtils.actionSummary('a', 1)).assertEqual('a x1');
        expect(PromptUtils.describeRange(-1, 0)).assertEqual('range=-1-0');
      }, done);
    });


    /**
     * @tc.number SUB_POPUPS_MATRIX_0600
     * @tc.name testPopupsMatrixBreakpointBounds0012
     * @tc.desc Verify resolve, width helpers, padding, and grid at breakpoint boundaries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPopupsMatrixBreakpointBounds0012', 0, async (done: Function) => {
      await runCase('testPopupsMatrixBreakpointBounds0012', async () => {
        expect(BreakpointUtils.resolve(0)).assertEqual(BreakpointUtils.SM);
        expect(BreakpointUtils.resolve(599)).assertEqual(BreakpointUtils.SM);
        expect(BreakpointUtils.resolve(600)).assertEqual(BreakpointUtils.SM);
        expect(BreakpointUtils.resolve(601)).assertEqual(BreakpointUtils.MD);
        expect(BreakpointUtils.resolve(840)).assertEqual(BreakpointUtils.MD);
        expect(BreakpointUtils.resolve(841)).assertEqual(BreakpointUtils.LG);
        expect(BreakpointUtils.contentMaxWidth(600)).assertEqual(560);
        expect(BreakpointUtils.contentMaxWidth(601)).assertEqual(720);
        expect(BreakpointUtils.contentMaxWidth(841)).assertEqual(960);
        expect(BreakpointUtils.pagePadding(600)).assertEqual(16);
        expect(BreakpointUtils.pagePadding(601)).assertEqual(24);
        expect(BreakpointUtils.pagePadding(841)).assertEqual(32);
      }, done);
    });

    /**
     * @tc.number SUB_POPUPS_MATRIX_0700
     * @tc.name testPopupsMatrixGridBounds0013
     * @tc.desc Verify grid template, column count, and wide flag boundaries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPopupsMatrixGridBounds0013', 0, async (done: Function) => {
      await runCase('testPopupsMatrixGridBounds0013', async () => {
        expect(BreakpointUtils.gridTemplate(600)).assertEqual('1fr');
        expect(BreakpointUtils.gridTemplate(601)).assertEqual('1fr 1fr');
        expect(BreakpointUtils.gridTemplate(841)).assertEqual('1fr 1fr 1fr');
        expect(BreakpointUtils.columnCount(600)).assertEqual(1);
        expect(BreakpointUtils.columnCount(601)).assertEqual(2);
        expect(BreakpointUtils.columnCount(841)).assertEqual(3);
        expect(BreakpointUtils.isWide(600)).assertFalse();
        expect(BreakpointUtils.isWide(601)).assertTrue();
      }, done);
    });

    /**
     * @tc.number SUB_POPUPS_MATRIX_0800
     * @tc.name testPopupsMatrixDescribe0014
     * @tc.desc Verify breakpoint descriptions at zero and exact boundaries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPopupsMatrixDescribe0014', 0, async (done: Function) => {
      await runCase('testPopupsMatrixDescribe0014', async () => {
        expect(BreakpointUtils.describe(0)).assertEqual('width=0vp, breakpoint=sm');
        expect(BreakpointUtils.describe(600)).assertEqual('width=600vp, breakpoint=sm');
        expect(BreakpointUtils.describe(601)).assertEqual('width=601vp, breakpoint=md');
        expect(BreakpointUtils.describe(840)).assertEqual('width=840vp, breakpoint=md');
        expect(BreakpointUtils.describe(841)).assertEqual('width=841vp, breakpoint=lg');
      }, done);
    });

    /**
     * @tc.number SUB_POPUPS_MATRIX_0900
     * @tc.name testPopupsMatrixDeviceInfo0015
     * @tc.desc Verify device screen information exposes every expected field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPopupsMatrixDeviceInfo0015', 0, async (done: Function) => {
      await runCase('testPopupsMatrixDeviceInfo0015', async () => {
        const screen = DeviceInfoUtils.screenInfo();
        expect(screen).assertContain('device=');
        expect(screen).assertContain('width=');
        expect(screen).assertContain('height=');
        expect(screen).assertContain('density=');
        expect(screen).assertContain('orientation=');
        expect(DeviceInfoUtils.deviceType().length > 0).assertTrue();
      }, done);
    });

    /**
     * @tc.number SUB_POPUPS_MATRIX_1000
     * @tc.name testPopupsMatrixCustom0016
     * @tc.desc Verify additional project-specific boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPopupsMatrixCustom0016', 0, async (done: Function) => {
      await runCase('testPopupsMatrixCustom0016', async () => {
        expect(PromptUtils.clampRange(2, 1, 2).join('-')).assertEqual('1-2');
        expect(PromptUtils.clampRange(1, 2, 2).join('-')).assertEqual('1-2');
        expect(PromptUtils.clampRange(2, 2, 2).join('-')).assertEqual('2-2');
        expect(PromptUtils.clampRange(-1, 3, 2).join('-')).assertEqual('0-2');
      }, done);
    });


    /**
     * @tc.number SUB_POPUPS_EXTRA_1100
     * @tc.name testPopupsExtraRangeA0021
     * @tc.desc Verify range clamps both ends for maximum two
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPopupsExtraRangeA0021', 0, async (done: Function) => {
      await runCase('testPopupsExtraRangeA0021', async () => {
        expect(PromptUtils.clampRange(-1, 3, 2).join('-')).assertEqual('0-2');
        expect(PromptUtils.clampRange(3, -1, 2).join('-')).assertEqual('0-2');
        expect(PromptUtils.clampRange(1, 1, 2).join('-')).assertEqual('1-1');
      }, done);
    });

    /**
     * @tc.number SUB_POPUPS_EXTRA_1200
     * @tc.name testPopupsExtraRangeB0022
     * @tc.desc Verify range handles zero and equal endpoints
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPopupsExtraRangeB0022', 0, async (done: Function) => {
      await runCase('testPopupsExtraRangeB0022', async () => {
        expect(PromptUtils.clampRange(0, 0, 0).join('-')).assertEqual('0-0');
        expect(PromptUtils.clampRange(2, 2, 2).join('-')).assertEqual('2-2');
        expect(PromptUtils.clampRange(2, 1, 2).join('-')).assertEqual('1-2');
      }, done);
    });

    /**
     * @tc.number SUB_POPUPS_EXTRA_1300
     * @tc.name testPopupsExtraRangeC0023
     * @tc.desc Verify range rejects negative maximum values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPopupsExtraRangeC0023', 0, async (done: Function) => {
      await runCase('testPopupsExtraRangeC0023', async () => {
        expect(PromptUtils.clampRange(2, 3, 2).join('-')).assertEqual('2-2');
        expect(PromptUtils.clampRange(-2, -1, 1).join('-')).assertEqual('0-0');
        expect(PromptUtils.clampRange(0, 2, 1).join('-')).assertEqual('0-1');
      }, done);
    });

    /**
     * @tc.number SUB_POPUPS_EXTRA_1400
     * @tc.name testPopupsExtraSelectionA0024
     * @tc.desc Verify selection summaries clamp to maximum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPopupsExtraSelectionA0024', 0, async (done: Function) => {
      await runCase('testPopupsExtraSelectionA0024', async () => {
        expect(PromptUtils.selectionSummary(-1, 3, 2)).assertEqual('selected 0-2 of 2');
        expect(PromptUtils.selectionSummary(3, 1, 2)).assertEqual('selected 1-2 of 2');
      }, done);
    });

    /**
     * @tc.number SUB_POPUPS_EXTRA_1500
     * @tc.name testPopupsExtraSelectionB0025
     * @tc.desc Verify selection summaries handle zero maximum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPopupsExtraSelectionB0025', 0, async (done: Function) => {
      await runCase('testPopupsExtraSelectionB0025', async () => {
        expect(PromptUtils.selectionSummary(0, 0, 0)).assertEqual('selected 0-0 of 0');
        expect(PromptUtils.selectionSummary(2, 1, 0)).assertEqual('selected 0-0 of 0');
      }, done);
    });

    /**
     * @tc.number SUB_POPUPS_EXTRA_1600
     * @tc.name testPopupsExtraCount0026
     * @tc.desc Verify counter formatting keeps negative values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPopupsExtraCount0026', 0, async (done: Function) => {
      await runCase('testPopupsExtraCount0026', async () => {
        expect(PromptUtils.formatCount('x', -1)).assertEqual('x: -1');
        expect(PromptUtils.formatCount('x', 100)).assertEqual('x: 100');
        expect(PromptUtils.actionSummary('tap', -1)).assertEqual('tap x-1');
      }, done);
    });

    /**
     * @tc.number SUB_POPUPS_EXTRA_1700
     * @tc.name testPopupsExtraRangeText0027
     * @tc.desc Verify range descriptions keep zero and negatives
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPopupsExtraRangeText0027', 0, async (done: Function) => {
      await runCase('testPopupsExtraRangeText0027', async () => {
        expect(PromptUtils.describeRange(0, 0)).assertEqual('range=0-0');
        expect(PromptUtils.describeRange(-2, -1)).assertEqual('range=-2--1');
        expect(PromptUtils.describeRange(1, 2)).assertEqual('range=1-2');
      }, done);
    });

    /**
     * @tc.number SUB_POPUPS_EXTRA_1800
     * @tc.name testPopupsExtraToggleA0028
     * @tc.desc Verify two toggles restore the original state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPopupsExtraToggleA0028', 0, async (done: Function) => {
      await runCase('testPopupsExtraToggleA0028', async () => {
        expect(PromptUtils.toggleShown(PromptUtils.toggleShown(true))).assertTrue();
        expect(PromptUtils.toggleShown(PromptUtils.toggleShown(false))).assertFalse();
      }, done);
    });

    /**
     * @tc.number SUB_POPUPS_EXTRA_1900
     * @tc.name testPopupsExtraToggleB0029
     * @tc.desc Verify five toggles invert the original state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPopupsExtraToggleB0029', 0, async (done: Function) => {
      await runCase('testPopupsExtraToggleB0029', async () => {
        expect(PromptUtils.toggleShown(PromptUtils.toggleShown(PromptUtils.toggleShown(
          PromptUtils.toggleShown(PromptUtils.toggleShown(true)))))).assertFalse();
      }, done);
    });

    /**
     * @tc.number SUB_POPUPS_EXTRA_2000
     * @tc.name testPopupsExtraAction0030
     * @tc.desc Verify action summaries keep empty labels
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPopupsExtraAction0030', 0, async (done: Function) => {
      await runCase('testPopupsExtraAction0030', async () => {
        expect(PromptUtils.actionSummary('', 0)).assertEqual(' x0');
        expect(PromptUtils.actionSummary('save', 2)).assertEqual('save x2');
      }, done);
    });


    /**
     * @tc.number SUB_POPUPS_DEEP_1100
     * @tc.name testPopupsDeepRangeA0031
     * @tc.desc Verify range max one clamps both ends
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPopupsDeepRangeA0031', 0, async (done: Function) => {
      await runCase('testPopupsDeepRangeA0031', async () => {
        expect(PromptUtils.clampRange(-1, 2, 1).join('-')).assertEqual('0-1');
        expect(PromptUtils.clampRange(2, -1, 1).join('-')).assertEqual('0-1');
      }, done);
    });

    /**
     * @tc.number SUB_POPUPS_DEEP_1200
     * @tc.name testPopupsDeepRangeB0032
     * @tc.desc Verify range equal endpoints stays equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPopupsDeepRangeB0032', 0, async (done: Function) => {
      await runCase('testPopupsDeepRangeB0032', async () => {
        expect(PromptUtils.clampRange(1, 1, 1).join('-')).assertEqual('1-1');
        expect(PromptUtils.clampRange(0, 0, 1).join('-')).assertEqual('0-0');
      }, done);
    });

    /**
     * @tc.number SUB_POPUPS_DEEP_1300
     * @tc.name testPopupsDeepRangeC0033
     * @tc.desc Verify range zero maximum clamps to zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPopupsDeepRangeC0033', 0, async (done: Function) => {
      await runCase('testPopupsDeepRangeC0033', async () => {
        expect(PromptUtils.clampRange(2, 3, 0).join('-')).assertEqual('0-0');
      }, done);
    });

    /**
     * @tc.number SUB_POPUPS_DEEP_1400
     * @tc.name testPopupsDeepBriefA0034
     * @tc.desc Verify selection summary keeps zero maximum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPopupsDeepBriefA0034', 0, async (done: Function) => {
      await runCase('testPopupsDeepBriefA0034', async () => {
        expect(PromptUtils.selectionSummary(1, 2, 0)).assertEqual('selected 0-0 of 0');
      }, done);
    });

    /**
     * @tc.number SUB_POPUPS_DEEP_1500
     * @tc.name testPopupsDeepBriefB0035
     * @tc.desc Verify selection summary keeps normal range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPopupsDeepBriefB0035', 0, async (done: Function) => {
      await runCase('testPopupsDeepBriefB0035', async () => {
        expect(PromptUtils.selectionSummary(1, 3, 5)).assertEqual('selected 1-3 of 5');
      }, done);
    });

    /**
     * @tc.number SUB_POPUPS_DEEP_1600
     * @tc.name testPopupsDeepCountA0036
     * @tc.desc Verify count formatting keeps negatives
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPopupsDeepCountA0036', 0, async (done: Function) => {
      await runCase('testPopupsDeepCountA0036', async () => {
        expect(PromptUtils.formatCount('x', -2)).assertEqual('x: -2');
      }, done);
    });

    /**
     * @tc.number SUB_POPUPS_DEEP_1700
     * @tc.name testPopupsDeepCountB0037
     * @tc.desc Verify action formatting keeps zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPopupsDeepCountB0037', 0, async (done: Function) => {
      await runCase('testPopupsDeepCountB0037', async () => {
        expect(PromptUtils.actionSummary('tap', 0)).assertEqual('tap x0');
      }, done);
    });

    /**
     * @tc.number SUB_POPUPS_DEEP_1800
     * @tc.name testPopupsDeepRangeTextA0038
     * @tc.desc Verify range text keeps negatives
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPopupsDeepRangeTextA0038', 0, async (done: Function) => {
      await runCase('testPopupsDeepRangeTextA0038', async () => {
        expect(PromptUtils.describeRange(-1, 1)).assertEqual('range=-1-1');
      }, done);
    });

    /**
     * @tc.number SUB_POPUPS_DEEP_1900
     * @tc.name testPopupsDeepRangeTextB0039
     * @tc.desc Verify range text keeps zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPopupsDeepRangeTextB0039', 0, async (done: Function) => {
      await runCase('testPopupsDeepRangeTextB0039', async () => {
        expect(PromptUtils.describeRange(0, 1)).assertEqual('range=0-1');
      }, done);
    });

    /**
     * @tc.number SUB_POPUPS_DEEP_2000
     * @tc.name testPopupsDeepToggle0040
     * @tc.desc Verify single toggle flips state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPopupsDeepToggle0040', 0, async (done: Function) => {
      await runCase('testPopupsDeepToggle0040', async () => {
        expect(PromptUtils.toggleShown(true)).assertFalse();
        expect(PromptUtils.toggleShown(false)).assertTrue();
      }, done);
    });


    /**
     * @tc.number SUB_POPUPS_FINAL_1100
     * @tc.name testPopupsFinalA0041
     * @tc.desc Verify final matrix boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPopupsFinalA0041', 0, async (done: Function) => {
      await runCase('testPopupsFinalA0041', async () => {
        expect(PromptUtils.clampRange(-1, 2, 1).join('-')).assertEqual('0-1');
      }, done);
    });

    /**
     * @tc.number SUB_POPUPS_FINAL_1200
     * @tc.name testPopupsFinalB0042
     * @tc.desc Verify final matrix boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPopupsFinalB0042', 0, async (done: Function) => {
      await runCase('testPopupsFinalB0042', async () => {
        expect(PromptUtils.clampRange(2, 1, 2).join('-')).assertEqual('1-2');
      }, done);
    });

    /**
     * @tc.number SUB_POPUPS_FINAL_1300
     * @tc.name testPopupsFinalC0043
     * @tc.desc Verify final matrix boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPopupsFinalC0043', 0, async (done: Function) => {
      await runCase('testPopupsFinalC0043', async () => {
        expect(PromptUtils.clampRange(1, 1, 1).join('-')).assertEqual('1-1');
      }, done);
    });

    /**
     * @tc.number SUB_POPUPS_FINAL_1400
     * @tc.name testPopupsFinalD0044
     * @tc.desc Verify final matrix boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPopupsFinalD0044', 0, async (done: Function) => {
      await runCase('testPopupsFinalD0044', async () => {
        expect(PromptUtils.selectionSummary(1, 3, 5)).assertEqual('selected 1-3 of 5');
      }, done);
    });

    /**
     * @tc.number SUB_POPUPS_FINAL_1500
     * @tc.name testPopupsFinalE0045
     * @tc.desc Verify final matrix boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPopupsFinalE0045', 0, async (done: Function) => {
      await runCase('testPopupsFinalE0045', async () => {
        expect(PromptUtils.formatCount('x', -1)).assertEqual('x: -1');
      }, done);
    });

    /**
     * @tc.number SUB_POPUPS_FINAL_1600
     * @tc.name testPopupsFinalF0046
     * @tc.desc Verify final matrix boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPopupsFinalF0046', 0, async (done: Function) => {
      await runCase('testPopupsFinalF0046', async () => {
        expect(PromptUtils.actionSummary('', 0)).assertEqual(' x0');
      }, done);
    });

    /**
     * @tc.number SUB_POPUPS_FINAL_1700
     * @tc.name testPopupsFinalG0047
     * @tc.desc Verify final matrix boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPopupsFinalG0047', 0, async (done: Function) => {
      await runCase('testPopupsFinalG0047', async () => {
        expect(PromptUtils.describeRange(-1, 1)).assertEqual('range=-1-1');
      }, done);
    });

    /**
     * @tc.number SUB_POPUPS_FINAL_1800
     * @tc.name testPopupsFinalH0048
     * @tc.desc Verify final matrix boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPopupsFinalH0048', 0, async (done: Function) => {
      await runCase('testPopupsFinalH0048', async () => {
        expect(PromptUtils.toggleShown(true)).assertFalse();
      }, done);
    });

    /**
     * @tc.number SUB_POPUPS_FINAL_1900
     * @tc.name testPopupsFinalI0049
     * @tc.desc Verify final matrix boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPopupsFinalI0049', 0, async (done: Function) => {
      await runCase('testPopupsFinalI0049', async () => {
        expect(PromptUtils.toggleShown(false)).assertTrue();
      }, done);
    });

    /**
     * @tc.number SUB_POPUPS_FINAL_2000
     * @tc.name testPopupsFinalJ0050
     * @tc.desc Verify final matrix boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPopupsFinalJ0050', 0, async (done: Function) => {
      await runCase('testPopupsFinalJ0050', async () => {
        expect(PromptUtils.clampRange(0, 0, 0).join('-')).assertEqual('0-0');
      }, done);
    });


    /**
     * @tc.number SUB_POPUPS_WIDTH_0100
     * @tc.name testPopupsWidth0001
     * @tc.desc Verify breakpoint helpers at width -100vp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPopupsWidth0001', 0, async (done: Function) => {
      await runCase('testPopupsWidth0001', async () => {
        expect(BreakpointUtils.resolve(-100)).assertEqual(BreakpointUtils.SM);
        expect(BreakpointUtils.contentMaxWidth(-100)).assertEqual(560);
        expect(BreakpointUtils.pagePadding(-100)).assertEqual(16);
        expect(BreakpointUtils.columnCount(-100)).assertEqual(1);
        expect(BreakpointUtils.gridTemplate(-100)).assertEqual('1fr');
        expect(BreakpointUtils.isWide(-100)).assertFalse();
        expect(BreakpointUtils.describe(-100)).assertEqual('width=-100vp, breakpoint=sm');
      }, done);
    });

    /**
     * @tc.number SUB_POPUPS_WIDTH_0200
     * @tc.name testPopupsWidth0002
     * @tc.desc Verify breakpoint helpers at width 0vp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPopupsWidth0002', 0, async (done: Function) => {
      await runCase('testPopupsWidth0002', async () => {
        expect(BreakpointUtils.resolve(0)).assertEqual(BreakpointUtils.SM);
        expect(BreakpointUtils.contentMaxWidth(0)).assertEqual(560);
        expect(BreakpointUtils.pagePadding(0)).assertEqual(16);
        expect(BreakpointUtils.columnCount(0)).assertEqual(1);
        expect(BreakpointUtils.gridTemplate(0)).assertEqual('1fr');
        expect(BreakpointUtils.isWide(0)).assertFalse();
        expect(BreakpointUtils.describe(0)).assertEqual('width=0vp, breakpoint=sm');
      }, done);
    });

    /**
     * @tc.number SUB_POPUPS_WIDTH_0300
     * @tc.name testPopupsWidth0003
     * @tc.desc Verify breakpoint helpers at width 1vp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPopupsWidth0003', 0, async (done: Function) => {
      await runCase('testPopupsWidth0003', async () => {
        expect(BreakpointUtils.resolve(1)).assertEqual(BreakpointUtils.SM);
        expect(BreakpointUtils.contentMaxWidth(1)).assertEqual(560);
        expect(BreakpointUtils.pagePadding(1)).assertEqual(16);
        expect(BreakpointUtils.columnCount(1)).assertEqual(1);
        expect(BreakpointUtils.gridTemplate(1)).assertEqual('1fr');
        expect(BreakpointUtils.isWide(1)).assertFalse();
        expect(BreakpointUtils.describe(1)).assertEqual('width=1vp, breakpoint=sm');
      }, done);
    });

    /**
     * @tc.number SUB_POPUPS_WIDTH_0400
     * @tc.name testPopupsWidth0004
     * @tc.desc Verify breakpoint helpers at width 320vp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPopupsWidth0004', 0, async (done: Function) => {
      await runCase('testPopupsWidth0004', async () => {
        expect(BreakpointUtils.resolve(320)).assertEqual(BreakpointUtils.SM);
        expect(BreakpointUtils.contentMaxWidth(320)).assertEqual(560);
        expect(BreakpointUtils.pagePadding(320)).assertEqual(16);
        expect(BreakpointUtils.columnCount(320)).assertEqual(1);
        expect(BreakpointUtils.gridTemplate(320)).assertEqual('1fr');
        expect(BreakpointUtils.isWide(320)).assertFalse();
        expect(BreakpointUtils.describe(320)).assertEqual('width=320vp, breakpoint=sm');
      }, done);
    });

    /**
     * @tc.number SUB_POPUPS_WIDTH_0500
     * @tc.name testPopupsWidth0005
     * @tc.desc Verify breakpoint helpers at width 599vp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPopupsWidth0005', 0, async (done: Function) => {
      await runCase('testPopupsWidth0005', async () => {
        expect(BreakpointUtils.resolve(599)).assertEqual(BreakpointUtils.SM);
        expect(BreakpointUtils.contentMaxWidth(599)).assertEqual(560);
        expect(BreakpointUtils.pagePadding(599)).assertEqual(16);
        expect(BreakpointUtils.columnCount(599)).assertEqual(1);
        expect(BreakpointUtils.gridTemplate(599)).assertEqual('1fr');
        expect(BreakpointUtils.isWide(599)).assertFalse();
        expect(BreakpointUtils.describe(599)).assertEqual('width=599vp, breakpoint=sm');
      }, done);
    });

    /**
     * @tc.number SUB_POPUPS_WIDTH_0600
     * @tc.name testPopupsWidth0006
     * @tc.desc Verify breakpoint helpers at width 600vp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPopupsWidth0006', 0, async (done: Function) => {
      await runCase('testPopupsWidth0006', async () => {
        expect(BreakpointUtils.resolve(600)).assertEqual(BreakpointUtils.SM);
        expect(BreakpointUtils.contentMaxWidth(600)).assertEqual(560);
        expect(BreakpointUtils.pagePadding(600)).assertEqual(16);
        expect(BreakpointUtils.columnCount(600)).assertEqual(1);
        expect(BreakpointUtils.gridTemplate(600)).assertEqual('1fr');
        expect(BreakpointUtils.isWide(600)).assertFalse();
        expect(BreakpointUtils.describe(600)).assertEqual('width=600vp, breakpoint=sm');
      }, done);
    });

    /**
     * @tc.number SUB_POPUPS_WIDTH_0700
     * @tc.name testPopupsWidth0007
     * @tc.desc Verify breakpoint helpers at width 601vp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPopupsWidth0007', 0, async (done: Function) => {
      await runCase('testPopupsWidth0007', async () => {
        expect(BreakpointUtils.resolve(601)).assertEqual(BreakpointUtils.MD);
        expect(BreakpointUtils.contentMaxWidth(601)).assertEqual(720);
        expect(BreakpointUtils.pagePadding(601)).assertEqual(24);
        expect(BreakpointUtils.columnCount(601)).assertEqual(2);
        expect(BreakpointUtils.gridTemplate(601)).assertEqual('1fr 1fr');
        expect(BreakpointUtils.isWide(601)).assertTrue();
        expect(BreakpointUtils.describe(601)).assertEqual('width=601vp, breakpoint=md');
      }, done);
    });

    /**
     * @tc.number SUB_POPUPS_WIDTH_0800
     * @tc.name testPopupsWidth0008
     * @tc.desc Verify breakpoint helpers at width 700vp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPopupsWidth0008', 0, async (done: Function) => {
      await runCase('testPopupsWidth0008', async () => {
        expect(BreakpointUtils.resolve(700)).assertEqual(BreakpointUtils.MD);
        expect(BreakpointUtils.contentMaxWidth(700)).assertEqual(720);
        expect(BreakpointUtils.pagePadding(700)).assertEqual(24);
        expect(BreakpointUtils.columnCount(700)).assertEqual(2);
        expect(BreakpointUtils.gridTemplate(700)).assertEqual('1fr 1fr');
        expect(BreakpointUtils.isWide(700)).assertTrue();
        expect(BreakpointUtils.describe(700)).assertEqual('width=700vp, breakpoint=md');
      }, done);
    });

    /**
     * @tc.number SUB_POPUPS_WIDTH_0900
     * @tc.name testPopupsWidth0009
     * @tc.desc Verify breakpoint helpers at width 839vp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPopupsWidth0009', 0, async (done: Function) => {
      await runCase('testPopupsWidth0009', async () => {
        expect(BreakpointUtils.resolve(839)).assertEqual(BreakpointUtils.MD);
        expect(BreakpointUtils.contentMaxWidth(839)).assertEqual(720);
        expect(BreakpointUtils.pagePadding(839)).assertEqual(24);
        expect(BreakpointUtils.columnCount(839)).assertEqual(2);
        expect(BreakpointUtils.gridTemplate(839)).assertEqual('1fr 1fr');
        expect(BreakpointUtils.isWide(839)).assertTrue();
        expect(BreakpointUtils.describe(839)).assertEqual('width=839vp, breakpoint=md');
      }, done);
    });

    /**
     * @tc.number SUB_POPUPS_WIDTH_1000
     * @tc.name testPopupsWidth0010
     * @tc.desc Verify breakpoint helpers at width 840vp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPopupsWidth0010', 0, async (done: Function) => {
      await runCase('testPopupsWidth0010', async () => {
        expect(BreakpointUtils.resolve(840)).assertEqual(BreakpointUtils.MD);
        expect(BreakpointUtils.contentMaxWidth(840)).assertEqual(720);
        expect(BreakpointUtils.pagePadding(840)).assertEqual(24);
        expect(BreakpointUtils.columnCount(840)).assertEqual(2);
        expect(BreakpointUtils.gridTemplate(840)).assertEqual('1fr 1fr');
        expect(BreakpointUtils.isWide(840)).assertTrue();
        expect(BreakpointUtils.describe(840)).assertEqual('width=840vp, breakpoint=md');
      }, done);
    });

    /**
     * @tc.number SUB_POPUPS_WIDTH_1100
     * @tc.name testPopupsWidth0011
     * @tc.desc Verify breakpoint helpers at width 841vp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPopupsWidth0011', 0, async (done: Function) => {
      await runCase('testPopupsWidth0011', async () => {
        expect(BreakpointUtils.resolve(841)).assertEqual(BreakpointUtils.LG);
        expect(BreakpointUtils.contentMaxWidth(841)).assertEqual(960);
        expect(BreakpointUtils.pagePadding(841)).assertEqual(32);
        expect(BreakpointUtils.columnCount(841)).assertEqual(3);
        expect(BreakpointUtils.gridTemplate(841)).assertEqual('1fr 1fr 1fr');
        expect(BreakpointUtils.isWide(841)).assertTrue();
        expect(BreakpointUtils.describe(841)).assertEqual('width=841vp, breakpoint=lg');
      }, done);
    });

    /**
     * @tc.number SUB_POPUPS_WIDTH_1200
     * @tc.name testPopupsWidth0012
     * @tc.desc Verify breakpoint helpers at width 900vp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPopupsWidth0012', 0, async (done: Function) => {
      await runCase('testPopupsWidth0012', async () => {
        expect(BreakpointUtils.resolve(900)).assertEqual(BreakpointUtils.LG);
        expect(BreakpointUtils.contentMaxWidth(900)).assertEqual(960);
        expect(BreakpointUtils.pagePadding(900)).assertEqual(32);
        expect(BreakpointUtils.columnCount(900)).assertEqual(3);
        expect(BreakpointUtils.gridTemplate(900)).assertEqual('1fr 1fr 1fr');
        expect(BreakpointUtils.isWide(900)).assertTrue();
        expect(BreakpointUtils.describe(900)).assertEqual('width=900vp, breakpoint=lg');
      }, done);
    });

    /**
     * @tc.number SUB_POPUPS_WIDTH_1300
     * @tc.name testPopupsWidth0013
     * @tc.desc Verify breakpoint helpers at width 1000vp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPopupsWidth0013', 0, async (done: Function) => {
      await runCase('testPopupsWidth0013', async () => {
        expect(BreakpointUtils.resolve(1000)).assertEqual(BreakpointUtils.LG);
        expect(BreakpointUtils.contentMaxWidth(1000)).assertEqual(960);
        expect(BreakpointUtils.pagePadding(1000)).assertEqual(32);
        expect(BreakpointUtils.columnCount(1000)).assertEqual(3);
        expect(BreakpointUtils.gridTemplate(1000)).assertEqual('1fr 1fr 1fr');
        expect(BreakpointUtils.isWide(1000)).assertTrue();
        expect(BreakpointUtils.describe(1000)).assertEqual('width=1000vp, breakpoint=lg');
      }, done);
    });

    /**
     * @tc.number SUB_POPUPS_WIDTH_1400
     * @tc.name testPopupsWidth0014
     * @tc.desc Verify breakpoint helpers at width 1200vp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPopupsWidth0014', 0, async (done: Function) => {
      await runCase('testPopupsWidth0014', async () => {
        expect(BreakpointUtils.resolve(1200)).assertEqual(BreakpointUtils.LG);
        expect(BreakpointUtils.contentMaxWidth(1200)).assertEqual(960);
        expect(BreakpointUtils.pagePadding(1200)).assertEqual(32);
        expect(BreakpointUtils.columnCount(1200)).assertEqual(3);
        expect(BreakpointUtils.gridTemplate(1200)).assertEqual('1fr 1fr 1fr');
        expect(BreakpointUtils.isWide(1200)).assertTrue();
        expect(BreakpointUtils.describe(1200)).assertEqual('width=1200vp, breakpoint=lg');
      }, done);
    });

    /**
     * @tc.number SUB_POPUPS_WIDTH_1500
     * @tc.name testPopupsWidth0015
     * @tc.desc Verify breakpoint helpers at width 1440vp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPopupsWidth0015', 0, async (done: Function) => {
      await runCase('testPopupsWidth0015', async () => {
        expect(BreakpointUtils.resolve(1440)).assertEqual(BreakpointUtils.LG);
        expect(BreakpointUtils.contentMaxWidth(1440)).assertEqual(960);
        expect(BreakpointUtils.pagePadding(1440)).assertEqual(32);
        expect(BreakpointUtils.columnCount(1440)).assertEqual(3);
        expect(BreakpointUtils.gridTemplate(1440)).assertEqual('1fr 1fr 1fr');
        expect(BreakpointUtils.isWide(1440)).assertTrue();
        expect(BreakpointUtils.describe(1440)).assertEqual('width=1440vp, breakpoint=lg');
      }, done);
    });

    /**
     * @tc.number SUB_POPUPS_WIDTH_1600
     * @tc.name testPopupsWidth0016
     * @tc.desc Verify breakpoint helpers at width 1920vp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPopupsWidth0016', 0, async (done: Function) => {
      await runCase('testPopupsWidth0016', async () => {
        expect(BreakpointUtils.resolve(1920)).assertEqual(BreakpointUtils.LG);
        expect(BreakpointUtils.contentMaxWidth(1920)).assertEqual(960);
        expect(BreakpointUtils.pagePadding(1920)).assertEqual(32);
        expect(BreakpointUtils.columnCount(1920)).assertEqual(3);
        expect(BreakpointUtils.gridTemplate(1920)).assertEqual('1fr 1fr 1fr');
        expect(BreakpointUtils.isWide(1920)).assertTrue();
        expect(BreakpointUtils.describe(1920)).assertEqual('width=1920vp, breakpoint=lg');
      }, done);
    });

    /**
     * @tc.number SUB_POPUPS_WIDTH_1700
     * @tc.name testPopupsWidth0017
     * @tc.desc Verify breakpoint helpers at width 2000vp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPopupsWidth0017', 0, async (done: Function) => {
      await runCase('testPopupsWidth0017', async () => {
        expect(BreakpointUtils.resolve(2000)).assertEqual(BreakpointUtils.LG);
        expect(BreakpointUtils.contentMaxWidth(2000)).assertEqual(960);
        expect(BreakpointUtils.pagePadding(2000)).assertEqual(32);
        expect(BreakpointUtils.columnCount(2000)).assertEqual(3);
        expect(BreakpointUtils.gridTemplate(2000)).assertEqual('1fr 1fr 1fr');
        expect(BreakpointUtils.isWide(2000)).assertTrue();
        expect(BreakpointUtils.describe(2000)).assertEqual('width=2000vp, breakpoint=lg');
      }, done);
    });

  });
}
