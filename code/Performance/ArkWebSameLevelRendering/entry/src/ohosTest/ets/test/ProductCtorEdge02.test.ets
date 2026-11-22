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
import { ProductDataModel } from '../../../main/ets/model/GoodsModel';
import { paceTurn } from './shared/TestPace';

export default function productCtorEdge02Test(): void {
  describe('productCtorEdge02Test', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_CTOREDGE_0031
     * @tc.name testProductCtorEdge0031
     * @tc.desc Charger LRR fields survive constructing the next product with inverse representations
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testProductCtorEdge0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const inputImageRes: ResourceStr = 'file://cache/charger/front.webp';
      const inputTitle: ResourceStr = $r('app.string.embed_product_title003');
      const inputPrice: ResourceStr = $r('app.string.embed_product_price003');
      const first: ProductDataModel = new ProductDataModel(
        3,
        inputImageRes,
        inputTitle,
        inputPrice
      );
      expect(first.id).assertEqual(3);
      expect(first.imageRes).assertEqual('file://cache/charger/front.webp');
      expect((first.title as Resource).id).assertEqual($r('app.string.embed_product_title003').id);
      expect((first.price as Resource).id).assertEqual($r('app.string.embed_product_price003').id);
      const later: ProductDataModel = new ProductDataModel(
        4,
        $r('app.media.embed_product004'),
        'Wireless headset - open-box',
        'USD -5.00 credit'
      );
      expect(later.id).assertEqual(4);
      expect((later.imageRes as Resource).id).assertEqual($r('app.media.embed_product004').id);
      expect(later.title).assertEqual('Wireless headset - open-box');
      expect(later.price).assertEqual('USD -5.00 credit');
      expect(first.id).assertEqual(3);
      expect(first.imageRes).assertEqual('file://cache/charger/front.webp');
      expect((first.title as Resource).id).assertEqual($r('app.string.embed_product_title003').id);
      expect((first.price as Resource).id).assertEqual($r('app.string.embed_product_price003').id);
      expect(first.title === inputTitle).assertTrue();
      expect(first.price === inputPrice).assertTrue();
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_CTOREDGE_0032
     * @tc.name testProductCtorEdge0032
     * @tc.desc Charger RRR fields survive constructing the next product with inverse representations
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testProductCtorEdge0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const inputImageRes: ResourceStr = $r('app.media.embed_product003');
      const inputTitle: ResourceStr = $r('app.string.embed_product_title003');
      const inputPrice: ResourceStr = $r('app.string.embed_product_price003');
      const first: ProductDataModel = new ProductDataModel(
        3,
        inputImageRes,
        inputTitle,
        inputPrice
      );
      expect(first.id).assertEqual(3);
      expect((first.imageRes as Resource).id).assertEqual($r('app.media.embed_product003').id);
      expect((first.title as Resource).id).assertEqual($r('app.string.embed_product_title003').id);
      expect((first.price as Resource).id).assertEqual($r('app.string.embed_product_price003').id);
      const later: ProductDataModel = new ProductDataModel(
        4,
        'https://store.example/headset/front.webp',
        'Wireless headset - open-box',
        'USD -5.00 credit'
      );
      expect(later.id).assertEqual(4);
      expect(later.imageRes).assertEqual('https://store.example/headset/front.webp');
      expect(later.title).assertEqual('Wireless headset - open-box');
      expect(later.price).assertEqual('USD -5.00 credit');
      expect(first.id).assertEqual(3);
      expect((first.imageRes as Resource).id).assertEqual($r('app.media.embed_product003').id);
      expect((first.title as Resource).id).assertEqual($r('app.string.embed_product_title003').id);
      expect((first.price as Resource).id).assertEqual($r('app.string.embed_product_price003').id);
      expect(first.imageRes === inputImageRes).assertTrue();
      expect(first.title === inputTitle).assertTrue();
      expect(first.price === inputPrice).assertTrue();
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_CTOREDGE_0033
     * @tc.name testProductCtorEdge0033
     * @tc.desc Headset LLL fields survive constructing the next product with inverse representations
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testProductCtorEdge0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const inputImageRes: ResourceStr = 'https://store.example/headset/front.webp';
      const inputTitle: ResourceStr = 'Wireless headset - open-box';
      const inputPrice: ResourceStr = 'USD -5.00 credit';
      const first: ProductDataModel = new ProductDataModel(
        4,
        inputImageRes,
        inputTitle,
        inputPrice
      );
      expect(first.id).assertEqual(4);
      expect(first.imageRes).assertEqual('https://store.example/headset/front.webp');
      expect(first.title).assertEqual('Wireless headset - open-box');
      expect(first.price).assertEqual('USD -5.00 credit');
      const later: ProductDataModel = new ProductDataModel(
        5,
        $r('app.media.embed_product005'),
        $r('app.string.embed_product_title005'),
        $r('app.string.embed_product_price005')
      );
      expect(later.id).assertEqual(5);
      expect((later.imageRes as Resource).id).assertEqual($r('app.media.embed_product005').id);
      expect((later.title as Resource).id).assertEqual($r('app.string.embed_product_title005').id);
      expect((later.price as Resource).id).assertEqual($r('app.string.embed_product_price005').id);
      expect(first.id).assertEqual(4);
      expect(first.imageRes).assertEqual('https://store.example/headset/front.webp');
      expect(first.title).assertEqual('Wireless headset - open-box');
      expect(first.price).assertEqual('USD -5.00 credit');
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_CTOREDGE_0034
     * @tc.name testProductCtorEdge0034
     * @tc.desc Headset RLL fields survive constructing the next product with inverse representations
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testProductCtorEdge0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const inputImageRes: ResourceStr = $r('app.media.embed_product004');
      const inputTitle: ResourceStr = 'Wireless headset - open-box';
      const inputPrice: ResourceStr = 'USD -5.00 credit';
      const first: ProductDataModel = new ProductDataModel(
        4,
        inputImageRes,
        inputTitle,
        inputPrice
      );
      expect(first.id).assertEqual(4);
      expect((first.imageRes as Resource).id).assertEqual($r('app.media.embed_product004').id);
      expect(first.title).assertEqual('Wireless headset - open-box');
      expect(first.price).assertEqual('USD -5.00 credit');
      const later: ProductDataModel = new ProductDataModel(
        5,
        'file://cache/backpack/front.webp',
        $r('app.string.embed_product_title005'),
        $r('app.string.embed_product_price005')
      );
      expect(later.id).assertEqual(5);
      expect(later.imageRes).assertEqual('file://cache/backpack/front.webp');
      expect((later.title as Resource).id).assertEqual($r('app.string.embed_product_title005').id);
      expect((later.price as Resource).id).assertEqual($r('app.string.embed_product_price005').id);
      expect(first.id).assertEqual(4);
      expect((first.imageRes as Resource).id).assertEqual($r('app.media.embed_product004').id);
      expect(first.title).assertEqual('Wireless headset - open-box');
      expect(first.price).assertEqual('USD -5.00 credit');
      expect(first.imageRes === inputImageRes).assertTrue();
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_CTOREDGE_0035
     * @tc.name testProductCtorEdge0035
     * @tc.desc Headset LRL fields survive constructing the next product with inverse representations
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testProductCtorEdge0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const inputImageRes: ResourceStr = 'https://store.example/headset/front.webp';
      const inputTitle: ResourceStr = $r('app.string.embed_product_title004');
      const inputPrice: ResourceStr = 'USD -5.00 credit';
      const first: ProductDataModel = new ProductDataModel(
        4,
        inputImageRes,
        inputTitle,
        inputPrice
      );
      expect(first.id).assertEqual(4);
      expect(first.imageRes).assertEqual('https://store.example/headset/front.webp');
      expect((first.title as Resource).id).assertEqual($r('app.string.embed_product_title004').id);
      expect(first.price).assertEqual('USD -5.00 credit');
      const later: ProductDataModel = new ProductDataModel(
        5,
        $r('app.media.embed_product005'),
        'Traveller\'s backpack 24 L - sand',
        $r('app.string.embed_product_price005')
      );
      expect(later.id).assertEqual(5);
      expect((later.imageRes as Resource).id).assertEqual($r('app.media.embed_product005').id);
      expect(later.title).assertEqual('Traveller\'s backpack 24 L - sand');
      expect((later.price as Resource).id).assertEqual($r('app.string.embed_product_price005').id);
      expect(first.id).assertEqual(4);
      expect(first.imageRes).assertEqual('https://store.example/headset/front.webp');
      expect((first.title as Resource).id).assertEqual($r('app.string.embed_product_title004').id);
      expect(first.price).assertEqual('USD -5.00 credit');
      expect(first.title === inputTitle).assertTrue();
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_CTOREDGE_0036
     * @tc.name testProductCtorEdge0036
     * @tc.desc Headset RRL fields survive constructing the next product with inverse representations
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testProductCtorEdge0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const inputImageRes: ResourceStr = $r('app.media.embed_product004');
      const inputTitle: ResourceStr = $r('app.string.embed_product_title004');
      const inputPrice: ResourceStr = 'USD -5.00 credit';
      const first: ProductDataModel = new ProductDataModel(
        4,
        inputImageRes,
        inputTitle,
        inputPrice
      );
      expect(first.id).assertEqual(4);
      expect((first.imageRes as Resource).id).assertEqual($r('app.media.embed_product004').id);
      expect((first.title as Resource).id).assertEqual($r('app.string.embed_product_title004').id);
      expect(first.price).assertEqual('USD -5.00 credit');
      const later: ProductDataModel = new ProductDataModel(
        5,
        'file://cache/backpack/front.webp',
        'Traveller\'s backpack 24 L - sand',
        $r('app.string.embed_product_price005')
      );
      expect(later.id).assertEqual(5);
      expect(later.imageRes).assertEqual('file://cache/backpack/front.webp');
      expect(later.title).assertEqual('Traveller\'s backpack 24 L - sand');
      expect((later.price as Resource).id).assertEqual($r('app.string.embed_product_price005').id);
      expect(first.id).assertEqual(4);
      expect((first.imageRes as Resource).id).assertEqual($r('app.media.embed_product004').id);
      expect((first.title as Resource).id).assertEqual($r('app.string.embed_product_title004').id);
      expect(first.price).assertEqual('USD -5.00 credit');
      expect(first.imageRes === inputImageRes).assertTrue();
      expect(first.title === inputTitle).assertTrue();
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_CTOREDGE_0037
     * @tc.name testProductCtorEdge0037
     * @tc.desc Headset LLR fields survive constructing the next product with inverse representations
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testProductCtorEdge0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const inputImageRes: ResourceStr = 'https://store.example/headset/front.webp';
      const inputTitle: ResourceStr = 'Wireless headset - open-box';
      const inputPrice: ResourceStr = $r('app.string.embed_product_price004');
      const first: ProductDataModel = new ProductDataModel(
        4,
        inputImageRes,
        inputTitle,
        inputPrice
      );
      expect(first.id).assertEqual(4);
      expect(first.imageRes).assertEqual('https://store.example/headset/front.webp');
      expect(first.title).assertEqual('Wireless headset - open-box');
      expect((first.price as Resource).id).assertEqual($r('app.string.embed_product_price004').id);
      const later: ProductDataModel = new ProductDataModel(
        5,
        $r('app.media.embed_product005'),
        $r('app.string.embed_product_title005'),
        'USD 39.00-49.00'
      );
      expect(later.id).assertEqual(5);
      expect((later.imageRes as Resource).id).assertEqual($r('app.media.embed_product005').id);
      expect((later.title as Resource).id).assertEqual($r('app.string.embed_product_title005').id);
      expect(later.price).assertEqual('USD 39.00-49.00');
      expect(first.id).assertEqual(4);
      expect(first.imageRes).assertEqual('https://store.example/headset/front.webp');
      expect(first.title).assertEqual('Wireless headset - open-box');
      expect((first.price as Resource).id).assertEqual($r('app.string.embed_product_price004').id);
      expect(first.price === inputPrice).assertTrue();
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_CTOREDGE_0038
     * @tc.name testProductCtorEdge0038
     * @tc.desc Headset RLR fields survive constructing the next product with inverse representations
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testProductCtorEdge0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const inputImageRes: ResourceStr = $r('app.media.embed_product004');
      const inputTitle: ResourceStr = 'Wireless headset - open-box';
      const inputPrice: ResourceStr = $r('app.string.embed_product_price004');
      const first: ProductDataModel = new ProductDataModel(
        4,
        inputImageRes,
        inputTitle,
        inputPrice
      );
      expect(first.id).assertEqual(4);
      expect((first.imageRes as Resource).id).assertEqual($r('app.media.embed_product004').id);
      expect(first.title).assertEqual('Wireless headset - open-box');
      expect((first.price as Resource).id).assertEqual($r('app.string.embed_product_price004').id);
      const later: ProductDataModel = new ProductDataModel(
        5,
        'file://cache/backpack/front.webp',
        $r('app.string.embed_product_title005'),
        'USD 39.00-49.00'
      );
      expect(later.id).assertEqual(5);
      expect(later.imageRes).assertEqual('file://cache/backpack/front.webp');
      expect((later.title as Resource).id).assertEqual($r('app.string.embed_product_title005').id);
      expect(later.price).assertEqual('USD 39.00-49.00');
      expect(first.id).assertEqual(4);
      expect((first.imageRes as Resource).id).assertEqual($r('app.media.embed_product004').id);
      expect(first.title).assertEqual('Wireless headset - open-box');
      expect((first.price as Resource).id).assertEqual($r('app.string.embed_product_price004').id);
      expect(first.imageRes === inputImageRes).assertTrue();
      expect(first.price === inputPrice).assertTrue();
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_CTOREDGE_0039
     * @tc.name testProductCtorEdge0039
     * @tc.desc Headset LRR fields survive constructing the next product with inverse representations
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testProductCtorEdge0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const inputImageRes: ResourceStr = 'https://store.example/headset/front.webp';
      const inputTitle: ResourceStr = $r('app.string.embed_product_title004');
      const inputPrice: ResourceStr = $r('app.string.embed_product_price004');
      const first: ProductDataModel = new ProductDataModel(
        4,
        inputImageRes,
        inputTitle,
        inputPrice
      );
      expect(first.id).assertEqual(4);
      expect(first.imageRes).assertEqual('https://store.example/headset/front.webp');
      expect((first.title as Resource).id).assertEqual($r('app.string.embed_product_title004').id);
      expect((first.price as Resource).id).assertEqual($r('app.string.embed_product_price004').id);
      const later: ProductDataModel = new ProductDataModel(
        5,
        $r('app.media.embed_product005'),
        'Traveller\'s backpack 24 L - sand',
        'USD 39.00-49.00'
      );
      expect(later.id).assertEqual(5);
      expect((later.imageRes as Resource).id).assertEqual($r('app.media.embed_product005').id);
      expect(later.title).assertEqual('Traveller\'s backpack 24 L - sand');
      expect(later.price).assertEqual('USD 39.00-49.00');
      expect(first.id).assertEqual(4);
      expect(first.imageRes).assertEqual('https://store.example/headset/front.webp');
      expect((first.title as Resource).id).assertEqual($r('app.string.embed_product_title004').id);
      expect((first.price as Resource).id).assertEqual($r('app.string.embed_product_price004').id);
      expect(first.title === inputTitle).assertTrue();
      expect(first.price === inputPrice).assertTrue();
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_CTOREDGE_0040
     * @tc.name testProductCtorEdge0040
     * @tc.desc Headset RRR fields survive constructing the next product with inverse representations
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testProductCtorEdge0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const inputImageRes: ResourceStr = $r('app.media.embed_product004');
      const inputTitle: ResourceStr = $r('app.string.embed_product_title004');
      const inputPrice: ResourceStr = $r('app.string.embed_product_price004');
      const first: ProductDataModel = new ProductDataModel(
        4,
        inputImageRes,
        inputTitle,
        inputPrice
      );
      expect(first.id).assertEqual(4);
      expect((first.imageRes as Resource).id).assertEqual($r('app.media.embed_product004').id);
      expect((first.title as Resource).id).assertEqual($r('app.string.embed_product_title004').id);
      expect((first.price as Resource).id).assertEqual($r('app.string.embed_product_price004').id);
      const later: ProductDataModel = new ProductDataModel(
        5,
        'file://cache/backpack/front.webp',
        'Traveller\'s backpack 24 L - sand',
        'USD 39.00-49.00'
      );
      expect(later.id).assertEqual(5);
      expect(later.imageRes).assertEqual('file://cache/backpack/front.webp');
      expect(later.title).assertEqual('Traveller\'s backpack 24 L - sand');
      expect(later.price).assertEqual('USD 39.00-49.00');
      expect(first.id).assertEqual(4);
      expect((first.imageRes as Resource).id).assertEqual($r('app.media.embed_product004').id);
      expect((first.title as Resource).id).assertEqual($r('app.string.embed_product_title004').id);
      expect((first.price as Resource).id).assertEqual($r('app.string.embed_product_price004').id);
      expect(first.imageRes === inputImageRes).assertTrue();
      expect(first.title === inputTitle).assertTrue();
      expect(first.price === inputPrice).assertTrue();
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_CTOREDGE_0041
     * @tc.name testProductCtorEdge0041
     * @tc.desc Backpack LLL fields survive constructing the next product with inverse representations
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testProductCtorEdge0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const inputImageRes: ResourceStr = 'file://cache/backpack/front.webp';
      const inputTitle: ResourceStr = 'Traveller\'s backpack 24 L - sand';
      const inputPrice: ResourceStr = 'USD 39.00-49.00';
      const first: ProductDataModel = new ProductDataModel(
        5,
        inputImageRes,
        inputTitle,
        inputPrice
      );
      expect(first.id).assertEqual(5);
      expect(first.imageRes).assertEqual('file://cache/backpack/front.webp');
      expect(first.title).assertEqual('Traveller\'s backpack 24 L - sand');
      expect(first.price).assertEqual('USD 39.00-49.00');
      const later: ProductDataModel = new ProductDataModel(
        0,
        $r('app.media.embed_product000'),
        $r('app.string.embed_product_title000'),
        $r('app.string.embed_product_price000')
      );
      expect(later.id).assertEqual(0);
      expect((later.imageRes as Resource).id).assertEqual($r('app.media.embed_product000').id);
      expect((later.title as Resource).id).assertEqual($r('app.string.embed_product_title000').id);
      expect((later.price as Resource).id).assertEqual($r('app.string.embed_product_price000').id);
      expect(first.id).assertEqual(5);
      expect(first.imageRes).assertEqual('file://cache/backpack/front.webp');
      expect(first.title).assertEqual('Traveller\'s backpack 24 L - sand');
      expect(first.price).assertEqual('USD 39.00-49.00');
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_CTOREDGE_0042
     * @tc.name testProductCtorEdge0042
     * @tc.desc Backpack RLL fields survive constructing the next product with inverse representations
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testProductCtorEdge0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const inputImageRes: ResourceStr = $r('app.media.embed_product005');
      const inputTitle: ResourceStr = 'Traveller\'s backpack 24 L - sand';
      const inputPrice: ResourceStr = 'USD 39.00-49.00';
      const first: ProductDataModel = new ProductDataModel(
        5,
        inputImageRes,
        inputTitle,
        inputPrice
      );
      expect(first.id).assertEqual(5);
      expect((first.imageRes as Resource).id).assertEqual($r('app.media.embed_product005').id);
      expect(first.title).assertEqual('Traveller\'s backpack 24 L - sand');
      expect(first.price).assertEqual('USD 39.00-49.00');
      const later: ProductDataModel = new ProductDataModel(
        0,
        'https://store.example/power-bank/front.webp',
        $r('app.string.embed_product_title000'),
        $r('app.string.embed_product_price000')
      );
      expect(later.id).assertEqual(0);
      expect(later.imageRes).assertEqual('https://store.example/power-bank/front.webp');
      expect((later.title as Resource).id).assertEqual($r('app.string.embed_product_title000').id);
      expect((later.price as Resource).id).assertEqual($r('app.string.embed_product_price000').id);
      expect(first.id).assertEqual(5);
      expect((first.imageRes as Resource).id).assertEqual($r('app.media.embed_product005').id);
      expect(first.title).assertEqual('Traveller\'s backpack 24 L - sand');
      expect(first.price).assertEqual('USD 39.00-49.00');
      expect(first.imageRes === inputImageRes).assertTrue();
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_CTOREDGE_0043
     * @tc.name testProductCtorEdge0043
     * @tc.desc Backpack LRL fields survive constructing the next product with inverse representations
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testProductCtorEdge0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const inputImageRes: ResourceStr = 'file://cache/backpack/front.webp';
      const inputTitle: ResourceStr = $r('app.string.embed_product_title005');
      const inputPrice: ResourceStr = 'USD 39.00-49.00';
      const first: ProductDataModel = new ProductDataModel(
        5,
        inputImageRes,
        inputTitle,
        inputPrice
      );
      expect(first.id).assertEqual(5);
      expect(first.imageRes).assertEqual('file://cache/backpack/front.webp');
      expect((first.title as Resource).id).assertEqual($r('app.string.embed_product_title005').id);
      expect(first.price).assertEqual('USD 39.00-49.00');
      const later: ProductDataModel = new ProductDataModel(
        0,
        $r('app.media.embed_product000'),
        'Power bank 20000 mAh - graphite',
        $r('app.string.embed_product_price000')
      );
      expect(later.id).assertEqual(0);
      expect((later.imageRes as Resource).id).assertEqual($r('app.media.embed_product000').id);
      expect(later.title).assertEqual('Power bank 20000 mAh - graphite');
      expect((later.price as Resource).id).assertEqual($r('app.string.embed_product_price000').id);
      expect(first.id).assertEqual(5);
      expect(first.imageRes).assertEqual('file://cache/backpack/front.webp');
      expect((first.title as Resource).id).assertEqual($r('app.string.embed_product_title005').id);
      expect(first.price).assertEqual('USD 39.00-49.00');
      expect(first.title === inputTitle).assertTrue();
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_CTOREDGE_0044
     * @tc.name testProductCtorEdge0044
     * @tc.desc Backpack RRL fields survive constructing the next product with inverse representations
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testProductCtorEdge0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const inputImageRes: ResourceStr = $r('app.media.embed_product005');
      const inputTitle: ResourceStr = $r('app.string.embed_product_title005');
      const inputPrice: ResourceStr = 'USD 39.00-49.00';
      const first: ProductDataModel = new ProductDataModel(
        5,
        inputImageRes,
        inputTitle,
        inputPrice
      );
      expect(first.id).assertEqual(5);
      expect((first.imageRes as Resource).id).assertEqual($r('app.media.embed_product005').id);
      expect((first.title as Resource).id).assertEqual($r('app.string.embed_product_title005').id);
      expect(first.price).assertEqual('USD 39.00-49.00');
      const later: ProductDataModel = new ProductDataModel(
        0,
        'https://store.example/power-bank/front.webp',
        'Power bank 20000 mAh - graphite',
        $r('app.string.embed_product_price000')
      );
      expect(later.id).assertEqual(0);
      expect(later.imageRes).assertEqual('https://store.example/power-bank/front.webp');
      expect(later.title).assertEqual('Power bank 20000 mAh - graphite');
      expect((later.price as Resource).id).assertEqual($r('app.string.embed_product_price000').id);
      expect(first.id).assertEqual(5);
      expect((first.imageRes as Resource).id).assertEqual($r('app.media.embed_product005').id);
      expect((first.title as Resource).id).assertEqual($r('app.string.embed_product_title005').id);
      expect(first.price).assertEqual('USD 39.00-49.00');
      expect(first.imageRes === inputImageRes).assertTrue();
      expect(first.title === inputTitle).assertTrue();
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_CTOREDGE_0045
     * @tc.name testProductCtorEdge0045
     * @tc.desc Backpack LLR fields survive constructing the next product with inverse representations
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testProductCtorEdge0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const inputImageRes: ResourceStr = 'file://cache/backpack/front.webp';
      const inputTitle: ResourceStr = 'Traveller\'s backpack 24 L - sand';
      const inputPrice: ResourceStr = $r('app.string.embed_product_price005');
      const first: ProductDataModel = new ProductDataModel(
        5,
        inputImageRes,
        inputTitle,
        inputPrice
      );
      expect(first.id).assertEqual(5);
      expect(first.imageRes).assertEqual('file://cache/backpack/front.webp');
      expect(first.title).assertEqual('Traveller\'s backpack 24 L - sand');
      expect((first.price as Resource).id).assertEqual($r('app.string.embed_product_price005').id);
      const later: ProductDataModel = new ProductDataModel(
        0,
        $r('app.media.embed_product000'),
        $r('app.string.embed_product_title000'),
        'USD 29.90'
      );
      expect(later.id).assertEqual(0);
      expect((later.imageRes as Resource).id).assertEqual($r('app.media.embed_product000').id);
      expect((later.title as Resource).id).assertEqual($r('app.string.embed_product_title000').id);
      expect(later.price).assertEqual('USD 29.90');
      expect(first.id).assertEqual(5);
      expect(first.imageRes).assertEqual('file://cache/backpack/front.webp');
      expect(first.title).assertEqual('Traveller\'s backpack 24 L - sand');
      expect((first.price as Resource).id).assertEqual($r('app.string.embed_product_price005').id);
      expect(first.price === inputPrice).assertTrue();
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_CTOREDGE_0046
     * @tc.name testProductCtorEdge0046
     * @tc.desc Backpack RLR fields survive constructing the next product with inverse representations
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testProductCtorEdge0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const inputImageRes: ResourceStr = $r('app.media.embed_product005');
      const inputTitle: ResourceStr = 'Traveller\'s backpack 24 L - sand';
      const inputPrice: ResourceStr = $r('app.string.embed_product_price005');
      const first: ProductDataModel = new ProductDataModel(
        5,
        inputImageRes,
        inputTitle,
        inputPrice
      );
      expect(first.id).assertEqual(5);
      expect((first.imageRes as Resource).id).assertEqual($r('app.media.embed_product005').id);
      expect(first.title).assertEqual('Traveller\'s backpack 24 L - sand');
      expect((first.price as Resource).id).assertEqual($r('app.string.embed_product_price005').id);
      const later: ProductDataModel = new ProductDataModel(
        0,
        'https://store.example/power-bank/front.webp',
        $r('app.string.embed_product_title000'),
        'USD 29.90'
      );
      expect(later.id).assertEqual(0);
      expect(later.imageRes).assertEqual('https://store.example/power-bank/front.webp');
      expect((later.title as Resource).id).assertEqual($r('app.string.embed_product_title000').id);
      expect(later.price).assertEqual('USD 29.90');
      expect(first.id).assertEqual(5);
      expect((first.imageRes as Resource).id).assertEqual($r('app.media.embed_product005').id);
      expect(first.title).assertEqual('Traveller\'s backpack 24 L - sand');
      expect((first.price as Resource).id).assertEqual($r('app.string.embed_product_price005').id);
      expect(first.imageRes === inputImageRes).assertTrue();
      expect(first.price === inputPrice).assertTrue();
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_CTOREDGE_0047
     * @tc.name testProductCtorEdge0047
     * @tc.desc Backpack LRR fields survive constructing the next product with inverse representations
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testProductCtorEdge0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const inputImageRes: ResourceStr = 'file://cache/backpack/front.webp';
      const inputTitle: ResourceStr = $r('app.string.embed_product_title005');
      const inputPrice: ResourceStr = $r('app.string.embed_product_price005');
      const first: ProductDataModel = new ProductDataModel(
        5,
        inputImageRes,
        inputTitle,
        inputPrice
      );
      expect(first.id).assertEqual(5);
      expect(first.imageRes).assertEqual('file://cache/backpack/front.webp');
      expect((first.title as Resource).id).assertEqual($r('app.string.embed_product_title005').id);
      expect((first.price as Resource).id).assertEqual($r('app.string.embed_product_price005').id);
      const later: ProductDataModel = new ProductDataModel(
        0,
        $r('app.media.embed_product000'),
        'Power bank 20000 mAh - graphite',
        'USD 29.90'
      );
      expect(later.id).assertEqual(0);
      expect((later.imageRes as Resource).id).assertEqual($r('app.media.embed_product000').id);
      expect(later.title).assertEqual('Power bank 20000 mAh - graphite');
      expect(later.price).assertEqual('USD 29.90');
      expect(first.id).assertEqual(5);
      expect(first.imageRes).assertEqual('file://cache/backpack/front.webp');
      expect((first.title as Resource).id).assertEqual($r('app.string.embed_product_title005').id);
      expect((first.price as Resource).id).assertEqual($r('app.string.embed_product_price005').id);
      expect(first.title === inputTitle).assertTrue();
      expect(first.price === inputPrice).assertTrue();
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_CTOREDGE_0048
     * @tc.name testProductCtorEdge0048
     * @tc.desc Backpack RRR fields survive constructing the next product with inverse representations
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testProductCtorEdge0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const inputImageRes: ResourceStr = $r('app.media.embed_product005');
      const inputTitle: ResourceStr = $r('app.string.embed_product_title005');
      const inputPrice: ResourceStr = $r('app.string.embed_product_price005');
      const first: ProductDataModel = new ProductDataModel(
        5,
        inputImageRes,
        inputTitle,
        inputPrice
      );
      expect(first.id).assertEqual(5);
      expect((first.imageRes as Resource).id).assertEqual($r('app.media.embed_product005').id);
      expect((first.title as Resource).id).assertEqual($r('app.string.embed_product_title005').id);
      expect((first.price as Resource).id).assertEqual($r('app.string.embed_product_price005').id);
      const later: ProductDataModel = new ProductDataModel(
        0,
        'https://store.example/power-bank/front.webp',
        'Power bank 20000 mAh - graphite',
        'USD 29.90'
      );
      expect(later.id).assertEqual(0);
      expect(later.imageRes).assertEqual('https://store.example/power-bank/front.webp');
      expect(later.title).assertEqual('Power bank 20000 mAh - graphite');
      expect(later.price).assertEqual('USD 29.90');
      expect(first.id).assertEqual(5);
      expect((first.imageRes as Resource).id).assertEqual($r('app.media.embed_product005').id);
      expect((first.title as Resource).id).assertEqual($r('app.string.embed_product_title005').id);
      expect((first.price as Resource).id).assertEqual($r('app.string.embed_product_price005').id);
      expect(first.imageRes === inputImageRes).assertTrue();
      expect(first.title === inputTitle).assertTrue();
      expect(first.price === inputPrice).assertTrue();
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_CTOREDGE_0049
     * @tc.name testProductCtorEdge0049
     * @tc.desc Draft id -1 retains missing presentation fields without catalog defaults
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testProductCtorEdge0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const inputImageRes: ResourceStr = '';
      const inputTitle: ResourceStr = '';
      const inputPrice: ResourceStr = '';
      const first: ProductDataModel = new ProductDataModel(
        -1,
        inputImageRes,
        inputTitle,
        inputPrice
      );
      expect(first.id).assertEqual(-1);
      expect(first.imageRes).assertEqual('');
      expect(first.title).assertEqual('');
      expect(first.price).assertEqual('');
      const later: ProductDataModel = new ProductDataModel(
        5,
        $r('app.media.embed_product005'),
        $r('app.string.embed_product_title005'),
        $r('app.string.embed_product_price005')
      );
      expect(later.id).assertEqual(5);
      expect((later.imageRes as Resource).id).assertEqual($r('app.media.embed_product005').id);
      expect((later.title as Resource).id).assertEqual($r('app.string.embed_product_title005').id);
      expect((later.price as Resource).id).assertEqual($r('app.string.embed_product_price005').id);
      expect(first.id).assertEqual(-1);
      expect(first.imageRes).assertEqual('');
      expect(first.title).assertEqual('');
      expect(first.price).assertEqual('');
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_CTOREDGE_0050
     * @tc.name testProductCtorEdge0050
     * @tc.desc First catalog id 0 keeps resource-backed fields after an unrelated construction
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testProductCtorEdge0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const inputImageRes: ResourceStr = $r('app.media.embed_product000');
      const inputTitle: ResourceStr = $r('app.string.embed_product_title000');
      const inputPrice: ResourceStr = $r('app.string.embed_product_price000');
      const first: ProductDataModel = new ProductDataModel(
        0,
        inputImageRes,
        inputTitle,
        inputPrice
      );
      expect(first.id).assertEqual(0);
      expect((first.imageRes as Resource).id).assertEqual($r('app.media.embed_product000').id);
      expect((first.title as Resource).id).assertEqual($r('app.string.embed_product_title000').id);
      expect((first.price as Resource).id).assertEqual($r('app.string.embed_product_price000').id);
      const later: ProductDataModel = new ProductDataModel(
        5,
        $r('app.media.embed_product005'),
        $r('app.string.embed_product_title005'),
        $r('app.string.embed_product_price005')
      );
      expect(later.id).assertEqual(5);
      expect((later.imageRes as Resource).id).assertEqual($r('app.media.embed_product005').id);
      expect((later.title as Resource).id).assertEqual($r('app.string.embed_product_title005').id);
      expect((later.price as Resource).id).assertEqual($r('app.string.embed_product_price005').id);
      expect(first.id).assertEqual(0);
      expect((first.imageRes as Resource).id).assertEqual($r('app.media.embed_product000').id);
      expect((first.title as Resource).id).assertEqual($r('app.string.embed_product_title000').id);
      expect((first.price as Resource).id).assertEqual($r('app.string.embed_product_price000').id);
      expect(first.imageRes === inputImageRes).assertTrue();
      expect(first.title === inputTitle).assertTrue();
      expect(first.price === inputPrice).assertTrue();
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_CTOREDGE_0051
     * @tc.name testProductCtorEdge0051
     * @tc.desc Last catalog id 5 keeps resource-backed fields after an unrelated construction
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testProductCtorEdge0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const inputImageRes: ResourceStr = $r('app.media.embed_product005');
      const inputTitle: ResourceStr = $r('app.string.embed_product_title005');
      const inputPrice: ResourceStr = $r('app.string.embed_product_price005');
      const first: ProductDataModel = new ProductDataModel(
        5,
        inputImageRes,
        inputTitle,
        inputPrice
      );
      expect(first.id).assertEqual(5);
      expect((first.imageRes as Resource).id).assertEqual($r('app.media.embed_product005').id);
      expect((first.title as Resource).id).assertEqual($r('app.string.embed_product_title005').id);
      expect((first.price as Resource).id).assertEqual($r('app.string.embed_product_price005').id);
      const later: ProductDataModel = new ProductDataModel(
        0,
        $r('app.media.embed_product000'),
        $r('app.string.embed_product_title000'),
        $r('app.string.embed_product_price000')
      );
      expect(later.id).assertEqual(0);
      expect((later.imageRes as Resource).id).assertEqual($r('app.media.embed_product000').id);
      expect((later.title as Resource).id).assertEqual($r('app.string.embed_product_title000').id);
      expect((later.price as Resource).id).assertEqual($r('app.string.embed_product_price000').id);
      expect(first.id).assertEqual(5);
      expect((first.imageRes as Resource).id).assertEqual($r('app.media.embed_product005').id);
      expect((first.title as Resource).id).assertEqual($r('app.string.embed_product_title005').id);
      expect((first.price as Resource).id).assertEqual($r('app.string.embed_product_price005').id);
      expect(first.imageRes === inputImageRes).assertTrue();
      expect(first.title === inputTitle).assertTrue();
      expect(first.price === inputPrice).assertTrue();
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_CTOREDGE_0052
     * @tc.name testProductCtorEdge0052
     * @tc.desc Next external id 6 keeps an independently supplied product presentation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testProductCtorEdge0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const inputImageRes: ResourceStr = $r('app.media.embed_product000');
      const inputTitle: ResourceStr = 'Power bank 20000 mAh - graphite';
      const inputPrice: ResourceStr = $r('app.string.embed_product_price000');
      const first: ProductDataModel = new ProductDataModel(
        6,
        inputImageRes,
        inputTitle,
        inputPrice
      );
      expect(first.id).assertEqual(6);
      expect((first.imageRes as Resource).id).assertEqual($r('app.media.embed_product000').id);
      expect(first.title).assertEqual('Power bank 20000 mAh - graphite');
      expect((first.price as Resource).id).assertEqual($r('app.string.embed_product_price000').id);
      const later: ProductDataModel = new ProductDataModel(
        5,
        $r('app.media.embed_product005'),
        $r('app.string.embed_product_title005'),
        $r('app.string.embed_product_price005')
      );
      expect(later.id).assertEqual(5);
      expect((later.imageRes as Resource).id).assertEqual($r('app.media.embed_product005').id);
      expect((later.title as Resource).id).assertEqual($r('app.string.embed_product_title005').id);
      expect((later.price as Resource).id).assertEqual($r('app.string.embed_product_price005').id);
      expect(first.id).assertEqual(6);
      expect((first.imageRes as Resource).id).assertEqual($r('app.media.embed_product000').id);
      expect(first.title).assertEqual('Power bank 20000 mAh - graphite');
      expect((first.price as Resource).id).assertEqual($r('app.string.embed_product_price000').id);
      expect(first.imageRes === inputImageRes).assertTrue();
      expect(first.price === inputPrice).assertTrue();
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_CTOREDGE_0053
     * @tc.name testProductCtorEdge0053
     * @tc.desc Fractional imported id 0.5 is retained rather than rounded into the catalog
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testProductCtorEdge0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const inputImageRes: ResourceStr = 'https://store.example/phone/front.webp';
      const inputTitle: ResourceStr = 'Phone 256 GB - midnight';
      const inputPrice: ResourceStr = 'USD 699.00';
      const first: ProductDataModel = new ProductDataModel(
        0.5,
        inputImageRes,
        inputTitle,
        inputPrice
      );
      expect(first.id).assertEqual(0.5);
      expect(first.imageRes).assertEqual('https://store.example/phone/front.webp');
      expect(first.title).assertEqual('Phone 256 GB - midnight');
      expect(first.price).assertEqual('USD 699.00');
      const later: ProductDataModel = new ProductDataModel(
        5,
        $r('app.media.embed_product005'),
        $r('app.string.embed_product_title005'),
        $r('app.string.embed_product_price005')
      );
      expect(later.id).assertEqual(5);
      expect((later.imageRes as Resource).id).assertEqual($r('app.media.embed_product005').id);
      expect((later.title as Resource).id).assertEqual($r('app.string.embed_product_title005').id);
      expect((later.price as Resource).id).assertEqual($r('app.string.embed_product_price005').id);
      expect(first.id).assertEqual(0.5);
      expect(first.imageRes).assertEqual('https://store.example/phone/front.webp');
      expect(first.title).assertEqual('Phone 256 GB - midnight');
      expect(first.price).assertEqual('USD 699.00');
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_CTOREDGE_0054
     * @tc.name testProductCtorEdge0054
     * @tc.desc Negative fractional id -0.5 keeps the supplied preorder presentation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testProductCtorEdge0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const inputImageRes: ResourceStr = $r('app.media.embed_product002');
      const inputTitle: ResourceStr = $r('app.string.embed_product_title002');
      const inputPrice: ResourceStr = 'USD 699.00';
      const first: ProductDataModel = new ProductDataModel(
        -0.5,
        inputImageRes,
        inputTitle,
        inputPrice
      );
      expect(first.id).assertEqual(-0.5);
      expect((first.imageRes as Resource).id).assertEqual($r('app.media.embed_product002').id);
      expect((first.title as Resource).id).assertEqual($r('app.string.embed_product_title002').id);
      expect(first.price).assertEqual('USD 699.00');
      const later: ProductDataModel = new ProductDataModel(
        5,
        $r('app.media.embed_product005'),
        $r('app.string.embed_product_title005'),
        $r('app.string.embed_product_price005')
      );
      expect(later.id).assertEqual(5);
      expect((later.imageRes as Resource).id).assertEqual($r('app.media.embed_product005').id);
      expect((later.title as Resource).id).assertEqual($r('app.string.embed_product_title005').id);
      expect((later.price as Resource).id).assertEqual($r('app.string.embed_product_price005').id);
      expect(first.id).assertEqual(-0.5);
      expect((first.imageRes as Resource).id).assertEqual($r('app.media.embed_product002').id);
      expect((first.title as Resource).id).assertEqual($r('app.string.embed_product_title002').id);
      expect(first.price).assertEqual('USD 699.00');
      expect(first.imageRes === inputImageRes).assertTrue();
      expect(first.title === inputTitle).assertTrue();
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_CTOREDGE_0055
     * @tc.name testProductCtorEdge0055
     * @tc.desc Maximum safe external id retains notebook fields without index lookup
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testProductCtorEdge0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const inputImageRes: ResourceStr = $r('app.media.embed_product001');
      const inputTitle: ResourceStr = 'Notebook 16 GB / 512 GB - refurbished';
      const inputPrice: ResourceStr = $r('app.string.embed_product_price001');
      const first: ProductDataModel = new ProductDataModel(
        Number.MAX_SAFE_INTEGER,
        inputImageRes,
        inputTitle,
        inputPrice
      );
      expect(first.id).assertEqual(Number.MAX_SAFE_INTEGER);
      expect((first.imageRes as Resource).id).assertEqual($r('app.media.embed_product001').id);
      expect(first.title).assertEqual('Notebook 16 GB / 512 GB - refurbished');
      expect((first.price as Resource).id).assertEqual($r('app.string.embed_product_price001').id);
      const later: ProductDataModel = new ProductDataModel(
        5,
        $r('app.media.embed_product005'),
        $r('app.string.embed_product_title005'),
        $r('app.string.embed_product_price005')
      );
      expect(later.id).assertEqual(5);
      expect((later.imageRes as Resource).id).assertEqual($r('app.media.embed_product005').id);
      expect((later.title as Resource).id).assertEqual($r('app.string.embed_product_title005').id);
      expect((later.price as Resource).id).assertEqual($r('app.string.embed_product_price005').id);
      expect(first.id).assertEqual(Number.MAX_SAFE_INTEGER);
      expect((first.imageRes as Resource).id).assertEqual($r('app.media.embed_product001').id);
      expect(first.title).assertEqual('Notebook 16 GB / 512 GB - refurbished');
      expect((first.price as Resource).id).assertEqual($r('app.string.embed_product_price001').id);
      expect(first.imageRes === inputImageRes).assertTrue();
      expect(first.price === inputPrice).assertTrue();
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_CTOREDGE_0056
     * @tc.name testProductCtorEdge0056
     * @tc.desc Minimum safe external id retains outlet fields without index lookup
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testProductCtorEdge0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const inputImageRes: ResourceStr = 'file://cache/notebook/front.webp';
      const inputTitle: ResourceStr = $r('app.string.embed_product_title001');
      const inputPrice: ResourceStr = 'EUR 1 299,00';
      const first: ProductDataModel = new ProductDataModel(
        Number.MIN_SAFE_INTEGER,
        inputImageRes,
        inputTitle,
        inputPrice
      );
      expect(first.id).assertEqual(Number.MIN_SAFE_INTEGER);
      expect(first.imageRes).assertEqual('file://cache/notebook/front.webp');
      expect((first.title as Resource).id).assertEqual($r('app.string.embed_product_title001').id);
      expect(first.price).assertEqual('EUR 1 299,00');
      const later: ProductDataModel = new ProductDataModel(
        5,
        $r('app.media.embed_product005'),
        $r('app.string.embed_product_title005'),
        $r('app.string.embed_product_price005')
      );
      expect(later.id).assertEqual(5);
      expect((later.imageRes as Resource).id).assertEqual($r('app.media.embed_product005').id);
      expect((later.title as Resource).id).assertEqual($r('app.string.embed_product_title005').id);
      expect((later.price as Resource).id).assertEqual($r('app.string.embed_product_price005').id);
      expect(first.id).assertEqual(Number.MIN_SAFE_INTEGER);
      expect(first.imageRes).assertEqual('file://cache/notebook/front.webp');
      expect((first.title as Resource).id).assertEqual($r('app.string.embed_product_title001').id);
      expect(first.price).assertEqual('EUR 1 299,00');
      expect(first.title === inputTitle).assertTrue();
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_CTOREDGE_0057
     * @tc.name testProductCtorEdge0057
     * @tc.desc Unparsed imported id NaN is stored without replacing the warranty presentation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testProductCtorEdge0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const inputImageRes: ResourceStr = $r('app.media.embed_product004');
      const inputTitle: ResourceStr = 'Wireless headset - replacement unit';
      const inputPrice: ResourceStr = 'USD 0.00 warranty';
      const first: ProductDataModel = new ProductDataModel(
        Number.NaN,
        inputImageRes,
        inputTitle,
        inputPrice
      );
      expect(Number.isNaN(first.id)).assertTrue();
      expect((first.imageRes as Resource).id).assertEqual($r('app.media.embed_product004').id);
      expect(first.title).assertEqual('Wireless headset - replacement unit');
      expect(first.price).assertEqual('USD 0.00 warranty');
      const later: ProductDataModel = new ProductDataModel(
        5,
        $r('app.media.embed_product005'),
        $r('app.string.embed_product_title005'),
        $r('app.string.embed_product_price005')
      );
      expect(later.id).assertEqual(5);
      expect((later.imageRes as Resource).id).assertEqual($r('app.media.embed_product005').id);
      expect((later.title as Resource).id).assertEqual($r('app.string.embed_product_title005').id);
      expect((later.price as Resource).id).assertEqual($r('app.string.embed_product_price005').id);
      expect(Number.isNaN(first.id)).assertTrue();
      expect((first.imageRes as Resource).id).assertEqual($r('app.media.embed_product004').id);
      expect(first.title).assertEqual('Wireless headset - replacement unit');
      expect(first.price).assertEqual('USD 0.00 warranty');
      expect(first.imageRes === inputImageRes).assertTrue();
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_CTOREDGE_0058
     * @tc.name testProductCtorEdge0058
     * @tc.desc Positive infinite upstream id stays unvalidated with charger presentation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testProductCtorEdge0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const inputImageRes: ResourceStr = 'file://cache/charger/front.webp';
      const inputTitle: ResourceStr = $r('app.string.embed_product_title003');
      const inputPrice: ResourceStr = $r('app.string.embed_product_price003');
      const first: ProductDataModel = new ProductDataModel(
        Number.POSITIVE_INFINITY,
        inputImageRes,
        inputTitle,
        inputPrice
      );
      expect(first.id).assertEqual(Number.POSITIVE_INFINITY);
      expect(first.imageRes).assertEqual('file://cache/charger/front.webp');
      expect((first.title as Resource).id).assertEqual($r('app.string.embed_product_title003').id);
      expect((first.price as Resource).id).assertEqual($r('app.string.embed_product_price003').id);
      const later: ProductDataModel = new ProductDataModel(
        5,
        $r('app.media.embed_product005'),
        $r('app.string.embed_product_title005'),
        $r('app.string.embed_product_price005')
      );
      expect(later.id).assertEqual(5);
      expect((later.imageRes as Resource).id).assertEqual($r('app.media.embed_product005').id);
      expect((later.title as Resource).id).assertEqual($r('app.string.embed_product_title005').id);
      expect((later.price as Resource).id).assertEqual($r('app.string.embed_product_price005').id);
      expect(first.id).assertEqual(Number.POSITIVE_INFINITY);
      expect(first.imageRes).assertEqual('file://cache/charger/front.webp');
      expect((first.title as Resource).id).assertEqual($r('app.string.embed_product_title003').id);
      expect((first.price as Resource).id).assertEqual($r('app.string.embed_product_price003').id);
      expect(first.title === inputTitle).assertTrue();
      expect(first.price === inputPrice).assertTrue();
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_CTOREDGE_0059
     * @tc.name testProductCtorEdge0059
     * @tc.desc Negative infinite upstream id stays unvalidated with charger presentation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testProductCtorEdge0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const inputImageRes: ResourceStr = $r('app.media.embed_product003');
      const inputTitle: ResourceStr = 'USB-C charger 65 W - two ports';
      const inputPrice: ResourceStr = 'USD 0.00';
      const first: ProductDataModel = new ProductDataModel(
        Number.NEGATIVE_INFINITY,
        inputImageRes,
        inputTitle,
        inputPrice
      );
      expect(first.id).assertEqual(Number.NEGATIVE_INFINITY);
      expect((first.imageRes as Resource).id).assertEqual($r('app.media.embed_product003').id);
      expect(first.title).assertEqual('USB-C charger 65 W - two ports');
      expect(first.price).assertEqual('USD 0.00');
      const later: ProductDataModel = new ProductDataModel(
        5,
        $r('app.media.embed_product005'),
        $r('app.string.embed_product_title005'),
        $r('app.string.embed_product_price005')
      );
      expect(later.id).assertEqual(5);
      expect((later.imageRes as Resource).id).assertEqual($r('app.media.embed_product005').id);
      expect((later.title as Resource).id).assertEqual($r('app.string.embed_product_title005').id);
      expect((later.price as Resource).id).assertEqual($r('app.string.embed_product_price005').id);
      expect(first.id).assertEqual(Number.NEGATIVE_INFINITY);
      expect((first.imageRes as Resource).id).assertEqual($r('app.media.embed_product003').id);
      expect(first.title).assertEqual('USB-C charger 65 W - two ports');
      expect(first.price).assertEqual('USD 0.00');
      expect(first.imageRes === inputImageRes).assertTrue();
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_CTOREDGE_0060
     * @tc.name testProductCtorEdge0060
     * @tc.desc Signed zero imported id retains its sign and preserves whitespace display text
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testProductCtorEdge0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const inputImageRes: ResourceStr = '';
      const inputTitle: ResourceStr = '  Power bank preorder  ';
      const inputPrice: ResourceStr = $r('app.string.embed_product_price000');
      const first: ProductDataModel = new ProductDataModel(
        -0,
        inputImageRes,
        inputTitle,
        inputPrice
      );
      expect(1 / first.id === Number.NEGATIVE_INFINITY).assertTrue();
      expect(first.imageRes).assertEqual('');
      expect(first.title).assertEqual('  Power bank preorder  ');
      expect((first.price as Resource).id).assertEqual($r('app.string.embed_product_price000').id);
      const later: ProductDataModel = new ProductDataModel(
        5,
        $r('app.media.embed_product005'),
        $r('app.string.embed_product_title005'),
        $r('app.string.embed_product_price005')
      );
      expect(later.id).assertEqual(5);
      expect((later.imageRes as Resource).id).assertEqual($r('app.media.embed_product005').id);
      expect((later.title as Resource).id).assertEqual($r('app.string.embed_product_title005').id);
      expect((later.price as Resource).id).assertEqual($r('app.string.embed_product_price005').id);
      expect(1 / first.id === Number.NEGATIVE_INFINITY).assertTrue();
      expect(first.imageRes).assertEqual('');
      expect(first.title).assertEqual('  Power bank preorder  ');
      expect((first.price as Resource).id).assertEqual($r('app.string.embed_product_price000').id);
      expect(first.price === inputPrice).assertTrue();
    });
  });
}
