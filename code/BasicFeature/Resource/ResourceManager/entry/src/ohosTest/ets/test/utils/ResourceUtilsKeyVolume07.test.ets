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
import { ResourceUtils } from '../../../../main/ets/utils/ResourceUtils';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[Sample_ResourceManager]';

export default function resourceUtilsKeyTest() {
  describe('ResourceUtilsKeyTest', () => {

    /**
     * @tc.name   testResourceUtilsKey0001
     * @tc.number SUB_RESMGR_UTILS_07_0001
     * @tc.desc   resourceKey of bundle [] module [] id 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKey0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKey0001 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: '', moduleName: '', id: 0});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('-:-:0'));
      expect(result).assertEqual('-:-:0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(0))));
      expect(result.endsWith(':' + String(0))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKey0001 end');
    })

    /**
     * @tc.name   testResourceUtilsKey0002
     * @tc.number SUB_RESMGR_UTILS_07_0002
     * @tc.desc   resourceKey of bundle [] module [] id 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKey0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKey0002 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: '', moduleName: '', id: 1});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('-:-:1'));
      expect(result).assertEqual('-:-:1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(1))));
      expect(result.endsWith(':' + String(1))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKey0002 end');
    })

    /**
     * @tc.name   testResourceUtilsKey0003
     * @tc.number SUB_RESMGR_UTILS_07_0003
     * @tc.desc   resourceKey of bundle [] module [] id 5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKey0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKey0003 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: '', moduleName: '', id: 5});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('-:-:5'));
      expect(result).assertEqual('-:-:5');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(5))));
      expect(result.endsWith(':' + String(5))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKey0003 end');
    })

    /**
     * @tc.name   testResourceUtilsKey0004
     * @tc.number SUB_RESMGR_UTILS_07_0004
     * @tc.desc   resourceKey of bundle [] module [] id 7
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKey0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKey0004 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: '', moduleName: '', id: 7});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('-:-:7'));
      expect(result).assertEqual('-:-:7');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(7))));
      expect(result.endsWith(':' + String(7))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKey0004 end');
    })

    /**
     * @tc.name   testResourceUtilsKey0005
     * @tc.number SUB_RESMGR_UTILS_07_0005
     * @tc.desc   resourceKey of bundle [] module [] id 42
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKey0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKey0005 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: '', moduleName: '', id: 42});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('-:-:42'));
      expect(result).assertEqual('-:-:42');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(42))));
      expect(result.endsWith(':' + String(42))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKey0005 end');
    })

    /**
     * @tc.name   testResourceUtilsKey0006
     * @tc.number SUB_RESMGR_UTILS_07_0006
     * @tc.desc   resourceKey of bundle [] module [] id 1000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKey0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKey0006 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: '', moduleName: '', id: 1000});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('-:-:1000'));
      expect(result).assertEqual('-:-:1000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(1000))));
      expect(result.endsWith(':' + String(1000))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKey0006 end');
    })

    /**
     * @tc.name   testResourceUtilsKey0007
     * @tc.number SUB_RESMGR_UTILS_07_0007
     * @tc.desc   resourceKey of bundle [] module [] id 65535
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKey0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKey0007 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: '', moduleName: '', id: 65535});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('-:-:65535'));
      expect(result).assertEqual('-:-:65535');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(65535))));
      expect(result.endsWith(':' + String(65535))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKey0007 end');
    })

    /**
     * @tc.name   testResourceUtilsKey0008
     * @tc.number SUB_RESMGR_UTILS_07_0008
     * @tc.desc   resourceKey of bundle [] module [] id 123456
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKey0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKey0008 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: '', moduleName: '', id: 123456});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('-:-:123456'));
      expect(result).assertEqual('-:-:123456');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(123456))));
      expect(result.endsWith(':' + String(123456))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKey0008 end');
    })

    /**
     * @tc.name   testResourceUtilsKey0009
     * @tc.number SUB_RESMGR_UTILS_07_0009
     * @tc.desc   resourceKey of bundle [] module [] id 999999
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKey0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKey0009 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: '', moduleName: '', id: 999999});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('-:-:999999'));
      expect(result).assertEqual('-:-:999999');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(999999))));
      expect(result.endsWith(':' + String(999999))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKey0009 end');
    })

    /**
     * @tc.name   testResourceUtilsKey0010
     * @tc.number SUB_RESMGR_UTILS_07_0010
     * @tc.desc   resourceKey of bundle [] module [] id 16777215
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKey0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKey0010 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: '', moduleName: '', id: 16777215});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('-:-:16777215'));
      expect(result).assertEqual('-:-:16777215');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(16777215))));
      expect(result.endsWith(':' + String(16777215))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKey0010 end');
    })

    /**
     * @tc.name   testResourceUtilsKey0011
     * @tc.number SUB_RESMGR_UTILS_07_0011
     * @tc.desc   resourceKey of bundle [] module [entry] id 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKey0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKey0011 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: '', moduleName: 'entry', id: 0});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('-:entry:0'));
      expect(result).assertEqual('-:entry:0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(0))));
      expect(result.endsWith(':' + String(0))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKey0011 end');
    })

    /**
     * @tc.name   testResourceUtilsKey0012
     * @tc.number SUB_RESMGR_UTILS_07_0012
     * @tc.desc   resourceKey of bundle [] module [entry] id 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKey0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKey0012 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: '', moduleName: 'entry', id: 1});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('-:entry:1'));
      expect(result).assertEqual('-:entry:1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(1))));
      expect(result.endsWith(':' + String(1))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKey0012 end');
    })

    /**
     * @tc.name   testResourceUtilsKey0013
     * @tc.number SUB_RESMGR_UTILS_07_0013
     * @tc.desc   resourceKey of bundle [] module [entry] id 5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKey0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKey0013 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: '', moduleName: 'entry', id: 5});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('-:entry:5'));
      expect(result).assertEqual('-:entry:5');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(5))));
      expect(result.endsWith(':' + String(5))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKey0013 end');
    })

    /**
     * @tc.name   testResourceUtilsKey0014
     * @tc.number SUB_RESMGR_UTILS_07_0014
     * @tc.desc   resourceKey of bundle [] module [entry] id 7
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKey0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKey0014 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: '', moduleName: 'entry', id: 7});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('-:entry:7'));
      expect(result).assertEqual('-:entry:7');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(7))));
      expect(result.endsWith(':' + String(7))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKey0014 end');
    })

    /**
     * @tc.name   testResourceUtilsKey0015
     * @tc.number SUB_RESMGR_UTILS_07_0015
     * @tc.desc   resourceKey of bundle [] module [entry] id 42
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKey0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKey0015 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: '', moduleName: 'entry', id: 42});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('-:entry:42'));
      expect(result).assertEqual('-:entry:42');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(42))));
      expect(result.endsWith(':' + String(42))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKey0015 end');
    })

    /**
     * @tc.name   testResourceUtilsKey0016
     * @tc.number SUB_RESMGR_UTILS_07_0016
     * @tc.desc   resourceKey of bundle [] module [entry] id 1000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKey0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKey0016 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: '', moduleName: 'entry', id: 1000});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('-:entry:1000'));
      expect(result).assertEqual('-:entry:1000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(1000))));
      expect(result.endsWith(':' + String(1000))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKey0016 end');
    })

    /**
     * @tc.name   testResourceUtilsKey0017
     * @tc.number SUB_RESMGR_UTILS_07_0017
     * @tc.desc   resourceKey of bundle [] module [entry] id 65535
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKey0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKey0017 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: '', moduleName: 'entry', id: 65535});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('-:entry:65535'));
      expect(result).assertEqual('-:entry:65535');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(65535))));
      expect(result.endsWith(':' + String(65535))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKey0017 end');
    })

    /**
     * @tc.name   testResourceUtilsKey0018
     * @tc.number SUB_RESMGR_UTILS_07_0018
     * @tc.desc   resourceKey of bundle [] module [entry] id 123456
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKey0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKey0018 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: '', moduleName: 'entry', id: 123456});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('-:entry:123456'));
      expect(result).assertEqual('-:entry:123456');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(123456))));
      expect(result.endsWith(':' + String(123456))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKey0018 end');
    })

    /**
     * @tc.name   testResourceUtilsKey0019
     * @tc.number SUB_RESMGR_UTILS_07_0019
     * @tc.desc   resourceKey of bundle [] module [entry] id 999999
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKey0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKey0019 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: '', moduleName: 'entry', id: 999999});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('-:entry:999999'));
      expect(result).assertEqual('-:entry:999999');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(999999))));
      expect(result.endsWith(':' + String(999999))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKey0019 end');
    })

    /**
     * @tc.name   testResourceUtilsKey0020
     * @tc.number SUB_RESMGR_UTILS_07_0020
     * @tc.desc   resourceKey of bundle [] module [entry] id 16777215
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKey0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKey0020 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: '', moduleName: 'entry', id: 16777215});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('-:entry:16777215'));
      expect(result).assertEqual('-:entry:16777215');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(16777215))));
      expect(result.endsWith(':' + String(16777215))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKey0020 end');
    })

    /**
     * @tc.name   testResourceUtilsKey0021
     * @tc.number SUB_RESMGR_UTILS_07_0021
     * @tc.desc   resourceKey of bundle [a] module [] id 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKey0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKey0021 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'a', moduleName: '', id: 0});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('a:-:0'));
      expect(result).assertEqual('a:-:0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(0))));
      expect(result.endsWith(':' + String(0))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKey0021 end');
    })

    /**
     * @tc.name   testResourceUtilsKey0022
     * @tc.number SUB_RESMGR_UTILS_07_0022
     * @tc.desc   resourceKey of bundle [a] module [] id 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKey0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKey0022 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'a', moduleName: '', id: 1});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('a:-:1'));
      expect(result).assertEqual('a:-:1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(1))));
      expect(result.endsWith(':' + String(1))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKey0022 end');
    })

    /**
     * @tc.name   testResourceUtilsKey0023
     * @tc.number SUB_RESMGR_UTILS_07_0023
     * @tc.desc   resourceKey of bundle [a] module [] id 5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKey0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKey0023 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'a', moduleName: '', id: 5});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('a:-:5'));
      expect(result).assertEqual('a:-:5');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(5))));
      expect(result.endsWith(':' + String(5))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKey0023 end');
    })

    /**
     * @tc.name   testResourceUtilsKey0024
     * @tc.number SUB_RESMGR_UTILS_07_0024
     * @tc.desc   resourceKey of bundle [a] module [] id 7
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKey0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKey0024 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'a', moduleName: '', id: 7});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('a:-:7'));
      expect(result).assertEqual('a:-:7');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(7))));
      expect(result.endsWith(':' + String(7))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKey0024 end');
    })

    /**
     * @tc.name   testResourceUtilsKey0025
     * @tc.number SUB_RESMGR_UTILS_07_0025
     * @tc.desc   resourceKey of bundle [a] module [] id 42
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKey0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKey0025 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'a', moduleName: '', id: 42});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('a:-:42'));
      expect(result).assertEqual('a:-:42');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(42))));
      expect(result.endsWith(':' + String(42))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKey0025 end');
    })

    /**
     * @tc.name   testResourceUtilsKey0026
     * @tc.number SUB_RESMGR_UTILS_07_0026
     * @tc.desc   resourceKey of bundle [a] module [] id 1000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKey0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKey0026 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'a', moduleName: '', id: 1000});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('a:-:1000'));
      expect(result).assertEqual('a:-:1000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(1000))));
      expect(result.endsWith(':' + String(1000))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKey0026 end');
    })

    /**
     * @tc.name   testResourceUtilsKey0027
     * @tc.number SUB_RESMGR_UTILS_07_0027
     * @tc.desc   resourceKey of bundle [a] module [] id 65535
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKey0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKey0027 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'a', moduleName: '', id: 65535});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('a:-:65535'));
      expect(result).assertEqual('a:-:65535');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(65535))));
      expect(result.endsWith(':' + String(65535))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKey0027 end');
    })

    /**
     * @tc.name   testResourceUtilsKey0028
     * @tc.number SUB_RESMGR_UTILS_07_0028
     * @tc.desc   resourceKey of bundle [a] module [] id 123456
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKey0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKey0028 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'a', moduleName: '', id: 123456});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('a:-:123456'));
      expect(result).assertEqual('a:-:123456');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(123456))));
      expect(result.endsWith(':' + String(123456))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKey0028 end');
    })

    /**
     * @tc.name   testResourceUtilsKey0029
     * @tc.number SUB_RESMGR_UTILS_07_0029
     * @tc.desc   resourceKey of bundle [a] module [] id 999999
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKey0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKey0029 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'a', moduleName: '', id: 999999});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('a:-:999999'));
      expect(result).assertEqual('a:-:999999');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(999999))));
      expect(result.endsWith(':' + String(999999))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKey0029 end');
    })

    /**
     * @tc.name   testResourceUtilsKey0030
     * @tc.number SUB_RESMGR_UTILS_07_0030
     * @tc.desc   resourceKey of bundle [a] module [] id 16777215
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKey0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKey0030 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'a', moduleName: '', id: 16777215});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('a:-:16777215'));
      expect(result).assertEqual('a:-:16777215');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(16777215))));
      expect(result.endsWith(':' + String(16777215))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKey0030 end');
    })

    /**
     * @tc.name   testResourceUtilsKey0031
     * @tc.number SUB_RESMGR_UTILS_07_0031
     * @tc.desc   resourceKey of bundle [a] module [entry] id 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKey0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKey0031 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'a', moduleName: 'entry', id: 0});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('a:entry:0'));
      expect(result).assertEqual('a:entry:0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(0))));
      expect(result.endsWith(':' + String(0))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKey0031 end');
    })

    /**
     * @tc.name   testResourceUtilsKey0032
     * @tc.number SUB_RESMGR_UTILS_07_0032
     * @tc.desc   resourceKey of bundle [a] module [entry] id 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKey0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKey0032 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'a', moduleName: 'entry', id: 1});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('a:entry:1'));
      expect(result).assertEqual('a:entry:1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(1))));
      expect(result.endsWith(':' + String(1))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKey0032 end');
    })

    /**
     * @tc.name   testResourceUtilsKey0033
     * @tc.number SUB_RESMGR_UTILS_07_0033
     * @tc.desc   resourceKey of bundle [a] module [entry] id 5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKey0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKey0033 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'a', moduleName: 'entry', id: 5});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('a:entry:5'));
      expect(result).assertEqual('a:entry:5');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(5))));
      expect(result.endsWith(':' + String(5))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKey0033 end');
    })

    /**
     * @tc.name   testResourceUtilsKey0034
     * @tc.number SUB_RESMGR_UTILS_07_0034
     * @tc.desc   resourceKey of bundle [a] module [entry] id 7
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKey0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKey0034 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'a', moduleName: 'entry', id: 7});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('a:entry:7'));
      expect(result).assertEqual('a:entry:7');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(7))));
      expect(result.endsWith(':' + String(7))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKey0034 end');
    })

    /**
     * @tc.name   testResourceUtilsKey0035
     * @tc.number SUB_RESMGR_UTILS_07_0035
     * @tc.desc   resourceKey of bundle [a] module [entry] id 42
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKey0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKey0035 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'a', moduleName: 'entry', id: 42});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('a:entry:42'));
      expect(result).assertEqual('a:entry:42');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(42))));
      expect(result.endsWith(':' + String(42))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKey0035 end');
    })

    /**
     * @tc.name   testResourceUtilsKey0036
     * @tc.number SUB_RESMGR_UTILS_07_0036
     * @tc.desc   resourceKey of bundle [a] module [entry] id 1000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKey0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKey0036 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'a', moduleName: 'entry', id: 1000});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('a:entry:1000'));
      expect(result).assertEqual('a:entry:1000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(1000))));
      expect(result.endsWith(':' + String(1000))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKey0036 end');
    })

    /**
     * @tc.name   testResourceUtilsKey0037
     * @tc.number SUB_RESMGR_UTILS_07_0037
     * @tc.desc   resourceKey of bundle [a] module [entry] id 65535
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKey0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKey0037 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'a', moduleName: 'entry', id: 65535});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('a:entry:65535'));
      expect(result).assertEqual('a:entry:65535');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(65535))));
      expect(result.endsWith(':' + String(65535))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKey0037 end');
    })

    /**
     * @tc.name   testResourceUtilsKey0038
     * @tc.number SUB_RESMGR_UTILS_07_0038
     * @tc.desc   resourceKey of bundle [a] module [entry] id 123456
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKey0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKey0038 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'a', moduleName: 'entry', id: 123456});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('a:entry:123456'));
      expect(result).assertEqual('a:entry:123456');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(123456))));
      expect(result.endsWith(':' + String(123456))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKey0038 end');
    })

    /**
     * @tc.name   testResourceUtilsKey0039
     * @tc.number SUB_RESMGR_UTILS_07_0039
     * @tc.desc   resourceKey of bundle [a] module [entry] id 999999
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKey0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKey0039 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'a', moduleName: 'entry', id: 999999});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('a:entry:999999'));
      expect(result).assertEqual('a:entry:999999');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(999999))));
      expect(result.endsWith(':' + String(999999))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKey0039 end');
    })

    /**
     * @tc.name   testResourceUtilsKey0040
     * @tc.number SUB_RESMGR_UTILS_07_0040
     * @tc.desc   resourceKey of bundle [a] module [entry] id 16777215
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKey0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKey0040 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'a', moduleName: 'entry', id: 16777215});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('a:entry:16777215'));
      expect(result).assertEqual('a:entry:16777215');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(16777215))));
      expect(result.endsWith(':' + String(16777215))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKey0040 end');
    })

    /**
     * @tc.name   testResourceUtilsKey0041
     * @tc.number SUB_RESMGR_UTILS_07_0041
     * @tc.desc   resourceKey of bundle [ohos.samples.resourcemanager] module [] id 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKey0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKey0041 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'ohos.samples.resourcemanager', moduleName: '',
        id: 0});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:-:0'));
      expect(result).assertEqual('ohos.samples.resourcemanager:-:0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(0))));
      expect(result.endsWith(':' + String(0))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKey0041 end');
    })

    /**
     * @tc.name   testResourceUtilsKey0042
     * @tc.number SUB_RESMGR_UTILS_07_0042
     * @tc.desc   resourceKey of bundle [ohos.samples.resourcemanager] module [] id 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKey0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKey0042 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'ohos.samples.resourcemanager', moduleName: '',
        id: 1});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:-:1'));
      expect(result).assertEqual('ohos.samples.resourcemanager:-:1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(1))));
      expect(result.endsWith(':' + String(1))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKey0042 end');
    })

    /**
     * @tc.name   testResourceUtilsKey0043
     * @tc.number SUB_RESMGR_UTILS_07_0043
     * @tc.desc   resourceKey of bundle [ohos.samples.resourcemanager] module [] id 5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKey0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKey0043 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'ohos.samples.resourcemanager', moduleName: '',
        id: 5});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:-:5'));
      expect(result).assertEqual('ohos.samples.resourcemanager:-:5');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(5))));
      expect(result.endsWith(':' + String(5))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKey0043 end');
    })

    /**
     * @tc.name   testResourceUtilsKey0044
     * @tc.number SUB_RESMGR_UTILS_07_0044
     * @tc.desc   resourceKey of bundle [ohos.samples.resourcemanager] module [] id 7
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKey0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKey0044 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'ohos.samples.resourcemanager', moduleName: '',
        id: 7});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:-:7'));
      expect(result).assertEqual('ohos.samples.resourcemanager:-:7');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(7))));
      expect(result.endsWith(':' + String(7))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKey0044 end');
    })

    /**
     * @tc.name   testResourceUtilsKey0045
     * @tc.number SUB_RESMGR_UTILS_07_0045
     * @tc.desc   resourceKey of bundle [ohos.samples.resourcemanager] module [] id 42
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKey0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKey0045 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'ohos.samples.resourcemanager', moduleName: '',
        id: 42});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:-:42'));
      expect(result).assertEqual('ohos.samples.resourcemanager:-:42');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(42))));
      expect(result.endsWith(':' + String(42))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKey0045 end');
    })

    /**
     * @tc.name   testResourceUtilsKey0046
     * @tc.number SUB_RESMGR_UTILS_07_0046
     * @tc.desc   resourceKey of bundle [ohos.samples.resourcemanager] module [] id 1000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKey0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKey0046 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'ohos.samples.resourcemanager', moduleName: '',
        id: 1000});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:-:1000'));
      expect(result).assertEqual('ohos.samples.resourcemanager:-:1000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(1000))));
      expect(result.endsWith(':' + String(1000))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKey0046 end');
    })

    /**
     * @tc.name   testResourceUtilsKey0047
     * @tc.number SUB_RESMGR_UTILS_07_0047
     * @tc.desc   resourceKey of bundle [ohos.samples.resourcemanager] module [] id 65535
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKey0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKey0047 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'ohos.samples.resourcemanager', moduleName: '',
        id: 65535});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:-:65535'));
      expect(result).assertEqual('ohos.samples.resourcemanager:-:65535');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(65535))));
      expect(result.endsWith(':' + String(65535))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKey0047 end');
    })

    /**
     * @tc.name   testResourceUtilsKey0048
     * @tc.number SUB_RESMGR_UTILS_07_0048
     * @tc.desc   resourceKey of bundle [ohos.samples.resourcemanager] module [] id 123456
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKey0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKey0048 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'ohos.samples.resourcemanager', moduleName: '',
        id: 123456});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:-:123456'));
      expect(result).assertEqual('ohos.samples.resourcemanager:-:123456');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(123456))));
      expect(result.endsWith(':' + String(123456))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKey0048 end');
    })

    /**
     * @tc.name   testResourceUtilsKey0049
     * @tc.number SUB_RESMGR_UTILS_07_0049
     * @tc.desc   resourceKey of bundle [ohos.samples.resourcemanager] module [] id 999999
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKey0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKey0049 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'ohos.samples.resourcemanager', moduleName: '',
        id: 999999});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:-:999999'));
      expect(result).assertEqual('ohos.samples.resourcemanager:-:999999');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(999999))));
      expect(result.endsWith(':' + String(999999))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKey0049 end');
    })

    /**
     * @tc.name   testResourceUtilsKey0050
     * @tc.number SUB_RESMGR_UTILS_07_0050
     * @tc.desc   resourceKey of bundle [ohos.samples.resourcemanager] module [] id 16777215
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKey0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKey0050 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'ohos.samples.resourcemanager', moduleName: '',
        id: 16777215});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:-:16777215'));
      expect(result).assertEqual('ohos.samples.resourcemanager:-:16777215');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(16777215))));
      expect(result.endsWith(':' + String(16777215))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKey0050 end');
    })

    /**
     * @tc.name   testResourceUtilsKey0051
     * @tc.number SUB_RESMGR_UTILS_07_0051
     * @tc.desc   resourceKey of bundle [ohos.samples.resourcemanager] module [entry] id 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKey0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKey0051 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 0});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:entry:0'));
      expect(result).assertEqual('ohos.samples.resourcemanager:entry:0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(0))));
      expect(result.endsWith(':' + String(0))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKey0051 end');
    })

    /**
     * @tc.name   testResourceUtilsKey0052
     * @tc.number SUB_RESMGR_UTILS_07_0052
     * @tc.desc   resourceKey of bundle [ohos.samples.resourcemanager] module [entry] id 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKey0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKey0052 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 1});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:entry:1'));
      expect(result).assertEqual('ohos.samples.resourcemanager:entry:1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(1))));
      expect(result.endsWith(':' + String(1))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKey0052 end');
    })

    /**
     * @tc.name   testResourceUtilsKey0053
     * @tc.number SUB_RESMGR_UTILS_07_0053
     * @tc.desc   resourceKey of bundle [ohos.samples.resourcemanager] module [entry] id 5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKey0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKey0053 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 5});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:entry:5'));
      expect(result).assertEqual('ohos.samples.resourcemanager:entry:5');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(5))));
      expect(result.endsWith(':' + String(5))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKey0053 end');
    })

    /**
     * @tc.name   testResourceUtilsKey0054
     * @tc.number SUB_RESMGR_UTILS_07_0054
     * @tc.desc   resourceKey of bundle [ohos.samples.resourcemanager] module [entry] id 7
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKey0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKey0054 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 7});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:entry:7'));
      expect(result).assertEqual('ohos.samples.resourcemanager:entry:7');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(7))));
      expect(result.endsWith(':' + String(7))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKey0054 end');
    })

    /**
     * @tc.name   testResourceUtilsKey0055
     * @tc.number SUB_RESMGR_UTILS_07_0055
     * @tc.desc   resourceKey of bundle [ohos.samples.resourcemanager] module [entry] id 42
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKey0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKey0055 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 42});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:entry:42'));
      expect(result).assertEqual('ohos.samples.resourcemanager:entry:42');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(42))));
      expect(result.endsWith(':' + String(42))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKey0055 end');
    })

    /**
     * @tc.name   testResourceUtilsKey0056
     * @tc.number SUB_RESMGR_UTILS_07_0056
     * @tc.desc   resourceKey of bundle [ohos.samples.resourcemanager] module [entry] id 1000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKey0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKey0056 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 1000});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:entry:1000'));
      expect(result).assertEqual('ohos.samples.resourcemanager:entry:1000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(1000))));
      expect(result.endsWith(':' + String(1000))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKey0056 end');
    })

    /**
     * @tc.name   testResourceUtilsKey0057
     * @tc.number SUB_RESMGR_UTILS_07_0057
     * @tc.desc   resourceKey of bundle [ohos.samples.resourcemanager] module [entry] id 65535
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKey0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKey0057 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 65535});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:entry:65535'));
      expect(result).assertEqual('ohos.samples.resourcemanager:entry:65535');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(65535))));
      expect(result.endsWith(':' + String(65535))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKey0057 end');
    })

    /**
     * @tc.name   testResourceUtilsKey0058
     * @tc.number SUB_RESMGR_UTILS_07_0058
     * @tc.desc   resourceKey of bundle [ohos.samples.resourcemanager] module [entry] id 123456
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKey0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKey0058 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 123456});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:entry:123456'));
      expect(result).assertEqual('ohos.samples.resourcemanager:entry:123456');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(123456))));
      expect(result.endsWith(':' + String(123456))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKey0058 end');
    })

    /**
     * @tc.name   testResourceUtilsKey0059
     * @tc.number SUB_RESMGR_UTILS_07_0059
     * @tc.desc   resourceKey of bundle [ohos.samples.resourcemanager] module [entry] id 999999
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKey0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKey0059 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 999999});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:entry:999999'));
      expect(result).assertEqual('ohos.samples.resourcemanager:entry:999999');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(999999))));
      expect(result.endsWith(':' + String(999999))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKey0059 end');
    })

    /**
     * @tc.name   testResourceUtilsKey0060
     * @tc.number SUB_RESMGR_UTILS_07_0060
     * @tc.desc   resourceKey of bundle [ohos.samples.resourcemanager] module [entry] id 16777215
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKey0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKey0060 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 16777215});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:entry:16777215'));
      expect(result).assertEqual('ohos.samples.resourcemanager:entry:16777215');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(16777215))));
      expect(result.endsWith(':' + String(16777215))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKey0060 end');
    })

    /**
     * @tc.name   testResourceUtilsKey0061
     * @tc.number SUB_RESMGR_UTILS_07_0061
     * @tc.desc   缺失字段的占位符与 isSameResource 的正反两侧
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKey0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKey0061 begin');
      // 两个字段都缺失时不能用空串拼，必须用 '-' 占位
      const bothMissing: string = ResourceUtils.resourceKey({ bundleName: '', moduleName: '', id: 0 });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', bothMissing, '-:-:0');
      expect(bothMissing).assertEqual('-:-:0');
      // 完整三元组必须原样拼接，且只包含两个分隔符
      const full: string = ResourceUtils.resourceKey({
        bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry',
        id: 7
      });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        full, 'ohos.samples.resourcemanager:entry:7');
      expect(full).assertEqual('ohos.samples.resourcemanager:entry:7');
      expect(full.split(':').length).assertEqual(3);
      // 同一个资源的三元组必须互认，任一字段不同都必须判否
      const sameLeft: resourceManager.Resource = { bundleName: 'ohos.samples.resourcemanager', moduleName: 'entry',
        id: 7 };
      const sameRight: resourceManager.Resource = { bundleName: 'ohos.samples.resourcemanager', moduleName: 'entry',
        id: 7 };
      const otherId: resourceManager.Resource = { bundleName: 'ohos.samples.resourcemanager', moduleName: 'entry',
        id: 8 };
      const otherBundle: resourceManager.Resource = { bundleName: 'ohos.samples.other', moduleName: 'entry', id: 7 };
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(ResourceUtils.isSameResource(sameLeft, sameRight)));
      expect(ResourceUtils.isSameResource(sameLeft, sameRight)).assertTrue();
      expect(ResourceUtils.isSameResource(sameLeft, otherId)).assertFalse();
      expect(ResourceUtils.isSameResource(sameLeft, otherBundle)).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKey0061 end');
    })

  })
}
