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

export default function productCtorEdge01Test(): void {
  describe('productCtorEdge01Test', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_CTOREDGE_0001
     * @tc.name testProductCtorEdge0001
     * @tc.desc Power bank LLL fields survive constructing the next product with inverse representations
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testProductCtorEdge0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const inputImageRes: ResourceStr = 'https://store.example/power-bank/front.webp';
      const inputTitle: ResourceStr = 'Power bank 20000 mAh - graphite';
      const inputPrice: ResourceStr = 'USD 29.90';
      const first: ProductDataModel = new ProductDataModel(
        0,
        inputImageRes,
        inputTitle,
        inputPrice
      );
      expect(first.id).assertEqual(0);
      expect(first.imageRes).assertEqual('https://store.example/power-bank/front.webp');
      expect(first.title).assertEqual('Power bank 20000 mAh - graphite');
      expect(first.price).assertEqual('USD 29.90');
      const later: ProductDataModel = new ProductDataModel(
        1,
        $r('app.media.embed_product001'),
        $r('app.string.embed_product_title001'),
        $r('app.string.embed_product_price001')
      );
      expect(later.id).assertEqual(1);
      expect((later.imageRes as Resource).id).assertEqual($r('app.media.embed_product001').id);
      expect((later.title as Resource).id).assertEqual($r('app.string.embed_product_title001').id);
      expect((later.price as Resource).id).assertEqual($r('app.string.embed_product_price001').id);
      expect(first.id).assertEqual(0);
      expect(first.imageRes).assertEqual('https://store.example/power-bank/front.webp');
      expect(first.title).assertEqual('Power bank 20000 mAh - graphite');
      expect(first.price).assertEqual('USD 29.90');
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_CTOREDGE_0002
     * @tc.name testProductCtorEdge0002
     * @tc.desc Power bank RLL fields survive constructing the next product with inverse representations
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testProductCtorEdge0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const inputImageRes: ResourceStr = $r('app.media.embed_product000');
      const inputTitle: ResourceStr = 'Power bank 20000 mAh - graphite';
      const inputPrice: ResourceStr = 'USD 29.90';
      const first: ProductDataModel = new ProductDataModel(
        0,
        inputImageRes,
        inputTitle,
        inputPrice
      );
      expect(first.id).assertEqual(0);
      expect((first.imageRes as Resource).id).assertEqual($r('app.media.embed_product000').id);
      expect(first.title).assertEqual('Power bank 20000 mAh - graphite');
      expect(first.price).assertEqual('USD 29.90');
      const later: ProductDataModel = new ProductDataModel(
        1,
        'file://cache/notebook/front.webp',
        $r('app.string.embed_product_title001'),
        $r('app.string.embed_product_price001')
      );
      expect(later.id).assertEqual(1);
      expect(later.imageRes).assertEqual('file://cache/notebook/front.webp');
      expect((later.title as Resource).id).assertEqual($r('app.string.embed_product_title001').id);
      expect((later.price as Resource).id).assertEqual($r('app.string.embed_product_price001').id);
      expect(first.id).assertEqual(0);
      expect((first.imageRes as Resource).id).assertEqual($r('app.media.embed_product000').id);
      expect(first.title).assertEqual('Power bank 20000 mAh - graphite');
      expect(first.price).assertEqual('USD 29.90');
      expect(first.imageRes === inputImageRes).assertTrue();
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_CTOREDGE_0003
     * @tc.name testProductCtorEdge0003
     * @tc.desc Power bank LRL fields survive constructing the next product with inverse representations
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testProductCtorEdge0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const inputImageRes: ResourceStr = 'https://store.example/power-bank/front.webp';
      const inputTitle: ResourceStr = $r('app.string.embed_product_title000');
      const inputPrice: ResourceStr = 'USD 29.90';
      const first: ProductDataModel = new ProductDataModel(
        0,
        inputImageRes,
        inputTitle,
        inputPrice
      );
      expect(first.id).assertEqual(0);
      expect(first.imageRes).assertEqual('https://store.example/power-bank/front.webp');
      expect((first.title as Resource).id).assertEqual($r('app.string.embed_product_title000').id);
      expect(first.price).assertEqual('USD 29.90');
      const later: ProductDataModel = new ProductDataModel(
        1,
        $r('app.media.embed_product001'),
        'Notebook 16 GB / 512 GB - refurbished',
        $r('app.string.embed_product_price001')
      );
      expect(later.id).assertEqual(1);
      expect((later.imageRes as Resource).id).assertEqual($r('app.media.embed_product001').id);
      expect(later.title).assertEqual('Notebook 16 GB / 512 GB - refurbished');
      expect((later.price as Resource).id).assertEqual($r('app.string.embed_product_price001').id);
      expect(first.id).assertEqual(0);
      expect(first.imageRes).assertEqual('https://store.example/power-bank/front.webp');
      expect((first.title as Resource).id).assertEqual($r('app.string.embed_product_title000').id);
      expect(first.price).assertEqual('USD 29.90');
      expect(first.title === inputTitle).assertTrue();
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_CTOREDGE_0004
     * @tc.name testProductCtorEdge0004
     * @tc.desc Power bank RRL fields survive constructing the next product with inverse representations
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testProductCtorEdge0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const inputImageRes: ResourceStr = $r('app.media.embed_product000');
      const inputTitle: ResourceStr = $r('app.string.embed_product_title000');
      const inputPrice: ResourceStr = 'USD 29.90';
      const first: ProductDataModel = new ProductDataModel(
        0,
        inputImageRes,
        inputTitle,
        inputPrice
      );
      expect(first.id).assertEqual(0);
      expect((first.imageRes as Resource).id).assertEqual($r('app.media.embed_product000').id);
      expect((first.title as Resource).id).assertEqual($r('app.string.embed_product_title000').id);
      expect(first.price).assertEqual('USD 29.90');
      const later: ProductDataModel = new ProductDataModel(
        1,
        'file://cache/notebook/front.webp',
        'Notebook 16 GB / 512 GB - refurbished',
        $r('app.string.embed_product_price001')
      );
      expect(later.id).assertEqual(1);
      expect(later.imageRes).assertEqual('file://cache/notebook/front.webp');
      expect(later.title).assertEqual('Notebook 16 GB / 512 GB - refurbished');
      expect((later.price as Resource).id).assertEqual($r('app.string.embed_product_price001').id);
      expect(first.id).assertEqual(0);
      expect((first.imageRes as Resource).id).assertEqual($r('app.media.embed_product000').id);
      expect((first.title as Resource).id).assertEqual($r('app.string.embed_product_title000').id);
      expect(first.price).assertEqual('USD 29.90');
      expect(first.imageRes === inputImageRes).assertTrue();
      expect(first.title === inputTitle).assertTrue();
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_CTOREDGE_0005
     * @tc.name testProductCtorEdge0005
     * @tc.desc Power bank LLR fields survive constructing the next product with inverse representations
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testProductCtorEdge0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const inputImageRes: ResourceStr = 'https://store.example/power-bank/front.webp';
      const inputTitle: ResourceStr = 'Power bank 20000 mAh - graphite';
      const inputPrice: ResourceStr = $r('app.string.embed_product_price000');
      const first: ProductDataModel = new ProductDataModel(
        0,
        inputImageRes,
        inputTitle,
        inputPrice
      );
      expect(first.id).assertEqual(0);
      expect(first.imageRes).assertEqual('https://store.example/power-bank/front.webp');
      expect(first.title).assertEqual('Power bank 20000 mAh - graphite');
      expect((first.price as Resource).id).assertEqual($r('app.string.embed_product_price000').id);
      const later: ProductDataModel = new ProductDataModel(
        1,
        $r('app.media.embed_product001'),
        $r('app.string.embed_product_title001'),
        'EUR 1 299,00'
      );
      expect(later.id).assertEqual(1);
      expect((later.imageRes as Resource).id).assertEqual($r('app.media.embed_product001').id);
      expect((later.title as Resource).id).assertEqual($r('app.string.embed_product_title001').id);
      expect(later.price).assertEqual('EUR 1 299,00');
      expect(first.id).assertEqual(0);
      expect(first.imageRes).assertEqual('https://store.example/power-bank/front.webp');
      expect(first.title).assertEqual('Power bank 20000 mAh - graphite');
      expect((first.price as Resource).id).assertEqual($r('app.string.embed_product_price000').id);
      expect(first.price === inputPrice).assertTrue();
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_CTOREDGE_0006
     * @tc.name testProductCtorEdge0006
     * @tc.desc Power bank RLR fields survive constructing the next product with inverse representations
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testProductCtorEdge0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const inputImageRes: ResourceStr = $r('app.media.embed_product000');
      const inputTitle: ResourceStr = 'Power bank 20000 mAh - graphite';
      const inputPrice: ResourceStr = $r('app.string.embed_product_price000');
      const first: ProductDataModel = new ProductDataModel(
        0,
        inputImageRes,
        inputTitle,
        inputPrice
      );
      expect(first.id).assertEqual(0);
      expect((first.imageRes as Resource).id).assertEqual($r('app.media.embed_product000').id);
      expect(first.title).assertEqual('Power bank 20000 mAh - graphite');
      expect((first.price as Resource).id).assertEqual($r('app.string.embed_product_price000').id);
      const later: ProductDataModel = new ProductDataModel(
        1,
        'file://cache/notebook/front.webp',
        $r('app.string.embed_product_title001'),
        'EUR 1 299,00'
      );
      expect(later.id).assertEqual(1);
      expect(later.imageRes).assertEqual('file://cache/notebook/front.webp');
      expect((later.title as Resource).id).assertEqual($r('app.string.embed_product_title001').id);
      expect(later.price).assertEqual('EUR 1 299,00');
      expect(first.id).assertEqual(0);
      expect((first.imageRes as Resource).id).assertEqual($r('app.media.embed_product000').id);
      expect(first.title).assertEqual('Power bank 20000 mAh - graphite');
      expect((first.price as Resource).id).assertEqual($r('app.string.embed_product_price000').id);
      expect(first.imageRes === inputImageRes).assertTrue();
      expect(first.price === inputPrice).assertTrue();
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_CTOREDGE_0007
     * @tc.name testProductCtorEdge0007
     * @tc.desc Power bank LRR fields survive constructing the next product with inverse representations
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testProductCtorEdge0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const inputImageRes: ResourceStr = 'https://store.example/power-bank/front.webp';
      const inputTitle: ResourceStr = $r('app.string.embed_product_title000');
      const inputPrice: ResourceStr = $r('app.string.embed_product_price000');
      const first: ProductDataModel = new ProductDataModel(
        0,
        inputImageRes,
        inputTitle,
        inputPrice
      );
      expect(first.id).assertEqual(0);
      expect(first.imageRes).assertEqual('https://store.example/power-bank/front.webp');
      expect((first.title as Resource).id).assertEqual($r('app.string.embed_product_title000').id);
      expect((first.price as Resource).id).assertEqual($r('app.string.embed_product_price000').id);
      const later: ProductDataModel = new ProductDataModel(
        1,
        $r('app.media.embed_product001'),
        'Notebook 16 GB / 512 GB - refurbished',
        'EUR 1 299,00'
      );
      expect(later.id).assertEqual(1);
      expect((later.imageRes as Resource).id).assertEqual($r('app.media.embed_product001').id);
      expect(later.title).assertEqual('Notebook 16 GB / 512 GB - refurbished');
      expect(later.price).assertEqual('EUR 1 299,00');
      expect(first.id).assertEqual(0);
      expect(first.imageRes).assertEqual('https://store.example/power-bank/front.webp');
      expect((first.title as Resource).id).assertEqual($r('app.string.embed_product_title000').id);
      expect((first.price as Resource).id).assertEqual($r('app.string.embed_product_price000').id);
      expect(first.title === inputTitle).assertTrue();
      expect(first.price === inputPrice).assertTrue();
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_CTOREDGE_0008
     * @tc.name testProductCtorEdge0008
     * @tc.desc Power bank RRR fields survive constructing the next product with inverse representations
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testProductCtorEdge0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
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
        1,
        'file://cache/notebook/front.webp',
        'Notebook 16 GB / 512 GB - refurbished',
        'EUR 1 299,00'
      );
      expect(later.id).assertEqual(1);
      expect(later.imageRes).assertEqual('file://cache/notebook/front.webp');
      expect(later.title).assertEqual('Notebook 16 GB / 512 GB - refurbished');
      expect(later.price).assertEqual('EUR 1 299,00');
      expect(first.id).assertEqual(0);
      expect((first.imageRes as Resource).id).assertEqual($r('app.media.embed_product000').id);
      expect((first.title as Resource).id).assertEqual($r('app.string.embed_product_title000').id);
      expect((first.price as Resource).id).assertEqual($r('app.string.embed_product_price000').id);
      expect(first.imageRes === inputImageRes).assertTrue();
      expect(first.title === inputTitle).assertTrue();
      expect(first.price === inputPrice).assertTrue();
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_CTOREDGE_0009
     * @tc.name testProductCtorEdge0009
     * @tc.desc Notebook LLL fields survive constructing the next product with inverse representations
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testProductCtorEdge0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const inputImageRes: ResourceStr = 'file://cache/notebook/front.webp';
      const inputTitle: ResourceStr = 'Notebook 16 GB / 512 GB - refurbished';
      const inputPrice: ResourceStr = 'EUR 1 299,00';
      const first: ProductDataModel = new ProductDataModel(
        1,
        inputImageRes,
        inputTitle,
        inputPrice
      );
      expect(first.id).assertEqual(1);
      expect(first.imageRes).assertEqual('file://cache/notebook/front.webp');
      expect(first.title).assertEqual('Notebook 16 GB / 512 GB - refurbished');
      expect(first.price).assertEqual('EUR 1 299,00');
      const later: ProductDataModel = new ProductDataModel(
        2,
        $r('app.media.embed_product002'),
        $r('app.string.embed_product_title002'),
        $r('app.string.embed_product_price002')
      );
      expect(later.id).assertEqual(2);
      expect((later.imageRes as Resource).id).assertEqual($r('app.media.embed_product002').id);
      expect((later.title as Resource).id).assertEqual($r('app.string.embed_product_title002').id);
      expect((later.price as Resource).id).assertEqual($r('app.string.embed_product_price002').id);
      expect(first.id).assertEqual(1);
      expect(first.imageRes).assertEqual('file://cache/notebook/front.webp');
      expect(first.title).assertEqual('Notebook 16 GB / 512 GB - refurbished');
      expect(first.price).assertEqual('EUR 1 299,00');
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_CTOREDGE_0010
     * @tc.name testProductCtorEdge0010
     * @tc.desc Notebook RLL fields survive constructing the next product with inverse representations
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testProductCtorEdge0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const inputImageRes: ResourceStr = $r('app.media.embed_product001');
      const inputTitle: ResourceStr = 'Notebook 16 GB / 512 GB - refurbished';
      const inputPrice: ResourceStr = 'EUR 1 299,00';
      const first: ProductDataModel = new ProductDataModel(
        1,
        inputImageRes,
        inputTitle,
        inputPrice
      );
      expect(first.id).assertEqual(1);
      expect((first.imageRes as Resource).id).assertEqual($r('app.media.embed_product001').id);
      expect(first.title).assertEqual('Notebook 16 GB / 512 GB - refurbished');
      expect(first.price).assertEqual('EUR 1 299,00');
      const later: ProductDataModel = new ProductDataModel(
        2,
        'https://store.example/phone/front.webp',
        $r('app.string.embed_product_title002'),
        $r('app.string.embed_product_price002')
      );
      expect(later.id).assertEqual(2);
      expect(later.imageRes).assertEqual('https://store.example/phone/front.webp');
      expect((later.title as Resource).id).assertEqual($r('app.string.embed_product_title002').id);
      expect((later.price as Resource).id).assertEqual($r('app.string.embed_product_price002').id);
      expect(first.id).assertEqual(1);
      expect((first.imageRes as Resource).id).assertEqual($r('app.media.embed_product001').id);
      expect(first.title).assertEqual('Notebook 16 GB / 512 GB - refurbished');
      expect(first.price).assertEqual('EUR 1 299,00');
      expect(first.imageRes === inputImageRes).assertTrue();
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_CTOREDGE_0011
     * @tc.name testProductCtorEdge0011
     * @tc.desc Notebook LRL fields survive constructing the next product with inverse representations
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testProductCtorEdge0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const inputImageRes: ResourceStr = 'file://cache/notebook/front.webp';
      const inputTitle: ResourceStr = $r('app.string.embed_product_title001');
      const inputPrice: ResourceStr = 'EUR 1 299,00';
      const first: ProductDataModel = new ProductDataModel(
        1,
        inputImageRes,
        inputTitle,
        inputPrice
      );
      expect(first.id).assertEqual(1);
      expect(first.imageRes).assertEqual('file://cache/notebook/front.webp');
      expect((first.title as Resource).id).assertEqual($r('app.string.embed_product_title001').id);
      expect(first.price).assertEqual('EUR 1 299,00');
      const later: ProductDataModel = new ProductDataModel(
        2,
        $r('app.media.embed_product002'),
        'Phone 256 GB - midnight',
        $r('app.string.embed_product_price002')
      );
      expect(later.id).assertEqual(2);
      expect((later.imageRes as Resource).id).assertEqual($r('app.media.embed_product002').id);
      expect(later.title).assertEqual('Phone 256 GB - midnight');
      expect((later.price as Resource).id).assertEqual($r('app.string.embed_product_price002').id);
      expect(first.id).assertEqual(1);
      expect(first.imageRes).assertEqual('file://cache/notebook/front.webp');
      expect((first.title as Resource).id).assertEqual($r('app.string.embed_product_title001').id);
      expect(first.price).assertEqual('EUR 1 299,00');
      expect(first.title === inputTitle).assertTrue();
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_CTOREDGE_0012
     * @tc.name testProductCtorEdge0012
     * @tc.desc Notebook RRL fields survive constructing the next product with inverse representations
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testProductCtorEdge0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const inputImageRes: ResourceStr = $r('app.media.embed_product001');
      const inputTitle: ResourceStr = $r('app.string.embed_product_title001');
      const inputPrice: ResourceStr = 'EUR 1 299,00';
      const first: ProductDataModel = new ProductDataModel(
        1,
        inputImageRes,
        inputTitle,
        inputPrice
      );
      expect(first.id).assertEqual(1);
      expect((first.imageRes as Resource).id).assertEqual($r('app.media.embed_product001').id);
      expect((first.title as Resource).id).assertEqual($r('app.string.embed_product_title001').id);
      expect(first.price).assertEqual('EUR 1 299,00');
      const later: ProductDataModel = new ProductDataModel(
        2,
        'https://store.example/phone/front.webp',
        'Phone 256 GB - midnight',
        $r('app.string.embed_product_price002')
      );
      expect(later.id).assertEqual(2);
      expect(later.imageRes).assertEqual('https://store.example/phone/front.webp');
      expect(later.title).assertEqual('Phone 256 GB - midnight');
      expect((later.price as Resource).id).assertEqual($r('app.string.embed_product_price002').id);
      expect(first.id).assertEqual(1);
      expect((first.imageRes as Resource).id).assertEqual($r('app.media.embed_product001').id);
      expect((first.title as Resource).id).assertEqual($r('app.string.embed_product_title001').id);
      expect(first.price).assertEqual('EUR 1 299,00');
      expect(first.imageRes === inputImageRes).assertTrue();
      expect(first.title === inputTitle).assertTrue();
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_CTOREDGE_0013
     * @tc.name testProductCtorEdge0013
     * @tc.desc Notebook LLR fields survive constructing the next product with inverse representations
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testProductCtorEdge0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const inputImageRes: ResourceStr = 'file://cache/notebook/front.webp';
      const inputTitle: ResourceStr = 'Notebook 16 GB / 512 GB - refurbished';
      const inputPrice: ResourceStr = $r('app.string.embed_product_price001');
      const first: ProductDataModel = new ProductDataModel(
        1,
        inputImageRes,
        inputTitle,
        inputPrice
      );
      expect(first.id).assertEqual(1);
      expect(first.imageRes).assertEqual('file://cache/notebook/front.webp');
      expect(first.title).assertEqual('Notebook 16 GB / 512 GB - refurbished');
      expect((first.price as Resource).id).assertEqual($r('app.string.embed_product_price001').id);
      const later: ProductDataModel = new ProductDataModel(
        2,
        $r('app.media.embed_product002'),
        $r('app.string.embed_product_title002'),
        'USD 699.00'
      );
      expect(later.id).assertEqual(2);
      expect((later.imageRes as Resource).id).assertEqual($r('app.media.embed_product002').id);
      expect((later.title as Resource).id).assertEqual($r('app.string.embed_product_title002').id);
      expect(later.price).assertEqual('USD 699.00');
      expect(first.id).assertEqual(1);
      expect(first.imageRes).assertEqual('file://cache/notebook/front.webp');
      expect(first.title).assertEqual('Notebook 16 GB / 512 GB - refurbished');
      expect((first.price as Resource).id).assertEqual($r('app.string.embed_product_price001').id);
      expect(first.price === inputPrice).assertTrue();
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_CTOREDGE_0014
     * @tc.name testProductCtorEdge0014
     * @tc.desc Notebook RLR fields survive constructing the next product with inverse representations
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testProductCtorEdge0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const inputImageRes: ResourceStr = $r('app.media.embed_product001');
      const inputTitle: ResourceStr = 'Notebook 16 GB / 512 GB - refurbished';
      const inputPrice: ResourceStr = $r('app.string.embed_product_price001');
      const first: ProductDataModel = new ProductDataModel(
        1,
        inputImageRes,
        inputTitle,
        inputPrice
      );
      expect(first.id).assertEqual(1);
      expect((first.imageRes as Resource).id).assertEqual($r('app.media.embed_product001').id);
      expect(first.title).assertEqual('Notebook 16 GB / 512 GB - refurbished');
      expect((first.price as Resource).id).assertEqual($r('app.string.embed_product_price001').id);
      const later: ProductDataModel = new ProductDataModel(
        2,
        'https://store.example/phone/front.webp',
        $r('app.string.embed_product_title002'),
        'USD 699.00'
      );
      expect(later.id).assertEqual(2);
      expect(later.imageRes).assertEqual('https://store.example/phone/front.webp');
      expect((later.title as Resource).id).assertEqual($r('app.string.embed_product_title002').id);
      expect(later.price).assertEqual('USD 699.00');
      expect(first.id).assertEqual(1);
      expect((first.imageRes as Resource).id).assertEqual($r('app.media.embed_product001').id);
      expect(first.title).assertEqual('Notebook 16 GB / 512 GB - refurbished');
      expect((first.price as Resource).id).assertEqual($r('app.string.embed_product_price001').id);
      expect(first.imageRes === inputImageRes).assertTrue();
      expect(first.price === inputPrice).assertTrue();
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_CTOREDGE_0015
     * @tc.name testProductCtorEdge0015
     * @tc.desc Notebook LRR fields survive constructing the next product with inverse representations
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testProductCtorEdge0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const inputImageRes: ResourceStr = 'file://cache/notebook/front.webp';
      const inputTitle: ResourceStr = $r('app.string.embed_product_title001');
      const inputPrice: ResourceStr = $r('app.string.embed_product_price001');
      const first: ProductDataModel = new ProductDataModel(
        1,
        inputImageRes,
        inputTitle,
        inputPrice
      );
      expect(first.id).assertEqual(1);
      expect(first.imageRes).assertEqual('file://cache/notebook/front.webp');
      expect((first.title as Resource).id).assertEqual($r('app.string.embed_product_title001').id);
      expect((first.price as Resource).id).assertEqual($r('app.string.embed_product_price001').id);
      const later: ProductDataModel = new ProductDataModel(
        2,
        $r('app.media.embed_product002'),
        'Phone 256 GB - midnight',
        'USD 699.00'
      );
      expect(later.id).assertEqual(2);
      expect((later.imageRes as Resource).id).assertEqual($r('app.media.embed_product002').id);
      expect(later.title).assertEqual('Phone 256 GB - midnight');
      expect(later.price).assertEqual('USD 699.00');
      expect(first.id).assertEqual(1);
      expect(first.imageRes).assertEqual('file://cache/notebook/front.webp');
      expect((first.title as Resource).id).assertEqual($r('app.string.embed_product_title001').id);
      expect((first.price as Resource).id).assertEqual($r('app.string.embed_product_price001').id);
      expect(first.title === inputTitle).assertTrue();
      expect(first.price === inputPrice).assertTrue();
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_CTOREDGE_0016
     * @tc.name testProductCtorEdge0016
     * @tc.desc Notebook RRR fields survive constructing the next product with inverse representations
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testProductCtorEdge0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const inputImageRes: ResourceStr = $r('app.media.embed_product001');
      const inputTitle: ResourceStr = $r('app.string.embed_product_title001');
      const inputPrice: ResourceStr = $r('app.string.embed_product_price001');
      const first: ProductDataModel = new ProductDataModel(
        1,
        inputImageRes,
        inputTitle,
        inputPrice
      );
      expect(first.id).assertEqual(1);
      expect((first.imageRes as Resource).id).assertEqual($r('app.media.embed_product001').id);
      expect((first.title as Resource).id).assertEqual($r('app.string.embed_product_title001').id);
      expect((first.price as Resource).id).assertEqual($r('app.string.embed_product_price001').id);
      const later: ProductDataModel = new ProductDataModel(
        2,
        'https://store.example/phone/front.webp',
        'Phone 256 GB - midnight',
        'USD 699.00'
      );
      expect(later.id).assertEqual(2);
      expect(later.imageRes).assertEqual('https://store.example/phone/front.webp');
      expect(later.title).assertEqual('Phone 256 GB - midnight');
      expect(later.price).assertEqual('USD 699.00');
      expect(first.id).assertEqual(1);
      expect((first.imageRes as Resource).id).assertEqual($r('app.media.embed_product001').id);
      expect((first.title as Resource).id).assertEqual($r('app.string.embed_product_title001').id);
      expect((first.price as Resource).id).assertEqual($r('app.string.embed_product_price001').id);
      expect(first.imageRes === inputImageRes).assertTrue();
      expect(first.title === inputTitle).assertTrue();
      expect(first.price === inputPrice).assertTrue();
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_CTOREDGE_0017
     * @tc.name testProductCtorEdge0017
     * @tc.desc Phone LLL fields survive constructing the next product with inverse representations
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testProductCtorEdge0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const inputImageRes: ResourceStr = 'https://store.example/phone/front.webp';
      const inputTitle: ResourceStr = 'Phone 256 GB - midnight';
      const inputPrice: ResourceStr = 'USD 699.00';
      const first: ProductDataModel = new ProductDataModel(
        2,
        inputImageRes,
        inputTitle,
        inputPrice
      );
      expect(first.id).assertEqual(2);
      expect(first.imageRes).assertEqual('https://store.example/phone/front.webp');
      expect(first.title).assertEqual('Phone 256 GB - midnight');
      expect(first.price).assertEqual('USD 699.00');
      const later: ProductDataModel = new ProductDataModel(
        3,
        $r('app.media.embed_product003'),
        $r('app.string.embed_product_title003'),
        $r('app.string.embed_product_price003')
      );
      expect(later.id).assertEqual(3);
      expect((later.imageRes as Resource).id).assertEqual($r('app.media.embed_product003').id);
      expect((later.title as Resource).id).assertEqual($r('app.string.embed_product_title003').id);
      expect((later.price as Resource).id).assertEqual($r('app.string.embed_product_price003').id);
      expect(first.id).assertEqual(2);
      expect(first.imageRes).assertEqual('https://store.example/phone/front.webp');
      expect(first.title).assertEqual('Phone 256 GB - midnight');
      expect(first.price).assertEqual('USD 699.00');
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_CTOREDGE_0018
     * @tc.name testProductCtorEdge0018
     * @tc.desc Phone RLL fields survive constructing the next product with inverse representations
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testProductCtorEdge0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const inputImageRes: ResourceStr = $r('app.media.embed_product002');
      const inputTitle: ResourceStr = 'Phone 256 GB - midnight';
      const inputPrice: ResourceStr = 'USD 699.00';
      const first: ProductDataModel = new ProductDataModel(
        2,
        inputImageRes,
        inputTitle,
        inputPrice
      );
      expect(first.id).assertEqual(2);
      expect((first.imageRes as Resource).id).assertEqual($r('app.media.embed_product002').id);
      expect(first.title).assertEqual('Phone 256 GB - midnight');
      expect(first.price).assertEqual('USD 699.00');
      const later: ProductDataModel = new ProductDataModel(
        3,
        'file://cache/charger/front.webp',
        $r('app.string.embed_product_title003'),
        $r('app.string.embed_product_price003')
      );
      expect(later.id).assertEqual(3);
      expect(later.imageRes).assertEqual('file://cache/charger/front.webp');
      expect((later.title as Resource).id).assertEqual($r('app.string.embed_product_title003').id);
      expect((later.price as Resource).id).assertEqual($r('app.string.embed_product_price003').id);
      expect(first.id).assertEqual(2);
      expect((first.imageRes as Resource).id).assertEqual($r('app.media.embed_product002').id);
      expect(first.title).assertEqual('Phone 256 GB - midnight');
      expect(first.price).assertEqual('USD 699.00');
      expect(first.imageRes === inputImageRes).assertTrue();
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_CTOREDGE_0019
     * @tc.name testProductCtorEdge0019
     * @tc.desc Phone LRL fields survive constructing the next product with inverse representations
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testProductCtorEdge0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const inputImageRes: ResourceStr = 'https://store.example/phone/front.webp';
      const inputTitle: ResourceStr = $r('app.string.embed_product_title002');
      const inputPrice: ResourceStr = 'USD 699.00';
      const first: ProductDataModel = new ProductDataModel(
        2,
        inputImageRes,
        inputTitle,
        inputPrice
      );
      expect(first.id).assertEqual(2);
      expect(first.imageRes).assertEqual('https://store.example/phone/front.webp');
      expect((first.title as Resource).id).assertEqual($r('app.string.embed_product_title002').id);
      expect(first.price).assertEqual('USD 699.00');
      const later: ProductDataModel = new ProductDataModel(
        3,
        $r('app.media.embed_product003'),
        'USB-C charger 65 W - two ports',
        $r('app.string.embed_product_price003')
      );
      expect(later.id).assertEqual(3);
      expect((later.imageRes as Resource).id).assertEqual($r('app.media.embed_product003').id);
      expect(later.title).assertEqual('USB-C charger 65 W - two ports');
      expect((later.price as Resource).id).assertEqual($r('app.string.embed_product_price003').id);
      expect(first.id).assertEqual(2);
      expect(first.imageRes).assertEqual('https://store.example/phone/front.webp');
      expect((first.title as Resource).id).assertEqual($r('app.string.embed_product_title002').id);
      expect(first.price).assertEqual('USD 699.00');
      expect(first.title === inputTitle).assertTrue();
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_CTOREDGE_0020
     * @tc.name testProductCtorEdge0020
     * @tc.desc Phone RRL fields survive constructing the next product with inverse representations
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testProductCtorEdge0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const inputImageRes: ResourceStr = $r('app.media.embed_product002');
      const inputTitle: ResourceStr = $r('app.string.embed_product_title002');
      const inputPrice: ResourceStr = 'USD 699.00';
      const first: ProductDataModel = new ProductDataModel(
        2,
        inputImageRes,
        inputTitle,
        inputPrice
      );
      expect(first.id).assertEqual(2);
      expect((first.imageRes as Resource).id).assertEqual($r('app.media.embed_product002').id);
      expect((first.title as Resource).id).assertEqual($r('app.string.embed_product_title002').id);
      expect(first.price).assertEqual('USD 699.00');
      const later: ProductDataModel = new ProductDataModel(
        3,
        'file://cache/charger/front.webp',
        'USB-C charger 65 W - two ports',
        $r('app.string.embed_product_price003')
      );
      expect(later.id).assertEqual(3);
      expect(later.imageRes).assertEqual('file://cache/charger/front.webp');
      expect(later.title).assertEqual('USB-C charger 65 W - two ports');
      expect((later.price as Resource).id).assertEqual($r('app.string.embed_product_price003').id);
      expect(first.id).assertEqual(2);
      expect((first.imageRes as Resource).id).assertEqual($r('app.media.embed_product002').id);
      expect((first.title as Resource).id).assertEqual($r('app.string.embed_product_title002').id);
      expect(first.price).assertEqual('USD 699.00');
      expect(first.imageRes === inputImageRes).assertTrue();
      expect(first.title === inputTitle).assertTrue();
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_CTOREDGE_0021
     * @tc.name testProductCtorEdge0021
     * @tc.desc Phone LLR fields survive constructing the next product with inverse representations
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testProductCtorEdge0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const inputImageRes: ResourceStr = 'https://store.example/phone/front.webp';
      const inputTitle: ResourceStr = 'Phone 256 GB - midnight';
      const inputPrice: ResourceStr = $r('app.string.embed_product_price002');
      const first: ProductDataModel = new ProductDataModel(
        2,
        inputImageRes,
        inputTitle,
        inputPrice
      );
      expect(first.id).assertEqual(2);
      expect(first.imageRes).assertEqual('https://store.example/phone/front.webp');
      expect(first.title).assertEqual('Phone 256 GB - midnight');
      expect((first.price as Resource).id).assertEqual($r('app.string.embed_product_price002').id);
      const later: ProductDataModel = new ProductDataModel(
        3,
        $r('app.media.embed_product003'),
        $r('app.string.embed_product_title003'),
        'USD 0.00'
      );
      expect(later.id).assertEqual(3);
      expect((later.imageRes as Resource).id).assertEqual($r('app.media.embed_product003').id);
      expect((later.title as Resource).id).assertEqual($r('app.string.embed_product_title003').id);
      expect(later.price).assertEqual('USD 0.00');
      expect(first.id).assertEqual(2);
      expect(first.imageRes).assertEqual('https://store.example/phone/front.webp');
      expect(first.title).assertEqual('Phone 256 GB - midnight');
      expect((first.price as Resource).id).assertEqual($r('app.string.embed_product_price002').id);
      expect(first.price === inputPrice).assertTrue();
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_CTOREDGE_0022
     * @tc.name testProductCtorEdge0022
     * @tc.desc Phone RLR fields survive constructing the next product with inverse representations
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testProductCtorEdge0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const inputImageRes: ResourceStr = $r('app.media.embed_product002');
      const inputTitle: ResourceStr = 'Phone 256 GB - midnight';
      const inputPrice: ResourceStr = $r('app.string.embed_product_price002');
      const first: ProductDataModel = new ProductDataModel(
        2,
        inputImageRes,
        inputTitle,
        inputPrice
      );
      expect(first.id).assertEqual(2);
      expect((first.imageRes as Resource).id).assertEqual($r('app.media.embed_product002').id);
      expect(first.title).assertEqual('Phone 256 GB - midnight');
      expect((first.price as Resource).id).assertEqual($r('app.string.embed_product_price002').id);
      const later: ProductDataModel = new ProductDataModel(
        3,
        'file://cache/charger/front.webp',
        $r('app.string.embed_product_title003'),
        'USD 0.00'
      );
      expect(later.id).assertEqual(3);
      expect(later.imageRes).assertEqual('file://cache/charger/front.webp');
      expect((later.title as Resource).id).assertEqual($r('app.string.embed_product_title003').id);
      expect(later.price).assertEqual('USD 0.00');
      expect(first.id).assertEqual(2);
      expect((first.imageRes as Resource).id).assertEqual($r('app.media.embed_product002').id);
      expect(first.title).assertEqual('Phone 256 GB - midnight');
      expect((first.price as Resource).id).assertEqual($r('app.string.embed_product_price002').id);
      expect(first.imageRes === inputImageRes).assertTrue();
      expect(first.price === inputPrice).assertTrue();
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_CTOREDGE_0023
     * @tc.name testProductCtorEdge0023
     * @tc.desc Phone LRR fields survive constructing the next product with inverse representations
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testProductCtorEdge0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const inputImageRes: ResourceStr = 'https://store.example/phone/front.webp';
      const inputTitle: ResourceStr = $r('app.string.embed_product_title002');
      const inputPrice: ResourceStr = $r('app.string.embed_product_price002');
      const first: ProductDataModel = new ProductDataModel(
        2,
        inputImageRes,
        inputTitle,
        inputPrice
      );
      expect(first.id).assertEqual(2);
      expect(first.imageRes).assertEqual('https://store.example/phone/front.webp');
      expect((first.title as Resource).id).assertEqual($r('app.string.embed_product_title002').id);
      expect((first.price as Resource).id).assertEqual($r('app.string.embed_product_price002').id);
      const later: ProductDataModel = new ProductDataModel(
        3,
        $r('app.media.embed_product003'),
        'USB-C charger 65 W - two ports',
        'USD 0.00'
      );
      expect(later.id).assertEqual(3);
      expect((later.imageRes as Resource).id).assertEqual($r('app.media.embed_product003').id);
      expect(later.title).assertEqual('USB-C charger 65 W - two ports');
      expect(later.price).assertEqual('USD 0.00');
      expect(first.id).assertEqual(2);
      expect(first.imageRes).assertEqual('https://store.example/phone/front.webp');
      expect((first.title as Resource).id).assertEqual($r('app.string.embed_product_title002').id);
      expect((first.price as Resource).id).assertEqual($r('app.string.embed_product_price002').id);
      expect(first.title === inputTitle).assertTrue();
      expect(first.price === inputPrice).assertTrue();
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_CTOREDGE_0024
     * @tc.name testProductCtorEdge0024
     * @tc.desc Phone RRR fields survive constructing the next product with inverse representations
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testProductCtorEdge0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const inputImageRes: ResourceStr = $r('app.media.embed_product002');
      const inputTitle: ResourceStr = $r('app.string.embed_product_title002');
      const inputPrice: ResourceStr = $r('app.string.embed_product_price002');
      const first: ProductDataModel = new ProductDataModel(
        2,
        inputImageRes,
        inputTitle,
        inputPrice
      );
      expect(first.id).assertEqual(2);
      expect((first.imageRes as Resource).id).assertEqual($r('app.media.embed_product002').id);
      expect((first.title as Resource).id).assertEqual($r('app.string.embed_product_title002').id);
      expect((first.price as Resource).id).assertEqual($r('app.string.embed_product_price002').id);
      const later: ProductDataModel = new ProductDataModel(
        3,
        'file://cache/charger/front.webp',
        'USB-C charger 65 W - two ports',
        'USD 0.00'
      );
      expect(later.id).assertEqual(3);
      expect(later.imageRes).assertEqual('file://cache/charger/front.webp');
      expect(later.title).assertEqual('USB-C charger 65 W - two ports');
      expect(later.price).assertEqual('USD 0.00');
      expect(first.id).assertEqual(2);
      expect((first.imageRes as Resource).id).assertEqual($r('app.media.embed_product002').id);
      expect((first.title as Resource).id).assertEqual($r('app.string.embed_product_title002').id);
      expect((first.price as Resource).id).assertEqual($r('app.string.embed_product_price002').id);
      expect(first.imageRes === inputImageRes).assertTrue();
      expect(first.title === inputTitle).assertTrue();
      expect(first.price === inputPrice).assertTrue();
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_CTOREDGE_0025
     * @tc.name testProductCtorEdge0025
     * @tc.desc Charger LLL fields survive constructing the next product with inverse representations
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testProductCtorEdge0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const inputImageRes: ResourceStr = 'file://cache/charger/front.webp';
      const inputTitle: ResourceStr = 'USB-C charger 65 W - two ports';
      const inputPrice: ResourceStr = 'USD 0.00';
      const first: ProductDataModel = new ProductDataModel(
        3,
        inputImageRes,
        inputTitle,
        inputPrice
      );
      expect(first.id).assertEqual(3);
      expect(first.imageRes).assertEqual('file://cache/charger/front.webp');
      expect(first.title).assertEqual('USB-C charger 65 W - two ports');
      expect(first.price).assertEqual('USD 0.00');
      const later: ProductDataModel = new ProductDataModel(
        4,
        $r('app.media.embed_product004'),
        $r('app.string.embed_product_title004'),
        $r('app.string.embed_product_price004')
      );
      expect(later.id).assertEqual(4);
      expect((later.imageRes as Resource).id).assertEqual($r('app.media.embed_product004').id);
      expect((later.title as Resource).id).assertEqual($r('app.string.embed_product_title004').id);
      expect((later.price as Resource).id).assertEqual($r('app.string.embed_product_price004').id);
      expect(first.id).assertEqual(3);
      expect(first.imageRes).assertEqual('file://cache/charger/front.webp');
      expect(first.title).assertEqual('USB-C charger 65 W - two ports');
      expect(first.price).assertEqual('USD 0.00');
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_CTOREDGE_0026
     * @tc.name testProductCtorEdge0026
     * @tc.desc Charger RLL fields survive constructing the next product with inverse representations
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testProductCtorEdge0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const inputImageRes: ResourceStr = $r('app.media.embed_product003');
      const inputTitle: ResourceStr = 'USB-C charger 65 W - two ports';
      const inputPrice: ResourceStr = 'USD 0.00';
      const first: ProductDataModel = new ProductDataModel(
        3,
        inputImageRes,
        inputTitle,
        inputPrice
      );
      expect(first.id).assertEqual(3);
      expect((first.imageRes as Resource).id).assertEqual($r('app.media.embed_product003').id);
      expect(first.title).assertEqual('USB-C charger 65 W - two ports');
      expect(first.price).assertEqual('USD 0.00');
      const later: ProductDataModel = new ProductDataModel(
        4,
        'https://store.example/headset/front.webp',
        $r('app.string.embed_product_title004'),
        $r('app.string.embed_product_price004')
      );
      expect(later.id).assertEqual(4);
      expect(later.imageRes).assertEqual('https://store.example/headset/front.webp');
      expect((later.title as Resource).id).assertEqual($r('app.string.embed_product_title004').id);
      expect((later.price as Resource).id).assertEqual($r('app.string.embed_product_price004').id);
      expect(first.id).assertEqual(3);
      expect((first.imageRes as Resource).id).assertEqual($r('app.media.embed_product003').id);
      expect(first.title).assertEqual('USB-C charger 65 W - two ports');
      expect(first.price).assertEqual('USD 0.00');
      expect(first.imageRes === inputImageRes).assertTrue();
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_CTOREDGE_0027
     * @tc.name testProductCtorEdge0027
     * @tc.desc Charger LRL fields survive constructing the next product with inverse representations
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testProductCtorEdge0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const inputImageRes: ResourceStr = 'file://cache/charger/front.webp';
      const inputTitle: ResourceStr = $r('app.string.embed_product_title003');
      const inputPrice: ResourceStr = 'USD 0.00';
      const first: ProductDataModel = new ProductDataModel(
        3,
        inputImageRes,
        inputTitle,
        inputPrice
      );
      expect(first.id).assertEqual(3);
      expect(first.imageRes).assertEqual('file://cache/charger/front.webp');
      expect((first.title as Resource).id).assertEqual($r('app.string.embed_product_title003').id);
      expect(first.price).assertEqual('USD 0.00');
      const later: ProductDataModel = new ProductDataModel(
        4,
        $r('app.media.embed_product004'),
        'Wireless headset - open-box',
        $r('app.string.embed_product_price004')
      );
      expect(later.id).assertEqual(4);
      expect((later.imageRes as Resource).id).assertEqual($r('app.media.embed_product004').id);
      expect(later.title).assertEqual('Wireless headset - open-box');
      expect((later.price as Resource).id).assertEqual($r('app.string.embed_product_price004').id);
      expect(first.id).assertEqual(3);
      expect(first.imageRes).assertEqual('file://cache/charger/front.webp');
      expect((first.title as Resource).id).assertEqual($r('app.string.embed_product_title003').id);
      expect(first.price).assertEqual('USD 0.00');
      expect(first.title === inputTitle).assertTrue();
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_CTOREDGE_0028
     * @tc.name testProductCtorEdge0028
     * @tc.desc Charger RRL fields survive constructing the next product with inverse representations
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testProductCtorEdge0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const inputImageRes: ResourceStr = $r('app.media.embed_product003');
      const inputTitle: ResourceStr = $r('app.string.embed_product_title003');
      const inputPrice: ResourceStr = 'USD 0.00';
      const first: ProductDataModel = new ProductDataModel(
        3,
        inputImageRes,
        inputTitle,
        inputPrice
      );
      expect(first.id).assertEqual(3);
      expect((first.imageRes as Resource).id).assertEqual($r('app.media.embed_product003').id);
      expect((first.title as Resource).id).assertEqual($r('app.string.embed_product_title003').id);
      expect(first.price).assertEqual('USD 0.00');
      const later: ProductDataModel = new ProductDataModel(
        4,
        'https://store.example/headset/front.webp',
        'Wireless headset - open-box',
        $r('app.string.embed_product_price004')
      );
      expect(later.id).assertEqual(4);
      expect(later.imageRes).assertEqual('https://store.example/headset/front.webp');
      expect(later.title).assertEqual('Wireless headset - open-box');
      expect((later.price as Resource).id).assertEqual($r('app.string.embed_product_price004').id);
      expect(first.id).assertEqual(3);
      expect((first.imageRes as Resource).id).assertEqual($r('app.media.embed_product003').id);
      expect((first.title as Resource).id).assertEqual($r('app.string.embed_product_title003').id);
      expect(first.price).assertEqual('USD 0.00');
      expect(first.imageRes === inputImageRes).assertTrue();
      expect(first.title === inputTitle).assertTrue();
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_CTOREDGE_0029
     * @tc.name testProductCtorEdge0029
     * @tc.desc Charger LLR fields survive constructing the next product with inverse representations
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testProductCtorEdge0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const inputImageRes: ResourceStr = 'file://cache/charger/front.webp';
      const inputTitle: ResourceStr = 'USB-C charger 65 W - two ports';
      const inputPrice: ResourceStr = $r('app.string.embed_product_price003');
      const first: ProductDataModel = new ProductDataModel(
        3,
        inputImageRes,
        inputTitle,
        inputPrice
      );
      expect(first.id).assertEqual(3);
      expect(first.imageRes).assertEqual('file://cache/charger/front.webp');
      expect(first.title).assertEqual('USB-C charger 65 W - two ports');
      expect((first.price as Resource).id).assertEqual($r('app.string.embed_product_price003').id);
      const later: ProductDataModel = new ProductDataModel(
        4,
        $r('app.media.embed_product004'),
        $r('app.string.embed_product_title004'),
        'USD -5.00 credit'
      );
      expect(later.id).assertEqual(4);
      expect((later.imageRes as Resource).id).assertEqual($r('app.media.embed_product004').id);
      expect((later.title as Resource).id).assertEqual($r('app.string.embed_product_title004').id);
      expect(later.price).assertEqual('USD -5.00 credit');
      expect(first.id).assertEqual(3);
      expect(first.imageRes).assertEqual('file://cache/charger/front.webp');
      expect(first.title).assertEqual('USB-C charger 65 W - two ports');
      expect((first.price as Resource).id).assertEqual($r('app.string.embed_product_price003').id);
      expect(first.price === inputPrice).assertTrue();
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_CTOREDGE_0030
     * @tc.name testProductCtorEdge0030
     * @tc.desc Charger RLR fields survive constructing the next product with inverse representations
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testProductCtorEdge0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const inputImageRes: ResourceStr = $r('app.media.embed_product003');
      const inputTitle: ResourceStr = 'USB-C charger 65 W - two ports';
      const inputPrice: ResourceStr = $r('app.string.embed_product_price003');
      const first: ProductDataModel = new ProductDataModel(
        3,
        inputImageRes,
        inputTitle,
        inputPrice
      );
      expect(first.id).assertEqual(3);
      expect((first.imageRes as Resource).id).assertEqual($r('app.media.embed_product003').id);
      expect(first.title).assertEqual('USB-C charger 65 W - two ports');
      expect((first.price as Resource).id).assertEqual($r('app.string.embed_product_price003').id);
      const later: ProductDataModel = new ProductDataModel(
        4,
        'https://store.example/headset/front.webp',
        $r('app.string.embed_product_title004'),
        'USD -5.00 credit'
      );
      expect(later.id).assertEqual(4);
      expect(later.imageRes).assertEqual('https://store.example/headset/front.webp');
      expect((later.title as Resource).id).assertEqual($r('app.string.embed_product_title004').id);
      expect(later.price).assertEqual('USD -5.00 credit');
      expect(first.id).assertEqual(3);
      expect((first.imageRes as Resource).id).assertEqual($r('app.media.embed_product003').id);
      expect(first.title).assertEqual('USB-C charger 65 W - two ports');
      expect((first.price as Resource).id).assertEqual($r('app.string.embed_product_price003').id);
      expect(first.imageRes === inputImageRes).assertTrue();
      expect(first.price === inputPrice).assertTrue();
    });
  });
}
