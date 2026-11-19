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

export default function CreateUserMatrixPart2Test(): void {
  describe('CreateUserMatrixPart2', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 20);
      });
    })


    /**
     * @tc.number    SUB_ARKTS_GUIDE_CREATEUSERP2_7600
     * @tc.name      testCreateUser0076
     * @tc.desc      Verify createUser keeps id 5075 and name user_name_75.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCreateUser0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0076 begin');
      const user: User = createUser(5075, 'user_name_75');
      expect(user.id).assertEqual(5075);
      expect(user.name).assertEqual('user_name_75');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0076 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_CREATEUSERP2_7700
     * @tc.name      testCreateUser0077
     * @tc.desc      Verify createUser keeps id 5076 and name user_name_76.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCreateUser0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0077 begin');
      const user: User = createUser(5076, 'user_name_76');
      expect(user.id).assertEqual(5076);
      expect(user.name).assertEqual('user_name_76');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0077 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_CREATEUSERP2_7800
     * @tc.name      testCreateUser0078
     * @tc.desc      Verify createUser keeps id 5077 and name user_name_77.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCreateUser0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0078 begin');
      const user: User = createUser(5077, 'user_name_77');
      expect(user.id).assertEqual(5077);
      expect(user.name).assertEqual('user_name_77');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0078 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_CREATEUSERP2_7900
     * @tc.name      testCreateUser0079
     * @tc.desc      Verify createUser keeps id 5078 and name user_name_78.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCreateUser0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0079 begin');
      const user: User = createUser(5078, 'user_name_78');
      expect(user.id).assertEqual(5078);
      expect(user.name).assertEqual('user_name_78');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0079 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_CREATEUSERP2_8000
     * @tc.name      testCreateUser0080
     * @tc.desc      Verify createUser keeps id 5079 and name user_name_79.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCreateUser0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0080 begin');
      const user: User = createUser(5079, 'user_name_79');
      expect(user.id).assertEqual(5079);
      expect(user.name).assertEqual('user_name_79');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0080 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_CREATEUSERP2_8100
     * @tc.name      testCreateUser0081
     * @tc.desc      Verify createUser keeps id 5080 and name user_name_80.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCreateUser0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0081 begin');
      const user: User = createUser(5080, 'user_name_80');
      expect(user.id).assertEqual(5080);
      expect(user.name).assertEqual('user_name_80');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0081 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_CREATEUSERP2_8200
     * @tc.name      testCreateUser0082
     * @tc.desc      Verify createUser keeps id 5081 and name user_name_81.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCreateUser0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0082 begin');
      const user: User = createUser(5081, 'user_name_81');
      expect(user.id).assertEqual(5081);
      expect(user.name).assertEqual('user_name_81');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0082 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_CREATEUSERP2_8300
     * @tc.name      testCreateUser0083
     * @tc.desc      Verify createUser keeps id 5082 and name user_name_82.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCreateUser0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0083 begin');
      const user: User = createUser(5082, 'user_name_82');
      expect(user.id).assertEqual(5082);
      expect(user.name).assertEqual('user_name_82');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0083 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_CREATEUSERP2_8400
     * @tc.name      testCreateUser0084
     * @tc.desc      Verify createUser keeps id 5083 and name user_name_83.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCreateUser0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0084 begin');
      const user: User = createUser(5083, 'user_name_83');
      expect(user.id).assertEqual(5083);
      expect(user.name).assertEqual('user_name_83');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0084 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_CREATEUSERP2_8500
     * @tc.name      testCreateUser0085
     * @tc.desc      Verify createUser keeps id 5084 and name user_name_84.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCreateUser0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0085 begin');
      const user: User = createUser(5084, 'user_name_84');
      expect(user.id).assertEqual(5084);
      expect(user.name).assertEqual('user_name_84');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0085 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_CREATEUSERP2_8600
     * @tc.name      testCreateUser0086
     * @tc.desc      Verify createUser keeps id 5085 and name user_name_85.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCreateUser0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0086 begin');
      const user: User = createUser(5085, 'user_name_85');
      expect(user.id).assertEqual(5085);
      expect(user.name).assertEqual('user_name_85');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0086 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_CREATEUSERP2_8700
     * @tc.name      testCreateUser0087
     * @tc.desc      Verify createUser keeps id 5086 and name user_name_86.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCreateUser0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0087 begin');
      const user: User = createUser(5086, 'user_name_86');
      expect(user.id).assertEqual(5086);
      expect(user.name).assertEqual('user_name_86');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0087 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_CREATEUSERP2_8800
     * @tc.name      testCreateUser0088
     * @tc.desc      Verify createUser keeps id 5087 and name user_name_87.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCreateUser0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0088 begin');
      const user: User = createUser(5087, 'user_name_87');
      expect(user.id).assertEqual(5087);
      expect(user.name).assertEqual('user_name_87');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0088 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_CREATEUSERP2_8900
     * @tc.name      testCreateUser0089
     * @tc.desc      Verify createUser keeps id 5088 and name user_name_88.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCreateUser0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0089 begin');
      const user: User = createUser(5088, 'user_name_88');
      expect(user.id).assertEqual(5088);
      expect(user.name).assertEqual('user_name_88');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0089 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_CREATEUSERP2_9000
     * @tc.name      testCreateUser0090
     * @tc.desc      Verify createUser keeps id 5089 and name user_name_89.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCreateUser0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0090 begin');
      const user: User = createUser(5089, 'user_name_89');
      expect(user.id).assertEqual(5089);
      expect(user.name).assertEqual('user_name_89');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0090 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_CREATEUSERP2_9100
     * @tc.name      testCreateUser0091
     * @tc.desc      Verify createUser keeps id 5090 and name user_name_90.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCreateUser0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0091 begin');
      const user: User = createUser(5090, 'user_name_90');
      expect(user.id).assertEqual(5090);
      expect(user.name).assertEqual('user_name_90');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0091 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_CREATEUSERP2_9200
     * @tc.name      testCreateUser0092
     * @tc.desc      Verify createUser keeps id 5091 and name user_name_91.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCreateUser0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0092 begin');
      const user: User = createUser(5091, 'user_name_91');
      expect(user.id).assertEqual(5091);
      expect(user.name).assertEqual('user_name_91');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0092 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_CREATEUSERP2_9300
     * @tc.name      testCreateUser0093
     * @tc.desc      Verify createUser keeps id 5092 and name user_name_92.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCreateUser0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0093 begin');
      const user: User = createUser(5092, 'user_name_92');
      expect(user.id).assertEqual(5092);
      expect(user.name).assertEqual('user_name_92');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0093 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_CREATEUSERP2_9400
     * @tc.name      testCreateUser0094
     * @tc.desc      Verify createUser keeps id 5093 and name user_name_93.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCreateUser0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0094 begin');
      const user: User = createUser(5093, 'user_name_93');
      expect(user.id).assertEqual(5093);
      expect(user.name).assertEqual('user_name_93');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0094 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_CREATEUSERP2_9500
     * @tc.name      testCreateUser0095
     * @tc.desc      Verify createUser keeps id 5094 and name user_name_94.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCreateUser0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0095 begin');
      const user: User = createUser(5094, 'user_name_94');
      expect(user.id).assertEqual(5094);
      expect(user.name).assertEqual('user_name_94');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0095 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_CREATEUSERP2_9600
     * @tc.name      testCreateUser0096
     * @tc.desc      Verify createUser keeps id 5095 and name user_name_95.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCreateUser0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0096 begin');
      const user: User = createUser(5095, 'user_name_95');
      expect(user.id).assertEqual(5095);
      expect(user.name).assertEqual('user_name_95');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0096 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_CREATEUSERP2_9700
     * @tc.name      testCreateUser0097
     * @tc.desc      Verify createUser keeps id 5096 and name user_name_96.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCreateUser0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0097 begin');
      const user: User = createUser(5096, 'user_name_96');
      expect(user.id).assertEqual(5096);
      expect(user.name).assertEqual('user_name_96');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0097 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_CREATEUSERP2_9800
     * @tc.name      testCreateUser0098
     * @tc.desc      Verify createUser keeps id 5097 and name user_name_97.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCreateUser0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0098 begin');
      const user: User = createUser(5097, 'user_name_97');
      expect(user.id).assertEqual(5097);
      expect(user.name).assertEqual('user_name_97');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0098 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_CREATEUSERP2_9900
     * @tc.name      testCreateUser0099
     * @tc.desc      Verify createUser keeps id 5098 and name user_name_98.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCreateUser0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0099 begin');
      const user: User = createUser(5098, 'user_name_98');
      expect(user.id).assertEqual(5098);
      expect(user.name).assertEqual('user_name_98');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0099 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_CREATEUSERP2_10000
     * @tc.name      testCreateUser0100
     * @tc.desc      Verify createUser keeps id 5099 and name user_name_99.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCreateUser0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0100 begin');
      const user: User = createUser(5099, 'user_name_99');
      expect(user.id).assertEqual(5099);
      expect(user.name).assertEqual('user_name_99');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0100 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_CREATEUSERP2_10100
     * @tc.name      testCreateUser0101
     * @tc.desc      Verify createUser keeps id 5100 and name user_name_100.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCreateUser0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0101 begin');
      const user: User = createUser(5100, 'user_name_100');
      expect(user.id).assertEqual(5100);
      expect(user.name).assertEqual('user_name_100');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0101 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_CREATEUSERP2_10200
     * @tc.name      testCreateUser0102
     * @tc.desc      Verify createUser keeps id 5101 and name user_name_101.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCreateUser0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0102 begin');
      const user: User = createUser(5101, 'user_name_101');
      expect(user.id).assertEqual(5101);
      expect(user.name).assertEqual('user_name_101');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0102 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_CREATEUSERP2_10300
     * @tc.name      testCreateUser0103
     * @tc.desc      Verify createUser keeps id 5102 and name user_name_102.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCreateUser0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0103 begin');
      const user: User = createUser(5102, 'user_name_102');
      expect(user.id).assertEqual(5102);
      expect(user.name).assertEqual('user_name_102');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0103 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_CREATEUSERP2_10400
     * @tc.name      testCreateUser0104
     * @tc.desc      Verify createUser keeps id 5103 and name user_name_103.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCreateUser0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0104 begin');
      const user: User = createUser(5103, 'user_name_103');
      expect(user.id).assertEqual(5103);
      expect(user.name).assertEqual('user_name_103');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0104 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_CREATEUSERP2_10500
     * @tc.name      testCreateUser0105
     * @tc.desc      Verify createUser keeps id 5104 and name user_name_104.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCreateUser0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0105 begin');
      const user: User = createUser(5104, 'user_name_104');
      expect(user.id).assertEqual(5104);
      expect(user.name).assertEqual('user_name_104');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0105 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_CREATEUSERP2_10600
     * @tc.name      testCreateUser0106
     * @tc.desc      Verify createUser keeps id 5105 and name user_name_105.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCreateUser0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0106 begin');
      const user: User = createUser(5105, 'user_name_105');
      expect(user.id).assertEqual(5105);
      expect(user.name).assertEqual('user_name_105');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0106 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_CREATEUSERP2_10700
     * @tc.name      testCreateUser0107
     * @tc.desc      Verify createUser keeps id 5106 and name user_name_106.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCreateUser0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0107 begin');
      const user: User = createUser(5106, 'user_name_106');
      expect(user.id).assertEqual(5106);
      expect(user.name).assertEqual('user_name_106');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0107 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_CREATEUSERP2_10800
     * @tc.name      testCreateUser0108
     * @tc.desc      Verify createUser keeps id 5107 and name user_name_107.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCreateUser0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0108 begin');
      const user: User = createUser(5107, 'user_name_107');
      expect(user.id).assertEqual(5107);
      expect(user.name).assertEqual('user_name_107');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0108 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_CREATEUSERP2_10900
     * @tc.name      testCreateUser0109
     * @tc.desc      Verify createUser keeps id 5108 and name user_name_108.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCreateUser0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0109 begin');
      const user: User = createUser(5108, 'user_name_108');
      expect(user.id).assertEqual(5108);
      expect(user.name).assertEqual('user_name_108');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0109 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_CREATEUSERP2_11000
     * @tc.name      testCreateUser0110
     * @tc.desc      Verify createUser keeps id 5109 and name user_name_109.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCreateUser0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0110 begin');
      const user: User = createUser(5109, 'user_name_109');
      expect(user.id).assertEqual(5109);
      expect(user.name).assertEqual('user_name_109');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0110 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_CREATEUSERP2_11100
     * @tc.name      testCreateUser0111
     * @tc.desc      Verify createUser keeps id 5110 and name user_name_110.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCreateUser0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0111 begin');
      const user: User = createUser(5110, 'user_name_110');
      expect(user.id).assertEqual(5110);
      expect(user.name).assertEqual('user_name_110');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0111 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_CREATEUSERP2_11200
     * @tc.name      testCreateUser0112
     * @tc.desc      Verify createUser keeps id 5111 and name user_name_111.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCreateUser0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0112 begin');
      const user: User = createUser(5111, 'user_name_111');
      expect(user.id).assertEqual(5111);
      expect(user.name).assertEqual('user_name_111');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0112 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_CREATEUSERP2_11300
     * @tc.name      testCreateUser0113
     * @tc.desc      Verify createUser keeps id 5112 and name user_name_112.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCreateUser0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0113 begin');
      const user: User = createUser(5112, 'user_name_112');
      expect(user.id).assertEqual(5112);
      expect(user.name).assertEqual('user_name_112');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0113 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_CREATEUSERP2_11400
     * @tc.name      testCreateUser0114
     * @tc.desc      Verify createUser keeps id 5113 and name user_name_113.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCreateUser0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0114 begin');
      const user: User = createUser(5113, 'user_name_113');
      expect(user.id).assertEqual(5113);
      expect(user.name).assertEqual('user_name_113');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0114 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_CREATEUSERP2_11500
     * @tc.name      testCreateUser0115
     * @tc.desc      Verify createUser keeps id 5114 and name user_name_114.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCreateUser0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0115 begin');
      const user: User = createUser(5114, 'user_name_114');
      expect(user.id).assertEqual(5114);
      expect(user.name).assertEqual('user_name_114');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0115 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_CREATEUSERP2_11600
     * @tc.name      testCreateUser0116
     * @tc.desc      Verify createUser keeps id 5115 and name user_name_115.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCreateUser0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0116 begin');
      const user: User = createUser(5115, 'user_name_115');
      expect(user.id).assertEqual(5115);
      expect(user.name).assertEqual('user_name_115');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0116 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_CREATEUSERP2_11700
     * @tc.name      testCreateUser0117
     * @tc.desc      Verify createUser keeps id 5116 and name user_name_116.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCreateUser0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0117 begin');
      const user: User = createUser(5116, 'user_name_116');
      expect(user.id).assertEqual(5116);
      expect(user.name).assertEqual('user_name_116');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0117 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_CREATEUSERP2_11800
     * @tc.name      testCreateUser0118
     * @tc.desc      Verify createUser keeps id 5117 and name user_name_117.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCreateUser0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0118 begin');
      const user: User = createUser(5117, 'user_name_117');
      expect(user.id).assertEqual(5117);
      expect(user.name).assertEqual('user_name_117');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0118 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_CREATEUSERP2_11900
     * @tc.name      testCreateUser0119
     * @tc.desc      Verify createUser keeps id 5118 and name user_name_118.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCreateUser0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0119 begin');
      const user: User = createUser(5118, 'user_name_118');
      expect(user.id).assertEqual(5118);
      expect(user.name).assertEqual('user_name_118');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0119 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_CREATEUSERP2_12000
     * @tc.name      testCreateUser0120
     * @tc.desc      Verify createUser keeps id 5119 and name user_name_119.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCreateUser0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0120 begin');
      const user: User = createUser(5119, 'user_name_119');
      expect(user.id).assertEqual(5119);
      expect(user.name).assertEqual('user_name_119');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0120 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_CREATEUSERP2_12100
     * @tc.name      testCreateUser0121
     * @tc.desc      Verify createUser keeps id 5120 and name user_name_120.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCreateUser0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0121 begin');
      const user: User = createUser(5120, 'user_name_120');
      expect(user.id).assertEqual(5120);
      expect(user.name).assertEqual('user_name_120');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0121 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_CREATEUSERP2_12200
     * @tc.name      testCreateUser0122
     * @tc.desc      Verify createUser keeps id 5121 and name user_name_121.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCreateUser0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0122 begin');
      const user: User = createUser(5121, 'user_name_121');
      expect(user.id).assertEqual(5121);
      expect(user.name).assertEqual('user_name_121');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0122 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_CREATEUSERP2_12300
     * @tc.name      testCreateUser0123
     * @tc.desc      Verify createUser keeps id 5122 and name user_name_122.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCreateUser0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0123 begin');
      const user: User = createUser(5122, 'user_name_122');
      expect(user.id).assertEqual(5122);
      expect(user.name).assertEqual('user_name_122');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0123 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_CREATEUSERP2_12400
     * @tc.name      testCreateUser0124
     * @tc.desc      Verify createUser keeps id 5123 and name user_name_123.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCreateUser0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0124 begin');
      const user: User = createUser(5123, 'user_name_123');
      expect(user.id).assertEqual(5123);
      expect(user.name).assertEqual('user_name_123');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0124 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_CREATEUSERP2_12500
     * @tc.name      testCreateUser0125
     * @tc.desc      Verify createUser keeps id 5124 and name user_name_124.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCreateUser0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0125 begin');
      const user: User = createUser(5124, 'user_name_124');
      expect(user.id).assertEqual(5124);
      expect(user.name).assertEqual('user_name_124');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0125 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_CREATEUSERP2_12600
     * @tc.name      testCreateUser0126
     * @tc.desc      Verify createUser keeps id 5125 and name user_name_125.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCreateUser0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0126 begin');
      const user: User = createUser(5125, 'user_name_125');
      expect(user.id).assertEqual(5125);
      expect(user.name).assertEqual('user_name_125');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0126 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_CREATEUSERP2_12700
     * @tc.name      testCreateUser0127
     * @tc.desc      Verify createUser keeps id 5126 and name user_name_126.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCreateUser0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0127 begin');
      const user: User = createUser(5126, 'user_name_126');
      expect(user.id).assertEqual(5126);
      expect(user.name).assertEqual('user_name_126');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0127 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_CREATEUSERP2_12800
     * @tc.name      testCreateUser0128
     * @tc.desc      Verify createUser keeps id 5127 and name user_name_127.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCreateUser0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0128 begin');
      const user: User = createUser(5127, 'user_name_127');
      expect(user.id).assertEqual(5127);
      expect(user.name).assertEqual('user_name_127');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0128 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_CREATEUSERP2_12900
     * @tc.name      testCreateUser0129
     * @tc.desc      Verify createUser keeps id 5128 and name user_name_128.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCreateUser0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0129 begin');
      const user: User = createUser(5128, 'user_name_128');
      expect(user.id).assertEqual(5128);
      expect(user.name).assertEqual('user_name_128');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0129 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_CREATEUSERP2_13000
     * @tc.name      testCreateUser0130
     * @tc.desc      Verify createUser keeps id 5129 and name user_name_129.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCreateUser0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0130 begin');
      const user: User = createUser(5129, 'user_name_129');
      expect(user.id).assertEqual(5129);
      expect(user.name).assertEqual('user_name_129');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0130 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_CREATEUSERP2_13100
     * @tc.name      testCreateUser0131
     * @tc.desc      Verify createUser keeps id 5130 and name user_name_130.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCreateUser0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0131 begin');
      const user: User = createUser(5130, 'user_name_130');
      expect(user.id).assertEqual(5130);
      expect(user.name).assertEqual('user_name_130');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0131 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_CREATEUSERP2_13200
     * @tc.name      testCreateUser0132
     * @tc.desc      Verify createUser keeps id 5131 and name user_name_131.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCreateUser0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0132 begin');
      const user: User = createUser(5131, 'user_name_131');
      expect(user.id).assertEqual(5131);
      expect(user.name).assertEqual('user_name_131');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0132 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_CREATEUSERP2_13300
     * @tc.name      testCreateUser0133
     * @tc.desc      Verify createUser keeps id 5132 and name user_name_132.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCreateUser0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0133 begin');
      const user: User = createUser(5132, 'user_name_132');
      expect(user.id).assertEqual(5132);
      expect(user.name).assertEqual('user_name_132');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0133 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_CREATEUSERP2_13400
     * @tc.name      testCreateUser0134
     * @tc.desc      Verify createUser keeps id 5133 and name user_name_133.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCreateUser0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0134 begin');
      const user: User = createUser(5133, 'user_name_133');
      expect(user.id).assertEqual(5133);
      expect(user.name).assertEqual('user_name_133');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0134 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_CREATEUSERP2_13500
     * @tc.name      testCreateUser0135
     * @tc.desc      Verify createUser keeps id 5134 and name user_name_134.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCreateUser0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0135 begin');
      const user: User = createUser(5134, 'user_name_134');
      expect(user.id).assertEqual(5134);
      expect(user.name).assertEqual('user_name_134');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0135 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_CREATEUSERP2_13600
     * @tc.name      testCreateUser0136
     * @tc.desc      Verify createUser keeps id 5135 and name user_name_135.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCreateUser0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0136 begin');
      const user: User = createUser(5135, 'user_name_135');
      expect(user.id).assertEqual(5135);
      expect(user.name).assertEqual('user_name_135');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0136 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_CREATEUSERP2_13700
     * @tc.name      testCreateUser0137
     * @tc.desc      Verify createUser keeps id 5136 and name user_name_136.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCreateUser0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0137 begin');
      const user: User = createUser(5136, 'user_name_136');
      expect(user.id).assertEqual(5136);
      expect(user.name).assertEqual('user_name_136');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0137 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_CREATEUSERP2_13800
     * @tc.name      testCreateUser0138
     * @tc.desc      Verify createUser keeps id 5137 and name user_name_137.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCreateUser0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0138 begin');
      const user: User = createUser(5137, 'user_name_137');
      expect(user.id).assertEqual(5137);
      expect(user.name).assertEqual('user_name_137');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0138 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_CREATEUSERP2_13900
     * @tc.name      testCreateUser0139
     * @tc.desc      Verify createUser keeps id 5138 and name user_name_138.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCreateUser0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0139 begin');
      const user: User = createUser(5138, 'user_name_138');
      expect(user.id).assertEqual(5138);
      expect(user.name).assertEqual('user_name_138');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0139 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_CREATEUSERP2_14000
     * @tc.name      testCreateUser0140
     * @tc.desc      Verify createUser keeps id 5139 and name user_name_139.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCreateUser0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0140 begin');
      const user: User = createUser(5139, 'user_name_139');
      expect(user.id).assertEqual(5139);
      expect(user.name).assertEqual('user_name_139');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0140 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_CREATEUSERP2_14100
     * @tc.name      testCreateUser0141
     * @tc.desc      Verify createUser keeps id 5140 and name user_name_140.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCreateUser0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0141 begin');
      const user: User = createUser(5140, 'user_name_140');
      expect(user.id).assertEqual(5140);
      expect(user.name).assertEqual('user_name_140');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0141 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_CREATEUSERP2_14200
     * @tc.name      testCreateUser0142
     * @tc.desc      Verify createUser keeps id 5141 and name user_name_141.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCreateUser0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0142 begin');
      const user: User = createUser(5141, 'user_name_141');
      expect(user.id).assertEqual(5141);
      expect(user.name).assertEqual('user_name_141');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0142 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_CREATEUSERP2_14300
     * @tc.name      testCreateUser0143
     * @tc.desc      Verify createUser keeps id 5142 and name user_name_142.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCreateUser0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0143 begin');
      const user: User = createUser(5142, 'user_name_142');
      expect(user.id).assertEqual(5142);
      expect(user.name).assertEqual('user_name_142');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0143 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_CREATEUSERP2_14400
     * @tc.name      testCreateUser0144
     * @tc.desc      Verify createUser keeps id 5143 and name user_name_143.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCreateUser0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0144 begin');
      const user: User = createUser(5143, 'user_name_143');
      expect(user.id).assertEqual(5143);
      expect(user.name).assertEqual('user_name_143');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0144 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_CREATEUSERP2_14500
     * @tc.name      testCreateUser0145
     * @tc.desc      Verify createUser keeps id 5144 and name user_name_144.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCreateUser0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0145 begin');
      const user: User = createUser(5144, 'user_name_144');
      expect(user.id).assertEqual(5144);
      expect(user.name).assertEqual('user_name_144');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0145 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_CREATEUSERP2_14600
     * @tc.name      testCreateUser0146
     * @tc.desc      Verify createUser keeps id 5145 and name user_name_145.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCreateUser0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0146 begin');
      const user: User = createUser(5145, 'user_name_145');
      expect(user.id).assertEqual(5145);
      expect(user.name).assertEqual('user_name_145');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0146 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_CREATEUSERP2_14700
     * @tc.name      testCreateUser0147
     * @tc.desc      Verify createUser keeps id 5146 and name user_name_146.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCreateUser0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0147 begin');
      const user: User = createUser(5146, 'user_name_146');
      expect(user.id).assertEqual(5146);
      expect(user.name).assertEqual('user_name_146');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0147 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_CREATEUSERP2_14800
     * @tc.name      testCreateUser0148
     * @tc.desc      Verify createUser keeps id 5147 and name user_name_147.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCreateUser0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0148 begin');
      const user: User = createUser(5147, 'user_name_147');
      expect(user.id).assertEqual(5147);
      expect(user.name).assertEqual('user_name_147');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0148 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_CREATEUSERP2_14900
     * @tc.name      testCreateUser0149
     * @tc.desc      Verify createUser keeps id 5148 and name user_name_148.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCreateUser0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0149 begin');
      const user: User = createUser(5148, 'user_name_148');
      expect(user.id).assertEqual(5148);
      expect(user.name).assertEqual('user_name_148');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0149 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_CREATEUSERP2_15000
     * @tc.name      testCreateUser0150
     * @tc.desc      Verify createUser keeps id 5149 and name user_name_149.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCreateUser0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0150 begin');
      const user: User = createUser(5149, 'user_name_149');
      expect(user.id).assertEqual(5149);
      expect(user.name).assertEqual('user_name_149');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateUser0150 end');
    })

  })
}
