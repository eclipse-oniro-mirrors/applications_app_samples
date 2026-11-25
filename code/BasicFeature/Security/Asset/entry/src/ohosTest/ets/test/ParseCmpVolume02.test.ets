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

export default function parseCmpVolume02() {
  describe('ParseCmpVolume02Test', () => {

    /**
     * @tc.name   testParseCmp020151
     * @tc.number SUB_ASSET_PARSECMP_0151
     * @tc.desc   同值数组比较相等，同长不同值数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp020151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020151 begin');
      const same: boolean = compareArray(new Uint8Array([1, 2, 3]), new Uint8Array([1, 2, 3]));
      const diff: boolean = compareArray(new Uint8Array([1, 2, 3]), new Uint8Array([1, 2, 4]));
      expect(same).assertTrue();
      expect(diff).assertFalse();
      const empty: boolean = compareArray(new Uint8Array([]), new Uint8Array([]));
      expect(empty).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020151 end');
    })

    /**
     * @tc.name   testParseCmp020152
     * @tc.number SUB_ASSET_PARSECMP_0152
     * @tc.desc   合法值：同值同长数组比较相等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp020152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020152 begin');
      const result: boolean = compareArray(new Uint8Array([1,7,42]), new Uint8Array([1,7,42]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020152 end');
    })

    /**
     * @tc.name   testParseCmp020153
     * @tc.number SUB_ASSET_PARSECMP_0153
     * @tc.desc   合法值：同值同长数组比较相等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp020153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020153 begin');
      const result: boolean = compareArray(new Uint8Array([2,7,42]), new Uint8Array([2,7,42]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020153 end');
    })

    /**
     * @tc.name   testParseCmp020154
     * @tc.number SUB_ASSET_PARSECMP_0154
     * @tc.desc   合法值：同值同长数组比较相等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp020154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020154 begin');
      const result: boolean = compareArray(new Uint8Array([3,7,42]), new Uint8Array([3,7,42]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020154 end');
    })

    /**
     * @tc.name   testParseCmp020155
     * @tc.number SUB_ASSET_PARSECMP_0155
     * @tc.desc   合法值：同值同长数组比较相等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp020155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020155 begin');
      const result: boolean = compareArray(new Uint8Array([4,7,42]), new Uint8Array([4,7,42]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020155 end');
    })

    /**
     * @tc.name   testParseCmp020156
     * @tc.number SUB_ASSET_PARSECMP_0156
     * @tc.desc   合法值：同值同长数组比较相等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp020156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020156 begin');
      const result: boolean = compareArray(new Uint8Array([5,7,42]), new Uint8Array([5,7,42]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020156 end');
    })

    /**
     * @tc.name   testParseCmp020157
     * @tc.number SUB_ASSET_PARSECMP_0157
     * @tc.desc   合法值：同值同长数组比较相等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp020157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020157 begin');
      const result: boolean = compareArray(new Uint8Array([6,7,42]), new Uint8Array([6,7,42]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020157 end');
    })

    /**
     * @tc.name   testParseCmp020158
     * @tc.number SUB_ASSET_PARSECMP_0158
     * @tc.desc   合法值：同值同长数组比较相等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp020158', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020158 begin');
      const result: boolean = compareArray(new Uint8Array([7,7,42]), new Uint8Array([7,7,42]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020158 end');
    })

    /**
     * @tc.name   testParseCmp020159
     * @tc.number SUB_ASSET_PARSECMP_0159
     * @tc.desc   合法值：同值同长数组比较相等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp020159', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020159 begin');
      const result: boolean = compareArray(new Uint8Array([8,7,42]), new Uint8Array([8,7,42]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020159 end');
    })

    /**
     * @tc.name   testParseCmp020160
     * @tc.number SUB_ASSET_PARSECMP_0160
     * @tc.desc   合法值：同值同长数组比较相等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp020160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020160 begin');
      const result: boolean = compareArray(new Uint8Array([9,7,42]), new Uint8Array([9,7,42]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020160 end');
    })

    /**
     * @tc.name   testParseCmp020161
     * @tc.number SUB_ASSET_PARSECMP_0161
     * @tc.desc   合法值：同值同长数组比较相等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp020161', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020161 begin');
      const result: boolean = compareArray(new Uint8Array([10,7,42]), new Uint8Array([10,7,42]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020161 end');
    })

    /**
     * @tc.name   testParseCmp020162
     * @tc.number SUB_ASSET_PARSECMP_0162
     * @tc.desc   合法值：同值同长数组比较相等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp020162', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020162 begin');
      const result: boolean = compareArray(new Uint8Array([11,7,42]), new Uint8Array([11,7,42]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020162 end');
    })

    /**
     * @tc.name   testParseCmp020163
     * @tc.number SUB_ASSET_PARSECMP_0163
     * @tc.desc   合法值：同值同长数组比较相等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp020163', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020163 begin');
      const result: boolean = compareArray(new Uint8Array([12,7,42]), new Uint8Array([12,7,42]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020163 end');
    })

    /**
     * @tc.name   testParseCmp020164
     * @tc.number SUB_ASSET_PARSECMP_0164
     * @tc.desc   合法值：同值同长数组比较相等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp020164', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020164 begin');
      const result: boolean = compareArray(new Uint8Array([13,7,42]), new Uint8Array([13,7,42]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020164 end');
    })

    /**
     * @tc.name   testParseCmp020165
     * @tc.number SUB_ASSET_PARSECMP_0165
     * @tc.desc   合法值：同值同长数组比较相等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp020165', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020165 begin');
      const result: boolean = compareArray(new Uint8Array([14,7,42]), new Uint8Array([14,7,42]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020165 end');
    })

    /**
     * @tc.name   testParseCmp020166
     * @tc.number SUB_ASSET_PARSECMP_0166
     * @tc.desc   合法值：同值同长数组比较相等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp020166', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020166 begin');
      const result: boolean = compareArray(new Uint8Array([15,7,42]), new Uint8Array([15,7,42]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020166 end');
    })

    /**
     * @tc.name   testParseCmp020167
     * @tc.number SUB_ASSET_PARSECMP_0167
     * @tc.desc   合法值：同值同长数组比较相等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp020167', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020167 begin');
      const result: boolean = compareArray(new Uint8Array([16,7,42]), new Uint8Array([16,7,42]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020167 end');
    })

    /**
     * @tc.name   testParseCmp020168
     * @tc.number SUB_ASSET_PARSECMP_0168
     * @tc.desc   合法值：同值同长数组比较相等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp020168', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020168 begin');
      const result: boolean = compareArray(new Uint8Array([17,7,42]), new Uint8Array([17,7,42]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020168 end');
    })

    /**
     * @tc.name   testParseCmp020169
     * @tc.number SUB_ASSET_PARSECMP_0169
     * @tc.desc   合法值：同值同长数组比较相等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp020169', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020169 begin');
      const result: boolean = compareArray(new Uint8Array([18,7,42]), new Uint8Array([18,7,42]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020169 end');
    })

    /**
     * @tc.name   testParseCmp020170
     * @tc.number SUB_ASSET_PARSECMP_0170
     * @tc.desc   合法值：同值同长数组比较相等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp020170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020170 begin');
      const result: boolean = compareArray(new Uint8Array([19,7,42]), new Uint8Array([19,7,42]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020170 end');
    })

    /**
     * @tc.name   testParseCmp020171
     * @tc.number SUB_ASSET_PARSECMP_0171
     * @tc.desc   合法值：同值同长数组比较相等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp020171', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020171 begin');
      const result: boolean = compareArray(new Uint8Array([20,7,42]), new Uint8Array([20,7,42]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020171 end');
    })

    /**
     * @tc.name   testParseCmp020172
     * @tc.number SUB_ASSET_PARSECMP_0172
     * @tc.desc   合法值：同值同长数组比较相等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp020172', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020172 begin');
      const result: boolean = compareArray(new Uint8Array([21,7,42]), new Uint8Array([21,7,42]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020172 end');
    })

    /**
     * @tc.name   testParseCmp020173
     * @tc.number SUB_ASSET_PARSECMP_0173
     * @tc.desc   合法值：同值同长数组比较相等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp020173', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020173 begin');
      const result: boolean = compareArray(new Uint8Array([22,7,42]), new Uint8Array([22,7,42]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020173 end');
    })

    /**
     * @tc.name   testParseCmp020174
     * @tc.number SUB_ASSET_PARSECMP_0174
     * @tc.desc   合法值：同值同长数组比较相等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp020174', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020174 begin');
      const result: boolean = compareArray(new Uint8Array([23,7,42]), new Uint8Array([23,7,42]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020174 end');
    })

    /**
     * @tc.name   testParseCmp020175
     * @tc.number SUB_ASSET_PARSECMP_0175
     * @tc.desc   合法值：同值同长数组比较相等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp020175', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020175 begin');
      const result: boolean = compareArray(new Uint8Array([24,7,42]), new Uint8Array([24,7,42]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020175 end');
    })

    /**
     * @tc.name   testParseCmp020176
     * @tc.number SUB_ASSET_PARSECMP_0176
     * @tc.desc   合法值：同值同长数组比较相等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp020176', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020176 begin');
      const result: boolean = compareArray(new Uint8Array([25,7,42]), new Uint8Array([25,7,42]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020176 end');
    })

    /**
     * @tc.name   testParseCmp020177
     * @tc.number SUB_ASSET_PARSECMP_0177
     * @tc.desc   合法值：同值同长数组比较相等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp020177', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020177 begin');
      const result: boolean = compareArray(new Uint8Array([26,7,42]), new Uint8Array([26,7,42]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020177 end');
    })

    /**
     * @tc.name   testParseCmp020178
     * @tc.number SUB_ASSET_PARSECMP_0178
     * @tc.desc   合法值：同值同长数组比较相等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp020178', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020178 begin');
      const result: boolean = compareArray(new Uint8Array([27,7,42]), new Uint8Array([27,7,42]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020178 end');
    })

    /**
     * @tc.name   testParseCmp020179
     * @tc.number SUB_ASSET_PARSECMP_0179
     * @tc.desc   合法值：同值同长数组比较相等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp020179', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020179 begin');
      const result: boolean = compareArray(new Uint8Array([28,7,42]), new Uint8Array([28,7,42]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020179 end');
    })

    /**
     * @tc.name   testParseCmp020180
     * @tc.number SUB_ASSET_PARSECMP_0180
     * @tc.desc   合法值：同值同长数组比较相等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp020180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020180 begin');
      const result: boolean = compareArray(new Uint8Array([29,7,42]), new Uint8Array([29,7,42]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020180 end');
    })

    /**
     * @tc.name   testParseCmp020181
     * @tc.number SUB_ASSET_PARSECMP_0181
     * @tc.desc   合法值：同值同长数组比较相等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp020181', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020181 begin');
      const result: boolean = compareArray(new Uint8Array([30,7,42]), new Uint8Array([30,7,42]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020181 end');
    })

    /**
     * @tc.name   testParseCmp020182
     * @tc.number SUB_ASSET_PARSECMP_0182
     * @tc.desc   合法值：同值同长数组比较相等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp020182', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020182 begin');
      const result: boolean = compareArray(new Uint8Array([31,7,42]), new Uint8Array([31,7,42]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020182 end');
    })

    /**
     * @tc.name   testParseCmp020183
     * @tc.number SUB_ASSET_PARSECMP_0183
     * @tc.desc   合法值：同值同长数组比较相等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp020183', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020183 begin');
      const result: boolean = compareArray(new Uint8Array([32,7,42]), new Uint8Array([32,7,42]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020183 end');
    })

    /**
     * @tc.name   testParseCmp020184
     * @tc.number SUB_ASSET_PARSECMP_0184
     * @tc.desc   合法值：同值同长数组比较相等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp020184', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020184 begin');
      const result: boolean = compareArray(new Uint8Array([33,7,42]), new Uint8Array([33,7,42]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020184 end');
    })

    /**
     * @tc.name   testParseCmp020185
     * @tc.number SUB_ASSET_PARSECMP_0185
     * @tc.desc   合法值：同值同长数组比较相等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp020185', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020185 begin');
      const result: boolean = compareArray(new Uint8Array([34,7,42]), new Uint8Array([34,7,42]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020185 end');
    })

    /**
     * @tc.name   testParseCmp020186
     * @tc.number SUB_ASSET_PARSECMP_0186
     * @tc.desc   合法值：同值同长数组比较相等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp020186', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020186 begin');
      const result: boolean = compareArray(new Uint8Array([35,7,42]), new Uint8Array([35,7,42]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020186 end');
    })

    /**
     * @tc.name   testParseCmp020187
     * @tc.number SUB_ASSET_PARSECMP_0187
     * @tc.desc   合法值：同值同长数组比较相等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp020187', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020187 begin');
      const result: boolean = compareArray(new Uint8Array([36,7,42]), new Uint8Array([36,7,42]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020187 end');
    })

    /**
     * @tc.name   testParseCmp020188
     * @tc.number SUB_ASSET_PARSECMP_0188
     * @tc.desc   合法值：同值同长数组比较相等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp020188', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020188 begin');
      const result: boolean = compareArray(new Uint8Array([37,7,42]), new Uint8Array([37,7,42]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020188 end');
    })

    /**
     * @tc.name   testParseCmp020189
     * @tc.number SUB_ASSET_PARSECMP_0189
     * @tc.desc   合法值：同值同长数组比较相等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp020189', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020189 begin');
      const result: boolean = compareArray(new Uint8Array([38,7,42]), new Uint8Array([38,7,42]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020189 end');
    })

    /**
     * @tc.name   testParseCmp020190
     * @tc.number SUB_ASSET_PARSECMP_0190
     * @tc.desc   合法值：同值同长数组比较相等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp020190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020190 begin');
      const result: boolean = compareArray(new Uint8Array([39,7,42]), new Uint8Array([39,7,42]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020190 end');
    })

    /**
     * @tc.name   testParseCmp020191
     * @tc.number SUB_ASSET_PARSECMP_0191
     * @tc.desc   非法值：同长不同值数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp020191', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020191 begin');
      const result: boolean = compareArray(new Uint8Array([0,7,42]), new Uint8Array([0,8,42]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020191 end');
    })

    /**
     * @tc.name   testParseCmp020192
     * @tc.number SUB_ASSET_PARSECMP_0192
     * @tc.desc   非法值：同长不同值数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp020192', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020192 begin');
      const result: boolean = compareArray(new Uint8Array([1,7,42]), new Uint8Array([1,8,42]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020192 end');
    })

    /**
     * @tc.name   testParseCmp020193
     * @tc.number SUB_ASSET_PARSECMP_0193
     * @tc.desc   非法值：同长不同值数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp020193', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020193 begin');
      const result: boolean = compareArray(new Uint8Array([2,7,42]), new Uint8Array([2,8,42]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020193 end');
    })

    /**
     * @tc.name   testParseCmp020194
     * @tc.number SUB_ASSET_PARSECMP_0194
     * @tc.desc   非法值：同长不同值数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp020194', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020194 begin');
      const result: boolean = compareArray(new Uint8Array([3,7,42]), new Uint8Array([3,8,42]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020194 end');
    })

    /**
     * @tc.name   testParseCmp020195
     * @tc.number SUB_ASSET_PARSECMP_0195
     * @tc.desc   非法值：同长不同值数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp020195', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020195 begin');
      const result: boolean = compareArray(new Uint8Array([4,7,42]), new Uint8Array([4,8,42]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020195 end');
    })

    /**
     * @tc.name   testParseCmp020196
     * @tc.number SUB_ASSET_PARSECMP_0196
     * @tc.desc   非法值：同长不同值数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp020196', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020196 begin');
      const result: boolean = compareArray(new Uint8Array([5,7,42]), new Uint8Array([5,8,42]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020196 end');
    })

    /**
     * @tc.name   testParseCmp020197
     * @tc.number SUB_ASSET_PARSECMP_0197
     * @tc.desc   非法值：同长不同值数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp020197', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020197 begin');
      const result: boolean = compareArray(new Uint8Array([6,7,42]), new Uint8Array([6,8,42]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020197 end');
    })

    /**
     * @tc.name   testParseCmp020198
     * @tc.number SUB_ASSET_PARSECMP_0198
     * @tc.desc   非法值：同长不同值数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp020198', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020198 begin');
      const result: boolean = compareArray(new Uint8Array([7,7,42]), new Uint8Array([7,8,42]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020198 end');
    })

    /**
     * @tc.name   testParseCmp020199
     * @tc.number SUB_ASSET_PARSECMP_0199
     * @tc.desc   非法值：同长不同值数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp020199', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020199 begin');
      const result: boolean = compareArray(new Uint8Array([8,7,42]), new Uint8Array([8,8,42]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020199 end');
    })

    /**
     * @tc.name   testParseCmp020200
     * @tc.number SUB_ASSET_PARSECMP_0200
     * @tc.desc   非法值：同长不同值数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp020200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020200 begin');
      const result: boolean = compareArray(new Uint8Array([9,7,42]), new Uint8Array([9,8,42]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020200 end');
    })

    /**
     * @tc.name   testParseCmp020201
     * @tc.number SUB_ASSET_PARSECMP_0201
     * @tc.desc   非法值：同长不同值数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp020201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020201 begin');
      const result: boolean = compareArray(new Uint8Array([10,7,42]), new Uint8Array([10,8,42]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020201 end');
    })

    /**
     * @tc.name   testParseCmp020202
     * @tc.number SUB_ASSET_PARSECMP_0202
     * @tc.desc   非法值：同长不同值数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp020202', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020202 begin');
      const result: boolean = compareArray(new Uint8Array([11,7,42]), new Uint8Array([11,8,42]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020202 end');
    })

    /**
     * @tc.name   testParseCmp020203
     * @tc.number SUB_ASSET_PARSECMP_0203
     * @tc.desc   非法值：同长不同值数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp020203', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020203 begin');
      const result: boolean = compareArray(new Uint8Array([12,7,42]), new Uint8Array([12,8,42]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020203 end');
    })

    /**
     * @tc.name   testParseCmp020204
     * @tc.number SUB_ASSET_PARSECMP_0204
     * @tc.desc   非法值：同长不同值数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp020204', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020204 begin');
      const result: boolean = compareArray(new Uint8Array([13,7,42]), new Uint8Array([13,8,42]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020204 end');
    })

    /**
     * @tc.name   testParseCmp020205
     * @tc.number SUB_ASSET_PARSECMP_0205
     * @tc.desc   非法值：同长不同值数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp020205', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020205 begin');
      const result: boolean = compareArray(new Uint8Array([14,7,42]), new Uint8Array([14,8,42]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020205 end');
    })

    /**
     * @tc.name   testParseCmp020206
     * @tc.number SUB_ASSET_PARSECMP_0206
     * @tc.desc   非法值：同长不同值数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp020206', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020206 begin');
      const result: boolean = compareArray(new Uint8Array([15,7,42]), new Uint8Array([15,8,42]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020206 end');
    })

    /**
     * @tc.name   testParseCmp020207
     * @tc.number SUB_ASSET_PARSECMP_0207
     * @tc.desc   非法值：同长不同值数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp020207', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020207 begin');
      const result: boolean = compareArray(new Uint8Array([16,7,42]), new Uint8Array([16,8,42]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020207 end');
    })

    /**
     * @tc.name   testParseCmp020208
     * @tc.number SUB_ASSET_PARSECMP_0208
     * @tc.desc   非法值：同长不同值数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp020208', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020208 begin');
      const result: boolean = compareArray(new Uint8Array([17,7,42]), new Uint8Array([17,8,42]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020208 end');
    })

    /**
     * @tc.name   testParseCmp020209
     * @tc.number SUB_ASSET_PARSECMP_0209
     * @tc.desc   非法值：同长不同值数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp020209', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020209 begin');
      const result: boolean = compareArray(new Uint8Array([18,7,42]), new Uint8Array([18,8,42]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020209 end');
    })

    /**
     * @tc.name   testParseCmp020210
     * @tc.number SUB_ASSET_PARSECMP_0210
     * @tc.desc   非法值：同长不同值数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp020210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020210 begin');
      const result: boolean = compareArray(new Uint8Array([19,7,42]), new Uint8Array([19,8,42]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020210 end');
    })

    /**
     * @tc.name   testParseCmp020211
     * @tc.number SUB_ASSET_PARSECMP_0211
     * @tc.desc   非法值：同长不同值数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp020211', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020211 begin');
      const result: boolean = compareArray(new Uint8Array([20,7,42]), new Uint8Array([20,8,42]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020211 end');
    })

    /**
     * @tc.name   testParseCmp020212
     * @tc.number SUB_ASSET_PARSECMP_0212
     * @tc.desc   非法值：同长不同值数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp020212', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020212 begin');
      const result: boolean = compareArray(new Uint8Array([21,7,42]), new Uint8Array([21,8,42]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020212 end');
    })

    /**
     * @tc.name   testParseCmp020213
     * @tc.number SUB_ASSET_PARSECMP_0213
     * @tc.desc   非法值：同长不同值数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp020213', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020213 begin');
      const result: boolean = compareArray(new Uint8Array([22,7,42]), new Uint8Array([22,8,42]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020213 end');
    })

    /**
     * @tc.name   testParseCmp020214
     * @tc.number SUB_ASSET_PARSECMP_0214
     * @tc.desc   非法值：同长不同值数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp020214', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020214 begin');
      const result: boolean = compareArray(new Uint8Array([23,7,42]), new Uint8Array([23,8,42]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020214 end');
    })

    /**
     * @tc.name   testParseCmp020215
     * @tc.number SUB_ASSET_PARSECMP_0215
     * @tc.desc   非法值：同长不同值数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp020215', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020215 begin');
      const result: boolean = compareArray(new Uint8Array([24,7,42]), new Uint8Array([24,8,42]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020215 end');
    })

    /**
     * @tc.name   testParseCmp020216
     * @tc.number SUB_ASSET_PARSECMP_0216
     * @tc.desc   非法值：同长不同值数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp020216', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020216 begin');
      const result: boolean = compareArray(new Uint8Array([25,7,42]), new Uint8Array([25,8,42]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020216 end');
    })

    /**
     * @tc.name   testParseCmp020217
     * @tc.number SUB_ASSET_PARSECMP_0217
     * @tc.desc   非法值：同长不同值数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp020217', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020217 begin');
      const result: boolean = compareArray(new Uint8Array([26,7,42]), new Uint8Array([26,8,42]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020217 end');
    })

    /**
     * @tc.name   testParseCmp020218
     * @tc.number SUB_ASSET_PARSECMP_0218
     * @tc.desc   非法值：同长不同值数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp020218', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020218 begin');
      const result: boolean = compareArray(new Uint8Array([27,7,42]), new Uint8Array([27,8,42]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020218 end');
    })

    /**
     * @tc.name   testParseCmp020219
     * @tc.number SUB_ASSET_PARSECMP_0219
     * @tc.desc   非法值：同长不同值数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp020219', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020219 begin');
      const result: boolean = compareArray(new Uint8Array([28,7,42]), new Uint8Array([28,8,42]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020219 end');
    })

    /**
     * @tc.name   testParseCmp020220
     * @tc.number SUB_ASSET_PARSECMP_0220
     * @tc.desc   非法值：同长不同值数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp020220', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020220 begin');
      const result: boolean = compareArray(new Uint8Array([29,7,42]), new Uint8Array([29,8,42]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020220 end');
    })

    /**
     * @tc.name   testParseCmp020221
     * @tc.number SUB_ASSET_PARSECMP_0221
     * @tc.desc   非法值：同长不同值数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp020221', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020221 begin');
      const result: boolean = compareArray(new Uint8Array([30,7,42]), new Uint8Array([30,8,42]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020221 end');
    })

    /**
     * @tc.name   testParseCmp020222
     * @tc.number SUB_ASSET_PARSECMP_0222
     * @tc.desc   非法值：同长不同值数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp020222', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020222 begin');
      const result: boolean = compareArray(new Uint8Array([31,7,42]), new Uint8Array([31,8,42]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020222 end');
    })

    /**
     * @tc.name   testParseCmp020223
     * @tc.number SUB_ASSET_PARSECMP_0223
     * @tc.desc   非法值：同长不同值数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp020223', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020223 begin');
      const result: boolean = compareArray(new Uint8Array([32,7,42]), new Uint8Array([32,8,42]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020223 end');
    })

    /**
     * @tc.name   testParseCmp020224
     * @tc.number SUB_ASSET_PARSECMP_0224
     * @tc.desc   非法值：同长不同值数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp020224', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020224 begin');
      const result: boolean = compareArray(new Uint8Array([33,7,42]), new Uint8Array([33,8,42]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020224 end');
    })

    /**
     * @tc.name   testParseCmp020225
     * @tc.number SUB_ASSET_PARSECMP_0225
     * @tc.desc   非法值：同长不同值数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp020225', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020225 begin');
      const result: boolean = compareArray(new Uint8Array([34,7,42]), new Uint8Array([34,8,42]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020225 end');
    })

    /**
     * @tc.name   testParseCmp020226
     * @tc.number SUB_ASSET_PARSECMP_0226
     * @tc.desc   非法值：同长不同值数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp020226', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020226 begin');
      const result: boolean = compareArray(new Uint8Array([35,7,42]), new Uint8Array([35,8,42]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020226 end');
    })

    /**
     * @tc.name   testParseCmp020227
     * @tc.number SUB_ASSET_PARSECMP_0227
     * @tc.desc   非法值：同长不同值数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp020227', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020227 begin');
      const result: boolean = compareArray(new Uint8Array([36,7,42]), new Uint8Array([36,8,42]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020227 end');
    })

    /**
     * @tc.name   testParseCmp020228
     * @tc.number SUB_ASSET_PARSECMP_0228
     * @tc.desc   非法值：同长不同值数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp020228', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020228 begin');
      const result: boolean = compareArray(new Uint8Array([37,7,42]), new Uint8Array([37,8,42]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020228 end');
    })

    /**
     * @tc.name   testParseCmp020229
     * @tc.number SUB_ASSET_PARSECMP_0229
     * @tc.desc   非法值：同长不同值数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp020229', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020229 begin');
      const result: boolean = compareArray(new Uint8Array([38,7,42]), new Uint8Array([38,8,42]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020229 end');
    })

    /**
     * @tc.name   testParseCmp020230
     * @tc.number SUB_ASSET_PARSECMP_0230
     * @tc.desc   非法值：同长不同值数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp020230', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020230 begin');
      const result: boolean = compareArray(new Uint8Array([39,7,42]), new Uint8Array([39,8,42]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020230 end');
    })

    /**
     * @tc.name   testParseCmp020231
     * @tc.number SUB_ASSET_PARSECMP_0231
     * @tc.desc   边界值：空数组比较相等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp020231', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020231 begin');
      const result: boolean = compareArray(new Uint8Array([]), new Uint8Array([]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020231 end');
    })

    /**
     * @tc.name   testParseCmp020232
     * @tc.number SUB_ASSET_PARSECMP_0232
     * @tc.desc   边界值：空数组比较相等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp020232', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020232 begin');
      const result: boolean = compareArray(new Uint8Array([]), new Uint8Array([]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020232 end');
    })

    /**
     * @tc.name   testParseCmp020233
     * @tc.number SUB_ASSET_PARSECMP_0233
     * @tc.desc   边界值：空数组比较相等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp020233', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020233 begin');
      const result: boolean = compareArray(new Uint8Array([]), new Uint8Array([]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020233 end');
    })

    /**
     * @tc.name   testParseCmp020234
     * @tc.number SUB_ASSET_PARSECMP_0234
     * @tc.desc   边界值：空数组比较相等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp020234', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020234 begin');
      const result: boolean = compareArray(new Uint8Array([]), new Uint8Array([]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020234 end');
    })

    /**
     * @tc.name   testParseCmp020235
     * @tc.number SUB_ASSET_PARSECMP_0235
     * @tc.desc   边界值：空数组比较相等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp020235', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020235 begin');
      const result: boolean = compareArray(new Uint8Array([]), new Uint8Array([]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020235 end');
    })

    /**
     * @tc.name   testParseCmp020236
     * @tc.number SUB_ASSET_PARSECMP_0236
     * @tc.desc   边界值：空数组比较相等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp020236', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020236 begin');
      const result: boolean = compareArray(new Uint8Array([]), new Uint8Array([]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020236 end');
    })

    /**
     * @tc.name   testParseCmp020237
     * @tc.number SUB_ASSET_PARSECMP_0237
     * @tc.desc   边界值：空数组比较相等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp020237', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020237 begin');
      const result: boolean = compareArray(new Uint8Array([]), new Uint8Array([]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020237 end');
    })

    /**
     * @tc.name   testParseCmp020238
     * @tc.number SUB_ASSET_PARSECMP_0238
     * @tc.desc   边界值：空数组比较相等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp020238', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020238 begin');
      const result: boolean = compareArray(new Uint8Array([]), new Uint8Array([]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020238 end');
    })

    /**
     * @tc.name   testParseCmp020239
     * @tc.number SUB_ASSET_PARSECMP_0239
     * @tc.desc   边界值：空数组比较相等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp020239', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020239 begin');
      const result: boolean = compareArray(new Uint8Array([]), new Uint8Array([]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020239 end');
    })

    /**
     * @tc.name   testParseCmp020240
     * @tc.number SUB_ASSET_PARSECMP_0240
     * @tc.desc   边界值：空数组比较相等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp020240', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020240 begin');
      const result: boolean = compareArray(new Uint8Array([]), new Uint8Array([]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020240 end');
    })

    /**
     * @tc.name   testParseCmp020241
     * @tc.number SUB_ASSET_PARSECMP_0241
     * @tc.desc   边界值：空数组与非空数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp020241', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020241 begin');
      const result: boolean = compareArray(new Uint8Array([]), new Uint8Array([1]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020241 end');
    })

    /**
     * @tc.name   testParseCmp020242
     * @tc.number SUB_ASSET_PARSECMP_0242
     * @tc.desc   边界值：空数组与非空数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp020242', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020242 begin');
      const result: boolean = compareArray(new Uint8Array([]), new Uint8Array([2]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020242 end');
    })

    /**
     * @tc.name   testParseCmp020243
     * @tc.number SUB_ASSET_PARSECMP_0243
     * @tc.desc   边界值：空数组与非空数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp020243', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020243 begin');
      const result: boolean = compareArray(new Uint8Array([]), new Uint8Array([3]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020243 end');
    })

    /**
     * @tc.name   testParseCmp020244
     * @tc.number SUB_ASSET_PARSECMP_0244
     * @tc.desc   边界值：空数组与非空数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp020244', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020244 begin');
      const result: boolean = compareArray(new Uint8Array([]), new Uint8Array([4]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020244 end');
    })

    /**
     * @tc.name   testParseCmp020245
     * @tc.number SUB_ASSET_PARSECMP_0245
     * @tc.desc   边界值：空数组与非空数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp020245', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020245 begin');
      const result: boolean = compareArray(new Uint8Array([]), new Uint8Array([5]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020245 end');
    })

    /**
     * @tc.name   testParseCmp020246
     * @tc.number SUB_ASSET_PARSECMP_0246
     * @tc.desc   边界值：空数组与非空数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp020246', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020246 begin');
      const result: boolean = compareArray(new Uint8Array([]), new Uint8Array([6]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020246 end');
    })

    /**
     * @tc.name   testParseCmp020247
     * @tc.number SUB_ASSET_PARSECMP_0247
     * @tc.desc   边界值：空数组与非空数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp020247', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020247 begin');
      const result: boolean = compareArray(new Uint8Array([]), new Uint8Array([7]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020247 end');
    })

    /**
     * @tc.name   testParseCmp020248
     * @tc.number SUB_ASSET_PARSECMP_0248
     * @tc.desc   边界值：空数组与非空数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp020248', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020248 begin');
      const result: boolean = compareArray(new Uint8Array([]), new Uint8Array([8]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020248 end');
    })

    /**
     * @tc.name   testParseCmp020249
     * @tc.number SUB_ASSET_PARSECMP_0249
     * @tc.desc   边界值：空数组与非空数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp020249', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020249 begin');
      const result: boolean = compareArray(new Uint8Array([]), new Uint8Array([9]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020249 end');
    })

    /**
     * @tc.name   testParseCmp020250
     * @tc.number SUB_ASSET_PARSECMP_0250
     * @tc.desc   边界值：空数组与非空数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp020250', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020250 begin');
      const result: boolean = compareArray(new Uint8Array([]), new Uint8Array([10]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020250 end');
    })

    /**
     * @tc.name   testParseCmp020251
     * @tc.number SUB_ASSET_PARSECMP_0251
     * @tc.desc   非法值：同长乱序数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp020251', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020251 begin');
      const result: boolean = compareArray(new Uint8Array([1,2,3]), new Uint8Array([3,2,1]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020251 end');
    })

    /**
     * @tc.name   testParseCmp020252
     * @tc.number SUB_ASSET_PARSECMP_0252
     * @tc.desc   非法值：同长乱序数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp020252', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020252 begin');
      const result: boolean = compareArray(new Uint8Array([2,3,4]), new Uint8Array([4,3,2]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020252 end');
    })

    /**
     * @tc.name   testParseCmp020253
     * @tc.number SUB_ASSET_PARSECMP_0253
     * @tc.desc   非法值：同长乱序数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp020253', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020253 begin');
      const result: boolean = compareArray(new Uint8Array([3,4,5]), new Uint8Array([5,4,3]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020253 end');
    })

    /**
     * @tc.name   testParseCmp020254
     * @tc.number SUB_ASSET_PARSECMP_0254
     * @tc.desc   非法值：同长乱序数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp020254', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020254 begin');
      const result: boolean = compareArray(new Uint8Array([4,5,6]), new Uint8Array([6,5,4]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020254 end');
    })

    /**
     * @tc.name   testParseCmp020255
     * @tc.number SUB_ASSET_PARSECMP_0255
     * @tc.desc   非法值：同长乱序数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp020255', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020255 begin');
      const result: boolean = compareArray(new Uint8Array([5,6,7]), new Uint8Array([7,6,5]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020255 end');
    })

    /**
     * @tc.name   testParseCmp020256
     * @tc.number SUB_ASSET_PARSECMP_0256
     * @tc.desc   非法值：同长乱序数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp020256', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020256 begin');
      const result: boolean = compareArray(new Uint8Array([6,7,8]), new Uint8Array([8,7,6]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020256 end');
    })

    /**
     * @tc.name   testParseCmp020257
     * @tc.number SUB_ASSET_PARSECMP_0257
     * @tc.desc   非法值：同长乱序数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp020257', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020257 begin');
      const result: boolean = compareArray(new Uint8Array([7,8,9]), new Uint8Array([9,8,7]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020257 end');
    })

    /**
     * @tc.name   testParseCmp020258
     * @tc.number SUB_ASSET_PARSECMP_0258
     * @tc.desc   非法值：同长乱序数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp020258', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020258 begin');
      const result: boolean = compareArray(new Uint8Array([8,9,10]), new Uint8Array([10,9,8]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020258 end');
    })

    /**
     * @tc.name   testParseCmp020259
     * @tc.number SUB_ASSET_PARSECMP_0259
     * @tc.desc   非法值：同长乱序数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp020259', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020259 begin');
      const result: boolean = compareArray(new Uint8Array([9,10,11]), new Uint8Array([11,10,9]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020259 end');
    })

    /**
     * @tc.name   testParseCmp020260
     * @tc.number SUB_ASSET_PARSECMP_0260
     * @tc.desc   非法值：同长乱序数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp020260', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020260 begin');
      const result: boolean = compareArray(new Uint8Array([10,11,12]), new Uint8Array([12,11,10]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020260 end');
    })

    /**
     * @tc.name   testParseCmp020261
     * @tc.number SUB_ASSET_PARSECMP_0261
     * @tc.desc   非法值：同长乱序数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp020261', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020261 begin');
      const result: boolean = compareArray(new Uint8Array([11,12,13]), new Uint8Array([13,12,11]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020261 end');
    })

    /**
     * @tc.name   testParseCmp020262
     * @tc.number SUB_ASSET_PARSECMP_0262
     * @tc.desc   非法值：同长乱序数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp020262', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020262 begin');
      const result: boolean = compareArray(new Uint8Array([12,13,14]), new Uint8Array([14,13,12]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020262 end');
    })

    /**
     * @tc.name   testParseCmp020263
     * @tc.number SUB_ASSET_PARSECMP_0263
     * @tc.desc   非法值：同长乱序数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp020263', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020263 begin');
      const result: boolean = compareArray(new Uint8Array([13,14,15]), new Uint8Array([15,14,13]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020263 end');
    })

    /**
     * @tc.name   testParseCmp020264
     * @tc.number SUB_ASSET_PARSECMP_0264
     * @tc.desc   非法值：同长乱序数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp020264', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020264 begin');
      const result: boolean = compareArray(new Uint8Array([14,15,16]), new Uint8Array([16,15,14]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020264 end');
    })

    /**
     * @tc.name   testParseCmp020265
     * @tc.number SUB_ASSET_PARSECMP_0265
     * @tc.desc   非法值：同长乱序数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp020265', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020265 begin');
      const result: boolean = compareArray(new Uint8Array([15,16,17]), new Uint8Array([17,16,15]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020265 end');
    })

    /**
     * @tc.name   testParseCmp020266
     * @tc.number SUB_ASSET_PARSECMP_0266
     * @tc.desc   非法值：同长乱序数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp020266', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020266 begin');
      const result: boolean = compareArray(new Uint8Array([16,17,18]), new Uint8Array([18,17,16]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020266 end');
    })

    /**
     * @tc.name   testParseCmp020267
     * @tc.number SUB_ASSET_PARSECMP_0267
     * @tc.desc   非法值：同长乱序数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp020267', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020267 begin');
      const result: boolean = compareArray(new Uint8Array([17,18,19]), new Uint8Array([19,18,17]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020267 end');
    })

    /**
     * @tc.name   testParseCmp020268
     * @tc.number SUB_ASSET_PARSECMP_0268
     * @tc.desc   非法值：同长乱序数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp020268', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020268 begin');
      const result: boolean = compareArray(new Uint8Array([18,19,20]), new Uint8Array([20,19,18]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020268 end');
    })

    /**
     * @tc.name   testParseCmp020269
     * @tc.number SUB_ASSET_PARSECMP_0269
     * @tc.desc   非法值：同长乱序数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp020269', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020269 begin');
      const result: boolean = compareArray(new Uint8Array([19,20,21]), new Uint8Array([21,20,19]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020269 end');
    })

    /**
     * @tc.name   testParseCmp020270
     * @tc.number SUB_ASSET_PARSECMP_0270
     * @tc.desc   非法值：同长乱序数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp020270', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020270 begin');
      const result: boolean = compareArray(new Uint8Array([20,21,22]), new Uint8Array([22,21,20]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020270 end');
    })

    /**
     * @tc.name   testParseCmp020271
     * @tc.number SUB_ASSET_PARSECMP_0271
     * @tc.desc   边界值：前缀关系数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp020271', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020271 begin');
      const result: boolean = compareArray(new Uint8Array([1,2,3]), new Uint8Array([1,2]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020271 end');
    })

    /**
     * @tc.name   testParseCmp020272
     * @tc.number SUB_ASSET_PARSECMP_0272
     * @tc.desc   边界值：前缀关系数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp020272', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020272 begin');
      const result: boolean = compareArray(new Uint8Array([2,3,4]), new Uint8Array([2,3]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020272 end');
    })

    /**
     * @tc.name   testParseCmp020273
     * @tc.number SUB_ASSET_PARSECMP_0273
     * @tc.desc   边界值：前缀关系数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp020273', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020273 begin');
      const result: boolean = compareArray(new Uint8Array([3,4,5]), new Uint8Array([3,4]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020273 end');
    })

    /**
     * @tc.name   testParseCmp020274
     * @tc.number SUB_ASSET_PARSECMP_0274
     * @tc.desc   边界值：前缀关系数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp020274', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020274 begin');
      const result: boolean = compareArray(new Uint8Array([4,5,6]), new Uint8Array([4,5]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020274 end');
    })

    /**
     * @tc.name   testParseCmp020275
     * @tc.number SUB_ASSET_PARSECMP_0275
     * @tc.desc   边界值：前缀关系数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp020275', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020275 begin');
      const result: boolean = compareArray(new Uint8Array([5,6,7]), new Uint8Array([5,6]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020275 end');
    })

    /**
     * @tc.name   testParseCmp020276
     * @tc.number SUB_ASSET_PARSECMP_0276
     * @tc.desc   边界值：前缀关系数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp020276', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020276 begin');
      const result: boolean = compareArray(new Uint8Array([6,7,8]), new Uint8Array([6,7]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020276 end');
    })

    /**
     * @tc.name   testParseCmp020277
     * @tc.number SUB_ASSET_PARSECMP_0277
     * @tc.desc   边界值：前缀关系数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp020277', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020277 begin');
      const result: boolean = compareArray(new Uint8Array([7,8,9]), new Uint8Array([7,8]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020277 end');
    })

    /**
     * @tc.name   testParseCmp020278
     * @tc.number SUB_ASSET_PARSECMP_0278
     * @tc.desc   边界值：前缀关系数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp020278', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020278 begin');
      const result: boolean = compareArray(new Uint8Array([8,9,10]), new Uint8Array([8,9]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020278 end');
    })

    /**
     * @tc.name   testParseCmp020279
     * @tc.number SUB_ASSET_PARSECMP_0279
     * @tc.desc   边界值：前缀关系数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp020279', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020279 begin');
      const result: boolean = compareArray(new Uint8Array([9,10,11]), new Uint8Array([9,10]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020279 end');
    })

    /**
     * @tc.name   testParseCmp020280
     * @tc.number SUB_ASSET_PARSECMP_0280
     * @tc.desc   边界值：前缀关系数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp020280', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020280 begin');
      const result: boolean = compareArray(new Uint8Array([10,11,12]), new Uint8Array([10,11]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020280 end');
    })

    /**
     * @tc.name   testParseCmp020281
     * @tc.number SUB_ASSET_PARSECMP_0281
     * @tc.desc   边界值：前缀关系数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp020281', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020281 begin');
      const result: boolean = compareArray(new Uint8Array([11,12,13]), new Uint8Array([11,12]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020281 end');
    })

    /**
     * @tc.name   testParseCmp020282
     * @tc.number SUB_ASSET_PARSECMP_0282
     * @tc.desc   边界值：前缀关系数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp020282', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020282 begin');
      const result: boolean = compareArray(new Uint8Array([12,13,14]), new Uint8Array([12,13]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020282 end');
    })

    /**
     * @tc.name   testParseCmp020283
     * @tc.number SUB_ASSET_PARSECMP_0283
     * @tc.desc   边界值：前缀关系数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp020283', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020283 begin');
      const result: boolean = compareArray(new Uint8Array([13,14,15]), new Uint8Array([13,14]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020283 end');
    })

    /**
     * @tc.name   testParseCmp020284
     * @tc.number SUB_ASSET_PARSECMP_0284
     * @tc.desc   边界值：前缀关系数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp020284', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020284 begin');
      const result: boolean = compareArray(new Uint8Array([14,15,16]), new Uint8Array([14,15]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020284 end');
    })

    /**
     * @tc.name   testParseCmp020285
     * @tc.number SUB_ASSET_PARSECMP_0285
     * @tc.desc   边界值：前缀关系数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp020285', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020285 begin');
      const result: boolean = compareArray(new Uint8Array([15,16,17]), new Uint8Array([15,16]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020285 end');
    })

    /**
     * @tc.name   testParseCmp020286
     * @tc.number SUB_ASSET_PARSECMP_0286
     * @tc.desc   边界值：前缀关系数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp020286', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020286 begin');
      const result: boolean = compareArray(new Uint8Array([16,17,18]), new Uint8Array([16,17]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020286 end');
    })

    /**
     * @tc.name   testParseCmp020287
     * @tc.number SUB_ASSET_PARSECMP_0287
     * @tc.desc   边界值：前缀关系数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp020287', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020287 begin');
      const result: boolean = compareArray(new Uint8Array([17,18,19]), new Uint8Array([17,18]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020287 end');
    })

    /**
     * @tc.name   testParseCmp020288
     * @tc.number SUB_ASSET_PARSECMP_0288
     * @tc.desc   边界值：前缀关系数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp020288', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020288 begin');
      const result: boolean = compareArray(new Uint8Array([18,19,20]), new Uint8Array([18,19]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020288 end');
    })

    /**
     * @tc.name   testParseCmp020289
     * @tc.number SUB_ASSET_PARSECMP_0289
     * @tc.desc   边界值：前缀关系数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp020289', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020289 begin');
      const result: boolean = compareArray(new Uint8Array([19,20,21]), new Uint8Array([19,20]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020289 end');
    })

    /**
     * @tc.name   testParseCmp020290
     * @tc.number SUB_ASSET_PARSECMP_0290
     * @tc.desc   边界值：前缀关系数组比较不等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp020290', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020290 begin');
      const result: boolean = compareArray(new Uint8Array([20,21,22]), new Uint8Array([20,21]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020290 end');
    })

    /**
     * @tc.name   testParseCmp020291
     * @tc.number SUB_ASSET_PARSECMP_0291
     * @tc.desc   边界值：单字节数组比较相等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp020291', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020291 begin');
      const result: boolean = compareArray(new Uint8Array([9]), new Uint8Array([9]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020291 end');
    })

    /**
     * @tc.name   testParseCmp020292
     * @tc.number SUB_ASSET_PARSECMP_0292
     * @tc.desc   边界值：单字节数组比较相等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp020292', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020292 begin');
      const result: boolean = compareArray(new Uint8Array([9]), new Uint8Array([9]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020292 end');
    })

    /**
     * @tc.name   testParseCmp020293
     * @tc.number SUB_ASSET_PARSECMP_0293
     * @tc.desc   边界值：单字节数组比较相等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp020293', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020293 begin');
      const result: boolean = compareArray(new Uint8Array([9]), new Uint8Array([9]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020293 end');
    })

    /**
     * @tc.name   testParseCmp020294
     * @tc.number SUB_ASSET_PARSECMP_0294
     * @tc.desc   边界值：单字节数组比较相等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp020294', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020294 begin');
      const result: boolean = compareArray(new Uint8Array([9]), new Uint8Array([9]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020294 end');
    })

    /**
     * @tc.name   testParseCmp020295
     * @tc.number SUB_ASSET_PARSECMP_0295
     * @tc.desc   边界值：单字节数组比较相等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp020295', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020295 begin');
      const result: boolean = compareArray(new Uint8Array([9]), new Uint8Array([9]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020295 end');
    })

    /**
     * @tc.name   testParseCmp020296
     * @tc.number SUB_ASSET_PARSECMP_0296
     * @tc.desc   边界值：单字节数组比较相等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp020296', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020296 begin');
      const result: boolean = compareArray(new Uint8Array([9]), new Uint8Array([9]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020296 end');
    })

    /**
     * @tc.name   testParseCmp020297
     * @tc.number SUB_ASSET_PARSECMP_0297
     * @tc.desc   边界值：单字节数组比较相等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp020297', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020297 begin');
      const result: boolean = compareArray(new Uint8Array([9]), new Uint8Array([9]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020297 end');
    })

    /**
     * @tc.name   testParseCmp020298
     * @tc.number SUB_ASSET_PARSECMP_0298
     * @tc.desc   边界值：单字节数组比较相等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp020298', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020298 begin');
      const result: boolean = compareArray(new Uint8Array([9]), new Uint8Array([9]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020298 end');
    })

    /**
     * @tc.name   testParseCmp020299
     * @tc.number SUB_ASSET_PARSECMP_0299
     * @tc.desc   边界值：单字节数组比较相等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp020299', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020299 begin');
      const result: boolean = compareArray(new Uint8Array([9]), new Uint8Array([9]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020299 end');
    })

    /**
     * @tc.name   testParseCmp020300
     * @tc.number SUB_ASSET_PARSECMP_0300
     * @tc.desc   边界值：单字节数组比较相等
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCmp020300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020300 begin');
      const result: boolean = compareArray(new Uint8Array([9]), new Uint8Array([9]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(typeof result === 'boolean'));
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseCmp020300 end');
    })

  })
}
