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

// Reference: ets/test/LifecycleState/StateRecovery.test.ets
// Original line floor: 299; scenario family: parser-retry.
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

export default function RetryAfterFailureTest(): void {
  describe('RetryAfterFailureTest', () => {
    beforeAll(() => {
      logSuite('RetryAfterFailureTest', 'begin');
    });
    beforeEach(async () => {
      // Yield between cases so device watchdog and UI events can be processed.
      await new Promise<void>((resolve) => { setTimeout(resolve, 1); });
    });
    afterAll(() => {
      logSuite('RetryAfterFailureTest', 'end');
    });

    /**
     * @tc.name RetryAfterFailureTest_case_001
     * @tc.desc parser-retry: parse real layouts and verify independent expected output; input vector 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('RetryAfterFailureTest_case_001', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-retry.0";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const invalid = "";
      let caught = false;
      try {
        await parser.parse(invalid);
      } catch (error) {
        caught = true;
        expect(error instanceof SyntaxError).assertTrue();
      }
      expect(caught).assertTrue();
      expect(resolver.calls).assertEqual(0);
      const valid = makeGroup(type, 1, "parser-retry:0");
      const recovered = await parser.parse([valid]);
      await assertSource(recovered, type, 1, "parser-retry:0");
      expect(resolver.calls).assertEqual(1);
      expect(resolver.models.length).assertEqual(1);
      expect(recovered.getData(0).data === valid.data[0]).assertTrue();
    });

    /**
     * @tc.name RetryAfterFailureTest_case_002
     * @tc.desc parser-retry: parse real layouts and verify independent expected output; input vector 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('RetryAfterFailureTest_case_002', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-retry.1";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const invalid = " ";
      let caught = false;
      try {
        await parser.parse(invalid);
      } catch (error) {
        caught = true;
        expect(error instanceof SyntaxError).assertTrue();
      }
      expect(caught).assertTrue();
      expect(resolver.calls).assertEqual(0);
      const valid = makeGroup(type, 2, "parser-retry:1");
      const recovered = await parser.parse([valid]);
      await assertSource(recovered, type, 2, "parser-retry:1");
      expect(resolver.calls).assertEqual(2);
      expect(resolver.models.length).assertEqual(2);
      expect(recovered.getData(0).data === valid.data[0]).assertTrue();
    });

    /**
     * @tc.name RetryAfterFailureTest_case_003
     * @tc.desc parser-retry: parse real layouts and verify independent expected output; input vector 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('RetryAfterFailureTest_case_003', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-retry.2";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const invalid = "{";
      let caught = false;
      try {
        await parser.parse(invalid);
      } catch (error) {
        caught = true;
        expect(error instanceof SyntaxError).assertTrue();
      }
      expect(caught).assertTrue();
      expect(resolver.calls).assertEqual(0);
      const valid = makeGroup(type, 3, "parser-retry:2");
      const recovered = await parser.parse([valid]);
      await assertSource(recovered, type, 3, "parser-retry:2");
      expect(resolver.calls).assertEqual(3);
      expect(resolver.models.length).assertEqual(3);
      expect(recovered.getData(0).data === valid.data[0]).assertTrue();
    });

    /**
     * @tc.name RetryAfterFailureTest_case_004
     * @tc.desc parser-retry: parse real layouts and verify independent expected output; input vector 4.
     * @tc.type Function
     * @tc.level Level1
     */
    it('RetryAfterFailureTest_case_004', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-retry.3";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const invalid = "[";
      let caught = false;
      try {
        await parser.parse(invalid);
      } catch (error) {
        caught = true;
        expect(error instanceof SyntaxError).assertTrue();
      }
      expect(caught).assertTrue();
      expect(resolver.calls).assertEqual(0);
      const valid = makeGroup(type, 4, "parser-retry:3");
      const recovered = await parser.parse([valid]);
      await assertSource(recovered, type, 4, "parser-retry:3");
      expect(resolver.calls).assertEqual(4);
      expect(resolver.models.length).assertEqual(4);
      expect(recovered.getData(0).data === valid.data[0]).assertTrue();
    });

    /**
     * @tc.name RetryAfterFailureTest_case_005
     * @tc.desc parser-retry: parse real layouts and verify independent expected output; input vector 5.
     * @tc.type Function
     * @tc.level Level1
     */
    it('RetryAfterFailureTest_case_005', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-retry.4";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const invalid = "undefined";
      let caught = false;
      try {
        await parser.parse(invalid);
      } catch (error) {
        caught = true;
        expect(error instanceof SyntaxError).assertTrue();
      }
      expect(caught).assertTrue();
      expect(resolver.calls).assertEqual(0);
      const valid = makeGroup(type, 5, "parser-retry:4");
      const recovered = await parser.parse([valid]);
      await assertSource(recovered, type, 5, "parser-retry:4");
      expect(resolver.calls).assertEqual(5);
      expect(resolver.models.length).assertEqual(5);
      expect(recovered.getData(0).data === valid.data[0]).assertTrue();
    });

    /**
     * @tc.name RetryAfterFailureTest_case_006
     * @tc.desc parser-retry: parse real layouts and verify independent expected output; input vector 6.
     * @tc.type Function
     * @tc.level Level1
     */
    it('RetryAfterFailureTest_case_006', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-retry.5";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const invalid = "{\"type\":}";
      let caught = false;
      try {
        await parser.parse(invalid);
      } catch (error) {
        caught = true;
        expect(error instanceof SyntaxError).assertTrue();
      }
      expect(caught).assertTrue();
      expect(resolver.calls).assertEqual(0);
      const valid = makeGroup(type, 1, "parser-retry:5");
      const recovered = await parser.parse([valid]);
      await assertSource(recovered, type, 1, "parser-retry:5");
      expect(resolver.calls).assertEqual(1);
      expect(resolver.models.length).assertEqual(1);
      expect(recovered.getData(0).data === valid.data[0]).assertTrue();
    });

    /**
     * @tc.name RetryAfterFailureTest_case_007
     * @tc.desc parser-retry: parse real layouts and verify independent expected output; input vector 7.
     * @tc.type Function
     * @tc.level Level1
     */
    it('RetryAfterFailureTest_case_007', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-retry.6";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const invalid = "[1,]";
      let caught = false;
      try {
        await parser.parse(invalid);
      } catch (error) {
        caught = true;
        expect(error instanceof SyntaxError).assertTrue();
      }
      expect(caught).assertTrue();
      expect(resolver.calls).assertEqual(0);
      const valid = makeGroup(type, 2, "parser-retry:6");
      const recovered = await parser.parse([valid]);
      await assertSource(recovered, type, 2, "parser-retry:6");
      expect(resolver.calls).assertEqual(2);
      expect(resolver.models.length).assertEqual(2);
      expect(recovered.getData(0).data === valid.data[0]).assertTrue();
    });

    /**
     * @tc.name RetryAfterFailureTest_case_008
     * @tc.desc parser-retry: parse real layouts and verify independent expected output; input vector 8.
     * @tc.type Function
     * @tc.level Level1
     */
    it('RetryAfterFailureTest_case_008', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-retry.7";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const invalid = "{\"a\":1,}";
      let caught = false;
      try {
        await parser.parse(invalid);
      } catch (error) {
        caught = true;
        expect(error instanceof SyntaxError).assertTrue();
      }
      expect(caught).assertTrue();
      expect(resolver.calls).assertEqual(0);
      const valid = makeGroup(type, 3, "parser-retry:7");
      const recovered = await parser.parse([valid]);
      await assertSource(recovered, type, 3, "parser-retry:7");
      expect(resolver.calls).assertEqual(3);
      expect(resolver.models.length).assertEqual(3);
      expect(recovered.getData(0).data === valid.data[0]).assertTrue();
    });

    /**
     * @tc.name RetryAfterFailureTest_case_009
     * @tc.desc parser-retry: parse real layouts and verify independent expected output; input vector 9.
     * @tc.type Function
     * @tc.level Level1
     */
    it('RetryAfterFailureTest_case_009', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-retry.8";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const invalid = "{unquoted:1}";
      let caught = false;
      try {
        await parser.parse(invalid);
      } catch (error) {
        caught = true;
        expect(error instanceof SyntaxError).assertTrue();
      }
      expect(caught).assertTrue();
      expect(resolver.calls).assertEqual(0);
      const valid = makeGroup(type, 4, "parser-retry:8");
      const recovered = await parser.parse([valid]);
      await assertSource(recovered, type, 4, "parser-retry:8");
      expect(resolver.calls).assertEqual(4);
      expect(resolver.models.length).assertEqual(4);
      expect(recovered.getData(0).data === valid.data[0]).assertTrue();
    });
  });
}
