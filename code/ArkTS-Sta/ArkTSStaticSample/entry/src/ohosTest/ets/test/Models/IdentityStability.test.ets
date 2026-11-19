/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
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
