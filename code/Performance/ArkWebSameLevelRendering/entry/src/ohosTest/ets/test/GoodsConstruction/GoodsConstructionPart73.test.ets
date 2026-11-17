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

export default function GoodsConstructionPart73(): void {
  describe('GoodsConstructionPart73', () => {
    beforeAll(async (): Promise<void> => {
      await Promise.resolve();
    });
    // @tc.number GoodsConstructionPart73_0998_empty_resource_strings
    // @tc.name GoodsConstructionPart73_0998_empty_resource_strings
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ProductDataModel constructor preserves empty ResourceStr inputs without inserting defaults
    it('GoodsConstructionPart73_0998_empty_resource_strings', 0, (): void => {
      const image: ResourceStr = '';
      const title: ResourceStr = '';
      const price: ResourceStr = '';
      const product: ProductDataModel = new ProductDataModel(0, image, title, price);
      const actualImage: ResourceStr = product.imageRes;
      const actualTitle: ResourceStr = product.title;
      const actualPrice: ResourceStr = product.price;
      const actualId: number = product.id;
      expect(actualImage).assertEqual(image);
      expect(actualTitle).assertEqual(title);
      expect(actualPrice).assertEqual(price);
      expect(actualId).assertEqual(0);
    });

    // @tc.number GoodsConstructionPart73_0999_mixed_resource_strings
    // @tc.name GoodsConstructionPart73_0999_mixed_resource_strings
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ProductDataModel constructor accepts a resource image with literal title and price
    it('GoodsConstructionPart73_0999_mixed_resource_strings', 0, (): void => {
      const image: ResourceStr = $r('app.media.embed_product000');
      const title: ResourceStr = 'Power Bank';
      const price: ResourceStr = '79.90';
      const product: ProductDataModel = new ProductDataModel(0, image, title, price);
      const actualImage: ResourceStr = product.imageRes;
      const actualTitle: ResourceStr = product.title;
      const actualPrice: ResourceStr = product.price;
      const actualId: number = product.id;
      const titleLength: number = title.length;
      const priceLength: number = price.length;
      expect(actualImage).assertEqual(image);
      expect(actualTitle).assertEqual(title);
      expect(actualPrice).assertEqual(price);
      expect(actualId).assertEqual(0);
      expect(titleLength).assertEqual(10);
      expect(priceLength).assertEqual(5);
    });

    beforeEach(async (): Promise<void> => {
      await yieldTestEventLoop();
    });
    afterEach((): void => {});
    afterAll((): void => {});

    // @tc.number GoodsConstructionPart73_0001_constructor_id7_image5_title0_price1
    // @tc.name GoodsConstructionPart73_0001_constructor_id7_image5_title0_price1
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ProductDataModel constructor preserves independent resource fields and boundary identifier
    it('GoodsConstructionPart73_0001_constructor_id7_image5_title0_price1', 0, (): void => {
      const expectedId: number = -0.5;
      const expectedImage: ResourceStr = $r('app.media.embed_product005');
      const expectedTitle: ResourceStr = $r('app.string.embed_product_title000');
      const expectedPrice: ResourceStr = $r('app.string.embed_product_price001');
      const actual: ProductDataModel = new ProductDataModel(expectedId, expectedImage, expectedTitle, expectedPrice);
      const actualId: number = actual.id;
      const actualImage: ResourceStr = actual.imageRes;
      const actualTitle: ResourceStr = actual.title;
      const actualPrice: ResourceStr = actual.price;
      expect(actualId).assertEqual(expectedId);
      expect(actualImage).assertEqual(expectedImage);
      expect(actualTitle).assertEqual(expectedTitle);
      expect(actualPrice).assertEqual(expectedPrice);
    });

    // @tc.number GoodsConstructionPart73_0002_constructor_id0_image0_title1_price1
    // @tc.name GoodsConstructionPart73_0002_constructor_id0_image0_title1_price1
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ProductDataModel constructor preserves independent resource fields and boundary identifier
    it('GoodsConstructionPart73_0002_constructor_id0_image0_title1_price1', 0, (): void => {
      const expectedId: number = -1;
      const expectedImage: ResourceStr = $r('app.media.embed_product000');
      const expectedTitle: ResourceStr = $r('app.string.embed_product_title001');
      const expectedPrice: ResourceStr = $r('app.string.embed_product_price001');
      const actual: ProductDataModel = new ProductDataModel(expectedId, expectedImage, expectedTitle, expectedPrice);
      const actualId: number = actual.id;
      const actualImage: ResourceStr = actual.imageRes;
      const actualTitle: ResourceStr = actual.title;
      const actualPrice: ResourceStr = actual.price;
      expect(actualId).assertEqual(expectedId);
      expect(actualImage).assertEqual(expectedImage);
      expect(actualTitle).assertEqual(expectedTitle);
      expect(actualPrice).assertEqual(expectedPrice);
    });

    // @tc.number GoodsConstructionPart73_0003_constructor_id1_image0_title1_price1
    // @tc.name GoodsConstructionPart73_0003_constructor_id1_image0_title1_price1
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ProductDataModel constructor preserves independent resource fields and boundary identifier
    it('GoodsConstructionPart73_0003_constructor_id1_image0_title1_price1', 0, (): void => {
      const expectedId: number = 0;
      const expectedImage: ResourceStr = $r('app.media.embed_product000');
      const expectedTitle: ResourceStr = $r('app.string.embed_product_title001');
      const expectedPrice: ResourceStr = $r('app.string.embed_product_price001');
      const actual: ProductDataModel = new ProductDataModel(expectedId, expectedImage, expectedTitle, expectedPrice);
      const actualId: number = actual.id;
      const actualImage: ResourceStr = actual.imageRes;
      const actualTitle: ResourceStr = actual.title;
      const actualPrice: ResourceStr = actual.price;
      expect(actualId).assertEqual(expectedId);
      expect(actualImage).assertEqual(expectedImage);
      expect(actualTitle).assertEqual(expectedTitle);
      expect(actualPrice).assertEqual(expectedPrice);
    });

    // @tc.number GoodsConstructionPart73_0004_constructor_id2_image0_title1_price1
    // @tc.name GoodsConstructionPart73_0004_constructor_id2_image0_title1_price1
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ProductDataModel constructor preserves independent resource fields and boundary identifier
    it('GoodsConstructionPart73_0004_constructor_id2_image0_title1_price1', 0, (): void => {
      const expectedId: number = 1;
      const expectedImage: ResourceStr = $r('app.media.embed_product000');
      const expectedTitle: ResourceStr = $r('app.string.embed_product_title001');
      const expectedPrice: ResourceStr = $r('app.string.embed_product_price001');
      const actual: ProductDataModel = new ProductDataModel(expectedId, expectedImage, expectedTitle, expectedPrice);
      const actualId: number = actual.id;
      const actualImage: ResourceStr = actual.imageRes;
      const actualTitle: ResourceStr = actual.title;
      const actualPrice: ResourceStr = actual.price;
      expect(actualId).assertEqual(expectedId);
      expect(actualImage).assertEqual(expectedImage);
      expect(actualTitle).assertEqual(expectedTitle);
      expect(actualPrice).assertEqual(expectedPrice);
    });

    // @tc.number GoodsConstructionPart73_0005_constructor_id3_image0_title1_price1
    // @tc.name GoodsConstructionPart73_0005_constructor_id3_image0_title1_price1
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ProductDataModel constructor preserves independent resource fields and boundary identifier
    it('GoodsConstructionPart73_0005_constructor_id3_image0_title1_price1', 0, (): void => {
      const expectedId: number = 2147483647;
      const expectedImage: ResourceStr = $r('app.media.embed_product000');
      const expectedTitle: ResourceStr = $r('app.string.embed_product_title001');
      const expectedPrice: ResourceStr = $r('app.string.embed_product_price001');
      const actual: ProductDataModel = new ProductDataModel(expectedId, expectedImage, expectedTitle, expectedPrice);
      const actualId: number = actual.id;
      const actualImage: ResourceStr = actual.imageRes;
      const actualTitle: ResourceStr = actual.title;
      const actualPrice: ResourceStr = actual.price;
      expect(actualId).assertEqual(expectedId);
      expect(actualImage).assertEqual(expectedImage);
      expect(actualTitle).assertEqual(expectedTitle);
      expect(actualPrice).assertEqual(expectedPrice);
    });

    // @tc.number GoodsConstructionPart73_0006_constructor_id4_image0_title1_price1
    // @tc.name GoodsConstructionPart73_0006_constructor_id4_image0_title1_price1
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ProductDataModel constructor preserves independent resource fields and boundary identifier
    it('GoodsConstructionPart73_0006_constructor_id4_image0_title1_price1', 0, (): void => {
      const expectedId: number = -2147483648;
      const expectedImage: ResourceStr = $r('app.media.embed_product000');
      const expectedTitle: ResourceStr = $r('app.string.embed_product_title001');
      const expectedPrice: ResourceStr = $r('app.string.embed_product_price001');
      const actual: ProductDataModel = new ProductDataModel(expectedId, expectedImage, expectedTitle, expectedPrice);
      const actualId: number = actual.id;
      const actualImage: ResourceStr = actual.imageRes;
      const actualTitle: ResourceStr = actual.title;
      const actualPrice: ResourceStr = actual.price;
      expect(actualId).assertEqual(expectedId);
      expect(actualImage).assertEqual(expectedImage);
      expect(actualTitle).assertEqual(expectedTitle);
      expect(actualPrice).assertEqual(expectedPrice);
    });

    // @tc.number GoodsConstructionPart73_0007_constructor_id5_image0_title1_price1
    // @tc.name GoodsConstructionPart73_0007_constructor_id5_image0_title1_price1
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ProductDataModel constructor preserves independent resource fields and boundary identifier
    it('GoodsConstructionPart73_0007_constructor_id5_image0_title1_price1', 0, (): void => {
      const expectedId: number = 0.5;
      const expectedImage: ResourceStr = $r('app.media.embed_product000');
      const expectedTitle: ResourceStr = $r('app.string.embed_product_title001');
      const expectedPrice: ResourceStr = $r('app.string.embed_product_price001');
      const actual: ProductDataModel = new ProductDataModel(expectedId, expectedImage, expectedTitle, expectedPrice);
      const actualId: number = actual.id;
      const actualImage: ResourceStr = actual.imageRes;
      const actualTitle: ResourceStr = actual.title;
      const actualPrice: ResourceStr = actual.price;
      expect(actualId).assertEqual(expectedId);
      expect(actualImage).assertEqual(expectedImage);
      expect(actualTitle).assertEqual(expectedTitle);
      expect(actualPrice).assertEqual(expectedPrice);
    });

    // @tc.number GoodsConstructionPart73_0008_constructor_id6_image0_title1_price1
    // @tc.name GoodsConstructionPart73_0008_constructor_id6_image0_title1_price1
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ProductDataModel constructor preserves independent resource fields and boundary identifier
    it('GoodsConstructionPart73_0008_constructor_id6_image0_title1_price1', 0, (): void => {
      const expectedId: number = 9007199254740991;
      const expectedImage: ResourceStr = $r('app.media.embed_product000');
      const expectedTitle: ResourceStr = $r('app.string.embed_product_title001');
      const expectedPrice: ResourceStr = $r('app.string.embed_product_price001');
      const actual: ProductDataModel = new ProductDataModel(expectedId, expectedImage, expectedTitle, expectedPrice);
      const actualId: number = actual.id;
      const actualImage: ResourceStr = actual.imageRes;
      const actualTitle: ResourceStr = actual.title;
      const actualPrice: ResourceStr = actual.price;
      expect(actualId).assertEqual(expectedId);
      expect(actualImage).assertEqual(expectedImage);
      expect(actualTitle).assertEqual(expectedTitle);
      expect(actualPrice).assertEqual(expectedPrice);
    });

    // @tc.number GoodsConstructionPart73_0009_constructor_id7_image0_title1_price1
    // @tc.name GoodsConstructionPart73_0009_constructor_id7_image0_title1_price1
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ProductDataModel constructor preserves independent resource fields and boundary identifier
    it('GoodsConstructionPart73_0009_constructor_id7_image0_title1_price1', 0, (): void => {
      const expectedId: number = -0.5;
      const expectedImage: ResourceStr = $r('app.media.embed_product000');
      const expectedTitle: ResourceStr = $r('app.string.embed_product_title001');
      const expectedPrice: ResourceStr = $r('app.string.embed_product_price001');
      const actual: ProductDataModel = new ProductDataModel(expectedId, expectedImage, expectedTitle, expectedPrice);
      const actualId: number = actual.id;
      const actualImage: ResourceStr = actual.imageRes;
      const actualTitle: ResourceStr = actual.title;
      const actualPrice: ResourceStr = actual.price;
      expect(actualId).assertEqual(expectedId);
      expect(actualImage).assertEqual(expectedImage);
      expect(actualTitle).assertEqual(expectedTitle);
      expect(actualPrice).assertEqual(expectedPrice);
    });

    // @tc.number GoodsConstructionPart73_0010_constructor_id0_image1_title1_price1
    // @tc.name GoodsConstructionPart73_0010_constructor_id0_image1_title1_price1
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ProductDataModel constructor preserves independent resource fields and boundary identifier
    it('GoodsConstructionPart73_0010_constructor_id0_image1_title1_price1', 0, (): void => {
      const expectedId: number = -1;
      const expectedImage: ResourceStr = $r('app.media.embed_product001');
      const expectedTitle: ResourceStr = $r('app.string.embed_product_title001');
      const expectedPrice: ResourceStr = $r('app.string.embed_product_price001');
      const actual: ProductDataModel = new ProductDataModel(expectedId, expectedImage, expectedTitle, expectedPrice);
      const actualId: number = actual.id;
      const actualImage: ResourceStr = actual.imageRes;
      const actualTitle: ResourceStr = actual.title;
      const actualPrice: ResourceStr = actual.price;
      expect(actualId).assertEqual(expectedId);
      expect(actualImage).assertEqual(expectedImage);
      expect(actualTitle).assertEqual(expectedTitle);
      expect(actualPrice).assertEqual(expectedPrice);
    });

    // @tc.number GoodsConstructionPart73_0011_constructor_id1_image1_title1_price1
    // @tc.name GoodsConstructionPart73_0011_constructor_id1_image1_title1_price1
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ProductDataModel constructor preserves independent resource fields and boundary identifier
    it('GoodsConstructionPart73_0011_constructor_id1_image1_title1_price1', 0, (): void => {
      const expectedId: number = 0;
      const expectedImage: ResourceStr = $r('app.media.embed_product001');
      const expectedTitle: ResourceStr = $r('app.string.embed_product_title001');
      const expectedPrice: ResourceStr = $r('app.string.embed_product_price001');
      const actual: ProductDataModel = new ProductDataModel(expectedId, expectedImage, expectedTitle, expectedPrice);
      const actualId: number = actual.id;
      const actualImage: ResourceStr = actual.imageRes;
      const actualTitle: ResourceStr = actual.title;
      const actualPrice: ResourceStr = actual.price;
      expect(actualId).assertEqual(expectedId);
      expect(actualImage).assertEqual(expectedImage);
      expect(actualTitle).assertEqual(expectedTitle);
      expect(actualPrice).assertEqual(expectedPrice);
    });

    // @tc.number GoodsConstructionPart73_0012_constructor_id2_image1_title1_price1
    // @tc.name GoodsConstructionPart73_0012_constructor_id2_image1_title1_price1
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ProductDataModel constructor preserves independent resource fields and boundary identifier
    it('GoodsConstructionPart73_0012_constructor_id2_image1_title1_price1', 0, (): void => {
      const expectedId: number = 1;
      const expectedImage: ResourceStr = $r('app.media.embed_product001');
      const expectedTitle: ResourceStr = $r('app.string.embed_product_title001');
      const expectedPrice: ResourceStr = $r('app.string.embed_product_price001');
      const actual: ProductDataModel = new ProductDataModel(expectedId, expectedImage, expectedTitle, expectedPrice);
      const actualId: number = actual.id;
      const actualImage: ResourceStr = actual.imageRes;
      const actualTitle: ResourceStr = actual.title;
      const actualPrice: ResourceStr = actual.price;
      expect(actualId).assertEqual(expectedId);
      expect(actualImage).assertEqual(expectedImage);
      expect(actualTitle).assertEqual(expectedTitle);
      expect(actualPrice).assertEqual(expectedPrice);
    });

    // @tc.number GoodsConstructionPart73_0013_constructor_id3_image1_title1_price1
    // @tc.name GoodsConstructionPart73_0013_constructor_id3_image1_title1_price1
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ProductDataModel constructor preserves independent resource fields and boundary identifier
    it('GoodsConstructionPart73_0013_constructor_id3_image1_title1_price1', 0, (): void => {
      const expectedId: number = 2147483647;
      const expectedImage: ResourceStr = $r('app.media.embed_product001');
      const expectedTitle: ResourceStr = $r('app.string.embed_product_title001');
      const expectedPrice: ResourceStr = $r('app.string.embed_product_price001');
      const actual: ProductDataModel = new ProductDataModel(expectedId, expectedImage, expectedTitle, expectedPrice);
      const actualId: number = actual.id;
      const actualImage: ResourceStr = actual.imageRes;
      const actualTitle: ResourceStr = actual.title;
      const actualPrice: ResourceStr = actual.price;
      expect(actualId).assertEqual(expectedId);
      expect(actualImage).assertEqual(expectedImage);
      expect(actualTitle).assertEqual(expectedTitle);
      expect(actualPrice).assertEqual(expectedPrice);
    });

    // @tc.number GoodsConstructionPart73_0014_constructor_id4_image1_title1_price1
    // @tc.name GoodsConstructionPart73_0014_constructor_id4_image1_title1_price1
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ProductDataModel constructor preserves independent resource fields and boundary identifier
    it('GoodsConstructionPart73_0014_constructor_id4_image1_title1_price1', 0, (): void => {
      const expectedId: number = -2147483648;
      const expectedImage: ResourceStr = $r('app.media.embed_product001');
      const expectedTitle: ResourceStr = $r('app.string.embed_product_title001');
      const expectedPrice: ResourceStr = $r('app.string.embed_product_price001');
      const actual: ProductDataModel = new ProductDataModel(expectedId, expectedImage, expectedTitle, expectedPrice);
      const actualId: number = actual.id;
      const actualImage: ResourceStr = actual.imageRes;
      const actualTitle: ResourceStr = actual.title;
      const actualPrice: ResourceStr = actual.price;
      expect(actualId).assertEqual(expectedId);
      expect(actualImage).assertEqual(expectedImage);
      expect(actualTitle).assertEqual(expectedTitle);
      expect(actualPrice).assertEqual(expectedPrice);
    });

    // @tc.number GoodsConstructionPart73_0015_constructor_id5_image1_title1_price1
    // @tc.name GoodsConstructionPart73_0015_constructor_id5_image1_title1_price1
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ProductDataModel constructor preserves independent resource fields and boundary identifier
    it('GoodsConstructionPart73_0015_constructor_id5_image1_title1_price1', 0, (): void => {
      const expectedId: number = 0.5;
      const expectedImage: ResourceStr = $r('app.media.embed_product001');
      const expectedTitle: ResourceStr = $r('app.string.embed_product_title001');
      const expectedPrice: ResourceStr = $r('app.string.embed_product_price001');
      const actual: ProductDataModel = new ProductDataModel(expectedId, expectedImage, expectedTitle, expectedPrice);
      const actualId: number = actual.id;
      const actualImage: ResourceStr = actual.imageRes;
      const actualTitle: ResourceStr = actual.title;
      const actualPrice: ResourceStr = actual.price;
      expect(actualId).assertEqual(expectedId);
      expect(actualImage).assertEqual(expectedImage);
      expect(actualTitle).assertEqual(expectedTitle);
      expect(actualPrice).assertEqual(expectedPrice);
    });

    // @tc.number GoodsConstructionPart73_0016_constructor_id6_image1_title1_price1
    // @tc.name GoodsConstructionPart73_0016_constructor_id6_image1_title1_price1
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ProductDataModel constructor preserves independent resource fields and boundary identifier
    it('GoodsConstructionPart73_0016_constructor_id6_image1_title1_price1', 0, (): void => {
      const expectedId: number = 9007199254740991;
      const expectedImage: ResourceStr = $r('app.media.embed_product001');
      const expectedTitle: ResourceStr = $r('app.string.embed_product_title001');
      const expectedPrice: ResourceStr = $r('app.string.embed_product_price001');
      const actual: ProductDataModel = new ProductDataModel(expectedId, expectedImage, expectedTitle, expectedPrice);
      const actualId: number = actual.id;
      const actualImage: ResourceStr = actual.imageRes;
      const actualTitle: ResourceStr = actual.title;
      const actualPrice: ResourceStr = actual.price;
      expect(actualId).assertEqual(expectedId);
      expect(actualImage).assertEqual(expectedImage);
      expect(actualTitle).assertEqual(expectedTitle);
      expect(actualPrice).assertEqual(expectedPrice);
    });

    // @tc.number GoodsConstructionPart73_0017_constructor_id7_image1_title1_price1
    // @tc.name GoodsConstructionPart73_0017_constructor_id7_image1_title1_price1
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ProductDataModel constructor preserves independent resource fields and boundary identifier
    it('GoodsConstructionPart73_0017_constructor_id7_image1_title1_price1', 0, (): void => {
      const expectedId: number = -0.5;
      const expectedImage: ResourceStr = $r('app.media.embed_product001');
      const expectedTitle: ResourceStr = $r('app.string.embed_product_title001');
      const expectedPrice: ResourceStr = $r('app.string.embed_product_price001');
      const actual: ProductDataModel = new ProductDataModel(expectedId, expectedImage, expectedTitle, expectedPrice);
      const actualId: number = actual.id;
      const actualImage: ResourceStr = actual.imageRes;
      const actualTitle: ResourceStr = actual.title;
      const actualPrice: ResourceStr = actual.price;
      expect(actualId).assertEqual(expectedId);
      expect(actualImage).assertEqual(expectedImage);
      expect(actualTitle).assertEqual(expectedTitle);
      expect(actualPrice).assertEqual(expectedPrice);
    });

    // @tc.number GoodsConstructionPart73_0018_constructor_id0_image2_title1_price1
    // @tc.name GoodsConstructionPart73_0018_constructor_id0_image2_title1_price1
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ProductDataModel constructor preserves independent resource fields and boundary identifier
    it('GoodsConstructionPart73_0018_constructor_id0_image2_title1_price1', 0, (): void => {
      const expectedId: number = -1;
      const expectedImage: ResourceStr = $r('app.media.embed_product002');
      const expectedTitle: ResourceStr = $r('app.string.embed_product_title001');
      const expectedPrice: ResourceStr = $r('app.string.embed_product_price001');
      const actual: ProductDataModel = new ProductDataModel(expectedId, expectedImage, expectedTitle, expectedPrice);
      const actualId: number = actual.id;
      const actualImage: ResourceStr = actual.imageRes;
      const actualTitle: ResourceStr = actual.title;
      const actualPrice: ResourceStr = actual.price;
      expect(actualId).assertEqual(expectedId);
      expect(actualImage).assertEqual(expectedImage);
      expect(actualTitle).assertEqual(expectedTitle);
      expect(actualPrice).assertEqual(expectedPrice);
    });

    // @tc.number GoodsConstructionPart73_0019_constructor_id1_image2_title1_price1
    // @tc.name GoodsConstructionPart73_0019_constructor_id1_image2_title1_price1
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ProductDataModel constructor preserves independent resource fields and boundary identifier
    it('GoodsConstructionPart73_0019_constructor_id1_image2_title1_price1', 0, (): void => {
      const expectedId: number = 0;
      const expectedImage: ResourceStr = $r('app.media.embed_product002');
      const expectedTitle: ResourceStr = $r('app.string.embed_product_title001');
      const expectedPrice: ResourceStr = $r('app.string.embed_product_price001');
      const actual: ProductDataModel = new ProductDataModel(expectedId, expectedImage, expectedTitle, expectedPrice);
      const actualId: number = actual.id;
      const actualImage: ResourceStr = actual.imageRes;
      const actualTitle: ResourceStr = actual.title;
      const actualPrice: ResourceStr = actual.price;
      expect(actualId).assertEqual(expectedId);
      expect(actualImage).assertEqual(expectedImage);
      expect(actualTitle).assertEqual(expectedTitle);
      expect(actualPrice).assertEqual(expectedPrice);
    });

    // @tc.number GoodsConstructionPart73_0020_constructor_id2_image2_title1_price1
    // @tc.name GoodsConstructionPart73_0020_constructor_id2_image2_title1_price1
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ProductDataModel constructor preserves independent resource fields and boundary identifier
    it('GoodsConstructionPart73_0020_constructor_id2_image2_title1_price1', 0, (): void => {
      const expectedId: number = 1;
      const expectedImage: ResourceStr = $r('app.media.embed_product002');
      const expectedTitle: ResourceStr = $r('app.string.embed_product_title001');
      const expectedPrice: ResourceStr = $r('app.string.embed_product_price001');
      const actual: ProductDataModel = new ProductDataModel(expectedId, expectedImage, expectedTitle, expectedPrice);
      const actualId: number = actual.id;
      const actualImage: ResourceStr = actual.imageRes;
      const actualTitle: ResourceStr = actual.title;
      const actualPrice: ResourceStr = actual.price;
      expect(actualId).assertEqual(expectedId);
      expect(actualImage).assertEqual(expectedImage);
      expect(actualTitle).assertEqual(expectedTitle);
      expect(actualPrice).assertEqual(expectedPrice);
    });

    // @tc.number GoodsConstructionPart73_0021_constructor_id3_image2_title1_price1
    // @tc.name GoodsConstructionPart73_0021_constructor_id3_image2_title1_price1
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ProductDataModel constructor preserves independent resource fields and boundary identifier
    it('GoodsConstructionPart73_0021_constructor_id3_image2_title1_price1', 0, (): void => {
      const expectedId: number = 2147483647;
      const expectedImage: ResourceStr = $r('app.media.embed_product002');
      const expectedTitle: ResourceStr = $r('app.string.embed_product_title001');
      const expectedPrice: ResourceStr = $r('app.string.embed_product_price001');
      const actual: ProductDataModel = new ProductDataModel(expectedId, expectedImage, expectedTitle, expectedPrice);
      const actualId: number = actual.id;
      const actualImage: ResourceStr = actual.imageRes;
      const actualTitle: ResourceStr = actual.title;
      const actualPrice: ResourceStr = actual.price;
      expect(actualId).assertEqual(expectedId);
      expect(actualImage).assertEqual(expectedImage);
      expect(actualTitle).assertEqual(expectedTitle);
      expect(actualPrice).assertEqual(expectedPrice);
    });

    // @tc.number GoodsConstructionPart73_0022_constructor_id4_image2_title1_price1
    // @tc.name GoodsConstructionPart73_0022_constructor_id4_image2_title1_price1
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ProductDataModel constructor preserves independent resource fields and boundary identifier
    it('GoodsConstructionPart73_0022_constructor_id4_image2_title1_price1', 0, (): void => {
      const expectedId: number = -2147483648;
      const expectedImage: ResourceStr = $r('app.media.embed_product002');
      const expectedTitle: ResourceStr = $r('app.string.embed_product_title001');
      const expectedPrice: ResourceStr = $r('app.string.embed_product_price001');
      const actual: ProductDataModel = new ProductDataModel(expectedId, expectedImage, expectedTitle, expectedPrice);
      const actualId: number = actual.id;
      const actualImage: ResourceStr = actual.imageRes;
      const actualTitle: ResourceStr = actual.title;
      const actualPrice: ResourceStr = actual.price;
      expect(actualId).assertEqual(expectedId);
      expect(actualImage).assertEqual(expectedImage);
      expect(actualTitle).assertEqual(expectedTitle);
      expect(actualPrice).assertEqual(expectedPrice);
    });

    // @tc.number GoodsConstructionPart73_0023_constructor_id5_image2_title1_price1
    // @tc.name GoodsConstructionPart73_0023_constructor_id5_image2_title1_price1
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ProductDataModel constructor preserves independent resource fields and boundary identifier
    it('GoodsConstructionPart73_0023_constructor_id5_image2_title1_price1', 0, (): void => {
      const expectedId: number = 0.5;
      const expectedImage: ResourceStr = $r('app.media.embed_product002');
      const expectedTitle: ResourceStr = $r('app.string.embed_product_title001');
      const expectedPrice: ResourceStr = $r('app.string.embed_product_price001');
      const actual: ProductDataModel = new ProductDataModel(expectedId, expectedImage, expectedTitle, expectedPrice);
      const actualId: number = actual.id;
      const actualImage: ResourceStr = actual.imageRes;
      const actualTitle: ResourceStr = actual.title;
      const actualPrice: ResourceStr = actual.price;
      expect(actualId).assertEqual(expectedId);
      expect(actualImage).assertEqual(expectedImage);
      expect(actualTitle).assertEqual(expectedTitle);
      expect(actualPrice).assertEqual(expectedPrice);
    });

    // @tc.number GoodsConstructionPart73_0024_constructor_id6_image2_title1_price1
    // @tc.name GoodsConstructionPart73_0024_constructor_id6_image2_title1_price1
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ProductDataModel constructor preserves independent resource fields and boundary identifier
    it('GoodsConstructionPart73_0024_constructor_id6_image2_title1_price1', 0, (): void => {
      const expectedId: number = 9007199254740991;
      const expectedImage: ResourceStr = $r('app.media.embed_product002');
      const expectedTitle: ResourceStr = $r('app.string.embed_product_title001');
      const expectedPrice: ResourceStr = $r('app.string.embed_product_price001');
      const actual: ProductDataModel = new ProductDataModel(expectedId, expectedImage, expectedTitle, expectedPrice);
      const actualId: number = actual.id;
      const actualImage: ResourceStr = actual.imageRes;
      const actualTitle: ResourceStr = actual.title;
      const actualPrice: ResourceStr = actual.price;
      expect(actualId).assertEqual(expectedId);
      expect(actualImage).assertEqual(expectedImage);
      expect(actualTitle).assertEqual(expectedTitle);
      expect(actualPrice).assertEqual(expectedPrice);
    });

    // @tc.number GoodsConstructionPart73_0025_constructor_id7_image2_title1_price1
    // @tc.name GoodsConstructionPart73_0025_constructor_id7_image2_title1_price1
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ProductDataModel constructor preserves independent resource fields and boundary identifier
    it('GoodsConstructionPart73_0025_constructor_id7_image2_title1_price1', 0, (): void => {
      const expectedId: number = -0.5;
      const expectedImage: ResourceStr = $r('app.media.embed_product002');
      const expectedTitle: ResourceStr = $r('app.string.embed_product_title001');
      const expectedPrice: ResourceStr = $r('app.string.embed_product_price001');
      const actual: ProductDataModel = new ProductDataModel(expectedId, expectedImage, expectedTitle, expectedPrice);
      const actualId: number = actual.id;
      const actualImage: ResourceStr = actual.imageRes;
      const actualTitle: ResourceStr = actual.title;
      const actualPrice: ResourceStr = actual.price;
      expect(actualId).assertEqual(expectedId);
      expect(actualImage).assertEqual(expectedImage);
      expect(actualTitle).assertEqual(expectedTitle);
      expect(actualPrice).assertEqual(expectedPrice);
    });

    // @tc.number GoodsConstructionPart73_0026_constructor_id0_image3_title1_price1
    // @tc.name GoodsConstructionPart73_0026_constructor_id0_image3_title1_price1
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ProductDataModel constructor preserves independent resource fields and boundary identifier
    it('GoodsConstructionPart73_0026_constructor_id0_image3_title1_price1', 0, (): void => {
      const expectedId: number = -1;
      const expectedImage: ResourceStr = $r('app.media.embed_product003');
      const expectedTitle: ResourceStr = $r('app.string.embed_product_title001');
      const expectedPrice: ResourceStr = $r('app.string.embed_product_price001');
      const actual: ProductDataModel = new ProductDataModel(expectedId, expectedImage, expectedTitle, expectedPrice);
      const actualId: number = actual.id;
      const actualImage: ResourceStr = actual.imageRes;
      const actualTitle: ResourceStr = actual.title;
      const actualPrice: ResourceStr = actual.price;
      expect(actualId).assertEqual(expectedId);
      expect(actualImage).assertEqual(expectedImage);
      expect(actualTitle).assertEqual(expectedTitle);
      expect(actualPrice).assertEqual(expectedPrice);
    });

    // @tc.number GoodsConstructionPart73_0027_constructor_id1_image3_title1_price1
    // @tc.name GoodsConstructionPart73_0027_constructor_id1_image3_title1_price1
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ProductDataModel constructor preserves independent resource fields and boundary identifier
    it('GoodsConstructionPart73_0027_constructor_id1_image3_title1_price1', 0, (): void => {
      const expectedId: number = 0;
      const expectedImage: ResourceStr = $r('app.media.embed_product003');
      const expectedTitle: ResourceStr = $r('app.string.embed_product_title001');
      const expectedPrice: ResourceStr = $r('app.string.embed_product_price001');
      const actual: ProductDataModel = new ProductDataModel(expectedId, expectedImage, expectedTitle, expectedPrice);
      const actualId: number = actual.id;
      const actualImage: ResourceStr = actual.imageRes;
      const actualTitle: ResourceStr = actual.title;
      const actualPrice: ResourceStr = actual.price;
      expect(actualId).assertEqual(expectedId);
      expect(actualImage).assertEqual(expectedImage);
      expect(actualTitle).assertEqual(expectedTitle);
      expect(actualPrice).assertEqual(expectedPrice);
    });

    // @tc.number GoodsConstructionPart73_0028_constructor_id2_image3_title1_price1
    // @tc.name GoodsConstructionPart73_0028_constructor_id2_image3_title1_price1
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ProductDataModel constructor preserves independent resource fields and boundary identifier
    it('GoodsConstructionPart73_0028_constructor_id2_image3_title1_price1', 0, (): void => {
      const expectedId: number = 1;
      const expectedImage: ResourceStr = $r('app.media.embed_product003');
      const expectedTitle: ResourceStr = $r('app.string.embed_product_title001');
      const expectedPrice: ResourceStr = $r('app.string.embed_product_price001');
      const actual: ProductDataModel = new ProductDataModel(expectedId, expectedImage, expectedTitle, expectedPrice);
      const actualId: number = actual.id;
      const actualImage: ResourceStr = actual.imageRes;
      const actualTitle: ResourceStr = actual.title;
      const actualPrice: ResourceStr = actual.price;
      expect(actualId).assertEqual(expectedId);
      expect(actualImage).assertEqual(expectedImage);
      expect(actualTitle).assertEqual(expectedTitle);
      expect(actualPrice).assertEqual(expectedPrice);
    });

    // @tc.number GoodsConstructionPart73_0029_constructor_id3_image3_title1_price1
    // @tc.name GoodsConstructionPart73_0029_constructor_id3_image3_title1_price1
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ProductDataModel constructor preserves independent resource fields and boundary identifier
    it('GoodsConstructionPart73_0029_constructor_id3_image3_title1_price1', 0, (): void => {
      const expectedId: number = 2147483647;
      const expectedImage: ResourceStr = $r('app.media.embed_product003');
      const expectedTitle: ResourceStr = $r('app.string.embed_product_title001');
      const expectedPrice: ResourceStr = $r('app.string.embed_product_price001');
      const actual: ProductDataModel = new ProductDataModel(expectedId, expectedImage, expectedTitle, expectedPrice);
      const actualId: number = actual.id;
      const actualImage: ResourceStr = actual.imageRes;
      const actualTitle: ResourceStr = actual.title;
      const actualPrice: ResourceStr = actual.price;
      expect(actualId).assertEqual(expectedId);
      expect(actualImage).assertEqual(expectedImage);
      expect(actualTitle).assertEqual(expectedTitle);
      expect(actualPrice).assertEqual(expectedPrice);
    });

    // @tc.number GoodsConstructionPart73_0030_constructor_id4_image3_title1_price1
    // @tc.name GoodsConstructionPart73_0030_constructor_id4_image3_title1_price1
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ProductDataModel constructor preserves independent resource fields and boundary identifier
    it('GoodsConstructionPart73_0030_constructor_id4_image3_title1_price1', 0, (): void => {
      const expectedId: number = -2147483648;
      const expectedImage: ResourceStr = $r('app.media.embed_product003');
      const expectedTitle: ResourceStr = $r('app.string.embed_product_title001');
      const expectedPrice: ResourceStr = $r('app.string.embed_product_price001');
      const actual: ProductDataModel = new ProductDataModel(expectedId, expectedImage, expectedTitle, expectedPrice);
      const actualId: number = actual.id;
      const actualImage: ResourceStr = actual.imageRes;
      const actualTitle: ResourceStr = actual.title;
      const actualPrice: ResourceStr = actual.price;
      expect(actualId).assertEqual(expectedId);
      expect(actualImage).assertEqual(expectedImage);
      expect(actualTitle).assertEqual(expectedTitle);
      expect(actualPrice).assertEqual(expectedPrice);
    });

    // @tc.number GoodsConstructionPart73_0031_constructor_id5_image3_title1_price1
    // @tc.name GoodsConstructionPart73_0031_constructor_id5_image3_title1_price1
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ProductDataModel constructor preserves independent resource fields and boundary identifier
    it('GoodsConstructionPart73_0031_constructor_id5_image3_title1_price1', 0, (): void => {
      const expectedId: number = 0.5;
      const expectedImage: ResourceStr = $r('app.media.embed_product003');
      const expectedTitle: ResourceStr = $r('app.string.embed_product_title001');
      const expectedPrice: ResourceStr = $r('app.string.embed_product_price001');
      const actual: ProductDataModel = new ProductDataModel(expectedId, expectedImage, expectedTitle, expectedPrice);
      const actualId: number = actual.id;
      const actualImage: ResourceStr = actual.imageRes;
      const actualTitle: ResourceStr = actual.title;
      const actualPrice: ResourceStr = actual.price;
      expect(actualId).assertEqual(expectedId);
      expect(actualImage).assertEqual(expectedImage);
      expect(actualTitle).assertEqual(expectedTitle);
      expect(actualPrice).assertEqual(expectedPrice);
    });

    // @tc.number GoodsConstructionPart73_0032_constructor_id6_image3_title1_price1
    // @tc.name GoodsConstructionPart73_0032_constructor_id6_image3_title1_price1
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ProductDataModel constructor preserves independent resource fields and boundary identifier
    it('GoodsConstructionPart73_0032_constructor_id6_image3_title1_price1', 0, (): void => {
      const expectedId: number = 9007199254740991;
      const expectedImage: ResourceStr = $r('app.media.embed_product003');
      const expectedTitle: ResourceStr = $r('app.string.embed_product_title001');
      const expectedPrice: ResourceStr = $r('app.string.embed_product_price001');
      const actual: ProductDataModel = new ProductDataModel(expectedId, expectedImage, expectedTitle, expectedPrice);
      const actualId: number = actual.id;
      const actualImage: ResourceStr = actual.imageRes;
      const actualTitle: ResourceStr = actual.title;
      const actualPrice: ResourceStr = actual.price;
      expect(actualId).assertEqual(expectedId);
      expect(actualImage).assertEqual(expectedImage);
      expect(actualTitle).assertEqual(expectedTitle);
      expect(actualPrice).assertEqual(expectedPrice);
    });

    // @tc.number GoodsConstructionPart73_0033_constructor_id7_image3_title1_price1
    // @tc.name GoodsConstructionPart73_0033_constructor_id7_image3_title1_price1
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ProductDataModel constructor preserves independent resource fields and boundary identifier
    it('GoodsConstructionPart73_0033_constructor_id7_image3_title1_price1', 0, (): void => {
      const expectedId: number = -0.5;
      const expectedImage: ResourceStr = $r('app.media.embed_product003');
      const expectedTitle: ResourceStr = $r('app.string.embed_product_title001');
      const expectedPrice: ResourceStr = $r('app.string.embed_product_price001');
      const actual: ProductDataModel = new ProductDataModel(expectedId, expectedImage, expectedTitle, expectedPrice);
      const actualId: number = actual.id;
      const actualImage: ResourceStr = actual.imageRes;
      const actualTitle: ResourceStr = actual.title;
      const actualPrice: ResourceStr = actual.price;
      expect(actualId).assertEqual(expectedId);
      expect(actualImage).assertEqual(expectedImage);
      expect(actualTitle).assertEqual(expectedTitle);
      expect(actualPrice).assertEqual(expectedPrice);
    });

    // @tc.number GoodsConstructionPart73_0034_constructor_id0_image4_title1_price1
    // @tc.name GoodsConstructionPart73_0034_constructor_id0_image4_title1_price1
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ProductDataModel constructor preserves independent resource fields and boundary identifier
    it('GoodsConstructionPart73_0034_constructor_id0_image4_title1_price1', 0, (): void => {
      const expectedId: number = -1;
      const expectedImage: ResourceStr = $r('app.media.embed_product004');
      const expectedTitle: ResourceStr = $r('app.string.embed_product_title001');
      const expectedPrice: ResourceStr = $r('app.string.embed_product_price001');
      const actual: ProductDataModel = new ProductDataModel(expectedId, expectedImage, expectedTitle, expectedPrice);
      const actualId: number = actual.id;
      const actualImage: ResourceStr = actual.imageRes;
      const actualTitle: ResourceStr = actual.title;
      const actualPrice: ResourceStr = actual.price;
      expect(actualId).assertEqual(expectedId);
      expect(actualImage).assertEqual(expectedImage);
      expect(actualTitle).assertEqual(expectedTitle);
      expect(actualPrice).assertEqual(expectedPrice);
    });

    // @tc.number GoodsConstructionPart73_0035_constructor_id1_image4_title1_price1
    // @tc.name GoodsConstructionPart73_0035_constructor_id1_image4_title1_price1
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ProductDataModel constructor preserves independent resource fields and boundary identifier
    it('GoodsConstructionPart73_0035_constructor_id1_image4_title1_price1', 0, (): void => {
      const expectedId: number = 0;
      const expectedImage: ResourceStr = $r('app.media.embed_product004');
      const expectedTitle: ResourceStr = $r('app.string.embed_product_title001');
      const expectedPrice: ResourceStr = $r('app.string.embed_product_price001');
      const actual: ProductDataModel = new ProductDataModel(expectedId, expectedImage, expectedTitle, expectedPrice);
      const actualId: number = actual.id;
      const actualImage: ResourceStr = actual.imageRes;
      const actualTitle: ResourceStr = actual.title;
      const actualPrice: ResourceStr = actual.price;
      expect(actualId).assertEqual(expectedId);
      expect(actualImage).assertEqual(expectedImage);
      expect(actualTitle).assertEqual(expectedTitle);
      expect(actualPrice).assertEqual(expectedPrice);
    });

    // @tc.number GoodsConstructionPart73_0036_constructor_id2_image4_title1_price1
    // @tc.name GoodsConstructionPart73_0036_constructor_id2_image4_title1_price1
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ProductDataModel constructor preserves independent resource fields and boundary identifier
    it('GoodsConstructionPart73_0036_constructor_id2_image4_title1_price1', 0, (): void => {
      const expectedId: number = 1;
      const expectedImage: ResourceStr = $r('app.media.embed_product004');
      const expectedTitle: ResourceStr = $r('app.string.embed_product_title001');
      const expectedPrice: ResourceStr = $r('app.string.embed_product_price001');
      const actual: ProductDataModel = new ProductDataModel(expectedId, expectedImage, expectedTitle, expectedPrice);
      const actualId: number = actual.id;
      const actualImage: ResourceStr = actual.imageRes;
      const actualTitle: ResourceStr = actual.title;
      const actualPrice: ResourceStr = actual.price;
      expect(actualId).assertEqual(expectedId);
      expect(actualImage).assertEqual(expectedImage);
      expect(actualTitle).assertEqual(expectedTitle);
      expect(actualPrice).assertEqual(expectedPrice);
    });

    // @tc.number GoodsConstructionPart73_0037_constructor_id3_image4_title1_price1
    // @tc.name GoodsConstructionPart73_0037_constructor_id3_image4_title1_price1
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ProductDataModel constructor preserves independent resource fields and boundary identifier
    it('GoodsConstructionPart73_0037_constructor_id3_image4_title1_price1', 0, (): void => {
      const expectedId: number = 2147483647;
      const expectedImage: ResourceStr = $r('app.media.embed_product004');
      const expectedTitle: ResourceStr = $r('app.string.embed_product_title001');
      const expectedPrice: ResourceStr = $r('app.string.embed_product_price001');
      const actual: ProductDataModel = new ProductDataModel(expectedId, expectedImage, expectedTitle, expectedPrice);
      const actualId: number = actual.id;
      const actualImage: ResourceStr = actual.imageRes;
      const actualTitle: ResourceStr = actual.title;
      const actualPrice: ResourceStr = actual.price;
      expect(actualId).assertEqual(expectedId);
      expect(actualImage).assertEqual(expectedImage);
      expect(actualTitle).assertEqual(expectedTitle);
      expect(actualPrice).assertEqual(expectedPrice);
    });

    // @tc.number GoodsConstructionPart73_0038_constructor_id4_image4_title1_price1
    // @tc.name GoodsConstructionPart73_0038_constructor_id4_image4_title1_price1
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ProductDataModel constructor preserves independent resource fields and boundary identifier
    it('GoodsConstructionPart73_0038_constructor_id4_image4_title1_price1', 0, (): void => {
      const expectedId: number = -2147483648;
      const expectedImage: ResourceStr = $r('app.media.embed_product004');
      const expectedTitle: ResourceStr = $r('app.string.embed_product_title001');
      const expectedPrice: ResourceStr = $r('app.string.embed_product_price001');
      const actual: ProductDataModel = new ProductDataModel(expectedId, expectedImage, expectedTitle, expectedPrice);
      const actualId: number = actual.id;
      const actualImage: ResourceStr = actual.imageRes;
      const actualTitle: ResourceStr = actual.title;
      const actualPrice: ResourceStr = actual.price;
      expect(actualId).assertEqual(expectedId);
      expect(actualImage).assertEqual(expectedImage);
      expect(actualTitle).assertEqual(expectedTitle);
      expect(actualPrice).assertEqual(expectedPrice);
    });

    // @tc.number GoodsConstructionPart73_0039_constructor_id5_image4_title1_price1
    // @tc.name GoodsConstructionPart73_0039_constructor_id5_image4_title1_price1
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ProductDataModel constructor preserves independent resource fields and boundary identifier
    it('GoodsConstructionPart73_0039_constructor_id5_image4_title1_price1', 0, (): void => {
      const expectedId: number = 0.5;
      const expectedImage: ResourceStr = $r('app.media.embed_product004');
      const expectedTitle: ResourceStr = $r('app.string.embed_product_title001');
      const expectedPrice: ResourceStr = $r('app.string.embed_product_price001');
      const actual: ProductDataModel = new ProductDataModel(expectedId, expectedImage, expectedTitle, expectedPrice);
      const actualId: number = actual.id;
      const actualImage: ResourceStr = actual.imageRes;
      const actualTitle: ResourceStr = actual.title;
      const actualPrice: ResourceStr = actual.price;
      expect(actualId).assertEqual(expectedId);
      expect(actualImage).assertEqual(expectedImage);
      expect(actualTitle).assertEqual(expectedTitle);
      expect(actualPrice).assertEqual(expectedPrice);
    });

    // @tc.number GoodsConstructionPart73_0040_constructor_id6_image4_title1_price1
    // @tc.name GoodsConstructionPart73_0040_constructor_id6_image4_title1_price1
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ProductDataModel constructor preserves independent resource fields and boundary identifier
    it('GoodsConstructionPart73_0040_constructor_id6_image4_title1_price1', 0, (): void => {
      const expectedId: number = 9007199254740991;
      const expectedImage: ResourceStr = $r('app.media.embed_product004');
      const expectedTitle: ResourceStr = $r('app.string.embed_product_title001');
      const expectedPrice: ResourceStr = $r('app.string.embed_product_price001');
      const actual: ProductDataModel = new ProductDataModel(expectedId, expectedImage, expectedTitle, expectedPrice);
      const actualId: number = actual.id;
      const actualImage: ResourceStr = actual.imageRes;
      const actualTitle: ResourceStr = actual.title;
      const actualPrice: ResourceStr = actual.price;
      expect(actualId).assertEqual(expectedId);
      expect(actualImage).assertEqual(expectedImage);
      expect(actualTitle).assertEqual(expectedTitle);
      expect(actualPrice).assertEqual(expectedPrice);
    });

    // @tc.number GoodsConstructionPart73_0041_constructor_id7_image4_title1_price1
    // @tc.name GoodsConstructionPart73_0041_constructor_id7_image4_title1_price1
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ProductDataModel constructor preserves independent resource fields and boundary identifier
    it('GoodsConstructionPart73_0041_constructor_id7_image4_title1_price1', 0, (): void => {
      const expectedId: number = -0.5;
      const expectedImage: ResourceStr = $r('app.media.embed_product004');
      const expectedTitle: ResourceStr = $r('app.string.embed_product_title001');
      const expectedPrice: ResourceStr = $r('app.string.embed_product_price001');
      const actual: ProductDataModel = new ProductDataModel(expectedId, expectedImage, expectedTitle, expectedPrice);
      const actualId: number = actual.id;
      const actualImage: ResourceStr = actual.imageRes;
      const actualTitle: ResourceStr = actual.title;
      const actualPrice: ResourceStr = actual.price;
      expect(actualId).assertEqual(expectedId);
      expect(actualImage).assertEqual(expectedImage);
      expect(actualTitle).assertEqual(expectedTitle);
      expect(actualPrice).assertEqual(expectedPrice);
    });

    // @tc.number GoodsConstructionPart73_0042_constructor_id0_image5_title1_price1
    // @tc.name GoodsConstructionPart73_0042_constructor_id0_image5_title1_price1
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ProductDataModel constructor preserves independent resource fields and boundary identifier
    it('GoodsConstructionPart73_0042_constructor_id0_image5_title1_price1', 0, (): void => {
      const expectedId: number = -1;
      const expectedImage: ResourceStr = $r('app.media.embed_product005');
      const expectedTitle: ResourceStr = $r('app.string.embed_product_title001');
      const expectedPrice: ResourceStr = $r('app.string.embed_product_price001');
      const actual: ProductDataModel = new ProductDataModel(expectedId, expectedImage, expectedTitle, expectedPrice);
      const actualId: number = actual.id;
      const actualImage: ResourceStr = actual.imageRes;
      const actualTitle: ResourceStr = actual.title;
      const actualPrice: ResourceStr = actual.price;
      expect(actualId).assertEqual(expectedId);
      expect(actualImage).assertEqual(expectedImage);
      expect(actualTitle).assertEqual(expectedTitle);
      expect(actualPrice).assertEqual(expectedPrice);
    });

    // @tc.number GoodsConstructionPart73_0043_constructor_id1_image5_title1_price1
    // @tc.name GoodsConstructionPart73_0043_constructor_id1_image5_title1_price1
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ProductDataModel constructor preserves independent resource fields and boundary identifier
    it('GoodsConstructionPart73_0043_constructor_id1_image5_title1_price1', 0, (): void => {
      const expectedId: number = 0;
      const expectedImage: ResourceStr = $r('app.media.embed_product005');
      const expectedTitle: ResourceStr = $r('app.string.embed_product_title001');
      const expectedPrice: ResourceStr = $r('app.string.embed_product_price001');
      const actual: ProductDataModel = new ProductDataModel(expectedId, expectedImage, expectedTitle, expectedPrice);
      const actualId: number = actual.id;
      const actualImage: ResourceStr = actual.imageRes;
      const actualTitle: ResourceStr = actual.title;
      const actualPrice: ResourceStr = actual.price;
      expect(actualId).assertEqual(expectedId);
      expect(actualImage).assertEqual(expectedImage);
      expect(actualTitle).assertEqual(expectedTitle);
      expect(actualPrice).assertEqual(expectedPrice);
    });

    // @tc.number GoodsConstructionPart73_0044_constructor_id2_image5_title1_price1
    // @tc.name GoodsConstructionPart73_0044_constructor_id2_image5_title1_price1
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ProductDataModel constructor preserves independent resource fields and boundary identifier
    it('GoodsConstructionPart73_0044_constructor_id2_image5_title1_price1', 0, (): void => {
      const expectedId: number = 1;
      const expectedImage: ResourceStr = $r('app.media.embed_product005');
      const expectedTitle: ResourceStr = $r('app.string.embed_product_title001');
      const expectedPrice: ResourceStr = $r('app.string.embed_product_price001');
      const actual: ProductDataModel = new ProductDataModel(expectedId, expectedImage, expectedTitle, expectedPrice);
      const actualId: number = actual.id;
      const actualImage: ResourceStr = actual.imageRes;
      const actualTitle: ResourceStr = actual.title;
      const actualPrice: ResourceStr = actual.price;
      expect(actualId).assertEqual(expectedId);
      expect(actualImage).assertEqual(expectedImage);
      expect(actualTitle).assertEqual(expectedTitle);
      expect(actualPrice).assertEqual(expectedPrice);
    });

    // @tc.number GoodsConstructionPart73_0045_constructor_id3_image5_title1_price1
    // @tc.name GoodsConstructionPart73_0045_constructor_id3_image5_title1_price1
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ProductDataModel constructor preserves independent resource fields and boundary identifier
    it('GoodsConstructionPart73_0045_constructor_id3_image5_title1_price1', 0, (): void => {
      const expectedId: number = 2147483647;
      const expectedImage: ResourceStr = $r('app.media.embed_product005');
      const expectedTitle: ResourceStr = $r('app.string.embed_product_title001');
      const expectedPrice: ResourceStr = $r('app.string.embed_product_price001');
      const actual: ProductDataModel = new ProductDataModel(expectedId, expectedImage, expectedTitle, expectedPrice);
      const actualId: number = actual.id;
      const actualImage: ResourceStr = actual.imageRes;
      const actualTitle: ResourceStr = actual.title;
      const actualPrice: ResourceStr = actual.price;
      expect(actualId).assertEqual(expectedId);
      expect(actualImage).assertEqual(expectedImage);
      expect(actualTitle).assertEqual(expectedTitle);
      expect(actualPrice).assertEqual(expectedPrice);
    });

    // @tc.number GoodsConstructionPart73_0046_constructor_id4_image5_title1_price1
    // @tc.name GoodsConstructionPart73_0046_constructor_id4_image5_title1_price1
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ProductDataModel constructor preserves independent resource fields and boundary identifier
    it('GoodsConstructionPart73_0046_constructor_id4_image5_title1_price1', 0, (): void => {
      const expectedId: number = -2147483648;
      const expectedImage: ResourceStr = $r('app.media.embed_product005');
      const expectedTitle: ResourceStr = $r('app.string.embed_product_title001');
      const expectedPrice: ResourceStr = $r('app.string.embed_product_price001');
      const actual: ProductDataModel = new ProductDataModel(expectedId, expectedImage, expectedTitle, expectedPrice);
      const actualId: number = actual.id;
      const actualImage: ResourceStr = actual.imageRes;
      const actualTitle: ResourceStr = actual.title;
      const actualPrice: ResourceStr = actual.price;
      expect(actualId).assertEqual(expectedId);
      expect(actualImage).assertEqual(expectedImage);
      expect(actualTitle).assertEqual(expectedTitle);
      expect(actualPrice).assertEqual(expectedPrice);
    });

    // @tc.number GoodsConstructionPart73_0047_constructor_id5_image5_title1_price1
    // @tc.name GoodsConstructionPart73_0047_constructor_id5_image5_title1_price1
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ProductDataModel constructor preserves independent resource fields and boundary identifier
    it('GoodsConstructionPart73_0047_constructor_id5_image5_title1_price1', 0, (): void => {
      const expectedId: number = 0.5;
      const expectedImage: ResourceStr = $r('app.media.embed_product005');
      const expectedTitle: ResourceStr = $r('app.string.embed_product_title001');
      const expectedPrice: ResourceStr = $r('app.string.embed_product_price001');
      const actual: ProductDataModel = new ProductDataModel(expectedId, expectedImage, expectedTitle, expectedPrice);
      const actualId: number = actual.id;
      const actualImage: ResourceStr = actual.imageRes;
      const actualTitle: ResourceStr = actual.title;
      const actualPrice: ResourceStr = actual.price;
      expect(actualId).assertEqual(expectedId);
      expect(actualImage).assertEqual(expectedImage);
      expect(actualTitle).assertEqual(expectedTitle);
      expect(actualPrice).assertEqual(expectedPrice);
    });

    // @tc.number GoodsConstructionPart73_0048_constructor_id6_image5_title1_price1
    // @tc.name GoodsConstructionPart73_0048_constructor_id6_image5_title1_price1
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ProductDataModel constructor preserves independent resource fields and boundary identifier
    it('GoodsConstructionPart73_0048_constructor_id6_image5_title1_price1', 0, (): void => {
      const expectedId: number = 9007199254740991;
      const expectedImage: ResourceStr = $r('app.media.embed_product005');
      const expectedTitle: ResourceStr = $r('app.string.embed_product_title001');
      const expectedPrice: ResourceStr = $r('app.string.embed_product_price001');
      const actual: ProductDataModel = new ProductDataModel(expectedId, expectedImage, expectedTitle, expectedPrice);
      const actualId: number = actual.id;
      const actualImage: ResourceStr = actual.imageRes;
      const actualTitle: ResourceStr = actual.title;
      const actualPrice: ResourceStr = actual.price;
      expect(actualId).assertEqual(expectedId);
      expect(actualImage).assertEqual(expectedImage);
      expect(actualTitle).assertEqual(expectedTitle);
      expect(actualPrice).assertEqual(expectedPrice);
    });
  });
}
