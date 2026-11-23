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

import { describe, it, expect, beforeAll, TestType, Size, Level } from '@ohos/hypium';
import { resourceManager } from '@kit.LocalizationKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { ResourceUtils } from '../../../../main/ets/utils/ResourceUtils';
import { TestContextHolder } from './TestContextHolder';

const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[Sample_ResourceManager]';
const APP_MODULE: string = 'entry';
const KEY_ICON: string = 'icon';
const KEY_DENSITY_MEDIA: string = 'density';
const KEY_TITLE: string = 'title';
const KEY_TEST_STRING: string = 'test_string';
const KEY_WORLD: string = 'world';
const KEY_ARRAY: string = 'str_array';
const KEY_PLURAL: string = 'eat_apple';
/** Bundle name of the sample, taken from BasicResources. */
const APP_BUNDLE: string = 'ohos.samples.resourcemanager';
const DATA_URI_MARKER: string = ',';
/** Highest quantity probed for the plural resource. */
const MAX_QUANTITY: number = 6;
/** Ratio between encoded characters and raw bytes stays below four. */
const BASE64_RATIO_LIMIT: number = 4;
/** Bytes in one kilobyte, mirrors the private constant of ResourceUtils. */
const KILO: number = 1024;

function appManager(): resourceManager.ResourceManager {
  return TestContextHolder.resourceManagerOf(APP_MODULE);
}

function payloadOf(encoded: string): string {
  const marker: number = encoded.indexOf(DATA_URI_MARKER);
  return marker < 0 ? '' : encoded.substring(marker + 1);
}

/**
 * Screen density reported by the device, defaulted when the field is absent or
 * not positive. The configuration of the test device reports zero.
 */
async function deviceDensity(): Promise<number> {
  const config: resourceManager.Configuration = await appManager().getConfiguration();
  if (config.screenDensity !== undefined && config.screenDensity > 0) {
    return config.screenDensity;
  }
  return ResourceUtils.DEFAULT_DENSITY;
}

/** Text formatByteSize would produce for the given byte count. */
function expectedSizeText(bytes: number): string {
  if (bytes < KILO) {
    return `${bytes} B`;
  }
  let divisor: number = KILO;
  let unit: string = 'KB';
  if (bytes >= KILO * KILO) {
    divisor = KILO * KILO;
    unit = 'MB';
  }
  const tenths: number = Math.floor(bytes * 10 / divisor);
  return `${Math.floor(tenths / 10)}.${tenths % 10} ${unit}`;
}

/**
 * Feeds the values read from the module under test into the pure helpers of
 * ResourceUtils, so the rules are checked against device data rather than
 * against hand written constants only.
 */
export default function resourceUtilsReal04Test() {
  describe('ResourceUtilsReal04Test', () => {
    beforeAll(async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ResourceUtilsReal04Test begin');
    });

    /**
     * @tc.name   testUtilsReal4001
     * @tc.number SUB_RESMGR_UTILS_REAL4_0001
     * @tc.desc   设备上报的屏幕密度归一化后必为预置档位之一
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testUtilsReal4001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilsReal4001 begin');
      const density: number = await deviceDensity();
      const bucket: number = ResourceUtils.normalizeDensity(density);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'device density=%{public}d bucket=%{public}d', density, bucket);
      expect(ResourceUtils.isDensitySupported(bucket)).assertTrue();
      expect(bucket >= ResourceUtils.DENSITY_BUCKETS[0]).assertTrue();
      expect(bucket <= ResourceUtils.DENSITY_BUCKETS[ResourceUtils.DENSITY_BUCKETS.length - 1]).assertTrue();
    });

    /**
     * @tc.name   testUtilsReal4002
     * @tc.number SUB_RESMGR_UTILS_REAL4_0002
     * @tc.desc   设备密度换算出的比例等于归一化档位除以基准密度
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testUtilsReal4002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilsReal4002 begin');
      const density: number = await deviceDensity();
      const scale: number = ResourceUtils.densityToScale(density);
      const expected: number = ResourceUtils.normalizeDensity(density) / ResourceUtils.BASE_DENSITY;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'device scale=%{public}s expected=%{public}s',
        String(scale), String(expected));
      expect(scale).assertEqual(expected);
      expect(scale > 0).assertTrue();
      expect(Number.isFinite(scale)).assertTrue();
    });

    /**
     * @tc.name   testUtilsReal4003
     * @tc.number SUB_RESMGR_UTILS_REAL4_0003
     * @tc.desc   设备密度归一化两次与归一化一次的结果相同
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testUtilsReal4003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilsReal4003 begin');
      const density: number = await deviceDensity();
      const once: number = ResourceUtils.normalizeDensity(density);
      const twice: number = ResourceUtils.normalizeDensity(once);
      expect(twice).assertEqual(once);
      expect(ResourceUtils.isDensitySupported(twice)).assertTrue();
      expect(Number.isInteger(twice)).assertTrue();
    });

    /**
     * @tc.name   testUtilsReal4004
     * @tc.number SUB_RESMGR_UTILS_REAL4_0004
     * @tc.desc   设备配置的屏幕密度字段可读，取值为非正时回退默认档位，回退后密度为正
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testUtilsReal4004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilsReal4004 begin');
      const config: resourceManager.Configuration = await appManager().getConfiguration();
      const raw: number = config.screenDensity !== undefined ? config.screenDensity : -1;
      const density: number = await deviceDensity();
      const bucket: number = ResourceUtils.normalizeDensity(density);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'reported density=%{public}d effective=%{public}d bucket=%{public}d',
        raw, density, bucket);
      expect(config.screenDensity !== undefined).assertTrue();
      expect(density > 0).assertTrue();
      expect(raw > 0 || density === ResourceUtils.DEFAULT_DENSITY).assertTrue();
      expect(ResourceUtils.isDensitySupported(bucket)).assertTrue();
    });

    /**
     * @tc.name   testUtilsReal4005
     * @tc.number SUB_RESMGR_UTILS_REAL4_0005
     * @tc.desc   真实 icon 字节数经格式化后得到带单位的非零文本
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testUtilsReal4005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilsReal4005 begin');
      const bytes: Uint8Array = await appManager().getMediaByName(KEY_ICON, 0);
      const text: string = ResourceUtils.formatByteSize(bytes.length);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'icon %{public}d bytes -> [%{public}s]', bytes.length, text);
      expect(text.length > 0).assertTrue();
      expect(text === '0 B').assertFalse();
      expect(text.indexOf(' ') > 0).assertTrue();
    });

    /**
     * @tc.name   testUtilsReal4006
     * @tc.number SUB_RESMGR_UTILS_REAL4_0006
     * @tc.desc   icon 与 density 两张图的格式化结果都不为零值且都带单位
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testUtilsReal4006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilsReal4006 begin');
      const icon: Uint8Array = await appManager().getMediaByName(KEY_ICON, 0);
      const density: Uint8Array = await appManager().getMediaByName(KEY_DENSITY_MEDIA, 0);
      const iconText: string = ResourceUtils.formatByteSize(icon.length);
      const densityText: string = ResourceUtils.formatByteSize(density.length);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'icon=[%{public}s] density=[%{public}s]', iconText, densityText);
      expect(iconText === '0 B').assertFalse();
      expect(densityText === '0 B').assertFalse();
      expect(iconText.indexOf(' ') > 0 && densityText.indexOf(' ') > 0).assertTrue();
    });

    /**
     * @tc.name   testUtilsReal4007
     * @tc.number SUB_RESMGR_UTILS_REAL4_0007
     * @tc.desc   icon 的格式化文本以字节、KB 或 MB 三种单位之一结尾
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testUtilsReal4007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilsReal4007 begin');
      const bytes: Uint8Array = await appManager().getMediaByName(KEY_ICON, 0);
      const text: string = ResourceUtils.formatByteSize(bytes.length);
      const hasUnit: boolean =
        text.endsWith(' B') || text.endsWith(' KB') || text.endsWith(' MB');
      expect(hasUnit).assertTrue();
      expect(text.length > 1).assertTrue();
      expect(bytes.length > 0).assertTrue();
    });

    /**
     * @tc.name   testUtilsReal4008
     * @tc.number SUB_RESMGR_UTILS_REAL4_0008
     * @tc.desc   icon 的原始字节数与编码长度经格式化后都不是零值
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testUtilsReal4008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilsReal4008 begin');
      const bytes: Uint8Array = await appManager().getMediaByName(KEY_ICON, 0);
      const payload: string = payloadOf(await appManager().getMediaBase64ByName(KEY_ICON, 0));
      const byteText: string = ResourceUtils.formatByteSize(bytes.length);
      const payloadText: string = ResourceUtils.formatByteSize(payload.length);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'bytes=[%{public}s] payload=[%{public}s]', byteText, payloadText);
      expect(byteText === '0 B').assertFalse();
      expect(payloadText === '0 B').assertFalse();
      expect(payload.length > bytes.length).assertTrue();
    });

    /**
     * @tc.name   testUtilsReal4009
     * @tc.number SUB_RESMGR_UTILS_REAL4_0009
     * @tc.desc   六个预置档位换算出的比例全部为正且不超过最高档的比例
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testUtilsReal4009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilsReal4009 begin');
      let positive: number = 0;
      let withinLimit: number = 0;
      const limit: number =
        ResourceUtils.DENSITY_BUCKETS[ResourceUtils.DENSITY_BUCKETS.length - 1] / ResourceUtils.BASE_DENSITY;
      for (let index: number = 0; index < ResourceUtils.DENSITY_BUCKETS.length; index++) {
        const scale: number = ResourceUtils.densityToScale(ResourceUtils.DENSITY_BUCKETS[index]);
        if (scale > 0) {
          positive++;
        }
        if (scale <= limit) {
          withinLimit++;
        }
      }
      expect(positive).assertEqual(ResourceUtils.DENSITY_BUCKETS.length);
      expect(withinLimit).assertEqual(ResourceUtils.DENSITY_BUCKETS.length);
      expect(limit).assertEqual(4);
    });

    /**
     * @tc.name   testUtilsReal4010
     * @tc.number SUB_RESMGR_UTILS_REAL4_0010
     * @tc.desc   density 资源的编码载荷解回后与原始字节数相等
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testUtilsReal4010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilsReal4010 begin');
      const bytes: Uint8Array = await appManager().getMediaByName(KEY_DENSITY_MEDIA, 0);
      const payload: string =
        payloadOf(await appManager().getMediaBase64ByName(KEY_DENSITY_MEDIA, 0));
      const decoded: number = ResourceUtils.decodedByteLength(payload);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'density bytes=%{public}d decoded=%{public}d', bytes.length, decoded);
      expect(decoded).assertEqual(bytes.length);
      expect(decoded > 0).assertTrue();
      expect(decoded !== -1).assertTrue();
    });

    /**
     * @tc.name   testUtilsReal4011
     * @tc.number SUB_RESMGR_UTILS_REAL4_0011
     * @tc.desc   density 资源的编码长度等于按字节数推算的预期长度
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testUtilsReal4011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilsReal4011 begin');
      const bytes: Uint8Array = await appManager().getMediaByName(KEY_DENSITY_MEDIA, 0);
      const payload: string =
        payloadOf(await appManager().getMediaBase64ByName(KEY_DENSITY_MEDIA, 0));
      expect(payload.length).assertEqual(ResourceUtils.expectedBase64Length(bytes.length));
      expect(payload.length > 0).assertTrue();
      expect(bytes.length > 0).assertTrue();
    });

    /**
     * @tc.name   testUtilsReal4012
     * @tc.number SUB_RESMGR_UTILS_REAL4_0012
     * @tc.desc   density 资源载荷长度按四个字符一组对齐
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testUtilsReal4012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilsReal4012 begin');
      const payload: string =
        payloadOf(await appManager().getMediaBase64ByName(KEY_DENSITY_MEDIA, 0));
      expect(payload.length % ResourceUtils.BASE64_GROUP_CHARS).assertEqual(0);
      expect(payload.length > 0).assertTrue();
      expect(payload.endsWith('=') || payload.length % 4 === 0).assertTrue();
    });

    /**
     * @tc.name   testUtilsReal4013
     * @tc.number SUB_RESMGR_UTILS_REAL4_0013
     * @tc.desc   两张图的编码载荷都按四字符对齐且都长于原始字节
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testUtilsReal4013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilsReal4013 begin');
      const icon: Uint8Array = await appManager().getMediaByName(KEY_ICON, 0);
      const density: Uint8Array = await appManager().getMediaByName(KEY_DENSITY_MEDIA, 0);
      const iconPayload: string = payloadOf(await appManager().getMediaBase64ByName(KEY_ICON, 0));
      const densityPayload: string =
        payloadOf(await appManager().getMediaBase64ByName(KEY_DENSITY_MEDIA, 0));
      expect(iconPayload.length % 4).assertEqual(0);
      expect(densityPayload.length % 4).assertEqual(0);
      expect(iconPayload.length > icon.length && densityPayload.length > density.length).assertTrue();
    });

    /**
     * @tc.name   testUtilsReal4014
     * @tc.number SUB_RESMGR_UTILS_REAL4_0014
     * @tc.desc   两张图的编码字符数与字节数之比大于一且小于四，符合三字节四字符的膨胀上限
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testUtilsReal4014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilsReal4014 begin');
      const icon: Uint8Array = await appManager().getMediaByName(KEY_ICON, 0);
      const density: Uint8Array = await appManager().getMediaByName(KEY_DENSITY_MEDIA, 0);
      const iconRatio: number =
        payloadOf(await appManager().getMediaBase64ByName(KEY_ICON, 0)).length / icon.length;
      const densityRatio: number =
        payloadOf(await appManager().getMediaBase64ByName(KEY_DENSITY_MEDIA, 0)).length / density.length;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'icon ratio=%{public}s density ratio=%{public}s',
        String(iconRatio), String(densityRatio));
      expect(iconRatio > 1).assertTrue();
      expect(iconRatio <= BASE64_RATIO_LIMIT).assertTrue();
      expect(densityRatio > 1 && densityRatio <= BASE64_RATIO_LIMIT).assertTrue();
    });

    /**
     * @tc.name   testUtilsReal4015
     * @tc.number SUB_RESMGR_UTILS_REAL4_0015
     * @tc.desc   两张图的载荷都能解回正字节数，不会得到非法标记
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testUtilsReal4015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilsReal4015 begin');
      const iconDecoded: number =
        ResourceUtils.decodedByteLength(payloadOf(await appManager().getMediaBase64ByName(KEY_ICON, 0)));
      const densityDecoded: number =
        ResourceUtils.decodedByteLength(payloadOf(await appManager().getMediaBase64ByName(KEY_DENSITY_MEDIA, 0)));
      expect(iconDecoded > 0).assertTrue();
      expect(densityDecoded > 0).assertTrue();
      expect(iconDecoded !== -1 && densityDecoded !== -1).assertTrue();
    });

    /**
     * @tc.name   testUtilsReal4016
     * @tc.number SUB_RESMGR_UTILS_REAL4_0016
     * @tc.desc   数量 3 到 6 的复数结果全部以对应数量开头
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testUtilsReal4016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilsReal4016 begin');
      let leading: number = 0;
      for (let quantity: number = 3; quantity <= MAX_QUANTITY; quantity++) {
        const value: string = await appManager().getPluralStringByName(KEY_PLURAL, quantity);
        if (value.indexOf(`${quantity}`) === 0) {
          leading++;
        }
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'leading matches=%{public}d', leading);
      expect(leading).assertEqual(MAX_QUANTITY - 2);
      expect(leading > 0).assertTrue();
      expect(ResourceUtils.pluralBranchOf(3)).assertEqual('other');
    });

    /**
     * @tc.name   testUtilsReal4017
     * @tc.number SUB_RESMGR_UTILS_REAL4_0017
     * @tc.desc   数量 0 属于 zero 分支，结果含零且非空
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testUtilsReal4017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilsReal4017 begin');
      const zero: string = await appManager().getPluralStringByName(KEY_PLURAL, 0);
      expect(ResourceUtils.pluralBranchOf(0)).assertEqual('zero');
      expect(zero.indexOf('0') >= 0).assertTrue();
      expect(zero.length > 0).assertTrue();
    });

    /**
     * @tc.name   testUtilsReal4018
     * @tc.number SUB_RESMGR_UTILS_REAL4_0018
     * @tc.desc   数量 1 属于 one 分支，且结果与 zero 分支结果不同
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testUtilsReal4018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilsReal4018 begin');
      const one: string = await appManager().getPluralStringByName(KEY_PLURAL, 1);
      const zero: string = await appManager().getPluralStringByName(KEY_PLURAL, 0);
      expect(ResourceUtils.pluralBranchOf(1)).assertEqual('one');
      expect(one === zero).assertFalse();
      expect(one.length > 1).assertTrue();
    });

    /**
     * @tc.name   testUtilsReal4019
     * @tc.number SUB_RESMGR_UTILS_REAL4_0019
     * @tc.desc   数量 0 到 5 全部合法，结果长度都大于一且分支值在三个已知分支内
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testUtilsReal4019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilsReal4019 begin');
      let branched: number = 0;
      for (let quantity: number = 0; quantity < MAX_QUANTITY; quantity++) {
        const branch: string = ResourceUtils.pluralBranchOf(quantity);
        const value: string = await appManager().getPluralStringByName(KEY_PLURAL, quantity);
        if ((branch === 'zero' || branch === 'one' || branch === 'other') && value.length > 1) {
          branched++;
        }
      }
      expect(branched).assertEqual(MAX_QUANTITY);
      expect(ResourceUtils.isValidPluralNum(0)).assertTrue();
      expect(ResourceUtils.pluralBranchOf(-1)).assertEqual('invalid');
    });

    /**
     * @tc.name   testUtilsReal4020
     * @tc.number SUB_RESMGR_UTILS_REAL4_0020
     * @tc.desc   title 经清洗后长度与内容都不变化
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testUtilsReal4020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilsReal4020 begin');
      const title: string = await appManager().getStringByName(KEY_TITLE);
      const clean: string = ResourceUtils.sanitizeWorld(title);
      expect(clean).assertEqual(title);
      expect(clean.length).assertEqual(title.length);
      expect(clean.length > 0).assertTrue();
    });

    /**
     * @tc.name   testUtilsReal4021
     * @tc.number SUB_RESMGR_UTILS_REAL4_0021
     * @tc.desc   test_string 经清洗后保持原值，说明真实资源已是规范形态
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testUtilsReal4021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilsReal4021 begin');
      const value: string = await appManager().getStringByName(KEY_TEST_STRING);
      const clean: string = ResourceUtils.sanitizeWorld(value);
      expect(clean).assertEqual(value);
      expect(clean).assertEqual(clean.trim());
      expect(clean.length <= ResourceUtils.WORLD_MAX_LENGTH).assertTrue();
    });

    /**
     * @tc.name   testUtilsReal4022
     * @tc.number SUB_RESMGR_UTILS_REAL4_0022
     * @tc.desc   str_array 的全部元素经清洗后长度保持不变
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testUtilsReal4022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilsReal4022 begin');
      const values: string[] = await appManager().getStringArrayByName(KEY_ARRAY);
      let unchanged: number = 0;
      for (let index: number = 0; index < values.length; index++) {
        if (ResourceUtils.sanitizeWorld(values[index]).length === values[index].length) {
          unchanged++;
        }
      }
      expect(unchanged).assertEqual(values.length);
      expect(unchanged).assertEqual(3);
      expect(values.length > 0).assertTrue();
    });

    /**
     * @tc.name   testUtilsReal4023
     * @tc.number SUB_RESMGR_UTILS_REAL4_0023
     * @tc.desc   world 经清洗后的长度落在 1 到 16 之间且非空
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testUtilsReal4023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilsReal4023 begin');
      const world: string = await appManager().getStringByName(KEY_WORLD);
      const clean: string = ResourceUtils.sanitizeWorld(world);
      expect(clean.length > 0).assertTrue();
      expect(clean.length <= ResourceUtils.WORLD_MAX_LENGTH).assertTrue();
      expect(clean).assertEqual(clean.trim());
    });

    /**
     * @tc.name   testUtilsReal4024
     * @tc.number SUB_RESMGR_UTILS_REAL4_0024
     * @tc.desc   用真实包名与模块名拼出的资源键含两段分隔且保留两个字段
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testUtilsReal4024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilsReal4024 begin');
      const resource: resourceManager.Resource = { bundleName: APP_BUNDLE, moduleName: APP_MODULE, id: 1 };
      const key: string = ResourceUtils.resourceKey(resource);
      let separators: number = 0;
      for (let index: number = 0; index < key.length; index++) {
        if (key.charAt(index) === ':') {
          separators++;
        }
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'key=[%{public}s]', key);
      expect(separators).assertEqual(2);
      expect(key.indexOf(APP_BUNDLE) >= 0).assertTrue();
      expect(key.indexOf(APP_MODULE) >= 0).assertTrue();
    });

    /**
     * @tc.name   testUtilsReal4025
     * @tc.number SUB_RESMGR_UTILS_REAL4_0025
     * @tc.desc   同一真实三元组判为同一资源，id 或模块不同的三元组判为不同
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testUtilsReal4025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilsReal4025 begin');
      const left: resourceManager.Resource = { bundleName: APP_BUNDLE, moduleName: APP_MODULE, id: 7 };
      const right: resourceManager.Resource = { bundleName: APP_BUNDLE, moduleName: APP_MODULE, id: 7 };
      const otherId: resourceManager.Resource = { bundleName: APP_BUNDLE, moduleName: APP_MODULE, id: 8 };
      const otherModule: resourceManager.Resource = { bundleName: APP_BUNDLE, moduleName: 'libraryOverlay', id: 7 };
      expect(ResourceUtils.isSameResource(left, right)).assertTrue();
      expect(ResourceUtils.isSameResource(left, otherId)).assertFalse();
      expect(ResourceUtils.isSameResource(left, otherModule)).assertFalse();
    });

    /**
     * @tc.name   testUtilsReal4026
     * @tc.number SUB_RESMGR_UTILS_REAL4_0026
     * @tc.desc   缺少包名和模块名的三元组键由两个占位符加 id 组成
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testUtilsReal4026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilsReal4026 begin');
      const empty: resourceManager.Resource = { bundleName: '', moduleName: '', id: 7 };
      const key: string = ResourceUtils.resourceKey(empty);
      const expected: string =
        `${ResourceUtils.MISSING_FIELD}:${ResourceUtils.MISSING_FIELD}:7`;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'empty key=[%{public}s]', key);
      expect(key).assertEqual(expected);
      expect(key.endsWith(':7')).assertTrue();
      expect(key.length).assertEqual(ResourceUtils.MISSING_FIELD.length * 2 + 3);
    });

    /**
     * @tc.name   testUtilsReal4027
     * @tc.number SUB_RESMGR_UTILS_REAL4_0027
     * @tc.desc   icon 的格式化整数部分大于零，且字节数确实达到千字节级
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testUtilsReal4027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilsReal4027 begin');
      const bytes: Uint8Array = await appManager().getMediaByName(KEY_ICON, 0);
      const text: string = ResourceUtils.formatByteSize(bytes.length);
      const parts: string[] = text.split(' ');
      const whole: number = Number.parseInt(parts[0], 10);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'icon text=[%{public}s] whole=%{public}d', text, whole);
      expect(whole > 0).assertTrue();
      expect(parts.length).assertEqual(2);
      expect(bytes.length >= 1024).assertTrue();
    });

    /**
     * @tc.name   testUtilsReal4028
     * @tc.number SUB_RESMGR_UTILS_REAL4_0028
     * @tc.desc   icon 字节数对应的格式化文本与按十分之一千字节推算的文本逐字一致
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testUtilsReal4028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilsReal4028 begin');
      const bytes: Uint8Array = await appManager().getMediaByName(KEY_ICON, 0);
      const text: string = ResourceUtils.formatByteSize(bytes.length);
      const expected: string = expectedSizeText(bytes.length);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=[%{public}s] expected=[%{public}s]', text, expected);
      expect(text).assertEqual(expected);
      expect(text.indexOf('.')).assertEqual(1);
      expect(text.endsWith(' KB')).assertTrue();
    });

    /**
     * @tc.name   testUtilsReal4029
     * @tc.number SUB_RESMGR_UTILS_REAL4_0029
     * @tc.desc   density 载荷的填充字符数等于字节数对三取模的补数
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testUtilsReal4029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilsReal4029 begin');
      const bytes: Uint8Array = await appManager().getMediaByName(KEY_DENSITY_MEDIA, 0);
      const payload: string =
        payloadOf(await appManager().getMediaBase64ByName(KEY_DENSITY_MEDIA, 0));
      let padding: number = 0;
      while (padding < payload.length && payload.charAt(payload.length - 1 - padding) === '=') {
        padding++;
      }
      const expected: number = (3 - bytes.length % 3) % 3;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'padding=%{public}d expected=%{public}d', padding, expected);
      expect(padding).assertEqual(expected);
      expect(padding >= 0 && padding < 3).assertTrue();
      expect(ResourceUtils.decodedByteLength(payload)).assertEqual(bytes.length);
    });

    /**
     * @tc.name   testUtilsReal4030
     * @tc.number SUB_RESMGR_UTILS_REAL4_0030
     * @tc.desc   设备密度、档位与比例构成闭环，且两张图的载荷都满足四字符对齐
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testUtilsReal4030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testUtilsReal4030 begin');
      const density: number = await deviceDensity();
      const bucket: number = ResourceUtils.normalizeDensity(density);
      const iconPayload: string = payloadOf(await appManager().getMediaBase64ByName(KEY_ICON, 0));
      const densityPayload: string =
        payloadOf(await appManager().getMediaBase64ByName(KEY_DENSITY_MEDIA, 0));
      expect(ResourceUtils.densityToScale(density)).assertEqual(bucket / ResourceUtils.BASE_DENSITY);
      expect(ResourceUtils.isDensitySupported(bucket)).assertTrue();
      expect(iconPayload.length % 4 === 0 && densityPayload.length % 4 === 0).assertTrue();
    });
  });
}
