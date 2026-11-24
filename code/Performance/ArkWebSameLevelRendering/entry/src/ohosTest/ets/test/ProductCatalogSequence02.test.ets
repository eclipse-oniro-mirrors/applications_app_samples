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
import { PRODUCT_DATA } from '../../../main/ets/viewmodel/GoodsViewModel';
import { resourceManager } from '@kit.LocalizationKit';
import { entryResources, testResources } from './shared/Probe';
import { paceTurn } from './shared/TestPace';

async function hasExpectedMedia(
  res: resourceManager.ResourceManager,
  value: ResourceStr,
  expectedName: string
): Promise<boolean> {
  const actual: Uint8Array = res.getMediaContentSync((value as Resource).id);
  const expected: Uint8Array = entryResources().getMediaByNameSync(expectedName);
  if (actual.length !== expected.length) {
    return false;
  }
  let compared: number = 0;
  for (let index: number = 0; index < actual.length; index++) {
    if (actual[index] !== expected[index]) {
      return false;
    }
    compared++;
    if (compared === 65536) {
      await paceTurn();
      compared = 0;
    }
  }
  return true;
}

async function assertOriginalCatalog(res: resourceManager.ResourceManager): Promise<void> {
  const oracle: resourceManager.ResourceManager = entryResources();
  expect(PRODUCT_DATA.length).assertEqual(6);
  expect(PRODUCT_DATA[0].id).assertEqual(0);
  expect((PRODUCT_DATA[0].imageRes as Resource).id).assertEqual($r('app.media.embed_product000').id);
  expect(await hasExpectedMedia(res, PRODUCT_DATA[0].imageRes, 'embed_product000')).assertTrue();
  expect((PRODUCT_DATA[0].title as Resource).id).assertEqual($r('app.string.embed_product_title000').id);
  expect(res.getStringSync((PRODUCT_DATA[0].title as Resource).id)).assertEqual(
    oracle.getStringByNameSync('embed_product_title000'));
  expect((PRODUCT_DATA[0].price as Resource).id).assertEqual($r('app.string.embed_product_price000').id);
  expect(res.getStringSync((PRODUCT_DATA[0].price as Resource).id)).assertEqual(
    oracle.getStringByNameSync('embed_product_price000'));
  expect(PRODUCT_DATA[1].id).assertEqual(1);
  expect((PRODUCT_DATA[1].imageRes as Resource).id).assertEqual($r('app.media.embed_product001').id);
  expect(await hasExpectedMedia(res, PRODUCT_DATA[1].imageRes, 'embed_product001')).assertTrue();
  expect((PRODUCT_DATA[1].title as Resource).id).assertEqual($r('app.string.embed_product_title001').id);
  expect(res.getStringSync((PRODUCT_DATA[1].title as Resource).id)).assertEqual(
    oracle.getStringByNameSync('embed_product_title001'));
  expect((PRODUCT_DATA[1].price as Resource).id).assertEqual($r('app.string.embed_product_price001').id);
  expect(res.getStringSync((PRODUCT_DATA[1].price as Resource).id)).assertEqual(
    oracle.getStringByNameSync('embed_product_price001'));
  expect(PRODUCT_DATA[2].id).assertEqual(2);
  expect((PRODUCT_DATA[2].imageRes as Resource).id).assertEqual($r('app.media.embed_product002').id);
  expect(await hasExpectedMedia(res, PRODUCT_DATA[2].imageRes, 'embed_product002')).assertTrue();
  expect((PRODUCT_DATA[2].title as Resource).id).assertEqual($r('app.string.embed_product_title002').id);
  expect(res.getStringSync((PRODUCT_DATA[2].title as Resource).id)).assertEqual(
    oracle.getStringByNameSync('embed_product_title002'));
  expect((PRODUCT_DATA[2].price as Resource).id).assertEqual($r('app.string.embed_product_price002').id);
  expect(res.getStringSync((PRODUCT_DATA[2].price as Resource).id)).assertEqual(
    oracle.getStringByNameSync('embed_product_price002'));
  expect(PRODUCT_DATA[3].id).assertEqual(3);
  expect((PRODUCT_DATA[3].imageRes as Resource).id).assertEqual($r('app.media.embed_product003').id);
  expect(await hasExpectedMedia(res, PRODUCT_DATA[3].imageRes, 'embed_product003')).assertTrue();
  expect((PRODUCT_DATA[3].title as Resource).id).assertEqual($r('app.string.embed_product_title003').id);
  expect(res.getStringSync((PRODUCT_DATA[3].title as Resource).id)).assertEqual(
    oracle.getStringByNameSync('embed_product_title003'));
  expect((PRODUCT_DATA[3].price as Resource).id).assertEqual($r('app.string.embed_product_price003').id);
  expect(res.getStringSync((PRODUCT_DATA[3].price as Resource).id)).assertEqual(
    oracle.getStringByNameSync('embed_product_price003'));
  expect(PRODUCT_DATA[4].id).assertEqual(4);
  expect((PRODUCT_DATA[4].imageRes as Resource).id).assertEqual($r('app.media.embed_product004').id);
  expect(await hasExpectedMedia(res, PRODUCT_DATA[4].imageRes, 'embed_product004')).assertTrue();
  expect((PRODUCT_DATA[4].title as Resource).id).assertEqual($r('app.string.embed_product_title004').id);
  expect(res.getStringSync((PRODUCT_DATA[4].title as Resource).id)).assertEqual(
    oracle.getStringByNameSync('embed_product_title004'));
  expect((PRODUCT_DATA[4].price as Resource).id).assertEqual($r('app.string.embed_product_price004').id);
  expect(res.getStringSync((PRODUCT_DATA[4].price as Resource).id)).assertEqual(
    oracle.getStringByNameSync('embed_product_price004'));
  expect(PRODUCT_DATA[5].id).assertEqual(5);
  expect((PRODUCT_DATA[5].imageRes as Resource).id).assertEqual($r('app.media.embed_product005').id);
  expect(await hasExpectedMedia(res, PRODUCT_DATA[5].imageRes, 'embed_product005')).assertTrue();
  expect((PRODUCT_DATA[5].title as Resource).id).assertEqual($r('app.string.embed_product_title005').id);
  expect(res.getStringSync((PRODUCT_DATA[5].title as Resource).id)).assertEqual(
    oracle.getStringByNameSync('embed_product_title005'));
  expect((PRODUCT_DATA[5].price as Resource).id).assertEqual($r('app.string.embed_product_price005').id);
  expect(res.getStringSync((PRODUCT_DATA[5].price as Resource).id)).assertEqual(
    oracle.getStringByNameSync('embed_product_price005'));
}

export default function productCatalogSequence02Test(): void {
  describe('productCatalogSequence02Test', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_CATALOGSEQUENCE_0025
     * @tc.name testProductCatalogSequence0025
     * @tc.desc Charger LLL copy is rekeyed and replaced; its peer and all six catalog originals survive
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testProductCatalogSequence0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const res: resourceManager.ResourceManager = testResources();
      const oracle: resourceManager.ResourceManager = entryResources();
      const seed: ProductDataModel = PRODUCT_DATA[3];
      const previous: ProductDataModel = new ProductDataModel(
        3,
        seed.imageRes,
        seed.title,
        seed.price
      );
      const current: ProductDataModel = new ProductDataModel(
        3,
        'file://cache/charger/front.webp',
        oracle.getStringByNameSync('embed_product_title003'),
        oracle.getStringByNameSync('embed_product_price003')
      );
      expect(current.id).assertEqual(3);
      expect(current.imageRes).assertEqual('file://cache/charger/front.webp');
      expect(current.title).assertEqual(oracle.getStringByNameSync('embed_product_title003'));
      expect(current.price).assertEqual(oracle.getStringByNameSync('embed_product_price003'));
      current.id = 4;
      current.imageRes = $r('app.media.embed_product004');
      current.title = $r('app.string.embed_product_title004');
      current.price = $r('app.string.embed_product_price004');
      expect(current.id).assertEqual(4);
      expect((current.imageRes as Resource).id).assertEqual($r('app.media.embed_product004').id);
      expect(await hasExpectedMedia(res, current.imageRes, 'embed_product004')).assertTrue();
      expect((current.title as Resource).id).assertEqual($r('app.string.embed_product_title004').id);
      expect(res.getStringSync((current.title as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_title004'));
      expect((current.price as Resource).id).assertEqual($r('app.string.embed_product_price004').id);
      expect(res.getStringSync((current.price as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_price004'));
      expect(previous.id).assertEqual(3);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product003').id);
      expect(await hasExpectedMedia(res, previous.imageRes, 'embed_product003')).assertTrue();
      expect((previous.title as Resource).id).assertEqual($r('app.string.embed_product_title003').id);
      expect(res.getStringSync((previous.title as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_title003'));
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price003').id);
      expect(res.getStringSync((previous.price as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_price003'));
      expect(PRODUCT_DATA[3] === seed).assertTrue();
      expect(current === seed).assertFalse();
      await assertOriginalCatalog(res);
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_CATALOGSEQUENCE_0026
     * @tc.name testProductCatalogSequence0026
     * @tc.desc Charger RLL copy is rekeyed and replaced; its peer and all six catalog originals survive
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testProductCatalogSequence0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const res: resourceManager.ResourceManager = testResources();
      const oracle: resourceManager.ResourceManager = entryResources();
      const seed: ProductDataModel = PRODUCT_DATA[3];
      const previous: ProductDataModel = new ProductDataModel(
        3,
        seed.imageRes,
        seed.title,
        seed.price
      );
      const current: ProductDataModel = new ProductDataModel(
        3,
        $r('app.media.embed_product003'),
        oracle.getStringByNameSync('embed_product_title003'),
        oracle.getStringByNameSync('embed_product_price003')
      );
      expect(current.id).assertEqual(3);
      expect((current.imageRes as Resource).id).assertEqual($r('app.media.embed_product003').id);
      expect(await hasExpectedMedia(res, current.imageRes, 'embed_product003')).assertTrue();
      expect(current.title).assertEqual(oracle.getStringByNameSync('embed_product_title003'));
      expect(current.price).assertEqual(oracle.getStringByNameSync('embed_product_price003'));
      current.id = 4;
      current.imageRes = 'https://store.example/headset/front.webp';
      current.title = $r('app.string.embed_product_title004');
      current.price = $r('app.string.embed_product_price004');
      expect(current.id).assertEqual(4);
      expect(current.imageRes).assertEqual('https://store.example/headset/front.webp');
      expect((current.title as Resource).id).assertEqual($r('app.string.embed_product_title004').id);
      expect(res.getStringSync((current.title as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_title004'));
      expect((current.price as Resource).id).assertEqual($r('app.string.embed_product_price004').id);
      expect(res.getStringSync((current.price as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_price004'));
      expect(previous.id).assertEqual(3);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product003').id);
      expect(await hasExpectedMedia(res, previous.imageRes, 'embed_product003')).assertTrue();
      expect((previous.title as Resource).id).assertEqual($r('app.string.embed_product_title003').id);
      expect(res.getStringSync((previous.title as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_title003'));
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price003').id);
      expect(res.getStringSync((previous.price as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_price003'));
      expect(PRODUCT_DATA[3] === seed).assertTrue();
      expect(current === seed).assertFalse();
      await assertOriginalCatalog(res);
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_CATALOGSEQUENCE_0027
     * @tc.name testProductCatalogSequence0027
     * @tc.desc Charger LRL copy is rekeyed and replaced; its peer and all six catalog originals survive
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testProductCatalogSequence0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const res: resourceManager.ResourceManager = testResources();
      const oracle: resourceManager.ResourceManager = entryResources();
      const seed: ProductDataModel = PRODUCT_DATA[3];
      const previous: ProductDataModel = new ProductDataModel(
        3,
        seed.imageRes,
        seed.title,
        seed.price
      );
      const current: ProductDataModel = new ProductDataModel(
        3,
        'file://cache/charger/front.webp',
        $r('app.string.embed_product_title003'),
        oracle.getStringByNameSync('embed_product_price003')
      );
      expect(current.id).assertEqual(3);
      expect(current.imageRes).assertEqual('file://cache/charger/front.webp');
      expect((current.title as Resource).id).assertEqual($r('app.string.embed_product_title003').id);
      expect(res.getStringSync((current.title as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_title003'));
      expect(current.price).assertEqual(oracle.getStringByNameSync('embed_product_price003'));
      current.id = 4;
      current.imageRes = $r('app.media.embed_product004');
      current.title = oracle.getStringByNameSync('embed_product_title004');
      current.price = $r('app.string.embed_product_price004');
      expect(current.id).assertEqual(4);
      expect((current.imageRes as Resource).id).assertEqual($r('app.media.embed_product004').id);
      expect(await hasExpectedMedia(res, current.imageRes, 'embed_product004')).assertTrue();
      expect(current.title).assertEqual(oracle.getStringByNameSync('embed_product_title004'));
      expect((current.price as Resource).id).assertEqual($r('app.string.embed_product_price004').id);
      expect(res.getStringSync((current.price as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_price004'));
      expect(previous.id).assertEqual(3);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product003').id);
      expect(await hasExpectedMedia(res, previous.imageRes, 'embed_product003')).assertTrue();
      expect((previous.title as Resource).id).assertEqual($r('app.string.embed_product_title003').id);
      expect(res.getStringSync((previous.title as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_title003'));
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price003').id);
      expect(res.getStringSync((previous.price as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_price003'));
      expect(PRODUCT_DATA[3] === seed).assertTrue();
      expect(current === seed).assertFalse();
      await assertOriginalCatalog(res);
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_CATALOGSEQUENCE_0028
     * @tc.name testProductCatalogSequence0028
     * @tc.desc Charger RRL copy is rekeyed and replaced; its peer and all six catalog originals survive
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testProductCatalogSequence0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const res: resourceManager.ResourceManager = testResources();
      const oracle: resourceManager.ResourceManager = entryResources();
      const seed: ProductDataModel = PRODUCT_DATA[3];
      const previous: ProductDataModel = new ProductDataModel(
        3,
        seed.imageRes,
        seed.title,
        seed.price
      );
      const current: ProductDataModel = new ProductDataModel(
        3,
        $r('app.media.embed_product003'),
        $r('app.string.embed_product_title003'),
        oracle.getStringByNameSync('embed_product_price003')
      );
      expect(current.id).assertEqual(3);
      expect((current.imageRes as Resource).id).assertEqual($r('app.media.embed_product003').id);
      expect(await hasExpectedMedia(res, current.imageRes, 'embed_product003')).assertTrue();
      expect((current.title as Resource).id).assertEqual($r('app.string.embed_product_title003').id);
      expect(res.getStringSync((current.title as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_title003'));
      expect(current.price).assertEqual(oracle.getStringByNameSync('embed_product_price003'));
      current.id = 4;
      current.imageRes = 'https://store.example/headset/front.webp';
      current.title = oracle.getStringByNameSync('embed_product_title004');
      current.price = $r('app.string.embed_product_price004');
      expect(current.id).assertEqual(4);
      expect(current.imageRes).assertEqual('https://store.example/headset/front.webp');
      expect(current.title).assertEqual(oracle.getStringByNameSync('embed_product_title004'));
      expect((current.price as Resource).id).assertEqual($r('app.string.embed_product_price004').id);
      expect(res.getStringSync((current.price as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_price004'));
      expect(previous.id).assertEqual(3);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product003').id);
      expect(await hasExpectedMedia(res, previous.imageRes, 'embed_product003')).assertTrue();
      expect((previous.title as Resource).id).assertEqual($r('app.string.embed_product_title003').id);
      expect(res.getStringSync((previous.title as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_title003'));
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price003').id);
      expect(res.getStringSync((previous.price as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_price003'));
      expect(PRODUCT_DATA[3] === seed).assertTrue();
      expect(current === seed).assertFalse();
      await assertOriginalCatalog(res);
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_CATALOGSEQUENCE_0029
     * @tc.name testProductCatalogSequence0029
     * @tc.desc Charger LLR copy is rekeyed and replaced; its peer and all six catalog originals survive
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testProductCatalogSequence0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const res: resourceManager.ResourceManager = testResources();
      const oracle: resourceManager.ResourceManager = entryResources();
      const seed: ProductDataModel = PRODUCT_DATA[3];
      const previous: ProductDataModel = new ProductDataModel(
        3,
        seed.imageRes,
        seed.title,
        seed.price
      );
      const current: ProductDataModel = new ProductDataModel(
        3,
        'file://cache/charger/front.webp',
        oracle.getStringByNameSync('embed_product_title003'),
        $r('app.string.embed_product_price003')
      );
      expect(current.id).assertEqual(3);
      expect(current.imageRes).assertEqual('file://cache/charger/front.webp');
      expect(current.title).assertEqual(oracle.getStringByNameSync('embed_product_title003'));
      expect((current.price as Resource).id).assertEqual($r('app.string.embed_product_price003').id);
      expect(res.getStringSync((current.price as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_price003'));
      current.id = 4;
      current.imageRes = $r('app.media.embed_product004');
      current.title = $r('app.string.embed_product_title004');
      current.price = oracle.getStringByNameSync('embed_product_price004');
      expect(current.id).assertEqual(4);
      expect((current.imageRes as Resource).id).assertEqual($r('app.media.embed_product004').id);
      expect(await hasExpectedMedia(res, current.imageRes, 'embed_product004')).assertTrue();
      expect((current.title as Resource).id).assertEqual($r('app.string.embed_product_title004').id);
      expect(res.getStringSync((current.title as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_title004'));
      expect(current.price).assertEqual(oracle.getStringByNameSync('embed_product_price004'));
      expect(previous.id).assertEqual(3);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product003').id);
      expect(await hasExpectedMedia(res, previous.imageRes, 'embed_product003')).assertTrue();
      expect((previous.title as Resource).id).assertEqual($r('app.string.embed_product_title003').id);
      expect(res.getStringSync((previous.title as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_title003'));
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price003').id);
      expect(res.getStringSync((previous.price as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_price003'));
      expect(PRODUCT_DATA[3] === seed).assertTrue();
      expect(current === seed).assertFalse();
      await assertOriginalCatalog(res);
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_CATALOGSEQUENCE_0030
     * @tc.name testProductCatalogSequence0030
     * @tc.desc Charger RLR copy is rekeyed and replaced; its peer and all six catalog originals survive
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testProductCatalogSequence0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const res: resourceManager.ResourceManager = testResources();
      const oracle: resourceManager.ResourceManager = entryResources();
      const seed: ProductDataModel = PRODUCT_DATA[3];
      const previous: ProductDataModel = new ProductDataModel(
        3,
        seed.imageRes,
        seed.title,
        seed.price
      );
      const current: ProductDataModel = new ProductDataModel(
        3,
        $r('app.media.embed_product003'),
        oracle.getStringByNameSync('embed_product_title003'),
        $r('app.string.embed_product_price003')
      );
      expect(current.id).assertEqual(3);
      expect((current.imageRes as Resource).id).assertEqual($r('app.media.embed_product003').id);
      expect(await hasExpectedMedia(res, current.imageRes, 'embed_product003')).assertTrue();
      expect(current.title).assertEqual(oracle.getStringByNameSync('embed_product_title003'));
      expect((current.price as Resource).id).assertEqual($r('app.string.embed_product_price003').id);
      expect(res.getStringSync((current.price as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_price003'));
      current.id = 4;
      current.imageRes = 'https://store.example/headset/front.webp';
      current.title = $r('app.string.embed_product_title004');
      current.price = oracle.getStringByNameSync('embed_product_price004');
      expect(current.id).assertEqual(4);
      expect(current.imageRes).assertEqual('https://store.example/headset/front.webp');
      expect((current.title as Resource).id).assertEqual($r('app.string.embed_product_title004').id);
      expect(res.getStringSync((current.title as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_title004'));
      expect(current.price).assertEqual(oracle.getStringByNameSync('embed_product_price004'));
      expect(previous.id).assertEqual(3);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product003').id);
      expect(await hasExpectedMedia(res, previous.imageRes, 'embed_product003')).assertTrue();
      expect((previous.title as Resource).id).assertEqual($r('app.string.embed_product_title003').id);
      expect(res.getStringSync((previous.title as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_title003'));
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price003').id);
      expect(res.getStringSync((previous.price as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_price003'));
      expect(PRODUCT_DATA[3] === seed).assertTrue();
      expect(current === seed).assertFalse();
      await assertOriginalCatalog(res);
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_CATALOGSEQUENCE_0031
     * @tc.name testProductCatalogSequence0031
     * @tc.desc Charger LRR copy is rekeyed and replaced; its peer and all six catalog originals survive
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testProductCatalogSequence0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const res: resourceManager.ResourceManager = testResources();
      const oracle: resourceManager.ResourceManager = entryResources();
      const seed: ProductDataModel = PRODUCT_DATA[3];
      const previous: ProductDataModel = new ProductDataModel(
        3,
        seed.imageRes,
        seed.title,
        seed.price
      );
      const current: ProductDataModel = new ProductDataModel(
        3,
        'file://cache/charger/front.webp',
        $r('app.string.embed_product_title003'),
        $r('app.string.embed_product_price003')
      );
      expect(current.id).assertEqual(3);
      expect(current.imageRes).assertEqual('file://cache/charger/front.webp');
      expect((current.title as Resource).id).assertEqual($r('app.string.embed_product_title003').id);
      expect(res.getStringSync((current.title as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_title003'));
      expect((current.price as Resource).id).assertEqual($r('app.string.embed_product_price003').id);
      expect(res.getStringSync((current.price as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_price003'));
      current.id = 4;
      current.imageRes = $r('app.media.embed_product004');
      current.title = oracle.getStringByNameSync('embed_product_title004');
      current.price = oracle.getStringByNameSync('embed_product_price004');
      expect(current.id).assertEqual(4);
      expect((current.imageRes as Resource).id).assertEqual($r('app.media.embed_product004').id);
      expect(await hasExpectedMedia(res, current.imageRes, 'embed_product004')).assertTrue();
      expect(current.title).assertEqual(oracle.getStringByNameSync('embed_product_title004'));
      expect(current.price).assertEqual(oracle.getStringByNameSync('embed_product_price004'));
      expect(previous.id).assertEqual(3);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product003').id);
      expect(await hasExpectedMedia(res, previous.imageRes, 'embed_product003')).assertTrue();
      expect((previous.title as Resource).id).assertEqual($r('app.string.embed_product_title003').id);
      expect(res.getStringSync((previous.title as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_title003'));
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price003').id);
      expect(res.getStringSync((previous.price as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_price003'));
      expect(PRODUCT_DATA[3] === seed).assertTrue();
      expect(current === seed).assertFalse();
      await assertOriginalCatalog(res);
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_CATALOGSEQUENCE_0032
     * @tc.name testProductCatalogSequence0032
     * @tc.desc Charger RRR copy is rekeyed and replaced; its peer and all six catalog originals survive
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testProductCatalogSequence0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const res: resourceManager.ResourceManager = testResources();
      const oracle: resourceManager.ResourceManager = entryResources();
      const seed: ProductDataModel = PRODUCT_DATA[3];
      const previous: ProductDataModel = new ProductDataModel(
        3,
        seed.imageRes,
        seed.title,
        seed.price
      );
      const current: ProductDataModel = new ProductDataModel(
        3,
        $r('app.media.embed_product003'),
        $r('app.string.embed_product_title003'),
        $r('app.string.embed_product_price003')
      );
      expect(current.id).assertEqual(3);
      expect((current.imageRes as Resource).id).assertEqual($r('app.media.embed_product003').id);
      expect(await hasExpectedMedia(res, current.imageRes, 'embed_product003')).assertTrue();
      expect((current.title as Resource).id).assertEqual($r('app.string.embed_product_title003').id);
      expect(res.getStringSync((current.title as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_title003'));
      expect((current.price as Resource).id).assertEqual($r('app.string.embed_product_price003').id);
      expect(res.getStringSync((current.price as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_price003'));
      current.id = 4;
      current.imageRes = 'https://store.example/headset/front.webp';
      current.title = oracle.getStringByNameSync('embed_product_title004');
      current.price = oracle.getStringByNameSync('embed_product_price004');
      expect(current.id).assertEqual(4);
      expect(current.imageRes).assertEqual('https://store.example/headset/front.webp');
      expect(current.title).assertEqual(oracle.getStringByNameSync('embed_product_title004'));
      expect(current.price).assertEqual(oracle.getStringByNameSync('embed_product_price004'));
      expect(previous.id).assertEqual(3);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product003').id);
      expect(await hasExpectedMedia(res, previous.imageRes, 'embed_product003')).assertTrue();
      expect((previous.title as Resource).id).assertEqual($r('app.string.embed_product_title003').id);
      expect(res.getStringSync((previous.title as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_title003'));
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price003').id);
      expect(res.getStringSync((previous.price as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_price003'));
      expect(PRODUCT_DATA[3] === seed).assertTrue();
      expect(current === seed).assertFalse();
      await assertOriginalCatalog(res);
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_CATALOGSEQUENCE_0033
     * @tc.name testProductCatalogSequence0033
     * @tc.desc Headset LLL copy is rekeyed and replaced; its peer and all six catalog originals survive
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testProductCatalogSequence0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const res: resourceManager.ResourceManager = testResources();
      const oracle: resourceManager.ResourceManager = entryResources();
      const seed: ProductDataModel = PRODUCT_DATA[4];
      const previous: ProductDataModel = new ProductDataModel(
        4,
        seed.imageRes,
        seed.title,
        seed.price
      );
      const current: ProductDataModel = new ProductDataModel(
        4,
        'https://store.example/headset/front.webp',
        oracle.getStringByNameSync('embed_product_title004'),
        oracle.getStringByNameSync('embed_product_price004')
      );
      expect(current.id).assertEqual(4);
      expect(current.imageRes).assertEqual('https://store.example/headset/front.webp');
      expect(current.title).assertEqual(oracle.getStringByNameSync('embed_product_title004'));
      expect(current.price).assertEqual(oracle.getStringByNameSync('embed_product_price004'));
      current.id = 5;
      current.imageRes = $r('app.media.embed_product005');
      current.title = $r('app.string.embed_product_title005');
      current.price = $r('app.string.embed_product_price005');
      expect(current.id).assertEqual(5);
      expect((current.imageRes as Resource).id).assertEqual($r('app.media.embed_product005').id);
      expect(await hasExpectedMedia(res, current.imageRes, 'embed_product005')).assertTrue();
      expect((current.title as Resource).id).assertEqual($r('app.string.embed_product_title005').id);
      expect(res.getStringSync((current.title as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_title005'));
      expect((current.price as Resource).id).assertEqual($r('app.string.embed_product_price005').id);
      expect(res.getStringSync((current.price as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_price005'));
      expect(previous.id).assertEqual(4);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product004').id);
      expect(await hasExpectedMedia(res, previous.imageRes, 'embed_product004')).assertTrue();
      expect((previous.title as Resource).id).assertEqual($r('app.string.embed_product_title004').id);
      expect(res.getStringSync((previous.title as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_title004'));
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price004').id);
      expect(res.getStringSync((previous.price as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_price004'));
      expect(PRODUCT_DATA[4] === seed).assertTrue();
      expect(current === seed).assertFalse();
      await assertOriginalCatalog(res);
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_CATALOGSEQUENCE_0034
     * @tc.name testProductCatalogSequence0034
     * @tc.desc Headset RLL copy is rekeyed and replaced; its peer and all six catalog originals survive
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testProductCatalogSequence0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const res: resourceManager.ResourceManager = testResources();
      const oracle: resourceManager.ResourceManager = entryResources();
      const seed: ProductDataModel = PRODUCT_DATA[4];
      const previous: ProductDataModel = new ProductDataModel(
        4,
        seed.imageRes,
        seed.title,
        seed.price
      );
      const current: ProductDataModel = new ProductDataModel(
        4,
        $r('app.media.embed_product004'),
        oracle.getStringByNameSync('embed_product_title004'),
        oracle.getStringByNameSync('embed_product_price004')
      );
      expect(current.id).assertEqual(4);
      expect((current.imageRes as Resource).id).assertEqual($r('app.media.embed_product004').id);
      expect(await hasExpectedMedia(res, current.imageRes, 'embed_product004')).assertTrue();
      expect(current.title).assertEqual(oracle.getStringByNameSync('embed_product_title004'));
      expect(current.price).assertEqual(oracle.getStringByNameSync('embed_product_price004'));
      current.id = 5;
      current.imageRes = 'file://cache/backpack/front.webp';
      current.title = $r('app.string.embed_product_title005');
      current.price = $r('app.string.embed_product_price005');
      expect(current.id).assertEqual(5);
      expect(current.imageRes).assertEqual('file://cache/backpack/front.webp');
      expect((current.title as Resource).id).assertEqual($r('app.string.embed_product_title005').id);
      expect(res.getStringSync((current.title as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_title005'));
      expect((current.price as Resource).id).assertEqual($r('app.string.embed_product_price005').id);
      expect(res.getStringSync((current.price as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_price005'));
      expect(previous.id).assertEqual(4);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product004').id);
      expect(await hasExpectedMedia(res, previous.imageRes, 'embed_product004')).assertTrue();
      expect((previous.title as Resource).id).assertEqual($r('app.string.embed_product_title004').id);
      expect(res.getStringSync((previous.title as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_title004'));
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price004').id);
      expect(res.getStringSync((previous.price as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_price004'));
      expect(PRODUCT_DATA[4] === seed).assertTrue();
      expect(current === seed).assertFalse();
      await assertOriginalCatalog(res);
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_CATALOGSEQUENCE_0035
     * @tc.name testProductCatalogSequence0035
     * @tc.desc Headset LRL copy is rekeyed and replaced; its peer and all six catalog originals survive
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testProductCatalogSequence0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const res: resourceManager.ResourceManager = testResources();
      const oracle: resourceManager.ResourceManager = entryResources();
      const seed: ProductDataModel = PRODUCT_DATA[4];
      const previous: ProductDataModel = new ProductDataModel(
        4,
        seed.imageRes,
        seed.title,
        seed.price
      );
      const current: ProductDataModel = new ProductDataModel(
        4,
        'https://store.example/headset/front.webp',
        $r('app.string.embed_product_title004'),
        oracle.getStringByNameSync('embed_product_price004')
      );
      expect(current.id).assertEqual(4);
      expect(current.imageRes).assertEqual('https://store.example/headset/front.webp');
      expect((current.title as Resource).id).assertEqual($r('app.string.embed_product_title004').id);
      expect(res.getStringSync((current.title as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_title004'));
      expect(current.price).assertEqual(oracle.getStringByNameSync('embed_product_price004'));
      current.id = 5;
      current.imageRes = $r('app.media.embed_product005');
      current.title = oracle.getStringByNameSync('embed_product_title005');
      current.price = $r('app.string.embed_product_price005');
      expect(current.id).assertEqual(5);
      expect((current.imageRes as Resource).id).assertEqual($r('app.media.embed_product005').id);
      expect(await hasExpectedMedia(res, current.imageRes, 'embed_product005')).assertTrue();
      expect(current.title).assertEqual(oracle.getStringByNameSync('embed_product_title005'));
      expect((current.price as Resource).id).assertEqual($r('app.string.embed_product_price005').id);
      expect(res.getStringSync((current.price as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_price005'));
      expect(previous.id).assertEqual(4);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product004').id);
      expect(await hasExpectedMedia(res, previous.imageRes, 'embed_product004')).assertTrue();
      expect((previous.title as Resource).id).assertEqual($r('app.string.embed_product_title004').id);
      expect(res.getStringSync((previous.title as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_title004'));
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price004').id);
      expect(res.getStringSync((previous.price as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_price004'));
      expect(PRODUCT_DATA[4] === seed).assertTrue();
      expect(current === seed).assertFalse();
      await assertOriginalCatalog(res);
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_CATALOGSEQUENCE_0036
     * @tc.name testProductCatalogSequence0036
     * @tc.desc Headset RRL copy is rekeyed and replaced; its peer and all six catalog originals survive
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testProductCatalogSequence0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const res: resourceManager.ResourceManager = testResources();
      const oracle: resourceManager.ResourceManager = entryResources();
      const seed: ProductDataModel = PRODUCT_DATA[4];
      const previous: ProductDataModel = new ProductDataModel(
        4,
        seed.imageRes,
        seed.title,
        seed.price
      );
      const current: ProductDataModel = new ProductDataModel(
        4,
        $r('app.media.embed_product004'),
        $r('app.string.embed_product_title004'),
        oracle.getStringByNameSync('embed_product_price004')
      );
      expect(current.id).assertEqual(4);
      expect((current.imageRes as Resource).id).assertEqual($r('app.media.embed_product004').id);
      expect(await hasExpectedMedia(res, current.imageRes, 'embed_product004')).assertTrue();
      expect((current.title as Resource).id).assertEqual($r('app.string.embed_product_title004').id);
      expect(res.getStringSync((current.title as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_title004'));
      expect(current.price).assertEqual(oracle.getStringByNameSync('embed_product_price004'));
      current.id = 5;
      current.imageRes = 'file://cache/backpack/front.webp';
      current.title = oracle.getStringByNameSync('embed_product_title005');
      current.price = $r('app.string.embed_product_price005');
      expect(current.id).assertEqual(5);
      expect(current.imageRes).assertEqual('file://cache/backpack/front.webp');
      expect(current.title).assertEqual(oracle.getStringByNameSync('embed_product_title005'));
      expect((current.price as Resource).id).assertEqual($r('app.string.embed_product_price005').id);
      expect(res.getStringSync((current.price as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_price005'));
      expect(previous.id).assertEqual(4);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product004').id);
      expect(await hasExpectedMedia(res, previous.imageRes, 'embed_product004')).assertTrue();
      expect((previous.title as Resource).id).assertEqual($r('app.string.embed_product_title004').id);
      expect(res.getStringSync((previous.title as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_title004'));
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price004').id);
      expect(res.getStringSync((previous.price as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_price004'));
      expect(PRODUCT_DATA[4] === seed).assertTrue();
      expect(current === seed).assertFalse();
      await assertOriginalCatalog(res);
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_CATALOGSEQUENCE_0037
     * @tc.name testProductCatalogSequence0037
     * @tc.desc Headset LLR copy is rekeyed and replaced; its peer and all six catalog originals survive
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testProductCatalogSequence0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const res: resourceManager.ResourceManager = testResources();
      const oracle: resourceManager.ResourceManager = entryResources();
      const seed: ProductDataModel = PRODUCT_DATA[4];
      const previous: ProductDataModel = new ProductDataModel(
        4,
        seed.imageRes,
        seed.title,
        seed.price
      );
      const current: ProductDataModel = new ProductDataModel(
        4,
        'https://store.example/headset/front.webp',
        oracle.getStringByNameSync('embed_product_title004'),
        $r('app.string.embed_product_price004')
      );
      expect(current.id).assertEqual(4);
      expect(current.imageRes).assertEqual('https://store.example/headset/front.webp');
      expect(current.title).assertEqual(oracle.getStringByNameSync('embed_product_title004'));
      expect((current.price as Resource).id).assertEqual($r('app.string.embed_product_price004').id);
      expect(res.getStringSync((current.price as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_price004'));
      current.id = 5;
      current.imageRes = $r('app.media.embed_product005');
      current.title = $r('app.string.embed_product_title005');
      current.price = oracle.getStringByNameSync('embed_product_price005');
      expect(current.id).assertEqual(5);
      expect((current.imageRes as Resource).id).assertEqual($r('app.media.embed_product005').id);
      expect(await hasExpectedMedia(res, current.imageRes, 'embed_product005')).assertTrue();
      expect((current.title as Resource).id).assertEqual($r('app.string.embed_product_title005').id);
      expect(res.getStringSync((current.title as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_title005'));
      expect(current.price).assertEqual(oracle.getStringByNameSync('embed_product_price005'));
      expect(previous.id).assertEqual(4);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product004').id);
      expect(await hasExpectedMedia(res, previous.imageRes, 'embed_product004')).assertTrue();
      expect((previous.title as Resource).id).assertEqual($r('app.string.embed_product_title004').id);
      expect(res.getStringSync((previous.title as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_title004'));
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price004').id);
      expect(res.getStringSync((previous.price as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_price004'));
      expect(PRODUCT_DATA[4] === seed).assertTrue();
      expect(current === seed).assertFalse();
      await assertOriginalCatalog(res);
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_CATALOGSEQUENCE_0038
     * @tc.name testProductCatalogSequence0038
     * @tc.desc Headset RLR copy is rekeyed and replaced; its peer and all six catalog originals survive
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testProductCatalogSequence0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const res: resourceManager.ResourceManager = testResources();
      const oracle: resourceManager.ResourceManager = entryResources();
      const seed: ProductDataModel = PRODUCT_DATA[4];
      const previous: ProductDataModel = new ProductDataModel(
        4,
        seed.imageRes,
        seed.title,
        seed.price
      );
      const current: ProductDataModel = new ProductDataModel(
        4,
        $r('app.media.embed_product004'),
        oracle.getStringByNameSync('embed_product_title004'),
        $r('app.string.embed_product_price004')
      );
      expect(current.id).assertEqual(4);
      expect((current.imageRes as Resource).id).assertEqual($r('app.media.embed_product004').id);
      expect(await hasExpectedMedia(res, current.imageRes, 'embed_product004')).assertTrue();
      expect(current.title).assertEqual(oracle.getStringByNameSync('embed_product_title004'));
      expect((current.price as Resource).id).assertEqual($r('app.string.embed_product_price004').id);
      expect(res.getStringSync((current.price as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_price004'));
      current.id = 5;
      current.imageRes = 'file://cache/backpack/front.webp';
      current.title = $r('app.string.embed_product_title005');
      current.price = oracle.getStringByNameSync('embed_product_price005');
      expect(current.id).assertEqual(5);
      expect(current.imageRes).assertEqual('file://cache/backpack/front.webp');
      expect((current.title as Resource).id).assertEqual($r('app.string.embed_product_title005').id);
      expect(res.getStringSync((current.title as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_title005'));
      expect(current.price).assertEqual(oracle.getStringByNameSync('embed_product_price005'));
      expect(previous.id).assertEqual(4);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product004').id);
      expect(await hasExpectedMedia(res, previous.imageRes, 'embed_product004')).assertTrue();
      expect((previous.title as Resource).id).assertEqual($r('app.string.embed_product_title004').id);
      expect(res.getStringSync((previous.title as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_title004'));
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price004').id);
      expect(res.getStringSync((previous.price as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_price004'));
      expect(PRODUCT_DATA[4] === seed).assertTrue();
      expect(current === seed).assertFalse();
      await assertOriginalCatalog(res);
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_CATALOGSEQUENCE_0039
     * @tc.name testProductCatalogSequence0039
     * @tc.desc Headset LRR copy is rekeyed and replaced; its peer and all six catalog originals survive
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testProductCatalogSequence0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const res: resourceManager.ResourceManager = testResources();
      const oracle: resourceManager.ResourceManager = entryResources();
      const seed: ProductDataModel = PRODUCT_DATA[4];
      const previous: ProductDataModel = new ProductDataModel(
        4,
        seed.imageRes,
        seed.title,
        seed.price
      );
      const current: ProductDataModel = new ProductDataModel(
        4,
        'https://store.example/headset/front.webp',
        $r('app.string.embed_product_title004'),
        $r('app.string.embed_product_price004')
      );
      expect(current.id).assertEqual(4);
      expect(current.imageRes).assertEqual('https://store.example/headset/front.webp');
      expect((current.title as Resource).id).assertEqual($r('app.string.embed_product_title004').id);
      expect(res.getStringSync((current.title as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_title004'));
      expect((current.price as Resource).id).assertEqual($r('app.string.embed_product_price004').id);
      expect(res.getStringSync((current.price as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_price004'));
      current.id = 5;
      current.imageRes = $r('app.media.embed_product005');
      current.title = oracle.getStringByNameSync('embed_product_title005');
      current.price = oracle.getStringByNameSync('embed_product_price005');
      expect(current.id).assertEqual(5);
      expect((current.imageRes as Resource).id).assertEqual($r('app.media.embed_product005').id);
      expect(await hasExpectedMedia(res, current.imageRes, 'embed_product005')).assertTrue();
      expect(current.title).assertEqual(oracle.getStringByNameSync('embed_product_title005'));
      expect(current.price).assertEqual(oracle.getStringByNameSync('embed_product_price005'));
      expect(previous.id).assertEqual(4);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product004').id);
      expect(await hasExpectedMedia(res, previous.imageRes, 'embed_product004')).assertTrue();
      expect((previous.title as Resource).id).assertEqual($r('app.string.embed_product_title004').id);
      expect(res.getStringSync((previous.title as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_title004'));
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price004').id);
      expect(res.getStringSync((previous.price as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_price004'));
      expect(PRODUCT_DATA[4] === seed).assertTrue();
      expect(current === seed).assertFalse();
      await assertOriginalCatalog(res);
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_CATALOGSEQUENCE_0040
     * @tc.name testProductCatalogSequence0040
     * @tc.desc Headset RRR copy is rekeyed and replaced; its peer and all six catalog originals survive
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testProductCatalogSequence0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const res: resourceManager.ResourceManager = testResources();
      const oracle: resourceManager.ResourceManager = entryResources();
      const seed: ProductDataModel = PRODUCT_DATA[4];
      const previous: ProductDataModel = new ProductDataModel(
        4,
        seed.imageRes,
        seed.title,
        seed.price
      );
      const current: ProductDataModel = new ProductDataModel(
        4,
        $r('app.media.embed_product004'),
        $r('app.string.embed_product_title004'),
        $r('app.string.embed_product_price004')
      );
      expect(current.id).assertEqual(4);
      expect((current.imageRes as Resource).id).assertEqual($r('app.media.embed_product004').id);
      expect(await hasExpectedMedia(res, current.imageRes, 'embed_product004')).assertTrue();
      expect((current.title as Resource).id).assertEqual($r('app.string.embed_product_title004').id);
      expect(res.getStringSync((current.title as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_title004'));
      expect((current.price as Resource).id).assertEqual($r('app.string.embed_product_price004').id);
      expect(res.getStringSync((current.price as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_price004'));
      current.id = 5;
      current.imageRes = 'file://cache/backpack/front.webp';
      current.title = oracle.getStringByNameSync('embed_product_title005');
      current.price = oracle.getStringByNameSync('embed_product_price005');
      expect(current.id).assertEqual(5);
      expect(current.imageRes).assertEqual('file://cache/backpack/front.webp');
      expect(current.title).assertEqual(oracle.getStringByNameSync('embed_product_title005'));
      expect(current.price).assertEqual(oracle.getStringByNameSync('embed_product_price005'));
      expect(previous.id).assertEqual(4);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product004').id);
      expect(await hasExpectedMedia(res, previous.imageRes, 'embed_product004')).assertTrue();
      expect((previous.title as Resource).id).assertEqual($r('app.string.embed_product_title004').id);
      expect(res.getStringSync((previous.title as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_title004'));
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price004').id);
      expect(res.getStringSync((previous.price as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_price004'));
      expect(PRODUCT_DATA[4] === seed).assertTrue();
      expect(current === seed).assertFalse();
      await assertOriginalCatalog(res);
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_CATALOGSEQUENCE_0041
     * @tc.name testProductCatalogSequence0041
     * @tc.desc Backpack LLL copy is rekeyed and replaced; its peer and all six catalog originals survive
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testProductCatalogSequence0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const res: resourceManager.ResourceManager = testResources();
      const oracle: resourceManager.ResourceManager = entryResources();
      const seed: ProductDataModel = PRODUCT_DATA[5];
      const previous: ProductDataModel = new ProductDataModel(
        5,
        seed.imageRes,
        seed.title,
        seed.price
      );
      const current: ProductDataModel = new ProductDataModel(
        5,
        'file://cache/backpack/front.webp',
        oracle.getStringByNameSync('embed_product_title005'),
        oracle.getStringByNameSync('embed_product_price005')
      );
      expect(current.id).assertEqual(5);
      expect(current.imageRes).assertEqual('file://cache/backpack/front.webp');
      expect(current.title).assertEqual(oracle.getStringByNameSync('embed_product_title005'));
      expect(current.price).assertEqual(oracle.getStringByNameSync('embed_product_price005'));
      current.id = 0;
      current.imageRes = $r('app.media.embed_product000');
      current.title = $r('app.string.embed_product_title000');
      current.price = $r('app.string.embed_product_price000');
      expect(current.id).assertEqual(0);
      expect((current.imageRes as Resource).id).assertEqual($r('app.media.embed_product000').id);
      expect(await hasExpectedMedia(res, current.imageRes, 'embed_product000')).assertTrue();
      expect((current.title as Resource).id).assertEqual($r('app.string.embed_product_title000').id);
      expect(res.getStringSync((current.title as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_title000'));
      expect((current.price as Resource).id).assertEqual($r('app.string.embed_product_price000').id);
      expect(res.getStringSync((current.price as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_price000'));
      expect(previous.id).assertEqual(5);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product005').id);
      expect(await hasExpectedMedia(res, previous.imageRes, 'embed_product005')).assertTrue();
      expect((previous.title as Resource).id).assertEqual($r('app.string.embed_product_title005').id);
      expect(res.getStringSync((previous.title as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_title005'));
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price005').id);
      expect(res.getStringSync((previous.price as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_price005'));
      expect(PRODUCT_DATA[5] === seed).assertTrue();
      expect(current === seed).assertFalse();
      await assertOriginalCatalog(res);
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_CATALOGSEQUENCE_0042
     * @tc.name testProductCatalogSequence0042
     * @tc.desc Backpack RLL copy is rekeyed and replaced; its peer and all six catalog originals survive
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testProductCatalogSequence0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const res: resourceManager.ResourceManager = testResources();
      const oracle: resourceManager.ResourceManager = entryResources();
      const seed: ProductDataModel = PRODUCT_DATA[5];
      const previous: ProductDataModel = new ProductDataModel(
        5,
        seed.imageRes,
        seed.title,
        seed.price
      );
      const current: ProductDataModel = new ProductDataModel(
        5,
        $r('app.media.embed_product005'),
        oracle.getStringByNameSync('embed_product_title005'),
        oracle.getStringByNameSync('embed_product_price005')
      );
      expect(current.id).assertEqual(5);
      expect((current.imageRes as Resource).id).assertEqual($r('app.media.embed_product005').id);
      expect(await hasExpectedMedia(res, current.imageRes, 'embed_product005')).assertTrue();
      expect(current.title).assertEqual(oracle.getStringByNameSync('embed_product_title005'));
      expect(current.price).assertEqual(oracle.getStringByNameSync('embed_product_price005'));
      current.id = 0;
      current.imageRes = 'https://store.example/power-bank/front.webp';
      current.title = $r('app.string.embed_product_title000');
      current.price = $r('app.string.embed_product_price000');
      expect(current.id).assertEqual(0);
      expect(current.imageRes).assertEqual('https://store.example/power-bank/front.webp');
      expect((current.title as Resource).id).assertEqual($r('app.string.embed_product_title000').id);
      expect(res.getStringSync((current.title as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_title000'));
      expect((current.price as Resource).id).assertEqual($r('app.string.embed_product_price000').id);
      expect(res.getStringSync((current.price as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_price000'));
      expect(previous.id).assertEqual(5);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product005').id);
      expect(await hasExpectedMedia(res, previous.imageRes, 'embed_product005')).assertTrue();
      expect((previous.title as Resource).id).assertEqual($r('app.string.embed_product_title005').id);
      expect(res.getStringSync((previous.title as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_title005'));
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price005').id);
      expect(res.getStringSync((previous.price as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_price005'));
      expect(PRODUCT_DATA[5] === seed).assertTrue();
      expect(current === seed).assertFalse();
      await assertOriginalCatalog(res);
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_CATALOGSEQUENCE_0043
     * @tc.name testProductCatalogSequence0043
     * @tc.desc Backpack LRL copy is rekeyed and replaced; its peer and all six catalog originals survive
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testProductCatalogSequence0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const res: resourceManager.ResourceManager = testResources();
      const oracle: resourceManager.ResourceManager = entryResources();
      const seed: ProductDataModel = PRODUCT_DATA[5];
      const previous: ProductDataModel = new ProductDataModel(
        5,
        seed.imageRes,
        seed.title,
        seed.price
      );
      const current: ProductDataModel = new ProductDataModel(
        5,
        'file://cache/backpack/front.webp',
        $r('app.string.embed_product_title005'),
        oracle.getStringByNameSync('embed_product_price005')
      );
      expect(current.id).assertEqual(5);
      expect(current.imageRes).assertEqual('file://cache/backpack/front.webp');
      expect((current.title as Resource).id).assertEqual($r('app.string.embed_product_title005').id);
      expect(res.getStringSync((current.title as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_title005'));
      expect(current.price).assertEqual(oracle.getStringByNameSync('embed_product_price005'));
      current.id = 0;
      current.imageRes = $r('app.media.embed_product000');
      current.title = oracle.getStringByNameSync('embed_product_title000');
      current.price = $r('app.string.embed_product_price000');
      expect(current.id).assertEqual(0);
      expect((current.imageRes as Resource).id).assertEqual($r('app.media.embed_product000').id);
      expect(await hasExpectedMedia(res, current.imageRes, 'embed_product000')).assertTrue();
      expect(current.title).assertEqual(oracle.getStringByNameSync('embed_product_title000'));
      expect((current.price as Resource).id).assertEqual($r('app.string.embed_product_price000').id);
      expect(res.getStringSync((current.price as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_price000'));
      expect(previous.id).assertEqual(5);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product005').id);
      expect(await hasExpectedMedia(res, previous.imageRes, 'embed_product005')).assertTrue();
      expect((previous.title as Resource).id).assertEqual($r('app.string.embed_product_title005').id);
      expect(res.getStringSync((previous.title as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_title005'));
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price005').id);
      expect(res.getStringSync((previous.price as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_price005'));
      expect(PRODUCT_DATA[5] === seed).assertTrue();
      expect(current === seed).assertFalse();
      await assertOriginalCatalog(res);
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_CATALOGSEQUENCE_0044
     * @tc.name testProductCatalogSequence0044
     * @tc.desc Backpack RRL copy is rekeyed and replaced; its peer and all six catalog originals survive
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testProductCatalogSequence0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const res: resourceManager.ResourceManager = testResources();
      const oracle: resourceManager.ResourceManager = entryResources();
      const seed: ProductDataModel = PRODUCT_DATA[5];
      const previous: ProductDataModel = new ProductDataModel(
        5,
        seed.imageRes,
        seed.title,
        seed.price
      );
      const current: ProductDataModel = new ProductDataModel(
        5,
        $r('app.media.embed_product005'),
        $r('app.string.embed_product_title005'),
        oracle.getStringByNameSync('embed_product_price005')
      );
      expect(current.id).assertEqual(5);
      expect((current.imageRes as Resource).id).assertEqual($r('app.media.embed_product005').id);
      expect(await hasExpectedMedia(res, current.imageRes, 'embed_product005')).assertTrue();
      expect((current.title as Resource).id).assertEqual($r('app.string.embed_product_title005').id);
      expect(res.getStringSync((current.title as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_title005'));
      expect(current.price).assertEqual(oracle.getStringByNameSync('embed_product_price005'));
      current.id = 0;
      current.imageRes = 'https://store.example/power-bank/front.webp';
      current.title = oracle.getStringByNameSync('embed_product_title000');
      current.price = $r('app.string.embed_product_price000');
      expect(current.id).assertEqual(0);
      expect(current.imageRes).assertEqual('https://store.example/power-bank/front.webp');
      expect(current.title).assertEqual(oracle.getStringByNameSync('embed_product_title000'));
      expect((current.price as Resource).id).assertEqual($r('app.string.embed_product_price000').id);
      expect(res.getStringSync((current.price as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_price000'));
      expect(previous.id).assertEqual(5);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product005').id);
      expect(await hasExpectedMedia(res, previous.imageRes, 'embed_product005')).assertTrue();
      expect((previous.title as Resource).id).assertEqual($r('app.string.embed_product_title005').id);
      expect(res.getStringSync((previous.title as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_title005'));
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price005').id);
      expect(res.getStringSync((previous.price as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_price005'));
      expect(PRODUCT_DATA[5] === seed).assertTrue();
      expect(current === seed).assertFalse();
      await assertOriginalCatalog(res);
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_CATALOGSEQUENCE_0045
     * @tc.name testProductCatalogSequence0045
     * @tc.desc Backpack LLR copy is rekeyed and replaced; its peer and all six catalog originals survive
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testProductCatalogSequence0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const res: resourceManager.ResourceManager = testResources();
      const oracle: resourceManager.ResourceManager = entryResources();
      const seed: ProductDataModel = PRODUCT_DATA[5];
      const previous: ProductDataModel = new ProductDataModel(
        5,
        seed.imageRes,
        seed.title,
        seed.price
      );
      const current: ProductDataModel = new ProductDataModel(
        5,
        'file://cache/backpack/front.webp',
        oracle.getStringByNameSync('embed_product_title005'),
        $r('app.string.embed_product_price005')
      );
      expect(current.id).assertEqual(5);
      expect(current.imageRes).assertEqual('file://cache/backpack/front.webp');
      expect(current.title).assertEqual(oracle.getStringByNameSync('embed_product_title005'));
      expect((current.price as Resource).id).assertEqual($r('app.string.embed_product_price005').id);
      expect(res.getStringSync((current.price as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_price005'));
      current.id = 0;
      current.imageRes = $r('app.media.embed_product000');
      current.title = $r('app.string.embed_product_title000');
      current.price = oracle.getStringByNameSync('embed_product_price000');
      expect(current.id).assertEqual(0);
      expect((current.imageRes as Resource).id).assertEqual($r('app.media.embed_product000').id);
      expect(await hasExpectedMedia(res, current.imageRes, 'embed_product000')).assertTrue();
      expect((current.title as Resource).id).assertEqual($r('app.string.embed_product_title000').id);
      expect(res.getStringSync((current.title as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_title000'));
      expect(current.price).assertEqual(oracle.getStringByNameSync('embed_product_price000'));
      expect(previous.id).assertEqual(5);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product005').id);
      expect(await hasExpectedMedia(res, previous.imageRes, 'embed_product005')).assertTrue();
      expect((previous.title as Resource).id).assertEqual($r('app.string.embed_product_title005').id);
      expect(res.getStringSync((previous.title as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_title005'));
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price005').id);
      expect(res.getStringSync((previous.price as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_price005'));
      expect(PRODUCT_DATA[5] === seed).assertTrue();
      expect(current === seed).assertFalse();
      await assertOriginalCatalog(res);
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_CATALOGSEQUENCE_0046
     * @tc.name testProductCatalogSequence0046
     * @tc.desc Backpack RLR copy is rekeyed and replaced; its peer and all six catalog originals survive
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testProductCatalogSequence0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const res: resourceManager.ResourceManager = testResources();
      const oracle: resourceManager.ResourceManager = entryResources();
      const seed: ProductDataModel = PRODUCT_DATA[5];
      const previous: ProductDataModel = new ProductDataModel(
        5,
        seed.imageRes,
        seed.title,
        seed.price
      );
      const current: ProductDataModel = new ProductDataModel(
        5,
        $r('app.media.embed_product005'),
        oracle.getStringByNameSync('embed_product_title005'),
        $r('app.string.embed_product_price005')
      );
      expect(current.id).assertEqual(5);
      expect((current.imageRes as Resource).id).assertEqual($r('app.media.embed_product005').id);
      expect(await hasExpectedMedia(res, current.imageRes, 'embed_product005')).assertTrue();
      expect(current.title).assertEqual(oracle.getStringByNameSync('embed_product_title005'));
      expect((current.price as Resource).id).assertEqual($r('app.string.embed_product_price005').id);
      expect(res.getStringSync((current.price as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_price005'));
      current.id = 0;
      current.imageRes = 'https://store.example/power-bank/front.webp';
      current.title = $r('app.string.embed_product_title000');
      current.price = oracle.getStringByNameSync('embed_product_price000');
      expect(current.id).assertEqual(0);
      expect(current.imageRes).assertEqual('https://store.example/power-bank/front.webp');
      expect((current.title as Resource).id).assertEqual($r('app.string.embed_product_title000').id);
      expect(res.getStringSync((current.title as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_title000'));
      expect(current.price).assertEqual(oracle.getStringByNameSync('embed_product_price000'));
      expect(previous.id).assertEqual(5);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product005').id);
      expect(await hasExpectedMedia(res, previous.imageRes, 'embed_product005')).assertTrue();
      expect((previous.title as Resource).id).assertEqual($r('app.string.embed_product_title005').id);
      expect(res.getStringSync((previous.title as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_title005'));
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price005').id);
      expect(res.getStringSync((previous.price as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_price005'));
      expect(PRODUCT_DATA[5] === seed).assertTrue();
      expect(current === seed).assertFalse();
      await assertOriginalCatalog(res);
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_CATALOGSEQUENCE_0047
     * @tc.name testProductCatalogSequence0047
     * @tc.desc Backpack LRR copy is rekeyed and replaced; its peer and all six catalog originals survive
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testProductCatalogSequence0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const res: resourceManager.ResourceManager = testResources();
      const oracle: resourceManager.ResourceManager = entryResources();
      const seed: ProductDataModel = PRODUCT_DATA[5];
      const previous: ProductDataModel = new ProductDataModel(
        5,
        seed.imageRes,
        seed.title,
        seed.price
      );
      const current: ProductDataModel = new ProductDataModel(
        5,
        'file://cache/backpack/front.webp',
        $r('app.string.embed_product_title005'),
        $r('app.string.embed_product_price005')
      );
      expect(current.id).assertEqual(5);
      expect(current.imageRes).assertEqual('file://cache/backpack/front.webp');
      expect((current.title as Resource).id).assertEqual($r('app.string.embed_product_title005').id);
      expect(res.getStringSync((current.title as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_title005'));
      expect((current.price as Resource).id).assertEqual($r('app.string.embed_product_price005').id);
      expect(res.getStringSync((current.price as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_price005'));
      current.id = 0;
      current.imageRes = $r('app.media.embed_product000');
      current.title = oracle.getStringByNameSync('embed_product_title000');
      current.price = oracle.getStringByNameSync('embed_product_price000');
      expect(current.id).assertEqual(0);
      expect((current.imageRes as Resource).id).assertEqual($r('app.media.embed_product000').id);
      expect(await hasExpectedMedia(res, current.imageRes, 'embed_product000')).assertTrue();
      expect(current.title).assertEqual(oracle.getStringByNameSync('embed_product_title000'));
      expect(current.price).assertEqual(oracle.getStringByNameSync('embed_product_price000'));
      expect(previous.id).assertEqual(5);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product005').id);
      expect(await hasExpectedMedia(res, previous.imageRes, 'embed_product005')).assertTrue();
      expect((previous.title as Resource).id).assertEqual($r('app.string.embed_product_title005').id);
      expect(res.getStringSync((previous.title as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_title005'));
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price005').id);
      expect(res.getStringSync((previous.price as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_price005'));
      expect(PRODUCT_DATA[5] === seed).assertTrue();
      expect(current === seed).assertFalse();
      await assertOriginalCatalog(res);
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_CATALOGSEQUENCE_0048
     * @tc.name testProductCatalogSequence0048
     * @tc.desc Backpack RRR copy is rekeyed and replaced; its peer and all six catalog originals survive
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testProductCatalogSequence0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const res: resourceManager.ResourceManager = testResources();
      const oracle: resourceManager.ResourceManager = entryResources();
      const seed: ProductDataModel = PRODUCT_DATA[5];
      const previous: ProductDataModel = new ProductDataModel(
        5,
        seed.imageRes,
        seed.title,
        seed.price
      );
      const current: ProductDataModel = new ProductDataModel(
        5,
        $r('app.media.embed_product005'),
        $r('app.string.embed_product_title005'),
        $r('app.string.embed_product_price005')
      );
      expect(current.id).assertEqual(5);
      expect((current.imageRes as Resource).id).assertEqual($r('app.media.embed_product005').id);
      expect(await hasExpectedMedia(res, current.imageRes, 'embed_product005')).assertTrue();
      expect((current.title as Resource).id).assertEqual($r('app.string.embed_product_title005').id);
      expect(res.getStringSync((current.title as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_title005'));
      expect((current.price as Resource).id).assertEqual($r('app.string.embed_product_price005').id);
      expect(res.getStringSync((current.price as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_price005'));
      current.id = 0;
      current.imageRes = 'https://store.example/power-bank/front.webp';
      current.title = oracle.getStringByNameSync('embed_product_title000');
      current.price = oracle.getStringByNameSync('embed_product_price000');
      expect(current.id).assertEqual(0);
      expect(current.imageRes).assertEqual('https://store.example/power-bank/front.webp');
      expect(current.title).assertEqual(oracle.getStringByNameSync('embed_product_title000'));
      expect(current.price).assertEqual(oracle.getStringByNameSync('embed_product_price000'));
      expect(previous.id).assertEqual(5);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product005').id);
      expect(await hasExpectedMedia(res, previous.imageRes, 'embed_product005')).assertTrue();
      expect((previous.title as Resource).id).assertEqual($r('app.string.embed_product_title005').id);
      expect(res.getStringSync((previous.title as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_title005'));
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price005').id);
      expect(res.getStringSync((previous.price as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_price005'));
      expect(PRODUCT_DATA[5] === seed).assertTrue();
      expect(current === seed).assertFalse();
      await assertOriginalCatalog(res);
    });
  });
}
