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
import { KeyboardDataSource } from '../../../main/ets/bridge/KeyboardAvoidBridge';

const DOMAIN: number = 0xF814;
const TAG: string = 'DataSourceModelCoreTest';

const DEFAULT_ITEMS: string[] = ['第一条数据', '第二条数据', '第三条数据', '第四条数据', '第五条数据', '第六条数据',
  '第七条数据', '第八条数据', '第九条数据', '第十条数据', '第十一条数据', '第十二条数据'];

function log(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

export default function dataSourceModelCoreTest(): void {
  describe('KeyboardAvoidDataSourceModelCoreTest', () => {
    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSMDL_0001
     * @tc.name      testDsModel0001
     * @tc.desc      Verify a data source built from the default twelve items reports twelve.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsModel0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsModel0001 begin');
      const source: KeyboardDataSource = new KeyboardDataSource(DEFAULT_ITEMS);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=12`);
      expect(source.totalCount()).assertEqual(12);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof source.totalCount()=${typeof source.totalCount()}`);
      expect(typeof source.totalCount()).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(0)=${source.getData(0)}, expected='第一条数据'`);
      expect(source.getData(0)).assertEqual('第一条数据');
      log('testDsModel0001 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSMDL_0002
     * @tc.name      testDsModel0002
     * @tc.desc      Verify getData(0) returns the first default item.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsModel0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsModel0002 begin');
      const source: KeyboardDataSource = new KeyboardDataSource(DEFAULT_ITEMS);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(0)=${source.getData(0)}, expected='第一条数据'`);
      expect(source.getData(0)).assertEqual('第一条数据');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof source.getData(0)=${typeof source.getData(0)}`);
      expect(typeof source.getData(0)).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=12`);
      expect(source.totalCount()).assertEqual(12);
      log('testDsModel0002 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSMDL_0003
     * @tc.name      testDsModel0003
     * @tc.desc      Verify getData(1) returns the second default item.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsModel0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsModel0003 begin');
      const source: KeyboardDataSource = new KeyboardDataSource(DEFAULT_ITEMS);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(1)=${source.getData(1)}, expected='第二条数据'`);
      expect(source.getData(1)).assertEqual('第二条数据');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=12`);
      expect(source.totalCount()).assertEqual(12);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof source.getData(1)=${typeof source.getData(1)}`);
      expect(typeof source.getData(1)).assertEqual('string');
      log('testDsModel0003 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSMDL_0004
     * @tc.name      testDsModel0004
     * @tc.desc      Verify getData(2) returns the third default item.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsModel0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsModel0004 begin');
      const source: KeyboardDataSource = new KeyboardDataSource(DEFAULT_ITEMS);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(2)=${source.getData(2)}, expected='第三条数据'`);
      expect(source.getData(2)).assertEqual('第三条数据');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=12`);
      expect(source.totalCount()).assertEqual(12);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof source.getData(2)=${typeof source.getData(2)}`);
      expect(typeof source.getData(2)).assertEqual('string');
      log('testDsModel0004 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSMDL_0005
     * @tc.name      testDsModel0005
     * @tc.desc      Verify getData(3) returns the fourth default item.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsModel0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsModel0005 begin');
      const source: KeyboardDataSource = new KeyboardDataSource(DEFAULT_ITEMS);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(3)=${source.getData(3)}, expected='第四条数据'`);
      expect(source.getData(3)).assertEqual('第四条数据');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=12`);
      expect(source.totalCount()).assertEqual(12);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof source.getData(3)=${typeof source.getData(3)}`);
      expect(typeof source.getData(3)).assertEqual('string');
      log('testDsModel0005 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSMDL_0006
     * @tc.name      testDsModel0006
     * @tc.desc      Verify getData(4) returns the fifth default item.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsModel0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsModel0006 begin');
      const source: KeyboardDataSource = new KeyboardDataSource(DEFAULT_ITEMS);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(4)=${source.getData(4)}, expected='第五条数据'`);
      expect(source.getData(4)).assertEqual('第五条数据');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=12`);
      expect(source.totalCount()).assertEqual(12);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof source.getData(4)=${typeof source.getData(4)}`);
      expect(typeof source.getData(4)).assertEqual('string');
      log('testDsModel0006 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSMDL_0007
     * @tc.name      testDsModel0007
     * @tc.desc      Verify getData(5) returns the sixth default item.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsModel0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsModel0007 begin');
      const source: KeyboardDataSource = new KeyboardDataSource(DEFAULT_ITEMS);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(5)=${source.getData(5)}, expected='第六条数据'`);
      expect(source.getData(5)).assertEqual('第六条数据');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=12`);
      expect(source.totalCount()).assertEqual(12);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof source.getData(5)=${typeof source.getData(5)}`);
      expect(typeof source.getData(5)).assertEqual('string');
      log('testDsModel0007 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSMDL_0008
     * @tc.name      testDsModel0008
     * @tc.desc      Verify getData(6) returns the seventh default item.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsModel0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsModel0008 begin');
      const source: KeyboardDataSource = new KeyboardDataSource(DEFAULT_ITEMS);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(6)=${source.getData(6)}, expected='第七条数据'`);
      expect(source.getData(6)).assertEqual('第七条数据');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=12`);
      expect(source.totalCount()).assertEqual(12);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof source.getData(6)=${typeof source.getData(6)}`);
      expect(typeof source.getData(6)).assertEqual('string');
      log('testDsModel0008 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSMDL_0009
     * @tc.name      testDsModel0009
     * @tc.desc      Verify getData(7) returns the eighth default item.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsModel0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsModel0009 begin');
      const source: KeyboardDataSource = new KeyboardDataSource(DEFAULT_ITEMS);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(7)=${source.getData(7)}, expected='第八条数据'`);
      expect(source.getData(7)).assertEqual('第八条数据');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=12`);
      expect(source.totalCount()).assertEqual(12);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof source.getData(7)=${typeof source.getData(7)}`);
      expect(typeof source.getData(7)).assertEqual('string');
      log('testDsModel0009 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSMDL_0010
     * @tc.name      testDsModel0010
     * @tc.desc      Verify getData(8) returns the ninth default item.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsModel0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsModel0010 begin');
      const source: KeyboardDataSource = new KeyboardDataSource(DEFAULT_ITEMS);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(8)=${source.getData(8)}, expected='第九条数据'`);
      expect(source.getData(8)).assertEqual('第九条数据');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=12`);
      expect(source.totalCount()).assertEqual(12);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof source.getData(8)=${typeof source.getData(8)}`);
      expect(typeof source.getData(8)).assertEqual('string');
      log('testDsModel0010 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSMDL_0011
     * @tc.name      testDsModel0011
     * @tc.desc      Verify getData(9) returns the tenth default item.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsModel0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsModel0011 begin');
      const source: KeyboardDataSource = new KeyboardDataSource(DEFAULT_ITEMS);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(9)=${source.getData(9)}, expected='第十条数据'`);
      expect(source.getData(9)).assertEqual('第十条数据');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=12`);
      expect(source.totalCount()).assertEqual(12);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof source.getData(9)=${typeof source.getData(9)}`);
      expect(typeof source.getData(9)).assertEqual('string');
      log('testDsModel0011 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSMDL_0012
     * @tc.name      testDsModel0012
     * @tc.desc      Verify getData(10) returns the eleventh default item.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsModel0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsModel0012 begin');
      const source: KeyboardDataSource = new KeyboardDataSource(DEFAULT_ITEMS);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(10)=${source.getData(10)}, expected='第十一条数据'`);
      expect(source.getData(10)).assertEqual('第十一条数据');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=12`);
      expect(source.totalCount()).assertEqual(12);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof source.getData(10)=${typeof source.getData(10)}`);
      expect(typeof source.getData(10)).assertEqual('string');
      log('testDsModel0012 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSMDL_0013
     * @tc.name      testDsModel0013
     * @tc.desc      Verify getData(11) returns the twelfth default item.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsModel0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsModel0013 begin');
      const source: KeyboardDataSource = new KeyboardDataSource(DEFAULT_ITEMS);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(11)=${source.getData(11)}, expected='第十二条数据'`);
      expect(source.getData(11)).assertEqual('第十二条数据');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof source.getData(11)=${typeof source.getData(11)}`);
      expect(typeof source.getData(11)).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=12`);
      expect(source.totalCount()).assertEqual(12);
      log('testDsModel0013 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSMDL_0014
     * @tc.name      testDsModel0014
     * @tc.desc      Verify getData(12) past the last item returns undefined.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsModel0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsModel0014 begin');
      const source: KeyboardDataSource = new KeyboardDataSource(DEFAULT_ITEMS);
      const value: string = source.getData(12);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertUndefined value`);
      expect(value).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=12`);
      expect(source.totalCount()).assertEqual(12);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(0)=${source.getData(0)}, expected='第一条数据'`);
      expect(source.getData(0)).assertEqual('第一条数据');
      log('testDsModel0014 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSMDL_0015
     * @tc.name      testDsModel0015
     * @tc.desc      Verify getData(13) beyond the end returns undefined.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsModel0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsModel0015 begin');
      const source: KeyboardDataSource = new KeyboardDataSource(DEFAULT_ITEMS);
      const value: string = source.getData(13);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertUndefined value`);
      expect(value).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=12`);
      expect(source.totalCount()).assertEqual(12);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(0)=${source.getData(0)}, expected='第一条数据'`);
      expect(source.getData(0)).assertEqual('第一条数据');
      log('testDsModel0015 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSMDL_0016
     * @tc.name      testDsModel0016
     * @tc.desc      Verify a far out-of-range getData(999) returns undefined.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsModel0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsModel0016 begin');
      const source: KeyboardDataSource = new KeyboardDataSource(DEFAULT_ITEMS);
      const value: string = source.getData(999);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertUndefined value`);
      expect(value).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=12`);
      expect(source.totalCount()).assertEqual(12);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(0)=${source.getData(0)}, expected='第一条数据'`);
      expect(source.getData(0)).assertEqual('第一条数据');
      log('testDsModel0016 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSMDL_0017
     * @tc.name      testDsModel0017
     * @tc.desc      Verify getData(-1) on a populated source returns undefined.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsModel0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsModel0017 begin');
      const source: KeyboardDataSource = new KeyboardDataSource(DEFAULT_ITEMS);
      const value: string = source.getData(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertUndefined value`);
      expect(value).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=12`);
      expect(source.totalCount()).assertEqual(12);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(0)=${source.getData(0)}, expected='第一条数据'`);
      expect(source.getData(0)).assertEqual('第一条数据');
      log('testDsModel0017 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSMDL_0018
     * @tc.name      testDsModel0018
     * @tc.desc      Verify a large negative index returns undefined.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsModel0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsModel0018 begin');
      const source: KeyboardDataSource = new KeyboardDataSource(DEFAULT_ITEMS);
      const value: string = source.getData(-100);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertUndefined value`);
      expect(value).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=12`);
      expect(source.totalCount()).assertEqual(12);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(0)=${source.getData(0)}, expected='第一条数据'`);
      expect(source.getData(0)).assertEqual('第一条数据');
      log('testDsModel0018 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSMDL_0019
     * @tc.name      testDsModel0019
     * @tc.desc      Verify getData keeps the string type for valid head and tail indexes.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsModel0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsModel0019 begin');
      const source: KeyboardDataSource = new KeyboardDataSource(DEFAULT_ITEMS);
      const head: string = source.getData(0);
      const tail: string = source.getData(11);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof head=${typeof head}, expected='string'`);
      expect(typeof head).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof tail=${typeof tail}, expected='string'`);
      expect(typeof tail).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual head=${head}, expected='第一条数据'`);
      expect(head).assertEqual('第一条数据');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual tail=${tail}, expected='第十二条数据'`);
      expect(tail).assertEqual('第十二条数据');
      log('testDsModel0019 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSMDL_0020
     * @tc.name      testDsModel0020
     * @tc.desc      Verify totalCount keeps the number type on a populated source.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsModel0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsModel0020 begin');
      const source: KeyboardDataSource = new KeyboardDataSource(DEFAULT_ITEMS);
      const count: number = source.totalCount();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof count=${typeof count}, expected='number'`);
      expect(typeof count).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual count=${count}, expected=12`);
      expect(count).assertEqual(12);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${source instanceof KeyboardDataSource}`);
      expect(source instanceof KeyboardDataSource).assertTrue();
      log('testDsModel0020 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSMDL_0021
     * @tc.name      testDsModel0021
     * @tc.desc      Verify a constructed instance is a KeyboardDataSource.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsModel0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsModel0021 begin');
      const source: KeyboardDataSource = new KeyboardDataSource(DEFAULT_ITEMS);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${source instanceof KeyboardDataSource}`);
      expect(source instanceof KeyboardDataSource).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue source !== undefined=${source !== undefined}`);
      expect(source !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=12`);
      expect(source.totalCount()).assertEqual(12);
      log('testDsModel0021 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSMDL_0022
     * @tc.name      testDsModel0022
     * @tc.desc      Verify an empty input produces a zero-length source.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsModel0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsModel0022 begin');
      const source: KeyboardDataSource = new KeyboardDataSource([]);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=0`);
      expect(source.totalCount()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof source.totalCount()=${typeof source.totalCount()}`);
      expect(typeof source.totalCount()).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertUndefined source.getData(0)`);
      expect(source.getData(0)).assertUndefined();
      log('testDsModel0022 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSMDL_0023
     * @tc.name      testDsModel0023
     * @tc.desc      Verify getData(0) on an empty source returns undefined.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsModel0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsModel0023 begin');
      const source: KeyboardDataSource = new KeyboardDataSource([]);
      const value: string = source.getData(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertUndefined value`);
      expect(value).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=0`);
      expect(source.totalCount()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertUndefined source.getData(3)`);
      expect(source.getData(3)).assertUndefined();
      log('testDsModel0023 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSMDL_0024
     * @tc.name      testDsModel0024
     * @tc.desc      Verify a single-item input reports one item with its value kept.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsModel0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsModel0024 begin');
      const source: KeyboardDataSource = new KeyboardDataSource(['只有一条']);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=1`);
      expect(source.totalCount()).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(0)=${source.getData(0)}, expected='只有一条'`);
      expect(source.getData(0)).assertEqual('只有一条');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertUndefined source.getData(1)`);
      expect(source.getData(1)).assertUndefined();
      log('testDsModel0024 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSMDL_0025
     * @tc.name      testDsModel0025
     * @tc.desc      Verify getData(1) on a single-item source returns undefined.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsModel0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsModel0025 begin');
      const source: KeyboardDataSource = new KeyboardDataSource(['只有一条']);
      const value: string = source.getData(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertUndefined value`);
      expect(value).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=1`);
      expect(source.totalCount()).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(0)=${source.getData(0)}, expected='只有一条'`);
      expect(source.getData(0)).assertEqual('只有一条');
      log('testDsModel0025 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSMDL_0026
     * @tc.name      testDsModel0026
     * @tc.desc      Verify pushing into the input array after construction keeps the source count.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsModel0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsModel0026 begin');
      const input: string[] = ['x0', 'x1', 'x2'];
      const source: KeyboardDataSource = new KeyboardDataSource(input);
      input.push('x3');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=3`);
      expect(source.totalCount()).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(2)=${source.getData(2)}, expected='x2'`);
      expect(source.getData(2)).assertEqual('x2');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(0)=${source.getData(0)}, expected='x0'`);
      expect(source.getData(0)).assertEqual('x0');
      log('testDsModel0026 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSMDL_0027
     * @tc.name      testDsModel0027
     * @tc.desc      Verify editing the input array after construction keeps stored values.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsModel0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsModel0027 begin');
      const input: string[] = ['x0', 'x1'];
      const source: KeyboardDataSource = new KeyboardDataSource(input);
      input[0] = 'changed';
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(0)=${source.getData(0)}, expected='x0'`);
      expect(source.getData(0)).assertEqual('x0');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(1)=${source.getData(1)}, expected='x1'`);
      expect(source.getData(1)).assertEqual('x1');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=2`);
      expect(source.totalCount()).assertEqual(2);
      log('testDsModel0027 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSMDL_0028
     * @tc.name      testDsModel0028
     * @tc.desc      Verify two instances built from the same input stay independent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsModel0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsModel0028 begin');
      const first: KeyboardDataSource = new KeyboardDataSource(DEFAULT_ITEMS);
      const second: KeyboardDataSource = new KeyboardDataSource(DEFAULT_ITEMS);
      first.modifyAllData(['only']);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual second.getData(0)=${second.getData(0)}, expected='第一条数据'`);
      expect(second.getData(0)).assertEqual('第一条数据');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual second.totalCount()=${second.totalCount()}, expected=12`);
      expect(second.totalCount()).assertEqual(12);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual first.totalCount()=${first.totalCount()}, expected=1`);
      expect(first.totalCount()).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual first.getData(0)=${first.getData(0)}, expected='only'`);
      expect(first.getData(0)).assertEqual('only');
      log('testDsModel0028 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSMDL_0029
     * @tc.name      testDsModel0029
     * @tc.desc      Verify the default twelve items keep their Chinese text verbatim.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsModel0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsModel0029 begin');
      const source: KeyboardDataSource = new KeyboardDataSource(DEFAULT_ITEMS);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(10)=${source.getData(10)}, expected='第十一条数据'`);
      expect(source.getData(10)).assertEqual('第十一条数据');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(11)=${source.getData(11)}, expected='第十二条数据'`);
      expect(source.getData(11)).assertEqual('第十二条数据');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof source.getData(10)=${typeof source.getData(10)}`);
      expect(typeof source.getData(10)).assertEqual('string');
      log('testDsModel0029 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSMDL_0030
     * @tc.name      testDsModel0030
     * @tc.desc      Verify every stored item matches the input order one by one.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsModel0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsModel0030 begin');
      const source: KeyboardDataSource = new KeyboardDataSource(DEFAULT_ITEMS);
      for (let i: number = 0; i < DEFAULT_ITEMS.length; i++) {
        hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(i)=${source.getData(i)}`);
        expect(source.getData(i)).assertEqual(DEFAULT_ITEMS[i]);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}`);
      expect(source.totalCount()).assertEqual(DEFAULT_ITEMS.length);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(0)=${source.getData(0)}, expected='第一条数据'`);
      expect(source.getData(0)).assertEqual('第一条数据');
      log('testDsModel0030 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSMDL_0031
     * @tc.name      testDsModel0031
     * @tc.desc      Verify a one-hundred-item input reports one hundred stored items.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsModel0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsModel0031 begin');
      const input: string[] = [];
      for (let i: number = 0; i < 100; i++) {
        input.push('批量条目' + i);
      }
      const source: KeyboardDataSource = new KeyboardDataSource(input);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=100`);
      expect(source.totalCount()).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof source.totalCount()=${typeof source.totalCount()}`);
      expect(typeof source.totalCount()).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(0)=${source.getData(0)}, expected='批量条目0'`);
      expect(source.getData(0)).assertEqual('批量条目0');
      log('testDsModel0031 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSMDL_0032
     * @tc.name      testDsModel0032
     * @tc.desc      Verify head and tail of a one-hundred-item source keep boundary values.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsModel0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsModel0032 begin');
      const input: string[] = [];
      for (let i: number = 0; i < 100; i++) {
        input.push('批量条目' + i);
      }
      const source: KeyboardDataSource = new KeyboardDataSource(input);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(0)=${source.getData(0)}, expected='批量条目0'`);
      expect(source.getData(0)).assertEqual('批量条目0');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(99)=${source.getData(99)}, expected='批量条目99'`);
      expect(source.getData(99)).assertEqual('批量条目99');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=100`);
      expect(source.totalCount()).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(50)=${source.getData(50)}, expected='批量条目50'`);
      expect(source.getData(50)).assertEqual('批量条目50');
      log('testDsModel0032 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSMDL_0033
     * @tc.name      testDsModel0033
     * @tc.desc      Verify two instances sharing one input array are still separate copies.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsModel0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsModel0033 begin');
      const input: string[] = ['m0', 'm1', 'm2'];
      const first: KeyboardDataSource = new KeyboardDataSource(input);
      const second: KeyboardDataSource = new KeyboardDataSource(input);
      first.modifyAllData(['only']);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual second.totalCount()=${second.totalCount()}, expected=3`);
      expect(second.totalCount()).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual second.getData(0)=${second.getData(0)}, expected='m0'`);
      expect(second.getData(0)).assertEqual('m0');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual first.totalCount()=${first.totalCount()}, expected=1`);
      expect(first.totalCount()).assertEqual(1);
      log('testDsModel0033 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSMDL_0034
     * @tc.name      testDsModel0034
     * @tc.desc      Verify a NaN index reads as an empty slot.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsModel0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsModel0034 begin');
      const source: KeyboardDataSource = new KeyboardDataSource(DEFAULT_ITEMS);
      const value: string = source.getData(Number.NaN);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertUndefined value`);
      expect(value).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=12`);
      expect(source.totalCount()).assertEqual(12);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(0)=${source.getData(0)}, expected='第一条数据'`);
      expect(source.getData(0)).assertEqual('第一条数据');
      log('testDsModel0034 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSMDL_0035
     * @tc.name      testDsModel0035
     * @tc.desc      Verify a fractional index reads as an empty slot.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsModel0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsModel0035 begin');
      const source: KeyboardDataSource = new KeyboardDataSource(DEFAULT_ITEMS);
      const value: string = source.getData(0.5);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertUndefined value`);
      expect(value).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=12`);
      expect(source.totalCount()).assertEqual(12);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(1)=${source.getData(1)}, expected='第二条数据'`);
      expect(source.getData(1)).assertEqual('第二条数据');
      log('testDsModel0035 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSMDL_0036
     * @tc.name      testDsModel0036
     * @tc.desc      Verify a fractional index past the last item reads as empty.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsModel0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsModel0036 begin');
      const source: KeyboardDataSource = new KeyboardDataSource(DEFAULT_ITEMS);
      const value: string = source.getData(11.5);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertUndefined value`);
      expect(value).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(11)=${source.getData(11)}, expected='第十二条数据'`);
      expect(source.getData(11)).assertEqual('第十二条数据');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=12`);
      expect(source.totalCount()).assertEqual(12);
      log('testDsModel0036 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSMDL_0037
     * @tc.name      testDsModel0037
     * @tc.desc      Verify a five-item input reports five stored items.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsModel0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsModel0037 begin');
      const source: KeyboardDataSource = new KeyboardDataSource(['a0', 'a1', 'a2', 'a3', 'a4']);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=5`);
      expect(source.totalCount()).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(4)=${source.getData(4)}, expected='a4'`);
      expect(source.getData(4)).assertEqual('a4');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(0)=${source.getData(0)}, expected='a0'`);
      expect(source.getData(0)).assertEqual('a0');
      log('testDsModel0037 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSMDL_0038
     * @tc.name      testDsModel0038
     * @tc.desc      Verify duplicate entries are stored one per position without merging.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsModel0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsModel0038 begin');
      const source: KeyboardDataSource = new KeyboardDataSource(['a', 'a', 'a']);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=3`);
      expect(source.totalCount()).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(0)=${source.getData(0)}, expected='a'`);
      expect(source.getData(0)).assertEqual('a');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(2)=${source.getData(2)}, expected='a'`);
      expect(source.getData(2)).assertEqual('a');
      log('testDsModel0038 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSMDL_0039
     * @tc.name      testDsModel0039
     * @tc.desc      Verify empty-string entries are stored as real items.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsModel0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsModel0039 begin');
      const source: KeyboardDataSource = new KeyboardDataSource(['', 'x', '']);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=3`);
      expect(source.totalCount()).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(0)=${source.getData(0)}, expected=''`);
      expect(source.getData(0)).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(2)=${source.getData(2)}, expected=''`);
      expect(source.getData(2)).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(1)=${source.getData(1)}, expected='x'`);
      expect(source.getData(1)).assertEqual('x');
      log('testDsModel0039 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSMDL_0040
     * @tc.name      testDsModel0040
     * @tc.desc      Verify the last readable slot lines up with totalCount minus one.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsModel0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsModel0040 begin');
      const source: KeyboardDataSource = new KeyboardDataSource(DEFAULT_ITEMS);
      const lastIndex: number = source.totalCount() - 1;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual lastIndex=${lastIndex}, expected=11`);
      expect(lastIndex).assertEqual(11);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(lastIndex)=${source.getData(lastIndex)}`);
      expect(source.getData(lastIndex)).assertEqual('第十二条数据');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=12`);
      expect(source.totalCount()).assertEqual(12);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${typeof source.getData(lastIndex)}`);
      expect(typeof source.getData(lastIndex)).assertEqual('string');
      log('testDsModel0040 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSMDL_0041
     * @tc.name      testDsModel0041
     * @tc.desc      Verify middle positions of the default data stay aligned with the input.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsModel0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsModel0041 begin');
      const source: KeyboardDataSource = new KeyboardDataSource(DEFAULT_ITEMS);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(5)=${source.getData(5)}`);
      expect(source.getData(5)).assertEqual(DEFAULT_ITEMS[5]);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(6)=${source.getData(6)}`);
      expect(source.getData(6)).assertEqual(DEFAULT_ITEMS[6]);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${source.getData(5) !== source.getData(6)}`);
      expect(source.getData(5) !== source.getData(6)).assertTrue();
      log('testDsModel0041 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSMDL_0042
     * @tc.name      testDsModel0042
     * @tc.desc      Verify the twelve default items contain no duplicates.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsModel0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsModel0042 begin');
      const source: KeyboardDataSource = new KeyboardDataSource(DEFAULT_ITEMS);
      const seen: string[] = [];
      for (let i: number = 0; i < source.totalCount(); i++) {
        const item: string = source.getData(i);
        seen.push(item);
      }
      const unique: Set<string> = new Set<string>(seen);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual seen.length=${seen.length}, expected=12`);
      expect(seen.length).assertEqual(12);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual unique.size=${unique.size}, expected=12`);
      expect(unique.size).assertEqual(12);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(0)=${source.getData(0)}, expected='第一条数据'`);
      expect(source.getData(0)).assertEqual('第一条数据');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(11)=${source.getData(11)}, expected='第十二条数据'`);
      expect(source.getData(11)).assertEqual('第十二条数据');
      log('testDsModel0042 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSMDL_0043
     * @tc.name      testDsModel0043
     * @tc.desc      Verify constructing from a copied array matches direct construction.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsModel0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsModel0043 begin');
      const input: string[] = DEFAULT_ITEMS.slice();
      const direct: KeyboardDataSource = new KeyboardDataSource(DEFAULT_ITEMS);
      const copied: KeyboardDataSource = new KeyboardDataSource(input);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual direct.getData(0)=${direct.getData(0)}`);
      expect(direct.getData(0)).assertEqual(copied.getData(0));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual direct.getData(6)=${direct.getData(6)}`);
      expect(direct.getData(6)).assertEqual(copied.getData(6));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual direct.totalCount()=${direct.totalCount()}`);
      expect(direct.totalCount()).assertEqual(copied.totalCount());
      log('testDsModel0043 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSMDL_0044
     * @tc.name      testDsModel0044
     * @tc.desc      Verify reassigning the input variable keeps the source untouched.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsModel0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsModel0044 begin');
      let input: string[] = ['n0', 'n1'];
      const source: KeyboardDataSource = new KeyboardDataSource(input);
      input = ['other'];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=2`);
      expect(source.totalCount()).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(0)=${source.getData(0)}, expected='n0'`);
      expect(source.getData(0)).assertEqual('n0');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(1)=${source.getData(1)}, expected='n1'`);
      expect(source.getData(1)).assertEqual('n1');
      log('testDsModel0044 end');
    })
  })
}
