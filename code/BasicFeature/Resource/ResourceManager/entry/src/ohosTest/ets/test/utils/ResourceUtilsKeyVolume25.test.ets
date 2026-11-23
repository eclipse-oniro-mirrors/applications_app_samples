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

export default function resourceUtilsKeyV25Test() {
  describe('ResourceUtilsKeyV25Test', () => {

    /**
     * @tc.name   testResourceUtilsKeyV250001
     * @tc.number SUB_RESMGR_UTILS25_0001
     * @tc.desc   资源 id 100 拼出的键为 bundle:module:id
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyV250001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250001 begin');
      const result: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 100 });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:entry:100'));
      expect(result).assertEqual('ohos.samples.resourcemanager:entry:100');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':100')));
      expect(result.endsWith(':100')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250001 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyV250002
     * @tc.number SUB_RESMGR_UTILS25_0002
     * @tc.desc   资源 id 101 拼出的键为 bundle:module:id
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyV250002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250002 begin');
      const result: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 101 });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:entry:101'));
      expect(result).assertEqual('ohos.samples.resourcemanager:entry:101');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':101')));
      expect(result.endsWith(':101')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250002 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyV250003
     * @tc.number SUB_RESMGR_UTILS25_0003
     * @tc.desc   资源 id 102 拼出的键为 bundle:module:id
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyV250003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250003 begin');
      const result: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 102 });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:entry:102'));
      expect(result).assertEqual('ohos.samples.resourcemanager:entry:102');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':102')));
      expect(result.endsWith(':102')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250003 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyV250004
     * @tc.number SUB_RESMGR_UTILS25_0004
     * @tc.desc   资源 id 103 拼出的键为 bundle:module:id
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyV250004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250004 begin');
      const result: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 103 });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:entry:103'));
      expect(result).assertEqual('ohos.samples.resourcemanager:entry:103');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':103')));
      expect(result.endsWith(':103')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250004 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyV250005
     * @tc.number SUB_RESMGR_UTILS25_0005
     * @tc.desc   资源 id 104 拼出的键为 bundle:module:id
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyV250005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250005 begin');
      const result: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 104 });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:entry:104'));
      expect(result).assertEqual('ohos.samples.resourcemanager:entry:104');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':104')));
      expect(result.endsWith(':104')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250005 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyV250006
     * @tc.number SUB_RESMGR_UTILS25_0006
     * @tc.desc   资源 id 105 拼出的键为 bundle:module:id
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyV250006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250006 begin');
      const result: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 105 });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:entry:105'));
      expect(result).assertEqual('ohos.samples.resourcemanager:entry:105');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':105')));
      expect(result.endsWith(':105')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250006 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyV250007
     * @tc.number SUB_RESMGR_UTILS25_0007
     * @tc.desc   资源 id 106 拼出的键为 bundle:module:id
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyV250007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250007 begin');
      const result: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 106 });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:entry:106'));
      expect(result).assertEqual('ohos.samples.resourcemanager:entry:106');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':106')));
      expect(result.endsWith(':106')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250007 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyV250008
     * @tc.number SUB_RESMGR_UTILS25_0008
     * @tc.desc   资源 id 107 拼出的键为 bundle:module:id
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyV250008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250008 begin');
      const result: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 107 });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:entry:107'));
      expect(result).assertEqual('ohos.samples.resourcemanager:entry:107');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':107')));
      expect(result.endsWith(':107')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250008 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyV250009
     * @tc.number SUB_RESMGR_UTILS25_0009
     * @tc.desc   资源 id 108 拼出的键为 bundle:module:id
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyV250009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250009 begin');
      const result: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 108 });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:entry:108'));
      expect(result).assertEqual('ohos.samples.resourcemanager:entry:108');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':108')));
      expect(result.endsWith(':108')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250009 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyV250010
     * @tc.number SUB_RESMGR_UTILS25_0010
     * @tc.desc   资源 id 109 拼出的键为 bundle:module:id
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyV250010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250010 begin');
      const result: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 109 });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:entry:109'));
      expect(result).assertEqual('ohos.samples.resourcemanager:entry:109');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':109')));
      expect(result.endsWith(':109')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250010 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyV250011
     * @tc.number SUB_RESMGR_UTILS25_0011
     * @tc.desc   资源 id 110 拼出的键为 bundle:module:id
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyV250011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250011 begin');
      const result: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 110 });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:entry:110'));
      expect(result).assertEqual('ohos.samples.resourcemanager:entry:110');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':110')));
      expect(result.endsWith(':110')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250011 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyV250012
     * @tc.number SUB_RESMGR_UTILS25_0012
     * @tc.desc   资源 id 111 拼出的键为 bundle:module:id
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyV250012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250012 begin');
      const result: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 111 });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:entry:111'));
      expect(result).assertEqual('ohos.samples.resourcemanager:entry:111');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':111')));
      expect(result.endsWith(':111')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250012 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyV250013
     * @tc.number SUB_RESMGR_UTILS25_0013
     * @tc.desc   资源 id 112 拼出的键为 bundle:module:id
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyV250013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250013 begin');
      const result: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 112 });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:entry:112'));
      expect(result).assertEqual('ohos.samples.resourcemanager:entry:112');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':112')));
      expect(result.endsWith(':112')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250013 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyV250014
     * @tc.number SUB_RESMGR_UTILS25_0014
     * @tc.desc   资源 id 113 拼出的键为 bundle:module:id
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyV250014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250014 begin');
      const result: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 113 });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:entry:113'));
      expect(result).assertEqual('ohos.samples.resourcemanager:entry:113');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':113')));
      expect(result.endsWith(':113')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250014 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyV250015
     * @tc.number SUB_RESMGR_UTILS25_0015
     * @tc.desc   资源 id 114 拼出的键为 bundle:module:id
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyV250015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250015 begin');
      const result: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 114 });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:entry:114'));
      expect(result).assertEqual('ohos.samples.resourcemanager:entry:114');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':114')));
      expect(result.endsWith(':114')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250015 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyV250016
     * @tc.number SUB_RESMGR_UTILS25_0016
     * @tc.desc   资源 id 115 拼出的键为 bundle:module:id
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyV250016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250016 begin');
      const result: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 115 });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:entry:115'));
      expect(result).assertEqual('ohos.samples.resourcemanager:entry:115');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':115')));
      expect(result.endsWith(':115')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250016 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyV250017
     * @tc.number SUB_RESMGR_UTILS25_0017
     * @tc.desc   资源 id 116 拼出的键为 bundle:module:id
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyV250017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250017 begin');
      const result: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 116 });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:entry:116'));
      expect(result).assertEqual('ohos.samples.resourcemanager:entry:116');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':116')));
      expect(result.endsWith(':116')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250017 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyV250018
     * @tc.number SUB_RESMGR_UTILS25_0018
     * @tc.desc   资源 id 117 拼出的键为 bundle:module:id
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyV250018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250018 begin');
      const result: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 117 });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:entry:117'));
      expect(result).assertEqual('ohos.samples.resourcemanager:entry:117');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':117')));
      expect(result.endsWith(':117')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250018 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyV250019
     * @tc.number SUB_RESMGR_UTILS25_0019
     * @tc.desc   资源 id 118 拼出的键为 bundle:module:id
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyV250019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250019 begin');
      const result: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 118 });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:entry:118'));
      expect(result).assertEqual('ohos.samples.resourcemanager:entry:118');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':118')));
      expect(result.endsWith(':118')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250019 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyV250020
     * @tc.number SUB_RESMGR_UTILS25_0020
     * @tc.desc   资源 id 119 拼出的键为 bundle:module:id
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyV250020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250020 begin');
      const result: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 119 });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:entry:119'));
      expect(result).assertEqual('ohos.samples.resourcemanager:entry:119');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':119')));
      expect(result.endsWith(':119')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250020 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyV250021
     * @tc.number SUB_RESMGR_UTILS25_0021
     * @tc.desc   资源 id 120 拼出的键为 bundle:module:id
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyV250021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250021 begin');
      const result: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 120 });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:entry:120'));
      expect(result).assertEqual('ohos.samples.resourcemanager:entry:120');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':120')));
      expect(result.endsWith(':120')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250021 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyV250022
     * @tc.number SUB_RESMGR_UTILS25_0022
     * @tc.desc   资源 id 121 拼出的键为 bundle:module:id
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyV250022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250022 begin');
      const result: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 121 });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:entry:121'));
      expect(result).assertEqual('ohos.samples.resourcemanager:entry:121');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':121')));
      expect(result.endsWith(':121')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250022 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyV250023
     * @tc.number SUB_RESMGR_UTILS25_0023
     * @tc.desc   资源 id 122 拼出的键为 bundle:module:id
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyV250023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250023 begin');
      const result: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 122 });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:entry:122'));
      expect(result).assertEqual('ohos.samples.resourcemanager:entry:122');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':122')));
      expect(result.endsWith(':122')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250023 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyV250024
     * @tc.number SUB_RESMGR_UTILS25_0024
     * @tc.desc   资源 id 123 拼出的键为 bundle:module:id
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyV250024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250024 begin');
      const result: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 123 });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:entry:123'));
      expect(result).assertEqual('ohos.samples.resourcemanager:entry:123');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':123')));
      expect(result.endsWith(':123')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250024 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyV250025
     * @tc.number SUB_RESMGR_UTILS25_0025
     * @tc.desc   资源 id 124 拼出的键为 bundle:module:id
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyV250025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250025 begin');
      const result: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 124 });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:entry:124'));
      expect(result).assertEqual('ohos.samples.resourcemanager:entry:124');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':124')));
      expect(result.endsWith(':124')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250025 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyV250026
     * @tc.number SUB_RESMGR_UTILS25_0026
     * @tc.desc   资源 id 125 拼出的键为 bundle:module:id
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyV250026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250026 begin');
      const result: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 125 });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:entry:125'));
      expect(result).assertEqual('ohos.samples.resourcemanager:entry:125');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':125')));
      expect(result.endsWith(':125')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250026 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyV250027
     * @tc.number SUB_RESMGR_UTILS25_0027
     * @tc.desc   资源 id 126 拼出的键为 bundle:module:id
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyV250027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250027 begin');
      const result: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 126 });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:entry:126'));
      expect(result).assertEqual('ohos.samples.resourcemanager:entry:126');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':126')));
      expect(result.endsWith(':126')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250027 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyV250028
     * @tc.number SUB_RESMGR_UTILS25_0028
     * @tc.desc   资源 id 127 拼出的键为 bundle:module:id
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyV250028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250028 begin');
      const result: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 127 });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:entry:127'));
      expect(result).assertEqual('ohos.samples.resourcemanager:entry:127');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':127')));
      expect(result.endsWith(':127')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250028 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyV250029
     * @tc.number SUB_RESMGR_UTILS25_0029
     * @tc.desc   资源 id 128 拼出的键为 bundle:module:id
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyV250029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250029 begin');
      const result: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 128 });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:entry:128'));
      expect(result).assertEqual('ohos.samples.resourcemanager:entry:128');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':128')));
      expect(result.endsWith(':128')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250029 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyV250030
     * @tc.number SUB_RESMGR_UTILS25_0030
     * @tc.desc   资源 id 129 拼出的键为 bundle:module:id
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyV250030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250030 begin');
      const result: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 129 });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:entry:129'));
      expect(result).assertEqual('ohos.samples.resourcemanager:entry:129');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':129')));
      expect(result.endsWith(':129')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250030 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyV250031
     * @tc.number SUB_RESMGR_UTILS25_0031
     * @tc.desc   资源 id 130 拼出的键为 bundle:module:id
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyV250031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250031 begin');
      const result: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 130 });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:entry:130'));
      expect(result).assertEqual('ohos.samples.resourcemanager:entry:130');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':130')));
      expect(result.endsWith(':130')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250031 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyV250032
     * @tc.number SUB_RESMGR_UTILS25_0032
     * @tc.desc   资源 id 131 拼出的键为 bundle:module:id
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyV250032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250032 begin');
      const result: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 131 });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:entry:131'));
      expect(result).assertEqual('ohos.samples.resourcemanager:entry:131');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':131')));
      expect(result.endsWith(':131')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250032 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyV250033
     * @tc.number SUB_RESMGR_UTILS25_0033
     * @tc.desc   资源 id 132 拼出的键为 bundle:module:id
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyV250033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250033 begin');
      const result: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 132 });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:entry:132'));
      expect(result).assertEqual('ohos.samples.resourcemanager:entry:132');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':132')));
      expect(result.endsWith(':132')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250033 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyV250034
     * @tc.number SUB_RESMGR_UTILS25_0034
     * @tc.desc   资源 id 133 拼出的键为 bundle:module:id
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyV250034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250034 begin');
      const result: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 133 });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:entry:133'));
      expect(result).assertEqual('ohos.samples.resourcemanager:entry:133');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':133')));
      expect(result.endsWith(':133')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250034 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyV250035
     * @tc.number SUB_RESMGR_UTILS25_0035
     * @tc.desc   资源 id 134 拼出的键为 bundle:module:id
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyV250035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250035 begin');
      const result: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 134 });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:entry:134'));
      expect(result).assertEqual('ohos.samples.resourcemanager:entry:134');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':134')));
      expect(result.endsWith(':134')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250035 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyV250036
     * @tc.number SUB_RESMGR_UTILS25_0036
     * @tc.desc   资源 id 135 拼出的键为 bundle:module:id
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyV250036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250036 begin');
      const result: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 135 });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:entry:135'));
      expect(result).assertEqual('ohos.samples.resourcemanager:entry:135');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':135')));
      expect(result.endsWith(':135')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250036 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyV250037
     * @tc.number SUB_RESMGR_UTILS25_0037
     * @tc.desc   资源 id 136 拼出的键为 bundle:module:id
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyV250037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250037 begin');
      const result: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 136 });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:entry:136'));
      expect(result).assertEqual('ohos.samples.resourcemanager:entry:136');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':136')));
      expect(result.endsWith(':136')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250037 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyV250038
     * @tc.number SUB_RESMGR_UTILS25_0038
     * @tc.desc   资源 id 137 拼出的键为 bundle:module:id
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyV250038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250038 begin');
      const result: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 137 });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:entry:137'));
      expect(result).assertEqual('ohos.samples.resourcemanager:entry:137');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':137')));
      expect(result.endsWith(':137')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250038 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyV250039
     * @tc.number SUB_RESMGR_UTILS25_0039
     * @tc.desc   资源 id 138 拼出的键为 bundle:module:id
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyV250039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250039 begin');
      const result: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 138 });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:entry:138'));
      expect(result).assertEqual('ohos.samples.resourcemanager:entry:138');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':138')));
      expect(result.endsWith(':138')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250039 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyV250040
     * @tc.number SUB_RESMGR_UTILS25_0040
     * @tc.desc   资源 id 139 拼出的键为 bundle:module:id
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyV250040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250040 begin');
      const result: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 139 });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:entry:139'));
      expect(result).assertEqual('ohos.samples.resourcemanager:entry:139');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':139')));
      expect(result.endsWith(':139')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250040 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyV250041
     * @tc.number SUB_RESMGR_UTILS25_0041
     * @tc.desc   资源 id 140 拼出的键为 bundle:module:id
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyV250041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250041 begin');
      const result: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 140 });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:entry:140'));
      expect(result).assertEqual('ohos.samples.resourcemanager:entry:140');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':140')));
      expect(result.endsWith(':140')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250041 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyV250042
     * @tc.number SUB_RESMGR_UTILS25_0042
     * @tc.desc   资源 id 141 拼出的键为 bundle:module:id
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyV250042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250042 begin');
      const result: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 141 });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:entry:141'));
      expect(result).assertEqual('ohos.samples.resourcemanager:entry:141');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':141')));
      expect(result.endsWith(':141')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250042 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyV250043
     * @tc.number SUB_RESMGR_UTILS25_0043
     * @tc.desc   资源 id 142 拼出的键为 bundle:module:id
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyV250043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250043 begin');
      const result: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 142 });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:entry:142'));
      expect(result).assertEqual('ohos.samples.resourcemanager:entry:142');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':142')));
      expect(result.endsWith(':142')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250043 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyV250044
     * @tc.number SUB_RESMGR_UTILS25_0044
     * @tc.desc   资源 id 143 拼出的键为 bundle:module:id
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyV250044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250044 begin');
      const result: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 143 });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:entry:143'));
      expect(result).assertEqual('ohos.samples.resourcemanager:entry:143');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':143')));
      expect(result.endsWith(':143')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250044 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyV250045
     * @tc.number SUB_RESMGR_UTILS25_0045
     * @tc.desc   资源 id 144 拼出的键为 bundle:module:id
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyV250045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250045 begin');
      const result: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 144 });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:entry:144'));
      expect(result).assertEqual('ohos.samples.resourcemanager:entry:144');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':144')));
      expect(result.endsWith(':144')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250045 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyV250046
     * @tc.number SUB_RESMGR_UTILS25_0046
     * @tc.desc   资源 id 145 拼出的键为 bundle:module:id
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyV250046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250046 begin');
      const result: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 145 });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:entry:145'));
      expect(result).assertEqual('ohos.samples.resourcemanager:entry:145');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':145')));
      expect(result.endsWith(':145')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250046 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyV250047
     * @tc.number SUB_RESMGR_UTILS25_0047
     * @tc.desc   资源 id 146 拼出的键为 bundle:module:id
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyV250047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250047 begin');
      const result: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 146 });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:entry:146'));
      expect(result).assertEqual('ohos.samples.resourcemanager:entry:146');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':146')));
      expect(result.endsWith(':146')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250047 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyV250048
     * @tc.number SUB_RESMGR_UTILS25_0048
     * @tc.desc   资源 id 147 拼出的键为 bundle:module:id
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyV250048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250048 begin');
      const result: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 147 });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:entry:147'));
      expect(result).assertEqual('ohos.samples.resourcemanager:entry:147');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':147')));
      expect(result.endsWith(':147')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250048 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyV250049
     * @tc.number SUB_RESMGR_UTILS25_0049
     * @tc.desc   资源 id 148 拼出的键为 bundle:module:id
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyV250049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250049 begin');
      const result: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 148 });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:entry:148'));
      expect(result).assertEqual('ohos.samples.resourcemanager:entry:148');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':148')));
      expect(result.endsWith(':148')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250049 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyV250050
     * @tc.number SUB_RESMGR_UTILS25_0050
     * @tc.desc   资源 id 149 拼出的键为 bundle:module:id
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyV250050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250050 begin');
      const result: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 149 });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:entry:149'));
      expect(result).assertEqual('ohos.samples.resourcemanager:entry:149');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':149')));
      expect(result.endsWith(':149')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250050 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyV250051
     * @tc.number SUB_RESMGR_UTILS25_0051
     * @tc.desc   资源 id 150 拼出的键为 bundle:module:id
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyV250051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250051 begin');
      const result: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 150 });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:entry:150'));
      expect(result).assertEqual('ohos.samples.resourcemanager:entry:150');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':150')));
      expect(result.endsWith(':150')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250051 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyV250052
     * @tc.number SUB_RESMGR_UTILS25_0052
     * @tc.desc   资源 id 151 拼出的键为 bundle:module:id
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyV250052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250052 begin');
      const result: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 151 });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:entry:151'));
      expect(result).assertEqual('ohos.samples.resourcemanager:entry:151');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':151')));
      expect(result.endsWith(':151')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250052 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyV250053
     * @tc.number SUB_RESMGR_UTILS25_0053
     * @tc.desc   资源 id 152 拼出的键为 bundle:module:id
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyV250053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250053 begin');
      const result: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 152 });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:entry:152'));
      expect(result).assertEqual('ohos.samples.resourcemanager:entry:152');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':152')));
      expect(result.endsWith(':152')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250053 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyV250054
     * @tc.number SUB_RESMGR_UTILS25_0054
     * @tc.desc   资源 id 153 拼出的键为 bundle:module:id
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyV250054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250054 begin');
      const result: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 153 });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:entry:153'));
      expect(result).assertEqual('ohos.samples.resourcemanager:entry:153');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':153')));
      expect(result.endsWith(':153')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250054 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyV250055
     * @tc.number SUB_RESMGR_UTILS25_0055
     * @tc.desc   资源 id 154 拼出的键为 bundle:module:id
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyV250055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250055 begin');
      const result: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 154 });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:entry:154'));
      expect(result).assertEqual('ohos.samples.resourcemanager:entry:154');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':154')));
      expect(result.endsWith(':154')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250055 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyV250056
     * @tc.number SUB_RESMGR_UTILS25_0056
     * @tc.desc   资源 id 155 拼出的键为 bundle:module:id
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyV250056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250056 begin');
      const result: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 155 });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:entry:155'));
      expect(result).assertEqual('ohos.samples.resourcemanager:entry:155');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':155')));
      expect(result.endsWith(':155')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250056 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyV250057
     * @tc.number SUB_RESMGR_UTILS25_0057
     * @tc.desc   资源 id 156 拼出的键为 bundle:module:id
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyV250057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250057 begin');
      const result: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 156 });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:entry:156'));
      expect(result).assertEqual('ohos.samples.resourcemanager:entry:156');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':156')));
      expect(result.endsWith(':156')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250057 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyV250058
     * @tc.number SUB_RESMGR_UTILS25_0058
     * @tc.desc   资源 id 157 拼出的键为 bundle:module:id
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyV250058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250058 begin');
      const result: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 157 });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:entry:157'));
      expect(result).assertEqual('ohos.samples.resourcemanager:entry:157');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':157')));
      expect(result.endsWith(':157')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250058 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyV250059
     * @tc.number SUB_RESMGR_UTILS25_0059
     * @tc.desc   资源 id 158 拼出的键为 bundle:module:id
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyV250059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250059 begin');
      const result: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 158 });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:entry:158'));
      expect(result).assertEqual('ohos.samples.resourcemanager:entry:158');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':158')));
      expect(result.endsWith(':158')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250059 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyV250060
     * @tc.number SUB_RESMGR_UTILS25_0060
     * @tc.desc   资源 id 159 拼出的键为 bundle:module:id
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyV250060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250060 begin');
      const result: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 159 });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:entry:159'));
      expect(result).assertEqual('ohos.samples.resourcemanager:entry:159');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':159')));
      expect(result.endsWith(':159')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250060 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyV250061
     * @tc.number SUB_RESMGR_UTILS25_0061
     * @tc.desc   资源 id 160 拼出的键为 bundle:module:id
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyV250061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250061 begin');
      const result: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 160 });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:entry:160'));
      expect(result).assertEqual('ohos.samples.resourcemanager:entry:160');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':160')));
      expect(result.endsWith(':160')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250061 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyV250062
     * @tc.number SUB_RESMGR_UTILS25_0062
     * @tc.desc   资源 id 161 拼出的键为 bundle:module:id
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyV250062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250062 begin');
      const result: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 161 });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:entry:161'));
      expect(result).assertEqual('ohos.samples.resourcemanager:entry:161');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':161')));
      expect(result.endsWith(':161')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250062 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyV250063
     * @tc.number SUB_RESMGR_UTILS25_0063
     * @tc.desc   资源 id 162 拼出的键为 bundle:module:id
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyV250063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250063 begin');
      const result: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 162 });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:entry:162'));
      expect(result).assertEqual('ohos.samples.resourcemanager:entry:162');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':162')));
      expect(result.endsWith(':162')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250063 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyV250064
     * @tc.number SUB_RESMGR_UTILS25_0064
     * @tc.desc   资源 id 163 拼出的键为 bundle:module:id
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyV250064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250064 begin');
      const result: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 163 });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:entry:163'));
      expect(result).assertEqual('ohos.samples.resourcemanager:entry:163');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':163')));
      expect(result.endsWith(':163')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250064 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyV250065
     * @tc.number SUB_RESMGR_UTILS25_0065
     * @tc.desc   资源 id 164 拼出的键为 bundle:module:id
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyV250065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250065 begin');
      const result: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 164 });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:entry:164'));
      expect(result).assertEqual('ohos.samples.resourcemanager:entry:164');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':164')));
      expect(result.endsWith(':164')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250065 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyV250066
     * @tc.number SUB_RESMGR_UTILS25_0066
     * @tc.desc   资源 id 165 拼出的键为 bundle:module:id
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyV250066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250066 begin');
      const result: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 165 });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:entry:165'));
      expect(result).assertEqual('ohos.samples.resourcemanager:entry:165');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':165')));
      expect(result.endsWith(':165')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250066 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyV250067
     * @tc.number SUB_RESMGR_UTILS25_0067
     * @tc.desc   资源 id 166 拼出的键为 bundle:module:id
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyV250067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250067 begin');
      const result: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 166 });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:entry:166'));
      expect(result).assertEqual('ohos.samples.resourcemanager:entry:166');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':166')));
      expect(result.endsWith(':166')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250067 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyV250068
     * @tc.number SUB_RESMGR_UTILS25_0068
     * @tc.desc   资源 id 167 拼出的键为 bundle:module:id
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyV250068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250068 begin');
      const result: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 167 });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:entry:167'));
      expect(result).assertEqual('ohos.samples.resourcemanager:entry:167');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':167')));
      expect(result.endsWith(':167')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250068 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyV250069
     * @tc.number SUB_RESMGR_UTILS25_0069
     * @tc.desc   资源 id 168 拼出的键为 bundle:module:id
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyV250069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250069 begin');
      const result: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 168 });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:entry:168'));
      expect(result).assertEqual('ohos.samples.resourcemanager:entry:168');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':168')));
      expect(result.endsWith(':168')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250069 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyV250070
     * @tc.number SUB_RESMGR_UTILS25_0070
     * @tc.desc   资源 id 169 拼出的键为 bundle:module:id
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyV250070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250070 begin');
      const result: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 169 });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:entry:169'));
      expect(result).assertEqual('ohos.samples.resourcemanager:entry:169');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':169')));
      expect(result.endsWith(':169')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250070 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyV250071
     * @tc.number SUB_RESMGR_UTILS25_0071
     * @tc.desc   资源 id 170 拼出的键为 bundle:module:id
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyV250071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250071 begin');
      const result: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 170 });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:entry:170'));
      expect(result).assertEqual('ohos.samples.resourcemanager:entry:170');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':170')));
      expect(result.endsWith(':170')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250071 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyV250072
     * @tc.number SUB_RESMGR_UTILS25_0072
     * @tc.desc   资源 id 171 拼出的键为 bundle:module:id
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyV250072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250072 begin');
      const result: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 171 });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:entry:171'));
      expect(result).assertEqual('ohos.samples.resourcemanager:entry:171');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':171')));
      expect(result.endsWith(':171')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250072 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyV250073
     * @tc.number SUB_RESMGR_UTILS25_0073
     * @tc.desc   资源 id 172 拼出的键为 bundle:module:id
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyV250073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250073 begin');
      const result: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 172 });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:entry:172'));
      expect(result).assertEqual('ohos.samples.resourcemanager:entry:172');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':172')));
      expect(result.endsWith(':172')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250073 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyV250074
     * @tc.number SUB_RESMGR_UTILS25_0074
     * @tc.desc   资源 id 173 拼出的键为 bundle:module:id
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyV250074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250074 begin');
      const result: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 173 });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:entry:173'));
      expect(result).assertEqual('ohos.samples.resourcemanager:entry:173');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':173')));
      expect(result.endsWith(':173')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250074 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyV250075
     * @tc.number SUB_RESMGR_UTILS25_0075
     * @tc.desc   资源 id 174 拼出的键为 bundle:module:id
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyV250075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250075 begin');
      const result: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 174 });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:entry:174'));
      expect(result).assertEqual('ohos.samples.resourcemanager:entry:174');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':174')));
      expect(result.endsWith(':174')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250075 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyV250076
     * @tc.number SUB_RESMGR_UTILS25_0076
     * @tc.desc   资源 id 175 拼出的键为 bundle:module:id
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyV250076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250076 begin');
      const result: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 175 });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:entry:175'));
      expect(result).assertEqual('ohos.samples.resourcemanager:entry:175');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':175')));
      expect(result.endsWith(':175')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250076 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyV250077
     * @tc.number SUB_RESMGR_UTILS25_0077
     * @tc.desc   资源 id 176 拼出的键为 bundle:module:id
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyV250077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250077 begin');
      const result: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 176 });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:entry:176'));
      expect(result).assertEqual('ohos.samples.resourcemanager:entry:176');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':176')));
      expect(result.endsWith(':176')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250077 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyV250078
     * @tc.number SUB_RESMGR_UTILS25_0078
     * @tc.desc   资源 id 177 拼出的键为 bundle:module:id
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyV250078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250078 begin');
      const result: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 177 });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:entry:177'));
      expect(result).assertEqual('ohos.samples.resourcemanager:entry:177');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':177')));
      expect(result.endsWith(':177')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250078 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyV250079
     * @tc.number SUB_RESMGR_UTILS25_0079
     * @tc.desc   资源 id 178 拼出的键为 bundle:module:id
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyV250079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250079 begin');
      const result: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 178 });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:entry:178'));
      expect(result).assertEqual('ohos.samples.resourcemanager:entry:178');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':178')));
      expect(result.endsWith(':178')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250079 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyV250080
     * @tc.number SUB_RESMGR_UTILS25_0080
     * @tc.desc   资源 id 179 拼出的键为 bundle:module:id
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyV250080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250080 begin');
      const result: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 179 });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:entry:179'));
      expect(result).assertEqual('ohos.samples.resourcemanager:entry:179');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':179')));
      expect(result.endsWith(':179')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250080 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyV250081
     * @tc.number SUB_RESMGR_UTILS25_0081
     * @tc.desc   资源 id 180 拼出的键为 bundle:module:id
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyV250081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250081 begin');
      const result: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 180 });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:entry:180'));
      expect(result).assertEqual('ohos.samples.resourcemanager:entry:180');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':180')));
      expect(result.endsWith(':180')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250081 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyV250082
     * @tc.number SUB_RESMGR_UTILS25_0082
     * @tc.desc   资源 id 181 拼出的键为 bundle:module:id
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyV250082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250082 begin');
      const result: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 181 });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:entry:181'));
      expect(result).assertEqual('ohos.samples.resourcemanager:entry:181');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':181')));
      expect(result.endsWith(':181')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250082 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyV250083
     * @tc.number SUB_RESMGR_UTILS25_0083
     * @tc.desc   资源 id 182 拼出的键为 bundle:module:id
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyV250083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250083 begin');
      const result: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 182 });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:entry:182'));
      expect(result).assertEqual('ohos.samples.resourcemanager:entry:182');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':182')));
      expect(result.endsWith(':182')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250083 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyV250084
     * @tc.number SUB_RESMGR_UTILS25_0084
     * @tc.desc   资源 id 183 拼出的键为 bundle:module:id
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyV250084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250084 begin');
      const result: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 183 });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:entry:183'));
      expect(result).assertEqual('ohos.samples.resourcemanager:entry:183');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':183')));
      expect(result.endsWith(':183')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250084 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyV250085
     * @tc.number SUB_RESMGR_UTILS25_0085
     * @tc.desc   资源 id 184 拼出的键为 bundle:module:id
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyV250085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250085 begin');
      const result: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 184 });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:entry:184'));
      expect(result).assertEqual('ohos.samples.resourcemanager:entry:184');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':184')));
      expect(result.endsWith(':184')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250085 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyV250086
     * @tc.number SUB_RESMGR_UTILS25_0086
     * @tc.desc   资源 id 185 拼出的键为 bundle:module:id
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyV250086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250086 begin');
      const result: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 185 });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:entry:185'));
      expect(result).assertEqual('ohos.samples.resourcemanager:entry:185');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':185')));
      expect(result.endsWith(':185')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250086 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyV250087
     * @tc.number SUB_RESMGR_UTILS25_0087
     * @tc.desc   资源 id 186 拼出的键为 bundle:module:id
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyV250087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250087 begin');
      const result: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 186 });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:entry:186'));
      expect(result).assertEqual('ohos.samples.resourcemanager:entry:186');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':186')));
      expect(result.endsWith(':186')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250087 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyV250088
     * @tc.number SUB_RESMGR_UTILS25_0088
     * @tc.desc   资源 id 187 拼出的键为 bundle:module:id
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyV250088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250088 begin');
      const result: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 187 });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:entry:187'));
      expect(result).assertEqual('ohos.samples.resourcemanager:entry:187');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':187')));
      expect(result.endsWith(':187')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250088 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyV250089
     * @tc.number SUB_RESMGR_UTILS25_0089
     * @tc.desc   资源 id 188 拼出的键为 bundle:module:id
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyV250089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250089 begin');
      const result: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 188 });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:entry:188'));
      expect(result).assertEqual('ohos.samples.resourcemanager:entry:188');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':188')));
      expect(result.endsWith(':188')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250089 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyV250090
     * @tc.number SUB_RESMGR_UTILS25_0090
     * @tc.desc   资源 id 189 拼出的键为 bundle:module:id
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyV250090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250090 begin');
      const result: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 189 });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:entry:189'));
      expect(result).assertEqual('ohos.samples.resourcemanager:entry:189');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':189')));
      expect(result.endsWith(':189')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250090 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyV250091
     * @tc.number SUB_RESMGR_UTILS25_0091
     * @tc.desc   资源 id 190 拼出的键为 bundle:module:id
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyV250091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250091 begin');
      const result: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 190 });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:entry:190'));
      expect(result).assertEqual('ohos.samples.resourcemanager:entry:190');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':190')));
      expect(result.endsWith(':190')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250091 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyV250092
     * @tc.number SUB_RESMGR_UTILS25_0092
     * @tc.desc   资源 id 191 拼出的键为 bundle:module:id
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyV250092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250092 begin');
      const result: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 191 });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:entry:191'));
      expect(result).assertEqual('ohos.samples.resourcemanager:entry:191');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':191')));
      expect(result.endsWith(':191')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250092 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyV250093
     * @tc.number SUB_RESMGR_UTILS25_0093
     * @tc.desc   资源 id 192 拼出的键为 bundle:module:id
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyV250093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250093 begin');
      const result: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 192 });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:entry:192'));
      expect(result).assertEqual('ohos.samples.resourcemanager:entry:192');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':192')));
      expect(result.endsWith(':192')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250093 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyV250094
     * @tc.number SUB_RESMGR_UTILS25_0094
     * @tc.desc   资源 id 193 拼出的键为 bundle:module:id
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyV250094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250094 begin');
      const result: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 193 });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:entry:193'));
      expect(result).assertEqual('ohos.samples.resourcemanager:entry:193');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':193')));
      expect(result.endsWith(':193')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250094 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyV250095
     * @tc.number SUB_RESMGR_UTILS25_0095
     * @tc.desc   资源 id 194 拼出的键为 bundle:module:id
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyV250095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250095 begin');
      const result: string = ResourceUtils.resourceKey({ bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 194 });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:entry:194'));
      expect(result).assertEqual('ohos.samples.resourcemanager:entry:194');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.split(':').length), String(3));
      expect(result.split(':').length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':194')));
      expect(result.endsWith(':194')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250095 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyV250096
     * @tc.number SUB_RESMGR_UTILS25_0096
     * @tc.desc   缺字段用短横占位，同一三元组判定为同一资源，id 不同则不同
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyV250096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250096 begin');
      const left: string = ResourceUtils.resourceKey({ bundleName: 'b', moduleName: 'm', id: 5 });
      const missing: string = ResourceUtils.resourceKey({ bundleName: '', moduleName: '', id: 0 });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s/%{public}s expected=b:m:5/-:-:0', left, missing);
      expect(left).assertEqual('b:m:5');
      expect(missing).assertEqual('-:-:0');
      expect(ResourceUtils.isSameResource({ bundleName: 'b', moduleName: 'm', id: 5 },
        { bundleName: 'b', moduleName: 'm', id: 5 })).assertTrue();
      expect(ResourceUtils.isSameResource({ bundleName: 'b', moduleName: 'm', id: 5 },
        { bundleName: 'b', moduleName: 'm', id: 6 })).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyV250096 end');
    })
  })
}
