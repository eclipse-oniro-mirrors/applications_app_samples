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

// Reference: ets/test/Integration/LocalizationTesting.test.ets
// Original line floor: 690; scenario family: card-unicode.
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

export default function UnicodeCardDataTest(): void {
  describe('UnicodeCardDataTest', () => {
    beforeAll(() => {
      logSuite('UnicodeCardDataTest', 'begin');
    });
    beforeEach(async () => {
      // Yield between cases so device watchdog and UI events can be processed.
      await new Promise<void>((resolve) => { setTimeout(resolve, 1); });
    });
    afterAll(() => {
      logSuite('UnicodeCardDataTest', 'end');
    });

    /**
     * @tc.name UnicodeCardDataTest_case_001
     * @tc.desc card-unicode: preserve payload semantics and stable identity; input vector 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('UnicodeCardDataTest_case_001', 0, () => {
      const payload = makePayload("", "100%", 0);
      const model: DataModel = makeModel("test.card-unicode.0", payload);
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
      expect(card.type).assertEqual("test.card-unicode.0");
      expect(card.getObjectId().length > 0).assertTrue();
      const encoded = JSON.stringify(card.opt('item').title.name);
      expect(encoded).assertEqual(JSON.stringify(""));
      expect(card.opt('item').title.name.length).assertEqual(0);
    });

    /**
     * @tc.name UnicodeCardDataTest_case_002
     * @tc.desc card-unicode: preserve payload semantics and stable identity; input vector 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('UnicodeCardDataTest_case_002', 0, () => {
      const payload = makePayload("Card", "0%", 1);
      const model: DataModel = makeModel("test.card-unicode.1", payload);
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
      expect(card.type).assertEqual("test.card-unicode.1");
      expect(card.getObjectId().length > 0).assertTrue();
      const encoded = JSON.stringify(card.opt('item').title.name);
      expect(encoded).assertEqual(JSON.stringify("Card"));
      expect(card.opt('item').title.name.length).assertEqual(4);
    });

    /**
     * @tc.name UnicodeCardDataTest_case_003
     * @tc.desc card-unicode: preserve payload semantics and stable identity; input vector 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('UnicodeCardDataTest_case_003', 0, () => {
      const payload = makePayload(" ", "50%", 2);
      const model: DataModel = makeModel("test.card-unicode.2", payload);
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
      expect(card.type).assertEqual("test.card-unicode.2");
      expect(card.getObjectId().length > 0).assertTrue();
      const encoded = JSON.stringify(card.opt('item').title.name);
      expect(encoded).assertEqual(JSON.stringify(" "));
      expect(card.opt('item').title.name.length).assertEqual(1);
    });

    /**
     * @tc.name UnicodeCardDataTest_case_004
     * @tc.desc card-unicode: preserve payload semantics and stable identity; input vector 4.
     * @tc.type Function
     * @tc.level Level1
     */
    it('UnicodeCardDataTest_case_004', 0, () => {
      const payload = makePayload("  padded  ", "1%", 3);
      const model: DataModel = makeModel("test.card-unicode.3", payload);
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
      expect(card.type).assertEqual("test.card-unicode.3");
      expect(card.getObjectId().length > 0).assertTrue();
      const encoded = JSON.stringify(card.opt('item').title.name);
      expect(encoded).assertEqual(JSON.stringify("  padded  "));
      expect(card.opt('item').title.name.length).assertEqual(10);
    });

    /**
     * @tc.name UnicodeCardDataTest_case_005
     * @tc.desc card-unicode: preserve payload semantics and stable identity; input vector 5.
     * @tc.type Function
     * @tc.level Level1
     */
    it('UnicodeCardDataTest_case_005', 0, () => {
      const payload = makePayload("multi word title", "99%", 4);
      const model: DataModel = makeModel("test.card-unicode.4", payload);
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
      expect(card.type).assertEqual("test.card-unicode.4");
      expect(card.getObjectId().length > 0).assertTrue();
      const encoded = JSON.stringify(card.opt('item').title.name);
      expect(encoded).assertEqual(JSON.stringify("multi word title"));
      expect(card.opt('item').title.name.length).assertEqual(16);
    });

    /**
     * @tc.name UnicodeCardDataTest_case_006
     * @tc.desc card-unicode: preserve payload semantics and stable identity; input vector 6.
     * @tc.type Function
     * @tc.level Level1
     */
    it('UnicodeCardDataTest_case_006', 0, () => {
      const payload = makePayload("line\nbreak", "75%", 5);
      const model: DataModel = makeModel("test.card-unicode.5", payload);
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
      expect(card.type).assertEqual("test.card-unicode.5");
      expect(card.getObjectId().length > 0).assertTrue();
      const encoded = JSON.stringify(card.opt('item').title.name);
      expect(encoded).assertEqual(JSON.stringify("line\nbreak"));
      expect(card.opt('item').title.name.length).assertEqual(10);
    });

    /**
     * @tc.name UnicodeCardDataTest_case_007
     * @tc.desc card-unicode: preserve payload semantics and stable identity; input vector 7.
     * @tc.type Function
     * @tc.level Level1
     */
    it('UnicodeCardDataTest_case_007', 0, () => {
      const payload = makePayload("tab\tvalue", "", 6);
      const model: DataModel = makeModel("test.card-unicode.6", payload);
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
      expect(card.type).assertEqual("test.card-unicode.6");
      expect(card.getObjectId().length > 0).assertTrue();
      const encoded = JSON.stringify(card.opt('item').title.name);
      expect(encoded).assertEqual(JSON.stringify("tab\tvalue"));
      expect(card.opt('item').title.name.length).assertEqual(9);
    });

    /**
     * @tc.name UnicodeCardDataTest_case_008
     * @tc.desc card-unicode: preserve payload semantics and stable identity; input vector 8.
     * @tc.type Function
     * @tc.level Level1
     */
    it('UnicodeCardDataTest_case_008', 0, () => {
      const payload = makePayload("\u5361\u7247 1", ":{{env(screen-width}}", 7);
      const model: DataModel = makeModel("test.card-unicode.7", payload);
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
      expect(card.type).assertEqual("test.card-unicode.7");
      expect(card.getObjectId().length > 0).assertTrue();
      const encoded = JSON.stringify(card.opt('item').title.name);
      expect(encoded).assertEqual(JSON.stringify("\u5361\u7247 1"));
      expect(card.opt('item').title.name.length).assertEqual(4);
    });

    /**
     * @tc.name UnicodeCardDataTest_case_009
     * @tc.desc card-unicode: preserve payload semantics and stable identity; input vector 9.
     * @tc.type Function
     * @tc.level Level1
     */
    it('UnicodeCardDataTest_case_009', 0, () => {
      const payload = makePayload("\u5361\u7247 2", "100%", 8);
      const model: DataModel = makeModel("test.card-unicode.8", payload);
      const card = new CardData(model);
      const originalId = card.getObjectId();
      expect(card.data === payload).assertTrue();
      expect(card.opt('item') === payload.item).assertTrue();
      expect(card.opt('style') === payload.style).assertTrue();
      expect(card.opt('item').title.name).assertEqual("\u5361\u7247 2");
      expect(card.opt('style').width).assertEqual("100%");
      expect(card.opt('sequence')).assertEqual(8);
      expect(card.opt('enabled')).assertEqual(true);
      expect(card.opt('amount')).assertEqual(4);
      expect(card.opt('tags')[0]).assertEqual("\u5361\u7247 2");
      expect(card.opt('tags')[1]).assertEqual("8");
      expect(card.opt('unknown-property')).assertUndefined();
      expect(card.getObjectId()).assertEqual(originalId);
      expect(card.type).assertEqual("test.card-unicode.8");
      expect(card.getObjectId().length > 0).assertTrue();
      const encoded = JSON.stringify(card.opt('item').title.name);
      expect(encoded).assertEqual(JSON.stringify("\u5361\u7247 2"));
      expect(card.opt('item').title.name.length).assertEqual(4);
    });

    /**
     * @tc.name UnicodeCardDataTest_case_010
     * @tc.desc card-unicode: preserve payload semantics and stable identity; input vector 10.
     * @tc.type Function
     * @tc.level Level1
     */
    it('UnicodeCardDataTest_case_010', 0, () => {
      const payload = makePayload("\u5361\u7247 3", "0%", 9);
      const model: DataModel = makeModel("test.card-unicode.9", payload);
      const card = new TextCardData(model);
      const originalId = card.getObjectId();
      expect(card.data === payload).assertTrue();
      expect(card.opt('item') === payload.item).assertTrue();
      expect(card.opt('style') === payload.style).assertTrue();
      expect(card.opt('item').title.name).assertEqual("\u5361\u7247 3");
      expect(card.opt('style').width).assertEqual("0%");
      expect(card.opt('sequence')).assertEqual(9);
      expect(card.opt('enabled')).assertEqual(false);
      expect(card.opt('amount')).assertEqual(4.5);
      expect(card.opt('tags')[0]).assertEqual("\u5361\u7247 3");
      expect(card.opt('tags')[1]).assertEqual("9");
      expect(card.opt('unknown-property')).assertUndefined();
      expect(card.getObjectId()).assertEqual(originalId);
      expect(card.type).assertEqual("test.card-unicode.9");
      expect(card.getObjectId().length > 0).assertTrue();
      const encoded = JSON.stringify(card.opt('item').title.name);
      expect(encoded).assertEqual(JSON.stringify("\u5361\u7247 3"));
      expect(card.opt('item').title.name.length).assertEqual(4);
    });

    /**
     * @tc.name UnicodeCardDataTest_case_011
     * @tc.desc card-unicode: preserve payload semantics and stable identity; input vector 11.
     * @tc.type Function
     * @tc.level Level1
     */
    it('UnicodeCardDataTest_case_011', 0, () => {
      const payload = makePayload("\u65e5\u672c\u8a9e", "50%", 10);
      const model: DataModel = makeModel("test.card-unicode.10", payload);
      const card = new CardData(model);
      const originalId = card.getObjectId();
      expect(card.data === payload).assertTrue();
      expect(card.opt('item') === payload.item).assertTrue();
      expect(card.opt('style') === payload.style).assertTrue();
      expect(card.opt('item').title.name).assertEqual("\u65e5\u672c\u8a9e");
      expect(card.opt('style').width).assertEqual("50%");
      expect(card.opt('sequence')).assertEqual(10);
      expect(card.opt('enabled')).assertEqual(true);
      expect(card.opt('amount')).assertEqual(5);
      expect(card.opt('tags')[0]).assertEqual("\u65e5\u672c\u8a9e");
      expect(card.opt('tags')[1]).assertEqual("10");
      expect(card.opt('unknown-property')).assertUndefined();
      expect(card.getObjectId()).assertEqual(originalId);
      expect(card.type).assertEqual("test.card-unicode.10");
      expect(card.getObjectId().length > 0).assertTrue();
      const encoded = JSON.stringify(card.opt('item').title.name);
      expect(encoded).assertEqual(JSON.stringify("\u65e5\u672c\u8a9e"));
      expect(card.opt('item').title.name.length).assertEqual(3);
    });

    /**
     * @tc.name UnicodeCardDataTest_case_012
     * @tc.desc card-unicode: preserve payload semantics and stable identity; input vector 12.
     * @tc.type Function
     * @tc.level Level1
     */
    it('UnicodeCardDataTest_case_012', 0, () => {
      const payload = makePayload("\u0645\u0631\u062d\u0628\u0627", "1%", 11);
      const model: DataModel = makeModel("test.card-unicode.11", payload);
      const card = new TextCardData(model);
      const originalId = card.getObjectId();
      expect(card.data === payload).assertTrue();
      expect(card.opt('item') === payload.item).assertTrue();
      expect(card.opt('style') === payload.style).assertTrue();
      expect(card.opt('item').title.name).assertEqual("\u0645\u0631\u062d\u0628\u0627");
      expect(card.opt('style').width).assertEqual("1%");
      expect(card.opt('sequence')).assertEqual(11);
      expect(card.opt('enabled')).assertEqual(false);
      expect(card.opt('amount')).assertEqual(5.5);
      expect(card.opt('tags')[0]).assertEqual("\u0645\u0631\u062d\u0628\u0627");
      expect(card.opt('tags')[1]).assertEqual("11");
      expect(card.opt('unknown-property')).assertUndefined();
      expect(card.getObjectId()).assertEqual(originalId);
      expect(card.type).assertEqual("test.card-unicode.11");
      expect(card.getObjectId().length > 0).assertTrue();
      const encoded = JSON.stringify(card.opt('item').title.name);
      expect(encoded).assertEqual(JSON.stringify("\u0645\u0631\u062d\u0628\u0627"));
      expect(card.opt('item').title.name.length).assertEqual(5);
    });

    /**
     * @tc.name UnicodeCardDataTest_case_013
     * @tc.desc card-unicode: preserve payload semantics and stable identity; input vector 13.
     * @tc.type Function
     * @tc.level Level1
     */
    it('UnicodeCardDataTest_case_013', 0, () => {
      const payload = makePayload("\u05e9\u05dc\u05d5\u05dd", "99%", 12);
      const model: DataModel = makeModel("test.card-unicode.12", payload);
      const card = new CardData(model);
      const originalId = card.getObjectId();
      expect(card.data === payload).assertTrue();
      expect(card.opt('item') === payload.item).assertTrue();
      expect(card.opt('style') === payload.style).assertTrue();
      expect(card.opt('item').title.name).assertEqual("\u05e9\u05dc\u05d5\u05dd");
      expect(card.opt('style').width).assertEqual("99%");
      expect(card.opt('sequence')).assertEqual(12);
      expect(card.opt('enabled')).assertEqual(true);
      expect(card.opt('amount')).assertEqual(6);
      expect(card.opt('tags')[0]).assertEqual("\u05e9\u05dc\u05d5\u05dd");
      expect(card.opt('tags')[1]).assertEqual("12");
      expect(card.opt('unknown-property')).assertUndefined();
      expect(card.getObjectId()).assertEqual(originalId);
      expect(card.type).assertEqual("test.card-unicode.12");
      expect(card.getObjectId().length > 0).assertTrue();
      const encoded = JSON.stringify(card.opt('item').title.name);
      expect(encoded).assertEqual(JSON.stringify("\u05e9\u05dc\u05d5\u05dd"));
      expect(card.opt('item').title.name.length).assertEqual(4);
    });

    /**
     * @tc.name UnicodeCardDataTest_case_014
     * @tc.desc card-unicode: preserve payload semantics and stable identity; input vector 14.
     * @tc.type Function
     * @tc.level Level1
     */
    it('UnicodeCardDataTest_case_014', 0, () => {
      const payload = makePayload("e\u0301", "75%", 13);
      const model: DataModel = makeModel("test.card-unicode.13", payload);
      const card = new TextCardData(model);
      const originalId = card.getObjectId();
      expect(card.data === payload).assertTrue();
      expect(card.opt('item') === payload.item).assertTrue();
      expect(card.opt('style') === payload.style).assertTrue();
      expect(card.opt('item').title.name).assertEqual("e\u0301");
      expect(card.opt('style').width).assertEqual("75%");
      expect(card.opt('sequence')).assertEqual(13);
      expect(card.opt('enabled')).assertEqual(false);
      expect(card.opt('amount')).assertEqual(6.5);
      expect(card.opt('tags')[0]).assertEqual("e\u0301");
      expect(card.opt('tags')[1]).assertEqual("13");
      expect(card.opt('unknown-property')).assertUndefined();
      expect(card.getObjectId()).assertEqual(originalId);
      expect(card.type).assertEqual("test.card-unicode.13");
      expect(card.getObjectId().length > 0).assertTrue();
      const encoded = JSON.stringify(card.opt('item').title.name);
      expect(encoded).assertEqual(JSON.stringify("e\u0301"));
      expect(card.opt('item').title.name.length).assertEqual(2);
    });

    /**
     * @tc.name UnicodeCardDataTest_case_015
     * @tc.desc card-unicode: preserve payload semantics and stable identity; input vector 15.
     * @tc.type Function
     * @tc.level Level1
     */
    it('UnicodeCardDataTest_case_015', 0, () => {
      const payload = makePayload("\u00e9", "", 14);
      const model: DataModel = makeModel("test.card-unicode.14", payload);
      const card = new CardData(model);
      const originalId = card.getObjectId();
      expect(card.data === payload).assertTrue();
      expect(card.opt('item') === payload.item).assertTrue();
      expect(card.opt('style') === payload.style).assertTrue();
      expect(card.opt('item').title.name).assertEqual("\u00e9");
      expect(card.opt('style').width).assertEqual("");
      expect(card.opt('sequence')).assertEqual(14);
      expect(card.opt('enabled')).assertEqual(true);
      expect(card.opt('amount')).assertEqual(7);
      expect(card.opt('tags')[0]).assertEqual("\u00e9");
      expect(card.opt('tags')[1]).assertEqual("14");
      expect(card.opt('unknown-property')).assertUndefined();
      expect(card.getObjectId()).assertEqual(originalId);
      expect(card.type).assertEqual("test.card-unicode.14");
      expect(card.getObjectId().length > 0).assertTrue();
      const encoded = JSON.stringify(card.opt('item').title.name);
      expect(encoded).assertEqual(JSON.stringify("\u00e9"));
      expect(card.opt('item').title.name.length).assertEqual(1);
    });

    /**
     * @tc.name UnicodeCardDataTest_case_016
     * @tc.desc card-unicode: preserve payload semantics and stable identity; input vector 16.
     * @tc.type Function
     * @tc.level Level1
     */
    it('UnicodeCardDataTest_case_016', 0, () => {
      const payload = makePayload("\ud83d\ude80", ":{{env(screen-width}}", 15);
      const model: DataModel = makeModel("test.card-unicode.15", payload);
      const card = new TextCardData(model);
      const originalId = card.getObjectId();
      expect(card.data === payload).assertTrue();
      expect(card.opt('item') === payload.item).assertTrue();
      expect(card.opt('style') === payload.style).assertTrue();
      expect(card.opt('item').title.name).assertEqual("\ud83d\ude80");
      expect(card.opt('style').width).assertEqual(":{{env(screen-width}}");
      expect(card.opt('sequence')).assertEqual(15);
      expect(card.opt('enabled')).assertEqual(false);
      expect(card.opt('amount')).assertEqual(7.5);
      expect(card.opt('tags')[0]).assertEqual("\ud83d\ude80");
      expect(card.opt('tags')[1]).assertEqual("15");
      expect(card.opt('unknown-property')).assertUndefined();
      expect(card.getObjectId()).assertEqual(originalId);
      expect(card.type).assertEqual("test.card-unicode.15");
      expect(card.getObjectId().length > 0).assertTrue();
      const encoded = JSON.stringify(card.opt('item').title.name);
      expect(encoded).assertEqual(JSON.stringify("\ud83d\ude80"));
      expect(card.opt('item').title.name.length).assertEqual(2);
    });

    /**
     * @tc.name UnicodeCardDataTest_case_017
     * @tc.desc card-unicode: preserve payload semantics and stable identity; input vector 17.
     * @tc.type Function
     * @tc.level Level1
     */
    it('UnicodeCardDataTest_case_017', 0, () => {
      const payload = makePayload("quote\"slash\\", "100%", 16);
      const model: DataModel = makeModel("test.card-unicode.16", payload);
      const card = new CardData(model);
      const originalId = card.getObjectId();
      expect(card.data === payload).assertTrue();
      expect(card.opt('item') === payload.item).assertTrue();
      expect(card.opt('style') === payload.style).assertTrue();
      expect(card.opt('item').title.name).assertEqual("quote\"slash\\");
      expect(card.opt('style').width).assertEqual("100%");
      expect(card.opt('sequence')).assertEqual(16);
      expect(card.opt('enabled')).assertEqual(true);
      expect(card.opt('amount')).assertEqual(8);
      expect(card.opt('tags')[0]).assertEqual("quote\"slash\\");
      expect(card.opt('tags')[1]).assertEqual("16");
      expect(card.opt('unknown-property')).assertUndefined();
      expect(card.getObjectId()).assertEqual(originalId);
      expect(card.type).assertEqual("test.card-unicode.16");
      expect(card.getObjectId().length > 0).assertTrue();
      const encoded = JSON.stringify(card.opt('item').title.name);
      expect(encoded).assertEqual(JSON.stringify("quote\"slash\\"));
      expect(card.opt('item').title.name.length).assertEqual(12);
    });

    /**
     * @tc.name UnicodeCardDataTest_case_018
     * @tc.desc card-unicode: preserve payload semantics and stable identity; input vector 18.
     * @tc.type Function
     * @tc.level Level1
     */
    it('UnicodeCardDataTest_case_018', 0, () => {
      const payload = makePayload("<script>alert(1)</script>", "0%", 17);
      const model: DataModel = makeModel("test.card-unicode.17", payload);
      const card = new TextCardData(model);
      const originalId = card.getObjectId();
      expect(card.data === payload).assertTrue();
      expect(card.opt('item') === payload.item).assertTrue();
      expect(card.opt('style') === payload.style).assertTrue();
      expect(card.opt('item').title.name).assertEqual("<script>alert(1)</script>");
      expect(card.opt('style').width).assertEqual("0%");
      expect(card.opt('sequence')).assertEqual(17);
      expect(card.opt('enabled')).assertEqual(false);
      expect(card.opt('amount')).assertEqual(8.5);
      expect(card.opt('tags')[0]).assertEqual("<script>alert(1)</script>");
      expect(card.opt('tags')[1]).assertEqual("17");
      expect(card.opt('unknown-property')).assertUndefined();
      expect(card.getObjectId()).assertEqual(originalId);
      expect(card.type).assertEqual("test.card-unicode.17");
      expect(card.getObjectId().length > 0).assertTrue();
      const encoded = JSON.stringify(card.opt('item').title.name);
      expect(encoded).assertEqual(JSON.stringify("<script>alert(1)</script>"));
      expect(card.opt('item').title.name.length).assertEqual(25);
    });

    /**
     * @tc.name UnicodeCardDataTest_case_019
     * @tc.desc card-unicode: preserve payload semantics and stable identity; input vector 19.
     * @tc.type Function
     * @tc.level Level1
     */
    it('UnicodeCardDataTest_case_019', 0, () => {
      const payload = makePayload("${notExecuted}", "50%", 18);
      const model: DataModel = makeModel("test.card-unicode.18", payload);
      const card = new CardData(model);
      const originalId = card.getObjectId();
      expect(card.data === payload).assertTrue();
      expect(card.opt('item') === payload.item).assertTrue();
      expect(card.opt('style') === payload.style).assertTrue();
      expect(card.opt('item').title.name).assertEqual("${notExecuted}");
      expect(card.opt('style').width).assertEqual("50%");
      expect(card.opt('sequence')).assertEqual(18);
      expect(card.opt('enabled')).assertEqual(true);
      expect(card.opt('amount')).assertEqual(9);
      expect(card.opt('tags')[0]).assertEqual("${notExecuted}");
      expect(card.opt('tags')[1]).assertEqual("18");
      expect(card.opt('unknown-property')).assertUndefined();
      expect(card.getObjectId()).assertEqual(originalId);
      expect(card.type).assertEqual("test.card-unicode.18");
      expect(card.getObjectId().length > 0).assertTrue();
      const encoded = JSON.stringify(card.opt('item').title.name);
      expect(encoded).assertEqual(JSON.stringify("${notExecuted}"));
      expect(card.opt('item').title.name.length).assertEqual(14);
    });

    /**
     * @tc.name UnicodeCardDataTest_case_020
     * @tc.desc card-unicode: preserve payload semantics and stable identity; input vector 20.
     * @tc.type Function
     * @tc.level Level1
     */
    it('UnicodeCardDataTest_case_020', 0, () => {
      const payload = makePayload("__proto__", "1%", 19);
      const model: DataModel = makeModel("test.card-unicode.19", payload);
      const card = new TextCardData(model);
      const originalId = card.getObjectId();
      expect(card.data === payload).assertTrue();
      expect(card.opt('item') === payload.item).assertTrue();
      expect(card.opt('style') === payload.style).assertTrue();
      expect(card.opt('item').title.name).assertEqual("__proto__");
      expect(card.opt('style').width).assertEqual("1%");
      expect(card.opt('sequence')).assertEqual(19);
      expect(card.opt('enabled')).assertEqual(false);
      expect(card.opt('amount')).assertEqual(9.5);
      expect(card.opt('tags')[0]).assertEqual("__proto__");
      expect(card.opt('tags')[1]).assertEqual("19");
      expect(card.opt('unknown-property')).assertUndefined();
      expect(card.getObjectId()).assertEqual(originalId);
      expect(card.type).assertEqual("test.card-unicode.19");
      expect(card.getObjectId().length > 0).assertTrue();
      const encoded = JSON.stringify(card.opt('item').title.name);
      expect(encoded).assertEqual(JSON.stringify("__proto__"));
      expect(card.opt('item').title.name.length).assertEqual(9);
    });

    /**
     * @tc.name UnicodeCardDataTest_case_021
     * @tc.desc card-unicode: preserve payload semantics and stable identity; input vector 21.
     * @tc.type Function
     * @tc.level Level1
     */
    it('UnicodeCardDataTest_case_021', 0, () => {
      const payload = makePayload("constructor", "99%", 20);
      const model: DataModel = makeModel("test.card-unicode.20", payload);
      const card = new CardData(model);
      const originalId = card.getObjectId();
      expect(card.data === payload).assertTrue();
      expect(card.opt('item') === payload.item).assertTrue();
      expect(card.opt('style') === payload.style).assertTrue();
      expect(card.opt('item').title.name).assertEqual("constructor");
      expect(card.opt('style').width).assertEqual("99%");
      expect(card.opt('sequence')).assertEqual(20);
      expect(card.opt('enabled')).assertEqual(true);
      expect(card.opt('amount')).assertEqual(10);
      expect(card.opt('tags')[0]).assertEqual("constructor");
      expect(card.opt('tags')[1]).assertEqual("20");
      expect(card.opt('unknown-property')).assertUndefined();
      expect(card.getObjectId()).assertEqual(originalId);
      expect(card.type).assertEqual("test.card-unicode.20");
      expect(card.getObjectId().length > 0).assertTrue();
      const encoded = JSON.stringify(card.opt('item').title.name);
      expect(encoded).assertEqual(JSON.stringify("constructor"));
      expect(card.opt('item').title.name.length).assertEqual(11);
    });

    /**
     * @tc.name UnicodeCardDataTest_case_022
     * @tc.desc card-unicode: preserve payload semantics and stable identity; input vector 22.
     * @tc.type Function
     * @tc.level Level1
     */
    it('UnicodeCardDataTest_case_022', 0, () => {
      const payload = makePayload("null", "75%", 21);
      const model: DataModel = makeModel("test.card-unicode.21", payload);
      const card = new TextCardData(model);
      const originalId = card.getObjectId();
      expect(card.data === payload).assertTrue();
      expect(card.opt('item') === payload.item).assertTrue();
      expect(card.opt('style') === payload.style).assertTrue();
      expect(card.opt('item').title.name).assertEqual("null");
      expect(card.opt('style').width).assertEqual("75%");
      expect(card.opt('sequence')).assertEqual(21);
      expect(card.opt('enabled')).assertEqual(false);
      expect(card.opt('amount')).assertEqual(10.5);
      expect(card.opt('tags')[0]).assertEqual("null");
      expect(card.opt('tags')[1]).assertEqual("21");
      expect(card.opt('unknown-property')).assertUndefined();
      expect(card.getObjectId()).assertEqual(originalId);
      expect(card.type).assertEqual("test.card-unicode.21");
      expect(card.getObjectId().length > 0).assertTrue();
      const encoded = JSON.stringify(card.opt('item').title.name);
      expect(encoded).assertEqual(JSON.stringify("null"));
      expect(card.opt('item').title.name.length).assertEqual(4);
    });
  });
}
