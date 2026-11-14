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

// Reference: ets/test/Validation/DialogStateManagerValidation.test.ets
// Original line floor: 1128; scenario family: card-optional.
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

export default function OptionalPayloadTest(): void {
  describe('OptionalPayloadTest', () => {
    beforeAll(() => {
      logSuite('OptionalPayloadTest', 'begin');
    });
    beforeEach(async () => {
      // Yield between cases so device watchdog and UI events can be processed.
      await new Promise<void>((resolve) => { setTimeout(resolve, 1); });
    });
    afterAll(() => {
      logSuite('OptionalPayloadTest', 'end');
    });

    /**
     * @tc.name OptionalPayloadTest_case_001
     * @tc.desc card-optional: preserve payload semantics and stable identity; input vector 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('OptionalPayloadTest_case_001', 0, () => {
      const payload = makePayload("", "100%", 0);
      const model: DataModel = makeModel("test.card-optional.0", payload);
      const optionalModel: DataModel = { type: "test.card-optional.0" };
      const card = new CardData(optionalModel);
      const id = card.getObjectId();
      expect(card.data).assertUndefined();
      expect(card.opt("item")).assertUndefined();
      card.data = payload;
      expect(card.opt('item').title.name).assertEqual("");
      expect(card.opt('style').width).assertEqual("100%");
      card.data = undefined;
      expect(card.opt('item')).assertUndefined();
      expect(card.getObjectId()).assertEqual(id);
      expect(card.type).assertEqual("test.card-optional.0");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name OptionalPayloadTest_case_002
     * @tc.desc card-optional: preserve payload semantics and stable identity; input vector 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('OptionalPayloadTest_case_002', 0, () => {
      const payload = makePayload("Card", "0%", 1);
      const model: DataModel = makeModel("test.card-optional.1", payload);
      const optionalModel: DataModel = { type: "test.card-optional.1" };
      const card = new CardData(optionalModel);
      const id = card.getObjectId();
      expect(card.data).assertUndefined();
      expect(card.opt("style")).assertUndefined();
      card.data = payload;
      expect(card.opt('item').title.name).assertEqual("Card");
      expect(card.opt('style').width).assertEqual("0%");
      card.data = undefined;
      expect(card.opt('item')).assertUndefined();
      expect(card.getObjectId()).assertEqual(id);
      expect(card.type).assertEqual("test.card-optional.1");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name OptionalPayloadTest_case_003
     * @tc.desc card-optional: preserve payload semantics and stable identity; input vector 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('OptionalPayloadTest_case_003', 0, () => {
      const payload = makePayload(" ", "50%", 2);
      const model: DataModel = makeModel("test.card-optional.2", payload);
      const optionalModel: DataModel = { type: "test.card-optional.2" };
      const card = new CardData(optionalModel);
      const id = card.getObjectId();
      expect(card.data).assertUndefined();
      expect(card.opt("")).assertUndefined();
      card.data = payload;
      expect(card.opt('item').title.name).assertEqual(" ");
      expect(card.opt('style').width).assertEqual("50%");
      card.data = undefined;
      expect(card.opt('item')).assertUndefined();
      expect(card.getObjectId()).assertEqual(id);
      expect(card.type).assertEqual("test.card-optional.2");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name OptionalPayloadTest_case_004
     * @tc.desc card-optional: preserve payload semantics and stable identity; input vector 4.
     * @tc.type Function
     * @tc.level Level1
     */
    it('OptionalPayloadTest_case_004', 0, () => {
      const payload = makePayload("  padded  ", "1%", 3);
      const model: DataModel = makeModel("test.card-optional.3", payload);
      const optionalModel: DataModel = { type: "test.card-optional.3" };
      const card = new CardData(optionalModel);
      const id = card.getObjectId();
      expect(card.data).assertUndefined();
      expect(card.opt("missing")).assertUndefined();
      card.data = payload;
      expect(card.opt('item').title.name).assertEqual("  padded  ");
      expect(card.opt('style').width).assertEqual("1%");
      card.data = undefined;
      expect(card.opt('item')).assertUndefined();
      expect(card.getObjectId()).assertEqual(id);
      expect(card.type).assertEqual("test.card-optional.3");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name OptionalPayloadTest_case_005
     * @tc.desc card-optional: preserve payload semantics and stable identity; input vector 5.
     * @tc.type Function
     * @tc.level Level1
     */
    it('OptionalPayloadTest_case_005', 0, () => {
      const payload = makePayload("multi word title", "99%", 4);
      const model: DataModel = makeModel("test.card-optional.4", payload);
      const optionalModel: DataModel = { type: "test.card-optional.4" };
      const card = new CardData(optionalModel);
      const id = card.getObjectId();
      expect(card.data).assertUndefined();
      expect(card.opt("sequence")).assertUndefined();
      card.data = payload;
      expect(card.opt('item').title.name).assertEqual("multi word title");
      expect(card.opt('style').width).assertEqual("99%");
      card.data = undefined;
      expect(card.opt('item')).assertUndefined();
      expect(card.getObjectId()).assertEqual(id);
      expect(card.type).assertEqual("test.card-optional.4");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name OptionalPayloadTest_case_006
     * @tc.desc card-optional: preserve payload semantics and stable identity; input vector 6.
     * @tc.type Function
     * @tc.level Level1
     */
    it('OptionalPayloadTest_case_006', 0, () => {
      const payload = makePayload("line\nbreak", "75%", 5);
      const model: DataModel = makeModel("test.card-optional.5", payload);
      const optionalModel: DataModel = { type: "test.card-optional.5" };
      const card = new CardData(optionalModel);
      const id = card.getObjectId();
      expect(card.data).assertUndefined();
      expect(card.opt("item")).assertUndefined();
      card.data = payload;
      expect(card.opt('item').title.name).assertEqual("line\nbreak");
      expect(card.opt('style').width).assertEqual("75%");
      card.data = undefined;
      expect(card.opt('item')).assertUndefined();
      expect(card.getObjectId()).assertEqual(id);
      expect(card.type).assertEqual("test.card-optional.5");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name OptionalPayloadTest_case_007
     * @tc.desc card-optional: preserve payload semantics and stable identity; input vector 7.
     * @tc.type Function
     * @tc.level Level1
     */
    it('OptionalPayloadTest_case_007', 0, () => {
      const payload = makePayload("tab\tvalue", "", 6);
      const model: DataModel = makeModel("test.card-optional.6", payload);
      const optionalModel: DataModel = { type: "test.card-optional.6" };
      const card = new CardData(optionalModel);
      const id = card.getObjectId();
      expect(card.data).assertUndefined();
      expect(card.opt("style")).assertUndefined();
      card.data = payload;
      expect(card.opt('item').title.name).assertEqual("tab\tvalue");
      expect(card.opt('style').width).assertEqual("");
      card.data = undefined;
      expect(card.opt('item')).assertUndefined();
      expect(card.getObjectId()).assertEqual(id);
      expect(card.type).assertEqual("test.card-optional.6");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name OptionalPayloadTest_case_008
     * @tc.desc card-optional: preserve payload semantics and stable identity; input vector 8.
     * @tc.type Function
     * @tc.level Level1
     */
    it('OptionalPayloadTest_case_008', 0, () => {
      const payload = makePayload("\u5361\u7247 1", ":{{env(screen-width}}", 7);
      const model: DataModel = makeModel("test.card-optional.7", payload);
      const optionalModel: DataModel = { type: "test.card-optional.7" };
      const card = new CardData(optionalModel);
      const id = card.getObjectId();
      expect(card.data).assertUndefined();
      expect(card.opt("")).assertUndefined();
      card.data = payload;
      expect(card.opt('item').title.name).assertEqual("\u5361\u7247 1");
      expect(card.opt('style').width).assertEqual(":{{env(screen-width}}");
      card.data = undefined;
      expect(card.opt('item')).assertUndefined();
      expect(card.getObjectId()).assertEqual(id);
      expect(card.type).assertEqual("test.card-optional.7");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name OptionalPayloadTest_case_009
     * @tc.desc card-optional: preserve payload semantics and stable identity; input vector 9.
     * @tc.type Function
     * @tc.level Level1
     */
    it('OptionalPayloadTest_case_009', 0, () => {
      const payload = makePayload("\u5361\u7247 2", "100%", 8);
      const model: DataModel = makeModel("test.card-optional.8", payload);
      const optionalModel: DataModel = { type: "test.card-optional.8" };
      const card = new CardData(optionalModel);
      const id = card.getObjectId();
      expect(card.data).assertUndefined();
      expect(card.opt("missing")).assertUndefined();
      card.data = payload;
      expect(card.opt('item').title.name).assertEqual("\u5361\u7247 2");
      expect(card.opt('style').width).assertEqual("100%");
      card.data = undefined;
      expect(card.opt('item')).assertUndefined();
      expect(card.getObjectId()).assertEqual(id);
      expect(card.type).assertEqual("test.card-optional.8");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name OptionalPayloadTest_case_010
     * @tc.desc card-optional: preserve payload semantics and stable identity; input vector 10.
     * @tc.type Function
     * @tc.level Level1
     */
    it('OptionalPayloadTest_case_010', 0, () => {
      const payload = makePayload("\u5361\u7247 3", "0%", 9);
      const model: DataModel = makeModel("test.card-optional.9", payload);
      const optionalModel: DataModel = { type: "test.card-optional.9" };
      const card = new CardData(optionalModel);
      const id = card.getObjectId();
      expect(card.data).assertUndefined();
      expect(card.opt("sequence")).assertUndefined();
      card.data = payload;
      expect(card.opt('item').title.name).assertEqual("\u5361\u7247 3");
      expect(card.opt('style').width).assertEqual("0%");
      card.data = undefined;
      expect(card.opt('item')).assertUndefined();
      expect(card.getObjectId()).assertEqual(id);
      expect(card.type).assertEqual("test.card-optional.9");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name OptionalPayloadTest_case_011
     * @tc.desc card-optional: preserve payload semantics and stable identity; input vector 11.
     * @tc.type Function
     * @tc.level Level1
     */
    it('OptionalPayloadTest_case_011', 0, () => {
      const payload = makePayload("\u65e5\u672c\u8a9e", "50%", 10);
      const model: DataModel = makeModel("test.card-optional.10", payload);
      const optionalModel: DataModel = { type: "test.card-optional.10" };
      const card = new CardData(optionalModel);
      const id = card.getObjectId();
      expect(card.data).assertUndefined();
      expect(card.opt("item")).assertUndefined();
      card.data = payload;
      expect(card.opt('item').title.name).assertEqual("\u65e5\u672c\u8a9e");
      expect(card.opt('style').width).assertEqual("50%");
      card.data = undefined;
      expect(card.opt('item')).assertUndefined();
      expect(card.getObjectId()).assertEqual(id);
      expect(card.type).assertEqual("test.card-optional.10");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name OptionalPayloadTest_case_012
     * @tc.desc card-optional: preserve payload semantics and stable identity; input vector 12.
     * @tc.type Function
     * @tc.level Level1
     */
    it('OptionalPayloadTest_case_012', 0, () => {
      const payload = makePayload("\u0645\u0631\u062d\u0628\u0627", "1%", 11);
      const model: DataModel = makeModel("test.card-optional.11", payload);
      const optionalModel: DataModel = { type: "test.card-optional.11" };
      const card = new CardData(optionalModel);
      const id = card.getObjectId();
      expect(card.data).assertUndefined();
      expect(card.opt("style")).assertUndefined();
      card.data = payload;
      expect(card.opt('item').title.name).assertEqual("\u0645\u0631\u062d\u0628\u0627");
      expect(card.opt('style').width).assertEqual("1%");
      card.data = undefined;
      expect(card.opt('item')).assertUndefined();
      expect(card.getObjectId()).assertEqual(id);
      expect(card.type).assertEqual("test.card-optional.11");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name OptionalPayloadTest_case_013
     * @tc.desc card-optional: preserve payload semantics and stable identity; input vector 13.
     * @tc.type Function
     * @tc.level Level1
     */
    it('OptionalPayloadTest_case_013', 0, () => {
      const payload = makePayload("\u05e9\u05dc\u05d5\u05dd", "99%", 12);
      const model: DataModel = makeModel("test.card-optional.12", payload);
      const optionalModel: DataModel = { type: "test.card-optional.12" };
      const card = new CardData(optionalModel);
      const id = card.getObjectId();
      expect(card.data).assertUndefined();
      expect(card.opt("")).assertUndefined();
      card.data = payload;
      expect(card.opt('item').title.name).assertEqual("\u05e9\u05dc\u05d5\u05dd");
      expect(card.opt('style').width).assertEqual("99%");
      card.data = undefined;
      expect(card.opt('item')).assertUndefined();
      expect(card.getObjectId()).assertEqual(id);
      expect(card.type).assertEqual("test.card-optional.12");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name OptionalPayloadTest_case_014
     * @tc.desc card-optional: preserve payload semantics and stable identity; input vector 14.
     * @tc.type Function
     * @tc.level Level1
     */
    it('OptionalPayloadTest_case_014', 0, () => {
      const payload = makePayload("e\u0301", "75%", 13);
      const model: DataModel = makeModel("test.card-optional.13", payload);
      const optionalModel: DataModel = { type: "test.card-optional.13" };
      const card = new CardData(optionalModel);
      const id = card.getObjectId();
      expect(card.data).assertUndefined();
      expect(card.opt("missing")).assertUndefined();
      card.data = payload;
      expect(card.opt('item').title.name).assertEqual("e\u0301");
      expect(card.opt('style').width).assertEqual("75%");
      card.data = undefined;
      expect(card.opt('item')).assertUndefined();
      expect(card.getObjectId()).assertEqual(id);
      expect(card.type).assertEqual("test.card-optional.13");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name OptionalPayloadTest_case_015
     * @tc.desc card-optional: preserve payload semantics and stable identity; input vector 15.
     * @tc.type Function
     * @tc.level Level1
     */
    it('OptionalPayloadTest_case_015', 0, () => {
      const payload = makePayload("\u00e9", "", 14);
      const model: DataModel = makeModel("test.card-optional.14", payload);
      const optionalModel: DataModel = { type: "test.card-optional.14" };
      const card = new CardData(optionalModel);
      const id = card.getObjectId();
      expect(card.data).assertUndefined();
      expect(card.opt("sequence")).assertUndefined();
      card.data = payload;
      expect(card.opt('item').title.name).assertEqual("\u00e9");
      expect(card.opt('style').width).assertEqual("");
      card.data = undefined;
      expect(card.opt('item')).assertUndefined();
      expect(card.getObjectId()).assertEqual(id);
      expect(card.type).assertEqual("test.card-optional.14");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name OptionalPayloadTest_case_016
     * @tc.desc card-optional: preserve payload semantics and stable identity; input vector 16.
     * @tc.type Function
     * @tc.level Level1
     */
    it('OptionalPayloadTest_case_016', 0, () => {
      const payload = makePayload("\ud83d\ude80", ":{{env(screen-width}}", 15);
      const model: DataModel = makeModel("test.card-optional.15", payload);
      const optionalModel: DataModel = { type: "test.card-optional.15" };
      const card = new CardData(optionalModel);
      const id = card.getObjectId();
      expect(card.data).assertUndefined();
      expect(card.opt("item")).assertUndefined();
      card.data = payload;
      expect(card.opt('item').title.name).assertEqual("\ud83d\ude80");
      expect(card.opt('style').width).assertEqual(":{{env(screen-width}}");
      card.data = undefined;
      expect(card.opt('item')).assertUndefined();
      expect(card.getObjectId()).assertEqual(id);
      expect(card.type).assertEqual("test.card-optional.15");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name OptionalPayloadTest_case_017
     * @tc.desc card-optional: preserve payload semantics and stable identity; input vector 17.
     * @tc.type Function
     * @tc.level Level1
     */
    it('OptionalPayloadTest_case_017', 0, () => {
      const payload = makePayload("quote\"slash\\", "100%", 16);
      const model: DataModel = makeModel("test.card-optional.16", payload);
      const optionalModel: DataModel = { type: "test.card-optional.16" };
      const card = new CardData(optionalModel);
      const id = card.getObjectId();
      expect(card.data).assertUndefined();
      expect(card.opt("style")).assertUndefined();
      card.data = payload;
      expect(card.opt('item').title.name).assertEqual("quote\"slash\\");
      expect(card.opt('style').width).assertEqual("100%");
      card.data = undefined;
      expect(card.opt('item')).assertUndefined();
      expect(card.getObjectId()).assertEqual(id);
      expect(card.type).assertEqual("test.card-optional.16");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name OptionalPayloadTest_case_018
     * @tc.desc card-optional: preserve payload semantics and stable identity; input vector 18.
     * @tc.type Function
     * @tc.level Level1
     */
    it('OptionalPayloadTest_case_018', 0, () => {
      const payload = makePayload("<script>alert(1)</script>", "0%", 17);
      const model: DataModel = makeModel("test.card-optional.17", payload);
      const optionalModel: DataModel = { type: "test.card-optional.17" };
      const card = new CardData(optionalModel);
      const id = card.getObjectId();
      expect(card.data).assertUndefined();
      expect(card.opt("")).assertUndefined();
      card.data = payload;
      expect(card.opt('item').title.name).assertEqual("<script>alert(1)</script>");
      expect(card.opt('style').width).assertEqual("0%");
      card.data = undefined;
      expect(card.opt('item')).assertUndefined();
      expect(card.getObjectId()).assertEqual(id);
      expect(card.type).assertEqual("test.card-optional.17");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name OptionalPayloadTest_case_019
     * @tc.desc card-optional: preserve payload semantics and stable identity; input vector 19.
     * @tc.type Function
     * @tc.level Level1
     */
    it('OptionalPayloadTest_case_019', 0, () => {
      const payload = makePayload("${notExecuted}", "50%", 18);
      const model: DataModel = makeModel("test.card-optional.18", payload);
      const optionalModel: DataModel = { type: "test.card-optional.18" };
      const card = new CardData(optionalModel);
      const id = card.getObjectId();
      expect(card.data).assertUndefined();
      expect(card.opt("missing")).assertUndefined();
      card.data = payload;
      expect(card.opt('item').title.name).assertEqual("${notExecuted}");
      expect(card.opt('style').width).assertEqual("50%");
      card.data = undefined;
      expect(card.opt('item')).assertUndefined();
      expect(card.getObjectId()).assertEqual(id);
      expect(card.type).assertEqual("test.card-optional.18");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name OptionalPayloadTest_case_020
     * @tc.desc card-optional: preserve payload semantics and stable identity; input vector 20.
     * @tc.type Function
     * @tc.level Level1
     */
    it('OptionalPayloadTest_case_020', 0, () => {
      const payload = makePayload("__proto__", "1%", 19);
      const model: DataModel = makeModel("test.card-optional.19", payload);
      const optionalModel: DataModel = { type: "test.card-optional.19" };
      const card = new CardData(optionalModel);
      const id = card.getObjectId();
      expect(card.data).assertUndefined();
      expect(card.opt("sequence")).assertUndefined();
      card.data = payload;
      expect(card.opt('item').title.name).assertEqual("__proto__");
      expect(card.opt('style').width).assertEqual("1%");
      card.data = undefined;
      expect(card.opt('item')).assertUndefined();
      expect(card.getObjectId()).assertEqual(id);
      expect(card.type).assertEqual("test.card-optional.19");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name OptionalPayloadTest_case_021
     * @tc.desc card-optional: preserve payload semantics and stable identity; input vector 21.
     * @tc.type Function
     * @tc.level Level1
     */
    it('OptionalPayloadTest_case_021', 0, () => {
      const payload = makePayload("constructor", "99%", 20);
      const model: DataModel = makeModel("test.card-optional.20", payload);
      const optionalModel: DataModel = { type: "test.card-optional.20" };
      const card = new CardData(optionalModel);
      const id = card.getObjectId();
      expect(card.data).assertUndefined();
      expect(card.opt("item")).assertUndefined();
      card.data = payload;
      expect(card.opt('item').title.name).assertEqual("constructor");
      expect(card.opt('style').width).assertEqual("99%");
      card.data = undefined;
      expect(card.opt('item')).assertUndefined();
      expect(card.getObjectId()).assertEqual(id);
      expect(card.type).assertEqual("test.card-optional.20");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name OptionalPayloadTest_case_022
     * @tc.desc card-optional: preserve payload semantics and stable identity; input vector 22.
     * @tc.type Function
     * @tc.level Level1
     */
    it('OptionalPayloadTest_case_022', 0, () => {
      const payload = makePayload("null", "75%", 21);
      const model: DataModel = makeModel("test.card-optional.21", payload);
      const optionalModel: DataModel = { type: "test.card-optional.21" };
      const card = new CardData(optionalModel);
      const id = card.getObjectId();
      expect(card.data).assertUndefined();
      expect(card.opt("style")).assertUndefined();
      card.data = payload;
      expect(card.opt('item').title.name).assertEqual("null");
      expect(card.opt('style').width).assertEqual("75%");
      card.data = undefined;
      expect(card.opt('item')).assertUndefined();
      expect(card.getObjectId()).assertEqual(id);
      expect(card.type).assertEqual("test.card-optional.21");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name OptionalPayloadTest_case_023
     * @tc.desc card-optional: preserve payload semantics and stable identity; input vector 23.
     * @tc.type Function
     * @tc.level Level1
     */
    it('OptionalPayloadTest_case_023', 0, () => {
      const payload = makePayload("false", "", 22);
      const model: DataModel = makeModel("test.card-optional.22", payload);
      const optionalModel: DataModel = { type: "test.card-optional.22" };
      const card = new CardData(optionalModel);
      const id = card.getObjectId();
      expect(card.data).assertUndefined();
      expect(card.opt("")).assertUndefined();
      card.data = payload;
      expect(card.opt('item').title.name).assertEqual("false");
      expect(card.opt('style').width).assertEqual("");
      card.data = undefined;
      expect(card.opt('item')).assertUndefined();
      expect(card.getObjectId()).assertEqual(id);
      expect(card.type).assertEqual("test.card-optional.22");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name OptionalPayloadTest_case_024
     * @tc.desc card-optional: preserve payload semantics and stable identity; input vector 24.
     * @tc.type Function
     * @tc.level Level1
     */
    it('OptionalPayloadTest_case_024', 0, () => {
      const payload = makePayload("0", ":{{env(screen-width}}", 23);
      const model: DataModel = makeModel("test.card-optional.23", payload);
      const optionalModel: DataModel = { type: "test.card-optional.23" };
      const card = new CardData(optionalModel);
      const id = card.getObjectId();
      expect(card.data).assertUndefined();
      expect(card.opt("missing")).assertUndefined();
      card.data = payload;
      expect(card.opt('item').title.name).assertEqual("0");
      expect(card.opt('style').width).assertEqual(":{{env(screen-width}}");
      card.data = undefined;
      expect(card.opt('item')).assertUndefined();
      expect(card.getObjectId()).assertEqual(id);
      expect(card.type).assertEqual("test.card-optional.23");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name OptionalPayloadTest_case_025
     * @tc.desc card-optional: preserve payload semantics and stable identity; input vector 25.
     * @tc.type Function
     * @tc.level Level1
     */
    it('OptionalPayloadTest_case_025', 0, () => {
      const payload = makePayload("100%", "100%", 24);
      const model: DataModel = makeModel("test.card-optional.24", payload);
      const optionalModel: DataModel = { type: "test.card-optional.24" };
      const card = new CardData(optionalModel);
      const id = card.getObjectId();
      expect(card.data).assertUndefined();
      expect(card.opt("sequence")).assertUndefined();
      card.data = payload;
      expect(card.opt('item').title.name).assertEqual("100%");
      expect(card.opt('style').width).assertEqual("100%");
      card.data = undefined;
      expect(card.opt('item')).assertUndefined();
      expect(card.getObjectId()).assertEqual(id);
      expect(card.type).assertEqual("test.card-optional.24");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name OptionalPayloadTest_case_026
     * @tc.desc card-optional: preserve payload semantics and stable identity; input vector 26.
     * @tc.type Function
     * @tc.level Level1
     */
    it('OptionalPayloadTest_case_026', 0, () => {
      const payload = makePayload("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA", "0%", 25);
      const model: DataModel = makeModel("test.card-optional.25", payload);
      const optionalModel: DataModel = { type: "test.card-optional.25" };
      const card = new CardData(optionalModel);
      const id = card.getObjectId();
      expect(card.data).assertUndefined();
      expect(card.opt("item")).assertUndefined();
      card.data = payload;
      expect(card.opt('item').title.name).assertEqual("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA");
      expect(card.opt('style').width).assertEqual("0%");
      card.data = undefined;
      expect(card.opt('item')).assertUndefined();
      expect(card.getObjectId()).assertEqual(id);
      expect(card.type).assertEqual("test.card-optional.25");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name OptionalPayloadTest_case_027
     * @tc.desc card-optional: preserve payload semantics and stable identity; input vector 27.
     * @tc.type Function
     * @tc.level Level1
     */
    it('OptionalPayloadTest_case_027', 0, () => {
      const payload = makePayload("\u0000", "50%", 26);
      const model: DataModel = makeModel("test.card-optional.26", payload);
      const optionalModel: DataModel = { type: "test.card-optional.26" };
      const card = new CardData(optionalModel);
      const id = card.getObjectId();
      expect(card.data).assertUndefined();
      expect(card.opt("style")).assertUndefined();
      card.data = payload;
      expect(card.opt('item').title.name).assertEqual("\u0000");
      expect(card.opt('style').width).assertEqual("50%");
      card.data = undefined;
      expect(card.opt('item')).assertUndefined();
      expect(card.getObjectId()).assertEqual(id);
      expect(card.type).assertEqual("test.card-optional.26");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name OptionalPayloadTest_case_028
     * @tc.desc card-optional: preserve payload semantics and stable identity; input vector 28.
     * @tc.type Function
     * @tc.level Level1
     */
    it('OptionalPayloadTest_case_028', 0, () => {
      const payload = makePayload("\u2028", "1%", 27);
      const model: DataModel = makeModel("test.card-optional.27", payload);
      const optionalModel: DataModel = { type: "test.card-optional.27" };
      const card = new CardData(optionalModel);
      const id = card.getObjectId();
      expect(card.data).assertUndefined();
      expect(card.opt("")).assertUndefined();
      card.data = payload;
      expect(card.opt('item').title.name).assertEqual("\u2028");
      expect(card.opt('style').width).assertEqual("1%");
      card.data = undefined;
      expect(card.opt('item')).assertUndefined();
      expect(card.getObjectId()).assertEqual(id);
      expect(card.type).assertEqual("test.card-optional.27");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name OptionalPayloadTest_case_029
     * @tc.desc card-optional: preserve payload semantics and stable identity; input vector 29.
     * @tc.type Function
     * @tc.level Level1
     */
    it('OptionalPayloadTest_case_029', 0, () => {
      const payload = makePayload("\u2029", "99%", 28);
      const model: DataModel = makeModel("test.card-optional.28", payload);
      const optionalModel: DataModel = { type: "test.card-optional.28" };
      const card = new CardData(optionalModel);
      const id = card.getObjectId();
      expect(card.data).assertUndefined();
      expect(card.opt("missing")).assertUndefined();
      card.data = payload;
      expect(card.opt('item').title.name).assertEqual("\u2029");
      expect(card.opt('style').width).assertEqual("99%");
      card.data = undefined;
      expect(card.opt('item')).assertUndefined();
      expect(card.getObjectId()).assertEqual(id);
      expect(card.type).assertEqual("test.card-optional.28");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name OptionalPayloadTest_case_030
     * @tc.desc card-optional: preserve payload semantics and stable identity; input vector 30.
     * @tc.type Function
     * @tc.level Level1
     */
    it('OptionalPayloadTest_case_030', 0, () => {
      const payload = makePayload("\r\n", "75%", 29);
      const model: DataModel = makeModel("test.card-optional.29", payload);
      const optionalModel: DataModel = { type: "test.card-optional.29" };
      const card = new CardData(optionalModel);
      const id = card.getObjectId();
      expect(card.data).assertUndefined();
      expect(card.opt("sequence")).assertUndefined();
      card.data = payload;
      expect(card.opt('item').title.name).assertEqual("\r\n");
      expect(card.opt('style').width).assertEqual("75%");
      card.data = undefined;
      expect(card.opt('item')).assertUndefined();
      expect(card.getObjectId()).assertEqual(id);
      expect(card.type).assertEqual("test.card-optional.29");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name OptionalPayloadTest_case_031
     * @tc.desc card-optional: preserve payload semantics and stable identity; input vector 31.
     * @tc.type Function
     * @tc.level Level1
     */
    it('OptionalPayloadTest_case_031', 0, () => {
      const payload = makePayload("\ud83d\udc69\u200d\ud83d\udcbb", "", 30);
      const model: DataModel = makeModel("test.card-optional.30", payload);
      const optionalModel: DataModel = { type: "test.card-optional.30" };
      const card = new CardData(optionalModel);
      const id = card.getObjectId();
      expect(card.data).assertUndefined();
      expect(card.opt("item")).assertUndefined();
      card.data = payload;
      expect(card.opt('item').title.name).assertEqual("\ud83d\udc69\u200d\ud83d\udcbb");
      expect(card.opt('style').width).assertEqual("");
      card.data = undefined;
      expect(card.opt('item')).assertUndefined();
      expect(card.getObjectId()).assertEqual(id);
      expect(card.type).assertEqual("test.card-optional.30");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name OptionalPayloadTest_case_032
     * @tc.desc card-optional: preserve payload semantics and stable identity; input vector 32.
     * @tc.type Function
     * @tc.level Level1
     */
    it('OptionalPayloadTest_case_032', 0, () => {
      const payload = makePayload("end.", ":{{env(screen-width}}", 31);
      const model: DataModel = makeModel("test.card-optional.31", payload);
      const optionalModel: DataModel = { type: "test.card-optional.31" };
      const card = new CardData(optionalModel);
      const id = card.getObjectId();
      expect(card.data).assertUndefined();
      expect(card.opt("style")).assertUndefined();
      card.data = payload;
      expect(card.opt('item').title.name).assertEqual("end.");
      expect(card.opt('style').width).assertEqual(":{{env(screen-width}}");
      card.data = undefined;
      expect(card.opt('item')).assertUndefined();
      expect(card.getObjectId()).assertEqual(id);
      expect(card.type).assertEqual("test.card-optional.31");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name OptionalPayloadTest_case_033
     * @tc.desc card-optional: preserve payload semantics and stable identity; input vector 33.
     * @tc.type Function
     * @tc.level Level1
     */
    it('OptionalPayloadTest_case_033', 0, () => {
      const payload = makePayload("", "100%", 32);
      const model: DataModel = makeModel("test.card-optional.32", payload);
      const optionalModel: DataModel = { type: "test.card-optional.32" };
      const card = new CardData(optionalModel);
      const id = card.getObjectId();
      expect(card.data).assertUndefined();
      expect(card.opt("")).assertUndefined();
      card.data = payload;
      expect(card.opt('item').title.name).assertEqual("");
      expect(card.opt('style').width).assertEqual("100%");
      card.data = undefined;
      expect(card.opt('item')).assertUndefined();
      expect(card.getObjectId()).assertEqual(id);
      expect(card.type).assertEqual("test.card-optional.32");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name OptionalPayloadTest_case_034
     * @tc.desc card-optional: preserve payload semantics and stable identity; input vector 34.
     * @tc.type Function
     * @tc.level Level1
     */
    it('OptionalPayloadTest_case_034', 0, () => {
      const payload = makePayload("Card", "0%", 33);
      const model: DataModel = makeModel("test.card-optional.33", payload);
      const optionalModel: DataModel = { type: "test.card-optional.33" };
      const card = new CardData(optionalModel);
      const id = card.getObjectId();
      expect(card.data).assertUndefined();
      expect(card.opt("missing")).assertUndefined();
      card.data = payload;
      expect(card.opt('item').title.name).assertEqual("Card");
      expect(card.opt('style').width).assertEqual("0%");
      card.data = undefined;
      expect(card.opt('item')).assertUndefined();
      expect(card.getObjectId()).assertEqual(id);
      expect(card.type).assertEqual("test.card-optional.33");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name OptionalPayloadTest_case_035
     * @tc.desc card-optional: preserve payload semantics and stable identity; input vector 35.
     * @tc.type Function
     * @tc.level Level1
     */
    it('OptionalPayloadTest_case_035', 0, () => {
      const payload = makePayload(" ", "50%", 34);
      const model: DataModel = makeModel("test.card-optional.34", payload);
      const optionalModel: DataModel = { type: "test.card-optional.34" };
      const card = new CardData(optionalModel);
      const id = card.getObjectId();
      expect(card.data).assertUndefined();
      expect(card.opt("sequence")).assertUndefined();
      card.data = payload;
      expect(card.opt('item').title.name).assertEqual(" ");
      expect(card.opt('style').width).assertEqual("50%");
      card.data = undefined;
      expect(card.opt('item')).assertUndefined();
      expect(card.getObjectId()).assertEqual(id);
      expect(card.type).assertEqual("test.card-optional.34");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name OptionalPayloadTest_case_036
     * @tc.desc card-optional: preserve payload semantics and stable identity; input vector 36.
     * @tc.type Function
     * @tc.level Level1
     */
    it('OptionalPayloadTest_case_036', 0, () => {
      const payload = makePayload("  padded  ", "1%", 35);
      const model: DataModel = makeModel("test.card-optional.35", payload);
      const optionalModel: DataModel = { type: "test.card-optional.35" };
      const card = new CardData(optionalModel);
      const id = card.getObjectId();
      expect(card.data).assertUndefined();
      expect(card.opt("item")).assertUndefined();
      card.data = payload;
      expect(card.opt('item').title.name).assertEqual("  padded  ");
      expect(card.opt('style').width).assertEqual("1%");
      card.data = undefined;
      expect(card.opt('item')).assertUndefined();
      expect(card.getObjectId()).assertEqual(id);
      expect(card.type).assertEqual("test.card-optional.35");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name OptionalPayloadTest_case_037
     * @tc.desc card-optional: preserve payload semantics and stable identity; input vector 37.
     * @tc.type Function
     * @tc.level Level1
     */
    it('OptionalPayloadTest_case_037', 0, () => {
      const payload = makePayload("multi word title", "99%", 36);
      const model: DataModel = makeModel("test.card-optional.36", payload);
      const optionalModel: DataModel = { type: "test.card-optional.36" };
      const card = new CardData(optionalModel);
      const id = card.getObjectId();
      expect(card.data).assertUndefined();
      expect(card.opt("style")).assertUndefined();
      card.data = payload;
      expect(card.opt('item').title.name).assertEqual("multi word title");
      expect(card.opt('style').width).assertEqual("99%");
      card.data = undefined;
      expect(card.opt('item')).assertUndefined();
      expect(card.getObjectId()).assertEqual(id);
      expect(card.type).assertEqual("test.card-optional.36");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name OptionalPayloadTest_case_038
     * @tc.desc card-optional: preserve payload semantics and stable identity; input vector 38.
     * @tc.type Function
     * @tc.level Level1
     */
    it('OptionalPayloadTest_case_038', 0, () => {
      const payload = makePayload("line\nbreak", "75%", 37);
      const model: DataModel = makeModel("test.card-optional.37", payload);
      const optionalModel: DataModel = { type: "test.card-optional.37" };
      const card = new CardData(optionalModel);
      const id = card.getObjectId();
      expect(card.data).assertUndefined();
      expect(card.opt("")).assertUndefined();
      card.data = payload;
      expect(card.opt('item').title.name).assertEqual("line\nbreak");
      expect(card.opt('style').width).assertEqual("75%");
      card.data = undefined;
      expect(card.opt('item')).assertUndefined();
      expect(card.getObjectId()).assertEqual(id);
      expect(card.type).assertEqual("test.card-optional.37");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name OptionalPayloadTest_case_039
     * @tc.desc card-optional: preserve payload semantics and stable identity; input vector 39.
     * @tc.type Function
     * @tc.level Level1
     */
    it('OptionalPayloadTest_case_039', 0, () => {
      const payload = makePayload("tab\tvalue", "", 38);
      const model: DataModel = makeModel("test.card-optional.38", payload);
      const optionalModel: DataModel = { type: "test.card-optional.38" };
      const card = new CardData(optionalModel);
      const id = card.getObjectId();
      expect(card.data).assertUndefined();
      expect(card.opt("missing")).assertUndefined();
      card.data = payload;
      expect(card.opt('item').title.name).assertEqual("tab\tvalue");
      expect(card.opt('style').width).assertEqual("");
      card.data = undefined;
      expect(card.opt('item')).assertUndefined();
      expect(card.getObjectId()).assertEqual(id);
      expect(card.type).assertEqual("test.card-optional.38");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name OptionalPayloadTest_case_040
     * @tc.desc card-optional: preserve payload semantics and stable identity; input vector 40.
     * @tc.type Function
     * @tc.level Level1
     */
    it('OptionalPayloadTest_case_040', 0, () => {
      const payload = makePayload("\u5361\u7247 1", ":{{env(screen-width}}", 39);
      const model: DataModel = makeModel("test.card-optional.39", payload);
      const optionalModel: DataModel = { type: "test.card-optional.39" };
      const card = new CardData(optionalModel);
      const id = card.getObjectId();
      expect(card.data).assertUndefined();
      expect(card.opt("sequence")).assertUndefined();
      card.data = payload;
      expect(card.opt('item').title.name).assertEqual("\u5361\u7247 1");
      expect(card.opt('style').width).assertEqual(":{{env(screen-width}}");
      card.data = undefined;
      expect(card.opt('item')).assertUndefined();
      expect(card.getObjectId()).assertEqual(id);
      expect(card.type).assertEqual("test.card-optional.39");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name OptionalPayloadTest_case_041
     * @tc.desc card-optional: preserve payload semantics and stable identity; input vector 41.
     * @tc.type Function
     * @tc.level Level1
     */
    it('OptionalPayloadTest_case_041', 0, () => {
      const payload = makePayload("\u5361\u7247 2", "100%", 40);
      const model: DataModel = makeModel("test.card-optional.40", payload);
      const optionalModel: DataModel = { type: "test.card-optional.40" };
      const card = new CardData(optionalModel);
      const id = card.getObjectId();
      expect(card.data).assertUndefined();
      expect(card.opt("item")).assertUndefined();
      card.data = payload;
      expect(card.opt('item').title.name).assertEqual("\u5361\u7247 2");
      expect(card.opt('style').width).assertEqual("100%");
      card.data = undefined;
      expect(card.opt('item')).assertUndefined();
      expect(card.getObjectId()).assertEqual(id);
      expect(card.type).assertEqual("test.card-optional.40");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name OptionalPayloadTest_case_042
     * @tc.desc card-optional: preserve payload semantics and stable identity; input vector 42.
     * @tc.type Function
     * @tc.level Level1
     */
    it('OptionalPayloadTest_case_042', 0, () => {
      const payload = makePayload("\u5361\u7247 3", "0%", 41);
      const model: DataModel = makeModel("test.card-optional.41", payload);
      const optionalModel: DataModel = { type: "test.card-optional.41" };
      const card = new CardData(optionalModel);
      const id = card.getObjectId();
      expect(card.data).assertUndefined();
      expect(card.opt("style")).assertUndefined();
      card.data = payload;
      expect(card.opt('item').title.name).assertEqual("\u5361\u7247 3");
      expect(card.opt('style').width).assertEqual("0%");
      card.data = undefined;
      expect(card.opt('item')).assertUndefined();
      expect(card.getObjectId()).assertEqual(id);
      expect(card.type).assertEqual("test.card-optional.41");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name OptionalPayloadTest_case_043
     * @tc.desc card-optional: preserve payload semantics and stable identity; input vector 43.
     * @tc.type Function
     * @tc.level Level1
     */
    it('OptionalPayloadTest_case_043', 0, () => {
      const payload = makePayload("\u65e5\u672c\u8a9e", "50%", 42);
      const model: DataModel = makeModel("test.card-optional.42", payload);
      const optionalModel: DataModel = { type: "test.card-optional.42" };
      const card = new CardData(optionalModel);
      const id = card.getObjectId();
      expect(card.data).assertUndefined();
      expect(card.opt("")).assertUndefined();
      card.data = payload;
      expect(card.opt('item').title.name).assertEqual("\u65e5\u672c\u8a9e");
      expect(card.opt('style').width).assertEqual("50%");
      card.data = undefined;
      expect(card.opt('item')).assertUndefined();
      expect(card.getObjectId()).assertEqual(id);
      expect(card.type).assertEqual("test.card-optional.42");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name OptionalPayloadTest_case_044
     * @tc.desc card-optional: preserve payload semantics and stable identity; input vector 44.
     * @tc.type Function
     * @tc.level Level1
     */
    it('OptionalPayloadTest_case_044', 0, () => {
      const payload = makePayload("\u0645\u0631\u062d\u0628\u0627", "1%", 43);
      const model: DataModel = makeModel("test.card-optional.43", payload);
      const optionalModel: DataModel = { type: "test.card-optional.43" };
      const card = new CardData(optionalModel);
      const id = card.getObjectId();
      expect(card.data).assertUndefined();
      expect(card.opt("missing")).assertUndefined();
      card.data = payload;
      expect(card.opt('item').title.name).assertEqual("\u0645\u0631\u062d\u0628\u0627");
      expect(card.opt('style').width).assertEqual("1%");
      card.data = undefined;
      expect(card.opt('item')).assertUndefined();
      expect(card.getObjectId()).assertEqual(id);
      expect(card.type).assertEqual("test.card-optional.43");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name OptionalPayloadTest_case_045
     * @tc.desc card-optional: preserve payload semantics and stable identity; input vector 45.
     * @tc.type Function
     * @tc.level Level1
     */
    it('OptionalPayloadTest_case_045', 0, () => {
      const payload = makePayload("\u05e9\u05dc\u05d5\u05dd", "99%", 44);
      const model: DataModel = makeModel("test.card-optional.44", payload);
      const optionalModel: DataModel = { type: "test.card-optional.44" };
      const card = new CardData(optionalModel);
      const id = card.getObjectId();
      expect(card.data).assertUndefined();
      expect(card.opt("sequence")).assertUndefined();
      card.data = payload;
      expect(card.opt('item').title.name).assertEqual("\u05e9\u05dc\u05d5\u05dd");
      expect(card.opt('style').width).assertEqual("99%");
      card.data = undefined;
      expect(card.opt('item')).assertUndefined();
      expect(card.getObjectId()).assertEqual(id);
      expect(card.type).assertEqual("test.card-optional.44");
      expect(card.getObjectId().length > 0).assertTrue();
    });
  });
}
