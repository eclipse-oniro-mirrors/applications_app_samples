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

import { describe, it, expect } from '@ohos/hypium';
import { UserService, ProductService, createProduct } from '../../../main/ets/common/Service';
import { UserRepository } from '../../../main/ets/common/Repository';
import { User as CommonUser, Product as CommonProduct } from '../../../main/ets/common/Types';
import { User as ModuleUser, createUser, UserService as ModuleUserService } from '../../../main/ets/common/User';
import { logBegin, logEnd } from './ArkTSGuideUiSupport';

interface UserTrip {
  id: number;
  name: string;
  isNull: boolean;
  nameLength: number;
}

function probeFindById(service: UserService, id: number): UserTrip {
  const found: CommonUser | null = service.findById(id);
  if (found === null) {
    return { id: id, name: '', isNull: true, nameLength: 0 };
  }
  return { id: found.id, name: found.name, isNull: false, nameLength: found.name.length };
}

function countByIdName(samples: number[]): number {
  const service: UserService = new UserService();
  let matched: number = 0;
  for (let i = 0; i < samples.length; i++) {
    const found: CommonUser | null = service.findById(samples[i]);
    if (found !== null && found.id === samples[i] && found.name === 'Alice') {
      matched++;
    }
  }
  return matched;
}

/**
 * common/Service.ets, common/Repository.ets, common/User.ets 的导出契约。
 */
export default function ArkTSCommonServicesTest(): void {
  describe('ArkTSCommonServicesTest', () => {

    /**
     * @tc.number    SUB_ARKTS_GUIDE_COMMON_SERVICES_testUserServiceFindByIdPositive0001
     * @tc.name      testUserServiceFindByIdPositive0001
     * @tc.desc      Verify UserService.findById returns a user whose id echoes the argument
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL0
     */
    it('testUserServiceFindByIdPositive0001', 0, () => {
      logBegin('testUserServiceFindByIdPositive0001');
      const service: UserService = new UserService();
      const found: CommonUser | null = service.findById(7);
      expect(found !== null).assertTrue();
      const user: CommonUser = found as CommonUser;
      expect(user.id).assertEqual(7);
      expect(user.name).assertEqual('Alice');
      expect(typeof user.id).assertEqual('number');
      expect(user.name.length).assertEqual(5);
      logEnd('testUserServiceFindByIdPositive0001');
    });

    /**
     * @tc.number    SUB_ARKTS_GUIDE_COMMON_SERVICES_testUserServiceFindByIdOne0002
     * @tc.name      testUserServiceFindByIdOne0002
     * @tc.desc      Verify the smallest legal id 1 still produces a user
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL0
     */
    it('testUserServiceFindByIdOne0002', 0, () => {
      logBegin('testUserServiceFindByIdOne0002');
      const service: UserService = new UserService();
      const found: CommonUser | null = service.findById(1);
      expect(found === null).assertFalse();
      expect((found as CommonUser).id).assertEqual(1);
      expect((found as CommonUser).name).assertEqual('Alice');
      logEnd('testUserServiceFindByIdOne0002');
    });

    /**
     * @tc.number    SUB_ARKTS_GUIDE_COMMON_SERVICES_testUserServiceFindByIdZero0003
     * @tc.name      testUserServiceFindByIdZero0003
     * @tc.desc      Verify id 0 hits the boundary and returns null
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL0
     */
    it('testUserServiceFindByIdZero0003', 0, () => {
      logBegin('testUserServiceFindByIdZero0003');
      const service: UserService = new UserService();
      const found: CommonUser | null = service.findById(0);
      expect(found === null).assertTrue();
      expect(found).assertNull();
      expect(probeFindById(service, 0).isNull).assertTrue();
      logEnd('testUserServiceFindByIdZero0003');
    });

    /**
     * @tc.number    SUB_ARKTS_GUIDE_COMMON_SERVICES_testUserServiceFindByIdNegative0004
     * @tc.name      testUserServiceFindByIdNegative0004
     * @tc.desc      Verify negative ids are rejected with null instead of returning data
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL0
     */
    it('testUserServiceFindByIdNegative0004', 0, () => {
      logBegin('testUserServiceFindByIdNegative0004');
      const service: UserService = new UserService();
      expect(service.findById(-1) === null).assertTrue();
      expect(service.findById(-999999) === null).assertTrue();
      expect(probeFindById(service, -1).isNull).assertTrue();
      expect(probeFindById(service, -999999).nameLength).assertEqual(0);
      logEnd('testUserServiceFindByIdNegative0004');
    });

    /**
     * @tc.number    SUB_ARKTS_GUIDE_COMMON_SERVICES_testUserServiceIdEchoMatrix0005
     * @tc.name      testUserServiceIdEchoMatrix0005
     * @tc.desc      Verify id is echoed unchanged for a matrix of positive ids
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testUserServiceIdEchoMatrix0005', 0, () => {
      logBegin('testUserServiceIdEchoMatrix0005');
      const samples: number[] = [1, 2, 3, 42, 100, 1024, 65535, 2147483647];
      const service: UserService = new UserService();
      for (let i = 0; i < samples.length; i++) {
        const found: CommonUser | null = service.findById(samples[i]);
        expect(found === null).assertFalse();
        expect((found as CommonUser).id).assertEqual(samples[i]);
      }
      expect(countByIdName(samples)).assertEqual(samples.length);
      logEnd('testUserServiceIdEchoMatrix0005');
    });

    /**
     * @tc.number    SUB_ARKTS_GUIDE_COMMON_SERVICES_testUserServiceNonPositiveMatrix0006
     * @tc.name      testUserServiceNonPositiveMatrix0006
     * @tc.desc      Verify every non-positive id in the matrix yields null
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testUserServiceNonPositiveMatrix0006', 0, () => {
      logBegin('testUserServiceNonPositiveMatrix0006');
      const samples: number[] = [0, -1, -2, -1000, -2147483647];
      const service: UserService = new UserService();
      let nullCount: number = 0;
      for (let i = 0; i < samples.length; i++) {
        if (service.findById(samples[i]) === null) {
          nullCount++;
        }
      }
      expect(nullCount).assertEqual(samples.length);
      expect(service.findById(-5)).assertNull();
      logEnd('testUserServiceNonPositiveMatrix0006');
    });

    /**
     * @tc.number    SUB_ARKTS_GUIDE_COMMON_SERVICES_testUserServiceInstancesAreIndependent0007
     * @tc.name      testUserServiceInstancesAreIndependent0007
     * @tc.desc      Verify two UserService instances answer the same query identically
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testUserServiceInstancesAreIndependent0007', 0, () => {
      logBegin('testUserServiceInstancesAreIndependent0007');
      const first: UserService = new UserService();
      const second: UserService = new UserService();
      const left: CommonUser = first.findById(11) as CommonUser;
      const right: CommonUser = second.findById(11) as CommonUser;
      expect(left.id).assertEqual(right.id);
      expect(left.name).assertEqual(right.name);
      expect(left === right).assertFalse();
      logEnd('testUserServiceInstancesAreIndependent0007');
    });

    /**
     * @tc.number    SUB_ARKTS_GUIDE_COMMON_SERVICES_testProductServiceReturnsName0008
     * @tc.name      testProductServiceReturnsName0008
     * @tc.desc      Verify ProductService.getName returns the product name verbatim
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL0
     */
    it('testProductServiceReturnsName0008', 0, () => {
      logBegin('testProductServiceReturnsName0008');
      const service: ProductService = new ProductService();
      const product: CommonProduct = { id: 3, name: 'Pen' };
      expect(service.getName(product)).assertEqual('Pen');
      expect(service.getName(product).length).assertEqual(3);
      logEnd('testProductServiceReturnsName0008');
    });

    /**
     * @tc.number    SUB_ARKTS_GUIDE_COMMON_SERVICES_testProductServiceEmptyName0009
     * @tc.name      testProductServiceEmptyName0009
     * @tc.desc      Verify an empty product name is returned as an empty string
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testProductServiceEmptyName0009', 0, () => {
      logBegin('testProductServiceEmptyName0009');
      const service: ProductService = new ProductService();
      const product: CommonProduct = { id: 0, name: '' };
      expect(service.getName(product)).assertEqual('');
      expect(service.getName(product).length).assertEqual(0);
      logEnd('testProductServiceEmptyName0009');
    });

    /**
     * @tc.number    SUB_ARKTS_GUIDE_COMMON_SERVICES_testProductServiceNameMatrix0010
     * @tc.name      testProductServiceNameMatrix0010
     * @tc.desc      Verify a matrix of names round-trips through getName
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testProductServiceNameMatrix0010', 0, () => {
      logBegin('testProductServiceNameMatrix0010');
      const names: string[] = ['A', 'Book', 'ArkTS Guide', '123', '产品'];
      const service: ProductService = new ProductService();
      let matched: number = 0;
      for (let i = 0; i < names.length; i++) {
        if (service.getName({ id: i, name: names[i] }) === names[i]) {
          matched++;
        }
      }
      expect(matched).assertEqual(names.length);
      expect(service.getName({ id: 9, name: 'ArkTS Guide' })).assertEqual('ArkTS Guide');
      logEnd('testProductServiceNameMatrix0010');
    });

    /**
     * @tc.number    SUB_ARKTS_GUIDE_COMMON_SERVICES_testCreateProductCopiesName0011
     * @tc.name      testCreateProductCopiesName0011
     * @tc.desc      Verify createProduct keeps the name and pins id to 0
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL0
     */
    it('testCreateProductCopiesName0011', 0, () => {
      logBegin('testCreateProductCopiesName0011');
      const product: CommonProduct = createProduct('Laptop');
      expect(product.name).assertEqual('Laptop');
      expect(product.id).assertEqual(0);
      expect(product.name.length).assertEqual(6);
      logEnd('testCreateProductCopiesName0011');
    });

    /**
     * @tc.number    SUB_ARKTS_GUIDE_COMMON_SERVICES_testCreateProductEmptyName0012
     * @tc.name      testCreateProductEmptyName0012
     * @tc.desc      Verify createProduct accepts an empty name without throwing
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testCreateProductEmptyName0012', 0, () => {
      logBegin('testCreateProductEmptyName0012');
      const product: CommonProduct = createProduct('');
      expect(product.name).assertEqual('');
      expect(product.id).assertEqual(0);
      logEnd('testCreateProductEmptyName0012');
    });

    /**
     * @tc.number    SUB_ARKTS_GUIDE_COMMON_SERVICES_testCreateProductInstancesIndependent0013
     * @tc.name      testCreateProductInstancesIndependent0013
     * @tc.desc      Verify two created products do not share state
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testCreateProductInstancesIndependent0013', 0, () => {
      logBegin('testCreateProductInstancesIndependent0013');
      const first: CommonProduct = createProduct('One');
      const second: CommonProduct = createProduct('Two');
      expect(first.name).assertEqual('One');
      expect(second.name).assertEqual('Two');
      expect(first === second).assertFalse();
      logEnd('testCreateProductInstancesIndependent0013');
    });

    /**
     * @tc.number    SUB_ARKTS_GUIDE_COMMON_SERVICES_testRepositoryStartsEmpty0014
     * @tc.name      testRepositoryStartsEmpty0014
     * @tc.desc      Verify a fresh UserRepository lists zero users
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL0
     */
    it('testRepositoryStartsEmpty0014', 0, () => {
      logBegin('testRepositoryStartsEmpty0014');
      const repository: UserRepository = new UserRepository();
      expect(repository.list().length).assertEqual(0);
      expect(repository.list() instanceof Array).assertTrue();
      logEnd('testRepositoryStartsEmpty0014');
    });

    /**
     * @tc.number    SUB_ARKTS_GUIDE_COMMON_SERVICES_testRepositorySaveThenList0015
     * @tc.name      testRepositorySaveThenList0015
     * @tc.desc      Verify save appends and list returns the stored user
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL0
     */
    it('testRepositorySaveThenList0015', 0, () => {
      logBegin('testRepositorySaveThenList0015');
      const repository: UserRepository = new UserRepository();
      repository.save({ id: 1, name: 'Alice' });
      const listed: CommonUser[] = repository.list();
      expect(listed.length).assertEqual(1);
      expect(listed[0].id).assertEqual(1);
      expect(listed[0].name).assertEqual('Alice');
      logEnd('testRepositorySaveThenList0015');
    });

    /**
     * @tc.number    SUB_ARKTS_GUIDE_COMMON_SERVICES_testRepositoryKeepsInsertionOrder0016
     * @tc.name      testRepositoryKeepsInsertionOrder0016
     * @tc.desc      Verify the repository preserves insertion order for several users
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testRepositoryKeepsInsertionOrder0016', 0, () => {
      logBegin('testRepositoryKeepsInsertionOrder0016');
      const repository: UserRepository = new UserRepository();
      repository.save({ id: 3, name: 'C' });
      repository.save({ id: 1, name: 'A' });
      repository.save({ id: 2, name: 'B' });
      const listed: CommonUser[] = repository.list();
      expect(listed.length).assertEqual(3);
      expect(listed[0].name).assertEqual('C');
      expect(listed[1].name).assertEqual('A');
      expect(listed[2].name).assertEqual('B');
      logEnd('testRepositoryKeepsInsertionOrder0016');
    });

    /**
     * @tc.number    SUB_ARKTS_GUIDE_COMMON_SERVICES_testRepositoryInstancesIsolated0017
     * @tc.name      testRepositoryInstancesIsolated0017
     * @tc.desc      Verify separate repositories do not share their user list
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testRepositoryInstancesIsolated0017', 0, () => {
      logBegin('testRepositoryInstancesIsolated0017');
      const first: UserRepository = new UserRepository();
      const second: UserRepository = new UserRepository();
      first.save({ id: 1, name: 'Alice' });
      expect(first.list().length).assertEqual(1);
      expect(second.list().length).assertEqual(0);
      logEnd('testRepositoryInstancesIsolated0017');
    });

    /**
     * @tc.number    SUB_ARKTS_GUIDE_COMMON_SERVICES_testRepositoryListIsLive0018
     * @tc.name      testRepositoryListIsLive0018
     * @tc.desc      Verify list returns the live backing array so later saves are visible
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testRepositoryListIsLive0018', 0, () => {
      logBegin('testRepositoryListIsLive0018');
      const repository: UserRepository = new UserRepository();
      const snapshot: CommonUser[] = repository.list();
      expect(snapshot.length).assertEqual(0);
      repository.save({ id: 5, name: 'Eve' });
      expect(snapshot.length).assertEqual(1);
      expect(snapshot[0].name).assertEqual('Eve');
      logEnd('testRepositoryListIsLive0018');
    });

    /**
     * @tc.number    SUB_ARKTS_GUIDE_COMMON_SERVICES_testCreateUserCopiesFields0019
     * @tc.name      testCreateUserCopiesFields0019
     * @tc.desc      Verify User.createUser keeps both id and name
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL0
     */
    it('testCreateUserCopiesFields0019', 0, () => {
      logBegin('testCreateUserCopiesFields0019');
      const user: ModuleUser = createUser(8, 'Bob');
      expect(user.id).assertEqual(8);
      expect(user.name).assertEqual('Bob');
      expect(user.name.length).assertEqual(3);
      logEnd('testCreateUserCopiesFields0019');
    });

    /**
     * @tc.number    SUB_ARKTS_GUIDE_COMMON_SERVICES_testCreateUserEdgeValues0020
     * @tc.name      testCreateUserEdgeValues0020
     * @tc.desc      Verify createUser does not validate and copies zero/negative ids and empty names
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testCreateUserEdgeValues0020', 0, () => {
      logBegin('testCreateUserEdgeValues0020');
      const zero: ModuleUser = createUser(0, '');
      expect(zero.id).assertEqual(0);
      expect(zero.name).assertEqual('');
      const negative: ModuleUser = createUser(-9, 'Neg');
      expect(negative.id).assertEqual(-9);
      expect(negative.name).assertEqual('Neg');
      logEnd('testCreateUserEdgeValues0020');
    });

    /**
     * @tc.number    SUB_ARKTS_GUIDE_COMMON_SERVICES_testModuleUserServiceAddGetAll0021
     * @tc.name      testModuleUserServiceAddGetAll0021
     * @tc.desc      Verify the module-level UserService accumulates added users
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL0
     */
    it('testModuleUserServiceAddGetAll0021', 0, () => {
      logBegin('testModuleUserServiceAddGetAll0021');
      const service: ModuleUserService = new ModuleUserService();
      expect(service.getAll().length).assertEqual(0);
      service.add(createUser(1, 'Alice'));
      service.add(createUser(2, 'Bob'));
      const all: ModuleUser[] = service.getAll();
      expect(all.length).assertEqual(2);
      expect(all[0].name).assertEqual('Alice');
      expect(all[1].name).assertEqual('Bob');
      logEnd('testModuleUserServiceAddGetAll0021');
    });

    /**
     * @tc.number    SUB_ARKTS_GUIDE_COMMON_SERVICES_testModuleUserServicesIsolated0022
     * @tc.name      testModuleUserServicesIsolated0022
     * @tc.desc      Verify two module-level UserService instances keep separate stores
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testModuleUserServicesIsolated0022', 0, () => {
      logBegin('testModuleUserServicesIsolated0022');
      const first: ModuleUserService = new ModuleUserService();
      const second: ModuleUserService = new ModuleUserService();
      first.add(createUser(1, 'Alice'));
      expect(first.getAll().length).assertEqual(1);
      expect(second.getAll().length).assertEqual(0);
      second.add(createUser(2, 'Bob'));
      expect(second.getAll()[0].id).assertEqual(2);
      logEnd('testModuleUserServicesIsolated0022');
    });

  });
}
