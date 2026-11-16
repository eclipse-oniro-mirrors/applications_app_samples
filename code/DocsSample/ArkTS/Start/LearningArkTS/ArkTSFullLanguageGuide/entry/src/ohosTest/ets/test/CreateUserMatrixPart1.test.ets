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
import { createUser } from '../../../main/ets/common/User';
import { User } from '../../../main/ets/common/User';

const DOMAIN: number = 0xF815;
const TAG: string = '[Sample_ARKTS_GUIDE_EXT]';

export default function CreateUserMatrixPart1Test(): void {
  describe('CreateUserMatrixPart1', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 20);
      });
    })


    /**
     * @tc.number    SUB_ARKTS_GUIDE_CREATEUSERP1_0100
     * @tc.name      testCreateUser0001
     * @tc.desc      Verify createUser keeps id 5000 and name user_name_0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCreateUser0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0001 begin');
      const user: User = createUser(5000, 'user_name_0');
      expect(user.id).assertEqual(5000);
      expect(user.name).assertEqual('user_name_0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0001 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_CREATEUSERP1_0200
     * @tc.name      testCreateUser0002
     * @tc.desc      Verify createUser keeps id 5001 and name user_name_1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCreateUser0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0002 begin');
      const user: User = createUser(5001, 'user_name_1');
      expect(user.id).assertEqual(5001);
      expect(user.name).assertEqual('user_name_1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0002 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_CREATEUSERP1_0300
     * @tc.name      testCreateUser0003
     * @tc.desc      Verify createUser keeps id 5002 and name user_name_2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCreateUser0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0003 begin');
      const user: User = createUser(5002, 'user_name_2');
      expect(user.id).assertEqual(5002);
      expect(user.name).assertEqual('user_name_2');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0003 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_CREATEUSERP1_0400
     * @tc.name      testCreateUser0004
     * @tc.desc      Verify createUser keeps id 5003 and name user_name_3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCreateUser0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0004 begin');
      const user: User = createUser(5003, 'user_name_3');
      expect(user.id).assertEqual(5003);
      expect(user.name).assertEqual('user_name_3');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0004 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_CREATEUSERP1_0500
     * @tc.name      testCreateUser0005
     * @tc.desc      Verify createUser keeps id 5004 and name user_name_4.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCreateUser0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0005 begin');
      const user: User = createUser(5004, 'user_name_4');
      expect(user.id).assertEqual(5004);
      expect(user.name).assertEqual('user_name_4');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0005 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_CREATEUSERP1_0600
     * @tc.name      testCreateUser0006
     * @tc.desc      Verify createUser keeps id 5005 and name user_name_5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCreateUser0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0006 begin');
      const user: User = createUser(5005, 'user_name_5');
      expect(user.id).assertEqual(5005);
      expect(user.name).assertEqual('user_name_5');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0006 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_CREATEUSERP1_0700
     * @tc.name      testCreateUser0007
     * @tc.desc      Verify createUser keeps id 5006 and name user_name_6.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCreateUser0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0007 begin');
      const user: User = createUser(5006, 'user_name_6');
      expect(user.id).assertEqual(5006);
      expect(user.name).assertEqual('user_name_6');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0007 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_CREATEUSERP1_0800
     * @tc.name      testCreateUser0008
     * @tc.desc      Verify createUser keeps id 5007 and name user_name_7.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCreateUser0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0008 begin');
      const user: User = createUser(5007, 'user_name_7');
      expect(user.id).assertEqual(5007);
      expect(user.name).assertEqual('user_name_7');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0008 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_CREATEUSERP1_0900
     * @tc.name      testCreateUser0009
     * @tc.desc      Verify createUser keeps id 5008 and name user_name_8.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCreateUser0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0009 begin');
      const user: User = createUser(5008, 'user_name_8');
      expect(user.id).assertEqual(5008);
      expect(user.name).assertEqual('user_name_8');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0009 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_CREATEUSERP1_1000
     * @tc.name      testCreateUser0010
     * @tc.desc      Verify createUser keeps id 5009 and name user_name_9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCreateUser0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0010 begin');
      const user: User = createUser(5009, 'user_name_9');
      expect(user.id).assertEqual(5009);
      expect(user.name).assertEqual('user_name_9');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0010 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_CREATEUSERP1_1100
     * @tc.name      testCreateUser0011
     * @tc.desc      Verify createUser keeps id 5010 and name user_name_10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCreateUser0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0011 begin');
      const user: User = createUser(5010, 'user_name_10');
      expect(user.id).assertEqual(5010);
      expect(user.name).assertEqual('user_name_10');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0011 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_CREATEUSERP1_1200
     * @tc.name      testCreateUser0012
     * @tc.desc      Verify createUser keeps id 5011 and name user_name_11.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCreateUser0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0012 begin');
      const user: User = createUser(5011, 'user_name_11');
      expect(user.id).assertEqual(5011);
      expect(user.name).assertEqual('user_name_11');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0012 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_CREATEUSERP1_1300
     * @tc.name      testCreateUser0013
     * @tc.desc      Verify createUser keeps id 5012 and name user_name_12.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCreateUser0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0013 begin');
      const user: User = createUser(5012, 'user_name_12');
      expect(user.id).assertEqual(5012);
      expect(user.name).assertEqual('user_name_12');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0013 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_CREATEUSERP1_1400
     * @tc.name      testCreateUser0014
     * @tc.desc      Verify createUser keeps id 5013 and name user_name_13.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCreateUser0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0014 begin');
      const user: User = createUser(5013, 'user_name_13');
      expect(user.id).assertEqual(5013);
      expect(user.name).assertEqual('user_name_13');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0014 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_CREATEUSERP1_1500
     * @tc.name      testCreateUser0015
     * @tc.desc      Verify createUser keeps id 5014 and name user_name_14.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCreateUser0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0015 begin');
      const user: User = createUser(5014, 'user_name_14');
      expect(user.id).assertEqual(5014);
      expect(user.name).assertEqual('user_name_14');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0015 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_CREATEUSERP1_1600
     * @tc.name      testCreateUser0016
     * @tc.desc      Verify createUser keeps id 5015 and name user_name_15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCreateUser0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0016 begin');
      const user: User = createUser(5015, 'user_name_15');
      expect(user.id).assertEqual(5015);
      expect(user.name).assertEqual('user_name_15');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0016 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_CREATEUSERP1_1700
     * @tc.name      testCreateUser0017
     * @tc.desc      Verify createUser keeps id 5016 and name user_name_16.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCreateUser0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0017 begin');
      const user: User = createUser(5016, 'user_name_16');
      expect(user.id).assertEqual(5016);
      expect(user.name).assertEqual('user_name_16');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0017 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_CREATEUSERP1_1800
     * @tc.name      testCreateUser0018
     * @tc.desc      Verify createUser keeps id 5017 and name user_name_17.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCreateUser0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0018 begin');
      const user: User = createUser(5017, 'user_name_17');
      expect(user.id).assertEqual(5017);
      expect(user.name).assertEqual('user_name_17');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0018 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_CREATEUSERP1_1900
     * @tc.name      testCreateUser0019
     * @tc.desc      Verify createUser keeps id 5018 and name user_name_18.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCreateUser0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0019 begin');
      const user: User = createUser(5018, 'user_name_18');
      expect(user.id).assertEqual(5018);
      expect(user.name).assertEqual('user_name_18');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0019 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_CREATEUSERP1_2000
     * @tc.name      testCreateUser0020
     * @tc.desc      Verify createUser keeps id 5019 and name user_name_19.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCreateUser0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0020 begin');
      const user: User = createUser(5019, 'user_name_19');
      expect(user.id).assertEqual(5019);
      expect(user.name).assertEqual('user_name_19');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0020 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_CREATEUSERP1_2100
     * @tc.name      testCreateUser0021
     * @tc.desc      Verify createUser keeps id 5020 and name user_name_20.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCreateUser0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0021 begin');
      const user: User = createUser(5020, 'user_name_20');
      expect(user.id).assertEqual(5020);
      expect(user.name).assertEqual('user_name_20');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0021 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_CREATEUSERP1_2200
     * @tc.name      testCreateUser0022
     * @tc.desc      Verify createUser keeps id 5021 and name user_name_21.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCreateUser0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0022 begin');
      const user: User = createUser(5021, 'user_name_21');
      expect(user.id).assertEqual(5021);
      expect(user.name).assertEqual('user_name_21');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0022 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_CREATEUSERP1_2300
     * @tc.name      testCreateUser0023
     * @tc.desc      Verify createUser keeps id 5022 and name user_name_22.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCreateUser0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0023 begin');
      const user: User = createUser(5022, 'user_name_22');
      expect(user.id).assertEqual(5022);
      expect(user.name).assertEqual('user_name_22');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0023 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_CREATEUSERP1_2400
     * @tc.name      testCreateUser0024
     * @tc.desc      Verify createUser keeps id 5023 and name user_name_23.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCreateUser0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0024 begin');
      const user: User = createUser(5023, 'user_name_23');
      expect(user.id).assertEqual(5023);
      expect(user.name).assertEqual('user_name_23');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0024 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_CREATEUSERP1_2500
     * @tc.name      testCreateUser0025
     * @tc.desc      Verify createUser keeps id 5024 and name user_name_24.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCreateUser0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0025 begin');
      const user: User = createUser(5024, 'user_name_24');
      expect(user.id).assertEqual(5024);
      expect(user.name).assertEqual('user_name_24');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0025 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_CREATEUSERP1_2600
     * @tc.name      testCreateUser0026
     * @tc.desc      Verify createUser keeps id 5025 and name user_name_25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCreateUser0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0026 begin');
      const user: User = createUser(5025, 'user_name_25');
      expect(user.id).assertEqual(5025);
      expect(user.name).assertEqual('user_name_25');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0026 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_CREATEUSERP1_2700
     * @tc.name      testCreateUser0027
     * @tc.desc      Verify createUser keeps id 5026 and name user_name_26.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCreateUser0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0027 begin');
      const user: User = createUser(5026, 'user_name_26');
      expect(user.id).assertEqual(5026);
      expect(user.name).assertEqual('user_name_26');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0027 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_CREATEUSERP1_2800
     * @tc.name      testCreateUser0028
     * @tc.desc      Verify createUser keeps id 5027 and name user_name_27.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCreateUser0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0028 begin');
      const user: User = createUser(5027, 'user_name_27');
      expect(user.id).assertEqual(5027);
      expect(user.name).assertEqual('user_name_27');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0028 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_CREATEUSERP1_2900
     * @tc.name      testCreateUser0029
     * @tc.desc      Verify createUser keeps id 5028 and name user_name_28.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCreateUser0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0029 begin');
      const user: User = createUser(5028, 'user_name_28');
      expect(user.id).assertEqual(5028);
      expect(user.name).assertEqual('user_name_28');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0029 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_CREATEUSERP1_3000
     * @tc.name      testCreateUser0030
     * @tc.desc      Verify createUser keeps id 5029 and name user_name_29.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCreateUser0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0030 begin');
      const user: User = createUser(5029, 'user_name_29');
      expect(user.id).assertEqual(5029);
      expect(user.name).assertEqual('user_name_29');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0030 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_CREATEUSERP1_3100
     * @tc.name      testCreateUser0031
     * @tc.desc      Verify createUser keeps id 5030 and name user_name_30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCreateUser0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0031 begin');
      const user: User = createUser(5030, 'user_name_30');
      expect(user.id).assertEqual(5030);
      expect(user.name).assertEqual('user_name_30');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0031 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_CREATEUSERP1_3200
     * @tc.name      testCreateUser0032
     * @tc.desc      Verify createUser keeps id 5031 and name user_name_31.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCreateUser0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0032 begin');
      const user: User = createUser(5031, 'user_name_31');
      expect(user.id).assertEqual(5031);
      expect(user.name).assertEqual('user_name_31');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0032 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_CREATEUSERP1_3300
     * @tc.name      testCreateUser0033
     * @tc.desc      Verify createUser keeps id 5032 and name user_name_32.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCreateUser0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0033 begin');
      const user: User = createUser(5032, 'user_name_32');
      expect(user.id).assertEqual(5032);
      expect(user.name).assertEqual('user_name_32');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0033 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_CREATEUSERP1_3400
     * @tc.name      testCreateUser0034
     * @tc.desc      Verify createUser keeps id 5033 and name user_name_33.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCreateUser0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0034 begin');
      const user: User = createUser(5033, 'user_name_33');
      expect(user.id).assertEqual(5033);
      expect(user.name).assertEqual('user_name_33');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0034 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_CREATEUSERP1_3500
     * @tc.name      testCreateUser0035
     * @tc.desc      Verify createUser keeps id 5034 and name user_name_34.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCreateUser0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0035 begin');
      const user: User = createUser(5034, 'user_name_34');
      expect(user.id).assertEqual(5034);
      expect(user.name).assertEqual('user_name_34');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0035 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_CREATEUSERP1_3600
     * @tc.name      testCreateUser0036
     * @tc.desc      Verify createUser keeps id 5035 and name user_name_35.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCreateUser0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0036 begin');
      const user: User = createUser(5035, 'user_name_35');
      expect(user.id).assertEqual(5035);
      expect(user.name).assertEqual('user_name_35');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0036 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_CREATEUSERP1_3700
     * @tc.name      testCreateUser0037
     * @tc.desc      Verify createUser keeps id 5036 and name user_name_36.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCreateUser0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0037 begin');
      const user: User = createUser(5036, 'user_name_36');
      expect(user.id).assertEqual(5036);
      expect(user.name).assertEqual('user_name_36');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0037 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_CREATEUSERP1_3800
     * @tc.name      testCreateUser0038
     * @tc.desc      Verify createUser keeps id 5037 and name user_name_37.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCreateUser0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0038 begin');
      const user: User = createUser(5037, 'user_name_37');
      expect(user.id).assertEqual(5037);
      expect(user.name).assertEqual('user_name_37');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0038 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_CREATEUSERP1_3900
     * @tc.name      testCreateUser0039
     * @tc.desc      Verify createUser keeps id 5038 and name user_name_38.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCreateUser0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0039 begin');
      const user: User = createUser(5038, 'user_name_38');
      expect(user.id).assertEqual(5038);
      expect(user.name).assertEqual('user_name_38');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0039 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_CREATEUSERP1_4000
     * @tc.name      testCreateUser0040
     * @tc.desc      Verify createUser keeps id 5039 and name user_name_39.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCreateUser0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0040 begin');
      const user: User = createUser(5039, 'user_name_39');
      expect(user.id).assertEqual(5039);
      expect(user.name).assertEqual('user_name_39');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0040 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_CREATEUSERP1_4100
     * @tc.name      testCreateUser0041
     * @tc.desc      Verify createUser keeps id 5040 and name user_name_40.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCreateUser0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0041 begin');
      const user: User = createUser(5040, 'user_name_40');
      expect(user.id).assertEqual(5040);
      expect(user.name).assertEqual('user_name_40');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0041 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_CREATEUSERP1_4200
     * @tc.name      testCreateUser0042
     * @tc.desc      Verify createUser keeps id 5041 and name user_name_41.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCreateUser0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0042 begin');
      const user: User = createUser(5041, 'user_name_41');
      expect(user.id).assertEqual(5041);
      expect(user.name).assertEqual('user_name_41');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0042 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_CREATEUSERP1_4300
     * @tc.name      testCreateUser0043
     * @tc.desc      Verify createUser keeps id 5042 and name user_name_42.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCreateUser0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0043 begin');
      const user: User = createUser(5042, 'user_name_42');
      expect(user.id).assertEqual(5042);
      expect(user.name).assertEqual('user_name_42');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0043 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_CREATEUSERP1_4400
     * @tc.name      testCreateUser0044
     * @tc.desc      Verify createUser keeps id 5043 and name user_name_43.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCreateUser0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0044 begin');
      const user: User = createUser(5043, 'user_name_43');
      expect(user.id).assertEqual(5043);
      expect(user.name).assertEqual('user_name_43');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0044 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_CREATEUSERP1_4500
     * @tc.name      testCreateUser0045
     * @tc.desc      Verify createUser keeps id 5044 and name user_name_44.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCreateUser0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0045 begin');
      const user: User = createUser(5044, 'user_name_44');
      expect(user.id).assertEqual(5044);
      expect(user.name).assertEqual('user_name_44');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0045 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_CREATEUSERP1_4600
     * @tc.name      testCreateUser0046
     * @tc.desc      Verify createUser keeps id 5045 and name user_name_45.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCreateUser0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0046 begin');
      const user: User = createUser(5045, 'user_name_45');
      expect(user.id).assertEqual(5045);
      expect(user.name).assertEqual('user_name_45');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0046 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_CREATEUSERP1_4700
     * @tc.name      testCreateUser0047
     * @tc.desc      Verify createUser keeps id 5046 and name user_name_46.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCreateUser0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0047 begin');
      const user: User = createUser(5046, 'user_name_46');
      expect(user.id).assertEqual(5046);
      expect(user.name).assertEqual('user_name_46');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0047 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_CREATEUSERP1_4800
     * @tc.name      testCreateUser0048
     * @tc.desc      Verify createUser keeps id 5047 and name user_name_47.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCreateUser0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0048 begin');
      const user: User = createUser(5047, 'user_name_47');
      expect(user.id).assertEqual(5047);
      expect(user.name).assertEqual('user_name_47');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0048 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_CREATEUSERP1_4900
     * @tc.name      testCreateUser0049
     * @tc.desc      Verify createUser keeps id 5048 and name user_name_48.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCreateUser0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0049 begin');
      const user: User = createUser(5048, 'user_name_48');
      expect(user.id).assertEqual(5048);
      expect(user.name).assertEqual('user_name_48');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0049 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_CREATEUSERP1_5000
     * @tc.name      testCreateUser0050
     * @tc.desc      Verify createUser keeps id 5049 and name user_name_49.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCreateUser0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0050 begin');
      const user: User = createUser(5049, 'user_name_49');
      expect(user.id).assertEqual(5049);
      expect(user.name).assertEqual('user_name_49');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0050 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_CREATEUSERP1_5100
     * @tc.name      testCreateUser0051
     * @tc.desc      Verify createUser keeps id 5050 and name user_name_50.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCreateUser0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0051 begin');
      const user: User = createUser(5050, 'user_name_50');
      expect(user.id).assertEqual(5050);
      expect(user.name).assertEqual('user_name_50');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0051 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_CREATEUSERP1_5200
     * @tc.name      testCreateUser0052
     * @tc.desc      Verify createUser keeps id 5051 and name user_name_51.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCreateUser0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0052 begin');
      const user: User = createUser(5051, 'user_name_51');
      expect(user.id).assertEqual(5051);
      expect(user.name).assertEqual('user_name_51');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0052 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_CREATEUSERP1_5300
     * @tc.name      testCreateUser0053
     * @tc.desc      Verify createUser keeps id 5052 and name user_name_52.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCreateUser0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0053 begin');
      const user: User = createUser(5052, 'user_name_52');
      expect(user.id).assertEqual(5052);
      expect(user.name).assertEqual('user_name_52');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0053 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_CREATEUSERP1_5400
     * @tc.name      testCreateUser0054
     * @tc.desc      Verify createUser keeps id 5053 and name user_name_53.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCreateUser0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0054 begin');
      const user: User = createUser(5053, 'user_name_53');
      expect(user.id).assertEqual(5053);
      expect(user.name).assertEqual('user_name_53');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0054 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_CREATEUSERP1_5500
     * @tc.name      testCreateUser0055
     * @tc.desc      Verify createUser keeps id 5054 and name user_name_54.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCreateUser0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0055 begin');
      const user: User = createUser(5054, 'user_name_54');
      expect(user.id).assertEqual(5054);
      expect(user.name).assertEqual('user_name_54');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0055 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_CREATEUSERP1_5600
     * @tc.name      testCreateUser0056
     * @tc.desc      Verify createUser keeps id 5055 and name user_name_55.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCreateUser0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0056 begin');
      const user: User = createUser(5055, 'user_name_55');
      expect(user.id).assertEqual(5055);
      expect(user.name).assertEqual('user_name_55');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0056 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_CREATEUSERP1_5700
     * @tc.name      testCreateUser0057
     * @tc.desc      Verify createUser keeps id 5056 and name user_name_56.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCreateUser0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0057 begin');
      const user: User = createUser(5056, 'user_name_56');
      expect(user.id).assertEqual(5056);
      expect(user.name).assertEqual('user_name_56');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0057 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_CREATEUSERP1_5800
     * @tc.name      testCreateUser0058
     * @tc.desc      Verify createUser keeps id 5057 and name user_name_57.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCreateUser0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0058 begin');
      const user: User = createUser(5057, 'user_name_57');
      expect(user.id).assertEqual(5057);
      expect(user.name).assertEqual('user_name_57');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0058 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_CREATEUSERP1_5900
     * @tc.name      testCreateUser0059
     * @tc.desc      Verify createUser keeps id 5058 and name user_name_58.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCreateUser0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0059 begin');
      const user: User = createUser(5058, 'user_name_58');
      expect(user.id).assertEqual(5058);
      expect(user.name).assertEqual('user_name_58');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0059 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_CREATEUSERP1_6000
     * @tc.name      testCreateUser0060
     * @tc.desc      Verify createUser keeps id 5059 and name user_name_59.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCreateUser0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0060 begin');
      const user: User = createUser(5059, 'user_name_59');
      expect(user.id).assertEqual(5059);
      expect(user.name).assertEqual('user_name_59');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0060 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_CREATEUSERP1_6100
     * @tc.name      testCreateUser0061
     * @tc.desc      Verify createUser keeps id 5060 and name user_name_60.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCreateUser0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0061 begin');
      const user: User = createUser(5060, 'user_name_60');
      expect(user.id).assertEqual(5060);
      expect(user.name).assertEqual('user_name_60');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0061 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_CREATEUSERP1_6200
     * @tc.name      testCreateUser0062
     * @tc.desc      Verify createUser keeps id 5061 and name user_name_61.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCreateUser0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0062 begin');
      const user: User = createUser(5061, 'user_name_61');
      expect(user.id).assertEqual(5061);
      expect(user.name).assertEqual('user_name_61');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0062 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_CREATEUSERP1_6300
     * @tc.name      testCreateUser0063
     * @tc.desc      Verify createUser keeps id 5062 and name user_name_62.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCreateUser0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0063 begin');
      const user: User = createUser(5062, 'user_name_62');
      expect(user.id).assertEqual(5062);
      expect(user.name).assertEqual('user_name_62');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0063 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_CREATEUSERP1_6400
     * @tc.name      testCreateUser0064
     * @tc.desc      Verify createUser keeps id 5063 and name user_name_63.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCreateUser0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0064 begin');
      const user: User = createUser(5063, 'user_name_63');
      expect(user.id).assertEqual(5063);
      expect(user.name).assertEqual('user_name_63');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0064 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_CREATEUSERP1_6500
     * @tc.name      testCreateUser0065
     * @tc.desc      Verify createUser keeps id 5064 and name user_name_64.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCreateUser0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0065 begin');
      const user: User = createUser(5064, 'user_name_64');
      expect(user.id).assertEqual(5064);
      expect(user.name).assertEqual('user_name_64');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0065 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_CREATEUSERP1_6600
     * @tc.name      testCreateUser0066
     * @tc.desc      Verify createUser keeps id 5065 and name user_name_65.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCreateUser0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0066 begin');
      const user: User = createUser(5065, 'user_name_65');
      expect(user.id).assertEqual(5065);
      expect(user.name).assertEqual('user_name_65');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0066 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_CREATEUSERP1_6700
     * @tc.name      testCreateUser0067
     * @tc.desc      Verify createUser keeps id 5066 and name user_name_66.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCreateUser0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0067 begin');
      const user: User = createUser(5066, 'user_name_66');
      expect(user.id).assertEqual(5066);
      expect(user.name).assertEqual('user_name_66');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0067 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_CREATEUSERP1_6800
     * @tc.name      testCreateUser0068
     * @tc.desc      Verify createUser keeps id 5067 and name user_name_67.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCreateUser0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0068 begin');
      const user: User = createUser(5067, 'user_name_67');
      expect(user.id).assertEqual(5067);
      expect(user.name).assertEqual('user_name_67');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0068 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_CREATEUSERP1_6900
     * @tc.name      testCreateUser0069
     * @tc.desc      Verify createUser keeps id 5068 and name user_name_68.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCreateUser0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0069 begin');
      const user: User = createUser(5068, 'user_name_68');
      expect(user.id).assertEqual(5068);
      expect(user.name).assertEqual('user_name_68');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0069 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_CREATEUSERP1_7000
     * @tc.name      testCreateUser0070
     * @tc.desc      Verify createUser keeps id 5069 and name user_name_69.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCreateUser0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0070 begin');
      const user: User = createUser(5069, 'user_name_69');
      expect(user.id).assertEqual(5069);
      expect(user.name).assertEqual('user_name_69');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0070 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_CREATEUSERP1_7100
     * @tc.name      testCreateUser0071
     * @tc.desc      Verify createUser keeps id 5070 and name user_name_70.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCreateUser0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0071 begin');
      const user: User = createUser(5070, 'user_name_70');
      expect(user.id).assertEqual(5070);
      expect(user.name).assertEqual('user_name_70');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0071 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_CREATEUSERP1_7200
     * @tc.name      testCreateUser0072
     * @tc.desc      Verify createUser keeps id 5071 and name user_name_71.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCreateUser0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0072 begin');
      const user: User = createUser(5071, 'user_name_71');
      expect(user.id).assertEqual(5071);
      expect(user.name).assertEqual('user_name_71');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0072 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_CREATEUSERP1_7300
     * @tc.name      testCreateUser0073
     * @tc.desc      Verify createUser keeps id 5072 and name user_name_72.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCreateUser0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0073 begin');
      const user: User = createUser(5072, 'user_name_72');
      expect(user.id).assertEqual(5072);
      expect(user.name).assertEqual('user_name_72');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0073 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_CREATEUSERP1_7400
     * @tc.name      testCreateUser0074
     * @tc.desc      Verify createUser keeps id 5073 and name user_name_73.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCreateUser0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0074 begin');
      const user: User = createUser(5073, 'user_name_73');
      expect(user.id).assertEqual(5073);
      expect(user.name).assertEqual('user_name_73');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0074 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_CREATEUSERP1_7500
     * @tc.name      testCreateUser0075
     * @tc.desc      Verify createUser keeps id 5074 and name user_name_74.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCreateUser0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0075 begin');
      const user: User = createUser(5074, 'user_name_74');
      expect(user.id).assertEqual(5074);
      expect(user.name).assertEqual('user_name_74');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0075 end');
    })

  })
}
