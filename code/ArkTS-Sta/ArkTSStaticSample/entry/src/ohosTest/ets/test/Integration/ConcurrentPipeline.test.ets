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

// Reference: ets/test/Integration/AdvancedScenarios.test.ets
// Original line floor: 230; scenario family: parser-concurrent.
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

export default function ConcurrentPipelineTest(): void {
  describe('ConcurrentPipelineTest', () => {
    beforeAll(() => {
      logSuite('ConcurrentPipelineTest', 'begin');
    });
    beforeEach(async () => {
      // Yield between cases so device watchdog and UI events can be processed.
      await new Promise<void>((resolve) => { setTimeout(resolve, 1); });
    });
    afterAll(() => {
      logSuite('ConcurrentPipelineTest', 'end');
    });

    /**
     * @tc.name ConcurrentPipelineTest_case_001
     * @tc.desc parser-concurrent: parse real layouts and verify independent expected output; input vector 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ConcurrentPipelineTest_case_001', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-concurrent.0";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const firstInput = makeGroup(type, 1, 'first');
      const secondInput = makeGroup(type, 2, 'second');
      const results = await Promise.all([
        parser.parse([firstInput]),
        parser.parse([secondInput])
      ]);
      expect(results.length).assertEqual(2);
      await assertSource(results[0], type, 1, 'first');
      await assertSource(results[1], type, 2, 'second');
      expect(results[0] === results[1]).assertFalse();
      expect(results[0].getData(0).getObjectId() === results[1].getData(0).getObjectId()).assertFalse();
      expect(resolver.calls).assertEqual(3);
      expect(results[0].getData(0).data === firstInput.data[0]).assertTrue();
      expect(results[1].getData(0).data === secondInput.data[0]).assertTrue();
    });

    /**
     * @tc.name ConcurrentPipelineTest_case_002
     * @tc.desc parser-concurrent: parse real layouts and verify independent expected output; input vector 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ConcurrentPipelineTest_case_002', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-concurrent.1";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const firstInput = makeGroup(type, 2, 'first');
      const secondInput = makeGroup(type, 3, 'second');
      const results = await Promise.all([
        parser.parse([firstInput]),
        parser.parse([secondInput])
      ]);
      expect(results.length).assertEqual(2);
      await assertSource(results[0], type, 2, 'first');
      await assertSource(results[1], type, 3, 'second');
      expect(results[0] === results[1]).assertFalse();
      expect(results[0].getData(0).getObjectId() === results[1].getData(0).getObjectId()).assertFalse();
      expect(resolver.calls).assertEqual(5);
      expect(results[0].getData(0).data === firstInput.data[0]).assertTrue();
      expect(results[1].getData(0).data === secondInput.data[0]).assertTrue();
    });

    /**
     * @tc.name ConcurrentPipelineTest_case_003
     * @tc.desc parser-concurrent: parse real layouts and verify independent expected output; input vector 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ConcurrentPipelineTest_case_003', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-concurrent.2";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const firstInput = makeGroup(type, 3, 'first');
      const secondInput = makeGroup(type, 4, 'second');
      const results = await Promise.all([
        parser.parse([firstInput]),
        parser.parse([secondInput])
      ]);
      expect(results.length).assertEqual(2);
      await assertSource(results[0], type, 3, 'first');
      await assertSource(results[1], type, 4, 'second');
      expect(results[0] === results[1]).assertFalse();
      expect(results[0].getData(0).getObjectId() === results[1].getData(0).getObjectId()).assertFalse();
      expect(resolver.calls).assertEqual(7);
      expect(results[0].getData(0).data === firstInput.data[0]).assertTrue();
      expect(results[1].getData(0).data === secondInput.data[0]).assertTrue();
    });

    /**
     * @tc.name ConcurrentPipelineTest_case_004
     * @tc.desc parser-concurrent: parse real layouts and verify independent expected output; input vector 4.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ConcurrentPipelineTest_case_004', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-concurrent.3";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const firstInput = makeGroup(type, 4, 'first');
      const secondInput = makeGroup(type, 5, 'second');
      const results = await Promise.all([
        parser.parse([firstInput]),
        parser.parse([secondInput])
      ]);
      expect(results.length).assertEqual(2);
      await assertSource(results[0], type, 4, 'first');
      await assertSource(results[1], type, 5, 'second');
      expect(results[0] === results[1]).assertFalse();
      expect(results[0].getData(0).getObjectId() === results[1].getData(0).getObjectId()).assertFalse();
      expect(resolver.calls).assertEqual(9);
      expect(results[0].getData(0).data === firstInput.data[0]).assertTrue();
      expect(results[1].getData(0).data === secondInput.data[0]).assertTrue();
    });

    /**
     * @tc.name ConcurrentPipelineTest_case_005
     * @tc.desc parser-concurrent: parse real layouts and verify independent expected output; input vector 5.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ConcurrentPipelineTest_case_005', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-concurrent.4";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const firstInput = makeGroup(type, 5, 'first');
      const secondInput = makeGroup(type, 6, 'second');
      const results = await Promise.all([
        parser.parse([firstInput]),
        parser.parse([secondInput])
      ]);
      expect(results.length).assertEqual(2);
      await assertSource(results[0], type, 5, 'first');
      await assertSource(results[1], type, 6, 'second');
      expect(results[0] === results[1]).assertFalse();
      expect(results[0].getData(0).getObjectId() === results[1].getData(0).getObjectId()).assertFalse();
      expect(resolver.calls).assertEqual(11);
      expect(results[0].getData(0).data === firstInput.data[0]).assertTrue();
      expect(results[1].getData(0).data === secondInput.data[0]).assertTrue();
    });

    /**
     * @tc.name ConcurrentPipelineTest_case_006
     * @tc.desc parser-concurrent: parse real layouts and verify independent expected output; input vector 6.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ConcurrentPipelineTest_case_006', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-concurrent.5";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const firstInput = makeGroup(type, 1, 'first');
      const secondInput = makeGroup(type, 2, 'second');
      const results = await Promise.all([
        parser.parse([firstInput]),
        parser.parse([secondInput])
      ]);
      expect(results.length).assertEqual(2);
      await assertSource(results[0], type, 1, 'first');
      await assertSource(results[1], type, 2, 'second');
      expect(results[0] === results[1]).assertFalse();
      expect(results[0].getData(0).getObjectId() === results[1].getData(0).getObjectId()).assertFalse();
      expect(resolver.calls).assertEqual(3);
      expect(results[0].getData(0).data === firstInput.data[0]).assertTrue();
      expect(results[1].getData(0).data === secondInput.data[0]).assertTrue();
    });

    /**
     * @tc.name ConcurrentPipelineTest_case_007
     * @tc.desc parser-concurrent: parse real layouts and verify independent expected output; input vector 7.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ConcurrentPipelineTest_case_007', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-concurrent.6";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const firstInput = makeGroup(type, 2, 'first');
      const secondInput = makeGroup(type, 3, 'second');
      const results = await Promise.all([
        parser.parse([firstInput]),
        parser.parse([secondInput])
      ]);
      expect(results.length).assertEqual(2);
      await assertSource(results[0], type, 2, 'first');
      await assertSource(results[1], type, 3, 'second');
      expect(results[0] === results[1]).assertFalse();
      expect(results[0].getData(0).getObjectId() === results[1].getData(0).getObjectId()).assertFalse();
      expect(resolver.calls).assertEqual(5);
      expect(results[0].getData(0).data === firstInput.data[0]).assertTrue();
      expect(results[1].getData(0).data === secondInput.data[0]).assertTrue();
    });
  });
}
