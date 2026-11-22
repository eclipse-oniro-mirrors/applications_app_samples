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

export default function productFieldSequence02Test(): void {
  describe('productFieldSequence02Test', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_FIELDSEQUENCE_0037
     * @tc.name testProductFieldSequence0037
     * @tc.desc Headset imageRes detaches to a literal then restores its resource without changing its peer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testProductFieldSequence0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const previous: ProductDataModel = new ProductDataModel(
        4,
        $r('app.media.embed_product004'),
        $r('app.string.embed_product_title004'),
        $r('app.string.embed_product_price004')
      );
      const current: ProductDataModel = new ProductDataModel(
        4,
        $r('app.media.embed_product004'),
        $r('app.string.embed_product_title004'),
        $r('app.string.embed_product_price004')
      );
      current.imageRes = 'https://store.example/headset/front.webp';
      expect(current.id).assertEqual(4);
      expect(current.imageRes).assertEqual('https://store.example/headset/front.webp');
      expect((current.title as Resource).id).assertEqual($r('app.string.embed_product_title004').id);
      expect((current.price as Resource).id).assertEqual($r('app.string.embed_product_price004').id);
      expect(previous.id).assertEqual(4);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product004').id);
      expect((previous.title as Resource).id).assertEqual($r('app.string.embed_product_title004').id);
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price004').id);
      current.imageRes = $r('app.media.embed_product004');
      const later: ProductDataModel = new ProductDataModel(
        5,
        $r('app.media.embed_product005'),
        $r('app.string.embed_product_title005'),
        $r('app.string.embed_product_price005')
      );
      expect(current.id).assertEqual(4);
      expect((current.imageRes as Resource).id).assertEqual($r('app.media.embed_product004').id);
      expect((current.title as Resource).id).assertEqual($r('app.string.embed_product_title004').id);
      expect((current.price as Resource).id).assertEqual($r('app.string.embed_product_price004').id);
      expect(previous.id).assertEqual(4);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product004').id);
      expect((previous.title as Resource).id).assertEqual($r('app.string.embed_product_title004').id);
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price004').id);
      expect(later.id).assertEqual(5);
      expect((later.imageRes as Resource).id).assertEqual($r('app.media.embed_product005').id);
      expect((later.title as Resource).id).assertEqual($r('app.string.embed_product_title005').id);
      expect((later.price as Resource).id).assertEqual($r('app.string.embed_product_price005').id);
      expect(current === previous).assertFalse();
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_FIELDSEQUENCE_0038
     * @tc.name testProductFieldSequence0038
     * @tc.desc Headset imageRes binds a resource then accepts a sales override while its peer stays literal
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testProductFieldSequence0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const previous: ProductDataModel = new ProductDataModel(
        4,
        'https://store.example/headset/front.webp',
        $r('app.string.embed_product_title004'),
        $r('app.string.embed_product_price004')
      );
      const current: ProductDataModel = new ProductDataModel(
        4,
        'https://store.example/headset/front.webp',
        $r('app.string.embed_product_title004'),
        $r('app.string.embed_product_price004')
      );
      current.imageRes = $r('app.media.embed_product004');
      expect(current.id).assertEqual(4);
      expect((current.imageRes as Resource).id).assertEqual($r('app.media.embed_product004').id);
      expect((current.title as Resource).id).assertEqual($r('app.string.embed_product_title004').id);
      expect((current.price as Resource).id).assertEqual($r('app.string.embed_product_price004').id);
      expect(previous.id).assertEqual(4);
      expect(previous.imageRes).assertEqual('https://store.example/headset/front.webp');
      expect((previous.title as Resource).id).assertEqual($r('app.string.embed_product_title004').id);
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price004').id);
      current.imageRes = 'file://cache/headset/case.webp';
      const later: ProductDataModel = new ProductDataModel(
        5,
        $r('app.media.embed_product005'),
        $r('app.string.embed_product_title005'),
        $r('app.string.embed_product_price005')
      );
      expect(current.id).assertEqual(4);
      expect(current.imageRes).assertEqual('file://cache/headset/case.webp');
      expect((current.title as Resource).id).assertEqual($r('app.string.embed_product_title004').id);
      expect((current.price as Resource).id).assertEqual($r('app.string.embed_product_price004').id);
      expect(previous.id).assertEqual(4);
      expect(previous.imageRes).assertEqual('https://store.example/headset/front.webp');
      expect((previous.title as Resource).id).assertEqual($r('app.string.embed_product_title004').id);
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price004').id);
      expect(later.id).assertEqual(5);
      expect((later.imageRes as Resource).id).assertEqual($r('app.media.embed_product005').id);
      expect((later.title as Resource).id).assertEqual($r('app.string.embed_product_title005').id);
      expect((later.price as Resource).id).assertEqual($r('app.string.embed_product_price005').id);
      expect(current === previous).assertFalse();
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_FIELDSEQUENCE_0039
     * @tc.name testProductFieldSequence0039
     * @tc.desc Headset imageRes clears a pending display then rebinds a resource without changing its peer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testProductFieldSequence0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const previous: ProductDataModel = new ProductDataModel(
        4,
        $r('app.media.embed_product004'),
        $r('app.string.embed_product_title004'),
        $r('app.string.embed_product_price004')
      );
      const current: ProductDataModel = new ProductDataModel(
        4,
        $r('app.media.embed_product004'),
        $r('app.string.embed_product_title004'),
        $r('app.string.embed_product_price004')
      );
      current.imageRes = '';
      expect(current.id).assertEqual(4);
      expect(current.imageRes).assertEqual('');
      expect((current.title as Resource).id).assertEqual($r('app.string.embed_product_title004').id);
      expect((current.price as Resource).id).assertEqual($r('app.string.embed_product_price004').id);
      expect(previous.id).assertEqual(4);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product004').id);
      expect((previous.title as Resource).id).assertEqual($r('app.string.embed_product_title004').id);
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price004').id);
      current.imageRes = $r('app.media.embed_product005');
      const later: ProductDataModel = new ProductDataModel(
        5,
        $r('app.media.embed_product005'),
        $r('app.string.embed_product_title005'),
        $r('app.string.embed_product_price005')
      );
      expect(current.id).assertEqual(4);
      expect((current.imageRes as Resource).id).assertEqual($r('app.media.embed_product005').id);
      expect((current.title as Resource).id).assertEqual($r('app.string.embed_product_title004').id);
      expect((current.price as Resource).id).assertEqual($r('app.string.embed_product_price004').id);
      expect(previous.id).assertEqual(4);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product004').id);
      expect((previous.title as Resource).id).assertEqual($r('app.string.embed_product_title004').id);
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price004').id);
      expect(later.id).assertEqual(5);
      expect((later.imageRes as Resource).id).assertEqual($r('app.media.embed_product005').id);
      expect((later.title as Resource).id).assertEqual($r('app.string.embed_product_title005').id);
      expect((later.price as Resource).id).assertEqual($r('app.string.embed_product_price005').id);
      expect(current === previous).assertFalse();
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_FIELDSEQUENCE_0040
     * @tc.name testProductFieldSequence0040
     * @tc.desc Headset title detaches to a literal then restores its resource without changing its peer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testProductFieldSequence0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const previous: ProductDataModel = new ProductDataModel(
        4,
        $r('app.media.embed_product004'),
        $r('app.string.embed_product_title004'),
        $r('app.string.embed_product_price004')
      );
      const current: ProductDataModel = new ProductDataModel(
        4,
        $r('app.media.embed_product004'),
        $r('app.string.embed_product_title004'),
        $r('app.string.embed_product_price004')
      );
      current.title = 'Wireless headset - open-box';
      expect(current.id).assertEqual(4);
      expect((current.imageRes as Resource).id).assertEqual($r('app.media.embed_product004').id);
      expect(current.title).assertEqual('Wireless headset - open-box');
      expect((current.price as Resource).id).assertEqual($r('app.string.embed_product_price004').id);
      expect(previous.id).assertEqual(4);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product004').id);
      expect((previous.title as Resource).id).assertEqual($r('app.string.embed_product_title004').id);
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price004').id);
      current.title = $r('app.string.embed_product_title004');
      const later: ProductDataModel = new ProductDataModel(
        5,
        $r('app.media.embed_product005'),
        $r('app.string.embed_product_title005'),
        $r('app.string.embed_product_price005')
      );
      expect(current.id).assertEqual(4);
      expect((current.imageRes as Resource).id).assertEqual($r('app.media.embed_product004').id);
      expect((current.title as Resource).id).assertEqual($r('app.string.embed_product_title004').id);
      expect((current.price as Resource).id).assertEqual($r('app.string.embed_product_price004').id);
      expect(previous.id).assertEqual(4);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product004').id);
      expect((previous.title as Resource).id).assertEqual($r('app.string.embed_product_title004').id);
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price004').id);
      expect(later.id).assertEqual(5);
      expect((later.imageRes as Resource).id).assertEqual($r('app.media.embed_product005').id);
      expect((later.title as Resource).id).assertEqual($r('app.string.embed_product_title005').id);
      expect((later.price as Resource).id).assertEqual($r('app.string.embed_product_price005').id);
      expect(current === previous).assertFalse();
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_FIELDSEQUENCE_0041
     * @tc.name testProductFieldSequence0041
     * @tc.desc Headset title binds a resource then accepts a sales override while its peer stays literal
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testProductFieldSequence0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const previous: ProductDataModel = new ProductDataModel(
        4,
        $r('app.media.embed_product004'),
        'Wireless headset - open-box',
        $r('app.string.embed_product_price004')
      );
      const current: ProductDataModel = new ProductDataModel(
        4,
        $r('app.media.embed_product004'),
        'Wireless headset - open-box',
        $r('app.string.embed_product_price004')
      );
      current.title = $r('app.string.embed_product_title004');
      expect(current.id).assertEqual(4);
      expect((current.imageRes as Resource).id).assertEqual($r('app.media.embed_product004').id);
      expect((current.title as Resource).id).assertEqual($r('app.string.embed_product_title004').id);
      expect((current.price as Resource).id).assertEqual($r('app.string.embed_product_price004').id);
      expect(previous.id).assertEqual(4);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product004').id);
      expect(previous.title).assertEqual('Wireless headset - open-box');
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price004').id);
      current.title = 'Wireless headset - replacement unit';
      const later: ProductDataModel = new ProductDataModel(
        5,
        $r('app.media.embed_product005'),
        $r('app.string.embed_product_title005'),
        $r('app.string.embed_product_price005')
      );
      expect(current.id).assertEqual(4);
      expect((current.imageRes as Resource).id).assertEqual($r('app.media.embed_product004').id);
      expect(current.title).assertEqual('Wireless headset - replacement unit');
      expect((current.price as Resource).id).assertEqual($r('app.string.embed_product_price004').id);
      expect(previous.id).assertEqual(4);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product004').id);
      expect(previous.title).assertEqual('Wireless headset - open-box');
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price004').id);
      expect(later.id).assertEqual(5);
      expect((later.imageRes as Resource).id).assertEqual($r('app.media.embed_product005').id);
      expect((later.title as Resource).id).assertEqual($r('app.string.embed_product_title005').id);
      expect((later.price as Resource).id).assertEqual($r('app.string.embed_product_price005').id);
      expect(current === previous).assertFalse();
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_FIELDSEQUENCE_0042
     * @tc.name testProductFieldSequence0042
     * @tc.desc Headset title clears a pending display then rebinds a resource without changing its peer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testProductFieldSequence0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const previous: ProductDataModel = new ProductDataModel(
        4,
        $r('app.media.embed_product004'),
        $r('app.string.embed_product_title004'),
        $r('app.string.embed_product_price004')
      );
      const current: ProductDataModel = new ProductDataModel(
        4,
        $r('app.media.embed_product004'),
        $r('app.string.embed_product_title004'),
        $r('app.string.embed_product_price004')
      );
      current.title = '';
      expect(current.id).assertEqual(4);
      expect((current.imageRes as Resource).id).assertEqual($r('app.media.embed_product004').id);
      expect(current.title).assertEqual('');
      expect((current.price as Resource).id).assertEqual($r('app.string.embed_product_price004').id);
      expect(previous.id).assertEqual(4);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product004').id);
      expect((previous.title as Resource).id).assertEqual($r('app.string.embed_product_title004').id);
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price004').id);
      current.title = $r('app.string.embed_product_title005');
      const later: ProductDataModel = new ProductDataModel(
        5,
        $r('app.media.embed_product005'),
        $r('app.string.embed_product_title005'),
        $r('app.string.embed_product_price005')
      );
      expect(current.id).assertEqual(4);
      expect((current.imageRes as Resource).id).assertEqual($r('app.media.embed_product004').id);
      expect((current.title as Resource).id).assertEqual($r('app.string.embed_product_title005').id);
      expect((current.price as Resource).id).assertEqual($r('app.string.embed_product_price004').id);
      expect(previous.id).assertEqual(4);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product004').id);
      expect((previous.title as Resource).id).assertEqual($r('app.string.embed_product_title004').id);
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price004').id);
      expect(later.id).assertEqual(5);
      expect((later.imageRes as Resource).id).assertEqual($r('app.media.embed_product005').id);
      expect((later.title as Resource).id).assertEqual($r('app.string.embed_product_title005').id);
      expect((later.price as Resource).id).assertEqual($r('app.string.embed_product_price005').id);
      expect(current === previous).assertFalse();
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_FIELDSEQUENCE_0043
     * @tc.name testProductFieldSequence0043
     * @tc.desc Headset price detaches to a literal then restores its resource without changing its peer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testProductFieldSequence0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const previous: ProductDataModel = new ProductDataModel(
        4,
        $r('app.media.embed_product004'),
        $r('app.string.embed_product_title004'),
        $r('app.string.embed_product_price004')
      );
      const current: ProductDataModel = new ProductDataModel(
        4,
        $r('app.media.embed_product004'),
        $r('app.string.embed_product_title004'),
        $r('app.string.embed_product_price004')
      );
      current.price = 'USD -5.00 credit';
      expect(current.id).assertEqual(4);
      expect((current.imageRes as Resource).id).assertEqual($r('app.media.embed_product004').id);
      expect((current.title as Resource).id).assertEqual($r('app.string.embed_product_title004').id);
      expect(current.price).assertEqual('USD -5.00 credit');
      expect(previous.id).assertEqual(4);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product004').id);
      expect((previous.title as Resource).id).assertEqual($r('app.string.embed_product_title004').id);
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price004').id);
      current.price = $r('app.string.embed_product_price004');
      const later: ProductDataModel = new ProductDataModel(
        5,
        $r('app.media.embed_product005'),
        $r('app.string.embed_product_title005'),
        $r('app.string.embed_product_price005')
      );
      expect(current.id).assertEqual(4);
      expect((current.imageRes as Resource).id).assertEqual($r('app.media.embed_product004').id);
      expect((current.title as Resource).id).assertEqual($r('app.string.embed_product_title004').id);
      expect((current.price as Resource).id).assertEqual($r('app.string.embed_product_price004').id);
      expect(previous.id).assertEqual(4);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product004').id);
      expect((previous.title as Resource).id).assertEqual($r('app.string.embed_product_title004').id);
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price004').id);
      expect(later.id).assertEqual(5);
      expect((later.imageRes as Resource).id).assertEqual($r('app.media.embed_product005').id);
      expect((later.title as Resource).id).assertEqual($r('app.string.embed_product_title005').id);
      expect((later.price as Resource).id).assertEqual($r('app.string.embed_product_price005').id);
      expect(current === previous).assertFalse();
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_FIELDSEQUENCE_0044
     * @tc.name testProductFieldSequence0044
     * @tc.desc Headset price binds a resource then accepts a sales override while its peer stays literal
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testProductFieldSequence0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const previous: ProductDataModel = new ProductDataModel(
        4,
        $r('app.media.embed_product004'),
        $r('app.string.embed_product_title004'),
        'USD -5.00 credit'
      );
      const current: ProductDataModel = new ProductDataModel(
        4,
        $r('app.media.embed_product004'),
        $r('app.string.embed_product_title004'),
        'USD -5.00 credit'
      );
      current.price = $r('app.string.embed_product_price004');
      expect(current.id).assertEqual(4);
      expect((current.imageRes as Resource).id).assertEqual($r('app.media.embed_product004').id);
      expect((current.title as Resource).id).assertEqual($r('app.string.embed_product_title004').id);
      expect((current.price as Resource).id).assertEqual($r('app.string.embed_product_price004').id);
      expect(previous.id).assertEqual(4);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product004').id);
      expect((previous.title as Resource).id).assertEqual($r('app.string.embed_product_title004').id);
      expect(previous.price).assertEqual('USD -5.00 credit');
      current.price = 'USD 0.00 warranty';
      const later: ProductDataModel = new ProductDataModel(
        5,
        $r('app.media.embed_product005'),
        $r('app.string.embed_product_title005'),
        $r('app.string.embed_product_price005')
      );
      expect(current.id).assertEqual(4);
      expect((current.imageRes as Resource).id).assertEqual($r('app.media.embed_product004').id);
      expect((current.title as Resource).id).assertEqual($r('app.string.embed_product_title004').id);
      expect(current.price).assertEqual('USD 0.00 warranty');
      expect(previous.id).assertEqual(4);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product004').id);
      expect((previous.title as Resource).id).assertEqual($r('app.string.embed_product_title004').id);
      expect(previous.price).assertEqual('USD -5.00 credit');
      expect(later.id).assertEqual(5);
      expect((later.imageRes as Resource).id).assertEqual($r('app.media.embed_product005').id);
      expect((later.title as Resource).id).assertEqual($r('app.string.embed_product_title005').id);
      expect((later.price as Resource).id).assertEqual($r('app.string.embed_product_price005').id);
      expect(current === previous).assertFalse();
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_FIELDSEQUENCE_0045
     * @tc.name testProductFieldSequence0045
     * @tc.desc Headset price clears a pending display then rebinds a resource without changing its peer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testProductFieldSequence0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const previous: ProductDataModel = new ProductDataModel(
        4,
        $r('app.media.embed_product004'),
        $r('app.string.embed_product_title004'),
        $r('app.string.embed_product_price004')
      );
      const current: ProductDataModel = new ProductDataModel(
        4,
        $r('app.media.embed_product004'),
        $r('app.string.embed_product_title004'),
        $r('app.string.embed_product_price004')
      );
      current.price = '';
      expect(current.id).assertEqual(4);
      expect((current.imageRes as Resource).id).assertEqual($r('app.media.embed_product004').id);
      expect((current.title as Resource).id).assertEqual($r('app.string.embed_product_title004').id);
      expect(current.price).assertEqual('');
      expect(previous.id).assertEqual(4);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product004').id);
      expect((previous.title as Resource).id).assertEqual($r('app.string.embed_product_title004').id);
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price004').id);
      current.price = $r('app.string.embed_product_price005');
      const later: ProductDataModel = new ProductDataModel(
        5,
        $r('app.media.embed_product005'),
        $r('app.string.embed_product_title005'),
        $r('app.string.embed_product_price005')
      );
      expect(current.id).assertEqual(4);
      expect((current.imageRes as Resource).id).assertEqual($r('app.media.embed_product004').id);
      expect((current.title as Resource).id).assertEqual($r('app.string.embed_product_title004').id);
      expect((current.price as Resource).id).assertEqual($r('app.string.embed_product_price005').id);
      expect(previous.id).assertEqual(4);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product004').id);
      expect((previous.title as Resource).id).assertEqual($r('app.string.embed_product_title004').id);
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price004').id);
      expect(later.id).assertEqual(5);
      expect((later.imageRes as Resource).id).assertEqual($r('app.media.embed_product005').id);
      expect((later.title as Resource).id).assertEqual($r('app.string.embed_product_title005').id);
      expect((later.price as Resource).id).assertEqual($r('app.string.embed_product_price005').id);
      expect(current === previous).assertFalse();
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_FIELDSEQUENCE_0046
     * @tc.name testProductFieldSequence0046
     * @tc.desc Backpack imageRes detaches to a literal then restores its resource without changing its peer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testProductFieldSequence0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const previous: ProductDataModel = new ProductDataModel(
        5,
        $r('app.media.embed_product005'),
        $r('app.string.embed_product_title005'),
        $r('app.string.embed_product_price005')
      );
      const current: ProductDataModel = new ProductDataModel(
        5,
        $r('app.media.embed_product005'),
        $r('app.string.embed_product_title005'),
        $r('app.string.embed_product_price005')
      );
      current.imageRes = 'file://cache/backpack/front.webp';
      expect(current.id).assertEqual(5);
      expect(current.imageRes).assertEqual('file://cache/backpack/front.webp');
      expect((current.title as Resource).id).assertEqual($r('app.string.embed_product_title005').id);
      expect((current.price as Resource).id).assertEqual($r('app.string.embed_product_price005').id);
      expect(previous.id).assertEqual(5);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product005').id);
      expect((previous.title as Resource).id).assertEqual($r('app.string.embed_product_title005').id);
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price005').id);
      current.imageRes = $r('app.media.embed_product005');
      const later: ProductDataModel = new ProductDataModel(
        0,
        $r('app.media.embed_product000'),
        $r('app.string.embed_product_title000'),
        $r('app.string.embed_product_price000')
      );
      expect(current.id).assertEqual(5);
      expect((current.imageRes as Resource).id).assertEqual($r('app.media.embed_product005').id);
      expect((current.title as Resource).id).assertEqual($r('app.string.embed_product_title005').id);
      expect((current.price as Resource).id).assertEqual($r('app.string.embed_product_price005').id);
      expect(previous.id).assertEqual(5);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product005').id);
      expect((previous.title as Resource).id).assertEqual($r('app.string.embed_product_title005').id);
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price005').id);
      expect(later.id).assertEqual(0);
      expect((later.imageRes as Resource).id).assertEqual($r('app.media.embed_product000').id);
      expect((later.title as Resource).id).assertEqual($r('app.string.embed_product_title000').id);
      expect((later.price as Resource).id).assertEqual($r('app.string.embed_product_price000').id);
      expect(current === previous).assertFalse();
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_FIELDSEQUENCE_0047
     * @tc.name testProductFieldSequence0047
     * @tc.desc Backpack imageRes binds a resource then accepts a sales override while its peer stays literal
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testProductFieldSequence0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const previous: ProductDataModel = new ProductDataModel(
        5,
        'file://cache/backpack/front.webp',
        $r('app.string.embed_product_title005'),
        $r('app.string.embed_product_price005')
      );
      const current: ProductDataModel = new ProductDataModel(
        5,
        'file://cache/backpack/front.webp',
        $r('app.string.embed_product_title005'),
        $r('app.string.embed_product_price005')
      );
      current.imageRes = $r('app.media.embed_product005');
      expect(current.id).assertEqual(5);
      expect((current.imageRes as Resource).id).assertEqual($r('app.media.embed_product005').id);
      expect((current.title as Resource).id).assertEqual($r('app.string.embed_product_title005').id);
      expect((current.price as Resource).id).assertEqual($r('app.string.embed_product_price005').id);
      expect(previous.id).assertEqual(5);
      expect(previous.imageRes).assertEqual('file://cache/backpack/front.webp');
      expect((previous.title as Resource).id).assertEqual($r('app.string.embed_product_title005').id);
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price005').id);
      current.imageRes = 'https://store.example/backpack/inside.webp';
      const later: ProductDataModel = new ProductDataModel(
        0,
        $r('app.media.embed_product000'),
        $r('app.string.embed_product_title000'),
        $r('app.string.embed_product_price000')
      );
      expect(current.id).assertEqual(5);
      expect(current.imageRes).assertEqual('https://store.example/backpack/inside.webp');
      expect((current.title as Resource).id).assertEqual($r('app.string.embed_product_title005').id);
      expect((current.price as Resource).id).assertEqual($r('app.string.embed_product_price005').id);
      expect(previous.id).assertEqual(5);
      expect(previous.imageRes).assertEqual('file://cache/backpack/front.webp');
      expect((previous.title as Resource).id).assertEqual($r('app.string.embed_product_title005').id);
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price005').id);
      expect(later.id).assertEqual(0);
      expect((later.imageRes as Resource).id).assertEqual($r('app.media.embed_product000').id);
      expect((later.title as Resource).id).assertEqual($r('app.string.embed_product_title000').id);
      expect((later.price as Resource).id).assertEqual($r('app.string.embed_product_price000').id);
      expect(current === previous).assertFalse();
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_FIELDSEQUENCE_0048
     * @tc.name testProductFieldSequence0048
     * @tc.desc Backpack imageRes clears a pending display then rebinds a resource without changing its peer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testProductFieldSequence0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const previous: ProductDataModel = new ProductDataModel(
        5,
        $r('app.media.embed_product005'),
        $r('app.string.embed_product_title005'),
        $r('app.string.embed_product_price005')
      );
      const current: ProductDataModel = new ProductDataModel(
        5,
        $r('app.media.embed_product005'),
        $r('app.string.embed_product_title005'),
        $r('app.string.embed_product_price005')
      );
      current.imageRes = '';
      expect(current.id).assertEqual(5);
      expect(current.imageRes).assertEqual('');
      expect((current.title as Resource).id).assertEqual($r('app.string.embed_product_title005').id);
      expect((current.price as Resource).id).assertEqual($r('app.string.embed_product_price005').id);
      expect(previous.id).assertEqual(5);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product005').id);
      expect((previous.title as Resource).id).assertEqual($r('app.string.embed_product_title005').id);
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price005').id);
      current.imageRes = $r('app.media.embed_product000');
      const later: ProductDataModel = new ProductDataModel(
        0,
        $r('app.media.embed_product000'),
        $r('app.string.embed_product_title000'),
        $r('app.string.embed_product_price000')
      );
      expect(current.id).assertEqual(5);
      expect((current.imageRes as Resource).id).assertEqual($r('app.media.embed_product000').id);
      expect((current.title as Resource).id).assertEqual($r('app.string.embed_product_title005').id);
      expect((current.price as Resource).id).assertEqual($r('app.string.embed_product_price005').id);
      expect(previous.id).assertEqual(5);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product005').id);
      expect((previous.title as Resource).id).assertEqual($r('app.string.embed_product_title005').id);
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price005').id);
      expect(later.id).assertEqual(0);
      expect((later.imageRes as Resource).id).assertEqual($r('app.media.embed_product000').id);
      expect((later.title as Resource).id).assertEqual($r('app.string.embed_product_title000').id);
      expect((later.price as Resource).id).assertEqual($r('app.string.embed_product_price000').id);
      expect(current === previous).assertFalse();
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_FIELDSEQUENCE_0049
     * @tc.name testProductFieldSequence0049
     * @tc.desc Backpack title detaches to a literal then restores its resource without changing its peer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testProductFieldSequence0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const previous: ProductDataModel = new ProductDataModel(
        5,
        $r('app.media.embed_product005'),
        $r('app.string.embed_product_title005'),
        $r('app.string.embed_product_price005')
      );
      const current: ProductDataModel = new ProductDataModel(
        5,
        $r('app.media.embed_product005'),
        $r('app.string.embed_product_title005'),
        $r('app.string.embed_product_price005')
      );
      current.title = 'Traveller\'s backpack 24 L - sand';
      expect(current.id).assertEqual(5);
      expect((current.imageRes as Resource).id).assertEqual($r('app.media.embed_product005').id);
      expect(current.title).assertEqual('Traveller\'s backpack 24 L - sand');
      expect((current.price as Resource).id).assertEqual($r('app.string.embed_product_price005').id);
      expect(previous.id).assertEqual(5);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product005').id);
      expect((previous.title as Resource).id).assertEqual($r('app.string.embed_product_title005').id);
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price005').id);
      current.title = $r('app.string.embed_product_title005');
      const later: ProductDataModel = new ProductDataModel(
        0,
        $r('app.media.embed_product000'),
        $r('app.string.embed_product_title000'),
        $r('app.string.embed_product_price000')
      );
      expect(current.id).assertEqual(5);
      expect((current.imageRes as Resource).id).assertEqual($r('app.media.embed_product005').id);
      expect((current.title as Resource).id).assertEqual($r('app.string.embed_product_title005').id);
      expect((current.price as Resource).id).assertEqual($r('app.string.embed_product_price005').id);
      expect(previous.id).assertEqual(5);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product005').id);
      expect((previous.title as Resource).id).assertEqual($r('app.string.embed_product_title005').id);
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price005').id);
      expect(later.id).assertEqual(0);
      expect((later.imageRes as Resource).id).assertEqual($r('app.media.embed_product000').id);
      expect((later.title as Resource).id).assertEqual($r('app.string.embed_product_title000').id);
      expect((later.price as Resource).id).assertEqual($r('app.string.embed_product_price000').id);
      expect(current === previous).assertFalse();
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_FIELDSEQUENCE_0050
     * @tc.name testProductFieldSequence0050
     * @tc.desc Backpack title binds a resource then accepts a sales override while its peer stays literal
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testProductFieldSequence0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const previous: ProductDataModel = new ProductDataModel(
        5,
        $r('app.media.embed_product005'),
        'Traveller\'s backpack 24 L - sand',
        $r('app.string.embed_product_price005')
      );
      const current: ProductDataModel = new ProductDataModel(
        5,
        $r('app.media.embed_product005'),
        'Traveller\'s backpack 24 L - sand',
        $r('app.string.embed_product_price005')
      );
      current.title = $r('app.string.embed_product_title005');
      expect(current.id).assertEqual(5);
      expect((current.imageRes as Resource).id).assertEqual($r('app.media.embed_product005').id);
      expect((current.title as Resource).id).assertEqual($r('app.string.embed_product_title005').id);
      expect((current.price as Resource).id).assertEqual($r('app.string.embed_product_price005').id);
      expect(previous.id).assertEqual(5);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product005').id);
      expect(previous.title).assertEqual('Traveller\'s backpack 24 L - sand');
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price005').id);
      current.title = 'Backpack 24 L - custom label';
      const later: ProductDataModel = new ProductDataModel(
        0,
        $r('app.media.embed_product000'),
        $r('app.string.embed_product_title000'),
        $r('app.string.embed_product_price000')
      );
      expect(current.id).assertEqual(5);
      expect((current.imageRes as Resource).id).assertEqual($r('app.media.embed_product005').id);
      expect(current.title).assertEqual('Backpack 24 L - custom label');
      expect((current.price as Resource).id).assertEqual($r('app.string.embed_product_price005').id);
      expect(previous.id).assertEqual(5);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product005').id);
      expect(previous.title).assertEqual('Traveller\'s backpack 24 L - sand');
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price005').id);
      expect(later.id).assertEqual(0);
      expect((later.imageRes as Resource).id).assertEqual($r('app.media.embed_product000').id);
      expect((later.title as Resource).id).assertEqual($r('app.string.embed_product_title000').id);
      expect((later.price as Resource).id).assertEqual($r('app.string.embed_product_price000').id);
      expect(current === previous).assertFalse();
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_FIELDSEQUENCE_0051
     * @tc.name testProductFieldSequence0051
     * @tc.desc Backpack title clears a pending display then rebinds a resource without changing its peer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testProductFieldSequence0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const previous: ProductDataModel = new ProductDataModel(
        5,
        $r('app.media.embed_product005'),
        $r('app.string.embed_product_title005'),
        $r('app.string.embed_product_price005')
      );
      const current: ProductDataModel = new ProductDataModel(
        5,
        $r('app.media.embed_product005'),
        $r('app.string.embed_product_title005'),
        $r('app.string.embed_product_price005')
      );
      current.title = '';
      expect(current.id).assertEqual(5);
      expect((current.imageRes as Resource).id).assertEqual($r('app.media.embed_product005').id);
      expect(current.title).assertEqual('');
      expect((current.price as Resource).id).assertEqual($r('app.string.embed_product_price005').id);
      expect(previous.id).assertEqual(5);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product005').id);
      expect((previous.title as Resource).id).assertEqual($r('app.string.embed_product_title005').id);
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price005').id);
      current.title = $r('app.string.embed_product_title000');
      const later: ProductDataModel = new ProductDataModel(
        0,
        $r('app.media.embed_product000'),
        $r('app.string.embed_product_title000'),
        $r('app.string.embed_product_price000')
      );
      expect(current.id).assertEqual(5);
      expect((current.imageRes as Resource).id).assertEqual($r('app.media.embed_product005').id);
      expect((current.title as Resource).id).assertEqual($r('app.string.embed_product_title000').id);
      expect((current.price as Resource).id).assertEqual($r('app.string.embed_product_price005').id);
      expect(previous.id).assertEqual(5);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product005').id);
      expect((previous.title as Resource).id).assertEqual($r('app.string.embed_product_title005').id);
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price005').id);
      expect(later.id).assertEqual(0);
      expect((later.imageRes as Resource).id).assertEqual($r('app.media.embed_product000').id);
      expect((later.title as Resource).id).assertEqual($r('app.string.embed_product_title000').id);
      expect((later.price as Resource).id).assertEqual($r('app.string.embed_product_price000').id);
      expect(current === previous).assertFalse();
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_FIELDSEQUENCE_0052
     * @tc.name testProductFieldSequence0052
     * @tc.desc Backpack price detaches to a literal then restores its resource without changing its peer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testProductFieldSequence0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const previous: ProductDataModel = new ProductDataModel(
        5,
        $r('app.media.embed_product005'),
        $r('app.string.embed_product_title005'),
        $r('app.string.embed_product_price005')
      );
      const current: ProductDataModel = new ProductDataModel(
        5,
        $r('app.media.embed_product005'),
        $r('app.string.embed_product_title005'),
        $r('app.string.embed_product_price005')
      );
      current.price = 'USD 39.00-49.00';
      expect(current.id).assertEqual(5);
      expect((current.imageRes as Resource).id).assertEqual($r('app.media.embed_product005').id);
      expect((current.title as Resource).id).assertEqual($r('app.string.embed_product_title005').id);
      expect(current.price).assertEqual('USD 39.00-49.00');
      expect(previous.id).assertEqual(5);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product005').id);
      expect((previous.title as Resource).id).assertEqual($r('app.string.embed_product_title005').id);
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price005').id);
      current.price = $r('app.string.embed_product_price005');
      const later: ProductDataModel = new ProductDataModel(
        0,
        $r('app.media.embed_product000'),
        $r('app.string.embed_product_title000'),
        $r('app.string.embed_product_price000')
      );
      expect(current.id).assertEqual(5);
      expect((current.imageRes as Resource).id).assertEqual($r('app.media.embed_product005').id);
      expect((current.title as Resource).id).assertEqual($r('app.string.embed_product_title005').id);
      expect((current.price as Resource).id).assertEqual($r('app.string.embed_product_price005').id);
      expect(previous.id).assertEqual(5);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product005').id);
      expect((previous.title as Resource).id).assertEqual($r('app.string.embed_product_title005').id);
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price005').id);
      expect(later.id).assertEqual(0);
      expect((later.imageRes as Resource).id).assertEqual($r('app.media.embed_product000').id);
      expect((later.title as Resource).id).assertEqual($r('app.string.embed_product_title000').id);
      expect((later.price as Resource).id).assertEqual($r('app.string.embed_product_price000').id);
      expect(current === previous).assertFalse();
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_FIELDSEQUENCE_0053
     * @tc.name testProductFieldSequence0053
     * @tc.desc Backpack price binds a resource then accepts a sales override while its peer stays literal
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testProductFieldSequence0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const previous: ProductDataModel = new ProductDataModel(
        5,
        $r('app.media.embed_product005'),
        $r('app.string.embed_product_title005'),
        'USD 39.00-49.00'
      );
      const current: ProductDataModel = new ProductDataModel(
        5,
        $r('app.media.embed_product005'),
        $r('app.string.embed_product_title005'),
        'USD 39.00-49.00'
      );
      current.price = $r('app.string.embed_product_price005');
      expect(current.id).assertEqual(5);
      expect((current.imageRes as Resource).id).assertEqual($r('app.media.embed_product005').id);
      expect((current.title as Resource).id).assertEqual($r('app.string.embed_product_title005').id);
      expect((current.price as Resource).id).assertEqual($r('app.string.embed_product_price005').id);
      expect(previous.id).assertEqual(5);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product005').id);
      expect((previous.title as Resource).id).assertEqual($r('app.string.embed_product_title005').id);
      expect(previous.price).assertEqual('USD 39.00-49.00');
      current.price = 'USD 34.00 member';
      const later: ProductDataModel = new ProductDataModel(
        0,
        $r('app.media.embed_product000'),
        $r('app.string.embed_product_title000'),
        $r('app.string.embed_product_price000')
      );
      expect(current.id).assertEqual(5);
      expect((current.imageRes as Resource).id).assertEqual($r('app.media.embed_product005').id);
      expect((current.title as Resource).id).assertEqual($r('app.string.embed_product_title005').id);
      expect(current.price).assertEqual('USD 34.00 member');
      expect(previous.id).assertEqual(5);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product005').id);
      expect((previous.title as Resource).id).assertEqual($r('app.string.embed_product_title005').id);
      expect(previous.price).assertEqual('USD 39.00-49.00');
      expect(later.id).assertEqual(0);
      expect((later.imageRes as Resource).id).assertEqual($r('app.media.embed_product000').id);
      expect((later.title as Resource).id).assertEqual($r('app.string.embed_product_title000').id);
      expect((later.price as Resource).id).assertEqual($r('app.string.embed_product_price000').id);
      expect(current === previous).assertFalse();
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_FIELDSEQUENCE_0054
     * @tc.name testProductFieldSequence0054
     * @tc.desc Backpack price clears a pending display then rebinds a resource without changing its peer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testProductFieldSequence0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const previous: ProductDataModel = new ProductDataModel(
        5,
        $r('app.media.embed_product005'),
        $r('app.string.embed_product_title005'),
        $r('app.string.embed_product_price005')
      );
      const current: ProductDataModel = new ProductDataModel(
        5,
        $r('app.media.embed_product005'),
        $r('app.string.embed_product_title005'),
        $r('app.string.embed_product_price005')
      );
      current.price = '';
      expect(current.id).assertEqual(5);
      expect((current.imageRes as Resource).id).assertEqual($r('app.media.embed_product005').id);
      expect((current.title as Resource).id).assertEqual($r('app.string.embed_product_title005').id);
      expect(current.price).assertEqual('');
      expect(previous.id).assertEqual(5);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product005').id);
      expect((previous.title as Resource).id).assertEqual($r('app.string.embed_product_title005').id);
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price005').id);
      current.price = $r('app.string.embed_product_price000');
      const later: ProductDataModel = new ProductDataModel(
        0,
        $r('app.media.embed_product000'),
        $r('app.string.embed_product_title000'),
        $r('app.string.embed_product_price000')
      );
      expect(current.id).assertEqual(5);
      expect((current.imageRes as Resource).id).assertEqual($r('app.media.embed_product005').id);
      expect((current.title as Resource).id).assertEqual($r('app.string.embed_product_title005').id);
      expect((current.price as Resource).id).assertEqual($r('app.string.embed_product_price000').id);
      expect(previous.id).assertEqual(5);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product005').id);
      expect((previous.title as Resource).id).assertEqual($r('app.string.embed_product_title005').id);
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price005').id);
      expect(later.id).assertEqual(0);
      expect((later.imageRes as Resource).id).assertEqual($r('app.media.embed_product000').id);
      expect((later.title as Resource).id).assertEqual($r('app.string.embed_product_title000').id);
      expect((later.price as Resource).id).assertEqual($r('app.string.embed_product_price000').id);
      expect(current === previous).assertFalse();
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_FIELDSEQUENCE_0055
     * @tc.name testProductFieldSequence0055
     * @tc.desc Power bank replaces imageRes before title; a later same-id copy survives restoring the first field
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testProductFieldSequence0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
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
      current.title = $r('app.string.embed_product_title001');
      expect(current.id).assertEqual(0);
      expect(current.imageRes).assertEqual('https://store.example/power-bank/front.webp');
      expect((current.title as Resource).id).assertEqual($r('app.string.embed_product_title001').id);
      expect((current.price as Resource).id).assertEqual($r('app.string.embed_product_price000').id);
      const later: ProductDataModel = new ProductDataModel(
        0,
        current.imageRes,
        current.title,
        current.price
      );
      expect(later.id).assertEqual(0);
      expect(later.imageRes).assertEqual('https://store.example/power-bank/front.webp');
      expect((later.title as Resource).id).assertEqual($r('app.string.embed_product_title001').id);
      expect((later.price as Resource).id).assertEqual($r('app.string.embed_product_price000').id);
      current.imageRes = $r('app.media.embed_product000');
      expect(current.id).assertEqual(0);
      expect((current.imageRes as Resource).id).assertEqual($r('app.media.embed_product000').id);
      expect((current.title as Resource).id).assertEqual($r('app.string.embed_product_title001').id);
      expect((current.price as Resource).id).assertEqual($r('app.string.embed_product_price000').id);
      expect(later.id).assertEqual(0);
      expect(later.imageRes).assertEqual('https://store.example/power-bank/front.webp');
      expect((later.title as Resource).id).assertEqual($r('app.string.embed_product_title001').id);
      expect((later.price as Resource).id).assertEqual($r('app.string.embed_product_price000').id);
      expect(previous.id).assertEqual(0);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product000').id);
      expect((previous.title as Resource).id).assertEqual($r('app.string.embed_product_title000').id);
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price000').id);
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_FIELDSEQUENCE_0056
     * @tc.name testProductFieldSequence0056
     * @tc.desc Power bank replaces title before price; a later same-id copy survives restoring the first field
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testProductFieldSequence0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
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
      current.price = $r('app.string.embed_product_price001');
      expect(current.id).assertEqual(0);
      expect((current.imageRes as Resource).id).assertEqual($r('app.media.embed_product000').id);
      expect(current.title).assertEqual('Power bank 20000 mAh - graphite');
      expect((current.price as Resource).id).assertEqual($r('app.string.embed_product_price001').id);
      const later: ProductDataModel = new ProductDataModel(
        0,
        current.imageRes,
