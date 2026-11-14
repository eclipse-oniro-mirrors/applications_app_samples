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

// Reference: ets/test/Interaction/FocusRingBehavior.test.ets
// Original line floor: 687; scenario family: card-identity.
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

export default function ObjectIdentityTest(): void {
  describe('ObjectIdentityTest', () => {
    beforeAll(() => {
      logSuite('ObjectIdentityTest', 'begin');
    });
    beforeEach(async () => {
      // Yield between cases so device watchdog and UI events can be processed.
      await new Promise<void>((resolve) => { setTimeout(resolve, 1); });
    });
    afterAll(() => {
      logSuite('ObjectIdentityTest', 'end');
    });

    /**
     * @tc.name ObjectIdentityTest_case_001
     * @tc.desc card-identity: preserve payload semantics and stable identity; input vector 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ObjectIdentityTest_case_001', 0, () => {
      const payload = makePayload("", "100%", 0);
      const model: DataModel = makeModel("test.card-identity.0", payload);
      const source = new DataSource();
      const count = 2;
      for (let index = 0; index < count; index++) {
        source.addData(new TextCardData(model));
      }
      assertUniqueIds(source);
      const card = source.getData(0);
      const originalId = card.getObjectId();
      payload.item.title.name = "changed:0";
      for (let index = 0; index < count; index++) {
        expect(source.getData(index).opt('item').title.name).assertEqual("changed:0");
      }
      expect(card.getObjectId()).assertEqual(originalId);
      expect(source.totalCount()).assertEqual(count);
      expect(card.type).assertEqual("test.card-identity.0");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name ObjectIdentityTest_case_002
     * @tc.desc card-identity: preserve payload semantics and stable identity; input vector 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ObjectIdentityTest_case_002', 0, () => {
      const payload = makePayload("Card", "0%", 1);
      const model: DataModel = makeModel("test.card-identity.1", payload);
      const source = new DataSource();
      const count = 3;
      for (let index = 0; index < count; index++) {
        source.addData(new TextCardData(model));
      }
      assertUniqueIds(source);
      const card = source.getData(0);
      const originalId = card.getObjectId();
      payload.item.title.name = "changed:1";
      for (let index = 0; index < count; index++) {
        expect(source.getData(index).opt('item').title.name).assertEqual("changed:1");
      }
      expect(card.getObjectId()).assertEqual(originalId);
      expect(source.totalCount()).assertEqual(count);
      expect(card.type).assertEqual("test.card-identity.1");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name ObjectIdentityTest_case_003
     * @tc.desc card-identity: preserve payload semantics and stable identity; input vector 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ObjectIdentityTest_case_003', 0, () => {
      const payload = makePayload(" ", "50%", 2);
      const model: DataModel = makeModel("test.card-identity.2", payload);
      const source = new DataSource();
      const count = 4;
      for (let index = 0; index < count; index++) {
        source.addData(new TextCardData(model));
      }
      assertUniqueIds(source);
      const card = source.getData(0);
      const originalId = card.getObjectId();
      payload.item.title.name = "changed:2";
      for (let index = 0; index < count; index++) {
        expect(source.getData(index).opt('item').title.name).assertEqual("changed:2");
      }
      expect(card.getObjectId()).assertEqual(originalId);
      expect(source.totalCount()).assertEqual(count);
      expect(card.type).assertEqual("test.card-identity.2");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name ObjectIdentityTest_case_004
     * @tc.desc card-identity: preserve payload semantics and stable identity; input vector 4.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ObjectIdentityTest_case_004', 0, () => {
      const payload = makePayload("  padded  ", "1%", 3);
      const model: DataModel = makeModel("test.card-identity.3", payload);
      const source = new DataSource();
      const count = 5;
      for (let index = 0; index < count; index++) {
        source.addData(new TextCardData(model));
      }
      assertUniqueIds(source);
      const card = source.getData(0);
      const originalId = card.getObjectId();
      payload.item.title.name = "changed:3";
      for (let index = 0; index < count; index++) {
        expect(source.getData(index).opt('item').title.name).assertEqual("changed:3");
      }
      expect(card.getObjectId()).assertEqual(originalId);
      expect(source.totalCount()).assertEqual(count);
      expect(card.type).assertEqual("test.card-identity.3");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name ObjectIdentityTest_case_005
     * @tc.desc card-identity: preserve payload semantics and stable identity; input vector 5.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ObjectIdentityTest_case_005', 0, () => {
      const payload = makePayload("multi word title", "99%", 4);
      const model: DataModel = makeModel("test.card-identity.4", payload);
      const source = new DataSource();
      const count = 2;
      for (let index = 0; index < count; index++) {
        source.addData(new TextCardData(model));
      }
      assertUniqueIds(source);
      const card = source.getData(0);
      const originalId = card.getObjectId();
      payload.item.title.name = "changed:4";
      for (let index = 0; index < count; index++) {
        expect(source.getData(index).opt('item').title.name).assertEqual("changed:4");
      }
      expect(card.getObjectId()).assertEqual(originalId);
      expect(source.totalCount()).assertEqual(count);
      expect(card.type).assertEqual("test.card-identity.4");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name ObjectIdentityTest_case_006
     * @tc.desc card-identity: preserve payload semantics and stable identity; input vector 6.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ObjectIdentityTest_case_006', 0, () => {
      const payload = makePayload("line\nbreak", "75%", 5);
      const model: DataModel = makeModel("test.card-identity.5", payload);
      const source = new DataSource();
      const count = 3;
      for (let index = 0; index < count; index++) {
        source.addData(new TextCardData(model));
      }
      assertUniqueIds(source);
      const card = source.getData(0);
      const originalId = card.getObjectId();
      payload.item.title.name = "changed:5";
      for (let index = 0; index < count; index++) {
        expect(source.getData(index).opt('item').title.name).assertEqual("changed:5");
      }
      expect(card.getObjectId()).assertEqual(originalId);
      expect(source.totalCount()).assertEqual(count);
      expect(card.type).assertEqual("test.card-identity.5");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name ObjectIdentityTest_case_007
     * @tc.desc card-identity: preserve payload semantics and stable identity; input vector 7.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ObjectIdentityTest_case_007', 0, () => {
      const payload = makePayload("tab\tvalue", "", 6);
      const model: DataModel = makeModel("test.card-identity.6", payload);
      const source = new DataSource();
      const count = 4;
      for (let index = 0; index < count; index++) {
        source.addData(new TextCardData(model));
      }
      assertUniqueIds(source);
      const card = source.getData(0);
      const originalId = card.getObjectId();
      payload.item.title.name = "changed:6";
      for (let index = 0; index < count; index++) {
        expect(source.getData(index).opt('item').title.name).assertEqual("changed:6");
      }
      expect(card.getObjectId()).assertEqual(originalId);
      expect(source.totalCount()).assertEqual(count);
      expect(card.type).assertEqual("test.card-identity.6");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name ObjectIdentityTest_case_008
     * @tc.desc card-identity: preserve payload semantics and stable identity; input vector 8.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ObjectIdentityTest_case_008', 0, () => {
      const payload = makePayload("\u5361\u7247 1", ":{{env(screen-width}}", 7);
      const model: DataModel = makeModel("test.card-identity.7", payload);
      const source = new DataSource();
      const count = 5;
      for (let index = 0; index < count; index++) {
        source.addData(new TextCardData(model));
      }
      assertUniqueIds(source);
      const card = source.getData(0);
      const originalId = card.getObjectId();
      payload.item.title.name = "changed:7";
      for (let index = 0; index < count; index++) {
        expect(source.getData(index).opt('item').title.name).assertEqual("changed:7");
      }
      expect(card.getObjectId()).assertEqual(originalId);
      expect(source.totalCount()).assertEqual(count);
      expect(card.type).assertEqual("test.card-identity.7");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name ObjectIdentityTest_case_009
     * @tc.desc card-identity: preserve payload semantics and stable identity; input vector 9.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ObjectIdentityTest_case_009', 0, () => {
      const payload = makePayload("\u5361\u7247 2", "100%", 8);
      const model: DataModel = makeModel("test.card-identity.8", payload);
      const source = new DataSource();
      const count = 2;
      for (let index = 0; index < count; index++) {
        source.addData(new TextCardData(model));
      }
      assertUniqueIds(source);
      const card = source.getData(0);
      const originalId = card.getObjectId();
      payload.item.title.name = "changed:8";
      for (let index = 0; index < count; index++) {
        expect(source.getData(index).opt('item').title.name).assertEqual("changed:8");
      }
      expect(card.getObjectId()).assertEqual(originalId);
      expect(source.totalCount()).assertEqual(count);
      expect(card.type).assertEqual("test.card-identity.8");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name ObjectIdentityTest_case_010
     * @tc.desc card-identity: preserve payload semantics and stable identity; input vector 10.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ObjectIdentityTest_case_010', 0, () => {
      const payload = makePayload("\u5361\u7247 3", "0%", 9);
      const model: DataModel = makeModel("test.card-identity.9", payload);
      const source = new DataSource();
      const count = 3;
      for (let index = 0; index < count; index++) {
        source.addData(new TextCardData(model));
      }
      assertUniqueIds(source);
      const card = source.getData(0);
      const originalId = card.getObjectId();
      payload.item.title.name = "changed:9";
      for (let index = 0; index < count; index++) {
        expect(source.getData(index).opt('item').title.name).assertEqual("changed:9");
      }
      expect(card.getObjectId()).assertEqual(originalId);
      expect(source.totalCount()).assertEqual(count);
      expect(card.type).assertEqual("test.card-identity.9");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name ObjectIdentityTest_case_011
     * @tc.desc card-identity: preserve payload semantics and stable identity; input vector 11.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ObjectIdentityTest_case_011', 0, () => {
      const payload = makePayload("\u65e5\u672c\u8a9e", "50%", 10);
      const model: DataModel = makeModel("test.card-identity.10", payload);
      const source = new DataSource();
      const count = 4;
      for (let index = 0; index < count; index++) {
        source.addData(new TextCardData(model));
      }
      assertUniqueIds(source);
      const card = source.getData(0);
      const originalId = card.getObjectId();
      payload.item.title.name = "changed:10";
      for (let index = 0; index < count; index++) {
        expect(source.getData(index).opt('item').title.name).assertEqual("changed:10");
      }
      expect(card.getObjectId()).assertEqual(originalId);
      expect(source.totalCount()).assertEqual(count);
      expect(card.type).assertEqual("test.card-identity.10");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name ObjectIdentityTest_case_012
     * @tc.desc card-identity: preserve payload semantics and stable identity; input vector 12.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ObjectIdentityTest_case_012', 0, () => {
      const payload = makePayload("\u0645\u0631\u062d\u0628\u0627", "1%", 11);
      const model: DataModel = makeModel("test.card-identity.11", payload);
      const source = new DataSource();
      const count = 5;
      for (let index = 0; index < count; index++) {
        source.addData(new TextCardData(model));
      }
      assertUniqueIds(source);
      const card = source.getData(0);
      const originalId = card.getObjectId();
      payload.item.title.name = "changed:11";
      for (let index = 0; index < count; index++) {
        expect(source.getData(index).opt('item').title.name).assertEqual("changed:11");
      }
      expect(card.getObjectId()).assertEqual(originalId);
      expect(source.totalCount()).assertEqual(count);
      expect(card.type).assertEqual("test.card-identity.11");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name ObjectIdentityTest_case_013
     * @tc.desc card-identity: preserve payload semantics and stable identity; input vector 13.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ObjectIdentityTest_case_013', 0, () => {
      const payload = makePayload("\u05e9\u05dc\u05d5\u05dd", "99%", 12);
      const model: DataModel = makeModel("test.card-identity.12", payload);
      const source = new DataSource();
      const count = 2;
      for (let index = 0; index < count; index++) {
        source.addData(new TextCardData(model));
      }
      assertUniqueIds(source);
      const card = source.getData(0);
      const originalId = card.getObjectId();
      payload.item.title.name = "changed:12";
      for (let index = 0; index < count; index++) {
        expect(source.getData(index).opt('item').title.name).assertEqual("changed:12");
      }
      expect(card.getObjectId()).assertEqual(originalId);
      expect(source.totalCount()).assertEqual(count);
      expect(card.type).assertEqual("test.card-identity.12");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name ObjectIdentityTest_case_014
     * @tc.desc card-identity: preserve payload semantics and stable identity; input vector 14.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ObjectIdentityTest_case_014', 0, () => {
      const payload = makePayload("e\u0301", "75%", 13);
      const model: DataModel = makeModel("test.card-identity.13", payload);
      const source = new DataSource();
      const count = 3;
      for (let index = 0; index < count; index++) {
        source.addData(new TextCardData(model));
      }
      assertUniqueIds(source);
      const card = source.getData(0);
      const originalId = card.getObjectId();
      payload.item.title.name = "changed:13";
      for (let index = 0; index < count; index++) {
        expect(source.getData(index).opt('item').title.name).assertEqual("changed:13");
      }
      expect(card.getObjectId()).assertEqual(originalId);
      expect(source.totalCount()).assertEqual(count);
      expect(card.type).assertEqual("test.card-identity.13");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name ObjectIdentityTest_case_015
     * @tc.desc card-identity: preserve payload semantics and stable identity; input vector 15.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ObjectIdentityTest_case_015', 0, () => {
      const payload = makePayload("\u00e9", "", 14);
      const model: DataModel = makeModel("test.card-identity.14", payload);
      const source = new DataSource();
      const count = 4;
      for (let index = 0; index < count; index++) {
        source.addData(new TextCardData(model));
      }
      assertUniqueIds(source);
      const card = source.getData(0);
      const originalId = card.getObjectId();
      payload.item.title.name = "changed:14";
      for (let index = 0; index < count; index++) {
        expect(source.getData(index).opt('item').title.name).assertEqual("changed:14");
      }
      expect(card.getObjectId()).assertEqual(originalId);
      expect(source.totalCount()).assertEqual(count);
      expect(card.type).assertEqual("test.card-identity.14");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name ObjectIdentityTest_case_016
     * @tc.desc card-identity: preserve payload semantics and stable identity; input vector 16.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ObjectIdentityTest_case_016', 0, () => {
      const payload = makePayload("\ud83d\ude80", ":{{env(screen-width}}", 15);
      const model: DataModel = makeModel("test.card-identity.15", payload);
      const source = new DataSource();
      const count = 5;
      for (let index = 0; index < count; index++) {
        source.addData(new TextCardData(model));
      }
      assertUniqueIds(source);
      const card = source.getData(0);
      const originalId = card.getObjectId();
      payload.item.title.name = "changed:15";
      for (let index = 0; index < count; index++) {
        expect(source.getData(index).opt('item').title.name).assertEqual("changed:15");
      }
      expect(card.getObjectId()).assertEqual(originalId);
      expect(source.totalCount()).assertEqual(count);
      expect(card.type).assertEqual("test.card-identity.15");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name ObjectIdentityTest_case_017
     * @tc.desc card-identity: preserve payload semantics and stable identity; input vector 17.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ObjectIdentityTest_case_017', 0, () => {
      const payload = makePayload("quote\"slash\\", "100%", 16);
      const model: DataModel = makeModel("test.card-identity.16", payload);
      const source = new DataSource();
      const count = 2;
      for (let index = 0; index < count; index++) {
        source.addData(new TextCardData(model));
      }
      assertUniqueIds(source);
      const card = source.getData(0);
      const originalId = card.getObjectId();
      payload.item.title.name = "changed:16";
      for (let index = 0; index < count; index++) {
        expect(source.getData(index).opt('item').title.name).assertEqual("changed:16");
      }
      expect(card.getObjectId()).assertEqual(originalId);
      expect(source.totalCount()).assertEqual(count);
      expect(card.type).assertEqual("test.card-identity.16");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name ObjectIdentityTest_case_018
     * @tc.desc card-identity: preserve payload semantics and stable identity; input vector 18.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ObjectIdentityTest_case_018', 0, () => {
      const payload = makePayload("<script>alert(1)</script>", "0%", 17);
      const model: DataModel = makeModel("test.card-identity.17", payload);
      const source = new DataSource();
      const count = 3;
      for (let index = 0; index < count; index++) {
        source.addData(new TextCardData(model));
      }
      assertUniqueIds(source);
      const card = source.getData(0);
      const originalId = card.getObjectId();
      payload.item.title.name = "changed:17";
      for (let index = 0; index < count; index++) {
        expect(source.getData(index).opt('item').title.name).assertEqual("changed:17");
      }
      expect(card.getObjectId()).assertEqual(originalId);
      expect(source.totalCount()).assertEqual(count);
      expect(card.type).assertEqual("test.card-identity.17");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name ObjectIdentityTest_case_019
     * @tc.desc card-identity: preserve payload semantics and stable identity; input vector 19.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ObjectIdentityTest_case_019', 0, () => {
      const payload = makePayload("${notExecuted}", "50%", 18);
      const model: DataModel = makeModel("test.card-identity.18", payload);
      const source = new DataSource();
      const count = 4;
      for (let index = 0; index < count; index++) {
        source.addData(new TextCardData(model));
      }
      assertUniqueIds(source);
      const card = source.getData(0);
      const originalId = card.getObjectId();
      payload.item.title.name = "changed:18";
      for (let index = 0; index < count; index++) {
        expect(source.getData(index).opt('item').title.name).assertEqual("changed:18");
      }
      expect(card.getObjectId()).assertEqual(originalId);
      expect(source.totalCount()).assertEqual(count);
      expect(card.type).assertEqual("test.card-identity.18");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name ObjectIdentityTest_case_020
     * @tc.desc card-identity: preserve payload semantics and stable identity; input vector 20.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ObjectIdentityTest_case_020', 0, () => {
      const payload = makePayload("__proto__", "1%", 19);
      const model: DataModel = makeModel("test.card-identity.19", payload);
      const source = new DataSource();
      const count = 5;
      for (let index = 0; index < count; index++) {
        source.addData(new TextCardData(model));
      }
      assertUniqueIds(source);
      const card = source.getData(0);
      const originalId = card.getObjectId();
      payload.item.title.name = "changed:19";
      for (let index = 0; index < count; index++) {
        expect(source.getData(index).opt('item').title.name).assertEqual("changed:19");
      }
      expect(card.getObjectId()).assertEqual(originalId);
      expect(source.totalCount()).assertEqual(count);
      expect(card.type).assertEqual("test.card-identity.19");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name ObjectIdentityTest_case_021
     * @tc.desc card-identity: preserve payload semantics and stable identity; input vector 21.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ObjectIdentityTest_case_021', 0, () => {
      const payload = makePayload("constructor", "99%", 20);
      const model: DataModel = makeModel("test.card-identity.20", payload);
      const source = new DataSource();
      const count = 2;
      for (let index = 0; index < count; index++) {
        source.addData(new TextCardData(model));
      }
      assertUniqueIds(source);
      const card = source.getData(0);
      const originalId = card.getObjectId();
      payload.item.title.name = "changed:20";
      for (let index = 0; index < count; index++) {
        expect(source.getData(index).opt('item').title.name).assertEqual("changed:20");
      }
      expect(card.getObjectId()).assertEqual(originalId);
      expect(source.totalCount()).assertEqual(count);
      expect(card.type).assertEqual("test.card-identity.20");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name ObjectIdentityTest_case_022
     * @tc.desc card-identity: preserve payload semantics and stable identity; input vector 22.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ObjectIdentityTest_case_022', 0, () => {
      const payload = makePayload("null", "75%", 21);
      const model: DataModel = makeModel("test.card-identity.21", payload);
      const source = new DataSource();
      const count = 3;
      for (let index = 0; index < count; index++) {
        source.addData(new TextCardData(model));
      }
      assertUniqueIds(source);
      const card = source.getData(0);
      const originalId = card.getObjectId();
      payload.item.title.name = "changed:21";
      for (let index = 0; index < count; index++) {
        expect(source.getData(index).opt('item').title.name).assertEqual("changed:21");
      }
      expect(card.getObjectId()).assertEqual(originalId);
      expect(source.totalCount()).assertEqual(count);
      expect(card.type).assertEqual("test.card-identity.21");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name ObjectIdentityTest_case_023
     * @tc.desc card-identity: preserve payload semantics and stable identity; input vector 23.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ObjectIdentityTest_case_023', 0, () => {
      const payload = makePayload("false", "", 22);
      const model: DataModel = makeModel("test.card-identity.22", payload);
      const source = new DataSource();
      const count = 4;
      for (let index = 0; index < count; index++) {
        source.addData(new TextCardData(model));
      }
      assertUniqueIds(source);
      const card = source.getData(0);
      const originalId = card.getObjectId();
      payload.item.title.name = "changed:22";
      for (let index = 0; index < count; index++) {
        expect(source.getData(index).opt('item').title.name).assertEqual("changed:22");
      }
      expect(card.getObjectId()).assertEqual(originalId);
      expect(source.totalCount()).assertEqual(count);
      expect(card.type).assertEqual("test.card-identity.22");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name ObjectIdentityTest_case_024
     * @tc.desc card-identity: preserve payload semantics and stable identity; input vector 24.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ObjectIdentityTest_case_024', 0, () => {
      const payload = makePayload("0", ":{{env(screen-width}}", 23);
      const model: DataModel = makeModel("test.card-identity.23", payload);
      const source = new DataSource();
      const count = 5;
      for (let index = 0; index < count; index++) {
        source.addData(new TextCardData(model));
      }
      assertUniqueIds(source);
      const card = source.getData(0);
      const originalId = card.getObjectId();
      payload.item.title.name = "changed:23";
      for (let index = 0; index < count; index++) {
        expect(source.getData(index).opt('item').title.name).assertEqual("changed:23");
      }
      expect(card.getObjectId()).assertEqual(originalId);
      expect(source.totalCount()).assertEqual(count);
      expect(card.type).assertEqual("test.card-identity.23");
      expect(card.getObjectId().length > 0).assertTrue();
    });
  });
}
