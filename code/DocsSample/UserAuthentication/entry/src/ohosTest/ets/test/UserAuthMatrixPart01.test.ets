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

export default function userAuthMatrixTestPart01() {
  describe('UserAuthMatrixPart01', () => {
    /**
     * @tc.name   testUserAuthMatrix0001
     * @tc.number SUB_USER_AUTH_MATRIX_0001
     * @tc.desc   Verify AuthParam matrix 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0001 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(1),
        authType: [userAuth.UserAuthType.FACE],
        authTrustLevel: userAuth.AuthTrustLevel.ATL2
      };
      expect(param.challenge.length).assertEqual(1);
      expect(param.authType.length > 0).assertTrue();
      expect(param.authTrustLevel).assertEqual(20000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0001 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0002
     * @tc.number SUB_USER_AUTH_MATRIX_0002
     * @tc.desc   Verify AuthParam matrix 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0002 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(2),
        authType: [userAuth.UserAuthType.FINGERPRINT],
        authTrustLevel: userAuth.AuthTrustLevel.ATL3
      };
      expect(param.challenge.length).assertEqual(2);
      expect(param.authType.length > 0).assertTrue();
      expect(param.authTrustLevel).assertEqual(30000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0002 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0003
     * @tc.number SUB_USER_AUTH_MATRIX_0003
     * @tc.desc   Verify AuthParam matrix 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0003 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(3),
        authType: [userAuth.UserAuthType.PIN, userAuth.UserAuthType.FACE],
        authTrustLevel: userAuth.AuthTrustLevel.ATL4
      };
      expect(param.challenge.length).assertEqual(3);
      expect(param.authType.length > 0).assertTrue();
      expect(param.authTrustLevel).assertEqual(40000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0003 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0004
     * @tc.number SUB_USER_AUTH_MATRIX_0004
     * @tc.desc   Verify AuthParam matrix 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0004 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(4),
        authType: [userAuth.UserAuthType.PIN, userAuth.UserAuthType.FINGERPRINT],
        authTrustLevel: userAuth.AuthTrustLevel.ATL1
      };
      expect(param.challenge.length).assertEqual(4);
      expect(param.authType.length > 0).assertTrue();
      expect(param.authTrustLevel).assertEqual(10000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0004 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0005
     * @tc.number SUB_USER_AUTH_MATRIX_0005
     * @tc.desc   Verify AuthParam matrix 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0005 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(5),
        authType: [userAuth.UserAuthType.FACE, userAuth.UserAuthType.FINGERPRINT],
        authTrustLevel: userAuth.AuthTrustLevel.ATL2
      };
      expect(param.challenge.length).assertEqual(5);
      expect(param.authType.length > 0).assertTrue();
      expect(param.authTrustLevel).assertEqual(20000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0005 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0006
     * @tc.number SUB_USER_AUTH_MATRIX_0006
     * @tc.desc   Verify AuthParam matrix 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0006 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(6),
        authType: [userAuth.UserAuthType.PIN, userAuth.UserAuthType.FACE, userAuth.UserAuthType.FINGERPRINT],
        authTrustLevel: userAuth.AuthTrustLevel.ATL3
      };
      expect(param.challenge.length).assertEqual(6);
      expect(param.authType.length > 0).assertTrue();
      expect(param.authTrustLevel).assertEqual(30000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0006 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0007
     * @tc.number SUB_USER_AUTH_MATRIX_0007
     * @tc.desc   Verify AuthParam matrix 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0007 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(7),
        authType: [userAuth.UserAuthType.PIN],
        authTrustLevel: userAuth.AuthTrustLevel.ATL4
      };
      expect(param.challenge.length).assertEqual(7);
      expect(param.authType.length > 0).assertTrue();
      expect(param.authTrustLevel).assertEqual(40000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0007 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0008
     * @tc.number SUB_USER_AUTH_MATRIX_0008
     * @tc.desc   Verify AuthParam matrix 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0008 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(8),
        authType: [userAuth.UserAuthType.FACE],
        authTrustLevel: userAuth.AuthTrustLevel.ATL1
      };
      expect(param.challenge.length).assertEqual(8);
      expect(param.authType.length > 0).assertTrue();
      expect(param.authTrustLevel).assertEqual(10000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0008 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0009
     * @tc.number SUB_USER_AUTH_MATRIX_0009
     * @tc.desc   Verify AuthParam matrix 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0009 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(9),
        authType: [userAuth.UserAuthType.FINGERPRINT],
        authTrustLevel: userAuth.AuthTrustLevel.ATL2
      };
      expect(param.challenge.length).assertEqual(9);
      expect(param.authType.length > 0).assertTrue();
      expect(param.authTrustLevel).assertEqual(20000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0009 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0010
     * @tc.number SUB_USER_AUTH_MATRIX_0010
     * @tc.desc   Verify AuthParam matrix 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0010 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(10),
        authType: [userAuth.UserAuthType.PIN, userAuth.UserAuthType.FACE],
        authTrustLevel: userAuth.AuthTrustLevel.ATL3
      };
      expect(param.challenge.length).assertEqual(10);
      expect(param.authType.length > 0).assertTrue();
      expect(param.authTrustLevel).assertEqual(30000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0010 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0011
     * @tc.number SUB_USER_AUTH_MATRIX_0011
     * @tc.desc   Verify AuthParam matrix 11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0011 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(11),
        authType: [userAuth.UserAuthType.PIN, userAuth.UserAuthType.FINGERPRINT],
        authTrustLevel: userAuth.AuthTrustLevel.ATL4
      };
      expect(param.challenge.length).assertEqual(11);
      expect(param.authType.length > 0).assertTrue();
      expect(param.authTrustLevel).assertEqual(40000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0011 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0012
     * @tc.number SUB_USER_AUTH_MATRIX_0012
     * @tc.desc   Verify AuthParam matrix 12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0012 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(12),
        authType: [userAuth.UserAuthType.FACE, userAuth.UserAuthType.FINGERPRINT],
        authTrustLevel: userAuth.AuthTrustLevel.ATL1
      };
      expect(param.challenge.length).assertEqual(12);
      expect(param.authType.length > 0).assertTrue();
      expect(param.authTrustLevel).assertEqual(10000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0012 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0013
     * @tc.number SUB_USER_AUTH_MATRIX_0013
     * @tc.desc   Verify AuthParam matrix 13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0013 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(13),
        authType: [userAuth.UserAuthType.PIN, userAuth.UserAuthType.FACE, userAuth.UserAuthType.FINGERPRINT],
        authTrustLevel: userAuth.AuthTrustLevel.ATL2
      };
      expect(param.challenge.length).assertEqual(13);
      expect(param.authType.length > 0).assertTrue();
      expect(param.authTrustLevel).assertEqual(20000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0013 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0014
     * @tc.number SUB_USER_AUTH_MATRIX_0014
     * @tc.desc   Verify AuthParam matrix 14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0014 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(14),
        authType: [userAuth.UserAuthType.PIN],
        authTrustLevel: userAuth.AuthTrustLevel.ATL3
      };
      expect(param.challenge.length).assertEqual(14);
      expect(param.authType.length > 0).assertTrue();
      expect(param.authTrustLevel).assertEqual(30000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0014 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0015
     * @tc.number SUB_USER_AUTH_MATRIX_0015
     * @tc.desc   Verify AuthParam matrix 15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0015 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(15),
        authType: [userAuth.UserAuthType.FACE],
        authTrustLevel: userAuth.AuthTrustLevel.ATL4
      };
      expect(param.challenge.length).assertEqual(15);
      expect(param.authType.length > 0).assertTrue();
      expect(param.authTrustLevel).assertEqual(40000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0015 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0016
     * @tc.number SUB_USER_AUTH_MATRIX_0016
     * @tc.desc   Verify AuthParam matrix 16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0016 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(16),
        authType: [userAuth.UserAuthType.FINGERPRINT],
        authTrustLevel: userAuth.AuthTrustLevel.ATL1
      };
      expect(param.challenge.length).assertEqual(16);
      expect(param.authType.length > 0).assertTrue();
      expect(param.authTrustLevel).assertEqual(10000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0016 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0017
     * @tc.number SUB_USER_AUTH_MATRIX_0017
     * @tc.desc   Verify AuthParam matrix 17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0017 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(17),
        authType: [userAuth.UserAuthType.PIN, userAuth.UserAuthType.FACE],
        authTrustLevel: userAuth.AuthTrustLevel.ATL2
      };
      expect(param.challenge.length).assertEqual(17);
      expect(param.authType.length > 0).assertTrue();
      expect(param.authTrustLevel).assertEqual(20000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0017 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0018
     * @tc.number SUB_USER_AUTH_MATRIX_0018
     * @tc.desc   Verify AuthParam matrix 18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0018 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(18),
        authType: [userAuth.UserAuthType.PIN, userAuth.UserAuthType.FINGERPRINT],
        authTrustLevel: userAuth.AuthTrustLevel.ATL3
      };
      expect(param.challenge.length).assertEqual(18);
      expect(param.authType.length > 0).assertTrue();
      expect(param.authTrustLevel).assertEqual(30000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0018 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0019
     * @tc.number SUB_USER_AUTH_MATRIX_0019
     * @tc.desc   Verify AuthParam matrix 19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0019 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(19),
        authType: [userAuth.UserAuthType.FACE, userAuth.UserAuthType.FINGERPRINT],
        authTrustLevel: userAuth.AuthTrustLevel.ATL4
      };
      expect(param.challenge.length).assertEqual(19);
      expect(param.authType.length > 0).assertTrue();
      expect(param.authTrustLevel).assertEqual(40000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0019 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0020
     * @tc.number SUB_USER_AUTH_MATRIX_0020
     * @tc.desc   Verify AuthParam matrix 20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0020 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(20),
        authType: [userAuth.UserAuthType.PIN, userAuth.UserAuthType.FACE, userAuth.UserAuthType.FINGERPRINT],
        authTrustLevel: userAuth.AuthTrustLevel.ATL1
      };
      expect(param.challenge.length).assertEqual(20);
      expect(param.authType.length > 0).assertTrue();
      expect(param.authTrustLevel).assertEqual(10000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0020 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0021
     * @tc.number SUB_USER_AUTH_MATRIX_0021
     * @tc.desc   Verify AuthParam matrix 21.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0021 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(21),
        authType: [userAuth.UserAuthType.PIN],
        authTrustLevel: userAuth.AuthTrustLevel.ATL2
      };
      expect(param.challenge.length).assertEqual(21);
      expect(param.authType.length > 0).assertTrue();
      expect(param.authTrustLevel).assertEqual(20000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0021 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0022
     * @tc.number SUB_USER_AUTH_MATRIX_0022
     * @tc.desc   Verify AuthParam matrix 22.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0022 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(22),
        authType: [userAuth.UserAuthType.FACE],
        authTrustLevel: userAuth.AuthTrustLevel.ATL3
      };
      expect(param.challenge.length).assertEqual(22);
      expect(param.authType.length > 0).assertTrue();
      expect(param.authTrustLevel).assertEqual(30000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0022 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0023
     * @tc.number SUB_USER_AUTH_MATRIX_0023
     * @tc.desc   Verify AuthParam matrix 23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0023 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(23),
        authType: [userAuth.UserAuthType.FINGERPRINT],
        authTrustLevel: userAuth.AuthTrustLevel.ATL4
      };
      expect(param.challenge.length).assertEqual(23);
      expect(param.authType.length > 0).assertTrue();
      expect(param.authTrustLevel).assertEqual(40000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0023 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0024
     * @tc.number SUB_USER_AUTH_MATRIX_0024
     * @tc.desc   Verify AuthParam matrix 24.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0024 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(24),
        authType: [userAuth.UserAuthType.PIN, userAuth.UserAuthType.FACE],
        authTrustLevel: userAuth.AuthTrustLevel.ATL1
      };
      expect(param.challenge.length).assertEqual(24);
      expect(param.authType.length > 0).assertTrue();
      expect(param.authTrustLevel).assertEqual(10000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0024 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0025
     * @tc.number SUB_USER_AUTH_MATRIX_0025
     * @tc.desc   Verify AuthParam matrix 25.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0025 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(25),
        authType: [userAuth.UserAuthType.PIN, userAuth.UserAuthType.FINGERPRINT],
        authTrustLevel: userAuth.AuthTrustLevel.ATL2
      };
      expect(param.challenge.length).assertEqual(25);
      expect(param.authType.length > 0).assertTrue();
      expect(param.authTrustLevel).assertEqual(20000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0025 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0026
     * @tc.number SUB_USER_AUTH_MATRIX_0026
     * @tc.desc   Verify AuthParam matrix 26.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0026 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(26),
        authType: [userAuth.UserAuthType.FACE, userAuth.UserAuthType.FINGERPRINT],
        authTrustLevel: userAuth.AuthTrustLevel.ATL3
      };
      expect(param.challenge.length).assertEqual(26);
      expect(param.authType.length > 0).assertTrue();
      expect(param.authTrustLevel).assertEqual(30000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0026 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0027
     * @tc.number SUB_USER_AUTH_MATRIX_0027
     * @tc.desc   Verify AuthParam matrix 27.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0027 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(27),
        authType: [userAuth.UserAuthType.PIN, userAuth.UserAuthType.FACE, userAuth.UserAuthType.FINGERPRINT],
        authTrustLevel: userAuth.AuthTrustLevel.ATL4
      };
      expect(param.challenge.length).assertEqual(27);
      expect(param.authType.length > 0).assertTrue();
      expect(param.authTrustLevel).assertEqual(40000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0027 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0028
     * @tc.number SUB_USER_AUTH_MATRIX_0028
     * @tc.desc   Verify AuthParam matrix 28.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0028 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(28),
        authType: [userAuth.UserAuthType.PIN],
        authTrustLevel: userAuth.AuthTrustLevel.ATL1
      };
      expect(param.challenge.length).assertEqual(28);
      expect(param.authType.length > 0).assertTrue();
      expect(param.authTrustLevel).assertEqual(10000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0028 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0029
     * @tc.number SUB_USER_AUTH_MATRIX_0029
     * @tc.desc   Verify AuthParam matrix 29.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0029 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(29),
        authType: [userAuth.UserAuthType.FACE],
        authTrustLevel: userAuth.AuthTrustLevel.ATL2
      };
      expect(param.challenge.length).assertEqual(29);
      expect(param.authType.length > 0).assertTrue();
      expect(param.authTrustLevel).assertEqual(20000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0029 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0030
     * @tc.number SUB_USER_AUTH_MATRIX_0030
     * @tc.desc   Verify AuthParam matrix 30.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0030 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(30),
        authType: [userAuth.UserAuthType.FINGERPRINT],
        authTrustLevel: userAuth.AuthTrustLevel.ATL3
      };
      expect(param.challenge.length).assertEqual(30);
      expect(param.authType.length > 0).assertTrue();
      expect(param.authTrustLevel).assertEqual(30000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0030 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0031
     * @tc.number SUB_USER_AUTH_MATRIX_0031
     * @tc.desc   Verify AuthParam matrix 31.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0031 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(31),
        authType: [userAuth.UserAuthType.PIN, userAuth.UserAuthType.FACE],
        authTrustLevel: userAuth.AuthTrustLevel.ATL4
      };
      expect(param.challenge.length).assertEqual(31);
      expect(param.authType.length > 0).assertTrue();
      expect(param.authTrustLevel).assertEqual(40000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0031 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0032
     * @tc.number SUB_USER_AUTH_MATRIX_0032
     * @tc.desc   Verify AuthParam matrix 32.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0032 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(32),
        authType: [userAuth.UserAuthType.PIN, userAuth.UserAuthType.FINGERPRINT],
        authTrustLevel: userAuth.AuthTrustLevel.ATL1
      };
      expect(param.challenge.length).assertEqual(32);
      expect(param.authType.length > 0).assertTrue();
      expect(param.authTrustLevel).assertEqual(10000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0032 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0033
     * @tc.number SUB_USER_AUTH_MATRIX_0033
     * @tc.desc   Verify AuthParam matrix 33.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0033 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(33),
        authType: [userAuth.UserAuthType.FACE, userAuth.UserAuthType.FINGERPRINT],
        authTrustLevel: userAuth.AuthTrustLevel.ATL2
      };
      expect(param.challenge.length).assertEqual(33);
      expect(param.authType.length > 0).assertTrue();
      expect(param.authTrustLevel).assertEqual(20000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0033 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0034
     * @tc.number SUB_USER_AUTH_MATRIX_0034
     * @tc.desc   Verify AuthParam matrix 34.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0034 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(34),
        authType: [userAuth.UserAuthType.PIN, userAuth.UserAuthType.FACE, userAuth.UserAuthType.FINGERPRINT],
        authTrustLevel: userAuth.AuthTrustLevel.ATL3
      };
      expect(param.challenge.length).assertEqual(34);
      expect(param.authType.length > 0).assertTrue();
      expect(param.authTrustLevel).assertEqual(30000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0034 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0035
     * @tc.number SUB_USER_AUTH_MATRIX_0035
     * @tc.desc   Verify AuthParam matrix 35.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0035 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(35),
        authType: [userAuth.UserAuthType.PIN],
        authTrustLevel: userAuth.AuthTrustLevel.ATL4
      };
      expect(param.challenge.length).assertEqual(35);
      expect(param.authType.length > 0).assertTrue();
      expect(param.authTrustLevel).assertEqual(40000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0035 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0036
     * @tc.number SUB_USER_AUTH_MATRIX_0036
     * @tc.desc   Verify AuthParam matrix 36.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0036 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(36),
        authType: [userAuth.UserAuthType.FACE],
        authTrustLevel: userAuth.AuthTrustLevel.ATL1
      };
      expect(param.challenge.length).assertEqual(36);
      expect(param.authType.length > 0).assertTrue();
      expect(param.authTrustLevel).assertEqual(10000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0036 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0037
     * @tc.number SUB_USER_AUTH_MATRIX_0037
     * @tc.desc   Verify AuthParam matrix 37.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0037 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(37),
        authType: [userAuth.UserAuthType.FINGERPRINT],
        authTrustLevel: userAuth.AuthTrustLevel.ATL2
      };
      expect(param.challenge.length).assertEqual(37);
      expect(param.authType.length > 0).assertTrue();
      expect(param.authTrustLevel).assertEqual(20000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0037 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0038
     * @tc.number SUB_USER_AUTH_MATRIX_0038
     * @tc.desc   Verify AuthParam matrix 38.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0038 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(38),
        authType: [userAuth.UserAuthType.PIN, userAuth.UserAuthType.FACE],
        authTrustLevel: userAuth.AuthTrustLevel.ATL3
      };
      expect(param.challenge.length).assertEqual(38);
      expect(param.authType.length > 0).assertTrue();
      expect(param.authTrustLevel).assertEqual(30000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0038 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0039
     * @tc.number SUB_USER_AUTH_MATRIX_0039
     * @tc.desc   Verify AuthParam matrix 39.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0039 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(39),
        authType: [userAuth.UserAuthType.PIN, userAuth.UserAuthType.FINGERPRINT],
        authTrustLevel: userAuth.AuthTrustLevel.ATL4
      };
      expect(param.challenge.length).assertEqual(39);
      expect(param.authType.length > 0).assertTrue();
      expect(param.authTrustLevel).assertEqual(40000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0039 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0040
     * @tc.number SUB_USER_AUTH_MATRIX_0040
     * @tc.desc   Verify AuthParam matrix 40.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0040 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(40),
        authType: [userAuth.UserAuthType.FACE, userAuth.UserAuthType.FINGERPRINT],
        authTrustLevel: userAuth.AuthTrustLevel.ATL1
      };
      expect(param.challenge.length).assertEqual(40);
      expect(param.authType.length > 0).assertTrue();
      expect(param.authTrustLevel).assertEqual(10000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0040 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0041
     * @tc.number SUB_USER_AUTH_MATRIX_0041
     * @tc.desc   Verify AuthParam matrix 41.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0041 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(41),
        authType: [userAuth.UserAuthType.PIN, userAuth.UserAuthType.FACE, userAuth.UserAuthType.FINGERPRINT],
        authTrustLevel: userAuth.AuthTrustLevel.ATL2
      };
      expect(param.challenge.length).assertEqual(41);
      expect(param.authType.length > 0).assertTrue();
      expect(param.authTrustLevel).assertEqual(20000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0041 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0042
     * @tc.number SUB_USER_AUTH_MATRIX_0042
     * @tc.desc   Verify AuthParam matrix 42.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0042 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(42),
        authType: [userAuth.UserAuthType.PIN],
        authTrustLevel: userAuth.AuthTrustLevel.ATL3
      };
      expect(param.challenge.length).assertEqual(42);
      expect(param.authType.length > 0).assertTrue();
      expect(param.authTrustLevel).assertEqual(30000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0042 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0043
     * @tc.number SUB_USER_AUTH_MATRIX_0043
     * @tc.desc   Verify AuthParam matrix 43.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0043 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(43),
        authType: [userAuth.UserAuthType.FACE],
        authTrustLevel: userAuth.AuthTrustLevel.ATL4
      };
      expect(param.challenge.length).assertEqual(43);
      expect(param.authType.length > 0).assertTrue();
      expect(param.authTrustLevel).assertEqual(40000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0043 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0044
     * @tc.number SUB_USER_AUTH_MATRIX_0044
     * @tc.desc   Verify AuthParam matrix 44.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0044 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(44),
        authType: [userAuth.UserAuthType.FINGERPRINT],
        authTrustLevel: userAuth.AuthTrustLevel.ATL1
      };
      expect(param.challenge.length).assertEqual(44);
      expect(param.authType.length > 0).assertTrue();
      expect(param.authTrustLevel).assertEqual(10000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0044 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0045
     * @tc.number SUB_USER_AUTH_MATRIX_0045
     * @tc.desc   Verify AuthParam matrix 45.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0045 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(45),
        authType: [userAuth.UserAuthType.PIN, userAuth.UserAuthType.FACE],
        authTrustLevel: userAuth.AuthTrustLevel.ATL2
      };
      expect(param.challenge.length).assertEqual(45);
      expect(param.authType.length > 0).assertTrue();
      expect(param.authTrustLevel).assertEqual(20000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0045 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0046
     * @tc.number SUB_USER_AUTH_MATRIX_0046
     * @tc.desc   Verify AuthParam matrix 46.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0046 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(46),
        authType: [userAuth.UserAuthType.PIN, userAuth.UserAuthType.FINGERPRINT],
        authTrustLevel: userAuth.AuthTrustLevel.ATL3
      };
      expect(param.challenge.length).assertEqual(46);
      expect(param.authType.length > 0).assertTrue();
      expect(param.authTrustLevel).assertEqual(30000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0046 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0047
     * @tc.number SUB_USER_AUTH_MATRIX_0047
     * @tc.desc   Verify AuthParam matrix 47.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0047 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(47),
        authType: [userAuth.UserAuthType.FACE, userAuth.UserAuthType.FINGERPRINT],
        authTrustLevel: userAuth.AuthTrustLevel.ATL4
      };
      expect(param.challenge.length).assertEqual(47);
      expect(param.authType.length > 0).assertTrue();
      expect(param.authTrustLevel).assertEqual(40000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0047 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0048
     * @tc.number SUB_USER_AUTH_MATRIX_0048
     * @tc.desc   Verify AuthParam matrix 48.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0048 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(48),
        authType: [userAuth.UserAuthType.PIN, userAuth.UserAuthType.FACE, userAuth.UserAuthType.FINGERPRINT],
        authTrustLevel: userAuth.AuthTrustLevel.ATL1
      };
      expect(param.challenge.length).assertEqual(48);
      expect(param.authType.length > 0).assertTrue();
      expect(param.authTrustLevel).assertEqual(10000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0048 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0049
     * @tc.number SUB_USER_AUTH_MATRIX_0049
     * @tc.desc   Verify AuthParam matrix 49.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0049 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(49),
        authType: [userAuth.UserAuthType.PIN],
        authTrustLevel: userAuth.AuthTrustLevel.ATL2
      };
      expect(param.challenge.length).assertEqual(49);
      expect(param.authType.length > 0).assertTrue();
      expect(param.authTrustLevel).assertEqual(20000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0049 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0050
     * @tc.number SUB_USER_AUTH_MATRIX_0050
     * @tc.desc   Verify AuthParam matrix 50.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0050 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(50),
        authType: [userAuth.UserAuthType.FACE],
        authTrustLevel: userAuth.AuthTrustLevel.ATL3
      };
      expect(param.challenge.length).assertEqual(50);
      expect(param.authType.length > 0).assertTrue();
      expect(param.authTrustLevel).assertEqual(30000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0050 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0051
     * @tc.number SUB_USER_AUTH_MATRIX_0051
     * @tc.desc   Verify auth type array 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0051 begin');
      const types: userAuth.UserAuthType[] = [userAuth.UserAuthType.FACE];
      expect(types.length > 0).assertTrue();
      for (let i: number = 0; i < types.length; i++) {
        expect(typeof types[i]).assertEqual('number');
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0051 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0052
     * @tc.number SUB_USER_AUTH_MATRIX_0052
     * @tc.desc   Verify auth type array 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0052 begin');
      const types: userAuth.UserAuthType[] = [userAuth.UserAuthType.FINGERPRINT];
      expect(types.length > 0).assertTrue();
      for (let i: number = 0; i < types.length; i++) {
        expect(typeof types[i]).assertEqual('number');
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0052 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0053
     * @tc.number SUB_USER_AUTH_MATRIX_0053
     * @tc.desc   Verify auth type array 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0053 begin');
      const types: userAuth.UserAuthType[] = [userAuth.UserAuthType.PIN, userAuth.UserAuthType.FACE];
      expect(types.length > 0).assertTrue();
      for (let i: number = 0; i < types.length; i++) {
        expect(typeof types[i]).assertEqual('number');
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0053 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0054
     * @tc.number SUB_USER_AUTH_MATRIX_0054
     * @tc.desc   Verify auth type array 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0054 begin');
      const types: userAuth.UserAuthType[] = [userAuth.UserAuthType.PIN, userAuth.UserAuthType.FINGERPRINT];
      expect(types.length > 0).assertTrue();
      for (let i: number = 0; i < types.length; i++) {
        expect(typeof types[i]).assertEqual('number');
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0054 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0055
     * @tc.number SUB_USER_AUTH_MATRIX_0055
     * @tc.desc   Verify auth type array 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0055 begin');
      const types: userAuth.UserAuthType[] = [userAuth.UserAuthType.FACE, userAuth.UserAuthType.FINGERPRINT];
      expect(types.length > 0).assertTrue();
      for (let i: number = 0; i < types.length; i++) {
        expect(typeof types[i]).assertEqual('number');
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0055 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0056
     * @tc.number SUB_USER_AUTH_MATRIX_0056
     * @tc.desc   Verify auth type array 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0056 begin');
      const types: userAuth.UserAuthType[] = [userAuth.UserAuthType.PIN, userAuth.UserAuthType.FACE, userAuth.UserAuthType.FINGERPRINT];
      expect(types.length > 0).assertTrue();
      for (let i: number = 0; i < types.length; i++) {
        expect(typeof types[i]).assertEqual('number');
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0056 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0057
     * @tc.number SUB_USER_AUTH_MATRIX_0057
     * @tc.desc   Verify auth type array 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0057 begin');
      const types: userAuth.UserAuthType[] = [userAuth.UserAuthType.PIN];
      expect(types.length > 0).assertTrue();
      for (let i: number = 0; i < types.length; i++) {
        expect(typeof types[i]).assertEqual('number');
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0057 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0058
     * @tc.number SUB_USER_AUTH_MATRIX_0058
     * @tc.desc   Verify auth type array 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0058 begin');
      const types: userAuth.UserAuthType[] = [userAuth.UserAuthType.FACE];
      expect(types.length > 0).assertTrue();
      for (let i: number = 0; i < types.length; i++) {
        expect(typeof types[i]).assertEqual('number');
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0058 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0059
     * @tc.number SUB_USER_AUTH_MATRIX_0059
     * @tc.desc   Verify auth type array 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0059 begin');
      const types: userAuth.UserAuthType[] = [userAuth.UserAuthType.FINGERPRINT];
      expect(types.length > 0).assertTrue();
      for (let i: number = 0; i < types.length; i++) {
        expect(typeof types[i]).assertEqual('number');
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0059 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0060
     * @tc.number SUB_USER_AUTH_MATRIX_0060
     * @tc.desc   Verify auth type array 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0060 begin');
      const types: userAuth.UserAuthType[] = [userAuth.UserAuthType.PIN, userAuth.UserAuthType.FACE];
      expect(types.length > 0).assertTrue();
      for (let i: number = 0; i < types.length; i++) {
        expect(typeof types[i]).assertEqual('number');
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0060 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0061
     * @tc.number SUB_USER_AUTH_MATRIX_0061
     * @tc.desc   Verify auth type array 11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0061 begin');
      const types: userAuth.UserAuthType[] = [userAuth.UserAuthType.PIN, userAuth.UserAuthType.FINGERPRINT];
      expect(types.length > 0).assertTrue();
      for (let i: number = 0; i < types.length; i++) {
        expect(typeof types[i]).assertEqual('number');
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0061 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0062
     * @tc.number SUB_USER_AUTH_MATRIX_0062
     * @tc.desc   Verify auth type array 12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0062 begin');
      const types: userAuth.UserAuthType[] = [userAuth.UserAuthType.FACE, userAuth.UserAuthType.FINGERPRINT];
      expect(types.length > 0).assertTrue();
      for (let i: number = 0; i < types.length; i++) {
        expect(typeof types[i]).assertEqual('number');
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0062 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0063
     * @tc.number SUB_USER_AUTH_MATRIX_0063
     * @tc.desc   Verify auth type array 13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0063 begin');
      const types: userAuth.UserAuthType[] = [userAuth.UserAuthType.PIN, userAuth.UserAuthType.FACE, userAuth.UserAuthType.FINGERPRINT];
      expect(types.length > 0).assertTrue();
      for (let i: number = 0; i < types.length; i++) {
        expect(typeof types[i]).assertEqual('number');
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0063 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0064
     * @tc.number SUB_USER_AUTH_MATRIX_0064
     * @tc.desc   Verify auth type array 14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0064 begin');
      const types: userAuth.UserAuthType[] = [userAuth.UserAuthType.PIN];
      expect(types.length > 0).assertTrue();
      for (let i: number = 0; i < types.length; i++) {
        expect(typeof types[i]).assertEqual('number');
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0064 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0065
     * @tc.number SUB_USER_AUTH_MATRIX_0065
     * @tc.desc   Verify auth type array 15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0065 begin');
      const types: userAuth.UserAuthType[] = [userAuth.UserAuthType.FACE];
      expect(types.length > 0).assertTrue();
      for (let i: number = 0; i < types.length; i++) {
        expect(typeof types[i]).assertEqual('number');
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0065 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0066
     * @tc.number SUB_USER_AUTH_MATRIX_0066
     * @tc.desc   Verify auth type array 16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0066 begin');
      const types: userAuth.UserAuthType[] = [userAuth.UserAuthType.FINGERPRINT];
      expect(types.length > 0).assertTrue();
      for (let i: number = 0; i < types.length; i++) {
        expect(typeof types[i]).assertEqual('number');
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0066 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0067
     * @tc.number SUB_USER_AUTH_MATRIX_0067
     * @tc.desc   Verify auth type array 17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0067 begin');
      const types: userAuth.UserAuthType[] = [userAuth.UserAuthType.PIN, userAuth.UserAuthType.FACE];
      expect(types.length > 0).assertTrue();
      for (let i: number = 0; i < types.length; i++) {
        expect(typeof types[i]).assertEqual('number');
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0067 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0068
     * @tc.number SUB_USER_AUTH_MATRIX_0068
     * @tc.desc   Verify auth type array 18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0068 begin');
      const types: userAuth.UserAuthType[] = [userAuth.UserAuthType.PIN, userAuth.UserAuthType.FINGERPRINT];
      expect(types.length > 0).assertTrue();
      for (let i: number = 0; i < types.length; i++) {
        expect(typeof types[i]).assertEqual('number');
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0068 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0069
     * @tc.number SUB_USER_AUTH_MATRIX_0069
     * @tc.desc   Verify auth type array 19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0069 begin');
      const types: userAuth.UserAuthType[] = [userAuth.UserAuthType.FACE, userAuth.UserAuthType.FINGERPRINT];
      expect(types.length > 0).assertTrue();
      for (let i: number = 0; i < types.length; i++) {
        expect(typeof types[i]).assertEqual('number');
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0069 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0070
     * @tc.number SUB_USER_AUTH_MATRIX_0070
     * @tc.desc   Verify auth type array 20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0070 begin');
      const types: userAuth.UserAuthType[] = [userAuth.UserAuthType.PIN, userAuth.UserAuthType.FACE, userAuth.UserAuthType.FINGERPRINT];
      expect(types.length > 0).assertTrue();
      for (let i: number = 0; i < types.length; i++) {
        expect(typeof types[i]).assertEqual('number');
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0070 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0071
     * @tc.number SUB_USER_AUTH_MATRIX_0071
     * @tc.desc   Verify auth type array 21.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0071 begin');
      const types: userAuth.UserAuthType[] = [userAuth.UserAuthType.PIN];
      expect(types.length > 0).assertTrue();
      for (let i: number = 0; i < types.length; i++) {
        expect(typeof types[i]).assertEqual('number');
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0071 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0072
     * @tc.number SUB_USER_AUTH_MATRIX_0072
     * @tc.desc   Verify auth type array 22.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0072 begin');
      const types: userAuth.UserAuthType[] = [userAuth.UserAuthType.FACE];
      expect(types.length > 0).assertTrue();
      for (let i: number = 0; i < types.length; i++) {
        expect(typeof types[i]).assertEqual('number');
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0072 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0073
     * @tc.number SUB_USER_AUTH_MATRIX_0073
     * @tc.desc   Verify auth type array 23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0073 begin');
      const types: userAuth.UserAuthType[] = [userAuth.UserAuthType.FINGERPRINT];
      expect(types.length > 0).assertTrue();
      for (let i: number = 0; i < types.length; i++) {
        expect(typeof types[i]).assertEqual('number');
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0073 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0074
     * @tc.number SUB_USER_AUTH_MATRIX_0074
     * @tc.desc   Verify auth type array 24.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0074 begin');
      const types: userAuth.UserAuthType[] = [userAuth.UserAuthType.PIN, userAuth.UserAuthType.FACE];
      expect(types.length > 0).assertTrue();
      for (let i: number = 0; i < types.length; i++) {
        expect(typeof types[i]).assertEqual('number');
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0074 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0075
     * @tc.number SUB_USER_AUTH_MATRIX_0075
     * @tc.desc   Verify auth type array 25.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0075 begin');
      const types: userAuth.UserAuthType[] = [userAuth.UserAuthType.PIN, userAuth.UserAuthType.FINGERPRINT];
      expect(types.length > 0).assertTrue();
      for (let i: number = 0; i < types.length; i++) {
        expect(typeof types[i]).assertEqual('number');
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0075 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0076
     * @tc.number SUB_USER_AUTH_MATRIX_0076
     * @tc.desc   Verify auth type array 26.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0076 begin');
      const types: userAuth.UserAuthType[] = [userAuth.UserAuthType.FACE, userAuth.UserAuthType.FINGERPRINT];
      expect(types.length > 0).assertTrue();
      for (let i: number = 0; i < types.length; i++) {
        expect(typeof types[i]).assertEqual('number');
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0076 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0077
     * @tc.number SUB_USER_AUTH_MATRIX_0077
     * @tc.desc   Verify auth type array 27.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0077 begin');
      const types: userAuth.UserAuthType[] = [userAuth.UserAuthType.PIN, userAuth.UserAuthType.FACE, userAuth.UserAuthType.FINGERPRINT];
      expect(types.length > 0).assertTrue();
      for (let i: number = 0; i < types.length; i++) {
        expect(typeof types[i]).assertEqual('number');
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0077 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0078
     * @tc.number SUB_USER_AUTH_MATRIX_0078
     * @tc.desc   Verify auth type array 28.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0078 begin');
      const types: userAuth.UserAuthType[] = [userAuth.UserAuthType.PIN];
      expect(types.length > 0).assertTrue();
      for (let i: number = 0; i < types.length; i++) {
        expect(typeof types[i]).assertEqual('number');
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0078 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0079
     * @tc.number SUB_USER_AUTH_MATRIX_0079
     * @tc.desc   Verify auth type array 29.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0079 begin');
      const types: userAuth.UserAuthType[] = [userAuth.UserAuthType.FACE];
      expect(types.length > 0).assertTrue();
      for (let i: number = 0; i < types.length; i++) {
        expect(typeof types[i]).assertEqual('number');
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0079 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0080
     * @tc.number SUB_USER_AUTH_MATRIX_0080
     * @tc.desc   Verify auth type array 30.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0080 begin');
      const types: userAuth.UserAuthType[] = [userAuth.UserAuthType.FINGERPRINT];
      expect(types.length > 0).assertTrue();
      for (let i: number = 0; i < types.length; i++) {
        expect(typeof types[i]).assertEqual('number');
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0080 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0081
     * @tc.number SUB_USER_AUTH_MATRIX_0081
     * @tc.desc   Verify auth type array 31.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0081 begin');
      const types: userAuth.UserAuthType[] = [userAuth.UserAuthType.PIN, userAuth.UserAuthType.FACE];
      expect(types.length > 0).assertTrue();
      for (let i: number = 0; i < types.length; i++) {
        expect(typeof types[i]).assertEqual('number');
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0081 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0082
     * @tc.number SUB_USER_AUTH_MATRIX_0082
     * @tc.desc   Verify auth type array 32.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0082 begin');
      const types: userAuth.UserAuthType[] = [userAuth.UserAuthType.PIN, userAuth.UserAuthType.FINGERPRINT];
      expect(types.length > 0).assertTrue();
      for (let i: number = 0; i < types.length; i++) {
        expect(typeof types[i]).assertEqual('number');
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0082 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0083
     * @tc.number SUB_USER_AUTH_MATRIX_0083
     * @tc.desc   Verify auth type array 33.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0083 begin');
      const types: userAuth.UserAuthType[] = [userAuth.UserAuthType.FACE, userAuth.UserAuthType.FINGERPRINT];
      expect(types.length > 0).assertTrue();
      for (let i: number = 0; i < types.length; i++) {
        expect(typeof types[i]).assertEqual('number');
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0083 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0084
     * @tc.number SUB_USER_AUTH_MATRIX_0084
     * @tc.desc   Verify auth type array 34.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0084 begin');
      const types: userAuth.UserAuthType[] = [userAuth.UserAuthType.PIN, userAuth.UserAuthType.FACE, userAuth.UserAuthType.FINGERPRINT];
      expect(types.length > 0).assertTrue();
      for (let i: number = 0; i < types.length; i++) {
        expect(typeof types[i]).assertEqual('number');
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0084 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0085
     * @tc.number SUB_USER_AUTH_MATRIX_0085
     * @tc.desc   Verify auth type array 35.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0085 begin');
      const types: userAuth.UserAuthType[] = [userAuth.UserAuthType.PIN];
      expect(types.length > 0).assertTrue();
      for (let i: number = 0; i < types.length; i++) {
        expect(typeof types[i]).assertEqual('number');
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0085 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0086
     * @tc.number SUB_USER_AUTH_MATRIX_0086
     * @tc.desc   Verify auth type array 36.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0086 begin');
      const types: userAuth.UserAuthType[] = [userAuth.UserAuthType.FACE];
      expect(types.length > 0).assertTrue();
      for (let i: number = 0; i < types.length; i++) {
        expect(typeof types[i]).assertEqual('number');
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0086 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0087
     * @tc.number SUB_USER_AUTH_MATRIX_0087
     * @tc.desc   Verify auth type array 37.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0087 begin');
      const types: userAuth.UserAuthType[] = [userAuth.UserAuthType.FINGERPRINT];
      expect(types.length > 0).assertTrue();
      for (let i: number = 0; i < types.length; i++) {
        expect(typeof types[i]).assertEqual('number');
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0087 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0088
     * @tc.number SUB_USER_AUTH_MATRIX_0088
     * @tc.desc   Verify auth type array 38.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0088 begin');
      const types: userAuth.UserAuthType[] = [userAuth.UserAuthType.PIN, userAuth.UserAuthType.FACE];
      expect(types.length > 0).assertTrue();
      for (let i: number = 0; i < types.length; i++) {
        expect(typeof types[i]).assertEqual('number');
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0088 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0089
     * @tc.number SUB_USER_AUTH_MATRIX_0089
     * @tc.desc   Verify auth type array 39.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0089 begin');
      const types: userAuth.UserAuthType[] = [userAuth.UserAuthType.PIN, userAuth.UserAuthType.FINGERPRINT];
      expect(types.length > 0).assertTrue();
      for (let i: number = 0; i < types.length; i++) {
        expect(typeof types[i]).assertEqual('number');
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0089 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0090
     * @tc.number SUB_USER_AUTH_MATRIX_0090
     * @tc.desc   Verify auth type array 40.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0090 begin');
      const types: userAuth.UserAuthType[] = [userAuth.UserAuthType.FACE, userAuth.UserAuthType.FINGERPRINT];
      expect(types.length > 0).assertTrue();
      for (let i: number = 0; i < types.length; i++) {
        expect(typeof types[i]).assertEqual('number');
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0090 end');
    })
    /**
     * @tc.name   testUserAuthMatrix0091
     * @tc.number SUB_USER_AUTH_MATRIX_0091
     * @tc.desc   Verify auth type array 41.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMatrix0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0091 begin');
      const types: userAuth.UserAuthType[] = [userAuth.UserAuthType.PIN, userAuth.UserAuthType.FACE, userAuth.UserAuthType.FINGERPRINT];
      expect(types.length > 0).assertTrue();
      for (let i: number = 0; i < types.length; i++) {
        expect(typeof types[i]).assertEqual('number');
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMatrix0091 end');
    })
  })
}
