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

// Reference: ets/test/Validation/KeyCodeValidation.test.ets
// Original line floor: 1353; scenario family: card-keys.
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

export default function PropertyKeysTest(): void {
  describe('PropertyKeysTest', () => {
    beforeAll(() => {
      logSuite('PropertyKeysTest', 'begin');
    });
    beforeEach(async () => {
      // Yield between cases so device watchdog and UI events can be processed.
      await new Promise<void>((resolve) => { setTimeout(resolve, 1); });
    });
    afterAll(() => {
      logSuite('PropertyKeysTest', 'end');
    });

    /**
     * @tc.name PropertyKeysTest_case_001
     * @tc.desc card-keys: preserve payload semantics and stable identity; input vector 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PropertyKeysTest_case_001', 0, () => {
      const payload = makePayload("", "100%", 0);
      const model: DataModel = makeModel("test.card-keys.0", payload);
      const objectModel: DataModel = { type: "test.card-keys.0", data: JSON.parse("{\"plain\":null,\"marker\":0}") };
      const card = new CardData(objectModel);
      const originalId = card.getObjectId();
      const encodedValue = JSON.stringify(card.opt("plain"));
      expect(encodedValue).assertEqual("null");
      expect(card.opt('marker')).assertEqual(0);
      expect(card.opt('absent-test-property')).assertUndefined();
      const second = new CardData(objectModel);
      expect(JSON.stringify(second.opt("plain"))).assertEqual("null");
      expect(second.getObjectId() === originalId).assertFalse();
      expect(card.getObjectId()).assertEqual(originalId);
      expect(JSON.stringify(card.data)).assertEqual("{\"plain\":null,\"marker\":0}");
      expect(card.type).assertEqual("test.card-keys.0");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name PropertyKeysTest_case_002
     * @tc.desc card-keys: preserve payload semantics and stable identity; input vector 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PropertyKeysTest_case_002', 0, () => {
      const payload = makePayload("Card", "0%", 1);
      const model: DataModel = makeModel("test.card-keys.1", payload);
      const objectModel: DataModel = { type: "test.card-keys.1", data: JSON.parse("{\"\":null,\"marker\":1}") };
      const card = new CardData(objectModel);
      const originalId = card.getObjectId();
      const encodedValue = JSON.stringify(card.opt(""));
      expect(encodedValue).assertEqual("null");
      expect(card.opt('marker')).assertEqual(1);
      expect(card.opt('absent-test-property')).assertUndefined();
      const second = new CardData(objectModel);
      expect(JSON.stringify(second.opt(""))).assertEqual("null");
      expect(second.getObjectId() === originalId).assertFalse();
      expect(card.getObjectId()).assertEqual(originalId);
      expect(JSON.stringify(card.data)).assertEqual("{\"\":null,\"marker\":1}");
      expect(card.type).assertEqual("test.card-keys.1");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name PropertyKeysTest_case_003
     * @tc.desc card-keys: preserve payload semantics and stable identity; input vector 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PropertyKeysTest_case_003', 0, () => {
      const payload = makePayload(" ", "50%", 2);
      const model: DataModel = makeModel("test.card-keys.2", payload);
      const objectModel: DataModel = { type: "test.card-keys.2", data: JSON.parse("{\"__proto__\":null,\"marker\":2}") };
      const card = new CardData(objectModel);
      const originalId = card.getObjectId();
      const encodedValue = JSON.stringify(card.opt("__proto__"));
      expect(encodedValue).assertEqual("null");
      expect(card.opt('marker')).assertEqual(2);
      expect(card.opt('absent-test-property')).assertUndefined();
      const second = new CardData(objectModel);
      expect(JSON.stringify(second.opt("__proto__"))).assertEqual("null");
      expect(second.getObjectId() === originalId).assertFalse();
      expect(card.getObjectId()).assertEqual(originalId);
      expect(JSON.stringify(card.data)).assertEqual("{\"__proto__\":null,\"marker\":2}");
      expect(card.type).assertEqual("test.card-keys.2");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name PropertyKeysTest_case_004
     * @tc.desc card-keys: preserve payload semantics and stable identity; input vector 4.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PropertyKeysTest_case_004', 0, () => {
      const payload = makePayload("  padded  ", "1%", 3);
      const model: DataModel = makeModel("test.card-keys.3", payload);
      const objectModel: DataModel = { type: "test.card-keys.3", data: JSON.parse("{\"constructor\":null,\"marker\":3}") };
      const card = new CardData(objectModel);
      const originalId = card.getObjectId();
      const encodedValue = JSON.stringify(card.opt("constructor"));
      expect(encodedValue).assertEqual("null");
      expect(card.opt('marker')).assertEqual(3);
      expect(card.opt('absent-test-property')).assertUndefined();
      const second = new CardData(objectModel);
      expect(JSON.stringify(second.opt("constructor"))).assertEqual("null");
      expect(second.getObjectId() === originalId).assertFalse();
      expect(card.getObjectId()).assertEqual(originalId);
      expect(JSON.stringify(card.data)).assertEqual("{\"constructor\":null,\"marker\":3}");
      expect(card.type).assertEqual("test.card-keys.3");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name PropertyKeysTest_case_005
     * @tc.desc card-keys: preserve payload semantics and stable identity; input vector 5.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PropertyKeysTest_case_005', 0, () => {
      const payload = makePayload("multi word title", "99%", 4);
      const model: DataModel = makeModel("test.card-keys.4", payload);
      const objectModel: DataModel = { type: "test.card-keys.4", data: JSON.parse("{\"toString\":null,\"marker\":4}") };
      const card = new CardData(objectModel);
      const originalId = card.getObjectId();
      const encodedValue = JSON.stringify(card.opt("toString"));
      expect(encodedValue).assertEqual("null");
      expect(card.opt('marker')).assertEqual(4);
      expect(card.opt('absent-test-property')).assertUndefined();
      const second = new CardData(objectModel);
      expect(JSON.stringify(second.opt("toString"))).assertEqual("null");
      expect(second.getObjectId() === originalId).assertFalse();
      expect(card.getObjectId()).assertEqual(originalId);
      expect(JSON.stringify(card.data)).assertEqual("{\"toString\":null,\"marker\":4}");
      expect(card.type).assertEqual("test.card-keys.4");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name PropertyKeysTest_case_006
     * @tc.desc card-keys: preserve payload semantics and stable identity; input vector 6.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PropertyKeysTest_case_006', 0, () => {
      const payload = makePayload("line\nbreak", "75%", 5);
      const model: DataModel = makeModel("test.card-keys.5", payload);
      const objectModel: DataModel = { type: "test.card-keys.5", data: JSON.parse("{\"0\":null,\"marker\":5}") };
      const card = new CardData(objectModel);
      const originalId = card.getObjectId();
      const encodedValue = JSON.stringify(card.opt("0"));
      expect(encodedValue).assertEqual("null");
      expect(card.opt('marker')).assertEqual(5);
      expect(card.opt('absent-test-property')).assertUndefined();
      const second = new CardData(objectModel);
      expect(JSON.stringify(second.opt("0"))).assertEqual("null");
      expect(second.getObjectId() === originalId).assertFalse();
      expect(card.getObjectId()).assertEqual(originalId);
      expect(JSON.stringify(card.data)).assertEqual("{\"0\":null,\"marker\":5}");
      expect(card.type).assertEqual("test.card-keys.5");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name PropertyKeysTest_case_007
     * @tc.desc card-keys: preserve payload semantics and stable identity; input vector 7.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PropertyKeysTest_case_007', 0, () => {
      const payload = makePayload("tab\tvalue", "", 6);
      const model: DataModel = makeModel("test.card-keys.6", payload);
      const objectModel: DataModel = { type: "test.card-keys.6", data: JSON.parse("{\"a.b\":null,\"marker\":6}") };
      const card = new CardData(objectModel);
      const originalId = card.getObjectId();
      const encodedValue = JSON.stringify(card.opt("a.b"));
      expect(encodedValue).assertEqual("null");
      expect(card.opt('marker')).assertEqual(6);
      expect(card.opt('absent-test-property')).assertUndefined();
      const second = new CardData(objectModel);
      expect(JSON.stringify(second.opt("a.b"))).assertEqual("null");
      expect(second.getObjectId() === originalId).assertFalse();
      expect(card.getObjectId()).assertEqual(originalId);
      expect(JSON.stringify(card.data)).assertEqual("{\"a.b\":null,\"marker\":6}");
      expect(card.type).assertEqual("test.card-keys.6");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name PropertyKeysTest_case_008
     * @tc.desc card-keys: preserve payload semantics and stable identity; input vector 8.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PropertyKeysTest_case_008', 0, () => {
      const payload = makePayload("\u5361\u7247 1", ":{{env(screen-width}}", 7);
      const model: DataModel = makeModel("test.card-keys.7", payload);
      const objectModel: DataModel = { type: "test.card-keys.7", data: JSON.parse("{\"a b\":null,\"marker\":7}") };
      const card = new CardData(objectModel);
      const originalId = card.getObjectId();
      const encodedValue = JSON.stringify(card.opt("a b"));
      expect(encodedValue).assertEqual("null");
      expect(card.opt('marker')).assertEqual(7);
      expect(card.opt('absent-test-property')).assertUndefined();
      const second = new CardData(objectModel);
      expect(JSON.stringify(second.opt("a b"))).assertEqual("null");
      expect(second.getObjectId() === originalId).assertFalse();
      expect(card.getObjectId()).assertEqual(originalId);
      expect(JSON.stringify(card.data)).assertEqual("{\"a b\":null,\"marker\":7}");
      expect(card.type).assertEqual("test.card-keys.7");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name PropertyKeysTest_case_009
     * @tc.desc card-keys: preserve payload semantics and stable identity; input vector 9.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PropertyKeysTest_case_009', 0, () => {
      const payload = makePayload("\u5361\u7247 2", "100%", 8);
      const model: DataModel = makeModel("test.card-keys.8", payload);
      const objectModel: DataModel = { type: "test.card-keys.8", data: JSON.parse("{\"dash-key\":null,\"marker\":8}") };
      const card = new CardData(objectModel);
      const originalId = card.getObjectId();
      const encodedValue = JSON.stringify(card.opt("dash-key"));
      expect(encodedValue).assertEqual("null");
      expect(card.opt('marker')).assertEqual(8);
      expect(card.opt('absent-test-property')).assertUndefined();
      const second = new CardData(objectModel);
      expect(JSON.stringify(second.opt("dash-key"))).assertEqual("null");
      expect(second.getObjectId() === originalId).assertFalse();
      expect(card.getObjectId()).assertEqual(originalId);
      expect(JSON.stringify(card.data)).assertEqual("{\"dash-key\":null,\"marker\":8}");
      expect(card.type).assertEqual("test.card-keys.8");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name PropertyKeysTest_case_010
     * @tc.desc card-keys: preserve payload semantics and stable identity; input vector 10.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PropertyKeysTest_case_010', 0, () => {
      const payload = makePayload("\u5361\u7247 3", "0%", 9);
      const model: DataModel = makeModel("test.card-keys.9", payload);
      const objectModel: DataModel = { type: "test.card-keys.9", data: JSON.parse("{\"\u5361\u7247\":null,\"marker\":9}") };
      const card = new CardData(objectModel);
      const originalId = card.getObjectId();
      const encodedValue = JSON.stringify(card.opt("\u5361\u7247"));
      expect(encodedValue).assertEqual("null");
      expect(card.opt('marker')).assertEqual(9);
      expect(card.opt('absent-test-property')).assertUndefined();
      const second = new CardData(objectModel);
      expect(JSON.stringify(second.opt("\u5361\u7247"))).assertEqual("null");
      expect(second.getObjectId() === originalId).assertFalse();
      expect(card.getObjectId()).assertEqual(originalId);
      expect(JSON.stringify(card.data)).assertEqual("{\"\u5361\u7247\":null,\"marker\":9}");
      expect(card.type).assertEqual("test.card-keys.9");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name PropertyKeysTest_case_011
     * @tc.desc card-keys: preserve payload semantics and stable identity; input vector 11.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PropertyKeysTest_case_011', 0, () => {
      const payload = makePayload("\u65e5\u672c\u8a9e", "50%", 10);
      const model: DataModel = makeModel("test.card-keys.10", payload);
      const objectModel: DataModel = { type: "test.card-keys.10", data: JSON.parse("{\"\\u0000\":null,\"marker\":10}") };
      const card = new CardData(objectModel);
      const originalId = card.getObjectId();
      const encodedValue = JSON.stringify(card.opt("\u0000"));
      expect(encodedValue).assertEqual("null");
      expect(card.opt('marker')).assertEqual(10);
      expect(card.opt('absent-test-property')).assertUndefined();
      const second = new CardData(objectModel);
      expect(JSON.stringify(second.opt("\u0000"))).assertEqual("null");
      expect(second.getObjectId() === originalId).assertFalse();
      expect(card.getObjectId()).assertEqual(originalId);
      expect(JSON.stringify(card.data)).assertEqual("{\"\\u0000\":null,\"marker\":10}");
      expect(card.type).assertEqual("test.card-keys.10");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name PropertyKeysTest_case_012
     * @tc.desc card-keys: preserve payload semantics and stable identity; input vector 12.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PropertyKeysTest_case_012', 0, () => {
      const payload = makePayload("\u0645\u0631\u062d\u0628\u0627", "1%", 11);
      const model: DataModel = makeModel("test.card-keys.11", payload);
      const objectModel: DataModel = { type: "test.card-keys.11", data: JSON.parse("{\"length\":null,\"marker\":11}") };
      const card = new CardData(objectModel);
      const originalId = card.getObjectId();
      const encodedValue = JSON.stringify(card.opt("length"));
      expect(encodedValue).assertEqual("null");
      expect(card.opt('marker')).assertEqual(11);
      expect(card.opt('absent-test-property')).assertUndefined();
      const second = new CardData(objectModel);
      expect(JSON.stringify(second.opt("length"))).assertEqual("null");
      expect(second.getObjectId() === originalId).assertFalse();
      expect(card.getObjectId()).assertEqual(originalId);
      expect(JSON.stringify(card.data)).assertEqual("{\"length\":null,\"marker\":11}");
      expect(card.type).assertEqual("test.card-keys.11");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name PropertyKeysTest_case_013
     * @tc.desc card-keys: preserve payload semantics and stable identity; input vector 13.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PropertyKeysTest_case_013', 0, () => {
      const payload = makePayload("\u05e9\u05dc\u05d5\u05dd", "99%", 12);
      const model: DataModel = makeModel("test.card-keys.12", payload);
      const objectModel: DataModel = { type: "test.card-keys.12", data: JSON.parse("{\"hasOwnProperty\":null,\"marker\":12}") };
      const card = new CardData(objectModel);
      const originalId = card.getObjectId();
      const encodedValue = JSON.stringify(card.opt("hasOwnProperty"));
      expect(encodedValue).assertEqual("null");
      expect(card.opt('marker')).assertEqual(12);
      expect(card.opt('absent-test-property')).assertUndefined();
      const second = new CardData(objectModel);
      expect(JSON.stringify(second.opt("hasOwnProperty"))).assertEqual("null");
      expect(second.getObjectId() === originalId).assertFalse();
      expect(card.getObjectId()).assertEqual(originalId);
      expect(JSON.stringify(card.data)).assertEqual("{\"hasOwnProperty\":null,\"marker\":12}");
      expect(card.type).assertEqual("test.card-keys.12");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name PropertyKeysTest_case_014
     * @tc.desc card-keys: preserve payload semantics and stable identity; input vector 14.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PropertyKeysTest_case_014', 0, () => {
      const payload = makePayload("e\u0301", "75%", 13);
      const model: DataModel = makeModel("test.card-keys.13", payload);
      const objectModel: DataModel = { type: "test.card-keys.13", data: JSON.parse("{\"prototype\":null,\"marker\":13}") };
      const card = new CardData(objectModel);
      const originalId = card.getObjectId();
      const encodedValue = JSON.stringify(card.opt("prototype"));
      expect(encodedValue).assertEqual("null");
      expect(card.opt('marker')).assertEqual(13);
      expect(card.opt('absent-test-property')).assertUndefined();
      const second = new CardData(objectModel);
      expect(JSON.stringify(second.opt("prototype"))).assertEqual("null");
      expect(second.getObjectId() === originalId).assertFalse();
      expect(card.getObjectId()).assertEqual(originalId);
      expect(JSON.stringify(card.data)).assertEqual("{\"prototype\":null,\"marker\":13}");
      expect(card.type).assertEqual("test.card-keys.13");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name PropertyKeysTest_case_015
     * @tc.desc card-keys: preserve payload semantics and stable identity; input vector 15.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PropertyKeysTest_case_015', 0, () => {
      const payload = makePayload("\u00e9", "", 14);
      const model: DataModel = makeModel("test.card-keys.14", payload);
      const objectModel: DataModel = { type: "test.card-keys.14", data: JSON.parse("{\"quote\\\"\":null,\"marker\":14}") };
      const card = new CardData(objectModel);
      const originalId = card.getObjectId();
      const encodedValue = JSON.stringify(card.opt("quote\""));
      expect(encodedValue).assertEqual("null");
      expect(card.opt('marker')).assertEqual(14);
      expect(card.opt('absent-test-property')).assertUndefined();
      const second = new CardData(objectModel);
      expect(JSON.stringify(second.opt("quote\""))).assertEqual("null");
      expect(second.getObjectId() === originalId).assertFalse();
      expect(card.getObjectId()).assertEqual(originalId);
      expect(JSON.stringify(card.data)).assertEqual("{\"quote\\\"\":null,\"marker\":14}");
      expect(card.type).assertEqual("test.card-keys.14");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name PropertyKeysTest_case_016
     * @tc.desc card-keys: preserve payload semantics and stable identity; input vector 16.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PropertyKeysTest_case_016', 0, () => {
      const payload = makePayload("\ud83d\ude80", ":{{env(screen-width}}", 15);
      const model: DataModel = makeModel("test.card-keys.15", payload);
      const objectModel: DataModel = { type: "test.card-keys.15", data: JSON.parse("{\"\\\\\":null,\"marker\":15}") };
      const card = new CardData(objectModel);
      const originalId = card.getObjectId();
      const encodedValue = JSON.stringify(card.opt("\\"));
      expect(encodedValue).assertEqual("null");
      expect(card.opt('marker')).assertEqual(15);
      expect(card.opt('absent-test-property')).assertUndefined();
      const second = new CardData(objectModel);
      expect(JSON.stringify(second.opt("\\"))).assertEqual("null");
      expect(second.getObjectId() === originalId).assertFalse();
      expect(card.getObjectId()).assertEqual(originalId);
      expect(JSON.stringify(card.data)).assertEqual("{\"\\\\\":null,\"marker\":15}");
      expect(card.type).assertEqual("test.card-keys.15");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name PropertyKeysTest_case_017
     * @tc.desc card-keys: preserve payload semantics and stable identity; input vector 17.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PropertyKeysTest_case_017', 0, () => {
      const payload = makePayload("quote\"slash\\", "100%", 16);
      const model: DataModel = makeModel("test.card-keys.16", payload);
      const objectModel: DataModel = { type: "test.card-keys.16", data: JSON.parse("{\"plain\":false,\"marker\":16}") };
      const card = new CardData(objectModel);
      const originalId = card.getObjectId();
      const encodedValue = JSON.stringify(card.opt("plain"));
      expect(encodedValue).assertEqual("false");
      expect(card.opt('marker')).assertEqual(16);
      expect(card.opt('absent-test-property')).assertUndefined();
      const second = new CardData(objectModel);
      expect(JSON.stringify(second.opt("plain"))).assertEqual("false");
      expect(second.getObjectId() === originalId).assertFalse();
      expect(card.getObjectId()).assertEqual(originalId);
      expect(JSON.stringify(card.data)).assertEqual("{\"plain\":false,\"marker\":16}");
      expect(card.type).assertEqual("test.card-keys.16");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name PropertyKeysTest_case_018
     * @tc.desc card-keys: preserve payload semantics and stable identity; input vector 18.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PropertyKeysTest_case_018', 0, () => {
      const payload = makePayload("<script>alert(1)</script>", "0%", 17);
      const model: DataModel = makeModel("test.card-keys.17", payload);
      const objectModel: DataModel = { type: "test.card-keys.17", data: JSON.parse("{\"\":false,\"marker\":17}") };
      const card = new CardData(objectModel);
      const originalId = card.getObjectId();
      const encodedValue = JSON.stringify(card.opt(""));
      expect(encodedValue).assertEqual("false");
      expect(card.opt('marker')).assertEqual(17);
      expect(card.opt('absent-test-property')).assertUndefined();
      const second = new CardData(objectModel);
      expect(JSON.stringify(second.opt(""))).assertEqual("false");
      expect(second.getObjectId() === originalId).assertFalse();
      expect(card.getObjectId()).assertEqual(originalId);
      expect(JSON.stringify(card.data)).assertEqual("{\"\":false,\"marker\":17}");
      expect(card.type).assertEqual("test.card-keys.17");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name PropertyKeysTest_case_019
     * @tc.desc card-keys: preserve payload semantics and stable identity; input vector 19.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PropertyKeysTest_case_019', 0, () => {
      const payload = makePayload("${notExecuted}", "50%", 18);
      const model: DataModel = makeModel("test.card-keys.18", payload);
      const objectModel: DataModel = { type: "test.card-keys.18", data: JSON.parse("{\"__proto__\":false,\"marker\":18}") };
      const card = new CardData(objectModel);
      const originalId = card.getObjectId();
      const encodedValue = JSON.stringify(card.opt("__proto__"));
      expect(encodedValue).assertEqual("false");
      expect(card.opt('marker')).assertEqual(18);
      expect(card.opt('absent-test-property')).assertUndefined();
      const second = new CardData(objectModel);
      expect(JSON.stringify(second.opt("__proto__"))).assertEqual("false");
      expect(second.getObjectId() === originalId).assertFalse();
      expect(card.getObjectId()).assertEqual(originalId);
      expect(JSON.stringify(card.data)).assertEqual("{\"__proto__\":false,\"marker\":18}");
      expect(card.type).assertEqual("test.card-keys.18");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name PropertyKeysTest_case_020
     * @tc.desc card-keys: preserve payload semantics and stable identity; input vector 20.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PropertyKeysTest_case_020', 0, () => {
      const payload = makePayload("__proto__", "1%", 19);
      const model: DataModel = makeModel("test.card-keys.19", payload);
      const objectModel: DataModel = { type: "test.card-keys.19", data: JSON.parse("{\"constructor\":false,\"marker\":19}") };
      const card = new CardData(objectModel);
      const originalId = card.getObjectId();
      const encodedValue = JSON.stringify(card.opt("constructor"));
      expect(encodedValue).assertEqual("false");
      expect(card.opt('marker')).assertEqual(19);
      expect(card.opt('absent-test-property')).assertUndefined();
      const second = new CardData(objectModel);
      expect(JSON.stringify(second.opt("constructor"))).assertEqual("false");
      expect(second.getObjectId() === originalId).assertFalse();
      expect(card.getObjectId()).assertEqual(originalId);
      expect(JSON.stringify(card.data)).assertEqual("{\"constructor\":false,\"marker\":19}");
      expect(card.type).assertEqual("test.card-keys.19");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name PropertyKeysTest_case_021
     * @tc.desc card-keys: preserve payload semantics and stable identity; input vector 21.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PropertyKeysTest_case_021', 0, () => {
      const payload = makePayload("constructor", "99%", 20);
      const model: DataModel = makeModel("test.card-keys.20", payload);
      const objectModel: DataModel = { type: "test.card-keys.20", data: JSON.parse("{\"toString\":false,\"marker\":20}") };
      const card = new CardData(objectModel);
      const originalId = card.getObjectId();
      const encodedValue = JSON.stringify(card.opt("toString"));
      expect(encodedValue).assertEqual("false");
      expect(card.opt('marker')).assertEqual(20);
      expect(card.opt('absent-test-property')).assertUndefined();
      const second = new CardData(objectModel);
      expect(JSON.stringify(second.opt("toString"))).assertEqual("false");
      expect(second.getObjectId() === originalId).assertFalse();
      expect(card.getObjectId()).assertEqual(originalId);
      expect(JSON.stringify(card.data)).assertEqual("{\"toString\":false,\"marker\":20}");
      expect(card.type).assertEqual("test.card-keys.20");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name PropertyKeysTest_case_022
     * @tc.desc card-keys: preserve payload semantics and stable identity; input vector 22.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PropertyKeysTest_case_022', 0, () => {
      const payload = makePayload("null", "75%", 21);
      const model: DataModel = makeModel("test.card-keys.21", payload);
      const objectModel: DataModel = { type: "test.card-keys.21", data: JSON.parse("{\"0\":false,\"marker\":21}") };
      const card = new CardData(objectModel);
      const originalId = card.getObjectId();
      const encodedValue = JSON.stringify(card.opt("0"));
      expect(encodedValue).assertEqual("false");
      expect(card.opt('marker')).assertEqual(21);
      expect(card.opt('absent-test-property')).assertUndefined();
      const second = new CardData(objectModel);
      expect(JSON.stringify(second.opt("0"))).assertEqual("false");
      expect(second.getObjectId() === originalId).assertFalse();
      expect(card.getObjectId()).assertEqual(originalId);
      expect(JSON.stringify(card.data)).assertEqual("{\"0\":false,\"marker\":21}");
      expect(card.type).assertEqual("test.card-keys.21");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name PropertyKeysTest_case_023
     * @tc.desc card-keys: preserve payload semantics and stable identity; input vector 23.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PropertyKeysTest_case_023', 0, () => {
      const payload = makePayload("false", "", 22);
      const model: DataModel = makeModel("test.card-keys.22", payload);
      const objectModel: DataModel = { type: "test.card-keys.22", data: JSON.parse("{\"a.b\":false,\"marker\":22}") };
      const card = new CardData(objectModel);
      const originalId = card.getObjectId();
      const encodedValue = JSON.stringify(card.opt("a.b"));
      expect(encodedValue).assertEqual("false");
      expect(card.opt('marker')).assertEqual(22);
      expect(card.opt('absent-test-property')).assertUndefined();
      const second = new CardData(objectModel);
      expect(JSON.stringify(second.opt("a.b"))).assertEqual("false");
      expect(second.getObjectId() === originalId).assertFalse();
      expect(card.getObjectId()).assertEqual(originalId);
      expect(JSON.stringify(card.data)).assertEqual("{\"a.b\":false,\"marker\":22}");
      expect(card.type).assertEqual("test.card-keys.22");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name PropertyKeysTest_case_024
     * @tc.desc card-keys: preserve payload semantics and stable identity; input vector 24.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PropertyKeysTest_case_024', 0, () => {
      const payload = makePayload("0", ":{{env(screen-width}}", 23);
      const model: DataModel = makeModel("test.card-keys.23", payload);
      const objectModel: DataModel = { type: "test.card-keys.23", data: JSON.parse("{\"a b\":false,\"marker\":23}") };
      const card = new CardData(objectModel);
      const originalId = card.getObjectId();
      const encodedValue = JSON.stringify(card.opt("a b"));
      expect(encodedValue).assertEqual("false");
      expect(card.opt('marker')).assertEqual(23);
      expect(card.opt('absent-test-property')).assertUndefined();
      const second = new CardData(objectModel);
      expect(JSON.stringify(second.opt("a b"))).assertEqual("false");
      expect(second.getObjectId() === originalId).assertFalse();
      expect(card.getObjectId()).assertEqual(originalId);
      expect(JSON.stringify(card.data)).assertEqual("{\"a b\":false,\"marker\":23}");
      expect(card.type).assertEqual("test.card-keys.23");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name PropertyKeysTest_case_025
     * @tc.desc card-keys: preserve payload semantics and stable identity; input vector 25.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PropertyKeysTest_case_025', 0, () => {
      const payload = makePayload("100%", "100%", 24);
      const model: DataModel = makeModel("test.card-keys.24", payload);
      const objectModel: DataModel = { type: "test.card-keys.24", data: JSON.parse("{\"dash-key\":false,\"marker\":24}") };
      const card = new CardData(objectModel);
      const originalId = card.getObjectId();
      const encodedValue = JSON.stringify(card.opt("dash-key"));
      expect(encodedValue).assertEqual("false");
      expect(card.opt('marker')).assertEqual(24);
      expect(card.opt('absent-test-property')).assertUndefined();
      const second = new CardData(objectModel);
      expect(JSON.stringify(second.opt("dash-key"))).assertEqual("false");
      expect(second.getObjectId() === originalId).assertFalse();
      expect(card.getObjectId()).assertEqual(originalId);
      expect(JSON.stringify(card.data)).assertEqual("{\"dash-key\":false,\"marker\":24}");
      expect(card.type).assertEqual("test.card-keys.24");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name PropertyKeysTest_case_026
     * @tc.desc card-keys: preserve payload semantics and stable identity; input vector 26.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PropertyKeysTest_case_026', 0, () => {
      const payload = makePayload("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA", "0%", 25);
      const model: DataModel = makeModel("test.card-keys.25", payload);
      const objectModel: DataModel = { type: "test.card-keys.25", data: JSON.parse("{\"\u5361\u7247\":false,\"marker\":25}") };
      const card = new CardData(objectModel);
      const originalId = card.getObjectId();
      const encodedValue = JSON.stringify(card.opt("\u5361\u7247"));
      expect(encodedValue).assertEqual("false");
      expect(card.opt('marker')).assertEqual(25);
      expect(card.opt('absent-test-property')).assertUndefined();
      const second = new CardData(objectModel);
      expect(JSON.stringify(second.opt("\u5361\u7247"))).assertEqual("false");
      expect(second.getObjectId() === originalId).assertFalse();
      expect(card.getObjectId()).assertEqual(originalId);
      expect(JSON.stringify(card.data)).assertEqual("{\"\u5361\u7247\":false,\"marker\":25}");
      expect(card.type).assertEqual("test.card-keys.25");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name PropertyKeysTest_case_027
     * @tc.desc card-keys: preserve payload semantics and stable identity; input vector 27.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PropertyKeysTest_case_027', 0, () => {
      const payload = makePayload("\u0000", "50%", 26);
      const model: DataModel = makeModel("test.card-keys.26", payload);
      const objectModel: DataModel = { type: "test.card-keys.26", data: JSON.parse("{\"\\u0000\":false,\"marker\":26}") };
      const card = new CardData(objectModel);
      const originalId = card.getObjectId();
      const encodedValue = JSON.stringify(card.opt("\u0000"));
      expect(encodedValue).assertEqual("false");
      expect(card.opt('marker')).assertEqual(26);
      expect(card.opt('absent-test-property')).assertUndefined();
      const second = new CardData(objectModel);
      expect(JSON.stringify(second.opt("\u0000"))).assertEqual("false");
      expect(second.getObjectId() === originalId).assertFalse();
      expect(card.getObjectId()).assertEqual(originalId);
      expect(JSON.stringify(card.data)).assertEqual("{\"\\u0000\":false,\"marker\":26}");
      expect(card.type).assertEqual("test.card-keys.26");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name PropertyKeysTest_case_028
     * @tc.desc card-keys: preserve payload semantics and stable identity; input vector 28.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PropertyKeysTest_case_028', 0, () => {
      const payload = makePayload("\u2028", "1%", 27);
      const model: DataModel = makeModel("test.card-keys.27", payload);
      const objectModel: DataModel = { type: "test.card-keys.27", data: JSON.parse("{\"length\":false,\"marker\":27}") };
      const card = new CardData(objectModel);
      const originalId = card.getObjectId();
      const encodedValue = JSON.stringify(card.opt("length"));
      expect(encodedValue).assertEqual("false");
      expect(card.opt('marker')).assertEqual(27);
      expect(card.opt('absent-test-property')).assertUndefined();
      const second = new CardData(objectModel);
      expect(JSON.stringify(second.opt("length"))).assertEqual("false");
      expect(second.getObjectId() === originalId).assertFalse();
      expect(card.getObjectId()).assertEqual(originalId);
      expect(JSON.stringify(card.data)).assertEqual("{\"length\":false,\"marker\":27}");
      expect(card.type).assertEqual("test.card-keys.27");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name PropertyKeysTest_case_029
     * @tc.desc card-keys: preserve payload semantics and stable identity; input vector 29.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PropertyKeysTest_case_029', 0, () => {
      const payload = makePayload("\u2029", "99%", 28);
      const model: DataModel = makeModel("test.card-keys.28", payload);
      const objectModel: DataModel = { type: "test.card-keys.28", data: JSON.parse("{\"hasOwnProperty\":false,\"marker\":28}") };
      const card = new CardData(objectModel);
      const originalId = card.getObjectId();
      const encodedValue = JSON.stringify(card.opt("hasOwnProperty"));
      expect(encodedValue).assertEqual("false");
      expect(card.opt('marker')).assertEqual(28);
      expect(card.opt('absent-test-property')).assertUndefined();
      const second = new CardData(objectModel);
      expect(JSON.stringify(second.opt("hasOwnProperty"))).assertEqual("false");
      expect(second.getObjectId() === originalId).assertFalse();
      expect(card.getObjectId()).assertEqual(originalId);
      expect(JSON.stringify(card.data)).assertEqual("{\"hasOwnProperty\":false,\"marker\":28}");
      expect(card.type).assertEqual("test.card-keys.28");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name PropertyKeysTest_case_030
     * @tc.desc card-keys: preserve payload semantics and stable identity; input vector 30.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PropertyKeysTest_case_030', 0, () => {
      const payload = makePayload("\r\n", "75%", 29);
      const model: DataModel = makeModel("test.card-keys.29", payload);
      const objectModel: DataModel = { type: "test.card-keys.29", data: JSON.parse("{\"prototype\":false,\"marker\":29}") };
      const card = new CardData(objectModel);
      const originalId = card.getObjectId();
      const encodedValue = JSON.stringify(card.opt("prototype"));
      expect(encodedValue).assertEqual("false");
      expect(card.opt('marker')).assertEqual(29);
      expect(card.opt('absent-test-property')).assertUndefined();
      const second = new CardData(objectModel);
      expect(JSON.stringify(second.opt("prototype"))).assertEqual("false");
      expect(second.getObjectId() === originalId).assertFalse();
      expect(card.getObjectId()).assertEqual(originalId);
      expect(JSON.stringify(card.data)).assertEqual("{\"prototype\":false,\"marker\":29}");
      expect(card.type).assertEqual("test.card-keys.29");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name PropertyKeysTest_case_031
     * @tc.desc card-keys: preserve payload semantics and stable identity; input vector 31.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PropertyKeysTest_case_031', 0, () => {
      const payload = makePayload("\ud83d\udc69\u200d\ud83d\udcbb", "", 30);
      const model: DataModel = makeModel("test.card-keys.30", payload);
      const objectModel: DataModel = { type: "test.card-keys.30", data: JSON.parse("{\"quote\\\"\":false,\"marker\":30}") };
      const card = new CardData(objectModel);
      const originalId = card.getObjectId();
      const encodedValue = JSON.stringify(card.opt("quote\""));
      expect(encodedValue).assertEqual("false");
      expect(card.opt('marker')).assertEqual(30);
      expect(card.opt('absent-test-property')).assertUndefined();
      const second = new CardData(objectModel);
      expect(JSON.stringify(second.opt("quote\""))).assertEqual("false");
      expect(second.getObjectId() === originalId).assertFalse();
      expect(card.getObjectId()).assertEqual(originalId);
      expect(JSON.stringify(card.data)).assertEqual("{\"quote\\\"\":false,\"marker\":30}");
      expect(card.type).assertEqual("test.card-keys.30");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name PropertyKeysTest_case_032
     * @tc.desc card-keys: preserve payload semantics and stable identity; input vector 32.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PropertyKeysTest_case_032', 0, () => {
      const payload = makePayload("end.", ":{{env(screen-width}}", 31);
      const model: DataModel = makeModel("test.card-keys.31", payload);
      const objectModel: DataModel = { type: "test.card-keys.31", data: JSON.parse("{\"\\\\\":false,\"marker\":31}") };
      const card = new CardData(objectModel);
      const originalId = card.getObjectId();
      const encodedValue = JSON.stringify(card.opt("\\"));
      expect(encodedValue).assertEqual("false");
      expect(card.opt('marker')).assertEqual(31);
      expect(card.opt('absent-test-property')).assertUndefined();
      const second = new CardData(objectModel);
      expect(JSON.stringify(second.opt("\\"))).assertEqual("false");
      expect(second.getObjectId() === originalId).assertFalse();
      expect(card.getObjectId()).assertEqual(originalId);
      expect(JSON.stringify(card.data)).assertEqual("{\"\\\\\":false,\"marker\":31}");
      expect(card.type).assertEqual("test.card-keys.31");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name PropertyKeysTest_case_033
     * @tc.desc card-keys: preserve payload semantics and stable identity; input vector 33.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PropertyKeysTest_case_033', 0, () => {
      const payload = makePayload("", "100%", 32);
      const model: DataModel = makeModel("test.card-keys.32", payload);
      const objectModel: DataModel = { type: "test.card-keys.32", data: JSON.parse("{\"plain\":0,\"marker\":32}") };
      const card = new CardData(objectModel);
      const originalId = card.getObjectId();
      const encodedValue = JSON.stringify(card.opt("plain"));
      expect(encodedValue).assertEqual("0");
      expect(card.opt('marker')).assertEqual(32);
      expect(card.opt('absent-test-property')).assertUndefined();
      const second = new CardData(objectModel);
      expect(JSON.stringify(second.opt("plain"))).assertEqual("0");
      expect(second.getObjectId() === originalId).assertFalse();
      expect(card.getObjectId()).assertEqual(originalId);
      expect(JSON.stringify(card.data)).assertEqual("{\"plain\":0,\"marker\":32}");
      expect(card.type).assertEqual("test.card-keys.32");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name PropertyKeysTest_case_034
     * @tc.desc card-keys: preserve payload semantics and stable identity; input vector 34.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PropertyKeysTest_case_034', 0, () => {
      const payload = makePayload("Card", "0%", 33);
      const model: DataModel = makeModel("test.card-keys.33", payload);
      const objectModel: DataModel = { type: "test.card-keys.33", data: JSON.parse("{\"\":0,\"marker\":33}") };
      const card = new CardData(objectModel);
      const originalId = card.getObjectId();
      const encodedValue = JSON.stringify(card.opt(""));
      expect(encodedValue).assertEqual("0");
      expect(card.opt('marker')).assertEqual(33);
      expect(card.opt('absent-test-property')).assertUndefined();
      const second = new CardData(objectModel);
      expect(JSON.stringify(second.opt(""))).assertEqual("0");
      expect(second.getObjectId() === originalId).assertFalse();
      expect(card.getObjectId()).assertEqual(originalId);
      expect(JSON.stringify(card.data)).assertEqual("{\"\":0,\"marker\":33}");
      expect(card.type).assertEqual("test.card-keys.33");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name PropertyKeysTest_case_035
     * @tc.desc card-keys: preserve payload semantics and stable identity; input vector 35.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PropertyKeysTest_case_035', 0, () => {
      const payload = makePayload(" ", "50%", 34);
      const model: DataModel = makeModel("test.card-keys.34", payload);
      const objectModel: DataModel = { type: "test.card-keys.34", data: JSON.parse("{\"__proto__\":0,\"marker\":34}") };
      const card = new CardData(objectModel);
      const originalId = card.getObjectId();
      const encodedValue = JSON.stringify(card.opt("__proto__"));
      expect(encodedValue).assertEqual("0");
      expect(card.opt('marker')).assertEqual(34);
      expect(card.opt('absent-test-property')).assertUndefined();
      const second = new CardData(objectModel);
      expect(JSON.stringify(second.opt("__proto__"))).assertEqual("0");
      expect(second.getObjectId() === originalId).assertFalse();
      expect(card.getObjectId()).assertEqual(originalId);
      expect(JSON.stringify(card.data)).assertEqual("{\"__proto__\":0,\"marker\":34}");
      expect(card.type).assertEqual("test.card-keys.34");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name PropertyKeysTest_case_036
     * @tc.desc card-keys: preserve payload semantics and stable identity; input vector 36.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PropertyKeysTest_case_036', 0, () => {
      const payload = makePayload("  padded  ", "1%", 35);
      const model: DataModel = makeModel("test.card-keys.35", payload);
      const objectModel: DataModel = { type: "test.card-keys.35", data: JSON.parse("{\"constructor\":0,\"marker\":35}") };
      const card = new CardData(objectModel);
      const originalId = card.getObjectId();
      const encodedValue = JSON.stringify(card.opt("constructor"));
      expect(encodedValue).assertEqual("0");
      expect(card.opt('marker')).assertEqual(35);
      expect(card.opt('absent-test-property')).assertUndefined();
      const second = new CardData(objectModel);
      expect(JSON.stringify(second.opt("constructor"))).assertEqual("0");
      expect(second.getObjectId() === originalId).assertFalse();
      expect(card.getObjectId()).assertEqual(originalId);
      expect(JSON.stringify(card.data)).assertEqual("{\"constructor\":0,\"marker\":35}");
      expect(card.type).assertEqual("test.card-keys.35");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name PropertyKeysTest_case_037
     * @tc.desc card-keys: preserve payload semantics and stable identity; input vector 37.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PropertyKeysTest_case_037', 0, () => {
      const payload = makePayload("multi word title", "99%", 36);
      const model: DataModel = makeModel("test.card-keys.36", payload);
      const objectModel: DataModel = { type: "test.card-keys.36", data: JSON.parse("{\"toString\":0,\"marker\":36}") };
      const card = new CardData(objectModel);
      const originalId = card.getObjectId();
      const encodedValue = JSON.stringify(card.opt("toString"));
      expect(encodedValue).assertEqual("0");
      expect(card.opt('marker')).assertEqual(36);
      expect(card.opt('absent-test-property')).assertUndefined();
      const second = new CardData(objectModel);
      expect(JSON.stringify(second.opt("toString"))).assertEqual("0");
      expect(second.getObjectId() === originalId).assertFalse();
      expect(card.getObjectId()).assertEqual(originalId);
      expect(JSON.stringify(card.data)).assertEqual("{\"toString\":0,\"marker\":36}");
      expect(card.type).assertEqual("test.card-keys.36");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name PropertyKeysTest_case_038
     * @tc.desc card-keys: preserve payload semantics and stable identity; input vector 38.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PropertyKeysTest_case_038', 0, () => {
      const payload = makePayload("line\nbreak", "75%", 37);
      const model: DataModel = makeModel("test.card-keys.37", payload);
      const objectModel: DataModel = { type: "test.card-keys.37", data: JSON.parse("{\"0\":0,\"marker\":37}") };
      const card = new CardData(objectModel);
      const originalId = card.getObjectId();
      const encodedValue = JSON.stringify(card.opt("0"));
      expect(encodedValue).assertEqual("0");
      expect(card.opt('marker')).assertEqual(37);
      expect(card.opt('absent-test-property')).assertUndefined();
      const second = new CardData(objectModel);
      expect(JSON.stringify(second.opt("0"))).assertEqual("0");
      expect(second.getObjectId() === originalId).assertFalse();
      expect(card.getObjectId()).assertEqual(originalId);
      expect(JSON.stringify(card.data)).assertEqual("{\"0\":0,\"marker\":37}");
      expect(card.type).assertEqual("test.card-keys.37");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name PropertyKeysTest_case_039
     * @tc.desc card-keys: preserve payload semantics and stable identity; input vector 39.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PropertyKeysTest_case_039', 0, () => {
      const payload = makePayload("tab\tvalue", "", 38);
      const model: DataModel = makeModel("test.card-keys.38", payload);
      const objectModel: DataModel = { type: "test.card-keys.38", data: JSON.parse("{\"a.b\":0,\"marker\":38}") };
      const card = new CardData(objectModel);
      const originalId = card.getObjectId();
      const encodedValue = JSON.stringify(card.opt("a.b"));
      expect(encodedValue).assertEqual("0");
      expect(card.opt('marker')).assertEqual(38);
      expect(card.opt('absent-test-property')).assertUndefined();
      const second = new CardData(objectModel);
      expect(JSON.stringify(second.opt("a.b"))).assertEqual("0");
      expect(second.getObjectId() === originalId).assertFalse();
      expect(card.getObjectId()).assertEqual(originalId);
      expect(JSON.stringify(card.data)).assertEqual("{\"a.b\":0,\"marker\":38}");
      expect(card.type).assertEqual("test.card-keys.38");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name PropertyKeysTest_case_040
     * @tc.desc card-keys: preserve payload semantics and stable identity; input vector 40.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PropertyKeysTest_case_040', 0, () => {
      const payload = makePayload("\u5361\u7247 1", ":{{env(screen-width}}", 39);
      const model: DataModel = makeModel("test.card-keys.39", payload);
      const objectModel: DataModel = { type: "test.card-keys.39", data: JSON.parse("{\"a b\":0,\"marker\":39}") };
      const card = new CardData(objectModel);
      const originalId = card.getObjectId();
      const encodedValue = JSON.stringify(card.opt("a b"));
      expect(encodedValue).assertEqual("0");
      expect(card.opt('marker')).assertEqual(39);
      expect(card.opt('absent-test-property')).assertUndefined();
      const second = new CardData(objectModel);
      expect(JSON.stringify(second.opt("a b"))).assertEqual("0");
      expect(second.getObjectId() === originalId).assertFalse();
      expect(card.getObjectId()).assertEqual(originalId);
      expect(JSON.stringify(card.data)).assertEqual("{\"a b\":0,\"marker\":39}");
      expect(card.type).assertEqual("test.card-keys.39");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name PropertyKeysTest_case_041
     * @tc.desc card-keys: preserve payload semantics and stable identity; input vector 41.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PropertyKeysTest_case_041', 0, () => {
      const payload = makePayload("\u5361\u7247 2", "100%", 40);
      const model: DataModel = makeModel("test.card-keys.40", payload);
      const objectModel: DataModel = { type: "test.card-keys.40", data: JSON.parse("{\"dash-key\":0,\"marker\":40}") };
      const card = new CardData(objectModel);
      const originalId = card.getObjectId();
      const encodedValue = JSON.stringify(card.opt("dash-key"));
      expect(encodedValue).assertEqual("0");
      expect(card.opt('marker')).assertEqual(40);
      expect(card.opt('absent-test-property')).assertUndefined();
      const second = new CardData(objectModel);
      expect(JSON.stringify(second.opt("dash-key"))).assertEqual("0");
      expect(second.getObjectId() === originalId).assertFalse();
      expect(card.getObjectId()).assertEqual(originalId);
      expect(JSON.stringify(card.data)).assertEqual("{\"dash-key\":0,\"marker\":40}");
      expect(card.type).assertEqual("test.card-keys.40");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name PropertyKeysTest_case_042
     * @tc.desc card-keys: preserve payload semantics and stable identity; input vector 42.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PropertyKeysTest_case_042', 0, () => {
      const payload = makePayload("\u5361\u7247 3", "0%", 41);
      const model: DataModel = makeModel("test.card-keys.41", payload);
      const objectModel: DataModel = { type: "test.card-keys.41", data: JSON.parse("{\"\u5361\u7247\":0,\"marker\":41}") };
      const card = new CardData(objectModel);
      const originalId = card.getObjectId();
      const encodedValue = JSON.stringify(card.opt("\u5361\u7247"));
      expect(encodedValue).assertEqual("0");
      expect(card.opt('marker')).assertEqual(41);
      expect(card.opt('absent-test-property')).assertUndefined();
      const second = new CardData(objectModel);
      expect(JSON.stringify(second.opt("\u5361\u7247"))).assertEqual("0");
      expect(second.getObjectId() === originalId).assertFalse();
      expect(card.getObjectId()).assertEqual(originalId);
      expect(JSON.stringify(card.data)).assertEqual("{\"\u5361\u7247\":0,\"marker\":41}");
      expect(card.type).assertEqual("test.card-keys.41");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name PropertyKeysTest_case_043
     * @tc.desc card-keys: preserve payload semantics and stable identity; input vector 43.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PropertyKeysTest_case_043', 0, () => {
      const payload = makePayload("\u65e5\u672c\u8a9e", "50%", 42);
      const model: DataModel = makeModel("test.card-keys.42", payload);
      const objectModel: DataModel = { type: "test.card-keys.42", data: JSON.parse("{\"\\u0000\":0,\"marker\":42}") };
      const card = new CardData(objectModel);
      const originalId = card.getObjectId();
      const encodedValue = JSON.stringify(card.opt("\u0000"));
      expect(encodedValue).assertEqual("0");
      expect(card.opt('marker')).assertEqual(42);
      expect(card.opt('absent-test-property')).assertUndefined();
      const second = new CardData(objectModel);
      expect(JSON.stringify(second.opt("\u0000"))).assertEqual("0");
      expect(second.getObjectId() === originalId).assertFalse();
      expect(card.getObjectId()).assertEqual(originalId);
      expect(JSON.stringify(card.data)).assertEqual("{\"\\u0000\":0,\"marker\":42}");
      expect(card.type).assertEqual("test.card-keys.42");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name PropertyKeysTest_case_044
     * @tc.desc card-keys: preserve payload semantics and stable identity; input vector 44.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PropertyKeysTest_case_044', 0, () => {
      const payload = makePayload("\u0645\u0631\u062d\u0628\u0627", "1%", 43);
      const model: DataModel = makeModel("test.card-keys.43", payload);
      const objectModel: DataModel = { type: "test.card-keys.43", data: JSON.parse("{\"length\":0,\"marker\":43}") };
      const card = new CardData(objectModel);
      const originalId = card.getObjectId();
      const encodedValue = JSON.stringify(card.opt("length"));
      expect(encodedValue).assertEqual("0");
      expect(card.opt('marker')).assertEqual(43);
      expect(card.opt('absent-test-property')).assertUndefined();
      const second = new CardData(objectModel);
      expect(JSON.stringify(second.opt("length"))).assertEqual("0");
      expect(second.getObjectId() === originalId).assertFalse();
      expect(card.getObjectId()).assertEqual(originalId);
      expect(JSON.stringify(card.data)).assertEqual("{\"length\":0,\"marker\":43}");
      expect(card.type).assertEqual("test.card-keys.43");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name PropertyKeysTest_case_045
     * @tc.desc card-keys: preserve payload semantics and stable identity; input vector 45.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PropertyKeysTest_case_045', 0, () => {
      const payload = makePayload("\u05e9\u05dc\u05d5\u05dd", "99%", 44);
      const model: DataModel = makeModel("test.card-keys.44", payload);
      const objectModel: DataModel = { type: "test.card-keys.44", data: JSON.parse("{\"hasOwnProperty\":0,\"marker\":44}") };
      const card = new CardData(objectModel);
      const originalId = card.getObjectId();
      const encodedValue = JSON.stringify(card.opt("hasOwnProperty"));
      expect(encodedValue).assertEqual("0");
      expect(card.opt('marker')).assertEqual(44);
      expect(card.opt('absent-test-property')).assertUndefined();
      const second = new CardData(objectModel);
      expect(JSON.stringify(second.opt("hasOwnProperty"))).assertEqual("0");
      expect(second.getObjectId() === originalId).assertFalse();
      expect(card.getObjectId()).assertEqual(originalId);
      expect(JSON.stringify(card.data)).assertEqual("{\"hasOwnProperty\":0,\"marker\":44}");
      expect(card.type).assertEqual("test.card-keys.44");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name PropertyKeysTest_case_046
     * @tc.desc card-keys: preserve payload semantics and stable identity; input vector 46.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PropertyKeysTest_case_046', 0, () => {
      const payload = makePayload("e\u0301", "75%", 45);
      const model: DataModel = makeModel("test.card-keys.45", payload);
      const objectModel: DataModel = { type: "test.card-keys.45", data: JSON.parse("{\"prototype\":0,\"marker\":45}") };
      const card = new CardData(objectModel);
      const originalId = card.getObjectId();
      const encodedValue = JSON.stringify(card.opt("prototype"));
      expect(encodedValue).assertEqual("0");
      expect(card.opt('marker')).assertEqual(45);
      expect(card.opt('absent-test-property')).assertUndefined();
      const second = new CardData(objectModel);
      expect(JSON.stringify(second.opt("prototype"))).assertEqual("0");
      expect(second.getObjectId() === originalId).assertFalse();
      expect(card.getObjectId()).assertEqual(originalId);
      expect(JSON.stringify(card.data)).assertEqual("{\"prototype\":0,\"marker\":45}");
      expect(card.type).assertEqual("test.card-keys.45");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name PropertyKeysTest_case_047
     * @tc.desc card-keys: preserve payload semantics and stable identity; input vector 47.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PropertyKeysTest_case_047', 0, () => {
      const payload = makePayload("\u00e9", "", 46);
      const model: DataModel = makeModel("test.card-keys.46", payload);
      const objectModel: DataModel = { type: "test.card-keys.46", data: JSON.parse("{\"quote\\\"\":0,\"marker\":46}") };
      const card = new CardData(objectModel);
      const originalId = card.getObjectId();
      const encodedValue = JSON.stringify(card.opt("quote\""));
      expect(encodedValue).assertEqual("0");
      expect(card.opt('marker')).assertEqual(46);
      expect(card.opt('absent-test-property')).assertUndefined();
      const second = new CardData(objectModel);
      expect(JSON.stringify(second.opt("quote\""))).assertEqual("0");
      expect(second.getObjectId() === originalId).assertFalse();
      expect(card.getObjectId()).assertEqual(originalId);
      expect(JSON.stringify(card.data)).assertEqual("{\"quote\\\"\":0,\"marker\":46}");
      expect(card.type).assertEqual("test.card-keys.46");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name PropertyKeysTest_case_048
     * @tc.desc card-keys: preserve payload semantics and stable identity; input vector 48.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PropertyKeysTest_case_048', 0, () => {
      const payload = makePayload("\ud83d\ude80", ":{{env(screen-width}}", 47);
      const model: DataModel = makeModel("test.card-keys.47", payload);
      const objectModel: DataModel = { type: "test.card-keys.47", data: JSON.parse("{\"\\\\\":0,\"marker\":47}") };
      const card = new CardData(objectModel);
      const originalId = card.getObjectId();
      const encodedValue = JSON.stringify(card.opt("\\"));
      expect(encodedValue).assertEqual("0");
      expect(card.opt('marker')).assertEqual(47);
      expect(card.opt('absent-test-property')).assertUndefined();
      const second = new CardData(objectModel);
      expect(JSON.stringify(second.opt("\\"))).assertEqual("0");
      expect(second.getObjectId() === originalId).assertFalse();
      expect(card.getObjectId()).assertEqual(originalId);
      expect(JSON.stringify(card.data)).assertEqual("{\"\\\\\":0,\"marker\":47}");
      expect(card.type).assertEqual("test.card-keys.47");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name PropertyKeysTest_case_049
     * @tc.desc card-keys: preserve payload semantics and stable identity; input vector 49.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PropertyKeysTest_case_049', 0, () => {
      const payload = makePayload("quote\"slash\\", "100%", 48);
      const model: DataModel = makeModel("test.card-keys.48", payload);
      const objectModel: DataModel = { type: "test.card-keys.48", data: JSON.parse("{\"plain\":\"\",\"marker\":48}") };
      const card = new CardData(objectModel);
      const originalId = card.getObjectId();
      const encodedValue = JSON.stringify(card.opt("plain"));
      expect(encodedValue).assertEqual("\"\"");
      expect(card.opt('marker')).assertEqual(48);
      expect(card.opt('absent-test-property')).assertUndefined();
      const second = new CardData(objectModel);
      expect(JSON.stringify(second.opt("plain"))).assertEqual("\"\"");
      expect(second.getObjectId() === originalId).assertFalse();
      expect(card.getObjectId()).assertEqual(originalId);
      expect(JSON.stringify(card.data)).assertEqual("{\"plain\":\"\",\"marker\":48}");
      expect(card.type).assertEqual("test.card-keys.48");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name PropertyKeysTest_case_050
     * @tc.desc card-keys: preserve payload semantics and stable identity; input vector 50.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PropertyKeysTest_case_050', 0, () => {
      const payload = makePayload("<script>alert(1)</script>", "0%", 49);
      const model: DataModel = makeModel("test.card-keys.49", payload);
      const objectModel: DataModel = { type: "test.card-keys.49", data: JSON.parse("{\"\":\"\",\"marker\":49}") };
      const card = new CardData(objectModel);
      const originalId = card.getObjectId();
      const encodedValue = JSON.stringify(card.opt(""));
      expect(encodedValue).assertEqual("\"\"");
      expect(card.opt('marker')).assertEqual(49);
      expect(card.opt('absent-test-property')).assertUndefined();
      const second = new CardData(objectModel);
      expect(JSON.stringify(second.opt(""))).assertEqual("\"\"");
      expect(second.getObjectId() === originalId).assertFalse();
      expect(card.getObjectId()).assertEqual(originalId);
      expect(JSON.stringify(card.data)).assertEqual("{\"\":\"\",\"marker\":49}");
      expect(card.type).assertEqual("test.card-keys.49");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name PropertyKeysTest_case_051
     * @tc.desc card-keys: preserve payload semantics and stable identity; input vector 51.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PropertyKeysTest_case_051', 0, () => {
      const payload = makePayload("${notExecuted}", "50%", 50);
      const model: DataModel = makeModel("test.card-keys.50", payload);
      const objectModel: DataModel = { type: "test.card-keys.50", data: JSON.parse("{\"__proto__\":\"\",\"marker\":50}") };
      const card = new CardData(objectModel);
      const originalId = card.getObjectId();
      const encodedValue = JSON.stringify(card.opt("__proto__"));
      expect(encodedValue).assertEqual("\"\"");
      expect(card.opt('marker')).assertEqual(50);
      expect(card.opt('absent-test-property')).assertUndefined();
      const second = new CardData(objectModel);
      expect(JSON.stringify(second.opt("__proto__"))).assertEqual("\"\"");
      expect(second.getObjectId() === originalId).assertFalse();
      expect(card.getObjectId()).assertEqual(originalId);
      expect(JSON.stringify(card.data)).assertEqual("{\"__proto__\":\"\",\"marker\":50}");
      expect(card.type).assertEqual("test.card-keys.50");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name PropertyKeysTest_case_052
     * @tc.desc card-keys: preserve payload semantics and stable identity; input vector 52.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PropertyKeysTest_case_052', 0, () => {
      const payload = makePayload("__proto__", "1%", 51);
      const model: DataModel = makeModel("test.card-keys.51", payload);
      const objectModel: DataModel = { type: "test.card-keys.51", data: JSON.parse("{\"constructor\":\"\",\"marker\":51}") };
      const card = new CardData(objectModel);
      const originalId = card.getObjectId();
      const encodedValue = JSON.stringify(card.opt("constructor"));
      expect(encodedValue).assertEqual("\"\"");
      expect(card.opt('marker')).assertEqual(51);
      expect(card.opt('absent-test-property')).assertUndefined();
      const second = new CardData(objectModel);
      expect(JSON.stringify(second.opt("constructor"))).assertEqual("\"\"");
      expect(second.getObjectId() === originalId).assertFalse();
      expect(card.getObjectId()).assertEqual(originalId);
      expect(JSON.stringify(card.data)).assertEqual("{\"constructor\":\"\",\"marker\":51}");
      expect(card.type).assertEqual("test.card-keys.51");
      expect(card.getObjectId().length > 0).assertTrue();
    });
  });
}
