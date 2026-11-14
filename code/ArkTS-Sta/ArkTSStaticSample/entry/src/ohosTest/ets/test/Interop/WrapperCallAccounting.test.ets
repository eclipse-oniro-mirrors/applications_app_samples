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

// Reference: ets/test/Validation/LoggerValidation.test.ets
// Original line floor: 851; scenario family: wrapper-calls.
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

export default function WrapperCallAccountingTest(): void {
  describe('WrapperCallAccountingTest', () => {
    beforeAll(() => {
      logSuite('WrapperCallAccountingTest', 'begin');
    });
    beforeEach(async () => {
      // Yield between cases so device watchdog and UI events can be processed.
      await new Promise<void>((resolve) => { setTimeout(resolve, 1); });
    });
    afterAll(() => {
      logSuite('WrapperCallAccountingTest', 'end');
    });

    /**
     * @tc.name WrapperCallAccountingTest_case_001
     * @tc.desc wrapper-calls: real wrapper with a controlled native dependency; input vector 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('WrapperCallAccountingTest_case_001', 0, async () => {
      await waitForNativeFactory();
      const previousFactory = EtsFactory.factory;
      const nativeParser = new ControlledParser();
      const factory = new ControlledFactory(nativeParser);
      const resolver = new RecordingResolver();
      const type = "test.wrapper-calls.0";
      registry.registerCard(type, resolver);
      nativeParser.result = makeSource(type, 0, "wrapper-calls:0");
      EtsFactory.factory = factory;
      try {
        const wrapper = new DataParserStaW();
        expect(factory.calls).assertEqual(1);
        const input = makeGroup(type, 0, "wrapper-calls:0");
        const serialized = JSON.stringify([input]);
        const output = await wrapper.parse(serialized);
        expect(nativeParser.inputs.length).assertEqual(1);
        expect(typeof nativeParser.inputs[0]).assertEqual('string');
        expect(nativeParser.inputs[0]).assertEqual(serialized);
        await assertSource(output, type, 0, "wrapper-calls:0");
        expect(resolver.calls).assertEqual(0);
        expect(factory.calls).assertEqual(1);
        expect(output === nativeParser.result).assertFalse();
        expect(nativeParser.result.totalCount()).assertEqual(0);
        expect(JSON.stringify([input])).assertEqual(serialized);
      } finally {
        EtsFactory.factory = previousFactory;
      }
      expect(EtsFactory.factory === previousFactory).assertTrue();
    });

    /**
     * @tc.name WrapperCallAccountingTest_case_002
     * @tc.desc wrapper-calls: real wrapper with a controlled native dependency; input vector 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('WrapperCallAccountingTest_case_002', 0, async () => {
      await waitForNativeFactory();
      const previousFactory = EtsFactory.factory;
      const nativeParser = new ControlledParser();
      const factory = new ControlledFactory(nativeParser);
      const resolver = new RecordingResolver();
      const type = "test.wrapper-calls.1";
      registry.registerCard(type, resolver);
      nativeParser.result = makeSource(type, 1, "wrapper-calls:1");
      EtsFactory.factory = factory;
      try {
        const wrapper = new DataParserStaW();
        expect(factory.calls).assertEqual(1);
        const input = makeGroup(type, 1, "wrapper-calls:1");
        const serialized = JSON.stringify([input]);
        const output = await wrapper.parse([input]);
        expect(nativeParser.inputs.length).assertEqual(1);
        expect(typeof nativeParser.inputs[0]).assertEqual('string');
        expect(nativeParser.inputs[0]).assertEqual(serialized);
        await assertSource(output, type, 1, "wrapper-calls:1");
        expect(resolver.calls).assertEqual(1);
        expect(factory.calls).assertEqual(1);
        expect(output === nativeParser.result).assertFalse();
        expect(nativeParser.result.totalCount()).assertEqual(1);
        expect(JSON.stringify([input])).assertEqual(serialized);
      } finally {
        EtsFactory.factory = previousFactory;
      }
      expect(EtsFactory.factory === previousFactory).assertTrue();
    });

    /**
     * @tc.name WrapperCallAccountingTest_case_003
     * @tc.desc wrapper-calls: real wrapper with a controlled native dependency; input vector 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('WrapperCallAccountingTest_case_003', 0, async () => {
      await waitForNativeFactory();
      const previousFactory = EtsFactory.factory;
      const nativeParser = new ControlledParser();
      const factory = new ControlledFactory(nativeParser);
      const resolver = new RecordingResolver();
      const type = "test.wrapper-calls.2";
      registry.registerCard(type, resolver);
      nativeParser.result = makeSource(type, 2, "wrapper-calls:2");
      EtsFactory.factory = factory;
      try {
        const wrapper = new DataParserStaW();
        expect(factory.calls).assertEqual(1);
        const input = makeGroup(type, 2, "wrapper-calls:2");
        const serialized = JSON.stringify(input);
        const output = await wrapper.parse(input);
        expect(nativeParser.inputs.length).assertEqual(1);
        expect(typeof nativeParser.inputs[0]).assertEqual('string');
        expect(nativeParser.inputs[0]).assertEqual(serialized);
        await assertSource(output, type, 2, "wrapper-calls:2");
        expect(resolver.calls).assertEqual(2);
        expect(factory.calls).assertEqual(1);
        expect(output === nativeParser.result).assertFalse();
        expect(nativeParser.result.totalCount()).assertEqual(2);
        expect(JSON.stringify(input)).assertEqual(serialized);
      } finally {
        EtsFactory.factory = previousFactory;
      }
      expect(EtsFactory.factory === previousFactory).assertTrue();
    });

    /**
     * @tc.name WrapperCallAccountingTest_case_004
     * @tc.desc wrapper-calls: real wrapper with a controlled native dependency; input vector 4.
     * @tc.type Function
     * @tc.level Level1
     */
    it('WrapperCallAccountingTest_case_004', 0, async () => {
      await waitForNativeFactory();
      const previousFactory = EtsFactory.factory;
      const nativeParser = new ControlledParser();
      const factory = new ControlledFactory(nativeParser);
      const resolver = new RecordingResolver();
      const type = "test.wrapper-calls.3";
      registry.registerCard(type, resolver);
      nativeParser.result = makeSource(type, 3, "wrapper-calls:3");
      EtsFactory.factory = factory;
      try {
        const wrapper = new DataParserStaW();
        expect(factory.calls).assertEqual(1);
        const input = makeGroup(type, 3, "wrapper-calls:3");
        const serialized = JSON.stringify([input]);
        const output = await wrapper.parse([input]);
        expect(nativeParser.inputs.length).assertEqual(1);
        expect(typeof nativeParser.inputs[0]).assertEqual('string');
        expect(nativeParser.inputs[0]).assertEqual(serialized);
        await assertSource(output, type, 3, "wrapper-calls:3");
        expect(resolver.calls).assertEqual(3);
        expect(factory.calls).assertEqual(1);
        expect(output === nativeParser.result).assertFalse();
        expect(nativeParser.result.totalCount()).assertEqual(3);
        expect(JSON.stringify([input])).assertEqual(serialized);
      } finally {
        EtsFactory.factory = previousFactory;
      }
      expect(EtsFactory.factory === previousFactory).assertTrue();
    });

    /**
     * @tc.name WrapperCallAccountingTest_case_005
     * @tc.desc wrapper-calls: real wrapper with a controlled native dependency; input vector 5.
     * @tc.type Function
     * @tc.level Level1
     */
    it('WrapperCallAccountingTest_case_005', 0, async () => {
      await waitForNativeFactory();
      const previousFactory = EtsFactory.factory;
      const nativeParser = new ControlledParser();
      const factory = new ControlledFactory(nativeParser);
      const resolver = new RecordingResolver();
      const type = "test.wrapper-calls.4";
      registry.registerCard(type, resolver);
      nativeParser.result = makeSource(type, 4, "wrapper-calls:4");
      EtsFactory.factory = factory;
      try {
        const wrapper = new DataParserStaW();
        expect(factory.calls).assertEqual(1);
        const input = makeGroup(type, 4, "wrapper-calls:4");
        const serialized = JSON.stringify([input]);
        const output = await wrapper.parse(serialized);
        expect(nativeParser.inputs.length).assertEqual(1);
        expect(typeof nativeParser.inputs[0]).assertEqual('string');
        expect(nativeParser.inputs[0]).assertEqual(serialized);
        await assertSource(output, type, 4, "wrapper-calls:4");
        expect(resolver.calls).assertEqual(4);
        expect(factory.calls).assertEqual(1);
        expect(output === nativeParser.result).assertFalse();
        expect(nativeParser.result.totalCount()).assertEqual(4);
        expect(JSON.stringify([input])).assertEqual(serialized);
      } finally {
        EtsFactory.factory = previousFactory;
      }
      expect(EtsFactory.factory === previousFactory).assertTrue();
    });

    /**
     * @tc.name WrapperCallAccountingTest_case_006
     * @tc.desc wrapper-calls: real wrapper with a controlled native dependency; input vector 6.
     * @tc.type Function
     * @tc.level Level1
     */
    it('WrapperCallAccountingTest_case_006', 0, async () => {
      await waitForNativeFactory();
      const previousFactory = EtsFactory.factory;
      const nativeParser = new ControlledParser();
      const factory = new ControlledFactory(nativeParser);
      const resolver = new RecordingResolver();
      const type = "test.wrapper-calls.5";
      registry.registerCard(type, resolver);
      nativeParser.result = makeSource(type, 0, "wrapper-calls:5");
      EtsFactory.factory = factory;
      try {
        const wrapper = new DataParserStaW();
        expect(factory.calls).assertEqual(1);
        const input = makeGroup(type, 0, "wrapper-calls:5");
        const serialized = JSON.stringify([input]);
        const output = await wrapper.parse([input]);
        expect(nativeParser.inputs.length).assertEqual(1);
        expect(typeof nativeParser.inputs[0]).assertEqual('string');
        expect(nativeParser.inputs[0]).assertEqual(serialized);
        await assertSource(output, type, 0, "wrapper-calls:5");
        expect(resolver.calls).assertEqual(0);
        expect(factory.calls).assertEqual(1);
        expect(output === nativeParser.result).assertFalse();
        expect(nativeParser.result.totalCount()).assertEqual(0);
        expect(JSON.stringify([input])).assertEqual(serialized);
      } finally {
        EtsFactory.factory = previousFactory;
      }
      expect(EtsFactory.factory === previousFactory).assertTrue();
    });

    /**
     * @tc.name WrapperCallAccountingTest_case_007
     * @tc.desc wrapper-calls: real wrapper with a controlled native dependency; input vector 7.
     * @tc.type Function
     * @tc.level Level1
     */
    it('WrapperCallAccountingTest_case_007', 0, async () => {
      await waitForNativeFactory();
      const previousFactory = EtsFactory.factory;
      const nativeParser = new ControlledParser();
      const factory = new ControlledFactory(nativeParser);
      const resolver = new RecordingResolver();
      const type = "test.wrapper-calls.6";
      registry.registerCard(type, resolver);
      nativeParser.result = makeSource(type, 1, "wrapper-calls:6");
      EtsFactory.factory = factory;
      try {
        const wrapper = new DataParserStaW();
        expect(factory.calls).assertEqual(1);
        const input = makeGroup(type, 1, "wrapper-calls:6");
        const serialized = JSON.stringify(input);
        const output = await wrapper.parse(input);
        expect(nativeParser.inputs.length).assertEqual(1);
        expect(typeof nativeParser.inputs[0]).assertEqual('string');
        expect(nativeParser.inputs[0]).assertEqual(serialized);
        await assertSource(output, type, 1, "wrapper-calls:6");
        expect(resolver.calls).assertEqual(1);
        expect(factory.calls).assertEqual(1);
        expect(output === nativeParser.result).assertFalse();
        expect(nativeParser.result.totalCount()).assertEqual(1);
        expect(JSON.stringify(input)).assertEqual(serialized);
      } finally {
        EtsFactory.factory = previousFactory;
      }
      expect(EtsFactory.factory === previousFactory).assertTrue();
    });

    /**
     * @tc.name WrapperCallAccountingTest_case_008
     * @tc.desc wrapper-calls: real wrapper with a controlled native dependency; input vector 8.
     * @tc.type Function
     * @tc.level Level1
     */
    it('WrapperCallAccountingTest_case_008', 0, async () => {
      await waitForNativeFactory();
      const previousFactory = EtsFactory.factory;
      const nativeParser = new ControlledParser();
      const factory = new ControlledFactory(nativeParser);
      const resolver = new RecordingResolver();
      const type = "test.wrapper-calls.7";
      registry.registerCard(type, resolver);
      nativeParser.result = makeSource(type, 2, "wrapper-calls:7");
      EtsFactory.factory = factory;
      try {
        const wrapper = new DataParserStaW();
        expect(factory.calls).assertEqual(1);
        const input = makeGroup(type, 2, "wrapper-calls:7");
        const serialized = JSON.stringify([input]);
        const output = await wrapper.parse([input]);
        expect(nativeParser.inputs.length).assertEqual(1);
        expect(typeof nativeParser.inputs[0]).assertEqual('string');
        expect(nativeParser.inputs[0]).assertEqual(serialized);
        await assertSource(output, type, 2, "wrapper-calls:7");
        expect(resolver.calls).assertEqual(2);
        expect(factory.calls).assertEqual(1);
        expect(output === nativeParser.result).assertFalse();
        expect(nativeParser.result.totalCount()).assertEqual(2);
        expect(JSON.stringify([input])).assertEqual(serialized);
      } finally {
        EtsFactory.factory = previousFactory;
      }
      expect(EtsFactory.factory === previousFactory).assertTrue();
    });

    /**
     * @tc.name WrapperCallAccountingTest_case_009
     * @tc.desc wrapper-calls: real wrapper with a controlled native dependency; input vector 9.
     * @tc.type Function
     * @tc.level Level1
     */
    it('WrapperCallAccountingTest_case_009', 0, async () => {
      await waitForNativeFactory();
      const previousFactory = EtsFactory.factory;
      const nativeParser = new ControlledParser();
      const factory = new ControlledFactory(nativeParser);
      const resolver = new RecordingResolver();
      const type = "test.wrapper-calls.8";
      registry.registerCard(type, resolver);
      nativeParser.result = makeSource(type, 3, "wrapper-calls:8");
      EtsFactory.factory = factory;
      try {
        const wrapper = new DataParserStaW();
        expect(factory.calls).assertEqual(1);
        const input = makeGroup(type, 3, "wrapper-calls:8");
        const serialized = JSON.stringify([input]);
        const output = await wrapper.parse(serialized);
        expect(nativeParser.inputs.length).assertEqual(1);
        expect(typeof nativeParser.inputs[0]).assertEqual('string');
        expect(nativeParser.inputs[0]).assertEqual(serialized);
        await assertSource(output, type, 3, "wrapper-calls:8");
        expect(resolver.calls).assertEqual(3);
        expect(factory.calls).assertEqual(1);
        expect(output === nativeParser.result).assertFalse();
        expect(nativeParser.result.totalCount()).assertEqual(3);
        expect(JSON.stringify([input])).assertEqual(serialized);
      } finally {
        EtsFactory.factory = previousFactory;
      }
      expect(EtsFactory.factory === previousFactory).assertTrue();
    });

    /**
     * @tc.name WrapperCallAccountingTest_case_010
     * @tc.desc wrapper-calls: real wrapper with a controlled native dependency; input vector 10.
     * @tc.type Function
     * @tc.level Level1
     */
    it('WrapperCallAccountingTest_case_010', 0, async () => {
      await waitForNativeFactory();
      const previousFactory = EtsFactory.factory;
      const nativeParser = new ControlledParser();
      const factory = new ControlledFactory(nativeParser);
      const resolver = new RecordingResolver();
      const type = "test.wrapper-calls.9";
      registry.registerCard(type, resolver);
      nativeParser.result = makeSource(type, 4, "wrapper-calls:9");
      EtsFactory.factory = factory;
      try {
        const wrapper = new DataParserStaW();
        expect(factory.calls).assertEqual(1);
        const input = makeGroup(type, 4, "wrapper-calls:9");
        const serialized = JSON.stringify([input]);
        const output = await wrapper.parse([input]);
        expect(nativeParser.inputs.length).assertEqual(1);
        expect(typeof nativeParser.inputs[0]).assertEqual('string');
        expect(nativeParser.inputs[0]).assertEqual(serialized);
        await assertSource(output, type, 4, "wrapper-calls:9");
        expect(resolver.calls).assertEqual(4);
        expect(factory.calls).assertEqual(1);
        expect(output === nativeParser.result).assertFalse();
        expect(nativeParser.result.totalCount()).assertEqual(4);
        expect(JSON.stringify([input])).assertEqual(serialized);
      } finally {
        EtsFactory.factory = previousFactory;
      }
      expect(EtsFactory.factory === previousFactory).assertTrue();
    });

    /**
     * @tc.name WrapperCallAccountingTest_case_011
     * @tc.desc wrapper-calls: real wrapper with a controlled native dependency; input vector 11.
     * @tc.type Function
     * @tc.level Level1
     */
    it('WrapperCallAccountingTest_case_011', 0, async () => {
      await waitForNativeFactory();
      const previousFactory = EtsFactory.factory;
      const nativeParser = new ControlledParser();
      const factory = new ControlledFactory(nativeParser);
      const resolver = new RecordingResolver();
      const type = "test.wrapper-calls.10";
      registry.registerCard(type, resolver);
      nativeParser.result = makeSource(type, 0, "wrapper-calls:10");
      EtsFactory.factory = factory;
      try {
        const wrapper = new DataParserStaW();
        expect(factory.calls).assertEqual(1);
        const input = makeGroup(type, 0, "wrapper-calls:10");
        const serialized = JSON.stringify(input);
        const output = await wrapper.parse(input);
        expect(nativeParser.inputs.length).assertEqual(1);
        expect(typeof nativeParser.inputs[0]).assertEqual('string');
        expect(nativeParser.inputs[0]).assertEqual(serialized);
        await assertSource(output, type, 0, "wrapper-calls:10");
        expect(resolver.calls).assertEqual(0);
        expect(factory.calls).assertEqual(1);
        expect(output === nativeParser.result).assertFalse();
        expect(nativeParser.result.totalCount()).assertEqual(0);
        expect(JSON.stringify(input)).assertEqual(serialized);
      } finally {
        EtsFactory.factory = previousFactory;
      }
      expect(EtsFactory.factory === previousFactory).assertTrue();
    });

    /**
     * @tc.name WrapperCallAccountingTest_case_012
     * @tc.desc wrapper-calls: real wrapper with a controlled native dependency; input vector 12.
     * @tc.type Function
     * @tc.level Level1
     */
    it('WrapperCallAccountingTest_case_012', 0, async () => {
      await waitForNativeFactory();
      const previousFactory = EtsFactory.factory;
      const nativeParser = new ControlledParser();
      const factory = new ControlledFactory(nativeParser);
      const resolver = new RecordingResolver();
      const type = "test.wrapper-calls.11";
      registry.registerCard(type, resolver);
      nativeParser.result = makeSource(type, 1, "wrapper-calls:11");
      EtsFactory.factory = factory;
      try {
        const wrapper = new DataParserStaW();
        expect(factory.calls).assertEqual(1);
        const input = makeGroup(type, 1, "wrapper-calls:11");
        const serialized = JSON.stringify([input]);
        const output = await wrapper.parse([input]);
        expect(nativeParser.inputs.length).assertEqual(1);
        expect(typeof nativeParser.inputs[0]).assertEqual('string');
        expect(nativeParser.inputs[0]).assertEqual(serialized);
        await assertSource(output, type, 1, "wrapper-calls:11");
        expect(resolver.calls).assertEqual(1);
        expect(factory.calls).assertEqual(1);
        expect(output === nativeParser.result).assertFalse();
        expect(nativeParser.result.totalCount()).assertEqual(1);
        expect(JSON.stringify([input])).assertEqual(serialized);
      } finally {
        EtsFactory.factory = previousFactory;
      }
      expect(EtsFactory.factory === previousFactory).assertTrue();
    });

    /**
     * @tc.name WrapperCallAccountingTest_case_013
     * @tc.desc wrapper-calls: real wrapper with a controlled native dependency; input vector 13.
     * @tc.type Function
     * @tc.level Level1
     */
    it('WrapperCallAccountingTest_case_013', 0, async () => {
      await waitForNativeFactory();
      const previousFactory = EtsFactory.factory;
      const nativeParser = new ControlledParser();
      const factory = new ControlledFactory(nativeParser);
      const resolver = new RecordingResolver();
      const type = "test.wrapper-calls.12";
      registry.registerCard(type, resolver);
      nativeParser.result = makeSource(type, 2, "wrapper-calls:12");
      EtsFactory.factory = factory;
      try {
        const wrapper = new DataParserStaW();
        expect(factory.calls).assertEqual(1);
        const input = makeGroup(type, 2, "wrapper-calls:12");
        const serialized = JSON.stringify([input]);
        const output = await wrapper.parse(serialized);
        expect(nativeParser.inputs.length).assertEqual(1);
        expect(typeof nativeParser.inputs[0]).assertEqual('string');
        expect(nativeParser.inputs[0]).assertEqual(serialized);
        await assertSource(output, type, 2, "wrapper-calls:12");
        expect(resolver.calls).assertEqual(2);
        expect(factory.calls).assertEqual(1);
        expect(output === nativeParser.result).assertFalse();
        expect(nativeParser.result.totalCount()).assertEqual(2);
        expect(JSON.stringify([input])).assertEqual(serialized);
      } finally {
        EtsFactory.factory = previousFactory;
      }
      expect(EtsFactory.factory === previousFactory).assertTrue();
    });

    /**
     * @tc.name WrapperCallAccountingTest_case_014
     * @tc.desc wrapper-calls: real wrapper with a controlled native dependency; input vector 14.
     * @tc.type Function
     * @tc.level Level1
     */
    it('WrapperCallAccountingTest_case_014', 0, async () => {
      await waitForNativeFactory();
      const previousFactory = EtsFactory.factory;
      const nativeParser = new ControlledParser();
      const factory = new ControlledFactory(nativeParser);
      const resolver = new RecordingResolver();
      const type = "test.wrapper-calls.13";
      registry.registerCard(type, resolver);
      nativeParser.result = makeSource(type, 3, "wrapper-calls:13");
      EtsFactory.factory = factory;
      try {
        const wrapper = new DataParserStaW();
        expect(factory.calls).assertEqual(1);
        const input = makeGroup(type, 3, "wrapper-calls:13");
        const serialized = JSON.stringify([input]);
        const output = await wrapper.parse([input]);
        expect(nativeParser.inputs.length).assertEqual(1);
        expect(typeof nativeParser.inputs[0]).assertEqual('string');
        expect(nativeParser.inputs[0]).assertEqual(serialized);
        await assertSource(output, type, 3, "wrapper-calls:13");
        expect(resolver.calls).assertEqual(3);
        expect(factory.calls).assertEqual(1);
        expect(output === nativeParser.result).assertFalse();
        expect(nativeParser.result.totalCount()).assertEqual(3);
        expect(JSON.stringify([input])).assertEqual(serialized);
      } finally {
        EtsFactory.factory = previousFactory;
      }
      expect(EtsFactory.factory === previousFactory).assertTrue();
    });

    /**
     * @tc.name WrapperCallAccountingTest_case_015
     * @tc.desc wrapper-calls: real wrapper with a controlled native dependency; input vector 15.
     * @tc.type Function
     * @tc.level Level1
     */
    it('WrapperCallAccountingTest_case_015', 0, async () => {
      await waitForNativeFactory();
      const previousFactory = EtsFactory.factory;
      const nativeParser = new ControlledParser();
      const factory = new ControlledFactory(nativeParser);
      const resolver = new RecordingResolver();
      const type = "test.wrapper-calls.14";
      registry.registerCard(type, resolver);
      nativeParser.result = makeSource(type, 4, "wrapper-calls:14");
      EtsFactory.factory = factory;
      try {
        const wrapper = new DataParserStaW();
        expect(factory.calls).assertEqual(1);
        const input = makeGroup(type, 4, "wrapper-calls:14");
        const serialized = JSON.stringify(input);
        const output = await wrapper.parse(input);
        expect(nativeParser.inputs.length).assertEqual(1);
        expect(typeof nativeParser.inputs[0]).assertEqual('string');
        expect(nativeParser.inputs[0]).assertEqual(serialized);
        await assertSource(output, type, 4, "wrapper-calls:14");
        expect(resolver.calls).assertEqual(4);
        expect(factory.calls).assertEqual(1);
        expect(output === nativeParser.result).assertFalse();
        expect(nativeParser.result.totalCount()).assertEqual(4);
        expect(JSON.stringify(input)).assertEqual(serialized);
      } finally {
        EtsFactory.factory = previousFactory;
      }
      expect(EtsFactory.factory === previousFactory).assertTrue();
    });

    /**
     * @tc.name WrapperCallAccountingTest_case_016
     * @tc.desc wrapper-calls: real wrapper with a controlled native dependency; input vector 16.
     * @tc.type Function
     * @tc.level Level1
     */
    it('WrapperCallAccountingTest_case_016', 0, async () => {
      await waitForNativeFactory();
      const previousFactory = EtsFactory.factory;
      const nativeParser = new ControlledParser();
      const factory = new ControlledFactory(nativeParser);
      const resolver = new RecordingResolver();
      const type = "test.wrapper-calls.15";
      registry.registerCard(type, resolver);
      nativeParser.result = makeSource(type, 0, "wrapper-calls:15");
      EtsFactory.factory = factory;
      try {
        const wrapper = new DataParserStaW();
        expect(factory.calls).assertEqual(1);
        const input = makeGroup(type, 0, "wrapper-calls:15");
        const serialized = JSON.stringify([input]);
        const output = await wrapper.parse([input]);
        expect(nativeParser.inputs.length).assertEqual(1);
        expect(typeof nativeParser.inputs[0]).assertEqual('string');
        expect(nativeParser.inputs[0]).assertEqual(serialized);
        await assertSource(output, type, 0, "wrapper-calls:15");
        expect(resolver.calls).assertEqual(0);
        expect(factory.calls).assertEqual(1);
        expect(output === nativeParser.result).assertFalse();
        expect(nativeParser.result.totalCount()).assertEqual(0);
        expect(JSON.stringify([input])).assertEqual(serialized);
      } finally {
        EtsFactory.factory = previousFactory;
      }
      expect(EtsFactory.factory === previousFactory).assertTrue();
    });

    /**
     * @tc.name WrapperCallAccountingTest_case_017
     * @tc.desc wrapper-calls: real wrapper with a controlled native dependency; input vector 17.
     * @tc.type Function
     * @tc.level Level1
     */
    it('WrapperCallAccountingTest_case_017', 0, async () => {
      await waitForNativeFactory();
      const previousFactory = EtsFactory.factory;
      const nativeParser = new ControlledParser();
      const factory = new ControlledFactory(nativeParser);
      const resolver = new RecordingResolver();
      const type = "test.wrapper-calls.16";
      registry.registerCard(type, resolver);
      nativeParser.result = makeSource(type, 1, "wrapper-calls:16");
      EtsFactory.factory = factory;
      try {
        const wrapper = new DataParserStaW();
        expect(factory.calls).assertEqual(1);
        const input = makeGroup(type, 1, "wrapper-calls:16");
        const serialized = JSON.stringify([input]);
        const output = await wrapper.parse(serialized);
        expect(nativeParser.inputs.length).assertEqual(1);
        expect(typeof nativeParser.inputs[0]).assertEqual('string');
        expect(nativeParser.inputs[0]).assertEqual(serialized);
        await assertSource(output, type, 1, "wrapper-calls:16");
        expect(resolver.calls).assertEqual(1);
        expect(factory.calls).assertEqual(1);
        expect(output === nativeParser.result).assertFalse();
        expect(nativeParser.result.totalCount()).assertEqual(1);
        expect(JSON.stringify([input])).assertEqual(serialized);
      } finally {
        EtsFactory.factory = previousFactory;
      }
      expect(EtsFactory.factory === previousFactory).assertTrue();
    });

    /**
     * @tc.name WrapperCallAccountingTest_case_018
     * @tc.desc wrapper-calls: real wrapper with a controlled native dependency; input vector 18.
     * @tc.type Function
     * @tc.level Level1
     */
    it('WrapperCallAccountingTest_case_018', 0, async () => {
      await waitForNativeFactory();
      const previousFactory = EtsFactory.factory;
      const nativeParser = new ControlledParser();
      const factory = new ControlledFactory(nativeParser);
      const resolver = new RecordingResolver();
      const type = "test.wrapper-calls.17";
      registry.registerCard(type, resolver);
      nativeParser.result = makeSource(type, 2, "wrapper-calls:17");
      EtsFactory.factory = factory;
      try {
        const wrapper = new DataParserStaW();
        expect(factory.calls).assertEqual(1);
        const input = makeGroup(type, 2, "wrapper-calls:17");
        const serialized = JSON.stringify([input]);
        const output = await wrapper.parse([input]);
        expect(nativeParser.inputs.length).assertEqual(1);
        expect(typeof nativeParser.inputs[0]).assertEqual('string');
        expect(nativeParser.inputs[0]).assertEqual(serialized);
        await assertSource(output, type, 2, "wrapper-calls:17");
        expect(resolver.calls).assertEqual(2);
        expect(factory.calls).assertEqual(1);
        expect(output === nativeParser.result).assertFalse();
        expect(nativeParser.result.totalCount()).assertEqual(2);
        expect(JSON.stringify([input])).assertEqual(serialized);
      } finally {
        EtsFactory.factory = previousFactory;
      }
      expect(EtsFactory.factory === previousFactory).assertTrue();
    });

    /**
     * @tc.name WrapperCallAccountingTest_case_019
     * @tc.desc wrapper-calls: real wrapper with a controlled native dependency; input vector 19.
     * @tc.type Function
     * @tc.level Level1
     */
    it('WrapperCallAccountingTest_case_019', 0, async () => {
      await waitForNativeFactory();
      const previousFactory = EtsFactory.factory;
      const nativeParser = new ControlledParser();
      const factory = new ControlledFactory(nativeParser);
      const resolver = new RecordingResolver();
      const type = "test.wrapper-calls.18";
      registry.registerCard(type, resolver);
      nativeParser.result = makeSource(type, 3, "wrapper-calls:18");
      EtsFactory.factory = factory;
      try {
        const wrapper = new DataParserStaW();
        expect(factory.calls).assertEqual(1);
        const input = makeGroup(type, 3, "wrapper-calls:18");
        const serialized = JSON.stringify(input);
        const output = await wrapper.parse(input);
        expect(nativeParser.inputs.length).assertEqual(1);
        expect(typeof nativeParser.inputs[0]).assertEqual('string');
        expect(nativeParser.inputs[0]).assertEqual(serialized);
        await assertSource(output, type, 3, "wrapper-calls:18");
        expect(resolver.calls).assertEqual(3);
        expect(factory.calls).assertEqual(1);
        expect(output === nativeParser.result).assertFalse();
        expect(nativeParser.result.totalCount()).assertEqual(3);
        expect(JSON.stringify(input)).assertEqual(serialized);
      } finally {
        EtsFactory.factory = previousFactory;
      }
      expect(EtsFactory.factory === previousFactory).assertTrue();
    });

    /**
     * @tc.name WrapperCallAccountingTest_case_020
     * @tc.desc wrapper-calls: real wrapper with a controlled native dependency; input vector 20.
     * @tc.type Function
     * @tc.level Level1
     */
    it('WrapperCallAccountingTest_case_020', 0, async () => {
      await waitForNativeFactory();
      const previousFactory = EtsFactory.factory;
      const nativeParser = new ControlledParser();
      const factory = new ControlledFactory(nativeParser);
      const resolver = new RecordingResolver();
      const type = "test.wrapper-calls.19";
      registry.registerCard(type, resolver);
      nativeParser.result = makeSource(type, 4, "wrapper-calls:19");
      EtsFactory.factory = factory;
      try {
        const wrapper = new DataParserStaW();
        expect(factory.calls).assertEqual(1);
        const input = makeGroup(type, 4, "wrapper-calls:19");
        const serialized = JSON.stringify([input]);
        const output = await wrapper.parse([input]);
        expect(nativeParser.inputs.length).assertEqual(1);
        expect(typeof nativeParser.inputs[0]).assertEqual('string');
        expect(nativeParser.inputs[0]).assertEqual(serialized);
        await assertSource(output, type, 4, "wrapper-calls:19");
        expect(resolver.calls).assertEqual(4);
        expect(factory.calls).assertEqual(1);
        expect(output === nativeParser.result).assertFalse();
        expect(nativeParser.result.totalCount()).assertEqual(4);
        expect(JSON.stringify([input])).assertEqual(serialized);
      } finally {
        EtsFactory.factory = previousFactory;
      }
      expect(EtsFactory.factory === previousFactory).assertTrue();
    });

    /**
     * @tc.name WrapperCallAccountingTest_case_021
     * @tc.desc wrapper-calls: real wrapper with a controlled native dependency; input vector 21.
     * @tc.type Function
     * @tc.level Level1
     */
    it('WrapperCallAccountingTest_case_021', 0, async () => {
      await waitForNativeFactory();
      const previousFactory = EtsFactory.factory;
      const nativeParser = new ControlledParser();
      const factory = new ControlledFactory(nativeParser);
      const resolver = new RecordingResolver();
      const type = "test.wrapper-calls.20";
      registry.registerCard(type, resolver);
      nativeParser.result = makeSource(type, 0, "wrapper-calls:20");
      EtsFactory.factory = factory;
      try {
        const wrapper = new DataParserStaW();
        expect(factory.calls).assertEqual(1);
        const input = makeGroup(type, 0, "wrapper-calls:20");
        const serialized = JSON.stringify([input]);
        const output = await wrapper.parse(serialized);
        expect(nativeParser.inputs.length).assertEqual(1);
        expect(typeof nativeParser.inputs[0]).assertEqual('string');
        expect(nativeParser.inputs[0]).assertEqual(serialized);
        await assertSource(output, type, 0, "wrapper-calls:20");
        expect(resolver.calls).assertEqual(0);
        expect(factory.calls).assertEqual(1);
        expect(output === nativeParser.result).assertFalse();
        expect(nativeParser.result.totalCount()).assertEqual(0);
        expect(JSON.stringify([input])).assertEqual(serialized);
      } finally {
        EtsFactory.factory = previousFactory;
      }
      expect(EtsFactory.factory === previousFactory).assertTrue();
    });

    /**
     * @tc.name WrapperCallAccountingTest_case_022
     * @tc.desc wrapper-calls: real wrapper with a controlled native dependency; input vector 22.
     * @tc.type Function
     * @tc.level Level1
     */
    it('WrapperCallAccountingTest_case_022', 0, async () => {
      await waitForNativeFactory();
      const previousFactory = EtsFactory.factory;
      const nativeParser = new ControlledParser();
      const factory = new ControlledFactory(nativeParser);
      const resolver = new RecordingResolver();
      const type = "test.wrapper-calls.21";
      registry.registerCard(type, resolver);
      nativeParser.result = makeSource(type, 1, "wrapper-calls:21");
      EtsFactory.factory = factory;
      try {
        const wrapper = new DataParserStaW();
        expect(factory.calls).assertEqual(1);
        const input = makeGroup(type, 1, "wrapper-calls:21");
        const serialized = JSON.stringify([input]);
        const output = await wrapper.parse([input]);
        expect(nativeParser.inputs.length).assertEqual(1);
        expect(typeof nativeParser.inputs[0]).assertEqual('string');
        expect(nativeParser.inputs[0]).assertEqual(serialized);
        await assertSource(output, type, 1, "wrapper-calls:21");
        expect(resolver.calls).assertEqual(1);
        expect(factory.calls).assertEqual(1);
        expect(output === nativeParser.result).assertFalse();
        expect(nativeParser.result.totalCount()).assertEqual(1);
        expect(JSON.stringify([input])).assertEqual(serialized);
      } finally {
        EtsFactory.factory = previousFactory;
      }
      expect(EtsFactory.factory === previousFactory).assertTrue();
    });
  });
}
