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

// Reference: ets/test/Security/SecurityAccessibility.test.ets
// Original line floor: 366; scenario family: card-literal.
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

export default function LiteralTitlesTest(): void {
  describe('LiteralTitlesTest', () => {
    beforeAll(() => {
      logSuite('LiteralTitlesTest', 'begin');
    });
    beforeEach(async () => {
      // Yield between cases so device watchdog and UI events can be processed.
      await new Promise<void>((resolve) => { setTimeout(resolve, 1); });
    });
    afterAll(() => {
      logSuite('LiteralTitlesTest', 'end');
    });

    /**
     * @tc.name LiteralTitlesTest_case_001
     * @tc.desc card-literal: preserve payload semantics and stable identity; input vector 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('LiteralTitlesTest_case_001', 0, () => {
      const payload = makePayload("<script>alert(1)</script>", "100%", 0);
      const model: DataModel = makeModel("test.card-literal.0", payload);
      const card = new CardData(model);
      const originalId = card.getObjectId();
      expect(card.data === payload).assertTrue();
      expect(card.opt('item') === payload.item).assertTrue();
      expect(card.opt('style') === payload.style).assertTrue();
      expect(card.opt('item').title.name).assertEqual("<script>alert(1)</script>");
      expect(card.opt('style').width).assertEqual("100%");
      expect(card.opt('sequence')).assertEqual(0);
      expect(card.opt('enabled')).assertEqual(true);
      expect(card.opt('amount')).assertEqual(0);
      expect(card.opt('tags')[0]).assertEqual("<script>alert(1)</script>");
      expect(card.opt('tags')[1]).assertEqual("0");
      expect(card.opt('unknown-property')).assertUndefined();
      expect(card.getObjectId()).assertEqual(originalId);
      expect(card.type).assertEqual("test.card-literal.0");
      expect(card.getObjectId().length > 0).assertTrue();
      const encoded = JSON.stringify(card.opt('item').title.name);
      expect(encoded).assertEqual(JSON.stringify("<script>alert(1)</script>"));
      expect(card.opt('item').title.name.length).assertEqual(25);
    });

    /**
     * @tc.name LiteralTitlesTest_case_002
     * @tc.desc card-literal: preserve payload semantics and stable identity; input vector 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('LiteralTitlesTest_case_002', 0, () => {
      const payload = makePayload("${notExecuted}", "0%", 1);
      const model: DataModel = makeModel("test.card-literal.1", payload);
      const card = new TextCardData(model);
      const originalId = card.getObjectId();
      expect(card.data === payload).assertTrue();
      expect(card.opt('item') === payload.item).assertTrue();
      expect(card.opt('style') === payload.style).assertTrue();
      expect(card.opt('item').title.name).assertEqual("${notExecuted}");
      expect(card.opt('style').width).assertEqual("0%");
      expect(card.opt('sequence')).assertEqual(1);
      expect(card.opt('enabled')).assertEqual(false);
      expect(card.opt('amount')).assertEqual(0.5);
      expect(card.opt('tags')[0]).assertEqual("${notExecuted}");
      expect(card.opt('tags')[1]).assertEqual("1");
      expect(card.opt('unknown-property')).assertUndefined();
      expect(card.getObjectId()).assertEqual(originalId);
      expect(card.type).assertEqual("test.card-literal.1");
      expect(card.getObjectId().length > 0).assertTrue();
      const encoded = JSON.stringify(card.opt('item').title.name);
      expect(encoded).assertEqual(JSON.stringify("${notExecuted}"));
      expect(card.opt('item').title.name.length).assertEqual(14);
    });

    /**
     * @tc.name LiteralTitlesTest_case_003
     * @tc.desc card-literal: preserve payload semantics and stable identity; input vector 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('LiteralTitlesTest_case_003', 0, () => {
      const payload = makePayload("__proto__", "50%", 2);
      const model: DataModel = makeModel("test.card-literal.2", payload);
      const card = new CardData(model);
      const originalId = card.getObjectId();
      expect(card.data === payload).assertTrue();
      expect(card.opt('item') === payload.item).assertTrue();
      expect(card.opt('style') === payload.style).assertTrue();
      expect(card.opt('item').title.name).assertEqual("__proto__");
      expect(card.opt('style').width).assertEqual("50%");
      expect(card.opt('sequence')).assertEqual(2);
      expect(card.opt('enabled')).assertEqual(true);
      expect(card.opt('amount')).assertEqual(1);
      expect(card.opt('tags')[0]).assertEqual("__proto__");
      expect(card.opt('tags')[1]).assertEqual("2");
      expect(card.opt('unknown-property')).assertUndefined();
      expect(card.getObjectId()).assertEqual(originalId);
      expect(card.type).assertEqual("test.card-literal.2");
      expect(card.getObjectId().length > 0).assertTrue();
      const encoded = JSON.stringify(card.opt('item').title.name);
      expect(encoded).assertEqual(JSON.stringify("__proto__"));
      expect(card.opt('item').title.name.length).assertEqual(9);
    });

    /**
     * @tc.name LiteralTitlesTest_case_004
     * @tc.desc card-literal: preserve payload semantics and stable identity; input vector 4.
     * @tc.type Function
     * @tc.level Level1
     */
    it('LiteralTitlesTest_case_004', 0, () => {
      const payload = makePayload("constructor", "1%", 3);
      const model: DataModel = makeModel("test.card-literal.3", payload);
      const card = new TextCardData(model);
      const originalId = card.getObjectId();
      expect(card.data === payload).assertTrue();
      expect(card.opt('item') === payload.item).assertTrue();
      expect(card.opt('style') === payload.style).assertTrue();
      expect(card.opt('item').title.name).assertEqual("constructor");
      expect(card.opt('style').width).assertEqual("1%");
      expect(card.opt('sequence')).assertEqual(3);
      expect(card.opt('enabled')).assertEqual(false);
      expect(card.opt('amount')).assertEqual(1.5);
      expect(card.opt('tags')[0]).assertEqual("constructor");
      expect(card.opt('tags')[1]).assertEqual("3");
      expect(card.opt('unknown-property')).assertUndefined();
      expect(card.getObjectId()).assertEqual(originalId);
      expect(card.type).assertEqual("test.card-literal.3");
      expect(card.getObjectId().length > 0).assertTrue();
      const encoded = JSON.stringify(card.opt('item').title.name);
      expect(encoded).assertEqual(JSON.stringify("constructor"));
      expect(card.opt('item').title.name.length).assertEqual(11);
    });

    /**
     * @tc.name LiteralTitlesTest_case_005
     * @tc.desc card-literal: preserve payload semantics and stable identity; input vector 5.
     * @tc.type Function
     * @tc.level Level1
     */
    it('LiteralTitlesTest_case_005', 0, () => {
      const payload = makePayload("quote\"slash\\", "99%", 4);
      const model: DataModel = makeModel("test.card-literal.4", payload);
      const card = new CardData(model);
      const originalId = card.getObjectId();
      expect(card.data === payload).assertTrue();
      expect(card.opt('item') === payload.item).assertTrue();
      expect(card.opt('style') === payload.style).assertTrue();
      expect(card.opt('item').title.name).assertEqual("quote\"slash\\");
      expect(card.opt('style').width).assertEqual("99%");
      expect(card.opt('sequence')).assertEqual(4);
      expect(card.opt('enabled')).assertEqual(true);
      expect(card.opt('amount')).assertEqual(2);
      expect(card.opt('tags')[0]).assertEqual("quote\"slash\\");
      expect(card.opt('tags')[1]).assertEqual("4");
      expect(card.opt('unknown-property')).assertUndefined();
      expect(card.getObjectId()).assertEqual(originalId);
      expect(card.type).assertEqual("test.card-literal.4");
      expect(card.getObjectId().length > 0).assertTrue();
      const encoded = JSON.stringify(card.opt('item').title.name);
      expect(encoded).assertEqual(JSON.stringify("quote\"slash\\"));
      expect(card.opt('item').title.name.length).assertEqual(12);
    });

    /**
     * @tc.name LiteralTitlesTest_case_006
     * @tc.desc card-literal: preserve payload semantics and stable identity; input vector 6.
     * @tc.type Function
     * @tc.level Level1
     */
    it('LiteralTitlesTest_case_006', 0, () => {
      const payload = makePayload("\u0000", "75%", 5);
      const model: DataModel = makeModel("test.card-literal.5", payload);
      const card = new TextCardData(model);
      const originalId = card.getObjectId();
      expect(card.data === payload).assertTrue();
      expect(card.opt('item') === payload.item).assertTrue();
      expect(card.opt('style') === payload.style).assertTrue();
      expect(card.opt('item').title.name).assertEqual("\u0000");
      expect(card.opt('style').width).assertEqual("75%");
      expect(card.opt('sequence')).assertEqual(5);
      expect(card.opt('enabled')).assertEqual(false);
      expect(card.opt('amount')).assertEqual(2.5);
      expect(card.opt('tags')[0]).assertEqual("\u0000");
      expect(card.opt('tags')[1]).assertEqual("5");
      expect(card.opt('unknown-property')).assertUndefined();
      expect(card.getObjectId()).assertEqual(originalId);
      expect(card.type).assertEqual("test.card-literal.5");
      expect(card.getObjectId().length > 0).assertTrue();
      const encoded = JSON.stringify(card.opt('item').title.name);
      expect(encoded).assertEqual(JSON.stringify("\u0000"));
      expect(card.opt('item').title.name.length).assertEqual(1);
    });

    /**
     * @tc.name LiteralTitlesTest_case_007
     * @tc.desc card-literal: preserve payload semantics and stable identity; input vector 7.
     * @tc.type Function
     * @tc.level Level1
     */
    it('LiteralTitlesTest_case_007', 0, () => {
      const payload = makePayload("", "", 6);
      const model: DataModel = makeModel("test.card-literal.6", payload);
      const card = new CardData(model);
      const originalId = card.getObjectId();
      expect(card.data === payload).assertTrue();
      expect(card.opt('item') === payload.item).assertTrue();
      expect(card.opt('style') === payload.style).assertTrue();
      expect(card.opt('item').title.name).assertEqual("");
      expect(card.opt('style').width).assertEqual("");
      expect(card.opt('sequence')).assertEqual(6);
      expect(card.opt('enabled')).assertEqual(true);
      expect(card.opt('amount')).assertEqual(3);
      expect(card.opt('tags')[0]).assertEqual("");
      expect(card.opt('tags')[1]).assertEqual("6");
      expect(card.opt('unknown-property')).assertUndefined();
      expect(card.getObjectId()).assertEqual(originalId);
      expect(card.type).assertEqual("test.card-literal.6");
      expect(card.getObjectId().length > 0).assertTrue();
      const encoded = JSON.stringify(card.opt('item').title.name);
      expect(encoded).assertEqual(JSON.stringify(""));
      expect(card.opt('item').title.name.length).assertEqual(0);
    });

    /**
     * @tc.name LiteralTitlesTest_case_008
     * @tc.desc card-literal: preserve payload semantics and stable identity; input vector 8.
     * @tc.type Function
     * @tc.level Level1
     */
    it('LiteralTitlesTest_case_008', 0, () => {
      const payload = makePayload(" ", ":{{env(screen-width}}", 7);
      const model: DataModel = makeModel("test.card-literal.7", payload);
      const card = new TextCardData(model);
      const originalId = card.getObjectId();
      expect(card.data === payload).assertTrue();
      expect(card.opt('item') === payload.item).assertTrue();
      expect(card.opt('style') === payload.style).assertTrue();
      expect(card.opt('item').title.name).assertEqual(" ");
      expect(card.opt('style').width).assertEqual(":{{env(screen-width}}");
      expect(card.opt('sequence')).assertEqual(7);
      expect(card.opt('enabled')).assertEqual(false);
      expect(card.opt('amount')).assertEqual(3.5);
      expect(card.opt('tags')[0]).assertEqual(" ");
      expect(card.opt('tags')[1]).assertEqual("7");
      expect(card.opt('unknown-property')).assertUndefined();
      expect(card.getObjectId()).assertEqual(originalId);
      expect(card.type).assertEqual("test.card-literal.7");
      expect(card.getObjectId().length > 0).assertTrue();
      const encoded = JSON.stringify(card.opt('item').title.name);
      expect(encoded).assertEqual(JSON.stringify(" "));
      expect(card.opt('item').title.name.length).assertEqual(1);
    });

    /**
     * @tc.name LiteralTitlesTest_case_009
     * @tc.desc card-literal: preserve payload semantics and stable identity; input vector 9.
     * @tc.type Function
     * @tc.level Level1
     */
    it('LiteralTitlesTest_case_009', 0, () => {
      const payload = makePayload("line\nbreak", "100%", 8);
      const model: DataModel = makeModel("test.card-literal.8", payload);
      const card = new CardData(model);
      const originalId = card.getObjectId();
      expect(card.data === payload).assertTrue();
      expect(card.opt('item') === payload.item).assertTrue();
      expect(card.opt('style') === payload.style).assertTrue();
      expect(card.opt('item').title.name).assertEqual("line\nbreak");
      expect(card.opt('style').width).assertEqual("100%");
      expect(card.opt('sequence')).assertEqual(8);
      expect(card.opt('enabled')).assertEqual(true);
      expect(card.opt('amount')).assertEqual(4);
      expect(card.opt('tags')[0]).assertEqual("line\nbreak");
      expect(card.opt('tags')[1]).assertEqual("8");
      expect(card.opt('unknown-property')).assertUndefined();
      expect(card.getObjectId()).assertEqual(originalId);
      expect(card.type).assertEqual("test.card-literal.8");
      expect(card.getObjectId().length > 0).assertTrue();
      const encoded = JSON.stringify(card.opt('item').title.name);
      expect(encoded).assertEqual(JSON.stringify("line\nbreak"));
      expect(card.opt('item').title.name.length).assertEqual(10);
    });

    /**
     * @tc.name LiteralTitlesTest_case_010
     * @tc.desc card-literal: preserve payload semantics and stable identity; input vector 10.
     * @tc.type Function
     * @tc.level Level1
     */
    it('LiteralTitlesTest_case_010', 0, () => {
      const payload = makePayload("\u5361\u7247", "0%", 9);
      const model: DataModel = makeModel("test.card-literal.9", payload);
      const card = new TextCardData(model);
      const originalId = card.getObjectId();
      expect(card.data === payload).assertTrue();
      expect(card.opt('item') === payload.item).assertTrue();
      expect(card.opt('style') === payload.style).assertTrue();
      expect(card.opt('item').title.name).assertEqual("\u5361\u7247");
      expect(card.opt('style').width).assertEqual("0%");
      expect(card.opt('sequence')).assertEqual(9);
      expect(card.opt('enabled')).assertEqual(false);
      expect(card.opt('amount')).assertEqual(4.5);
      expect(card.opt('tags')[0]).assertEqual("\u5361\u7247");
      expect(card.opt('tags')[1]).assertEqual("9");
      expect(card.opt('unknown-property')).assertUndefined();
      expect(card.getObjectId()).assertEqual(originalId);
      expect(card.type).assertEqual("test.card-literal.9");
      expect(card.getObjectId().length > 0).assertTrue();
      const encoded = JSON.stringify(card.opt('item').title.name);
      expect(encoded).assertEqual(JSON.stringify("\u5361\u7247"));
      expect(card.opt('item').title.name.length).assertEqual(2);
    });

    /**
     * @tc.name LiteralTitlesTest_case_011
     * @tc.desc card-literal: preserve payload semantics and stable identity; input vector 11.
     * @tc.type Function
     * @tc.level Level1
     */
    it('LiteralTitlesTest_case_011', 0, () => {
      const payload = makePayload("0", "50%", 10);
      const model: DataModel = makeModel("test.card-literal.10", payload);
      const card = new CardData(model);
      const originalId = card.getObjectId();
      expect(card.data === payload).assertTrue();
      expect(card.opt('item') === payload.item).assertTrue();
      expect(card.opt('style') === payload.style).assertTrue();
      expect(card.opt('item').title.name).assertEqual("0");
      expect(card.opt('style').width).assertEqual("50%");
      expect(card.opt('sequence')).assertEqual(10);
      expect(card.opt('enabled')).assertEqual(true);
      expect(card.opt('amount')).assertEqual(5);
      expect(card.opt('tags')[0]).assertEqual("0");
      expect(card.opt('tags')[1]).assertEqual("10");
      expect(card.opt('unknown-property')).assertUndefined();
      expect(card.getObjectId()).assertEqual(originalId);
      expect(card.type).assertEqual("test.card-literal.10");
      expect(card.getObjectId().length > 0).assertTrue();
      const encoded = JSON.stringify(card.opt('item').title.name);
      expect(encoded).assertEqual(JSON.stringify("0"));
      expect(card.opt('item').title.name.length).assertEqual(1);
    });
  });
}
