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

export default function userAuthVolumeTestPart02() {
  describe('UserAuthVolumePart02', () => {
    /**
     * @tc.name   testUserAuthVolume0078
     * @tc.number SUB_USER_AUTH_VOLUME_0078
     * @tc.desc   Verify user auth parameter volume case 78.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0078 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(26),
        authType: [userAuth.UserAuthType.PIN],
        authTrustLevel: userAuth.AuthTrustLevel.ATL3
      };
      expect(param.challenge.length).assertEqual(26);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0078 end');
    })
    /**
     * @tc.name   testUserAuthVolume0079
     * @tc.number SUB_USER_AUTH_VOLUME_0079
     * @tc.desc   Verify user auth parameter volume case 79.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0079 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(27),
        authType: [userAuth.UserAuthType.FACE],
        authTrustLevel: userAuth.AuthTrustLevel.ATL4
      };
      expect(param.challenge.length).assertEqual(27);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0079 end');
    })
    /**
     * @tc.name   testUserAuthVolume0080
     * @tc.number SUB_USER_AUTH_VOLUME_0080
     * @tc.desc   Verify user auth parameter volume case 80.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0080 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(28),
        authType: [userAuth.UserAuthType.FINGERPRINT],
        authTrustLevel: userAuth.AuthTrustLevel.ATL1
      };
      expect(param.challenge.length).assertEqual(28);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0080 end');
    })
    /**
     * @tc.name   testUserAuthVolume0081
     * @tc.number SUB_USER_AUTH_VOLUME_0081
     * @tc.desc   Verify user auth parameter volume case 81.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0081 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(29),
        authType: [userAuth.UserAuthType.PIN],
        authTrustLevel: userAuth.AuthTrustLevel.ATL2
      };
      expect(param.challenge.length).assertEqual(29);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0081 end');
    })
    /**
     * @tc.name   testUserAuthVolume0082
     * @tc.number SUB_USER_AUTH_VOLUME_0082
     * @tc.desc   Verify user auth parameter volume case 82.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0082 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(30),
        authType: [userAuth.UserAuthType.FACE],
        authTrustLevel: userAuth.AuthTrustLevel.ATL3
      };
      expect(param.challenge.length).assertEqual(30);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0082 end');
    })
    /**
     * @tc.name   testUserAuthVolume0083
     * @tc.number SUB_USER_AUTH_VOLUME_0083
     * @tc.desc   Verify user auth parameter volume case 83.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0083 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(31),
        authType: [userAuth.UserAuthType.FINGERPRINT],
        authTrustLevel: userAuth.AuthTrustLevel.ATL4
      };
      expect(param.challenge.length).assertEqual(31);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0083 end');
    })
    /**
     * @tc.name   testUserAuthVolume0084
     * @tc.number SUB_USER_AUTH_VOLUME_0084
     * @tc.desc   Verify user auth parameter volume case 84.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0084 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(32),
        authType: [userAuth.UserAuthType.PIN],
        authTrustLevel: userAuth.AuthTrustLevel.ATL1
      };
      expect(param.challenge.length).assertEqual(32);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0084 end');
    })
    /**
     * @tc.name   testUserAuthVolume0085
     * @tc.number SUB_USER_AUTH_VOLUME_0085
     * @tc.desc   Verify user auth parameter volume case 85.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0085 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(16),
        authType: [userAuth.UserAuthType.FACE],
        authTrustLevel: userAuth.AuthTrustLevel.ATL2
      };
      expect(param.challenge.length).assertEqual(16);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0085 end');
    })
    /**
     * @tc.name   testUserAuthVolume0086
     * @tc.number SUB_USER_AUTH_VOLUME_0086
     * @tc.desc   Verify user auth parameter volume case 86.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0086 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(17),
        authType: [userAuth.UserAuthType.FINGERPRINT],
        authTrustLevel: userAuth.AuthTrustLevel.ATL3
      };
      expect(param.challenge.length).assertEqual(17);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0086 end');
    })
    /**
     * @tc.name   testUserAuthVolume0087
     * @tc.number SUB_USER_AUTH_VOLUME_0087
     * @tc.desc   Verify user auth parameter volume case 87.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0087 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(18),
        authType: [userAuth.UserAuthType.PIN],
        authTrustLevel: userAuth.AuthTrustLevel.ATL4
      };
      expect(param.challenge.length).assertEqual(18);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0087 end');
    })
    /**
     * @tc.name   testUserAuthVolume0088
     * @tc.number SUB_USER_AUTH_VOLUME_0088
     * @tc.desc   Verify user auth parameter volume case 88.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0088 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(19),
        authType: [userAuth.UserAuthType.FACE],
        authTrustLevel: userAuth.AuthTrustLevel.ATL1
      };
      expect(param.challenge.length).assertEqual(19);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0088 end');
    })
    /**
     * @tc.name   testUserAuthVolume0089
     * @tc.number SUB_USER_AUTH_VOLUME_0089
     * @tc.desc   Verify user auth parameter volume case 89.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0089 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(20),
        authType: [userAuth.UserAuthType.FINGERPRINT],
        authTrustLevel: userAuth.AuthTrustLevel.ATL2
      };
      expect(param.challenge.length).assertEqual(20);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0089 end');
    })
    /**
     * @tc.name   testUserAuthVolume0090
     * @tc.number SUB_USER_AUTH_VOLUME_0090
     * @tc.desc   Verify user auth parameter volume case 90.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0090 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(21),
        authType: [userAuth.UserAuthType.PIN],
        authTrustLevel: userAuth.AuthTrustLevel.ATL3
      };
      expect(param.challenge.length).assertEqual(21);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0090 end');
    })
    /**
     * @tc.name   testUserAuthVolume0091
     * @tc.number SUB_USER_AUTH_VOLUME_0091
     * @tc.desc   Verify user auth parameter volume case 91.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0091 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(22),
        authType: [userAuth.UserAuthType.FACE],
        authTrustLevel: userAuth.AuthTrustLevel.ATL4
      };
      expect(param.challenge.length).assertEqual(22);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0091 end');
    })
    /**
     * @tc.name   testUserAuthVolume0092
     * @tc.number SUB_USER_AUTH_VOLUME_0092
     * @tc.desc   Verify user auth parameter volume case 92.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0092 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(23),
        authType: [userAuth.UserAuthType.FINGERPRINT],
        authTrustLevel: userAuth.AuthTrustLevel.ATL1
      };
      expect(param.challenge.length).assertEqual(23);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0092 end');
    })
    /**
     * @tc.name   testUserAuthVolume0093
     * @tc.number SUB_USER_AUTH_VOLUME_0093
     * @tc.desc   Verify user auth parameter volume case 93.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0093 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(24),
        authType: [userAuth.UserAuthType.PIN],
        authTrustLevel: userAuth.AuthTrustLevel.ATL2
      };
      expect(param.challenge.length).assertEqual(24);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0093 end');
    })
    /**
     * @tc.name   testUserAuthVolume0094
     * @tc.number SUB_USER_AUTH_VOLUME_0094
     * @tc.desc   Verify user auth parameter volume case 94.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0094 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(25),
        authType: [userAuth.UserAuthType.FACE],
        authTrustLevel: userAuth.AuthTrustLevel.ATL3
      };
      expect(param.challenge.length).assertEqual(25);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0094 end');
    })
    /**
     * @tc.name   testUserAuthVolume0095
     * @tc.number SUB_USER_AUTH_VOLUME_0095
     * @tc.desc   Verify user auth parameter volume case 95.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0095 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(26),
        authType: [userAuth.UserAuthType.FINGERPRINT],
        authTrustLevel: userAuth.AuthTrustLevel.ATL4
      };
      expect(param.challenge.length).assertEqual(26);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0095 end');
    })
    /**
     * @tc.name   testUserAuthVolume0096
     * @tc.number SUB_USER_AUTH_VOLUME_0096
     * @tc.desc   Verify user auth parameter volume case 96.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0096 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(27),
        authType: [userAuth.UserAuthType.PIN],
        authTrustLevel: userAuth.AuthTrustLevel.ATL1
      };
      expect(param.challenge.length).assertEqual(27);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0096 end');
    })
    /**
     * @tc.name   testUserAuthVolume0097
     * @tc.number SUB_USER_AUTH_VOLUME_0097
     * @tc.desc   Verify user auth parameter volume case 97.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0097 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(28),
        authType: [userAuth.UserAuthType.FACE],
        authTrustLevel: userAuth.AuthTrustLevel.ATL2
      };
      expect(param.challenge.length).assertEqual(28);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0097 end');
    })
    /**
     * @tc.name   testUserAuthVolume0098
     * @tc.number SUB_USER_AUTH_VOLUME_0098
     * @tc.desc   Verify user auth parameter volume case 98.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0098 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(29),
        authType: [userAuth.UserAuthType.FINGERPRINT],
        authTrustLevel: userAuth.AuthTrustLevel.ATL3
      };
      expect(param.challenge.length).assertEqual(29);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0098 end');
    })
    /**
     * @tc.name   testUserAuthVolume0099
     * @tc.number SUB_USER_AUTH_VOLUME_0099
     * @tc.desc   Verify user auth parameter volume case 99.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0099 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(30),
        authType: [userAuth.UserAuthType.PIN],
        authTrustLevel: userAuth.AuthTrustLevel.ATL4
      };
      expect(param.challenge.length).assertEqual(30);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0099 end');
    })
    /**
     * @tc.name   testUserAuthVolume0100
     * @tc.number SUB_USER_AUTH_VOLUME_0100
     * @tc.desc   Verify user auth parameter volume case 100.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0100 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(31),
        authType: [userAuth.UserAuthType.FACE],
        authTrustLevel: userAuth.AuthTrustLevel.ATL1
      };
      expect(param.challenge.length).assertEqual(31);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0100 end');
    })
    /**
     * @tc.name   testUserAuthVolume0101
     * @tc.number SUB_USER_AUTH_VOLUME_0101
     * @tc.desc   Verify user auth parameter volume case 101.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0101 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(32),
        authType: [userAuth.UserAuthType.FINGERPRINT],
        authTrustLevel: userAuth.AuthTrustLevel.ATL2
      };
      expect(param.challenge.length).assertEqual(32);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0101 end');
    })
    /**
     * @tc.name   testUserAuthVolume0102
     * @tc.number SUB_USER_AUTH_VOLUME_0102
     * @tc.desc   Verify user auth parameter volume case 102.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0102 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(16),
        authType: [userAuth.UserAuthType.PIN],
        authTrustLevel: userAuth.AuthTrustLevel.ATL3
      };
      expect(param.challenge.length).assertEqual(16);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0102 end');
    })
    /**
     * @tc.name   testUserAuthVolume0103
     * @tc.number SUB_USER_AUTH_VOLUME_0103
     * @tc.desc   Verify user auth parameter volume case 103.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0103 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(17),
        authType: [userAuth.UserAuthType.FACE],
        authTrustLevel: userAuth.AuthTrustLevel.ATL4
      };
      expect(param.challenge.length).assertEqual(17);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0103 end');
    })
    /**
     * @tc.name   testUserAuthVolume0104
     * @tc.number SUB_USER_AUTH_VOLUME_0104
     * @tc.desc   Verify user auth parameter volume case 104.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0104 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(18),
        authType: [userAuth.UserAuthType.FINGERPRINT],
        authTrustLevel: userAuth.AuthTrustLevel.ATL1
      };
      expect(param.challenge.length).assertEqual(18);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0104 end');
    })
    /**
     * @tc.name   testUserAuthVolume0105
     * @tc.number SUB_USER_AUTH_VOLUME_0105
     * @tc.desc   Verify user auth parameter volume case 105.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0105 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(19),
        authType: [userAuth.UserAuthType.PIN],
        authTrustLevel: userAuth.AuthTrustLevel.ATL2
      };
      expect(param.challenge.length).assertEqual(19);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0105 end');
    })
    /**
     * @tc.name   testUserAuthVolume0106
     * @tc.number SUB_USER_AUTH_VOLUME_0106
     * @tc.desc   Verify user auth parameter volume case 106.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0106 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(20),
        authType: [userAuth.UserAuthType.FACE],
        authTrustLevel: userAuth.AuthTrustLevel.ATL3
      };
      expect(param.challenge.length).assertEqual(20);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0106 end');
    })
    /**
     * @tc.name   testUserAuthVolume0107
     * @tc.number SUB_USER_AUTH_VOLUME_0107
     * @tc.desc   Verify user auth parameter volume case 107.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0107 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(21),
        authType: [userAuth.UserAuthType.FINGERPRINT],
        authTrustLevel: userAuth.AuthTrustLevel.ATL4
      };
      expect(param.challenge.length).assertEqual(21);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0107 end');
    })
    /**
     * @tc.name   testUserAuthVolume0108
     * @tc.number SUB_USER_AUTH_VOLUME_0108
     * @tc.desc   Verify user auth parameter volume case 108.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0108 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(22),
        authType: [userAuth.UserAuthType.PIN],
        authTrustLevel: userAuth.AuthTrustLevel.ATL1
      };
      expect(param.challenge.length).assertEqual(22);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0108 end');
    })
    /**
     * @tc.name   testUserAuthVolume0109
     * @tc.number SUB_USER_AUTH_VOLUME_0109
     * @tc.desc   Verify user auth parameter volume case 109.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0109 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(23),
        authType: [userAuth.UserAuthType.FACE],
        authTrustLevel: userAuth.AuthTrustLevel.ATL2
      };
      expect(param.challenge.length).assertEqual(23);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0109 end');
    })
    /**
     * @tc.name   testUserAuthVolume0110
     * @tc.number SUB_USER_AUTH_VOLUME_0110
     * @tc.desc   Verify user auth parameter volume case 110.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0110 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(24),
        authType: [userAuth.UserAuthType.FINGERPRINT],
        authTrustLevel: userAuth.AuthTrustLevel.ATL3
      };
      expect(param.challenge.length).assertEqual(24);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0110 end');
    })
    /**
     * @tc.name   testUserAuthVolume0111
     * @tc.number SUB_USER_AUTH_VOLUME_0111
     * @tc.desc   Verify user auth parameter volume case 111.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0111 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(25),
        authType: [userAuth.UserAuthType.PIN],
        authTrustLevel: userAuth.AuthTrustLevel.ATL4
      };
      expect(param.challenge.length).assertEqual(25);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0111 end');
    })
    /**
     * @tc.name   testUserAuthVolume0112
     * @tc.number SUB_USER_AUTH_VOLUME_0112
     * @tc.desc   Verify user auth parameter volume case 112.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0112 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(26),
        authType: [userAuth.UserAuthType.FACE],
        authTrustLevel: userAuth.AuthTrustLevel.ATL1
      };
      expect(param.challenge.length).assertEqual(26);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0112 end');
    })
    /**
     * @tc.name   testUserAuthVolume0113
     * @tc.number SUB_USER_AUTH_VOLUME_0113
     * @tc.desc   Verify user auth parameter volume case 113.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0113 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(27),
        authType: [userAuth.UserAuthType.FINGERPRINT],
        authTrustLevel: userAuth.AuthTrustLevel.ATL2
      };
      expect(param.challenge.length).assertEqual(27);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0113 end');
    })
    /**
     * @tc.name   testUserAuthVolume0114
     * @tc.number SUB_USER_AUTH_VOLUME_0114
     * @tc.desc   Verify user auth parameter volume case 114.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0114 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(28),
        authType: [userAuth.UserAuthType.PIN],
        authTrustLevel: userAuth.AuthTrustLevel.ATL3
      };
      expect(param.challenge.length).assertEqual(28);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0114 end');
    })
    /**
     * @tc.name   testUserAuthVolume0115
     * @tc.number SUB_USER_AUTH_VOLUME_0115
     * @tc.desc   Verify user auth parameter volume case 115.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0115 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(29),
        authType: [userAuth.UserAuthType.FACE],
        authTrustLevel: userAuth.AuthTrustLevel.ATL4
      };
      expect(param.challenge.length).assertEqual(29);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0115 end');
    })
    /**
     * @tc.name   testUserAuthVolume0116
     * @tc.number SUB_USER_AUTH_VOLUME_0116
     * @tc.desc   Verify user auth parameter volume case 116.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0116 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(30),
        authType: [userAuth.UserAuthType.FINGERPRINT],
        authTrustLevel: userAuth.AuthTrustLevel.ATL1
      };
      expect(param.challenge.length).assertEqual(30);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0116 end');
    })
    /**
     * @tc.name   testUserAuthVolume0117
     * @tc.number SUB_USER_AUTH_VOLUME_0117
     * @tc.desc   Verify user auth parameter volume case 117.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0117 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(31),
        authType: [userAuth.UserAuthType.PIN],
        authTrustLevel: userAuth.AuthTrustLevel.ATL2
      };
      expect(param.challenge.length).assertEqual(31);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0117 end');
    })
    /**
     * @tc.name   testUserAuthVolume0118
     * @tc.number SUB_USER_AUTH_VOLUME_0118
     * @tc.desc   Verify user auth parameter volume case 118.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0118 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(32),
        authType: [userAuth.UserAuthType.FACE],
        authTrustLevel: userAuth.AuthTrustLevel.ATL3
      };
      expect(param.challenge.length).assertEqual(32);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0118 end');
    })
    /**
     * @tc.name   testUserAuthVolume0119
     * @tc.number SUB_USER_AUTH_VOLUME_0119
     * @tc.desc   Verify user auth parameter volume case 119.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0119 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(16),
        authType: [userAuth.UserAuthType.FINGERPRINT],
        authTrustLevel: userAuth.AuthTrustLevel.ATL4
      };
      expect(param.challenge.length).assertEqual(16);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0119 end');
    })
    /**
     * @tc.name   testUserAuthVolume0120
     * @tc.number SUB_USER_AUTH_VOLUME_0120
     * @tc.desc   Verify user auth parameter volume case 120.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0120 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(17),
        authType: [userAuth.UserAuthType.PIN],
        authTrustLevel: userAuth.AuthTrustLevel.ATL1
      };
      expect(param.challenge.length).assertEqual(17);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0120 end');
    })
    /**
     * @tc.name   testUserAuthVolume0121
     * @tc.number SUB_USER_AUTH_VOLUME_0121
     * @tc.desc   Verify user auth parameter volume case 121.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0121 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(18),
        authType: [userAuth.UserAuthType.FACE],
        authTrustLevel: userAuth.AuthTrustLevel.ATL2
      };
      expect(param.challenge.length).assertEqual(18);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0121 end');
    })
    /**
     * @tc.name   testUserAuthVolume0122
     * @tc.number SUB_USER_AUTH_VOLUME_0122
     * @tc.desc   Verify user auth parameter volume case 122.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0122 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(19),
        authType: [userAuth.UserAuthType.FINGERPRINT],
        authTrustLevel: userAuth.AuthTrustLevel.ATL3
      };
      expect(param.challenge.length).assertEqual(19);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0122 end');
    })
    /**
     * @tc.name   testUserAuthVolume0123
     * @tc.number SUB_USER_AUTH_VOLUME_0123
     * @tc.desc   Verify user auth parameter volume case 123.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0123 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(20),
        authType: [userAuth.UserAuthType.PIN],
        authTrustLevel: userAuth.AuthTrustLevel.ATL4
      };
      expect(param.challenge.length).assertEqual(20);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0123 end');
    })
    /**
     * @tc.name   testUserAuthVolume0124
     * @tc.number SUB_USER_AUTH_VOLUME_0124
     * @tc.desc   Verify user auth parameter volume case 124.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0124 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(21),
        authType: [userAuth.UserAuthType.FACE],
        authTrustLevel: userAuth.AuthTrustLevel.ATL1
      };
      expect(param.challenge.length).assertEqual(21);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0124 end');
    })
    /**
     * @tc.name   testUserAuthVolume0125
     * @tc.number SUB_USER_AUTH_VOLUME_0125
     * @tc.desc   Verify user auth parameter volume case 125.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0125 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(22),
        authType: [userAuth.UserAuthType.FINGERPRINT],
        authTrustLevel: userAuth.AuthTrustLevel.ATL2
      };
      expect(param.challenge.length).assertEqual(22);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0125 end');
    })
    /**
     * @tc.name   testUserAuthVolume0126
     * @tc.number SUB_USER_AUTH_VOLUME_0126
     * @tc.desc   Verify user auth parameter volume case 126.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0126 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(23),
        authType: [userAuth.UserAuthType.PIN],
        authTrustLevel: userAuth.AuthTrustLevel.ATL3
      };
      expect(param.challenge.length).assertEqual(23);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0126 end');
    })
    /**
     * @tc.name   testUserAuthVolume0127
     * @tc.number SUB_USER_AUTH_VOLUME_0127
     * @tc.desc   Verify user auth parameter volume case 127.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0127 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(24),
        authType: [userAuth.UserAuthType.FACE],
        authTrustLevel: userAuth.AuthTrustLevel.ATL4
      };
      expect(param.challenge.length).assertEqual(24);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0127 end');
    })
    /**
     * @tc.name   testUserAuthVolume0128
     * @tc.number SUB_USER_AUTH_VOLUME_0128
     * @tc.desc   Verify user auth parameter volume case 128.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0128 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(25),
        authType: [userAuth.UserAuthType.FINGERPRINT],
        authTrustLevel: userAuth.AuthTrustLevel.ATL1
      };
      expect(param.challenge.length).assertEqual(25);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0128 end');
    })
    /**
     * @tc.name   testUserAuthVolume0129
     * @tc.number SUB_USER_AUTH_VOLUME_0129
     * @tc.desc   Verify user auth parameter volume case 129.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0129 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(26),
        authType: [userAuth.UserAuthType.PIN],
        authTrustLevel: userAuth.AuthTrustLevel.ATL2
      };
      expect(param.challenge.length).assertEqual(26);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0129 end');
    })
    /**
     * @tc.name   testUserAuthVolume0130
     * @tc.number SUB_USER_AUTH_VOLUME_0130
     * @tc.desc   Verify user auth parameter volume case 130.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0130 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(27),
        authType: [userAuth.UserAuthType.FACE],
        authTrustLevel: userAuth.AuthTrustLevel.ATL3
      };
      expect(param.challenge.length).assertEqual(27);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0130 end');
    })
    /**
     * @tc.name   testUserAuthVolume0131
     * @tc.number SUB_USER_AUTH_VOLUME_0131
     * @tc.desc   Verify user auth parameter volume case 131.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0131 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(28),
        authType: [userAuth.UserAuthType.FINGERPRINT],
        authTrustLevel: userAuth.AuthTrustLevel.ATL4
      };
      expect(param.challenge.length).assertEqual(28);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0131 end');
    })
    /**
     * @tc.name   testUserAuthVolume0132
     * @tc.number SUB_USER_AUTH_VOLUME_0132
     * @tc.desc   Verify user auth parameter volume case 132.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0132 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(29),
        authType: [userAuth.UserAuthType.PIN],
        authTrustLevel: userAuth.AuthTrustLevel.ATL1
      };
      expect(param.challenge.length).assertEqual(29);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0132 end');
    })
    /**
     * @tc.name   testUserAuthVolume0133
     * @tc.number SUB_USER_AUTH_VOLUME_0133
     * @tc.desc   Verify user auth parameter volume case 133.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0133 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(30),
        authType: [userAuth.UserAuthType.FACE],
        authTrustLevel: userAuth.AuthTrustLevel.ATL2
      };
      expect(param.challenge.length).assertEqual(30);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0133 end');
    })
    /**
     * @tc.name   testUserAuthVolume0134
     * @tc.number SUB_USER_AUTH_VOLUME_0134
     * @tc.desc   Verify user auth parameter volume case 134.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0134 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(31),
        authType: [userAuth.UserAuthType.FINGERPRINT],
        authTrustLevel: userAuth.AuthTrustLevel.ATL3
      };
      expect(param.challenge.length).assertEqual(31);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0134 end');
    })
    /**
     * @tc.name   testUserAuthVolume0135
     * @tc.number SUB_USER_AUTH_VOLUME_0135
     * @tc.desc   Verify user auth parameter volume case 135.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0135 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(32),
        authType: [userAuth.UserAuthType.PIN],
        authTrustLevel: userAuth.AuthTrustLevel.ATL4
      };
      expect(param.challenge.length).assertEqual(32);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0135 end');
    })
    /**
     * @tc.name   testUserAuthVolume0136
     * @tc.number SUB_USER_AUTH_VOLUME_0136
     * @tc.desc   Verify user auth parameter volume case 136.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0136 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(16),
        authType: [userAuth.UserAuthType.FACE],
        authTrustLevel: userAuth.AuthTrustLevel.ATL1
      };
      expect(param.challenge.length).assertEqual(16);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0136 end');
    })
    /**
     * @tc.name   testUserAuthVolume0137
     * @tc.number SUB_USER_AUTH_VOLUME_0137
     * @tc.desc   Verify user auth parameter volume case 137.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0137 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(17),
        authType: [userAuth.UserAuthType.FINGERPRINT],
        authTrustLevel: userAuth.AuthTrustLevel.ATL2
      };
      expect(param.challenge.length).assertEqual(17);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0137 end');
    })
    /**
     * @tc.name   testUserAuthVolume0138
     * @tc.number SUB_USER_AUTH_VOLUME_0138
     * @tc.desc   Verify user auth parameter volume case 138.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0138 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(18),
        authType: [userAuth.UserAuthType.PIN],
        authTrustLevel: userAuth.AuthTrustLevel.ATL3
      };
      expect(param.challenge.length).assertEqual(18);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0138 end');
    })
    /**
     * @tc.name   testUserAuthVolume0139
     * @tc.number SUB_USER_AUTH_VOLUME_0139
     * @tc.desc   Verify user auth parameter volume case 139.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0139 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(19),
        authType: [userAuth.UserAuthType.FACE],
        authTrustLevel: userAuth.AuthTrustLevel.ATL4
      };
      expect(param.challenge.length).assertEqual(19);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0139 end');
    })
    /**
     * @tc.name   testUserAuthVolume0140
     * @tc.number SUB_USER_AUTH_VOLUME_0140
     * @tc.desc   Verify user auth parameter volume case 140.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0140 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(20),
        authType: [userAuth.UserAuthType.FINGERPRINT],
        authTrustLevel: userAuth.AuthTrustLevel.ATL1
      };
      expect(param.challenge.length).assertEqual(20);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0140 end');
    })
    /**
     * @tc.name   testUserAuthVolume0141
     * @tc.number SUB_USER_AUTH_VOLUME_0141
     * @tc.desc   Verify user auth parameter volume case 141.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0141 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(21),
        authType: [userAuth.UserAuthType.PIN],
        authTrustLevel: userAuth.AuthTrustLevel.ATL2
      };
      expect(param.challenge.length).assertEqual(21);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0141 end');
    })
    /**
     * @tc.name   testUserAuthVolume0142
     * @tc.number SUB_USER_AUTH_VOLUME_0142
     * @tc.desc   Verify user auth parameter volume case 142.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0142 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(22),
        authType: [userAuth.UserAuthType.FACE],
        authTrustLevel: userAuth.AuthTrustLevel.ATL3
      };
      expect(param.challenge.length).assertEqual(22);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0142 end');
    })
    /**
     * @tc.name   testUserAuthVolume0143
     * @tc.number SUB_USER_AUTH_VOLUME_0143
     * @tc.desc   Verify user auth parameter volume case 143.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0143 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(23),
        authType: [userAuth.UserAuthType.FINGERPRINT],
        authTrustLevel: userAuth.AuthTrustLevel.ATL4
      };
      expect(param.challenge.length).assertEqual(23);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0143 end');
    })
    /**
     * @tc.name   testUserAuthVolume0144
     * @tc.number SUB_USER_AUTH_VOLUME_0144
     * @tc.desc   Verify user auth parameter volume case 144.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0144 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(24),
        authType: [userAuth.UserAuthType.PIN],
        authTrustLevel: userAuth.AuthTrustLevel.ATL1
      };
      expect(param.challenge.length).assertEqual(24);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0144 end');
    })
    /**
     * @tc.name   testUserAuthVolume0145
     * @tc.number SUB_USER_AUTH_VOLUME_0145
     * @tc.desc   Verify user auth parameter volume case 145.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0145 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(25),
        authType: [userAuth.UserAuthType.FACE],
        authTrustLevel: userAuth.AuthTrustLevel.ATL2
      };
      expect(param.challenge.length).assertEqual(25);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0145 end');
    })
    /**
     * @tc.name   testUserAuthVolume0146
     * @tc.number SUB_USER_AUTH_VOLUME_0146
     * @tc.desc   Verify user auth parameter volume case 146.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0146 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(26),
        authType: [userAuth.UserAuthType.FINGERPRINT],
        authTrustLevel: userAuth.AuthTrustLevel.ATL3
      };
      expect(param.challenge.length).assertEqual(26);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0146 end');
    })
    /**
     * @tc.name   testUserAuthVolume0147
     * @tc.number SUB_USER_AUTH_VOLUME_0147
     * @tc.desc   Verify user auth parameter volume case 147.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0147 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(27),
        authType: [userAuth.UserAuthType.PIN],
        authTrustLevel: userAuth.AuthTrustLevel.ATL4
      };
      expect(param.challenge.length).assertEqual(27);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0147 end');
    })
    /**
     * @tc.name   testUserAuthVolume0148
     * @tc.number SUB_USER_AUTH_VOLUME_0148
     * @tc.desc   Verify user auth parameter volume case 148.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0148 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(28),
        authType: [userAuth.UserAuthType.FACE],
        authTrustLevel: userAuth.AuthTrustLevel.ATL1
      };
      expect(param.challenge.length).assertEqual(28);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0148 end');
    })
    /**
     * @tc.name   testUserAuthVolume0149
     * @tc.number SUB_USER_AUTH_VOLUME_0149
     * @tc.desc   Verify user auth parameter volume case 149.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0149 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(29),
        authType: [userAuth.UserAuthType.FINGERPRINT],
        authTrustLevel: userAuth.AuthTrustLevel.ATL2
      };
      expect(param.challenge.length).assertEqual(29);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0149 end');
    })
    /**
     * @tc.name   testUserAuthVolume0150
     * @tc.number SUB_USER_AUTH_VOLUME_0150
     * @tc.desc   Verify user auth parameter volume case 150.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0150 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(30),
        authType: [userAuth.UserAuthType.PIN],
        authTrustLevel: userAuth.AuthTrustLevel.ATL3
      };
      expect(param.challenge.length).assertEqual(30);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0150 end');
    })
    /**
     * @tc.name   testUserAuthVolume0151
     * @tc.number SUB_USER_AUTH_VOLUME_0151
     * @tc.desc   Verify user auth parameter volume case 151.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0151 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(31),
        authType: [userAuth.UserAuthType.FACE],
        authTrustLevel: userAuth.AuthTrustLevel.ATL4
      };
      expect(param.challenge.length).assertEqual(31);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0151 end');
    })
    /**
     * @tc.name   testUserAuthVolume0152
     * @tc.number SUB_USER_AUTH_VOLUME_0152
     * @tc.desc   Verify user auth parameter volume case 152.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0152 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(32),
        authType: [userAuth.UserAuthType.FINGERPRINT],
        authTrustLevel: userAuth.AuthTrustLevel.ATL1
      };
      expect(param.challenge.length).assertEqual(32);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0152 end');
    })
    /**
     * @tc.name   testUserAuthVolume0153
     * @tc.number SUB_USER_AUTH_VOLUME_0153
     * @tc.desc   Verify user auth parameter volume case 153.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0153 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(16),
        authType: [userAuth.UserAuthType.PIN],
        authTrustLevel: userAuth.AuthTrustLevel.ATL2
      };
      expect(param.challenge.length).assertEqual(16);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0153 end');
    })
    /**
     * @tc.name   testUserAuthVolume0154
     * @tc.number SUB_USER_AUTH_VOLUME_0154
     * @tc.desc   Verify user auth parameter volume case 154.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0154 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(17),
        authType: [userAuth.UserAuthType.FACE],
        authTrustLevel: userAuth.AuthTrustLevel.ATL3
      };
      expect(param.challenge.length).assertEqual(17);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0154 end');
    })
  })
}
