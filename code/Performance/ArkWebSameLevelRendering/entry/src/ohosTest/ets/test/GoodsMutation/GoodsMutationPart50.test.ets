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

import { describe, it, expect, beforeAll, beforeEach, afterEach, afterAll } from '@ohos/hypium';
import { yieldTestEventLoop } from '../Shared/TestScheduling';
import { ProductDataModel } from '../../../../main/ets/model/GoodsModel';
import { PRODUCT_DATA } from '../../../../main/ets/viewmodel/GoodsViewModel';

export default function GoodsMutationPart50(): void {
  describe('GoodsMutationPart50', () => {
    beforeAll(async (): Promise<void> => {
      await Promise.resolve();
    });
    beforeEach(async (): Promise<void> => {
      await yieldTestEventLoop();
    });
    afterEach((): void => {});
    afterAll((): void => {});

    // @tc.number GoodsMutationPart50_0001_mutate_id_source0_image0_title4_price0_mode4
    // @tc.name GoodsMutationPart50_0001_mutate_id_source0_image0_title4_price0_mode4
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ProductDataModel field mutation preserves unrelated fields and imported catalog
    it('GoodsMutationPart50_0001_mutate_id_source0_image0_title4_price0_mode4', 0, (): void => {
      const original: ProductDataModel = PRODUCT_DATA[0];
      const copy: ProductDataModel = new ProductDataModel(
        original.id,
        original.imageRes,
        original.title,
        original.price,
      );
      copy.id = 2147483647;
      const actualValue = copy.id;
      const expectedValue = 2147483647;
      expect(actualValue).assertDeepEquals(expectedValue);
      const actualImageres = copy.imageRes;
      const expectedImageres = original.imageRes;
      expect(actualImageres).assertEqual(expectedImageres);
      const actualTitle = copy.title;
      const expectedTitle = original.title;
      expect(actualTitle).assertEqual(expectedTitle);
      const actualPrice = copy.price;
      const expectedPrice = original.price;
      expect(actualPrice).assertEqual(expectedPrice);
      const originalId: number = original.id;
      expect(originalId).assertEqual(0);
    });

    // @tc.number GoodsMutationPart50_0002_mutate_imageRes_source0_image0_title4_price0_mode5
    // @tc.name GoodsMutationPart50_0002_mutate_imageRes_source0_image0_title4_price0_mode5
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ProductDataModel field mutation preserves unrelated fields and imported catalog
    it('GoodsMutationPart50_0002_mutate_imageRes_source0_image0_title4_price0_mode5', 0, (): void => {
      const original: ProductDataModel = PRODUCT_DATA[0];
      const copy: ProductDataModel = new ProductDataModel(
        original.id,
        original.imageRes,
        original.title,
        original.price,
      );
      copy.imageRes = $r('app.media.embed_product000');
      const actualValue = copy.imageRes;
      const expectedValue = $r('app.media.embed_product000');
      expect(actualValue).assertDeepEquals(expectedValue);
      const actualId = copy.id;
      const expectedId = original.id;
      expect(actualId).assertEqual(expectedId);
      const actualTitle = copy.title;
      const expectedTitle = original.title;
      expect(actualTitle).assertEqual(expectedTitle);
      const actualPrice = copy.price;
      const expectedPrice = original.price;
      expect(actualPrice).assertEqual(expectedPrice);
      const originalId: number = original.id;
      expect(originalId).assertEqual(0);
    });

    // @tc.number GoodsMutationPart50_0003_mutate_title_source0_image0_title4_price0_mode6
    // @tc.name GoodsMutationPart50_0003_mutate_title_source0_image0_title4_price0_mode6
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ProductDataModel field mutation preserves unrelated fields and imported catalog
    it('GoodsMutationPart50_0003_mutate_title_source0_image0_title4_price0_mode6', 0, (): void => {
      const original: ProductDataModel = PRODUCT_DATA[0];
      const copy: ProductDataModel = new ProductDataModel(
        original.id,
        original.imageRes,
        original.title,
        original.price,
      );
      copy.title = $r('app.string.embed_product_title004');
      const actualValue = copy.title;
      const expectedValue = $r('app.string.embed_product_title004');
      expect(actualValue).assertDeepEquals(expectedValue);
      const actualId = copy.id;
      const expectedId = original.id;
      expect(actualId).assertEqual(expectedId);
      const actualImageres = copy.imageRes;
      const expectedImageres = original.imageRes;
      expect(actualImageres).assertEqual(expectedImageres);
      const actualPrice = copy.price;
      const expectedPrice = original.price;
      expect(actualPrice).assertEqual(expectedPrice);
      const originalId: number = original.id;
      expect(originalId).assertEqual(0);
    });

    // @tc.number GoodsMutationPart50_0004_mutate_price_source0_image0_title4_price0_mode7
    // @tc.name GoodsMutationPart50_0004_mutate_price_source0_image0_title4_price0_mode7
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ProductDataModel field mutation preserves unrelated fields and imported catalog
    it('GoodsMutationPart50_0004_mutate_price_source0_image0_title4_price0_mode7', 0, (): void => {
      const original: ProductDataModel = PRODUCT_DATA[0];
      const copy: ProductDataModel = new ProductDataModel(
        original.id,
        original.imageRes,
        original.title,
        original.price,
      );
      copy.price = $r('app.string.embed_product_price000');
      const actualValue = copy.price;
      const expectedValue = $r('app.string.embed_product_price000');
      expect(actualValue).assertDeepEquals(expectedValue);
      const actualId = copy.id;
      const expectedId = original.id;
      expect(actualId).assertEqual(expectedId);
      const actualImageres = copy.imageRes;
      const expectedImageres = original.imageRes;
      expect(actualImageres).assertEqual(expectedImageres);
      const actualTitle = copy.title;
      const expectedTitle = original.title;
      expect(actualTitle).assertEqual(expectedTitle);
      const originalId: number = original.id;
      expect(originalId).assertEqual(0);
    });

    // @tc.number GoodsMutationPart50_0005_mutate_id_source1_image1_title4_price0_mode0
    // @tc.name GoodsMutationPart50_0005_mutate_id_source1_image1_title4_price0_mode0
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ProductDataModel field mutation preserves unrelated fields and imported catalog
    it('GoodsMutationPart50_0005_mutate_id_source1_image1_title4_price0_mode0', 0, (): void => {
      const original: ProductDataModel = PRODUCT_DATA[1];
      const copy: ProductDataModel = new ProductDataModel(
        original.id,
        original.imageRes,
        original.title,
        original.price,
      );
      copy.id = 2147483647;
      const actualValue = copy.id;
      const expectedValue = 2147483647;
      expect(actualValue).assertDeepEquals(expectedValue);
      const actualImageres = copy.imageRes;
      const expectedImageres = original.imageRes;
      expect(actualImageres).assertEqual(expectedImageres);
      const actualTitle = copy.title;
      const expectedTitle = original.title;
      expect(actualTitle).assertEqual(expectedTitle);
      const actualPrice = copy.price;
      const expectedPrice = original.price;
      expect(actualPrice).assertEqual(expectedPrice);
      const originalId: number = original.id;
      expect(originalId).assertEqual(1);
    });

    // @tc.number GoodsMutationPart50_0006_mutate_imageRes_source1_image1_title4_price0_mode1
    // @tc.name GoodsMutationPart50_0006_mutate_imageRes_source1_image1_title4_price0_mode1
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ProductDataModel field mutation preserves unrelated fields and imported catalog
    it('GoodsMutationPart50_0006_mutate_imageRes_source1_image1_title4_price0_mode1', 0, (): void => {
      const original: ProductDataModel = PRODUCT_DATA[1];
      const copy: ProductDataModel = new ProductDataModel(
        original.id,
        original.imageRes,
        original.title,
        original.price,
      );
      copy.imageRes = $r('app.media.embed_product001');
      const actualValue = copy.imageRes;
      const expectedValue = $r('app.media.embed_product001');
      expect(actualValue).assertDeepEquals(expectedValue);
      const actualId = copy.id;
      const expectedId = original.id;
      expect(actualId).assertEqual(expectedId);
      const actualTitle = copy.title;
      const expectedTitle = original.title;
      expect(actualTitle).assertEqual(expectedTitle);
      const actualPrice = copy.price;
      const expectedPrice = original.price;
      expect(actualPrice).assertEqual(expectedPrice);
      const originalId: number = original.id;
      expect(originalId).assertEqual(1);
    });

    // @tc.number GoodsMutationPart50_0007_mutate_title_source1_image1_title4_price0_mode2
    // @tc.name GoodsMutationPart50_0007_mutate_title_source1_image1_title4_price0_mode2
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ProductDataModel field mutation preserves unrelated fields and imported catalog
    it('GoodsMutationPart50_0007_mutate_title_source1_image1_title4_price0_mode2', 0, (): void => {
      const original: ProductDataModel = PRODUCT_DATA[1];
      const copy: ProductDataModel = new ProductDataModel(
        original.id,
        original.imageRes,
        original.title,
        original.price,
      );
      copy.title = $r('app.string.embed_product_title004');
      const actualValue = copy.title;
      const expectedValue = $r('app.string.embed_product_title004');
      expect(actualValue).assertDeepEquals(expectedValue);
      const actualId = copy.id;
      const expectedId = original.id;
      expect(actualId).assertEqual(expectedId);
      const actualImageres = copy.imageRes;
      const expectedImageres = original.imageRes;
      expect(actualImageres).assertEqual(expectedImageres);
      const actualPrice = copy.price;
      const expectedPrice = original.price;
      expect(actualPrice).assertEqual(expectedPrice);
      const originalId: number = original.id;
      expect(originalId).assertEqual(1);
    });

    // @tc.number GoodsMutationPart50_0008_mutate_price_source1_image1_title4_price0_mode3
    // @tc.name GoodsMutationPart50_0008_mutate_price_source1_image1_title4_price0_mode3
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ProductDataModel field mutation preserves unrelated fields and imported catalog
    it('GoodsMutationPart50_0008_mutate_price_source1_image1_title4_price0_mode3', 0, (): void => {
      const original: ProductDataModel = PRODUCT_DATA[1];
      const copy: ProductDataModel = new ProductDataModel(
        original.id,
        original.imageRes,
        original.title,
        original.price,
      );
      copy.price = $r('app.string.embed_product_price000');
      const actualValue = copy.price;
      const expectedValue = $r('app.string.embed_product_price000');
      expect(actualValue).assertDeepEquals(expectedValue);
      const actualId = copy.id;
      const expectedId = original.id;
      expect(actualId).assertEqual(expectedId);
      const actualImageres = copy.imageRes;
      const expectedImageres = original.imageRes;
      expect(actualImageres).assertEqual(expectedImageres);
      const actualTitle = copy.title;
      const expectedTitle = original.title;
      expect(actualTitle).assertEqual(expectedTitle);
      const originalId: number = original.id;
      expect(originalId).assertEqual(1);
    });

    // @tc.number GoodsMutationPart50_0009_mutate_id_source1_image1_title4_price0_mode4
    // @tc.name GoodsMutationPart50_0009_mutate_id_source1_image1_title4_price0_mode4
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ProductDataModel field mutation preserves unrelated fields and imported catalog
    it('GoodsMutationPart50_0009_mutate_id_source1_image1_title4_price0_mode4', 0, (): void => {
      const original: ProductDataModel = PRODUCT_DATA[1];
      const copy: ProductDataModel = new ProductDataModel(
        original.id,
        original.imageRes,
        original.title,
        original.price,
      );
      copy.id = 2147483647;
      const actualValue = copy.id;
      const expectedValue = 2147483647;
      expect(actualValue).assertDeepEquals(expectedValue);
      const actualImageres = copy.imageRes;
      const expectedImageres = original.imageRes;
      expect(actualImageres).assertEqual(expectedImageres);
      const actualTitle = copy.title;
      const expectedTitle = original.title;
      expect(actualTitle).assertEqual(expectedTitle);
      const actualPrice = copy.price;
      const expectedPrice = original.price;
      expect(actualPrice).assertEqual(expectedPrice);
      const originalId: number = original.id;
      expect(originalId).assertEqual(1);
    });

    // @tc.number GoodsMutationPart50_0010_mutate_imageRes_source1_image1_title4_price0_mode5
    // @tc.name GoodsMutationPart50_0010_mutate_imageRes_source1_image1_title4_price0_mode5
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ProductDataModel field mutation preserves unrelated fields and imported catalog
    it('GoodsMutationPart50_0010_mutate_imageRes_source1_image1_title4_price0_mode5', 0, (): void => {
      const original: ProductDataModel = PRODUCT_DATA[1];
      const copy: ProductDataModel = new ProductDataModel(
        original.id,
        original.imageRes,
        original.title,
        original.price,
      );
      copy.imageRes = $r('app.media.embed_product001');
      const actualValue = copy.imageRes;
      const expectedValue = $r('app.media.embed_product001');
      expect(actualValue).assertDeepEquals(expectedValue);
      const actualId = copy.id;
      const expectedId = original.id;
      expect(actualId).assertEqual(expectedId);
      const actualTitle = copy.title;
      const expectedTitle = original.title;
      expect(actualTitle).assertEqual(expectedTitle);
      const actualPrice = copy.price;
      const expectedPrice = original.price;
      expect(actualPrice).assertEqual(expectedPrice);
      const originalId: number = original.id;
      expect(originalId).assertEqual(1);
    });

    // @tc.number GoodsMutationPart50_0011_mutate_title_source1_image1_title4_price0_mode6
    // @tc.name GoodsMutationPart50_0011_mutate_title_source1_image1_title4_price0_mode6
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ProductDataModel field mutation preserves unrelated fields and imported catalog
    it('GoodsMutationPart50_0011_mutate_title_source1_image1_title4_price0_mode6', 0, (): void => {
      const original: ProductDataModel = PRODUCT_DATA[1];
      const copy: ProductDataModel = new ProductDataModel(
        original.id,
        original.imageRes,
        original.title,
        original.price,
      );
      copy.title = $r('app.string.embed_product_title004');
      const actualValue = copy.title;
      const expectedValue = $r('app.string.embed_product_title004');
      expect(actualValue).assertDeepEquals(expectedValue);
      const actualId = copy.id;
      const expectedId = original.id;
      expect(actualId).assertEqual(expectedId);
      const actualImageres = copy.imageRes;
      const expectedImageres = original.imageRes;
      expect(actualImageres).assertEqual(expectedImageres);
      const actualPrice = copy.price;
      const expectedPrice = original.price;
      expect(actualPrice).assertEqual(expectedPrice);
      const originalId: number = original.id;
      expect(originalId).assertEqual(1);
    });

    // @tc.number GoodsMutationPart50_0012_mutate_price_source1_image1_title4_price0_mode7
    // @tc.name GoodsMutationPart50_0012_mutate_price_source1_image1_title4_price0_mode7
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ProductDataModel field mutation preserves unrelated fields and imported catalog
    it('GoodsMutationPart50_0012_mutate_price_source1_image1_title4_price0_mode7', 0, (): void => {
      const original: ProductDataModel = PRODUCT_DATA[1];
      const copy: ProductDataModel = new ProductDataModel(
        original.id,
        original.imageRes,
        original.title,
        original.price,
      );
      copy.price = $r('app.string.embed_product_price000');
      const actualValue = copy.price;
      const expectedValue = $r('app.string.embed_product_price000');
      expect(actualValue).assertDeepEquals(expectedValue);
      const actualId = copy.id;
      const expectedId = original.id;
      expect(actualId).assertEqual(expectedId);
      const actualImageres = copy.imageRes;
      const expectedImageres = original.imageRes;
      expect(actualImageres).assertEqual(expectedImageres);
      const actualTitle = copy.title;
      const expectedTitle = original.title;
      expect(actualTitle).assertEqual(expectedTitle);
      const originalId: number = original.id;
      expect(originalId).assertEqual(1);
    });

    // @tc.number GoodsMutationPart50_0013_mutate_id_source2_image2_title4_price0_mode0
    // @tc.name GoodsMutationPart50_0013_mutate_id_source2_image2_title4_price0_mode0
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ProductDataModel field mutation preserves unrelated fields and imported catalog
    it('GoodsMutationPart50_0013_mutate_id_source2_image2_title4_price0_mode0', 0, (): void => {
      const original: ProductDataModel = PRODUCT_DATA[2];
      const copy: ProductDataModel = new ProductDataModel(
        original.id,
        original.imageRes,
        original.title,
        original.price,
      );
      copy.id = 2147483647;
      const actualValue = copy.id;
      const expectedValue = 2147483647;
      expect(actualValue).assertDeepEquals(expectedValue);
      const actualImageres = copy.imageRes;
      const expectedImageres = original.imageRes;
      expect(actualImageres).assertEqual(expectedImageres);
      const actualTitle = copy.title;
      const expectedTitle = original.title;
      expect(actualTitle).assertEqual(expectedTitle);
      const actualPrice = copy.price;
      const expectedPrice = original.price;
      expect(actualPrice).assertEqual(expectedPrice);
      const originalId: number = original.id;
      expect(originalId).assertEqual(2);
    });

    // @tc.number GoodsMutationPart50_0014_mutate_imageRes_source2_image2_title4_price0_mode1
    // @tc.name GoodsMutationPart50_0014_mutate_imageRes_source2_image2_title4_price0_mode1
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ProductDataModel field mutation preserves unrelated fields and imported catalog
    it('GoodsMutationPart50_0014_mutate_imageRes_source2_image2_title4_price0_mode1', 0, (): void => {
      const original: ProductDataModel = PRODUCT_DATA[2];
      const copy: ProductDataModel = new ProductDataModel(
        original.id,
        original.imageRes,
        original.title,
        original.price,
      );
      copy.imageRes = $r('app.media.embed_product002');
      const actualValue = copy.imageRes;
      const expectedValue = $r('app.media.embed_product002');
      expect(actualValue).assertDeepEquals(expectedValue);
      const actualId = copy.id;
      const expectedId = original.id;
      expect(actualId).assertEqual(expectedId);
      const actualTitle = copy.title;
      const expectedTitle = original.title;
      expect(actualTitle).assertEqual(expectedTitle);
      const actualPrice = copy.price;
      const expectedPrice = original.price;
      expect(actualPrice).assertEqual(expectedPrice);
      const originalId: number = original.id;
      expect(originalId).assertEqual(2);
    });

    // @tc.number GoodsMutationPart50_0015_mutate_title_source2_image2_title4_price0_mode2
    // @tc.name GoodsMutationPart50_0015_mutate_title_source2_image2_title4_price0_mode2
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ProductDataModel field mutation preserves unrelated fields and imported catalog
    it('GoodsMutationPart50_0015_mutate_title_source2_image2_title4_price0_mode2', 0, (): void => {
      const original: ProductDataModel = PRODUCT_DATA[2];
      const copy: ProductDataModel = new ProductDataModel(
        original.id,
        original.imageRes,
        original.title,
        original.price,
      );
      copy.title = $r('app.string.embed_product_title004');
      const actualValue = copy.title;
      const expectedValue = $r('app.string.embed_product_title004');
      expect(actualValue).assertDeepEquals(expectedValue);
      const actualId = copy.id;
      const expectedId = original.id;
      expect(actualId).assertEqual(expectedId);
      const actualImageres = copy.imageRes;
      const expectedImageres = original.imageRes;
      expect(actualImageres).assertEqual(expectedImageres);
      const actualPrice = copy.price;
      const expectedPrice = original.price;
      expect(actualPrice).assertEqual(expectedPrice);
      const originalId: number = original.id;
      expect(originalId).assertEqual(2);
    });

    // @tc.number GoodsMutationPart50_0016_mutate_price_source2_image2_title4_price0_mode3
    // @tc.name GoodsMutationPart50_0016_mutate_price_source2_image2_title4_price0_mode3
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ProductDataModel field mutation preserves unrelated fields and imported catalog
    it('GoodsMutationPart50_0016_mutate_price_source2_image2_title4_price0_mode3', 0, (): void => {
      const original: ProductDataModel = PRODUCT_DATA[2];
      const copy: ProductDataModel = new ProductDataModel(
        original.id,
        original.imageRes,
        original.title,
        original.price,
      );
      copy.price = $r('app.string.embed_product_price000');
      const actualValue = copy.price;
      const expectedValue = $r('app.string.embed_product_price000');
      expect(actualValue).assertDeepEquals(expectedValue);
      const actualId = copy.id;
      const expectedId = original.id;
      expect(actualId).assertEqual(expectedId);
      const actualImageres = copy.imageRes;
      const expectedImageres = original.imageRes;
      expect(actualImageres).assertEqual(expectedImageres);
      const actualTitle = copy.title;
      const expectedTitle = original.title;
      expect(actualTitle).assertEqual(expectedTitle);
      const originalId: number = original.id;
      expect(originalId).assertEqual(2);
    });

    // @tc.number GoodsMutationPart50_0017_mutate_id_source2_image2_title4_price0_mode4
    // @tc.name GoodsMutationPart50_0017_mutate_id_source2_image2_title4_price0_mode4
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ProductDataModel field mutation preserves unrelated fields and imported catalog
    it('GoodsMutationPart50_0017_mutate_id_source2_image2_title4_price0_mode4', 0, (): void => {
      const original: ProductDataModel = PRODUCT_DATA[2];
      const copy: ProductDataModel = new ProductDataModel(
        original.id,
        original.imageRes,
        original.title,
        original.price,
      );
      copy.id = 2147483647;
      const actualValue = copy.id;
      const expectedValue = 2147483647;
      expect(actualValue).assertDeepEquals(expectedValue);
      const actualImageres = copy.imageRes;
      const expectedImageres = original.imageRes;
      expect(actualImageres).assertEqual(expectedImageres);
      const actualTitle = copy.title;
      const expectedTitle = original.title;
      expect(actualTitle).assertEqual(expectedTitle);
      const actualPrice = copy.price;
      const expectedPrice = original.price;
      expect(actualPrice).assertEqual(expectedPrice);
      const originalId: number = original.id;
      expect(originalId).assertEqual(2);
    });

    // @tc.number GoodsMutationPart50_0018_mutate_imageRes_source2_image2_title4_price0_mode5
    // @tc.name GoodsMutationPart50_0018_mutate_imageRes_source2_image2_title4_price0_mode5
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ProductDataModel field mutation preserves unrelated fields and imported catalog
    it('GoodsMutationPart50_0018_mutate_imageRes_source2_image2_title4_price0_mode5', 0, (): void => {
      const original: ProductDataModel = PRODUCT_DATA[2];
      const copy: ProductDataModel = new ProductDataModel(
        original.id,
        original.imageRes,
        original.title,
        original.price,
      );
      copy.imageRes = $r('app.media.embed_product002');
      const actualValue = copy.imageRes;
      const expectedValue = $r('app.media.embed_product002');
      expect(actualValue).assertDeepEquals(expectedValue);
      const actualId = copy.id;
      const expectedId = original.id;
      expect(actualId).assertEqual(expectedId);
      const actualTitle = copy.title;
      const expectedTitle = original.title;
      expect(actualTitle).assertEqual(expectedTitle);
      const actualPrice = copy.price;
      const expectedPrice = original.price;
      expect(actualPrice).assertEqual(expectedPrice);
      const originalId: number = original.id;
      expect(originalId).assertEqual(2);
    });

    // @tc.number GoodsMutationPart50_0019_mutate_title_source2_image2_title4_price0_mode6
    // @tc.name GoodsMutationPart50_0019_mutate_title_source2_image2_title4_price0_mode6
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ProductDataModel field mutation preserves unrelated fields and imported catalog
    it('GoodsMutationPart50_0019_mutate_title_source2_image2_title4_price0_mode6', 0, (): void => {
      const original: ProductDataModel = PRODUCT_DATA[2];
      const copy: ProductDataModel = new ProductDataModel(
        original.id,
        original.imageRes,
        original.title,
        original.price,
      );
      copy.title = $r('app.string.embed_product_title004');
      const actualValue = copy.title;
      const expectedValue = $r('app.string.embed_product_title004');
      expect(actualValue).assertDeepEquals(expectedValue);
      const actualId = copy.id;
      const expectedId = original.id;
      expect(actualId).assertEqual(expectedId);
      const actualImageres = copy.imageRes;
      const expectedImageres = original.imageRes;
      expect(actualImageres).assertEqual(expectedImageres);
      const actualPrice = copy.price;
      const expectedPrice = original.price;
      expect(actualPrice).assertEqual(expectedPrice);
      const originalId: number = original.id;
      expect(originalId).assertEqual(2);
    });

    // @tc.number GoodsMutationPart50_0020_mutate_price_source2_image2_title4_price0_mode7
    // @tc.name GoodsMutationPart50_0020_mutate_price_source2_image2_title4_price0_mode7
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ProductDataModel field mutation preserves unrelated fields and imported catalog
    it('GoodsMutationPart50_0020_mutate_price_source2_image2_title4_price0_mode7', 0, (): void => {
      const original: ProductDataModel = PRODUCT_DATA[2];
      const copy: ProductDataModel = new ProductDataModel(
        original.id,
        original.imageRes,
        original.title,
        original.price,
      );
      copy.price = $r('app.string.embed_product_price000');
      const actualValue = copy.price;
      const expectedValue = $r('app.string.embed_product_price000');
      expect(actualValue).assertDeepEquals(expectedValue);
      const actualId = copy.id;
      const expectedId = original.id;
      expect(actualId).assertEqual(expectedId);
      const actualImageres = copy.imageRes;
      const expectedImageres = original.imageRes;
      expect(actualImageres).assertEqual(expectedImageres);
      const actualTitle = copy.title;
      const expectedTitle = original.title;
      expect(actualTitle).assertEqual(expectedTitle);
      const originalId: number = original.id;
      expect(originalId).assertEqual(2);
    });

    // @tc.number GoodsMutationPart50_0021_mutate_id_source3_image3_title4_price0_mode0
    // @tc.name GoodsMutationPart50_0021_mutate_id_source3_image3_title4_price0_mode0
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ProductDataModel field mutation preserves unrelated fields and imported catalog
    it('GoodsMutationPart50_0021_mutate_id_source3_image3_title4_price0_mode0', 0, (): void => {
      const original: ProductDataModel = PRODUCT_DATA[3];
      const copy: ProductDataModel = new ProductDataModel(
        original.id,
        original.imageRes,
        original.title,
        original.price,
      );
      copy.id = 2147483647;
      const actualValue = copy.id;
      const expectedValue = 2147483647;
      expect(actualValue).assertDeepEquals(expectedValue);
      const actualImageres = copy.imageRes;
      const expectedImageres = original.imageRes;
      expect(actualImageres).assertEqual(expectedImageres);
      const actualTitle = copy.title;
      const expectedTitle = original.title;
      expect(actualTitle).assertEqual(expectedTitle);
      const actualPrice = copy.price;
      const expectedPrice = original.price;
      expect(actualPrice).assertEqual(expectedPrice);
      const originalId: number = original.id;
      expect(originalId).assertEqual(3);
    });

    // @tc.number GoodsMutationPart50_0022_mutate_imageRes_source3_image3_title4_price0_mode1
    // @tc.name GoodsMutationPart50_0022_mutate_imageRes_source3_image3_title4_price0_mode1
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ProductDataModel field mutation preserves unrelated fields and imported catalog
    it('GoodsMutationPart50_0022_mutate_imageRes_source3_image3_title4_price0_mode1', 0, (): void => {
      const original: ProductDataModel = PRODUCT_DATA[3];
      const copy: ProductDataModel = new ProductDataModel(
        original.id,
        original.imageRes,
        original.title,
        original.price,
      );
      copy.imageRes = $r('app.media.embed_product003');
      const actualValue = copy.imageRes;
      const expectedValue = $r('app.media.embed_product003');
      expect(actualValue).assertDeepEquals(expectedValue);
      const actualId = copy.id;
      const expectedId = original.id;
      expect(actualId).assertEqual(expectedId);
      const actualTitle = copy.title;
      const expectedTitle = original.title;
      expect(actualTitle).assertEqual(expectedTitle);
      const actualPrice = copy.price;
      const expectedPrice = original.price;
      expect(actualPrice).assertEqual(expectedPrice);
      const originalId: number = original.id;
      expect(originalId).assertEqual(3);
    });

    // @tc.number GoodsMutationPart50_0023_mutate_title_source3_image3_title4_price0_mode2
    // @tc.name GoodsMutationPart50_0023_mutate_title_source3_image3_title4_price0_mode2
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ProductDataModel field mutation preserves unrelated fields and imported catalog
    it('GoodsMutationPart50_0023_mutate_title_source3_image3_title4_price0_mode2', 0, (): void => {
      const original: ProductDataModel = PRODUCT_DATA[3];
      const copy: ProductDataModel = new ProductDataModel(
        original.id,
        original.imageRes,
        original.title,
        original.price,
      );
      copy.title = $r('app.string.embed_product_title004');
      const actualValue = copy.title;
      const expectedValue = $r('app.string.embed_product_title004');
      expect(actualValue).assertDeepEquals(expectedValue);
      const actualId = copy.id;
      const expectedId = original.id;
      expect(actualId).assertEqual(expectedId);
      const actualImageres = copy.imageRes;
      const expectedImageres = original.imageRes;
      expect(actualImageres).assertEqual(expectedImageres);
      const actualPrice = copy.price;
      const expectedPrice = original.price;
      expect(actualPrice).assertEqual(expectedPrice);
      const originalId: number = original.id;
      expect(originalId).assertEqual(3);
    });

    // @tc.number GoodsMutationPart50_0024_mutate_price_source3_image3_title4_price0_mode3
    // @tc.name GoodsMutationPart50_0024_mutate_price_source3_image3_title4_price0_mode3
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ProductDataModel field mutation preserves unrelated fields and imported catalog
    it('GoodsMutationPart50_0024_mutate_price_source3_image3_title4_price0_mode3', 0, (): void => {
      const original: ProductDataModel = PRODUCT_DATA[3];
      const copy: ProductDataModel = new ProductDataModel(
        original.id,
        original.imageRes,
        original.title,
        original.price,
      );
      copy.price = $r('app.string.embed_product_price000');
      const actualValue = copy.price;
      const expectedValue = $r('app.string.embed_product_price000');
      expect(actualValue).assertDeepEquals(expectedValue);
      const actualId = copy.id;
      const expectedId = original.id;
      expect(actualId).assertEqual(expectedId);
      const actualImageres = copy.imageRes;
      const expectedImageres = original.imageRes;
      expect(actualImageres).assertEqual(expectedImageres);
      const actualTitle = copy.title;
      const expectedTitle = original.title;
      expect(actualTitle).assertEqual(expectedTitle);
      const originalId: number = original.id;
      expect(originalId).assertEqual(3);
    });

    // @tc.number GoodsMutationPart50_0025_mutate_id_source3_image3_title4_price0_mode4
    // @tc.name GoodsMutationPart50_0025_mutate_id_source3_image3_title4_price0_mode4
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ProductDataModel field mutation preserves unrelated fields and imported catalog
    it('GoodsMutationPart50_0025_mutate_id_source3_image3_title4_price0_mode4', 0, (): void => {
      const original: ProductDataModel = PRODUCT_DATA[3];
      const copy: ProductDataModel = new ProductDataModel(
        original.id,
        original.imageRes,
        original.title,
        original.price,
      );
      copy.id = 2147483647;
      const actualValue = copy.id;
      const expectedValue = 2147483647;
      expect(actualValue).assertDeepEquals(expectedValue);
      const actualImageres = copy.imageRes;
      const expectedImageres = original.imageRes;
      expect(actualImageres).assertEqual(expectedImageres);
      const actualTitle = copy.title;
      const expectedTitle = original.title;
      expect(actualTitle).assertEqual(expectedTitle);
      const actualPrice = copy.price;
      const expectedPrice = original.price;
      expect(actualPrice).assertEqual(expectedPrice);
      const originalId: number = original.id;
      expect(originalId).assertEqual(3);
    });

    // @tc.number GoodsMutationPart50_0026_mutate_imageRes_source3_image3_title4_price0_mode5
    // @tc.name GoodsMutationPart50_0026_mutate_imageRes_source3_image3_title4_price0_mode5
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ProductDataModel field mutation preserves unrelated fields and imported catalog
    it('GoodsMutationPart50_0026_mutate_imageRes_source3_image3_title4_price0_mode5', 0, (): void => {
      const original: ProductDataModel = PRODUCT_DATA[3];
      const copy: ProductDataModel = new ProductDataModel(
        original.id,
        original.imageRes,
        original.title,
        original.price,
      );
      copy.imageRes = $r('app.media.embed_product003');
      const actualValue = copy.imageRes;
      const expectedValue = $r('app.media.embed_product003');
      expect(actualValue).assertDeepEquals(expectedValue);
      const actualId = copy.id;
      const expectedId = original.id;
      expect(actualId).assertEqual(expectedId);
      const actualTitle = copy.title;
      const expectedTitle = original.title;
      expect(actualTitle).assertEqual(expectedTitle);
      const actualPrice = copy.price;
      const expectedPrice = original.price;
      expect(actualPrice).assertEqual(expectedPrice);
      const originalId: number = original.id;
      expect(originalId).assertEqual(3);
    });
  });
}
