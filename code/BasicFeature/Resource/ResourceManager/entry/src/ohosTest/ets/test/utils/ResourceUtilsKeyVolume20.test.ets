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

export default function resourceUtilsKeyB20Test() {
  describe('ResourceUtilsKeyB20Test', () => {

    /**
     * @tc.name   testResourceUtilsKeyB200001
     * @tc.number SUB_RESMGR_UTILS_20_0001
     * @tc.desc   resourceKey of ohos.samples.resourcemanager/entry id 10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB200001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200001 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 10});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:entry:10'));
      expect(result).assertEqual('ohos.samples.resourcemanager:entry:10');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(10))));
      expect(result.endsWith(':' + String(10))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200001 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB200002
     * @tc.number SUB_RESMGR_UTILS_20_0002
     * @tc.desc   resourceKey of ohos.samples.other/libraryOverlay id 47
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB200002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200002 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'ohos.samples.other',
        moduleName: 'libraryOverlay', id: 47});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.other:libraryOverlay:47'));
      expect(result).assertEqual('ohos.samples.other:libraryOverlay:47');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(47))));
      expect(result.endsWith(':' + String(47))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200002 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB200003
     * @tc.number SUB_RESMGR_UTILS_20_0003
     * @tc.desc   resourceKey of x/entry id 84
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB200003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200003 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'x', moduleName: 'entry', id: 84});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('x:entry:84'));
      expect(result).assertEqual('x:entry:84');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(84))));
      expect(result.endsWith(':' + String(84))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200003 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB200004
     * @tc.number SUB_RESMGR_UTILS_20_0004
     * @tc.desc   resourceKey of ohos.samples.resourcemanager/libraryOverlay id 121
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB200004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200004 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'libraryOverlay', id: 121});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:libraryOverlay:121'));
      expect(result).assertEqual('ohos.samples.resourcemanager:libraryOverlay:121');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(121))));
      expect(result.endsWith(':' + String(121))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200004 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB200005
     * @tc.number SUB_RESMGR_UTILS_20_0005
     * @tc.desc   resourceKey of ohos.samples.other/entry id 158
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB200005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200005 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'ohos.samples.other', moduleName: 'entry',
        id: 158});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.other:entry:158'));
      expect(result).assertEqual('ohos.samples.other:entry:158');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(158))));
      expect(result.endsWith(':' + String(158))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200005 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB200006
     * @tc.number SUB_RESMGR_UTILS_20_0006
     * @tc.desc   resourceKey of x/libraryOverlay id 195
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB200006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200006 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'x', moduleName: 'libraryOverlay', id: 195});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('x:libraryOverlay:195'));
      expect(result).assertEqual('x:libraryOverlay:195');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(195))));
      expect(result.endsWith(':' + String(195))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200006 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB200007
     * @tc.number SUB_RESMGR_UTILS_20_0007
     * @tc.desc   resourceKey of ohos.samples.resourcemanager/entry id 232
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB200007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200007 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 232});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:entry:232'));
      expect(result).assertEqual('ohos.samples.resourcemanager:entry:232');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(232))));
      expect(result.endsWith(':' + String(232))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200007 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB200008
     * @tc.number SUB_RESMGR_UTILS_20_0008
     * @tc.desc   resourceKey of ohos.samples.other/libraryOverlay id 269
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB200008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200008 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'ohos.samples.other',
        moduleName: 'libraryOverlay', id: 269});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.other:libraryOverlay:269'));
      expect(result).assertEqual('ohos.samples.other:libraryOverlay:269');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(269))));
      expect(result.endsWith(':' + String(269))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200008 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB200009
     * @tc.number SUB_RESMGR_UTILS_20_0009
     * @tc.desc   resourceKey of x/entry id 306
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB200009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200009 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'x', moduleName: 'entry', id: 306});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('x:entry:306'));
      expect(result).assertEqual('x:entry:306');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(306))));
      expect(result.endsWith(':' + String(306))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200009 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB200010
     * @tc.number SUB_RESMGR_UTILS_20_0010
     * @tc.desc   resourceKey of ohos.samples.resourcemanager/libraryOverlay id 343
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB200010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200010 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'libraryOverlay', id: 343});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:libraryOverlay:343'));
      expect(result).assertEqual('ohos.samples.resourcemanager:libraryOverlay:343');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(343))));
      expect(result.endsWith(':' + String(343))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200010 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB200011
     * @tc.number SUB_RESMGR_UTILS_20_0011
     * @tc.desc   resourceKey of ohos.samples.other/entry id 380
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB200011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200011 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'ohos.samples.other', moduleName: 'entry',
        id: 380});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.other:entry:380'));
      expect(result).assertEqual('ohos.samples.other:entry:380');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(380))));
      expect(result.endsWith(':' + String(380))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200011 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB200012
     * @tc.number SUB_RESMGR_UTILS_20_0012
     * @tc.desc   resourceKey of x/libraryOverlay id 417
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB200012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200012 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'x', moduleName: 'libraryOverlay', id: 417});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('x:libraryOverlay:417'));
      expect(result).assertEqual('x:libraryOverlay:417');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(417))));
      expect(result.endsWith(':' + String(417))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200012 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB200013
     * @tc.number SUB_RESMGR_UTILS_20_0013
     * @tc.desc   resourceKey of ohos.samples.resourcemanager/entry id 454
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB200013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200013 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 454});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:entry:454'));
      expect(result).assertEqual('ohos.samples.resourcemanager:entry:454');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(454))));
      expect(result.endsWith(':' + String(454))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200013 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB200014
     * @tc.number SUB_RESMGR_UTILS_20_0014
     * @tc.desc   resourceKey of ohos.samples.other/libraryOverlay id 491
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB200014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200014 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'ohos.samples.other',
        moduleName: 'libraryOverlay', id: 491});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.other:libraryOverlay:491'));
      expect(result).assertEqual('ohos.samples.other:libraryOverlay:491');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(491))));
      expect(result.endsWith(':' + String(491))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200014 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB200015
     * @tc.number SUB_RESMGR_UTILS_20_0015
     * @tc.desc   resourceKey of x/entry id 528
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB200015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200015 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'x', moduleName: 'entry', id: 528});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('x:entry:528'));
      expect(result).assertEqual('x:entry:528');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(528))));
      expect(result.endsWith(':' + String(528))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200015 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB200016
     * @tc.number SUB_RESMGR_UTILS_20_0016
     * @tc.desc   resourceKey of ohos.samples.resourcemanager/libraryOverlay id 565
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB200016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200016 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'libraryOverlay', id: 565});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:libraryOverlay:565'));
      expect(result).assertEqual('ohos.samples.resourcemanager:libraryOverlay:565');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(565))));
      expect(result.endsWith(':' + String(565))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200016 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB200017
     * @tc.number SUB_RESMGR_UTILS_20_0017
     * @tc.desc   resourceKey of ohos.samples.other/entry id 602
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB200017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200017 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'ohos.samples.other', moduleName: 'entry',
        id: 602});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.other:entry:602'));
      expect(result).assertEqual('ohos.samples.other:entry:602');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(602))));
      expect(result.endsWith(':' + String(602))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200017 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB200018
     * @tc.number SUB_RESMGR_UTILS_20_0018
     * @tc.desc   resourceKey of x/libraryOverlay id 639
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB200018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200018 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'x', moduleName: 'libraryOverlay', id: 639});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('x:libraryOverlay:639'));
      expect(result).assertEqual('x:libraryOverlay:639');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(639))));
      expect(result.endsWith(':' + String(639))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200018 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB200019
     * @tc.number SUB_RESMGR_UTILS_20_0019
     * @tc.desc   resourceKey of ohos.samples.resourcemanager/entry id 676
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB200019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200019 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 676});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:entry:676'));
      expect(result).assertEqual('ohos.samples.resourcemanager:entry:676');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(676))));
      expect(result.endsWith(':' + String(676))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200019 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB200020
     * @tc.number SUB_RESMGR_UTILS_20_0020
     * @tc.desc   resourceKey of ohos.samples.other/libraryOverlay id 713
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB200020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200020 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'ohos.samples.other',
        moduleName: 'libraryOverlay', id: 713});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.other:libraryOverlay:713'));
      expect(result).assertEqual('ohos.samples.other:libraryOverlay:713');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(713))));
      expect(result.endsWith(':' + String(713))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200020 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB200021
     * @tc.number SUB_RESMGR_UTILS_20_0021
     * @tc.desc   resourceKey of x/entry id 750
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB200021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200021 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'x', moduleName: 'entry', id: 750});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('x:entry:750'));
      expect(result).assertEqual('x:entry:750');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(750))));
      expect(result.endsWith(':' + String(750))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200021 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB200022
     * @tc.number SUB_RESMGR_UTILS_20_0022
     * @tc.desc   resourceKey of ohos.samples.resourcemanager/libraryOverlay id 787
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB200022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200022 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'libraryOverlay', id: 787});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:libraryOverlay:787'));
      expect(result).assertEqual('ohos.samples.resourcemanager:libraryOverlay:787');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(787))));
      expect(result.endsWith(':' + String(787))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200022 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB200023
     * @tc.number SUB_RESMGR_UTILS_20_0023
     * @tc.desc   resourceKey of ohos.samples.other/entry id 824
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB200023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200023 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'ohos.samples.other', moduleName: 'entry',
        id: 824});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.other:entry:824'));
      expect(result).assertEqual('ohos.samples.other:entry:824');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(824))));
      expect(result.endsWith(':' + String(824))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200023 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB200024
     * @tc.number SUB_RESMGR_UTILS_20_0024
     * @tc.desc   resourceKey of x/libraryOverlay id 861
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB200024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200024 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'x', moduleName: 'libraryOverlay', id: 861});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('x:libraryOverlay:861'));
      expect(result).assertEqual('x:libraryOverlay:861');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(861))));
      expect(result.endsWith(':' + String(861))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200024 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB200025
     * @tc.number SUB_RESMGR_UTILS_20_0025
     * @tc.desc   resourceKey of ohos.samples.resourcemanager/entry id 898
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB200025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200025 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 898});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:entry:898'));
      expect(result).assertEqual('ohos.samples.resourcemanager:entry:898');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(898))));
      expect(result.endsWith(':' + String(898))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200025 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB200026
     * @tc.number SUB_RESMGR_UTILS_20_0026
     * @tc.desc   resourceKey of ohos.samples.other/libraryOverlay id 935
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB200026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200026 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'ohos.samples.other',
        moduleName: 'libraryOverlay', id: 935});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.other:libraryOverlay:935'));
      expect(result).assertEqual('ohos.samples.other:libraryOverlay:935');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(935))));
      expect(result.endsWith(':' + String(935))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200026 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB200027
     * @tc.number SUB_RESMGR_UTILS_20_0027
     * @tc.desc   resourceKey of x/entry id 972
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB200027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200027 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'x', moduleName: 'entry', id: 972});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('x:entry:972'));
      expect(result).assertEqual('x:entry:972');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(972))));
      expect(result.endsWith(':' + String(972))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200027 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB200028
     * @tc.number SUB_RESMGR_UTILS_20_0028
     * @tc.desc   resourceKey of ohos.samples.resourcemanager/libraryOverlay id 1009
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB200028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200028 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'libraryOverlay', id: 1009});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:libraryOverlay:1009'));
      expect(result).assertEqual('ohos.samples.resourcemanager:libraryOverlay:1009');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(1009))));
      expect(result.endsWith(':' + String(1009))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200028 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB200029
     * @tc.number SUB_RESMGR_UTILS_20_0029
     * @tc.desc   resourceKey of ohos.samples.other/entry id 1046
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB200029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200029 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'ohos.samples.other', moduleName: 'entry',
        id: 1046});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.other:entry:1046'));
      expect(result).assertEqual('ohos.samples.other:entry:1046');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(1046))));
      expect(result.endsWith(':' + String(1046))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200029 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB200030
     * @tc.number SUB_RESMGR_UTILS_20_0030
     * @tc.desc   resourceKey of x/libraryOverlay id 1083
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB200030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200030 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'x', moduleName: 'libraryOverlay', id: 1083});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('x:libraryOverlay:1083'));
      expect(result).assertEqual('x:libraryOverlay:1083');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(1083))));
      expect(result.endsWith(':' + String(1083))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200030 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB200031
     * @tc.number SUB_RESMGR_UTILS_20_0031
     * @tc.desc   resourceKey of ohos.samples.resourcemanager/entry id 1120
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB200031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200031 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 1120});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:entry:1120'));
      expect(result).assertEqual('ohos.samples.resourcemanager:entry:1120');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(1120))));
      expect(result.endsWith(':' + String(1120))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200031 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB200032
     * @tc.number SUB_RESMGR_UTILS_20_0032
     * @tc.desc   resourceKey of ohos.samples.other/libraryOverlay id 1157
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB200032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200032 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'ohos.samples.other',
        moduleName: 'libraryOverlay', id: 1157});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.other:libraryOverlay:1157'));
      expect(result).assertEqual('ohos.samples.other:libraryOverlay:1157');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(1157))));
      expect(result.endsWith(':' + String(1157))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200032 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB200033
     * @tc.number SUB_RESMGR_UTILS_20_0033
     * @tc.desc   resourceKey of x/entry id 1194
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB200033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200033 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'x', moduleName: 'entry', id: 1194});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('x:entry:1194'));
      expect(result).assertEqual('x:entry:1194');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(1194))));
      expect(result.endsWith(':' + String(1194))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200033 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB200034
     * @tc.number SUB_RESMGR_UTILS_20_0034
     * @tc.desc   resourceKey of ohos.samples.resourcemanager/libraryOverlay id 1231
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB200034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200034 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'libraryOverlay', id: 1231});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:libraryOverlay:1231'));
      expect(result).assertEqual('ohos.samples.resourcemanager:libraryOverlay:1231');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(1231))));
      expect(result.endsWith(':' + String(1231))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200034 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB200035
     * @tc.number SUB_RESMGR_UTILS_20_0035
     * @tc.desc   resourceKey of ohos.samples.other/entry id 1268
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB200035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200035 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'ohos.samples.other', moduleName: 'entry',
        id: 1268});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.other:entry:1268'));
      expect(result).assertEqual('ohos.samples.other:entry:1268');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(1268))));
      expect(result.endsWith(':' + String(1268))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200035 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB200036
     * @tc.number SUB_RESMGR_UTILS_20_0036
     * @tc.desc   resourceKey of x/libraryOverlay id 1305
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB200036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200036 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'x', moduleName: 'libraryOverlay', id: 1305});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('x:libraryOverlay:1305'));
      expect(result).assertEqual('x:libraryOverlay:1305');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(1305))));
      expect(result.endsWith(':' + String(1305))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200036 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB200037
     * @tc.number SUB_RESMGR_UTILS_20_0037
     * @tc.desc   resourceKey of ohos.samples.resourcemanager/entry id 1342
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB200037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200037 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 1342});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:entry:1342'));
      expect(result).assertEqual('ohos.samples.resourcemanager:entry:1342');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(1342))));
      expect(result.endsWith(':' + String(1342))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200037 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB200038
     * @tc.number SUB_RESMGR_UTILS_20_0038
     * @tc.desc   resourceKey of ohos.samples.other/libraryOverlay id 1379
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB200038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200038 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'ohos.samples.other',
        moduleName: 'libraryOverlay', id: 1379});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.other:libraryOverlay:1379'));
      expect(result).assertEqual('ohos.samples.other:libraryOverlay:1379');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(1379))));
      expect(result.endsWith(':' + String(1379))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200038 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB200039
     * @tc.number SUB_RESMGR_UTILS_20_0039
     * @tc.desc   resourceKey of x/entry id 1416
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB200039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200039 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'x', moduleName: 'entry', id: 1416});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('x:entry:1416'));
      expect(result).assertEqual('x:entry:1416');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(1416))));
      expect(result.endsWith(':' + String(1416))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200039 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB200040
     * @tc.number SUB_RESMGR_UTILS_20_0040
     * @tc.desc   resourceKey of ohos.samples.resourcemanager/libraryOverlay id 1453
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB200040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200040 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'libraryOverlay', id: 1453});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:libraryOverlay:1453'));
      expect(result).assertEqual('ohos.samples.resourcemanager:libraryOverlay:1453');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(1453))));
      expect(result.endsWith(':' + String(1453))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200040 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB200041
     * @tc.number SUB_RESMGR_UTILS_20_0041
     * @tc.desc   resourceKey of ohos.samples.other/entry id 1490
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB200041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200041 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'ohos.samples.other', moduleName: 'entry',
        id: 1490});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.other:entry:1490'));
      expect(result).assertEqual('ohos.samples.other:entry:1490');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(1490))));
      expect(result.endsWith(':' + String(1490))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200041 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB200042
     * @tc.number SUB_RESMGR_UTILS_20_0042
     * @tc.desc   resourceKey of x/libraryOverlay id 1527
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB200042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200042 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'x', moduleName: 'libraryOverlay', id: 1527});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('x:libraryOverlay:1527'));
      expect(result).assertEqual('x:libraryOverlay:1527');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(1527))));
      expect(result.endsWith(':' + String(1527))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200042 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB200043
     * @tc.number SUB_RESMGR_UTILS_20_0043
     * @tc.desc   resourceKey of ohos.samples.resourcemanager/entry id 1564
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB200043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200043 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 1564});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:entry:1564'));
      expect(result).assertEqual('ohos.samples.resourcemanager:entry:1564');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(1564))));
      expect(result.endsWith(':' + String(1564))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200043 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB200044
     * @tc.number SUB_RESMGR_UTILS_20_0044
     * @tc.desc   resourceKey of ohos.samples.other/libraryOverlay id 1601
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB200044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200044 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'ohos.samples.other',
        moduleName: 'libraryOverlay', id: 1601});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.other:libraryOverlay:1601'));
      expect(result).assertEqual('ohos.samples.other:libraryOverlay:1601');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(1601))));
      expect(result.endsWith(':' + String(1601))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200044 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB200045
     * @tc.number SUB_RESMGR_UTILS_20_0045
     * @tc.desc   resourceKey of x/entry id 1638
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB200045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200045 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'x', moduleName: 'entry', id: 1638});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('x:entry:1638'));
      expect(result).assertEqual('x:entry:1638');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(1638))));
      expect(result.endsWith(':' + String(1638))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200045 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB200046
     * @tc.number SUB_RESMGR_UTILS_20_0046
     * @tc.desc   resourceKey of ohos.samples.resourcemanager/libraryOverlay id 1675
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB200046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200046 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'libraryOverlay', id: 1675});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:libraryOverlay:1675'));
      expect(result).assertEqual('ohos.samples.resourcemanager:libraryOverlay:1675');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(1675))));
      expect(result.endsWith(':' + String(1675))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200046 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB200047
     * @tc.number SUB_RESMGR_UTILS_20_0047
     * @tc.desc   resourceKey of ohos.samples.other/entry id 1712
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB200047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200047 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'ohos.samples.other', moduleName: 'entry',
        id: 1712});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.other:entry:1712'));
      expect(result).assertEqual('ohos.samples.other:entry:1712');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(1712))));
      expect(result.endsWith(':' + String(1712))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200047 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB200048
     * @tc.number SUB_RESMGR_UTILS_20_0048
     * @tc.desc   resourceKey of x/libraryOverlay id 1749
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB200048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200048 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'x', moduleName: 'libraryOverlay', id: 1749});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('x:libraryOverlay:1749'));
      expect(result).assertEqual('x:libraryOverlay:1749');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(1749))));
      expect(result.endsWith(':' + String(1749))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200048 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB200049
     * @tc.number SUB_RESMGR_UTILS_20_0049
     * @tc.desc   resourceKey of ohos.samples.resourcemanager/entry id 1786
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB200049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200049 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 1786});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:entry:1786'));
      expect(result).assertEqual('ohos.samples.resourcemanager:entry:1786');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(1786))));
      expect(result.endsWith(':' + String(1786))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200049 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB200050
     * @tc.number SUB_RESMGR_UTILS_20_0050
     * @tc.desc   resourceKey of ohos.samples.other/libraryOverlay id 1823
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB200050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200050 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'ohos.samples.other',
        moduleName: 'libraryOverlay', id: 1823});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.other:libraryOverlay:1823'));
      expect(result).assertEqual('ohos.samples.other:libraryOverlay:1823');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(1823))));
      expect(result.endsWith(':' + String(1823))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200050 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB200051
     * @tc.number SUB_RESMGR_UTILS_20_0051
     * @tc.desc   resourceKey of x/entry id 1860
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB200051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200051 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'x', moduleName: 'entry', id: 1860});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('x:entry:1860'));
      expect(result).assertEqual('x:entry:1860');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(1860))));
      expect(result.endsWith(':' + String(1860))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200051 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB200052
     * @tc.number SUB_RESMGR_UTILS_20_0052
     * @tc.desc   resourceKey of ohos.samples.resourcemanager/libraryOverlay id 1897
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB200052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200052 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'libraryOverlay', id: 1897});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:libraryOverlay:1897'));
      expect(result).assertEqual('ohos.samples.resourcemanager:libraryOverlay:1897');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(1897))));
      expect(result.endsWith(':' + String(1897))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200052 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB200053
     * @tc.number SUB_RESMGR_UTILS_20_0053
     * @tc.desc   resourceKey of ohos.samples.other/entry id 1934
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB200053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200053 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'ohos.samples.other', moduleName: 'entry',
        id: 1934});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.other:entry:1934'));
      expect(result).assertEqual('ohos.samples.other:entry:1934');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(1934))));
      expect(result.endsWith(':' + String(1934))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200053 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB200054
     * @tc.number SUB_RESMGR_UTILS_20_0054
     * @tc.desc   resourceKey of x/libraryOverlay id 1971
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB200054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200054 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'x', moduleName: 'libraryOverlay', id: 1971});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('x:libraryOverlay:1971'));
      expect(result).assertEqual('x:libraryOverlay:1971');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(1971))));
      expect(result.endsWith(':' + String(1971))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200054 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB200055
     * @tc.number SUB_RESMGR_UTILS_20_0055
     * @tc.desc   resourceKey of ohos.samples.resourcemanager/entry id 2008
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB200055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200055 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 2008});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:entry:2008'));
      expect(result).assertEqual('ohos.samples.resourcemanager:entry:2008');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(2008))));
      expect(result.endsWith(':' + String(2008))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200055 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB200056
     * @tc.number SUB_RESMGR_UTILS_20_0056
     * @tc.desc   resourceKey of ohos.samples.other/libraryOverlay id 2045
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB200056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200056 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'ohos.samples.other',
        moduleName: 'libraryOverlay', id: 2045});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.other:libraryOverlay:2045'));
      expect(result).assertEqual('ohos.samples.other:libraryOverlay:2045');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(2045))));
      expect(result.endsWith(':' + String(2045))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200056 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB200057
     * @tc.number SUB_RESMGR_UTILS_20_0057
     * @tc.desc   resourceKey of x/entry id 2082
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB200057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200057 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'x', moduleName: 'entry', id: 2082});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('x:entry:2082'));
      expect(result).assertEqual('x:entry:2082');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(2082))));
      expect(result.endsWith(':' + String(2082))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200057 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB200058
     * @tc.number SUB_RESMGR_UTILS_20_0058
     * @tc.desc   resourceKey of ohos.samples.resourcemanager/libraryOverlay id 2119
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB200058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200058 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'libraryOverlay', id: 2119});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:libraryOverlay:2119'));
      expect(result).assertEqual('ohos.samples.resourcemanager:libraryOverlay:2119');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(2119))));
      expect(result.endsWith(':' + String(2119))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200058 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB200059
     * @tc.number SUB_RESMGR_UTILS_20_0059
     * @tc.desc   resourceKey of ohos.samples.other/entry id 2156
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB200059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200059 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'ohos.samples.other', moduleName: 'entry',
        id: 2156});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.other:entry:2156'));
      expect(result).assertEqual('ohos.samples.other:entry:2156');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(2156))));
      expect(result.endsWith(':' + String(2156))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200059 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB200060
     * @tc.number SUB_RESMGR_UTILS_20_0060
     * @tc.desc   resourceKey of x/libraryOverlay id 2193
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB200060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200060 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'x', moduleName: 'libraryOverlay', id: 2193});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('x:libraryOverlay:2193'));
      expect(result).assertEqual('x:libraryOverlay:2193');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(2193))));
      expect(result.endsWith(':' + String(2193))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200060 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB200061
     * @tc.number SUB_RESMGR_UTILS_20_0061
     * @tc.desc   resourceKey of ohos.samples.resourcemanager/entry id 2230
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB200061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200061 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 2230});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:entry:2230'));
      expect(result).assertEqual('ohos.samples.resourcemanager:entry:2230');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(2230))));
      expect(result.endsWith(':' + String(2230))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200061 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB200062
     * @tc.number SUB_RESMGR_UTILS_20_0062
     * @tc.desc   resourceKey of ohos.samples.other/libraryOverlay id 2267
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB200062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200062 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'ohos.samples.other',
        moduleName: 'libraryOverlay', id: 2267});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.other:libraryOverlay:2267'));
      expect(result).assertEqual('ohos.samples.other:libraryOverlay:2267');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(2267))));
      expect(result.endsWith(':' + String(2267))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200062 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB200063
     * @tc.number SUB_RESMGR_UTILS_20_0063
     * @tc.desc   resourceKey of x/entry id 2304
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB200063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200063 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'x', moduleName: 'entry', id: 2304});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('x:entry:2304'));
      expect(result).assertEqual('x:entry:2304');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(2304))));
      expect(result.endsWith(':' + String(2304))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200063 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB200064
     * @tc.number SUB_RESMGR_UTILS_20_0064
     * @tc.desc   resourceKey of ohos.samples.resourcemanager/libraryOverlay id 2341
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB200064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200064 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'libraryOverlay', id: 2341});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:libraryOverlay:2341'));
      expect(result).assertEqual('ohos.samples.resourcemanager:libraryOverlay:2341');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(2341))));
      expect(result.endsWith(':' + String(2341))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200064 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB200065
     * @tc.number SUB_RESMGR_UTILS_20_0065
     * @tc.desc   resourceKey of ohos.samples.other/entry id 2378
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB200065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200065 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'ohos.samples.other', moduleName: 'entry',
        id: 2378});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.other:entry:2378'));
      expect(result).assertEqual('ohos.samples.other:entry:2378');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(2378))));
      expect(result.endsWith(':' + String(2378))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200065 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB200066
     * @tc.number SUB_RESMGR_UTILS_20_0066
     * @tc.desc   resourceKey of x/libraryOverlay id 2415
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB200066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200066 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'x', moduleName: 'libraryOverlay', id: 2415});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('x:libraryOverlay:2415'));
      expect(result).assertEqual('x:libraryOverlay:2415');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(2415))));
      expect(result.endsWith(':' + String(2415))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200066 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB200067
     * @tc.number SUB_RESMGR_UTILS_20_0067
     * @tc.desc   resourceKey of ohos.samples.resourcemanager/entry id 2452
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB200067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200067 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 2452});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:entry:2452'));
      expect(result).assertEqual('ohos.samples.resourcemanager:entry:2452');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(2452))));
      expect(result.endsWith(':' + String(2452))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200067 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB200068
     * @tc.number SUB_RESMGR_UTILS_20_0068
     * @tc.desc   resourceKey of ohos.samples.other/libraryOverlay id 2489
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB200068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200068 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'ohos.samples.other',
        moduleName: 'libraryOverlay', id: 2489});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.other:libraryOverlay:2489'));
      expect(result).assertEqual('ohos.samples.other:libraryOverlay:2489');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(2489))));
      expect(result.endsWith(':' + String(2489))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200068 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB200069
     * @tc.number SUB_RESMGR_UTILS_20_0069
     * @tc.desc   resourceKey of x/entry id 2526
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB200069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200069 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'x', moduleName: 'entry', id: 2526});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('x:entry:2526'));
      expect(result).assertEqual('x:entry:2526');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(2526))));
      expect(result.endsWith(':' + String(2526))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200069 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB200070
     * @tc.number SUB_RESMGR_UTILS_20_0070
     * @tc.desc   resourceKey of ohos.samples.resourcemanager/libraryOverlay id 2563
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB200070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200070 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'libraryOverlay', id: 2563});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:libraryOverlay:2563'));
      expect(result).assertEqual('ohos.samples.resourcemanager:libraryOverlay:2563');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(2563))));
      expect(result.endsWith(':' + String(2563))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200070 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB200071
     * @tc.number SUB_RESMGR_UTILS_20_0071
     * @tc.desc   resourceKey of ohos.samples.other/entry id 2600
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB200071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200071 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'ohos.samples.other', moduleName: 'entry',
        id: 2600});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.other:entry:2600'));
      expect(result).assertEqual('ohos.samples.other:entry:2600');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(2600))));
      expect(result.endsWith(':' + String(2600))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200071 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB200072
     * @tc.number SUB_RESMGR_UTILS_20_0072
     * @tc.desc   resourceKey of x/libraryOverlay id 2637
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB200072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200072 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'x', moduleName: 'libraryOverlay', id: 2637});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('x:libraryOverlay:2637'));
      expect(result).assertEqual('x:libraryOverlay:2637');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(2637))));
      expect(result.endsWith(':' + String(2637))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200072 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB200073
     * @tc.number SUB_RESMGR_UTILS_20_0073
     * @tc.desc   resourceKey of ohos.samples.resourcemanager/entry id 2674
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB200073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200073 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 2674});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:entry:2674'));
      expect(result).assertEqual('ohos.samples.resourcemanager:entry:2674');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(2674))));
      expect(result.endsWith(':' + String(2674))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200073 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB200074
     * @tc.number SUB_RESMGR_UTILS_20_0074
     * @tc.desc   resourceKey of ohos.samples.other/libraryOverlay id 2711
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB200074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200074 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'ohos.samples.other',
        moduleName: 'libraryOverlay', id: 2711});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.other:libraryOverlay:2711'));
      expect(result).assertEqual('ohos.samples.other:libraryOverlay:2711');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(2711))));
      expect(result.endsWith(':' + String(2711))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200074 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB200075
     * @tc.number SUB_RESMGR_UTILS_20_0075
     * @tc.desc   resourceKey of x/entry id 2748
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB200075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200075 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'x', moduleName: 'entry', id: 2748});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('x:entry:2748'));
      expect(result).assertEqual('x:entry:2748');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(2748))));
      expect(result.endsWith(':' + String(2748))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200075 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB200076
     * @tc.number SUB_RESMGR_UTILS_20_0076
     * @tc.desc   resourceKey of ohos.samples.resourcemanager/libraryOverlay id 2785
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB200076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200076 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'libraryOverlay', id: 2785});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:libraryOverlay:2785'));
      expect(result).assertEqual('ohos.samples.resourcemanager:libraryOverlay:2785');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(2785))));
      expect(result.endsWith(':' + String(2785))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200076 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB200077
     * @tc.number SUB_RESMGR_UTILS_20_0077
     * @tc.desc   resourceKey of ohos.samples.other/entry id 2822
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB200077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200077 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'ohos.samples.other', moduleName: 'entry',
        id: 2822});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.other:entry:2822'));
      expect(result).assertEqual('ohos.samples.other:entry:2822');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(2822))));
      expect(result.endsWith(':' + String(2822))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200077 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB200078
     * @tc.number SUB_RESMGR_UTILS_20_0078
     * @tc.desc   resourceKey of x/libraryOverlay id 2859
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB200078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200078 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'x', moduleName: 'libraryOverlay', id: 2859});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('x:libraryOverlay:2859'));
      expect(result).assertEqual('x:libraryOverlay:2859');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(2859))));
      expect(result.endsWith(':' + String(2859))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200078 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB200079
     * @tc.number SUB_RESMGR_UTILS_20_0079
     * @tc.desc   resourceKey of ohos.samples.resourcemanager/entry id 2896
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB200079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200079 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 2896});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:entry:2896'));
      expect(result).assertEqual('ohos.samples.resourcemanager:entry:2896');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(2896))));
      expect(result.endsWith(':' + String(2896))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200079 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB200080
     * @tc.number SUB_RESMGR_UTILS_20_0080
     * @tc.desc   resourceKey of ohos.samples.other/libraryOverlay id 2933
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB200080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200080 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'ohos.samples.other',
        moduleName: 'libraryOverlay', id: 2933});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.other:libraryOverlay:2933'));
      expect(result).assertEqual('ohos.samples.other:libraryOverlay:2933');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(2933))));
      expect(result.endsWith(':' + String(2933))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200080 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB200081
     * @tc.number SUB_RESMGR_UTILS_20_0081
     * @tc.desc   resourceKey of x/entry id 2970
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB200081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200081 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'x', moduleName: 'entry', id: 2970});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('x:entry:2970'));
      expect(result).assertEqual('x:entry:2970');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(2970))));
      expect(result.endsWith(':' + String(2970))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200081 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB200082
     * @tc.number SUB_RESMGR_UTILS_20_0082
     * @tc.desc   resourceKey of ohos.samples.resourcemanager/libraryOverlay id 3007
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB200082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200082 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'libraryOverlay', id: 3007});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:libraryOverlay:3007'));
      expect(result).assertEqual('ohos.samples.resourcemanager:libraryOverlay:3007');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(3007))));
      expect(result.endsWith(':' + String(3007))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200082 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB200083
     * @tc.number SUB_RESMGR_UTILS_20_0083
     * @tc.desc   resourceKey of ohos.samples.other/entry id 3044
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB200083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200083 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'ohos.samples.other', moduleName: 'entry',
        id: 3044});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.other:entry:3044'));
      expect(result).assertEqual('ohos.samples.other:entry:3044');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(3044))));
      expect(result.endsWith(':' + String(3044))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200083 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB200084
     * @tc.number SUB_RESMGR_UTILS_20_0084
     * @tc.desc   resourceKey of x/libraryOverlay id 3081
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB200084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200084 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'x', moduleName: 'libraryOverlay', id: 3081});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('x:libraryOverlay:3081'));
      expect(result).assertEqual('x:libraryOverlay:3081');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(3081))));
      expect(result.endsWith(':' + String(3081))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200084 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB200085
     * @tc.number SUB_RESMGR_UTILS_20_0085
     * @tc.desc   resourceKey of ohos.samples.resourcemanager/entry id 3118
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB200085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200085 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 3118});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:entry:3118'));
      expect(result).assertEqual('ohos.samples.resourcemanager:entry:3118');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(3118))));
      expect(result.endsWith(':' + String(3118))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200085 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB200086
     * @tc.number SUB_RESMGR_UTILS_20_0086
     * @tc.desc   resourceKey of ohos.samples.other/libraryOverlay id 3155
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB200086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200086 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'ohos.samples.other',
        moduleName: 'libraryOverlay', id: 3155});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.other:libraryOverlay:3155'));
      expect(result).assertEqual('ohos.samples.other:libraryOverlay:3155');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(3155))));
      expect(result.endsWith(':' + String(3155))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200086 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB200087
     * @tc.number SUB_RESMGR_UTILS_20_0087
     * @tc.desc   resourceKey of x/entry id 3192
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB200087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200087 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'x', moduleName: 'entry', id: 3192});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('x:entry:3192'));
      expect(result).assertEqual('x:entry:3192');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(3192))));
      expect(result.endsWith(':' + String(3192))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200087 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB200088
     * @tc.number SUB_RESMGR_UTILS_20_0088
     * @tc.desc   resourceKey of ohos.samples.resourcemanager/libraryOverlay id 3229
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB200088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200088 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'libraryOverlay', id: 3229});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:libraryOverlay:3229'));
      expect(result).assertEqual('ohos.samples.resourcemanager:libraryOverlay:3229');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(3229))));
      expect(result.endsWith(':' + String(3229))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200088 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB200089
     * @tc.number SUB_RESMGR_UTILS_20_0089
     * @tc.desc   resourceKey of ohos.samples.other/entry id 3266
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB200089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200089 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'ohos.samples.other', moduleName: 'entry',
        id: 3266});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.other:entry:3266'));
      expect(result).assertEqual('ohos.samples.other:entry:3266');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(3266))));
      expect(result.endsWith(':' + String(3266))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200089 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB200090
     * @tc.number SUB_RESMGR_UTILS_20_0090
     * @tc.desc   resourceKey of x/libraryOverlay id 3303
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB200090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200090 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'x', moduleName: 'libraryOverlay', id: 3303});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('x:libraryOverlay:3303'));
      expect(result).assertEqual('x:libraryOverlay:3303');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(3303))));
      expect(result.endsWith(':' + String(3303))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200090 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB200091
     * @tc.number SUB_RESMGR_UTILS_20_0091
     * @tc.desc   resourceKey of ohos.samples.resourcemanager/entry id 3340
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB200091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200091 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'entry', id: 3340});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:entry:3340'));
      expect(result).assertEqual('ohos.samples.resourcemanager:entry:3340');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(3340))));
      expect(result.endsWith(':' + String(3340))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200091 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB200092
     * @tc.number SUB_RESMGR_UTILS_20_0092
     * @tc.desc   resourceKey of ohos.samples.other/libraryOverlay id 3377
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB200092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200092 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'ohos.samples.other',
        moduleName: 'libraryOverlay', id: 3377});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.other:libraryOverlay:3377'));
      expect(result).assertEqual('ohos.samples.other:libraryOverlay:3377');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(3377))));
      expect(result.endsWith(':' + String(3377))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200092 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB200093
     * @tc.number SUB_RESMGR_UTILS_20_0093
     * @tc.desc   resourceKey of x/entry id 3414
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB200093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200093 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'x', moduleName: 'entry', id: 3414});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('x:entry:3414'));
      expect(result).assertEqual('x:entry:3414');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(3414))));
      expect(result.endsWith(':' + String(3414))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200093 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB200094
     * @tc.number SUB_RESMGR_UTILS_20_0094
     * @tc.desc   resourceKey of ohos.samples.resourcemanager/libraryOverlay id 3451
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB200094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200094 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'ohos.samples.resourcemanager',
        moduleName: 'libraryOverlay', id: 3451});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.resourcemanager:libraryOverlay:3451'));
      expect(result).assertEqual('ohos.samples.resourcemanager:libraryOverlay:3451');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(3451))));
      expect(result.endsWith(':' + String(3451))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200094 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB200095
     * @tc.number SUB_RESMGR_UTILS_20_0095
     * @tc.desc   resourceKey of ohos.samples.other/entry id 3488
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB200095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200095 begin');
      const result: string = ResourceUtils.resourceKey({bundleName: 'ohos.samples.other', moduleName: 'entry',
        id: 3488});
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('ohos.samples.other:entry:3488'));
      expect(result).assertEqual('ohos.samples.other:entry:3488');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.split(':').length === 3));
      expect(result.split(':').length === 3).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith(':' + String(3488))));
      expect(result.endsWith(':' + String(3488))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB200095 end');
    })

    /**
     * @tc.name   testResourceUtilsKeyB2096
     * @tc.number SUB_RESMGR_UTILS_20_0096
     * @tc.desc   同一三元组互认，任一字段不同即判否
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testResourceUtilsKeyB2096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB2096 begin');
      const left: resourceManager.Resource = { bundleName: 'ohos.samples.resourcemanager', moduleName: 'entry',
        id: 100 };
      const right: resourceManager.Resource = { bundleName: 'ohos.samples.resourcemanager', moduleName: 'entry',
        id: 100 };
      const other: resourceManager.Resource = { bundleName: 'ohos.samples.resourcemanager', moduleName: 'entry',
        id: 101 };
      expect(ResourceUtils.resourceKey(left)).assertEqual('ohos.samples.resourcemanager:entry:100');
      expect(ResourceUtils.isSameResource(left, right)).assertTrue();
      expect(ResourceUtils.isSameResource(left, other)).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testResourceUtilsKeyB2096 end');
    })
  })
}
