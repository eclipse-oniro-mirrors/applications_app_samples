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

import { describe, beforeEach, it as hypiumIt, expect as hypiumExpect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import emitter from '@ohos.events.emitter';
import { CustomEmitter } from '@ohos/emitter';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_CustomEmitter_Stability]';
const ADD_EVENT_ID: number = 1025;
const BUY_EVENT_ID: string = 'buy';

function delay(ms: number): Promise<void> {
  return new Promise<void>((resolve: () => void) => {
    setTimeout(() => {
      resolve();
    }, ms);
  });
}

function it(name: string, filter: number, func: () => void | Promise<void>): void {
  hypiumIt(name, filter, async () => {
    await func();
  });
}

interface ExpectAssert {
  assertEqual(expectValue: string | number | boolean | Object | null | undefined): void;
  assertTrue(): void;
  assertFalse(): void;
  assertLarger(expectValue: number): void;
  assertLargerOrEqual(expectValue: number): void;
  assertLess(expectValue: number): void;
  assertLessOrEqual(expectValue: number): void;
  assertClose(expectValue: number, precision: number): void;
  assertUndefined(): void;
  assertFail(): void;
}

function expect(actual: string | number | boolean | Object | null | undefined): ExpectAssert {
  hilog.info(DOMAIN, TAG, '%{public}s', 'actual: ' + String(actual));
  return hypiumExpect(actual);
}

export default function customEmitterStabilityTest() {
  describe('customEmitterStabilityTest', () => {
    beforeEach(async () => {
      emitter.off(ADD_EVENT_ID);
      emitter.off(BUY_EVENT_ID);
      await delay(20);
    });

    /**
     * @tc.number SUB_CUSTOM_EMITTER_STABILITY_0100
     * @tc.name testFiftyAddEvents0001
     * @tc.desc Verify 50 emitted add events are all delivered in order within a loose budget
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFiftyAddEvents0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFiftyAddEvents0001 begin');
      const custom: CustomEmitter = new CustomEmitter();
      const received: number[] = [];
      custom.setShoppingCartGoodsList((data: emitter.EventData) => {
        received.push((data.data as Record<string, Object>)['id'] as number);
      });
      const start: number = Date.now();
      for (let i: number = 0; i < 50; i++) {
        custom.addGoods(i);
      }
      await delay(400);
      const cost: number = Date.now() - start;
      hilog.info(DOMAIN, TAG, '%{public}s', `fifty add delivered cost=${cost}ms`);
      expect(received.length).assertEqual(50);
      expect(received[0]).assertEqual(0);
      expect(received[49]).assertEqual(49);
      expect(cost < 5000).assertTrue();
      emitter.off(ADD_EVENT_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFiftyAddEvents0001 end');
    });

    /**
     * @tc.number SUB_CUSTOM_EMITTER_STABILITY_0200
     * @tc.name testRegisterEmitOffCycles0002
     * @tc.desc Verify repeated register/emit/off cycles each deliver exactly one id
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRegisterEmitOffCycles0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRegisterEmitOffCycles0002 begin');
      const custom: CustomEmitter = new CustomEmitter();
      for (let cycle: number = 0; cycle < 10; cycle++) {
        let delivered: number = -1;
        custom.setShoppingCartGoodsList((data: emitter.EventData) => {
          delivered = (data.data as Record<string, Object>)['id'] as number;
        });
        custom.addGoods(cycle);
        await delay(50);
        expect(delivered).assertEqual(cycle);
        emitter.off(ADD_EVENT_ID);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRegisterEmitOffCycles0002 end');
    });

    /**
     * @tc.number SUB_CUSTOM_EMITTER_STABILITY_0300
     * @tc.name testListenerCountGrowth0003
     * @tc.desc Verify five listener registrations grow the buy count to five and clear resets to zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testListenerCountGrowth0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testListenerCountGrowth0003 begin');
      const custom: CustomEmitter = new CustomEmitter();
      custom.clearListenerCounts((counts: number) => {
        expect(counts).assertEqual(0);
      });
      for (let i: number = 0; i < 5; i++) {
        custom.listenerEvents();
      }
      let grown: number = -1;
      custom.getListenerCounts((counts: number) => {
        grown = counts;
      });
      expect(grown).assertEqual(5);
      custom.clearListenerCounts((counts: number) => {
        expect(counts).assertEqual(0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'testListenerCountGrowth0003 end');
    });
  })
}
