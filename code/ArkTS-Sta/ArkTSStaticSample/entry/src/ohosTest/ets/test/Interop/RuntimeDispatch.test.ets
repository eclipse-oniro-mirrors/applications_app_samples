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

// Reference: ets/test/Integration/DeviceCompatibility.test.ets
// Original line floor: 88; scenario family: dispatch.
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
import { DataParser as PublicParser } from 'library';
import deviceInfo from '@ohos.deviceInfo';

export default function RuntimeDispatchTest(): void {
  describe('RuntimeDispatchTest', () => {
    beforeAll(() => {
      logSuite('RuntimeDispatchTest', 'begin');
    });
    beforeEach(async () => {
      // Yield between cases so device watchdog and UI events can be processed.
      await new Promise<void>((resolve) => { setTimeout(resolve, 1); });
    });
    afterAll(() => {
      logSuite('RuntimeDispatchTest', 'end');
    });

    /**
     * @tc.name RuntimeDispatchTest_case_001
     * @tc.desc dispatch: verify the actual selected constructor on this device; input vector 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('RuntimeDispatchTest_case_001', 0, async () => {
      const api = deviceInfo.sdkApiVersion;
      expect(api > 0).assertTrue();
      const selected = PublicParser as Object;
      const expected = (api >= 23 ? DataParserStaW : DynamicParser) as Object;
      expect(selected === expected).assertTrue();
      await waitForNativeFactory();
      const instance = new PublicParser();
      expect(instance !== undefined).assertTrue();
      expect(instance instanceof DataParserStaW).assertEqual(api >= 23);
      expect(instance instanceof DynamicParser).assertEqual(api < 23);
    });

    /**
     * @tc.name RuntimeDispatchTest_case_002
     * @tc.desc dispatch: selected implementation returns independent empty dynamic data sources; input vector 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('RuntimeDispatchTest_case_002', 0, async () => {
      await waitForNativeFactory();
      const parser = new PublicParser();
      const source = await parser.parse([]);
      expect(source instanceof DataSource).assertTrue();
      expect(source.totalCount()).assertEqual(0);
      expect(source.getData(0)).assertUndefined();
      const second = await parser.parse([]);
      expect(second instanceof DataSource).assertTrue();
      expect(second.totalCount()).assertEqual(0);
      expect(source === second).assertFalse();
      expect(parser instanceof DataParserStaW).assertEqual(deviceInfo.sdkApiVersion >= 23);
    });
  });
}
