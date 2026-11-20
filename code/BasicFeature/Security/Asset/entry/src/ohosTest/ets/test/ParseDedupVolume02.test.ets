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
import { removeDuplicateAndSort } from '../../../main/ets/model/AssetModel';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[Sample_Asset]';

export default function parseDedupVolume02() {
  describe('ParseDedupVolume02Test', () => {

    /**
     * @tc.name   testParseDedup020151
     * @tc.number SUB_ASSET_PARSEDEDUP_0151
     * @tc.desc   含重复与空段的数组过滤去重后按字典序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup020151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020151 begin');
      const sorted: string[] = removeDuplicateAndSort(['b', 'a', 'b', '']);
      expect(sorted.length).assertEqual(2);
      expect(sorted[0]).assertEqual('a');
      expect(sorted[1]).assertEqual('b');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020151 end');
    })

    /**
     * @tc.name   testParseDedup020152
     * @tc.number SUB_ASSET_PARSEDEDUP_0152
     * @tc.desc   合法值：中文标签数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup020152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020152 begin');
      const result: string[] = removeDuplicateAndSort(["标签丙","标签甲","标签乙1"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["标签丙","标签乙1","标签甲"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["标签丙","标签乙1","标签甲"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020152 end');
    })

    /**
     * @tc.name   testParseDedup020153
     * @tc.number SUB_ASSET_PARSEDEDUP_0153
     * @tc.desc   合法值：中文标签数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup020153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020153 begin');
      const result: string[] = removeDuplicateAndSort(["标签丙","标签甲","标签乙2"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["标签丙","标签乙2","标签甲"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["标签丙","标签乙2","标签甲"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020153 end');
    })

    /**
     * @tc.name   testParseDedup020154
     * @tc.number SUB_ASSET_PARSEDEDUP_0154
     * @tc.desc   合法值：中文标签数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup020154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020154 begin');
      const result: string[] = removeDuplicateAndSort(["标签丙","标签甲","标签乙3"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["标签丙","标签乙3","标签甲"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["标签丙","标签乙3","标签甲"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020154 end');
    })

    /**
     * @tc.name   testParseDedup020155
     * @tc.number SUB_ASSET_PARSEDEDUP_0155
     * @tc.desc   合法值：中文标签数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup020155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020155 begin');
      const result: string[] = removeDuplicateAndSort(["标签丙","标签甲","标签乙4"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["标签丙","标签乙4","标签甲"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["标签丙","标签乙4","标签甲"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020155 end');
    })

    /**
     * @tc.name   testParseDedup020156
     * @tc.number SUB_ASSET_PARSEDEDUP_0156
     * @tc.desc   合法值：中文标签数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup020156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020156 begin');
      const result: string[] = removeDuplicateAndSort(["标签丙","标签甲","标签乙5"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["标签丙","标签乙5","标签甲"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["标签丙","标签乙5","标签甲"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020156 end');
    })

    /**
     * @tc.name   testParseDedup020157
     * @tc.number SUB_ASSET_PARSEDEDUP_0157
     * @tc.desc   合法值：中文标签数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup020157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020157 begin');
      const result: string[] = removeDuplicateAndSort(["标签丙","标签甲","标签乙6"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["标签丙","标签乙6","标签甲"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["标签丙","标签乙6","标签甲"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020157 end');
    })

    /**
     * @tc.name   testParseDedup020158
     * @tc.number SUB_ASSET_PARSEDEDUP_0158
     * @tc.desc   合法值：中文标签数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup020158', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020158 begin');
      const result: string[] = removeDuplicateAndSort(["标签丙","标签甲","标签乙7"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["标签丙","标签乙7","标签甲"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["标签丙","标签乙7","标签甲"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020158 end');
    })

    /**
     * @tc.name   testParseDedup020159
     * @tc.number SUB_ASSET_PARSEDEDUP_0159
     * @tc.desc   合法值：中文标签数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup020159', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020159 begin');
      const result: string[] = removeDuplicateAndSort(["标签丙","标签甲","标签乙8"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["标签丙","标签乙8","标签甲"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["标签丙","标签乙8","标签甲"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020159 end');
    })

    /**
     * @tc.name   testParseDedup020160
     * @tc.number SUB_ASSET_PARSEDEDUP_0160
     * @tc.desc   合法值：中文标签数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup020160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020160 begin');
      const result: string[] = removeDuplicateAndSort(["标签丙","标签甲","标签乙9"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["标签丙","标签乙9","标签甲"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["标签丙","标签乙9","标签甲"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020160 end');
    })

    /**
     * @tc.name   testParseDedup020161
     * @tc.number SUB_ASSET_PARSEDEDUP_0161
     * @tc.desc   合法值：中文标签数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup020161', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020161 begin');
      const result: string[] = removeDuplicateAndSort(["标签丙","标签甲","标签乙10"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["标签丙","标签乙10","标签甲"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["标签丙","标签乙10","标签甲"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020161 end');
    })

    /**
     * @tc.name   testParseDedup020162
     * @tc.number SUB_ASSET_PARSEDEDUP_0162
     * @tc.desc   合法值：中文标签数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup020162', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020162 begin');
      const result: string[] = removeDuplicateAndSort(["标签丙","标签甲","标签乙11"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["标签丙","标签乙11","标签甲"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["标签丙","标签乙11","标签甲"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020162 end');
    })

    /**
     * @tc.name   testParseDedup020163
     * @tc.number SUB_ASSET_PARSEDEDUP_0163
     * @tc.desc   合法值：中文标签数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup020163', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020163 begin');
      const result: string[] = removeDuplicateAndSort(["标签丙","标签甲","标签乙12"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["标签丙","标签乙12","标签甲"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["标签丙","标签乙12","标签甲"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020163 end');
    })

    /**
     * @tc.name   testParseDedup020164
     * @tc.number SUB_ASSET_PARSEDEDUP_0164
     * @tc.desc   合法值：中文标签数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup020164', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020164 begin');
      const result: string[] = removeDuplicateAndSort(["标签丙","标签甲","标签乙13"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["标签丙","标签乙13","标签甲"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["标签丙","标签乙13","标签甲"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020164 end');
    })

    /**
     * @tc.name   testParseDedup020165
     * @tc.number SUB_ASSET_PARSEDEDUP_0165
     * @tc.desc   合法值：中文标签数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup020165', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020165 begin');
      const result: string[] = removeDuplicateAndSort(["标签丙","标签甲","标签乙14"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["标签丙","标签乙14","标签甲"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["标签丙","标签乙14","标签甲"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020165 end');
    })

    /**
     * @tc.name   testParseDedup020166
     * @tc.number SUB_ASSET_PARSEDEDUP_0166
     * @tc.desc   合法值：中文标签数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup020166', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020166 begin');
      const result: string[] = removeDuplicateAndSort(["标签丙","标签甲","标签乙15"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["标签丙","标签乙15","标签甲"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["标签丙","标签乙15","标签甲"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020166 end');
    })

    /**
     * @tc.name   testParseDedup020167
     * @tc.number SUB_ASSET_PARSEDEDUP_0167
     * @tc.desc   合法值：中文标签数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup020167', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020167 begin');
      const result: string[] = removeDuplicateAndSort(["标签丙","标签甲","标签乙16"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["标签丙","标签乙16","标签甲"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["标签丙","标签乙16","标签甲"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020167 end');
    })

    /**
     * @tc.name   testParseDedup020168
     * @tc.number SUB_ASSET_PARSEDEDUP_0168
     * @tc.desc   合法值：中文标签数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup020168', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020168 begin');
      const result: string[] = removeDuplicateAndSort(["标签丙","标签甲","标签乙17"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["标签丙","标签乙17","标签甲"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["标签丙","标签乙17","标签甲"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020168 end');
    })

    /**
     * @tc.name   testParseDedup020169
     * @tc.number SUB_ASSET_PARSEDEDUP_0169
     * @tc.desc   合法值：中文标签数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup020169', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020169 begin');
      const result: string[] = removeDuplicateAndSort(["标签丙","标签甲","标签乙18"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["标签丙","标签乙18","标签甲"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["标签丙","标签乙18","标签甲"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020169 end');
    })

    /**
     * @tc.name   testParseDedup020170
     * @tc.number SUB_ASSET_PARSEDEDUP_0170
     * @tc.desc   合法值：中文标签数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup020170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020170 begin');
      const result: string[] = removeDuplicateAndSort(["标签丙","标签甲","标签乙19"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["标签丙","标签乙19","标签甲"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["标签丙","标签乙19","标签甲"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020170 end');
    })

    /**
     * @tc.name   testParseDedup020171
     * @tc.number SUB_ASSET_PARSEDEDUP_0171
     * @tc.desc   合法值：中文标签数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup020171', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020171 begin');
      const result: string[] = removeDuplicateAndSort(["标签丙","标签甲","标签乙20"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["标签丙","标签乙20","标签甲"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["标签丙","标签乙20","标签甲"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020171 end');
    })

    /**
     * @tc.name   testParseDedup020172
     * @tc.number SUB_ASSET_PARSEDEDUP_0172
     * @tc.desc   合法值：中文标签数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup020172', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020172 begin');
      const result: string[] = removeDuplicateAndSort(["标签丙","标签甲","标签乙21"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["标签丙","标签乙21","标签甲"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["标签丙","标签乙21","标签甲"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020172 end');
    })

    /**
     * @tc.name   testParseDedup020173
     * @tc.number SUB_ASSET_PARSEDEDUP_0173
     * @tc.desc   合法值：中文标签数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup020173', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020173 begin');
      const result: string[] = removeDuplicateAndSort(["标签丙","标签甲","标签乙22"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["标签丙","标签乙22","标签甲"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["标签丙","标签乙22","标签甲"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020173 end');
    })

    /**
     * @tc.name   testParseDedup020174
     * @tc.number SUB_ASSET_PARSEDEDUP_0174
     * @tc.desc   合法值：中文标签数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup020174', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020174 begin');
      const result: string[] = removeDuplicateAndSort(["标签丙","标签甲","标签乙23"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["标签丙","标签乙23","标签甲"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["标签丙","标签乙23","标签甲"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020174 end');
    })

    /**
     * @tc.name   testParseDedup020175
     * @tc.number SUB_ASSET_PARSEDEDUP_0175
     * @tc.desc   合法值：中文标签数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup020175', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020175 begin');
      const result: string[] = removeDuplicateAndSort(["标签丙","标签甲","标签乙24"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["标签丙","标签乙24","标签甲"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["标签丙","标签乙24","标签甲"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020175 end');
    })

    /**
     * @tc.name   testParseDedup020176
     * @tc.number SUB_ASSET_PARSEDEDUP_0176
     * @tc.desc   合法值：中文标签数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup020176', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020176 begin');
      const result: string[] = removeDuplicateAndSort(["标签丙","标签甲","标签乙25"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["标签丙","标签乙25","标签甲"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["标签丙","标签乙25","标签甲"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020176 end');
    })

    /**
     * @tc.name   testParseDedup020177
     * @tc.number SUB_ASSET_PARSEDEDUP_0177
     * @tc.desc   合法值：中文标签数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup020177', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020177 begin');
      const result: string[] = removeDuplicateAndSort(["标签丙","标签甲","标签乙26"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["标签丙","标签乙26","标签甲"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["标签丙","标签乙26","标签甲"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020177 end');
    })

    /**
     * @tc.name   testParseDedup020178
     * @tc.number SUB_ASSET_PARSEDEDUP_0178
     * @tc.desc   合法值：中文标签数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup020178', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020178 begin');
      const result: string[] = removeDuplicateAndSort(["标签丙","标签甲","标签乙27"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["标签丙","标签乙27","标签甲"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["标签丙","标签乙27","标签甲"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020178 end');
    })

    /**
     * @tc.name   testParseDedup020179
     * @tc.number SUB_ASSET_PARSEDEDUP_0179
     * @tc.desc   合法值：中文标签数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup020179', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020179 begin');
      const result: string[] = removeDuplicateAndSort(["标签丙","标签甲","标签乙28"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["标签丙","标签乙28","标签甲"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["标签丙","标签乙28","标签甲"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020179 end');
    })

    /**
     * @tc.name   testParseDedup020180
     * @tc.number SUB_ASSET_PARSEDEDUP_0180
     * @tc.desc   合法值：中文标签数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup020180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020180 begin');
      const result: string[] = removeDuplicateAndSort(["标签丙","标签甲","标签乙29"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["标签丙","标签乙29","标签甲"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["标签丙","标签乙29","标签甲"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020180 end');
    })

    /**
     * @tc.name   testParseDedup020181
     * @tc.number SUB_ASSET_PARSEDEDUP_0181
     * @tc.desc   合法值：中文标签数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup020181', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020181 begin');
      const result: string[] = removeDuplicateAndSort(["标签丙","标签甲","标签乙30"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["标签丙","标签乙30","标签甲"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["标签丙","标签乙30","标签甲"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020181 end');
    })

    /**
     * @tc.name   testParseDedup020182
     * @tc.number SUB_ASSET_PARSEDEDUP_0182
     * @tc.desc   合法值：中文标签数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup020182', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020182 begin');
      const result: string[] = removeDuplicateAndSort(["标签丙","标签甲","标签乙31"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["标签丙","标签乙31","标签甲"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["标签丙","标签乙31","标签甲"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020182 end');
    })

    /**
     * @tc.name   testParseDedup020183
     * @tc.number SUB_ASSET_PARSEDEDUP_0183
     * @tc.desc   合法值：中文标签数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup020183', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020183 begin');
      const result: string[] = removeDuplicateAndSort(["标签丙","标签甲","标签乙32"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["标签丙","标签乙32","标签甲"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["标签丙","标签乙32","标签甲"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020183 end');
    })

    /**
     * @tc.name   testParseDedup020184
     * @tc.number SUB_ASSET_PARSEDEDUP_0184
     * @tc.desc   合法值：中文标签数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup020184', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020184 begin');
      const result: string[] = removeDuplicateAndSort(["标签丙","标签甲","标签乙33"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["标签丙","标签乙33","标签甲"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["标签丙","标签乙33","标签甲"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020184 end');
    })

    /**
     * @tc.name   testParseDedup020185
     * @tc.number SUB_ASSET_PARSEDEDUP_0185
     * @tc.desc   合法值：中文标签数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup020185', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020185 begin');
      const result: string[] = removeDuplicateAndSort(["标签丙","标签甲","标签乙34"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["标签丙","标签乙34","标签甲"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["标签丙","标签乙34","标签甲"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020185 end');
    })

    /**
     * @tc.name   testParseDedup020186
     * @tc.number SUB_ASSET_PARSEDEDUP_0186
     * @tc.desc   合法值：中文标签数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup020186', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020186 begin');
      const result: string[] = removeDuplicateAndSort(["标签丙","标签甲","标签乙35"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["标签丙","标签乙35","标签甲"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["标签丙","标签乙35","标签甲"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020186 end');
    })

    /**
     * @tc.name   testParseDedup020187
     * @tc.number SUB_ASSET_PARSEDEDUP_0187
     * @tc.desc   合法值：中文标签数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup020187', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020187 begin');
      const result: string[] = removeDuplicateAndSort(["标签丙","标签甲","标签乙36"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["标签丙","标签乙36","标签甲"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["标签丙","标签乙36","标签甲"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020187 end');
    })

    /**
     * @tc.name   testParseDedup020188
     * @tc.number SUB_ASSET_PARSEDEDUP_0188
     * @tc.desc   合法值：中文标签数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup020188', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020188 begin');
      const result: string[] = removeDuplicateAndSort(["标签丙","标签甲","标签乙37"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["标签丙","标签乙37","标签甲"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["标签丙","标签乙37","标签甲"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020188 end');
    })

    /**
     * @tc.name   testParseDedup020189
     * @tc.number SUB_ASSET_PARSEDEDUP_0189
     * @tc.desc   合法值：中文标签数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup020189', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020189 begin');
      const result: string[] = removeDuplicateAndSort(["标签丙","标签甲","标签乙38"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["标签丙","标签乙38","标签甲"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["标签丙","标签乙38","标签甲"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020189 end');
    })

    /**
     * @tc.name   testParseDedup020190
     * @tc.number SUB_ASSET_PARSEDEDUP_0190
     * @tc.desc   合法值：中文标签数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup020190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020190 begin');
      const result: string[] = removeDuplicateAndSort(["标签丙","标签甲","标签乙39"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["标签丙","标签乙39","标签甲"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["标签丙","标签乙39","标签甲"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020190 end');
    })

    /**
     * @tc.name   testParseDedup020191
     * @tc.number SUB_ASSET_PARSEDEDUP_0191
     * @tc.desc   合法值：中文标签数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup020191', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020191 begin');
      const result: string[] = removeDuplicateAndSort(["标签丙","标签甲","标签乙40"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["标签丙","标签乙40","标签甲"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["标签丙","标签乙40","标签甲"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020191 end');
    })

    /**
     * @tc.name   testParseDedup020192
     * @tc.number SUB_ASSET_PARSEDEDUP_0192
     * @tc.desc   合法值：中文标签数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup020192', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020192 begin');
      const result: string[] = removeDuplicateAndSort(["标签丙","标签甲","标签乙41"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["标签丙","标签乙41","标签甲"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["标签丙","标签乙41","标签甲"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020192 end');
    })

    /**
     * @tc.name   testParseDedup020193
     * @tc.number SUB_ASSET_PARSEDEDUP_0193
     * @tc.desc   合法值：中文标签数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup020193', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020193 begin');
      const result: string[] = removeDuplicateAndSort(["标签丙","标签甲","标签乙42"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["标签丙","标签乙42","标签甲"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["标签丙","标签乙42","标签甲"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020193 end');
    })

    /**
     * @tc.name   testParseDedup020194
     * @tc.number SUB_ASSET_PARSEDEDUP_0194
     * @tc.desc   合法值：中文标签数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup020194', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020194 begin');
      const result: string[] = removeDuplicateAndSort(["标签丙","标签甲","标签乙43"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["标签丙","标签乙43","标签甲"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["标签丙","标签乙43","标签甲"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020194 end');
    })

    /**
     * @tc.name   testParseDedup020195
     * @tc.number SUB_ASSET_PARSEDEDUP_0195
     * @tc.desc   合法值：中文标签数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup020195', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020195 begin');
      const result: string[] = removeDuplicateAndSort(["标签丙","标签甲","标签乙44"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["标签丙","标签乙44","标签甲"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["标签丙","标签乙44","标签甲"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020195 end');
    })

    /**
     * @tc.name   testParseDedup020196
     * @tc.number SUB_ASSET_PARSEDEDUP_0196
     * @tc.desc   合法值：中文标签数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup020196', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020196 begin');
      const result: string[] = removeDuplicateAndSort(["标签丙","标签甲","标签乙45"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["标签丙","标签乙45","标签甲"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["标签丙","标签乙45","标签甲"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020196 end');
    })

    /**
     * @tc.name   testParseDedup020197
     * @tc.number SUB_ASSET_PARSEDEDUP_0197
     * @tc.desc   合法值：中文标签数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup020197', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020197 begin');
      const result: string[] = removeDuplicateAndSort(["标签丙","标签甲","标签乙46"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["标签丙","标签乙46","标签甲"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["标签丙","标签乙46","标签甲"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020197 end');
    })

    /**
     * @tc.name   testParseDedup020198
     * @tc.number SUB_ASSET_PARSEDEDUP_0198
     * @tc.desc   合法值：中文标签数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup020198', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020198 begin');
      const result: string[] = removeDuplicateAndSort(["标签丙","标签甲","标签乙47"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["标签丙","标签乙47","标签甲"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["标签丙","标签乙47","标签甲"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020198 end');
    })

    /**
     * @tc.name   testParseDedup020199
     * @tc.number SUB_ASSET_PARSEDEDUP_0199
     * @tc.desc   合法值：中文标签数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup020199', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020199 begin');
      const result: string[] = removeDuplicateAndSort(["标签丙","标签甲","标签乙48"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["标签丙","标签乙48","标签甲"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["标签丙","标签乙48","标签甲"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020199 end');
    })

    /**
     * @tc.name   testParseDedup020200
     * @tc.number SUB_ASSET_PARSEDEDUP_0200
     * @tc.desc   合法值：中文标签数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup020200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020200 begin');
      const result: string[] = removeDuplicateAndSort(["标签丙","标签甲","标签乙49"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["标签丙","标签乙49","标签甲"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["标签丙","标签乙49","标签甲"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020200 end');
    })

    /**
     * @tc.name   testParseDedup020201
     * @tc.number SUB_ASSET_PARSEDEDUP_0201
     * @tc.desc   合法值：中文标签数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup020201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020201 begin');
      const result: string[] = removeDuplicateAndSort(["标签丙","标签甲","标签乙50"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["标签丙","标签乙50","标签甲"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["标签丙","标签乙50","标签甲"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020201 end');
    })

    /**
     * @tc.name   testParseDedup020202
     * @tc.number SUB_ASSET_PARSEDEDUP_0202
     * @tc.desc   合法值：中文标签数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup020202', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020202 begin');
      const result: string[] = removeDuplicateAndSort(["标签丙","标签甲","标签乙51"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["标签丙","标签乙51","标签甲"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["标签丙","标签乙51","标签甲"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020202 end');
    })

    /**
     * @tc.name   testParseDedup020203
     * @tc.number SUB_ASSET_PARSEDEDUP_0203
     * @tc.desc   合法值：中文标签数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup020203', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020203 begin');
      const result: string[] = removeDuplicateAndSort(["标签丙","标签甲","标签乙52"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["标签丙","标签乙52","标签甲"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["标签丙","标签乙52","标签甲"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020203 end');
    })

    /**
     * @tc.name   testParseDedup020204
     * @tc.number SUB_ASSET_PARSEDEDUP_0204
     * @tc.desc   合法值：中文标签数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup020204', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020204 begin');
      const result: string[] = removeDuplicateAndSort(["标签丙","标签甲","标签乙53"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["标签丙","标签乙53","标签甲"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["标签丙","标签乙53","标签甲"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020204 end');
    })

    /**
     * @tc.name   testParseDedup020205
     * @tc.number SUB_ASSET_PARSEDEDUP_0205
     * @tc.desc   合法值：中文标签数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup020205', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020205 begin');
      const result: string[] = removeDuplicateAndSort(["标签丙","标签甲","标签乙54"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["标签丙","标签乙54","标签甲"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["标签丙","标签乙54","标签甲"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020205 end');
    })

    /**
     * @tc.name   testParseDedup020206
     * @tc.number SUB_ASSET_PARSEDEDUP_0206
     * @tc.desc   合法值：中文标签数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup020206', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020206 begin');
      const result: string[] = removeDuplicateAndSort(["标签丙","标签甲","标签乙55"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["标签丙","标签乙55","标签甲"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["标签丙","标签乙55","标签甲"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020206 end');
    })

    /**
     * @tc.name   testParseDedup020207
     * @tc.number SUB_ASSET_PARSEDEDUP_0207
     * @tc.desc   合法值：中文标签数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup020207', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020207 begin');
      const result: string[] = removeDuplicateAndSort(["标签丙","标签甲","标签乙56"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["标签丙","标签乙56","标签甲"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["标签丙","标签乙56","标签甲"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020207 end');
    })

    /**
     * @tc.name   testParseDedup020208
     * @tc.number SUB_ASSET_PARSEDEDUP_0208
     * @tc.desc   合法值：中文标签数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup020208', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020208 begin');
      const result: string[] = removeDuplicateAndSort(["标签丙","标签甲","标签乙57"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["标签丙","标签乙57","标签甲"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["标签丙","标签乙57","标签甲"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020208 end');
    })

    /**
     * @tc.name   testParseDedup020209
     * @tc.number SUB_ASSET_PARSEDEDUP_0209
     * @tc.desc   合法值：中文标签数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup020209', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020209 begin');
      const result: string[] = removeDuplicateAndSort(["标签丙","标签甲","标签乙58"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["标签丙","标签乙58","标签甲"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["标签丙","标签乙58","标签甲"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020209 end');
    })

    /**
     * @tc.name   testParseDedup020210
     * @tc.number SUB_ASSET_PARSEDEDUP_0210
     * @tc.desc   合法值：中文标签数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup020210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020210 begin');
      const result: string[] = removeDuplicateAndSort(["标签丙","标签甲","标签乙59"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["标签丙","标签乙59","标签甲"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["标签丙","标签乙59","标签甲"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020210 end');
    })

    /**
     * @tc.name   testParseDedup020211
     * @tc.number SUB_ASSET_PARSEDEDUP_0211
     * @tc.desc   组合值：中英混合数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup020211', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020211 begin');
      const result: string[] = removeDuplicateAndSort(["zh0","中0","EN"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["EN","zh0","中0"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["EN","zh0","中0"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020211 end');
    })

    /**
     * @tc.name   testParseDedup020212
     * @tc.number SUB_ASSET_PARSEDEDUP_0212
     * @tc.desc   组合值：中英混合数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup020212', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020212 begin');
      const result: string[] = removeDuplicateAndSort(["zh1","中1","EN"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["EN","zh1","中1"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["EN","zh1","中1"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020212 end');
    })

    /**
     * @tc.name   testParseDedup020213
     * @tc.number SUB_ASSET_PARSEDEDUP_0213
     * @tc.desc   组合值：中英混合数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup020213', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020213 begin');
      const result: string[] = removeDuplicateAndSort(["zh2","中2","EN"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["EN","zh2","中2"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["EN","zh2","中2"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020213 end');
    })

    /**
     * @tc.name   testParseDedup020214
     * @tc.number SUB_ASSET_PARSEDEDUP_0214
     * @tc.desc   组合值：中英混合数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup020214', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020214 begin');
      const result: string[] = removeDuplicateAndSort(["zh3","中3","EN"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["EN","zh3","中3"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["EN","zh3","中3"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020214 end');
    })

    /**
     * @tc.name   testParseDedup020215
     * @tc.number SUB_ASSET_PARSEDEDUP_0215
     * @tc.desc   组合值：中英混合数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup020215', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020215 begin');
      const result: string[] = removeDuplicateAndSort(["zh4","中4","EN"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["EN","zh4","中4"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["EN","zh4","中4"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020215 end');
    })

    /**
     * @tc.name   testParseDedup020216
     * @tc.number SUB_ASSET_PARSEDEDUP_0216
     * @tc.desc   组合值：中英混合数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup020216', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020216 begin');
      const result: string[] = removeDuplicateAndSort(["zh5","中5","EN"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["EN","zh5","中5"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["EN","zh5","中5"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020216 end');
    })

    /**
     * @tc.name   testParseDedup020217
     * @tc.number SUB_ASSET_PARSEDEDUP_0217
     * @tc.desc   组合值：中英混合数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup020217', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020217 begin');
      const result: string[] = removeDuplicateAndSort(["zh6","中6","EN"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["EN","zh6","中6"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["EN","zh6","中6"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020217 end');
    })

    /**
     * @tc.name   testParseDedup020218
     * @tc.number SUB_ASSET_PARSEDEDUP_0218
     * @tc.desc   组合值：中英混合数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup020218', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020218 begin');
      const result: string[] = removeDuplicateAndSort(["zh7","中7","EN"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["EN","zh7","中7"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["EN","zh7","中7"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020218 end');
    })

    /**
     * @tc.name   testParseDedup020219
     * @tc.number SUB_ASSET_PARSEDEDUP_0219
     * @tc.desc   组合值：中英混合数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup020219', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020219 begin');
      const result: string[] = removeDuplicateAndSort(["zh8","中8","EN"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["EN","zh8","中8"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["EN","zh8","中8"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020219 end');
    })

    /**
     * @tc.name   testParseDedup020220
     * @tc.number SUB_ASSET_PARSEDEDUP_0220
     * @tc.desc   组合值：中英混合数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup020220', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020220 begin');
      const result: string[] = removeDuplicateAndSort(["zh9","中9","EN"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["EN","zh9","中9"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["EN","zh9","中9"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020220 end');
    })

    /**
     * @tc.name   testParseDedup020221
     * @tc.number SUB_ASSET_PARSEDEDUP_0221
     * @tc.desc   组合值：中英混合数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup020221', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020221 begin');
      const result: string[] = removeDuplicateAndSort(["zh10","中10","EN"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["EN","zh10","中10"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["EN","zh10","中10"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020221 end');
    })

    /**
     * @tc.name   testParseDedup020222
     * @tc.number SUB_ASSET_PARSEDEDUP_0222
     * @tc.desc   组合值：中英混合数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup020222', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020222 begin');
      const result: string[] = removeDuplicateAndSort(["zh11","中11","EN"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["EN","zh11","中11"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["EN","zh11","中11"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020222 end');
    })

    /**
     * @tc.name   testParseDedup020223
     * @tc.number SUB_ASSET_PARSEDEDUP_0223
     * @tc.desc   组合值：中英混合数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup020223', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020223 begin');
      const result: string[] = removeDuplicateAndSort(["zh12","中12","EN"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["EN","zh12","中12"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["EN","zh12","中12"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020223 end');
    })

    /**
     * @tc.name   testParseDedup020224
     * @tc.number SUB_ASSET_PARSEDEDUP_0224
     * @tc.desc   组合值：中英混合数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup020224', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020224 begin');
      const result: string[] = removeDuplicateAndSort(["zh13","中13","EN"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["EN","zh13","中13"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["EN","zh13","中13"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020224 end');
    })

    /**
     * @tc.name   testParseDedup020225
     * @tc.number SUB_ASSET_PARSEDEDUP_0225
     * @tc.desc   组合值：中英混合数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup020225', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020225 begin');
      const result: string[] = removeDuplicateAndSort(["zh14","中14","EN"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["EN","zh14","中14"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["EN","zh14","中14"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020225 end');
    })

    /**
     * @tc.name   testParseDedup020226
     * @tc.number SUB_ASSET_PARSEDEDUP_0226
     * @tc.desc   组合值：中英混合数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup020226', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020226 begin');
      const result: string[] = removeDuplicateAndSort(["zh15","中15","EN"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["EN","zh15","中15"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["EN","zh15","中15"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020226 end');
    })

    /**
     * @tc.name   testParseDedup020227
     * @tc.number SUB_ASSET_PARSEDEDUP_0227
     * @tc.desc   组合值：中英混合数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup020227', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020227 begin');
      const result: string[] = removeDuplicateAndSort(["zh16","中16","EN"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["EN","zh16","中16"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["EN","zh16","中16"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020227 end');
    })

    /**
     * @tc.name   testParseDedup020228
     * @tc.number SUB_ASSET_PARSEDEDUP_0228
     * @tc.desc   组合值：中英混合数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup020228', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020228 begin');
      const result: string[] = removeDuplicateAndSort(["zh17","中17","EN"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["EN","zh17","中17"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["EN","zh17","中17"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020228 end');
    })

    /**
     * @tc.name   testParseDedup020229
     * @tc.number SUB_ASSET_PARSEDEDUP_0229
     * @tc.desc   组合值：中英混合数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup020229', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020229 begin');
      const result: string[] = removeDuplicateAndSort(["zh18","中18","EN"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["EN","zh18","中18"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["EN","zh18","中18"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020229 end');
    })

    /**
     * @tc.name   testParseDedup020230
     * @tc.number SUB_ASSET_PARSEDEDUP_0230
     * @tc.desc   组合值：中英混合数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup020230', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020230 begin');
      const result: string[] = removeDuplicateAndSort(["zh19","中19","EN"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["EN","zh19","中19"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["EN","zh19","中19"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020230 end');
    })

    /**
     * @tc.name   testParseDedup020231
     * @tc.number SUB_ASSET_PARSEDEDUP_0231
     * @tc.desc   组合值：中英混合数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup020231', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020231 begin');
      const result: string[] = removeDuplicateAndSort(["zh20","中20","EN"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["EN","zh20","中20"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["EN","zh20","中20"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020231 end');
    })

    /**
     * @tc.name   testParseDedup020232
     * @tc.number SUB_ASSET_PARSEDEDUP_0232
     * @tc.desc   组合值：中英混合数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup020232', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020232 begin');
      const result: string[] = removeDuplicateAndSort(["zh21","中21","EN"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["EN","zh21","中21"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["EN","zh21","中21"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020232 end');
    })

    /**
     * @tc.name   testParseDedup020233
     * @tc.number SUB_ASSET_PARSEDEDUP_0233
     * @tc.desc   组合值：中英混合数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup020233', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020233 begin');
      const result: string[] = removeDuplicateAndSort(["zh22","中22","EN"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["EN","zh22","中22"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["EN","zh22","中22"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020233 end');
    })

    /**
     * @tc.name   testParseDedup020234
     * @tc.number SUB_ASSET_PARSEDEDUP_0234
     * @tc.desc   组合值：中英混合数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup020234', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020234 begin');
      const result: string[] = removeDuplicateAndSort(["zh23","中23","EN"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["EN","zh23","中23"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["EN","zh23","中23"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020234 end');
    })

    /**
     * @tc.name   testParseDedup020235
     * @tc.number SUB_ASSET_PARSEDEDUP_0235
     * @tc.desc   组合值：中英混合数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup020235', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020235 begin');
      const result: string[] = removeDuplicateAndSort(["zh24","中24","EN"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["EN","zh24","中24"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["EN","zh24","中24"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020235 end');
    })

    /**
     * @tc.name   testParseDedup020236
     * @tc.number SUB_ASSET_PARSEDEDUP_0236
     * @tc.desc   组合值：中英混合数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup020236', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020236 begin');
      const result: string[] = removeDuplicateAndSort(["zh25","中25","EN"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["EN","zh25","中25"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["EN","zh25","中25"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020236 end');
    })

    /**
     * @tc.name   testParseDedup020237
     * @tc.number SUB_ASSET_PARSEDEDUP_0237
     * @tc.desc   组合值：中英混合数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup020237', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020237 begin');
      const result: string[] = removeDuplicateAndSort(["zh26","中26","EN"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["EN","zh26","中26"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["EN","zh26","中26"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020237 end');
    })

    /**
     * @tc.name   testParseDedup020238
     * @tc.number SUB_ASSET_PARSEDEDUP_0238
     * @tc.desc   组合值：中英混合数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup020238', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020238 begin');
      const result: string[] = removeDuplicateAndSort(["zh27","中27","EN"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["EN","zh27","中27"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["EN","zh27","中27"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020238 end');
    })

    /**
     * @tc.name   testParseDedup020239
     * @tc.number SUB_ASSET_PARSEDEDUP_0239
     * @tc.desc   组合值：中英混合数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup020239', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020239 begin');
      const result: string[] = removeDuplicateAndSort(["zh28","中28","EN"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["EN","zh28","中28"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["EN","zh28","中28"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020239 end');
    })

    /**
     * @tc.name   testParseDedup020240
     * @tc.number SUB_ASSET_PARSEDEDUP_0240
     * @tc.desc   组合值：中英混合数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup020240', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020240 begin');
      const result: string[] = removeDuplicateAndSort(["zh29","中29","EN"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["EN","zh29","中29"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["EN","zh29","中29"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020240 end');
    })

    /**
     * @tc.name   testParseDedup020241
     * @tc.number SUB_ASSET_PARSEDEDUP_0241
     * @tc.desc   组合值：中英混合数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup020241', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020241 begin');
      const result: string[] = removeDuplicateAndSort(["zh30","中30","EN"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["EN","zh30","中30"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["EN","zh30","中30"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020241 end');
    })

    /**
     * @tc.name   testParseDedup020242
     * @tc.number SUB_ASSET_PARSEDEDUP_0242
     * @tc.desc   组合值：中英混合数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup020242', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020242 begin');
      const result: string[] = removeDuplicateAndSort(["zh31","中31","EN"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["EN","zh31","中31"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["EN","zh31","中31"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020242 end');
    })

    /**
     * @tc.name   testParseDedup020243
     * @tc.number SUB_ASSET_PARSEDEDUP_0243
     * @tc.desc   组合值：中英混合数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup020243', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020243 begin');
      const result: string[] = removeDuplicateAndSort(["zh32","中32","EN"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["EN","zh32","中32"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["EN","zh32","中32"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020243 end');
    })

    /**
     * @tc.name   testParseDedup020244
     * @tc.number SUB_ASSET_PARSEDEDUP_0244
     * @tc.desc   组合值：中英混合数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup020244', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020244 begin');
      const result: string[] = removeDuplicateAndSort(["zh33","中33","EN"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["EN","zh33","中33"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["EN","zh33","中33"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020244 end');
    })

    /**
     * @tc.name   testParseDedup020245
     * @tc.number SUB_ASSET_PARSEDEDUP_0245
     * @tc.desc   组合值：中英混合数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup020245', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020245 begin');
      const result: string[] = removeDuplicateAndSort(["zh34","中34","EN"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["EN","zh34","中34"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["EN","zh34","中34"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020245 end');
    })

    /**
     * @tc.name   testParseDedup020246
     * @tc.number SUB_ASSET_PARSEDEDUP_0246
     * @tc.desc   组合值：中英混合数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup020246', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020246 begin');
      const result: string[] = removeDuplicateAndSort(["zh35","中35","EN"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["EN","zh35","中35"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["EN","zh35","中35"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020246 end');
    })

    /**
     * @tc.name   testParseDedup020247
     * @tc.number SUB_ASSET_PARSEDEDUP_0247
     * @tc.desc   组合值：中英混合数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup020247', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020247 begin');
      const result: string[] = removeDuplicateAndSort(["zh36","中36","EN"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["EN","zh36","中36"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["EN","zh36","中36"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020247 end');
    })

    /**
     * @tc.name   testParseDedup020248
     * @tc.number SUB_ASSET_PARSEDEDUP_0248
     * @tc.desc   组合值：中英混合数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup020248', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020248 begin');
      const result: string[] = removeDuplicateAndSort(["zh37","中37","EN"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["EN","zh37","中37"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["EN","zh37","中37"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020248 end');
    })

    /**
     * @tc.name   testParseDedup020249
     * @tc.number SUB_ASSET_PARSEDEDUP_0249
     * @tc.desc   组合值：中英混合数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup020249', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020249 begin');
      const result: string[] = removeDuplicateAndSort(["zh38","中38","EN"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["EN","zh38","中38"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["EN","zh38","中38"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020249 end');
    })

    /**
     * @tc.name   testParseDedup020250
     * @tc.number SUB_ASSET_PARSEDEDUP_0250
     * @tc.desc   组合值：中英混合数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup020250', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020250 begin');
      const result: string[] = removeDuplicateAndSort(["zh39","中39","EN"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["EN","zh39","中39"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["EN","zh39","中39"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020250 end');
    })

    /**
     * @tc.name   testParseDedup020251
     * @tc.number SUB_ASSET_PARSEDEDUP_0251
     * @tc.desc   极值：长标签重复去重
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup020251', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020251 begin');
      const result: string[] = removeDuplicateAndSort([
"LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL" +
        "LLLL0",
"LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL" +
          "LLLL0"]);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String([
"LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL" +
        "LLLL0"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify([
"LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL" +
        "LLLL0"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020251 end');
    })

    /**
     * @tc.name   testParseDedup020252
     * @tc.number SUB_ASSET_PARSEDEDUP_0252
     * @tc.desc   极值：长标签重复去重
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup020252', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020252 begin');
      const result: string[] = removeDuplicateAndSort([
"LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL" +
        "LLLL1",
"LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL" +
          "LLLL1"]);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String([
"LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL" +
        "LLLL1"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify([
"LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL" +
        "LLLL1"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020252 end');
    })

    /**
     * @tc.name   testParseDedup020253
     * @tc.number SUB_ASSET_PARSEDEDUP_0253
     * @tc.desc   极值：长标签重复去重
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup020253', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020253 begin');
      const result: string[] = removeDuplicateAndSort([
"LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL" +
        "LLLL2",
"LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL" +
          "LLLL2"]);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String([
"LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL" +
        "LLLL2"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify([
"LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL" +
        "LLLL2"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020253 end');
    })

    /**
     * @tc.name   testParseDedup020254
     * @tc.number SUB_ASSET_PARSEDEDUP_0254
     * @tc.desc   极值：长标签重复去重
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup020254', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020254 begin');
      const result: string[] = removeDuplicateAndSort([
"LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL" +
        "LLLL3",
"LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL" +
          "LLLL3"]);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String([
"LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL" +
        "LLLL3"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify([
"LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL" +
        "LLLL3"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020254 end');
    })

    /**
     * @tc.name   testParseDedup020255
     * @tc.number SUB_ASSET_PARSEDEDUP_0255
     * @tc.desc   极值：长标签重复去重
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup020255', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020255 begin');
      const result: string[] = removeDuplicateAndSort([
"LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL" +
        "LLLL4",
"LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL" +
          "LLLL4"]);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String([
"LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL" +
        "LLLL4"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify([
"LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL" +
        "LLLL4"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020255 end');
    })

    /**
     * @tc.name   testParseDedup020256
     * @tc.number SUB_ASSET_PARSEDEDUP_0256
     * @tc.desc   极值：长标签重复去重
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup020256', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020256 begin');
      const result: string[] = removeDuplicateAndSort([
"LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL" +
        "LLLL5",
"LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL" +
          "LLLL5"]);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String([
"LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL" +
        "LLLL5"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify([
"LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL" +
        "LLLL5"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020256 end');
    })

    /**
     * @tc.name   testParseDedup020257
     * @tc.number SUB_ASSET_PARSEDEDUP_0257
     * @tc.desc   极值：长标签重复去重
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup020257', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020257 begin');
      const result: string[] = removeDuplicateAndSort([
"LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL" +
        "LLLL6",
"LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL" +
          "LLLL6"]);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String([
"LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL" +
        "LLLL6"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify([
"LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL" +
        "LLLL6"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020257 end');
    })

    /**
     * @tc.name   testParseDedup020258
     * @tc.number SUB_ASSET_PARSEDEDUP_0258
     * @tc.desc   极值：长标签重复去重
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup020258', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020258 begin');
      const result: string[] = removeDuplicateAndSort([
"LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL" +
        "LLLL7",
"LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL" +
          "LLLL7"]);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String([
"LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL" +
        "LLLL7"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify([
"LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL" +
        "LLLL7"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020258 end');
    })

    /**
     * @tc.name   testParseDedup020259
     * @tc.number SUB_ASSET_PARSEDEDUP_0259
     * @tc.desc   极值：长标签重复去重
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup020259', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020259 begin');
      const result: string[] = removeDuplicateAndSort([
"LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL" +
        "LLLL8",
"LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL" +
          "LLLL8"]);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String([
"LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL" +
        "LLLL8"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify([
"LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL" +
        "LLLL8"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020259 end');
    })

    /**
     * @tc.name   testParseDedup020260
     * @tc.number SUB_ASSET_PARSEDEDUP_0260
     * @tc.desc   极值：长标签重复去重
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup020260', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020260 begin');
      const result: string[] = removeDuplicateAndSort([
"LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL" +
        "LLLL9",
"LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL" +
          "LLLL9"]);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String([
"LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL" +
        "LLLL9"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify([
"LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL" +
        "LLLL9"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020260 end');
    })

    /**
     * @tc.name   testParseDedup020261
     * @tc.number SUB_ASSET_PARSEDEDUP_0261
     * @tc.desc   极值：长标签重复去重
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup020261', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020261 begin');
      const result: string[] = removeDuplicateAndSort([
"LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL" +
        "LLLL10",
"LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL" +
          "LLLL10"]);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String([
"LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL" +
        "LLLL10"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify([
"LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL" +
        "LLLL10"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020261 end');
    })

    /**
     * @tc.name   testParseDedup020262
     * @tc.number SUB_ASSET_PARSEDEDUP_0262
     * @tc.desc   极值：长标签重复去重
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup020262', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020262 begin');
      const result: string[] = removeDuplicateAndSort([
"LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL" +
        "LLLL11",
"LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL" +
          "LLLL11"]);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String([
"LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL" +
        "LLLL11"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify([
"LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL" +
        "LLLL11"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020262 end');
    })

    /**
     * @tc.name   testParseDedup020263
     * @tc.number SUB_ASSET_PARSEDEDUP_0263
     * @tc.desc   极值：长标签重复去重
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup020263', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020263 begin');
      const result: string[] = removeDuplicateAndSort([
"LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL" +
        "LLLL12",
"LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL" +
          "LLLL12"]);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String([
"LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL" +
        "LLLL12"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify([
"LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL" +
        "LLLL12"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020263 end');
    })

    /**
     * @tc.name   testParseDedup020264
     * @tc.number SUB_ASSET_PARSEDEDUP_0264
     * @tc.desc   极值：长标签重复去重
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup020264', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020264 begin');
      const result: string[] = removeDuplicateAndSort([
"LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL" +
        "LLLL13",
"LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL" +
          "LLLL13"]);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String([
"LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL" +
        "LLLL13"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify([
"LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL" +
        "LLLL13"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020264 end');
    })

    /**
     * @tc.name   testParseDedup020265
     * @tc.number SUB_ASSET_PARSEDEDUP_0265
     * @tc.desc   极值：长标签重复去重
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup020265', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020265 begin');
      const result: string[] = removeDuplicateAndSort([
"LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL" +
        "LLLL14",
"LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL" +
          "LLLL14"]);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String([
"LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL" +
        "LLLL14"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify([
"LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL" +
        "LLLL14"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020265 end');
    })

    /**
     * @tc.name   testParseDedup020266
     * @tc.number SUB_ASSET_PARSEDEDUP_0266
     * @tc.desc   极值：长标签重复去重
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup020266', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020266 begin');
      const result: string[] = removeDuplicateAndSort([
"LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL" +
        "LLLL15",
"LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL" +
          "LLLL15"]);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String([
"LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL" +
        "LLLL15"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify([
"LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL" +
        "LLLL15"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020266 end');
    })

    /**
     * @tc.name   testParseDedup020267
     * @tc.number SUB_ASSET_PARSEDEDUP_0267
     * @tc.desc   极值：长标签重复去重
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup020267', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020267 begin');
      const result: string[] = removeDuplicateAndSort([
"LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL" +
        "LLLL16",
"LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL" +
          "LLLL16"]);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String([
"LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL" +
        "LLLL16"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify([
"LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL" +
        "LLLL16"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020267 end');
    })

    /**
     * @tc.name   testParseDedup020268
     * @tc.number SUB_ASSET_PARSEDEDUP_0268
     * @tc.desc   极值：长标签重复去重
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup020268', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020268 begin');
      const result: string[] = removeDuplicateAndSort([
"LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL" +
        "LLLL17",
"LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL" +
          "LLLL17"]);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String([
"LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL" +
        "LLLL17"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify([
"LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL" +
        "LLLL17"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020268 end');
    })

    /**
     * @tc.name   testParseDedup020269
     * @tc.number SUB_ASSET_PARSEDEDUP_0269
     * @tc.desc   极值：长标签重复去重
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup020269', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020269 begin');
      const result: string[] = removeDuplicateAndSort([
"LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL" +
        "LLLL18",
"LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL" +
          "LLLL18"]);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String([
"LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL" +
        "LLLL18"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify([
"LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL" +
        "LLLL18"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020269 end');
    })

    /**
     * @tc.name   testParseDedup020270
     * @tc.number SUB_ASSET_PARSEDEDUP_0270
     * @tc.desc   极值：长标签重复去重
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup020270', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020270 begin');
      const result: string[] = removeDuplicateAndSort([
"LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL" +
        "LLLL19",
"LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL" +
          "LLLL19"]);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String([
"LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL" +
        "LLLL19"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify([
"LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL" +
        "LLLL19"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020270 end');
    })

    /**
     * @tc.name   testParseDedup020271
     * @tc.number SUB_ASSET_PARSEDEDUP_0271
     * @tc.desc   非法值：含控制字符标签去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup020271', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020271 begin');
      const result: string[] = removeDuplicateAndSort(["a\u0000b","a\u0000b","c"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["a\u0000b","c"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["a\u0000b","c"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020271 end');
    })

    /**
     * @tc.name   testParseDedup020272
     * @tc.number SUB_ASSET_PARSEDEDUP_0272
     * @tc.desc   非法值：含控制字符标签去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup020272', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020272 begin');
      const result: string[] = removeDuplicateAndSort(["a\u0000b","a\u0000b","c"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["a\u0000b","c"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["a\u0000b","c"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020272 end');
    })

    /**
     * @tc.name   testParseDedup020273
     * @tc.number SUB_ASSET_PARSEDEDUP_0273
     * @tc.desc   非法值：含控制字符标签去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup020273', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020273 begin');
      const result: string[] = removeDuplicateAndSort(["a\u0000b","a\u0000b","c"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["a\u0000b","c"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["a\u0000b","c"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020273 end');
    })

    /**
     * @tc.name   testParseDedup020274
     * @tc.number SUB_ASSET_PARSEDEDUP_0274
     * @tc.desc   非法值：含控制字符标签去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup020274', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020274 begin');
      const result: string[] = removeDuplicateAndSort(["a\u0000b","a\u0000b","c"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["a\u0000b","c"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["a\u0000b","c"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020274 end');
    })

    /**
     * @tc.name   testParseDedup020275
     * @tc.number SUB_ASSET_PARSEDEDUP_0275
     * @tc.desc   非法值：含控制字符标签去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup020275', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020275 begin');
      const result: string[] = removeDuplicateAndSort(["a\u0000b","a\u0000b","c"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["a\u0000b","c"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["a\u0000b","c"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020275 end');
    })

    /**
     * @tc.name   testParseDedup020276
     * @tc.number SUB_ASSET_PARSEDEDUP_0276
     * @tc.desc   非法值：含控制字符标签去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup020276', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020276 begin');
      const result: string[] = removeDuplicateAndSort(["a\u0000b","a\u0000b","c"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["a\u0000b","c"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["a\u0000b","c"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020276 end');
    })

    /**
     * @tc.name   testParseDedup020277
     * @tc.number SUB_ASSET_PARSEDEDUP_0277
     * @tc.desc   非法值：含控制字符标签去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup020277', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020277 begin');
      const result: string[] = removeDuplicateAndSort(["a\u0000b","a\u0000b","c"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["a\u0000b","c"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["a\u0000b","c"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020277 end');
    })

    /**
     * @tc.name   testParseDedup020278
     * @tc.number SUB_ASSET_PARSEDEDUP_0278
     * @tc.desc   非法值：含控制字符标签去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup020278', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020278 begin');
      const result: string[] = removeDuplicateAndSort(["a\u0000b","a\u0000b","c"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["a\u0000b","c"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["a\u0000b","c"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020278 end');
    })

    /**
     * @tc.name   testParseDedup020279
     * @tc.number SUB_ASSET_PARSEDEDUP_0279
     * @tc.desc   非法值：含控制字符标签去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup020279', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020279 begin');
      const result: string[] = removeDuplicateAndSort(["a\u0000b","a\u0000b","c"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["a\u0000b","c"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["a\u0000b","c"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020279 end');
    })

    /**
     * @tc.name   testParseDedup020280
     * @tc.number SUB_ASSET_PARSEDEDUP_0280
     * @tc.desc   非法值：含控制字符标签去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup020280', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020280 begin');
      const result: string[] = removeDuplicateAndSort(["a\u0000b","a\u0000b","c"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["a\u0000b","c"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["a\u0000b","c"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020280 end');
    })

    /**
     * @tc.name   testParseDedup020281
     * @tc.number SUB_ASSET_PARSEDEDUP_0281
     * @tc.desc   组合值：emoji 标签去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup020281', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020281 begin');
      const result: string[] = removeDuplicateAndSort(["😀0","😀0","x"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["x","😀0"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["x","😀0"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020281 end');
    })

    /**
     * @tc.name   testParseDedup020282
     * @tc.number SUB_ASSET_PARSEDEDUP_0282
     * @tc.desc   组合值：emoji 标签去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup020282', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020282 begin');
      const result: string[] = removeDuplicateAndSort(["😀1","😀1","x"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["x","😀1"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["x","😀1"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020282 end');
    })

    /**
     * @tc.name   testParseDedup020283
     * @tc.number SUB_ASSET_PARSEDEDUP_0283
     * @tc.desc   组合值：emoji 标签去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup020283', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020283 begin');
      const result: string[] = removeDuplicateAndSort(["😀2","😀2","x"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["x","😀2"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["x","😀2"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020283 end');
    })

    /**
     * @tc.name   testParseDedup020284
     * @tc.number SUB_ASSET_PARSEDEDUP_0284
     * @tc.desc   组合值：emoji 标签去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup020284', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020284 begin');
      const result: string[] = removeDuplicateAndSort(["😀3","😀3","x"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["x","😀3"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["x","😀3"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020284 end');
    })

    /**
     * @tc.name   testParseDedup020285
     * @tc.number SUB_ASSET_PARSEDEDUP_0285
     * @tc.desc   组合值：emoji 标签去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup020285', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020285 begin');
      const result: string[] = removeDuplicateAndSort(["😀4","😀4","x"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["x","😀4"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["x","😀4"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020285 end');
    })

    /**
     * @tc.name   testParseDedup020286
     * @tc.number SUB_ASSET_PARSEDEDUP_0286
     * @tc.desc   组合值：emoji 标签去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup020286', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020286 begin');
      const result: string[] = removeDuplicateAndSort(["😀5","😀5","x"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["x","😀5"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["x","😀5"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020286 end');
    })

    /**
     * @tc.name   testParseDedup020287
     * @tc.number SUB_ASSET_PARSEDEDUP_0287
     * @tc.desc   组合值：emoji 标签去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup020287', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020287 begin');
      const result: string[] = removeDuplicateAndSort(["😀6","😀6","x"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["x","😀6"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["x","😀6"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020287 end');
    })

    /**
     * @tc.name   testParseDedup020288
     * @tc.number SUB_ASSET_PARSEDEDUP_0288
     * @tc.desc   组合值：emoji 标签去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup020288', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020288 begin');
      const result: string[] = removeDuplicateAndSort(["😀7","😀7","x"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["x","😀7"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["x","😀7"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020288 end');
    })

    /**
     * @tc.name   testParseDedup020289
     * @tc.number SUB_ASSET_PARSEDEDUP_0289
     * @tc.desc   组合值：emoji 标签去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup020289', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020289 begin');
      const result: string[] = removeDuplicateAndSort(["😀8","😀8","x"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["x","😀8"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["x","😀8"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020289 end');
    })

    /**
     * @tc.name   testParseDedup020290
     * @tc.number SUB_ASSET_PARSEDEDUP_0290
     * @tc.desc   组合值：emoji 标签去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup020290', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020290 begin');
      const result: string[] = removeDuplicateAndSort(["😀9","😀9","x"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["x","😀9"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["x","😀9"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020290 end');
    })

    /**
     * @tc.name   testParseDedup020291
     * @tc.number SUB_ASSET_PARSEDEDUP_0291
     * @tc.desc   组合值：emoji 标签去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup020291', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020291 begin');
      const result: string[] = removeDuplicateAndSort(["😀10","😀10","x"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["x","😀10"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["x","😀10"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020291 end');
    })

    /**
     * @tc.name   testParseDedup020292
     * @tc.number SUB_ASSET_PARSEDEDUP_0292
     * @tc.desc   组合值：emoji 标签去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup020292', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020292 begin');
      const result: string[] = removeDuplicateAndSort(["😀11","😀11","x"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["x","😀11"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["x","😀11"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020292 end');
    })

    /**
     * @tc.name   testParseDedup020293
     * @tc.number SUB_ASSET_PARSEDEDUP_0293
     * @tc.desc   组合值：emoji 标签去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup020293', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020293 begin');
      const result: string[] = removeDuplicateAndSort(["😀12","😀12","x"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["x","😀12"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["x","😀12"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020293 end');
    })

    /**
     * @tc.name   testParseDedup020294
     * @tc.number SUB_ASSET_PARSEDEDUP_0294
     * @tc.desc   组合值：emoji 标签去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup020294', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020294 begin');
      const result: string[] = removeDuplicateAndSort(["😀13","😀13","x"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["x","😀13"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["x","😀13"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020294 end');
    })

    /**
     * @tc.name   testParseDedup020295
     * @tc.number SUB_ASSET_PARSEDEDUP_0295
     * @tc.desc   组合值：emoji 标签去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup020295', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020295 begin');
      const result: string[] = removeDuplicateAndSort(["😀14","😀14","x"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["x","😀14"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["x","😀14"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020295 end');
    })

    /**
     * @tc.name   testParseDedup020296
     * @tc.number SUB_ASSET_PARSEDEDUP_0296
     * @tc.desc   组合值：emoji 标签去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup020296', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020296 begin');
      const result: string[] = removeDuplicateAndSort(["😀15","😀15","x"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["x","😀15"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["x","😀15"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020296 end');
    })

    /**
     * @tc.name   testParseDedup020297
     * @tc.number SUB_ASSET_PARSEDEDUP_0297
     * @tc.desc   组合值：emoji 标签去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup020297', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020297 begin');
      const result: string[] = removeDuplicateAndSort(["😀16","😀16","x"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["x","😀16"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["x","😀16"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020297 end');
    })

    /**
     * @tc.name   testParseDedup020298
     * @tc.number SUB_ASSET_PARSEDEDUP_0298
     * @tc.desc   组合值：emoji 标签去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup020298', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020298 begin');
      const result: string[] = removeDuplicateAndSort(["😀17","😀17","x"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["x","😀17"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["x","😀17"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020298 end');
    })

    /**
     * @tc.name   testParseDedup020299
     * @tc.number SUB_ASSET_PARSEDEDUP_0299
     * @tc.desc   组合值：emoji 标签去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup020299', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020299 begin');
      const result: string[] = removeDuplicateAndSort(["😀18","😀18","x"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["x","😀18"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["x","😀18"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020299 end');
    })

    /**
     * @tc.name   testParseDedup020300
     * @tc.number SUB_ASSET_PARSEDEDUP_0300
     * @tc.desc   组合值：emoji 标签去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup020300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020300 begin');
      const result: string[] = removeDuplicateAndSort(["😀19","😀19","x"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["x","😀19"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["x","😀19"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup020300 end');
    })

  })
}
