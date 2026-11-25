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
import { compareArray, stringToArray } from '../../../main/ets/model/AssetModel';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Asset]';

export default function parseCmpReal() {
  describe('ParseCmpRealTest', () => {
    /**
     * @tc.number SUB_ASSET_PARSECMP_0301
     * @tc.name testParseCmp0301
     * @tc.desc 合法值：同值同长数组比较相等
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testParseCmp0301', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseCmp0301 begin');
      const result: boolean = compareArray(new Uint8Array([1, 2, 3]), new Uint8Array([1, 2, 3]));
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', String(result), 'true');
      expect(result).assertTrue();
      expect(typeof result === 'boolean').assertTrue();
      expect(String(result)).assertEqual('true');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseCmp0301 end');
    });

    /**
     * @tc.number SUB_ASSET_PARSECMP_0302
     * @tc.name testParseCmp0302
     * @tc.desc 非法值：同长不同值数组比较不等
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testParseCmp0302', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseCmp0302 begin');
      const result: boolean = compareArray(new Uint8Array([1, 2, 3]), new Uint8Array([1, 2, 4]));
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', String(result), 'false');
      expect(result).assertFalse();
      expect(typeof result === 'boolean').assertTrue();
      expect(String(result)).assertEqual('false');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseCmp0302 end');
    });

    /**
     * @tc.number SUB_ASSET_PARSECMP_0303
     * @tc.name testParseCmp0303
     * @tc.desc 边界值：两个空数组比较相等
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testParseCmp0303', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseCmp0303 begin');
      const result: boolean = compareArray(new Uint8Array([]), new Uint8Array([]));
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', String(result), 'true');
      expect(result).assertTrue();
      expect(typeof result === 'boolean').assertTrue();
      expect(String(result)).assertEqual('true');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseCmp0303 end');
    });

    /**
     * @tc.number SUB_ASSET_PARSECMP_0304
     * @tc.name testParseCmp0304
     * @tc.desc 边界值：空数组与非空数组比较不等
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testParseCmp0304', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseCmp0304 begin');
      const result: boolean = compareArray(new Uint8Array([]), new Uint8Array([1]));
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', String(result), 'false');
      expect(result).assertFalse();
      expect(typeof result === 'boolean').assertTrue();
      expect(String(result)).assertEqual('false');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseCmp0304 end');
    });

    /**
     * @tc.number SUB_ASSET_PARSECMP_0305
     * @tc.name testParseCmp0305
     * @tc.desc 边界值：单字节同值数组比较相等
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testParseCmp0305', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseCmp0305 begin');
      const result: boolean = compareArray(new Uint8Array([9]), new Uint8Array([9]));
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', String(result), 'true');
      expect(result).assertTrue();
      expect(typeof result === 'boolean').assertTrue();
      expect(String(result)).assertEqual('true');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseCmp0305 end');
    });

    /**
     * @tc.number SUB_ASSET_PARSECMP_0306
     * @tc.name testParseCmp0306
     * @tc.desc 边界值：单字节不同值数组比较不等
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testParseCmp0306', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseCmp0306 begin');
      const result: boolean = compareArray(new Uint8Array([9]), new Uint8Array([8]));
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', String(result), 'false');
      expect(result).assertFalse();
      expect(typeof result === 'boolean').assertTrue();
      expect(String(result)).assertEqual('false');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseCmp0306 end');
    });

    /**
     * @tc.number SUB_ASSET_PARSECMP_0307
     * @tc.name testParseCmp0307
     * @tc.desc 非法值：不同长度数组比较不等
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testParseCmp0307', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseCmp0307 begin');
      const result: boolean = compareArray(new Uint8Array([1, 2]), new Uint8Array([1, 2, 3]));
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', String(result), 'false');
      expect(result).assertFalse();
      expect(typeof result === 'boolean').assertTrue();
      expect(String(result)).assertEqual('false');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseCmp0307 end');
    });

    /**
     * @tc.number SUB_ASSET_PARSECMP_0308
     * @tc.name testParseCmp0308
     * @tc.desc 组合值：同串编码结果比较相等
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testParseCmp0308', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseCmp0308 begin');
      const result: boolean = compareArray(stringToArray('asset'), stringToArray('asset'));
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', String(result), 'true');
      expect(result).assertTrue();
      expect(typeof result === 'boolean').assertTrue();
      expect(String(result)).assertEqual('true');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseCmp0308 end');
    });

    /**
     * @tc.number SUB_ASSET_PARSECMP_0309
     * @tc.name testParseCmp0309
     * @tc.desc 状态值：比较后输入数组内容不变
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testParseCmp0309', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseCmp0309 begin');
      const left: Uint8Array = new Uint8Array([1, 2, 3]);
      const right: Uint8Array = new Uint8Array([1, 2, 4]);
      compareArray(left, right);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', String(left[2]), '3');
      expect(left[2]).assertEqual(3);
      expect(right[2]).assertEqual(4);
      expect(left.length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseCmp0309 end');
    });

    /**
     * @tc.number SUB_ASSET_PARSECMP_0310
     * @tc.name testParseCmp0310
     * @tc.desc 合法值：全零数组比较相等
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testParseCmp0310', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseCmp0310 begin');
      const result: boolean = compareArray(new Uint8Array([0, 0, 0]), new Uint8Array([0, 0, 0]));
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', String(result), 'true');
      expect(result).assertTrue();
      expect(typeof result === 'boolean').assertTrue();
      expect(String(result)).assertEqual('true');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseCmp0310 end');
    });

    /**
     * @tc.number SUB_ASSET_PARSECMP_0311
     * @tc.name testParseCmp0311
     * @tc.desc 合法值：全 255 上界字节数组比较相等
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testParseCmp0311', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseCmp0311 begin');
      const result: boolean = compareArray(new Uint8Array([255, 255]), new Uint8Array([255, 255]));
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', String(result), 'true');
      expect(result).assertTrue();
      expect(typeof result === 'boolean').assertTrue();
      expect(String(result)).assertEqual('true');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseCmp0311 end');
    });

    /**
     * @tc.number SUB_ASSET_PARSECMP_0312
     * @tc.name testParseCmp0312
     * @tc.desc 组合值：中文串编码比较相等
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testParseCmp0312', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseCmp0312 begin');
      const result: boolean = compareArray(stringToArray('中文密码'), stringToArray('中文密码'));
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', String(result), 'true');
      expect(result).assertTrue();
      expect(typeof result === 'boolean').assertTrue();
      expect(String(result)).assertEqual('true');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseCmp0312 end');
    });

    /**
     * @tc.number SUB_ASSET_PARSECMP_0313
     * @tc.name testParseCmp0313
     * @tc.desc 状态值：连续两次比较结果一致
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testParseCmp0313', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseCmp0313 begin');
      const left: Uint8Array = new Uint8Array([5, 6]);
      const right: Uint8Array = new Uint8Array([5, 7]);
      const first: boolean = compareArray(left, right);
      const second: boolean = compareArray(left, right);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', String(first), 'false');
      expect(first).assertFalse();
      expect(second).assertEqual(first);
      expect(typeof second === 'boolean').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseCmp0313 end');
    });

    /**
     * @tc.number SUB_ASSET_PARSECMP_0314
     * @tc.name testParseCmp0314
     * @tc.desc 边界值：双字节数组比较
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testParseCmp0314', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseCmp0314 begin');
      const result: boolean = compareArray(new Uint8Array([12, 34]), new Uint8Array([12, 34]));
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', String(result), 'true');
      expect(result).assertTrue();
      expect(typeof result === 'boolean').assertTrue();
      expect(String(result)).assertEqual('true');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseCmp0314 end');
    });

    /**
     * @tc.number SUB_ASSET_PARSECMP_0315
     * @tc.name testParseCmp0315
     * @tc.desc 组合值：同字符不同编码字节比较不等
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testParseCmp0315', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseCmp0315 begin');
      const result: boolean = compareArray(stringToArray('A'), stringToArray('a'));
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', String(result), 'false');
      expect(result).assertFalse();
      expect(typeof result === 'boolean').assertTrue();
      expect(String(result)).assertEqual('false');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseCmp0315 end');
    });

    /**
     * @tc.number SUB_ASSET_PARSECMP_0316
     * @tc.name testParseCmp0316
     * @tc.desc 极值：256 字节数组比较相等
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testParseCmp0316', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseCmp0316 begin');
      const left: Uint8Array = new Uint8Array(256);
      const right: Uint8Array = new Uint8Array(256);
      for (let i: number = 0; i < 256; i++) {
        left[i] = i % 256;
        right[i] = i % 256;
      }
      const result: boolean = compareArray(left, right);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', String(result), 'true');
      expect(result).assertTrue();
      expect(typeof result === 'boolean').assertTrue();
      expect(String(result)).assertEqual('true');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseCmp0316 end');
    });

    /**
     * @tc.number SUB_ASSET_PARSECMP_0317
     * @tc.name testParseCmp0317
     * @tc.desc 合法值：前段相同末字节不同比较不等
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testParseCmp0317', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseCmp0317 begin');
      const left: Uint8Array = new Uint8Array(128);
      const right: Uint8Array = new Uint8Array(128);
      for (let i: number = 0; i < 128; i++) {
        left[i] = i;
        right[i] = i;
      }
      right[127] = 99;
      const result: boolean = compareArray(left, right);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', String(result), 'false');
      expect(result).assertFalse();
      expect(typeof result === 'boolean').assertTrue();
      expect(String(result)).assertEqual('false');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseCmp0317 end');
    });

    /**
     * @tc.number SUB_ASSET_PARSECMP_0318
     * @tc.name testParseCmp0318
     * @tc.desc 状态值：比较不改变输入数组长度
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testParseCmp0318', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseCmp0318 begin');
      const left: Uint8Array = new Uint8Array([1, 2]);
      const right: Uint8Array = new Uint8Array([1, 2, 3]);
      compareArray(left, right);
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', left.length, 2);
      expect(left.length).assertEqual(2);
      expect(right.length).assertEqual(3);
      expect(left.byteLength).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseCmp0318 end');
    });

    /**
     * @tc.number SUB_ASSET_PARSECMP_0319
     * @tc.name testParseCmp0319
     * @tc.desc 组合值：emoji 串编码比较相等
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testParseCmp0319', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseCmp0319 begin');
      const result: boolean = compareArray(stringToArray('😀🎉'), stringToArray('😀🎉'));
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', String(result), 'true');
      expect(result).assertTrue();
      expect(typeof result === 'boolean').assertTrue();
      expect(String(result)).assertEqual('true');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseCmp0319 end');
    });

    /**
     * @tc.number SUB_ASSET_PARSECMP_0320
     * @tc.name testParseCmp0320
     * @tc.desc 边界值：10 字节数组比较
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testParseCmp0320', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseCmp0320 begin');
      const result: boolean = compareArray(new Uint8Array([0, 1, 2, 3, 4, 5, 6, 7, 8, 9]),
        new Uint8Array([0, 1, 2, 3, 4, 5, 6, 7, 8, 9]));
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', String(result), 'true');
      expect(result).assertTrue();
      expect(typeof result === 'boolean').assertTrue();
      expect(String(result)).assertEqual('true');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseCmp0320 end');
    });

    /**
     * @tc.number SUB_ASSET_PARSECMP_0321
     * @tc.name testParseCmp0321
     * @tc.desc 状态值：返回类型为 boolean
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testParseCmp0321', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseCmp0321 begin');
      const result: boolean = compareArray(new Uint8Array([1]), new Uint8Array([1]));
      hilog.info(DOMAIN, TAG, 'type=%{public}s', String(typeof result));
      expect(typeof result === 'boolean').assertTrue();
      expect(result).assertTrue();
      expect(String(result)).assertEqual('true');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseCmp0321 end');
    });

    /**
     * @tc.number SUB_ASSET_PARSECMP_0322
     * @tc.name testParseCmp0322
     * @tc.desc 组合值：大小写串编码比较不等
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testParseCmp0322', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseCmp0322 begin');
      const result: boolean = compareArray(stringToArray('Case'), stringToArray('case'));
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', String(result), 'false');
      expect(result).assertFalse();
      expect(typeof result === 'boolean').assertTrue();
      expect(String(result)).assertEqual('false');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseCmp0322 end');
    });

    /**
     * @tc.number SUB_ASSET_PARSECMP_0323
     * @tc.name testParseCmp0323
     * @tc.desc 极值：1000 字节数组比较相等
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testParseCmp0323', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseCmp0323 begin');
      const left: Uint8Array = new Uint8Array(1000);
      const right: Uint8Array = new Uint8Array(1000);
      for (let i: number = 0; i < 1000; i++) {
        left[i] = i % 251;
        right[i] = i % 251;
      }
      const result: boolean = compareArray(left, right);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', String(result), 'true');
      expect(result).assertTrue();
      expect(typeof result === 'boolean').assertTrue();
      expect(String(result)).assertEqual('true');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseCmp0323 end');
    });

    /**
     * @tc.number SUB_ASSET_PARSECMP_0324
     * @tc.name testParseCmp0324
     * @tc.desc 状态值：同一实例自比较为真
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testParseCmp0324', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseCmp0324 begin');
      const arr: Uint8Array = new Uint8Array([7, 8, 9]);
      const result: boolean = compareArray(arr, arr);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', String(result), 'true');
      expect(result).assertTrue();
      expect(typeof result === 'boolean').assertTrue();
      expect(String(result)).assertEqual('true');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseCmp0324 end');
    });

    /**
     * @tc.number SUB_ASSET_PARSECMP_0325
     * @tc.name testParseCmp0325
     * @tc.desc 组合值：按值相等的两个独立实例比较为真
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testParseCmp0325', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseCmp0325 begin');
      const first: Uint8Array = new Uint8Array([1, 2]);
      const second: Uint8Array = new Uint8Array([1, 2]);
      const result: boolean = compareArray(first, second);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', String(result), 'true');
      expect(result).assertTrue();
      expect(first === second).assertFalse();
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseCmp0325 end');
    });

    /**
     * @tc.number SUB_ASSET_PARSECMP_0326
     * @tc.name testParseCmp0326
     * @tc.desc 状态值：交换参数后比较结果保持不变
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testParseCmp0326', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseCmp0326 begin');
      const left: Uint8Array = new Uint8Array([1, 2]);
      const right: Uint8Array = new Uint8Array([1, 3]);
      const forward: boolean = compareArray(left, right);
      const backward: boolean = compareArray(right, left);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', String(forward), 'false');
      expect(forward).assertFalse();
      expect(backward).assertEqual(forward);
      expect(typeof backward === 'boolean').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseCmp0326 end');
    });

    /**
     * @tc.number SUB_ASSET_PARSECMP_0327
     * @tc.name testParseCmp0327
     * @tc.desc 边界值：末字节不同比较不等
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testParseCmp0327', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseCmp0327 begin');
      const result: boolean = compareArray(new Uint8Array([1, 1, 1]), new Uint8Array([1, 1, 2]));
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', String(result), 'false');
      expect(result).assertFalse();
      expect(typeof result === 'boolean').assertTrue();
      expect(String(result)).assertEqual('false');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseCmp0327 end');
    });

    /**
     * @tc.number SUB_ASSET_PARSECMP_0328
     * @tc.name testParseCmp0328
     * @tc.desc 边界值：首字节不同比较不等
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testParseCmp0328', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseCmp0328 begin');
      const result: boolean = compareArray(new Uint8Array([9, 2, 3]), new Uint8Array([1, 2, 3]));
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', String(result), 'false');
      expect(result).assertFalse();
      expect(typeof result === 'boolean').assertTrue();
      expect(String(result)).assertEqual('false');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseCmp0328 end');
    });

    /**
     * @tc.number SUB_ASSET_PARSECMP_0329
     * @tc.name testParseCmp0329
     * @tc.desc 组合值：单字节零值数组与同值数组比较相等
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testParseCmp0329', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseCmp0329 begin');
      const result: boolean = compareArray(new Uint8Array([0]), new Uint8Array([0]));
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', String(result), 'true');
      expect(result).assertTrue();
      expect(typeof result === 'boolean').assertTrue();
      expect(String(result)).assertEqual('true');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseCmp0329 end');
    });

    /**
     * @tc.number SUB_ASSET_PARSECMP_0330
     * @tc.name testParseCmp0330
     * @tc.desc 状态值：不同引用的空数组比较为真
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testParseCmp0330', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseCmp0330 begin');
      const first: Uint8Array = new Uint8Array([]);
      const second: Uint8Array = new Uint8Array([]);
      const result: boolean = compareArray(first, second);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', String(result), 'true');
      expect(result).assertTrue();
      expect(first === second).assertFalse();
      expect(typeof result === 'boolean').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseCmp0330 end');
    });
  });
}


