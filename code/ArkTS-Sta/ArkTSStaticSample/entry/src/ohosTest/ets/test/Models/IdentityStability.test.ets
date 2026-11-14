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

// Reference: ets/test/PerformanceStability/MemoryLeakDetection.test.ets
// Original line floor: 212; scenario family: card-identity-batch.
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

export default function IdentityStabilityTest(): void {
  describe('IdentityStabilityTest', () => {
    beforeAll(() => {
      logSuite('IdentityStabilityTest', 'begin');
    });
    beforeEach(async () => {
      // Yield between cases so device watchdog and UI events can be processed.
      await new Promise<void>((resolve) => { setTimeout(resolve, 1); });
    });
    afterAll(() => {
      logSuite('IdentityStabilityTest', 'end');
    });

    /**
     * @tc.name IdentityStabilityTest_case_001
     * @tc.desc card-identity-batch: preserve payload semantics and stable identity; input vector 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('IdentityStabilityTest_case_001', 0, () => {
      const payload = makePayload("", "100%", 0);
      const model: DataModel = makeModel("test.card-identity-batch.0", payload);
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
      expect(card.type).assertEqual("test.card-identity-batch.0");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name IdentityStabilityTest_case_002
     * @tc.desc card-identity-batch: preserve payload semantics and stable identity; input vector 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('IdentityStabilityTest_case_002', 0, () => {
      const payload = makePayload("Card", "0%", 1);
      const model: DataModel = makeModel("test.card-identity-batch.1", payload);
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
      expect(card.type).assertEqual("test.card-identity-batch.1");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name IdentityStabilityTest_case_003
     * @tc.desc card-identity-batch: preserve payload semantics and stable identity; input vector 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('IdentityStabilityTest_case_003', 0, () => {
      const payload = makePayload(" ", "50%", 2);
      const model: DataModel = makeModel("test.card-identity-batch.2", payload);
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
      expect(card.type).assertEqual("test.card-identity-batch.2");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name IdentityStabilityTest_case_004
     * @tc.desc card-identity-batch: preserve payload semantics and stable identity; input vector 4.
     * @tc.type Function
     * @tc.level Level1
     */
    it('IdentityStabilityTest_case_004', 0, () => {
      const payload = makePayload("  padded  ", "1%", 3);
      const model: DataModel = makeModel("test.card-identity-batch.3", payload);
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
      expect(card.type).assertEqual("test.card-identity-batch.3");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name IdentityStabilityTest_case_005
     * @tc.desc card-identity-batch: preserve payload semantics and stable identity; input vector 5.
     * @tc.type Function
     * @tc.level Level1
     */
    it('IdentityStabilityTest_case_005', 0, () => {
      const payload = makePayload("multi word title", "99%", 4);
      const model: DataModel = makeModel("test.card-identity-batch.4", payload);
      const source = new DataSource();
      const count = 9;
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
      expect(card.type).assertEqual("test.card-identity-batch.4");
      expect(card.getObjectId().length > 0).assertTrue();
    });

    /**
     * @tc.name IdentityStabilityTest_case_006
     * @tc.desc card-identity-batch: preserve payload semantics and stable identity; input vector 6.
     * @tc.type Function
     * @tc.level Level1
     */
    it('IdentityStabilityTest_case_006', 0, () => {
      const payload = makePayload("line\nbreak", "75%", 5);
      const model: DataModel = makeModel("test.card-identity-batch.5", payload);
      const source = new DataSource();
      const count = 10;
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
      expect(card.type).assertEqual("test.card-identity-batch.5");
      expect(card.getObjectId().length > 0).assertTrue();
    });
  });
}
