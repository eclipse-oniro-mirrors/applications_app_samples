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
import { ProductService, createProduct } from '../../../main/ets/common/Service';
import { Product } from '../../../main/ets/common/Types';

const DOMAIN: number = 0xF815;
const TAG: string = '[Sample_ARKTS_GUIDE_EXT]';

export default function ProductFactoryMatrixPart1Test(): void {
  describe('ProductFactoryMatrixPart1', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 20);
      });
    })


    /**
     * @tc.number    SUB_ARKTS_GUIDE_PRODUCTP1_0100
     * @tc.name      testProduct0001
     * @tc.desc      Verify createProduct/ProductService keep name product_0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testProduct0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0001 begin');
      const product: Product = createProduct('product_0');
      expect(product.id).assertEqual(0);
      expect(product.name).assertEqual('product_0');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('product_0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0001 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PRODUCTP1_0200
     * @tc.name      testProduct0002
     * @tc.desc      Verify createProduct/ProductService keep name product_1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testProduct0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0002 begin');
      const product: Product = createProduct('product_1');
      expect(product.id).assertEqual(0);
      expect(product.name).assertEqual('product_1');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('product_1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0002 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PRODUCTP1_0300
     * @tc.name      testProduct0003
     * @tc.desc      Verify createProduct/ProductService keep name product_2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testProduct0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0003 begin');
      const product: Product = createProduct('product_2');
      expect(product.id).assertEqual(0);
      expect(product.name).assertEqual('product_2');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('product_2');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0003 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PRODUCTP1_0400
     * @tc.name      testProduct0004
     * @tc.desc      Verify createProduct/ProductService keep name product_3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testProduct0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0004 begin');
      const product: Product = createProduct('product_3');
      expect(product.id).assertEqual(0);
      expect(product.name).assertEqual('product_3');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('product_3');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0004 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PRODUCTP1_0500
     * @tc.name      testProduct0005
     * @tc.desc      Verify createProduct/ProductService keep name product_4.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testProduct0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0005 begin');
      const product: Product = createProduct('product_4');
      expect(product.id).assertEqual(0);
      expect(product.name).assertEqual('product_4');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('product_4');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0005 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PRODUCTP1_0600
     * @tc.name      testProduct0006
     * @tc.desc      Verify createProduct/ProductService keep name product_5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testProduct0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0006 begin');
      const product: Product = createProduct('product_5');
      expect(product.id).assertEqual(0);
      expect(product.name).assertEqual('product_5');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('product_5');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0006 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PRODUCTP1_0700
     * @tc.name      testProduct0007
     * @tc.desc      Verify createProduct/ProductService keep name product_6.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testProduct0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0007 begin');
      const product: Product = createProduct('product_6');
      expect(product.id).assertEqual(0);
      expect(product.name).assertEqual('product_6');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('product_6');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0007 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PRODUCTP1_0800
     * @tc.name      testProduct0008
     * @tc.desc      Verify createProduct/ProductService keep name product_7.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testProduct0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0008 begin');
      const product: Product = createProduct('product_7');
      expect(product.id).assertEqual(0);
      expect(product.name).assertEqual('product_7');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('product_7');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0008 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PRODUCTP1_0900
     * @tc.name      testProduct0009
     * @tc.desc      Verify createProduct/ProductService keep name product_8.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testProduct0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0009 begin');
      const product: Product = createProduct('product_8');
      expect(product.id).assertEqual(0);
      expect(product.name).assertEqual('product_8');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('product_8');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0009 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PRODUCTP1_1000
     * @tc.name      testProduct0010
     * @tc.desc      Verify createProduct/ProductService keep name product_9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testProduct0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0010 begin');
      const product: Product = createProduct('product_9');
      expect(product.id).assertEqual(0);
      expect(product.name).assertEqual('product_9');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('product_9');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0010 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PRODUCTP1_1100
     * @tc.name      testProduct0011
     * @tc.desc      Verify createProduct/ProductService keep name product_10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testProduct0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0011 begin');
      const product: Product = createProduct('product_10');
      expect(product.id).assertEqual(0);
      expect(product.name).assertEqual('product_10');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('product_10');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0011 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PRODUCTP1_1200
     * @tc.name      testProduct0012
     * @tc.desc      Verify createProduct/ProductService keep name product_11.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testProduct0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0012 begin');
      const product: Product = createProduct('product_11');
      expect(product.id).assertEqual(0);
      expect(product.name).assertEqual('product_11');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('product_11');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0012 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PRODUCTP1_1300
     * @tc.name      testProduct0013
     * @tc.desc      Verify createProduct/ProductService keep name product_12.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testProduct0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0013 begin');
      const product: Product = createProduct('product_12');
      expect(product.id).assertEqual(0);
      expect(product.name).assertEqual('product_12');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('product_12');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0013 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PRODUCTP1_1400
     * @tc.name      testProduct0014
     * @tc.desc      Verify createProduct/ProductService keep name product_13.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testProduct0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0014 begin');
      const product: Product = createProduct('product_13');
      expect(product.id).assertEqual(0);
      expect(product.name).assertEqual('product_13');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('product_13');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0014 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PRODUCTP1_1500
     * @tc.name      testProduct0015
     * @tc.desc      Verify createProduct/ProductService keep name product_14.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testProduct0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0015 begin');
      const product: Product = createProduct('product_14');
      expect(product.id).assertEqual(0);
      expect(product.name).assertEqual('product_14');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('product_14');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0015 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PRODUCTP1_1600
     * @tc.name      testProduct0016
     * @tc.desc      Verify createProduct/ProductService keep name product_15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testProduct0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0016 begin');
      const product: Product = createProduct('product_15');
      expect(product.id).assertEqual(0);
      expect(product.name).assertEqual('product_15');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('product_15');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0016 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PRODUCTP1_1700
     * @tc.name      testProduct0017
     * @tc.desc      Verify createProduct/ProductService keep name product_16.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testProduct0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0017 begin');
      const product: Product = createProduct('product_16');
      expect(product.id).assertEqual(0);
      expect(product.name).assertEqual('product_16');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('product_16');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0017 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PRODUCTP1_1800
     * @tc.name      testProduct0018
     * @tc.desc      Verify createProduct/ProductService keep name product_17.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testProduct0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0018 begin');
      const product: Product = createProduct('product_17');
      expect(product.id).assertEqual(0);
      expect(product.name).assertEqual('product_17');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('product_17');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0018 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PRODUCTP1_1900
     * @tc.name      testProduct0019
     * @tc.desc      Verify createProduct/ProductService keep name product_18.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testProduct0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0019 begin');
      const product: Product = createProduct('product_18');
      expect(product.id).assertEqual(0);
      expect(product.name).assertEqual('product_18');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('product_18');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0019 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PRODUCTP1_2000
     * @tc.name      testProduct0020
     * @tc.desc      Verify createProduct/ProductService keep name product_19.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testProduct0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0020 begin');
      const product: Product = createProduct('product_19');
      expect(product.id).assertEqual(0);
      expect(product.name).assertEqual('product_19');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('product_19');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0020 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PRODUCTP1_2100
     * @tc.name      testProduct0021
     * @tc.desc      Verify createProduct/ProductService keep name product_20.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testProduct0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0021 begin');
      const product: Product = createProduct('product_20');
      expect(product.id).assertEqual(0);
      expect(product.name).assertEqual('product_20');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('product_20');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0021 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PRODUCTP1_2200
     * @tc.name      testProduct0022
     * @tc.desc      Verify createProduct/ProductService keep name product_21.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testProduct0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0022 begin');
      const product: Product = createProduct('product_21');
      expect(product.id).assertEqual(0);
      expect(product.name).assertEqual('product_21');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('product_21');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0022 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PRODUCTP1_2300
     * @tc.name      testProduct0023
     * @tc.desc      Verify createProduct/ProductService keep name product_22.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testProduct0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0023 begin');
      const product: Product = createProduct('product_22');
      expect(product.id).assertEqual(0);
      expect(product.name).assertEqual('product_22');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('product_22');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0023 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PRODUCTP1_2400
     * @tc.name      testProduct0024
     * @tc.desc      Verify createProduct/ProductService keep name product_23.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testProduct0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0024 begin');
      const product: Product = createProduct('product_23');
      expect(product.id).assertEqual(0);
      expect(product.name).assertEqual('product_23');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('product_23');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0024 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PRODUCTP1_2500
     * @tc.name      testProduct0025
     * @tc.desc      Verify createProduct/ProductService keep name product_24.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testProduct0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0025 begin');
      const product: Product = createProduct('product_24');
      expect(product.id).assertEqual(0);
      expect(product.name).assertEqual('product_24');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('product_24');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0025 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PRODUCTP1_2600
     * @tc.name      testProduct0026
     * @tc.desc      Verify createProduct/ProductService keep name product_25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testProduct0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0026 begin');
      const product: Product = createProduct('product_25');
      expect(product.id).assertEqual(0);
      expect(product.name).assertEqual('product_25');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('product_25');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0026 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PRODUCTP1_2700
     * @tc.name      testProduct0027
     * @tc.desc      Verify createProduct/ProductService keep name product_26.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testProduct0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0027 begin');
      const product: Product = createProduct('product_26');
      expect(product.id).assertEqual(0);
      expect(product.name).assertEqual('product_26');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('product_26');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0027 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PRODUCTP1_2800
     * @tc.name      testProduct0028
     * @tc.desc      Verify createProduct/ProductService keep name product_27.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testProduct0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0028 begin');
      const product: Product = createProduct('product_27');
      expect(product.id).assertEqual(0);
      expect(product.name).assertEqual('product_27');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('product_27');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0028 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PRODUCTP1_2900
     * @tc.name      testProduct0029
     * @tc.desc      Verify createProduct/ProductService keep name product_28.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testProduct0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0029 begin');
      const product: Product = createProduct('product_28');
      expect(product.id).assertEqual(0);
      expect(product.name).assertEqual('product_28');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('product_28');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0029 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PRODUCTP1_3000
     * @tc.name      testProduct0030
     * @tc.desc      Verify createProduct/ProductService keep name product_29.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testProduct0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0030 begin');
      const product: Product = createProduct('product_29');
      expect(product.id).assertEqual(0);
      expect(product.name).assertEqual('product_29');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('product_29');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0030 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PRODUCTP1_3100
     * @tc.name      testProduct0031
     * @tc.desc      Verify createProduct/ProductService keep name product_30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testProduct0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0031 begin');
      const product: Product = createProduct('product_30');
      expect(product.id).assertEqual(0);
      expect(product.name).assertEqual('product_30');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('product_30');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0031 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PRODUCTP1_3200
     * @tc.name      testProduct0032
     * @tc.desc      Verify createProduct/ProductService keep name product_31.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testProduct0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0032 begin');
      const product: Product = createProduct('product_31');
      expect(product.id).assertEqual(0);
      expect(product.name).assertEqual('product_31');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('product_31');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0032 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PRODUCTP1_3300
     * @tc.name      testProduct0033
     * @tc.desc      Verify createProduct/ProductService keep name product_32.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testProduct0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0033 begin');
      const product: Product = createProduct('product_32');
      expect(product.id).assertEqual(0);
      expect(product.name).assertEqual('product_32');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('product_32');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0033 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PRODUCTP1_3400
     * @tc.name      testProduct0034
     * @tc.desc      Verify createProduct/ProductService keep name product_33.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testProduct0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0034 begin');
      const product: Product = createProduct('product_33');
      expect(product.id).assertEqual(0);
      expect(product.name).assertEqual('product_33');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('product_33');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0034 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PRODUCTP1_3500
     * @tc.name      testProduct0035
     * @tc.desc      Verify createProduct/ProductService keep name product_34.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testProduct0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0035 begin');
      const product: Product = createProduct('product_34');
      expect(product.id).assertEqual(0);
      expect(product.name).assertEqual('product_34');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('product_34');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0035 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PRODUCTP1_3600
     * @tc.name      testProduct0036
     * @tc.desc      Verify createProduct/ProductService keep name product_35.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testProduct0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0036 begin');
      const product: Product = createProduct('product_35');
      expect(product.id).assertEqual(0);
      expect(product.name).assertEqual('product_35');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('product_35');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0036 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PRODUCTP1_3700
     * @tc.name      testProduct0037
     * @tc.desc      Verify createProduct/ProductService keep name product_36.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testProduct0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0037 begin');
      const product: Product = createProduct('product_36');
      expect(product.id).assertEqual(0);
      expect(product.name).assertEqual('product_36');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('product_36');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0037 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PRODUCTP1_3800
     * @tc.name      testProduct0038
     * @tc.desc      Verify createProduct/ProductService keep name product_37.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testProduct0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0038 begin');
      const product: Product = createProduct('product_37');
      expect(product.id).assertEqual(0);
      expect(product.name).assertEqual('product_37');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('product_37');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0038 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PRODUCTP1_3900
     * @tc.name      testProduct0039
     * @tc.desc      Verify createProduct/ProductService keep name product_38.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testProduct0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0039 begin');
      const product: Product = createProduct('product_38');
      expect(product.id).assertEqual(0);
      expect(product.name).assertEqual('product_38');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('product_38');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0039 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PRODUCTP1_4000
     * @tc.name      testProduct0040
     * @tc.desc      Verify createProduct/ProductService keep name product_39.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testProduct0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0040 begin');
      const product: Product = createProduct('product_39');
      expect(product.id).assertEqual(0);
      expect(product.name).assertEqual('product_39');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('product_39');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0040 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PRODUCTP1_4100
     * @tc.name      testProduct0041
     * @tc.desc      Verify createProduct/ProductService keep name product_40.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testProduct0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0041 begin');
      const product: Product = createProduct('product_40');
      expect(product.id).assertEqual(0);
      expect(product.name).assertEqual('product_40');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('product_40');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0041 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PRODUCTP1_4200
     * @tc.name      testProduct0042
     * @tc.desc      Verify createProduct/ProductService keep name product_41.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testProduct0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0042 begin');
      const product: Product = createProduct('product_41');
      expect(product.id).assertEqual(0);
      expect(product.name).assertEqual('product_41');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('product_41');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0042 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PRODUCTP1_4300
     * @tc.name      testProduct0043
     * @tc.desc      Verify createProduct/ProductService keep name product_42.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testProduct0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0043 begin');
      const product: Product = createProduct('product_42');
      expect(product.id).assertEqual(0);
      expect(product.name).assertEqual('product_42');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('product_42');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0043 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PRODUCTP1_4400
     * @tc.name      testProduct0044
     * @tc.desc      Verify createProduct/ProductService keep name product_43.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testProduct0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0044 begin');
      const product: Product = createProduct('product_43');
      expect(product.id).assertEqual(0);
      expect(product.name).assertEqual('product_43');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('product_43');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0044 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PRODUCTP1_4500
     * @tc.name      testProduct0045
     * @tc.desc      Verify createProduct/ProductService keep name product_44.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testProduct0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0045 begin');
      const product: Product = createProduct('product_44');
      expect(product.id).assertEqual(0);
      expect(product.name).assertEqual('product_44');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('product_44');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0045 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PRODUCTP1_4600
     * @tc.name      testProduct0046
     * @tc.desc      Verify createProduct/ProductService keep name product_45.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testProduct0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0046 begin');
      const product: Product = createProduct('product_45');
      expect(product.id).assertEqual(0);
      expect(product.name).assertEqual('product_45');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('product_45');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0046 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PRODUCTP1_4700
     * @tc.name      testProduct0047
     * @tc.desc      Verify createProduct/ProductService keep name product_46.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testProduct0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0047 begin');
      const product: Product = createProduct('product_46');
      expect(product.id).assertEqual(0);
      expect(product.name).assertEqual('product_46');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('product_46');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0047 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PRODUCTP1_4800
     * @tc.name      testProduct0048
     * @tc.desc      Verify createProduct/ProductService keep name product_47.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testProduct0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0048 begin');
      const product: Product = createProduct('product_47');
      expect(product.id).assertEqual(0);
      expect(product.name).assertEqual('product_47');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('product_47');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0048 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PRODUCTP1_4900
     * @tc.name      testProduct0049
     * @tc.desc      Verify createProduct/ProductService keep name product_48.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testProduct0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0049 begin');
      const product: Product = createProduct('product_48');
      expect(product.id).assertEqual(0);
      expect(product.name).assertEqual('product_48');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('product_48');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0049 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PRODUCTP1_5000
     * @tc.name      testProduct0050
     * @tc.desc      Verify createProduct/ProductService keep name product_49.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testProduct0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0050 begin');
      const product: Product = createProduct('product_49');
      expect(product.id).assertEqual(0);
      expect(product.name).assertEqual('product_49');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('product_49');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0050 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PRODUCTP1_5100
     * @tc.name      testProduct0051
     * @tc.desc      Verify createProduct/ProductService keep name product_50.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testProduct0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0051 begin');
      const product: Product = createProduct('product_50');
      expect(product.id).assertEqual(0);
      expect(product.name).assertEqual('product_50');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('product_50');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0051 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PRODUCTP1_5200
     * @tc.name      testProduct0052
     * @tc.desc      Verify createProduct/ProductService keep name product_51.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testProduct0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0052 begin');
      const product: Product = createProduct('product_51');
      expect(product.id).assertEqual(0);
      expect(product.name).assertEqual('product_51');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('product_51');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0052 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PRODUCTP1_5300
     * @tc.name      testProduct0053
     * @tc.desc      Verify createProduct/ProductService keep name product_52.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testProduct0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0053 begin');
      const product: Product = createProduct('product_52');
      expect(product.id).assertEqual(0);
      expect(product.name).assertEqual('product_52');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('product_52');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0053 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PRODUCTP1_5400
     * @tc.name      testProduct0054
     * @tc.desc      Verify createProduct/ProductService keep name product_53.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testProduct0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0054 begin');
      const product: Product = createProduct('product_53');
      expect(product.id).assertEqual(0);
      expect(product.name).assertEqual('product_53');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('product_53');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0054 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PRODUCTP1_5500
     * @tc.name      testProduct0055
     * @tc.desc      Verify createProduct/ProductService keep name product_54.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testProduct0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0055 begin');
      const product: Product = createProduct('product_54');
      expect(product.id).assertEqual(0);
      expect(product.name).assertEqual('product_54');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('product_54');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0055 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PRODUCTP1_5600
     * @tc.name      testProduct0056
     * @tc.desc      Verify createProduct/ProductService keep name product_55.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testProduct0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0056 begin');
      const product: Product = createProduct('product_55');
      expect(product.id).assertEqual(0);
      expect(product.name).assertEqual('product_55');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('product_55');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0056 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PRODUCTP1_5700
     * @tc.name      testProduct0057
     * @tc.desc      Verify createProduct/ProductService keep name product_56.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testProduct0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0057 begin');
      const product: Product = createProduct('product_56');
      expect(product.id).assertEqual(0);
      expect(product.name).assertEqual('product_56');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('product_56');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0057 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PRODUCTP1_5800
     * @tc.name      testProduct0058
     * @tc.desc      Verify createProduct/ProductService keep name product_57.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testProduct0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0058 begin');
      const product: Product = createProduct('product_57');
      expect(product.id).assertEqual(0);
      expect(product.name).assertEqual('product_57');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('product_57');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0058 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PRODUCTP1_5900
     * @tc.name      testProduct0059
     * @tc.desc      Verify createProduct/ProductService keep name product_58.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testProduct0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0059 begin');
      const product: Product = createProduct('product_58');
      expect(product.id).assertEqual(0);
      expect(product.name).assertEqual('product_58');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('product_58');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0059 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PRODUCTP1_6000
     * @tc.name      testProduct0060
     * @tc.desc      Verify createProduct/ProductService keep name product_59.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testProduct0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0060 begin');
      const product: Product = createProduct('product_59');
      expect(product.id).assertEqual(0);
      expect(product.name).assertEqual('product_59');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('product_59');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0060 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PRODUCTP1_6100
     * @tc.name      testProduct0061
     * @tc.desc      Verify createProduct/ProductService keep name product_60.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testProduct0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0061 begin');
      const product: Product = createProduct('product_60');
      expect(product.id).assertEqual(0);
      expect(product.name).assertEqual('product_60');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('product_60');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0061 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PRODUCTP1_6200
     * @tc.name      testProduct0062
     * @tc.desc      Verify createProduct/ProductService keep name product_61.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testProduct0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0062 begin');
      const product: Product = createProduct('product_61');
      expect(product.id).assertEqual(0);
      expect(product.name).assertEqual('product_61');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('product_61');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0062 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PRODUCTP1_6300
     * @tc.name      testProduct0063
     * @tc.desc      Verify createProduct/ProductService keep name product_62.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testProduct0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0063 begin');
      const product: Product = createProduct('product_62');
      expect(product.id).assertEqual(0);
      expect(product.name).assertEqual('product_62');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('product_62');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0063 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PRODUCTP1_6400
     * @tc.name      testProduct0064
     * @tc.desc      Verify createProduct/ProductService keep name product_63.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testProduct0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0064 begin');
      const product: Product = createProduct('product_63');
      expect(product.id).assertEqual(0);
      expect(product.name).assertEqual('product_63');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('product_63');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0064 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PRODUCTP1_6500
     * @tc.name      testProduct0065
     * @tc.desc      Verify createProduct/ProductService keep name product_64.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testProduct0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0065 begin');
      const product: Product = createProduct('product_64');
      expect(product.id).assertEqual(0);
      expect(product.name).assertEqual('product_64');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('product_64');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0065 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PRODUCTP1_6600
     * @tc.name      testProduct0066
     * @tc.desc      Verify createProduct/ProductService keep name product_65.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testProduct0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0066 begin');
      const product: Product = createProduct('product_65');
      expect(product.id).assertEqual(0);
      expect(product.name).assertEqual('product_65');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('product_65');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0066 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PRODUCTP1_6700
     * @tc.name      testProduct0067
     * @tc.desc      Verify createProduct/ProductService keep name product_66.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testProduct0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0067 begin');
      const product: Product = createProduct('product_66');
      expect(product.id).assertEqual(0);
      expect(product.name).assertEqual('product_66');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('product_66');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0067 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PRODUCTP1_6800
     * @tc.name      testProduct0068
     * @tc.desc      Verify createProduct/ProductService keep name product_67.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testProduct0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0068 begin');
      const product: Product = createProduct('product_67');
      expect(product.id).assertEqual(0);
      expect(product.name).assertEqual('product_67');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('product_67');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0068 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PRODUCTP1_6900
     * @tc.name      testProduct0069
     * @tc.desc      Verify createProduct/ProductService keep name product_68.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testProduct0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0069 begin');
      const product: Product = createProduct('product_68');
      expect(product.id).assertEqual(0);
      expect(product.name).assertEqual('product_68');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('product_68');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0069 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PRODUCTP1_7000
     * @tc.name      testProduct0070
     * @tc.desc      Verify createProduct/ProductService keep name product_69.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testProduct0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0070 begin');
      const product: Product = createProduct('product_69');
      expect(product.id).assertEqual(0);
      expect(product.name).assertEqual('product_69');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('product_69');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0070 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PRODUCTP1_7100
     * @tc.name      testProduct0071
     * @tc.desc      Verify createProduct/ProductService keep name product_70.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testProduct0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0071 begin');
      const product: Product = createProduct('product_70');
      expect(product.id).assertEqual(0);
      expect(product.name).assertEqual('product_70');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('product_70');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0071 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PRODUCTP1_7200
     * @tc.name      testProduct0072
     * @tc.desc      Verify createProduct/ProductService keep name product_71.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testProduct0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0072 begin');
      const product: Product = createProduct('product_71');
      expect(product.id).assertEqual(0);
      expect(product.name).assertEqual('product_71');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('product_71');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0072 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PRODUCTP1_7300
     * @tc.name      testProduct0073
     * @tc.desc      Verify createProduct/ProductService keep name product_72.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testProduct0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0073 begin');
      const product: Product = createProduct('product_72');
      expect(product.id).assertEqual(0);
      expect(product.name).assertEqual('product_72');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('product_72');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0073 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PRODUCTP1_7400
     * @tc.name      testProduct0074
     * @tc.desc      Verify createProduct/ProductService keep name product_73.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testProduct0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0074 begin');
      const product: Product = createProduct('product_73');
      expect(product.id).assertEqual(0);
      expect(product.name).assertEqual('product_73');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('product_73');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0074 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PRODUCTP1_7500
     * @tc.name      testProduct0075
     * @tc.desc      Verify createProduct/ProductService keep name product_74.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testProduct0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0075 begin');
      const product: Product = createProduct('product_74');
      expect(product.id).assertEqual(0);
      expect(product.name).assertEqual('product_74');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('product_74');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0075 end');
    })

  })
}
