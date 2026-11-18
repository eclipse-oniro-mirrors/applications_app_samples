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
const TAG: string = '[Sample_CustomEmitter_Recovery]';
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

export default function customEmitterRecoveryTest() {
  describe('customEmitterRecoveryTest', () => {
    beforeEach(async () => {
      emitter.off(ADD_EVENT_ID);
      emitter.off(BUY_EVENT_ID);
      await delay(20);
    });

    /**
     * @tc.number SUB_CUSTOM_EMITTER_RECOVERY_0100
     * @tc.name testClearThenRedeliver0001
     * @tc.desc Verify after off the add listener stops, and re-registering restores delivery
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testClearThenRedeliver0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testClearThenRedeliver0001 begin');
      const custom: CustomEmitter = new CustomEmitter();
      let count: number = 0;
      custom.setShoppingCartGoodsList((data: emitter.EventData) => {
        count++;
      });
      custom.addGoods(1);
      await delay(80);
      expect(count).assertEqual(1);

      emitter.off(ADD_EVENT_ID);
      custom.addGoods(2);
      await delay(80);
      expect(count).assertEqual(1);

      custom.setShoppingCartGoodsList((data: emitter.EventData) => {
        count++;
      });
      custom.addGoods(3);
      await delay(80);
      expect(count).assertEqual(2);
      emitter.off(ADD_EVENT_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testClearThenRedeliver0001 end');
    });

    /**
     * @tc.number SUB_CUSTOM_EMITTER_RECOVERY_0200
     * @tc.name testListenerCountRecovery0002
     * @tc.desc Verify buy listener count drops to zero on clear and can grow again
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testListenerCountRecovery0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testListenerCountRecovery0002 begin');
      const custom: CustomEmitter = new CustomEmitter();
      custom.listenerEvents();
      let first: number = -1;
      custom.getListenerCounts((counts: number) => {
        first = counts;
      });
      expect(first).assertEqual(1);
      custom.clearListenerCounts((counts: number) => {
        expect(counts).assertEqual(0);
      });
      custom.listenerEvents();
      let again: number = -1;
      custom.getListenerCounts((counts: number) => {
        again = counts;
      });
      expect(again).assertEqual(1);
      custom.clearListenerCounts((counts: number) => {
        expect(counts).assertEqual(0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'testListenerCountRecovery0002 end');
    });

    /**
     * @tc.number SUB_CUSTOM_EMITTER_RECOVERY_0300
     * @tc.name testRedeliverAfterManyClears0003
     * @tc.desc Verify five clear cycles keep state clean and a final delivery still works
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRedeliverAfterManyClears0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRedeliverAfterManyClears0003 begin');
      const custom: CustomEmitter = new CustomEmitter();
      for (let cycle: number = 0; cycle < 5; cycle++) {
        custom.setShoppingCartGoodsList((data: emitter.EventData) => {
        });
        emitter.off(ADD_EVENT_ID);
      }
      let delivered: number = -1;
      custom.setShoppingCartGoodsList((data: emitter.EventData) => {
        delivered = (data.data as Record<string, Object>)['id'] as number;
      });
      custom.addGoods(42);
      await delay(80);
      expect(delivered).assertEqual(42);
      emitter.off(ADD_EVENT_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRedeliverAfterManyClears0003 end');
    });
  })
}
