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
import { BusinessError } from '@kit.BasicServicesKit';
import { resourceManager } from '@kit.LocalizationKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { TestContextHolder } from '../utils/TestContextHolder';
import { ResourceUtils } from '../../../../main/ets/utils/ResourceUtils';
import { ResourceAccessService } from '../../../../main/ets/service/ResourceAccessService';

const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[Sample_ResourceManager]';
/** Module that owns the resources exercised here. */
const APP_MODULE: string = 'entry';
const KEY_ICON: string = 'icon';
const KEY_DENSITY_MEDIA: string = 'density';
const KEY_WORLD: string = 'world';
const KEY_FORMAT: string = 'formatStr';
const KEY_ARRAY: string = 'str_array';
const KEY_PLURAL: string = 'eat_apple';
const KEY_MISSING: string = '__missing__';
/** Separator that ends the data URI header of an encoded media payload. */
const DATA_URI_MARKER: string = ',';
/** Densities chosen from the bucket table of ResourceUtils. */
const DENSITY_LOW: number = 120;
const DENSITY_MID: number = 480;
const DENSITY_HIGH: number = 640;
const NO_DENSITY: number = 0;
const BASE64_CHARS: string =
  'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=';
const EMPTY_JSON: string = '{}';

function appManager(): resourceManager.ResourceManager {
  return TestContextHolder.resourceManagerOf(APP_MODULE);
}

/** Part of an encoded media string that carries the base64 payload. */
function payloadOf(encoded: string): string {
  const marker: number = encoded.indexOf(DATA_URI_MARKER);
  if (marker < 0) {
    return '';
  }
  return encoded.substring(marker + 1);
}

/** True when every character belongs to the base64 alphabet. */
function isBase64Payload(value: string): boolean {
  if (value.length === 0) {
    return false;
  }
  for (let index: number = 0; index < value.length; index++) {
    if (BASE64_CHARS.indexOf(value.charAt(index)) === -1) {
      return false;
    }
  }
  return true;
}

/** Number of trailing '=' characters of a base64 payload. */
function paddingOf(payload: string): number {
  let padding: number = 0;
  let index: number = payload.length - 1;
  while (index >= 0 && payload.charAt(index) === '=') {
    padding++;
    index--;
  }
  return padding;
}

/** BusinessError code of a failing media read, 0 when the read succeeded. */
async function mediaFailureCode(name: string): Promise<number> {
  try {
    await appManager().getMediaByName(name, NO_DENSITY);
    return 0;
  } catch (error) {
    return (error as BusinessError).code;
  }
}

/** BusinessError code of a failing base64 media read, 0 when it succeeded. */
async function mediaBase64FailureCode(name: string): Promise<number> {
  try {
    await appManager().getMediaBase64ByName(name, NO_DENSITY);
    return 0;
  } catch (error) {
    return (error as BusinessError).code;
  }
}

/**
 * Reads media, configuration and device capability of the module under test
 * through a stage-mode module context and checks the raw payload rather than
 * the fail-soft sentinels of the service wrapper.
 */
export default function appResAccessReal02Test() {
  describe('AppResAccessReal02Test', () => {
    beforeAll(async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'AppResAccessReal02Test begin');
    });

    /**
     * @tc.name   testAppRes2001
     * @tc.number SUB_RESMGR_APP_RES2_0001
     * @tc.desc   icon 媒体按资源名读取到非空字节数组，长度字段自洽
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testAppRes2001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAppRes2001 begin');
      const bytes: Uint8Array = await appManager().getMediaByName(KEY_ICON, NO_DENSITY);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'icon bytes=%{public}d byteLength=%{public}d',
        bytes.length, bytes.byteLength);
      expect(bytes.length > 0).assertTrue();
      expect(bytes.length).assertEqual(bytes.byteLength);
      expect(bytes[0] >= 0 && bytes[0] <= 255).assertTrue();
    });

    /**
     * @tc.name   testAppRes2002
     * @tc.number SUB_RESMGR_APP_RES2_0002
     * @tc.desc   icon 的 base64 取值是 data URI，头部之后仍带非空载荷
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testAppRes2002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAppRes2002 begin');
      const encoded: string = await appManager().getMediaBase64ByName(KEY_ICON, NO_DENSITY);
      const payload: string = payloadOf(encoded);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'icon base64 length=%{public}d payload=%{public}d header=[%{public}s]',
        encoded.length, payload.length, encoded.substring(0, encoded.indexOf(DATA_URI_MARKER)));
      expect(encoded.indexOf('data:') === 0).assertTrue();
      expect(encoded.indexOf(DATA_URI_MARKER) > 0).assertTrue();
      expect(payload.length > 0).assertTrue();
    });

    /**
     * @tc.name   testAppRes2003
     * @tc.number SUB_RESMGR_APP_RES2_0003
     * @tc.desc   载荷长度等于按 4 字符 3 字节规则推算的编码长度
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testAppRes2003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAppRes2003 begin');
      const bytes: Uint8Array = await appManager().getMediaByName(KEY_ICON, NO_DENSITY);
      const payload: string =
        payloadOf(await appManager().getMediaBase64ByName(KEY_ICON, NO_DENSITY));
      const expected: number = ResourceUtils.expectedBase64Length(bytes.length);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'expected payload=%{public}d actual=%{public}d',
        expected, payload.length);
      expect(payload.length).assertEqual(expected);
      expect(payload.length % ResourceUtils.BASE64_GROUP_CHARS).assertEqual(0);
      expect(payload.length >= bytes.length).assertTrue();
    });

    /**
     * @tc.name   testAppRes2004
     * @tc.number SUB_RESMGR_APP_RES2_0004
     * @tc.desc   载荷按 base64 规则解回后的字节数与原始字节数相等
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testAppRes2004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAppRes2004 begin');
      const bytes: Uint8Array = await appManager().getMediaByName(KEY_ICON, NO_DENSITY);
      const payload: string =
        payloadOf(await appManager().getMediaBase64ByName(KEY_ICON, NO_DENSITY));
      const decoded: number = ResourceUtils.decodedByteLength(payload);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'decoded=%{public}d raw=%{public}d', decoded, bytes.length);
      expect(decoded !== -1).assertTrue();
      expect(decoded).assertEqual(bytes.length);
      expect(decoded > 0).assertTrue();
    });

    /**
     * @tc.name   testAppRes2005
     * @tc.number SUB_RESMGR_APP_RES2_0005
     * @tc.desc   载荷只由 base64 字符组成且不含空白
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testAppRes2005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAppRes2005 begin');
      const payload: string =
        payloadOf(await appManager().getMediaBase64ByName(KEY_ICON, NO_DENSITY));
      expect(isBase64Payload(payload)).assertTrue();
      expect(payload.indexOf(' ') === -1).assertTrue();
      expect(payload.length > 0).assertTrue();
    });

    /**
     * @tc.name   testAppRes2006
     * @tc.number SUB_RESMGR_APP_RES2_0006
     * @tc.desc   填充字符数量与原始字节数对 3 取模的结果一致
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testAppRes2006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAppRes2006 begin');
      const bytes: Uint8Array = await appManager().getMediaByName(KEY_ICON, NO_DENSITY);
      const payload: string =
        payloadOf(await appManager().getMediaBase64ByName(KEY_ICON, NO_DENSITY));
      const expectedPadding: number =
        (ResourceUtils.BASE64_GROUP_BYTES - bytes.length % ResourceUtils.BASE64_GROUP_BYTES) %
          ResourceUtils.BASE64_GROUP_BYTES;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'padding expected=%{public}d actual=%{public}d',
        expectedPadding, paddingOf(payload));
      expect(paddingOf(payload)).assertEqual(expectedPadding);
      expect(payload.endsWith('=') === (expectedPadding > 0)).assertTrue();
      expect(expectedPadding >= 0 && expectedPadding < ResourceUtils.BASE64_GROUP_BYTES).assertTrue();
    });

    /**
     * @tc.name   testAppRes2007
     * @tc.number SUB_RESMGR_APP_RES2_0007
     * @tc.desc   icon 连续两次读取字节数相同，首末字节一致
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testAppRes2007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAppRes2007 begin');
      const first: Uint8Array = await appManager().getMediaByName(KEY_ICON, NO_DENSITY);
      const second: Uint8Array = await appManager().getMediaByName(KEY_ICON, NO_DENSITY);
      expect(second.length).assertEqual(first.length);
      expect(second[0]).assertEqual(first[0]);
      expect(second[second.length - 1]).assertEqual(first[first.length - 1]);
    });

    /**
     * @tc.name   testAppRes2008
     * @tc.number SUB_RESMGR_APP_RES2_0008
     * @tc.desc   icon 连续两次读取的 base64 字符串完全相同
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testAppRes2008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAppRes2008 begin');
      const first: string = await appManager().getMediaBase64ByName(KEY_ICON, NO_DENSITY);
      const second: string = await appManager().getMediaBase64ByName(KEY_ICON, NO_DENSITY);
      expect(second).assertEqual(first);
      expect(second.length).assertEqual(first.length);
      expect(first.length > 0).assertTrue();
    });

    /**
     * @tc.name   testAppRes2009
     * @tc.number SUB_RESMGR_APP_RES2_0009
     * @tc.desc   按最高密度桶读取 icon 成功，载荷解回字节数与字节数一致
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testAppRes2009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAppRes2009 begin');
      expect(ResourceUtils.isDensitySupported(DENSITY_HIGH)).assertTrue();
      const bytes: Uint8Array = await appManager().getMediaByName(KEY_ICON, DENSITY_HIGH);
      const payload: string =
        payloadOf(await appManager().getMediaBase64ByName(KEY_ICON, DENSITY_HIGH));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'icon@640 bytes=%{public}d payload=%{public}d',
        bytes.length, payload.length);
      expect(bytes.length > 0).assertTrue();
      expect(ResourceUtils.decodedByteLength(payload)).assertEqual(bytes.length);
      expect(payload.length > 0).assertTrue();
    });

    /**
     * @tc.name   testAppRes2010
     * @tc.number SUB_RESMGR_APP_RES2_0010
     * @tc.desc   最低与最高两个密度桶都能读到同一张 icon，字节数一致
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testAppRes2010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAppRes2010 begin');
      const low: Uint8Array = await appManager().getMediaByName(KEY_ICON, DENSITY_LOW);
      const high: Uint8Array = await appManager().getMediaByName(KEY_ICON, DENSITY_HIGH);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'icon@120=%{public}d icon@640=%{public}d',
        low.length, high.length);
      expect(low.length > 0).assertTrue();
      expect(high.length > 0).assertTrue();
      expect(low.length).assertEqual(high.length);
    });

    /**
     * @tc.name   testAppRes2011
     * @tc.number SUB_RESMGR_APP_RES2_0011
     * @tc.desc   非法密度 0 按默认桶回退，与直接按默认桶读取的字节数一致
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testAppRes2011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAppRes2011 begin');
      expect(ResourceUtils.normalizeDensity(NO_DENSITY)).assertEqual(ResourceUtils.DEFAULT_DENSITY);
      const fallback: Uint8Array = await appManager().getMediaByName(KEY_ICON, NO_DENSITY);
      const explicit: Uint8Array = await appManager().getMediaByName(KEY_ICON, ResourceUtils.DEFAULT_DENSITY);
      expect(fallback.length > 0).assertTrue();
      expect(fallback.length).assertEqual(explicit.length);
    });

    /**
     * @tc.name   testAppRes2012
     * @tc.number SUB_RESMGR_APP_RES2_0012
     * @tc.desc   density 资源在最高密度桶读取成功，载荷解回字节数一致
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testAppRes2012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAppRes2012 begin');
      const bytes: Uint8Array = await appManager().getMediaByName(KEY_DENSITY_MEDIA, DENSITY_HIGH);
      const payload: string =
        payloadOf(await appManager().getMediaBase64ByName(KEY_DENSITY_MEDIA, DENSITY_HIGH));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'density@640 bytes=%{public}d payload=%{public}d',
        bytes.length, payload.length);
      expect(bytes.length > 0).assertTrue();
      expect(payload.length > 0).assertTrue();
      expect(ResourceUtils.decodedByteLength(payload)).assertEqual(bytes.length);
    });

    /**
     * @tc.name   testAppRes2013
     * @tc.number SUB_RESMGR_APP_RES2_0013
     * @tc.desc   icon 字节数经格式化后得到带单位的可读文本而不是零值
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testAppRes2013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAppRes2013 begin');
      const bytes: Uint8Array = await appManager().getMediaByName(KEY_ICON, NO_DENSITY);
      const text: string = ResourceUtils.formatByteSize(bytes.length);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'formatByteSize(%{public}d)=[%{public}s]', bytes.length, text);
      expect(text.length > 0).assertTrue();
      expect(text === '0 B').assertFalse();
      expect(text.indexOf(' ') > 0).assertTrue();
    });

    /**
     * @tc.name   testAppRes2014
     * @tc.number SUB_RESMGR_APP_RES2_0014
     * @tc.desc   服务封装的配置 JSON 与直接读取的配置 JSON 完全一致且非空对象
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testAppRes2014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAppRes2014 begin');
      const manager: resourceManager.ResourceManager = appManager();
      const service: ResourceAccessService = new ResourceAccessService(manager);
      const viaService: string = await service.getConfigurationJson();
      const direct: string = JSON.stringify(await manager.getConfiguration());
      hilog.info(LOG_DOMAIN, LOG_TAG, 'configuration length=%{public}d', viaService.length);
      expect(viaService).assertEqual(direct);
      expect(viaService === EMPTY_JSON).assertFalse();
      expect(viaService.length > 2).assertTrue();
    });

    /**
     * @tc.name   testAppRes2015
     * @tc.number SUB_RESMGR_APP_RES2_0015
     * @tc.desc   服务封装的设备能力 JSON 与直接读取的结果一致且非空对象
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testAppRes2015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAppRes2015 begin');
      const manager: resourceManager.ResourceManager = appManager();
      const service: ResourceAccessService = new ResourceAccessService(manager);
      const viaService: string = await service.getCapabilityJson();
      const direct: string = JSON.stringify(await manager.getDeviceCapability());
      hilog.info(LOG_DOMAIN, LOG_TAG, 'capability length=%{public}d', viaService.length);
      expect(viaService).assertEqual(direct);
      expect(viaService === EMPTY_JSON).assertFalse();
      expect(viaService.length > 2).assertTrue();
    });

    /**
     * @tc.name   testAppRes2016
     * @tc.number SUB_RESMGR_APP_RES2_0016
     * @tc.desc   density 资源在中间密度桶也可读，且编码载荷同样可解回原始字节数
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testAppRes2016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAppRes2016 begin');
      expect(ResourceUtils.isDensitySupported(DENSITY_MID)).assertTrue();
      const bytes: Uint8Array = await appManager().getMediaByName(KEY_DENSITY_MEDIA, DENSITY_MID);
      const payload: string =
        payloadOf(await appManager().getMediaBase64ByName(KEY_DENSITY_MEDIA, DENSITY_MID));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'density@480 bytes=%{public}d payload=%{public}d',
        bytes.length, payload.length);
      expect(bytes.length > 0).assertTrue();
      expect(payload.length > 0).assertTrue();
      expect(ResourceUtils.decodedByteLength(payload)).assertEqual(bytes.length);
    });

    /**
     * @tc.name   testAppRes2017
     * @tc.number SUB_RESMGR_APP_RES2_0017
     * @tc.desc   读取不存在的媒体资源失败并返回正的整数错误码
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testAppRes2017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAppRes2017 begin');
      const code: number = await mediaFailureCode(KEY_MISSING);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'missing media code=%{public}d', code);
      expect(code !== 0).assertTrue();
      expect(code > 0).assertTrue();
      expect(Number.isInteger(code)).assertTrue();
    });

    /**
     * @tc.name   testAppRes2018
     * @tc.number SUB_RESMGR_APP_RES2_0018
     * @tc.desc   读取不存在的媒体 base64 资源失败并返回正的整数错误码
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testAppRes2018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAppRes2018 begin');
      const code: number = await mediaBase64FailureCode(KEY_MISSING);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'missing media base64 code=%{public}d', code);
      expect(code !== 0).assertTrue();
      expect(code > 0).assertTrue();
      expect(Number.isInteger(code)).assertTrue();
    });

    /**
     * @tc.name   testAppRes2019
     * @tc.number SUB_RESMGR_APP_RES2_0019
     * @tc.desc   一次读取失败后 icon 仍可正常读取，失败不影响后续访问
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testAppRes2019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAppRes2019 begin');
      const code: number = await mediaFailureCode(KEY_MISSING);
      const bytes: Uint8Array = await appManager().getMediaByName(KEY_ICON, NO_DENSITY);
      const payload: string =
        payloadOf(await appManager().getMediaBase64ByName(KEY_ICON, NO_DENSITY));
      expect(code > 0).assertTrue();
      expect(bytes.length > 0).assertTrue();
      expect(ResourceUtils.decodedByteLength(payload)).assertEqual(bytes.length);
    });

    /**
     * @tc.name   testAppRes2020
     * @tc.number SUB_RESMGR_APP_RES2_0020
     * @tc.desc   用真实的 world 资源值格式化 formatStr，占位符被替换成该值
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testAppRes2020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAppRes2020 begin');
      const world: string = await appManager().getStringByName(KEY_WORLD);
      const raw: string = await appManager().getStringByName(KEY_FORMAT);
      const formatted: string = appManager().getStringByNameSync(KEY_FORMAT, world);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'world=[%{public}s] formatted=[%{public}s]', world, formatted);
      expect(formatted.indexOf(world) >= 0).assertTrue();
      expect(formatted.indexOf('%s') === -1).assertTrue();
      expect(formatted.length > world.length).assertTrue();
      expect(raw.indexOf('%s') >= 0).assertTrue();
    });

    /**
     * @tc.name   testAppRes2021
     * @tc.number SUB_RESMGR_APP_RES2_0021
     * @tc.desc   str_array 的元素与 world 取值经 sanitizeWorld 处理后保持不变
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testAppRes2021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAppRes2021 begin');
      const values: string[] = await appManager().getStringArrayByName(KEY_ARRAY);
      const world: string = await appManager().getStringByName(KEY_WORLD);
      let stable: number = 0;
      for (let index: number = 0; index < values.length; index++) {
        if (ResourceUtils.sanitizeWorld(values[index]) === values[index]) {
          stable++;
        }
      }
      expect(ResourceUtils.sanitizeWorld(world)).assertEqual(world);
      expect(stable).assertEqual(values.length);
      expect(stable).assertEqual(3);
    });

    /**
     * @tc.name   testAppRes2022
     * @tc.number SUB_RESMGR_APP_RES2_0022
     * @tc.desc   数量 2 属于 other 分支，复数结果以 2 开头且是合法数量
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testAppRes2022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAppRes2022 begin');
      const two: string = await appManager().getPluralStringByName(KEY_PLURAL, 2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'plural(2)=[%{public}s]', two);
      expect(ResourceUtils.isValidPluralNum(2)).assertTrue();
      expect(ResourceUtils.pluralBranchOf(2)).assertEqual('other');
      expect(two.indexOf('2')).assertEqual(0);
    });

    /**
     * @tc.name   testAppRes2023
     * @tc.number SUB_RESMGR_APP_RES2_0023
     * @tc.desc   连续两次读取的设备配置序列化结果完全一致
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testAppRes2023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAppRes2023 begin');
      const manager: resourceManager.ResourceManager = appManager();
      const first: string = JSON.stringify(await manager.getConfiguration());
      const second: string = JSON.stringify(await manager.getConfiguration());
      expect(second).assertEqual(first);
      expect(first === EMPTY_JSON).assertFalse();
      expect(first.length > 2).assertTrue();
    });

    /**
     * @tc.name   testAppRes2024
     * @tc.number SUB_RESMGR_APP_RES2_0024
     * @tc.desc   连续两次读取的设备能力序列化结果完全一致
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testAppRes2024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAppRes2024 begin');
      const manager: resourceManager.ResourceManager = appManager();
      const first: string = JSON.stringify(await manager.getDeviceCapability());
      const second: string = JSON.stringify(await manager.getDeviceCapability());
      expect(second).assertEqual(first);
      expect(first === EMPTY_JSON).assertFalse();
      expect(first.length > 2).assertTrue();
    });

    /**
     * @tc.name   testAppRes2025
     * @tc.number SUB_RESMGR_APP_RES2_0025
     * @tc.desc   world 取值长度在单词上限内且不含首尾空白
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testAppRes2025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAppRes2025 begin');
      const world: string = await appManager().getStringByName(KEY_WORLD);
      expect(world.length > 0).assertTrue();
      expect(world.length <= ResourceUtils.WORLD_MAX_LENGTH).assertTrue();
      expect(world).assertEqual(world.trim());
    });

    /**
     * @tc.name   testAppRes2026
     * @tc.number SUB_RESMGR_APP_RES2_0026
     * @tc.desc   真实载荷满足编码长度与解码字节数两个方向的互推关系
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testAppRes2026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAppRes2026 begin');
      const bytes: Uint8Array = await appManager().getMediaByName(KEY_ICON, NO_DENSITY);
      const payload: string =
        payloadOf(await appManager().getMediaBase64ByName(KEY_ICON, NO_DENSITY));
      const decoded: number = ResourceUtils.decodedByteLength(payload);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'payload=%{public}d decoded=%{public}d', payload.length, decoded);
      expect(ResourceUtils.expectedBase64Length(decoded)).assertEqual(payload.length);
      expect(decoded).assertEqual(bytes.length);
      expect(ResourceUtils.expectedBase64Length(bytes.length)).assertEqual(payload.length);
    });
  });
}
