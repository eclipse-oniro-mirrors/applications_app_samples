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

// Reference: ets/test/LifecycleState/SessionManagement.test.ets
// Original line floor: 407; scenario family: wrapper-replace.
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

export default function FactoryReplacementTest(): void {
  describe('FactoryReplacementTest', () => {
    beforeAll(() => {
      logSuite('FactoryReplacementTest', 'begin');
    });
    beforeEach(async () => {
      // Yield between cases so device watchdog and UI events can be processed.
      await new Promise<void>((resolve) => { setTimeout(resolve, 1); });
    });
    afterAll(() => {
      logSuite('FactoryReplacementTest', 'end');
    });

    /**
     * @tc.name FactoryReplacementTest_case_001
     * @tc.desc wrapper-replace: real wrapper with a controlled native dependency; input vector 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('FactoryReplacementTest_case_001', 0, async () => {
      await waitForNativeFactory();
      const previousFactory = EtsFactory.factory;
      const nativeParser = new ControlledParser();
      const factory = new ControlledFactory(nativeParser);
      const resolver = new RecordingResolver();
      const type = "test.wrapper-replace.0";
      registry.registerCard(type, resolver);
      nativeParser.result = makeSource(type, 0, "wrapper-replace:0");
      EtsFactory.factory = factory;
      try {
        const wrapper = new DataParserStaW();
        expect(factory.calls).assertEqual(1);
        const replacementParser = new ControlledParser();
        replacementParser.result = makeSource(type, 1, 'replacement');
        const replacement = new ControlledFactory(replacementParser);
        EtsFactory.factory = replacement;
        const secondWrapper = new DataParserStaW();
        const first = await wrapper.parse([]);
        const second = await secondWrapper.parse([]);
        await assertSource(first, type, 0, "wrapper-replace:0");
        await assertSource(second, type, 1, 'replacement');
        expect(factory.calls).assertEqual(1);
        expect(replacement.calls).assertEqual(1);
        expect(nativeParser.inputs.length).assertEqual(1);
        expect(replacementParser.inputs.length).assertEqual(1);
        expect(first === second).assertFalse();
      } finally {
        EtsFactory.factory = previousFactory;
      }
      expect(EtsFactory.factory === previousFactory).assertTrue();
    });

    /**
     * @tc.name FactoryReplacementTest_case_002
     * @tc.desc wrapper-replace: real wrapper with a controlled native dependency; input vector 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('FactoryReplacementTest_case_002', 0, async () => {
      await waitForNativeFactory();
      const previousFactory = EtsFactory.factory;
      const nativeParser = new ControlledParser();
      const factory = new ControlledFactory(nativeParser);
      const resolver = new RecordingResolver();
      const type = "test.wrapper-replace.1";
      registry.registerCard(type, resolver);
      nativeParser.result = makeSource(type, 1, "wrapper-replace:1");
      EtsFactory.factory = factory;
      try {
        const wrapper = new DataParserStaW();
        expect(factory.calls).assertEqual(1);
        const replacementParser = new ControlledParser();
        replacementParser.result = makeSource(type, 2, 'replacement');
        const replacement = new ControlledFactory(replacementParser);
        EtsFactory.factory = replacement;
        const secondWrapper = new DataParserStaW();
        const first = await wrapper.parse([]);
        const second = await secondWrapper.parse([]);
        await assertSource(first, type, 1, "wrapper-replace:1");
        await assertSource(second, type, 2, 'replacement');
        expect(factory.calls).assertEqual(1);
        expect(replacement.calls).assertEqual(1);
        expect(nativeParser.inputs.length).assertEqual(1);
        expect(replacementParser.inputs.length).assertEqual(1);
        expect(first === second).assertFalse();
      } finally {
        EtsFactory.factory = previousFactory;
      }
      expect(EtsFactory.factory === previousFactory).assertTrue();
    });

    /**
     * @tc.name FactoryReplacementTest_case_003
     * @tc.desc wrapper-replace: real wrapper with a controlled native dependency; input vector 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('FactoryReplacementTest_case_003', 0, async () => {
      await waitForNativeFactory();
      const previousFactory = EtsFactory.factory;
      const nativeParser = new ControlledParser();
      const factory = new ControlledFactory(nativeParser);
      const resolver = new RecordingResolver();
      const type = "test.wrapper-replace.2";
      registry.registerCard(type, resolver);
      nativeParser.result = makeSource(type, 2, "wrapper-replace:2");
      EtsFactory.factory = factory;
      try {
        const wrapper = new DataParserStaW();
        expect(factory.calls).assertEqual(1);
        const replacementParser = new ControlledParser();
        replacementParser.result = makeSource(type, 3, 'replacement');
        const replacement = new ControlledFactory(replacementParser);
        EtsFactory.factory = replacement;
        const secondWrapper = new DataParserStaW();
        const first = await wrapper.parse([]);
        const second = await secondWrapper.parse([]);
        await assertSource(first, type, 2, "wrapper-replace:2");
        await assertSource(second, type, 3, 'replacement');
        expect(factory.calls).assertEqual(1);
        expect(replacement.calls).assertEqual(1);
        expect(nativeParser.inputs.length).assertEqual(1);
        expect(replacementParser.inputs.length).assertEqual(1);
        expect(first === second).assertFalse();
      } finally {
        EtsFactory.factory = previousFactory;
      }
      expect(EtsFactory.factory === previousFactory).assertTrue();
    });

    /**
     * @tc.name FactoryReplacementTest_case_004
     * @tc.desc wrapper-replace: real wrapper with a controlled native dependency; input vector 4.
     * @tc.type Function
     * @tc.level Level1
     */
    it('FactoryReplacementTest_case_004', 0, async () => {
      await waitForNativeFactory();
      const previousFactory = EtsFactory.factory;
      const nativeParser = new ControlledParser();
      const factory = new ControlledFactory(nativeParser);
      const resolver = new RecordingResolver();
      const type = "test.wrapper-replace.3";
      registry.registerCard(type, resolver);
      nativeParser.result = makeSource(type, 3, "wrapper-replace:3");
      EtsFactory.factory = factory;
      try {
        const wrapper = new DataParserStaW();
        expect(factory.calls).assertEqual(1);
        const replacementParser = new ControlledParser();
        replacementParser.result = makeSource(type, 4, 'replacement');
        const replacement = new ControlledFactory(replacementParser);
        EtsFactory.factory = replacement;
        const secondWrapper = new DataParserStaW();
        const first = await wrapper.parse([]);
        const second = await secondWrapper.parse([]);
        await assertSource(first, type, 3, "wrapper-replace:3");
        await assertSource(second, type, 4, 'replacement');
        expect(factory.calls).assertEqual(1);
        expect(replacement.calls).assertEqual(1);
        expect(nativeParser.inputs.length).assertEqual(1);
        expect(replacementParser.inputs.length).assertEqual(1);
        expect(first === second).assertFalse();
      } finally {
        EtsFactory.factory = previousFactory;
      }
      expect(EtsFactory.factory === previousFactory).assertTrue();
    });

    /**
     * @tc.name FactoryReplacementTest_case_005
     * @tc.desc wrapper-replace: real wrapper with a controlled native dependency; input vector 5.
     * @tc.type Function
     * @tc.level Level1
     */
    it('FactoryReplacementTest_case_005', 0, async () => {
      await waitForNativeFactory();
      const previousFactory = EtsFactory.factory;
      const nativeParser = new ControlledParser();
      const factory = new ControlledFactory(nativeParser);
      const resolver = new RecordingResolver();
      const type = "test.wrapper-replace.4";
      registry.registerCard(type, resolver);
      nativeParser.result = makeSource(type, 4, "wrapper-replace:4");
      EtsFactory.factory = factory;
      try {
        const wrapper = new DataParserStaW();
        expect(factory.calls).assertEqual(1);
        const replacementParser = new ControlledParser();
        replacementParser.result = makeSource(type, 5, 'replacement');
        const replacement = new ControlledFactory(replacementParser);
        EtsFactory.factory = replacement;
        const secondWrapper = new DataParserStaW();
        const first = await wrapper.parse([]);
        const second = await secondWrapper.parse([]);
        await assertSource(first, type, 4, "wrapper-replace:4");
        await assertSource(second, type, 5, 'replacement');
        expect(factory.calls).assertEqual(1);
        expect(replacement.calls).assertEqual(1);
        expect(nativeParser.inputs.length).assertEqual(1);
        expect(replacementParser.inputs.length).assertEqual(1);
        expect(first === second).assertFalse();
      } finally {
        EtsFactory.factory = previousFactory;
      }
      expect(EtsFactory.factory === previousFactory).assertTrue();
    });

    /**
     * @tc.name FactoryReplacementTest_case_006
     * @tc.desc wrapper-replace: real wrapper with a controlled native dependency; input vector 6.
     * @tc.type Function
     * @tc.level Level1
     */
    it('FactoryReplacementTest_case_006', 0, async () => {
      await waitForNativeFactory();
      const previousFactory = EtsFactory.factory;
      const nativeParser = new ControlledParser();
      const factory = new ControlledFactory(nativeParser);
      const resolver = new RecordingResolver();
      const type = "test.wrapper-replace.5";
      registry.registerCard(type, resolver);
      nativeParser.result = makeSource(type, 0, "wrapper-replace:5");
      EtsFactory.factory = factory;
      try {
        const wrapper = new DataParserStaW();
        expect(factory.calls).assertEqual(1);
        const replacementParser = new ControlledParser();
        replacementParser.result = makeSource(type, 1, 'replacement');
        const replacement = new ControlledFactory(replacementParser);
        EtsFactory.factory = replacement;
        const secondWrapper = new DataParserStaW();
        const first = await wrapper.parse([]);
        const second = await secondWrapper.parse([]);
        await assertSource(first, type, 0, "wrapper-replace:5");
        await assertSource(second, type, 1, 'replacement');
        expect(factory.calls).assertEqual(1);
        expect(replacement.calls).assertEqual(1);
        expect(nativeParser.inputs.length).assertEqual(1);
        expect(replacementParser.inputs.length).assertEqual(1);
        expect(first === second).assertFalse();
      } finally {
        EtsFactory.factory = previousFactory;
      }
      expect(EtsFactory.factory === previousFactory).assertTrue();
    });

    /**
     * @tc.name FactoryReplacementTest_case_007
     * @tc.desc wrapper-replace: real wrapper with a controlled native dependency; input vector 7.
     * @tc.type Function
     * @tc.level Level1
     */
    it('FactoryReplacementTest_case_007', 0, async () => {
      await waitForNativeFactory();
      const previousFactory = EtsFactory.factory;
      const nativeParser = new ControlledParser();
      const factory = new ControlledFactory(nativeParser);
      const resolver = new RecordingResolver();
      const type = "test.wrapper-replace.6";
      registry.registerCard(type, resolver);
      nativeParser.result = makeSource(type, 1, "wrapper-replace:6");
      EtsFactory.factory = factory;
      try {
        const wrapper = new DataParserStaW();
        expect(factory.calls).assertEqual(1);
        const replacementParser = new ControlledParser();
        replacementParser.result = makeSource(type, 2, 'replacement');
        const replacement = new ControlledFactory(replacementParser);
        EtsFactory.factory = replacement;
        const secondWrapper = new DataParserStaW();
        const first = await wrapper.parse([]);
        const second = await secondWrapper.parse([]);
        await assertSource(first, type, 1, "wrapper-replace:6");
        await assertSource(second, type, 2, 'replacement');
        expect(factory.calls).assertEqual(1);
        expect(replacement.calls).assertEqual(1);
        expect(nativeParser.inputs.length).assertEqual(1);
        expect(replacementParser.inputs.length).assertEqual(1);
        expect(first === second).assertFalse();
      } finally {
        EtsFactory.factory = previousFactory;
      }
      expect(EtsFactory.factory === previousFactory).assertTrue();
    });

    /**
     * @tc.name FactoryReplacementTest_case_008
     * @tc.desc wrapper-replace: real wrapper with a controlled native dependency; input vector 8.
     * @tc.type Function
     * @tc.level Level1
     */
    it('FactoryReplacementTest_case_008', 0, async () => {
      await waitForNativeFactory();
      const previousFactory = EtsFactory.factory;
      const nativeParser = new ControlledParser();
      const factory = new ControlledFactory(nativeParser);
      const resolver = new RecordingResolver();
      const type = "test.wrapper-replace.7";
      registry.registerCard(type, resolver);
      nativeParser.result = makeSource(type, 2, "wrapper-replace:7");
      EtsFactory.factory = factory;
      try {
        const wrapper = new DataParserStaW();
        expect(factory.calls).assertEqual(1);
        const replacementParser = new ControlledParser();
        replacementParser.result = makeSource(type, 3, 'replacement');
        const replacement = new ControlledFactory(replacementParser);
        EtsFactory.factory = replacement;
        const secondWrapper = new DataParserStaW();
        const first = await wrapper.parse([]);
        const second = await secondWrapper.parse([]);
        await assertSource(first, type, 2, "wrapper-replace:7");
        await assertSource(second, type, 3, 'replacement');
        expect(factory.calls).assertEqual(1);
        expect(replacement.calls).assertEqual(1);
        expect(nativeParser.inputs.length).assertEqual(1);
        expect(replacementParser.inputs.length).assertEqual(1);
        expect(first === second).assertFalse();
      } finally {
        EtsFactory.factory = previousFactory;
      }
      expect(EtsFactory.factory === previousFactory).assertTrue();
    });

    /**
     * @tc.name FactoryReplacementTest_case_009
     * @tc.desc wrapper-replace: real wrapper with a controlled native dependency; input vector 9.
     * @tc.type Function
     * @tc.level Level1
     */
    it('FactoryReplacementTest_case_009', 0, async () => {
      await waitForNativeFactory();
      const previousFactory = EtsFactory.factory;
      const nativeParser = new ControlledParser();
      const factory = new ControlledFactory(nativeParser);
      const resolver = new RecordingResolver();
      const type = "test.wrapper-replace.8";
      registry.registerCard(type, resolver);
      nativeParser.result = makeSource(type, 3, "wrapper-replace:8");
      EtsFactory.factory = factory;
      try {
        const wrapper = new DataParserStaW();
        expect(factory.calls).assertEqual(1);
        const replacementParser = new ControlledParser();
        replacementParser.result = makeSource(type, 4, 'replacement');
        const replacement = new ControlledFactory(replacementParser);
        EtsFactory.factory = replacement;
        const secondWrapper = new DataParserStaW();
        const first = await wrapper.parse([]);
        const second = await secondWrapper.parse([]);
        await assertSource(first, type, 3, "wrapper-replace:8");
        await assertSource(second, type, 4, 'replacement');
        expect(factory.calls).assertEqual(1);
        expect(replacement.calls).assertEqual(1);
        expect(nativeParser.inputs.length).assertEqual(1);
        expect(replacementParser.inputs.length).assertEqual(1);
        expect(first === second).assertFalse();
      } finally {
        EtsFactory.factory = previousFactory;
      }
      expect(EtsFactory.factory === previousFactory).assertTrue();
    });
  });
}
