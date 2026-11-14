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

// Reference: ets/test/PerformanceStability/ConcurrencyControl.test.ets
// Original line floor: 168; scenario family: wrapper-concurrent.
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

export default function ConcurrentWrapperTest(): void {
  describe('ConcurrentWrapperTest', () => {
    beforeAll(() => {
      logSuite('ConcurrentWrapperTest', 'begin');
    });
    beforeEach(async () => {
      // Yield between cases so device watchdog and UI events can be processed.
      await new Promise<void>((resolve) => { setTimeout(resolve, 1); });
    });
    afterAll(() => {
      logSuite('ConcurrentWrapperTest', 'end');
    });

    /**
     * @tc.name ConcurrentWrapperTest_case_001
     * @tc.desc wrapper-concurrent: real wrapper with a controlled native dependency; input vector 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ConcurrentWrapperTest_case_001', 0, async () => {
      await waitForNativeFactory();
      const previousFactory = EtsFactory.factory;
      const nativeParser = new ControlledParser();
      const factory = new ControlledFactory(nativeParser);
      const resolver = new RecordingResolver();
      const type = "test.wrapper-concurrent.0";
      registry.registerCard(type, resolver);
      nativeParser.result = makeSource(type, 0, "wrapper-concurrent:0");
      EtsFactory.factory = factory;
      try {
        const wrapper = new DataParserStaW();
        expect(factory.calls).assertEqual(1);
        const results = await Promise.all([wrapper.parse([]), wrapper.parse('[]')]);
        expect(results.length).assertEqual(2);
        await assertSource(results[0], type, 0, "wrapper-concurrent:0");
        await assertSource(results[1], type, 0, "wrapper-concurrent:0");
        expect(results[0] === results[1]).assertFalse();
        expect(nativeParser.inputs.length).assertEqual(2);
        expect(nativeParser.inputs[0]).assertEqual('[]');
        expect(nativeParser.inputs[1]).assertEqual('[]');
        expect(resolver.calls).assertEqual(0);
        if (0 > 0) {
          expect(results[0].getData(0) === results[1].getData(0)).assertFalse();
        }
      } finally {
        EtsFactory.factory = previousFactory;
      }
      expect(EtsFactory.factory === previousFactory).assertTrue();
    });

    /**
     * @tc.name ConcurrentWrapperTest_case_002
     * @tc.desc wrapper-concurrent: real wrapper with a controlled native dependency; input vector 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ConcurrentWrapperTest_case_002', 0, async () => {
      await waitForNativeFactory();
      const previousFactory = EtsFactory.factory;
      const nativeParser = new ControlledParser();
      const factory = new ControlledFactory(nativeParser);
      const resolver = new RecordingResolver();
      const type = "test.wrapper-concurrent.1";
      registry.registerCard(type, resolver);
      nativeParser.result = makeSource(type, 1, "wrapper-concurrent:1");
      EtsFactory.factory = factory;
      try {
        const wrapper = new DataParserStaW();
        expect(factory.calls).assertEqual(1);
        const results = await Promise.all([wrapper.parse([]), wrapper.parse('[]')]);
        expect(results.length).assertEqual(2);
        await assertSource(results[0], type, 1, "wrapper-concurrent:1");
        await assertSource(results[1], type, 1, "wrapper-concurrent:1");
        expect(results[0] === results[1]).assertFalse();
        expect(nativeParser.inputs.length).assertEqual(2);
        expect(nativeParser.inputs[0]).assertEqual('[]');
        expect(nativeParser.inputs[1]).assertEqual('[]');
        expect(resolver.calls).assertEqual(2);
        if (1 > 0) {
          expect(results[0].getData(0) === results[1].getData(0)).assertFalse();
        }
      } finally {
        EtsFactory.factory = previousFactory;
      }
      expect(EtsFactory.factory === previousFactory).assertTrue();
    });

    /**
     * @tc.name ConcurrentWrapperTest_case_003
     * @tc.desc wrapper-concurrent: real wrapper with a controlled native dependency; input vector 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ConcurrentWrapperTest_case_003', 0, async () => {
      await waitForNativeFactory();
      const previousFactory = EtsFactory.factory;
      const nativeParser = new ControlledParser();
      const factory = new ControlledFactory(nativeParser);
      const resolver = new RecordingResolver();
      const type = "test.wrapper-concurrent.2";
      registry.registerCard(type, resolver);
      nativeParser.result = makeSource(type, 2, "wrapper-concurrent:2");
      EtsFactory.factory = factory;
      try {
        const wrapper = new DataParserStaW();
        expect(factory.calls).assertEqual(1);
        const results = await Promise.all([wrapper.parse([]), wrapper.parse('[]')]);
        expect(results.length).assertEqual(2);
        await assertSource(results[0], type, 2, "wrapper-concurrent:2");
        await assertSource(results[1], type, 2, "wrapper-concurrent:2");
        expect(results[0] === results[1]).assertFalse();
        expect(nativeParser.inputs.length).assertEqual(2);
        expect(nativeParser.inputs[0]).assertEqual('[]');
        expect(nativeParser.inputs[1]).assertEqual('[]');
        expect(resolver.calls).assertEqual(4);
        if (2 > 0) {
          expect(results[0].getData(0) === results[1].getData(0)).assertFalse();
        }
      } finally {
        EtsFactory.factory = previousFactory;
      }
      expect(EtsFactory.factory === previousFactory).assertTrue();
    });
  });
}
