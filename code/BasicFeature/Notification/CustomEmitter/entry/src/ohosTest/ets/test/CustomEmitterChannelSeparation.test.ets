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
const TAG: string = '[Sample_CustomEmitter_Channel]';
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

export default function customEmitterChannelSeparationTest() {
  describe('customEmitterChannelSeparationTest', () => {
    beforeEach(async () => {
      emitter.off(ADD_EVENT_ID);
      emitter.off(DELETE_EVENT_ID);
      await delay(20);
    });

    /**
     * @tc.number SUB_CUSTOM_EMITTER_CHANNEL_0100
     * @tc.name testAddAndDeleteChannelsIsolated0001
     * @tc.desc Verify add and delete listeners only receive their own channel events
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testAddAndDeleteChannelsIsolated0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAddAndDeleteChannelsIsolated0001 begin');
      const custom: CustomEmitter = new CustomEmitter();
      let addCount: number = 0;
      let deleteCount: number = 0;
      let addId: number = -1;
      let deleteId: number = -1;
      custom.setShoppingCartGoodsList((data: emitter.EventData) => {
        addCount++;
        addId = (data.data as Record<string, Object>)['id'] as number;
      });
      custom.deleteShoppingCartGoodsList((data: emitter.EventData) => {
        deleteCount++;
        deleteId = (data.data as Record<string, Object>)['id'] as number;
      });
      custom.addGoods(1);
      await delay(80);
      expect(addCount).assertEqual(1);
      expect(deleteCount).assertEqual(0);
      expect(addId).assertEqual(1);
      custom.deleteGoods(2);
      await delay(80);
      expect(deleteCount).assertEqual(1);
      expect(deleteId).assertEqual(2);
      expect(addCount).assertEqual(1);
      emitter.off(ADD_EVENT_ID);
      emitter.off(DELETE_EVENT_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAddAndDeleteChannelsIsolated0001 end');
    });

    /**
     * @tc.number SUB_CUSTOM_EMITTER_CHANNEL_0200
     * @tc.name testNumericAndStringIdsIndependent0002
     * @tc.desc Verify numeric add id and string delete id never cross-trigger even with same digits
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testNumericAndStringIdsIndependent0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNumericAndStringIdsIndependent0002 begin');
      const custom: CustomEmitter = new CustomEmitter();
      let deleteCount: number = 0;
      let addCount: number = 0;
      custom.deleteShoppingCartGoodsList((data: emitter.EventData) => {
        deleteCount++;
      });
      custom.setShoppingCartGoodsList((data: emitter.EventData) => {
        addCount++;
      });
      custom.addGoods(1025);
      await delay(80);
      expect(addCount).assertEqual(1);
      expect(deleteCount).assertEqual(0);
      emitter.off(ADD_EVENT_ID);
      emitter.off(DELETE_EVENT_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNumericAndStringIdsIndependent0002 end');
    });

    /**
     * @tc.number SUB_CUSTOM_EMITTER_CHANNEL_0300
     * @tc.name testOffStopsAddDelivery0003
     * @tc.desc Verify removing the add listeners stops further add delivery
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testOffStopsAddDelivery0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffStopsAddDelivery0003 begin');
      const custom: CustomEmitter = new CustomEmitter();
      let addCount: number = 0;
      custom.setShoppingCartGoodsList((data: emitter.EventData) => {
        addCount++;
      });
      emitter.off(ADD_EVENT_ID);
      custom.addGoods(5);
      await delay(80);
      expect(addCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffStopsAddDelivery0003 end');
    });

    /**
     * @tc.number SUB_CUSTOM_EMITTER_CHANNEL_0400
     * @tc.name testOffStopsDeleteDelivery0004
     * @tc.desc Verify removing the delete listeners stops further delete delivery
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testOffStopsDeleteDelivery0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffStopsDeleteDelivery0004 begin');
      const custom: CustomEmitter = new CustomEmitter();
      let deleteCount: number = 0;
      custom.deleteShoppingCartGoodsList((data: emitter.EventData) => {
        deleteCount++;
      });
      emitter.off(DELETE_EVENT_ID);
      custom.deleteGoods(6);
      await delay(80);
      expect(deleteCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOffStopsDeleteDelivery0004 end');
    });
  })
}
