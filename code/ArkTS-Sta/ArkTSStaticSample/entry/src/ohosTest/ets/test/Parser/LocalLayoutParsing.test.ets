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

// Reference: ets/test/Integration/NetworkConnectivity.test.ets
// Original line floor: 109; scenario family: parser-array.
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

export default function LocalLayoutParsingTest(): void {
  describe('LocalLayoutParsingTest', () => {
    beforeAll(() => {
      logSuite('LocalLayoutParsingTest', 'begin');
    });
    beforeEach(async () => {
      // Yield between cases so device watchdog and UI events can be processed.
      await new Promise<void>((resolve) => { setTimeout(resolve, 1); });
    });
    afterAll(() => {
      logSuite('LocalLayoutParsingTest', 'end');
    });

    /**
     * @tc.name LocalLayoutParsingTest_case_001
     * @tc.desc parser-array: parse real layouts and verify independent expected output; input vector 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('LocalLayoutParsingTest_case_001', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-array.0";
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
     * @tc.name LocalLayoutParsingTest_case_002
     * @tc.desc parser-array: parse real layouts and verify independent expected output; input vector 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('LocalLayoutParsingTest_case_002', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-array.1";
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
  });
}
