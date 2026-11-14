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

// Reference: ets/test/PowerValidation/PowerOfflineNetwork.test.ets
// Original line floor: 884; scenario family: parser-unknown.
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

export default function UnknownTypesTest(): void {
  describe('UnknownTypesTest', () => {
    beforeAll(() => {
      logSuite('UnknownTypesTest', 'begin');
    });
    beforeEach(async () => {
      // Yield between cases so device watchdog and UI events can be processed.
      await new Promise<void>((resolve) => { setTimeout(resolve, 1); });
    });
    afterAll(() => {
      logSuite('UnknownTypesTest', 'end');
    });

    /**
     * @tc.name UnknownTypesTest_case_001
     * @tc.desc parser-unknown: parse real layouts and verify independent expected output; input vector 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('UnknownTypesTest_case_001', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-unknown.0";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const unknown = type + ':unregistered';
      expect(registry.getCardResolver(unknown)).assertUndefined();
      const missing = makeGroup(unknown, 2, 'ignored');
      const known = makeGroup(type, 1, "parser-unknown:0");
      const ignoredBefore = JSON.stringify(missing);
      const source = await parser.parse([missing]);
      expect(source.totalCount()).assertEqual(0);
      expect(resolver.calls).assertEqual(0);
      expect(JSON.stringify(missing)).assertEqual(ignoredBefore);
      const next = await parser.parse([makeGroup(type, 1, 'next')]);
      expect(next.totalCount()).assertEqual(1);
      expect(next.getData(0).opt('item').title.name).assertEqual('next:0');
      expect(next === source).assertFalse();
      expect(registry.getCardResolver(unknown)).assertUndefined();
    });

    /**
     * @tc.name UnknownTypesTest_case_002
     * @tc.desc parser-unknown: parse real layouts and verify independent expected output; input vector 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('UnknownTypesTest_case_002', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-unknown.1";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const unknown = type + ':unregistered';
      expect(registry.getCardResolver(unknown)).assertUndefined();
      const missing = makeGroup(unknown, 3, 'ignored');
      const known = makeGroup(type, 2, "parser-unknown:1");
      const ignoredBefore = JSON.stringify(missing);
      const source = await parser.parse([missing]);
      expect(source.totalCount()).assertEqual(0);
      expect(resolver.calls).assertEqual(0);
      expect(JSON.stringify(missing)).assertEqual(ignoredBefore);
      const next = await parser.parse([makeGroup(type, 1, 'next')]);
      expect(next.totalCount()).assertEqual(1);
      expect(next.getData(0).opt('item').title.name).assertEqual('next:0');
      expect(next === source).assertFalse();
      expect(registry.getCardResolver(unknown)).assertUndefined();
    });

    /**
     * @tc.name UnknownTypesTest_case_003
     * @tc.desc parser-unknown: parse real layouts and verify independent expected output; input vector 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('UnknownTypesTest_case_003', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-unknown.2";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const unknown = type + ':unregistered';
      expect(registry.getCardResolver(unknown)).assertUndefined();
      const missing = makeGroup(unknown, 4, 'ignored');
      const known = makeGroup(type, 3, "parser-unknown:2");
      const ignoredBefore = JSON.stringify(missing);
      const source = await parser.parse([missing]);
      expect(source.totalCount()).assertEqual(0);
      expect(resolver.calls).assertEqual(0);
      expect(JSON.stringify(missing)).assertEqual(ignoredBefore);
      const next = await parser.parse([makeGroup(type, 1, 'next')]);
      expect(next.totalCount()).assertEqual(1);
      expect(next.getData(0).opt('item').title.name).assertEqual('next:0');
      expect(next === source).assertFalse();
      expect(registry.getCardResolver(unknown)).assertUndefined();
    });

    /**
     * @tc.name UnknownTypesTest_case_004
     * @tc.desc parser-unknown: parse real layouts and verify independent expected output; input vector 4.
     * @tc.type Function
     * @tc.level Level1
     */
    it('UnknownTypesTest_case_004', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-unknown.3";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const unknown = type + ':unregistered';
      expect(registry.getCardResolver(unknown)).assertUndefined();
      const missing = makeGroup(unknown, 5, 'ignored');
      const known = makeGroup(type, 4, "parser-unknown:3");
      const ignoredBefore = JSON.stringify(missing);
      const source = await parser.parse([missing]);
      expect(source.totalCount()).assertEqual(0);
      expect(resolver.calls).assertEqual(0);
      expect(JSON.stringify(missing)).assertEqual(ignoredBefore);
      const next = await parser.parse([makeGroup(type, 1, 'next')]);
      expect(next.totalCount()).assertEqual(1);
      expect(next.getData(0).opt('item').title.name).assertEqual('next:0');
      expect(next === source).assertFalse();
      expect(registry.getCardResolver(unknown)).assertUndefined();
    });

    /**
     * @tc.name UnknownTypesTest_case_005
     * @tc.desc parser-unknown: parse real layouts and verify independent expected output; input vector 5.
     * @tc.type Function
     * @tc.level Level1
     */
    it('UnknownTypesTest_case_005', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-unknown.4";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const unknown = type + ':unregistered';
      expect(registry.getCardResolver(unknown)).assertUndefined();
      const missing = makeGroup(unknown, 6, 'ignored');
      const known = makeGroup(type, 5, "parser-unknown:4");
      const ignoredBefore = JSON.stringify(missing);
      const source = await parser.parse([missing]);
      expect(source.totalCount()).assertEqual(0);
      expect(resolver.calls).assertEqual(0);
      expect(JSON.stringify(missing)).assertEqual(ignoredBefore);
      const next = await parser.parse([makeGroup(type, 1, 'next')]);
      expect(next.totalCount()).assertEqual(1);
      expect(next.getData(0).opt('item').title.name).assertEqual('next:0');
      expect(next === source).assertFalse();
      expect(registry.getCardResolver(unknown)).assertUndefined();
    });

    /**
     * @tc.name UnknownTypesTest_case_006
     * @tc.desc parser-unknown: parse real layouts and verify independent expected output; input vector 6.
     * @tc.type Function
     * @tc.level Level1
     */
    it('UnknownTypesTest_case_006', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-unknown.5";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const unknown = type + ':unregistered';
      expect(registry.getCardResolver(unknown)).assertUndefined();
      const missing = makeGroup(unknown, 2, 'ignored');
      const known = makeGroup(type, 1, "parser-unknown:5");
      const ignoredBefore = JSON.stringify(missing);
      const source = await parser.parse([missing]);
      expect(source.totalCount()).assertEqual(0);
      expect(resolver.calls).assertEqual(0);
      expect(JSON.stringify(missing)).assertEqual(ignoredBefore);
      const next = await parser.parse([makeGroup(type, 1, 'next')]);
      expect(next.totalCount()).assertEqual(1);
      expect(next.getData(0).opt('item').title.name).assertEqual('next:0');
      expect(next === source).assertFalse();
      expect(registry.getCardResolver(unknown)).assertUndefined();
    });

    /**
     * @tc.name UnknownTypesTest_case_007
     * @tc.desc parser-unknown: parse real layouts and verify independent expected output; input vector 7.
     * @tc.type Function
     * @tc.level Level1
     */
    it('UnknownTypesTest_case_007', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-unknown.6";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const unknown = type + ':unregistered';
      expect(registry.getCardResolver(unknown)).assertUndefined();
      const missing = makeGroup(unknown, 3, 'ignored');
      const known = makeGroup(type, 2, "parser-unknown:6");
      const ignoredBefore = JSON.stringify(missing);
      const source = await parser.parse([missing]);
      expect(source.totalCount()).assertEqual(0);
      expect(resolver.calls).assertEqual(0);
      expect(JSON.stringify(missing)).assertEqual(ignoredBefore);
      const next = await parser.parse([makeGroup(type, 1, 'next')]);
      expect(next.totalCount()).assertEqual(1);
      expect(next.getData(0).opt('item').title.name).assertEqual('next:0');
      expect(next === source).assertFalse();
      expect(registry.getCardResolver(unknown)).assertUndefined();
    });

    /**
     * @tc.name UnknownTypesTest_case_008
     * @tc.desc parser-unknown: parse real layouts and verify independent expected output; input vector 8.
     * @tc.type Function
     * @tc.level Level1
     */
    it('UnknownTypesTest_case_008', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-unknown.7";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const unknown = type + ':unregistered';
      expect(registry.getCardResolver(unknown)).assertUndefined();
      const missing = makeGroup(unknown, 4, 'ignored');
      const known = makeGroup(type, 3, "parser-unknown:7");
      const ignoredBefore = JSON.stringify(missing);
      const source = await parser.parse([missing]);
      expect(source.totalCount()).assertEqual(0);
      expect(resolver.calls).assertEqual(0);
      expect(JSON.stringify(missing)).assertEqual(ignoredBefore);
      const next = await parser.parse([makeGroup(type, 1, 'next')]);
      expect(next.totalCount()).assertEqual(1);
      expect(next.getData(0).opt('item').title.name).assertEqual('next:0');
      expect(next === source).assertFalse();
      expect(registry.getCardResolver(unknown)).assertUndefined();
    });

    /**
     * @tc.name UnknownTypesTest_case_009
     * @tc.desc parser-unknown: parse real layouts and verify independent expected output; input vector 9.
     * @tc.type Function
     * @tc.level Level1
     */
    it('UnknownTypesTest_case_009', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-unknown.8";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const unknown = type + ':unregistered';
      expect(registry.getCardResolver(unknown)).assertUndefined();
      const missing = makeGroup(unknown, 5, 'ignored');
      const known = makeGroup(type, 4, "parser-unknown:8");
      const ignoredBefore = JSON.stringify(missing);
      const source = await parser.parse([missing]);
      expect(source.totalCount()).assertEqual(0);
      expect(resolver.calls).assertEqual(0);
      expect(JSON.stringify(missing)).assertEqual(ignoredBefore);
      const next = await parser.parse([makeGroup(type, 1, 'next')]);
      expect(next.totalCount()).assertEqual(1);
      expect(next.getData(0).opt('item').title.name).assertEqual('next:0');
      expect(next === source).assertFalse();
      expect(registry.getCardResolver(unknown)).assertUndefined();
    });

    /**
     * @tc.name UnknownTypesTest_case_010
     * @tc.desc parser-unknown: parse real layouts and verify independent expected output; input vector 10.
     * @tc.type Function
     * @tc.level Level1
     */
    it('UnknownTypesTest_case_010', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-unknown.9";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const unknown = type + ':unregistered';
      expect(registry.getCardResolver(unknown)).assertUndefined();
      const missing = makeGroup(unknown, 6, 'ignored');
      const known = makeGroup(type, 5, "parser-unknown:9");
      const ignoredBefore = JSON.stringify(missing);
      const source = await parser.parse([missing]);
      expect(source.totalCount()).assertEqual(0);
      expect(resolver.calls).assertEqual(0);
      expect(JSON.stringify(missing)).assertEqual(ignoredBefore);
      const next = await parser.parse([makeGroup(type, 1, 'next')]);
      expect(next.totalCount()).assertEqual(1);
      expect(next.getData(0).opt('item').title.name).assertEqual('next:0');
      expect(next === source).assertFalse();
      expect(registry.getCardResolver(unknown)).assertUndefined();
    });

    /**
     * @tc.name UnknownTypesTest_case_011
     * @tc.desc parser-unknown: parse real layouts and verify independent expected output; input vector 11.
     * @tc.type Function
     * @tc.level Level1
     */
    it('UnknownTypesTest_case_011', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-unknown.10";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const unknown = type + ':unregistered';
      expect(registry.getCardResolver(unknown)).assertUndefined();
      const missing = makeGroup(unknown, 2, 'ignored');
      const known = makeGroup(type, 1, "parser-unknown:10");
      const ignoredBefore = JSON.stringify(missing);
      const source = await parser.parse([missing]);
      expect(source.totalCount()).assertEqual(0);
      expect(resolver.calls).assertEqual(0);
      expect(JSON.stringify(missing)).assertEqual(ignoredBefore);
      const next = await parser.parse([makeGroup(type, 1, 'next')]);
      expect(next.totalCount()).assertEqual(1);
      expect(next.getData(0).opt('item').title.name).assertEqual('next:0');
      expect(next === source).assertFalse();
      expect(registry.getCardResolver(unknown)).assertUndefined();
    });

    /**
     * @tc.name UnknownTypesTest_case_012
     * @tc.desc parser-unknown: parse real layouts and verify independent expected output; input vector 12.
     * @tc.type Function
     * @tc.level Level1
     */
    it('UnknownTypesTest_case_012', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-unknown.11";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const unknown = type + ':unregistered';
      expect(registry.getCardResolver(unknown)).assertUndefined();
      const missing = makeGroup(unknown, 3, 'ignored');
      const known = makeGroup(type, 2, "parser-unknown:11");
      const ignoredBefore = JSON.stringify(missing);
      const source = await parser.parse([missing]);
      expect(source.totalCount()).assertEqual(0);
      expect(resolver.calls).assertEqual(0);
      expect(JSON.stringify(missing)).assertEqual(ignoredBefore);
      const next = await parser.parse([makeGroup(type, 1, 'next')]);
      expect(next.totalCount()).assertEqual(1);
      expect(next.getData(0).opt('item').title.name).assertEqual('next:0');
      expect(next === source).assertFalse();
      expect(registry.getCardResolver(unknown)).assertUndefined();
    });

    /**
     * @tc.name UnknownTypesTest_case_013
     * @tc.desc parser-unknown: parse real layouts and verify independent expected output; input vector 13.
     * @tc.type Function
     * @tc.level Level1
     */
    it('UnknownTypesTest_case_013', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-unknown.12";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const unknown = type + ':unregistered';
      expect(registry.getCardResolver(unknown)).assertUndefined();
      const missing = makeGroup(unknown, 4, 'ignored');
      const known = makeGroup(type, 3, "parser-unknown:12");
      const ignoredBefore = JSON.stringify(missing);
      const source = await parser.parse([missing]);
      expect(source.totalCount()).assertEqual(0);
      expect(resolver.calls).assertEqual(0);
      expect(JSON.stringify(missing)).assertEqual(ignoredBefore);
      const next = await parser.parse([makeGroup(type, 1, 'next')]);
      expect(next.totalCount()).assertEqual(1);
      expect(next.getData(0).opt('item').title.name).assertEqual('next:0');
      expect(next === source).assertFalse();
      expect(registry.getCardResolver(unknown)).assertUndefined();
    });

    /**
     * @tc.name UnknownTypesTest_case_014
     * @tc.desc parser-unknown: parse real layouts and verify independent expected output; input vector 14.
     * @tc.type Function
     * @tc.level Level1
     */
    it('UnknownTypesTest_case_014', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-unknown.13";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const unknown = type + ':unregistered';
      expect(registry.getCardResolver(unknown)).assertUndefined();
      const missing = makeGroup(unknown, 5, 'ignored');
      const known = makeGroup(type, 4, "parser-unknown:13");
      const ignoredBefore = JSON.stringify(missing);
      const source = await parser.parse([missing]);
      expect(source.totalCount()).assertEqual(0);
      expect(resolver.calls).assertEqual(0);
      expect(JSON.stringify(missing)).assertEqual(ignoredBefore);
      const next = await parser.parse([makeGroup(type, 1, 'next')]);
      expect(next.totalCount()).assertEqual(1);
      expect(next.getData(0).opt('item').title.name).assertEqual('next:0');
      expect(next === source).assertFalse();
      expect(registry.getCardResolver(unknown)).assertUndefined();
    });

    /**
     * @tc.name UnknownTypesTest_case_015
     * @tc.desc parser-unknown: parse real layouts and verify independent expected output; input vector 15.
     * @tc.type Function
     * @tc.level Level1
     */
    it('UnknownTypesTest_case_015', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-unknown.14";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const unknown = type + ':unregistered';
      expect(registry.getCardResolver(unknown)).assertUndefined();
      const missing = makeGroup(unknown, 6, 'ignored');
      const known = makeGroup(type, 5, "parser-unknown:14");
      const ignoredBefore = JSON.stringify(missing);
      const source = await parser.parse([missing]);
      expect(source.totalCount()).assertEqual(0);
      expect(resolver.calls).assertEqual(0);
      expect(JSON.stringify(missing)).assertEqual(ignoredBefore);
      const next = await parser.parse([makeGroup(type, 1, 'next')]);
      expect(next.totalCount()).assertEqual(1);
      expect(next.getData(0).opt('item').title.name).assertEqual('next:0');
      expect(next === source).assertFalse();
      expect(registry.getCardResolver(unknown)).assertUndefined();
    });

    /**
     * @tc.name UnknownTypesTest_case_016
     * @tc.desc parser-unknown: parse real layouts and verify independent expected output; input vector 16.
     * @tc.type Function
     * @tc.level Level1
     */
    it('UnknownTypesTest_case_016', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-unknown.15";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const unknown = type + ':unregistered';
      expect(registry.getCardResolver(unknown)).assertUndefined();
      const missing = makeGroup(unknown, 2, 'ignored');
      const known = makeGroup(type, 1, "parser-unknown:15");
      const ignoredBefore = JSON.stringify(missing);
      const source = await parser.parse([missing]);
      expect(source.totalCount()).assertEqual(0);
      expect(resolver.calls).assertEqual(0);
      expect(JSON.stringify(missing)).assertEqual(ignoredBefore);
      const next = await parser.parse([makeGroup(type, 1, 'next')]);
      expect(next.totalCount()).assertEqual(1);
      expect(next.getData(0).opt('item').title.name).assertEqual('next:0');
      expect(next === source).assertFalse();
      expect(registry.getCardResolver(unknown)).assertUndefined();
    });

    /**
     * @tc.name UnknownTypesTest_case_017
     * @tc.desc parser-unknown: parse real layouts and verify independent expected output; input vector 17.
     * @tc.type Function
     * @tc.level Level1
     */
    it('UnknownTypesTest_case_017', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-unknown.16";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const unknown = type + ':unregistered';
      expect(registry.getCardResolver(unknown)).assertUndefined();
      const missing = makeGroup(unknown, 3, 'ignored');
      const known = makeGroup(type, 2, "parser-unknown:16");
      const ignoredBefore = JSON.stringify(missing);
      const source = await parser.parse([missing]);
      expect(source.totalCount()).assertEqual(0);
      expect(resolver.calls).assertEqual(0);
      expect(JSON.stringify(missing)).assertEqual(ignoredBefore);
      const next = await parser.parse([makeGroup(type, 1, 'next')]);
      expect(next.totalCount()).assertEqual(1);
      expect(next.getData(0).opt('item').title.name).assertEqual('next:0');
      expect(next === source).assertFalse();
      expect(registry.getCardResolver(unknown)).assertUndefined();
    });

    /**
     * @tc.name UnknownTypesTest_case_018
     * @tc.desc parser-unknown: parse real layouts and verify independent expected output; input vector 18.
     * @tc.type Function
     * @tc.level Level1
     */
    it('UnknownTypesTest_case_018', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-unknown.17";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const unknown = type + ':unregistered';
      expect(registry.getCardResolver(unknown)).assertUndefined();
      const missing = makeGroup(unknown, 4, 'ignored');
      const known = makeGroup(type, 3, "parser-unknown:17");
      const ignoredBefore = JSON.stringify(missing);
      const source = await parser.parse([missing]);
      expect(source.totalCount()).assertEqual(0);
      expect(resolver.calls).assertEqual(0);
      expect(JSON.stringify(missing)).assertEqual(ignoredBefore);
      const next = await parser.parse([makeGroup(type, 1, 'next')]);
      expect(next.totalCount()).assertEqual(1);
      expect(next.getData(0).opt('item').title.name).assertEqual('next:0');
      expect(next === source).assertFalse();
      expect(registry.getCardResolver(unknown)).assertUndefined();
    });

    /**
     * @tc.name UnknownTypesTest_case_019
     * @tc.desc parser-unknown: parse real layouts and verify independent expected output; input vector 19.
     * @tc.type Function
     * @tc.level Level1
     */
    it('UnknownTypesTest_case_019', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-unknown.18";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const unknown = type + ':unregistered';
      expect(registry.getCardResolver(unknown)).assertUndefined();
      const missing = makeGroup(unknown, 5, 'ignored');
      const known = makeGroup(type, 4, "parser-unknown:18");
      const ignoredBefore = JSON.stringify(missing);
      const source = await parser.parse([missing]);
      expect(source.totalCount()).assertEqual(0);
      expect(resolver.calls).assertEqual(0);
      expect(JSON.stringify(missing)).assertEqual(ignoredBefore);
      const next = await parser.parse([makeGroup(type, 1, 'next')]);
      expect(next.totalCount()).assertEqual(1);
      expect(next.getData(0).opt('item').title.name).assertEqual('next:0');
      expect(next === source).assertFalse();
      expect(registry.getCardResolver(unknown)).assertUndefined();
    });

    /**
     * @tc.name UnknownTypesTest_case_020
     * @tc.desc parser-unknown: parse real layouts and verify independent expected output; input vector 20.
     * @tc.type Function
     * @tc.level Level1
     */
    it('UnknownTypesTest_case_020', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-unknown.19";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const unknown = type + ':unregistered';
      expect(registry.getCardResolver(unknown)).assertUndefined();
      const missing = makeGroup(unknown, 6, 'ignored');
      const known = makeGroup(type, 5, "parser-unknown:19");
      const ignoredBefore = JSON.stringify(missing);
      const source = await parser.parse([missing]);
      expect(source.totalCount()).assertEqual(0);
      expect(resolver.calls).assertEqual(0);
      expect(JSON.stringify(missing)).assertEqual(ignoredBefore);
      const next = await parser.parse([makeGroup(type, 1, 'next')]);
      expect(next.totalCount()).assertEqual(1);
      expect(next.getData(0).opt('item').title.name).assertEqual('next:0');
      expect(next === source).assertFalse();
      expect(registry.getCardResolver(unknown)).assertUndefined();
    });

    /**
     * @tc.name UnknownTypesTest_case_021
     * @tc.desc parser-unknown: parse real layouts and verify independent expected output; input vector 21.
     * @tc.type Function
     * @tc.level Level1
     */
    it('UnknownTypesTest_case_021', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-unknown.20";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const unknown = type + ':unregistered';
      expect(registry.getCardResolver(unknown)).assertUndefined();
      const missing = makeGroup(unknown, 2, 'ignored');
      const known = makeGroup(type, 1, "parser-unknown:20");
      const ignoredBefore = JSON.stringify(missing);
      const source = await parser.parse([missing]);
      expect(source.totalCount()).assertEqual(0);
      expect(resolver.calls).assertEqual(0);
      expect(JSON.stringify(missing)).assertEqual(ignoredBefore);
      const next = await parser.parse([makeGroup(type, 1, 'next')]);
      expect(next.totalCount()).assertEqual(1);
      expect(next.getData(0).opt('item').title.name).assertEqual('next:0');
      expect(next === source).assertFalse();
      expect(registry.getCardResolver(unknown)).assertUndefined();
    });

    /**
     * @tc.name UnknownTypesTest_case_022
     * @tc.desc parser-unknown: parse real layouts and verify independent expected output; input vector 22.
     * @tc.type Function
     * @tc.level Level1
     */
    it('UnknownTypesTest_case_022', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-unknown.21";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const unknown = type + ':unregistered';
      expect(registry.getCardResolver(unknown)).assertUndefined();
      const missing = makeGroup(unknown, 3, 'ignored');
      const known = makeGroup(type, 2, "parser-unknown:21");
      const ignoredBefore = JSON.stringify(missing);
      const source = await parser.parse([missing]);
      expect(source.totalCount()).assertEqual(0);
      expect(resolver.calls).assertEqual(0);
      expect(JSON.stringify(missing)).assertEqual(ignoredBefore);
      const next = await parser.parse([makeGroup(type, 1, 'next')]);
      expect(next.totalCount()).assertEqual(1);
      expect(next.getData(0).opt('item').title.name).assertEqual('next:0');
      expect(next === source).assertFalse();
      expect(registry.getCardResolver(unknown)).assertUndefined();
    });

    /**
     * @tc.name UnknownTypesTest_case_023
     * @tc.desc parser-unknown: parse real layouts and verify independent expected output; input vector 23.
     * @tc.type Function
     * @tc.level Level1
     */
    it('UnknownTypesTest_case_023', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-unknown.22";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const unknown = type + ':unregistered';
      expect(registry.getCardResolver(unknown)).assertUndefined();
      const missing = makeGroup(unknown, 4, 'ignored');
      const known = makeGroup(type, 3, "parser-unknown:22");
      const ignoredBefore = JSON.stringify(missing);
      const source = await parser.parse([missing]);
      expect(source.totalCount()).assertEqual(0);
      expect(resolver.calls).assertEqual(0);
      expect(JSON.stringify(missing)).assertEqual(ignoredBefore);
      const next = await parser.parse([makeGroup(type, 1, 'next')]);
      expect(next.totalCount()).assertEqual(1);
      expect(next.getData(0).opt('item').title.name).assertEqual('next:0');
      expect(next === source).assertFalse();
      expect(registry.getCardResolver(unknown)).assertUndefined();
    });

    /**
     * @tc.name UnknownTypesTest_case_024
     * @tc.desc parser-unknown: parse real layouts and verify independent expected output; input vector 24.
     * @tc.type Function
     * @tc.level Level1
     */
    it('UnknownTypesTest_case_024', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-unknown.23";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const unknown = type + ':unregistered';
      expect(registry.getCardResolver(unknown)).assertUndefined();
      const missing = makeGroup(unknown, 5, 'ignored');
      const known = makeGroup(type, 4, "parser-unknown:23");
      const ignoredBefore = JSON.stringify(missing);
      const source = await parser.parse([missing]);
      expect(source.totalCount()).assertEqual(0);
      expect(resolver.calls).assertEqual(0);
      expect(JSON.stringify(missing)).assertEqual(ignoredBefore);
      const next = await parser.parse([makeGroup(type, 1, 'next')]);
      expect(next.totalCount()).assertEqual(1);
      expect(next.getData(0).opt('item').title.name).assertEqual('next:0');
      expect(next === source).assertFalse();
      expect(registry.getCardResolver(unknown)).assertUndefined();
    });

    /**
     * @tc.name UnknownTypesTest_case_025
     * @tc.desc parser-unknown: parse real layouts and verify independent expected output; input vector 25.
     * @tc.type Function
     * @tc.level Level1
     */
    it('UnknownTypesTest_case_025', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-unknown.24";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const unknown = type + ':unregistered';
      expect(registry.getCardResolver(unknown)).assertUndefined();
      const missing = makeGroup(unknown, 6, 'ignored');
      const known = makeGroup(type, 5, "parser-unknown:24");
      const ignoredBefore = JSON.stringify(missing);
      const source = await parser.parse([missing]);
      expect(source.totalCount()).assertEqual(0);
      expect(resolver.calls).assertEqual(0);
      expect(JSON.stringify(missing)).assertEqual(ignoredBefore);
      const next = await parser.parse([makeGroup(type, 1, 'next')]);
      expect(next.totalCount()).assertEqual(1);
      expect(next.getData(0).opt('item').title.name).assertEqual('next:0');
      expect(next === source).assertFalse();
      expect(registry.getCardResolver(unknown)).assertUndefined();
    });

    /**
     * @tc.name UnknownTypesTest_case_026
     * @tc.desc parser-unknown: parse real layouts and verify independent expected output; input vector 26.
     * @tc.type Function
     * @tc.level Level1
     */
    it('UnknownTypesTest_case_026', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-unknown.25";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const unknown = type + ':unregistered';
      expect(registry.getCardResolver(unknown)).assertUndefined();
      const missing = makeGroup(unknown, 2, 'ignored');
      const known = makeGroup(type, 1, "parser-unknown:25");
      const ignoredBefore = JSON.stringify(missing);
      const source = await parser.parse([missing]);
      expect(source.totalCount()).assertEqual(0);
      expect(resolver.calls).assertEqual(0);
      expect(JSON.stringify(missing)).assertEqual(ignoredBefore);
      const next = await parser.parse([makeGroup(type, 1, 'next')]);
      expect(next.totalCount()).assertEqual(1);
      expect(next.getData(0).opt('item').title.name).assertEqual('next:0');
      expect(next === source).assertFalse();
      expect(registry.getCardResolver(unknown)).assertUndefined();
    });

    /**
     * @tc.name UnknownTypesTest_case_027
     * @tc.desc parser-unknown: parse real layouts and verify independent expected output; input vector 27.
     * @tc.type Function
     * @tc.level Level1
     */
    it('UnknownTypesTest_case_027', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-unknown.26";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const unknown = type + ':unregistered';
      expect(registry.getCardResolver(unknown)).assertUndefined();
      const missing = makeGroup(unknown, 3, 'ignored');
      const known = makeGroup(type, 2, "parser-unknown:26");
      const ignoredBefore = JSON.stringify(missing);
      const source = await parser.parse([missing]);
      expect(source.totalCount()).assertEqual(0);
      expect(resolver.calls).assertEqual(0);
      expect(JSON.stringify(missing)).assertEqual(ignoredBefore);
      const next = await parser.parse([makeGroup(type, 1, 'next')]);
      expect(next.totalCount()).assertEqual(1);
      expect(next.getData(0).opt('item').title.name).assertEqual('next:0');
      expect(next === source).assertFalse();
      expect(registry.getCardResolver(unknown)).assertUndefined();
    });

    /**
     * @tc.name UnknownTypesTest_case_028
     * @tc.desc parser-unknown: parse real layouts and verify independent expected output; input vector 28.
     * @tc.type Function
     * @tc.level Level1
     */
    it('UnknownTypesTest_case_028', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-unknown.27";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const unknown = type + ':unregistered';
      expect(registry.getCardResolver(unknown)).assertUndefined();
      const missing = makeGroup(unknown, 4, 'ignored');
      const known = makeGroup(type, 3, "parser-unknown:27");
      const ignoredBefore = JSON.stringify(missing);
      const source = await parser.parse([missing]);
      expect(source.totalCount()).assertEqual(0);
      expect(resolver.calls).assertEqual(0);
      expect(JSON.stringify(missing)).assertEqual(ignoredBefore);
      const next = await parser.parse([makeGroup(type, 1, 'next')]);
      expect(next.totalCount()).assertEqual(1);
      expect(next.getData(0).opt('item').title.name).assertEqual('next:0');
      expect(next === source).assertFalse();
      expect(registry.getCardResolver(unknown)).assertUndefined();
    });

    /**
     * @tc.name UnknownTypesTest_case_029
     * @tc.desc parser-unknown: parse real layouts and verify independent expected output; input vector 29.
     * @tc.type Function
     * @tc.level Level1
     */
    it('UnknownTypesTest_case_029', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-unknown.28";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const unknown = type + ':unregistered';
      expect(registry.getCardResolver(unknown)).assertUndefined();
      const missing = makeGroup(unknown, 5, 'ignored');
      const known = makeGroup(type, 4, "parser-unknown:28");
      const ignoredBefore = JSON.stringify(missing);
      const source = await parser.parse([missing]);
      expect(source.totalCount()).assertEqual(0);
      expect(resolver.calls).assertEqual(0);
      expect(JSON.stringify(missing)).assertEqual(ignoredBefore);
      const next = await parser.parse([makeGroup(type, 1, 'next')]);
      expect(next.totalCount()).assertEqual(1);
      expect(next.getData(0).opt('item').title.name).assertEqual('next:0');
      expect(next === source).assertFalse();
      expect(registry.getCardResolver(unknown)).assertUndefined();
    });

    /**
     * @tc.name UnknownTypesTest_case_030
     * @tc.desc parser-unknown: parse real layouts and verify independent expected output; input vector 30.
     * @tc.type Function
     * @tc.level Level1
     */
    it('UnknownTypesTest_case_030', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-unknown.29";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const unknown = type + ':unregistered';
      expect(registry.getCardResolver(unknown)).assertUndefined();
      const missing = makeGroup(unknown, 6, 'ignored');
      const known = makeGroup(type, 5, "parser-unknown:29");
      const ignoredBefore = JSON.stringify(missing);
      const source = await parser.parse([missing]);
      expect(source.totalCount()).assertEqual(0);
      expect(resolver.calls).assertEqual(0);
      expect(JSON.stringify(missing)).assertEqual(ignoredBefore);
      const next = await parser.parse([makeGroup(type, 1, 'next')]);
      expect(next.totalCount()).assertEqual(1);
      expect(next.getData(0).opt('item').title.name).assertEqual('next:0');
      expect(next === source).assertFalse();
      expect(registry.getCardResolver(unknown)).assertUndefined();
    });

    /**
     * @tc.name UnknownTypesTest_case_031
     * @tc.desc parser-unknown: parse real layouts and verify independent expected output; input vector 31.
     * @tc.type Function
     * @tc.level Level1
     */
    it('UnknownTypesTest_case_031', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-unknown.30";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const unknown = type + ':unregistered';
      expect(registry.getCardResolver(unknown)).assertUndefined();
      const missing = makeGroup(unknown, 2, 'ignored');
      const known = makeGroup(type, 1, "parser-unknown:30");
      const ignoredBefore = JSON.stringify(missing);
      const source = await parser.parse([missing]);
      expect(source.totalCount()).assertEqual(0);
      expect(resolver.calls).assertEqual(0);
      expect(JSON.stringify(missing)).assertEqual(ignoredBefore);
      const next = await parser.parse([makeGroup(type, 1, 'next')]);
      expect(next.totalCount()).assertEqual(1);
      expect(next.getData(0).opt('item').title.name).assertEqual('next:0');
      expect(next === source).assertFalse();
      expect(registry.getCardResolver(unknown)).assertUndefined();
    });
  });
}
