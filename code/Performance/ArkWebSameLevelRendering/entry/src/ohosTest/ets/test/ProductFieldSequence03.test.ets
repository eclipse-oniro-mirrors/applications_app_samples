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

export default function productFieldSequence03Test(): void {
  describe('productFieldSequence03Test', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_FIELDSEQUENCE_0073
     * @tc.name testProductFieldSequence0073
     * @tc.desc Notebook id becomes draft -1; its later copy keeps that id after replacement with 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testProductFieldSequence0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const previous: ProductDataModel = new ProductDataModel(
        1,
        $r('app.media.embed_product001'),
        'Notebook 16 GB / 512 GB - refurbished',
        $r('app.string.embed_product_price001')
      );
      const current: ProductDataModel = new ProductDataModel(
        1,
        previous.imageRes,
        previous.title,
        previous.price
      );
      current.id = -1;
      expect(current.id).assertEqual(-1);
      expect((current.imageRes as Resource).id).assertEqual($r('app.media.embed_product001').id);
      expect(current.title).assertEqual('Notebook 16 GB / 512 GB - refurbished');
      expect((current.price as Resource).id).assertEqual($r('app.string.embed_product_price001').id);
      expect(previous.id).assertEqual(1);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product001').id);
      expect(previous.title).assertEqual('Notebook 16 GB / 512 GB - refurbished');
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price001').id);
      const later: ProductDataModel = new ProductDataModel(
        current.id,
        current.imageRes,
        current.title,
        current.price
      );
      expect(later.id).assertEqual(-1);
      expect((later.imageRes as Resource).id).assertEqual($r('app.media.embed_product001').id);
      expect(later.title).assertEqual('Notebook 16 GB / 512 GB - refurbished');
      expect((later.price as Resource).id).assertEqual($r('app.string.embed_product_price001').id);
      current.id = 2;
      expect(current.id).assertEqual(2);
      expect((current.imageRes as Resource).id).assertEqual($r('app.media.embed_product001').id);
      expect(current.title).assertEqual('Notebook 16 GB / 512 GB - refurbished');
      expect((current.price as Resource).id).assertEqual($r('app.string.embed_product_price001').id);
      expect(later.id).assertEqual(-1);
      expect((later.imageRes as Resource).id).assertEqual($r('app.media.embed_product001').id);
      expect(later.title).assertEqual('Notebook 16 GB / 512 GB - refurbished');
      expect((later.price as Resource).id).assertEqual($r('app.string.embed_product_price001').id);
      expect(previous.id).assertEqual(1);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product001').id);
      expect(previous.title).assertEqual('Notebook 16 GB / 512 GB - refurbished');
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price001').id);
      expect(later === current).assertFalse();
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_FIELDSEQUENCE_0074
     * @tc.name testProductFieldSequence0074
     * @tc.desc Notebook id becomes first catalog 0; its later copy keeps that id after replacement with 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testProductFieldSequence0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const previous: ProductDataModel = new ProductDataModel(
        1,
        $r('app.media.embed_product001'),
        'Notebook 16 GB / 512 GB - refurbished',
        $r('app.string.embed_product_price001')
      );
      const current: ProductDataModel = new ProductDataModel(
        1,
        previous.imageRes,
        previous.title,
        previous.price
      );
      current.id = 0;
      expect(current.id).assertEqual(0);
      expect((current.imageRes as Resource).id).assertEqual($r('app.media.embed_product001').id);
      expect(current.title).assertEqual('Notebook 16 GB / 512 GB - refurbished');
      expect((current.price as Resource).id).assertEqual($r('app.string.embed_product_price001').id);
      expect(previous.id).assertEqual(1);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product001').id);
      expect(previous.title).assertEqual('Notebook 16 GB / 512 GB - refurbished');
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price001').id);
      const later: ProductDataModel = new ProductDataModel(
        current.id,
        current.imageRes,
        current.title,
        current.price
      );
      expect(later.id).assertEqual(0);
      expect((later.imageRes as Resource).id).assertEqual($r('app.media.embed_product001').id);
      expect(later.title).assertEqual('Notebook 16 GB / 512 GB - refurbished');
      expect((later.price as Resource).id).assertEqual($r('app.string.embed_product_price001').id);
      current.id = 2;
      expect(current.id).assertEqual(2);
      expect((current.imageRes as Resource).id).assertEqual($r('app.media.embed_product001').id);
      expect(current.title).assertEqual('Notebook 16 GB / 512 GB - refurbished');
      expect((current.price as Resource).id).assertEqual($r('app.string.embed_product_price001').id);
      expect(later.id).assertEqual(0);
      expect((later.imageRes as Resource).id).assertEqual($r('app.media.embed_product001').id);
      expect(later.title).assertEqual('Notebook 16 GB / 512 GB - refurbished');
      expect((later.price as Resource).id).assertEqual($r('app.string.embed_product_price001').id);
      expect(previous.id).assertEqual(1);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product001').id);
      expect(previous.title).assertEqual('Notebook 16 GB / 512 GB - refurbished');
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price001').id);
      expect(later === current).assertFalse();
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_FIELDSEQUENCE_0075
     * @tc.name testProductFieldSequence0075
     * @tc.desc Notebook id becomes last catalog 5; its later copy keeps that id after replacement with 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testProductFieldSequence0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const previous: ProductDataModel = new ProductDataModel(
        1,
        $r('app.media.embed_product001'),
        'Notebook 16 GB / 512 GB - refurbished',
        $r('app.string.embed_product_price001')
      );
      const current: ProductDataModel = new ProductDataModel(
        1,
        previous.imageRes,
        previous.title,
        previous.price
      );
      current.id = 5;
      expect(current.id).assertEqual(5);
      expect((current.imageRes as Resource).id).assertEqual($r('app.media.embed_product001').id);
      expect(current.title).assertEqual('Notebook 16 GB / 512 GB - refurbished');
      expect((current.price as Resource).id).assertEqual($r('app.string.embed_product_price001').id);
      expect(previous.id).assertEqual(1);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product001').id);
      expect(previous.title).assertEqual('Notebook 16 GB / 512 GB - refurbished');
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price001').id);
      const later: ProductDataModel = new ProductDataModel(
        current.id,
        current.imageRes,
        current.title,
        current.price
      );
      expect(later.id).assertEqual(5);
      expect((later.imageRes as Resource).id).assertEqual($r('app.media.embed_product001').id);
      expect(later.title).assertEqual('Notebook 16 GB / 512 GB - refurbished');
      expect((later.price as Resource).id).assertEqual($r('app.string.embed_product_price001').id);
      current.id = 2;
      expect(current.id).assertEqual(2);
      expect((current.imageRes as Resource).id).assertEqual($r('app.media.embed_product001').id);
      expect(current.title).assertEqual('Notebook 16 GB / 512 GB - refurbished');
      expect((current.price as Resource).id).assertEqual($r('app.string.embed_product_price001').id);
      expect(later.id).assertEqual(5);
      expect((later.imageRes as Resource).id).assertEqual($r('app.media.embed_product001').id);
      expect(later.title).assertEqual('Notebook 16 GB / 512 GB - refurbished');
      expect((later.price as Resource).id).assertEqual($r('app.string.embed_product_price001').id);
      expect(previous.id).assertEqual(1);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product001').id);
      expect(previous.title).assertEqual('Notebook 16 GB / 512 GB - refurbished');
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price001').id);
      expect(later === current).assertFalse();
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_FIELDSEQUENCE_0076
     * @tc.name testProductFieldSequence0076
     * @tc.desc Notebook id becomes next external 6; its later copy keeps that id after replacement with 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testProductFieldSequence0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const previous: ProductDataModel = new ProductDataModel(
        1,
        $r('app.media.embed_product001'),
        'Notebook 16 GB / 512 GB - refurbished',
        $r('app.string.embed_product_price001')
      );
      const current: ProductDataModel = new ProductDataModel(
        1,
        previous.imageRes,
        previous.title,
        previous.price
      );
      current.id = 6;
      expect(current.id).assertEqual(6);
      expect((current.imageRes as Resource).id).assertEqual($r('app.media.embed_product001').id);
      expect(current.title).assertEqual('Notebook 16 GB / 512 GB - refurbished');
      expect((current.price as Resource).id).assertEqual($r('app.string.embed_product_price001').id);
      expect(previous.id).assertEqual(1);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product001').id);
      expect(previous.title).assertEqual('Notebook 16 GB / 512 GB - refurbished');
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price001').id);
      const later: ProductDataModel = new ProductDataModel(
        current.id,
        current.imageRes,
        current.title,
        current.price
      );
      expect(later.id).assertEqual(6);
      expect((later.imageRes as Resource).id).assertEqual($r('app.media.embed_product001').id);
      expect(later.title).assertEqual('Notebook 16 GB / 512 GB - refurbished');
      expect((later.price as Resource).id).assertEqual($r('app.string.embed_product_price001').id);
      current.id = 2;
      expect(current.id).assertEqual(2);
      expect((current.imageRes as Resource).id).assertEqual($r('app.media.embed_product001').id);
      expect(current.title).assertEqual('Notebook 16 GB / 512 GB - refurbished');
      expect((current.price as Resource).id).assertEqual($r('app.string.embed_product_price001').id);
      expect(later.id).assertEqual(6);
      expect((later.imageRes as Resource).id).assertEqual($r('app.media.embed_product001').id);
      expect(later.title).assertEqual('Notebook 16 GB / 512 GB - refurbished');
      expect((later.price as Resource).id).assertEqual($r('app.string.embed_product_price001').id);
      expect(previous.id).assertEqual(1);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product001').id);
      expect(previous.title).assertEqual('Notebook 16 GB / 512 GB - refurbished');
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price001').id);
      expect(later === current).assertFalse();
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_FIELDSEQUENCE_0077
     * @tc.name testProductFieldSequence0077
     * @tc.desc Notebook id becomes fractional 0.5; its later copy keeps that id after replacement with 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testProductFieldSequence0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const previous: ProductDataModel = new ProductDataModel(
        1,
        $r('app.media.embed_product001'),
        'Notebook 16 GB / 512 GB - refurbished',
        $r('app.string.embed_product_price001')
      );
      const current: ProductDataModel = new ProductDataModel(
        1,
        previous.imageRes,
        previous.title,
        previous.price
      );
      current.id = 0.5;
      expect(current.id).assertEqual(0.5);
      expect((current.imageRes as Resource).id).assertEqual($r('app.media.embed_product001').id);
      expect(current.title).assertEqual('Notebook 16 GB / 512 GB - refurbished');
      expect((current.price as Resource).id).assertEqual($r('app.string.embed_product_price001').id);
      expect(previous.id).assertEqual(1);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product001').id);
      expect(previous.title).assertEqual('Notebook 16 GB / 512 GB - refurbished');
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price001').id);
      const later: ProductDataModel = new ProductDataModel(
        current.id,
        current.imageRes,
        current.title,
        current.price
      );
      expect(later.id).assertEqual(0.5);
      expect((later.imageRes as Resource).id).assertEqual($r('app.media.embed_product001').id);
      expect(later.title).assertEqual('Notebook 16 GB / 512 GB - refurbished');
      expect((later.price as Resource).id).assertEqual($r('app.string.embed_product_price001').id);
      current.id = 2;
      expect(current.id).assertEqual(2);
      expect((current.imageRes as Resource).id).assertEqual($r('app.media.embed_product001').id);
      expect(current.title).assertEqual('Notebook 16 GB / 512 GB - refurbished');
      expect((current.price as Resource).id).assertEqual($r('app.string.embed_product_price001').id);
      expect(later.id).assertEqual(0.5);
      expect((later.imageRes as Resource).id).assertEqual($r('app.media.embed_product001').id);
      expect(later.title).assertEqual('Notebook 16 GB / 512 GB - refurbished');
      expect((later.price as Resource).id).assertEqual($r('app.string.embed_product_price001').id);
      expect(previous.id).assertEqual(1);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product001').id);
      expect(previous.title).assertEqual('Notebook 16 GB / 512 GB - refurbished');
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price001').id);
      expect(later === current).assertFalse();
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_FIELDSEQUENCE_0078
     * @tc.name testProductFieldSequence0078
     * @tc.desc Notebook id becomes negative fractional -0.5; its later copy keeps that id after replacement with 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testProductFieldSequence0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const previous: ProductDataModel = new ProductDataModel(
        1,
        $r('app.media.embed_product001'),
        'Notebook 16 GB / 512 GB - refurbished',
        $r('app.string.embed_product_price001')
      );
      const current: ProductDataModel = new ProductDataModel(
        1,
        previous.imageRes,
        previous.title,
        previous.price
      );
      current.id = -0.5;
      expect(current.id).assertEqual(-0.5);
      expect((current.imageRes as Resource).id).assertEqual($r('app.media.embed_product001').id);
      expect(current.title).assertEqual('Notebook 16 GB / 512 GB - refurbished');
      expect((current.price as Resource).id).assertEqual($r('app.string.embed_product_price001').id);
      expect(previous.id).assertEqual(1);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product001').id);
      expect(previous.title).assertEqual('Notebook 16 GB / 512 GB - refurbished');
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price001').id);
      const later: ProductDataModel = new ProductDataModel(
        current.id,
        current.imageRes,
        current.title,
        current.price
      );
      expect(later.id).assertEqual(-0.5);
      expect((later.imageRes as Resource).id).assertEqual($r('app.media.embed_product001').id);
      expect(later.title).assertEqual('Notebook 16 GB / 512 GB - refurbished');
      expect((later.price as Resource).id).assertEqual($r('app.string.embed_product_price001').id);
      current.id = 2;
      expect(current.id).assertEqual(2);
      expect((current.imageRes as Resource).id).assertEqual($r('app.media.embed_product001').id);
      expect(current.title).assertEqual('Notebook 16 GB / 512 GB - refurbished');
      expect((current.price as Resource).id).assertEqual($r('app.string.embed_product_price001').id);
      expect(later.id).assertEqual(-0.5);
      expect((later.imageRes as Resource).id).assertEqual($r('app.media.embed_product001').id);
      expect(later.title).assertEqual('Notebook 16 GB / 512 GB - refurbished');
      expect((later.price as Resource).id).assertEqual($r('app.string.embed_product_price001').id);
      expect(previous.id).assertEqual(1);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product001').id);
      expect(previous.title).assertEqual('Notebook 16 GB / 512 GB - refurbished');
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price001').id);
      expect(later === current).assertFalse();
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_FIELDSEQUENCE_0079
     * @tc.name testProductFieldSequence0079
     * @tc.desc Notebook id becomes maximum safe; its later copy keeps that id after replacement with 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testProductFieldSequence0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const previous: ProductDataModel = new ProductDataModel(
        1,
        $r('app.media.embed_product001'),
        'Notebook 16 GB / 512 GB - refurbished',
        $r('app.string.embed_product_price001')
      );
      const current: ProductDataModel = new ProductDataModel(
        1,
        previous.imageRes,
        previous.title,
        previous.price
      );
      current.id = Number.MAX_SAFE_INTEGER;
      expect(current.id).assertEqual(Number.MAX_SAFE_INTEGER);
      expect((current.imageRes as Resource).id).assertEqual($r('app.media.embed_product001').id);
      expect(current.title).assertEqual('Notebook 16 GB / 512 GB - refurbished');
      expect((current.price as Resource).id).assertEqual($r('app.string.embed_product_price001').id);
      expect(previous.id).assertEqual(1);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product001').id);
      expect(previous.title).assertEqual('Notebook 16 GB / 512 GB - refurbished');
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price001').id);
      const later: ProductDataModel = new ProductDataModel(
        current.id,
        current.imageRes,
        current.title,
        current.price
      );
      expect(later.id).assertEqual(Number.MAX_SAFE_INTEGER);
      expect((later.imageRes as Resource).id).assertEqual($r('app.media.embed_product001').id);
      expect(later.title).assertEqual('Notebook 16 GB / 512 GB - refurbished');
      expect((later.price as Resource).id).assertEqual($r('app.string.embed_product_price001').id);
      current.id = 2;
      expect(current.id).assertEqual(2);
      expect((current.imageRes as Resource).id).assertEqual($r('app.media.embed_product001').id);
      expect(current.title).assertEqual('Notebook 16 GB / 512 GB - refurbished');
      expect((current.price as Resource).id).assertEqual($r('app.string.embed_product_price001').id);
      expect(later.id).assertEqual(Number.MAX_SAFE_INTEGER);
      expect((later.imageRes as Resource).id).assertEqual($r('app.media.embed_product001').id);
      expect(later.title).assertEqual('Notebook 16 GB / 512 GB - refurbished');
      expect((later.price as Resource).id).assertEqual($r('app.string.embed_product_price001').id);
      expect(previous.id).assertEqual(1);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product001').id);
      expect(previous.title).assertEqual('Notebook 16 GB / 512 GB - refurbished');
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price001').id);
      expect(later === current).assertFalse();
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_FIELDSEQUENCE_0080
     * @tc.name testProductFieldSequence0080
     * @tc.desc Notebook id becomes minimum safe; its later copy keeps that id after replacement with 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testProductFieldSequence0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const previous: ProductDataModel = new ProductDataModel(
        1,
        $r('app.media.embed_product001'),
        'Notebook 16 GB / 512 GB - refurbished',
        $r('app.string.embed_product_price001')
      );
      const current: ProductDataModel = new ProductDataModel(
        1,
        previous.imageRes,
        previous.title,
        previous.price
      );
      current.id = Number.MIN_SAFE_INTEGER;
      expect(current.id).assertEqual(Number.MIN_SAFE_INTEGER);
      expect((current.imageRes as Resource).id).assertEqual($r('app.media.embed_product001').id);
      expect(current.title).assertEqual('Notebook 16 GB / 512 GB - refurbished');
      expect((current.price as Resource).id).assertEqual($r('app.string.embed_product_price001').id);
      expect(previous.id).assertEqual(1);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product001').id);
      expect(previous.title).assertEqual('Notebook 16 GB / 512 GB - refurbished');
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price001').id);
      const later: ProductDataModel = new ProductDataModel(
        current.id,
        current.imageRes,
        current.title,
        current.price
      );
      expect(later.id).assertEqual(Number.MIN_SAFE_INTEGER);
      expect((later.imageRes as Resource).id).assertEqual($r('app.media.embed_product001').id);
      expect(later.title).assertEqual('Notebook 16 GB / 512 GB - refurbished');
      expect((later.price as Resource).id).assertEqual($r('app.string.embed_product_price001').id);
      current.id = 2;
      expect(current.id).assertEqual(2);
      expect((current.imageRes as Resource).id).assertEqual($r('app.media.embed_product001').id);
      expect(current.title).assertEqual('Notebook 16 GB / 512 GB - refurbished');
      expect((current.price as Resource).id).assertEqual($r('app.string.embed_product_price001').id);
      expect(later.id).assertEqual(Number.MIN_SAFE_INTEGER);
      expect((later.imageRes as Resource).id).assertEqual($r('app.media.embed_product001').id);
      expect(later.title).assertEqual('Notebook 16 GB / 512 GB - refurbished');
      expect((later.price as Resource).id).assertEqual($r('app.string.embed_product_price001').id);
      expect(previous.id).assertEqual(1);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product001').id);
      expect(previous.title).assertEqual('Notebook 16 GB / 512 GB - refurbished');
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price001').id);
      expect(later === current).assertFalse();
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_FIELDSEQUENCE_0081
     * @tc.name testProductFieldSequence0081
     * @tc.desc Notebook id becomes unparsed NaN; its later copy keeps that id after replacement with 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testProductFieldSequence0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const previous: ProductDataModel = new ProductDataModel(
        1,
        $r('app.media.embed_product001'),
        'Notebook 16 GB / 512 GB - refurbished',
        $r('app.string.embed_product_price001')
      );
      const current: ProductDataModel = new ProductDataModel(
        1,
        previous.imageRes,
        previous.title,
        previous.price
      );
      current.id = Number.NaN;
      expect(Number.isNaN(current.id)).assertTrue();
      expect((current.imageRes as Resource).id).assertEqual($r('app.media.embed_product001').id);
      expect(current.title).assertEqual('Notebook 16 GB / 512 GB - refurbished');
      expect((current.price as Resource).id).assertEqual($r('app.string.embed_product_price001').id);
      expect(previous.id).assertEqual(1);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product001').id);
      expect(previous.title).assertEqual('Notebook 16 GB / 512 GB - refurbished');
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price001').id);
      const later: ProductDataModel = new ProductDataModel(
        current.id,
        current.imageRes,
        current.title,
        current.price
      );
      expect(Number.isNaN(later.id)).assertTrue();
      expect((later.imageRes as Resource).id).assertEqual($r('app.media.embed_product001').id);
      expect(later.title).assertEqual('Notebook 16 GB / 512 GB - refurbished');
      expect((later.price as Resource).id).assertEqual($r('app.string.embed_product_price001').id);
      current.id = 2;
      expect(current.id).assertEqual(2);
      expect((current.imageRes as Resource).id).assertEqual($r('app.media.embed_product001').id);
      expect(current.title).assertEqual('Notebook 16 GB / 512 GB - refurbished');
      expect((current.price as Resource).id).assertEqual($r('app.string.embed_product_price001').id);
      expect(Number.isNaN(later.id)).assertTrue();
      expect((later.imageRes as Resource).id).assertEqual($r('app.media.embed_product001').id);
      expect(later.title).assertEqual('Notebook 16 GB / 512 GB - refurbished');
      expect((later.price as Resource).id).assertEqual($r('app.string.embed_product_price001').id);
      expect(previous.id).assertEqual(1);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product001').id);
      expect(previous.title).assertEqual('Notebook 16 GB / 512 GB - refurbished');
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price001').id);
      expect(later === current).assertFalse();
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_FIELDSEQUENCE_0082
     * @tc.name testProductFieldSequence0082
     * @tc.desc Notebook id becomes positive infinite; its later copy keeps that id after replacement with 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testProductFieldSequence0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const previous: ProductDataModel = new ProductDataModel(
        1,
        $r('app.media.embed_product001'),
        'Notebook 16 GB / 512 GB - refurbished',
        $r('app.string.embed_product_price001')
      );
      const current: ProductDataModel = new ProductDataModel(
        1,
        previous.imageRes,
        previous.title,
        previous.price
      );
      current.id = Number.POSITIVE_INFINITY;
      expect(current.id).assertEqual(Number.POSITIVE_INFINITY);
      expect((current.imageRes as Resource).id).assertEqual($r('app.media.embed_product001').id);
      expect(current.title).assertEqual('Notebook 16 GB / 512 GB - refurbished');
      expect((current.price as Resource).id).assertEqual($r('app.string.embed_product_price001').id);
      expect(previous.id).assertEqual(1);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product001').id);
      expect(previous.title).assertEqual('Notebook 16 GB / 512 GB - refurbished');
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price001').id);
      const later: ProductDataModel = new ProductDataModel(
        current.id,
        current.imageRes,
        current.title,
        current.price
      );
      expect(later.id).assertEqual(Number.POSITIVE_INFINITY);
      expect((later.imageRes as Resource).id).assertEqual($r('app.media.embed_product001').id);
      expect(later.title).assertEqual('Notebook 16 GB / 512 GB - refurbished');
      expect((later.price as Resource).id).assertEqual($r('app.string.embed_product_price001').id);
      current.id = 2;
      expect(current.id).assertEqual(2);
      expect((current.imageRes as Resource).id).assertEqual($r('app.media.embed_product001').id);
      expect(current.title).assertEqual('Notebook 16 GB / 512 GB - refurbished');
      expect((current.price as Resource).id).assertEqual($r('app.string.embed_product_price001').id);
      expect(later.id).assertEqual(Number.POSITIVE_INFINITY);
      expect((later.imageRes as Resource).id).assertEqual($r('app.media.embed_product001').id);
      expect(later.title).assertEqual('Notebook 16 GB / 512 GB - refurbished');
      expect((later.price as Resource).id).assertEqual($r('app.string.embed_product_price001').id);
      expect(previous.id).assertEqual(1);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product001').id);
      expect(previous.title).assertEqual('Notebook 16 GB / 512 GB - refurbished');
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price001').id);
      expect(later === current).assertFalse();
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_FIELDSEQUENCE_0083
     * @tc.name testProductFieldSequence0083
     * @tc.desc Notebook id becomes negative infinite; its later copy keeps that id after replacement with 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testProductFieldSequence0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const previous: ProductDataModel = new ProductDataModel(
        1,
        $r('app.media.embed_product001'),
        'Notebook 16 GB / 512 GB - refurbished',
        $r('app.string.embed_product_price001')
      );
      const current: ProductDataModel = new ProductDataModel(
        1,
        previous.imageRes,
        previous.title,
        previous.price
      );
      current.id = Number.NEGATIVE_INFINITY;
      expect(current.id).assertEqual(Number.NEGATIVE_INFINITY);
      expect((current.imageRes as Resource).id).assertEqual($r('app.media.embed_product001').id);
      expect(current.title).assertEqual('Notebook 16 GB / 512 GB - refurbished');
      expect((current.price as Resource).id).assertEqual($r('app.string.embed_product_price001').id);
      expect(previous.id).assertEqual(1);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product001').id);
      expect(previous.title).assertEqual('Notebook 16 GB / 512 GB - refurbished');
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price001').id);
      const later: ProductDataModel = new ProductDataModel(
        current.id,
        current.imageRes,
        current.title,
        current.price
      );
      expect(later.id).assertEqual(Number.NEGATIVE_INFINITY);
      expect((later.imageRes as Resource).id).assertEqual($r('app.media.embed_product001').id);
      expect(later.title).assertEqual('Notebook 16 GB / 512 GB - refurbished');
      expect((later.price as Resource).id).assertEqual($r('app.string.embed_product_price001').id);
      current.id = 2;
      expect(current.id).assertEqual(2);
      expect((current.imageRes as Resource).id).assertEqual($r('app.media.embed_product001').id);
      expect(current.title).assertEqual('Notebook 16 GB / 512 GB - refurbished');
      expect((current.price as Resource).id).assertEqual($r('app.string.embed_product_price001').id);
      expect(later.id).assertEqual(Number.NEGATIVE_INFINITY);
      expect((later.imageRes as Resource).id).assertEqual($r('app.media.embed_product001').id);
      expect(later.title).assertEqual('Notebook 16 GB / 512 GB - refurbished');
      expect((later.price as Resource).id).assertEqual($r('app.string.embed_product_price001').id);
      expect(previous.id).assertEqual(1);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product001').id);
      expect(previous.title).assertEqual('Notebook 16 GB / 512 GB - refurbished');
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price001').id);
      expect(later === current).assertFalse();
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_FIELDSEQUENCE_0084
     * @tc.name testProductFieldSequence0084
     * @tc.desc Notebook id becomes signed zero; its later copy keeps that id after replacement with 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testProductFieldSequence0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const previous: ProductDataModel = new ProductDataModel(
        1,
        $r('app.media.embed_product001'),
        'Notebook 16 GB / 512 GB - refurbished',
        $r('app.string.embed_product_price001')
      );
      const current: ProductDataModel = new ProductDataModel(
        1,
        previous.imageRes,
        previous.title,
        previous.price
      );
      current.id = -0;
      expect(1 / current.id === Number.NEGATIVE_INFINITY).assertTrue();
      expect((current.imageRes as Resource).id).assertEqual($r('app.media.embed_product001').id);
      expect(current.title).assertEqual('Notebook 16 GB / 512 GB - refurbished');
      expect((current.price as Resource).id).assertEqual($r('app.string.embed_product_price001').id);
      expect(previous.id).assertEqual(1);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product001').id);
      expect(previous.title).assertEqual('Notebook 16 GB / 512 GB - refurbished');
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price001').id);
      const later: ProductDataModel = new ProductDataModel(
        current.id,
        current.imageRes,
        current.title,
        current.price
      );
      expect(1 / later.id === Number.NEGATIVE_INFINITY).assertTrue();
      expect((later.imageRes as Resource).id).assertEqual($r('app.media.embed_product001').id);
      expect(later.title).assertEqual('Notebook 16 GB / 512 GB - refurbished');
      expect((later.price as Resource).id).assertEqual($r('app.string.embed_product_price001').id);
      current.id = 2;
      expect(current.id).assertEqual(2);
      expect((current.imageRes as Resource).id).assertEqual($r('app.media.embed_product001').id);
      expect(current.title).assertEqual('Notebook 16 GB / 512 GB - refurbished');
      expect((current.price as Resource).id).assertEqual($r('app.string.embed_product_price001').id);
      expect(1 / later.id === Number.NEGATIVE_INFINITY).assertTrue();
      expect((later.imageRes as Resource).id).assertEqual($r('app.media.embed_product001').id);
      expect(later.title).assertEqual('Notebook 16 GB / 512 GB - refurbished');
      expect((later.price as Resource).id).assertEqual($r('app.string.embed_product_price001').id);
      expect(previous.id).assertEqual(1);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product001').id);
      expect(previous.title).assertEqual('Notebook 16 GB / 512 GB - refurbished');
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price001').id);
      expect(later === current).assertFalse();
    });
  });
}
