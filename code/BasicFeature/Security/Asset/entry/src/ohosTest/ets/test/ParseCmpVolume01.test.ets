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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { compareArray } from '../../../main/ets/model/AssetModel';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[Sample_Asset]';

export default function parseCmpVolume01() {
  describe('ParseCmpVolume01Test', () => {

    /**
     * @tc.name   testParseCmp010001
     * @tc.number SUB_ASSET_PARSECMP_0001
     * @tc.desc   同值数组比较相等，同长不同值数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp010001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010001 begin');
      const same: boolean = compareArray(new Uint8Array([1, 2, 3]), new Uint8Array([1, 2, 3]));
      const diff: boolean = compareArray(new Uint8Array([1, 2, 3]), new Uint8Array([1, 2, 4]));
      expect(same).assertTrue();
      expect(diff).assertFalse();
      const empty: boolean = compareArray(new Uint8Array([]), new Uint8Array([]));
      expect(empty).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010001 end');
    })

    /**
     * @tc.name   testParseCmp010002
     * @tc.number SUB_ASSET_PARSECMP_0002
     * @tc.desc   合法值：同值同长数组比较相等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp010002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010002 begin');
      const result: boolean = compareArray(new Uint8Array([1,7,42]), new Uint8Array([1,7,42]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010002 end');
    })

    /**
     * @tc.name   testParseCmp010003
     * @tc.number SUB_ASSET_PARSECMP_0003
     * @tc.desc   合法值：同值同长数组比较相等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp010003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010003 begin');
      const result: boolean = compareArray(new Uint8Array([2,7,42]), new Uint8Array([2,7,42]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010003 end');
    })

    /**
     * @tc.name   testParseCmp010004
     * @tc.number SUB_ASSET_PARSECMP_0004
     * @tc.desc   合法值：同值同长数组比较相等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp010004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010004 begin');
      const result: boolean = compareArray(new Uint8Array([3,7,42]), new Uint8Array([3,7,42]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010004 end');
    })

    /**
     * @tc.name   testParseCmp010005
     * @tc.number SUB_ASSET_PARSECMP_0005
     * @tc.desc   合法值：同值同长数组比较相等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp010005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010005 begin');
      const result: boolean = compareArray(new Uint8Array([4,7,42]), new Uint8Array([4,7,42]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010005 end');
    })

    /**
     * @tc.name   testParseCmp010006
     * @tc.number SUB_ASSET_PARSECMP_0006
     * @tc.desc   合法值：同值同长数组比较相等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp010006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010006 begin');
      const result: boolean = compareArray(new Uint8Array([5,7,42]), new Uint8Array([5,7,42]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010006 end');
    })

    /**
     * @tc.name   testParseCmp010007
     * @tc.number SUB_ASSET_PARSECMP_0007
     * @tc.desc   合法值：同值同长数组比较相等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp010007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010007 begin');
      const result: boolean = compareArray(new Uint8Array([6,7,42]), new Uint8Array([6,7,42]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010007 end');
    })

    /**
     * @tc.name   testParseCmp010008
     * @tc.number SUB_ASSET_PARSECMP_0008
     * @tc.desc   合法值：同值同长数组比较相等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp010008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010008 begin');
      const result: boolean = compareArray(new Uint8Array([7,7,42]), new Uint8Array([7,7,42]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010008 end');
    })

    /**
     * @tc.name   testParseCmp010009
     * @tc.number SUB_ASSET_PARSECMP_0009
     * @tc.desc   合法值：同值同长数组比较相等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp010009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010009 begin');
      const result: boolean = compareArray(new Uint8Array([8,7,42]), new Uint8Array([8,7,42]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010009 end');
    })

    /**
     * @tc.name   testParseCmp010010
     * @tc.number SUB_ASSET_PARSECMP_0010
     * @tc.desc   合法值：同值同长数组比较相等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp010010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010010 begin');
      const result: boolean = compareArray(new Uint8Array([9,7,42]), new Uint8Array([9,7,42]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010010 end');
    })

    /**
     * @tc.name   testParseCmp010011
     * @tc.number SUB_ASSET_PARSECMP_0011
     * @tc.desc   合法值：同值同长数组比较相等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp010011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010011 begin');
      const result: boolean = compareArray(new Uint8Array([10,7,42]), new Uint8Array([10,7,42]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010011 end');
    })

    /**
     * @tc.name   testParseCmp010012
     * @tc.number SUB_ASSET_PARSECMP_0012
     * @tc.desc   合法值：同值同长数组比较相等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp010012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010012 begin');
      const result: boolean = compareArray(new Uint8Array([11,7,42]), new Uint8Array([11,7,42]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010012 end');
    })

    /**
     * @tc.name   testParseCmp010013
     * @tc.number SUB_ASSET_PARSECMP_0013
     * @tc.desc   合法值：同值同长数组比较相等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp010013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010013 begin');
      const result: boolean = compareArray(new Uint8Array([12,7,42]), new Uint8Array([12,7,42]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010013 end');
    })

    /**
     * @tc.name   testParseCmp010014
     * @tc.number SUB_ASSET_PARSECMP_0014
     * @tc.desc   合法值：同值同长数组比较相等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp010014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010014 begin');
      const result: boolean = compareArray(new Uint8Array([13,7,42]), new Uint8Array([13,7,42]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010014 end');
    })

    /**
     * @tc.name   testParseCmp010015
     * @tc.number SUB_ASSET_PARSECMP_0015
     * @tc.desc   合法值：同值同长数组比较相等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp010015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010015 begin');
      const result: boolean = compareArray(new Uint8Array([14,7,42]), new Uint8Array([14,7,42]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010015 end');
    })

    /**
     * @tc.name   testParseCmp010016
     * @tc.number SUB_ASSET_PARSECMP_0016
     * @tc.desc   合法值：同值同长数组比较相等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp010016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010016 begin');
      const result: boolean = compareArray(new Uint8Array([15,7,42]), new Uint8Array([15,7,42]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010016 end');
    })

    /**
     * @tc.name   testParseCmp010017
     * @tc.number SUB_ASSET_PARSECMP_0017
     * @tc.desc   合法值：同值同长数组比较相等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp010017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010017 begin');
      const result: boolean = compareArray(new Uint8Array([16,7,42]), new Uint8Array([16,7,42]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010017 end');
    })

    /**
     * @tc.name   testParseCmp010018
     * @tc.number SUB_ASSET_PARSECMP_0018
     * @tc.desc   合法值：同值同长数组比较相等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp010018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010018 begin');
      const result: boolean = compareArray(new Uint8Array([17,7,42]), new Uint8Array([17,7,42]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010018 end');
    })

    /**
     * @tc.name   testParseCmp010019
     * @tc.number SUB_ASSET_PARSECMP_0019
     * @tc.desc   合法值：同值同长数组比较相等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp010019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010019 begin');
      const result: boolean = compareArray(new Uint8Array([18,7,42]), new Uint8Array([18,7,42]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010019 end');
    })

    /**
     * @tc.name   testParseCmp010020
     * @tc.number SUB_ASSET_PARSECMP_0020
     * @tc.desc   合法值：同值同长数组比较相等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp010020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010020 begin');
      const result: boolean = compareArray(new Uint8Array([19,7,42]), new Uint8Array([19,7,42]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010020 end');
    })

    /**
     * @tc.name   testParseCmp010021
     * @tc.number SUB_ASSET_PARSECMP_0021
     * @tc.desc   合法值：同值同长数组比较相等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp010021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010021 begin');
      const result: boolean = compareArray(new Uint8Array([20,7,42]), new Uint8Array([20,7,42]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010021 end');
    })

    /**
     * @tc.name   testParseCmp010022
     * @tc.number SUB_ASSET_PARSECMP_0022
     * @tc.desc   合法值：同值同长数组比较相等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp010022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010022 begin');
      const result: boolean = compareArray(new Uint8Array([21,7,42]), new Uint8Array([21,7,42]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010022 end');
    })

    /**
     * @tc.name   testParseCmp010023
     * @tc.number SUB_ASSET_PARSECMP_0023
     * @tc.desc   合法值：同值同长数组比较相等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp010023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010023 begin');
      const result: boolean = compareArray(new Uint8Array([22,7,42]), new Uint8Array([22,7,42]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010023 end');
    })

    /**
     * @tc.name   testParseCmp010024
     * @tc.number SUB_ASSET_PARSECMP_0024
     * @tc.desc   合法值：同值同长数组比较相等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp010024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010024 begin');
      const result: boolean = compareArray(new Uint8Array([23,7,42]), new Uint8Array([23,7,42]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010024 end');
    })

    /**
     * @tc.name   testParseCmp010025
     * @tc.number SUB_ASSET_PARSECMP_0025
     * @tc.desc   合法值：同值同长数组比较相等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp010025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010025 begin');
      const result: boolean = compareArray(new Uint8Array([24,7,42]), new Uint8Array([24,7,42]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010025 end');
    })

    /**
     * @tc.name   testParseCmp010026
     * @tc.number SUB_ASSET_PARSECMP_0026
     * @tc.desc   合法值：同值同长数组比较相等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp010026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010026 begin');
      const result: boolean = compareArray(new Uint8Array([25,7,42]), new Uint8Array([25,7,42]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010026 end');
    })

    /**
     * @tc.name   testParseCmp010027
     * @tc.number SUB_ASSET_PARSECMP_0027
     * @tc.desc   合法值：同值同长数组比较相等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp010027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010027 begin');
      const result: boolean = compareArray(new Uint8Array([26,7,42]), new Uint8Array([26,7,42]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010027 end');
    })

    /**
     * @tc.name   testParseCmp010028
     * @tc.number SUB_ASSET_PARSECMP_0028
     * @tc.desc   合法值：同值同长数组比较相等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp010028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010028 begin');
      const result: boolean = compareArray(new Uint8Array([27,7,42]), new Uint8Array([27,7,42]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010028 end');
    })

    /**
     * @tc.name   testParseCmp010029
     * @tc.number SUB_ASSET_PARSECMP_0029
     * @tc.desc   合法值：同值同长数组比较相等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp010029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010029 begin');
      const result: boolean = compareArray(new Uint8Array([28,7,42]), new Uint8Array([28,7,42]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010029 end');
    })

    /**
     * @tc.name   testParseCmp010030
     * @tc.number SUB_ASSET_PARSECMP_0030
     * @tc.desc   合法值：同值同长数组比较相等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp010030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010030 begin');
      const result: boolean = compareArray(new Uint8Array([29,7,42]), new Uint8Array([29,7,42]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010030 end');
    })

    /**
     * @tc.name   testParseCmp010031
     * @tc.number SUB_ASSET_PARSECMP_0031
     * @tc.desc   合法值：同值同长数组比较相等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp010031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010031 begin');
      const result: boolean = compareArray(new Uint8Array([30,7,42]), new Uint8Array([30,7,42]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010031 end');
    })

    /**
     * @tc.name   testParseCmp010032
     * @tc.number SUB_ASSET_PARSECMP_0032
     * @tc.desc   合法值：同值同长数组比较相等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp010032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010032 begin');
      const result: boolean = compareArray(new Uint8Array([31,7,42]), new Uint8Array([31,7,42]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010032 end');
    })

    /**
     * @tc.name   testParseCmp010033
     * @tc.number SUB_ASSET_PARSECMP_0033
     * @tc.desc   合法值：同值同长数组比较相等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp010033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010033 begin');
      const result: boolean = compareArray(new Uint8Array([32,7,42]), new Uint8Array([32,7,42]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010033 end');
    })

    /**
     * @tc.name   testParseCmp010034
     * @tc.number SUB_ASSET_PARSECMP_0034
     * @tc.desc   合法值：同值同长数组比较相等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp010034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010034 begin');
      const result: boolean = compareArray(new Uint8Array([33,7,42]), new Uint8Array([33,7,42]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010034 end');
    })

    /**
     * @tc.name   testParseCmp010035
     * @tc.number SUB_ASSET_PARSECMP_0035
     * @tc.desc   合法值：同值同长数组比较相等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp010035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010035 begin');
      const result: boolean = compareArray(new Uint8Array([34,7,42]), new Uint8Array([34,7,42]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010035 end');
    })

    /**
     * @tc.name   testParseCmp010036
     * @tc.number SUB_ASSET_PARSECMP_0036
     * @tc.desc   合法值：同值同长数组比较相等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp010036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010036 begin');
      const result: boolean = compareArray(new Uint8Array([35,7,42]), new Uint8Array([35,7,42]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010036 end');
    })

    /**
     * @tc.name   testParseCmp010037
     * @tc.number SUB_ASSET_PARSECMP_0037
     * @tc.desc   合法值：同值同长数组比较相等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp010037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010037 begin');
      const result: boolean = compareArray(new Uint8Array([36,7,42]), new Uint8Array([36,7,42]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010037 end');
    })

    /**
     * @tc.name   testParseCmp010038
     * @tc.number SUB_ASSET_PARSECMP_0038
     * @tc.desc   合法值：同值同长数组比较相等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp010038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010038 begin');
      const result: boolean = compareArray(new Uint8Array([37,7,42]), new Uint8Array([37,7,42]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010038 end');
    })

    /**
     * @tc.name   testParseCmp010039
     * @tc.number SUB_ASSET_PARSECMP_0039
     * @tc.desc   合法值：同值同长数组比较相等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp010039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010039 begin');
      const result: boolean = compareArray(new Uint8Array([38,7,42]), new Uint8Array([38,7,42]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010039 end');
    })

    /**
     * @tc.name   testParseCmp010040
     * @tc.number SUB_ASSET_PARSECMP_0040
     * @tc.desc   合法值：同值同长数组比较相等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp010040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010040 begin');
      const result: boolean = compareArray(new Uint8Array([39,7,42]), new Uint8Array([39,7,42]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010040 end');
    })

    /**
     * @tc.name   testParseCmp010041
     * @tc.number SUB_ASSET_PARSECMP_0041
     * @tc.desc   非法值：同长不同值数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp010041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010041 begin');
      const result: boolean = compareArray(new Uint8Array([0,7,42]), new Uint8Array([0,8,42]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010041 end');
    })

    /**
     * @tc.name   testParseCmp010042
     * @tc.number SUB_ASSET_PARSECMP_0042
     * @tc.desc   非法值：同长不同值数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp010042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010042 begin');
      const result: boolean = compareArray(new Uint8Array([1,7,42]), new Uint8Array([1,8,42]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010042 end');
    })

    /**
     * @tc.name   testParseCmp010043
     * @tc.number SUB_ASSET_PARSECMP_0043
     * @tc.desc   非法值：同长不同值数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp010043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010043 begin');
      const result: boolean = compareArray(new Uint8Array([2,7,42]), new Uint8Array([2,8,42]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010043 end');
    })

    /**
     * @tc.name   testParseCmp010044
     * @tc.number SUB_ASSET_PARSECMP_0044
     * @tc.desc   非法值：同长不同值数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp010044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010044 begin');
      const result: boolean = compareArray(new Uint8Array([3,7,42]), new Uint8Array([3,8,42]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010044 end');
    })

    /**
     * @tc.name   testParseCmp010045
     * @tc.number SUB_ASSET_PARSECMP_0045
     * @tc.desc   非法值：同长不同值数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp010045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010045 begin');
      const result: boolean = compareArray(new Uint8Array([4,7,42]), new Uint8Array([4,8,42]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010045 end');
    })

    /**
     * @tc.name   testParseCmp010046
     * @tc.number SUB_ASSET_PARSECMP_0046
     * @tc.desc   非法值：同长不同值数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp010046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010046 begin');
      const result: boolean = compareArray(new Uint8Array([5,7,42]), new Uint8Array([5,8,42]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010046 end');
    })

    /**
     * @tc.name   testParseCmp010047
     * @tc.number SUB_ASSET_PARSECMP_0047
     * @tc.desc   非法值：同长不同值数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp010047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010047 begin');
      const result: boolean = compareArray(new Uint8Array([6,7,42]), new Uint8Array([6,8,42]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010047 end');
    })

    /**
     * @tc.name   testParseCmp010048
     * @tc.number SUB_ASSET_PARSECMP_0048
     * @tc.desc   非法值：同长不同值数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp010048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010048 begin');
      const result: boolean = compareArray(new Uint8Array([7,7,42]), new Uint8Array([7,8,42]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010048 end');
    })

    /**
     * @tc.name   testParseCmp010049
     * @tc.number SUB_ASSET_PARSECMP_0049
     * @tc.desc   非法值：同长不同值数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp010049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010049 begin');
      const result: boolean = compareArray(new Uint8Array([8,7,42]), new Uint8Array([8,8,42]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010049 end');
    })

    /**
     * @tc.name   testParseCmp010050
     * @tc.number SUB_ASSET_PARSECMP_0050
     * @tc.desc   非法值：同长不同值数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp010050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010050 begin');
      const result: boolean = compareArray(new Uint8Array([9,7,42]), new Uint8Array([9,8,42]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010050 end');
    })

    /**
     * @tc.name   testParseCmp010051
     * @tc.number SUB_ASSET_PARSECMP_0051
     * @tc.desc   非法值：同长不同值数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp010051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010051 begin');
      const result: boolean = compareArray(new Uint8Array([10,7,42]), new Uint8Array([10,8,42]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010051 end');
    })

    /**
     * @tc.name   testParseCmp010052
     * @tc.number SUB_ASSET_PARSECMP_0052
     * @tc.desc   非法值：同长不同值数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp010052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010052 begin');
      const result: boolean = compareArray(new Uint8Array([11,7,42]), new Uint8Array([11,8,42]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010052 end');
    })

    /**
     * @tc.name   testParseCmp010053
     * @tc.number SUB_ASSET_PARSECMP_0053
     * @tc.desc   非法值：同长不同值数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp010053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010053 begin');
      const result: boolean = compareArray(new Uint8Array([12,7,42]), new Uint8Array([12,8,42]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010053 end');
    })

    /**
     * @tc.name   testParseCmp010054
     * @tc.number SUB_ASSET_PARSECMP_0054
     * @tc.desc   非法值：同长不同值数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp010054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010054 begin');
      const result: boolean = compareArray(new Uint8Array([13,7,42]), new Uint8Array([13,8,42]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010054 end');
    })

    /**
     * @tc.name   testParseCmp010055
     * @tc.number SUB_ASSET_PARSECMP_0055
     * @tc.desc   非法值：同长不同值数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp010055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010055 begin');
      const result: boolean = compareArray(new Uint8Array([14,7,42]), new Uint8Array([14,8,42]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010055 end');
    })

    /**
     * @tc.name   testParseCmp010056
     * @tc.number SUB_ASSET_PARSECMP_0056
     * @tc.desc   非法值：同长不同值数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp010056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010056 begin');
      const result: boolean = compareArray(new Uint8Array([15,7,42]), new Uint8Array([15,8,42]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010056 end');
    })

    /**
     * @tc.name   testParseCmp010057
     * @tc.number SUB_ASSET_PARSECMP_0057
     * @tc.desc   非法值：同长不同值数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp010057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010057 begin');
      const result: boolean = compareArray(new Uint8Array([16,7,42]), new Uint8Array([16,8,42]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010057 end');
    })

    /**
     * @tc.name   testParseCmp010058
     * @tc.number SUB_ASSET_PARSECMP_0058
     * @tc.desc   非法值：同长不同值数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp010058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010058 begin');
      const result: boolean = compareArray(new Uint8Array([17,7,42]), new Uint8Array([17,8,42]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010058 end');
    })

    /**
     * @tc.name   testParseCmp010059
     * @tc.number SUB_ASSET_PARSECMP_0059
     * @tc.desc   非法值：同长不同值数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp010059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010059 begin');
      const result: boolean = compareArray(new Uint8Array([18,7,42]), new Uint8Array([18,8,42]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010059 end');
    })

    /**
     * @tc.name   testParseCmp010060
     * @tc.number SUB_ASSET_PARSECMP_0060
     * @tc.desc   非法值：同长不同值数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp010060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010060 begin');
      const result: boolean = compareArray(new Uint8Array([19,7,42]), new Uint8Array([19,8,42]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010060 end');
    })

    /**
     * @tc.name   testParseCmp010061
     * @tc.number SUB_ASSET_PARSECMP_0061
     * @tc.desc   非法值：同长不同值数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp010061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010061 begin');
      const result: boolean = compareArray(new Uint8Array([20,7,42]), new Uint8Array([20,8,42]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010061 end');
    })

    /**
     * @tc.name   testParseCmp010062
     * @tc.number SUB_ASSET_PARSECMP_0062
     * @tc.desc   非法值：同长不同值数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp010062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010062 begin');
      const result: boolean = compareArray(new Uint8Array([21,7,42]), new Uint8Array([21,8,42]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010062 end');
    })

    /**
     * @tc.name   testParseCmp010063
     * @tc.number SUB_ASSET_PARSECMP_0063
     * @tc.desc   非法值：同长不同值数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp010063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010063 begin');
      const result: boolean = compareArray(new Uint8Array([22,7,42]), new Uint8Array([22,8,42]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010063 end');
    })

    /**
     * @tc.name   testParseCmp010064
     * @tc.number SUB_ASSET_PARSECMP_0064
     * @tc.desc   非法值：同长不同值数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp010064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010064 begin');
      const result: boolean = compareArray(new Uint8Array([23,7,42]), new Uint8Array([23,8,42]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010064 end');
    })

    /**
     * @tc.name   testParseCmp010065
     * @tc.number SUB_ASSET_PARSECMP_0065
     * @tc.desc   非法值：同长不同值数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp010065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010065 begin');
      const result: boolean = compareArray(new Uint8Array([24,7,42]), new Uint8Array([24,8,42]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010065 end');
    })

    /**
     * @tc.name   testParseCmp010066
     * @tc.number SUB_ASSET_PARSECMP_0066
     * @tc.desc   非法值：同长不同值数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp010066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010066 begin');
      const result: boolean = compareArray(new Uint8Array([25,7,42]), new Uint8Array([25,8,42]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010066 end');
    })

    /**
     * @tc.name   testParseCmp010067
     * @tc.number SUB_ASSET_PARSECMP_0067
     * @tc.desc   非法值：同长不同值数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp010067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010067 begin');
      const result: boolean = compareArray(new Uint8Array([26,7,42]), new Uint8Array([26,8,42]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010067 end');
    })

    /**
     * @tc.name   testParseCmp010068
     * @tc.number SUB_ASSET_PARSECMP_0068
     * @tc.desc   非法值：同长不同值数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp010068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010068 begin');
      const result: boolean = compareArray(new Uint8Array([27,7,42]), new Uint8Array([27,8,42]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010068 end');
    })

    /**
     * @tc.name   testParseCmp010069
     * @tc.number SUB_ASSET_PARSECMP_0069
     * @tc.desc   非法值：同长不同值数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp010069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010069 begin');
      const result: boolean = compareArray(new Uint8Array([28,7,42]), new Uint8Array([28,8,42]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010069 end');
    })

    /**
     * @tc.name   testParseCmp010070
     * @tc.number SUB_ASSET_PARSECMP_0070
     * @tc.desc   非法值：同长不同值数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp010070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010070 begin');
      const result: boolean = compareArray(new Uint8Array([29,7,42]), new Uint8Array([29,8,42]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010070 end');
    })

    /**
     * @tc.name   testParseCmp010071
     * @tc.number SUB_ASSET_PARSECMP_0071
     * @tc.desc   非法值：同长不同值数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp010071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010071 begin');
      const result: boolean = compareArray(new Uint8Array([30,7,42]), new Uint8Array([30,8,42]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010071 end');
    })

    /**
     * @tc.name   testParseCmp010072
     * @tc.number SUB_ASSET_PARSECMP_0072
     * @tc.desc   非法值：同长不同值数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp010072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010072 begin');
      const result: boolean = compareArray(new Uint8Array([31,7,42]), new Uint8Array([31,8,42]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010072 end');
    })

    /**
     * @tc.name   testParseCmp010073
     * @tc.number SUB_ASSET_PARSECMP_0073
     * @tc.desc   非法值：同长不同值数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp010073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010073 begin');
      const result: boolean = compareArray(new Uint8Array([32,7,42]), new Uint8Array([32,8,42]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010073 end');
    })

    /**
     * @tc.name   testParseCmp010074
     * @tc.number SUB_ASSET_PARSECMP_0074
     * @tc.desc   非法值：同长不同值数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp010074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010074 begin');
      const result: boolean = compareArray(new Uint8Array([33,7,42]), new Uint8Array([33,8,42]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010074 end');
    })

    /**
     * @tc.name   testParseCmp010075
     * @tc.number SUB_ASSET_PARSECMP_0075
     * @tc.desc   非法值：同长不同值数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp010075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010075 begin');
      const result: boolean = compareArray(new Uint8Array([34,7,42]), new Uint8Array([34,8,42]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010075 end');
    })

    /**
     * @tc.name   testParseCmp010076
     * @tc.number SUB_ASSET_PARSECMP_0076
     * @tc.desc   非法值：同长不同值数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp010076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010076 begin');
      const result: boolean = compareArray(new Uint8Array([35,7,42]), new Uint8Array([35,8,42]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010076 end');
    })

    /**
     * @tc.name   testParseCmp010077
     * @tc.number SUB_ASSET_PARSECMP_0077
     * @tc.desc   非法值：同长不同值数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp010077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010077 begin');
      const result: boolean = compareArray(new Uint8Array([36,7,42]), new Uint8Array([36,8,42]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010077 end');
    })

    /**
     * @tc.name   testParseCmp010078
     * @tc.number SUB_ASSET_PARSECMP_0078
     * @tc.desc   非法值：同长不同值数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp010078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010078 begin');
      const result: boolean = compareArray(new Uint8Array([37,7,42]), new Uint8Array([37,8,42]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010078 end');
    })

    /**
     * @tc.name   testParseCmp010079
     * @tc.number SUB_ASSET_PARSECMP_0079
     * @tc.desc   非法值：同长不同值数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp010079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010079 begin');
      const result: boolean = compareArray(new Uint8Array([38,7,42]), new Uint8Array([38,8,42]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010079 end');
    })

    /**
     * @tc.name   testParseCmp010080
     * @tc.number SUB_ASSET_PARSECMP_0080
     * @tc.desc   非法值：同长不同值数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp010080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010080 begin');
      const result: boolean = compareArray(new Uint8Array([39,7,42]), new Uint8Array([39,8,42]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010080 end');
    })

    /**
     * @tc.name   testParseCmp010081
     * @tc.number SUB_ASSET_PARSECMP_0081
     * @tc.desc   边界值：空数组比较相等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp010081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010081 begin');
      const result: boolean = compareArray(new Uint8Array([]), new Uint8Array([]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010081 end');
    })

    /**
     * @tc.name   testParseCmp010082
     * @tc.number SUB_ASSET_PARSECMP_0082
     * @tc.desc   边界值：空数组比较相等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp010082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010082 begin');
      const result: boolean = compareArray(new Uint8Array([]), new Uint8Array([]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010082 end');
    })

    /**
     * @tc.name   testParseCmp010083
     * @tc.number SUB_ASSET_PARSECMP_0083
     * @tc.desc   边界值：空数组比较相等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp010083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010083 begin');
      const result: boolean = compareArray(new Uint8Array([]), new Uint8Array([]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010083 end');
    })

    /**
     * @tc.name   testParseCmp010084
     * @tc.number SUB_ASSET_PARSECMP_0084
     * @tc.desc   边界值：空数组比较相等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp010084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010084 begin');
      const result: boolean = compareArray(new Uint8Array([]), new Uint8Array([]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010084 end');
    })

    /**
     * @tc.name   testParseCmp010085
     * @tc.number SUB_ASSET_PARSECMP_0085
     * @tc.desc   边界值：空数组比较相等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp010085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010085 begin');
      const result: boolean = compareArray(new Uint8Array([]), new Uint8Array([]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010085 end');
    })

    /**
     * @tc.name   testParseCmp010086
     * @tc.number SUB_ASSET_PARSECMP_0086
     * @tc.desc   边界值：空数组比较相等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp010086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010086 begin');
      const result: boolean = compareArray(new Uint8Array([]), new Uint8Array([]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010086 end');
    })

    /**
     * @tc.name   testParseCmp010087
     * @tc.number SUB_ASSET_PARSECMP_0087
     * @tc.desc   边界值：空数组比较相等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp010087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010087 begin');
      const result: boolean = compareArray(new Uint8Array([]), new Uint8Array([]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010087 end');
    })

    /**
     * @tc.name   testParseCmp010088
     * @tc.number SUB_ASSET_PARSECMP_0088
     * @tc.desc   边界值：空数组比较相等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp010088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010088 begin');
      const result: boolean = compareArray(new Uint8Array([]), new Uint8Array([]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010088 end');
    })

    /**
     * @tc.name   testParseCmp010089
     * @tc.number SUB_ASSET_PARSECMP_0089
     * @tc.desc   边界值：空数组比较相等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp010089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010089 begin');
      const result: boolean = compareArray(new Uint8Array([]), new Uint8Array([]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010089 end');
    })

    /**
     * @tc.name   testParseCmp010090
     * @tc.number SUB_ASSET_PARSECMP_0090
     * @tc.desc   边界值：空数组比较相等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp010090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010090 begin');
      const result: boolean = compareArray(new Uint8Array([]), new Uint8Array([]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010090 end');
    })

    /**
     * @tc.name   testParseCmp010091
     * @tc.number SUB_ASSET_PARSECMP_0091
     * @tc.desc   边界值：空数组与非空数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp010091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010091 begin');
      const result: boolean = compareArray(new Uint8Array([]), new Uint8Array([1]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010091 end');
    })

    /**
     * @tc.name   testParseCmp010092
     * @tc.number SUB_ASSET_PARSECMP_0092
     * @tc.desc   边界值：空数组与非空数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp010092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010092 begin');
      const result: boolean = compareArray(new Uint8Array([]), new Uint8Array([2]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010092 end');
    })

    /**
     * @tc.name   testParseCmp010093
     * @tc.number SUB_ASSET_PARSECMP_0093
     * @tc.desc   边界值：空数组与非空数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp010093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010093 begin');
      const result: boolean = compareArray(new Uint8Array([]), new Uint8Array([3]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010093 end');
    })

    /**
     * @tc.name   testParseCmp010094
     * @tc.number SUB_ASSET_PARSECMP_0094
     * @tc.desc   边界值：空数组与非空数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp010094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010094 begin');
      const result: boolean = compareArray(new Uint8Array([]), new Uint8Array([4]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010094 end');
    })

    /**
     * @tc.name   testParseCmp010095
     * @tc.number SUB_ASSET_PARSECMP_0095
     * @tc.desc   边界值：空数组与非空数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp010095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010095 begin');
      const result: boolean = compareArray(new Uint8Array([]), new Uint8Array([5]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010095 end');
    })

    /**
     * @tc.name   testParseCmp010096
     * @tc.number SUB_ASSET_PARSECMP_0096
     * @tc.desc   边界值：空数组与非空数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp010096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010096 begin');
      const result: boolean = compareArray(new Uint8Array([]), new Uint8Array([6]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010096 end');
    })

    /**
     * @tc.name   testParseCmp010097
     * @tc.number SUB_ASSET_PARSECMP_0097
     * @tc.desc   边界值：空数组与非空数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp010097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010097 begin');
      const result: boolean = compareArray(new Uint8Array([]), new Uint8Array([7]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010097 end');
    })

    /**
     * @tc.name   testParseCmp010098
     * @tc.number SUB_ASSET_PARSECMP_0098
     * @tc.desc   边界值：空数组与非空数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp010098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010098 begin');
      const result: boolean = compareArray(new Uint8Array([]), new Uint8Array([8]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010098 end');
    })

    /**
     * @tc.name   testParseCmp010099
     * @tc.number SUB_ASSET_PARSECMP_0099
     * @tc.desc   边界值：空数组与非空数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp010099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010099 begin');
      const result: boolean = compareArray(new Uint8Array([]), new Uint8Array([9]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010099 end');
    })

    /**
     * @tc.name   testParseCmp010100
     * @tc.number SUB_ASSET_PARSECMP_0100
     * @tc.desc   边界值：空数组与非空数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp010100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010100 begin');
      const result: boolean = compareArray(new Uint8Array([]), new Uint8Array([10]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010100 end');
    })

    /**
     * @tc.name   testParseCmp010101
     * @tc.number SUB_ASSET_PARSECMP_0101
     * @tc.desc   非法值：同长乱序数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp010101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010101 begin');
      const result: boolean = compareArray(new Uint8Array([1,2,3]), new Uint8Array([3,2,1]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010101 end');
    })

    /**
     * @tc.name   testParseCmp010102
     * @tc.number SUB_ASSET_PARSECMP_0102
     * @tc.desc   非法值：同长乱序数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp010102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010102 begin');
      const result: boolean = compareArray(new Uint8Array([2,3,4]), new Uint8Array([4,3,2]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010102 end');
    })

    /**
     * @tc.name   testParseCmp010103
     * @tc.number SUB_ASSET_PARSECMP_0103
     * @tc.desc   非法值：同长乱序数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp010103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010103 begin');
      const result: boolean = compareArray(new Uint8Array([3,4,5]), new Uint8Array([5,4,3]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010103 end');
    })

    /**
     * @tc.name   testParseCmp010104
     * @tc.number SUB_ASSET_PARSECMP_0104
     * @tc.desc   非法值：同长乱序数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp010104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010104 begin');
      const result: boolean = compareArray(new Uint8Array([4,5,6]), new Uint8Array([6,5,4]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010104 end');
    })

    /**
     * @tc.name   testParseCmp010105
     * @tc.number SUB_ASSET_PARSECMP_0105
     * @tc.desc   非法值：同长乱序数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp010105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010105 begin');
      const result: boolean = compareArray(new Uint8Array([5,6,7]), new Uint8Array([7,6,5]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010105 end');
    })

    /**
     * @tc.name   testParseCmp010106
     * @tc.number SUB_ASSET_PARSECMP_0106
     * @tc.desc   非法值：同长乱序数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp010106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010106 begin');
      const result: boolean = compareArray(new Uint8Array([6,7,8]), new Uint8Array([8,7,6]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010106 end');
    })

    /**
     * @tc.name   testParseCmp010107
     * @tc.number SUB_ASSET_PARSECMP_0107
     * @tc.desc   非法值：同长乱序数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp010107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010107 begin');
      const result: boolean = compareArray(new Uint8Array([7,8,9]), new Uint8Array([9,8,7]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010107 end');
    })

    /**
     * @tc.name   testParseCmp010108
     * @tc.number SUB_ASSET_PARSECMP_0108
     * @tc.desc   非法值：同长乱序数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp010108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010108 begin');
      const result: boolean = compareArray(new Uint8Array([8,9,10]), new Uint8Array([10,9,8]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010108 end');
    })

    /**
     * @tc.name   testParseCmp010109
     * @tc.number SUB_ASSET_PARSECMP_0109
     * @tc.desc   非法值：同长乱序数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp010109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010109 begin');
      const result: boolean = compareArray(new Uint8Array([9,10,11]), new Uint8Array([11,10,9]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010109 end');
    })

    /**
     * @tc.name   testParseCmp010110
     * @tc.number SUB_ASSET_PARSECMP_0110
     * @tc.desc   非法值：同长乱序数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp010110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010110 begin');
      const result: boolean = compareArray(new Uint8Array([10,11,12]), new Uint8Array([12,11,10]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010110 end');
    })

    /**
     * @tc.name   testParseCmp010111
     * @tc.number SUB_ASSET_PARSECMP_0111
     * @tc.desc   非法值：同长乱序数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp010111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010111 begin');
      const result: boolean = compareArray(new Uint8Array([11,12,13]), new Uint8Array([13,12,11]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010111 end');
    })

    /**
     * @tc.name   testParseCmp010112
     * @tc.number SUB_ASSET_PARSECMP_0112
     * @tc.desc   非法值：同长乱序数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp010112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010112 begin');
      const result: boolean = compareArray(new Uint8Array([12,13,14]), new Uint8Array([14,13,12]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010112 end');
    })

    /**
     * @tc.name   testParseCmp010113
     * @tc.number SUB_ASSET_PARSECMP_0113
     * @tc.desc   非法值：同长乱序数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp010113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010113 begin');
      const result: boolean = compareArray(new Uint8Array([13,14,15]), new Uint8Array([15,14,13]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010113 end');
    })

    /**
     * @tc.name   testParseCmp010114
     * @tc.number SUB_ASSET_PARSECMP_0114
     * @tc.desc   非法值：同长乱序数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp010114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010114 begin');
      const result: boolean = compareArray(new Uint8Array([14,15,16]), new Uint8Array([16,15,14]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010114 end');
    })

    /**
     * @tc.name   testParseCmp010115
     * @tc.number SUB_ASSET_PARSECMP_0115
     * @tc.desc   非法值：同长乱序数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp010115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010115 begin');
      const result: boolean = compareArray(new Uint8Array([15,16,17]), new Uint8Array([17,16,15]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010115 end');
    })

    /**
     * @tc.name   testParseCmp010116
     * @tc.number SUB_ASSET_PARSECMP_0116
     * @tc.desc   非法值：同长乱序数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp010116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010116 begin');
      const result: boolean = compareArray(new Uint8Array([16,17,18]), new Uint8Array([18,17,16]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010116 end');
    })

    /**
     * @tc.name   testParseCmp010117
     * @tc.number SUB_ASSET_PARSECMP_0117
     * @tc.desc   非法值：同长乱序数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp010117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010117 begin');
      const result: boolean = compareArray(new Uint8Array([17,18,19]), new Uint8Array([19,18,17]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010117 end');
    })

    /**
     * @tc.name   testParseCmp010118
     * @tc.number SUB_ASSET_PARSECMP_0118
     * @tc.desc   非法值：同长乱序数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp010118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010118 begin');
      const result: boolean = compareArray(new Uint8Array([18,19,20]), new Uint8Array([20,19,18]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010118 end');
    })

    /**
     * @tc.name   testParseCmp010119
     * @tc.number SUB_ASSET_PARSECMP_0119
     * @tc.desc   非法值：同长乱序数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp010119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010119 begin');
      const result: boolean = compareArray(new Uint8Array([19,20,21]), new Uint8Array([21,20,19]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010119 end');
    })

    /**
     * @tc.name   testParseCmp010120
     * @tc.number SUB_ASSET_PARSECMP_0120
     * @tc.desc   非法值：同长乱序数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp010120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010120 begin');
      const result: boolean = compareArray(new Uint8Array([20,21,22]), new Uint8Array([22,21,20]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010120 end');
    })

    /**
     * @tc.name   testParseCmp010121
     * @tc.number SUB_ASSET_PARSECMP_0121
     * @tc.desc   边界值：前缀关系数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp010121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010121 begin');
      const result: boolean = compareArray(new Uint8Array([1,2,3]), new Uint8Array([1,2]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010121 end');
    })

    /**
     * @tc.name   testParseCmp010122
     * @tc.number SUB_ASSET_PARSECMP_0122
     * @tc.desc   边界值：前缀关系数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp010122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010122 begin');
      const result: boolean = compareArray(new Uint8Array([2,3,4]), new Uint8Array([2,3]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010122 end');
    })

    /**
     * @tc.name   testParseCmp010123
     * @tc.number SUB_ASSET_PARSECMP_0123
     * @tc.desc   边界值：前缀关系数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp010123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010123 begin');
      const result: boolean = compareArray(new Uint8Array([3,4,5]), new Uint8Array([3,4]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010123 end');
    })

    /**
     * @tc.name   testParseCmp010124
     * @tc.number SUB_ASSET_PARSECMP_0124
     * @tc.desc   边界值：前缀关系数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp010124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010124 begin');
      const result: boolean = compareArray(new Uint8Array([4,5,6]), new Uint8Array([4,5]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010124 end');
    })

    /**
     * @tc.name   testParseCmp010125
     * @tc.number SUB_ASSET_PARSECMP_0125
     * @tc.desc   边界值：前缀关系数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp010125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010125 begin');
      const result: boolean = compareArray(new Uint8Array([5,6,7]), new Uint8Array([5,6]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010125 end');
    })

    /**
     * @tc.name   testParseCmp010126
     * @tc.number SUB_ASSET_PARSECMP_0126
     * @tc.desc   边界值：前缀关系数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp010126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010126 begin');
      const result: boolean = compareArray(new Uint8Array([6,7,8]), new Uint8Array([6,7]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010126 end');
    })

    /**
     * @tc.name   testParseCmp010127
     * @tc.number SUB_ASSET_PARSECMP_0127
     * @tc.desc   边界值：前缀关系数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp010127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010127 begin');
      const result: boolean = compareArray(new Uint8Array([7,8,9]), new Uint8Array([7,8]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010127 end');
    })

    /**
     * @tc.name   testParseCmp010128
     * @tc.number SUB_ASSET_PARSECMP_0128
     * @tc.desc   边界值：前缀关系数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp010128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010128 begin');
      const result: boolean = compareArray(new Uint8Array([8,9,10]), new Uint8Array([8,9]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010128 end');
    })

    /**
     * @tc.name   testParseCmp010129
     * @tc.number SUB_ASSET_PARSECMP_0129
     * @tc.desc   边界值：前缀关系数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp010129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010129 begin');
      const result: boolean = compareArray(new Uint8Array([9,10,11]), new Uint8Array([9,10]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010129 end');
    })

    /**
     * @tc.name   testParseCmp010130
     * @tc.number SUB_ASSET_PARSECMP_0130
     * @tc.desc   边界值：前缀关系数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp010130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010130 begin');
      const result: boolean = compareArray(new Uint8Array([10,11,12]), new Uint8Array([10,11]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010130 end');
    })

    /**
     * @tc.name   testParseCmp010131
     * @tc.number SUB_ASSET_PARSECMP_0131
     * @tc.desc   边界值：前缀关系数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp010131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010131 begin');
      const result: boolean = compareArray(new Uint8Array([11,12,13]), new Uint8Array([11,12]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010131 end');
    })

    /**
     * @tc.name   testParseCmp010132
     * @tc.number SUB_ASSET_PARSECMP_0132
     * @tc.desc   边界值：前缀关系数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp010132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010132 begin');
      const result: boolean = compareArray(new Uint8Array([12,13,14]), new Uint8Array([12,13]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010132 end');
    })

    /**
     * @tc.name   testParseCmp010133
     * @tc.number SUB_ASSET_PARSECMP_0133
     * @tc.desc   边界值：前缀关系数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp010133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010133 begin');
      const result: boolean = compareArray(new Uint8Array([13,14,15]), new Uint8Array([13,14]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010133 end');
    })

    /**
     * @tc.name   testParseCmp010134
     * @tc.number SUB_ASSET_PARSECMP_0134
     * @tc.desc   边界值：前缀关系数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp010134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010134 begin');
      const result: boolean = compareArray(new Uint8Array([14,15,16]), new Uint8Array([14,15]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010134 end');
    })

    /**
     * @tc.name   testParseCmp010135
     * @tc.number SUB_ASSET_PARSECMP_0135
     * @tc.desc   边界值：前缀关系数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp010135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010135 begin');
      const result: boolean = compareArray(new Uint8Array([15,16,17]), new Uint8Array([15,16]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010135 end');
    })

    /**
     * @tc.name   testParseCmp010136
     * @tc.number SUB_ASSET_PARSECMP_0136
     * @tc.desc   边界值：前缀关系数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp010136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010136 begin');
      const result: boolean = compareArray(new Uint8Array([16,17,18]), new Uint8Array([16,17]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010136 end');
    })

    /**
     * @tc.name   testParseCmp010137
     * @tc.number SUB_ASSET_PARSECMP_0137
     * @tc.desc   边界值：前缀关系数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp010137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010137 begin');
      const result: boolean = compareArray(new Uint8Array([17,18,19]), new Uint8Array([17,18]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010137 end');
    })

    /**
     * @tc.name   testParseCmp010138
     * @tc.number SUB_ASSET_PARSECMP_0138
     * @tc.desc   边界值：前缀关系数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp010138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010138 begin');
      const result: boolean = compareArray(new Uint8Array([18,19,20]), new Uint8Array([18,19]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010138 end');
    })

    /**
     * @tc.name   testParseCmp010139
     * @tc.number SUB_ASSET_PARSECMP_0139
     * @tc.desc   边界值：前缀关系数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp010139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010139 begin');
      const result: boolean = compareArray(new Uint8Array([19,20,21]), new Uint8Array([19,20]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010139 end');
    })

    /**
     * @tc.name   testParseCmp010140
     * @tc.number SUB_ASSET_PARSECMP_0140
     * @tc.desc   边界值：前缀关系数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp010140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010140 begin');
      const result: boolean = compareArray(new Uint8Array([20,21,22]), new Uint8Array([20,21]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010140 end');
    })

    /**
     * @tc.name   testParseCmp010141
     * @tc.number SUB_ASSET_PARSECMP_0141
     * @tc.desc   边界值：单字节数组比较相等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp010141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010141 begin');
      const result: boolean = compareArray(new Uint8Array([9]), new Uint8Array([9]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010141 end');
    })

    /**
     * @tc.name   testParseCmp010142
     * @tc.number SUB_ASSET_PARSECMP_0142
     * @tc.desc   边界值：单字节数组比较相等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp010142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010142 begin');
      const result: boolean = compareArray(new Uint8Array([9]), new Uint8Array([9]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010142 end');
    })

    /**
     * @tc.name   testParseCmp010143
     * @tc.number SUB_ASSET_PARSECMP_0143
     * @tc.desc   边界值：单字节数组比较相等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp010143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010143 begin');
      const result: boolean = compareArray(new Uint8Array([9]), new Uint8Array([9]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010143 end');
    })

    /**
     * @tc.name   testParseCmp010144
     * @tc.number SUB_ASSET_PARSECMP_0144
     * @tc.desc   边界值：单字节数组比较相等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp010144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010144 begin');
      const result: boolean = compareArray(new Uint8Array([9]), new Uint8Array([9]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010144 end');
    })

    /**
     * @tc.name   testParseCmp010145
     * @tc.number SUB_ASSET_PARSECMP_0145
     * @tc.desc   边界值：单字节数组比较相等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp010145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010145 begin');
      const result: boolean = compareArray(new Uint8Array([9]), new Uint8Array([9]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010145 end');
    })

    /**
     * @tc.name   testParseCmp010146
     * @tc.number SUB_ASSET_PARSECMP_0146
     * @tc.desc   边界值：单字节数组比较相等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp010146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010146 begin');
      const result: boolean = compareArray(new Uint8Array([9]), new Uint8Array([9]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010146 end');
    })

    /**
     * @tc.name   testParseCmp010147
     * @tc.number SUB_ASSET_PARSECMP_0147
     * @tc.desc   边界值：单字节数组比较相等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp010147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010147 begin');
      const result: boolean = compareArray(new Uint8Array([9]), new Uint8Array([9]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010147 end');
    })

    /**
     * @tc.name   testParseCmp010148
     * @tc.number SUB_ASSET_PARSECMP_0148
     * @tc.desc   边界值：单字节数组比较相等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp010148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010148 begin');
      const result: boolean = compareArray(new Uint8Array([9]), new Uint8Array([9]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010148 end');
    })

    /**
     * @tc.name   testParseCmp010149
     * @tc.number SUB_ASSET_PARSECMP_0149
     * @tc.desc   边界值：单字节数组比较相等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp010149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010149 begin');
      const result: boolean = compareArray(new Uint8Array([9]), new Uint8Array([9]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010149 end');
    })

    /**
     * @tc.name   testParseCmp010150
     * @tc.number SUB_ASSET_PARSECMP_0150
     * @tc.desc   边界值：单字节数组比较相等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp010150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010150 begin');
      const result: boolean = compareArray(new Uint8Array([9]), new Uint8Array([9]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp010150 end');
    })

  })
}
