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

export default function SharedTypesBoundaryPart2Test(): void {
  describe('SharedTypesBoundaryPart2', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 20);
      });
    })


    /**
     * @tc.number    SUB_ARKTS_GUIDE_SHBOUNDP2_7600
     * @tc.name      testSharedBoundary0076
     * @tc.desc      Verify shared type boundary id 146.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSharedBoundary0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0076 begin');
      const identity: UserIdentity = { id: 146 };
      expect(getProfileName(identity)).assertEqual('user-146');
      expect(canRead(identity)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0076 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_SHBOUNDP2_7700
     * @tc.name      testSharedBoundary0077
     * @tc.desc      Verify shared type boundary id 147.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSharedBoundary0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0077 begin');
      const identity: UserIdentity = { id: 147 };
      expect(getProfileName(identity)).assertEqual('user-147');
      expect(canRead(identity)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0077 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_SHBOUNDP2_7800
     * @tc.name      testSharedBoundary0078
     * @tc.desc      Verify shared type boundary id 148.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSharedBoundary0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0078 begin');
      const identity: UserIdentity = { id: 148 };
      expect(getProfileName(identity)).assertEqual('user-148');
      expect(canRead(identity)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0078 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_SHBOUNDP2_7900
     * @tc.name      testSharedBoundary0079
     * @tc.desc      Verify shared type boundary id 149.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSharedBoundary0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0079 begin');
      const identity: UserIdentity = { id: 149 };
      expect(getProfileName(identity)).assertEqual('user-149');
      expect(canRead(identity)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0079 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_SHBOUNDP2_8000
     * @tc.name      testSharedBoundary0080
     * @tc.desc      Verify shared type boundary id 150.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSharedBoundary0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0080 begin');
      const identity: UserIdentity = { id: 150 };
      expect(getProfileName(identity)).assertEqual('user-150');
      expect(canRead(identity)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0080 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_SHBOUNDP2_8100
     * @tc.name      testSharedBoundary0081
     * @tc.desc      Verify shared type boundary id 151.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSharedBoundary0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0081 begin');
      const identity: UserIdentity = { id: 151 };
      expect(getProfileName(identity)).assertEqual('user-151');
      expect(canRead(identity)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0081 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_SHBOUNDP2_8200
     * @tc.name      testSharedBoundary0082
     * @tc.desc      Verify shared type boundary id 152.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSharedBoundary0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0082 begin');
      const identity: UserIdentity = { id: 152 };
      expect(getProfileName(identity)).assertEqual('user-152');
      expect(canRead(identity)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0082 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_SHBOUNDP2_8300
     * @tc.name      testSharedBoundary0083
     * @tc.desc      Verify shared type boundary id 153.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSharedBoundary0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0083 begin');
      const identity: UserIdentity = { id: 153 };
      expect(getProfileName(identity)).assertEqual('user-153');
      expect(canRead(identity)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0083 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_SHBOUNDP2_8400
     * @tc.name      testSharedBoundary0084
     * @tc.desc      Verify shared type boundary id 154.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSharedBoundary0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0084 begin');
      const identity: UserIdentity = { id: 154 };
      expect(getProfileName(identity)).assertEqual('user-154');
      expect(canRead(identity)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0084 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_SHBOUNDP2_8500
     * @tc.name      testSharedBoundary0085
     * @tc.desc      Verify shared type boundary id 155.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSharedBoundary0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0085 begin');
      const identity: UserIdentity = { id: 155 };
      expect(getProfileName(identity)).assertEqual('user-155');
      expect(canRead(identity)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0085 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_SHBOUNDP2_8600
     * @tc.name      testSharedBoundary0086
     * @tc.desc      Verify shared type boundary id 156.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSharedBoundary0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0086 begin');
      const identity: UserIdentity = { id: 156 };
      expect(getProfileName(identity)).assertEqual('user-156');
      expect(canRead(identity)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0086 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_SHBOUNDP2_8700
     * @tc.name      testSharedBoundary0087
     * @tc.desc      Verify shared type boundary id 157.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSharedBoundary0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0087 begin');
      const identity: UserIdentity = { id: 157 };
      expect(getProfileName(identity)).assertEqual('user-157');
      expect(canRead(identity)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0087 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_SHBOUNDP2_8800
     * @tc.name      testSharedBoundary0088
     * @tc.desc      Verify shared type boundary id 158.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSharedBoundary0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0088 begin');
      const identity: UserIdentity = { id: 158 };
      expect(getProfileName(identity)).assertEqual('user-158');
      expect(canRead(identity)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0088 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_SHBOUNDP2_8900
     * @tc.name      testSharedBoundary0089
     * @tc.desc      Verify shared type boundary id 159.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSharedBoundary0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0089 begin');
      const identity: UserIdentity = { id: 159 };
      expect(getProfileName(identity)).assertEqual('user-159');
      expect(canRead(identity)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0089 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_SHBOUNDP2_9000
     * @tc.name      testSharedBoundary0090
     * @tc.desc      Verify shared type boundary id 160.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSharedBoundary0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0090 begin');
      const identity: UserIdentity = { id: 160 };
      expect(getProfileName(identity)).assertEqual('user-160');
      expect(canRead(identity)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0090 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_SHBOUNDP2_9100
     * @tc.name      testSharedBoundary0091
     * @tc.desc      Verify shared type boundary id 1000000000000000.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSharedBoundary0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0091 begin');
      const identity: UserIdentity = { id: 1000000000000000 };
      expect(getProfileName(identity)).assertEqual('user-1000000000000000');
      expect(canRead(identity)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0091 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_SHBOUNDP2_9200
     * @tc.name      testSharedBoundary0092
     * @tc.desc      Verify shared type boundary id -1000000000000000.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSharedBoundary0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0092 begin');
      const identity: UserIdentity = { id: -1000000000000000 };
      expect(getProfileName(identity)).assertEqual('user--1000000000000000');
      expect(canRead(identity)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0092 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_SHBOUNDP2_9300
     * @tc.name      testSharedBoundary0093
     * @tc.desc      Verify shared type boundary id 9007199254740991.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSharedBoundary0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0093 begin');
      const identity: UserIdentity = { id: 9007199254740991 };
      expect(getProfileName(identity)).assertEqual('user-9007199254740991');
      expect(canRead(identity)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0093 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_SHBOUNDP2_9400
     * @tc.name      testSharedBoundary0094
     * @tc.desc      Verify shared type boundary id 1.5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSharedBoundary0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0094 begin');
      const identity: UserIdentity = { id: 1.5 };
      expect(getProfileName(identity)).assertEqual('user-1.5');
      expect(canRead(identity)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0094 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_SHBOUNDP2_9500
     * @tc.name      testSharedBoundary0095
     * @tc.desc      Verify shared type boundary id -1.5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSharedBoundary0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0095 begin');
      const identity: UserIdentity = { id: -1.5 };
      expect(getProfileName(identity)).assertEqual('user--1.5');
      expect(canRead(identity)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0095 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_SHBOUNDP2_9600
     * @tc.name      testSharedBoundary0096
     * @tc.desc      Verify shared type boundary id 0.5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSharedBoundary0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0096 begin');
      const identity: UserIdentity = { id: 0.5 };
      expect(getProfileName(identity)).assertEqual('user-0.5');
      expect(canRead(identity)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0096 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_SHBOUNDP2_9700
     * @tc.name      testSharedBoundary0097
     * @tc.desc      Verify shared type boundary id -0.5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSharedBoundary0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0097 begin');
      const identity: UserIdentity = { id: -0.5 };
      expect(getProfileName(identity)).assertEqual('user--0.5');
      expect(canRead(identity)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0097 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_SHBOUNDP2_9800
     * @tc.name      testSharedBoundary0098
     * @tc.desc      Verify shared type boundary id 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSharedBoundary0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0098 begin');
      const identity: UserIdentity = { id: 0 };
      expect(getProfileName(identity)).assertEqual('user-0');
      expect(canRead(identity)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0098 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_SHBOUNDP2_9900
     * @tc.name      testSharedBoundary0099
     * @tc.desc      Verify shared type boundary id 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSharedBoundary0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0099 begin');
      const identity: UserIdentity = { id: 1 };
      expect(getProfileName(identity)).assertEqual('user-1');
      expect(canRead(identity)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0099 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_SHBOUNDP2_10000
     * @tc.name      testSharedBoundary0100
     * @tc.desc      Verify shared type boundary id -1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSharedBoundary0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0100 begin');
      const identity: UserIdentity = { id: -1 };
      expect(getProfileName(identity)).assertEqual('user--1');
      expect(canRead(identity)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSharedBoundary0100 end');
    })

  })
}
