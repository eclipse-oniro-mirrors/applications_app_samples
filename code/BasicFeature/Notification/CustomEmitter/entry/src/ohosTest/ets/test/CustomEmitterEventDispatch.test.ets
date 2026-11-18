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
const TAG: string = '[Sample_CustomEmitter_Dispatch]';
const ADD_EVENT_ID: number = 1025;
const DELETE_EVENT_ID: string = '1025';

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

export default function customEmitterEventDispatchTest() {
  describe('customEmitterEventDispatchTest', () => {
    beforeEach(async () => {
      emitter.off(ADD_EVENT_ID);
      emitter.off(DELETE_EVENT_ID);
      await delay(20);
    });

    /**
     * @tc.number SUB_CUSTOM_EMITTER_DISPATCH_0100
     * @tc.name testAddGoodsDispatch0001
     * @tc.desc Verify addGoods delivers the good id to the registered add listener
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testAddGoodsDispatch0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAddGoodsDispatch0001 begin');
      const custom: CustomEmitter = new CustomEmitter();
      let received: number = -1;
      custom.setShoppingCartGoodsList((data: emitter.EventData) => {
        received = (data.data as Record<string, Object>)['id'] as number;
      });
      custom.addGoods(7);
      await delay(100);
      expect(received).assertEqual(7);
      emitter.off(ADD_EVENT_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAddGoodsDispatch0001 end');
    });

    /**
     * @tc.number SUB_CUSTOM_EMITTER_DISPATCH_0200
     * @tc.name testDeleteGoodsDispatch0002
     * @tc.desc Verify deleteGoods delivers the removed item id to the delete listener
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testDeleteGoodsDispatch0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeleteGoodsDispatch0002 begin');
      const custom: CustomEmitter = new CustomEmitter();
      let received: number = -1;
      custom.deleteShoppingCartGoodsList((data: emitter.EventData) => {
        received = (data.data as Record<string, Object>)['id'] as number;
      });
      custom.deleteGoods(3);
      await delay(100);
      expect(received).assertEqual(3);
      emitter.off(DELETE_EVENT_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeleteGoodsDispatch0002 end');
    });

    /**
     * @tc.number SUB_CUSTOM_EMITTER_DISPATCH_0300
     * @tc.name testAddSequenceOrder0003
     * @tc.desc Verify repeated addGoods calls deliver ids in emission order
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testAddSequenceOrder0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAddSequenceOrder0003 begin');
      const custom: CustomEmitter = new CustomEmitter();
      const received: number[] = [];
      custom.setShoppingCartGoodsList((data: emitter.EventData) => {
        received.push((data.data as Record<string, Object>)['id'] as number);
      });
      for (let i: number = 0; i < 5; i++) {
        custom.addGoods(i);
      }
      await delay(150);
      expect(received.length).assertEqual(5);
      for (let i: number = 0; i < 5; i++) {
        expect(received[i]).assertEqual(i);
      }
      emitter.off(ADD_EVENT_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAddSequenceOrder0003 end');
    });

    /**
     * @tc.number SUB_CUSTOM_EMITTER_DISPATCH_0400
     * @tc.name testReRegisterReplacesListener0004
     * @tc.desc Verify re-registering the add listener replaces the previous callback
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testReRegisterReplacesListener0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testReRegisterReplacesListener0004 begin');
      const custom: CustomEmitter = new CustomEmitter();
      let firstCount: number = 0;
      let secondCount: number = 0;
      custom.setShoppingCartGoodsList((data: emitter.EventData) => {
        firstCount++;
      });
      custom.setShoppingCartGoodsList((data: emitter.EventData) => {
        secondCount++;
      });
      custom.addGoods(9);
      await delay(100);
      expect(firstCount).assertEqual(0);
      expect(secondCount).assertEqual(1);
      emitter.off(ADD_EVENT_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testReRegisterReplacesListener0004 end');
    });
  })
}
