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
