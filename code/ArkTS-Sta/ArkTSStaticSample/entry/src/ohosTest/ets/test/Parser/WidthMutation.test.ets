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

// Reference: ets/test/Validation/AnimationControllerValidation.test.ets
// Original line floor: 1306; scenario family: parser-width-descriptor.
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

export default function WidthMutationTest(): void {
  describe('WidthMutationTest', () => {
    beforeAll(() => {
      logSuite('WidthMutationTest', 'begin');
    });
    beforeEach(async () => {
      // Yield between cases so device watchdog and UI events can be processed.
      await new Promise<void>((resolve) => { setTimeout(resolve, 1); });
    });
    afterAll(() => {
      logSuite('WidthMutationTest', 'end');
    });

    /**
     * @tc.name WidthMutationTest_case_001
     * @tc.desc parser-width-descriptor: parse real layouts and verify independent expected output; input vector 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('WidthMutationTest_case_001', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-width-descriptor.0";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const group = makeGroup(type, 1, "parser-width-descriptor:0");
      const source = await parser.parse([group]);
      expect(source.totalCount()).assertEqual(1);
      const card = source.getData(0);
      const style: CardStyle = card.opt('style');
      const before = Number.parseFloat(style.width);
      const reads = 2;
      for (let step = 1; step <= reads; step++) {
        expect(Number.parseFloat(style.width)).assertEqual(before - step * 10);
      }
      const descriptor = inspectProperty(style, 'width');
      expect(descriptor.hasGetter).assertTrue();
      expect(descriptor.hasSetter).assertFalse();
      expect(descriptor.enumerable).assertTrue();
      expect(descriptor.configurable).assertTrue();
      expect(card.opt('item').title.name).assertEqual("parser-width-descriptor:0:0");
      expect(resolver.calls).assertEqual(1);
      expect(style === group.data[0].style).assertTrue();
    });

    /**
     * @tc.name WidthMutationTest_case_002
     * @tc.desc parser-width-descriptor: parse real layouts and verify independent expected output; input vector 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('WidthMutationTest_case_002', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-width-descriptor.1";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const group = makeGroup(type, 2, "parser-width-descriptor:1");
      const source = await parser.parse([group]);
      expect(source.totalCount()).assertEqual(2);
      const card = source.getData(1);
      const style: CardStyle = card.opt('style');
      const before = Number.parseFloat(style.width);
      const reads = 3;
      for (let step = 1; step <= reads; step++) {
        expect(Number.parseFloat(style.width)).assertEqual(before - step * 10);
      }
      const descriptor = inspectProperty(style, 'width');
      expect(descriptor.hasGetter).assertTrue();
      expect(descriptor.hasSetter).assertFalse();
      expect(descriptor.enumerable).assertTrue();
      expect(descriptor.configurable).assertTrue();
      expect(card.opt('item').title.name).assertEqual("parser-width-descriptor:1:1");
      expect(resolver.calls).assertEqual(2);
      expect(style === group.data[1].style).assertTrue();
    });

    /**
     * @tc.name WidthMutationTest_case_003
     * @tc.desc parser-width-descriptor: parse real layouts and verify independent expected output; input vector 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('WidthMutationTest_case_003', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-width-descriptor.2";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const group = makeGroup(type, 3, "parser-width-descriptor:2");
      const source = await parser.parse([group]);
      expect(source.totalCount()).assertEqual(3);
      const card = source.getData(2);
      const style: CardStyle = card.opt('style');
      const before = Number.parseFloat(style.width);
      const reads = 4;
      for (let step = 1; step <= reads; step++) {
        expect(Number.parseFloat(style.width)).assertEqual(before - step * 10);
      }
      const descriptor = inspectProperty(style, 'width');
      expect(descriptor.hasGetter).assertTrue();
      expect(descriptor.hasSetter).assertFalse();
      expect(descriptor.enumerable).assertTrue();
      expect(descriptor.configurable).assertTrue();
      expect(card.opt('item').title.name).assertEqual("parser-width-descriptor:2:2");
      expect(resolver.calls).assertEqual(3);
      expect(style === group.data[2].style).assertTrue();
    });

    /**
     * @tc.name WidthMutationTest_case_004
     * @tc.desc parser-width-descriptor: parse real layouts and verify independent expected output; input vector 4.
     * @tc.type Function
     * @tc.level Level1
     */
    it('WidthMutationTest_case_004', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-width-descriptor.3";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const group = makeGroup(type, 4, "parser-width-descriptor:3");
      const source = await parser.parse([group]);
      expect(source.totalCount()).assertEqual(4);
      const card = source.getData(3);
      const style: CardStyle = card.opt('style');
      const before = Number.parseFloat(style.width);
      const reads = 5;
      for (let step = 1; step <= reads; step++) {
        expect(Number.parseFloat(style.width)).assertEqual(before - step * 10);
      }
      const descriptor = inspectProperty(style, 'width');
      expect(descriptor.hasGetter).assertTrue();
      expect(descriptor.hasSetter).assertFalse();
      expect(descriptor.enumerable).assertTrue();
      expect(descriptor.configurable).assertTrue();
      expect(card.opt('item').title.name).assertEqual("parser-width-descriptor:3:3");
      expect(resolver.calls).assertEqual(4);
      expect(style === group.data[3].style).assertTrue();
    });

    /**
     * @tc.name WidthMutationTest_case_005
     * @tc.desc parser-width-descriptor: parse real layouts and verify independent expected output; input vector 5.
     * @tc.type Function
     * @tc.level Level1
     */
    it('WidthMutationTest_case_005', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-width-descriptor.4";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const group = makeGroup(type, 5, "parser-width-descriptor:4");
      const source = await parser.parse([group]);
      expect(source.totalCount()).assertEqual(5);
      const card = source.getData(4);
      const style: CardStyle = card.opt('style');
      const before = Number.parseFloat(style.width);
      const reads = 2;
      for (let step = 1; step <= reads; step++) {
        expect(Number.parseFloat(style.width)).assertEqual(before - step * 10);
      }
      const descriptor = inspectProperty(style, 'width');
      expect(descriptor.hasGetter).assertTrue();
      expect(descriptor.hasSetter).assertFalse();
      expect(descriptor.enumerable).assertTrue();
      expect(descriptor.configurable).assertTrue();
      expect(card.opt('item').title.name).assertEqual("parser-width-descriptor:4:4");
      expect(resolver.calls).assertEqual(5);
      expect(style === group.data[4].style).assertTrue();
    });

    /**
     * @tc.name WidthMutationTest_case_006
     * @tc.desc parser-width-descriptor: parse real layouts and verify independent expected output; input vector 6.
     * @tc.type Function
     * @tc.level Level1
     */
    it('WidthMutationTest_case_006', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-width-descriptor.5";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const group = makeGroup(type, 1, "parser-width-descriptor:5");
      const source = await parser.parse([group]);
      expect(source.totalCount()).assertEqual(1);
      const card = source.getData(0);
      const style: CardStyle = card.opt('style');
      const before = Number.parseFloat(style.width);
      const reads = 3;
      for (let step = 1; step <= reads; step++) {
        expect(Number.parseFloat(style.width)).assertEqual(before - step * 10);
      }
      const descriptor = inspectProperty(style, 'width');
      expect(descriptor.hasGetter).assertTrue();
      expect(descriptor.hasSetter).assertFalse();
      expect(descriptor.enumerable).assertTrue();
      expect(descriptor.configurable).assertTrue();
      expect(card.opt('item').title.name).assertEqual("parser-width-descriptor:5:0");
      expect(resolver.calls).assertEqual(1);
      expect(style === group.data[0].style).assertTrue();
    });

    /**
     * @tc.name WidthMutationTest_case_007
     * @tc.desc parser-width-descriptor: parse real layouts and verify independent expected output; input vector 7.
     * @tc.type Function
     * @tc.level Level1
     */
    it('WidthMutationTest_case_007', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-width-descriptor.6";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const group = makeGroup(type, 2, "parser-width-descriptor:6");
      const source = await parser.parse([group]);
      expect(source.totalCount()).assertEqual(2);
      const card = source.getData(0);
      const style: CardStyle = card.opt('style');
      const before = Number.parseFloat(style.width);
      const reads = 4;
      for (let step = 1; step <= reads; step++) {
        expect(Number.parseFloat(style.width)).assertEqual(before - step * 10);
      }
      const descriptor = inspectProperty(style, 'width');
      expect(descriptor.hasGetter).assertTrue();
      expect(descriptor.hasSetter).assertFalse();
      expect(descriptor.enumerable).assertTrue();
      expect(descriptor.configurable).assertTrue();
      expect(card.opt('item').title.name).assertEqual("parser-width-descriptor:6:0");
      expect(resolver.calls).assertEqual(2);
      expect(style === group.data[0].style).assertTrue();
    });

    /**
     * @tc.name WidthMutationTest_case_008
     * @tc.desc parser-width-descriptor: parse real layouts and verify independent expected output; input vector 8.
     * @tc.type Function
     * @tc.level Level1
     */
    it('WidthMutationTest_case_008', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-width-descriptor.7";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const group = makeGroup(type, 3, "parser-width-descriptor:7");
      const source = await parser.parse([group]);
      expect(source.totalCount()).assertEqual(3);
      const card = source.getData(1);
      const style: CardStyle = card.opt('style');
      const before = Number.parseFloat(style.width);
      const reads = 5;
      for (let step = 1; step <= reads; step++) {
        expect(Number.parseFloat(style.width)).assertEqual(before - step * 10);
      }
      const descriptor = inspectProperty(style, 'width');
      expect(descriptor.hasGetter).assertTrue();
      expect(descriptor.hasSetter).assertFalse();
      expect(descriptor.enumerable).assertTrue();
      expect(descriptor.configurable).assertTrue();
      expect(card.opt('item').title.name).assertEqual("parser-width-descriptor:7:1");
      expect(resolver.calls).assertEqual(3);
      expect(style === group.data[1].style).assertTrue();
    });

    /**
     * @tc.name WidthMutationTest_case_009
     * @tc.desc parser-width-descriptor: parse real layouts and verify independent expected output; input vector 9.
     * @tc.type Function
     * @tc.level Level1
     */
    it('WidthMutationTest_case_009', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-width-descriptor.8";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const group = makeGroup(type, 4, "parser-width-descriptor:8");
      const source = await parser.parse([group]);
      expect(source.totalCount()).assertEqual(4);
      const card = source.getData(0);
      const style: CardStyle = card.opt('style');
      const before = Number.parseFloat(style.width);
      const reads = 2;
      for (let step = 1; step <= reads; step++) {
        expect(Number.parseFloat(style.width)).assertEqual(before - step * 10);
      }
      const descriptor = inspectProperty(style, 'width');
      expect(descriptor.hasGetter).assertTrue();
      expect(descriptor.hasSetter).assertFalse();
      expect(descriptor.enumerable).assertTrue();
      expect(descriptor.configurable).assertTrue();
      expect(card.opt('item').title.name).assertEqual("parser-width-descriptor:8:0");
      expect(resolver.calls).assertEqual(4);
      expect(style === group.data[0].style).assertTrue();
    });

    /**
     * @tc.name WidthMutationTest_case_010
     * @tc.desc parser-width-descriptor: parse real layouts and verify independent expected output; input vector 10.
     * @tc.type Function
     * @tc.level Level1
     */
    it('WidthMutationTest_case_010', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-width-descriptor.9";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const group = makeGroup(type, 5, "parser-width-descriptor:9");
      const source = await parser.parse([group]);
      expect(source.totalCount()).assertEqual(5);
      const card = source.getData(4);
      const style: CardStyle = card.opt('style');
      const before = Number.parseFloat(style.width);
      const reads = 3;
      for (let step = 1; step <= reads; step++) {
        expect(Number.parseFloat(style.width)).assertEqual(before - step * 10);
      }
      const descriptor = inspectProperty(style, 'width');
      expect(descriptor.hasGetter).assertTrue();
      expect(descriptor.hasSetter).assertFalse();
      expect(descriptor.enumerable).assertTrue();
      expect(descriptor.configurable).assertTrue();
      expect(card.opt('item').title.name).assertEqual("parser-width-descriptor:9:4");
      expect(resolver.calls).assertEqual(5);
      expect(style === group.data[4].style).assertTrue();
    });

    /**
     * @tc.name WidthMutationTest_case_011
     * @tc.desc parser-width-descriptor: parse real layouts and verify independent expected output; input vector 11.
     * @tc.type Function
     * @tc.level Level1
     */
    it('WidthMutationTest_case_011', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-width-descriptor.10";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const group = makeGroup(type, 1, "parser-width-descriptor:10");
      const source = await parser.parse([group]);
      expect(source.totalCount()).assertEqual(1);
      const card = source.getData(0);
      const style: CardStyle = card.opt('style');
      const before = Number.parseFloat(style.width);
      const reads = 4;
      for (let step = 1; step <= reads; step++) {
        expect(Number.parseFloat(style.width)).assertEqual(before - step * 10);
      }
      const descriptor = inspectProperty(style, 'width');
      expect(descriptor.hasGetter).assertTrue();
      expect(descriptor.hasSetter).assertFalse();
      expect(descriptor.enumerable).assertTrue();
      expect(descriptor.configurable).assertTrue();
      expect(card.opt('item').title.name).assertEqual("parser-width-descriptor:10:0");
      expect(resolver.calls).assertEqual(1);
      expect(style === group.data[0].style).assertTrue();
    });

    /**
     * @tc.name WidthMutationTest_case_012
     * @tc.desc parser-width-descriptor: parse real layouts and verify independent expected output; input vector 12.
     * @tc.type Function
     * @tc.level Level1
     */
    it('WidthMutationTest_case_012', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-width-descriptor.11";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const group = makeGroup(type, 2, "parser-width-descriptor:11");
      const source = await parser.parse([group]);
      expect(source.totalCount()).assertEqual(2);
      const card = source.getData(1);
      const style: CardStyle = card.opt('style');
      const before = Number.parseFloat(style.width);
      const reads = 5;
      for (let step = 1; step <= reads; step++) {
        expect(Number.parseFloat(style.width)).assertEqual(before - step * 10);
      }
      const descriptor = inspectProperty(style, 'width');
      expect(descriptor.hasGetter).assertTrue();
      expect(descriptor.hasSetter).assertFalse();
      expect(descriptor.enumerable).assertTrue();
      expect(descriptor.configurable).assertTrue();
      expect(card.opt('item').title.name).assertEqual("parser-width-descriptor:11:1");
      expect(resolver.calls).assertEqual(2);
      expect(style === group.data[1].style).assertTrue();
    });

    /**
     * @tc.name WidthMutationTest_case_013
     * @tc.desc parser-width-descriptor: parse real layouts and verify independent expected output; input vector 13.
     * @tc.type Function
     * @tc.level Level1
     */
    it('WidthMutationTest_case_013', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-width-descriptor.12";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const group = makeGroup(type, 3, "parser-width-descriptor:12");
      const source = await parser.parse([group]);
      expect(source.totalCount()).assertEqual(3);
      const card = source.getData(0);
      const style: CardStyle = card.opt('style');
      const before = Number.parseFloat(style.width);
      const reads = 2;
      for (let step = 1; step <= reads; step++) {
        expect(Number.parseFloat(style.width)).assertEqual(before - step * 10);
      }
      const descriptor = inspectProperty(style, 'width');
      expect(descriptor.hasGetter).assertTrue();
      expect(descriptor.hasSetter).assertFalse();
      expect(descriptor.enumerable).assertTrue();
      expect(descriptor.configurable).assertTrue();
      expect(card.opt('item').title.name).assertEqual("parser-width-descriptor:12:0");
      expect(resolver.calls).assertEqual(3);
      expect(style === group.data[0].style).assertTrue();
    });

    /**
     * @tc.name WidthMutationTest_case_014
     * @tc.desc parser-width-descriptor: parse real layouts and verify independent expected output; input vector 14.
     * @tc.type Function
     * @tc.level Level1
     */
    it('WidthMutationTest_case_014', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-width-descriptor.13";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const group = makeGroup(type, 4, "parser-width-descriptor:13");
      const source = await parser.parse([group]);
      expect(source.totalCount()).assertEqual(4);
      const card = source.getData(1);
      const style: CardStyle = card.opt('style');
      const before = Number.parseFloat(style.width);
      const reads = 3;
      for (let step = 1; step <= reads; step++) {
        expect(Number.parseFloat(style.width)).assertEqual(before - step * 10);
      }
      const descriptor = inspectProperty(style, 'width');
      expect(descriptor.hasGetter).assertTrue();
      expect(descriptor.hasSetter).assertFalse();
      expect(descriptor.enumerable).assertTrue();
      expect(descriptor.configurable).assertTrue();
      expect(card.opt('item').title.name).assertEqual("parser-width-descriptor:13:1");
      expect(resolver.calls).assertEqual(4);
      expect(style === group.data[1].style).assertTrue();
    });

    /**
     * @tc.name WidthMutationTest_case_015
     * @tc.desc parser-width-descriptor: parse real layouts and verify independent expected output; input vector 15.
     * @tc.type Function
     * @tc.level Level1
     */
    it('WidthMutationTest_case_015', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-width-descriptor.14";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const group = makeGroup(type, 5, "parser-width-descriptor:14");
      const source = await parser.parse([group]);
      expect(source.totalCount()).assertEqual(5);
      const card = source.getData(4);
      const style: CardStyle = card.opt('style');
      const before = Number.parseFloat(style.width);
      const reads = 4;
      for (let step = 1; step <= reads; step++) {
        expect(Number.parseFloat(style.width)).assertEqual(before - step * 10);
      }
      const descriptor = inspectProperty(style, 'width');
      expect(descriptor.hasGetter).assertTrue();
      expect(descriptor.hasSetter).assertFalse();
      expect(descriptor.enumerable).assertTrue();
      expect(descriptor.configurable).assertTrue();
      expect(card.opt('item').title.name).assertEqual("parser-width-descriptor:14:4");
      expect(resolver.calls).assertEqual(5);
      expect(style === group.data[4].style).assertTrue();
    });

    /**
     * @tc.name WidthMutationTest_case_016
     * @tc.desc parser-width-descriptor: parse real layouts and verify independent expected output; input vector 16.
     * @tc.type Function
     * @tc.level Level1
     */
    it('WidthMutationTest_case_016', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-width-descriptor.15";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const group = makeGroup(type, 1, "parser-width-descriptor:15");
      const source = await parser.parse([group]);
      expect(source.totalCount()).assertEqual(1);
      const card = source.getData(0);
      const style: CardStyle = card.opt('style');
      const before = Number.parseFloat(style.width);
      const reads = 5;
      for (let step = 1; step <= reads; step++) {
        expect(Number.parseFloat(style.width)).assertEqual(before - step * 10);
      }
      const descriptor = inspectProperty(style, 'width');
      expect(descriptor.hasGetter).assertTrue();
      expect(descriptor.hasSetter).assertFalse();
      expect(descriptor.enumerable).assertTrue();
      expect(descriptor.configurable).assertTrue();
      expect(card.opt('item').title.name).assertEqual("parser-width-descriptor:15:0");
      expect(resolver.calls).assertEqual(1);
      expect(style === group.data[0].style).assertTrue();
    });

    /**
     * @tc.name WidthMutationTest_case_017
     * @tc.desc parser-width-descriptor: parse real layouts and verify independent expected output; input vector 17.
     * @tc.type Function
     * @tc.level Level1
     */
    it('WidthMutationTest_case_017', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-width-descriptor.16";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const group = makeGroup(type, 2, "parser-width-descriptor:16");
      const source = await parser.parse([group]);
      expect(source.totalCount()).assertEqual(2);
      const card = source.getData(0);
      const style: CardStyle = card.opt('style');
      const before = Number.parseFloat(style.width);
      const reads = 2;
      for (let step = 1; step <= reads; step++) {
        expect(Number.parseFloat(style.width)).assertEqual(before - step * 10);
      }
      const descriptor = inspectProperty(style, 'width');
      expect(descriptor.hasGetter).assertTrue();
      expect(descriptor.hasSetter).assertFalse();
      expect(descriptor.enumerable).assertTrue();
      expect(descriptor.configurable).assertTrue();
      expect(card.opt('item').title.name).assertEqual("parser-width-descriptor:16:0");
      expect(resolver.calls).assertEqual(2);
      expect(style === group.data[0].style).assertTrue();
    });

    /**
     * @tc.name WidthMutationTest_case_018
     * @tc.desc parser-width-descriptor: parse real layouts and verify independent expected output; input vector 18.
     * @tc.type Function
     * @tc.level Level1
     */
    it('WidthMutationTest_case_018', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-width-descriptor.17";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const group = makeGroup(type, 3, "parser-width-descriptor:17");
      const source = await parser.parse([group]);
      expect(source.totalCount()).assertEqual(3);
      const card = source.getData(2);
      const style: CardStyle = card.opt('style');
      const before = Number.parseFloat(style.width);
      const reads = 3;
      for (let step = 1; step <= reads; step++) {
        expect(Number.parseFloat(style.width)).assertEqual(before - step * 10);
      }
      const descriptor = inspectProperty(style, 'width');
      expect(descriptor.hasGetter).assertTrue();
      expect(descriptor.hasSetter).assertFalse();
      expect(descriptor.enumerable).assertTrue();
      expect(descriptor.configurable).assertTrue();
      expect(card.opt('item').title.name).assertEqual("parser-width-descriptor:17:2");
      expect(resolver.calls).assertEqual(3);
      expect(style === group.data[2].style).assertTrue();
    });

    /**
     * @tc.name WidthMutationTest_case_019
     * @tc.desc parser-width-descriptor: parse real layouts and verify independent expected output; input vector 19.
     * @tc.type Function
     * @tc.level Level1
     */
    it('WidthMutationTest_case_019', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-width-descriptor.18";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const group = makeGroup(type, 4, "parser-width-descriptor:18");
      const source = await parser.parse([group]);
      expect(source.totalCount()).assertEqual(4);
      const card = source.getData(2);
      const style: CardStyle = card.opt('style');
      const before = Number.parseFloat(style.width);
      const reads = 4;
      for (let step = 1; step <= reads; step++) {
        expect(Number.parseFloat(style.width)).assertEqual(before - step * 10);
      }
      const descriptor = inspectProperty(style, 'width');
      expect(descriptor.hasGetter).assertTrue();
      expect(descriptor.hasSetter).assertFalse();
      expect(descriptor.enumerable).assertTrue();
      expect(descriptor.configurable).assertTrue();
      expect(card.opt('item').title.name).assertEqual("parser-width-descriptor:18:2");
      expect(resolver.calls).assertEqual(4);
      expect(style === group.data[2].style).assertTrue();
    });

    /**
     * @tc.name WidthMutationTest_case_020
     * @tc.desc parser-width-descriptor: parse real layouts and verify independent expected output; input vector 20.
     * @tc.type Function
     * @tc.level Level1
     */
    it('WidthMutationTest_case_020', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-width-descriptor.19";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const group = makeGroup(type, 5, "parser-width-descriptor:19");
      const source = await parser.parse([group]);
      expect(source.totalCount()).assertEqual(5);
      const card = source.getData(4);
      const style: CardStyle = card.opt('style');
      const before = Number.parseFloat(style.width);
      const reads = 5;
      for (let step = 1; step <= reads; step++) {
        expect(Number.parseFloat(style.width)).assertEqual(before - step * 10);
      }
      const descriptor = inspectProperty(style, 'width');
      expect(descriptor.hasGetter).assertTrue();
      expect(descriptor.hasSetter).assertFalse();
      expect(descriptor.enumerable).assertTrue();
      expect(descriptor.configurable).assertTrue();
      expect(card.opt('item').title.name).assertEqual("parser-width-descriptor:19:4");
      expect(resolver.calls).assertEqual(5);
      expect(style === group.data[4].style).assertTrue();
    });

    /**
     * @tc.name WidthMutationTest_case_021
     * @tc.desc parser-width-descriptor: parse real layouts and verify independent expected output; input vector 21.
     * @tc.type Function
     * @tc.level Level1
     */
    it('WidthMutationTest_case_021', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-width-descriptor.20";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const group = makeGroup(type, 1, "parser-width-descriptor:20");
      const source = await parser.parse([group]);
      expect(source.totalCount()).assertEqual(1);
      const card = source.getData(0);
      const style: CardStyle = card.opt('style');
      const before = Number.parseFloat(style.width);
      const reads = 2;
      for (let step = 1; step <= reads; step++) {
        expect(Number.parseFloat(style.width)).assertEqual(before - step * 10);
      }
      const descriptor = inspectProperty(style, 'width');
      expect(descriptor.hasGetter).assertTrue();
      expect(descriptor.hasSetter).assertFalse();
      expect(descriptor.enumerable).assertTrue();
      expect(descriptor.configurable).assertTrue();
      expect(card.opt('item').title.name).assertEqual("parser-width-descriptor:20:0");
      expect(resolver.calls).assertEqual(1);
      expect(style === group.data[0].style).assertTrue();
    });

    /**
     * @tc.name WidthMutationTest_case_022
     * @tc.desc parser-width-descriptor: parse real layouts and verify independent expected output; input vector 22.
     * @tc.type Function
     * @tc.level Level1
     */
    it('WidthMutationTest_case_022', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-width-descriptor.21";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const group = makeGroup(type, 2, "parser-width-descriptor:21");
      const source = await parser.parse([group]);
      expect(source.totalCount()).assertEqual(2);
      const card = source.getData(1);
      const style: CardStyle = card.opt('style');
      const before = Number.parseFloat(style.width);
      const reads = 3;
      for (let step = 1; step <= reads; step++) {
        expect(Number.parseFloat(style.width)).assertEqual(before - step * 10);
      }
      const descriptor = inspectProperty(style, 'width');
      expect(descriptor.hasGetter).assertTrue();
      expect(descriptor.hasSetter).assertFalse();
      expect(descriptor.enumerable).assertTrue();
      expect(descriptor.configurable).assertTrue();
      expect(card.opt('item').title.name).assertEqual("parser-width-descriptor:21:1");
      expect(resolver.calls).assertEqual(2);
      expect(style === group.data[1].style).assertTrue();
    });

    /**
     * @tc.name WidthMutationTest_case_023
     * @tc.desc parser-width-descriptor: parse real layouts and verify independent expected output; input vector 23.
     * @tc.type Function
     * @tc.level Level1
     */
    it('WidthMutationTest_case_023', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-width-descriptor.22";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const group = makeGroup(type, 3, "parser-width-descriptor:22");
      const source = await parser.parse([group]);
      expect(source.totalCount()).assertEqual(3);
      const card = source.getData(1);
      const style: CardStyle = card.opt('style');
      const before = Number.parseFloat(style.width);
      const reads = 4;
      for (let step = 1; step <= reads; step++) {
        expect(Number.parseFloat(style.width)).assertEqual(before - step * 10);
      }
      const descriptor = inspectProperty(style, 'width');
      expect(descriptor.hasGetter).assertTrue();
      expect(descriptor.hasSetter).assertFalse();
      expect(descriptor.enumerable).assertTrue();
      expect(descriptor.configurable).assertTrue();
      expect(card.opt('item').title.name).assertEqual("parser-width-descriptor:22:1");
      expect(resolver.calls).assertEqual(3);
      expect(style === group.data[1].style).assertTrue();
    });

    /**
     * @tc.name WidthMutationTest_case_024
     * @tc.desc parser-width-descriptor: parse real layouts and verify independent expected output; input vector 24.
     * @tc.type Function
     * @tc.level Level1
     */
    it('WidthMutationTest_case_024', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-width-descriptor.23";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const group = makeGroup(type, 4, "parser-width-descriptor:23");
      const source = await parser.parse([group]);
      expect(source.totalCount()).assertEqual(4);
      const card = source.getData(3);
      const style: CardStyle = card.opt('style');
      const before = Number.parseFloat(style.width);
      const reads = 5;
      for (let step = 1; step <= reads; step++) {
        expect(Number.parseFloat(style.width)).assertEqual(before - step * 10);
      }
      const descriptor = inspectProperty(style, 'width');
      expect(descriptor.hasGetter).assertTrue();
      expect(descriptor.hasSetter).assertFalse();
      expect(descriptor.enumerable).assertTrue();
      expect(descriptor.configurable).assertTrue();
      expect(card.opt('item').title.name).assertEqual("parser-width-descriptor:23:3");
      expect(resolver.calls).assertEqual(4);
      expect(style === group.data[3].style).assertTrue();
    });

    /**
     * @tc.name WidthMutationTest_case_025
     * @tc.desc parser-width-descriptor: parse real layouts and verify independent expected output; input vector 25.
     * @tc.type Function
     * @tc.level Level1
     */
    it('WidthMutationTest_case_025', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-width-descriptor.24";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const group = makeGroup(type, 5, "parser-width-descriptor:24");
      const source = await parser.parse([group]);
      expect(source.totalCount()).assertEqual(5);
      const card = source.getData(4);
      const style: CardStyle = card.opt('style');
      const before = Number.parseFloat(style.width);
      const reads = 2;
      for (let step = 1; step <= reads; step++) {
        expect(Number.parseFloat(style.width)).assertEqual(before - step * 10);
      }
      const descriptor = inspectProperty(style, 'width');
      expect(descriptor.hasGetter).assertTrue();
      expect(descriptor.hasSetter).assertFalse();
      expect(descriptor.enumerable).assertTrue();
      expect(descriptor.configurable).assertTrue();
      expect(card.opt('item').title.name).assertEqual("parser-width-descriptor:24:4");
      expect(resolver.calls).assertEqual(5);
      expect(style === group.data[4].style).assertTrue();
    });

    /**
     * @tc.name WidthMutationTest_case_026
     * @tc.desc parser-width-descriptor: parse real layouts and verify independent expected output; input vector 26.
     * @tc.type Function
     * @tc.level Level1
     */
    it('WidthMutationTest_case_026', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-width-descriptor.25";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const group = makeGroup(type, 1, "parser-width-descriptor:25");
      const source = await parser.parse([group]);
      expect(source.totalCount()).assertEqual(1);
      const card = source.getData(0);
      const style: CardStyle = card.opt('style');
      const before = Number.parseFloat(style.width);
      const reads = 3;
      for (let step = 1; step <= reads; step++) {
        expect(Number.parseFloat(style.width)).assertEqual(before - step * 10);
      }
      const descriptor = inspectProperty(style, 'width');
      expect(descriptor.hasGetter).assertTrue();
      expect(descriptor.hasSetter).assertFalse();
      expect(descriptor.enumerable).assertTrue();
      expect(descriptor.configurable).assertTrue();
      expect(card.opt('item').title.name).assertEqual("parser-width-descriptor:25:0");
      expect(resolver.calls).assertEqual(1);
      expect(style === group.data[0].style).assertTrue();
    });

    /**
     * @tc.name WidthMutationTest_case_027
     * @tc.desc parser-width-descriptor: parse real layouts and verify independent expected output; input vector 27.
     * @tc.type Function
     * @tc.level Level1
     */
    it('WidthMutationTest_case_027', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-width-descriptor.26";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const group = makeGroup(type, 2, "parser-width-descriptor:26");
      const source = await parser.parse([group]);
      expect(source.totalCount()).assertEqual(2);
      const card = source.getData(0);
      const style: CardStyle = card.opt('style');
      const before = Number.parseFloat(style.width);
      const reads = 4;
      for (let step = 1; step <= reads; step++) {
        expect(Number.parseFloat(style.width)).assertEqual(before - step * 10);
      }
      const descriptor = inspectProperty(style, 'width');
      expect(descriptor.hasGetter).assertTrue();
      expect(descriptor.hasSetter).assertFalse();
      expect(descriptor.enumerable).assertTrue();
      expect(descriptor.configurable).assertTrue();
      expect(card.opt('item').title.name).assertEqual("parser-width-descriptor:26:0");
      expect(resolver.calls).assertEqual(2);
      expect(style === group.data[0].style).assertTrue();
    });

    /**
     * @tc.name WidthMutationTest_case_028
     * @tc.desc parser-width-descriptor: parse real layouts and verify independent expected output; input vector 28.
     * @tc.type Function
     * @tc.level Level1
     */
    it('WidthMutationTest_case_028', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-width-descriptor.27";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const group = makeGroup(type, 3, "parser-width-descriptor:27");
      const source = await parser.parse([group]);
      expect(source.totalCount()).assertEqual(3);
      const card = source.getData(0);
      const style: CardStyle = card.opt('style');
      const before = Number.parseFloat(style.width);
      const reads = 5;
      for (let step = 1; step <= reads; step++) {
        expect(Number.parseFloat(style.width)).assertEqual(before - step * 10);
      }
      const descriptor = inspectProperty(style, 'width');
      expect(descriptor.hasGetter).assertTrue();
      expect(descriptor.hasSetter).assertFalse();
      expect(descriptor.enumerable).assertTrue();
      expect(descriptor.configurable).assertTrue();
      expect(card.opt('item').title.name).assertEqual("parser-width-descriptor:27:0");
      expect(resolver.calls).assertEqual(3);
      expect(style === group.data[0].style).assertTrue();
    });

    /**
     * @tc.name WidthMutationTest_case_029
     * @tc.desc parser-width-descriptor: parse real layouts and verify independent expected output; input vector 29.
     * @tc.type Function
     * @tc.level Level1
     */
    it('WidthMutationTest_case_029', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-width-descriptor.28";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const group = makeGroup(type, 4, "parser-width-descriptor:28");
      const source = await parser.parse([group]);
      expect(source.totalCount()).assertEqual(4);
      const card = source.getData(0);
      const style: CardStyle = card.opt('style');
      const before = Number.parseFloat(style.width);
      const reads = 2;
      for (let step = 1; step <= reads; step++) {
        expect(Number.parseFloat(style.width)).assertEqual(before - step * 10);
      }
      const descriptor = inspectProperty(style, 'width');
      expect(descriptor.hasGetter).assertTrue();
      expect(descriptor.hasSetter).assertFalse();
      expect(descriptor.enumerable).assertTrue();
      expect(descriptor.configurable).assertTrue();
      expect(card.opt('item').title.name).assertEqual("parser-width-descriptor:28:0");
      expect(resolver.calls).assertEqual(4);
      expect(style === group.data[0].style).assertTrue();
    });

    /**
     * @tc.name WidthMutationTest_case_030
     * @tc.desc parser-width-descriptor: parse real layouts and verify independent expected output; input vector 30.
     * @tc.type Function
     * @tc.level Level1
     */
    it('WidthMutationTest_case_030', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-width-descriptor.29";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const group = makeGroup(type, 5, "parser-width-descriptor:29");
      const source = await parser.parse([group]);
      expect(source.totalCount()).assertEqual(5);
      const card = source.getData(4);
      const style: CardStyle = card.opt('style');
      const before = Number.parseFloat(style.width);
      const reads = 3;
      for (let step = 1; step <= reads; step++) {
        expect(Number.parseFloat(style.width)).assertEqual(before - step * 10);
      }
      const descriptor = inspectProperty(style, 'width');
      expect(descriptor.hasGetter).assertTrue();
      expect(descriptor.hasSetter).assertFalse();
      expect(descriptor.enumerable).assertTrue();
      expect(descriptor.configurable).assertTrue();
      expect(card.opt('item').title.name).assertEqual("parser-width-descriptor:29:4");
      expect(resolver.calls).assertEqual(5);
      expect(style === group.data[4].style).assertTrue();
    });

    /**
     * @tc.name WidthMutationTest_case_031
     * @tc.desc parser-width-descriptor: parse real layouts and verify independent expected output; input vector 31.
     * @tc.type Function
     * @tc.level Level1
     */
    it('WidthMutationTest_case_031', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-width-descriptor.30";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const group = makeGroup(type, 1, "parser-width-descriptor:30");
      const source = await parser.parse([group]);
      expect(source.totalCount()).assertEqual(1);
      const card = source.getData(0);
      const style: CardStyle = card.opt('style');
      const before = Number.parseFloat(style.width);
      const reads = 4;
      for (let step = 1; step <= reads; step++) {
        expect(Number.parseFloat(style.width)).assertEqual(before - step * 10);
      }
      const descriptor = inspectProperty(style, 'width');
      expect(descriptor.hasGetter).assertTrue();
      expect(descriptor.hasSetter).assertFalse();
      expect(descriptor.enumerable).assertTrue();
      expect(descriptor.configurable).assertTrue();
      expect(card.opt('item').title.name).assertEqual("parser-width-descriptor:30:0");
      expect(resolver.calls).assertEqual(1);
      expect(style === group.data[0].style).assertTrue();
    });

    /**
     * @tc.name WidthMutationTest_case_032
     * @tc.desc parser-width-descriptor: parse real layouts and verify independent expected output; input vector 32.
     * @tc.type Function
     * @tc.level Level1
     */
    it('WidthMutationTest_case_032', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-width-descriptor.31";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const group = makeGroup(type, 2, "parser-width-descriptor:31");
      const source = await parser.parse([group]);
      expect(source.totalCount()).assertEqual(2);
      const card = source.getData(1);
      const style: CardStyle = card.opt('style');
      const before = Number.parseFloat(style.width);
      const reads = 5;
      for (let step = 1; step <= reads; step++) {
        expect(Number.parseFloat(style.width)).assertEqual(before - step * 10);
      }
      const descriptor = inspectProperty(style, 'width');
      expect(descriptor.hasGetter).assertTrue();
      expect(descriptor.hasSetter).assertFalse();
      expect(descriptor.enumerable).assertTrue();
      expect(descriptor.configurable).assertTrue();
      expect(card.opt('item').title.name).assertEqual("parser-width-descriptor:31:1");
      expect(resolver.calls).assertEqual(2);
      expect(style === group.data[1].style).assertTrue();
    });

    /**
     * @tc.name WidthMutationTest_case_033
     * @tc.desc parser-width-descriptor: parse real layouts and verify independent expected output; input vector 33.
     * @tc.type Function
     * @tc.level Level1
     */
    it('WidthMutationTest_case_033', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-width-descriptor.32";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const group = makeGroup(type, 3, "parser-width-descriptor:32");
      const source = await parser.parse([group]);
      expect(source.totalCount()).assertEqual(3);
      const card = source.getData(2);
      const style: CardStyle = card.opt('style');
      const before = Number.parseFloat(style.width);
      const reads = 2;
      for (let step = 1; step <= reads; step++) {
        expect(Number.parseFloat(style.width)).assertEqual(before - step * 10);
      }
      const descriptor = inspectProperty(style, 'width');
      expect(descriptor.hasGetter).assertTrue();
      expect(descriptor.hasSetter).assertFalse();
      expect(descriptor.enumerable).assertTrue();
      expect(descriptor.configurable).assertTrue();
      expect(card.opt('item').title.name).assertEqual("parser-width-descriptor:32:2");
      expect(resolver.calls).assertEqual(3);
      expect(style === group.data[2].style).assertTrue();
    });

    /**
     * @tc.name WidthMutationTest_case_034
     * @tc.desc parser-width-descriptor: parse real layouts and verify independent expected output; input vector 34.
     * @tc.type Function
     * @tc.level Level1
     */
    it('WidthMutationTest_case_034', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-width-descriptor.33";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const group = makeGroup(type, 4, "parser-width-descriptor:33");
      const source = await parser.parse([group]);
      expect(source.totalCount()).assertEqual(4);
      const card = source.getData(1);
      const style: CardStyle = card.opt('style');
      const before = Number.parseFloat(style.width);
      const reads = 3;
      for (let step = 1; step <= reads; step++) {
        expect(Number.parseFloat(style.width)).assertEqual(before - step * 10);
      }
      const descriptor = inspectProperty(style, 'width');
      expect(descriptor.hasGetter).assertTrue();
      expect(descriptor.hasSetter).assertFalse();
      expect(descriptor.enumerable).assertTrue();
      expect(descriptor.configurable).assertTrue();
      expect(card.opt('item').title.name).assertEqual("parser-width-descriptor:33:1");
      expect(resolver.calls).assertEqual(4);
      expect(style === group.data[1].style).assertTrue();
    });

    /**
     * @tc.name WidthMutationTest_case_035
     * @tc.desc parser-width-descriptor: parse real layouts and verify independent expected output; input vector 35.
     * @tc.type Function
     * @tc.level Level1
     */
    it('WidthMutationTest_case_035', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-width-descriptor.34";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const group = makeGroup(type, 5, "parser-width-descriptor:34");
      const source = await parser.parse([group]);
      expect(source.totalCount()).assertEqual(5);
      const card = source.getData(4);
      const style: CardStyle = card.opt('style');
      const before = Number.parseFloat(style.width);
      const reads = 4;
      for (let step = 1; step <= reads; step++) {
        expect(Number.parseFloat(style.width)).assertEqual(before - step * 10);
      }
      const descriptor = inspectProperty(style, 'width');
      expect(descriptor.hasGetter).assertTrue();
      expect(descriptor.hasSetter).assertFalse();
      expect(descriptor.enumerable).assertTrue();
      expect(descriptor.configurable).assertTrue();
      expect(card.opt('item').title.name).assertEqual("parser-width-descriptor:34:4");
      expect(resolver.calls).assertEqual(5);
      expect(style === group.data[4].style).assertTrue();
    });

    /**
     * @tc.name WidthMutationTest_case_036
     * @tc.desc parser-width-descriptor: parse real layouts and verify independent expected output; input vector 36.
     * @tc.type Function
     * @tc.level Level1
     */
    it('WidthMutationTest_case_036', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-width-descriptor.35";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const group = makeGroup(type, 1, "parser-width-descriptor:35");
      const source = await parser.parse([group]);
      expect(source.totalCount()).assertEqual(1);
      const card = source.getData(0);
      const style: CardStyle = card.opt('style');
      const before = Number.parseFloat(style.width);
      const reads = 5;
      for (let step = 1; step <= reads; step++) {
        expect(Number.parseFloat(style.width)).assertEqual(before - step * 10);
      }
      const descriptor = inspectProperty(style, 'width');
      expect(descriptor.hasGetter).assertTrue();
      expect(descriptor.hasSetter).assertFalse();
      expect(descriptor.enumerable).assertTrue();
      expect(descriptor.configurable).assertTrue();
      expect(card.opt('item').title.name).assertEqual("parser-width-descriptor:35:0");
      expect(resolver.calls).assertEqual(1);
      expect(style === group.data[0].style).assertTrue();
    });

    /**
     * @tc.name WidthMutationTest_case_037
     * @tc.desc parser-width-descriptor: parse real layouts and verify independent expected output; input vector 37.
     * @tc.type Function
     * @tc.level Level1
     */
    it('WidthMutationTest_case_037', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-width-descriptor.36";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const group = makeGroup(type, 2, "parser-width-descriptor:36");
      const source = await parser.parse([group]);
      expect(source.totalCount()).assertEqual(2);
      const card = source.getData(0);
      const style: CardStyle = card.opt('style');
      const before = Number.parseFloat(style.width);
      const reads = 2;
      for (let step = 1; step <= reads; step++) {
        expect(Number.parseFloat(style.width)).assertEqual(before - step * 10);
      }
      const descriptor = inspectProperty(style, 'width');
      expect(descriptor.hasGetter).assertTrue();
      expect(descriptor.hasSetter).assertFalse();
      expect(descriptor.enumerable).assertTrue();
      expect(descriptor.configurable).assertTrue();
      expect(card.opt('item').title.name).assertEqual("parser-width-descriptor:36:0");
      expect(resolver.calls).assertEqual(2);
      expect(style === group.data[0].style).assertTrue();
    });

    /**
     * @tc.name WidthMutationTest_case_038
     * @tc.desc parser-width-descriptor: parse real layouts and verify independent expected output; input vector 38.
     * @tc.type Function
     * @tc.level Level1
     */
    it('WidthMutationTest_case_038', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-width-descriptor.37";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const group = makeGroup(type, 3, "parser-width-descriptor:37");
      const source = await parser.parse([group]);
      expect(source.totalCount()).assertEqual(3);
      const card = source.getData(1);
      const style: CardStyle = card.opt('style');
      const before = Number.parseFloat(style.width);
      const reads = 3;
      for (let step = 1; step <= reads; step++) {
        expect(Number.parseFloat(style.width)).assertEqual(before - step * 10);
      }
      const descriptor = inspectProperty(style, 'width');
      expect(descriptor.hasGetter).assertTrue();
      expect(descriptor.hasSetter).assertFalse();
      expect(descriptor.enumerable).assertTrue();
      expect(descriptor.configurable).assertTrue();
      expect(card.opt('item').title.name).assertEqual("parser-width-descriptor:37:1");
      expect(resolver.calls).assertEqual(3);
      expect(style === group.data[1].style).assertTrue();
    });

    /**
     * @tc.name WidthMutationTest_case_039
     * @tc.desc parser-width-descriptor: parse real layouts and verify independent expected output; input vector 39.
     * @tc.type Function
     * @tc.level Level1
     */
    it('WidthMutationTest_case_039', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-width-descriptor.38";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const group = makeGroup(type, 4, "parser-width-descriptor:38");
      const source = await parser.parse([group]);
      expect(source.totalCount()).assertEqual(4);
      const card = source.getData(2);
      const style: CardStyle = card.opt('style');
      const before = Number.parseFloat(style.width);
      const reads = 4;
      for (let step = 1; step <= reads; step++) {
        expect(Number.parseFloat(style.width)).assertEqual(before - step * 10);
      }
      const descriptor = inspectProperty(style, 'width');
      expect(descriptor.hasGetter).assertTrue();
      expect(descriptor.hasSetter).assertFalse();
      expect(descriptor.enumerable).assertTrue();
      expect(descriptor.configurable).assertTrue();
      expect(card.opt('item').title.name).assertEqual("parser-width-descriptor:38:2");
      expect(resolver.calls).assertEqual(4);
      expect(style === group.data[2].style).assertTrue();
    });

    /**
     * @tc.name WidthMutationTest_case_040
     * @tc.desc parser-width-descriptor: parse real layouts and verify independent expected output; input vector 40.
     * @tc.type Function
     * @tc.level Level1
     */
    it('WidthMutationTest_case_040', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-width-descriptor.39";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const group = makeGroup(type, 5, "parser-width-descriptor:39");
      const source = await parser.parse([group]);
      expect(source.totalCount()).assertEqual(5);
      const card = source.getData(4);
      const style: CardStyle = card.opt('style');
      const before = Number.parseFloat(style.width);
      const reads = 5;
      for (let step = 1; step <= reads; step++) {
        expect(Number.parseFloat(style.width)).assertEqual(before - step * 10);
      }
      const descriptor = inspectProperty(style, 'width');
      expect(descriptor.hasGetter).assertTrue();
      expect(descriptor.hasSetter).assertFalse();
      expect(descriptor.enumerable).assertTrue();
      expect(descriptor.configurable).assertTrue();
      expect(card.opt('item').title.name).assertEqual("parser-width-descriptor:39:4");
      expect(resolver.calls).assertEqual(5);
      expect(style === group.data[4].style).assertTrue();
    });

    /**
     * @tc.name WidthMutationTest_case_041
     * @tc.desc parser-width-descriptor: parse real layouts and verify independent expected output; input vector 41.
     * @tc.type Function
     * @tc.level Level1
     */
    it('WidthMutationTest_case_041', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-width-descriptor.40";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const group = makeGroup(type, 1, "parser-width-descriptor:40");
      const source = await parser.parse([group]);
      expect(source.totalCount()).assertEqual(1);
      const card = source.getData(0);
      const style: CardStyle = card.opt('style');
      const before = Number.parseFloat(style.width);
      const reads = 2;
      for (let step = 1; step <= reads; step++) {
        expect(Number.parseFloat(style.width)).assertEqual(before - step * 10);
      }
      const descriptor = inspectProperty(style, 'width');
      expect(descriptor.hasGetter).assertTrue();
      expect(descriptor.hasSetter).assertFalse();
      expect(descriptor.enumerable).assertTrue();
      expect(descriptor.configurable).assertTrue();
      expect(card.opt('item').title.name).assertEqual("parser-width-descriptor:40:0");
      expect(resolver.calls).assertEqual(1);
      expect(style === group.data[0].style).assertTrue();
    });
  });
}
