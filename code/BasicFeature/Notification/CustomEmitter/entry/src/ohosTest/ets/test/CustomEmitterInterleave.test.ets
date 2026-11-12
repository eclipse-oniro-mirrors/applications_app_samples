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
const TAG: string = '[Sample_CustomEmitter_Interleave]';
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

export default function customEmitterInterleaveTest() {
  describe('customEmitterInterleaveTest', () => {
    beforeEach(async () => {
      emitter.off(ADD_EVENT_ID);
      emitter.off(DELETE_EVENT_ID);
      await delay(20);
    });

    /**
     * @tc.number SUB_CUSTOM_EMITTER_INTERLEAVE_0100
     * @tc.name testInterleavedAddDelete0001
     * @tc.desc Verify interleaved add and delete emissions keep per-channel counts and order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInterleavedAddDelete0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInterleavedAddDelete0001 begin');
      const custom: CustomEmitter = new CustomEmitter();
      const added: number[] = [];
      const deleted: number[] = [];
      custom.setShoppingCartGoodsList((data: emitter.EventData) => {
        added.push((data.data as Record<string, Object>)['id'] as number);
      });
      custom.deleteShoppingCartGoodsList((data: emitter.EventData) => {
        deleted.push((data.data as Record<string, Object>)['id'] as number);
      });
      for (let i: number = 0; i < 5; i++) {
        custom.addGoods(i);
        custom.deleteGoods(i);
      }
      await delay(200);
      expect(added.length).assertEqual(5);
      expect(deleted.length).assertEqual(5);
      for (let i: number = 0; i < 5; i++) {
        expect(added[i]).assertEqual(i);
        expect(deleted[i]).assertEqual(i);
      }
      emitter.off(ADD_EVENT_ID);
      emitter.off(DELETE_EVENT_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInterleavedAddDelete0001 end');
    });
  })
}
