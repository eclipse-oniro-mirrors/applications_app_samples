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
const TAG: string = '[Sample_CustomEmitter_Once]';
const DIALOG_EVENT_ID: number = 1001;
const CLOSE_DIALOG_EVENT_ID: string = '1001';
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

export default function customEmitterOnceSemanticsTest() {
  describe('customEmitterOnceSemanticsTest', () => {
    beforeEach(async () => {
      emitter.off(BUY_EVENT_ID);
      await delay(20);
    });

    /**
     * @tc.number SUB_CUSTOM_EMITTER_ONCE_0100
     * @tc.name testShowDialogOnce0001
     * @tc.desc Verify showEventsDialog fires the once callback exactly once with the dialog id
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testShowDialogOnce0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testShowDialogOnce0001 begin');
      const custom: CustomEmitter = new CustomEmitter();
      let count: number = 0;
      let lastId: number = -1;
      custom.showEventsDialog((data: emitter.EventData) => {
        count++;
        lastId = (data.data as Record<string, Object>)['id'] as number;
      });
      await delay(100);
      expect(count).assertEqual(1);
      expect(lastId).assertEqual(DIALOG_EVENT_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testShowDialogOnce0001 end');
    });

    /**
     * @tc.number SUB_CUSTOM_EMITTER_ONCE_0200
     * @tc.name testCloseDialogOnce0002
     * @tc.desc Verify closeEventsDialog fires the once callback exactly once with the string close id
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testCloseDialogOnce0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCloseDialogOnce0002 begin');
      const custom: CustomEmitter = new CustomEmitter();
      let count: number = 0;
      let lastId: string = '';
      custom.closeEventsDialog((data: emitter.EventData) => {
        count++;
        lastId = (data.data as Record<string, Object>)['id'] as string;
      });
      await delay(100);
      expect(count).assertEqual(1);
      expect(lastId).assertEqual(CLOSE_DIALOG_EVENT_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCloseDialogOnce0002 end');
    });

    /**
     * @tc.number SUB_CUSTOM_EMITTER_ONCE_0300
     * @tc.name testListenerCountAccumulateAndClear0003
     * @tc.desc Verify listenerEvents increases the buy listener count and clearListenerCounts resets it to zero
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testListenerCountAccumulateAndClear0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testListenerCountAccumulateAndClear0003 begin');
      const custom: CustomEmitter = new CustomEmitter();
      let base: number = -1;
      custom.clearListenerCounts((counts: number) => {
        base = counts;
      });
      expect(base).assertEqual(0);

      custom.listenerEvents();
      let afterFirst: number = -1;
      custom.getListenerCounts((counts: number) => {
        afterFirst = counts;
      });
      expect(afterFirst).assertEqual(1);

      custom.listenerEvents();
      let afterSecond: number = -1;
      custom.getListenerCounts((counts: number) => {
        afterSecond = counts;
      });
      expect(afterSecond).assertEqual(2);

      let afterClear: number = -1;
      custom.clearListenerCounts((counts: number) => {
        afterClear = counts;
      });
      expect(afterClear).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testListenerCountAccumulateAndClear0003 end');
    });

    /**
     * @tc.number SUB_CUSTOM_EMITTER_ONCE_0400
     * @tc.name testClearTwiceIdempotent0004
     * @tc.desc Verify clearing the buy listeners repeatedly keeps the count at zero
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testClearTwiceIdempotent0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testClearTwiceIdempotent0004 begin');
      const custom: CustomEmitter = new CustomEmitter();
      custom.listenerEvents();
      let first: number = -1;
      custom.clearListenerCounts((counts: number) => {
        first = counts;
      });
      expect(first).assertEqual(0);
      let second: number = -1;
      custom.clearListenerCounts((counts: number) => {
        second = counts;
      });
      expect(second).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testClearTwiceIdempotent0004 end');
    });
  })
}
