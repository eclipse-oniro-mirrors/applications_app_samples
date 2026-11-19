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

import { beforeEachIt, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { tick } from '../util/TestTick';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { add } from 'hspa';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_SystemRouter]';

export default function sysRouterHspMatrixTest(): void {
  describe('SysRouterHspMatrixTest', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 util/TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });

    /**
     * @tc.number    SUB_SYSTEM_ROUTER_HSP_0001
     * @tc.name      sysRouterHspMatrix0001
     * @tc.desc      hspA 导出的 add 完成两个正数相加
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sysRouterHspMatrix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sysRouterHspMatrix0001 begin');
      const sum: number = add(1, 2);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 sum=${sum}`);
      expect(sum).assertEqual(3);
      const actual2: string = typeof sum;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('number');
      const actual3: boolean = Number.isInteger(sum);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sysRouterHspMatrix0001 end');
    })

    /**
     * @tc.number    SUB_SYSTEM_ROUTER_HSP_0002
     * @tc.name      sysRouterHspMatrix0002
     * @tc.desc      hspA 的 add 处理零与负数
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sysRouterHspMatrix0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sysRouterHspMatrix0002 begin');
      const zero: number = add(0, 0);
      const cancel: number = add(-5, 5);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 zero=${zero}`);
      expect(zero).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 cancel=${cancel}`);
      expect(cancel).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 zero=${zero}`);
      expect(zero).assertEqual(cancel);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sysRouterHspMatrix0002 end');
    })

    /**
     * @tc.number    SUB_SYSTEM_ROUTER_HSP_0003
     * @tc.name      sysRouterHspMatrix0003
     * @tc.desc      hspA 的 add 支持小数相加
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sysRouterHspMatrix0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sysRouterHspMatrix0003 begin');
      const sum: number = add(1.5, 2.5);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 sum=${sum}`);
      expect(sum).assertEqual(4);
      const actual2: boolean = Number.isInteger(sum);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: boolean = sum > 3 && sum < 5;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sysRouterHspMatrix0003 end');
    })

    /**
     * @tc.number    SUB_SYSTEM_ROUTER_HSP_0004
     * @tc.name      sysRouterHspMatrix0004
     * @tc.desc      hspA 的 add 支持大整数相加
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sysRouterHspMatrix0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sysRouterHspMatrix0004 begin');
      const sum: number = add(1000000, 1);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 sum=${sum}`);
      expect(sum).assertEqual(1000001);
      const actual2: boolean = sum > 1000000;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: string = typeof sum;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('number');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sysRouterHspMatrix0004 end');
    })

    /**
     * @tc.number    SUB_SYSTEM_ROUTER_HSP_0005
     * @tc.name      sysRouterHspMatrix0005
     * @tc.desc      hspA 的 add 满足交换律
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sysRouterHspMatrix0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sysRouterHspMatrix0005 begin');
      const forward: number = add(7, 11);
      const backward: number = add(11, 7);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 forward=${forward}`);
      expect(forward).assertEqual(backward);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 forward=${forward}`);
      expect(forward).assertEqual(18);
      const actual3: boolean = forward !== backward - 1;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sysRouterHspMatrix0005 end');
    })

    /**
     * @tc.number    SUB_SYSTEM_ROUTER_HSP_0006
     * @tc.name      sysRouterHspMatrix0006
     * @tc.desc      hspA 的 add 结果可继续参与运算
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sysRouterHspMatrix0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sysRouterHspMatrix0006 begin');
      const once: number = add(2, 3);
      const twice: number = add(once, 5);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 twice=${twice}`);
      expect(twice).assertEqual(10);
      const actual2: number = twice - once;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(5);
      const actual3: boolean = twice > once;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sysRouterHspMatrix0006 end');
    })
  })
}
