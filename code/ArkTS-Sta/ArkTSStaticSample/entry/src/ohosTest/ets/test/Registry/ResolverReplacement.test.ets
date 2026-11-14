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

// Reference: ets/test/LifecycleState/ConfigurationChanges.test.ets
// Original line floor: 408; scenario family: registry-replace.
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

export default function ResolverReplacementTest(): void {
  describe('ResolverReplacementTest', () => {
    beforeAll(() => {
      logSuite('ResolverReplacementTest', 'begin');
    });
    beforeEach(async () => {
      // Yield between cases so device watchdog and UI events can be processed.
      await new Promise<void>((resolve) => { setTimeout(resolve, 1); });
    });
    afterAll(() => {
      logSuite('ResolverReplacementTest', 'end');
    });

    /**
     * @tc.name ResolverReplacementTest_case_001
     * @tc.desc registry-replace: registration lookup and resolver call isolation; input vector 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ResolverReplacementTest_case_001', 0, () => {
      const type = "test.registry-replace.0";
      const resolver = new RecordingResolver();
      const model = makeModel(type, makePayload("", "100%", 0));
      registry.registerCard(type, resolver);
      expect(registry.getCardResolver(type) === resolver).assertTrue();
      expect(resolver.calls).assertEqual(0);
      const otherType = type + ':other';
      const second = new RecordingResolver();
      registry.registerCard(otherType, second);
      const replacement = new RecordingResolver();
      registry.registerCard(type, replacement);
      expect(registry.getCardResolver(type) === replacement).assertTrue();
      expect(registry.getCardResolver(otherType) === second).assertTrue();
      const card = registry.getCardResolver(type)!.createData(model);
      expect(card.type).assertEqual(type);
      expect(card.data === model.data).assertTrue();
      expect(replacement.calls).assertEqual(1);
      expect(resolver.calls).assertEqual(0);
      expect(second.calls).assertEqual(0);
      registry.registerCard(type, resolver);
      expect(registry.getCardResolver(type) === resolver).assertTrue();
    });

    /**
     * @tc.name ResolverReplacementTest_case_002
     * @tc.desc registry-replace: registration lookup and resolver call isolation; input vector 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ResolverReplacementTest_case_002', 0, () => {
      const type = "test.registry-replace.1";
      const resolver = new RecordingResolver();
      const model = makeModel(type, makePayload("Card", "0%", 1));
      registry.registerCard(type, resolver);
      expect(registry.getCardResolver(type) === resolver).assertTrue();
      expect(resolver.calls).assertEqual(0);
      const otherType = type + ':other';
      const second = new RecordingResolver();
      registry.registerCard(otherType, second);
      const replacement = new RecordingResolver();
      registry.registerCard(type, replacement);
      expect(registry.getCardResolver(type) === replacement).assertTrue();
      expect(registry.getCardResolver(otherType) === second).assertTrue();
      const card = registry.getCardResolver(type)!.createData(model);
      expect(card.type).assertEqual(type);
      expect(card.data === model.data).assertTrue();
      expect(replacement.calls).assertEqual(1);
      expect(resolver.calls).assertEqual(0);
      expect(second.calls).assertEqual(0);
      registry.registerCard(type, resolver);
      expect(registry.getCardResolver(type) === resolver).assertTrue();
    });

    /**
     * @tc.name ResolverReplacementTest_case_003
     * @tc.desc registry-replace: registration lookup and resolver call isolation; input vector 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ResolverReplacementTest_case_003', 0, () => {
      const type = "test.registry-replace.2";
      const resolver = new RecordingResolver();
      const model = makeModel(type, makePayload(" ", "50%", 2));
      registry.registerCard(type, resolver);
      expect(registry.getCardResolver(type) === resolver).assertTrue();
      expect(resolver.calls).assertEqual(0);
      const otherType = type + ':other';
      const second = new RecordingResolver();
      registry.registerCard(otherType, second);
      const replacement = new RecordingResolver();
      registry.registerCard(type, replacement);
      expect(registry.getCardResolver(type) === replacement).assertTrue();
      expect(registry.getCardResolver(otherType) === second).assertTrue();
      const card = registry.getCardResolver(type)!.createData(model);
      expect(card.type).assertEqual(type);
      expect(card.data === model.data).assertTrue();
      expect(replacement.calls).assertEqual(1);
      expect(resolver.calls).assertEqual(0);
      expect(second.calls).assertEqual(0);
      registry.registerCard(type, resolver);
      expect(registry.getCardResolver(type) === resolver).assertTrue();
    });

    /**
     * @tc.name ResolverReplacementTest_case_004
     * @tc.desc registry-replace: registration lookup and resolver call isolation; input vector 4.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ResolverReplacementTest_case_004', 0, () => {
      const type = "test.registry-replace.3";
      const resolver = new RecordingResolver();
      const model = makeModel(type, makePayload("  padded  ", "1%", 3));
      registry.registerCard(type, resolver);
      expect(registry.getCardResolver(type) === resolver).assertTrue();
      expect(resolver.calls).assertEqual(0);
      const otherType = type + ':other';
      const second = new RecordingResolver();
      registry.registerCard(otherType, second);
      const replacement = new RecordingResolver();
      registry.registerCard(type, replacement);
      expect(registry.getCardResolver(type) === replacement).assertTrue();
      expect(registry.getCardResolver(otherType) === second).assertTrue();
      const card = registry.getCardResolver(type)!.createData(model);
      expect(card.type).assertEqual(type);
      expect(card.data === model.data).assertTrue();
      expect(replacement.calls).assertEqual(1);
      expect(resolver.calls).assertEqual(0);
      expect(second.calls).assertEqual(0);
      registry.registerCard(type, resolver);
      expect(registry.getCardResolver(type) === resolver).assertTrue();
    });

    /**
     * @tc.name ResolverReplacementTest_case_005
     * @tc.desc registry-replace: registration lookup and resolver call isolation; input vector 5.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ResolverReplacementTest_case_005', 0, () => {
      const type = "test.registry-replace.4";
      const resolver = new RecordingResolver();
      const model = makeModel(type, makePayload("multi word title", "99%", 4));
      registry.registerCard(type, resolver);
      expect(registry.getCardResolver(type) === resolver).assertTrue();
      expect(resolver.calls).assertEqual(0);
      const otherType = type + ':other';
      const second = new RecordingResolver();
      registry.registerCard(otherType, second);
      const replacement = new RecordingResolver();
      registry.registerCard(type, replacement);
      expect(registry.getCardResolver(type) === replacement).assertTrue();
      expect(registry.getCardResolver(otherType) === second).assertTrue();
      const card = registry.getCardResolver(type)!.createData(model);
      expect(card.type).assertEqual(type);
      expect(card.data === model.data).assertTrue();
      expect(replacement.calls).assertEqual(1);
      expect(resolver.calls).assertEqual(0);
      expect(second.calls).assertEqual(0);
      registry.registerCard(type, resolver);
      expect(registry.getCardResolver(type) === resolver).assertTrue();
    });

    /**
     * @tc.name ResolverReplacementTest_case_006
     * @tc.desc registry-replace: registration lookup and resolver call isolation; input vector 6.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ResolverReplacementTest_case_006', 0, () => {
      const type = "test.registry-replace.5";
      const resolver = new RecordingResolver();
      const model = makeModel(type, makePayload("line\nbreak", "75%", 5));
      registry.registerCard(type, resolver);
      expect(registry.getCardResolver(type) === resolver).assertTrue();
      expect(resolver.calls).assertEqual(0);
      const otherType = type + ':other';
      const second = new RecordingResolver();
      registry.registerCard(otherType, second);
      const replacement = new RecordingResolver();
      registry.registerCard(type, replacement);
      expect(registry.getCardResolver(type) === replacement).assertTrue();
      expect(registry.getCardResolver(otherType) === second).assertTrue();
      const card = registry.getCardResolver(type)!.createData(model);
      expect(card.type).assertEqual(type);
      expect(card.data === model.data).assertTrue();
      expect(replacement.calls).assertEqual(1);
      expect(resolver.calls).assertEqual(0);
      expect(second.calls).assertEqual(0);
      registry.registerCard(type, resolver);
      expect(registry.getCardResolver(type) === resolver).assertTrue();
    });

    /**
     * @tc.name ResolverReplacementTest_case_007
     * @tc.desc registry-replace: registration lookup and resolver call isolation; input vector 7.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ResolverReplacementTest_case_007', 0, () => {
      const type = "test.registry-replace.6";
      const resolver = new RecordingResolver();
      const model = makeModel(type, makePayload("tab\tvalue", "", 6));
      registry.registerCard(type, resolver);
      expect(registry.getCardResolver(type) === resolver).assertTrue();
      expect(resolver.calls).assertEqual(0);
      const otherType = type + ':other';
      const second = new RecordingResolver();
      registry.registerCard(otherType, second);
      const replacement = new RecordingResolver();
      registry.registerCard(type, replacement);
      expect(registry.getCardResolver(type) === replacement).assertTrue();
      expect(registry.getCardResolver(otherType) === second).assertTrue();
      const card = registry.getCardResolver(type)!.createData(model);
      expect(card.type).assertEqual(type);
      expect(card.data === model.data).assertTrue();
      expect(replacement.calls).assertEqual(1);
      expect(resolver.calls).assertEqual(0);
      expect(second.calls).assertEqual(0);
      registry.registerCard(type, resolver);
      expect(registry.getCardResolver(type) === resolver).assertTrue();
    });

    /**
     * @tc.name ResolverReplacementTest_case_008
     * @tc.desc registry-replace: registration lookup and resolver call isolation; input vector 8.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ResolverReplacementTest_case_008', 0, () => {
      const type = "test.registry-replace.7";
      const resolver = new RecordingResolver();
      const model = makeModel(type, makePayload("\u5361\u7247 1", ":{{env(screen-width}}", 7));
      registry.registerCard(type, resolver);
      expect(registry.getCardResolver(type) === resolver).assertTrue();
      expect(resolver.calls).assertEqual(0);
      const otherType = type + ':other';
      const second = new RecordingResolver();
      registry.registerCard(otherType, second);
      const replacement = new RecordingResolver();
      registry.registerCard(type, replacement);
      expect(registry.getCardResolver(type) === replacement).assertTrue();
      expect(registry.getCardResolver(otherType) === second).assertTrue();
      const card = registry.getCardResolver(type)!.createData(model);
      expect(card.type).assertEqual(type);
      expect(card.data === model.data).assertTrue();
      expect(replacement.calls).assertEqual(1);
      expect(resolver.calls).assertEqual(0);
      expect(second.calls).assertEqual(0);
      registry.registerCard(type, resolver);
      expect(registry.getCardResolver(type) === resolver).assertTrue();
    });

    /**
     * @tc.name ResolverReplacementTest_case_009
     * @tc.desc registry-replace: registration lookup and resolver call isolation; input vector 9.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ResolverReplacementTest_case_009', 0, () => {
      const type = "test.registry-replace.8";
      const resolver = new RecordingResolver();
      const model = makeModel(type, makePayload("\u5361\u7247 2", "100%", 8));
      registry.registerCard(type, resolver);
      expect(registry.getCardResolver(type) === resolver).assertTrue();
      expect(resolver.calls).assertEqual(0);
      const otherType = type + ':other';
      const second = new RecordingResolver();
      registry.registerCard(otherType, second);
      const replacement = new RecordingResolver();
      registry.registerCard(type, replacement);
      expect(registry.getCardResolver(type) === replacement).assertTrue();
      expect(registry.getCardResolver(otherType) === second).assertTrue();
      const card = registry.getCardResolver(type)!.createData(model);
      expect(card.type).assertEqual(type);
      expect(card.data === model.data).assertTrue();
      expect(replacement.calls).assertEqual(1);
      expect(resolver.calls).assertEqual(0);
      expect(second.calls).assertEqual(0);
      registry.registerCard(type, resolver);
      expect(registry.getCardResolver(type) === resolver).assertTrue();
    });

    /**
     * @tc.name ResolverReplacementTest_case_010
     * @tc.desc registry-replace: registration lookup and resolver call isolation; input vector 10.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ResolverReplacementTest_case_010', 0, () => {
      const type = "test.registry-replace.9";
      const resolver = new RecordingResolver();
      const model = makeModel(type, makePayload("\u5361\u7247 3", "0%", 9));
      registry.registerCard(type, resolver);
      expect(registry.getCardResolver(type) === resolver).assertTrue();
      expect(resolver.calls).assertEqual(0);
      const otherType = type + ':other';
      const second = new RecordingResolver();
      registry.registerCard(otherType, second);
      const replacement = new RecordingResolver();
      registry.registerCard(type, replacement);
      expect(registry.getCardResolver(type) === replacement).assertTrue();
      expect(registry.getCardResolver(otherType) === second).assertTrue();
      const card = registry.getCardResolver(type)!.createData(model);
      expect(card.type).assertEqual(type);
      expect(card.data === model.data).assertTrue();
      expect(replacement.calls).assertEqual(1);
      expect(resolver.calls).assertEqual(0);
      expect(second.calls).assertEqual(0);
      registry.registerCard(type, resolver);
      expect(registry.getCardResolver(type) === resolver).assertTrue();
    });

    /**
     * @tc.name ResolverReplacementTest_case_011
     * @tc.desc registry-replace: registration lookup and resolver call isolation; input vector 11.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ResolverReplacementTest_case_011', 0, () => {
      const type = "test.registry-replace.10";
      const resolver = new RecordingResolver();
      const model = makeModel(type, makePayload("\u65e5\u672c\u8a9e", "50%", 10));
      registry.registerCard(type, resolver);
      expect(registry.getCardResolver(type) === resolver).assertTrue();
      expect(resolver.calls).assertEqual(0);
      const otherType = type + ':other';
      const second = new RecordingResolver();
      registry.registerCard(otherType, second);
      const replacement = new RecordingResolver();
      registry.registerCard(type, replacement);
      expect(registry.getCardResolver(type) === replacement).assertTrue();
      expect(registry.getCardResolver(otherType) === second).assertTrue();
      const card = registry.getCardResolver(type)!.createData(model);
      expect(card.type).assertEqual(type);
      expect(card.data === model.data).assertTrue();
      expect(replacement.calls).assertEqual(1);
      expect(resolver.calls).assertEqual(0);
      expect(second.calls).assertEqual(0);
      registry.registerCard(type, resolver);
      expect(registry.getCardResolver(type) === resolver).assertTrue();
    });

    /**
     * @tc.name ResolverReplacementTest_case_012
     * @tc.desc registry-replace: registration lookup and resolver call isolation; input vector 12.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ResolverReplacementTest_case_012', 0, () => {
      const type = "test.registry-replace.11";
      const resolver = new RecordingResolver();
      const model = makeModel(type, makePayload("\u0645\u0631\u062d\u0628\u0627", "1%", 11));
      registry.registerCard(type, resolver);
      expect(registry.getCardResolver(type) === resolver).assertTrue();
      expect(resolver.calls).assertEqual(0);
      const otherType = type + ':other';
      const second = new RecordingResolver();
      registry.registerCard(otherType, second);
      const replacement = new RecordingResolver();
      registry.registerCard(type, replacement);
      expect(registry.getCardResolver(type) === replacement).assertTrue();
      expect(registry.getCardResolver(otherType) === second).assertTrue();
      const card = registry.getCardResolver(type)!.createData(model);
      expect(card.type).assertEqual(type);
      expect(card.data === model.data).assertTrue();
      expect(replacement.calls).assertEqual(1);
      expect(resolver.calls).assertEqual(0);
      expect(second.calls).assertEqual(0);
      registry.registerCard(type, resolver);
      expect(registry.getCardResolver(type) === resolver).assertTrue();
    });
  });
}
