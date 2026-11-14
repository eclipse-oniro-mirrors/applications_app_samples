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

// Reference: ets/test/LifecycleState/StatePersistence.test.ets
// Original line floor: 294; scenario family: card-roundtrip.
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

export default function PayloadRoundTripTest(): void {
  describe('PayloadRoundTripTest', () => {
    beforeAll(() => {
      logSuite('PayloadRoundTripTest', 'begin');
    });
    beforeEach(async () => {
      // Yield between cases so device watchdog and UI events can be processed.
      await new Promise<void>((resolve) => { setTimeout(resolve, 1); });
    });
    afterAll(() => {
      logSuite('PayloadRoundTripTest', 'end');
    });

    /**
     * @tc.name PayloadRoundTripTest_case_001
     * @tc.desc card-roundtrip: preserve payload semantics and stable identity; input vector 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PayloadRoundTripTest_case_001', 0, () => {
      const payload = makePayload("", "100%", 0);
      const model: DataModel = makeModel("test.card-roundtrip.0", payload);
      const encoded = JSON.stringify(payload);
      const restored: CardPayload = JSON.parse(encoded);
      const card = new TextCardData(makeModel("test.card-roundtrip.0", restored));
      expect(card.data === payload).assertFalse();
      expect(JSON.stringify(card.data)).assertEqual(encoded);
      expect(card.opt('item').title.name).assertEqual("");
      expect(card.opt('style').width).assertEqual("100%");
      expect(card.opt('tags')[0]).assertEqual("");
      restored.item.title.name = 'restored only';
      expect(card.opt('item').title.name).assertEqual('restored only');
      expect(payload.item.title.name).assertEqual("");
      expect(card.type).assertEqual("test.card-roundtrip.0");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name PayloadRoundTripTest_case_002
     * @tc.desc card-roundtrip: preserve payload semantics and stable identity; input vector 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PayloadRoundTripTest_case_002', 0, () => {
      const payload = makePayload("Card", "0%", 1);
      const model: DataModel = makeModel("test.card-roundtrip.1", payload);
      const encoded = JSON.stringify(payload);
      const restored: CardPayload = JSON.parse(encoded);
      const card = new TextCardData(makeModel("test.card-roundtrip.1", restored));
      expect(card.data === payload).assertFalse();
      expect(JSON.stringify(card.data)).assertEqual(encoded);
      expect(card.opt('item').title.name).assertEqual("Card");
      expect(card.opt('style').width).assertEqual("0%");
      expect(card.opt('tags')[0]).assertEqual("Card");
      restored.item.title.name = 'restored only';
      expect(card.opt('item').title.name).assertEqual('restored only');
      expect(payload.item.title.name).assertEqual("Card");
      expect(card.type).assertEqual("test.card-roundtrip.1");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name PayloadRoundTripTest_case_003
     * @tc.desc card-roundtrip: preserve payload semantics and stable identity; input vector 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PayloadRoundTripTest_case_003', 0, () => {
      const payload = makePayload(" ", "50%", 2);
      const model: DataModel = makeModel("test.card-roundtrip.2", payload);
      const encoded = JSON.stringify(payload);
      const restored: CardPayload = JSON.parse(encoded);
      const card = new TextCardData(makeModel("test.card-roundtrip.2", restored));
      expect(card.data === payload).assertFalse();
      expect(JSON.stringify(card.data)).assertEqual(encoded);
      expect(card.opt('item').title.name).assertEqual(" ");
      expect(card.opt('style').width).assertEqual("50%");
      expect(card.opt('tags')[0]).assertEqual(" ");
      restored.item.title.name = 'restored only';
      expect(card.opt('item').title.name).assertEqual('restored only');
      expect(payload.item.title.name).assertEqual(" ");
      expect(card.type).assertEqual("test.card-roundtrip.2");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name PayloadRoundTripTest_case_004
     * @tc.desc card-roundtrip: preserve payload semantics and stable identity; input vector 4.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PayloadRoundTripTest_case_004', 0, () => {
      const payload = makePayload("  padded  ", "1%", 3);
      const model: DataModel = makeModel("test.card-roundtrip.3", payload);
      const encoded = JSON.stringify(payload);
      const restored: CardPayload = JSON.parse(encoded);
      const card = new TextCardData(makeModel("test.card-roundtrip.3", restored));
      expect(card.data === payload).assertFalse();
      expect(JSON.stringify(card.data)).assertEqual(encoded);
      expect(card.opt('item').title.name).assertEqual("  padded  ");
      expect(card.opt('style').width).assertEqual("1%");
      expect(card.opt('tags')[0]).assertEqual("  padded  ");
      restored.item.title.name = 'restored only';
      expect(card.opt('item').title.name).assertEqual('restored only');
      expect(payload.item.title.name).assertEqual("  padded  ");
      expect(card.type).assertEqual("test.card-roundtrip.3");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name PayloadRoundTripTest_case_005
     * @tc.desc card-roundtrip: preserve payload semantics and stable identity; input vector 5.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PayloadRoundTripTest_case_005', 0, () => {
      const payload = makePayload("multi word title", "99%", 4);
      const model: DataModel = makeModel("test.card-roundtrip.4", payload);
      const encoded = JSON.stringify(payload);
      const restored: CardPayload = JSON.parse(encoded);
      const card = new TextCardData(makeModel("test.card-roundtrip.4", restored));
      expect(card.data === payload).assertFalse();
      expect(JSON.stringify(card.data)).assertEqual(encoded);
      expect(card.opt('item').title.name).assertEqual("multi word title");
      expect(card.opt('style').width).assertEqual("99%");
      expect(card.opt('tags')[0]).assertEqual("multi word title");
      restored.item.title.name = 'restored only';
      expect(card.opt('item').title.name).assertEqual('restored only');
      expect(payload.item.title.name).assertEqual("multi word title");
      expect(card.type).assertEqual("test.card-roundtrip.4");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name PayloadRoundTripTest_case_006
     * @tc.desc card-roundtrip: preserve payload semantics and stable identity; input vector 6.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PayloadRoundTripTest_case_006', 0, () => {
      const payload = makePayload("line\nbreak", "75%", 5);
      const model: DataModel = makeModel("test.card-roundtrip.5", payload);
      const encoded = JSON.stringify(payload);
      const restored: CardPayload = JSON.parse(encoded);
      const card = new TextCardData(makeModel("test.card-roundtrip.5", restored));
      expect(card.data === payload).assertFalse();
      expect(JSON.stringify(card.data)).assertEqual(encoded);
      expect(card.opt('item').title.name).assertEqual("line\nbreak");
      expect(card.opt('style').width).assertEqual("75%");
      expect(card.opt('tags')[0]).assertEqual("line\nbreak");
      restored.item.title.name = 'restored only';
      expect(card.opt('item').title.name).assertEqual('restored only');
      expect(payload.item.title.name).assertEqual("line\nbreak");
      expect(card.type).assertEqual("test.card-roundtrip.5");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name PayloadRoundTripTest_case_007
     * @tc.desc card-roundtrip: preserve payload semantics and stable identity; input vector 7.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PayloadRoundTripTest_case_007', 0, () => {
      const payload = makePayload("tab\tvalue", "", 6);
      const model: DataModel = makeModel("test.card-roundtrip.6", payload);
      const encoded = JSON.stringify(payload);
      const restored: CardPayload = JSON.parse(encoded);
      const card = new TextCardData(makeModel("test.card-roundtrip.6", restored));
      expect(card.data === payload).assertFalse();
      expect(JSON.stringify(card.data)).assertEqual(encoded);
      expect(card.opt('item').title.name).assertEqual("tab\tvalue");
      expect(card.opt('style').width).assertEqual("");
      expect(card.opt('tags')[0]).assertEqual("tab\tvalue");
      restored.item.title.name = 'restored only';
      expect(card.opt('item').title.name).assertEqual('restored only');
      expect(payload.item.title.name).assertEqual("tab\tvalue");
      expect(card.type).assertEqual("test.card-roundtrip.6");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name PayloadRoundTripTest_case_008
     * @tc.desc card-roundtrip: preserve payload semantics and stable identity; input vector 8.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PayloadRoundTripTest_case_008', 0, () => {
      const payload = makePayload("\u5361\u7247 1", ":{{env(screen-width}}", 7);
      const model: DataModel = makeModel("test.card-roundtrip.7", payload);
      const encoded = JSON.stringify(payload);
      const restored: CardPayload = JSON.parse(encoded);
      const card = new TextCardData(makeModel("test.card-roundtrip.7", restored));
      expect(card.data === payload).assertFalse();
      expect(JSON.stringify(card.data)).assertEqual(encoded);
      expect(card.opt('item').title.name).assertEqual("\u5361\u7247 1");
      expect(card.opt('style').width).assertEqual(":{{env(screen-width}}");
      expect(card.opt('tags')[0]).assertEqual("\u5361\u7247 1");
      restored.item.title.name = 'restored only';
      expect(card.opt('item').title.name).assertEqual('restored only');
      expect(payload.item.title.name).assertEqual("\u5361\u7247 1");
      expect(card.type).assertEqual("test.card-roundtrip.7");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name PayloadRoundTripTest_case_009
     * @tc.desc card-roundtrip: preserve payload semantics and stable identity; input vector 9.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PayloadRoundTripTest_case_009', 0, () => {
      const payload = makePayload("\u5361\u7247 2", "100%", 8);
      const model: DataModel = makeModel("test.card-roundtrip.8", payload);
      const encoded = JSON.stringify(payload);
      const restored: CardPayload = JSON.parse(encoded);
      const card = new TextCardData(makeModel("test.card-roundtrip.8", restored));
      expect(card.data === payload).assertFalse();
      expect(JSON.stringify(card.data)).assertEqual(encoded);
      expect(card.opt('item').title.name).assertEqual("\u5361\u7247 2");
      expect(card.opt('style').width).assertEqual("100%");
      expect(card.opt('tags')[0]).assertEqual("\u5361\u7247 2");
      restored.item.title.name = 'restored only';
      expect(card.opt('item').title.name).assertEqual('restored only');
      expect(payload.item.title.name).assertEqual("\u5361\u7247 2");
      expect(card.type).assertEqual("test.card-roundtrip.8");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name PayloadRoundTripTest_case_010
     * @tc.desc card-roundtrip: preserve payload semantics and stable identity; input vector 10.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PayloadRoundTripTest_case_010', 0, () => {
      const payload = makePayload("\u5361\u7247 3", "0%", 9);
      const model: DataModel = makeModel("test.card-roundtrip.9", payload);
      const encoded = JSON.stringify(payload);
      const restored: CardPayload = JSON.parse(encoded);
      const card = new TextCardData(makeModel("test.card-roundtrip.9", restored));
      expect(card.data === payload).assertFalse();
      expect(JSON.stringify(card.data)).assertEqual(encoded);
      expect(card.opt('item').title.name).assertEqual("\u5361\u7247 3");
      expect(card.opt('style').width).assertEqual("0%");
      expect(card.opt('tags')[0]).assertEqual("\u5361\u7247 3");
      restored.item.title.name = 'restored only';
      expect(card.opt('item').title.name).assertEqual('restored only');
      expect(payload.item.title.name).assertEqual("\u5361\u7247 3");
      expect(card.type).assertEqual("test.card-roundtrip.9");
      expect(card.getObjectId().length > 0).assertTrue();
    });
  });
}
