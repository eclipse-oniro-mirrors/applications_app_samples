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
import { canRead, getProfileName } from '../../../main/ets/pages/SharedTypesUsage';
import { UserIdentity } from '../../../main/ets/common/Types';

const DOMAIN: number = 0xF815;
const TAG: string = '[Sample_ARKTS_GUIDE_EXT]';

export default function SharedTypesBoundaryPart1Test(): void {
  describe('SharedTypesBoundaryPart1', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 20);
      });
    })


    /**
     * @tc.number    SUB_ARKTS_GUIDE_SHBOUNDP1_0100
     * @tc.name      testSharedBoundary0001
     * @tc.desc      Verify shared type boundary id -500.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSharedBoundary0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0001 begin');
      const identity: UserIdentity = { id: -500 };
      expect(getProfileName(identity)).assertEqual('user--500');
      expect(canRead(identity)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0001 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_SHBOUNDP1_0200
     * @tc.name      testSharedBoundary0002
     * @tc.desc      Verify shared type boundary id -501.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSharedBoundary0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0002 begin');
      const identity: UserIdentity = { id: -501 };
      expect(getProfileName(identity)).assertEqual('user--501');
      expect(canRead(identity)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0002 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_SHBOUNDP1_0300
     * @tc.name      testSharedBoundary0003
     * @tc.desc      Verify shared type boundary id -502.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSharedBoundary0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0003 begin');
      const identity: UserIdentity = { id: -502 };
      expect(getProfileName(identity)).assertEqual('user--502');
      expect(canRead(identity)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0003 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_SHBOUNDP1_0400
     * @tc.name      testSharedBoundary0004
     * @tc.desc      Verify shared type boundary id -503.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSharedBoundary0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0004 begin');
      const identity: UserIdentity = { id: -503 };
      expect(getProfileName(identity)).assertEqual('user--503');
      expect(canRead(identity)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0004 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_SHBOUNDP1_0500
     * @tc.name      testSharedBoundary0005
     * @tc.desc      Verify shared type boundary id -504.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSharedBoundary0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0005 begin');
      const identity: UserIdentity = { id: -504 };
      expect(getProfileName(identity)).assertEqual('user--504');
      expect(canRead(identity)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0005 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_SHBOUNDP1_0600
     * @tc.name      testSharedBoundary0006
     * @tc.desc      Verify shared type boundary id -505.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSharedBoundary0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0006 begin');
      const identity: UserIdentity = { id: -505 };
      expect(getProfileName(identity)).assertEqual('user--505');
      expect(canRead(identity)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0006 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_SHBOUNDP1_0700
     * @tc.name      testSharedBoundary0007
     * @tc.desc      Verify shared type boundary id -506.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSharedBoundary0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0007 begin');
      const identity: UserIdentity = { id: -506 };
      expect(getProfileName(identity)).assertEqual('user--506');
      expect(canRead(identity)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0007 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_SHBOUNDP1_0800
     * @tc.name      testSharedBoundary0008
     * @tc.desc      Verify shared type boundary id -507.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSharedBoundary0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0008 begin');
      const identity: UserIdentity = { id: -507 };
      expect(getProfileName(identity)).assertEqual('user--507');
      expect(canRead(identity)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0008 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_SHBOUNDP1_0900
     * @tc.name      testSharedBoundary0009
     * @tc.desc      Verify shared type boundary id -508.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSharedBoundary0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0009 begin');
      const identity: UserIdentity = { id: -508 };
      expect(getProfileName(identity)).assertEqual('user--508');
      expect(canRead(identity)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0009 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_SHBOUNDP1_1000
     * @tc.name      testSharedBoundary0010
     * @tc.desc      Verify shared type boundary id -509.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSharedBoundary0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0010 begin');
      const identity: UserIdentity = { id: -509 };
      expect(getProfileName(identity)).assertEqual('user--509');
      expect(canRead(identity)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0010 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_SHBOUNDP1_1100
     * @tc.name      testSharedBoundary0011
     * @tc.desc      Verify shared type boundary id -510.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSharedBoundary0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0011 begin');
      const identity: UserIdentity = { id: -510 };
      expect(getProfileName(identity)).assertEqual('user--510');
      expect(canRead(identity)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0011 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_SHBOUNDP1_1200
     * @tc.name      testSharedBoundary0012
     * @tc.desc      Verify shared type boundary id -511.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSharedBoundary0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0012 begin');
      const identity: UserIdentity = { id: -511 };
      expect(getProfileName(identity)).assertEqual('user--511');
      expect(canRead(identity)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0012 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_SHBOUNDP1_1300
     * @tc.name      testSharedBoundary0013
     * @tc.desc      Verify shared type boundary id -512.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSharedBoundary0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0013 begin');
      const identity: UserIdentity = { id: -512 };
      expect(getProfileName(identity)).assertEqual('user--512');
      expect(canRead(identity)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0013 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_SHBOUNDP1_1400
     * @tc.name      testSharedBoundary0014
     * @tc.desc      Verify shared type boundary id -513.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSharedBoundary0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0014 begin');
      const identity: UserIdentity = { id: -513 };
      expect(getProfileName(identity)).assertEqual('user--513');
      expect(canRead(identity)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0014 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_SHBOUNDP1_1500
     * @tc.name      testSharedBoundary0015
     * @tc.desc      Verify shared type boundary id -514.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSharedBoundary0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0015 begin');
      const identity: UserIdentity = { id: -514 };
      expect(getProfileName(identity)).assertEqual('user--514');
      expect(canRead(identity)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0015 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_SHBOUNDP1_1600
     * @tc.name      testSharedBoundary0016
     * @tc.desc      Verify shared type boundary id -515.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSharedBoundary0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0016 begin');
      const identity: UserIdentity = { id: -515 };
      expect(getProfileName(identity)).assertEqual('user--515');
      expect(canRead(identity)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0016 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_SHBOUNDP1_1700
     * @tc.name      testSharedBoundary0017
     * @tc.desc      Verify shared type boundary id -516.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSharedBoundary0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0017 begin');
      const identity: UserIdentity = { id: -516 };
      expect(getProfileName(identity)).assertEqual('user--516');
      expect(canRead(identity)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0017 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_SHBOUNDP1_1800
     * @tc.name      testSharedBoundary0018
     * @tc.desc      Verify shared type boundary id -517.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSharedBoundary0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0018 begin');
      const identity: UserIdentity = { id: -517 };
      expect(getProfileName(identity)).assertEqual('user--517');
      expect(canRead(identity)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0018 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_SHBOUNDP1_1900
     * @tc.name      testSharedBoundary0019
     * @tc.desc      Verify shared type boundary id -518.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSharedBoundary0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0019 begin');
      const identity: UserIdentity = { id: -518 };
      expect(getProfileName(identity)).assertEqual('user--518');
      expect(canRead(identity)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0019 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_SHBOUNDP1_2000
     * @tc.name      testSharedBoundary0020
     * @tc.desc      Verify shared type boundary id -519.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSharedBoundary0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0020 begin');
      const identity: UserIdentity = { id: -519 };
      expect(getProfileName(identity)).assertEqual('user--519');
      expect(canRead(identity)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0020 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_SHBOUNDP1_2100
     * @tc.name      testSharedBoundary0021
     * @tc.desc      Verify shared type boundary id -520.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSharedBoundary0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0021 begin');
      const identity: UserIdentity = { id: -520 };
      expect(getProfileName(identity)).assertEqual('user--520');
      expect(canRead(identity)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0021 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_SHBOUNDP1_2200
     * @tc.name      testSharedBoundary0022
     * @tc.desc      Verify shared type boundary id -521.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSharedBoundary0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0022 begin');
      const identity: UserIdentity = { id: -521 };
      expect(getProfileName(identity)).assertEqual('user--521');
      expect(canRead(identity)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0022 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_SHBOUNDP1_2300
     * @tc.name      testSharedBoundary0023
     * @tc.desc      Verify shared type boundary id -522.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSharedBoundary0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0023 begin');
      const identity: UserIdentity = { id: -522 };
      expect(getProfileName(identity)).assertEqual('user--522');
      expect(canRead(identity)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0023 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_SHBOUNDP1_2400
     * @tc.name      testSharedBoundary0024
     * @tc.desc      Verify shared type boundary id -523.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSharedBoundary0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0024 begin');
      const identity: UserIdentity = { id: -523 };
      expect(getProfileName(identity)).assertEqual('user--523');
      expect(canRead(identity)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0024 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_SHBOUNDP1_2500
     * @tc.name      testSharedBoundary0025
     * @tc.desc      Verify shared type boundary id -524.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSharedBoundary0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0025 begin');
      const identity: UserIdentity = { id: -524 };
      expect(getProfileName(identity)).assertEqual('user--524');
      expect(canRead(identity)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0025 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_SHBOUNDP1_2600
     * @tc.name      testSharedBoundary0026
     * @tc.desc      Verify shared type boundary id -525.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSharedBoundary0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0026 begin');
      const identity: UserIdentity = { id: -525 };
      expect(getProfileName(identity)).assertEqual('user--525');
      expect(canRead(identity)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0026 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_SHBOUNDP1_2700
     * @tc.name      testSharedBoundary0027
     * @tc.desc      Verify shared type boundary id -526.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSharedBoundary0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0027 begin');
      const identity: UserIdentity = { id: -526 };
      expect(getProfileName(identity)).assertEqual('user--526');
      expect(canRead(identity)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0027 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_SHBOUNDP1_2800
     * @tc.name      testSharedBoundary0028
     * @tc.desc      Verify shared type boundary id -527.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSharedBoundary0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0028 begin');
      const identity: UserIdentity = { id: -527 };
      expect(getProfileName(identity)).assertEqual('user--527');
      expect(canRead(identity)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0028 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_SHBOUNDP1_2900
     * @tc.name      testSharedBoundary0029
     * @tc.desc      Verify shared type boundary id -528.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSharedBoundary0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0029 begin');
      const identity: UserIdentity = { id: -528 };
      expect(getProfileName(identity)).assertEqual('user--528');
      expect(canRead(identity)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0029 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_SHBOUNDP1_3000
     * @tc.name      testSharedBoundary0030
     * @tc.desc      Verify shared type boundary id -529.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSharedBoundary0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0030 begin');
      const identity: UserIdentity = { id: -529 };
      expect(getProfileName(identity)).assertEqual('user--529');
      expect(canRead(identity)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0030 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_SHBOUNDP1_3100
     * @tc.name      testSharedBoundary0031
     * @tc.desc      Verify shared type boundary id -530.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSharedBoundary0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0031 begin');
      const identity: UserIdentity = { id: -530 };
      expect(getProfileName(identity)).assertEqual('user--530');
      expect(canRead(identity)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0031 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_SHBOUNDP1_3200
     * @tc.name      testSharedBoundary0032
     * @tc.desc      Verify shared type boundary id -531.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSharedBoundary0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0032 begin');
      const identity: UserIdentity = { id: -531 };
      expect(getProfileName(identity)).assertEqual('user--531');
      expect(canRead(identity)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0032 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_SHBOUNDP1_3300
     * @tc.name      testSharedBoundary0033
     * @tc.desc      Verify shared type boundary id -532.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSharedBoundary0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0033 begin');
      const identity: UserIdentity = { id: -532 };
      expect(getProfileName(identity)).assertEqual('user--532');
      expect(canRead(identity)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0033 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_SHBOUNDP1_3400
     * @tc.name      testSharedBoundary0034
     * @tc.desc      Verify shared type boundary id -533.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSharedBoundary0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0034 begin');
      const identity: UserIdentity = { id: -533 };
      expect(getProfileName(identity)).assertEqual('user--533');
      expect(canRead(identity)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0034 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_SHBOUNDP1_3500
     * @tc.name      testSharedBoundary0035
     * @tc.desc      Verify shared type boundary id -534.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSharedBoundary0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0035 begin');
      const identity: UserIdentity = { id: -534 };
      expect(getProfileName(identity)).assertEqual('user--534');
      expect(canRead(identity)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0035 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_SHBOUNDP1_3600
     * @tc.name      testSharedBoundary0036
     * @tc.desc      Verify shared type boundary id -535.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSharedBoundary0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0036 begin');
      const identity: UserIdentity = { id: -535 };
      expect(getProfileName(identity)).assertEqual('user--535');
      expect(canRead(identity)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0036 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_SHBOUNDP1_3700
     * @tc.name      testSharedBoundary0037
     * @tc.desc      Verify shared type boundary id -536.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSharedBoundary0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0037 begin');
      const identity: UserIdentity = { id: -536 };
      expect(getProfileName(identity)).assertEqual('user--536');
      expect(canRead(identity)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0037 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_SHBOUNDP1_3800
     * @tc.name      testSharedBoundary0038
     * @tc.desc      Verify shared type boundary id -537.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSharedBoundary0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0038 begin');
      const identity: UserIdentity = { id: -537 };
      expect(getProfileName(identity)).assertEqual('user--537');
      expect(canRead(identity)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0038 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_SHBOUNDP1_3900
     * @tc.name      testSharedBoundary0039
     * @tc.desc      Verify shared type boundary id -538.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSharedBoundary0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0039 begin');
      const identity: UserIdentity = { id: -538 };
      expect(getProfileName(identity)).assertEqual('user--538');
      expect(canRead(identity)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0039 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_SHBOUNDP1_4000
     * @tc.name      testSharedBoundary0040
     * @tc.desc      Verify shared type boundary id -539.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSharedBoundary0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0040 begin');
      const identity: UserIdentity = { id: -539 };
      expect(getProfileName(identity)).assertEqual('user--539');
      expect(canRead(identity)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0040 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_SHBOUNDP1_4100
     * @tc.name      testSharedBoundary0041
     * @tc.desc      Verify shared type boundary id -540.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSharedBoundary0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0041 begin');
      const identity: UserIdentity = { id: -540 };
      expect(getProfileName(identity)).assertEqual('user--540');
      expect(canRead(identity)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0041 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_SHBOUNDP1_4200
     * @tc.name      testSharedBoundary0042
     * @tc.desc      Verify shared type boundary id -541.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSharedBoundary0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0042 begin');
      const identity: UserIdentity = { id: -541 };
      expect(getProfileName(identity)).assertEqual('user--541');
      expect(canRead(identity)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0042 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_SHBOUNDP1_4300
     * @tc.name      testSharedBoundary0043
     * @tc.desc      Verify shared type boundary id -542.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSharedBoundary0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0043 begin');
      const identity: UserIdentity = { id: -542 };
      expect(getProfileName(identity)).assertEqual('user--542');
      expect(canRead(identity)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0043 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_SHBOUNDP1_4400
     * @tc.name      testSharedBoundary0044
     * @tc.desc      Verify shared type boundary id -543.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSharedBoundary0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0044 begin');
      const identity: UserIdentity = { id: -543 };
      expect(getProfileName(identity)).assertEqual('user--543');
      expect(canRead(identity)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0044 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_SHBOUNDP1_4500
     * @tc.name      testSharedBoundary0045
     * @tc.desc      Verify shared type boundary id -544.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSharedBoundary0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0045 begin');
      const identity: UserIdentity = { id: -544 };
      expect(getProfileName(identity)).assertEqual('user--544');
      expect(canRead(identity)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0045 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_SHBOUNDP1_4600
     * @tc.name      testSharedBoundary0046
     * @tc.desc      Verify shared type boundary id -545.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSharedBoundary0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0046 begin');
      const identity: UserIdentity = { id: -545 };
      expect(getProfileName(identity)).assertEqual('user--545');
      expect(canRead(identity)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0046 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_SHBOUNDP1_4700
     * @tc.name      testSharedBoundary0047
     * @tc.desc      Verify shared type boundary id -546.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSharedBoundary0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0047 begin');
      const identity: UserIdentity = { id: -546 };
      expect(getProfileName(identity)).assertEqual('user--546');
      expect(canRead(identity)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0047 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_SHBOUNDP1_4800
     * @tc.name      testSharedBoundary0048
     * @tc.desc      Verify shared type boundary id -547.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSharedBoundary0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0048 begin');
      const identity: UserIdentity = { id: -547 };
      expect(getProfileName(identity)).assertEqual('user--547');
      expect(canRead(identity)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0048 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_SHBOUNDP1_4900
     * @tc.name      testSharedBoundary0049
     * @tc.desc      Verify shared type boundary id -548.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSharedBoundary0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0049 begin');
      const identity: UserIdentity = { id: -548 };
      expect(getProfileName(identity)).assertEqual('user--548');
      expect(canRead(identity)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0049 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_SHBOUNDP1_5000
     * @tc.name      testSharedBoundary0050
     * @tc.desc      Verify shared type boundary id -549.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSharedBoundary0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0050 begin');
      const identity: UserIdentity = { id: -549 };
      expect(getProfileName(identity)).assertEqual('user--549');
      expect(canRead(identity)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0050 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_SHBOUNDP1_5100
     * @tc.name      testSharedBoundary0051
     * @tc.desc      Verify shared type boundary id 121.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSharedBoundary0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0051 begin');
      const identity: UserIdentity = { id: 121 };
      expect(getProfileName(identity)).assertEqual('user-121');
      expect(canRead(identity)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0051 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_SHBOUNDP1_5200
     * @tc.name      testSharedBoundary0052
     * @tc.desc      Verify shared type boundary id 122.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSharedBoundary0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0052 begin');
      const identity: UserIdentity = { id: 122 };
      expect(getProfileName(identity)).assertEqual('user-122');
      expect(canRead(identity)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0052 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_SHBOUNDP1_5300
     * @tc.name      testSharedBoundary0053
     * @tc.desc      Verify shared type boundary id 123.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSharedBoundary0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0053 begin');
      const identity: UserIdentity = { id: 123 };
      expect(getProfileName(identity)).assertEqual('user-123');
      expect(canRead(identity)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0053 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_SHBOUNDP1_5400
     * @tc.name      testSharedBoundary0054
     * @tc.desc      Verify shared type boundary id 124.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSharedBoundary0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0054 begin');
      const identity: UserIdentity = { id: 124 };
      expect(getProfileName(identity)).assertEqual('user-124');
      expect(canRead(identity)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0054 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_SHBOUNDP1_5500
     * @tc.name      testSharedBoundary0055
     * @tc.desc      Verify shared type boundary id 125.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSharedBoundary0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0055 begin');
      const identity: UserIdentity = { id: 125 };
      expect(getProfileName(identity)).assertEqual('user-125');
      expect(canRead(identity)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0055 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_SHBOUNDP1_5600
     * @tc.name      testSharedBoundary0056
     * @tc.desc      Verify shared type boundary id 126.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSharedBoundary0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0056 begin');
      const identity: UserIdentity = { id: 126 };
      expect(getProfileName(identity)).assertEqual('user-126');
      expect(canRead(identity)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0056 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_SHBOUNDP1_5700
     * @tc.name      testSharedBoundary0057
     * @tc.desc      Verify shared type boundary id 127.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSharedBoundary0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0057 begin');
      const identity: UserIdentity = { id: 127 };
      expect(getProfileName(identity)).assertEqual('user-127');
      expect(canRead(identity)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0057 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_SHBOUNDP1_5800
     * @tc.name      testSharedBoundary0058
     * @tc.desc      Verify shared type boundary id 128.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSharedBoundary0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0058 begin');
      const identity: UserIdentity = { id: 128 };
      expect(getProfileName(identity)).assertEqual('user-128');
      expect(canRead(identity)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0058 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_SHBOUNDP1_5900
     * @tc.name      testSharedBoundary0059
     * @tc.desc      Verify shared type boundary id 129.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSharedBoundary0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0059 begin');
      const identity: UserIdentity = { id: 129 };
      expect(getProfileName(identity)).assertEqual('user-129');
      expect(canRead(identity)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0059 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_SHBOUNDP1_6000
     * @tc.name      testSharedBoundary0060
     * @tc.desc      Verify shared type boundary id 130.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSharedBoundary0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0060 begin');
      const identity: UserIdentity = { id: 130 };
      expect(getProfileName(identity)).assertEqual('user-130');
      expect(canRead(identity)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0060 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_SHBOUNDP1_6100
     * @tc.name      testSharedBoundary0061
     * @tc.desc      Verify shared type boundary id 131.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSharedBoundary0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0061 begin');
      const identity: UserIdentity = { id: 131 };
      expect(getProfileName(identity)).assertEqual('user-131');
      expect(canRead(identity)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0061 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_SHBOUNDP1_6200
     * @tc.name      testSharedBoundary0062
     * @tc.desc      Verify shared type boundary id 132.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSharedBoundary0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0062 begin');
      const identity: UserIdentity = { id: 132 };
      expect(getProfileName(identity)).assertEqual('user-132');
      expect(canRead(identity)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0062 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_SHBOUNDP1_6300
     * @tc.name      testSharedBoundary0063
     * @tc.desc      Verify shared type boundary id 133.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSharedBoundary0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0063 begin');
      const identity: UserIdentity = { id: 133 };
      expect(getProfileName(identity)).assertEqual('user-133');
      expect(canRead(identity)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0063 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_SHBOUNDP1_6400
     * @tc.name      testSharedBoundary0064
     * @tc.desc      Verify shared type boundary id 134.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSharedBoundary0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0064 begin');
      const identity: UserIdentity = { id: 134 };
      expect(getProfileName(identity)).assertEqual('user-134');
      expect(canRead(identity)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0064 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_SHBOUNDP1_6500
     * @tc.name      testSharedBoundary0065
     * @tc.desc      Verify shared type boundary id 135.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSharedBoundary0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0065 begin');
      const identity: UserIdentity = { id: 135 };
      expect(getProfileName(identity)).assertEqual('user-135');
      expect(canRead(identity)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0065 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_SHBOUNDP1_6600
     * @tc.name      testSharedBoundary0066
     * @tc.desc      Verify shared type boundary id 136.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSharedBoundary0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0066 begin');
      const identity: UserIdentity = { id: 136 };
      expect(getProfileName(identity)).assertEqual('user-136');
      expect(canRead(identity)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0066 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_SHBOUNDP1_6700
     * @tc.name      testSharedBoundary0067
     * @tc.desc      Verify shared type boundary id 137.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSharedBoundary0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0067 begin');
      const identity: UserIdentity = { id: 137 };
      expect(getProfileName(identity)).assertEqual('user-137');
      expect(canRead(identity)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0067 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_SHBOUNDP1_6800
     * @tc.name      testSharedBoundary0068
     * @tc.desc      Verify shared type boundary id 138.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSharedBoundary0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0068 begin');
      const identity: UserIdentity = { id: 138 };
      expect(getProfileName(identity)).assertEqual('user-138');
      expect(canRead(identity)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0068 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_SHBOUNDP1_6900
     * @tc.name      testSharedBoundary0069
     * @tc.desc      Verify shared type boundary id 139.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSharedBoundary0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0069 begin');
      const identity: UserIdentity = { id: 139 };
      expect(getProfileName(identity)).assertEqual('user-139');
      expect(canRead(identity)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0069 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_SHBOUNDP1_7000
     * @tc.name      testSharedBoundary0070
     * @tc.desc      Verify shared type boundary id 140.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSharedBoundary0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0070 begin');
      const identity: UserIdentity = { id: 140 };
      expect(getProfileName(identity)).assertEqual('user-140');
      expect(canRead(identity)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0070 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_SHBOUNDP1_7100
     * @tc.name      testSharedBoundary0071
     * @tc.desc      Verify shared type boundary id 141.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSharedBoundary0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0071 begin');
      const identity: UserIdentity = { id: 141 };
      expect(getProfileName(identity)).assertEqual('user-141');
      expect(canRead(identity)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0071 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_SHBOUNDP1_7200
     * @tc.name      testSharedBoundary0072
     * @tc.desc      Verify shared type boundary id 142.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSharedBoundary0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0072 begin');
      const identity: UserIdentity = { id: 142 };
      expect(getProfileName(identity)).assertEqual('user-142');
      expect(canRead(identity)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0072 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_SHBOUNDP1_7300
     * @tc.name      testSharedBoundary0073
     * @tc.desc      Verify shared type boundary id 143.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSharedBoundary0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0073 begin');
      const identity: UserIdentity = { id: 143 };
      expect(getProfileName(identity)).assertEqual('user-143');
      expect(canRead(identity)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0073 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_SHBOUNDP1_7400
     * @tc.name      testSharedBoundary0074
     * @tc.desc      Verify shared type boundary id 144.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSharedBoundary0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0074 begin');
      const identity: UserIdentity = { id: 144 };
      expect(getProfileName(identity)).assertEqual('user-144');
      expect(canRead(identity)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0074 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_SHBOUNDP1_7500
     * @tc.name      testSharedBoundary0075
     * @tc.desc      Verify shared type boundary id 145.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSharedBoundary0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0075 begin');
      const identity: UserIdentity = { id: 145 };
      expect(getProfileName(identity)).assertEqual('user-145');
      expect(canRead(identity)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0075 end');
    })

  })
}
