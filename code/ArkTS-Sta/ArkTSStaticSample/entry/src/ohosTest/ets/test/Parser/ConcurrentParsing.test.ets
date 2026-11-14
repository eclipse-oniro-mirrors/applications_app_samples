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

// Reference: ets/test/PowerDialog/PowerDialogConcurrency.test.ets
// Original line floor: 522; scenario family: parser-concurrent-groups.
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

export default function ConcurrentParsingTest(): void {
  describe('ConcurrentParsingTest', () => {
    beforeAll(() => {
      logSuite('ConcurrentParsingTest', 'begin');
    });
    beforeEach(async () => {
      // Yield between cases so device watchdog and UI events can be processed.
      await new Promise<void>((resolve) => { setTimeout(resolve, 1); });
    });
    afterAll(() => {
      logSuite('ConcurrentParsingTest', 'end');
    });

    /**
     * @tc.name ConcurrentParsingTest_case_001
     * @tc.desc parser-concurrent-groups: parse real layouts and verify independent expected output; input vector 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ConcurrentParsingTest_case_001', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-concurrent-groups.0";
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
     * @tc.name ConcurrentParsingTest_case_002
     * @tc.desc parser-concurrent-groups: parse real layouts and verify independent expected output; input vector 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ConcurrentParsingTest_case_002', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-concurrent-groups.1";
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
     * @tc.name ConcurrentParsingTest_case_003
     * @tc.desc parser-concurrent-groups: parse real layouts and verify independent expected output; input vector 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ConcurrentParsingTest_case_003', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-concurrent-groups.2";
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
     * @tc.name ConcurrentParsingTest_case_004
     * @tc.desc parser-concurrent-groups: parse real layouts and verify independent expected output; input vector 4.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ConcurrentParsingTest_case_004', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-concurrent-groups.3";
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
     * @tc.name ConcurrentParsingTest_case_005
     * @tc.desc parser-concurrent-groups: parse real layouts and verify independent expected output; input vector 5.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ConcurrentParsingTest_case_005', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-concurrent-groups.4";
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
     * @tc.name ConcurrentParsingTest_case_006
     * @tc.desc parser-concurrent-groups: parse real layouts and verify independent expected output; input vector 6.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ConcurrentParsingTest_case_006', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-concurrent-groups.5";
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
     * @tc.name ConcurrentParsingTest_case_007
     * @tc.desc parser-concurrent-groups: parse real layouts and verify independent expected output; input vector 7.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ConcurrentParsingTest_case_007', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-concurrent-groups.6";
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
     * @tc.name ConcurrentParsingTest_case_008
     * @tc.desc parser-concurrent-groups: parse real layouts and verify independent expected output; input vector 8.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ConcurrentParsingTest_case_008', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-concurrent-groups.7";
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
     * @tc.name ConcurrentParsingTest_case_009
     * @tc.desc parser-concurrent-groups: parse real layouts and verify independent expected output; input vector 9.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ConcurrentParsingTest_case_009', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-concurrent-groups.8";
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
     * @tc.name ConcurrentParsingTest_case_010
     * @tc.desc parser-concurrent-groups: parse real layouts and verify independent expected output; input vector 10.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ConcurrentParsingTest_case_010', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-concurrent-groups.9";
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
     * @tc.name ConcurrentParsingTest_case_011
     * @tc.desc parser-concurrent-groups: parse real layouts and verify independent expected output; input vector 11.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ConcurrentParsingTest_case_011', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-concurrent-groups.10";
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
     * @tc.name ConcurrentParsingTest_case_012
     * @tc.desc parser-concurrent-groups: parse real layouts and verify independent expected output; input vector 12.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ConcurrentParsingTest_case_012', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-concurrent-groups.11";
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
     * @tc.name ConcurrentParsingTest_case_013
     * @tc.desc parser-concurrent-groups: parse real layouts and verify independent expected output; input vector 13.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ConcurrentParsingTest_case_013', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-concurrent-groups.12";
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
     * @tc.name ConcurrentParsingTest_case_014
     * @tc.desc parser-concurrent-groups: parse real layouts and verify independent expected output; input vector 14.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ConcurrentParsingTest_case_014', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-concurrent-groups.13";
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
     * @tc.name ConcurrentParsingTest_case_015
     * @tc.desc parser-concurrent-groups: parse real layouts and verify independent expected output; input vector 15.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ConcurrentParsingTest_case_015', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-concurrent-groups.14";
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
     * @tc.name ConcurrentParsingTest_case_016
     * @tc.desc parser-concurrent-groups: parse real layouts and verify independent expected output; input vector 16.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ConcurrentParsingTest_case_016', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-concurrent-groups.15";
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
     * @tc.name ConcurrentParsingTest_case_017
     * @tc.desc parser-concurrent-groups: parse real layouts and verify independent expected output; input vector 17.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ConcurrentParsingTest_case_017', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-concurrent-groups.16";
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
     * @tc.name ConcurrentParsingTest_case_018
     * @tc.desc parser-concurrent-groups: parse real layouts and verify independent expected output; input vector 18.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ConcurrentParsingTest_case_018', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-concurrent-groups.17";
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
  });
}
