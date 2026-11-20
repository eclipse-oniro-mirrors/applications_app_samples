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

export default function GoodsConstructionPart79(): void {
  describe('GoodsConstructionPart79', () => {
    beforeAll(async (): Promise<void> => {
      await Promise.resolve();
    });
    beforeEach(async (): Promise<void> => {
      await yieldTestEventLoop();
    });
    afterEach((): void => {});
    afterAll((): void => {});

    // @tc.number GoodsConstructionPart79_0001_constructor_id7_image5_title1_price1
    // @tc.name GoodsConstructionPart79_0001_constructor_id7_image5_title1_price1
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ProductDataModel constructor preserves independent resource fields and boundary identifier
    it('GoodsConstructionPart79_0001_constructor_id7_image5_title1_price1', 0, (): void => {
      const expectedId: number = -0.5;
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

    // @tc.number GoodsConstructionPart79_0002_constructor_id0_image0_title2_price1
    // @tc.name GoodsConstructionPart79_0002_constructor_id0_image0_title2_price1
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ProductDataModel constructor preserves independent resource fields and boundary identifier
    it('GoodsConstructionPart79_0002_constructor_id0_image0_title2_price1', 0, (): void => {
      const expectedId: number = -1;
      const expectedImage: ResourceStr = $r('app.media.embed_product000');
      const expectedTitle: ResourceStr = $r('app.string.embed_product_title002');
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

    // @tc.number GoodsConstructionPart79_0003_constructor_id1_image0_title2_price1
    // @tc.name GoodsConstructionPart79_0003_constructor_id1_image0_title2_price1
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ProductDataModel constructor preserves independent resource fields and boundary identifier
    it('GoodsConstructionPart79_0003_constructor_id1_image0_title2_price1', 0, (): void => {
      const expectedId: number = 0;
      const expectedImage: ResourceStr = $r('app.media.embed_product000');
      const expectedTitle: ResourceStr = $r('app.string.embed_product_title002');
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

    // @tc.number GoodsConstructionPart79_0004_constructor_id2_image0_title2_price1
    // @tc.name GoodsConstructionPart79_0004_constructor_id2_image0_title2_price1
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ProductDataModel constructor preserves independent resource fields and boundary identifier
    it('GoodsConstructionPart79_0004_constructor_id2_image0_title2_price1', 0, (): void => {
      const expectedId: number = 1;
      const expectedImage: ResourceStr = $r('app.media.embed_product000');
      const expectedTitle: ResourceStr = $r('app.string.embed_product_title002');
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

    // @tc.number GoodsConstructionPart79_0005_constructor_id3_image0_title2_price1
    // @tc.name GoodsConstructionPart79_0005_constructor_id3_image0_title2_price1
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ProductDataModel constructor preserves independent resource fields and boundary identifier
    it('GoodsConstructionPart79_0005_constructor_id3_image0_title2_price1', 0, (): void => {
      const expectedId: number = 2147483647;
      const expectedImage: ResourceStr = $r('app.media.embed_product000');
      const expectedTitle: ResourceStr = $r('app.string.embed_product_title002');
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

    // @tc.number GoodsConstructionPart79_0006_constructor_id4_image0_title2_price1
    // @tc.name GoodsConstructionPart79_0006_constructor_id4_image0_title2_price1
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ProductDataModel constructor preserves independent resource fields and boundary identifier
    it('GoodsConstructionPart79_0006_constructor_id4_image0_title2_price1', 0, (): void => {
      const expectedId: number = -2147483648;
      const expectedImage: ResourceStr = $r('app.media.embed_product000');
      const expectedTitle: ResourceStr = $r('app.string.embed_product_title002');
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

    // @tc.number GoodsConstructionPart79_0007_constructor_id5_image0_title2_price1
    // @tc.name GoodsConstructionPart79_0007_constructor_id5_image0_title2_price1
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ProductDataModel constructor preserves independent resource fields and boundary identifier
    it('GoodsConstructionPart79_0007_constructor_id5_image0_title2_price1', 0, (): void => {
      const expectedId: number = 0.5;
      const expectedImage: ResourceStr = $r('app.media.embed_product000');
      const expectedTitle: ResourceStr = $r('app.string.embed_product_title002');
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

    // @tc.number GoodsConstructionPart79_0008_constructor_id6_image0_title2_price1
    // @tc.name GoodsConstructionPart79_0008_constructor_id6_image0_title2_price1
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ProductDataModel constructor preserves independent resource fields and boundary identifier
    it('GoodsConstructionPart79_0008_constructor_id6_image0_title2_price1', 0, (): void => {
      const expectedId: number = 9007199254740991;
      const expectedImage: ResourceStr = $r('app.media.embed_product000');
      const expectedTitle: ResourceStr = $r('app.string.embed_product_title002');
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

    // @tc.number GoodsConstructionPart79_0009_constructor_id7_image0_title2_price1
    // @tc.name GoodsConstructionPart79_0009_constructor_id7_image0_title2_price1
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ProductDataModel constructor preserves independent resource fields and boundary identifier
    it('GoodsConstructionPart79_0009_constructor_id7_image0_title2_price1', 0, (): void => {
      const expectedId: number = -0.5;
      const expectedImage: ResourceStr = $r('app.media.embed_product000');
      const expectedTitle: ResourceStr = $r('app.string.embed_product_title002');
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

    // @tc.number GoodsConstructionPart79_0010_constructor_id0_image1_title2_price1
    // @tc.name GoodsConstructionPart79_0010_constructor_id0_image1_title2_price1
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ProductDataModel constructor preserves independent resource fields and boundary identifier
    it('GoodsConstructionPart79_0010_constructor_id0_image1_title2_price1', 0, (): void => {
      const expectedId: number = -1;
      const expectedImage: ResourceStr = $r('app.media.embed_product001');
      const expectedTitle: ResourceStr = $r('app.string.embed_product_title002');
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

    // @tc.number GoodsConstructionPart79_0011_constructor_id1_image1_title2_price1
    // @tc.name GoodsConstructionPart79_0011_constructor_id1_image1_title2_price1
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ProductDataModel constructor preserves independent resource fields and boundary identifier
    it('GoodsConstructionPart79_0011_constructor_id1_image1_title2_price1', 0, (): void => {
      const expectedId: number = 0;
      const expectedImage: ResourceStr = $r('app.media.embed_product001');
      const expectedTitle: ResourceStr = $r('app.string.embed_product_title002');
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

    // @tc.number GoodsConstructionPart79_0012_constructor_id2_image1_title2_price1
    // @tc.name GoodsConstructionPart79_0012_constructor_id2_image1_title2_price1
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ProductDataModel constructor preserves independent resource fields and boundary identifier
    it('GoodsConstructionPart79_0012_constructor_id2_image1_title2_price1', 0, (): void => {
      const expectedId: number = 1;
      const expectedImage: ResourceStr = $r('app.media.embed_product001');
      const expectedTitle: ResourceStr = $r('app.string.embed_product_title002');
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

    // @tc.number GoodsConstructionPart79_0013_constructor_id3_image1_title2_price1
    // @tc.name GoodsConstructionPart79_0013_constructor_id3_image1_title2_price1
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ProductDataModel constructor preserves independent resource fields and boundary identifier
    it('GoodsConstructionPart79_0013_constructor_id3_image1_title2_price1', 0, (): void => {
      const expectedId: number = 2147483647;
      const expectedImage: ResourceStr = $r('app.media.embed_product001');
      const expectedTitle: ResourceStr = $r('app.string.embed_product_title002');
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

    // @tc.number GoodsConstructionPart79_0014_constructor_id4_image1_title2_price1
    // @tc.name GoodsConstructionPart79_0014_constructor_id4_image1_title2_price1
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ProductDataModel constructor preserves independent resource fields and boundary identifier
    it('GoodsConstructionPart79_0014_constructor_id4_image1_title2_price1', 0, (): void => {
      const expectedId: number = -2147483648;
      const expectedImage: ResourceStr = $r('app.media.embed_product001');
      const expectedTitle: ResourceStr = $r('app.string.embed_product_title002');
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

    // @tc.number GoodsConstructionPart79_0015_constructor_id5_image1_title2_price1
    // @tc.name GoodsConstructionPart79_0015_constructor_id5_image1_title2_price1
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ProductDataModel constructor preserves independent resource fields and boundary identifier
    it('GoodsConstructionPart79_0015_constructor_id5_image1_title2_price1', 0, (): void => {
      const expectedId: number = 0.5;
      const expectedImage: ResourceStr = $r('app.media.embed_product001');
      const expectedTitle: ResourceStr = $r('app.string.embed_product_title002');
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

    // @tc.number GoodsConstructionPart79_0016_constructor_id6_image1_title2_price1
    // @tc.name GoodsConstructionPart79_0016_constructor_id6_image1_title2_price1
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ProductDataModel constructor preserves independent resource fields and boundary identifier
    it('GoodsConstructionPart79_0016_constructor_id6_image1_title2_price1', 0, (): void => {
      const expectedId: number = 9007199254740991;
      const expectedImage: ResourceStr = $r('app.media.embed_product001');
      const expectedTitle: ResourceStr = $r('app.string.embed_product_title002');
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

    // @tc.number GoodsConstructionPart79_0017_constructor_id7_image1_title2_price1
    // @tc.name GoodsConstructionPart79_0017_constructor_id7_image1_title2_price1
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ProductDataModel constructor preserves independent resource fields and boundary identifier
    it('GoodsConstructionPart79_0017_constructor_id7_image1_title2_price1', 0, (): void => {
      const expectedId: number = -0.5;
      const expectedImage: ResourceStr = $r('app.media.embed_product001');
      const expectedTitle: ResourceStr = $r('app.string.embed_product_title002');
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

    // @tc.number GoodsConstructionPart79_0018_constructor_id0_image2_title2_price1
    // @tc.name GoodsConstructionPart79_0018_constructor_id0_image2_title2_price1
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ProductDataModel constructor preserves independent resource fields and boundary identifier
    it('GoodsConstructionPart79_0018_constructor_id0_image2_title2_price1', 0, (): void => {
      const expectedId: number = -1;
      const expectedImage: ResourceStr = $r('app.media.embed_product002');
      const expectedTitle: ResourceStr = $r('app.string.embed_product_title002');
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

    // @tc.number GoodsConstructionPart79_0019_constructor_id1_image2_title2_price1
    // @tc.name GoodsConstructionPart79_0019_constructor_id1_image2_title2_price1
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ProductDataModel constructor preserves independent resource fields and boundary identifier
    it('GoodsConstructionPart79_0019_constructor_id1_image2_title2_price1', 0, (): void => {
      const expectedId: number = 0;
      const expectedImage: ResourceStr = $r('app.media.embed_product002');
      const expectedTitle: ResourceStr = $r('app.string.embed_product_title002');
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

    // @tc.number GoodsConstructionPart79_0020_constructor_id2_image2_title2_price1
    // @tc.name GoodsConstructionPart79_0020_constructor_id2_image2_title2_price1
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ProductDataModel constructor preserves independent resource fields and boundary identifier
    it('GoodsConstructionPart79_0020_constructor_id2_image2_title2_price1', 0, (): void => {
      const expectedId: number = 1;
      const expectedImage: ResourceStr = $r('app.media.embed_product002');
      const expectedTitle: ResourceStr = $r('app.string.embed_product_title002');
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

    // @tc.number GoodsConstructionPart79_0021_constructor_id3_image2_title2_price1
    // @tc.name GoodsConstructionPart79_0021_constructor_id3_image2_title2_price1
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ProductDataModel constructor preserves independent resource fields and boundary identifier
    it('GoodsConstructionPart79_0021_constructor_id3_image2_title2_price1', 0, (): void => {
      const expectedId: number = 2147483647;
      const expectedImage: ResourceStr = $r('app.media.embed_product002');
      const expectedTitle: ResourceStr = $r('app.string.embed_product_title002');
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

    // @tc.number GoodsConstructionPart79_0022_constructor_id4_image2_title2_price1
    // @tc.name GoodsConstructionPart79_0022_constructor_id4_image2_title2_price1
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ProductDataModel constructor preserves independent resource fields and boundary identifier
    it('GoodsConstructionPart79_0022_constructor_id4_image2_title2_price1', 0, (): void => {
      const expectedId: number = -2147483648;
      const expectedImage: ResourceStr = $r('app.media.embed_product002');
      const expectedTitle: ResourceStr = $r('app.string.embed_product_title002');
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

    // @tc.number GoodsConstructionPart79_0023_constructor_id5_image2_title2_price1
    // @tc.name GoodsConstructionPart79_0023_constructor_id5_image2_title2_price1
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ProductDataModel constructor preserves independent resource fields and boundary identifier
    it('GoodsConstructionPart79_0023_constructor_id5_image2_title2_price1', 0, (): void => {
      const expectedId: number = 0.5;
      const expectedImage: ResourceStr = $r('app.media.embed_product002');
      const expectedTitle: ResourceStr = $r('app.string.embed_product_title002');
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

    // @tc.number GoodsConstructionPart79_0024_constructor_id6_image2_title2_price1
    // @tc.name GoodsConstructionPart79_0024_constructor_id6_image2_title2_price1
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ProductDataModel constructor preserves independent resource fields and boundary identifier
    it('GoodsConstructionPart79_0024_constructor_id6_image2_title2_price1', 0, (): void => {
      const expectedId: number = 9007199254740991;
      const expectedImage: ResourceStr = $r('app.media.embed_product002');
      const expectedTitle: ResourceStr = $r('app.string.embed_product_title002');
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

    // @tc.number GoodsConstructionPart79_0025_constructor_id7_image2_title2_price1
    // @tc.name GoodsConstructionPart79_0025_constructor_id7_image2_title2_price1
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ProductDataModel constructor preserves independent resource fields and boundary identifier
    it('GoodsConstructionPart79_0025_constructor_id7_image2_title2_price1', 0, (): void => {
      const expectedId: number = -0.5;
      const expectedImage: ResourceStr = $r('app.media.embed_product002');
      const expectedTitle: ResourceStr = $r('app.string.embed_product_title002');
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

    // @tc.number GoodsConstructionPart79_0026_constructor_id0_image3_title2_price1
    // @tc.name GoodsConstructionPart79_0026_constructor_id0_image3_title2_price1
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc ProductDataModel constructor preserves independent resource fields and boundary identifier
    it('GoodsConstructionPart79_0026_constructor_id0_image3_title2_price1', 0, (): void => {
      const expectedId: number = -1;
      const expectedImage: ResourceStr = $r('app.media.embed_product003');
      const expectedTitle: ResourceStr = $r('app.string.embed_product_title002');
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
