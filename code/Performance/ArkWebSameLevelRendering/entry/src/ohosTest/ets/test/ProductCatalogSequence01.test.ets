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

export default function productCatalogSequence01Test(): void {
  describe('productCatalogSequence01Test', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_CATALOGSEQUENCE_0001
     * @tc.name testProductCatalogSequence0001
     * @tc.desc Power bank LLL copy is rekeyed and replaced; its peer and all six catalog originals survive
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testProductCatalogSequence0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const res: resourceManager.ResourceManager = testResources();
      const oracle: resourceManager.ResourceManager = entryResources();
      const seed: ProductDataModel = PRODUCT_DATA[0];
      const previous: ProductDataModel = new ProductDataModel(
        0,
        seed.imageRes,
        seed.title,
        seed.price
      );
      const current: ProductDataModel = new ProductDataModel(
        0,
        'https://store.example/power-bank/front.webp',
        oracle.getStringByNameSync('embed_product_title000'),
        oracle.getStringByNameSync('embed_product_price000')
      );
      expect(current.id).assertEqual(0);
      expect(current.imageRes).assertEqual('https://store.example/power-bank/front.webp');
      expect(current.title).assertEqual(oracle.getStringByNameSync('embed_product_title000'));
      expect(current.price).assertEqual(oracle.getStringByNameSync('embed_product_price000'));
      current.id = 1;
      current.imageRes = $r('app.media.embed_product001');
      current.title = $r('app.string.embed_product_title001');
      current.price = $r('app.string.embed_product_price001');
      expect(current.id).assertEqual(1);
      expect((current.imageRes as Resource).id).assertEqual($r('app.media.embed_product001').id);
      expect(await hasExpectedMedia(res, current.imageRes, 'embed_product001')).assertTrue();
      expect((current.title as Resource).id).assertEqual($r('app.string.embed_product_title001').id);
      expect(res.getStringSync((current.title as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_title001'));
      expect((current.price as Resource).id).assertEqual($r('app.string.embed_product_price001').id);
      expect(res.getStringSync((current.price as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_price001'));
      expect(previous.id).assertEqual(0);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product000').id);
      expect(await hasExpectedMedia(res, previous.imageRes, 'embed_product000')).assertTrue();
      expect((previous.title as Resource).id).assertEqual($r('app.string.embed_product_title000').id);
      expect(res.getStringSync((previous.title as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_title000'));
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price000').id);
      expect(res.getStringSync((previous.price as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_price000'));
      expect(PRODUCT_DATA[0] === seed).assertTrue();
      expect(current === seed).assertFalse();
      await assertOriginalCatalog(res);
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_CATALOGSEQUENCE_0002
     * @tc.name testProductCatalogSequence0002
     * @tc.desc Power bank RLL copy is rekeyed and replaced; its peer and all six catalog originals survive
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testProductCatalogSequence0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const res: resourceManager.ResourceManager = testResources();
      const oracle: resourceManager.ResourceManager = entryResources();
      const seed: ProductDataModel = PRODUCT_DATA[0];
      const previous: ProductDataModel = new ProductDataModel(
        0,
        seed.imageRes,
        seed.title,
        seed.price
      );
      const current: ProductDataModel = new ProductDataModel(
        0,
        $r('app.media.embed_product000'),
        oracle.getStringByNameSync('embed_product_title000'),
        oracle.getStringByNameSync('embed_product_price000')
      );
      expect(current.id).assertEqual(0);
      expect((current.imageRes as Resource).id).assertEqual($r('app.media.embed_product000').id);
      expect(await hasExpectedMedia(res, current.imageRes, 'embed_product000')).assertTrue();
      expect(current.title).assertEqual(oracle.getStringByNameSync('embed_product_title000'));
      expect(current.price).assertEqual(oracle.getStringByNameSync('embed_product_price000'));
      current.id = 1;
      current.imageRes = 'file://cache/notebook/front.webp';
      current.title = $r('app.string.embed_product_title001');
      current.price = $r('app.string.embed_product_price001');
      expect(current.id).assertEqual(1);
      expect(current.imageRes).assertEqual('file://cache/notebook/front.webp');
      expect((current.title as Resource).id).assertEqual($r('app.string.embed_product_title001').id);
      expect(res.getStringSync((current.title as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_title001'));
      expect((current.price as Resource).id).assertEqual($r('app.string.embed_product_price001').id);
      expect(res.getStringSync((current.price as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_price001'));
      expect(previous.id).assertEqual(0);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product000').id);
      expect(await hasExpectedMedia(res, previous.imageRes, 'embed_product000')).assertTrue();
      expect((previous.title as Resource).id).assertEqual($r('app.string.embed_product_title000').id);
      expect(res.getStringSync((previous.title as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_title000'));
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price000').id);
      expect(res.getStringSync((previous.price as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_price000'));
      expect(PRODUCT_DATA[0] === seed).assertTrue();
      expect(current === seed).assertFalse();
      await assertOriginalCatalog(res);
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_CATALOGSEQUENCE_0003
     * @tc.name testProductCatalogSequence0003
     * @tc.desc Power bank LRL copy is rekeyed and replaced; its peer and all six catalog originals survive
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testProductCatalogSequence0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const res: resourceManager.ResourceManager = testResources();
      const oracle: resourceManager.ResourceManager = entryResources();
      const seed: ProductDataModel = PRODUCT_DATA[0];
      const previous: ProductDataModel = new ProductDataModel(
        0,
        seed.imageRes,
        seed.title,
        seed.price
      );
      const current: ProductDataModel = new ProductDataModel(
        0,
        'https://store.example/power-bank/front.webp',
        $r('app.string.embed_product_title000'),
        oracle.getStringByNameSync('embed_product_price000')
      );
      expect(current.id).assertEqual(0);
      expect(current.imageRes).assertEqual('https://store.example/power-bank/front.webp');
      expect((current.title as Resource).id).assertEqual($r('app.string.embed_product_title000').id);
      expect(res.getStringSync((current.title as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_title000'));
      expect(current.price).assertEqual(oracle.getStringByNameSync('embed_product_price000'));
      current.id = 1;
      current.imageRes = $r('app.media.embed_product001');
      current.title = oracle.getStringByNameSync('embed_product_title001');
      current.price = $r('app.string.embed_product_price001');
      expect(current.id).assertEqual(1);
      expect((current.imageRes as Resource).id).assertEqual($r('app.media.embed_product001').id);
      expect(await hasExpectedMedia(res, current.imageRes, 'embed_product001')).assertTrue();
      expect(current.title).assertEqual(oracle.getStringByNameSync('embed_product_title001'));
      expect((current.price as Resource).id).assertEqual($r('app.string.embed_product_price001').id);
      expect(res.getStringSync((current.price as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_price001'));
      expect(previous.id).assertEqual(0);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product000').id);
      expect(await hasExpectedMedia(res, previous.imageRes, 'embed_product000')).assertTrue();
      expect((previous.title as Resource).id).assertEqual($r('app.string.embed_product_title000').id);
      expect(res.getStringSync((previous.title as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_title000'));
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price000').id);
      expect(res.getStringSync((previous.price as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_price000'));
      expect(PRODUCT_DATA[0] === seed).assertTrue();
      expect(current === seed).assertFalse();
      await assertOriginalCatalog(res);
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_CATALOGSEQUENCE_0004
     * @tc.name testProductCatalogSequence0004
     * @tc.desc Power bank RRL copy is rekeyed and replaced; its peer and all six catalog originals survive
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testProductCatalogSequence0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const res: resourceManager.ResourceManager = testResources();
      const oracle: resourceManager.ResourceManager = entryResources();
      const seed: ProductDataModel = PRODUCT_DATA[0];
      const previous: ProductDataModel = new ProductDataModel(
        0,
        seed.imageRes,
        seed.title,
        seed.price
      );
      const current: ProductDataModel = new ProductDataModel(
        0,
        $r('app.media.embed_product000'),
        $r('app.string.embed_product_title000'),
        oracle.getStringByNameSync('embed_product_price000')
      );
      expect(current.id).assertEqual(0);
      expect((current.imageRes as Resource).id).assertEqual($r('app.media.embed_product000').id);
      expect(await hasExpectedMedia(res, current.imageRes, 'embed_product000')).assertTrue();
      expect((current.title as Resource).id).assertEqual($r('app.string.embed_product_title000').id);
      expect(res.getStringSync((current.title as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_title000'));
      expect(current.price).assertEqual(oracle.getStringByNameSync('embed_product_price000'));
      current.id = 1;
      current.imageRes = 'file://cache/notebook/front.webp';
      current.title = oracle.getStringByNameSync('embed_product_title001');
      current.price = $r('app.string.embed_product_price001');
      expect(current.id).assertEqual(1);
      expect(current.imageRes).assertEqual('file://cache/notebook/front.webp');
      expect(current.title).assertEqual(oracle.getStringByNameSync('embed_product_title001'));
      expect((current.price as Resource).id).assertEqual($r('app.string.embed_product_price001').id);
      expect(res.getStringSync((current.price as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_price001'));
      expect(previous.id).assertEqual(0);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product000').id);
      expect(await hasExpectedMedia(res, previous.imageRes, 'embed_product000')).assertTrue();
      expect((previous.title as Resource).id).assertEqual($r('app.string.embed_product_title000').id);
      expect(res.getStringSync((previous.title as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_title000'));
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price000').id);
      expect(res.getStringSync((previous.price as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_price000'));
      expect(PRODUCT_DATA[0] === seed).assertTrue();
      expect(current === seed).assertFalse();
      await assertOriginalCatalog(res);
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_CATALOGSEQUENCE_0005
     * @tc.name testProductCatalogSequence0005
     * @tc.desc Power bank LLR copy is rekeyed and replaced; its peer and all six catalog originals survive
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testProductCatalogSequence0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const res: resourceManager.ResourceManager = testResources();
      const oracle: resourceManager.ResourceManager = entryResources();
      const seed: ProductDataModel = PRODUCT_DATA[0];
      const previous: ProductDataModel = new ProductDataModel(
        0,
        seed.imageRes,
        seed.title,
        seed.price
      );
      const current: ProductDataModel = new ProductDataModel(
        0,
        'https://store.example/power-bank/front.webp',
        oracle.getStringByNameSync('embed_product_title000'),
        $r('app.string.embed_product_price000')
      );
      expect(current.id).assertEqual(0);
      expect(current.imageRes).assertEqual('https://store.example/power-bank/front.webp');
      expect(current.title).assertEqual(oracle.getStringByNameSync('embed_product_title000'));
      expect((current.price as Resource).id).assertEqual($r('app.string.embed_product_price000').id);
      expect(res.getStringSync((current.price as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_price000'));
      current.id = 1;
      current.imageRes = $r('app.media.embed_product001');
      current.title = $r('app.string.embed_product_title001');
      current.price = oracle.getStringByNameSync('embed_product_price001');
      expect(current.id).assertEqual(1);
      expect((current.imageRes as Resource).id).assertEqual($r('app.media.embed_product001').id);
      expect(await hasExpectedMedia(res, current.imageRes, 'embed_product001')).assertTrue();
      expect((current.title as Resource).id).assertEqual($r('app.string.embed_product_title001').id);
      expect(res.getStringSync((current.title as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_title001'));
      expect(current.price).assertEqual(oracle.getStringByNameSync('embed_product_price001'));
      expect(previous.id).assertEqual(0);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product000').id);
      expect(await hasExpectedMedia(res, previous.imageRes, 'embed_product000')).assertTrue();
      expect((previous.title as Resource).id).assertEqual($r('app.string.embed_product_title000').id);
      expect(res.getStringSync((previous.title as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_title000'));
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price000').id);
      expect(res.getStringSync((previous.price as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_price000'));
      expect(PRODUCT_DATA[0] === seed).assertTrue();
      expect(current === seed).assertFalse();
      await assertOriginalCatalog(res);
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_CATALOGSEQUENCE_0006
     * @tc.name testProductCatalogSequence0006
     * @tc.desc Power bank RLR copy is rekeyed and replaced; its peer and all six catalog originals survive
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testProductCatalogSequence0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const res: resourceManager.ResourceManager = testResources();
      const oracle: resourceManager.ResourceManager = entryResources();
      const seed: ProductDataModel = PRODUCT_DATA[0];
      const previous: ProductDataModel = new ProductDataModel(
        0,
        seed.imageRes,
        seed.title,
        seed.price
      );
      const current: ProductDataModel = new ProductDataModel(
        0,
        $r('app.media.embed_product000'),
        oracle.getStringByNameSync('embed_product_title000'),
        $r('app.string.embed_product_price000')
      );
      expect(current.id).assertEqual(0);
      expect((current.imageRes as Resource).id).assertEqual($r('app.media.embed_product000').id);
      expect(await hasExpectedMedia(res, current.imageRes, 'embed_product000')).assertTrue();
      expect(current.title).assertEqual(oracle.getStringByNameSync('embed_product_title000'));
      expect((current.price as Resource).id).assertEqual($r('app.string.embed_product_price000').id);
      expect(res.getStringSync((current.price as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_price000'));
      current.id = 1;
      current.imageRes = 'file://cache/notebook/front.webp';
      current.title = $r('app.string.embed_product_title001');
      current.price = oracle.getStringByNameSync('embed_product_price001');
      expect(current.id).assertEqual(1);
      expect(current.imageRes).assertEqual('file://cache/notebook/front.webp');
      expect((current.title as Resource).id).assertEqual($r('app.string.embed_product_title001').id);
      expect(res.getStringSync((current.title as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_title001'));
      expect(current.price).assertEqual(oracle.getStringByNameSync('embed_product_price001'));
      expect(previous.id).assertEqual(0);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product000').id);
      expect(await hasExpectedMedia(res, previous.imageRes, 'embed_product000')).assertTrue();
      expect((previous.title as Resource).id).assertEqual($r('app.string.embed_product_title000').id);
      expect(res.getStringSync((previous.title as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_title000'));
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price000').id);
      expect(res.getStringSync((previous.price as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_price000'));
      expect(PRODUCT_DATA[0] === seed).assertTrue();
      expect(current === seed).assertFalse();
      await assertOriginalCatalog(res);
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_CATALOGSEQUENCE_0007
     * @tc.name testProductCatalogSequence0007
     * @tc.desc Power bank LRR copy is rekeyed and replaced; its peer and all six catalog originals survive
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testProductCatalogSequence0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const res: resourceManager.ResourceManager = testResources();
      const oracle: resourceManager.ResourceManager = entryResources();
      const seed: ProductDataModel = PRODUCT_DATA[0];
      const previous: ProductDataModel = new ProductDataModel(
        0,
        seed.imageRes,
        seed.title,
        seed.price
      );
      const current: ProductDataModel = new ProductDataModel(
        0,
        'https://store.example/power-bank/front.webp',
        $r('app.string.embed_product_title000'),
        $r('app.string.embed_product_price000')
      );
      expect(current.id).assertEqual(0);
      expect(current.imageRes).assertEqual('https://store.example/power-bank/front.webp');
      expect((current.title as Resource).id).assertEqual($r('app.string.embed_product_title000').id);
      expect(res.getStringSync((current.title as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_title000'));
      expect((current.price as Resource).id).assertEqual($r('app.string.embed_product_price000').id);
      expect(res.getStringSync((current.price as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_price000'));
      current.id = 1;
      current.imageRes = $r('app.media.embed_product001');
      current.title = oracle.getStringByNameSync('embed_product_title001');
      current.price = oracle.getStringByNameSync('embed_product_price001');
      expect(current.id).assertEqual(1);
      expect((current.imageRes as Resource).id).assertEqual($r('app.media.embed_product001').id);
      expect(await hasExpectedMedia(res, current.imageRes, 'embed_product001')).assertTrue();
      expect(current.title).assertEqual(oracle.getStringByNameSync('embed_product_title001'));
      expect(current.price).assertEqual(oracle.getStringByNameSync('embed_product_price001'));
      expect(previous.id).assertEqual(0);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product000').id);
      expect(await hasExpectedMedia(res, previous.imageRes, 'embed_product000')).assertTrue();
      expect((previous.title as Resource).id).assertEqual($r('app.string.embed_product_title000').id);
      expect(res.getStringSync((previous.title as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_title000'));
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price000').id);
      expect(res.getStringSync((previous.price as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_price000'));
      expect(PRODUCT_DATA[0] === seed).assertTrue();
      expect(current === seed).assertFalse();
      await assertOriginalCatalog(res);
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_CATALOGSEQUENCE_0008
     * @tc.name testProductCatalogSequence0008
     * @tc.desc Power bank RRR copy is rekeyed and replaced; its peer and all six catalog originals survive
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testProductCatalogSequence0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const res: resourceManager.ResourceManager = testResources();
      const oracle: resourceManager.ResourceManager = entryResources();
      const seed: ProductDataModel = PRODUCT_DATA[0];
      const previous: ProductDataModel = new ProductDataModel(
        0,
        seed.imageRes,
        seed.title,
        seed.price
      );
      const current: ProductDataModel = new ProductDataModel(
        0,
        $r('app.media.embed_product000'),
        $r('app.string.embed_product_title000'),
        $r('app.string.embed_product_price000')
      );
      expect(current.id).assertEqual(0);
      expect((current.imageRes as Resource).id).assertEqual($r('app.media.embed_product000').id);
      expect(await hasExpectedMedia(res, current.imageRes, 'embed_product000')).assertTrue();
      expect((current.title as Resource).id).assertEqual($r('app.string.embed_product_title000').id);
      expect(res.getStringSync((current.title as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_title000'));
      expect((current.price as Resource).id).assertEqual($r('app.string.embed_product_price000').id);
      expect(res.getStringSync((current.price as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_price000'));
      current.id = 1;
      current.imageRes = 'file://cache/notebook/front.webp';
      current.title = oracle.getStringByNameSync('embed_product_title001');
      current.price = oracle.getStringByNameSync('embed_product_price001');
      expect(current.id).assertEqual(1);
      expect(current.imageRes).assertEqual('file://cache/notebook/front.webp');
      expect(current.title).assertEqual(oracle.getStringByNameSync('embed_product_title001'));
      expect(current.price).assertEqual(oracle.getStringByNameSync('embed_product_price001'));
      expect(previous.id).assertEqual(0);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product000').id);
      expect(await hasExpectedMedia(res, previous.imageRes, 'embed_product000')).assertTrue();
      expect((previous.title as Resource).id).assertEqual($r('app.string.embed_product_title000').id);
      expect(res.getStringSync((previous.title as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_title000'));
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price000').id);
      expect(res.getStringSync((previous.price as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_price000'));
      expect(PRODUCT_DATA[0] === seed).assertTrue();
      expect(current === seed).assertFalse();
      await assertOriginalCatalog(res);
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_CATALOGSEQUENCE_0009
     * @tc.name testProductCatalogSequence0009
     * @tc.desc Notebook LLL copy is rekeyed and replaced; its peer and all six catalog originals survive
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testProductCatalogSequence0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const res: resourceManager.ResourceManager = testResources();
      const oracle: resourceManager.ResourceManager = entryResources();
      const seed: ProductDataModel = PRODUCT_DATA[1];
      const previous: ProductDataModel = new ProductDataModel(
        1,
        seed.imageRes,
        seed.title,
        seed.price
      );
      const current: ProductDataModel = new ProductDataModel(
        1,
        'file://cache/notebook/front.webp',
        oracle.getStringByNameSync('embed_product_title001'),
        oracle.getStringByNameSync('embed_product_price001')
      );
      expect(current.id).assertEqual(1);
      expect(current.imageRes).assertEqual('file://cache/notebook/front.webp');
      expect(current.title).assertEqual(oracle.getStringByNameSync('embed_product_title001'));
      expect(current.price).assertEqual(oracle.getStringByNameSync('embed_product_price001'));
      current.id = 2;
      current.imageRes = $r('app.media.embed_product002');
      current.title = $r('app.string.embed_product_title002');
      current.price = $r('app.string.embed_product_price002');
      expect(current.id).assertEqual(2);
      expect((current.imageRes as Resource).id).assertEqual($r('app.media.embed_product002').id);
      expect(await hasExpectedMedia(res, current.imageRes, 'embed_product002')).assertTrue();
      expect((current.title as Resource).id).assertEqual($r('app.string.embed_product_title002').id);
      expect(res.getStringSync((current.title as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_title002'));
      expect((current.price as Resource).id).assertEqual($r('app.string.embed_product_price002').id);
      expect(res.getStringSync((current.price as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_price002'));
      expect(previous.id).assertEqual(1);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product001').id);
      expect(await hasExpectedMedia(res, previous.imageRes, 'embed_product001')).assertTrue();
      expect((previous.title as Resource).id).assertEqual($r('app.string.embed_product_title001').id);
      expect(res.getStringSync((previous.title as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_title001'));
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price001').id);
      expect(res.getStringSync((previous.price as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_price001'));
      expect(PRODUCT_DATA[1] === seed).assertTrue();
      expect(current === seed).assertFalse();
      await assertOriginalCatalog(res);
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_CATALOGSEQUENCE_0010
     * @tc.name testProductCatalogSequence0010
     * @tc.desc Notebook RLL copy is rekeyed and replaced; its peer and all six catalog originals survive
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testProductCatalogSequence0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const res: resourceManager.ResourceManager = testResources();
      const oracle: resourceManager.ResourceManager = entryResources();
      const seed: ProductDataModel = PRODUCT_DATA[1];
      const previous: ProductDataModel = new ProductDataModel(
        1,
        seed.imageRes,
        seed.title,
        seed.price
      );
      const current: ProductDataModel = new ProductDataModel(
        1,
        $r('app.media.embed_product001'),
        oracle.getStringByNameSync('embed_product_title001'),
        oracle.getStringByNameSync('embed_product_price001')
      );
      expect(current.id).assertEqual(1);
      expect((current.imageRes as Resource).id).assertEqual($r('app.media.embed_product001').id);
      expect(await hasExpectedMedia(res, current.imageRes, 'embed_product001')).assertTrue();
      expect(current.title).assertEqual(oracle.getStringByNameSync('embed_product_title001'));
      expect(current.price).assertEqual(oracle.getStringByNameSync('embed_product_price001'));
      current.id = 2;
      current.imageRes = 'https://store.example/phone/front.webp';
      current.title = $r('app.string.embed_product_title002');
      current.price = $r('app.string.embed_product_price002');
      expect(current.id).assertEqual(2);
      expect(current.imageRes).assertEqual('https://store.example/phone/front.webp');
      expect((current.title as Resource).id).assertEqual($r('app.string.embed_product_title002').id);
      expect(res.getStringSync((current.title as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_title002'));
      expect((current.price as Resource).id).assertEqual($r('app.string.embed_product_price002').id);
      expect(res.getStringSync((current.price as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_price002'));
      expect(previous.id).assertEqual(1);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product001').id);
      expect(await hasExpectedMedia(res, previous.imageRes, 'embed_product001')).assertTrue();
      expect((previous.title as Resource).id).assertEqual($r('app.string.embed_product_title001').id);
      expect(res.getStringSync((previous.title as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_title001'));
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price001').id);
      expect(res.getStringSync((previous.price as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_price001'));
      expect(PRODUCT_DATA[1] === seed).assertTrue();
      expect(current === seed).assertFalse();
      await assertOriginalCatalog(res);
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_CATALOGSEQUENCE_0011
     * @tc.name testProductCatalogSequence0011
     * @tc.desc Notebook LRL copy is rekeyed and replaced; its peer and all six catalog originals survive
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testProductCatalogSequence0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const res: resourceManager.ResourceManager = testResources();
      const oracle: resourceManager.ResourceManager = entryResources();
      const seed: ProductDataModel = PRODUCT_DATA[1];
      const previous: ProductDataModel = new ProductDataModel(
        1,
        seed.imageRes,
        seed.title,
        seed.price
      );
      const current: ProductDataModel = new ProductDataModel(
        1,
        'file://cache/notebook/front.webp',
        $r('app.string.embed_product_title001'),
        oracle.getStringByNameSync('embed_product_price001')
      );
      expect(current.id).assertEqual(1);
      expect(current.imageRes).assertEqual('file://cache/notebook/front.webp');
      expect((current.title as Resource).id).assertEqual($r('app.string.embed_product_title001').id);
      expect(res.getStringSync((current.title as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_title001'));
      expect(current.price).assertEqual(oracle.getStringByNameSync('embed_product_price001'));
      current.id = 2;
      current.imageRes = $r('app.media.embed_product002');
      current.title = oracle.getStringByNameSync('embed_product_title002');
      current.price = $r('app.string.embed_product_price002');
      expect(current.id).assertEqual(2);
      expect((current.imageRes as Resource).id).assertEqual($r('app.media.embed_product002').id);
      expect(await hasExpectedMedia(res, current.imageRes, 'embed_product002')).assertTrue();
      expect(current.title).assertEqual(oracle.getStringByNameSync('embed_product_title002'));
      expect((current.price as Resource).id).assertEqual($r('app.string.embed_product_price002').id);
      expect(res.getStringSync((current.price as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_price002'));
      expect(previous.id).assertEqual(1);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product001').id);
      expect(await hasExpectedMedia(res, previous.imageRes, 'embed_product001')).assertTrue();
      expect((previous.title as Resource).id).assertEqual($r('app.string.embed_product_title001').id);
      expect(res.getStringSync((previous.title as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_title001'));
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price001').id);
      expect(res.getStringSync((previous.price as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_price001'));
      expect(PRODUCT_DATA[1] === seed).assertTrue();
      expect(current === seed).assertFalse();
      await assertOriginalCatalog(res);
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_CATALOGSEQUENCE_0012
     * @tc.name testProductCatalogSequence0012
     * @tc.desc Notebook RRL copy is rekeyed and replaced; its peer and all six catalog originals survive
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testProductCatalogSequence0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const res: resourceManager.ResourceManager = testResources();
      const oracle: resourceManager.ResourceManager = entryResources();
      const seed: ProductDataModel = PRODUCT_DATA[1];
      const previous: ProductDataModel = new ProductDataModel(
        1,
        seed.imageRes,
        seed.title,
        seed.price
      );
      const current: ProductDataModel = new ProductDataModel(
        1,
        $r('app.media.embed_product001'),
        $r('app.string.embed_product_title001'),
        oracle.getStringByNameSync('embed_product_price001')
      );
      expect(current.id).assertEqual(1);
      expect((current.imageRes as Resource).id).assertEqual($r('app.media.embed_product001').id);
      expect(await hasExpectedMedia(res, current.imageRes, 'embed_product001')).assertTrue();
      expect((current.title as Resource).id).assertEqual($r('app.string.embed_product_title001').id);
      expect(res.getStringSync((current.title as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_title001'));
      expect(current.price).assertEqual(oracle.getStringByNameSync('embed_product_price001'));
      current.id = 2;
      current.imageRes = 'https://store.example/phone/front.webp';
      current.title = oracle.getStringByNameSync('embed_product_title002');
      current.price = $r('app.string.embed_product_price002');
      expect(current.id).assertEqual(2);
      expect(current.imageRes).assertEqual('https://store.example/phone/front.webp');
      expect(current.title).assertEqual(oracle.getStringByNameSync('embed_product_title002'));
      expect((current.price as Resource).id).assertEqual($r('app.string.embed_product_price002').id);
      expect(res.getStringSync((current.price as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_price002'));
      expect(previous.id).assertEqual(1);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product001').id);
      expect(await hasExpectedMedia(res, previous.imageRes, 'embed_product001')).assertTrue();
      expect((previous.title as Resource).id).assertEqual($r('app.string.embed_product_title001').id);
      expect(res.getStringSync((previous.title as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_title001'));
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price001').id);
      expect(res.getStringSync((previous.price as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_price001'));
      expect(PRODUCT_DATA[1] === seed).assertTrue();
      expect(current === seed).assertFalse();
      await assertOriginalCatalog(res);
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_CATALOGSEQUENCE_0013
     * @tc.name testProductCatalogSequence0013
     * @tc.desc Notebook LLR copy is rekeyed and replaced; its peer and all six catalog originals survive
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testProductCatalogSequence0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const res: resourceManager.ResourceManager = testResources();
      const oracle: resourceManager.ResourceManager = entryResources();
      const seed: ProductDataModel = PRODUCT_DATA[1];
      const previous: ProductDataModel = new ProductDataModel(
        1,
        seed.imageRes,
        seed.title,
        seed.price
      );
      const current: ProductDataModel = new ProductDataModel(
        1,
        'file://cache/notebook/front.webp',
        oracle.getStringByNameSync('embed_product_title001'),
        $r('app.string.embed_product_price001')
      );
      expect(current.id).assertEqual(1);
      expect(current.imageRes).assertEqual('file://cache/notebook/front.webp');
      expect(current.title).assertEqual(oracle.getStringByNameSync('embed_product_title001'));
      expect((current.price as Resource).id).assertEqual($r('app.string.embed_product_price001').id);
      expect(res.getStringSync((current.price as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_price001'));
      current.id = 2;
      current.imageRes = $r('app.media.embed_product002');
      current.title = $r('app.string.embed_product_title002');
      current.price = oracle.getStringByNameSync('embed_product_price002');
      expect(current.id).assertEqual(2);
      expect((current.imageRes as Resource).id).assertEqual($r('app.media.embed_product002').id);
      expect(await hasExpectedMedia(res, current.imageRes, 'embed_product002')).assertTrue();
      expect((current.title as Resource).id).assertEqual($r('app.string.embed_product_title002').id);
      expect(res.getStringSync((current.title as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_title002'));
      expect(current.price).assertEqual(oracle.getStringByNameSync('embed_product_price002'));
      expect(previous.id).assertEqual(1);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product001').id);
      expect(await hasExpectedMedia(res, previous.imageRes, 'embed_product001')).assertTrue();
      expect((previous.title as Resource).id).assertEqual($r('app.string.embed_product_title001').id);
      expect(res.getStringSync((previous.title as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_title001'));
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price001').id);
      expect(res.getStringSync((previous.price as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_price001'));
      expect(PRODUCT_DATA[1] === seed).assertTrue();
      expect(current === seed).assertFalse();
      await assertOriginalCatalog(res);
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_CATALOGSEQUENCE_0014
     * @tc.name testProductCatalogSequence0014
     * @tc.desc Notebook RLR copy is rekeyed and replaced; its peer and all six catalog originals survive
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testProductCatalogSequence0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const res: resourceManager.ResourceManager = testResources();
      const oracle: resourceManager.ResourceManager = entryResources();
      const seed: ProductDataModel = PRODUCT_DATA[1];
      const previous: ProductDataModel = new ProductDataModel(
        1,
        seed.imageRes,
        seed.title,
        seed.price
      );
      const current: ProductDataModel = new ProductDataModel(
        1,
        $r('app.media.embed_product001'),
        oracle.getStringByNameSync('embed_product_title001'),
        $r('app.string.embed_product_price001')
      );
      expect(current.id).assertEqual(1);
      expect((current.imageRes as Resource).id).assertEqual($r('app.media.embed_product001').id);
      expect(await hasExpectedMedia(res, current.imageRes, 'embed_product001')).assertTrue();
      expect(current.title).assertEqual(oracle.getStringByNameSync('embed_product_title001'));
      expect((current.price as Resource).id).assertEqual($r('app.string.embed_product_price001').id);
      expect(res.getStringSync((current.price as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_price001'));
      current.id = 2;
      current.imageRes = 'https://store.example/phone/front.webp';
      current.title = $r('app.string.embed_product_title002');
      current.price = oracle.getStringByNameSync('embed_product_price002');
      expect(current.id).assertEqual(2);
      expect(current.imageRes).assertEqual('https://store.example/phone/front.webp');
      expect((current.title as Resource).id).assertEqual($r('app.string.embed_product_title002').id);
      expect(res.getStringSync((current.title as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_title002'));
      expect(current.price).assertEqual(oracle.getStringByNameSync('embed_product_price002'));
      expect(previous.id).assertEqual(1);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product001').id);
      expect(await hasExpectedMedia(res, previous.imageRes, 'embed_product001')).assertTrue();
      expect((previous.title as Resource).id).assertEqual($r('app.string.embed_product_title001').id);
      expect(res.getStringSync((previous.title as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_title001'));
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price001').id);
      expect(res.getStringSync((previous.price as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_price001'));
      expect(PRODUCT_DATA[1] === seed).assertTrue();
      expect(current === seed).assertFalse();
      await assertOriginalCatalog(res);
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_CATALOGSEQUENCE_0015
     * @tc.name testProductCatalogSequence0015
     * @tc.desc Notebook LRR copy is rekeyed and replaced; its peer and all six catalog originals survive
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testProductCatalogSequence0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const res: resourceManager.ResourceManager = testResources();
      const oracle: resourceManager.ResourceManager = entryResources();
      const seed: ProductDataModel = PRODUCT_DATA[1];
      const previous: ProductDataModel = new ProductDataModel(
        1,
        seed.imageRes,
        seed.title,
        seed.price
      );
      const current: ProductDataModel = new ProductDataModel(
        1,
        'file://cache/notebook/front.webp',
        $r('app.string.embed_product_title001'),
        $r('app.string.embed_product_price001')
      );
      expect(current.id).assertEqual(1);
      expect(current.imageRes).assertEqual('file://cache/notebook/front.webp');
      expect((current.title as Resource).id).assertEqual($r('app.string.embed_product_title001').id);
      expect(res.getStringSync((current.title as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_title001'));
      expect((current.price as Resource).id).assertEqual($r('app.string.embed_product_price001').id);
      expect(res.getStringSync((current.price as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_price001'));
      current.id = 2;
      current.imageRes = $r('app.media.embed_product002');
      current.title = oracle.getStringByNameSync('embed_product_title002');
      current.price = oracle.getStringByNameSync('embed_product_price002');
      expect(current.id).assertEqual(2);
      expect((current.imageRes as Resource).id).assertEqual($r('app.media.embed_product002').id);
      expect(await hasExpectedMedia(res, current.imageRes, 'embed_product002')).assertTrue();
      expect(current.title).assertEqual(oracle.getStringByNameSync('embed_product_title002'));
      expect(current.price).assertEqual(oracle.getStringByNameSync('embed_product_price002'));
      expect(previous.id).assertEqual(1);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product001').id);
      expect(await hasExpectedMedia(res, previous.imageRes, 'embed_product001')).assertTrue();
      expect((previous.title as Resource).id).assertEqual($r('app.string.embed_product_title001').id);
      expect(res.getStringSync((previous.title as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_title001'));
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price001').id);
      expect(res.getStringSync((previous.price as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_price001'));
      expect(PRODUCT_DATA[1] === seed).assertTrue();
      expect(current === seed).assertFalse();
      await assertOriginalCatalog(res);
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_CATALOGSEQUENCE_0016
     * @tc.name testProductCatalogSequence0016
     * @tc.desc Notebook RRR copy is rekeyed and replaced; its peer and all six catalog originals survive
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testProductCatalogSequence0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const res: resourceManager.ResourceManager = testResources();
      const oracle: resourceManager.ResourceManager = entryResources();
      const seed: ProductDataModel = PRODUCT_DATA[1];
      const previous: ProductDataModel = new ProductDataModel(
        1,
        seed.imageRes,
        seed.title,
        seed.price
      );
      const current: ProductDataModel = new ProductDataModel(
        1,
        $r('app.media.embed_product001'),
        $r('app.string.embed_product_title001'),
        $r('app.string.embed_product_price001')
      );
      expect(current.id).assertEqual(1);
      expect((current.imageRes as Resource).id).assertEqual($r('app.media.embed_product001').id);
      expect(await hasExpectedMedia(res, current.imageRes, 'embed_product001')).assertTrue();
      expect((current.title as Resource).id).assertEqual($r('app.string.embed_product_title001').id);
      expect(res.getStringSync((current.title as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_title001'));
      expect((current.price as Resource).id).assertEqual($r('app.string.embed_product_price001').id);
      expect(res.getStringSync((current.price as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_price001'));
      current.id = 2;
      current.imageRes = 'https://store.example/phone/front.webp';
      current.title = oracle.getStringByNameSync('embed_product_title002');
      current.price = oracle.getStringByNameSync('embed_product_price002');
      expect(current.id).assertEqual(2);
      expect(current.imageRes).assertEqual('https://store.example/phone/front.webp');
      expect(current.title).assertEqual(oracle.getStringByNameSync('embed_product_title002'));
      expect(current.price).assertEqual(oracle.getStringByNameSync('embed_product_price002'));
      expect(previous.id).assertEqual(1);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product001').id);
      expect(await hasExpectedMedia(res, previous.imageRes, 'embed_product001')).assertTrue();
      expect((previous.title as Resource).id).assertEqual($r('app.string.embed_product_title001').id);
      expect(res.getStringSync((previous.title as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_title001'));
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price001').id);
      expect(res.getStringSync((previous.price as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_price001'));
      expect(PRODUCT_DATA[1] === seed).assertTrue();
      expect(current === seed).assertFalse();
      await assertOriginalCatalog(res);
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_CATALOGSEQUENCE_0017
     * @tc.name testProductCatalogSequence0017
     * @tc.desc Phone LLL copy is rekeyed and replaced; its peer and all six catalog originals survive
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testProductCatalogSequence0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const res: resourceManager.ResourceManager = testResources();
      const oracle: resourceManager.ResourceManager = entryResources();
      const seed: ProductDataModel = PRODUCT_DATA[2];
      const previous: ProductDataModel = new ProductDataModel(
        2,
        seed.imageRes,
        seed.title,
        seed.price
      );
      const current: ProductDataModel = new ProductDataModel(
        2,
        'https://store.example/phone/front.webp',
        oracle.getStringByNameSync('embed_product_title002'),
        oracle.getStringByNameSync('embed_product_price002')
      );
      expect(current.id).assertEqual(2);
      expect(current.imageRes).assertEqual('https://store.example/phone/front.webp');
      expect(current.title).assertEqual(oracle.getStringByNameSync('embed_product_title002'));
      expect(current.price).assertEqual(oracle.getStringByNameSync('embed_product_price002'));
      current.id = 3;
      current.imageRes = $r('app.media.embed_product003');
      current.title = $r('app.string.embed_product_title003');
      current.price = $r('app.string.embed_product_price003');
      expect(current.id).assertEqual(3);
      expect((current.imageRes as Resource).id).assertEqual($r('app.media.embed_product003').id);
      expect(await hasExpectedMedia(res, current.imageRes, 'embed_product003')).assertTrue();
      expect((current.title as Resource).id).assertEqual($r('app.string.embed_product_title003').id);
      expect(res.getStringSync((current.title as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_title003'));
      expect((current.price as Resource).id).assertEqual($r('app.string.embed_product_price003').id);
      expect(res.getStringSync((current.price as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_price003'));
      expect(previous.id).assertEqual(2);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product002').id);
      expect(await hasExpectedMedia(res, previous.imageRes, 'embed_product002')).assertTrue();
      expect((previous.title as Resource).id).assertEqual($r('app.string.embed_product_title002').id);
      expect(res.getStringSync((previous.title as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_title002'));
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price002').id);
      expect(res.getStringSync((previous.price as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_price002'));
      expect(PRODUCT_DATA[2] === seed).assertTrue();
      expect(current === seed).assertFalse();
      await assertOriginalCatalog(res);
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_CATALOGSEQUENCE_0018
     * @tc.name testProductCatalogSequence0018
     * @tc.desc Phone RLL copy is rekeyed and replaced; its peer and all six catalog originals survive
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testProductCatalogSequence0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const res: resourceManager.ResourceManager = testResources();
      const oracle: resourceManager.ResourceManager = entryResources();
      const seed: ProductDataModel = PRODUCT_DATA[2];
      const previous: ProductDataModel = new ProductDataModel(
        2,
        seed.imageRes,
        seed.title,
        seed.price
      );
      const current: ProductDataModel = new ProductDataModel(
        2,
        $r('app.media.embed_product002'),
        oracle.getStringByNameSync('embed_product_title002'),
        oracle.getStringByNameSync('embed_product_price002')
      );
      expect(current.id).assertEqual(2);
      expect((current.imageRes as Resource).id).assertEqual($r('app.media.embed_product002').id);
      expect(await hasExpectedMedia(res, current.imageRes, 'embed_product002')).assertTrue();
      expect(current.title).assertEqual(oracle.getStringByNameSync('embed_product_title002'));
      expect(current.price).assertEqual(oracle.getStringByNameSync('embed_product_price002'));
      current.id = 3;
      current.imageRes = 'file://cache/charger/front.webp';
      current.title = $r('app.string.embed_product_title003');
      current.price = $r('app.string.embed_product_price003');
      expect(current.id).assertEqual(3);
      expect(current.imageRes).assertEqual('file://cache/charger/front.webp');
      expect((current.title as Resource).id).assertEqual($r('app.string.embed_product_title003').id);
      expect(res.getStringSync((current.title as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_title003'));
      expect((current.price as Resource).id).assertEqual($r('app.string.embed_product_price003').id);
      expect(res.getStringSync((current.price as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_price003'));
      expect(previous.id).assertEqual(2);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product002').id);
      expect(await hasExpectedMedia(res, previous.imageRes, 'embed_product002')).assertTrue();
      expect((previous.title as Resource).id).assertEqual($r('app.string.embed_product_title002').id);
      expect(res.getStringSync((previous.title as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_title002'));
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price002').id);
      expect(res.getStringSync((previous.price as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_price002'));
      expect(PRODUCT_DATA[2] === seed).assertTrue();
      expect(current === seed).assertFalse();
      await assertOriginalCatalog(res);
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_CATALOGSEQUENCE_0019
     * @tc.name testProductCatalogSequence0019
     * @tc.desc Phone LRL copy is rekeyed and replaced; its peer and all six catalog originals survive
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testProductCatalogSequence0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const res: resourceManager.ResourceManager = testResources();
      const oracle: resourceManager.ResourceManager = entryResources();
      const seed: ProductDataModel = PRODUCT_DATA[2];
      const previous: ProductDataModel = new ProductDataModel(
        2,
        seed.imageRes,
        seed.title,
        seed.price
      );
      const current: ProductDataModel = new ProductDataModel(
        2,
        'https://store.example/phone/front.webp',
        $r('app.string.embed_product_title002'),
        oracle.getStringByNameSync('embed_product_price002')
      );
      expect(current.id).assertEqual(2);
      expect(current.imageRes).assertEqual('https://store.example/phone/front.webp');
      expect((current.title as Resource).id).assertEqual($r('app.string.embed_product_title002').id);
      expect(res.getStringSync((current.title as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_title002'));
      expect(current.price).assertEqual(oracle.getStringByNameSync('embed_product_price002'));
      current.id = 3;
      current.imageRes = $r('app.media.embed_product003');
      current.title = oracle.getStringByNameSync('embed_product_title003');
      current.price = $r('app.string.embed_product_price003');
      expect(current.id).assertEqual(3);
      expect((current.imageRes as Resource).id).assertEqual($r('app.media.embed_product003').id);
      expect(await hasExpectedMedia(res, current.imageRes, 'embed_product003')).assertTrue();
      expect(current.title).assertEqual(oracle.getStringByNameSync('embed_product_title003'));
      expect((current.price as Resource).id).assertEqual($r('app.string.embed_product_price003').id);
      expect(res.getStringSync((current.price as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_price003'));
      expect(previous.id).assertEqual(2);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product002').id);
      expect(await hasExpectedMedia(res, previous.imageRes, 'embed_product002')).assertTrue();
      expect((previous.title as Resource).id).assertEqual($r('app.string.embed_product_title002').id);
      expect(res.getStringSync((previous.title as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_title002'));
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price002').id);
      expect(res.getStringSync((previous.price as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_price002'));
      expect(PRODUCT_DATA[2] === seed).assertTrue();
      expect(current === seed).assertFalse();
      await assertOriginalCatalog(res);
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_CATALOGSEQUENCE_0020
     * @tc.name testProductCatalogSequence0020
     * @tc.desc Phone RRL copy is rekeyed and replaced; its peer and all six catalog originals survive
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testProductCatalogSequence0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const res: resourceManager.ResourceManager = testResources();
      const oracle: resourceManager.ResourceManager = entryResources();
      const seed: ProductDataModel = PRODUCT_DATA[2];
      const previous: ProductDataModel = new ProductDataModel(
        2,
        seed.imageRes,
        seed.title,
        seed.price
      );
      const current: ProductDataModel = new ProductDataModel(
        2,
        $r('app.media.embed_product002'),
        $r('app.string.embed_product_title002'),
        oracle.getStringByNameSync('embed_product_price002')
      );
      expect(current.id).assertEqual(2);
      expect((current.imageRes as Resource).id).assertEqual($r('app.media.embed_product002').id);
      expect(await hasExpectedMedia(res, current.imageRes, 'embed_product002')).assertTrue();
      expect((current.title as Resource).id).assertEqual($r('app.string.embed_product_title002').id);
      expect(res.getStringSync((current.title as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_title002'));
      expect(current.price).assertEqual(oracle.getStringByNameSync('embed_product_price002'));
      current.id = 3;
      current.imageRes = 'file://cache/charger/front.webp';
      current.title = oracle.getStringByNameSync('embed_product_title003');
      current.price = $r('app.string.embed_product_price003');
      expect(current.id).assertEqual(3);
      expect(current.imageRes).assertEqual('file://cache/charger/front.webp');
      expect(current.title).assertEqual(oracle.getStringByNameSync('embed_product_title003'));
      expect((current.price as Resource).id).assertEqual($r('app.string.embed_product_price003').id);
      expect(res.getStringSync((current.price as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_price003'));
      expect(previous.id).assertEqual(2);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product002').id);
      expect(await hasExpectedMedia(res, previous.imageRes, 'embed_product002')).assertTrue();
      expect((previous.title as Resource).id).assertEqual($r('app.string.embed_product_title002').id);
      expect(res.getStringSync((previous.title as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_title002'));
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price002').id);
      expect(res.getStringSync((previous.price as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_price002'));
      expect(PRODUCT_DATA[2] === seed).assertTrue();
      expect(current === seed).assertFalse();
      await assertOriginalCatalog(res);
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_CATALOGSEQUENCE_0021
     * @tc.name testProductCatalogSequence0021
     * @tc.desc Phone LLR copy is rekeyed and replaced; its peer and all six catalog originals survive
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testProductCatalogSequence0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const res: resourceManager.ResourceManager = testResources();
      const oracle: resourceManager.ResourceManager = entryResources();
      const seed: ProductDataModel = PRODUCT_DATA[2];
      const previous: ProductDataModel = new ProductDataModel(
        2,
        seed.imageRes,
        seed.title,
        seed.price
      );
      const current: ProductDataModel = new ProductDataModel(
        2,
        'https://store.example/phone/front.webp',
        oracle.getStringByNameSync('embed_product_title002'),
        $r('app.string.embed_product_price002')
      );
      expect(current.id).assertEqual(2);
      expect(current.imageRes).assertEqual('https://store.example/phone/front.webp');
      expect(current.title).assertEqual(oracle.getStringByNameSync('embed_product_title002'));
      expect((current.price as Resource).id).assertEqual($r('app.string.embed_product_price002').id);
      expect(res.getStringSync((current.price as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_price002'));
      current.id = 3;
      current.imageRes = $r('app.media.embed_product003');
      current.title = $r('app.string.embed_product_title003');
      current.price = oracle.getStringByNameSync('embed_product_price003');
      expect(current.id).assertEqual(3);
      expect((current.imageRes as Resource).id).assertEqual($r('app.media.embed_product003').id);
      expect(await hasExpectedMedia(res, current.imageRes, 'embed_product003')).assertTrue();
      expect((current.title as Resource).id).assertEqual($r('app.string.embed_product_title003').id);
      expect(res.getStringSync((current.title as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_title003'));
      expect(current.price).assertEqual(oracle.getStringByNameSync('embed_product_price003'));
      expect(previous.id).assertEqual(2);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product002').id);
      expect(await hasExpectedMedia(res, previous.imageRes, 'embed_product002')).assertTrue();
      expect((previous.title as Resource).id).assertEqual($r('app.string.embed_product_title002').id);
      expect(res.getStringSync((previous.title as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_title002'));
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price002').id);
      expect(res.getStringSync((previous.price as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_price002'));
      expect(PRODUCT_DATA[2] === seed).assertTrue();
      expect(current === seed).assertFalse();
      await assertOriginalCatalog(res);
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_CATALOGSEQUENCE_0022
     * @tc.name testProductCatalogSequence0022
     * @tc.desc Phone RLR copy is rekeyed and replaced; its peer and all six catalog originals survive
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testProductCatalogSequence0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const res: resourceManager.ResourceManager = testResources();
      const oracle: resourceManager.ResourceManager = entryResources();
      const seed: ProductDataModel = PRODUCT_DATA[2];
      const previous: ProductDataModel = new ProductDataModel(
        2,
        seed.imageRes,
        seed.title,
        seed.price
      );
      const current: ProductDataModel = new ProductDataModel(
        2,
        $r('app.media.embed_product002'),
        oracle.getStringByNameSync('embed_product_title002'),
        $r('app.string.embed_product_price002')
      );
      expect(current.id).assertEqual(2);
      expect((current.imageRes as Resource).id).assertEqual($r('app.media.embed_product002').id);
      expect(await hasExpectedMedia(res, current.imageRes, 'embed_product002')).assertTrue();
      expect(current.title).assertEqual(oracle.getStringByNameSync('embed_product_title002'));
      expect((current.price as Resource).id).assertEqual($r('app.string.embed_product_price002').id);
      expect(res.getStringSync((current.price as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_price002'));
      current.id = 3;
      current.imageRes = 'file://cache/charger/front.webp';
      current.title = $r('app.string.embed_product_title003');
      current.price = oracle.getStringByNameSync('embed_product_price003');
      expect(current.id).assertEqual(3);
      expect(current.imageRes).assertEqual('file://cache/charger/front.webp');
      expect((current.title as Resource).id).assertEqual($r('app.string.embed_product_title003').id);
      expect(res.getStringSync((current.title as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_title003'));
      expect(current.price).assertEqual(oracle.getStringByNameSync('embed_product_price003'));
      expect(previous.id).assertEqual(2);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product002').id);
      expect(await hasExpectedMedia(res, previous.imageRes, 'embed_product002')).assertTrue();
      expect((previous.title as Resource).id).assertEqual($r('app.string.embed_product_title002').id);
      expect(res.getStringSync((previous.title as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_title002'));
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price002').id);
      expect(res.getStringSync((previous.price as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_price002'));
      expect(PRODUCT_DATA[2] === seed).assertTrue();
      expect(current === seed).assertFalse();
      await assertOriginalCatalog(res);
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_CATALOGSEQUENCE_0023
     * @tc.name testProductCatalogSequence0023
     * @tc.desc Phone LRR copy is rekeyed and replaced; its peer and all six catalog originals survive
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testProductCatalogSequence0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const res: resourceManager.ResourceManager = testResources();
      const oracle: resourceManager.ResourceManager = entryResources();
      const seed: ProductDataModel = PRODUCT_DATA[2];
      const previous: ProductDataModel = new ProductDataModel(
        2,
        seed.imageRes,
        seed.title,
        seed.price
      );
      const current: ProductDataModel = new ProductDataModel(
        2,
        'https://store.example/phone/front.webp',
        $r('app.string.embed_product_title002'),
        $r('app.string.embed_product_price002')
      );
      expect(current.id).assertEqual(2);
      expect(current.imageRes).assertEqual('https://store.example/phone/front.webp');
      expect((current.title as Resource).id).assertEqual($r('app.string.embed_product_title002').id);
      expect(res.getStringSync((current.title as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_title002'));
      expect((current.price as Resource).id).assertEqual($r('app.string.embed_product_price002').id);
      expect(res.getStringSync((current.price as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_price002'));
      current.id = 3;
      current.imageRes = $r('app.media.embed_product003');
      current.title = oracle.getStringByNameSync('embed_product_title003');
      current.price = oracle.getStringByNameSync('embed_product_price003');
      expect(current.id).assertEqual(3);
      expect((current.imageRes as Resource).id).assertEqual($r('app.media.embed_product003').id);
      expect(await hasExpectedMedia(res, current.imageRes, 'embed_product003')).assertTrue();
      expect(current.title).assertEqual(oracle.getStringByNameSync('embed_product_title003'));
      expect(current.price).assertEqual(oracle.getStringByNameSync('embed_product_price003'));
      expect(previous.id).assertEqual(2);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product002').id);
      expect(await hasExpectedMedia(res, previous.imageRes, 'embed_product002')).assertTrue();
      expect((previous.title as Resource).id).assertEqual($r('app.string.embed_product_title002').id);
      expect(res.getStringSync((previous.title as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_title002'));
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price002').id);
      expect(res.getStringSync((previous.price as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_price002'));
      expect(PRODUCT_DATA[2] === seed).assertTrue();
      expect(current === seed).assertFalse();
      await assertOriginalCatalog(res);
    });

    /**
     * @tc.number SUB_ARKWEB_SAMELEVEL_PRODUCT_CATALOGSEQUENCE_0024
     * @tc.name testProductCatalogSequence0024
     * @tc.desc Phone RRR copy is rekeyed and replaced; its peer and all six catalog originals survive
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testProductCatalogSequence0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const res: resourceManager.ResourceManager = testResources();
      const oracle: resourceManager.ResourceManager = entryResources();
      const seed: ProductDataModel = PRODUCT_DATA[2];
      const previous: ProductDataModel = new ProductDataModel(
        2,
        seed.imageRes,
        seed.title,
        seed.price
      );
      const current: ProductDataModel = new ProductDataModel(
        2,
        $r('app.media.embed_product002'),
        $r('app.string.embed_product_title002'),
        $r('app.string.embed_product_price002')
      );
      expect(current.id).assertEqual(2);
      expect((current.imageRes as Resource).id).assertEqual($r('app.media.embed_product002').id);
      expect(await hasExpectedMedia(res, current.imageRes, 'embed_product002')).assertTrue();
      expect((current.title as Resource).id).assertEqual($r('app.string.embed_product_title002').id);
      expect(res.getStringSync((current.title as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_title002'));
      expect((current.price as Resource).id).assertEqual($r('app.string.embed_product_price002').id);
      expect(res.getStringSync((current.price as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_price002'));
      current.id = 3;
      current.imageRes = 'file://cache/charger/front.webp';
      current.title = oracle.getStringByNameSync('embed_product_title003');
      current.price = oracle.getStringByNameSync('embed_product_price003');
      expect(current.id).assertEqual(3);
      expect(current.imageRes).assertEqual('file://cache/charger/front.webp');
      expect(current.title).assertEqual(oracle.getStringByNameSync('embed_product_title003'));
      expect(current.price).assertEqual(oracle.getStringByNameSync('embed_product_price003'));
      expect(previous.id).assertEqual(2);
      expect((previous.imageRes as Resource).id).assertEqual($r('app.media.embed_product002').id);
      expect(await hasExpectedMedia(res, previous.imageRes, 'embed_product002')).assertTrue();
      expect((previous.title as Resource).id).assertEqual($r('app.string.embed_product_title002').id);
      expect(res.getStringSync((previous.title as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_title002'));
      expect((previous.price as Resource).id).assertEqual($r('app.string.embed_product_price002').id);
      expect(res.getStringSync((previous.price as Resource).id)).assertEqual(
        oracle.getStringByNameSync('embed_product_price002'));
      expect(PRODUCT_DATA[2] === seed).assertTrue();
      expect(current === seed).assertFalse();
      await assertOriginalCatalog(res);
    });
  });
}
