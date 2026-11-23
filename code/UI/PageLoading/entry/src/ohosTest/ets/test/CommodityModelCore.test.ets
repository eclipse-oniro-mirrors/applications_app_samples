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
import { beforeEach, describe, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { yieldToEventLoop } from '../utils/YieldHook';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { CommodityDataModel } from '../../../main/ets/bridge/PageLoadingBridge';

const DOMAIN: number = 0xF814;
const TAG: string = 'CommodityModelCoreTest';

function log(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

function makeModel(id: number, title: string): CommodityDataModel {
  return new CommodityDataModel(id, 'uri_' + title, title, 'price_' + title, 'views_' + title,
    'ins_' + title);
}

export default function commodityModelCoreTest(): void {
  describe('CommodityModelCoreTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_PAGELOADING_COMMODITYMDL_0001
     * @tc.name      testCommodityModel0001
     * @tc.desc      Verify constructor assigns id, uri and title fields.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCommodityModel0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCommodityModel0001 begin');
      const model: CommodityDataModel = makeModel(3, 'title0');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.id=${model.id}, expected=3`);
      expect(model.id).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.uri=${model.uri}, expected='uri_title0'`);
      expect(model.uri).assertEqual('uri_title0');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.title=${model.title}, expected='title0'`);
      expect(model.title).assertEqual('title0');
      log('testCommodityModel0001 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITYMDL_0002
     * @tc.name      testCommodityModel0002
     * @tc.desc      Verify constructor assigns price, views and insurance fields.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCommodityModel0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCommodityModel0002 begin');
      const model: CommodityDataModel = makeModel(1, 'title0');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.price=${model.price}, expected='price_title0'`);
      expect(model.price).assertEqual('price_title0');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.views=${model.views}, expected='views_title0'`);
      expect(model.views).assertEqual('views_title0');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.insurance=${model.insurance}, expected='ins_title0'`);
      expect(model.insurance).assertEqual('ins_title0');
      log('testCommodityModel0002 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITYMDL_0003
     * @tc.name      testCommodityModel0003
     * @tc.desc      Verify id is a number and uri stays a string for string input.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCommodityModel0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCommodityModel0003 begin');
      const model: CommodityDataModel = makeModel(2, 'title0');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof model.id=${typeof model.id}, expected='number'`);
      expect(typeof model.id).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof model.uri=${typeof model.uri}, expected='string'`);
      expect(typeof model.uri).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof model=${typeof model}, expected='object'`);
      expect(typeof model).assertEqual('object');
      log('testCommodityModel0003 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITYMDL_0004
     * @tc.name      testCommodityModel0004
     * @tc.desc      Verify title and price keep string types for string input.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCommodityModel0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCommodityModel0004 begin');
      const model: CommodityDataModel = makeModel(2, 'title0');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof model.title=${typeof model.title}, expected='string'`);
      expect(typeof model.title).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof model.price=${typeof model.price}, expected='string'`);
      expect(typeof model.price).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof model=${typeof model}, expected='object'`);
      expect(typeof model).assertEqual('object');
      log('testCommodityModel0004 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITYMDL_0005
     * @tc.name      testCommodityModel0005
     * @tc.desc      Verify a constructed instance is a CommodityDataModel.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCommodityModel0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCommodityModel0005 begin');
      const model: CommodityDataModel = makeModel(0, 'title0');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${model instanceof CommodityDataModel}`);
      expect(model instanceof CommodityDataModel).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof model=${typeof model}, expected='object'`);
      expect(typeof model).assertEqual('object');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue model !== null=${model !== null}`);
      expect(model !== null).assertTrue();
      log('testCommodityModel0005 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITYMDL_0006
     * @tc.name      testCommodityModel0006
     * @tc.desc      Verify toString formats as id plus two spaces plus title.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCommodityModel0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCommodityModel0006 begin');
      const model: CommodityDataModel = makeModel(0, 'title0');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.toString()=${model.toString()}, expected='0  title0'`);
      expect(model.toString()).assertEqual('0  title0');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof model.toString()=${typeof model.toString()}`);
      expect(typeof model.toString()).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof model=${typeof model}, expected='object'`);
      expect(typeof model).assertEqual('object');
      log('testCommodityModel0006 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITYMDL_0007
     * @tc.name      testCommodityModel0007
     * @tc.desc      Verify toString keeps the minus sign for a negative id.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCommodityModel0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCommodityModel0007 begin');
      const model: CommodityDataModel = makeModel(-7, 'titleX');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.toString()=${model.toString()}, expected='-7  titleX'`);
      expect(model.toString()).assertEqual('-7  titleX');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${model.toString().indexOf('-')}, expected=0`);
      expect(model.toString().indexOf('-')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof model=${typeof model}, expected='object'`);
      expect(typeof model).assertEqual('object');
      log('testCommodityModel0007 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITYMDL_0008
     * @tc.name      testCommodityModel0008
     * @tc.desc      Verify toString renders a NaN id as the NaN literal.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCommodityModel0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCommodityModel0008 begin');
      const model: CommodityDataModel = makeModel(NaN, 'titleX');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.toString()=${model.toString()}, expected='NaN  titleX'`);
      expect(model.toString()).assertEqual('NaN  titleX');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${model.toString().substring(0, 3)}, expected='NaN'`);
      expect(model.toString().substring(0, 3)).assertEqual('NaN');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof model=${typeof model}, expected='object'`);
      expect(typeof model).assertEqual('object');
      log('testCommodityModel0008 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITYMDL_0009
     * @tc.name      testCommodityModel0009
     * @tc.desc      Verify toString renders the max safe integer id exactly.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCommodityModel0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCommodityModel0009 begin');
      const model: CommodityDataModel = makeModel(Number.MAX_SAFE_INTEGER, 'titleX');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.toString()=${model.toString()}`);
      expect(model.toString()).assertEqual('9007199254740991  titleX');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.id=${model.id}, expected=9007199254740991`);
      expect(model.id).assertEqual(9007199254740991);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof model=${typeof model}, expected='object'`);
      expect(typeof model).assertEqual('object');
      log('testCommodityModel0009 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITYMDL_0010
     * @tc.name      testCommodityModel0010
     * @tc.desc      Verify toString renders a float id with its decimal part.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCommodityModel0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCommodityModel0010 begin');
      const model: CommodityDataModel = makeModel(1.5, 'titleX');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.toString()=${model.toString()}, expected='1.5  titleX'`);
      expect(model.toString()).assertEqual('1.5  titleX');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger actual=${model.toString().indexOf('.')}, expected=0`);
      expect(model.toString().indexOf('.')).assertLarger(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof model=${typeof model}, expected='object'`);
      expect(typeof model).assertEqual('object');
      log('testCommodityModel0010 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITYMDL_0011
     * @tc.name      testCommodityModel0011
     * @tc.desc      Verify toString with an empty title ends after the separator.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCommodityModel0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCommodityModel0011 begin');
      const model: CommodityDataModel = makeModel(5, '');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.toString()=${model.toString()}, expected='5  '`);
      expect(model.toString()).assertEqual('5  ');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.toString().length=${model.toString().length}`);
      expect(model.toString().length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof model=${typeof model}, expected='object'`);
      expect(typeof model).assertEqual('object');
      log('testCommodityModel0011 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITYMDL_0012
     * @tc.name      testCommodityModel0012
     * @tc.desc      Verify toString keeps unicode title characters intact.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCommodityModel0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCommodityModel0012 begin');
      const model: CommodityDataModel = makeModel(1, '手机Pro×2');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.toString()=${model.toString()}, expected='1  手机Pro×2'`);
      expect(model.toString()).assertEqual('1  手机Pro×2');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.title=${model.title}, expected='手机Pro×2'`);
      expect(model.title).assertEqual('手机Pro×2');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof model=${typeof model}, expected='object'`);
      expect(typeof model).assertEqual('object');
      log('testCommodityModel0012 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITYMDL_0013
     * @tc.name      testCommodityModel0013
     * @tc.desc      Verify toString keeps the full length for a long title.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCommodityModel0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCommodityModel0013 begin');
      const longTitle: string = 'a'.repeat(1000);
      const model: CommodityDataModel = makeModel(9, longTitle);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.toString().length=${model.toString().length}`);
      expect(model.toString().length).assertEqual(1003);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${model.toString().substring(0, 4)}, expected='9  a'`);
      expect(model.toString().substring(0, 4)).assertEqual('9  a');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof model=${typeof model}, expected='object'`);
      expect(typeof model).assertEqual('object');
      log('testCommodityModel0013 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITYMDL_0014
     * @tc.name      testCommodityModel0014
     * @tc.desc      Verify repeated toString calls return the same text.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCommodityModel0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCommodityModel0014 begin');
      const model: CommodityDataModel = makeModel(4, 'title0');
      const first: string = model.toString();
      const second: string = model.toString();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual first=${first}, expected=second`);
      expect(first).assertEqual(second);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual first=${first}, expected='4  title0'`);
      expect(first).assertEqual('4  title0');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof model=${typeof model}, expected='object'`);
      expect(typeof model).assertEqual('object');
      log('testCommodityModel0014 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITYMDL_0015
     * @tc.name      testCommodityModel0015
     * @tc.desc      Verify reassigning id changes the toString output.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCommodityModel0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCommodityModel0015 begin');
      const model: CommodityDataModel = makeModel(0, 'title0');
      model.id = 42;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.id=${model.id}, expected=42`);
      expect(model.id).assertEqual(42);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.toString()=${model.toString()}, expected='42  title0'`);
      expect(model.toString()).assertEqual('42  title0');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof model=${typeof model}, expected='object'`);
      expect(typeof model).assertEqual('object');
      log('testCommodityModel0015 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITYMDL_0016
     * @tc.name      testCommodityModel0016
     * @tc.desc      Verify reassigning title changes the toString output.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCommodityModel0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCommodityModel0016 begin');
      const model: CommodityDataModel = makeModel(3, 'title0');
      model.title = 'newTitle';
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.title=${model.title}, expected='newTitle'`);
      expect(model.title).assertEqual('newTitle');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.toString()=${model.toString()}, expected='3  newTitle'`);
      expect(model.toString()).assertEqual('3  newTitle');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof model=${typeof model}, expected='object'`);
      expect(typeof model).assertEqual('object');
      log('testCommodityModel0016 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITYMDL_0017
     * @tc.name      testCommodityModel0017
     * @tc.desc      Verify the uri field can be reassigned and read back.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCommodityModel0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCommodityModel0017 begin');
      const model: CommodityDataModel = makeModel(3, 'title0');
      model.uri = 'changed://uri';
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.uri=${model.uri}, expected='changed://uri'`);
      expect(model.uri).assertEqual('changed://uri');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof model.uri=${typeof model.uri}, expected='string'`);
      expect(typeof model.uri).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof model=${typeof model}, expected='object'`);
      expect(typeof model).assertEqual('object');
      log('testCommodityModel0017 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITYMDL_0018
     * @tc.name      testCommodityModel0018
     * @tc.desc      Verify the insurance field can be reassigned and read back.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCommodityModel0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCommodityModel0018 begin');
      const model: CommodityDataModel = makeModel(3, 'title0');
      model.insurance = '30天保价';
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.insurance=${model.insurance}, expected='30天保价'`);
      expect(model.insurance).assertEqual('30天保价');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof model.insurance=${typeof model.insurance}`);
      expect(typeof model.insurance).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof model=${typeof model}, expected='object'`);
      expect(typeof model).assertEqual('object');
      log('testCommodityModel0018 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITYMDL_0019
     * @tc.name      testCommodityModel0019
     * @tc.desc      Verify two instances do not share mutable field state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCommodityModel0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCommodityModel0019 begin');
      const modelA: CommodityDataModel = makeModel(1, 'titleA');
      const modelB: CommodityDataModel = makeModel(2, 'titleB');
      modelA.id = 99;
      modelA.title = 'mutated';
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual modelB.id=${modelB.id}, expected=2`);
      expect(modelB.id).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual modelB.title=${modelB.title}, expected='titleB'`);
      expect(modelB.title).assertEqual('titleB');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof modelB=${typeof modelB}, expected='object'`);
      expect(typeof modelB).assertEqual('object');
      log('testCommodityModel0019 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITYMDL_0020
     * @tc.name      testCommodityModel0020
     * @tc.desc      Verify toString stays independent between two instances.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCommodityModel0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCommodityModel0020 begin');
      const modelA: CommodityDataModel = makeModel(1, 'titleA');
      const modelB: CommodityDataModel = makeModel(2, 'titleB');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual modelA.toString()=${modelA.toString()}, expected='1  titleA'`);
      expect(modelA.toString()).assertEqual('1  titleA');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual modelB.toString()=${modelB.toString()}, expected='2  titleB'`);
      expect(modelB.toString()).assertEqual('2  titleB');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse actual=${modelA.toString() === modelB.toString()}`);
      expect(modelA.toString() === modelB.toString()).assertFalse();
      log('testCommodityModel0020 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITYMDL_0021
     * @tc.name      testCommodityModel0021
     * @tc.desc      Verify id 0 is stored without change as the lower bound.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCommodityModel0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCommodityModel0021 begin');
      const model: CommodityDataModel = makeModel(0, 'title0');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.id=${model.id}, expected=0`);
      expect(model.id).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${model.toString().startsWith('0  ')}`);
      expect(model.toString().startsWith('0  ')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof model=${typeof model}, expected='object'`);
      expect(typeof model).assertEqual('object');
      log('testCommodityModel0021 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITYMDL_0022
     * @tc.name      testCommodityModel0022
     * @tc.desc      Verify id -1 is stored without change.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCommodityModel0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCommodityModel0022 begin');
      const model: CommodityDataModel = makeModel(-1, 'title0');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.id=${model.id}, expected=-1`);
      expect(model.id).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.toString()=${model.toString()}, expected='-1  title0'`);
      expect(model.toString()).assertEqual('-1  title0');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof model=${typeof model}, expected='object'`);
      expect(typeof model).assertEqual('object');
      log('testCommodityModel0022 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITYMDL_0023
     * @tc.name      testCommodityModel0023
     * @tc.desc      Verify a large id keeps its full numeric value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCommodityModel0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCommodityModel0023 begin');
      const model: CommodityDataModel = makeModel(1000000, 'title0');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.id=${model.id}, expected=1000000`);
      expect(model.id).assertEqual(1000000);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${model.toString().startsWith('1000000  ')}`);
      expect(model.toString().startsWith('1000000  ')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof model=${typeof model}, expected='object'`);
      expect(typeof model).assertEqual('object');
      log('testCommodityModel0023 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITYMDL_0024
     * @tc.name      testCommodityModel0024
     * @tc.desc      Verify a NaN id still reports the number type.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCommodityModel0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCommodityModel0024 begin');
      const model: CommodityDataModel = makeModel(NaN, 'title0');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof model.id=${typeof model.id}, expected='number'`);
      expect(typeof model.id).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue Number.isNaN(model.id)=${Number.isNaN(model.id)}`);
      expect(Number.isNaN(model.id)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof model=${typeof model}, expected='object'`);
      expect(typeof model).assertEqual('object');
      log('testCommodityModel0024 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITYMDL_0025
     * @tc.name      testCommodityModel0025
     * @tc.desc      Verify empty string fields are preserved by the constructor.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCommodityModel0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCommodityModel0025 begin');
      const model: CommodityDataModel = new CommodityDataModel(6, '', '', '', '', '');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.uri=${model.uri}, expected=''`);
      expect(model.uri).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.title=${model.title}, expected=''`);
      expect(model.title).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.price=${model.price}, expected=''`);
      expect(model.price).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.views=${model.views}, expected=''`);
      expect(model.views).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.insurance=${model.insurance}, expected=''`);
      expect(model.insurance).assertEqual('');
      log('testCommodityModel0025 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITYMDL_0026
     * @tc.name      testCommodityModel0026
     * @tc.desc      Verify views and insurance keep string types after construction.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCommodityModel0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCommodityModel0026 begin');
      const model: CommodityDataModel = makeModel(7, 'title0');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof model.views=${typeof model.views}, expected='string'`);
      expect(typeof model.views).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof model.insurance=${typeof model.insurance}`);
      expect(typeof model.insurance).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof model=${typeof model}, expected='object'`);
      expect(typeof model).assertEqual('object');
      log('testCommodityModel0026 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITYMDL_0027
     * @tc.name      testCommodityModel0027
     * @tc.desc      Verify a currency style price string is preserved exactly.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCommodityModel0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCommodityModel0027 begin');
      const model: CommodityDataModel = makeModel(8, 'title0');
      model.price = '￥79.9';
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.price=${model.price}, expected='￥79.9'`);
      expect(model.price).assertEqual('￥79.9');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.price.indexOf('￥')=${model.price.indexOf('￥')}`);
      expect(model.price.indexOf('￥')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof model=${typeof model}, expected='object'`);
      expect(typeof model).assertEqual('object');
      log('testCommodityModel0027 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITYMDL_0028
     * @tc.name      testCommodityModel0028
     * @tc.desc      Verify a view count style string is preserved exactly.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCommodityModel0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCommodityModel0028 begin');
      const model: CommodityDataModel = makeModel(8, 'title0');
      model.views = '3.2W';
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.views=${model.views}, expected='3.2W'`);
      expect(model.views).assertEqual('3.2W');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof model.views=${typeof model.views}, expected='string'`);
      expect(typeof model.views).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof model=${typeof model}, expected='object'`);
      expect(typeof model).assertEqual('object');
      log('testCommodityModel0028 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITYMDL_0029
     * @tc.name      testCommodityModel0029
     * @tc.desc      Verify toString always returns a string value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCommodityModel0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCommodityModel0029 begin');
      const model: CommodityDataModel = makeModel(-3, 'title0');
      const text: string = model.toString();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof text=${typeof text}, expected='string'`);
      expect(typeof text).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger text.length=${text.length}, expected=0`);
      expect(text.length).assertLarger(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof model=${typeof model}, expected='object'`);
      expect(typeof model).assertEqual('object');
      log('testCommodityModel0029 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITYMDL_0030
     * @tc.name      testCommodityModel0030
     * @tc.desc      Verify toString starts with the id and the two-space separator.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCommodityModel0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCommodityModel0030 begin');
      const model: CommodityDataModel = makeModel(12, 'title0');
      const prefix: string = '12' + '  ';
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${model.toString().startsWith(prefix)}`);
      expect(model.toString().startsWith(prefix)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${model.toString().substring(0, 4)}, expected='12  '`);
      expect(model.toString().substring(0, 4)).assertEqual('12  ');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof model=${typeof model}, expected='object'`);
      expect(typeof model).assertEqual('object');
      log('testCommodityModel0030 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITYMDL_0031
     * @tc.name      testCommodityModel0031
     * @tc.desc      Verify all six fields can be reassigned sequentially.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCommodityModel0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCommodityModel0031 begin');
      const model: CommodityDataModel = makeModel(0, 'title0');
      model.id = 11;
      model.uri = 'u2';
      model.title = 't2';
      model.price = 'p2';
      model.views = 'v2';
      model.insurance = 'i2';
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.id=${model.id}, expected=11`);
      expect(model.id).assertEqual(11);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.uri=${model.uri}, expected='u2'`);
      expect(model.uri).assertEqual('u2');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.title=${model.title}, expected='t2'`);
      expect(model.title).assertEqual('t2');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.price=${model.price}, expected='p2'`);
      expect(model.price).assertEqual('p2');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.views=${model.views}, expected='v2'`);
      expect(model.views).assertEqual('v2');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.insurance=${model.insurance}, expected='i2'`);
      expect(model.insurance).assertEqual('i2');
      log('testCommodityModel0031 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITYMDL_0032
     * @tc.name      testCommodityModel0032
     * @tc.desc      Verify the last assignment to a field wins.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCommodityModel0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCommodityModel0032 begin');
      const model: CommodityDataModel = makeModel(0, 'title0');
      model.title = 'first';
      model.title = 'second';
      model.title = 'third';
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.title=${model.title}, expected='third'`);
      expect(model.title).assertEqual('third');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.toString()=${model.toString()}, expected='0  third'`);
      expect(model.toString()).assertEqual('0  third');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof model=${typeof model}, expected='object'`);
      expect(typeof model).assertEqual('object');
      log('testCommodityModel0032 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITYMDL_0033
     * @tc.name      testCommodityModel0033
     * @tc.desc      Verify the int32 max id is preserved as a number.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCommodityModel0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCommodityModel0033 begin');
      const model: CommodityDataModel = makeModel(2147483647, 'title0');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.id=${model.id}, expected=2147483647`);
      expect(model.id).assertEqual(2147483647);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${model.toString().startsWith('2147483647  ')}`);
      expect(model.toString().startsWith('2147483647  ')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof model=${typeof model}, expected='object'`);
      expect(typeof model).assertEqual('object');
      log('testCommodityModel0033 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITYMDL_0034
     * @tc.name      testCommodityModel0034
     * @tc.desc      Verify a single character title round-trips through toString.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCommodityModel0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCommodityModel0034 begin');
      const model: CommodityDataModel = makeModel(2, 'A');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.toString()=${model.toString()}, expected='2  A'`);
      expect(model.toString()).assertEqual('2  A');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.toString().length=${model.toString().length}`);
      expect(model.toString().length).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof model=${typeof model}, expected='object'`);
      expect(typeof model).assertEqual('object');
      log('testCommodityModel0034 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITYMDL_0035
     * @tc.name      testCommodityModel0035
     * @tc.desc      Verify titles containing spaces stay intact.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCommodityModel0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCommodityModel0035 begin');
      const model: CommodityDataModel = makeModel(2, 'two words');
      const titleText: string = model.title as string;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.toString()=${model.toString()}`);
      expect(model.toString()).assertEqual('2  two words');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger titleText.indexOf(' ')=${titleText.indexOf(' ')}`);
      expect(titleText.indexOf(' ')).assertLarger(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof model=${typeof model}, expected='object'`);
      expect(typeof model).assertEqual('object');
      log('testCommodityModel0035 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITYMDL_0036
     * @tc.name      testCommodityModel0036
     * @tc.desc      Verify a negative style price string is preserved.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCommodityModel0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCommodityModel0036 begin');
      const model: CommodityDataModel = makeModel(3, 'title0');
      model.price = '-1.00';
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.price=${model.price}, expected='-1.00'`);
      expect(model.price).assertEqual('-1.00');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.price.indexOf('-')=${model.price.indexOf('-')}`);
      expect(model.price.indexOf('-')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof model=${typeof model}, expected='object'`);
      expect(typeof model).assertEqual('object');
      log('testCommodityModel0036 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITYMDL_0037
     * @tc.name      testCommodityModel0037
     * @tc.desc      Verify an empty views string is preserved.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCommodityModel0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCommodityModel0037 begin');
      const model: CommodityDataModel = makeModel(4, 'title0');
      model.views = '';
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.views=${model.views}, expected=''`);
      expect(model.views).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.views.length=${model.views.length}, expected=0`);
      expect(model.views.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof model=${typeof model}, expected='object'`);
      expect(typeof model).assertEqual('object');
      log('testCommodityModel0037 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITYMDL_0038
     * @tc.name      testCommodityModel0038
     * @tc.desc      Verify a long insurance string is stored in full.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCommodityModel0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCommodityModel0038 begin');
      const longText: string = '保'.repeat(500);
      const model: CommodityDataModel = makeModel(5, 'title0');
      model.insurance = longText;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.insurance.length=${model.insurance.length}`);
      expect(model.insurance.length).assertEqual(500);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual model.insurance=${model.insurance}, expected=longText`);
      expect(model.insurance).assertEqual(longText);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof model=${typeof model}, expected='object'`);
      expect(typeof model).assertEqual('object');
      log('testCommodityModel0038 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITYMDL_0039
     * @tc.name      testCommodityModel0039
     * @tc.desc      Verify an instance exposes exactly the six business keys.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCommodityModel0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCommodityModel0039 begin');
      const model: CommodityDataModel = makeModel(1, 'title0');
      const keys: string[] = Object.keys(model);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual keys.length=${keys.length}, expected=6`);
      expect(keys.length).assertEqual(6);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue keys.indexOf('id') >= 0=${keys.indexOf('id') >= 0}`);
      expect(keys.indexOf('id') >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue keys.indexOf('title') >= 0=${keys.indexOf('title') >= 0}`);
      expect(keys.indexOf('title') >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${keys.indexOf('insurance') >= 0}`);
      expect(keys.indexOf('insurance') >= 0).assertTrue();
      log('testCommodityModel0039 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_COMMODITYMDL_0040
     * @tc.name      testCommodityModel0040
     * @tc.desc      Verify toString matches the manual id plus title concatenation.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCommodityModel0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCommodityModel0040 begin');
      const modelA: CommodityDataModel = makeModel(21, 'alpha');
      const modelB: CommodityDataModel = makeModel(0, 'beta');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual modelA.toString()=${modelA.toString()}`);
      expect(modelA.toString()).assertEqual(modelA.id.toString() + '  ' + modelA.title);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual modelB.toString()=${modelB.toString()}`);
      expect(modelB.toString()).assertEqual(modelB.id.toString() + '  ' + modelB.title);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof modelA=${typeof modelA}, expected='object'`);
      expect(typeof modelA).assertEqual('object');
      log('testCommodityModel0040 end');
    })
  })
}
