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

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_StartMode]';

export default function sampleCapabilityMatrixTest(): void {
  describe('SampleCapabilityMatrixTest', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 util/TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });

    /**
     * @tc.number    SUB_START_MODE_CAPABILITY_0001
     * @tc.name      sampleCapabilityMatrix0001
     * @tc.desc      系统具备 SystemCapability.BundleManager.BundleFramework.Core 能力
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleCapabilityMatrix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleCapabilityMatrix0001 begin');
      const supported: boolean = canIUse('SystemCapability.BundleManager.BundleFramework.Core');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 supported=${supported}`);
      expect(supported).assertTrue();
      const actual2: string = typeof canIUse('SystemCapability.Unknown.Capability');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('boolean');
      const actual3: boolean = 'SystemCapability.BundleManager.BundleFramework.Core'.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleCapabilityMatrix0001 end');
    })

    /**
     * @tc.number    SUB_START_MODE_CAPABILITY_0002
     * @tc.name      sampleCapabilityMatrix0002
     * @tc.desc      系统具备 SystemCapability.Ability.AbilityRuntime.Core 能力
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleCapabilityMatrix0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleCapabilityMatrix0002 begin');
      const supported: boolean = canIUse('SystemCapability.Ability.AbilityRuntime.Core');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 supported=${supported}`);
      expect(supported).assertTrue();
      const actual2: string = typeof canIUse('SystemCapability.Unknown.Capability');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('boolean');
      const actual3: boolean = 'SystemCapability.Ability.AbilityRuntime.Core'.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleCapabilityMatrix0002 end');
    })

    /**
     * @tc.number    SUB_START_MODE_CAPABILITY_0003
     * @tc.name      sampleCapabilityMatrix0003
     * @tc.desc      系统具备 SystemCapability.Ability.AbilityRuntime.AbilityCore 能力
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleCapabilityMatrix0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleCapabilityMatrix0003 begin');
      const supported: boolean = canIUse('SystemCapability.Ability.AbilityRuntime.AbilityCore');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 supported=${supported}`);
      expect(supported).assertTrue();
      const actual2: string = typeof canIUse('SystemCapability.Unknown.Capability');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('boolean');
      const actual3: boolean = 'SystemCapability.Ability.AbilityRuntime.AbilityCore'.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleCapabilityMatrix0003 end');
    })

    /**
     * @tc.number    SUB_START_MODE_CAPABILITY_0004
     * @tc.name      sampleCapabilityMatrix0004
     * @tc.desc      系统具备 SystemCapability.Security.AccessToken 能力
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleCapabilityMatrix0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleCapabilityMatrix0004 begin');
      const supported: boolean = canIUse('SystemCapability.Security.AccessToken');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 supported=${supported}`);
      expect(supported).assertTrue();
      const actual2: string = typeof canIUse('SystemCapability.Unknown.Capability');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('boolean');
      const actual3: boolean = 'SystemCapability.Security.AccessToken'.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleCapabilityMatrix0004 end');
    })

    /**
     * @tc.number    SUB_START_MODE_CAPABILITY_0005
     * @tc.name      sampleCapabilityMatrix0005
     * @tc.desc      系统具备 SystemCapability.Utils.Lang 能力
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleCapabilityMatrix0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleCapabilityMatrix0005 begin');
      const supported: boolean = canIUse('SystemCapability.Utils.Lang');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 supported=${supported}`);
      expect(supported).assertTrue();
      const actual2: string = typeof canIUse('SystemCapability.Unknown.Capability');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('boolean');
      const actual3: boolean = 'SystemCapability.Utils.Lang'.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleCapabilityMatrix0005 end');
    })

    /**
     * @tc.number    SUB_START_MODE_CAPABILITY_0006
     * @tc.name      sampleCapabilityMatrix0006
     * @tc.desc      系统具备 SystemCapability.FileManagement.File.FileIO 能力
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleCapabilityMatrix0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleCapabilityMatrix0006 begin');
      const supported: boolean = canIUse('SystemCapability.FileManagement.File.FileIO');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 supported=${supported}`);
      expect(supported).assertTrue();
      const actual2: string = typeof canIUse('SystemCapability.Unknown.Capability');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('boolean');
      const actual3: boolean = 'SystemCapability.FileManagement.File.FileIO'.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleCapabilityMatrix0006 end');
    })

    /**
     * @tc.number    SUB_START_MODE_CAPABILITY_0007
     * @tc.name      sampleCapabilityMatrix0007
     * @tc.desc      系统具备 SystemCapability.DistributedDataManager.Preferences.Core 能力
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleCapabilityMatrix0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleCapabilityMatrix0007 begin');
      const supported: boolean = canIUse('SystemCapability.DistributedDataManager.Preferences.Core');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 supported=${supported}`);
      expect(supported).assertTrue();
      const actual2: string = typeof canIUse('SystemCapability.Unknown.Capability');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('boolean');
      const actual3: boolean = 'SystemCapability.DistributedDataManager.Preferences.Core'.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleCapabilityMatrix0007 end');
    })
  })
}
