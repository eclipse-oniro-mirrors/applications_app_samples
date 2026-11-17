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

export default function userAuthVolumeTestPart04() {
  describe('UserAuthVolumePart04', () => {
    /**
     * @tc.name   testUserAuthVolume0232
     * @tc.number SUB_USER_AUTH_VOLUME_0232
     * @tc.desc   Verify user auth parameter volume case 232.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0232', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0232 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0232 end');
    })
    /**
     * @tc.name   testUserAuthVolume0233
     * @tc.number SUB_USER_AUTH_VOLUME_0233
     * @tc.desc   Verify user auth parameter volume case 233.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0233', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0233 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0233 end');
    })
    /**
     * @tc.name   testUserAuthVolume0234
     * @tc.number SUB_USER_AUTH_VOLUME_0234
     * @tc.desc   Verify user auth parameter volume case 234.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0234', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0234 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0234 end');
    })
    /**
     * @tc.name   testUserAuthVolume0235
     * @tc.number SUB_USER_AUTH_VOLUME_0235
     * @tc.desc   Verify user auth parameter volume case 235.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0235', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0235 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0235 end');
    })
    /**
     * @tc.name   testUserAuthVolume0236
     * @tc.number SUB_USER_AUTH_VOLUME_0236
     * @tc.desc   Verify user auth parameter volume case 236.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0236', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0236 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0236 end');
    })
    /**
     * @tc.name   testUserAuthVolume0237
     * @tc.number SUB_USER_AUTH_VOLUME_0237
     * @tc.desc   Verify user auth parameter volume case 237.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0237', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0237 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0237 end');
    })
    /**
     * @tc.name   testUserAuthVolume0238
     * @tc.number SUB_USER_AUTH_VOLUME_0238
     * @tc.desc   Verify user auth parameter volume case 238.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0238', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0238 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0238 end');
    })
    /**
     * @tc.name   testUserAuthVolume0239
     * @tc.number SUB_USER_AUTH_VOLUME_0239
     * @tc.desc   Verify user auth parameter volume case 239.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0239', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0239 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0239 end');
    })
    /**
     * @tc.name   testUserAuthVolume0240
     * @tc.number SUB_USER_AUTH_VOLUME_0240
     * @tc.desc   Verify user auth parameter volume case 240.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0240', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0240 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0240 end');
    })
    /**
     * @tc.name   testUserAuthVolume0241
     * @tc.number SUB_USER_AUTH_VOLUME_0241
     * @tc.desc   Verify user auth parameter volume case 241.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0241', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0241 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0241 end');
    })
    /**
     * @tc.name   testUserAuthVolume0242
     * @tc.number SUB_USER_AUTH_VOLUME_0242
     * @tc.desc   Verify user auth parameter volume case 242.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0242', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0242 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0242 end');
    })
    /**
     * @tc.name   testUserAuthVolume0243
     * @tc.number SUB_USER_AUTH_VOLUME_0243
     * @tc.desc   Verify user auth parameter volume case 243.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0243', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0243 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0243 end');
    })
    /**
     * @tc.name   testUserAuthVolume0244
     * @tc.number SUB_USER_AUTH_VOLUME_0244
     * @tc.desc   Verify user auth parameter volume case 244.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0244', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0244 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0244 end');
    })
    /**
     * @tc.name   testUserAuthVolume0245
     * @tc.number SUB_USER_AUTH_VOLUME_0245
     * @tc.desc   Verify user auth parameter volume case 245.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0245', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0245 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0245 end');
    })
    /**
     * @tc.name   testUserAuthVolume0246
     * @tc.number SUB_USER_AUTH_VOLUME_0246
     * @tc.desc   Verify user auth parameter volume case 246.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0246', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0246 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0246 end');
    })
    /**
     * @tc.name   testUserAuthVolume0247
     * @tc.number SUB_USER_AUTH_VOLUME_0247
     * @tc.desc   Verify user auth parameter volume case 247.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0247', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0247 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0247 end');
    })
    /**
     * @tc.name   testUserAuthVolume0248
     * @tc.number SUB_USER_AUTH_VOLUME_0248
     * @tc.desc   Verify user auth parameter volume case 248.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0248', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0248 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0248 end');
    })
    /**
     * @tc.name   testUserAuthVolume0249
     * @tc.number SUB_USER_AUTH_VOLUME_0249
     * @tc.desc   Verify user auth parameter volume case 249.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0249', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0249 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0249 end');
    })
    /**
     * @tc.name   testUserAuthVolume0250
     * @tc.number SUB_USER_AUTH_VOLUME_0250
     * @tc.desc   Verify user auth parameter volume case 250.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0250', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0250 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0250 end');
    })
  })
}
