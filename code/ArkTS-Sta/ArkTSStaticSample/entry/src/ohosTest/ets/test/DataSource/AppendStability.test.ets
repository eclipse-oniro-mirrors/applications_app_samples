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

// Reference: ets/test/PerformanceStability/LongTermStability.test.ets
// Original line floor: 196; scenario family: source-stability.
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

export default function AppendStabilityTest(): void {
  describe('AppendStabilityTest', () => {
    beforeAll(() => {
      logSuite('AppendStabilityTest', 'begin');
    });
    beforeEach(async () => {
      // Yield between cases so device watchdog and UI events can be processed.
      await new Promise<void>((resolve) => { setTimeout(resolve, 1); });
    });
    afterAll(() => {
      logSuite('AppendStabilityTest', 'end');
    });

    /**
     * @tc.name AppendStabilityTest_case_001
     * @tc.desc source-stability: verify actual DataSource storage contract; input vector 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('AppendStabilityTest_case_001', 0, async () => {
      const source = makeSource("test.source-stability.0", 0, "source-stability:0");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(0);
      await assertSource(source, "test.source-stability.0", 0, "source-stability:0");
      const before = snapshotTitles(source);
      const tail = new TextCardData(makeModel("test.source-stability.0", makePayload("", "100%", 0)));
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
     * @tc.name AppendStabilityTest_case_002
     * @tc.desc source-stability: verify actual DataSource storage contract; input vector 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('AppendStabilityTest_case_002', 0, async () => {
      const source = makeSource("test.source-stability.1", 1, "source-stability:1");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(1);
      await assertSource(source, "test.source-stability.1", 1, "source-stability:1");
      const before = snapshotTitles(source);
      const tail = new TextCardData(makeModel("test.source-stability.1", makePayload("Card", "0%", 1)));
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
     * @tc.name AppendStabilityTest_case_003
     * @tc.desc source-stability: verify actual DataSource storage contract; input vector 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('AppendStabilityTest_case_003', 0, async () => {
      const source = makeSource("test.source-stability.2", 2, "source-stability:2");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(2);
      await assertSource(source, "test.source-stability.2", 2, "source-stability:2");
      const before = snapshotTitles(source);
      const tail = new TextCardData(makeModel("test.source-stability.2", makePayload(" ", "50%", 2)));
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

    /**
     * @tc.name AppendStabilityTest_case_004
     * @tc.desc source-stability: verify actual DataSource storage contract; input vector 4.
     * @tc.type Function
     * @tc.level Level1
     */
    it('AppendStabilityTest_case_004', 0, async () => {
      const source = makeSource("test.source-stability.3", 3, "source-stability:3");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(3);
      await assertSource(source, "test.source-stability.3", 3, "source-stability:3");
      const before = snapshotTitles(source);
      const tail = new TextCardData(makeModel("test.source-stability.3", makePayload("  padded  ", "1%", 3)));
      source.addData(tail);
      expect(source.totalCount()).assertEqual(initialCount + 1);
      expect(source.getData(initialCount) === tail).assertTrue();
      expect(source.getData(initialCount).opt('item').title.name).assertEqual("  padded  ");
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
     * @tc.name AppendStabilityTest_case_005
     * @tc.desc source-stability: verify actual DataSource storage contract; input vector 5.
     * @tc.type Function
     * @tc.level Level1
     */
    it('AppendStabilityTest_case_005', 0, async () => {
      const source = makeSource("test.source-stability.4", 7, "source-stability:4");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(7);
      await assertSource(source, "test.source-stability.4", 7, "source-stability:4");
      const before = snapshotTitles(source);
      const tail = new TextCardData(makeModel("test.source-stability.4", makePayload("multi word title", "99%", 4)));
      source.addData(tail);
      expect(source.totalCount()).assertEqual(initialCount + 1);
      expect(source.getData(initialCount) === tail).assertTrue();
      expect(source.getData(initialCount).opt('item').title.name).assertEqual("multi word title");
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
     * @tc.name AppendStabilityTest_case_006
     * @tc.desc source-stability: verify actual DataSource storage contract; input vector 6.
     * @tc.type Function
     * @tc.level Level1
     */
    it('AppendStabilityTest_case_006', 0, async () => {
      const source = makeSource("test.source-stability.5", 8, "source-stability:5");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(8);
      await assertSource(source, "test.source-stability.5", 8, "source-stability:5");
      const before = snapshotTitles(source);
      const tail = new TextCardData(makeModel("test.source-stability.5", makePayload("line\nbreak", "75%", 5)));
      source.addData(tail);
      expect(source.totalCount()).assertEqual(initialCount + 1);
      expect(source.getData(initialCount) === tail).assertTrue();
      expect(source.getData(initialCount).opt('item').title.name).assertEqual("line\nbreak");
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
