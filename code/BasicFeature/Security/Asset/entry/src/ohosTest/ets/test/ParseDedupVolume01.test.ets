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

export default function parseDedupVolume01() {
  describe('ParseDedupVolume01Test', () => {

    /**
     * @tc.name   testParseDedup010001
     * @tc.number SUB_ASSET_PARSEDEDUP_0001
     * @tc.desc   含重复与空段的数组过滤去重后按字典序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup010001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010001 begin');
      const sorted: string[] = removeDuplicateAndSort(['b', 'a', 'b', '']);
      expect(sorted.length).assertEqual(2);
      expect(sorted[0]).assertEqual('a');
      expect(sorted[1]).assertEqual('b');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010001 end');
    })

    /**
     * @tc.name   testParseDedup010002
     * @tc.number SUB_ASSET_PARSEDEDUP_0002
     * @tc.desc   合法值：乱序字母数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup010002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010002 begin');
      const result: string[] = removeDuplicateAndSort(["z","a","m1"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["a","m1","z"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["a","m1","z"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010002 end');
    })

    /**
     * @tc.name   testParseDedup010003
     * @tc.number SUB_ASSET_PARSEDEDUP_0003
     * @tc.desc   合法值：乱序字母数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup010003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010003 begin');
      const result: string[] = removeDuplicateAndSort(["m2","a","z"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["a","m2","z"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["a","m2","z"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010003 end');
    })

    /**
     * @tc.name   testParseDedup010004
     * @tc.number SUB_ASSET_PARSEDEDUP_0004
     * @tc.desc   合法值：乱序字母数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup010004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010004 begin');
      const result: string[] = removeDuplicateAndSort(["z","a","m3"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["a","m3","z"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["a","m3","z"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010004 end');
    })

    /**
     * @tc.name   testParseDedup010005
     * @tc.number SUB_ASSET_PARSEDEDUP_0005
     * @tc.desc   合法值：乱序字母数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup010005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010005 begin');
      const result: string[] = removeDuplicateAndSort(["m4","a","z"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["a","m4","z"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["a","m4","z"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010005 end');
    })

    /**
     * @tc.name   testParseDedup010006
     * @tc.number SUB_ASSET_PARSEDEDUP_0006
     * @tc.desc   合法值：乱序字母数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup010006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010006 begin');
      const result: string[] = removeDuplicateAndSort(["z","a","m5"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["a","m5","z"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["a","m5","z"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010006 end');
    })

    /**
     * @tc.name   testParseDedup010007
     * @tc.number SUB_ASSET_PARSEDEDUP_0007
     * @tc.desc   合法值：乱序字母数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup010007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010007 begin');
      const result: string[] = removeDuplicateAndSort(["m6","a","z"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["a","m6","z"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["a","m6","z"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010007 end');
    })

    /**
     * @tc.name   testParseDedup010008
     * @tc.number SUB_ASSET_PARSEDEDUP_0008
     * @tc.desc   合法值：乱序字母数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup010008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010008 begin');
      const result: string[] = removeDuplicateAndSort(["z","a","m7"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["a","m7","z"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["a","m7","z"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010008 end');
    })

    /**
     * @tc.name   testParseDedup010009
     * @tc.number SUB_ASSET_PARSEDEDUP_0009
     * @tc.desc   合法值：乱序字母数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup010009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010009 begin');
      const result: string[] = removeDuplicateAndSort(["m8","a","z"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["a","m8","z"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["a","m8","z"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010009 end');
    })

    /**
     * @tc.name   testParseDedup010010
     * @tc.number SUB_ASSET_PARSEDEDUP_0010
     * @tc.desc   合法值：乱序字母数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup010010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010010 begin');
      const result: string[] = removeDuplicateAndSort(["z","a","m9"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["a","m9","z"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["a","m9","z"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010010 end');
    })

    /**
     * @tc.name   testParseDedup010011
     * @tc.number SUB_ASSET_PARSEDEDUP_0011
     * @tc.desc   合法值：乱序字母数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup010011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010011 begin');
      const result: string[] = removeDuplicateAndSort(["m10","a","z"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["a","m10","z"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["a","m10","z"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010011 end');
    })

    /**
     * @tc.name   testParseDedup010012
     * @tc.number SUB_ASSET_PARSEDEDUP_0012
     * @tc.desc   合法值：乱序字母数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup010012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010012 begin');
      const result: string[] = removeDuplicateAndSort(["z","a","m11"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["a","m11","z"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["a","m11","z"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010012 end');
    })

    /**
     * @tc.name   testParseDedup010013
     * @tc.number SUB_ASSET_PARSEDEDUP_0013
     * @tc.desc   合法值：乱序字母数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup010013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010013 begin');
      const result: string[] = removeDuplicateAndSort(["m12","a","z"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["a","m12","z"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["a","m12","z"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010013 end');
    })

    /**
     * @tc.name   testParseDedup010014
     * @tc.number SUB_ASSET_PARSEDEDUP_0014
     * @tc.desc   合法值：乱序字母数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup010014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010014 begin');
      const result: string[] = removeDuplicateAndSort(["z","a","m13"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["a","m13","z"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["a","m13","z"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010014 end');
    })

    /**
     * @tc.name   testParseDedup010015
     * @tc.number SUB_ASSET_PARSEDEDUP_0015
     * @tc.desc   合法值：乱序字母数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup010015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010015 begin');
      const result: string[] = removeDuplicateAndSort(["m14","a","z"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["a","m14","z"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["a","m14","z"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010015 end');
    })

    /**
     * @tc.name   testParseDedup010016
     * @tc.number SUB_ASSET_PARSEDEDUP_0016
     * @tc.desc   合法值：乱序字母数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup010016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010016 begin');
      const result: string[] = removeDuplicateAndSort(["z","a","m15"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["a","m15","z"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["a","m15","z"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010016 end');
    })

    /**
     * @tc.name   testParseDedup010017
     * @tc.number SUB_ASSET_PARSEDEDUP_0017
     * @tc.desc   合法值：乱序字母数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup010017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010017 begin');
      const result: string[] = removeDuplicateAndSort(["m16","a","z"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["a","m16","z"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["a","m16","z"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010017 end');
    })

    /**
     * @tc.name   testParseDedup010018
     * @tc.number SUB_ASSET_PARSEDEDUP_0018
     * @tc.desc   合法值：乱序字母数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup010018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010018 begin');
      const result: string[] = removeDuplicateAndSort(["z","a","m17"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["a","m17","z"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["a","m17","z"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010018 end');
    })

    /**
     * @tc.name   testParseDedup010019
     * @tc.number SUB_ASSET_PARSEDEDUP_0019
     * @tc.desc   合法值：乱序字母数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup010019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010019 begin');
      const result: string[] = removeDuplicateAndSort(["m18","a","z"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["a","m18","z"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["a","m18","z"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010019 end');
    })

    /**
     * @tc.name   testParseDedup010020
     * @tc.number SUB_ASSET_PARSEDEDUP_0020
     * @tc.desc   合法值：乱序字母数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup010020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010020 begin');
      const result: string[] = removeDuplicateAndSort(["z","a","m19"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["a","m19","z"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["a","m19","z"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010020 end');
    })

    /**
     * @tc.name   testParseDedup010021
     * @tc.number SUB_ASSET_PARSEDEDUP_0021
     * @tc.desc   合法值：乱序字母数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup010021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010021 begin');
      const result: string[] = removeDuplicateAndSort(["m20","a","z"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["a","m20","z"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["a","m20","z"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010021 end');
    })

    /**
     * @tc.name   testParseDedup010022
     * @tc.number SUB_ASSET_PARSEDEDUP_0022
     * @tc.desc   合法值：乱序字母数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup010022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010022 begin');
      const result: string[] = removeDuplicateAndSort(["z","a","m21"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["a","m21","z"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["a","m21","z"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010022 end');
    })

    /**
     * @tc.name   testParseDedup010023
     * @tc.number SUB_ASSET_PARSEDEDUP_0023
     * @tc.desc   合法值：乱序字母数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup010023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010023 begin');
      const result: string[] = removeDuplicateAndSort(["m22","a","z"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["a","m22","z"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["a","m22","z"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010023 end');
    })

    /**
     * @tc.name   testParseDedup010024
     * @tc.number SUB_ASSET_PARSEDEDUP_0024
     * @tc.desc   合法值：乱序字母数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup010024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010024 begin');
      const result: string[] = removeDuplicateAndSort(["z","a","m23"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["a","m23","z"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["a","m23","z"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010024 end');
    })

    /**
     * @tc.name   testParseDedup010025
     * @tc.number SUB_ASSET_PARSEDEDUP_0025
     * @tc.desc   合法值：乱序字母数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup010025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010025 begin');
      const result: string[] = removeDuplicateAndSort(["m24","a","z"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["a","m24","z"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["a","m24","z"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010025 end');
    })

    /**
     * @tc.name   testParseDedup010026
     * @tc.number SUB_ASSET_PARSEDEDUP_0026
     * @tc.desc   合法值：乱序字母数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup010026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010026 begin');
      const result: string[] = removeDuplicateAndSort(["z","a","m25"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["a","m25","z"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["a","m25","z"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010026 end');
    })

    /**
     * @tc.name   testParseDedup010027
     * @tc.number SUB_ASSET_PARSEDEDUP_0027
     * @tc.desc   合法值：乱序字母数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup010027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010027 begin');
      const result: string[] = removeDuplicateAndSort(["m26","a","z"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["a","m26","z"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["a","m26","z"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010027 end');
    })

    /**
     * @tc.name   testParseDedup010028
     * @tc.number SUB_ASSET_PARSEDEDUP_0028
     * @tc.desc   合法值：乱序字母数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup010028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010028 begin');
      const result: string[] = removeDuplicateAndSort(["z","a","m27"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["a","m27","z"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["a","m27","z"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010028 end');
    })

    /**
     * @tc.name   testParseDedup010029
     * @tc.number SUB_ASSET_PARSEDEDUP_0029
     * @tc.desc   合法值：乱序字母数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup010029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010029 begin');
      const result: string[] = removeDuplicateAndSort(["m28","a","z"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["a","m28","z"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["a","m28","z"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010029 end');
    })

    /**
     * @tc.name   testParseDedup010030
     * @tc.number SUB_ASSET_PARSEDEDUP_0030
     * @tc.desc   合法值：乱序字母数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup010030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010030 begin');
      const result: string[] = removeDuplicateAndSort(["z","a","m29"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["a","m29","z"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["a","m29","z"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010030 end');
    })

    /**
     * @tc.name   testParseDedup010031
     * @tc.number SUB_ASSET_PARSEDEDUP_0031
     * @tc.desc   合法值：乱序字母数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup010031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010031 begin');
      const result: string[] = removeDuplicateAndSort(["m30","a","z"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["a","m30","z"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["a","m30","z"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010031 end');
    })

    /**
     * @tc.name   testParseDedup010032
     * @tc.number SUB_ASSET_PARSEDEDUP_0032
     * @tc.desc   合法值：乱序字母数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup010032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010032 begin');
      const result: string[] = removeDuplicateAndSort(["z","a","m31"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["a","m31","z"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["a","m31","z"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010032 end');
    })

    /**
     * @tc.name   testParseDedup010033
     * @tc.number SUB_ASSET_PARSEDEDUP_0033
     * @tc.desc   合法值：乱序字母数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup010033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010033 begin');
      const result: string[] = removeDuplicateAndSort(["m32","a","z"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["a","m32","z"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["a","m32","z"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010033 end');
    })

    /**
     * @tc.name   testParseDedup010034
     * @tc.number SUB_ASSET_PARSEDEDUP_0034
     * @tc.desc   合法值：乱序字母数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup010034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010034 begin');
      const result: string[] = removeDuplicateAndSort(["z","a","m33"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["a","m33","z"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["a","m33","z"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010034 end');
    })

    /**
     * @tc.name   testParseDedup010035
     * @tc.number SUB_ASSET_PARSEDEDUP_0035
     * @tc.desc   合法值：乱序字母数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup010035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010035 begin');
      const result: string[] = removeDuplicateAndSort(["m34","a","z"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["a","m34","z"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["a","m34","z"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010035 end');
    })

    /**
     * @tc.name   testParseDedup010036
     * @tc.number SUB_ASSET_PARSEDEDUP_0036
     * @tc.desc   合法值：乱序字母数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup010036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010036 begin');
      const result: string[] = removeDuplicateAndSort(["z","a","m35"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["a","m35","z"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["a","m35","z"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010036 end');
    })

    /**
     * @tc.name   testParseDedup010037
     * @tc.number SUB_ASSET_PARSEDEDUP_0037
     * @tc.desc   合法值：乱序字母数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup010037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010037 begin');
      const result: string[] = removeDuplicateAndSort(["m36","a","z"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["a","m36","z"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["a","m36","z"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010037 end');
    })

    /**
     * @tc.name   testParseDedup010038
     * @tc.number SUB_ASSET_PARSEDEDUP_0038
     * @tc.desc   合法值：乱序字母数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup010038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010038 begin');
      const result: string[] = removeDuplicateAndSort(["z","a","m37"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["a","m37","z"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["a","m37","z"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010038 end');
    })

    /**
     * @tc.name   testParseDedup010039
     * @tc.number SUB_ASSET_PARSEDEDUP_0039
     * @tc.desc   合法值：乱序字母数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup010039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010039 begin');
      const result: string[] = removeDuplicateAndSort(["m38","a","z"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["a","m38","z"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["a","m38","z"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010039 end');
    })

    /**
     * @tc.name   testParseDedup010040
     * @tc.number SUB_ASSET_PARSEDEDUP_0040
     * @tc.desc   合法值：乱序字母数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup010040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010040 begin');
      const result: string[] = removeDuplicateAndSort(["z","a","m39"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["a","m39","z"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["a","m39","z"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010040 end');
    })

    /**
     * @tc.name   testParseDedup010041
     * @tc.number SUB_ASSET_PARSEDEDUP_0041
     * @tc.desc   合法值：乱序字母数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup010041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010041 begin');
      const result: string[] = removeDuplicateAndSort(["m40","a","z"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["a","m40","z"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["a","m40","z"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010041 end');
    })

    /**
     * @tc.name   testParseDedup010042
     * @tc.number SUB_ASSET_PARSEDEDUP_0042
     * @tc.desc   合法值：乱序字母数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup010042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010042 begin');
      const result: string[] = removeDuplicateAndSort(["z","a","m41"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["a","m41","z"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["a","m41","z"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010042 end');
    })

    /**
     * @tc.name   testParseDedup010043
     * @tc.number SUB_ASSET_PARSEDEDUP_0043
     * @tc.desc   合法值：乱序字母数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup010043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010043 begin');
      const result: string[] = removeDuplicateAndSort(["m42","a","z"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["a","m42","z"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["a","m42","z"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010043 end');
    })

    /**
     * @tc.name   testParseDedup010044
     * @tc.number SUB_ASSET_PARSEDEDUP_0044
     * @tc.desc   合法值：乱序字母数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup010044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010044 begin');
      const result: string[] = removeDuplicateAndSort(["z","a","m43"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["a","m43","z"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["a","m43","z"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010044 end');
    })

    /**
     * @tc.name   testParseDedup010045
     * @tc.number SUB_ASSET_PARSEDEDUP_0045
     * @tc.desc   合法值：乱序字母数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup010045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010045 begin');
      const result: string[] = removeDuplicateAndSort(["m44","a","z"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["a","m44","z"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["a","m44","z"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010045 end');
    })

    /**
     * @tc.name   testParseDedup010046
     * @tc.number SUB_ASSET_PARSEDEDUP_0046
     * @tc.desc   合法值：乱序字母数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup010046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010046 begin');
      const result: string[] = removeDuplicateAndSort(["z","a","m45"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["a","m45","z"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["a","m45","z"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010046 end');
    })

    /**
     * @tc.name   testParseDedup010047
     * @tc.number SUB_ASSET_PARSEDEDUP_0047
     * @tc.desc   合法值：乱序字母数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup010047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010047 begin');
      const result: string[] = removeDuplicateAndSort(["m46","a","z"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["a","m46","z"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["a","m46","z"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010047 end');
    })

    /**
     * @tc.name   testParseDedup010048
     * @tc.number SUB_ASSET_PARSEDEDUP_0048
     * @tc.desc   合法值：乱序字母数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup010048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010048 begin');
      const result: string[] = removeDuplicateAndSort(["z","a","m47"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["a","m47","z"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["a","m47","z"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010048 end');
    })

    /**
     * @tc.name   testParseDedup010049
     * @tc.number SUB_ASSET_PARSEDEDUP_0049
     * @tc.desc   合法值：乱序字母数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup010049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010049 begin');
      const result: string[] = removeDuplicateAndSort(["m48","a","z"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["a","m48","z"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["a","m48","z"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010049 end');
    })

    /**
     * @tc.name   testParseDedup010050
     * @tc.number SUB_ASSET_PARSEDEDUP_0050
     * @tc.desc   合法值：乱序字母数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup010050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010050 begin');
      const result: string[] = removeDuplicateAndSort(["z","a","m49"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["a","m49","z"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["a","m49","z"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010050 end');
    })

    /**
     * @tc.name   testParseDedup010051
     * @tc.number SUB_ASSET_PARSEDEDUP_0051
     * @tc.desc   合法值：数字字符串字典序排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup010051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010051 begin');
      const result: string[] = removeDuplicateAndSort(["10","2","10"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["10","2"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["10","2"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010051 end');
    })

    /**
     * @tc.name   testParseDedup010052
     * @tc.number SUB_ASSET_PARSEDEDUP_0052
     * @tc.desc   合法值：数字字符串字典序排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup010052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010052 begin');
      const result: string[] = removeDuplicateAndSort(["10","2","11"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["10","11","2"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["10","11","2"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010052 end');
    })

    /**
     * @tc.name   testParseDedup010053
     * @tc.number SUB_ASSET_PARSEDEDUP_0053
     * @tc.desc   合法值：数字字符串字典序排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup010053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010053 begin');
      const result: string[] = removeDuplicateAndSort(["10","2","12"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["10","12","2"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["10","12","2"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010053 end');
    })

    /**
     * @tc.name   testParseDedup010054
     * @tc.number SUB_ASSET_PARSEDEDUP_0054
     * @tc.desc   合法值：数字字符串字典序排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup010054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010054 begin');
      const result: string[] = removeDuplicateAndSort(["10","2","13"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["10","13","2"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["10","13","2"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010054 end');
    })

    /**
     * @tc.name   testParseDedup010055
     * @tc.number SUB_ASSET_PARSEDEDUP_0055
     * @tc.desc   合法值：数字字符串字典序排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup010055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010055 begin');
      const result: string[] = removeDuplicateAndSort(["10","2","14"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["10","14","2"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["10","14","2"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010055 end');
    })

    /**
     * @tc.name   testParseDedup010056
     * @tc.number SUB_ASSET_PARSEDEDUP_0056
     * @tc.desc   合法值：数字字符串字典序排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup010056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010056 begin');
      const result: string[] = removeDuplicateAndSort(["10","2","15"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["10","15","2"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["10","15","2"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010056 end');
    })

    /**
     * @tc.name   testParseDedup010057
     * @tc.number SUB_ASSET_PARSEDEDUP_0057
     * @tc.desc   合法值：数字字符串字典序排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup010057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010057 begin');
      const result: string[] = removeDuplicateAndSort(["10","2","16"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["10","16","2"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["10","16","2"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010057 end');
    })

    /**
     * @tc.name   testParseDedup010058
     * @tc.number SUB_ASSET_PARSEDEDUP_0058
     * @tc.desc   合法值：数字字符串字典序排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup010058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010058 begin');
      const result: string[] = removeDuplicateAndSort(["10","2","17"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["10","17","2"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["10","17","2"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010058 end');
    })

    /**
     * @tc.name   testParseDedup010059
     * @tc.number SUB_ASSET_PARSEDEDUP_0059
     * @tc.desc   合法值：数字字符串字典序排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup010059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010059 begin');
      const result: string[] = removeDuplicateAndSort(["10","2","18"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["10","18","2"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["10","18","2"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010059 end');
    })

    /**
     * @tc.name   testParseDedup010060
     * @tc.number SUB_ASSET_PARSEDEDUP_0060
     * @tc.desc   合法值：数字字符串字典序排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup010060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010060 begin');
      const result: string[] = removeDuplicateAndSort(["10","2","19"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["10","19","2"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["10","19","2"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010060 end');
    })

    /**
     * @tc.name   testParseDedup010061
     * @tc.number SUB_ASSET_PARSEDEDUP_0061
     * @tc.desc   合法值：数字字符串字典序排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup010061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010061 begin');
      const result: string[] = removeDuplicateAndSort(["10","2","110"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["10","110","2"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["10","110","2"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010061 end');
    })

    /**
     * @tc.name   testParseDedup010062
     * @tc.number SUB_ASSET_PARSEDEDUP_0062
     * @tc.desc   合法值：数字字符串字典序排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup010062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010062 begin');
      const result: string[] = removeDuplicateAndSort(["10","2","111"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["10","111","2"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["10","111","2"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010062 end');
    })

    /**
     * @tc.name   testParseDedup010063
     * @tc.number SUB_ASSET_PARSEDEDUP_0063
     * @tc.desc   合法值：数字字符串字典序排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup010063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010063 begin');
      const result: string[] = removeDuplicateAndSort(["10","2","112"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["10","112","2"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["10","112","2"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010063 end');
    })

    /**
     * @tc.name   testParseDedup010064
     * @tc.number SUB_ASSET_PARSEDEDUP_0064
     * @tc.desc   合法值：数字字符串字典序排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup010064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010064 begin');
      const result: string[] = removeDuplicateAndSort(["10","2","113"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["10","113","2"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["10","113","2"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010064 end');
    })

    /**
     * @tc.name   testParseDedup010065
     * @tc.number SUB_ASSET_PARSEDEDUP_0065
     * @tc.desc   合法值：数字字符串字典序排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup010065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010065 begin');
      const result: string[] = removeDuplicateAndSort(["10","2","114"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["10","114","2"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["10","114","2"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010065 end');
    })

    /**
     * @tc.name   testParseDedup010066
     * @tc.number SUB_ASSET_PARSEDEDUP_0066
     * @tc.desc   合法值：数字字符串字典序排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup010066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010066 begin');
      const result: string[] = removeDuplicateAndSort(["10","2","115"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["10","115","2"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["10","115","2"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010066 end');
    })

    /**
     * @tc.name   testParseDedup010067
     * @tc.number SUB_ASSET_PARSEDEDUP_0067
     * @tc.desc   合法值：数字字符串字典序排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup010067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010067 begin');
      const result: string[] = removeDuplicateAndSort(["10","2","116"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["10","116","2"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["10","116","2"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010067 end');
    })

    /**
     * @tc.name   testParseDedup010068
     * @tc.number SUB_ASSET_PARSEDEDUP_0068
     * @tc.desc   合法值：数字字符串字典序排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup010068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010068 begin');
      const result: string[] = removeDuplicateAndSort(["10","2","117"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["10","117","2"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["10","117","2"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010068 end');
    })

    /**
     * @tc.name   testParseDedup010069
     * @tc.number SUB_ASSET_PARSEDEDUP_0069
     * @tc.desc   合法值：数字字符串字典序排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup010069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010069 begin');
      const result: string[] = removeDuplicateAndSort(["10","2","118"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["10","118","2"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["10","118","2"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010069 end');
    })

    /**
     * @tc.name   testParseDedup010070
     * @tc.number SUB_ASSET_PARSEDEDUP_0070
     * @tc.desc   合法值：数字字符串字典序排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup010070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010070 begin');
      const result: string[] = removeDuplicateAndSort(["10","2","119"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["10","119","2"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["10","119","2"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010070 end');
    })

    /**
     * @tc.name   testParseDedup010071
     * @tc.number SUB_ASSET_PARSEDEDUP_0071
     * @tc.desc   合法值：数字字符串字典序排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup010071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010071 begin');
      const result: string[] = removeDuplicateAndSort(["10","2","120"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["10","120","2"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["10","120","2"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010071 end');
    })

    /**
     * @tc.name   testParseDedup010072
     * @tc.number SUB_ASSET_PARSEDEDUP_0072
     * @tc.desc   合法值：数字字符串字典序排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup010072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010072 begin');
      const result: string[] = removeDuplicateAndSort(["10","2","121"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["10","121","2"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["10","121","2"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010072 end');
    })

    /**
     * @tc.name   testParseDedup010073
     * @tc.number SUB_ASSET_PARSEDEDUP_0073
     * @tc.desc   合法值：数字字符串字典序排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup010073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010073 begin');
      const result: string[] = removeDuplicateAndSort(["10","2","122"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["10","122","2"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["10","122","2"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010073 end');
    })

    /**
     * @tc.name   testParseDedup010074
     * @tc.number SUB_ASSET_PARSEDEDUP_0074
     * @tc.desc   合法值：数字字符串字典序排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup010074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010074 begin');
      const result: string[] = removeDuplicateAndSort(["10","2","123"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["10","123","2"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["10","123","2"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010074 end');
    })

    /**
     * @tc.name   testParseDedup010075
     * @tc.number SUB_ASSET_PARSEDEDUP_0075
     * @tc.desc   合法值：数字字符串字典序排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup010075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010075 begin');
      const result: string[] = removeDuplicateAndSort(["10","2","124"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["10","124","2"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["10","124","2"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010075 end');
    })

    /**
     * @tc.name   testParseDedup010076
     * @tc.number SUB_ASSET_PARSEDEDUP_0076
     * @tc.desc   合法值：数字字符串字典序排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup010076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010076 begin');
      const result: string[] = removeDuplicateAndSort(["10","2","125"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["10","125","2"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["10","125","2"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010076 end');
    })

    /**
     * @tc.name   testParseDedup010077
     * @tc.number SUB_ASSET_PARSEDEDUP_0077
     * @tc.desc   合法值：数字字符串字典序排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup010077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010077 begin');
      const result: string[] = removeDuplicateAndSort(["10","2","126"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["10","126","2"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["10","126","2"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010077 end');
    })

    /**
     * @tc.name   testParseDedup010078
     * @tc.number SUB_ASSET_PARSEDEDUP_0078
     * @tc.desc   合法值：数字字符串字典序排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup010078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010078 begin');
      const result: string[] = removeDuplicateAndSort(["10","2","127"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["10","127","2"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["10","127","2"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010078 end');
    })

    /**
     * @tc.name   testParseDedup010079
     * @tc.number SUB_ASSET_PARSEDEDUP_0079
     * @tc.desc   合法值：数字字符串字典序排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup010079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010079 begin');
      const result: string[] = removeDuplicateAndSort(["10","2","128"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["10","128","2"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["10","128","2"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010079 end');
    })

    /**
     * @tc.name   testParseDedup010080
     * @tc.number SUB_ASSET_PARSEDEDUP_0080
     * @tc.desc   合法值：数字字符串字典序排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup010080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010080 begin');
      const result: string[] = removeDuplicateAndSort(["10","2","129"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["10","129","2"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["10","129","2"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010080 end');
    })

    /**
     * @tc.name   testParseDedup010081
     * @tc.number SUB_ASSET_PARSEDEDUP_0081
     * @tc.desc   合法值：大小写混合按字典序排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup010081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010081 begin');
      const result: string[] = removeDuplicateAndSort(["Ab","aB","ab0"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["Ab","aB","ab0"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["Ab","aB","ab0"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010081 end');
    })

    /**
     * @tc.name   testParseDedup010082
     * @tc.number SUB_ASSET_PARSEDEDUP_0082
     * @tc.desc   合法值：大小写混合按字典序排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup010082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010082 begin');
      const result: string[] = removeDuplicateAndSort(["Ab","aB","ab1"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["Ab","aB","ab1"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["Ab","aB","ab1"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010082 end');
    })

    /**
     * @tc.name   testParseDedup010083
     * @tc.number SUB_ASSET_PARSEDEDUP_0083
     * @tc.desc   合法值：大小写混合按字典序排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup010083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010083 begin');
      const result: string[] = removeDuplicateAndSort(["Ab","aB","ab2"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["Ab","aB","ab2"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["Ab","aB","ab2"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010083 end');
    })

    /**
     * @tc.name   testParseDedup010084
     * @tc.number SUB_ASSET_PARSEDEDUP_0084
     * @tc.desc   合法值：大小写混合按字典序排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup010084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010084 begin');
      const result: string[] = removeDuplicateAndSort(["Ab","aB","ab3"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["Ab","aB","ab3"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["Ab","aB","ab3"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010084 end');
    })

    /**
     * @tc.name   testParseDedup010085
     * @tc.number SUB_ASSET_PARSEDEDUP_0085
     * @tc.desc   合法值：大小写混合按字典序排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup010085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010085 begin');
      const result: string[] = removeDuplicateAndSort(["Ab","aB","ab4"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["Ab","aB","ab4"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["Ab","aB","ab4"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010085 end');
    })

    /**
     * @tc.name   testParseDedup010086
     * @tc.number SUB_ASSET_PARSEDEDUP_0086
     * @tc.desc   合法值：大小写混合按字典序排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup010086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010086 begin');
      const result: string[] = removeDuplicateAndSort(["Ab","aB","ab5"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["Ab","aB","ab5"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["Ab","aB","ab5"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010086 end');
    })

    /**
     * @tc.name   testParseDedup010087
     * @tc.number SUB_ASSET_PARSEDEDUP_0087
     * @tc.desc   合法值：大小写混合按字典序排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup010087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010087 begin');
      const result: string[] = removeDuplicateAndSort(["Ab","aB","ab6"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["Ab","aB","ab6"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["Ab","aB","ab6"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010087 end');
    })

    /**
     * @tc.name   testParseDedup010088
     * @tc.number SUB_ASSET_PARSEDEDUP_0088
     * @tc.desc   合法值：大小写混合按字典序排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup010088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010088 begin');
      const result: string[] = removeDuplicateAndSort(["Ab","aB","ab7"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["Ab","aB","ab7"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["Ab","aB","ab7"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010088 end');
    })

    /**
     * @tc.name   testParseDedup010089
     * @tc.number SUB_ASSET_PARSEDEDUP_0089
     * @tc.desc   合法值：大小写混合按字典序排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup010089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010089 begin');
      const result: string[] = removeDuplicateAndSort(["Ab","aB","ab8"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["Ab","aB","ab8"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["Ab","aB","ab8"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010089 end');
    })

    /**
     * @tc.name   testParseDedup010090
     * @tc.number SUB_ASSET_PARSEDEDUP_0090
     * @tc.desc   合法值：大小写混合按字典序排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup010090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010090 begin');
      const result: string[] = removeDuplicateAndSort(["Ab","aB","ab9"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["Ab","aB","ab9"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["Ab","aB","ab9"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010090 end');
    })

    /**
     * @tc.name   testParseDedup010091
     * @tc.number SUB_ASSET_PARSEDEDUP_0091
     * @tc.desc   合法值：大小写混合按字典序排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup010091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010091 begin');
      const result: string[] = removeDuplicateAndSort(["Ab","aB","ab10"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["Ab","aB","ab10"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["Ab","aB","ab10"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010091 end');
    })

    /**
     * @tc.name   testParseDedup010092
     * @tc.number SUB_ASSET_PARSEDEDUP_0092
     * @tc.desc   合法值：大小写混合按字典序排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup010092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010092 begin');
      const result: string[] = removeDuplicateAndSort(["Ab","aB","ab11"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["Ab","aB","ab11"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["Ab","aB","ab11"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010092 end');
    })

    /**
     * @tc.name   testParseDedup010093
     * @tc.number SUB_ASSET_PARSEDEDUP_0093
     * @tc.desc   合法值：大小写混合按字典序排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup010093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010093 begin');
      const result: string[] = removeDuplicateAndSort(["Ab","aB","ab12"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["Ab","aB","ab12"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["Ab","aB","ab12"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010093 end');
    })

    /**
     * @tc.name   testParseDedup010094
     * @tc.number SUB_ASSET_PARSEDEDUP_0094
     * @tc.desc   合法值：大小写混合按字典序排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup010094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010094 begin');
      const result: string[] = removeDuplicateAndSort(["Ab","aB","ab13"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["Ab","aB","ab13"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["Ab","aB","ab13"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010094 end');
    })

    /**
     * @tc.name   testParseDedup010095
     * @tc.number SUB_ASSET_PARSEDEDUP_0095
     * @tc.desc   合法值：大小写混合按字典序排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup010095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010095 begin');
      const result: string[] = removeDuplicateAndSort(["Ab","aB","ab14"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["Ab","aB","ab14"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["Ab","aB","ab14"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010095 end');
    })

    /**
     * @tc.name   testParseDedup010096
     * @tc.number SUB_ASSET_PARSEDEDUP_0096
     * @tc.desc   合法值：大小写混合按字典序排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup010096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010096 begin');
      const result: string[] = removeDuplicateAndSort(["Ab","aB","ab15"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["Ab","aB","ab15"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["Ab","aB","ab15"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010096 end');
    })

    /**
     * @tc.name   testParseDedup010097
     * @tc.number SUB_ASSET_PARSEDEDUP_0097
     * @tc.desc   合法值：大小写混合按字典序排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup010097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010097 begin');
      const result: string[] = removeDuplicateAndSort(["Ab","aB","ab16"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["Ab","aB","ab16"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["Ab","aB","ab16"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010097 end');
    })

    /**
     * @tc.name   testParseDedup010098
     * @tc.number SUB_ASSET_PARSEDEDUP_0098
     * @tc.desc   合法值：大小写混合按字典序排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup010098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010098 begin');
      const result: string[] = removeDuplicateAndSort(["Ab","aB","ab17"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["Ab","aB","ab17"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["Ab","aB","ab17"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010098 end');
    })

    /**
     * @tc.name   testParseDedup010099
     * @tc.number SUB_ASSET_PARSEDEDUP_0099
     * @tc.desc   合法值：大小写混合按字典序排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup010099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010099 begin');
      const result: string[] = removeDuplicateAndSort(["Ab","aB","ab18"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["Ab","aB","ab18"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["Ab","aB","ab18"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010099 end');
    })

    /**
     * @tc.name   testParseDedup010100
     * @tc.number SUB_ASSET_PARSEDEDUP_0100
     * @tc.desc   合法值：大小写混合按字典序排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup010100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010100 begin');
      const result: string[] = removeDuplicateAndSort(["Ab","aB","ab19"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["Ab","aB","ab19"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["Ab","aB","ab19"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010100 end');
    })

    /**
     * @tc.name   testParseDedup010101
     * @tc.number SUB_ASSET_PARSEDEDUP_0101
     * @tc.desc   合法值：大小写混合按字典序排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup010101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010101 begin');
      const result: string[] = removeDuplicateAndSort(["Ab","aB","ab20"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["Ab","aB","ab20"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["Ab","aB","ab20"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010101 end');
    })

    /**
     * @tc.name   testParseDedup010102
     * @tc.number SUB_ASSET_PARSEDEDUP_0102
     * @tc.desc   合法值：大小写混合按字典序排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup010102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010102 begin');
      const result: string[] = removeDuplicateAndSort(["Ab","aB","ab21"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["Ab","aB","ab21"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["Ab","aB","ab21"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010102 end');
    })

    /**
     * @tc.name   testParseDedup010103
     * @tc.number SUB_ASSET_PARSEDEDUP_0103
     * @tc.desc   合法值：大小写混合按字典序排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup010103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010103 begin');
      const result: string[] = removeDuplicateAndSort(["Ab","aB","ab22"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["Ab","aB","ab22"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["Ab","aB","ab22"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010103 end');
    })

    /**
     * @tc.name   testParseDedup010104
     * @tc.number SUB_ASSET_PARSEDEDUP_0104
     * @tc.desc   合法值：大小写混合按字典序排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup010104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010104 begin');
      const result: string[] = removeDuplicateAndSort(["Ab","aB","ab23"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["Ab","aB","ab23"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["Ab","aB","ab23"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010104 end');
    })

    /**
     * @tc.name   testParseDedup010105
     * @tc.number SUB_ASSET_PARSEDEDUP_0105
     * @tc.desc   合法值：大小写混合按字典序排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup010105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010105 begin');
      const result: string[] = removeDuplicateAndSort(["Ab","aB","ab24"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["Ab","aB","ab24"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["Ab","aB","ab24"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010105 end');
    })

    /**
     * @tc.name   testParseDedup010106
     * @tc.number SUB_ASSET_PARSEDEDUP_0106
     * @tc.desc   合法值：大小写混合按字典序排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup010106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010106 begin');
      const result: string[] = removeDuplicateAndSort(["Ab","aB","ab25"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["Ab","aB","ab25"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["Ab","aB","ab25"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010106 end');
    })

    /**
     * @tc.name   testParseDedup010107
     * @tc.number SUB_ASSET_PARSEDEDUP_0107
     * @tc.desc   合法值：大小写混合按字典序排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup010107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010107 begin');
      const result: string[] = removeDuplicateAndSort(["Ab","aB","ab26"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["Ab","aB","ab26"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["Ab","aB","ab26"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010107 end');
    })

    /**
     * @tc.name   testParseDedup010108
     * @tc.number SUB_ASSET_PARSEDEDUP_0108
     * @tc.desc   合法值：大小写混合按字典序排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup010108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010108 begin');
      const result: string[] = removeDuplicateAndSort(["Ab","aB","ab27"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["Ab","aB","ab27"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["Ab","aB","ab27"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010108 end');
    })

    /**
     * @tc.name   testParseDedup010109
     * @tc.number SUB_ASSET_PARSEDEDUP_0109
     * @tc.desc   合法值：大小写混合按字典序排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup010109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010109 begin');
      const result: string[] = removeDuplicateAndSort(["Ab","aB","ab28"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["Ab","aB","ab28"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["Ab","aB","ab28"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010109 end');
    })

    /**
     * @tc.name   testParseDedup010110
     * @tc.number SUB_ASSET_PARSEDEDUP_0110
     * @tc.desc   合法值：大小写混合按字典序排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup010110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010110 begin');
      const result: string[] = removeDuplicateAndSort(["Ab","aB","ab29"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["Ab","aB","ab29"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["Ab","aB","ab29"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010110 end');
    })

    /**
     * @tc.name   testParseDedup010111
     * @tc.number SUB_ASSET_PARSEDEDUP_0111
     * @tc.desc   边界值：单元素数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup010111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010111 begin');
      const result: string[] = removeDuplicateAndSort(["solo0"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["solo0"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["solo0"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010111 end');
    })

    /**
     * @tc.name   testParseDedup010112
     * @tc.number SUB_ASSET_PARSEDEDUP_0112
     * @tc.desc   边界值：单元素数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup010112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010112 begin');
      const result: string[] = removeDuplicateAndSort(["solo1"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["solo1"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["solo1"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010112 end');
    })

    /**
     * @tc.name   testParseDedup010113
     * @tc.number SUB_ASSET_PARSEDEDUP_0113
     * @tc.desc   边界值：单元素数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup010113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010113 begin');
      const result: string[] = removeDuplicateAndSort(["solo2"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["solo2"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["solo2"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010113 end');
    })

    /**
     * @tc.name   testParseDedup010114
     * @tc.number SUB_ASSET_PARSEDEDUP_0114
     * @tc.desc   边界值：单元素数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup010114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010114 begin');
      const result: string[] = removeDuplicateAndSort(["solo3"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["solo3"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["solo3"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010114 end');
    })

    /**
     * @tc.name   testParseDedup010115
     * @tc.number SUB_ASSET_PARSEDEDUP_0115
     * @tc.desc   边界值：单元素数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup010115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010115 begin');
      const result: string[] = removeDuplicateAndSort(["solo4"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["solo4"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["solo4"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010115 end');
    })

    /**
     * @tc.name   testParseDedup010116
     * @tc.number SUB_ASSET_PARSEDEDUP_0116
     * @tc.desc   边界值：单元素数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup010116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010116 begin');
      const result: string[] = removeDuplicateAndSort(["solo5"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["solo5"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["solo5"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010116 end');
    })

    /**
     * @tc.name   testParseDedup010117
     * @tc.number SUB_ASSET_PARSEDEDUP_0117
     * @tc.desc   边界值：单元素数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup010117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010117 begin');
      const result: string[] = removeDuplicateAndSort(["solo6"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["solo6"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["solo6"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010117 end');
    })

    /**
     * @tc.name   testParseDedup010118
     * @tc.number SUB_ASSET_PARSEDEDUP_0118
     * @tc.desc   边界值：单元素数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup010118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010118 begin');
      const result: string[] = removeDuplicateAndSort(["solo7"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["solo7"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["solo7"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010118 end');
    })

    /**
     * @tc.name   testParseDedup010119
     * @tc.number SUB_ASSET_PARSEDEDUP_0119
     * @tc.desc   边界值：单元素数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup010119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010119 begin');
      const result: string[] = removeDuplicateAndSort(["solo8"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["solo8"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["solo8"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010119 end');
    })

    /**
     * @tc.name   testParseDedup010120
     * @tc.number SUB_ASSET_PARSEDEDUP_0120
     * @tc.desc   边界值：单元素数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup010120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010120 begin');
      const result: string[] = removeDuplicateAndSort(["solo9"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["solo9"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["solo9"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010120 end');
    })

    /**
     * @tc.name   testParseDedup010121
     * @tc.number SUB_ASSET_PARSEDEDUP_0121
     * @tc.desc   边界值：空数组去重排序返回空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup010121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010121 begin');
      const result: string[] = removeDuplicateAndSort([]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String([]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify([]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010121 end');
    })

    /**
     * @tc.name   testParseDedup010122
     * @tc.number SUB_ASSET_PARSEDEDUP_0122
     * @tc.desc   边界值：空数组去重排序返回空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup010122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010122 begin');
      const result: string[] = removeDuplicateAndSort([]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String([]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify([]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010122 end');
    })

    /**
     * @tc.name   testParseDedup010123
     * @tc.number SUB_ASSET_PARSEDEDUP_0123
     * @tc.desc   边界值：空数组去重排序返回空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup010123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010123 begin');
      const result: string[] = removeDuplicateAndSort([]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String([]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify([]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010123 end');
    })

    /**
     * @tc.name   testParseDedup010124
     * @tc.number SUB_ASSET_PARSEDEDUP_0124
     * @tc.desc   边界值：空数组去重排序返回空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup010124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010124 begin');
      const result: string[] = removeDuplicateAndSort([]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String([]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify([]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010124 end');
    })

    /**
     * @tc.name   testParseDedup010125
     * @tc.number SUB_ASSET_PARSEDEDUP_0125
     * @tc.desc   边界值：空数组去重排序返回空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup010125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010125 begin');
      const result: string[] = removeDuplicateAndSort([]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String([]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify([]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010125 end');
    })

    /**
     * @tc.name   testParseDedup010126
     * @tc.number SUB_ASSET_PARSEDEDUP_0126
     * @tc.desc   边界值：全空段数组过滤后为空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup010126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010126 begin');
      const result: string[] = removeDuplicateAndSort(["","",""]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String([]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify([]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010126 end');
    })

    /**
     * @tc.name   testParseDedup010127
     * @tc.number SUB_ASSET_PARSEDEDUP_0127
     * @tc.desc   边界值：全空段数组过滤后为空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup010127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010127 begin');
      const result: string[] = removeDuplicateAndSort(["","",""]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String([]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify([]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010127 end');
    })

    /**
     * @tc.name   testParseDedup010128
     * @tc.number SUB_ASSET_PARSEDEDUP_0128
     * @tc.desc   边界值：全空段数组过滤后为空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup010128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010128 begin');
      const result: string[] = removeDuplicateAndSort(["","",""]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String([]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify([]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010128 end');
    })

    /**
     * @tc.name   testParseDedup010129
     * @tc.number SUB_ASSET_PARSEDEDUP_0129
     * @tc.desc   边界值：全空段数组过滤后为空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup010129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010129 begin');
      const result: string[] = removeDuplicateAndSort(["","",""]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String([]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify([]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010129 end');
    })

    /**
     * @tc.name   testParseDedup010130
     * @tc.number SUB_ASSET_PARSEDEDUP_0130
     * @tc.desc   边界值：全空段数组过滤后为空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup010130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010130 begin');
      const result: string[] = removeDuplicateAndSort(["","",""]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String([]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify([]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010130 end');
    })

    /**
     * @tc.name   testParseDedup010131
     * @tc.number SUB_ASSET_PARSEDEDUP_0131
     * @tc.desc   合法值：符号数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup010131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010131 begin');
      const result: string[] = removeDuplicateAndSort(["@","#","$0"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["#","$0","@"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["#","$0","@"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010131 end');
    })

    /**
     * @tc.name   testParseDedup010132
     * @tc.number SUB_ASSET_PARSEDEDUP_0132
     * @tc.desc   合法值：符号数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup010132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010132 begin');
      const result: string[] = removeDuplicateAndSort(["@","#","$1"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["#","$1","@"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["#","$1","@"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010132 end');
    })

    /**
     * @tc.name   testParseDedup010133
     * @tc.number SUB_ASSET_PARSEDEDUP_0133
     * @tc.desc   合法值：符号数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup010133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010133 begin');
      const result: string[] = removeDuplicateAndSort(["@","#","$2"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["#","$2","@"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["#","$2","@"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010133 end');
    })

    /**
     * @tc.name   testParseDedup010134
     * @tc.number SUB_ASSET_PARSEDEDUP_0134
     * @tc.desc   合法值：符号数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup010134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010134 begin');
      const result: string[] = removeDuplicateAndSort(["@","#","$3"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["#","$3","@"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["#","$3","@"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010134 end');
    })

    /**
     * @tc.name   testParseDedup010135
     * @tc.number SUB_ASSET_PARSEDEDUP_0135
     * @tc.desc   合法值：符号数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup010135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010135 begin');
      const result: string[] = removeDuplicateAndSort(["@","#","$4"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["#","$4","@"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["#","$4","@"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010135 end');
    })

    /**
     * @tc.name   testParseDedup010136
     * @tc.number SUB_ASSET_PARSEDEDUP_0136
     * @tc.desc   合法值：符号数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup010136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010136 begin');
      const result: string[] = removeDuplicateAndSort(["@","#","$5"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["#","$5","@"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["#","$5","@"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010136 end');
    })

    /**
     * @tc.name   testParseDedup010137
     * @tc.number SUB_ASSET_PARSEDEDUP_0137
     * @tc.desc   合法值：符号数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup010137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010137 begin');
      const result: string[] = removeDuplicateAndSort(["@","#","$6"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["#","$6","@"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["#","$6","@"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010137 end');
    })

    /**
     * @tc.name   testParseDedup010138
     * @tc.number SUB_ASSET_PARSEDEDUP_0138
     * @tc.desc   合法值：符号数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup010138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010138 begin');
      const result: string[] = removeDuplicateAndSort(["@","#","$7"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["#","$7","@"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["#","$7","@"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010138 end');
    })

    /**
     * @tc.name   testParseDedup010139
     * @tc.number SUB_ASSET_PARSEDEDUP_0139
     * @tc.desc   合法值：符号数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup010139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010139 begin');
      const result: string[] = removeDuplicateAndSort(["@","#","$8"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["#","$8","@"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["#","$8","@"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010139 end');
    })

    /**
     * @tc.name   testParseDedup010140
     * @tc.number SUB_ASSET_PARSEDEDUP_0140
     * @tc.desc   合法值：符号数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup010140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010140 begin');
      const result: string[] = removeDuplicateAndSort(["@","#","$9"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["#","$9","@"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["#","$9","@"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010140 end');
    })

    /**
     * @tc.name   testParseDedup010141
     * @tc.number SUB_ASSET_PARSEDEDUP_0141
     * @tc.desc   合法值：符号数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup010141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010141 begin');
      const result: string[] = removeDuplicateAndSort(["@","#","$10"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["#","$10","@"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["#","$10","@"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010141 end');
    })

    /**
     * @tc.name   testParseDedup010142
     * @tc.number SUB_ASSET_PARSEDEDUP_0142
     * @tc.desc   合法值：符号数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup010142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010142 begin');
      const result: string[] = removeDuplicateAndSort(["@","#","$11"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["#","$11","@"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["#","$11","@"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010142 end');
    })

    /**
     * @tc.name   testParseDedup010143
     * @tc.number SUB_ASSET_PARSEDEDUP_0143
     * @tc.desc   合法值：符号数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup010143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010143 begin');
      const result: string[] = removeDuplicateAndSort(["@","#","$12"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["#","$12","@"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["#","$12","@"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010143 end');
    })

    /**
     * @tc.name   testParseDedup010144
     * @tc.number SUB_ASSET_PARSEDEDUP_0144
     * @tc.desc   合法值：符号数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup010144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010144 begin');
      const result: string[] = removeDuplicateAndSort(["@","#","$13"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["#","$13","@"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["#","$13","@"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010144 end');
    })

    /**
     * @tc.name   testParseDedup010145
     * @tc.number SUB_ASSET_PARSEDEDUP_0145
     * @tc.desc   合法值：符号数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup010145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010145 begin');
      const result: string[] = removeDuplicateAndSort(["@","#","$14"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["#","$14","@"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["#","$14","@"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010145 end');
    })

    /**
     * @tc.name   testParseDedup010146
     * @tc.number SUB_ASSET_PARSEDEDUP_0146
     * @tc.desc   合法值：符号数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup010146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010146 begin');
      const result: string[] = removeDuplicateAndSort(["@","#","$15"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["#","$15","@"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["#","$15","@"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010146 end');
    })

    /**
     * @tc.name   testParseDedup010147
     * @tc.number SUB_ASSET_PARSEDEDUP_0147
     * @tc.desc   合法值：符号数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup010147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010147 begin');
      const result: string[] = removeDuplicateAndSort(["@","#","$16"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["#","$16","@"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["#","$16","@"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010147 end');
    })

    /**
     * @tc.name   testParseDedup010148
     * @tc.number SUB_ASSET_PARSEDEDUP_0148
     * @tc.desc   合法值：符号数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup010148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010148 begin');
      const result: string[] = removeDuplicateAndSort(["@","#","$17"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["#","$17","@"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["#","$17","@"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010148 end');
    })

    /**
     * @tc.name   testParseDedup010149
     * @tc.number SUB_ASSET_PARSEDEDUP_0149
     * @tc.desc   合法值：符号数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup010149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010149 begin');
      const result: string[] = removeDuplicateAndSort(["@","#","$18"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["#","$18","@"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["#","$18","@"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010149 end');
    })

    /**
     * @tc.name   testParseDedup010150
     * @tc.number SUB_ASSET_PARSEDEDUP_0150
     * @tc.desc   合法值：符号数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup010150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010150 begin');
      const result: string[] = removeDuplicateAndSort(["@","#","$19"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["#","$19","@"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["#","$19","@"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup010150 end');
    })

  })
}
