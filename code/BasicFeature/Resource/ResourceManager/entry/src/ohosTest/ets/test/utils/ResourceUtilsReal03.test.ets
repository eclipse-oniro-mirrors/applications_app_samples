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
import { ResourceUtils } from '../../../../main/ets/utils/ResourceUtils';

const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[Sample_ResourceManager]';

export default function resourceUtilsReal03Test() {
  describe('ResourceUtilsReal03Test', () => {

    /**
     * @tc.name   testResourceUtilsReal0301
     * @tc.number SUB_RESMGR_UTILS_REAL_0301
     * @tc.desc   大小格式化在 1 KB 临界两侧换档，1023 仍是字节，1024 起带小数
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsReal0301', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsReal0301 begin');
      const below: string = ResourceUtils.formatByteSize(1023);
      const exactly: string = ResourceUtils.formatByteSize(1024);
      const above: string = ResourceUtils.formatByteSize(1025);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s/%{public}s/%{public}s', below, exactly, above);
      expect(below).assertEqual('1023 B');
      expect(exactly).assertEqual('1.0 KB');
      expect(above).assertEqual('1.0 KB');
      expect(below === exactly).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsReal0301 end');
    })

    /**
     * @tc.name   testResourceUtilsReal0302
     * @tc.number SUB_RESMGR_UTILS_REAL_0302
     * @tc.desc   1 MB 临界两侧换档，且小数位只保留一位
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsReal0302', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsReal0302 begin');
      const almost: string = ResourceUtils.formatByteSize(1048575);
      const exactly: string = ResourceUtils.formatByteSize(1048576);
      const oneAndHalf: string = ResourceUtils.formatByteSize(1536);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s/%{public}s/%{public}s', almost, exactly, oneAndHalf);
      expect(almost).assertEqual('1023.9 KB');
      expect(exactly).assertEqual('1.0 MB');
      expect(oneAndHalf).assertEqual('1.5 KB');
      expect(almost.endsWith('KB')).assertTrue();
      expect(exactly.endsWith('MB')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsReal0302 end');
    })

    /**
     * @tc.name   testResourceUtilsReal0303
     * @tc.number SUB_RESMGR_UTILS_REAL_0303
     * @tc.desc   超过单位上限后继续用 MB 表达，数值放大而单位不变
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsReal0303', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsReal0303 begin');
      const tenMb: string = ResourceUtils.formatByteSize(10485760);
      const oneGb: string = ResourceUtils.formatByteSize(1073741824);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s/%{public}s expected=10.0 MB/1024.0 MB', tenMb, oneGb);
      expect(tenMb).assertEqual('10.0 MB');
      expect(oneGb).assertEqual('1024.0 MB');
      expect(tenMb.endsWith('MB')).assertTrue();
      expect(tenMb.indexOf('NaN')).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsReal0303 end');
    })

    /**
     * @tc.name   testResourceUtilsReal0304
     * @tc.number SUB_RESMGR_UTILS_REAL_0304
     * @tc.desc   零、负数与非整数字节数统一回落 0 B，不进入分档逻辑
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsReal0304', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsReal0304 begin');
      const zero: string = ResourceUtils.formatByteSize(0);
      const negative: string = ResourceUtils.formatByteSize(-1024);
      const fractional: string = ResourceUtils.formatByteSize(3.7);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=[%{public}s][%{public}s][%{public}s] expected=[0 B]', zero, negative,
        fractional);
      expect(zero).assertEqual('0 B');
      expect(negative).assertEqual('0 B');
      expect(fractional).assertEqual('0 B');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsReal0304 end');
    })

    /**
     * @tc.name   testResourceUtilsReal0305
     * @tc.number SUB_RESMGR_UTILS_REAL_0305
     * @tc.desc   编码长度按 3 字节一组向上取整，1 到 3 字节都占一组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsReal0305', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsReal0305 begin');
      let grouped: number = 0;
      for (let bytes: number = 1; bytes <= 3; bytes++) {
        if (ResourceUtils.expectedBase64Length(bytes) === 4) {
          grouped++;
        }
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d/expected=4/%{public}d', grouped,
        ResourceUtils.expectedBase64Length(4));
      expect(grouped).assertEqual(3);
      expect(ResourceUtils.expectedBase64Length(4)).assertEqual(8);
      expect(ResourceUtils.expectedBase64Length(6)).assertEqual(8);
      expect(ResourceUtils.expectedBase64Length(7)).assertEqual(12);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsReal0305 end');
    })

    /**
     * @tc.name   testResourceUtilsReal0306
     * @tc.number SUB_RESMGR_UTILS_REAL_0306
     * @tc.desc   编码长度对零、负数与非整数一律返回 0，不抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsReal0306', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsReal0306 begin');
      expect(ResourceUtils.expectedBase64Length(0)).assertEqual(0);
      expect(ResourceUtils.expectedBase64Length(-3)).assertEqual(0);
      expect(ResourceUtils.expectedBase64Length(2.5)).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsReal0306 end');
    })

    /**
     * @tc.name   testResourceUtilsReal0307
     * @tc.number SUB_RESMGR_UTILS_REAL_0307
     * @tc.desc   无填充串按每 4 字符 3 字节反算
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsReal0307', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsReal0307 begin');
      const one: number = ResourceUtils.decodedByteLength('QUJD');
      const two: number = ResourceUtils.decodedByteLength('QUJDREVG');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d/%{public}d expected=3/6', one, two);
      expect(one).assertEqual(3);
      expect(two).assertEqual(6);
      expect(two - one).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsReal0307 end');
    })

    /**
     * @tc.name   testResourceUtilsReal0308
     * @tc.number SUB_RESMGR_UTILS_REAL_0308
     * @tc.desc   末尾两个等号扣两字节，一个等号扣一字节
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsReal0308', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsReal0308 begin');
      const onePad: number = ResourceUtils.decodedByteLength('QQA=');
      const twoPad: number = ResourceUtils.decodedByteLength('QQ==');
      const plain: number = ResourceUtils.decodedByteLength('QUJD');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d/%{public}d/%{public}d expected=2/1/3', onePad, twoPad,
        plain);
      expect(onePad).assertEqual(2);
      expect(twoPad).assertEqual(1);
      expect(plain).assertEqual(3);
      expect(plain - twoPad).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsReal0308 end');
    })

    /**
     * @tc.name   testResourceUtilsReal0309
     * @tc.number SUB_RESMGR_UTILS_REAL_0309
     * @tc.desc   等号不在末尾时不参与填充扣减
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsReal0309', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsReal0309 begin');
      const inner: number = ResourceUtils.decodedByteLength('QU=DRA==');
      const tail: number = ResourceUtils.decodedByteLength('QUDRA===');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d/%{public}d', inner, tail);
      expect(inner).assertEqual(4);
      expect(tail).assertEqual(4);
      expect(inner).assertEqual(tail);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsReal0309 end');
    })

    /**
     * @tc.name   testResourceUtilsReal0310
     * @tc.number SUB_RESMGR_UTILS_REAL_0310
     * @tc.desc   长度不是 4 的倍数、空串、纯填充串的判定边界
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsReal0310', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsReal0310 begin');
      expect(ResourceUtils.decodedByteLength('')).assertEqual(-1);
      expect(ResourceUtils.decodedByteLength('QUJDR')).assertEqual(-1);
      expect(ResourceUtils.decodedByteLength('A===')).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsReal0310 end');
    })

    /**
     * @tc.name   testResourceUtilsReal0311
     * @tc.number SUB_RESMGR_UTILS_REAL_0311
     * @tc.desc   1 到 12 字节编码后再解码必须回到原长度
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsReal0311', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsReal0311 begin');
      let closed: number = 0;
      for (let bytes: number = 1; bytes <= 12; bytes++) {
        const encoded: number = ResourceUtils.expectedBase64Length(bytes);
        const body: string = 'B'.repeat(encoded);
        const padding: number = encoded / 4 * 3 - bytes;
        const padded: string = body.substring(0, encoded - padding) + '='.repeat(padding);
        if (ResourceUtils.decodedByteLength(padded) === bytes) {
          closed++;
        }
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=12', closed);
      expect(closed).assertEqual(12);
      expect(ResourceUtils.decodedByteLength('BBBB')).assertEqual(3);
      expect(closed > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsReal0311 end');
    })

    /**
     * @tc.name   testResourceUtilsReal0312
     * @tc.number SUB_RESMGR_UTILS_REAL_0312
     * @tc.desc   密度归一化在升序输入上单调不减
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsReal0312', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsReal0312 begin');
      const inputs: number[] = [121, 159, 160, 239, 240, 319, 320, 479, 480, 639, 640, 641];
      let monotonic: number = 0;
      let previous: number = 0;
      for (let index: number = 0; index < inputs.length; index++) {
        const normalized: number = ResourceUtils.normalizeDensity(inputs[index]);
        if (normalized >= previous) {
          monotonic++;
        }
        previous = normalized;
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', monotonic, inputs.length);
      expect(monotonic).assertEqual(inputs.length);
      expect(ResourceUtils.normalizeDensity(159)).assertEqual(120);
      expect(ResourceUtils.normalizeDensity(239)).assertEqual(160);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsReal0312 end');
    })

    /**
     * @tc.name   testResourceUtilsReal0313
     * @tc.number SUB_RESMGR_UTILS_REAL_0313
     * @tc.desc   归一化结果必定是系统预置档位之一
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsReal0313', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsReal0313 begin');
      let supported: number = 0;
      for (let density: number = 1; density <= 700; density = density + 37) {
        if (ResourceUtils.isDensitySupported(ResourceUtils.normalizeDensity(density))) {
          supported++;
        }
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=19/640=%{public}d', supported,
        ResourceUtils.normalizeDensity(640));
      expect(supported).assertEqual(19);
      expect(ResourceUtils.normalizeDensity(640)).assertEqual(640);
      expect(ResourceUtils.normalizeDensity(639)).assertEqual(480);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsReal0313 end');
    })

    /**
     * @tc.name   testResourceUtilsReal0314
     * @tc.number SUB_RESMGR_UTILS_REAL_0314
     * @tc.desc   档位比例乘以基准密度回到档位本身，两端档位取值固定
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsReal0314', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsReal0314 begin');
      const lowest: number = ResourceUtils.densityToScale(120);
      const highest: number = ResourceUtils.densityToScale(640);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}f/%{public}f expected=0.75/4', lowest, highest);
      expect(lowest).assertEqual(0.75);
      expect(highest).assertEqual(4);
      expect(lowest * ResourceUtils.BASE_DENSITY).assertEqual(120);
      expect(highest * ResourceUtils.BASE_DENSITY).assertEqual(640);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsReal0314 end');
    })

    /**
     * @tc.name   testResourceUtilsReal0315
     * @tc.number SUB_RESMGR_UTILS_REAL_0315
     * @tc.desc   非法密度统一回落默认档位，比例随之固定
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsReal0315', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsReal0315 begin');
      const fromZero: number = ResourceUtils.normalizeDensity(0);
      const fromNegative: number = ResourceUtils.normalizeDensity(-240);
      const fromFraction: number = ResourceUtils.normalizeDensity(480.5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d/%{public}d/%{public}d expected=320', fromZero, fromNegative,
        fromFraction);
      expect(fromZero).assertEqual(ResourceUtils.DEFAULT_DENSITY);
      expect(fromNegative).assertEqual(ResourceUtils.DEFAULT_DENSITY);
      expect(fromFraction).assertEqual(ResourceUtils.DEFAULT_DENSITY);
      expect(ResourceUtils.densityToScale(0)).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsReal0315 end');
    })

    /**
     * @tc.name   testResourceUtilsReal0316
     * @tc.number SUB_RESMGR_UTILS_REAL_0316
     * @tc.desc   占位词清洗去掉首尾空白但保留内部空白
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsReal0316', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsReal0316 begin');
      const inner: string = ResourceUtils.sanitizeWorld('  a  b  ');
      const leading: string = ResourceUtils.sanitizeWorld('   apple');
      const trailing: string = ResourceUtils.sanitizeWorld('orange   ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=[%{public}s][%{public}s][%{public}s]', inner, leading, trailing);
      expect(inner).assertEqual('a  b');
      expect(leading).assertEqual('apple');
      expect(trailing).assertEqual('orange');
      expect(inner.indexOf('a  b')).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsReal0316 end');
    })

    /**
     * @tc.name   testResourceUtilsReal0317
     * @tc.number SUB_RESMGR_UTILS_REAL_0317
     * @tc.desc   超过 16 字符的词截断后追加省略号，结果长度固定为 19
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsReal0317', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsReal0317 begin');
      const short: string = ResourceUtils.sanitizeWorld('1234567890123456');
      const long: string = ResourceUtils.sanitizeWorld('12345678901234567');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d/%{public}d expected=16/19', short.length, long.length);
      expect(short).assertEqual('1234567890123456');
      expect(short.length).assertEqual(ResourceUtils.WORLD_MAX_LENGTH);
      expect(long).assertEqual('1234567890123456...');
      expect(long.length).assertEqual(ResourceUtils.WORLD_MAX_LENGTH + 3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsReal0317 end');
    })

    /**
     * @tc.name   testResourceUtilsReal0318
     * @tc.number SUB_RESMGR_UTILS_REAL_0318
     * @tc.desc   清洗结果再次清洗保持不变，空输入回落默认词
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsReal0318', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsReal0318 begin');
      const once: string = ResourceUtils.sanitizeWorld('   abcdefghijklmnopqrstuvwxyz   ');
      const twice: string = ResourceUtils.sanitizeWorld(once);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=[%{public}s] expected=[%{public}s]', twice, once);
      expect(twice).assertEqual(once);
      expect(once).assertEqual('abcdefghijklmnop...');
      expect(ResourceUtils.sanitizeWorld('')).assertEqual(ResourceUtils.DEFAULT_WORLD);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsReal0318 end');
    })

    /**
     * @tc.name   testResourceUtilsReal0319
     * @tc.number SUB_RESMGR_UTILS_REAL_0319
     * @tc.desc   复数分支取值与合法性判定互相印证
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsReal0319', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsReal0319 begin');
      const zero: string = ResourceUtils.pluralBranchOf(0);
      const one: string = ResourceUtils.pluralBranchOf(1);
      const other: string = ResourceUtils.pluralBranchOf(2);
      const invalid: string = ResourceUtils.pluralBranchOf(1.5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s/%{public}s/%{public}s/%{public}s', zero, one, other, invalid);
      expect(zero).assertEqual('zero');
      expect(one).assertEqual('one');
      expect(other).assertEqual('other');
      expect(invalid).assertEqual('invalid');
      expect(ResourceUtils.isValidPluralNum(0)).assertTrue();
      expect(ResourceUtils.isValidPluralNum(1.5)).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsReal0319 end');
    })

    /**
     * @tc.name   testResourceUtilsReal0320
     * @tc.number SUB_RESMGR_UTILS_REAL_0320
     * @tc.desc   资源键拼接与同一性判定结果一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsReal0320', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsReal0320 begin');
      const left: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager', moduleName: 'entry',
        id: 12 });
      const right: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager', moduleName: 'entry',
        id: 12 });
      const other: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager', moduleName: 'entry',
        id: 13 });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s/%{public}s expected same=%{public}s', left, other,
        String(left === right));
      expect(left).assertEqual(right);
      expect(left === right).assertTrue();
      expect(left === other).assertFalse();
      expect(left.endsWith(':12')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsReal0320 end');
    })
  })
}
