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

// Reference: ets/test/Integration/SystemIntegration.test.ets
// Original line floor: 374; scenario family: native.
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
import { DataParser as PublicParser } from 'library';
import deviceInfo from '@ohos.deviceInfo';

export default function StaticPipelineTest(): void {
  describe('StaticPipelineTest', () => {
    beforeAll(() => {
      logSuite('StaticPipelineTest', 'begin');
    });
    beforeEach(async () => {
      // Yield between cases so device watchdog and UI events can be processed.
      await new Promise<void>((resolve) => { setTimeout(resolve, 1); });
    });
    afterAll(() => {
      logSuite('StaticPipelineTest', 'end');
    });

    /**
     * @tc.name StaticPipelineTest_case_001
     * @tc.desc native: exercise real taskpool parsing and static-to-dynamic conversion; input vector 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('StaticPipelineTest_case_001', 0, async () => {
      await waitForNativeFactory();
      const type = "test.native.0";
      const resolver = new CardResolver();
      registry.registerCard(type, resolver);
      const input = makeGroup(type, 1, "native:0");
      const parser = new PublicParser();
      const source = await parser.parse([input]);
      expect(source.totalCount()).assertEqual(1);
      for (let index = 0; index < 1; index++) {
        const card = source.getData(index);
        expect(card instanceof TextCardData).assertTrue();
        expect(card.type).assertEqual(type);
        expect(card.opt('item').title.name).assertEqual("native:0" + ':' + index);
        expect(card.opt('sequence')).assertEqual(index);
      }
      assertUniqueIds(source);
      expect(source.getData(source.totalCount())).assertUndefined();
    });

    /**
     * @tc.name StaticPipelineTest_case_002
     * @tc.desc native: exercise real taskpool parsing and static-to-dynamic conversion; input vector 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('StaticPipelineTest_case_002', 0, async () => {
      await waitForNativeFactory();
      const type = "test.native.1";
      const resolver = new CardResolver();
      registry.registerCard(type, resolver);
      const input = makeGroup(type, 2, "native:1");
      const parser = new PublicParser();
      const source = await parser.parse(JSON.stringify([input]));
      expect(source.totalCount()).assertEqual(2);
      for (let index = 0; index < 2; index++) {
        const card = source.getData(index);
        expect(card instanceof TextCardData).assertTrue();
        expect(card.type).assertEqual(type);
        expect(card.opt('item').title.name).assertEqual("native:1" + ':' + index);
        expect(card.opt('sequence')).assertEqual(index);
      }
      assertUniqueIds(source);
      expect(source.getData(source.totalCount())).assertUndefined();
    });

    /**
     * @tc.name StaticPipelineTest_case_003
     * @tc.desc native: exercise real taskpool parsing and static-to-dynamic conversion; input vector 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('StaticPipelineTest_case_003', 0, async () => {
      await waitForNativeFactory();
      const type = "test.native.2";
      const resolver = new CardResolver();
      registry.registerCard(type, resolver);
      const input = makeGroup(type, 3, "native:2");
      const parser = new PublicParser();
      const source = await parser.parse([input]);
      expect(source.totalCount()).assertEqual(3);
      for (let index = 0; index < 3; index++) {
        const card = source.getData(index);
        expect(card instanceof TextCardData).assertTrue();
        expect(card.type).assertEqual(type);
        expect(card.opt('item').title.name).assertEqual("native:2" + ':' + index);
        expect(card.opt('sequence')).assertEqual(index);
      }
      assertUniqueIds(source);
      expect(source.getData(source.totalCount())).assertUndefined();
    });

    /**
     * @tc.name StaticPipelineTest_case_004
     * @tc.desc native: exercise real taskpool parsing and static-to-dynamic conversion; input vector 4.
     * @tc.type Function
     * @tc.level Level1
     */
    it('StaticPipelineTest_case_004', 0, async () => {
      await waitForNativeFactory();
      const type = "test.native.3";
      const resolver = new CardResolver();
      registry.registerCard(type, resolver);
      const input = makeGroup(type, 4, "native:3");
      const parser = new PublicParser();
      const source = await parser.parse(JSON.stringify([input]));
      expect(source.totalCount()).assertEqual(4);
      for (let index = 0; index < 4; index++) {
        const card = source.getData(index);
        expect(card instanceof TextCardData).assertTrue();
        expect(card.type).assertEqual(type);
        expect(card.opt('item').title.name).assertEqual("native:3" + ':' + index);
        expect(card.opt('sequence')).assertEqual(index);
      }
      assertUniqueIds(source);
      expect(source.getData(source.totalCount())).assertUndefined();
    });

    /**
     * @tc.name StaticPipelineTest_case_005
     * @tc.desc native: exercise real taskpool parsing and static-to-dynamic conversion; input vector 5.
     * @tc.type Function
     * @tc.level Level1
     */
    it('StaticPipelineTest_case_005', 0, async () => {
      await waitForNativeFactory();
      const type = "test.native.4";
      const resolver = new CardResolver();
      registry.registerCard(type, resolver);
      const input = makeGroup(type, 5, "native:4");
      const parser = new PublicParser();
      const source = await parser.parse([input]);
      expect(source.totalCount()).assertEqual(5);
      for (let index = 0; index < 5; index++) {
        const card = source.getData(index);
        expect(card instanceof TextCardData).assertTrue();
        expect(card.type).assertEqual(type);
        expect(card.opt('item').title.name).assertEqual("native:4" + ':' + index);
        expect(card.opt('sequence')).assertEqual(index);
      }
      assertUniqueIds(source);
      expect(source.getData(source.totalCount())).assertUndefined();
    });

    /**
     * @tc.name StaticPipelineTest_case_006
     * @tc.desc native: exercise real taskpool parsing and static-to-dynamic conversion; input vector 6.
     * @tc.type Function
     * @tc.level Level1
     */
    it('StaticPipelineTest_case_006', 0, async () => {
      await waitForNativeFactory();
      const type = "test.native.5";
      const resolver = new CardResolver();
      registry.registerCard(type, resolver);
      const input = makeGroup(type, 1, "native:5");
      const parser = new PublicParser();
      const source = await parser.parse(JSON.stringify([input]));
      expect(source.totalCount()).assertEqual(1);
      for (let index = 0; index < 1; index++) {
        const card = source.getData(index);
        expect(card instanceof TextCardData).assertTrue();
        expect(card.type).assertEqual(type);
        expect(card.opt('item').title.name).assertEqual("native:5" + ':' + index);
        expect(card.opt('sequence')).assertEqual(index);
      }
      assertUniqueIds(source);
      expect(source.getData(source.totalCount())).assertUndefined();
    });

    /**
     * @tc.name StaticPipelineTest_case_007
     * @tc.desc native: exercise real taskpool parsing and static-to-dynamic conversion; input vector 7.
     * @tc.type Function
     * @tc.level Level1
     */
    it('StaticPipelineTest_case_007', 0, async () => {
      await waitForNativeFactory();
      const type = "test.native.6";
      const resolver = new CardResolver();
      registry.registerCard(type, resolver);
      const input = makeGroup(type, 2, "native:6");
      const parser = new PublicParser();
      const source = await parser.parse([input]);
      expect(source.totalCount()).assertEqual(2);
      for (let index = 0; index < 2; index++) {
        const card = source.getData(index);
        expect(card instanceof TextCardData).assertTrue();
        expect(card.type).assertEqual(type);
        expect(card.opt('item').title.name).assertEqual("native:6" + ':' + index);
        expect(card.opt('sequence')).assertEqual(index);
      }
      assertUniqueIds(source);
      expect(source.getData(source.totalCount())).assertUndefined();
    });

    /**
     * @tc.name StaticPipelineTest_case_008
     * @tc.desc native: exercise real taskpool parsing and static-to-dynamic conversion; input vector 8.
     * @tc.type Function
     * @tc.level Level1
     */
    it('StaticPipelineTest_case_008', 0, async () => {
      await waitForNativeFactory();
      const type = "test.native.7";
      const resolver = new CardResolver();
      registry.registerCard(type, resolver);
      const input = makeGroup(type, 3, "native:7");
      const parser = new PublicParser();
      const source = await parser.parse(JSON.stringify([input]));
      expect(source.totalCount()).assertEqual(3);
      for (let index = 0; index < 3; index++) {
        const card = source.getData(index);
        expect(card instanceof TextCardData).assertTrue();
        expect(card.type).assertEqual(type);
        expect(card.opt('item').title.name).assertEqual("native:7" + ':' + index);
        expect(card.opt('sequence')).assertEqual(index);
      }
      assertUniqueIds(source);
      expect(source.getData(source.totalCount())).assertUndefined();
    });

    /**
     * @tc.name StaticPipelineTest_case_009
     * @tc.desc native: exercise real taskpool parsing and static-to-dynamic conversion; input vector 9.
     * @tc.type Function
     * @tc.level Level1
     */
    it('StaticPipelineTest_case_009', 0, async () => {
      await waitForNativeFactory();
      const type = "test.native.8";
      const resolver = new CardResolver();
      registry.registerCard(type, resolver);
      const input = makeGroup(type, 4, "native:8");
      const parser = new PublicParser();
      const source = await parser.parse([input]);
      expect(source.totalCount()).assertEqual(4);
      for (let index = 0; index < 4; index++) {
        const card = source.getData(index);
        expect(card instanceof TextCardData).assertTrue();
        expect(card.type).assertEqual(type);
        expect(card.opt('item').title.name).assertEqual("native:8" + ':' + index);
        expect(card.opt('sequence')).assertEqual(index);
      }
      assertUniqueIds(source);
      expect(source.getData(source.totalCount())).assertUndefined();
    });

    /**
     * @tc.name StaticPipelineTest_case_010
     * @tc.desc native: exercise real taskpool parsing and static-to-dynamic conversion; input vector 10.
     * @tc.type Function
     * @tc.level Level1
     */
    it('StaticPipelineTest_case_010', 0, async () => {
      await waitForNativeFactory();
      const type = "test.native.9";
      const resolver = new CardResolver();
      registry.registerCard(type, resolver);
      const input = makeGroup(type, 5, "native:9");
      const parser = new PublicParser();
      const source = await parser.parse(JSON.stringify([input]));
      expect(source.totalCount()).assertEqual(5);
      for (let index = 0; index < 5; index++) {
        const card = source.getData(index);
        expect(card instanceof TextCardData).assertTrue();
        expect(card.type).assertEqual(type);
        expect(card.opt('item').title.name).assertEqual("native:9" + ':' + index);
        expect(card.opt('sequence')).assertEqual(index);
      }
      assertUniqueIds(source);
      expect(source.getData(source.totalCount())).assertUndefined();
    });

    /**
     * @tc.name StaticPipelineTest_case_011
     * @tc.desc native: exercise real taskpool parsing and static-to-dynamic conversion; input vector 11.
     * @tc.type Function
     * @tc.level Level1
     */
    it('StaticPipelineTest_case_011', 0, async () => {
      await waitForNativeFactory();
      const type = "test.native.10";
      const resolver = new CardResolver();
      registry.registerCard(type, resolver);
      const input = makeGroup(type, 1, "native:10");
      const parser = new PublicParser();
      const source = await parser.parse([input]);
      expect(source.totalCount()).assertEqual(1);
      for (let index = 0; index < 1; index++) {
        const card = source.getData(index);
        expect(card instanceof TextCardData).assertTrue();
        expect(card.type).assertEqual(type);
        expect(card.opt('item').title.name).assertEqual("native:10" + ':' + index);
        expect(card.opt('sequence')).assertEqual(index);
      }
      assertUniqueIds(source);
      expect(source.getData(source.totalCount())).assertUndefined();
    });

    /**
     * @tc.name StaticPipelineTest_case_012
     * @tc.desc native: exercise real taskpool parsing and static-to-dynamic conversion; input vector 12.
     * @tc.type Function
     * @tc.level Level1
     */
    it('StaticPipelineTest_case_012', 0, async () => {
      await waitForNativeFactory();
      const type = "test.native.11";
      const resolver = new CardResolver();
      registry.registerCard(type, resolver);
      const input = makeGroup(type, 2, "native:11");
      const parser = new PublicParser();
      const source = await parser.parse(JSON.stringify([input]));
      expect(source.totalCount()).assertEqual(2);
      for (let index = 0; index < 2; index++) {
        const card = source.getData(index);
        expect(card instanceof TextCardData).assertTrue();
        expect(card.type).assertEqual(type);
        expect(card.opt('item').title.name).assertEqual("native:11" + ':' + index);
        expect(card.opt('sequence')).assertEqual(index);
      }
      assertUniqueIds(source);
      expect(source.getData(source.totalCount())).assertUndefined();
    });

    /**
     * @tc.name StaticPipelineTest_case_013
     * @tc.desc native: exercise real taskpool parsing and static-to-dynamic conversion; input vector 13.
     * @tc.type Function
     * @tc.level Level1
     */
    it('StaticPipelineTest_case_013', 0, async () => {
      await waitForNativeFactory();
      const type = "test.native.12";
      const resolver = new CardResolver();
      registry.registerCard(type, resolver);
      const input = makeGroup(type, 3, "native:12");
      const parser = new PublicParser();
      const source = await parser.parse([input]);
      expect(source.totalCount()).assertEqual(3);
      for (let index = 0; index < 3; index++) {
        const card = source.getData(index);
        expect(card instanceof TextCardData).assertTrue();
        expect(card.type).assertEqual(type);
        expect(card.opt('item').title.name).assertEqual("native:12" + ':' + index);
        expect(card.opt('sequence')).assertEqual(index);
      }
      assertUniqueIds(source);
      expect(source.getData(source.totalCount())).assertUndefined();
    });
  });
}
