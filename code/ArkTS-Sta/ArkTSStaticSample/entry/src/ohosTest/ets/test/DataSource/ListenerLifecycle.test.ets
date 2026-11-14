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

// Reference: ets/test/PowerValidation/PowerNotification.test.ets
// Original line floor: 905; scenario family: source-listener-sequence.
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

export default function ListenerLifecycleTest(): void {
  describe('ListenerLifecycleTest', () => {
    beforeAll(() => {
      logSuite('ListenerLifecycleTest', 'begin');
    });
    beforeEach(async () => {
      // Yield between cases so device watchdog and UI events can be processed.
      await new Promise<void>((resolve) => { setTimeout(resolve, 1); });
    });
    afterAll(() => {
      logSuite('ListenerLifecycleTest', 'end');
    });

    /**
     * @tc.name ListenerLifecycleTest_case_001
     * @tc.desc source-listener-sequence: verify actual DataSource storage contract; input vector 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ListenerLifecycleTest_case_001', 0, async () => {
      const source = makeSource("test.source-listener-sequence.0", 0, "source-listener-sequence:0");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(0);
      await assertSource(source, "test.source-listener-sequence.0", 0, "source-listener-sequence:0");
      const listener = new ListenerRecorder();
      source.registerDataChangeListener(listener);
      source.registerDataChangeListener(listener);
      const appended = new CardData(makeModel("test.source-listener-sequence.0", makePayload("", "100%", 0)));
      source.addData(appended);
      expect(source.totalCount()).assertEqual(1);
      expect(source.getData(0) === appended).assertTrue();
      expect(listener.events.length).assertEqual(0);
      source.unregisterDataChangeListener(listener);
      source.unregisterDataChangeListener(listener);
      source.addData(appended);
      expect(source.totalCount()).assertEqual(2);
      expect(listener.events.length).assertEqual(0);
      expect(source.getData(1) === appended).assertTrue();
    });

    /**
     * @tc.name ListenerLifecycleTest_case_002
     * @tc.desc source-listener-sequence: verify actual DataSource storage contract; input vector 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ListenerLifecycleTest_case_002', 0, async () => {
      const source = makeSource("test.source-listener-sequence.1", 1, "source-listener-sequence:1");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(1);
      await assertSource(source, "test.source-listener-sequence.1", 1, "source-listener-sequence:1");
      const listener = new ListenerRecorder();
      source.registerDataChangeListener(listener);
      source.unregisterDataChangeListener(new ListenerRecorder());
      const appended = new CardData(makeModel("test.source-listener-sequence.1", makePayload("Card", "0%", 1)));
      source.addData(appended);
      expect(source.totalCount()).assertEqual(2);
      expect(source.getData(1) === appended).assertTrue();
      expect(listener.events.length).assertEqual(0);
      source.unregisterDataChangeListener(listener);
      source.unregisterDataChangeListener(listener);
      source.addData(appended);
      expect(source.totalCount()).assertEqual(3);
      expect(listener.events.length).assertEqual(0);
      expect(source.getData(2) === appended).assertTrue();
    });

    /**
     * @tc.name ListenerLifecycleTest_case_003
     * @tc.desc source-listener-sequence: verify actual DataSource storage contract; input vector 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ListenerLifecycleTest_case_003', 0, async () => {
      const source = makeSource("test.source-listener-sequence.2", 2, "source-listener-sequence:2");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(2);
      await assertSource(source, "test.source-listener-sequence.2", 2, "source-listener-sequence:2");
      const listener = new ListenerRecorder();
      source.registerDataChangeListener(listener);
      source.registerDataChangeListener(listener);
      const appended = new CardData(makeModel("test.source-listener-sequence.2", makePayload(" ", "50%", 2)));
      source.addData(appended);
      expect(source.totalCount()).assertEqual(3);
      expect(source.getData(2) === appended).assertTrue();
      expect(listener.events.length).assertEqual(0);
      source.unregisterDataChangeListener(listener);
      source.unregisterDataChangeListener(listener);
      source.addData(appended);
      expect(source.totalCount()).assertEqual(4);
      expect(listener.events.length).assertEqual(0);
      expect(source.getData(3) === appended).assertTrue();
    });

    /**
     * @tc.name ListenerLifecycleTest_case_004
     * @tc.desc source-listener-sequence: verify actual DataSource storage contract; input vector 4.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ListenerLifecycleTest_case_004', 0, async () => {
      const source = makeSource("test.source-listener-sequence.3", 3, "source-listener-sequence:3");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(3);
      await assertSource(source, "test.source-listener-sequence.3", 3, "source-listener-sequence:3");
      const listener = new ListenerRecorder();
      source.registerDataChangeListener(listener);
      source.unregisterDataChangeListener(new ListenerRecorder());
      const appended = new CardData(makeModel("test.source-listener-sequence.3", makePayload("  padded  ", "1%", 3)));
      source.addData(appended);
      expect(source.totalCount()).assertEqual(4);
      expect(source.getData(3) === appended).assertTrue();
      expect(listener.events.length).assertEqual(0);
      source.unregisterDataChangeListener(listener);
      source.unregisterDataChangeListener(listener);
      source.addData(appended);
      expect(source.totalCount()).assertEqual(5);
      expect(listener.events.length).assertEqual(0);
      expect(source.getData(4) === appended).assertTrue();
    });

    /**
     * @tc.name ListenerLifecycleTest_case_005
     * @tc.desc source-listener-sequence: verify actual DataSource storage contract; input vector 5.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ListenerLifecycleTest_case_005', 0, async () => {
      const source = makeSource("test.source-listener-sequence.4", 7, "source-listener-sequence:4");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(7);
      await assertSource(source, "test.source-listener-sequence.4", 7, "source-listener-sequence:4");
      const listener = new ListenerRecorder();
      source.registerDataChangeListener(listener);
      source.registerDataChangeListener(listener);
      const appended = new CardData(makeModel("test.source-listener-sequence.4", makePayload("multi word title", "99%", 4)));
      source.addData(appended);
      expect(source.totalCount()).assertEqual(8);
      expect(source.getData(7) === appended).assertTrue();
      expect(listener.events.length).assertEqual(0);
      source.unregisterDataChangeListener(listener);
      source.unregisterDataChangeListener(listener);
      source.addData(appended);
      expect(source.totalCount()).assertEqual(9);
      expect(listener.events.length).assertEqual(0);
      expect(source.getData(8) === appended).assertTrue();
    });

    /**
     * @tc.name ListenerLifecycleTest_case_006
     * @tc.desc source-listener-sequence: verify actual DataSource storage contract; input vector 6.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ListenerLifecycleTest_case_006', 0, async () => {
      const source = makeSource("test.source-listener-sequence.5", 8, "source-listener-sequence:5");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(8);
      await assertSource(source, "test.source-listener-sequence.5", 8, "source-listener-sequence:5");
      const listener = new ListenerRecorder();
      source.registerDataChangeListener(listener);
      source.unregisterDataChangeListener(new ListenerRecorder());
      const appended = new CardData(makeModel("test.source-listener-sequence.5", makePayload("line\nbreak", "75%", 5)));
      source.addData(appended);
      expect(source.totalCount()).assertEqual(9);
      expect(source.getData(8) === appended).assertTrue();
      expect(listener.events.length).assertEqual(0);
      source.unregisterDataChangeListener(listener);
      source.unregisterDataChangeListener(listener);
      source.addData(appended);
      expect(source.totalCount()).assertEqual(10);
      expect(listener.events.length).assertEqual(0);
      expect(source.getData(9) === appended).assertTrue();
    });

    /**
     * @tc.name ListenerLifecycleTest_case_007
     * @tc.desc source-listener-sequence: verify actual DataSource storage contract; input vector 7.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ListenerLifecycleTest_case_007', 0, async () => {
      const source = makeSource("test.source-listener-sequence.6", 15, "source-listener-sequence:6");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(15);
      await assertSource(source, "test.source-listener-sequence.6", 15, "source-listener-sequence:6");
      const listener = new ListenerRecorder();
      source.registerDataChangeListener(listener);
      source.registerDataChangeListener(listener);
      const appended = new CardData(makeModel("test.source-listener-sequence.6", makePayload("tab\tvalue", "", 6)));
      source.addData(appended);
      expect(source.totalCount()).assertEqual(16);
      expect(source.getData(15) === appended).assertTrue();
      expect(listener.events.length).assertEqual(0);
      source.unregisterDataChangeListener(listener);
      source.unregisterDataChangeListener(listener);
      source.addData(appended);
      expect(source.totalCount()).assertEqual(17);
      expect(listener.events.length).assertEqual(0);
      expect(source.getData(16) === appended).assertTrue();
    });

    /**
     * @tc.name ListenerLifecycleTest_case_008
     * @tc.desc source-listener-sequence: verify actual DataSource storage contract; input vector 8.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ListenerLifecycleTest_case_008', 0, async () => {
      const source = makeSource("test.source-listener-sequence.7", 16, "source-listener-sequence:7");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(16);
      await assertSource(source, "test.source-listener-sequence.7", 16, "source-listener-sequence:7");
      const listener = new ListenerRecorder();
      source.registerDataChangeListener(listener);
      source.unregisterDataChangeListener(new ListenerRecorder());
      const appended = new CardData(makeModel("test.source-listener-sequence.7", makePayload("\u5361\u7247 1", ":{{env(screen-width}}", 7)));
      source.addData(appended);
      expect(source.totalCount()).assertEqual(17);
      expect(source.getData(16) === appended).assertTrue();
      expect(listener.events.length).assertEqual(0);
      source.unregisterDataChangeListener(listener);
      source.unregisterDataChangeListener(listener);
      source.addData(appended);
      expect(source.totalCount()).assertEqual(18);
      expect(listener.events.length).assertEqual(0);
      expect(source.getData(17) === appended).assertTrue();
    });

    /**
     * @tc.name ListenerLifecycleTest_case_009
     * @tc.desc source-listener-sequence: verify actual DataSource storage contract; input vector 9.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ListenerLifecycleTest_case_009', 0, async () => {
      const source = makeSource("test.source-listener-sequence.8", 31, "source-listener-sequence:8");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(31);
      await assertSource(source, "test.source-listener-sequence.8", 31, "source-listener-sequence:8");
      const listener = new ListenerRecorder();
      source.registerDataChangeListener(listener);
      source.registerDataChangeListener(listener);
      const appended = new CardData(makeModel("test.source-listener-sequence.8", makePayload("\u5361\u7247 2", "100%", 8)));
      source.addData(appended);
      expect(source.totalCount()).assertEqual(32);
      expect(source.getData(31) === appended).assertTrue();
      expect(listener.events.length).assertEqual(0);
      source.unregisterDataChangeListener(listener);
      source.unregisterDataChangeListener(listener);
      source.addData(appended);
      expect(source.totalCount()).assertEqual(33);
      expect(listener.events.length).assertEqual(0);
      expect(source.getData(32) === appended).assertTrue();
    });

    /**
     * @tc.name ListenerLifecycleTest_case_010
     * @tc.desc source-listener-sequence: verify actual DataSource storage contract; input vector 10.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ListenerLifecycleTest_case_010', 0, async () => {
      const source = makeSource("test.source-listener-sequence.9", 32, "source-listener-sequence:9");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(32);
      await assertSource(source, "test.source-listener-sequence.9", 32, "source-listener-sequence:9");
      const listener = new ListenerRecorder();
      source.registerDataChangeListener(listener);
      source.unregisterDataChangeListener(new ListenerRecorder());
      const appended = new CardData(makeModel("test.source-listener-sequence.9", makePayload("\u5361\u7247 3", "0%", 9)));
      source.addData(appended);
      expect(source.totalCount()).assertEqual(33);
      expect(source.getData(32) === appended).assertTrue();
      expect(listener.events.length).assertEqual(0);
      source.unregisterDataChangeListener(listener);
      source.unregisterDataChangeListener(listener);
      source.addData(appended);
      expect(source.totalCount()).assertEqual(34);
      expect(listener.events.length).assertEqual(0);
      expect(source.getData(33) === appended).assertTrue();
    });

    /**
     * @tc.name ListenerLifecycleTest_case_011
     * @tc.desc source-listener-sequence: verify actual DataSource storage contract; input vector 11.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ListenerLifecycleTest_case_011', 0, async () => {
      const source = makeSource("test.source-listener-sequence.10", 63, "source-listener-sequence:10");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(63);
      await assertSource(source, "test.source-listener-sequence.10", 63, "source-listener-sequence:10");
      const listener = new ListenerRecorder();
      source.registerDataChangeListener(listener);
      source.registerDataChangeListener(listener);
      const appended = new CardData(makeModel("test.source-listener-sequence.10", makePayload("\u65e5\u672c\u8a9e", "50%", 10)));
      source.addData(appended);
      expect(source.totalCount()).assertEqual(64);
      expect(source.getData(63) === appended).assertTrue();
      expect(listener.events.length).assertEqual(0);
      source.unregisterDataChangeListener(listener);
      source.unregisterDataChangeListener(listener);
      source.addData(appended);
      expect(source.totalCount()).assertEqual(65);
      expect(listener.events.length).assertEqual(0);
      expect(source.getData(64) === appended).assertTrue();
    });

    /**
     * @tc.name ListenerLifecycleTest_case_012
     * @tc.desc source-listener-sequence: verify actual DataSource storage contract; input vector 12.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ListenerLifecycleTest_case_012', 0, async () => {
      const source = makeSource("test.source-listener-sequence.11", 64, "source-listener-sequence:11");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(64);
      await assertSource(source, "test.source-listener-sequence.11", 64, "source-listener-sequence:11");
      const listener = new ListenerRecorder();
      source.registerDataChangeListener(listener);
      source.unregisterDataChangeListener(new ListenerRecorder());
      const appended = new CardData(makeModel("test.source-listener-sequence.11", makePayload("\u0645\u0631\u062d\u0628\u0627", "1%", 11)));
      source.addData(appended);
      expect(source.totalCount()).assertEqual(65);
      expect(source.getData(64) === appended).assertTrue();
      expect(listener.events.length).assertEqual(0);
      source.unregisterDataChangeListener(listener);
      source.unregisterDataChangeListener(listener);
      source.addData(appended);
      expect(source.totalCount()).assertEqual(66);
      expect(listener.events.length).assertEqual(0);
      expect(source.getData(65) === appended).assertTrue();
    });

    /**
     * @tc.name ListenerLifecycleTest_case_013
     * @tc.desc source-listener-sequence: verify actual DataSource storage contract; input vector 13.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ListenerLifecycleTest_case_013', 0, async () => {
      const source = makeSource("test.source-listener-sequence.12", 127, "source-listener-sequence:12");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(127);
      await assertSource(source, "test.source-listener-sequence.12", 127, "source-listener-sequence:12");
      const listener = new ListenerRecorder();
      source.registerDataChangeListener(listener);
      source.registerDataChangeListener(listener);
      const appended = new CardData(makeModel("test.source-listener-sequence.12", makePayload("\u05e9\u05dc\u05d5\u05dd", "99%", 12)));
      source.addData(appended);
      expect(source.totalCount()).assertEqual(128);
      expect(source.getData(127) === appended).assertTrue();
      expect(listener.events.length).assertEqual(0);
      source.unregisterDataChangeListener(listener);
      source.unregisterDataChangeListener(listener);
      source.addData(appended);
      expect(source.totalCount()).assertEqual(129);
      expect(listener.events.length).assertEqual(0);
      expect(source.getData(128) === appended).assertTrue();
    });

    /**
     * @tc.name ListenerLifecycleTest_case_014
     * @tc.desc source-listener-sequence: verify actual DataSource storage contract; input vector 14.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ListenerLifecycleTest_case_014', 0, async () => {
      const source = makeSource("test.source-listener-sequence.13", 0, "source-listener-sequence:13");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(0);
      await assertSource(source, "test.source-listener-sequence.13", 0, "source-listener-sequence:13");
      const listener = new ListenerRecorder();
      source.registerDataChangeListener(listener);
      source.unregisterDataChangeListener(new ListenerRecorder());
      const appended = new CardData(makeModel("test.source-listener-sequence.13", makePayload("e\u0301", "75%", 13)));
      source.addData(appended);
      expect(source.totalCount()).assertEqual(1);
      expect(source.getData(0) === appended).assertTrue();
      expect(listener.events.length).assertEqual(0);
      source.unregisterDataChangeListener(listener);
      source.unregisterDataChangeListener(listener);
      source.addData(appended);
      expect(source.totalCount()).assertEqual(2);
      expect(listener.events.length).assertEqual(0);
      expect(source.getData(1) === appended).assertTrue();
    });

    /**
     * @tc.name ListenerLifecycleTest_case_015
     * @tc.desc source-listener-sequence: verify actual DataSource storage contract; input vector 15.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ListenerLifecycleTest_case_015', 0, async () => {
      const source = makeSource("test.source-listener-sequence.14", 1, "source-listener-sequence:14");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(1);
      await assertSource(source, "test.source-listener-sequence.14", 1, "source-listener-sequence:14");
      const listener = new ListenerRecorder();
      source.registerDataChangeListener(listener);
      source.registerDataChangeListener(listener);
      const appended = new CardData(makeModel("test.source-listener-sequence.14", makePayload("\u00e9", "", 14)));
      source.addData(appended);
      expect(source.totalCount()).assertEqual(2);
      expect(source.getData(1) === appended).assertTrue();
      expect(listener.events.length).assertEqual(0);
      source.unregisterDataChangeListener(listener);
      source.unregisterDataChangeListener(listener);
      source.addData(appended);
      expect(source.totalCount()).assertEqual(3);
      expect(listener.events.length).assertEqual(0);
      expect(source.getData(2) === appended).assertTrue();
    });

    /**
     * @tc.name ListenerLifecycleTest_case_016
     * @tc.desc source-listener-sequence: verify actual DataSource storage contract; input vector 16.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ListenerLifecycleTest_case_016', 0, async () => {
      const source = makeSource("test.source-listener-sequence.15", 2, "source-listener-sequence:15");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(2);
      await assertSource(source, "test.source-listener-sequence.15", 2, "source-listener-sequence:15");
      const listener = new ListenerRecorder();
      source.registerDataChangeListener(listener);
      source.unregisterDataChangeListener(new ListenerRecorder());
      const appended = new CardData(makeModel("test.source-listener-sequence.15", makePayload("\ud83d\ude80", ":{{env(screen-width}}", 15)));
      source.addData(appended);
      expect(source.totalCount()).assertEqual(3);
      expect(source.getData(2) === appended).assertTrue();
      expect(listener.events.length).assertEqual(0);
      source.unregisterDataChangeListener(listener);
      source.unregisterDataChangeListener(listener);
      source.addData(appended);
      expect(source.totalCount()).assertEqual(4);
      expect(listener.events.length).assertEqual(0);
      expect(source.getData(3) === appended).assertTrue();
    });

    /**
     * @tc.name ListenerLifecycleTest_case_017
     * @tc.desc source-listener-sequence: verify actual DataSource storage contract; input vector 17.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ListenerLifecycleTest_case_017', 0, async () => {
      const source = makeSource("test.source-listener-sequence.16", 3, "source-listener-sequence:16");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(3);
      await assertSource(source, "test.source-listener-sequence.16", 3, "source-listener-sequence:16");
      const listener = new ListenerRecorder();
      source.registerDataChangeListener(listener);
      source.registerDataChangeListener(listener);
      const appended = new CardData(makeModel("test.source-listener-sequence.16", makePayload("quote\"slash\\", "100%", 16)));
      source.addData(appended);
      expect(source.totalCount()).assertEqual(4);
      expect(source.getData(3) === appended).assertTrue();
      expect(listener.events.length).assertEqual(0);
      source.unregisterDataChangeListener(listener);
      source.unregisterDataChangeListener(listener);
      source.addData(appended);
      expect(source.totalCount()).assertEqual(5);
      expect(listener.events.length).assertEqual(0);
      expect(source.getData(4) === appended).assertTrue();
    });

    /**
     * @tc.name ListenerLifecycleTest_case_018
     * @tc.desc source-listener-sequence: verify actual DataSource storage contract; input vector 18.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ListenerLifecycleTest_case_018', 0, async () => {
      const source = makeSource("test.source-listener-sequence.17", 7, "source-listener-sequence:17");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(7);
      await assertSource(source, "test.source-listener-sequence.17", 7, "source-listener-sequence:17");
      const listener = new ListenerRecorder();
      source.registerDataChangeListener(listener);
      source.unregisterDataChangeListener(new ListenerRecorder());
      const appended = new CardData(makeModel("test.source-listener-sequence.17", makePayload("<script>alert(1)</script>", "0%", 17)));
      source.addData(appended);
      expect(source.totalCount()).assertEqual(8);
      expect(source.getData(7) === appended).assertTrue();
      expect(listener.events.length).assertEqual(0);
      source.unregisterDataChangeListener(listener);
      source.unregisterDataChangeListener(listener);
      source.addData(appended);
      expect(source.totalCount()).assertEqual(9);
      expect(listener.events.length).assertEqual(0);
      expect(source.getData(8) === appended).assertTrue();
    });

    /**
     * @tc.name ListenerLifecycleTest_case_019
     * @tc.desc source-listener-sequence: verify actual DataSource storage contract; input vector 19.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ListenerLifecycleTest_case_019', 0, async () => {
      const source = makeSource("test.source-listener-sequence.18", 8, "source-listener-sequence:18");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(8);
      await assertSource(source, "test.source-listener-sequence.18", 8, "source-listener-sequence:18");
      const listener = new ListenerRecorder();
      source.registerDataChangeListener(listener);
      source.registerDataChangeListener(listener);
      const appended = new CardData(makeModel("test.source-listener-sequence.18", makePayload("${notExecuted}", "50%", 18)));
      source.addData(appended);
      expect(source.totalCount()).assertEqual(9);
      expect(source.getData(8) === appended).assertTrue();
      expect(listener.events.length).assertEqual(0);
      source.unregisterDataChangeListener(listener);
      source.unregisterDataChangeListener(listener);
      source.addData(appended);
      expect(source.totalCount()).assertEqual(10);
      expect(listener.events.length).assertEqual(0);
      expect(source.getData(9) === appended).assertTrue();
    });

    /**
     * @tc.name ListenerLifecycleTest_case_020
     * @tc.desc source-listener-sequence: verify actual DataSource storage contract; input vector 20.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ListenerLifecycleTest_case_020', 0, async () => {
      const source = makeSource("test.source-listener-sequence.19", 15, "source-listener-sequence:19");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(15);
      await assertSource(source, "test.source-listener-sequence.19", 15, "source-listener-sequence:19");
      const listener = new ListenerRecorder();
      source.registerDataChangeListener(listener);
      source.unregisterDataChangeListener(new ListenerRecorder());
      const appended = new CardData(makeModel("test.source-listener-sequence.19", makePayload("__proto__", "1%", 19)));
      source.addData(appended);
      expect(source.totalCount()).assertEqual(16);
      expect(source.getData(15) === appended).assertTrue();
      expect(listener.events.length).assertEqual(0);
      source.unregisterDataChangeListener(listener);
      source.unregisterDataChangeListener(listener);
      source.addData(appended);
      expect(source.totalCount()).assertEqual(17);
      expect(listener.events.length).assertEqual(0);
      expect(source.getData(16) === appended).assertTrue();
    });

    /**
     * @tc.name ListenerLifecycleTest_case_021
     * @tc.desc source-listener-sequence: verify actual DataSource storage contract; input vector 21.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ListenerLifecycleTest_case_021', 0, async () => {
      const source = makeSource("test.source-listener-sequence.20", 16, "source-listener-sequence:20");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(16);
      await assertSource(source, "test.source-listener-sequence.20", 16, "source-listener-sequence:20");
      const listener = new ListenerRecorder();
      source.registerDataChangeListener(listener);
      source.registerDataChangeListener(listener);
      const appended = new CardData(makeModel("test.source-listener-sequence.20", makePayload("constructor", "99%", 20)));
      source.addData(appended);
      expect(source.totalCount()).assertEqual(17);
      expect(source.getData(16) === appended).assertTrue();
      expect(listener.events.length).assertEqual(0);
      source.unregisterDataChangeListener(listener);
      source.unregisterDataChangeListener(listener);
      source.addData(appended);
      expect(source.totalCount()).assertEqual(18);
      expect(listener.events.length).assertEqual(0);
      expect(source.getData(17) === appended).assertTrue();
    });

    /**
     * @tc.name ListenerLifecycleTest_case_022
     * @tc.desc source-listener-sequence: verify actual DataSource storage contract; input vector 22.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ListenerLifecycleTest_case_022', 0, async () => {
      const source = makeSource("test.source-listener-sequence.21", 31, "source-listener-sequence:21");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(31);
      await assertSource(source, "test.source-listener-sequence.21", 31, "source-listener-sequence:21");
      const listener = new ListenerRecorder();
      source.registerDataChangeListener(listener);
      source.unregisterDataChangeListener(new ListenerRecorder());
      const appended = new CardData(makeModel("test.source-listener-sequence.21", makePayload("null", "75%", 21)));
      source.addData(appended);
      expect(source.totalCount()).assertEqual(32);
      expect(source.getData(31) === appended).assertTrue();
      expect(listener.events.length).assertEqual(0);
      source.unregisterDataChangeListener(listener);
      source.unregisterDataChangeListener(listener);
      source.addData(appended);
      expect(source.totalCount()).assertEqual(33);
      expect(listener.events.length).assertEqual(0);
      expect(source.getData(32) === appended).assertTrue();
    });

    /**
     * @tc.name ListenerLifecycleTest_case_023
     * @tc.desc source-listener-sequence: verify actual DataSource storage contract; input vector 23.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ListenerLifecycleTest_case_023', 0, async () => {
      const source = makeSource("test.source-listener-sequence.22", 32, "source-listener-sequence:22");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(32);
      await assertSource(source, "test.source-listener-sequence.22", 32, "source-listener-sequence:22");
      const listener = new ListenerRecorder();
      source.registerDataChangeListener(listener);
      source.registerDataChangeListener(listener);
      const appended = new CardData(makeModel("test.source-listener-sequence.22", makePayload("false", "", 22)));
      source.addData(appended);
      expect(source.totalCount()).assertEqual(33);
      expect(source.getData(32) === appended).assertTrue();
      expect(listener.events.length).assertEqual(0);
      source.unregisterDataChangeListener(listener);
      source.unregisterDataChangeListener(listener);
      source.addData(appended);
      expect(source.totalCount()).assertEqual(34);
      expect(listener.events.length).assertEqual(0);
      expect(source.getData(33) === appended).assertTrue();
    });

    /**
     * @tc.name ListenerLifecycleTest_case_024
     * @tc.desc source-listener-sequence: verify actual DataSource storage contract; input vector 24.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ListenerLifecycleTest_case_024', 0, async () => {
      const source = makeSource("test.source-listener-sequence.23", 63, "source-listener-sequence:23");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(63);
      await assertSource(source, "test.source-listener-sequence.23", 63, "source-listener-sequence:23");
      const listener = new ListenerRecorder();
      source.registerDataChangeListener(listener);
      source.unregisterDataChangeListener(new ListenerRecorder());
      const appended = new CardData(makeModel("test.source-listener-sequence.23", makePayload("0", ":{{env(screen-width}}", 23)));
      source.addData(appended);
      expect(source.totalCount()).assertEqual(64);
      expect(source.getData(63) === appended).assertTrue();
      expect(listener.events.length).assertEqual(0);
      source.unregisterDataChangeListener(listener);
      source.unregisterDataChangeListener(listener);
      source.addData(appended);
      expect(source.totalCount()).assertEqual(65);
      expect(listener.events.length).assertEqual(0);
      expect(source.getData(64) === appended).assertTrue();
    });

    /**
     * @tc.name ListenerLifecycleTest_case_025
     * @tc.desc source-listener-sequence: verify actual DataSource storage contract; input vector 25.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ListenerLifecycleTest_case_025', 0, async () => {
      const source = makeSource("test.source-listener-sequence.24", 64, "source-listener-sequence:24");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(64);
      await assertSource(source, "test.source-listener-sequence.24", 64, "source-listener-sequence:24");
      const listener = new ListenerRecorder();
      source.registerDataChangeListener(listener);
      source.registerDataChangeListener(listener);
      const appended = new CardData(makeModel("test.source-listener-sequence.24", makePayload("100%", "100%", 24)));
      source.addData(appended);
      expect(source.totalCount()).assertEqual(65);
      expect(source.getData(64) === appended).assertTrue();
      expect(listener.events.length).assertEqual(0);
      source.unregisterDataChangeListener(listener);
      source.unregisterDataChangeListener(listener);
      source.addData(appended);
      expect(source.totalCount()).assertEqual(66);
      expect(listener.events.length).assertEqual(0);
      expect(source.getData(65) === appended).assertTrue();
    });

    /**
     * @tc.name ListenerLifecycleTest_case_026
     * @tc.desc source-listener-sequence: verify actual DataSource storage contract; input vector 26.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ListenerLifecycleTest_case_026', 0, async () => {
      const source = makeSource("test.source-listener-sequence.25", 127, "source-listener-sequence:25");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(127);
      await assertSource(source, "test.source-listener-sequence.25", 127, "source-listener-sequence:25");
      const listener = new ListenerRecorder();
      source.registerDataChangeListener(listener);
      source.unregisterDataChangeListener(new ListenerRecorder());
      const appended = new CardData(makeModel("test.source-listener-sequence.25", makePayload("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA", "0%", 25)));
      source.addData(appended);
      expect(source.totalCount()).assertEqual(128);
      expect(source.getData(127) === appended).assertTrue();
      expect(listener.events.length).assertEqual(0);
      source.unregisterDataChangeListener(listener);
      source.unregisterDataChangeListener(listener);
      source.addData(appended);
      expect(source.totalCount()).assertEqual(129);
      expect(listener.events.length).assertEqual(0);
      expect(source.getData(128) === appended).assertTrue();
    });

    /**
     * @tc.name ListenerLifecycleTest_case_027
     * @tc.desc source-listener-sequence: verify actual DataSource storage contract; input vector 27.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ListenerLifecycleTest_case_027', 0, async () => {
      const source = makeSource("test.source-listener-sequence.26", 0, "source-listener-sequence:26");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(0);
      await assertSource(source, "test.source-listener-sequence.26", 0, "source-listener-sequence:26");
      const listener = new ListenerRecorder();
      source.registerDataChangeListener(listener);
      source.registerDataChangeListener(listener);
      const appended = new CardData(makeModel("test.source-listener-sequence.26", makePayload("\u0000", "50%", 26)));
      source.addData(appended);
      expect(source.totalCount()).assertEqual(1);
      expect(source.getData(0) === appended).assertTrue();
      expect(listener.events.length).assertEqual(0);
      source.unregisterDataChangeListener(listener);
      source.unregisterDataChangeListener(listener);
      source.addData(appended);
      expect(source.totalCount()).assertEqual(2);
      expect(listener.events.length).assertEqual(0);
      expect(source.getData(1) === appended).assertTrue();
    });

    /**
     * @tc.name ListenerLifecycleTest_case_028
     * @tc.desc source-listener-sequence: verify actual DataSource storage contract; input vector 28.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ListenerLifecycleTest_case_028', 0, async () => {
      const source = makeSource("test.source-listener-sequence.27", 1, "source-listener-sequence:27");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(1);
      await assertSource(source, "test.source-listener-sequence.27", 1, "source-listener-sequence:27");
      const listener = new ListenerRecorder();
      source.registerDataChangeListener(listener);
      source.unregisterDataChangeListener(new ListenerRecorder());
      const appended = new CardData(makeModel("test.source-listener-sequence.27", makePayload("\u2028", "1%", 27)));
      source.addData(appended);
      expect(source.totalCount()).assertEqual(2);
      expect(source.getData(1) === appended).assertTrue();
      expect(listener.events.length).assertEqual(0);
      source.unregisterDataChangeListener(listener);
      source.unregisterDataChangeListener(listener);
      source.addData(appended);
      expect(source.totalCount()).assertEqual(3);
      expect(listener.events.length).assertEqual(0);
      expect(source.getData(2) === appended).assertTrue();
    });

    /**
     * @tc.name ListenerLifecycleTest_case_029
     * @tc.desc source-listener-sequence: verify actual DataSource storage contract; input vector 29.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ListenerLifecycleTest_case_029', 0, async () => {
      const source = makeSource("test.source-listener-sequence.28", 2, "source-listener-sequence:28");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(2);
      await assertSource(source, "test.source-listener-sequence.28", 2, "source-listener-sequence:28");
      const listener = new ListenerRecorder();
      source.registerDataChangeListener(listener);
      source.registerDataChangeListener(listener);
      const appended = new CardData(makeModel("test.source-listener-sequence.28", makePayload("\u2029", "99%", 28)));
      source.addData(appended);
      expect(source.totalCount()).assertEqual(3);
      expect(source.getData(2) === appended).assertTrue();
      expect(listener.events.length).assertEqual(0);
      source.unregisterDataChangeListener(listener);
      source.unregisterDataChangeListener(listener);
      source.addData(appended);
      expect(source.totalCount()).assertEqual(4);
      expect(listener.events.length).assertEqual(0);
      expect(source.getData(3) === appended).assertTrue();
    });

    /**
     * @tc.name ListenerLifecycleTest_case_030
     * @tc.desc source-listener-sequence: verify actual DataSource storage contract; input vector 30.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ListenerLifecycleTest_case_030', 0, async () => {
      const source = makeSource("test.source-listener-sequence.29", 3, "source-listener-sequence:29");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(3);
      await assertSource(source, "test.source-listener-sequence.29", 3, "source-listener-sequence:29");
      const listener = new ListenerRecorder();
      source.registerDataChangeListener(listener);
      source.unregisterDataChangeListener(new ListenerRecorder());
      const appended = new CardData(makeModel("test.source-listener-sequence.29", makePayload("\r\n", "75%", 29)));
      source.addData(appended);
      expect(source.totalCount()).assertEqual(4);
      expect(source.getData(3) === appended).assertTrue();
      expect(listener.events.length).assertEqual(0);
      source.unregisterDataChangeListener(listener);
      source.unregisterDataChangeListener(listener);
      source.addData(appended);
      expect(source.totalCount()).assertEqual(5);
      expect(listener.events.length).assertEqual(0);
      expect(source.getData(4) === appended).assertTrue();
    });

    /**
     * @tc.name ListenerLifecycleTest_case_031
     * @tc.desc source-listener-sequence: verify actual DataSource storage contract; input vector 31.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ListenerLifecycleTest_case_031', 0, async () => {
      const source = makeSource("test.source-listener-sequence.30", 7, "source-listener-sequence:30");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(7);
      await assertSource(source, "test.source-listener-sequence.30", 7, "source-listener-sequence:30");
      const listener = new ListenerRecorder();
      source.registerDataChangeListener(listener);
      source.registerDataChangeListener(listener);
      const appended = new CardData(makeModel("test.source-listener-sequence.30", makePayload("\ud83d\udc69\u200d\ud83d\udcbb", "", 30)));
      source.addData(appended);
      expect(source.totalCount()).assertEqual(8);
      expect(source.getData(7) === appended).assertTrue();
      expect(listener.events.length).assertEqual(0);
      source.unregisterDataChangeListener(listener);
      source.unregisterDataChangeListener(listener);
      source.addData(appended);
      expect(source.totalCount()).assertEqual(9);
      expect(listener.events.length).assertEqual(0);
      expect(source.getData(8) === appended).assertTrue();
    });

    /**
     * @tc.name ListenerLifecycleTest_case_032
     * @tc.desc source-listener-sequence: verify actual DataSource storage contract; input vector 32.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ListenerLifecycleTest_case_032', 0, async () => {
      const source = makeSource("test.source-listener-sequence.31", 8, "source-listener-sequence:31");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(8);
      await assertSource(source, "test.source-listener-sequence.31", 8, "source-listener-sequence:31");
      const listener = new ListenerRecorder();
      source.registerDataChangeListener(listener);
      source.unregisterDataChangeListener(new ListenerRecorder());
      const appended = new CardData(makeModel("test.source-listener-sequence.31", makePayload("end.", ":{{env(screen-width}}", 31)));
      source.addData(appended);
      expect(source.totalCount()).assertEqual(9);
      expect(source.getData(8) === appended).assertTrue();
      expect(listener.events.length).assertEqual(0);
      source.unregisterDataChangeListener(listener);
      source.unregisterDataChangeListener(listener);
      source.addData(appended);
      expect(source.totalCount()).assertEqual(10);
      expect(listener.events.length).assertEqual(0);
      expect(source.getData(9) === appended).assertTrue();
    });
  });
}
