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
import { describe, beforeEach, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { createProduct, ProductService } from '../../../main/ets/common/Service';
import { Product } from '../../../main/ets/common/Types';

const DOMAIN: number = 0xF815;
const TAG: string = '[Sample_ARKTS_GUIDE_PRODUCT]';

export default function ProductNameMatrixTest(): void {
  describe('ProductNameMatrixTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 20);
      });
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PRODUCT_testProductNameMatrix0001
     * @tc.name      testProductNameMatrix0001
     * @tc.desc      createProduct/ProductService.getName round-trip name #1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testProductNameMatrix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProductNameMatrix0001 begin');
      const name: string = "";
      const created: Product = createProduct(name);
      const service: ProductService = new ProductService();
      expect(created.id).assertEqual(0);
      expect(created.name).assertEqual(name);
      expect(created.name.length).assertEqual(name.length);
      expect(service.getName(created)).assertEqual(name);
      expect(service.getName({ id: 1, name: name })).assertEqual(name);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProductNameMatrix0001 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PRODUCT_testProductNameMatrix0002
     * @tc.name      testProductNameMatrix0002
     * @tc.desc      createProduct/ProductService.getName round-trip name #2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testProductNameMatrix0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProductNameMatrix0002 begin');
      const name: string = "A";
      const created: Product = createProduct(name);
      const service: ProductService = new ProductService();
      expect(created.id).assertEqual(0);
      expect(created.name).assertEqual(name);
      expect(created.name.length).assertEqual(name.length);
      expect(service.getName(created)).assertEqual(name);
      expect(service.getName({ id: 2, name: name })).assertEqual(name);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProductNameMatrix0002 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PRODUCT_testProductNameMatrix0003
     * @tc.name      testProductNameMatrix0003
     * @tc.desc      createProduct/ProductService.getName round-trip name #3.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testProductNameMatrix0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProductNameMatrix0003 begin');
      const name: string = "AB";
      const created: Product = createProduct(name);
      const service: ProductService = new ProductService();
      expect(created.id).assertEqual(0);
      expect(created.name).assertEqual(name);
      expect(created.name.length).assertEqual(name.length);
      expect(service.getName(created)).assertEqual(name);
      expect(service.getName({ id: 3, name: name })).assertEqual(name);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProductNameMatrix0003 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PRODUCT_testProductNameMatrix0004
     * @tc.name      testProductNameMatrix0004
     * @tc.desc      createProduct/ProductService.getName round-trip name #4.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testProductNameMatrix0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProductNameMatrix0004 begin');
      const name: string = "abc";
      const created: Product = createProduct(name);
      const service: ProductService = new ProductService();
      expect(created.id).assertEqual(0);
      expect(created.name).assertEqual(name);
      expect(created.name.length).assertEqual(name.length);
      expect(service.getName(created)).assertEqual(name);
      expect(service.getName({ id: 4, name: name })).assertEqual(name);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProductNameMatrix0004 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PRODUCT_testProductNameMatrix0005
     * @tc.name      testProductNameMatrix0005
     * @tc.desc      createProduct/ProductService.getName round-trip name #5.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testProductNameMatrix0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProductNameMatrix0005 begin');
      const name: string = "ArkTS";
      const created: Product = createProduct(name);
      const service: ProductService = new ProductService();
      expect(created.id).assertEqual(0);
      expect(created.name).assertEqual(name);
      expect(created.name.length).assertEqual(name.length);
      expect(service.getName(created)).assertEqual(name);
      expect(service.getName({ id: 5, name: name })).assertEqual(name);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProductNameMatrix0005 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PRODUCT_testProductNameMatrix0006
     * @tc.name      testProductNameMatrix0006
     * @tc.desc      createProduct/ProductService.getName round-trip name #6.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testProductNameMatrix0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProductNameMatrix0006 begin');
      const name: string = "Product";
      const created: Product = createProduct(name);
      const service: ProductService = new ProductService();
      expect(created.id).assertEqual(0);
      expect(created.name).assertEqual(name);
      expect(created.name.length).assertEqual(name.length);
      expect(service.getName(created)).assertEqual(name);
      expect(service.getName({ id: 6, name: name })).assertEqual(name);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProductNameMatrix0006 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PRODUCT_testProductNameMatrix0007
     * @tc.name      testProductNameMatrix0007
     * @tc.desc      createProduct/ProductService.getName round-trip name #7.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testProductNameMatrix0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProductNameMatrix0007 begin');
      const name: string = "xxxxxxxxxx";
      const created: Product = createProduct(name);
      const service: ProductService = new ProductService();
      expect(created.id).assertEqual(0);
      expect(created.name).assertEqual(name);
      expect(created.name.length).assertEqual(name.length);
      expect(service.getName(created)).assertEqual(name);
      expect(service.getName({ id: 7, name: name })).assertEqual(name);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProductNameMatrix0007 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PRODUCT_testProductNameMatrix0008
     * @tc.name      testProductNameMatrix0008
     * @tc.desc      createProduct/ProductService.getName round-trip name #8.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testProductNameMatrix0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProductNameMatrix0008 begin');
      const name: string = "中文";
      const created: Product = createProduct(name);
      const service: ProductService = new ProductService();
      expect(created.id).assertEqual(0);
      expect(created.name).assertEqual(name);
      expect(created.name.length).assertEqual(name.length);
      expect(service.getName(created)).assertEqual(name);
      expect(service.getName({ id: 8, name: name })).assertEqual(name);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProductNameMatrix0008 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PRODUCT_testProductNameMatrix0009
     * @tc.name      testProductNameMatrix0009
     * @tc.desc      createProduct/ProductService.getName round-trip name #9.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testProductNameMatrix0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProductNameMatrix0009 begin');
      const name: string = "12345";
      const created: Product = createProduct(name);
      const service: ProductService = new ProductService();
      expect(created.id).assertEqual(0);
      expect(created.name).assertEqual(name);
      expect(created.name.length).assertEqual(name.length);
      expect(service.getName(created)).assertEqual(name);
      expect(service.getName({ id: 9, name: name })).assertEqual(name);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProductNameMatrix0009 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PRODUCT_testProductNameMatrix0010
     * @tc.name      testProductNameMatrix0010
     * @tc.desc      createProduct/ProductService.getName round-trip name #10.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testProductNameMatrix0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProductNameMatrix0010 begin');
      const name: string = "a b";
      const created: Product = createProduct(name);
      const service: ProductService = new ProductService();
      expect(created.id).assertEqual(0);
      expect(created.name).assertEqual(name);
      expect(created.name.length).assertEqual(name.length);
      expect(service.getName(created)).assertEqual(name);
      expect(service.getName({ id: 10, name: name })).assertEqual(name);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProductNameMatrix0010 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PRODUCT_testProductNameMatrix0011
     * @tc.name      testProductNameMatrix0011
     * @tc.desc      createProduct/ProductService.getName round-trip name #11.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testProductNameMatrix0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProductNameMatrix0011 begin');
      const name: string = "tab\t";
      const created: Product = createProduct(name);
      const service: ProductService = new ProductService();
      expect(created.id).assertEqual(0);
      expect(created.name).assertEqual(name);
      expect(created.name.length).assertEqual(name.length);
      expect(service.getName(created)).assertEqual(name);
      expect(service.getName({ id: 11, name: name })).assertEqual(name);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProductNameMatrix0011 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PRODUCT_testProductNameMatrix0012
     * @tc.name      testProductNameMatrix0012
     * @tc.desc      createProduct/ProductService.getName round-trip name #12.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testProductNameMatrix0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProductNameMatrix0012 begin');
      const name: string = "line\n";
      const created: Product = createProduct(name);
      const service: ProductService = new ProductService();
      expect(created.id).assertEqual(0);
      expect(created.name).assertEqual(name);
      expect(created.name.length).assertEqual(name.length);
      expect(service.getName(created)).assertEqual(name);
      expect(service.getName({ id: 12, name: name })).assertEqual(name);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProductNameMatrix0012 end');
    })

  });
}
