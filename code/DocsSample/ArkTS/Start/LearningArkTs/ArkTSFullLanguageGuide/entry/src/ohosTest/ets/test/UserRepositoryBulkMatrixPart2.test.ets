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

export default function UserRepositoryBulkMatrixPart2Test(): void {
  describe('UserRepositoryBulkMatrixPart2', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 20);
      });
    })


    /**
     * @tc.number    SUB_ARKTS_GUIDE_REPOBULKP2_7600
     * @tc.name      testRepoBulk0076
     * @tc.desc      Verify repository stores 1 user(s) for batch 75.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRepoBulk0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0076 begin');
      const repo: UserRepository = new UserRepository();
      const u0: User = { id: 1750, name: 'user1750' };
      repo.save(u0);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(1);
      expect(list[0].id).assertEqual(1750);
      expect(list[0].id).assertEqual(1750);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0076 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_REPOBULKP2_7700
     * @tc.name      testRepoBulk0077
     * @tc.desc      Verify repository stores 2 user(s) for batch 76.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRepoBulk0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0077 begin');
      const repo: UserRepository = new UserRepository();
      const u0: User = { id: 1760, name: 'user1760' };
      repo.save(u0);
      const u1: User = { id: 1761, name: 'user1761' };
      repo.save(u1);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(2);
      expect(list[0].id).assertEqual(1760);
      expect(list[1].id).assertEqual(1761);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0077 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_REPOBULKP2_7800
     * @tc.name      testRepoBulk0078
     * @tc.desc      Verify repository stores 3 user(s) for batch 77.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRepoBulk0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0078 begin');
      const repo: UserRepository = new UserRepository();
      const u0: User = { id: 1770, name: 'user1770' };
      repo.save(u0);
      const u1: User = { id: 1771, name: 'user1771' };
      repo.save(u1);
      const u2: User = { id: 1772, name: 'user1772' };
      repo.save(u2);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(3);
      expect(list[0].id).assertEqual(1770);
      expect(list[2].id).assertEqual(1772);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0078 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_REPOBULKP2_7900
     * @tc.name      testRepoBulk0079
     * @tc.desc      Verify repository stores 4 user(s) for batch 78.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRepoBulk0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0079 begin');
      const repo: UserRepository = new UserRepository();
      const u0: User = { id: 1780, name: 'user1780' };
      repo.save(u0);
      const u1: User = { id: 1781, name: 'user1781' };
      repo.save(u1);
      const u2: User = { id: 1782, name: 'user1782' };
      repo.save(u2);
      const u3: User = { id: 1783, name: 'user1783' };
      repo.save(u3);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(4);
      expect(list[0].id).assertEqual(1780);
      expect(list[3].id).assertEqual(1783);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0079 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_REPOBULKP2_8000
     * @tc.name      testRepoBulk0080
     * @tc.desc      Verify repository stores 5 user(s) for batch 79.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRepoBulk0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0080 begin');
      const repo: UserRepository = new UserRepository();
      const u0: User = { id: 1790, name: 'user1790' };
      repo.save(u0);
      const u1: User = { id: 1791, name: 'user1791' };
      repo.save(u1);
      const u2: User = { id: 1792, name: 'user1792' };
      repo.save(u2);
      const u3: User = { id: 1793, name: 'user1793' };
      repo.save(u3);
      const u4: User = { id: 1794, name: 'user1794' };
      repo.save(u4);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(5);
      expect(list[0].id).assertEqual(1790);
      expect(list[4].id).assertEqual(1794);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0080 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_REPOBULKP2_8100
     * @tc.name      testRepoBulk0081
     * @tc.desc      Verify repository stores 1 user(s) for batch 80.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRepoBulk0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0081 begin');
      const repo: UserRepository = new UserRepository();
      const u0: User = { id: 1800, name: 'user1800' };
      repo.save(u0);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(1);
      expect(list[0].id).assertEqual(1800);
      expect(list[0].id).assertEqual(1800);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0081 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_REPOBULKP2_8200
     * @tc.name      testRepoBulk0082
     * @tc.desc      Verify repository stores 2 user(s) for batch 81.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRepoBulk0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0082 begin');
      const repo: UserRepository = new UserRepository();
      const u0: User = { id: 1810, name: 'user1810' };
      repo.save(u0);
      const u1: User = { id: 1811, name: 'user1811' };
      repo.save(u1);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(2);
      expect(list[0].id).assertEqual(1810);
      expect(list[1].id).assertEqual(1811);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0082 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_REPOBULKP2_8300
     * @tc.name      testRepoBulk0083
     * @tc.desc      Verify repository stores 3 user(s) for batch 82.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRepoBulk0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0083 begin');
      const repo: UserRepository = new UserRepository();
      const u0: User = { id: 1820, name: 'user1820' };
      repo.save(u0);
      const u1: User = { id: 1821, name: 'user1821' };
      repo.save(u1);
      const u2: User = { id: 1822, name: 'user1822' };
      repo.save(u2);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(3);
      expect(list[0].id).assertEqual(1820);
      expect(list[2].id).assertEqual(1822);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0083 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_REPOBULKP2_8400
     * @tc.name      testRepoBulk0084
     * @tc.desc      Verify repository stores 4 user(s) for batch 83.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRepoBulk0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0084 begin');
      const repo: UserRepository = new UserRepository();
      const u0: User = { id: 1830, name: 'user1830' };
      repo.save(u0);
      const u1: User = { id: 1831, name: 'user1831' };
      repo.save(u1);
      const u2: User = { id: 1832, name: 'user1832' };
      repo.save(u2);
      const u3: User = { id: 1833, name: 'user1833' };
      repo.save(u3);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(4);
      expect(list[0].id).assertEqual(1830);
      expect(list[3].id).assertEqual(1833);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0084 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_REPOBULKP2_8500
     * @tc.name      testRepoBulk0085
     * @tc.desc      Verify repository stores 5 user(s) for batch 84.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRepoBulk0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0085 begin');
      const repo: UserRepository = new UserRepository();
      const u0: User = { id: 1840, name: 'user1840' };
      repo.save(u0);
      const u1: User = { id: 1841, name: 'user1841' };
      repo.save(u1);
      const u2: User = { id: 1842, name: 'user1842' };
      repo.save(u2);
      const u3: User = { id: 1843, name: 'user1843' };
      repo.save(u3);
      const u4: User = { id: 1844, name: 'user1844' };
      repo.save(u4);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(5);
      expect(list[0].id).assertEqual(1840);
      expect(list[4].id).assertEqual(1844);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0085 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_REPOBULKP2_8600
     * @tc.name      testRepoBulk0086
     * @tc.desc      Verify repository stores 1 user(s) for batch 85.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRepoBulk0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0086 begin');
      const repo: UserRepository = new UserRepository();
      const u0: User = { id: 1850, name: 'user1850' };
      repo.save(u0);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(1);
      expect(list[0].id).assertEqual(1850);
      expect(list[0].id).assertEqual(1850);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0086 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_REPOBULKP2_8700
     * @tc.name      testRepoBulk0087
     * @tc.desc      Verify repository stores 2 user(s) for batch 86.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRepoBulk0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0087 begin');
      const repo: UserRepository = new UserRepository();
      const u0: User = { id: 1860, name: 'user1860' };
      repo.save(u0);
      const u1: User = { id: 1861, name: 'user1861' };
      repo.save(u1);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(2);
      expect(list[0].id).assertEqual(1860);
      expect(list[1].id).assertEqual(1861);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0087 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_REPOBULKP2_8800
     * @tc.name      testRepoBulk0088
     * @tc.desc      Verify repository stores 3 user(s) for batch 87.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRepoBulk0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0088 begin');
      const repo: UserRepository = new UserRepository();
      const u0: User = { id: 1870, name: 'user1870' };
      repo.save(u0);
      const u1: User = { id: 1871, name: 'user1871' };
      repo.save(u1);
      const u2: User = { id: 1872, name: 'user1872' };
      repo.save(u2);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(3);
      expect(list[0].id).assertEqual(1870);
      expect(list[2].id).assertEqual(1872);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0088 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_REPOBULKP2_8900
     * @tc.name      testRepoBulk0089
     * @tc.desc      Verify repository stores 4 user(s) for batch 88.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRepoBulk0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0089 begin');
      const repo: UserRepository = new UserRepository();
      const u0: User = { id: 1880, name: 'user1880' };
      repo.save(u0);
      const u1: User = { id: 1881, name: 'user1881' };
      repo.save(u1);
      const u2: User = { id: 1882, name: 'user1882' };
      repo.save(u2);
      const u3: User = { id: 1883, name: 'user1883' };
      repo.save(u3);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(4);
      expect(list[0].id).assertEqual(1880);
      expect(list[3].id).assertEqual(1883);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0089 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_REPOBULKP2_9000
     * @tc.name      testRepoBulk0090
     * @tc.desc      Verify repository stores 5 user(s) for batch 89.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRepoBulk0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0090 begin');
      const repo: UserRepository = new UserRepository();
      const u0: User = { id: 1890, name: 'user1890' };
      repo.save(u0);
      const u1: User = { id: 1891, name: 'user1891' };
      repo.save(u1);
      const u2: User = { id: 1892, name: 'user1892' };
      repo.save(u2);
      const u3: User = { id: 1893, name: 'user1893' };
      repo.save(u3);
      const u4: User = { id: 1894, name: 'user1894' };
      repo.save(u4);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(5);
      expect(list[0].id).assertEqual(1890);
      expect(list[4].id).assertEqual(1894);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0090 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_REPOBULKP2_9100
     * @tc.name      testRepoBulk0091
     * @tc.desc      Verify repository stores 1 user(s) for batch 90.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRepoBulk0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0091 begin');
      const repo: UserRepository = new UserRepository();
      const u0: User = { id: 1900, name: 'user1900' };
      repo.save(u0);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(1);
      expect(list[0].id).assertEqual(1900);
      expect(list[0].id).assertEqual(1900);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0091 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_REPOBULKP2_9200
     * @tc.name      testRepoBulk0092
     * @tc.desc      Verify repository stores 2 user(s) for batch 91.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRepoBulk0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0092 begin');
      const repo: UserRepository = new UserRepository();
      const u0: User = { id: 1910, name: 'user1910' };
      repo.save(u0);
      const u1: User = { id: 1911, name: 'user1911' };
      repo.save(u1);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(2);
      expect(list[0].id).assertEqual(1910);
      expect(list[1].id).assertEqual(1911);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0092 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_REPOBULKP2_9300
     * @tc.name      testRepoBulk0093
     * @tc.desc      Verify repository stores 3 user(s) for batch 92.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRepoBulk0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0093 begin');
      const repo: UserRepository = new UserRepository();
      const u0: User = { id: 1920, name: 'user1920' };
      repo.save(u0);
      const u1: User = { id: 1921, name: 'user1921' };
      repo.save(u1);
      const u2: User = { id: 1922, name: 'user1922' };
      repo.save(u2);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(3);
      expect(list[0].id).assertEqual(1920);
      expect(list[2].id).assertEqual(1922);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0093 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_REPOBULKP2_9400
     * @tc.name      testRepoBulk0094
     * @tc.desc      Verify repository stores 4 user(s) for batch 93.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRepoBulk0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0094 begin');
      const repo: UserRepository = new UserRepository();
      const u0: User = { id: 1930, name: 'user1930' };
      repo.save(u0);
      const u1: User = { id: 1931, name: 'user1931' };
      repo.save(u1);
      const u2: User = { id: 1932, name: 'user1932' };
      repo.save(u2);
      const u3: User = { id: 1933, name: 'user1933' };
      repo.save(u3);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(4);
      expect(list[0].id).assertEqual(1930);
      expect(list[3].id).assertEqual(1933);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0094 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_REPOBULKP2_9500
     * @tc.name      testRepoBulk0095
     * @tc.desc      Verify repository stores 5 user(s) for batch 94.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRepoBulk0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0095 begin');
      const repo: UserRepository = new UserRepository();
      const u0: User = { id: 1940, name: 'user1940' };
      repo.save(u0);
      const u1: User = { id: 1941, name: 'user1941' };
      repo.save(u1);
      const u2: User = { id: 1942, name: 'user1942' };
      repo.save(u2);
      const u3: User = { id: 1943, name: 'user1943' };
      repo.save(u3);
      const u4: User = { id: 1944, name: 'user1944' };
      repo.save(u4);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(5);
      expect(list[0].id).assertEqual(1940);
      expect(list[4].id).assertEqual(1944);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0095 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_REPOBULKP2_9600
     * @tc.name      testRepoBulk0096
     * @tc.desc      Verify repository stores 1 user(s) for batch 95.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRepoBulk0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0096 begin');
      const repo: UserRepository = new UserRepository();
      const u0: User = { id: 1950, name: 'user1950' };
      repo.save(u0);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(1);
      expect(list[0].id).assertEqual(1950);
      expect(list[0].id).assertEqual(1950);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0096 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_REPOBULKP2_9700
     * @tc.name      testRepoBulk0097
     * @tc.desc      Verify repository stores 2 user(s) for batch 96.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRepoBulk0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0097 begin');
      const repo: UserRepository = new UserRepository();
      const u0: User = { id: 1960, name: 'user1960' };
      repo.save(u0);
      const u1: User = { id: 1961, name: 'user1961' };
      repo.save(u1);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(2);
      expect(list[0].id).assertEqual(1960);
      expect(list[1].id).assertEqual(1961);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0097 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_REPOBULKP2_9800
     * @tc.name      testRepoBulk0098
     * @tc.desc      Verify repository stores 3 user(s) for batch 97.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRepoBulk0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0098 begin');
      const repo: UserRepository = new UserRepository();
      const u0: User = { id: 1970, name: 'user1970' };
      repo.save(u0);
      const u1: User = { id: 1971, name: 'user1971' };
      repo.save(u1);
      const u2: User = { id: 1972, name: 'user1972' };
      repo.save(u2);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(3);
      expect(list[0].id).assertEqual(1970);
      expect(list[2].id).assertEqual(1972);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0098 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_REPOBULKP2_9900
     * @tc.name      testRepoBulk0099
     * @tc.desc      Verify repository stores 4 user(s) for batch 98.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRepoBulk0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0099 begin');
      const repo: UserRepository = new UserRepository();
      const u0: User = { id: 1980, name: 'user1980' };
      repo.save(u0);
      const u1: User = { id: 1981, name: 'user1981' };
      repo.save(u1);
      const u2: User = { id: 1982, name: 'user1982' };
      repo.save(u2);
      const u3: User = { id: 1983, name: 'user1983' };
      repo.save(u3);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(4);
      expect(list[0].id).assertEqual(1980);
      expect(list[3].id).assertEqual(1983);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0099 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_REPOBULKP2_10000
     * @tc.name      testRepoBulk0100
     * @tc.desc      Verify repository stores 5 user(s) for batch 99.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRepoBulk0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0100 begin');
      const repo: UserRepository = new UserRepository();
      const u0: User = { id: 1990, name: 'user1990' };
      repo.save(u0);
      const u1: User = { id: 1991, name: 'user1991' };
      repo.save(u1);
      const u2: User = { id: 1992, name: 'user1992' };
      repo.save(u2);
      const u3: User = { id: 1993, name: 'user1993' };
      repo.save(u3);
      const u4: User = { id: 1994, name: 'user1994' };
      repo.save(u4);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(5);
      expect(list[0].id).assertEqual(1990);
      expect(list[4].id).assertEqual(1994);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0100 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_REPOBULKP2_10100
     * @tc.name      testRepoBulk0101
     * @tc.desc      Verify repository stores 1 user(s) for batch 100.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRepoBulk0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0101 begin');
      const repo: UserRepository = new UserRepository();
      const u0: User = { id: 2000, name: 'user2000' };
      repo.save(u0);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(1);
      expect(list[0].id).assertEqual(2000);
      expect(list[0].id).assertEqual(2000);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0101 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_REPOBULKP2_10200
     * @tc.name      testRepoBulk0102
     * @tc.desc      Verify repository stores 2 user(s) for batch 101.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRepoBulk0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0102 begin');
      const repo: UserRepository = new UserRepository();
      const u0: User = { id: 2010, name: 'user2010' };
      repo.save(u0);
      const u1: User = { id: 2011, name: 'user2011' };
      repo.save(u1);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(2);
      expect(list[0].id).assertEqual(2010);
      expect(list[1].id).assertEqual(2011);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0102 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_REPOBULKP2_10300
     * @tc.name      testRepoBulk0103
     * @tc.desc      Verify repository stores 3 user(s) for batch 102.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRepoBulk0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0103 begin');
      const repo: UserRepository = new UserRepository();
      const u0: User = { id: 2020, name: 'user2020' };
      repo.save(u0);
      const u1: User = { id: 2021, name: 'user2021' };
      repo.save(u1);
      const u2: User = { id: 2022, name: 'user2022' };
      repo.save(u2);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(3);
      expect(list[0].id).assertEqual(2020);
      expect(list[2].id).assertEqual(2022);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0103 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_REPOBULKP2_10400
     * @tc.name      testRepoBulk0104
     * @tc.desc      Verify repository stores 4 user(s) for batch 103.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRepoBulk0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0104 begin');
      const repo: UserRepository = new UserRepository();
      const u0: User = { id: 2030, name: 'user2030' };
      repo.save(u0);
      const u1: User = { id: 2031, name: 'user2031' };
      repo.save(u1);
      const u2: User = { id: 2032, name: 'user2032' };
      repo.save(u2);
      const u3: User = { id: 2033, name: 'user2033' };
      repo.save(u3);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(4);
      expect(list[0].id).assertEqual(2030);
      expect(list[3].id).assertEqual(2033);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0104 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_REPOBULKP2_10500
     * @tc.name      testRepoBulk0105
     * @tc.desc      Verify repository stores 5 user(s) for batch 104.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRepoBulk0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0105 begin');
      const repo: UserRepository = new UserRepository();
      const u0: User = { id: 2040, name: 'user2040' };
      repo.save(u0);
      const u1: User = { id: 2041, name: 'user2041' };
      repo.save(u1);
      const u2: User = { id: 2042, name: 'user2042' };
      repo.save(u2);
      const u3: User = { id: 2043, name: 'user2043' };
      repo.save(u3);
      const u4: User = { id: 2044, name: 'user2044' };
      repo.save(u4);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(5);
      expect(list[0].id).assertEqual(2040);
      expect(list[4].id).assertEqual(2044);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0105 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_REPOBULKP2_10600
     * @tc.name      testRepoBulk0106
     * @tc.desc      Verify repository stores 1 user(s) for batch 105.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRepoBulk0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0106 begin');
      const repo: UserRepository = new UserRepository();
      const u0: User = { id: 2050, name: 'user2050' };
      repo.save(u0);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(1);
      expect(list[0].id).assertEqual(2050);
      expect(list[0].id).assertEqual(2050);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0106 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_REPOBULKP2_10700
     * @tc.name      testRepoBulk0107
     * @tc.desc      Verify repository stores 2 user(s) for batch 106.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRepoBulk0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0107 begin');
      const repo: UserRepository = new UserRepository();
      const u0: User = { id: 2060, name: 'user2060' };
      repo.save(u0);
      const u1: User = { id: 2061, name: 'user2061' };
      repo.save(u1);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(2);
      expect(list[0].id).assertEqual(2060);
      expect(list[1].id).assertEqual(2061);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0107 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_REPOBULKP2_10800
     * @tc.name      testRepoBulk0108
     * @tc.desc      Verify repository stores 3 user(s) for batch 107.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRepoBulk0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0108 begin');
      const repo: UserRepository = new UserRepository();
      const u0: User = { id: 2070, name: 'user2070' };
      repo.save(u0);
      const u1: User = { id: 2071, name: 'user2071' };
      repo.save(u1);
      const u2: User = { id: 2072, name: 'user2072' };
      repo.save(u2);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(3);
      expect(list[0].id).assertEqual(2070);
      expect(list[2].id).assertEqual(2072);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0108 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_REPOBULKP2_10900
     * @tc.name      testRepoBulk0109
     * @tc.desc      Verify repository stores 4 user(s) for batch 108.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRepoBulk0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0109 begin');
      const repo: UserRepository = new UserRepository();
      const u0: User = { id: 2080, name: 'user2080' };
      repo.save(u0);
      const u1: User = { id: 2081, name: 'user2081' };
      repo.save(u1);
      const u2: User = { id: 2082, name: 'user2082' };
      repo.save(u2);
      const u3: User = { id: 2083, name: 'user2083' };
      repo.save(u3);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(4);
      expect(list[0].id).assertEqual(2080);
      expect(list[3].id).assertEqual(2083);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0109 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_REPOBULKP2_11000
     * @tc.name      testRepoBulk0110
     * @tc.desc      Verify repository stores 5 user(s) for batch 109.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRepoBulk0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0110 begin');
      const repo: UserRepository = new UserRepository();
      const u0: User = { id: 2090, name: 'user2090' };
      repo.save(u0);
      const u1: User = { id: 2091, name: 'user2091' };
      repo.save(u1);
      const u2: User = { id: 2092, name: 'user2092' };
      repo.save(u2);
      const u3: User = { id: 2093, name: 'user2093' };
      repo.save(u3);
      const u4: User = { id: 2094, name: 'user2094' };
      repo.save(u4);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(5);
      expect(list[0].id).assertEqual(2090);
      expect(list[4].id).assertEqual(2094);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0110 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_REPOBULKP2_11100
     * @tc.name      testRepoBulk0111
     * @tc.desc      Verify repository stores 1 user(s) for batch 110.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRepoBulk0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0111 begin');
      const repo: UserRepository = new UserRepository();
      const u0: User = { id: 2100, name: 'user2100' };
      repo.save(u0);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(1);
      expect(list[0].id).assertEqual(2100);
      expect(list[0].id).assertEqual(2100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0111 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_REPOBULKP2_11200
     * @tc.name      testRepoBulk0112
     * @tc.desc      Verify repository stores 2 user(s) for batch 111.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRepoBulk0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0112 begin');
      const repo: UserRepository = new UserRepository();
      const u0: User = { id: 2110, name: 'user2110' };
      repo.save(u0);
      const u1: User = { id: 2111, name: 'user2111' };
      repo.save(u1);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(2);
      expect(list[0].id).assertEqual(2110);
      expect(list[1].id).assertEqual(2111);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0112 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_REPOBULKP2_11300
     * @tc.name      testRepoBulk0113
     * @tc.desc      Verify repository stores 3 user(s) for batch 112.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRepoBulk0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0113 begin');
      const repo: UserRepository = new UserRepository();
      const u0: User = { id: 2120, name: 'user2120' };
      repo.save(u0);
      const u1: User = { id: 2121, name: 'user2121' };
      repo.save(u1);
      const u2: User = { id: 2122, name: 'user2122' };
      repo.save(u2);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(3);
      expect(list[0].id).assertEqual(2120);
      expect(list[2].id).assertEqual(2122);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0113 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_REPOBULKP2_11400
     * @tc.name      testRepoBulk0114
     * @tc.desc      Verify repository stores 4 user(s) for batch 113.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRepoBulk0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0114 begin');
      const repo: UserRepository = new UserRepository();
      const u0: User = { id: 2130, name: 'user2130' };
      repo.save(u0);
      const u1: User = { id: 2131, name: 'user2131' };
      repo.save(u1);
      const u2: User = { id: 2132, name: 'user2132' };
      repo.save(u2);
      const u3: User = { id: 2133, name: 'user2133' };
      repo.save(u3);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(4);
      expect(list[0].id).assertEqual(2130);
      expect(list[3].id).assertEqual(2133);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0114 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_REPOBULKP2_11500
     * @tc.name      testRepoBulk0115
     * @tc.desc      Verify repository stores 5 user(s) for batch 114.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRepoBulk0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0115 begin');
      const repo: UserRepository = new UserRepository();
      const u0: User = { id: 2140, name: 'user2140' };
      repo.save(u0);
      const u1: User = { id: 2141, name: 'user2141' };
      repo.save(u1);
      const u2: User = { id: 2142, name: 'user2142' };
      repo.save(u2);
      const u3: User = { id: 2143, name: 'user2143' };
      repo.save(u3);
      const u4: User = { id: 2144, name: 'user2144' };
      repo.save(u4);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(5);
      expect(list[0].id).assertEqual(2140);
      expect(list[4].id).assertEqual(2144);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0115 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_REPOBULKP2_11600
     * @tc.name      testRepoBulk0116
     * @tc.desc      Verify repository stores 1 user(s) for batch 115.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRepoBulk0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0116 begin');
      const repo: UserRepository = new UserRepository();
      const u0: User = { id: 2150, name: 'user2150' };
      repo.save(u0);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(1);
      expect(list[0].id).assertEqual(2150);
      expect(list[0].id).assertEqual(2150);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0116 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_REPOBULKP2_11700
     * @tc.name      testRepoBulk0117
     * @tc.desc      Verify repository stores 2 user(s) for batch 116.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRepoBulk0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0117 begin');
      const repo: UserRepository = new UserRepository();
      const u0: User = { id: 2160, name: 'user2160' };
      repo.save(u0);
      const u1: User = { id: 2161, name: 'user2161' };
      repo.save(u1);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(2);
      expect(list[0].id).assertEqual(2160);
      expect(list[1].id).assertEqual(2161);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0117 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_REPOBULKP2_11800
     * @tc.name      testRepoBulk0118
     * @tc.desc      Verify repository stores 3 user(s) for batch 117.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRepoBulk0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0118 begin');
      const repo: UserRepository = new UserRepository();
      const u0: User = { id: 2170, name: 'user2170' };
      repo.save(u0);
      const u1: User = { id: 2171, name: 'user2171' };
      repo.save(u1);
      const u2: User = { id: 2172, name: 'user2172' };
      repo.save(u2);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(3);
      expect(list[0].id).assertEqual(2170);
      expect(list[2].id).assertEqual(2172);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0118 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_REPOBULKP2_11900
     * @tc.name      testRepoBulk0119
     * @tc.desc      Verify repository stores 4 user(s) for batch 118.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRepoBulk0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0119 begin');
      const repo: UserRepository = new UserRepository();
      const u0: User = { id: 2180, name: 'user2180' };
      repo.save(u0);
      const u1: User = { id: 2181, name: 'user2181' };
      repo.save(u1);
      const u2: User = { id: 2182, name: 'user2182' };
      repo.save(u2);
      const u3: User = { id: 2183, name: 'user2183' };
      repo.save(u3);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(4);
      expect(list[0].id).assertEqual(2180);
      expect(list[3].id).assertEqual(2183);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0119 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_REPOBULKP2_12000
     * @tc.name      testRepoBulk0120
     * @tc.desc      Verify repository stores 5 user(s) for batch 119.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRepoBulk0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0120 begin');
      const repo: UserRepository = new UserRepository();
      const u0: User = { id: 2190, name: 'user2190' };
      repo.save(u0);
      const u1: User = { id: 2191, name: 'user2191' };
      repo.save(u1);
      const u2: User = { id: 2192, name: 'user2192' };
      repo.save(u2);
      const u3: User = { id: 2193, name: 'user2193' };
      repo.save(u3);
      const u4: User = { id: 2194, name: 'user2194' };
      repo.save(u4);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(5);
      expect(list[0].id).assertEqual(2190);
      expect(list[4].id).assertEqual(2194);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0120 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_REPOBULKP2_12100
     * @tc.name      testRepoBulk0121
     * @tc.desc      Verify repository stores 1 user(s) for batch 120.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRepoBulk0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0121 begin');
      const repo: UserRepository = new UserRepository();
      const u0: User = { id: 2200, name: 'user2200' };
      repo.save(u0);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(1);
      expect(list[0].id).assertEqual(2200);
      expect(list[0].id).assertEqual(2200);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0121 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_REPOBULKP2_12200
     * @tc.name      testRepoBulk0122
     * @tc.desc      Verify repository stores 2 user(s) for batch 121.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRepoBulk0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0122 begin');
      const repo: UserRepository = new UserRepository();
      const u0: User = { id: 2210, name: 'user2210' };
      repo.save(u0);
      const u1: User = { id: 2211, name: 'user2211' };
      repo.save(u1);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(2);
      expect(list[0].id).assertEqual(2210);
      expect(list[1].id).assertEqual(2211);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0122 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_REPOBULKP2_12300
     * @tc.name      testRepoBulk0123
     * @tc.desc      Verify repository stores 3 user(s) for batch 122.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRepoBulk0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0123 begin');
      const repo: UserRepository = new UserRepository();
      const u0: User = { id: 2220, name: 'user2220' };
      repo.save(u0);
      const u1: User = { id: 2221, name: 'user2221' };
      repo.save(u1);
      const u2: User = { id: 2222, name: 'user2222' };
      repo.save(u2);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(3);
      expect(list[0].id).assertEqual(2220);
      expect(list[2].id).assertEqual(2222);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0123 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_REPOBULKP2_12400
     * @tc.name      testRepoBulk0124
     * @tc.desc      Verify repository stores 4 user(s) for batch 123.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRepoBulk0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0124 begin');
      const repo: UserRepository = new UserRepository();
      const u0: User = { id: 2230, name: 'user2230' };
      repo.save(u0);
      const u1: User = { id: 2231, name: 'user2231' };
      repo.save(u1);
      const u2: User = { id: 2232, name: 'user2232' };
      repo.save(u2);
      const u3: User = { id: 2233, name: 'user2233' };
      repo.save(u3);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(4);
      expect(list[0].id).assertEqual(2230);
      expect(list[3].id).assertEqual(2233);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0124 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_REPOBULKP2_12500
     * @tc.name      testRepoBulk0125
     * @tc.desc      Verify repository stores 5 user(s) for batch 124.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRepoBulk0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0125 begin');
      const repo: UserRepository = new UserRepository();
      const u0: User = { id: 2240, name: 'user2240' };
      repo.save(u0);
      const u1: User = { id: 2241, name: 'user2241' };
      repo.save(u1);
      const u2: User = { id: 2242, name: 'user2242' };
      repo.save(u2);
      const u3: User = { id: 2243, name: 'user2243' };
      repo.save(u3);
      const u4: User = { id: 2244, name: 'user2244' };
      repo.save(u4);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(5);
      expect(list[0].id).assertEqual(2240);
      expect(list[4].id).assertEqual(2244);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0125 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_REPOBULKP2_12600
     * @tc.name      testRepoBulk0126
     * @tc.desc      Verify repository stores 1 user(s) for batch 125.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRepoBulk0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0126 begin');
      const repo: UserRepository = new UserRepository();
      const u0: User = { id: 2250, name: 'user2250' };
      repo.save(u0);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(1);
      expect(list[0].id).assertEqual(2250);
      expect(list[0].id).assertEqual(2250);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0126 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_REPOBULKP2_12700
     * @tc.name      testRepoBulk0127
     * @tc.desc      Verify repository stores 2 user(s) for batch 126.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRepoBulk0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0127 begin');
      const repo: UserRepository = new UserRepository();
      const u0: User = { id: 2260, name: 'user2260' };
      repo.save(u0);
      const u1: User = { id: 2261, name: 'user2261' };
      repo.save(u1);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(2);
      expect(list[0].id).assertEqual(2260);
      expect(list[1].id).assertEqual(2261);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0127 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_REPOBULKP2_12800
     * @tc.name      testRepoBulk0128
     * @tc.desc      Verify repository stores 3 user(s) for batch 127.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRepoBulk0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0128 begin');
      const repo: UserRepository = new UserRepository();
      const u0: User = { id: 2270, name: 'user2270' };
      repo.save(u0);
      const u1: User = { id: 2271, name: 'user2271' };
      repo.save(u1);
      const u2: User = { id: 2272, name: 'user2272' };
      repo.save(u2);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(3);
      expect(list[0].id).assertEqual(2270);
      expect(list[2].id).assertEqual(2272);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0128 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_REPOBULKP2_12900
     * @tc.name      testRepoBulk0129
     * @tc.desc      Verify repository stores 4 user(s) for batch 128.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRepoBulk0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0129 begin');
      const repo: UserRepository = new UserRepository();
      const u0: User = { id: 2280, name: 'user2280' };
      repo.save(u0);
      const u1: User = { id: 2281, name: 'user2281' };
      repo.save(u1);
      const u2: User = { id: 2282, name: 'user2282' };
      repo.save(u2);
      const u3: User = { id: 2283, name: 'user2283' };
      repo.save(u3);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(4);
      expect(list[0].id).assertEqual(2280);
      expect(list[3].id).assertEqual(2283);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0129 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_REPOBULKP2_13000
     * @tc.name      testRepoBulk0130
     * @tc.desc      Verify repository stores 5 user(s) for batch 129.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRepoBulk0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0130 begin');
      const repo: UserRepository = new UserRepository();
      const u0: User = { id: 2290, name: 'user2290' };
      repo.save(u0);
      const u1: User = { id: 2291, name: 'user2291' };
      repo.save(u1);
      const u2: User = { id: 2292, name: 'user2292' };
      repo.save(u2);
      const u3: User = { id: 2293, name: 'user2293' };
      repo.save(u3);
      const u4: User = { id: 2294, name: 'user2294' };
      repo.save(u4);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(5);
      expect(list[0].id).assertEqual(2290);
      expect(list[4].id).assertEqual(2294);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0130 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_REPOBULKP2_13100
     * @tc.name      testRepoBulk0131
     * @tc.desc      Verify repository stores 1 user(s) for batch 130.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRepoBulk0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0131 begin');
      const repo: UserRepository = new UserRepository();
      const u0: User = { id: 2300, name: 'user2300' };
      repo.save(u0);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(1);
      expect(list[0].id).assertEqual(2300);
      expect(list[0].id).assertEqual(2300);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0131 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_REPOBULKP2_13200
     * @tc.name      testRepoBulk0132
     * @tc.desc      Verify repository stores 2 user(s) for batch 131.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRepoBulk0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0132 begin');
      const repo: UserRepository = new UserRepository();
      const u0: User = { id: 2310, name: 'user2310' };
      repo.save(u0);
      const u1: User = { id: 2311, name: 'user2311' };
      repo.save(u1);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(2);
      expect(list[0].id).assertEqual(2310);
      expect(list[1].id).assertEqual(2311);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0132 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_REPOBULKP2_13300
     * @tc.name      testRepoBulk0133
     * @tc.desc      Verify repository stores 3 user(s) for batch 132.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRepoBulk0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0133 begin');
      const repo: UserRepository = new UserRepository();
      const u0: User = { id: 2320, name: 'user2320' };
      repo.save(u0);
      const u1: User = { id: 2321, name: 'user2321' };
      repo.save(u1);
      const u2: User = { id: 2322, name: 'user2322' };
      repo.save(u2);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(3);
      expect(list[0].id).assertEqual(2320);
      expect(list[2].id).assertEqual(2322);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0133 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_REPOBULKP2_13400
     * @tc.name      testRepoBulk0134
     * @tc.desc      Verify repository stores 4 user(s) for batch 133.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRepoBulk0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0134 begin');
      const repo: UserRepository = new UserRepository();
      const u0: User = { id: 2330, name: 'user2330' };
      repo.save(u0);
      const u1: User = { id: 2331, name: 'user2331' };
      repo.save(u1);
      const u2: User = { id: 2332, name: 'user2332' };
      repo.save(u2);
      const u3: User = { id: 2333, name: 'user2333' };
      repo.save(u3);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(4);
      expect(list[0].id).assertEqual(2330);
      expect(list[3].id).assertEqual(2333);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0134 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_REPOBULKP2_13500
     * @tc.name      testRepoBulk0135
     * @tc.desc      Verify repository stores 5 user(s) for batch 134.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRepoBulk0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0135 begin');
      const repo: UserRepository = new UserRepository();
      const u0: User = { id: 2340, name: 'user2340' };
      repo.save(u0);
      const u1: User = { id: 2341, name: 'user2341' };
      repo.save(u1);
      const u2: User = { id: 2342, name: 'user2342' };
      repo.save(u2);
      const u3: User = { id: 2343, name: 'user2343' };
      repo.save(u3);
      const u4: User = { id: 2344, name: 'user2344' };
      repo.save(u4);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(5);
      expect(list[0].id).assertEqual(2340);
      expect(list[4].id).assertEqual(2344);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0135 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_REPOBULKP2_13600
     * @tc.name      testRepoBulk0136
     * @tc.desc      Verify repository stores 1 user(s) for batch 135.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRepoBulk0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0136 begin');
      const repo: UserRepository = new UserRepository();
      const u0: User = { id: 2350, name: 'user2350' };
      repo.save(u0);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(1);
      expect(list[0].id).assertEqual(2350);
      expect(list[0].id).assertEqual(2350);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0136 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_REPOBULKP2_13700
     * @tc.name      testRepoBulk0137
     * @tc.desc      Verify repository stores 2 user(s) for batch 136.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRepoBulk0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0137 begin');
      const repo: UserRepository = new UserRepository();
      const u0: User = { id: 2360, name: 'user2360' };
      repo.save(u0);
      const u1: User = { id: 2361, name: 'user2361' };
      repo.save(u1);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(2);
      expect(list[0].id).assertEqual(2360);
      expect(list[1].id).assertEqual(2361);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0137 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_REPOBULKP2_13800
     * @tc.name      testRepoBulk0138
     * @tc.desc      Verify repository stores 3 user(s) for batch 137.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRepoBulk0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0138 begin');
      const repo: UserRepository = new UserRepository();
      const u0: User = { id: 2370, name: 'user2370' };
      repo.save(u0);
      const u1: User = { id: 2371, name: 'user2371' };
      repo.save(u1);
      const u2: User = { id: 2372, name: 'user2372' };
      repo.save(u2);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(3);
      expect(list[0].id).assertEqual(2370);
      expect(list[2].id).assertEqual(2372);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0138 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_REPOBULKP2_13900
     * @tc.name      testRepoBulk0139
     * @tc.desc      Verify repository stores 4 user(s) for batch 138.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRepoBulk0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0139 begin');
      const repo: UserRepository = new UserRepository();
      const u0: User = { id: 2380, name: 'user2380' };
      repo.save(u0);
      const u1: User = { id: 2381, name: 'user2381' };
      repo.save(u1);
      const u2: User = { id: 2382, name: 'user2382' };
      repo.save(u2);
      const u3: User = { id: 2383, name: 'user2383' };
      repo.save(u3);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(4);
      expect(list[0].id).assertEqual(2380);
      expect(list[3].id).assertEqual(2383);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0139 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_REPOBULKP2_14000
     * @tc.name      testRepoBulk0140
     * @tc.desc      Verify repository stores 5 user(s) for batch 139.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRepoBulk0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0140 begin');
      const repo: UserRepository = new UserRepository();
      const u0: User = { id: 2390, name: 'user2390' };
      repo.save(u0);
      const u1: User = { id: 2391, name: 'user2391' };
      repo.save(u1);
      const u2: User = { id: 2392, name: 'user2392' };
      repo.save(u2);
      const u3: User = { id: 2393, name: 'user2393' };
      repo.save(u3);
      const u4: User = { id: 2394, name: 'user2394' };
      repo.save(u4);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(5);
      expect(list[0].id).assertEqual(2390);
      expect(list[4].id).assertEqual(2394);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0140 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_REPOBULKP2_14100
     * @tc.name      testRepoBulk0141
     * @tc.desc      Verify repository stores 1 user(s) for batch 140.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRepoBulk0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0141 begin');
      const repo: UserRepository = new UserRepository();
      const u0: User = { id: 2400, name: 'user2400' };
      repo.save(u0);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(1);
      expect(list[0].id).assertEqual(2400);
      expect(list[0].id).assertEqual(2400);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0141 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_REPOBULKP2_14200
     * @tc.name      testRepoBulk0142
     * @tc.desc      Verify repository stores 2 user(s) for batch 141.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRepoBulk0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0142 begin');
      const repo: UserRepository = new UserRepository();
      const u0: User = { id: 2410, name: 'user2410' };
      repo.save(u0);
      const u1: User = { id: 2411, name: 'user2411' };
      repo.save(u1);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(2);
      expect(list[0].id).assertEqual(2410);
      expect(list[1].id).assertEqual(2411);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0142 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_REPOBULKP2_14300
     * @tc.name      testRepoBulk0143
     * @tc.desc      Verify repository stores 3 user(s) for batch 142.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRepoBulk0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0143 begin');
      const repo: UserRepository = new UserRepository();
      const u0: User = { id: 2420, name: 'user2420' };
      repo.save(u0);
      const u1: User = { id: 2421, name: 'user2421' };
      repo.save(u1);
      const u2: User = { id: 2422, name: 'user2422' };
      repo.save(u2);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(3);
      expect(list[0].id).assertEqual(2420);
      expect(list[2].id).assertEqual(2422);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0143 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_REPOBULKP2_14400
     * @tc.name      testRepoBulk0144
     * @tc.desc      Verify repository stores 4 user(s) for batch 143.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRepoBulk0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0144 begin');
      const repo: UserRepository = new UserRepository();
      const u0: User = { id: 2430, name: 'user2430' };
      repo.save(u0);
      const u1: User = { id: 2431, name: 'user2431' };
      repo.save(u1);
      const u2: User = { id: 2432, name: 'user2432' };
      repo.save(u2);
      const u3: User = { id: 2433, name: 'user2433' };
      repo.save(u3);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(4);
      expect(list[0].id).assertEqual(2430);
      expect(list[3].id).assertEqual(2433);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0144 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_REPOBULKP2_14500
     * @tc.name      testRepoBulk0145
     * @tc.desc      Verify repository stores 5 user(s) for batch 144.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRepoBulk0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0145 begin');
      const repo: UserRepository = new UserRepository();
      const u0: User = { id: 2440, name: 'user2440' };
      repo.save(u0);
      const u1: User = { id: 2441, name: 'user2441' };
      repo.save(u1);
      const u2: User = { id: 2442, name: 'user2442' };
      repo.save(u2);
      const u3: User = { id: 2443, name: 'user2443' };
      repo.save(u3);
      const u4: User = { id: 2444, name: 'user2444' };
      repo.save(u4);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(5);
      expect(list[0].id).assertEqual(2440);
      expect(list[4].id).assertEqual(2444);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0145 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_REPOBULKP2_14600
     * @tc.name      testRepoBulk0146
     * @tc.desc      Verify repository stores 1 user(s) for batch 145.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRepoBulk0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0146 begin');
      const repo: UserRepository = new UserRepository();
      const u0: User = { id: 2450, name: 'user2450' };
      repo.save(u0);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(1);
      expect(list[0].id).assertEqual(2450);
      expect(list[0].id).assertEqual(2450);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0146 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_REPOBULKP2_14700
     * @tc.name      testRepoBulk0147
     * @tc.desc      Verify repository stores 2 user(s) for batch 146.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRepoBulk0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0147 begin');
      const repo: UserRepository = new UserRepository();
      const u0: User = { id: 2460, name: 'user2460' };
      repo.save(u0);
      const u1: User = { id: 2461, name: 'user2461' };
      repo.save(u1);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(2);
      expect(list[0].id).assertEqual(2460);
      expect(list[1].id).assertEqual(2461);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0147 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_REPOBULKP2_14800
     * @tc.name      testRepoBulk0148
     * @tc.desc      Verify repository stores 3 user(s) for batch 147.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRepoBulk0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0148 begin');
      const repo: UserRepository = new UserRepository();
      const u0: User = { id: 2470, name: 'user2470' };
      repo.save(u0);
      const u1: User = { id: 2471, name: 'user2471' };
      repo.save(u1);
      const u2: User = { id: 2472, name: 'user2472' };
      repo.save(u2);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(3);
      expect(list[0].id).assertEqual(2470);
      expect(list[2].id).assertEqual(2472);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0148 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_REPOBULKP2_14900
     * @tc.name      testRepoBulk0149
     * @tc.desc      Verify repository stores 4 user(s) for batch 148.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRepoBulk0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0149 begin');
      const repo: UserRepository = new UserRepository();
      const u0: User = { id: 2480, name: 'user2480' };
      repo.save(u0);
      const u1: User = { id: 2481, name: 'user2481' };
      repo.save(u1);
      const u2: User = { id: 2482, name: 'user2482' };
      repo.save(u2);
      const u3: User = { id: 2483, name: 'user2483' };
      repo.save(u3);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(4);
      expect(list[0].id).assertEqual(2480);
      expect(list[3].id).assertEqual(2483);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0149 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_REPOBULKP2_15000
     * @tc.name      testRepoBulk0150
     * @tc.desc      Verify repository stores 5 user(s) for batch 149.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRepoBulk0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0150 begin');
      const repo: UserRepository = new UserRepository();
      const u0: User = { id: 2490, name: 'user2490' };
      repo.save(u0);
      const u1: User = { id: 2491, name: 'user2491' };
      repo.save(u1);
      const u2: User = { id: 2492, name: 'user2492' };
      repo.save(u2);
      const u3: User = { id: 2493, name: 'user2493' };
      repo.save(u3);
      const u4: User = { id: 2494, name: 'user2494' };
      repo.save(u4);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(5);
      expect(list[0].id).assertEqual(2490);
      expect(list[4].id).assertEqual(2494);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepoBulk0150 end');
    })

  })
}
