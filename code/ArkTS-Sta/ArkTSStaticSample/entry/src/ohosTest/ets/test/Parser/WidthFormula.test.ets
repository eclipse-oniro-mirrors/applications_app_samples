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

// Reference: ets/test/Interaction/ContentScaling.test.ets
// Original line floor: 303; scenario family: parser-width.
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

export default function WidthFormulaTest(): void {
  describe('WidthFormulaTest', () => {
    beforeAll(() => {
      logSuite('WidthFormulaTest', 'begin');
    });
    beforeEach(async () => {
      // Yield between cases so device watchdog and UI events can be processed.
      await new Promise<void>((resolve) => { setTimeout(resolve, 1); });
    });
    afterAll(() => {
      logSuite('WidthFormulaTest', 'end');
    });

    /**
     * @tc.name WidthFormulaTest_case_001
     * @tc.desc parser-width: parse real layouts and verify independent expected output; input vector 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('WidthFormulaTest_case_001', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-width.0";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const group = makeGroup(type, 1, "parser-width:0");
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
      expect(card.opt('item').title.name).assertEqual("parser-width:0:0");
      expect(resolver.calls).assertEqual(1);
      expect(style === group.data[0].style).assertTrue();
    });

    /**
     * @tc.name WidthFormulaTest_case_002
     * @tc.desc parser-width: parse real layouts and verify independent expected output; input vector 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('WidthFormulaTest_case_002', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-width.1";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const group = makeGroup(type, 2, "parser-width:1");
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
      expect(card.opt('item').title.name).assertEqual("parser-width:1:1");
      expect(resolver.calls).assertEqual(2);
      expect(style === group.data[1].style).assertTrue();
    });

    /**
     * @tc.name WidthFormulaTest_case_003
     * @tc.desc parser-width: parse real layouts and verify independent expected output; input vector 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('WidthFormulaTest_case_003', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-width.2";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const group = makeGroup(type, 3, "parser-width:2");
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
      expect(card.opt('item').title.name).assertEqual("parser-width:2:2");
      expect(resolver.calls).assertEqual(3);
      expect(style === group.data[2].style).assertTrue();
    });

    /**
     * @tc.name WidthFormulaTest_case_004
     * @tc.desc parser-width: parse real layouts and verify independent expected output; input vector 4.
     * @tc.type Function
     * @tc.level Level1
     */
    it('WidthFormulaTest_case_004', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-width.3";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const group = makeGroup(type, 4, "parser-width:3");
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
      expect(card.opt('item').title.name).assertEqual("parser-width:3:3");
      expect(resolver.calls).assertEqual(4);
      expect(style === group.data[3].style).assertTrue();
    });

    /**
     * @tc.name WidthFormulaTest_case_005
     * @tc.desc parser-width: parse real layouts and verify independent expected output; input vector 5.
     * @tc.type Function
     * @tc.level Level1
     */
    it('WidthFormulaTest_case_005', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-width.4";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const group = makeGroup(type, 5, "parser-width:4");
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
      expect(card.opt('item').title.name).assertEqual("parser-width:4:4");
      expect(resolver.calls).assertEqual(5);
      expect(style === group.data[4].style).assertTrue();
    });

    /**
     * @tc.name WidthFormulaTest_case_006
     * @tc.desc parser-width: parse real layouts and verify independent expected output; input vector 6.
     * @tc.type Function
     * @tc.level Level1
     */
    it('WidthFormulaTest_case_006', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-width.5";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const group = makeGroup(type, 1, "parser-width:5");
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
      expect(card.opt('item').title.name).assertEqual("parser-width:5:0");
      expect(resolver.calls).assertEqual(1);
      expect(style === group.data[0].style).assertTrue();
    });

    /**
     * @tc.name WidthFormulaTest_case_007
     * @tc.desc parser-width: parse real layouts and verify independent expected output; input vector 7.
     * @tc.type Function
     * @tc.level Level1
     */
    it('WidthFormulaTest_case_007', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-width.6";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const group = makeGroup(type, 2, "parser-width:6");
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
      expect(card.opt('item').title.name).assertEqual("parser-width:6:0");
      expect(resolver.calls).assertEqual(2);
      expect(style === group.data[0].style).assertTrue();
    });

    /**
     * @tc.name WidthFormulaTest_case_008
     * @tc.desc parser-width: parse real layouts and verify independent expected output; input vector 8.
     * @tc.type Function
     * @tc.level Level1
     */
    it('WidthFormulaTest_case_008', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-width.7";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const group = makeGroup(type, 3, "parser-width:7");
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
      expect(card.opt('item').title.name).assertEqual("parser-width:7:1");
      expect(resolver.calls).assertEqual(3);
      expect(style === group.data[1].style).assertTrue();
    });
  });
}
