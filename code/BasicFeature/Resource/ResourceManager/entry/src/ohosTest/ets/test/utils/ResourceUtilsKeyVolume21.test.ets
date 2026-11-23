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

export default function resourceUtilsKeyB21Test() {
  describe('ResourceUtilsKeyB21Test', () => {

    /**
     * @tc.name   testResourceUtilsKeyB210001
     * @tc.number SUB_RESMGR_UTILS_21_0001
     * @tc.desc   resourceKey of ohos.samples.other/libraryOverlay id 10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB210001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210001 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'ohos.samples.other',
        moduleName: 'libraryOverlay', id: 10});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.other:libraryOverlay:10'));
      expect(result).assertEqual('ohos.samples.other:libraryOverlay:10');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(10))));
      expect(result.endsWith(':' + String(10))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210001 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB210002
     * @tc.number SUB_RESMGR_UTILS_21_0002
     * @tc.desc   resourceKey of x/entry id 47
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB210002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210002 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'x', moduleName: 'entry', id: 47});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('x:entry:47'));
      expect(result).assertEqual('x:entry:47');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(47))));
      expect(result.endsWith(':' + String(47))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210002 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB210003
     * @tc.number SUB_RESMGR_UTILS_21_0003
     * @tc.desc   resourceKey of ohos.samples.resourcemanager/libraryOverlay id 84
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB210003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210003 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'libraryOverlay', id: 84});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:libraryOverlay:84'));
      expect(result).assertEqual('ohos.samples.resourcemanager:libraryOverlay:84');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(84))));
      expect(result.endsWith(':' + String(84))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210003 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB210004
     * @tc.number SUB_RESMGR_UTILS_21_0004
     * @tc.desc   resourceKey of ohos.samples.other/entry id 121
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB210004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210004 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'ohos.samples.other', moduleName: 'entry',
        id: 121});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.other:entry:121'));
      expect(result).assertEqual('ohos.samples.other:entry:121');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(121))));
      expect(result.endsWith(':' + String(121))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210004 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB210005
     * @tc.number SUB_RESMGR_UTILS_21_0005
     * @tc.desc   resourceKey of x/libraryOverlay id 158
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB210005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210005 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'x', moduleName: 'libraryOverlay', id: 158});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('x:libraryOverlay:158'));
      expect(result).assertEqual('x:libraryOverlay:158');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(158))));
      expect(result.endsWith(':' + String(158))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210005 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB210006
     * @tc.number SUB_RESMGR_UTILS_21_0006
     * @tc.desc   resourceKey of ohos.samples.resourcemanager/entry id 195
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB210006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210006 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 195});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:entry:195'));
      expect(result).assertEqual('ohos.samples.resourcemanager:entry:195');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(195))));
      expect(result.endsWith(':' + String(195))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210006 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB210007
     * @tc.number SUB_RESMGR_UTILS_21_0007
     * @tc.desc   resourceKey of ohos.samples.other/libraryOverlay id 232
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB210007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210007 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'ohos.samples.other',
        moduleName: 'libraryOverlay', id: 232});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.other:libraryOverlay:232'));
      expect(result).assertEqual('ohos.samples.other:libraryOverlay:232');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(232))));
      expect(result.endsWith(':' + String(232))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210007 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB210008
     * @tc.number SUB_RESMGR_UTILS_21_0008
     * @tc.desc   resourceKey of x/entry id 269
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB210008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210008 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'x', moduleName: 'entry', id: 269});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('x:entry:269'));
      expect(result).assertEqual('x:entry:269');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(269))));
      expect(result.endsWith(':' + String(269))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210008 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB210009
     * @tc.number SUB_RESMGR_UTILS_21_0009
     * @tc.desc   resourceKey of ohos.samples.resourcemanager/libraryOverlay id 306
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB210009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210009 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'libraryOverlay', id: 306});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:libraryOverlay:306'));
      expect(result).assertEqual('ohos.samples.resourcemanager:libraryOverlay:306');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(306))));
      expect(result.endsWith(':' + String(306))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210009 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB210010
     * @tc.number SUB_RESMGR_UTILS_21_0010
     * @tc.desc   resourceKey of ohos.samples.other/entry id 343
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB210010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210010 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'ohos.samples.other', moduleName: 'entry',
        id: 343});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.other:entry:343'));
      expect(result).assertEqual('ohos.samples.other:entry:343');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(343))));
      expect(result.endsWith(':' + String(343))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210010 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB210011
     * @tc.number SUB_RESMGR_UTILS_21_0011
     * @tc.desc   resourceKey of x/libraryOverlay id 380
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB210011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210011 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'x', moduleName: 'libraryOverlay', id: 380});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('x:libraryOverlay:380'));
      expect(result).assertEqual('x:libraryOverlay:380');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(380))));
      expect(result.endsWith(':' + String(380))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210011 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB210012
     * @tc.number SUB_RESMGR_UTILS_21_0012
     * @tc.desc   resourceKey of ohos.samples.resourcemanager/entry id 417
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB210012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210012 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 417});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:entry:417'));
      expect(result).assertEqual('ohos.samples.resourcemanager:entry:417');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(417))));
      expect(result.endsWith(':' + String(417))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210012 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB210013
     * @tc.number SUB_RESMGR_UTILS_21_0013
     * @tc.desc   resourceKey of ohos.samples.other/libraryOverlay id 454
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB210013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210013 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'ohos.samples.other',
        moduleName: 'libraryOverlay', id: 454});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.other:libraryOverlay:454'));
      expect(result).assertEqual('ohos.samples.other:libraryOverlay:454');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(454))));
      expect(result.endsWith(':' + String(454))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210013 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB210014
     * @tc.number SUB_RESMGR_UTILS_21_0014
     * @tc.desc   resourceKey of x/entry id 491
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB210014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210014 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'x', moduleName: 'entry', id: 491});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('x:entry:491'));
      expect(result).assertEqual('x:entry:491');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(491))));
      expect(result.endsWith(':' + String(491))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210014 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB210015
     * @tc.number SUB_RESMGR_UTILS_21_0015
     * @tc.desc   resourceKey of ohos.samples.resourcemanager/libraryOverlay id 528
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB210015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210015 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'libraryOverlay', id: 528});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:libraryOverlay:528'));
      expect(result).assertEqual('ohos.samples.resourcemanager:libraryOverlay:528');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(528))));
      expect(result.endsWith(':' + String(528))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210015 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB210016
     * @tc.number SUB_RESMGR_UTILS_21_0016
     * @tc.desc   resourceKey of ohos.samples.other/entry id 565
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB210016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210016 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'ohos.samples.other', moduleName: 'entry',
        id: 565});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.other:entry:565'));
      expect(result).assertEqual('ohos.samples.other:entry:565');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(565))));
      expect(result.endsWith(':' + String(565))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210016 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB210017
     * @tc.number SUB_RESMGR_UTILS_21_0017
     * @tc.desc   resourceKey of x/libraryOverlay id 602
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB210017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210017 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'x', moduleName: 'libraryOverlay', id: 602});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('x:libraryOverlay:602'));
      expect(result).assertEqual('x:libraryOverlay:602');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(602))));
      expect(result.endsWith(':' + String(602))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210017 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB210018
     * @tc.number SUB_RESMGR_UTILS_21_0018
     * @tc.desc   resourceKey of ohos.samples.resourcemanager/entry id 639
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB210018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210018 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 639});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:entry:639'));
      expect(result).assertEqual('ohos.samples.resourcemanager:entry:639');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(639))));
      expect(result.endsWith(':' + String(639))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210018 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB210019
     * @tc.number SUB_RESMGR_UTILS_21_0019
     * @tc.desc   resourceKey of ohos.samples.other/libraryOverlay id 676
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB210019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210019 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'ohos.samples.other',
        moduleName: 'libraryOverlay', id: 676});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.other:libraryOverlay:676'));
      expect(result).assertEqual('ohos.samples.other:libraryOverlay:676');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(676))));
      expect(result.endsWith(':' + String(676))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210019 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB210020
     * @tc.number SUB_RESMGR_UTILS_21_0020
     * @tc.desc   resourceKey of x/entry id 713
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB210020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210020 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'x', moduleName: 'entry', id: 713});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('x:entry:713'));
      expect(result).assertEqual('x:entry:713');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(713))));
      expect(result.endsWith(':' + String(713))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210020 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB210021
     * @tc.number SUB_RESMGR_UTILS_21_0021
     * @tc.desc   resourceKey of ohos.samples.resourcemanager/libraryOverlay id 750
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB210021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210021 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'libraryOverlay', id: 750});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:libraryOverlay:750'));
      expect(result).assertEqual('ohos.samples.resourcemanager:libraryOverlay:750');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(750))));
      expect(result.endsWith(':' + String(750))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210021 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB210022
     * @tc.number SUB_RESMGR_UTILS_21_0022
     * @tc.desc   resourceKey of ohos.samples.other/entry id 787
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB210022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210022 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'ohos.samples.other', moduleName: 'entry',
        id: 787});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.other:entry:787'));
      expect(result).assertEqual('ohos.samples.other:entry:787');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(787))));
      expect(result.endsWith(':' + String(787))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210022 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB210023
     * @tc.number SUB_RESMGR_UTILS_21_0023
     * @tc.desc   resourceKey of x/libraryOverlay id 824
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB210023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210023 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'x', moduleName: 'libraryOverlay', id: 824});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('x:libraryOverlay:824'));
      expect(result).assertEqual('x:libraryOverlay:824');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(824))));
      expect(result.endsWith(':' + String(824))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210023 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB210024
     * @tc.number SUB_RESMGR_UTILS_21_0024
     * @tc.desc   resourceKey of ohos.samples.resourcemanager/entry id 861
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB210024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210024 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 861});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:entry:861'));
      expect(result).assertEqual('ohos.samples.resourcemanager:entry:861');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(861))));
      expect(result.endsWith(':' + String(861))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210024 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB210025
     * @tc.number SUB_RESMGR_UTILS_21_0025
     * @tc.desc   resourceKey of ohos.samples.other/libraryOverlay id 898
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB210025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210025 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'ohos.samples.other',
        moduleName: 'libraryOverlay', id: 898});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.other:libraryOverlay:898'));
      expect(result).assertEqual('ohos.samples.other:libraryOverlay:898');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(898))));
      expect(result.endsWith(':' + String(898))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210025 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB210026
     * @tc.number SUB_RESMGR_UTILS_21_0026
     * @tc.desc   resourceKey of x/entry id 935
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB210026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210026 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'x', moduleName: 'entry', id: 935});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('x:entry:935'));
      expect(result).assertEqual('x:entry:935');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(935))));
      expect(result.endsWith(':' + String(935))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210026 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB210027
     * @tc.number SUB_RESMGR_UTILS_21_0027
     * @tc.desc   resourceKey of ohos.samples.resourcemanager/libraryOverlay id 972
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB210027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210027 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'libraryOverlay', id: 972});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:libraryOverlay:972'));
      expect(result).assertEqual('ohos.samples.resourcemanager:libraryOverlay:972');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(972))));
      expect(result.endsWith(':' + String(972))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210027 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB210028
     * @tc.number SUB_RESMGR_UTILS_21_0028
     * @tc.desc   resourceKey of ohos.samples.other/entry id 1009
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB210028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210028 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'ohos.samples.other', moduleName: 'entry',
        id: 1009});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.other:entry:1009'));
      expect(result).assertEqual('ohos.samples.other:entry:1009');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(1009))));
      expect(result.endsWith(':' + String(1009))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210028 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB210029
     * @tc.number SUB_RESMGR_UTILS_21_0029
     * @tc.desc   resourceKey of x/libraryOverlay id 1046
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB210029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210029 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'x', moduleName: 'libraryOverlay', id: 1046});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('x:libraryOverlay:1046'));
      expect(result).assertEqual('x:libraryOverlay:1046');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(1046))));
      expect(result.endsWith(':' + String(1046))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210029 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB210030
     * @tc.number SUB_RESMGR_UTILS_21_0030
     * @tc.desc   resourceKey of ohos.samples.resourcemanager/entry id 1083
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB210030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210030 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 1083});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:entry:1083'));
      expect(result).assertEqual('ohos.samples.resourcemanager:entry:1083');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(1083))));
      expect(result.endsWith(':' + String(1083))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210030 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB210031
     * @tc.number SUB_RESMGR_UTILS_21_0031
     * @tc.desc   resourceKey of ohos.samples.other/libraryOverlay id 1120
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB210031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210031 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'ohos.samples.other',
        moduleName: 'libraryOverlay', id: 1120});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.other:libraryOverlay:1120'));
      expect(result).assertEqual('ohos.samples.other:libraryOverlay:1120');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(1120))));
      expect(result.endsWith(':' + String(1120))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210031 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB210032
     * @tc.number SUB_RESMGR_UTILS_21_0032
     * @tc.desc   resourceKey of x/entry id 1157
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB210032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210032 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'x', moduleName: 'entry', id: 1157});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('x:entry:1157'));
      expect(result).assertEqual('x:entry:1157');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(1157))));
      expect(result.endsWith(':' + String(1157))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210032 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB210033
     * @tc.number SUB_RESMGR_UTILS_21_0033
     * @tc.desc   resourceKey of ohos.samples.resourcemanager/libraryOverlay id 1194
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB210033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210033 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'libraryOverlay', id: 1194});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:libraryOverlay:1194'));
      expect(result).assertEqual('ohos.samples.resourcemanager:libraryOverlay:1194');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(1194))));
      expect(result.endsWith(':' + String(1194))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210033 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB210034
     * @tc.number SUB_RESMGR_UTILS_21_0034
     * @tc.desc   resourceKey of ohos.samples.other/entry id 1231
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB210034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210034 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'ohos.samples.other', moduleName: 'entry',
        id: 1231});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.other:entry:1231'));
      expect(result).assertEqual('ohos.samples.other:entry:1231');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(1231))));
      expect(result.endsWith(':' + String(1231))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210034 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB210035
     * @tc.number SUB_RESMGR_UTILS_21_0035
     * @tc.desc   resourceKey of x/libraryOverlay id 1268
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB210035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210035 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'x', moduleName: 'libraryOverlay', id: 1268});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('x:libraryOverlay:1268'));
      expect(result).assertEqual('x:libraryOverlay:1268');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(1268))));
      expect(result.endsWith(':' + String(1268))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210035 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB210036
     * @tc.number SUB_RESMGR_UTILS_21_0036
     * @tc.desc   resourceKey of ohos.samples.resourcemanager/entry id 1305
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB210036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210036 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 1305});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:entry:1305'));
      expect(result).assertEqual('ohos.samples.resourcemanager:entry:1305');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(1305))));
      expect(result.endsWith(':' + String(1305))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210036 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB210037
     * @tc.number SUB_RESMGR_UTILS_21_0037
     * @tc.desc   resourceKey of ohos.samples.other/libraryOverlay id 1342
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB210037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210037 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'ohos.samples.other',
        moduleName: 'libraryOverlay', id: 1342});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.other:libraryOverlay:1342'));
      expect(result).assertEqual('ohos.samples.other:libraryOverlay:1342');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(1342))));
      expect(result.endsWith(':' + String(1342))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210037 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB210038
     * @tc.number SUB_RESMGR_UTILS_21_0038
     * @tc.desc   resourceKey of x/entry id 1379
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB210038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210038 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'x', moduleName: 'entry', id: 1379});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('x:entry:1379'));
      expect(result).assertEqual('x:entry:1379');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(1379))));
      expect(result.endsWith(':' + String(1379))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210038 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB210039
     * @tc.number SUB_RESMGR_UTILS_21_0039
     * @tc.desc   resourceKey of ohos.samples.resourcemanager/libraryOverlay id 1416
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB210039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210039 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'libraryOverlay', id: 1416});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:libraryOverlay:1416'));
      expect(result).assertEqual('ohos.samples.resourcemanager:libraryOverlay:1416');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(1416))));
      expect(result.endsWith(':' + String(1416))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210039 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB210040
     * @tc.number SUB_RESMGR_UTILS_21_0040
     * @tc.desc   resourceKey of ohos.samples.other/entry id 1453
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB210040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210040 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'ohos.samples.other', moduleName: 'entry',
        id: 1453});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.other:entry:1453'));
      expect(result).assertEqual('ohos.samples.other:entry:1453');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(1453))));
      expect(result.endsWith(':' + String(1453))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210040 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB210041
     * @tc.number SUB_RESMGR_UTILS_21_0041
     * @tc.desc   resourceKey of x/libraryOverlay id 1490
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB210041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210041 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'x', moduleName: 'libraryOverlay', id: 1490});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('x:libraryOverlay:1490'));
      expect(result).assertEqual('x:libraryOverlay:1490');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(1490))));
      expect(result.endsWith(':' + String(1490))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210041 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB210042
     * @tc.number SUB_RESMGR_UTILS_21_0042
     * @tc.desc   resourceKey of ohos.samples.resourcemanager/entry id 1527
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB210042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210042 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 1527});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:entry:1527'));
      expect(result).assertEqual('ohos.samples.resourcemanager:entry:1527');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(1527))));
      expect(result.endsWith(':' + String(1527))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210042 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB210043
     * @tc.number SUB_RESMGR_UTILS_21_0043
     * @tc.desc   resourceKey of ohos.samples.other/libraryOverlay id 1564
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB210043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210043 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'ohos.samples.other',
        moduleName: 'libraryOverlay', id: 1564});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.other:libraryOverlay:1564'));
      expect(result).assertEqual('ohos.samples.other:libraryOverlay:1564');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(1564))));
      expect(result.endsWith(':' + String(1564))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210043 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB210044
     * @tc.number SUB_RESMGR_UTILS_21_0044
     * @tc.desc   resourceKey of x/entry id 1601
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB210044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210044 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'x', moduleName: 'entry', id: 1601});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('x:entry:1601'));
      expect(result).assertEqual('x:entry:1601');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(1601))));
      expect(result.endsWith(':' + String(1601))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210044 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB210045
     * @tc.number SUB_RESMGR_UTILS_21_0045
     * @tc.desc   resourceKey of ohos.samples.resourcemanager/libraryOverlay id 1638
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB210045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210045 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'libraryOverlay', id: 1638});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:libraryOverlay:1638'));
      expect(result).assertEqual('ohos.samples.resourcemanager:libraryOverlay:1638');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(1638))));
      expect(result.endsWith(':' + String(1638))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210045 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB210046
     * @tc.number SUB_RESMGR_UTILS_21_0046
     * @tc.desc   resourceKey of ohos.samples.other/entry id 1675
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB210046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210046 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'ohos.samples.other', moduleName: 'entry',
        id: 1675});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.other:entry:1675'));
      expect(result).assertEqual('ohos.samples.other:entry:1675');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(1675))));
      expect(result.endsWith(':' + String(1675))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210046 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB210047
     * @tc.number SUB_RESMGR_UTILS_21_0047
     * @tc.desc   resourceKey of x/libraryOverlay id 1712
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB210047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210047 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'x', moduleName: 'libraryOverlay', id: 1712});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('x:libraryOverlay:1712'));
      expect(result).assertEqual('x:libraryOverlay:1712');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(1712))));
      expect(result.endsWith(':' + String(1712))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210047 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB210048
     * @tc.number SUB_RESMGR_UTILS_21_0048
     * @tc.desc   resourceKey of ohos.samples.resourcemanager/entry id 1749
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB210048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210048 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 1749});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:entry:1749'));
      expect(result).assertEqual('ohos.samples.resourcemanager:entry:1749');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(1749))));
      expect(result.endsWith(':' + String(1749))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210048 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB210049
     * @tc.number SUB_RESMGR_UTILS_21_0049
     * @tc.desc   resourceKey of ohos.samples.other/libraryOverlay id 1786
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB210049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210049 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'ohos.samples.other',
        moduleName: 'libraryOverlay', id: 1786});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.other:libraryOverlay:1786'));
      expect(result).assertEqual('ohos.samples.other:libraryOverlay:1786');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(1786))));
      expect(result.endsWith(':' + String(1786))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210049 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB210050
     * @tc.number SUB_RESMGR_UTILS_21_0050
     * @tc.desc   resourceKey of x/entry id 1823
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB210050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210050 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'x', moduleName: 'entry', id: 1823});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('x:entry:1823'));
      expect(result).assertEqual('x:entry:1823');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(1823))));
      expect(result.endsWith(':' + String(1823))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210050 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB210051
     * @tc.number SUB_RESMGR_UTILS_21_0051
     * @tc.desc   resourceKey of ohos.samples.resourcemanager/libraryOverlay id 1860
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB210051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210051 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'libraryOverlay', id: 1860});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:libraryOverlay:1860'));
      expect(result).assertEqual('ohos.samples.resourcemanager:libraryOverlay:1860');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(1860))));
      expect(result.endsWith(':' + String(1860))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210051 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB210052
     * @tc.number SUB_RESMGR_UTILS_21_0052
     * @tc.desc   resourceKey of ohos.samples.other/entry id 1897
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB210052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210052 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'ohos.samples.other', moduleName: 'entry',
        id: 1897});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.other:entry:1897'));
      expect(result).assertEqual('ohos.samples.other:entry:1897');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(1897))));
      expect(result.endsWith(':' + String(1897))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210052 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB210053
     * @tc.number SUB_RESMGR_UTILS_21_0053
     * @tc.desc   resourceKey of x/libraryOverlay id 1934
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB210053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210053 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'x', moduleName: 'libraryOverlay', id: 1934});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('x:libraryOverlay:1934'));
      expect(result).assertEqual('x:libraryOverlay:1934');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(1934))));
      expect(result.endsWith(':' + String(1934))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210053 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB210054
     * @tc.number SUB_RESMGR_UTILS_21_0054
     * @tc.desc   resourceKey of ohos.samples.resourcemanager/entry id 1971
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB210054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210054 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 1971});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:entry:1971'));
      expect(result).assertEqual('ohos.samples.resourcemanager:entry:1971');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(1971))));
      expect(result.endsWith(':' + String(1971))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210054 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB210055
     * @tc.number SUB_RESMGR_UTILS_21_0055
     * @tc.desc   resourceKey of ohos.samples.other/libraryOverlay id 2008
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB210055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210055 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'ohos.samples.other',
        moduleName: 'libraryOverlay', id: 2008});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.other:libraryOverlay:2008'));
      expect(result).assertEqual('ohos.samples.other:libraryOverlay:2008');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(2008))));
      expect(result.endsWith(':' + String(2008))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210055 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB210056
     * @tc.number SUB_RESMGR_UTILS_21_0056
     * @tc.desc   resourceKey of x/entry id 2045
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB210056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210056 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'x', moduleName: 'entry', id: 2045});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('x:entry:2045'));
      expect(result).assertEqual('x:entry:2045');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(2045))));
      expect(result.endsWith(':' + String(2045))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210056 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB210057
     * @tc.number SUB_RESMGR_UTILS_21_0057
     * @tc.desc   resourceKey of ohos.samples.resourcemanager/libraryOverlay id 2082
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB210057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210057 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'libraryOverlay', id: 2082});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:libraryOverlay:2082'));
      expect(result).assertEqual('ohos.samples.resourcemanager:libraryOverlay:2082');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(2082))));
      expect(result.endsWith(':' + String(2082))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210057 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB210058
     * @tc.number SUB_RESMGR_UTILS_21_0058
     * @tc.desc   resourceKey of ohos.samples.other/entry id 2119
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB210058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210058 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'ohos.samples.other', moduleName: 'entry',
        id: 2119});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.other:entry:2119'));
      expect(result).assertEqual('ohos.samples.other:entry:2119');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(2119))));
      expect(result.endsWith(':' + String(2119))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210058 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB210059
     * @tc.number SUB_RESMGR_UTILS_21_0059
     * @tc.desc   resourceKey of x/libraryOverlay id 2156
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB210059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210059 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'x', moduleName: 'libraryOverlay', id: 2156});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('x:libraryOverlay:2156'));
      expect(result).assertEqual('x:libraryOverlay:2156');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(2156))));
      expect(result.endsWith(':' + String(2156))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210059 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB210060
     * @tc.number SUB_RESMGR_UTILS_21_0060
     * @tc.desc   resourceKey of ohos.samples.resourcemanager/entry id 2193
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB210060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210060 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 2193});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:entry:2193'));
      expect(result).assertEqual('ohos.samples.resourcemanager:entry:2193');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(2193))));
      expect(result.endsWith(':' + String(2193))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210060 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB210061
     * @tc.number SUB_RESMGR_UTILS_21_0061
     * @tc.desc   resourceKey of ohos.samples.other/libraryOverlay id 2230
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB210061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210061 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'ohos.samples.other',
        moduleName: 'libraryOverlay', id: 2230});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.other:libraryOverlay:2230'));
      expect(result).assertEqual('ohos.samples.other:libraryOverlay:2230');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(2230))));
      expect(result.endsWith(':' + String(2230))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210061 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB210062
     * @tc.number SUB_RESMGR_UTILS_21_0062
     * @tc.desc   resourceKey of x/entry id 2267
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB210062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210062 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'x', moduleName: 'entry', id: 2267});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('x:entry:2267'));
      expect(result).assertEqual('x:entry:2267');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(2267))));
      expect(result.endsWith(':' + String(2267))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210062 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB210063
     * @tc.number SUB_RESMGR_UTILS_21_0063
     * @tc.desc   resourceKey of ohos.samples.resourcemanager/libraryOverlay id 2304
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB210063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210063 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'libraryOverlay', id: 2304});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:libraryOverlay:2304'));
      expect(result).assertEqual('ohos.samples.resourcemanager:libraryOverlay:2304');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(2304))));
      expect(result.endsWith(':' + String(2304))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210063 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB210064
     * @tc.number SUB_RESMGR_UTILS_21_0064
     * @tc.desc   resourceKey of ohos.samples.other/entry id 2341
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB210064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210064 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'ohos.samples.other', moduleName: 'entry',
        id: 2341});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.other:entry:2341'));
      expect(result).assertEqual('ohos.samples.other:entry:2341');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(2341))));
      expect(result.endsWith(':' + String(2341))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210064 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB210065
     * @tc.number SUB_RESMGR_UTILS_21_0065
     * @tc.desc   resourceKey of x/libraryOverlay id 2378
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB210065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210065 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'x', moduleName: 'libraryOverlay', id: 2378});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('x:libraryOverlay:2378'));
      expect(result).assertEqual('x:libraryOverlay:2378');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(2378))));
      expect(result.endsWith(':' + String(2378))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210065 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB210066
     * @tc.number SUB_RESMGR_UTILS_21_0066
     * @tc.desc   resourceKey of ohos.samples.resourcemanager/entry id 2415
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB210066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210066 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 2415});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:entry:2415'));
      expect(result).assertEqual('ohos.samples.resourcemanager:entry:2415');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(2415))));
      expect(result.endsWith(':' + String(2415))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210066 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB210067
     * @tc.number SUB_RESMGR_UTILS_21_0067
     * @tc.desc   resourceKey of ohos.samples.other/libraryOverlay id 2452
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB210067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210067 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'ohos.samples.other',
        moduleName: 'libraryOverlay', id: 2452});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.other:libraryOverlay:2452'));
      expect(result).assertEqual('ohos.samples.other:libraryOverlay:2452');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(2452))));
      expect(result.endsWith(':' + String(2452))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210067 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB210068
     * @tc.number SUB_RESMGR_UTILS_21_0068
     * @tc.desc   resourceKey of x/entry id 2489
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB210068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210068 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'x', moduleName: 'entry', id: 2489});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('x:entry:2489'));
      expect(result).assertEqual('x:entry:2489');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(2489))));
      expect(result.endsWith(':' + String(2489))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210068 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB210069
     * @tc.number SUB_RESMGR_UTILS_21_0069
     * @tc.desc   resourceKey of ohos.samples.resourcemanager/libraryOverlay id 2526
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB210069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210069 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'libraryOverlay', id: 2526});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:libraryOverlay:2526'));
      expect(result).assertEqual('ohos.samples.resourcemanager:libraryOverlay:2526');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(2526))));
      expect(result.endsWith(':' + String(2526))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210069 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB210070
     * @tc.number SUB_RESMGR_UTILS_21_0070
     * @tc.desc   resourceKey of ohos.samples.other/entry id 2563
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB210070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210070 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'ohos.samples.other', moduleName: 'entry',
        id: 2563});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.other:entry:2563'));
      expect(result).assertEqual('ohos.samples.other:entry:2563');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(2563))));
      expect(result.endsWith(':' + String(2563))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210070 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB210071
     * @tc.number SUB_RESMGR_UTILS_21_0071
     * @tc.desc   resourceKey of x/libraryOverlay id 2600
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB210071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210071 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'x', moduleName: 'libraryOverlay', id: 2600});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('x:libraryOverlay:2600'));
      expect(result).assertEqual('x:libraryOverlay:2600');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(2600))));
      expect(result.endsWith(':' + String(2600))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210071 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB210072
     * @tc.number SUB_RESMGR_UTILS_21_0072
     * @tc.desc   resourceKey of ohos.samples.resourcemanager/entry id 2637
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB210072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210072 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 2637});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:entry:2637'));
      expect(result).assertEqual('ohos.samples.resourcemanager:entry:2637');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(2637))));
      expect(result.endsWith(':' + String(2637))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210072 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB210073
     * @tc.number SUB_RESMGR_UTILS_21_0073
     * @tc.desc   resourceKey of ohos.samples.other/libraryOverlay id 2674
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB210073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210073 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'ohos.samples.other',
        moduleName: 'libraryOverlay', id: 2674});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.other:libraryOverlay:2674'));
      expect(result).assertEqual('ohos.samples.other:libraryOverlay:2674');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(2674))));
      expect(result.endsWith(':' + String(2674))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210073 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB210074
     * @tc.number SUB_RESMGR_UTILS_21_0074
     * @tc.desc   resourceKey of x/entry id 2711
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB210074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210074 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'x', moduleName: 'entry', id: 2711});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('x:entry:2711'));
      expect(result).assertEqual('x:entry:2711');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(2711))));
      expect(result.endsWith(':' + String(2711))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210074 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB210075
     * @tc.number SUB_RESMGR_UTILS_21_0075
     * @tc.desc   resourceKey of ohos.samples.resourcemanager/libraryOverlay id 2748
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB210075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210075 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'libraryOverlay', id: 2748});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:libraryOverlay:2748'));
      expect(result).assertEqual('ohos.samples.resourcemanager:libraryOverlay:2748');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(2748))));
      expect(result.endsWith(':' + String(2748))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210075 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB210076
     * @tc.number SUB_RESMGR_UTILS_21_0076
     * @tc.desc   resourceKey of ohos.samples.other/entry id 2785
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB210076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210076 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'ohos.samples.other', moduleName: 'entry',
        id: 2785});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.other:entry:2785'));
      expect(result).assertEqual('ohos.samples.other:entry:2785');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(2785))));
      expect(result.endsWith(':' + String(2785))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210076 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB210077
     * @tc.number SUB_RESMGR_UTILS_21_0077
     * @tc.desc   resourceKey of x/libraryOverlay id 2822
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB210077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210077 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'x', moduleName: 'libraryOverlay', id: 2822});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('x:libraryOverlay:2822'));
      expect(result).assertEqual('x:libraryOverlay:2822');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(2822))));
      expect(result.endsWith(':' + String(2822))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210077 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB210078
     * @tc.number SUB_RESMGR_UTILS_21_0078
     * @tc.desc   resourceKey of ohos.samples.resourcemanager/entry id 2859
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB210078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210078 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 2859});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:entry:2859'));
      expect(result).assertEqual('ohos.samples.resourcemanager:entry:2859');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(2859))));
      expect(result.endsWith(':' + String(2859))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210078 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB210079
     * @tc.number SUB_RESMGR_UTILS_21_0079
     * @tc.desc   resourceKey of ohos.samples.other/libraryOverlay id 2896
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB210079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210079 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'ohos.samples.other',
        moduleName: 'libraryOverlay', id: 2896});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.other:libraryOverlay:2896'));
      expect(result).assertEqual('ohos.samples.other:libraryOverlay:2896');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(2896))));
      expect(result.endsWith(':' + String(2896))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210079 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB210080
     * @tc.number SUB_RESMGR_UTILS_21_0080
     * @tc.desc   resourceKey of x/entry id 2933
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB210080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210080 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'x', moduleName: 'entry', id: 2933});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('x:entry:2933'));
      expect(result).assertEqual('x:entry:2933');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(2933))));
      expect(result.endsWith(':' + String(2933))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210080 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB210081
     * @tc.number SUB_RESMGR_UTILS_21_0081
     * @tc.desc   resourceKey of ohos.samples.resourcemanager/libraryOverlay id 2970
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB210081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210081 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'libraryOverlay', id: 2970});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:libraryOverlay:2970'));
      expect(result).assertEqual('ohos.samples.resourcemanager:libraryOverlay:2970');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(2970))));
      expect(result.endsWith(':' + String(2970))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210081 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB210082
     * @tc.number SUB_RESMGR_UTILS_21_0082
     * @tc.desc   resourceKey of ohos.samples.other/entry id 3007
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB210082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210082 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'ohos.samples.other', moduleName: 'entry',
        id: 3007});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.other:entry:3007'));
      expect(result).assertEqual('ohos.samples.other:entry:3007');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(3007))));
      expect(result.endsWith(':' + String(3007))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210082 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB210083
     * @tc.number SUB_RESMGR_UTILS_21_0083
     * @tc.desc   resourceKey of x/libraryOverlay id 3044
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB210083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210083 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'x', moduleName: 'libraryOverlay', id: 3044});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('x:libraryOverlay:3044'));
      expect(result).assertEqual('x:libraryOverlay:3044');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(3044))));
      expect(result.endsWith(':' + String(3044))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210083 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB210084
     * @tc.number SUB_RESMGR_UTILS_21_0084
     * @tc.desc   resourceKey of ohos.samples.resourcemanager/entry id 3081
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB210084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210084 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 3081});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:entry:3081'));
      expect(result).assertEqual('ohos.samples.resourcemanager:entry:3081');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(3081))));
      expect(result.endsWith(':' + String(3081))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210084 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB210085
     * @tc.number SUB_RESMGR_UTILS_21_0085
     * @tc.desc   resourceKey of ohos.samples.other/libraryOverlay id 3118
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB210085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210085 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'ohos.samples.other',
        moduleName: 'libraryOverlay', id: 3118});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.other:libraryOverlay:3118'));
      expect(result).assertEqual('ohos.samples.other:libraryOverlay:3118');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(3118))));
      expect(result.endsWith(':' + String(3118))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210085 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB210086
     * @tc.number SUB_RESMGR_UTILS_21_0086
     * @tc.desc   resourceKey of x/entry id 3155
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB210086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210086 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'x', moduleName: 'entry', id: 3155});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('x:entry:3155'));
      expect(result).assertEqual('x:entry:3155');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(3155))));
      expect(result.endsWith(':' + String(3155))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210086 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB210087
     * @tc.number SUB_RESMGR_UTILS_21_0087
     * @tc.desc   resourceKey of ohos.samples.resourcemanager/libraryOverlay id 3192
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB210087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210087 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'libraryOverlay', id: 3192});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:libraryOverlay:3192'));
      expect(result).assertEqual('ohos.samples.resourcemanager:libraryOverlay:3192');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(3192))));
      expect(result.endsWith(':' + String(3192))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210087 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB210088
     * @tc.number SUB_RESMGR_UTILS_21_0088
     * @tc.desc   resourceKey of ohos.samples.other/entry id 3229
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB210088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210088 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'ohos.samples.other', moduleName: 'entry',
        id: 3229});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.other:entry:3229'));
      expect(result).assertEqual('ohos.samples.other:entry:3229');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(3229))));
      expect(result.endsWith(':' + String(3229))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210088 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB210089
     * @tc.number SUB_RESMGR_UTILS_21_0089
     * @tc.desc   resourceKey of x/libraryOverlay id 3266
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB210089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210089 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'x', moduleName: 'libraryOverlay', id: 3266});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('x:libraryOverlay:3266'));
      expect(result).assertEqual('x:libraryOverlay:3266');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(3266))));
      expect(result.endsWith(':' + String(3266))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210089 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB210090
     * @tc.number SUB_RESMGR_UTILS_21_0090
     * @tc.desc   resourceKey of ohos.samples.resourcemanager/entry id 3303
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB210090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210090 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 3303});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:entry:3303'));
      expect(result).assertEqual('ohos.samples.resourcemanager:entry:3303');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(3303))));
      expect(result.endsWith(':' + String(3303))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210090 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB210091
     * @tc.number SUB_RESMGR_UTILS_21_0091
     * @tc.desc   resourceKey of ohos.samples.other/libraryOverlay id 3340
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB210091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210091 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'ohos.samples.other',
        moduleName: 'libraryOverlay', id: 3340});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.other:libraryOverlay:3340'));
      expect(result).assertEqual('ohos.samples.other:libraryOverlay:3340');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(3340))));
      expect(result.endsWith(':' + String(3340))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210091 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB210092
     * @tc.number SUB_RESMGR_UTILS_21_0092
     * @tc.desc   resourceKey of x/entry id 3377
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB210092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210092 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'x', moduleName: 'entry', id: 3377});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('x:entry:3377'));
      expect(result).assertEqual('x:entry:3377');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(3377))));
      expect(result.endsWith(':' + String(3377))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210092 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB210093
     * @tc.number SUB_RESMGR_UTILS_21_0093
     * @tc.desc   resourceKey of ohos.samples.resourcemanager/libraryOverlay id 3414
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB210093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210093 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'libraryOverlay', id: 3414});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:libraryOverlay:3414'));
      expect(result).assertEqual('ohos.samples.resourcemanager:libraryOverlay:3414');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(3414))));
      expect(result.endsWith(':' + String(3414))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210093 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB210094
     * @tc.number SUB_RESMGR_UTILS_21_0094
     * @tc.desc   resourceKey of ohos.samples.other/entry id 3451
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB210094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210094 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'ohos.samples.other', moduleName: 'entry',
        id: 3451});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.other:entry:3451'));
      expect(result).assertEqual('ohos.samples.other:entry:3451');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(3451))));
      expect(result.endsWith(':' + String(3451))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210094 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB210095
     * @tc.number SUB_RESMGR_UTILS_21_0095
     * @tc.desc   resourceKey of x/libraryOverlay id 3488
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB210095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210095 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'x', moduleName: 'libraryOverlay', id: 3488});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('x:libraryOverlay:3488'));
      expect(result).assertEqual('x:libraryOverlay:3488');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(3488))));
      expect(result.endsWith(':' + String(3488))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB210095 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB2196
     * @tc.number SUB_RESMGR_UTILS_21_0096
     * @tc.desc   空 bundle 与空 module 各自占位
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB2196', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB2196 begin');
      expect(ResourceUtils.resourceKey({ bundleName: '', moduleName: 'entry', id: 5 })).assertEqual('-:entry:5');
      expect(ResourceUtils.resourceKey({ bundleName: 'x', moduleName: '', id: 5 })).assertEqual('x:-:5');
      expect(ResourceUtils.resourceKey({ bundleName: '', moduleName: '', id: 5 })).assertEqual('-:-:5');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB2196 end');
    })
  })
}
