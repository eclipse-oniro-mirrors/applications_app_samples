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

// Reference: ets/test/PowerDialog/PowerOperationCatalog.test.ets
// Original line floor: 1045; scenario family: registry-keys.
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

export default function TypeCatalogTest(): void {
  describe('TypeCatalogTest', () => {
    beforeAll(() => {
      logSuite('TypeCatalogTest', 'begin');
    });
    beforeEach(async () => {
      // Yield between cases so device watchdog and UI events can be processed.
      await new Promise<void>((resolve) => { setTimeout(resolve, 1); });
    });
    afterAll(() => {
      logSuite('TypeCatalogTest', 'end');
    });

    /**
     * @tc.name TypeCatalogTest_case_001
     * @tc.desc registry-keys: registration lookup and resolver call isolation; input vector 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('TypeCatalogTest_case_001', 0, () => {
      const type = "test.registry-keys.0";
      const resolver = new RecordingResolver();
      const model = makeModel(type, makePayload("", "100%", 0));
      registry.registerCard(type, resolver);
      expect(registry.getCardResolver(type) === resolver).assertTrue();
      expect(resolver.calls).assertEqual(0);
      const resolved = registry.getCardResolver(type)!;
      const calls = 1;
      const ids: string[] = [];
      for (let index = 0; index < calls; index++) {
        const card = resolved.createData(model);
        expect(card.type).assertEqual(type);
        expect(card.data === model.data).assertTrue();
        expect(card.opt('item').title.name).assertEqual("");
        expect(ids.indexOf(card.getObjectId())).assertEqual(-1);
        ids.push(card.getObjectId());
      }
      expect(resolver.calls).assertEqual(calls);
      expect(resolver.models.length).assertEqual(calls);
      expect(resolver.models[0] === model).assertTrue();
      expect(registry.getCardResolver(type + ':absent')).assertUndefined();
    });

    /**
     * @tc.name TypeCatalogTest_case_002
     * @tc.desc registry-keys: registration lookup and resolver call isolation; input vector 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('TypeCatalogTest_case_002', 0, () => {
      const type = "test.registry-keys.1";
      const resolver = new RecordingResolver();
      const model = makeModel(type, makePayload("Card", "0%", 1));
      registry.registerCard(type, resolver);
      expect(registry.getCardResolver(type) === resolver).assertTrue();
      expect(resolver.calls).assertEqual(0);
      const resolved = registry.getCardResolver(type)!;
      const calls = 2;
      const ids: string[] = [];
      for (let index = 0; index < calls; index++) {
        const card = resolved.createData(model);
        expect(card.type).assertEqual(type);
        expect(card.data === model.data).assertTrue();
        expect(card.opt('item').title.name).assertEqual("Card");
        expect(ids.indexOf(card.getObjectId())).assertEqual(-1);
        ids.push(card.getObjectId());
      }
      expect(resolver.calls).assertEqual(calls);
      expect(resolver.models.length).assertEqual(calls);
      expect(resolver.models[0] === model).assertTrue();
      expect(registry.getCardResolver(type + ':absent')).assertUndefined();
    });

    /**
     * @tc.name TypeCatalogTest_case_003
     * @tc.desc registry-keys: registration lookup and resolver call isolation; input vector 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('TypeCatalogTest_case_003', 0, () => {
      const type = "test.registry-keys.2";
      const resolver = new RecordingResolver();
      const model = makeModel(type, makePayload(" ", "50%", 2));
      registry.registerCard(type, resolver);
      expect(registry.getCardResolver(type) === resolver).assertTrue();
      expect(resolver.calls).assertEqual(0);
      const resolved = registry.getCardResolver(type)!;
      const calls = 3;
      const ids: string[] = [];
      for (let index = 0; index < calls; index++) {
        const card = resolved.createData(model);
        expect(card.type).assertEqual(type);
        expect(card.data === model.data).assertTrue();
        expect(card.opt('item').title.name).assertEqual(" ");
        expect(ids.indexOf(card.getObjectId())).assertEqual(-1);
        ids.push(card.getObjectId());
      }
      expect(resolver.calls).assertEqual(calls);
      expect(resolver.models.length).assertEqual(calls);
      expect(resolver.models[0] === model).assertTrue();
      expect(registry.getCardResolver(type + ':absent')).assertUndefined();
    });

    /**
     * @tc.name TypeCatalogTest_case_004
     * @tc.desc registry-keys: registration lookup and resolver call isolation; input vector 4.
     * @tc.type Function
     * @tc.level Level1
     */
    it('TypeCatalogTest_case_004', 0, () => {
      const type = "test.registry-keys.3";
      const resolver = new RecordingResolver();
      const model = makeModel(type, makePayload("  padded  ", "1%", 3));
      registry.registerCard(type, resolver);
      expect(registry.getCardResolver(type) === resolver).assertTrue();
      expect(resolver.calls).assertEqual(0);
      const resolved = registry.getCardResolver(type)!;
      const calls = 4;
      const ids: string[] = [];
      for (let index = 0; index < calls; index++) {
        const card = resolved.createData(model);
        expect(card.type).assertEqual(type);
        expect(card.data === model.data).assertTrue();
        expect(card.opt('item').title.name).assertEqual("  padded  ");
        expect(ids.indexOf(card.getObjectId())).assertEqual(-1);
        ids.push(card.getObjectId());
      }
      expect(resolver.calls).assertEqual(calls);
      expect(resolver.models.length).assertEqual(calls);
      expect(resolver.models[0] === model).assertTrue();
      expect(registry.getCardResolver(type + ':absent')).assertUndefined();
    });

    /**
     * @tc.name TypeCatalogTest_case_005
     * @tc.desc registry-keys: registration lookup and resolver call isolation; input vector 5.
     * @tc.type Function
     * @tc.level Level1
     */
    it('TypeCatalogTest_case_005', 0, () => {
      const type = "test.registry-keys.4";
      const resolver = new RecordingResolver();
      const model = makeModel(type, makePayload("multi word title", "99%", 4));
      registry.registerCard(type, resolver);
      expect(registry.getCardResolver(type) === resolver).assertTrue();
      expect(resolver.calls).assertEqual(0);
      const resolved = registry.getCardResolver(type)!;
      const calls = 1;
      const ids: string[] = [];
      for (let index = 0; index < calls; index++) {
        const card = resolved.createData(model);
        expect(card.type).assertEqual(type);
        expect(card.data === model.data).assertTrue();
        expect(card.opt('item').title.name).assertEqual("multi word title");
        expect(ids.indexOf(card.getObjectId())).assertEqual(-1);
        ids.push(card.getObjectId());
      }
      expect(resolver.calls).assertEqual(calls);
      expect(resolver.models.length).assertEqual(calls);
      expect(resolver.models[0] === model).assertTrue();
      expect(registry.getCardResolver(type + ':absent')).assertUndefined();
    });

    /**
     * @tc.name TypeCatalogTest_case_006
     * @tc.desc registry-keys: registration lookup and resolver call isolation; input vector 6.
     * @tc.type Function
     * @tc.level Level1
     */
    it('TypeCatalogTest_case_006', 0, () => {
      const type = "test.registry-keys.5";
      const resolver = new RecordingResolver();
      const model = makeModel(type, makePayload("line\nbreak", "75%", 5));
      registry.registerCard(type, resolver);
      expect(registry.getCardResolver(type) === resolver).assertTrue();
      expect(resolver.calls).assertEqual(0);
      const resolved = registry.getCardResolver(type)!;
      const calls = 2;
      const ids: string[] = [];
      for (let index = 0; index < calls; index++) {
        const card = resolved.createData(model);
        expect(card.type).assertEqual(type);
        expect(card.data === model.data).assertTrue();
        expect(card.opt('item').title.name).assertEqual("line\nbreak");
        expect(ids.indexOf(card.getObjectId())).assertEqual(-1);
        ids.push(card.getObjectId());
      }
      expect(resolver.calls).assertEqual(calls);
      expect(resolver.models.length).assertEqual(calls);
      expect(resolver.models[0] === model).assertTrue();
      expect(registry.getCardResolver(type + ':absent')).assertUndefined();
    });

    /**
     * @tc.name TypeCatalogTest_case_007
     * @tc.desc registry-keys: registration lookup and resolver call isolation; input vector 7.
     * @tc.type Function
     * @tc.level Level1
     */
    it('TypeCatalogTest_case_007', 0, () => {
      const type = "test.registry-keys.6";
      const resolver = new RecordingResolver();
      const model = makeModel(type, makePayload("tab\tvalue", "", 6));
      registry.registerCard(type, resolver);
      expect(registry.getCardResolver(type) === resolver).assertTrue();
      expect(resolver.calls).assertEqual(0);
      const resolved = registry.getCardResolver(type)!;
      const calls = 3;
      const ids: string[] = [];
      for (let index = 0; index < calls; index++) {
        const card = resolved.createData(model);
        expect(card.type).assertEqual(type);
        expect(card.data === model.data).assertTrue();
        expect(card.opt('item').title.name).assertEqual("tab\tvalue");
        expect(ids.indexOf(card.getObjectId())).assertEqual(-1);
        ids.push(card.getObjectId());
      }
      expect(resolver.calls).assertEqual(calls);
      expect(resolver.models.length).assertEqual(calls);
      expect(resolver.models[0] === model).assertTrue();
      expect(registry.getCardResolver(type + ':absent')).assertUndefined();
    });

    /**
     * @tc.name TypeCatalogTest_case_008
     * @tc.desc registry-keys: registration lookup and resolver call isolation; input vector 8.
     * @tc.type Function
     * @tc.level Level1
     */
    it('TypeCatalogTest_case_008', 0, () => {
      const type = "test.registry-keys.7";
      const resolver = new RecordingResolver();
      const model = makeModel(type, makePayload("\u5361\u7247 1", ":{{env(screen-width}}", 7));
      registry.registerCard(type, resolver);
      expect(registry.getCardResolver(type) === resolver).assertTrue();
      expect(resolver.calls).assertEqual(0);
      const resolved = registry.getCardResolver(type)!;
      const calls = 4;
      const ids: string[] = [];
      for (let index = 0; index < calls; index++) {
        const card = resolved.createData(model);
        expect(card.type).assertEqual(type);
        expect(card.data === model.data).assertTrue();
        expect(card.opt('item').title.name).assertEqual("\u5361\u7247 1");
        expect(ids.indexOf(card.getObjectId())).assertEqual(-1);
        ids.push(card.getObjectId());
      }
      expect(resolver.calls).assertEqual(calls);
      expect(resolver.models.length).assertEqual(calls);
      expect(resolver.models[0] === model).assertTrue();
      expect(registry.getCardResolver(type + ':absent')).assertUndefined();
    });

    /**
     * @tc.name TypeCatalogTest_case_009
     * @tc.desc registry-keys: registration lookup and resolver call isolation; input vector 9.
     * @tc.type Function
     * @tc.level Level1
     */
    it('TypeCatalogTest_case_009', 0, () => {
      const type = "test.registry-keys.8";
      const resolver = new RecordingResolver();
      const model = makeModel(type, makePayload("\u5361\u7247 2", "100%", 8));
      registry.registerCard(type, resolver);
      expect(registry.getCardResolver(type) === resolver).assertTrue();
      expect(resolver.calls).assertEqual(0);
      const resolved = registry.getCardResolver(type)!;
      const calls = 1;
      const ids: string[] = [];
      for (let index = 0; index < calls; index++) {
        const card = resolved.createData(model);
        expect(card.type).assertEqual(type);
        expect(card.data === model.data).assertTrue();
        expect(card.opt('item').title.name).assertEqual("\u5361\u7247 2");
        expect(ids.indexOf(card.getObjectId())).assertEqual(-1);
        ids.push(card.getObjectId());
      }
      expect(resolver.calls).assertEqual(calls);
      expect(resolver.models.length).assertEqual(calls);
      expect(resolver.models[0] === model).assertTrue();
      expect(registry.getCardResolver(type + ':absent')).assertUndefined();
    });

    /**
     * @tc.name TypeCatalogTest_case_010
     * @tc.desc registry-keys: registration lookup and resolver call isolation; input vector 10.
     * @tc.type Function
     * @tc.level Level1
     */
    it('TypeCatalogTest_case_010', 0, () => {
      const type = "test.registry-keys.9";
      const resolver = new RecordingResolver();
      const model = makeModel(type, makePayload("\u5361\u7247 3", "0%", 9));
      registry.registerCard(type, resolver);
      expect(registry.getCardResolver(type) === resolver).assertTrue();
      expect(resolver.calls).assertEqual(0);
      const resolved = registry.getCardResolver(type)!;
      const calls = 2;
      const ids: string[] = [];
      for (let index = 0; index < calls; index++) {
        const card = resolved.createData(model);
        expect(card.type).assertEqual(type);
        expect(card.data === model.data).assertTrue();
        expect(card.opt('item').title.name).assertEqual("\u5361\u7247 3");
        expect(ids.indexOf(card.getObjectId())).assertEqual(-1);
        ids.push(card.getObjectId());
      }
      expect(resolver.calls).assertEqual(calls);
      expect(resolver.models.length).assertEqual(calls);
      expect(resolver.models[0] === model).assertTrue();
      expect(registry.getCardResolver(type + ':absent')).assertUndefined();
    });

    /**
     * @tc.name TypeCatalogTest_case_011
     * @tc.desc registry-keys: registration lookup and resolver call isolation; input vector 11.
     * @tc.type Function
     * @tc.level Level1
     */
    it('TypeCatalogTest_case_011', 0, () => {
      const type = "test.registry-keys.10";
      const resolver = new RecordingResolver();
      const model = makeModel(type, makePayload("\u65e5\u672c\u8a9e", "50%", 10));
      registry.registerCard(type, resolver);
      expect(registry.getCardResolver(type) === resolver).assertTrue();
      expect(resolver.calls).assertEqual(0);
      const resolved = registry.getCardResolver(type)!;
      const calls = 3;
      const ids: string[] = [];
      for (let index = 0; index < calls; index++) {
        const card = resolved.createData(model);
        expect(card.type).assertEqual(type);
        expect(card.data === model.data).assertTrue();
        expect(card.opt('item').title.name).assertEqual("\u65e5\u672c\u8a9e");
        expect(ids.indexOf(card.getObjectId())).assertEqual(-1);
        ids.push(card.getObjectId());
      }
      expect(resolver.calls).assertEqual(calls);
      expect(resolver.models.length).assertEqual(calls);
      expect(resolver.models[0] === model).assertTrue();
      expect(registry.getCardResolver(type + ':absent')).assertUndefined();
    });

    /**
     * @tc.name TypeCatalogTest_case_012
     * @tc.desc registry-keys: registration lookup and resolver call isolation; input vector 12.
     * @tc.type Function
     * @tc.level Level1
     */
    it('TypeCatalogTest_case_012', 0, () => {
      const type = "test.registry-keys.11";
      const resolver = new RecordingResolver();
      const model = makeModel(type, makePayload("\u0645\u0631\u062d\u0628\u0627", "1%", 11));
      registry.registerCard(type, resolver);
      expect(registry.getCardResolver(type) === resolver).assertTrue();
      expect(resolver.calls).assertEqual(0);
      const resolved = registry.getCardResolver(type)!;
      const calls = 4;
      const ids: string[] = [];
      for (let index = 0; index < calls; index++) {
        const card = resolved.createData(model);
        expect(card.type).assertEqual(type);
        expect(card.data === model.data).assertTrue();
        expect(card.opt('item').title.name).assertEqual("\u0645\u0631\u062d\u0628\u0627");
        expect(ids.indexOf(card.getObjectId())).assertEqual(-1);
        ids.push(card.getObjectId());
      }
      expect(resolver.calls).assertEqual(calls);
      expect(resolver.models.length).assertEqual(calls);
      expect(resolver.models[0] === model).assertTrue();
      expect(registry.getCardResolver(type + ':absent')).assertUndefined();
    });

    /**
     * @tc.name TypeCatalogTest_case_013
     * @tc.desc registry-keys: registration lookup and resolver call isolation; input vector 13.
     * @tc.type Function
     * @tc.level Level1
     */
    it('TypeCatalogTest_case_013', 0, () => {
      const type = "test.registry-keys.12";
      const resolver = new RecordingResolver();
      const model = makeModel(type, makePayload("\u05e9\u05dc\u05d5\u05dd", "99%", 12));
      registry.registerCard(type, resolver);
      expect(registry.getCardResolver(type) === resolver).assertTrue();
      expect(resolver.calls).assertEqual(0);
      const resolved = registry.getCardResolver(type)!;
      const calls = 1;
      const ids: string[] = [];
      for (let index = 0; index < calls; index++) {
        const card = resolved.createData(model);
        expect(card.type).assertEqual(type);
        expect(card.data === model.data).assertTrue();
        expect(card.opt('item').title.name).assertEqual("\u05e9\u05dc\u05d5\u05dd");
        expect(ids.indexOf(card.getObjectId())).assertEqual(-1);
        ids.push(card.getObjectId());
      }
      expect(resolver.calls).assertEqual(calls);
      expect(resolver.models.length).assertEqual(calls);
      expect(resolver.models[0] === model).assertTrue();
      expect(registry.getCardResolver(type + ':absent')).assertUndefined();
    });

    /**
     * @tc.name TypeCatalogTest_case_014
     * @tc.desc registry-keys: registration lookup and resolver call isolation; input vector 14.
     * @tc.type Function
     * @tc.level Level1
     */
    it('TypeCatalogTest_case_014', 0, () => {
      const type = "test.registry-keys.13";
      const resolver = new RecordingResolver();
      const model = makeModel(type, makePayload("e\u0301", "75%", 13));
      registry.registerCard(type, resolver);
      expect(registry.getCardResolver(type) === resolver).assertTrue();
      expect(resolver.calls).assertEqual(0);
      const resolved = registry.getCardResolver(type)!;
      const calls = 2;
      const ids: string[] = [];
      for (let index = 0; index < calls; index++) {
        const card = resolved.createData(model);
        expect(card.type).assertEqual(type);
        expect(card.data === model.data).assertTrue();
        expect(card.opt('item').title.name).assertEqual("e\u0301");
        expect(ids.indexOf(card.getObjectId())).assertEqual(-1);
        ids.push(card.getObjectId());
      }
      expect(resolver.calls).assertEqual(calls);
      expect(resolver.models.length).assertEqual(calls);
      expect(resolver.models[0] === model).assertTrue();
      expect(registry.getCardResolver(type + ':absent')).assertUndefined();
    });

    /**
     * @tc.name TypeCatalogTest_case_015
     * @tc.desc registry-keys: registration lookup and resolver call isolation; input vector 15.
     * @tc.type Function
     * @tc.level Level1
     */
    it('TypeCatalogTest_case_015', 0, () => {
      const type = "test.registry-keys.14";
      const resolver = new RecordingResolver();
      const model = makeModel(type, makePayload("\u00e9", "", 14));
      registry.registerCard(type, resolver);
      expect(registry.getCardResolver(type) === resolver).assertTrue();
      expect(resolver.calls).assertEqual(0);
      const resolved = registry.getCardResolver(type)!;
      const calls = 3;
      const ids: string[] = [];
      for (let index = 0; index < calls; index++) {
        const card = resolved.createData(model);
        expect(card.type).assertEqual(type);
        expect(card.data === model.data).assertTrue();
        expect(card.opt('item').title.name).assertEqual("\u00e9");
        expect(ids.indexOf(card.getObjectId())).assertEqual(-1);
        ids.push(card.getObjectId());
      }
      expect(resolver.calls).assertEqual(calls);
      expect(resolver.models.length).assertEqual(calls);
      expect(resolver.models[0] === model).assertTrue();
      expect(registry.getCardResolver(type + ':absent')).assertUndefined();
    });

    /**
     * @tc.name TypeCatalogTest_case_016
     * @tc.desc registry-keys: registration lookup and resolver call isolation; input vector 16.
     * @tc.type Function
     * @tc.level Level1
     */
    it('TypeCatalogTest_case_016', 0, () => {
      const type = "test.registry-keys.15";
      const resolver = new RecordingResolver();
      const model = makeModel(type, makePayload("\ud83d\ude80", ":{{env(screen-width}}", 15));
      registry.registerCard(type, resolver);
      expect(registry.getCardResolver(type) === resolver).assertTrue();
      expect(resolver.calls).assertEqual(0);
      const resolved = registry.getCardResolver(type)!;
      const calls = 4;
      const ids: string[] = [];
      for (let index = 0; index < calls; index++) {
        const card = resolved.createData(model);
        expect(card.type).assertEqual(type);
        expect(card.data === model.data).assertTrue();
        expect(card.opt('item').title.name).assertEqual("\ud83d\ude80");
        expect(ids.indexOf(card.getObjectId())).assertEqual(-1);
        ids.push(card.getObjectId());
      }
      expect(resolver.calls).assertEqual(calls);
      expect(resolver.models.length).assertEqual(calls);
      expect(resolver.models[0] === model).assertTrue();
      expect(registry.getCardResolver(type + ':absent')).assertUndefined();
    });

    /**
     * @tc.name TypeCatalogTest_case_017
     * @tc.desc registry-keys: registration lookup and resolver call isolation; input vector 17.
     * @tc.type Function
     * @tc.level Level1
     */
    it('TypeCatalogTest_case_017', 0, () => {
      const type = "test.registry-keys.16";
      const resolver = new RecordingResolver();
      const model = makeModel(type, makePayload("quote\"slash\\", "100%", 16));
      registry.registerCard(type, resolver);
      expect(registry.getCardResolver(type) === resolver).assertTrue();
      expect(resolver.calls).assertEqual(0);
      const resolved = registry.getCardResolver(type)!;
      const calls = 1;
      const ids: string[] = [];
      for (let index = 0; index < calls; index++) {
        const card = resolved.createData(model);
        expect(card.type).assertEqual(type);
        expect(card.data === model.data).assertTrue();
        expect(card.opt('item').title.name).assertEqual("quote\"slash\\");
        expect(ids.indexOf(card.getObjectId())).assertEqual(-1);
        ids.push(card.getObjectId());
      }
      expect(resolver.calls).assertEqual(calls);
      expect(resolver.models.length).assertEqual(calls);
      expect(resolver.models[0] === model).assertTrue();
      expect(registry.getCardResolver(type + ':absent')).assertUndefined();
    });

    /**
     * @tc.name TypeCatalogTest_case_018
     * @tc.desc registry-keys: registration lookup and resolver call isolation; input vector 18.
     * @tc.type Function
     * @tc.level Level1
     */
    it('TypeCatalogTest_case_018', 0, () => {
      const type = "test.registry-keys.17";
      const resolver = new RecordingResolver();
      const model = makeModel(type, makePayload("<script>alert(1)</script>", "0%", 17));
      registry.registerCard(type, resolver);
      expect(registry.getCardResolver(type) === resolver).assertTrue();
      expect(resolver.calls).assertEqual(0);
      const resolved = registry.getCardResolver(type)!;
      const calls = 2;
      const ids: string[] = [];
      for (let index = 0; index < calls; index++) {
        const card = resolved.createData(model);
        expect(card.type).assertEqual(type);
        expect(card.data === model.data).assertTrue();
        expect(card.opt('item').title.name).assertEqual("<script>alert(1)</script>");
        expect(ids.indexOf(card.getObjectId())).assertEqual(-1);
        ids.push(card.getObjectId());
      }
      expect(resolver.calls).assertEqual(calls);
      expect(resolver.models.length).assertEqual(calls);
      expect(resolver.models[0] === model).assertTrue();
      expect(registry.getCardResolver(type + ':absent')).assertUndefined();
    });

    /**
     * @tc.name TypeCatalogTest_case_019
     * @tc.desc registry-keys: registration lookup and resolver call isolation; input vector 19.
     * @tc.type Function
     * @tc.level Level1
     */
    it('TypeCatalogTest_case_019', 0, () => {
      const type = "test.registry-keys.18";
      const resolver = new RecordingResolver();
      const model = makeModel(type, makePayload("${notExecuted}", "50%", 18));
      registry.registerCard(type, resolver);
      expect(registry.getCardResolver(type) === resolver).assertTrue();
      expect(resolver.calls).assertEqual(0);
      const resolved = registry.getCardResolver(type)!;
      const calls = 3;
      const ids: string[] = [];
      for (let index = 0; index < calls; index++) {
        const card = resolved.createData(model);
        expect(card.type).assertEqual(type);
        expect(card.data === model.data).assertTrue();
        expect(card.opt('item').title.name).assertEqual("${notExecuted}");
        expect(ids.indexOf(card.getObjectId())).assertEqual(-1);
        ids.push(card.getObjectId());
      }
      expect(resolver.calls).assertEqual(calls);
      expect(resolver.models.length).assertEqual(calls);
      expect(resolver.models[0] === model).assertTrue();
      expect(registry.getCardResolver(type + ':absent')).assertUndefined();
    });

    /**
     * @tc.name TypeCatalogTest_case_020
     * @tc.desc registry-keys: registration lookup and resolver call isolation; input vector 20.
     * @tc.type Function
     * @tc.level Level1
     */
    it('TypeCatalogTest_case_020', 0, () => {
      const type = "test.registry-keys.19";
      const resolver = new RecordingResolver();
      const model = makeModel(type, makePayload("__proto__", "1%", 19));
      registry.registerCard(type, resolver);
      expect(registry.getCardResolver(type) === resolver).assertTrue();
      expect(resolver.calls).assertEqual(0);
      const resolved = registry.getCardResolver(type)!;
      const calls = 4;
      const ids: string[] = [];
      for (let index = 0; index < calls; index++) {
        const card = resolved.createData(model);
        expect(card.type).assertEqual(type);
        expect(card.data === model.data).assertTrue();
        expect(card.opt('item').title.name).assertEqual("__proto__");
        expect(ids.indexOf(card.getObjectId())).assertEqual(-1);
        ids.push(card.getObjectId());
      }
      expect(resolver.calls).assertEqual(calls);
      expect(resolver.models.length).assertEqual(calls);
      expect(resolver.models[0] === model).assertTrue();
      expect(registry.getCardResolver(type + ':absent')).assertUndefined();
    });

    /**
     * @tc.name TypeCatalogTest_case_021
     * @tc.desc registry-keys: registration lookup and resolver call isolation; input vector 21.
     * @tc.type Function
     * @tc.level Level1
     */
    it('TypeCatalogTest_case_021', 0, () => {
      const type = "test.registry-keys.20";
      const resolver = new RecordingResolver();
      const model = makeModel(type, makePayload("constructor", "99%", 20));
      registry.registerCard(type, resolver);
      expect(registry.getCardResolver(type) === resolver).assertTrue();
      expect(resolver.calls).assertEqual(0);
      const resolved = registry.getCardResolver(type)!;
      const calls = 1;
      const ids: string[] = [];
      for (let index = 0; index < calls; index++) {
        const card = resolved.createData(model);
        expect(card.type).assertEqual(type);
        expect(card.data === model.data).assertTrue();
        expect(card.opt('item').title.name).assertEqual("constructor");
        expect(ids.indexOf(card.getObjectId())).assertEqual(-1);
        ids.push(card.getObjectId());
      }
      expect(resolver.calls).assertEqual(calls);
      expect(resolver.models.length).assertEqual(calls);
      expect(resolver.models[0] === model).assertTrue();
      expect(registry.getCardResolver(type + ':absent')).assertUndefined();
    });

    /**
     * @tc.name TypeCatalogTest_case_022
     * @tc.desc registry-keys: registration lookup and resolver call isolation; input vector 22.
     * @tc.type Function
     * @tc.level Level1
     */
    it('TypeCatalogTest_case_022', 0, () => {
      const type = "test.registry-keys.21";
      const resolver = new RecordingResolver();
      const model = makeModel(type, makePayload("null", "75%", 21));
      registry.registerCard(type, resolver);
      expect(registry.getCardResolver(type) === resolver).assertTrue();
      expect(resolver.calls).assertEqual(0);
      const resolved = registry.getCardResolver(type)!;
      const calls = 2;
      const ids: string[] = [];
      for (let index = 0; index < calls; index++) {
        const card = resolved.createData(model);
        expect(card.type).assertEqual(type);
        expect(card.data === model.data).assertTrue();
        expect(card.opt('item').title.name).assertEqual("null");
        expect(ids.indexOf(card.getObjectId())).assertEqual(-1);
        ids.push(card.getObjectId());
      }
      expect(resolver.calls).assertEqual(calls);
      expect(resolver.models.length).assertEqual(calls);
      expect(resolver.models[0] === model).assertTrue();
      expect(registry.getCardResolver(type + ':absent')).assertUndefined();
    });

    /**
     * @tc.name TypeCatalogTest_case_023
     * @tc.desc registry-keys: registration lookup and resolver call isolation; input vector 23.
     * @tc.type Function
     * @tc.level Level1
     */
    it('TypeCatalogTest_case_023', 0, () => {
      const type = "test.registry-keys.22";
      const resolver = new RecordingResolver();
      const model = makeModel(type, makePayload("false", "", 22));
      registry.registerCard(type, resolver);
      expect(registry.getCardResolver(type) === resolver).assertTrue();
      expect(resolver.calls).assertEqual(0);
      const resolved = registry.getCardResolver(type)!;
      const calls = 3;
      const ids: string[] = [];
      for (let index = 0; index < calls; index++) {
        const card = resolved.createData(model);
        expect(card.type).assertEqual(type);
        expect(card.data === model.data).assertTrue();
        expect(card.opt('item').title.name).assertEqual("false");
        expect(ids.indexOf(card.getObjectId())).assertEqual(-1);
        ids.push(card.getObjectId());
      }
      expect(resolver.calls).assertEqual(calls);
      expect(resolver.models.length).assertEqual(calls);
      expect(resolver.models[0] === model).assertTrue();
      expect(registry.getCardResolver(type + ':absent')).assertUndefined();
    });

    /**
     * @tc.name TypeCatalogTest_case_024
     * @tc.desc registry-keys: registration lookup and resolver call isolation; input vector 24.
     * @tc.type Function
     * @tc.level Level1
     */
    it('TypeCatalogTest_case_024', 0, () => {
      const type = "test.registry-keys.23";
      const resolver = new RecordingResolver();
      const model = makeModel(type, makePayload("0", ":{{env(screen-width}}", 23));
      registry.registerCard(type, resolver);
      expect(registry.getCardResolver(type) === resolver).assertTrue();
      expect(resolver.calls).assertEqual(0);
      const resolved = registry.getCardResolver(type)!;
      const calls = 4;
      const ids: string[] = [];
      for (let index = 0; index < calls; index++) {
        const card = resolved.createData(model);
        expect(card.type).assertEqual(type);
        expect(card.data === model.data).assertTrue();
        expect(card.opt('item').title.name).assertEqual("0");
        expect(ids.indexOf(card.getObjectId())).assertEqual(-1);
        ids.push(card.getObjectId());
      }
      expect(resolver.calls).assertEqual(calls);
      expect(resolver.models.length).assertEqual(calls);
      expect(resolver.models[0] === model).assertTrue();
      expect(registry.getCardResolver(type + ':absent')).assertUndefined();
    });

    /**
     * @tc.name TypeCatalogTest_case_025
     * @tc.desc registry-keys: registration lookup and resolver call isolation; input vector 25.
     * @tc.type Function
     * @tc.level Level1
     */
    it('TypeCatalogTest_case_025', 0, () => {
      const type = "test.registry-keys.24";
      const resolver = new RecordingResolver();
      const model = makeModel(type, makePayload("100%", "100%", 24));
      registry.registerCard(type, resolver);
      expect(registry.getCardResolver(type) === resolver).assertTrue();
      expect(resolver.calls).assertEqual(0);
      const resolved = registry.getCardResolver(type)!;
      const calls = 1;
      const ids: string[] = [];
      for (let index = 0; index < calls; index++) {
        const card = resolved.createData(model);
        expect(card.type).assertEqual(type);
        expect(card.data === model.data).assertTrue();
        expect(card.opt('item').title.name).assertEqual("100%");
        expect(ids.indexOf(card.getObjectId())).assertEqual(-1);
        ids.push(card.getObjectId());
      }
      expect(resolver.calls).assertEqual(calls);
      expect(resolver.models.length).assertEqual(calls);
      expect(resolver.models[0] === model).assertTrue();
      expect(registry.getCardResolver(type + ':absent')).assertUndefined();
    });

    /**
     * @tc.name TypeCatalogTest_case_026
     * @tc.desc registry-keys: registration lookup and resolver call isolation; input vector 26.
     * @tc.type Function
     * @tc.level Level1
     */
    it('TypeCatalogTest_case_026', 0, () => {
      const type = "test.registry-keys.25";
      const resolver = new RecordingResolver();
      const model = makeModel(type, makePayload("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA", "0%", 25));
      registry.registerCard(type, resolver);
      expect(registry.getCardResolver(type) === resolver).assertTrue();
      expect(resolver.calls).assertEqual(0);
      const resolved = registry.getCardResolver(type)!;
      const calls = 2;
      const ids: string[] = [];
      for (let index = 0; index < calls; index++) {
        const card = resolved.createData(model);
        expect(card.type).assertEqual(type);
        expect(card.data === model.data).assertTrue();
        expect(card.opt('item').title.name).assertEqual("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA");
        expect(ids.indexOf(card.getObjectId())).assertEqual(-1);
        ids.push(card.getObjectId());
      }
      expect(resolver.calls).assertEqual(calls);
      expect(resolver.models.length).assertEqual(calls);
      expect(resolver.models[0] === model).assertTrue();
      expect(registry.getCardResolver(type + ':absent')).assertUndefined();
    });

    /**
     * @tc.name TypeCatalogTest_case_027
     * @tc.desc registry-keys: registration lookup and resolver call isolation; input vector 27.
     * @tc.type Function
     * @tc.level Level1
     */
    it('TypeCatalogTest_case_027', 0, () => {
      const type = "test.registry-keys.26";
      const resolver = new RecordingResolver();
      const model = makeModel(type, makePayload("\u0000", "50%", 26));
      registry.registerCard(type, resolver);
      expect(registry.getCardResolver(type) === resolver).assertTrue();
      expect(resolver.calls).assertEqual(0);
      const resolved = registry.getCardResolver(type)!;
      const calls = 3;
      const ids: string[] = [];
      for (let index = 0; index < calls; index++) {
        const card = resolved.createData(model);
        expect(card.type).assertEqual(type);
        expect(card.data === model.data).assertTrue();
        expect(card.opt('item').title.name).assertEqual("\u0000");
        expect(ids.indexOf(card.getObjectId())).assertEqual(-1);
        ids.push(card.getObjectId());
      }
      expect(resolver.calls).assertEqual(calls);
      expect(resolver.models.length).assertEqual(calls);
      expect(resolver.models[0] === model).assertTrue();
      expect(registry.getCardResolver(type + ':absent')).assertUndefined();
    });

    /**
     * @tc.name TypeCatalogTest_case_028
     * @tc.desc registry-keys: registration lookup and resolver call isolation; input vector 28.
     * @tc.type Function
     * @tc.level Level1
     */
    it('TypeCatalogTest_case_028', 0, () => {
      const type = "test.registry-keys.27";
      const resolver = new RecordingResolver();
      const model = makeModel(type, makePayload("\u2028", "1%", 27));
      registry.registerCard(type, resolver);
      expect(registry.getCardResolver(type) === resolver).assertTrue();
      expect(resolver.calls).assertEqual(0);
      const resolved = registry.getCardResolver(type)!;
      const calls = 4;
      const ids: string[] = [];
      for (let index = 0; index < calls; index++) {
        const card = resolved.createData(model);
        expect(card.type).assertEqual(type);
        expect(card.data === model.data).assertTrue();
        expect(card.opt('item').title.name).assertEqual("\u2028");
        expect(ids.indexOf(card.getObjectId())).assertEqual(-1);
        ids.push(card.getObjectId());
      }
      expect(resolver.calls).assertEqual(calls);
      expect(resolver.models.length).assertEqual(calls);
      expect(resolver.models[0] === model).assertTrue();
      expect(registry.getCardResolver(type + ':absent')).assertUndefined();
    });

    /**
     * @tc.name TypeCatalogTest_case_029
     * @tc.desc registry-keys: registration lookup and resolver call isolation; input vector 29.
     * @tc.type Function
     * @tc.level Level1
     */
    it('TypeCatalogTest_case_029', 0, () => {
      const type = "test.registry-keys.28";
      const resolver = new RecordingResolver();
      const model = makeModel(type, makePayload("\u2029", "99%", 28));
      registry.registerCard(type, resolver);
      expect(registry.getCardResolver(type) === resolver).assertTrue();
      expect(resolver.calls).assertEqual(0);
      const resolved = registry.getCardResolver(type)!;
      const calls = 1;
      const ids: string[] = [];
      for (let index = 0; index < calls; index++) {
        const card = resolved.createData(model);
        expect(card.type).assertEqual(type);
        expect(card.data === model.data).assertTrue();
        expect(card.opt('item').title.name).assertEqual("\u2029");
        expect(ids.indexOf(card.getObjectId())).assertEqual(-1);
        ids.push(card.getObjectId());
      }
      expect(resolver.calls).assertEqual(calls);
      expect(resolver.models.length).assertEqual(calls);
      expect(resolver.models[0] === model).assertTrue();
      expect(registry.getCardResolver(type + ':absent')).assertUndefined();
    });

    /**
     * @tc.name TypeCatalogTest_case_030
     * @tc.desc registry-keys: registration lookup and resolver call isolation; input vector 30.
     * @tc.type Function
     * @tc.level Level1
     */
    it('TypeCatalogTest_case_030', 0, () => {
      const type = "test.registry-keys.29";
      const resolver = new RecordingResolver();
      const model = makeModel(type, makePayload("\r\n", "75%", 29));
      registry.registerCard(type, resolver);
      expect(registry.getCardResolver(type) === resolver).assertTrue();
      expect(resolver.calls).assertEqual(0);
      const resolved = registry.getCardResolver(type)!;
      const calls = 2;
      const ids: string[] = [];
      for (let index = 0; index < calls; index++) {
        const card = resolved.createData(model);
        expect(card.type).assertEqual(type);
        expect(card.data === model.data).assertTrue();
        expect(card.opt('item').title.name).assertEqual("\r\n");
        expect(ids.indexOf(card.getObjectId())).assertEqual(-1);
        ids.push(card.getObjectId());
      }
      expect(resolver.calls).assertEqual(calls);
      expect(resolver.models.length).assertEqual(calls);
      expect(resolver.models[0] === model).assertTrue();
      expect(registry.getCardResolver(type + ':absent')).assertUndefined();
    });

    /**
     * @tc.name TypeCatalogTest_case_031
     * @tc.desc registry-keys: registration lookup and resolver call isolation; input vector 31.
     * @tc.type Function
     * @tc.level Level1
     */
    it('TypeCatalogTest_case_031', 0, () => {
      const type = "test.registry-keys.30";
      const resolver = new RecordingResolver();
      const model = makeModel(type, makePayload("\ud83d\udc69\u200d\ud83d\udcbb", "", 30));
      registry.registerCard(type, resolver);
      expect(registry.getCardResolver(type) === resolver).assertTrue();
      expect(resolver.calls).assertEqual(0);
      const resolved = registry.getCardResolver(type)!;
      const calls = 3;
      const ids: string[] = [];
      for (let index = 0; index < calls; index++) {
        const card = resolved.createData(model);
        expect(card.type).assertEqual(type);
        expect(card.data === model.data).assertTrue();
        expect(card.opt('item').title.name).assertEqual("\ud83d\udc69\u200d\ud83d\udcbb");
        expect(ids.indexOf(card.getObjectId())).assertEqual(-1);
        ids.push(card.getObjectId());
      }
      expect(resolver.calls).assertEqual(calls);
      expect(resolver.models.length).assertEqual(calls);
      expect(resolver.models[0] === model).assertTrue();
      expect(registry.getCardResolver(type + ':absent')).assertUndefined();
    });

    /**
     * @tc.name TypeCatalogTest_case_032
     * @tc.desc registry-keys: registration lookup and resolver call isolation; input vector 32.
     * @tc.type Function
     * @tc.level Level1
     */
    it('TypeCatalogTest_case_032', 0, () => {
      const type = "test.registry-keys.31";
      const resolver = new RecordingResolver();
      const model = makeModel(type, makePayload("end.", ":{{env(screen-width}}", 31));
      registry.registerCard(type, resolver);
      expect(registry.getCardResolver(type) === resolver).assertTrue();
      expect(resolver.calls).assertEqual(0);
      const resolved = registry.getCardResolver(type)!;
      const calls = 4;
      const ids: string[] = [];
      for (let index = 0; index < calls; index++) {
        const card = resolved.createData(model);
        expect(card.type).assertEqual(type);
        expect(card.data === model.data).assertTrue();
        expect(card.opt('item').title.name).assertEqual("end.");
        expect(ids.indexOf(card.getObjectId())).assertEqual(-1);
        ids.push(card.getObjectId());
      }
      expect(resolver.calls).assertEqual(calls);
      expect(resolver.models.length).assertEqual(calls);
      expect(resolver.models[0] === model).assertTrue();
      expect(registry.getCardResolver(type + ':absent')).assertUndefined();
    });

    /**
     * @tc.name TypeCatalogTest_case_033
     * @tc.desc registry-keys: registration lookup and resolver call isolation; input vector 33.
     * @tc.type Function
     * @tc.level Level1
     */
    it('TypeCatalogTest_case_033', 0, () => {
      const type = "test.registry-keys.32";
      const resolver = new RecordingResolver();
      const model = makeModel(type, makePayload("", "100%", 32));
      registry.registerCard(type, resolver);
      expect(registry.getCardResolver(type) === resolver).assertTrue();
      expect(resolver.calls).assertEqual(0);
      const resolved = registry.getCardResolver(type)!;
      const calls = 1;
      const ids: string[] = [];
      for (let index = 0; index < calls; index++) {
        const card = resolved.createData(model);
        expect(card.type).assertEqual(type);
        expect(card.data === model.data).assertTrue();
        expect(card.opt('item').title.name).assertEqual("");
        expect(ids.indexOf(card.getObjectId())).assertEqual(-1);
        ids.push(card.getObjectId());
      }
      expect(resolver.calls).assertEqual(calls);
      expect(resolver.models.length).assertEqual(calls);
      expect(resolver.models[0] === model).assertTrue();
      expect(registry.getCardResolver(type + ':absent')).assertUndefined();
    });
  });
}
