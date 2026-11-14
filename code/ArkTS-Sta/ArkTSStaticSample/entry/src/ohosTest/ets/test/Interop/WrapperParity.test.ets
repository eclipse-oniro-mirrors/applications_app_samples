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

// Reference: ets/test/PowerDialog/PowerDialogConsistency.test.ets
// Original line floor: 518; scenario family: wrapper-parity.
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

export default function WrapperParityTest(): void {
  describe('WrapperParityTest', () => {
    beforeAll(() => {
      logSuite('WrapperParityTest', 'begin');
    });
    beforeEach(async () => {
      // Yield between cases so device watchdog and UI events can be processed.
      await new Promise<void>((resolve) => { setTimeout(resolve, 1); });
    });
    afterAll(() => {
      logSuite('WrapperParityTest', 'end');
    });

    /**
     * @tc.name WrapperParityTest_case_001
     * @tc.desc wrapper-parity: real wrapper with a controlled native dependency; input vector 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('WrapperParityTest_case_001', 0, async () => {
      await waitForNativeFactory();
      const previousFactory = EtsFactory.factory;
      const nativeParser = new ControlledParser();
      const factory = new ControlledFactory(nativeParser);
      const resolver = new RecordingResolver();
      const type = "test.wrapper-parity.0";
      registry.registerCard(type, resolver);
      nativeParser.result = makeSource(type, 0, "wrapper-parity:0");
      EtsFactory.factory = factory;
      try {
        const wrapper = new DataParserStaW();
        expect(factory.calls).assertEqual(1);
        const first = await wrapper.parse([]);
        const second = await wrapper.parse([]);
        await assertSource(first, type, 0, "wrapper-parity:0");
        await assertSource(second, type, 0, "wrapper-parity:0");
        expect(first === second).assertFalse();
        expect(first === nativeParser.result).assertFalse();
        expect(second === nativeParser.result).assertFalse();
        for (let index = 0; index < 0; index++) {
          expect(first.getData(index) === second.getData(index)).assertFalse();
          expect(first.getData(index).data === nativeParser.result.getData(index).data).assertTrue();
          expect(first.getData(index).getObjectId() === second.getData(index).getObjectId()).assertFalse();
        }
        expect(resolver.calls).assertEqual(0);
      } finally {
        EtsFactory.factory = previousFactory;
      }
      expect(EtsFactory.factory === previousFactory).assertTrue();
    });

    /**
     * @tc.name WrapperParityTest_case_002
     * @tc.desc wrapper-parity: real wrapper with a controlled native dependency; input vector 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('WrapperParityTest_case_002', 0, async () => {
      await waitForNativeFactory();
      const previousFactory = EtsFactory.factory;
      const nativeParser = new ControlledParser();
      const factory = new ControlledFactory(nativeParser);
      const resolver = new RecordingResolver();
      const type = "test.wrapper-parity.1";
      registry.registerCard(type, resolver);
      nativeParser.result = makeSource(type, 1, "wrapper-parity:1");
      EtsFactory.factory = factory;
      try {
        const wrapper = new DataParserStaW();
        expect(factory.calls).assertEqual(1);
        const first = await wrapper.parse([]);
        const second = await wrapper.parse([]);
        await assertSource(first, type, 1, "wrapper-parity:1");
        await assertSource(second, type, 1, "wrapper-parity:1");
        expect(first === second).assertFalse();
        expect(first === nativeParser.result).assertFalse();
        expect(second === nativeParser.result).assertFalse();
        for (let index = 0; index < 1; index++) {
          expect(first.getData(index) === second.getData(index)).assertFalse();
          expect(first.getData(index).data === nativeParser.result.getData(index).data).assertTrue();
          expect(first.getData(index).getObjectId() === second.getData(index).getObjectId()).assertFalse();
        }
        expect(resolver.calls).assertEqual(2);
      } finally {
        EtsFactory.factory = previousFactory;
      }
      expect(EtsFactory.factory === previousFactory).assertTrue();
    });

    /**
     * @tc.name WrapperParityTest_case_003
     * @tc.desc wrapper-parity: real wrapper with a controlled native dependency; input vector 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('WrapperParityTest_case_003', 0, async () => {
      await waitForNativeFactory();
      const previousFactory = EtsFactory.factory;
      const nativeParser = new ControlledParser();
      const factory = new ControlledFactory(nativeParser);
      const resolver = new RecordingResolver();
      const type = "test.wrapper-parity.2";
      registry.registerCard(type, resolver);
      nativeParser.result = makeSource(type, 2, "wrapper-parity:2");
      EtsFactory.factory = factory;
      try {
        const wrapper = new DataParserStaW();
        expect(factory.calls).assertEqual(1);
        const first = await wrapper.parse([]);
        const second = await wrapper.parse([]);
        await assertSource(first, type, 2, "wrapper-parity:2");
        await assertSource(second, type, 2, "wrapper-parity:2");
        expect(first === second).assertFalse();
        expect(first === nativeParser.result).assertFalse();
        expect(second === nativeParser.result).assertFalse();
        for (let index = 0; index < 2; index++) {
          expect(first.getData(index) === second.getData(index)).assertFalse();
          expect(first.getData(index).data === nativeParser.result.getData(index).data).assertTrue();
          expect(first.getData(index).getObjectId() === second.getData(index).getObjectId()).assertFalse();
        }
        expect(resolver.calls).assertEqual(4);
      } finally {
        EtsFactory.factory = previousFactory;
      }
      expect(EtsFactory.factory === previousFactory).assertTrue();
    });

    /**
     * @tc.name WrapperParityTest_case_004
     * @tc.desc wrapper-parity: real wrapper with a controlled native dependency; input vector 4.
     * @tc.type Function
     * @tc.level Level1
     */
    it('WrapperParityTest_case_004', 0, async () => {
      await waitForNativeFactory();
      const previousFactory = EtsFactory.factory;
      const nativeParser = new ControlledParser();
      const factory = new ControlledFactory(nativeParser);
      const resolver = new RecordingResolver();
      const type = "test.wrapper-parity.3";
      registry.registerCard(type, resolver);
      nativeParser.result = makeSource(type, 3, "wrapper-parity:3");
      EtsFactory.factory = factory;
      try {
        const wrapper = new DataParserStaW();
        expect(factory.calls).assertEqual(1);
        const first = await wrapper.parse([]);
        const second = await wrapper.parse([]);
        await assertSource(first, type, 3, "wrapper-parity:3");
        await assertSource(second, type, 3, "wrapper-parity:3");
        expect(first === second).assertFalse();
        expect(first === nativeParser.result).assertFalse();
        expect(second === nativeParser.result).assertFalse();
        for (let index = 0; index < 3; index++) {
          expect(first.getData(index) === second.getData(index)).assertFalse();
          expect(first.getData(index).data === nativeParser.result.getData(index).data).assertTrue();
          expect(first.getData(index).getObjectId() === second.getData(index).getObjectId()).assertFalse();
        }
        expect(resolver.calls).assertEqual(6);
      } finally {
        EtsFactory.factory = previousFactory;
      }
      expect(EtsFactory.factory === previousFactory).assertTrue();
    });

    /**
     * @tc.name WrapperParityTest_case_005
     * @tc.desc wrapper-parity: real wrapper with a controlled native dependency; input vector 5.
     * @tc.type Function
     * @tc.level Level1
     */
    it('WrapperParityTest_case_005', 0, async () => {
      await waitForNativeFactory();
      const previousFactory = EtsFactory.factory;
      const nativeParser = new ControlledParser();
      const factory = new ControlledFactory(nativeParser);
      const resolver = new RecordingResolver();
      const type = "test.wrapper-parity.4";
      registry.registerCard(type, resolver);
      nativeParser.result = makeSource(type, 4, "wrapper-parity:4");
      EtsFactory.factory = factory;
      try {
        const wrapper = new DataParserStaW();
        expect(factory.calls).assertEqual(1);
        const first = await wrapper.parse([]);
        const second = await wrapper.parse([]);
        await assertSource(first, type, 4, "wrapper-parity:4");
        await assertSource(second, type, 4, "wrapper-parity:4");
        expect(first === second).assertFalse();
        expect(first === nativeParser.result).assertFalse();
        expect(second === nativeParser.result).assertFalse();
        for (let index = 0; index < 4; index++) {
          expect(first.getData(index) === second.getData(index)).assertFalse();
          expect(first.getData(index).data === nativeParser.result.getData(index).data).assertTrue();
          expect(first.getData(index).getObjectId() === second.getData(index).getObjectId()).assertFalse();
        }
        expect(resolver.calls).assertEqual(8);
      } finally {
        EtsFactory.factory = previousFactory;
      }
      expect(EtsFactory.factory === previousFactory).assertTrue();
    });

    /**
     * @tc.name WrapperParityTest_case_006
     * @tc.desc wrapper-parity: real wrapper with a controlled native dependency; input vector 6.
     * @tc.type Function
     * @tc.level Level1
     */
    it('WrapperParityTest_case_006', 0, async () => {
      await waitForNativeFactory();
      const previousFactory = EtsFactory.factory;
      const nativeParser = new ControlledParser();
      const factory = new ControlledFactory(nativeParser);
      const resolver = new RecordingResolver();
      const type = "test.wrapper-parity.5";
      registry.registerCard(type, resolver);
      nativeParser.result = makeSource(type, 0, "wrapper-parity:5");
      EtsFactory.factory = factory;
      try {
        const wrapper = new DataParserStaW();
        expect(factory.calls).assertEqual(1);
        const first = await wrapper.parse([]);
        const second = await wrapper.parse([]);
        await assertSource(first, type, 0, "wrapper-parity:5");
        await assertSource(second, type, 0, "wrapper-parity:5");
        expect(first === second).assertFalse();
        expect(first === nativeParser.result).assertFalse();
        expect(second === nativeParser.result).assertFalse();
        for (let index = 0; index < 0; index++) {
          expect(first.getData(index) === second.getData(index)).assertFalse();
          expect(first.getData(index).data === nativeParser.result.getData(index).data).assertTrue();
          expect(first.getData(index).getObjectId() === second.getData(index).getObjectId()).assertFalse();
        }
        expect(resolver.calls).assertEqual(0);
      } finally {
        EtsFactory.factory = previousFactory;
      }
      expect(EtsFactory.factory === previousFactory).assertTrue();
    });

    /**
     * @tc.name WrapperParityTest_case_007
     * @tc.desc wrapper-parity: real wrapper with a controlled native dependency; input vector 7.
     * @tc.type Function
     * @tc.level Level1
     */
    it('WrapperParityTest_case_007', 0, async () => {
      await waitForNativeFactory();
      const previousFactory = EtsFactory.factory;
      const nativeParser = new ControlledParser();
      const factory = new ControlledFactory(nativeParser);
      const resolver = new RecordingResolver();
      const type = "test.wrapper-parity.6";
      registry.registerCard(type, resolver);
      nativeParser.result = makeSource(type, 1, "wrapper-parity:6");
      EtsFactory.factory = factory;
      try {
        const wrapper = new DataParserStaW();
        expect(factory.calls).assertEqual(1);
        const first = await wrapper.parse([]);
        const second = await wrapper.parse([]);
        await assertSource(first, type, 1, "wrapper-parity:6");
        await assertSource(second, type, 1, "wrapper-parity:6");
        expect(first === second).assertFalse();
        expect(first === nativeParser.result).assertFalse();
        expect(second === nativeParser.result).assertFalse();
        for (let index = 0; index < 1; index++) {
          expect(first.getData(index) === second.getData(index)).assertFalse();
          expect(first.getData(index).data === nativeParser.result.getData(index).data).assertTrue();
          expect(first.getData(index).getObjectId() === second.getData(index).getObjectId()).assertFalse();
        }
        expect(resolver.calls).assertEqual(2);
      } finally {
        EtsFactory.factory = previousFactory;
      }
      expect(EtsFactory.factory === previousFactory).assertTrue();
    });

    /**
     * @tc.name WrapperParityTest_case_008
     * @tc.desc wrapper-parity: real wrapper with a controlled native dependency; input vector 8.
     * @tc.type Function
     * @tc.level Level1
     */
    it('WrapperParityTest_case_008', 0, async () => {
      await waitForNativeFactory();
      const previousFactory = EtsFactory.factory;
      const nativeParser = new ControlledParser();
      const factory = new ControlledFactory(nativeParser);
      const resolver = new RecordingResolver();
      const type = "test.wrapper-parity.7";
      registry.registerCard(type, resolver);
      nativeParser.result = makeSource(type, 2, "wrapper-parity:7");
      EtsFactory.factory = factory;
      try {
        const wrapper = new DataParserStaW();
        expect(factory.calls).assertEqual(1);
        const first = await wrapper.parse([]);
        const second = await wrapper.parse([]);
        await assertSource(first, type, 2, "wrapper-parity:7");
        await assertSource(second, type, 2, "wrapper-parity:7");
        expect(first === second).assertFalse();
        expect(first === nativeParser.result).assertFalse();
        expect(second === nativeParser.result).assertFalse();
        for (let index = 0; index < 2; index++) {
          expect(first.getData(index) === second.getData(index)).assertFalse();
          expect(first.getData(index).data === nativeParser.result.getData(index).data).assertTrue();
          expect(first.getData(index).getObjectId() === second.getData(index).getObjectId()).assertFalse();
        }
        expect(resolver.calls).assertEqual(4);
      } finally {
        EtsFactory.factory = previousFactory;
      }
      expect(EtsFactory.factory === previousFactory).assertTrue();
    });

    /**
     * @tc.name WrapperParityTest_case_009
     * @tc.desc wrapper-parity: real wrapper with a controlled native dependency; input vector 9.
     * @tc.type Function
     * @tc.level Level1
     */
    it('WrapperParityTest_case_009', 0, async () => {
      await waitForNativeFactory();
      const previousFactory = EtsFactory.factory;
      const nativeParser = new ControlledParser();
      const factory = new ControlledFactory(nativeParser);
      const resolver = new RecordingResolver();
      const type = "test.wrapper-parity.8";
      registry.registerCard(type, resolver);
      nativeParser.result = makeSource(type, 3, "wrapper-parity:8");
      EtsFactory.factory = factory;
      try {
        const wrapper = new DataParserStaW();
        expect(factory.calls).assertEqual(1);
        const first = await wrapper.parse([]);
        const second = await wrapper.parse([]);
        await assertSource(first, type, 3, "wrapper-parity:8");
        await assertSource(second, type, 3, "wrapper-parity:8");
        expect(first === second).assertFalse();
        expect(first === nativeParser.result).assertFalse();
        expect(second === nativeParser.result).assertFalse();
        for (let index = 0; index < 3; index++) {
          expect(first.getData(index) === second.getData(index)).assertFalse();
          expect(first.getData(index).data === nativeParser.result.getData(index).data).assertTrue();
          expect(first.getData(index).getObjectId() === second.getData(index).getObjectId()).assertFalse();
        }
        expect(resolver.calls).assertEqual(6);
      } finally {
        EtsFactory.factory = previousFactory;
      }
      expect(EtsFactory.factory === previousFactory).assertTrue();
    });

    /**
     * @tc.name WrapperParityTest_case_010
     * @tc.desc wrapper-parity: real wrapper with a controlled native dependency; input vector 10.
     * @tc.type Function
     * @tc.level Level1
     */
    it('WrapperParityTest_case_010', 0, async () => {
      await waitForNativeFactory();
      const previousFactory = EtsFactory.factory;
      const nativeParser = new ControlledParser();
      const factory = new ControlledFactory(nativeParser);
      const resolver = new RecordingResolver();
      const type = "test.wrapper-parity.9";
      registry.registerCard(type, resolver);
      nativeParser.result = makeSource(type, 4, "wrapper-parity:9");
      EtsFactory.factory = factory;
      try {
        const wrapper = new DataParserStaW();
        expect(factory.calls).assertEqual(1);
        const first = await wrapper.parse([]);
        const second = await wrapper.parse([]);
        await assertSource(first, type, 4, "wrapper-parity:9");
        await assertSource(second, type, 4, "wrapper-parity:9");
        expect(first === second).assertFalse();
        expect(first === nativeParser.result).assertFalse();
        expect(second === nativeParser.result).assertFalse();
        for (let index = 0; index < 4; index++) {
          expect(first.getData(index) === second.getData(index)).assertFalse();
          expect(first.getData(index).data === nativeParser.result.getData(index).data).assertTrue();
          expect(first.getData(index).getObjectId() === second.getData(index).getObjectId()).assertFalse();
        }
        expect(resolver.calls).assertEqual(8);
      } finally {
        EtsFactory.factory = previousFactory;
      }
      expect(EtsFactory.factory === previousFactory).assertTrue();
    });

    /**
     * @tc.name WrapperParityTest_case_011
     * @tc.desc wrapper-parity: real wrapper with a controlled native dependency; input vector 11.
     * @tc.type Function
     * @tc.level Level1
     */
    it('WrapperParityTest_case_011', 0, async () => {
      await waitForNativeFactory();
      const previousFactory = EtsFactory.factory;
      const nativeParser = new ControlledParser();
      const factory = new ControlledFactory(nativeParser);
      const resolver = new RecordingResolver();
      const type = "test.wrapper-parity.10";
      registry.registerCard(type, resolver);
      nativeParser.result = makeSource(type, 0, "wrapper-parity:10");
      EtsFactory.factory = factory;
      try {
        const wrapper = new DataParserStaW();
        expect(factory.calls).assertEqual(1);
        const first = await wrapper.parse([]);
        const second = await wrapper.parse([]);
        await assertSource(first, type, 0, "wrapper-parity:10");
        await assertSource(second, type, 0, "wrapper-parity:10");
        expect(first === second).assertFalse();
        expect(first === nativeParser.result).assertFalse();
        expect(second === nativeParser.result).assertFalse();
        for (let index = 0; index < 0; index++) {
          expect(first.getData(index) === second.getData(index)).assertFalse();
          expect(first.getData(index).data === nativeParser.result.getData(index).data).assertTrue();
          expect(first.getData(index).getObjectId() === second.getData(index).getObjectId()).assertFalse();
        }
        expect(resolver.calls).assertEqual(0);
      } finally {
        EtsFactory.factory = previousFactory;
      }
      expect(EtsFactory.factory === previousFactory).assertTrue();
    });

    /**
     * @tc.name WrapperParityTest_case_012
     * @tc.desc wrapper-parity: real wrapper with a controlled native dependency; input vector 12.
     * @tc.type Function
     * @tc.level Level1
     */
    it('WrapperParityTest_case_012', 0, async () => {
      await waitForNativeFactory();
      const previousFactory = EtsFactory.factory;
      const nativeParser = new ControlledParser();
      const factory = new ControlledFactory(nativeParser);
      const resolver = new RecordingResolver();
      const type = "test.wrapper-parity.11";
      registry.registerCard(type, resolver);
      nativeParser.result = makeSource(type, 1, "wrapper-parity:11");
      EtsFactory.factory = factory;
      try {
        const wrapper = new DataParserStaW();
        expect(factory.calls).assertEqual(1);
        const first = await wrapper.parse([]);
        const second = await wrapper.parse([]);
        await assertSource(first, type, 1, "wrapper-parity:11");
        await assertSource(second, type, 1, "wrapper-parity:11");
        expect(first === second).assertFalse();
        expect(first === nativeParser.result).assertFalse();
        expect(second === nativeParser.result).assertFalse();
        for (let index = 0; index < 1; index++) {
          expect(first.getData(index) === second.getData(index)).assertFalse();
          expect(first.getData(index).data === nativeParser.result.getData(index).data).assertTrue();
          expect(first.getData(index).getObjectId() === second.getData(index).getObjectId()).assertFalse();
        }
        expect(resolver.calls).assertEqual(2);
      } finally {
        EtsFactory.factory = previousFactory;
      }
      expect(EtsFactory.factory === previousFactory).assertTrue();
    });

    /**
     * @tc.name WrapperParityTest_case_013
     * @tc.desc wrapper-parity: real wrapper with a controlled native dependency; input vector 13.
     * @tc.type Function
     * @tc.level Level1
     */
    it('WrapperParityTest_case_013', 0, async () => {
      await waitForNativeFactory();
      const previousFactory = EtsFactory.factory;
      const nativeParser = new ControlledParser();
      const factory = new ControlledFactory(nativeParser);
      const resolver = new RecordingResolver();
      const type = "test.wrapper-parity.12";
      registry.registerCard(type, resolver);
      nativeParser.result = makeSource(type, 2, "wrapper-parity:12");
      EtsFactory.factory = factory;
      try {
        const wrapper = new DataParserStaW();
        expect(factory.calls).assertEqual(1);
        const first = await wrapper.parse([]);
        const second = await wrapper.parse([]);
        await assertSource(first, type, 2, "wrapper-parity:12");
        await assertSource(second, type, 2, "wrapper-parity:12");
        expect(first === second).assertFalse();
        expect(first === nativeParser.result).assertFalse();
        expect(second === nativeParser.result).assertFalse();
        for (let index = 0; index < 2; index++) {
          expect(first.getData(index) === second.getData(index)).assertFalse();
          expect(first.getData(index).data === nativeParser.result.getData(index).data).assertTrue();
          expect(first.getData(index).getObjectId() === second.getData(index).getObjectId()).assertFalse();
        }
        expect(resolver.calls).assertEqual(4);
      } finally {
        EtsFactory.factory = previousFactory;
      }
      expect(EtsFactory.factory === previousFactory).assertTrue();
    });
  });
}
