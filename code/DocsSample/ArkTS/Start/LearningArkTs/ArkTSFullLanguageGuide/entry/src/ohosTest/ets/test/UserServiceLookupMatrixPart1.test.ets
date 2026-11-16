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

export default function UserServiceLookupMatrixPart1Test(): void {
  describe('UserServiceLookupMatrixPart1', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 20);
      });
    })


    /**
     * @tc.number    SUB_ARKTS_GUIDE_USLOOKP1_0100
     * @tc.name      testUserLookup0001
     * @tc.desc      Verify UserService.findById for id -1000.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUserLookup0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0001 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-1000);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-1000);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0001 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USLOOKP1_0200
     * @tc.name      testUserLookup0002
     * @tc.desc      Verify UserService.findById for id -999.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUserLookup0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0002 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-999);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-999);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0002 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USLOOKP1_0300
     * @tc.name      testUserLookup0003
     * @tc.desc      Verify UserService.findById for id -998.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUserLookup0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0003 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-998);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-998);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0003 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USLOOKP1_0400
     * @tc.name      testUserLookup0004
     * @tc.desc      Verify UserService.findById for id -997.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUserLookup0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0004 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-997);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-997);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0004 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USLOOKP1_0500
     * @tc.name      testUserLookup0005
     * @tc.desc      Verify UserService.findById for id -996.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUserLookup0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0005 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-996);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-996);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0005 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USLOOKP1_0600
     * @tc.name      testUserLookup0006
     * @tc.desc      Verify UserService.findById for id -995.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUserLookup0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0006 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-995);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-995);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0006 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USLOOKP1_0700
     * @tc.name      testUserLookup0007
     * @tc.desc      Verify UserService.findById for id -994.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUserLookup0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0007 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-994);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-994);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0007 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USLOOKP1_0800
     * @tc.name      testUserLookup0008
     * @tc.desc      Verify UserService.findById for id -993.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUserLookup0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0008 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-993);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-993);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0008 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USLOOKP1_0900
     * @tc.name      testUserLookup0009
     * @tc.desc      Verify UserService.findById for id -992.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUserLookup0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0009 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-992);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-992);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0009 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USLOOKP1_1000
     * @tc.name      testUserLookup0010
     * @tc.desc      Verify UserService.findById for id -991.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUserLookup0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0010 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-991);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-991);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0010 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USLOOKP1_1100
     * @tc.name      testUserLookup0011
     * @tc.desc      Verify UserService.findById for id -990.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUserLookup0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0011 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-990);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-990);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0011 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USLOOKP1_1200
     * @tc.name      testUserLookup0012
     * @tc.desc      Verify UserService.findById for id -989.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUserLookup0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0012 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-989);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-989);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0012 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USLOOKP1_1300
     * @tc.name      testUserLookup0013
     * @tc.desc      Verify UserService.findById for id -988.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUserLookup0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0013 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-988);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-988);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0013 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USLOOKP1_1400
     * @tc.name      testUserLookup0014
     * @tc.desc      Verify UserService.findById for id -987.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUserLookup0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0014 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-987);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-987);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0014 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USLOOKP1_1500
     * @tc.name      testUserLookup0015
     * @tc.desc      Verify UserService.findById for id -986.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUserLookup0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0015 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-986);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-986);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0015 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USLOOKP1_1600
     * @tc.name      testUserLookup0016
     * @tc.desc      Verify UserService.findById for id -985.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUserLookup0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0016 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-985);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-985);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0016 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USLOOKP1_1700
     * @tc.name      testUserLookup0017
     * @tc.desc      Verify UserService.findById for id -984.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUserLookup0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0017 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-984);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-984);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0017 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USLOOKP1_1800
     * @tc.name      testUserLookup0018
     * @tc.desc      Verify UserService.findById for id -983.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUserLookup0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0018 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-983);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-983);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0018 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USLOOKP1_1900
     * @tc.name      testUserLookup0019
     * @tc.desc      Verify UserService.findById for id -982.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUserLookup0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0019 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-982);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-982);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0019 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USLOOKP1_2000
     * @tc.name      testUserLookup0020
     * @tc.desc      Verify UserService.findById for id -981.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUserLookup0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0020 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-981);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-981);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0020 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USLOOKP1_2100
     * @tc.name      testUserLookup0021
     * @tc.desc      Verify UserService.findById for id -980.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUserLookup0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0021 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-980);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-980);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0021 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USLOOKP1_2200
     * @tc.name      testUserLookup0022
     * @tc.desc      Verify UserService.findById for id -979.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUserLookup0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0022 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-979);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-979);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0022 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USLOOKP1_2300
     * @tc.name      testUserLookup0023
     * @tc.desc      Verify UserService.findById for id -978.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUserLookup0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0023 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-978);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-978);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0023 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USLOOKP1_2400
     * @tc.name      testUserLookup0024
     * @tc.desc      Verify UserService.findById for id -977.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUserLookup0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0024 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-977);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-977);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0024 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USLOOKP1_2500
     * @tc.name      testUserLookup0025
     * @tc.desc      Verify UserService.findById for id -976.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUserLookup0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0025 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-976);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-976);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0025 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USLOOKP1_2600
     * @tc.name      testUserLookup0026
     * @tc.desc      Verify UserService.findById for id -975.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUserLookup0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0026 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-975);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-975);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0026 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USLOOKP1_2700
     * @tc.name      testUserLookup0027
     * @tc.desc      Verify UserService.findById for id -974.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUserLookup0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0027 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-974);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-974);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0027 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USLOOKP1_2800
     * @tc.name      testUserLookup0028
     * @tc.desc      Verify UserService.findById for id -973.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUserLookup0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0028 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-973);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-973);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0028 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USLOOKP1_2900
     * @tc.name      testUserLookup0029
     * @tc.desc      Verify UserService.findById for id -972.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUserLookup0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0029 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-972);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-972);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0029 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USLOOKP1_3000
     * @tc.name      testUserLookup0030
     * @tc.desc      Verify UserService.findById for id -971.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUserLookup0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0030 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-971);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-971);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0030 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USLOOKP1_3100
     * @tc.name      testUserLookup0031
     * @tc.desc      Verify UserService.findById for id -970.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUserLookup0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0031 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-970);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-970);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0031 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USLOOKP1_3200
     * @tc.name      testUserLookup0032
     * @tc.desc      Verify UserService.findById for id -969.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUserLookup0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0032 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-969);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-969);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0032 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USLOOKP1_3300
     * @tc.name      testUserLookup0033
     * @tc.desc      Verify UserService.findById for id -968.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUserLookup0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0033 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-968);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-968);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0033 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USLOOKP1_3400
     * @tc.name      testUserLookup0034
     * @tc.desc      Verify UserService.findById for id -967.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUserLookup0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0034 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-967);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-967);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0034 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USLOOKP1_3500
     * @tc.name      testUserLookup0035
     * @tc.desc      Verify UserService.findById for id -966.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUserLookup0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0035 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-966);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-966);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0035 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USLOOKP1_3600
     * @tc.name      testUserLookup0036
     * @tc.desc      Verify UserService.findById for id -965.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUserLookup0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0036 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-965);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-965);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0036 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USLOOKP1_3700
     * @tc.name      testUserLookup0037
     * @tc.desc      Verify UserService.findById for id -964.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUserLookup0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0037 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-964);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-964);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0037 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USLOOKP1_3800
     * @tc.name      testUserLookup0038
     * @tc.desc      Verify UserService.findById for id -963.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUserLookup0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0038 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-963);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-963);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0038 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USLOOKP1_3900
     * @tc.name      testUserLookup0039
     * @tc.desc      Verify UserService.findById for id -962.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUserLookup0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0039 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-962);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-962);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0039 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USLOOKP1_4000
     * @tc.name      testUserLookup0040
     * @tc.desc      Verify UserService.findById for id -961.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUserLookup0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0040 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-961);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-961);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0040 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USLOOKP1_4100
     * @tc.name      testUserLookup0041
     * @tc.desc      Verify UserService.findById for id -960.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUserLookup0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0041 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-960);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-960);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0041 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USLOOKP1_4200
     * @tc.name      testUserLookup0042
     * @tc.desc      Verify UserService.findById for id -959.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUserLookup0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0042 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-959);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-959);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0042 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USLOOKP1_4300
     * @tc.name      testUserLookup0043
     * @tc.desc      Verify UserService.findById for id -958.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUserLookup0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0043 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-958);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-958);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0043 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USLOOKP1_4400
     * @tc.name      testUserLookup0044
     * @tc.desc      Verify UserService.findById for id -957.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUserLookup0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0044 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-957);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-957);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0044 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USLOOKP1_4500
     * @tc.name      testUserLookup0045
     * @tc.desc      Verify UserService.findById for id -956.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUserLookup0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0045 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-956);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-956);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0045 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USLOOKP1_4600
     * @tc.name      testUserLookup0046
     * @tc.desc      Verify UserService.findById for id -955.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUserLookup0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0046 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-955);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-955);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0046 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USLOOKP1_4700
     * @tc.name      testUserLookup0047
     * @tc.desc      Verify UserService.findById for id -954.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUserLookup0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0047 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-954);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-954);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0047 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USLOOKP1_4800
     * @tc.name      testUserLookup0048
     * @tc.desc      Verify UserService.findById for id -953.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUserLookup0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0048 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-953);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-953);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0048 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USLOOKP1_4900
     * @tc.name      testUserLookup0049
     * @tc.desc      Verify UserService.findById for id -952.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUserLookup0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0049 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-952);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-952);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0049 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USLOOKP1_5000
     * @tc.name      testUserLookup0050
     * @tc.desc      Verify UserService.findById for id -951.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUserLookup0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0050 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-951);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-951);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0050 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USLOOKP1_5100
     * @tc.name      testUserLookup0051
     * @tc.desc      Verify UserService.findById for id -950.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUserLookup0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0051 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-950);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-950);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0051 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USLOOKP1_5200
     * @tc.name      testUserLookup0052
     * @tc.desc      Verify UserService.findById for id -949.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUserLookup0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0052 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-949);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-949);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0052 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USLOOKP1_5300
     * @tc.name      testUserLookup0053
     * @tc.desc      Verify UserService.findById for id -948.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUserLookup0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0053 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-948);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-948);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0053 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USLOOKP1_5400
     * @tc.name      testUserLookup0054
     * @tc.desc      Verify UserService.findById for id -947.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUserLookup0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0054 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-947);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-947);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0054 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USLOOKP1_5500
     * @tc.name      testUserLookup0055
     * @tc.desc      Verify UserService.findById for id -946.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUserLookup0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0055 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-946);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-946);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0055 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USLOOKP1_5600
     * @tc.name      testUserLookup0056
     * @tc.desc      Verify UserService.findById for id -945.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUserLookup0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0056 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-945);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-945);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0056 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USLOOKP1_5700
     * @tc.name      testUserLookup0057
     * @tc.desc      Verify UserService.findById for id -944.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUserLookup0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0057 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-944);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-944);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0057 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USLOOKP1_5800
     * @tc.name      testUserLookup0058
     * @tc.desc      Verify UserService.findById for id -943.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUserLookup0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0058 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-943);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-943);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0058 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USLOOKP1_5900
     * @tc.name      testUserLookup0059
     * @tc.desc      Verify UserService.findById for id -942.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUserLookup0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0059 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-942);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-942);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0059 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USLOOKP1_6000
     * @tc.name      testUserLookup0060
     * @tc.desc      Verify UserService.findById for id -941.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUserLookup0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0060 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-941);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-941);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0060 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USLOOKP1_6100
     * @tc.name      testUserLookup0061
     * @tc.desc      Verify UserService.findById for id -940.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUserLookup0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0061 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-940);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-940);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0061 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USLOOKP1_6200
     * @tc.name      testUserLookup0062
     * @tc.desc      Verify UserService.findById for id -939.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUserLookup0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0062 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-939);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-939);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0062 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USLOOKP1_6300
     * @tc.name      testUserLookup0063
     * @tc.desc      Verify UserService.findById for id -938.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUserLookup0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0063 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-938);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-938);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0063 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USLOOKP1_6400
     * @tc.name      testUserLookup0064
     * @tc.desc      Verify UserService.findById for id -937.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUserLookup0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0064 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-937);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-937);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0064 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USLOOKP1_6500
     * @tc.name      testUserLookup0065
     * @tc.desc      Verify UserService.findById for id -936.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUserLookup0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0065 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-936);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-936);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0065 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USLOOKP1_6600
     * @tc.name      testUserLookup0066
     * @tc.desc      Verify UserService.findById for id -935.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUserLookup0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0066 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-935);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-935);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0066 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USLOOKP1_6700
     * @tc.name      testUserLookup0067
     * @tc.desc      Verify UserService.findById for id -934.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUserLookup0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0067 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-934);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-934);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0067 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USLOOKP1_6800
     * @tc.name      testUserLookup0068
     * @tc.desc      Verify UserService.findById for id -933.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUserLookup0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0068 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-933);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-933);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0068 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USLOOKP1_6900
     * @tc.name      testUserLookup0069
     * @tc.desc      Verify UserService.findById for id -932.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUserLookup0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0069 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-932);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-932);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0069 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USLOOKP1_7000
     * @tc.name      testUserLookup0070
     * @tc.desc      Verify UserService.findById for id -931.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUserLookup0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0070 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-931);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-931);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0070 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USLOOKP1_7100
     * @tc.name      testUserLookup0071
     * @tc.desc      Verify UserService.findById for id -930.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUserLookup0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0071 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-930);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-930);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0071 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USLOOKP1_7200
     * @tc.name      testUserLookup0072
     * @tc.desc      Verify UserService.findById for id -929.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUserLookup0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0072 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-929);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-929);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0072 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USLOOKP1_7300
     * @tc.name      testUserLookup0073
     * @tc.desc      Verify UserService.findById for id -928.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUserLookup0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0073 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-928);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-928);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0073 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USLOOKP1_7400
     * @tc.name      testUserLookup0074
     * @tc.desc      Verify UserService.findById for id -927.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUserLookup0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0074 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-927);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-927);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0074 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_USLOOKP1_7500
     * @tc.name      testUserLookup0075
     * @tc.desc      Verify UserService.findById for id -926.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testUserLookup0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0075 begin');
      const service: UserService = new UserService();
      const result: User | null = service.findById(-926);
      expect(result === null).assertEqual(true);
      if (result !== null) {
        expect((result as User).id).assertEqual(-926);
        expect((result as User).name).assertEqual('Alice');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserLookup0075 end');
    })

  })
}
