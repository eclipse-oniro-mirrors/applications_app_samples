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

import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { NativeSoloistFixture } from '../util/NativeSoloistFixture';
import XComponentContext from '../../../main/ets/interface/XComponentContext';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_DisplaySoloist]';

export default function soloNativeSmokeTest(): void {
  describe('SoloNativeSmokeTest', () => {
    /**
     * @tc.number    SOLO_NATIVE_0001
     * @tc.name      solo_native_normal_lifecycle
     * @tc.desc      真实 XComponent 经 NAPI 创建普通线程句柄、停止并销毁，销毁后句柄不可达
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('solo_native_normal_lifecycle', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'solo_native_normal_lifecycle begin');
      const context: XComponentContext = await NativeSoloistFixture.waitForContext(false);
      try {
        const registered: number = context.register();
        hilog.info(DOMAIN, TAG, 'register=%{public}d', registered);
        expect(registered).assertEqual(0);
        await new Promise<void>((resolve) => setTimeout(resolve, 150));
        const stopped: number = context.unregister();
        hilog.info(DOMAIN, TAG, 'unregister=%{public}d', stopped);
        expect(stopped).assertEqual(0);
        const destroyed: number = context.destroy();
        hilog.info(DOMAIN, TAG, 'destroy=%{public}d', destroyed);
        expect(destroyed).assertEqual(0);
        const absent: number = context.unregister();
        hilog.info(DOMAIN, TAG, 'afterDestroy=%{public}d', absent);
        expect(absent).assertEqual(-1);
      } finally {
        context.unregister();
        context.destroy();
        hilog.info(DOMAIN, TAG, '%{public}s', 'solo_native_normal_lifecycle end');
      }
    });

    /**
     * @tc.number    SOLO_NATIVE_0002
     * @tc.name      solo_native_exclusive_recreate
     * @tc.desc      独占线程真实句柄销毁后可重新创建，两轮均验证 native 状态并释放
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('solo_native_exclusive_recreate', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'solo_native_exclusive_recreate begin');
      const context: XComponentContext = await NativeSoloistFixture.waitForContext(true);
      try {
        for (let round: number = 0; round < 2; round++) {
          const registered: number = context.register();
          hilog.info(DOMAIN, TAG, 'round=%{public}d register=%{public}d', round, registered);
          expect(registered).assertEqual(0);
          await new Promise<void>((resolve) => setTimeout(resolve, 150));
          const stopped: number = context.unregister();
          hilog.info(DOMAIN, TAG, 'unregister=%{public}d', stopped);
          expect(stopped).assertEqual(0);
          const destroyed: number = context.destroy();
          hilog.info(DOMAIN, TAG, 'destroy=%{public}d', destroyed);
          expect(destroyed).assertEqual(0);
          const absent: number = context.destroy();
          hilog.info(DOMAIN, TAG, 'secondDestroy=%{public}d', absent);
          expect(absent).assertEqual(-1);
        }
      } finally {
        context.unregister();
        context.destroy();
        hilog.info(DOMAIN, TAG, '%{public}s', 'solo_native_exclusive_recreate end');
      }
    });
  });
}
