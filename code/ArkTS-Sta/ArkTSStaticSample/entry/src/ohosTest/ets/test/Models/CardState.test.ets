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

// Reference: ets/test/PowerDialog/PowerDialogStateManagement.test.ets
// Original line floor: 521; scenario family: card-state.
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

export default function CardStateTest(): void {
  describe('CardStateTest', () => {
    beforeAll(() => {
      logSuite('CardStateTest', 'begin');
    });
    beforeEach(async () => {
      // Yield between cases so device watchdog and UI events can be processed.
      await new Promise<void>((resolve) => { setTimeout(resolve, 1); });
    });
    afterAll(() => {
      logSuite('CardStateTest', 'end');
    });

    /**
     * @tc.name CardStateTest_case_001
     * @tc.desc card-state: preserve payload semantics and stable identity; input vector 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CardStateTest_case_001', 0, () => {
      const payload = makePayload("", "100%", 0);
      const model: DataModel = makeModel("test.card-state.0", payload);
      const card = new TextCardData(model);
      const originalId = card.getObjectId();
      const originalType = card.type;
      expect(card.data === payload).assertTrue();
      payload.item.title.name = "updated:0";
      payload.enabled = !payload.enabled;
      expect(card.opt('item').title.name).assertEqual("updated:0");
      expect(card.opt('enabled')).assertEqual(false);
      const replacement = makePayload("", "100%", 1);
      card.data = replacement;
      expect(card.opt('sequence')).assertEqual(1);
      expect(card.opt('item').title.name).assertEqual("");
      expect(card.data === payload).assertFalse();
      expect(card.getObjectId()).assertEqual(originalId);
      expect(card.type).assertEqual(originalType);
      expect(card.type).assertEqual("test.card-state.0");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name CardStateTest_case_002
     * @tc.desc card-state: preserve payload semantics and stable identity; input vector 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CardStateTest_case_002', 0, () => {
      const payload = makePayload("Card", "0%", 1);
      const model: DataModel = makeModel("test.card-state.1", payload);
      const card = new TextCardData(model);
      const originalId = card.getObjectId();
      const originalType = card.type;
      expect(card.data === payload).assertTrue();
      payload.item.title.name = "updated:1";
      payload.enabled = !payload.enabled;
      expect(card.opt('item').title.name).assertEqual("updated:1");
      expect(card.opt('enabled')).assertEqual(true);
      const replacement = makePayload("Card", "0%", 2);
      card.data = replacement;
      expect(card.opt('sequence')).assertEqual(2);
      expect(card.opt('item').title.name).assertEqual("Card");
      expect(card.data === payload).assertFalse();
      expect(card.getObjectId()).assertEqual(originalId);
      expect(card.type).assertEqual(originalType);
      expect(card.type).assertEqual("test.card-state.1");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name CardStateTest_case_003
     * @tc.desc card-state: preserve payload semantics and stable identity; input vector 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CardStateTest_case_003', 0, () => {
      const payload = makePayload(" ", "50%", 2);
      const model: DataModel = makeModel("test.card-state.2", payload);
      const card = new TextCardData(model);
      const originalId = card.getObjectId();
      const originalType = card.type;
      expect(card.data === payload).assertTrue();
      payload.item.title.name = "updated:2";
      payload.enabled = !payload.enabled;
      expect(card.opt('item').title.name).assertEqual("updated:2");
      expect(card.opt('enabled')).assertEqual(false);
      const replacement = makePayload(" ", "50%", 3);
      card.data = replacement;
      expect(card.opt('sequence')).assertEqual(3);
      expect(card.opt('item').title.name).assertEqual(" ");
      expect(card.data === payload).assertFalse();
      expect(card.getObjectId()).assertEqual(originalId);
      expect(card.type).assertEqual(originalType);
      expect(card.type).assertEqual("test.card-state.2");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name CardStateTest_case_004
     * @tc.desc card-state: preserve payload semantics and stable identity; input vector 4.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CardStateTest_case_004', 0, () => {
      const payload = makePayload("  padded  ", "1%", 3);
      const model: DataModel = makeModel("test.card-state.3", payload);
      const card = new TextCardData(model);
      const originalId = card.getObjectId();
      const originalType = card.type;
      expect(card.data === payload).assertTrue();
      payload.item.title.name = "updated:3";
      payload.enabled = !payload.enabled;
      expect(card.opt('item').title.name).assertEqual("updated:3");
      expect(card.opt('enabled')).assertEqual(true);
      const replacement = makePayload("  padded  ", "1%", 4);
      card.data = replacement;
      expect(card.opt('sequence')).assertEqual(4);
      expect(card.opt('item').title.name).assertEqual("  padded  ");
      expect(card.data === payload).assertFalse();
      expect(card.getObjectId()).assertEqual(originalId);
      expect(card.type).assertEqual(originalType);
      expect(card.type).assertEqual("test.card-state.3");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name CardStateTest_case_005
     * @tc.desc card-state: preserve payload semantics and stable identity; input vector 5.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CardStateTest_case_005', 0, () => {
      const payload = makePayload("multi word title", "99%", 4);
      const model: DataModel = makeModel("test.card-state.4", payload);
      const card = new TextCardData(model);
      const originalId = card.getObjectId();
      const originalType = card.type;
      expect(card.data === payload).assertTrue();
      payload.item.title.name = "updated:4";
      payload.enabled = !payload.enabled;
      expect(card.opt('item').title.name).assertEqual("updated:4");
      expect(card.opt('enabled')).assertEqual(false);
      const replacement = makePayload("multi word title", "99%", 5);
      card.data = replacement;
      expect(card.opt('sequence')).assertEqual(5);
      expect(card.opt('item').title.name).assertEqual("multi word title");
      expect(card.data === payload).assertFalse();
      expect(card.getObjectId()).assertEqual(originalId);
      expect(card.type).assertEqual(originalType);
      expect(card.type).assertEqual("test.card-state.4");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name CardStateTest_case_006
     * @tc.desc card-state: preserve payload semantics and stable identity; input vector 6.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CardStateTest_case_006', 0, () => {
      const payload = makePayload("line\nbreak", "75%", 5);
      const model: DataModel = makeModel("test.card-state.5", payload);
      const card = new TextCardData(model);
      const originalId = card.getObjectId();
      const originalType = card.type;
      expect(card.data === payload).assertTrue();
      payload.item.title.name = "updated:5";
      payload.enabled = !payload.enabled;
      expect(card.opt('item').title.name).assertEqual("updated:5");
      expect(card.opt('enabled')).assertEqual(true);
      const replacement = makePayload("line\nbreak", "75%", 6);
      card.data = replacement;
      expect(card.opt('sequence')).assertEqual(6);
      expect(card.opt('item').title.name).assertEqual("line\nbreak");
      expect(card.data === payload).assertFalse();
      expect(card.getObjectId()).assertEqual(originalId);
      expect(card.type).assertEqual(originalType);
      expect(card.type).assertEqual("test.card-state.5");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name CardStateTest_case_007
     * @tc.desc card-state: preserve payload semantics and stable identity; input vector 7.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CardStateTest_case_007', 0, () => {
      const payload = makePayload("tab\tvalue", "", 6);
      const model: DataModel = makeModel("test.card-state.6", payload);
      const card = new TextCardData(model);
      const originalId = card.getObjectId();
      const originalType = card.type;
      expect(card.data === payload).assertTrue();
      payload.item.title.name = "updated:6";
      payload.enabled = !payload.enabled;
      expect(card.opt('item').title.name).assertEqual("updated:6");
      expect(card.opt('enabled')).assertEqual(false);
      const replacement = makePayload("tab\tvalue", "", 7);
      card.data = replacement;
      expect(card.opt('sequence')).assertEqual(7);
      expect(card.opt('item').title.name).assertEqual("tab\tvalue");
      expect(card.data === payload).assertFalse();
      expect(card.getObjectId()).assertEqual(originalId);
      expect(card.type).assertEqual(originalType);
      expect(card.type).assertEqual("test.card-state.6");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name CardStateTest_case_008
     * @tc.desc card-state: preserve payload semantics and stable identity; input vector 8.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CardStateTest_case_008', 0, () => {
      const payload = makePayload("\u5361\u7247 1", ":{{env(screen-width}}", 7);
      const model: DataModel = makeModel("test.card-state.7", payload);
      const card = new TextCardData(model);
      const originalId = card.getObjectId();
      const originalType = card.type;
      expect(card.data === payload).assertTrue();
      payload.item.title.name = "updated:7";
      payload.enabled = !payload.enabled;
      expect(card.opt('item').title.name).assertEqual("updated:7");
      expect(card.opt('enabled')).assertEqual(true);
      const replacement = makePayload("\u5361\u7247 1", ":{{env(screen-width}}", 8);
      card.data = replacement;
      expect(card.opt('sequence')).assertEqual(8);
      expect(card.opt('item').title.name).assertEqual("\u5361\u7247 1");
      expect(card.data === payload).assertFalse();
      expect(card.getObjectId()).assertEqual(originalId);
      expect(card.type).assertEqual(originalType);
      expect(card.type).assertEqual("test.card-state.7");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name CardStateTest_case_009
     * @tc.desc card-state: preserve payload semantics and stable identity; input vector 9.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CardStateTest_case_009', 0, () => {
      const payload = makePayload("\u5361\u7247 2", "100%", 8);
      const model: DataModel = makeModel("test.card-state.8", payload);
      const card = new TextCardData(model);
      const originalId = card.getObjectId();
      const originalType = card.type;
      expect(card.data === payload).assertTrue();
      payload.item.title.name = "updated:8";
      payload.enabled = !payload.enabled;
      expect(card.opt('item').title.name).assertEqual("updated:8");
      expect(card.opt('enabled')).assertEqual(false);
      const replacement = makePayload("\u5361\u7247 2", "100%", 9);
      card.data = replacement;
      expect(card.opt('sequence')).assertEqual(9);
      expect(card.opt('item').title.name).assertEqual("\u5361\u7247 2");
      expect(card.data === payload).assertFalse();
      expect(card.getObjectId()).assertEqual(originalId);
      expect(card.type).assertEqual(originalType);
      expect(card.type).assertEqual("test.card-state.8");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name CardStateTest_case_010
     * @tc.desc card-state: preserve payload semantics and stable identity; input vector 10.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CardStateTest_case_010', 0, () => {
      const payload = makePayload("\u5361\u7247 3", "0%", 9);
      const model: DataModel = makeModel("test.card-state.9", payload);
      const card = new TextCardData(model);
      const originalId = card.getObjectId();
      const originalType = card.type;
      expect(card.data === payload).assertTrue();
      payload.item.title.name = "updated:9";
      payload.enabled = !payload.enabled;
      expect(card.opt('item').title.name).assertEqual("updated:9");
      expect(card.opt('enabled')).assertEqual(true);
      const replacement = makePayload("\u5361\u7247 3", "0%", 10);
      card.data = replacement;
      expect(card.opt('sequence')).assertEqual(10);
      expect(card.opt('item').title.name).assertEqual("\u5361\u7247 3");
      expect(card.data === payload).assertFalse();
      expect(card.getObjectId()).assertEqual(originalId);
      expect(card.type).assertEqual(originalType);
      expect(card.type).assertEqual("test.card-state.9");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name CardStateTest_case_011
     * @tc.desc card-state: preserve payload semantics and stable identity; input vector 11.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CardStateTest_case_011', 0, () => {
      const payload = makePayload("\u65e5\u672c\u8a9e", "50%", 10);
      const model: DataModel = makeModel("test.card-state.10", payload);
      const card = new TextCardData(model);
      const originalId = card.getObjectId();
      const originalType = card.type;
      expect(card.data === payload).assertTrue();
      payload.item.title.name = "updated:10";
      payload.enabled = !payload.enabled;
      expect(card.opt('item').title.name).assertEqual("updated:10");
      expect(card.opt('enabled')).assertEqual(false);
      const replacement = makePayload("\u65e5\u672c\u8a9e", "50%", 11);
      card.data = replacement;
      expect(card.opt('sequence')).assertEqual(11);
      expect(card.opt('item').title.name).assertEqual("\u65e5\u672c\u8a9e");
      expect(card.data === payload).assertFalse();
      expect(card.getObjectId()).assertEqual(originalId);
      expect(card.type).assertEqual(originalType);
      expect(card.type).assertEqual("test.card-state.10");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name CardStateTest_case_012
     * @tc.desc card-state: preserve payload semantics and stable identity; input vector 12.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CardStateTest_case_012', 0, () => {
      const payload = makePayload("\u0645\u0631\u062d\u0628\u0627", "1%", 11);
      const model: DataModel = makeModel("test.card-state.11", payload);
      const card = new TextCardData(model);
      const originalId = card.getObjectId();
      const originalType = card.type;
      expect(card.data === payload).assertTrue();
      payload.item.title.name = "updated:11";
      payload.enabled = !payload.enabled;
      expect(card.opt('item').title.name).assertEqual("updated:11");
      expect(card.opt('enabled')).assertEqual(true);
      const replacement = makePayload("\u0645\u0631\u062d\u0628\u0627", "1%", 12);
      card.data = replacement;
      expect(card.opt('sequence')).assertEqual(12);
      expect(card.opt('item').title.name).assertEqual("\u0645\u0631\u062d\u0628\u0627");
      expect(card.data === payload).assertFalse();
      expect(card.getObjectId()).assertEqual(originalId);
      expect(card.type).assertEqual(originalType);
      expect(card.type).assertEqual("test.card-state.11");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name CardStateTest_case_013
     * @tc.desc card-state: preserve payload semantics and stable identity; input vector 13.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CardStateTest_case_013', 0, () => {
      const payload = makePayload("\u05e9\u05dc\u05d5\u05dd", "99%", 12);
      const model: DataModel = makeModel("test.card-state.12", payload);
      const card = new TextCardData(model);
      const originalId = card.getObjectId();
      const originalType = card.type;
      expect(card.data === payload).assertTrue();
      payload.item.title.name = "updated:12";
      payload.enabled = !payload.enabled;
      expect(card.opt('item').title.name).assertEqual("updated:12");
      expect(card.opt('enabled')).assertEqual(false);
      const replacement = makePayload("\u05e9\u05dc\u05d5\u05dd", "99%", 13);
      card.data = replacement;
      expect(card.opt('sequence')).assertEqual(13);
      expect(card.opt('item').title.name).assertEqual("\u05e9\u05dc\u05d5\u05dd");
      expect(card.data === payload).assertFalse();
      expect(card.getObjectId()).assertEqual(originalId);
      expect(card.type).assertEqual(originalType);
      expect(card.type).assertEqual("test.card-state.12");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name CardStateTest_case_014
     * @tc.desc card-state: preserve payload semantics and stable identity; input vector 14.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CardStateTest_case_014', 0, () => {
      const payload = makePayload("e\u0301", "75%", 13);
      const model: DataModel = makeModel("test.card-state.13", payload);
      const card = new TextCardData(model);
      const originalId = card.getObjectId();
      const originalType = card.type;
      expect(card.data === payload).assertTrue();
      payload.item.title.name = "updated:13";
      payload.enabled = !payload.enabled;
      expect(card.opt('item').title.name).assertEqual("updated:13");
      expect(card.opt('enabled')).assertEqual(true);
      const replacement = makePayload("e\u0301", "75%", 14);
      card.data = replacement;
      expect(card.opt('sequence')).assertEqual(14);
      expect(card.opt('item').title.name).assertEqual("e\u0301");
      expect(card.data === payload).assertFalse();
      expect(card.getObjectId()).assertEqual(originalId);
      expect(card.type).assertEqual(originalType);
      expect(card.type).assertEqual("test.card-state.13");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name CardStateTest_case_015
     * @tc.desc card-state: preserve payload semantics and stable identity; input vector 15.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CardStateTest_case_015', 0, () => {
      const payload = makePayload("\u00e9", "", 14);
      const model: DataModel = makeModel("test.card-state.14", payload);
      const card = new TextCardData(model);
      const originalId = card.getObjectId();
      const originalType = card.type;
      expect(card.data === payload).assertTrue();
      payload.item.title.name = "updated:14";
      payload.enabled = !payload.enabled;
      expect(card.opt('item').title.name).assertEqual("updated:14");
      expect(card.opt('enabled')).assertEqual(false);
      const replacement = makePayload("\u00e9", "", 15);
      card.data = replacement;
      expect(card.opt('sequence')).assertEqual(15);
      expect(card.opt('item').title.name).assertEqual("\u00e9");
      expect(card.data === payload).assertFalse();
      expect(card.getObjectId()).assertEqual(originalId);
      expect(card.type).assertEqual(originalType);
      expect(card.type).assertEqual("test.card-state.14");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name CardStateTest_case_016
     * @tc.desc card-state: preserve payload semantics and stable identity; input vector 16.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CardStateTest_case_016', 0, () => {
      const payload = makePayload("\ud83d\ude80", ":{{env(screen-width}}", 15);
      const model: DataModel = makeModel("test.card-state.15", payload);
      const card = new TextCardData(model);
      const originalId = card.getObjectId();
      const originalType = card.type;
      expect(card.data === payload).assertTrue();
      payload.item.title.name = "updated:15";
      payload.enabled = !payload.enabled;
      expect(card.opt('item').title.name).assertEqual("updated:15");
      expect(card.opt('enabled')).assertEqual(true);
      const replacement = makePayload("\ud83d\ude80", ":{{env(screen-width}}", 16);
      card.data = replacement;
      expect(card.opt('sequence')).assertEqual(16);
      expect(card.opt('item').title.name).assertEqual("\ud83d\ude80");
      expect(card.data === payload).assertFalse();
      expect(card.getObjectId()).assertEqual(originalId);
      expect(card.type).assertEqual(originalType);
      expect(card.type).assertEqual("test.card-state.15");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name CardStateTest_case_017
     * @tc.desc card-state: preserve payload semantics and stable identity; input vector 17.
     * @tc.type Function
     * @tc.level Level1
     */
    it('CardStateTest_case_017', 0, () => {
      const payload = makePayload("quote\"slash\\", "100%", 16);
      const model: DataModel = makeModel("test.card-state.16", payload);
      const card = new TextCardData(model);
      const originalId = card.getObjectId();
      const originalType = card.type;
      expect(card.data === payload).assertTrue();
      payload.item.title.name = "updated:16";
      payload.enabled = !payload.enabled;
      expect(card.opt('item').title.name).assertEqual("updated:16");
      expect(card.opt('enabled')).assertEqual(false);
      const replacement = makePayload("quote\"slash\\", "100%", 17);
      card.data = replacement;
      expect(card.opt('sequence')).assertEqual(17);
      expect(card.opt('item').title.name).assertEqual("quote\"slash\\");
      expect(card.data === payload).assertFalse();
      expect(card.getObjectId()).assertEqual(originalId);
      expect(card.type).assertEqual(originalType);
      expect(card.type).assertEqual("test.card-state.16");
      expect(card.getObjectId().length > 0).assertTrue();
    });
  });
}
