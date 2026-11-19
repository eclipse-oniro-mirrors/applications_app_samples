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
import { commonEventManager } from '@kit.BasicServicesKit';
import { CommonEventPublisher } from '../../../main/ets/feature/CommonEventPublisher';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[SampleTest]';

export default function publishValidateVolume02Test() {
  describe('PublishValidateVolume02Test', () => {

    /**
     * @tc.name   testEventNameDomain0001
     * @tc.number SUB_CCER_PVALID_02_0001
     * @tc.desc   内部单空格事件名通过发布前校验
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEventNameDomain0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEventNameDomain0001 begin');
      const publishData: commonEventManager.CommonEventPublishData =
        CommonEventPublisher.buildPublishData('InApp', 1002, false);
      const name: string = 'one two';
      const result: string = CommonEventPublisher.validatePublishRequest(name, publishData);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(publishData.code), String(1002));
      expect(publishData.code).assertEqual(1002);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(publishData.isOrdered === false));
      expect(publishData.isOrdered === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEventNameDomain0001 end');
    })

    /**
     * @tc.name   testEventNameDomain0002
     * @tc.number SUB_CCER_PVALID_02_0002
     * @tc.desc   内部双空格事件名通过发布前校验
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEventNameDomain0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEventNameDomain0002 begin');
      const publishData: commonEventManager.CommonEventPublishData =
        CommonEventPublisher.buildPublishData('InApp', 1002, false);
      const name: string = 'a  b';
      const result: string = CommonEventPublisher.validatePublishRequest(name, publishData);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(publishData.code), String(1002));
      expect(publishData.code).assertEqual(1002);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(publishData.isOrdered === false));
      expect(publishData.isOrdered === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEventNameDomain0002 end');
    })

    /**
     * @tc.name   testEventNameDomain0003
     * @tc.number SUB_CCER_PVALID_02_0003
     * @tc.desc   多词空格分隔事件名通过发布前校验
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEventNameDomain0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEventNameDomain0003 begin');
      const publishData: commonEventManager.CommonEventPublishData =
        CommonEventPublisher.buildPublishData('InApp', 1002, false);
      const name: string = 'first middle last';
      const result: string = CommonEventPublisher.validatePublishRequest(name, publishData);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(publishData.code), String(1002));
      expect(publishData.code).assertEqual(1002);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(publishData.isOrdered === false));
      expect(publishData.isOrdered === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEventNameDomain0003 end');
    })

    /**
     * @tc.name   testEventNameDomain0004
     * @tc.number SUB_CCER_PVALID_02_0004
     * @tc.desc   内部制表符事件名通过发布前校验
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEventNameDomain0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEventNameDomain0004 begin');
      const publishData: commonEventManager.CommonEventPublishData =
        CommonEventPublisher.buildPublishData('InApp', 1002, false);
      const name: string = 'x\ty';
      const result: string = CommonEventPublisher.validatePublishRequest(name, publishData);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(publishData.code), String(1002));
      expect(publishData.code).assertEqual(1002);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(publishData.isOrdered === false));
      expect(publishData.isOrdered === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEventNameDomain0004 end');
    })

    /**
     * @tc.name   testEventNameDomain0005
     * @tc.number SUB_CCER_PVALID_02_0005
     * @tc.desc   内部换行符事件名通过发布前校验
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEventNameDomain0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEventNameDomain0005 begin');
      const publishData: commonEventManager.CommonEventPublishData =
        CommonEventPublisher.buildPublishData('InApp', 1002, false);
      const name: string = 'x\nz';
      const result: string = CommonEventPublisher.validatePublishRequest(name, publishData);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(publishData.code), String(1002));
      expect(publishData.code).assertEqual(1002);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(publishData.isOrdered === false));
      expect(publishData.isOrdered === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEventNameDomain0005 end');
    })

    /**
     * @tc.name   testEventNameDomain0006
     * @tc.number SUB_CCER_PVALID_02_0006
     * @tc.desc   首部制表符事件名被拒
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEventNameDomain0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEventNameDomain0006 begin');
      const publishData: commonEventManager.CommonEventPublishData =
        CommonEventPublisher.buildPublishData('InApp', 1002, false);
      const name: string = '\tlead tab';
      const result: string = CommonEventPublisher.validatePublishRequest(name, publishData);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('The common event name must not start or end with spaces.'));
      expect(result).assertEqual('The common event name must not start or end with spaces.');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(publishData.code), String(1002));
      expect(publishData.code).assertEqual(1002);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(publishData.isOrdered === false));
      expect(publishData.isOrdered === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEventNameDomain0006 end');
    })

    /**
     * @tc.name   testEventNameDomain0007
     * @tc.number SUB_CCER_PVALID_02_0007
     * @tc.desc   尾部制表符事件名被拒
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEventNameDomain0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEventNameDomain0007 begin');
      const publishData: commonEventManager.CommonEventPublishData =
        CommonEventPublisher.buildPublishData('InApp', 1002, false);
      const name: string = 'trail tab\t';
      const result: string = CommonEventPublisher.validatePublishRequest(name, publishData);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('The common event name must not start or end with spaces.'));
      expect(result).assertEqual('The common event name must not start or end with spaces.');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(publishData.code), String(1002));
      expect(publishData.code).assertEqual(1002);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(publishData.isOrdered === false));
      expect(publishData.isOrdered === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEventNameDomain0007 end');
    })

    /**
     * @tc.name   testEventNameDomain0008
     * @tc.number SUB_CCER_PVALID_02_0008
     * @tc.desc   首部换行符事件名被拒
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEventNameDomain0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEventNameDomain0008 begin');
      const publishData: commonEventManager.CommonEventPublishData =
        CommonEventPublisher.buildPublishData('InApp', 1002, false);
      const name: string = '\nlead nl';
      const result: string = CommonEventPublisher.validatePublishRequest(name, publishData);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('The common event name must not start or end with spaces.'));
      expect(result).assertEqual('The common event name must not start or end with spaces.');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(publishData.code), String(1002));
      expect(publishData.code).assertEqual(1002);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(publishData.isOrdered === false));
      expect(publishData.isOrdered === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEventNameDomain0008 end');
    })

    /**
     * @tc.name   testEventNameDomain0009
     * @tc.number SUB_CCER_PVALID_02_0009
     * @tc.desc   尾部换行符事件名被拒
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEventNameDomain0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEventNameDomain0009 begin');
      const publishData: commonEventManager.CommonEventPublishData =
        CommonEventPublisher.buildPublishData('InApp', 1002, false);
      const name: string = 'trail nl\n';
      const result: string = CommonEventPublisher.validatePublishRequest(name, publishData);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('The common event name must not start or end with spaces.'));
      expect(result).assertEqual('The common event name must not start or end with spaces.');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(publishData.code), String(1002));
      expect(publishData.code).assertEqual(1002);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(publishData.isOrdered === false));
      expect(publishData.isOrdered === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEventNameDomain0009 end');
    })

    /**
     * @tc.name   testEventNameDomain0010
     * @tc.number SUB_CCER_PVALID_02_0010
     * @tc.desc   首部回车符事件名被拒
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEventNameDomain0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEventNameDomain0010 begin');
      const publishData: commonEventManager.CommonEventPublishData =
        CommonEventPublisher.buildPublishData('InApp', 1002, false);
      const name: string = '\rlead cr';
      const result: string = CommonEventPublisher.validatePublishRequest(name, publishData);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('The common event name must not start or end with spaces.'));
      expect(result).assertEqual('The common event name must not start or end with spaces.');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(publishData.code), String(1002));
      expect(publishData.code).assertEqual(1002);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(publishData.isOrdered === false));
      expect(publishData.isOrdered === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEventNameDomain0010 end');
    })

    /**
     * @tc.name   testEventNameDomain0011
     * @tc.number SUB_CCER_PVALID_02_0011
     * @tc.desc   内部回车换行事件名通过发布前校验
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEventNameDomain0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEventNameDomain0011 begin');
      const publishData: commonEventManager.CommonEventPublishData =
        CommonEventPublisher.buildPublishData('InApp', 1002, false);
      const name: string = 'a\r\nb';
      const result: string = CommonEventPublisher.validatePublishRequest(name, publishData);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(publishData.code), String(1002));
      expect(publishData.code).assertEqual(1002);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(publishData.isOrdered === false));
      expect(publishData.isOrdered === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEventNameDomain0011 end');
    })

    /**
     * @tc.name   testEventNameDomain0012
     * @tc.number SUB_CCER_PVALID_02_0012
     * @tc.desc   空格制表混合前导事件名被拒
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEventNameDomain0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEventNameDomain0012 begin');
      const publishData: commonEventManager.CommonEventPublishData =
        CommonEventPublisher.buildPublishData('InApp', 1002, false);
      const name: string = ' \tmixed lead';
      const result: string = CommonEventPublisher.validatePublishRequest(name, publishData);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('The common event name must not start or end with spaces.'));
      expect(result).assertEqual('The common event name must not start or end with spaces.');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(publishData.code), String(1002));
      expect(publishData.code).assertEqual(1002);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(publishData.isOrdered === false));
      expect(publishData.isOrdered === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEventNameDomain0012 end');
    })

    /**
     * @tc.name   testEventNameDomain0013
     * @tc.number SUB_CCER_PVALID_02_0013
     * @tc.desc   尾部全角空格事件名被拒
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEventNameDomain0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEventNameDomain0013 begin');
      const publishData: commonEventManager.CommonEventPublishData =
        CommonEventPublisher.buildPublishData('InApp', 1002, false);
      const name: string = 'a\u3000';
      const result: string = CommonEventPublisher.validatePublishRequest(name, publishData);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('The common event name must not start or end with spaces.'));
      expect(result).assertEqual('The common event name must not start or end with spaces.');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(publishData.code), String(1002));
      expect(publishData.code).assertEqual(1002);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(publishData.isOrdered === false));
      expect(publishData.isOrdered === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEventNameDomain0013 end');
    })

    /**
     * @tc.name   testEventNameDomain0014
     * @tc.number SUB_CCER_PVALID_02_0014
     * @tc.desc   首部不换行空格事件名被拒
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEventNameDomain0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEventNameDomain0014 begin');
      const publishData: commonEventManager.CommonEventPublishData =
        CommonEventPublisher.buildPublishData('InApp', 1002, false);
      const name: string = '\u00a0b';
      const result: string = CommonEventPublisher.validatePublishRequest(name, publishData);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('The common event name must not start or end with spaces.'));
      expect(result).assertEqual('The common event name must not start or end with spaces.');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(publishData.code), String(1002));
      expect(publishData.code).assertEqual(1002);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(publishData.isOrdered === false));
      expect(publishData.isOrdered === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEventNameDomain0014 end');
    })

    /**
     * @tc.name   testEventNameDomain0015
     * @tc.number SUB_CCER_PVALID_02_0015
     * @tc.desc   尾部零宽空格事件名通过发布前校验
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEventNameDomain0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEventNameDomain0015 begin');
      const publishData: commonEventManager.CommonEventPublishData =
        CommonEventPublisher.buildPublishData('InApp', 1002, false);
      const name: string = 'a\u200b';
      const result: string = CommonEventPublisher.validatePublishRequest(name, publishData);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(publishData.code), String(1002));
      expect(publishData.code).assertEqual(1002);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(publishData.isOrdered === false));
      expect(publishData.isOrdered === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEventNameDomain0015 end');
    })

    /**
     * @tc.name   testEventNameDomain0016
     * @tc.number SUB_CCER_PVALID_02_0016
     * @tc.desc   纯空格事件名被拒
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEventNameDomain0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEventNameDomain0016 begin');
      const publishData: commonEventManager.CommonEventPublishData =
        CommonEventPublisher.buildPublishData('InApp', 1002, false);
      const name: string = '   ';
      const result: string = CommonEventPublisher.validatePublishRequest(name, publishData);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('The common event name must not start or end with spaces.'));
      expect(result).assertEqual('The common event name must not start or end with spaces.');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(publishData.code), String(1002));
      expect(publishData.code).assertEqual(1002);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(publishData.isOrdered === false));
      expect(publishData.isOrdered === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEventNameDomain0016 end');
    })

    /**
     * @tc.name   testEventNameDomain0017
     * @tc.number SUB_CCER_PVALID_02_0017
     * @tc.desc   长度为 1 的事件名通过发布前校验
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEventNameDomain0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEventNameDomain0017 begin');
      const publishData: commonEventManager.CommonEventPublishData =
        CommonEventPublisher.buildPublishData('InApp', 1002, false);
      let name: string = ''; for (let i: number = 0; i < 1; i++) { name += 'x'; }
      const result: string = CommonEventPublisher.validatePublishRequest(name, publishData);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(name.length === 1));
      expect(name.length === 1).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(publishData.code), String(1002));
      expect(publishData.code).assertEqual(1002);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEventNameDomain0017 end');
    })

    /**
     * @tc.name   testEventNameDomain0018
     * @tc.number SUB_CCER_PVALID_02_0018
     * @tc.desc   长度为 50 的事件名通过发布前校验
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEventNameDomain0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEventNameDomain0018 begin');
      const publishData: commonEventManager.CommonEventPublishData =
        CommonEventPublisher.buildPublishData('InApp', 1002, false);
      let name: string = ''; for (let i: number = 0; i < 50; i++) { name += 'x'; }
      const result: string = CommonEventPublisher.validatePublishRequest(name, publishData);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(name.length === 50));
      expect(name.length === 50).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(publishData.code), String(1002));
      expect(publishData.code).assertEqual(1002);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEventNameDomain0018 end');
    })

    /**
     * @tc.name   testEventNameDomain0019
     * @tc.number SUB_CCER_PVALID_02_0019
     * @tc.desc   长度为 127 的事件名通过发布前校验
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEventNameDomain0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEventNameDomain0019 begin');
      const publishData: commonEventManager.CommonEventPublishData =
        CommonEventPublisher.buildPublishData('InApp', 1002, false);
      let name: string = ''; for (let i: number = 0; i < 127; i++) { name += 'x'; }
      const result: string = CommonEventPublisher.validatePublishRequest(name, publishData);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(name.length === 127));
      expect(name.length === 127).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(publishData.code), String(1002));
      expect(publishData.code).assertEqual(1002);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEventNameDomain0019 end');
    })

    /**
     * @tc.name   testEventNameDomain0020
     * @tc.number SUB_CCER_PVALID_02_0020
     * @tc.desc   长度为 128 的事件名通过发布前校验
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEventNameDomain0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEventNameDomain0020 begin');
      const publishData: commonEventManager.CommonEventPublishData =
        CommonEventPublisher.buildPublishData('InApp', 1002, false);
      let name: string = ''; for (let i: number = 0; i < 128; i++) { name += 'x'; }
      const result: string = CommonEventPublisher.validatePublishRequest(name, publishData);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(name.length === 128));
      expect(name.length === 128).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(publishData.code), String(1002));
      expect(publishData.code).assertEqual(1002);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEventNameDomain0020 end');
    })

    /**
     * @tc.name   testEventNameDomain0021
     * @tc.number SUB_CCER_PVALID_02_0021
     * @tc.desc   长度为 255 的事件名通过发布前校验
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEventNameDomain0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEventNameDomain0021 begin');
      const publishData: commonEventManager.CommonEventPublishData =
        CommonEventPublisher.buildPublishData('InApp', 1002, false);
      let name: string = ''; for (let i: number = 0; i < 255; i++) { name += 'x'; }
      const result: string = CommonEventPublisher.validatePublishRequest(name, publishData);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(name.length === 255));
      expect(name.length === 255).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(publishData.code), String(1002));
      expect(publishData.code).assertEqual(1002);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEventNameDomain0021 end');
    })

    /**
     * @tc.name   testEventNameDomain0022
     * @tc.number SUB_CCER_PVALID_02_0022
     * @tc.desc   长度为 256 的事件名通过发布前校验
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEventNameDomain0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEventNameDomain0022 begin');
      const publishData: commonEventManager.CommonEventPublishData =
        CommonEventPublisher.buildPublishData('InApp', 1002, false);
      let name: string = ''; for (let i: number = 0; i < 256; i++) { name += 'x'; }
      const result: string = CommonEventPublisher.validatePublishRequest(name, publishData);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(name.length === 256));
      expect(name.length === 256).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(publishData.code), String(1002));
      expect(publishData.code).assertEqual(1002);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEventNameDomain0022 end');
    })

    /**
     * @tc.name   testEventNameDomain0023
     * @tc.number SUB_CCER_PVALID_02_0023
     * @tc.desc   长度为 512 的事件名通过发布前校验
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEventNameDomain0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEventNameDomain0023 begin');
      const publishData: commonEventManager.CommonEventPublishData =
        CommonEventPublisher.buildPublishData('InApp', 1002, false);
      let name: string = ''; for (let i: number = 0; i < 512; i++) { name += 'x'; }
      const result: string = CommonEventPublisher.validatePublishRequest(name, publishData);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(name.length === 512));
      expect(name.length === 512).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(publishData.code), String(1002));
      expect(publishData.code).assertEqual(1002);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEventNameDomain0023 end');
    })

    /**
     * @tc.name   testEventNameDomain0024
     * @tc.number SUB_CCER_PVALID_02_0024
     * @tc.desc   长度为 1024 的事件名通过发布前校验
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEventNameDomain0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEventNameDomain0024 begin');
      const publishData: commonEventManager.CommonEventPublishData =
        CommonEventPublisher.buildPublishData('InApp', 1002, false);
      let name: string = ''; for (let i: number = 0; i < 1024; i++) { name += 'x'; }
      const result: string = CommonEventPublisher.validatePublishRequest(name, publishData);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(name.length === 1024));
      expect(name.length === 1024).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(publishData.code), String(1002));
      expect(publishData.code).assertEqual(1002);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEventNameDomain0024 end');
    })

    /**
     * @tc.name   testEventNameDomain0025
     * @tc.number SUB_CCER_PVALID_02_0025
     * @tc.desc   长度为 65535 的事件数据通过长度校验
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEventNameDomain0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEventNameDomain0025 begin');
      const publishData: commonEventManager.CommonEventPublishData =
        CommonEventPublisher.buildPublishData('y'.repeat(65535), 1002, false);
      const name: string = 'data-max-ok';
      const result: string = CommonEventPublisher.validatePublishRequest(name, publishData);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String((publishData.data ?? '').length === 65535));
      expect((publishData.data ?? '').length === 65535).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(publishData.code), String(1002));
      expect(publishData.code).assertEqual(1002);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEventNameDomain0025 end');
    })

    /**
     * @tc.name   testEventNameDomain0026
     * @tc.number SUB_CCER_PVALID_02_0026
     * @tc.desc   空事件数据通过长度校验
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEventNameDomain0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEventNameDomain0026 begin');
      const publishData: commonEventManager.CommonEventPublishData =
        CommonEventPublisher.buildPublishData('', 1002, false);
      const name: string = 'data-empty-ok';
      const result: string = CommonEventPublisher.validatePublishRequest(name, publishData);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String((publishData.data ?? '').length === 0));
      expect((publishData.data ?? '').length === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(publishData.code), String(1002));
      expect(publishData.code).assertEqual(1002);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEventNameDomain0026 end');
    })

    /**
     * @tc.name   testEventNameDomain0027
     * @tc.number SUB_CCER_PVALID_02_0027
     * @tc.desc   带空格的事件数据原样通过校验
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEventNameDomain0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEventNameDomain0027 begin');
      const publishData: commonEventManager.CommonEventPublishData =
        CommonEventPublisher.buildPublishData('In App', 1002, false);
      const name: string = 'data-space-ok';
      const result: string = CommonEventPublisher.validatePublishRequest(name, publishData);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(publishData.data === 'In App'));
      expect(publishData.data === 'In App').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(publishData.code), String(1002));
      expect(publishData.code).assertEqual(1002);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEventNameDomain0027 end');
    })

    /**
     * @tc.name   testEventNameDomain0028
     * @tc.number SUB_CCER_PVALID_02_0028
     * @tc.desc   长度为 65540 的事件数据被拒并给出原因
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEventNameDomain0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEventNameDomain0028 begin');
      const publishData: commonEventManager.CommonEventPublishData =
        CommonEventPublisher.buildPublishData('q'.repeat(65540), 1002, false);
      const name: string = 'data-oversize';
      const result: string = CommonEventPublisher.validatePublishRequest(name, publishData);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('The event data must not exceed 64 KB.'));
      expect(result).assertEqual('The event data must not exceed 64 KB.');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String((publishData.data ?? '').length === 65540));
      expect((publishData.data ?? '').length === 65540).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(publishData.code), String(1002));
      expect(publishData.code).assertEqual(1002);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEventNameDomain0028 end');
    })

    /**
     * @tc.name   testEventNameDomain0029
     * @tc.number SUB_CCER_PVALID_02_0029
     * @tc.desc   事件名空格错误优先于数据超长错误
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEventNameDomain0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEventNameDomain0029 begin');
      const publishData: commonEventManager.CommonEventPublishData =
        CommonEventPublisher.buildPublishData('q'.repeat(65540), 1002, false);
      const name: string = ' padded ';
      const result: string = CommonEventPublisher.validatePublishRequest(name, publishData);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('The common event name must not start or end with spaces.'));
      expect(result).assertEqual('The common event name must not start or end with spaces.');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String((publishData.data ?? '').length === 65540));
      expect((publishData.data ?? '').length === 65540).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(publishData.code), String(1002));
      expect(publishData.code).assertEqual(1002);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEventNameDomain0029 end');
    })

    /**
     * @tc.name   testEventNameDomain0030
     * @tc.number SUB_CCER_PVALID_02_0030
     * @tc.desc   同一份数据下带空格名称被拒而零宽字符名称通过
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEventNameDomain0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEventNameDomain0030 begin');
      const publishData: commonEventManager.CommonEventPublishData =
        CommonEventPublisher.buildPublishData('InApp', 1002, false);
      const name: string = ' a'; const zw: string = CommonEventPublisher.validatePublishRequest('z​', publishData);
      const result: string = CommonEventPublisher.validatePublishRequest(name, publishData);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('The common event name must not start or end with spaces.'));
      expect(result).assertEqual('The common event name must not start or end with spaces.');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(zw), String(''));
      expect(zw).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(publishData.data === 'InApp'));
      expect(publishData.data === 'InApp').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testEventNameDomain0030 end');
    })

  })
}
