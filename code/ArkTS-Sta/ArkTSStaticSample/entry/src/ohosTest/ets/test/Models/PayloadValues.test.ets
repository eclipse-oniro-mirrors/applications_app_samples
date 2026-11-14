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

// Reference: ets/test/Validation/PointerUtilValidation.test.ets
// Original line floor: 1170; scenario family: card-values.
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

export default function PayloadValuesTest(): void {
  describe('PayloadValuesTest', () => {
    beforeAll(() => {
      logSuite('PayloadValuesTest', 'begin');
    });
    beforeEach(async () => {
      // Yield between cases so device watchdog and UI events can be processed.
      await new Promise<void>((resolve) => { setTimeout(resolve, 1); });
    });
    afterAll(() => {
      logSuite('PayloadValuesTest', 'end');
    });

    /**
     * @tc.name PayloadValuesTest_case_001
     * @tc.desc card-values: preserve payload semantics and stable identity; input vector 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PayloadValuesTest_case_001', 0, () => {
      const payload = makePayload("", "100%", 0);
      const model: DataModel = makeModel("test.card-values.0", payload);
      const card = new CardData({ type: "test.card-values.0", data: JSON.parse("{\"value\":null,\"marker\":0}") });
      const before = JSON.stringify(card.data);
      const encodedValue = JSON.stringify(card.opt('value'));
      expect(encodedValue).assertEqual("null");
      expect(card.opt('marker')).assertEqual(0);
      expect(card.opt('missing')).assertUndefined();
      expect(JSON.stringify(card.data)).assertEqual(before);
      const second = new TextCardData({ type: "test.card-values.0", data: JSON.parse("{\"value\":null,\"marker\":0}") });
      expect(JSON.stringify(second.opt('value'))).assertEqual(encodedValue);
      expect(card.data === second.data).assertFalse();
      expect(card.getObjectId() === second.getObjectId()).assertFalse();
      expect(card.type).assertEqual("test.card-values.0");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name PayloadValuesTest_case_002
     * @tc.desc card-values: preserve payload semantics and stable identity; input vector 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PayloadValuesTest_case_002', 0, () => {
      const payload = makePayload("Card", "0%", 1);
      const model: DataModel = makeModel("test.card-values.1", payload);
      const card = new CardData({ type: "test.card-values.1", data: JSON.parse("{\"value\":false,\"marker\":1}") });
      const before = JSON.stringify(card.data);
      const encodedValue = JSON.stringify(card.opt('value'));
      expect(encodedValue).assertEqual("false");
      expect(card.opt('marker')).assertEqual(1);
      expect(card.opt('missing')).assertUndefined();
      expect(JSON.stringify(card.data)).assertEqual(before);
      const second = new TextCardData({ type: "test.card-values.1", data: JSON.parse("{\"value\":false,\"marker\":1}") });
      expect(JSON.stringify(second.opt('value'))).assertEqual(encodedValue);
      expect(card.data === second.data).assertFalse();
      expect(card.getObjectId() === second.getObjectId()).assertFalse();
      expect(card.type).assertEqual("test.card-values.1");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name PayloadValuesTest_case_003
     * @tc.desc card-values: preserve payload semantics and stable identity; input vector 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PayloadValuesTest_case_003', 0, () => {
      const payload = makePayload(" ", "50%", 2);
      const model: DataModel = makeModel("test.card-values.2", payload);
      const card = new CardData({ type: "test.card-values.2", data: JSON.parse("{\"value\":true,\"marker\":2}") });
      const before = JSON.stringify(card.data);
      const encodedValue = JSON.stringify(card.opt('value'));
      expect(encodedValue).assertEqual("true");
      expect(card.opt('marker')).assertEqual(2);
      expect(card.opt('missing')).assertUndefined();
      expect(JSON.stringify(card.data)).assertEqual(before);
      const second = new TextCardData({ type: "test.card-values.2", data: JSON.parse("{\"value\":true,\"marker\":2}") });
      expect(JSON.stringify(second.opt('value'))).assertEqual(encodedValue);
      expect(card.data === second.data).assertFalse();
      expect(card.getObjectId() === second.getObjectId()).assertFalse();
      expect(card.type).assertEqual("test.card-values.2");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name PayloadValuesTest_case_004
     * @tc.desc card-values: preserve payload semantics and stable identity; input vector 4.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PayloadValuesTest_case_004', 0, () => {
      const payload = makePayload("  padded  ", "1%", 3);
      const model: DataModel = makeModel("test.card-values.3", payload);
      const card = new CardData({ type: "test.card-values.3", data: JSON.parse("{\"value\":\"\",\"marker\":3}") });
      const before = JSON.stringify(card.data);
      const encodedValue = JSON.stringify(card.opt('value'));
      expect(encodedValue).assertEqual("\"\"");
      expect(card.opt('marker')).assertEqual(3);
      expect(card.opt('missing')).assertUndefined();
      expect(JSON.stringify(card.data)).assertEqual(before);
      const second = new TextCardData({ type: "test.card-values.3", data: JSON.parse("{\"value\":\"\",\"marker\":3}") });
      expect(JSON.stringify(second.opt('value'))).assertEqual(encodedValue);
      expect(card.data === second.data).assertFalse();
      expect(card.getObjectId() === second.getObjectId()).assertFalse();
      expect(card.type).assertEqual("test.card-values.3");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name PayloadValuesTest_case_005
     * @tc.desc card-values: preserve payload semantics and stable identity; input vector 5.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PayloadValuesTest_case_005', 0, () => {
      const payload = makePayload("multi word title", "99%", 4);
      const model: DataModel = makeModel("test.card-values.4", payload);
      const card = new CardData({ type: "test.card-values.4", data: JSON.parse("{\"value\":\"\",\"marker\":4}") });
      const before = JSON.stringify(card.data);
      const encodedValue = JSON.stringify(card.opt('value'));
      expect(encodedValue).assertEqual("\"\"");
      expect(card.opt('marker')).assertEqual(4);
      expect(card.opt('missing')).assertUndefined();
      expect(JSON.stringify(card.data)).assertEqual(before);
      const second = new TextCardData({ type: "test.card-values.4", data: JSON.parse("{\"value\":\"\",\"marker\":4}") });
      expect(JSON.stringify(second.opt('value'))).assertEqual(encodedValue);
      expect(card.data === second.data).assertFalse();
      expect(card.getObjectId() === second.getObjectId()).assertFalse();
      expect(card.type).assertEqual("test.card-values.4");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name PayloadValuesTest_case_006
     * @tc.desc card-values: preserve payload semantics and stable identity; input vector 6.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PayloadValuesTest_case_006', 0, () => {
      const payload = makePayload("line\nbreak", "75%", 5);
      const model: DataModel = makeModel("test.card-values.5", payload);
      const card = new CardData({ type: "test.card-values.5", data: JSON.parse("{\"value\":0,\"marker\":5}") });
      const before = JSON.stringify(card.data);
      const encodedValue = JSON.stringify(card.opt('value'));
      expect(encodedValue).assertEqual("0");
      expect(card.opt('marker')).assertEqual(5);
      expect(card.opt('missing')).assertUndefined();
      expect(JSON.stringify(card.data)).assertEqual(before);
      const second = new TextCardData({ type: "test.card-values.5", data: JSON.parse("{\"value\":0,\"marker\":5}") });
      expect(JSON.stringify(second.opt('value'))).assertEqual(encodedValue);
      expect(card.data === second.data).assertFalse();
      expect(card.getObjectId() === second.getObjectId()).assertFalse();
      expect(card.type).assertEqual("test.card-values.5");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name PayloadValuesTest_case_007
     * @tc.desc card-values: preserve payload semantics and stable identity; input vector 7.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PayloadValuesTest_case_007', 0, () => {
      const payload = makePayload("tab\tvalue", "", 6);
      const model: DataModel = makeModel("test.card-values.6", payload);
      const card = new CardData({ type: "test.card-values.6", data: JSON.parse("{\"value\":[6,null,false],\"marker\":6}") });
      const before = JSON.stringify(card.data);
      const encodedValue = JSON.stringify(card.opt('value'));
      expect(encodedValue).assertEqual("[6,null,false]");
      expect(card.opt('marker')).assertEqual(6);
      expect(card.opt('missing')).assertUndefined();
      expect(JSON.stringify(card.data)).assertEqual(before);
      const second = new TextCardData({ type: "test.card-values.6", data: JSON.parse("{\"value\":[6,null,false],\"marker\":6}") });
      expect(JSON.stringify(second.opt('value'))).assertEqual(encodedValue);
      expect(card.data === second.data).assertFalse();
      expect(card.getObjectId() === second.getObjectId()).assertFalse();
      expect(card.type).assertEqual("test.card-values.6");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name PayloadValuesTest_case_008
     * @tc.desc card-values: preserve payload semantics and stable identity; input vector 8.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PayloadValuesTest_case_008', 0, () => {
      const payload = makePayload("\u5361\u7247 1", ":{{env(screen-width}}", 7);
      const model: DataModel = makeModel("test.card-values.7", payload);
      const card = new CardData({ type: "test.card-values.7", data: JSON.parse("{\"value\":{\"nested\":[7]},\"marker\":7}") });
      const before = JSON.stringify(card.data);
      const encodedValue = JSON.stringify(card.opt('value'));
      expect(encodedValue).assertEqual("{\"nested\":[7]}");
      expect(card.opt('marker')).assertEqual(7);
      expect(card.opt('missing')).assertUndefined();
      expect(JSON.stringify(card.data)).assertEqual(before);
      const second = new TextCardData({ type: "test.card-values.7", data: JSON.parse("{\"value\":{\"nested\":[7]},\"marker\":7}") });
      expect(JSON.stringify(second.opt('value'))).assertEqual(encodedValue);
      expect(card.data === second.data).assertFalse();
      expect(card.getObjectId() === second.getObjectId()).assertFalse();
      expect(card.type).assertEqual("test.card-values.7");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name PayloadValuesTest_case_009
     * @tc.desc card-values: preserve payload semantics and stable identity; input vector 9.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PayloadValuesTest_case_009', 0, () => {
      const payload = makePayload("\u5361\u7247 2", "100%", 8);
      const model: DataModel = makeModel("test.card-values.8", payload);
      const card = new CardData({ type: "test.card-values.8", data: JSON.parse("{\"value\":null,\"marker\":8}") });
      const before = JSON.stringify(card.data);
      const encodedValue = JSON.stringify(card.opt('value'));
      expect(encodedValue).assertEqual("null");
      expect(card.opt('marker')).assertEqual(8);
      expect(card.opt('missing')).assertUndefined();
      expect(JSON.stringify(card.data)).assertEqual(before);
      const second = new TextCardData({ type: "test.card-values.8", data: JSON.parse("{\"value\":null,\"marker\":8}") });
      expect(JSON.stringify(second.opt('value'))).assertEqual(encodedValue);
      expect(card.data === second.data).assertFalse();
      expect(card.getObjectId() === second.getObjectId()).assertFalse();
      expect(card.type).assertEqual("test.card-values.8");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name PayloadValuesTest_case_010
     * @tc.desc card-values: preserve payload semantics and stable identity; input vector 10.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PayloadValuesTest_case_010', 0, () => {
      const payload = makePayload("\u5361\u7247 3", "0%", 9);
      const model: DataModel = makeModel("test.card-values.9", payload);
      const card = new CardData({ type: "test.card-values.9", data: JSON.parse("{\"value\":false,\"marker\":9}") });
      const before = JSON.stringify(card.data);
      const encodedValue = JSON.stringify(card.opt('value'));
      expect(encodedValue).assertEqual("false");
      expect(card.opt('marker')).assertEqual(9);
      expect(card.opt('missing')).assertUndefined();
      expect(JSON.stringify(card.data)).assertEqual(before);
      const second = new TextCardData({ type: "test.card-values.9", data: JSON.parse("{\"value\":false,\"marker\":9}") });
      expect(JSON.stringify(second.opt('value'))).assertEqual(encodedValue);
      expect(card.data === second.data).assertFalse();
      expect(card.getObjectId() === second.getObjectId()).assertFalse();
      expect(card.type).assertEqual("test.card-values.9");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name PayloadValuesTest_case_011
     * @tc.desc card-values: preserve payload semantics and stable identity; input vector 11.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PayloadValuesTest_case_011', 0, () => {
      const payload = makePayload("\u65e5\u672c\u8a9e", "50%", 10);
      const model: DataModel = makeModel("test.card-values.10", payload);
      const card = new CardData({ type: "test.card-values.10", data: JSON.parse("{\"value\":true,\"marker\":10}") });
      const before = JSON.stringify(card.data);
      const encodedValue = JSON.stringify(card.opt('value'));
      expect(encodedValue).assertEqual("true");
      expect(card.opt('marker')).assertEqual(10);
      expect(card.opt('missing')).assertUndefined();
      expect(JSON.stringify(card.data)).assertEqual(before);
      const second = new TextCardData({ type: "test.card-values.10", data: JSON.parse("{\"value\":true,\"marker\":10}") });
      expect(JSON.stringify(second.opt('value'))).assertEqual(encodedValue);
      expect(card.data === second.data).assertFalse();
      expect(card.getObjectId() === second.getObjectId()).assertFalse();
      expect(card.type).assertEqual("test.card-values.10");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name PayloadValuesTest_case_012
     * @tc.desc card-values: preserve payload semantics and stable identity; input vector 12.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PayloadValuesTest_case_012', 0, () => {
      const payload = makePayload("\u0645\u0631\u062d\u0628\u0627", "1%", 11);
      const model: DataModel = makeModel("test.card-values.11", payload);
      const card = new CardData({ type: "test.card-values.11", data: JSON.parse("{\"value\":\"\",\"marker\":11}") });
      const before = JSON.stringify(card.data);
      const encodedValue = JSON.stringify(card.opt('value'));
      expect(encodedValue).assertEqual("\"\"");
      expect(card.opt('marker')).assertEqual(11);
      expect(card.opt('missing')).assertUndefined();
      expect(JSON.stringify(card.data)).assertEqual(before);
      const second = new TextCardData({ type: "test.card-values.11", data: JSON.parse("{\"value\":\"\",\"marker\":11}") });
      expect(JSON.stringify(second.opt('value'))).assertEqual(encodedValue);
      expect(card.data === second.data).assertFalse();
      expect(card.getObjectId() === second.getObjectId()).assertFalse();
      expect(card.type).assertEqual("test.card-values.11");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name PayloadValuesTest_case_013
     * @tc.desc card-values: preserve payload semantics and stable identity; input vector 13.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PayloadValuesTest_case_013', 0, () => {
      const payload = makePayload("\u05e9\u05dc\u05d5\u05dd", "99%", 12);
      const model: DataModel = makeModel("test.card-values.12", payload);
      const card = new CardData({ type: "test.card-values.12", data: JSON.parse("{\"value\":\"Card\",\"marker\":12}") });
      const before = JSON.stringify(card.data);
      const encodedValue = JSON.stringify(card.opt('value'));
      expect(encodedValue).assertEqual("\"Card\"");
      expect(card.opt('marker')).assertEqual(12);
      expect(card.opt('missing')).assertUndefined();
      expect(JSON.stringify(card.data)).assertEqual(before);
      const second = new TextCardData({ type: "test.card-values.12", data: JSON.parse("{\"value\":\"Card\",\"marker\":12}") });
      expect(JSON.stringify(second.opt('value'))).assertEqual(encodedValue);
      expect(card.data === second.data).assertFalse();
      expect(card.getObjectId() === second.getObjectId()).assertFalse();
      expect(card.type).assertEqual("test.card-values.12");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name PayloadValuesTest_case_014
     * @tc.desc card-values: preserve payload semantics and stable identity; input vector 14.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PayloadValuesTest_case_014', 0, () => {
      const payload = makePayload("e\u0301", "75%", 13);
      const model: DataModel = makeModel("test.card-values.13", payload);
      const card = new CardData({ type: "test.card-values.13", data: JSON.parse("{\"value\":1,\"marker\":13}") });
      const before = JSON.stringify(card.data);
      const encodedValue = JSON.stringify(card.opt('value'));
      expect(encodedValue).assertEqual("1");
      expect(card.opt('marker')).assertEqual(13);
      expect(card.opt('missing')).assertUndefined();
      expect(JSON.stringify(card.data)).assertEqual(before);
      const second = new TextCardData({ type: "test.card-values.13", data: JSON.parse("{\"value\":1,\"marker\":13}") });
      expect(JSON.stringify(second.opt('value'))).assertEqual(encodedValue);
      expect(card.data === second.data).assertFalse();
      expect(card.getObjectId() === second.getObjectId()).assertFalse();
      expect(card.type).assertEqual("test.card-values.13");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name PayloadValuesTest_case_015
     * @tc.desc card-values: preserve payload semantics and stable identity; input vector 15.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PayloadValuesTest_case_015', 0, () => {
      const payload = makePayload("\u00e9", "", 14);
      const model: DataModel = makeModel("test.card-values.14", payload);
      const card = new CardData({ type: "test.card-values.14", data: JSON.parse("{\"value\":[14,null,false],\"marker\":14}") });
      const before = JSON.stringify(card.data);
      const encodedValue = JSON.stringify(card.opt('value'));
      expect(encodedValue).assertEqual("[14,null,false]");
      expect(card.opt('marker')).assertEqual(14);
      expect(card.opt('missing')).assertUndefined();
      expect(JSON.stringify(card.data)).assertEqual(before);
      const second = new TextCardData({ type: "test.card-values.14", data: JSON.parse("{\"value\":[14,null,false],\"marker\":14}") });
      expect(JSON.stringify(second.opt('value'))).assertEqual(encodedValue);
      expect(card.data === second.data).assertFalse();
      expect(card.getObjectId() === second.getObjectId()).assertFalse();
      expect(card.type).assertEqual("test.card-values.14");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name PayloadValuesTest_case_016
     * @tc.desc card-values: preserve payload semantics and stable identity; input vector 16.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PayloadValuesTest_case_016', 0, () => {
      const payload = makePayload("\ud83d\ude80", ":{{env(screen-width}}", 15);
      const model: DataModel = makeModel("test.card-values.15", payload);
      const card = new CardData({ type: "test.card-values.15", data: JSON.parse("{\"value\":{\"nested\":[15]},\"marker\":15}") });
      const before = JSON.stringify(card.data);
      const encodedValue = JSON.stringify(card.opt('value'));
      expect(encodedValue).assertEqual("{\"nested\":[15]}");
      expect(card.opt('marker')).assertEqual(15);
      expect(card.opt('missing')).assertUndefined();
      expect(JSON.stringify(card.data)).assertEqual(before);
      const second = new TextCardData({ type: "test.card-values.15", data: JSON.parse("{\"value\":{\"nested\":[15]},\"marker\":15}") });
      expect(JSON.stringify(second.opt('value'))).assertEqual(encodedValue);
      expect(card.data === second.data).assertFalse();
      expect(card.getObjectId() === second.getObjectId()).assertFalse();
      expect(card.type).assertEqual("test.card-values.15");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name PayloadValuesTest_case_017
     * @tc.desc card-values: preserve payload semantics and stable identity; input vector 17.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PayloadValuesTest_case_017', 0, () => {
      const payload = makePayload("quote\"slash\\", "100%", 16);
      const model: DataModel = makeModel("test.card-values.16", payload);
      const card = new CardData({ type: "test.card-values.16", data: JSON.parse("{\"value\":null,\"marker\":16}") });
      const before = JSON.stringify(card.data);
      const encodedValue = JSON.stringify(card.opt('value'));
      expect(encodedValue).assertEqual("null");
      expect(card.opt('marker')).assertEqual(16);
      expect(card.opt('missing')).assertUndefined();
      expect(JSON.stringify(card.data)).assertEqual(before);
      const second = new TextCardData({ type: "test.card-values.16", data: JSON.parse("{\"value\":null,\"marker\":16}") });
      expect(JSON.stringify(second.opt('value'))).assertEqual(encodedValue);
      expect(card.data === second.data).assertFalse();
      expect(card.getObjectId() === second.getObjectId()).assertFalse();
      expect(card.type).assertEqual("test.card-values.16");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name PayloadValuesTest_case_018
     * @tc.desc card-values: preserve payload semantics and stable identity; input vector 18.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PayloadValuesTest_case_018', 0, () => {
      const payload = makePayload("<script>alert(1)</script>", "0%", 17);
      const model: DataModel = makeModel("test.card-values.17", payload);
      const card = new CardData({ type: "test.card-values.17", data: JSON.parse("{\"value\":false,\"marker\":17}") });
      const before = JSON.stringify(card.data);
      const encodedValue = JSON.stringify(card.opt('value'));
      expect(encodedValue).assertEqual("false");
      expect(card.opt('marker')).assertEqual(17);
      expect(card.opt('missing')).assertUndefined();
      expect(JSON.stringify(card.data)).assertEqual(before);
      const second = new TextCardData({ type: "test.card-values.17", data: JSON.parse("{\"value\":false,\"marker\":17}") });
      expect(JSON.stringify(second.opt('value'))).assertEqual(encodedValue);
      expect(card.data === second.data).assertFalse();
      expect(card.getObjectId() === second.getObjectId()).assertFalse();
      expect(card.type).assertEqual("test.card-values.17");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name PayloadValuesTest_case_019
     * @tc.desc card-values: preserve payload semantics and stable identity; input vector 19.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PayloadValuesTest_case_019', 0, () => {
      const payload = makePayload("${notExecuted}", "50%", 18);
      const model: DataModel = makeModel("test.card-values.18", payload);
      const card = new CardData({ type: "test.card-values.18", data: JSON.parse("{\"value\":true,\"marker\":18}") });
      const before = JSON.stringify(card.data);
      const encodedValue = JSON.stringify(card.opt('value'));
      expect(encodedValue).assertEqual("true");
      expect(card.opt('marker')).assertEqual(18);
      expect(card.opt('missing')).assertUndefined();
      expect(JSON.stringify(card.data)).assertEqual(before);
      const second = new TextCardData({ type: "test.card-values.18", data: JSON.parse("{\"value\":true,\"marker\":18}") });
      expect(JSON.stringify(second.opt('value'))).assertEqual(encodedValue);
      expect(card.data === second.data).assertFalse();
      expect(card.getObjectId() === second.getObjectId()).assertFalse();
      expect(card.type).assertEqual("test.card-values.18");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name PayloadValuesTest_case_020
     * @tc.desc card-values: preserve payload semantics and stable identity; input vector 20.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PayloadValuesTest_case_020', 0, () => {
      const payload = makePayload("__proto__", "1%", 19);
      const model: DataModel = makeModel("test.card-values.19", payload);
      const card = new CardData({ type: "test.card-values.19", data: JSON.parse("{\"value\":\"\",\"marker\":19}") });
      const before = JSON.stringify(card.data);
      const encodedValue = JSON.stringify(card.opt('value'));
      expect(encodedValue).assertEqual("\"\"");
      expect(card.opt('marker')).assertEqual(19);
      expect(card.opt('missing')).assertUndefined();
      expect(JSON.stringify(card.data)).assertEqual(before);
      const second = new TextCardData({ type: "test.card-values.19", data: JSON.parse("{\"value\":\"\",\"marker\":19}") });
      expect(JSON.stringify(second.opt('value'))).assertEqual(encodedValue);
      expect(card.data === second.data).assertFalse();
      expect(card.getObjectId() === second.getObjectId()).assertFalse();
      expect(card.type).assertEqual("test.card-values.19");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name PayloadValuesTest_case_021
     * @tc.desc card-values: preserve payload semantics and stable identity; input vector 21.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PayloadValuesTest_case_021', 0, () => {
      const payload = makePayload("constructor", "99%", 20);
      const model: DataModel = makeModel("test.card-values.20", payload);
      const card = new CardData({ type: "test.card-values.20", data: JSON.parse("{\"value\":\" \",\"marker\":20}") });
      const before = JSON.stringify(card.data);
      const encodedValue = JSON.stringify(card.opt('value'));
      expect(encodedValue).assertEqual("\" \"");
      expect(card.opt('marker')).assertEqual(20);
      expect(card.opt('missing')).assertUndefined();
      expect(JSON.stringify(card.data)).assertEqual(before);
      const second = new TextCardData({ type: "test.card-values.20", data: JSON.parse("{\"value\":\" \",\"marker\":20}") });
      expect(JSON.stringify(second.opt('value'))).assertEqual(encodedValue);
      expect(card.data === second.data).assertFalse();
      expect(card.getObjectId() === second.getObjectId()).assertFalse();
      expect(card.type).assertEqual("test.card-values.20");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name PayloadValuesTest_case_022
     * @tc.desc card-values: preserve payload semantics and stable identity; input vector 22.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PayloadValuesTest_case_022', 0, () => {
      const payload = makePayload("null", "75%", 21);
      const model: DataModel = makeModel("test.card-values.21", payload);
      const card = new CardData({ type: "test.card-values.21", data: JSON.parse("{\"value\":-1,\"marker\":21}") });
      const before = JSON.stringify(card.data);
      const encodedValue = JSON.stringify(card.opt('value'));
      expect(encodedValue).assertEqual("-1");
      expect(card.opt('marker')).assertEqual(21);
      expect(card.opt('missing')).assertUndefined();
      expect(JSON.stringify(card.data)).assertEqual(before);
      const second = new TextCardData({ type: "test.card-values.21", data: JSON.parse("{\"value\":-1,\"marker\":21}") });
      expect(JSON.stringify(second.opt('value'))).assertEqual(encodedValue);
      expect(card.data === second.data).assertFalse();
      expect(card.getObjectId() === second.getObjectId()).assertFalse();
      expect(card.type).assertEqual("test.card-values.21");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name PayloadValuesTest_case_023
     * @tc.desc card-values: preserve payload semantics and stable identity; input vector 23.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PayloadValuesTest_case_023', 0, () => {
      const payload = makePayload("false", "", 22);
      const model: DataModel = makeModel("test.card-values.22", payload);
      const card = new CardData({ type: "test.card-values.22", data: JSON.parse("{\"value\":[22,null,false],\"marker\":22}") });
      const before = JSON.stringify(card.data);
      const encodedValue = JSON.stringify(card.opt('value'));
      expect(encodedValue).assertEqual("[22,null,false]");
      expect(card.opt('marker')).assertEqual(22);
      expect(card.opt('missing')).assertUndefined();
      expect(JSON.stringify(card.data)).assertEqual(before);
      const second = new TextCardData({ type: "test.card-values.22", data: JSON.parse("{\"value\":[22,null,false],\"marker\":22}") });
      expect(JSON.stringify(second.opt('value'))).assertEqual(encodedValue);
      expect(card.data === second.data).assertFalse();
      expect(card.getObjectId() === second.getObjectId()).assertFalse();
      expect(card.type).assertEqual("test.card-values.22");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name PayloadValuesTest_case_024
     * @tc.desc card-values: preserve payload semantics and stable identity; input vector 24.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PayloadValuesTest_case_024', 0, () => {
      const payload = makePayload("0", ":{{env(screen-width}}", 23);
      const model: DataModel = makeModel("test.card-values.23", payload);
      const card = new CardData({ type: "test.card-values.23", data: JSON.parse("{\"value\":{\"nested\":[23]},\"marker\":23}") });
      const before = JSON.stringify(card.data);
      const encodedValue = JSON.stringify(card.opt('value'));
      expect(encodedValue).assertEqual("{\"nested\":[23]}");
      expect(card.opt('marker')).assertEqual(23);
      expect(card.opt('missing')).assertUndefined();
      expect(JSON.stringify(card.data)).assertEqual(before);
      const second = new TextCardData({ type: "test.card-values.23", data: JSON.parse("{\"value\":{\"nested\":[23]},\"marker\":23}") });
      expect(JSON.stringify(second.opt('value'))).assertEqual(encodedValue);
      expect(card.data === second.data).assertFalse();
      expect(card.getObjectId() === second.getObjectId()).assertFalse();
      expect(card.type).assertEqual("test.card-values.23");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name PayloadValuesTest_case_025
     * @tc.desc card-values: preserve payload semantics and stable identity; input vector 25.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PayloadValuesTest_case_025', 0, () => {
      const payload = makePayload("100%", "100%", 24);
      const model: DataModel = makeModel("test.card-values.24", payload);
      const card = new CardData({ type: "test.card-values.24", data: JSON.parse("{\"value\":null,\"marker\":24}") });
      const before = JSON.stringify(card.data);
      const encodedValue = JSON.stringify(card.opt('value'));
      expect(encodedValue).assertEqual("null");
      expect(card.opt('marker')).assertEqual(24);
      expect(card.opt('missing')).assertUndefined();
      expect(JSON.stringify(card.data)).assertEqual(before);
      const second = new TextCardData({ type: "test.card-values.24", data: JSON.parse("{\"value\":null,\"marker\":24}") });
      expect(JSON.stringify(second.opt('value'))).assertEqual(encodedValue);
      expect(card.data === second.data).assertFalse();
      expect(card.getObjectId() === second.getObjectId()).assertFalse();
      expect(card.type).assertEqual("test.card-values.24");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name PayloadValuesTest_case_026
     * @tc.desc card-values: preserve payload semantics and stable identity; input vector 26.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PayloadValuesTest_case_026', 0, () => {
      const payload = makePayload("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA", "0%", 25);
      const model: DataModel = makeModel("test.card-values.25", payload);
      const card = new CardData({ type: "test.card-values.25", data: JSON.parse("{\"value\":false,\"marker\":25}") });
      const before = JSON.stringify(card.data);
      const encodedValue = JSON.stringify(card.opt('value'));
      expect(encodedValue).assertEqual("false");
      expect(card.opt('marker')).assertEqual(25);
      expect(card.opt('missing')).assertUndefined();
      expect(JSON.stringify(card.data)).assertEqual(before);
      const second = new TextCardData({ type: "test.card-values.25", data: JSON.parse("{\"value\":false,\"marker\":25}") });
      expect(JSON.stringify(second.opt('value'))).assertEqual(encodedValue);
      expect(card.data === second.data).assertFalse();
      expect(card.getObjectId() === second.getObjectId()).assertFalse();
      expect(card.type).assertEqual("test.card-values.25");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name PayloadValuesTest_case_027
     * @tc.desc card-values: preserve payload semantics and stable identity; input vector 27.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PayloadValuesTest_case_027', 0, () => {
      const payload = makePayload("\u0000", "50%", 26);
      const model: DataModel = makeModel("test.card-values.26", payload);
      const card = new CardData({ type: "test.card-values.26", data: JSON.parse("{\"value\":true,\"marker\":26}") });
      const before = JSON.stringify(card.data);
      const encodedValue = JSON.stringify(card.opt('value'));
      expect(encodedValue).assertEqual("true");
      expect(card.opt('marker')).assertEqual(26);
      expect(card.opt('missing')).assertUndefined();
      expect(JSON.stringify(card.data)).assertEqual(before);
      const second = new TextCardData({ type: "test.card-values.26", data: JSON.parse("{\"value\":true,\"marker\":26}") });
      expect(JSON.stringify(second.opt('value'))).assertEqual(encodedValue);
      expect(card.data === second.data).assertFalse();
      expect(card.getObjectId() === second.getObjectId()).assertFalse();
      expect(card.type).assertEqual("test.card-values.26");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name PayloadValuesTest_case_028
     * @tc.desc card-values: preserve payload semantics and stable identity; input vector 28.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PayloadValuesTest_case_028', 0, () => {
      const payload = makePayload("\u2028", "1%", 27);
      const model: DataModel = makeModel("test.card-values.27", payload);
      const card = new CardData({ type: "test.card-values.27", data: JSON.parse("{\"value\":\"\",\"marker\":27}") });
      const before = JSON.stringify(card.data);
      const encodedValue = JSON.stringify(card.opt('value'));
      expect(encodedValue).assertEqual("\"\"");
      expect(card.opt('marker')).assertEqual(27);
      expect(card.opt('missing')).assertUndefined();
      expect(JSON.stringify(card.data)).assertEqual(before);
      const second = new TextCardData({ type: "test.card-values.27", data: JSON.parse("{\"value\":\"\",\"marker\":27}") });
      expect(JSON.stringify(second.opt('value'))).assertEqual(encodedValue);
      expect(card.data === second.data).assertFalse();
      expect(card.getObjectId() === second.getObjectId()).assertFalse();
      expect(card.type).assertEqual("test.card-values.27");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name PayloadValuesTest_case_029
     * @tc.desc card-values: preserve payload semantics and stable identity; input vector 29.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PayloadValuesTest_case_029', 0, () => {
      const payload = makePayload("\u2029", "99%", 28);
      const model: DataModel = makeModel("test.card-values.28", payload);
      const card = new CardData({ type: "test.card-values.28", data: JSON.parse("{\"value\":\"  padded  \",\"marker\":28}") });
      const before = JSON.stringify(card.data);
      const encodedValue = JSON.stringify(card.opt('value'));
      expect(encodedValue).assertEqual("\"  padded  \"");
      expect(card.opt('marker')).assertEqual(28);
      expect(card.opt('missing')).assertUndefined();
      expect(JSON.stringify(card.data)).assertEqual(before);
      const second = new TextCardData({ type: "test.card-values.28", data: JSON.parse("{\"value\":\"  padded  \",\"marker\":28}") });
      expect(JSON.stringify(second.opt('value'))).assertEqual(encodedValue);
      expect(card.data === second.data).assertFalse();
      expect(card.getObjectId() === second.getObjectId()).assertFalse();
      expect(card.type).assertEqual("test.card-values.28");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name PayloadValuesTest_case_030
     * @tc.desc card-values: preserve payload semantics and stable identity; input vector 30.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PayloadValuesTest_case_030', 0, () => {
      const payload = makePayload("\r\n", "75%", 29);
      const model: DataModel = makeModel("test.card-values.29", payload);
      const card = new CardData({ type: "test.card-values.29", data: JSON.parse("{\"value\":0.5,\"marker\":29}") });
      const before = JSON.stringify(card.data);
      const encodedValue = JSON.stringify(card.opt('value'));
      expect(encodedValue).assertEqual("0.5");
      expect(card.opt('marker')).assertEqual(29);
      expect(card.opt('missing')).assertUndefined();
      expect(JSON.stringify(card.data)).assertEqual(before);
      const second = new TextCardData({ type: "test.card-values.29", data: JSON.parse("{\"value\":0.5,\"marker\":29}") });
      expect(JSON.stringify(second.opt('value'))).assertEqual(encodedValue);
      expect(card.data === second.data).assertFalse();
      expect(card.getObjectId() === second.getObjectId()).assertFalse();
      expect(card.type).assertEqual("test.card-values.29");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name PayloadValuesTest_case_031
     * @tc.desc card-values: preserve payload semantics and stable identity; input vector 31.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PayloadValuesTest_case_031', 0, () => {
      const payload = makePayload("\ud83d\udc69\u200d\ud83d\udcbb", "", 30);
      const model: DataModel = makeModel("test.card-values.30", payload);
      const card = new CardData({ type: "test.card-values.30", data: JSON.parse("{\"value\":[30,null,false],\"marker\":30}") });
      const before = JSON.stringify(card.data);
      const encodedValue = JSON.stringify(card.opt('value'));
      expect(encodedValue).assertEqual("[30,null,false]");
      expect(card.opt('marker')).assertEqual(30);
      expect(card.opt('missing')).assertUndefined();
      expect(JSON.stringify(card.data)).assertEqual(before);
      const second = new TextCardData({ type: "test.card-values.30", data: JSON.parse("{\"value\":[30,null,false],\"marker\":30}") });
      expect(JSON.stringify(second.opt('value'))).assertEqual(encodedValue);
      expect(card.data === second.data).assertFalse();
      expect(card.getObjectId() === second.getObjectId()).assertFalse();
      expect(card.type).assertEqual("test.card-values.30");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name PayloadValuesTest_case_032
     * @tc.desc card-values: preserve payload semantics and stable identity; input vector 32.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PayloadValuesTest_case_032', 0, () => {
      const payload = makePayload("end.", ":{{env(screen-width}}", 31);
      const model: DataModel = makeModel("test.card-values.31", payload);
      const card = new CardData({ type: "test.card-values.31", data: JSON.parse("{\"value\":{\"nested\":[31]},\"marker\":31}") });
      const before = JSON.stringify(card.data);
      const encodedValue = JSON.stringify(card.opt('value'));
      expect(encodedValue).assertEqual("{\"nested\":[31]}");
      expect(card.opt('marker')).assertEqual(31);
      expect(card.opt('missing')).assertUndefined();
      expect(JSON.stringify(card.data)).assertEqual(before);
      const second = new TextCardData({ type: "test.card-values.31", data: JSON.parse("{\"value\":{\"nested\":[31]},\"marker\":31}") });
      expect(JSON.stringify(second.opt('value'))).assertEqual(encodedValue);
      expect(card.data === second.data).assertFalse();
      expect(card.getObjectId() === second.getObjectId()).assertFalse();
      expect(card.type).assertEqual("test.card-values.31");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name PayloadValuesTest_case_033
     * @tc.desc card-values: preserve payload semantics and stable identity; input vector 33.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PayloadValuesTest_case_033', 0, () => {
      const payload = makePayload("", "100%", 32);
      const model: DataModel = makeModel("test.card-values.32", payload);
      const card = new CardData({ type: "test.card-values.32", data: JSON.parse("{\"value\":null,\"marker\":32}") });
      const before = JSON.stringify(card.data);
      const encodedValue = JSON.stringify(card.opt('value'));
      expect(encodedValue).assertEqual("null");
      expect(card.opt('marker')).assertEqual(32);
      expect(card.opt('missing')).assertUndefined();
      expect(JSON.stringify(card.data)).assertEqual(before);
      const second = new TextCardData({ type: "test.card-values.32", data: JSON.parse("{\"value\":null,\"marker\":32}") });
      expect(JSON.stringify(second.opt('value'))).assertEqual(encodedValue);
      expect(card.data === second.data).assertFalse();
      expect(card.getObjectId() === second.getObjectId()).assertFalse();
      expect(card.type).assertEqual("test.card-values.32");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name PayloadValuesTest_case_034
     * @tc.desc card-values: preserve payload semantics and stable identity; input vector 34.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PayloadValuesTest_case_034', 0, () => {
      const payload = makePayload("Card", "0%", 33);
      const model: DataModel = makeModel("test.card-values.33", payload);
      const card = new CardData({ type: "test.card-values.33", data: JSON.parse("{\"value\":false,\"marker\":33}") });
      const before = JSON.stringify(card.data);
      const encodedValue = JSON.stringify(card.opt('value'));
      expect(encodedValue).assertEqual("false");
      expect(card.opt('marker')).assertEqual(33);
      expect(card.opt('missing')).assertUndefined();
      expect(JSON.stringify(card.data)).assertEqual(before);
      const second = new TextCardData({ type: "test.card-values.33", data: JSON.parse("{\"value\":false,\"marker\":33}") });
      expect(JSON.stringify(second.opt('value'))).assertEqual(encodedValue);
      expect(card.data === second.data).assertFalse();
      expect(card.getObjectId() === second.getObjectId()).assertFalse();
      expect(card.type).assertEqual("test.card-values.33");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name PayloadValuesTest_case_035
     * @tc.desc card-values: preserve payload semantics and stable identity; input vector 35.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PayloadValuesTest_case_035', 0, () => {
      const payload = makePayload(" ", "50%", 34);
      const model: DataModel = makeModel("test.card-values.34", payload);
      const card = new CardData({ type: "test.card-values.34", data: JSON.parse("{\"value\":true,\"marker\":34}") });
      const before = JSON.stringify(card.data);
      const encodedValue = JSON.stringify(card.opt('value'));
      expect(encodedValue).assertEqual("true");
      expect(card.opt('marker')).assertEqual(34);
      expect(card.opt('missing')).assertUndefined();
      expect(JSON.stringify(card.data)).assertEqual(before);
      const second = new TextCardData({ type: "test.card-values.34", data: JSON.parse("{\"value\":true,\"marker\":34}") });
      expect(JSON.stringify(second.opt('value'))).assertEqual(encodedValue);
      expect(card.data === second.data).assertFalse();
      expect(card.getObjectId() === second.getObjectId()).assertFalse();
      expect(card.type).assertEqual("test.card-values.34");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name PayloadValuesTest_case_036
     * @tc.desc card-values: preserve payload semantics and stable identity; input vector 36.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PayloadValuesTest_case_036', 0, () => {
      const payload = makePayload("  padded  ", "1%", 35);
      const model: DataModel = makeModel("test.card-values.35", payload);
      const card = new CardData({ type: "test.card-values.35", data: JSON.parse("{\"value\":\"\",\"marker\":35}") });
      const before = JSON.stringify(card.data);
      const encodedValue = JSON.stringify(card.opt('value'));
      expect(encodedValue).assertEqual("\"\"");
      expect(card.opt('marker')).assertEqual(35);
      expect(card.opt('missing')).assertUndefined();
      expect(JSON.stringify(card.data)).assertEqual(before);
      const second = new TextCardData({ type: "test.card-values.35", data: JSON.parse("{\"value\":\"\",\"marker\":35}") });
      expect(JSON.stringify(second.opt('value'))).assertEqual(encodedValue);
      expect(card.data === second.data).assertFalse();
      expect(card.getObjectId() === second.getObjectId()).assertFalse();
      expect(card.type).assertEqual("test.card-values.35");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name PayloadValuesTest_case_037
     * @tc.desc card-values: preserve payload semantics and stable identity; input vector 37.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PayloadValuesTest_case_037', 0, () => {
      const payload = makePayload("multi word title", "99%", 36);
      const model: DataModel = makeModel("test.card-values.36", payload);
      const card = new CardData({ type: "test.card-values.36", data: JSON.parse("{\"value\":\"multi word title\",\"marker\":36}") });
      const before = JSON.stringify(card.data);
      const encodedValue = JSON.stringify(card.opt('value'));
      expect(encodedValue).assertEqual("\"multi word title\"");
      expect(card.opt('marker')).assertEqual(36);
      expect(card.opt('missing')).assertUndefined();
      expect(JSON.stringify(card.data)).assertEqual(before);
      const second = new TextCardData({ type: "test.card-values.36", data: JSON.parse("{\"value\":\"multi word title\",\"marker\":36}") });
      expect(JSON.stringify(second.opt('value'))).assertEqual(encodedValue);
      expect(card.data === second.data).assertFalse();
      expect(card.getObjectId() === second.getObjectId()).assertFalse();
      expect(card.type).assertEqual("test.card-values.36");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name PayloadValuesTest_case_038
     * @tc.desc card-values: preserve payload semantics and stable identity; input vector 38.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PayloadValuesTest_case_038', 0, () => {
      const payload = makePayload("line\nbreak", "75%", 37);
      const model: DataModel = makeModel("test.card-values.37", payload);
      const card = new CardData({ type: "test.card-values.37", data: JSON.parse("{\"value\":-0.5,\"marker\":37}") });
      const before = JSON.stringify(card.data);
      const encodedValue = JSON.stringify(card.opt('value'));
      expect(encodedValue).assertEqual("-0.5");
      expect(card.opt('marker')).assertEqual(37);
      expect(card.opt('missing')).assertUndefined();
      expect(JSON.stringify(card.data)).assertEqual(before);
      const second = new TextCardData({ type: "test.card-values.37", data: JSON.parse("{\"value\":-0.5,\"marker\":37}") });
      expect(JSON.stringify(second.opt('value'))).assertEqual(encodedValue);
      expect(card.data === second.data).assertFalse();
      expect(card.getObjectId() === second.getObjectId()).assertFalse();
      expect(card.type).assertEqual("test.card-values.37");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name PayloadValuesTest_case_039
     * @tc.desc card-values: preserve payload semantics and stable identity; input vector 39.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PayloadValuesTest_case_039', 0, () => {
      const payload = makePayload("tab\tvalue", "", 38);
      const model: DataModel = makeModel("test.card-values.38", payload);
      const card = new CardData({ type: "test.card-values.38", data: JSON.parse("{\"value\":[38,null,false],\"marker\":38}") });
      const before = JSON.stringify(card.data);
      const encodedValue = JSON.stringify(card.opt('value'));
      expect(encodedValue).assertEqual("[38,null,false]");
      expect(card.opt('marker')).assertEqual(38);
      expect(card.opt('missing')).assertUndefined();
      expect(JSON.stringify(card.data)).assertEqual(before);
      const second = new TextCardData({ type: "test.card-values.38", data: JSON.parse("{\"value\":[38,null,false],\"marker\":38}") });
      expect(JSON.stringify(second.opt('value'))).assertEqual(encodedValue);
      expect(card.data === second.data).assertFalse();
      expect(card.getObjectId() === second.getObjectId()).assertFalse();
      expect(card.type).assertEqual("test.card-values.38");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name PayloadValuesTest_case_040
     * @tc.desc card-values: preserve payload semantics and stable identity; input vector 40.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PayloadValuesTest_case_040', 0, () => {
      const payload = makePayload("\u5361\u7247 1", ":{{env(screen-width}}", 39);
      const model: DataModel = makeModel("test.card-values.39", payload);
      const card = new CardData({ type: "test.card-values.39", data: JSON.parse("{\"value\":{\"nested\":[39]},\"marker\":39}") });
      const before = JSON.stringify(card.data);
      const encodedValue = JSON.stringify(card.opt('value'));
      expect(encodedValue).assertEqual("{\"nested\":[39]}");
      expect(card.opt('marker')).assertEqual(39);
      expect(card.opt('missing')).assertUndefined();
      expect(JSON.stringify(card.data)).assertEqual(before);
      const second = new TextCardData({ type: "test.card-values.39", data: JSON.parse("{\"value\":{\"nested\":[39]},\"marker\":39}") });
      expect(JSON.stringify(second.opt('value'))).assertEqual(encodedValue);
      expect(card.data === second.data).assertFalse();
      expect(card.getObjectId() === second.getObjectId()).assertFalse();
      expect(card.type).assertEqual("test.card-values.39");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name PayloadValuesTest_case_041
     * @tc.desc card-values: preserve payload semantics and stable identity; input vector 41.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PayloadValuesTest_case_041', 0, () => {
      const payload = makePayload("\u5361\u7247 2", "100%", 40);
      const model: DataModel = makeModel("test.card-values.40", payload);
      const card = new CardData({ type: "test.card-values.40", data: JSON.parse("{\"value\":null,\"marker\":40}") });
      const before = JSON.stringify(card.data);
      const encodedValue = JSON.stringify(card.opt('value'));
      expect(encodedValue).assertEqual("null");
      expect(card.opt('marker')).assertEqual(40);
      expect(card.opt('missing')).assertUndefined();
      expect(JSON.stringify(card.data)).assertEqual(before);
      const second = new TextCardData({ type: "test.card-values.40", data: JSON.parse("{\"value\":null,\"marker\":40}") });
      expect(JSON.stringify(second.opt('value'))).assertEqual(encodedValue);
      expect(card.data === second.data).assertFalse();
      expect(card.getObjectId() === second.getObjectId()).assertFalse();
      expect(card.type).assertEqual("test.card-values.40");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name PayloadValuesTest_case_042
     * @tc.desc card-values: preserve payload semantics and stable identity; input vector 42.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PayloadValuesTest_case_042', 0, () => {
      const payload = makePayload("\u5361\u7247 3", "0%", 41);
      const model: DataModel = makeModel("test.card-values.41", payload);
      const card = new CardData({ type: "test.card-values.41", data: JSON.parse("{\"value\":false,\"marker\":41}") });
      const before = JSON.stringify(card.data);
      const encodedValue = JSON.stringify(card.opt('value'));
      expect(encodedValue).assertEqual("false");
      expect(card.opt('marker')).assertEqual(41);
      expect(card.opt('missing')).assertUndefined();
      expect(JSON.stringify(card.data)).assertEqual(before);
      const second = new TextCardData({ type: "test.card-values.41", data: JSON.parse("{\"value\":false,\"marker\":41}") });
      expect(JSON.stringify(second.opt('value'))).assertEqual(encodedValue);
      expect(card.data === second.data).assertFalse();
      expect(card.getObjectId() === second.getObjectId()).assertFalse();
      expect(card.type).assertEqual("test.card-values.41");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name PayloadValuesTest_case_043
     * @tc.desc card-values: preserve payload semantics and stable identity; input vector 43.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PayloadValuesTest_case_043', 0, () => {
      const payload = makePayload("\u65e5\u672c\u8a9e", "50%", 42);
      const model: DataModel = makeModel("test.card-values.42", payload);
      const card = new CardData({ type: "test.card-values.42", data: JSON.parse("{\"value\":true,\"marker\":42}") });
      const before = JSON.stringify(card.data);
      const encodedValue = JSON.stringify(card.opt('value'));
      expect(encodedValue).assertEqual("true");
      expect(card.opt('marker')).assertEqual(42);
      expect(card.opt('missing')).assertUndefined();
      expect(JSON.stringify(card.data)).assertEqual(before);
      const second = new TextCardData({ type: "test.card-values.42", data: JSON.parse("{\"value\":true,\"marker\":42}") });
      expect(JSON.stringify(second.opt('value'))).assertEqual(encodedValue);
      expect(card.data === second.data).assertFalse();
      expect(card.getObjectId() === second.getObjectId()).assertFalse();
      expect(card.type).assertEqual("test.card-values.42");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name PayloadValuesTest_case_044
     * @tc.desc card-values: preserve payload semantics and stable identity; input vector 44.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PayloadValuesTest_case_044', 0, () => {
      const payload = makePayload("\u0645\u0631\u062d\u0628\u0627", "1%", 43);
      const model: DataModel = makeModel("test.card-values.43", payload);
      const card = new CardData({ type: "test.card-values.43", data: JSON.parse("{\"value\":\"\",\"marker\":43}") });
      const before = JSON.stringify(card.data);
      const encodedValue = JSON.stringify(card.opt('value'));
      expect(encodedValue).assertEqual("\"\"");
      expect(card.opt('marker')).assertEqual(43);
      expect(card.opt('missing')).assertUndefined();
      expect(JSON.stringify(card.data)).assertEqual(before);
      const second = new TextCardData({ type: "test.card-values.43", data: JSON.parse("{\"value\":\"\",\"marker\":43}") });
      expect(JSON.stringify(second.opt('value'))).assertEqual(encodedValue);
      expect(card.data === second.data).assertFalse();
      expect(card.getObjectId() === second.getObjectId()).assertFalse();
      expect(card.type).assertEqual("test.card-values.43");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name PayloadValuesTest_case_045
     * @tc.desc card-values: preserve payload semantics and stable identity; input vector 45.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PayloadValuesTest_case_045', 0, () => {
      const payload = makePayload("\u05e9\u05dc\u05d5\u05dd", "99%", 44);
      const model: DataModel = makeModel("test.card-values.44", payload);
      const card = new CardData({ type: "test.card-values.44", data: JSON.parse("{\"value\":\"line\\nbreak\",\"marker\":44}") });
      const before = JSON.stringify(card.data);
      const encodedValue = JSON.stringify(card.opt('value'));
      expect(encodedValue).assertEqual("\"line\\nbreak\"");
      expect(card.opt('marker')).assertEqual(44);
      expect(card.opt('missing')).assertUndefined();
      expect(JSON.stringify(card.data)).assertEqual(before);
      const second = new TextCardData({ type: "test.card-values.44", data: JSON.parse("{\"value\":\"line\\nbreak\",\"marker\":44}") });
      expect(JSON.stringify(second.opt('value'))).assertEqual(encodedValue);
      expect(card.data === second.data).assertFalse();
      expect(card.getObjectId() === second.getObjectId()).assertFalse();
      expect(card.type).assertEqual("test.card-values.44");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name PayloadValuesTest_case_046
     * @tc.desc card-values: preserve payload semantics and stable identity; input vector 46.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PayloadValuesTest_case_046', 0, () => {
      const payload = makePayload("e\u0301", "75%", 45);
      const model: DataModel = makeModel("test.card-values.45", payload);
      const card = new CardData({ type: "test.card-values.45", data: JSON.parse("{\"value\":2147483647,\"marker\":45}") });
      const before = JSON.stringify(card.data);
      const encodedValue = JSON.stringify(card.opt('value'));
      expect(encodedValue).assertEqual("2147483647");
      expect(card.opt('marker')).assertEqual(45);
      expect(card.opt('missing')).assertUndefined();
      expect(JSON.stringify(card.data)).assertEqual(before);
      const second = new TextCardData({ type: "test.card-values.45", data: JSON.parse("{\"value\":2147483647,\"marker\":45}") });
      expect(JSON.stringify(second.opt('value'))).assertEqual(encodedValue);
      expect(card.data === second.data).assertFalse();
      expect(card.getObjectId() === second.getObjectId()).assertFalse();
      expect(card.type).assertEqual("test.card-values.45");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name PayloadValuesTest_case_047
     * @tc.desc card-values: preserve payload semantics and stable identity; input vector 47.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PayloadValuesTest_case_047', 0, () => {
      const payload = makePayload("\u00e9", "", 46);
      const model: DataModel = makeModel("test.card-values.46", payload);
      const card = new CardData({ type: "test.card-values.46", data: JSON.parse("{\"value\":[46,null,false],\"marker\":46}") });
      const before = JSON.stringify(card.data);
      const encodedValue = JSON.stringify(card.opt('value'));
      expect(encodedValue).assertEqual("[46,null,false]");
      expect(card.opt('marker')).assertEqual(46);
      expect(card.opt('missing')).assertUndefined();
      expect(JSON.stringify(card.data)).assertEqual(before);
      const second = new TextCardData({ type: "test.card-values.46", data: JSON.parse("{\"value\":[46,null,false],\"marker\":46}") });
      expect(JSON.stringify(second.opt('value'))).assertEqual(encodedValue);
      expect(card.data === second.data).assertFalse();
      expect(card.getObjectId() === second.getObjectId()).assertFalse();
      expect(card.type).assertEqual("test.card-values.46");
      expect(card.getObjectId().length > 0).assertTrue();
    });
  });
}
