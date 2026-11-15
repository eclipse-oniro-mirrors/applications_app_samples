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

export default function ProductFactoryMatrixPart2Test(): void {
  describe('ProductFactoryMatrixPart2', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 20);
      });
    })


    /**
     * @tc.number    SUB_ARKTS_GUIDE_PRODUCTP2_7600
     * @tc.name      testProduct0076
     * @tc.desc      Verify createProduct/ProductService keep name product_75.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testProduct0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0076 begin');
      const product: Product = createProduct('product_75');
      expect(product.id).assertEqual(0);
      expect(product.name).assertEqual('product_75');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('product_75');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0076 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PRODUCTP2_7700
     * @tc.name      testProduct0077
     * @tc.desc      Verify createProduct/ProductService keep name product_76.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testProduct0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0077 begin');
      const product: Product = createProduct('product_76');
      expect(product.id).assertEqual(0);
      expect(product.name).assertEqual('product_76');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('product_76');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0077 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PRODUCTP2_7800
     * @tc.name      testProduct0078
     * @tc.desc      Verify createProduct/ProductService keep name product_77.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testProduct0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0078 begin');
      const product: Product = createProduct('product_77');
      expect(product.id).assertEqual(0);
      expect(product.name).assertEqual('product_77');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('product_77');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0078 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PRODUCTP2_7900
     * @tc.name      testProduct0079
     * @tc.desc      Verify createProduct/ProductService keep name product_78.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testProduct0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0079 begin');
      const product: Product = createProduct('product_78');
      expect(product.id).assertEqual(0);
      expect(product.name).assertEqual('product_78');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('product_78');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0079 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PRODUCTP2_8000
     * @tc.name      testProduct0080
     * @tc.desc      Verify createProduct/ProductService keep name product_79.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testProduct0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0080 begin');
      const product: Product = createProduct('product_79');
      expect(product.id).assertEqual(0);
      expect(product.name).assertEqual('product_79');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('product_79');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0080 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PRODUCTP2_8100
     * @tc.name      testProduct0081
     * @tc.desc      Verify createProduct/ProductService keep name product_80.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testProduct0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0081 begin');
      const product: Product = createProduct('product_80');
      expect(product.id).assertEqual(0);
      expect(product.name).assertEqual('product_80');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('product_80');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0081 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PRODUCTP2_8200
     * @tc.name      testProduct0082
     * @tc.desc      Verify createProduct/ProductService keep name product_81.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testProduct0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0082 begin');
      const product: Product = createProduct('product_81');
      expect(product.id).assertEqual(0);
      expect(product.name).assertEqual('product_81');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('product_81');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0082 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PRODUCTP2_8300
     * @tc.name      testProduct0083
     * @tc.desc      Verify createProduct/ProductService keep name product_82.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testProduct0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0083 begin');
      const product: Product = createProduct('product_82');
      expect(product.id).assertEqual(0);
      expect(product.name).assertEqual('product_82');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('product_82');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0083 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PRODUCTP2_8400
     * @tc.name      testProduct0084
     * @tc.desc      Verify createProduct/ProductService keep name product_83.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testProduct0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0084 begin');
      const product: Product = createProduct('product_83');
      expect(product.id).assertEqual(0);
      expect(product.name).assertEqual('product_83');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('product_83');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0084 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PRODUCTP2_8500
     * @tc.name      testProduct0085
     * @tc.desc      Verify createProduct/ProductService keep name product_84.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testProduct0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0085 begin');
      const product: Product = createProduct('product_84');
      expect(product.id).assertEqual(0);
      expect(product.name).assertEqual('product_84');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('product_84');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0085 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PRODUCTP2_8600
     * @tc.name      testProduct0086
     * @tc.desc      Verify createProduct/ProductService keep name product_85.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testProduct0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0086 begin');
      const product: Product = createProduct('product_85');
      expect(product.id).assertEqual(0);
      expect(product.name).assertEqual('product_85');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('product_85');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0086 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PRODUCTP2_8700
     * @tc.name      testProduct0087
     * @tc.desc      Verify createProduct/ProductService keep name product_86.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testProduct0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0087 begin');
      const product: Product = createProduct('product_86');
      expect(product.id).assertEqual(0);
      expect(product.name).assertEqual('product_86');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('product_86');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0087 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PRODUCTP2_8800
     * @tc.name      testProduct0088
     * @tc.desc      Verify createProduct/ProductService keep name product_87.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testProduct0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0088 begin');
      const product: Product = createProduct('product_87');
      expect(product.id).assertEqual(0);
      expect(product.name).assertEqual('product_87');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('product_87');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0088 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PRODUCTP2_8900
     * @tc.name      testProduct0089
     * @tc.desc      Verify createProduct/ProductService keep name product_88.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testProduct0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0089 begin');
      const product: Product = createProduct('product_88');
      expect(product.id).assertEqual(0);
      expect(product.name).assertEqual('product_88');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('product_88');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0089 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PRODUCTP2_9000
     * @tc.name      testProduct0090
     * @tc.desc      Verify createProduct/ProductService keep name product_89.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testProduct0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0090 begin');
      const product: Product = createProduct('product_89');
      expect(product.id).assertEqual(0);
      expect(product.name).assertEqual('product_89');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('product_89');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0090 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PRODUCTP2_9100
     * @tc.name      testProduct0091
     * @tc.desc      Verify createProduct/ProductService keep name product_90.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testProduct0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0091 begin');
      const product: Product = createProduct('product_90');
      expect(product.id).assertEqual(0);
      expect(product.name).assertEqual('product_90');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('product_90');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0091 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PRODUCTP2_9200
     * @tc.name      testProduct0092
     * @tc.desc      Verify createProduct/ProductService keep name product_91.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testProduct0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0092 begin');
      const product: Product = createProduct('product_91');
      expect(product.id).assertEqual(0);
      expect(product.name).assertEqual('product_91');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('product_91');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0092 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PRODUCTP2_9300
     * @tc.name      testProduct0093
     * @tc.desc      Verify createProduct/ProductService keep name product_92.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testProduct0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0093 begin');
      const product: Product = createProduct('product_92');
      expect(product.id).assertEqual(0);
      expect(product.name).assertEqual('product_92');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('product_92');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0093 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PRODUCTP2_9400
     * @tc.name      testProduct0094
     * @tc.desc      Verify createProduct/ProductService keep name product_93.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testProduct0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0094 begin');
      const product: Product = createProduct('product_93');
      expect(product.id).assertEqual(0);
      expect(product.name).assertEqual('product_93');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('product_93');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0094 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PRODUCTP2_9500
     * @tc.name      testProduct0095
     * @tc.desc      Verify createProduct/ProductService keep name product_94.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testProduct0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0095 begin');
      const product: Product = createProduct('product_94');
      expect(product.id).assertEqual(0);
      expect(product.name).assertEqual('product_94');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('product_94');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0095 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PRODUCTP2_9600
     * @tc.name      testProduct0096
     * @tc.desc      Verify createProduct/ProductService keep name product_95.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testProduct0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0096 begin');
      const product: Product = createProduct('product_95');
      expect(product.id).assertEqual(0);
      expect(product.name).assertEqual('product_95');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('product_95');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0096 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PRODUCTP2_9700
     * @tc.name      testProduct0097
     * @tc.desc      Verify createProduct/ProductService keep name product_96.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testProduct0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0097 begin');
      const product: Product = createProduct('product_96');
      expect(product.id).assertEqual(0);
      expect(product.name).assertEqual('product_96');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('product_96');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0097 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PRODUCTP2_9800
     * @tc.name      testProduct0098
     * @tc.desc      Verify createProduct/ProductService keep name product_97.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testProduct0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0098 begin');
      const product: Product = createProduct('product_97');
      expect(product.id).assertEqual(0);
      expect(product.name).assertEqual('product_97');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('product_97');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0098 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PRODUCTP2_9900
     * @tc.name      testProduct0099
     * @tc.desc      Verify createProduct/ProductService keep name product_98.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testProduct0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0099 begin');
      const product: Product = createProduct('product_98');
      expect(product.id).assertEqual(0);
      expect(product.name).assertEqual('product_98');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('product_98');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0099 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PRODUCTP2_10000
     * @tc.name      testProduct0100
     * @tc.desc      Verify createProduct/ProductService keep name product_99.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testProduct0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0100 begin');
      const product: Product = createProduct('product_99');
      expect(product.id).assertEqual(0);
      expect(product.name).assertEqual('product_99');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('product_99');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0100 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PRODUCTP2_10100
     * @tc.name      testProduct0101
     * @tc.desc      Verify createProduct/ProductService keep name product_100.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testProduct0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0101 begin');
      const product: Product = createProduct('product_100');
      expect(product.id).assertEqual(0);
      expect(product.name).assertEqual('product_100');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('product_100');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0101 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PRODUCTP2_10200
     * @tc.name      testProduct0102
     * @tc.desc      Verify createProduct/ProductService keep name product_101.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testProduct0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0102 begin');
      const product: Product = createProduct('product_101');
      expect(product.id).assertEqual(0);
      expect(product.name).assertEqual('product_101');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('product_101');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0102 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PRODUCTP2_10300
     * @tc.name      testProduct0103
     * @tc.desc      Verify createProduct/ProductService keep name product_102.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testProduct0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0103 begin');
      const product: Product = createProduct('product_102');
      expect(product.id).assertEqual(0);
      expect(product.name).assertEqual('product_102');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('product_102');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0103 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PRODUCTP2_10400
     * @tc.name      testProduct0104
     * @tc.desc      Verify createProduct/ProductService keep name product_103.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testProduct0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0104 begin');
      const product: Product = createProduct('product_103');
      expect(product.id).assertEqual(0);
      expect(product.name).assertEqual('product_103');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('product_103');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0104 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PRODUCTP2_10500
     * @tc.name      testProduct0105
     * @tc.desc      Verify createProduct/ProductService keep name product_104.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testProduct0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0105 begin');
      const product: Product = createProduct('product_104');
      expect(product.id).assertEqual(0);
      expect(product.name).assertEqual('product_104');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('product_104');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0105 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PRODUCTP2_10600
     * @tc.name      testProduct0106
     * @tc.desc      Verify createProduct/ProductService keep name product_105.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testProduct0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0106 begin');
      const product: Product = createProduct('product_105');
      expect(product.id).assertEqual(0);
      expect(product.name).assertEqual('product_105');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('product_105');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0106 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PRODUCTP2_10700
     * @tc.name      testProduct0107
     * @tc.desc      Verify createProduct/ProductService keep name product_106.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testProduct0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0107 begin');
      const product: Product = createProduct('product_106');
      expect(product.id).assertEqual(0);
      expect(product.name).assertEqual('product_106');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('product_106');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0107 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PRODUCTP2_10800
     * @tc.name      testProduct0108
     * @tc.desc      Verify createProduct/ProductService keep name product_107.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testProduct0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0108 begin');
      const product: Product = createProduct('product_107');
      expect(product.id).assertEqual(0);
      expect(product.name).assertEqual('product_107');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('product_107');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0108 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PRODUCTP2_10900
     * @tc.name      testProduct0109
     * @tc.desc      Verify createProduct/ProductService keep name product_108.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testProduct0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0109 begin');
      const product: Product = createProduct('product_108');
      expect(product.id).assertEqual(0);
      expect(product.name).assertEqual('product_108');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('product_108');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0109 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PRODUCTP2_11000
     * @tc.name      testProduct0110
     * @tc.desc      Verify createProduct/ProductService keep name product_109.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testProduct0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0110 begin');
      const product: Product = createProduct('product_109');
      expect(product.id).assertEqual(0);
      expect(product.name).assertEqual('product_109');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('product_109');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0110 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PRODUCTP2_11100
     * @tc.name      testProduct0111
     * @tc.desc      Verify createProduct/ProductService keep name product_110.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testProduct0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0111 begin');
      const product: Product = createProduct('product_110');
      expect(product.id).assertEqual(0);
      expect(product.name).assertEqual('product_110');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('product_110');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0111 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PRODUCTP2_11200
     * @tc.name      testProduct0112
     * @tc.desc      Verify createProduct/ProductService keep name product_111.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testProduct0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0112 begin');
      const product: Product = createProduct('product_111');
      expect(product.id).assertEqual(0);
      expect(product.name).assertEqual('product_111');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('product_111');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0112 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PRODUCTP2_11300
     * @tc.name      testProduct0113
     * @tc.desc      Verify createProduct/ProductService keep name product_112.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testProduct0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0113 begin');
      const product: Product = createProduct('product_112');
      expect(product.id).assertEqual(0);
      expect(product.name).assertEqual('product_112');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('product_112');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0113 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PRODUCTP2_11400
     * @tc.name      testProduct0114
     * @tc.desc      Verify createProduct/ProductService keep name product_113.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testProduct0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0114 begin');
      const product: Product = createProduct('product_113');
      expect(product.id).assertEqual(0);
      expect(product.name).assertEqual('product_113');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('product_113');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0114 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PRODUCTP2_11500
     * @tc.name      testProduct0115
     * @tc.desc      Verify createProduct/ProductService keep name product_114.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testProduct0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0115 begin');
      const product: Product = createProduct('product_114');
      expect(product.id).assertEqual(0);
      expect(product.name).assertEqual('product_114');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('product_114');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0115 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PRODUCTP2_11600
     * @tc.name      testProduct0116
     * @tc.desc      Verify createProduct/ProductService keep name product_115.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testProduct0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0116 begin');
      const product: Product = createProduct('product_115');
      expect(product.id).assertEqual(0);
      expect(product.name).assertEqual('product_115');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('product_115');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0116 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PRODUCTP2_11700
     * @tc.name      testProduct0117
     * @tc.desc      Verify createProduct/ProductService keep name product_116.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testProduct0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0117 begin');
      const product: Product = createProduct('product_116');
      expect(product.id).assertEqual(0);
      expect(product.name).assertEqual('product_116');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('product_116');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0117 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PRODUCTP2_11800
     * @tc.name      testProduct0118
     * @tc.desc      Verify createProduct/ProductService keep name product_117.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testProduct0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0118 begin');
      const product: Product = createProduct('product_117');
      expect(product.id).assertEqual(0);
      expect(product.name).assertEqual('product_117');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('product_117');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0118 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PRODUCTP2_11900
     * @tc.name      testProduct0119
     * @tc.desc      Verify createProduct/ProductService keep name product_118.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testProduct0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0119 begin');
      const product: Product = createProduct('product_118');
      expect(product.id).assertEqual(0);
      expect(product.name).assertEqual('product_118');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('product_118');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0119 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PRODUCTP2_12000
     * @tc.name      testProduct0120
     * @tc.desc      Verify createProduct/ProductService keep name product_119.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testProduct0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0120 begin');
      const product: Product = createProduct('product_119');
      expect(product.id).assertEqual(0);
      expect(product.name).assertEqual('product_119');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('product_119');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0120 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PRODUCTP2_12100
     * @tc.name      testProduct0121
     * @tc.desc      Verify createProduct/ProductService keep name product_120.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testProduct0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0121 begin');
      const product: Product = createProduct('product_120');
      expect(product.id).assertEqual(0);
      expect(product.name).assertEqual('product_120');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('product_120');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0121 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PRODUCTP2_12200
     * @tc.name      testProduct0122
     * @tc.desc      Verify createProduct/ProductService keep name product_121.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testProduct0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0122 begin');
      const product: Product = createProduct('product_121');
      expect(product.id).assertEqual(0);
      expect(product.name).assertEqual('product_121');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('product_121');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0122 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PRODUCTP2_12300
     * @tc.name      testProduct0123
     * @tc.desc      Verify createProduct/ProductService keep name product_122.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testProduct0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0123 begin');
      const product: Product = createProduct('product_122');
      expect(product.id).assertEqual(0);
      expect(product.name).assertEqual('product_122');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('product_122');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0123 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PRODUCTP2_12400
     * @tc.name      testProduct0124
     * @tc.desc      Verify createProduct/ProductService keep name product_123.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testProduct0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0124 begin');
      const product: Product = createProduct('product_123');
      expect(product.id).assertEqual(0);
      expect(product.name).assertEqual('product_123');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('product_123');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0124 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PRODUCTP2_12500
     * @tc.name      testProduct0125
     * @tc.desc      Verify createProduct/ProductService keep name product_124.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testProduct0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0125 begin');
      const product: Product = createProduct('product_124');
      expect(product.id).assertEqual(0);
      expect(product.name).assertEqual('product_124');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('product_124');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0125 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PRODUCTP2_12600
     * @tc.name      testProduct0126
     * @tc.desc      Verify createProduct/ProductService keep name product_125.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testProduct0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0126 begin');
      const product: Product = createProduct('product_125');
      expect(product.id).assertEqual(0);
      expect(product.name).assertEqual('product_125');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('product_125');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0126 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PRODUCTP2_12700
     * @tc.name      testProduct0127
     * @tc.desc      Verify createProduct/ProductService keep name product_126.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testProduct0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0127 begin');
      const product: Product = createProduct('product_126');
      expect(product.id).assertEqual(0);
      expect(product.name).assertEqual('product_126');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('product_126');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0127 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PRODUCTP2_12800
     * @tc.name      testProduct0128
     * @tc.desc      Verify createProduct/ProductService keep name product_127.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testProduct0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0128 begin');
      const product: Product = createProduct('product_127');
      expect(product.id).assertEqual(0);
      expect(product.name).assertEqual('product_127');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('product_127');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0128 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PRODUCTP2_12900
     * @tc.name      testProduct0129
     * @tc.desc      Verify createProduct/ProductService keep name product_128.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testProduct0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0129 begin');
      const product: Product = createProduct('product_128');
      expect(product.id).assertEqual(0);
      expect(product.name).assertEqual('product_128');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('product_128');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0129 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PRODUCTP2_13000
     * @tc.name      testProduct0130
     * @tc.desc      Verify createProduct/ProductService keep name product_129.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testProduct0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0130 begin');
      const product: Product = createProduct('product_129');
      expect(product.id).assertEqual(0);
      expect(product.name).assertEqual('product_129');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('product_129');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0130 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PRODUCTP2_13100
     * @tc.name      testProduct0131
     * @tc.desc      Verify createProduct/ProductService keep name product_130.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testProduct0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0131 begin');
      const product: Product = createProduct('product_130');
      expect(product.id).assertEqual(0);
      expect(product.name).assertEqual('product_130');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('product_130');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0131 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PRODUCTP2_13200
     * @tc.name      testProduct0132
     * @tc.desc      Verify createProduct/ProductService keep name product_131.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testProduct0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0132 begin');
      const product: Product = createProduct('product_131');
      expect(product.id).assertEqual(0);
      expect(product.name).assertEqual('product_131');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('product_131');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0132 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PRODUCTP2_13300
     * @tc.name      testProduct0133
     * @tc.desc      Verify createProduct/ProductService keep name product_132.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testProduct0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0133 begin');
      const product: Product = createProduct('product_132');
      expect(product.id).assertEqual(0);
      expect(product.name).assertEqual('product_132');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('product_132');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0133 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PRODUCTP2_13400
     * @tc.name      testProduct0134
     * @tc.desc      Verify createProduct/ProductService keep name product_133.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testProduct0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0134 begin');
      const product: Product = createProduct('product_133');
      expect(product.id).assertEqual(0);
      expect(product.name).assertEqual('product_133');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('product_133');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0134 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PRODUCTP2_13500
     * @tc.name      testProduct0135
     * @tc.desc      Verify createProduct/ProductService keep name product_134.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testProduct0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0135 begin');
      const product: Product = createProduct('product_134');
      expect(product.id).assertEqual(0);
      expect(product.name).assertEqual('product_134');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('product_134');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0135 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PRODUCTP2_13600
     * @tc.name      testProduct0136
     * @tc.desc      Verify createProduct/ProductService keep name product_135.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testProduct0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0136 begin');
      const product: Product = createProduct('product_135');
      expect(product.id).assertEqual(0);
      expect(product.name).assertEqual('product_135');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('product_135');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0136 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PRODUCTP2_13700
     * @tc.name      testProduct0137
     * @tc.desc      Verify createProduct/ProductService keep name product_136.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testProduct0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0137 begin');
      const product: Product = createProduct('product_136');
      expect(product.id).assertEqual(0);
      expect(product.name).assertEqual('product_136');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('product_136');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0137 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PRODUCTP2_13800
     * @tc.name      testProduct0138
     * @tc.desc      Verify createProduct/ProductService keep name product_137.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testProduct0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0138 begin');
      const product: Product = createProduct('product_137');
      expect(product.id).assertEqual(0);
      expect(product.name).assertEqual('product_137');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('product_137');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0138 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PRODUCTP2_13900
     * @tc.name      testProduct0139
     * @tc.desc      Verify createProduct/ProductService keep name product_138.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testProduct0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0139 begin');
      const product: Product = createProduct('product_138');
      expect(product.id).assertEqual(0);
      expect(product.name).assertEqual('product_138');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('product_138');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0139 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PRODUCTP2_14000
     * @tc.name      testProduct0140
     * @tc.desc      Verify createProduct/ProductService keep name product_139.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testProduct0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0140 begin');
      const product: Product = createProduct('product_139');
      expect(product.id).assertEqual(0);
      expect(product.name).assertEqual('product_139');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('product_139');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0140 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PRODUCTP2_14100
     * @tc.name      testProduct0141
     * @tc.desc      Verify createProduct/ProductService keep name product_140.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testProduct0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0141 begin');
      const product: Product = createProduct('product_140');
      expect(product.id).assertEqual(0);
      expect(product.name).assertEqual('product_140');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('product_140');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0141 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PRODUCTP2_14200
     * @tc.name      testProduct0142
     * @tc.desc      Verify createProduct/ProductService keep name product_141.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testProduct0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0142 begin');
      const product: Product = createProduct('product_141');
      expect(product.id).assertEqual(0);
      expect(product.name).assertEqual('product_141');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('product_141');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0142 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PRODUCTP2_14300
     * @tc.name      testProduct0143
     * @tc.desc      Verify createProduct/ProductService keep name product_142.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testProduct0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0143 begin');
      const product: Product = createProduct('product_142');
      expect(product.id).assertEqual(0);
      expect(product.name).assertEqual('product_142');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('product_142');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0143 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PRODUCTP2_14400
     * @tc.name      testProduct0144
     * @tc.desc      Verify createProduct/ProductService keep name product_143.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testProduct0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0144 begin');
      const product: Product = createProduct('product_143');
      expect(product.id).assertEqual(0);
      expect(product.name).assertEqual('product_143');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('product_143');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0144 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PRODUCTP2_14500
     * @tc.name      testProduct0145
     * @tc.desc      Verify createProduct/ProductService keep name product_144.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testProduct0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0145 begin');
      const product: Product = createProduct('product_144');
      expect(product.id).assertEqual(0);
      expect(product.name).assertEqual('product_144');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('product_144');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0145 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PRODUCTP2_14600
     * @tc.name      testProduct0146
     * @tc.desc      Verify createProduct/ProductService keep name product_145.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testProduct0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0146 begin');
      const product: Product = createProduct('product_145');
      expect(product.id).assertEqual(0);
      expect(product.name).assertEqual('product_145');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('product_145');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0146 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PRODUCTP2_14700
     * @tc.name      testProduct0147
     * @tc.desc      Verify createProduct/ProductService keep name product_146.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testProduct0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0147 begin');
      const product: Product = createProduct('product_146');
      expect(product.id).assertEqual(0);
      expect(product.name).assertEqual('product_146');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('product_146');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0147 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PRODUCTP2_14800
     * @tc.name      testProduct0148
     * @tc.desc      Verify createProduct/ProductService keep name product_147.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testProduct0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0148 begin');
      const product: Product = createProduct('product_147');
      expect(product.id).assertEqual(0);
      expect(product.name).assertEqual('product_147');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('product_147');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0148 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PRODUCTP2_14900
     * @tc.name      testProduct0149
     * @tc.desc      Verify createProduct/ProductService keep name product_148.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testProduct0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0149 begin');
      const product: Product = createProduct('product_148');
      expect(product.id).assertEqual(0);
      expect(product.name).assertEqual('product_148');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('product_148');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0149 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_PRODUCTP2_15000
     * @tc.name      testProduct0150
     * @tc.desc      Verify createProduct/ProductService keep name product_149.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testProduct0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0150 begin');
      const product: Product = createProduct('product_149');
      expect(product.id).assertEqual(0);
      expect(product.name).assertEqual('product_149');
      const service: ProductService = new ProductService();
      expect(service.getName(product)).assertEqual('product_149');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProduct0150 end');
    })

  })
}
