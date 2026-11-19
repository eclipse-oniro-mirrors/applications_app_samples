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
