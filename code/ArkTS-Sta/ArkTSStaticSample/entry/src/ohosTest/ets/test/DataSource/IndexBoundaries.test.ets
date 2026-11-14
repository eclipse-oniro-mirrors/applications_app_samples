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

// Reference: ets/test/Validation/BoundaryErrorTesting.test.ets
// Original line floor: 703; scenario family: source-boundary.
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

export default function IndexBoundariesTest(): void {
  describe('IndexBoundariesTest', () => {
    beforeAll(() => {
      logSuite('IndexBoundariesTest', 'begin');
    });
    beforeEach(async () => {
      // Yield between cases so device watchdog and UI events can be processed.
      await new Promise<void>((resolve) => { setTimeout(resolve, 1); });
    });
    afterAll(() => {
      logSuite('IndexBoundariesTest', 'end');
    });

    /**
     * @tc.name IndexBoundariesTest_case_001
     * @tc.desc source-boundary: verify actual DataSource storage contract; input vector 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('IndexBoundariesTest_case_001', 0, async () => {
      const source = makeSource("test.source-boundary.0", 0, "source-boundary:0");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(0);
      await assertSource(source, "test.source-boundary.0", 0, "source-boundary:0");
      const index = -1;
      const before = snapshotTitles(source);
      expect(source.getData(index)).assertUndefined();
      expect(source.totalCount()).assertEqual(initialCount);
      expect(snapshotTitles(source)).assertDeepEquals(before);
      const tail = new CardData(makeModel("test.source-boundary.0", makePayload("", "100%", 0)));
      source.addData(tail);
      expect(source.getData(0) === tail).assertTrue();
      expect(source.totalCount()).assertEqual(1);
      expect(source.getData(-1)).assertUndefined();
      expect(source.getData(1)).assertUndefined();
    });

    /**
     * @tc.name IndexBoundariesTest_case_002
     * @tc.desc source-boundary: verify actual DataSource storage contract; input vector 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('IndexBoundariesTest_case_002', 0, async () => {
      const source = makeSource("test.source-boundary.1", 1, "source-boundary:1");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(1);
      await assertSource(source, "test.source-boundary.1", 1, "source-boundary:1");
      const index = 1;
      const before = snapshotTitles(source);
      expect(source.getData(index)).assertUndefined();
      expect(source.totalCount()).assertEqual(initialCount);
      expect(snapshotTitles(source)).assertDeepEquals(before);
      const tail = new CardData(makeModel("test.source-boundary.1", makePayload("Card", "0%", 1)));
      source.addData(tail);
      expect(source.getData(1) === tail).assertTrue();
      expect(source.totalCount()).assertEqual(2);
      expect(source.getData(-1)).assertUndefined();
      expect(source.getData(2)).assertUndefined();
    });

    /**
     * @tc.name IndexBoundariesTest_case_003
     * @tc.desc source-boundary: verify actual DataSource storage contract; input vector 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('IndexBoundariesTest_case_003', 0, async () => {
      const source = makeSource("test.source-boundary.2", 2, "source-boundary:2");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(2);
      await assertSource(source, "test.source-boundary.2", 2, "source-boundary:2");
      const index = 3;
      const before = snapshotTitles(source);
      expect(source.getData(index)).assertUndefined();
      expect(source.totalCount()).assertEqual(initialCount);
      expect(snapshotTitles(source)).assertDeepEquals(before);
      const tail = new CardData(makeModel("test.source-boundary.2", makePayload(" ", "50%", 2)));
      source.addData(tail);
      expect(source.getData(2) === tail).assertTrue();
      expect(source.totalCount()).assertEqual(3);
      expect(source.getData(-1)).assertUndefined();
      expect(source.getData(3)).assertUndefined();
    });

    /**
     * @tc.name IndexBoundariesTest_case_004
     * @tc.desc source-boundary: verify actual DataSource storage contract; input vector 4.
     * @tc.type Function
     * @tc.level Level1
     */
    it('IndexBoundariesTest_case_004', 0, async () => {
      const source = makeSource("test.source-boundary.3", 3, "source-boundary:3");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(3);
      await assertSource(source, "test.source-boundary.3", 3, "source-boundary:3");
      const index = 0.5;
      const before = snapshotTitles(source);
      expect(source.getData(index)).assertUndefined();
      expect(source.totalCount()).assertEqual(initialCount);
      expect(snapshotTitles(source)).assertDeepEquals(before);
      const tail = new CardData(makeModel("test.source-boundary.3", makePayload("  padded  ", "1%", 3)));
      source.addData(tail);
      expect(source.getData(3) === tail).assertTrue();
      expect(source.totalCount()).assertEqual(4);
      expect(source.getData(-1)).assertUndefined();
      expect(source.getData(4)).assertUndefined();
    });

    /**
     * @tc.name IndexBoundariesTest_case_005
     * @tc.desc source-boundary: verify actual DataSource storage contract; input vector 5.
     * @tc.type Function
     * @tc.level Level1
     */
    it('IndexBoundariesTest_case_005', 0, async () => {
      const source = makeSource("test.source-boundary.4", 7, "source-boundary:4");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(7);
      await assertSource(source, "test.source-boundary.4", 7, "source-boundary:4");
      const index = Number.NaN;
      const before = snapshotTitles(source);
      expect(source.getData(index)).assertUndefined();
      expect(source.totalCount()).assertEqual(initialCount);
      expect(snapshotTitles(source)).assertDeepEquals(before);
      const tail = new CardData(makeModel("test.source-boundary.4", makePayload("multi word title", "99%", 4)));
      source.addData(tail);
      expect(source.getData(7) === tail).assertTrue();
      expect(source.totalCount()).assertEqual(8);
      expect(source.getData(-1)).assertUndefined();
      expect(source.getData(8)).assertUndefined();
    });

    /**
     * @tc.name IndexBoundariesTest_case_006
     * @tc.desc source-boundary: verify actual DataSource storage contract; input vector 6.
     * @tc.type Function
     * @tc.level Level1
     */
    it('IndexBoundariesTest_case_006', 0, async () => {
      const source = makeSource("test.source-boundary.5", 8, "source-boundary:5");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(8);
      await assertSource(source, "test.source-boundary.5", 8, "source-boundary:5");
      const index = Number.POSITIVE_INFINITY;
      const before = snapshotTitles(source);
      expect(source.getData(index)).assertUndefined();
      expect(source.totalCount()).assertEqual(initialCount);
      expect(snapshotTitles(source)).assertDeepEquals(before);
      const tail = new CardData(makeModel("test.source-boundary.5", makePayload("line\nbreak", "75%", 5)));
      source.addData(tail);
      expect(source.getData(8) === tail).assertTrue();
      expect(source.totalCount()).assertEqual(9);
      expect(source.getData(-1)).assertUndefined();
      expect(source.getData(9)).assertUndefined();
    });

    /**
     * @tc.name IndexBoundariesTest_case_007
     * @tc.desc source-boundary: verify actual DataSource storage contract; input vector 7.
     * @tc.type Function
     * @tc.level Level1
     */
    it('IndexBoundariesTest_case_007', 0, async () => {
      const source = makeSource("test.source-boundary.6", 15, "source-boundary:6");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(15);
      await assertSource(source, "test.source-boundary.6", 15, "source-boundary:6");
      const index = -Number.POSITIVE_INFINITY;
      const before = snapshotTitles(source);
      expect(source.getData(index)).assertUndefined();
      expect(source.totalCount()).assertEqual(initialCount);
      expect(snapshotTitles(source)).assertDeepEquals(before);
      const tail = new CardData(makeModel("test.source-boundary.6", makePayload("tab\tvalue", "", 6)));
      source.addData(tail);
      expect(source.getData(15) === tail).assertTrue();
      expect(source.totalCount()).assertEqual(16);
      expect(source.getData(-1)).assertUndefined();
      expect(source.getData(16)).assertUndefined();
    });

    /**
     * @tc.name IndexBoundariesTest_case_008
     * @tc.desc source-boundary: verify actual DataSource storage contract; input vector 8.
     * @tc.type Function
     * @tc.level Level1
     */
    it('IndexBoundariesTest_case_008', 0, async () => {
      const source = makeSource("test.source-boundary.7", 16, "source-boundary:7");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(16);
      await assertSource(source, "test.source-boundary.7", 16, "source-boundary:7");
      const index = 2147483647;
      const before = snapshotTitles(source);
      expect(source.getData(index)).assertUndefined();
      expect(source.totalCount()).assertEqual(initialCount);
      expect(snapshotTitles(source)).assertDeepEquals(before);
      const tail = new CardData(makeModel("test.source-boundary.7", makePayload("\u5361\u7247 1", ":{{env(screen-width}}", 7)));
      source.addData(tail);
      expect(source.getData(16) === tail).assertTrue();
      expect(source.totalCount()).assertEqual(17);
      expect(source.getData(-1)).assertUndefined();
      expect(source.getData(17)).assertUndefined();
    });

    /**
     * @tc.name IndexBoundariesTest_case_009
     * @tc.desc source-boundary: verify actual DataSource storage contract; input vector 9.
     * @tc.type Function
     * @tc.level Level1
     */
    it('IndexBoundariesTest_case_009', 0, async () => {
      const source = makeSource("test.source-boundary.8", 31, "source-boundary:8");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(31);
      await assertSource(source, "test.source-boundary.8", 31, "source-boundary:8");
      const index = -1;
      const before = snapshotTitles(source);
      expect(source.getData(index)).assertUndefined();
      expect(source.totalCount()).assertEqual(initialCount);
      expect(snapshotTitles(source)).assertDeepEquals(before);
      const tail = new CardData(makeModel("test.source-boundary.8", makePayload("\u5361\u7247 2", "100%", 8)));
      source.addData(tail);
      expect(source.getData(31) === tail).assertTrue();
      expect(source.totalCount()).assertEqual(32);
      expect(source.getData(-1)).assertUndefined();
      expect(source.getData(32)).assertUndefined();
    });

    /**
     * @tc.name IndexBoundariesTest_case_010
     * @tc.desc source-boundary: verify actual DataSource storage contract; input vector 10.
     * @tc.type Function
     * @tc.level Level1
     */
    it('IndexBoundariesTest_case_010', 0, async () => {
      const source = makeSource("test.source-boundary.9", 32, "source-boundary:9");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(32);
      await assertSource(source, "test.source-boundary.9", 32, "source-boundary:9");
      const index = 32;
      const before = snapshotTitles(source);
      expect(source.getData(index)).assertUndefined();
      expect(source.totalCount()).assertEqual(initialCount);
      expect(snapshotTitles(source)).assertDeepEquals(before);
      const tail = new CardData(makeModel("test.source-boundary.9", makePayload("\u5361\u7247 3", "0%", 9)));
      source.addData(tail);
      expect(source.getData(32) === tail).assertTrue();
      expect(source.totalCount()).assertEqual(33);
      expect(source.getData(-1)).assertUndefined();
      expect(source.getData(33)).assertUndefined();
    });

    /**
     * @tc.name IndexBoundariesTest_case_011
     * @tc.desc source-boundary: verify actual DataSource storage contract; input vector 11.
     * @tc.type Function
     * @tc.level Level1
     */
    it('IndexBoundariesTest_case_011', 0, async () => {
      const source = makeSource("test.source-boundary.10", 63, "source-boundary:10");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(63);
      await assertSource(source, "test.source-boundary.10", 63, "source-boundary:10");
      const index = 64;
      const before = snapshotTitles(source);
      expect(source.getData(index)).assertUndefined();
      expect(source.totalCount()).assertEqual(initialCount);
      expect(snapshotTitles(source)).assertDeepEquals(before);
      const tail = new CardData(makeModel("test.source-boundary.10", makePayload("\u65e5\u672c\u8a9e", "50%", 10)));
      source.addData(tail);
      expect(source.getData(63) === tail).assertTrue();
      expect(source.totalCount()).assertEqual(64);
      expect(source.getData(-1)).assertUndefined();
      expect(source.getData(64)).assertUndefined();
    });

    /**
     * @tc.name IndexBoundariesTest_case_012
     * @tc.desc source-boundary: verify actual DataSource storage contract; input vector 12.
     * @tc.type Function
     * @tc.level Level1
     */
    it('IndexBoundariesTest_case_012', 0, async () => {
      const source = makeSource("test.source-boundary.11", 64, "source-boundary:11");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(64);
      await assertSource(source, "test.source-boundary.11", 64, "source-boundary:11");
      const index = 0.5;
      const before = snapshotTitles(source);
      expect(source.getData(index)).assertUndefined();
      expect(source.totalCount()).assertEqual(initialCount);
      expect(snapshotTitles(source)).assertDeepEquals(before);
      const tail = new CardData(makeModel("test.source-boundary.11", makePayload("\u0645\u0631\u062d\u0628\u0627", "1%", 11)));
      source.addData(tail);
      expect(source.getData(64) === tail).assertTrue();
      expect(source.totalCount()).assertEqual(65);
      expect(source.getData(-1)).assertUndefined();
      expect(source.getData(65)).assertUndefined();
    });

    /**
     * @tc.name IndexBoundariesTest_case_013
     * @tc.desc source-boundary: verify actual DataSource storage contract; input vector 13.
     * @tc.type Function
     * @tc.level Level1
     */
    it('IndexBoundariesTest_case_013', 0, async () => {
      const source = makeSource("test.source-boundary.12", 127, "source-boundary:12");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(127);
      await assertSource(source, "test.source-boundary.12", 127, "source-boundary:12");
      const index = Number.NaN;
      const before = snapshotTitles(source);
      expect(source.getData(index)).assertUndefined();
      expect(source.totalCount()).assertEqual(initialCount);
      expect(snapshotTitles(source)).assertDeepEquals(before);
      const tail = new CardData(makeModel("test.source-boundary.12", makePayload("\u05e9\u05dc\u05d5\u05dd", "99%", 12)));
      source.addData(tail);
      expect(source.getData(127) === tail).assertTrue();
      expect(source.totalCount()).assertEqual(128);
      expect(source.getData(-1)).assertUndefined();
      expect(source.getData(128)).assertUndefined();
    });

    /**
     * @tc.name IndexBoundariesTest_case_014
     * @tc.desc source-boundary: verify actual DataSource storage contract; input vector 14.
     * @tc.type Function
     * @tc.level Level1
     */
    it('IndexBoundariesTest_case_014', 0, async () => {
      const source = makeSource("test.source-boundary.13", 0, "source-boundary:13");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(0);
      await assertSource(source, "test.source-boundary.13", 0, "source-boundary:13");
      const index = Number.POSITIVE_INFINITY;
      const before = snapshotTitles(source);
      expect(source.getData(index)).assertUndefined();
      expect(source.totalCount()).assertEqual(initialCount);
      expect(snapshotTitles(source)).assertDeepEquals(before);
      const tail = new CardData(makeModel("test.source-boundary.13", makePayload("e\u0301", "75%", 13)));
      source.addData(tail);
      expect(source.getData(0) === tail).assertTrue();
      expect(source.totalCount()).assertEqual(1);
      expect(source.getData(-1)).assertUndefined();
      expect(source.getData(1)).assertUndefined();
    });

    /**
     * @tc.name IndexBoundariesTest_case_015
     * @tc.desc source-boundary: verify actual DataSource storage contract; input vector 15.
     * @tc.type Function
     * @tc.level Level1
     */
    it('IndexBoundariesTest_case_015', 0, async () => {
      const source = makeSource("test.source-boundary.14", 1, "source-boundary:14");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(1);
      await assertSource(source, "test.source-boundary.14", 1, "source-boundary:14");
      const index = -Number.POSITIVE_INFINITY;
      const before = snapshotTitles(source);
      expect(source.getData(index)).assertUndefined();
      expect(source.totalCount()).assertEqual(initialCount);
      expect(snapshotTitles(source)).assertDeepEquals(before);
      const tail = new CardData(makeModel("test.source-boundary.14", makePayload("\u00e9", "", 14)));
      source.addData(tail);
      expect(source.getData(1) === tail).assertTrue();
      expect(source.totalCount()).assertEqual(2);
      expect(source.getData(-1)).assertUndefined();
      expect(source.getData(2)).assertUndefined();
    });

    /**
     * @tc.name IndexBoundariesTest_case_016
     * @tc.desc source-boundary: verify actual DataSource storage contract; input vector 16.
     * @tc.type Function
     * @tc.level Level1
     */
    it('IndexBoundariesTest_case_016', 0, async () => {
      const source = makeSource("test.source-boundary.15", 2, "source-boundary:15");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(2);
      await assertSource(source, "test.source-boundary.15", 2, "source-boundary:15");
      const index = 2147483647;
      const before = snapshotTitles(source);
      expect(source.getData(index)).assertUndefined();
      expect(source.totalCount()).assertEqual(initialCount);
      expect(snapshotTitles(source)).assertDeepEquals(before);
      const tail = new CardData(makeModel("test.source-boundary.15", makePayload("\ud83d\ude80", ":{{env(screen-width}}", 15)));
      source.addData(tail);
      expect(source.getData(2) === tail).assertTrue();
      expect(source.totalCount()).assertEqual(3);
      expect(source.getData(-1)).assertUndefined();
      expect(source.getData(3)).assertUndefined();
    });

    /**
     * @tc.name IndexBoundariesTest_case_017
     * @tc.desc source-boundary: verify actual DataSource storage contract; input vector 17.
     * @tc.type Function
     * @tc.level Level1
     */
    it('IndexBoundariesTest_case_017', 0, async () => {
      const source = makeSource("test.source-boundary.16", 3, "source-boundary:16");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(3);
      await assertSource(source, "test.source-boundary.16", 3, "source-boundary:16");
      const index = -1;
      const before = snapshotTitles(source);
      expect(source.getData(index)).assertUndefined();
      expect(source.totalCount()).assertEqual(initialCount);
      expect(snapshotTitles(source)).assertDeepEquals(before);
      const tail = new CardData(makeModel("test.source-boundary.16", makePayload("quote\"slash\\", "100%", 16)));
      source.addData(tail);
      expect(source.getData(3) === tail).assertTrue();
      expect(source.totalCount()).assertEqual(4);
      expect(source.getData(-1)).assertUndefined();
      expect(source.getData(4)).assertUndefined();
    });

    /**
     * @tc.name IndexBoundariesTest_case_018
     * @tc.desc source-boundary: verify actual DataSource storage contract; input vector 18.
     * @tc.type Function
     * @tc.level Level1
     */
    it('IndexBoundariesTest_case_018', 0, async () => {
      const source = makeSource("test.source-boundary.17", 7, "source-boundary:17");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(7);
      await assertSource(source, "test.source-boundary.17", 7, "source-boundary:17");
      const index = 7;
      const before = snapshotTitles(source);
      expect(source.getData(index)).assertUndefined();
      expect(source.totalCount()).assertEqual(initialCount);
      expect(snapshotTitles(source)).assertDeepEquals(before);
      const tail = new CardData(makeModel("test.source-boundary.17", makePayload("<script>alert(1)</script>", "0%", 17)));
      source.addData(tail);
      expect(source.getData(7) === tail).assertTrue();
      expect(source.totalCount()).assertEqual(8);
      expect(source.getData(-1)).assertUndefined();
      expect(source.getData(8)).assertUndefined();
    });

    /**
     * @tc.name IndexBoundariesTest_case_019
     * @tc.desc source-boundary: verify actual DataSource storage contract; input vector 19.
     * @tc.type Function
     * @tc.level Level1
     */
    it('IndexBoundariesTest_case_019', 0, async () => {
      const source = makeSource("test.source-boundary.18", 8, "source-boundary:18");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(8);
      await assertSource(source, "test.source-boundary.18", 8, "source-boundary:18");
      const index = 9;
      const before = snapshotTitles(source);
      expect(source.getData(index)).assertUndefined();
      expect(source.totalCount()).assertEqual(initialCount);
      expect(snapshotTitles(source)).assertDeepEquals(before);
      const tail = new CardData(makeModel("test.source-boundary.18", makePayload("${notExecuted}", "50%", 18)));
      source.addData(tail);
      expect(source.getData(8) === tail).assertTrue();
      expect(source.totalCount()).assertEqual(9);
      expect(source.getData(-1)).assertUndefined();
      expect(source.getData(9)).assertUndefined();
    });

    /**
     * @tc.name IndexBoundariesTest_case_020
     * @tc.desc source-boundary: verify actual DataSource storage contract; input vector 20.
     * @tc.type Function
     * @tc.level Level1
     */
    it('IndexBoundariesTest_case_020', 0, async () => {
      const source = makeSource("test.source-boundary.19", 15, "source-boundary:19");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(15);
      await assertSource(source, "test.source-boundary.19", 15, "source-boundary:19");
      const index = 0.5;
      const before = snapshotTitles(source);
      expect(source.getData(index)).assertUndefined();
      expect(source.totalCount()).assertEqual(initialCount);
      expect(snapshotTitles(source)).assertDeepEquals(before);
      const tail = new CardData(makeModel("test.source-boundary.19", makePayload("__proto__", "1%", 19)));
      source.addData(tail);
      expect(source.getData(15) === tail).assertTrue();
      expect(source.totalCount()).assertEqual(16);
      expect(source.getData(-1)).assertUndefined();
      expect(source.getData(16)).assertUndefined();
    });

    /**
     * @tc.name IndexBoundariesTest_case_021
     * @tc.desc source-boundary: verify actual DataSource storage contract; input vector 21.
     * @tc.type Function
     * @tc.level Level1
     */
    it('IndexBoundariesTest_case_021', 0, async () => {
      const source = makeSource("test.source-boundary.20", 16, "source-boundary:20");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(16);
      await assertSource(source, "test.source-boundary.20", 16, "source-boundary:20");
      const index = Number.NaN;
      const before = snapshotTitles(source);
      expect(source.getData(index)).assertUndefined();
      expect(source.totalCount()).assertEqual(initialCount);
      expect(snapshotTitles(source)).assertDeepEquals(before);
      const tail = new CardData(makeModel("test.source-boundary.20", makePayload("constructor", "99%", 20)));
      source.addData(tail);
      expect(source.getData(16) === tail).assertTrue();
      expect(source.totalCount()).assertEqual(17);
      expect(source.getData(-1)).assertUndefined();
      expect(source.getData(17)).assertUndefined();
    });

    /**
     * @tc.name IndexBoundariesTest_case_022
     * @tc.desc source-boundary: verify actual DataSource storage contract; input vector 22.
     * @tc.type Function
     * @tc.level Level1
     */
    it('IndexBoundariesTest_case_022', 0, async () => {
      const source = makeSource("test.source-boundary.21", 31, "source-boundary:21");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(31);
      await assertSource(source, "test.source-boundary.21", 31, "source-boundary:21");
      const index = Number.POSITIVE_INFINITY;
      const before = snapshotTitles(source);
      expect(source.getData(index)).assertUndefined();
      expect(source.totalCount()).assertEqual(initialCount);
      expect(snapshotTitles(source)).assertDeepEquals(before);
      const tail = new CardData(makeModel("test.source-boundary.21", makePayload("null", "75%", 21)));
      source.addData(tail);
      expect(source.getData(31) === tail).assertTrue();
      expect(source.totalCount()).assertEqual(32);
      expect(source.getData(-1)).assertUndefined();
      expect(source.getData(32)).assertUndefined();
    });

    /**
     * @tc.name IndexBoundariesTest_case_023
     * @tc.desc source-boundary: verify actual DataSource storage contract; input vector 23.
     * @tc.type Function
     * @tc.level Level1
     */
    it('IndexBoundariesTest_case_023', 0, async () => {
      const source = makeSource("test.source-boundary.22", 32, "source-boundary:22");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(32);
      await assertSource(source, "test.source-boundary.22", 32, "source-boundary:22");
      const index = -Number.POSITIVE_INFINITY;
      const before = snapshotTitles(source);
      expect(source.getData(index)).assertUndefined();
      expect(source.totalCount()).assertEqual(initialCount);
      expect(snapshotTitles(source)).assertDeepEquals(before);
      const tail = new CardData(makeModel("test.source-boundary.22", makePayload("false", "", 22)));
      source.addData(tail);
      expect(source.getData(32) === tail).assertTrue();
      expect(source.totalCount()).assertEqual(33);
      expect(source.getData(-1)).assertUndefined();
      expect(source.getData(33)).assertUndefined();
    });

    /**
     * @tc.name IndexBoundariesTest_case_024
     * @tc.desc source-boundary: verify actual DataSource storage contract; input vector 24.
     * @tc.type Function
     * @tc.level Level1
     */
    it('IndexBoundariesTest_case_024', 0, async () => {
      const source = makeSource("test.source-boundary.23", 63, "source-boundary:23");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(63);
      await assertSource(source, "test.source-boundary.23", 63, "source-boundary:23");
      const index = 2147483647;
      const before = snapshotTitles(source);
      expect(source.getData(index)).assertUndefined();
      expect(source.totalCount()).assertEqual(initialCount);
      expect(snapshotTitles(source)).assertDeepEquals(before);
      const tail = new CardData(makeModel("test.source-boundary.23", makePayload("0", ":{{env(screen-width}}", 23)));
      source.addData(tail);
      expect(source.getData(63) === tail).assertTrue();
      expect(source.totalCount()).assertEqual(64);
      expect(source.getData(-1)).assertUndefined();
      expect(source.getData(64)).assertUndefined();
    });

    /**
     * @tc.name IndexBoundariesTest_case_025
     * @tc.desc source-boundary: verify actual DataSource storage contract; input vector 25.
     * @tc.type Function
     * @tc.level Level1
     */
    it('IndexBoundariesTest_case_025', 0, async () => {
      const source = makeSource("test.source-boundary.24", 64, "source-boundary:24");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(64);
      await assertSource(source, "test.source-boundary.24", 64, "source-boundary:24");
      const index = -1;
      const before = snapshotTitles(source);
      expect(source.getData(index)).assertUndefined();
      expect(source.totalCount()).assertEqual(initialCount);
      expect(snapshotTitles(source)).assertDeepEquals(before);
      const tail = new CardData(makeModel("test.source-boundary.24", makePayload("100%", "100%", 24)));
      source.addData(tail);
      expect(source.getData(64) === tail).assertTrue();
      expect(source.totalCount()).assertEqual(65);
      expect(source.getData(-1)).assertUndefined();
      expect(source.getData(65)).assertUndefined();
    });

    /**
     * @tc.name IndexBoundariesTest_case_026
     * @tc.desc source-boundary: verify actual DataSource storage contract; input vector 26.
     * @tc.type Function
     * @tc.level Level1
     */
    it('IndexBoundariesTest_case_026', 0, async () => {
      const source = makeSource("test.source-boundary.25", 127, "source-boundary:25");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(127);
      await assertSource(source, "test.source-boundary.25", 127, "source-boundary:25");
      const index = 127;
      const before = snapshotTitles(source);
      expect(source.getData(index)).assertUndefined();
      expect(source.totalCount()).assertEqual(initialCount);
      expect(snapshotTitles(source)).assertDeepEquals(before);
      const tail = new CardData(makeModel("test.source-boundary.25", makePayload("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA", "0%", 25)));
      source.addData(tail);
      expect(source.getData(127) === tail).assertTrue();
      expect(source.totalCount()).assertEqual(128);
      expect(source.getData(-1)).assertUndefined();
      expect(source.getData(128)).assertUndefined();
    });

    /**
     * @tc.name IndexBoundariesTest_case_027
     * @tc.desc source-boundary: verify actual DataSource storage contract; input vector 27.
     * @tc.type Function
     * @tc.level Level1
     */
    it('IndexBoundariesTest_case_027', 0, async () => {
      const source = makeSource("test.source-boundary.26", 0, "source-boundary:26");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(0);
      await assertSource(source, "test.source-boundary.26", 0, "source-boundary:26");
      const index = 1;
      const before = snapshotTitles(source);
      expect(source.getData(index)).assertUndefined();
      expect(source.totalCount()).assertEqual(initialCount);
      expect(snapshotTitles(source)).assertDeepEquals(before);
      const tail = new CardData(makeModel("test.source-boundary.26", makePayload("\u0000", "50%", 26)));
      source.addData(tail);
      expect(source.getData(0) === tail).assertTrue();
      expect(source.totalCount()).assertEqual(1);
      expect(source.getData(-1)).assertUndefined();
      expect(source.getData(1)).assertUndefined();
    });
  });
}
