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

export default function parseDedupVolume03() {
  describe('ParseDedupVolume03Test', () => {

    /**
     * @tc.name   testParseDedup030301
     * @tc.number SUB_ASSET_PARSEDEDUP_0301
     * @tc.desc   含重复与空段的数组过滤去重后按字典序返回
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup030301', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030301 begin');
      const sorted: string[] = removeDuplicateAndSort(['b', 'a', 'b', '']);
      expect(sorted.length).assertEqual(2);
      expect(sorted[0]).assertEqual('a');
      expect(sorted[1]).assertEqual('b');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030301 end');
    })

    /**
     * @tc.name   testParseDedup030302
     * @tc.number SUB_ASSET_PARSEDEDUP_0302
     * @tc.desc   状态值：五元素含重复数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup030302', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030302 begin');
      const result: string[] = removeDuplicateAndSort(["e1","a1","b1","a1","e1"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["a1","b1","e1"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["a1","b1","e1"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030302 end');
    })

    /**
     * @tc.name   testParseDedup030303
     * @tc.number SUB_ASSET_PARSEDEDUP_0303
     * @tc.desc   状态值：五元素含重复数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup030303', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030303 begin');
      const result: string[] = removeDuplicateAndSort(["e2","a2","b2","a2","e2"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["a2","b2","e2"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["a2","b2","e2"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030303 end');
    })

    /**
     * @tc.name   testParseDedup030304
     * @tc.number SUB_ASSET_PARSEDEDUP_0304
     * @tc.desc   状态值：五元素含重复数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup030304', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030304 begin');
      const result: string[] = removeDuplicateAndSort(["e3","a3","b3","a3","e3"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["a3","b3","e3"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["a3","b3","e3"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030304 end');
    })

    /**
     * @tc.name   testParseDedup030305
     * @tc.number SUB_ASSET_PARSEDEDUP_0305
     * @tc.desc   状态值：五元素含重复数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup030305', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030305 begin');
      const result: string[] = removeDuplicateAndSort(["e4","a4","b4","a4","e4"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["a4","b4","e4"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["a4","b4","e4"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030305 end');
    })

    /**
     * @tc.name   testParseDedup030306
     * @tc.number SUB_ASSET_PARSEDEDUP_0306
     * @tc.desc   状态值：五元素含重复数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup030306', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030306 begin');
      const result: string[] = removeDuplicateAndSort(["e5","a5","b5","a5","e5"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["a5","b5","e5"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["a5","b5","e5"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030306 end');
    })

    /**
     * @tc.name   testParseDedup030307
     * @tc.number SUB_ASSET_PARSEDEDUP_0307
     * @tc.desc   状态值：五元素含重复数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup030307', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030307 begin');
      const result: string[] = removeDuplicateAndSort(["e6","a6","b6","a6","e6"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["a6","b6","e6"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["a6","b6","e6"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030307 end');
    })

    /**
     * @tc.name   testParseDedup030308
     * @tc.number SUB_ASSET_PARSEDEDUP_0308
     * @tc.desc   状态值：五元素含重复数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup030308', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030308 begin');
      const result: string[] = removeDuplicateAndSort(["e7","a7","b7","a7","e7"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["a7","b7","e7"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["a7","b7","e7"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030308 end');
    })

    /**
     * @tc.name   testParseDedup030309
     * @tc.number SUB_ASSET_PARSEDEDUP_0309
     * @tc.desc   状态值：五元素含重复数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup030309', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030309 begin');
      const result: string[] = removeDuplicateAndSort(["e8","a8","b8","a8","e8"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["a8","b8","e8"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["a8","b8","e8"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030309 end');
    })

    /**
     * @tc.name   testParseDedup030310
     * @tc.number SUB_ASSET_PARSEDEDUP_0310
     * @tc.desc   状态值：五元素含重复数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup030310', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030310 begin');
      const result: string[] = removeDuplicateAndSort(["e9","a9","b9","a9","e9"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["a9","b9","e9"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["a9","b9","e9"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030310 end');
    })

    /**
     * @tc.name   testParseDedup030311
     * @tc.number SUB_ASSET_PARSEDEDUP_0311
     * @tc.desc   状态值：五元素含重复数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup030311', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030311 begin');
      const result: string[] = removeDuplicateAndSort(["e10","a10","b10","a10","e10"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["a10","b10","e10"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["a10","b10","e10"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030311 end');
    })

    /**
     * @tc.name   testParseDedup030312
     * @tc.number SUB_ASSET_PARSEDEDUP_0312
     * @tc.desc   状态值：五元素含重复数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup030312', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030312 begin');
      const result: string[] = removeDuplicateAndSort(["e11","a11","b11","a11","e11"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["a11","b11","e11"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["a11","b11","e11"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030312 end');
    })

    /**
     * @tc.name   testParseDedup030313
     * @tc.number SUB_ASSET_PARSEDEDUP_0313
     * @tc.desc   状态值：五元素含重复数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup030313', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030313 begin');
      const result: string[] = removeDuplicateAndSort(["e12","a12","b12","a12","e12"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["a12","b12","e12"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["a12","b12","e12"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030313 end');
    })

    /**
     * @tc.name   testParseDedup030314
     * @tc.number SUB_ASSET_PARSEDEDUP_0314
     * @tc.desc   状态值：五元素含重复数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup030314', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030314 begin');
      const result: string[] = removeDuplicateAndSort(["e13","a13","b13","a13","e13"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["a13","b13","e13"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["a13","b13","e13"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030314 end');
    })

    /**
     * @tc.name   testParseDedup030315
     * @tc.number SUB_ASSET_PARSEDEDUP_0315
     * @tc.desc   状态值：五元素含重复数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup030315', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030315 begin');
      const result: string[] = removeDuplicateAndSort(["e14","a14","b14","a14","e14"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["a14","b14","e14"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["a14","b14","e14"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030315 end');
    })

    /**
     * @tc.name   testParseDedup030316
     * @tc.number SUB_ASSET_PARSEDEDUP_0316
     * @tc.desc   状态值：五元素含重复数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup030316', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030316 begin');
      const result: string[] = removeDuplicateAndSort(["e15","a15","b15","a15","e15"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["a15","b15","e15"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["a15","b15","e15"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030316 end');
    })

    /**
     * @tc.name   testParseDedup030317
     * @tc.number SUB_ASSET_PARSEDEDUP_0317
     * @tc.desc   状态值：五元素含重复数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup030317', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030317 begin');
      const result: string[] = removeDuplicateAndSort(["e16","a16","b16","a16","e16"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["a16","b16","e16"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["a16","b16","e16"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030317 end');
    })

    /**
     * @tc.name   testParseDedup030318
     * @tc.number SUB_ASSET_PARSEDEDUP_0318
     * @tc.desc   状态值：五元素含重复数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup030318', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030318 begin');
      const result: string[] = removeDuplicateAndSort(["e17","a17","b17","a17","e17"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["a17","b17","e17"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["a17","b17","e17"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030318 end');
    })

    /**
     * @tc.name   testParseDedup030319
     * @tc.number SUB_ASSET_PARSEDEDUP_0319
     * @tc.desc   状态值：五元素含重复数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup030319', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030319 begin');
      const result: string[] = removeDuplicateAndSort(["e18","a18","b18","a18","e18"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["a18","b18","e18"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["a18","b18","e18"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030319 end');
    })

    /**
     * @tc.name   testParseDedup030320
     * @tc.number SUB_ASSET_PARSEDEDUP_0320
     * @tc.desc   状态值：五元素含重复数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup030320', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030320 begin');
      const result: string[] = removeDuplicateAndSort(["e19","a19","b19","a19","e19"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["a19","b19","e19"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["a19","b19","e19"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030320 end');
    })

    /**
     * @tc.name   testParseDedup030321
     * @tc.number SUB_ASSET_PARSEDEDUP_0321
     * @tc.desc   状态值：五元素含重复数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup030321', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030321 begin');
      const result: string[] = removeDuplicateAndSort(["e20","a20","b20","a20","e20"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["a20","b20","e20"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["a20","b20","e20"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030321 end');
    })

    /**
     * @tc.name   testParseDedup030322
     * @tc.number SUB_ASSET_PARSEDEDUP_0322
     * @tc.desc   状态值：五元素含重复数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup030322', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030322 begin');
      const result: string[] = removeDuplicateAndSort(["e21","a21","b21","a21","e21"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["a21","b21","e21"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["a21","b21","e21"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030322 end');
    })

    /**
     * @tc.name   testParseDedup030323
     * @tc.number SUB_ASSET_PARSEDEDUP_0323
     * @tc.desc   状态值：五元素含重复数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup030323', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030323 begin');
      const result: string[] = removeDuplicateAndSort(["e22","a22","b22","a22","e22"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["a22","b22","e22"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["a22","b22","e22"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030323 end');
    })

    /**
     * @tc.name   testParseDedup030324
     * @tc.number SUB_ASSET_PARSEDEDUP_0324
     * @tc.desc   状态值：五元素含重复数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup030324', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030324 begin');
      const result: string[] = removeDuplicateAndSort(["e23","a23","b23","a23","e23"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["a23","b23","e23"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["a23","b23","e23"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030324 end');
    })

    /**
     * @tc.name   testParseDedup030325
     * @tc.number SUB_ASSET_PARSEDEDUP_0325
     * @tc.desc   状态值：五元素含重复数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup030325', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030325 begin');
      const result: string[] = removeDuplicateAndSort(["e24","a24","b24","a24","e24"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["a24","b24","e24"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["a24","b24","e24"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030325 end');
    })

    /**
     * @tc.name   testParseDedup030326
     * @tc.number SUB_ASSET_PARSEDEDUP_0326
     * @tc.desc   状态值：五元素含重复数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup030326', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030326 begin');
      const result: string[] = removeDuplicateAndSort(["e25","a25","b25","a25","e25"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["a25","b25","e25"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["a25","b25","e25"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030326 end');
    })

    /**
     * @tc.name   testParseDedup030327
     * @tc.number SUB_ASSET_PARSEDEDUP_0327
     * @tc.desc   状态值：五元素含重复数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup030327', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030327 begin');
      const result: string[] = removeDuplicateAndSort(["e26","a26","b26","a26","e26"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["a26","b26","e26"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["a26","b26","e26"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030327 end');
    })

    /**
     * @tc.name   testParseDedup030328
     * @tc.number SUB_ASSET_PARSEDEDUP_0328
     * @tc.desc   状态值：五元素含重复数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup030328', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030328 begin');
      const result: string[] = removeDuplicateAndSort(["e27","a27","b27","a27","e27"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["a27","b27","e27"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["a27","b27","e27"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030328 end');
    })

    /**
     * @tc.name   testParseDedup030329
     * @tc.number SUB_ASSET_PARSEDEDUP_0329
     * @tc.desc   状态值：五元素含重复数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup030329', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030329 begin');
      const result: string[] = removeDuplicateAndSort(["e28","a28","b28","a28","e28"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["a28","b28","e28"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["a28","b28","e28"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030329 end');
    })

    /**
     * @tc.name   testParseDedup030330
     * @tc.number SUB_ASSET_PARSEDEDUP_0330
     * @tc.desc   状态值：五元素含重复数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup030330', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030330 begin');
      const result: string[] = removeDuplicateAndSort(["e29","a29","b29","a29","e29"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["a29","b29","e29"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["a29","b29","e29"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030330 end');
    })

    /**
     * @tc.name   testParseDedup030331
     * @tc.number SUB_ASSET_PARSEDEDUP_0331
     * @tc.desc   状态值：全重复数组去重后单元素
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup030331', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030331 begin');
      const result: string[] = removeDuplicateAndSort(["x0","x0","x0"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["x0"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["x0"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030331 end');
    })

    /**
     * @tc.name   testParseDedup030332
     * @tc.number SUB_ASSET_PARSEDEDUP_0332
     * @tc.desc   状态值：全重复数组去重后单元素
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup030332', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030332 begin');
      const result: string[] = removeDuplicateAndSort(["x1","x1","x1"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["x1"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["x1"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030332 end');
    })

    /**
     * @tc.name   testParseDedup030333
     * @tc.number SUB_ASSET_PARSEDEDUP_0333
     * @tc.desc   状态值：全重复数组去重后单元素
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup030333', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030333 begin');
      const result: string[] = removeDuplicateAndSort(["x2","x2","x2"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["x2"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["x2"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030333 end');
    })

    /**
     * @tc.name   testParseDedup030334
     * @tc.number SUB_ASSET_PARSEDEDUP_0334
     * @tc.desc   状态值：全重复数组去重后单元素
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup030334', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030334 begin');
      const result: string[] = removeDuplicateAndSort(["x3","x3","x3"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["x3"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["x3"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030334 end');
    })

    /**
     * @tc.name   testParseDedup030335
     * @tc.number SUB_ASSET_PARSEDEDUP_0335
     * @tc.desc   状态值：全重复数组去重后单元素
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup030335', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030335 begin');
      const result: string[] = removeDuplicateAndSort(["x4","x4","x4"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["x4"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["x4"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030335 end');
    })

    /**
     * @tc.name   testParseDedup030336
     * @tc.number SUB_ASSET_PARSEDEDUP_0336
     * @tc.desc   状态值：全重复数组去重后单元素
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup030336', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030336 begin');
      const result: string[] = removeDuplicateAndSort(["x5","x5","x5"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["x5"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["x5"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030336 end');
    })

    /**
     * @tc.name   testParseDedup030337
     * @tc.number SUB_ASSET_PARSEDEDUP_0337
     * @tc.desc   状态值：全重复数组去重后单元素
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup030337', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030337 begin');
      const result: string[] = removeDuplicateAndSort(["x6","x6","x6"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["x6"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["x6"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030337 end');
    })

    /**
     * @tc.name   testParseDedup030338
     * @tc.number SUB_ASSET_PARSEDEDUP_0338
     * @tc.desc   状态值：全重复数组去重后单元素
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup030338', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030338 begin');
      const result: string[] = removeDuplicateAndSort(["x7","x7","x7"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["x7"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["x7"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030338 end');
    })

    /**
     * @tc.name   testParseDedup030339
     * @tc.number SUB_ASSET_PARSEDEDUP_0339
     * @tc.desc   状态值：全重复数组去重后单元素
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup030339', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030339 begin');
      const result: string[] = removeDuplicateAndSort(["x8","x8","x8"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["x8"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["x8"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030339 end');
    })

    /**
     * @tc.name   testParseDedup030340
     * @tc.number SUB_ASSET_PARSEDEDUP_0340
     * @tc.desc   状态值：全重复数组去重后单元素
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup030340', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030340 begin');
      const result: string[] = removeDuplicateAndSort(["x9","x9","x9"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["x9"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["x9"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030340 end');
    })

    /**
     * @tc.name   testParseDedup030341
     * @tc.number SUB_ASSET_PARSEDEDUP_0341
     * @tc.desc   状态值：全重复数组去重后单元素
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup030341', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030341 begin');
      const result: string[] = removeDuplicateAndSort(["x10","x10","x10"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["x10"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["x10"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030341 end');
    })

    /**
     * @tc.name   testParseDedup030342
     * @tc.number SUB_ASSET_PARSEDEDUP_0342
     * @tc.desc   状态值：全重复数组去重后单元素
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup030342', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030342 begin');
      const result: string[] = removeDuplicateAndSort(["x11","x11","x11"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["x11"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["x11"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030342 end');
    })

    /**
     * @tc.name   testParseDedup030343
     * @tc.number SUB_ASSET_PARSEDEDUP_0343
     * @tc.desc   状态值：全重复数组去重后单元素
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup030343', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030343 begin');
      const result: string[] = removeDuplicateAndSort(["x12","x12","x12"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["x12"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["x12"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030343 end');
    })

    /**
     * @tc.name   testParseDedup030344
     * @tc.number SUB_ASSET_PARSEDEDUP_0344
     * @tc.desc   状态值：全重复数组去重后单元素
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup030344', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030344 begin');
      const result: string[] = removeDuplicateAndSort(["x13","x13","x13"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["x13"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["x13"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030344 end');
    })

    /**
     * @tc.name   testParseDedup030345
     * @tc.number SUB_ASSET_PARSEDEDUP_0345
     * @tc.desc   状态值：全重复数组去重后单元素
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup030345', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030345 begin');
      const result: string[] = removeDuplicateAndSort(["x14","x14","x14"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["x14"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["x14"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030345 end');
    })

    /**
     * @tc.name   testParseDedup030346
     * @tc.number SUB_ASSET_PARSEDEDUP_0346
     * @tc.desc   状态值：全重复数组去重后单元素
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup030346', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030346 begin');
      const result: string[] = removeDuplicateAndSort(["x15","x15","x15"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["x15"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["x15"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030346 end');
    })

    /**
     * @tc.name   testParseDedup030347
     * @tc.number SUB_ASSET_PARSEDEDUP_0347
     * @tc.desc   状态值：全重复数组去重后单元素
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup030347', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030347 begin');
      const result: string[] = removeDuplicateAndSort(["x16","x16","x16"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["x16"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["x16"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030347 end');
    })

    /**
     * @tc.name   testParseDedup030348
     * @tc.number SUB_ASSET_PARSEDEDUP_0348
     * @tc.desc   状态值：全重复数组去重后单元素
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup030348', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030348 begin');
      const result: string[] = removeDuplicateAndSort(["x17","x17","x17"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["x17"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["x17"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030348 end');
    })

    /**
     * @tc.name   testParseDedup030349
     * @tc.number SUB_ASSET_PARSEDEDUP_0349
     * @tc.desc   状态值：全重复数组去重后单元素
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup030349', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030349 begin');
      const result: string[] = removeDuplicateAndSort(["x18","x18","x18"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["x18"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["x18"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030349 end');
    })

    /**
     * @tc.name   testParseDedup030350
     * @tc.number SUB_ASSET_PARSEDEDUP_0350
     * @tc.desc   状态值：全重复数组去重后单元素
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup030350', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030350 begin');
      const result: string[] = removeDuplicateAndSort(["x19","x19","x19"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["x19"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["x19"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030350 end');
    })

    /**
     * @tc.name   testParseDedup030351
     * @tc.number SUB_ASSET_PARSEDEDUP_0351
     * @tc.desc   状态值：全重复数组去重后单元素
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup030351', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030351 begin');
      const result: string[] = removeDuplicateAndSort(["x20","x20","x20"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["x20"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["x20"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030351 end');
    })

    /**
     * @tc.name   testParseDedup030352
     * @tc.number SUB_ASSET_PARSEDEDUP_0352
     * @tc.desc   状态值：全重复数组去重后单元素
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup030352', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030352 begin');
      const result: string[] = removeDuplicateAndSort(["x21","x21","x21"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["x21"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["x21"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030352 end');
    })

    /**
     * @tc.name   testParseDedup030353
     * @tc.number SUB_ASSET_PARSEDEDUP_0353
     * @tc.desc   状态值：全重复数组去重后单元素
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup030353', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030353 begin');
      const result: string[] = removeDuplicateAndSort(["x22","x22","x22"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["x22"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["x22"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030353 end');
    })

    /**
     * @tc.name   testParseDedup030354
     * @tc.number SUB_ASSET_PARSEDEDUP_0354
     * @tc.desc   状态值：全重复数组去重后单元素
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup030354', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030354 begin');
      const result: string[] = removeDuplicateAndSort(["x23","x23","x23"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["x23"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["x23"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030354 end');
    })

    /**
     * @tc.name   testParseDedup030355
     * @tc.number SUB_ASSET_PARSEDEDUP_0355
     * @tc.desc   状态值：全重复数组去重后单元素
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup030355', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030355 begin');
      const result: string[] = removeDuplicateAndSort(["x24","x24","x24"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["x24"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["x24"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030355 end');
    })

    /**
     * @tc.name   testParseDedup030356
     * @tc.number SUB_ASSET_PARSEDEDUP_0356
     * @tc.desc   状态值：全重复数组去重后单元素
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup030356', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030356 begin');
      const result: string[] = removeDuplicateAndSort(["x25","x25","x25"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["x25"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["x25"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030356 end');
    })

    /**
     * @tc.name   testParseDedup030357
     * @tc.number SUB_ASSET_PARSEDEDUP_0357
     * @tc.desc   状态值：全重复数组去重后单元素
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup030357', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030357 begin');
      const result: string[] = removeDuplicateAndSort(["x26","x26","x26"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["x26"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["x26"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030357 end');
    })

    /**
     * @tc.name   testParseDedup030358
     * @tc.number SUB_ASSET_PARSEDEDUP_0358
     * @tc.desc   状态值：全重复数组去重后单元素
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup030358', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030358 begin');
      const result: string[] = removeDuplicateAndSort(["x27","x27","x27"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["x27"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["x27"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030358 end');
    })

    /**
     * @tc.name   testParseDedup030359
     * @tc.number SUB_ASSET_PARSEDEDUP_0359
     * @tc.desc   状态值：全重复数组去重后单元素
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup030359', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030359 begin');
      const result: string[] = removeDuplicateAndSort(["x28","x28","x28"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["x28"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["x28"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030359 end');
    })

    /**
     * @tc.name   testParseDedup030360
     * @tc.number SUB_ASSET_PARSEDEDUP_0360
     * @tc.desc   状态值：全重复数组去重后单元素
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup030360', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030360 begin');
      const result: string[] = removeDuplicateAndSort(["x29","x29","x29"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["x29"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["x29"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030360 end');
    })

    /**
     * @tc.name   testParseDedup030361
     * @tc.number SUB_ASSET_PARSEDEDUP_0361
     * @tc.desc   合法值：双元素数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup030361', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030361 begin');
      const result: string[] = removeDuplicateAndSort(["p0","q0"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["p0","q0"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["p0","q0"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030361 end');
    })

    /**
     * @tc.name   testParseDedup030362
     * @tc.number SUB_ASSET_PARSEDEDUP_0362
     * @tc.desc   合法值：双元素数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup030362', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030362 begin');
      const result: string[] = removeDuplicateAndSort(["p1","q1"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["p1","q1"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["p1","q1"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030362 end');
    })

    /**
     * @tc.name   testParseDedup030363
     * @tc.number SUB_ASSET_PARSEDEDUP_0363
     * @tc.desc   合法值：双元素数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup030363', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030363 begin');
      const result: string[] = removeDuplicateAndSort(["p2","q2"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["p2","q2"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["p2","q2"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030363 end');
    })

    /**
     * @tc.name   testParseDedup030364
     * @tc.number SUB_ASSET_PARSEDEDUP_0364
     * @tc.desc   合法值：双元素数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup030364', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030364 begin');
      const result: string[] = removeDuplicateAndSort(["p3","q3"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["p3","q3"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["p3","q3"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030364 end');
    })

    /**
     * @tc.name   testParseDedup030365
     * @tc.number SUB_ASSET_PARSEDEDUP_0365
     * @tc.desc   合法值：双元素数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup030365', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030365 begin');
      const result: string[] = removeDuplicateAndSort(["p4","q4"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["p4","q4"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["p4","q4"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030365 end');
    })

    /**
     * @tc.name   testParseDedup030366
     * @tc.number SUB_ASSET_PARSEDEDUP_0366
     * @tc.desc   合法值：双元素数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup030366', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030366 begin');
      const result: string[] = removeDuplicateAndSort(["p5","q5"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["p5","q5"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["p5","q5"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030366 end');
    })

    /**
     * @tc.name   testParseDedup030367
     * @tc.number SUB_ASSET_PARSEDEDUP_0367
     * @tc.desc   合法值：双元素数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup030367', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030367 begin');
      const result: string[] = removeDuplicateAndSort(["p6","q6"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["p6","q6"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["p6","q6"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030367 end');
    })

    /**
     * @tc.name   testParseDedup030368
     * @tc.number SUB_ASSET_PARSEDEDUP_0368
     * @tc.desc   合法值：双元素数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup030368', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030368 begin');
      const result: string[] = removeDuplicateAndSort(["p7","q7"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["p7","q7"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["p7","q7"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030368 end');
    })

    /**
     * @tc.name   testParseDedup030369
     * @tc.number SUB_ASSET_PARSEDEDUP_0369
     * @tc.desc   合法值：双元素数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup030369', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030369 begin');
      const result: string[] = removeDuplicateAndSort(["p8","q8"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["p8","q8"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["p8","q8"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030369 end');
    })

    /**
     * @tc.name   testParseDedup030370
     * @tc.number SUB_ASSET_PARSEDEDUP_0370
     * @tc.desc   合法值：双元素数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup030370', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030370 begin');
      const result: string[] = removeDuplicateAndSort(["p9","q9"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["p9","q9"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["p9","q9"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030370 end');
    })

    /**
     * @tc.name   testParseDedup030371
     * @tc.number SUB_ASSET_PARSEDEDUP_0371
     * @tc.desc   合法值：双元素数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup030371', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030371 begin');
      const result: string[] = removeDuplicateAndSort(["p10","q10"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["p10","q10"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["p10","q10"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030371 end');
    })

    /**
     * @tc.name   testParseDedup030372
     * @tc.number SUB_ASSET_PARSEDEDUP_0372
     * @tc.desc   合法值：双元素数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup030372', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030372 begin');
      const result: string[] = removeDuplicateAndSort(["p11","q11"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["p11","q11"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["p11","q11"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030372 end');
    })

    /**
     * @tc.name   testParseDedup030373
     * @tc.number SUB_ASSET_PARSEDEDUP_0373
     * @tc.desc   合法值：双元素数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup030373', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030373 begin');
      const result: string[] = removeDuplicateAndSort(["p12","q12"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["p12","q12"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["p12","q12"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030373 end');
    })

    /**
     * @tc.name   testParseDedup030374
     * @tc.number SUB_ASSET_PARSEDEDUP_0374
     * @tc.desc   合法值：双元素数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup030374', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030374 begin');
      const result: string[] = removeDuplicateAndSort(["p13","q13"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["p13","q13"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["p13","q13"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030374 end');
    })

    /**
     * @tc.name   testParseDedup030375
     * @tc.number SUB_ASSET_PARSEDEDUP_0375
     * @tc.desc   合法值：双元素数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup030375', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030375 begin');
      const result: string[] = removeDuplicateAndSort(["p14","q14"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["p14","q14"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["p14","q14"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030375 end');
    })

    /**
     * @tc.name   testParseDedup030376
     * @tc.number SUB_ASSET_PARSEDEDUP_0376
     * @tc.desc   合法值：双元素数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup030376', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030376 begin');
      const result: string[] = removeDuplicateAndSort(["p15","q15"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["p15","q15"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["p15","q15"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030376 end');
    })

    /**
     * @tc.name   testParseDedup030377
     * @tc.number SUB_ASSET_PARSEDEDUP_0377
     * @tc.desc   合法值：双元素数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup030377', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030377 begin');
      const result: string[] = removeDuplicateAndSort(["p16","q16"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["p16","q16"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["p16","q16"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030377 end');
    })

    /**
     * @tc.name   testParseDedup030378
     * @tc.number SUB_ASSET_PARSEDEDUP_0378
     * @tc.desc   合法值：双元素数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup030378', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030378 begin');
      const result: string[] = removeDuplicateAndSort(["p17","q17"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["p17","q17"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["p17","q17"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030378 end');
    })

    /**
     * @tc.name   testParseDedup030379
     * @tc.number SUB_ASSET_PARSEDEDUP_0379
     * @tc.desc   合法值：双元素数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup030379', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030379 begin');
      const result: string[] = removeDuplicateAndSort(["p18","q18"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["p18","q18"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["p18","q18"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030379 end');
    })

    /**
     * @tc.name   testParseDedup030380
     * @tc.number SUB_ASSET_PARSEDEDUP_0380
     * @tc.desc   合法值：双元素数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup030380', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030380 begin');
      const result: string[] = removeDuplicateAndSort(["p19","q19"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["p19","q19"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["p19","q19"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030380 end');
    })

    /**
     * @tc.name   testParseDedup030381
     * @tc.number SUB_ASSET_PARSEDEDUP_0381
     * @tc.desc   合法值：双元素数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup030381', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030381 begin');
      const result: string[] = removeDuplicateAndSort(["p20","q20"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["p20","q20"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["p20","q20"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030381 end');
    })

    /**
     * @tc.name   testParseDedup030382
     * @tc.number SUB_ASSET_PARSEDEDUP_0382
     * @tc.desc   合法值：双元素数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup030382', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030382 begin');
      const result: string[] = removeDuplicateAndSort(["p21","q21"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["p21","q21"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["p21","q21"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030382 end');
    })

    /**
     * @tc.name   testParseDedup030383
     * @tc.number SUB_ASSET_PARSEDEDUP_0383
     * @tc.desc   合法值：双元素数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup030383', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030383 begin');
      const result: string[] = removeDuplicateAndSort(["p22","q22"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["p22","q22"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["p22","q22"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030383 end');
    })

    /**
     * @tc.name   testParseDedup030384
     * @tc.number SUB_ASSET_PARSEDEDUP_0384
     * @tc.desc   合法值：双元素数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup030384', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030384 begin');
      const result: string[] = removeDuplicateAndSort(["p23","q23"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["p23","q23"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["p23","q23"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030384 end');
    })

    /**
     * @tc.name   testParseDedup030385
     * @tc.number SUB_ASSET_PARSEDEDUP_0385
     * @tc.desc   合法值：双元素数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup030385', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030385 begin');
      const result: string[] = removeDuplicateAndSort(["p24","q24"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["p24","q24"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["p24","q24"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030385 end');
    })

    /**
     * @tc.name   testParseDedup030386
     * @tc.number SUB_ASSET_PARSEDEDUP_0386
     * @tc.desc   合法值：双元素数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup030386', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030386 begin');
      const result: string[] = removeDuplicateAndSort(["p25","q25"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["p25","q25"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["p25","q25"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030386 end');
    })

    /**
     * @tc.name   testParseDedup030387
     * @tc.number SUB_ASSET_PARSEDEDUP_0387
     * @tc.desc   合法值：双元素数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup030387', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030387 begin');
      const result: string[] = removeDuplicateAndSort(["p26","q26"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["p26","q26"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["p26","q26"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030387 end');
    })

    /**
     * @tc.name   testParseDedup030388
     * @tc.number SUB_ASSET_PARSEDEDUP_0388
     * @tc.desc   合法值：双元素数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup030388', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030388 begin');
      const result: string[] = removeDuplicateAndSort(["p27","q27"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["p27","q27"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["p27","q27"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030388 end');
    })

    /**
     * @tc.name   testParseDedup030389
     * @tc.number SUB_ASSET_PARSEDEDUP_0389
     * @tc.desc   合法值：双元素数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup030389', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030389 begin');
      const result: string[] = removeDuplicateAndSort(["p28","q28"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["p28","q28"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["p28","q28"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030389 end');
    })

    /**
     * @tc.name   testParseDedup030390
     * @tc.number SUB_ASSET_PARSEDEDUP_0390
     * @tc.desc   合法值：双元素数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup030390', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030390 begin');
      const result: string[] = removeDuplicateAndSort(["p29","q29"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["p29","q29"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["p29","q29"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(2));
      expect(result.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030390 end');
    })

    /**
     * @tc.name   testParseDedup030391
     * @tc.number SUB_ASSET_PARSEDEDUP_0391
     * @tc.desc   合法值：三元素数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup030391', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030391 begin');
      const result: string[] = removeDuplicateAndSort(["r0","s0","t0"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["r0","s0","t0"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["r0","s0","t0"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030391 end');
    })

    /**
     * @tc.name   testParseDedup030392
     * @tc.number SUB_ASSET_PARSEDEDUP_0392
     * @tc.desc   合法值：三元素数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup030392', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030392 begin');
      const result: string[] = removeDuplicateAndSort(["r1","s1","t1"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["r1","s1","t1"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["r1","s1","t1"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030392 end');
    })

    /**
     * @tc.name   testParseDedup030393
     * @tc.number SUB_ASSET_PARSEDEDUP_0393
     * @tc.desc   合法值：三元素数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup030393', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030393 begin');
      const result: string[] = removeDuplicateAndSort(["r2","s2","t2"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["r2","s2","t2"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["r2","s2","t2"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030393 end');
    })

    /**
     * @tc.name   testParseDedup030394
     * @tc.number SUB_ASSET_PARSEDEDUP_0394
     * @tc.desc   合法值：三元素数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup030394', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030394 begin');
      const result: string[] = removeDuplicateAndSort(["r3","s3","t3"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["r3","s3","t3"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["r3","s3","t3"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030394 end');
    })

    /**
     * @tc.name   testParseDedup030395
     * @tc.number SUB_ASSET_PARSEDEDUP_0395
     * @tc.desc   合法值：三元素数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup030395', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030395 begin');
      const result: string[] = removeDuplicateAndSort(["r4","s4","t4"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["r4","s4","t4"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["r4","s4","t4"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030395 end');
    })

    /**
     * @tc.name   testParseDedup030396
     * @tc.number SUB_ASSET_PARSEDEDUP_0396
     * @tc.desc   合法值：三元素数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup030396', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030396 begin');
      const result: string[] = removeDuplicateAndSort(["r5","s5","t5"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["r5","s5","t5"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["r5","s5","t5"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030396 end');
    })

    /**
     * @tc.name   testParseDedup030397
     * @tc.number SUB_ASSET_PARSEDEDUP_0397
     * @tc.desc   合法值：三元素数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup030397', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030397 begin');
      const result: string[] = removeDuplicateAndSort(["r6","s6","t6"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["r6","s6","t6"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["r6","s6","t6"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030397 end');
    })

    /**
     * @tc.name   testParseDedup030398
     * @tc.number SUB_ASSET_PARSEDEDUP_0398
     * @tc.desc   合法值：三元素数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup030398', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030398 begin');
      const result: string[] = removeDuplicateAndSort(["r7","s7","t7"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["r7","s7","t7"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["r7","s7","t7"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030398 end');
    })

    /**
     * @tc.name   testParseDedup030399
     * @tc.number SUB_ASSET_PARSEDEDUP_0399
     * @tc.desc   合法值：三元素数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup030399', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030399 begin');
      const result: string[] = removeDuplicateAndSort(["r8","s8","t8"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["r8","s8","t8"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["r8","s8","t8"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030399 end');
    })

    /**
     * @tc.name   testParseDedup030400
     * @tc.number SUB_ASSET_PARSEDEDUP_0400
     * @tc.desc   合法值：三元素数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup030400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030400 begin');
      const result: string[] = removeDuplicateAndSort(["r9","s9","t9"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["r9","s9","t9"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["r9","s9","t9"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030400 end');
    })

    /**
     * @tc.name   testParseDedup030401
     * @tc.number SUB_ASSET_PARSEDEDUP_0401
     * @tc.desc   合法值：三元素数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup030401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030401 begin');
      const result: string[] = removeDuplicateAndSort(["r10","s10","t10"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["r10","s10","t10"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["r10","s10","t10"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030401 end');
    })

    /**
     * @tc.name   testParseDedup030402
     * @tc.number SUB_ASSET_PARSEDEDUP_0402
     * @tc.desc   合法值：三元素数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup030402', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030402 begin');
      const result: string[] = removeDuplicateAndSort(["r11","s11","t11"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["r11","s11","t11"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["r11","s11","t11"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030402 end');
    })

    /**
     * @tc.name   testParseDedup030403
     * @tc.number SUB_ASSET_PARSEDEDUP_0403
     * @tc.desc   合法值：三元素数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup030403', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030403 begin');
      const result: string[] = removeDuplicateAndSort(["r12","s12","t12"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["r12","s12","t12"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["r12","s12","t12"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030403 end');
    })

    /**
     * @tc.name   testParseDedup030404
     * @tc.number SUB_ASSET_PARSEDEDUP_0404
     * @tc.desc   合法值：三元素数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup030404', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030404 begin');
      const result: string[] = removeDuplicateAndSort(["r13","s13","t13"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["r13","s13","t13"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["r13","s13","t13"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030404 end');
    })

    /**
     * @tc.name   testParseDedup030405
     * @tc.number SUB_ASSET_PARSEDEDUP_0405
     * @tc.desc   合法值：三元素数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup030405', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030405 begin');
      const result: string[] = removeDuplicateAndSort(["r14","s14","t14"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["r14","s14","t14"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["r14","s14","t14"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030405 end');
    })

    /**
     * @tc.name   testParseDedup030406
     * @tc.number SUB_ASSET_PARSEDEDUP_0406
     * @tc.desc   合法值：三元素数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup030406', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030406 begin');
      const result: string[] = removeDuplicateAndSort(["r15","s15","t15"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["r15","s15","t15"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["r15","s15","t15"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030406 end');
    })

    /**
     * @tc.name   testParseDedup030407
     * @tc.number SUB_ASSET_PARSEDEDUP_0407
     * @tc.desc   合法值：三元素数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup030407', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030407 begin');
      const result: string[] = removeDuplicateAndSort(["r16","s16","t16"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["r16","s16","t16"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["r16","s16","t16"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030407 end');
    })

    /**
     * @tc.name   testParseDedup030408
     * @tc.number SUB_ASSET_PARSEDEDUP_0408
     * @tc.desc   合法值：三元素数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup030408', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030408 begin');
      const result: string[] = removeDuplicateAndSort(["r17","s17","t17"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["r17","s17","t17"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["r17","s17","t17"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030408 end');
    })

    /**
     * @tc.name   testParseDedup030409
     * @tc.number SUB_ASSET_PARSEDEDUP_0409
     * @tc.desc   合法值：三元素数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup030409', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030409 begin');
      const result: string[] = removeDuplicateAndSort(["r18","s18","t18"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["r18","s18","t18"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["r18","s18","t18"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030409 end');
    })

    /**
     * @tc.name   testParseDedup030410
     * @tc.number SUB_ASSET_PARSEDEDUP_0410
     * @tc.desc   合法值：三元素数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup030410', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030410 begin');
      const result: string[] = removeDuplicateAndSort(["r19","s19","t19"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["r19","s19","t19"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["r19","s19","t19"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030410 end');
    })

    /**
     * @tc.name   testParseDedup030411
     * @tc.number SUB_ASSET_PARSEDEDUP_0411
     * @tc.desc   合法值：三元素数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup030411', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030411 begin');
      const result: string[] = removeDuplicateAndSort(["r20","s20","t20"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["r20","s20","t20"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["r20","s20","t20"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030411 end');
    })

    /**
     * @tc.name   testParseDedup030412
     * @tc.number SUB_ASSET_PARSEDEDUP_0412
     * @tc.desc   合法值：三元素数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup030412', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030412 begin');
      const result: string[] = removeDuplicateAndSort(["r21","s21","t21"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["r21","s21","t21"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["r21","s21","t21"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030412 end');
    })

    /**
     * @tc.name   testParseDedup030413
     * @tc.number SUB_ASSET_PARSEDEDUP_0413
     * @tc.desc   合法值：三元素数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup030413', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030413 begin');
      const result: string[] = removeDuplicateAndSort(["r22","s22","t22"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["r22","s22","t22"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["r22","s22","t22"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030413 end');
    })

    /**
     * @tc.name   testParseDedup030414
     * @tc.number SUB_ASSET_PARSEDEDUP_0414
     * @tc.desc   合法值：三元素数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup030414', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030414 begin');
      const result: string[] = removeDuplicateAndSort(["r23","s23","t23"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["r23","s23","t23"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["r23","s23","t23"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030414 end');
    })

    /**
     * @tc.name   testParseDedup030415
     * @tc.number SUB_ASSET_PARSEDEDUP_0415
     * @tc.desc   合法值：三元素数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup030415', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030415 begin');
      const result: string[] = removeDuplicateAndSort(["r24","s24","t24"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["r24","s24","t24"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["r24","s24","t24"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030415 end');
    })

    /**
     * @tc.name   testParseDedup030416
     * @tc.number SUB_ASSET_PARSEDEDUP_0416
     * @tc.desc   合法值：三元素数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup030416', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030416 begin');
      const result: string[] = removeDuplicateAndSort(["r25","s25","t25"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["r25","s25","t25"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["r25","s25","t25"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030416 end');
    })

    /**
     * @tc.name   testParseDedup030417
     * @tc.number SUB_ASSET_PARSEDEDUP_0417
     * @tc.desc   合法值：三元素数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup030417', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030417 begin');
      const result: string[] = removeDuplicateAndSort(["r26","s26","t26"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["r26","s26","t26"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["r26","s26","t26"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030417 end');
    })

    /**
     * @tc.name   testParseDedup030418
     * @tc.number SUB_ASSET_PARSEDEDUP_0418
     * @tc.desc   合法值：三元素数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup030418', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030418 begin');
      const result: string[] = removeDuplicateAndSort(["r27","s27","t27"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["r27","s27","t27"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["r27","s27","t27"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030418 end');
    })

    /**
     * @tc.name   testParseDedup030419
     * @tc.number SUB_ASSET_PARSEDEDUP_0419
     * @tc.desc   合法值：三元素数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup030419', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030419 begin');
      const result: string[] = removeDuplicateAndSort(["r28","s28","t28"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["r28","s28","t28"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["r28","s28","t28"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030419 end');
    })

    /**
     * @tc.name   testParseDedup030420
     * @tc.number SUB_ASSET_PARSEDEDUP_0420
     * @tc.desc   合法值：三元素数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup030420', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030420 begin');
      const result: string[] = removeDuplicateAndSort(["r29","s29","t29"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["r29","s29","t29"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["r29","s29","t29"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(3));
      expect(result.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030420 end');
    })

    /**
     * @tc.name   testParseDedup030421
     * @tc.number SUB_ASSET_PARSEDEDUP_0421
     * @tc.desc   边界值：四元素数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup030421', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030421 begin');
      const result: string[] = removeDuplicateAndSort(["u0","v0","w0","y0"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["u0","v0","w0","y0"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["u0","v0","w0","y0"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030421 end');
    })

    /**
     * @tc.name   testParseDedup030422
     * @tc.number SUB_ASSET_PARSEDEDUP_0422
     * @tc.desc   边界值：四元素数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup030422', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030422 begin');
      const result: string[] = removeDuplicateAndSort(["u1","v1","w1","y1"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["u1","v1","w1","y1"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["u1","v1","w1","y1"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030422 end');
    })

    /**
     * @tc.name   testParseDedup030423
     * @tc.number SUB_ASSET_PARSEDEDUP_0423
     * @tc.desc   边界值：四元素数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup030423', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030423 begin');
      const result: string[] = removeDuplicateAndSort(["u2","v2","w2","y2"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["u2","v2","w2","y2"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["u2","v2","w2","y2"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030423 end');
    })

    /**
     * @tc.name   testParseDedup030424
     * @tc.number SUB_ASSET_PARSEDEDUP_0424
     * @tc.desc   边界值：四元素数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup030424', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030424 begin');
      const result: string[] = removeDuplicateAndSort(["u3","v3","w3","y3"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["u3","v3","w3","y3"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["u3","v3","w3","y3"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030424 end');
    })

    /**
     * @tc.name   testParseDedup030425
     * @tc.number SUB_ASSET_PARSEDEDUP_0425
     * @tc.desc   边界值：四元素数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup030425', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030425 begin');
      const result: string[] = removeDuplicateAndSort(["u4","v4","w4","y4"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["u4","v4","w4","y4"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["u4","v4","w4","y4"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030425 end');
    })

    /**
     * @tc.name   testParseDedup030426
     * @tc.number SUB_ASSET_PARSEDEDUP_0426
     * @tc.desc   边界值：四元素数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup030426', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030426 begin');
      const result: string[] = removeDuplicateAndSort(["u5","v5","w5","y5"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["u5","v5","w5","y5"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["u5","v5","w5","y5"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030426 end');
    })

    /**
     * @tc.name   testParseDedup030427
     * @tc.number SUB_ASSET_PARSEDEDUP_0427
     * @tc.desc   边界值：四元素数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup030427', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030427 begin');
      const result: string[] = removeDuplicateAndSort(["u6","v6","w6","y6"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["u6","v6","w6","y6"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["u6","v6","w6","y6"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030427 end');
    })

    /**
     * @tc.name   testParseDedup030428
     * @tc.number SUB_ASSET_PARSEDEDUP_0428
     * @tc.desc   边界值：四元素数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup030428', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030428 begin');
      const result: string[] = removeDuplicateAndSort(["u7","v7","w7","y7"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["u7","v7","w7","y7"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["u7","v7","w7","y7"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030428 end');
    })

    /**
     * @tc.name   testParseDedup030429
     * @tc.number SUB_ASSET_PARSEDEDUP_0429
     * @tc.desc   边界值：四元素数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup030429', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030429 begin');
      const result: string[] = removeDuplicateAndSort(["u8","v8","w8","y8"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["u8","v8","w8","y8"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["u8","v8","w8","y8"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030429 end');
    })

    /**
     * @tc.name   testParseDedup030430
     * @tc.number SUB_ASSET_PARSEDEDUP_0430
     * @tc.desc   边界值：四元素数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup030430', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030430 begin');
      const result: string[] = removeDuplicateAndSort(["u9","v9","w9","y9"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["u9","v9","w9","y9"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["u9","v9","w9","y9"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030430 end');
    })

    /**
     * @tc.name   testParseDedup030431
     * @tc.number SUB_ASSET_PARSEDEDUP_0431
     * @tc.desc   边界值：四元素数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup030431', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030431 begin');
      const result: string[] = removeDuplicateAndSort(["u10","v10","w10","y10"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["u10","v10","w10","y10"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["u10","v10","w10","y10"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030431 end');
    })

    /**
     * @tc.name   testParseDedup030432
     * @tc.number SUB_ASSET_PARSEDEDUP_0432
     * @tc.desc   边界值：四元素数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup030432', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030432 begin');
      const result: string[] = removeDuplicateAndSort(["u11","v11","w11","y11"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["u11","v11","w11","y11"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["u11","v11","w11","y11"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030432 end');
    })

    /**
     * @tc.name   testParseDedup030433
     * @tc.number SUB_ASSET_PARSEDEDUP_0433
     * @tc.desc   边界值：四元素数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup030433', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030433 begin');
      const result: string[] = removeDuplicateAndSort(["u12","v12","w12","y12"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["u12","v12","w12","y12"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["u12","v12","w12","y12"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030433 end');
    })

    /**
     * @tc.name   testParseDedup030434
     * @tc.number SUB_ASSET_PARSEDEDUP_0434
     * @tc.desc   边界值：四元素数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup030434', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030434 begin');
      const result: string[] = removeDuplicateAndSort(["u13","v13","w13","y13"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["u13","v13","w13","y13"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["u13","v13","w13","y13"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030434 end');
    })

    /**
     * @tc.name   testParseDedup030435
     * @tc.number SUB_ASSET_PARSEDEDUP_0435
     * @tc.desc   边界值：四元素数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup030435', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030435 begin');
      const result: string[] = removeDuplicateAndSort(["u14","v14","w14","y14"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["u14","v14","w14","y14"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["u14","v14","w14","y14"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030435 end');
    })

    /**
     * @tc.name   testParseDedup030436
     * @tc.number SUB_ASSET_PARSEDEDUP_0436
     * @tc.desc   边界值：四元素数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup030436', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030436 begin');
      const result: string[] = removeDuplicateAndSort(["u15","v15","w15","y15"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["u15","v15","w15","y15"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["u15","v15","w15","y15"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030436 end');
    })

    /**
     * @tc.name   testParseDedup030437
     * @tc.number SUB_ASSET_PARSEDEDUP_0437
     * @tc.desc   边界值：四元素数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup030437', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030437 begin');
      const result: string[] = removeDuplicateAndSort(["u16","v16","w16","y16"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["u16","v16","w16","y16"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["u16","v16","w16","y16"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030437 end');
    })

    /**
     * @tc.name   testParseDedup030438
     * @tc.number SUB_ASSET_PARSEDEDUP_0438
     * @tc.desc   边界值：四元素数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup030438', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030438 begin');
      const result: string[] = removeDuplicateAndSort(["u17","v17","w17","y17"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["u17","v17","w17","y17"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["u17","v17","w17","y17"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030438 end');
    })

    /**
     * @tc.name   testParseDedup030439
     * @tc.number SUB_ASSET_PARSEDEDUP_0439
     * @tc.desc   边界值：四元素数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup030439', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030439 begin');
      const result: string[] = removeDuplicateAndSort(["u18","v18","w18","y18"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["u18","v18","w18","y18"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["u18","v18","w18","y18"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030439 end');
    })

    /**
     * @tc.name   testParseDedup030440
     * @tc.number SUB_ASSET_PARSEDEDUP_0440
     * @tc.desc   边界值：四元素数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup030440', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030440 begin');
      const result: string[] = removeDuplicateAndSort(["u19","v19","w19","y19"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["u19","v19","w19","y19"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["u19","v19","w19","y19"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030440 end');
    })

    /**
     * @tc.name   testParseDedup030441
     * @tc.number SUB_ASSET_PARSEDEDUP_0441
     * @tc.desc   边界值：四元素数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup030441', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030441 begin');
      const result: string[] = removeDuplicateAndSort(["u20","v20","w20","y20"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["u20","v20","w20","y20"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["u20","v20","w20","y20"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030441 end');
    })

    /**
     * @tc.name   testParseDedup030442
     * @tc.number SUB_ASSET_PARSEDEDUP_0442
     * @tc.desc   边界值：四元素数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup030442', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030442 begin');
      const result: string[] = removeDuplicateAndSort(["u21","v21","w21","y21"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["u21","v21","w21","y21"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["u21","v21","w21","y21"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030442 end');
    })

    /**
     * @tc.name   testParseDedup030443
     * @tc.number SUB_ASSET_PARSEDEDUP_0443
     * @tc.desc   边界值：四元素数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup030443', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030443 begin');
      const result: string[] = removeDuplicateAndSort(["u22","v22","w22","y22"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["u22","v22","w22","y22"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["u22","v22","w22","y22"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030443 end');
    })

    /**
     * @tc.name   testParseDedup030444
     * @tc.number SUB_ASSET_PARSEDEDUP_0444
     * @tc.desc   边界值：四元素数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup030444', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030444 begin');
      const result: string[] = removeDuplicateAndSort(["u23","v23","w23","y23"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["u23","v23","w23","y23"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["u23","v23","w23","y23"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030444 end');
    })

    /**
     * @tc.name   testParseDedup030445
     * @tc.number SUB_ASSET_PARSEDEDUP_0445
     * @tc.desc   边界值：四元素数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup030445', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030445 begin');
      const result: string[] = removeDuplicateAndSort(["u24","v24","w24","y24"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["u24","v24","w24","y24"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["u24","v24","w24","y24"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030445 end');
    })

    /**
     * @tc.name   testParseDedup030446
     * @tc.number SUB_ASSET_PARSEDEDUP_0446
     * @tc.desc   边界值：四元素数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup030446', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030446 begin');
      const result: string[] = removeDuplicateAndSort(["u25","v25","w25","y25"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["u25","v25","w25","y25"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["u25","v25","w25","y25"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030446 end');
    })

    /**
     * @tc.name   testParseDedup030447
     * @tc.number SUB_ASSET_PARSEDEDUP_0447
     * @tc.desc   边界值：四元素数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup030447', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030447 begin');
      const result: string[] = removeDuplicateAndSort(["u26","v26","w26","y26"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["u26","v26","w26","y26"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["u26","v26","w26","y26"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030447 end');
    })

    /**
     * @tc.name   testParseDedup030448
     * @tc.number SUB_ASSET_PARSEDEDUP_0448
     * @tc.desc   边界值：四元素数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup030448', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030448 begin');
      const result: string[] = removeDuplicateAndSort(["u27","v27","w27","y27"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["u27","v27","w27","y27"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["u27","v27","w27","y27"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030448 end');
    })

    /**
     * @tc.name   testParseDedup030449
     * @tc.number SUB_ASSET_PARSEDEDUP_0449
     * @tc.desc   边界值：四元素数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup030449', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030449 begin');
      const result: string[] = removeDuplicateAndSort(["u28","v28","w28","y28"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["u28","v28","w28","y28"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["u28","v28","w28","y28"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030449 end');
    })

    /**
     * @tc.name   testParseDedup030450
     * @tc.number SUB_ASSET_PARSEDEDUP_0450
     * @tc.desc   边界值：四元素数组去重排序
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseDedup030450', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030450 begin');
      const result: string[] = removeDuplicateAndSort(["u29","v29","w29","y29"]);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(JSON.stringify(result)),
        String(["u29","v29","w29","y29"]));
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(["u29","v29","w29","y29"]));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testParseDedup030450 end');
    })

  })
}
