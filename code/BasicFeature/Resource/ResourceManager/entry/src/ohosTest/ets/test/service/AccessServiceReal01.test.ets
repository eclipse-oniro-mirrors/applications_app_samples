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
import { resourceManager } from '@kit.LocalizationKit';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import {
  ResourceAccessService,
  ACCESS_FAILED_STRING,
  ACCESS_FAILED_NUMBER,
  ACCESS_EMPTY_JSON
} from '../../../../main/ets/service/ResourceAccessService';

const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[Sample_ResourceManager]';
// Any id that the bundle cannot resolve exercises the fail-soft branch.
const MISSING_ID: number = 99999999;
const MISSING_RES: resourceManager.Resource = {
  bundleName: 'ohos.samples.resourcemanager',
  moduleName: 'entry',
  id: MISSING_ID
};

function newService(): ResourceAccessService {
  return new ResourceAccessService(abilityDelegatorRegistry.getAbilityDelegator().getAppContext().resourceManager);
}

export default function accessServiceReal01Test() {
  describe('AccessServiceReal01Test', () => {

    /**
     * @tc.name   testAccessService0001
     * @tc.number SUB_RESMGR_ACCESS_REAL_0001
     * @tc.desc   无法解析的字符串 id 必须回落成空串而不是抛异常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAccessService0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAccessService0001 begin');
      const service: ResourceAccessService = newService();
      const text: string = await service.getString(MISSING_ID);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=[%{public}s] expected=[]', text);
      expect(text).assertEqual(ACCESS_FAILED_STRING);
      expect(ResourceAccessService.isUsable(text)).assertFalse();
      expect(text.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAccessService0001 end');
    })

    /**
     * @tc.name   testAccessService0002
     * @tc.number SUB_RESMGR_ACCESS_REAL_0002
     * @tc.desc   非法的负 id 与 0 同样走 fail-soft 分支
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAccessService0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAccessService0002 begin');
      const service: ResourceAccessService = newService();
      const negative: string = await service.getString(-1);
      const zero: string = await service.getString(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=[%{public}s][%{public}s] expected=[]', negative, zero);
      expect(negative).assertEqual(ACCESS_FAILED_STRING);
      expect(zero).assertEqual(ACCESS_FAILED_STRING);
      expect(negative).assertEqual(zero);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAccessService0002 end');
    })

    /**
     * @tc.name   testAccessService0003
     * @tc.number SUB_RESMGR_ACCESS_REAL_0003
     * @tc.desc   字符串数组解析失败必须返回空数组而不是 null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAccessService0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAccessService0003 begin');
      const service: ResourceAccessService = newService();
      const values: string[] = await service.getStringArray(MISSING_RES);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=0', values.length);
      expect(values.length).assertEqual(0);
      expect(Array.isArray(values)).assertTrue();
      expect(JSON.stringify(values)).assertEqual('[]');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAccessService0003 end');
    })

    /**
     * @tc.name   testAccessService0004
     * @tc.number SUB_RESMGR_ACCESS_REAL_0004
     * @tc.desc   模块名缺失的 Resource 三元组也不能解析出数组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAccessService0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAccessService0004 begin');
      const service: ResourceAccessService = newService();
      const noModule: resourceManager.Resource = {
        bundleName: 'ohos.samples.resourcemanager',
        moduleName: '',
        id: MISSING_ID
      };
      const values: string[] = await service.getStringArray(noModule);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=0', values.length);
      expect(values.length).assertEqual(0);
      expect(values.length === 0).assertTrue();
      expect(JSON.stringify(values).length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAccessService0004 end');
    })

    /**
     * @tc.name   testAccessService0005
     * @tc.number SUB_RESMGR_ACCESS_REAL_0005
     * @tc.desc   复数 id 无法解析时返回空串，而不是保留占位符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAccessService0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAccessService0005 begin');
      const service: ResourceAccessService = newService();
      const text: string = await service.getPluralString(MISSING_ID, 0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=[%{public}s] expected=[]', text);
      expect(text).assertEqual(ACCESS_FAILED_STRING);
      expect(text.indexOf('%d')).assertEqual(-1);
      expect(ResourceAccessService.isUsable(text)).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAccessService0005 end');
    })

    /**
     * @tc.name   testAccessService0006
     * @tc.number SUB_RESMGR_ACCESS_REAL_0006
     * @tc.desc   非法数量必须在访问资源前就被拒绝
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAccessService0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAccessService0006 begin');
      const service: ResourceAccessService = newService();
      const negative: string = await service.getPluralString(MISSING_ID, -1);
      const fractional: string = await service.getPluralString(MISSING_ID, 1.5);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=[%{public}s][%{public}s] expected=[]', negative, fractional);
      expect(negative).assertEqual(ACCESS_FAILED_STRING);
      expect(fractional).assertEqual(ACCESS_FAILED_STRING);
      expect(negative.length + fractional.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAccessService0006 end');
    })

    /**
     * @tc.name   testAccessService0007
     * @tc.number SUB_RESMGR_ACCESS_REAL_0007
     * @tc.desc   formatString 解析失败时必须返回空串，不能把占位词带出来
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAccessService0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAccessService0007 begin');
      const service: ResourceAccessService = newService();
      const text: string = service.formatString(MISSING_ID, 'world');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=[%{public}s] expected=[]', text);
      expect(text).assertEqual(ACCESS_FAILED_STRING);
      expect(text.indexOf('world')).assertEqual(-1);
      expect(ResourceAccessService.isUsable(text)).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAccessService0007 end');
    })

    /**
     * @tc.name   testAccessService0008
     * @tc.number SUB_RESMGR_ACCESS_REAL_0008
     * @tc.desc   formatString 的占位词会先被清洗，空白词回落成默认词
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAccessService0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAccessService0008 begin');
      const service: ResourceAccessService = newService();
      const blank: string = service.formatString(MISSING_ID, '    ');
      const longWord: string = service.formatString(MISSING_ID, 'abcdefghijklmnopqrstuvwxyz');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=[%{public}s][%{public}s] expected=[]', blank, longWord);
      expect(blank).assertEqual(ACCESS_FAILED_STRING);
      expect(longWord).assertEqual(ACCESS_FAILED_STRING);
      expect(blank.length).assertEqual(longWord.length);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAccessService0008 end');
    })

    /**
     * @tc.name   testAccessService0009
     * @tc.number SUB_RESMGR_ACCESS_REAL_0009
     * @tc.desc   图片字节数解析失败必须返回 -1 这个哨兵值
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAccessService0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAccessService0009 begin');
      const service: ResourceAccessService = newService();
      const bytes: number = await service.getMediaByteLength(MISSING_ID);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', bytes, ACCESS_FAILED_NUMBER);
      expect(bytes).assertEqual(ACCESS_FAILED_NUMBER);
      expect(bytes < 0).assertTrue();
      expect(bytes).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAccessService0009 end');
    })

    /**
     * @tc.name   testAccessService0010
     * @tc.number SUB_RESMGR_ACCESS_REAL_0010
     * @tc.desc   非法 id 的图片 base64 与长度都必须为空/0，两者保持一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAccessService0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAccessService0010 begin');
      const service: ResourceAccessService = newService();
      const encoded: string = await service.getMediaBase64(MISSING_ID);
      const encodedLength: number = await service.getMediaBase64Length(MISSING_ID);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=[%{public}s]/%{public}d expected=[]/0', encoded, encodedLength);
      expect(encoded).assertEqual(ACCESS_FAILED_STRING);
      expect(encodedLength).assertEqual(0);
      expect(encodedLength).assertEqual(encoded.length);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAccessService0010 end');
    })

    /**
     * @tc.name   testAccessService0011
     * @tc.number SUB_RESMGR_ACCESS_REAL_0011
     * @tc.desc   指定档位读取图片时，非法档位会先被归一化再走失败分支
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAccessService0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAccessService0011 begin');
      const service: ResourceAccessService = newService();
      const fallback: string = await service.getDensityMediaBase64(MISSING_ID, 0);
      const exact: string = await service.getDensityMediaBase64(MISSING_ID, 640);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=[%{public}s][%{public}s] expected=[]', fallback, exact);
      expect(fallback).assertEqual(ACCESS_FAILED_STRING);
      expect(exact).assertEqual(ACCESS_FAILED_STRING);
      expect(fallback.length).assertEqual(exact.length);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAccessService0011 end');
    })

    /**
     * @tc.name   testAccessService0012
     * @tc.number SUB_RESMGR_ACCESS_REAL_0012
     * @tc.desc   系统资源管理器读取失败时也必须回落成空串
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAccessService0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAccessService0012 begin');
      const service: ResourceAccessService = newService();
      const encoded: string = await service.getSystemMediaBase64(MISSING_ID);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual length=%{public}d', encoded.length);
      expect(encoded).assertEqual(ACCESS_FAILED_STRING);
      expect(encoded.length).assertEqual(0);
      expect(ResourceAccessService.isUsable(encoded)).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAccessService0012 end');
    })

    /**
     * @tc.name   testAccessService0013
     * @tc.number SUB_RESMGR_ACCESS_REAL_0013
     * @tc.desc   设备配置必须序列化成合法的 JSON 对象文本
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAccessService0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAccessService0013 begin');
      const service: ResourceAccessService = newService();
      const json: string = await service.getConfigurationJson();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual length=%{public}d', json.length);
      expect(json.startsWith('{')).assertTrue();
      expect(json.endsWith('}')).assertTrue();
      expect(json.length > ACCESS_EMPTY_JSON.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAccessService0013 end');
    })

    /**
     * @tc.name   testAccessService0014
     * @tc.number SUB_RESMGR_ACCESS_REAL_0014
     * @tc.desc   设备能力必须序列化成合法的 JSON 对象文本
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAccessService0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAccessService0014 begin');
      const service: ResourceAccessService = newService();
      const json: string = await service.getCapabilityJson();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual length=%{public}d', json.length);
      expect(json.startsWith('{')).assertTrue();
      expect(json.endsWith('}')).assertTrue();
      expect(json.length > ACCESS_EMPTY_JSON.length).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAccessService0014 end');
    })

    /**
     * @tc.name   testAccessService0015
     * @tc.number SUB_RESMGR_ACCESS_REAL_0015
     * @tc.desc   连续两次读取配置必须得到一致的结果
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAccessService0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAccessService0015 begin');
      const service: ResourceAccessService = newService();
      const first: string = await service.getConfigurationJson();
      const second: string = await service.getConfigurationJson();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d/%{public}d', first.length, second.length);
      expect(first).assertEqual(second);
      expect(first.length).assertEqual(second.length);
      expect(first.startsWith('{')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAccessService0015 end');
    })

    /**
     * @tc.name   testAccessService0016
     * @tc.number SUB_RESMGR_ACCESS_REAL_0016
     * @tc.desc   isUsable 只把非空串判定为可用
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAccessService0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAccessService0016 begin');
      const nonEmpty: boolean = ResourceAccessService.isUsable('0');
      const empty: boolean = ResourceAccessService.isUsable('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s/%{public}s', String(nonEmpty), String(empty));
      expect(nonEmpty).assertTrue();
      expect(empty).assertFalse();
      expect(ResourceAccessService.isUsable(' ')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAccessService0016 end');
    })

    /**
     * @tc.name   testAccessService0017
     * @tc.number SUB_RESMGR_ACCESS_REAL_0017
     * @tc.desc   三个哨兵常量必须与文档约定的取值一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAccessService0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAccessService0017 begin');
      expect(ACCESS_FAILED_STRING).assertEqual('');
      expect(ACCESS_FAILED_NUMBER).assertEqual(-1);
      expect(ACCESS_EMPTY_JSON).assertEqual('{}');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAccessService0017 end');
    })

    /**
     * @tc.name   testAccessService0018
     * @tc.number SUB_RESMGR_ACCESS_REAL_0018
     * @tc.desc   失败路径不能互相污染：字符串失败不影响后续字节数读取
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAccessService0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAccessService0018 begin');
      const service: ResourceAccessService = newService();
      const text: string = await service.getString(MISSING_ID);
      const bytes: number = await service.getMediaByteLength(MISSING_ID);
      const json: string = await service.getCapabilityJson();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=[%{public}s]/%{public}d', text, bytes);
      expect(text).assertEqual(ACCESS_FAILED_STRING);
      expect(bytes).assertEqual(ACCESS_FAILED_NUMBER);
      expect(json.startsWith('{')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testAccessService0018 end');
    })
  })
}
