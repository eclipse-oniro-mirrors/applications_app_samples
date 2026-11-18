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
const TAG: string = '[Sample_CustomEmitter_Boundary]';
const ADD_EVENT_ID: number = 1025;
const DIALOG_EVENT_ID: number = 1001;
const CLOSE_DIALOG_EVENT_ID: string = '1001';

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

export default function customEmitterBoundaryTest() {
  describe('customEmitterBoundaryTest', () => {
    beforeEach(async () => {
      emitter.off(ADD_EVENT_ID);
      await delay(20);
    });

    /**
     * @tc.number SUB_CUSTOM_EMITTER_BOUNDARY_0100
     * @tc.name testAddBoundaryIds0001
     * @tc.desc Verify addGoods delivers zero, negative and large ids unchanged
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testAddBoundaryIds0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAddBoundaryIds0001 begin');
      const custom: CustomEmitter = new CustomEmitter();
      const ids: number[] = [0, -1, 1000000];
      const received: number[] = [];
      custom.setShoppingCartGoodsList((data: emitter.EventData) => {
        received.push((data.data as Record<string, Object>)['id'] as number);
      });
      for (let i: number = 0; i < ids.length; i++) {
        custom.addGoods(ids[i]);
      }
      await delay(150);
      expect(received.length).assertEqual(ids.length);
      for (let i: number = 0; i < ids.length; i++) {
        expect(received[i]).assertEqual(ids[i]);
      }
      emitter.off(ADD_EVENT_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAddBoundaryIds0001 end');
    });

    /**
     * @tc.number SUB_CUSTOM_EMITTER_BOUNDARY_0200
     * @tc.name testOnceConsumedAfterFire0002
     * @tc.desc Verify a fired once listener is removed and does not receive the next dialog event
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testOnceConsumedAfterFire0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOnceConsumedAfterFire0002 begin');
      const custom: CustomEmitter = new CustomEmitter();
      let count: number = 0;
      custom.showEventsDialog((data: emitter.EventData) => {
        count++;
      });
      await delay(80);
      expect(count).assertEqual(1);
      const event: emitter.InnerEvent = { eventId: DIALOG_EVENT_ID };
      const payload: emitter.EventData = { data: { id: DIALOG_EVENT_ID } };
      emitter.emit(event, payload);
      await delay(80);
      expect(count).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOnceConsumedAfterFire0002 end');
    });

    /**
     * @tc.number SUB_CUSTOM_EMITTER_BOUNDARY_0300
     * @tc.name testCloseOnceConsumedAfterFire0003
     * @tc.desc Verify a fired close-once listener is removed and does not receive the next close event
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testCloseOnceConsumedAfterFire0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCloseOnceConsumedAfterFire0003 begin');
      const custom: CustomEmitter = new CustomEmitter();
      let count: number = 0;
      custom.closeEventsDialog((data: emitter.EventData) => {
        count++;
      });
      await delay(80);
      expect(count).assertEqual(1);
      const payload: emitter.EventData = { data: { id: CLOSE_DIALOG_EVENT_ID } };
      emitter.emit(CLOSE_DIALOG_EVENT_ID, payload);
      await delay(80);
      expect(count).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCloseOnceConsumedAfterFire0003 end');
    });

    /**
     * @tc.number SUB_CUSTOM_EMITTER_BOUNDARY_0400
     * @tc.name testEmptyGoodsListInitialState0004
     * @tc.desc Verify a new CustomEmitter starts with an empty shoppingCartGoodsList
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testEmptyGoodsListInitialState0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEmptyGoodsListInitialState0004 begin');
      const custom: CustomEmitter = new CustomEmitter();
      expect(custom.shoppingCartGoodsList.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEmptyGoodsListInitialState0004 end');
    });
  })
}
