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

// Reference: ets/test/LifecycleState/DialogStateManagement.test.ets
// Original line floor: 1014; scenario family: source-isolation.
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

export default function SourceIsolationTest(): void {
  describe('SourceIsolationTest', () => {
    beforeAll(() => {
      logSuite('SourceIsolationTest', 'begin');
    });
    beforeEach(async () => {
      // Yield between cases so device watchdog and UI events can be processed.
      await new Promise<void>((resolve) => { setTimeout(resolve, 1); });
    });
    afterAll(() => {
      logSuite('SourceIsolationTest', 'end');
    });

    /**
     * @tc.name SourceIsolationTest_case_001
     * @tc.desc source-isolation: verify actual DataSource storage contract; input vector 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SourceIsolationTest_case_001', 0, async () => {
      const source = makeSource("test.source-isolation.0", 0, "source-isolation:0");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(0);
      await assertSource(source, "test.source-isolation.0", 0, "source-isolation:0");
      const second = makeSource("test.source-isolation.0", 1, 'independent');
      const secondBefore = snapshotTitles(second);
      const card = new CardData(makeModel("test.source-isolation.0", makePayload("", "100%", 0)));
      source.addData(card);
      expect(source.totalCount()).assertEqual(1);
      expect(second.totalCount()).assertEqual(1);
      expect(snapshotTitles(second)).assertDeepEquals(secondBefore);
      expect(source.dataList === second.dataList).assertFalse();
      expect(second.getData(0) === card).assertFalse();
      second.addData(card);
      expect(second.totalCount()).assertEqual(2);
      expect(source.totalCount()).assertEqual(1);
      expect(source.getData(0) === second.getData(1)).assertTrue();
    });

    /**
     * @tc.name SourceIsolationTest_case_002
     * @tc.desc source-isolation: verify actual DataSource storage contract; input vector 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SourceIsolationTest_case_002', 0, async () => {
      const source = makeSource("test.source-isolation.1", 1, "source-isolation:1");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(1);
      await assertSource(source, "test.source-isolation.1", 1, "source-isolation:1");
      const second = makeSource("test.source-isolation.1", 2, 'independent');
      const secondBefore = snapshotTitles(second);
      const card = new CardData(makeModel("test.source-isolation.1", makePayload("Card", "0%", 1)));
      source.addData(card);
      expect(source.totalCount()).assertEqual(2);
      expect(second.totalCount()).assertEqual(2);
      expect(snapshotTitles(second)).assertDeepEquals(secondBefore);
      expect(source.dataList === second.dataList).assertFalse();
      expect(second.getData(0) === card).assertFalse();
      second.addData(card);
      expect(second.totalCount()).assertEqual(3);
      expect(source.totalCount()).assertEqual(2);
      expect(source.getData(1) === second.getData(2)).assertTrue();
    });

    /**
     * @tc.name SourceIsolationTest_case_003
     * @tc.desc source-isolation: verify actual DataSource storage contract; input vector 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SourceIsolationTest_case_003', 0, async () => {
      const source = makeSource("test.source-isolation.2", 2, "source-isolation:2");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(2);
      await assertSource(source, "test.source-isolation.2", 2, "source-isolation:2");
      const second = makeSource("test.source-isolation.2", 3, 'independent');
      const secondBefore = snapshotTitles(second);
      const card = new CardData(makeModel("test.source-isolation.2", makePayload(" ", "50%", 2)));
      source.addData(card);
      expect(source.totalCount()).assertEqual(3);
      expect(second.totalCount()).assertEqual(3);
      expect(snapshotTitles(second)).assertDeepEquals(secondBefore);
      expect(source.dataList === second.dataList).assertFalse();
      expect(second.getData(0) === card).assertFalse();
      second.addData(card);
      expect(second.totalCount()).assertEqual(4);
      expect(source.totalCount()).assertEqual(3);
      expect(source.getData(2) === second.getData(3)).assertTrue();
    });

    /**
     * @tc.name SourceIsolationTest_case_004
     * @tc.desc source-isolation: verify actual DataSource storage contract; input vector 4.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SourceIsolationTest_case_004', 0, async () => {
      const source = makeSource("test.source-isolation.3", 3, "source-isolation:3");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(3);
      await assertSource(source, "test.source-isolation.3", 3, "source-isolation:3");
      const second = makeSource("test.source-isolation.3", 4, 'independent');
      const secondBefore = snapshotTitles(second);
      const card = new CardData(makeModel("test.source-isolation.3", makePayload("  padded  ", "1%", 3)));
      source.addData(card);
      expect(source.totalCount()).assertEqual(4);
      expect(second.totalCount()).assertEqual(4);
      expect(snapshotTitles(second)).assertDeepEquals(secondBefore);
      expect(source.dataList === second.dataList).assertFalse();
      expect(second.getData(0) === card).assertFalse();
      second.addData(card);
      expect(second.totalCount()).assertEqual(5);
      expect(source.totalCount()).assertEqual(4);
      expect(source.getData(3) === second.getData(4)).assertTrue();
    });

    /**
     * @tc.name SourceIsolationTest_case_005
     * @tc.desc source-isolation: verify actual DataSource storage contract; input vector 5.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SourceIsolationTest_case_005', 0, async () => {
      const source = makeSource("test.source-isolation.4", 7, "source-isolation:4");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(7);
      await assertSource(source, "test.source-isolation.4", 7, "source-isolation:4");
      const second = makeSource("test.source-isolation.4", 8, 'independent');
      const secondBefore = snapshotTitles(second);
      const card = new CardData(makeModel("test.source-isolation.4", makePayload("multi word title", "99%", 4)));
      source.addData(card);
      expect(source.totalCount()).assertEqual(8);
      expect(second.totalCount()).assertEqual(8);
      expect(snapshotTitles(second)).assertDeepEquals(secondBefore);
      expect(source.dataList === second.dataList).assertFalse();
      expect(second.getData(0) === card).assertFalse();
      second.addData(card);
      expect(second.totalCount()).assertEqual(9);
      expect(source.totalCount()).assertEqual(8);
      expect(source.getData(7) === second.getData(8)).assertTrue();
    });

    /**
     * @tc.name SourceIsolationTest_case_006
     * @tc.desc source-isolation: verify actual DataSource storage contract; input vector 6.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SourceIsolationTest_case_006', 0, async () => {
      const source = makeSource("test.source-isolation.5", 8, "source-isolation:5");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(8);
      await assertSource(source, "test.source-isolation.5", 8, "source-isolation:5");
      const second = makeSource("test.source-isolation.5", 9, 'independent');
      const secondBefore = snapshotTitles(second);
      const card = new CardData(makeModel("test.source-isolation.5", makePayload("line\nbreak", "75%", 5)));
      source.addData(card);
      expect(source.totalCount()).assertEqual(9);
      expect(second.totalCount()).assertEqual(9);
      expect(snapshotTitles(second)).assertDeepEquals(secondBefore);
      expect(source.dataList === second.dataList).assertFalse();
      expect(second.getData(0) === card).assertFalse();
      second.addData(card);
      expect(second.totalCount()).assertEqual(10);
      expect(source.totalCount()).assertEqual(9);
      expect(source.getData(8) === second.getData(9)).assertTrue();
    });

    /**
     * @tc.name SourceIsolationTest_case_007
     * @tc.desc source-isolation: verify actual DataSource storage contract; input vector 7.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SourceIsolationTest_case_007', 0, async () => {
      const source = makeSource("test.source-isolation.6", 15, "source-isolation:6");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(15);
      await assertSource(source, "test.source-isolation.6", 15, "source-isolation:6");
      const second = makeSource("test.source-isolation.6", 16, 'independent');
      const secondBefore = snapshotTitles(second);
      const card = new CardData(makeModel("test.source-isolation.6", makePayload("tab\tvalue", "", 6)));
      source.addData(card);
      expect(source.totalCount()).assertEqual(16);
      expect(second.totalCount()).assertEqual(16);
      expect(snapshotTitles(second)).assertDeepEquals(secondBefore);
      expect(source.dataList === second.dataList).assertFalse();
      expect(second.getData(0) === card).assertFalse();
      second.addData(card);
      expect(second.totalCount()).assertEqual(17);
      expect(source.totalCount()).assertEqual(16);
      expect(source.getData(15) === second.getData(16)).assertTrue();
    });

    /**
     * @tc.name SourceIsolationTest_case_008
     * @tc.desc source-isolation: verify actual DataSource storage contract; input vector 8.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SourceIsolationTest_case_008', 0, async () => {
      const source = makeSource("test.source-isolation.7", 16, "source-isolation:7");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(16);
      await assertSource(source, "test.source-isolation.7", 16, "source-isolation:7");
      const second = makeSource("test.source-isolation.7", 17, 'independent');
      const secondBefore = snapshotTitles(second);
      const card = new CardData(makeModel("test.source-isolation.7", makePayload("\u5361\u7247 1", ":{{env(screen-width}}", 7)));
      source.addData(card);
      expect(source.totalCount()).assertEqual(17);
      expect(second.totalCount()).assertEqual(17);
      expect(snapshotTitles(second)).assertDeepEquals(secondBefore);
      expect(source.dataList === second.dataList).assertFalse();
      expect(second.getData(0) === card).assertFalse();
      second.addData(card);
      expect(second.totalCount()).assertEqual(18);
      expect(source.totalCount()).assertEqual(17);
      expect(source.getData(16) === second.getData(17)).assertTrue();
    });

    /**
     * @tc.name SourceIsolationTest_case_009
     * @tc.desc source-isolation: verify actual DataSource storage contract; input vector 9.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SourceIsolationTest_case_009', 0, async () => {
      const source = makeSource("test.source-isolation.8", 31, "source-isolation:8");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(31);
      await assertSource(source, "test.source-isolation.8", 31, "source-isolation:8");
      const second = makeSource("test.source-isolation.8", 32, 'independent');
      const secondBefore = snapshotTitles(second);
      const card = new CardData(makeModel("test.source-isolation.8", makePayload("\u5361\u7247 2", "100%", 8)));
      source.addData(card);
      expect(source.totalCount()).assertEqual(32);
      expect(second.totalCount()).assertEqual(32);
      expect(snapshotTitles(second)).assertDeepEquals(secondBefore);
      expect(source.dataList === second.dataList).assertFalse();
      expect(second.getData(0) === card).assertFalse();
      second.addData(card);
      expect(second.totalCount()).assertEqual(33);
      expect(source.totalCount()).assertEqual(32);
      expect(source.getData(31) === second.getData(32)).assertTrue();
    });

    /**
     * @tc.name SourceIsolationTest_case_010
     * @tc.desc source-isolation: verify actual DataSource storage contract; input vector 10.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SourceIsolationTest_case_010', 0, async () => {
      const source = makeSource("test.source-isolation.9", 32, "source-isolation:9");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(32);
      await assertSource(source, "test.source-isolation.9", 32, "source-isolation:9");
      const second = makeSource("test.source-isolation.9", 33, 'independent');
      const secondBefore = snapshotTitles(second);
      const card = new CardData(makeModel("test.source-isolation.9", makePayload("\u5361\u7247 3", "0%", 9)));
      source.addData(card);
      expect(source.totalCount()).assertEqual(33);
      expect(second.totalCount()).assertEqual(33);
      expect(snapshotTitles(second)).assertDeepEquals(secondBefore);
      expect(source.dataList === second.dataList).assertFalse();
      expect(second.getData(0) === card).assertFalse();
      second.addData(card);
      expect(second.totalCount()).assertEqual(34);
      expect(source.totalCount()).assertEqual(33);
      expect(source.getData(32) === second.getData(33)).assertTrue();
    });

    /**
     * @tc.name SourceIsolationTest_case_011
     * @tc.desc source-isolation: verify actual DataSource storage contract; input vector 11.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SourceIsolationTest_case_011', 0, async () => {
      const source = makeSource("test.source-isolation.10", 63, "source-isolation:10");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(63);
      await assertSource(source, "test.source-isolation.10", 63, "source-isolation:10");
      const second = makeSource("test.source-isolation.10", 64, 'independent');
      const secondBefore = snapshotTitles(second);
      const card = new CardData(makeModel("test.source-isolation.10", makePayload("\u65e5\u672c\u8a9e", "50%", 10)));
      source.addData(card);
      expect(source.totalCount()).assertEqual(64);
      expect(second.totalCount()).assertEqual(64);
      expect(snapshotTitles(second)).assertDeepEquals(secondBefore);
      expect(source.dataList === second.dataList).assertFalse();
      expect(second.getData(0) === card).assertFalse();
      second.addData(card);
      expect(second.totalCount()).assertEqual(65);
      expect(source.totalCount()).assertEqual(64);
      expect(source.getData(63) === second.getData(64)).assertTrue();
    });

    /**
     * @tc.name SourceIsolationTest_case_012
     * @tc.desc source-isolation: verify actual DataSource storage contract; input vector 12.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SourceIsolationTest_case_012', 0, async () => {
      const source = makeSource("test.source-isolation.11", 64, "source-isolation:11");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(64);
      await assertSource(source, "test.source-isolation.11", 64, "source-isolation:11");
      const second = makeSource("test.source-isolation.11", 65, 'independent');
      const secondBefore = snapshotTitles(second);
      const card = new CardData(makeModel("test.source-isolation.11", makePayload("\u0645\u0631\u062d\u0628\u0627", "1%", 11)));
      source.addData(card);
      expect(source.totalCount()).assertEqual(65);
      expect(second.totalCount()).assertEqual(65);
      expect(snapshotTitles(second)).assertDeepEquals(secondBefore);
      expect(source.dataList === second.dataList).assertFalse();
      expect(second.getData(0) === card).assertFalse();
      second.addData(card);
      expect(second.totalCount()).assertEqual(66);
      expect(source.totalCount()).assertEqual(65);
      expect(source.getData(64) === second.getData(65)).assertTrue();
    });

    /**
     * @tc.name SourceIsolationTest_case_013
     * @tc.desc source-isolation: verify actual DataSource storage contract; input vector 13.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SourceIsolationTest_case_013', 0, async () => {
      const source = makeSource("test.source-isolation.12", 127, "source-isolation:12");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(127);
      await assertSource(source, "test.source-isolation.12", 127, "source-isolation:12");
      const second = makeSource("test.source-isolation.12", 128, 'independent');
      const secondBefore = snapshotTitles(second);
      const card = new CardData(makeModel("test.source-isolation.12", makePayload("\u05e9\u05dc\u05d5\u05dd", "99%", 12)));
      source.addData(card);
      expect(source.totalCount()).assertEqual(128);
      expect(second.totalCount()).assertEqual(128);
      expect(snapshotTitles(second)).assertDeepEquals(secondBefore);
      expect(source.dataList === second.dataList).assertFalse();
      expect(second.getData(0) === card).assertFalse();
      second.addData(card);
      expect(second.totalCount()).assertEqual(129);
      expect(source.totalCount()).assertEqual(128);
      expect(source.getData(127) === second.getData(128)).assertTrue();
    });

    /**
     * @tc.name SourceIsolationTest_case_014
     * @tc.desc source-isolation: verify actual DataSource storage contract; input vector 14.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SourceIsolationTest_case_014', 0, async () => {
      const source = makeSource("test.source-isolation.13", 0, "source-isolation:13");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(0);
      await assertSource(source, "test.source-isolation.13", 0, "source-isolation:13");
      const second = makeSource("test.source-isolation.13", 1, 'independent');
      const secondBefore = snapshotTitles(second);
      const card = new CardData(makeModel("test.source-isolation.13", makePayload("e\u0301", "75%", 13)));
      source.addData(card);
      expect(source.totalCount()).assertEqual(1);
      expect(second.totalCount()).assertEqual(1);
      expect(snapshotTitles(second)).assertDeepEquals(secondBefore);
      expect(source.dataList === second.dataList).assertFalse();
      expect(second.getData(0) === card).assertFalse();
      second.addData(card);
      expect(second.totalCount()).assertEqual(2);
      expect(source.totalCount()).assertEqual(1);
      expect(source.getData(0) === second.getData(1)).assertTrue();
    });

    /**
     * @tc.name SourceIsolationTest_case_015
     * @tc.desc source-isolation: verify actual DataSource storage contract; input vector 15.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SourceIsolationTest_case_015', 0, async () => {
      const source = makeSource("test.source-isolation.14", 1, "source-isolation:14");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(1);
      await assertSource(source, "test.source-isolation.14", 1, "source-isolation:14");
      const second = makeSource("test.source-isolation.14", 2, 'independent');
      const secondBefore = snapshotTitles(second);
      const card = new CardData(makeModel("test.source-isolation.14", makePayload("\u00e9", "", 14)));
      source.addData(card);
      expect(source.totalCount()).assertEqual(2);
      expect(second.totalCount()).assertEqual(2);
      expect(snapshotTitles(second)).assertDeepEquals(secondBefore);
      expect(source.dataList === second.dataList).assertFalse();
      expect(second.getData(0) === card).assertFalse();
      second.addData(card);
      expect(second.totalCount()).assertEqual(3);
      expect(source.totalCount()).assertEqual(2);
      expect(source.getData(1) === second.getData(2)).assertTrue();
    });

    /**
     * @tc.name SourceIsolationTest_case_016
     * @tc.desc source-isolation: verify actual DataSource storage contract; input vector 16.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SourceIsolationTest_case_016', 0, async () => {
      const source = makeSource("test.source-isolation.15", 2, "source-isolation:15");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(2);
      await assertSource(source, "test.source-isolation.15", 2, "source-isolation:15");
      const second = makeSource("test.source-isolation.15", 3, 'independent');
      const secondBefore = snapshotTitles(second);
      const card = new CardData(makeModel("test.source-isolation.15", makePayload("\ud83d\ude80", ":{{env(screen-width}}", 15)));
      source.addData(card);
      expect(source.totalCount()).assertEqual(3);
      expect(second.totalCount()).assertEqual(3);
      expect(snapshotTitles(second)).assertDeepEquals(secondBefore);
      expect(source.dataList === second.dataList).assertFalse();
      expect(second.getData(0) === card).assertFalse();
      second.addData(card);
      expect(second.totalCount()).assertEqual(4);
      expect(source.totalCount()).assertEqual(3);
      expect(source.getData(2) === second.getData(3)).assertTrue();
    });

    /**
     * @tc.name SourceIsolationTest_case_017
     * @tc.desc source-isolation: verify actual DataSource storage contract; input vector 17.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SourceIsolationTest_case_017', 0, async () => {
      const source = makeSource("test.source-isolation.16", 3, "source-isolation:16");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(3);
      await assertSource(source, "test.source-isolation.16", 3, "source-isolation:16");
      const second = makeSource("test.source-isolation.16", 4, 'independent');
      const secondBefore = snapshotTitles(second);
      const card = new CardData(makeModel("test.source-isolation.16", makePayload("quote\"slash\\", "100%", 16)));
      source.addData(card);
      expect(source.totalCount()).assertEqual(4);
      expect(second.totalCount()).assertEqual(4);
      expect(snapshotTitles(second)).assertDeepEquals(secondBefore);
      expect(source.dataList === second.dataList).assertFalse();
      expect(second.getData(0) === card).assertFalse();
      second.addData(card);
      expect(second.totalCount()).assertEqual(5);
      expect(source.totalCount()).assertEqual(4);
      expect(source.getData(3) === second.getData(4)).assertTrue();
    });

    /**
     * @tc.name SourceIsolationTest_case_018
     * @tc.desc source-isolation: verify actual DataSource storage contract; input vector 18.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SourceIsolationTest_case_018', 0, async () => {
      const source = makeSource("test.source-isolation.17", 7, "source-isolation:17");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(7);
      await assertSource(source, "test.source-isolation.17", 7, "source-isolation:17");
      const second = makeSource("test.source-isolation.17", 8, 'independent');
      const secondBefore = snapshotTitles(second);
      const card = new CardData(makeModel("test.source-isolation.17", makePayload("<script>alert(1)</script>", "0%", 17)));
      source.addData(card);
      expect(source.totalCount()).assertEqual(8);
      expect(second.totalCount()).assertEqual(8);
      expect(snapshotTitles(second)).assertDeepEquals(secondBefore);
      expect(source.dataList === second.dataList).assertFalse();
      expect(second.getData(0) === card).assertFalse();
      second.addData(card);
      expect(second.totalCount()).assertEqual(9);
      expect(source.totalCount()).assertEqual(8);
      expect(source.getData(7) === second.getData(8)).assertTrue();
    });

    /**
     * @tc.name SourceIsolationTest_case_019
     * @tc.desc source-isolation: verify actual DataSource storage contract; input vector 19.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SourceIsolationTest_case_019', 0, async () => {
      const source = makeSource("test.source-isolation.18", 8, "source-isolation:18");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(8);
      await assertSource(source, "test.source-isolation.18", 8, "source-isolation:18");
      const second = makeSource("test.source-isolation.18", 9, 'independent');
      const secondBefore = snapshotTitles(second);
      const card = new CardData(makeModel("test.source-isolation.18", makePayload("${notExecuted}", "50%", 18)));
      source.addData(card);
      expect(source.totalCount()).assertEqual(9);
      expect(second.totalCount()).assertEqual(9);
      expect(snapshotTitles(second)).assertDeepEquals(secondBefore);
      expect(source.dataList === second.dataList).assertFalse();
      expect(second.getData(0) === card).assertFalse();
      second.addData(card);
      expect(second.totalCount()).assertEqual(10);
      expect(source.totalCount()).assertEqual(9);
      expect(source.getData(8) === second.getData(9)).assertTrue();
    });

    /**
     * @tc.name SourceIsolationTest_case_020
     * @tc.desc source-isolation: verify actual DataSource storage contract; input vector 20.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SourceIsolationTest_case_020', 0, async () => {
      const source = makeSource("test.source-isolation.19", 15, "source-isolation:19");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(15);
      await assertSource(source, "test.source-isolation.19", 15, "source-isolation:19");
      const second = makeSource("test.source-isolation.19", 16, 'independent');
      const secondBefore = snapshotTitles(second);
      const card = new CardData(makeModel("test.source-isolation.19", makePayload("__proto__", "1%", 19)));
      source.addData(card);
      expect(source.totalCount()).assertEqual(16);
      expect(second.totalCount()).assertEqual(16);
      expect(snapshotTitles(second)).assertDeepEquals(secondBefore);
      expect(source.dataList === second.dataList).assertFalse();
      expect(second.getData(0) === card).assertFalse();
      second.addData(card);
      expect(second.totalCount()).assertEqual(17);
      expect(source.totalCount()).assertEqual(16);
      expect(source.getData(15) === second.getData(16)).assertTrue();
    });

    /**
     * @tc.name SourceIsolationTest_case_021
     * @tc.desc source-isolation: verify actual DataSource storage contract; input vector 21.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SourceIsolationTest_case_021', 0, async () => {
      const source = makeSource("test.source-isolation.20", 16, "source-isolation:20");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(16);
      await assertSource(source, "test.source-isolation.20", 16, "source-isolation:20");
      const second = makeSource("test.source-isolation.20", 17, 'independent');
      const secondBefore = snapshotTitles(second);
      const card = new CardData(makeModel("test.source-isolation.20", makePayload("constructor", "99%", 20)));
      source.addData(card);
      expect(source.totalCount()).assertEqual(17);
      expect(second.totalCount()).assertEqual(17);
      expect(snapshotTitles(second)).assertDeepEquals(secondBefore);
      expect(source.dataList === second.dataList).assertFalse();
      expect(second.getData(0) === card).assertFalse();
      second.addData(card);
      expect(second.totalCount()).assertEqual(18);
      expect(source.totalCount()).assertEqual(17);
      expect(source.getData(16) === second.getData(17)).assertTrue();
    });

    /**
     * @tc.name SourceIsolationTest_case_022
     * @tc.desc source-isolation: verify actual DataSource storage contract; input vector 22.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SourceIsolationTest_case_022', 0, async () => {
      const source = makeSource("test.source-isolation.21", 31, "source-isolation:21");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(31);
      await assertSource(source, "test.source-isolation.21", 31, "source-isolation:21");
      const second = makeSource("test.source-isolation.21", 32, 'independent');
      const secondBefore = snapshotTitles(second);
      const card = new CardData(makeModel("test.source-isolation.21", makePayload("null", "75%", 21)));
      source.addData(card);
      expect(source.totalCount()).assertEqual(32);
      expect(second.totalCount()).assertEqual(32);
      expect(snapshotTitles(second)).assertDeepEquals(secondBefore);
      expect(source.dataList === second.dataList).assertFalse();
      expect(second.getData(0) === card).assertFalse();
      second.addData(card);
      expect(second.totalCount()).assertEqual(33);
      expect(source.totalCount()).assertEqual(32);
      expect(source.getData(31) === second.getData(32)).assertTrue();
    });

    /**
     * @tc.name SourceIsolationTest_case_023
     * @tc.desc source-isolation: verify actual DataSource storage contract; input vector 23.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SourceIsolationTest_case_023', 0, async () => {
      const source = makeSource("test.source-isolation.22", 32, "source-isolation:22");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(32);
      await assertSource(source, "test.source-isolation.22", 32, "source-isolation:22");
      const second = makeSource("test.source-isolation.22", 33, 'independent');
      const secondBefore = snapshotTitles(second);
      const card = new CardData(makeModel("test.source-isolation.22", makePayload("false", "", 22)));
      source.addData(card);
      expect(source.totalCount()).assertEqual(33);
      expect(second.totalCount()).assertEqual(33);
      expect(snapshotTitles(second)).assertDeepEquals(secondBefore);
      expect(source.dataList === second.dataList).assertFalse();
      expect(second.getData(0) === card).assertFalse();
      second.addData(card);
      expect(second.totalCount()).assertEqual(34);
      expect(source.totalCount()).assertEqual(33);
      expect(source.getData(32) === second.getData(33)).assertTrue();
    });

    /**
     * @tc.name SourceIsolationTest_case_024
     * @tc.desc source-isolation: verify actual DataSource storage contract; input vector 24.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SourceIsolationTest_case_024', 0, async () => {
      const source = makeSource("test.source-isolation.23", 63, "source-isolation:23");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(63);
      await assertSource(source, "test.source-isolation.23", 63, "source-isolation:23");
      const second = makeSource("test.source-isolation.23", 64, 'independent');
      const secondBefore = snapshotTitles(second);
      const card = new CardData(makeModel("test.source-isolation.23", makePayload("0", ":{{env(screen-width}}", 23)));
      source.addData(card);
      expect(source.totalCount()).assertEqual(64);
      expect(second.totalCount()).assertEqual(64);
      expect(snapshotTitles(second)).assertDeepEquals(secondBefore);
      expect(source.dataList === second.dataList).assertFalse();
      expect(second.getData(0) === card).assertFalse();
      second.addData(card);
      expect(second.totalCount()).assertEqual(65);
      expect(source.totalCount()).assertEqual(64);
      expect(source.getData(63) === second.getData(64)).assertTrue();
    });

    /**
     * @tc.name SourceIsolationTest_case_025
     * @tc.desc source-isolation: verify actual DataSource storage contract; input vector 25.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SourceIsolationTest_case_025', 0, async () => {
      const source = makeSource("test.source-isolation.24", 64, "source-isolation:24");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(64);
      await assertSource(source, "test.source-isolation.24", 64, "source-isolation:24");
      const second = makeSource("test.source-isolation.24", 65, 'independent');
      const secondBefore = snapshotTitles(second);
      const card = new CardData(makeModel("test.source-isolation.24", makePayload("100%", "100%", 24)));
      source.addData(card);
      expect(source.totalCount()).assertEqual(65);
      expect(second.totalCount()).assertEqual(65);
      expect(snapshotTitles(second)).assertDeepEquals(secondBefore);
      expect(source.dataList === second.dataList).assertFalse();
      expect(second.getData(0) === card).assertFalse();
      second.addData(card);
      expect(second.totalCount()).assertEqual(66);
      expect(source.totalCount()).assertEqual(65);
      expect(source.getData(64) === second.getData(65)).assertTrue();
    });

    /**
     * @tc.name SourceIsolationTest_case_026
     * @tc.desc source-isolation: verify actual DataSource storage contract; input vector 26.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SourceIsolationTest_case_026', 0, async () => {
      const source = makeSource("test.source-isolation.25", 127, "source-isolation:25");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(127);
      await assertSource(source, "test.source-isolation.25", 127, "source-isolation:25");
      const second = makeSource("test.source-isolation.25", 128, 'independent');
      const secondBefore = snapshotTitles(second);
      const card = new CardData(makeModel("test.source-isolation.25", makePayload("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA", "0%", 25)));
      source.addData(card);
      expect(source.totalCount()).assertEqual(128);
      expect(second.totalCount()).assertEqual(128);
      expect(snapshotTitles(second)).assertDeepEquals(secondBefore);
      expect(source.dataList === second.dataList).assertFalse();
      expect(second.getData(0) === card).assertFalse();
      second.addData(card);
      expect(second.totalCount()).assertEqual(129);
      expect(source.totalCount()).assertEqual(128);
      expect(source.getData(127) === second.getData(128)).assertTrue();
    });

    /**
     * @tc.name SourceIsolationTest_case_027
     * @tc.desc source-isolation: verify actual DataSource storage contract; input vector 27.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SourceIsolationTest_case_027', 0, async () => {
      const source = makeSource("test.source-isolation.26", 0, "source-isolation:26");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(0);
      await assertSource(source, "test.source-isolation.26", 0, "source-isolation:26");
      const second = makeSource("test.source-isolation.26", 1, 'independent');
      const secondBefore = snapshotTitles(second);
      const card = new CardData(makeModel("test.source-isolation.26", makePayload("\u0000", "50%", 26)));
      source.addData(card);
      expect(source.totalCount()).assertEqual(1);
      expect(second.totalCount()).assertEqual(1);
      expect(snapshotTitles(second)).assertDeepEquals(secondBefore);
      expect(source.dataList === second.dataList).assertFalse();
      expect(second.getData(0) === card).assertFalse();
      second.addData(card);
      expect(second.totalCount()).assertEqual(2);
      expect(source.totalCount()).assertEqual(1);
      expect(source.getData(0) === second.getData(1)).assertTrue();
    });

    /**
     * @tc.name SourceIsolationTest_case_028
     * @tc.desc source-isolation: verify actual DataSource storage contract; input vector 28.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SourceIsolationTest_case_028', 0, async () => {
      const source = makeSource("test.source-isolation.27", 1, "source-isolation:27");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(1);
      await assertSource(source, "test.source-isolation.27", 1, "source-isolation:27");
      const second = makeSource("test.source-isolation.27", 2, 'independent');
      const secondBefore = snapshotTitles(second);
      const card = new CardData(makeModel("test.source-isolation.27", makePayload("\u2028", "1%", 27)));
      source.addData(card);
      expect(source.totalCount()).assertEqual(2);
      expect(second.totalCount()).assertEqual(2);
      expect(snapshotTitles(second)).assertDeepEquals(secondBefore);
      expect(source.dataList === second.dataList).assertFalse();
      expect(second.getData(0) === card).assertFalse();
      second.addData(card);
      expect(second.totalCount()).assertEqual(3);
      expect(source.totalCount()).assertEqual(2);
      expect(source.getData(1) === second.getData(2)).assertTrue();
    });

    /**
     * @tc.name SourceIsolationTest_case_029
     * @tc.desc source-isolation: verify actual DataSource storage contract; input vector 29.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SourceIsolationTest_case_029', 0, async () => {
      const source = makeSource("test.source-isolation.28", 2, "source-isolation:28");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(2);
      await assertSource(source, "test.source-isolation.28", 2, "source-isolation:28");
      const second = makeSource("test.source-isolation.28", 3, 'independent');
      const secondBefore = snapshotTitles(second);
      const card = new CardData(makeModel("test.source-isolation.28", makePayload("\u2029", "99%", 28)));
      source.addData(card);
      expect(source.totalCount()).assertEqual(3);
      expect(second.totalCount()).assertEqual(3);
      expect(snapshotTitles(second)).assertDeepEquals(secondBefore);
      expect(source.dataList === second.dataList).assertFalse();
      expect(second.getData(0) === card).assertFalse();
      second.addData(card);
      expect(second.totalCount()).assertEqual(4);
      expect(source.totalCount()).assertEqual(3);
      expect(source.getData(2) === second.getData(3)).assertTrue();
    });

    /**
     * @tc.name SourceIsolationTest_case_030
     * @tc.desc source-isolation: verify actual DataSource storage contract; input vector 30.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SourceIsolationTest_case_030', 0, async () => {
      const source = makeSource("test.source-isolation.29", 3, "source-isolation:29");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(3);
      await assertSource(source, "test.source-isolation.29", 3, "source-isolation:29");
      const second = makeSource("test.source-isolation.29", 4, 'independent');
      const secondBefore = snapshotTitles(second);
      const card = new CardData(makeModel("test.source-isolation.29", makePayload("\r\n", "75%", 29)));
      source.addData(card);
      expect(source.totalCount()).assertEqual(4);
      expect(second.totalCount()).assertEqual(4);
      expect(snapshotTitles(second)).assertDeepEquals(secondBefore);
      expect(source.dataList === second.dataList).assertFalse();
      expect(second.getData(0) === card).assertFalse();
      second.addData(card);
      expect(second.totalCount()).assertEqual(5);
      expect(source.totalCount()).assertEqual(4);
      expect(source.getData(3) === second.getData(4)).assertTrue();
    });

    /**
     * @tc.name SourceIsolationTest_case_031
     * @tc.desc source-isolation: verify actual DataSource storage contract; input vector 31.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SourceIsolationTest_case_031', 0, async () => {
      const source = makeSource("test.source-isolation.30", 7, "source-isolation:30");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(7);
      await assertSource(source, "test.source-isolation.30", 7, "source-isolation:30");
      const second = makeSource("test.source-isolation.30", 8, 'independent');
      const secondBefore = snapshotTitles(second);
      const card = new CardData(makeModel("test.source-isolation.30", makePayload("\ud83d\udc69\u200d\ud83d\udcbb", "", 30)));
      source.addData(card);
      expect(source.totalCount()).assertEqual(8);
      expect(second.totalCount()).assertEqual(8);
      expect(snapshotTitles(second)).assertDeepEquals(secondBefore);
      expect(source.dataList === second.dataList).assertFalse();
      expect(second.getData(0) === card).assertFalse();
      second.addData(card);
      expect(second.totalCount()).assertEqual(9);
      expect(source.totalCount()).assertEqual(8);
      expect(source.getData(7) === second.getData(8)).assertTrue();
    });

    /**
     * @tc.name SourceIsolationTest_case_032
     * @tc.desc source-isolation: verify actual DataSource storage contract; input vector 32.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SourceIsolationTest_case_032', 0, async () => {
      const source = makeSource("test.source-isolation.31", 8, "source-isolation:31");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(8);
      await assertSource(source, "test.source-isolation.31", 8, "source-isolation:31");
      const second = makeSource("test.source-isolation.31", 9, 'independent');
      const secondBefore = snapshotTitles(second);
      const card = new CardData(makeModel("test.source-isolation.31", makePayload("end.", ":{{env(screen-width}}", 31)));
      source.addData(card);
      expect(source.totalCount()).assertEqual(9);
      expect(second.totalCount()).assertEqual(9);
      expect(snapshotTitles(second)).assertDeepEquals(secondBefore);
      expect(source.dataList === second.dataList).assertFalse();
      expect(second.getData(0) === card).assertFalse();
      second.addData(card);
      expect(second.totalCount()).assertEqual(10);
      expect(source.totalCount()).assertEqual(9);
      expect(source.getData(8) === second.getData(9)).assertTrue();
    });

    /**
     * @tc.name SourceIsolationTest_case_033
     * @tc.desc source-isolation: verify actual DataSource storage contract; input vector 33.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SourceIsolationTest_case_033', 0, async () => {
      const source = makeSource("test.source-isolation.32", 15, "source-isolation:32");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(15);
      await assertSource(source, "test.source-isolation.32", 15, "source-isolation:32");
      const second = makeSource("test.source-isolation.32", 16, 'independent');
      const secondBefore = snapshotTitles(second);
      const card = new CardData(makeModel("test.source-isolation.32", makePayload("", "100%", 32)));
      source.addData(card);
      expect(source.totalCount()).assertEqual(16);
      expect(second.totalCount()).assertEqual(16);
      expect(snapshotTitles(second)).assertDeepEquals(secondBefore);
      expect(source.dataList === second.dataList).assertFalse();
      expect(second.getData(0) === card).assertFalse();
      second.addData(card);
      expect(second.totalCount()).assertEqual(17);
      expect(source.totalCount()).assertEqual(16);
      expect(source.getData(15) === second.getData(16)).assertTrue();
    });

    /**
     * @tc.name SourceIsolationTest_case_034
     * @tc.desc source-isolation: verify actual DataSource storage contract; input vector 34.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SourceIsolationTest_case_034', 0, async () => {
      const source = makeSource("test.source-isolation.33", 16, "source-isolation:33");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(16);
      await assertSource(source, "test.source-isolation.33", 16, "source-isolation:33");
      const second = makeSource("test.source-isolation.33", 17, 'independent');
      const secondBefore = snapshotTitles(second);
      const card = new CardData(makeModel("test.source-isolation.33", makePayload("Card", "0%", 33)));
      source.addData(card);
      expect(source.totalCount()).assertEqual(17);
      expect(second.totalCount()).assertEqual(17);
      expect(snapshotTitles(second)).assertDeepEquals(secondBefore);
      expect(source.dataList === second.dataList).assertFalse();
      expect(second.getData(0) === card).assertFalse();
      second.addData(card);
      expect(second.totalCount()).assertEqual(18);
      expect(source.totalCount()).assertEqual(17);
      expect(source.getData(16) === second.getData(17)).assertTrue();
    });

    /**
     * @tc.name SourceIsolationTest_case_035
     * @tc.desc source-isolation: verify actual DataSource storage contract; input vector 35.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SourceIsolationTest_case_035', 0, async () => {
      const source = makeSource("test.source-isolation.34", 31, "source-isolation:34");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(31);
      await assertSource(source, "test.source-isolation.34", 31, "source-isolation:34");
      const second = makeSource("test.source-isolation.34", 32, 'independent');
      const secondBefore = snapshotTitles(second);
      const card = new CardData(makeModel("test.source-isolation.34", makePayload(" ", "50%", 34)));
      source.addData(card);
      expect(source.totalCount()).assertEqual(32);
      expect(second.totalCount()).assertEqual(32);
      expect(snapshotTitles(second)).assertDeepEquals(secondBefore);
      expect(source.dataList === second.dataList).assertFalse();
      expect(second.getData(0) === card).assertFalse();
      second.addData(card);
      expect(second.totalCount()).assertEqual(33);
      expect(source.totalCount()).assertEqual(32);
      expect(source.getData(31) === second.getData(32)).assertTrue();
    });

    /**
     * @tc.name SourceIsolationTest_case_036
     * @tc.desc source-isolation: verify actual DataSource storage contract; input vector 36.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SourceIsolationTest_case_036', 0, async () => {
      const source = makeSource("test.source-isolation.35", 32, "source-isolation:35");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(32);
      await assertSource(source, "test.source-isolation.35", 32, "source-isolation:35");
      const second = makeSource("test.source-isolation.35", 33, 'independent');
      const secondBefore = snapshotTitles(second);
      const card = new CardData(makeModel("test.source-isolation.35", makePayload("  padded  ", "1%", 35)));
      source.addData(card);
      expect(source.totalCount()).assertEqual(33);
      expect(second.totalCount()).assertEqual(33);
      expect(snapshotTitles(second)).assertDeepEquals(secondBefore);
      expect(source.dataList === second.dataList).assertFalse();
      expect(second.getData(0) === card).assertFalse();
      second.addData(card);
      expect(second.totalCount()).assertEqual(34);
      expect(source.totalCount()).assertEqual(33);
      expect(source.getData(32) === second.getData(33)).assertTrue();
    });

    /**
     * @tc.name SourceIsolationTest_case_037
     * @tc.desc source-isolation: verify actual DataSource storage contract; input vector 37.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SourceIsolationTest_case_037', 0, async () => {
      const source = makeSource("test.source-isolation.36", 63, "source-isolation:36");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(63);
      await assertSource(source, "test.source-isolation.36", 63, "source-isolation:36");
      const second = makeSource("test.source-isolation.36", 64, 'independent');
      const secondBefore = snapshotTitles(second);
      const card = new CardData(makeModel("test.source-isolation.36", makePayload("multi word title", "99%", 36)));
      source.addData(card);
      expect(source.totalCount()).assertEqual(64);
      expect(second.totalCount()).assertEqual(64);
      expect(snapshotTitles(second)).assertDeepEquals(secondBefore);
      expect(source.dataList === second.dataList).assertFalse();
      expect(second.getData(0) === card).assertFalse();
      second.addData(card);
      expect(second.totalCount()).assertEqual(65);
      expect(source.totalCount()).assertEqual(64);
      expect(source.getData(63) === second.getData(64)).assertTrue();
    });
  });
}
