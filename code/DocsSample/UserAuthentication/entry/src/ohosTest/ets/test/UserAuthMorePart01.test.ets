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

export default function userAuthMoreTestPart01() {
  describe('UserAuthMorePart01', () => {
    /**
     * @tc.name   testUserAuthMore0001
     * @tc.number SUB_USER_AUTH_MORE_0001
     * @tc.desc   Verify extended AuthParam 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0001 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(34),
        authType: [userAuth.UserAuthType.FACE],
        authTrustLevel: userAuth.AuthTrustLevel.ATL2
      };
      expect(param.challenge.length).assertEqual(34);
      expect(param.authType.length).assertEqual(1);
      expect(param.authTrustLevel).assertEqual(20000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0001 end');
    })
    /**
     * @tc.name   testUserAuthMore0002
     * @tc.number SUB_USER_AUTH_MORE_0002
     * @tc.desc   Verify extended AuthParam 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0002 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(35),
        authType: [userAuth.UserAuthType.FINGERPRINT],
        authTrustLevel: userAuth.AuthTrustLevel.ATL3
      };
      expect(param.challenge.length).assertEqual(35);
      expect(param.authType.length).assertEqual(1);
      expect(param.authTrustLevel).assertEqual(30000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0002 end');
    })
    /**
     * @tc.name   testUserAuthMore0003
     * @tc.number SUB_USER_AUTH_MORE_0003
     * @tc.desc   Verify extended AuthParam 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0003 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(36),
        authType: [userAuth.UserAuthType.PIN, userAuth.UserAuthType.FACE],
        authTrustLevel: userAuth.AuthTrustLevel.ATL4
      };
      expect(param.challenge.length).assertEqual(36);
      expect(param.authType.length).assertEqual(2);
      expect(param.authTrustLevel).assertEqual(40000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0003 end');
    })
    /**
     * @tc.name   testUserAuthMore0004
     * @tc.number SUB_USER_AUTH_MORE_0004
     * @tc.desc   Verify extended AuthParam 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0004 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(37),
        authType: [userAuth.UserAuthType.PIN, userAuth.UserAuthType.FINGERPRINT],
        authTrustLevel: userAuth.AuthTrustLevel.ATL1
      };
      expect(param.challenge.length).assertEqual(37);
      expect(param.authType.length).assertEqual(2);
      expect(param.authTrustLevel).assertEqual(10000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0004 end');
    })
    /**
     * @tc.name   testUserAuthMore0005
     * @tc.number SUB_USER_AUTH_MORE_0005
     * @tc.desc   Verify extended AuthParam 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0005 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(38),
        authType: [userAuth.UserAuthType.FACE, userAuth.UserAuthType.FINGERPRINT],
        authTrustLevel: userAuth.AuthTrustLevel.ATL2
      };
      expect(param.challenge.length).assertEqual(38);
      expect(param.authType.length).assertEqual(2);
      expect(param.authTrustLevel).assertEqual(20000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0005 end');
    })
    /**
     * @tc.name   testUserAuthMore0006
     * @tc.number SUB_USER_AUTH_MORE_0006
     * @tc.desc   Verify extended AuthParam 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0006 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(39),
        authType: [userAuth.UserAuthType.PIN, userAuth.UserAuthType.FACE, userAuth.UserAuthType.FINGERPRINT],
        authTrustLevel: userAuth.AuthTrustLevel.ATL3
      };
      expect(param.challenge.length).assertEqual(39);
      expect(param.authType.length).assertEqual(3);
      expect(param.authTrustLevel).assertEqual(30000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0006 end');
    })
    /**
     * @tc.name   testUserAuthMore0007
     * @tc.number SUB_USER_AUTH_MORE_0007
     * @tc.desc   Verify extended AuthParam 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0007 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(40),
        authType: [userAuth.UserAuthType.PIN],
        authTrustLevel: userAuth.AuthTrustLevel.ATL4
      };
      expect(param.challenge.length).assertEqual(40);
      expect(param.authType.length).assertEqual(1);
      expect(param.authTrustLevel).assertEqual(40000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0007 end');
    })
    /**
     * @tc.name   testUserAuthMore0008
     * @tc.number SUB_USER_AUTH_MORE_0008
     * @tc.desc   Verify extended AuthParam 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0008 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(41),
        authType: [userAuth.UserAuthType.FACE],
        authTrustLevel: userAuth.AuthTrustLevel.ATL1
      };
      expect(param.challenge.length).assertEqual(41);
      expect(param.authType.length).assertEqual(1);
      expect(param.authTrustLevel).assertEqual(10000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0008 end');
    })
    /**
     * @tc.name   testUserAuthMore0009
     * @tc.number SUB_USER_AUTH_MORE_0009
     * @tc.desc   Verify extended AuthParam 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0009 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(42),
        authType: [userAuth.UserAuthType.FINGERPRINT],
        authTrustLevel: userAuth.AuthTrustLevel.ATL2
      };
      expect(param.challenge.length).assertEqual(42);
      expect(param.authType.length).assertEqual(1);
      expect(param.authTrustLevel).assertEqual(20000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0009 end');
    })
    /**
     * @tc.name   testUserAuthMore0010
     * @tc.number SUB_USER_AUTH_MORE_0010
     * @tc.desc   Verify extended AuthParam 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0010 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(43),
        authType: [userAuth.UserAuthType.PIN, userAuth.UserAuthType.FACE],
        authTrustLevel: userAuth.AuthTrustLevel.ATL3
      };
      expect(param.challenge.length).assertEqual(43);
      expect(param.authType.length).assertEqual(2);
      expect(param.authTrustLevel).assertEqual(30000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0010 end');
    })
    /**
     * @tc.name   testUserAuthMore0011
     * @tc.number SUB_USER_AUTH_MORE_0011
     * @tc.desc   Verify extended AuthParam 11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0011 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(44),
        authType: [userAuth.UserAuthType.PIN, userAuth.UserAuthType.FINGERPRINT],
        authTrustLevel: userAuth.AuthTrustLevel.ATL4
      };
      expect(param.challenge.length).assertEqual(44);
      expect(param.authType.length).assertEqual(2);
      expect(param.authTrustLevel).assertEqual(40000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0011 end');
    })
    /**
     * @tc.name   testUserAuthMore0012
     * @tc.number SUB_USER_AUTH_MORE_0012
     * @tc.desc   Verify extended AuthParam 12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0012 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(45),
        authType: [userAuth.UserAuthType.FACE, userAuth.UserAuthType.FINGERPRINT],
        authTrustLevel: userAuth.AuthTrustLevel.ATL1
      };
      expect(param.challenge.length).assertEqual(45);
      expect(param.authType.length).assertEqual(2);
      expect(param.authTrustLevel).assertEqual(10000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0012 end');
    })
    /**
     * @tc.name   testUserAuthMore0013
     * @tc.number SUB_USER_AUTH_MORE_0013
     * @tc.desc   Verify extended AuthParam 13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0013 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(46),
        authType: [userAuth.UserAuthType.PIN, userAuth.UserAuthType.FACE, userAuth.UserAuthType.FINGERPRINT],
        authTrustLevel: userAuth.AuthTrustLevel.ATL2
      };
      expect(param.challenge.length).assertEqual(46);
      expect(param.authType.length).assertEqual(3);
      expect(param.authTrustLevel).assertEqual(20000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0013 end');
    })
    /**
     * @tc.name   testUserAuthMore0014
     * @tc.number SUB_USER_AUTH_MORE_0014
     * @tc.desc   Verify extended AuthParam 14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0014 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(47),
        authType: [userAuth.UserAuthType.PIN],
        authTrustLevel: userAuth.AuthTrustLevel.ATL3
      };
      expect(param.challenge.length).assertEqual(47);
      expect(param.authType.length).assertEqual(1);
      expect(param.authTrustLevel).assertEqual(30000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0014 end');
    })
    /**
     * @tc.name   testUserAuthMore0015
     * @tc.number SUB_USER_AUTH_MORE_0015
     * @tc.desc   Verify extended AuthParam 15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0015 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(48),
        authType: [userAuth.UserAuthType.FACE],
        authTrustLevel: userAuth.AuthTrustLevel.ATL4
      };
      expect(param.challenge.length).assertEqual(48);
      expect(param.authType.length).assertEqual(1);
      expect(param.authTrustLevel).assertEqual(40000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0015 end');
    })
    /**
     * @tc.name   testUserAuthMore0016
     * @tc.number SUB_USER_AUTH_MORE_0016
     * @tc.desc   Verify extended AuthParam 16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0016 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(49),
        authType: [userAuth.UserAuthType.FINGERPRINT],
        authTrustLevel: userAuth.AuthTrustLevel.ATL1
      };
      expect(param.challenge.length).assertEqual(49);
      expect(param.authType.length).assertEqual(1);
      expect(param.authTrustLevel).assertEqual(10000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0016 end');
    })
    /**
     * @tc.name   testUserAuthMore0017
     * @tc.number SUB_USER_AUTH_MORE_0017
     * @tc.desc   Verify extended AuthParam 17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0017 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(50),
        authType: [userAuth.UserAuthType.PIN, userAuth.UserAuthType.FACE],
        authTrustLevel: userAuth.AuthTrustLevel.ATL2
      };
      expect(param.challenge.length).assertEqual(50);
      expect(param.authType.length).assertEqual(2);
      expect(param.authTrustLevel).assertEqual(20000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0017 end');
    })
    /**
     * @tc.name   testUserAuthMore0018
     * @tc.number SUB_USER_AUTH_MORE_0018
     * @tc.desc   Verify extended AuthParam 18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0018 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(51),
        authType: [userAuth.UserAuthType.PIN, userAuth.UserAuthType.FINGERPRINT],
        authTrustLevel: userAuth.AuthTrustLevel.ATL3
      };
      expect(param.challenge.length).assertEqual(51);
      expect(param.authType.length).assertEqual(2);
      expect(param.authTrustLevel).assertEqual(30000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0018 end');
    })
    /**
     * @tc.name   testUserAuthMore0019
     * @tc.number SUB_USER_AUTH_MORE_0019
     * @tc.desc   Verify extended AuthParam 19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0019 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(52),
        authType: [userAuth.UserAuthType.FACE, userAuth.UserAuthType.FINGERPRINT],
        authTrustLevel: userAuth.AuthTrustLevel.ATL4
      };
      expect(param.challenge.length).assertEqual(52);
      expect(param.authType.length).assertEqual(2);
      expect(param.authTrustLevel).assertEqual(40000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0019 end');
    })
    /**
     * @tc.name   testUserAuthMore0020
     * @tc.number SUB_USER_AUTH_MORE_0020
     * @tc.desc   Verify extended AuthParam 20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0020 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(53),
        authType: [userAuth.UserAuthType.PIN, userAuth.UserAuthType.FACE, userAuth.UserAuthType.FINGERPRINT],
        authTrustLevel: userAuth.AuthTrustLevel.ATL1
      };
      expect(param.challenge.length).assertEqual(53);
      expect(param.authType.length).assertEqual(3);
      expect(param.authTrustLevel).assertEqual(10000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0020 end');
    })
    /**
     * @tc.name   testUserAuthMore0021
     * @tc.number SUB_USER_AUTH_MORE_0021
     * @tc.desc   Verify extended AuthParam 21.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0021 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(54),
        authType: [userAuth.UserAuthType.PIN],
        authTrustLevel: userAuth.AuthTrustLevel.ATL2
      };
      expect(param.challenge.length).assertEqual(54);
      expect(param.authType.length).assertEqual(1);
      expect(param.authTrustLevel).assertEqual(20000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0021 end');
    })
    /**
     * @tc.name   testUserAuthMore0022
     * @tc.number SUB_USER_AUTH_MORE_0022
     * @tc.desc   Verify extended AuthParam 22.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0022 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(55),
        authType: [userAuth.UserAuthType.FACE],
        authTrustLevel: userAuth.AuthTrustLevel.ATL3
      };
      expect(param.challenge.length).assertEqual(55);
      expect(param.authType.length).assertEqual(1);
      expect(param.authTrustLevel).assertEqual(30000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0022 end');
    })
    /**
     * @tc.name   testUserAuthMore0023
     * @tc.number SUB_USER_AUTH_MORE_0023
     * @tc.desc   Verify extended AuthParam 23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0023 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(56),
        authType: [userAuth.UserAuthType.FINGERPRINT],
        authTrustLevel: userAuth.AuthTrustLevel.ATL4
      };
      expect(param.challenge.length).assertEqual(56);
      expect(param.authType.length).assertEqual(1);
      expect(param.authTrustLevel).assertEqual(40000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0023 end');
    })
    /**
     * @tc.name   testUserAuthMore0024
     * @tc.number SUB_USER_AUTH_MORE_0024
     * @tc.desc   Verify extended AuthParam 24.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0024 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(57),
        authType: [userAuth.UserAuthType.PIN, userAuth.UserAuthType.FACE],
        authTrustLevel: userAuth.AuthTrustLevel.ATL1
      };
      expect(param.challenge.length).assertEqual(57);
      expect(param.authType.length).assertEqual(2);
      expect(param.authTrustLevel).assertEqual(10000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0024 end');
    })
    /**
     * @tc.name   testUserAuthMore0025
     * @tc.number SUB_USER_AUTH_MORE_0025
     * @tc.desc   Verify extended AuthParam 25.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0025 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(58),
        authType: [userAuth.UserAuthType.PIN, userAuth.UserAuthType.FINGERPRINT],
        authTrustLevel: userAuth.AuthTrustLevel.ATL2
      };
      expect(param.challenge.length).assertEqual(58);
      expect(param.authType.length).assertEqual(2);
      expect(param.authTrustLevel).assertEqual(20000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0025 end');
    })
    /**
     * @tc.name   testUserAuthMore0026
     * @tc.number SUB_USER_AUTH_MORE_0026
     * @tc.desc   Verify extended AuthParam 26.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0026 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(59),
        authType: [userAuth.UserAuthType.FACE, userAuth.UserAuthType.FINGERPRINT],
        authTrustLevel: userAuth.AuthTrustLevel.ATL3
      };
      expect(param.challenge.length).assertEqual(59);
      expect(param.authType.length).assertEqual(2);
      expect(param.authTrustLevel).assertEqual(30000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0026 end');
    })
    /**
     * @tc.name   testUserAuthMore0027
     * @tc.number SUB_USER_AUTH_MORE_0027
     * @tc.desc   Verify extended AuthParam 27.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0027 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(60),
        authType: [userAuth.UserAuthType.PIN, userAuth.UserAuthType.FACE, userAuth.UserAuthType.FINGERPRINT],
        authTrustLevel: userAuth.AuthTrustLevel.ATL4
      };
      expect(param.challenge.length).assertEqual(60);
      expect(param.authType.length).assertEqual(3);
      expect(param.authTrustLevel).assertEqual(40000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0027 end');
    })
    /**
     * @tc.name   testUserAuthMore0028
     * @tc.number SUB_USER_AUTH_MORE_0028
     * @tc.desc   Verify extended AuthParam 28.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0028 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(61),
        authType: [userAuth.UserAuthType.PIN],
        authTrustLevel: userAuth.AuthTrustLevel.ATL1
      };
      expect(param.challenge.length).assertEqual(61);
      expect(param.authType.length).assertEqual(1);
      expect(param.authTrustLevel).assertEqual(10000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0028 end');
    })
    /**
     * @tc.name   testUserAuthMore0029
     * @tc.number SUB_USER_AUTH_MORE_0029
     * @tc.desc   Verify extended AuthParam 29.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0029 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(62),
        authType: [userAuth.UserAuthType.FACE],
        authTrustLevel: userAuth.AuthTrustLevel.ATL2
      };
      expect(param.challenge.length).assertEqual(62);
      expect(param.authType.length).assertEqual(1);
      expect(param.authTrustLevel).assertEqual(20000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0029 end');
    })
    /**
     * @tc.name   testUserAuthMore0030
     * @tc.number SUB_USER_AUTH_MORE_0030
     * @tc.desc   Verify extended AuthParam 30.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0030 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(63),
        authType: [userAuth.UserAuthType.FINGERPRINT],
        authTrustLevel: userAuth.AuthTrustLevel.ATL3
      };
      expect(param.challenge.length).assertEqual(63);
      expect(param.authType.length).assertEqual(1);
      expect(param.authTrustLevel).assertEqual(30000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0030 end');
    })
    /**
     * @tc.name   testUserAuthMore0031
     * @tc.number SUB_USER_AUTH_MORE_0031
     * @tc.desc   Verify extended AuthParam 31.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0031 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(64),
        authType: [userAuth.UserAuthType.PIN, userAuth.UserAuthType.FACE],
        authTrustLevel: userAuth.AuthTrustLevel.ATL4
      };
      expect(param.challenge.length).assertEqual(64);
      expect(param.authType.length).assertEqual(2);
      expect(param.authTrustLevel).assertEqual(40000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0031 end');
    })
    /**
     * @tc.name   testUserAuthMore0032
     * @tc.number SUB_USER_AUTH_MORE_0032
     * @tc.desc   Verify extended AuthParam 32.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0032 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(65),
        authType: [userAuth.UserAuthType.PIN, userAuth.UserAuthType.FINGERPRINT],
        authTrustLevel: userAuth.AuthTrustLevel.ATL1
      };
      expect(param.challenge.length).assertEqual(65);
      expect(param.authType.length).assertEqual(2);
      expect(param.authTrustLevel).assertEqual(10000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0032 end');
    })
    /**
     * @tc.name   testUserAuthMore0033
     * @tc.number SUB_USER_AUTH_MORE_0033
     * @tc.desc   Verify extended AuthParam 33.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0033 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(66),
        authType: [userAuth.UserAuthType.FACE, userAuth.UserAuthType.FINGERPRINT],
        authTrustLevel: userAuth.AuthTrustLevel.ATL2
      };
      expect(param.challenge.length).assertEqual(66);
      expect(param.authType.length).assertEqual(2);
      expect(param.authTrustLevel).assertEqual(20000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0033 end');
    })
    /**
     * @tc.name   testUserAuthMore0034
     * @tc.number SUB_USER_AUTH_MORE_0034
     * @tc.desc   Verify extended AuthParam 34.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0034 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(67),
        authType: [userAuth.UserAuthType.PIN, userAuth.UserAuthType.FACE, userAuth.UserAuthType.FINGERPRINT],
        authTrustLevel: userAuth.AuthTrustLevel.ATL3
      };
      expect(param.challenge.length).assertEqual(67);
      expect(param.authType.length).assertEqual(3);
      expect(param.authTrustLevel).assertEqual(30000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0034 end');
    })
    /**
     * @tc.name   testUserAuthMore0035
     * @tc.number SUB_USER_AUTH_MORE_0035
     * @tc.desc   Verify extended AuthParam 35.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0035 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(68),
        authType: [userAuth.UserAuthType.PIN],
        authTrustLevel: userAuth.AuthTrustLevel.ATL4
      };
      expect(param.challenge.length).assertEqual(68);
      expect(param.authType.length).assertEqual(1);
      expect(param.authTrustLevel).assertEqual(40000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0035 end');
    })
    /**
     * @tc.name   testUserAuthMore0036
     * @tc.number SUB_USER_AUTH_MORE_0036
     * @tc.desc   Verify extended AuthParam 36.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0036 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(69),
        authType: [userAuth.UserAuthType.FACE],
        authTrustLevel: userAuth.AuthTrustLevel.ATL1
      };
      expect(param.challenge.length).assertEqual(69);
      expect(param.authType.length).assertEqual(1);
      expect(param.authTrustLevel).assertEqual(10000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0036 end');
    })
    /**
     * @tc.name   testUserAuthMore0037
     * @tc.number SUB_USER_AUTH_MORE_0037
     * @tc.desc   Verify extended AuthParam 37.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0037 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(70),
        authType: [userAuth.UserAuthType.FINGERPRINT],
        authTrustLevel: userAuth.AuthTrustLevel.ATL2
      };
      expect(param.challenge.length).assertEqual(70);
      expect(param.authType.length).assertEqual(1);
      expect(param.authTrustLevel).assertEqual(20000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0037 end');
    })
    /**
     * @tc.name   testUserAuthMore0038
     * @tc.number SUB_USER_AUTH_MORE_0038
     * @tc.desc   Verify extended AuthParam 38.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0038 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(71),
        authType: [userAuth.UserAuthType.PIN, userAuth.UserAuthType.FACE],
        authTrustLevel: userAuth.AuthTrustLevel.ATL3
      };
      expect(param.challenge.length).assertEqual(71);
      expect(param.authType.length).assertEqual(2);
      expect(param.authTrustLevel).assertEqual(30000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0038 end');
    })
    /**
     * @tc.name   testUserAuthMore0039
     * @tc.number SUB_USER_AUTH_MORE_0039
     * @tc.desc   Verify extended AuthParam 39.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0039 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(72),
        authType: [userAuth.UserAuthType.PIN, userAuth.UserAuthType.FINGERPRINT],
        authTrustLevel: userAuth.AuthTrustLevel.ATL4
      };
      expect(param.challenge.length).assertEqual(72);
      expect(param.authType.length).assertEqual(2);
      expect(param.authTrustLevel).assertEqual(40000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0039 end');
    })
    /**
     * @tc.name   testUserAuthMore0040
     * @tc.number SUB_USER_AUTH_MORE_0040
     * @tc.desc   Verify extended AuthParam 40.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0040 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(73),
        authType: [userAuth.UserAuthType.FACE, userAuth.UserAuthType.FINGERPRINT],
        authTrustLevel: userAuth.AuthTrustLevel.ATL1
      };
      expect(param.challenge.length).assertEqual(73);
      expect(param.authType.length).assertEqual(2);
      expect(param.authTrustLevel).assertEqual(10000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0040 end');
    })
    /**
     * @tc.name   testUserAuthMore0041
     * @tc.number SUB_USER_AUTH_MORE_0041
     * @tc.desc   Verify extended AuthParam 41.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0041 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(74),
        authType: [userAuth.UserAuthType.PIN, userAuth.UserAuthType.FACE, userAuth.UserAuthType.FINGERPRINT],
        authTrustLevel: userAuth.AuthTrustLevel.ATL2
      };
      expect(param.challenge.length).assertEqual(74);
      expect(param.authType.length).assertEqual(3);
      expect(param.authTrustLevel).assertEqual(20000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0041 end');
    })
    /**
     * @tc.name   testUserAuthMore0042
     * @tc.number SUB_USER_AUTH_MORE_0042
     * @tc.desc   Verify extended AuthParam 42.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0042 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(75),
        authType: [userAuth.UserAuthType.PIN],
        authTrustLevel: userAuth.AuthTrustLevel.ATL3
      };
      expect(param.challenge.length).assertEqual(75);
      expect(param.authType.length).assertEqual(1);
      expect(param.authTrustLevel).assertEqual(30000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0042 end');
    })
    /**
     * @tc.name   testUserAuthMore0043
     * @tc.number SUB_USER_AUTH_MORE_0043
     * @tc.desc   Verify extended AuthParam 43.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0043 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(76),
        authType: [userAuth.UserAuthType.FACE],
        authTrustLevel: userAuth.AuthTrustLevel.ATL4
      };
      expect(param.challenge.length).assertEqual(76);
      expect(param.authType.length).assertEqual(1);
      expect(param.authTrustLevel).assertEqual(40000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0043 end');
    })
    /**
     * @tc.name   testUserAuthMore0044
     * @tc.number SUB_USER_AUTH_MORE_0044
     * @tc.desc   Verify extended AuthParam 44.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0044 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(77),
        authType: [userAuth.UserAuthType.FINGERPRINT],
        authTrustLevel: userAuth.AuthTrustLevel.ATL1
      };
      expect(param.challenge.length).assertEqual(77);
      expect(param.authType.length).assertEqual(1);
      expect(param.authTrustLevel).assertEqual(10000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0044 end');
    })
    /**
     * @tc.name   testUserAuthMore0045
     * @tc.number SUB_USER_AUTH_MORE_0045
     * @tc.desc   Verify extended AuthParam 45.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0045 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(78),
        authType: [userAuth.UserAuthType.PIN, userAuth.UserAuthType.FACE],
        authTrustLevel: userAuth.AuthTrustLevel.ATL2
      };
      expect(param.challenge.length).assertEqual(78);
      expect(param.authType.length).assertEqual(2);
      expect(param.authTrustLevel).assertEqual(20000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0045 end');
    })
    /**
     * @tc.name   testUserAuthMore0046
     * @tc.number SUB_USER_AUTH_MORE_0046
     * @tc.desc   Verify extended AuthParam 46.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0046 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(79),
        authType: [userAuth.UserAuthType.PIN, userAuth.UserAuthType.FINGERPRINT],
        authTrustLevel: userAuth.AuthTrustLevel.ATL3
      };
      expect(param.challenge.length).assertEqual(79);
      expect(param.authType.length).assertEqual(2);
      expect(param.authTrustLevel).assertEqual(30000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0046 end');
    })
    /**
     * @tc.name   testUserAuthMore0047
     * @tc.number SUB_USER_AUTH_MORE_0047
     * @tc.desc   Verify extended AuthParam 47.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0047 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(80),
        authType: [userAuth.UserAuthType.FACE, userAuth.UserAuthType.FINGERPRINT],
        authTrustLevel: userAuth.AuthTrustLevel.ATL4
      };
      expect(param.challenge.length).assertEqual(80);
      expect(param.authType.length).assertEqual(2);
      expect(param.authTrustLevel).assertEqual(40000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0047 end');
    })
    /**
     * @tc.name   testUserAuthMore0048
     * @tc.number SUB_USER_AUTH_MORE_0048
     * @tc.desc   Verify extended AuthParam 48.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0048 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(81),
        authType: [userAuth.UserAuthType.PIN, userAuth.UserAuthType.FACE, userAuth.UserAuthType.FINGERPRINT],
        authTrustLevel: userAuth.AuthTrustLevel.ATL1
      };
      expect(param.challenge.length).assertEqual(81);
      expect(param.authType.length).assertEqual(3);
      expect(param.authTrustLevel).assertEqual(10000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0048 end');
    })
    /**
     * @tc.name   testUserAuthMore0049
     * @tc.number SUB_USER_AUTH_MORE_0049
     * @tc.desc   Verify extended AuthParam 49.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0049 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(82),
        authType: [userAuth.UserAuthType.PIN],
        authTrustLevel: userAuth.AuthTrustLevel.ATL2
      };
      expect(param.challenge.length).assertEqual(82);
      expect(param.authType.length).assertEqual(1);
      expect(param.authTrustLevel).assertEqual(20000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0049 end');
    })
    /**
     * @tc.name   testUserAuthMore0050
     * @tc.number SUB_USER_AUTH_MORE_0050
     * @tc.desc   Verify extended AuthParam 50.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0050 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(83),
        authType: [userAuth.UserAuthType.FACE],
        authTrustLevel: userAuth.AuthTrustLevel.ATL3
      };
      expect(param.challenge.length).assertEqual(83);
      expect(param.authType.length).assertEqual(1);
      expect(param.authTrustLevel).assertEqual(30000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0050 end');
    })
    /**
     * @tc.name   testUserAuthMore0051
     * @tc.number SUB_USER_AUTH_MORE_0051
     * @tc.desc   Verify extended auth type array 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0051 begin');
      const types: userAuth.UserAuthType[] = [userAuth.UserAuthType.FACE];
      expect(types.length).assertEqual(1);
      for (let j: number = 0; j < types.length; j++) {
        expect(types[j] > 0).assertTrue();
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0051 end');
    })
    /**
     * @tc.name   testUserAuthMore0052
     * @tc.number SUB_USER_AUTH_MORE_0052
     * @tc.desc   Verify extended auth type array 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0052 begin');
      const types: userAuth.UserAuthType[] = [userAuth.UserAuthType.FINGERPRINT];
      expect(types.length).assertEqual(1);
      for (let j: number = 0; j < types.length; j++) {
        expect(types[j] > 0).assertTrue();
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0052 end');
    })
    /**
     * @tc.name   testUserAuthMore0053
     * @tc.number SUB_USER_AUTH_MORE_0053
     * @tc.desc   Verify extended auth type array 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0053 begin');
      const types: userAuth.UserAuthType[] = [userAuth.UserAuthType.PIN, userAuth.UserAuthType.FACE];
      expect(types.length).assertEqual(2);
      for (let j: number = 0; j < types.length; j++) {
        expect(types[j] > 0).assertTrue();
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0053 end');
    })
    /**
     * @tc.name   testUserAuthMore0054
     * @tc.number SUB_USER_AUTH_MORE_0054
     * @tc.desc   Verify extended auth type array 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0054 begin');
      const types: userAuth.UserAuthType[] = [userAuth.UserAuthType.PIN, userAuth.UserAuthType.FINGERPRINT];
      expect(types.length).assertEqual(2);
      for (let j: number = 0; j < types.length; j++) {
        expect(types[j] > 0).assertTrue();
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0054 end');
    })
    /**
     * @tc.name   testUserAuthMore0055
     * @tc.number SUB_USER_AUTH_MORE_0055
     * @tc.desc   Verify extended auth type array 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0055 begin');
      const types: userAuth.UserAuthType[] = [userAuth.UserAuthType.FACE, userAuth.UserAuthType.FINGERPRINT];
      expect(types.length).assertEqual(2);
      for (let j: number = 0; j < types.length; j++) {
        expect(types[j] > 0).assertTrue();
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0055 end');
    })
    /**
     * @tc.name   testUserAuthMore0056
     * @tc.number SUB_USER_AUTH_MORE_0056
     * @tc.desc   Verify extended auth type array 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0056 begin');
      const types: userAuth.UserAuthType[] = [userAuth.UserAuthType.PIN, userAuth.UserAuthType.FACE, userAuth.UserAuthType.FINGERPRINT];
      expect(types.length).assertEqual(3);
      for (let j: number = 0; j < types.length; j++) {
        expect(types[j] > 0).assertTrue();
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0056 end');
    })
    /**
     * @tc.name   testUserAuthMore0057
     * @tc.number SUB_USER_AUTH_MORE_0057
     * @tc.desc   Verify extended auth type array 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0057 begin');
      const types: userAuth.UserAuthType[] = [userAuth.UserAuthType.PIN];
      expect(types.length).assertEqual(1);
      for (let j: number = 0; j < types.length; j++) {
        expect(types[j] > 0).assertTrue();
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0057 end');
    })
    /**
     * @tc.name   testUserAuthMore0058
     * @tc.number SUB_USER_AUTH_MORE_0058
     * @tc.desc   Verify extended auth type array 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0058 begin');
      const types: userAuth.UserAuthType[] = [userAuth.UserAuthType.FACE];
      expect(types.length).assertEqual(1);
      for (let j: number = 0; j < types.length; j++) {
        expect(types[j] > 0).assertTrue();
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0058 end');
    })
    /**
     * @tc.name   testUserAuthMore0059
     * @tc.number SUB_USER_AUTH_MORE_0059
     * @tc.desc   Verify extended auth type array 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0059 begin');
      const types: userAuth.UserAuthType[] = [userAuth.UserAuthType.FINGERPRINT];
      expect(types.length).assertEqual(1);
      for (let j: number = 0; j < types.length; j++) {
        expect(types[j] > 0).assertTrue();
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0059 end');
    })
    /**
     * @tc.name   testUserAuthMore0060
     * @tc.number SUB_USER_AUTH_MORE_0060
     * @tc.desc   Verify extended auth type array 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0060 begin');
      const types: userAuth.UserAuthType[] = [userAuth.UserAuthType.PIN, userAuth.UserAuthType.FACE];
      expect(types.length).assertEqual(2);
      for (let j: number = 0; j < types.length; j++) {
        expect(types[j] > 0).assertTrue();
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0060 end');
    })
    /**
     * @tc.name   testUserAuthMore0061
     * @tc.number SUB_USER_AUTH_MORE_0061
     * @tc.desc   Verify extended auth type array 11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0061 begin');
      const types: userAuth.UserAuthType[] = [userAuth.UserAuthType.PIN, userAuth.UserAuthType.FINGERPRINT];
      expect(types.length).assertEqual(2);
      for (let j: number = 0; j < types.length; j++) {
        expect(types[j] > 0).assertTrue();
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0061 end');
    })
    /**
     * @tc.name   testUserAuthMore0062
     * @tc.number SUB_USER_AUTH_MORE_0062
     * @tc.desc   Verify extended auth type array 12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0062 begin');
      const types: userAuth.UserAuthType[] = [userAuth.UserAuthType.FACE, userAuth.UserAuthType.FINGERPRINT];
      expect(types.length).assertEqual(2);
      for (let j: number = 0; j < types.length; j++) {
        expect(types[j] > 0).assertTrue();
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0062 end');
    })
    /**
     * @tc.name   testUserAuthMore0063
     * @tc.number SUB_USER_AUTH_MORE_0063
     * @tc.desc   Verify extended auth type array 13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0063 begin');
      const types: userAuth.UserAuthType[] = [userAuth.UserAuthType.PIN, userAuth.UserAuthType.FACE, userAuth.UserAuthType.FINGERPRINT];
      expect(types.length).assertEqual(3);
      for (let j: number = 0; j < types.length; j++) {
        expect(types[j] > 0).assertTrue();
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0063 end');
    })
    /**
     * @tc.name   testUserAuthMore0064
     * @tc.number SUB_USER_AUTH_MORE_0064
     * @tc.desc   Verify extended auth type array 14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0064 begin');
      const types: userAuth.UserAuthType[] = [userAuth.UserAuthType.PIN];
      expect(types.length).assertEqual(1);
      for (let j: number = 0; j < types.length; j++) {
        expect(types[j] > 0).assertTrue();
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0064 end');
    })
    /**
     * @tc.name   testUserAuthMore0065
     * @tc.number SUB_USER_AUTH_MORE_0065
     * @tc.desc   Verify extended auth type array 15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0065 begin');
      const types: userAuth.UserAuthType[] = [userAuth.UserAuthType.FACE];
      expect(types.length).assertEqual(1);
      for (let j: number = 0; j < types.length; j++) {
        expect(types[j] > 0).assertTrue();
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0065 end');
    })
    /**
     * @tc.name   testUserAuthMore0066
     * @tc.number SUB_USER_AUTH_MORE_0066
     * @tc.desc   Verify extended auth type array 16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0066 begin');
      const types: userAuth.UserAuthType[] = [userAuth.UserAuthType.FINGERPRINT];
      expect(types.length).assertEqual(1);
      for (let j: number = 0; j < types.length; j++) {
        expect(types[j] > 0).assertTrue();
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0066 end');
    })
    /**
     * @tc.name   testUserAuthMore0067
     * @tc.number SUB_USER_AUTH_MORE_0067
     * @tc.desc   Verify extended auth type array 17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0067 begin');
      const types: userAuth.UserAuthType[] = [userAuth.UserAuthType.PIN, userAuth.UserAuthType.FACE];
      expect(types.length).assertEqual(2);
      for (let j: number = 0; j < types.length; j++) {
        expect(types[j] > 0).assertTrue();
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0067 end');
    })
    /**
     * @tc.name   testUserAuthMore0068
     * @tc.number SUB_USER_AUTH_MORE_0068
     * @tc.desc   Verify extended auth type array 18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0068 begin');
      const types: userAuth.UserAuthType[] = [userAuth.UserAuthType.PIN, userAuth.UserAuthType.FINGERPRINT];
      expect(types.length).assertEqual(2);
      for (let j: number = 0; j < types.length; j++) {
        expect(types[j] > 0).assertTrue();
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0068 end');
    })
    /**
     * @tc.name   testUserAuthMore0069
     * @tc.number SUB_USER_AUTH_MORE_0069
     * @tc.desc   Verify extended auth type array 19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0069 begin');
      const types: userAuth.UserAuthType[] = [userAuth.UserAuthType.FACE, userAuth.UserAuthType.FINGERPRINT];
      expect(types.length).assertEqual(2);
      for (let j: number = 0; j < types.length; j++) {
        expect(types[j] > 0).assertTrue();
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0069 end');
    })
    /**
     * @tc.name   testUserAuthMore0070
     * @tc.number SUB_USER_AUTH_MORE_0070
     * @tc.desc   Verify extended auth type array 20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0070 begin');
      const types: userAuth.UserAuthType[] = [userAuth.UserAuthType.PIN, userAuth.UserAuthType.FACE, userAuth.UserAuthType.FINGERPRINT];
      expect(types.length).assertEqual(3);
      for (let j: number = 0; j < types.length; j++) {
        expect(types[j] > 0).assertTrue();
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0070 end');
    })
    /**
     * @tc.name   testUserAuthMore0071
     * @tc.number SUB_USER_AUTH_MORE_0071
     * @tc.desc   Verify extended auth type array 21.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0071 begin');
      const types: userAuth.UserAuthType[] = [userAuth.UserAuthType.PIN];
      expect(types.length).assertEqual(1);
      for (let j: number = 0; j < types.length; j++) {
        expect(types[j] > 0).assertTrue();
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0071 end');
    })
    /**
     * @tc.name   testUserAuthMore0072
     * @tc.number SUB_USER_AUTH_MORE_0072
     * @tc.desc   Verify extended auth type array 22.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0072 begin');
      const types: userAuth.UserAuthType[] = [userAuth.UserAuthType.FACE];
      expect(types.length).assertEqual(1);
      for (let j: number = 0; j < types.length; j++) {
        expect(types[j] > 0).assertTrue();
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0072 end');
    })
    /**
     * @tc.name   testUserAuthMore0073
     * @tc.number SUB_USER_AUTH_MORE_0073
     * @tc.desc   Verify extended auth type array 23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0073 begin');
      const types: userAuth.UserAuthType[] = [userAuth.UserAuthType.FINGERPRINT];
      expect(types.length).assertEqual(1);
      for (let j: number = 0; j < types.length; j++) {
        expect(types[j] > 0).assertTrue();
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0073 end');
    })
    /**
     * @tc.name   testUserAuthMore0074
     * @tc.number SUB_USER_AUTH_MORE_0074
     * @tc.desc   Verify extended auth type array 24.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0074 begin');
      const types: userAuth.UserAuthType[] = [userAuth.UserAuthType.PIN, userAuth.UserAuthType.FACE];
      expect(types.length).assertEqual(2);
      for (let j: number = 0; j < types.length; j++) {
        expect(types[j] > 0).assertTrue();
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0074 end');
    })
    /**
     * @tc.name   testUserAuthMore0075
     * @tc.number SUB_USER_AUTH_MORE_0075
     * @tc.desc   Verify extended auth type array 25.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0075 begin');
      const types: userAuth.UserAuthType[] = [userAuth.UserAuthType.PIN, userAuth.UserAuthType.FINGERPRINT];
      expect(types.length).assertEqual(2);
      for (let j: number = 0; j < types.length; j++) {
        expect(types[j] > 0).assertTrue();
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0075 end');
    })
    /**
     * @tc.name   testUserAuthMore0076
     * @tc.number SUB_USER_AUTH_MORE_0076
     * @tc.desc   Verify extended auth type array 26.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0076 begin');
      const types: userAuth.UserAuthType[] = [userAuth.UserAuthType.FACE, userAuth.UserAuthType.FINGERPRINT];
      expect(types.length).assertEqual(2);
      for (let j: number = 0; j < types.length; j++) {
        expect(types[j] > 0).assertTrue();
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0076 end');
    })
    /**
     * @tc.name   testUserAuthMore0077
     * @tc.number SUB_USER_AUTH_MORE_0077
     * @tc.desc   Verify extended auth type array 27.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0077 begin');
      const types: userAuth.UserAuthType[] = [userAuth.UserAuthType.PIN, userAuth.UserAuthType.FACE, userAuth.UserAuthType.FINGERPRINT];
      expect(types.length).assertEqual(3);
      for (let j: number = 0; j < types.length; j++) {
        expect(types[j] > 0).assertTrue();
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0077 end');
    })
    /**
     * @tc.name   testUserAuthMore0078
     * @tc.number SUB_USER_AUTH_MORE_0078
     * @tc.desc   Verify extended auth type array 28.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0078 begin');
      const types: userAuth.UserAuthType[] = [userAuth.UserAuthType.PIN];
      expect(types.length).assertEqual(1);
      for (let j: number = 0; j < types.length; j++) {
        expect(types[j] > 0).assertTrue();
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0078 end');
    })
    /**
     * @tc.name   testUserAuthMore0079
     * @tc.number SUB_USER_AUTH_MORE_0079
     * @tc.desc   Verify extended auth type array 29.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0079 begin');
      const types: userAuth.UserAuthType[] = [userAuth.UserAuthType.FACE];
      expect(types.length).assertEqual(1);
      for (let j: number = 0; j < types.length; j++) {
        expect(types[j] > 0).assertTrue();
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0079 end');
    })
    /**
     * @tc.name   testUserAuthMore0080
     * @tc.number SUB_USER_AUTH_MORE_0080
     * @tc.desc   Verify extended auth type array 30.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0080 begin');
      const types: userAuth.UserAuthType[] = [userAuth.UserAuthType.FINGERPRINT];
      expect(types.length).assertEqual(1);
      for (let j: number = 0; j < types.length; j++) {
        expect(types[j] > 0).assertTrue();
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0080 end');
    })
    /**
     * @tc.name   testUserAuthMore0081
     * @tc.number SUB_USER_AUTH_MORE_0081
     * @tc.desc   Verify extended auth type array 31.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0081 begin');
      const types: userAuth.UserAuthType[] = [userAuth.UserAuthType.PIN, userAuth.UserAuthType.FACE];
      expect(types.length).assertEqual(2);
      for (let j: number = 0; j < types.length; j++) {
        expect(types[j] > 0).assertTrue();
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0081 end');
    })
    /**
     * @tc.name   testUserAuthMore0082
     * @tc.number SUB_USER_AUTH_MORE_0082
     * @tc.desc   Verify extended auth type array 32.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0082 begin');
      const types: userAuth.UserAuthType[] = [userAuth.UserAuthType.PIN, userAuth.UserAuthType.FINGERPRINT];
      expect(types.length).assertEqual(2);
      for (let j: number = 0; j < types.length; j++) {
        expect(types[j] > 0).assertTrue();
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0082 end');
    })
    /**
     * @tc.name   testUserAuthMore0083
     * @tc.number SUB_USER_AUTH_MORE_0083
     * @tc.desc   Verify extended auth type array 33.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0083 begin');
      const types: userAuth.UserAuthType[] = [userAuth.UserAuthType.FACE, userAuth.UserAuthType.FINGERPRINT];
      expect(types.length).assertEqual(2);
      for (let j: number = 0; j < types.length; j++) {
        expect(types[j] > 0).assertTrue();
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0083 end');
    })
    /**
     * @tc.name   testUserAuthMore0084
     * @tc.number SUB_USER_AUTH_MORE_0084
     * @tc.desc   Verify extended auth type array 34.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0084 begin');
      const types: userAuth.UserAuthType[] = [userAuth.UserAuthType.PIN, userAuth.UserAuthType.FACE, userAuth.UserAuthType.FINGERPRINT];
      expect(types.length).assertEqual(3);
      for (let j: number = 0; j < types.length; j++) {
        expect(types[j] > 0).assertTrue();
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0084 end');
    })
    /**
     * @tc.name   testUserAuthMore0085
     * @tc.number SUB_USER_AUTH_MORE_0085
     * @tc.desc   Verify extended auth type array 35.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0085 begin');
      const types: userAuth.UserAuthType[] = [userAuth.UserAuthType.PIN];
      expect(types.length).assertEqual(1);
      for (let j: number = 0; j < types.length; j++) {
        expect(types[j] > 0).assertTrue();
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0085 end');
    })
    /**
     * @tc.name   testUserAuthMore0086
     * @tc.number SUB_USER_AUTH_MORE_0086
     * @tc.desc   Verify extended auth type array 36.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0086 begin');
      const types: userAuth.UserAuthType[] = [userAuth.UserAuthType.FACE];
      expect(types.length).assertEqual(1);
      for (let j: number = 0; j < types.length; j++) {
        expect(types[j] > 0).assertTrue();
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0086 end');
    })
    /**
     * @tc.name   testUserAuthMore0087
     * @tc.number SUB_USER_AUTH_MORE_0087
     * @tc.desc   Verify extended auth type array 37.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0087 begin');
      const types: userAuth.UserAuthType[] = [userAuth.UserAuthType.FINGERPRINT];
      expect(types.length).assertEqual(1);
      for (let j: number = 0; j < types.length; j++) {
        expect(types[j] > 0).assertTrue();
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0087 end');
    })
    /**
     * @tc.name   testUserAuthMore0088
     * @tc.number SUB_USER_AUTH_MORE_0088
     * @tc.desc   Verify extended auth type array 38.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0088 begin');
      const types: userAuth.UserAuthType[] = [userAuth.UserAuthType.PIN, userAuth.UserAuthType.FACE];
      expect(types.length).assertEqual(2);
      for (let j: number = 0; j < types.length; j++) {
        expect(types[j] > 0).assertTrue();
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0088 end');
    })
    /**
     * @tc.name   testUserAuthMore0089
     * @tc.number SUB_USER_AUTH_MORE_0089
     * @tc.desc   Verify extended auth type array 39.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0089 begin');
      const types: userAuth.UserAuthType[] = [userAuth.UserAuthType.PIN, userAuth.UserAuthType.FINGERPRINT];
      expect(types.length).assertEqual(2);
      for (let j: number = 0; j < types.length; j++) {
        expect(types[j] > 0).assertTrue();
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0089 end');
    })
    /**
     * @tc.name   testUserAuthMore0090
     * @tc.number SUB_USER_AUTH_MORE_0090
     * @tc.desc   Verify extended auth type array 40.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0090 begin');
      const types: userAuth.UserAuthType[] = [userAuth.UserAuthType.FACE, userAuth.UserAuthType.FINGERPRINT];
      expect(types.length).assertEqual(2);
      for (let j: number = 0; j < types.length; j++) {
        expect(types[j] > 0).assertTrue();
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0090 end');
    })
    /**
     * @tc.name   testUserAuthMore0091
     * @tc.number SUB_USER_AUTH_MORE_0091
     * @tc.desc   Verify extended auth type array 41.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0091 begin');
      const types: userAuth.UserAuthType[] = [userAuth.UserAuthType.PIN, userAuth.UserAuthType.FACE, userAuth.UserAuthType.FINGERPRINT];
      expect(types.length).assertEqual(3);
      for (let j: number = 0; j < types.length; j++) {
        expect(types[j] > 0).assertTrue();
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0091 end');
    })
  })
}
