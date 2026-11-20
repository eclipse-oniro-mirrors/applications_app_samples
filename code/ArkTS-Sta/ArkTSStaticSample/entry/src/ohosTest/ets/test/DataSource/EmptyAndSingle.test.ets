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

// Reference: ets/test/PowerDialog/PowerDialogStress.test.ets
// Original line floor: 126; scenario family: source-empty.
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

export default function EmptyAndSingleTest(): void {
  describe('EmptyAndSingleTest', () => {
    beforeAll(() => {
      logSuite('EmptyAndSingleTest', 'begin');
    });
    beforeEach(async () => {
      // Yield between cases so device watchdog and UI events can be processed.
      await new Promise<void>((resolve) => { setTimeout(resolve, 1); });
    });
    afterAll(() => {
      logSuite('EmptyAndSingleTest', 'end');
    });

    /**
     * @tc.name EmptyAndSingleTest_case_001
     * @tc.desc source-empty: verify actual DataSource storage contract; input vector 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('EmptyAndSingleTest_case_001', 0, async () => {
      const source = makeSource("test.source-empty.0", 0, "source-empty:0");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(0);
      await assertSource(source, "test.source-empty.0", 0, "source-empty:0");
      const before = snapshotTitles(source);
      const tail = new TextCardData(makeModel("test.source-empty.0", makePayload("", "100%", 0)));
      source.addData(tail);
      expect(source.totalCount()).assertEqual(initialCount + 1);
      expect(source.getData(initialCount) === tail).assertTrue();
      expect(source.getData(initialCount).opt('item').title.name).assertEqual("");
      for (let index = 0; index < initialCount; index++) {
        if (index % 32 === 0) {
          await new Promise<void>((resolve) => { setTimeout(resolve, 1); });
        }
        expect(source.getData(index).opt('item').title.name).assertEqual(before[index]);
        expect(source.getData(index) === source.dataList[index]).assertTrue();
      }
      expect(source.getData(source.totalCount())).assertUndefined();
      expect(source.totalCount()).assertEqual(initialCount + 1);
      assertUniqueIds(source);
    });

    /**
     * @tc.name EmptyAndSingleTest_case_002
     * @tc.desc source-empty: verify actual DataSource storage contract; input vector 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('EmptyAndSingleTest_case_002', 0, async () => {
      const source = makeSource("test.source-empty.1", 1, "source-empty:1");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(1);
      await assertSource(source, "test.source-empty.1", 1, "source-empty:1");
      const before = snapshotTitles(source);
      const tail = new TextCardData(makeModel("test.source-empty.1", makePayload("Card", "0%", 1)));
      source.addData(tail);
      expect(source.totalCount()).assertEqual(initialCount + 1);
      expect(source.getData(initialCount) === tail).assertTrue();
      expect(source.getData(initialCount).opt('item').title.name).assertEqual("Card");
      for (let index = 0; index < initialCount; index++) {
        if (index % 32 === 0) {
          await new Promise<void>((resolve) => { setTimeout(resolve, 1); });
        }
        expect(source.getData(index).opt('item').title.name).assertEqual(before[index]);
        expect(source.getData(index) === source.dataList[index]).assertTrue();
      }
      expect(source.getData(source.totalCount())).assertUndefined();
      expect(source.totalCount()).assertEqual(initialCount + 1);
      assertUniqueIds(source);
    });

    /**
     * @tc.name EmptyAndSingleTest_case_003
     * @tc.desc source-empty: verify actual DataSource storage contract; input vector 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('EmptyAndSingleTest_case_003', 0, async () => {
      const source = makeSource("test.source-empty.2", 2, "source-empty:2");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(2);
      await assertSource(source, "test.source-empty.2", 2, "source-empty:2");
      const before = snapshotTitles(source);
      const tail = new TextCardData(makeModel("test.source-empty.2", makePayload(" ", "50%", 2)));
      source.addData(tail);
      expect(source.totalCount()).assertEqual(initialCount + 1);
      expect(source.getData(initialCount) === tail).assertTrue();
      expect(source.getData(initialCount).opt('item').title.name).assertEqual(" ");
      for (let index = 0; index < initialCount; index++) {
        if (index % 32 === 0) {
          await new Promise<void>((resolve) => { setTimeout(resolve, 1); });
        }
        expect(source.getData(index).opt('item').title.name).assertEqual(before[index]);
        expect(source.getData(index) === source.dataList[index]).assertTrue();
      }
      expect(source.getData(source.totalCount())).assertUndefined();
      expect(source.totalCount()).assertEqual(initialCount + 1);
      assertUniqueIds(source);
    });
  });
}
