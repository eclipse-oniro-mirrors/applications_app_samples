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

import { describe, beforeEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { add, multiply } from '../../../main/ets/common/Math';
import { UserService } from '../../../main/ets/common/Service';
import { buildUrl } from '../../../main/ets/pages/ModuleSystem';
import { canRead, getProfileName } from '../../../main/ets/pages/SharedTypesUsage';
import { UserIdentity } from '../../../main/ets/common/Types';

const DOMAIN: number = 0xF815;
const TAG: string = '[Sample_ARKTS_GUIDE_EXT]';

export default function AflgPerfPart1Test(): void {
  describe('AflgPerfPart1', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 20);
      });
    })


    /**
     * @tc.number    SUB_ARKTS_GUIDE_PERFP1_0100
     * @tc.name      testAddPerf0001
     * @tc.desc      Verify 100k add calls stay within budget.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testAddPerf0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAddPerf0001 begin');
      const start: number = Date.now();
      for (let i: number = 0; i < 100000; i++) {
        add(i, i + 1);
      }
      expect(Date.now() - start < 15000).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAddPerf0001 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PERFP1_0200
     * @tc.name      testMultiplyPerf0002
     * @tc.desc      Verify 100k multiply calls stay within budget.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMultiplyPerf0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMultiplyPerf0002 begin');
      const start: number = Date.now();
      for (let i: number = 0; i < 100000; i++) {
        multiply(i, 2);
      }
      expect(Date.now() - start < 15000).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMultiplyPerf0002 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PERFP1_0300
     * @tc.name      testFindPerf0003
     * @tc.desc      Verify 100k findById calls stay within budget.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFindPerf0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFindPerf0003 begin');
      const service: UserService = new UserService();
      const start: number = Date.now();
      for (let i: number = 0; i < 100000; i++) {
        service.findById(i);
      }
      expect(Date.now() - start < 15000).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFindPerf0003 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PERFP1_0400
     * @tc.name      testProfilePerf0004
     * @tc.desc      Verify 100k getProfileName calls stay within budget.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testProfilePerf0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfilePerf0004 begin');
      const identity: UserIdentity = { id: 1 };
      const start: number = Date.now();
      for (let i: number = 0; i < 100000; i++) {
        getProfileName(identity);
      }
      expect(Date.now() - start < 15000).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfilePerf0004 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PERFP1_0500
     * @tc.name      testBuildUrlPerf0005
     * @tc.desc      Verify 100k buildUrl calls stay within budget.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBuildUrlPerf0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlPerf0005 begin');
      const start: number = Date.now();
      for (let i: number = 0; i < 100000; i++) {
        buildUrl('https://host', '/path');
      }
      expect(Date.now() - start < 15000).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildUrlPerf0005 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PERFP1_0600
     * @tc.name      testCanReadPerf0006
     * @tc.desc      Verify 100k canRead calls stay within budget.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCanReadPerf0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanReadPerf0006 begin');
      const identity: UserIdentity = { id: 1 };
      const start: number = Date.now();
      for (let i: number = 0; i < 100000; i++) {
        canRead(identity);
      }
      expect(Date.now() - start < 15000).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanReadPerf0006 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PERFP1_0700
     * @tc.name      testCombinedPerf0007
     * @tc.desc      Verify mixed 50k pipeline stays within budget.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCombinedPerf0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCombinedPerf0007 begin');
      const service: UserService = new UserService();
      const start: number = Date.now();
      for (let i: number = 0; i < 50000; i++) {
        const user = service.findById(1);
        if (user !== null) {
          getProfileName({ id: user.id });
        }
      }
      expect(Date.now() - start < 15000).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCombinedPerf0007 end');
    })

  })
}
