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

// Reference: ets/test/Interaction/ButtonInteraction.test.ets
// Original line floor: 870; scenario family: card-resolver.
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

export default function CardResolverTest(): void {
  describe('CardResolverTest', () => {
    beforeAll(() => {
      logSuite('CardResolverTest', 'begin');
    });
    beforeEach(async () => {
      // Yield between cases so device watchdog and UI events can be processed.
      await new Promise<void>((resolve) => { setTimeout(resolve, 1); });
    });
    afterAll(() => {
      logSuite('CardResolverTest', 'end');
    });

    /**
     * @tc.name CardResolverTest_case_001
     * @tc.desc card-resolver: preserve payload semantics and stable identity; input vector 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CardResolverTest_case_001', 0, () => {
      const payload = makePayload("", "100%", 0);
      const model: DataModel = makeModel("test.card-resolver.0", payload);
      const resolver = new CardResolver();
      const card = resolver.createData(model);
      const second = resolver.createData(model);
      expect(card instanceof TextCardData).assertTrue();
      expect(second instanceof TextCardData).assertTrue();
      expect(card === second).assertFalse();
      expect(card.getObjectId() === second.getObjectId()).assertFalse();
      expect(card.data === payload).assertTrue();
      expect(second.data === payload).assertTrue();
      expect(card.opt('item').title.name).assertEqual("");
      expect(card.type).assertEqual("test.card-resolver.0");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name CardResolverTest_case_002
     * @tc.desc card-resolver: preserve payload semantics and stable identity; input vector 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CardResolverTest_case_002', 0, () => {
      const payload = makePayload("Card", "0%", 1);
      const model: DataModel = makeModel("test.card-resolver.1", payload);
      const resolver = new CardResolver();
      const card = resolver.createData(model);
      const second = resolver.createData(model);
      expect(card instanceof TextCardData).assertTrue();
      expect(second instanceof TextCardData).assertTrue();
      expect(card === second).assertFalse();
      expect(card.getObjectId() === second.getObjectId()).assertFalse();
      expect(card.data === payload).assertTrue();
      expect(second.data === payload).assertTrue();
      expect(card.opt('item').title.name).assertEqual("Card");
      expect(card.type).assertEqual("test.card-resolver.1");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name CardResolverTest_case_003
     * @tc.desc card-resolver: preserve payload semantics and stable identity; input vector 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CardResolverTest_case_003', 0, () => {
      const payload = makePayload(" ", "50%", 2);
      const model: DataModel = makeModel("test.card-resolver.2", payload);
      const resolver = new CardResolver();
      const card = resolver.createData(model);
      const second = resolver.createData(model);
      expect(card instanceof TextCardData).assertTrue();
      expect(second instanceof TextCardData).assertTrue();
      expect(card === second).assertFalse();
      expect(card.getObjectId() === second.getObjectId()).assertFalse();
      expect(card.data === payload).assertTrue();
      expect(second.data === payload).assertTrue();
      expect(card.opt('item').title.name).assertEqual(" ");
      expect(card.type).assertEqual("test.card-resolver.2");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name CardResolverTest_case_004
     * @tc.desc card-resolver: preserve payload semantics and stable identity; input vector 4.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CardResolverTest_case_004', 0, () => {
      const payload = makePayload("  padded  ", "1%", 3);
      const model: DataModel = makeModel("test.card-resolver.3", payload);
      const resolver = new CardResolver();
      const card = resolver.createData(model);
      const second = resolver.createData(model);
      expect(card instanceof TextCardData).assertTrue();
      expect(second instanceof TextCardData).assertTrue();
      expect(card === second).assertFalse();
      expect(card.getObjectId() === second.getObjectId()).assertFalse();
      expect(card.data === payload).assertTrue();
      expect(second.data === payload).assertTrue();
      expect(card.opt('item').title.name).assertEqual("  padded  ");
      expect(card.type).assertEqual("test.card-resolver.3");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name CardResolverTest_case_005
     * @tc.desc card-resolver: preserve payload semantics and stable identity; input vector 5.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CardResolverTest_case_005', 0, () => {
      const payload = makePayload("multi word title", "99%", 4);
      const model: DataModel = makeModel("test.card-resolver.4", payload);
      const resolver = new CardResolver();
      const card = resolver.createData(model);
      const second = resolver.createData(model);
      expect(card instanceof TextCardData).assertTrue();
      expect(second instanceof TextCardData).assertTrue();
      expect(card === second).assertFalse();
      expect(card.getObjectId() === second.getObjectId()).assertFalse();
      expect(card.data === payload).assertTrue();
      expect(second.data === payload).assertTrue();
      expect(card.opt('item').title.name).assertEqual("multi word title");
      expect(card.type).assertEqual("test.card-resolver.4");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name CardResolverTest_case_006
     * @tc.desc card-resolver: preserve payload semantics and stable identity; input vector 6.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CardResolverTest_case_006', 0, () => {
      const payload = makePayload("line\nbreak", "75%", 5);
      const model: DataModel = makeModel("test.card-resolver.5", payload);
      const resolver = new CardResolver();
      const card = resolver.createData(model);
      const second = resolver.createData(model);
      expect(card instanceof TextCardData).assertTrue();
      expect(second instanceof TextCardData).assertTrue();
      expect(card === second).assertFalse();
      expect(card.getObjectId() === second.getObjectId()).assertFalse();
      expect(card.data === payload).assertTrue();
      expect(second.data === payload).assertTrue();
      expect(card.opt('item').title.name).assertEqual("line\nbreak");
      expect(card.type).assertEqual("test.card-resolver.5");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name CardResolverTest_case_007
     * @tc.desc card-resolver: preserve payload semantics and stable identity; input vector 7.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CardResolverTest_case_007', 0, () => {
      const payload = makePayload("tab\tvalue", "", 6);
      const model: DataModel = makeModel("test.card-resolver.6", payload);
      const resolver = new CardResolver();
      const card = resolver.createData(model);
      const second = resolver.createData(model);
      expect(card instanceof TextCardData).assertTrue();
      expect(second instanceof TextCardData).assertTrue();
      expect(card === second).assertFalse();
      expect(card.getObjectId() === second.getObjectId()).assertFalse();
      expect(card.data === payload).assertTrue();
      expect(second.data === payload).assertTrue();
      expect(card.opt('item').title.name).assertEqual("tab\tvalue");
      expect(card.type).assertEqual("test.card-resolver.6");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name CardResolverTest_case_008
     * @tc.desc card-resolver: preserve payload semantics and stable identity; input vector 8.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CardResolverTest_case_008', 0, () => {
      const payload = makePayload("\u5361\u7247 1", ":{{env(screen-width}}", 7);
      const model: DataModel = makeModel("test.card-resolver.7", payload);
      const resolver = new CardResolver();
      const card = resolver.createData(model);
      const second = resolver.createData(model);
      expect(card instanceof TextCardData).assertTrue();
      expect(second instanceof TextCardData).assertTrue();
      expect(card === second).assertFalse();
      expect(card.getObjectId() === second.getObjectId()).assertFalse();
      expect(card.data === payload).assertTrue();
      expect(second.data === payload).assertTrue();
      expect(card.opt('item').title.name).assertEqual("\u5361\u7247 1");
      expect(card.type).assertEqual("test.card-resolver.7");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name CardResolverTest_case_009
     * @tc.desc card-resolver: preserve payload semantics and stable identity; input vector 9.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CardResolverTest_case_009', 0, () => {
      const payload = makePayload("\u5361\u7247 2", "100%", 8);
      const model: DataModel = makeModel("test.card-resolver.8", payload);
      const resolver = new CardResolver();
      const card = resolver.createData(model);
      const second = resolver.createData(model);
      expect(card instanceof TextCardData).assertTrue();
      expect(second instanceof TextCardData).assertTrue();
      expect(card === second).assertFalse();
      expect(card.getObjectId() === second.getObjectId()).assertFalse();
      expect(card.data === payload).assertTrue();
      expect(second.data === payload).assertTrue();
      expect(card.opt('item').title.name).assertEqual("\u5361\u7247 2");
      expect(card.type).assertEqual("test.card-resolver.8");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name CardResolverTest_case_010
     * @tc.desc card-resolver: preserve payload semantics and stable identity; input vector 10.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CardResolverTest_case_010', 0, () => {
      const payload = makePayload("\u5361\u7247 3", "0%", 9);
      const model: DataModel = makeModel("test.card-resolver.9", payload);
      const resolver = new CardResolver();
      const card = resolver.createData(model);
      const second = resolver.createData(model);
      expect(card instanceof TextCardData).assertTrue();
      expect(second instanceof TextCardData).assertTrue();
      expect(card === second).assertFalse();
      expect(card.getObjectId() === second.getObjectId()).assertFalse();
      expect(card.data === payload).assertTrue();
      expect(second.data === payload).assertTrue();
      expect(card.opt('item').title.name).assertEqual("\u5361\u7247 3");
      expect(card.type).assertEqual("test.card-resolver.9");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name CardResolverTest_case_011
     * @tc.desc card-resolver: preserve payload semantics and stable identity; input vector 11.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CardResolverTest_case_011', 0, () => {
      const payload = makePayload("\u65e5\u672c\u8a9e", "50%", 10);
      const model: DataModel = makeModel("test.card-resolver.10", payload);
      const resolver = new CardResolver();
      const card = resolver.createData(model);
      const second = resolver.createData(model);
      expect(card instanceof TextCardData).assertTrue();
      expect(second instanceof TextCardData).assertTrue();
      expect(card === second).assertFalse();
      expect(card.getObjectId() === second.getObjectId()).assertFalse();
      expect(card.data === payload).assertTrue();
      expect(second.data === payload).assertTrue();
      expect(card.opt('item').title.name).assertEqual("\u65e5\u672c\u8a9e");
      expect(card.type).assertEqual("test.card-resolver.10");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name CardResolverTest_case_012
     * @tc.desc card-resolver: preserve payload semantics and stable identity; input vector 12.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CardResolverTest_case_012', 0, () => {
      const payload = makePayload("\u0645\u0631\u062d\u0628\u0627", "1%", 11);
      const model: DataModel = makeModel("test.card-resolver.11", payload);
      const resolver = new CardResolver();
      const card = resolver.createData(model);
      const second = resolver.createData(model);
      expect(card instanceof TextCardData).assertTrue();
      expect(second instanceof TextCardData).assertTrue();
      expect(card === second).assertFalse();
      expect(card.getObjectId() === second.getObjectId()).assertFalse();
      expect(card.data === payload).assertTrue();
      expect(second.data === payload).assertTrue();
      expect(card.opt('item').title.name).assertEqual("\u0645\u0631\u062d\u0628\u0627");
      expect(card.type).assertEqual("test.card-resolver.11");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name CardResolverTest_case_013
     * @tc.desc card-resolver: preserve payload semantics and stable identity; input vector 13.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CardResolverTest_case_013', 0, () => {
      const payload = makePayload("\u05e9\u05dc\u05d5\u05dd", "99%", 12);
      const model: DataModel = makeModel("test.card-resolver.12", payload);
      const resolver = new CardResolver();
      const card = resolver.createData(model);
      const second = resolver.createData(model);
      expect(card instanceof TextCardData).assertTrue();
      expect(second instanceof TextCardData).assertTrue();
      expect(card === second).assertFalse();
      expect(card.getObjectId() === second.getObjectId()).assertFalse();
      expect(card.data === payload).assertTrue();
      expect(second.data === payload).assertTrue();
      expect(card.opt('item').title.name).assertEqual("\u05e9\u05dc\u05d5\u05dd");
      expect(card.type).assertEqual("test.card-resolver.12");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name CardResolverTest_case_014
     * @tc.desc card-resolver: preserve payload semantics and stable identity; input vector 14.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CardResolverTest_case_014', 0, () => {
      const payload = makePayload("e\u0301", "75%", 13);
      const model: DataModel = makeModel("test.card-resolver.13", payload);
      const resolver = new CardResolver();
      const card = resolver.createData(model);
      const second = resolver.createData(model);
      expect(card instanceof TextCardData).assertTrue();
      expect(second instanceof TextCardData).assertTrue();
      expect(card === second).assertFalse();
      expect(card.getObjectId() === second.getObjectId()).assertFalse();
      expect(card.data === payload).assertTrue();
      expect(second.data === payload).assertTrue();
      expect(card.opt('item').title.name).assertEqual("e\u0301");
      expect(card.type).assertEqual("test.card-resolver.13");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name CardResolverTest_case_015
     * @tc.desc card-resolver: preserve payload semantics and stable identity; input vector 15.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CardResolverTest_case_015', 0, () => {
      const payload = makePayload("\u00e9", "", 14);
      const model: DataModel = makeModel("test.card-resolver.14", payload);
      const resolver = new CardResolver();
      const card = resolver.createData(model);
      const second = resolver.createData(model);
      expect(card instanceof TextCardData).assertTrue();
      expect(second instanceof TextCardData).assertTrue();
      expect(card === second).assertFalse();
      expect(card.getObjectId() === second.getObjectId()).assertFalse();
      expect(card.data === payload).assertTrue();
      expect(second.data === payload).assertTrue();
      expect(card.opt('item').title.name).assertEqual("\u00e9");
      expect(card.type).assertEqual("test.card-resolver.14");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name CardResolverTest_case_016
     * @tc.desc card-resolver: preserve payload semantics and stable identity; input vector 16.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CardResolverTest_case_016', 0, () => {
      const payload = makePayload("\ud83d\ude80", ":{{env(screen-width}}", 15);
      const model: DataModel = makeModel("test.card-resolver.15", payload);
      const resolver = new CardResolver();
      const card = resolver.createData(model);
      const second = resolver.createData(model);
      expect(card instanceof TextCardData).assertTrue();
      expect(second instanceof TextCardData).assertTrue();
      expect(card === second).assertFalse();
      expect(card.getObjectId() === second.getObjectId()).assertFalse();
      expect(card.data === payload).assertTrue();
      expect(second.data === payload).assertTrue();
      expect(card.opt('item').title.name).assertEqual("\ud83d\ude80");
      expect(card.type).assertEqual("test.card-resolver.15");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name CardResolverTest_case_017
     * @tc.desc card-resolver: preserve payload semantics and stable identity; input vector 17.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CardResolverTest_case_017', 0, () => {
      const payload = makePayload("quote\"slash\\", "100%", 16);
      const model: DataModel = makeModel("test.card-resolver.16", payload);
      const resolver = new CardResolver();
      const card = resolver.createData(model);
      const second = resolver.createData(model);
      expect(card instanceof TextCardData).assertTrue();
      expect(second instanceof TextCardData).assertTrue();
      expect(card === second).assertFalse();
      expect(card.getObjectId() === second.getObjectId()).assertFalse();
      expect(card.data === payload).assertTrue();
      expect(second.data === payload).assertTrue();
      expect(card.opt('item').title.name).assertEqual("quote\"slash\\");
      expect(card.type).assertEqual("test.card-resolver.16");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name CardResolverTest_case_018
     * @tc.desc card-resolver: preserve payload semantics and stable identity; input vector 18.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CardResolverTest_case_018', 0, () => {
      const payload = makePayload("<script>alert(1)</script>", "0%", 17);
      const model: DataModel = makeModel("test.card-resolver.17", payload);
      const resolver = new CardResolver();
      const card = resolver.createData(model);
      const second = resolver.createData(model);
      expect(card instanceof TextCardData).assertTrue();
      expect(second instanceof TextCardData).assertTrue();
      expect(card === second).assertFalse();
      expect(card.getObjectId() === second.getObjectId()).assertFalse();
      expect(card.data === payload).assertTrue();
      expect(second.data === payload).assertTrue();
      expect(card.opt('item').title.name).assertEqual("<script>alert(1)</script>");
      expect(card.type).assertEqual("test.card-resolver.17");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name CardResolverTest_case_019
     * @tc.desc card-resolver: preserve payload semantics and stable identity; input vector 19.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CardResolverTest_case_019', 0, () => {
      const payload = makePayload("${notExecuted}", "50%", 18);
      const model: DataModel = makeModel("test.card-resolver.18", payload);
      const resolver = new CardResolver();
      const card = resolver.createData(model);
      const second = resolver.createData(model);
      expect(card instanceof TextCardData).assertTrue();
      expect(second instanceof TextCardData).assertTrue();
      expect(card === second).assertFalse();
      expect(card.getObjectId() === second.getObjectId()).assertFalse();
      expect(card.data === payload).assertTrue();
      expect(second.data === payload).assertTrue();
      expect(card.opt('item').title.name).assertEqual("${notExecuted}");
      expect(card.type).assertEqual("test.card-resolver.18");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name CardResolverTest_case_020
     * @tc.desc card-resolver: preserve payload semantics and stable identity; input vector 20.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CardResolverTest_case_020', 0, () => {
      const payload = makePayload("__proto__", "1%", 19);
      const model: DataModel = makeModel("test.card-resolver.19", payload);
      const resolver = new CardResolver();
      const card = resolver.createData(model);
      const second = resolver.createData(model);
      expect(card instanceof TextCardData).assertTrue();
      expect(second instanceof TextCardData).assertTrue();
      expect(card === second).assertFalse();
      expect(card.getObjectId() === second.getObjectId()).assertFalse();
      expect(card.data === payload).assertTrue();
      expect(second.data === payload).assertTrue();
      expect(card.opt('item').title.name).assertEqual("__proto__");
      expect(card.type).assertEqual("test.card-resolver.19");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name CardResolverTest_case_021
     * @tc.desc card-resolver: preserve payload semantics and stable identity; input vector 21.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CardResolverTest_case_021', 0, () => {
      const payload = makePayload("constructor", "99%", 20);
      const model: DataModel = makeModel("test.card-resolver.20", payload);
      const resolver = new CardResolver();
      const card = resolver.createData(model);
      const second = resolver.createData(model);
      expect(card instanceof TextCardData).assertTrue();
      expect(second instanceof TextCardData).assertTrue();
      expect(card === second).assertFalse();
      expect(card.getObjectId() === second.getObjectId()).assertFalse();
      expect(card.data === payload).assertTrue();
      expect(second.data === payload).assertTrue();
      expect(card.opt('item').title.name).assertEqual("constructor");
      expect(card.type).assertEqual("test.card-resolver.20");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name CardResolverTest_case_022
     * @tc.desc card-resolver: preserve payload semantics and stable identity; input vector 22.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CardResolverTest_case_022', 0, () => {
      const payload = makePayload("null", "75%", 21);
      const model: DataModel = makeModel("test.card-resolver.21", payload);
      const resolver = new CardResolver();
      const card = resolver.createData(model);
      const second = resolver.createData(model);
      expect(card instanceof TextCardData).assertTrue();
      expect(second instanceof TextCardData).assertTrue();
      expect(card === second).assertFalse();
      expect(card.getObjectId() === second.getObjectId()).assertFalse();
      expect(card.data === payload).assertTrue();
      expect(second.data === payload).assertTrue();
      expect(card.opt('item').title.name).assertEqual("null");
      expect(card.type).assertEqual("test.card-resolver.21");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name CardResolverTest_case_023
     * @tc.desc card-resolver: preserve payload semantics and stable identity; input vector 23.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CardResolverTest_case_023', 0, () => {
      const payload = makePayload("false", "", 22);
      const model: DataModel = makeModel("test.card-resolver.22", payload);
      const resolver = new CardResolver();
      const card = resolver.createData(model);
      const second = resolver.createData(model);
      expect(card instanceof TextCardData).assertTrue();
      expect(second instanceof TextCardData).assertTrue();
      expect(card === second).assertFalse();
      expect(card.getObjectId() === second.getObjectId()).assertFalse();
      expect(card.data === payload).assertTrue();
      expect(second.data === payload).assertTrue();
      expect(card.opt('item').title.name).assertEqual("false");
      expect(card.type).assertEqual("test.card-resolver.22");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name CardResolverTest_case_024
     * @tc.desc card-resolver: preserve payload semantics and stable identity; input vector 24.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CardResolverTest_case_024', 0, () => {
      const payload = makePayload("0", ":{{env(screen-width}}", 23);
      const model: DataModel = makeModel("test.card-resolver.23", payload);
      const resolver = new CardResolver();
      const card = resolver.createData(model);
      const second = resolver.createData(model);
      expect(card instanceof TextCardData).assertTrue();
      expect(second instanceof TextCardData).assertTrue();
      expect(card === second).assertFalse();
      expect(card.getObjectId() === second.getObjectId()).assertFalse();
      expect(card.data === payload).assertTrue();
      expect(second.data === payload).assertTrue();
      expect(card.opt('item').title.name).assertEqual("0");
      expect(card.type).assertEqual("test.card-resolver.23");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name CardResolverTest_case_025
     * @tc.desc card-resolver: preserve payload semantics and stable identity; input vector 25.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CardResolverTest_case_025', 0, () => {
      const payload = makePayload("100%", "100%", 24);
      const model: DataModel = makeModel("test.card-resolver.24", payload);
      const resolver = new CardResolver();
      const card = resolver.createData(model);
      const second = resolver.createData(model);
      expect(card instanceof TextCardData).assertTrue();
      expect(second instanceof TextCardData).assertTrue();
      expect(card === second).assertFalse();
      expect(card.getObjectId() === second.getObjectId()).assertFalse();
      expect(card.data === payload).assertTrue();
      expect(second.data === payload).assertTrue();
      expect(card.opt('item').title.name).assertEqual("100%");
      expect(card.type).assertEqual("test.card-resolver.24");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name CardResolverTest_case_026
     * @tc.desc card-resolver: preserve payload semantics and stable identity; input vector 26.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CardResolverTest_case_026', 0, () => {
      const payload = makePayload("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA", "0%", 25);
      const model: DataModel = makeModel("test.card-resolver.25", payload);
      const resolver = new CardResolver();
      const card = resolver.createData(model);
      const second = resolver.createData(model);
      expect(card instanceof TextCardData).assertTrue();
      expect(second instanceof TextCardData).assertTrue();
      expect(card === second).assertFalse();
      expect(card.getObjectId() === second.getObjectId()).assertFalse();
      expect(card.data === payload).assertTrue();
      expect(second.data === payload).assertTrue();
      expect(card.opt('item').title.name).assertEqual("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA");
      expect(card.type).assertEqual("test.card-resolver.25");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name CardResolverTest_case_027
     * @tc.desc card-resolver: preserve payload semantics and stable identity; input vector 27.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CardResolverTest_case_027', 0, () => {
      const payload = makePayload("\u0000", "50%", 26);
      const model: DataModel = makeModel("test.card-resolver.26", payload);
      const resolver = new CardResolver();
      const card = resolver.createData(model);
      const second = resolver.createData(model);
      expect(card instanceof TextCardData).assertTrue();
      expect(second instanceof TextCardData).assertTrue();
      expect(card === second).assertFalse();
      expect(card.getObjectId() === second.getObjectId()).assertFalse();
      expect(card.data === payload).assertTrue();
      expect(second.data === payload).assertTrue();
      expect(card.opt('item').title.name).assertEqual("\u0000");
      expect(card.type).assertEqual("test.card-resolver.26");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name CardResolverTest_case_028
     * @tc.desc card-resolver: preserve payload semantics and stable identity; input vector 28.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CardResolverTest_case_028', 0, () => {
      const payload = makePayload("\u2028", "1%", 27);
      const model: DataModel = makeModel("test.card-resolver.27", payload);
      const resolver = new CardResolver();
      const card = resolver.createData(model);
      const second = resolver.createData(model);
      expect(card instanceof TextCardData).assertTrue();
      expect(second instanceof TextCardData).assertTrue();
      expect(card === second).assertFalse();
      expect(card.getObjectId() === second.getObjectId()).assertFalse();
      expect(card.data === payload).assertTrue();
      expect(second.data === payload).assertTrue();
      expect(card.opt('item').title.name).assertEqual("\u2028");
      expect(card.type).assertEqual("test.card-resolver.27");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name CardResolverTest_case_029
     * @tc.desc card-resolver: preserve payload semantics and stable identity; input vector 29.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CardResolverTest_case_029', 0, () => {
      const payload = makePayload("\u2029", "99%", 28);
      const model: DataModel = makeModel("test.card-resolver.28", payload);
      const resolver = new CardResolver();
      const card = resolver.createData(model);
      const second = resolver.createData(model);
      expect(card instanceof TextCardData).assertTrue();
      expect(second instanceof TextCardData).assertTrue();
      expect(card === second).assertFalse();
      expect(card.getObjectId() === second.getObjectId()).assertFalse();
      expect(card.data === payload).assertTrue();
      expect(second.data === payload).assertTrue();
      expect(card.opt('item').title.name).assertEqual("\u2029");
      expect(card.type).assertEqual("test.card-resolver.28");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name CardResolverTest_case_030
     * @tc.desc card-resolver: preserve payload semantics and stable identity; input vector 30.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CardResolverTest_case_030', 0, () => {
      const payload = makePayload("\r\n", "75%", 29);
      const model: DataModel = makeModel("test.card-resolver.29", payload);
      const resolver = new CardResolver();
      const card = resolver.createData(model);
      const second = resolver.createData(model);
      expect(card instanceof TextCardData).assertTrue();
      expect(second instanceof TextCardData).assertTrue();
      expect(card === second).assertFalse();
      expect(card.getObjectId() === second.getObjectId()).assertFalse();
      expect(card.data === payload).assertTrue();
      expect(second.data === payload).assertTrue();
      expect(card.opt('item').title.name).assertEqual("\r\n");
      expect(card.type).assertEqual("test.card-resolver.29");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name CardResolverTest_case_031
     * @tc.desc card-resolver: preserve payload semantics and stable identity; input vector 31.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CardResolverTest_case_031', 0, () => {
      const payload = makePayload("\ud83d\udc69\u200d\ud83d\udcbb", "", 30);
      const model: DataModel = makeModel("test.card-resolver.30", payload);
      const resolver = new CardResolver();
      const card = resolver.createData(model);
      const second = resolver.createData(model);
      expect(card instanceof TextCardData).assertTrue();
      expect(second instanceof TextCardData).assertTrue();
      expect(card === second).assertFalse();
      expect(card.getObjectId() === second.getObjectId()).assertFalse();
      expect(card.data === payload).assertTrue();
      expect(second.data === payload).assertTrue();
      expect(card.opt('item').title.name).assertEqual("\ud83d\udc69\u200d\ud83d\udcbb");
      expect(card.type).assertEqual("test.card-resolver.30");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name CardResolverTest_case_032
     * @tc.desc card-resolver: preserve payload semantics and stable identity; input vector 32.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CardResolverTest_case_032', 0, () => {
      const payload = makePayload("end.", ":{{env(screen-width}}", 31);
      const model: DataModel = makeModel("test.card-resolver.31", payload);
      const resolver = new CardResolver();
      const card = resolver.createData(model);
      const second = resolver.createData(model);
      expect(card instanceof TextCardData).assertTrue();
      expect(second instanceof TextCardData).assertTrue();
      expect(card === second).assertFalse();
      expect(card.getObjectId() === second.getObjectId()).assertFalse();
      expect(card.data === payload).assertTrue();
      expect(second.data === payload).assertTrue();
      expect(card.opt('item').title.name).assertEqual("end.");
      expect(card.type).assertEqual("test.card-resolver.31");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name CardResolverTest_case_033
     * @tc.desc card-resolver: preserve payload semantics and stable identity; input vector 33.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CardResolverTest_case_033', 0, () => {
      const payload = makePayload("", "100%", 32);
      const model: DataModel = makeModel("test.card-resolver.32", payload);
      const resolver = new CardResolver();
      const card = resolver.createData(model);
      const second = resolver.createData(model);
      expect(card instanceof TextCardData).assertTrue();
      expect(second instanceof TextCardData).assertTrue();
      expect(card === second).assertFalse();
      expect(card.getObjectId() === second.getObjectId()).assertFalse();
      expect(card.data === payload).assertTrue();
      expect(second.data === payload).assertTrue();
      expect(card.opt('item').title.name).assertEqual("");
      expect(card.type).assertEqual("test.card-resolver.32");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name CardResolverTest_case_034
     * @tc.desc card-resolver: preserve payload semantics and stable identity; input vector 34.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CardResolverTest_case_034', 0, () => {
      const payload = makePayload("Card", "0%", 33);
      const model: DataModel = makeModel("test.card-resolver.33", payload);
      const resolver = new CardResolver();
      const card = resolver.createData(model);
      const second = resolver.createData(model);
      expect(card instanceof TextCardData).assertTrue();
      expect(second instanceof TextCardData).assertTrue();
      expect(card === second).assertFalse();
      expect(card.getObjectId() === second.getObjectId()).assertFalse();
      expect(card.data === payload).assertTrue();
      expect(second.data === payload).assertTrue();
      expect(card.opt('item').title.name).assertEqual("Card");
      expect(card.type).assertEqual("test.card-resolver.33");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name CardResolverTest_case_035
     * @tc.desc card-resolver: preserve payload semantics and stable identity; input vector 35.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CardResolverTest_case_035', 0, () => {
      const payload = makePayload(" ", "50%", 34);
      const model: DataModel = makeModel("test.card-resolver.34", payload);
      const resolver = new CardResolver();
      const card = resolver.createData(model);
      const second = resolver.createData(model);
      expect(card instanceof TextCardData).assertTrue();
      expect(second instanceof TextCardData).assertTrue();
      expect(card === second).assertFalse();
      expect(card.getObjectId() === second.getObjectId()).assertFalse();
      expect(card.data === payload).assertTrue();
      expect(second.data === payload).assertTrue();
      expect(card.opt('item').title.name).assertEqual(" ");
      expect(card.type).assertEqual("test.card-resolver.34");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name CardResolverTest_case_036
     * @tc.desc card-resolver: preserve payload semantics and stable identity; input vector 36.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CardResolverTest_case_036', 0, () => {
      const payload = makePayload("  padded  ", "1%", 35);
      const model: DataModel = makeModel("test.card-resolver.35", payload);
      const resolver = new CardResolver();
      const card = resolver.createData(model);
      const second = resolver.createData(model);
      expect(card instanceof TextCardData).assertTrue();
      expect(second instanceof TextCardData).assertTrue();
      expect(card === second).assertFalse();
      expect(card.getObjectId() === second.getObjectId()).assertFalse();
      expect(card.data === payload).assertTrue();
      expect(second.data === payload).assertTrue();
      expect(card.opt('item').title.name).assertEqual("  padded  ");
      expect(card.type).assertEqual("test.card-resolver.35");
      expect(card.getObjectId().length > 0).assertTrue();
    });
  });
}
