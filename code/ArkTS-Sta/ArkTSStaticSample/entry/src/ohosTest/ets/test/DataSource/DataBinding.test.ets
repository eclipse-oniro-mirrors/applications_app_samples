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

// Reference: ets/test/Interaction/DataBinding.test.ets
// Original line floor: 408; scenario family: source-binding.
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

export default function DataBindingTest(): void {
  describe('DataBindingTest', () => {
    beforeAll(() => {
      logSuite('DataBindingTest', 'begin');
    });
    beforeEach(async () => {
      // Yield between cases so device watchdog and UI events can be processed.
      await new Promise<void>((resolve) => { setTimeout(resolve, 1); });
    });
    afterAll(() => {
      logSuite('DataBindingTest', 'end');
    });

    /**
     * @tc.name DataBindingTest_case_001
     * @tc.desc source-binding: verify actual DataSource storage contract; input vector 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('DataBindingTest_case_001', 0, async () => {
      const source = makeSource("test.source-binding.0", 0, "source-binding:0");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(0);
      await assertSource(source, "test.source-binding.0", 0, "source-binding:0");
      const payload = makePayload("", "100%", 0);
      const card = new TextCardData(makeModel("test.source-binding.0", payload));
      source.addData(card);
      const boundCard = source.getData(0);
      expect(boundCard === card).assertTrue();
      payload.item.title.name = 'updated through shared payload';
      expect(boundCard.opt('item').title.name).assertEqual('updated through shared payload');
      expect(source.getData(0).opt('item') === payload.item).assertTrue();
      expect(source.totalCount()).assertEqual(1);
      expect(boundCard.getObjectId()).assertEqual(card.getObjectId());
      assertUniqueIds(source);
    });

    /**
     * @tc.name DataBindingTest_case_002
     * @tc.desc source-binding: verify actual DataSource storage contract; input vector 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('DataBindingTest_case_002', 0, async () => {
      const source = makeSource("test.source-binding.1", 1, "source-binding:1");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(1);
      await assertSource(source, "test.source-binding.1", 1, "source-binding:1");
      const payload = makePayload("Card", "0%", 1);
      const card = new TextCardData(makeModel("test.source-binding.1", payload));
      source.addData(card);
      const boundCard = source.getData(1);
      expect(boundCard === card).assertTrue();
      payload.item.title.name = 'updated through shared payload';
      expect(boundCard.opt('item').title.name).assertEqual('updated through shared payload');
      expect(source.getData(1).opt('item') === payload.item).assertTrue();
      expect(source.totalCount()).assertEqual(2);
      expect(boundCard.getObjectId()).assertEqual(card.getObjectId());
      assertUniqueIds(source);
    });

    /**
     * @tc.name DataBindingTest_case_003
     * @tc.desc source-binding: verify actual DataSource storage contract; input vector 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('DataBindingTest_case_003', 0, async () => {
      const source = makeSource("test.source-binding.2", 2, "source-binding:2");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(2);
      await assertSource(source, "test.source-binding.2", 2, "source-binding:2");
      const payload = makePayload(" ", "50%", 2);
      const card = new TextCardData(makeModel("test.source-binding.2", payload));
      source.addData(card);
      const boundCard = source.getData(2);
      expect(boundCard === card).assertTrue();
      payload.item.title.name = 'updated through shared payload';
      expect(boundCard.opt('item').title.name).assertEqual('updated through shared payload');
      expect(source.getData(2).opt('item') === payload.item).assertTrue();
      expect(source.totalCount()).assertEqual(3);
      expect(boundCard.getObjectId()).assertEqual(card.getObjectId());
      assertUniqueIds(source);
    });

    /**
     * @tc.name DataBindingTest_case_004
     * @tc.desc source-binding: verify actual DataSource storage contract; input vector 4.
     * @tc.type Function
     * @tc.level Level1
     */
    it('DataBindingTest_case_004', 0, async () => {
      const source = makeSource("test.source-binding.3", 3, "source-binding:3");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(3);
      await assertSource(source, "test.source-binding.3", 3, "source-binding:3");
      const payload = makePayload("  padded  ", "1%", 3);
      const card = new TextCardData(makeModel("test.source-binding.3", payload));
      source.addData(card);
      const boundCard = source.getData(3);
      expect(boundCard === card).assertTrue();
      payload.item.title.name = 'updated through shared payload';
      expect(boundCard.opt('item').title.name).assertEqual('updated through shared payload');
      expect(source.getData(3).opt('item') === payload.item).assertTrue();
      expect(source.totalCount()).assertEqual(4);
      expect(boundCard.getObjectId()).assertEqual(card.getObjectId());
      assertUniqueIds(source);
    });

    /**
     * @tc.name DataBindingTest_case_005
     * @tc.desc source-binding: verify actual DataSource storage contract; input vector 5.
     * @tc.type Function
     * @tc.level Level1
     */
    it('DataBindingTest_case_005', 0, async () => {
      const source = makeSource("test.source-binding.4", 7, "source-binding:4");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(7);
      await assertSource(source, "test.source-binding.4", 7, "source-binding:4");
      const payload = makePayload("multi word title", "99%", 4);
      const card = new TextCardData(makeModel("test.source-binding.4", payload));
      source.addData(card);
      const boundCard = source.getData(7);
      expect(boundCard === card).assertTrue();
      payload.item.title.name = 'updated through shared payload';
      expect(boundCard.opt('item').title.name).assertEqual('updated through shared payload');
      expect(source.getData(7).opt('item') === payload.item).assertTrue();
      expect(source.totalCount()).assertEqual(8);
      expect(boundCard.getObjectId()).assertEqual(card.getObjectId());
      assertUniqueIds(source);
    });

    /**
     * @tc.name DataBindingTest_case_006
     * @tc.desc source-binding: verify actual DataSource storage contract; input vector 6.
     * @tc.type Function
     * @tc.level Level1
     */
    it('DataBindingTest_case_006', 0, async () => {
      const source = makeSource("test.source-binding.5", 8, "source-binding:5");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(8);
      await assertSource(source, "test.source-binding.5", 8, "source-binding:5");
      const payload = makePayload("line\nbreak", "75%", 5);
      const card = new TextCardData(makeModel("test.source-binding.5", payload));
      source.addData(card);
      const boundCard = source.getData(8);
      expect(boundCard === card).assertTrue();
      payload.item.title.name = 'updated through shared payload';
      expect(boundCard.opt('item').title.name).assertEqual('updated through shared payload');
      expect(source.getData(8).opt('item') === payload.item).assertTrue();
      expect(source.totalCount()).assertEqual(9);
      expect(boundCard.getObjectId()).assertEqual(card.getObjectId());
      assertUniqueIds(source);
    });

    /**
     * @tc.name DataBindingTest_case_007
     * @tc.desc source-binding: verify actual DataSource storage contract; input vector 7.
     * @tc.type Function
     * @tc.level Level1
     */
    it('DataBindingTest_case_007', 0, async () => {
      const source = makeSource("test.source-binding.6", 15, "source-binding:6");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(15);
      await assertSource(source, "test.source-binding.6", 15, "source-binding:6");
      const payload = makePayload("tab\tvalue", "", 6);
      const card = new TextCardData(makeModel("test.source-binding.6", payload));
      source.addData(card);
      const boundCard = source.getData(15);
      expect(boundCard === card).assertTrue();
      payload.item.title.name = 'updated through shared payload';
      expect(boundCard.opt('item').title.name).assertEqual('updated through shared payload');
      expect(source.getData(15).opt('item') === payload.item).assertTrue();
      expect(source.totalCount()).assertEqual(16);
      expect(boundCard.getObjectId()).assertEqual(card.getObjectId());
      assertUniqueIds(source);
    });

    /**
     * @tc.name DataBindingTest_case_008
     * @tc.desc source-binding: verify actual DataSource storage contract; input vector 8.
     * @tc.type Function
     * @tc.level Level1
     */
    it('DataBindingTest_case_008', 0, async () => {
      const source = makeSource("test.source-binding.7", 16, "source-binding:7");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(16);
      await assertSource(source, "test.source-binding.7", 16, "source-binding:7");
      const payload = makePayload("\u5361\u7247 1", ":{{env(screen-width}}", 7);
      const card = new TextCardData(makeModel("test.source-binding.7", payload));
      source.addData(card);
      const boundCard = source.getData(16);
      expect(boundCard === card).assertTrue();
      payload.item.title.name = 'updated through shared payload';
      expect(boundCard.opt('item').title.name).assertEqual('updated through shared payload');
      expect(source.getData(16).opt('item') === payload.item).assertTrue();
      expect(source.totalCount()).assertEqual(17);
      expect(boundCard.getObjectId()).assertEqual(card.getObjectId());
      assertUniqueIds(source);
    });

    /**
     * @tc.name DataBindingTest_case_009
     * @tc.desc source-binding: verify actual DataSource storage contract; input vector 9.
     * @tc.type Function
     * @tc.level Level1
     */
    it('DataBindingTest_case_009', 0, async () => {
      const source = makeSource("test.source-binding.8", 31, "source-binding:8");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(31);
      await assertSource(source, "test.source-binding.8", 31, "source-binding:8");
      const payload = makePayload("\u5361\u7247 2", "100%", 8);
      const card = new TextCardData(makeModel("test.source-binding.8", payload));
      source.addData(card);
      const boundCard = source.getData(31);
      expect(boundCard === card).assertTrue();
      payload.item.title.name = 'updated through shared payload';
      expect(boundCard.opt('item').title.name).assertEqual('updated through shared payload');
      expect(source.getData(31).opt('item') === payload.item).assertTrue();
      expect(source.totalCount()).assertEqual(32);
      expect(boundCard.getObjectId()).assertEqual(card.getObjectId());
      assertUniqueIds(source);
    });

    /**
     * @tc.name DataBindingTest_case_010
     * @tc.desc source-binding: verify actual DataSource storage contract; input vector 10.
     * @tc.type Function
     * @tc.level Level1
     */
    it('DataBindingTest_case_010', 0, async () => {
      const source = makeSource("test.source-binding.9", 32, "source-binding:9");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(32);
      await assertSource(source, "test.source-binding.9", 32, "source-binding:9");
      const payload = makePayload("\u5361\u7247 3", "0%", 9);
      const card = new TextCardData(makeModel("test.source-binding.9", payload));
      source.addData(card);
      const boundCard = source.getData(32);
      expect(boundCard === card).assertTrue();
      payload.item.title.name = 'updated through shared payload';
      expect(boundCard.opt('item').title.name).assertEqual('updated through shared payload');
      expect(source.getData(32).opt('item') === payload.item).assertTrue();
      expect(source.totalCount()).assertEqual(33);
      expect(boundCard.getObjectId()).assertEqual(card.getObjectId());
      assertUniqueIds(source);
    });

    /**
     * @tc.name DataBindingTest_case_011
     * @tc.desc source-binding: verify actual DataSource storage contract; input vector 11.
     * @tc.type Function
     * @tc.level Level1
     */
    it('DataBindingTest_case_011', 0, async () => {
      const source = makeSource("test.source-binding.10", 63, "source-binding:10");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(63);
      await assertSource(source, "test.source-binding.10", 63, "source-binding:10");
      const payload = makePayload("\u65e5\u672c\u8a9e", "50%", 10);
      const card = new TextCardData(makeModel("test.source-binding.10", payload));
      source.addData(card);
      const boundCard = source.getData(63);
      expect(boundCard === card).assertTrue();
      payload.item.title.name = 'updated through shared payload';
      expect(boundCard.opt('item').title.name).assertEqual('updated through shared payload');
      expect(source.getData(63).opt('item') === payload.item).assertTrue();
      expect(source.totalCount()).assertEqual(64);
      expect(boundCard.getObjectId()).assertEqual(card.getObjectId());
      assertUniqueIds(source);
    });

    /**
     * @tc.name DataBindingTest_case_012
     * @tc.desc source-binding: verify actual DataSource storage contract; input vector 12.
     * @tc.type Function
     * @tc.level Level1
     */
    it('DataBindingTest_case_012', 0, async () => {
      const source = makeSource("test.source-binding.11", 64, "source-binding:11");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(64);
      await assertSource(source, "test.source-binding.11", 64, "source-binding:11");
      const payload = makePayload("\u0645\u0631\u062d\u0628\u0627", "1%", 11);
      const card = new TextCardData(makeModel("test.source-binding.11", payload));
      source.addData(card);
      const boundCard = source.getData(64);
      expect(boundCard === card).assertTrue();
      payload.item.title.name = 'updated through shared payload';
      expect(boundCard.opt('item').title.name).assertEqual('updated through shared payload');
      expect(source.getData(64).opt('item') === payload.item).assertTrue();
      expect(source.totalCount()).assertEqual(65);
      expect(boundCard.getObjectId()).assertEqual(card.getObjectId());
      assertUniqueIds(source);
    });

    /**
     * @tc.name DataBindingTest_case_013
     * @tc.desc source-binding: verify actual DataSource storage contract; input vector 13.
     * @tc.type Function
     * @tc.level Level1
     */
    it('DataBindingTest_case_013', 0, async () => {
      const source = makeSource("test.source-binding.12", 127, "source-binding:12");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(127);
      await assertSource(source, "test.source-binding.12", 127, "source-binding:12");
      const payload = makePayload("\u05e9\u05dc\u05d5\u05dd", "99%", 12);
      const card = new TextCardData(makeModel("test.source-binding.12", payload));
      source.addData(card);
      const boundCard = source.getData(127);
      expect(boundCard === card).assertTrue();
      payload.item.title.name = 'updated through shared payload';
      expect(boundCard.opt('item').title.name).assertEqual('updated through shared payload');
      expect(source.getData(127).opt('item') === payload.item).assertTrue();
      expect(source.totalCount()).assertEqual(128);
      expect(boundCard.getObjectId()).assertEqual(card.getObjectId());
      assertUniqueIds(source);
    });

    /**
     * @tc.name DataBindingTest_case_014
     * @tc.desc source-binding: verify actual DataSource storage contract; input vector 14.
     * @tc.type Function
     * @tc.level Level1
     */
    it('DataBindingTest_case_014', 0, async () => {
      const source = makeSource("test.source-binding.13", 0, "source-binding:13");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(0);
      await assertSource(source, "test.source-binding.13", 0, "source-binding:13");
      const payload = makePayload("e\u0301", "75%", 13);
      const card = new TextCardData(makeModel("test.source-binding.13", payload));
      source.addData(card);
      const boundCard = source.getData(0);
      expect(boundCard === card).assertTrue();
      payload.item.title.name = 'updated through shared payload';
      expect(boundCard.opt('item').title.name).assertEqual('updated through shared payload');
      expect(source.getData(0).opt('item') === payload.item).assertTrue();
      expect(source.totalCount()).assertEqual(1);
      expect(boundCard.getObjectId()).assertEqual(card.getObjectId());
      assertUniqueIds(source);
    });

    /**
     * @tc.name DataBindingTest_case_015
     * @tc.desc source-binding: verify actual DataSource storage contract; input vector 15.
     * @tc.type Function
     * @tc.level Level1
     */
    it('DataBindingTest_case_015', 0, async () => {
      const source = makeSource("test.source-binding.14", 1, "source-binding:14");
      const initialCount = source.totalCount();
      expect(initialCount).assertEqual(1);
      await assertSource(source, "test.source-binding.14", 1, "source-binding:14");
      const payload = makePayload("\u00e9", "", 14);
      const card = new TextCardData(makeModel("test.source-binding.14", payload));
      source.addData(card);
      const boundCard = source.getData(1);
      expect(boundCard === card).assertTrue();
      payload.item.title.name = 'updated through shared payload';
      expect(boundCard.opt('item').title.name).assertEqual('updated through shared payload');
      expect(source.getData(1).opt('item') === payload.item).assertTrue();
      expect(source.totalCount()).assertEqual(2);
      expect(boundCard.getObjectId()).assertEqual(card.getObjectId());
      assertUniqueIds(source);
    });
  });
}
