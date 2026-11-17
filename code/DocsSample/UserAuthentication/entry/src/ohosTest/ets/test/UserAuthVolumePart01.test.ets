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

export default function userAuthVolumeTestPart01() {
  describe('UserAuthVolumePart01', () => {
    /**
     * @tc.name   testUserAuthVolume0001
     * @tc.number SUB_USER_AUTH_VOLUME_0001
     * @tc.desc   Verify user auth parameter volume case 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0001 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(17),
        authType: [userAuth.UserAuthType.FACE],
        authTrustLevel: userAuth.AuthTrustLevel.ATL2
      };
      expect(param.challenge.length).assertEqual(17);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0001 end');
    })
    /**
     * @tc.name   testUserAuthVolume0002
     * @tc.number SUB_USER_AUTH_VOLUME_0002
     * @tc.desc   Verify user auth parameter volume case 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0002 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(18),
        authType: [userAuth.UserAuthType.FINGERPRINT],
        authTrustLevel: userAuth.AuthTrustLevel.ATL3
      };
      expect(param.challenge.length).assertEqual(18);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0002 end');
    })
    /**
     * @tc.name   testUserAuthVolume0003
     * @tc.number SUB_USER_AUTH_VOLUME_0003
     * @tc.desc   Verify user auth parameter volume case 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0003 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(19),
        authType: [userAuth.UserAuthType.PIN],
        authTrustLevel: userAuth.AuthTrustLevel.ATL4
      };
      expect(param.challenge.length).assertEqual(19);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0003 end');
    })
    /**
     * @tc.name   testUserAuthVolume0004
     * @tc.number SUB_USER_AUTH_VOLUME_0004
     * @tc.desc   Verify user auth parameter volume case 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0004 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(20),
        authType: [userAuth.UserAuthType.FACE],
        authTrustLevel: userAuth.AuthTrustLevel.ATL1
      };
      expect(param.challenge.length).assertEqual(20);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0004 end');
    })
    /**
     * @tc.name   testUserAuthVolume0005
     * @tc.number SUB_USER_AUTH_VOLUME_0005
     * @tc.desc   Verify user auth parameter volume case 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0005 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(21),
        authType: [userAuth.UserAuthType.FINGERPRINT],
        authTrustLevel: userAuth.AuthTrustLevel.ATL2
      };
      expect(param.challenge.length).assertEqual(21);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0005 end');
    })
    /**
     * @tc.name   testUserAuthVolume0006
     * @tc.number SUB_USER_AUTH_VOLUME_0006
     * @tc.desc   Verify user auth parameter volume case 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0006 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(22),
        authType: [userAuth.UserAuthType.PIN],
        authTrustLevel: userAuth.AuthTrustLevel.ATL3
      };
      expect(param.challenge.length).assertEqual(22);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0006 end');
    })
    /**
     * @tc.name   testUserAuthVolume0007
     * @tc.number SUB_USER_AUTH_VOLUME_0007
     * @tc.desc   Verify user auth parameter volume case 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0007 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(23),
        authType: [userAuth.UserAuthType.FACE],
        authTrustLevel: userAuth.AuthTrustLevel.ATL4
      };
      expect(param.challenge.length).assertEqual(23);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0007 end');
    })
    /**
     * @tc.name   testUserAuthVolume0008
     * @tc.number SUB_USER_AUTH_VOLUME_0008
     * @tc.desc   Verify user auth parameter volume case 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0008 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(24),
        authType: [userAuth.UserAuthType.FINGERPRINT],
        authTrustLevel: userAuth.AuthTrustLevel.ATL1
      };
      expect(param.challenge.length).assertEqual(24);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0008 end');
    })
    /**
     * @tc.name   testUserAuthVolume0009
     * @tc.number SUB_USER_AUTH_VOLUME_0009
     * @tc.desc   Verify user auth parameter volume case 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0009 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(25),
        authType: [userAuth.UserAuthType.PIN],
        authTrustLevel: userAuth.AuthTrustLevel.ATL2
      };
      expect(param.challenge.length).assertEqual(25);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0009 end');
    })
    /**
     * @tc.name   testUserAuthVolume0010
     * @tc.number SUB_USER_AUTH_VOLUME_0010
     * @tc.desc   Verify user auth parameter volume case 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0010 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(26),
        authType: [userAuth.UserAuthType.FACE],
        authTrustLevel: userAuth.AuthTrustLevel.ATL3
      };
      expect(param.challenge.length).assertEqual(26);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0010 end');
    })
    /**
     * @tc.name   testUserAuthVolume0011
     * @tc.number SUB_USER_AUTH_VOLUME_0011
     * @tc.desc   Verify user auth parameter volume case 11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0011 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(27),
        authType: [userAuth.UserAuthType.FINGERPRINT],
        authTrustLevel: userAuth.AuthTrustLevel.ATL4
      };
      expect(param.challenge.length).assertEqual(27);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0011 end');
    })
    /**
     * @tc.name   testUserAuthVolume0012
     * @tc.number SUB_USER_AUTH_VOLUME_0012
     * @tc.desc   Verify user auth parameter volume case 12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0012 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(28),
        authType: [userAuth.UserAuthType.PIN],
        authTrustLevel: userAuth.AuthTrustLevel.ATL1
      };
      expect(param.challenge.length).assertEqual(28);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0012 end');
    })
    /**
     * @tc.name   testUserAuthVolume0013
     * @tc.number SUB_USER_AUTH_VOLUME_0013
     * @tc.desc   Verify user auth parameter volume case 13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0013 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(29),
        authType: [userAuth.UserAuthType.FACE],
        authTrustLevel: userAuth.AuthTrustLevel.ATL2
      };
      expect(param.challenge.length).assertEqual(29);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0013 end');
    })
    /**
     * @tc.name   testUserAuthVolume0014
     * @tc.number SUB_USER_AUTH_VOLUME_0014
     * @tc.desc   Verify user auth parameter volume case 14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0014 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(30),
        authType: [userAuth.UserAuthType.FINGERPRINT],
        authTrustLevel: userAuth.AuthTrustLevel.ATL3
      };
      expect(param.challenge.length).assertEqual(30);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0014 end');
    })
    /**
     * @tc.name   testUserAuthVolume0015
     * @tc.number SUB_USER_AUTH_VOLUME_0015
     * @tc.desc   Verify user auth parameter volume case 15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0015 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(31),
        authType: [userAuth.UserAuthType.PIN],
        authTrustLevel: userAuth.AuthTrustLevel.ATL4
      };
      expect(param.challenge.length).assertEqual(31);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0015 end');
    })
    /**
     * @tc.name   testUserAuthVolume0016
     * @tc.number SUB_USER_AUTH_VOLUME_0016
     * @tc.desc   Verify user auth parameter volume case 16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0016 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(32),
        authType: [userAuth.UserAuthType.FACE],
        authTrustLevel: userAuth.AuthTrustLevel.ATL1
      };
      expect(param.challenge.length).assertEqual(32);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0016 end');
    })
    /**
     * @tc.name   testUserAuthVolume0017
     * @tc.number SUB_USER_AUTH_VOLUME_0017
     * @tc.desc   Verify user auth parameter volume case 17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0017 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(16),
        authType: [userAuth.UserAuthType.FINGERPRINT],
        authTrustLevel: userAuth.AuthTrustLevel.ATL2
      };
      expect(param.challenge.length).assertEqual(16);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0017 end');
    })
    /**
     * @tc.name   testUserAuthVolume0018
     * @tc.number SUB_USER_AUTH_VOLUME_0018
     * @tc.desc   Verify user auth parameter volume case 18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0018 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(17),
        authType: [userAuth.UserAuthType.PIN],
        authTrustLevel: userAuth.AuthTrustLevel.ATL3
      };
      expect(param.challenge.length).assertEqual(17);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0018 end');
    })
    /**
     * @tc.name   testUserAuthVolume0019
     * @tc.number SUB_USER_AUTH_VOLUME_0019
     * @tc.desc   Verify user auth parameter volume case 19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0019 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(18),
        authType: [userAuth.UserAuthType.FACE],
        authTrustLevel: userAuth.AuthTrustLevel.ATL4
      };
      expect(param.challenge.length).assertEqual(18);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0019 end');
    })
    /**
     * @tc.name   testUserAuthVolume0020
     * @tc.number SUB_USER_AUTH_VOLUME_0020
     * @tc.desc   Verify user auth parameter volume case 20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0020 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(19),
        authType: [userAuth.UserAuthType.FINGERPRINT],
        authTrustLevel: userAuth.AuthTrustLevel.ATL1
      };
      expect(param.challenge.length).assertEqual(19);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0020 end');
    })
    /**
     * @tc.name   testUserAuthVolume0021
     * @tc.number SUB_USER_AUTH_VOLUME_0021
     * @tc.desc   Verify user auth parameter volume case 21.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0021 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(20),
        authType: [userAuth.UserAuthType.PIN],
        authTrustLevel: userAuth.AuthTrustLevel.ATL2
      };
      expect(param.challenge.length).assertEqual(20);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0021 end');
    })
    /**
     * @tc.name   testUserAuthVolume0022
     * @tc.number SUB_USER_AUTH_VOLUME_0022
     * @tc.desc   Verify user auth parameter volume case 22.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0022 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(21),
        authType: [userAuth.UserAuthType.FACE],
        authTrustLevel: userAuth.AuthTrustLevel.ATL3
      };
      expect(param.challenge.length).assertEqual(21);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0022 end');
    })
    /**
     * @tc.name   testUserAuthVolume0023
     * @tc.number SUB_USER_AUTH_VOLUME_0023
     * @tc.desc   Verify user auth parameter volume case 23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0023 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(22),
        authType: [userAuth.UserAuthType.FINGERPRINT],
        authTrustLevel: userAuth.AuthTrustLevel.ATL4
      };
      expect(param.challenge.length).assertEqual(22);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0023 end');
    })
    /**
     * @tc.name   testUserAuthVolume0024
     * @tc.number SUB_USER_AUTH_VOLUME_0024
     * @tc.desc   Verify user auth parameter volume case 24.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0024 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(23),
        authType: [userAuth.UserAuthType.PIN],
        authTrustLevel: userAuth.AuthTrustLevel.ATL1
      };
      expect(param.challenge.length).assertEqual(23);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0024 end');
    })
    /**
     * @tc.name   testUserAuthVolume0025
     * @tc.number SUB_USER_AUTH_VOLUME_0025
     * @tc.desc   Verify user auth parameter volume case 25.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0025 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(24),
        authType: [userAuth.UserAuthType.FACE],
        authTrustLevel: userAuth.AuthTrustLevel.ATL2
      };
      expect(param.challenge.length).assertEqual(24);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0025 end');
    })
    /**
     * @tc.name   testUserAuthVolume0026
     * @tc.number SUB_USER_AUTH_VOLUME_0026
     * @tc.desc   Verify user auth parameter volume case 26.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0026 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(25),
        authType: [userAuth.UserAuthType.FINGERPRINT],
        authTrustLevel: userAuth.AuthTrustLevel.ATL3
      };
      expect(param.challenge.length).assertEqual(25);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0026 end');
    })
    /**
     * @tc.name   testUserAuthVolume0027
     * @tc.number SUB_USER_AUTH_VOLUME_0027
     * @tc.desc   Verify user auth parameter volume case 27.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0027 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(26),
        authType: [userAuth.UserAuthType.PIN],
        authTrustLevel: userAuth.AuthTrustLevel.ATL4
      };
      expect(param.challenge.length).assertEqual(26);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0027 end');
    })
    /**
     * @tc.name   testUserAuthVolume0028
     * @tc.number SUB_USER_AUTH_VOLUME_0028
     * @tc.desc   Verify user auth parameter volume case 28.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0028 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(27),
        authType: [userAuth.UserAuthType.FACE],
        authTrustLevel: userAuth.AuthTrustLevel.ATL1
      };
      expect(param.challenge.length).assertEqual(27);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0028 end');
    })
    /**
     * @tc.name   testUserAuthVolume0029
     * @tc.number SUB_USER_AUTH_VOLUME_0029
     * @tc.desc   Verify user auth parameter volume case 29.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0029 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(28),
        authType: [userAuth.UserAuthType.FINGERPRINT],
        authTrustLevel: userAuth.AuthTrustLevel.ATL2
      };
      expect(param.challenge.length).assertEqual(28);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0029 end');
    })
    /**
     * @tc.name   testUserAuthVolume0030
     * @tc.number SUB_USER_AUTH_VOLUME_0030
     * @tc.desc   Verify user auth parameter volume case 30.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0030 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(29),
        authType: [userAuth.UserAuthType.PIN],
        authTrustLevel: userAuth.AuthTrustLevel.ATL3
      };
      expect(param.challenge.length).assertEqual(29);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0030 end');
    })
    /**
     * @tc.name   testUserAuthVolume0031
     * @tc.number SUB_USER_AUTH_VOLUME_0031
     * @tc.desc   Verify user auth parameter volume case 31.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0031 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(30),
        authType: [userAuth.UserAuthType.FACE],
        authTrustLevel: userAuth.AuthTrustLevel.ATL4
      };
      expect(param.challenge.length).assertEqual(30);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0031 end');
    })
    /**
     * @tc.name   testUserAuthVolume0032
     * @tc.number SUB_USER_AUTH_VOLUME_0032
     * @tc.desc   Verify user auth parameter volume case 32.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0032 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(31),
        authType: [userAuth.UserAuthType.FINGERPRINT],
        authTrustLevel: userAuth.AuthTrustLevel.ATL1
      };
      expect(param.challenge.length).assertEqual(31);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0032 end');
    })
    /**
     * @tc.name   testUserAuthVolume0033
     * @tc.number SUB_USER_AUTH_VOLUME_0033
     * @tc.desc   Verify user auth parameter volume case 33.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0033 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(32),
        authType: [userAuth.UserAuthType.PIN],
        authTrustLevel: userAuth.AuthTrustLevel.ATL2
      };
      expect(param.challenge.length).assertEqual(32);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0033 end');
    })
    /**
     * @tc.name   testUserAuthVolume0034
     * @tc.number SUB_USER_AUTH_VOLUME_0034
     * @tc.desc   Verify user auth parameter volume case 34.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0034 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(16),
        authType: [userAuth.UserAuthType.FACE],
        authTrustLevel: userAuth.AuthTrustLevel.ATL3
      };
      expect(param.challenge.length).assertEqual(16);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0034 end');
    })
    /**
     * @tc.name   testUserAuthVolume0035
     * @tc.number SUB_USER_AUTH_VOLUME_0035
     * @tc.desc   Verify user auth parameter volume case 35.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0035 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(17),
        authType: [userAuth.UserAuthType.FINGERPRINT],
        authTrustLevel: userAuth.AuthTrustLevel.ATL4
      };
      expect(param.challenge.length).assertEqual(17);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0035 end');
    })
    /**
     * @tc.name   testUserAuthVolume0036
     * @tc.number SUB_USER_AUTH_VOLUME_0036
     * @tc.desc   Verify user auth parameter volume case 36.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0036 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(18),
        authType: [userAuth.UserAuthType.PIN],
        authTrustLevel: userAuth.AuthTrustLevel.ATL1
      };
      expect(param.challenge.length).assertEqual(18);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0036 end');
    })
    /**
     * @tc.name   testUserAuthVolume0037
     * @tc.number SUB_USER_AUTH_VOLUME_0037
     * @tc.desc   Verify user auth parameter volume case 37.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0037 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(19),
        authType: [userAuth.UserAuthType.FACE],
        authTrustLevel: userAuth.AuthTrustLevel.ATL2
      };
      expect(param.challenge.length).assertEqual(19);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0037 end');
    })
    /**
     * @tc.name   testUserAuthVolume0038
     * @tc.number SUB_USER_AUTH_VOLUME_0038
     * @tc.desc   Verify user auth parameter volume case 38.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0038 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(20),
        authType: [userAuth.UserAuthType.FINGERPRINT],
        authTrustLevel: userAuth.AuthTrustLevel.ATL3
      };
      expect(param.challenge.length).assertEqual(20);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0038 end');
    })
    /**
     * @tc.name   testUserAuthVolume0039
     * @tc.number SUB_USER_AUTH_VOLUME_0039
     * @tc.desc   Verify user auth parameter volume case 39.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0039 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(21),
        authType: [userAuth.UserAuthType.PIN],
        authTrustLevel: userAuth.AuthTrustLevel.ATL4
      };
      expect(param.challenge.length).assertEqual(21);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0039 end');
    })
    /**
     * @tc.name   testUserAuthVolume0040
     * @tc.number SUB_USER_AUTH_VOLUME_0040
     * @tc.desc   Verify user auth parameter volume case 40.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0040 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(22),
        authType: [userAuth.UserAuthType.FACE],
        authTrustLevel: userAuth.AuthTrustLevel.ATL1
      };
      expect(param.challenge.length).assertEqual(22);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0040 end');
    })
    /**
     * @tc.name   testUserAuthVolume0041
     * @tc.number SUB_USER_AUTH_VOLUME_0041
     * @tc.desc   Verify user auth parameter volume case 41.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0041 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(23),
        authType: [userAuth.UserAuthType.FINGERPRINT],
        authTrustLevel: userAuth.AuthTrustLevel.ATL2
      };
      expect(param.challenge.length).assertEqual(23);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0041 end');
    })
    /**
     * @tc.name   testUserAuthVolume0042
     * @tc.number SUB_USER_AUTH_VOLUME_0042
     * @tc.desc   Verify user auth parameter volume case 42.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0042 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(24),
        authType: [userAuth.UserAuthType.PIN],
        authTrustLevel: userAuth.AuthTrustLevel.ATL3
      };
      expect(param.challenge.length).assertEqual(24);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0042 end');
    })
    /**
     * @tc.name   testUserAuthVolume0043
     * @tc.number SUB_USER_AUTH_VOLUME_0043
     * @tc.desc   Verify user auth parameter volume case 43.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0043 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(25),
        authType: [userAuth.UserAuthType.FACE],
        authTrustLevel: userAuth.AuthTrustLevel.ATL4
      };
      expect(param.challenge.length).assertEqual(25);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0043 end');
    })
    /**
     * @tc.name   testUserAuthVolume0044
     * @tc.number SUB_USER_AUTH_VOLUME_0044
     * @tc.desc   Verify user auth parameter volume case 44.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0044 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(26),
        authType: [userAuth.UserAuthType.FINGERPRINT],
        authTrustLevel: userAuth.AuthTrustLevel.ATL1
      };
      expect(param.challenge.length).assertEqual(26);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0044 end');
    })
    /**
     * @tc.name   testUserAuthVolume0045
     * @tc.number SUB_USER_AUTH_VOLUME_0045
     * @tc.desc   Verify user auth parameter volume case 45.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0045 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(27),
        authType: [userAuth.UserAuthType.PIN],
        authTrustLevel: userAuth.AuthTrustLevel.ATL2
      };
      expect(param.challenge.length).assertEqual(27);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0045 end');
    })
    /**
     * @tc.name   testUserAuthVolume0046
     * @tc.number SUB_USER_AUTH_VOLUME_0046
     * @tc.desc   Verify user auth parameter volume case 46.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0046 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(28),
        authType: [userAuth.UserAuthType.FACE],
        authTrustLevel: userAuth.AuthTrustLevel.ATL3
      };
      expect(param.challenge.length).assertEqual(28);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0046 end');
    })
    /**
     * @tc.name   testUserAuthVolume0047
     * @tc.number SUB_USER_AUTH_VOLUME_0047
     * @tc.desc   Verify user auth parameter volume case 47.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0047 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(29),
        authType: [userAuth.UserAuthType.FINGERPRINT],
        authTrustLevel: userAuth.AuthTrustLevel.ATL4
      };
      expect(param.challenge.length).assertEqual(29);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0047 end');
    })
    /**
     * @tc.name   testUserAuthVolume0048
     * @tc.number SUB_USER_AUTH_VOLUME_0048
     * @tc.desc   Verify user auth parameter volume case 48.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0048 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(30),
        authType: [userAuth.UserAuthType.PIN],
        authTrustLevel: userAuth.AuthTrustLevel.ATL1
      };
      expect(param.challenge.length).assertEqual(30);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0048 end');
    })
    /**
     * @tc.name   testUserAuthVolume0049
     * @tc.number SUB_USER_AUTH_VOLUME_0049
     * @tc.desc   Verify user auth parameter volume case 49.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0049 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(31),
        authType: [userAuth.UserAuthType.FACE],
        authTrustLevel: userAuth.AuthTrustLevel.ATL2
      };
      expect(param.challenge.length).assertEqual(31);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0049 end');
    })
    /**
     * @tc.name   testUserAuthVolume0050
     * @tc.number SUB_USER_AUTH_VOLUME_0050
     * @tc.desc   Verify user auth parameter volume case 50.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0050 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(32),
        authType: [userAuth.UserAuthType.FINGERPRINT],
        authTrustLevel: userAuth.AuthTrustLevel.ATL3
      };
      expect(param.challenge.length).assertEqual(32);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0050 end');
    })
    /**
     * @tc.name   testUserAuthVolume0051
     * @tc.number SUB_USER_AUTH_VOLUME_0051
     * @tc.desc   Verify user auth parameter volume case 51.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0051 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(16),
        authType: [userAuth.UserAuthType.PIN],
        authTrustLevel: userAuth.AuthTrustLevel.ATL4
      };
      expect(param.challenge.length).assertEqual(16);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0051 end');
    })
    /**
     * @tc.name   testUserAuthVolume0052
     * @tc.number SUB_USER_AUTH_VOLUME_0052
     * @tc.desc   Verify user auth parameter volume case 52.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0052 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(17),
        authType: [userAuth.UserAuthType.FACE],
        authTrustLevel: userAuth.AuthTrustLevel.ATL1
      };
      expect(param.challenge.length).assertEqual(17);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0052 end');
    })
    /**
     * @tc.name   testUserAuthVolume0053
     * @tc.number SUB_USER_AUTH_VOLUME_0053
     * @tc.desc   Verify user auth parameter volume case 53.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0053 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(18),
        authType: [userAuth.UserAuthType.FINGERPRINT],
        authTrustLevel: userAuth.AuthTrustLevel.ATL2
      };
      expect(param.challenge.length).assertEqual(18);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0053 end');
    })
    /**
     * @tc.name   testUserAuthVolume0054
     * @tc.number SUB_USER_AUTH_VOLUME_0054
     * @tc.desc   Verify user auth parameter volume case 54.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0054 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(19),
        authType: [userAuth.UserAuthType.PIN],
        authTrustLevel: userAuth.AuthTrustLevel.ATL3
      };
      expect(param.challenge.length).assertEqual(19);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0054 end');
    })
    /**
     * @tc.name   testUserAuthVolume0055
     * @tc.number SUB_USER_AUTH_VOLUME_0055
     * @tc.desc   Verify user auth parameter volume case 55.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0055 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(20),
        authType: [userAuth.UserAuthType.FACE],
        authTrustLevel: userAuth.AuthTrustLevel.ATL4
      };
      expect(param.challenge.length).assertEqual(20);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0055 end');
    })
    /**
     * @tc.name   testUserAuthVolume0056
     * @tc.number SUB_USER_AUTH_VOLUME_0056
     * @tc.desc   Verify user auth parameter volume case 56.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0056 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(21),
        authType: [userAuth.UserAuthType.FINGERPRINT],
        authTrustLevel: userAuth.AuthTrustLevel.ATL1
      };
      expect(param.challenge.length).assertEqual(21);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0056 end');
    })
    /**
     * @tc.name   testUserAuthVolume0057
     * @tc.number SUB_USER_AUTH_VOLUME_0057
     * @tc.desc   Verify user auth parameter volume case 57.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0057 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(22),
        authType: [userAuth.UserAuthType.PIN],
        authTrustLevel: userAuth.AuthTrustLevel.ATL2
      };
      expect(param.challenge.length).assertEqual(22);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0057 end');
    })
    /**
     * @tc.name   testUserAuthVolume0058
     * @tc.number SUB_USER_AUTH_VOLUME_0058
     * @tc.desc   Verify user auth parameter volume case 58.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0058 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(23),
        authType: [userAuth.UserAuthType.FACE],
        authTrustLevel: userAuth.AuthTrustLevel.ATL3
      };
      expect(param.challenge.length).assertEqual(23);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0058 end');
    })
    /**
     * @tc.name   testUserAuthVolume0059
     * @tc.number SUB_USER_AUTH_VOLUME_0059
     * @tc.desc   Verify user auth parameter volume case 59.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0059 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(24),
        authType: [userAuth.UserAuthType.FINGERPRINT],
        authTrustLevel: userAuth.AuthTrustLevel.ATL4
      };
      expect(param.challenge.length).assertEqual(24);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0059 end');
    })
    /**
     * @tc.name   testUserAuthVolume0060
     * @tc.number SUB_USER_AUTH_VOLUME_0060
     * @tc.desc   Verify user auth parameter volume case 60.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0060 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(25),
        authType: [userAuth.UserAuthType.PIN],
        authTrustLevel: userAuth.AuthTrustLevel.ATL1
      };
      expect(param.challenge.length).assertEqual(25);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0060 end');
    })
    /**
     * @tc.name   testUserAuthVolume0061
     * @tc.number SUB_USER_AUTH_VOLUME_0061
     * @tc.desc   Verify user auth parameter volume case 61.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0061 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(26),
        authType: [userAuth.UserAuthType.FACE],
        authTrustLevel: userAuth.AuthTrustLevel.ATL2
      };
      expect(param.challenge.length).assertEqual(26);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0061 end');
    })
    /**
     * @tc.name   testUserAuthVolume0062
     * @tc.number SUB_USER_AUTH_VOLUME_0062
     * @tc.desc   Verify user auth parameter volume case 62.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0062 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(27),
        authType: [userAuth.UserAuthType.FINGERPRINT],
        authTrustLevel: userAuth.AuthTrustLevel.ATL3
      };
      expect(param.challenge.length).assertEqual(27);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0062 end');
    })
    /**
     * @tc.name   testUserAuthVolume0063
     * @tc.number SUB_USER_AUTH_VOLUME_0063
     * @tc.desc   Verify user auth parameter volume case 63.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0063 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(28),
        authType: [userAuth.UserAuthType.PIN],
        authTrustLevel: userAuth.AuthTrustLevel.ATL4
      };
      expect(param.challenge.length).assertEqual(28);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0063 end');
    })
    /**
     * @tc.name   testUserAuthVolume0064
     * @tc.number SUB_USER_AUTH_VOLUME_0064
     * @tc.desc   Verify user auth parameter volume case 64.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0064 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(29),
        authType: [userAuth.UserAuthType.FACE],
        authTrustLevel: userAuth.AuthTrustLevel.ATL1
      };
      expect(param.challenge.length).assertEqual(29);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0064 end');
    })
    /**
     * @tc.name   testUserAuthVolume0065
     * @tc.number SUB_USER_AUTH_VOLUME_0065
     * @tc.desc   Verify user auth parameter volume case 65.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0065 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(30),
        authType: [userAuth.UserAuthType.FINGERPRINT],
        authTrustLevel: userAuth.AuthTrustLevel.ATL2
      };
      expect(param.challenge.length).assertEqual(30);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0065 end');
    })
    /**
     * @tc.name   testUserAuthVolume0066
     * @tc.number SUB_USER_AUTH_VOLUME_0066
     * @tc.desc   Verify user auth parameter volume case 66.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0066 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(31),
        authType: [userAuth.UserAuthType.PIN],
        authTrustLevel: userAuth.AuthTrustLevel.ATL3
      };
      expect(param.challenge.length).assertEqual(31);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0066 end');
    })
    /**
     * @tc.name   testUserAuthVolume0067
     * @tc.number SUB_USER_AUTH_VOLUME_0067
     * @tc.desc   Verify user auth parameter volume case 67.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0067 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(32),
        authType: [userAuth.UserAuthType.FACE],
        authTrustLevel: userAuth.AuthTrustLevel.ATL4
      };
      expect(param.challenge.length).assertEqual(32);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0067 end');
    })
    /**
     * @tc.name   testUserAuthVolume0068
     * @tc.number SUB_USER_AUTH_VOLUME_0068
     * @tc.desc   Verify user auth parameter volume case 68.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0068 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(16),
        authType: [userAuth.UserAuthType.FINGERPRINT],
        authTrustLevel: userAuth.AuthTrustLevel.ATL1
      };
      expect(param.challenge.length).assertEqual(16);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0068 end');
    })
    /**
     * @tc.name   testUserAuthVolume0069
     * @tc.number SUB_USER_AUTH_VOLUME_0069
     * @tc.desc   Verify user auth parameter volume case 69.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0069 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(17),
        authType: [userAuth.UserAuthType.PIN],
        authTrustLevel: userAuth.AuthTrustLevel.ATL2
      };
      expect(param.challenge.length).assertEqual(17);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0069 end');
    })
    /**
     * @tc.name   testUserAuthVolume0070
     * @tc.number SUB_USER_AUTH_VOLUME_0070
     * @tc.desc   Verify user auth parameter volume case 70.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0070 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(18),
        authType: [userAuth.UserAuthType.FACE],
        authTrustLevel: userAuth.AuthTrustLevel.ATL3
      };
      expect(param.challenge.length).assertEqual(18);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0070 end');
    })
    /**
     * @tc.name   testUserAuthVolume0071
     * @tc.number SUB_USER_AUTH_VOLUME_0071
     * @tc.desc   Verify user auth parameter volume case 71.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0071 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(19),
        authType: [userAuth.UserAuthType.FINGERPRINT],
        authTrustLevel: userAuth.AuthTrustLevel.ATL4
      };
      expect(param.challenge.length).assertEqual(19);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0071 end');
    })
    /**
     * @tc.name   testUserAuthVolume0072
     * @tc.number SUB_USER_AUTH_VOLUME_0072
     * @tc.desc   Verify user auth parameter volume case 72.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0072 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(20),
        authType: [userAuth.UserAuthType.PIN],
        authTrustLevel: userAuth.AuthTrustLevel.ATL1
      };
      expect(param.challenge.length).assertEqual(20);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0072 end');
    })
    /**
     * @tc.name   testUserAuthVolume0073
     * @tc.number SUB_USER_AUTH_VOLUME_0073
     * @tc.desc   Verify user auth parameter volume case 73.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0073 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(21),
        authType: [userAuth.UserAuthType.FACE],
        authTrustLevel: userAuth.AuthTrustLevel.ATL2
      };
      expect(param.challenge.length).assertEqual(21);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0073 end');
    })
    /**
     * @tc.name   testUserAuthVolume0074
     * @tc.number SUB_USER_AUTH_VOLUME_0074
     * @tc.desc   Verify user auth parameter volume case 74.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0074 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(22),
        authType: [userAuth.UserAuthType.FINGERPRINT],
        authTrustLevel: userAuth.AuthTrustLevel.ATL3
      };
      expect(param.challenge.length).assertEqual(22);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0074 end');
    })
    /**
     * @tc.name   testUserAuthVolume0075
     * @tc.number SUB_USER_AUTH_VOLUME_0075
     * @tc.desc   Verify user auth parameter volume case 75.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0075 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(23),
        authType: [userAuth.UserAuthType.PIN],
        authTrustLevel: userAuth.AuthTrustLevel.ATL4
      };
      expect(param.challenge.length).assertEqual(23);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0075 end');
    })
    /**
     * @tc.name   testUserAuthVolume0076
     * @tc.number SUB_USER_AUTH_VOLUME_0076
     * @tc.desc   Verify user auth parameter volume case 76.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0076 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(24),
        authType: [userAuth.UserAuthType.FACE],
        authTrustLevel: userAuth.AuthTrustLevel.ATL1
      };
      expect(param.challenge.length).assertEqual(24);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0076 end');
    })
    /**
     * @tc.name   testUserAuthVolume0077
     * @tc.number SUB_USER_AUTH_VOLUME_0077
     * @tc.desc   Verify user auth parameter volume case 77.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0077 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(25),
        authType: [userAuth.UserAuthType.FINGERPRINT],
        authTrustLevel: userAuth.AuthTrustLevel.ATL2
      };
      expect(param.challenge.length).assertEqual(25);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0077 end');
    })
  })
}
