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
import { Product, ProductService, createProduct } from '../../../main/ets/pages/BarrelFileReexportMultiple';
import { User, UserRepository } from '../../../main/ets/pages/SubmoduleBarrelFile';
import { UserService as NamespaceStyleUserService } from '../../../main/ets/pages/UseModuleNotNamespace';
import { User as CommonUser, Product as CommonProduct } from '../../../main/ets/common/Types';
import { logBegin, logEnd } from './ArkTSGuideUiSupport';

function roundTripNames(service: ProductService, names: string[]): number {
  let matched: number = 0;
  for (let i = 0; i < names.length; i++) {
    if (service.getName({ id: i, name: names[i] }) === names[i]) {
      matched++;
    }
  }
  return matched;
}

/**
 * BarrelFileReexportMultiple.ets / SubmoduleBarrelFile.ets / UseModuleNotNamespace.ets 的再导出契约。
 */
export default function ArkTSBarrelModulesTest(): void {
  describe('ArkTSBarrelModulesTest', () => {

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BARREL_testBarrelReexportsProductService0001
     * @tc.name      testBarrelReexportsProductService0001
     * @tc.desc      Verify the barrel re-exports ProductService that reads product names
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL0
     */
    it('testBarrelReexportsProductService0001', 0, () => {
      logBegin('testBarrelReexportsProductService0001');
      const service: ProductService = new ProductService();
      const product: Product = { id: 1, name: 'Tablet' };
      expect(service.getName(product)).assertEqual('Tablet');
      expect(service.getName(product).length).assertEqual(6);
      logEnd('testBarrelReexportsProductService0001');
    });

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BARREL_testBarrelReexportsCreateProduct0002
     * @tc.name      testBarrelReexportsCreateProduct0002
     * @tc.desc      Verify the barrel re-exports createProduct with id pinned to zero
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL0
     */
    it('testBarrelReexportsCreateProduct0002', 0, () => {
      logBegin('testBarrelReexportsCreateProduct0002');
      const product: Product = createProduct('Monitor');
      expect(product.id).assertEqual(0);
      expect(product.name).assertEqual('Monitor');
      expect(new ProductService().getName(product)).assertEqual('Monitor');
      logEnd('testBarrelReexportsCreateProduct0002');
    });

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BARREL_testBarrelProductTypeCompatible0003
     * @tc.name      testBarrelProductTypeCompatible0003
     * @tc.desc      Verify the re-exported Product type is the same shape as common/Types Product
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testBarrelProductTypeCompatible0003', 0, () => {
      logBegin('testBarrelProductTypeCompatible0003');
      const viaBarrel: Product = { id: 4, name: 'Cable' };
      const common: CommonProduct = { id: viaBarrel.id, name: viaBarrel.name };
      expect(viaBarrel.id).assertEqual(4);
      expect(common.name).assertEqual('Cable');
      expect(new ProductService().getName(viaBarrel)).assertEqual(common.name);
      logEnd('testBarrelProductTypeCompatible0003');
    });

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BARREL_testBarrelProductServiceEmptyName0004
     * @tc.name      testBarrelProductServiceEmptyName0004
     * @tc.desc      Verify ProductService from the barrel returns an empty name unchanged
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testBarrelProductServiceEmptyName0004', 0, () => {
      logBegin('testBarrelProductServiceEmptyName0004');
      const service: ProductService = new ProductService();
      expect(service.getName({ id: 0, name: '' })).assertEqual('');
      expect(service.getName({ id: 0, name: '' }).length).assertEqual(0);
      logEnd('testBarrelProductServiceEmptyName0004');
    });

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BARREL_testBarrelNameMatrix0005
     * @tc.name      testBarrelNameMatrix0005
     * @tc.desc      Verify ProductService round-trips a matrix of product names
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testBarrelNameMatrix0005', 0, () => {
      logBegin('testBarrelNameMatrix0005');
      const names: string[] = ['A', 'Phone', 'Desk Lamp', '42', '商品'];
      expect(roundTripNames(new ProductService(), names)).assertEqual(names.length);
      expect(createProduct(names[1]).name).assertEqual('Phone');
      logEnd('testBarrelNameMatrix0005');
    });

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BARREL_testSubmoduleBarrelUserType0006
     * @tc.name      testSubmoduleBarrelUserType0006
     * @tc.desc      Verify the submodule barrel re-exports the User type
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL0
     */
    it('testSubmoduleBarrelUserType0006', 0, () => {
      logBegin('testSubmoduleBarrelUserType0006');
      const user: User = { id: 1, name: 'Alice' };
      expect(user.id).assertEqual(1);
      expect(user.name).assertEqual('Alice');
      expect(user.name.length).assertEqual(5);
      logEnd('testSubmoduleBarrelUserType0006');
    });

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BARREL_testSubmoduleBarrelUserCompatible0007
     * @tc.name      testSubmoduleBarrelUserCompatible0007
     * @tc.desc      Verify the submodule barrel User matches common/Types User
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testSubmoduleBarrelUserCompatible0007', 0, () => {
      logBegin('testSubmoduleBarrelUserCompatible0007');
      const common: CommonUser = { id: 9, name: 'Zoe' };
      const viaBarrel: User = { id: common.id, name: common.name };
      expect(viaBarrel.id).assertEqual(9);
      expect(viaBarrel.name).assertEqual('Zoe');
      expect(viaBarrel.name).assertEqual(common.name);
      logEnd('testSubmoduleBarrelUserCompatible0007');
    });

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BARREL_testSubmoduleBarrelRepositoryEmpty0008
     * @tc.name      testSubmoduleBarrelRepositoryEmpty0008
     * @tc.desc      Verify a repository created from the barrel export starts empty
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL0
     */
    it('testSubmoduleBarrelRepositoryEmpty0008', 0, () => {
      logBegin('testSubmoduleBarrelRepositoryEmpty0008');
      const repository: UserRepository = new UserRepository();
      expect(repository.list().length).assertEqual(0);
      expect(Array.isArray(repository.list())).assertTrue();
      logEnd('testSubmoduleBarrelRepositoryEmpty0008');
    });

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BARREL_testSubmoduleBarrelRepositorySave0009
     * @tc.name      testSubmoduleBarrelRepositorySave0009
     * @tc.desc      Verify save/list round-trip through the barrel-exported repository
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL0
     */
    it('testSubmoduleBarrelRepositorySave0009', 0, () => {
      logBegin('testSubmoduleBarrelRepositorySave0009');
      const repository: UserRepository = new UserRepository();
      const user: User = { id: 2, name: 'Bob' };
      repository.save(user);
      const listed: User[] = repository.list();
      expect(listed.length).assertEqual(1);
      expect(listed[0].id).assertEqual(2);
      expect(listed[0].name).assertEqual('Bob');
      logEnd('testSubmoduleBarrelRepositorySave0009');
    });

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BARREL_testSubmoduleBarrelRepositoryOrder0010
     * @tc.name      testSubmoduleBarrelRepositoryOrder0010
     * @tc.desc      Verify repository ordering through the barrel export
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testSubmoduleBarrelRepositoryOrder0010', 0, () => {
      logBegin('testSubmoduleBarrelRepositoryOrder0010');
      const repository: UserRepository = new UserRepository();
      repository.save({ id: 2, name: 'B' });
      repository.save({ id: 1, name: 'A' });
      const listed: User[] = repository.list();
      expect(listed.map((item: User) => item.name).join(',')).assertEqual('B,A');
      expect(listed.length).assertEqual(2);
      logEnd('testSubmoduleBarrelRepositoryOrder0010');
    });

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BARREL_testSubmoduleBarrelRepositoriesIsolated0011
     * @tc.name      testSubmoduleBarrelRepositoriesIsolated0011
     * @tc.desc      Verify two barrel repositories keep separate stores
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testSubmoduleBarrelRepositoriesIsolated0011', 0, () => {
      logBegin('testSubmoduleBarrelRepositoriesIsolated0011');
      const first: UserRepository = new UserRepository();
      const second: UserRepository = new UserRepository();
      first.save({ id: 1, name: 'Alice' });
      second.save({ id: 2, name: 'Bob' });
      expect(first.list()[0].name).assertEqual('Alice');
      expect(second.list()[0].name).assertEqual('Bob');
      expect(first.list().length).assertEqual(second.list().length);
      logEnd('testSubmoduleBarrelRepositoriesIsolated0011');
    });

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BARREL_testNamespaceStyleUserServiceEmpty0012
     * @tc.name      testNamespaceStyleUserServiceEmpty0012
     * @tc.desc      Verify UseModuleNotNamespace.UserService is an empty class with no own members
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL0
     */
    it('testNamespaceStyleUserServiceEmpty0012', 0, () => {
      logBegin('testNamespaceStyleUserServiceEmpty0012');
      const service: NamespaceStyleUserService = new NamespaceStyleUserService();
      expect(service instanceof NamespaceStyleUserService).assertTrue();
      expect(Object.keys(service).length).assertEqual(0);
      logEnd('testNamespaceStyleUserServiceEmpty0012');
    });

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BARREL_testNamespaceStyleUserServiceNoMethods0013
     * @tc.name      testNamespaceStyleUserServiceNoMethods0013
     * @tc.desc      Verify the empty class exposes no findById/getName style API
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testNamespaceStyleUserServiceNoMethods0013', 0, () => {
      logBegin('testNamespaceStyleUserServiceNoMethods0013');
      const service: NamespaceStyleUserService = new NamespaceStyleUserService();
      const keys: string[] = Object.getOwnPropertyNames(service);
      expect(keys.length).assertEqual(0);
      expect(keys.indexOf('findById')).assertEqual(-1);
      expect(keys.indexOf('getName')).assertEqual(-1);
      logEnd('testNamespaceStyleUserServiceNoMethods0013');
    });

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BARREL_testNamespaceStyleConstructTwice0014
     * @tc.name      testNamespaceStyleConstructTwice0014
     * @tc.desc      Verify constructing the empty class repeatedly yields distinct objects
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testNamespaceStyleConstructTwice0014', 0, () => {
      logBegin('testNamespaceStyleConstructTwice0014');
      const first: NamespaceStyleUserService = new NamespaceStyleUserService();
      const second: NamespaceStyleUserService = new NamespaceStyleUserService();
      expect(first === second).assertFalse();
      expect(first instanceof NamespaceStyleUserService).assertTrue();
      expect(second instanceof NamespaceStyleUserService).assertTrue();
      logEnd('testNamespaceStyleConstructTwice0014');
    });

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BARREL_testBarrelExportsSameBehaviorTwice0015
     * @tc.name      testBarrelExportsSameBehaviorTwice0015
     * @tc.desc      Verify behavior from the barrel is deterministic across repeated calls
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testBarrelExportsSameBehaviorTwice0015', 0, () => {
      logBegin('testBarrelExportsSameBehaviorTwice0015');
      expect(createProduct('A').name).assertEqual(createProduct('A').name);
      expect(new ProductService().getName({ id: 1, name: 'X' })).assertEqual(new ProductService().getName({ id: 1, name: 'X' }));
      logEnd('testBarrelExportsSameBehaviorTwice0015');
    });

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BARREL_testBarrelCreatedProductFeedIntoService0016
     * @tc.name      testBarrelCreatedProductFeedIntoService0016
     * @tc.desc      Verify a product built by the barrel factory can be read by the barrel service
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testBarrelCreatedProductFeedIntoService0016', 0, () => {
      logBegin('testBarrelCreatedProductFeedIntoService0016');
      const product: Product = createProduct('Charger');
      expect(new ProductService().getName(product)).assertEqual('Charger');
      expect(product.id).assertEqual(0);
      logEnd('testBarrelCreatedProductFeedIntoService0016');
    });

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BARREL_testBarrelRepositoryManyUsers0017
     * @tc.name      testBarrelRepositoryManyUsers0017
     * @tc.desc      Verify the repository stores many users and keeps ids intact
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testBarrelRepositoryManyUsers0017', 0, () => {
      logBegin('testBarrelRepositoryManyUsers0017');
      const repository: UserRepository = new UserRepository();
      for (let i = 0; i < 50; i++) {
        repository.save({ id: i, name: 'u' + i });
      }
      const listed: User[] = repository.list();
      expect(listed.length).assertEqual(50);
      expect(listed[0].id).assertEqual(0);
      expect(listed[49].id).assertEqual(49);
      expect(listed[49].name).assertEqual('u49');
      logEnd('testBarrelRepositoryManyUsers0017');
    });

    /**
     * @tc.number    SUB_ARKTS_GUIDE_BARREL_testBarrelTypesAreErasedAtRuntime0018
     * @tc.name      testBarrelTypesAreErasedAtRuntime0018
     * @tc.desc      Verify interface-only exports carry no runtime object and objects stay plain
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testBarrelTypesAreErasedAtRuntime0018', 0, () => {
      logBegin('testBarrelTypesAreErasedAtRuntime0018');
      const user: User = { id: 1, name: 'A' };
      const keys: string[] = Object.keys(user);
      expect(keys.length).assertEqual(2);
      expect(keys.join(',')).assertEqual('id,name');
      const userKeys: string[] = Object.keys(user);
      expect(userKeys.indexOf('save')).assertEqual(-1);
      logEnd('testBarrelTypesAreErasedAtRuntime0018');
    });

  });
}
