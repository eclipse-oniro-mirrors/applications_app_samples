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

// Reference: ets/test/LifecycleState/ResourceManagement.test.ets
// Original line floor: 379; scenario family: source-independent.
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

export default function IndependentSourcesTest(): void {
  describe('IndependentSourcesTest', () => {
    beforeAll(() => {
      logSuite('IndependentSourcesTest', 'begin');
    });
    beforeEach(async () => {
      // Yield between cases so device watchdog and UI events can be processed.
      await new Promise<void>((resolve) => { setTimeout(resolve, 1); });
    });
    afterAll(() => {
      logSuite('IndependentSourcesTest', 'end');
    });

    /**
     * @tc.name IndependentSourcesTest_case_001
     * @tc.desc source-independent: verify actual DataSource storage contract; input vector 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('IndependentSourcesTest_case_001', 0, async () => {
      const source = makeSource("test.source-independent.0", 0, "source-independent:0");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(0);
      await assertSource(source, "test.source-independent.0", 0, "source-independent:0");
      const second = makeSource("test.source-independent.0", 1, 'independent');
      const secondBefore = snapshotTitles(second);
      const card = new CardData(makeModel("test.source-independent.0", makePayload("", "100%", 0)));
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
     * @tc.name IndependentSourcesTest_case_002
     * @tc.desc source-independent: verify actual DataSource storage contract; input vector 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('IndependentSourcesTest_case_002', 0, async () => {
      const source = makeSource("test.source-independent.1", 1, "source-independent:1");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(1);
      await assertSource(source, "test.source-independent.1", 1, "source-independent:1");
      const second = makeSource("test.source-independent.1", 2, 'independent');
      const secondBefore = snapshotTitles(second);
      const card = new CardData(makeModel("test.source-independent.1", makePayload("Card", "0%", 1)));
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
     * @tc.name IndependentSourcesTest_case_003
     * @tc.desc source-independent: verify actual DataSource storage contract; input vector 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('IndependentSourcesTest_case_003', 0, async () => {
      const source = makeSource("test.source-independent.2", 2, "source-independent:2");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(2);
      await assertSource(source, "test.source-independent.2", 2, "source-independent:2");
      const second = makeSource("test.source-independent.2", 3, 'independent');
      const secondBefore = snapshotTitles(second);
      const card = new CardData(makeModel("test.source-independent.2", makePayload(" ", "50%", 2)));
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
     * @tc.name IndependentSourcesTest_case_004
     * @tc.desc source-independent: verify actual DataSource storage contract; input vector 4.
     * @tc.type Function
     * @tc.level Level1
     */
    it('IndependentSourcesTest_case_004', 0, async () => {
      const source = makeSource("test.source-independent.3", 3, "source-independent:3");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(3);
      await assertSource(source, "test.source-independent.3", 3, "source-independent:3");
      const second = makeSource("test.source-independent.3", 4, 'independent');
      const secondBefore = snapshotTitles(second);
      const card = new CardData(makeModel("test.source-independent.3", makePayload("  padded  ", "1%", 3)));
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
     * @tc.name IndependentSourcesTest_case_005
     * @tc.desc source-independent: verify actual DataSource storage contract; input vector 5.
     * @tc.type Function
     * @tc.level Level1
     */
    it('IndependentSourcesTest_case_005', 0, async () => {
      const source = makeSource("test.source-independent.4", 7, "source-independent:4");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(7);
      await assertSource(source, "test.source-independent.4", 7, "source-independent:4");
      const second = makeSource("test.source-independent.4", 8, 'independent');
      const secondBefore = snapshotTitles(second);
      const card = new CardData(makeModel("test.source-independent.4", makePayload("multi word title", "99%", 4)));
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
     * @tc.name IndependentSourcesTest_case_006
     * @tc.desc source-independent: verify actual DataSource storage contract; input vector 6.
     * @tc.type Function
     * @tc.level Level1
     */
    it('IndependentSourcesTest_case_006', 0, async () => {
      const source = makeSource("test.source-independent.5", 8, "source-independent:5");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(8);
      await assertSource(source, "test.source-independent.5", 8, "source-independent:5");
      const second = makeSource("test.source-independent.5", 9, 'independent');
      const secondBefore = snapshotTitles(second);
      const card = new CardData(makeModel("test.source-independent.5", makePayload("line\nbreak", "75%", 5)));
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
     * @tc.name IndependentSourcesTest_case_007
     * @tc.desc source-independent: verify actual DataSource storage contract; input vector 7.
     * @tc.type Function
     * @tc.level Level1
     */
    it('IndependentSourcesTest_case_007', 0, async () => {
      const source = makeSource("test.source-independent.6", 15, "source-independent:6");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(15);
      await assertSource(source, "test.source-independent.6", 15, "source-independent:6");
      const second = makeSource("test.source-independent.6", 16, 'independent');
      const secondBefore = snapshotTitles(second);
      const card = new CardData(makeModel("test.source-independent.6", makePayload("tab\tvalue", "", 6)));
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
     * @tc.name IndependentSourcesTest_case_008
     * @tc.desc source-independent: verify actual DataSource storage contract; input vector 8.
     * @tc.type Function
     * @tc.level Level1
     */
    it('IndependentSourcesTest_case_008', 0, async () => {
      const source = makeSource("test.source-independent.7", 16, "source-independent:7");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(16);
      await assertSource(source, "test.source-independent.7", 16, "source-independent:7");
      const second = makeSource("test.source-independent.7", 17, 'independent');
      const secondBefore = snapshotTitles(second);
      const card = new CardData(makeModel("test.source-independent.7", makePayload("\u5361\u7247 1", ":{{env(screen-width}}", 7)));
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
     * @tc.name IndependentSourcesTest_case_009
     * @tc.desc source-independent: verify actual DataSource storage contract; input vector 9.
     * @tc.type Function
     * @tc.level Level1
     */
    it('IndependentSourcesTest_case_009', 0, async () => {
      const source = makeSource("test.source-independent.8", 31, "source-independent:8");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(31);
      await assertSource(source, "test.source-independent.8", 31, "source-independent:8");
      const second = makeSource("test.source-independent.8", 32, 'independent');
      const secondBefore = snapshotTitles(second);
      const card = new CardData(makeModel("test.source-independent.8", makePayload("\u5361\u7247 2", "100%", 8)));
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
     * @tc.name IndependentSourcesTest_case_010
     * @tc.desc source-independent: verify actual DataSource storage contract; input vector 10.
     * @tc.type Function
     * @tc.level Level1
     */
    it('IndependentSourcesTest_case_010', 0, async () => {
      const source = makeSource("test.source-independent.9", 32, "source-independent:9");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(32);
      await assertSource(source, "test.source-independent.9", 32, "source-independent:9");
      const second = makeSource("test.source-independent.9", 33, 'independent');
      const secondBefore = snapshotTitles(second);
      const card = new CardData(makeModel("test.source-independent.9", makePayload("\u5361\u7247 3", "0%", 9)));
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
     * @tc.name IndependentSourcesTest_case_011
     * @tc.desc source-independent: verify actual DataSource storage contract; input vector 11.
     * @tc.type Function
     * @tc.level Level1
     */
    it('IndependentSourcesTest_case_011', 0, async () => {
      const source = makeSource("test.source-independent.10", 63, "source-independent:10");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(63);
      await assertSource(source, "test.source-independent.10", 63, "source-independent:10");
      const second = makeSource("test.source-independent.10", 64, 'independent');
      const secondBefore = snapshotTitles(second);
      const card = new CardData(makeModel("test.source-independent.10", makePayload("\u65e5\u672c\u8a9e", "50%", 10)));
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
     * @tc.name IndependentSourcesTest_case_012
     * @tc.desc source-independent: verify actual DataSource storage contract; input vector 12.
     * @tc.type Function
     * @tc.level Level1
     */
    it('IndependentSourcesTest_case_012', 0, async () => {
      const source = makeSource("test.source-independent.11", 64, "source-independent:11");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(64);
      await assertSource(source, "test.source-independent.11", 64, "source-independent:11");
      const second = makeSource("test.source-independent.11", 65, 'independent');
      const secondBefore = snapshotTitles(second);
      const card = new CardData(makeModel("test.source-independent.11", makePayload("\u0645\u0631\u062d\u0628\u0627", "1%", 11)));
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
     * @tc.name IndependentSourcesTest_case_013
     * @tc.desc source-independent: verify actual DataSource storage contract; input vector 13.
     * @tc.type Function
     * @tc.level Level1
     */
    it('IndependentSourcesTest_case_013', 0, async () => {
      const source = makeSource("test.source-independent.12", 127, "source-independent:12");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(127);
      await assertSource(source, "test.source-independent.12", 127, "source-independent:12");
      const second = makeSource("test.source-independent.12", 128, 'independent');
      const secondBefore = snapshotTitles(second);
      const card = new CardData(makeModel("test.source-independent.12", makePayload("\u05e9\u05dc\u05d5\u05dd", "99%", 12)));
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
  });
}
