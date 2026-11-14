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

// Reference: ets/test/Ability.test.ets
// Original line floor: 49; scenario family: ability.
import { describe, it, expect, beforeAll, beforeEach, afterAll } from '@ohos/hypium';
import { CardData } from 'library/src/main/ets/components/dyn/CardData';
import { DataModel } from 'library/src/main/ets/components/dyn/DataModel';
import { DataSource } from 'library/src/main/ets/components/dyn/DataSource';
import { DataParser as DynamicParser } from 'library/src/main/ets/components/dyn/DataParser';
import { RESOLVER_REGISTRY as registry } from 'library/src/main/ets/components/dyn/ResolverRegistry';
import { DataParserStaW } from 'library/src/main/ets/components/sta_wrapper/DataParserStaW';
import { EtsFactory } from 'library/src/main/ets/components/sta_bridge/EtsFactory';
import { fibonacciRecursive as libraryFibonacci } from 'library/src/main/ets/components/dyn/Workload';
import { CardResolver } from '../../../main/ets/pages/CardResolver';
import { TextCardData } from '../../../main/ets/pages/TextCardData';
import { fibonacciRecursive as entryFibonacci } from '../../../main/ets/pages/Workload';
import bundledLayout from '../../../main/ets/pages/jsonData.json';
import {
  CardPayload, CardStyle, LayoutGroup, makePayload, makeModel, makeGroup, makeSource,
  assertSource, assertUniqueIds, snapshotTitles, RecordingResolver, ListenerRecorder,
  ControlledParser, ControlledFactory, waitForNativeFactory, logSuite, expectedFibonacci
} from './Shared/ScenarioSupport';
import { inspectProperty } from './Shared/PropertyInspection';
import {
  getDriver, ensureSampleVisible, readSampleTitles, requireText, readText,
  componentEnabled, interactWithComponent, checkTextContent, checkComponentExists,
  sampleCardCount, textBounds, SAMPLE_TITLES, backgroundSample, foregroundSampleAndVerify
} from './Shared/SharedDriver';

export default function AbilityTest(): void {
  describe('AbilityTest', () => {
    beforeAll(() => {
      logSuite('AbilityTest', 'begin');
    });
    beforeEach(async () => {
      // Yield between cases so device watchdog and UI events can be processed.
      await new Promise<void>((resolve) => { setTimeout(resolve, 1); });
    });
    afterAll(() => {
      logSuite('AbilityTest', 'end');
    });

    /**
     * @tc.name AbilityTest_case_001
     * @tc.desc ability: inspect actual sample cards after read; input vector 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('AbilityTest_case_001', 0, async () => {
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
  });
}
