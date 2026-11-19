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
import { CommonEventConstants } from '../../../main/ets/util/Constants';
import { CommonEventPublisher } from '../../../main/ets/feature/CommonEventPublisher';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[SampleTest]';

export default function publishValidateTest() {
  describe('PublishValidateVolume01Test', () => {

    /**
     * @tc.name   testPublishValidate0001
     * @tc.number SUB_CCER_PVALID_01_0001
     * @tc.desc   合法事件名 1 通过发布前校验
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishValidate0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishValidate0001 begin');
      const publishData: commonEventManager.CommonEventPublishData =
        CommonEventPublisher.buildPublishData('InApp', 1002, false);
      const result: string = CommonEventPublisher.validatePublishRequest(CommonEventConstants.EVENT_NAME, publishData);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishValidate0001 end');
    })

    /**
     * @tc.name   testPublishValidate0002
     * @tc.number SUB_CCER_PVALID_01_0002
     * @tc.desc   合法事件名 2 通过发布前校验
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishValidate0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishValidate0002 begin');
      const publishData: commonEventManager.CommonEventPublishData =
        CommonEventPublisher.buildPublishData('InApp', 1002, false);
      const result: string = CommonEventPublisher.validatePublishRequest("Acts_CommonEvent_Test", publishData);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishValidate0002 end');
    })

    /**
     * @tc.name   testPublishValidate0003
     * @tc.number SUB_CCER_PVALID_01_0003
     * @tc.desc   合法事件名 3 通过发布前校验
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishValidate0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishValidate0003 begin');
      const publishData: commonEventManager.CommonEventPublishData =
        CommonEventPublisher.buildPublishData('InApp', 1002, false);
      const result: string = CommonEventPublisher.validatePublishRequest("a", publishData);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishValidate0003 end');
    })

    /**
     * @tc.name   testPublishValidate0004
     * @tc.number SUB_CCER_PVALID_01_0004
     * @tc.desc   合法事件名 4 通过发布前校验
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishValidate0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishValidate0004 begin');
      const publishData: commonEventManager.CommonEventPublishData =
        CommonEventPublisher.buildPublishData('InApp', 1002, false);
      const result: string = CommonEventPublisher.validatePublishRequest("ab", publishData);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishValidate0004 end');
    })

    /**
     * @tc.name   testPublishValidate0005
     * @tc.number SUB_CCER_PVALID_01_0005
     * @tc.desc   合法事件名 5 通过发布前校验
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishValidate0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishValidate0005 begin');
      const publishData: commonEventManager.CommonEventPublishData =
        CommonEventPublisher.buildPublishData('InApp', 1002, false);
      const result: string = CommonEventPublisher.validatePublishRequest("A", publishData);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishValidate0005 end');
    })

    /**
     * @tc.name   testPublishValidate0006
     * @tc.number SUB_CCER_PVALID_01_0006
     * @tc.desc   合法事件名 6 通过发布前校验
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishValidate0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishValidate0006 begin');
      const publishData: commonEventManager.CommonEventPublishData =
        CommonEventPublisher.buildPublishData('InApp', 1002, false);
      const result: string = CommonEventPublisher.validatePublishRequest("a.b.c", publishData);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishValidate0006 end');
    })

    /**
     * @tc.name   testPublishValidate0007
     * @tc.number SUB_CCER_PVALID_01_0007
     * @tc.desc   合法事件名 7 通过发布前校验
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishValidate0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishValidate0007 begin');
      const publishData: commonEventManager.CommonEventPublishData =
        CommonEventPublisher.buildPublishData('InApp', 1002, false);
      const result: string = CommonEventPublisher.validatePublishRequest("a_b", publishData);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishValidate0007 end');
    })

    /**
     * @tc.name   testPublishValidate0008
     * @tc.number SUB_CCER_PVALID_01_0008
     * @tc.desc   合法事件名 8 通过发布前校验
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishValidate0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishValidate0008 begin');
      const publishData: commonEventManager.CommonEventPublishData =
        CommonEventPublisher.buildPublishData('InApp', 1002, false);
      const result: string = CommonEventPublisher.validatePublishRequest("a-b", publishData);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishValidate0008 end');
    })

    /**
     * @tc.name   testPublishValidate0009
     * @tc.number SUB_CCER_PVALID_01_0009
     * @tc.desc   合法事件名 9 通过发布前校验
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishValidate0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishValidate0009 begin');
      const publishData: commonEventManager.CommonEventPublishData =
        CommonEventPublisher.buildPublishData('InApp', 1002, false);
      const result: string = CommonEventPublisher.validatePublishRequest("a1", publishData);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishValidate0009 end');
    })

    /**
     * @tc.name   testPublishValidate0010
     * @tc.number SUB_CCER_PVALID_01_0010
     * @tc.desc   合法事件名 10 通过发布前校验
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishValidate0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishValidate0010 begin');
      const publishData: commonEventManager.CommonEventPublishData =
        CommonEventPublisher.buildPublishData('InApp', 1002, false);
      const result: string = CommonEventPublisher.validatePublishRequest("中文事件", publishData);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishValidate0010 end');
    })

    /**
     * @tc.name   testPublishValidate0011
     * @tc.number SUB_CCER_PVALID_01_0011
     * @tc.desc   合法事件名 11 通过发布前校验
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishValidate0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishValidate0011 begin');
      const publishData: commonEventManager.CommonEventPublishData =
        CommonEventPublisher.buildPublishData('InApp', 1002, false);
      const result: string = CommonEventPublisher.validatePublishRequest("aaaaaaaaaa", publishData);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishValidate0011 end');
    })

    /**
     * @tc.name   testPublishValidate0012
     * @tc.number SUB_CCER_PVALID_01_0012
     * @tc.desc   合法事件名 12 通过发布前校验
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishValidate0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishValidate0012 begin');
      const publishData: commonEventManager.CommonEventPublishData =
        CommonEventPublisher.buildPublishData('InApp', 1002, false);
      const result: string = CommonEventPublisher.validatePublishRequest('a'.repeat(50), publishData);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishValidate0012 end');
    })

    /**
     * @tc.name   testPublishValidate0013
     * @tc.number SUB_CCER_PVALID_01_0013
     * @tc.desc   合法事件名 13 通过发布前校验
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishValidate0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishValidate0013 begin');
      const publishData: commonEventManager.CommonEventPublishData =
        CommonEventPublisher.buildPublishData('InApp', 1002, false);
      const result: string = CommonEventPublisher.validatePublishRequest('a'.repeat(100), publishData);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishValidate0013 end');
    })

    /**
     * @tc.name   testPublishValidate0014
     * @tc.number SUB_CCER_PVALID_01_0014
     * @tc.desc   合法事件名 14 通过发布前校验
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishValidate0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishValidate0014 begin');
      const publishData: commonEventManager.CommonEventPublishData =
        CommonEventPublisher.buildPublishData('InApp', 1002, false);
      const result: string = CommonEventPublisher.validatePublishRequest('a'.repeat(200), publishData);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishValidate0014 end');
    })

    /**
     * @tc.name   testPublishValidate0015
     * @tc.number SUB_CCER_PVALID_01_0015
     * @tc.desc   合法事件名 15 通过发布前校验
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishValidate0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishValidate0015 begin');
      const publishData: commonEventManager.CommonEventPublishData =
        CommonEventPublisher.buildPublishData('InApp', 1002, false);
      const result: string = CommonEventPublisher.validatePublishRequest('a'.repeat(255), publishData);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishValidate0015 end');
    })

    /**
     * @tc.name   testPublishValidate0016
     * @tc.number SUB_CCER_PVALID_01_0016
     * @tc.desc   合法事件名 16 通过发布前校验
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishValidate0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishValidate0016 begin');
      const publishData: commonEventManager.CommonEventPublishData =
        CommonEventPublisher.buildPublishData('InApp', 1002, false);
      const result: string = CommonEventPublisher.validatePublishRequest("com.example.event", publishData);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishValidate0016 end');
    })

    /**
     * @tc.name   testPublishValidate0017
     * @tc.number SUB_CCER_PVALID_01_0017
     * @tc.desc   合法事件名 17 通过发布前校验
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishValidate0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishValidate0017 begin');
      const publishData: commonEventManager.CommonEventPublishData =
        CommonEventPublisher.buildPublishData('InApp', 1002, false);
      const result: string = CommonEventPublisher.validatePublishRequest("E", publishData);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishValidate0017 end');
    })

    /**
     * @tc.name   testPublishValidate0018
     * @tc.number SUB_CCER_PVALID_01_0018
     * @tc.desc   合法事件名 18 通过发布前校验
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishValidate0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishValidate0018 begin');
      const publishData: commonEventManager.CommonEventPublishData =
        CommonEventPublisher.buildPublishData('InApp', 1002, false);
      const result: string = CommonEventPublisher.validatePublishRequest("e0", publishData);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishValidate0018 end');
    })

    /**
     * @tc.name   testPublishValidate0019
     * @tc.number SUB_CCER_PVALID_01_0019
     * @tc.desc   合法事件名 19 通过发布前校验
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishValidate0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishValidate0019 begin');
      const publishData: commonEventManager.CommonEventPublishData =
        CommonEventPublisher.buildPublishData('InApp', 1002, false);
      const result: string = CommonEventPublisher.validatePublishRequest("事件_01", publishData);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishValidate0019 end');
    })

    /**
     * @tc.name   testPublishValidate0020
     * @tc.number SUB_CCER_PVALID_01_0020
     * @tc.desc   合法事件名 20 通过发布前校验
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishValidate0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishValidate0020 begin');
      const publishData: commonEventManager.CommonEventPublishData =
        CommonEventPublisher.buildPublishData('InApp', 1002, false);
      const result: string = CommonEventPublisher.validatePublishRequest("event.with.dots", publishData);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === ''));
      expect(result === '').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishValidate0020 end');
    })

    /**
     * @tc.name   testPublishValidate0021
     * @tc.number SUB_CCER_PVALID_01_0021
     * @tc.desc   空事件名 "" 被拒并给出原因
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishValidate0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishValidate0021 begin');
      const publishData: commonEventManager.CommonEventPublishData =
        CommonEventPublisher.buildPublishData('InApp', 1002, false);
      const result: string = CommonEventPublisher.validatePublishRequest("", publishData);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('The common event name must not be empty.'));
      expect(result).assertEqual('The common event name must not be empty.');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('empty'));
      expect(result).assertContain('empty');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishValidate0021 end');
    })

    /**
     * @tc.name   testPublishValidate0022
     * @tc.number SUB_CCER_PVALID_01_0022
     * @tc.desc   空事件名 CommonEventConstants.EMPTY_VALUE 被拒并给出原因
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishValidate0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishValidate0022 begin');
      const publishData: commonEventManager.CommonEventPublishData =
        CommonEventPublisher.buildPublishData('InApp', 1002, false);
      const result: string = CommonEventPublisher.validatePublishRequest(CommonEventConstants.EMPTY_VALUE, publishData);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('The common event name must not be empty.'));
      expect(result).assertEqual('The common event name must not be empty.');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('empty'));
      expect(result).assertContain('empty');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishValidate0022 end');
    })

    /**
     * @tc.name   testPublishValidate0023
     * @tc.number SUB_CCER_PVALID_01_0023
     * @tc.desc   首部带空格的事件名 " a" 被拒
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishValidate0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishValidate0023 begin');
      const publishData: commonEventManager.CommonEventPublishData =
        CommonEventPublisher.buildPublishData('InApp', 1002, false);
      const result: string = CommonEventPublisher.validatePublishRequest(" a", publishData);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('The common event name must not start or end with spaces.'));
      expect(result).assertEqual('The common event name must not start or end with spaces.');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('spaces'));
      expect(result).assertContain('spaces');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishValidate0023 end');
    })

    /**
     * @tc.name   testPublishValidate0024
     * @tc.number SUB_CCER_PVALID_01_0024
     * @tc.desc   首部带空格的事件名 "  a" 被拒
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishValidate0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishValidate0024 begin');
      const publishData: commonEventManager.CommonEventPublishData =
        CommonEventPublisher.buildPublishData('InApp', 1002, false);
      const result: string = CommonEventPublisher.validatePublishRequest("  a", publishData);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('The common event name must not start or end with spaces.'));
      expect(result).assertEqual('The common event name must not start or end with spaces.');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('spaces'));
      expect(result).assertContain('spaces');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishValidate0024 end');
    })

    /**
     * @tc.name   testPublishValidate0025
     * @tc.number SUB_CCER_PVALID_01_0025
     * @tc.desc   首部带空格的事件名 " Acts" 被拒
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishValidate0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishValidate0025 begin');
      const publishData: commonEventManager.CommonEventPublishData =
        CommonEventPublisher.buildPublishData('InApp', 1002, false);
      const result: string = CommonEventPublisher.validatePublishRequest(" Acts", publishData);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('The common event name must not start or end with spaces.'));
      expect(result).assertEqual('The common event name must not start or end with spaces.');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('spaces'));
      expect(result).assertContain('spaces');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishValidate0025 end');
    })

    /**
     * @tc.name   testPublishValidate0026
     * @tc.number SUB_CCER_PVALID_01_0026
     * @tc.desc   首部带空格的事件名 "  中文" 被拒
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishValidate0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishValidate0026 begin');
      const publishData: commonEventManager.CommonEventPublishData =
        CommonEventPublisher.buildPublishData('InApp', 1002, false);
      const result: string = CommonEventPublisher.validatePublishRequest("  中文", publishData);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('The common event name must not start or end with spaces.'));
      expect(result).assertEqual('The common event name must not start or end with spaces.');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('spaces'));
      expect(result).assertContain('spaces');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishValidate0026 end');
    })

    /**
     * @tc.name   testPublishValidate0027
     * @tc.number SUB_CCER_PVALID_01_0027
     * @tc.desc   首部带空格的事件名 " a_b" 被拒
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishValidate0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishValidate0027 begin');
      const publishData: commonEventManager.CommonEventPublishData =
        CommonEventPublisher.buildPublishData('InApp', 1002, false);
      const result: string = CommonEventPublisher.validatePublishRequest(" a_b", publishData);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('The common event name must not start or end with spaces.'));
      expect(result).assertEqual('The common event name must not start or end with spaces.');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('spaces'));
      expect(result).assertContain('spaces');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishValidate0027 end');
    })

    /**
     * @tc.name   testPublishValidate0028
     * @tc.number SUB_CCER_PVALID_01_0028
     * @tc.desc   尾部带空格的事件名 "a " 被拒
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishValidate0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishValidate0028 begin');
      const publishData: commonEventManager.CommonEventPublishData =
        CommonEventPublisher.buildPublishData('InApp', 1002, false);
      const result: string = CommonEventPublisher.validatePublishRequest("a ", publishData);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('The common event name must not start or end with spaces.'));
      expect(result).assertEqual('The common event name must not start or end with spaces.');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('spaces'));
      expect(result).assertContain('spaces');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishValidate0028 end');
    })

    /**
     * @tc.name   testPublishValidate0029
     * @tc.number SUB_CCER_PVALID_01_0029
     * @tc.desc   尾部带空格的事件名 "a  " 被拒
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishValidate0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishValidate0029 begin');
      const publishData: commonEventManager.CommonEventPublishData =
        CommonEventPublisher.buildPublishData('InApp', 1002, false);
      const result: string = CommonEventPublisher.validatePublishRequest("a  ", publishData);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('The common event name must not start or end with spaces.'));
      expect(result).assertEqual('The common event name must not start or end with spaces.');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('spaces'));
      expect(result).assertContain('spaces');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishValidate0029 end');
    })

    /**
     * @tc.name   testPublishValidate0030
     * @tc.number SUB_CCER_PVALID_01_0030
     * @tc.desc   尾部带空格的事件名 "Acts " 被拒
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishValidate0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishValidate0030 begin');
      const publishData: commonEventManager.CommonEventPublishData =
        CommonEventPublisher.buildPublishData('InApp', 1002, false);
      const result: string = CommonEventPublisher.validatePublishRequest("Acts ", publishData);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('The common event name must not start or end with spaces.'));
      expect(result).assertEqual('The common event name must not start or end with spaces.');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('spaces'));
      expect(result).assertContain('spaces');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishValidate0030 end');
    })

    /**
     * @tc.name   testPublishValidate0031
     * @tc.number SUB_CCER_PVALID_01_0031
     * @tc.desc   尾部带空格的事件名 "中文  " 被拒
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishValidate0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishValidate0031 begin');
      const publishData: commonEventManager.CommonEventPublishData =
        CommonEventPublisher.buildPublishData('InApp', 1002, false);
      const result: string = CommonEventPublisher.validatePublishRequest("中文  ", publishData);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('The common event name must not start or end with spaces.'));
      expect(result).assertEqual('The common event name must not start or end with spaces.');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('spaces'));
      expect(result).assertContain('spaces');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishValidate0031 end');
    })

    /**
     * @tc.name   testPublishValidate0032
     * @tc.number SUB_CCER_PVALID_01_0032
     * @tc.desc   尾部带空格的事件名 "a_b " 被拒
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishValidate0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishValidate0032 begin');
      const publishData: commonEventManager.CommonEventPublishData =
        CommonEventPublisher.buildPublishData('InApp', 1002, false);
      const result: string = CommonEventPublisher.validatePublishRequest("a_b ", publishData);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('The common event name must not start or end with spaces.'));
      expect(result).assertEqual('The common event name must not start or end with spaces.');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('spaces'));
      expect(result).assertContain('spaces');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishValidate0032 end');
    })

    /**
     * @tc.name   testPublishValidate0033
     * @tc.number SUB_CCER_PVALID_01_0033
     * @tc.desc   两端带空格的事件名 " a " 被拒
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishValidate0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishValidate0033 begin');
      const publishData: commonEventManager.CommonEventPublishData =
        CommonEventPublisher.buildPublishData('InApp', 1002, false);
      const result: string = CommonEventPublisher.validatePublishRequest(" a ", publishData);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('The common event name must not start or end with spaces.'));
      expect(result).assertEqual('The common event name must not start or end with spaces.');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('spaces'));
      expect(result).assertContain('spaces');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishValidate0033 end');
    })

    /**
     * @tc.name   testPublishValidate0034
     * @tc.number SUB_CCER_PVALID_01_0034
     * @tc.desc   两端带空格的事件名 "  a  " 被拒
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishValidate0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishValidate0034 begin');
      const publishData: commonEventManager.CommonEventPublishData =
        CommonEventPublisher.buildPublishData('InApp', 1002, false);
      const result: string = CommonEventPublisher.validatePublishRequest("  a  ", publishData);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('The common event name must not start or end with spaces.'));
      expect(result).assertEqual('The common event name must not start or end with spaces.');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('spaces'));
      expect(result).assertContain('spaces');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishValidate0034 end');
    })

    /**
     * @tc.name   testPublishValidate0035
     * @tc.number SUB_CCER_PVALID_01_0035
     * @tc.desc   两端带空格的事件名 " Acts " 被拒
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishValidate0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishValidate0035 begin');
      const publishData: commonEventManager.CommonEventPublishData =
        CommonEventPublisher.buildPublishData('InApp', 1002, false);
      const result: string = CommonEventPublisher.validatePublishRequest(" Acts ", publishData);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('The common event name must not start or end with spaces.'));
      expect(result).assertEqual('The common event name must not start or end with spaces.');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('spaces'));
      expect(result).assertContain('spaces');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishValidate0035 end');
    })

    /**
     * @tc.name   testPublishValidate0036
     * @tc.number SUB_CCER_PVALID_01_0036
     * @tc.desc   两端带空格的事件名 " 中文 " 被拒
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishValidate0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishValidate0036 begin');
      const publishData: commonEventManager.CommonEventPublishData =
        CommonEventPublisher.buildPublishData('InApp', 1002, false);
      const result: string = CommonEventPublisher.validatePublishRequest(" 中文 ", publishData);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('The common event name must not start or end with spaces.'));
      expect(result).assertEqual('The common event name must not start or end with spaces.');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('spaces'));
      expect(result).assertContain('spaces');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishValidate0036 end');
    })

    /**
     * @tc.name   testPublishValidate0037
     * @tc.number SUB_CCER_PVALID_01_0037
     * @tc.desc   两端带空格的事件名 " a_b " 被拒
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishValidate0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishValidate0037 begin');
      const publishData: commonEventManager.CommonEventPublishData =
        CommonEventPublisher.buildPublishData('InApp', 1002, false);
      const result: string = CommonEventPublisher.validatePublishRequest(" a_b ", publishData);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('The common event name must not start or end with spaces.'));
      expect(result).assertEqual('The common event name must not start or end with spaces.');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('spaces'));
      expect(result).assertContain('spaces');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishValidate0037 end');
    })

    /**
     * @tc.name   testPublishValidate0038
     * @tc.number SUB_CCER_PVALID_01_0038
     * @tc.desc   长度为 65537 的事件数据被拒
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishValidate0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishValidate0038 begin');
      const publishData: commonEventManager.CommonEventPublishData =
        CommonEventPublisher.buildPublishData('a'.repeat(65537), 1002, false);
      const result: string = CommonEventPublisher.validatePublishRequest(CommonEventConstants.EVENT_NAME, publishData);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('The event data must not exceed 64 KB.'));
      expect(result).assertEqual('The event data must not exceed 64 KB.');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('64 KB'));
      expect(result).assertContain('64 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishValidate0038 end');
    })

    /**
     * @tc.name   testPublishValidate0039
     * @tc.number SUB_CCER_PVALID_01_0039
     * @tc.desc   长度为 66000 的事件数据被拒
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishValidate0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishValidate0039 begin');
      const publishData: commonEventManager.CommonEventPublishData =
        CommonEventPublisher.buildPublishData('a'.repeat(66000), 1002, false);
      const result: string = CommonEventPublisher.validatePublishRequest(CommonEventConstants.EVENT_NAME, publishData);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('The event data must not exceed 64 KB.'));
      expect(result).assertEqual('The event data must not exceed 64 KB.');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('64 KB'));
      expect(result).assertContain('64 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishValidate0039 end');
    })

    /**
     * @tc.name   testPublishValidate0040
     * @tc.number SUB_CCER_PVALID_01_0040
     * @tc.desc   长度为 70000 的事件数据被拒
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishValidate0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishValidate0040 begin');
      const publishData: commonEventManager.CommonEventPublishData =
        CommonEventPublisher.buildPublishData('a'.repeat(70000), 1002, false);
      const result: string = CommonEventPublisher.validatePublishRequest(CommonEventConstants.EVENT_NAME, publishData);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('The event data must not exceed 64 KB.'));
      expect(result).assertEqual('The event data must not exceed 64 KB.');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('64 KB'));
      expect(result).assertContain('64 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishValidate0040 end');
    })

    /**
     * @tc.name   testPublishValidate0041
     * @tc.number SUB_CCER_PVALID_01_0041
     * @tc.desc   长度为 100000 的事件数据被拒
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishValidate0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishValidate0041 begin');
      const publishData: commonEventManager.CommonEventPublishData =
        CommonEventPublisher.buildPublishData('a'.repeat(100000), 1002, false);
      const result: string = CommonEventPublisher.validatePublishRequest(CommonEventConstants.EVENT_NAME, publishData);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('The event data must not exceed 64 KB.'));
      expect(result).assertEqual('The event data must not exceed 64 KB.');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('64 KB'));
      expect(result).assertContain('64 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishValidate0041 end');
    })

    /**
     * @tc.name   testPublishValidate0042
     * @tc.number SUB_CCER_PVALID_01_0042
     * @tc.desc   长度为 131072 的事件数据被拒
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishValidate0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishValidate0042 begin');
      const publishData: commonEventManager.CommonEventPublishData =
        CommonEventPublisher.buildPublishData('a'.repeat(131072), 1002, false);
      const result: string = CommonEventPublisher.validatePublishRequest(CommonEventConstants.EVENT_NAME, publishData);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('The event data must not exceed 64 KB.'));
      expect(result).assertEqual('The event data must not exceed 64 KB.');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('64 KB'));
      expect(result).assertContain('64 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishValidate0042 end');
    })

    /**
     * @tc.name   testPublishValidate0043
     * @tc.number SUB_CCER_PVALID_01_0043
     * @tc.desc   长度为 200000 的事件数据被拒
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishValidate0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishValidate0043 begin');
      const publishData: commonEventManager.CommonEventPublishData =
        CommonEventPublisher.buildPublishData('a'.repeat(200000), 1002, false);
      const result: string = CommonEventPublisher.validatePublishRequest(CommonEventConstants.EVENT_NAME, publishData);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('The event data must not exceed 64 KB.'));
      expect(result).assertEqual('The event data must not exceed 64 KB.');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('64 KB'));
      expect(result).assertContain('64 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishValidate0043 end');
    })

    /**
     * @tc.name   testPublishValidate0044
     * @tc.number SUB_CCER_PVALID_01_0044
     * @tc.desc   长度为 262144 的事件数据被拒
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishValidate0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishValidate0044 begin');
      const publishData: commonEventManager.CommonEventPublishData =
        CommonEventPublisher.buildPublishData('a'.repeat(262144), 1002, false);
      const result: string = CommonEventPublisher.validatePublishRequest(CommonEventConstants.EVENT_NAME, publishData);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('The event data must not exceed 64 KB.'));
      expect(result).assertEqual('The event data must not exceed 64 KB.');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('64 KB'));
      expect(result).assertContain('64 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishValidate0044 end');
    })

    /**
     * @tc.name   testPublishValidate0045
     * @tc.number SUB_CCER_PVALID_01_0045
     * @tc.desc   长度为 524288 的事件数据被拒
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishValidate0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishValidate0045 begin');
      const publishData: commonEventManager.CommonEventPublishData =
        CommonEventPublisher.buildPublishData('a'.repeat(524288), 1002, false);
      const result: string = CommonEventPublisher.validatePublishRequest(CommonEventConstants.EVENT_NAME, publishData);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('The event data must not exceed 64 KB.'));
      expect(result).assertEqual('The event data must not exceed 64 KB.');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('64 KB'));
      expect(result).assertContain('64 KB');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.length > 0));
      expect(result.length > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishValidate0045 end');
    })

    /**
     * @tc.name   testPublishValidate0046
     * @tc.number SUB_CCER_PVALID_01_0046
     * @tc.desc   64 KB 事件数据通过长度校验
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishValidate0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishValidate0046 begin');
      const publishData: commonEventManager.CommonEventPublishData =
        CommonEventPublisher.buildPublishData('a'.repeat(65536), 1002, false);
      const result: string = CommonEventPublisher.validatePublishRequest(CommonEventConstants.EVENT_NAME, publishData);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s',
        String(CommonEventPublisher.isDataLengthValid('a'.repeat(65536))));
      expect(CommonEventPublisher.isDataLengthValid('a'.repeat(65536))).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishValidate0046 end');
    })

  })
}
