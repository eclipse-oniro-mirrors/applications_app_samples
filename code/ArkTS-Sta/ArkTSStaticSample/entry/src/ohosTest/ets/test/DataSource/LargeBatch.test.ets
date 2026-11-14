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

// Reference: ets/test/PerformanceStability/PerformanceStress.test.ets
// Original line floor: 598; scenario family: source-large.
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

export default function LargeBatchTest(): void {
  describe('LargeBatchTest', () => {
    beforeAll(() => {
      logSuite('LargeBatchTest', 'begin');
    });
    beforeEach(async () => {
      // Yield between cases so device watchdog and UI events can be processed.
      await new Promise<void>((resolve) => { setTimeout(resolve, 1); });
    });
    afterAll(() => {
      logSuite('LargeBatchTest', 'end');
    });

    /**
     * @tc.name LargeBatchTest_case_001
     * @tc.desc source-large: verify actual DataSource storage contract; input vector 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('LargeBatchTest_case_001', 0, async () => {
      const source = makeSource("test.source-large.0", 1, "source-large:0");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(1);
      await assertSource(source, "test.source-large.0", 1, "source-large:0");
      const before = snapshotTitles(source);
      const tail = new TextCardData(makeModel("test.source-large.0", makePayload("", "100%", 0)));
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
     * @tc.name LargeBatchTest_case_002
     * @tc.desc source-large: verify actual DataSource storage contract; input vector 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('LargeBatchTest_case_002', 0, async () => {
      const source = makeSource("test.source-large.1", 5, "source-large:1");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(5);
      await assertSource(source, "test.source-large.1", 5, "source-large:1");
      const before = snapshotTitles(source);
      const tail = new TextCardData(makeModel("test.source-large.1", makePayload("Card", "0%", 1)));
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
     * @tc.name LargeBatchTest_case_003
     * @tc.desc source-large: verify actual DataSource storage contract; input vector 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('LargeBatchTest_case_003', 0, async () => {
      const source = makeSource("test.source-large.2", 9, "source-large:2");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(9);
      await assertSource(source, "test.source-large.2", 9, "source-large:2");
      const before = snapshotTitles(source);
      const tail = new TextCardData(makeModel("test.source-large.2", makePayload(" ", "50%", 2)));
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
     * @tc.name LargeBatchTest_case_004
     * @tc.desc source-large: verify actual DataSource storage contract; input vector 4.
     * @tc.type Function
     * @tc.level Level1
     */
    it('LargeBatchTest_case_004', 0, async () => {
      const source = makeSource("test.source-large.3", 13, "source-large:3");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(13);
      await assertSource(source, "test.source-large.3", 13, "source-large:3");
      const before = snapshotTitles(source);
      const tail = new TextCardData(makeModel("test.source-large.3", makePayload("  padded  ", "1%", 3)));
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
     * @tc.name LargeBatchTest_case_005
     * @tc.desc source-large: verify actual DataSource storage contract; input vector 5.
     * @tc.type Function
     * @tc.level Level1
     */
    it('LargeBatchTest_case_005', 0, async () => {
      const source = makeSource("test.source-large.4", 29, "source-large:4");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(29);
      await assertSource(source, "test.source-large.4", 29, "source-large:4");
      const before = snapshotTitles(source);
      const tail = new TextCardData(makeModel("test.source-large.4", makePayload("multi word title", "99%", 4)));
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
     * @tc.name LargeBatchTest_case_006
     * @tc.desc source-large: verify actual DataSource storage contract; input vector 6.
     * @tc.type Function
     * @tc.level Level1
     */
    it('LargeBatchTest_case_006', 0, async () => {
      const source = makeSource("test.source-large.5", 33, "source-large:5");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(33);
      await assertSource(source, "test.source-large.5", 33, "source-large:5");
      const before = snapshotTitles(source);
      const tail = new TextCardData(makeModel("test.source-large.5", makePayload("line\nbreak", "75%", 5)));
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

    /**
     * @tc.name LargeBatchTest_case_007
     * @tc.desc source-large: verify actual DataSource storage contract; input vector 7.
     * @tc.type Function
     * @tc.level Level1
     */
    it('LargeBatchTest_case_007', 0, async () => {
      const source = makeSource("test.source-large.6", 61, "source-large:6");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(61);
      await assertSource(source, "test.source-large.6", 61, "source-large:6");
      const before = snapshotTitles(source);
      const tail = new TextCardData(makeModel("test.source-large.6", makePayload("tab\tvalue", "", 6)));
      source.addData(tail);
      expect(source.totalCount()).assertEqual(initialCount + 1);
      expect(source.getData(initialCount) === tail).assertTrue();
      expect(source.getData(initialCount).opt('item').title.name).assertEqual("tab\tvalue");
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
     * @tc.name LargeBatchTest_case_008
     * @tc.desc source-large: verify actual DataSource storage contract; input vector 8.
     * @tc.type Function
     * @tc.level Level1
     */
    it('LargeBatchTest_case_008', 0, async () => {
      const source = makeSource("test.source-large.7", 65, "source-large:7");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(65);
      await assertSource(source, "test.source-large.7", 65, "source-large:7");
      const before = snapshotTitles(source);
      const tail = new TextCardData(makeModel("test.source-large.7", makePayload("\u5361\u7247 1", ":{{env(screen-width}}", 7)));
      source.addData(tail);
      expect(source.totalCount()).assertEqual(initialCount + 1);
      expect(source.getData(initialCount) === tail).assertTrue();
      expect(source.getData(initialCount).opt('item').title.name).assertEqual("\u5361\u7247 1");
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
     * @tc.name LargeBatchTest_case_009
     * @tc.desc source-large: verify actual DataSource storage contract; input vector 9.
     * @tc.type Function
     * @tc.level Level1
     */
    it('LargeBatchTest_case_009', 0, async () => {
      const source = makeSource("test.source-large.8", 125, "source-large:8");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(125);
      await assertSource(source, "test.source-large.8", 125, "source-large:8");
      const before = snapshotTitles(source);
      const tail = new TextCardData(makeModel("test.source-large.8", makePayload("\u5361\u7247 2", "100%", 8)));
      source.addData(tail);
      expect(source.totalCount()).assertEqual(initialCount + 1);
      expect(source.getData(initialCount) === tail).assertTrue();
      expect(source.getData(initialCount).opt('item').title.name).assertEqual("\u5361\u7247 2");
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
     * @tc.name LargeBatchTest_case_010
     * @tc.desc source-large: verify actual DataSource storage contract; input vector 10.
     * @tc.type Function
     * @tc.level Level1
     */
    it('LargeBatchTest_case_010', 0, async () => {
      const source = makeSource("test.source-large.9", 129, "source-large:9");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(129);
      await assertSource(source, "test.source-large.9", 129, "source-large:9");
      const before = snapshotTitles(source);
      const tail = new TextCardData(makeModel("test.source-large.9", makePayload("\u5361\u7247 3", "0%", 9)));
      source.addData(tail);
      expect(source.totalCount()).assertEqual(initialCount + 1);
      expect(source.getData(initialCount) === tail).assertTrue();
      expect(source.getData(initialCount).opt('item').title.name).assertEqual("\u5361\u7247 3");
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
     * @tc.name LargeBatchTest_case_011
     * @tc.desc source-large: verify actual DataSource storage contract; input vector 11.
     * @tc.type Function
     * @tc.level Level1
     */
    it('LargeBatchTest_case_011', 0, async () => {
      const source = makeSource("test.source-large.10", 253, "source-large:10");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(253);
      await assertSource(source, "test.source-large.10", 253, "source-large:10");
      const before = snapshotTitles(source);
      const tail = new TextCardData(makeModel("test.source-large.10", makePayload("\u65e5\u672c\u8a9e", "50%", 10)));
      source.addData(tail);
      expect(source.totalCount()).assertEqual(initialCount + 1);
      expect(source.getData(initialCount) === tail).assertTrue();
      expect(source.getData(initialCount).opt('item').title.name).assertEqual("\u65e5\u672c\u8a9e");
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
     * @tc.name LargeBatchTest_case_012
     * @tc.desc source-large: verify actual DataSource storage contract; input vector 12.
     * @tc.type Function
     * @tc.level Level1
     */
    it('LargeBatchTest_case_012', 0, async () => {
      const source = makeSource("test.source-large.11", 257, "source-large:11");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(257);
      await assertSource(source, "test.source-large.11", 257, "source-large:11");
      const before = snapshotTitles(source);
      const tail = new TextCardData(makeModel("test.source-large.11", makePayload("\u0645\u0631\u062d\u0628\u0627", "1%", 11)));
      source.addData(tail);
      expect(source.totalCount()).assertEqual(initialCount + 1);
      expect(source.getData(initialCount) === tail).assertTrue();
      expect(source.getData(initialCount).opt('item').title.name).assertEqual("\u0645\u0631\u062d\u0628\u0627");
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
     * @tc.name LargeBatchTest_case_013
     * @tc.desc source-large: verify actual DataSource storage contract; input vector 13.
     * @tc.type Function
     * @tc.level Level1
     */
    it('LargeBatchTest_case_013', 0, async () => {
      const source = makeSource("test.source-large.12", 509, "source-large:12");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(509);
      await assertSource(source, "test.source-large.12", 509, "source-large:12");
      const before = snapshotTitles(source);
      const tail = new TextCardData(makeModel("test.source-large.12", makePayload("\u05e9\u05dc\u05d5\u05dd", "99%", 12)));
      source.addData(tail);
      expect(source.totalCount()).assertEqual(initialCount + 1);
      expect(source.getData(initialCount) === tail).assertTrue();
      expect(source.getData(initialCount).opt('item').title.name).assertEqual("\u05e9\u05dc\u05d5\u05dd");
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
     * @tc.name LargeBatchTest_case_014
     * @tc.desc source-large: verify actual DataSource storage contract; input vector 14.
     * @tc.type Function
     * @tc.level Level1
     */
    it('LargeBatchTest_case_014', 0, async () => {
      const source = makeSource("test.source-large.13", 1, "source-large:13");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(1);
      await assertSource(source, "test.source-large.13", 1, "source-large:13");
      const before = snapshotTitles(source);
      const tail = new TextCardData(makeModel("test.source-large.13", makePayload("e\u0301", "75%", 13)));
      source.addData(tail);
      expect(source.totalCount()).assertEqual(initialCount + 1);
      expect(source.getData(initialCount) === tail).assertTrue();
      expect(source.getData(initialCount).opt('item').title.name).assertEqual("e\u0301");
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
     * @tc.name LargeBatchTest_case_015
     * @tc.desc source-large: verify actual DataSource storage contract; input vector 15.
     * @tc.type Function
     * @tc.level Level1
     */
    it('LargeBatchTest_case_015', 0, async () => {
      const source = makeSource("test.source-large.14", 5, "source-large:14");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(5);
      await assertSource(source, "test.source-large.14", 5, "source-large:14");
      const before = snapshotTitles(source);
      const tail = new TextCardData(makeModel("test.source-large.14", makePayload("\u00e9", "", 14)));
      source.addData(tail);
      expect(source.totalCount()).assertEqual(initialCount + 1);
      expect(source.getData(initialCount) === tail).assertTrue();
      expect(source.getData(initialCount).opt('item').title.name).assertEqual("\u00e9");
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
     * @tc.name LargeBatchTest_case_016
     * @tc.desc source-large: verify actual DataSource storage contract; input vector 16.
     * @tc.type Function
     * @tc.level Level1
     */
    it('LargeBatchTest_case_016', 0, async () => {
      const source = makeSource("test.source-large.15", 9, "source-large:15");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(9);
      await assertSource(source, "test.source-large.15", 9, "source-large:15");
      const before = snapshotTitles(source);
      const tail = new TextCardData(makeModel("test.source-large.15", makePayload("\ud83d\ude80", ":{{env(screen-width}}", 15)));
      source.addData(tail);
      expect(source.totalCount()).assertEqual(initialCount + 1);
      expect(source.getData(initialCount) === tail).assertTrue();
      expect(source.getData(initialCount).opt('item').title.name).assertEqual("\ud83d\ude80");
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
     * @tc.name LargeBatchTest_case_017
     * @tc.desc source-large: verify actual DataSource storage contract; input vector 17.
     * @tc.type Function
     * @tc.level Level1
     */
    it('LargeBatchTest_case_017', 0, async () => {
      const source = makeSource("test.source-large.16", 13, "source-large:16");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(13);
      await assertSource(source, "test.source-large.16", 13, "source-large:16");
      const before = snapshotTitles(source);
      const tail = new TextCardData(makeModel("test.source-large.16", makePayload("quote\"slash\\", "100%", 16)));
      source.addData(tail);
      expect(source.totalCount()).assertEqual(initialCount + 1);
      expect(source.getData(initialCount) === tail).assertTrue();
      expect(source.getData(initialCount).opt('item').title.name).assertEqual("quote\"slash\\");
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
     * @tc.name LargeBatchTest_case_018
     * @tc.desc source-large: verify actual DataSource storage contract; input vector 18.
     * @tc.type Function
     * @tc.level Level1
     */
    it('LargeBatchTest_case_018', 0, async () => {
      const source = makeSource("test.source-large.17", 29, "source-large:17");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(29);
      await assertSource(source, "test.source-large.17", 29, "source-large:17");
      const before = snapshotTitles(source);
      const tail = new TextCardData(makeModel("test.source-large.17", makePayload("<script>alert(1)</script>", "0%", 17)));
      source.addData(tail);
      expect(source.totalCount()).assertEqual(initialCount + 1);
      expect(source.getData(initialCount) === tail).assertTrue();
      expect(source.getData(initialCount).opt('item').title.name).assertEqual("<script>alert(1)</script>");
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
     * @tc.name LargeBatchTest_case_019
     * @tc.desc source-large: verify actual DataSource storage contract; input vector 19.
     * @tc.type Function
     * @tc.level Level1
     */
    it('LargeBatchTest_case_019', 0, async () => {
      const source = makeSource("test.source-large.18", 33, "source-large:18");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(33);
      await assertSource(source, "test.source-large.18", 33, "source-large:18");
      const before = snapshotTitles(source);
      const tail = new TextCardData(makeModel("test.source-large.18", makePayload("${notExecuted}", "50%", 18)));
      source.addData(tail);
      expect(source.totalCount()).assertEqual(initialCount + 1);
      expect(source.getData(initialCount) === tail).assertTrue();
      expect(source.getData(initialCount).opt('item').title.name).assertEqual("${notExecuted}");
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
     * @tc.name LargeBatchTest_case_020
     * @tc.desc source-large: verify actual DataSource storage contract; input vector 20.
     * @tc.type Function
     * @tc.level Level1
     */
    it('LargeBatchTest_case_020', 0, async () => {
      const source = makeSource("test.source-large.19", 61, "source-large:19");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(61);
      await assertSource(source, "test.source-large.19", 61, "source-large:19");
      const before = snapshotTitles(source);
      const tail = new TextCardData(makeModel("test.source-large.19", makePayload("__proto__", "1%", 19)));
      source.addData(tail);
      expect(source.totalCount()).assertEqual(initialCount + 1);
      expect(source.getData(initialCount) === tail).assertTrue();
      expect(source.getData(initialCount).opt('item').title.name).assertEqual("__proto__");
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
     * @tc.name LargeBatchTest_case_021
     * @tc.desc source-large: verify actual DataSource storage contract; input vector 21.
     * @tc.type Function
     * @tc.level Level1
     */
    it('LargeBatchTest_case_021', 0, async () => {
      const source = makeSource("test.source-large.20", 65, "source-large:20");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(65);
      await assertSource(source, "test.source-large.20", 65, "source-large:20");
      const before = snapshotTitles(source);
      const tail = new TextCardData(makeModel("test.source-large.20", makePayload("constructor", "99%", 20)));
      source.addData(tail);
      expect(source.totalCount()).assertEqual(initialCount + 1);
      expect(source.getData(initialCount) === tail).assertTrue();
      expect(source.getData(initialCount).opt('item').title.name).assertEqual("constructor");
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
