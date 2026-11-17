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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { userAuth } from '@kit.UserAuthenticationKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[SampleTest]';

export default function userAuthMatrixTestPart02() {
  describe('UserAuthMatrixPart02', () => {
    /**
     * @tc.name   testUserAuthMatrix0092
     * @tc.number SUB_USER_AUTH_MATRIX_0092
     * @tc.desc   Verify auth type array 42.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0092 begin');
      const types: userAuth.UserAuthType[] = [userAuth.UserAuthType.PIN];
      expect(types.length > 0).assertTrue();
      for (let i: number = 0; i < types.length; i++) {
        expect(typeof types[i]).assertEqual('number');
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0092 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0093
     * @tc.number SUB_USER_AUTH_MATRIX_0093
     * @tc.desc   Verify auth type array 43.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0093 begin');
      const types: userAuth.UserAuthType[] = [userAuth.UserAuthType.FACE];
      expect(types.length > 0).assertTrue();
      for (let i: number = 0; i < types.length; i++) {
        expect(typeof types[i]).assertEqual('number');
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0093 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0094
     * @tc.number SUB_USER_AUTH_MATRIX_0094
     * @tc.desc   Verify auth type array 44.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0094 begin');
      const types: userAuth.UserAuthType[] = [userAuth.UserAuthType.FINGERPRINT];
      expect(types.length > 0).assertTrue();
      for (let i: number = 0; i < types.length; i++) {
        expect(typeof types[i]).assertEqual('number');
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0094 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0095
     * @tc.number SUB_USER_AUTH_MATRIX_0095
     * @tc.desc   Verify auth type array 45.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0095 begin');
      const types: userAuth.UserAuthType[] = [userAuth.UserAuthType.PIN, userAuth.UserAuthType.FACE];
      expect(types.length > 0).assertTrue();
      for (let i: number = 0; i < types.length; i++) {
        expect(typeof types[i]).assertEqual('number');
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0095 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0096
     * @tc.number SUB_USER_AUTH_MATRIX_0096
     * @tc.desc   Verify auth type array 46.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0096 begin');
      const types: userAuth.UserAuthType[] = [userAuth.UserAuthType.PIN, userAuth.UserAuthType.FINGERPRINT];
      expect(types.length > 0).assertTrue();
      for (let i: number = 0; i < types.length; i++) {
        expect(typeof types[i]).assertEqual('number');
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0096 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0097
     * @tc.number SUB_USER_AUTH_MATRIX_0097
     * @tc.desc   Verify auth type array 47.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0097 begin');
      const types: userAuth.UserAuthType[] = [userAuth.UserAuthType.FACE, userAuth.UserAuthType.FINGERPRINT];
      expect(types.length > 0).assertTrue();
      for (let i: number = 0; i < types.length; i++) {
        expect(typeof types[i]).assertEqual('number');
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0097 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0098
     * @tc.number SUB_USER_AUTH_MATRIX_0098
     * @tc.desc   Verify auth type array 48.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0098 begin');
      const types: userAuth.UserAuthType[] = [userAuth.UserAuthType.PIN, userAuth.UserAuthType.FACE, userAuth.UserAuthType.FINGERPRINT];
      expect(types.length > 0).assertTrue();
      for (let i: number = 0; i < types.length; i++) {
        expect(typeof types[i]).assertEqual('number');
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0098 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0099
     * @tc.number SUB_USER_AUTH_MATRIX_0099
     * @tc.desc   Verify auth type array 49.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0099 begin');
      const types: userAuth.UserAuthType[] = [userAuth.UserAuthType.PIN];
      expect(types.length > 0).assertTrue();
      for (let i: number = 0; i < types.length; i++) {
        expect(typeof types[i]).assertEqual('number');
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0099 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0100
     * @tc.number SUB_USER_AUTH_MATRIX_0100
     * @tc.desc   Verify auth type array 50.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0100 begin');
      const types: userAuth.UserAuthType[] = [userAuth.UserAuthType.FACE];
      expect(types.length > 0).assertTrue();
      for (let i: number = 0; i < types.length; i++) {
        expect(typeof types[i]).assertEqual('number');
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0100 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0101
     * @tc.number SUB_USER_AUTH_MATRIX_0101
     * @tc.desc   Verify secure level S2 (1).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0101 begin');
      const secureLevel: userAuth.SecureLevel = 'S2';
      expect(secureLevel).assertEqual('S2');
      expect(secureLevel.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0101 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0102
     * @tc.number SUB_USER_AUTH_MATRIX_0102
     * @tc.desc   Verify secure level S3 (2).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0102 begin');
      const secureLevel: userAuth.SecureLevel = 'S3';
      expect(secureLevel).assertEqual('S3');
      expect(secureLevel.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0102 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0103
     * @tc.number SUB_USER_AUTH_MATRIX_0103
     * @tc.desc   Verify secure level S4 (3).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0103 begin');
      const secureLevel: userAuth.SecureLevel = 'S4';
      expect(secureLevel).assertEqual('S4');
      expect(secureLevel.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0103 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0104
     * @tc.number SUB_USER_AUTH_MATRIX_0104
     * @tc.desc   Verify secure level S1 (4).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0104 begin');
      const secureLevel: userAuth.SecureLevel = 'S1';
      expect(secureLevel).assertEqual('S1');
      expect(secureLevel.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0104 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0105
     * @tc.number SUB_USER_AUTH_MATRIX_0105
     * @tc.desc   Verify secure level S2 (5).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0105 begin');
      const secureLevel: userAuth.SecureLevel = 'S2';
      expect(secureLevel).assertEqual('S2');
      expect(secureLevel.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0105 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0106
     * @tc.number SUB_USER_AUTH_MATRIX_0106
     * @tc.desc   Verify secure level S3 (6).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0106 begin');
      const secureLevel: userAuth.SecureLevel = 'S3';
      expect(secureLevel).assertEqual('S3');
      expect(secureLevel.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0106 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0107
     * @tc.number SUB_USER_AUTH_MATRIX_0107
     * @tc.desc   Verify secure level S4 (7).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0107 begin');
      const secureLevel: userAuth.SecureLevel = 'S4';
      expect(secureLevel).assertEqual('S4');
      expect(secureLevel.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0107 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0108
     * @tc.number SUB_USER_AUTH_MATRIX_0108
     * @tc.desc   Verify secure level S1 (8).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0108 begin');
      const secureLevel: userAuth.SecureLevel = 'S1';
      expect(secureLevel).assertEqual('S1');
      expect(secureLevel.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0108 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0109
     * @tc.number SUB_USER_AUTH_MATRIX_0109
     * @tc.desc   Verify secure level S2 (9).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0109 begin');
      const secureLevel: userAuth.SecureLevel = 'S2';
      expect(secureLevel).assertEqual('S2');
      expect(secureLevel.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0109 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0110
     * @tc.number SUB_USER_AUTH_MATRIX_0110
     * @tc.desc   Verify secure level S3 (10).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0110 begin');
      const secureLevel: userAuth.SecureLevel = 'S3';
      expect(secureLevel).assertEqual('S3');
      expect(secureLevel.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0110 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0111
     * @tc.number SUB_USER_AUTH_MATRIX_0111
     * @tc.desc   Verify secure level S4 (11).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0111 begin');
      const secureLevel: userAuth.SecureLevel = 'S4';
      expect(secureLevel).assertEqual('S4');
      expect(secureLevel.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0111 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0112
     * @tc.number SUB_USER_AUTH_MATRIX_0112
     * @tc.desc   Verify secure level S1 (12).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0112 begin');
      const secureLevel: userAuth.SecureLevel = 'S1';
      expect(secureLevel).assertEqual('S1');
      expect(secureLevel.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0112 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0113
     * @tc.number SUB_USER_AUTH_MATRIX_0113
     * @tc.desc   Verify secure level S2 (13).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0113 begin');
      const secureLevel: userAuth.SecureLevel = 'S2';
      expect(secureLevel).assertEqual('S2');
      expect(secureLevel.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0113 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0114
     * @tc.number SUB_USER_AUTH_MATRIX_0114
     * @tc.desc   Verify secure level S3 (14).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0114 begin');
      const secureLevel: userAuth.SecureLevel = 'S3';
      expect(secureLevel).assertEqual('S3');
      expect(secureLevel.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0114 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0115
     * @tc.number SUB_USER_AUTH_MATRIX_0115
     * @tc.desc   Verify secure level S4 (15).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0115 begin');
      const secureLevel: userAuth.SecureLevel = 'S4';
      expect(secureLevel).assertEqual('S4');
      expect(secureLevel.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0115 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0116
     * @tc.number SUB_USER_AUTH_MATRIX_0116
     * @tc.desc   Verify secure level S1 (16).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0116 begin');
      const secureLevel: userAuth.SecureLevel = 'S1';
      expect(secureLevel).assertEqual('S1');
      expect(secureLevel.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0116 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0117
     * @tc.number SUB_USER_AUTH_MATRIX_0117
     * @tc.desc   Verify secure level S2 (17).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0117 begin');
      const secureLevel: userAuth.SecureLevel = 'S2';
      expect(secureLevel).assertEqual('S2');
      expect(secureLevel.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0117 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0118
     * @tc.number SUB_USER_AUTH_MATRIX_0118
     * @tc.desc   Verify secure level S3 (18).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0118 begin');
      const secureLevel: userAuth.SecureLevel = 'S3';
      expect(secureLevel).assertEqual('S3');
      expect(secureLevel.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0118 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0119
     * @tc.number SUB_USER_AUTH_MATRIX_0119
     * @tc.desc   Verify secure level S4 (19).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0119 begin');
      const secureLevel: userAuth.SecureLevel = 'S4';
      expect(secureLevel).assertEqual('S4');
      expect(secureLevel.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0119 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0120
     * @tc.number SUB_USER_AUTH_MATRIX_0120
     * @tc.desc   Verify secure level S1 (20).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0120 begin');
      const secureLevel: userAuth.SecureLevel = 'S1';
      expect(secureLevel).assertEqual('S1');
      expect(secureLevel.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0120 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0121
     * @tc.number SUB_USER_AUTH_MATRIX_0121
     * @tc.desc   Verify secure level S2 (21).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0121 begin');
      const secureLevel: userAuth.SecureLevel = 'S2';
      expect(secureLevel).assertEqual('S2');
      expect(secureLevel.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0121 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0122
     * @tc.number SUB_USER_AUTH_MATRIX_0122
     * @tc.desc   Verify secure level S3 (22).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0122 begin');
      const secureLevel: userAuth.SecureLevel = 'S3';
      expect(secureLevel).assertEqual('S3');
      expect(secureLevel.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0122 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0123
     * @tc.number SUB_USER_AUTH_MATRIX_0123
     * @tc.desc   Verify secure level S4 (23).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0123 begin');
      const secureLevel: userAuth.SecureLevel = 'S4';
      expect(secureLevel).assertEqual('S4');
      expect(secureLevel.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0123 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0124
     * @tc.number SUB_USER_AUTH_MATRIX_0124
     * @tc.desc   Verify secure level S1 (24).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0124 begin');
      const secureLevel: userAuth.SecureLevel = 'S1';
      expect(secureLevel).assertEqual('S1');
      expect(secureLevel.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0124 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0125
     * @tc.number SUB_USER_AUTH_MATRIX_0125
     * @tc.desc   Verify secure level S2 (25).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0125 begin');
      const secureLevel: userAuth.SecureLevel = 'S2';
      expect(secureLevel).assertEqual('S2');
      expect(secureLevel.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0125 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0126
     * @tc.number SUB_USER_AUTH_MATRIX_0126
     * @tc.desc   Verify secure level S3 (26).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0126 begin');
      const secureLevel: userAuth.SecureLevel = 'S3';
      expect(secureLevel).assertEqual('S3');
      expect(secureLevel.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0126 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0127
     * @tc.number SUB_USER_AUTH_MATRIX_0127
     * @tc.desc   Verify secure level S4 (27).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0127 begin');
      const secureLevel: userAuth.SecureLevel = 'S4';
      expect(secureLevel).assertEqual('S4');
      expect(secureLevel.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0127 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0128
     * @tc.number SUB_USER_AUTH_MATRIX_0128
     * @tc.desc   Verify secure level S1 (28).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0128 begin');
      const secureLevel: userAuth.SecureLevel = 'S1';
      expect(secureLevel).assertEqual('S1');
      expect(secureLevel.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0128 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0129
     * @tc.number SUB_USER_AUTH_MATRIX_0129
     * @tc.desc   Verify secure level S2 (29).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0129 begin');
      const secureLevel: userAuth.SecureLevel = 'S2';
      expect(secureLevel).assertEqual('S2');
      expect(secureLevel.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0129 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0130
     * @tc.number SUB_USER_AUTH_MATRIX_0130
     * @tc.desc   Verify secure level S3 (30).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0130 begin');
      const secureLevel: userAuth.SecureLevel = 'S3';
      expect(secureLevel).assertEqual('S3');
      expect(secureLevel.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0130 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0131
     * @tc.number SUB_USER_AUTH_MATRIX_0131
     * @tc.desc   Verify secure level S4 (31).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0131 begin');
      const secureLevel: userAuth.SecureLevel = 'S4';
      expect(secureLevel).assertEqual('S4');
      expect(secureLevel.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0131 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0132
     * @tc.number SUB_USER_AUTH_MATRIX_0132
     * @tc.desc   Verify secure level S1 (32).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0132 begin');
      const secureLevel: userAuth.SecureLevel = 'S1';
      expect(secureLevel).assertEqual('S1');
      expect(secureLevel.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0132 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0133
     * @tc.number SUB_USER_AUTH_MATRIX_0133
     * @tc.desc   Verify secure level S2 (33).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0133 begin');
      const secureLevel: userAuth.SecureLevel = 'S2';
      expect(secureLevel).assertEqual('S2');
      expect(secureLevel.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0133 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0134
     * @tc.number SUB_USER_AUTH_MATRIX_0134
     * @tc.desc   Verify secure level S3 (34).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0134 begin');
      const secureLevel: userAuth.SecureLevel = 'S3';
      expect(secureLevel).assertEqual('S3');
      expect(secureLevel.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0134 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0135
     * @tc.number SUB_USER_AUTH_MATRIX_0135
     * @tc.desc   Verify secure level S4 (35).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0135 begin');
      const secureLevel: userAuth.SecureLevel = 'S4';
      expect(secureLevel).assertEqual('S4');
      expect(secureLevel.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0135 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0136
     * @tc.number SUB_USER_AUTH_MATRIX_0136
     * @tc.desc   Verify secure level S1 (36).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0136 begin');
      const secureLevel: userAuth.SecureLevel = 'S1';
      expect(secureLevel).assertEqual('S1');
      expect(secureLevel.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0136 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0137
     * @tc.number SUB_USER_AUTH_MATRIX_0137
     * @tc.desc   Verify secure level S2 (37).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0137 begin');
      const secureLevel: userAuth.SecureLevel = 'S2';
      expect(secureLevel).assertEqual('S2');
      expect(secureLevel.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0137 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0138
     * @tc.number SUB_USER_AUTH_MATRIX_0138
     * @tc.desc   Verify secure level S3 (38).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0138 begin');
      const secureLevel: userAuth.SecureLevel = 'S3';
      expect(secureLevel).assertEqual('S3');
      expect(secureLevel.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0138 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0139
     * @tc.number SUB_USER_AUTH_MATRIX_0139
     * @tc.desc   Verify secure level S4 (39).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0139 begin');
      const secureLevel: userAuth.SecureLevel = 'S4';
      expect(secureLevel).assertEqual('S4');
      expect(secureLevel.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0139 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0140
     * @tc.number SUB_USER_AUTH_MATRIX_0140
     * @tc.desc   Verify secure level S1 (40).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0140 begin');
      const secureLevel: userAuth.SecureLevel = 'S1';
      expect(secureLevel).assertEqual('S1');
      expect(secureLevel.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0140 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0141
     * @tc.number SUB_USER_AUTH_MATRIX_0141
     * @tc.desc   Verify secure level S2 (41).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0141 begin');
      const secureLevel: userAuth.SecureLevel = 'S2';
      expect(secureLevel).assertEqual('S2');
      expect(secureLevel.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0141 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0142
     * @tc.number SUB_USER_AUTH_MATRIX_0142
     * @tc.desc   Verify secure level S3 (42).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0142 begin');
      const secureLevel: userAuth.SecureLevel = 'S3';
      expect(secureLevel).assertEqual('S3');
      expect(secureLevel.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0142 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0143
     * @tc.number SUB_USER_AUTH_MATRIX_0143
     * @tc.desc   Verify secure level S4 (43).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0143 begin');
      const secureLevel: userAuth.SecureLevel = 'S4';
      expect(secureLevel).assertEqual('S4');
      expect(secureLevel.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0143 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0144
     * @tc.number SUB_USER_AUTH_MATRIX_0144
     * @tc.desc   Verify secure level S1 (44).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0144 begin');
      const secureLevel: userAuth.SecureLevel = 'S1';
      expect(secureLevel).assertEqual('S1');
      expect(secureLevel.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0144 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0145
     * @tc.number SUB_USER_AUTH_MATRIX_0145
     * @tc.desc   Verify secure level S2 (45).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0145 begin');
      const secureLevel: userAuth.SecureLevel = 'S2';
      expect(secureLevel).assertEqual('S2');
      expect(secureLevel.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0145 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0146
     * @tc.number SUB_USER_AUTH_MATRIX_0146
     * @tc.desc   Verify secure level S3 (46).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0146 begin');
      const secureLevel: userAuth.SecureLevel = 'S3';
      expect(secureLevel).assertEqual('S3');
      expect(secureLevel.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0146 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0147
     * @tc.number SUB_USER_AUTH_MATRIX_0147
     * @tc.desc   Verify secure level S4 (47).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0147 begin');
      const secureLevel: userAuth.SecureLevel = 'S4';
      expect(secureLevel).assertEqual('S4');
      expect(secureLevel.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0147 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0148
     * @tc.number SUB_USER_AUTH_MATRIX_0148
     * @tc.desc   Verify secure level S1 (48).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0148 begin');
      const secureLevel: userAuth.SecureLevel = 'S1';
      expect(secureLevel).assertEqual('S1');
      expect(secureLevel.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0148 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0149
     * @tc.number SUB_USER_AUTH_MATRIX_0149
     * @tc.desc   Verify secure level S2 (49).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0149 begin');
      const secureLevel: userAuth.SecureLevel = 'S2';
      expect(secureLevel).assertEqual('S2');
      expect(secureLevel.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0149 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0150
     * @tc.number SUB_USER_AUTH_MATRIX_0150
     * @tc.desc   Verify secure level S3 (50).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0150 begin');
      const secureLevel: userAuth.SecureLevel = 'S3';
      expect(secureLevel).assertEqual('S3');
      expect(secureLevel.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0150 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0151
     * @tc.number SUB_USER_AUTH_MATRIX_0151
     * @tc.desc   Verify AuthType string FACE_ONLY (1).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0151 begin');
      const authType: userAuth.AuthType = 'FACE_ONLY';
      expect(authType).assertEqual('FACE_ONLY');
      expect(authType.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0151 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0152
     * @tc.number SUB_USER_AUTH_MATRIX_0152
     * @tc.desc   Verify AuthType string ALL (2).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0152 begin');
      const authType: userAuth.AuthType = 'ALL';
      expect(authType).assertEqual('ALL');
      expect(authType.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0152 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0153
     * @tc.number SUB_USER_AUTH_MATRIX_0153
     * @tc.desc   Verify AuthType string FACE_ONLY (3).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0153 begin');
      const authType: userAuth.AuthType = 'FACE_ONLY';
      expect(authType).assertEqual('FACE_ONLY');
      expect(authType.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0153 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0154
     * @tc.number SUB_USER_AUTH_MATRIX_0154
     * @tc.desc   Verify AuthType string ALL (4).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0154 begin');
      const authType: userAuth.AuthType = 'ALL';
      expect(authType).assertEqual('ALL');
      expect(authType.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0154 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0155
     * @tc.number SUB_USER_AUTH_MATRIX_0155
     * @tc.desc   Verify AuthType string FACE_ONLY (5).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0155 begin');
      const authType: userAuth.AuthType = 'FACE_ONLY';
      expect(authType).assertEqual('FACE_ONLY');
      expect(authType.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0155 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0156
     * @tc.number SUB_USER_AUTH_MATRIX_0156
     * @tc.desc   Verify AuthType string ALL (6).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0156 begin');
      const authType: userAuth.AuthType = 'ALL';
      expect(authType).assertEqual('ALL');
      expect(authType.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0156 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0157
     * @tc.number SUB_USER_AUTH_MATRIX_0157
     * @tc.desc   Verify AuthType string FACE_ONLY (7).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0157 begin');
      const authType: userAuth.AuthType = 'FACE_ONLY';
      expect(authType).assertEqual('FACE_ONLY');
      expect(authType.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0157 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0158
     * @tc.number SUB_USER_AUTH_MATRIX_0158
     * @tc.desc   Verify AuthType string ALL (8).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0158', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0158 begin');
      const authType: userAuth.AuthType = 'ALL';
      expect(authType).assertEqual('ALL');
      expect(authType.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0158 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0159
     * @tc.number SUB_USER_AUTH_MATRIX_0159
     * @tc.desc   Verify AuthType string FACE_ONLY (9).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0159', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0159 begin');
      const authType: userAuth.AuthType = 'FACE_ONLY';
      expect(authType).assertEqual('FACE_ONLY');
      expect(authType.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0159 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0160
     * @tc.number SUB_USER_AUTH_MATRIX_0160
     * @tc.desc   Verify AuthType string ALL (10).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0160 begin');
      const authType: userAuth.AuthType = 'ALL';
      expect(authType).assertEqual('ALL');
      expect(authType.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0160 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0161
     * @tc.number SUB_USER_AUTH_MATRIX_0161
     * @tc.desc   Verify AuthType string FACE_ONLY (11).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0161', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0161 begin');
      const authType: userAuth.AuthType = 'FACE_ONLY';
      expect(authType).assertEqual('FACE_ONLY');
      expect(authType.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0161 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0162
     * @tc.number SUB_USER_AUTH_MATRIX_0162
     * @tc.desc   Verify AuthType string ALL (12).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0162', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0162 begin');
      const authType: userAuth.AuthType = 'ALL';
      expect(authType).assertEqual('ALL');
      expect(authType.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0162 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0163
     * @tc.number SUB_USER_AUTH_MATRIX_0163
     * @tc.desc   Verify AuthType string FACE_ONLY (13).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0163', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0163 begin');
      const authType: userAuth.AuthType = 'FACE_ONLY';
      expect(authType).assertEqual('FACE_ONLY');
      expect(authType.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0163 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0164
     * @tc.number SUB_USER_AUTH_MATRIX_0164
     * @tc.desc   Verify AuthType string ALL (14).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0164', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0164 begin');
      const authType: userAuth.AuthType = 'ALL';
      expect(authType).assertEqual('ALL');
      expect(authType.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0164 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0165
     * @tc.number SUB_USER_AUTH_MATRIX_0165
     * @tc.desc   Verify AuthType string FACE_ONLY (15).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0165', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0165 begin');
      const authType: userAuth.AuthType = 'FACE_ONLY';
      expect(authType).assertEqual('FACE_ONLY');
      expect(authType.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0165 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0166
     * @tc.number SUB_USER_AUTH_MATRIX_0166
     * @tc.desc   Verify AuthType string ALL (16).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0166', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0166 begin');
      const authType: userAuth.AuthType = 'ALL';
      expect(authType).assertEqual('ALL');
      expect(authType.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0166 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0167
     * @tc.number SUB_USER_AUTH_MATRIX_0167
     * @tc.desc   Verify AuthType string FACE_ONLY (17).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0167', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0167 begin');
      const authType: userAuth.AuthType = 'FACE_ONLY';
      expect(authType).assertEqual('FACE_ONLY');
      expect(authType.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0167 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0168
     * @tc.number SUB_USER_AUTH_MATRIX_0168
     * @tc.desc   Verify AuthType string ALL (18).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0168', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0168 begin');
      const authType: userAuth.AuthType = 'ALL';
      expect(authType).assertEqual('ALL');
      expect(authType.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0168 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0169
     * @tc.number SUB_USER_AUTH_MATRIX_0169
     * @tc.desc   Verify AuthType string FACE_ONLY (19).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0169', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0169 begin');
      const authType: userAuth.AuthType = 'FACE_ONLY';
      expect(authType).assertEqual('FACE_ONLY');
      expect(authType.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0169 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0170
     * @tc.number SUB_USER_AUTH_MATRIX_0170
     * @tc.desc   Verify AuthType string ALL (20).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0170 begin');
      const authType: userAuth.AuthType = 'ALL';
      expect(authType).assertEqual('ALL');
      expect(authType.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0170 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0171
     * @tc.number SUB_USER_AUTH_MATRIX_0171
     * @tc.desc   Verify AuthType string FACE_ONLY (21).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0171', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0171 begin');
      const authType: userAuth.AuthType = 'FACE_ONLY';
      expect(authType).assertEqual('FACE_ONLY');
      expect(authType.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0171 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0172
     * @tc.number SUB_USER_AUTH_MATRIX_0172
     * @tc.desc   Verify AuthType string ALL (22).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0172', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0172 begin');
      const authType: userAuth.AuthType = 'ALL';
      expect(authType).assertEqual('ALL');
      expect(authType.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0172 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0173
     * @tc.number SUB_USER_AUTH_MATRIX_0173
     * @tc.desc   Verify AuthType string FACE_ONLY (23).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0173', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0173 begin');
      const authType: userAuth.AuthType = 'FACE_ONLY';
      expect(authType).assertEqual('FACE_ONLY');
      expect(authType.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0173 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0174
     * @tc.number SUB_USER_AUTH_MATRIX_0174
     * @tc.desc   Verify AuthType string ALL (24).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0174', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0174 begin');
      const authType: userAuth.AuthType = 'ALL';
      expect(authType).assertEqual('ALL');
      expect(authType.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0174 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0175
     * @tc.number SUB_USER_AUTH_MATRIX_0175
     * @tc.desc   Verify AuthType string FACE_ONLY (25).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0175', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0175 begin');
      const authType: userAuth.AuthType = 'FACE_ONLY';
      expect(authType).assertEqual('FACE_ONLY');
      expect(authType.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0175 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0176
     * @tc.number SUB_USER_AUTH_MATRIX_0176
     * @tc.desc   Verify AuthType string ALL (26).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0176', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0176 begin');
      const authType: userAuth.AuthType = 'ALL';
      expect(authType).assertEqual('ALL');
      expect(authType.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0176 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0177
     * @tc.number SUB_USER_AUTH_MATRIX_0177
     * @tc.desc   Verify AuthType string FACE_ONLY (27).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0177', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0177 begin');
      const authType: userAuth.AuthType = 'FACE_ONLY';
      expect(authType).assertEqual('FACE_ONLY');
      expect(authType.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0177 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0178
     * @tc.number SUB_USER_AUTH_MATRIX_0178
     * @tc.desc   Verify AuthType string ALL (28).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0178', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0178 begin');
      const authType: userAuth.AuthType = 'ALL';
      expect(authType).assertEqual('ALL');
      expect(authType.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0178 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0179
     * @tc.number SUB_USER_AUTH_MATRIX_0179
     * @tc.desc   Verify AuthType string FACE_ONLY (29).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0179', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0179 begin');
      const authType: userAuth.AuthType = 'FACE_ONLY';
      expect(authType).assertEqual('FACE_ONLY');
      expect(authType.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0179 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0180
     * @tc.number SUB_USER_AUTH_MATRIX_0180
     * @tc.desc   Verify AuthType string ALL (30).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0180 begin');
      const authType: userAuth.AuthType = 'ALL';
      expect(authType).assertEqual('ALL');
      expect(authType.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0180 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0181
     * @tc.number SUB_USER_AUTH_MATRIX_0181
     * @tc.desc   Verify AuthType string FACE_ONLY (31).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0181', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0181 begin');
      const authType: userAuth.AuthType = 'FACE_ONLY';
      expect(authType).assertEqual('FACE_ONLY');
      expect(authType.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0181 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0182
     * @tc.number SUB_USER_AUTH_MATRIX_0182
     * @tc.desc   Verify AuthType string ALL (32).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0182', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0182 begin');
      const authType: userAuth.AuthType = 'ALL';
      expect(authType).assertEqual('ALL');
      expect(authType.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0182 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0183
     * @tc.number SUB_USER_AUTH_MATRIX_0183
     * @tc.desc   Verify AuthType string FACE_ONLY (33).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0183', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0183 begin');
      const authType: userAuth.AuthType = 'FACE_ONLY';
      expect(authType).assertEqual('FACE_ONLY');
      expect(authType.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0183 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0184
     * @tc.number SUB_USER_AUTH_MATRIX_0184
     * @tc.desc   Verify AuthType string ALL (34).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0184', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0184 begin');
      const authType: userAuth.AuthType = 'ALL';
      expect(authType).assertEqual('ALL');
      expect(authType.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0184 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0185
     * @tc.number SUB_USER_AUTH_MATRIX_0185
     * @tc.desc   Verify AuthType string FACE_ONLY (35).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0185', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0185 begin');
      const authType: userAuth.AuthType = 'FACE_ONLY';
      expect(authType).assertEqual('FACE_ONLY');
      expect(authType.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0185 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0186
     * @tc.number SUB_USER_AUTH_MATRIX_0186
     * @tc.desc   Verify AuthType string ALL (36).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0186', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0186 begin');
      const authType: userAuth.AuthType = 'ALL';
      expect(authType).assertEqual('ALL');
      expect(authType.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0186 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0187
     * @tc.number SUB_USER_AUTH_MATRIX_0187
     * @tc.desc   Verify AuthType string FACE_ONLY (37).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0187', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0187 begin');
      const authType: userAuth.AuthType = 'FACE_ONLY';
      expect(authType).assertEqual('FACE_ONLY');
      expect(authType.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0187 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0188
     * @tc.number SUB_USER_AUTH_MATRIX_0188
     * @tc.desc   Verify AuthType string ALL (38).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0188', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0188 begin');
      const authType: userAuth.AuthType = 'ALL';
      expect(authType).assertEqual('ALL');
      expect(authType.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0188 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0189
     * @tc.number SUB_USER_AUTH_MATRIX_0189
     * @tc.desc   Verify AuthType string FACE_ONLY (39).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0189', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0189 begin');
      const authType: userAuth.AuthType = 'FACE_ONLY';
      expect(authType).assertEqual('FACE_ONLY');
      expect(authType.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0189 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0190
     * @tc.number SUB_USER_AUTH_MATRIX_0190
     * @tc.desc   Verify AuthType string ALL (40).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0190 begin');
      const authType: userAuth.AuthType = 'ALL';
      expect(authType).assertEqual('ALL');
      expect(authType.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0190 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0191
     * @tc.number SUB_USER_AUTH_MATRIX_0191
     * @tc.desc   Verify AuthType string FACE_ONLY (41).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0191', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0191 begin');
      const authType: userAuth.AuthType = 'FACE_ONLY';
      expect(authType).assertEqual('FACE_ONLY');
      expect(authType.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0191 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0192
     * @tc.number SUB_USER_AUTH_MATRIX_0192
     * @tc.desc   Verify AuthType string ALL (42).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0192', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0192 begin');
      const authType: userAuth.AuthType = 'ALL';
      expect(authType).assertEqual('ALL');
      expect(authType.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0192 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0193
     * @tc.number SUB_USER_AUTH_MATRIX_0193
     * @tc.desc   Verify AuthType string FACE_ONLY (43).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0193', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0193 begin');
      const authType: userAuth.AuthType = 'FACE_ONLY';
      expect(authType).assertEqual('FACE_ONLY');
      expect(authType.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0193 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0194
     * @tc.number SUB_USER_AUTH_MATRIX_0194
     * @tc.desc   Verify AuthType string ALL (44).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0194', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0194 begin');
      const authType: userAuth.AuthType = 'ALL';
      expect(authType).assertEqual('ALL');
      expect(authType.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0194 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0195
     * @tc.number SUB_USER_AUTH_MATRIX_0195
     * @tc.desc   Verify AuthType string FACE_ONLY (45).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0195', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0195 begin');
      const authType: userAuth.AuthType = 'FACE_ONLY';
      expect(authType).assertEqual('FACE_ONLY');
      expect(authType.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0195 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0196
     * @tc.number SUB_USER_AUTH_MATRIX_0196
     * @tc.desc   Verify AuthType string ALL (46).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0196', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0196 begin');
      const authType: userAuth.AuthType = 'ALL';
      expect(authType).assertEqual('ALL');
      expect(authType.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0196 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0197
     * @tc.number SUB_USER_AUTH_MATRIX_0197
     * @tc.desc   Verify AuthType string FACE_ONLY (47).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0197', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0197 begin');
      const authType: userAuth.AuthType = 'FACE_ONLY';
      expect(authType).assertEqual('FACE_ONLY');
      expect(authType.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0197 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0198
     * @tc.number SUB_USER_AUTH_MATRIX_0198
     * @tc.desc   Verify AuthType string ALL (48).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0198', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0198 begin');
      const authType: userAuth.AuthType = 'ALL';
      expect(authType).assertEqual('ALL');
      expect(authType.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0198 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0199
     * @tc.number SUB_USER_AUTH_MATRIX_0199
     * @tc.desc   Verify AuthType string FACE_ONLY (49).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0199', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0199 begin');
      const authType: userAuth.AuthType = 'FACE_ONLY';
      expect(authType).assertEqual('FACE_ONLY');
      expect(authType.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0199 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0200
     * @tc.number SUB_USER_AUTH_MATRIX_0200
     * @tc.desc   Verify AuthType string ALL (50).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0200 begin');
      const authType: userAuth.AuthType = 'ALL';
      expect(authType).assertEqual('ALL');
      expect(authType.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0200 end');
    })
  })
}
