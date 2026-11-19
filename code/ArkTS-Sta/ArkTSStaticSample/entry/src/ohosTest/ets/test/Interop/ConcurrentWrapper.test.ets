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
