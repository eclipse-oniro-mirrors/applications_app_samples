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

import { describe, beforeEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { UserService } from '../../../main/ets/common/Service';
import { getProfileName } from '../../../main/ets/pages/SharedTypesUsage';
import { UserIdentity } from '../../../main/ets/common/Types';

const DOMAIN: number = 0xF815;
const TAG: string = '[Sample_ARKTS_GUIDE_EXT]';

export default function AflgStabilityPart1Test(): void {
  describe('AflgStabilityPart1', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 20);
      });
    })


    /**
     * @tc.number    SUB_ARKTS_GUIDE_STABP1_0100
     * @tc.name      testFindStable0001
     * @tc.desc      Verify findById(1) stable across 50 calls.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFindStable0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFindStable0001 begin');
      const service: UserService = new UserService();
      let ok: boolean = true;
      for (let i: number = 0; i < 50; i++) {
        const user = service.findById(1);
        if (user === null || user.id !== 1) { ok = false; }
      }
      expect(ok).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFindStable0001 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_STABP1_0200
     * @tc.name      testFindStable0002
     * @tc.desc      Verify findById(2) stable across 50 calls.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFindStable0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFindStable0002 begin');
      const service: UserService = new UserService();
      let ok: boolean = true;
      for (let i: number = 0; i < 50; i++) {
        const user = service.findById(2);
        if (user === null || user.id !== 2) { ok = false; }
      }
      expect(ok).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFindStable0002 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_STABP1_0300
     * @tc.name      testFindStable0003
     * @tc.desc      Verify findById(3) stable across 50 calls.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFindStable0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFindStable0003 begin');
      const service: UserService = new UserService();
      let ok: boolean = true;
      for (let i: number = 0; i < 50; i++) {
        const user = service.findById(3);
        if (user === null || user.id !== 3) { ok = false; }
      }
      expect(ok).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFindStable0003 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_STABP1_0400
     * @tc.name      testFindStable0004
     * @tc.desc      Verify findById(4) stable across 50 calls.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFindStable0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFindStable0004 begin');
      const service: UserService = new UserService();
      let ok: boolean = true;
      for (let i: number = 0; i < 50; i++) {
        const user = service.findById(4);
        if (user === null || user.id !== 4) { ok = false; }
      }
      expect(ok).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFindStable0004 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_STABP1_0500
     * @tc.name      testFindStable0005
     * @tc.desc      Verify findById(5) stable across 50 calls.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFindStable0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFindStable0005 begin');
      const service: UserService = new UserService();
      let ok: boolean = true;
      for (let i: number = 0; i < 50; i++) {
        const user = service.findById(5);
        if (user === null || user.id !== 5) { ok = false; }
      }
      expect(ok).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFindStable0005 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_STABP1_0600
     * @tc.name      testFindStable0006
     * @tc.desc      Verify findById(6) stable across 50 calls.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFindStable0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFindStable0006 begin');
      const service: UserService = new UserService();
      let ok: boolean = true;
      for (let i: number = 0; i < 50; i++) {
        const user = service.findById(6);
        if (user === null || user.id !== 6) { ok = false; }
      }
      expect(ok).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFindStable0006 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_STABP1_0700
     * @tc.name      testFindStable0007
     * @tc.desc      Verify findById(7) stable across 50 calls.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFindStable0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFindStable0007 begin');
      const service: UserService = new UserService();
      let ok: boolean = true;
      for (let i: number = 0; i < 50; i++) {
        const user = service.findById(7);
        if (user === null || user.id !== 7) { ok = false; }
      }
      expect(ok).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFindStable0007 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_STABP1_0800
     * @tc.name      testFindStable0008
     * @tc.desc      Verify findById(8) stable across 50 calls.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFindStable0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFindStable0008 begin');
      const service: UserService = new UserService();
      let ok: boolean = true;
      for (let i: number = 0; i < 50; i++) {
        const user = service.findById(8);
        if (user === null || user.id !== 8) { ok = false; }
      }
      expect(ok).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFindStable0008 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_STABP1_0900
     * @tc.name      testFindStable0009
     * @tc.desc      Verify findById(9) stable across 50 calls.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFindStable0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFindStable0009 begin');
      const service: UserService = new UserService();
      let ok: boolean = true;
      for (let i: number = 0; i < 50; i++) {
        const user = service.findById(9);
        if (user === null || user.id !== 9) { ok = false; }
      }
      expect(ok).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFindStable0009 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_STABP1_1000
     * @tc.name      testFindStable0010
     * @tc.desc      Verify findById(10) stable across 50 calls.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFindStable0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFindStable0010 begin');
      const service: UserService = new UserService();
      let ok: boolean = true;
      for (let i: number = 0; i < 50; i++) {
        const user = service.findById(10);
        if (user === null || user.id !== 10) { ok = false; }
      }
      expect(ok).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFindStable0010 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_STABP1_1100
     * @tc.name      testProfileStable0011
     * @tc.desc      Verify getProfileName for id 1 stable across 50 calls.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testProfileStable0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileStable0011 begin');
      const identity: UserIdentity = { id: 1 };
      const expected: string = getProfileName(identity);
      let ok: boolean = true;
      for (let i: number = 0; i < 50; i++) {
        if (getProfileName(identity) !== expected) { ok = false; }
      }
      expect(ok).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileStable0011 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_STABP1_1200
     * @tc.name      testProfileStable0012
     * @tc.desc      Verify getProfileName for id 2 stable across 50 calls.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testProfileStable0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileStable0012 begin');
      const identity: UserIdentity = { id: 2 };
      const expected: string = getProfileName(identity);
      let ok: boolean = true;
      for (let i: number = 0; i < 50; i++) {
        if (getProfileName(identity) !== expected) { ok = false; }
      }
      expect(ok).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileStable0012 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_STABP1_1300
     * @tc.name      testProfileStable0013
     * @tc.desc      Verify getProfileName for id 3 stable across 50 calls.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testProfileStable0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileStable0013 begin');
      const identity: UserIdentity = { id: 3 };
      const expected: string = getProfileName(identity);
      let ok: boolean = true;
      for (let i: number = 0; i < 50; i++) {
        if (getProfileName(identity) !== expected) { ok = false; }
      }
      expect(ok).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileStable0013 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_STABP1_1400
     * @tc.name      testProfileStable0014
     * @tc.desc      Verify getProfileName for id 4 stable across 50 calls.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testProfileStable0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileStable0014 begin');
      const identity: UserIdentity = { id: 4 };
      const expected: string = getProfileName(identity);
      let ok: boolean = true;
      for (let i: number = 0; i < 50; i++) {
        if (getProfileName(identity) !== expected) { ok = false; }
      }
      expect(ok).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileStable0014 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_STABP1_1500
     * @tc.name      testProfileStable0015
     * @tc.desc      Verify getProfileName for id 5 stable across 50 calls.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testProfileStable0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileStable0015 begin');
      const identity: UserIdentity = { id: 5 };
      const expected: string = getProfileName(identity);
      let ok: boolean = true;
      for (let i: number = 0; i < 50; i++) {
        if (getProfileName(identity) !== expected) { ok = false; }
      }
      expect(ok).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileStable0015 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_STABP1_1600
     * @tc.name      testProfileStable0016
     * @tc.desc      Verify getProfileName for id 6 stable across 50 calls.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testProfileStable0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileStable0016 begin');
      const identity: UserIdentity = { id: 6 };
      const expected: string = getProfileName(identity);
      let ok: boolean = true;
      for (let i: number = 0; i < 50; i++) {
        if (getProfileName(identity) !== expected) { ok = false; }
      }
      expect(ok).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileStable0016 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_STABP1_1700
     * @tc.name      testProfileStable0017
     * @tc.desc      Verify getProfileName for id 7 stable across 50 calls.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testProfileStable0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileStable0017 begin');
      const identity: UserIdentity = { id: 7 };
      const expected: string = getProfileName(identity);
      let ok: boolean = true;
      for (let i: number = 0; i < 50; i++) {
        if (getProfileName(identity) !== expected) { ok = false; }
      }
      expect(ok).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileStable0017 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_STABP1_1800
     * @tc.name      testProfileStable0018
     * @tc.desc      Verify getProfileName for id 8 stable across 50 calls.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testProfileStable0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileStable0018 begin');
      const identity: UserIdentity = { id: 8 };
      const expected: string = getProfileName(identity);
      let ok: boolean = true;
      for (let i: number = 0; i < 50; i++) {
        if (getProfileName(identity) !== expected) { ok = false; }
      }
      expect(ok).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileStable0018 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_STABP1_1900
     * @tc.name      testProfileStable0019
     * @tc.desc      Verify getProfileName for id 9 stable across 50 calls.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testProfileStable0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileStable0019 begin');
      const identity: UserIdentity = { id: 9 };
      const expected: string = getProfileName(identity);
      let ok: boolean = true;
      for (let i: number = 0; i < 50; i++) {
        if (getProfileName(identity) !== expected) { ok = false; }
      }
      expect(ok).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileStable0019 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_STABP1_2000
     * @tc.name      testProfileStable0020
     * @tc.desc      Verify getProfileName for id 10 stable across 50 calls.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testProfileStable0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileStable0020 begin');
      const identity: UserIdentity = { id: 10 };
      const expected: string = getProfileName(identity);
      let ok: boolean = true;
      for (let i: number = 0; i < 50; i++) {
        if (getProfileName(identity) !== expected) { ok = false; }
      }
      expect(ok).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileStable0020 end');
    })

  })
}
