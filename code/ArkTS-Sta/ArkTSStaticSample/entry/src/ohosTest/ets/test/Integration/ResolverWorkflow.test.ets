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

// Reference: ets/test/PowerDialog/PowerOperationWorkflow.test.ets
// Original line floor: 654; scenario family: parser-workflow.
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

export default function ResolverWorkflowTest(): void {
  describe('ResolverWorkflowTest', () => {
    beforeAll(() => {
      logSuite('ResolverWorkflowTest', 'begin');
    });
    beforeEach(async () => {
      // Yield between cases so device watchdog and UI events can be processed.
      await new Promise<void>((resolve) => { setTimeout(resolve, 1); });
    });
    afterAll(() => {
      logSuite('ResolverWorkflowTest', 'end');
    });

    /**
     * @tc.name ResolverWorkflowTest_case_001
     * @tc.desc parser-workflow: parse real layouts and verify independent expected output; input vector 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ResolverWorkflowTest_case_001', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-workflow.0";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const failed = new Error("resolver-failure-0");
      resolver.failure = failed;
      let caught: Error | undefined = undefined;
      try {
        await parser.parse([makeGroup(type, 1, "parser-workflow:0")]);
      } catch (error) {
        caught = error as Error;
      }
      expect(caught === failed).assertTrue();
      expect(resolver.calls).assertEqual(1);
      resolver.failure = undefined;
      const recovered = await parser.parse([makeGroup(type, 1, "parser-workflow:0")]);
      await assertSource(recovered, type, 1, "parser-workflow:0");
      expect(resolver.calls).assertEqual(2);
      expect(recovered.getData(0).type).assertEqual(type);
    });

    /**
     * @tc.name ResolverWorkflowTest_case_002
     * @tc.desc parser-workflow: parse real layouts and verify independent expected output; input vector 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ResolverWorkflowTest_case_002', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-workflow.1";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const failed = new Error("resolver-failure-1");
      resolver.failure = failed;
      let caught: Error | undefined = undefined;
      try {
        await parser.parse([makeGroup(type, 2, "parser-workflow:1")]);
      } catch (error) {
        caught = error as Error;
      }
      expect(caught === failed).assertTrue();
      expect(resolver.calls).assertEqual(1);
      resolver.failure = undefined;
      const recovered = await parser.parse([makeGroup(type, 2, "parser-workflow:1")]);
      await assertSource(recovered, type, 2, "parser-workflow:1");
      expect(resolver.calls).assertEqual(3);
      expect(recovered.getData(0).type).assertEqual(type);
    });

    /**
     * @tc.name ResolverWorkflowTest_case_003
     * @tc.desc parser-workflow: parse real layouts and verify independent expected output; input vector 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ResolverWorkflowTest_case_003', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-workflow.2";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const failed = new Error("resolver-failure-2");
      resolver.failure = failed;
      let caught: Error | undefined = undefined;
      try {
        await parser.parse([makeGroup(type, 3, "parser-workflow:2")]);
      } catch (error) {
        caught = error as Error;
      }
      expect(caught === failed).assertTrue();
      expect(resolver.calls).assertEqual(1);
      resolver.failure = undefined;
      const recovered = await parser.parse([makeGroup(type, 3, "parser-workflow:2")]);
      await assertSource(recovered, type, 3, "parser-workflow:2");
      expect(resolver.calls).assertEqual(4);
      expect(recovered.getData(0).type).assertEqual(type);
    });

    /**
     * @tc.name ResolverWorkflowTest_case_004
     * @tc.desc parser-workflow: parse real layouts and verify independent expected output; input vector 4.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ResolverWorkflowTest_case_004', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-workflow.3";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const failed = new Error("resolver-failure-3");
      resolver.failure = failed;
      let caught: Error | undefined = undefined;
      try {
        await parser.parse([makeGroup(type, 4, "parser-workflow:3")]);
      } catch (error) {
        caught = error as Error;
      }
      expect(caught === failed).assertTrue();
      expect(resolver.calls).assertEqual(1);
      resolver.failure = undefined;
      const recovered = await parser.parse([makeGroup(type, 4, "parser-workflow:3")]);
      await assertSource(recovered, type, 4, "parser-workflow:3");
      expect(resolver.calls).assertEqual(5);
      expect(recovered.getData(0).type).assertEqual(type);
    });

    /**
     * @tc.name ResolverWorkflowTest_case_005
     * @tc.desc parser-workflow: parse real layouts and verify independent expected output; input vector 5.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ResolverWorkflowTest_case_005', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-workflow.4";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const failed = new Error("resolver-failure-4");
      resolver.failure = failed;
      let caught: Error | undefined = undefined;
      try {
        await parser.parse([makeGroup(type, 5, "parser-workflow:4")]);
      } catch (error) {
        caught = error as Error;
      }
      expect(caught === failed).assertTrue();
      expect(resolver.calls).assertEqual(1);
      resolver.failure = undefined;
      const recovered = await parser.parse([makeGroup(type, 5, "parser-workflow:4")]);
      await assertSource(recovered, type, 5, "parser-workflow:4");
      expect(resolver.calls).assertEqual(6);
      expect(recovered.getData(0).type).assertEqual(type);
    });

    /**
     * @tc.name ResolverWorkflowTest_case_006
     * @tc.desc parser-workflow: parse real layouts and verify independent expected output; input vector 6.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ResolverWorkflowTest_case_006', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-workflow.5";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const failed = new Error("resolver-failure-5");
      resolver.failure = failed;
      let caught: Error | undefined = undefined;
      try {
        await parser.parse([makeGroup(type, 1, "parser-workflow:5")]);
      } catch (error) {
        caught = error as Error;
      }
      expect(caught === failed).assertTrue();
      expect(resolver.calls).assertEqual(1);
      resolver.failure = undefined;
      const recovered = await parser.parse([makeGroup(type, 1, "parser-workflow:5")]);
      await assertSource(recovered, type, 1, "parser-workflow:5");
      expect(resolver.calls).assertEqual(2);
      expect(recovered.getData(0).type).assertEqual(type);
    });

    /**
     * @tc.name ResolverWorkflowTest_case_007
     * @tc.desc parser-workflow: parse real layouts and verify independent expected output; input vector 7.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ResolverWorkflowTest_case_007', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-workflow.6";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const failed = new Error("resolver-failure-6");
      resolver.failure = failed;
      let caught: Error | undefined = undefined;
      try {
        await parser.parse([makeGroup(type, 2, "parser-workflow:6")]);
      } catch (error) {
        caught = error as Error;
      }
      expect(caught === failed).assertTrue();
      expect(resolver.calls).assertEqual(1);
      resolver.failure = undefined;
      const recovered = await parser.parse([makeGroup(type, 2, "parser-workflow:6")]);
      await assertSource(recovered, type, 2, "parser-workflow:6");
      expect(resolver.calls).assertEqual(3);
      expect(recovered.getData(0).type).assertEqual(type);
    });

    /**
     * @tc.name ResolverWorkflowTest_case_008
     * @tc.desc parser-workflow: parse real layouts and verify independent expected output; input vector 8.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ResolverWorkflowTest_case_008', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-workflow.7";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const failed = new Error("resolver-failure-7");
      resolver.failure = failed;
      let caught: Error | undefined = undefined;
      try {
        await parser.parse([makeGroup(type, 3, "parser-workflow:7")]);
      } catch (error) {
        caught = error as Error;
      }
      expect(caught === failed).assertTrue();
      expect(resolver.calls).assertEqual(1);
      resolver.failure = undefined;
      const recovered = await parser.parse([makeGroup(type, 3, "parser-workflow:7")]);
      await assertSource(recovered, type, 3, "parser-workflow:7");
      expect(resolver.calls).assertEqual(4);
      expect(recovered.getData(0).type).assertEqual(type);
    });

    /**
     * @tc.name ResolverWorkflowTest_case_009
     * @tc.desc parser-workflow: parse real layouts and verify independent expected output; input vector 9.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ResolverWorkflowTest_case_009', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-workflow.8";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const failed = new Error("resolver-failure-8");
      resolver.failure = failed;
      let caught: Error | undefined = undefined;
      try {
        await parser.parse([makeGroup(type, 4, "parser-workflow:8")]);
      } catch (error) {
        caught = error as Error;
      }
      expect(caught === failed).assertTrue();
      expect(resolver.calls).assertEqual(1);
      resolver.failure = undefined;
      const recovered = await parser.parse([makeGroup(type, 4, "parser-workflow:8")]);
      await assertSource(recovered, type, 4, "parser-workflow:8");
      expect(resolver.calls).assertEqual(5);
      expect(recovered.getData(0).type).assertEqual(type);
    });

    /**
     * @tc.name ResolverWorkflowTest_case_010
     * @tc.desc parser-workflow: parse real layouts and verify independent expected output; input vector 10.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ResolverWorkflowTest_case_010', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-workflow.9";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const failed = new Error("resolver-failure-9");
      resolver.failure = failed;
      let caught: Error | undefined = undefined;
      try {
        await parser.parse([makeGroup(type, 5, "parser-workflow:9")]);
      } catch (error) {
        caught = error as Error;
      }
      expect(caught === failed).assertTrue();
      expect(resolver.calls).assertEqual(1);
      resolver.failure = undefined;
      const recovered = await parser.parse([makeGroup(type, 5, "parser-workflow:9")]);
      await assertSource(recovered, type, 5, "parser-workflow:9");
      expect(resolver.calls).assertEqual(6);
      expect(recovered.getData(0).type).assertEqual(type);
    });

    /**
     * @tc.name ResolverWorkflowTest_case_011
     * @tc.desc parser-workflow: parse real layouts and verify independent expected output; input vector 11.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ResolverWorkflowTest_case_011', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-workflow.10";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const failed = new Error("resolver-failure-10");
      resolver.failure = failed;
      let caught: Error | undefined = undefined;
      try {
        await parser.parse([makeGroup(type, 1, "parser-workflow:10")]);
      } catch (error) {
        caught = error as Error;
      }
      expect(caught === failed).assertTrue();
      expect(resolver.calls).assertEqual(1);
      resolver.failure = undefined;
      const recovered = await parser.parse([makeGroup(type, 1, "parser-workflow:10")]);
      await assertSource(recovered, type, 1, "parser-workflow:10");
      expect(resolver.calls).assertEqual(2);
      expect(recovered.getData(0).type).assertEqual(type);
    });

    /**
     * @tc.name ResolverWorkflowTest_case_012
     * @tc.desc parser-workflow: parse real layouts and verify independent expected output; input vector 12.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ResolverWorkflowTest_case_012', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-workflow.11";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const failed = new Error("resolver-failure-11");
      resolver.failure = failed;
      let caught: Error | undefined = undefined;
      try {
        await parser.parse([makeGroup(type, 2, "parser-workflow:11")]);
      } catch (error) {
        caught = error as Error;
      }
      expect(caught === failed).assertTrue();
      expect(resolver.calls).assertEqual(1);
      resolver.failure = undefined;
      const recovered = await parser.parse([makeGroup(type, 2, "parser-workflow:11")]);
      await assertSource(recovered, type, 2, "parser-workflow:11");
      expect(resolver.calls).assertEqual(3);
      expect(recovered.getData(0).type).assertEqual(type);
    });

    /**
     * @tc.name ResolverWorkflowTest_case_013
     * @tc.desc parser-workflow: parse real layouts and verify independent expected output; input vector 13.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ResolverWorkflowTest_case_013', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-workflow.12";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const failed = new Error("resolver-failure-12");
      resolver.failure = failed;
      let caught: Error | undefined = undefined;
      try {
        await parser.parse([makeGroup(type, 3, "parser-workflow:12")]);
      } catch (error) {
        caught = error as Error;
      }
      expect(caught === failed).assertTrue();
      expect(resolver.calls).assertEqual(1);
      resolver.failure = undefined;
      const recovered = await parser.parse([makeGroup(type, 3, "parser-workflow:12")]);
      await assertSource(recovered, type, 3, "parser-workflow:12");
      expect(resolver.calls).assertEqual(4);
      expect(recovered.getData(0).type).assertEqual(type);
    });

    /**
     * @tc.name ResolverWorkflowTest_case_014
     * @tc.desc parser-workflow: parse real layouts and verify independent expected output; input vector 14.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ResolverWorkflowTest_case_014', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-workflow.13";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const failed = new Error("resolver-failure-13");
      resolver.failure = failed;
      let caught: Error | undefined = undefined;
      try {
        await parser.parse([makeGroup(type, 4, "parser-workflow:13")]);
      } catch (error) {
        caught = error as Error;
      }
      expect(caught === failed).assertTrue();
      expect(resolver.calls).assertEqual(1);
      resolver.failure = undefined;
      const recovered = await parser.parse([makeGroup(type, 4, "parser-workflow:13")]);
      await assertSource(recovered, type, 4, "parser-workflow:13");
      expect(resolver.calls).assertEqual(5);
      expect(recovered.getData(0).type).assertEqual(type);
    });

    /**
     * @tc.name ResolverWorkflowTest_case_015
     * @tc.desc parser-workflow: parse real layouts and verify independent expected output; input vector 15.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ResolverWorkflowTest_case_015', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-workflow.14";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const failed = new Error("resolver-failure-14");
      resolver.failure = failed;
      let caught: Error | undefined = undefined;
      try {
        await parser.parse([makeGroup(type, 5, "parser-workflow:14")]);
      } catch (error) {
        caught = error as Error;
      }
      expect(caught === failed).assertTrue();
      expect(resolver.calls).assertEqual(1);
      resolver.failure = undefined;
      const recovered = await parser.parse([makeGroup(type, 5, "parser-workflow:14")]);
      await assertSource(recovered, type, 5, "parser-workflow:14");
      expect(resolver.calls).assertEqual(6);
      expect(recovered.getData(0).type).assertEqual(type);
    });

    /**
     * @tc.name ResolverWorkflowTest_case_016
     * @tc.desc parser-workflow: parse real layouts and verify independent expected output; input vector 16.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ResolverWorkflowTest_case_016', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-workflow.15";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const failed = new Error("resolver-failure-15");
      resolver.failure = failed;
      let caught: Error | undefined = undefined;
      try {
        await parser.parse([makeGroup(type, 1, "parser-workflow:15")]);
      } catch (error) {
        caught = error as Error;
      }
      expect(caught === failed).assertTrue();
      expect(resolver.calls).assertEqual(1);
      resolver.failure = undefined;
      const recovered = await parser.parse([makeGroup(type, 1, "parser-workflow:15")]);
      await assertSource(recovered, type, 1, "parser-workflow:15");
      expect(resolver.calls).assertEqual(2);
      expect(recovered.getData(0).type).assertEqual(type);
    });

    /**
     * @tc.name ResolverWorkflowTest_case_017
     * @tc.desc parser-workflow: parse real layouts and verify independent expected output; input vector 17.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ResolverWorkflowTest_case_017', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-workflow.16";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const failed = new Error("resolver-failure-16");
      resolver.failure = failed;
      let caught: Error | undefined = undefined;
      try {
        await parser.parse([makeGroup(type, 2, "parser-workflow:16")]);
      } catch (error) {
        caught = error as Error;
      }
      expect(caught === failed).assertTrue();
      expect(resolver.calls).assertEqual(1);
      resolver.failure = undefined;
      const recovered = await parser.parse([makeGroup(type, 2, "parser-workflow:16")]);
      await assertSource(recovered, type, 2, "parser-workflow:16");
      expect(resolver.calls).assertEqual(3);
      expect(recovered.getData(0).type).assertEqual(type);
    });

    /**
     * @tc.name ResolverWorkflowTest_case_018
     * @tc.desc parser-workflow: parse real layouts and verify independent expected output; input vector 18.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ResolverWorkflowTest_case_018', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-workflow.17";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const failed = new Error("resolver-failure-17");
      resolver.failure = failed;
      let caught: Error | undefined = undefined;
      try {
        await parser.parse([makeGroup(type, 3, "parser-workflow:17")]);
      } catch (error) {
        caught = error as Error;
      }
      expect(caught === failed).assertTrue();
      expect(resolver.calls).assertEqual(1);
      resolver.failure = undefined;
      const recovered = await parser.parse([makeGroup(type, 3, "parser-workflow:17")]);
      await assertSource(recovered, type, 3, "parser-workflow:17");
      expect(resolver.calls).assertEqual(4);
      expect(recovered.getData(0).type).assertEqual(type);
    });

    /**
     * @tc.name ResolverWorkflowTest_case_019
     * @tc.desc parser-workflow: parse real layouts and verify independent expected output; input vector 19.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ResolverWorkflowTest_case_019', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-workflow.18";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const failed = new Error("resolver-failure-18");
      resolver.failure = failed;
      let caught: Error | undefined = undefined;
      try {
        await parser.parse([makeGroup(type, 4, "parser-workflow:18")]);
      } catch (error) {
        caught = error as Error;
      }
      expect(caught === failed).assertTrue();
      expect(resolver.calls).assertEqual(1);
      resolver.failure = undefined;
      const recovered = await parser.parse([makeGroup(type, 4, "parser-workflow:18")]);
      await assertSource(recovered, type, 4, "parser-workflow:18");
      expect(resolver.calls).assertEqual(5);
      expect(recovered.getData(0).type).assertEqual(type);
    });

    /**
     * @tc.name ResolverWorkflowTest_case_020
     * @tc.desc parser-workflow: parse real layouts and verify independent expected output; input vector 20.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ResolverWorkflowTest_case_020', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-workflow.19";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const failed = new Error("resolver-failure-19");
      resolver.failure = failed;
      let caught: Error | undefined = undefined;
      try {
        await parser.parse([makeGroup(type, 5, "parser-workflow:19")]);
      } catch (error) {
        caught = error as Error;
      }
      expect(caught === failed).assertTrue();
      expect(resolver.calls).assertEqual(1);
      resolver.failure = undefined;
      const recovered = await parser.parse([makeGroup(type, 5, "parser-workflow:19")]);
      await assertSource(recovered, type, 5, "parser-workflow:19");
      expect(resolver.calls).assertEqual(6);
      expect(recovered.getData(0).type).assertEqual(type);
    });

    /**
     * @tc.name ResolverWorkflowTest_case_021
     * @tc.desc parser-workflow: parse real layouts and verify independent expected output; input vector 21.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ResolverWorkflowTest_case_021', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-workflow.20";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const failed = new Error("resolver-failure-20");
      resolver.failure = failed;
      let caught: Error | undefined = undefined;
      try {
        await parser.parse([makeGroup(type, 1, "parser-workflow:20")]);
      } catch (error) {
        caught = error as Error;
      }
      expect(caught === failed).assertTrue();
      expect(resolver.calls).assertEqual(1);
      resolver.failure = undefined;
      const recovered = await parser.parse([makeGroup(type, 1, "parser-workflow:20")]);
      await assertSource(recovered, type, 1, "parser-workflow:20");
      expect(resolver.calls).assertEqual(2);
      expect(recovered.getData(0).type).assertEqual(type);
    });

    /**
     * @tc.name ResolverWorkflowTest_case_022
     * @tc.desc parser-workflow: parse real layouts and verify independent expected output; input vector 22.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ResolverWorkflowTest_case_022', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-workflow.21";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const failed = new Error("resolver-failure-21");
      resolver.failure = failed;
      let caught: Error | undefined = undefined;
      try {
        await parser.parse([makeGroup(type, 2, "parser-workflow:21")]);
      } catch (error) {
        caught = error as Error;
      }
      expect(caught === failed).assertTrue();
      expect(resolver.calls).assertEqual(1);
      resolver.failure = undefined;
      const recovered = await parser.parse([makeGroup(type, 2, "parser-workflow:21")]);
      await assertSource(recovered, type, 2, "parser-workflow:21");
      expect(resolver.calls).assertEqual(3);
      expect(recovered.getData(0).type).assertEqual(type);
    });
  });
}
