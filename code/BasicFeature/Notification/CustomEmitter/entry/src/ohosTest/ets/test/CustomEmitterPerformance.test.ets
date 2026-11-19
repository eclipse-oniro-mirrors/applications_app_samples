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
const TAG: string = '[Sample_CustomEmitter_Performance]';
const ADD_EVENT_ID: number = 1025;

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

export default function customEmitterPerformanceTest() {
  describe('customEmitterPerformanceTest', () => {
    beforeEach(async () => {
      emitter.off(ADD_EVENT_ID);
      await delay(20);
    });

    /**
     * @tc.number SUB_CUSTOM_EMITTER_PERF_0100
     * @tc.name testAddPerf100001
     * @tc.desc Verify 10 add emissions are delivered with a loose budget and small mean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAddPerf100001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAddPerf100001 begin');
      const custom: CustomEmitter = new CustomEmitter();
      let received: number = 0;
      custom.setShoppingCartGoodsList((data: emitter.EventData) => {
        received++;
      });
      const start: number = Date.now();
      for (let i: number = 0; i < 10; i++) {
        custom.addGoods(i);
      }
      const cost: number = Date.now() - start;
      await delay(300);
      const mean: number = cost / 10;
      hilog.info(DOMAIN, TAG, '%{public}s', `count=10 cost=${cost}ms mean=${mean.toFixed(3)}ms`);
      expect(received).assertEqual(10);
      expect(cost < 3000).assertTrue();
      expect(mean < 100).assertTrue();
      emitter.off(ADD_EVENT_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAddPerf100001 end');
    });

    /**
     * @tc.number SUB_CUSTOM_EMITTER_PERF_0200
     * @tc.name testAddPerf500002
     * @tc.desc Verify 50 add emissions are delivered with a loose budget and small mean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAddPerf500002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAddPerf500002 begin');
      const custom: CustomEmitter = new CustomEmitter();
      let received: number = 0;
      custom.setShoppingCartGoodsList((data: emitter.EventData) => {
        received++;
      });
      const start: number = Date.now();
      for (let i: number = 0; i < 50; i++) {
        custom.addGoods(i);
      }
      const cost: number = Date.now() - start;
      await delay(300);
      const mean: number = cost / 50;
      hilog.info(DOMAIN, TAG, '%{public}s', `count=50 cost=${cost}ms mean=${mean.toFixed(3)}ms`);
      expect(received).assertEqual(50);
      expect(cost < 8000).assertTrue();
      expect(mean < 100).assertTrue();
      emitter.off(ADD_EVENT_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAddPerf500002 end');
    });

    /**
     * @tc.number SUB_CUSTOM_EMITTER_PERF_0300
     * @tc.name testAddPerf1000003
     * @tc.desc Verify 100 add emissions are delivered with a loose budget and small mean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAddPerf1000003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAddPerf1000003 begin');
      const custom: CustomEmitter = new CustomEmitter();
      let received: number = 0;
      custom.setShoppingCartGoodsList((data: emitter.EventData) => {
        received++;
      });
      const start: number = Date.now();
      for (let i: number = 0; i < 100; i++) {
        custom.addGoods(i);
      }
      const cost: number = Date.now() - start;
      await delay(300);
      const mean: number = cost / 100;
      hilog.info(DOMAIN, TAG, '%{public}s', `count=100 cost=${cost}ms mean=${mean.toFixed(3)}ms`);
      expect(received).assertEqual(100);
      expect(cost < 15000).assertTrue();
      expect(mean < 100).assertTrue();
      emitter.off(ADD_EVENT_ID);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAddPerf1000003 end');
    });
  })
}
