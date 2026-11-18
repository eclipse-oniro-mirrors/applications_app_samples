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
import { UserRepository } from '../../../main/ets/common/Repository';
import { createUser, User as CreatedUser } from '../../../main/ets/common/User';
import { ProductService, createProduct } from '../../../main/ets/common/Service';
import { User, Product } from '../../../main/ets/common/Types';

const DOMAIN: number = 0xF815;
const TAG: string = '[Sample_ARKTS_GUIDE_EXT]';

function toUser(created: CreatedUser): User {
  return { id: created.id, name: created.name };
}

export default function AflgIntegrationPart1Test(): void {
  describe('AflgIntegrationPart1', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 20);
      });
    })


    /**
     * @tc.number    SUB_ARKTS_GUIDE_INTEGP1_0100
     * @tc.name      testUserPipeline0001
     * @tc.desc      Verify createUser -> repository round trip for id 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUserPipeline0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserPipeline0001 begin');
      const user: User = toUser(createUser(1, 'user1'));
      const repo: UserRepository = new UserRepository();
      repo.save(user);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(1);
      expect(list[0].id).assertEqual(1);
      expect(list[0].name).assertEqual('user1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserPipeline0001 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_INTEGP1_0200
     * @tc.name      testUserPipeline0002
     * @tc.desc      Verify createUser -> repository round trip for id 2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUserPipeline0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserPipeline0002 begin');
      const user: User = toUser(createUser(2, 'user2'));
      const repo: UserRepository = new UserRepository();
      repo.save(user);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(1);
      expect(list[0].id).assertEqual(2);
      expect(list[0].name).assertEqual('user2');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserPipeline0002 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_INTEGP1_0300
     * @tc.name      testUserPipeline0003
     * @tc.desc      Verify createUser -> repository round trip for id 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUserPipeline0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserPipeline0003 begin');
      const user: User = toUser(createUser(3, 'user3'));
      const repo: UserRepository = new UserRepository();
      repo.save(user);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(1);
      expect(list[0].id).assertEqual(3);
      expect(list[0].name).assertEqual('user3');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserPipeline0003 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_INTEGP1_0400
     * @tc.name      testUserPipeline0004
     * @tc.desc      Verify createUser -> repository round trip for id 4.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUserPipeline0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserPipeline0004 begin');
      const user: User = toUser(createUser(4, 'user4'));
      const repo: UserRepository = new UserRepository();
      repo.save(user);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(1);
      expect(list[0].id).assertEqual(4);
      expect(list[0].name).assertEqual('user4');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserPipeline0004 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_INTEGP1_0500
     * @tc.name      testUserPipeline0005
     * @tc.desc      Verify createUser -> repository round trip for id 5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUserPipeline0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserPipeline0005 begin');
      const user: User = toUser(createUser(5, 'user5'));
      const repo: UserRepository = new UserRepository();
      repo.save(user);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(1);
      expect(list[0].id).assertEqual(5);
      expect(list[0].name).assertEqual('user5');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserPipeline0005 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_INTEGP1_0600
     * @tc.name      testUserPipeline0006
     * @tc.desc      Verify createUser -> repository round trip for id 6.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUserPipeline0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserPipeline0006 begin');
      const user: User = toUser(createUser(6, 'user6'));
      const repo: UserRepository = new UserRepository();
      repo.save(user);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(1);
      expect(list[0].id).assertEqual(6);
      expect(list[0].name).assertEqual('user6');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserPipeline0006 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_INTEGP1_0700
     * @tc.name      testUserPipeline0007
     * @tc.desc      Verify createUser -> repository round trip for id 7.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUserPipeline0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserPipeline0007 begin');
      const user: User = toUser(createUser(7, 'user7'));
      const repo: UserRepository = new UserRepository();
      repo.save(user);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(1);
      expect(list[0].id).assertEqual(7);
      expect(list[0].name).assertEqual('user7');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserPipeline0007 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_INTEGP1_0800
     * @tc.name      testUserPipeline0008
     * @tc.desc      Verify createUser -> repository round trip for id 8.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUserPipeline0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserPipeline0008 begin');
      const user: User = toUser(createUser(8, 'user8'));
      const repo: UserRepository = new UserRepository();
      repo.save(user);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(1);
      expect(list[0].id).assertEqual(8);
      expect(list[0].name).assertEqual('user8');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserPipeline0008 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_INTEGP1_0900
     * @tc.name      testUserPipeline0009
     * @tc.desc      Verify createUser -> repository round trip for id 9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUserPipeline0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserPipeline0009 begin');
      const user: User = toUser(createUser(9, 'user9'));
      const repo: UserRepository = new UserRepository();
      repo.save(user);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(1);
      expect(list[0].id).assertEqual(9);
      expect(list[0].name).assertEqual('user9');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserPipeline0009 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_INTEGP1_1000
     * @tc.name      testUserPipeline0010
     * @tc.desc      Verify createUser -> repository round trip for id 10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUserPipeline0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserPipeline0010 begin');
      const user: User = toUser(createUser(10, 'user10'));
      const repo: UserRepository = new UserRepository();
      repo.save(user);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(1);
      expect(list[0].id).assertEqual(10);
      expect(list[0].name).assertEqual('user10');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserPipeline0010 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_INTEGP1_1100
     * @tc.name      testUserPipeline0011
     * @tc.desc      Verify createUser -> repository round trip for id 11.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUserPipeline0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserPipeline0011 begin');
      const user: User = toUser(createUser(11, 'user11'));
      const repo: UserRepository = new UserRepository();
      repo.save(user);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(1);
      expect(list[0].id).assertEqual(11);
      expect(list[0].name).assertEqual('user11');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserPipeline0011 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_INTEGP1_1200
     * @tc.name      testUserPipeline0012
     * @tc.desc      Verify createUser -> repository round trip for id 12.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUserPipeline0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserPipeline0012 begin');
      const user: User = toUser(createUser(12, 'user12'));
      const repo: UserRepository = new UserRepository();
      repo.save(user);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(1);
      expect(list[0].id).assertEqual(12);
      expect(list[0].name).assertEqual('user12');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserPipeline0012 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_INTEGP1_1300
     * @tc.name      testUserPipeline0013
     * @tc.desc      Verify createUser -> repository round trip for id 13.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUserPipeline0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserPipeline0013 begin');
      const user: User = toUser(createUser(13, 'user13'));
      const repo: UserRepository = new UserRepository();
      repo.save(user);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(1);
      expect(list[0].id).assertEqual(13);
      expect(list[0].name).assertEqual('user13');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserPipeline0013 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_INTEGP1_1400
     * @tc.name      testUserPipeline0014
     * @tc.desc      Verify createUser -> repository round trip for id 14.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUserPipeline0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserPipeline0014 begin');
      const user: User = toUser(createUser(14, 'user14'));
      const repo: UserRepository = new UserRepository();
      repo.save(user);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(1);
      expect(list[0].id).assertEqual(14);
      expect(list[0].name).assertEqual('user14');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserPipeline0014 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_INTEGP1_1500
     * @tc.name      testUserPipeline0015
     * @tc.desc      Verify createUser -> repository round trip for id 15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUserPipeline0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserPipeline0015 begin');
      const user: User = toUser(createUser(15, 'user15'));
      const repo: UserRepository = new UserRepository();
      repo.save(user);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(1);
      expect(list[0].id).assertEqual(15);
      expect(list[0].name).assertEqual('user15');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserPipeline0015 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_INTEGP1_1600
     * @tc.name      testUserPipeline0016
     * @tc.desc      Verify createUser -> repository round trip for id 16.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUserPipeline0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserPipeline0016 begin');
      const user: User = toUser(createUser(16, 'user16'));
      const repo: UserRepository = new UserRepository();
      repo.save(user);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(1);
      expect(list[0].id).assertEqual(16);
      expect(list[0].name).assertEqual('user16');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserPipeline0016 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_INTEGP1_1700
     * @tc.name      testUserPipeline0017
     * @tc.desc      Verify createUser -> repository round trip for id 17.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUserPipeline0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserPipeline0017 begin');
      const user: User = toUser(createUser(17, 'user17'));
      const repo: UserRepository = new UserRepository();
      repo.save(user);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(1);
      expect(list[0].id).assertEqual(17);
      expect(list[0].name).assertEqual('user17');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserPipeline0017 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_INTEGP1_1800
     * @tc.name      testUserPipeline0018
     * @tc.desc      Verify createUser -> repository round trip for id 18.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUserPipeline0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserPipeline0018 begin');
      const user: User = toUser(createUser(18, 'user18'));
      const repo: UserRepository = new UserRepository();
      repo.save(user);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(1);
      expect(list[0].id).assertEqual(18);
      expect(list[0].name).assertEqual('user18');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserPipeline0018 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_INTEGP1_1900
     * @tc.name      testUserPipeline0019
     * @tc.desc      Verify createUser -> repository round trip for id 19.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUserPipeline0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserPipeline0019 begin');
      const user: User = toUser(createUser(19, 'user19'));
      const repo: UserRepository = new UserRepository();
      repo.save(user);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(1);
      expect(list[0].id).assertEqual(19);
      expect(list[0].name).assertEqual('user19');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserPipeline0019 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_INTEGP1_2000
     * @tc.name      testUserPipeline0020
     * @tc.desc      Verify createUser -> repository round trip for id 20.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUserPipeline0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserPipeline0020 begin');
      const user: User = toUser(createUser(20, 'user20'));
      const repo: UserRepository = new UserRepository();
      repo.save(user);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(1);
      expect(list[0].id).assertEqual(20);
      expect(list[0].name).assertEqual('user20');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserPipeline0020 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_INTEGP1_2100
     * @tc.name      testUserPipeline0021
     * @tc.desc      Verify createUser -> repository round trip for id 21.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUserPipeline0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserPipeline0021 begin');
      const user: User = toUser(createUser(21, 'user21'));
      const repo: UserRepository = new UserRepository();
      repo.save(user);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(1);
      expect(list[0].id).assertEqual(21);
      expect(list[0].name).assertEqual('user21');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserPipeline0021 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_INTEGP1_2200
     * @tc.name      testUserPipeline0022
     * @tc.desc      Verify createUser -> repository round trip for id 22.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUserPipeline0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserPipeline0022 begin');
      const user: User = toUser(createUser(22, 'user22'));
      const repo: UserRepository = new UserRepository();
      repo.save(user);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(1);
      expect(list[0].id).assertEqual(22);
      expect(list[0].name).assertEqual('user22');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserPipeline0022 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_INTEGP1_2300
     * @tc.name      testUserPipeline0023
     * @tc.desc      Verify createUser -> repository round trip for id 23.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUserPipeline0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserPipeline0023 begin');
      const user: User = toUser(createUser(23, 'user23'));
      const repo: UserRepository = new UserRepository();
      repo.save(user);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(1);
      expect(list[0].id).assertEqual(23);
      expect(list[0].name).assertEqual('user23');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserPipeline0023 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_INTEGP1_2400
     * @tc.name      testUserPipeline0024
     * @tc.desc      Verify createUser -> repository round trip for id 24.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUserPipeline0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserPipeline0024 begin');
      const user: User = toUser(createUser(24, 'user24'));
      const repo: UserRepository = new UserRepository();
      repo.save(user);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(1);
      expect(list[0].id).assertEqual(24);
      expect(list[0].name).assertEqual('user24');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserPipeline0024 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_INTEGP1_2500
     * @tc.name      testUserPipeline0025
     * @tc.desc      Verify createUser -> repository round trip for id 25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testUserPipeline0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserPipeline0025 begin');
      const user: User = toUser(createUser(25, 'user25'));
      const repo: UserRepository = new UserRepository();
      repo.save(user);
      const list: User[] = repo.list();
      expect(list.length).assertEqual(1);
      expect(list[0].id).assertEqual(25);
      expect(list[0].name).assertEqual('user25');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testUserPipeline0025 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_INTEGP1_2600
     * @tc.name      testProductPipeline0026
     * @tc.desc      Verify createProduct -> ProductService round trip for integration_0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testProductPipeline0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProductPipeline0026 begin');
      const product: Product = createProduct('integration_0');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('integration_0');
      expect(product.id).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProductPipeline0026 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_INTEGP1_2700
     * @tc.name      testProductPipeline0027
     * @tc.desc      Verify createProduct -> ProductService round trip for integration_1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testProductPipeline0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProductPipeline0027 begin');
      const product: Product = createProduct('integration_1');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('integration_1');
      expect(product.id).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProductPipeline0027 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_INTEGP1_2800
     * @tc.name      testProductPipeline0028
     * @tc.desc      Verify createProduct -> ProductService round trip for integration_2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testProductPipeline0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProductPipeline0028 begin');
      const product: Product = createProduct('integration_2');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('integration_2');
      expect(product.id).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProductPipeline0028 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_INTEGP1_2900
     * @tc.name      testProductPipeline0029
     * @tc.desc      Verify createProduct -> ProductService round trip for integration_3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testProductPipeline0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProductPipeline0029 begin');
      const product: Product = createProduct('integration_3');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('integration_3');
      expect(product.id).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProductPipeline0029 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_INTEGP1_3000
     * @tc.name      testProductPipeline0030
     * @tc.desc      Verify createProduct -> ProductService round trip for integration_4.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testProductPipeline0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProductPipeline0030 begin');
      const product: Product = createProduct('integration_4');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('integration_4');
      expect(product.id).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProductPipeline0030 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_INTEGP1_3100
     * @tc.name      testProductPipeline0031
     * @tc.desc      Verify createProduct -> ProductService round trip for integration_5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testProductPipeline0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProductPipeline0031 begin');
      const product: Product = createProduct('integration_5');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('integration_5');
      expect(product.id).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProductPipeline0031 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_INTEGP1_3200
     * @tc.name      testProductPipeline0032
     * @tc.desc      Verify createProduct -> ProductService round trip for integration_6.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testProductPipeline0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProductPipeline0032 begin');
      const product: Product = createProduct('integration_6');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('integration_6');
      expect(product.id).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProductPipeline0032 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_INTEGP1_3300
     * @tc.name      testProductPipeline0033
     * @tc.desc      Verify createProduct -> ProductService round trip for integration_7.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testProductPipeline0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProductPipeline0033 begin');
      const product: Product = createProduct('integration_7');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('integration_7');
      expect(product.id).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProductPipeline0033 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_INTEGP1_3400
     * @tc.name      testProductPipeline0034
     * @tc.desc      Verify createProduct -> ProductService round trip for integration_8.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testProductPipeline0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProductPipeline0034 begin');
      const product: Product = createProduct('integration_8');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('integration_8');
      expect(product.id).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProductPipeline0034 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_INTEGP1_3500
     * @tc.name      testProductPipeline0035
     * @tc.desc      Verify createProduct -> ProductService round trip for integration_9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testProductPipeline0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProductPipeline0035 begin');
      const product: Product = createProduct('integration_9');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('integration_9');
      expect(product.id).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProductPipeline0035 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_INTEGP1_3600
     * @tc.name      testProductPipeline0036
     * @tc.desc      Verify createProduct -> ProductService round trip for integration_10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testProductPipeline0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProductPipeline0036 begin');
      const product: Product = createProduct('integration_10');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('integration_10');
      expect(product.id).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProductPipeline0036 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_INTEGP1_3700
     * @tc.name      testProductPipeline0037
     * @tc.desc      Verify createProduct -> ProductService round trip for integration_11.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testProductPipeline0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProductPipeline0037 begin');
      const product: Product = createProduct('integration_11');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('integration_11');
      expect(product.id).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProductPipeline0037 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_INTEGP1_3800
     * @tc.name      testProductPipeline0038
     * @tc.desc      Verify createProduct -> ProductService round trip for integration_12.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testProductPipeline0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProductPipeline0038 begin');
      const product: Product = createProduct('integration_12');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('integration_12');
      expect(product.id).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProductPipeline0038 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_INTEGP1_3900
     * @tc.name      testProductPipeline0039
     * @tc.desc      Verify createProduct -> ProductService round trip for integration_13.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testProductPipeline0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProductPipeline0039 begin');
      const product: Product = createProduct('integration_13');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('integration_13');
      expect(product.id).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProductPipeline0039 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_INTEGP1_4000
     * @tc.name      testProductPipeline0040
     * @tc.desc      Verify createProduct -> ProductService round trip for integration_14.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testProductPipeline0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProductPipeline0040 begin');
      const product: Product = createProduct('integration_14');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('integration_14');
      expect(product.id).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProductPipeline0040 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_INTEGP1_4100
     * @tc.name      testProductPipeline0041
     * @tc.desc      Verify createProduct -> ProductService round trip for integration_15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testProductPipeline0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProductPipeline0041 begin');
      const product: Product = createProduct('integration_15');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('integration_15');
      expect(product.id).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProductPipeline0041 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_INTEGP1_4200
     * @tc.name      testProductPipeline0042
     * @tc.desc      Verify createProduct -> ProductService round trip for integration_16.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testProductPipeline0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProductPipeline0042 begin');
      const product: Product = createProduct('integration_16');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('integration_16');
      expect(product.id).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProductPipeline0042 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_INTEGP1_4300
     * @tc.name      testProductPipeline0043
     * @tc.desc      Verify createProduct -> ProductService round trip for integration_17.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testProductPipeline0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProductPipeline0043 begin');
      const product: Product = createProduct('integration_17');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('integration_17');
      expect(product.id).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProductPipeline0043 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_INTEGP1_4400
     * @tc.name      testProductPipeline0044
     * @tc.desc      Verify createProduct -> ProductService round trip for integration_18.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testProductPipeline0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProductPipeline0044 begin');
      const product: Product = createProduct('integration_18');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('integration_18');
      expect(product.id).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProductPipeline0044 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_INTEGP1_4500
     * @tc.name      testProductPipeline0045
     * @tc.desc      Verify createProduct -> ProductService round trip for integration_19.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testProductPipeline0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProductPipeline0045 begin');
      const product: Product = createProduct('integration_19');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('integration_19');
      expect(product.id).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProductPipeline0045 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_INTEGP1_4600
     * @tc.name      testProductPipeline0046
     * @tc.desc      Verify createProduct -> ProductService round trip for integration_20.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testProductPipeline0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProductPipeline0046 begin');
      const product: Product = createProduct('integration_20');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('integration_20');
      expect(product.id).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProductPipeline0046 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_INTEGP1_4700
     * @tc.name      testProductPipeline0047
     * @tc.desc      Verify createProduct -> ProductService round trip for integration_21.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testProductPipeline0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProductPipeline0047 begin');
      const product: Product = createProduct('integration_21');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('integration_21');
      expect(product.id).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProductPipeline0047 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_INTEGP1_4800
     * @tc.name      testProductPipeline0048
     * @tc.desc      Verify createProduct -> ProductService round trip for integration_22.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testProductPipeline0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProductPipeline0048 begin');
      const product: Product = createProduct('integration_22');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('integration_22');
      expect(product.id).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProductPipeline0048 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_INTEGP1_4900
     * @tc.name      testProductPipeline0049
     * @tc.desc      Verify createProduct -> ProductService round trip for integration_23.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testProductPipeline0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProductPipeline0049 begin');
      const product: Product = createProduct('integration_23');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('integration_23');
      expect(product.id).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProductPipeline0049 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_INTEGP1_5000
     * @tc.name      testProductPipeline0050
     * @tc.desc      Verify createProduct -> ProductService round trip for integration_24.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testProductPipeline0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProductPipeline0050 begin');
      const product: Product = createProduct('integration_24');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('integration_24');
      expect(product.id).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProductPipeline0050 end');
    })

  })
}
