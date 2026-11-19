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
import { describe, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { ProductDataModel } from '../../../main/ets/bridge/ImmersiveBridge';

const DOMAIN: number = 0xF814;
const TAG: string = 'GoodsModelCoreTest';

function log(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

export default function goodsModelCoreTest(): void {
  describe('GoodsModelCoreTest', () => {
    /**
     * @tc.number    SUB_IMMERSIVE_GMODEL_0101
     * @tc.name      testGoodsModel0101
     * @tc.desc      Verify constructor assigns the id field as passed in.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testGoodsModel0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testGoodsModel0101 begin');
      const model: ProductDataModel = new ProductDataModel(0, 'uri0', 'title0', 'price0', 'views0');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.id=${model.id}, expected=0`);
      expect(model.id).assertEqual(0);
      log('testGoodsModel0101 end');
    })

    /**
     * @tc.number    SUB_IMMERSIVE_GMODEL_0102
     * @tc.name      testGoodsModel0102
     * @tc.desc      Verify constructor assigns the uri field as passed in.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testGoodsModel0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testGoodsModel0102 begin');
      const model: ProductDataModel = new ProductDataModel(0, 'uri0', 'title0', 'price0', 'views0');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.uri=${model.uri}, expected='uri0'`);
      expect(model.uri).assertEqual('uri0');
      log('testGoodsModel0102 end');
    })

    /**
     * @tc.number    SUB_IMMERSIVE_GMODEL_0103
     * @tc.name      testGoodsModel0103
     * @tc.desc      Verify constructor assigns the title field as passed in.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testGoodsModel0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testGoodsModel0103 begin');
      const model: ProductDataModel = new ProductDataModel(0, 'uri0', 'title0', 'price0', 'views0');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.title=${model.title}, expected='title0'`);
      expect(model.title).assertEqual('title0');
      log('testGoodsModel0103 end');
    })

    /**
     * @tc.number    SUB_IMMERSIVE_GMODEL_0104
     * @tc.name      testGoodsModel0104
     * @tc.desc      Verify constructor assigns the price field as passed in.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testGoodsModel0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testGoodsModel0104 begin');
      const model: ProductDataModel = new ProductDataModel(0, 'uri0', 'title0', 'price0', 'views0');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.price=${model.price}, expected='price0'`);
      expect(model.price).assertEqual('price0');
      log('testGoodsModel0104 end');
    })

    /**
     * @tc.number    SUB_IMMERSIVE_GMODEL_0105
     * @tc.name      testGoodsModel0105
     * @tc.desc      Verify constructor assigns the views field as passed in.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testGoodsModel0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testGoodsModel0105 begin');
      const model: ProductDataModel = new ProductDataModel(0, 'uri0', 'title0', 'price0', 'views0');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.views=${model.views}, expected='views0'`);
      expect(model.views).assertEqual('views0');
      log('testGoodsModel0105 end');
    })

    /**
     * @tc.number    SUB_IMMERSIVE_GMODEL_0106
     * @tc.name      testGoodsModel0106
     * @tc.desc      Verify the id field keeps number type.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testGoodsModel0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testGoodsModel0106 begin');
      const model: ProductDataModel = new ProductDataModel(3, 'uri', 'title', 'price', 'views');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof model.id=${typeof model.id}, expected='number'`);
      expect(typeof model.id).assertEqual('number');
      log('testGoodsModel0106 end');
    })

    /**
     * @tc.number    SUB_IMMERSIVE_GMODEL_0107
     * @tc.name      testGoodsModel0107
     * @tc.desc      Verify string-typed title keeps string type.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testGoodsModel0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testGoodsModel0107 begin');
      const model: ProductDataModel = new ProductDataModel(3, 'uri', 'title', 'price', 'views');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof model.title=${typeof model.title}, expected='string'`);
      expect(typeof model.title).assertEqual('string');
      log('testGoodsModel0107 end');
    })

    /**
     * @tc.number    SUB_IMMERSIVE_GMODEL_0108
     * @tc.name      testGoodsModel0108
     * @tc.desc      Verify string-typed uri keeps string type.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testGoodsModel0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testGoodsModel0108 begin');
      const model: ProductDataModel = new ProductDataModel(3, 'uri', 'title', 'price', 'views');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof model.uri=${typeof model.uri}, expected='string'`);
      expect(typeof model.uri).assertEqual('string');
      log('testGoodsModel0108 end');
    })

    /**
     * @tc.number    SUB_IMMERSIVE_GMODEL_0109
     * @tc.name      testGoodsModel0109
     * @tc.desc      Verify zero id is accepted and preserved.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testGoodsModel0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testGoodsModel0109 begin');
      const model: ProductDataModel = new ProductDataModel(0, 'u', 't', 'p', 'v');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.id=${model.id}, expected=0`);
      expect(model.id).assertEqual(0);
      log('testGoodsModel0109 end');
    })

    /**
     * @tc.number    SUB_IMMERSIVE_GMODEL_0110
     * @tc.name      testGoodsModel0110
     * @tc.desc      Verify negative id is accepted and preserved.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testGoodsModel0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testGoodsModel0110 begin');
      const model: ProductDataModel = new ProductDataModel(-1, 'u', 't', 'p', 'v');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.id=${model.id}, expected=-1`);
      expect(model.id).assertEqual(-1);
      log('testGoodsModel0110 end');
    })

    /**
     * @tc.number    SUB_IMMERSIVE_GMODEL_0111
     * @tc.name      testGoodsModel0111
     * @tc.desc      Verify a large safe-integer id is accepted and preserved.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testGoodsModel0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testGoodsModel0111 begin');
      const bigId: number = 9007199254740991;
      const model: ProductDataModel = new ProductDataModel(bigId, 'u', 't', 'p', 'v');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.id=${model.id}, expected=bigId`);
      expect(model.id).assertEqual(bigId);
      log('testGoodsModel0111 end');
    })

    /**
     * @tc.number    SUB_IMMERSIVE_GMODEL_0112
     * @tc.name      testGoodsModel0112
     * @tc.desc      Verify the title field is mutable after construction.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testGoodsModel0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testGoodsModel0112 begin');
      const model: ProductDataModel = new ProductDataModel(1, 'u', 'old', 'p', 'v');
      model.title = 'new';
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.title=${model.title}, expected='new'`);
      expect(model.title).assertEqual('new');
      log('testGoodsModel0112 end');
    })

    /**
     * @tc.number    SUB_IMMERSIVE_GMODEL_0113
     * @tc.name      testGoodsModel0113
     * @tc.desc      Verify two instances mutate independently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testGoodsModel0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testGoodsModel0113 begin');
      const first: ProductDataModel = new ProductDataModel(1, 'u1', 't1', 'p1', 'v1');
      const second: ProductDataModel = new ProductDataModel(2, 'u2', 't2', 'p2', 'v2');
      first.title = 'changed';
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual first.title=${first.title}, expected='changed'`);
      expect(first.title).assertEqual('changed');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual second.title=${second.title}, expected='t2'`);
      expect(second.title).assertEqual('t2');
      log('testGoodsModel0113 end');
    })

    /**
     * @tc.number    SUB_IMMERSIVE_GMODEL_0114
     * @tc.name      testGoodsModel0114
     * @tc.desc      Verify a constructed instance is a ProductDataModel.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testGoodsModel0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testGoodsModel0114 begin');
      const model: ProductDataModel = new ProductDataModel(1, 'u', 't', 'p', 'v');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${model instanceof ProductDataModel}`);
      expect(model instanceof ProductDataModel).assertTrue();
      log('testGoodsModel0114 end');
    })
  })
}
