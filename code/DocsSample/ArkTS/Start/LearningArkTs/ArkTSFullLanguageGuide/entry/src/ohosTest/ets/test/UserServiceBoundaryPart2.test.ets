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

export default function UserServiceBoundaryPart2Test(): void {
  describe('UserServiceBoundaryPart2', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 20);
      });
    })


    /**
     * @tc.number    SUB_ARKTS_GUIDE_USBOUNDP2_7600
     * @tc.name      testUserBoundary0076
     * @tc.desc      Verify UserService boundary id 286.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUserBoundary0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0076 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(286);
      expect(result === null).assertEqual(false);
      if (result !== null) {
        expect((result as User).id).assertEqual(286);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0076 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USBOUNDP2_7700
     * @tc.name      testUserBoundary0077
     * @tc.desc      Verify UserService boundary id 287.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUserBoundary0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0077 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(287);
      expect(result === null).assertEqual(false);
      if (result !== null) {
        expect((result as User).id).assertEqual(287);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0077 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USBOUNDP2_7800
     * @tc.name      testUserBoundary0078
     * @tc.desc      Verify UserService boundary id 288.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUserBoundary0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0078 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(288);
      expect(result === null).assertEqual(false);
      if (result !== null) {
        expect((result as User).id).assertEqual(288);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0078 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USBOUNDP2_7900
     * @tc.name      testUserBoundary0079
     * @tc.desc      Verify UserService boundary id 289.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUserBoundary0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0079 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(289);
      expect(result === null).assertEqual(false);
      if (result !== null) {
        expect((result as User).id).assertEqual(289);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0079 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USBOUNDP2_8000
     * @tc.name      testUserBoundary0080
     * @tc.desc      Verify UserService boundary id 290.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUserBoundary0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0080 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(290);
      expect(result === null).assertEqual(false);
      if (result !== null) {
        expect((result as User).id).assertEqual(290);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0080 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USBOUNDP2_8100
     * @tc.name      testUserBoundary0081
     * @tc.desc      Verify UserService boundary id 291.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUserBoundary0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0081 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(291);
      expect(result === null).assertEqual(false);
      if (result !== null) {
        expect((result as User).id).assertEqual(291);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0081 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USBOUNDP2_8200
     * @tc.name      testUserBoundary0082
     * @tc.desc      Verify UserService boundary id 292.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUserBoundary0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0082 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(292);
      expect(result === null).assertEqual(false);
      if (result !== null) {
        expect((result as User).id).assertEqual(292);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0082 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USBOUNDP2_8300
     * @tc.name      testUserBoundary0083
     * @tc.desc      Verify UserService boundary id 293.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUserBoundary0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0083 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(293);
      expect(result === null).assertEqual(false);
      if (result !== null) {
        expect((result as User).id).assertEqual(293);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0083 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USBOUNDP2_8400
     * @tc.name      testUserBoundary0084
     * @tc.desc      Verify UserService boundary id 294.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUserBoundary0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0084 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(294);
      expect(result === null).assertEqual(false);
      if (result !== null) {
        expect((result as User).id).assertEqual(294);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0084 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USBOUNDP2_8500
     * @tc.name      testUserBoundary0085
     * @tc.desc      Verify UserService boundary id 295.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUserBoundary0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0085 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(295);
      expect(result === null).assertEqual(false);
      if (result !== null) {
        expect((result as User).id).assertEqual(295);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0085 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USBOUNDP2_8600
     * @tc.name      testUserBoundary0086
     * @tc.desc      Verify UserService boundary id 296.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUserBoundary0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0086 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(296);
      expect(result === null).assertEqual(false);
      if (result !== null) {
        expect((result as User).id).assertEqual(296);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0086 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USBOUNDP2_8700
     * @tc.name      testUserBoundary0087
     * @tc.desc      Verify UserService boundary id 297.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUserBoundary0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0087 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(297);
      expect(result === null).assertEqual(false);
      if (result !== null) {
        expect((result as User).id).assertEqual(297);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0087 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USBOUNDP2_8800
     * @tc.name      testUserBoundary0088
     * @tc.desc      Verify UserService boundary id 298.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUserBoundary0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0088 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(298);
      expect(result === null).assertEqual(false);
      if (result !== null) {
        expect((result as User).id).assertEqual(298);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0088 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USBOUNDP2_8900
     * @tc.name      testUserBoundary0089
     * @tc.desc      Verify UserService boundary id 299.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUserBoundary0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0089 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(299);
      expect(result === null).assertEqual(false);
      if (result !== null) {
        expect((result as User).id).assertEqual(299);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0089 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USBOUNDP2_9000
     * @tc.name      testUserBoundary0090
     * @tc.desc      Verify UserService boundary id 300.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUserBoundary0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0090 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(300);
      expect(result === null).assertEqual(false);
      if (result !== null) {
        expect((result as User).id).assertEqual(300);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0090 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USBOUNDP2_9100
     * @tc.name      testUserBoundary0091
     * @tc.desc      Verify UserService boundary id 1000000000000000.0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUserBoundary0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0091 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(1000000000000000.0);
      expect(result === null).assertEqual(false);
      if (result !== null) {
        expect((result as User).id).assertEqual(1000000000000000.0);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0091 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USBOUNDP2_9200
     * @tc.name      testUserBoundary0092
     * @tc.desc      Verify UserService boundary id -1000000000000000.0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUserBoundary0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0092 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-1000000000000000.0);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-1000000000000000.0);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0092 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USBOUNDP2_9300
     * @tc.name      testUserBoundary0093
     * @tc.desc      Verify UserService boundary id 9007199254740991.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUserBoundary0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0093 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(9007199254740991);
      expect(result === null).assertEqual(false);
      if (result !== null) {
        expect((result as User).id).assertEqual(9007199254740991);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0093 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USBOUNDP2_9400
     * @tc.name      testUserBoundary0094
     * @tc.desc      Verify UserService boundary id 1.5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUserBoundary0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0094 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(1.5);
      expect(result === null).assertEqual(false);
      if (result !== null) {
        expect((result as User).id).assertEqual(1.5);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0094 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USBOUNDP2_9500
     * @tc.name      testUserBoundary0095
     * @tc.desc      Verify UserService boundary id -1.5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUserBoundary0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0095 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-1.5);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-1.5);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0095 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USBOUNDP2_9600
     * @tc.name      testUserBoundary0096
     * @tc.desc      Verify UserService boundary id 0.5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUserBoundary0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0096 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(0.5);
      expect(result === null).assertEqual(false);
      if (result !== null) {
        expect((result as User).id).assertEqual(0.5);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0096 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USBOUNDP2_9700
     * @tc.name      testUserBoundary0097
     * @tc.desc      Verify UserService boundary id -0.5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUserBoundary0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0097 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-0.5);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-0.5);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0097 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USBOUNDP2_9800
     * @tc.name      testUserBoundary0098
     * @tc.desc      Verify UserService boundary id 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUserBoundary0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0098 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(0);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(0);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0098 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USBOUNDP2_9900
     * @tc.name      testUserBoundary0099
     * @tc.desc      Verify UserService boundary id 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUserBoundary0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0099 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(1);
      expect(result === null).assertEqual(false);
      if (result !== null) {
        expect((result as User).id).assertEqual(1);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0099 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USBOUNDP2_10000
     * @tc.name      testUserBoundary0100
     * @tc.desc      Verify UserService boundary id -1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUserBoundary0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0100 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-1);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-1);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserBoundary0100 end');
    })

  })
}
