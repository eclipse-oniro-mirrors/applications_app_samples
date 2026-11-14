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

// Reference: ets/test/PowerDialog/PowerItemInfoModel.test.ets
// Original line floor: 949; scenario family: card-construction.
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

export default function CardConstructionTest(): void {
  describe('CardConstructionTest', () => {
    beforeAll(() => {
      logSuite('CardConstructionTest', 'begin');
    });
    beforeEach(async () => {
      // Yield between cases so device watchdog and UI events can be processed.
      await new Promise<void>((resolve) => { setTimeout(resolve, 1); });
    });
    afterAll(() => {
      logSuite('CardConstructionTest', 'end');
    });

    /**
     * @tc.name CardConstructionTest_case_001
     * @tc.desc card-construction: preserve payload semantics and stable identity; input vector 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CardConstructionTest_case_001', 0, () => {
      const payload = makePayload("", "100%", 0);
      const model: DataModel = makeModel("test.card-construction.0", payload);
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
      expect(card.type).assertEqual("test.card-construction.0");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name CardConstructionTest_case_002
     * @tc.desc card-construction: preserve payload semantics and stable identity; input vector 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CardConstructionTest_case_002', 0, () => {
      const payload = makePayload("Card", "0%", 1);
      const model: DataModel = makeModel("test.card-construction.1", payload);
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
      expect(card.type).assertEqual("test.card-construction.1");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name CardConstructionTest_case_003
     * @tc.desc card-construction: preserve payload semantics and stable identity; input vector 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CardConstructionTest_case_003', 0, () => {
      const payload = makePayload(" ", "50%", 2);
      const model: DataModel = makeModel("test.card-construction.2", payload);
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
      expect(card.type).assertEqual("test.card-construction.2");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name CardConstructionTest_case_004
     * @tc.desc card-construction: preserve payload semantics and stable identity; input vector 4.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CardConstructionTest_case_004', 0, () => {
      const payload = makePayload("  padded  ", "1%", 3);
      const model: DataModel = makeModel("test.card-construction.3", payload);
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
      expect(card.type).assertEqual("test.card-construction.3");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name CardConstructionTest_case_005
     * @tc.desc card-construction: preserve payload semantics and stable identity; input vector 5.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CardConstructionTest_case_005', 0, () => {
      const payload = makePayload("multi word title", "99%", 4);
      const model: DataModel = makeModel("test.card-construction.4", payload);
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
      expect(card.type).assertEqual("test.card-construction.4");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name CardConstructionTest_case_006
     * @tc.desc card-construction: preserve payload semantics and stable identity; input vector 6.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CardConstructionTest_case_006', 0, () => {
      const payload = makePayload("line\nbreak", "75%", 5);
      const model: DataModel = makeModel("test.card-construction.5", payload);
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
      expect(card.type).assertEqual("test.card-construction.5");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name CardConstructionTest_case_007
     * @tc.desc card-construction: preserve payload semantics and stable identity; input vector 7.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CardConstructionTest_case_007', 0, () => {
      const payload = makePayload("tab\tvalue", "", 6);
      const model: DataModel = makeModel("test.card-construction.6", payload);
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
      expect(card.type).assertEqual("test.card-construction.6");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name CardConstructionTest_case_008
     * @tc.desc card-construction: preserve payload semantics and stable identity; input vector 8.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CardConstructionTest_case_008', 0, () => {
      const payload = makePayload("\u5361\u7247 1", ":{{env(screen-width}}", 7);
      const model: DataModel = makeModel("test.card-construction.7", payload);
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
      expect(card.type).assertEqual("test.card-construction.7");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name CardConstructionTest_case_009
     * @tc.desc card-construction: preserve payload semantics and stable identity; input vector 9.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CardConstructionTest_case_009', 0, () => {
      const payload = makePayload("\u5361\u7247 2", "100%", 8);
      const model: DataModel = makeModel("test.card-construction.8", payload);
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
      expect(card.type).assertEqual("test.card-construction.8");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name CardConstructionTest_case_010
     * @tc.desc card-construction: preserve payload semantics and stable identity; input vector 10.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CardConstructionTest_case_010', 0, () => {
      const payload = makePayload("\u5361\u7247 3", "0%", 9);
      const model: DataModel = makeModel("test.card-construction.9", payload);
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
      expect(card.type).assertEqual("test.card-construction.9");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name CardConstructionTest_case_011
     * @tc.desc card-construction: preserve payload semantics and stable identity; input vector 11.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CardConstructionTest_case_011', 0, () => {
      const payload = makePayload("\u65e5\u672c\u8a9e", "50%", 10);
      const model: DataModel = makeModel("test.card-construction.10", payload);
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
      expect(card.type).assertEqual("test.card-construction.10");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name CardConstructionTest_case_012
     * @tc.desc card-construction: preserve payload semantics and stable identity; input vector 12.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CardConstructionTest_case_012', 0, () => {
      const payload = makePayload("\u0645\u0631\u062d\u0628\u0627", "1%", 11);
      const model: DataModel = makeModel("test.card-construction.11", payload);
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
      expect(card.type).assertEqual("test.card-construction.11");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name CardConstructionTest_case_013
     * @tc.desc card-construction: preserve payload semantics and stable identity; input vector 13.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CardConstructionTest_case_013', 0, () => {
      const payload = makePayload("\u05e9\u05dc\u05d5\u05dd", "99%", 12);
      const model: DataModel = makeModel("test.card-construction.12", payload);
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
      expect(card.type).assertEqual("test.card-construction.12");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name CardConstructionTest_case_014
     * @tc.desc card-construction: preserve payload semantics and stable identity; input vector 14.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CardConstructionTest_case_014', 0, () => {
      const payload = makePayload("e\u0301", "75%", 13);
      const model: DataModel = makeModel("test.card-construction.13", payload);
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
      expect(card.type).assertEqual("test.card-construction.13");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name CardConstructionTest_case_015
     * @tc.desc card-construction: preserve payload semantics and stable identity; input vector 15.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CardConstructionTest_case_015', 0, () => {
      const payload = makePayload("\u00e9", "", 14);
      const model: DataModel = makeModel("test.card-construction.14", payload);
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
      expect(card.type).assertEqual("test.card-construction.14");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name CardConstructionTest_case_016
     * @tc.desc card-construction: preserve payload semantics and stable identity; input vector 16.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CardConstructionTest_case_016', 0, () => {
      const payload = makePayload("\ud83d\ude80", ":{{env(screen-width}}", 15);
      const model: DataModel = makeModel("test.card-construction.15", payload);
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
      expect(card.type).assertEqual("test.card-construction.15");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name CardConstructionTest_case_017
     * @tc.desc card-construction: preserve payload semantics and stable identity; input vector 17.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CardConstructionTest_case_017', 0, () => {
      const payload = makePayload("quote\"slash\\", "100%", 16);
      const model: DataModel = makeModel("test.card-construction.16", payload);
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
      expect(card.type).assertEqual("test.card-construction.16");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name CardConstructionTest_case_018
     * @tc.desc card-construction: preserve payload semantics and stable identity; input vector 18.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CardConstructionTest_case_018', 0, () => {
      const payload = makePayload("<script>alert(1)</script>", "0%", 17);
      const model: DataModel = makeModel("test.card-construction.17", payload);
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
      expect(card.type).assertEqual("test.card-construction.17");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name CardConstructionTest_case_019
     * @tc.desc card-construction: preserve payload semantics and stable identity; input vector 19.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CardConstructionTest_case_019', 0, () => {
      const payload = makePayload("${notExecuted}", "50%", 18);
      const model: DataModel = makeModel("test.card-construction.18", payload);
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
      expect(card.type).assertEqual("test.card-construction.18");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name CardConstructionTest_case_020
     * @tc.desc card-construction: preserve payload semantics and stable identity; input vector 20.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CardConstructionTest_case_020', 0, () => {
      const payload = makePayload("__proto__", "1%", 19);
      const model: DataModel = makeModel("test.card-construction.19", payload);
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
      expect(card.type).assertEqual("test.card-construction.19");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name CardConstructionTest_case_021
     * @tc.desc card-construction: preserve payload semantics and stable identity; input vector 21.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CardConstructionTest_case_021', 0, () => {
      const payload = makePayload("constructor", "99%", 20);
      const model: DataModel = makeModel("test.card-construction.20", payload);
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
      expect(card.type).assertEqual("test.card-construction.20");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name CardConstructionTest_case_022
     * @tc.desc card-construction: preserve payload semantics and stable identity; input vector 22.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CardConstructionTest_case_022', 0, () => {
      const payload = makePayload("null", "75%", 21);
      const model: DataModel = makeModel("test.card-construction.21", payload);
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
      expect(card.type).assertEqual("test.card-construction.21");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name CardConstructionTest_case_023
     * @tc.desc card-construction: preserve payload semantics and stable identity; input vector 23.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CardConstructionTest_case_023', 0, () => {
      const payload = makePayload("false", "", 22);
      const model: DataModel = makeModel("test.card-construction.22", payload);
      const card = new CardData(model);
      const originalId = card.getObjectId();
      expect(card.data === payload).assertTrue();
      expect(card.opt('item') === payload.item).assertTrue();
      expect(card.opt('style') === payload.style).assertTrue();
      expect(card.opt('item').title.name).assertEqual("false");
      expect(card.opt('style').width).assertEqual("");
      expect(card.opt('sequence')).assertEqual(22);
      expect(card.opt('enabled')).assertEqual(true);
      expect(card.opt('amount')).assertEqual(11);
      expect(card.opt('tags')[0]).assertEqual("false");
      expect(card.opt('tags')[1]).assertEqual("22");
      expect(card.opt('unknown-property')).assertUndefined();
      expect(card.getObjectId()).assertEqual(originalId);
      expect(card.type).assertEqual("test.card-construction.22");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name CardConstructionTest_case_024
     * @tc.desc card-construction: preserve payload semantics and stable identity; input vector 24.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CardConstructionTest_case_024', 0, () => {
      const payload = makePayload("0", ":{{env(screen-width}}", 23);
      const model: DataModel = makeModel("test.card-construction.23", payload);
      const card = new TextCardData(model);
      const originalId = card.getObjectId();
      expect(card.data === payload).assertTrue();
      expect(card.opt('item') === payload.item).assertTrue();
      expect(card.opt('style') === payload.style).assertTrue();
      expect(card.opt('item').title.name).assertEqual("0");
      expect(card.opt('style').width).assertEqual(":{{env(screen-width}}");
      expect(card.opt('sequence')).assertEqual(23);
      expect(card.opt('enabled')).assertEqual(false);
      expect(card.opt('amount')).assertEqual(11.5);
      expect(card.opt('tags')[0]).assertEqual("0");
      expect(card.opt('tags')[1]).assertEqual("23");
      expect(card.opt('unknown-property')).assertUndefined();
      expect(card.getObjectId()).assertEqual(originalId);
      expect(card.type).assertEqual("test.card-construction.23");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name CardConstructionTest_case_025
     * @tc.desc card-construction: preserve payload semantics and stable identity; input vector 25.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CardConstructionTest_case_025', 0, () => {
      const payload = makePayload("100%", "100%", 24);
      const model: DataModel = makeModel("test.card-construction.24", payload);
      const card = new CardData(model);
      const originalId = card.getObjectId();
      expect(card.data === payload).assertTrue();
      expect(card.opt('item') === payload.item).assertTrue();
      expect(card.opt('style') === payload.style).assertTrue();
      expect(card.opt('item').title.name).assertEqual("100%");
      expect(card.opt('style').width).assertEqual("100%");
      expect(card.opt('sequence')).assertEqual(24);
      expect(card.opt('enabled')).assertEqual(true);
      expect(card.opt('amount')).assertEqual(12);
      expect(card.opt('tags')[0]).assertEqual("100%");
      expect(card.opt('tags')[1]).assertEqual("24");
      expect(card.opt('unknown-property')).assertUndefined();
      expect(card.getObjectId()).assertEqual(originalId);
      expect(card.type).assertEqual("test.card-construction.24");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name CardConstructionTest_case_026
     * @tc.desc card-construction: preserve payload semantics and stable identity; input vector 26.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CardConstructionTest_case_026', 0, () => {
      const payload = makePayload("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA", "0%", 25);
      const model: DataModel = makeModel("test.card-construction.25", payload);
      const card = new TextCardData(model);
      const originalId = card.getObjectId();
      expect(card.data === payload).assertTrue();
      expect(card.opt('item') === payload.item).assertTrue();
      expect(card.opt('style') === payload.style).assertTrue();
      expect(card.opt('item').title.name).assertEqual("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA");
      expect(card.opt('style').width).assertEqual("0%");
      expect(card.opt('sequence')).assertEqual(25);
      expect(card.opt('enabled')).assertEqual(false);
      expect(card.opt('amount')).assertEqual(12.5);
      expect(card.opt('tags')[0]).assertEqual("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA");
      expect(card.opt('tags')[1]).assertEqual("25");
      expect(card.opt('unknown-property')).assertUndefined();
      expect(card.getObjectId()).assertEqual(originalId);
      expect(card.type).assertEqual("test.card-construction.25");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name CardConstructionTest_case_027
     * @tc.desc card-construction: preserve payload semantics and stable identity; input vector 27.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CardConstructionTest_case_027', 0, () => {
      const payload = makePayload("\u0000", "50%", 26);
      const model: DataModel = makeModel("test.card-construction.26", payload);
      const card = new CardData(model);
      const originalId = card.getObjectId();
      expect(card.data === payload).assertTrue();
      expect(card.opt('item') === payload.item).assertTrue();
      expect(card.opt('style') === payload.style).assertTrue();
      expect(card.opt('item').title.name).assertEqual("\u0000");
      expect(card.opt('style').width).assertEqual("50%");
      expect(card.opt('sequence')).assertEqual(26);
      expect(card.opt('enabled')).assertEqual(true);
      expect(card.opt('amount')).assertEqual(13);
      expect(card.opt('tags')[0]).assertEqual("\u0000");
      expect(card.opt('tags')[1]).assertEqual("26");
      expect(card.opt('unknown-property')).assertUndefined();
      expect(card.getObjectId()).assertEqual(originalId);
      expect(card.type).assertEqual("test.card-construction.26");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name CardConstructionTest_case_028
     * @tc.desc card-construction: preserve payload semantics and stable identity; input vector 28.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CardConstructionTest_case_028', 0, () => {
      const payload = makePayload("\u2028", "1%", 27);
      const model: DataModel = makeModel("test.card-construction.27", payload);
      const card = new TextCardData(model);
      const originalId = card.getObjectId();
      expect(card.data === payload).assertTrue();
      expect(card.opt('item') === payload.item).assertTrue();
      expect(card.opt('style') === payload.style).assertTrue();
      expect(card.opt('item').title.name).assertEqual("\u2028");
      expect(card.opt('style').width).assertEqual("1%");
      expect(card.opt('sequence')).assertEqual(27);
      expect(card.opt('enabled')).assertEqual(false);
      expect(card.opt('amount')).assertEqual(13.5);
      expect(card.opt('tags')[0]).assertEqual("\u2028");
      expect(card.opt('tags')[1]).assertEqual("27");
      expect(card.opt('unknown-property')).assertUndefined();
      expect(card.getObjectId()).assertEqual(originalId);
      expect(card.type).assertEqual("test.card-construction.27");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name CardConstructionTest_case_029
     * @tc.desc card-construction: preserve payload semantics and stable identity; input vector 29.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CardConstructionTest_case_029', 0, () => {
      const payload = makePayload("\u2029", "99%", 28);
      const model: DataModel = makeModel("test.card-construction.28", payload);
      const card = new CardData(model);
      const originalId = card.getObjectId();
      expect(card.data === payload).assertTrue();
      expect(card.opt('item') === payload.item).assertTrue();
      expect(card.opt('style') === payload.style).assertTrue();
      expect(card.opt('item').title.name).assertEqual("\u2029");
      expect(card.opt('style').width).assertEqual("99%");
      expect(card.opt('sequence')).assertEqual(28);
      expect(card.opt('enabled')).assertEqual(true);
      expect(card.opt('amount')).assertEqual(14);
      expect(card.opt('tags')[0]).assertEqual("\u2029");
      expect(card.opt('tags')[1]).assertEqual("28");
      expect(card.opt('unknown-property')).assertUndefined();
      expect(card.getObjectId()).assertEqual(originalId);
      expect(card.type).assertEqual("test.card-construction.28");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name CardConstructionTest_case_030
     * @tc.desc card-construction: preserve payload semantics and stable identity; input vector 30.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CardConstructionTest_case_030', 0, () => {
      const payload = makePayload("\r\n", "75%", 29);
      const model: DataModel = makeModel("test.card-construction.29", payload);
      const card = new TextCardData(model);
      const originalId = card.getObjectId();
      expect(card.data === payload).assertTrue();
      expect(card.opt('item') === payload.item).assertTrue();
      expect(card.opt('style') === payload.style).assertTrue();
      expect(card.opt('item').title.name).assertEqual("\r\n");
      expect(card.opt('style').width).assertEqual("75%");
      expect(card.opt('sequence')).assertEqual(29);
      expect(card.opt('enabled')).assertEqual(false);
      expect(card.opt('amount')).assertEqual(14.5);
      expect(card.opt('tags')[0]).assertEqual("\r\n");
      expect(card.opt('tags')[1]).assertEqual("29");
      expect(card.opt('unknown-property')).assertUndefined();
      expect(card.getObjectId()).assertEqual(originalId);
      expect(card.type).assertEqual("test.card-construction.29");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name CardConstructionTest_case_031
     * @tc.desc card-construction: preserve payload semantics and stable identity; input vector 31.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CardConstructionTest_case_031', 0, () => {
      const payload = makePayload("\ud83d\udc69\u200d\ud83d\udcbb", "", 30);
      const model: DataModel = makeModel("test.card-construction.30", payload);
      const card = new CardData(model);
      const originalId = card.getObjectId();
      expect(card.data === payload).assertTrue();
      expect(card.opt('item') === payload.item).assertTrue();
      expect(card.opt('style') === payload.style).assertTrue();
      expect(card.opt('item').title.name).assertEqual("\ud83d\udc69\u200d\ud83d\udcbb");
      expect(card.opt('style').width).assertEqual("");
      expect(card.opt('sequence')).assertEqual(30);
      expect(card.opt('enabled')).assertEqual(true);
      expect(card.opt('amount')).assertEqual(15);
      expect(card.opt('tags')[0]).assertEqual("\ud83d\udc69\u200d\ud83d\udcbb");
      expect(card.opt('tags')[1]).assertEqual("30");
      expect(card.opt('unknown-property')).assertUndefined();
      expect(card.getObjectId()).assertEqual(originalId);
      expect(card.type).assertEqual("test.card-construction.30");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name CardConstructionTest_case_032
     * @tc.desc card-construction: preserve payload semantics and stable identity; input vector 32.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CardConstructionTest_case_032', 0, () => {
      const payload = makePayload("end.", ":{{env(screen-width}}", 31);
      const model: DataModel = makeModel("test.card-construction.31", payload);
      const card = new TextCardData(model);
      const originalId = card.getObjectId();
      expect(card.data === payload).assertTrue();
      expect(card.opt('item') === payload.item).assertTrue();
      expect(card.opt('style') === payload.style).assertTrue();
      expect(card.opt('item').title.name).assertEqual("end.");
      expect(card.opt('style').width).assertEqual(":{{env(screen-width}}");
      expect(card.opt('sequence')).assertEqual(31);
      expect(card.opt('enabled')).assertEqual(false);
      expect(card.opt('amount')).assertEqual(15.5);
      expect(card.opt('tags')[0]).assertEqual("end.");
      expect(card.opt('tags')[1]).assertEqual("31");
      expect(card.opt('unknown-property')).assertUndefined();
      expect(card.getObjectId()).assertEqual(originalId);
      expect(card.type).assertEqual("test.card-construction.31");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name CardConstructionTest_case_033
     * @tc.desc card-construction: preserve payload semantics and stable identity; input vector 33.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CardConstructionTest_case_033', 0, () => {
      const payload = makePayload("", "100%", 32);
      const model: DataModel = makeModel("test.card-construction.32", payload);
      const card = new CardData(model);
      const originalId = card.getObjectId();
      expect(card.data === payload).assertTrue();
      expect(card.opt('item') === payload.item).assertTrue();
      expect(card.opt('style') === payload.style).assertTrue();
      expect(card.opt('item').title.name).assertEqual("");
      expect(card.opt('style').width).assertEqual("100%");
      expect(card.opt('sequence')).assertEqual(32);
      expect(card.opt('enabled')).assertEqual(true);
      expect(card.opt('amount')).assertEqual(16);
      expect(card.opt('tags')[0]).assertEqual("");
      expect(card.opt('tags')[1]).assertEqual("32");
      expect(card.opt('unknown-property')).assertUndefined();
      expect(card.getObjectId()).assertEqual(originalId);
      expect(card.type).assertEqual("test.card-construction.32");
      expect(card.getObjectId().length > 0).assertTrue();
    });
  });
}
