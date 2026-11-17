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

export default function CatalogBindingPart33(): void {
  describe('CatalogBindingPart33', () => {
    beforeAll(async (): Promise<void> => {
      await Promise.resolve();
    });
    beforeEach(async (): Promise<void> => {
      await yieldTestEventLoop();
    });
    afterEach((): void => {});
    afterAll((): void => {});

    // @tc.number CatalogBindingPart33_0001_catalog_binding_5_peer2_third3
    // @tc.name CatalogBindingPart33_0001_catalog_binding_5_peer2_third3
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc PRODUCT_DATA binds image title price to the same product and isolates item identities
    it('CatalogBindingPart33_0001_catalog_binding_5_peer2_third3', 0, (): void => {
      const count: number = PRODUCT_DATA.length;
      expect(count).assertEqual(6);
      const first: ProductDataModel = PRODUCT_DATA[5];
      const second: ProductDataModel = PRODUCT_DATA[2];
      const expectedImage: ResourceStr = $r('app.media.embed_product005');
      const expectedTitle: ResourceStr = $r('app.string.embed_product_title005');
      const expectedPrice: ResourceStr = $r('app.string.embed_product_price005');
      const actualImage = first.imageRes;
      const actualTitle = first.title;
      const actualPrice = first.price;
      expect(actualImage).assertDeepEquals(expectedImage);
      expect(actualTitle).assertDeepEquals(expectedTitle);
      expect(actualPrice).assertDeepEquals(expectedPrice);
      const firstId: number = first.id;
      const secondId: number = second.id;
      expect(firstId).assertEqual(5);
      expect(secondId).assertEqual(2);
      const sameReference: boolean = first === second;
      expect(sameReference).assertEqual(false);
      const third: ProductDataModel = PRODUCT_DATA[3];
      const thirdId: number = third.id;
      expect(thirdId).assertEqual(3);
    });

    // @tc.number CatalogBindingPart33_0002_catalog_binding_0_peer3_third3
    // @tc.name CatalogBindingPart33_0002_catalog_binding_0_peer3_third3
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc PRODUCT_DATA binds image title price to the same product and isolates item identities
    it('CatalogBindingPart33_0002_catalog_binding_0_peer3_third3', 0, (): void => {
      const count: number = PRODUCT_DATA.length;
      expect(count).assertEqual(6);
      const first: ProductDataModel = PRODUCT_DATA[0];
      const second: ProductDataModel = PRODUCT_DATA[3];
      const expectedImage: ResourceStr = $r('app.media.embed_product000');
      const expectedTitle: ResourceStr = $r('app.string.embed_product_title000');
      const expectedPrice: ResourceStr = $r('app.string.embed_product_price000');
      const actualImage = first.imageRes;
      const actualTitle = first.title;
      const actualPrice = first.price;
      expect(actualImage).assertDeepEquals(expectedImage);
      expect(actualTitle).assertDeepEquals(expectedTitle);
      expect(actualPrice).assertDeepEquals(expectedPrice);
      const firstId: number = first.id;
      const secondId: number = second.id;
      expect(firstId).assertEqual(0);
      expect(secondId).assertEqual(3);
      const sameReference: boolean = first === second;
      expect(sameReference).assertEqual(false);
      const third: ProductDataModel = PRODUCT_DATA[3];
      const thirdId: number = third.id;
      expect(thirdId).assertEqual(3);
    });

    // @tc.number CatalogBindingPart33_0003_catalog_binding_1_peer3_third3
    // @tc.name CatalogBindingPart33_0003_catalog_binding_1_peer3_third3
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc PRODUCT_DATA binds image title price to the same product and isolates item identities
    it('CatalogBindingPart33_0003_catalog_binding_1_peer3_third3', 0, (): void => {
      const count: number = PRODUCT_DATA.length;
      expect(count).assertEqual(6);
      const first: ProductDataModel = PRODUCT_DATA[1];
      const second: ProductDataModel = PRODUCT_DATA[3];
      const expectedImage: ResourceStr = $r('app.media.embed_product001');
      const expectedTitle: ResourceStr = $r('app.string.embed_product_title001');
      const expectedPrice: ResourceStr = $r('app.string.embed_product_price001');
      const actualImage = first.imageRes;
      const actualTitle = first.title;
      const actualPrice = first.price;
      expect(actualImage).assertDeepEquals(expectedImage);
      expect(actualTitle).assertDeepEquals(expectedTitle);
      expect(actualPrice).assertDeepEquals(expectedPrice);
      const firstId: number = first.id;
      const secondId: number = second.id;
      expect(firstId).assertEqual(1);
      expect(secondId).assertEqual(3);
      const sameReference: boolean = first === second;
      expect(sameReference).assertEqual(false);
      const third: ProductDataModel = PRODUCT_DATA[3];
      const thirdId: number = third.id;
      expect(thirdId).assertEqual(3);
    });

    // @tc.number CatalogBindingPart33_0004_catalog_binding_2_peer3_third3
    // @tc.name CatalogBindingPart33_0004_catalog_binding_2_peer3_third3
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc PRODUCT_DATA binds image title price to the same product and isolates item identities
    it('CatalogBindingPart33_0004_catalog_binding_2_peer3_third3', 0, (): void => {
      const count: number = PRODUCT_DATA.length;
      expect(count).assertEqual(6);
      const first: ProductDataModel = PRODUCT_DATA[2];
      const second: ProductDataModel = PRODUCT_DATA[3];
      const expectedImage: ResourceStr = $r('app.media.embed_product002');
      const expectedTitle: ResourceStr = $r('app.string.embed_product_title002');
      const expectedPrice: ResourceStr = $r('app.string.embed_product_price002');
      const actualImage = first.imageRes;
      const actualTitle = first.title;
      const actualPrice = first.price;
      expect(actualImage).assertDeepEquals(expectedImage);
      expect(actualTitle).assertDeepEquals(expectedTitle);
      expect(actualPrice).assertDeepEquals(expectedPrice);
      const firstId: number = first.id;
      const secondId: number = second.id;
      expect(firstId).assertEqual(2);
      expect(secondId).assertEqual(3);
      const sameReference: boolean = first === second;
      expect(sameReference).assertEqual(false);
      const third: ProductDataModel = PRODUCT_DATA[3];
      const thirdId: number = third.id;
      expect(thirdId).assertEqual(3);
    });

    // @tc.number CatalogBindingPart33_0005_catalog_binding_3_peer3_third3
    // @tc.name CatalogBindingPart33_0005_catalog_binding_3_peer3_third3
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc PRODUCT_DATA binds image title price to the same product and isolates item identities
    it('CatalogBindingPart33_0005_catalog_binding_3_peer3_third3', 0, (): void => {
      const count: number = PRODUCT_DATA.length;
      expect(count).assertEqual(6);
      const first: ProductDataModel = PRODUCT_DATA[3];
      const second: ProductDataModel = PRODUCT_DATA[3];
      const expectedImage: ResourceStr = $r('app.media.embed_product003');
      const expectedTitle: ResourceStr = $r('app.string.embed_product_title003');
      const expectedPrice: ResourceStr = $r('app.string.embed_product_price003');
      const actualImage = first.imageRes;
      const actualTitle = first.title;
      const actualPrice = first.price;
      expect(actualImage).assertDeepEquals(expectedImage);
      expect(actualTitle).assertDeepEquals(expectedTitle);
      expect(actualPrice).assertDeepEquals(expectedPrice);
      const firstId: number = first.id;
      const secondId: number = second.id;
      expect(firstId).assertEqual(3);
      expect(secondId).assertEqual(3);
      const sameReference: boolean = first === second;
      expect(sameReference).assertEqual(true);
      const third: ProductDataModel = PRODUCT_DATA[3];
      const thirdId: number = third.id;
      expect(thirdId).assertEqual(3);
    });

    // @tc.number CatalogBindingPart33_0006_catalog_binding_4_peer3_third3
    // @tc.name CatalogBindingPart33_0006_catalog_binding_4_peer3_third3
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc PRODUCT_DATA binds image title price to the same product and isolates item identities
    it('CatalogBindingPart33_0006_catalog_binding_4_peer3_third3', 0, (): void => {
      const count: number = PRODUCT_DATA.length;
      expect(count).assertEqual(6);
      const first: ProductDataModel = PRODUCT_DATA[4];
      const second: ProductDataModel = PRODUCT_DATA[3];
      const expectedImage: ResourceStr = $r('app.media.embed_product004');
      const expectedTitle: ResourceStr = $r('app.string.embed_product_title004');
      const expectedPrice: ResourceStr = $r('app.string.embed_product_price004');
      const actualImage = first.imageRes;
      const actualTitle = first.title;
      const actualPrice = first.price;
      expect(actualImage).assertDeepEquals(expectedImage);
      expect(actualTitle).assertDeepEquals(expectedTitle);
      expect(actualPrice).assertDeepEquals(expectedPrice);
      const firstId: number = first.id;
      const secondId: number = second.id;
      expect(firstId).assertEqual(4);
      expect(secondId).assertEqual(3);
      const sameReference: boolean = first === second;
      expect(sameReference).assertEqual(false);
      const third: ProductDataModel = PRODUCT_DATA[3];
      const thirdId: number = third.id;
      expect(thirdId).assertEqual(3);
    });

    // @tc.number CatalogBindingPart33_0007_catalog_binding_5_peer3_third3
    // @tc.name CatalogBindingPart33_0007_catalog_binding_5_peer3_third3
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc PRODUCT_DATA binds image title price to the same product and isolates item identities
    it('CatalogBindingPart33_0007_catalog_binding_5_peer3_third3', 0, (): void => {
      const count: number = PRODUCT_DATA.length;
      expect(count).assertEqual(6);
      const first: ProductDataModel = PRODUCT_DATA[5];
      const second: ProductDataModel = PRODUCT_DATA[3];
      const expectedImage: ResourceStr = $r('app.media.embed_product005');
      const expectedTitle: ResourceStr = $r('app.string.embed_product_title005');
      const expectedPrice: ResourceStr = $r('app.string.embed_product_price005');
      const actualImage = first.imageRes;
      const actualTitle = first.title;
      const actualPrice = first.price;
      expect(actualImage).assertDeepEquals(expectedImage);
      expect(actualTitle).assertDeepEquals(expectedTitle);
      expect(actualPrice).assertDeepEquals(expectedPrice);
      const firstId: number = first.id;
      const secondId: number = second.id;
      expect(firstId).assertEqual(5);
      expect(secondId).assertEqual(3);
      const sameReference: boolean = first === second;
      expect(sameReference).assertEqual(false);
      const third: ProductDataModel = PRODUCT_DATA[3];
      const thirdId: number = third.id;
      expect(thirdId).assertEqual(3);
    });

    // @tc.number CatalogBindingPart33_0008_catalog_binding_0_peer4_third3
    // @tc.name CatalogBindingPart33_0008_catalog_binding_0_peer4_third3
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc PRODUCT_DATA binds image title price to the same product and isolates item identities
    it('CatalogBindingPart33_0008_catalog_binding_0_peer4_third3', 0, (): void => {
      const count: number = PRODUCT_DATA.length;
      expect(count).assertEqual(6);
      const first: ProductDataModel = PRODUCT_DATA[0];
      const second: ProductDataModel = PRODUCT_DATA[4];
      const expectedImage: ResourceStr = $r('app.media.embed_product000');
      const expectedTitle: ResourceStr = $r('app.string.embed_product_title000');
      const expectedPrice: ResourceStr = $r('app.string.embed_product_price000');
      const actualImage = first.imageRes;
      const actualTitle = first.title;
      const actualPrice = first.price;
      expect(actualImage).assertDeepEquals(expectedImage);
      expect(actualTitle).assertDeepEquals(expectedTitle);
      expect(actualPrice).assertDeepEquals(expectedPrice);
      const firstId: number = first.id;
      const secondId: number = second.id;
      expect(firstId).assertEqual(0);
      expect(secondId).assertEqual(4);
      const sameReference: boolean = first === second;
      expect(sameReference).assertEqual(false);
      const third: ProductDataModel = PRODUCT_DATA[3];
      const thirdId: number = third.id;
      expect(thirdId).assertEqual(3);
    });

    // @tc.number CatalogBindingPart33_0009_catalog_binding_1_peer4_third3
    // @tc.name CatalogBindingPart33_0009_catalog_binding_1_peer4_third3
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc PRODUCT_DATA binds image title price to the same product and isolates item identities
    it('CatalogBindingPart33_0009_catalog_binding_1_peer4_third3', 0, (): void => {
      const count: number = PRODUCT_DATA.length;
      expect(count).assertEqual(6);
      const first: ProductDataModel = PRODUCT_DATA[1];
      const second: ProductDataModel = PRODUCT_DATA[4];
      const expectedImage: ResourceStr = $r('app.media.embed_product001');
      const expectedTitle: ResourceStr = $r('app.string.embed_product_title001');
      const expectedPrice: ResourceStr = $r('app.string.embed_product_price001');
      const actualImage = first.imageRes;
      const actualTitle = first.title;
      const actualPrice = first.price;
      expect(actualImage).assertDeepEquals(expectedImage);
      expect(actualTitle).assertDeepEquals(expectedTitle);
      expect(actualPrice).assertDeepEquals(expectedPrice);
      const firstId: number = first.id;
      const secondId: number = second.id;
      expect(firstId).assertEqual(1);
      expect(secondId).assertEqual(4);
      const sameReference: boolean = first === second;
      expect(sameReference).assertEqual(false);
      const third: ProductDataModel = PRODUCT_DATA[3];
      const thirdId: number = third.id;
      expect(thirdId).assertEqual(3);
    });

    // @tc.number CatalogBindingPart33_0010_catalog_binding_2_peer4_third3
    // @tc.name CatalogBindingPart33_0010_catalog_binding_2_peer4_third3
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc PRODUCT_DATA binds image title price to the same product and isolates item identities
    it('CatalogBindingPart33_0010_catalog_binding_2_peer4_third3', 0, (): void => {
      const count: number = PRODUCT_DATA.length;
      expect(count).assertEqual(6);
      const first: ProductDataModel = PRODUCT_DATA[2];
      const second: ProductDataModel = PRODUCT_DATA[4];
      const expectedImage: ResourceStr = $r('app.media.embed_product002');
      const expectedTitle: ResourceStr = $r('app.string.embed_product_title002');
      const expectedPrice: ResourceStr = $r('app.string.embed_product_price002');
      const actualImage = first.imageRes;
      const actualTitle = first.title;
      const actualPrice = first.price;
      expect(actualImage).assertDeepEquals(expectedImage);
      expect(actualTitle).assertDeepEquals(expectedTitle);
      expect(actualPrice).assertDeepEquals(expectedPrice);
      const firstId: number = first.id;
      const secondId: number = second.id;
      expect(firstId).assertEqual(2);
      expect(secondId).assertEqual(4);
      const sameReference: boolean = first === second;
      expect(sameReference).assertEqual(false);
      const third: ProductDataModel = PRODUCT_DATA[3];
      const thirdId: number = third.id;
      expect(thirdId).assertEqual(3);
    });

    // @tc.number CatalogBindingPart33_0011_catalog_binding_3_peer4_third3
    // @tc.name CatalogBindingPart33_0011_catalog_binding_3_peer4_third3
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc PRODUCT_DATA binds image title price to the same product and isolates item identities
    it('CatalogBindingPart33_0011_catalog_binding_3_peer4_third3', 0, (): void => {
      const count: number = PRODUCT_DATA.length;
      expect(count).assertEqual(6);
      const first: ProductDataModel = PRODUCT_DATA[3];
      const second: ProductDataModel = PRODUCT_DATA[4];
      const expectedImage: ResourceStr = $r('app.media.embed_product003');
      const expectedTitle: ResourceStr = $r('app.string.embed_product_title003');
      const expectedPrice: ResourceStr = $r('app.string.embed_product_price003');
      const actualImage = first.imageRes;
      const actualTitle = first.title;
      const actualPrice = first.price;
      expect(actualImage).assertDeepEquals(expectedImage);
      expect(actualTitle).assertDeepEquals(expectedTitle);
      expect(actualPrice).assertDeepEquals(expectedPrice);
      const firstId: number = first.id;
      const secondId: number = second.id;
      expect(firstId).assertEqual(3);
      expect(secondId).assertEqual(4);
      const sameReference: boolean = first === second;
      expect(sameReference).assertEqual(false);
      const third: ProductDataModel = PRODUCT_DATA[3];
      const thirdId: number = third.id;
      expect(thirdId).assertEqual(3);
    });

    // @tc.number CatalogBindingPart33_0012_catalog_binding_4_peer4_third3
    // @tc.name CatalogBindingPart33_0012_catalog_binding_4_peer4_third3
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc PRODUCT_DATA binds image title price to the same product and isolates item identities
    it('CatalogBindingPart33_0012_catalog_binding_4_peer4_third3', 0, (): void => {
      const count: number = PRODUCT_DATA.length;
      expect(count).assertEqual(6);
      const first: ProductDataModel = PRODUCT_DATA[4];
      const second: ProductDataModel = PRODUCT_DATA[4];
      const expectedImage: ResourceStr = $r('app.media.embed_product004');
      const expectedTitle: ResourceStr = $r('app.string.embed_product_title004');
      const expectedPrice: ResourceStr = $r('app.string.embed_product_price004');
      const actualImage = first.imageRes;
      const actualTitle = first.title;
      const actualPrice = first.price;
      expect(actualImage).assertDeepEquals(expectedImage);
      expect(actualTitle).assertDeepEquals(expectedTitle);
      expect(actualPrice).assertDeepEquals(expectedPrice);
      const firstId: number = first.id;
      const secondId: number = second.id;
      expect(firstId).assertEqual(4);
      expect(secondId).assertEqual(4);
      const sameReference: boolean = first === second;
      expect(sameReference).assertEqual(true);
      const third: ProductDataModel = PRODUCT_DATA[3];
      const thirdId: number = third.id;
      expect(thirdId).assertEqual(3);
    });

    // @tc.number CatalogBindingPart33_0013_catalog_binding_5_peer4_third3
    // @tc.name CatalogBindingPart33_0013_catalog_binding_5_peer4_third3
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc PRODUCT_DATA binds image title price to the same product and isolates item identities
    it('CatalogBindingPart33_0013_catalog_binding_5_peer4_third3', 0, (): void => {
      const count: number = PRODUCT_DATA.length;
      expect(count).assertEqual(6);
      const first: ProductDataModel = PRODUCT_DATA[5];
      const second: ProductDataModel = PRODUCT_DATA[4];
      const expectedImage: ResourceStr = $r('app.media.embed_product005');
      const expectedTitle: ResourceStr = $r('app.string.embed_product_title005');
      const expectedPrice: ResourceStr = $r('app.string.embed_product_price005');
      const actualImage = first.imageRes;
      const actualTitle = first.title;
      const actualPrice = first.price;
      expect(actualImage).assertDeepEquals(expectedImage);
      expect(actualTitle).assertDeepEquals(expectedTitle);
      expect(actualPrice).assertDeepEquals(expectedPrice);
      const firstId: number = first.id;
      const secondId: number = second.id;
      expect(firstId).assertEqual(5);
      expect(secondId).assertEqual(4);
      const sameReference: boolean = first === second;
      expect(sameReference).assertEqual(false);
      const third: ProductDataModel = PRODUCT_DATA[3];
      const thirdId: number = third.id;
      expect(thirdId).assertEqual(3);
    });

    // @tc.number CatalogBindingPart33_0014_catalog_binding_0_peer5_third3
    // @tc.name CatalogBindingPart33_0014_catalog_binding_0_peer5_third3
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc PRODUCT_DATA binds image title price to the same product and isolates item identities
    it('CatalogBindingPart33_0014_catalog_binding_0_peer5_third3', 0, (): void => {
      const count: number = PRODUCT_DATA.length;
      expect(count).assertEqual(6);
      const first: ProductDataModel = PRODUCT_DATA[0];
      const second: ProductDataModel = PRODUCT_DATA[5];
      const expectedImage: ResourceStr = $r('app.media.embed_product000');
      const expectedTitle: ResourceStr = $r('app.string.embed_product_title000');
      const expectedPrice: ResourceStr = $r('app.string.embed_product_price000');
      const actualImage = first.imageRes;
      const actualTitle = first.title;
      const actualPrice = first.price;
      expect(actualImage).assertDeepEquals(expectedImage);
      expect(actualTitle).assertDeepEquals(expectedTitle);
      expect(actualPrice).assertDeepEquals(expectedPrice);
      const firstId: number = first.id;
      const secondId: number = second.id;
      expect(firstId).assertEqual(0);
      expect(secondId).assertEqual(5);
      const sameReference: boolean = first === second;
      expect(sameReference).assertEqual(false);
      const third: ProductDataModel = PRODUCT_DATA[3];
      const thirdId: number = third.id;
      expect(thirdId).assertEqual(3);
    });

    // @tc.number CatalogBindingPart33_0015_catalog_binding_1_peer5_third3
    // @tc.name CatalogBindingPart33_0015_catalog_binding_1_peer5_third3
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc PRODUCT_DATA binds image title price to the same product and isolates item identities
    it('CatalogBindingPart33_0015_catalog_binding_1_peer5_third3', 0, (): void => {
      const count: number = PRODUCT_DATA.length;
      expect(count).assertEqual(6);
      const first: ProductDataModel = PRODUCT_DATA[1];
      const second: ProductDataModel = PRODUCT_DATA[5];
      const expectedImage: ResourceStr = $r('app.media.embed_product001');
      const expectedTitle: ResourceStr = $r('app.string.embed_product_title001');
      const expectedPrice: ResourceStr = $r('app.string.embed_product_price001');
      const actualImage = first.imageRes;
      const actualTitle = first.title;
      const actualPrice = first.price;
      expect(actualImage).assertDeepEquals(expectedImage);
      expect(actualTitle).assertDeepEquals(expectedTitle);
      expect(actualPrice).assertDeepEquals(expectedPrice);
      const firstId: number = first.id;
      const secondId: number = second.id;
      expect(firstId).assertEqual(1);
      expect(secondId).assertEqual(5);
      const sameReference: boolean = first === second;
      expect(sameReference).assertEqual(false);
      const third: ProductDataModel = PRODUCT_DATA[3];
      const thirdId: number = third.id;
      expect(thirdId).assertEqual(3);
    });

    // @tc.number CatalogBindingPart33_0016_catalog_binding_2_peer5_third3
    // @tc.name CatalogBindingPart33_0016_catalog_binding_2_peer5_third3
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc PRODUCT_DATA binds image title price to the same product and isolates item identities
    it('CatalogBindingPart33_0016_catalog_binding_2_peer5_third3', 0, (): void => {
      const count: number = PRODUCT_DATA.length;
      expect(count).assertEqual(6);
      const first: ProductDataModel = PRODUCT_DATA[2];
      const second: ProductDataModel = PRODUCT_DATA[5];
      const expectedImage: ResourceStr = $r('app.media.embed_product002');
      const expectedTitle: ResourceStr = $r('app.string.embed_product_title002');
      const expectedPrice: ResourceStr = $r('app.string.embed_product_price002');
      const actualImage = first.imageRes;
      const actualTitle = first.title;
      const actualPrice = first.price;
      expect(actualImage).assertDeepEquals(expectedImage);
      expect(actualTitle).assertDeepEquals(expectedTitle);
      expect(actualPrice).assertDeepEquals(expectedPrice);
      const firstId: number = first.id;
      const secondId: number = second.id;
      expect(firstId).assertEqual(2);
      expect(secondId).assertEqual(5);
      const sameReference: boolean = first === second;
      expect(sameReference).assertEqual(false);
      const third: ProductDataModel = PRODUCT_DATA[3];
      const thirdId: number = third.id;
      expect(thirdId).assertEqual(3);
    });

    // @tc.number CatalogBindingPart33_0017_catalog_binding_3_peer5_third3
    // @tc.name CatalogBindingPart33_0017_catalog_binding_3_peer5_third3
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc PRODUCT_DATA binds image title price to the same product and isolates item identities
    it('CatalogBindingPart33_0017_catalog_binding_3_peer5_third3', 0, (): void => {
      const count: number = PRODUCT_DATA.length;
      expect(count).assertEqual(6);
      const first: ProductDataModel = PRODUCT_DATA[3];
      const second: ProductDataModel = PRODUCT_DATA[5];
      const expectedImage: ResourceStr = $r('app.media.embed_product003');
      const expectedTitle: ResourceStr = $r('app.string.embed_product_title003');
      const expectedPrice: ResourceStr = $r('app.string.embed_product_price003');
      const actualImage = first.imageRes;
      const actualTitle = first.title;
      const actualPrice = first.price;
      expect(actualImage).assertDeepEquals(expectedImage);
      expect(actualTitle).assertDeepEquals(expectedTitle);
      expect(actualPrice).assertDeepEquals(expectedPrice);
      const firstId: number = first.id;
      const secondId: number = second.id;
      expect(firstId).assertEqual(3);
      expect(secondId).assertEqual(5);
      const sameReference: boolean = first === second;
      expect(sameReference).assertEqual(false);
      const third: ProductDataModel = PRODUCT_DATA[3];
      const thirdId: number = third.id;
      expect(thirdId).assertEqual(3);
    });

    // @tc.number CatalogBindingPart33_0018_catalog_binding_4_peer5_third3
    // @tc.name CatalogBindingPart33_0018_catalog_binding_4_peer5_third3
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc PRODUCT_DATA binds image title price to the same product and isolates item identities
    it('CatalogBindingPart33_0018_catalog_binding_4_peer5_third3', 0, (): void => {
      const count: number = PRODUCT_DATA.length;
      expect(count).assertEqual(6);
      const first: ProductDataModel = PRODUCT_DATA[4];
      const second: ProductDataModel = PRODUCT_DATA[5];
      const expectedImage: ResourceStr = $r('app.media.embed_product004');
      const expectedTitle: ResourceStr = $r('app.string.embed_product_title004');
      const expectedPrice: ResourceStr = $r('app.string.embed_product_price004');
      const actualImage = first.imageRes;
      const actualTitle = first.title;
      const actualPrice = first.price;
      expect(actualImage).assertDeepEquals(expectedImage);
      expect(actualTitle).assertDeepEquals(expectedTitle);
      expect(actualPrice).assertDeepEquals(expectedPrice);
      const firstId: number = first.id;
      const secondId: number = second.id;
      expect(firstId).assertEqual(4);
      expect(secondId).assertEqual(5);
      const sameReference: boolean = first === second;
      expect(sameReference).assertEqual(false);
      const third: ProductDataModel = PRODUCT_DATA[3];
      const thirdId: number = third.id;
      expect(thirdId).assertEqual(3);
    });

    // @tc.number CatalogBindingPart33_0019_catalog_binding_5_peer5_third3
    // @tc.name CatalogBindingPart33_0019_catalog_binding_5_peer5_third3
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc PRODUCT_DATA binds image title price to the same product and isolates item identities
    it('CatalogBindingPart33_0019_catalog_binding_5_peer5_third3', 0, (): void => {
      const count: number = PRODUCT_DATA.length;
      expect(count).assertEqual(6);
      const first: ProductDataModel = PRODUCT_DATA[5];
      const second: ProductDataModel = PRODUCT_DATA[5];
      const expectedImage: ResourceStr = $r('app.media.embed_product005');
      const expectedTitle: ResourceStr = $r('app.string.embed_product_title005');
      const expectedPrice: ResourceStr = $r('app.string.embed_product_price005');
      const actualImage = first.imageRes;
      const actualTitle = first.title;
      const actualPrice = first.price;
      expect(actualImage).assertDeepEquals(expectedImage);
      expect(actualTitle).assertDeepEquals(expectedTitle);
      expect(actualPrice).assertDeepEquals(expectedPrice);
      const firstId: number = first.id;
      const secondId: number = second.id;
      expect(firstId).assertEqual(5);
      expect(secondId).assertEqual(5);
      const sameReference: boolean = first === second;
      expect(sameReference).assertEqual(true);
      const third: ProductDataModel = PRODUCT_DATA[3];
      const thirdId: number = third.id;
      expect(thirdId).assertEqual(3);
    });

    // @tc.number CatalogBindingPart33_0020_catalog_binding_0_peer0_third4
    // @tc.name CatalogBindingPart33_0020_catalog_binding_0_peer0_third4
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc PRODUCT_DATA binds image title price to the same product and isolates item identities
    it('CatalogBindingPart33_0020_catalog_binding_0_peer0_third4', 0, (): void => {
      const count: number = PRODUCT_DATA.length;
      expect(count).assertEqual(6);
      const first: ProductDataModel = PRODUCT_DATA[0];
      const second: ProductDataModel = PRODUCT_DATA[0];
      const expectedImage: ResourceStr = $r('app.media.embed_product000');
      const expectedTitle: ResourceStr = $r('app.string.embed_product_title000');
      const expectedPrice: ResourceStr = $r('app.string.embed_product_price000');
      const actualImage = first.imageRes;
      const actualTitle = first.title;
      const actualPrice = first.price;
      expect(actualImage).assertDeepEquals(expectedImage);
      expect(actualTitle).assertDeepEquals(expectedTitle);
      expect(actualPrice).assertDeepEquals(expectedPrice);
      const firstId: number = first.id;
      const secondId: number = second.id;
      expect(firstId).assertEqual(0);
      expect(secondId).assertEqual(0);
      const sameReference: boolean = first === second;
      expect(sameReference).assertEqual(true);
      const third: ProductDataModel = PRODUCT_DATA[4];
      const thirdId: number = third.id;
      expect(thirdId).assertEqual(4);
    });

    // @tc.number CatalogBindingPart33_0021_catalog_binding_1_peer0_third4
    // @tc.name CatalogBindingPart33_0021_catalog_binding_1_peer0_third4
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc PRODUCT_DATA binds image title price to the same product and isolates item identities
    it('CatalogBindingPart33_0021_catalog_binding_1_peer0_third4', 0, (): void => {
      const count: number = PRODUCT_DATA.length;
      expect(count).assertEqual(6);
      const first: ProductDataModel = PRODUCT_DATA[1];
      const second: ProductDataModel = PRODUCT_DATA[0];
      const expectedImage: ResourceStr = $r('app.media.embed_product001');
      const expectedTitle: ResourceStr = $r('app.string.embed_product_title001');
      const expectedPrice: ResourceStr = $r('app.string.embed_product_price001');
      const actualImage = first.imageRes;
      const actualTitle = first.title;
      const actualPrice = first.price;
      expect(actualImage).assertDeepEquals(expectedImage);
      expect(actualTitle).assertDeepEquals(expectedTitle);
      expect(actualPrice).assertDeepEquals(expectedPrice);
      const firstId: number = first.id;
      const secondId: number = second.id;
      expect(firstId).assertEqual(1);
      expect(secondId).assertEqual(0);
      const sameReference: boolean = first === second;
      expect(sameReference).assertEqual(false);
      const third: ProductDataModel = PRODUCT_DATA[4];
      const thirdId: number = third.id;
      expect(thirdId).assertEqual(4);
    });

    // @tc.number CatalogBindingPart33_0022_catalog_binding_2_peer0_third4
    // @tc.name CatalogBindingPart33_0022_catalog_binding_2_peer0_third4
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc PRODUCT_DATA binds image title price to the same product and isolates item identities
    it('CatalogBindingPart33_0022_catalog_binding_2_peer0_third4', 0, (): void => {
      const count: number = PRODUCT_DATA.length;
      expect(count).assertEqual(6);
      const first: ProductDataModel = PRODUCT_DATA[2];
      const second: ProductDataModel = PRODUCT_DATA[0];
      const expectedImage: ResourceStr = $r('app.media.embed_product002');
      const expectedTitle: ResourceStr = $r('app.string.embed_product_title002');
      const expectedPrice: ResourceStr = $r('app.string.embed_product_price002');
      const actualImage = first.imageRes;
      const actualTitle = first.title;
      const actualPrice = first.price;
      expect(actualImage).assertDeepEquals(expectedImage);
      expect(actualTitle).assertDeepEquals(expectedTitle);
      expect(actualPrice).assertDeepEquals(expectedPrice);
      const firstId: number = first.id;
      const secondId: number = second.id;
      expect(firstId).assertEqual(2);
      expect(secondId).assertEqual(0);
      const sameReference: boolean = first === second;
      expect(sameReference).assertEqual(false);
      const third: ProductDataModel = PRODUCT_DATA[4];
      const thirdId: number = third.id;
      expect(thirdId).assertEqual(4);
    });

    // @tc.number CatalogBindingPart33_0023_catalog_binding_3_peer0_third4
    // @tc.name CatalogBindingPart33_0023_catalog_binding_3_peer0_third4
    // @tc.type Function
    // @tc.level Level 2
    // @tc.size MediumTest
    // @tc.desc PRODUCT_DATA binds image title price to the same product and isolates item identities
    it('CatalogBindingPart33_0023_catalog_binding_3_peer0_third4', 0, (): void => {
      const count: number = PRODUCT_DATA.length;
      expect(count).assertEqual(6);
      const first: ProductDataModel = PRODUCT_DATA[3];
      const second: ProductDataModel = PRODUCT_DATA[0];
      const expectedImage: ResourceStr = $r('app.media.embed_product003');
      const expectedTitle: ResourceStr = $r('app.string.embed_product_title003');
      const expectedPrice: ResourceStr = $r('app.string.embed_product_price003');
      const actualImage = first.imageRes;
      const actualTitle = first.title;
      const actualPrice = first.price;
      expect(actualImage).assertDeepEquals(expectedImage);
      expect(actualTitle).assertDeepEquals(expectedTitle);
      expect(actualPrice).assertDeepEquals(expectedPrice);
      const firstId: number = first.id;
      const secondId: number = second.id;
      expect(firstId).assertEqual(3);
      expect(secondId).assertEqual(0);
      const sameReference: boolean = first === second;
      expect(sameReference).assertEqual(false);
      const third: ProductDataModel = PRODUCT_DATA[4];
      const thirdId: number = third.id;
      expect(thirdId).assertEqual(4);
    });
  });
}
