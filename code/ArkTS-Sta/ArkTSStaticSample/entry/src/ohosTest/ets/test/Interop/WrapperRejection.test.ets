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

// Reference: ets/test/PowerDialog/PowerDialogErrorRecovery.test.ets
// Original line floor: 551; scenario family: wrapper-reject.
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

export default function WrapperRejectionTest(): void {
  describe('WrapperRejectionTest', () => {
    beforeAll(() => {
      logSuite('WrapperRejectionTest', 'begin');
    });
    beforeEach(async () => {
      // Yield between cases so device watchdog and UI events can be processed.
      await new Promise<void>((resolve) => { setTimeout(resolve, 1); });
    });
    afterAll(() => {
      logSuite('WrapperRejectionTest', 'end');
    });

    /**
     * @tc.name WrapperRejectionTest_case_001
     * @tc.desc wrapper-reject: real wrapper with a controlled native dependency; input vector 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('WrapperRejectionTest_case_001', 0, async () => {
      await waitForNativeFactory();
      const previousFactory = EtsFactory.factory;
      const nativeParser = new ControlledParser();
      const factory = new ControlledFactory(nativeParser);
      const resolver = new RecordingResolver();
      const type = "test.wrapper-reject.0";
      registry.registerCard(type, resolver);
      nativeParser.result = makeSource(type, 0, "wrapper-reject:0");
      EtsFactory.factory = factory;
      try {
        const wrapper = new DataParserStaW();
        expect(factory.calls).assertEqual(1);
        const failure = new Error("native-rejection-0");
        nativeParser.failure = failure;
        nativeParser.synchronousFailure = true;
        let caught: Error | undefined = undefined;
        try {
          await wrapper.parse([]);
        } catch (error) {
          caught = error as Error;
        }
        expect(caught === failure).assertTrue();
        expect(resolver.calls).assertEqual(0);
        expect(nativeParser.inputs.length).assertEqual(1);
        nativeParser.failure = undefined;
        const recovered = await wrapper.parse([]);
        await assertSource(recovered, type, 0, "wrapper-reject:0");
        expect(nativeParser.inputs.length).assertEqual(2);
        expect(resolver.calls).assertEqual(0);
      } finally {
        EtsFactory.factory = previousFactory;
      }
      expect(EtsFactory.factory === previousFactory).assertTrue();
    });

    /**
     * @tc.name WrapperRejectionTest_case_002
     * @tc.desc wrapper-reject: real wrapper with a controlled native dependency; input vector 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('WrapperRejectionTest_case_002', 0, async () => {
      await waitForNativeFactory();
      const previousFactory = EtsFactory.factory;
      const nativeParser = new ControlledParser();
      const factory = new ControlledFactory(nativeParser);
      const resolver = new RecordingResolver();
      const type = "test.wrapper-reject.1";
      registry.registerCard(type, resolver);
      nativeParser.result = makeSource(type, 1, "wrapper-reject:1");
      EtsFactory.factory = factory;
      try {
        const wrapper = new DataParserStaW();
        expect(factory.calls).assertEqual(1);
        const failure = new Error("native-rejection-1");
        nativeParser.failure = failure;
        nativeParser.synchronousFailure = false;
        let caught: Error | undefined = undefined;
        try {
          await wrapper.parse([]);
        } catch (error) {
          caught = error as Error;
        }
        expect(caught === failure).assertTrue();
        expect(resolver.calls).assertEqual(0);
        expect(nativeParser.inputs.length).assertEqual(1);
        nativeParser.failure = undefined;
        const recovered = await wrapper.parse([]);
        await assertSource(recovered, type, 1, "wrapper-reject:1");
        expect(nativeParser.inputs.length).assertEqual(2);
        expect(resolver.calls).assertEqual(1);
      } finally {
        EtsFactory.factory = previousFactory;
      }
      expect(EtsFactory.factory === previousFactory).assertTrue();
    });

    /**
     * @tc.name WrapperRejectionTest_case_003
     * @tc.desc wrapper-reject: real wrapper with a controlled native dependency; input vector 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('WrapperRejectionTest_case_003', 0, async () => {
      await waitForNativeFactory();
      const previousFactory = EtsFactory.factory;
      const nativeParser = new ControlledParser();
      const factory = new ControlledFactory(nativeParser);
      const resolver = new RecordingResolver();
      const type = "test.wrapper-reject.2";
      registry.registerCard(type, resolver);
      nativeParser.result = makeSource(type, 2, "wrapper-reject:2");
      EtsFactory.factory = factory;
      try {
        const wrapper = new DataParserStaW();
        expect(factory.calls).assertEqual(1);
        const failure = new Error("native-rejection-2");
        nativeParser.failure = failure;
        nativeParser.synchronousFailure = true;
        let caught: Error | undefined = undefined;
        try {
          await wrapper.parse([]);
        } catch (error) {
          caught = error as Error;
        }
        expect(caught === failure).assertTrue();
        expect(resolver.calls).assertEqual(0);
        expect(nativeParser.inputs.length).assertEqual(1);
        nativeParser.failure = undefined;
        const recovered = await wrapper.parse([]);
        await assertSource(recovered, type, 2, "wrapper-reject:2");
        expect(nativeParser.inputs.length).assertEqual(2);
        expect(resolver.calls).assertEqual(2);
      } finally {
        EtsFactory.factory = previousFactory;
      }
      expect(EtsFactory.factory === previousFactory).assertTrue();
    });

    /**
     * @tc.name WrapperRejectionTest_case_004
     * @tc.desc wrapper-reject: real wrapper with a controlled native dependency; input vector 4.
     * @tc.type Function
     * @tc.level Level1
     */
    it('WrapperRejectionTest_case_004', 0, async () => {
      await waitForNativeFactory();
      const previousFactory = EtsFactory.factory;
      const nativeParser = new ControlledParser();
      const factory = new ControlledFactory(nativeParser);
      const resolver = new RecordingResolver();
      const type = "test.wrapper-reject.3";
      registry.registerCard(type, resolver);
      nativeParser.result = makeSource(type, 3, "wrapper-reject:3");
      EtsFactory.factory = factory;
      try {
        const wrapper = new DataParserStaW();
        expect(factory.calls).assertEqual(1);
        const failure = new Error("native-rejection-3");
        nativeParser.failure = failure;
        nativeParser.synchronousFailure = false;
        let caught: Error | undefined = undefined;
        try {
          await wrapper.parse([]);
        } catch (error) {
          caught = error as Error;
        }
        expect(caught === failure).assertTrue();
        expect(resolver.calls).assertEqual(0);
        expect(nativeParser.inputs.length).assertEqual(1);
        nativeParser.failure = undefined;
        const recovered = await wrapper.parse([]);
        await assertSource(recovered, type, 3, "wrapper-reject:3");
        expect(nativeParser.inputs.length).assertEqual(2);
        expect(resolver.calls).assertEqual(3);
      } finally {
        EtsFactory.factory = previousFactory;
      }
      expect(EtsFactory.factory === previousFactory).assertTrue();
    });

    /**
     * @tc.name WrapperRejectionTest_case_005
     * @tc.desc wrapper-reject: real wrapper with a controlled native dependency; input vector 5.
     * @tc.type Function
     * @tc.level Level1
     */
    it('WrapperRejectionTest_case_005', 0, async () => {
      await waitForNativeFactory();
      const previousFactory = EtsFactory.factory;
      const nativeParser = new ControlledParser();
      const factory = new ControlledFactory(nativeParser);
      const resolver = new RecordingResolver();
      const type = "test.wrapper-reject.4";
      registry.registerCard(type, resolver);
      nativeParser.result = makeSource(type, 4, "wrapper-reject:4");
      EtsFactory.factory = factory;
      try {
        const wrapper = new DataParserStaW();
        expect(factory.calls).assertEqual(1);
        const failure = new Error("native-rejection-4");
        nativeParser.failure = failure;
        nativeParser.synchronousFailure = true;
        let caught: Error | undefined = undefined;
        try {
          await wrapper.parse([]);
        } catch (error) {
          caught = error as Error;
        }
        expect(caught === failure).assertTrue();
        expect(resolver.calls).assertEqual(0);
        expect(nativeParser.inputs.length).assertEqual(1);
        nativeParser.failure = undefined;
        const recovered = await wrapper.parse([]);
        await assertSource(recovered, type, 4, "wrapper-reject:4");
        expect(nativeParser.inputs.length).assertEqual(2);
        expect(resolver.calls).assertEqual(4);
      } finally {
        EtsFactory.factory = previousFactory;
      }
      expect(EtsFactory.factory === previousFactory).assertTrue();
    });

    /**
     * @tc.name WrapperRejectionTest_case_006
     * @tc.desc wrapper-reject: real wrapper with a controlled native dependency; input vector 6.
     * @tc.type Function
     * @tc.level Level1
     */
    it('WrapperRejectionTest_case_006', 0, async () => {
      await waitForNativeFactory();
      const previousFactory = EtsFactory.factory;
      const nativeParser = new ControlledParser();
      const factory = new ControlledFactory(nativeParser);
      const resolver = new RecordingResolver();
      const type = "test.wrapper-reject.5";
      registry.registerCard(type, resolver);
      nativeParser.result = makeSource(type, 0, "wrapper-reject:5");
      EtsFactory.factory = factory;
      try {
        const wrapper = new DataParserStaW();
        expect(factory.calls).assertEqual(1);
        const failure = new Error("native-rejection-5");
        nativeParser.failure = failure;
        nativeParser.synchronousFailure = false;
        let caught: Error | undefined = undefined;
        try {
          await wrapper.parse([]);
        } catch (error) {
          caught = error as Error;
        }
        expect(caught === failure).assertTrue();
        expect(resolver.calls).assertEqual(0);
        expect(nativeParser.inputs.length).assertEqual(1);
        nativeParser.failure = undefined;
        const recovered = await wrapper.parse([]);
        await assertSource(recovered, type, 0, "wrapper-reject:5");
        expect(nativeParser.inputs.length).assertEqual(2);
        expect(resolver.calls).assertEqual(0);
      } finally {
        EtsFactory.factory = previousFactory;
      }
      expect(EtsFactory.factory === previousFactory).assertTrue();
    });

    /**
     * @tc.name WrapperRejectionTest_case_007
     * @tc.desc wrapper-reject: real wrapper with a controlled native dependency; input vector 7.
     * @tc.type Function
     * @tc.level Level1
     */
    it('WrapperRejectionTest_case_007', 0, async () => {
      await waitForNativeFactory();
      const previousFactory = EtsFactory.factory;
      const nativeParser = new ControlledParser();
      const factory = new ControlledFactory(nativeParser);
      const resolver = new RecordingResolver();
      const type = "test.wrapper-reject.6";
      registry.registerCard(type, resolver);
      nativeParser.result = makeSource(type, 1, "wrapper-reject:6");
      EtsFactory.factory = factory;
      try {
        const wrapper = new DataParserStaW();
        expect(factory.calls).assertEqual(1);
        const failure = new Error("native-rejection-6");
        nativeParser.failure = failure;
        nativeParser.synchronousFailure = true;
        let caught: Error | undefined = undefined;
        try {
          await wrapper.parse([]);
        } catch (error) {
          caught = error as Error;
        }
        expect(caught === failure).assertTrue();
        expect(resolver.calls).assertEqual(0);
        expect(nativeParser.inputs.length).assertEqual(1);
        nativeParser.failure = undefined;
        const recovered = await wrapper.parse([]);
        await assertSource(recovered, type, 1, "wrapper-reject:6");
        expect(nativeParser.inputs.length).assertEqual(2);
        expect(resolver.calls).assertEqual(1);
      } finally {
        EtsFactory.factory = previousFactory;
      }
      expect(EtsFactory.factory === previousFactory).assertTrue();
    });

    /**
     * @tc.name WrapperRejectionTest_case_008
     * @tc.desc wrapper-reject: real wrapper with a controlled native dependency; input vector 8.
     * @tc.type Function
     * @tc.level Level1
     */
    it('WrapperRejectionTest_case_008', 0, async () => {
      await waitForNativeFactory();
      const previousFactory = EtsFactory.factory;
      const nativeParser = new ControlledParser();
      const factory = new ControlledFactory(nativeParser);
      const resolver = new RecordingResolver();
      const type = "test.wrapper-reject.7";
      registry.registerCard(type, resolver);
      nativeParser.result = makeSource(type, 2, "wrapper-reject:7");
      EtsFactory.factory = factory;
      try {
        const wrapper = new DataParserStaW();
        expect(factory.calls).assertEqual(1);
        const failure = new Error("native-rejection-7");
        nativeParser.failure = failure;
        nativeParser.synchronousFailure = false;
        let caught: Error | undefined = undefined;
        try {
          await wrapper.parse([]);
        } catch (error) {
          caught = error as Error;
        }
        expect(caught === failure).assertTrue();
        expect(resolver.calls).assertEqual(0);
        expect(nativeParser.inputs.length).assertEqual(1);
        nativeParser.failure = undefined;
        const recovered = await wrapper.parse([]);
        await assertSource(recovered, type, 2, "wrapper-reject:7");
        expect(nativeParser.inputs.length).assertEqual(2);
        expect(resolver.calls).assertEqual(2);
      } finally {
        EtsFactory.factory = previousFactory;
      }
      expect(EtsFactory.factory === previousFactory).assertTrue();
    });

    /**
     * @tc.name WrapperRejectionTest_case_009
     * @tc.desc wrapper-reject: real wrapper with a controlled native dependency; input vector 9.
     * @tc.type Function
     * @tc.level Level1
     */
    it('WrapperRejectionTest_case_009', 0, async () => {
      await waitForNativeFactory();
      const previousFactory = EtsFactory.factory;
      const nativeParser = new ControlledParser();
      const factory = new ControlledFactory(nativeParser);
      const resolver = new RecordingResolver();
      const type = "test.wrapper-reject.8";
      registry.registerCard(type, resolver);
      nativeParser.result = makeSource(type, 3, "wrapper-reject:8");
      EtsFactory.factory = factory;
      try {
        const wrapper = new DataParserStaW();
        expect(factory.calls).assertEqual(1);
        const failure = new Error("native-rejection-8");
        nativeParser.failure = failure;
        nativeParser.synchronousFailure = true;
        let caught: Error | undefined = undefined;
        try {
          await wrapper.parse([]);
        } catch (error) {
          caught = error as Error;
        }
        expect(caught === failure).assertTrue();
        expect(resolver.calls).assertEqual(0);
        expect(nativeParser.inputs.length).assertEqual(1);
        nativeParser.failure = undefined;
        const recovered = await wrapper.parse([]);
        await assertSource(recovered, type, 3, "wrapper-reject:8");
        expect(nativeParser.inputs.length).assertEqual(2);
        expect(resolver.calls).assertEqual(3);
      } finally {
        EtsFactory.factory = previousFactory;
      }
      expect(EtsFactory.factory === previousFactory).assertTrue();
    });

    /**
     * @tc.name WrapperRejectionTest_case_010
     * @tc.desc wrapper-reject: real wrapper with a controlled native dependency; input vector 10.
     * @tc.type Function
     * @tc.level Level1
     */
    it('WrapperRejectionTest_case_010', 0, async () => {
      await waitForNativeFactory();
      const previousFactory = EtsFactory.factory;
      const nativeParser = new ControlledParser();
      const factory = new ControlledFactory(nativeParser);
      const resolver = new RecordingResolver();
      const type = "test.wrapper-reject.9";
      registry.registerCard(type, resolver);
      nativeParser.result = makeSource(type, 4, "wrapper-reject:9");
      EtsFactory.factory = factory;
      try {
        const wrapper = new DataParserStaW();
        expect(factory.calls).assertEqual(1);
        const failure = new Error("native-rejection-9");
        nativeParser.failure = failure;
        nativeParser.synchronousFailure = false;
        let caught: Error | undefined = undefined;
        try {
          await wrapper.parse([]);
        } catch (error) {
          caught = error as Error;
        }
        expect(caught === failure).assertTrue();
        expect(resolver.calls).assertEqual(0);
        expect(nativeParser.inputs.length).assertEqual(1);
        nativeParser.failure = undefined;
        const recovered = await wrapper.parse([]);
        await assertSource(recovered, type, 4, "wrapper-reject:9");
        expect(nativeParser.inputs.length).assertEqual(2);
        expect(resolver.calls).assertEqual(4);
      } finally {
        EtsFactory.factory = previousFactory;
      }
      expect(EtsFactory.factory === previousFactory).assertTrue();
    });

    /**
     * @tc.name WrapperRejectionTest_case_011
     * @tc.desc wrapper-reject: real wrapper with a controlled native dependency; input vector 11.
     * @tc.type Function
     * @tc.level Level1
     */
    it('WrapperRejectionTest_case_011', 0, async () => {
      await waitForNativeFactory();
      const previousFactory = EtsFactory.factory;
      const nativeParser = new ControlledParser();
      const factory = new ControlledFactory(nativeParser);
      const resolver = new RecordingResolver();
      const type = "test.wrapper-reject.10";
      registry.registerCard(type, resolver);
      nativeParser.result = makeSource(type, 0, "wrapper-reject:10");
      EtsFactory.factory = factory;
      try {
        const wrapper = new DataParserStaW();
        expect(factory.calls).assertEqual(1);
        const failure = new Error("native-rejection-10");
        nativeParser.failure = failure;
        nativeParser.synchronousFailure = true;
        let caught: Error | undefined = undefined;
        try {
          await wrapper.parse([]);
        } catch (error) {
          caught = error as Error;
        }
        expect(caught === failure).assertTrue();
        expect(resolver.calls).assertEqual(0);
        expect(nativeParser.inputs.length).assertEqual(1);
        nativeParser.failure = undefined;
        const recovered = await wrapper.parse([]);
        await assertSource(recovered, type, 0, "wrapper-reject:10");
        expect(nativeParser.inputs.length).assertEqual(2);
        expect(resolver.calls).assertEqual(0);
      } finally {
        EtsFactory.factory = previousFactory;
      }
      expect(EtsFactory.factory === previousFactory).assertTrue();
    });

    /**
     * @tc.name WrapperRejectionTest_case_012
     * @tc.desc wrapper-reject: real wrapper with a controlled native dependency; input vector 12.
     * @tc.type Function
     * @tc.level Level1
     */
    it('WrapperRejectionTest_case_012', 0, async () => {
      await waitForNativeFactory();
      const previousFactory = EtsFactory.factory;
      const nativeParser = new ControlledParser();
      const factory = new ControlledFactory(nativeParser);
      const resolver = new RecordingResolver();
      const type = "test.wrapper-reject.11";
      registry.registerCard(type, resolver);
      nativeParser.result = makeSource(type, 1, "wrapper-reject:11");
      EtsFactory.factory = factory;
      try {
        const wrapper = new DataParserStaW();
        expect(factory.calls).assertEqual(1);
        const failure = new Error("native-rejection-11");
        nativeParser.failure = failure;
        nativeParser.synchronousFailure = false;
        let caught: Error | undefined = undefined;
        try {
          await wrapper.parse([]);
        } catch (error) {
          caught = error as Error;
        }
        expect(caught === failure).assertTrue();
        expect(resolver.calls).assertEqual(0);
        expect(nativeParser.inputs.length).assertEqual(1);
        nativeParser.failure = undefined;
        const recovered = await wrapper.parse([]);
        await assertSource(recovered, type, 1, "wrapper-reject:11");
        expect(nativeParser.inputs.length).assertEqual(2);
        expect(resolver.calls).assertEqual(1);
      } finally {
        EtsFactory.factory = previousFactory;
      }
      expect(EtsFactory.factory === previousFactory).assertTrue();
    });
  });
}
