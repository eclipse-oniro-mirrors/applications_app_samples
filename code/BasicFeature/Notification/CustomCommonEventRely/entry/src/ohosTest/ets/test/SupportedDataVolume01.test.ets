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
import { CommonEventConstants, EventSource } from '../../../main/ets/util/Constants';
import { CommonEventPublisher } from '../../../main/ets/feature/CommonEventPublisher';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[SampleTest]';

export default function supportedGateTest() {
  describe('SupportedDataVolume01Test', () => {

    /**
     * @tc.name   testSupportedGate0001
     * @tc.number SUB_CCER_SUPDATA_0001
     * @tc.desc   数据 "InApp" 的受支持判定为 true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSupportedGate0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSupportedGate0001 begin');
      const data: string = 'InApp';
      const result: boolean = CommonEventPublisher.isSupportedData(data);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(CommonEventPublisher.isSupportedData(data + 'x')), String(false));
      expect(CommonEventPublisher.isSupportedData(data + 'x')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(CommonEventPublisher.isSupportedData(data.trim())), String(true));
      expect(CommonEventPublisher.isSupportedData(data.trim())).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSupportedGate0001 end');
    })

    /**
     * @tc.name   testSupportedGate0002
     * @tc.number SUB_CCER_SUPDATA_0002
     * @tc.desc   数据 "OutApp" 的受支持判定为 true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSupportedGate0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSupportedGate0002 begin');
      const data: string = 'OutApp';
      const result: boolean = CommonEventPublisher.isSupportedData(data);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(true));
      expect(result).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(CommonEventPublisher.isSupportedData(data + 'x')), String(false));
      expect(CommonEventPublisher.isSupportedData(data + 'x')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(CommonEventPublisher.isSupportedData(data.trim())), String(true));
      expect(CommonEventPublisher.isSupportedData(data.trim())).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSupportedGate0002 end');
    })

    /**
     * @tc.name   testSupportedGate0003
     * @tc.number SUB_CCER_SUPDATA_0003
     * @tc.desc   数据 "" 的受支持判定为 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSupportedGate0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSupportedGate0003 begin');
      const data: string = '';
      const result: boolean = CommonEventPublisher.isSupportedData(data);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(CommonEventPublisher.isSupportedData(data + 'x')), String(false));
      expect(CommonEventPublisher.isSupportedData(data + 'x')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(CommonEventPublisher.isSupportedData(data.trim())), String(false));
      expect(CommonEventPublisher.isSupportedData(data.trim())).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSupportedGate0003 end');
    })

    /**
     * @tc.name   testSupportedGate0004
     * @tc.number SUB_CCER_SUPDATA_0004
     * @tc.desc   数据 " " 的受支持判定为 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSupportedGate0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSupportedGate0004 begin');
      const data: string = ' ';
      const result: boolean = CommonEventPublisher.isSupportedData(data);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(CommonEventPublisher.isSupportedData(data + 'x')), String(false));
      expect(CommonEventPublisher.isSupportedData(data + 'x')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(CommonEventPublisher.isSupportedData(data.trim())), String(false));
      expect(CommonEventPublisher.isSupportedData(data.trim())).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSupportedGate0004 end');
    })

    /**
     * @tc.name   testSupportedGate0005
     * @tc.number SUB_CCER_SUPDATA_0005
     * @tc.desc   数据 "inapp" 的受支持判定为 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSupportedGate0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSupportedGate0005 begin');
      const data: string = 'inapp';
      const result: boolean = CommonEventPublisher.isSupportedData(data);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(CommonEventPublisher.isSupportedData(data + 'x')), String(false));
      expect(CommonEventPublisher.isSupportedData(data + 'x')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(CommonEventPublisher.isSupportedData(data.trim())), String(false));
      expect(CommonEventPublisher.isSupportedData(data.trim())).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSupportedGate0005 end');
    })

    /**
     * @tc.name   testSupportedGate0006
     * @tc.number SUB_CCER_SUPDATA_0006
     * @tc.desc   数据 "outapp" 的受支持判定为 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSupportedGate0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSupportedGate0006 begin');
      const data: string = 'outapp';
      const result: boolean = CommonEventPublisher.isSupportedData(data);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(CommonEventPublisher.isSupportedData(data + 'x')), String(false));
      expect(CommonEventPublisher.isSupportedData(data + 'x')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(CommonEventPublisher.isSupportedData(data.trim())), String(false));
      expect(CommonEventPublisher.isSupportedData(data.trim())).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSupportedGate0006 end');
    })

    /**
     * @tc.name   testSupportedGate0007
     * @tc.number SUB_CCER_SUPDATA_0007
     * @tc.desc   数据 "INAPP" 的受支持判定为 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSupportedGate0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSupportedGate0007 begin');
      const data: string = 'INAPP';
      const result: boolean = CommonEventPublisher.isSupportedData(data);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(CommonEventPublisher.isSupportedData(data + 'x')), String(false));
      expect(CommonEventPublisher.isSupportedData(data + 'x')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(CommonEventPublisher.isSupportedData(data.trim())), String(false));
      expect(CommonEventPublisher.isSupportedData(data.trim())).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSupportedGate0007 end');
    })

    /**
     * @tc.name   testSupportedGate0008
     * @tc.number SUB_CCER_SUPDATA_0008
     * @tc.desc   数据 "OUTAPP" 的受支持判定为 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSupportedGate0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSupportedGate0008 begin');
      const data: string = 'OUTAPP';
      const result: boolean = CommonEventPublisher.isSupportedData(data);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(CommonEventPublisher.isSupportedData(data + 'x')), String(false));
      expect(CommonEventPublisher.isSupportedData(data + 'x')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(CommonEventPublisher.isSupportedData(data.trim())), String(false));
      expect(CommonEventPublisher.isSupportedData(data.trim())).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSupportedGate0008 end');
    })

    /**
     * @tc.name   testSupportedGate0009
     * @tc.number SUB_CCER_SUPDATA_0009
     * @tc.desc   数据 "InApp " 的受支持判定为 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSupportedGate0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSupportedGate0009 begin');
      const data: string = 'InApp ';
      const result: boolean = CommonEventPublisher.isSupportedData(data);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(CommonEventPublisher.isSupportedData(data + 'x')), String(false));
      expect(CommonEventPublisher.isSupportedData(data + 'x')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(CommonEventPublisher.isSupportedData(data.trim())), String(true));
      expect(CommonEventPublisher.isSupportedData(data.trim())).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSupportedGate0009 end');
    })

    /**
     * @tc.name   testSupportedGate0010
     * @tc.number SUB_CCER_SUPDATA_0010
     * @tc.desc   数据 " InApp" 的受支持判定为 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSupportedGate0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSupportedGate0010 begin');
      const data: string = ' InApp';
      const result: boolean = CommonEventPublisher.isSupportedData(data);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(CommonEventPublisher.isSupportedData(data + 'x')), String(false));
      expect(CommonEventPublisher.isSupportedData(data + 'x')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(CommonEventPublisher.isSupportedData(data.trim())), String(true));
      expect(CommonEventPublisher.isSupportedData(data.trim())).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSupportedGate0010 end');
    })

    /**
     * @tc.name   testSupportedGate0011
     * @tc.number SUB_CCER_SUPDATA_0011
     * @tc.desc   数据 "OutApp " 的受支持判定为 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSupportedGate0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSupportedGate0011 begin');
      const data: string = 'OutApp ';
      const result: boolean = CommonEventPublisher.isSupportedData(data);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(CommonEventPublisher.isSupportedData(data + 'x')), String(false));
      expect(CommonEventPublisher.isSupportedData(data + 'x')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(CommonEventPublisher.isSupportedData(data.trim())), String(true));
      expect(CommonEventPublisher.isSupportedData(data.trim())).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSupportedGate0011 end');
    })

    /**
     * @tc.name   testSupportedGate0012
     * @tc.number SUB_CCER_SUPDATA_0012
     * @tc.desc   数据 " OutApp" 的受支持判定为 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSupportedGate0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSupportedGate0012 begin');
      const data: string = ' OutApp';
      const result: boolean = CommonEventPublisher.isSupportedData(data);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(CommonEventPublisher.isSupportedData(data + 'x')), String(false));
      expect(CommonEventPublisher.isSupportedData(data + 'x')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(CommonEventPublisher.isSupportedData(data.trim())), String(true));
      expect(CommonEventPublisher.isSupportedData(data.trim())).assertEqual(true);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSupportedGate0012 end');
    })

    /**
     * @tc.name   testSupportedGate0013
     * @tc.number SUB_CCER_SUPDATA_0013
     * @tc.desc   数据 "InAppx" 的受支持判定为 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSupportedGate0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSupportedGate0013 begin');
      const data: string = 'InAppx';
      const result: boolean = CommonEventPublisher.isSupportedData(data);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(CommonEventPublisher.isSupportedData(data + 'x')), String(false));
      expect(CommonEventPublisher.isSupportedData(data + 'x')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(CommonEventPublisher.isSupportedData(data.trim())), String(false));
      expect(CommonEventPublisher.isSupportedData(data.trim())).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSupportedGate0013 end');
    })

    /**
     * @tc.name   testSupportedGate0014
     * @tc.number SUB_CCER_SUPDATA_0014
     * @tc.desc   数据 "OutAppx" 的受支持判定为 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSupportedGate0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSupportedGate0014 begin');
      const data: string = 'OutAppx';
      const result: boolean = CommonEventPublisher.isSupportedData(data);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(CommonEventPublisher.isSupportedData(data + 'x')), String(false));
      expect(CommonEventPublisher.isSupportedData(data + 'x')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(CommonEventPublisher.isSupportedData(data.trim())), String(false));
      expect(CommonEventPublisher.isSupportedData(data.trim())).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSupportedGate0014 end');
    })

    /**
     * @tc.name   testSupportedGate0015
     * @tc.number SUB_CCER_SUPDATA_0015
     * @tc.desc   数据 "InAp" 的受支持判定为 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSupportedGate0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSupportedGate0015 begin');
      const data: string = 'InAp';
      const result: boolean = CommonEventPublisher.isSupportedData(data);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(CommonEventPublisher.isSupportedData(data + 'x')), String(false));
      expect(CommonEventPublisher.isSupportedData(data + 'x')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(CommonEventPublisher.isSupportedData(data.trim())), String(false));
      expect(CommonEventPublisher.isSupportedData(data.trim())).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSupportedGate0015 end');
    })

    /**
     * @tc.name   testSupportedGate0016
     * @tc.number SUB_CCER_SUPDATA_0016
     * @tc.desc   数据 "OutAp" 的受支持判定为 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSupportedGate0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSupportedGate0016 begin');
      const data: string = 'OutAp';
      const result: boolean = CommonEventPublisher.isSupportedData(data);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(CommonEventPublisher.isSupportedData(data + 'x')), String(false));
      expect(CommonEventPublisher.isSupportedData(data + 'x')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(CommonEventPublisher.isSupportedData(data.trim())), String(false));
      expect(CommonEventPublisher.isSupportedData(data.trim())).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSupportedGate0016 end');
    })

    /**
     * @tc.name   testSupportedGate0017
     * @tc.number SUB_CCER_SUPDATA_0017
     * @tc.desc   数据 "In_App" 的受支持判定为 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSupportedGate0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSupportedGate0017 begin');
      const data: string = 'In_App';
      const result: boolean = CommonEventPublisher.isSupportedData(data);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(CommonEventPublisher.isSupportedData(data + 'x')), String(false));
      expect(CommonEventPublisher.isSupportedData(data + 'x')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(CommonEventPublisher.isSupportedData(data.trim())), String(false));
      expect(CommonEventPublisher.isSupportedData(data.trim())).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSupportedGate0017 end');
    })

    /**
     * @tc.name   testSupportedGate0018
     * @tc.number SUB_CCER_SUPDATA_0018
     * @tc.desc   数据 "Out_App" 的受支持判定为 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSupportedGate0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSupportedGate0018 begin');
      const data: string = 'Out_App';
      const result: boolean = CommonEventPublisher.isSupportedData(data);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(CommonEventPublisher.isSupportedData(data + 'x')), String(false));
      expect(CommonEventPublisher.isSupportedData(data + 'x')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(CommonEventPublisher.isSupportedData(data.trim())), String(false));
      expect(CommonEventPublisher.isSupportedData(data.trim())).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSupportedGate0018 end');
    })

    /**
     * @tc.name   testSupportedGate0019
     * @tc.number SUB_CCER_SUPDATA_0019
     * @tc.desc   数据 "in_app" 的受支持判定为 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSupportedGate0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSupportedGate0019 begin');
      const data: string = 'in_app';
      const result: boolean = CommonEventPublisher.isSupportedData(data);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(CommonEventPublisher.isSupportedData(data + 'x')), String(false));
      expect(CommonEventPublisher.isSupportedData(data + 'x')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(CommonEventPublisher.isSupportedData(data.trim())), String(false));
      expect(CommonEventPublisher.isSupportedData(data.trim())).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSupportedGate0019 end');
    })

    /**
     * @tc.name   testSupportedGate0020
     * @tc.number SUB_CCER_SUPDATA_0020
     * @tc.desc   数据 "out_app" 的受支持判定为 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSupportedGate0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSupportedGate0020 begin');
      const data: string = 'out_app';
      const result: boolean = CommonEventPublisher.isSupportedData(data);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(CommonEventPublisher.isSupportedData(data + 'x')), String(false));
      expect(CommonEventPublisher.isSupportedData(data + 'x')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(CommonEventPublisher.isSupportedData(data.trim())), String(false));
      expect(CommonEventPublisher.isSupportedData(data.trim())).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSupportedGate0020 end');
    })

    /**
     * @tc.name   testSupportedGate0021
     * @tc.number SUB_CCER_SUPDATA_0021
     * @tc.desc   数据 "Custom" 的受支持判定为 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSupportedGate0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSupportedGate0021 begin');
      const data: string = 'Custom';
      const result: boolean = CommonEventPublisher.isSupportedData(data);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(CommonEventPublisher.isSupportedData(data + 'x')), String(false));
      expect(CommonEventPublisher.isSupportedData(data + 'x')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(CommonEventPublisher.isSupportedData(data.trim())), String(false));
      expect(CommonEventPublisher.isSupportedData(data.trim())).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSupportedGate0021 end');
    })

    /**
     * @tc.name   testSupportedGate0022
     * @tc.number SUB_CCER_SUPDATA_0022
     * @tc.desc   数据 "unknown" 的受支持判定为 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSupportedGate0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSupportedGate0022 begin');
      const data: string = 'unknown';
      const result: boolean = CommonEventPublisher.isSupportedData(data);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(CommonEventPublisher.isSupportedData(data + 'x')), String(false));
      expect(CommonEventPublisher.isSupportedData(data + 'x')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(CommonEventPublisher.isSupportedData(data.trim())), String(false));
      expect(CommonEventPublisher.isSupportedData(data.trim())).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSupportedGate0022 end');
    })

    /**
     * @tc.name   testSupportedGate0023
     * @tc.number SUB_CCER_SUPDATA_0023
     * @tc.desc   数据 "InAppInApp" 的受支持判定为 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSupportedGate0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSupportedGate0023 begin');
      const data: string = 'InAppInApp';
      const result: boolean = CommonEventPublisher.isSupportedData(data);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(CommonEventPublisher.isSupportedData(data + 'x')), String(false));
      expect(CommonEventPublisher.isSupportedData(data + 'x')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(CommonEventPublisher.isSupportedData(data.trim())), String(false));
      expect(CommonEventPublisher.isSupportedData(data.trim())).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSupportedGate0023 end');
    })

    /**
     * @tc.name   testSupportedGate0024
     * @tc.number SUB_CCER_SUPDATA_0024
     * @tc.desc   数据 "OutAppInApp" 的受支持判定为 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSupportedGate0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSupportedGate0024 begin');
      const data: string = 'OutAppInApp';
      const result: boolean = CommonEventPublisher.isSupportedData(data);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(CommonEventPublisher.isSupportedData(data + 'x')), String(false));
      expect(CommonEventPublisher.isSupportedData(data + 'x')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(CommonEventPublisher.isSupportedData(data.trim())), String(false));
      expect(CommonEventPublisher.isSupportedData(data.trim())).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSupportedGate0024 end');
    })

    /**
     * @tc.name   testSupportedGate0025
     * @tc.number SUB_CCER_SUPDATA_0025
     * @tc.desc   数据 "In App" 的受支持判定为 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSupportedGate0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSupportedGate0025 begin');
      const data: string = 'In App';
      const result: boolean = CommonEventPublisher.isSupportedData(data);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(CommonEventPublisher.isSupportedData(data + 'x')), String(false));
      expect(CommonEventPublisher.isSupportedData(data + 'x')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(CommonEventPublisher.isSupportedData(data.trim())), String(false));
      expect(CommonEventPublisher.isSupportedData(data.trim())).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSupportedGate0025 end');
    })

    /**
     * @tc.name   testSupportedGate0026
     * @tc.number SUB_CCER_SUPDATA_0026
     * @tc.desc   数据 "Out App" 的受支持判定为 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSupportedGate0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSupportedGate0026 begin');
      const data: string = 'Out App';
      const result: boolean = CommonEventPublisher.isSupportedData(data);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(CommonEventPublisher.isSupportedData(data + 'x')), String(false));
      expect(CommonEventPublisher.isSupportedData(data + 'x')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(CommonEventPublisher.isSupportedData(data.trim())), String(false));
      expect(CommonEventPublisher.isSupportedData(data.trim())).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSupportedGate0026 end');
    })

    /**
     * @tc.name   testSupportedGate0027
     * @tc.number SUB_CCER_SUPDATA_0027
     * @tc.desc   数据 "InAppOutApp" 的受支持判定为 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSupportedGate0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSupportedGate0027 begin');
      const data: string = 'InAppOutApp';
      const result: boolean = CommonEventPublisher.isSupportedData(data);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(CommonEventPublisher.isSupportedData(data + 'x')), String(false));
      expect(CommonEventPublisher.isSupportedData(data + 'x')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(CommonEventPublisher.isSupportedData(data.trim())), String(false));
      expect(CommonEventPublisher.isSupportedData(data.trim())).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSupportedGate0027 end');
    })

    /**
     * @tc.name   testSupportedGate0028
     * @tc.number SUB_CCER_SUPDATA_0028
     * @tc.desc   数据 "0" 的受支持判定为 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSupportedGate0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSupportedGate0028 begin');
      const data: string = '0';
      const result: boolean = CommonEventPublisher.isSupportedData(data);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(CommonEventPublisher.isSupportedData(data + 'x')), String(false));
      expect(CommonEventPublisher.isSupportedData(data + 'x')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(CommonEventPublisher.isSupportedData(data.trim())), String(false));
      expect(CommonEventPublisher.isSupportedData(data.trim())).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSupportedGate0028 end');
    })

    /**
     * @tc.name   testSupportedGate0029
     * @tc.number SUB_CCER_SUPDATA_0029
     * @tc.desc   数据 "true" 的受支持判定为 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSupportedGate0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSupportedGate0029 begin');
      const data: string = 'true';
      const result: boolean = CommonEventPublisher.isSupportedData(data);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(CommonEventPublisher.isSupportedData(data + 'x')), String(false));
      expect(CommonEventPublisher.isSupportedData(data + 'x')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(CommonEventPublisher.isSupportedData(data.trim())), String(false));
      expect(CommonEventPublisher.isSupportedData(data.trim())).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSupportedGate0029 end');
    })

    /**
     * @tc.name   testSupportedGate0030
     * @tc.number SUB_CCER_SUPDATA_0030
     * @tc.desc   数据 "null" 的受支持判定为 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSupportedGate0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSupportedGate0030 begin');
      const data: string = 'null';
      const result: boolean = CommonEventPublisher.isSupportedData(data);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(false));
      expect(result).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(CommonEventPublisher.isSupportedData(data + 'x')), String(false));
      expect(CommonEventPublisher.isSupportedData(data + 'x')).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(CommonEventPublisher.isSupportedData(data.trim())), String(false));
      expect(CommonEventPublisher.isSupportedData(data.trim())).assertEqual(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSupportedGate0030 end');
    })

    /**
     * @tc.name   testSupportedGate0031
     * @tc.number SUB_CCER_SUPDATA_0031
     * @tc.desc   首字母大写不区分之外的所有变体均不被接受
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSupportedGate0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSupportedGate0031 begin');
      expect(CommonEventPublisher.isSupportedData('Inapp')).assertFalse();
      expect(CommonEventPublisher.isSupportedData('OUTAPP')).assertFalse();
      expect(CommonEventPublisher.isSupportedData('In App')).assertFalse();
      expect(CommonEventPublisher.isSupportedData(CommonEventConstants.EMPTY_VALUE)).assertFalse();
      expect(CommonEventPublisher.isSupportedData(CommonEventConstants.DATA_OUT_APP)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSupportedGate0031 end');
    })
  })
}
