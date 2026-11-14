/**
 *
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 *
 * All rights reserved.
 * Redistribution and use in source and binary forms, with or without modification,
 * are permitted provided that the following conditions are met:
 *
 * Redistributions of source code must retain the above copyright notice,this
 * list of conditions and the following disclaimer.
 *
 * Redistributions in binary form must reproduce the above copyright notice,
 * this list of conditions and the following disclaimer in the documentation
 * and/or other materials provided with the distribution.
 *
 * THIS IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS 'AS IS' AND ANY EXPRESS OR IMPLIED WARRANTIES,
 * INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
 * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
 * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
 * OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
 * STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS,
 *
 * EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

// Reference: ets/test/Interaction/UIComponentRendering.test.ets
// Original line floor: 760; scenario family: ui-render.
import { describe, it, expect, beforeAll, beforeEach, afterAll } from '@ohos/hypium';
import { CardData } from 'library/src/main/ets/components/dyn/CardData';
import { DataModel } from 'library/src/main/ets/components/dyn/DataModel';
import { DataSource } from 'library/src/main/ets/components/dyn/DataSource';
import { DataParser as DynamicParser } from 'library/src/main/ets/components/dyn/DataParser';
import { RESOLVER_REGISTRY as registry } from 'library/src/main/ets/components/dyn/ResolverRegistry';
import { DataParserStaW } from 'library/src/main/ets/components/sta_wrapper/DataParserStaW';
import { EtsFactory } from 'library/src/main/ets/components/sta_bridge/EtsFactory';
import { fibonacciRecursive as libraryFibonacci } from 'library/src/main/ets/components/dyn/Workload';
import { CardResolver } from '../../../../main/ets/pages/CardResolver';
import { TextCardData } from '../../../../main/ets/pages/TextCardData';
import { fibonacciRecursive as entryFibonacci } from '../../../../main/ets/pages/Workload';
import bundledLayout from '../../../../main/ets/pages/jsonData.json';
import {
  CardPayload, CardStyle, LayoutGroup, makePayload, makeModel, makeGroup, makeSource,
  assertSource, assertUniqueIds, snapshotTitles, RecordingResolver, ListenerRecorder,
  ControlledParser, ControlledFactory, waitForNativeFactory, logSuite, expectedFibonacci
} from '../Shared/ScenarioSupport';
import { inspectProperty } from '../Shared/PropertyInspection';
import {
  getDriver, ensureSampleVisible, readSampleTitles, requireText, readText,
  componentEnabled, interactWithComponent, checkTextContent, checkComponentExists,
  sampleCardCount, textBounds, SAMPLE_TITLES, backgroundSample, foregroundSampleAndVerify
} from '../Shared/SharedDriver';

export default function CardListRenderingTest(): void {
  describe('CardListRenderingTest', () => {
    beforeAll(() => {
      logSuite('CardListRenderingTest', 'begin');
    });
    beforeEach(async () => {
      // Yield between cases so device watchdog and UI events can be processed.
      await new Promise<void>((resolve) => { setTimeout(resolve, 1); });
    });
    afterAll(() => {
      logSuite('CardListRenderingTest', 'end');
    });

    /**
     * @tc.name CardListRenderingTest_case_001
     * @tc.desc ui-render: inspect actual sample cards after read; input vector 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CardListRenderingTest_case_001', 0, async () => {
      const driver = getDriver();
      await ensureSampleVisible(driver);
      const expectedTitle = "\u5361\u7247 1";
      const before = await readSampleTitles(driver);
      expect(before).assertDeepEquals(SAMPLE_TITLES);
      
      for (let pass = 0; pass < 1; pass++) {
        const component = await requireText(driver, expectedTitle);
        const original = await readText(component);
        expect(original).assertEqual(expectedTitle);
        expect(await componentEnabled(component)).assertTrue();
        expect(await checkTextContent(driver, expectedTitle)).assertTrue();
      }
      const after = await readSampleTitles(driver);
      expect(after).assertDeepEquals(before);
      expect(await checkComponentExists(driver, 'List')).assertTrue();
      expect(await sampleCardCount(driver)).assertEqual(3);
      const bounds = await textBounds(driver, expectedTitle);
      expect(bounds.right > bounds.left).assertTrue();
      expect(bounds.bottom > bounds.top).assertTrue();
      expect(await checkTextContent(driver, 'Hello 0')).assertTrue();
    });

    /**
     * @tc.name CardListRenderingTest_case_002
     * @tc.desc ui-render: inspect actual sample cards after read; input vector 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CardListRenderingTest_case_002', 0, async () => {
      const driver = getDriver();
      await ensureSampleVisible(driver);
      const expectedTitle = "\u5361\u7247 2";
      const before = await readSampleTitles(driver);
      expect(before).assertDeepEquals(SAMPLE_TITLES);
      
      for (let pass = 0; pass < 1; pass++) {
        const component = await requireText(driver, expectedTitle);
        const original = await readText(component);
        expect(original).assertEqual(expectedTitle);
        expect(await componentEnabled(component)).assertTrue();
        expect(await checkTextContent(driver, expectedTitle)).assertTrue();
      }
      const after = await readSampleTitles(driver);
      expect(after).assertDeepEquals(before);
      expect(await checkComponentExists(driver, 'List')).assertTrue();
      expect(await sampleCardCount(driver)).assertEqual(3);
      const bounds = await textBounds(driver, expectedTitle);
      expect(bounds.right > bounds.left).assertTrue();
      expect(bounds.bottom > bounds.top).assertTrue();
      expect(await checkTextContent(driver, 'Hello 0')).assertTrue();
    });

    /**
     * @tc.name CardListRenderingTest_case_003
     * @tc.desc ui-render: inspect actual sample cards after read; input vector 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CardListRenderingTest_case_003', 0, async () => {
      const driver = getDriver();
      await ensureSampleVisible(driver);
      const expectedTitle = "\u5361\u7247 3";
      const before = await readSampleTitles(driver);
      expect(before).assertDeepEquals(SAMPLE_TITLES);
      
      for (let pass = 0; pass < 1; pass++) {
        const component = await requireText(driver, expectedTitle);
        const original = await readText(component);
        expect(original).assertEqual(expectedTitle);
        expect(await componentEnabled(component)).assertTrue();
        expect(await checkTextContent(driver, expectedTitle)).assertTrue();
      }
      const after = await readSampleTitles(driver);
      expect(after).assertDeepEquals(before);
      expect(await checkComponentExists(driver, 'List')).assertTrue();
      expect(await sampleCardCount(driver)).assertEqual(3);
      const bounds = await textBounds(driver, expectedTitle);
      expect(bounds.right > bounds.left).assertTrue();
      expect(bounds.bottom > bounds.top).assertTrue();
      expect(await checkTextContent(driver, 'Hello 0')).assertTrue();
    });

    /**
     * @tc.name CardListRenderingTest_case_004
     * @tc.desc ui-render: inspect actual sample cards after click; input vector 4.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CardListRenderingTest_case_004', 0, async () => {
      const driver = getDriver();
      await ensureSampleVisible(driver);
      const expectedTitle = "\u5361\u7247 1";
      const before = await readSampleTitles(driver);
      expect(before).assertDeepEquals(SAMPLE_TITLES);
      
      for (let pass = 0; pass < 1; pass++) {
        const component = await requireText(driver, expectedTitle);
        const original = await readText(component);
        expect(original).assertEqual(expectedTitle);
        await interactWithComponent(component, 'click');
        expect(await checkTextContent(driver, expectedTitle)).assertTrue();
      }
      const after = await readSampleTitles(driver);
      expect(after).assertDeepEquals(before);
      expect(await checkComponentExists(driver, 'List')).assertTrue();
      expect(await sampleCardCount(driver)).assertEqual(3);
      const bounds = await textBounds(driver, expectedTitle);
      expect(bounds.right > bounds.left).assertTrue();
      expect(bounds.bottom > bounds.top).assertTrue();
      expect(await checkTextContent(driver, 'Hello 0')).assertTrue();
    });

    /**
     * @tc.name CardListRenderingTest_case_005
     * @tc.desc ui-render: inspect actual sample cards after click; input vector 5.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CardListRenderingTest_case_005', 0, async () => {
      const driver = getDriver();
      await ensureSampleVisible(driver);
      const expectedTitle = "\u5361\u7247 2";
      const before = await readSampleTitles(driver);
      expect(before).assertDeepEquals(SAMPLE_TITLES);
      
      for (let pass = 0; pass < 1; pass++) {
        const component = await requireText(driver, expectedTitle);
        const original = await readText(component);
        expect(original).assertEqual(expectedTitle);
        await interactWithComponent(component, 'click');
        expect(await checkTextContent(driver, expectedTitle)).assertTrue();
      }
      const after = await readSampleTitles(driver);
      expect(after).assertDeepEquals(before);
      expect(await checkComponentExists(driver, 'List')).assertTrue();
      expect(await sampleCardCount(driver)).assertEqual(3);
      const bounds = await textBounds(driver, expectedTitle);
      expect(bounds.right > bounds.left).assertTrue();
      expect(bounds.bottom > bounds.top).assertTrue();
      expect(await checkTextContent(driver, 'Hello 0')).assertTrue();
    });

    /**
     * @tc.name CardListRenderingTest_case_006
     * @tc.desc ui-render: inspect actual sample cards after click; input vector 6.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CardListRenderingTest_case_006', 0, async () => {
      const driver = getDriver();
      await ensureSampleVisible(driver);
      const expectedTitle = "\u5361\u7247 3";
      const before = await readSampleTitles(driver);
      expect(before).assertDeepEquals(SAMPLE_TITLES);
      
      for (let pass = 0; pass < 1; pass++) {
        const component = await requireText(driver, expectedTitle);
        const original = await readText(component);
        expect(original).assertEqual(expectedTitle);
        await interactWithComponent(component, 'click');
        expect(await checkTextContent(driver, expectedTitle)).assertTrue();
      }
      const after = await readSampleTitles(driver);
      expect(after).assertDeepEquals(before);
      expect(await checkComponentExists(driver, 'List')).assertTrue();
      expect(await sampleCardCount(driver)).assertEqual(3);
      const bounds = await textBounds(driver, expectedTitle);
      expect(bounds.right > bounds.left).assertTrue();
      expect(bounds.bottom > bounds.top).assertTrue();
      expect(await checkTextContent(driver, 'Hello 0')).assertTrue();
    });

    /**
     * @tc.name CardListRenderingTest_case_007
     * @tc.desc ui-render: inspect actual sample cards after doubleClick; input vector 7.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CardListRenderingTest_case_007', 0, async () => {
      const driver = getDriver();
      await ensureSampleVisible(driver);
      const expectedTitle = "\u5361\u7247 1";
      const before = await readSampleTitles(driver);
      expect(before).assertDeepEquals(SAMPLE_TITLES);
      
      for (let pass = 0; pass < 1; pass++) {
        const component = await requireText(driver, expectedTitle);
        const original = await readText(component);
        expect(original).assertEqual(expectedTitle);
        await interactWithComponent(component, 'doubleClick');
        expect(await checkTextContent(driver, expectedTitle)).assertTrue();
      }
      const after = await readSampleTitles(driver);
      expect(after).assertDeepEquals(before);
      expect(await checkComponentExists(driver, 'List')).assertTrue();
      expect(await sampleCardCount(driver)).assertEqual(3);
      const bounds = await textBounds(driver, expectedTitle);
      expect(bounds.right > bounds.left).assertTrue();
      expect(bounds.bottom > bounds.top).assertTrue();
      expect(await checkTextContent(driver, 'Hello 0')).assertTrue();
    });

    /**
     * @tc.name CardListRenderingTest_case_008
     * @tc.desc ui-render: inspect actual sample cards after doubleClick; input vector 8.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CardListRenderingTest_case_008', 0, async () => {
      const driver = getDriver();
      await ensureSampleVisible(driver);
      const expectedTitle = "\u5361\u7247 2";
      const before = await readSampleTitles(driver);
      expect(before).assertDeepEquals(SAMPLE_TITLES);
      
      for (let pass = 0; pass < 1; pass++) {
        const component = await requireText(driver, expectedTitle);
        const original = await readText(component);
        expect(original).assertEqual(expectedTitle);
        await interactWithComponent(component, 'doubleClick');
        expect(await checkTextContent(driver, expectedTitle)).assertTrue();
      }
      const after = await readSampleTitles(driver);
      expect(after).assertDeepEquals(before);
      expect(await checkComponentExists(driver, 'List')).assertTrue();
      expect(await sampleCardCount(driver)).assertEqual(3);
      const bounds = await textBounds(driver, expectedTitle);
      expect(bounds.right > bounds.left).assertTrue();
      expect(bounds.bottom > bounds.top).assertTrue();
      expect(await checkTextContent(driver, 'Hello 0')).assertTrue();
    });

    /**
     * @tc.name CardListRenderingTest_case_009
     * @tc.desc ui-render: inspect actual sample cards after doubleClick; input vector 9.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CardListRenderingTest_case_009', 0, async () => {
      const driver = getDriver();
      await ensureSampleVisible(driver);
      const expectedTitle = "\u5361\u7247 3";
      const before = await readSampleTitles(driver);
      expect(before).assertDeepEquals(SAMPLE_TITLES);
      
      for (let pass = 0; pass < 1; pass++) {
        const component = await requireText(driver, expectedTitle);
        const original = await readText(component);
        expect(original).assertEqual(expectedTitle);
        await interactWithComponent(component, 'doubleClick');
        expect(await checkTextContent(driver, expectedTitle)).assertTrue();
      }
      const after = await readSampleTitles(driver);
      expect(after).assertDeepEquals(before);
      expect(await checkComponentExists(driver, 'List')).assertTrue();
      expect(await sampleCardCount(driver)).assertEqual(3);
      const bounds = await textBounds(driver, expectedTitle);
      expect(bounds.right > bounds.left).assertTrue();
      expect(bounds.bottom > bounds.top).assertTrue();
      expect(await checkTextContent(driver, 'Hello 0')).assertTrue();
    });

    /**
     * @tc.name CardListRenderingTest_case_010
     * @tc.desc ui-render: inspect actual sample cards after longClick; input vector 10.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CardListRenderingTest_case_010', 0, async () => {
      const driver = getDriver();
      await ensureSampleVisible(driver);
      const expectedTitle = "\u5361\u7247 1";
      const before = await readSampleTitles(driver);
      expect(before).assertDeepEquals(SAMPLE_TITLES);
      
      for (let pass = 0; pass < 1; pass++) {
        const component = await requireText(driver, expectedTitle);
        const original = await readText(component);
        expect(original).assertEqual(expectedTitle);
        await interactWithComponent(component, 'longClick');
        expect(await checkTextContent(driver, expectedTitle)).assertTrue();
      }
      const after = await readSampleTitles(driver);
      expect(after).assertDeepEquals(before);
      expect(await checkComponentExists(driver, 'List')).assertTrue();
      expect(await sampleCardCount(driver)).assertEqual(3);
      const bounds = await textBounds(driver, expectedTitle);
      expect(bounds.right > bounds.left).assertTrue();
      expect(bounds.bottom > bounds.top).assertTrue();
      expect(await checkTextContent(driver, 'Hello 0')).assertTrue();
    });

    /**
     * @tc.name CardListRenderingTest_case_011
     * @tc.desc ui-render: inspect actual sample cards after longClick; input vector 11.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CardListRenderingTest_case_011', 0, async () => {
      const driver = getDriver();
      await ensureSampleVisible(driver);
      const expectedTitle = "\u5361\u7247 2";
      const before = await readSampleTitles(driver);
      expect(before).assertDeepEquals(SAMPLE_TITLES);
      
      for (let pass = 0; pass < 1; pass++) {
        const component = await requireText(driver, expectedTitle);
        const original = await readText(component);
        expect(original).assertEqual(expectedTitle);
        await interactWithComponent(component, 'longClick');
        expect(await checkTextContent(driver, expectedTitle)).assertTrue();
      }
      const after = await readSampleTitles(driver);
      expect(after).assertDeepEquals(before);
      expect(await checkComponentExists(driver, 'List')).assertTrue();
      expect(await sampleCardCount(driver)).assertEqual(3);
      const bounds = await textBounds(driver, expectedTitle);
      expect(bounds.right > bounds.left).assertTrue();
      expect(bounds.bottom > bounds.top).assertTrue();
      expect(await checkTextContent(driver, 'Hello 0')).assertTrue();
    });

    /**
     * @tc.name CardListRenderingTest_case_012
     * @tc.desc ui-render: inspect actual sample cards after longClick; input vector 12.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CardListRenderingTest_case_012', 0, async () => {
      const driver = getDriver();
      await ensureSampleVisible(driver);
      const expectedTitle = "\u5361\u7247 3";
      const before = await readSampleTitles(driver);
      expect(before).assertDeepEquals(SAMPLE_TITLES);
      
      for (let pass = 0; pass < 1; pass++) {
        const component = await requireText(driver, expectedTitle);
        const original = await readText(component);
        expect(original).assertEqual(expectedTitle);
        await interactWithComponent(component, 'longClick');
        expect(await checkTextContent(driver, expectedTitle)).assertTrue();
      }
      const after = await readSampleTitles(driver);
      expect(after).assertDeepEquals(before);
      expect(await checkComponentExists(driver, 'List')).assertTrue();
      expect(await sampleCardCount(driver)).assertEqual(3);
      const bounds = await textBounds(driver, expectedTitle);
      expect(bounds.right > bounds.left).assertTrue();
      expect(bounds.bottom > bounds.top).assertTrue();
      expect(await checkTextContent(driver, 'Hello 0')).assertTrue();
    });

    /**
     * @tc.name CardListRenderingTest_case_013
     * @tc.desc ui-render: inspect actual sample cards after read; input vector 13.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CardListRenderingTest_case_013', 0, async () => {
      const driver = getDriver();
      await ensureSampleVisible(driver);
      const expectedTitle = "\u5361\u7247 1";
      const before = await readSampleTitles(driver);
      expect(before).assertDeepEquals(SAMPLE_TITLES);
      
      for (let pass = 0; pass < 2; pass++) {
        const component = await requireText(driver, expectedTitle);
        const original = await readText(component);
        expect(original).assertEqual(expectedTitle);
        expect(await componentEnabled(component)).assertTrue();
        expect(await checkTextContent(driver, expectedTitle)).assertTrue();
      }
      const after = await readSampleTitles(driver);
      expect(after).assertDeepEquals(before);
      expect(await checkComponentExists(driver, 'List')).assertTrue();
      expect(await sampleCardCount(driver)).assertEqual(3);
      const bounds = await textBounds(driver, expectedTitle);
      expect(bounds.right > bounds.left).assertTrue();
      expect(bounds.bottom > bounds.top).assertTrue();
      expect(await checkTextContent(driver, 'Hello 0')).assertTrue();
    });

    /**
     * @tc.name CardListRenderingTest_case_014
     * @tc.desc ui-render: inspect actual sample cards after read; input vector 14.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CardListRenderingTest_case_014', 0, async () => {
      const driver = getDriver();
      await ensureSampleVisible(driver);
      const expectedTitle = "\u5361\u7247 2";
      const before = await readSampleTitles(driver);
      expect(before).assertDeepEquals(SAMPLE_TITLES);
      
      for (let pass = 0; pass < 2; pass++) {
        const component = await requireText(driver, expectedTitle);
        const original = await readText(component);
        expect(original).assertEqual(expectedTitle);
        expect(await componentEnabled(component)).assertTrue();
        expect(await checkTextContent(driver, expectedTitle)).assertTrue();
      }
      const after = await readSampleTitles(driver);
      expect(after).assertDeepEquals(before);
      expect(await checkComponentExists(driver, 'List')).assertTrue();
      expect(await sampleCardCount(driver)).assertEqual(3);
      const bounds = await textBounds(driver, expectedTitle);
      expect(bounds.right > bounds.left).assertTrue();
      expect(bounds.bottom > bounds.top).assertTrue();
      expect(await checkTextContent(driver, 'Hello 0')).assertTrue();
    });

    /**
     * @tc.name CardListRenderingTest_case_015
     * @tc.desc ui-render: inspect actual sample cards after read; input vector 15.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CardListRenderingTest_case_015', 0, async () => {
      const driver = getDriver();
      await ensureSampleVisible(driver);
      const expectedTitle = "\u5361\u7247 3";
      const before = await readSampleTitles(driver);
      expect(before).assertDeepEquals(SAMPLE_TITLES);
      
      for (let pass = 0; pass < 2; pass++) {
        const component = await requireText(driver, expectedTitle);
        const original = await readText(component);
        expect(original).assertEqual(expectedTitle);
        expect(await componentEnabled(component)).assertTrue();
        expect(await checkTextContent(driver, expectedTitle)).assertTrue();
      }
      const after = await readSampleTitles(driver);
      expect(after).assertDeepEquals(before);
      expect(await checkComponentExists(driver, 'List')).assertTrue();
      expect(await sampleCardCount(driver)).assertEqual(3);
      const bounds = await textBounds(driver, expectedTitle);
      expect(bounds.right > bounds.left).assertTrue();
      expect(bounds.bottom > bounds.top).assertTrue();
      expect(await checkTextContent(driver, 'Hello 0')).assertTrue();
    });

    /**
     * @tc.name CardListRenderingTest_case_016
     * @tc.desc ui-render: inspect actual sample cards after click; input vector 16.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CardListRenderingTest_case_016', 0, async () => {
      const driver = getDriver();
      await ensureSampleVisible(driver);
      const expectedTitle = "\u5361\u7247 1";
      const before = await readSampleTitles(driver);
      expect(before).assertDeepEquals(SAMPLE_TITLES);
      
      for (let pass = 0; pass < 2; pass++) {
        const component = await requireText(driver, expectedTitle);
        const original = await readText(component);
        expect(original).assertEqual(expectedTitle);
        await interactWithComponent(component, 'click');
        expect(await checkTextContent(driver, expectedTitle)).assertTrue();
      }
      const after = await readSampleTitles(driver);
      expect(after).assertDeepEquals(before);
      expect(await checkComponentExists(driver, 'List')).assertTrue();
      expect(await sampleCardCount(driver)).assertEqual(3);
      const bounds = await textBounds(driver, expectedTitle);
      expect(bounds.right > bounds.left).assertTrue();
      expect(bounds.bottom > bounds.top).assertTrue();
      expect(await checkTextContent(driver, 'Hello 0')).assertTrue();
    });

    /**
     * @tc.name CardListRenderingTest_case_017
     * @tc.desc ui-render: inspect actual sample cards after click; input vector 17.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CardListRenderingTest_case_017', 0, async () => {
      const driver = getDriver();
      await ensureSampleVisible(driver);
      const expectedTitle = "\u5361\u7247 2";
      const before = await readSampleTitles(driver);
      expect(before).assertDeepEquals(SAMPLE_TITLES);
      
      for (let pass = 0; pass < 2; pass++) {
        const component = await requireText(driver, expectedTitle);
        const original = await readText(component);
        expect(original).assertEqual(expectedTitle);
        await interactWithComponent(component, 'click');
        expect(await checkTextContent(driver, expectedTitle)).assertTrue();
      }
      const after = await readSampleTitles(driver);
      expect(after).assertDeepEquals(before);
      expect(await checkComponentExists(driver, 'List')).assertTrue();
      expect(await sampleCardCount(driver)).assertEqual(3);
      const bounds = await textBounds(driver, expectedTitle);
      expect(bounds.right > bounds.left).assertTrue();
      expect(bounds.bottom > bounds.top).assertTrue();
      expect(await checkTextContent(driver, 'Hello 0')).assertTrue();
    });

    /**
     * @tc.name CardListRenderingTest_case_018
     * @tc.desc ui-render: inspect actual sample cards after click; input vector 18.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CardListRenderingTest_case_018', 0, async () => {
      const driver = getDriver();
      await ensureSampleVisible(driver);
      const expectedTitle = "\u5361\u7247 3";
      const before = await readSampleTitles(driver);
      expect(before).assertDeepEquals(SAMPLE_TITLES);
      
      for (let pass = 0; pass < 2; pass++) {
        const component = await requireText(driver, expectedTitle);
        const original = await readText(component);
        expect(original).assertEqual(expectedTitle);
        await interactWithComponent(component, 'click');
        expect(await checkTextContent(driver, expectedTitle)).assertTrue();
      }
      const after = await readSampleTitles(driver);
      expect(after).assertDeepEquals(before);
      expect(await checkComponentExists(driver, 'List')).assertTrue();
      expect(await sampleCardCount(driver)).assertEqual(3);
      const bounds = await textBounds(driver, expectedTitle);
      expect(bounds.right > bounds.left).assertTrue();
      expect(bounds.bottom > bounds.top).assertTrue();
      expect(await checkTextContent(driver, 'Hello 0')).assertTrue();
    });

    /**
     * @tc.name CardListRenderingTest_case_019
     * @tc.desc ui-render: inspect actual sample cards after doubleClick; input vector 19.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CardListRenderingTest_case_019', 0, async () => {
      const driver = getDriver();
      await ensureSampleVisible(driver);
      const expectedTitle = "\u5361\u7247 1";
      const before = await readSampleTitles(driver);
      expect(before).assertDeepEquals(SAMPLE_TITLES);
      
      for (let pass = 0; pass < 2; pass++) {
        const component = await requireText(driver, expectedTitle);
        const original = await readText(component);
        expect(original).assertEqual(expectedTitle);
        await interactWithComponent(component, 'doubleClick');
        expect(await checkTextContent(driver, expectedTitle)).assertTrue();
      }
      const after = await readSampleTitles(driver);
      expect(after).assertDeepEquals(before);
      expect(await checkComponentExists(driver, 'List')).assertTrue();
      expect(await sampleCardCount(driver)).assertEqual(3);
      const bounds = await textBounds(driver, expectedTitle);
      expect(bounds.right > bounds.left).assertTrue();
      expect(bounds.bottom > bounds.top).assertTrue();
      expect(await checkTextContent(driver, 'Hello 0')).assertTrue();
    });

    /**
     * @tc.name CardListRenderingTest_case_020
     * @tc.desc ui-render: inspect actual sample cards after doubleClick; input vector 20.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CardListRenderingTest_case_020', 0, async () => {
      const driver = getDriver();
      await ensureSampleVisible(driver);
      const expectedTitle = "\u5361\u7247 2";
      const before = await readSampleTitles(driver);
      expect(before).assertDeepEquals(SAMPLE_TITLES);
      
      for (let pass = 0; pass < 2; pass++) {
        const component = await requireText(driver, expectedTitle);
        const original = await readText(component);
        expect(original).assertEqual(expectedTitle);
        await interactWithComponent(component, 'doubleClick');
        expect(await checkTextContent(driver, expectedTitle)).assertTrue();
      }
      const after = await readSampleTitles(driver);
      expect(after).assertDeepEquals(before);
      expect(await checkComponentExists(driver, 'List')).assertTrue();
      expect(await sampleCardCount(driver)).assertEqual(3);
      const bounds = await textBounds(driver, expectedTitle);
      expect(bounds.right > bounds.left).assertTrue();
      expect(bounds.bottom > bounds.top).assertTrue();
      expect(await checkTextContent(driver, 'Hello 0')).assertTrue();
    });

    /**
     * @tc.name CardListRenderingTest_case_021
     * @tc.desc ui-render: inspect actual sample cards after doubleClick; input vector 21.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CardListRenderingTest_case_021', 0, async () => {
      const driver = getDriver();
      await ensureSampleVisible(driver);
      const expectedTitle = "\u5361\u7247 3";
      const before = await readSampleTitles(driver);
      expect(before).assertDeepEquals(SAMPLE_TITLES);
      
      for (let pass = 0; pass < 2; pass++) {
        const component = await requireText(driver, expectedTitle);
        const original = await readText(component);
        expect(original).assertEqual(expectedTitle);
        await interactWithComponent(component, 'doubleClick');
        expect(await checkTextContent(driver, expectedTitle)).assertTrue();
      }
      const after = await readSampleTitles(driver);
      expect(after).assertDeepEquals(before);
      expect(await checkComponentExists(driver, 'List')).assertTrue();
      expect(await sampleCardCount(driver)).assertEqual(3);
      const bounds = await textBounds(driver, expectedTitle);
      expect(bounds.right > bounds.left).assertTrue();
      expect(bounds.bottom > bounds.top).assertTrue();
      expect(await checkTextContent(driver, 'Hello 0')).assertTrue();
    });

    /**
     * @tc.name CardListRenderingTest_case_022
     * @tc.desc ui-render: inspect actual sample cards after longClick; input vector 22.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CardListRenderingTest_case_022', 0, async () => {
      const driver = getDriver();
      await ensureSampleVisible(driver);
      const expectedTitle = "\u5361\u7247 1";
      const before = await readSampleTitles(driver);
      expect(before).assertDeepEquals(SAMPLE_TITLES);
      
      for (let pass = 0; pass < 2; pass++) {
        const component = await requireText(driver, expectedTitle);
        const original = await readText(component);
        expect(original).assertEqual(expectedTitle);
        await interactWithComponent(component, 'longClick');
        expect(await checkTextContent(driver, expectedTitle)).assertTrue();
      }
      const after = await readSampleTitles(driver);
      expect(after).assertDeepEquals(before);
      expect(await checkComponentExists(driver, 'List')).assertTrue();
      expect(await sampleCardCount(driver)).assertEqual(3);
      const bounds = await textBounds(driver, expectedTitle);
      expect(bounds.right > bounds.left).assertTrue();
      expect(bounds.bottom > bounds.top).assertTrue();
      expect(await checkTextContent(driver, 'Hello 0')).assertTrue();
    });

    /**
     * @tc.name CardListRenderingTest_case_023
     * @tc.desc ui-render: inspect actual sample cards after longClick; input vector 23.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CardListRenderingTest_case_023', 0, async () => {
      const driver = getDriver();
      await ensureSampleVisible(driver);
      const expectedTitle = "\u5361\u7247 2";
      const before = await readSampleTitles(driver);
      expect(before).assertDeepEquals(SAMPLE_TITLES);
      
      for (let pass = 0; pass < 2; pass++) {
        const component = await requireText(driver, expectedTitle);
        const original = await readText(component);
        expect(original).assertEqual(expectedTitle);
        await interactWithComponent(component, 'longClick');
        expect(await checkTextContent(driver, expectedTitle)).assertTrue();
      }
      const after = await readSampleTitles(driver);
      expect(after).assertDeepEquals(before);
      expect(await checkComponentExists(driver, 'List')).assertTrue();
      expect(await sampleCardCount(driver)).assertEqual(3);
      const bounds = await textBounds(driver, expectedTitle);
      expect(bounds.right > bounds.left).assertTrue();
      expect(bounds.bottom > bounds.top).assertTrue();
      expect(await checkTextContent(driver, 'Hello 0')).assertTrue();
    });

    /**
     * @tc.name CardListRenderingTest_case_024
     * @tc.desc ui-render: inspect actual sample cards after longClick; input vector 24.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CardListRenderingTest_case_024', 0, async () => {
      const driver = getDriver();
      await ensureSampleVisible(driver);
      const expectedTitle = "\u5361\u7247 3";
      const before = await readSampleTitles(driver);
      expect(before).assertDeepEquals(SAMPLE_TITLES);
      
      for (let pass = 0; pass < 2; pass++) {
        const component = await requireText(driver, expectedTitle);
        const original = await readText(component);
        expect(original).assertEqual(expectedTitle);
        await interactWithComponent(component, 'longClick');
        expect(await checkTextContent(driver, expectedTitle)).assertTrue();
      }
      const after = await readSampleTitles(driver);
      expect(after).assertDeepEquals(before);
      expect(await checkComponentExists(driver, 'List')).assertTrue();
      expect(await sampleCardCount(driver)).assertEqual(3);
      const bounds = await textBounds(driver, expectedTitle);
      expect(bounds.right > bounds.left).assertTrue();
      expect(bounds.bottom > bounds.top).assertTrue();
      expect(await checkTextContent(driver, 'Hello 0')).assertTrue();
    });
  });
}
