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

// Reference: ets/test/PowerDialog/PowerOperationFlow.test.ets
// Original line floor: 994; scenario family: parser-flatten.
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

export default function FlatteningTest(): void {
  describe('FlatteningTest', () => {
    beforeAll(() => {
      logSuite('FlatteningTest', 'begin');
    });
    beforeEach(async () => {
      // Yield between cases so device watchdog and UI events can be processed.
      await new Promise<void>((resolve) => { setTimeout(resolve, 1); });
    });
    afterAll(() => {
      logSuite('FlatteningTest', 'end');
    });

    /**
     * @tc.name FlatteningTest_case_001
     * @tc.desc parser-flatten: parse real layouts and verify independent expected output; input vector 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('FlatteningTest_case_001', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-flatten.0";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const first = makeGroup(type, 1, 'first', 0);
      const second = makeGroup(type, 0, 'second', 100);
      const empty = makeGroup(type, 0, 'empty');
      first.data[0].item.title.name = "";
      first.data[0].style.width = "100%";
      const input = [first, empty, second];
      const source = await parser.parse(input);
      expect(source.totalCount()).assertEqual(1);
      expect(resolver.calls).assertEqual(1);
      for (let index = 0; index < 1; index++) {
        const expectedTitle = index === 0 ? "" : 'first:' + index;
        expect(source.getData(index).opt('item').title.name).assertEqual(expectedTitle);
        expect(source.getData(index).opt('sequence')).assertEqual(index);
      }
      for (let index = 0; index < 0; index++) {
        expect(source.getData(1 + index).opt('item').title.name).assertEqual('second:' + index);
        expect(source.getData(1 + index).opt('sequence')).assertEqual(100 + index);
      }
      expect(source.getData(source.totalCount())).assertUndefined();
      assertUniqueIds(source);
    });

    /**
     * @tc.name FlatteningTest_case_002
     * @tc.desc parser-flatten: parse real layouts and verify independent expected output; input vector 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('FlatteningTest_case_002', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-flatten.1";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const first = makeGroup(type, 2, 'first', 0);
      const second = makeGroup(type, 1, 'second', 100);
      const empty = makeGroup(type, 0, 'empty');
      first.data[0].item.title.name = "Card";
      first.data[0].style.width = "0%";
      const input = [first, empty, second];
      const source = await parser.parse(JSON.stringify(input));
      expect(source.totalCount()).assertEqual(3);
      expect(resolver.calls).assertEqual(3);
      for (let index = 0; index < 2; index++) {
        const expectedTitle = index === 0 ? "Card" : 'first:' + index;
        expect(source.getData(index).opt('item').title.name).assertEqual(expectedTitle);
        expect(source.getData(index).opt('sequence')).assertEqual(index);
      }
      for (let index = 0; index < 1; index++) {
        expect(source.getData(2 + index).opt('item').title.name).assertEqual('second:' + index);
        expect(source.getData(2 + index).opt('sequence')).assertEqual(100 + index);
      }
      expect(source.getData(source.totalCount())).assertUndefined();
      assertUniqueIds(source);
    });

    /**
     * @tc.name FlatteningTest_case_003
     * @tc.desc parser-flatten: parse real layouts and verify independent expected output; input vector 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('FlatteningTest_case_003', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-flatten.2";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const first = makeGroup(type, 3, 'first', 0);
      const second = makeGroup(type, 2, 'second', 100);
      const empty = makeGroup(type, 0, 'empty');
      first.data[0].item.title.name = " ";
      first.data[0].style.width = "50%";
      const input = [first, empty, second];
      const source = await parser.parse(input);
      expect(source.totalCount()).assertEqual(5);
      expect(resolver.calls).assertEqual(5);
      for (let index = 0; index < 3; index++) {
        const expectedTitle = index === 0 ? " " : 'first:' + index;
        expect(source.getData(index).opt('item').title.name).assertEqual(expectedTitle);
        expect(source.getData(index).opt('sequence')).assertEqual(index);
      }
      for (let index = 0; index < 2; index++) {
        expect(source.getData(3 + index).opt('item').title.name).assertEqual('second:' + index);
        expect(source.getData(3 + index).opt('sequence')).assertEqual(100 + index);
      }
      expect(source.getData(source.totalCount())).assertUndefined();
      assertUniqueIds(source);
    });

    /**
     * @tc.name FlatteningTest_case_004
     * @tc.desc parser-flatten: parse real layouts and verify independent expected output; input vector 4.
     * @tc.type Function
     * @tc.level Level1
     */
    it('FlatteningTest_case_004', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-flatten.3";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const first = makeGroup(type, 4, 'first', 0);
      const second = makeGroup(type, 3, 'second', 100);
      const empty = makeGroup(type, 0, 'empty');
      first.data[0].item.title.name = "  padded  ";
      first.data[0].style.width = "1%";
      const input = [first, empty, second];
      const source = await parser.parse(JSON.stringify(input));
      expect(source.totalCount()).assertEqual(7);
      expect(resolver.calls).assertEqual(7);
      for (let index = 0; index < 4; index++) {
        const expectedTitle = index === 0 ? "  padded  " : 'first:' + index;
        expect(source.getData(index).opt('item').title.name).assertEqual(expectedTitle);
        expect(source.getData(index).opt('sequence')).assertEqual(index);
      }
      for (let index = 0; index < 3; index++) {
        expect(source.getData(4 + index).opt('item').title.name).assertEqual('second:' + index);
        expect(source.getData(4 + index).opt('sequence')).assertEqual(100 + index);
      }
      expect(source.getData(source.totalCount())).assertUndefined();
      assertUniqueIds(source);
    });

    /**
     * @tc.name FlatteningTest_case_005
     * @tc.desc parser-flatten: parse real layouts and verify independent expected output; input vector 5.
     * @tc.type Function
     * @tc.level Level1
     */
    it('FlatteningTest_case_005', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-flatten.4";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const first = makeGroup(type, 5, 'first', 0);
      const second = makeGroup(type, 0, 'second', 100);
      const empty = makeGroup(type, 0, 'empty');
      first.data[0].item.title.name = "multi word title";
      first.data[0].style.width = "99%";
      const input = [first, empty, second];
      const source = await parser.parse(input);
      expect(source.totalCount()).assertEqual(5);
      expect(resolver.calls).assertEqual(5);
      for (let index = 0; index < 5; index++) {
        const expectedTitle = index === 0 ? "multi word title" : 'first:' + index;
        expect(source.getData(index).opt('item').title.name).assertEqual(expectedTitle);
        expect(source.getData(index).opt('sequence')).assertEqual(index);
      }
      for (let index = 0; index < 0; index++) {
        expect(source.getData(5 + index).opt('item').title.name).assertEqual('second:' + index);
        expect(source.getData(5 + index).opt('sequence')).assertEqual(100 + index);
      }
      expect(source.getData(source.totalCount())).assertUndefined();
      assertUniqueIds(source);
    });

    /**
     * @tc.name FlatteningTest_case_006
     * @tc.desc parser-flatten: parse real layouts and verify independent expected output; input vector 6.
     * @tc.type Function
     * @tc.level Level1
     */
    it('FlatteningTest_case_006', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-flatten.5";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const first = makeGroup(type, 1, 'first', 0);
      const second = makeGroup(type, 1, 'second', 100);
      const empty = makeGroup(type, 0, 'empty');
      first.data[0].item.title.name = "line\nbreak";
      first.data[0].style.width = "75%";
      const input = [first, empty, second];
      const source = await parser.parse(JSON.stringify(input));
      expect(source.totalCount()).assertEqual(2);
      expect(resolver.calls).assertEqual(2);
      for (let index = 0; index < 1; index++) {
        const expectedTitle = index === 0 ? "line\nbreak" : 'first:' + index;
        expect(source.getData(index).opt('item').title.name).assertEqual(expectedTitle);
        expect(source.getData(index).opt('sequence')).assertEqual(index);
      }
      for (let index = 0; index < 1; index++) {
        expect(source.getData(1 + index).opt('item').title.name).assertEqual('second:' + index);
        expect(source.getData(1 + index).opt('sequence')).assertEqual(100 + index);
      }
      expect(source.getData(source.totalCount())).assertUndefined();
      assertUniqueIds(source);
    });

    /**
     * @tc.name FlatteningTest_case_007
     * @tc.desc parser-flatten: parse real layouts and verify independent expected output; input vector 7.
     * @tc.type Function
     * @tc.level Level1
     */
    it('FlatteningTest_case_007', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-flatten.6";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const first = makeGroup(type, 2, 'first', 0);
      const second = makeGroup(type, 2, 'second', 100);
      const empty = makeGroup(type, 0, 'empty');
      first.data[0].item.title.name = "tab\tvalue";
      first.data[0].style.width = "";
      const input = [first, empty, second];
      const source = await parser.parse(input);
      expect(source.totalCount()).assertEqual(4);
      expect(resolver.calls).assertEqual(4);
      for (let index = 0; index < 2; index++) {
        const expectedTitle = index === 0 ? "tab\tvalue" : 'first:' + index;
        expect(source.getData(index).opt('item').title.name).assertEqual(expectedTitle);
        expect(source.getData(index).opt('sequence')).assertEqual(index);
      }
      for (let index = 0; index < 2; index++) {
        expect(source.getData(2 + index).opt('item').title.name).assertEqual('second:' + index);
        expect(source.getData(2 + index).opt('sequence')).assertEqual(100 + index);
      }
      expect(source.getData(source.totalCount())).assertUndefined();
      assertUniqueIds(source);
    });

    /**
     * @tc.name FlatteningTest_case_008
     * @tc.desc parser-flatten: parse real layouts and verify independent expected output; input vector 8.
     * @tc.type Function
     * @tc.level Level1
     */
    it('FlatteningTest_case_008', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-flatten.7";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const first = makeGroup(type, 3, 'first', 0);
      const second = makeGroup(type, 3, 'second', 100);
      const empty = makeGroup(type, 0, 'empty');
      first.data[0].item.title.name = "\u5361\u7247 1";
      first.data[0].style.width = ":{{env(screen-width}}";
      const input = [first, empty, second];
      const source = await parser.parse(JSON.stringify(input));
      expect(source.totalCount()).assertEqual(6);
      expect(resolver.calls).assertEqual(6);
      for (let index = 0; index < 3; index++) {
        const expectedTitle = index === 0 ? "\u5361\u7247 1" : 'first:' + index;
        expect(source.getData(index).opt('item').title.name).assertEqual(expectedTitle);
        expect(source.getData(index).opt('sequence')).assertEqual(index);
      }
      for (let index = 0; index < 3; index++) {
        expect(source.getData(3 + index).opt('item').title.name).assertEqual('second:' + index);
        expect(source.getData(3 + index).opt('sequence')).assertEqual(100 + index);
      }
      expect(source.getData(source.totalCount())).assertUndefined();
      assertUniqueIds(source);
    });

    /**
     * @tc.name FlatteningTest_case_009
     * @tc.desc parser-flatten: parse real layouts and verify independent expected output; input vector 9.
     * @tc.type Function
     * @tc.level Level1
     */
    it('FlatteningTest_case_009', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-flatten.8";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const first = makeGroup(type, 4, 'first', 0);
      const second = makeGroup(type, 0, 'second', 100);
      const empty = makeGroup(type, 0, 'empty');
      first.data[0].item.title.name = "\u5361\u7247 2";
      first.data[0].style.width = "100%";
      const input = [first, empty, second];
      const source = await parser.parse(input);
      expect(source.totalCount()).assertEqual(4);
      expect(resolver.calls).assertEqual(4);
      for (let index = 0; index < 4; index++) {
        const expectedTitle = index === 0 ? "\u5361\u7247 2" : 'first:' + index;
        expect(source.getData(index).opt('item').title.name).assertEqual(expectedTitle);
        expect(source.getData(index).opt('sequence')).assertEqual(index);
      }
      for (let index = 0; index < 0; index++) {
        expect(source.getData(4 + index).opt('item').title.name).assertEqual('second:' + index);
        expect(source.getData(4 + index).opt('sequence')).assertEqual(100 + index);
      }
      expect(source.getData(source.totalCount())).assertUndefined();
      assertUniqueIds(source);
    });

    /**
     * @tc.name FlatteningTest_case_010
     * @tc.desc parser-flatten: parse real layouts and verify independent expected output; input vector 10.
     * @tc.type Function
     * @tc.level Level1
     */
    it('FlatteningTest_case_010', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-flatten.9";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const first = makeGroup(type, 5, 'first', 0);
      const second = makeGroup(type, 1, 'second', 100);
      const empty = makeGroup(type, 0, 'empty');
      first.data[0].item.title.name = "\u5361\u7247 3";
      first.data[0].style.width = "0%";
      const input = [first, empty, second];
      const source = await parser.parse(JSON.stringify(input));
      expect(source.totalCount()).assertEqual(6);
      expect(resolver.calls).assertEqual(6);
      for (let index = 0; index < 5; index++) {
        const expectedTitle = index === 0 ? "\u5361\u7247 3" : 'first:' + index;
        expect(source.getData(index).opt('item').title.name).assertEqual(expectedTitle);
        expect(source.getData(index).opt('sequence')).assertEqual(index);
      }
      for (let index = 0; index < 1; index++) {
        expect(source.getData(5 + index).opt('item').title.name).assertEqual('second:' + index);
        expect(source.getData(5 + index).opt('sequence')).assertEqual(100 + index);
      }
      expect(source.getData(source.totalCount())).assertUndefined();
      assertUniqueIds(source);
    });

    /**
     * @tc.name FlatteningTest_case_011
     * @tc.desc parser-flatten: parse real layouts and verify independent expected output; input vector 11.
     * @tc.type Function
     * @tc.level Level1
     */
    it('FlatteningTest_case_011', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-flatten.10";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const first = makeGroup(type, 1, 'first', 0);
      const second = makeGroup(type, 2, 'second', 100);
      const empty = makeGroup(type, 0, 'empty');
      first.data[0].item.title.name = "\u65e5\u672c\u8a9e";
      first.data[0].style.width = "50%";
      const input = [first, empty, second];
      const source = await parser.parse(input);
      expect(source.totalCount()).assertEqual(3);
      expect(resolver.calls).assertEqual(3);
      for (let index = 0; index < 1; index++) {
        const expectedTitle = index === 0 ? "\u65e5\u672c\u8a9e" : 'first:' + index;
        expect(source.getData(index).opt('item').title.name).assertEqual(expectedTitle);
        expect(source.getData(index).opt('sequence')).assertEqual(index);
      }
      for (let index = 0; index < 2; index++) {
        expect(source.getData(1 + index).opt('item').title.name).assertEqual('second:' + index);
        expect(source.getData(1 + index).opt('sequence')).assertEqual(100 + index);
      }
      expect(source.getData(source.totalCount())).assertUndefined();
      assertUniqueIds(source);
    });

    /**
     * @tc.name FlatteningTest_case_012
     * @tc.desc parser-flatten: parse real layouts and verify independent expected output; input vector 12.
     * @tc.type Function
     * @tc.level Level1
     */
    it('FlatteningTest_case_012', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-flatten.11";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const first = makeGroup(type, 2, 'first', 0);
      const second = makeGroup(type, 3, 'second', 100);
      const empty = makeGroup(type, 0, 'empty');
      first.data[0].item.title.name = "\u0645\u0631\u062d\u0628\u0627";
      first.data[0].style.width = "1%";
      const input = [first, empty, second];
      const source = await parser.parse(JSON.stringify(input));
      expect(source.totalCount()).assertEqual(5);
      expect(resolver.calls).assertEqual(5);
      for (let index = 0; index < 2; index++) {
        const expectedTitle = index === 0 ? "\u0645\u0631\u062d\u0628\u0627" : 'first:' + index;
        expect(source.getData(index).opt('item').title.name).assertEqual(expectedTitle);
        expect(source.getData(index).opt('sequence')).assertEqual(index);
      }
      for (let index = 0; index < 3; index++) {
        expect(source.getData(2 + index).opt('item').title.name).assertEqual('second:' + index);
        expect(source.getData(2 + index).opt('sequence')).assertEqual(100 + index);
      }
      expect(source.getData(source.totalCount())).assertUndefined();
      assertUniqueIds(source);
    });

    /**
     * @tc.name FlatteningTest_case_013
     * @tc.desc parser-flatten: parse real layouts and verify independent expected output; input vector 13.
     * @tc.type Function
     * @tc.level Level1
     */
    it('FlatteningTest_case_013', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-flatten.12";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const first = makeGroup(type, 3, 'first', 0);
      const second = makeGroup(type, 0, 'second', 100);
      const empty = makeGroup(type, 0, 'empty');
      first.data[0].item.title.name = "\u05e9\u05dc\u05d5\u05dd";
      first.data[0].style.width = "99%";
      const input = [first, empty, second];
      const source = await parser.parse(input);
      expect(source.totalCount()).assertEqual(3);
      expect(resolver.calls).assertEqual(3);
      for (let index = 0; index < 3; index++) {
        const expectedTitle = index === 0 ? "\u05e9\u05dc\u05d5\u05dd" : 'first:' + index;
        expect(source.getData(index).opt('item').title.name).assertEqual(expectedTitle);
        expect(source.getData(index).opt('sequence')).assertEqual(index);
      }
      for (let index = 0; index < 0; index++) {
        expect(source.getData(3 + index).opt('item').title.name).assertEqual('second:' + index);
        expect(source.getData(3 + index).opt('sequence')).assertEqual(100 + index);
      }
      expect(source.getData(source.totalCount())).assertUndefined();
      assertUniqueIds(source);
    });

    /**
     * @tc.name FlatteningTest_case_014
     * @tc.desc parser-flatten: parse real layouts and verify independent expected output; input vector 14.
     * @tc.type Function
     * @tc.level Level1
     */
    it('FlatteningTest_case_014', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-flatten.13";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const first = makeGroup(type, 4, 'first', 0);
      const second = makeGroup(type, 1, 'second', 100);
      const empty = makeGroup(type, 0, 'empty');
      first.data[0].item.title.name = "e\u0301";
      first.data[0].style.width = "75%";
      const input = [first, empty, second];
      const source = await parser.parse(JSON.stringify(input));
      expect(source.totalCount()).assertEqual(5);
      expect(resolver.calls).assertEqual(5);
      for (let index = 0; index < 4; index++) {
        const expectedTitle = index === 0 ? "e\u0301" : 'first:' + index;
        expect(source.getData(index).opt('item').title.name).assertEqual(expectedTitle);
        expect(source.getData(index).opt('sequence')).assertEqual(index);
      }
      for (let index = 0; index < 1; index++) {
        expect(source.getData(4 + index).opt('item').title.name).assertEqual('second:' + index);
        expect(source.getData(4 + index).opt('sequence')).assertEqual(100 + index);
      }
      expect(source.getData(source.totalCount())).assertUndefined();
      assertUniqueIds(source);
    });

    /**
     * @tc.name FlatteningTest_case_015
     * @tc.desc parser-flatten: parse real layouts and verify independent expected output; input vector 15.
     * @tc.type Function
     * @tc.level Level1
     */
    it('FlatteningTest_case_015', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-flatten.14";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const first = makeGroup(type, 5, 'first', 0);
      const second = makeGroup(type, 2, 'second', 100);
      const empty = makeGroup(type, 0, 'empty');
      first.data[0].item.title.name = "\u00e9";
      first.data[0].style.width = "";
      const input = [first, empty, second];
      const source = await parser.parse(input);
      expect(source.totalCount()).assertEqual(7);
      expect(resolver.calls).assertEqual(7);
      for (let index = 0; index < 5; index++) {
        const expectedTitle = index === 0 ? "\u00e9" : 'first:' + index;
        expect(source.getData(index).opt('item').title.name).assertEqual(expectedTitle);
        expect(source.getData(index).opt('sequence')).assertEqual(index);
      }
      for (let index = 0; index < 2; index++) {
        expect(source.getData(5 + index).opt('item').title.name).assertEqual('second:' + index);
        expect(source.getData(5 + index).opt('sequence')).assertEqual(100 + index);
      }
      expect(source.getData(source.totalCount())).assertUndefined();
      assertUniqueIds(source);
    });

    /**
     * @tc.name FlatteningTest_case_016
     * @tc.desc parser-flatten: parse real layouts and verify independent expected output; input vector 16.
     * @tc.type Function
     * @tc.level Level1
     */
    it('FlatteningTest_case_016', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-flatten.15";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const first = makeGroup(type, 1, 'first', 0);
      const second = makeGroup(type, 3, 'second', 100);
      const empty = makeGroup(type, 0, 'empty');
      first.data[0].item.title.name = "\ud83d\ude80";
      first.data[0].style.width = ":{{env(screen-width}}";
      const input = [first, empty, second];
      const source = await parser.parse(JSON.stringify(input));
      expect(source.totalCount()).assertEqual(4);
      expect(resolver.calls).assertEqual(4);
      for (let index = 0; index < 1; index++) {
        const expectedTitle = index === 0 ? "\ud83d\ude80" : 'first:' + index;
        expect(source.getData(index).opt('item').title.name).assertEqual(expectedTitle);
        expect(source.getData(index).opt('sequence')).assertEqual(index);
      }
      for (let index = 0; index < 3; index++) {
        expect(source.getData(1 + index).opt('item').title.name).assertEqual('second:' + index);
        expect(source.getData(1 + index).opt('sequence')).assertEqual(100 + index);
      }
      expect(source.getData(source.totalCount())).assertUndefined();
      assertUniqueIds(source);
    });

    /**
     * @tc.name FlatteningTest_case_017
     * @tc.desc parser-flatten: parse real layouts and verify independent expected output; input vector 17.
     * @tc.type Function
     * @tc.level Level1
     */
    it('FlatteningTest_case_017', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-flatten.16";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const first = makeGroup(type, 2, 'first', 0);
      const second = makeGroup(type, 0, 'second', 100);
      const empty = makeGroup(type, 0, 'empty');
      first.data[0].item.title.name = "quote\"slash\\";
      first.data[0].style.width = "100%";
      const input = [first, empty, second];
      const source = await parser.parse(input);
      expect(source.totalCount()).assertEqual(2);
      expect(resolver.calls).assertEqual(2);
      for (let index = 0; index < 2; index++) {
        const expectedTitle = index === 0 ? "quote\"slash\\" : 'first:' + index;
        expect(source.getData(index).opt('item').title.name).assertEqual(expectedTitle);
        expect(source.getData(index).opt('sequence')).assertEqual(index);
      }
      for (let index = 0; index < 0; index++) {
        expect(source.getData(2 + index).opt('item').title.name).assertEqual('second:' + index);
        expect(source.getData(2 + index).opt('sequence')).assertEqual(100 + index);
      }
      expect(source.getData(source.totalCount())).assertUndefined();
      assertUniqueIds(source);
    });

    /**
     * @tc.name FlatteningTest_case_018
     * @tc.desc parser-flatten: parse real layouts and verify independent expected output; input vector 18.
     * @tc.type Function
     * @tc.level Level1
     */
    it('FlatteningTest_case_018', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-flatten.17";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const first = makeGroup(type, 3, 'first', 0);
      const second = makeGroup(type, 1, 'second', 100);
      const empty = makeGroup(type, 0, 'empty');
      first.data[0].item.title.name = "<script>alert(1)</script>";
      first.data[0].style.width = "0%";
      const input = [first, empty, second];
      const source = await parser.parse(JSON.stringify(input));
      expect(source.totalCount()).assertEqual(4);
      expect(resolver.calls).assertEqual(4);
      for (let index = 0; index < 3; index++) {
        const expectedTitle = index === 0 ? "<script>alert(1)</script>" : 'first:' + index;
        expect(source.getData(index).opt('item').title.name).assertEqual(expectedTitle);
        expect(source.getData(index).opt('sequence')).assertEqual(index);
      }
      for (let index = 0; index < 1; index++) {
        expect(source.getData(3 + index).opt('item').title.name).assertEqual('second:' + index);
        expect(source.getData(3 + index).opt('sequence')).assertEqual(100 + index);
      }
      expect(source.getData(source.totalCount())).assertUndefined();
      assertUniqueIds(source);
    });

    /**
     * @tc.name FlatteningTest_case_019
     * @tc.desc parser-flatten: parse real layouts and verify independent expected output; input vector 19.
     * @tc.type Function
     * @tc.level Level1
     */
    it('FlatteningTest_case_019', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-flatten.18";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const first = makeGroup(type, 4, 'first', 0);
      const second = makeGroup(type, 2, 'second', 100);
      const empty = makeGroup(type, 0, 'empty');
      first.data[0].item.title.name = "${notExecuted}";
      first.data[0].style.width = "50%";
      const input = [first, empty, second];
      const source = await parser.parse(input);
      expect(source.totalCount()).assertEqual(6);
      expect(resolver.calls).assertEqual(6);
      for (let index = 0; index < 4; index++) {
        const expectedTitle = index === 0 ? "${notExecuted}" : 'first:' + index;
        expect(source.getData(index).opt('item').title.name).assertEqual(expectedTitle);
        expect(source.getData(index).opt('sequence')).assertEqual(index);
      }
      for (let index = 0; index < 2; index++) {
        expect(source.getData(4 + index).opt('item').title.name).assertEqual('second:' + index);
        expect(source.getData(4 + index).opt('sequence')).assertEqual(100 + index);
      }
      expect(source.getData(source.totalCount())).assertUndefined();
      assertUniqueIds(source);
    });

    /**
     * @tc.name FlatteningTest_case_020
     * @tc.desc parser-flatten: parse real layouts and verify independent expected output; input vector 20.
     * @tc.type Function
     * @tc.level Level1
     */
    it('FlatteningTest_case_020', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-flatten.19";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const first = makeGroup(type, 5, 'first', 0);
      const second = makeGroup(type, 3, 'second', 100);
      const empty = makeGroup(type, 0, 'empty');
      first.data[0].item.title.name = "__proto__";
      first.data[0].style.width = "1%";
      const input = [first, empty, second];
      const source = await parser.parse(JSON.stringify(input));
      expect(source.totalCount()).assertEqual(8);
      expect(resolver.calls).assertEqual(8);
      for (let index = 0; index < 5; index++) {
        const expectedTitle = index === 0 ? "__proto__" : 'first:' + index;
        expect(source.getData(index).opt('item').title.name).assertEqual(expectedTitle);
        expect(source.getData(index).opt('sequence')).assertEqual(index);
      }
      for (let index = 0; index < 3; index++) {
        expect(source.getData(5 + index).opt('item').title.name).assertEqual('second:' + index);
        expect(source.getData(5 + index).opt('sequence')).assertEqual(100 + index);
      }
      expect(source.getData(source.totalCount())).assertUndefined();
      assertUniqueIds(source);
    });

    /**
     * @tc.name FlatteningTest_case_021
     * @tc.desc parser-flatten: parse real layouts and verify independent expected output; input vector 21.
     * @tc.type Function
     * @tc.level Level1
     */
    it('FlatteningTest_case_021', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-flatten.20";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const first = makeGroup(type, 1, 'first', 0);
      const second = makeGroup(type, 0, 'second', 100);
      const empty = makeGroup(type, 0, 'empty');
      first.data[0].item.title.name = "constructor";
      first.data[0].style.width = "99%";
      const input = [first, empty, second];
      const source = await parser.parse(input);
      expect(source.totalCount()).assertEqual(1);
      expect(resolver.calls).assertEqual(1);
      for (let index = 0; index < 1; index++) {
        const expectedTitle = index === 0 ? "constructor" : 'first:' + index;
        expect(source.getData(index).opt('item').title.name).assertEqual(expectedTitle);
        expect(source.getData(index).opt('sequence')).assertEqual(index);
      }
      for (let index = 0; index < 0; index++) {
        expect(source.getData(1 + index).opt('item').title.name).assertEqual('second:' + index);
        expect(source.getData(1 + index).opt('sequence')).assertEqual(100 + index);
      }
      expect(source.getData(source.totalCount())).assertUndefined();
      assertUniqueIds(source);
    });

    /**
     * @tc.name FlatteningTest_case_022
     * @tc.desc parser-flatten: parse real layouts and verify independent expected output; input vector 22.
     * @tc.type Function
     * @tc.level Level1
     */
    it('FlatteningTest_case_022', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-flatten.21";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const first = makeGroup(type, 2, 'first', 0);
      const second = makeGroup(type, 1, 'second', 100);
      const empty = makeGroup(type, 0, 'empty');
      first.data[0].item.title.name = "null";
      first.data[0].style.width = "75%";
      const input = [first, empty, second];
      const source = await parser.parse(JSON.stringify(input));
      expect(source.totalCount()).assertEqual(3);
      expect(resolver.calls).assertEqual(3);
      for (let index = 0; index < 2; index++) {
        const expectedTitle = index === 0 ? "null" : 'first:' + index;
        expect(source.getData(index).opt('item').title.name).assertEqual(expectedTitle);
        expect(source.getData(index).opt('sequence')).assertEqual(index);
      }
      for (let index = 0; index < 1; index++) {
        expect(source.getData(2 + index).opt('item').title.name).assertEqual('second:' + index);
        expect(source.getData(2 + index).opt('sequence')).assertEqual(100 + index);
      }
      expect(source.getData(source.totalCount())).assertUndefined();
      assertUniqueIds(source);
    });

    /**
     * @tc.name FlatteningTest_case_023
     * @tc.desc parser-flatten: parse real layouts and verify independent expected output; input vector 23.
     * @tc.type Function
     * @tc.level Level1
     */
    it('FlatteningTest_case_023', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-flatten.22";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const first = makeGroup(type, 3, 'first', 0);
      const second = makeGroup(type, 2, 'second', 100);
      const empty = makeGroup(type, 0, 'empty');
      first.data[0].item.title.name = "false";
      first.data[0].style.width = "";
      const input = [first, empty, second];
      const source = await parser.parse(input);
      expect(source.totalCount()).assertEqual(5);
      expect(resolver.calls).assertEqual(5);
      for (let index = 0; index < 3; index++) {
        const expectedTitle = index === 0 ? "false" : 'first:' + index;
        expect(source.getData(index).opt('item').title.name).assertEqual(expectedTitle);
        expect(source.getData(index).opt('sequence')).assertEqual(index);
      }
      for (let index = 0; index < 2; index++) {
        expect(source.getData(3 + index).opt('item').title.name).assertEqual('second:' + index);
        expect(source.getData(3 + index).opt('sequence')).assertEqual(100 + index);
      }
      expect(source.getData(source.totalCount())).assertUndefined();
      assertUniqueIds(source);
    });

    /**
     * @tc.name FlatteningTest_case_024
     * @tc.desc parser-flatten: parse real layouts and verify independent expected output; input vector 24.
     * @tc.type Function
     * @tc.level Level1
     */
    it('FlatteningTest_case_024', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-flatten.23";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const first = makeGroup(type, 4, 'first', 0);
      const second = makeGroup(type, 3, 'second', 100);
      const empty = makeGroup(type, 0, 'empty');
      first.data[0].item.title.name = "0";
      first.data[0].style.width = ":{{env(screen-width}}";
      const input = [first, empty, second];
      const source = await parser.parse(JSON.stringify(input));
      expect(source.totalCount()).assertEqual(7);
      expect(resolver.calls).assertEqual(7);
      for (let index = 0; index < 4; index++) {
        const expectedTitle = index === 0 ? "0" : 'first:' + index;
        expect(source.getData(index).opt('item').title.name).assertEqual(expectedTitle);
        expect(source.getData(index).opt('sequence')).assertEqual(index);
      }
      for (let index = 0; index < 3; index++) {
        expect(source.getData(4 + index).opt('item').title.name).assertEqual('second:' + index);
        expect(source.getData(4 + index).opt('sequence')).assertEqual(100 + index);
      }
      expect(source.getData(source.totalCount())).assertUndefined();
      assertUniqueIds(source);
    });

    /**
     * @tc.name FlatteningTest_case_025
     * @tc.desc parser-flatten: parse real layouts and verify independent expected output; input vector 25.
     * @tc.type Function
     * @tc.level Level1
     */
    it('FlatteningTest_case_025', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-flatten.24";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const first = makeGroup(type, 5, 'first', 0);
      const second = makeGroup(type, 0, 'second', 100);
      const empty = makeGroup(type, 0, 'empty');
      first.data[0].item.title.name = "100%";
      first.data[0].style.width = "100%";
      const input = [first, empty, second];
      const source = await parser.parse(input);
      expect(source.totalCount()).assertEqual(5);
      expect(resolver.calls).assertEqual(5);
      for (let index = 0; index < 5; index++) {
        const expectedTitle = index === 0 ? "100%" : 'first:' + index;
        expect(source.getData(index).opt('item').title.name).assertEqual(expectedTitle);
        expect(source.getData(index).opt('sequence')).assertEqual(index);
      }
      for (let index = 0; index < 0; index++) {
        expect(source.getData(5 + index).opt('item').title.name).assertEqual('second:' + index);
        expect(source.getData(5 + index).opt('sequence')).assertEqual(100 + index);
      }
      expect(source.getData(source.totalCount())).assertUndefined();
      assertUniqueIds(source);
    });

    /**
     * @tc.name FlatteningTest_case_026
     * @tc.desc parser-flatten: parse real layouts and verify independent expected output; input vector 26.
     * @tc.type Function
     * @tc.level Level1
     */
    it('FlatteningTest_case_026', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-flatten.25";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const first = makeGroup(type, 1, 'first', 0);
      const second = makeGroup(type, 1, 'second', 100);
      const empty = makeGroup(type, 0, 'empty');
      first.data[0].item.title.name = "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA";
      first.data[0].style.width = "0%";
      const input = [first, empty, second];
      const source = await parser.parse(JSON.stringify(input));
      expect(source.totalCount()).assertEqual(2);
      expect(resolver.calls).assertEqual(2);
      for (let index = 0; index < 1; index++) {
        const expectedTitle = index === 0 ? "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA" : 'first:' + index;
        expect(source.getData(index).opt('item').title.name).assertEqual(expectedTitle);
        expect(source.getData(index).opt('sequence')).assertEqual(index);
      }
      for (let index = 0; index < 1; index++) {
        expect(source.getData(1 + index).opt('item').title.name).assertEqual('second:' + index);
        expect(source.getData(1 + index).opt('sequence')).assertEqual(100 + index);
      }
      expect(source.getData(source.totalCount())).assertUndefined();
      assertUniqueIds(source);
    });

    /**
     * @tc.name FlatteningTest_case_027
     * @tc.desc parser-flatten: parse real layouts and verify independent expected output; input vector 27.
     * @tc.type Function
     * @tc.level Level1
     */
    it('FlatteningTest_case_027', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-flatten.26";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const first = makeGroup(type, 2, 'first', 0);
      const second = makeGroup(type, 2, 'second', 100);
      const empty = makeGroup(type, 0, 'empty');
      first.data[0].item.title.name = "\u0000";
      first.data[0].style.width = "50%";
      const input = [first, empty, second];
      const source = await parser.parse(input);
      expect(source.totalCount()).assertEqual(4);
      expect(resolver.calls).assertEqual(4);
      for (let index = 0; index < 2; index++) {
        const expectedTitle = index === 0 ? "\u0000" : 'first:' + index;
        expect(source.getData(index).opt('item').title.name).assertEqual(expectedTitle);
        expect(source.getData(index).opt('sequence')).assertEqual(index);
      }
      for (let index = 0; index < 2; index++) {
        expect(source.getData(2 + index).opt('item').title.name).assertEqual('second:' + index);
        expect(source.getData(2 + index).opt('sequence')).assertEqual(100 + index);
      }
      expect(source.getData(source.totalCount())).assertUndefined();
      assertUniqueIds(source);
    });

    /**
     * @tc.name FlatteningTest_case_028
     * @tc.desc parser-flatten: parse real layouts and verify independent expected output; input vector 28.
     * @tc.type Function
     * @tc.level Level1
     */
    it('FlatteningTest_case_028', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-flatten.27";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const first = makeGroup(type, 3, 'first', 0);
      const second = makeGroup(type, 3, 'second', 100);
      const empty = makeGroup(type, 0, 'empty');
      first.data[0].item.title.name = "\u2028";
      first.data[0].style.width = "1%";
      const input = [first, empty, second];
      const source = await parser.parse(JSON.stringify(input));
      expect(source.totalCount()).assertEqual(6);
      expect(resolver.calls).assertEqual(6);
      for (let index = 0; index < 3; index++) {
        const expectedTitle = index === 0 ? "\u2028" : 'first:' + index;
        expect(source.getData(index).opt('item').title.name).assertEqual(expectedTitle);
        expect(source.getData(index).opt('sequence')).assertEqual(index);
      }
      for (let index = 0; index < 3; index++) {
        expect(source.getData(3 + index).opt('item').title.name).assertEqual('second:' + index);
        expect(source.getData(3 + index).opt('sequence')).assertEqual(100 + index);
      }
      expect(source.getData(source.totalCount())).assertUndefined();
      assertUniqueIds(source);
    });

    /**
     * @tc.name FlatteningTest_case_029
     * @tc.desc parser-flatten: parse real layouts and verify independent expected output; input vector 29.
     * @tc.type Function
     * @tc.level Level1
     */
    it('FlatteningTest_case_029', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-flatten.28";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const first = makeGroup(type, 4, 'first', 0);
      const second = makeGroup(type, 0, 'second', 100);
      const empty = makeGroup(type, 0, 'empty');
      first.data[0].item.title.name = "\u2029";
      first.data[0].style.width = "99%";
      const input = [first, empty, second];
      const source = await parser.parse(input);
      expect(source.totalCount()).assertEqual(4);
      expect(resolver.calls).assertEqual(4);
      for (let index = 0; index < 4; index++) {
        const expectedTitle = index === 0 ? "\u2029" : 'first:' + index;
        expect(source.getData(index).opt('item').title.name).assertEqual(expectedTitle);
        expect(source.getData(index).opt('sequence')).assertEqual(index);
      }
      for (let index = 0; index < 0; index++) {
        expect(source.getData(4 + index).opt('item').title.name).assertEqual('second:' + index);
        expect(source.getData(4 + index).opt('sequence')).assertEqual(100 + index);
      }
      expect(source.getData(source.totalCount())).assertUndefined();
      assertUniqueIds(source);
    });
  });
}
