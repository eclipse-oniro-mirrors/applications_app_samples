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

// Reference: ets/test/Interaction/FocusNavigation.test.ets
// Original line floor: 1191; scenario family: source-index.
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

export default function IndexLookupTest(): void {
  describe('IndexLookupTest', () => {
    beforeAll(() => {
      logSuite('IndexLookupTest', 'begin');
    });
    beforeEach(async () => {
      // Yield between cases so device watchdog and UI events can be processed.
      await new Promise<void>((resolve) => { setTimeout(resolve, 1); });
    });
    afterAll(() => {
      logSuite('IndexLookupTest', 'end');
    });

    /**
     * @tc.name IndexLookupTest_case_001
     * @tc.desc source-index: verify actual DataSource storage contract; input vector 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('IndexLookupTest_case_001', 0, async () => {
      const source = makeSource("test.source-index.0", 0, "source-index:0");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(0);
      await assertSource(source, "test.source-index.0", 0, "source-index:0");
      const before = snapshotTitles(source);
      const tail = new TextCardData(makeModel("test.source-index.0", makePayload("", "100%", 0)));
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
     * @tc.name IndexLookupTest_case_002
     * @tc.desc source-index: verify actual DataSource storage contract; input vector 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('IndexLookupTest_case_002', 0, async () => {
      const source = makeSource("test.source-index.1", 1, "source-index:1");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(1);
      await assertSource(source, "test.source-index.1", 1, "source-index:1");
      const before = snapshotTitles(source);
      const tail = new TextCardData(makeModel("test.source-index.1", makePayload("Card", "0%", 1)));
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
     * @tc.name IndexLookupTest_case_003
     * @tc.desc source-index: verify actual DataSource storage contract; input vector 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('IndexLookupTest_case_003', 0, async () => {
      const source = makeSource("test.source-index.2", 2, "source-index:2");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(2);
      await assertSource(source, "test.source-index.2", 2, "source-index:2");
      const before = snapshotTitles(source);
      const tail = new TextCardData(makeModel("test.source-index.2", makePayload(" ", "50%", 2)));
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
     * @tc.name IndexLookupTest_case_004
     * @tc.desc source-index: verify actual DataSource storage contract; input vector 4.
     * @tc.type Function
     * @tc.level Level1
     */
    it('IndexLookupTest_case_004', 0, async () => {
      const source = makeSource("test.source-index.3", 3, "source-index:3");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(3);
      await assertSource(source, "test.source-index.3", 3, "source-index:3");
      const before = snapshotTitles(source);
      const tail = new TextCardData(makeModel("test.source-index.3", makePayload("  padded  ", "1%", 3)));
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
     * @tc.name IndexLookupTest_case_005
     * @tc.desc source-index: verify actual DataSource storage contract; input vector 5.
     * @tc.type Function
     * @tc.level Level1
     */
    it('IndexLookupTest_case_005', 0, async () => {
      const source = makeSource("test.source-index.4", 7, "source-index:4");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(7);
      await assertSource(source, "test.source-index.4", 7, "source-index:4");
      const before = snapshotTitles(source);
      const tail = new TextCardData(makeModel("test.source-index.4", makePayload("multi word title", "99%", 4)));
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
     * @tc.name IndexLookupTest_case_006
     * @tc.desc source-index: verify actual DataSource storage contract; input vector 6.
     * @tc.type Function
     * @tc.level Level1
     */
    it('IndexLookupTest_case_006', 0, async () => {
      const source = makeSource("test.source-index.5", 8, "source-index:5");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(8);
      await assertSource(source, "test.source-index.5", 8, "source-index:5");
      const before = snapshotTitles(source);
      const tail = new TextCardData(makeModel("test.source-index.5", makePayload("line\nbreak", "75%", 5)));
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
     * @tc.name IndexLookupTest_case_007
     * @tc.desc source-index: verify actual DataSource storage contract; input vector 7.
     * @tc.type Function
     * @tc.level Level1
     */
    it('IndexLookupTest_case_007', 0, async () => {
      const source = makeSource("test.source-index.6", 15, "source-index:6");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(15);
      await assertSource(source, "test.source-index.6", 15, "source-index:6");
      const before = snapshotTitles(source);
      const tail = new TextCardData(makeModel("test.source-index.6", makePayload("tab\tvalue", "", 6)));
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
     * @tc.name IndexLookupTest_case_008
     * @tc.desc source-index: verify actual DataSource storage contract; input vector 8.
     * @tc.type Function
     * @tc.level Level1
     */
    it('IndexLookupTest_case_008', 0, async () => {
      const source = makeSource("test.source-index.7", 16, "source-index:7");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(16);
      await assertSource(source, "test.source-index.7", 16, "source-index:7");
      const before = snapshotTitles(source);
      const tail = new TextCardData(makeModel("test.source-index.7", makePayload("\u5361\u7247 1", ":{{env(screen-width}}", 7)));
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
     * @tc.name IndexLookupTest_case_009
     * @tc.desc source-index: verify actual DataSource storage contract; input vector 9.
     * @tc.type Function
     * @tc.level Level1
     */
    it('IndexLookupTest_case_009', 0, async () => {
      const source = makeSource("test.source-index.8", 31, "source-index:8");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(31);
      await assertSource(source, "test.source-index.8", 31, "source-index:8");
      const before = snapshotTitles(source);
      const tail = new TextCardData(makeModel("test.source-index.8", makePayload("\u5361\u7247 2", "100%", 8)));
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
     * @tc.name IndexLookupTest_case_010
     * @tc.desc source-index: verify actual DataSource storage contract; input vector 10.
     * @tc.type Function
     * @tc.level Level1
     */
    it('IndexLookupTest_case_010', 0, async () => {
      const source = makeSource("test.source-index.9", 32, "source-index:9");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(32);
      await assertSource(source, "test.source-index.9", 32, "source-index:9");
      const before = snapshotTitles(source);
      const tail = new TextCardData(makeModel("test.source-index.9", makePayload("\u5361\u7247 3", "0%", 9)));
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
     * @tc.name IndexLookupTest_case_011
     * @tc.desc source-index: verify actual DataSource storage contract; input vector 11.
     * @tc.type Function
     * @tc.level Level1
     */
    it('IndexLookupTest_case_011', 0, async () => {
      const source = makeSource("test.source-index.10", 63, "source-index:10");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(63);
      await assertSource(source, "test.source-index.10", 63, "source-index:10");
      const before = snapshotTitles(source);
      const tail = new TextCardData(makeModel("test.source-index.10", makePayload("\u65e5\u672c\u8a9e", "50%", 10)));
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
     * @tc.name IndexLookupTest_case_012
     * @tc.desc source-index: verify actual DataSource storage contract; input vector 12.
     * @tc.type Function
     * @tc.level Level1
     */
    it('IndexLookupTest_case_012', 0, async () => {
      const source = makeSource("test.source-index.11", 64, "source-index:11");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(64);
      await assertSource(source, "test.source-index.11", 64, "source-index:11");
      const before = snapshotTitles(source);
      const tail = new TextCardData(makeModel("test.source-index.11", makePayload("\u0645\u0631\u062d\u0628\u0627", "1%", 11)));
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
     * @tc.name IndexLookupTest_case_013
     * @tc.desc source-index: verify actual DataSource storage contract; input vector 13.
     * @tc.type Function
     * @tc.level Level1
     */
    it('IndexLookupTest_case_013', 0, async () => {
      const source = makeSource("test.source-index.12", 127, "source-index:12");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(127);
      await assertSource(source, "test.source-index.12", 127, "source-index:12");
      const before = snapshotTitles(source);
      const tail = new TextCardData(makeModel("test.source-index.12", makePayload("\u05e9\u05dc\u05d5\u05dd", "99%", 12)));
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
     * @tc.name IndexLookupTest_case_014
     * @tc.desc source-index: verify actual DataSource storage contract; input vector 14.
     * @tc.type Function
     * @tc.level Level1
     */
    it('IndexLookupTest_case_014', 0, async () => {
      const source = makeSource("test.source-index.13", 0, "source-index:13");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(0);
      await assertSource(source, "test.source-index.13", 0, "source-index:13");
      const before = snapshotTitles(source);
      const tail = new TextCardData(makeModel("test.source-index.13", makePayload("e\u0301", "75%", 13)));
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
     * @tc.name IndexLookupTest_case_015
     * @tc.desc source-index: verify actual DataSource storage contract; input vector 15.
     * @tc.type Function
     * @tc.level Level1
     */
    it('IndexLookupTest_case_015', 0, async () => {
      const source = makeSource("test.source-index.14", 1, "source-index:14");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(1);
      await assertSource(source, "test.source-index.14", 1, "source-index:14");
      const before = snapshotTitles(source);
      const tail = new TextCardData(makeModel("test.source-index.14", makePayload("\u00e9", "", 14)));
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
     * @tc.name IndexLookupTest_case_016
     * @tc.desc source-index: verify actual DataSource storage contract; input vector 16.
     * @tc.type Function
     * @tc.level Level1
     */
    it('IndexLookupTest_case_016', 0, async () => {
      const source = makeSource("test.source-index.15", 2, "source-index:15");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(2);
      await assertSource(source, "test.source-index.15", 2, "source-index:15");
      const before = snapshotTitles(source);
      const tail = new TextCardData(makeModel("test.source-index.15", makePayload("\ud83d\ude80", ":{{env(screen-width}}", 15)));
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
     * @tc.name IndexLookupTest_case_017
     * @tc.desc source-index: verify actual DataSource storage contract; input vector 17.
     * @tc.type Function
     * @tc.level Level1
     */
    it('IndexLookupTest_case_017', 0, async () => {
      const source = makeSource("test.source-index.16", 3, "source-index:16");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(3);
      await assertSource(source, "test.source-index.16", 3, "source-index:16");
      const before = snapshotTitles(source);
      const tail = new TextCardData(makeModel("test.source-index.16", makePayload("quote\"slash\\", "100%", 16)));
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
     * @tc.name IndexLookupTest_case_018
     * @tc.desc source-index: verify actual DataSource storage contract; input vector 18.
     * @tc.type Function
     * @tc.level Level1
     */
    it('IndexLookupTest_case_018', 0, async () => {
      const source = makeSource("test.source-index.17", 7, "source-index:17");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(7);
      await assertSource(source, "test.source-index.17", 7, "source-index:17");
      const before = snapshotTitles(source);
      const tail = new TextCardData(makeModel("test.source-index.17", makePayload("<script>alert(1)</script>", "0%", 17)));
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
     * @tc.name IndexLookupTest_case_019
     * @tc.desc source-index: verify actual DataSource storage contract; input vector 19.
     * @tc.type Function
     * @tc.level Level1
     */
    it('IndexLookupTest_case_019', 0, async () => {
      const source = makeSource("test.source-index.18", 8, "source-index:18");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(8);
      await assertSource(source, "test.source-index.18", 8, "source-index:18");
      const before = snapshotTitles(source);
      const tail = new TextCardData(makeModel("test.source-index.18", makePayload("${notExecuted}", "50%", 18)));
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
     * @tc.name IndexLookupTest_case_020
     * @tc.desc source-index: verify actual DataSource storage contract; input vector 20.
     * @tc.type Function
     * @tc.level Level1
     */
    it('IndexLookupTest_case_020', 0, async () => {
      const source = makeSource("test.source-index.19", 15, "source-index:19");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(15);
      await assertSource(source, "test.source-index.19", 15, "source-index:19");
      const before = snapshotTitles(source);
      const tail = new TextCardData(makeModel("test.source-index.19", makePayload("__proto__", "1%", 19)));
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
     * @tc.name IndexLookupTest_case_021
     * @tc.desc source-index: verify actual DataSource storage contract; input vector 21.
     * @tc.type Function
     * @tc.level Level1
     */
    it('IndexLookupTest_case_021', 0, async () => {
      const source = makeSource("test.source-index.20", 16, "source-index:20");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(16);
      await assertSource(source, "test.source-index.20", 16, "source-index:20");
      const before = snapshotTitles(source);
      const tail = new TextCardData(makeModel("test.source-index.20", makePayload("constructor", "99%", 20)));
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

    /**
     * @tc.name IndexLookupTest_case_022
     * @tc.desc source-index: verify actual DataSource storage contract; input vector 22.
     * @tc.type Function
     * @tc.level Level1
     */
    it('IndexLookupTest_case_022', 0, async () => {
      const source = makeSource("test.source-index.21", 31, "source-index:21");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(31);
      await assertSource(source, "test.source-index.21", 31, "source-index:21");
      const before = snapshotTitles(source);
      const tail = new TextCardData(makeModel("test.source-index.21", makePayload("null", "75%", 21)));
      source.addData(tail);
      expect(source.totalCount()).assertEqual(initialCount + 1);
      expect(source.getData(initialCount) === tail).assertTrue();
      expect(source.getData(initialCount).opt('item').title.name).assertEqual("null");
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
     * @tc.name IndexLookupTest_case_023
     * @tc.desc source-index: verify actual DataSource storage contract; input vector 23.
     * @tc.type Function
     * @tc.level Level1
     */
    it('IndexLookupTest_case_023', 0, async () => {
      const source = makeSource("test.source-index.22", 32, "source-index:22");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(32);
      await assertSource(source, "test.source-index.22", 32, "source-index:22");
      const before = snapshotTitles(source);
      const tail = new TextCardData(makeModel("test.source-index.22", makePayload("false", "", 22)));
      source.addData(tail);
      expect(source.totalCount()).assertEqual(initialCount + 1);
      expect(source.getData(initialCount) === tail).assertTrue();
      expect(source.getData(initialCount).opt('item').title.name).assertEqual("false");
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
     * @tc.name IndexLookupTest_case_024
     * @tc.desc source-index: verify actual DataSource storage contract; input vector 24.
     * @tc.type Function
     * @tc.level Level1
     */
    it('IndexLookupTest_case_024', 0, async () => {
      const source = makeSource("test.source-index.23", 63, "source-index:23");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(63);
      await assertSource(source, "test.source-index.23", 63, "source-index:23");
      const before = snapshotTitles(source);
      const tail = new TextCardData(makeModel("test.source-index.23", makePayload("0", ":{{env(screen-width}}", 23)));
      source.addData(tail);
      expect(source.totalCount()).assertEqual(initialCount + 1);
      expect(source.getData(initialCount) === tail).assertTrue();
      expect(source.getData(initialCount).opt('item').title.name).assertEqual("0");
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
     * @tc.name IndexLookupTest_case_025
     * @tc.desc source-index: verify actual DataSource storage contract; input vector 25.
     * @tc.type Function
     * @tc.level Level1
     */
    it('IndexLookupTest_case_025', 0, async () => {
      const source = makeSource("test.source-index.24", 64, "source-index:24");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(64);
      await assertSource(source, "test.source-index.24", 64, "source-index:24");
      const before = snapshotTitles(source);
      const tail = new TextCardData(makeModel("test.source-index.24", makePayload("100%", "100%", 24)));
      source.addData(tail);
      expect(source.totalCount()).assertEqual(initialCount + 1);
      expect(source.getData(initialCount) === tail).assertTrue();
      expect(source.getData(initialCount).opt('item').title.name).assertEqual("100%");
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
     * @tc.name IndexLookupTest_case_026
     * @tc.desc source-index: verify actual DataSource storage contract; input vector 26.
     * @tc.type Function
     * @tc.level Level1
     */
    it('IndexLookupTest_case_026', 0, async () => {
      const source = makeSource("test.source-index.25", 127, "source-index:25");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(127);
      await assertSource(source, "test.source-index.25", 127, "source-index:25");
      const before = snapshotTitles(source);
      const tail = new TextCardData(makeModel("test.source-index.25", makePayload("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA", "0%", 25)));
      source.addData(tail);
      expect(source.totalCount()).assertEqual(initialCount + 1);
      expect(source.getData(initialCount) === tail).assertTrue();
      expect(source.getData(initialCount).opt('item').title.name).assertEqual("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA");
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
     * @tc.name IndexLookupTest_case_027
     * @tc.desc source-index: verify actual DataSource storage contract; input vector 27.
     * @tc.type Function
     * @tc.level Level1
     */
    it('IndexLookupTest_case_027', 0, async () => {
      const source = makeSource("test.source-index.26", 0, "source-index:26");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(0);
      await assertSource(source, "test.source-index.26", 0, "source-index:26");
      const before = snapshotTitles(source);
      const tail = new TextCardData(makeModel("test.source-index.26", makePayload("\u0000", "50%", 26)));
      source.addData(tail);
      expect(source.totalCount()).assertEqual(initialCount + 1);
      expect(source.getData(initialCount) === tail).assertTrue();
      expect(source.getData(initialCount).opt('item').title.name).assertEqual("\u0000");
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
     * @tc.name IndexLookupTest_case_028
     * @tc.desc source-index: verify actual DataSource storage contract; input vector 28.
     * @tc.type Function
     * @tc.level Level1
     */
    it('IndexLookupTest_case_028', 0, async () => {
      const source = makeSource("test.source-index.27", 1, "source-index:27");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(1);
      await assertSource(source, "test.source-index.27", 1, "source-index:27");
      const before = snapshotTitles(source);
      const tail = new TextCardData(makeModel("test.source-index.27", makePayload("\u2028", "1%", 27)));
      source.addData(tail);
      expect(source.totalCount()).assertEqual(initialCount + 1);
      expect(source.getData(initialCount) === tail).assertTrue();
      expect(source.getData(initialCount).opt('item').title.name).assertEqual("\u2028");
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
     * @tc.name IndexLookupTest_case_029
     * @tc.desc source-index: verify actual DataSource storage contract; input vector 29.
     * @tc.type Function
     * @tc.level Level1
     */
    it('IndexLookupTest_case_029', 0, async () => {
      const source = makeSource("test.source-index.28", 2, "source-index:28");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(2);
      await assertSource(source, "test.source-index.28", 2, "source-index:28");
      const before = snapshotTitles(source);
      const tail = new TextCardData(makeModel("test.source-index.28", makePayload("\u2029", "99%", 28)));
      source.addData(tail);
      expect(source.totalCount()).assertEqual(initialCount + 1);
      expect(source.getData(initialCount) === tail).assertTrue();
      expect(source.getData(initialCount).opt('item').title.name).assertEqual("\u2029");
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
     * @tc.name IndexLookupTest_case_030
     * @tc.desc source-index: verify actual DataSource storage contract; input vector 30.
     * @tc.type Function
     * @tc.level Level1
     */
    it('IndexLookupTest_case_030', 0, async () => {
      const source = makeSource("test.source-index.29", 3, "source-index:29");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(3);
      await assertSource(source, "test.source-index.29", 3, "source-index:29");
      const before = snapshotTitles(source);
      const tail = new TextCardData(makeModel("test.source-index.29", makePayload("\r\n", "75%", 29)));
      source.addData(tail);
      expect(source.totalCount()).assertEqual(initialCount + 1);
      expect(source.getData(initialCount) === tail).assertTrue();
      expect(source.getData(initialCount).opt('item').title.name).assertEqual("\r\n");
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
     * @tc.name IndexLookupTest_case_031
     * @tc.desc source-index: verify actual DataSource storage contract; input vector 31.
     * @tc.type Function
     * @tc.level Level1
     */
    it('IndexLookupTest_case_031', 0, async () => {
      const source = makeSource("test.source-index.30", 7, "source-index:30");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(7);
      await assertSource(source, "test.source-index.30", 7, "source-index:30");
      const before = snapshotTitles(source);
      const tail = new TextCardData(makeModel("test.source-index.30", makePayload("\ud83d\udc69\u200d\ud83d\udcbb", "", 30)));
      source.addData(tail);
      expect(source.totalCount()).assertEqual(initialCount + 1);
      expect(source.getData(initialCount) === tail).assertTrue();
      expect(source.getData(initialCount).opt('item').title.name).assertEqual("\ud83d\udc69\u200d\ud83d\udcbb");
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
     * @tc.name IndexLookupTest_case_032
     * @tc.desc source-index: verify actual DataSource storage contract; input vector 32.
     * @tc.type Function
     * @tc.level Level1
     */
    it('IndexLookupTest_case_032', 0, async () => {
      const source = makeSource("test.source-index.31", 8, "source-index:31");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(8);
      await assertSource(source, "test.source-index.31", 8, "source-index:31");
      const before = snapshotTitles(source);
      const tail = new TextCardData(makeModel("test.source-index.31", makePayload("end.", ":{{env(screen-width}}", 31)));
      source.addData(tail);
      expect(source.totalCount()).assertEqual(initialCount + 1);
      expect(source.getData(initialCount) === tail).assertTrue();
      expect(source.getData(initialCount).opt('item').title.name).assertEqual("end.");
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
     * @tc.name IndexLookupTest_case_033
     * @tc.desc source-index: verify actual DataSource storage contract; input vector 33.
     * @tc.type Function
     * @tc.level Level1
     */
    it('IndexLookupTest_case_033', 0, async () => {
      const source = makeSource("test.source-index.32", 15, "source-index:32");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(15);
      await assertSource(source, "test.source-index.32", 15, "source-index:32");
      const before = snapshotTitles(source);
      const tail = new TextCardData(makeModel("test.source-index.32", makePayload("", "100%", 32)));
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
     * @tc.name IndexLookupTest_case_034
     * @tc.desc source-index: verify actual DataSource storage contract; input vector 34.
     * @tc.type Function
     * @tc.level Level1
     */
    it('IndexLookupTest_case_034', 0, async () => {
      const source = makeSource("test.source-index.33", 16, "source-index:33");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(16);
      await assertSource(source, "test.source-index.33", 16, "source-index:33");
      const before = snapshotTitles(source);
      const tail = new TextCardData(makeModel("test.source-index.33", makePayload("Card", "0%", 33)));
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
     * @tc.name IndexLookupTest_case_035
     * @tc.desc source-index: verify actual DataSource storage contract; input vector 35.
     * @tc.type Function
     * @tc.level Level1
     */
    it('IndexLookupTest_case_035', 0, async () => {
      const source = makeSource("test.source-index.34", 31, "source-index:34");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(31);
      await assertSource(source, "test.source-index.34", 31, "source-index:34");
      const before = snapshotTitles(source);
      const tail = new TextCardData(makeModel("test.source-index.34", makePayload(" ", "50%", 34)));
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
     * @tc.name IndexLookupTest_case_036
     * @tc.desc source-index: verify actual DataSource storage contract; input vector 36.
     * @tc.type Function
     * @tc.level Level1
     */
    it('IndexLookupTest_case_036', 0, async () => {
      const source = makeSource("test.source-index.35", 32, "source-index:35");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(32);
      await assertSource(source, "test.source-index.35", 32, "source-index:35");
      const before = snapshotTitles(source);
      const tail = new TextCardData(makeModel("test.source-index.35", makePayload("  padded  ", "1%", 35)));
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
     * @tc.name IndexLookupTest_case_037
     * @tc.desc source-index: verify actual DataSource storage contract; input vector 37.
     * @tc.type Function
     * @tc.level Level1
     */
    it('IndexLookupTest_case_037', 0, async () => {
      const source = makeSource("test.source-index.36", 63, "source-index:36");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(63);
      await assertSource(source, "test.source-index.36", 63, "source-index:36");
      const before = snapshotTitles(source);
      const tail = new TextCardData(makeModel("test.source-index.36", makePayload("multi word title", "99%", 36)));
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
     * @tc.name IndexLookupTest_case_038
     * @tc.desc source-index: verify actual DataSource storage contract; input vector 38.
     * @tc.type Function
     * @tc.level Level1
     */
    it('IndexLookupTest_case_038', 0, async () => {
      const source = makeSource("test.source-index.37", 64, "source-index:37");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(64);
      await assertSource(source, "test.source-index.37", 64, "source-index:37");
      const before = snapshotTitles(source);
      const tail = new TextCardData(makeModel("test.source-index.37", makePayload("line\nbreak", "75%", 37)));
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
     * @tc.name IndexLookupTest_case_039
     * @tc.desc source-index: verify actual DataSource storage contract; input vector 39.
     * @tc.type Function
     * @tc.level Level1
     */
    it('IndexLookupTest_case_039', 0, async () => {
      const source = makeSource("test.source-index.38", 127, "source-index:38");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(127);
      await assertSource(source, "test.source-index.38", 127, "source-index:38");
      const before = snapshotTitles(source);
      const tail = new TextCardData(makeModel("test.source-index.38", makePayload("tab\tvalue", "", 38)));
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
     * @tc.name IndexLookupTest_case_040
     * @tc.desc source-index: verify actual DataSource storage contract; input vector 40.
     * @tc.type Function
     * @tc.level Level1
     */
    it('IndexLookupTest_case_040', 0, async () => {
      const source = makeSource("test.source-index.39", 0, "source-index:39");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(0);
      await assertSource(source, "test.source-index.39", 0, "source-index:39");
      const before = snapshotTitles(source);
      const tail = new TextCardData(makeModel("test.source-index.39", makePayload("\u5361\u7247 1", ":{{env(screen-width}}", 39)));
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
     * @tc.name IndexLookupTest_case_041
     * @tc.desc source-index: verify actual DataSource storage contract; input vector 41.
     * @tc.type Function
     * @tc.level Level1
     */
    it('IndexLookupTest_case_041', 0, async () => {
      const source = makeSource("test.source-index.40", 1, "source-index:40");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(1);
      await assertSource(source, "test.source-index.40", 1, "source-index:40");
      const before = snapshotTitles(source);
      const tail = new TextCardData(makeModel("test.source-index.40", makePayload("\u5361\u7247 2", "100%", 40)));
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
     * @tc.name IndexLookupTest_case_042
     * @tc.desc source-index: verify actual DataSource storage contract; input vector 42.
     * @tc.type Function
     * @tc.level Level1
     */
    it('IndexLookupTest_case_042', 0, async () => {
      const source = makeSource("test.source-index.41", 2, "source-index:41");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(2);
      await assertSource(source, "test.source-index.41", 2, "source-index:41");
      const before = snapshotTitles(source);
      const tail = new TextCardData(makeModel("test.source-index.41", makePayload("\u5361\u7247 3", "0%", 41)));
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
     * @tc.name IndexLookupTest_case_043
     * @tc.desc source-index: verify actual DataSource storage contract; input vector 43.
     * @tc.type Function
     * @tc.level Level1
     */
    it('IndexLookupTest_case_043', 0, async () => {
      const source = makeSource("test.source-index.42", 3, "source-index:42");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(3);
      await assertSource(source, "test.source-index.42", 3, "source-index:42");
      const before = snapshotTitles(source);
      const tail = new TextCardData(makeModel("test.source-index.42", makePayload("\u65e5\u672c\u8a9e", "50%", 42)));
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
     * @tc.name IndexLookupTest_case_044
     * @tc.desc source-index: verify actual DataSource storage contract; input vector 44.
     * @tc.type Function
     * @tc.level Level1
     */
    it('IndexLookupTest_case_044', 0, async () => {
      const source = makeSource("test.source-index.43", 7, "source-index:43");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(7);
      await assertSource(source, "test.source-index.43", 7, "source-index:43");
      const before = snapshotTitles(source);
      const tail = new TextCardData(makeModel("test.source-index.43", makePayload("\u0645\u0631\u062d\u0628\u0627", "1%", 43)));
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
  });
}
