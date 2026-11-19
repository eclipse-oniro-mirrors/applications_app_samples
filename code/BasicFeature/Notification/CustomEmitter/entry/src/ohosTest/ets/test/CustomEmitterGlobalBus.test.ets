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
const TAG: string = '[Sample_CustomEmitter_GlobalBus]';
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

export default function customEmitterGlobalBusTest() {
  describe('customEmitterGlobalBusTest', () => {
    beforeEach(async () => {
      emitter.off(ADD_EVENT_ID);
      emitter.off(BUY_EVENT_ID);
      await delay(20);
    });

    /**
     * @tc.number SUB_CUSTOM_EMITTER_GLOBAL_0100
     * @tc.name testCrossInstanceDelivery0001
     * @tc.desc Verify a listener registered by one instance receives an event emitted by another instance
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testCrossInstanceDelivery0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCrossInstanceDelivery0001 begin');
      const publisher: CustomEmitter = new CustomEmitter();
      const subscriber: CustomEmitter = new CustomEmitter();
      let received: number = -1;
      subscriber.setShoppingCartGoodsList((data: emitter.EventData) => {
        received = (data.data as Record<string, Object>)['id'] as number;
      });
      publisher.addGoods(11);
      await delay(80);
      expect(received).assertEqual(11);
      emitter.off(ADD_EVENT_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCrossInstanceDelivery0001 end');
    });

    /**
     * @tc.number SUB_CUSTOM_EMITTER_GLOBAL_0200
     * @tc.name testTwoBuyListenersCount0002
     * @tc.desc Verify two instances subscribing the buy event grow the shared count to two
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testTwoBuyListenersCount0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTwoBuyListenersCount0002 begin');
      const first: CustomEmitter = new CustomEmitter();
      const second: CustomEmitter = new CustomEmitter();
      first.clearListenerCounts((counts: number) => {
        expect(counts).assertEqual(0);
      });
      first.listenerEvents();
      second.listenerEvents();
      let count: number = -1;
      first.getListenerCounts((counts: number) => {
        count = counts;
      });
      expect(count).assertEqual(2);
      second.clearListenerCounts((counts: number) => {
        expect(counts).assertEqual(0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'testTwoBuyListenersCount0002 end');
    });
  })
}
