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
const BUCKETS: number[] = [120, 160, 240, 320, 480, 640];

function countOfDensityBuckets(): number {
  let count: number = 0;
  for (let index: number = 0; index < BUCKETS.length; index++) {
    if (ResourceUtils.isDensitySupported(BUCKETS[index])) {
      count++;
    }
  }
  return count;
}

export default function resourceUtilsReal02Test() {
  describe('ResourceUtilsReal02Test', () => {

    /**
     * @tc.name   testResourceUtilsReal0201
     * @tc.number SUB_RESMGR_UTILS_REAL_0201
     * @tc.desc   六个档位全部被认定为合法，档位之外的取值全部被拒绝
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsReal0201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsReal0201 begin');
      const supported: number = countOfDensityBuckets();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=6', supported);
      expect(supported).assertEqual(6);
      expect(ResourceUtils.DENSITY_BUCKETS.length).assertEqual(6);
      expect(ResourceUtils.isDensitySupported(200)).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsReal0201 end');
    })

    /**
     * @tc.name   testResourceUtilsReal0202
     * @tc.number SUB_RESMGR_UTILS_REAL_0202
     * @tc.desc   档位与比例一一对应，比例乘以基准密度必须回到档位本身
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsReal0202', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsReal0202 begin');
      let matched: number = 0;
      for (let index: number = 0; index < BUCKETS.length; index++) {
        const scale: number = ResourceUtils.densityToScale(BUCKETS[index]);
        if (scale * ResourceUtils.BASE_DENSITY === BUCKETS[index]) {
          matched++;
        }
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=6', matched);
      expect(matched).assertEqual(6);
      expect(ResourceUtils.densityToScale(120)).assertEqual(0.75);
      expect(ResourceUtils.densityToScale(640)).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsReal0202 end');
    })

    /**
     * @tc.name   testResourceUtilsReal0203
     * @tc.number SUB_RESMGR_UTILS_REAL_0203
     * @tc.desc   归一化结果再次归一化保持不变，且单调不减
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsReal0203', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsReal0203 begin');
      const low: number = ResourceUtils.normalizeDensity(100);
      const mid: number = ResourceUtils.normalizeDensity(300);
      const high: number = ResourceUtils.normalizeDensity(700);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d/%{public}d/%{public}d', low, mid, high);
      expect(low <= mid).assertTrue();
      expect(mid <= high).assertTrue();
      expect(ResourceUtils.normalizeDensity(high)).assertEqual(high);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsReal0203 end');
    })

    /**
     * @tc.name   testResourceUtilsReal0204
     * @tc.number SUB_RESMGR_UTILS_REAL_0204
     * @tc.desc   字节格式化与图片长度互算在同一条链路上保持一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsReal0204', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsReal0204 begin');
      const bytes: number = 6790;
      const text: string = ResourceUtils.formatByteSize(bytes);
      const encoded: number = ResourceUtils.expectedBase64Length(bytes);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s/%{public}d', text, encoded);
      expect(text).assertEqual('6.6 KB');
      expect(encoded).assertEqual(9056);
      expect(encoded % 4).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsReal0204 end');
    })

    /**
     * @tc.name   testResourceUtilsReal0205
     * @tc.number SUB_RESMGR_UTILS_REAL_0205
     * @tc.desc   编码长度与反算字节数必须能互相还原
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsReal0205', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsReal0205 begin');
      const bytes: number = 12;
      const encoded: number = ResourceUtils.expectedBase64Length(bytes);
      const body: string = 'A'.repeat(encoded);
      const decoded: number = ResourceUtils.decodedByteLength(body);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d/%{public}d/%{public}d', encoded, decoded, bytes);
      expect(encoded).assertEqual(16);
      expect(decoded).assertEqual(bytes);
      expect(decoded).assertEqual(encoded / 4 * 3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsReal0205 end');
    })

    /**
     * @tc.name   testResourceUtilsReal0206
     * @tc.number SUB_RESMGR_UTILS_REAL_0206
     * @tc.desc   带填充的 base64 串反算会扣掉填充对应的字节
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsReal0206', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsReal0206 begin');
      const onePad: number = ResourceUtils.decodedByteLength('QUJDRA==');
      const twoPad: number = ResourceUtils.decodedByteLength('QUJD');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d/%{public}d', onePad, twoPad);
      expect(onePad).assertEqual(4);
      expect(twoPad).assertEqual(3);
      expect(onePad - twoPad).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsReal0206 end');
    })

    /**
     * @tc.name   testResourceUtilsReal0207
     * @tc.number SUB_RESMGR_UTILS_REAL_0207
     * @tc.desc   占位词清洗结果永远非空且不超过 19 个字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsReal0207', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsReal0207 begin');
      const inputs: string[] = ['', '   ', 'world', 'abcdefghijklmnopqrstuvwxyz', '  Apple  '];
      let withinRange: number = 0;
      for (let index: number = 0; index < inputs.length; index++) {
        const cleaned: string = ResourceUtils.sanitizeWorld(inputs[index]);
        if (cleaned.length >= 1 && cleaned.length <= 19) {
          withinRange++;
        }
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=5', withinRange);
      expect(withinRange).assertEqual(5);
      expect(ResourceUtils.sanitizeWorld('')).assertEqual('world');
      expect(ResourceUtils.sanitizeWorld('  Apple  ')).assertEqual('Apple');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsReal0207 end');
    })

    /**
     * @tc.name   testResourceUtilsReal0208
     * @tc.number SUB_RESMGR_UTILS_REAL_0208
     * @tc.desc   复数分支与合法性判定必须互相印证
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsReal0208', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsReal0208 begin');
      const invalid: string = ResourceUtils.pluralBranchOf(-3);
      const valid: string = ResourceUtils.pluralBranchOf(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s/%{public}s', invalid, valid);
      expect(invalid).assertEqual('invalid');
      expect(ResourceUtils.isValidPluralNum(-3)).assertFalse();
      expect(ResourceUtils.isValidPluralNum(3)).assertTrue();
      expect(valid === 'other').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsReal0208 end');
    })

    /**
     * @tc.name   testResourceUtilsReal0209
     * @tc.number SUB_RESMGR_UTILS_REAL_0209
     * @tc.desc   资源键拼接长度等于三段之和加两个分隔符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsReal0209', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsReal0209 begin');
      const bundle: string = 'ohos.samples.resourcemanager';
      const module: string = 'entry';
      const key: string = ResourceUtils.resourceKey({ bundleName: bundle, moduleName: module, id: 7 });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', key);
      expect(key).assertEqual(bundle + ':' + module + ':7');
      expect(key.length).assertEqual(bundle.length + module.length + 3);
      expect(key.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsReal0209 end');
    })

    /**
     * @tc.name   testResourceUtilsReal0210
     * @tc.number SUB_RESMGR_UTILS_REAL_0210
     * @tc.desc   规格常量取值必须与文档一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsReal0210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsReal0210 begin');
      expect(ResourceUtils.DEFAULT_DENSITY).assertEqual(320);
      expect(ResourceUtils.BASE_DENSITY).assertEqual(160);
      expect(ResourceUtils.WORLD_MAX_LENGTH).assertEqual(16);
      expect(ResourceUtils.DEFAULT_WORLD).assertEqual('world');
      expect(ResourceUtils.MISSING_FIELD).assertEqual('-');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsReal0210 end');
    })

    /**
     * @tc.name   testResourceUtilsReal0211
     * @tc.number SUB_RESMGR_UTILS_REAL_0211
     * @tc.desc   非法字节数在两条链路上都返回零值而不是负数
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsReal0211', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsReal0211 begin');
      const text: string = ResourceUtils.formatByteSize(-4096);
      const length: number = ResourceUtils.expectedBase64Length(-4096);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s/%{public}d', text, length);
      expect(text).assertEqual('0 B');
      expect(length).assertEqual(0);
      expect(text.indexOf('-')).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsReal0211 end');
    })

    /**
     * @tc.name   testResourceUtilsReal0212
     * @tc.number SUB_RESMGR_UTILS_REAL_0212
     * @tc.desc   非法密度与非法字节数走同一条默认值回落路径
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsReal0212', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsReal0212 begin');
      const density: number = ResourceUtils.normalizeDensity(-240);
      const text: string = ResourceUtils.formatByteSize(-240);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d/%{public}s', density, text);
      expect(density).assertEqual(ResourceUtils.DEFAULT_DENSITY);
      expect(text).assertEqual('0 B');
      expect(ResourceUtils.normalizeDensity(0)).assertEqual(ResourceUtils.DEFAULT_DENSITY);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsReal0212 end');
    })
  })
}
