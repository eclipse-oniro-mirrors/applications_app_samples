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
import { UserRepository } from '../../../main/ets/common/Repository';
import { User } from '../../../main/ets/common/Types';

const DOMAIN: number = 0xF815;
const TAG: string = '[Sample_ARKTS_GUIDE_EXT]';

export default function UserRepositoryBulkMatrixPart1Test(): void {
  describe('UserRepositoryBulkMatrixPart1', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 20);
      });
    })


    /**
     * @tc.number    SUB_ARKTS_GUIDE_REPOBULKP1_0100
     * @tc.name      testRepoBulk0001
     * @tc.desc      Verify repository stores 1 user(s) for batch 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRepoBulk0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0001 begin');
      const repo: UserRepository = new UserRepository();
      const u0: User = { id: 1000, name: 'user1000' };
      repo.save(u0);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(1);
      expect(list[0].id).assertEqual(1000);
      expect(list[0].id).assertEqual(1000);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0001 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_REPOBULKP1_0200
     * @tc.name      testRepoBulk0002
     * @tc.desc      Verify repository stores 2 user(s) for batch 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRepoBulk0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0002 begin');
      const repo: UserRepository = new UserRepository();
      const u0: User = { id: 1010, name: 'user1010' };
      repo.save(u0);
      const u1: User = { id: 1011, name: 'user1011' };
      repo.save(u1);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(2);
      expect(list[0].id).assertEqual(1010);
      expect(list[1].id).assertEqual(1011);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0002 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_REPOBULKP1_0300
     * @tc.name      testRepoBulk0003
     * @tc.desc      Verify repository stores 3 user(s) for batch 2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRepoBulk0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0003 begin');
      const repo: UserRepository = new UserRepository();
      const u0: User = { id: 1020, name: 'user1020' };
      repo.save(u0);
      const u1: User = { id: 1021, name: 'user1021' };
      repo.save(u1);
      const u2: User = { id: 1022, name: 'user1022' };
      repo.save(u2);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(3);
      expect(list[0].id).assertEqual(1020);
      expect(list[2].id).assertEqual(1022);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0003 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_REPOBULKP1_0400
     * @tc.name      testRepoBulk0004
     * @tc.desc      Verify repository stores 4 user(s) for batch 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRepoBulk0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0004 begin');
      const repo: UserRepository = new UserRepository();
      const u0: User = { id: 1030, name: 'user1030' };
      repo.save(u0);
      const u1: User = { id: 1031, name: 'user1031' };
      repo.save(u1);
      const u2: User = { id: 1032, name: 'user1032' };
      repo.save(u2);
      const u3: User = { id: 1033, name: 'user1033' };
      repo.save(u3);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(4);
      expect(list[0].id).assertEqual(1030);
      expect(list[3].id).assertEqual(1033);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0004 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_REPOBULKP1_0500
     * @tc.name      testRepoBulk0005
     * @tc.desc      Verify repository stores 5 user(s) for batch 4.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRepoBulk0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0005 begin');
      const repo: UserRepository = new UserRepository();
      const u0: User = { id: 1040, name: 'user1040' };
      repo.save(u0);
      const u1: User = { id: 1041, name: 'user1041' };
      repo.save(u1);
      const u2: User = { id: 1042, name: 'user1042' };
      repo.save(u2);
      const u3: User = { id: 1043, name: 'user1043' };
      repo.save(u3);
      const u4: User = { id: 1044, name: 'user1044' };
      repo.save(u4);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(5);
      expect(list[0].id).assertEqual(1040);
      expect(list[4].id).assertEqual(1044);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0005 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_REPOBULKP1_0600
     * @tc.name      testRepoBulk0006
     * @tc.desc      Verify repository stores 1 user(s) for batch 5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRepoBulk0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0006 begin');
      const repo: UserRepository = new UserRepository();
      const u0: User = { id: 1050, name: 'user1050' };
      repo.save(u0);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(1);
      expect(list[0].id).assertEqual(1050);
      expect(list[0].id).assertEqual(1050);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0006 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_REPOBULKP1_0700
     * @tc.name      testRepoBulk0007
     * @tc.desc      Verify repository stores 2 user(s) for batch 6.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRepoBulk0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0007 begin');
      const repo: UserRepository = new UserRepository();
      const u0: User = { id: 1060, name: 'user1060' };
      repo.save(u0);
      const u1: User = { id: 1061, name: 'user1061' };
      repo.save(u1);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(2);
      expect(list[0].id).assertEqual(1060);
      expect(list[1].id).assertEqual(1061);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0007 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_REPOBULKP1_0800
     * @tc.name      testRepoBulk0008
     * @tc.desc      Verify repository stores 3 user(s) for batch 7.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRepoBulk0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0008 begin');
      const repo: UserRepository = new UserRepository();
      const u0: User = { id: 1070, name: 'user1070' };
      repo.save(u0);
      const u1: User = { id: 1071, name: 'user1071' };
      repo.save(u1);
      const u2: User = { id: 1072, name: 'user1072' };
      repo.save(u2);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(3);
      expect(list[0].id).assertEqual(1070);
      expect(list[2].id).assertEqual(1072);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0008 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_REPOBULKP1_0900
     * @tc.name      testRepoBulk0009
     * @tc.desc      Verify repository stores 4 user(s) for batch 8.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRepoBulk0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0009 begin');
      const repo: UserRepository = new UserRepository();
      const u0: User = { id: 1080, name: 'user1080' };
      repo.save(u0);
      const u1: User = { id: 1081, name: 'user1081' };
      repo.save(u1);
      const u2: User = { id: 1082, name: 'user1082' };
      repo.save(u2);
      const u3: User = { id: 1083, name: 'user1083' };
      repo.save(u3);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(4);
      expect(list[0].id).assertEqual(1080);
      expect(list[3].id).assertEqual(1083);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0009 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_REPOBULKP1_1000
     * @tc.name      testRepoBulk0010
     * @tc.desc      Verify repository stores 5 user(s) for batch 9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRepoBulk0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0010 begin');
      const repo: UserRepository = new UserRepository();
      const u0: User = { id: 1090, name: 'user1090' };
      repo.save(u0);
      const u1: User = { id: 1091, name: 'user1091' };
      repo.save(u1);
      const u2: User = { id: 1092, name: 'user1092' };
      repo.save(u2);
      const u3: User = { id: 1093, name: 'user1093' };
      repo.save(u3);
      const u4: User = { id: 1094, name: 'user1094' };
      repo.save(u4);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(5);
      expect(list[0].id).assertEqual(1090);
      expect(list[4].id).assertEqual(1094);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0010 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_REPOBULKP1_1100
     * @tc.name      testRepoBulk0011
     * @tc.desc      Verify repository stores 1 user(s) for batch 10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRepoBulk0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0011 begin');
      const repo: UserRepository = new UserRepository();
      const u0: User = { id: 1100, name: 'user1100' };
      repo.save(u0);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(1);
      expect(list[0].id).assertEqual(1100);
      expect(list[0].id).assertEqual(1100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0011 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_REPOBULKP1_1200
     * @tc.name      testRepoBulk0012
     * @tc.desc      Verify repository stores 2 user(s) for batch 11.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRepoBulk0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0012 begin');
      const repo: UserRepository = new UserRepository();
      const u0: User = { id: 1110, name: 'user1110' };
      repo.save(u0);
      const u1: User = { id: 1111, name: 'user1111' };
      repo.save(u1);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(2);
      expect(list[0].id).assertEqual(1110);
      expect(list[1].id).assertEqual(1111);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0012 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_REPOBULKP1_1300
     * @tc.name      testRepoBulk0013
     * @tc.desc      Verify repository stores 3 user(s) for batch 12.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRepoBulk0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0013 begin');
      const repo: UserRepository = new UserRepository();
      const u0: User = { id: 1120, name: 'user1120' };
      repo.save(u0);
      const u1: User = { id: 1121, name: 'user1121' };
      repo.save(u1);
      const u2: User = { id: 1122, name: 'user1122' };
      repo.save(u2);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(3);
      expect(list[0].id).assertEqual(1120);
      expect(list[2].id).assertEqual(1122);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0013 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_REPOBULKP1_1400
     * @tc.name      testRepoBulk0014
     * @tc.desc      Verify repository stores 4 user(s) for batch 13.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRepoBulk0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0014 begin');
      const repo: UserRepository = new UserRepository();
      const u0: User = { id: 1130, name: 'user1130' };
      repo.save(u0);
      const u1: User = { id: 1131, name: 'user1131' };
      repo.save(u1);
      const u2: User = { id: 1132, name: 'user1132' };
      repo.save(u2);
      const u3: User = { id: 1133, name: 'user1133' };
      repo.save(u3);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(4);
      expect(list[0].id).assertEqual(1130);
      expect(list[3].id).assertEqual(1133);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0014 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_REPOBULKP1_1500
     * @tc.name      testRepoBulk0015
     * @tc.desc      Verify repository stores 5 user(s) for batch 14.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRepoBulk0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0015 begin');
      const repo: UserRepository = new UserRepository();
      const u0: User = { id: 1140, name: 'user1140' };
      repo.save(u0);
      const u1: User = { id: 1141, name: 'user1141' };
      repo.save(u1);
      const u2: User = { id: 1142, name: 'user1142' };
      repo.save(u2);
      const u3: User = { id: 1143, name: 'user1143' };
      repo.save(u3);
      const u4: User = { id: 1144, name: 'user1144' };
      repo.save(u4);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(5);
      expect(list[0].id).assertEqual(1140);
      expect(list[4].id).assertEqual(1144);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0015 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_REPOBULKP1_1600
     * @tc.name      testRepoBulk0016
     * @tc.desc      Verify repository stores 1 user(s) for batch 15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRepoBulk0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0016 begin');
      const repo: UserRepository = new UserRepository();
      const u0: User = { id: 1150, name: 'user1150' };
      repo.save(u0);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(1);
      expect(list[0].id).assertEqual(1150);
      expect(list[0].id).assertEqual(1150);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0016 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_REPOBULKP1_1700
     * @tc.name      testRepoBulk0017
     * @tc.desc      Verify repository stores 2 user(s) for batch 16.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRepoBulk0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0017 begin');
      const repo: UserRepository = new UserRepository();
      const u0: User = { id: 1160, name: 'user1160' };
      repo.save(u0);
      const u1: User = { id: 1161, name: 'user1161' };
      repo.save(u1);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(2);
      expect(list[0].id).assertEqual(1160);
      expect(list[1].id).assertEqual(1161);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0017 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_REPOBULKP1_1800
     * @tc.name      testRepoBulk0018
     * @tc.desc      Verify repository stores 3 user(s) for batch 17.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRepoBulk0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0018 begin');
      const repo: UserRepository = new UserRepository();
      const u0: User = { id: 1170, name: 'user1170' };
      repo.save(u0);
      const u1: User = { id: 1171, name: 'user1171' };
      repo.save(u1);
      const u2: User = { id: 1172, name: 'user1172' };
      repo.save(u2);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(3);
      expect(list[0].id).assertEqual(1170);
      expect(list[2].id).assertEqual(1172);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0018 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_REPOBULKP1_1900
     * @tc.name      testRepoBulk0019
     * @tc.desc      Verify repository stores 4 user(s) for batch 18.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRepoBulk0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0019 begin');
      const repo: UserRepository = new UserRepository();
      const u0: User = { id: 1180, name: 'user1180' };
      repo.save(u0);
      const u1: User = { id: 1181, name: 'user1181' };
      repo.save(u1);
      const u2: User = { id: 1182, name: 'user1182' };
      repo.save(u2);
      const u3: User = { id: 1183, name: 'user1183' };
      repo.save(u3);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(4);
      expect(list[0].id).assertEqual(1180);
      expect(list[3].id).assertEqual(1183);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0019 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_REPOBULKP1_2000
     * @tc.name      testRepoBulk0020
     * @tc.desc      Verify repository stores 5 user(s) for batch 19.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRepoBulk0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0020 begin');
      const repo: UserRepository = new UserRepository();
      const u0: User = { id: 1190, name: 'user1190' };
      repo.save(u0);
      const u1: User = { id: 1191, name: 'user1191' };
      repo.save(u1);
      const u2: User = { id: 1192, name: 'user1192' };
      repo.save(u2);
      const u3: User = { id: 1193, name: 'user1193' };
      repo.save(u3);
      const u4: User = { id: 1194, name: 'user1194' };
      repo.save(u4);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(5);
      expect(list[0].id).assertEqual(1190);
      expect(list[4].id).assertEqual(1194);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0020 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_REPOBULKP1_2100
     * @tc.name      testRepoBulk0021
     * @tc.desc      Verify repository stores 1 user(s) for batch 20.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRepoBulk0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0021 begin');
      const repo: UserRepository = new UserRepository();
      const u0: User = { id: 1200, name: 'user1200' };
      repo.save(u0);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(1);
      expect(list[0].id).assertEqual(1200);
      expect(list[0].id).assertEqual(1200);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0021 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_REPOBULKP1_2200
     * @tc.name      testRepoBulk0022
     * @tc.desc      Verify repository stores 2 user(s) for batch 21.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRepoBulk0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0022 begin');
      const repo: UserRepository = new UserRepository();
      const u0: User = { id: 1210, name: 'user1210' };
      repo.save(u0);
      const u1: User = { id: 1211, name: 'user1211' };
      repo.save(u1);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(2);
      expect(list[0].id).assertEqual(1210);
      expect(list[1].id).assertEqual(1211);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0022 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_REPOBULKP1_2300
     * @tc.name      testRepoBulk0023
     * @tc.desc      Verify repository stores 3 user(s) for batch 22.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRepoBulk0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0023 begin');
      const repo: UserRepository = new UserRepository();
      const u0: User = { id: 1220, name: 'user1220' };
      repo.save(u0);
      const u1: User = { id: 1221, name: 'user1221' };
      repo.save(u1);
      const u2: User = { id: 1222, name: 'user1222' };
      repo.save(u2);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(3);
      expect(list[0].id).assertEqual(1220);
      expect(list[2].id).assertEqual(1222);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0023 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_REPOBULKP1_2400
     * @tc.name      testRepoBulk0024
     * @tc.desc      Verify repository stores 4 user(s) for batch 23.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRepoBulk0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0024 begin');
      const repo: UserRepository = new UserRepository();
      const u0: User = { id: 1230, name: 'user1230' };
      repo.save(u0);
      const u1: User = { id: 1231, name: 'user1231' };
      repo.save(u1);
      const u2: User = { id: 1232, name: 'user1232' };
      repo.save(u2);
      const u3: User = { id: 1233, name: 'user1233' };
      repo.save(u3);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(4);
      expect(list[0].id).assertEqual(1230);
      expect(list[3].id).assertEqual(1233);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0024 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_REPOBULKP1_2500
     * @tc.name      testRepoBulk0025
     * @tc.desc      Verify repository stores 5 user(s) for batch 24.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRepoBulk0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0025 begin');
      const repo: UserRepository = new UserRepository();
      const u0: User = { id: 1240, name: 'user1240' };
      repo.save(u0);
      const u1: User = { id: 1241, name: 'user1241' };
      repo.save(u1);
      const u2: User = { id: 1242, name: 'user1242' };
      repo.save(u2);
      const u3: User = { id: 1243, name: 'user1243' };
      repo.save(u3);
      const u4: User = { id: 1244, name: 'user1244' };
      repo.save(u4);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(5);
      expect(list[0].id).assertEqual(1240);
      expect(list[4].id).assertEqual(1244);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0025 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_REPOBULKP1_2600
     * @tc.name      testRepoBulk0026
     * @tc.desc      Verify repository stores 1 user(s) for batch 25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRepoBulk0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0026 begin');
      const repo: UserRepository = new UserRepository();
      const u0: User = { id: 1250, name: 'user1250' };
      repo.save(u0);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(1);
      expect(list[0].id).assertEqual(1250);
      expect(list[0].id).assertEqual(1250);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0026 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_REPOBULKP1_2700
     * @tc.name      testRepoBulk0027
     * @tc.desc      Verify repository stores 2 user(s) for batch 26.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRepoBulk0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0027 begin');
      const repo: UserRepository = new UserRepository();
      const u0: User = { id: 1260, name: 'user1260' };
      repo.save(u0);
      const u1: User = { id: 1261, name: 'user1261' };
      repo.save(u1);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(2);
      expect(list[0].id).assertEqual(1260);
      expect(list[1].id).assertEqual(1261);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0027 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_REPOBULKP1_2800
     * @tc.name      testRepoBulk0028
     * @tc.desc      Verify repository stores 3 user(s) for batch 27.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRepoBulk0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0028 begin');
      const repo: UserRepository = new UserRepository();
      const u0: User = { id: 1270, name: 'user1270' };
      repo.save(u0);
      const u1: User = { id: 1271, name: 'user1271' };
      repo.save(u1);
      const u2: User = { id: 1272, name: 'user1272' };
      repo.save(u2);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(3);
      expect(list[0].id).assertEqual(1270);
      expect(list[2].id).assertEqual(1272);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0028 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_REPOBULKP1_2900
     * @tc.name      testRepoBulk0029
     * @tc.desc      Verify repository stores 4 user(s) for batch 28.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRepoBulk0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0029 begin');
      const repo: UserRepository = new UserRepository();
      const u0: User = { id: 1280, name: 'user1280' };
      repo.save(u0);
      const u1: User = { id: 1281, name: 'user1281' };
      repo.save(u1);
      const u2: User = { id: 1282, name: 'user1282' };
      repo.save(u2);
      const u3: User = { id: 1283, name: 'user1283' };
      repo.save(u3);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(4);
      expect(list[0].id).assertEqual(1280);
      expect(list[3].id).assertEqual(1283);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0029 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_REPOBULKP1_3000
     * @tc.name      testRepoBulk0030
     * @tc.desc      Verify repository stores 5 user(s) for batch 29.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRepoBulk0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0030 begin');
      const repo: UserRepository = new UserRepository();
      const u0: User = { id: 1290, name: 'user1290' };
      repo.save(u0);
      const u1: User = { id: 1291, name: 'user1291' };
      repo.save(u1);
      const u2: User = { id: 1292, name: 'user1292' };
      repo.save(u2);
      const u3: User = { id: 1293, name: 'user1293' };
      repo.save(u3);
      const u4: User = { id: 1294, name: 'user1294' };
      repo.save(u4);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(5);
      expect(list[0].id).assertEqual(1290);
      expect(list[4].id).assertEqual(1294);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0030 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_REPOBULKP1_3100
     * @tc.name      testRepoBulk0031
     * @tc.desc      Verify repository stores 1 user(s) for batch 30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRepoBulk0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0031 begin');
      const repo: UserRepository = new UserRepository();
      const u0: User = { id: 1300, name: 'user1300' };
      repo.save(u0);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(1);
      expect(list[0].id).assertEqual(1300);
      expect(list[0].id).assertEqual(1300);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0031 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_REPOBULKP1_3200
     * @tc.name      testRepoBulk0032
     * @tc.desc      Verify repository stores 2 user(s) for batch 31.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRepoBulk0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0032 begin');
      const repo: UserRepository = new UserRepository();
      const u0: User = { id: 1310, name: 'user1310' };
      repo.save(u0);
      const u1: User = { id: 1311, name: 'user1311' };
      repo.save(u1);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(2);
      expect(list[0].id).assertEqual(1310);
      expect(list[1].id).assertEqual(1311);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0032 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_REPOBULKP1_3300
     * @tc.name      testRepoBulk0033
     * @tc.desc      Verify repository stores 3 user(s) for batch 32.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRepoBulk0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0033 begin');
      const repo: UserRepository = new UserRepository();
      const u0: User = { id: 1320, name: 'user1320' };
      repo.save(u0);
      const u1: User = { id: 1321, name: 'user1321' };
      repo.save(u1);
      const u2: User = { id: 1322, name: 'user1322' };
      repo.save(u2);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(3);
      expect(list[0].id).assertEqual(1320);
      expect(list[2].id).assertEqual(1322);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0033 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_REPOBULKP1_3400
     * @tc.name      testRepoBulk0034
     * @tc.desc      Verify repository stores 4 user(s) for batch 33.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRepoBulk0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0034 begin');
      const repo: UserRepository = new UserRepository();
      const u0: User = { id: 1330, name: 'user1330' };
      repo.save(u0);
      const u1: User = { id: 1331, name: 'user1331' };
      repo.save(u1);
      const u2: User = { id: 1332, name: 'user1332' };
      repo.save(u2);
      const u3: User = { id: 1333, name: 'user1333' };
      repo.save(u3);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(4);
      expect(list[0].id).assertEqual(1330);
      expect(list[3].id).assertEqual(1333);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0034 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_REPOBULKP1_3500
     * @tc.name      testRepoBulk0035
     * @tc.desc      Verify repository stores 5 user(s) for batch 34.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRepoBulk0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0035 begin');
      const repo: UserRepository = new UserRepository();
      const u0: User = { id: 1340, name: 'user1340' };
      repo.save(u0);
      const u1: User = { id: 1341, name: 'user1341' };
      repo.save(u1);
      const u2: User = { id: 1342, name: 'user1342' };
      repo.save(u2);
      const u3: User = { id: 1343, name: 'user1343' };
      repo.save(u3);
      const u4: User = { id: 1344, name: 'user1344' };
      repo.save(u4);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(5);
      expect(list[0].id).assertEqual(1340);
      expect(list[4].id).assertEqual(1344);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0035 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_REPOBULKP1_3600
     * @tc.name      testRepoBulk0036
     * @tc.desc      Verify repository stores 1 user(s) for batch 35.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRepoBulk0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0036 begin');
      const repo: UserRepository = new UserRepository();
      const u0: User = { id: 1350, name: 'user1350' };
      repo.save(u0);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(1);
      expect(list[0].id).assertEqual(1350);
      expect(list[0].id).assertEqual(1350);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0036 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_REPOBULKP1_3700
     * @tc.name      testRepoBulk0037
     * @tc.desc      Verify repository stores 2 user(s) for batch 36.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRepoBulk0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0037 begin');
      const repo: UserRepository = new UserRepository();
      const u0: User = { id: 1360, name: 'user1360' };
      repo.save(u0);
      const u1: User = { id: 1361, name: 'user1361' };
      repo.save(u1);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(2);
      expect(list[0].id).assertEqual(1360);
      expect(list[1].id).assertEqual(1361);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0037 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_REPOBULKP1_3800
     * @tc.name      testRepoBulk0038
     * @tc.desc      Verify repository stores 3 user(s) for batch 37.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRepoBulk0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0038 begin');
      const repo: UserRepository = new UserRepository();
      const u0: User = { id: 1370, name: 'user1370' };
      repo.save(u0);
      const u1: User = { id: 1371, name: 'user1371' };
      repo.save(u1);
      const u2: User = { id: 1372, name: 'user1372' };
      repo.save(u2);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(3);
      expect(list[0].id).assertEqual(1370);
      expect(list[2].id).assertEqual(1372);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0038 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_REPOBULKP1_3900
     * @tc.name      testRepoBulk0039
     * @tc.desc      Verify repository stores 4 user(s) for batch 38.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRepoBulk0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0039 begin');
      const repo: UserRepository = new UserRepository();
      const u0: User = { id: 1380, name: 'user1380' };
      repo.save(u0);
      const u1: User = { id: 1381, name: 'user1381' };
      repo.save(u1);
      const u2: User = { id: 1382, name: 'user1382' };
      repo.save(u2);
      const u3: User = { id: 1383, name: 'user1383' };
      repo.save(u3);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(4);
      expect(list[0].id).assertEqual(1380);
      expect(list[3].id).assertEqual(1383);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0039 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_REPOBULKP1_4000
     * @tc.name      testRepoBulk0040
     * @tc.desc      Verify repository stores 5 user(s) for batch 39.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRepoBulk0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0040 begin');
      const repo: UserRepository = new UserRepository();
      const u0: User = { id: 1390, name: 'user1390' };
      repo.save(u0);
      const u1: User = { id: 1391, name: 'user1391' };
      repo.save(u1);
      const u2: User = { id: 1392, name: 'user1392' };
      repo.save(u2);
      const u3: User = { id: 1393, name: 'user1393' };
      repo.save(u3);
      const u4: User = { id: 1394, name: 'user1394' };
      repo.save(u4);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(5);
      expect(list[0].id).assertEqual(1390);
      expect(list[4].id).assertEqual(1394);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0040 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_REPOBULKP1_4100
     * @tc.name      testRepoBulk0041
     * @tc.desc      Verify repository stores 1 user(s) for batch 40.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRepoBulk0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0041 begin');
      const repo: UserRepository = new UserRepository();
      const u0: User = { id: 1400, name: 'user1400' };
      repo.save(u0);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(1);
      expect(list[0].id).assertEqual(1400);
      expect(list[0].id).assertEqual(1400);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0041 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_REPOBULKP1_4200
     * @tc.name      testRepoBulk0042
     * @tc.desc      Verify repository stores 2 user(s) for batch 41.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRepoBulk0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0042 begin');
      const repo: UserRepository = new UserRepository();
      const u0: User = { id: 1410, name: 'user1410' };
      repo.save(u0);
      const u1: User = { id: 1411, name: 'user1411' };
      repo.save(u1);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(2);
      expect(list[0].id).assertEqual(1410);
      expect(list[1].id).assertEqual(1411);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0042 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_REPOBULKP1_4300
     * @tc.name      testRepoBulk0043
     * @tc.desc      Verify repository stores 3 user(s) for batch 42.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRepoBulk0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0043 begin');
      const repo: UserRepository = new UserRepository();
      const u0: User = { id: 1420, name: 'user1420' };
      repo.save(u0);
      const u1: User = { id: 1421, name: 'user1421' };
      repo.save(u1);
      const u2: User = { id: 1422, name: 'user1422' };
      repo.save(u2);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(3);
      expect(list[0].id).assertEqual(1420);
      expect(list[2].id).assertEqual(1422);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0043 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_REPOBULKP1_4400
     * @tc.name      testRepoBulk0044
     * @tc.desc      Verify repository stores 4 user(s) for batch 43.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRepoBulk0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0044 begin');
      const repo: UserRepository = new UserRepository();
      const u0: User = { id: 1430, name: 'user1430' };
      repo.save(u0);
      const u1: User = { id: 1431, name: 'user1431' };
      repo.save(u1);
      const u2: User = { id: 1432, name: 'user1432' };
      repo.save(u2);
      const u3: User = { id: 1433, name: 'user1433' };
      repo.save(u3);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(4);
      expect(list[0].id).assertEqual(1430);
      expect(list[3].id).assertEqual(1433);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0044 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_REPOBULKP1_4500
     * @tc.name      testRepoBulk0045
     * @tc.desc      Verify repository stores 5 user(s) for batch 44.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRepoBulk0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0045 begin');
      const repo: UserRepository = new UserRepository();
      const u0: User = { id: 1440, name: 'user1440' };
      repo.save(u0);
      const u1: User = { id: 1441, name: 'user1441' };
      repo.save(u1);
      const u2: User = { id: 1442, name: 'user1442' };
      repo.save(u2);
      const u3: User = { id: 1443, name: 'user1443' };
      repo.save(u3);
      const u4: User = { id: 1444, name: 'user1444' };
      repo.save(u4);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(5);
      expect(list[0].id).assertEqual(1440);
      expect(list[4].id).assertEqual(1444);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0045 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_REPOBULKP1_4600
     * @tc.name      testRepoBulk0046
     * @tc.desc      Verify repository stores 1 user(s) for batch 45.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRepoBulk0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0046 begin');
      const repo: UserRepository = new UserRepository();
      const u0: User = { id: 1450, name: 'user1450' };
      repo.save(u0);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(1);
      expect(list[0].id).assertEqual(1450);
      expect(list[0].id).assertEqual(1450);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0046 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_REPOBULKP1_4700
     * @tc.name      testRepoBulk0047
     * @tc.desc      Verify repository stores 2 user(s) for batch 46.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRepoBulk0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0047 begin');
      const repo: UserRepository = new UserRepository();
      const u0: User = { id: 1460, name: 'user1460' };
      repo.save(u0);
      const u1: User = { id: 1461, name: 'user1461' };
      repo.save(u1);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(2);
      expect(list[0].id).assertEqual(1460);
      expect(list[1].id).assertEqual(1461);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0047 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_REPOBULKP1_4800
     * @tc.name      testRepoBulk0048
     * @tc.desc      Verify repository stores 3 user(s) for batch 47.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRepoBulk0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0048 begin');
      const repo: UserRepository = new UserRepository();
      const u0: User = { id: 1470, name: 'user1470' };
      repo.save(u0);
      const u1: User = { id: 1471, name: 'user1471' };
      repo.save(u1);
      const u2: User = { id: 1472, name: 'user1472' };
      repo.save(u2);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(3);
      expect(list[0].id).assertEqual(1470);
      expect(list[2].id).assertEqual(1472);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0048 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_REPOBULKP1_4900
     * @tc.name      testRepoBulk0049
     * @tc.desc      Verify repository stores 4 user(s) for batch 48.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRepoBulk0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0049 begin');
      const repo: UserRepository = new UserRepository();
      const u0: User = { id: 1480, name: 'user1480' };
      repo.save(u0);
      const u1: User = { id: 1481, name: 'user1481' };
      repo.save(u1);
      const u2: User = { id: 1482, name: 'user1482' };
      repo.save(u2);
      const u3: User = { id: 1483, name: 'user1483' };
      repo.save(u3);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(4);
      expect(list[0].id).assertEqual(1480);
      expect(list[3].id).assertEqual(1483);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0049 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_REPOBULKP1_5000
     * @tc.name      testRepoBulk0050
     * @tc.desc      Verify repository stores 5 user(s) for batch 49.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRepoBulk0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0050 begin');
      const repo: UserRepository = new UserRepository();
      const u0: User = { id: 1490, name: 'user1490' };
      repo.save(u0);
      const u1: User = { id: 1491, name: 'user1491' };
      repo.save(u1);
      const u2: User = { id: 1492, name: 'user1492' };
      repo.save(u2);
      const u3: User = { id: 1493, name: 'user1493' };
      repo.save(u3);
      const u4: User = { id: 1494, name: 'user1494' };
      repo.save(u4);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(5);
      expect(list[0].id).assertEqual(1490);
      expect(list[4].id).assertEqual(1494);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0050 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_REPOBULKP1_5100
     * @tc.name      testRepoBulk0051
     * @tc.desc      Verify repository stores 1 user(s) for batch 50.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRepoBulk0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0051 begin');
      const repo: UserRepository = new UserRepository();
      const u0: User = { id: 1500, name: 'user1500' };
      repo.save(u0);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(1);
      expect(list[0].id).assertEqual(1500);
      expect(list[0].id).assertEqual(1500);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0051 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_REPOBULKP1_5200
     * @tc.name      testRepoBulk0052
     * @tc.desc      Verify repository stores 2 user(s) for batch 51.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRepoBulk0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0052 begin');
      const repo: UserRepository = new UserRepository();
      const u0: User = { id: 1510, name: 'user1510' };
      repo.save(u0);
      const u1: User = { id: 1511, name: 'user1511' };
      repo.save(u1);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(2);
      expect(list[0].id).assertEqual(1510);
      expect(list[1].id).assertEqual(1511);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0052 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_REPOBULKP1_5300
     * @tc.name      testRepoBulk0053
     * @tc.desc      Verify repository stores 3 user(s) for batch 52.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRepoBulk0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0053 begin');
      const repo: UserRepository = new UserRepository();
      const u0: User = { id: 1520, name: 'user1520' };
      repo.save(u0);
      const u1: User = { id: 1521, name: 'user1521' };
      repo.save(u1);
      const u2: User = { id: 1522, name: 'user1522' };
      repo.save(u2);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(3);
      expect(list[0].id).assertEqual(1520);
      expect(list[2].id).assertEqual(1522);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0053 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_REPOBULKP1_5400
     * @tc.name      testRepoBulk0054
     * @tc.desc      Verify repository stores 4 user(s) for batch 53.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRepoBulk0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0054 begin');
      const repo: UserRepository = new UserRepository();
      const u0: User = { id: 1530, name: 'user1530' };
      repo.save(u0);
      const u1: User = { id: 1531, name: 'user1531' };
      repo.save(u1);
      const u2: User = { id: 1532, name: 'user1532' };
      repo.save(u2);
      const u3: User = { id: 1533, name: 'user1533' };
      repo.save(u3);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(4);
      expect(list[0].id).assertEqual(1530);
      expect(list[3].id).assertEqual(1533);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0054 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_REPOBULKP1_5500
     * @tc.name      testRepoBulk0055
     * @tc.desc      Verify repository stores 5 user(s) for batch 54.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRepoBulk0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0055 begin');
      const repo: UserRepository = new UserRepository();
      const u0: User = { id: 1540, name: 'user1540' };
      repo.save(u0);
      const u1: User = { id: 1541, name: 'user1541' };
      repo.save(u1);
      const u2: User = { id: 1542, name: 'user1542' };
      repo.save(u2);
      const u3: User = { id: 1543, name: 'user1543' };
      repo.save(u3);
      const u4: User = { id: 1544, name: 'user1544' };
      repo.save(u4);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(5);
      expect(list[0].id).assertEqual(1540);
      expect(list[4].id).assertEqual(1544);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0055 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_REPOBULKP1_5600
     * @tc.name      testRepoBulk0056
     * @tc.desc      Verify repository stores 1 user(s) for batch 55.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRepoBulk0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0056 begin');
      const repo: UserRepository = new UserRepository();
      const u0: User = { id: 1550, name: 'user1550' };
      repo.save(u0);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(1);
      expect(list[0].id).assertEqual(1550);
      expect(list[0].id).assertEqual(1550);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0056 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_REPOBULKP1_5700
     * @tc.name      testRepoBulk0057
     * @tc.desc      Verify repository stores 2 user(s) for batch 56.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRepoBulk0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0057 begin');
      const repo: UserRepository = new UserRepository();
      const u0: User = { id: 1560, name: 'user1560' };
      repo.save(u0);
      const u1: User = { id: 1561, name: 'user1561' };
      repo.save(u1);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(2);
      expect(list[0].id).assertEqual(1560);
      expect(list[1].id).assertEqual(1561);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0057 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_REPOBULKP1_5800
     * @tc.name      testRepoBulk0058
     * @tc.desc      Verify repository stores 3 user(s) for batch 57.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRepoBulk0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0058 begin');
      const repo: UserRepository = new UserRepository();
      const u0: User = { id: 1570, name: 'user1570' };
      repo.save(u0);
      const u1: User = { id: 1571, name: 'user1571' };
      repo.save(u1);
      const u2: User = { id: 1572, name: 'user1572' };
      repo.save(u2);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(3);
      expect(list[0].id).assertEqual(1570);
      expect(list[2].id).assertEqual(1572);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0058 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_REPOBULKP1_5900
     * @tc.name      testRepoBulk0059
     * @tc.desc      Verify repository stores 4 user(s) for batch 58.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRepoBulk0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0059 begin');
      const repo: UserRepository = new UserRepository();
      const u0: User = { id: 1580, name: 'user1580' };
      repo.save(u0);
      const u1: User = { id: 1581, name: 'user1581' };
      repo.save(u1);
      const u2: User = { id: 1582, name: 'user1582' };
      repo.save(u2);
      const u3: User = { id: 1583, name: 'user1583' };
      repo.save(u3);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(4);
      expect(list[0].id).assertEqual(1580);
      expect(list[3].id).assertEqual(1583);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0059 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_REPOBULKP1_6000
     * @tc.name      testRepoBulk0060
     * @tc.desc      Verify repository stores 5 user(s) for batch 59.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRepoBulk0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0060 begin');
      const repo: UserRepository = new UserRepository();
      const u0: User = { id: 1590, name: 'user1590' };
      repo.save(u0);
      const u1: User = { id: 1591, name: 'user1591' };
      repo.save(u1);
      const u2: User = { id: 1592, name: 'user1592' };
      repo.save(u2);
      const u3: User = { id: 1593, name: 'user1593' };
      repo.save(u3);
      const u4: User = { id: 1594, name: 'user1594' };
      repo.save(u4);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(5);
      expect(list[0].id).assertEqual(1590);
      expect(list[4].id).assertEqual(1594);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0060 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_REPOBULKP1_6100
     * @tc.name      testRepoBulk0061
     * @tc.desc      Verify repository stores 1 user(s) for batch 60.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRepoBulk0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0061 begin');
      const repo: UserRepository = new UserRepository();
      const u0: User = { id: 1600, name: 'user1600' };
      repo.save(u0);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(1);
      expect(list[0].id).assertEqual(1600);
      expect(list[0].id).assertEqual(1600);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0061 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_REPOBULKP1_6200
     * @tc.name      testRepoBulk0062
     * @tc.desc      Verify repository stores 2 user(s) for batch 61.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRepoBulk0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0062 begin');
      const repo: UserRepository = new UserRepository();
      const u0: User = { id: 1610, name: 'user1610' };
      repo.save(u0);
      const u1: User = { id: 1611, name: 'user1611' };
      repo.save(u1);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(2);
      expect(list[0].id).assertEqual(1610);
      expect(list[1].id).assertEqual(1611);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0062 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_REPOBULKP1_6300
     * @tc.name      testRepoBulk0063
     * @tc.desc      Verify repository stores 3 user(s) for batch 62.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRepoBulk0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0063 begin');
      const repo: UserRepository = new UserRepository();
      const u0: User = { id: 1620, name: 'user1620' };
      repo.save(u0);
      const u1: User = { id: 1621, name: 'user1621' };
      repo.save(u1);
      const u2: User = { id: 1622, name: 'user1622' };
      repo.save(u2);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(3);
      expect(list[0].id).assertEqual(1620);
      expect(list[2].id).assertEqual(1622);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0063 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_REPOBULKP1_6400
     * @tc.name      testRepoBulk0064
     * @tc.desc      Verify repository stores 4 user(s) for batch 63.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRepoBulk0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0064 begin');
      const repo: UserRepository = new UserRepository();
      const u0: User = { id: 1630, name: 'user1630' };
      repo.save(u0);
      const u1: User = { id: 1631, name: 'user1631' };
      repo.save(u1);
      const u2: User = { id: 1632, name: 'user1632' };
      repo.save(u2);
      const u3: User = { id: 1633, name: 'user1633' };
      repo.save(u3);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(4);
      expect(list[0].id).assertEqual(1630);
      expect(list[3].id).assertEqual(1633);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0064 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_REPOBULKP1_6500
     * @tc.name      testRepoBulk0065
     * @tc.desc      Verify repository stores 5 user(s) for batch 64.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRepoBulk0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0065 begin');
      const repo: UserRepository = new UserRepository();
      const u0: User = { id: 1640, name: 'user1640' };
      repo.save(u0);
      const u1: User = { id: 1641, name: 'user1641' };
      repo.save(u1);
      const u2: User = { id: 1642, name: 'user1642' };
      repo.save(u2);
      const u3: User = { id: 1643, name: 'user1643' };
      repo.save(u3);
      const u4: User = { id: 1644, name: 'user1644' };
      repo.save(u4);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(5);
      expect(list[0].id).assertEqual(1640);
      expect(list[4].id).assertEqual(1644);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0065 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_REPOBULKP1_6600
     * @tc.name      testRepoBulk0066
     * @tc.desc      Verify repository stores 1 user(s) for batch 65.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRepoBulk0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0066 begin');
      const repo: UserRepository = new UserRepository();
      const u0: User = { id: 1650, name: 'user1650' };
      repo.save(u0);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(1);
      expect(list[0].id).assertEqual(1650);
      expect(list[0].id).assertEqual(1650);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0066 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_REPOBULKP1_6700
     * @tc.name      testRepoBulk0067
     * @tc.desc      Verify repository stores 2 user(s) for batch 66.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRepoBulk0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0067 begin');
      const repo: UserRepository = new UserRepository();
      const u0: User = { id: 1660, name: 'user1660' };
      repo.save(u0);
      const u1: User = { id: 1661, name: 'user1661' };
      repo.save(u1);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(2);
      expect(list[0].id).assertEqual(1660);
      expect(list[1].id).assertEqual(1661);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0067 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_REPOBULKP1_6800
     * @tc.name      testRepoBulk0068
     * @tc.desc      Verify repository stores 3 user(s) for batch 67.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRepoBulk0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0068 begin');
      const repo: UserRepository = new UserRepository();
      const u0: User = { id: 1670, name: 'user1670' };
      repo.save(u0);
      const u1: User = { id: 1671, name: 'user1671' };
      repo.save(u1);
      const u2: User = { id: 1672, name: 'user1672' };
      repo.save(u2);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(3);
      expect(list[0].id).assertEqual(1670);
      expect(list[2].id).assertEqual(1672);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0068 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_REPOBULKP1_6900
     * @tc.name      testRepoBulk0069
     * @tc.desc      Verify repository stores 4 user(s) for batch 68.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRepoBulk0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0069 begin');
      const repo: UserRepository = new UserRepository();
      const u0: User = { id: 1680, name: 'user1680' };
      repo.save(u0);
      const u1: User = { id: 1681, name: 'user1681' };
      repo.save(u1);
      const u2: User = { id: 1682, name: 'user1682' };
      repo.save(u2);
      const u3: User = { id: 1683, name: 'user1683' };
      repo.save(u3);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(4);
      expect(list[0].id).assertEqual(1680);
      expect(list[3].id).assertEqual(1683);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0069 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_REPOBULKP1_7000
     * @tc.name      testRepoBulk0070
     * @tc.desc      Verify repository stores 5 user(s) for batch 69.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRepoBulk0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0070 begin');
      const repo: UserRepository = new UserRepository();
      const u0: User = { id: 1690, name: 'user1690' };
      repo.save(u0);
      const u1: User = { id: 1691, name: 'user1691' };
      repo.save(u1);
      const u2: User = { id: 1692, name: 'user1692' };
      repo.save(u2);
      const u3: User = { id: 1693, name: 'user1693' };
      repo.save(u3);
      const u4: User = { id: 1694, name: 'user1694' };
      repo.save(u4);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(5);
      expect(list[0].id).assertEqual(1690);
      expect(list[4].id).assertEqual(1694);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0070 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_REPOBULKP1_7100
     * @tc.name      testRepoBulk0071
     * @tc.desc      Verify repository stores 1 user(s) for batch 70.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRepoBulk0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0071 begin');
      const repo: UserRepository = new UserRepository();
      const u0: User = { id: 1700, name: 'user1700' };
      repo.save(u0);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(1);
      expect(list[0].id).assertEqual(1700);
      expect(list[0].id).assertEqual(1700);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0071 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_REPOBULKP1_7200
     * @tc.name      testRepoBulk0072
     * @tc.desc      Verify repository stores 2 user(s) for batch 71.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRepoBulk0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0072 begin');
      const repo: UserRepository = new UserRepository();
      const u0: User = { id: 1710, name: 'user1710' };
      repo.save(u0);
      const u1: User = { id: 1711, name: 'user1711' };
      repo.save(u1);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(2);
      expect(list[0].id).assertEqual(1710);
      expect(list[1].id).assertEqual(1711);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0072 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_REPOBULKP1_7300
     * @tc.name      testRepoBulk0073
     * @tc.desc      Verify repository stores 3 user(s) for batch 72.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRepoBulk0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0073 begin');
      const repo: UserRepository = new UserRepository();
      const u0: User = { id: 1720, name: 'user1720' };
      repo.save(u0);
      const u1: User = { id: 1721, name: 'user1721' };
      repo.save(u1);
      const u2: User = { id: 1722, name: 'user1722' };
      repo.save(u2);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(3);
      expect(list[0].id).assertEqual(1720);
      expect(list[2].id).assertEqual(1722);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0073 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_REPOBULKP1_7400
     * @tc.name      testRepoBulk0074
     * @tc.desc      Verify repository stores 4 user(s) for batch 73.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRepoBulk0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0074 begin');
      const repo: UserRepository = new UserRepository();
      const u0: User = { id: 1730, name: 'user1730' };
      repo.save(u0);
      const u1: User = { id: 1731, name: 'user1731' };
      repo.save(u1);
      const u2: User = { id: 1732, name: 'user1732' };
      repo.save(u2);
      const u3: User = { id: 1733, name: 'user1733' };
      repo.save(u3);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(4);
      expect(list[0].id).assertEqual(1730);
      expect(list[3].id).assertEqual(1733);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0074 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_REPOBULKP1_7500
     * @tc.name      testRepoBulk0075
     * @tc.desc      Verify repository stores 5 user(s) for batch 74.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRepoBulk0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0075 begin');
      const repo: UserRepository = new UserRepository();
      const u0: User = { id: 1740, name: 'user1740' };
      repo.save(u0);
      const u1: User = { id: 1741, name: 'user1741' };
      repo.save(u1);
      const u2: User = { id: 1742, name: 'user1742' };
      repo.save(u2);
      const u3: User = { id: 1743, name: 'user1743' };
      repo.save(u3);
      const u4: User = { id: 1744, name: 'user1744' };
      repo.save(u4);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(5);
      expect(list[0].id).assertEqual(1740);
      expect(list[4].id).assertEqual(1744);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0075 end');
    })

  })
}
