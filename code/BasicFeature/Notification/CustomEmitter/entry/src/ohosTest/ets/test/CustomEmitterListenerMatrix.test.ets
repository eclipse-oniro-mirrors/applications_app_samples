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
const TAG: string = '[Sample_CustomEmitter_ListenerMatrix]';
const BUY_EVENT_ID: string = 'buy';

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

export default function customEmitterListenerMatrixTest() {
  describe('customEmitterListenerMatrixTest', () => {
    beforeEach(async () => {
      emitter.off(BUY_EVENT_ID);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(() => {
          resolve();
        }, 10);
      });
    });

    /**
     * @tc.number SUB_CUSTOM_EMITTER_LISTENERMATRIX_0100
     * @tc.name testListenerCountOne0001
     * @tc.desc Verify one buy subscription reports a count of one and clears to zero
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testListenerCountOne0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testListenerCountOne0001 begin');
      const custom: CustomEmitter = new CustomEmitter();
      custom.clearListenerCounts((counts: number) => {
        expect(counts).assertEqual(0);
      });
      custom.listenerEvents();
      let actual: number = -1;
      custom.getListenerCounts((counts: number) => {
        actual = counts;
      });
      expect(actual).assertEqual(1);
      custom.clearListenerCounts((counts: number) => {
        expect(counts).assertEqual(0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'testListenerCountOne0001 end');
    });

    /**
     * @tc.number SUB_CUSTOM_EMITTER_LISTENERMATRIX_0200
     * @tc.name testListenerCountTwo0002
     * @tc.desc Verify two buy subscriptions report a count of two and clear to zero
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testListenerCountTwo0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testListenerCountTwo0002 begin');
      const custom: CustomEmitter = new CustomEmitter();
      custom.clearListenerCounts((counts: number) => {
        expect(counts).assertEqual(0);
      });
      custom.listenerEvents();
      custom.listenerEvents();
      let actual: number = -1;
      custom.getListenerCounts((counts: number) => {
        actual = counts;
      });
      expect(actual).assertEqual(2);
      custom.clearListenerCounts((counts: number) => {
        expect(counts).assertEqual(0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'testListenerCountTwo0002 end');
    });

    /**
     * @tc.number SUB_CUSTOM_EMITTER_LISTENERMATRIX_0300
     * @tc.name testListenerCountThree0003
     * @tc.desc Verify three buy subscriptions report a count of three and clear to zero
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testListenerCountThree0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testListenerCountThree0003 begin');
      const custom: CustomEmitter = new CustomEmitter();
      custom.clearListenerCounts((counts: number) => {
        expect(counts).assertEqual(0);
      });
      custom.listenerEvents();
      custom.listenerEvents();
      custom.listenerEvents();
      let actual: number = -1;
      custom.getListenerCounts((counts: number) => {
        actual = counts;
      });
      expect(actual).assertEqual(3);
      custom.clearListenerCounts((counts: number) => {
        expect(counts).assertEqual(0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'testListenerCountThree0003 end');
    });

    /**
     * @tc.number SUB_CUSTOM_EMITTER_LISTENERMATRIX_0400
     * @tc.name testListenerCountFive0004
     * @tc.desc Verify five buy subscriptions report a count of five and clear to zero
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testListenerCountFive0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testListenerCountFive0004 begin');
      const custom: CustomEmitter = new CustomEmitter();
      custom.clearListenerCounts((counts: number) => {
        expect(counts).assertEqual(0);
      });
      custom.listenerEvents();
      custom.listenerEvents();
      custom.listenerEvents();
      custom.listenerEvents();
      custom.listenerEvents();
      let actual: number = -1;
      custom.getListenerCounts((counts: number) => {
        actual = counts;
      });
      expect(actual).assertEqual(5);
      custom.clearListenerCounts((counts: number) => {
        expect(counts).assertEqual(0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'testListenerCountFive0004 end');
    });
  })
}
