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

// Reference: ets/test/Security/SecurityValidation.test.ets
// Original line floor: 331; scenario family: parser-unknown-mixed.
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

export default function UnknownTypeIsolationTest(): void {
  describe('UnknownTypeIsolationTest', () => {
    beforeAll(() => {
      logSuite('UnknownTypeIsolationTest', 'begin');
    });
    beforeEach(async () => {
      // Yield between cases so device watchdog and UI events can be processed.
      await new Promise<void>((resolve) => { setTimeout(resolve, 1); });
    });
    afterAll(() => {
      logSuite('UnknownTypeIsolationTest', 'end');
    });

    /**
     * @tc.name UnknownTypeIsolationTest_case_001
     * @tc.desc parser-unknown-mixed: parse real layouts and verify independent expected output; input vector 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('UnknownTypeIsolationTest_case_001', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-unknown-mixed.0";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const unknown = type + ':unregistered';
      expect(registry.getCardResolver(unknown)).assertUndefined();
      const missing = makeGroup(unknown, 2, 'ignored');
      const known = makeGroup(type, 1, "parser-unknown-mixed:0");
      const ignoredBefore = JSON.stringify(missing);
      const source = await parser.parse([missing, known, missing]);
      expect(source.totalCount()).assertEqual(1);
      expect(resolver.calls).assertEqual(1);
      expect(JSON.stringify(missing)).assertEqual(ignoredBefore);
      const next = await parser.parse([makeGroup(type, 1, 'next')]);
      expect(next.totalCount()).assertEqual(1);
      expect(next.getData(0).opt('item').title.name).assertEqual('next:0');
      expect(next === source).assertFalse();
      expect(registry.getCardResolver(unknown)).assertUndefined();
    });

    /**
     * @tc.name UnknownTypeIsolationTest_case_002
     * @tc.desc parser-unknown-mixed: parse real layouts and verify independent expected output; input vector 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('UnknownTypeIsolationTest_case_002', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-unknown-mixed.1";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const unknown = type + ':unregistered';
      expect(registry.getCardResolver(unknown)).assertUndefined();
      const missing = makeGroup(unknown, 3, 'ignored');
      const known = makeGroup(type, 2, "parser-unknown-mixed:1");
      const ignoredBefore = JSON.stringify(missing);
      const source = await parser.parse([missing, known, missing]);
      expect(source.totalCount()).assertEqual(2);
      expect(resolver.calls).assertEqual(2);
      expect(JSON.stringify(missing)).assertEqual(ignoredBefore);
      const next = await parser.parse([makeGroup(type, 1, 'next')]);
      expect(next.totalCount()).assertEqual(1);
      expect(next.getData(0).opt('item').title.name).assertEqual('next:0');
      expect(next === source).assertFalse();
      expect(registry.getCardResolver(unknown)).assertUndefined();
    });

    /**
     * @tc.name UnknownTypeIsolationTest_case_003
     * @tc.desc parser-unknown-mixed: parse real layouts and verify independent expected output; input vector 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('UnknownTypeIsolationTest_case_003', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-unknown-mixed.2";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const unknown = type + ':unregistered';
      expect(registry.getCardResolver(unknown)).assertUndefined();
      const missing = makeGroup(unknown, 4, 'ignored');
      const known = makeGroup(type, 3, "parser-unknown-mixed:2");
      const ignoredBefore = JSON.stringify(missing);
      const source = await parser.parse([missing, known, missing]);
      expect(source.totalCount()).assertEqual(3);
      expect(resolver.calls).assertEqual(3);
      expect(JSON.stringify(missing)).assertEqual(ignoredBefore);
      const next = await parser.parse([makeGroup(type, 1, 'next')]);
      expect(next.totalCount()).assertEqual(1);
      expect(next.getData(0).opt('item').title.name).assertEqual('next:0');
      expect(next === source).assertFalse();
      expect(registry.getCardResolver(unknown)).assertUndefined();
    });

    /**
     * @tc.name UnknownTypeIsolationTest_case_004
     * @tc.desc parser-unknown-mixed: parse real layouts and verify independent expected output; input vector 4.
     * @tc.type Function
     * @tc.level Level1
     */
    it('UnknownTypeIsolationTest_case_004', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-unknown-mixed.3";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const unknown = type + ':unregistered';
      expect(registry.getCardResolver(unknown)).assertUndefined();
      const missing = makeGroup(unknown, 5, 'ignored');
      const known = makeGroup(type, 4, "parser-unknown-mixed:3");
      const ignoredBefore = JSON.stringify(missing);
      const source = await parser.parse([missing, known, missing]);
      expect(source.totalCount()).assertEqual(4);
      expect(resolver.calls).assertEqual(4);
      expect(JSON.stringify(missing)).assertEqual(ignoredBefore);
      const next = await parser.parse([makeGroup(type, 1, 'next')]);
      expect(next.totalCount()).assertEqual(1);
      expect(next.getData(0).opt('item').title.name).assertEqual('next:0');
      expect(next === source).assertFalse();
      expect(registry.getCardResolver(unknown)).assertUndefined();
    });

    /**
     * @tc.name UnknownTypeIsolationTest_case_005
     * @tc.desc parser-unknown-mixed: parse real layouts and verify independent expected output; input vector 5.
     * @tc.type Function
     * @tc.level Level1
     */
    it('UnknownTypeIsolationTest_case_005', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-unknown-mixed.4";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const unknown = type + ':unregistered';
      expect(registry.getCardResolver(unknown)).assertUndefined();
      const missing = makeGroup(unknown, 6, 'ignored');
      const known = makeGroup(type, 5, "parser-unknown-mixed:4");
      const ignoredBefore = JSON.stringify(missing);
      const source = await parser.parse([missing, known, missing]);
      expect(source.totalCount()).assertEqual(5);
      expect(resolver.calls).assertEqual(5);
      expect(JSON.stringify(missing)).assertEqual(ignoredBefore);
      const next = await parser.parse([makeGroup(type, 1, 'next')]);
      expect(next.totalCount()).assertEqual(1);
      expect(next.getData(0).opt('item').title.name).assertEqual('next:0');
      expect(next === source).assertFalse();
      expect(registry.getCardResolver(unknown)).assertUndefined();
    });

    /**
     * @tc.name UnknownTypeIsolationTest_case_006
     * @tc.desc parser-unknown-mixed: parse real layouts and verify independent expected output; input vector 6.
     * @tc.type Function
     * @tc.level Level1
     */
    it('UnknownTypeIsolationTest_case_006', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-unknown-mixed.5";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const unknown = type + ':unregistered';
      expect(registry.getCardResolver(unknown)).assertUndefined();
      const missing = makeGroup(unknown, 2, 'ignored');
      const known = makeGroup(type, 1, "parser-unknown-mixed:5");
      const ignoredBefore = JSON.stringify(missing);
      const source = await parser.parse([missing, known, missing]);
      expect(source.totalCount()).assertEqual(1);
      expect(resolver.calls).assertEqual(1);
      expect(JSON.stringify(missing)).assertEqual(ignoredBefore);
      const next = await parser.parse([makeGroup(type, 1, 'next')]);
      expect(next.totalCount()).assertEqual(1);
      expect(next.getData(0).opt('item').title.name).assertEqual('next:0');
      expect(next === source).assertFalse();
      expect(registry.getCardResolver(unknown)).assertUndefined();
    });

    /**
     * @tc.name UnknownTypeIsolationTest_case_007
     * @tc.desc parser-unknown-mixed: parse real layouts and verify independent expected output; input vector 7.
     * @tc.type Function
     * @tc.level Level1
     */
    it('UnknownTypeIsolationTest_case_007', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-unknown-mixed.6";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const unknown = type + ':unregistered';
      expect(registry.getCardResolver(unknown)).assertUndefined();
      const missing = makeGroup(unknown, 3, 'ignored');
      const known = makeGroup(type, 2, "parser-unknown-mixed:6");
      const ignoredBefore = JSON.stringify(missing);
      const source = await parser.parse([missing, known, missing]);
      expect(source.totalCount()).assertEqual(2);
      expect(resolver.calls).assertEqual(2);
      expect(JSON.stringify(missing)).assertEqual(ignoredBefore);
      const next = await parser.parse([makeGroup(type, 1, 'next')]);
      expect(next.totalCount()).assertEqual(1);
      expect(next.getData(0).opt('item').title.name).assertEqual('next:0');
      expect(next === source).assertFalse();
      expect(registry.getCardResolver(unknown)).assertUndefined();
    });

    /**
     * @tc.name UnknownTypeIsolationTest_case_008
     * @tc.desc parser-unknown-mixed: parse real layouts and verify independent expected output; input vector 8.
     * @tc.type Function
     * @tc.level Level1
     */
    it('UnknownTypeIsolationTest_case_008', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-unknown-mixed.7";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const unknown = type + ':unregistered';
      expect(registry.getCardResolver(unknown)).assertUndefined();
      const missing = makeGroup(unknown, 4, 'ignored');
      const known = makeGroup(type, 3, "parser-unknown-mixed:7");
      const ignoredBefore = JSON.stringify(missing);
      const source = await parser.parse([missing, known, missing]);
      expect(source.totalCount()).assertEqual(3);
      expect(resolver.calls).assertEqual(3);
      expect(JSON.stringify(missing)).assertEqual(ignoredBefore);
      const next = await parser.parse([makeGroup(type, 1, 'next')]);
      expect(next.totalCount()).assertEqual(1);
      expect(next.getData(0).opt('item').title.name).assertEqual('next:0');
      expect(next === source).assertFalse();
      expect(registry.getCardResolver(unknown)).assertUndefined();
    });

    /**
     * @tc.name UnknownTypeIsolationTest_case_009
     * @tc.desc parser-unknown-mixed: parse real layouts and verify independent expected output; input vector 9.
     * @tc.type Function
     * @tc.level Level1
     */
    it('UnknownTypeIsolationTest_case_009', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-unknown-mixed.8";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const unknown = type + ':unregistered';
      expect(registry.getCardResolver(unknown)).assertUndefined();
      const missing = makeGroup(unknown, 5, 'ignored');
      const known = makeGroup(type, 4, "parser-unknown-mixed:8");
      const ignoredBefore = JSON.stringify(missing);
      const source = await parser.parse([missing, known, missing]);
      expect(source.totalCount()).assertEqual(4);
      expect(resolver.calls).assertEqual(4);
      expect(JSON.stringify(missing)).assertEqual(ignoredBefore);
      const next = await parser.parse([makeGroup(type, 1, 'next')]);
      expect(next.totalCount()).assertEqual(1);
      expect(next.getData(0).opt('item').title.name).assertEqual('next:0');
      expect(next === source).assertFalse();
      expect(registry.getCardResolver(unknown)).assertUndefined();
    });

    /**
     * @tc.name UnknownTypeIsolationTest_case_010
     * @tc.desc parser-unknown-mixed: parse real layouts and verify independent expected output; input vector 10.
     * @tc.type Function
     * @tc.level Level1
     */
    it('UnknownTypeIsolationTest_case_010', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-unknown-mixed.9";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const unknown = type + ':unregistered';
      expect(registry.getCardResolver(unknown)).assertUndefined();
      const missing = makeGroup(unknown, 6, 'ignored');
      const known = makeGroup(type, 5, "parser-unknown-mixed:9");
      const ignoredBefore = JSON.stringify(missing);
      const source = await parser.parse([missing, known, missing]);
      expect(source.totalCount()).assertEqual(5);
      expect(resolver.calls).assertEqual(5);
      expect(JSON.stringify(missing)).assertEqual(ignoredBefore);
      const next = await parser.parse([makeGroup(type, 1, 'next')]);
      expect(next.totalCount()).assertEqual(1);
      expect(next.getData(0).opt('item').title.name).assertEqual('next:0');
      expect(next === source).assertFalse();
      expect(registry.getCardResolver(unknown)).assertUndefined();
    });

    /**
     * @tc.name UnknownTypeIsolationTest_case_011
     * @tc.desc parser-unknown-mixed: parse real layouts and verify independent expected output; input vector 11.
     * @tc.type Function
     * @tc.level Level1
     */
    it('UnknownTypeIsolationTest_case_011', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-unknown-mixed.10";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const unknown = type + ':unregistered';
      expect(registry.getCardResolver(unknown)).assertUndefined();
      const missing = makeGroup(unknown, 2, 'ignored');
      const known = makeGroup(type, 1, "parser-unknown-mixed:10");
      const ignoredBefore = JSON.stringify(missing);
      const source = await parser.parse([missing, known, missing]);
      expect(source.totalCount()).assertEqual(1);
      expect(resolver.calls).assertEqual(1);
      expect(JSON.stringify(missing)).assertEqual(ignoredBefore);
      const next = await parser.parse([makeGroup(type, 1, 'next')]);
      expect(next.totalCount()).assertEqual(1);
      expect(next.getData(0).opt('item').title.name).assertEqual('next:0');
      expect(next === source).assertFalse();
      expect(registry.getCardResolver(unknown)).assertUndefined();
    });
  });
}
