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
const TAG: string = '[Sample_CustomEmitter_PayloadType]';
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

export default function customEmitterPayloadTypeTest() {
  describe('customEmitterPayloadTypeTest', () => {
    beforeEach(async () => {
      emitter.off(ADD_EVENT_ID);
      emitter.off(DELETE_EVENT_ID);
      await delay(20);
    });

    /**
     * @tc.number SUB_CUSTOM_EMITTER_PAYLOAD_0100
     * @tc.name testAddPayloadIsNumber0001
     * @tc.desc Verify addGoods payload id keeps the number type
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testAddPayloadIsNumber0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAddPayloadIsNumber0001 begin');
      const custom: CustomEmitter = new CustomEmitter();
      let type: string = '';
      let value: number = -1;
      custom.setShoppingCartGoodsList((data: emitter.EventData) => {
        const id: number = (data.data as Record<string, Object>)['id'] as number;
        type = typeof id;
        value = id;
      });
      custom.addGoods(7);
      await delay(80);
      expect(type).assertEqual('number');
      expect(value).assertEqual(7);
      emitter.off(ADD_EVENT_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAddPayloadIsNumber0001 end');
    });

    /**
     * @tc.number SUB_CUSTOM_EMITTER_PAYLOAD_0200
     * @tc.name testDeletePayloadIsNumber0002
     * @tc.desc Verify deleteGoods payload id keeps the number type
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testDeletePayloadIsNumber0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeletePayloadIsNumber0002 begin');
      const custom: CustomEmitter = new CustomEmitter();
      let type: string = '';
      custom.deleteShoppingCartGoodsList((data: emitter.EventData) => {
        const id: number = (data.data as Record<string, Object>)['id'] as number;
        type = typeof id;
      });
      custom.deleteGoods(3);
      await delay(80);
      expect(type).assertEqual('number');
      emitter.off(DELETE_EVENT_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDeletePayloadIsNumber0002 end');
    });

    /**
     * @tc.number SUB_CUSTOM_EMITTER_PAYLOAD_0300
     * @tc.name testDialogPayloadIsNumber0003
     * @tc.desc Verify dialog once payload id keeps the number type and value 1001
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testDialogPayloadIsNumber0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDialogPayloadIsNumber0003 begin');
      const custom: CustomEmitter = new CustomEmitter();
      let type: string = '';
      let value: number = -1;
      custom.showEventsDialog((data: emitter.EventData) => {
        const id: number = (data.data as Record<string, Object>)['id'] as number;
        type = typeof id;
        value = id;
      });
      await delay(80);
      expect(type).assertEqual('number');
      expect(value).assertEqual(1001);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDialogPayloadIsNumber0003 end');
    });

    /**
     * @tc.number SUB_CUSTOM_EMITTER_PAYLOAD_0400
     * @tc.name testClosePayloadIsString0004
     * @tc.desc Verify closeEventsDialog payload id keeps the string type and value '1001'
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testClosePayloadIsString0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testClosePayloadIsString0004 begin');
      const custom: CustomEmitter = new CustomEmitter();
      let type: string = '';
      let value: string = '';
      custom.closeEventsDialog((data: emitter.EventData) => {
        const id: string = (data.data as Record<string, Object>)['id'] as string;
        type = typeof id;
        value = id;
      });
      await delay(80);
      expect(type).assertEqual('string');
      expect(value).assertEqual('1001');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testClosePayloadIsString0004 end');
    });
  })
}
