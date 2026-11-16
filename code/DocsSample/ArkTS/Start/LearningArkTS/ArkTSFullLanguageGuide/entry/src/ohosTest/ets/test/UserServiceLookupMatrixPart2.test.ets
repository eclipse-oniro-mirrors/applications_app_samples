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

export default function UserServiceLookupMatrixPart2Test(): void {
  describe('UserServiceLookupMatrixPart2', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 20);
      });
    })


    /**
     * @tc.number    SUB_ARKTS_GUIDE_USLOOKP2_7600
     * @tc.name      testUserLookup0076
     * @tc.desc      Verify UserService.findById for id -925.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUserLookup0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0076 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-925);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-925);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0076 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USLOOKP2_7700
     * @tc.name      testUserLookup0077
     * @tc.desc      Verify UserService.findById for id -924.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUserLookup0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0077 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-924);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-924);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0077 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USLOOKP2_7800
     * @tc.name      testUserLookup0078
     * @tc.desc      Verify UserService.findById for id -923.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUserLookup0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0078 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-923);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-923);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0078 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USLOOKP2_7900
     * @tc.name      testUserLookup0079
     * @tc.desc      Verify UserService.findById for id -922.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUserLookup0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0079 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-922);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-922);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0079 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USLOOKP2_8000
     * @tc.name      testUserLookup0080
     * @tc.desc      Verify UserService.findById for id -921.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUserLookup0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0080 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-921);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-921);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0080 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USLOOKP2_8100
     * @tc.name      testUserLookup0081
     * @tc.desc      Verify UserService.findById for id -920.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUserLookup0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0081 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-920);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-920);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0081 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USLOOKP2_8200
     * @tc.name      testUserLookup0082
     * @tc.desc      Verify UserService.findById for id -919.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUserLookup0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0082 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-919);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-919);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0082 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USLOOKP2_8300
     * @tc.name      testUserLookup0083
     * @tc.desc      Verify UserService.findById for id -918.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUserLookup0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0083 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-918);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-918);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0083 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USLOOKP2_8400
     * @tc.name      testUserLookup0084
     * @tc.desc      Verify UserService.findById for id -917.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUserLookup0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0084 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-917);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-917);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0084 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USLOOKP2_8500
     * @tc.name      testUserLookup0085
     * @tc.desc      Verify UserService.findById for id -916.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUserLookup0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0085 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-916);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-916);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0085 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USLOOKP2_8600
     * @tc.name      testUserLookup0086
     * @tc.desc      Verify UserService.findById for id -915.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUserLookup0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0086 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-915);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-915);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0086 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USLOOKP2_8700
     * @tc.name      testUserLookup0087
     * @tc.desc      Verify UserService.findById for id -914.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUserLookup0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0087 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-914);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-914);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0087 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USLOOKP2_8800
     * @tc.name      testUserLookup0088
     * @tc.desc      Verify UserService.findById for id -913.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUserLookup0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0088 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-913);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-913);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0088 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USLOOKP2_8900
     * @tc.name      testUserLookup0089
     * @tc.desc      Verify UserService.findById for id -912.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUserLookup0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0089 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-912);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-912);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0089 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USLOOKP2_9000
     * @tc.name      testUserLookup0090
     * @tc.desc      Verify UserService.findById for id -911.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUserLookup0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0090 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-911);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-911);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0090 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USLOOKP2_9100
     * @tc.name      testUserLookup0091
     * @tc.desc      Verify UserService.findById for id -910.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUserLookup0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0091 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-910);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-910);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0091 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USLOOKP2_9200
     * @tc.name      testUserLookup0092
     * @tc.desc      Verify UserService.findById for id -909.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUserLookup0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0092 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-909);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-909);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0092 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USLOOKP2_9300
     * @tc.name      testUserLookup0093
     * @tc.desc      Verify UserService.findById for id -908.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUserLookup0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0093 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-908);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-908);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0093 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USLOOKP2_9400
     * @tc.name      testUserLookup0094
     * @tc.desc      Verify UserService.findById for id -907.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUserLookup0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0094 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-907);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-907);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0094 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USLOOKP2_9500
     * @tc.name      testUserLookup0095
     * @tc.desc      Verify UserService.findById for id -906.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUserLookup0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0095 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-906);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-906);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0095 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USLOOKP2_9600
     * @tc.name      testUserLookup0096
     * @tc.desc      Verify UserService.findById for id -905.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUserLookup0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0096 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-905);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-905);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0096 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USLOOKP2_9700
     * @tc.name      testUserLookup0097
     * @tc.desc      Verify UserService.findById for id -904.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUserLookup0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0097 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-904);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-904);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0097 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USLOOKP2_9800
     * @tc.name      testUserLookup0098
     * @tc.desc      Verify UserService.findById for id -903.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUserLookup0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0098 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-903);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-903);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0098 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USLOOKP2_9900
     * @tc.name      testUserLookup0099
     * @tc.desc      Verify UserService.findById for id -902.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUserLookup0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0099 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-902);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-902);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0099 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USLOOKP2_10000
     * @tc.name      testUserLookup0100
     * @tc.desc      Verify UserService.findById for id -901.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUserLookup0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0100 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-901);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-901);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0100 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USLOOKP2_10100
     * @tc.name      testUserLookup0101
     * @tc.desc      Verify UserService.findById for id -900.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUserLookup0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0101 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-900);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-900);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0101 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USLOOKP2_10200
     * @tc.name      testUserLookup0102
     * @tc.desc      Verify UserService.findById for id -899.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUserLookup0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0102 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-899);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-899);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0102 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USLOOKP2_10300
     * @tc.name      testUserLookup0103
     * @tc.desc      Verify UserService.findById for id -898.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUserLookup0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0103 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-898);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-898);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0103 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USLOOKP2_10400
     * @tc.name      testUserLookup0104
     * @tc.desc      Verify UserService.findById for id -897.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUserLookup0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0104 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-897);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-897);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0104 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USLOOKP2_10500
     * @tc.name      testUserLookup0105
     * @tc.desc      Verify UserService.findById for id -896.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUserLookup0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0105 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-896);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-896);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0105 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USLOOKP2_10600
     * @tc.name      testUserLookup0106
     * @tc.desc      Verify UserService.findById for id -895.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUserLookup0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0106 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-895);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-895);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0106 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USLOOKP2_10700
     * @tc.name      testUserLookup0107
     * @tc.desc      Verify UserService.findById for id -894.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUserLookup0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0107 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-894);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-894);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0107 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USLOOKP2_10800
     * @tc.name      testUserLookup0108
     * @tc.desc      Verify UserService.findById for id -893.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUserLookup0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0108 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-893);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-893);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0108 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USLOOKP2_10900
     * @tc.name      testUserLookup0109
     * @tc.desc      Verify UserService.findById for id -892.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUserLookup0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0109 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-892);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-892);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0109 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USLOOKP2_11000
     * @tc.name      testUserLookup0110
     * @tc.desc      Verify UserService.findById for id -891.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUserLookup0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0110 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-891);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-891);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0110 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USLOOKP2_11100
     * @tc.name      testUserLookup0111
     * @tc.desc      Verify UserService.findById for id -890.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUserLookup0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0111 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-890);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-890);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0111 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USLOOKP2_11200
     * @tc.name      testUserLookup0112
     * @tc.desc      Verify UserService.findById for id -889.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUserLookup0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0112 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-889);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-889);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0112 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USLOOKP2_11300
     * @tc.name      testUserLookup0113
     * @tc.desc      Verify UserService.findById for id -888.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUserLookup0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0113 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-888);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-888);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0113 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USLOOKP2_11400
     * @tc.name      testUserLookup0114
     * @tc.desc      Verify UserService.findById for id -887.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUserLookup0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0114 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-887);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-887);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0114 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USLOOKP2_11500
     * @tc.name      testUserLookup0115
     * @tc.desc      Verify UserService.findById for id -886.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUserLookup0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0115 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-886);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-886);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0115 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USLOOKP2_11600
     * @tc.name      testUserLookup0116
     * @tc.desc      Verify UserService.findById for id -885.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUserLookup0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0116 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-885);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-885);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0116 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USLOOKP2_11700
     * @tc.name      testUserLookup0117
     * @tc.desc      Verify UserService.findById for id -884.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUserLookup0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0117 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-884);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-884);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0117 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USLOOKP2_11800
     * @tc.name      testUserLookup0118
     * @tc.desc      Verify UserService.findById for id -883.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUserLookup0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0118 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-883);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-883);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0118 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USLOOKP2_11900
     * @tc.name      testUserLookup0119
     * @tc.desc      Verify UserService.findById for id -882.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUserLookup0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0119 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-882);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-882);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0119 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USLOOKP2_12000
     * @tc.name      testUserLookup0120
     * @tc.desc      Verify UserService.findById for id -881.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUserLookup0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0120 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-881);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-881);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0120 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USLOOKP2_12100
     * @tc.name      testUserLookup0121
     * @tc.desc      Verify UserService.findById for id -880.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUserLookup0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0121 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-880);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-880);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0121 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USLOOKP2_12200
     * @tc.name      testUserLookup0122
     * @tc.desc      Verify UserService.findById for id -879.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUserLookup0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0122 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-879);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-879);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0122 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USLOOKP2_12300
     * @tc.name      testUserLookup0123
     * @tc.desc      Verify UserService.findById for id -878.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUserLookup0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0123 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-878);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-878);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0123 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USLOOKP2_12400
     * @tc.name      testUserLookup0124
     * @tc.desc      Verify UserService.findById for id -877.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUserLookup0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0124 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-877);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-877);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0124 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USLOOKP2_12500
     * @tc.name      testUserLookup0125
     * @tc.desc      Verify UserService.findById for id -876.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUserLookup0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0125 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-876);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-876);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0125 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USLOOKP2_12600
     * @tc.name      testUserLookup0126
     * @tc.desc      Verify UserService.findById for id -875.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUserLookup0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0126 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-875);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-875);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0126 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USLOOKP2_12700
     * @tc.name      testUserLookup0127
     * @tc.desc      Verify UserService.findById for id -874.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUserLookup0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0127 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-874);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-874);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0127 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USLOOKP2_12800
     * @tc.name      testUserLookup0128
     * @tc.desc      Verify UserService.findById for id -873.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUserLookup0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0128 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-873);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-873);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0128 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USLOOKP2_12900
     * @tc.name      testUserLookup0129
     * @tc.desc      Verify UserService.findById for id -872.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUserLookup0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0129 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-872);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-872);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0129 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USLOOKP2_13000
     * @tc.name      testUserLookup0130
     * @tc.desc      Verify UserService.findById for id -871.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUserLookup0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0130 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-871);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-871);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0130 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USLOOKP2_13100
     * @tc.name      testUserLookup0131
     * @tc.desc      Verify UserService.findById for id -870.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUserLookup0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0131 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-870);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-870);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0131 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USLOOKP2_13200
     * @tc.name      testUserLookup0132
     * @tc.desc      Verify UserService.findById for id -869.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUserLookup0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0132 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-869);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-869);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0132 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USLOOKP2_13300
     * @tc.name      testUserLookup0133
     * @tc.desc      Verify UserService.findById for id -868.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUserLookup0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0133 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-868);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-868);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0133 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USLOOKP2_13400
     * @tc.name      testUserLookup0134
     * @tc.desc      Verify UserService.findById for id -867.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUserLookup0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0134 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-867);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-867);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0134 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USLOOKP2_13500
     * @tc.name      testUserLookup0135
     * @tc.desc      Verify UserService.findById for id -866.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUserLookup0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0135 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-866);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-866);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0135 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USLOOKP2_13600
     * @tc.name      testUserLookup0136
     * @tc.desc      Verify UserService.findById for id -865.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUserLookup0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0136 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-865);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-865);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0136 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USLOOKP2_13700
     * @tc.name      testUserLookup0137
     * @tc.desc      Verify UserService.findById for id -864.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUserLookup0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0137 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-864);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-864);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0137 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USLOOKP2_13800
     * @tc.name      testUserLookup0138
     * @tc.desc      Verify UserService.findById for id -863.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUserLookup0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0138 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-863);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-863);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0138 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USLOOKP2_13900
     * @tc.name      testUserLookup0139
     * @tc.desc      Verify UserService.findById for id -862.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUserLookup0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0139 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-862);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-862);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0139 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USLOOKP2_14000
     * @tc.name      testUserLookup0140
     * @tc.desc      Verify UserService.findById for id -861.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUserLookup0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0140 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-861);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-861);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0140 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USLOOKP2_14100
     * @tc.name      testUserLookup0141
     * @tc.desc      Verify UserService.findById for id -860.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUserLookup0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0141 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-860);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-860);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0141 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USLOOKP2_14200
     * @tc.name      testUserLookup0142
     * @tc.desc      Verify UserService.findById for id -859.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUserLookup0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0142 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-859);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-859);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0142 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USLOOKP2_14300
     * @tc.name      testUserLookup0143
     * @tc.desc      Verify UserService.findById for id -858.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUserLookup0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0143 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-858);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-858);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0143 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USLOOKP2_14400
     * @tc.name      testUserLookup0144
     * @tc.desc      Verify UserService.findById for id -857.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUserLookup0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0144 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-857);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-857);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0144 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USLOOKP2_14500
     * @tc.name      testUserLookup0145
     * @tc.desc      Verify UserService.findById for id -856.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUserLookup0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0145 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-856);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-856);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0145 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USLOOKP2_14600
     * @tc.name      testUserLookup0146
     * @tc.desc      Verify UserService.findById for id -855.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUserLookup0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0146 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-855);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-855);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0146 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USLOOKP2_14700
     * @tc.name      testUserLookup0147
     * @tc.desc      Verify UserService.findById for id -854.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUserLookup0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0147 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-854);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-854);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0147 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USLOOKP2_14800
     * @tc.name      testUserLookup0148
     * @tc.desc      Verify UserService.findById for id -853.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUserLookup0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0148 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-853);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-853);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0148 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USLOOKP2_14900
     * @tc.name      testUserLookup0149
     * @tc.desc      Verify UserService.findById for id -852.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUserLookup0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0149 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-852);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-852);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0149 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USLOOKP2_15000
     * @tc.name      testUserLookup0150
     * @tc.desc      Verify UserService.findById for id -851.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUserLookup0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0150 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-851);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-851);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0150 end');
    })

  })
}
