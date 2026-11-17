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

export default function userAuthVolumeTestPart03() {
  describe('UserAuthVolumePart03', () => {
    /**
     * @tc.name   testUserAuthVolume0155
     * @tc.number SUB_USER_AUTH_VOLUME_0155
     * @tc.desc   Verify user auth parameter volume case 155.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0155 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(18),
        authType: [userAuth.UserAuthType.FINGERPRINT],
        authTrustLevel: userAuth.AuthTrustLevel.ATL4
      };
      expect(param.challenge.length).assertEqual(18);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0155 end');
    })
    /**
     * @tc.name   testUserAuthVolume0156
     * @tc.number SUB_USER_AUTH_VOLUME_0156
     * @tc.desc   Verify user auth parameter volume case 156.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0156 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(19),
        authType: [userAuth.UserAuthType.PIN],
        authTrustLevel: userAuth.AuthTrustLevel.ATL1
      };
      expect(param.challenge.length).assertEqual(19);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0156 end');
    })
    /**
     * @tc.name   testUserAuthVolume0157
     * @tc.number SUB_USER_AUTH_VOLUME_0157
     * @tc.desc   Verify user auth parameter volume case 157.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0157 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(20),
        authType: [userAuth.UserAuthType.FACE],
        authTrustLevel: userAuth.AuthTrustLevel.ATL2
      };
      expect(param.challenge.length).assertEqual(20);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0157 end');
    })
    /**
     * @tc.name   testUserAuthVolume0158
     * @tc.number SUB_USER_AUTH_VOLUME_0158
     * @tc.desc   Verify user auth parameter volume case 158.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0158', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0158 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(21),
        authType: [userAuth.UserAuthType.FINGERPRINT],
        authTrustLevel: userAuth.AuthTrustLevel.ATL3
      };
      expect(param.challenge.length).assertEqual(21);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0158 end');
    })
    /**
     * @tc.name   testUserAuthVolume0159
     * @tc.number SUB_USER_AUTH_VOLUME_0159
     * @tc.desc   Verify user auth parameter volume case 159.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0159', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0159 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(22),
        authType: [userAuth.UserAuthType.PIN],
        authTrustLevel: userAuth.AuthTrustLevel.ATL4
      };
      expect(param.challenge.length).assertEqual(22);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0159 end');
    })
    /**
     * @tc.name   testUserAuthVolume0160
     * @tc.number SUB_USER_AUTH_VOLUME_0160
     * @tc.desc   Verify user auth parameter volume case 160.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0160 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(23),
        authType: [userAuth.UserAuthType.FACE],
        authTrustLevel: userAuth.AuthTrustLevel.ATL1
      };
      expect(param.challenge.length).assertEqual(23);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0160 end');
    })
    /**
     * @tc.name   testUserAuthVolume0161
     * @tc.number SUB_USER_AUTH_VOLUME_0161
     * @tc.desc   Verify user auth parameter volume case 161.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0161', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0161 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(24),
        authType: [userAuth.UserAuthType.FINGERPRINT],
        authTrustLevel: userAuth.AuthTrustLevel.ATL2
      };
      expect(param.challenge.length).assertEqual(24);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0161 end');
    })
    /**
     * @tc.name   testUserAuthVolume0162
     * @tc.number SUB_USER_AUTH_VOLUME_0162
     * @tc.desc   Verify user auth parameter volume case 162.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0162', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0162 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(25),
        authType: [userAuth.UserAuthType.PIN],
        authTrustLevel: userAuth.AuthTrustLevel.ATL3
      };
      expect(param.challenge.length).assertEqual(25);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0162 end');
    })
    /**
     * @tc.name   testUserAuthVolume0163
     * @tc.number SUB_USER_AUTH_VOLUME_0163
     * @tc.desc   Verify user auth parameter volume case 163.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0163', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0163 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(26),
        authType: [userAuth.UserAuthType.FACE],
        authTrustLevel: userAuth.AuthTrustLevel.ATL4
      };
      expect(param.challenge.length).assertEqual(26);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0163 end');
    })
    /**
     * @tc.name   testUserAuthVolume0164
     * @tc.number SUB_USER_AUTH_VOLUME_0164
     * @tc.desc   Verify user auth parameter volume case 164.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0164', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0164 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(27),
        authType: [userAuth.UserAuthType.FINGERPRINT],
        authTrustLevel: userAuth.AuthTrustLevel.ATL1
      };
      expect(param.challenge.length).assertEqual(27);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0164 end');
    })
    /**
     * @tc.name   testUserAuthVolume0165
     * @tc.number SUB_USER_AUTH_VOLUME_0165
     * @tc.desc   Verify user auth parameter volume case 165.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0165', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0165 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(28),
        authType: [userAuth.UserAuthType.PIN],
        authTrustLevel: userAuth.AuthTrustLevel.ATL2
      };
      expect(param.challenge.length).assertEqual(28);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0165 end');
    })
    /**
     * @tc.name   testUserAuthVolume0166
     * @tc.number SUB_USER_AUTH_VOLUME_0166
     * @tc.desc   Verify user auth parameter volume case 166.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0166', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0166 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(29),
        authType: [userAuth.UserAuthType.FACE],
        authTrustLevel: userAuth.AuthTrustLevel.ATL3
      };
      expect(param.challenge.length).assertEqual(29);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0166 end');
    })
    /**
     * @tc.name   testUserAuthVolume0167
     * @tc.number SUB_USER_AUTH_VOLUME_0167
     * @tc.desc   Verify user auth parameter volume case 167.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0167', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0167 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(30),
        authType: [userAuth.UserAuthType.FINGERPRINT],
        authTrustLevel: userAuth.AuthTrustLevel.ATL4
      };
      expect(param.challenge.length).assertEqual(30);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0167 end');
    })
    /**
     * @tc.name   testUserAuthVolume0168
     * @tc.number SUB_USER_AUTH_VOLUME_0168
     * @tc.desc   Verify user auth parameter volume case 168.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0168', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0168 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(31),
        authType: [userAuth.UserAuthType.PIN],
        authTrustLevel: userAuth.AuthTrustLevel.ATL1
      };
      expect(param.challenge.length).assertEqual(31);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0168 end');
    })
    /**
     * @tc.name   testUserAuthVolume0169
     * @tc.number SUB_USER_AUTH_VOLUME_0169
     * @tc.desc   Verify user auth parameter volume case 169.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0169', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0169 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(32),
        authType: [userAuth.UserAuthType.FACE],
        authTrustLevel: userAuth.AuthTrustLevel.ATL2
      };
      expect(param.challenge.length).assertEqual(32);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0169 end');
    })
    /**
     * @tc.name   testUserAuthVolume0170
     * @tc.number SUB_USER_AUTH_VOLUME_0170
     * @tc.desc   Verify user auth parameter volume case 170.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0170 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(16),
        authType: [userAuth.UserAuthType.FINGERPRINT],
        authTrustLevel: userAuth.AuthTrustLevel.ATL3
      };
      expect(param.challenge.length).assertEqual(16);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0170 end');
    })
    /**
     * @tc.name   testUserAuthVolume0171
     * @tc.number SUB_USER_AUTH_VOLUME_0171
     * @tc.desc   Verify user auth parameter volume case 171.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0171', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0171 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(17),
        authType: [userAuth.UserAuthType.PIN],
        authTrustLevel: userAuth.AuthTrustLevel.ATL4
      };
      expect(param.challenge.length).assertEqual(17);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0171 end');
    })
    /**
     * @tc.name   testUserAuthVolume0172
     * @tc.number SUB_USER_AUTH_VOLUME_0172
     * @tc.desc   Verify user auth parameter volume case 172.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0172', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0172 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(18),
        authType: [userAuth.UserAuthType.FACE],
        authTrustLevel: userAuth.AuthTrustLevel.ATL1
      };
      expect(param.challenge.length).assertEqual(18);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0172 end');
    })
    /**
     * @tc.name   testUserAuthVolume0173
     * @tc.number SUB_USER_AUTH_VOLUME_0173
     * @tc.desc   Verify user auth parameter volume case 173.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0173', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0173 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(19),
        authType: [userAuth.UserAuthType.FINGERPRINT],
        authTrustLevel: userAuth.AuthTrustLevel.ATL2
      };
      expect(param.challenge.length).assertEqual(19);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0173 end');
    })
    /**
     * @tc.name   testUserAuthVolume0174
     * @tc.number SUB_USER_AUTH_VOLUME_0174
     * @tc.desc   Verify user auth parameter volume case 174.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0174', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0174 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(20),
        authType: [userAuth.UserAuthType.PIN],
        authTrustLevel: userAuth.AuthTrustLevel.ATL3
      };
      expect(param.challenge.length).assertEqual(20);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0174 end');
    })
    /**
     * @tc.name   testUserAuthVolume0175
     * @tc.number SUB_USER_AUTH_VOLUME_0175
     * @tc.desc   Verify user auth parameter volume case 175.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0175', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0175 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(21),
        authType: [userAuth.UserAuthType.FACE],
        authTrustLevel: userAuth.AuthTrustLevel.ATL4
      };
      expect(param.challenge.length).assertEqual(21);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0175 end');
    })
    /**
     * @tc.name   testUserAuthVolume0176
     * @tc.number SUB_USER_AUTH_VOLUME_0176
     * @tc.desc   Verify user auth parameter volume case 176.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0176', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0176 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(22),
        authType: [userAuth.UserAuthType.FINGERPRINT],
        authTrustLevel: userAuth.AuthTrustLevel.ATL1
      };
      expect(param.challenge.length).assertEqual(22);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0176 end');
    })
    /**
     * @tc.name   testUserAuthVolume0177
     * @tc.number SUB_USER_AUTH_VOLUME_0177
     * @tc.desc   Verify user auth parameter volume case 177.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0177', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0177 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(23),
        authType: [userAuth.UserAuthType.PIN],
        authTrustLevel: userAuth.AuthTrustLevel.ATL2
      };
      expect(param.challenge.length).assertEqual(23);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0177 end');
    })
    /**
     * @tc.name   testUserAuthVolume0178
     * @tc.number SUB_USER_AUTH_VOLUME_0178
     * @tc.desc   Verify user auth parameter volume case 178.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0178', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0178 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(24),
        authType: [userAuth.UserAuthType.FACE],
        authTrustLevel: userAuth.AuthTrustLevel.ATL3
      };
      expect(param.challenge.length).assertEqual(24);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0178 end');
    })
    /**
     * @tc.name   testUserAuthVolume0179
     * @tc.number SUB_USER_AUTH_VOLUME_0179
     * @tc.desc   Verify user auth parameter volume case 179.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0179', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0179 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(25),
        authType: [userAuth.UserAuthType.FINGERPRINT],
        authTrustLevel: userAuth.AuthTrustLevel.ATL4
      };
      expect(param.challenge.length).assertEqual(25);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0179 end');
    })
    /**
     * @tc.name   testUserAuthVolume0180
     * @tc.number SUB_USER_AUTH_VOLUME_0180
     * @tc.desc   Verify user auth parameter volume case 180.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0180 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(26),
        authType: [userAuth.UserAuthType.PIN],
        authTrustLevel: userAuth.AuthTrustLevel.ATL1
      };
      expect(param.challenge.length).assertEqual(26);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0180 end');
    })
    /**
     * @tc.name   testUserAuthVolume0181
     * @tc.number SUB_USER_AUTH_VOLUME_0181
     * @tc.desc   Verify user auth parameter volume case 181.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0181', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0181 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(27),
        authType: [userAuth.UserAuthType.FACE],
        authTrustLevel: userAuth.AuthTrustLevel.ATL2
      };
      expect(param.challenge.length).assertEqual(27);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0181 end');
    })
    /**
     * @tc.name   testUserAuthVolume0182
     * @tc.number SUB_USER_AUTH_VOLUME_0182
     * @tc.desc   Verify user auth parameter volume case 182.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0182', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0182 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(28),
        authType: [userAuth.UserAuthType.FINGERPRINT],
        authTrustLevel: userAuth.AuthTrustLevel.ATL3
      };
      expect(param.challenge.length).assertEqual(28);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0182 end');
    })
    /**
     * @tc.name   testUserAuthVolume0183
     * @tc.number SUB_USER_AUTH_VOLUME_0183
     * @tc.desc   Verify user auth parameter volume case 183.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0183', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0183 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(29),
        authType: [userAuth.UserAuthType.PIN],
        authTrustLevel: userAuth.AuthTrustLevel.ATL4
      };
      expect(param.challenge.length).assertEqual(29);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0183 end');
    })
    /**
     * @tc.name   testUserAuthVolume0184
     * @tc.number SUB_USER_AUTH_VOLUME_0184
     * @tc.desc   Verify user auth parameter volume case 184.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0184', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0184 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(30),
        authType: [userAuth.UserAuthType.FACE],
        authTrustLevel: userAuth.AuthTrustLevel.ATL1
      };
      expect(param.challenge.length).assertEqual(30);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0184 end');
    })
    /**
     * @tc.name   testUserAuthVolume0185
     * @tc.number SUB_USER_AUTH_VOLUME_0185
     * @tc.desc   Verify user auth parameter volume case 185.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0185', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0185 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(31),
        authType: [userAuth.UserAuthType.FINGERPRINT],
        authTrustLevel: userAuth.AuthTrustLevel.ATL2
      };
      expect(param.challenge.length).assertEqual(31);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0185 end');
    })
    /**
     * @tc.name   testUserAuthVolume0186
     * @tc.number SUB_USER_AUTH_VOLUME_0186
     * @tc.desc   Verify user auth parameter volume case 186.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0186', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0186 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(32),
        authType: [userAuth.UserAuthType.PIN],
        authTrustLevel: userAuth.AuthTrustLevel.ATL3
      };
      expect(param.challenge.length).assertEqual(32);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0186 end');
    })
    /**
     * @tc.name   testUserAuthVolume0187
     * @tc.number SUB_USER_AUTH_VOLUME_0187
     * @tc.desc   Verify user auth parameter volume case 187.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0187', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0187 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(16),
        authType: [userAuth.UserAuthType.FACE],
        authTrustLevel: userAuth.AuthTrustLevel.ATL4
      };
      expect(param.challenge.length).assertEqual(16);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0187 end');
    })
    /**
     * @tc.name   testUserAuthVolume0188
     * @tc.number SUB_USER_AUTH_VOLUME_0188
     * @tc.desc   Verify user auth parameter volume case 188.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0188', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0188 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(17),
        authType: [userAuth.UserAuthType.FINGERPRINT],
        authTrustLevel: userAuth.AuthTrustLevel.ATL1
      };
      expect(param.challenge.length).assertEqual(17);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0188 end');
    })
    /**
     * @tc.name   testUserAuthVolume0189
     * @tc.number SUB_USER_AUTH_VOLUME_0189
     * @tc.desc   Verify user auth parameter volume case 189.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0189', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0189 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(18),
        authType: [userAuth.UserAuthType.PIN],
        authTrustLevel: userAuth.AuthTrustLevel.ATL2
      };
      expect(param.challenge.length).assertEqual(18);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0189 end');
    })
    /**
     * @tc.name   testUserAuthVolume0190
     * @tc.number SUB_USER_AUTH_VOLUME_0190
     * @tc.desc   Verify user auth parameter volume case 190.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0190 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(19),
        authType: [userAuth.UserAuthType.FACE],
        authTrustLevel: userAuth.AuthTrustLevel.ATL3
      };
      expect(param.challenge.length).assertEqual(19);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0190 end');
    })
    /**
     * @tc.name   testUserAuthVolume0191
     * @tc.number SUB_USER_AUTH_VOLUME_0191
     * @tc.desc   Verify user auth parameter volume case 191.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0191', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0191 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(20),
        authType: [userAuth.UserAuthType.FINGERPRINT],
        authTrustLevel: userAuth.AuthTrustLevel.ATL4
      };
      expect(param.challenge.length).assertEqual(20);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0191 end');
    })
    /**
     * @tc.name   testUserAuthVolume0192
     * @tc.number SUB_USER_AUTH_VOLUME_0192
     * @tc.desc   Verify user auth parameter volume case 192.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0192', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0192 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(21),
        authType: [userAuth.UserAuthType.PIN],
        authTrustLevel: userAuth.AuthTrustLevel.ATL1
      };
      expect(param.challenge.length).assertEqual(21);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0192 end');
    })
    /**
     * @tc.name   testUserAuthVolume0193
     * @tc.number SUB_USER_AUTH_VOLUME_0193
     * @tc.desc   Verify user auth parameter volume case 193.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0193', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0193 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(22),
        authType: [userAuth.UserAuthType.FACE],
        authTrustLevel: userAuth.AuthTrustLevel.ATL2
      };
      expect(param.challenge.length).assertEqual(22);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0193 end');
    })
    /**
     * @tc.name   testUserAuthVolume0194
     * @tc.number SUB_USER_AUTH_VOLUME_0194
     * @tc.desc   Verify user auth parameter volume case 194.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0194', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0194 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(23),
        authType: [userAuth.UserAuthType.FINGERPRINT],
        authTrustLevel: userAuth.AuthTrustLevel.ATL3
      };
      expect(param.challenge.length).assertEqual(23);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0194 end');
    })
    /**
     * @tc.name   testUserAuthVolume0195
     * @tc.number SUB_USER_AUTH_VOLUME_0195
     * @tc.desc   Verify user auth parameter volume case 195.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0195', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0195 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(24),
        authType: [userAuth.UserAuthType.PIN],
        authTrustLevel: userAuth.AuthTrustLevel.ATL4
      };
      expect(param.challenge.length).assertEqual(24);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0195 end');
    })
    /**
     * @tc.name   testUserAuthVolume0196
     * @tc.number SUB_USER_AUTH_VOLUME_0196
     * @tc.desc   Verify user auth parameter volume case 196.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0196', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0196 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(25),
        authType: [userAuth.UserAuthType.FACE],
        authTrustLevel: userAuth.AuthTrustLevel.ATL1
      };
      expect(param.challenge.length).assertEqual(25);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0196 end');
    })
    /**
     * @tc.name   testUserAuthVolume0197
     * @tc.number SUB_USER_AUTH_VOLUME_0197
     * @tc.desc   Verify user auth parameter volume case 197.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0197', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0197 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(26),
        authType: [userAuth.UserAuthType.FINGERPRINT],
        authTrustLevel: userAuth.AuthTrustLevel.ATL2
      };
      expect(param.challenge.length).assertEqual(26);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0197 end');
    })
    /**
     * @tc.name   testUserAuthVolume0198
     * @tc.number SUB_USER_AUTH_VOLUME_0198
     * @tc.desc   Verify user auth parameter volume case 198.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0198', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0198 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(27),
        authType: [userAuth.UserAuthType.PIN],
        authTrustLevel: userAuth.AuthTrustLevel.ATL3
      };
      expect(param.challenge.length).assertEqual(27);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0198 end');
    })
    /**
     * @tc.name   testUserAuthVolume0199
     * @tc.number SUB_USER_AUTH_VOLUME_0199
     * @tc.desc   Verify user auth parameter volume case 199.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0199', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0199 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(28),
        authType: [userAuth.UserAuthType.FACE],
        authTrustLevel: userAuth.AuthTrustLevel.ATL4
      };
      expect(param.challenge.length).assertEqual(28);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0199 end');
    })
    /**
     * @tc.name   testUserAuthVolume0200
     * @tc.number SUB_USER_AUTH_VOLUME_0200
     * @tc.desc   Verify user auth parameter volume case 200.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0200 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(29),
        authType: [userAuth.UserAuthType.FINGERPRINT],
        authTrustLevel: userAuth.AuthTrustLevel.ATL1
      };
      expect(param.challenge.length).assertEqual(29);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0200 end');
    })
    /**
     * @tc.name   testUserAuthVolume0201
     * @tc.number SUB_USER_AUTH_VOLUME_0201
     * @tc.desc   Verify user auth parameter volume case 201.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0201 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(30),
        authType: [userAuth.UserAuthType.PIN],
        authTrustLevel: userAuth.AuthTrustLevel.ATL2
      };
      expect(param.challenge.length).assertEqual(30);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0201 end');
    })
    /**
     * @tc.name   testUserAuthVolume0202
     * @tc.number SUB_USER_AUTH_VOLUME_0202
     * @tc.desc   Verify user auth parameter volume case 202.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0202', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0202 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(31),
        authType: [userAuth.UserAuthType.FACE],
        authTrustLevel: userAuth.AuthTrustLevel.ATL3
      };
      expect(param.challenge.length).assertEqual(31);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0202 end');
    })
    /**
     * @tc.name   testUserAuthVolume0203
     * @tc.number SUB_USER_AUTH_VOLUME_0203
     * @tc.desc   Verify user auth parameter volume case 203.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0203', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0203 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(32),
        authType: [userAuth.UserAuthType.FINGERPRINT],
        authTrustLevel: userAuth.AuthTrustLevel.ATL4
      };
      expect(param.challenge.length).assertEqual(32);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0203 end');
    })
    /**
     * @tc.name   testUserAuthVolume0204
     * @tc.number SUB_USER_AUTH_VOLUME_0204
     * @tc.desc   Verify user auth parameter volume case 204.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0204', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0204 begin');
      const param: userAuth.AuthParam = {
        challenge: new Uint8Array(16),
        authType: [userAuth.UserAuthType.PIN],
        authTrustLevel: userAuth.AuthTrustLevel.ATL1
      };
      expect(param.challenge.length).assertEqual(16);
      expect(param.authType.length).assertEqual(1);
      expect(param.authType[0] > 0).assertTrue();
      expect(param.authTrustLevel > 0).assertTrue();
      expect(typeof param.authTrustLevel).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0204 end');
    })
    /**
     * @tc.name   testUserAuthVolume0205
     * @tc.number SUB_USER_AUTH_VOLUME_0205
     * @tc.desc   Verify user auth parameter volume case 205.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0205', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0205 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0205 end');
    })
    /**
     * @tc.name   testUserAuthVolume0206
     * @tc.number SUB_USER_AUTH_VOLUME_0206
     * @tc.desc   Verify user auth parameter volume case 206.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0206', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0206 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0206 end');
    })
    /**
     * @tc.name   testUserAuthVolume0207
     * @tc.number SUB_USER_AUTH_VOLUME_0207
     * @tc.desc   Verify user auth parameter volume case 207.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0207', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0207 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0207 end');
    })
    /**
     * @tc.name   testUserAuthVolume0208
     * @tc.number SUB_USER_AUTH_VOLUME_0208
     * @tc.desc   Verify user auth parameter volume case 208.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0208', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0208 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0208 end');
    })
    /**
     * @tc.name   testUserAuthVolume0209
     * @tc.number SUB_USER_AUTH_VOLUME_0209
     * @tc.desc   Verify user auth parameter volume case 209.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0209', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0209 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0209 end');
    })
    /**
     * @tc.name   testUserAuthVolume0210
     * @tc.number SUB_USER_AUTH_VOLUME_0210
     * @tc.desc   Verify user auth parameter volume case 210.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0210 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0210 end');
    })
    /**
     * @tc.name   testUserAuthVolume0211
     * @tc.number SUB_USER_AUTH_VOLUME_0211
     * @tc.desc   Verify user auth parameter volume case 211.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0211', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0211 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0211 end');
    })
    /**
     * @tc.name   testUserAuthVolume0212
     * @tc.number SUB_USER_AUTH_VOLUME_0212
     * @tc.desc   Verify user auth parameter volume case 212.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0212', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0212 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0212 end');
    })
    /**
     * @tc.name   testUserAuthVolume0213
     * @tc.number SUB_USER_AUTH_VOLUME_0213
     * @tc.desc   Verify user auth parameter volume case 213.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0213', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0213 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0213 end');
    })
    /**
     * @tc.name   testUserAuthVolume0214
     * @tc.number SUB_USER_AUTH_VOLUME_0214
     * @tc.desc   Verify user auth parameter volume case 214.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0214', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0214 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0214 end');
    })
    /**
     * @tc.name   testUserAuthVolume0215
     * @tc.number SUB_USER_AUTH_VOLUME_0215
     * @tc.desc   Verify user auth parameter volume case 215.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0215', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0215 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0215 end');
    })
    /**
     * @tc.name   testUserAuthVolume0216
     * @tc.number SUB_USER_AUTH_VOLUME_0216
     * @tc.desc   Verify user auth parameter volume case 216.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0216', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0216 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0216 end');
    })
    /**
     * @tc.name   testUserAuthVolume0217
     * @tc.number SUB_USER_AUTH_VOLUME_0217
     * @tc.desc   Verify user auth parameter volume case 217.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0217', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0217 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0217 end');
    })
    /**
     * @tc.name   testUserAuthVolume0218
     * @tc.number SUB_USER_AUTH_VOLUME_0218
     * @tc.desc   Verify user auth parameter volume case 218.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0218', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0218 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0218 end');
    })
    /**
     * @tc.name   testUserAuthVolume0219
     * @tc.number SUB_USER_AUTH_VOLUME_0219
     * @tc.desc   Verify user auth parameter volume case 219.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0219', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0219 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0219 end');
    })
    /**
     * @tc.name   testUserAuthVolume0220
     * @tc.number SUB_USER_AUTH_VOLUME_0220
     * @tc.desc   Verify user auth parameter volume case 220.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0220', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0220 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0220 end');
    })
    /**
     * @tc.name   testUserAuthVolume0221
     * @tc.number SUB_USER_AUTH_VOLUME_0221
     * @tc.desc   Verify user auth parameter volume case 221.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0221', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0221 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0221 end');
    })
    /**
     * @tc.name   testUserAuthVolume0222
     * @tc.number SUB_USER_AUTH_VOLUME_0222
     * @tc.desc   Verify user auth parameter volume case 222.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0222', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0222 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0222 end');
    })
    /**
     * @tc.name   testUserAuthVolume0223
     * @tc.number SUB_USER_AUTH_VOLUME_0223
     * @tc.desc   Verify user auth parameter volume case 223.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0223', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0223 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0223 end');
    })
    /**
     * @tc.name   testUserAuthVolume0224
     * @tc.number SUB_USER_AUTH_VOLUME_0224
     * @tc.desc   Verify user auth parameter volume case 224.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0224', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0224 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0224 end');
    })
    /**
     * @tc.name   testUserAuthVolume0225
     * @tc.number SUB_USER_AUTH_VOLUME_0225
     * @tc.desc   Verify user auth parameter volume case 225.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0225', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0225 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0225 end');
    })
    /**
     * @tc.name   testUserAuthVolume0226
     * @tc.number SUB_USER_AUTH_VOLUME_0226
     * @tc.desc   Verify user auth parameter volume case 226.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0226', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0226 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0226 end');
    })
    /**
     * @tc.name   testUserAuthVolume0227
     * @tc.number SUB_USER_AUTH_VOLUME_0227
     * @tc.desc   Verify user auth parameter volume case 227.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0227', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0227 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0227 end');
    })
    /**
     * @tc.name   testUserAuthVolume0228
     * @tc.number SUB_USER_AUTH_VOLUME_0228
     * @tc.desc   Verify user auth parameter volume case 228.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0228', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0228 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0228 end');
    })
    /**
     * @tc.name   testUserAuthVolume0229
     * @tc.number SUB_USER_AUTH_VOLUME_0229
     * @tc.desc   Verify user auth parameter volume case 229.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0229', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0229 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0229 end');
    })
    /**
     * @tc.name   testUserAuthVolume0230
     * @tc.number SUB_USER_AUTH_VOLUME_0230
     * @tc.desc   Verify user auth parameter volume case 230.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0230', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0230 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0230 end');
    })
    /**
     * @tc.name   testUserAuthVolume0231
     * @tc.number SUB_USER_AUTH_VOLUME_0231
     * @tc.desc   Verify user auth parameter volume case 231.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthVolume0231', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0231 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthVolume0231 end');
    })
  })
}
