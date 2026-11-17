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

export default function userAuthMoreTestPart03() {
  describe('UserAuthMorePart03', () => {
    /**
     * @tc.name   testUserAuthMore0194
     * @tc.number SUB_USER_AUTH_MORE_0194
     * @tc.desc   Verify AuthParam equality 44.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0194', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0194 begin');
      const first: userAuth.AuthParam = { challenge: new Uint8Array(16), authType: [userAuth.UserAuthType.FACE], authTrustLevel: userAuth.AuthTrustLevel.ATL3 };
      const second: userAuth.AuthParam = { challenge: new Uint8Array(16), authType: [userAuth.UserAuthType.FACE], authTrustLevel: userAuth.AuthTrustLevel.ATL3 };
      expect(first.challenge.length).assertEqual(second.challenge.length);
      expect(first.authType[0]).assertEqual(second.authType[0]);
      expect(first.authTrustLevel).assertEqual(second.authTrustLevel);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0194 end');
    })
    /**
     * @tc.name   testUserAuthMore0195
     * @tc.number SUB_USER_AUTH_MORE_0195
     * @tc.desc   Verify AuthParam equality 45.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0195', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0195 begin');
      const first: userAuth.AuthParam = { challenge: new Uint8Array(16), authType: [userAuth.UserAuthType.FACE], authTrustLevel: userAuth.AuthTrustLevel.ATL3 };
      const second: userAuth.AuthParam = { challenge: new Uint8Array(16), authType: [userAuth.UserAuthType.FACE], authTrustLevel: userAuth.AuthTrustLevel.ATL3 };
      expect(first.challenge.length).assertEqual(second.challenge.length);
      expect(first.authType[0]).assertEqual(second.authType[0]);
      expect(first.authTrustLevel).assertEqual(second.authTrustLevel);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0195 end');
    })
    /**
     * @tc.name   testUserAuthMore0196
     * @tc.number SUB_USER_AUTH_MORE_0196
     * @tc.desc   Verify AuthParam equality 46.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0196', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0196 begin');
      const first: userAuth.AuthParam = { challenge: new Uint8Array(16), authType: [userAuth.UserAuthType.FACE], authTrustLevel: userAuth.AuthTrustLevel.ATL3 };
      const second: userAuth.AuthParam = { challenge: new Uint8Array(16), authType: [userAuth.UserAuthType.FACE], authTrustLevel: userAuth.AuthTrustLevel.ATL3 };
      expect(first.challenge.length).assertEqual(second.challenge.length);
      expect(first.authType[0]).assertEqual(second.authType[0]);
      expect(first.authTrustLevel).assertEqual(second.authTrustLevel);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0196 end');
    })
    /**
     * @tc.name   testUserAuthMore0197
     * @tc.number SUB_USER_AUTH_MORE_0197
     * @tc.desc   Verify AuthParam equality 47.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0197', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0197 begin');
      const first: userAuth.AuthParam = { challenge: new Uint8Array(16), authType: [userAuth.UserAuthType.FACE], authTrustLevel: userAuth.AuthTrustLevel.ATL3 };
      const second: userAuth.AuthParam = { challenge: new Uint8Array(16), authType: [userAuth.UserAuthType.FACE], authTrustLevel: userAuth.AuthTrustLevel.ATL3 };
      expect(first.challenge.length).assertEqual(second.challenge.length);
      expect(first.authType[0]).assertEqual(second.authType[0]);
      expect(first.authTrustLevel).assertEqual(second.authTrustLevel);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0197 end');
    })
    /**
     * @tc.name   testUserAuthMore0198
     * @tc.number SUB_USER_AUTH_MORE_0198
     * @tc.desc   Verify AuthParam equality 48.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0198', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0198 begin');
      const first: userAuth.AuthParam = { challenge: new Uint8Array(16), authType: [userAuth.UserAuthType.FACE], authTrustLevel: userAuth.AuthTrustLevel.ATL3 };
      const second: userAuth.AuthParam = { challenge: new Uint8Array(16), authType: [userAuth.UserAuthType.FACE], authTrustLevel: userAuth.AuthTrustLevel.ATL3 };
      expect(first.challenge.length).assertEqual(second.challenge.length);
      expect(first.authType[0]).assertEqual(second.authType[0]);
      expect(first.authTrustLevel).assertEqual(second.authTrustLevel);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0198 end');
    })
    /**
     * @tc.name   testUserAuthMore0199
     * @tc.number SUB_USER_AUTH_MORE_0199
     * @tc.desc   Verify AuthParam equality 49.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0199', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0199 begin');
      const first: userAuth.AuthParam = { challenge: new Uint8Array(16), authType: [userAuth.UserAuthType.FACE], authTrustLevel: userAuth.AuthTrustLevel.ATL3 };
      const second: userAuth.AuthParam = { challenge: new Uint8Array(16), authType: [userAuth.UserAuthType.FACE], authTrustLevel: userAuth.AuthTrustLevel.ATL3 };
      expect(first.challenge.length).assertEqual(second.challenge.length);
      expect(first.authType[0]).assertEqual(second.authType[0]);
      expect(first.authTrustLevel).assertEqual(second.authTrustLevel);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0199 end');
    })
    /**
     * @tc.name   testUserAuthMore0200
     * @tc.number SUB_USER_AUTH_MORE_0200
     * @tc.desc   Verify AuthParam equality 50.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUserAuthMore0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0200 begin');
      const first: userAuth.AuthParam = { challenge: new Uint8Array(16), authType: [userAuth.UserAuthType.FACE], authTrustLevel: userAuth.AuthTrustLevel.ATL3 };
      const second: userAuth.AuthParam = { challenge: new Uint8Array(16), authType: [userAuth.UserAuthType.FACE], authTrustLevel: userAuth.AuthTrustLevel.ATL3 };
      expect(first.challenge.length).assertEqual(second.challenge.length);
      expect(first.authType[0]).assertEqual(second.authType[0]);
      expect(first.authTrustLevel).assertEqual(second.authTrustLevel);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUserAuthMore0200 end');
    })
  })
}
