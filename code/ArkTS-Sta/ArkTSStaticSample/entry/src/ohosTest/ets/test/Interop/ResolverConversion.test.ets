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

// Reference: ets/test/Interaction/EventPropagation.test.ets
// Original line floor: 839; scenario family: wrapper-convert.
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

export default function ResolverConversionTest(): void {
  describe('ResolverConversionTest', () => {
    beforeAll(() => {
      logSuite('ResolverConversionTest', 'begin');
    });
    beforeEach(async () => {
      // Yield between cases so device watchdog and UI events can be processed.
      await new Promise<void>((resolve) => { setTimeout(resolve, 1); });
    });
    afterAll(() => {
      logSuite('ResolverConversionTest', 'end');
    });

    /**
     * @tc.name ResolverConversionTest_case_001
     * @tc.desc wrapper-convert: real wrapper with a controlled native dependency; input vector 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ResolverConversionTest_case_001', 0, async () => {
      await waitForNativeFactory();
      const previousFactory = EtsFactory.factory;
      const nativeParser = new ControlledParser();
      const factory = new ControlledFactory(nativeParser);
      const resolver = new RecordingResolver();
      const type = "test.wrapper-convert.0";
      registry.registerCard(type, resolver);
      nativeParser.result = makeSource(type, 0, "wrapper-convert:0");
      EtsFactory.factory = factory;
      try {
        const wrapper = new DataParserStaW();
        expect(factory.calls).assertEqual(1);
        const unknown = new CardData(makeModel(type + ':unregistered', makePayload("", "100%", 0)));
        nativeParser.result.addData(unknown);
        const output = await wrapper.parse([]);
        await assertSource(output, type, 0, "wrapper-convert:0");
        expect(resolver.calls).assertEqual(0);
        expect(nativeParser.result.totalCount()).assertEqual(1);
        expect(output.totalCount()).assertEqual(0);
        expect(output === nativeParser.result).assertFalse();
        expect(registry.getCardResolver(unknown.type)).assertUndefined();
        expect(nativeParser.inputs[0]).assertEqual('[]');
      } finally {
        EtsFactory.factory = previousFactory;
      }
      expect(EtsFactory.factory === previousFactory).assertTrue();
    });

    /**
     * @tc.name ResolverConversionTest_case_002
     * @tc.desc wrapper-convert: real wrapper with a controlled native dependency; input vector 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ResolverConversionTest_case_002', 0, async () => {
      await waitForNativeFactory();
      const previousFactory = EtsFactory.factory;
      const nativeParser = new ControlledParser();
      const factory = new ControlledFactory(nativeParser);
      const resolver = new RecordingResolver();
      const type = "test.wrapper-convert.1";
      registry.registerCard(type, resolver);
      nativeParser.result = makeSource(type, 1, "wrapper-convert:1");
      EtsFactory.factory = factory;
      try {
        const wrapper = new DataParserStaW();
        expect(factory.calls).assertEqual(1);
        const unknown = new CardData(makeModel(type + ':unregistered', makePayload("Card", "0%", 1)));
        nativeParser.result.addData(unknown);
        const output = await wrapper.parse([]);
        await assertSource(output, type, 1, "wrapper-convert:1");
        expect(resolver.calls).assertEqual(1);
        expect(nativeParser.result.totalCount()).assertEqual(2);
        expect(output.totalCount()).assertEqual(1);
        expect(output === nativeParser.result).assertFalse();
        expect(registry.getCardResolver(unknown.type)).assertUndefined();
        expect(nativeParser.inputs[0]).assertEqual('[]');
      } finally {
        EtsFactory.factory = previousFactory;
      }
      expect(EtsFactory.factory === previousFactory).assertTrue();
    });

    /**
     * @tc.name ResolverConversionTest_case_003
     * @tc.desc wrapper-convert: real wrapper with a controlled native dependency; input vector 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ResolverConversionTest_case_003', 0, async () => {
      await waitForNativeFactory();
      const previousFactory = EtsFactory.factory;
      const nativeParser = new ControlledParser();
      const factory = new ControlledFactory(nativeParser);
      const resolver = new RecordingResolver();
      const type = "test.wrapper-convert.2";
      registry.registerCard(type, resolver);
      nativeParser.result = makeSource(type, 2, "wrapper-convert:2");
      EtsFactory.factory = factory;
      try {
        const wrapper = new DataParserStaW();
        expect(factory.calls).assertEqual(1);
        const unknown = new CardData(makeModel(type + ':unregistered', makePayload(" ", "50%", 2)));
        nativeParser.result.addData(unknown);
        const output = await wrapper.parse([]);
        await assertSource(output, type, 2, "wrapper-convert:2");
        expect(resolver.calls).assertEqual(2);
        expect(nativeParser.result.totalCount()).assertEqual(3);
        expect(output.totalCount()).assertEqual(2);
        expect(output === nativeParser.result).assertFalse();
        expect(registry.getCardResolver(unknown.type)).assertUndefined();
        expect(nativeParser.inputs[0]).assertEqual('[]');
      } finally {
        EtsFactory.factory = previousFactory;
      }
      expect(EtsFactory.factory === previousFactory).assertTrue();
    });

    /**
     * @tc.name ResolverConversionTest_case_004
     * @tc.desc wrapper-convert: real wrapper with a controlled native dependency; input vector 4.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ResolverConversionTest_case_004', 0, async () => {
      await waitForNativeFactory();
      const previousFactory = EtsFactory.factory;
      const nativeParser = new ControlledParser();
      const factory = new ControlledFactory(nativeParser);
      const resolver = new RecordingResolver();
      const type = "test.wrapper-convert.3";
      registry.registerCard(type, resolver);
      nativeParser.result = makeSource(type, 3, "wrapper-convert:3");
      EtsFactory.factory = factory;
      try {
        const wrapper = new DataParserStaW();
        expect(factory.calls).assertEqual(1);
        const unknown = new CardData(makeModel(type + ':unregistered', makePayload("  padded  ", "1%", 3)));
        nativeParser.result.addData(unknown);
        const output = await wrapper.parse([]);
        await assertSource(output, type, 3, "wrapper-convert:3");
        expect(resolver.calls).assertEqual(3);
        expect(nativeParser.result.totalCount()).assertEqual(4);
        expect(output.totalCount()).assertEqual(3);
        expect(output === nativeParser.result).assertFalse();
        expect(registry.getCardResolver(unknown.type)).assertUndefined();
        expect(nativeParser.inputs[0]).assertEqual('[]');
      } finally {
        EtsFactory.factory = previousFactory;
      }
      expect(EtsFactory.factory === previousFactory).assertTrue();
    });

    /**
     * @tc.name ResolverConversionTest_case_005
     * @tc.desc wrapper-convert: real wrapper with a controlled native dependency; input vector 5.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ResolverConversionTest_case_005', 0, async () => {
      await waitForNativeFactory();
      const previousFactory = EtsFactory.factory;
      const nativeParser = new ControlledParser();
      const factory = new ControlledFactory(nativeParser);
      const resolver = new RecordingResolver();
      const type = "test.wrapper-convert.4";
      registry.registerCard(type, resolver);
      nativeParser.result = makeSource(type, 4, "wrapper-convert:4");
      EtsFactory.factory = factory;
      try {
        const wrapper = new DataParserStaW();
        expect(factory.calls).assertEqual(1);
        const unknown = new CardData(makeModel(type + ':unregistered', makePayload("multi word title", "99%", 4)));
        nativeParser.result.addData(unknown);
        const output = await wrapper.parse([]);
        await assertSource(output, type, 4, "wrapper-convert:4");
        expect(resolver.calls).assertEqual(4);
        expect(nativeParser.result.totalCount()).assertEqual(5);
        expect(output.totalCount()).assertEqual(4);
        expect(output === nativeParser.result).assertFalse();
        expect(registry.getCardResolver(unknown.type)).assertUndefined();
        expect(nativeParser.inputs[0]).assertEqual('[]');
      } finally {
        EtsFactory.factory = previousFactory;
      }
      expect(EtsFactory.factory === previousFactory).assertTrue();
    });

    /**
     * @tc.name ResolverConversionTest_case_006
     * @tc.desc wrapper-convert: real wrapper with a controlled native dependency; input vector 6.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ResolverConversionTest_case_006', 0, async () => {
      await waitForNativeFactory();
      const previousFactory = EtsFactory.factory;
      const nativeParser = new ControlledParser();
      const factory = new ControlledFactory(nativeParser);
      const resolver = new RecordingResolver();
      const type = "test.wrapper-convert.5";
      registry.registerCard(type, resolver);
      nativeParser.result = makeSource(type, 0, "wrapper-convert:5");
      EtsFactory.factory = factory;
      try {
        const wrapper = new DataParserStaW();
        expect(factory.calls).assertEqual(1);
        const unknown = new CardData(makeModel(type + ':unregistered', makePayload("line\nbreak", "75%", 5)));
        nativeParser.result.addData(unknown);
        const output = await wrapper.parse([]);
        await assertSource(output, type, 0, "wrapper-convert:5");
        expect(resolver.calls).assertEqual(0);
        expect(nativeParser.result.totalCount()).assertEqual(1);
        expect(output.totalCount()).assertEqual(0);
        expect(output === nativeParser.result).assertFalse();
        expect(registry.getCardResolver(unknown.type)).assertUndefined();
        expect(nativeParser.inputs[0]).assertEqual('[]');
      } finally {
        EtsFactory.factory = previousFactory;
      }
      expect(EtsFactory.factory === previousFactory).assertTrue();
    });

    /**
     * @tc.name ResolverConversionTest_case_007
     * @tc.desc wrapper-convert: real wrapper with a controlled native dependency; input vector 7.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ResolverConversionTest_case_007', 0, async () => {
      await waitForNativeFactory();
      const previousFactory = EtsFactory.factory;
      const nativeParser = new ControlledParser();
      const factory = new ControlledFactory(nativeParser);
      const resolver = new RecordingResolver();
      const type = "test.wrapper-convert.6";
      registry.registerCard(type, resolver);
      nativeParser.result = makeSource(type, 1, "wrapper-convert:6");
      EtsFactory.factory = factory;
      try {
        const wrapper = new DataParserStaW();
        expect(factory.calls).assertEqual(1);
        const unknown = new CardData(makeModel(type + ':unregistered', makePayload("tab\tvalue", "", 6)));
        nativeParser.result.addData(unknown);
        const output = await wrapper.parse([]);
        await assertSource(output, type, 1, "wrapper-convert:6");
        expect(resolver.calls).assertEqual(1);
        expect(nativeParser.result.totalCount()).assertEqual(2);
        expect(output.totalCount()).assertEqual(1);
        expect(output === nativeParser.result).assertFalse();
        expect(registry.getCardResolver(unknown.type)).assertUndefined();
        expect(nativeParser.inputs[0]).assertEqual('[]');
      } finally {
        EtsFactory.factory = previousFactory;
      }
      expect(EtsFactory.factory === previousFactory).assertTrue();
    });

    /**
     * @tc.name ResolverConversionTest_case_008
     * @tc.desc wrapper-convert: real wrapper with a controlled native dependency; input vector 8.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ResolverConversionTest_case_008', 0, async () => {
      await waitForNativeFactory();
      const previousFactory = EtsFactory.factory;
      const nativeParser = new ControlledParser();
      const factory = new ControlledFactory(nativeParser);
      const resolver = new RecordingResolver();
      const type = "test.wrapper-convert.7";
      registry.registerCard(type, resolver);
      nativeParser.result = makeSource(type, 2, "wrapper-convert:7");
      EtsFactory.factory = factory;
      try {
        const wrapper = new DataParserStaW();
        expect(factory.calls).assertEqual(1);
        const unknown = new CardData(makeModel(type + ':unregistered', makePayload("\u5361\u7247 1", ":{{env(screen-width}}", 7)));
        nativeParser.result.addData(unknown);
        const output = await wrapper.parse([]);
        await assertSource(output, type, 2, "wrapper-convert:7");
        expect(resolver.calls).assertEqual(2);
        expect(nativeParser.result.totalCount()).assertEqual(3);
        expect(output.totalCount()).assertEqual(2);
        expect(output === nativeParser.result).assertFalse();
        expect(registry.getCardResolver(unknown.type)).assertUndefined();
        expect(nativeParser.inputs[0]).assertEqual('[]');
      } finally {
        EtsFactory.factory = previousFactory;
      }
      expect(EtsFactory.factory === previousFactory).assertTrue();
    });

    /**
     * @tc.name ResolverConversionTest_case_009
     * @tc.desc wrapper-convert: real wrapper with a controlled native dependency; input vector 9.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ResolverConversionTest_case_009', 0, async () => {
      await waitForNativeFactory();
      const previousFactory = EtsFactory.factory;
      const nativeParser = new ControlledParser();
      const factory = new ControlledFactory(nativeParser);
      const resolver = new RecordingResolver();
      const type = "test.wrapper-convert.8";
      registry.registerCard(type, resolver);
      nativeParser.result = makeSource(type, 3, "wrapper-convert:8");
      EtsFactory.factory = factory;
      try {
        const wrapper = new DataParserStaW();
        expect(factory.calls).assertEqual(1);
        const unknown = new CardData(makeModel(type + ':unregistered', makePayload("\u5361\u7247 2", "100%", 8)));
        nativeParser.result.addData(unknown);
        const output = await wrapper.parse([]);
        await assertSource(output, type, 3, "wrapper-convert:8");
        expect(resolver.calls).assertEqual(3);
        expect(nativeParser.result.totalCount()).assertEqual(4);
        expect(output.totalCount()).assertEqual(3);
        expect(output === nativeParser.result).assertFalse();
        expect(registry.getCardResolver(unknown.type)).assertUndefined();
        expect(nativeParser.inputs[0]).assertEqual('[]');
      } finally {
        EtsFactory.factory = previousFactory;
      }
      expect(EtsFactory.factory === previousFactory).assertTrue();
    });

    /**
     * @tc.name ResolverConversionTest_case_010
     * @tc.desc wrapper-convert: real wrapper with a controlled native dependency; input vector 10.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ResolverConversionTest_case_010', 0, async () => {
      await waitForNativeFactory();
      const previousFactory = EtsFactory.factory;
      const nativeParser = new ControlledParser();
      const factory = new ControlledFactory(nativeParser);
      const resolver = new RecordingResolver();
      const type = "test.wrapper-convert.9";
      registry.registerCard(type, resolver);
      nativeParser.result = makeSource(type, 4, "wrapper-convert:9");
      EtsFactory.factory = factory;
      try {
        const wrapper = new DataParserStaW();
        expect(factory.calls).assertEqual(1);
        const unknown = new CardData(makeModel(type + ':unregistered', makePayload("\u5361\u7247 3", "0%", 9)));
        nativeParser.result.addData(unknown);
        const output = await wrapper.parse([]);
        await assertSource(output, type, 4, "wrapper-convert:9");
        expect(resolver.calls).assertEqual(4);
        expect(nativeParser.result.totalCount()).assertEqual(5);
        expect(output.totalCount()).assertEqual(4);
        expect(output === nativeParser.result).assertFalse();
        expect(registry.getCardResolver(unknown.type)).assertUndefined();
        expect(nativeParser.inputs[0]).assertEqual('[]');
      } finally {
        EtsFactory.factory = previousFactory;
      }
      expect(EtsFactory.factory === previousFactory).assertTrue();
    });

    /**
     * @tc.name ResolverConversionTest_case_011
     * @tc.desc wrapper-convert: real wrapper with a controlled native dependency; input vector 11.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ResolverConversionTest_case_011', 0, async () => {
      await waitForNativeFactory();
      const previousFactory = EtsFactory.factory;
      const nativeParser = new ControlledParser();
      const factory = new ControlledFactory(nativeParser);
      const resolver = new RecordingResolver();
      const type = "test.wrapper-convert.10";
      registry.registerCard(type, resolver);
      nativeParser.result = makeSource(type, 0, "wrapper-convert:10");
      EtsFactory.factory = factory;
      try {
        const wrapper = new DataParserStaW();
        expect(factory.calls).assertEqual(1);
        const unknown = new CardData(makeModel(type + ':unregistered', makePayload("\u65e5\u672c\u8a9e", "50%", 10)));
        nativeParser.result.addData(unknown);
        const output = await wrapper.parse([]);
        await assertSource(output, type, 0, "wrapper-convert:10");
        expect(resolver.calls).assertEqual(0);
        expect(nativeParser.result.totalCount()).assertEqual(1);
        expect(output.totalCount()).assertEqual(0);
        expect(output === nativeParser.result).assertFalse();
        expect(registry.getCardResolver(unknown.type)).assertUndefined();
        expect(nativeParser.inputs[0]).assertEqual('[]');
      } finally {
        EtsFactory.factory = previousFactory;
      }
      expect(EtsFactory.factory === previousFactory).assertTrue();
    });

    /**
     * @tc.name ResolverConversionTest_case_012
     * @tc.desc wrapper-convert: real wrapper with a controlled native dependency; input vector 12.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ResolverConversionTest_case_012', 0, async () => {
      await waitForNativeFactory();
      const previousFactory = EtsFactory.factory;
      const nativeParser = new ControlledParser();
      const factory = new ControlledFactory(nativeParser);
      const resolver = new RecordingResolver();
      const type = "test.wrapper-convert.11";
      registry.registerCard(type, resolver);
      nativeParser.result = makeSource(type, 1, "wrapper-convert:11");
      EtsFactory.factory = factory;
      try {
        const wrapper = new DataParserStaW();
        expect(factory.calls).assertEqual(1);
        const unknown = new CardData(makeModel(type + ':unregistered', makePayload("\u0645\u0631\u062d\u0628\u0627", "1%", 11)));
        nativeParser.result.addData(unknown);
        const output = await wrapper.parse([]);
        await assertSource(output, type, 1, "wrapper-convert:11");
        expect(resolver.calls).assertEqual(1);
        expect(nativeParser.result.totalCount()).assertEqual(2);
        expect(output.totalCount()).assertEqual(1);
        expect(output === nativeParser.result).assertFalse();
        expect(registry.getCardResolver(unknown.type)).assertUndefined();
        expect(nativeParser.inputs[0]).assertEqual('[]');
      } finally {
        EtsFactory.factory = previousFactory;
      }
      expect(EtsFactory.factory === previousFactory).assertTrue();
    });

    /**
     * @tc.name ResolverConversionTest_case_013
     * @tc.desc wrapper-convert: real wrapper with a controlled native dependency; input vector 13.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ResolverConversionTest_case_013', 0, async () => {
      await waitForNativeFactory();
      const previousFactory = EtsFactory.factory;
      const nativeParser = new ControlledParser();
      const factory = new ControlledFactory(nativeParser);
      const resolver = new RecordingResolver();
      const type = "test.wrapper-convert.12";
      registry.registerCard(type, resolver);
      nativeParser.result = makeSource(type, 2, "wrapper-convert:12");
      EtsFactory.factory = factory;
      try {
        const wrapper = new DataParserStaW();
        expect(factory.calls).assertEqual(1);
        const unknown = new CardData(makeModel(type + ':unregistered', makePayload("\u05e9\u05dc\u05d5\u05dd", "99%", 12)));
        nativeParser.result.addData(unknown);
        const output = await wrapper.parse([]);
        await assertSource(output, type, 2, "wrapper-convert:12");
        expect(resolver.calls).assertEqual(2);
        expect(nativeParser.result.totalCount()).assertEqual(3);
        expect(output.totalCount()).assertEqual(2);
        expect(output === nativeParser.result).assertFalse();
        expect(registry.getCardResolver(unknown.type)).assertUndefined();
        expect(nativeParser.inputs[0]).assertEqual('[]');
      } finally {
        EtsFactory.factory = previousFactory;
      }
      expect(EtsFactory.factory === previousFactory).assertTrue();
    });

    /**
     * @tc.name ResolverConversionTest_case_014
     * @tc.desc wrapper-convert: real wrapper with a controlled native dependency; input vector 14.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ResolverConversionTest_case_014', 0, async () => {
      await waitForNativeFactory();
      const previousFactory = EtsFactory.factory;
      const nativeParser = new ControlledParser();
      const factory = new ControlledFactory(nativeParser);
      const resolver = new RecordingResolver();
      const type = "test.wrapper-convert.13";
      registry.registerCard(type, resolver);
      nativeParser.result = makeSource(type, 3, "wrapper-convert:13");
      EtsFactory.factory = factory;
      try {
        const wrapper = new DataParserStaW();
        expect(factory.calls).assertEqual(1);
        const unknown = new CardData(makeModel(type + ':unregistered', makePayload("e\u0301", "75%", 13)));
        nativeParser.result.addData(unknown);
        const output = await wrapper.parse([]);
        await assertSource(output, type, 3, "wrapper-convert:13");
        expect(resolver.calls).assertEqual(3);
        expect(nativeParser.result.totalCount()).assertEqual(4);
        expect(output.totalCount()).assertEqual(3);
        expect(output === nativeParser.result).assertFalse();
        expect(registry.getCardResolver(unknown.type)).assertUndefined();
        expect(nativeParser.inputs[0]).assertEqual('[]');
      } finally {
        EtsFactory.factory = previousFactory;
      }
      expect(EtsFactory.factory === previousFactory).assertTrue();
    });

    /**
     * @tc.name ResolverConversionTest_case_015
     * @tc.desc wrapper-convert: real wrapper with a controlled native dependency; input vector 15.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ResolverConversionTest_case_015', 0, async () => {
      await waitForNativeFactory();
      const previousFactory = EtsFactory.factory;
      const nativeParser = new ControlledParser();
      const factory = new ControlledFactory(nativeParser);
      const resolver = new RecordingResolver();
      const type = "test.wrapper-convert.14";
      registry.registerCard(type, resolver);
      nativeParser.result = makeSource(type, 4, "wrapper-convert:14");
      EtsFactory.factory = factory;
      try {
        const wrapper = new DataParserStaW();
        expect(factory.calls).assertEqual(1);
        const unknown = new CardData(makeModel(type + ':unregistered', makePayload("\u00e9", "", 14)));
        nativeParser.result.addData(unknown);
        const output = await wrapper.parse([]);
        await assertSource(output, type, 4, "wrapper-convert:14");
        expect(resolver.calls).assertEqual(4);
        expect(nativeParser.result.totalCount()).assertEqual(5);
        expect(output.totalCount()).assertEqual(4);
        expect(output === nativeParser.result).assertFalse();
        expect(registry.getCardResolver(unknown.type)).assertUndefined();
        expect(nativeParser.inputs[0]).assertEqual('[]');
      } finally {
        EtsFactory.factory = previousFactory;
      }
      expect(EtsFactory.factory === previousFactory).assertTrue();
    });

    /**
     * @tc.name ResolverConversionTest_case_016
     * @tc.desc wrapper-convert: real wrapper with a controlled native dependency; input vector 16.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ResolverConversionTest_case_016', 0, async () => {
      await waitForNativeFactory();
      const previousFactory = EtsFactory.factory;
      const nativeParser = new ControlledParser();
      const factory = new ControlledFactory(nativeParser);
      const resolver = new RecordingResolver();
      const type = "test.wrapper-convert.15";
      registry.registerCard(type, resolver);
      nativeParser.result = makeSource(type, 0, "wrapper-convert:15");
      EtsFactory.factory = factory;
      try {
        const wrapper = new DataParserStaW();
        expect(factory.calls).assertEqual(1);
        const unknown = new CardData(makeModel(type + ':unregistered', makePayload("\ud83d\ude80", ":{{env(screen-width}}", 15)));
        nativeParser.result.addData(unknown);
        const output = await wrapper.parse([]);
        await assertSource(output, type, 0, "wrapper-convert:15");
        expect(resolver.calls).assertEqual(0);
        expect(nativeParser.result.totalCount()).assertEqual(1);
        expect(output.totalCount()).assertEqual(0);
        expect(output === nativeParser.result).assertFalse();
        expect(registry.getCardResolver(unknown.type)).assertUndefined();
        expect(nativeParser.inputs[0]).assertEqual('[]');
      } finally {
        EtsFactory.factory = previousFactory;
      }
      expect(EtsFactory.factory === previousFactory).assertTrue();
    });

    /**
     * @tc.name ResolverConversionTest_case_017
     * @tc.desc wrapper-convert: real wrapper with a controlled native dependency; input vector 17.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ResolverConversionTest_case_017', 0, async () => {
      await waitForNativeFactory();
      const previousFactory = EtsFactory.factory;
      const nativeParser = new ControlledParser();
      const factory = new ControlledFactory(nativeParser);
      const resolver = new RecordingResolver();
      const type = "test.wrapper-convert.16";
      registry.registerCard(type, resolver);
      nativeParser.result = makeSource(type, 1, "wrapper-convert:16");
      EtsFactory.factory = factory;
      try {
        const wrapper = new DataParserStaW();
        expect(factory.calls).assertEqual(1);
        const unknown = new CardData(makeModel(type + ':unregistered', makePayload("quote\"slash\\", "100%", 16)));
        nativeParser.result.addData(unknown);
        const output = await wrapper.parse([]);
        await assertSource(output, type, 1, "wrapper-convert:16");
        expect(resolver.calls).assertEqual(1);
        expect(nativeParser.result.totalCount()).assertEqual(2);
        expect(output.totalCount()).assertEqual(1);
        expect(output === nativeParser.result).assertFalse();
        expect(registry.getCardResolver(unknown.type)).assertUndefined();
        expect(nativeParser.inputs[0]).assertEqual('[]');
      } finally {
        EtsFactory.factory = previousFactory;
      }
      expect(EtsFactory.factory === previousFactory).assertTrue();
    });

    /**
     * @tc.name ResolverConversionTest_case_018
     * @tc.desc wrapper-convert: real wrapper with a controlled native dependency; input vector 18.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ResolverConversionTest_case_018', 0, async () => {
      await waitForNativeFactory();
      const previousFactory = EtsFactory.factory;
      const nativeParser = new ControlledParser();
      const factory = new ControlledFactory(nativeParser);
      const resolver = new RecordingResolver();
      const type = "test.wrapper-convert.17";
      registry.registerCard(type, resolver);
      nativeParser.result = makeSource(type, 2, "wrapper-convert:17");
      EtsFactory.factory = factory;
      try {
        const wrapper = new DataParserStaW();
        expect(factory.calls).assertEqual(1);
        const unknown = new CardData(makeModel(type + ':unregistered', makePayload("<script>alert(1)</script>", "0%", 17)));
        nativeParser.result.addData(unknown);
        const output = await wrapper.parse([]);
        await assertSource(output, type, 2, "wrapper-convert:17");
        expect(resolver.calls).assertEqual(2);
        expect(nativeParser.result.totalCount()).assertEqual(3);
        expect(output.totalCount()).assertEqual(2);
        expect(output === nativeParser.result).assertFalse();
        expect(registry.getCardResolver(unknown.type)).assertUndefined();
        expect(nativeParser.inputs[0]).assertEqual('[]');
      } finally {
        EtsFactory.factory = previousFactory;
      }
      expect(EtsFactory.factory === previousFactory).assertTrue();
    });

    /**
     * @tc.name ResolverConversionTest_case_019
     * @tc.desc wrapper-convert: real wrapper with a controlled native dependency; input vector 19.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ResolverConversionTest_case_019', 0, async () => {
      await waitForNativeFactory();
      const previousFactory = EtsFactory.factory;
      const nativeParser = new ControlledParser();
      const factory = new ControlledFactory(nativeParser);
      const resolver = new RecordingResolver();
      const type = "test.wrapper-convert.18";
      registry.registerCard(type, resolver);
      nativeParser.result = makeSource(type, 3, "wrapper-convert:18");
      EtsFactory.factory = factory;
      try {
        const wrapper = new DataParserStaW();
        expect(factory.calls).assertEqual(1);
        const unknown = new CardData(makeModel(type + ':unregistered', makePayload("${notExecuted}", "50%", 18)));
        nativeParser.result.addData(unknown);
        const output = await wrapper.parse([]);
        await assertSource(output, type, 3, "wrapper-convert:18");
        expect(resolver.calls).assertEqual(3);
        expect(nativeParser.result.totalCount()).assertEqual(4);
        expect(output.totalCount()).assertEqual(3);
        expect(output === nativeParser.result).assertFalse();
        expect(registry.getCardResolver(unknown.type)).assertUndefined();
        expect(nativeParser.inputs[0]).assertEqual('[]');
      } finally {
        EtsFactory.factory = previousFactory;
      }
      expect(EtsFactory.factory === previousFactory).assertTrue();
    });

    /**
     * @tc.name ResolverConversionTest_case_020
     * @tc.desc wrapper-convert: real wrapper with a controlled native dependency; input vector 20.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ResolverConversionTest_case_020', 0, async () => {
      await waitForNativeFactory();
      const previousFactory = EtsFactory.factory;
      const nativeParser = new ControlledParser();
      const factory = new ControlledFactory(nativeParser);
      const resolver = new RecordingResolver();
      const type = "test.wrapper-convert.19";
      registry.registerCard(type, resolver);
      nativeParser.result = makeSource(type, 4, "wrapper-convert:19");
      EtsFactory.factory = factory;
      try {
        const wrapper = new DataParserStaW();
        expect(factory.calls).assertEqual(1);
        const unknown = new CardData(makeModel(type + ':unregistered', makePayload("__proto__", "1%", 19)));
        nativeParser.result.addData(unknown);
        const output = await wrapper.parse([]);
        await assertSource(output, type, 4, "wrapper-convert:19");
        expect(resolver.calls).assertEqual(4);
        expect(nativeParser.result.totalCount()).assertEqual(5);
        expect(output.totalCount()).assertEqual(4);
        expect(output === nativeParser.result).assertFalse();
        expect(registry.getCardResolver(unknown.type)).assertUndefined();
        expect(nativeParser.inputs[0]).assertEqual('[]');
      } finally {
        EtsFactory.factory = previousFactory;
      }
      expect(EtsFactory.factory === previousFactory).assertTrue();
    });

    /**
     * @tc.name ResolverConversionTest_case_021
     * @tc.desc wrapper-convert: real wrapper with a controlled native dependency; input vector 21.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ResolverConversionTest_case_021', 0, async () => {
      await waitForNativeFactory();
      const previousFactory = EtsFactory.factory;
      const nativeParser = new ControlledParser();
      const factory = new ControlledFactory(nativeParser);
      const resolver = new RecordingResolver();
      const type = "test.wrapper-convert.20";
      registry.registerCard(type, resolver);
      nativeParser.result = makeSource(type, 0, "wrapper-convert:20");
      EtsFactory.factory = factory;
      try {
        const wrapper = new DataParserStaW();
        expect(factory.calls).assertEqual(1);
        const unknown = new CardData(makeModel(type + ':unregistered', makePayload("constructor", "99%", 20)));
        nativeParser.result.addData(unknown);
        const output = await wrapper.parse([]);
        await assertSource(output, type, 0, "wrapper-convert:20");
        expect(resolver.calls).assertEqual(0);
        expect(nativeParser.result.totalCount()).assertEqual(1);
        expect(output.totalCount()).assertEqual(0);
        expect(output === nativeParser.result).assertFalse();
        expect(registry.getCardResolver(unknown.type)).assertUndefined();
        expect(nativeParser.inputs[0]).assertEqual('[]');
      } finally {
        EtsFactory.factory = previousFactory;
      }
      expect(EtsFactory.factory === previousFactory).assertTrue();
    });

    /**
     * @tc.name ResolverConversionTest_case_022
     * @tc.desc wrapper-convert: real wrapper with a controlled native dependency; input vector 22.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ResolverConversionTest_case_022', 0, async () => {
      await waitForNativeFactory();
      const previousFactory = EtsFactory.factory;
      const nativeParser = new ControlledParser();
      const factory = new ControlledFactory(nativeParser);
      const resolver = new RecordingResolver();
      const type = "test.wrapper-convert.21";
      registry.registerCard(type, resolver);
      nativeParser.result = makeSource(type, 1, "wrapper-convert:21");
      EtsFactory.factory = factory;
      try {
        const wrapper = new DataParserStaW();
        expect(factory.calls).assertEqual(1);
        const unknown = new CardData(makeModel(type + ':unregistered', makePayload("null", "75%", 21)));
        nativeParser.result.addData(unknown);
        const output = await wrapper.parse([]);
        await assertSource(output, type, 1, "wrapper-convert:21");
        expect(resolver.calls).assertEqual(1);
        expect(nativeParser.result.totalCount()).assertEqual(2);
        expect(output.totalCount()).assertEqual(1);
        expect(output === nativeParser.result).assertFalse();
        expect(registry.getCardResolver(unknown.type)).assertUndefined();
        expect(nativeParser.inputs[0]).assertEqual('[]');
      } finally {
        EtsFactory.factory = previousFactory;
      }
      expect(EtsFactory.factory === previousFactory).assertTrue();
    });

    /**
     * @tc.name ResolverConversionTest_case_023
     * @tc.desc wrapper-convert: real wrapper with a controlled native dependency; input vector 23.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ResolverConversionTest_case_023', 0, async () => {
      await waitForNativeFactory();
      const previousFactory = EtsFactory.factory;
      const nativeParser = new ControlledParser();
      const factory = new ControlledFactory(nativeParser);
      const resolver = new RecordingResolver();
      const type = "test.wrapper-convert.22";
      registry.registerCard(type, resolver);
      nativeParser.result = makeSource(type, 2, "wrapper-convert:22");
      EtsFactory.factory = factory;
      try {
        const wrapper = new DataParserStaW();
        expect(factory.calls).assertEqual(1);
        const unknown = new CardData(makeModel(type + ':unregistered', makePayload("false", "", 22)));
        nativeParser.result.addData(unknown);
        const output = await wrapper.parse([]);
        await assertSource(output, type, 2, "wrapper-convert:22");
        expect(resolver.calls).assertEqual(2);
        expect(nativeParser.result.totalCount()).assertEqual(3);
        expect(output.totalCount()).assertEqual(2);
        expect(output === nativeParser.result).assertFalse();
        expect(registry.getCardResolver(unknown.type)).assertUndefined();
        expect(nativeParser.inputs[0]).assertEqual('[]');
      } finally {
        EtsFactory.factory = previousFactory;
      }
      expect(EtsFactory.factory === previousFactory).assertTrue();
    });
  });
}
