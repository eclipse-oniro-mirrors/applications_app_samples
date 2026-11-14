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

// Reference: ets/test/Integration/UserScenarios.test.ets
// Original line floor: 751; scenario family: parser-sample.
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

export default function SampleLayoutTest(): void {
  describe('SampleLayoutTest', () => {
    beforeAll(() => {
      logSuite('SampleLayoutTest', 'begin');
    });
    beforeEach(async () => {
      // Yield between cases so device watchdog and UI events can be processed.
      await new Promise<void>((resolve) => { setTimeout(resolve, 1); });
    });
    afterAll(() => {
      logSuite('SampleLayoutTest', 'end');
    });

    /**
     * @tc.name SampleLayoutTest_case_001
     * @tc.desc parser-sample: parse real layouts and verify independent expected output; input vector 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SampleLayoutTest_case_001', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-sample.0";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const input: LayoutGroup[] = JSON.parse(JSON.stringify(bundledLayout.layoutData));
      input[0].type = type;
      input[0].data[0].item.title.name = "";
      const expectedTitles: string[] = [];
      for (const payload of input[0].data) {
        expectedTitles.push(payload.item.title.name);
      }
      const source = await parser.parse(input);
      expect(source.totalCount()).assertEqual(3);
      expect(snapshotTitles(source)).assertDeepEquals(expectedTitles);
      expect(resolver.calls).assertEqual(3);
      for (let index = 0; index < 3; index++) {
        expect(source.getData(index).type).assertEqual(type);
        expect(source.getData(index).opt('style') !== undefined).assertTrue();
      }
      assertUniqueIds(source);
    });

    /**
     * @tc.name SampleLayoutTest_case_002
     * @tc.desc parser-sample: parse real layouts and verify independent expected output; input vector 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SampleLayoutTest_case_002', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-sample.1";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const input: LayoutGroup[] = JSON.parse(JSON.stringify(bundledLayout.layoutData));
      input[0].type = type;
      input[0].data[1].item.title.name = "Card";
      const expectedTitles: string[] = [];
      for (const payload of input[0].data) {
        expectedTitles.push(payload.item.title.name);
      }
      const source = await parser.parse(JSON.stringify(input));
      expect(source.totalCount()).assertEqual(3);
      expect(snapshotTitles(source)).assertDeepEquals(expectedTitles);
      expect(resolver.calls).assertEqual(3);
      for (let index = 0; index < 3; index++) {
        expect(source.getData(index).type).assertEqual(type);
        expect(source.getData(index).opt('style') !== undefined).assertTrue();
      }
      assertUniqueIds(source);
    });

    /**
     * @tc.name SampleLayoutTest_case_003
     * @tc.desc parser-sample: parse real layouts and verify independent expected output; input vector 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SampleLayoutTest_case_003', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-sample.2";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const input: LayoutGroup[] = JSON.parse(JSON.stringify(bundledLayout.layoutData));
      input[0].type = type;
      input[0].data[2].item.title.name = " ";
      const expectedTitles: string[] = [];
      for (const payload of input[0].data) {
        expectedTitles.push(payload.item.title.name);
      }
      const source = await parser.parse(input);
      expect(source.totalCount()).assertEqual(3);
      expect(snapshotTitles(source)).assertDeepEquals(expectedTitles);
      expect(resolver.calls).assertEqual(3);
      for (let index = 0; index < 3; index++) {
        expect(source.getData(index).type).assertEqual(type);
        expect(source.getData(index).opt('style') !== undefined).assertTrue();
      }
      assertUniqueIds(source);
    });

    /**
     * @tc.name SampleLayoutTest_case_004
     * @tc.desc parser-sample: parse real layouts and verify independent expected output; input vector 4.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SampleLayoutTest_case_004', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-sample.3";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const input: LayoutGroup[] = JSON.parse(JSON.stringify(bundledLayout.layoutData));
      input[0].type = type;
      input[0].data[0].item.title.name = "  padded  ";
      const expectedTitles: string[] = [];
      for (const payload of input[0].data) {
        expectedTitles.push(payload.item.title.name);
      }
      const source = await parser.parse(JSON.stringify(input));
      expect(source.totalCount()).assertEqual(3);
      expect(snapshotTitles(source)).assertDeepEquals(expectedTitles);
      expect(resolver.calls).assertEqual(3);
      for (let index = 0; index < 3; index++) {
        expect(source.getData(index).type).assertEqual(type);
        expect(source.getData(index).opt('style') !== undefined).assertTrue();
      }
      assertUniqueIds(source);
    });

    /**
     * @tc.name SampleLayoutTest_case_005
     * @tc.desc parser-sample: parse real layouts and verify independent expected output; input vector 5.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SampleLayoutTest_case_005', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-sample.4";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const input: LayoutGroup[] = JSON.parse(JSON.stringify(bundledLayout.layoutData));
      input[0].type = type;
      input[0].data[1].item.title.name = "multi word title";
      const expectedTitles: string[] = [];
      for (const payload of input[0].data) {
        expectedTitles.push(payload.item.title.name);
      }
      const source = await parser.parse(input);
      expect(source.totalCount()).assertEqual(3);
      expect(snapshotTitles(source)).assertDeepEquals(expectedTitles);
      expect(resolver.calls).assertEqual(3);
      for (let index = 0; index < 3; index++) {
        expect(source.getData(index).type).assertEqual(type);
        expect(source.getData(index).opt('style') !== undefined).assertTrue();
      }
      assertUniqueIds(source);
    });

    /**
     * @tc.name SampleLayoutTest_case_006
     * @tc.desc parser-sample: parse real layouts and verify independent expected output; input vector 6.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SampleLayoutTest_case_006', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-sample.5";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const input: LayoutGroup[] = JSON.parse(JSON.stringify(bundledLayout.layoutData));
      input[0].type = type;
      input[0].data[2].item.title.name = "line\nbreak";
      const expectedTitles: string[] = [];
      for (const payload of input[0].data) {
        expectedTitles.push(payload.item.title.name);
      }
      const source = await parser.parse(JSON.stringify(input));
      expect(source.totalCount()).assertEqual(3);
      expect(snapshotTitles(source)).assertDeepEquals(expectedTitles);
      expect(resolver.calls).assertEqual(3);
      for (let index = 0; index < 3; index++) {
        expect(source.getData(index).type).assertEqual(type);
        expect(source.getData(index).opt('style') !== undefined).assertTrue();
      }
      assertUniqueIds(source);
    });

    /**
     * @tc.name SampleLayoutTest_case_007
     * @tc.desc parser-sample: parse real layouts and verify independent expected output; input vector 7.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SampleLayoutTest_case_007', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-sample.6";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const input: LayoutGroup[] = JSON.parse(JSON.stringify(bundledLayout.layoutData));
      input[0].type = type;
      input[0].data[0].item.title.name = "tab\tvalue";
      const expectedTitles: string[] = [];
      for (const payload of input[0].data) {
        expectedTitles.push(payload.item.title.name);
      }
      const source = await parser.parse(input);
      expect(source.totalCount()).assertEqual(3);
      expect(snapshotTitles(source)).assertDeepEquals(expectedTitles);
      expect(resolver.calls).assertEqual(3);
      for (let index = 0; index < 3; index++) {
        expect(source.getData(index).type).assertEqual(type);
        expect(source.getData(index).opt('style') !== undefined).assertTrue();
      }
      assertUniqueIds(source);
    });

    /**
     * @tc.name SampleLayoutTest_case_008
     * @tc.desc parser-sample: parse real layouts and verify independent expected output; input vector 8.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SampleLayoutTest_case_008', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-sample.7";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const input: LayoutGroup[] = JSON.parse(JSON.stringify(bundledLayout.layoutData));
      input[0].type = type;
      input[0].data[1].item.title.name = "\u5361\u7247 1";
      const expectedTitles: string[] = [];
      for (const payload of input[0].data) {
        expectedTitles.push(payload.item.title.name);
      }
      const source = await parser.parse(JSON.stringify(input));
      expect(source.totalCount()).assertEqual(3);
      expect(snapshotTitles(source)).assertDeepEquals(expectedTitles);
      expect(resolver.calls).assertEqual(3);
      for (let index = 0; index < 3; index++) {
        expect(source.getData(index).type).assertEqual(type);
        expect(source.getData(index).opt('style') !== undefined).assertTrue();
      }
      assertUniqueIds(source);
    });

    /**
     * @tc.name SampleLayoutTest_case_009
     * @tc.desc parser-sample: parse real layouts and verify independent expected output; input vector 9.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SampleLayoutTest_case_009', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-sample.8";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const input: LayoutGroup[] = JSON.parse(JSON.stringify(bundledLayout.layoutData));
      input[0].type = type;
      input[0].data[2].item.title.name = "\u5361\u7247 2";
      const expectedTitles: string[] = [];
      for (const payload of input[0].data) {
        expectedTitles.push(payload.item.title.name);
      }
      const source = await parser.parse(input);
      expect(source.totalCount()).assertEqual(3);
      expect(snapshotTitles(source)).assertDeepEquals(expectedTitles);
      expect(resolver.calls).assertEqual(3);
      for (let index = 0; index < 3; index++) {
        expect(source.getData(index).type).assertEqual(type);
        expect(source.getData(index).opt('style') !== undefined).assertTrue();
      }
      assertUniqueIds(source);
    });

    /**
     * @tc.name SampleLayoutTest_case_010
     * @tc.desc parser-sample: parse real layouts and verify independent expected output; input vector 10.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SampleLayoutTest_case_010', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-sample.9";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const input: LayoutGroup[] = JSON.parse(JSON.stringify(bundledLayout.layoutData));
      input[0].type = type;
      input[0].data[0].item.title.name = "\u5361\u7247 3";
      const expectedTitles: string[] = [];
      for (const payload of input[0].data) {
        expectedTitles.push(payload.item.title.name);
      }
      const source = await parser.parse(JSON.stringify(input));
      expect(source.totalCount()).assertEqual(3);
      expect(snapshotTitles(source)).assertDeepEquals(expectedTitles);
      expect(resolver.calls).assertEqual(3);
      for (let index = 0; index < 3; index++) {
        expect(source.getData(index).type).assertEqual(type);
        expect(source.getData(index).opt('style') !== undefined).assertTrue();
      }
      assertUniqueIds(source);
    });

    /**
     * @tc.name SampleLayoutTest_case_011
     * @tc.desc parser-sample: parse real layouts and verify independent expected output; input vector 11.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SampleLayoutTest_case_011', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-sample.10";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const input: LayoutGroup[] = JSON.parse(JSON.stringify(bundledLayout.layoutData));
      input[0].type = type;
      input[0].data[1].item.title.name = "\u65e5\u672c\u8a9e";
      const expectedTitles: string[] = [];
      for (const payload of input[0].data) {
        expectedTitles.push(payload.item.title.name);
      }
      const source = await parser.parse(input);
      expect(source.totalCount()).assertEqual(3);
      expect(snapshotTitles(source)).assertDeepEquals(expectedTitles);
      expect(resolver.calls).assertEqual(3);
      for (let index = 0; index < 3; index++) {
        expect(source.getData(index).type).assertEqual(type);
        expect(source.getData(index).opt('style') !== undefined).assertTrue();
      }
      assertUniqueIds(source);
    });

    /**
     * @tc.name SampleLayoutTest_case_012
     * @tc.desc parser-sample: parse real layouts and verify independent expected output; input vector 12.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SampleLayoutTest_case_012', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-sample.11";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const input: LayoutGroup[] = JSON.parse(JSON.stringify(bundledLayout.layoutData));
      input[0].type = type;
      input[0].data[2].item.title.name = "\u0645\u0631\u062d\u0628\u0627";
      const expectedTitles: string[] = [];
      for (const payload of input[0].data) {
        expectedTitles.push(payload.item.title.name);
      }
      const source = await parser.parse(JSON.stringify(input));
      expect(source.totalCount()).assertEqual(3);
      expect(snapshotTitles(source)).assertDeepEquals(expectedTitles);
      expect(resolver.calls).assertEqual(3);
      for (let index = 0; index < 3; index++) {
        expect(source.getData(index).type).assertEqual(type);
        expect(source.getData(index).opt('style') !== undefined).assertTrue();
      }
      assertUniqueIds(source);
    });

    /**
     * @tc.name SampleLayoutTest_case_013
     * @tc.desc parser-sample: parse real layouts and verify independent expected output; input vector 13.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SampleLayoutTest_case_013', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-sample.12";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const input: LayoutGroup[] = JSON.parse(JSON.stringify(bundledLayout.layoutData));
      input[0].type = type;
      input[0].data[0].item.title.name = "\u05e9\u05dc\u05d5\u05dd";
      const expectedTitles: string[] = [];
      for (const payload of input[0].data) {
        expectedTitles.push(payload.item.title.name);
      }
      const source = await parser.parse(input);
      expect(source.totalCount()).assertEqual(3);
      expect(snapshotTitles(source)).assertDeepEquals(expectedTitles);
      expect(resolver.calls).assertEqual(3);
      for (let index = 0; index < 3; index++) {
        expect(source.getData(index).type).assertEqual(type);
        expect(source.getData(index).opt('style') !== undefined).assertTrue();
      }
      assertUniqueIds(source);
    });

    /**
     * @tc.name SampleLayoutTest_case_014
     * @tc.desc parser-sample: parse real layouts and verify independent expected output; input vector 14.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SampleLayoutTest_case_014', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-sample.13";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const input: LayoutGroup[] = JSON.parse(JSON.stringify(bundledLayout.layoutData));
      input[0].type = type;
      input[0].data[1].item.title.name = "e\u0301";
      const expectedTitles: string[] = [];
      for (const payload of input[0].data) {
        expectedTitles.push(payload.item.title.name);
      }
      const source = await parser.parse(JSON.stringify(input));
      expect(source.totalCount()).assertEqual(3);
      expect(snapshotTitles(source)).assertDeepEquals(expectedTitles);
      expect(resolver.calls).assertEqual(3);
      for (let index = 0; index < 3; index++) {
        expect(source.getData(index).type).assertEqual(type);
        expect(source.getData(index).opt('style') !== undefined).assertTrue();
      }
      assertUniqueIds(source);
    });

    /**
     * @tc.name SampleLayoutTest_case_015
     * @tc.desc parser-sample: parse real layouts and verify independent expected output; input vector 15.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SampleLayoutTest_case_015', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-sample.14";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const input: LayoutGroup[] = JSON.parse(JSON.stringify(bundledLayout.layoutData));
      input[0].type = type;
      input[0].data[2].item.title.name = "\u00e9";
      const expectedTitles: string[] = [];
      for (const payload of input[0].data) {
        expectedTitles.push(payload.item.title.name);
      }
      const source = await parser.parse(input);
      expect(source.totalCount()).assertEqual(3);
      expect(snapshotTitles(source)).assertDeepEquals(expectedTitles);
      expect(resolver.calls).assertEqual(3);
      for (let index = 0; index < 3; index++) {
        expect(source.getData(index).type).assertEqual(type);
        expect(source.getData(index).opt('style') !== undefined).assertTrue();
      }
      assertUniqueIds(source);
    });

    /**
     * @tc.name SampleLayoutTest_case_016
     * @tc.desc parser-sample: parse real layouts and verify independent expected output; input vector 16.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SampleLayoutTest_case_016', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-sample.15";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const input: LayoutGroup[] = JSON.parse(JSON.stringify(bundledLayout.layoutData));
      input[0].type = type;
      input[0].data[0].item.title.name = "\ud83d\ude80";
      const expectedTitles: string[] = [];
      for (const payload of input[0].data) {
        expectedTitles.push(payload.item.title.name);
      }
      const source = await parser.parse(JSON.stringify(input));
      expect(source.totalCount()).assertEqual(3);
      expect(snapshotTitles(source)).assertDeepEquals(expectedTitles);
      expect(resolver.calls).assertEqual(3);
      for (let index = 0; index < 3; index++) {
        expect(source.getData(index).type).assertEqual(type);
        expect(source.getData(index).opt('style') !== undefined).assertTrue();
      }
      assertUniqueIds(source);
    });

    /**
     * @tc.name SampleLayoutTest_case_017
     * @tc.desc parser-sample: parse real layouts and verify independent expected output; input vector 17.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SampleLayoutTest_case_017', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-sample.16";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const input: LayoutGroup[] = JSON.parse(JSON.stringify(bundledLayout.layoutData));
      input[0].type = type;
      input[0].data[1].item.title.name = "quote\"slash\\";
      const expectedTitles: string[] = [];
      for (const payload of input[0].data) {
        expectedTitles.push(payload.item.title.name);
      }
      const source = await parser.parse(input);
      expect(source.totalCount()).assertEqual(3);
      expect(snapshotTitles(source)).assertDeepEquals(expectedTitles);
      expect(resolver.calls).assertEqual(3);
      for (let index = 0; index < 3; index++) {
        expect(source.getData(index).type).assertEqual(type);
        expect(source.getData(index).opt('style') !== undefined).assertTrue();
      }
      assertUniqueIds(source);
    });

    /**
     * @tc.name SampleLayoutTest_case_018
     * @tc.desc parser-sample: parse real layouts and verify independent expected output; input vector 18.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SampleLayoutTest_case_018', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-sample.17";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const input: LayoutGroup[] = JSON.parse(JSON.stringify(bundledLayout.layoutData));
      input[0].type = type;
      input[0].data[2].item.title.name = "<script>alert(1)</script>";
      const expectedTitles: string[] = [];
      for (const payload of input[0].data) {
        expectedTitles.push(payload.item.title.name);
      }
      const source = await parser.parse(JSON.stringify(input));
      expect(source.totalCount()).assertEqual(3);
      expect(snapshotTitles(source)).assertDeepEquals(expectedTitles);
      expect(resolver.calls).assertEqual(3);
      for (let index = 0; index < 3; index++) {
        expect(source.getData(index).type).assertEqual(type);
        expect(source.getData(index).opt('style') !== undefined).assertTrue();
      }
      assertUniqueIds(source);
    });

    /**
     * @tc.name SampleLayoutTest_case_019
     * @tc.desc parser-sample: parse real layouts and verify independent expected output; input vector 19.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SampleLayoutTest_case_019', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-sample.18";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const input: LayoutGroup[] = JSON.parse(JSON.stringify(bundledLayout.layoutData));
      input[0].type = type;
      input[0].data[0].item.title.name = "${notExecuted}";
      const expectedTitles: string[] = [];
      for (const payload of input[0].data) {
        expectedTitles.push(payload.item.title.name);
      }
      const source = await parser.parse(input);
      expect(source.totalCount()).assertEqual(3);
      expect(snapshotTitles(source)).assertDeepEquals(expectedTitles);
      expect(resolver.calls).assertEqual(3);
      for (let index = 0; index < 3; index++) {
        expect(source.getData(index).type).assertEqual(type);
        expect(source.getData(index).opt('style') !== undefined).assertTrue();
      }
      assertUniqueIds(source);
    });

    /**
     * @tc.name SampleLayoutTest_case_020
     * @tc.desc parser-sample: parse real layouts and verify independent expected output; input vector 20.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SampleLayoutTest_case_020', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-sample.19";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const input: LayoutGroup[] = JSON.parse(JSON.stringify(bundledLayout.layoutData));
      input[0].type = type;
      input[0].data[1].item.title.name = "__proto__";
      const expectedTitles: string[] = [];
      for (const payload of input[0].data) {
        expectedTitles.push(payload.item.title.name);
      }
      const source = await parser.parse(JSON.stringify(input));
      expect(source.totalCount()).assertEqual(3);
      expect(snapshotTitles(source)).assertDeepEquals(expectedTitles);
      expect(resolver.calls).assertEqual(3);
      for (let index = 0; index < 3; index++) {
        expect(source.getData(index).type).assertEqual(type);
        expect(source.getData(index).opt('style') !== undefined).assertTrue();
      }
      assertUniqueIds(source);
    });

    /**
     * @tc.name SampleLayoutTest_case_021
     * @tc.desc parser-sample: parse real layouts and verify independent expected output; input vector 21.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SampleLayoutTest_case_021', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-sample.20";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const input: LayoutGroup[] = JSON.parse(JSON.stringify(bundledLayout.layoutData));
      input[0].type = type;
      input[0].data[2].item.title.name = "constructor";
      const expectedTitles: string[] = [];
      for (const payload of input[0].data) {
        expectedTitles.push(payload.item.title.name);
      }
      const source = await parser.parse(input);
      expect(source.totalCount()).assertEqual(3);
      expect(snapshotTitles(source)).assertDeepEquals(expectedTitles);
      expect(resolver.calls).assertEqual(3);
      for (let index = 0; index < 3; index++) {
        expect(source.getData(index).type).assertEqual(type);
        expect(source.getData(index).opt('style') !== undefined).assertTrue();
      }
      assertUniqueIds(source);
    });

    /**
     * @tc.name SampleLayoutTest_case_022
     * @tc.desc parser-sample: parse real layouts and verify independent expected output; input vector 22.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SampleLayoutTest_case_022', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-sample.21";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const input: LayoutGroup[] = JSON.parse(JSON.stringify(bundledLayout.layoutData));
      input[0].type = type;
      input[0].data[0].item.title.name = "null";
      const expectedTitles: string[] = [];
      for (const payload of input[0].data) {
        expectedTitles.push(payload.item.title.name);
      }
      const source = await parser.parse(JSON.stringify(input));
      expect(source.totalCount()).assertEqual(3);
      expect(snapshotTitles(source)).assertDeepEquals(expectedTitles);
      expect(resolver.calls).assertEqual(3);
      for (let index = 0; index < 3; index++) {
        expect(source.getData(index).type).assertEqual(type);
        expect(source.getData(index).opt('style') !== undefined).assertTrue();
      }
      assertUniqueIds(source);
    });

    /**
     * @tc.name SampleLayoutTest_case_023
     * @tc.desc parser-sample: parse real layouts and verify independent expected output; input vector 23.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SampleLayoutTest_case_023', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-sample.22";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const input: LayoutGroup[] = JSON.parse(JSON.stringify(bundledLayout.layoutData));
      input[0].type = type;
      input[0].data[1].item.title.name = "false";
      const expectedTitles: string[] = [];
      for (const payload of input[0].data) {
        expectedTitles.push(payload.item.title.name);
      }
      const source = await parser.parse(input);
      expect(source.totalCount()).assertEqual(3);
      expect(snapshotTitles(source)).assertDeepEquals(expectedTitles);
      expect(resolver.calls).assertEqual(3);
      for (let index = 0; index < 3; index++) {
        expect(source.getData(index).type).assertEqual(type);
        expect(source.getData(index).opt('style') !== undefined).assertTrue();
      }
      assertUniqueIds(source);
    });

    /**
     * @tc.name SampleLayoutTest_case_024
     * @tc.desc parser-sample: parse real layouts and verify independent expected output; input vector 24.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SampleLayoutTest_case_024', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-sample.23";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const input: LayoutGroup[] = JSON.parse(JSON.stringify(bundledLayout.layoutData));
      input[0].type = type;
      input[0].data[2].item.title.name = "0";
      const expectedTitles: string[] = [];
      for (const payload of input[0].data) {
        expectedTitles.push(payload.item.title.name);
      }
      const source = await parser.parse(JSON.stringify(input));
      expect(source.totalCount()).assertEqual(3);
      expect(snapshotTitles(source)).assertDeepEquals(expectedTitles);
      expect(resolver.calls).assertEqual(3);
      for (let index = 0; index < 3; index++) {
        expect(source.getData(index).type).assertEqual(type);
        expect(source.getData(index).opt('style') !== undefined).assertTrue();
      }
      assertUniqueIds(source);
    });
  });
}
