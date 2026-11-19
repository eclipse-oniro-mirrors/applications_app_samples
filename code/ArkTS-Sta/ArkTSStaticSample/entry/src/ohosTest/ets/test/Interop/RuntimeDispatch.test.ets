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
