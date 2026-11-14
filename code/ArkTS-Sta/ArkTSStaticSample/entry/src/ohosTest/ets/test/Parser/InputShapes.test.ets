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

// Reference: ets/test/PowerDialog/PowerInputInteraction.test.ets
// Original line floor: 632; scenario family: parser-shapes.
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

interface SingleLayoutGroup {
  type: string;
  data: CardPayload;
}

export default function InputShapesTest(): void {
  describe('InputShapesTest', () => {
    beforeAll(() => {
      logSuite('InputShapesTest', 'begin');
    });
    beforeEach(async () => {
      // Yield between cases so device watchdog and UI events can be processed.
      await new Promise<void>((resolve) => { setTimeout(resolve, 1); });
    });
    afterAll(() => {
      logSuite('InputShapesTest', 'end');
    });

    /**
     * @tc.name InputShapesTest_case_001
     * @tc.desc parser-shapes: parse real layouts and verify independent expected output; input vector 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('InputShapesTest_case_001', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-shapes.0";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const group = makeGroup(type, 1, "parser-shapes:0");
      const single: SingleLayoutGroup = { type: type, data: group.data[0] };
      const source = await parser.parse(group);
      const expectedCount = 1;
      expect(source.totalCount()).assertEqual(expectedCount);
      expect(resolver.calls).assertEqual(expectedCount);
      expect(source.getData(0).type).assertEqual(type);
      expect(source.getData(0).opt('item').title.name).assertEqual("parser-shapes:0:0");
      expect(source.getData(0).opt('sequence')).assertEqual(0);
      expect(source.getData(expectedCount)).assertUndefined();
      assertUniqueIds(source);
      expect(source.getData(0).data === group.data[0]).assertEqual(true);
    });

    /**
     * @tc.name InputShapesTest_case_002
     * @tc.desc parser-shapes: parse real layouts and verify independent expected output; input vector 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('InputShapesTest_case_002', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-shapes.1";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const group = makeGroup(type, 2, "parser-shapes:1");
      const single: SingleLayoutGroup = { type: type, data: group.data[0] };
      const source = await parser.parse(single);
      const expectedCount = 1;
      expect(source.totalCount()).assertEqual(expectedCount);
      expect(resolver.calls).assertEqual(expectedCount);
      expect(source.getData(0).type).assertEqual(type);
      expect(source.getData(0).opt('item').title.name).assertEqual("parser-shapes:1:0");
      expect(source.getData(0).opt('sequence')).assertEqual(0);
      expect(source.getData(expectedCount)).assertUndefined();
      assertUniqueIds(source);
      expect(source.getData(0).data === group.data[0]).assertEqual(true);
    });

    /**
     * @tc.name InputShapesTest_case_003
     * @tc.desc parser-shapes: parse real layouts and verify independent expected output; input vector 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('InputShapesTest_case_003', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-shapes.2";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const group = makeGroup(type, 3, "parser-shapes:2");
      const single: SingleLayoutGroup = { type: type, data: group.data[0] };
      const source = await parser.parse([group]);
      const expectedCount = 3;
      expect(source.totalCount()).assertEqual(expectedCount);
      expect(resolver.calls).assertEqual(expectedCount);
      expect(source.getData(0).type).assertEqual(type);
      expect(source.getData(0).opt('item').title.name).assertEqual("parser-shapes:2:0");
      expect(source.getData(0).opt('sequence')).assertEqual(0);
      expect(source.getData(expectedCount)).assertUndefined();
      assertUniqueIds(source);
      expect(source.getData(0).data === group.data[0]).assertEqual(true);
    });

    /**
     * @tc.name InputShapesTest_case_004
     * @tc.desc parser-shapes: parse real layouts and verify independent expected output; input vector 4.
     * @tc.type Function
     * @tc.level Level1
     */
    it('InputShapesTest_case_004', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-shapes.3";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const group = makeGroup(type, 4, "parser-shapes:3");
      const single: SingleLayoutGroup = { type: type, data: group.data[0] };
      const source = await parser.parse(JSON.stringify([group]));
      const expectedCount = 4;
      expect(source.totalCount()).assertEqual(expectedCount);
      expect(resolver.calls).assertEqual(expectedCount);
      expect(source.getData(0).type).assertEqual(type);
      expect(source.getData(0).opt('item').title.name).assertEqual("parser-shapes:3:0");
      expect(source.getData(0).opt('sequence')).assertEqual(0);
      expect(source.getData(expectedCount)).assertUndefined();
      assertUniqueIds(source);
      expect(source.getData(0).data === group.data[0]).assertEqual(false);
    });

    /**
     * @tc.name InputShapesTest_case_005
     * @tc.desc parser-shapes: parse real layouts and verify independent expected output; input vector 5.
     * @tc.type Function
     * @tc.level Level1
     */
    it('InputShapesTest_case_005', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-shapes.4";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const group = makeGroup(type, 5, "parser-shapes:4");
      const single: SingleLayoutGroup = { type: type, data: group.data[0] };
      const source = await parser.parse(group);
      const expectedCount = 5;
      expect(source.totalCount()).assertEqual(expectedCount);
      expect(resolver.calls).assertEqual(expectedCount);
      expect(source.getData(0).type).assertEqual(type);
      expect(source.getData(0).opt('item').title.name).assertEqual("parser-shapes:4:0");
      expect(source.getData(0).opt('sequence')).assertEqual(0);
      expect(source.getData(expectedCount)).assertUndefined();
      assertUniqueIds(source);
      expect(source.getData(0).data === group.data[0]).assertEqual(true);
    });

    /**
     * @tc.name InputShapesTest_case_006
     * @tc.desc parser-shapes: parse real layouts and verify independent expected output; input vector 6.
     * @tc.type Function
     * @tc.level Level1
     */
    it('InputShapesTest_case_006', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-shapes.5";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const group = makeGroup(type, 1, "parser-shapes:5");
      const single: SingleLayoutGroup = { type: type, data: group.data[0] };
      const source = await parser.parse(single);
      const expectedCount = 1;
      expect(source.totalCount()).assertEqual(expectedCount);
      expect(resolver.calls).assertEqual(expectedCount);
      expect(source.getData(0).type).assertEqual(type);
      expect(source.getData(0).opt('item').title.name).assertEqual("parser-shapes:5:0");
      expect(source.getData(0).opt('sequence')).assertEqual(0);
      expect(source.getData(expectedCount)).assertUndefined();
      assertUniqueIds(source);
      expect(source.getData(0).data === group.data[0]).assertEqual(true);
    });

    /**
     * @tc.name InputShapesTest_case_007
     * @tc.desc parser-shapes: parse real layouts and verify independent expected output; input vector 7.
     * @tc.type Function
     * @tc.level Level1
     */
    it('InputShapesTest_case_007', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-shapes.6";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const group = makeGroup(type, 2, "parser-shapes:6");
      const single: SingleLayoutGroup = { type: type, data: group.data[0] };
      const source = await parser.parse([group]);
      const expectedCount = 2;
      expect(source.totalCount()).assertEqual(expectedCount);
      expect(resolver.calls).assertEqual(expectedCount);
      expect(source.getData(0).type).assertEqual(type);
      expect(source.getData(0).opt('item').title.name).assertEqual("parser-shapes:6:0");
      expect(source.getData(0).opt('sequence')).assertEqual(0);
      expect(source.getData(expectedCount)).assertUndefined();
      assertUniqueIds(source);
      expect(source.getData(0).data === group.data[0]).assertEqual(true);
    });

    /**
     * @tc.name InputShapesTest_case_008
     * @tc.desc parser-shapes: parse real layouts and verify independent expected output; input vector 8.
     * @tc.type Function
     * @tc.level Level1
     */
    it('InputShapesTest_case_008', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-shapes.7";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const group = makeGroup(type, 3, "parser-shapes:7");
      const single: SingleLayoutGroup = { type: type, data: group.data[0] };
      const source = await parser.parse(JSON.stringify([group]));
      const expectedCount = 3;
      expect(source.totalCount()).assertEqual(expectedCount);
      expect(resolver.calls).assertEqual(expectedCount);
      expect(source.getData(0).type).assertEqual(type);
      expect(source.getData(0).opt('item').title.name).assertEqual("parser-shapes:7:0");
      expect(source.getData(0).opt('sequence')).assertEqual(0);
      expect(source.getData(expectedCount)).assertUndefined();
      assertUniqueIds(source);
      expect(source.getData(0).data === group.data[0]).assertEqual(false);
    });

    /**
     * @tc.name InputShapesTest_case_009
     * @tc.desc parser-shapes: parse real layouts and verify independent expected output; input vector 9.
     * @tc.type Function
     * @tc.level Level1
     */
    it('InputShapesTest_case_009', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-shapes.8";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const group = makeGroup(type, 4, "parser-shapes:8");
      const single: SingleLayoutGroup = { type: type, data: group.data[0] };
      const source = await parser.parse(group);
      const expectedCount = 4;
      expect(source.totalCount()).assertEqual(expectedCount);
      expect(resolver.calls).assertEqual(expectedCount);
      expect(source.getData(0).type).assertEqual(type);
      expect(source.getData(0).opt('item').title.name).assertEqual("parser-shapes:8:0");
      expect(source.getData(0).opt('sequence')).assertEqual(0);
      expect(source.getData(expectedCount)).assertUndefined();
      assertUniqueIds(source);
      expect(source.getData(0).data === group.data[0]).assertEqual(true);
    });

    /**
     * @tc.name InputShapesTest_case_010
     * @tc.desc parser-shapes: parse real layouts and verify independent expected output; input vector 10.
     * @tc.type Function
     * @tc.level Level1
     */
    it('InputShapesTest_case_010', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-shapes.9";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const group = makeGroup(type, 5, "parser-shapes:9");
      const single: SingleLayoutGroup = { type: type, data: group.data[0] };
      const source = await parser.parse(single);
      const expectedCount = 1;
      expect(source.totalCount()).assertEqual(expectedCount);
      expect(resolver.calls).assertEqual(expectedCount);
      expect(source.getData(0).type).assertEqual(type);
      expect(source.getData(0).opt('item').title.name).assertEqual("parser-shapes:9:0");
      expect(source.getData(0).opt('sequence')).assertEqual(0);
      expect(source.getData(expectedCount)).assertUndefined();
      assertUniqueIds(source);
      expect(source.getData(0).data === group.data[0]).assertEqual(true);
    });

    /**
     * @tc.name InputShapesTest_case_011
     * @tc.desc parser-shapes: parse real layouts and verify independent expected output; input vector 11.
     * @tc.type Function
     * @tc.level Level1
     */
    it('InputShapesTest_case_011', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-shapes.10";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const group = makeGroup(type, 1, "parser-shapes:10");
      const single: SingleLayoutGroup = { type: type, data: group.data[0] };
      const source = await parser.parse([group]);
      const expectedCount = 1;
      expect(source.totalCount()).assertEqual(expectedCount);
      expect(resolver.calls).assertEqual(expectedCount);
      expect(source.getData(0).type).assertEqual(type);
      expect(source.getData(0).opt('item').title.name).assertEqual("parser-shapes:10:0");
      expect(source.getData(0).opt('sequence')).assertEqual(0);
      expect(source.getData(expectedCount)).assertUndefined();
      assertUniqueIds(source);
      expect(source.getData(0).data === group.data[0]).assertEqual(true);
    });

    /**
     * @tc.name InputShapesTest_case_012
     * @tc.desc parser-shapes: parse real layouts and verify independent expected output; input vector 12.
     * @tc.type Function
     * @tc.level Level1
     */
    it('InputShapesTest_case_012', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-shapes.11";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const group = makeGroup(type, 2, "parser-shapes:11");
      const single: SingleLayoutGroup = { type: type, data: group.data[0] };
      const source = await parser.parse(JSON.stringify([group]));
      const expectedCount = 2;
      expect(source.totalCount()).assertEqual(expectedCount);
      expect(resolver.calls).assertEqual(expectedCount);
      expect(source.getData(0).type).assertEqual(type);
      expect(source.getData(0).opt('item').title.name).assertEqual("parser-shapes:11:0");
      expect(source.getData(0).opt('sequence')).assertEqual(0);
      expect(source.getData(expectedCount)).assertUndefined();
      assertUniqueIds(source);
      expect(source.getData(0).data === group.data[0]).assertEqual(false);
    });

    /**
     * @tc.name InputShapesTest_case_013
     * @tc.desc parser-shapes: parse real layouts and verify independent expected output; input vector 13.
     * @tc.type Function
     * @tc.level Level1
     */
    it('InputShapesTest_case_013', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-shapes.12";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const group = makeGroup(type, 3, "parser-shapes:12");
      const single: SingleLayoutGroup = { type: type, data: group.data[0] };
      const source = await parser.parse(group);
      const expectedCount = 3;
      expect(source.totalCount()).assertEqual(expectedCount);
      expect(resolver.calls).assertEqual(expectedCount);
      expect(source.getData(0).type).assertEqual(type);
      expect(source.getData(0).opt('item').title.name).assertEqual("parser-shapes:12:0");
      expect(source.getData(0).opt('sequence')).assertEqual(0);
      expect(source.getData(expectedCount)).assertUndefined();
      assertUniqueIds(source);
      expect(source.getData(0).data === group.data[0]).assertEqual(true);
    });

    /**
     * @tc.name InputShapesTest_case_014
     * @tc.desc parser-shapes: parse real layouts and verify independent expected output; input vector 14.
     * @tc.type Function
     * @tc.level Level1
     */
    it('InputShapesTest_case_014', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-shapes.13";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const group = makeGroup(type, 4, "parser-shapes:13");
      const single: SingleLayoutGroup = { type: type, data: group.data[0] };
      const source = await parser.parse(single);
      const expectedCount = 1;
      expect(source.totalCount()).assertEqual(expectedCount);
      expect(resolver.calls).assertEqual(expectedCount);
      expect(source.getData(0).type).assertEqual(type);
      expect(source.getData(0).opt('item').title.name).assertEqual("parser-shapes:13:0");
      expect(source.getData(0).opt('sequence')).assertEqual(0);
      expect(source.getData(expectedCount)).assertUndefined();
      assertUniqueIds(source);
      expect(source.getData(0).data === group.data[0]).assertEqual(true);
    });

    /**
     * @tc.name InputShapesTest_case_015
     * @tc.desc parser-shapes: parse real layouts and verify independent expected output; input vector 15.
     * @tc.type Function
     * @tc.level Level1
     */
    it('InputShapesTest_case_015', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-shapes.14";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const group = makeGroup(type, 5, "parser-shapes:14");
      const single: SingleLayoutGroup = { type: type, data: group.data[0] };
      const source = await parser.parse([group]);
      const expectedCount = 5;
      expect(source.totalCount()).assertEqual(expectedCount);
      expect(resolver.calls).assertEqual(expectedCount);
      expect(source.getData(0).type).assertEqual(type);
      expect(source.getData(0).opt('item').title.name).assertEqual("parser-shapes:14:0");
      expect(source.getData(0).opt('sequence')).assertEqual(0);
      expect(source.getData(expectedCount)).assertUndefined();
      assertUniqueIds(source);
      expect(source.getData(0).data === group.data[0]).assertEqual(true);
    });

    /**
     * @tc.name InputShapesTest_case_016
     * @tc.desc parser-shapes: parse real layouts and verify independent expected output; input vector 16.
     * @tc.type Function
     * @tc.level Level1
     */
    it('InputShapesTest_case_016', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-shapes.15";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const group = makeGroup(type, 1, "parser-shapes:15");
      const single: SingleLayoutGroup = { type: type, data: group.data[0] };
      const source = await parser.parse(JSON.stringify([group]));
      const expectedCount = 1;
      expect(source.totalCount()).assertEqual(expectedCount);
      expect(resolver.calls).assertEqual(expectedCount);
      expect(source.getData(0).type).assertEqual(type);
      expect(source.getData(0).opt('item').title.name).assertEqual("parser-shapes:15:0");
      expect(source.getData(0).opt('sequence')).assertEqual(0);
      expect(source.getData(expectedCount)).assertUndefined();
      assertUniqueIds(source);
      expect(source.getData(0).data === group.data[0]).assertEqual(false);
    });

    /**
     * @tc.name InputShapesTest_case_017
     * @tc.desc parser-shapes: parse real layouts and verify independent expected output; input vector 17.
     * @tc.type Function
     * @tc.level Level1
     */
    it('InputShapesTest_case_017', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-shapes.16";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const group = makeGroup(type, 2, "parser-shapes:16");
      const single: SingleLayoutGroup = { type: type, data: group.data[0] };
      const source = await parser.parse(group);
      const expectedCount = 2;
      expect(source.totalCount()).assertEqual(expectedCount);
      expect(resolver.calls).assertEqual(expectedCount);
      expect(source.getData(0).type).assertEqual(type);
      expect(source.getData(0).opt('item').title.name).assertEqual("parser-shapes:16:0");
      expect(source.getData(0).opt('sequence')).assertEqual(0);
      expect(source.getData(expectedCount)).assertUndefined();
      assertUniqueIds(source);
      expect(source.getData(0).data === group.data[0]).assertEqual(true);
    });

    /**
     * @tc.name InputShapesTest_case_018
     * @tc.desc parser-shapes: parse real layouts and verify independent expected output; input vector 18.
     * @tc.type Function
     * @tc.level Level1
     */
    it('InputShapesTest_case_018', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-shapes.17";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const group = makeGroup(type, 3, "parser-shapes:17");
      const single: SingleLayoutGroup = { type: type, data: group.data[0] };
      const source = await parser.parse(single);
      const expectedCount = 1;
      expect(source.totalCount()).assertEqual(expectedCount);
      expect(resolver.calls).assertEqual(expectedCount);
      expect(source.getData(0).type).assertEqual(type);
      expect(source.getData(0).opt('item').title.name).assertEqual("parser-shapes:17:0");
      expect(source.getData(0).opt('sequence')).assertEqual(0);
      expect(source.getData(expectedCount)).assertUndefined();
      assertUniqueIds(source);
      expect(source.getData(0).data === group.data[0]).assertEqual(true);
    });

    /**
     * @tc.name InputShapesTest_case_019
     * @tc.desc parser-shapes: parse real layouts and verify independent expected output; input vector 19.
     * @tc.type Function
     * @tc.level Level1
     */
    it('InputShapesTest_case_019', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-shapes.18";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const group = makeGroup(type, 4, "parser-shapes:18");
      const single: SingleLayoutGroup = { type: type, data: group.data[0] };
      const source = await parser.parse([group]);
      const expectedCount = 4;
      expect(source.totalCount()).assertEqual(expectedCount);
      expect(resolver.calls).assertEqual(expectedCount);
      expect(source.getData(0).type).assertEqual(type);
      expect(source.getData(0).opt('item').title.name).assertEqual("parser-shapes:18:0");
      expect(source.getData(0).opt('sequence')).assertEqual(0);
      expect(source.getData(expectedCount)).assertUndefined();
      assertUniqueIds(source);
      expect(source.getData(0).data === group.data[0]).assertEqual(true);
    });

    /**
     * @tc.name InputShapesTest_case_020
     * @tc.desc parser-shapes: parse real layouts and verify independent expected output; input vector 20.
     * @tc.type Function
     * @tc.level Level1
     */
    it('InputShapesTest_case_020', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-shapes.19";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const group = makeGroup(type, 5, "parser-shapes:19");
      const single: SingleLayoutGroup = { type: type, data: group.data[0] };
      const source = await parser.parse(JSON.stringify([group]));
      const expectedCount = 5;
      expect(source.totalCount()).assertEqual(expectedCount);
      expect(resolver.calls).assertEqual(expectedCount);
      expect(source.getData(0).type).assertEqual(type);
      expect(source.getData(0).opt('item').title.name).assertEqual("parser-shapes:19:0");
      expect(source.getData(0).opt('sequence')).assertEqual(0);
      expect(source.getData(expectedCount)).assertUndefined();
      assertUniqueIds(source);
      expect(source.getData(0).data === group.data[0]).assertEqual(false);
    });

    /**
     * @tc.name InputShapesTest_case_021
     * @tc.desc parser-shapes: parse real layouts and verify independent expected output; input vector 21.
     * @tc.type Function
     * @tc.level Level1
     */
    it('InputShapesTest_case_021', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-shapes.20";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const group = makeGroup(type, 1, "parser-shapes:20");
      const single: SingleLayoutGroup = { type: type, data: group.data[0] };
      const source = await parser.parse(group);
      const expectedCount = 1;
      expect(source.totalCount()).assertEqual(expectedCount);
      expect(resolver.calls).assertEqual(expectedCount);
      expect(source.getData(0).type).assertEqual(type);
      expect(source.getData(0).opt('item').title.name).assertEqual("parser-shapes:20:0");
      expect(source.getData(0).opt('sequence')).assertEqual(0);
      expect(source.getData(expectedCount)).assertUndefined();
      assertUniqueIds(source);
      expect(source.getData(0).data === group.data[0]).assertEqual(true);
    });

    /**
     * @tc.name InputShapesTest_case_022
     * @tc.desc parser-shapes: parse real layouts and verify independent expected output; input vector 22.
     * @tc.type Function
     * @tc.level Level1
     */
    it('InputShapesTest_case_022', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-shapes.21";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const group = makeGroup(type, 2, "parser-shapes:21");
      const single: SingleLayoutGroup = { type: type, data: group.data[0] };
      const source = await parser.parse(single);
      const expectedCount = 1;
      expect(source.totalCount()).assertEqual(expectedCount);
      expect(resolver.calls).assertEqual(expectedCount);
      expect(source.getData(0).type).assertEqual(type);
      expect(source.getData(0).opt('item').title.name).assertEqual("parser-shapes:21:0");
      expect(source.getData(0).opt('sequence')).assertEqual(0);
      expect(source.getData(expectedCount)).assertUndefined();
      assertUniqueIds(source);
      expect(source.getData(0).data === group.data[0]).assertEqual(true);
    });

    /**
     * @tc.name InputShapesTest_case_023
     * @tc.desc parser-shapes: parse real layouts and verify independent expected output; input vector 23.
     * @tc.type Function
     * @tc.level Level1
     */
    it('InputShapesTest_case_023', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-shapes.22";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const group = makeGroup(type, 3, "parser-shapes:22");
      const single: SingleLayoutGroup = { type: type, data: group.data[0] };
      const source = await parser.parse([group]);
      const expectedCount = 3;
      expect(source.totalCount()).assertEqual(expectedCount);
      expect(resolver.calls).assertEqual(expectedCount);
      expect(source.getData(0).type).assertEqual(type);
      expect(source.getData(0).opt('item').title.name).assertEqual("parser-shapes:22:0");
      expect(source.getData(0).opt('sequence')).assertEqual(0);
      expect(source.getData(expectedCount)).assertUndefined();
      assertUniqueIds(source);
      expect(source.getData(0).data === group.data[0]).assertEqual(true);
    });
  });
}
