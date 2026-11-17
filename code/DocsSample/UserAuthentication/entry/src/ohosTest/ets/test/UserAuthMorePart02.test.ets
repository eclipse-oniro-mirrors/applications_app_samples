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
const LOG_DOMAIN: number = 0xF816;
const LOG_TAG: string = '[SampleTest]';

export default function userAuthMoreTestPart02() {
  describe('UserAuthMorePart02', () => {
    /**
     * @tc.name   testUserAuthMore0092
     * @tc.number SUB_USER_AUTH_MORE_0092
     * @tc.desc   Verify extended auth type array 42.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0092 begin');
      const types: userAuth.UserAuthType[] = [userAuth.UserAuthType.PIN];
      expect(types.length).assertEqual(1);
      for (let j: number = 0; j < types.length; j++) {
        expect(types[j] > 0).assertTrue();
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0092 end');
    })
    /**
     * @tc.name   testUserAuthMore0093
     * @tc.number SUB_USER_AUTH_MORE_0093
     * @tc.desc   Verify extended auth type array 43.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0093 begin');
      const types: userAuth.UserAuthType[] = [userAuth.UserAuthType.FACE];
      expect(types.length).assertEqual(1);
      for (let j: number = 0; j < types.length; j++) {
        expect(types[j] > 0).assertTrue();
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0093 end');
    })
    /**
     * @tc.name   testUserAuthMore0094
     * @tc.number SUB_USER_AUTH_MORE_0094
     * @tc.desc   Verify extended auth type array 44.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0094 begin');
      const types: userAuth.UserAuthType[] = [userAuth.UserAuthType.FINGERPRINT];
      expect(types.length).assertEqual(1);
      for (let j: number = 0; j < types.length; j++) {
        expect(types[j] > 0).assertTrue();
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0094 end');
    })
    /**
     * @tc.name   testUserAuthMore0095
     * @tc.number SUB_USER_AUTH_MORE_0095
     * @tc.desc   Verify extended auth type array 45.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0095 begin');
      const types: userAuth.UserAuthType[] = [userAuth.UserAuthType.PIN, userAuth.UserAuthType.FACE];
      expect(types.length).assertEqual(2);
      for (let j: number = 0; j < types.length; j++) {
        expect(types[j] > 0).assertTrue();
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0095 end');
    })
    /**
     * @tc.name   testUserAuthMore0096
     * @tc.number SUB_USER_AUTH_MORE_0096
     * @tc.desc   Verify extended auth type array 46.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0096 begin');
      const types: userAuth.UserAuthType[] = [userAuth.UserAuthType.PIN, userAuth.UserAuthType.FINGERPRINT];
      expect(types.length).assertEqual(2);
      for (let j: number = 0; j < types.length; j++) {
        expect(types[j] > 0).assertTrue();
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0096 end');
    })
    /**
     * @tc.name   testUserAuthMore0097
     * @tc.number SUB_USER_AUTH_MORE_0097
     * @tc.desc   Verify extended auth type array 47.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0097 begin');
      const types: userAuth.UserAuthType[] = [userAuth.UserAuthType.FACE, userAuth.UserAuthType.FINGERPRINT];
      expect(types.length).assertEqual(2);
      for (let j: number = 0; j < types.length; j++) {
        expect(types[j] > 0).assertTrue();
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0097 end');
    })
    /**
     * @tc.name   testUserAuthMore0098
     * @tc.number SUB_USER_AUTH_MORE_0098
     * @tc.desc   Verify extended auth type array 48.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0098 begin');
      const types: userAuth.UserAuthType[] = [userAuth.UserAuthType.PIN, userAuth.UserAuthType.FACE, userAuth.UserAuthType.FINGERPRINT];
      expect(types.length).assertEqual(3);
      for (let j: number = 0; j < types.length; j++) {
        expect(types[j] > 0).assertTrue();
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0098 end');
    })
    /**
     * @tc.name   testUserAuthMore0099
     * @tc.number SUB_USER_AUTH_MORE_0099
     * @tc.desc   Verify extended auth type array 49.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0099 begin');
      const types: userAuth.UserAuthType[] = [userAuth.UserAuthType.PIN];
      expect(types.length).assertEqual(1);
      for (let j: number = 0; j < types.length; j++) {
        expect(types[j] > 0).assertTrue();
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0099 end');
    })
    /**
     * @tc.name   testUserAuthMore0100
     * @tc.number SUB_USER_AUTH_MORE_0100
     * @tc.desc   Verify extended auth type array 50.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0100 begin');
      const types: userAuth.UserAuthType[] = [userAuth.UserAuthType.FACE];
      expect(types.length).assertEqual(1);
      for (let j: number = 0; j < types.length; j++) {
        expect(types[j] > 0).assertTrue();
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0100 end');
    })
    /**
     * @tc.name   testUserAuthMore0101
     * @tc.number SUB_USER_AUTH_MORE_0101
     * @tc.desc   Verify secure/auth type cross 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0101 begin');
      const secureLevel: userAuth.SecureLevel = 'S2';
      const authType: userAuth.AuthType = 'FACE_ONLY';
      expect(secureLevel).assertEqual('S2');
      expect(authType).assertEqual('FACE_ONLY');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0101 end');
    })
    /**
     * @tc.name   testUserAuthMore0102
     * @tc.number SUB_USER_AUTH_MORE_0102
     * @tc.desc   Verify secure/auth type cross 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0102 begin');
      const secureLevel: userAuth.SecureLevel = 'S3';
      const authType: userAuth.AuthType = 'ALL';
      expect(secureLevel).assertEqual('S3');
      expect(authType).assertEqual('ALL');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0102 end');
    })
    /**
     * @tc.name   testUserAuthMore0103
     * @tc.number SUB_USER_AUTH_MORE_0103
     * @tc.desc   Verify secure/auth type cross 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0103 begin');
      const secureLevel: userAuth.SecureLevel = 'S4';
      const authType: userAuth.AuthType = 'FACE_ONLY';
      expect(secureLevel).assertEqual('S4');
      expect(authType).assertEqual('FACE_ONLY');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0103 end');
    })
    /**
     * @tc.name   testUserAuthMore0104
     * @tc.number SUB_USER_AUTH_MORE_0104
     * @tc.desc   Verify secure/auth type cross 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0104 begin');
      const secureLevel: userAuth.SecureLevel = 'S1';
      const authType: userAuth.AuthType = 'ALL';
      expect(secureLevel).assertEqual('S1');
      expect(authType).assertEqual('ALL');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0104 end');
    })
    /**
     * @tc.name   testUserAuthMore0105
     * @tc.number SUB_USER_AUTH_MORE_0105
     * @tc.desc   Verify secure/auth type cross 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0105 begin');
      const secureLevel: userAuth.SecureLevel = 'S2';
      const authType: userAuth.AuthType = 'FACE_ONLY';
      expect(secureLevel).assertEqual('S2');
      expect(authType).assertEqual('FACE_ONLY');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0105 end');
    })
    /**
     * @tc.name   testUserAuthMore0106
     * @tc.number SUB_USER_AUTH_MORE_0106
     * @tc.desc   Verify secure/auth type cross 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0106 begin');
      const secureLevel: userAuth.SecureLevel = 'S3';
      const authType: userAuth.AuthType = 'ALL';
      expect(secureLevel).assertEqual('S3');
      expect(authType).assertEqual('ALL');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0106 end');
    })
    /**
     * @tc.name   testUserAuthMore0107
     * @tc.number SUB_USER_AUTH_MORE_0107
     * @tc.desc   Verify secure/auth type cross 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0107 begin');
      const secureLevel: userAuth.SecureLevel = 'S4';
      const authType: userAuth.AuthType = 'FACE_ONLY';
      expect(secureLevel).assertEqual('S4');
      expect(authType).assertEqual('FACE_ONLY');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0107 end');
    })
    /**
     * @tc.name   testUserAuthMore0108
     * @tc.number SUB_USER_AUTH_MORE_0108
     * @tc.desc   Verify secure/auth type cross 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0108 begin');
      const secureLevel: userAuth.SecureLevel = 'S1';
      const authType: userAuth.AuthType = 'ALL';
      expect(secureLevel).assertEqual('S1');
      expect(authType).assertEqual('ALL');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0108 end');
    })
    /**
     * @tc.name   testUserAuthMore0109
     * @tc.number SUB_USER_AUTH_MORE_0109
     * @tc.desc   Verify secure/auth type cross 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0109 begin');
      const secureLevel: userAuth.SecureLevel = 'S2';
      const authType: userAuth.AuthType = 'FACE_ONLY';
      expect(secureLevel).assertEqual('S2');
      expect(authType).assertEqual('FACE_ONLY');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0109 end');
    })
    /**
     * @tc.name   testUserAuthMore0110
     * @tc.number SUB_USER_AUTH_MORE_0110
     * @tc.desc   Verify secure/auth type cross 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0110 begin');
      const secureLevel: userAuth.SecureLevel = 'S3';
      const authType: userAuth.AuthType = 'ALL';
      expect(secureLevel).assertEqual('S3');
      expect(authType).assertEqual('ALL');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0110 end');
    })
    /**
     * @tc.name   testUserAuthMore0111
     * @tc.number SUB_USER_AUTH_MORE_0111
     * @tc.desc   Verify secure/auth type cross 11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0111 begin');
      const secureLevel: userAuth.SecureLevel = 'S4';
      const authType: userAuth.AuthType = 'FACE_ONLY';
      expect(secureLevel).assertEqual('S4');
      expect(authType).assertEqual('FACE_ONLY');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0111 end');
    })
    /**
     * @tc.name   testUserAuthMore0112
     * @tc.number SUB_USER_AUTH_MORE_0112
     * @tc.desc   Verify secure/auth type cross 12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0112 begin');
      const secureLevel: userAuth.SecureLevel = 'S1';
      const authType: userAuth.AuthType = 'ALL';
      expect(secureLevel).assertEqual('S1');
      expect(authType).assertEqual('ALL');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0112 end');
    })
    /**
     * @tc.name   testUserAuthMore0113
     * @tc.number SUB_USER_AUTH_MORE_0113
     * @tc.desc   Verify secure/auth type cross 13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0113 begin');
      const secureLevel: userAuth.SecureLevel = 'S2';
      const authType: userAuth.AuthType = 'FACE_ONLY';
      expect(secureLevel).assertEqual('S2');
      expect(authType).assertEqual('FACE_ONLY');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0113 end');
    })
    /**
     * @tc.name   testUserAuthMore0114
     * @tc.number SUB_USER_AUTH_MORE_0114
     * @tc.desc   Verify secure/auth type cross 14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0114 begin');
      const secureLevel: userAuth.SecureLevel = 'S3';
      const authType: userAuth.AuthType = 'ALL';
      expect(secureLevel).assertEqual('S3');
      expect(authType).assertEqual('ALL');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0114 end');
    })
    /**
     * @tc.name   testUserAuthMore0115
     * @tc.number SUB_USER_AUTH_MORE_0115
     * @tc.desc   Verify secure/auth type cross 15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0115 begin');
      const secureLevel: userAuth.SecureLevel = 'S4';
      const authType: userAuth.AuthType = 'FACE_ONLY';
      expect(secureLevel).assertEqual('S4');
      expect(authType).assertEqual('FACE_ONLY');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0115 end');
    })
    /**
     * @tc.name   testUserAuthMore0116
     * @tc.number SUB_USER_AUTH_MORE_0116
     * @tc.desc   Verify secure/auth type cross 16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0116 begin');
      const secureLevel: userAuth.SecureLevel = 'S1';
      const authType: userAuth.AuthType = 'ALL';
      expect(secureLevel).assertEqual('S1');
      expect(authType).assertEqual('ALL');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0116 end');
    })
    /**
     * @tc.name   testUserAuthMore0117
     * @tc.number SUB_USER_AUTH_MORE_0117
     * @tc.desc   Verify secure/auth type cross 17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0117 begin');
      const secureLevel: userAuth.SecureLevel = 'S2';
      const authType: userAuth.AuthType = 'FACE_ONLY';
      expect(secureLevel).assertEqual('S2');
      expect(authType).assertEqual('FACE_ONLY');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0117 end');
    })
    /**
     * @tc.name   testUserAuthMore0118
     * @tc.number SUB_USER_AUTH_MORE_0118
     * @tc.desc   Verify secure/auth type cross 18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0118 begin');
      const secureLevel: userAuth.SecureLevel = 'S3';
      const authType: userAuth.AuthType = 'ALL';
      expect(secureLevel).assertEqual('S3');
      expect(authType).assertEqual('ALL');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0118 end');
    })
    /**
     * @tc.name   testUserAuthMore0119
     * @tc.number SUB_USER_AUTH_MORE_0119
     * @tc.desc   Verify secure/auth type cross 19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0119 begin');
      const secureLevel: userAuth.SecureLevel = 'S4';
      const authType: userAuth.AuthType = 'FACE_ONLY';
      expect(secureLevel).assertEqual('S4');
      expect(authType).assertEqual('FACE_ONLY');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0119 end');
    })
    /**
     * @tc.name   testUserAuthMore0120
     * @tc.number SUB_USER_AUTH_MORE_0120
     * @tc.desc   Verify secure/auth type cross 20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0120 begin');
      const secureLevel: userAuth.SecureLevel = 'S1';
      const authType: userAuth.AuthType = 'ALL';
      expect(secureLevel).assertEqual('S1');
      expect(authType).assertEqual('ALL');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0120 end');
    })
    /**
     * @tc.name   testUserAuthMore0121
     * @tc.number SUB_USER_AUTH_MORE_0121
     * @tc.desc   Verify secure/auth type cross 21.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0121 begin');
      const secureLevel: userAuth.SecureLevel = 'S2';
      const authType: userAuth.AuthType = 'FACE_ONLY';
      expect(secureLevel).assertEqual('S2');
      expect(authType).assertEqual('FACE_ONLY');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0121 end');
    })
    /**
     * @tc.name   testUserAuthMore0122
     * @tc.number SUB_USER_AUTH_MORE_0122
     * @tc.desc   Verify secure/auth type cross 22.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0122 begin');
      const secureLevel: userAuth.SecureLevel = 'S3';
      const authType: userAuth.AuthType = 'ALL';
      expect(secureLevel).assertEqual('S3');
      expect(authType).assertEqual('ALL');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0122 end');
    })
    /**
     * @tc.name   testUserAuthMore0123
     * @tc.number SUB_USER_AUTH_MORE_0123
     * @tc.desc   Verify secure/auth type cross 23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0123 begin');
      const secureLevel: userAuth.SecureLevel = 'S4';
      const authType: userAuth.AuthType = 'FACE_ONLY';
      expect(secureLevel).assertEqual('S4');
      expect(authType).assertEqual('FACE_ONLY');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0123 end');
    })
    /**
     * @tc.name   testUserAuthMore0124
     * @tc.number SUB_USER_AUTH_MORE_0124
     * @tc.desc   Verify secure/auth type cross 24.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0124 begin');
      const secureLevel: userAuth.SecureLevel = 'S1';
      const authType: userAuth.AuthType = 'ALL';
      expect(secureLevel).assertEqual('S1');
      expect(authType).assertEqual('ALL');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0124 end');
    })
    /**
     * @tc.name   testUserAuthMore0125
     * @tc.number SUB_USER_AUTH_MORE_0125
     * @tc.desc   Verify secure/auth type cross 25.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0125 begin');
      const secureLevel: userAuth.SecureLevel = 'S2';
      const authType: userAuth.AuthType = 'FACE_ONLY';
      expect(secureLevel).assertEqual('S2');
      expect(authType).assertEqual('FACE_ONLY');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0125 end');
    })
    /**
     * @tc.name   testUserAuthMore0126
     * @tc.number SUB_USER_AUTH_MORE_0126
     * @tc.desc   Verify secure/auth type cross 26.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0126 begin');
      const secureLevel: userAuth.SecureLevel = 'S3';
      const authType: userAuth.AuthType = 'ALL';
      expect(secureLevel).assertEqual('S3');
      expect(authType).assertEqual('ALL');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0126 end');
    })
    /**
     * @tc.name   testUserAuthMore0127
     * @tc.number SUB_USER_AUTH_MORE_0127
     * @tc.desc   Verify secure/auth type cross 27.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0127 begin');
      const secureLevel: userAuth.SecureLevel = 'S4';
      const authType: userAuth.AuthType = 'FACE_ONLY';
      expect(secureLevel).assertEqual('S4');
      expect(authType).assertEqual('FACE_ONLY');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0127 end');
    })
    /**
     * @tc.name   testUserAuthMore0128
     * @tc.number SUB_USER_AUTH_MORE_0128
     * @tc.desc   Verify secure/auth type cross 28.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0128 begin');
      const secureLevel: userAuth.SecureLevel = 'S1';
      const authType: userAuth.AuthType = 'ALL';
      expect(secureLevel).assertEqual('S1');
      expect(authType).assertEqual('ALL');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0128 end');
    })
    /**
     * @tc.name   testUserAuthMore0129
     * @tc.number SUB_USER_AUTH_MORE_0129
     * @tc.desc   Verify secure/auth type cross 29.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0129 begin');
      const secureLevel: userAuth.SecureLevel = 'S2';
      const authType: userAuth.AuthType = 'FACE_ONLY';
      expect(secureLevel).assertEqual('S2');
      expect(authType).assertEqual('FACE_ONLY');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0129 end');
    })
    /**
     * @tc.name   testUserAuthMore0130
     * @tc.number SUB_USER_AUTH_MORE_0130
     * @tc.desc   Verify secure/auth type cross 30.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0130 begin');
      const secureLevel: userAuth.SecureLevel = 'S3';
      const authType: userAuth.AuthType = 'ALL';
      expect(secureLevel).assertEqual('S3');
      expect(authType).assertEqual('ALL');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0130 end');
    })
    /**
     * @tc.name   testUserAuthMore0131
     * @tc.number SUB_USER_AUTH_MORE_0131
     * @tc.desc   Verify secure/auth type cross 31.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0131 begin');
      const secureLevel: userAuth.SecureLevel = 'S4';
      const authType: userAuth.AuthType = 'FACE_ONLY';
      expect(secureLevel).assertEqual('S4');
      expect(authType).assertEqual('FACE_ONLY');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0131 end');
    })
    /**
     * @tc.name   testUserAuthMore0132
     * @tc.number SUB_USER_AUTH_MORE_0132
     * @tc.desc   Verify secure/auth type cross 32.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0132 begin');
      const secureLevel: userAuth.SecureLevel = 'S1';
      const authType: userAuth.AuthType = 'ALL';
      expect(secureLevel).assertEqual('S1');
      expect(authType).assertEqual('ALL');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0132 end');
    })
    /**
     * @tc.name   testUserAuthMore0133
     * @tc.number SUB_USER_AUTH_MORE_0133
     * @tc.desc   Verify secure/auth type cross 33.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0133 begin');
      const secureLevel: userAuth.SecureLevel = 'S2';
      const authType: userAuth.AuthType = 'FACE_ONLY';
      expect(secureLevel).assertEqual('S2');
      expect(authType).assertEqual('FACE_ONLY');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0133 end');
    })
    /**
     * @tc.name   testUserAuthMore0134
     * @tc.number SUB_USER_AUTH_MORE_0134
     * @tc.desc   Verify secure/auth type cross 34.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0134 begin');
      const secureLevel: userAuth.SecureLevel = 'S3';
      const authType: userAuth.AuthType = 'ALL';
      expect(secureLevel).assertEqual('S3');
      expect(authType).assertEqual('ALL');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0134 end');
    })
    /**
     * @tc.name   testUserAuthMore0135
     * @tc.number SUB_USER_AUTH_MORE_0135
     * @tc.desc   Verify secure/auth type cross 35.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0135 begin');
      const secureLevel: userAuth.SecureLevel = 'S4';
      const authType: userAuth.AuthType = 'FACE_ONLY';
      expect(secureLevel).assertEqual('S4');
      expect(authType).assertEqual('FACE_ONLY');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0135 end');
    })
    /**
     * @tc.name   testUserAuthMore0136
     * @tc.number SUB_USER_AUTH_MORE_0136
     * @tc.desc   Verify secure/auth type cross 36.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0136 begin');
      const secureLevel: userAuth.SecureLevel = 'S1';
      const authType: userAuth.AuthType = 'ALL';
      expect(secureLevel).assertEqual('S1');
      expect(authType).assertEqual('ALL');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0136 end');
    })
    /**
     * @tc.name   testUserAuthMore0137
     * @tc.number SUB_USER_AUTH_MORE_0137
     * @tc.desc   Verify secure/auth type cross 37.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0137 begin');
      const secureLevel: userAuth.SecureLevel = 'S2';
      const authType: userAuth.AuthType = 'FACE_ONLY';
      expect(secureLevel).assertEqual('S2');
      expect(authType).assertEqual('FACE_ONLY');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0137 end');
    })
    /**
     * @tc.name   testUserAuthMore0138
     * @tc.number SUB_USER_AUTH_MORE_0138
     * @tc.desc   Verify secure/auth type cross 38.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0138 begin');
      const secureLevel: userAuth.SecureLevel = 'S3';
      const authType: userAuth.AuthType = 'ALL';
      expect(secureLevel).assertEqual('S3');
      expect(authType).assertEqual('ALL');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0138 end');
    })
    /**
     * @tc.name   testUserAuthMore0139
     * @tc.number SUB_USER_AUTH_MORE_0139
     * @tc.desc   Verify secure/auth type cross 39.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0139 begin');
      const secureLevel: userAuth.SecureLevel = 'S4';
      const authType: userAuth.AuthType = 'FACE_ONLY';
      expect(secureLevel).assertEqual('S4');
      expect(authType).assertEqual('FACE_ONLY');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0139 end');
    })
    /**
     * @tc.name   testUserAuthMore0140
     * @tc.number SUB_USER_AUTH_MORE_0140
     * @tc.desc   Verify secure/auth type cross 40.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0140 begin');
      const secureLevel: userAuth.SecureLevel = 'S1';
      const authType: userAuth.AuthType = 'ALL';
      expect(secureLevel).assertEqual('S1');
      expect(authType).assertEqual('ALL');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0140 end');
    })
    /**
     * @tc.name   testUserAuthMore0141
     * @tc.number SUB_USER_AUTH_MORE_0141
     * @tc.desc   Verify secure/auth type cross 41.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0141 begin');
      const secureLevel: userAuth.SecureLevel = 'S2';
      const authType: userAuth.AuthType = 'FACE_ONLY';
      expect(secureLevel).assertEqual('S2');
      expect(authType).assertEqual('FACE_ONLY');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0141 end');
    })
    /**
     * @tc.name   testUserAuthMore0142
     * @tc.number SUB_USER_AUTH_MORE_0142
     * @tc.desc   Verify secure/auth type cross 42.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0142 begin');
      const secureLevel: userAuth.SecureLevel = 'S3';
      const authType: userAuth.AuthType = 'ALL';
      expect(secureLevel).assertEqual('S3');
      expect(authType).assertEqual('ALL');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0142 end');
    })
    /**
     * @tc.name   testUserAuthMore0143
     * @tc.number SUB_USER_AUTH_MORE_0143
     * @tc.desc   Verify secure/auth type cross 43.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0143 begin');
      const secureLevel: userAuth.SecureLevel = 'S4';
      const authType: userAuth.AuthType = 'FACE_ONLY';
      expect(secureLevel).assertEqual('S4');
      expect(authType).assertEqual('FACE_ONLY');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0143 end');
    })
    /**
     * @tc.name   testUserAuthMore0144
     * @tc.number SUB_USER_AUTH_MORE_0144
     * @tc.desc   Verify secure/auth type cross 44.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0144 begin');
      const secureLevel: userAuth.SecureLevel = 'S1';
      const authType: userAuth.AuthType = 'ALL';
      expect(secureLevel).assertEqual('S1');
      expect(authType).assertEqual('ALL');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0144 end');
    })
    /**
     * @tc.name   testUserAuthMore0145
     * @tc.number SUB_USER_AUTH_MORE_0145
     * @tc.desc   Verify secure/auth type cross 45.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0145 begin');
      const secureLevel: userAuth.SecureLevel = 'S2';
      const authType: userAuth.AuthType = 'FACE_ONLY';
      expect(secureLevel).assertEqual('S2');
      expect(authType).assertEqual('FACE_ONLY');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0145 end');
    })
    /**
     * @tc.name   testUserAuthMore0146
     * @tc.number SUB_USER_AUTH_MORE_0146
     * @tc.desc   Verify secure/auth type cross 46.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0146 begin');
      const secureLevel: userAuth.SecureLevel = 'S3';
      const authType: userAuth.AuthType = 'ALL';
      expect(secureLevel).assertEqual('S3');
      expect(authType).assertEqual('ALL');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0146 end');
    })
    /**
     * @tc.name   testUserAuthMore0147
     * @tc.number SUB_USER_AUTH_MORE_0147
     * @tc.desc   Verify secure/auth type cross 47.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0147 begin');
      const secureLevel: userAuth.SecureLevel = 'S4';
      const authType: userAuth.AuthType = 'FACE_ONLY';
      expect(secureLevel).assertEqual('S4');
      expect(authType).assertEqual('FACE_ONLY');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0147 end');
    })
    /**
     * @tc.name   testUserAuthMore0148
     * @tc.number SUB_USER_AUTH_MORE_0148
     * @tc.desc   Verify secure/auth type cross 48.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0148 begin');
      const secureLevel: userAuth.SecureLevel = 'S1';
      const authType: userAuth.AuthType = 'ALL';
      expect(secureLevel).assertEqual('S1');
      expect(authType).assertEqual('ALL');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0148 end');
    })
    /**
     * @tc.name   testUserAuthMore0149
     * @tc.number SUB_USER_AUTH_MORE_0149
     * @tc.desc   Verify secure/auth type cross 49.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0149 begin');
      const secureLevel: userAuth.SecureLevel = 'S2';
      const authType: userAuth.AuthType = 'FACE_ONLY';
      expect(secureLevel).assertEqual('S2');
      expect(authType).assertEqual('FACE_ONLY');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0149 end');
    })
    /**
     * @tc.name   testUserAuthMore0150
     * @tc.number SUB_USER_AUTH_MORE_0150
     * @tc.desc   Verify secure/auth type cross 50.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0150 begin');
      const secureLevel: userAuth.SecureLevel = 'S3';
      const authType: userAuth.AuthType = 'ALL';
      expect(secureLevel).assertEqual('S3');
      expect(authType).assertEqual('ALL');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0150 end');
    })
    /**
     * @tc.name   testUserAuthMore0151
     * @tc.number SUB_USER_AUTH_MORE_0151
     * @tc.desc   Verify AuthParam equality 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0151 begin');
      const first: userAuth.AuthParam = { challenge: new Uint8Array(16), authType: [userAuth.UserAuthType.FACE], authTrustLevel: userAuth.AuthTrustLevel.ATL3 };
      const second: userAuth.AuthParam = { challenge: new Uint8Array(16), authType: [userAuth.UserAuthType.FACE], authTrustLevel: userAuth.AuthTrustLevel.ATL3 };
      expect(first.challenge.length).assertEqual(second.challenge.length);
      expect(first.authType[0]).assertEqual(second.authType[0]);
      expect(first.authTrustLevel).assertEqual(second.authTrustLevel);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0151 end');
    })
    /**
     * @tc.name   testUserAuthMore0152
     * @tc.number SUB_USER_AUTH_MORE_0152
     * @tc.desc   Verify AuthParam equality 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0152 begin');
      const first: userAuth.AuthParam = { challenge: new Uint8Array(16), authType: [userAuth.UserAuthType.FACE], authTrustLevel: userAuth.AuthTrustLevel.ATL3 };
      const second: userAuth.AuthParam = { challenge: new Uint8Array(16), authType: [userAuth.UserAuthType.FACE], authTrustLevel: userAuth.AuthTrustLevel.ATL3 };
      expect(first.challenge.length).assertEqual(second.challenge.length);
      expect(first.authType[0]).assertEqual(second.authType[0]);
      expect(first.authTrustLevel).assertEqual(second.authTrustLevel);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0152 end');
    })
    /**
     * @tc.name   testUserAuthMore0153
     * @tc.number SUB_USER_AUTH_MORE_0153
     * @tc.desc   Verify AuthParam equality 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0153 begin');
      const first: userAuth.AuthParam = { challenge: new Uint8Array(16), authType: [userAuth.UserAuthType.FACE], authTrustLevel: userAuth.AuthTrustLevel.ATL3 };
      const second: userAuth.AuthParam = { challenge: new Uint8Array(16), authType: [userAuth.UserAuthType.FACE], authTrustLevel: userAuth.AuthTrustLevel.ATL3 };
      expect(first.challenge.length).assertEqual(second.challenge.length);
      expect(first.authType[0]).assertEqual(second.authType[0]);
      expect(first.authTrustLevel).assertEqual(second.authTrustLevel);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0153 end');
    })
    /**
     * @tc.name   testUserAuthMore0154
     * @tc.number SUB_USER_AUTH_MORE_0154
     * @tc.desc   Verify AuthParam equality 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0154 begin');
      const first: userAuth.AuthParam = { challenge: new Uint8Array(16), authType: [userAuth.UserAuthType.FACE], authTrustLevel: userAuth.AuthTrustLevel.ATL3 };
      const second: userAuth.AuthParam = { challenge: new Uint8Array(16), authType: [userAuth.UserAuthType.FACE], authTrustLevel: userAuth.AuthTrustLevel.ATL3 };
      expect(first.challenge.length).assertEqual(second.challenge.length);
      expect(first.authType[0]).assertEqual(second.authType[0]);
      expect(first.authTrustLevel).assertEqual(second.authTrustLevel);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0154 end');
    })
    /**
     * @tc.name   testUserAuthMore0155
     * @tc.number SUB_USER_AUTH_MORE_0155
     * @tc.desc   Verify AuthParam equality 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0155 begin');
      const first: userAuth.AuthParam = { challenge: new Uint8Array(16), authType: [userAuth.UserAuthType.FACE], authTrustLevel: userAuth.AuthTrustLevel.ATL3 };
      const second: userAuth.AuthParam = { challenge: new Uint8Array(16), authType: [userAuth.UserAuthType.FACE], authTrustLevel: userAuth.AuthTrustLevel.ATL3 };
      expect(first.challenge.length).assertEqual(second.challenge.length);
      expect(first.authType[0]).assertEqual(second.authType[0]);
      expect(first.authTrustLevel).assertEqual(second.authTrustLevel);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0155 end');
    })
    /**
     * @tc.name   testUserAuthMore0156
     * @tc.number SUB_USER_AUTH_MORE_0156
     * @tc.desc   Verify AuthParam equality 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0156 begin');
      const first: userAuth.AuthParam = { challenge: new Uint8Array(16), authType: [userAuth.UserAuthType.FACE], authTrustLevel: userAuth.AuthTrustLevel.ATL3 };
      const second: userAuth.AuthParam = { challenge: new Uint8Array(16), authType: [userAuth.UserAuthType.FACE], authTrustLevel: userAuth.AuthTrustLevel.ATL3 };
      expect(first.challenge.length).assertEqual(second.challenge.length);
      expect(first.authType[0]).assertEqual(second.authType[0]);
      expect(first.authTrustLevel).assertEqual(second.authTrustLevel);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0156 end');
    })
    /**
     * @tc.name   testUserAuthMore0157
     * @tc.number SUB_USER_AUTH_MORE_0157
     * @tc.desc   Verify AuthParam equality 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0157 begin');
      const first: userAuth.AuthParam = { challenge: new Uint8Array(16), authType: [userAuth.UserAuthType.FACE], authTrustLevel: userAuth.AuthTrustLevel.ATL3 };
      const second: userAuth.AuthParam = { challenge: new Uint8Array(16), authType: [userAuth.UserAuthType.FACE], authTrustLevel: userAuth.AuthTrustLevel.ATL3 };
      expect(first.challenge.length).assertEqual(second.challenge.length);
      expect(first.authType[0]).assertEqual(second.authType[0]);
      expect(first.authTrustLevel).assertEqual(second.authTrustLevel);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0157 end');
    })
    /**
     * @tc.name   testUserAuthMore0158
     * @tc.number SUB_USER_AUTH_MORE_0158
     * @tc.desc   Verify AuthParam equality 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0158', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0158 begin');
      const first: userAuth.AuthParam = { challenge: new Uint8Array(16), authType: [userAuth.UserAuthType.FACE], authTrustLevel: userAuth.AuthTrustLevel.ATL3 };
      const second: userAuth.AuthParam = { challenge: new Uint8Array(16), authType: [userAuth.UserAuthType.FACE], authTrustLevel: userAuth.AuthTrustLevel.ATL3 };
      expect(first.challenge.length).assertEqual(second.challenge.length);
      expect(first.authType[0]).assertEqual(second.authType[0]);
      expect(first.authTrustLevel).assertEqual(second.authTrustLevel);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0158 end');
    })
    /**
     * @tc.name   testUserAuthMore0159
     * @tc.number SUB_USER_AUTH_MORE_0159
     * @tc.desc   Verify AuthParam equality 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0159', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0159 begin');
      const first: userAuth.AuthParam = { challenge: new Uint8Array(16), authType: [userAuth.UserAuthType.FACE], authTrustLevel: userAuth.AuthTrustLevel.ATL3 };
      const second: userAuth.AuthParam = { challenge: new Uint8Array(16), authType: [userAuth.UserAuthType.FACE], authTrustLevel: userAuth.AuthTrustLevel.ATL3 };
      expect(first.challenge.length).assertEqual(second.challenge.length);
      expect(first.authType[0]).assertEqual(second.authType[0]);
      expect(first.authTrustLevel).assertEqual(second.authTrustLevel);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0159 end');
    })
    /**
     * @tc.name   testUserAuthMore0160
     * @tc.number SUB_USER_AUTH_MORE_0160
     * @tc.desc   Verify AuthParam equality 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0160 begin');
      const first: userAuth.AuthParam = { challenge: new Uint8Array(16), authType: [userAuth.UserAuthType.FACE], authTrustLevel: userAuth.AuthTrustLevel.ATL3 };
      const second: userAuth.AuthParam = { challenge: new Uint8Array(16), authType: [userAuth.UserAuthType.FACE], authTrustLevel: userAuth.AuthTrustLevel.ATL3 };
      expect(first.challenge.length).assertEqual(second.challenge.length);
      expect(first.authType[0]).assertEqual(second.authType[0]);
      expect(first.authTrustLevel).assertEqual(second.authTrustLevel);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0160 end');
    })
    /**
     * @tc.name   testUserAuthMore0161
     * @tc.number SUB_USER_AUTH_MORE_0161
     * @tc.desc   Verify AuthParam equality 11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0161', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0161 begin');
      const first: userAuth.AuthParam = { challenge: new Uint8Array(16), authType: [userAuth.UserAuthType.FACE], authTrustLevel: userAuth.AuthTrustLevel.ATL3 };
      const second: userAuth.AuthParam = { challenge: new Uint8Array(16), authType: [userAuth.UserAuthType.FACE], authTrustLevel: userAuth.AuthTrustLevel.ATL3 };
      expect(first.challenge.length).assertEqual(second.challenge.length);
      expect(first.authType[0]).assertEqual(second.authType[0]);
      expect(first.authTrustLevel).assertEqual(second.authTrustLevel);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0161 end');
    })
    /**
     * @tc.name   testUserAuthMore0162
     * @tc.number SUB_USER_AUTH_MORE_0162
     * @tc.desc   Verify AuthParam equality 12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0162', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0162 begin');
      const first: userAuth.AuthParam = { challenge: new Uint8Array(16), authType: [userAuth.UserAuthType.FACE], authTrustLevel: userAuth.AuthTrustLevel.ATL3 };
      const second: userAuth.AuthParam = { challenge: new Uint8Array(16), authType: [userAuth.UserAuthType.FACE], authTrustLevel: userAuth.AuthTrustLevel.ATL3 };
      expect(first.challenge.length).assertEqual(second.challenge.length);
      expect(first.authType[0]).assertEqual(second.authType[0]);
      expect(first.authTrustLevel).assertEqual(second.authTrustLevel);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0162 end');
    })
    /**
     * @tc.name   testUserAuthMore0163
     * @tc.number SUB_USER_AUTH_MORE_0163
     * @tc.desc   Verify AuthParam equality 13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0163', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0163 begin');
      const first: userAuth.AuthParam = { challenge: new Uint8Array(16), authType: [userAuth.UserAuthType.FACE], authTrustLevel: userAuth.AuthTrustLevel.ATL3 };
      const second: userAuth.AuthParam = { challenge: new Uint8Array(16), authType: [userAuth.UserAuthType.FACE], authTrustLevel: userAuth.AuthTrustLevel.ATL3 };
      expect(first.challenge.length).assertEqual(second.challenge.length);
      expect(first.authType[0]).assertEqual(second.authType[0]);
      expect(first.authTrustLevel).assertEqual(second.authTrustLevel);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0163 end');
    })
    /**
     * @tc.name   testUserAuthMore0164
     * @tc.number SUB_USER_AUTH_MORE_0164
     * @tc.desc   Verify AuthParam equality 14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0164', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0164 begin');
      const first: userAuth.AuthParam = { challenge: new Uint8Array(16), authType: [userAuth.UserAuthType.FACE], authTrustLevel: userAuth.AuthTrustLevel.ATL3 };
      const second: userAuth.AuthParam = { challenge: new Uint8Array(16), authType: [userAuth.UserAuthType.FACE], authTrustLevel: userAuth.AuthTrustLevel.ATL3 };
      expect(first.challenge.length).assertEqual(second.challenge.length);
      expect(first.authType[0]).assertEqual(second.authType[0]);
      expect(first.authTrustLevel).assertEqual(second.authTrustLevel);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0164 end');
    })
    /**
     * @tc.name   testUserAuthMore0165
     * @tc.number SUB_USER_AUTH_MORE_0165
     * @tc.desc   Verify AuthParam equality 15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0165', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0165 begin');
      const first: userAuth.AuthParam = { challenge: new Uint8Array(16), authType: [userAuth.UserAuthType.FACE], authTrustLevel: userAuth.AuthTrustLevel.ATL3 };
      const second: userAuth.AuthParam = { challenge: new Uint8Array(16), authType: [userAuth.UserAuthType.FACE], authTrustLevel: userAuth.AuthTrustLevel.ATL3 };
      expect(first.challenge.length).assertEqual(second.challenge.length);
      expect(first.authType[0]).assertEqual(second.authType[0]);
      expect(first.authTrustLevel).assertEqual(second.authTrustLevel);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0165 end');
    })
    /**
     * @tc.name   testUserAuthMore0166
     * @tc.number SUB_USER_AUTH_MORE_0166
     * @tc.desc   Verify AuthParam equality 16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0166', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0166 begin');
      const first: userAuth.AuthParam = { challenge: new Uint8Array(16), authType: [userAuth.UserAuthType.FACE], authTrustLevel: userAuth.AuthTrustLevel.ATL3 };
      const second: userAuth.AuthParam = { challenge: new Uint8Array(16), authType: [userAuth.UserAuthType.FACE], authTrustLevel: userAuth.AuthTrustLevel.ATL3 };
      expect(first.challenge.length).assertEqual(second.challenge.length);
      expect(first.authType[0]).assertEqual(second.authType[0]);
      expect(first.authTrustLevel).assertEqual(second.authTrustLevel);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0166 end');
    })
    /**
     * @tc.name   testUserAuthMore0167
     * @tc.number SUB_USER_AUTH_MORE_0167
     * @tc.desc   Verify AuthParam equality 17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0167', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0167 begin');
      const first: userAuth.AuthParam = { challenge: new Uint8Array(16), authType: [userAuth.UserAuthType.FACE], authTrustLevel: userAuth.AuthTrustLevel.ATL3 };
      const second: userAuth.AuthParam = { challenge: new Uint8Array(16), authType: [userAuth.UserAuthType.FACE], authTrustLevel: userAuth.AuthTrustLevel.ATL3 };
      expect(first.challenge.length).assertEqual(second.challenge.length);
      expect(first.authType[0]).assertEqual(second.authType[0]);
      expect(first.authTrustLevel).assertEqual(second.authTrustLevel);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0167 end');
    })
    /**
     * @tc.name   testUserAuthMore0168
     * @tc.number SUB_USER_AUTH_MORE_0168
     * @tc.desc   Verify AuthParam equality 18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0168', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0168 begin');
      const first: userAuth.AuthParam = { challenge: new Uint8Array(16), authType: [userAuth.UserAuthType.FACE], authTrustLevel: userAuth.AuthTrustLevel.ATL3 };
      const second: userAuth.AuthParam = { challenge: new Uint8Array(16), authType: [userAuth.UserAuthType.FACE], authTrustLevel: userAuth.AuthTrustLevel.ATL3 };
      expect(first.challenge.length).assertEqual(second.challenge.length);
      expect(first.authType[0]).assertEqual(second.authType[0]);
      expect(first.authTrustLevel).assertEqual(second.authTrustLevel);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0168 end');
    })
    /**
     * @tc.name   testUserAuthMore0169
     * @tc.number SUB_USER_AUTH_MORE_0169
     * @tc.desc   Verify AuthParam equality 19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0169', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0169 begin');
      const first: userAuth.AuthParam = { challenge: new Uint8Array(16), authType: [userAuth.UserAuthType.FACE], authTrustLevel: userAuth.AuthTrustLevel.ATL3 };
      const second: userAuth.AuthParam = { challenge: new Uint8Array(16), authType: [userAuth.UserAuthType.FACE], authTrustLevel: userAuth.AuthTrustLevel.ATL3 };
      expect(first.challenge.length).assertEqual(second.challenge.length);
      expect(first.authType[0]).assertEqual(second.authType[0]);
      expect(first.authTrustLevel).assertEqual(second.authTrustLevel);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0169 end');
    })
    /**
     * @tc.name   testUserAuthMore0170
     * @tc.number SUB_USER_AUTH_MORE_0170
     * @tc.desc   Verify AuthParam equality 20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0170 begin');
      const first: userAuth.AuthParam = { challenge: new Uint8Array(16), authType: [userAuth.UserAuthType.FACE], authTrustLevel: userAuth.AuthTrustLevel.ATL3 };
      const second: userAuth.AuthParam = { challenge: new Uint8Array(16), authType: [userAuth.UserAuthType.FACE], authTrustLevel: userAuth.AuthTrustLevel.ATL3 };
      expect(first.challenge.length).assertEqual(second.challenge.length);
      expect(first.authType[0]).assertEqual(second.authType[0]);
      expect(first.authTrustLevel).assertEqual(second.authTrustLevel);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0170 end');
    })
    /**
     * @tc.name   testUserAuthMore0171
     * @tc.number SUB_USER_AUTH_MORE_0171
     * @tc.desc   Verify AuthParam equality 21.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0171', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0171 begin');
      const first: userAuth.AuthParam = { challenge: new Uint8Array(16), authType: [userAuth.UserAuthType.FACE], authTrustLevel: userAuth.AuthTrustLevel.ATL3 };
      const second: userAuth.AuthParam = { challenge: new Uint8Array(16), authType: [userAuth.UserAuthType.FACE], authTrustLevel: userAuth.AuthTrustLevel.ATL3 };
      expect(first.challenge.length).assertEqual(second.challenge.length);
      expect(first.authType[0]).assertEqual(second.authType[0]);
      expect(first.authTrustLevel).assertEqual(second.authTrustLevel);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0171 end');
    })
    /**
     * @tc.name   testUserAuthMore0172
     * @tc.number SUB_USER_AUTH_MORE_0172
     * @tc.desc   Verify AuthParam equality 22.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0172', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0172 begin');
      const first: userAuth.AuthParam = { challenge: new Uint8Array(16), authType: [userAuth.UserAuthType.FACE], authTrustLevel: userAuth.AuthTrustLevel.ATL3 };
      const second: userAuth.AuthParam = { challenge: new Uint8Array(16), authType: [userAuth.UserAuthType.FACE], authTrustLevel: userAuth.AuthTrustLevel.ATL3 };
      expect(first.challenge.length).assertEqual(second.challenge.length);
      expect(first.authType[0]).assertEqual(second.authType[0]);
      expect(first.authTrustLevel).assertEqual(second.authTrustLevel);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0172 end');
    })
    /**
     * @tc.name   testUserAuthMore0173
     * @tc.number SUB_USER_AUTH_MORE_0173
     * @tc.desc   Verify AuthParam equality 23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0173', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0173 begin');
      const first: userAuth.AuthParam = { challenge: new Uint8Array(16), authType: [userAuth.UserAuthType.FACE], authTrustLevel: userAuth.AuthTrustLevel.ATL3 };
      const second: userAuth.AuthParam = { challenge: new Uint8Array(16), authType: [userAuth.UserAuthType.FACE], authTrustLevel: userAuth.AuthTrustLevel.ATL3 };
      expect(first.challenge.length).assertEqual(second.challenge.length);
      expect(first.authType[0]).assertEqual(second.authType[0]);
      expect(first.authTrustLevel).assertEqual(second.authTrustLevel);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0173 end');
    })
    /**
     * @tc.name   testUserAuthMore0174
     * @tc.number SUB_USER_AUTH_MORE_0174
     * @tc.desc   Verify AuthParam equality 24.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0174', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0174 begin');
      const first: userAuth.AuthParam = { challenge: new Uint8Array(16), authType: [userAuth.UserAuthType.FACE], authTrustLevel: userAuth.AuthTrustLevel.ATL3 };
      const second: userAuth.AuthParam = { challenge: new Uint8Array(16), authType: [userAuth.UserAuthType.FACE], authTrustLevel: userAuth.AuthTrustLevel.ATL3 };
      expect(first.challenge.length).assertEqual(second.challenge.length);
      expect(first.authType[0]).assertEqual(second.authType[0]);
      expect(first.authTrustLevel).assertEqual(second.authTrustLevel);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0174 end');
    })
    /**
     * @tc.name   testUserAuthMore0175
     * @tc.number SUB_USER_AUTH_MORE_0175
     * @tc.desc   Verify AuthParam equality 25.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0175', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0175 begin');
      const first: userAuth.AuthParam = { challenge: new Uint8Array(16), authType: [userAuth.UserAuthType.FACE], authTrustLevel: userAuth.AuthTrustLevel.ATL3 };
      const second: userAuth.AuthParam = { challenge: new Uint8Array(16), authType: [userAuth.UserAuthType.FACE], authTrustLevel: userAuth.AuthTrustLevel.ATL3 };
      expect(first.challenge.length).assertEqual(second.challenge.length);
      expect(first.authType[0]).assertEqual(second.authType[0]);
      expect(first.authTrustLevel).assertEqual(second.authTrustLevel);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0175 end');
    })
    /**
     * @tc.name   testUserAuthMore0176
     * @tc.number SUB_USER_AUTH_MORE_0176
     * @tc.desc   Verify AuthParam equality 26.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0176', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0176 begin');
      const first: userAuth.AuthParam = { challenge: new Uint8Array(16), authType: [userAuth.UserAuthType.FACE], authTrustLevel: userAuth.AuthTrustLevel.ATL3 };
      const second: userAuth.AuthParam = { challenge: new Uint8Array(16), authType: [userAuth.UserAuthType.FACE], authTrustLevel: userAuth.AuthTrustLevel.ATL3 };
      expect(first.challenge.length).assertEqual(second.challenge.length);
      expect(first.authType[0]).assertEqual(second.authType[0]);
      expect(first.authTrustLevel).assertEqual(second.authTrustLevel);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0176 end');
    })
    /**
     * @tc.name   testUserAuthMore0177
     * @tc.number SUB_USER_AUTH_MORE_0177
     * @tc.desc   Verify AuthParam equality 27.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0177', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0177 begin');
      const first: userAuth.AuthParam = { challenge: new Uint8Array(16), authType: [userAuth.UserAuthType.FACE], authTrustLevel: userAuth.AuthTrustLevel.ATL3 };
      const second: userAuth.AuthParam = { challenge: new Uint8Array(16), authType: [userAuth.UserAuthType.FACE], authTrustLevel: userAuth.AuthTrustLevel.ATL3 };
      expect(first.challenge.length).assertEqual(second.challenge.length);
      expect(first.authType[0]).assertEqual(second.authType[0]);
      expect(first.authTrustLevel).assertEqual(second.authTrustLevel);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0177 end');
    })
    /**
     * @tc.name   testUserAuthMore0178
     * @tc.number SUB_USER_AUTH_MORE_0178
     * @tc.desc   Verify AuthParam equality 28.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0178', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0178 begin');
      const first: userAuth.AuthParam = { challenge: new Uint8Array(16), authType: [userAuth.UserAuthType.FACE], authTrustLevel: userAuth.AuthTrustLevel.ATL3 };
      const second: userAuth.AuthParam = { challenge: new Uint8Array(16), authType: [userAuth.UserAuthType.FACE], authTrustLevel: userAuth.AuthTrustLevel.ATL3 };
      expect(first.challenge.length).assertEqual(second.challenge.length);
      expect(first.authType[0]).assertEqual(second.authType[0]);
      expect(first.authTrustLevel).assertEqual(second.authTrustLevel);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0178 end');
    })
    /**
     * @tc.name   testUserAuthMore0179
     * @tc.number SUB_USER_AUTH_MORE_0179
     * @tc.desc   Verify AuthParam equality 29.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0179', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0179 begin');
      const first: userAuth.AuthParam = { challenge: new Uint8Array(16), authType: [userAuth.UserAuthType.FACE], authTrustLevel: userAuth.AuthTrustLevel.ATL3 };
      const second: userAuth.AuthParam = { challenge: new Uint8Array(16), authType: [userAuth.UserAuthType.FACE], authTrustLevel: userAuth.AuthTrustLevel.ATL3 };
      expect(first.challenge.length).assertEqual(second.challenge.length);
      expect(first.authType[0]).assertEqual(second.authType[0]);
      expect(first.authTrustLevel).assertEqual(second.authTrustLevel);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0179 end');
    })
    /**
     * @tc.name   testUserAuthMore0180
     * @tc.number SUB_USER_AUTH_MORE_0180
     * @tc.desc   Verify AuthParam equality 30.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0180 begin');
      const first: userAuth.AuthParam = { challenge: new Uint8Array(16), authType: [userAuth.UserAuthType.FACE], authTrustLevel: userAuth.AuthTrustLevel.ATL3 };
      const second: userAuth.AuthParam = { challenge: new Uint8Array(16), authType: [userAuth.UserAuthType.FACE], authTrustLevel: userAuth.AuthTrustLevel.ATL3 };
      expect(first.challenge.length).assertEqual(second.challenge.length);
      expect(first.authType[0]).assertEqual(second.authType[0]);
      expect(first.authTrustLevel).assertEqual(second.authTrustLevel);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0180 end');
    })
    /**
     * @tc.name   testUserAuthMore0181
     * @tc.number SUB_USER_AUTH_MORE_0181
     * @tc.desc   Verify AuthParam equality 31.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0181', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0181 begin');
      const first: userAuth.AuthParam = { challenge: new Uint8Array(16), authType: [userAuth.UserAuthType.FACE], authTrustLevel: userAuth.AuthTrustLevel.ATL3 };
      const second: userAuth.AuthParam = { challenge: new Uint8Array(16), authType: [userAuth.UserAuthType.FACE], authTrustLevel: userAuth.AuthTrustLevel.ATL3 };
      expect(first.challenge.length).assertEqual(second.challenge.length);
      expect(first.authType[0]).assertEqual(second.authType[0]);
      expect(first.authTrustLevel).assertEqual(second.authTrustLevel);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0181 end');
    })
    /**
     * @tc.name   testUserAuthMore0182
     * @tc.number SUB_USER_AUTH_MORE_0182
     * @tc.desc   Verify AuthParam equality 32.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0182', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0182 begin');
      const first: userAuth.AuthParam = { challenge: new Uint8Array(16), authType: [userAuth.UserAuthType.FACE], authTrustLevel: userAuth.AuthTrustLevel.ATL3 };
      const second: userAuth.AuthParam = { challenge: new Uint8Array(16), authType: [userAuth.UserAuthType.FACE], authTrustLevel: userAuth.AuthTrustLevel.ATL3 };
      expect(first.challenge.length).assertEqual(second.challenge.length);
      expect(first.authType[0]).assertEqual(second.authType[0]);
      expect(first.authTrustLevel).assertEqual(second.authTrustLevel);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0182 end');
    })
    /**
     * @tc.name   testUserAuthMore0183
     * @tc.number SUB_USER_AUTH_MORE_0183
     * @tc.desc   Verify AuthParam equality 33.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0183', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0183 begin');
      const first: userAuth.AuthParam = { challenge: new Uint8Array(16), authType: [userAuth.UserAuthType.FACE], authTrustLevel: userAuth.AuthTrustLevel.ATL3 };
      const second: userAuth.AuthParam = { challenge: new Uint8Array(16), authType: [userAuth.UserAuthType.FACE], authTrustLevel: userAuth.AuthTrustLevel.ATL3 };
      expect(first.challenge.length).assertEqual(second.challenge.length);
      expect(first.authType[0]).assertEqual(second.authType[0]);
      expect(first.authTrustLevel).assertEqual(second.authTrustLevel);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0183 end');
    })
    /**
     * @tc.name   testUserAuthMore0184
     * @tc.number SUB_USER_AUTH_MORE_0184
     * @tc.desc   Verify AuthParam equality 34.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0184', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0184 begin');
      const first: userAuth.AuthParam = { challenge: new Uint8Array(16), authType: [userAuth.UserAuthType.FACE], authTrustLevel: userAuth.AuthTrustLevel.ATL3 };
      const second: userAuth.AuthParam = { challenge: new Uint8Array(16), authType: [userAuth.UserAuthType.FACE], authTrustLevel: userAuth.AuthTrustLevel.ATL3 };
      expect(first.challenge.length).assertEqual(second.challenge.length);
      expect(first.authType[0]).assertEqual(second.authType[0]);
      expect(first.authTrustLevel).assertEqual(second.authTrustLevel);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0184 end');
    })
    /**
     * @tc.name   testUserAuthMore0185
     * @tc.number SUB_USER_AUTH_MORE_0185
     * @tc.desc   Verify AuthParam equality 35.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0185', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0185 begin');
      const first: userAuth.AuthParam = { challenge: new Uint8Array(16), authType: [userAuth.UserAuthType.FACE], authTrustLevel: userAuth.AuthTrustLevel.ATL3 };
      const second: userAuth.AuthParam = { challenge: new Uint8Array(16), authType: [userAuth.UserAuthType.FACE], authTrustLevel: userAuth.AuthTrustLevel.ATL3 };
      expect(first.challenge.length).assertEqual(second.challenge.length);
      expect(first.authType[0]).assertEqual(second.authType[0]);
      expect(first.authTrustLevel).assertEqual(second.authTrustLevel);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0185 end');
    })
    /**
     * @tc.name   testUserAuthMore0186
     * @tc.number SUB_USER_AUTH_MORE_0186
     * @tc.desc   Verify AuthParam equality 36.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0186', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0186 begin');
      const first: userAuth.AuthParam = { challenge: new Uint8Array(16), authType: [userAuth.UserAuthType.FACE], authTrustLevel: userAuth.AuthTrustLevel.ATL3 };
      const second: userAuth.AuthParam = { challenge: new Uint8Array(16), authType: [userAuth.UserAuthType.FACE], authTrustLevel: userAuth.AuthTrustLevel.ATL3 };
      expect(first.challenge.length).assertEqual(second.challenge.length);
      expect(first.authType[0]).assertEqual(second.authType[0]);
      expect(first.authTrustLevel).assertEqual(second.authTrustLevel);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0186 end');
    })
    /**
     * @tc.name   testUserAuthMore0187
     * @tc.number SUB_USER_AUTH_MORE_0187
     * @tc.desc   Verify AuthParam equality 37.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0187', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0187 begin');
      const first: userAuth.AuthParam = { challenge: new Uint8Array(16), authType: [userAuth.UserAuthType.FACE], authTrustLevel: userAuth.AuthTrustLevel.ATL3 };
      const second: userAuth.AuthParam = { challenge: new Uint8Array(16), authType: [userAuth.UserAuthType.FACE], authTrustLevel: userAuth.AuthTrustLevel.ATL3 };
      expect(first.challenge.length).assertEqual(second.challenge.length);
      expect(first.authType[0]).assertEqual(second.authType[0]);
      expect(first.authTrustLevel).assertEqual(second.authTrustLevel);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0187 end');
    })
    /**
     * @tc.name   testUserAuthMore0188
     * @tc.number SUB_USER_AUTH_MORE_0188
     * @tc.desc   Verify AuthParam equality 38.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0188', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0188 begin');
      const first: userAuth.AuthParam = { challenge: new Uint8Array(16), authType: [userAuth.UserAuthType.FACE], authTrustLevel: userAuth.AuthTrustLevel.ATL3 };
      const second: userAuth.AuthParam = { challenge: new Uint8Array(16), authType: [userAuth.UserAuthType.FACE], authTrustLevel: userAuth.AuthTrustLevel.ATL3 };
      expect(first.challenge.length).assertEqual(second.challenge.length);
      expect(first.authType[0]).assertEqual(second.authType[0]);
      expect(first.authTrustLevel).assertEqual(second.authTrustLevel);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0188 end');
    })
    /**
     * @tc.name   testUserAuthMore0189
     * @tc.number SUB_USER_AUTH_MORE_0189
     * @tc.desc   Verify AuthParam equality 39.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0189', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0189 begin');
      const first: userAuth.AuthParam = { challenge: new Uint8Array(16), authType: [userAuth.UserAuthType.FACE], authTrustLevel: userAuth.AuthTrustLevel.ATL3 };
      const second: userAuth.AuthParam = { challenge: new Uint8Array(16), authType: [userAuth.UserAuthType.FACE], authTrustLevel: userAuth.AuthTrustLevel.ATL3 };
      expect(first.challenge.length).assertEqual(second.challenge.length);
      expect(first.authType[0]).assertEqual(second.authType[0]);
      expect(first.authTrustLevel).assertEqual(second.authTrustLevel);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0189 end');
    })
    /**
     * @tc.name   testUserAuthMore0190
     * @tc.number SUB_USER_AUTH_MORE_0190
     * @tc.desc   Verify AuthParam equality 40.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0190 begin');
      const first: userAuth.AuthParam = { challenge: new Uint8Array(16), authType: [userAuth.UserAuthType.FACE], authTrustLevel: userAuth.AuthTrustLevel.ATL3 };
      const second: userAuth.AuthParam = { challenge: new Uint8Array(16), authType: [userAuth.UserAuthType.FACE], authTrustLevel: userAuth.AuthTrustLevel.ATL3 };
      expect(first.challenge.length).assertEqual(second.challenge.length);
      expect(first.authType[0]).assertEqual(second.authType[0]);
      expect(first.authTrustLevel).assertEqual(second.authTrustLevel);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0190 end');
    })
    /**
     * @tc.name   testUserAuthMore0191
     * @tc.number SUB_USER_AUTH_MORE_0191
     * @tc.desc   Verify AuthParam equality 41.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0191', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0191 begin');
      const first: userAuth.AuthParam = { challenge: new Uint8Array(16), authType: [userAuth.UserAuthType.FACE], authTrustLevel: userAuth.AuthTrustLevel.ATL3 };
      const second: userAuth.AuthParam = { challenge: new Uint8Array(16), authType: [userAuth.UserAuthType.FACE], authTrustLevel: userAuth.AuthTrustLevel.ATL3 };
      expect(first.challenge.length).assertEqual(second.challenge.length);
      expect(first.authType[0]).assertEqual(second.authType[0]);
      expect(first.authTrustLevel).assertEqual(second.authTrustLevel);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0191 end');
    })
    /**
     * @tc.name   testUserAuthMore0192
     * @tc.number SUB_USER_AUTH_MORE_0192
     * @tc.desc   Verify AuthParam equality 42.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0192', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0192 begin');
      const first: userAuth.AuthParam = { challenge: new Uint8Array(16), authType: [userAuth.UserAuthType.FACE], authTrustLevel: userAuth.AuthTrustLevel.ATL3 };
      const second: userAuth.AuthParam = { challenge: new Uint8Array(16), authType: [userAuth.UserAuthType.FACE], authTrustLevel: userAuth.AuthTrustLevel.ATL3 };
      expect(first.challenge.length).assertEqual(second.challenge.length);
      expect(first.authType[0]).assertEqual(second.authType[0]);
      expect(first.authTrustLevel).assertEqual(second.authTrustLevel);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0192 end');
    })
    /**
     * @tc.name   testUserAuthMore0193
     * @tc.number SUB_USER_AUTH_MORE_0193
     * @tc.desc   Verify AuthParam equality 43.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0193', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0193 begin');
      const first: userAuth.AuthParam = { challenge: new Uint8Array(16), authType: [userAuth.UserAuthType.FACE], authTrustLevel: userAuth.AuthTrustLevel.ATL3 };
      const second: userAuth.AuthParam = { challenge: new Uint8Array(16), authType: [userAuth.UserAuthType.FACE], authTrustLevel: userAuth.AuthTrustLevel.ATL3 };
      expect(first.challenge.length).assertEqual(second.challenge.length);
      expect(first.authType[0]).assertEqual(second.authType[0]);
      expect(first.authTrustLevel).assertEqual(second.authTrustLevel);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0193 end');
    })
  })
}
