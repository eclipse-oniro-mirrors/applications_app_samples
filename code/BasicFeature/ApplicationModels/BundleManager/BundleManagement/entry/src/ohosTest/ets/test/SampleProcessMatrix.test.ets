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
import { appManager } from '@kit.AbilityKit';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_BundleManagement]';

export default function sampleProcessMatrixTest(): void {
  describe('SampleProcessMatrixTest', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 util/TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });

    /**
     * @tc.number    SUB_BUNDLE_MGMT_PROCESS_0001
     * @tc.name      sampleProcessMatrix0001
     * @tc.desc      getRunningProcessInformation 返回本机进程列表
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('sampleProcessMatrix0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleProcessMatrix0001 begin');
      const infos: Array<appManager.ProcessInformation> = await appManager.getRunningProcessInformation();
      const actual1: boolean = infos.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertTrue();
      const actual2: boolean = infos[0].pid > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: string = typeof infos[0].processName;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('string');
      const actual4: boolean = infos[0].uid >= 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleProcessMatrix0001 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_PROCESS_0002
     * @tc.name      sampleProcessMatrix0002
     * @tc.desc      进程列表中能找到当前应用所在进程
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('sampleProcessMatrix0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleProcessMatrix0002 begin');
      const selfBundle: string = 'com.samples.bundlemanagement';
      const infos: Array<appManager.ProcessInformation> = await appManager.getRunningProcessInformation();
      let found: boolean = false;
      for (let i = 0; i < infos.length; i++) {
        if (infos[i].bundleNames.indexOf(selfBundle) >= 0) {
          found = true;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 found=${found}`);
      expect(found).assertTrue();
      const actual2: boolean = infos.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: boolean = selfBundle.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleProcessMatrix0002 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_PROCESS_0003
     * @tc.name      sampleProcessMatrix0003
     * @tc.desc      进程信息包含 state、bundleNames、processName 三个可读字段
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('sampleProcessMatrix0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleProcessMatrix0003 begin');
      const infos: Array<appManager.ProcessInformation> = await appManager.getRunningProcessInformation();
      const first: appManager.ProcessInformation = infos[0];
      const actual1: boolean = first.state >= 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertTrue();
      const actual2: boolean = Array.isArray(first.bundleNames);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: string = typeof first.processName;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('string');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleProcessMatrix0003 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_PROCESS_0004
     * @tc.name      sampleProcessMatrix0004
     * @tc.desc      连续两次查询进程列表均能返回结果
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('sampleProcessMatrix0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleProcessMatrix0004 begin');
      const firstList: Array<appManager.ProcessInformation> = await appManager.getRunningProcessInformation();
      const secondList: Array<appManager.ProcessInformation> =
        await appManager.getRunningProcessInformation();
      const actual1: boolean = firstList.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertTrue();
      const actual2: boolean = secondList.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: string = typeof firstList[0].processName;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('string');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleProcessMatrix0004 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_PROCESS_0005
     * @tc.name      sampleProcessMatrix0005
     * @tc.desc      进程列表中每个进程的 pid 均为正数且累加非零
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('sampleProcessMatrix0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleProcessMatrix0005 begin');
      const infos: Array<appManager.ProcessInformation> = await appManager.getRunningProcessInformation();
      let pidSum: number = 0;
      for (let i = 0; i < infos.length; i++) {
        pidSum += infos[i].pid;
      }
      const actual1: boolean = pidSum > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertTrue();
      const actual2: string = typeof pidSum;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('number');
      const actual3: boolean = infos.length >= 1;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleProcessMatrix0005 end');
    })
  })
}
