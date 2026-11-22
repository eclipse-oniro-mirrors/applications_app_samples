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

export default function productFieldSequence01Test(): void {
  describe('productFieldSequence01Test', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_FIELDSEQUENCE_0001
     * @tc.name testProductFieldSequence0001
     * @tc.desc Power bank imageRes detaches to a literal then restores its resource without changing its peer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testProductFieldSequence0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const previous: ProductDataModel = new ProductDataModel(
        0,
        $r('app.media.embed_product000'),
        $r('app.string.embed_product_title000'),
        $r('app.string.embed_product_price000')
      );
      const current: ProductDataModel = new ProductDataModel(
        0,
        $r('app.media.embed_product000'),
        $r('app.string.embed_product_title000'),
        $r('app.string.embed_product_price000')
      );
      current.imageRes = 'https://store.example/power-bank/front.webp';
      expect(current.id).assertEqual(0);
      expect(current.imageRes).assertEqual('https://store.example/power-bank/front.webp');
      expect((current.title as Resource).id).assertEqual($r('app.string.embed_product_title000').id);
      expect((current.price as Resource).id).assertEqual($r('app.string.embed_product_price000').id);
      expect(previous.id).assertEqual(0);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product000').id);
      expect((previous.title as Resource).id).assertEqual($r('app.string.embed_product_title000').id);
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price000').id);
      current.imageRes = $r('app.media.embed_product000');
      const later: ProductDataModel = new ProductDataModel(
        1,
        $r('app.media.embed_product001'),
        $r('app.string.embed_product_title001'),
        $r('app.string.embed_product_price001')
      );
      expect(current.id).assertEqual(0);
      expect((current.imageRes as Resource).id).assertEqual($r('app.media.embed_product000').id);
      expect((current.title as Resource).id).assertEqual($r('app.string.embed_product_title000').id);
      expect((current.price as Resource).id).assertEqual($r('app.string.embed_product_price000').id);
      expect(previous.id).assertEqual(0);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product000').id);
      expect((previous.title as Resource).id).assertEqual($r('app.string.embed_product_title000').id);
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price000').id);
      expect(later.id).assertEqual(1);
      expect((later.imageRes as Resource).id).assertEqual($r('app.media.embed_product001').id);
      expect((later.title as Resource).id).assertEqual($r('app.string.embed_product_title001').id);
      expect((later.price as Resource).id).assertEqual($r('app.string.embed_product_price001').id);
      expect(current === previous).assertFalse();
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_FIELDSEQUENCE_0002
     * @tc.name testProductFieldSequence0002
     * @tc.desc Power bank imageRes binds a resource then accepts a sales override while its peer stays literal
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testProductFieldSequence0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const previous: ProductDataModel = new ProductDataModel(
        0,
        'https://store.example/power-bank/front.webp',
        $r('app.string.embed_product_title000'),
        $r('app.string.embed_product_price000')
      );
      const current: ProductDataModel = new ProductDataModel(
        0,
        'https://store.example/power-bank/front.webp',
        $r('app.string.embed_product_title000'),
        $r('app.string.embed_product_price000')
      );
      current.imageRes = $r('app.media.embed_product000');
      expect(current.id).assertEqual(0);
      expect((current.imageRes as Resource).id).assertEqual($r('app.media.embed_product000').id);
      expect((current.title as Resource).id).assertEqual($r('app.string.embed_product_title000').id);
      expect((current.price as Resource).id).assertEqual($r('app.string.embed_product_price000').id);
      expect(previous.id).assertEqual(0);
      expect(previous.imageRes).assertEqual('https://store.example/power-bank/front.webp');
      expect((previous.title as Resource).id).assertEqual($r('app.string.embed_product_title000').id);
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price000').id);
      current.imageRes = 'file://cache/power-bank/rear.webp';
      const later: ProductDataModel = new ProductDataModel(
        1,
        $r('app.media.embed_product001'),
        $r('app.string.embed_product_title001'),
        $r('app.string.embed_product_price001')
      );
      expect(current.id).assertEqual(0);
      expect(current.imageRes).assertEqual('file://cache/power-bank/rear.webp');
      expect((current.title as Resource).id).assertEqual($r('app.string.embed_product_title000').id);
      expect((current.price as Resource).id).assertEqual($r('app.string.embed_product_price000').id);
      expect(previous.id).assertEqual(0);
      expect(previous.imageRes).assertEqual('https://store.example/power-bank/front.webp');
      expect((previous.title as Resource).id).assertEqual($r('app.string.embed_product_title000').id);
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price000').id);
      expect(later.id).assertEqual(1);
      expect((later.imageRes as Resource).id).assertEqual($r('app.media.embed_product001').id);
      expect((later.title as Resource).id).assertEqual($r('app.string.embed_product_title001').id);
      expect((later.price as Resource).id).assertEqual($r('app.string.embed_product_price001').id);
      expect(current === previous).assertFalse();
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_FIELDSEQUENCE_0003
     * @tc.name testProductFieldSequence0003
     * @tc.desc Power bank imageRes clears a pending display then rebinds a resource without changing its peer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testProductFieldSequence0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const previous: ProductDataModel = new ProductDataModel(
        0,
        $r('app.media.embed_product000'),
        $r('app.string.embed_product_title000'),
        $r('app.string.embed_product_price000')
      );
      const current: ProductDataModel = new ProductDataModel(
        0,
        $r('app.media.embed_product000'),
        $r('app.string.embed_product_title000'),
        $r('app.string.embed_product_price000')
      );
      current.imageRes = '';
      expect(current.id).assertEqual(0);
      expect(current.imageRes).assertEqual('');
      expect((current.title as Resource).id).assertEqual($r('app.string.embed_product_title000').id);
      expect((current.price as Resource).id).assertEqual($r('app.string.embed_product_price000').id);
      expect(previous.id).assertEqual(0);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product000').id);
      expect((previous.title as Resource).id).assertEqual($r('app.string.embed_product_title000').id);
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price000').id);
      current.imageRes = $r('app.media.embed_product001');
      const later: ProductDataModel = new ProductDataModel(
        1,
        $r('app.media.embed_product001'),
        $r('app.string.embed_product_title001'),
        $r('app.string.embed_product_price001')
      );
      expect(current.id).assertEqual(0);
      expect((current.imageRes as Resource).id).assertEqual($r('app.media.embed_product001').id);
      expect((current.title as Resource).id).assertEqual($r('app.string.embed_product_title000').id);
      expect((current.price as Resource).id).assertEqual($r('app.string.embed_product_price000').id);
      expect(previous.id).assertEqual(0);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product000').id);
      expect((previous.title as Resource).id).assertEqual($r('app.string.embed_product_title000').id);
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price000').id);
      expect(later.id).assertEqual(1);
      expect((later.imageRes as Resource).id).assertEqual($r('app.media.embed_product001').id);
      expect((later.title as Resource).id).assertEqual($r('app.string.embed_product_title001').id);
      expect((later.price as Resource).id).assertEqual($r('app.string.embed_product_price001').id);
      expect(current === previous).assertFalse();
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_FIELDSEQUENCE_0004
     * @tc.name testProductFieldSequence0004
     * @tc.desc Power bank title detaches to a literal then restores its resource without changing its peer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testProductFieldSequence0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const previous: ProductDataModel = new ProductDataModel(
        0,
        $r('app.media.embed_product000'),
        $r('app.string.embed_product_title000'),
        $r('app.string.embed_product_price000')
      );
      const current: ProductDataModel = new ProductDataModel(
        0,
        $r('app.media.embed_product000'),
        $r('app.string.embed_product_title000'),
        $r('app.string.embed_product_price000')
      );
      current.title = 'Power bank 20000 mAh - graphite';
      expect(current.id).assertEqual(0);
      expect((current.imageRes as Resource).id).assertEqual($r('app.media.embed_product000').id);
      expect(current.title).assertEqual('Power bank 20000 mAh - graphite');
      expect((current.price as Resource).id).assertEqual($r('app.string.embed_product_price000').id);
      expect(previous.id).assertEqual(0);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product000').id);
      expect((previous.title as Resource).id).assertEqual($r('app.string.embed_product_title000').id);
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price000').id);
      current.title = $r('app.string.embed_product_title000');
      const later: ProductDataModel = new ProductDataModel(
        1,
        $r('app.media.embed_product001'),
        $r('app.string.embed_product_title001'),
        $r('app.string.embed_product_price001')
      );
      expect(current.id).assertEqual(0);
      expect((current.imageRes as Resource).id).assertEqual($r('app.media.embed_product000').id);
      expect((current.title as Resource).id).assertEqual($r('app.string.embed_product_title000').id);
      expect((current.price as Resource).id).assertEqual($r('app.string.embed_product_price000').id);
      expect(previous.id).assertEqual(0);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product000').id);
      expect((previous.title as Resource).id).assertEqual($r('app.string.embed_product_title000').id);
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price000').id);
      expect(later.id).assertEqual(1);
      expect((later.imageRes as Resource).id).assertEqual($r('app.media.embed_product001').id);
      expect((later.title as Resource).id).assertEqual($r('app.string.embed_product_title001').id);
      expect((later.price as Resource).id).assertEqual($r('app.string.embed_product_price001').id);
      expect(current === previous).assertFalse();
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_FIELDSEQUENCE_0005
     * @tc.name testProductFieldSequence0005
     * @tc.desc Power bank title binds a resource then accepts a sales override while its peer stays literal
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testProductFieldSequence0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const previous: ProductDataModel = new ProductDataModel(
        0,
        $r('app.media.embed_product000'),
        'Power bank 20000 mAh - graphite',
        $r('app.string.embed_product_price000')
      );
      const current: ProductDataModel = new ProductDataModel(
        0,
        $r('app.media.embed_product000'),
        'Power bank 20000 mAh - graphite',
        $r('app.string.embed_product_price000')
      );
      current.title = $r('app.string.embed_product_title000');
      expect(current.id).assertEqual(0);
      expect((current.imageRes as Resource).id).assertEqual($r('app.media.embed_product000').id);
      expect((current.title as Resource).id).assertEqual($r('app.string.embed_product_title000').id);
      expect((current.price as Resource).id).assertEqual($r('app.string.embed_product_price000').id);
      expect(previous.id).assertEqual(0);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product000').id);
      expect(previous.title).assertEqual('Power bank 20000 mAh - graphite');
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price000').id);
      current.title = 'Power bank 20000 mAh - gift set';
      const later: ProductDataModel = new ProductDataModel(
        1,
        $r('app.media.embed_product001'),
        $r('app.string.embed_product_title001'),
        $r('app.string.embed_product_price001')
      );
      expect(current.id).assertEqual(0);
      expect((current.imageRes as Resource).id).assertEqual($r('app.media.embed_product000').id);
      expect(current.title).assertEqual('Power bank 20000 mAh - gift set');
      expect((current.price as Resource).id).assertEqual($r('app.string.embed_product_price000').id);
      expect(previous.id).assertEqual(0);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product000').id);
      expect(previous.title).assertEqual('Power bank 20000 mAh - graphite');
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price000').id);
      expect(later.id).assertEqual(1);
      expect((later.imageRes as Resource).id).assertEqual($r('app.media.embed_product001').id);
      expect((later.title as Resource).id).assertEqual($r('app.string.embed_product_title001').id);
      expect((later.price as Resource).id).assertEqual($r('app.string.embed_product_price001').id);
      expect(current === previous).assertFalse();
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_FIELDSEQUENCE_0006
     * @tc.name testProductFieldSequence0006
     * @tc.desc Power bank title clears a pending display then rebinds a resource without changing its peer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testProductFieldSequence0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const previous: ProductDataModel = new ProductDataModel(
        0,
        $r('app.media.embed_product000'),
        $r('app.string.embed_product_title000'),
        $r('app.string.embed_product_price000')
      );
      const current: ProductDataModel = new ProductDataModel(
        0,
        $r('app.media.embed_product000'),
        $r('app.string.embed_product_title000'),
        $r('app.string.embed_product_price000')
      );
      current.title = '';
      expect(current.id).assertEqual(0);
      expect((current.imageRes as Resource).id).assertEqual($r('app.media.embed_product000').id);
      expect(current.title).assertEqual('');
      expect((current.price as Resource).id).assertEqual($r('app.string.embed_product_price000').id);
      expect(previous.id).assertEqual(0);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product000').id);
      expect((previous.title as Resource).id).assertEqual($r('app.string.embed_product_title000').id);
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price000').id);
      current.title = $r('app.string.embed_product_title001');
      const later: ProductDataModel = new ProductDataModel(
        1,
        $r('app.media.embed_product001'),
        $r('app.string.embed_product_title001'),
        $r('app.string.embed_product_price001')
      );
      expect(current.id).assertEqual(0);
      expect((current.imageRes as Resource).id).assertEqual($r('app.media.embed_product000').id);
      expect((current.title as Resource).id).assertEqual($r('app.string.embed_product_title001').id);
      expect((current.price as Resource).id).assertEqual($r('app.string.embed_product_price000').id);
      expect(previous.id).assertEqual(0);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product000').id);
      expect((previous.title as Resource).id).assertEqual($r('app.string.embed_product_title000').id);
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price000').id);
      expect(later.id).assertEqual(1);
      expect((later.imageRes as Resource).id).assertEqual($r('app.media.embed_product001').id);
      expect((later.title as Resource).id).assertEqual($r('app.string.embed_product_title001').id);
      expect((later.price as Resource).id).assertEqual($r('app.string.embed_product_price001').id);
      expect(current === previous).assertFalse();
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_FIELDSEQUENCE_0007
     * @tc.name testProductFieldSequence0007
     * @tc.desc Power bank price detaches to a literal then restores its resource without changing its peer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testProductFieldSequence0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const previous: ProductDataModel = new ProductDataModel(
        0,
        $r('app.media.embed_product000'),
        $r('app.string.embed_product_title000'),
        $r('app.string.embed_product_price000')
      );
      const current: ProductDataModel = new ProductDataModel(
        0,
        $r('app.media.embed_product000'),
        $r('app.string.embed_product_title000'),
        $r('app.string.embed_product_price000')
      );
      current.price = 'USD 29.90';
      expect(current.id).assertEqual(0);
      expect((current.imageRes as Resource).id).assertEqual($r('app.media.embed_product000').id);
      expect((current.title as Resource).id).assertEqual($r('app.string.embed_product_title000').id);
      expect(current.price).assertEqual('USD 29.90');
      expect(previous.id).assertEqual(0);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product000').id);
      expect((previous.title as Resource).id).assertEqual($r('app.string.embed_product_title000').id);
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price000').id);
      current.price = $r('app.string.embed_product_price000');
      const later: ProductDataModel = new ProductDataModel(
        1,
        $r('app.media.embed_product001'),
        $r('app.string.embed_product_title001'),
        $r('app.string.embed_product_price001')
      );
      expect(current.id).assertEqual(0);
      expect((current.imageRes as Resource).id).assertEqual($r('app.media.embed_product000').id);
      expect((current.title as Resource).id).assertEqual($r('app.string.embed_product_title000').id);
      expect((current.price as Resource).id).assertEqual($r('app.string.embed_product_price000').id);
      expect(previous.id).assertEqual(0);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product000').id);
      expect((previous.title as Resource).id).assertEqual($r('app.string.embed_product_title000').id);
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price000').id);
      expect(later.id).assertEqual(1);
      expect((later.imageRes as Resource).id).assertEqual($r('app.media.embed_product001').id);
      expect((later.title as Resource).id).assertEqual($r('app.string.embed_product_title001').id);
      expect((later.price as Resource).id).assertEqual($r('app.string.embed_product_price001').id);
      expect(current === previous).assertFalse();
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_FIELDSEQUENCE_0008
     * @tc.name testProductFieldSequence0008
     * @tc.desc Power bank price binds a resource then accepts a sales override while its peer stays literal
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testProductFieldSequence0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const previous: ProductDataModel = new ProductDataModel(
        0,
        $r('app.media.embed_product000'),
        $r('app.string.embed_product_title000'),
        'USD 29.90'
      );
      const current: ProductDataModel = new ProductDataModel(
        0,
        $r('app.media.embed_product000'),
        $r('app.string.embed_product_title000'),
        'USD 29.90'
      );
      current.price = $r('app.string.embed_product_price000');
      expect(current.id).assertEqual(0);
      expect((current.imageRes as Resource).id).assertEqual($r('app.media.embed_product000').id);
      expect((current.title as Resource).id).assertEqual($r('app.string.embed_product_title000').id);
      expect((current.price as Resource).id).assertEqual($r('app.string.embed_product_price000').id);
      expect(previous.id).assertEqual(0);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product000').id);
      expect((previous.title as Resource).id).assertEqual($r('app.string.embed_product_title000').id);
      expect(previous.price).assertEqual('USD 29.90');
      current.price = 'USD 24.90 member';
      const later: ProductDataModel = new ProductDataModel(
        1,
        $r('app.media.embed_product001'),
        $r('app.string.embed_product_title001'),
        $r('app.string.embed_product_price001')
      );
      expect(current.id).assertEqual(0);
      expect((current.imageRes as Resource).id).assertEqual($r('app.media.embed_product000').id);
      expect((current.title as Resource).id).assertEqual($r('app.string.embed_product_title000').id);
      expect(current.price).assertEqual('USD 24.90 member');
      expect(previous.id).assertEqual(0);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product000').id);
      expect((previous.title as Resource).id).assertEqual($r('app.string.embed_product_title000').id);
      expect(previous.price).assertEqual('USD 29.90');
      expect(later.id).assertEqual(1);
      expect((later.imageRes as Resource).id).assertEqual($r('app.media.embed_product001').id);
      expect((later.title as Resource).id).assertEqual($r('app.string.embed_product_title001').id);
      expect((later.price as Resource).id).assertEqual($r('app.string.embed_product_price001').id);
      expect(current === previous).assertFalse();
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_FIELDSEQUENCE_0009
     * @tc.name testProductFieldSequence0009
     * @tc.desc Power bank price clears a pending display then rebinds a resource without changing its peer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testProductFieldSequence0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const previous: ProductDataModel = new ProductDataModel(
        0,
        $r('app.media.embed_product000'),
        $r('app.string.embed_product_title000'),
        $r('app.string.embed_product_price000')
      );
      const current: ProductDataModel = new ProductDataModel(
        0,
        $r('app.media.embed_product000'),
        $r('app.string.embed_product_title000'),
        $r('app.string.embed_product_price000')
      );
      current.price = '';
      expect(current.id).assertEqual(0);
      expect((current.imageRes as Resource).id).assertEqual($r('app.media.embed_product000').id);
      expect((current.title as Resource).id).assertEqual($r('app.string.embed_product_title000').id);
      expect(current.price).assertEqual('');
      expect(previous.id).assertEqual(0);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product000').id);
      expect((previous.title as Resource).id).assertEqual($r('app.string.embed_product_title000').id);
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price000').id);
      current.price = $r('app.string.embed_product_price001');
      const later: ProductDataModel = new ProductDataModel(
        1,
        $r('app.media.embed_product001'),
        $r('app.string.embed_product_title001'),
        $r('app.string.embed_product_price001')
      );
      expect(current.id).assertEqual(0);
      expect((current.imageRes as Resource).id).assertEqual($r('app.media.embed_product000').id);
      expect((current.title as Resource).id).assertEqual($r('app.string.embed_product_title000').id);
      expect((current.price as Resource).id).assertEqual($r('app.string.embed_product_price001').id);
      expect(previous.id).assertEqual(0);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product000').id);
      expect((previous.title as Resource).id).assertEqual($r('app.string.embed_product_title000').id);
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price000').id);
      expect(later.id).assertEqual(1);
      expect((later.imageRes as Resource).id).assertEqual($r('app.media.embed_product001').id);
      expect((later.title as Resource).id).assertEqual($r('app.string.embed_product_title001').id);
      expect((later.price as Resource).id).assertEqual($r('app.string.embed_product_price001').id);
      expect(current === previous).assertFalse();
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_FIELDSEQUENCE_0010
     * @tc.name testProductFieldSequence0010
     * @tc.desc Notebook imageRes detaches to a literal then restores its resource without changing its peer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testProductFieldSequence0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const previous: ProductDataModel = new ProductDataModel(
        1,
        $r('app.media.embed_product001'),
        $r('app.string.embed_product_title001'),
        $r('app.string.embed_product_price001')
      );
      const current: ProductDataModel = new ProductDataModel(
        1,
        $r('app.media.embed_product001'),
        $r('app.string.embed_product_title001'),
        $r('app.string.embed_product_price001')
      );
      current.imageRes = 'file://cache/notebook/front.webp';
      expect(current.id).assertEqual(1);
      expect(current.imageRes).assertEqual('file://cache/notebook/front.webp');
      expect((current.title as Resource).id).assertEqual($r('app.string.embed_product_title001').id);
      expect((current.price as Resource).id).assertEqual($r('app.string.embed_product_price001').id);
      expect(previous.id).assertEqual(1);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product001').id);
      expect((previous.title as Resource).id).assertEqual($r('app.string.embed_product_title001').id);
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price001').id);
      current.imageRes = $r('app.media.embed_product001');
      const later: ProductDataModel = new ProductDataModel(
        2,
        $r('app.media.embed_product002'),
        $r('app.string.embed_product_title002'),
        $r('app.string.embed_product_price002')
      );
      expect(current.id).assertEqual(1);
      expect((current.imageRes as Resource).id).assertEqual($r('app.media.embed_product001').id);
      expect((current.title as Resource).id).assertEqual($r('app.string.embed_product_title001').id);
      expect((current.price as Resource).id).assertEqual($r('app.string.embed_product_price001').id);
      expect(previous.id).assertEqual(1);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product001').id);
      expect((previous.title as Resource).id).assertEqual($r('app.string.embed_product_title001').id);
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price001').id);
      expect(later.id).assertEqual(2);
      expect((later.imageRes as Resource).id).assertEqual($r('app.media.embed_product002').id);
      expect((later.title as Resource).id).assertEqual($r('app.string.embed_product_title002').id);
      expect((later.price as Resource).id).assertEqual($r('app.string.embed_product_price002').id);
      expect(current === previous).assertFalse();
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_FIELDSEQUENCE_0011
     * @tc.name testProductFieldSequence0011
     * @tc.desc Notebook imageRes binds a resource then accepts a sales override while its peer stays literal
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testProductFieldSequence0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const previous: ProductDataModel = new ProductDataModel(
        1,
        'file://cache/notebook/front.webp',
        $r('app.string.embed_product_title001'),
        $r('app.string.embed_product_price001')
      );
      const current: ProductDataModel = new ProductDataModel(
        1,
        'file://cache/notebook/front.webp',
        $r('app.string.embed_product_title001'),
        $r('app.string.embed_product_price001')
      );
      current.imageRes = $r('app.media.embed_product001');
      expect(current.id).assertEqual(1);
      expect((current.imageRes as Resource).id).assertEqual($r('app.media.embed_product001').id);
      expect((current.title as Resource).id).assertEqual($r('app.string.embed_product_title001').id);
      expect((current.price as Resource).id).assertEqual($r('app.string.embed_product_price001').id);
      expect(previous.id).assertEqual(1);
      expect(previous.imageRes).assertEqual('file://cache/notebook/front.webp');
      expect((previous.title as Resource).id).assertEqual($r('app.string.embed_product_title001').id);
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price001').id);
      current.imageRes = 'https://store.example/notebook/side.webp';
      const later: ProductDataModel = new ProductDataModel(
        2,
        $r('app.media.embed_product002'),
        $r('app.string.embed_product_title002'),
        $r('app.string.embed_product_price002')
      );
      expect(current.id).assertEqual(1);
      expect(current.imageRes).assertEqual('https://store.example/notebook/side.webp');
      expect((current.title as Resource).id).assertEqual($r('app.string.embed_product_title001').id);
      expect((current.price as Resource).id).assertEqual($r('app.string.embed_product_price001').id);
      expect(previous.id).assertEqual(1);
      expect(previous.imageRes).assertEqual('file://cache/notebook/front.webp');
      expect((previous.title as Resource).id).assertEqual($r('app.string.embed_product_title001').id);
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price001').id);
      expect(later.id).assertEqual(2);
      expect((later.imageRes as Resource).id).assertEqual($r('app.media.embed_product002').id);
      expect((later.title as Resource).id).assertEqual($r('app.string.embed_product_title002').id);
      expect((later.price as Resource).id).assertEqual($r('app.string.embed_product_price002').id);
      expect(current === previous).assertFalse();
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_FIELDSEQUENCE_0012
     * @tc.name testProductFieldSequence0012
     * @tc.desc Notebook imageRes clears a pending display then rebinds a resource without changing its peer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testProductFieldSequence0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const previous: ProductDataModel = new ProductDataModel(
        1,
        $r('app.media.embed_product001'),
        $r('app.string.embed_product_title001'),
        $r('app.string.embed_product_price001')
      );
      const current: ProductDataModel = new ProductDataModel(
        1,
        $r('app.media.embed_product001'),
        $r('app.string.embed_product_title001'),
        $r('app.string.embed_product_price001')
      );
      current.imageRes = '';
      expect(current.id).assertEqual(1);
      expect(current.imageRes).assertEqual('');
      expect((current.title as Resource).id).assertEqual($r('app.string.embed_product_title001').id);
      expect((current.price as Resource).id).assertEqual($r('app.string.embed_product_price001').id);
      expect(previous.id).assertEqual(1);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product001').id);
      expect((previous.title as Resource).id).assertEqual($r('app.string.embed_product_title001').id);
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price001').id);
      current.imageRes = $r('app.media.embed_product002');
      const later: ProductDataModel = new ProductDataModel(
        2,
        $r('app.media.embed_product002'),
        $r('app.string.embed_product_title002'),
        $r('app.string.embed_product_price002')
      );
      expect(current.id).assertEqual(1);
      expect((current.imageRes as Resource).id).assertEqual($r('app.media.embed_product002').id);
      expect((current.title as Resource).id).assertEqual($r('app.string.embed_product_title001').id);
      expect((current.price as Resource).id).assertEqual($r('app.string.embed_product_price001').id);
      expect(previous.id).assertEqual(1);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product001').id);
      expect((previous.title as Resource).id).assertEqual($r('app.string.embed_product_title001').id);
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price001').id);
      expect(later.id).assertEqual(2);
      expect((later.imageRes as Resource).id).assertEqual($r('app.media.embed_product002').id);
      expect((later.title as Resource).id).assertEqual($r('app.string.embed_product_title002').id);
      expect((later.price as Resource).id).assertEqual($r('app.string.embed_product_price002').id);
      expect(current === previous).assertFalse();
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_FIELDSEQUENCE_0013
     * @tc.name testProductFieldSequence0013
     * @tc.desc Notebook title detaches to a literal then restores its resource without changing its peer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testProductFieldSequence0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const previous: ProductDataModel = new ProductDataModel(
        1,
        $r('app.media.embed_product001'),
        $r('app.string.embed_product_title001'),
        $r('app.string.embed_product_price001')
      );
      const current: ProductDataModel = new ProductDataModel(
        1,
        $r('app.media.embed_product001'),
        $r('app.string.embed_product_title001'),
        $r('app.string.embed_product_price001')
      );
      current.title = 'Notebook 16 GB / 512 GB - refurbished';
      expect(current.id).assertEqual(1);
      expect((current.imageRes as Resource).id).assertEqual($r('app.media.embed_product001').id);
      expect(current.title).assertEqual('Notebook 16 GB / 512 GB - refurbished');
      expect((current.price as Resource).id).assertEqual($r('app.string.embed_product_price001').id);
      expect(previous.id).assertEqual(1);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product001').id);
      expect((previous.title as Resource).id).assertEqual($r('app.string.embed_product_title001').id);
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price001').id);
      current.title = $r('app.string.embed_product_title001');
      const later: ProductDataModel = new ProductDataModel(
        2,
        $r('app.media.embed_product002'),
        $r('app.string.embed_product_title002'),
        $r('app.string.embed_product_price002')
      );
      expect(current.id).assertEqual(1);
      expect((current.imageRes as Resource).id).assertEqual($r('app.media.embed_product001').id);
      expect((current.title as Resource).id).assertEqual($r('app.string.embed_product_title001').id);
      expect((current.price as Resource).id).assertEqual($r('app.string.embed_product_price001').id);
      expect(previous.id).assertEqual(1);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product001').id);
      expect((previous.title as Resource).id).assertEqual($r('app.string.embed_product_title001').id);
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price001').id);
      expect(later.id).assertEqual(2);
      expect((later.imageRes as Resource).id).assertEqual($r('app.media.embed_product002').id);
      expect((later.title as Resource).id).assertEqual($r('app.string.embed_product_title002').id);
      expect((later.price as Resource).id).assertEqual($r('app.string.embed_product_price002').id);
      expect(current === previous).assertFalse();
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_FIELDSEQUENCE_0014
     * @tc.name testProductFieldSequence0014
     * @tc.desc Notebook title binds a resource then accepts a sales override while its peer stays literal
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testProductFieldSequence0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const previous: ProductDataModel = new ProductDataModel(
        1,
        $r('app.media.embed_product001'),
        'Notebook 16 GB / 512 GB - refurbished',
        $r('app.string.embed_product_price001')
      );
      const current: ProductDataModel = new ProductDataModel(
        1,
        $r('app.media.embed_product001'),
        'Notebook 16 GB / 512 GB - refurbished',
        $r('app.string.embed_product_price001')
      );
      current.title = $r('app.string.embed_product_title001');
      expect(current.id).assertEqual(1);
      expect((current.imageRes as Resource).id).assertEqual($r('app.media.embed_product001').id);
      expect((current.title as Resource).id).assertEqual($r('app.string.embed_product_title001').id);
      expect((current.price as Resource).id).assertEqual($r('app.string.embed_product_price001').id);
      expect(previous.id).assertEqual(1);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product001').id);
      expect(previous.title).assertEqual('Notebook 16 GB / 512 GB - refurbished');
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price001').id);
      current.title = 'Notebook 16 GB / 512 GB - outlet';
      const later: ProductDataModel = new ProductDataModel(
        2,
        $r('app.media.embed_product002'),
        $r('app.string.embed_product_title002'),
        $r('app.string.embed_product_price002')
      );
      expect(current.id).assertEqual(1);
      expect((current.imageRes as Resource).id).assertEqual($r('app.media.embed_product001').id);
      expect(current.title).assertEqual('Notebook 16 GB / 512 GB - outlet');
      expect((current.price as Resource).id).assertEqual($r('app.string.embed_product_price001').id);
      expect(previous.id).assertEqual(1);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product001').id);
      expect(previous.title).assertEqual('Notebook 16 GB / 512 GB - refurbished');
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price001').id);
      expect(later.id).assertEqual(2);
      expect((later.imageRes as Resource).id).assertEqual($r('app.media.embed_product002').id);
      expect((later.title as Resource).id).assertEqual($r('app.string.embed_product_title002').id);
      expect((later.price as Resource).id).assertEqual($r('app.string.embed_product_price002').id);
      expect(current === previous).assertFalse();
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_FIELDSEQUENCE_0015
     * @tc.name testProductFieldSequence0015
     * @tc.desc Notebook title clears a pending display then rebinds a resource without changing its peer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testProductFieldSequence0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const previous: ProductDataModel = new ProductDataModel(
        1,
        $r('app.media.embed_product001'),
        $r('app.string.embed_product_title001'),
        $r('app.string.embed_product_price001')
      );
      const current: ProductDataModel = new ProductDataModel(
        1,
        $r('app.media.embed_product001'),
        $r('app.string.embed_product_title001'),
        $r('app.string.embed_product_price001')
      );
      current.title = '';
      expect(current.id).assertEqual(1);
      expect((current.imageRes as Resource).id).assertEqual($r('app.media.embed_product001').id);
      expect(current.title).assertEqual('');
      expect((current.price as Resource).id).assertEqual($r('app.string.embed_product_price001').id);
      expect(previous.id).assertEqual(1);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product001').id);
      expect((previous.title as Resource).id).assertEqual($r('app.string.embed_product_title001').id);
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price001').id);
      current.title = $r('app.string.embed_product_title002');
      const later: ProductDataModel = new ProductDataModel(
        2,
        $r('app.media.embed_product002'),
        $r('app.string.embed_product_title002'),
        $r('app.string.embed_product_price002')
      );
      expect(current.id).assertEqual(1);
      expect((current.imageRes as Resource).id).assertEqual($r('app.media.embed_product001').id);
      expect((current.title as Resource).id).assertEqual($r('app.string.embed_product_title002').id);
      expect((current.price as Resource).id).assertEqual($r('app.string.embed_product_price001').id);
      expect(previous.id).assertEqual(1);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product001').id);
      expect((previous.title as Resource).id).assertEqual($r('app.string.embed_product_title001').id);
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price001').id);
      expect(later.id).assertEqual(2);
      expect((later.imageRes as Resource).id).assertEqual($r('app.media.embed_product002').id);
      expect((later.title as Resource).id).assertEqual($r('app.string.embed_product_title002').id);
      expect((later.price as Resource).id).assertEqual($r('app.string.embed_product_price002').id);
      expect(current === previous).assertFalse();
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_FIELDSEQUENCE_0016
     * @tc.name testProductFieldSequence0016
     * @tc.desc Notebook price detaches to a literal then restores its resource without changing its peer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testProductFieldSequence0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const previous: ProductDataModel = new ProductDataModel(
        1,
        $r('app.media.embed_product001'),
        $r('app.string.embed_product_title001'),
        $r('app.string.embed_product_price001')
      );
      const current: ProductDataModel = new ProductDataModel(
        1,
        $r('app.media.embed_product001'),
        $r('app.string.embed_product_title001'),
        $r('app.string.embed_product_price001')
      );
      current.price = 'EUR 1 299,00';
      expect(current.id).assertEqual(1);
      expect((current.imageRes as Resource).id).assertEqual($r('app.media.embed_product001').id);
      expect((current.title as Resource).id).assertEqual($r('app.string.embed_product_title001').id);
      expect(current.price).assertEqual('EUR 1 299,00');
      expect(previous.id).assertEqual(1);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product001').id);
      expect((previous.title as Resource).id).assertEqual($r('app.string.embed_product_title001').id);
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price001').id);
      current.price = $r('app.string.embed_product_price001');
      const later: ProductDataModel = new ProductDataModel(
        2,
        $r('app.media.embed_product002'),
        $r('app.string.embed_product_title002'),
        $r('app.string.embed_product_price002')
      );
      expect(current.id).assertEqual(1);
      expect((current.imageRes as Resource).id).assertEqual($r('app.media.embed_product001').id);
      expect((current.title as Resource).id).assertEqual($r('app.string.embed_product_title001').id);
      expect((current.price as Resource).id).assertEqual($r('app.string.embed_product_price001').id);
      expect(previous.id).assertEqual(1);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product001').id);
      expect((previous.title as Resource).id).assertEqual($r('app.string.embed_product_title001').id);
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price001').id);
      expect(later.id).assertEqual(2);
      expect((later.imageRes as Resource).id).assertEqual($r('app.media.embed_product002').id);
      expect((later.title as Resource).id).assertEqual($r('app.string.embed_product_title002').id);
      expect((later.price as Resource).id).assertEqual($r('app.string.embed_product_price002').id);
      expect(current === previous).assertFalse();
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_FIELDSEQUENCE_0017
     * @tc.name testProductFieldSequence0017
     * @tc.desc Notebook price binds a resource then accepts a sales override while its peer stays literal
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testProductFieldSequence0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const previous: ProductDataModel = new ProductDataModel(
        1,
        $r('app.media.embed_product001'),
        $r('app.string.embed_product_title001'),
        'EUR 1 299,00'
      );
      const current: ProductDataModel = new ProductDataModel(
        1,
        $r('app.media.embed_product001'),
        $r('app.string.embed_product_title001'),
        'EUR 1 299,00'
      );
      current.price = $r('app.string.embed_product_price001');
      expect(current.id).assertEqual(1);
      expect((current.imageRes as Resource).id).assertEqual($r('app.media.embed_product001').id);
      expect((current.title as Resource).id).assertEqual($r('app.string.embed_product_title001').id);
      expect((current.price as Resource).id).assertEqual($r('app.string.embed_product_price001').id);
      expect(previous.id).assertEqual(1);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product001').id);
      expect((previous.title as Resource).id).assertEqual($r('app.string.embed_product_title001').id);
      expect(previous.price).assertEqual('EUR 1 299,00');
      current.price = 'EUR 999,00 sale';
      const later: ProductDataModel = new ProductDataModel(
        2,
        $r('app.media.embed_product002'),
        $r('app.string.embed_product_title002'),
        $r('app.string.embed_product_price002')
      );
      expect(current.id).assertEqual(1);
      expect((current.imageRes as Resource).id).assertEqual($r('app.media.embed_product001').id);
      expect((current.title as Resource).id).assertEqual($r('app.string.embed_product_title001').id);
      expect(current.price).assertEqual('EUR 999,00 sale');
      expect(previous.id).assertEqual(1);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product001').id);
      expect((previous.title as Resource).id).assertEqual($r('app.string.embed_product_title001').id);
      expect(previous.price).assertEqual('EUR 1 299,00');
      expect(later.id).assertEqual(2);
      expect((later.imageRes as Resource).id).assertEqual($r('app.media.embed_product002').id);
      expect((later.title as Resource).id).assertEqual($r('app.string.embed_product_title002').id);
      expect((later.price as Resource).id).assertEqual($r('app.string.embed_product_price002').id);
      expect(current === previous).assertFalse();
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_FIELDSEQUENCE_0018
     * @tc.name testProductFieldSequence0018
     * @tc.desc Notebook price clears a pending display then rebinds a resource without changing its peer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testProductFieldSequence0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const previous: ProductDataModel = new ProductDataModel(
        1,
        $r('app.media.embed_product001'),
        $r('app.string.embed_product_title001'),
        $r('app.string.embed_product_price001')
      );
      const current: ProductDataModel = new ProductDataModel(
        1,
        $r('app.media.embed_product001'),
        $r('app.string.embed_product_title001'),
        $r('app.string.embed_product_price001')
      );
      current.price = '';
      expect(current.id).assertEqual(1);
      expect((current.imageRes as Resource).id).assertEqual($r('app.media.embed_product001').id);
      expect((current.title as Resource).id).assertEqual($r('app.string.embed_product_title001').id);
      expect(current.price).assertEqual('');
      expect(previous.id).assertEqual(1);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product001').id);
      expect((previous.title as Resource).id).assertEqual($r('app.string.embed_product_title001').id);
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price001').id);
      current.price = $r('app.string.embed_product_price002');
      const later: ProductDataModel = new ProductDataModel(
        2,
        $r('app.media.embed_product002'),
        $r('app.string.embed_product_title002'),
        $r('app.string.embed_product_price002')
      );
      expect(current.id).assertEqual(1);
      expect((current.imageRes as Resource).id).assertEqual($r('app.media.embed_product001').id);
      expect((current.title as Resource).id).assertEqual($r('app.string.embed_product_title001').id);
      expect((current.price as Resource).id).assertEqual($r('app.string.embed_product_price002').id);
      expect(previous.id).assertEqual(1);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product001').id);
      expect((previous.title as Resource).id).assertEqual($r('app.string.embed_product_title001').id);
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price001').id);
      expect(later.id).assertEqual(2);
      expect((later.imageRes as Resource).id).assertEqual($r('app.media.embed_product002').id);
      expect((later.title as Resource).id).assertEqual($r('app.string.embed_product_title002').id);
      expect((later.price as Resource).id).assertEqual($r('app.string.embed_product_price002').id);
      expect(current === previous).assertFalse();
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_FIELDSEQUENCE_0019
     * @tc.name testProductFieldSequence0019
     * @tc.desc Phone imageRes detaches to a literal then restores its resource without changing its peer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testProductFieldSequence0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const previous: ProductDataModel = new ProductDataModel(
        2,
        $r('app.media.embed_product002'),
        $r('app.string.embed_product_title002'),
        $r('app.string.embed_product_price002')
      );
      const current: ProductDataModel = new ProductDataModel(
        2,
        $r('app.media.embed_product002'),
        $r('app.string.embed_product_title002'),
        $r('app.string.embed_product_price002')
      );
      current.imageRes = 'https://store.example/phone/front.webp';
      expect(current.id).assertEqual(2);
      expect(current.imageRes).assertEqual('https://store.example/phone/front.webp');
      expect((current.title as Resource).id).assertEqual($r('app.string.embed_product_title002').id);
      expect((current.price as Resource).id).assertEqual($r('app.string.embed_product_price002').id);
      expect(previous.id).assertEqual(2);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product002').id);
      expect((previous.title as Resource).id).assertEqual($r('app.string.embed_product_title002').id);
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price002').id);
      current.imageRes = $r('app.media.embed_product002');
      const later: ProductDataModel = new ProductDataModel(
        3,
        $r('app.media.embed_product003'),
        $r('app.string.embed_product_title003'),
        $r('app.string.embed_product_price003')
      );
      expect(current.id).assertEqual(2);
      expect((current.imageRes as Resource).id).assertEqual($r('app.media.embed_product002').id);
      expect((current.title as Resource).id).assertEqual($r('app.string.embed_product_title002').id);
      expect((current.price as Resource).id).assertEqual($r('app.string.embed_product_price002').id);
      expect(previous.id).assertEqual(2);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product002').id);
      expect((previous.title as Resource).id).assertEqual($r('app.string.embed_product_title002').id);
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price002').id);
      expect(later.id).assertEqual(3);
      expect((later.imageRes as Resource).id).assertEqual($r('app.media.embed_product003').id);
      expect((later.title as Resource).id).assertEqual($r('app.string.embed_product_title003').id);
      expect((later.price as Resource).id).assertEqual($r('app.string.embed_product_price003').id);
      expect(current === previous).assertFalse();
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_FIELDSEQUENCE_0020
     * @tc.name testProductFieldSequence0020
     * @tc.desc Phone imageRes binds a resource then accepts a sales override while its peer stays literal
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testProductFieldSequence0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const previous: ProductDataModel = new ProductDataModel(
        2,
        'https://store.example/phone/front.webp',
        $r('app.string.embed_product_title002'),
        $r('app.string.embed_product_price002')
      );
      const current: ProductDataModel = new ProductDataModel(
        2,
        'https://store.example/phone/front.webp',
        $r('app.string.embed_product_title002'),
        $r('app.string.embed_product_price002')
      );
      current.imageRes = $r('app.media.embed_product002');
      expect(current.id).assertEqual(2);
      expect((current.imageRes as Resource).id).assertEqual($r('app.media.embed_product002').id);
      expect((current.title as Resource).id).assertEqual($r('app.string.embed_product_title002').id);
      expect((current.price as Resource).id).assertEqual($r('app.string.embed_product_price002').id);
      expect(previous.id).assertEqual(2);
      expect(previous.imageRes).assertEqual('https://store.example/phone/front.webp');
      expect((previous.title as Resource).id).assertEqual($r('app.string.embed_product_title002').id);
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price002').id);
      current.imageRes = 'file://cache/phone/rear.webp';
      const later: ProductDataModel = new ProductDataModel(
        3,
        $r('app.media.embed_product003'),
        $r('app.string.embed_product_title003'),
        $r('app.string.embed_product_price003')
      );
      expect(current.id).assertEqual(2);
      expect(current.imageRes).assertEqual('file://cache/phone/rear.webp');
      expect((current.title as Resource).id).assertEqual($r('app.string.embed_product_title002').id);
      expect((current.price as Resource).id).assertEqual($r('app.string.embed_product_price002').id);
      expect(previous.id).assertEqual(2);
      expect(previous.imageRes).assertEqual('https://store.example/phone/front.webp');
      expect((previous.title as Resource).id).assertEqual($r('app.string.embed_product_title002').id);
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price002').id);
      expect(later.id).assertEqual(3);
      expect((later.imageRes as Resource).id).assertEqual($r('app.media.embed_product003').id);
      expect((later.title as Resource).id).assertEqual($r('app.string.embed_product_title003').id);
      expect((later.price as Resource).id).assertEqual($r('app.string.embed_product_price003').id);
      expect(current === previous).assertFalse();
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_FIELDSEQUENCE_0021
     * @tc.name testProductFieldSequence0021
     * @tc.desc Phone imageRes clears a pending display then rebinds a resource without changing its peer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testProductFieldSequence0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const previous: ProductDataModel = new ProductDataModel(
        2,
        $r('app.media.embed_product002'),
        $r('app.string.embed_product_title002'),
        $r('app.string.embed_product_price002')
      );
      const current: ProductDataModel = new ProductDataModel(
        2,
        $r('app.media.embed_product002'),
        $r('app.string.embed_product_title002'),
        $r('app.string.embed_product_price002')
      );
      current.imageRes = '';
      expect(current.id).assertEqual(2);
      expect(current.imageRes).assertEqual('');
      expect((current.title as Resource).id).assertEqual($r('app.string.embed_product_title002').id);
      expect((current.price as Resource).id).assertEqual($r('app.string.embed_product_price002').id);
      expect(previous.id).assertEqual(2);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product002').id);
      expect((previous.title as Resource).id).assertEqual($r('app.string.embed_product_title002').id);
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price002').id);
      current.imageRes = $r('app.media.embed_product003');
      const later: ProductDataModel = new ProductDataModel(
        3,
        $r('app.media.embed_product003'),
        $r('app.string.embed_product_title003'),
        $r('app.string.embed_product_price003')
      );
      expect(current.id).assertEqual(2);
      expect((current.imageRes as Resource).id).assertEqual($r('app.media.embed_product003').id);
      expect((current.title as Resource).id).assertEqual($r('app.string.embed_product_title002').id);
      expect((current.price as Resource).id).assertEqual($r('app.string.embed_product_price002').id);
      expect(previous.id).assertEqual(2);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product002').id);
      expect((previous.title as Resource).id).assertEqual($r('app.string.embed_product_title002').id);
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price002').id);
      expect(later.id).assertEqual(3);
      expect((later.imageRes as Resource).id).assertEqual($r('app.media.embed_product003').id);
      expect((later.title as Resource).id).assertEqual($r('app.string.embed_product_title003').id);
      expect((later.price as Resource).id).assertEqual($r('app.string.embed_product_price003').id);
      expect(current === previous).assertFalse();
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_FIELDSEQUENCE_0022
     * @tc.name testProductFieldSequence0022
     * @tc.desc Phone title detaches to a literal then restores its resource without changing its peer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testProductFieldSequence0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const previous: ProductDataModel = new ProductDataModel(
        2,
        $r('app.media.embed_product002'),
        $r('app.string.embed_product_title002'),
        $r('app.string.embed_product_price002')
      );
      const current: ProductDataModel = new ProductDataModel(
        2,
        $r('app.media.embed_product002'),
        $r('app.string.embed_product_title002'),
        $r('app.string.embed_product_price002')
      );
      current.title = 'Phone 256 GB - midnight';
      expect(current.id).assertEqual(2);
      expect((current.imageRes as Resource).id).assertEqual($r('app.media.embed_product002').id);
      expect(current.title).assertEqual('Phone 256 GB - midnight');
      expect((current.price as Resource).id).assertEqual($r('app.string.embed_product_price002').id);
      expect(previous.id).assertEqual(2);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product002').id);
      expect((previous.title as Resource).id).assertEqual($r('app.string.embed_product_title002').id);
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price002').id);
      current.title = $r('app.string.embed_product_title002');
      const later: ProductDataModel = new ProductDataModel(
        3,
        $r('app.media.embed_product003'),
        $r('app.string.embed_product_title003'),
        $r('app.string.embed_product_price003')
      );
      expect(current.id).assertEqual(2);
      expect((current.imageRes as Resource).id).assertEqual($r('app.media.embed_product002').id);
      expect((current.title as Resource).id).assertEqual($r('app.string.embed_product_title002').id);
      expect((current.price as Resource).id).assertEqual($r('app.string.embed_product_price002').id);
      expect(previous.id).assertEqual(2);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product002').id);
      expect((previous.title as Resource).id).assertEqual($r('app.string.embed_product_title002').id);
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price002').id);
      expect(later.id).assertEqual(3);
      expect((later.imageRes as Resource).id).assertEqual($r('app.media.embed_product003').id);
      expect((later.title as Resource).id).assertEqual($r('app.string.embed_product_title003').id);
      expect((later.price as Resource).id).assertEqual($r('app.string.embed_product_price003').id);
      expect(current === previous).assertFalse();
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_FIELDSEQUENCE_0023
     * @tc.name testProductFieldSequence0023
     * @tc.desc Phone title binds a resource then accepts a sales override while its peer stays literal
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testProductFieldSequence0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const previous: ProductDataModel = new ProductDataModel(
        2,
        $r('app.media.embed_product002'),
        'Phone 256 GB - midnight',
        $r('app.string.embed_product_price002')
      );
      const current: ProductDataModel = new ProductDataModel(
        2,
        $r('app.media.embed_product002'),
        'Phone 256 GB - midnight',
        $r('app.string.embed_product_price002')
      );
      current.title = $r('app.string.embed_product_title002');
      expect(current.id).assertEqual(2);
      expect((current.imageRes as Resource).id).assertEqual($r('app.media.embed_product002').id);
      expect((current.title as Resource).id).assertEqual($r('app.string.embed_product_title002').id);
      expect((current.price as Resource).id).assertEqual($r('app.string.embed_product_price002').id);
      expect(previous.id).assertEqual(2);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product002').id);
      expect(previous.title).assertEqual('Phone 256 GB - midnight');
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price002').id);
      current.title = 'Phone 256 GB - preorder';
      const later: ProductDataModel = new ProductDataModel(
        3,
        $r('app.media.embed_product003'),
        $r('app.string.embed_product_title003'),
        $r('app.string.embed_product_price003')
      );
      expect(current.id).assertEqual(2);
      expect((current.imageRes as Resource).id).assertEqual($r('app.media.embed_product002').id);
      expect(current.title).assertEqual('Phone 256 GB - preorder');
      expect((current.price as Resource).id).assertEqual($r('app.string.embed_product_price002').id);
      expect(previous.id).assertEqual(2);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product002').id);
      expect(previous.title).assertEqual('Phone 256 GB - midnight');
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price002').id);
      expect(later.id).assertEqual(3);
      expect((later.imageRes as Resource).id).assertEqual($r('app.media.embed_product003').id);
      expect((later.title as Resource).id).assertEqual($r('app.string.embed_product_title003').id);
      expect((later.price as Resource).id).assertEqual($r('app.string.embed_product_price003').id);
      expect(current === previous).assertFalse();
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_FIELDSEQUENCE_0024
     * @tc.name testProductFieldSequence0024
     * @tc.desc Phone title clears a pending display then rebinds a resource without changing its peer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testProductFieldSequence0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const previous: ProductDataModel = new ProductDataModel(
        2,
        $r('app.media.embed_product002'),
        $r('app.string.embed_product_title002'),
        $r('app.string.embed_product_price002')
      );
      const current: ProductDataModel = new ProductDataModel(
        2,
        $r('app.media.embed_product002'),
        $r('app.string.embed_product_title002'),
        $r('app.string.embed_product_price002')
      );
      current.title = '';
      expect(current.id).assertEqual(2);
      expect((current.imageRes as Resource).id).assertEqual($r('app.media.embed_product002').id);
      expect(current.title).assertEqual('');
      expect((current.price as Resource).id).assertEqual($r('app.string.embed_product_price002').id);
      expect(previous.id).assertEqual(2);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product002').id);
      expect((previous.title as Resource).id).assertEqual($r('app.string.embed_product_title002').id);
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price002').id);
      current.title = $r('app.string.embed_product_title003');
      const later: ProductDataModel = new ProductDataModel(
        3,
        $r('app.media.embed_product003'),
        $r('app.string.embed_product_title003'),
        $r('app.string.embed_product_price003')
      );
      expect(current.id).assertEqual(2);
      expect((current.imageRes as Resource).id).assertEqual($r('app.media.embed_product002').id);
      expect((current.title as Resource).id).assertEqual($r('app.string.embed_product_title003').id);
      expect((current.price as Resource).id).assertEqual($r('app.string.embed_product_price002').id);
      expect(previous.id).assertEqual(2);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product002').id);
      expect((previous.title as Resource).id).assertEqual($r('app.string.embed_product_title002').id);
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price002').id);
      expect(later.id).assertEqual(3);
      expect((later.imageRes as Resource).id).assertEqual($r('app.media.embed_product003').id);
      expect((later.title as Resource).id).assertEqual($r('app.string.embed_product_title003').id);
      expect((later.price as Resource).id).assertEqual($r('app.string.embed_product_price003').id);
      expect(current === previous).assertFalse();
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_FIELDSEQUENCE_0025
     * @tc.name testProductFieldSequence0025
     * @tc.desc Phone price detaches to a literal then restores its resource without changing its peer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testProductFieldSequence0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const previous: ProductDataModel = new ProductDataModel(
        2,
        $r('app.media.embed_product002'),
        $r('app.string.embed_product_title002'),
        $r('app.string.embed_product_price002')
      );
      const current: ProductDataModel = new ProductDataModel(
        2,
        $r('app.media.embed_product002'),
        $r('app.string.embed_product_title002'),
        $r('app.string.embed_product_price002')
      );
      current.price = 'USD 699.00';
      expect(current.id).assertEqual(2);
      expect((current.imageRes as Resource).id).assertEqual($r('app.media.embed_product002').id);
      expect((current.title as Resource).id).assertEqual($r('app.string.embed_product_title002').id);
      expect(current.price).assertEqual('USD 699.00');
      expect(previous.id).assertEqual(2);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product002').id);
      expect((previous.title as Resource).id).assertEqual($r('app.string.embed_product_title002').id);
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price002').id);
      current.price = $r('app.string.embed_product_price002');
      const later: ProductDataModel = new ProductDataModel(
        3,
        $r('app.media.embed_product003'),
        $r('app.string.embed_product_title003'),
        $r('app.string.embed_product_price003')
      );
      expect(current.id).assertEqual(2);
      expect((current.imageRes as Resource).id).assertEqual($r('app.media.embed_product002').id);
      expect((current.title as Resource).id).assertEqual($r('app.string.embed_product_title002').id);
      expect((current.price as Resource).id).assertEqual($r('app.string.embed_product_price002').id);
      expect(previous.id).assertEqual(2);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product002').id);
      expect((previous.title as Resource).id).assertEqual($r('app.string.embed_product_title002').id);
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price002').id);
      expect(later.id).assertEqual(3);
      expect((later.imageRes as Resource).id).assertEqual($r('app.media.embed_product003').id);
      expect((later.title as Resource).id).assertEqual($r('app.string.embed_product_title003').id);
      expect((later.price as Resource).id).assertEqual($r('app.string.embed_product_price003').id);
      expect(current === previous).assertFalse();
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_FIELDSEQUENCE_0026
     * @tc.name testProductFieldSequence0026
     * @tc.desc Phone price binds a resource then accepts a sales override while its peer stays literal
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testProductFieldSequence0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const previous: ProductDataModel = new ProductDataModel(
        2,
        $r('app.media.embed_product002'),
        $r('app.string.embed_product_title002'),
        'USD 699.00'
      );
      const current: ProductDataModel = new ProductDataModel(
        2,
        $r('app.media.embed_product002'),
        $r('app.string.embed_product_title002'),
        'USD 699.00'
      );
      current.price = $r('app.string.embed_product_price002');
      expect(current.id).assertEqual(2);
      expect((current.imageRes as Resource).id).assertEqual($r('app.media.embed_product002').id);
      expect((current.title as Resource).id).assertEqual($r('app.string.embed_product_title002').id);
      expect((current.price as Resource).id).assertEqual($r('app.string.embed_product_price002').id);
      expect(previous.id).assertEqual(2);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product002').id);
      expect((previous.title as Resource).id).assertEqual($r('app.string.embed_product_title002').id);
      expect(previous.price).assertEqual('USD 699.00');
      current.price = 'USD 649.00 deposit included';
      const later: ProductDataModel = new ProductDataModel(
        3,
        $r('app.media.embed_product003'),
        $r('app.string.embed_product_title003'),
        $r('app.string.embed_product_price003')
      );
      expect(current.id).assertEqual(2);
      expect((current.imageRes as Resource).id).assertEqual($r('app.media.embed_product002').id);
      expect((current.title as Resource).id).assertEqual($r('app.string.embed_product_title002').id);
      expect(current.price).assertEqual('USD 649.00 deposit included');
      expect(previous.id).assertEqual(2);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product002').id);
      expect((previous.title as Resource).id).assertEqual($r('app.string.embed_product_title002').id);
      expect(previous.price).assertEqual('USD 699.00');
      expect(later.id).assertEqual(3);
      expect((later.imageRes as Resource).id).assertEqual($r('app.media.embed_product003').id);
      expect((later.title as Resource).id).assertEqual($r('app.string.embed_product_title003').id);
      expect((later.price as Resource).id).assertEqual($r('app.string.embed_product_price003').id);
      expect(current === previous).assertFalse();
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_FIELDSEQUENCE_0027
     * @tc.name testProductFieldSequence0027
     * @tc.desc Phone price clears a pending display then rebinds a resource without changing its peer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testProductFieldSequence0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const previous: ProductDataModel = new ProductDataModel(
        2,
        $r('app.media.embed_product002'),
        $r('app.string.embed_product_title002'),
        $r('app.string.embed_product_price002')
      );
      const current: ProductDataModel = new ProductDataModel(
        2,
        $r('app.media.embed_product002'),
        $r('app.string.embed_product_title002'),
        $r('app.string.embed_product_price002')
      );
      current.price = '';
      expect(current.id).assertEqual(2);
      expect((current.imageRes as Resource).id).assertEqual($r('app.media.embed_product002').id);
      expect((current.title as Resource).id).assertEqual($r('app.string.embed_product_title002').id);
      expect(current.price).assertEqual('');
      expect(previous.id).assertEqual(2);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product002').id);
      expect((previous.title as Resource).id).assertEqual($r('app.string.embed_product_title002').id);
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price002').id);
      current.price = $r('app.string.embed_product_price003');
      const later: ProductDataModel = new ProductDataModel(
        3,
        $r('app.media.embed_product003'),
        $r('app.string.embed_product_title003'),
        $r('app.string.embed_product_price003')
      );
      expect(current.id).assertEqual(2);
      expect((current.imageRes as Resource).id).assertEqual($r('app.media.embed_product002').id);
      expect((current.title as Resource).id).assertEqual($r('app.string.embed_product_title002').id);
      expect((current.price as Resource).id).assertEqual($r('app.string.embed_product_price003').id);
      expect(previous.id).assertEqual(2);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product002').id);
      expect((previous.title as Resource).id).assertEqual($r('app.string.embed_product_title002').id);
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price002').id);
      expect(later.id).assertEqual(3);
      expect((later.imageRes as Resource).id).assertEqual($r('app.media.embed_product003').id);
      expect((later.title as Resource).id).assertEqual($r('app.string.embed_product_title003').id);
      expect((later.price as Resource).id).assertEqual($r('app.string.embed_product_price003').id);
      expect(current === previous).assertFalse();
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_FIELDSEQUENCE_0028
     * @tc.name testProductFieldSequence0028
     * @tc.desc Charger imageRes detaches to a literal then restores its resource without changing its peer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testProductFieldSequence0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const previous: ProductDataModel = new ProductDataModel(
        3,
        $r('app.media.embed_product003'),
        $r('app.string.embed_product_title003'),
        $r('app.string.embed_product_price003')
      );
      const current: ProductDataModel = new ProductDataModel(
        3,
        $r('app.media.embed_product003'),
        $r('app.string.embed_product_title003'),
        $r('app.string.embed_product_price003')
      );
      current.imageRes = 'file://cache/charger/front.webp';
      expect(current.id).assertEqual(3);
      expect(current.imageRes).assertEqual('file://cache/charger/front.webp');
      expect((current.title as Resource).id).assertEqual($r('app.string.embed_product_title003').id);
      expect((current.price as Resource).id).assertEqual($r('app.string.embed_product_price003').id);
      expect(previous.id).assertEqual(3);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product003').id);
      expect((previous.title as Resource).id).assertEqual($r('app.string.embed_product_title003').id);
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price003').id);
      current.imageRes = $r('app.media.embed_product003');
      const later: ProductDataModel = new ProductDataModel(
        4,
        $r('app.media.embed_product004'),
        $r('app.string.embed_product_title004'),
        $r('app.string.embed_product_price004')
      );
      expect(current.id).assertEqual(3);
      expect((current.imageRes as Resource).id).assertEqual($r('app.media.embed_product003').id);
      expect((current.title as Resource).id).assertEqual($r('app.string.embed_product_title003').id);
      expect((current.price as Resource).id).assertEqual($r('app.string.embed_product_price003').id);
      expect(previous.id).assertEqual(3);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product003').id);
      expect((previous.title as Resource).id).assertEqual($r('app.string.embed_product_title003').id);
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price003').id);
      expect(later.id).assertEqual(4);
      expect((later.imageRes as Resource).id).assertEqual($r('app.media.embed_product004').id);
      expect((later.title as Resource).id).assertEqual($r('app.string.embed_product_title004').id);
      expect((later.price as Resource).id).assertEqual($r('app.string.embed_product_price004').id);
      expect(current === previous).assertFalse();
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_FIELDSEQUENCE_0029
     * @tc.name testProductFieldSequence0029
     * @tc.desc Charger imageRes binds a resource then accepts a sales override while its peer stays literal
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testProductFieldSequence0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const previous: ProductDataModel = new ProductDataModel(
        3,
        'file://cache/charger/front.webp',
        $r('app.string.embed_product_title003'),
        $r('app.string.embed_product_price003')
      );
      const current: ProductDataModel = new ProductDataModel(
        3,
        'file://cache/charger/front.webp',
        $r('app.string.embed_product_title003'),
        $r('app.string.embed_product_price003')
      );
      current.imageRes = $r('app.media.embed_product003');
      expect(current.id).assertEqual(3);
      expect((current.imageRes as Resource).id).assertEqual($r('app.media.embed_product003').id);
      expect((current.title as Resource).id).assertEqual($r('app.string.embed_product_title003').id);
      expect((current.price as Resource).id).assertEqual($r('app.string.embed_product_price003').id);
      expect(previous.id).assertEqual(3);
      expect(previous.imageRes).assertEqual('file://cache/charger/front.webp');
      expect((previous.title as Resource).id).assertEqual($r('app.string.embed_product_title003').id);
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price003').id);
      current.imageRes = 'https://store.example/charger/ports.webp';
      const later: ProductDataModel = new ProductDataModel(
        4,
        $r('app.media.embed_product004'),
        $r('app.string.embed_product_title004'),
        $r('app.string.embed_product_price004')
      );
      expect(current.id).assertEqual(3);
      expect(current.imageRes).assertEqual('https://store.example/charger/ports.webp');
      expect((current.title as Resource).id).assertEqual($r('app.string.embed_product_title003').id);
      expect((current.price as Resource).id).assertEqual($r('app.string.embed_product_price003').id);
      expect(previous.id).assertEqual(3);
      expect(previous.imageRes).assertEqual('file://cache/charger/front.webp');
      expect((previous.title as Resource).id).assertEqual($r('app.string.embed_product_title003').id);
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price003').id);
      expect(later.id).assertEqual(4);
      expect((later.imageRes as Resource).id).assertEqual($r('app.media.embed_product004').id);
      expect((later.title as Resource).id).assertEqual($r('app.string.embed_product_title004').id);
      expect((later.price as Resource).id).assertEqual($r('app.string.embed_product_price004').id);
      expect(current === previous).assertFalse();
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_FIELDSEQUENCE_0030
     * @tc.name testProductFieldSequence0030
     * @tc.desc Charger imageRes clears a pending display then rebinds a resource without changing its peer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testProductFieldSequence0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const previous: ProductDataModel = new ProductDataModel(
        3,
        $r('app.media.embed_product003'),
        $r('app.string.embed_product_title003'),
        $r('app.string.embed_product_price003')
      );
      const current: ProductDataModel = new ProductDataModel(
        3,
        $r('app.media.embed_product003'),
        $r('app.string.embed_product_title003'),
        $r('app.string.embed_product_price003')
      );
      current.imageRes = '';
      expect(current.id).assertEqual(3);
      expect(current.imageRes).assertEqual('');
      expect((current.title as Resource).id).assertEqual($r('app.string.embed_product_title003').id);
      expect((current.price as Resource).id).assertEqual($r('app.string.embed_product_price003').id);
      expect(previous.id).assertEqual(3);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product003').id);
      expect((previous.title as Resource).id).assertEqual($r('app.string.embed_product_title003').id);
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price003').id);
      current.imageRes = $r('app.media.embed_product004');
      const later: ProductDataModel = new ProductDataModel(
        4,
        $r('app.media.embed_product004'),
        $r('app.string.embed_product_title004'),
        $r('app.string.embed_product_price004')
      );
      expect(current.id).assertEqual(3);
      expect((current.imageRes as Resource).id).assertEqual($r('app.media.embed_product004').id);
      expect((current.title as Resource).id).assertEqual($r('app.string.embed_product_title003').id);
      expect((current.price as Resource).id).assertEqual($r('app.string.embed_product_price003').id);
      expect(previous.id).assertEqual(3);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product003').id);
      expect((previous.title as Resource).id).assertEqual($r('app.string.embed_product_title003').id);
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price003').id);
      expect(later.id).assertEqual(4);
      expect((later.imageRes as Resource).id).assertEqual($r('app.media.embed_product004').id);
      expect((later.title as Resource).id).assertEqual($r('app.string.embed_product_title004').id);
      expect((later.price as Resource).id).assertEqual($r('app.string.embed_product_price004').id);
      expect(current === previous).assertFalse();
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_FIELDSEQUENCE_0031
     * @tc.name testProductFieldSequence0031
     * @tc.desc Charger title detaches to a literal then restores its resource without changing its peer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testProductFieldSequence0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const previous: ProductDataModel = new ProductDataModel(
        3,
        $r('app.media.embed_product003'),
        $r('app.string.embed_product_title003'),
        $r('app.string.embed_product_price003')
      );
      const current: ProductDataModel = new ProductDataModel(
        3,
        $r('app.media.embed_product003'),
        $r('app.string.embed_product_title003'),
        $r('app.string.embed_product_price003')
      );
      current.title = 'USB-C charger 65 W - two ports';
      expect(current.id).assertEqual(3);
      expect((current.imageRes as Resource).id).assertEqual($r('app.media.embed_product003').id);
      expect(current.title).assertEqual('USB-C charger 65 W - two ports');
      expect((current.price as Resource).id).assertEqual($r('app.string.embed_product_price003').id);
      expect(previous.id).assertEqual(3);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product003').id);
      expect((previous.title as Resource).id).assertEqual($r('app.string.embed_product_title003').id);
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price003').id);
      current.title = $r('app.string.embed_product_title003');
      const later: ProductDataModel = new ProductDataModel(
        4,
        $r('app.media.embed_product004'),
        $r('app.string.embed_product_title004'),
        $r('app.string.embed_product_price004')
      );
      expect(current.id).assertEqual(3);
      expect((current.imageRes as Resource).id).assertEqual($r('app.media.embed_product003').id);
      expect((current.title as Resource).id).assertEqual($r('app.string.embed_product_title003').id);
      expect((current.price as Resource).id).assertEqual($r('app.string.embed_product_price003').id);
      expect(previous.id).assertEqual(3);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product003').id);
      expect((previous.title as Resource).id).assertEqual($r('app.string.embed_product_title003').id);
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price003').id);
      expect(later.id).assertEqual(4);
      expect((later.imageRes as Resource).id).assertEqual($r('app.media.embed_product004').id);
      expect((later.title as Resource).id).assertEqual($r('app.string.embed_product_title004').id);
      expect((later.price as Resource).id).assertEqual($r('app.string.embed_product_price004').id);
      expect(current === previous).assertFalse();
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_FIELDSEQUENCE_0032
     * @tc.name testProductFieldSequence0032
     * @tc.desc Charger title binds a resource then accepts a sales override while its peer stays literal
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testProductFieldSequence0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const previous: ProductDataModel = new ProductDataModel(
        3,
        $r('app.media.embed_product003'),
        'USB-C charger 65 W - two ports',
        $r('app.string.embed_product_price003')
      );
      const current: ProductDataModel = new ProductDataModel(
        3,
        $r('app.media.embed_product003'),
        'USB-C charger 65 W - two ports',
        $r('app.string.embed_product_price003')
      );
      current.title = $r('app.string.embed_product_title003');
      expect(current.id).assertEqual(3);
      expect((current.imageRes as Resource).id).assertEqual($r('app.media.embed_product003').id);
      expect((current.title as Resource).id).assertEqual($r('app.string.embed_product_title003').id);
      expect((current.price as Resource).id).assertEqual($r('app.string.embed_product_price003').id);
      expect(previous.id).assertEqual(3);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product003').id);
      expect(previous.title).assertEqual('USB-C charger 65 W - two ports');
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price003').id);
      current.title = 'USB-C charger 65 W - cable bundle';
      const later: ProductDataModel = new ProductDataModel(
        4,
        $r('app.media.embed_product004'),
        $r('app.string.embed_product_title004'),
        $r('app.string.embed_product_price004')
      );
      expect(current.id).assertEqual(3);
      expect((current.imageRes as Resource).id).assertEqual($r('app.media.embed_product003').id);
      expect(current.title).assertEqual('USB-C charger 65 W - cable bundle');
      expect((current.price as Resource).id).assertEqual($r('app.string.embed_product_price003').id);
      expect(previous.id).assertEqual(3);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product003').id);
      expect(previous.title).assertEqual('USB-C charger 65 W - two ports');
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price003').id);
      expect(later.id).assertEqual(4);
      expect((later.imageRes as Resource).id).assertEqual($r('app.media.embed_product004').id);
      expect((later.title as Resource).id).assertEqual($r('app.string.embed_product_title004').id);
      expect((later.price as Resource).id).assertEqual($r('app.string.embed_product_price004').id);
      expect(current === previous).assertFalse();
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_FIELDSEQUENCE_0033
     * @tc.name testProductFieldSequence0033
     * @tc.desc Charger title clears a pending display then rebinds a resource without changing its peer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testProductFieldSequence0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const previous: ProductDataModel = new ProductDataModel(
        3,
        $r('app.media.embed_product003'),
        $r('app.string.embed_product_title003'),
        $r('app.string.embed_product_price003')
      );
      const current: ProductDataModel = new ProductDataModel(
        3,
        $r('app.media.embed_product003'),
        $r('app.string.embed_product_title003'),
        $r('app.string.embed_product_price003')
      );
      current.title = '';
      expect(current.id).assertEqual(3);
      expect((current.imageRes as Resource).id).assertEqual($r('app.media.embed_product003').id);
      expect(current.title).assertEqual('');
      expect((current.price as Resource).id).assertEqual($r('app.string.embed_product_price003').id);
      expect(previous.id).assertEqual(3);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product003').id);
      expect((previous.title as Resource).id).assertEqual($r('app.string.embed_product_title003').id);
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price003').id);
      current.title = $r('app.string.embed_product_title004');
      const later: ProductDataModel = new ProductDataModel(
        4,
        $r('app.media.embed_product004'),
        $r('app.string.embed_product_title004'),
        $r('app.string.embed_product_price004')
      );
      expect(current.id).assertEqual(3);
      expect((current.imageRes as Resource).id).assertEqual($r('app.media.embed_product003').id);
      expect((current.title as Resource).id).assertEqual($r('app.string.embed_product_title004').id);
      expect((current.price as Resource).id).assertEqual($r('app.string.embed_product_price003').id);
      expect(previous.id).assertEqual(3);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product003').id);
      expect((previous.title as Resource).id).assertEqual($r('app.string.embed_product_title003').id);
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price003').id);
      expect(later.id).assertEqual(4);
      expect((later.imageRes as Resource).id).assertEqual($r('app.media.embed_product004').id);
      expect((later.title as Resource).id).assertEqual($r('app.string.embed_product_title004').id);
      expect((later.price as Resource).id).assertEqual($r('app.string.embed_product_price004').id);
      expect(current === previous).assertFalse();
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_FIELDSEQUENCE_0034
     * @tc.name testProductFieldSequence0034
     * @tc.desc Charger price detaches to a literal then restores its resource without changing its peer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testProductFieldSequence0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const previous: ProductDataModel = new ProductDataModel(
        3,
        $r('app.media.embed_product003'),
        $r('app.string.embed_product_title003'),
        $r('app.string.embed_product_price003')
      );
      const current: ProductDataModel = new ProductDataModel(
        3,
        $r('app.media.embed_product003'),
        $r('app.string.embed_product_title003'),
        $r('app.string.embed_product_price003')
      );
      current.price = 'USD 0.00';
      expect(current.id).assertEqual(3);
      expect((current.imageRes as Resource).id).assertEqual($r('app.media.embed_product003').id);
      expect((current.title as Resource).id).assertEqual($r('app.string.embed_product_title003').id);
      expect(current.price).assertEqual('USD 0.00');
      expect(previous.id).assertEqual(3);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product003').id);
      expect((previous.title as Resource).id).assertEqual($r('app.string.embed_product_title003').id);
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price003').id);
      current.price = $r('app.string.embed_product_price003');
      const later: ProductDataModel = new ProductDataModel(
        4,
        $r('app.media.embed_product004'),
        $r('app.string.embed_product_title004'),
        $r('app.string.embed_product_price004')
      );
      expect(current.id).assertEqual(3);
      expect((current.imageRes as Resource).id).assertEqual($r('app.media.embed_product003').id);
      expect((current.title as Resource).id).assertEqual($r('app.string.embed_product_title003').id);
      expect((current.price as Resource).id).assertEqual($r('app.string.embed_product_price003').id);
      expect(previous.id).assertEqual(3);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product003').id);
      expect((previous.title as Resource).id).assertEqual($r('app.string.embed_product_title003').id);
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price003').id);
      expect(later.id).assertEqual(4);
      expect((later.imageRes as Resource).id).assertEqual($r('app.media.embed_product004').id);
      expect((later.title as Resource).id).assertEqual($r('app.string.embed_product_title004').id);
      expect((later.price as Resource).id).assertEqual($r('app.string.embed_product_price004').id);
      expect(current === previous).assertFalse();
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_FIELDSEQUENCE_0035
     * @tc.name testProductFieldSequence0035
     * @tc.desc Charger price binds a resource then accepts a sales override while its peer stays literal
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testProductFieldSequence0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const previous: ProductDataModel = new ProductDataModel(
        3,
        $r('app.media.embed_product003'),
        $r('app.string.embed_product_title003'),
        'USD 0.00'
      );
      const current: ProductDataModel = new ProductDataModel(
        3,
        $r('app.media.embed_product003'),
        $r('app.string.embed_product_title003'),
        'USD 0.00'
      );
      current.price = $r('app.string.embed_product_price003');
      expect(current.id).assertEqual(3);
      expect((current.imageRes as Resource).id).assertEqual($r('app.media.embed_product003').id);
      expect((current.title as Resource).id).assertEqual($r('app.string.embed_product_title003').id);
      expect((current.price as Resource).id).assertEqual($r('app.string.embed_product_price003').id);
      expect(previous.id).assertEqual(3);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product003').id);
      expect((previous.title as Resource).id).assertEqual($r('app.string.embed_product_title003').id);
      expect(previous.price).assertEqual('USD 0.00');
      current.price = 'USD 19.50 bundle';
      const later: ProductDataModel = new ProductDataModel(
        4,
        $r('app.media.embed_product004'),
        $r('app.string.embed_product_title004'),
        $r('app.string.embed_product_price004')
      );
      expect(current.id).assertEqual(3);
      expect((current.imageRes as Resource).id).assertEqual($r('app.media.embed_product003').id);
      expect((current.title as Resource).id).assertEqual($r('app.string.embed_product_title003').id);
      expect(current.price).assertEqual('USD 19.50 bundle');
      expect(previous.id).assertEqual(3);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product003').id);
      expect((previous.title as Resource).id).assertEqual($r('app.string.embed_product_title003').id);
      expect(previous.price).assertEqual('USD 0.00');
      expect(later.id).assertEqual(4);
      expect((later.imageRes as Resource).id).assertEqual($r('app.media.embed_product004').id);
      expect((later.title as Resource).id).assertEqual($r('app.string.embed_product_title004').id);
      expect((later.price as Resource).id).assertEqual($r('app.string.embed_product_price004').id);
      expect(current === previous).assertFalse();
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_FIELDSEQUENCE_0036
     * @tc.name testProductFieldSequence0036
     * @tc.desc Charger price clears a pending display then rebinds a resource without changing its peer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testProductFieldSequence0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const previous: ProductDataModel = new ProductDataModel(
        3,
        $r('app.media.embed_product003'),
        $r('app.string.embed_product_title003'),
        $r('app.string.embed_product_price003')
      );
      const current: ProductDataModel = new ProductDataModel(
        3,
        $r('app.media.embed_product003'),
        $r('app.string.embed_product_title003'),
        $r('app.string.embed_product_price003')
      );
      current.price = '';
      expect(current.id).assertEqual(3);
      expect((current.imageRes as Resource).id).assertEqual($r('app.media.embed_product003').id);
      expect((current.title as Resource).id).assertEqual($r('app.string.embed_product_title003').id);
      expect(current.price).assertEqual('');
      expect(previous.id).assertEqual(3);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product003').id);
      expect((previous.title as Resource).id).assertEqual($r('app.string.embed_product_title003').id);
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price003').id);
      current.price = $r('app.string.embed_product_price004');
      const later: ProductDataModel = new ProductDataModel(
        4,
        $r('app.media.embed_product004'),
        $r('app.string.embed_product_title004'),
        $r('app.string.embed_product_price004')
      );
      expect(current.id).assertEqual(3);
      expect((current.imageRes as Resource).id).assertEqual($r('app.media.embed_product003').id);
      expect((current.title as Resource).id).assertEqual($r('app.string.embed_product_title003').id);
      expect((current.price as Resource).id).assertEqual($r('app.string.embed_product_price004').id);
      expect(previous.id).assertEqual(3);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product003').id);
      expect((previous.title as Resource).id).assertEqual($r('app.string.embed_product_title003').id);
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price003').id);
      expect(later.id).assertEqual(4);
      expect((later.imageRes as Resource).id).assertEqual($r('app.media.embed_product004').id);
      expect((later.title as Resource).id).assertEqual($r('app.string.embed_product_title004').id);
      expect((later.price as Resource).id).assertEqual($r('app.string.embed_product_price004').id);
      expect(current === previous).assertFalse();
    });
  });
}
