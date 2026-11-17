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

export default function GoodsMutationPart74(): void {
  describe('GoodsMutationPart74', () => {
    beforeAll(async (): Promise<void> => {
      await Promise.resolve();
    });
    beforeEach(async (): Promise<void> => {
      await yieldTestEventLoop();
    });
    afterEach((): void => {});
    afterAll((): void => {});

    // @tc.number GoodsMutationPart74_0001_mutate_id_source1_image1_title0_price1_mode4
    // @tc.name GoodsMutationPart74_0001_mutate_id_source1_image1_title0_price1_mode4
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ProductDataModel field mutation preserves unrelated fields and imported catalog
    it('GoodsMutationPart74_0001_mutate_id_source1_image1_title0_price1_mode4', 0, (): void => {
      const original: ProductDataModel = PRODUCT_DATA[1];
      const copy: ProductDataModel = new ProductDataModel(
        original.id,
        original.imageRes,
        original.title,
        original.price,
      );
      copy.id = -1;
      const actualValue = copy.id;
      const expectedValue = -1;
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

    // @tc.number GoodsMutationPart74_0002_mutate_imageRes_source1_image1_title0_price1_mode5
    // @tc.name GoodsMutationPart74_0002_mutate_imageRes_source1_image1_title0_price1_mode5
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ProductDataModel field mutation preserves unrelated fields and imported catalog
    it('GoodsMutationPart74_0002_mutate_imageRes_source1_image1_title0_price1_mode5', 0, (): void => {
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

    // @tc.number GoodsMutationPart74_0003_mutate_title_source1_image1_title0_price1_mode6
    // @tc.name GoodsMutationPart74_0003_mutate_title_source1_image1_title0_price1_mode6
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ProductDataModel field mutation preserves unrelated fields and imported catalog
    it('GoodsMutationPart74_0003_mutate_title_source1_image1_title0_price1_mode6', 0, (): void => {
      const original: ProductDataModel = PRODUCT_DATA[1];
      const copy: ProductDataModel = new ProductDataModel(
        original.id,
        original.imageRes,
        original.title,
        original.price,
      );
      copy.title = $r('app.string.embed_product_title000');
      const actualValue = copy.title;
      const expectedValue = $r('app.string.embed_product_title000');
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

    // @tc.number GoodsMutationPart74_0004_mutate_price_source1_image1_title0_price1_mode7
    // @tc.name GoodsMutationPart74_0004_mutate_price_source1_image1_title0_price1_mode7
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ProductDataModel field mutation preserves unrelated fields and imported catalog
    it('GoodsMutationPart74_0004_mutate_price_source1_image1_title0_price1_mode7', 0, (): void => {
      const original: ProductDataModel = PRODUCT_DATA[1];
      const copy: ProductDataModel = new ProductDataModel(
        original.id,
        original.imageRes,
        original.title,
        original.price,
      );
      copy.price = $r('app.string.embed_product_price001');
      const actualValue = copy.price;
      const expectedValue = $r('app.string.embed_product_price001');
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

    // @tc.number GoodsMutationPart74_0005_mutate_id_source2_image2_title0_price1_mode0
    // @tc.name GoodsMutationPart74_0005_mutate_id_source2_image2_title0_price1_mode0
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ProductDataModel field mutation preserves unrelated fields and imported catalog
    it('GoodsMutationPart74_0005_mutate_id_source2_image2_title0_price1_mode0', 0, (): void => {
      const original: ProductDataModel = PRODUCT_DATA[2];
      const copy: ProductDataModel = new ProductDataModel(
        original.id,
        original.imageRes,
        original.title,
        original.price,
      );
      copy.id = -1;
      const actualValue = copy.id;
      const expectedValue = -1;
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

    // @tc.number GoodsMutationPart74_0006_mutate_imageRes_source2_image2_title0_price1_mode1
    // @tc.name GoodsMutationPart74_0006_mutate_imageRes_source2_image2_title0_price1_mode1
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ProductDataModel field mutation preserves unrelated fields and imported catalog
    it('GoodsMutationPart74_0006_mutate_imageRes_source2_image2_title0_price1_mode1', 0, (): void => {
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

    // @tc.number GoodsMutationPart74_0007_mutate_title_source2_image2_title0_price1_mode2
    // @tc.name GoodsMutationPart74_0007_mutate_title_source2_image2_title0_price1_mode2
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ProductDataModel field mutation preserves unrelated fields and imported catalog
    it('GoodsMutationPart74_0007_mutate_title_source2_image2_title0_price1_mode2', 0, (): void => {
      const original: ProductDataModel = PRODUCT_DATA[2];
      const copy: ProductDataModel = new ProductDataModel(
        original.id,
        original.imageRes,
        original.title,
        original.price,
      );
      copy.title = $r('app.string.embed_product_title000');
      const actualValue = copy.title;
      const expectedValue = $r('app.string.embed_product_title000');
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

    // @tc.number GoodsMutationPart74_0008_mutate_price_source2_image2_title0_price1_mode3
    // @tc.name GoodsMutationPart74_0008_mutate_price_source2_image2_title0_price1_mode3
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ProductDataModel field mutation preserves unrelated fields and imported catalog
    it('GoodsMutationPart74_0008_mutate_price_source2_image2_title0_price1_mode3', 0, (): void => {
      const original: ProductDataModel = PRODUCT_DATA[2];
      const copy: ProductDataModel = new ProductDataModel(
        original.id,
        original.imageRes,
        original.title,
        original.price,
      );
      copy.price = $r('app.string.embed_product_price001');
      const actualValue = copy.price;
      const expectedValue = $r('app.string.embed_product_price001');
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

    // @tc.number GoodsMutationPart74_0009_mutate_id_source2_image2_title0_price1_mode4
    // @tc.name GoodsMutationPart74_0009_mutate_id_source2_image2_title0_price1_mode4
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ProductDataModel field mutation preserves unrelated fields and imported catalog
    it('GoodsMutationPart74_0009_mutate_id_source2_image2_title0_price1_mode4', 0, (): void => {
      const original: ProductDataModel = PRODUCT_DATA[2];
      const copy: ProductDataModel = new ProductDataModel(
        original.id,
        original.imageRes,
        original.title,
        original.price,
      );
      copy.id = -1;
      const actualValue = copy.id;
      const expectedValue = -1;
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

    // @tc.number GoodsMutationPart74_0010_mutate_imageRes_source2_image2_title0_price1_mode5
    // @tc.name GoodsMutationPart74_0010_mutate_imageRes_source2_image2_title0_price1_mode5
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ProductDataModel field mutation preserves unrelated fields and imported catalog
    it('GoodsMutationPart74_0010_mutate_imageRes_source2_image2_title0_price1_mode5', 0, (): void => {
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

    // @tc.number GoodsMutationPart74_0011_mutate_title_source2_image2_title0_price1_mode6
    // @tc.name GoodsMutationPart74_0011_mutate_title_source2_image2_title0_price1_mode6
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ProductDataModel field mutation preserves unrelated fields and imported catalog
    it('GoodsMutationPart74_0011_mutate_title_source2_image2_title0_price1_mode6', 0, (): void => {
      const original: ProductDataModel = PRODUCT_DATA[2];
      const copy: ProductDataModel = new ProductDataModel(
        original.id,
        original.imageRes,
        original.title,
        original.price,
      );
      copy.title = $r('app.string.embed_product_title000');
      const actualValue = copy.title;
      const expectedValue = $r('app.string.embed_product_title000');
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

    // @tc.number GoodsMutationPart74_0012_mutate_price_source2_image2_title0_price1_mode7
    // @tc.name GoodsMutationPart74_0012_mutate_price_source2_image2_title0_price1_mode7
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ProductDataModel field mutation preserves unrelated fields and imported catalog
    it('GoodsMutationPart74_0012_mutate_price_source2_image2_title0_price1_mode7', 0, (): void => {
      const original: ProductDataModel = PRODUCT_DATA[2];
      const copy: ProductDataModel = new ProductDataModel(
        original.id,
        original.imageRes,
        original.title,
        original.price,
      );
      copy.price = $r('app.string.embed_product_price001');
      const actualValue = copy.price;
      const expectedValue = $r('app.string.embed_product_price001');
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

    // @tc.number GoodsMutationPart74_0013_mutate_id_source3_image3_title0_price1_mode0
    // @tc.name GoodsMutationPart74_0013_mutate_id_source3_image3_title0_price1_mode0
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ProductDataModel field mutation preserves unrelated fields and imported catalog
    it('GoodsMutationPart74_0013_mutate_id_source3_image3_title0_price1_mode0', 0, (): void => {
      const original: ProductDataModel = PRODUCT_DATA[3];
      const copy: ProductDataModel = new ProductDataModel(
        original.id,
        original.imageRes,
        original.title,
        original.price,
      );
      copy.id = -1;
      const actualValue = copy.id;
      const expectedValue = -1;
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

    // @tc.number GoodsMutationPart74_0014_mutate_imageRes_source3_image3_title0_price1_mode1
    // @tc.name GoodsMutationPart74_0014_mutate_imageRes_source3_image3_title0_price1_mode1
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ProductDataModel field mutation preserves unrelated fields and imported catalog
    it('GoodsMutationPart74_0014_mutate_imageRes_source3_image3_title0_price1_mode1', 0, (): void => {
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

    // @tc.number GoodsMutationPart74_0015_mutate_title_source3_image3_title0_price1_mode2
    // @tc.name GoodsMutationPart74_0015_mutate_title_source3_image3_title0_price1_mode2
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ProductDataModel field mutation preserves unrelated fields and imported catalog
    it('GoodsMutationPart74_0015_mutate_title_source3_image3_title0_price1_mode2', 0, (): void => {
      const original: ProductDataModel = PRODUCT_DATA[3];
      const copy: ProductDataModel = new ProductDataModel(
        original.id,
        original.imageRes,
        original.title,
        original.price,
      );
      copy.title = $r('app.string.embed_product_title000');
      const actualValue = copy.title;
      const expectedValue = $r('app.string.embed_product_title000');
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

    // @tc.number GoodsMutationPart74_0016_mutate_price_source3_image3_title0_price1_mode3
    // @tc.name GoodsMutationPart74_0016_mutate_price_source3_image3_title0_price1_mode3
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ProductDataModel field mutation preserves unrelated fields and imported catalog
    it('GoodsMutationPart74_0016_mutate_price_source3_image3_title0_price1_mode3', 0, (): void => {
      const original: ProductDataModel = PRODUCT_DATA[3];
      const copy: ProductDataModel = new ProductDataModel(
        original.id,
        original.imageRes,
        original.title,
        original.price,
      );
      copy.price = $r('app.string.embed_product_price001');
      const actualValue = copy.price;
      const expectedValue = $r('app.string.embed_product_price001');
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

    // @tc.number GoodsMutationPart74_0017_mutate_id_source3_image3_title0_price1_mode4
    // @tc.name GoodsMutationPart74_0017_mutate_id_source3_image3_title0_price1_mode4
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ProductDataModel field mutation preserves unrelated fields and imported catalog
    it('GoodsMutationPart74_0017_mutate_id_source3_image3_title0_price1_mode4', 0, (): void => {
      const original: ProductDataModel = PRODUCT_DATA[3];
      const copy: ProductDataModel = new ProductDataModel(
        original.id,
        original.imageRes,
        original.title,
        original.price,
      );
      copy.id = -1;
      const actualValue = copy.id;
      const expectedValue = -1;
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

    // @tc.number GoodsMutationPart74_0018_mutate_imageRes_source3_image3_title0_price1_mode5
    // @tc.name GoodsMutationPart74_0018_mutate_imageRes_source3_image3_title0_price1_mode5
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ProductDataModel field mutation preserves unrelated fields and imported catalog
    it('GoodsMutationPart74_0018_mutate_imageRes_source3_image3_title0_price1_mode5', 0, (): void => {
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

    // @tc.number GoodsMutationPart74_0019_mutate_title_source3_image3_title0_price1_mode6
    // @tc.name GoodsMutationPart74_0019_mutate_title_source3_image3_title0_price1_mode6
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ProductDataModel field mutation preserves unrelated fields and imported catalog
    it('GoodsMutationPart74_0019_mutate_title_source3_image3_title0_price1_mode6', 0, (): void => {
      const original: ProductDataModel = PRODUCT_DATA[3];
      const copy: ProductDataModel = new ProductDataModel(
        original.id,
        original.imageRes,
        original.title,
        original.price,
      );
      copy.title = $r('app.string.embed_product_title000');
      const actualValue = copy.title;
      const expectedValue = $r('app.string.embed_product_title000');
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

    // @tc.number GoodsMutationPart74_0020_mutate_price_source3_image3_title0_price1_mode7
    // @tc.name GoodsMutationPart74_0020_mutate_price_source3_image3_title0_price1_mode7
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ProductDataModel field mutation preserves unrelated fields and imported catalog
    it('GoodsMutationPart74_0020_mutate_price_source3_image3_title0_price1_mode7', 0, (): void => {
      const original: ProductDataModel = PRODUCT_DATA[3];
      const copy: ProductDataModel = new ProductDataModel(
        original.id,
        original.imageRes,
        original.title,
        original.price,
      );
      copy.price = $r('app.string.embed_product_price001');
      const actualValue = copy.price;
      const expectedValue = $r('app.string.embed_product_price001');
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

    // @tc.number GoodsMutationPart74_0021_mutate_id_source4_image4_title0_price1_mode0
    // @tc.name GoodsMutationPart74_0021_mutate_id_source4_image4_title0_price1_mode0
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ProductDataModel field mutation preserves unrelated fields and imported catalog
    it('GoodsMutationPart74_0021_mutate_id_source4_image4_title0_price1_mode0', 0, (): void => {
      const original: ProductDataModel = PRODUCT_DATA[4];
      const copy: ProductDataModel = new ProductDataModel(
        original.id,
        original.imageRes,
        original.title,
        original.price,
      );
      copy.id = -1;
      const actualValue = copy.id;
      const expectedValue = -1;
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
      expect(originalId).assertEqual(4);
    });

    // @tc.number GoodsMutationPart74_0022_mutate_imageRes_source4_image4_title0_price1_mode1
    // @tc.name GoodsMutationPart74_0022_mutate_imageRes_source4_image4_title0_price1_mode1
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ProductDataModel field mutation preserves unrelated fields and imported catalog
    it('GoodsMutationPart74_0022_mutate_imageRes_source4_image4_title0_price1_mode1', 0, (): void => {
      const original: ProductDataModel = PRODUCT_DATA[4];
      const copy: ProductDataModel = new ProductDataModel(
        original.id,
        original.imageRes,
        original.title,
        original.price,
      );
      copy.imageRes = $r('app.media.embed_product004');
      const actualValue = copy.imageRes;
      const expectedValue = $r('app.media.embed_product004');
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
      expect(originalId).assertEqual(4);
    });

    // @tc.number GoodsMutationPart74_0023_mutate_title_source4_image4_title0_price1_mode2
    // @tc.name GoodsMutationPart74_0023_mutate_title_source4_image4_title0_price1_mode2
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ProductDataModel field mutation preserves unrelated fields and imported catalog
    it('GoodsMutationPart74_0023_mutate_title_source4_image4_title0_price1_mode2', 0, (): void => {
      const original: ProductDataModel = PRODUCT_DATA[4];
      const copy: ProductDataModel = new ProductDataModel(
        original.id,
        original.imageRes,
        original.title,
        original.price,
      );
      copy.title = $r('app.string.embed_product_title000');
      const actualValue = copy.title;
      const expectedValue = $r('app.string.embed_product_title000');
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
      expect(originalId).assertEqual(4);
    });

    // @tc.number GoodsMutationPart74_0024_mutate_price_source4_image4_title0_price1_mode3
    // @tc.name GoodsMutationPart74_0024_mutate_price_source4_image4_title0_price1_mode3
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ProductDataModel field mutation preserves unrelated fields and imported catalog
    it('GoodsMutationPart74_0024_mutate_price_source4_image4_title0_price1_mode3', 0, (): void => {
      const original: ProductDataModel = PRODUCT_DATA[4];
      const copy: ProductDataModel = new ProductDataModel(
        original.id,
        original.imageRes,
        original.title,
        original.price,
      );
      copy.price = $r('app.string.embed_product_price001');
      const actualValue = copy.price;
      const expectedValue = $r('app.string.embed_product_price001');
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
      expect(originalId).assertEqual(4);
    });

    // @tc.number GoodsMutationPart74_0025_mutate_id_source4_image4_title0_price1_mode4
    // @tc.name GoodsMutationPart74_0025_mutate_id_source4_image4_title0_price1_mode4
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ProductDataModel field mutation preserves unrelated fields and imported catalog
    it('GoodsMutationPart74_0025_mutate_id_source4_image4_title0_price1_mode4', 0, (): void => {
      const original: ProductDataModel = PRODUCT_DATA[4];
      const copy: ProductDataModel = new ProductDataModel(
        original.id,
        original.imageRes,
        original.title,
        original.price,
      );
      copy.id = -1;
      const actualValue = copy.id;
      const expectedValue = -1;
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
      expect(originalId).assertEqual(4);
    });

    // @tc.number GoodsMutationPart74_0026_mutate_imageRes_source4_image4_title0_price1_mode5
    // @tc.name GoodsMutationPart74_0026_mutate_imageRes_source4_image4_title0_price1_mode5
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ProductDataModel field mutation preserves unrelated fields and imported catalog
    it('GoodsMutationPart74_0026_mutate_imageRes_source4_image4_title0_price1_mode5', 0, (): void => {
      const original: ProductDataModel = PRODUCT_DATA[4];
      const copy: ProductDataModel = new ProductDataModel(
        original.id,
        original.imageRes,
        original.title,
        original.price,
      );
      copy.imageRes = $r('app.media.embed_product004');
      const actualValue = copy.imageRes;
      const expectedValue = $r('app.media.embed_product004');
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
      expect(originalId).assertEqual(4);
    });

    // @tc.number GoodsMutationPart74_0027_mutate_title_source4_image4_title0_price1_mode6
    // @tc.name GoodsMutationPart74_0027_mutate_title_source4_image4_title0_price1_mode6
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ProductDataModel field mutation preserves unrelated fields and imported catalog
    it('GoodsMutationPart74_0027_mutate_title_source4_image4_title0_price1_mode6', 0, (): void => {
      const original: ProductDataModel = PRODUCT_DATA[4];
      const copy: ProductDataModel = new ProductDataModel(
        original.id,
        original.imageRes,
        original.title,
        original.price,
      );
      copy.title = $r('app.string.embed_product_title000');
      const actualValue = copy.title;
      const expectedValue = $r('app.string.embed_product_title000');
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
      expect(originalId).assertEqual(4);
    });

    // @tc.number GoodsMutationPart74_0028_mutate_price_source4_image4_title0_price1_mode7
    // @tc.name GoodsMutationPart74_0028_mutate_price_source4_image4_title0_price1_mode7
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ProductDataModel field mutation preserves unrelated fields and imported catalog
    it('GoodsMutationPart74_0028_mutate_price_source4_image4_title0_price1_mode7', 0, (): void => {
      const original: ProductDataModel = PRODUCT_DATA[4];
      const copy: ProductDataModel = new ProductDataModel(
        original.id,
        original.imageRes,
        original.title,
        original.price,
      );
      copy.price = $r('app.string.embed_product_price001');
      const actualValue = copy.price;
      const expectedValue = $r('app.string.embed_product_price001');
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
      expect(originalId).assertEqual(4);
    });

    // @tc.number GoodsMutationPart74_0029_mutate_id_source5_image5_title0_price1_mode0
    // @tc.name GoodsMutationPart74_0029_mutate_id_source5_image5_title0_price1_mode0
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ProductDataModel field mutation preserves unrelated fields and imported catalog
    it('GoodsMutationPart74_0029_mutate_id_source5_image5_title0_price1_mode0', 0, (): void => {
      const original: ProductDataModel = PRODUCT_DATA[5];
      const copy: ProductDataModel = new ProductDataModel(
        original.id,
        original.imageRes,
        original.title,
        original.price,
      );
      copy.id = -1;
      const actualValue = copy.id;
      const expectedValue = -1;
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
      expect(originalId).assertEqual(5);
    });

    // @tc.number GoodsMutationPart74_0030_mutate_imageRes_source5_image5_title0_price1_mode1
    // @tc.name GoodsMutationPart74_0030_mutate_imageRes_source5_image5_title0_price1_mode1
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ProductDataModel field mutation preserves unrelated fields and imported catalog
    it('GoodsMutationPart74_0030_mutate_imageRes_source5_image5_title0_price1_mode1', 0, (): void => {
      const original: ProductDataModel = PRODUCT_DATA[5];
      const copy: ProductDataModel = new ProductDataModel(
        original.id,
        original.imageRes,
        original.title,
        original.price,
      );
      copy.imageRes = $r('app.media.embed_product005');
      const actualValue = copy.imageRes;
      const expectedValue = $r('app.media.embed_product005');
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
      expect(originalId).assertEqual(5);
    });

    // @tc.number GoodsMutationPart74_0031_mutate_title_source5_image5_title0_price1_mode2
    // @tc.name GoodsMutationPart74_0031_mutate_title_source5_image5_title0_price1_mode2
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ProductDataModel field mutation preserves unrelated fields and imported catalog
    it('GoodsMutationPart74_0031_mutate_title_source5_image5_title0_price1_mode2', 0, (): void => {
      const original: ProductDataModel = PRODUCT_DATA[5];
      const copy: ProductDataModel = new ProductDataModel(
        original.id,
        original.imageRes,
        original.title,
        original.price,
      );
      copy.title = $r('app.string.embed_product_title000');
      const actualValue = copy.title;
      const expectedValue = $r('app.string.embed_product_title000');
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
      expect(originalId).assertEqual(5);
    });

    // @tc.number GoodsMutationPart74_0032_mutate_price_source5_image5_title0_price1_mode3
    // @tc.name GoodsMutationPart74_0032_mutate_price_source5_image5_title0_price1_mode3
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ProductDataModel field mutation preserves unrelated fields and imported catalog
    it('GoodsMutationPart74_0032_mutate_price_source5_image5_title0_price1_mode3', 0, (): void => {
      const original: ProductDataModel = PRODUCT_DATA[5];
      const copy: ProductDataModel = new ProductDataModel(
        original.id,
        original.imageRes,
        original.title,
        original.price,
      );
      copy.price = $r('app.string.embed_product_price001');
      const actualValue = copy.price;
      const expectedValue = $r('app.string.embed_product_price001');
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
      expect(originalId).assertEqual(5);
    });

    // @tc.number GoodsMutationPart74_0033_mutate_id_source5_image5_title0_price1_mode4
    // @tc.name GoodsMutationPart74_0033_mutate_id_source5_image5_title0_price1_mode4
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ProductDataModel field mutation preserves unrelated fields and imported catalog
    it('GoodsMutationPart74_0033_mutate_id_source5_image5_title0_price1_mode4', 0, (): void => {
      const original: ProductDataModel = PRODUCT_DATA[5];
      const copy: ProductDataModel = new ProductDataModel(
        original.id,
        original.imageRes,
        original.title,
        original.price,
      );
      copy.id = -1;
      const actualValue = copy.id;
      const expectedValue = -1;
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
      expect(originalId).assertEqual(5);
    });

    // @tc.number GoodsMutationPart74_0034_mutate_imageRes_source5_image5_title0_price1_mode5
    // @tc.name GoodsMutationPart74_0034_mutate_imageRes_source5_image5_title0_price1_mode5
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ProductDataModel field mutation preserves unrelated fields and imported catalog
    it('GoodsMutationPart74_0034_mutate_imageRes_source5_image5_title0_price1_mode5', 0, (): void => {
      const original: ProductDataModel = PRODUCT_DATA[5];
      const copy: ProductDataModel = new ProductDataModel(
        original.id,
        original.imageRes,
        original.title,
        original.price,
      );
      copy.imageRes = $r('app.media.embed_product005');
      const actualValue = copy.imageRes;
      const expectedValue = $r('app.media.embed_product005');
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
      expect(originalId).assertEqual(5);
    });

    // @tc.number GoodsMutationPart74_0035_mutate_title_source5_image5_title0_price1_mode6
    // @tc.name GoodsMutationPart74_0035_mutate_title_source5_image5_title0_price1_mode6
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ProductDataModel field mutation preserves unrelated fields and imported catalog
    it('GoodsMutationPart74_0035_mutate_title_source5_image5_title0_price1_mode6', 0, (): void => {
      const original: ProductDataModel = PRODUCT_DATA[5];
      const copy: ProductDataModel = new ProductDataModel(
        original.id,
        original.imageRes,
        original.title,
        original.price,
      );
      copy.title = $r('app.string.embed_product_title000');
      const actualValue = copy.title;
      const expectedValue = $r('app.string.embed_product_title000');
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
      expect(originalId).assertEqual(5);
    });

    // @tc.number GoodsMutationPart74_0036_mutate_price_source5_image5_title0_price1_mode7
    // @tc.name GoodsMutationPart74_0036_mutate_price_source5_image5_title0_price1_mode7
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ProductDataModel field mutation preserves unrelated fields and imported catalog
    it('GoodsMutationPart74_0036_mutate_price_source5_image5_title0_price1_mode7', 0, (): void => {
      const original: ProductDataModel = PRODUCT_DATA[5];
      const copy: ProductDataModel = new ProductDataModel(
        original.id,
        original.imageRes,
        original.title,
        original.price,
      );
      copy.price = $r('app.string.embed_product_price001');
      const actualValue = copy.price;
      const expectedValue = $r('app.string.embed_product_price001');
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
      expect(originalId).assertEqual(5);
    });

    // @tc.number GoodsMutationPart74_0037_mutate_id_source0_image0_title1_price1_mode0
    // @tc.name GoodsMutationPart74_0037_mutate_id_source0_image0_title1_price1_mode0
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ProductDataModel field mutation preserves unrelated fields and imported catalog
    it('GoodsMutationPart74_0037_mutate_id_source0_image0_title1_price1_mode0', 0, (): void => {
      const original: ProductDataModel = PRODUCT_DATA[0];
      const copy: ProductDataModel = new ProductDataModel(
        original.id,
        original.imageRes,
        original.title,
        original.price,
      );
      copy.id = -1;
      const actualValue = copy.id;
      const expectedValue = -1;
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

    // @tc.number GoodsMutationPart74_0038_mutate_imageRes_source0_image0_title1_price1_mode1
    // @tc.name GoodsMutationPart74_0038_mutate_imageRes_source0_image0_title1_price1_mode1
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ProductDataModel field mutation preserves unrelated fields and imported catalog
    it('GoodsMutationPart74_0038_mutate_imageRes_source0_image0_title1_price1_mode1', 0, (): void => {
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

    // @tc.number GoodsMutationPart74_0039_mutate_title_source0_image0_title1_price1_mode2
    // @tc.name GoodsMutationPart74_0039_mutate_title_source0_image0_title1_price1_mode2
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ProductDataModel field mutation preserves unrelated fields and imported catalog
    it('GoodsMutationPart74_0039_mutate_title_source0_image0_title1_price1_mode2', 0, (): void => {
      const original: ProductDataModel = PRODUCT_DATA[0];
      const copy: ProductDataModel = new ProductDataModel(
        original.id,
        original.imageRes,
        original.title,
        original.price,
      );
      copy.title = $r('app.string.embed_product_title001');
      const actualValue = copy.title;
      const expectedValue = $r('app.string.embed_product_title001');
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

    // @tc.number GoodsMutationPart74_0040_mutate_price_source0_image0_title1_price1_mode3
    // @tc.name GoodsMutationPart74_0040_mutate_price_source0_image0_title1_price1_mode3
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ProductDataModel field mutation preserves unrelated fields and imported catalog
    it('GoodsMutationPart74_0040_mutate_price_source0_image0_title1_price1_mode3', 0, (): void => {
      const original: ProductDataModel = PRODUCT_DATA[0];
      const copy: ProductDataModel = new ProductDataModel(
        original.id,
        original.imageRes,
        original.title,
        original.price,
      );
      copy.price = $r('app.string.embed_product_price001');
      const actualValue = copy.price;
      const expectedValue = $r('app.string.embed_product_price001');
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

    // @tc.number GoodsMutationPart74_0041_mutate_id_source0_image0_title1_price1_mode4
    // @tc.name GoodsMutationPart74_0041_mutate_id_source0_image0_title1_price1_mode4
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ProductDataModel field mutation preserves unrelated fields and imported catalog
    it('GoodsMutationPart74_0041_mutate_id_source0_image0_title1_price1_mode4', 0, (): void => {
      const original: ProductDataModel = PRODUCT_DATA[0];
      const copy: ProductDataModel = new ProductDataModel(
        original.id,
        original.imageRes,
        original.title,
        original.price,
      );
      copy.id = -1;
      const actualValue = copy.id;
      const expectedValue = -1;
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

    // @tc.number GoodsMutationPart74_0042_mutate_imageRes_source0_image0_title1_price1_mode5
    // @tc.name GoodsMutationPart74_0042_mutate_imageRes_source0_image0_title1_price1_mode5
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ProductDataModel field mutation preserves unrelated fields and imported catalog
    it('GoodsMutationPart74_0042_mutate_imageRes_source0_image0_title1_price1_mode5', 0, (): void => {
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

    // @tc.number GoodsMutationPart74_0043_mutate_title_source0_image0_title1_price1_mode6
    // @tc.name GoodsMutationPart74_0043_mutate_title_source0_image0_title1_price1_mode6
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ProductDataModel field mutation preserves unrelated fields and imported catalog
    it('GoodsMutationPart74_0043_mutate_title_source0_image0_title1_price1_mode6', 0, (): void => {
      const original: ProductDataModel = PRODUCT_DATA[0];
      const copy: ProductDataModel = new ProductDataModel(
        original.id,
        original.imageRes,
        original.title,
        original.price,
      );
      copy.title = $r('app.string.embed_product_title001');
      const actualValue = copy.title;
      const expectedValue = $r('app.string.embed_product_title001');
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
  });
}
