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
