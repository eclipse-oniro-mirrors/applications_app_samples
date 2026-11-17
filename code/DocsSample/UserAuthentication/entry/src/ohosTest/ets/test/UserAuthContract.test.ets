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

export default function userAuthContractTest() {
  describe('UserAuthContractTest', () => {
    /**
     * @tc.name   testUserAuthContract0001
     * @tc.number SUB_USER_AUTH_CONTRACT_0001
     * @tc.desc   Verify UserAuthType.PIN value 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthContract0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthContract0001 begin');
      const authType: userAuth.UserAuthType = userAuth.UserAuthType.PIN;
      expect(authType).assertEqual(1);
      expect(typeof authType).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthContract0001 end');
    })

    /**
     * @tc.name   testUserAuthContract0002
     * @tc.number SUB_USER_AUTH_CONTRACT_0002
     * @tc.desc   Verify UserAuthType.PIN value 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthContract0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthContract0002 begin');
      const authType: userAuth.UserAuthType = userAuth.UserAuthType.PIN;
      expect(authType).assertEqual(1);
      expect(typeof authType).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthContract0002 end');
    })

    /**
     * @tc.name   testUserAuthContract0003
     * @tc.number SUB_USER_AUTH_CONTRACT_0003
     * @tc.desc   Verify UserAuthType.PIN value 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthContract0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthContract0003 begin');
      const authType: userAuth.UserAuthType = userAuth.UserAuthType.PIN;
      expect(authType).assertEqual(1);
      expect(typeof authType).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthContract0003 end');
    })

    /**
     * @tc.name   testUserAuthContract0004
     * @tc.number SUB_USER_AUTH_CONTRACT_0004
     * @tc.desc   Verify UserAuthType.PIN value 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthContract0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthContract0004 begin');
      const authType: userAuth.UserAuthType = userAuth.UserAuthType.PIN;
      expect(authType).assertEqual(1);
      expect(typeof authType).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthContract0004 end');
    })

    /**
     * @tc.name   testUserAuthContract0005
     * @tc.number SUB_USER_AUTH_CONTRACT_0005
     * @tc.desc   Verify UserAuthType.PIN value 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthContract0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthContract0005 begin');
      const authType: userAuth.UserAuthType = userAuth.UserAuthType.PIN;
      expect(authType).assertEqual(1);
      expect(typeof authType).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthContract0005 end');
    })

    /**
     * @tc.name   testUserAuthContract0006
     * @tc.number SUB_USER_AUTH_CONTRACT_0006
     * @tc.desc   Verify UserAuthType.FACE value 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthContract0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthContract0006 begin');
      const authType: userAuth.UserAuthType = userAuth.UserAuthType.FACE;
      expect(authType).assertEqual(2);
      expect(typeof authType).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthContract0006 end');
    })

    /**
     * @tc.name   testUserAuthContract0007
     * @tc.number SUB_USER_AUTH_CONTRACT_0007
     * @tc.desc   Verify UserAuthType.FACE value 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthContract0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthContract0007 begin');
      const authType: userAuth.UserAuthType = userAuth.UserAuthType.FACE;
      expect(authType).assertEqual(2);
      expect(typeof authType).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthContract0007 end');
    })

    /**
     * @tc.name   testUserAuthContract0008
     * @tc.number SUB_USER_AUTH_CONTRACT_0008
     * @tc.desc   Verify UserAuthType.FACE value 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthContract0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthContract0008 begin');
      const authType: userAuth.UserAuthType = userAuth.UserAuthType.FACE;
      expect(authType).assertEqual(2);
      expect(typeof authType).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthContract0008 end');
    })

    /**
     * @tc.name   testUserAuthContract0009
     * @tc.number SUB_USER_AUTH_CONTRACT_0009
     * @tc.desc   Verify UserAuthType.FACE value 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthContract0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthContract0009 begin');
      const authType: userAuth.UserAuthType = userAuth.UserAuthType.FACE;
      expect(authType).assertEqual(2);
      expect(typeof authType).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthContract0009 end');
    })

    /**
     * @tc.name   testUserAuthContract0010
     * @tc.number SUB_USER_AUTH_CONTRACT_0010
     * @tc.desc   Verify UserAuthType.FACE value 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthContract0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthContract0010 begin');
      const authType: userAuth.UserAuthType = userAuth.UserAuthType.FACE;
      expect(authType).assertEqual(2);
      expect(typeof authType).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthContract0010 end');
    })

    /**
     * @tc.name   testUserAuthContract0011
     * @tc.number SUB_USER_AUTH_CONTRACT_0011
     * @tc.desc   Verify UserAuthType.FINGERPRINT value 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthContract0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthContract0011 begin');
      const authType: userAuth.UserAuthType = userAuth.UserAuthType.FINGERPRINT;
      expect(authType).assertEqual(4);
      expect(typeof authType).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthContract0011 end');
    })

    /**
     * @tc.name   testUserAuthContract0012
     * @tc.number SUB_USER_AUTH_CONTRACT_0012
     * @tc.desc   Verify UserAuthType.FINGERPRINT value 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthContract0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthContract0012 begin');
      const authType: userAuth.UserAuthType = userAuth.UserAuthType.FINGERPRINT;
      expect(authType).assertEqual(4);
      expect(typeof authType).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthContract0012 end');
    })

    /**
     * @tc.name   testUserAuthContract0013
     * @tc.number SUB_USER_AUTH_CONTRACT_0013
     * @tc.desc   Verify UserAuthType.FINGERPRINT value 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthContract0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthContract0013 begin');
      const authType: userAuth.UserAuthType = userAuth.UserAuthType.FINGERPRINT;
      expect(authType).assertEqual(4);
      expect(typeof authType).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthContract0013 end');
    })

    /**
     * @tc.name   testUserAuthContract0014
     * @tc.number SUB_USER_AUTH_CONTRACT_0014
     * @tc.desc   Verify UserAuthType.FINGERPRINT value 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthContract0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthContract0014 begin');
      const authType: userAuth.UserAuthType = userAuth.UserAuthType.FINGERPRINT;
      expect(authType).assertEqual(4);
      expect(typeof authType).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthContract0014 end');
    })

    /**
     * @tc.name   testUserAuthContract0015
     * @tc.number SUB_USER_AUTH_CONTRACT_0015
     * @tc.desc   Verify UserAuthType.FINGERPRINT value 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthContract0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthContract0015 begin');
      const authType: userAuth.UserAuthType = userAuth.UserAuthType.FINGERPRINT;
      expect(authType).assertEqual(4);
      expect(typeof authType).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthContract0015 end');
    })

    /**
     * @tc.name   testUserAuthContract0016
     * @tc.number SUB_USER_AUTH_CONTRACT_0016
     * @tc.desc   Verify AuthTrustLevel.ATL1 value 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthContract0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthContract0016 begin');
      const level: userAuth.AuthTrustLevel = userAuth.AuthTrustLevel.ATL1;
      expect(level).assertEqual(10000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthContract0016 end');
    })

    /**
     * @tc.name   testUserAuthContract0017
     * @tc.number SUB_USER_AUTH_CONTRACT_0017
     * @tc.desc   Verify AuthTrustLevel.ATL1 value 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthContract0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthContract0017 begin');
      const level: userAuth.AuthTrustLevel = userAuth.AuthTrustLevel.ATL1;
      expect(level).assertEqual(10000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthContract0017 end');
    })

    /**
     * @tc.name   testUserAuthContract0018
     * @tc.number SUB_USER_AUTH_CONTRACT_0018
     * @tc.desc   Verify AuthTrustLevel.ATL1 value 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthContract0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthContract0018 begin');
      const level: userAuth.AuthTrustLevel = userAuth.AuthTrustLevel.ATL1;
      expect(level).assertEqual(10000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthContract0018 end');
    })

    /**
     * @tc.name   testUserAuthContract0019
     * @tc.number SUB_USER_AUTH_CONTRACT_0019
     * @tc.desc   Verify AuthTrustLevel.ATL1 value 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthContract0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthContract0019 begin');
      const level: userAuth.AuthTrustLevel = userAuth.AuthTrustLevel.ATL1;
      expect(level).assertEqual(10000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthContract0019 end');
    })

    /**
     * @tc.name   testUserAuthContract0020
     * @tc.number SUB_USER_AUTH_CONTRACT_0020
     * @tc.desc   Verify AuthTrustLevel.ATL1 value 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthContract0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthContract0020 begin');
      const level: userAuth.AuthTrustLevel = userAuth.AuthTrustLevel.ATL1;
      expect(level).assertEqual(10000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthContract0020 end');
    })

    /**
     * @tc.name   testUserAuthContract0021
     * @tc.number SUB_USER_AUTH_CONTRACT_0021
     * @tc.desc   Verify AuthTrustLevel.ATL2 value 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthContract0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthContract0021 begin');
      const level: userAuth.AuthTrustLevel = userAuth.AuthTrustLevel.ATL2;
      expect(level).assertEqual(20000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthContract0021 end');
    })

    /**
     * @tc.name   testUserAuthContract0022
     * @tc.number SUB_USER_AUTH_CONTRACT_0022
     * @tc.desc   Verify AuthTrustLevel.ATL2 value 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthContract0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthContract0022 begin');
      const level: userAuth.AuthTrustLevel = userAuth.AuthTrustLevel.ATL2;
      expect(level).assertEqual(20000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthContract0022 end');
    })

    /**
     * @tc.name   testUserAuthContract0023
     * @tc.number SUB_USER_AUTH_CONTRACT_0023
     * @tc.desc   Verify AuthTrustLevel.ATL2 value 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthContract0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthContract0023 begin');
      const level: userAuth.AuthTrustLevel = userAuth.AuthTrustLevel.ATL2;
      expect(level).assertEqual(20000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthContract0023 end');
    })

    /**
     * @tc.name   testUserAuthContract0024
     * @tc.number SUB_USER_AUTH_CONTRACT_0024
     * @tc.desc   Verify AuthTrustLevel.ATL2 value 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthContract0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthContract0024 begin');
      const level: userAuth.AuthTrustLevel = userAuth.AuthTrustLevel.ATL2;
      expect(level).assertEqual(20000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthContract0024 end');
    })

    /**
     * @tc.name   testUserAuthContract0025
     * @tc.number SUB_USER_AUTH_CONTRACT_0025
     * @tc.desc   Verify AuthTrustLevel.ATL2 value 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthContract0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthContract0025 begin');
      const level: userAuth.AuthTrustLevel = userAuth.AuthTrustLevel.ATL2;
      expect(level).assertEqual(20000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthContract0025 end');
    })

    /**
     * @tc.name   testUserAuthContract0026
     * @tc.number SUB_USER_AUTH_CONTRACT_0026
     * @tc.desc   Verify AuthTrustLevel.ATL3 value 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthContract0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthContract0026 begin');
      const level: userAuth.AuthTrustLevel = userAuth.AuthTrustLevel.ATL3;
      expect(level).assertEqual(30000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthContract0026 end');
    })

    /**
     * @tc.name   testUserAuthContract0027
     * @tc.number SUB_USER_AUTH_CONTRACT_0027
     * @tc.desc   Verify AuthTrustLevel.ATL3 value 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthContract0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthContract0027 begin');
      const level: userAuth.AuthTrustLevel = userAuth.AuthTrustLevel.ATL3;
      expect(level).assertEqual(30000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthContract0027 end');
    })

    /**
     * @tc.name   testUserAuthContract0028
     * @tc.number SUB_USER_AUTH_CONTRACT_0028
     * @tc.desc   Verify AuthTrustLevel.ATL3 value 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthContract0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthContract0028 begin');
      const level: userAuth.AuthTrustLevel = userAuth.AuthTrustLevel.ATL3;
      expect(level).assertEqual(30000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthContract0028 end');
    })

    /**
     * @tc.name   testUserAuthContract0029
     * @tc.number SUB_USER_AUTH_CONTRACT_0029
     * @tc.desc   Verify AuthTrustLevel.ATL3 value 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthContract0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthContract0029 begin');
      const level: userAuth.AuthTrustLevel = userAuth.AuthTrustLevel.ATL3;
      expect(level).assertEqual(30000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthContract0029 end');
    })

    /**
     * @tc.name   testUserAuthContract0030
     * @tc.number SUB_USER_AUTH_CONTRACT_0030
     * @tc.desc   Verify AuthTrustLevel.ATL3 value 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthContract0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthContract0030 begin');
      const level: userAuth.AuthTrustLevel = userAuth.AuthTrustLevel.ATL3;
      expect(level).assertEqual(30000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthContract0030 end');
    })

    /**
     * @tc.name   testUserAuthContract0031
     * @tc.number SUB_USER_AUTH_CONTRACT_0031
     * @tc.desc   Verify AuthTrustLevel.ATL4 value 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthContract0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthContract0031 begin');
      const level: userAuth.AuthTrustLevel = userAuth.AuthTrustLevel.ATL4;
      expect(level).assertEqual(40000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthContract0031 end');
    })

    /**
     * @tc.name   testUserAuthContract0032
     * @tc.number SUB_USER_AUTH_CONTRACT_0032
     * @tc.desc   Verify AuthTrustLevel.ATL4 value 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthContract0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthContract0032 begin');
      const level: userAuth.AuthTrustLevel = userAuth.AuthTrustLevel.ATL4;
      expect(level).assertEqual(40000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthContract0032 end');
    })

    /**
     * @tc.name   testUserAuthContract0033
     * @tc.number SUB_USER_AUTH_CONTRACT_0033
     * @tc.desc   Verify AuthTrustLevel.ATL4 value 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthContract0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthContract0033 begin');
      const level: userAuth.AuthTrustLevel = userAuth.AuthTrustLevel.ATL4;
      expect(level).assertEqual(40000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthContract0033 end');
    })

    /**
     * @tc.name   testUserAuthContract0034
     * @tc.number SUB_USER_AUTH_CONTRACT_0034
     * @tc.desc   Verify AuthTrustLevel.ATL4 value 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthContract0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthContract0034 begin');
      const level: userAuth.AuthTrustLevel = userAuth.AuthTrustLevel.ATL4;
      expect(level).assertEqual(40000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthContract0034 end');
    })

    /**
     * @tc.name   testUserAuthContract0035
     * @tc.number SUB_USER_AUTH_CONTRACT_0035
     * @tc.desc   Verify AuthTrustLevel.ATL4 value 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthContract0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthContract0035 begin');
      const level: userAuth.AuthTrustLevel = userAuth.AuthTrustLevel.ATL4;
      expect(level).assertEqual(40000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthContract0035 end');
    })

    /**
     * @tc.name   testUserAuthContract0036
     * @tc.number SUB_USER_AUTH_CONTRACT_0036
     * @tc.desc   Verify AuthParam combination 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthContract0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthContract0036 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(16),
        authType: [userAuth.UserAuthType.PIN, userAuth.UserAuthType.FACE, userAuth.UserAuthType.FINGERPRINT],
        authTrustLevel: userAuth.AuthTrustLevel.ATL3
      };
      expect(param.challenge.length).assertEqual(16);
      expect(param.authType.length).assertEqual(3);
      expect(param.authTrustLevel).assertEqual(30000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthContract0036 end');
    })

    /**
     * @tc.name   testUserAuthContract0037
     * @tc.number SUB_USER_AUTH_CONTRACT_0037
     * @tc.desc   Verify AuthParam combination 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthContract0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthContract0037 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(16),
        authType: [userAuth.UserAuthType.PIN, userAuth.UserAuthType.FACE, userAuth.UserAuthType.FINGERPRINT],
        authTrustLevel: userAuth.AuthTrustLevel.ATL3
      };
      expect(param.challenge.length).assertEqual(16);
      expect(param.authType.length).assertEqual(3);
      expect(param.authTrustLevel).assertEqual(30000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthContract0037 end');
    })

    /**
     * @tc.name   testUserAuthContract0038
     * @tc.number SUB_USER_AUTH_CONTRACT_0038
     * @tc.desc   Verify AuthParam combination 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthContract0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthContract0038 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(16),
        authType: [userAuth.UserAuthType.PIN, userAuth.UserAuthType.FACE, userAuth.UserAuthType.FINGERPRINT],
        authTrustLevel: userAuth.AuthTrustLevel.ATL3
      };
      expect(param.challenge.length).assertEqual(16);
      expect(param.authType.length).assertEqual(3);
      expect(param.authTrustLevel).assertEqual(30000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthContract0038 end');
    })

    /**
     * @tc.name   testUserAuthContract0039
     * @tc.number SUB_USER_AUTH_CONTRACT_0039
     * @tc.desc   Verify AuthParam combination 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthContract0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthContract0039 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(16),
        authType: [userAuth.UserAuthType.PIN, userAuth.UserAuthType.FACE, userAuth.UserAuthType.FINGERPRINT],
        authTrustLevel: userAuth.AuthTrustLevel.ATL3
      };
      expect(param.challenge.length).assertEqual(16);
      expect(param.authType.length).assertEqual(3);
      expect(param.authTrustLevel).assertEqual(30000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthContract0039 end');
    })

    /**
     * @tc.name   testUserAuthContract0040
     * @tc.number SUB_USER_AUTH_CONTRACT_0040
     * @tc.desc   Verify AuthParam combination 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthContract0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthContract0040 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(16),
        authType: [userAuth.UserAuthType.PIN, userAuth.UserAuthType.FACE, userAuth.UserAuthType.FINGERPRINT],
        authTrustLevel: userAuth.AuthTrustLevel.ATL3
      };
      expect(param.challenge.length).assertEqual(16);
      expect(param.authType.length).assertEqual(3);
      expect(param.authTrustLevel).assertEqual(30000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthContract0040 end');
    })

    /**
     * @tc.name   testUserAuthContract0041
     * @tc.number SUB_USER_AUTH_CONTRACT_0041
     * @tc.desc   Verify AuthParam combination 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthContract0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthContract0041 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(16),
        authType: [userAuth.UserAuthType.PIN, userAuth.UserAuthType.FACE, userAuth.UserAuthType.FINGERPRINT],
        authTrustLevel: userAuth.AuthTrustLevel.ATL3
      };
      expect(param.challenge.length).assertEqual(16);
      expect(param.authType.length).assertEqual(3);
      expect(param.authTrustLevel).assertEqual(30000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthContract0041 end');
    })

    /**
     * @tc.name   testUserAuthContract0042
     * @tc.number SUB_USER_AUTH_CONTRACT_0042
     * @tc.desc   Verify AuthParam combination 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthContract0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthContract0042 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(16),
        authType: [userAuth.UserAuthType.PIN, userAuth.UserAuthType.FACE, userAuth.UserAuthType.FINGERPRINT],
        authTrustLevel: userAuth.AuthTrustLevel.ATL3
      };
      expect(param.challenge.length).assertEqual(16);
      expect(param.authType.length).assertEqual(3);
      expect(param.authTrustLevel).assertEqual(30000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthContract0042 end');
    })

    /**
     * @tc.name   testUserAuthContract0043
     * @tc.number SUB_USER_AUTH_CONTRACT_0043
     * @tc.desc   Verify AuthParam combination 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthContract0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthContract0043 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(16),
        authType: [userAuth.UserAuthType.PIN, userAuth.UserAuthType.FACE, userAuth.UserAuthType.FINGERPRINT],
        authTrustLevel: userAuth.AuthTrustLevel.ATL3
      };
      expect(param.challenge.length).assertEqual(16);
      expect(param.authType.length).assertEqual(3);
      expect(param.authTrustLevel).assertEqual(30000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthContract0043 end');
    })

    /**
     * @tc.name   testUserAuthContract0044
     * @tc.number SUB_USER_AUTH_CONTRACT_0044
     * @tc.desc   Verify AuthParam combination 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthContract0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthContract0044 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(16),
        authType: [userAuth.UserAuthType.PIN, userAuth.UserAuthType.FACE, userAuth.UserAuthType.FINGERPRINT],
        authTrustLevel: userAuth.AuthTrustLevel.ATL3
      };
      expect(param.challenge.length).assertEqual(16);
      expect(param.authType.length).assertEqual(3);
      expect(param.authTrustLevel).assertEqual(30000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthContract0044 end');
    })

    /**
     * @tc.name   testUserAuthContract0045
     * @tc.number SUB_USER_AUTH_CONTRACT_0045
     * @tc.desc   Verify AuthParam combination 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthContract0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthContract0045 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(16),
        authType: [userAuth.UserAuthType.PIN, userAuth.UserAuthType.FACE, userAuth.UserAuthType.FINGERPRINT],
        authTrustLevel: userAuth.AuthTrustLevel.ATL3
      };
      expect(param.challenge.length).assertEqual(16);
      expect(param.authType.length).assertEqual(3);
      expect(param.authTrustLevel).assertEqual(30000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthContract0045 end');
    })

    /**
     * @tc.name   testUserAuthContract0046
     * @tc.number SUB_USER_AUTH_CONTRACT_0046
     * @tc.desc   Verify AuthParam challenge length 17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthContract0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthContract0046 begin');
      const challenge: Uint8Array = new Uint8Array(17);
      const param: userAuth.AuthParam = {
        challenge: challenge,
        authType: [userAuth.UserAuthType.FACE],
        authTrustLevel: userAuth.AuthTrustLevel.ATL2
      };
      expect(param.challenge.length).assertEqual(17);
      expect(param.authType[0]).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthContract0046 end');
    })

    /**
     * @tc.name   testUserAuthContract0047
     * @tc.number SUB_USER_AUTH_CONTRACT_0047
     * @tc.desc   Verify AuthParam challenge length 18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthContract0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthContract0047 begin');
      const challenge: Uint8Array = new Uint8Array(18);
      const param: userAuth.AuthParam = {
        challenge: challenge,
        authType: [userAuth.UserAuthType.FACE],
        authTrustLevel: userAuth.AuthTrustLevel.ATL2
      };
      expect(param.challenge.length).assertEqual(18);
      expect(param.authType[0]).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthContract0047 end');
    })

    /**
     * @tc.name   testUserAuthContract0048
     * @tc.number SUB_USER_AUTH_CONTRACT_0048
     * @tc.desc   Verify AuthParam challenge length 19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthContract0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthContract0048 begin');
      const challenge: Uint8Array = new Uint8Array(19);
      const param: userAuth.AuthParam = {
        challenge: challenge,
        authType: [userAuth.UserAuthType.FACE],
        authTrustLevel: userAuth.AuthTrustLevel.ATL2
      };
      expect(param.challenge.length).assertEqual(19);
      expect(param.authType[0]).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthContract0048 end');
    })

    /**
     * @tc.name   testUserAuthContract0049
     * @tc.number SUB_USER_AUTH_CONTRACT_0049
     * @tc.desc   Verify AuthParam challenge length 20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthContract0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthContract0049 begin');
      const challenge: Uint8Array = new Uint8Array(20);
      const param: userAuth.AuthParam = {
        challenge: challenge,
        authType: [userAuth.UserAuthType.FACE],
        authTrustLevel: userAuth.AuthTrustLevel.ATL2
      };
      expect(param.challenge.length).assertEqual(20);
      expect(param.authType[0]).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthContract0049 end');
    })

    /**
     * @tc.name   testUserAuthContract0050
     * @tc.number SUB_USER_AUTH_CONTRACT_0050
     * @tc.desc   Verify AuthParam challenge length 21.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthContract0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthContract0050 begin');
      const challenge: Uint8Array = new Uint8Array(21);
      const param: userAuth.AuthParam = {
        challenge: challenge,
        authType: [userAuth.UserAuthType.FACE],
        authTrustLevel: userAuth.AuthTrustLevel.ATL2
      };
      expect(param.challenge.length).assertEqual(21);
      expect(param.authType[0]).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthContract0050 end');
    })

    /**
     * @tc.name   testUserAuthContract0051
     * @tc.number SUB_USER_AUTH_CONTRACT_0051
     * @tc.desc   Verify AuthParam challenge length 22.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthContract0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthContract0051 begin');
      const challenge: Uint8Array = new Uint8Array(22);
      const param: userAuth.AuthParam = {
        challenge: challenge,
        authType: [userAuth.UserAuthType.FACE],
        authTrustLevel: userAuth.AuthTrustLevel.ATL2
      };
      expect(param.challenge.length).assertEqual(22);
      expect(param.authType[0]).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthContract0051 end');
    })

    /**
     * @tc.name   testUserAuthContract0052
     * @tc.number SUB_USER_AUTH_CONTRACT_0052
     * @tc.desc   Verify AuthParam challenge length 23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthContract0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthContract0052 begin');
      const challenge: Uint8Array = new Uint8Array(23);
      const param: userAuth.AuthParam = {
        challenge: challenge,
        authType: [userAuth.UserAuthType.FACE],
        authTrustLevel: userAuth.AuthTrustLevel.ATL2
      };
      expect(param.challenge.length).assertEqual(23);
      expect(param.authType[0]).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthContract0052 end');
    })

    /**
     * @tc.name   testUserAuthContract0053
     * @tc.number SUB_USER_AUTH_CONTRACT_0053
     * @tc.desc   Verify AuthParam challenge length 24.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthContract0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthContract0053 begin');
      const challenge: Uint8Array = new Uint8Array(24);
      const param: userAuth.AuthParam = {
        challenge: challenge,
        authType: [userAuth.UserAuthType.FACE],
        authTrustLevel: userAuth.AuthTrustLevel.ATL2
      };
      expect(param.challenge.length).assertEqual(24);
      expect(param.authType[0]).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthContract0053 end');
    })

    /**
     * @tc.name   testUserAuthContract0054
     * @tc.number SUB_USER_AUTH_CONTRACT_0054
     * @tc.desc   Verify AuthParam challenge length 25.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthContract0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthContract0054 begin');
      const challenge: Uint8Array = new Uint8Array(25);
      const param: userAuth.AuthParam = {
        challenge: challenge,
        authType: [userAuth.UserAuthType.FACE],
        authTrustLevel: userAuth.AuthTrustLevel.ATL2
      };
      expect(param.challenge.length).assertEqual(25);
      expect(param.authType[0]).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthContract0054 end');
    })

    /**
     * @tc.name   testUserAuthContract0055
     * @tc.number SUB_USER_AUTH_CONTRACT_0055
     * @tc.desc   Verify AuthParam challenge length 26.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthContract0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthContract0055 begin');
      const challenge: Uint8Array = new Uint8Array(26);
      const param: userAuth.AuthParam = {
        challenge: challenge,
        authType: [userAuth.UserAuthType.FACE],
        authTrustLevel: userAuth.AuthTrustLevel.ATL2
      };
      expect(param.challenge.length).assertEqual(26);
      expect(param.authType[0]).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthContract0055 end');
    })
  })
}
