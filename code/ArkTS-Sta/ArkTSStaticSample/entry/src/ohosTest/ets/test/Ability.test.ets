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
