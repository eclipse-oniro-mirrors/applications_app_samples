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

// Reference: ets/test/Integration/IntegrationTesting.test.ets
// Original line floor: 353; scenario family: parser-resolver.
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

export default function ResolverPipelineTest(): void {
  describe('ResolverPipelineTest', () => {
    beforeAll(() => {
      logSuite('ResolverPipelineTest', 'begin');
    });
    beforeEach(async () => {
      // Yield between cases so device watchdog and UI events can be processed.
      await new Promise<void>((resolve) => { setTimeout(resolve, 1); });
    });
    afterAll(() => {
      logSuite('ResolverPipelineTest', 'end');
    });

    /**
     * @tc.name ResolverPipelineTest_case_001
     * @tc.desc parser-resolver: parse real layouts and verify independent expected output; input vector 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ResolverPipelineTest_case_001', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-resolver.0";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const failed = new Error("resolver-failure-0");
      resolver.failure = failed;
      let caught: Error | undefined = undefined;
      try {
        await parser.parse([makeGroup(type, 1, "parser-resolver:0")]);
      } catch (error) {
        caught = error as Error;
      }
      expect(caught === failed).assertTrue();
      expect(resolver.calls).assertEqual(1);
      resolver.failure = undefined;
      const recovered = await parser.parse([makeGroup(type, 1, "parser-resolver:0")]);
      await assertSource(recovered, type, 1, "parser-resolver:0");
      expect(resolver.calls).assertEqual(2);
      expect(recovered.getData(0).type).assertEqual(type);
    });

    /**
     * @tc.name ResolverPipelineTest_case_002
     * @tc.desc parser-resolver: parse real layouts and verify independent expected output; input vector 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ResolverPipelineTest_case_002', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-resolver.1";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const failed = new Error("resolver-failure-1");
      resolver.failure = failed;
      let caught: Error | undefined = undefined;
      try {
        await parser.parse([makeGroup(type, 2, "parser-resolver:1")]);
      } catch (error) {
        caught = error as Error;
      }
      expect(caught === failed).assertTrue();
      expect(resolver.calls).assertEqual(1);
      resolver.failure = undefined;
      const recovered = await parser.parse([makeGroup(type, 2, "parser-resolver:1")]);
      await assertSource(recovered, type, 2, "parser-resolver:1");
      expect(resolver.calls).assertEqual(3);
      expect(recovered.getData(0).type).assertEqual(type);
    });

    /**
     * @tc.name ResolverPipelineTest_case_003
     * @tc.desc parser-resolver: parse real layouts and verify independent expected output; input vector 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ResolverPipelineTest_case_003', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-resolver.2";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const failed = new Error("resolver-failure-2");
      resolver.failure = failed;
      let caught: Error | undefined = undefined;
      try {
        await parser.parse([makeGroup(type, 3, "parser-resolver:2")]);
      } catch (error) {
        caught = error as Error;
      }
      expect(caught === failed).assertTrue();
      expect(resolver.calls).assertEqual(1);
      resolver.failure = undefined;
      const recovered = await parser.parse([makeGroup(type, 3, "parser-resolver:2")]);
      await assertSource(recovered, type, 3, "parser-resolver:2");
      expect(resolver.calls).assertEqual(4);
      expect(recovered.getData(0).type).assertEqual(type);
    });

    /**
     * @tc.name ResolverPipelineTest_case_004
     * @tc.desc parser-resolver: parse real layouts and verify independent expected output; input vector 4.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ResolverPipelineTest_case_004', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-resolver.3";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const failed = new Error("resolver-failure-3");
      resolver.failure = failed;
      let caught: Error | undefined = undefined;
      try {
        await parser.parse([makeGroup(type, 4, "parser-resolver:3")]);
      } catch (error) {
        caught = error as Error;
      }
      expect(caught === failed).assertTrue();
      expect(resolver.calls).assertEqual(1);
      resolver.failure = undefined;
      const recovered = await parser.parse([makeGroup(type, 4, "parser-resolver:3")]);
      await assertSource(recovered, type, 4, "parser-resolver:3");
      expect(resolver.calls).assertEqual(5);
      expect(recovered.getData(0).type).assertEqual(type);
    });

    /**
     * @tc.name ResolverPipelineTest_case_005
     * @tc.desc parser-resolver: parse real layouts and verify independent expected output; input vector 5.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ResolverPipelineTest_case_005', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-resolver.4";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const failed = new Error("resolver-failure-4");
      resolver.failure = failed;
      let caught: Error | undefined = undefined;
      try {
        await parser.parse([makeGroup(type, 5, "parser-resolver:4")]);
      } catch (error) {
        caught = error as Error;
      }
      expect(caught === failed).assertTrue();
      expect(resolver.calls).assertEqual(1);
      resolver.failure = undefined;
      const recovered = await parser.parse([makeGroup(type, 5, "parser-resolver:4")]);
      await assertSource(recovered, type, 5, "parser-resolver:4");
      expect(resolver.calls).assertEqual(6);
      expect(recovered.getData(0).type).assertEqual(type);
    });

    /**
     * @tc.name ResolverPipelineTest_case_006
     * @tc.desc parser-resolver: parse real layouts and verify independent expected output; input vector 6.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ResolverPipelineTest_case_006', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-resolver.5";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const failed = new Error("resolver-failure-5");
      resolver.failure = failed;
      let caught: Error | undefined = undefined;
      try {
        await parser.parse([makeGroup(type, 1, "parser-resolver:5")]);
      } catch (error) {
        caught = error as Error;
      }
      expect(caught === failed).assertTrue();
      expect(resolver.calls).assertEqual(1);
      resolver.failure = undefined;
      const recovered = await parser.parse([makeGroup(type, 1, "parser-resolver:5")]);
      await assertSource(recovered, type, 1, "parser-resolver:5");
      expect(resolver.calls).assertEqual(2);
      expect(recovered.getData(0).type).assertEqual(type);
    });

    /**
     * @tc.name ResolverPipelineTest_case_007
     * @tc.desc parser-resolver: parse real layouts and verify independent expected output; input vector 7.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ResolverPipelineTest_case_007', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-resolver.6";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const failed = new Error("resolver-failure-6");
      resolver.failure = failed;
      let caught: Error | undefined = undefined;
      try {
        await parser.parse([makeGroup(type, 2, "parser-resolver:6")]);
      } catch (error) {
        caught = error as Error;
      }
      expect(caught === failed).assertTrue();
      expect(resolver.calls).assertEqual(1);
      resolver.failure = undefined;
      const recovered = await parser.parse([makeGroup(type, 2, "parser-resolver:6")]);
      await assertSource(recovered, type, 2, "parser-resolver:6");
      expect(resolver.calls).assertEqual(3);
      expect(recovered.getData(0).type).assertEqual(type);
    });

    /**
     * @tc.name ResolverPipelineTest_case_008
     * @tc.desc parser-resolver: parse real layouts and verify independent expected output; input vector 8.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ResolverPipelineTest_case_008', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-resolver.7";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const failed = new Error("resolver-failure-7");
      resolver.failure = failed;
      let caught: Error | undefined = undefined;
      try {
        await parser.parse([makeGroup(type, 3, "parser-resolver:7")]);
      } catch (error) {
        caught = error as Error;
      }
      expect(caught === failed).assertTrue();
      expect(resolver.calls).assertEqual(1);
      resolver.failure = undefined;
      const recovered = await parser.parse([makeGroup(type, 3, "parser-resolver:7")]);
      await assertSource(recovered, type, 3, "parser-resolver:7");
      expect(resolver.calls).assertEqual(4);
      expect(recovered.getData(0).type).assertEqual(type);
    });

    /**
     * @tc.name ResolverPipelineTest_case_009
     * @tc.desc parser-resolver: parse real layouts and verify independent expected output; input vector 9.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ResolverPipelineTest_case_009', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-resolver.8";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const failed = new Error("resolver-failure-8");
      resolver.failure = failed;
      let caught: Error | undefined = undefined;
      try {
        await parser.parse([makeGroup(type, 4, "parser-resolver:8")]);
      } catch (error) {
        caught = error as Error;
      }
      expect(caught === failed).assertTrue();
      expect(resolver.calls).assertEqual(1);
      resolver.failure = undefined;
      const recovered = await parser.parse([makeGroup(type, 4, "parser-resolver:8")]);
      await assertSource(recovered, type, 4, "parser-resolver:8");
      expect(resolver.calls).assertEqual(5);
      expect(recovered.getData(0).type).assertEqual(type);
    });

    /**
     * @tc.name ResolverPipelineTest_case_010
     * @tc.desc parser-resolver: parse real layouts and verify independent expected output; input vector 10.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ResolverPipelineTest_case_010', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-resolver.9";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const failed = new Error("resolver-failure-9");
      resolver.failure = failed;
      let caught: Error | undefined = undefined;
      try {
        await parser.parse([makeGroup(type, 5, "parser-resolver:9")]);
      } catch (error) {
        caught = error as Error;
      }
      expect(caught === failed).assertTrue();
      expect(resolver.calls).assertEqual(1);
      resolver.failure = undefined;
      const recovered = await parser.parse([makeGroup(type, 5, "parser-resolver:9")]);
      await assertSource(recovered, type, 5, "parser-resolver:9");
      expect(resolver.calls).assertEqual(6);
      expect(recovered.getData(0).type).assertEqual(type);
    });

    /**
     * @tc.name ResolverPipelineTest_case_011
     * @tc.desc parser-resolver: parse real layouts and verify independent expected output; input vector 11.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ResolverPipelineTest_case_011', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-resolver.10";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const failed = new Error("resolver-failure-10");
      resolver.failure = failed;
      let caught: Error | undefined = undefined;
      try {
        await parser.parse([makeGroup(type, 1, "parser-resolver:10")]);
      } catch (error) {
        caught = error as Error;
      }
      expect(caught === failed).assertTrue();
      expect(resolver.calls).assertEqual(1);
      resolver.failure = undefined;
      const recovered = await parser.parse([makeGroup(type, 1, "parser-resolver:10")]);
      await assertSource(recovered, type, 1, "parser-resolver:10");
      expect(resolver.calls).assertEqual(2);
      expect(recovered.getData(0).type).assertEqual(type);
    });
  });
}
