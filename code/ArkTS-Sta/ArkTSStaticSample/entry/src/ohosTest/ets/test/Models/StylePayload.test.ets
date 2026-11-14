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

// Reference: ets/test/Interaction/ThemeVariation.test.ets
// Original line floor: 297; scenario family: card-style.
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

export default function StylePayloadTest(): void {
  describe('StylePayloadTest', () => {
    beforeAll(() => {
      logSuite('StylePayloadTest', 'begin');
    });
    beforeEach(async () => {
      // Yield between cases so device watchdog and UI events can be processed.
      await new Promise<void>((resolve) => { setTimeout(resolve, 1); });
    });
    afterAll(() => {
      logSuite('StylePayloadTest', 'end');
    });

    /**
     * @tc.name StylePayloadTest_case_001
     * @tc.desc card-style: preserve payload semantics and stable identity; input vector 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('StylePayloadTest_case_001', 0, () => {
      const payload = makePayload("", "100%", 0);
      const model: DataModel = makeModel("test.card-style.0", payload);
      const card = new CardData(model);
      const originalId = card.getObjectId();
      expect(card.data === payload).assertTrue();
      expect(card.opt('item') === payload.item).assertTrue();
      expect(card.opt('style') === payload.style).assertTrue();
      expect(card.opt('item').title.name).assertEqual("");
      expect(card.opt('style').width).assertEqual("100%");
      expect(card.opt('sequence')).assertEqual(0);
      expect(card.opt('enabled')).assertEqual(true);
      expect(card.opt('amount')).assertEqual(0);
      expect(card.opt('tags')[0]).assertEqual("");
      expect(card.opt('tags')[1]).assertEqual("0");
      expect(card.opt('unknown-property')).assertUndefined();
      expect(card.getObjectId()).assertEqual(originalId);
      expect(card.type).assertEqual("test.card-style.0");
      expect(card.getObjectId().length > 0).assertTrue();
      payload.style.theme = 'contrast';
      expect(card.opt('style').theme).assertEqual('contrast');
      expect(card.opt('item').title.name).assertEqual("");
    });

    /**
     * @tc.name StylePayloadTest_case_002
     * @tc.desc card-style: preserve payload semantics and stable identity; input vector 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('StylePayloadTest_case_002', 0, () => {
      const payload = makePayload("Card", "0%", 1);
      const model: DataModel = makeModel("test.card-style.1", payload);
      const card = new TextCardData(model);
      const originalId = card.getObjectId();
      expect(card.data === payload).assertTrue();
      expect(card.opt('item') === payload.item).assertTrue();
      expect(card.opt('style') === payload.style).assertTrue();
      expect(card.opt('item').title.name).assertEqual("Card");
      expect(card.opt('style').width).assertEqual("0%");
      expect(card.opt('sequence')).assertEqual(1);
      expect(card.opt('enabled')).assertEqual(false);
      expect(card.opt('amount')).assertEqual(0.5);
      expect(card.opt('tags')[0]).assertEqual("Card");
      expect(card.opt('tags')[1]).assertEqual("1");
      expect(card.opt('unknown-property')).assertUndefined();
      expect(card.getObjectId()).assertEqual(originalId);
      expect(card.type).assertEqual("test.card-style.1");
      expect(card.getObjectId().length > 0).assertTrue();
      payload.style.theme = 'contrast';
      expect(card.opt('style').theme).assertEqual('contrast');
      expect(card.opt('item').title.name).assertEqual("Card");
    });

    /**
     * @tc.name StylePayloadTest_case_003
     * @tc.desc card-style: preserve payload semantics and stable identity; input vector 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('StylePayloadTest_case_003', 0, () => {
      const payload = makePayload(" ", "50%", 2);
      const model: DataModel = makeModel("test.card-style.2", payload);
      const card = new CardData(model);
      const originalId = card.getObjectId();
      expect(card.data === payload).assertTrue();
      expect(card.opt('item') === payload.item).assertTrue();
      expect(card.opt('style') === payload.style).assertTrue();
      expect(card.opt('item').title.name).assertEqual(" ");
      expect(card.opt('style').width).assertEqual("50%");
      expect(card.opt('sequence')).assertEqual(2);
      expect(card.opt('enabled')).assertEqual(true);
      expect(card.opt('amount')).assertEqual(1);
      expect(card.opt('tags')[0]).assertEqual(" ");
      expect(card.opt('tags')[1]).assertEqual("2");
      expect(card.opt('unknown-property')).assertUndefined();
      expect(card.getObjectId()).assertEqual(originalId);
      expect(card.type).assertEqual("test.card-style.2");
      expect(card.getObjectId().length > 0).assertTrue();
      payload.style.theme = 'contrast';
      expect(card.opt('style').theme).assertEqual('contrast');
      expect(card.opt('item').title.name).assertEqual(" ");
    });

    /**
     * @tc.name StylePayloadTest_case_004
     * @tc.desc card-style: preserve payload semantics and stable identity; input vector 4.
     * @tc.type Function
     * @tc.level Level1
     */
    it('StylePayloadTest_case_004', 0, () => {
      const payload = makePayload("  padded  ", "1%", 3);
      const model: DataModel = makeModel("test.card-style.3", payload);
      const card = new TextCardData(model);
      const originalId = card.getObjectId();
      expect(card.data === payload).assertTrue();
      expect(card.opt('item') === payload.item).assertTrue();
      expect(card.opt('style') === payload.style).assertTrue();
      expect(card.opt('item').title.name).assertEqual("  padded  ");
      expect(card.opt('style').width).assertEqual("1%");
      expect(card.opt('sequence')).assertEqual(3);
      expect(card.opt('enabled')).assertEqual(false);
      expect(card.opt('amount')).assertEqual(1.5);
      expect(card.opt('tags')[0]).assertEqual("  padded  ");
      expect(card.opt('tags')[1]).assertEqual("3");
      expect(card.opt('unknown-property')).assertUndefined();
      expect(card.getObjectId()).assertEqual(originalId);
      expect(card.type).assertEqual("test.card-style.3");
      expect(card.getObjectId().length > 0).assertTrue();
      payload.style.theme = 'contrast';
      expect(card.opt('style').theme).assertEqual('contrast');
      expect(card.opt('item').title.name).assertEqual("  padded  ");
    });

    /**
     * @tc.name StylePayloadTest_case_005
     * @tc.desc card-style: preserve payload semantics and stable identity; input vector 5.
     * @tc.type Function
     * @tc.level Level1
     */
    it('StylePayloadTest_case_005', 0, () => {
      const payload = makePayload("multi word title", "99%", 4);
      const model: DataModel = makeModel("test.card-style.4", payload);
      const card = new CardData(model);
      const originalId = card.getObjectId();
      expect(card.data === payload).assertTrue();
      expect(card.opt('item') === payload.item).assertTrue();
      expect(card.opt('style') === payload.style).assertTrue();
      expect(card.opt('item').title.name).assertEqual("multi word title");
      expect(card.opt('style').width).assertEqual("99%");
      expect(card.opt('sequence')).assertEqual(4);
      expect(card.opt('enabled')).assertEqual(true);
      expect(card.opt('amount')).assertEqual(2);
      expect(card.opt('tags')[0]).assertEqual("multi word title");
      expect(card.opt('tags')[1]).assertEqual("4");
      expect(card.opt('unknown-property')).assertUndefined();
      expect(card.getObjectId()).assertEqual(originalId);
      expect(card.type).assertEqual("test.card-style.4");
      expect(card.getObjectId().length > 0).assertTrue();
      payload.style.theme = 'contrast';
      expect(card.opt('style').theme).assertEqual('contrast');
      expect(card.opt('item').title.name).assertEqual("multi word title");
    });

    /**
     * @tc.name StylePayloadTest_case_006
     * @tc.desc card-style: preserve payload semantics and stable identity; input vector 6.
     * @tc.type Function
     * @tc.level Level1
     */
    it('StylePayloadTest_case_006', 0, () => {
      const payload = makePayload("line\nbreak", "75%", 5);
      const model: DataModel = makeModel("test.card-style.5", payload);
      const card = new TextCardData(model);
      const originalId = card.getObjectId();
      expect(card.data === payload).assertTrue();
      expect(card.opt('item') === payload.item).assertTrue();
      expect(card.opt('style') === payload.style).assertTrue();
      expect(card.opt('item').title.name).assertEqual("line\nbreak");
      expect(card.opt('style').width).assertEqual("75%");
      expect(card.opt('sequence')).assertEqual(5);
      expect(card.opt('enabled')).assertEqual(false);
      expect(card.opt('amount')).assertEqual(2.5);
      expect(card.opt('tags')[0]).assertEqual("line\nbreak");
      expect(card.opt('tags')[1]).assertEqual("5");
      expect(card.opt('unknown-property')).assertUndefined();
      expect(card.getObjectId()).assertEqual(originalId);
      expect(card.type).assertEqual("test.card-style.5");
      expect(card.getObjectId().length > 0).assertTrue();
      payload.style.theme = 'contrast';
      expect(card.opt('style').theme).assertEqual('contrast');
      expect(card.opt('item').title.name).assertEqual("line\nbreak");
    });

    /**
     * @tc.name StylePayloadTest_case_007
     * @tc.desc card-style: preserve payload semantics and stable identity; input vector 7.
     * @tc.type Function
     * @tc.level Level1
     */
    it('StylePayloadTest_case_007', 0, () => {
      const payload = makePayload("tab\tvalue", "", 6);
      const model: DataModel = makeModel("test.card-style.6", payload);
      const card = new CardData(model);
      const originalId = card.getObjectId();
      expect(card.data === payload).assertTrue();
      expect(card.opt('item') === payload.item).assertTrue();
      expect(card.opt('style') === payload.style).assertTrue();
      expect(card.opt('item').title.name).assertEqual("tab\tvalue");
      expect(card.opt('style').width).assertEqual("");
      expect(card.opt('sequence')).assertEqual(6);
      expect(card.opt('enabled')).assertEqual(true);
      expect(card.opt('amount')).assertEqual(3);
      expect(card.opt('tags')[0]).assertEqual("tab\tvalue");
      expect(card.opt('tags')[1]).assertEqual("6");
      expect(card.opt('unknown-property')).assertUndefined();
      expect(card.getObjectId()).assertEqual(originalId);
      expect(card.type).assertEqual("test.card-style.6");
      expect(card.getObjectId().length > 0).assertTrue();
      payload.style.theme = 'contrast';
      expect(card.opt('style').theme).assertEqual('contrast');
      expect(card.opt('item').title.name).assertEqual("tab\tvalue");
    });

    /**
     * @tc.name StylePayloadTest_case_008
     * @tc.desc card-style: preserve payload semantics and stable identity; input vector 8.
     * @tc.type Function
     * @tc.level Level1
     */
    it('StylePayloadTest_case_008', 0, () => {
      const payload = makePayload("\u5361\u7247 1", ":{{env(screen-width}}", 7);
      const model: DataModel = makeModel("test.card-style.7", payload);
      const card = new TextCardData(model);
      const originalId = card.getObjectId();
      expect(card.data === payload).assertTrue();
      expect(card.opt('item') === payload.item).assertTrue();
      expect(card.opt('style') === payload.style).assertTrue();
      expect(card.opt('item').title.name).assertEqual("\u5361\u7247 1");
      expect(card.opt('style').width).assertEqual(":{{env(screen-width}}");
      expect(card.opt('sequence')).assertEqual(7);
      expect(card.opt('enabled')).assertEqual(false);
      expect(card.opt('amount')).assertEqual(3.5);
      expect(card.opt('tags')[0]).assertEqual("\u5361\u7247 1");
      expect(card.opt('tags')[1]).assertEqual("7");
      expect(card.opt('unknown-property')).assertUndefined();
      expect(card.getObjectId()).assertEqual(originalId);
      expect(card.type).assertEqual("test.card-style.7");
      expect(card.getObjectId().length > 0).assertTrue();
      payload.style.theme = 'contrast';
      expect(card.opt('style').theme).assertEqual('contrast');
      expect(card.opt('item').title.name).assertEqual("\u5361\u7247 1");
    });
  });
}
