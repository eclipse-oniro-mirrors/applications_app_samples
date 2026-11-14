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

// Reference: ets/test/Interaction/GestureRecognition.test.ets
// Original line floor: 861; scenario family: source-duplicate.
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

export default function RepeatedAppendTest(): void {
  describe('RepeatedAppendTest', () => {
    beforeAll(() => {
      logSuite('RepeatedAppendTest', 'begin');
    });
    beforeEach(async () => {
      // Yield between cases so device watchdog and UI events can be processed.
      await new Promise<void>((resolve) => { setTimeout(resolve, 1); });
    });
    afterAll(() => {
      logSuite('RepeatedAppendTest', 'end');
    });

    /**
     * @tc.name RepeatedAppendTest_case_001
     * @tc.desc source-duplicate: verify actual DataSource storage contract; input vector 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('RepeatedAppendTest_case_001', 0, async () => {
      const source = makeSource("test.source-duplicate.0", 0, "source-duplicate:0");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(0);
      await assertSource(source, "test.source-duplicate.0", 0, "source-duplicate:0");
      const card = new TextCardData(makeModel("test.source-duplicate.0", makePayload("", "100%", 0)));
      const id = card.getObjectId();
      for (let repeat = 0; repeat < 2; repeat++) {
        source.addData(card);
      }
      expect(source.totalCount()).assertEqual(2);
      for (let repeat = 0; repeat < 2; repeat++) {
        expect(source.getData(0 + repeat) === card).assertTrue();
        expect(source.getData(0 + repeat).getObjectId()).assertEqual(id);
      }
      expect(source.getData(2)).assertUndefined();
    });

    /**
     * @tc.name RepeatedAppendTest_case_002
     * @tc.desc source-duplicate: verify actual DataSource storage contract; input vector 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('RepeatedAppendTest_case_002', 0, async () => {
      const source = makeSource("test.source-duplicate.1", 1, "source-duplicate:1");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(1);
      await assertSource(source, "test.source-duplicate.1", 1, "source-duplicate:1");
      const card = new TextCardData(makeModel("test.source-duplicate.1", makePayload("Card", "0%", 1)));
      const id = card.getObjectId();
      for (let repeat = 0; repeat < 3; repeat++) {
        source.addData(card);
      }
      expect(source.totalCount()).assertEqual(4);
      for (let repeat = 0; repeat < 3; repeat++) {
        expect(source.getData(1 + repeat) === card).assertTrue();
        expect(source.getData(1 + repeat).getObjectId()).assertEqual(id);
      }
      expect(source.getData(4)).assertUndefined();
    });

    /**
     * @tc.name RepeatedAppendTest_case_003
     * @tc.desc source-duplicate: verify actual DataSource storage contract; input vector 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('RepeatedAppendTest_case_003', 0, async () => {
      const source = makeSource("test.source-duplicate.2", 2, "source-duplicate:2");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(2);
      await assertSource(source, "test.source-duplicate.2", 2, "source-duplicate:2");
      const card = new TextCardData(makeModel("test.source-duplicate.2", makePayload(" ", "50%", 2)));
      const id = card.getObjectId();
      for (let repeat = 0; repeat < 4; repeat++) {
        source.addData(card);
      }
      expect(source.totalCount()).assertEqual(6);
      for (let repeat = 0; repeat < 4; repeat++) {
        expect(source.getData(2 + repeat) === card).assertTrue();
        expect(source.getData(2 + repeat).getObjectId()).assertEqual(id);
      }
      expect(source.getData(6)).assertUndefined();
    });

    /**
     * @tc.name RepeatedAppendTest_case_004
     * @tc.desc source-duplicate: verify actual DataSource storage contract; input vector 4.
     * @tc.type Function
     * @tc.level Level1
     */
    it('RepeatedAppendTest_case_004', 0, async () => {
      const source = makeSource("test.source-duplicate.3", 3, "source-duplicate:3");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(3);
      await assertSource(source, "test.source-duplicate.3", 3, "source-duplicate:3");
      const card = new TextCardData(makeModel("test.source-duplicate.3", makePayload("  padded  ", "1%", 3)));
      const id = card.getObjectId();
      for (let repeat = 0; repeat < 5; repeat++) {
        source.addData(card);
      }
      expect(source.totalCount()).assertEqual(8);
      for (let repeat = 0; repeat < 5; repeat++) {
        expect(source.getData(3 + repeat) === card).assertTrue();
        expect(source.getData(3 + repeat).getObjectId()).assertEqual(id);
      }
      expect(source.getData(8)).assertUndefined();
    });

    /**
     * @tc.name RepeatedAppendTest_case_005
     * @tc.desc source-duplicate: verify actual DataSource storage contract; input vector 5.
     * @tc.type Function
     * @tc.level Level1
     */
    it('RepeatedAppendTest_case_005', 0, async () => {
      const source = makeSource("test.source-duplicate.4", 7, "source-duplicate:4");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(7);
      await assertSource(source, "test.source-duplicate.4", 7, "source-duplicate:4");
      const card = new TextCardData(makeModel("test.source-duplicate.4", makePayload("multi word title", "99%", 4)));
      const id = card.getObjectId();
      for (let repeat = 0; repeat < 2; repeat++) {
        source.addData(card);
      }
      expect(source.totalCount()).assertEqual(9);
      for (let repeat = 0; repeat < 2; repeat++) {
        expect(source.getData(7 + repeat) === card).assertTrue();
        expect(source.getData(7 + repeat).getObjectId()).assertEqual(id);
      }
      expect(source.getData(9)).assertUndefined();
    });

    /**
     * @tc.name RepeatedAppendTest_case_006
     * @tc.desc source-duplicate: verify actual DataSource storage contract; input vector 6.
     * @tc.type Function
     * @tc.level Level1
     */
    it('RepeatedAppendTest_case_006', 0, async () => {
      const source = makeSource("test.source-duplicate.5", 8, "source-duplicate:5");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(8);
      await assertSource(source, "test.source-duplicate.5", 8, "source-duplicate:5");
      const card = new TextCardData(makeModel("test.source-duplicate.5", makePayload("line\nbreak", "75%", 5)));
      const id = card.getObjectId();
      for (let repeat = 0; repeat < 3; repeat++) {
        source.addData(card);
      }
      expect(source.totalCount()).assertEqual(11);
      for (let repeat = 0; repeat < 3; repeat++) {
        expect(source.getData(8 + repeat) === card).assertTrue();
        expect(source.getData(8 + repeat).getObjectId()).assertEqual(id);
      }
      expect(source.getData(11)).assertUndefined();
    });

    /**
     * @tc.name RepeatedAppendTest_case_007
     * @tc.desc source-duplicate: verify actual DataSource storage contract; input vector 7.
     * @tc.type Function
     * @tc.level Level1
     */
    it('RepeatedAppendTest_case_007', 0, async () => {
      const source = makeSource("test.source-duplicate.6", 15, "source-duplicate:6");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(15);
      await assertSource(source, "test.source-duplicate.6", 15, "source-duplicate:6");
      const card = new TextCardData(makeModel("test.source-duplicate.6", makePayload("tab\tvalue", "", 6)));
      const id = card.getObjectId();
      for (let repeat = 0; repeat < 4; repeat++) {
        source.addData(card);
      }
      expect(source.totalCount()).assertEqual(19);
      for (let repeat = 0; repeat < 4; repeat++) {
        expect(source.getData(15 + repeat) === card).assertTrue();
        expect(source.getData(15 + repeat).getObjectId()).assertEqual(id);
      }
      expect(source.getData(19)).assertUndefined();
    });

    /**
     * @tc.name RepeatedAppendTest_case_008
     * @tc.desc source-duplicate: verify actual DataSource storage contract; input vector 8.
     * @tc.type Function
     * @tc.level Level1
     */
    it('RepeatedAppendTest_case_008', 0, async () => {
      const source = makeSource("test.source-duplicate.7", 16, "source-duplicate:7");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(16);
      await assertSource(source, "test.source-duplicate.7", 16, "source-duplicate:7");
      const card = new TextCardData(makeModel("test.source-duplicate.7", makePayload("\u5361\u7247 1", ":{{env(screen-width}}", 7)));
      const id = card.getObjectId();
      for (let repeat = 0; repeat < 5; repeat++) {
        source.addData(card);
      }
      expect(source.totalCount()).assertEqual(21);
      for (let repeat = 0; repeat < 5; repeat++) {
        expect(source.getData(16 + repeat) === card).assertTrue();
        expect(source.getData(16 + repeat).getObjectId()).assertEqual(id);
      }
      expect(source.getData(21)).assertUndefined();
    });

    /**
     * @tc.name RepeatedAppendTest_case_009
     * @tc.desc source-duplicate: verify actual DataSource storage contract; input vector 9.
     * @tc.type Function
     * @tc.level Level1
     */
    it('RepeatedAppendTest_case_009', 0, async () => {
      const source = makeSource("test.source-duplicate.8", 31, "source-duplicate:8");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(31);
      await assertSource(source, "test.source-duplicate.8", 31, "source-duplicate:8");
      const card = new TextCardData(makeModel("test.source-duplicate.8", makePayload("\u5361\u7247 2", "100%", 8)));
      const id = card.getObjectId();
      for (let repeat = 0; repeat < 2; repeat++) {
        source.addData(card);
      }
      expect(source.totalCount()).assertEqual(33);
      for (let repeat = 0; repeat < 2; repeat++) {
        expect(source.getData(31 + repeat) === card).assertTrue();
        expect(source.getData(31 + repeat).getObjectId()).assertEqual(id);
      }
      expect(source.getData(33)).assertUndefined();
    });

    /**
     * @tc.name RepeatedAppendTest_case_010
     * @tc.desc source-duplicate: verify actual DataSource storage contract; input vector 10.
     * @tc.type Function
     * @tc.level Level1
     */
    it('RepeatedAppendTest_case_010', 0, async () => {
      const source = makeSource("test.source-duplicate.9", 32, "source-duplicate:9");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(32);
      await assertSource(source, "test.source-duplicate.9", 32, "source-duplicate:9");
      const card = new TextCardData(makeModel("test.source-duplicate.9", makePayload("\u5361\u7247 3", "0%", 9)));
      const id = card.getObjectId();
      for (let repeat = 0; repeat < 3; repeat++) {
        source.addData(card);
      }
      expect(source.totalCount()).assertEqual(35);
      for (let repeat = 0; repeat < 3; repeat++) {
        expect(source.getData(32 + repeat) === card).assertTrue();
        expect(source.getData(32 + repeat).getObjectId()).assertEqual(id);
      }
      expect(source.getData(35)).assertUndefined();
    });

    /**
     * @tc.name RepeatedAppendTest_case_011
     * @tc.desc source-duplicate: verify actual DataSource storage contract; input vector 11.
     * @tc.type Function
     * @tc.level Level1
     */
    it('RepeatedAppendTest_case_011', 0, async () => {
      const source = makeSource("test.source-duplicate.10", 63, "source-duplicate:10");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(63);
      await assertSource(source, "test.source-duplicate.10", 63, "source-duplicate:10");
      const card = new TextCardData(makeModel("test.source-duplicate.10", makePayload("\u65e5\u672c\u8a9e", "50%", 10)));
      const id = card.getObjectId();
      for (let repeat = 0; repeat < 4; repeat++) {
        source.addData(card);
      }
      expect(source.totalCount()).assertEqual(67);
      for (let repeat = 0; repeat < 4; repeat++) {
        expect(source.getData(63 + repeat) === card).assertTrue();
        expect(source.getData(63 + repeat).getObjectId()).assertEqual(id);
      }
      expect(source.getData(67)).assertUndefined();
    });

    /**
     * @tc.name RepeatedAppendTest_case_012
     * @tc.desc source-duplicate: verify actual DataSource storage contract; input vector 12.
     * @tc.type Function
     * @tc.level Level1
     */
    it('RepeatedAppendTest_case_012', 0, async () => {
      const source = makeSource("test.source-duplicate.11", 64, "source-duplicate:11");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(64);
      await assertSource(source, "test.source-duplicate.11", 64, "source-duplicate:11");
      const card = new TextCardData(makeModel("test.source-duplicate.11", makePayload("\u0645\u0631\u062d\u0628\u0627", "1%", 11)));
      const id = card.getObjectId();
      for (let repeat = 0; repeat < 5; repeat++) {
        source.addData(card);
      }
      expect(source.totalCount()).assertEqual(69);
      for (let repeat = 0; repeat < 5; repeat++) {
        expect(source.getData(64 + repeat) === card).assertTrue();
        expect(source.getData(64 + repeat).getObjectId()).assertEqual(id);
      }
      expect(source.getData(69)).assertUndefined();
    });

    /**
     * @tc.name RepeatedAppendTest_case_013
     * @tc.desc source-duplicate: verify actual DataSource storage contract; input vector 13.
     * @tc.type Function
     * @tc.level Level1
     */
    it('RepeatedAppendTest_case_013', 0, async () => {
      const source = makeSource("test.source-duplicate.12", 127, "source-duplicate:12");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(127);
      await assertSource(source, "test.source-duplicate.12", 127, "source-duplicate:12");
      const card = new TextCardData(makeModel("test.source-duplicate.12", makePayload("\u05e9\u05dc\u05d5\u05dd", "99%", 12)));
      const id = card.getObjectId();
      for (let repeat = 0; repeat < 2; repeat++) {
        source.addData(card);
      }
      expect(source.totalCount()).assertEqual(129);
      for (let repeat = 0; repeat < 2; repeat++) {
        expect(source.getData(127 + repeat) === card).assertTrue();
        expect(source.getData(127 + repeat).getObjectId()).assertEqual(id);
      }
      expect(source.getData(129)).assertUndefined();
    });

    /**
     * @tc.name RepeatedAppendTest_case_014
     * @tc.desc source-duplicate: verify actual DataSource storage contract; input vector 14.
     * @tc.type Function
     * @tc.level Level1
     */
    it('RepeatedAppendTest_case_014', 0, async () => {
      const source = makeSource("test.source-duplicate.13", 0, "source-duplicate:13");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(0);
      await assertSource(source, "test.source-duplicate.13", 0, "source-duplicate:13");
      const card = new TextCardData(makeModel("test.source-duplicate.13", makePayload("e\u0301", "75%", 13)));
      const id = card.getObjectId();
      for (let repeat = 0; repeat < 3; repeat++) {
        source.addData(card);
      }
      expect(source.totalCount()).assertEqual(3);
      for (let repeat = 0; repeat < 3; repeat++) {
        expect(source.getData(0 + repeat) === card).assertTrue();
        expect(source.getData(0 + repeat).getObjectId()).assertEqual(id);
      }
      expect(source.getData(3)).assertUndefined();
    });

    /**
     * @tc.name RepeatedAppendTest_case_015
     * @tc.desc source-duplicate: verify actual DataSource storage contract; input vector 15.
     * @tc.type Function
     * @tc.level Level1
     */
    it('RepeatedAppendTest_case_015', 0, async () => {
      const source = makeSource("test.source-duplicate.14", 1, "source-duplicate:14");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(1);
      await assertSource(source, "test.source-duplicate.14", 1, "source-duplicate:14");
      const card = new TextCardData(makeModel("test.source-duplicate.14", makePayload("\u00e9", "", 14)));
      const id = card.getObjectId();
      for (let repeat = 0; repeat < 4; repeat++) {
        source.addData(card);
      }
      expect(source.totalCount()).assertEqual(5);
      for (let repeat = 0; repeat < 4; repeat++) {
        expect(source.getData(1 + repeat) === card).assertTrue();
        expect(source.getData(1 + repeat).getObjectId()).assertEqual(id);
      }
      expect(source.getData(5)).assertUndefined();
    });

    /**
     * @tc.name RepeatedAppendTest_case_016
     * @tc.desc source-duplicate: verify actual DataSource storage contract; input vector 16.
     * @tc.type Function
     * @tc.level Level1
     */
    it('RepeatedAppendTest_case_016', 0, async () => {
      const source = makeSource("test.source-duplicate.15", 2, "source-duplicate:15");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(2);
      await assertSource(source, "test.source-duplicate.15", 2, "source-duplicate:15");
      const card = new TextCardData(makeModel("test.source-duplicate.15", makePayload("\ud83d\ude80", ":{{env(screen-width}}", 15)));
      const id = card.getObjectId();
      for (let repeat = 0; repeat < 5; repeat++) {
        source.addData(card);
      }
      expect(source.totalCount()).assertEqual(7);
      for (let repeat = 0; repeat < 5; repeat++) {
        expect(source.getData(2 + repeat) === card).assertTrue();
        expect(source.getData(2 + repeat).getObjectId()).assertEqual(id);
      }
      expect(source.getData(7)).assertUndefined();
    });

    /**
     * @tc.name RepeatedAppendTest_case_017
     * @tc.desc source-duplicate: verify actual DataSource storage contract; input vector 17.
     * @tc.type Function
     * @tc.level Level1
     */
    it('RepeatedAppendTest_case_017', 0, async () => {
      const source = makeSource("test.source-duplicate.16", 3, "source-duplicate:16");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(3);
      await assertSource(source, "test.source-duplicate.16", 3, "source-duplicate:16");
      const card = new TextCardData(makeModel("test.source-duplicate.16", makePayload("quote\"slash\\", "100%", 16)));
      const id = card.getObjectId();
      for (let repeat = 0; repeat < 2; repeat++) {
        source.addData(card);
      }
      expect(source.totalCount()).assertEqual(5);
      for (let repeat = 0; repeat < 2; repeat++) {
        expect(source.getData(3 + repeat) === card).assertTrue();
        expect(source.getData(3 + repeat).getObjectId()).assertEqual(id);
      }
      expect(source.getData(5)).assertUndefined();
    });

    /**
     * @tc.name RepeatedAppendTest_case_018
     * @tc.desc source-duplicate: verify actual DataSource storage contract; input vector 18.
     * @tc.type Function
     * @tc.level Level1
     */
    it('RepeatedAppendTest_case_018', 0, async () => {
      const source = makeSource("test.source-duplicate.17", 7, "source-duplicate:17");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(7);
      await assertSource(source, "test.source-duplicate.17", 7, "source-duplicate:17");
      const card = new TextCardData(makeModel("test.source-duplicate.17", makePayload("<script>alert(1)</script>", "0%", 17)));
      const id = card.getObjectId();
      for (let repeat = 0; repeat < 3; repeat++) {
        source.addData(card);
      }
      expect(source.totalCount()).assertEqual(10);
      for (let repeat = 0; repeat < 3; repeat++) {
        expect(source.getData(7 + repeat) === card).assertTrue();
        expect(source.getData(7 + repeat).getObjectId()).assertEqual(id);
      }
      expect(source.getData(10)).assertUndefined();
    });

    /**
     * @tc.name RepeatedAppendTest_case_019
     * @tc.desc source-duplicate: verify actual DataSource storage contract; input vector 19.
     * @tc.type Function
     * @tc.level Level1
     */
    it('RepeatedAppendTest_case_019', 0, async () => {
      const source = makeSource("test.source-duplicate.18", 8, "source-duplicate:18");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(8);
      await assertSource(source, "test.source-duplicate.18", 8, "source-duplicate:18");
      const card = new TextCardData(makeModel("test.source-duplicate.18", makePayload("${notExecuted}", "50%", 18)));
      const id = card.getObjectId();
      for (let repeat = 0; repeat < 4; repeat++) {
        source.addData(card);
      }
      expect(source.totalCount()).assertEqual(12);
      for (let repeat = 0; repeat < 4; repeat++) {
        expect(source.getData(8 + repeat) === card).assertTrue();
        expect(source.getData(8 + repeat).getObjectId()).assertEqual(id);
      }
      expect(source.getData(12)).assertUndefined();
    });

    /**
     * @tc.name RepeatedAppendTest_case_020
     * @tc.desc source-duplicate: verify actual DataSource storage contract; input vector 20.
     * @tc.type Function
     * @tc.level Level1
     */
    it('RepeatedAppendTest_case_020', 0, async () => {
      const source = makeSource("test.source-duplicate.19", 15, "source-duplicate:19");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(15);
      await assertSource(source, "test.source-duplicate.19", 15, "source-duplicate:19");
      const card = new TextCardData(makeModel("test.source-duplicate.19", makePayload("__proto__", "1%", 19)));
      const id = card.getObjectId();
      for (let repeat = 0; repeat < 5; repeat++) {
        source.addData(card);
      }
      expect(source.totalCount()).assertEqual(20);
      for (let repeat = 0; repeat < 5; repeat++) {
        expect(source.getData(15 + repeat) === card).assertTrue();
        expect(source.getData(15 + repeat).getObjectId()).assertEqual(id);
      }
      expect(source.getData(20)).assertUndefined();
    });

    /**
     * @tc.name RepeatedAppendTest_case_021
     * @tc.desc source-duplicate: verify actual DataSource storage contract; input vector 21.
     * @tc.type Function
     * @tc.level Level1
     */
    it('RepeatedAppendTest_case_021', 0, async () => {
      const source = makeSource("test.source-duplicate.20", 16, "source-duplicate:20");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(16);
      await assertSource(source, "test.source-duplicate.20", 16, "source-duplicate:20");
      const card = new TextCardData(makeModel("test.source-duplicate.20", makePayload("constructor", "99%", 20)));
      const id = card.getObjectId();
      for (let repeat = 0; repeat < 2; repeat++) {
        source.addData(card);
      }
      expect(source.totalCount()).assertEqual(18);
      for (let repeat = 0; repeat < 2; repeat++) {
        expect(source.getData(16 + repeat) === card).assertTrue();
        expect(source.getData(16 + repeat).getObjectId()).assertEqual(id);
      }
      expect(source.getData(18)).assertUndefined();
    });

    /**
     * @tc.name RepeatedAppendTest_case_022
     * @tc.desc source-duplicate: verify actual DataSource storage contract; input vector 22.
     * @tc.type Function
     * @tc.level Level1
     */
    it('RepeatedAppendTest_case_022', 0, async () => {
      const source = makeSource("test.source-duplicate.21", 31, "source-duplicate:21");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(31);
      await assertSource(source, "test.source-duplicate.21", 31, "source-duplicate:21");
      const card = new TextCardData(makeModel("test.source-duplicate.21", makePayload("null", "75%", 21)));
      const id = card.getObjectId();
      for (let repeat = 0; repeat < 3; repeat++) {
        source.addData(card);
      }
      expect(source.totalCount()).assertEqual(34);
      for (let repeat = 0; repeat < 3; repeat++) {
        expect(source.getData(31 + repeat) === card).assertTrue();
        expect(source.getData(31 + repeat).getObjectId()).assertEqual(id);
      }
      expect(source.getData(34)).assertUndefined();
    });

    /**
     * @tc.name RepeatedAppendTest_case_023
     * @tc.desc source-duplicate: verify actual DataSource storage contract; input vector 23.
     * @tc.type Function
     * @tc.level Level1
     */
    it('RepeatedAppendTest_case_023', 0, async () => {
      const source = makeSource("test.source-duplicate.22", 32, "source-duplicate:22");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(32);
      await assertSource(source, "test.source-duplicate.22", 32, "source-duplicate:22");
      const card = new TextCardData(makeModel("test.source-duplicate.22", makePayload("false", "", 22)));
      const id = card.getObjectId();
      for (let repeat = 0; repeat < 4; repeat++) {
        source.addData(card);
      }
      expect(source.totalCount()).assertEqual(36);
      for (let repeat = 0; repeat < 4; repeat++) {
        expect(source.getData(32 + repeat) === card).assertTrue();
        expect(source.getData(32 + repeat).getObjectId()).assertEqual(id);
      }
      expect(source.getData(36)).assertUndefined();
    });

    /**
     * @tc.name RepeatedAppendTest_case_024
     * @tc.desc source-duplicate: verify actual DataSource storage contract; input vector 24.
     * @tc.type Function
     * @tc.level Level1
     */
    it('RepeatedAppendTest_case_024', 0, async () => {
      const source = makeSource("test.source-duplicate.23", 63, "source-duplicate:23");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(63);
      await assertSource(source, "test.source-duplicate.23", 63, "source-duplicate:23");
      const card = new TextCardData(makeModel("test.source-duplicate.23", makePayload("0", ":{{env(screen-width}}", 23)));
      const id = card.getObjectId();
      for (let repeat = 0; repeat < 5; repeat++) {
        source.addData(card);
      }
      expect(source.totalCount()).assertEqual(68);
      for (let repeat = 0; repeat < 5; repeat++) {
        expect(source.getData(63 + repeat) === card).assertTrue();
        expect(source.getData(63 + repeat).getObjectId()).assertEqual(id);
      }
      expect(source.getData(68)).assertUndefined();
    });

    /**
     * @tc.name RepeatedAppendTest_case_025
     * @tc.desc source-duplicate: verify actual DataSource storage contract; input vector 25.
     * @tc.type Function
     * @tc.level Level1
     */
    it('RepeatedAppendTest_case_025', 0, async () => {
      const source = makeSource("test.source-duplicate.24", 64, "source-duplicate:24");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(64);
      await assertSource(source, "test.source-duplicate.24", 64, "source-duplicate:24");
      const card = new TextCardData(makeModel("test.source-duplicate.24", makePayload("100%", "100%", 24)));
      const id = card.getObjectId();
      for (let repeat = 0; repeat < 2; repeat++) {
        source.addData(card);
      }
      expect(source.totalCount()).assertEqual(66);
      for (let repeat = 0; repeat < 2; repeat++) {
        expect(source.getData(64 + repeat) === card).assertTrue();
        expect(source.getData(64 + repeat).getObjectId()).assertEqual(id);
      }
      expect(source.getData(66)).assertUndefined();
    });

    /**
     * @tc.name RepeatedAppendTest_case_026
     * @tc.desc source-duplicate: verify actual DataSource storage contract; input vector 26.
     * @tc.type Function
     * @tc.level Level1
     */
    it('RepeatedAppendTest_case_026', 0, async () => {
      const source = makeSource("test.source-duplicate.25", 127, "source-duplicate:25");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(127);
      await assertSource(source, "test.source-duplicate.25", 127, "source-duplicate:25");
      const card = new TextCardData(makeModel("test.source-duplicate.25", makePayload("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA", "0%", 25)));
      const id = card.getObjectId();
      for (let repeat = 0; repeat < 3; repeat++) {
        source.addData(card);
      }
      expect(source.totalCount()).assertEqual(130);
      for (let repeat = 0; repeat < 3; repeat++) {
        expect(source.getData(127 + repeat) === card).assertTrue();
        expect(source.getData(127 + repeat).getObjectId()).assertEqual(id);
      }
      expect(source.getData(130)).assertUndefined();
    });

    /**
     * @tc.name RepeatedAppendTest_case_027
     * @tc.desc source-duplicate: verify actual DataSource storage contract; input vector 27.
     * @tc.type Function
     * @tc.level Level1
     */
    it('RepeatedAppendTest_case_027', 0, async () => {
      const source = makeSource("test.source-duplicate.26", 0, "source-duplicate:26");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(0);
      await assertSource(source, "test.source-duplicate.26", 0, "source-duplicate:26");
      const card = new TextCardData(makeModel("test.source-duplicate.26", makePayload("\u0000", "50%", 26)));
      const id = card.getObjectId();
      for (let repeat = 0; repeat < 4; repeat++) {
        source.addData(card);
      }
      expect(source.totalCount()).assertEqual(4);
      for (let repeat = 0; repeat < 4; repeat++) {
        expect(source.getData(0 + repeat) === card).assertTrue();
        expect(source.getData(0 + repeat).getObjectId()).assertEqual(id);
      }
      expect(source.getData(4)).assertUndefined();
    });

    /**
     * @tc.name RepeatedAppendTest_case_028
     * @tc.desc source-duplicate: verify actual DataSource storage contract; input vector 28.
     * @tc.type Function
     * @tc.level Level1
     */
    it('RepeatedAppendTest_case_028', 0, async () => {
      const source = makeSource("test.source-duplicate.27", 1, "source-duplicate:27");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(1);
      await assertSource(source, "test.source-duplicate.27", 1, "source-duplicate:27");
      const card = new TextCardData(makeModel("test.source-duplicate.27", makePayload("\u2028", "1%", 27)));
      const id = card.getObjectId();
      for (let repeat = 0; repeat < 5; repeat++) {
        source.addData(card);
      }
      expect(source.totalCount()).assertEqual(6);
      for (let repeat = 0; repeat < 5; repeat++) {
        expect(source.getData(1 + repeat) === card).assertTrue();
        expect(source.getData(1 + repeat).getObjectId()).assertEqual(id);
      }
      expect(source.getData(6)).assertUndefined();
    });

    /**
     * @tc.name RepeatedAppendTest_case_029
     * @tc.desc source-duplicate: verify actual DataSource storage contract; input vector 29.
     * @tc.type Function
     * @tc.level Level1
     */
    it('RepeatedAppendTest_case_029', 0, async () => {
      const source = makeSource("test.source-duplicate.28", 2, "source-duplicate:28");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(2);
      await assertSource(source, "test.source-duplicate.28", 2, "source-duplicate:28");
      const card = new TextCardData(makeModel("test.source-duplicate.28", makePayload("\u2029", "99%", 28)));
      const id = card.getObjectId();
      for (let repeat = 0; repeat < 2; repeat++) {
        source.addData(card);
      }
      expect(source.totalCount()).assertEqual(4);
      for (let repeat = 0; repeat < 2; repeat++) {
        expect(source.getData(2 + repeat) === card).assertTrue();
        expect(source.getData(2 + repeat).getObjectId()).assertEqual(id);
      }
      expect(source.getData(4)).assertUndefined();
    });

    /**
     * @tc.name RepeatedAppendTest_case_030
     * @tc.desc source-duplicate: verify actual DataSource storage contract; input vector 30.
     * @tc.type Function
     * @tc.level Level1
     */
    it('RepeatedAppendTest_case_030', 0, async () => {
      const source = makeSource("test.source-duplicate.29", 3, "source-duplicate:29");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(3);
      await assertSource(source, "test.source-duplicate.29", 3, "source-duplicate:29");
      const card = new TextCardData(makeModel("test.source-duplicate.29", makePayload("\r\n", "75%", 29)));
      const id = card.getObjectId();
      for (let repeat = 0; repeat < 3; repeat++) {
        source.addData(card);
      }
      expect(source.totalCount()).assertEqual(6);
      for (let repeat = 0; repeat < 3; repeat++) {
        expect(source.getData(3 + repeat) === card).assertTrue();
        expect(source.getData(3 + repeat).getObjectId()).assertEqual(id);
      }
      expect(source.getData(6)).assertUndefined();
    });

    /**
     * @tc.name RepeatedAppendTest_case_031
     * @tc.desc source-duplicate: verify actual DataSource storage contract; input vector 31.
     * @tc.type Function
     * @tc.level Level1
     */
    it('RepeatedAppendTest_case_031', 0, async () => {
      const source = makeSource("test.source-duplicate.30", 7, "source-duplicate:30");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(7);
      await assertSource(source, "test.source-duplicate.30", 7, "source-duplicate:30");
      const card = new TextCardData(makeModel("test.source-duplicate.30", makePayload("\ud83d\udc69\u200d\ud83d\udcbb", "", 30)));
      const id = card.getObjectId();
      for (let repeat = 0; repeat < 4; repeat++) {
        source.addData(card);
      }
      expect(source.totalCount()).assertEqual(11);
      for (let repeat = 0; repeat < 4; repeat++) {
        expect(source.getData(7 + repeat) === card).assertTrue();
        expect(source.getData(7 + repeat).getObjectId()).assertEqual(id);
      }
      expect(source.getData(11)).assertUndefined();
    });

    /**
     * @tc.name RepeatedAppendTest_case_032
     * @tc.desc source-duplicate: verify actual DataSource storage contract; input vector 32.
     * @tc.type Function
     * @tc.level Level1
     */
    it('RepeatedAppendTest_case_032', 0, async () => {
      const source = makeSource("test.source-duplicate.31", 8, "source-duplicate:31");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(8);
      await assertSource(source, "test.source-duplicate.31", 8, "source-duplicate:31");
      const card = new TextCardData(makeModel("test.source-duplicate.31", makePayload("end.", ":{{env(screen-width}}", 31)));
      const id = card.getObjectId();
      for (let repeat = 0; repeat < 5; repeat++) {
        source.addData(card);
      }
      expect(source.totalCount()).assertEqual(13);
      for (let repeat = 0; repeat < 5; repeat++) {
        expect(source.getData(8 + repeat) === card).assertTrue();
        expect(source.getData(8 + repeat).getObjectId()).assertEqual(id);
      }
      expect(source.getData(13)).assertUndefined();
    });

    /**
     * @tc.name RepeatedAppendTest_case_033
     * @tc.desc source-duplicate: verify actual DataSource storage contract; input vector 33.
     * @tc.type Function
     * @tc.level Level1
     */
    it('RepeatedAppendTest_case_033', 0, async () => {
      const source = makeSource("test.source-duplicate.32", 15, "source-duplicate:32");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(15);
      await assertSource(source, "test.source-duplicate.32", 15, "source-duplicate:32");
      const card = new TextCardData(makeModel("test.source-duplicate.32", makePayload("", "100%", 32)));
      const id = card.getObjectId();
      for (let repeat = 0; repeat < 2; repeat++) {
        source.addData(card);
      }
      expect(source.totalCount()).assertEqual(17);
      for (let repeat = 0; repeat < 2; repeat++) {
        expect(source.getData(15 + repeat) === card).assertTrue();
        expect(source.getData(15 + repeat).getObjectId()).assertEqual(id);
      }
      expect(source.getData(17)).assertUndefined();
    });

    /**
     * @tc.name RepeatedAppendTest_case_034
     * @tc.desc source-duplicate: verify actual DataSource storage contract; input vector 34.
     * @tc.type Function
     * @tc.level Level1
     */
    it('RepeatedAppendTest_case_034', 0, async () => {
      const source = makeSource("test.source-duplicate.33", 16, "source-duplicate:33");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(16);
      await assertSource(source, "test.source-duplicate.33", 16, "source-duplicate:33");
      const card = new TextCardData(makeModel("test.source-duplicate.33", makePayload("Card", "0%", 33)));
      const id = card.getObjectId();
      for (let repeat = 0; repeat < 3; repeat++) {
        source.addData(card);
      }
      expect(source.totalCount()).assertEqual(19);
      for (let repeat = 0; repeat < 3; repeat++) {
        expect(source.getData(16 + repeat) === card).assertTrue();
        expect(source.getData(16 + repeat).getObjectId()).assertEqual(id);
      }
      expect(source.getData(19)).assertUndefined();
    });
  });
}
