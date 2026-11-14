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

// Reference: ets/test/PowerValidation/PowerAuthSession.test.ets
// Original line floor: 869; scenario family: registry-isolation.
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

export default function RegistrationIsolationTest(): void {
  describe('RegistrationIsolationTest', () => {
    beforeAll(() => {
      logSuite('RegistrationIsolationTest', 'begin');
    });
    beforeEach(async () => {
      // Yield between cases so device watchdog and UI events can be processed.
      await new Promise<void>((resolve) => { setTimeout(resolve, 1); });
    });
    afterAll(() => {
      logSuite('RegistrationIsolationTest', 'end');
    });

    /**
     * @tc.name RegistrationIsolationTest_case_001
     * @tc.desc registry-isolation: registration lookup and resolver call isolation; input vector 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('RegistrationIsolationTest_case_001', 0, () => {
      const type = "test.registry-isolation.0";
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
     * @tc.name RegistrationIsolationTest_case_002
     * @tc.desc registry-isolation: registration lookup and resolver call isolation; input vector 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('RegistrationIsolationTest_case_002', 0, () => {
      const type = "test.registry-isolation.1";
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
     * @tc.name RegistrationIsolationTest_case_003
     * @tc.desc registry-isolation: registration lookup and resolver call isolation; input vector 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('RegistrationIsolationTest_case_003', 0, () => {
      const type = "test.registry-isolation.2";
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
     * @tc.name RegistrationIsolationTest_case_004
     * @tc.desc registry-isolation: registration lookup and resolver call isolation; input vector 4.
     * @tc.type Function
     * @tc.level Level1
     */
    it('RegistrationIsolationTest_case_004', 0, () => {
      const type = "test.registry-isolation.3";
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
     * @tc.name RegistrationIsolationTest_case_005
     * @tc.desc registry-isolation: registration lookup and resolver call isolation; input vector 5.
     * @tc.type Function
     * @tc.level Level1
     */
    it('RegistrationIsolationTest_case_005', 0, () => {
      const type = "test.registry-isolation.4";
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
     * @tc.name RegistrationIsolationTest_case_006
     * @tc.desc registry-isolation: registration lookup and resolver call isolation; input vector 6.
     * @tc.type Function
     * @tc.level Level1
     */
    it('RegistrationIsolationTest_case_006', 0, () => {
      const type = "test.registry-isolation.5";
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
     * @tc.name RegistrationIsolationTest_case_007
     * @tc.desc registry-isolation: registration lookup and resolver call isolation; input vector 7.
     * @tc.type Function
     * @tc.level Level1
     */
    it('RegistrationIsolationTest_case_007', 0, () => {
      const type = "test.registry-isolation.6";
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
     * @tc.name RegistrationIsolationTest_case_008
     * @tc.desc registry-isolation: registration lookup and resolver call isolation; input vector 8.
     * @tc.type Function
     * @tc.level Level1
     */
    it('RegistrationIsolationTest_case_008', 0, () => {
      const type = "test.registry-isolation.7";
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
     * @tc.name RegistrationIsolationTest_case_009
     * @tc.desc registry-isolation: registration lookup and resolver call isolation; input vector 9.
     * @tc.type Function
     * @tc.level Level1
     */
    it('RegistrationIsolationTest_case_009', 0, () => {
      const type = "test.registry-isolation.8";
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
     * @tc.name RegistrationIsolationTest_case_010
     * @tc.desc registry-isolation: registration lookup and resolver call isolation; input vector 10.
     * @tc.type Function
     * @tc.level Level1
     */
    it('RegistrationIsolationTest_case_010', 0, () => {
      const type = "test.registry-isolation.9";
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
     * @tc.name RegistrationIsolationTest_case_011
     * @tc.desc registry-isolation: registration lookup and resolver call isolation; input vector 11.
     * @tc.type Function
     * @tc.level Level1
     */
    it('RegistrationIsolationTest_case_011', 0, () => {
      const type = "test.registry-isolation.10";
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
     * @tc.name RegistrationIsolationTest_case_012
     * @tc.desc registry-isolation: registration lookup and resolver call isolation; input vector 12.
     * @tc.type Function
     * @tc.level Level1
     */
    it('RegistrationIsolationTest_case_012', 0, () => {
      const type = "test.registry-isolation.11";
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

    /**
     * @tc.name RegistrationIsolationTest_case_013
     * @tc.desc registry-isolation: registration lookup and resolver call isolation; input vector 13.
     * @tc.type Function
     * @tc.level Level1
     */
    it('RegistrationIsolationTest_case_013', 0, () => {
      const type = "test.registry-isolation.12";
      const resolver = new RecordingResolver();
      const model = makeModel(type, makePayload("\u05e9\u05dc\u05d5\u05dd", "99%", 12));
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
     * @tc.name RegistrationIsolationTest_case_014
     * @tc.desc registry-isolation: registration lookup and resolver call isolation; input vector 14.
     * @tc.type Function
     * @tc.level Level1
     */
    it('RegistrationIsolationTest_case_014', 0, () => {
      const type = "test.registry-isolation.13";
      const resolver = new RecordingResolver();
      const model = makeModel(type, makePayload("e\u0301", "75%", 13));
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
     * @tc.name RegistrationIsolationTest_case_015
     * @tc.desc registry-isolation: registration lookup and resolver call isolation; input vector 15.
     * @tc.type Function
     * @tc.level Level1
     */
    it('RegistrationIsolationTest_case_015', 0, () => {
      const type = "test.registry-isolation.14";
      const resolver = new RecordingResolver();
      const model = makeModel(type, makePayload("\u00e9", "", 14));
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
     * @tc.name RegistrationIsolationTest_case_016
     * @tc.desc registry-isolation: registration lookup and resolver call isolation; input vector 16.
     * @tc.type Function
     * @tc.level Level1
     */
    it('RegistrationIsolationTest_case_016', 0, () => {
      const type = "test.registry-isolation.15";
      const resolver = new RecordingResolver();
      const model = makeModel(type, makePayload("\ud83d\ude80", ":{{env(screen-width}}", 15));
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
     * @tc.name RegistrationIsolationTest_case_017
     * @tc.desc registry-isolation: registration lookup and resolver call isolation; input vector 17.
     * @tc.type Function
     * @tc.level Level1
     */
    it('RegistrationIsolationTest_case_017', 0, () => {
      const type = "test.registry-isolation.16";
      const resolver = new RecordingResolver();
      const model = makeModel(type, makePayload("quote\"slash\\", "100%", 16));
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
     * @tc.name RegistrationIsolationTest_case_018
     * @tc.desc registry-isolation: registration lookup and resolver call isolation; input vector 18.
     * @tc.type Function
     * @tc.level Level1
     */
    it('RegistrationIsolationTest_case_018', 0, () => {
      const type = "test.registry-isolation.17";
      const resolver = new RecordingResolver();
      const model = makeModel(type, makePayload("<script>alert(1)</script>", "0%", 17));
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
     * @tc.name RegistrationIsolationTest_case_019
     * @tc.desc registry-isolation: registration lookup and resolver call isolation; input vector 19.
     * @tc.type Function
     * @tc.level Level1
     */
    it('RegistrationIsolationTest_case_019', 0, () => {
      const type = "test.registry-isolation.18";
      const resolver = new RecordingResolver();
      const model = makeModel(type, makePayload("${notExecuted}", "50%", 18));
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
     * @tc.name RegistrationIsolationTest_case_020
     * @tc.desc registry-isolation: registration lookup and resolver call isolation; input vector 20.
     * @tc.type Function
     * @tc.level Level1
     */
    it('RegistrationIsolationTest_case_020', 0, () => {
      const type = "test.registry-isolation.19";
      const resolver = new RecordingResolver();
      const model = makeModel(type, makePayload("__proto__", "1%", 19));
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
     * @tc.name RegistrationIsolationTest_case_021
     * @tc.desc registry-isolation: registration lookup and resolver call isolation; input vector 21.
     * @tc.type Function
     * @tc.level Level1
     */
    it('RegistrationIsolationTest_case_021', 0, () => {
      const type = "test.registry-isolation.20";
      const resolver = new RecordingResolver();
      const model = makeModel(type, makePayload("constructor", "99%", 20));
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
     * @tc.name RegistrationIsolationTest_case_022
     * @tc.desc registry-isolation: registration lookup and resolver call isolation; input vector 22.
     * @tc.type Function
     * @tc.level Level1
     */
    it('RegistrationIsolationTest_case_022', 0, () => {
      const type = "test.registry-isolation.21";
      const resolver = new RecordingResolver();
      const model = makeModel(type, makePayload("null", "75%", 21));
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
     * @tc.name RegistrationIsolationTest_case_023
     * @tc.desc registry-isolation: registration lookup and resolver call isolation; input vector 23.
     * @tc.type Function
     * @tc.level Level1
     */
    it('RegistrationIsolationTest_case_023', 0, () => {
      const type = "test.registry-isolation.22";
      const resolver = new RecordingResolver();
      const model = makeModel(type, makePayload("false", "", 22));
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
     * @tc.name RegistrationIsolationTest_case_024
     * @tc.desc registry-isolation: registration lookup and resolver call isolation; input vector 24.
     * @tc.type Function
     * @tc.level Level1
     */
    it('RegistrationIsolationTest_case_024', 0, () => {
      const type = "test.registry-isolation.23";
      const resolver = new RecordingResolver();
      const model = makeModel(type, makePayload("0", ":{{env(screen-width}}", 23));
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
     * @tc.name RegistrationIsolationTest_case_025
     * @tc.desc registry-isolation: registration lookup and resolver call isolation; input vector 25.
     * @tc.type Function
     * @tc.level Level1
     */
    it('RegistrationIsolationTest_case_025', 0, () => {
      const type = "test.registry-isolation.24";
      const resolver = new RecordingResolver();
      const model = makeModel(type, makePayload("100%", "100%", 24));
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
     * @tc.name RegistrationIsolationTest_case_026
     * @tc.desc registry-isolation: registration lookup and resolver call isolation; input vector 26.
     * @tc.type Function
     * @tc.level Level1
     */
    it('RegistrationIsolationTest_case_026', 0, () => {
      const type = "test.registry-isolation.25";
      const resolver = new RecordingResolver();
      const model = makeModel(type, makePayload("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA", "0%", 25));
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
     * @tc.name RegistrationIsolationTest_case_027
     * @tc.desc registry-isolation: registration lookup and resolver call isolation; input vector 27.
     * @tc.type Function
     * @tc.level Level1
     */
    it('RegistrationIsolationTest_case_027', 0, () => {
      const type = "test.registry-isolation.26";
      const resolver = new RecordingResolver();
      const model = makeModel(type, makePayload("\u0000", "50%", 26));
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
     * @tc.name RegistrationIsolationTest_case_028
     * @tc.desc registry-isolation: registration lookup and resolver call isolation; input vector 28.
     * @tc.type Function
     * @tc.level Level1
     */
    it('RegistrationIsolationTest_case_028', 0, () => {
      const type = "test.registry-isolation.27";
      const resolver = new RecordingResolver();
      const model = makeModel(type, makePayload("\u2028", "1%", 27));
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
