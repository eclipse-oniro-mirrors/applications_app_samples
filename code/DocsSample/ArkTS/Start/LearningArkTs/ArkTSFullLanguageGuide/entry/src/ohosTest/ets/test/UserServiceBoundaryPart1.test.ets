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
import { User } from '../../../main/ets/common/Types';

const DOMAIN: number = 0xF815;
const TAG: string = '[Sample_ARKTS_GUIDE_EXT]';

export default function UserServiceBoundaryPart1Test(): void {
  describe('UserServiceBoundaryPart1', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 20);
      });
    })


    /**
     * @tc.number    SUB_ARKTS_GUIDE_USBOUNDP1_0100
     * @tc.name      testUserBoundary0001
     * @tc.desc      Verify UserService boundary id -900.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUserBoundary0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0001 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-900);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-900);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0001 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USBOUNDP1_0200
     * @tc.name      testUserBoundary0002
     * @tc.desc      Verify UserService boundary id -901.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUserBoundary0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0002 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-901);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-901);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0002 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USBOUNDP1_0300
     * @tc.name      testUserBoundary0003
     * @tc.desc      Verify UserService boundary id -902.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUserBoundary0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0003 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-902);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-902);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0003 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USBOUNDP1_0400
     * @tc.name      testUserBoundary0004
     * @tc.desc      Verify UserService boundary id -903.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUserBoundary0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0004 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-903);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-903);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0004 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USBOUNDP1_0500
     * @tc.name      testUserBoundary0005
     * @tc.desc      Verify UserService boundary id -904.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUserBoundary0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0005 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-904);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-904);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0005 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USBOUNDP1_0600
     * @tc.name      testUserBoundary0006
     * @tc.desc      Verify UserService boundary id -905.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUserBoundary0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0006 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-905);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-905);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0006 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USBOUNDP1_0700
     * @tc.name      testUserBoundary0007
     * @tc.desc      Verify UserService boundary id -906.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUserBoundary0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0007 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-906);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-906);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0007 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USBOUNDP1_0800
     * @tc.name      testUserBoundary0008
     * @tc.desc      Verify UserService boundary id -907.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUserBoundary0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0008 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-907);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-907);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0008 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USBOUNDP1_0900
     * @tc.name      testUserBoundary0009
     * @tc.desc      Verify UserService boundary id -908.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUserBoundary0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0009 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-908);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-908);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0009 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USBOUNDP1_1000
     * @tc.name      testUserBoundary0010
     * @tc.desc      Verify UserService boundary id -909.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUserBoundary0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0010 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-909);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-909);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0010 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USBOUNDP1_1100
     * @tc.name      testUserBoundary0011
     * @tc.desc      Verify UserService boundary id -910.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUserBoundary0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0011 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-910);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-910);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0011 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USBOUNDP1_1200
     * @tc.name      testUserBoundary0012
     * @tc.desc      Verify UserService boundary id -911.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUserBoundary0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0012 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-911);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-911);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0012 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USBOUNDP1_1300
     * @tc.name      testUserBoundary0013
     * @tc.desc      Verify UserService boundary id -912.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUserBoundary0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0013 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-912);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-912);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0013 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USBOUNDP1_1400
     * @tc.name      testUserBoundary0014
     * @tc.desc      Verify UserService boundary id -913.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUserBoundary0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0014 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-913);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-913);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0014 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USBOUNDP1_1500
     * @tc.name      testUserBoundary0015
     * @tc.desc      Verify UserService boundary id -914.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUserBoundary0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0015 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-914);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-914);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0015 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USBOUNDP1_1600
     * @tc.name      testUserBoundary0016
     * @tc.desc      Verify UserService boundary id -915.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUserBoundary0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0016 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-915);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-915);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0016 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USBOUNDP1_1700
     * @tc.name      testUserBoundary0017
     * @tc.desc      Verify UserService boundary id -916.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUserBoundary0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0017 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-916);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-916);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0017 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USBOUNDP1_1800
     * @tc.name      testUserBoundary0018
     * @tc.desc      Verify UserService boundary id -917.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUserBoundary0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0018 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-917);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-917);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0018 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USBOUNDP1_1900
     * @tc.name      testUserBoundary0019
     * @tc.desc      Verify UserService boundary id -918.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUserBoundary0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0019 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-918);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-918);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0019 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USBOUNDP1_2000
     * @tc.name      testUserBoundary0020
     * @tc.desc      Verify UserService boundary id -919.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUserBoundary0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0020 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-919);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-919);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0020 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USBOUNDP1_2100
     * @tc.name      testUserBoundary0021
     * @tc.desc      Verify UserService boundary id -920.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUserBoundary0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0021 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-920);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-920);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0021 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USBOUNDP1_2200
     * @tc.name      testUserBoundary0022
     * @tc.desc      Verify UserService boundary id -921.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUserBoundary0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0022 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-921);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-921);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0022 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USBOUNDP1_2300
     * @tc.name      testUserBoundary0023
     * @tc.desc      Verify UserService boundary id -922.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUserBoundary0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0023 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-922);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-922);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0023 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USBOUNDP1_2400
     * @tc.name      testUserBoundary0024
     * @tc.desc      Verify UserService boundary id -923.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUserBoundary0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0024 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-923);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-923);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0024 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USBOUNDP1_2500
     * @tc.name      testUserBoundary0025
     * @tc.desc      Verify UserService boundary id -924.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUserBoundary0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0025 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-924);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-924);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0025 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USBOUNDP1_2600
     * @tc.name      testUserBoundary0026
     * @tc.desc      Verify UserService boundary id -925.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUserBoundary0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0026 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-925);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-925);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0026 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USBOUNDP1_2700
     * @tc.name      testUserBoundary0027
     * @tc.desc      Verify UserService boundary id -926.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUserBoundary0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0027 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-926);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-926);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0027 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USBOUNDP1_2800
     * @tc.name      testUserBoundary0028
     * @tc.desc      Verify UserService boundary id -927.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUserBoundary0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0028 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-927);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-927);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0028 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USBOUNDP1_2900
     * @tc.name      testUserBoundary0029
     * @tc.desc      Verify UserService boundary id -928.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUserBoundary0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0029 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-928);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-928);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0029 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USBOUNDP1_3000
     * @tc.name      testUserBoundary0030
     * @tc.desc      Verify UserService boundary id -929.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUserBoundary0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0030 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-929);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-929);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0030 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USBOUNDP1_3100
     * @tc.name      testUserBoundary0031
     * @tc.desc      Verify UserService boundary id -930.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUserBoundary0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0031 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-930);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-930);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0031 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USBOUNDP1_3200
     * @tc.name      testUserBoundary0032
     * @tc.desc      Verify UserService boundary id -931.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUserBoundary0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0032 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-931);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-931);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0032 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USBOUNDP1_3300
     * @tc.name      testUserBoundary0033
     * @tc.desc      Verify UserService boundary id -932.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUserBoundary0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0033 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-932);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-932);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0033 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USBOUNDP1_3400
     * @tc.name      testUserBoundary0034
     * @tc.desc      Verify UserService boundary id -933.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUserBoundary0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0034 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-933);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-933);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0034 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USBOUNDP1_3500
     * @tc.name      testUserBoundary0035
     * @tc.desc      Verify UserService boundary id -934.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUserBoundary0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0035 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-934);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-934);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0035 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USBOUNDP1_3600
     * @tc.name      testUserBoundary0036
     * @tc.desc      Verify UserService boundary id -935.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUserBoundary0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0036 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-935);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-935);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0036 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USBOUNDP1_3700
     * @tc.name      testUserBoundary0037
     * @tc.desc      Verify UserService boundary id -936.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUserBoundary0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0037 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-936);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-936);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0037 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USBOUNDP1_3800
     * @tc.name      testUserBoundary0038
     * @tc.desc      Verify UserService boundary id -937.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUserBoundary0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0038 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-937);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-937);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0038 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USBOUNDP1_3900
     * @tc.name      testUserBoundary0039
     * @tc.desc      Verify UserService boundary id -938.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUserBoundary0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0039 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-938);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-938);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0039 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USBOUNDP1_4000
     * @tc.name      testUserBoundary0040
     * @tc.desc      Verify UserService boundary id -939.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUserBoundary0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0040 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-939);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-939);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0040 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USBOUNDP1_4100
     * @tc.name      testUserBoundary0041
     * @tc.desc      Verify UserService boundary id -940.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUserBoundary0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0041 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-940);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-940);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0041 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USBOUNDP1_4200
     * @tc.name      testUserBoundary0042
     * @tc.desc      Verify UserService boundary id -941.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUserBoundary0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0042 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-941);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-941);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0042 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USBOUNDP1_4300
     * @tc.name      testUserBoundary0043
     * @tc.desc      Verify UserService boundary id -942.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUserBoundary0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0043 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-942);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-942);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0043 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USBOUNDP1_4400
     * @tc.name      testUserBoundary0044
     * @tc.desc      Verify UserService boundary id -943.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUserBoundary0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0044 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-943);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-943);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0044 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USBOUNDP1_4500
     * @tc.name      testUserBoundary0045
     * @tc.desc      Verify UserService boundary id -944.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUserBoundary0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0045 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-944);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-944);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0045 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USBOUNDP1_4600
     * @tc.name      testUserBoundary0046
     * @tc.desc      Verify UserService boundary id -945.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUserBoundary0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0046 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-945);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-945);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0046 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USBOUNDP1_4700
     * @tc.name      testUserBoundary0047
     * @tc.desc      Verify UserService boundary id -946.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUserBoundary0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0047 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-946);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-946);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0047 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USBOUNDP1_4800
     * @tc.name      testUserBoundary0048
     * @tc.desc      Verify UserService boundary id -947.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUserBoundary0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0048 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-947);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-947);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0048 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USBOUNDP1_4900
     * @tc.name      testUserBoundary0049
     * @tc.desc      Verify UserService boundary id -948.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUserBoundary0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0049 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-948);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-948);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0049 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USBOUNDP1_5000
     * @tc.name      testUserBoundary0050
     * @tc.desc      Verify UserService boundary id -949.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUserBoundary0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0050 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-949);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-949);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0050 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USBOUNDP1_5100
     * @tc.name      testUserBoundary0051
     * @tc.desc      Verify UserService boundary id 261.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUserBoundary0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0051 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(261);
      expect(result === null).assertEqual(false);
      if (result !== null) {
        expect((result as User).id).assertEqual(261);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0051 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USBOUNDP1_5200
     * @tc.name      testUserBoundary0052
     * @tc.desc      Verify UserService boundary id 262.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUserBoundary0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0052 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(262);
      expect(result === null).assertEqual(false);
      if (result !== null) {
        expect((result as User).id).assertEqual(262);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0052 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USBOUNDP1_5300
     * @tc.name      testUserBoundary0053
     * @tc.desc      Verify UserService boundary id 263.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUserBoundary0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0053 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(263);
      expect(result === null).assertEqual(false);
      if (result !== null) {
        expect((result as User).id).assertEqual(263);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0053 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USBOUNDP1_5400
     * @tc.name      testUserBoundary0054
     * @tc.desc      Verify UserService boundary id 264.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUserBoundary0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0054 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(264);
      expect(result === null).assertEqual(false);
      if (result !== null) {
        expect((result as User).id).assertEqual(264);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0054 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USBOUNDP1_5500
     * @tc.name      testUserBoundary0055
     * @tc.desc      Verify UserService boundary id 265.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUserBoundary0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0055 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(265);
      expect(result === null).assertEqual(false);
      if (result !== null) {
        expect((result as User).id).assertEqual(265);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0055 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USBOUNDP1_5600
     * @tc.name      testUserBoundary0056
     * @tc.desc      Verify UserService boundary id 266.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUserBoundary0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0056 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(266);
      expect(result === null).assertEqual(false);
      if (result !== null) {
        expect((result as User).id).assertEqual(266);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0056 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USBOUNDP1_5700
     * @tc.name      testUserBoundary0057
     * @tc.desc      Verify UserService boundary id 267.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUserBoundary0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0057 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(267);
      expect(result === null).assertEqual(false);
      if (result !== null) {
        expect((result as User).id).assertEqual(267);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0057 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USBOUNDP1_5800
     * @tc.name      testUserBoundary0058
     * @tc.desc      Verify UserService boundary id 268.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUserBoundary0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0058 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(268);
      expect(result === null).assertEqual(false);
      if (result !== null) {
        expect((result as User).id).assertEqual(268);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0058 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USBOUNDP1_5900
     * @tc.name      testUserBoundary0059
     * @tc.desc      Verify UserService boundary id 269.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUserBoundary0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0059 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(269);
      expect(result === null).assertEqual(false);
      if (result !== null) {
        expect((result as User).id).assertEqual(269);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0059 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USBOUNDP1_6000
     * @tc.name      testUserBoundary0060
     * @tc.desc      Verify UserService boundary id 270.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUserBoundary0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0060 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(270);
      expect(result === null).assertEqual(false);
      if (result !== null) {
        expect((result as User).id).assertEqual(270);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0060 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USBOUNDP1_6100
     * @tc.name      testUserBoundary0061
     * @tc.desc      Verify UserService boundary id 271.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUserBoundary0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0061 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(271);
      expect(result === null).assertEqual(false);
      if (result !== null) {
        expect((result as User).id).assertEqual(271);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0061 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USBOUNDP1_6200
     * @tc.name      testUserBoundary0062
     * @tc.desc      Verify UserService boundary id 272.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUserBoundary0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0062 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(272);
      expect(result === null).assertEqual(false);
      if (result !== null) {
        expect((result as User).id).assertEqual(272);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0062 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USBOUNDP1_6300
     * @tc.name      testUserBoundary0063
     * @tc.desc      Verify UserService boundary id 273.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUserBoundary0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0063 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(273);
      expect(result === null).assertEqual(false);
      if (result !== null) {
        expect((result as User).id).assertEqual(273);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0063 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USBOUNDP1_6400
     * @tc.name      testUserBoundary0064
     * @tc.desc      Verify UserService boundary id 274.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUserBoundary0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0064 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(274);
      expect(result === null).assertEqual(false);
      if (result !== null) {
        expect((result as User).id).assertEqual(274);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0064 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USBOUNDP1_6500
     * @tc.name      testUserBoundary0065
     * @tc.desc      Verify UserService boundary id 275.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUserBoundary0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0065 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(275);
      expect(result === null).assertEqual(false);
      if (result !== null) {
        expect((result as User).id).assertEqual(275);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0065 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USBOUNDP1_6600
     * @tc.name      testUserBoundary0066
     * @tc.desc      Verify UserService boundary id 276.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUserBoundary0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0066 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(276);
      expect(result === null).assertEqual(false);
      if (result !== null) {
        expect((result as User).id).assertEqual(276);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0066 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USBOUNDP1_6700
     * @tc.name      testUserBoundary0067
     * @tc.desc      Verify UserService boundary id 277.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUserBoundary0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0067 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(277);
      expect(result === null).assertEqual(false);
      if (result !== null) {
        expect((result as User).id).assertEqual(277);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0067 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USBOUNDP1_6800
     * @tc.name      testUserBoundary0068
     * @tc.desc      Verify UserService boundary id 278.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUserBoundary0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0068 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(278);
      expect(result === null).assertEqual(false);
      if (result !== null) {
        expect((result as User).id).assertEqual(278);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0068 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USBOUNDP1_6900
     * @tc.name      testUserBoundary0069
     * @tc.desc      Verify UserService boundary id 279.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUserBoundary0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0069 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(279);
      expect(result === null).assertEqual(false);
      if (result !== null) {
        expect((result as User).id).assertEqual(279);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0069 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USBOUNDP1_7000
     * @tc.name      testUserBoundary0070
     * @tc.desc      Verify UserService boundary id 280.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUserBoundary0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0070 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(280);
      expect(result === null).assertEqual(false);
      if (result !== null) {
        expect((result as User).id).assertEqual(280);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0070 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USBOUNDP1_7100
     * @tc.name      testUserBoundary0071
     * @tc.desc      Verify UserService boundary id 281.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUserBoundary0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0071 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(281);
      expect(result === null).assertEqual(false);
      if (result !== null) {
        expect((result as User).id).assertEqual(281);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0071 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USBOUNDP1_7200
     * @tc.name      testUserBoundary0072
     * @tc.desc      Verify UserService boundary id 282.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUserBoundary0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0072 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(282);
      expect(result === null).assertEqual(false);
      if (result !== null) {
        expect((result as User).id).assertEqual(282);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0072 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USBOUNDP1_7300
     * @tc.name      testUserBoundary0073
     * @tc.desc      Verify UserService boundary id 283.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUserBoundary0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0073 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(283);
      expect(result === null).assertEqual(false);
      if (result !== null) {
        expect((result as User).id).assertEqual(283);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0073 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USBOUNDP1_7400
     * @tc.name      testUserBoundary0074
     * @tc.desc      Verify UserService boundary id 284.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUserBoundary0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0074 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(284);
      expect(result === null).assertEqual(false);
      if (result !== null) {
        expect((result as User).id).assertEqual(284);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0074 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USBOUNDP1_7500
     * @tc.name      testUserBoundary0075
     * @tc.desc      Verify UserService boundary id 285.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUserBoundary0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0075 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(285);
      expect(result === null).assertEqual(false);
      if (result !== null) {
        expect((result as User).id).assertEqual(285);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0075 end');
    })

  })
}
