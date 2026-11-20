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
import { FormEventService } from '../../../main/ets/feature/FormEventService';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[SampleTest]';

export default function bindingCountTest() {
  describe('BindingDataVolume01Test', () => {

    /**
     * @tc.name   testBindingCount0001
     * @tc.number SUB_CCER_BIND_0001
     * @tc.desc   发布次数 -1000 原值写入卡片绑定数据
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBindingCount0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBindingCount0001 begin');
      const result: string = String(FormEventService.createBindingData(-1000).data);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('{"publishCount":-1000}'));
      expect(result).assertEqual('{"publishCount":-1000}');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.indexOf(CommonEventConstants.FORM_COUNT_KEY)), String(2));
      expect(result.indexOf(CommonEventConstants.FORM_COUNT_KEY)).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('{"publishCount":')));
      expect(result.startsWith('{"publishCount":')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBindingCount0001 end');
    })

    /**
     * @tc.name   testBindingCount0002
     * @tc.number SUB_CCER_BIND_0002
     * @tc.desc   发布次数 -1 原值写入卡片绑定数据
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBindingCount0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBindingCount0002 begin');
      const result: string = String(FormEventService.createBindingData(-1).data);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('{"publishCount":-1}'));
      expect(result).assertEqual('{"publishCount":-1}');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.indexOf(CommonEventConstants.FORM_COUNT_KEY)), String(2));
      expect(result.indexOf(CommonEventConstants.FORM_COUNT_KEY)).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('{"publishCount":')));
      expect(result.startsWith('{"publishCount":')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBindingCount0002 end');
    })

    /**
     * @tc.name   testBindingCount0003
     * @tc.number SUB_CCER_BIND_0003
     * @tc.desc   发布次数 0 原值写入卡片绑定数据
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBindingCount0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBindingCount0003 begin');
      const result: string = String(FormEventService.createBindingData(0).data);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('{"publishCount":0}'));
      expect(result).assertEqual('{"publishCount":0}');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.indexOf(CommonEventConstants.FORM_COUNT_KEY)), String(2));
      expect(result.indexOf(CommonEventConstants.FORM_COUNT_KEY)).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('{"publishCount":')));
      expect(result.startsWith('{"publishCount":')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBindingCount0003 end');
    })

    /**
     * @tc.name   testBindingCount0004
     * @tc.number SUB_CCER_BIND_0004
     * @tc.desc   发布次数 1 原值写入卡片绑定数据
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBindingCount0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBindingCount0004 begin');
      const result: string = String(FormEventService.createBindingData(1).data);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('{"publishCount":1}'));
      expect(result).assertEqual('{"publishCount":1}');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.indexOf(CommonEventConstants.FORM_COUNT_KEY)), String(2));
      expect(result.indexOf(CommonEventConstants.FORM_COUNT_KEY)).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('{"publishCount":')));
      expect(result.startsWith('{"publishCount":')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBindingCount0004 end');
    })

    /**
     * @tc.name   testBindingCount0005
     * @tc.number SUB_CCER_BIND_0005
     * @tc.desc   发布次数 2 原值写入卡片绑定数据
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBindingCount0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBindingCount0005 begin');
      const result: string = String(FormEventService.createBindingData(2).data);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('{"publishCount":2}'));
      expect(result).assertEqual('{"publishCount":2}');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.indexOf(CommonEventConstants.FORM_COUNT_KEY)), String(2));
      expect(result.indexOf(CommonEventConstants.FORM_COUNT_KEY)).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('{"publishCount":')));
      expect(result.startsWith('{"publishCount":')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBindingCount0005 end');
    })

    /**
     * @tc.name   testBindingCount0006
     * @tc.number SUB_CCER_BIND_0006
     * @tc.desc   发布次数 3 原值写入卡片绑定数据
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBindingCount0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBindingCount0006 begin');
      const result: string = String(FormEventService.createBindingData(3).data);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('{"publishCount":3}'));
      expect(result).assertEqual('{"publishCount":3}');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.indexOf(CommonEventConstants.FORM_COUNT_KEY)), String(2));
      expect(result.indexOf(CommonEventConstants.FORM_COUNT_KEY)).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('{"publishCount":')));
      expect(result.startsWith('{"publishCount":')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBindingCount0006 end');
    })

    /**
     * @tc.name   testBindingCount0007
     * @tc.number SUB_CCER_BIND_0007
     * @tc.desc   发布次数 4 原值写入卡片绑定数据
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBindingCount0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBindingCount0007 begin');
      const result: string = String(FormEventService.createBindingData(4).data);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('{"publishCount":4}'));
      expect(result).assertEqual('{"publishCount":4}');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.indexOf(CommonEventConstants.FORM_COUNT_KEY)), String(2));
      expect(result.indexOf(CommonEventConstants.FORM_COUNT_KEY)).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('{"publishCount":')));
      expect(result.startsWith('{"publishCount":')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBindingCount0007 end');
    })

    /**
     * @tc.name   testBindingCount0008
     * @tc.number SUB_CCER_BIND_0008
     * @tc.desc   发布次数 5 原值写入卡片绑定数据
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBindingCount0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBindingCount0008 begin');
      const result: string = String(FormEventService.createBindingData(5).data);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('{"publishCount":5}'));
      expect(result).assertEqual('{"publishCount":5}');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.indexOf(CommonEventConstants.FORM_COUNT_KEY)), String(2));
      expect(result.indexOf(CommonEventConstants.FORM_COUNT_KEY)).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('{"publishCount":')));
      expect(result.startsWith('{"publishCount":')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBindingCount0008 end');
    })

    /**
     * @tc.name   testBindingCount0009
     * @tc.number SUB_CCER_BIND_0009
     * @tc.desc   发布次数 7 原值写入卡片绑定数据
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBindingCount0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBindingCount0009 begin');
      const result: string = String(FormEventService.createBindingData(7).data);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('{"publishCount":7}'));
      expect(result).assertEqual('{"publishCount":7}');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.indexOf(CommonEventConstants.FORM_COUNT_KEY)), String(2));
      expect(result.indexOf(CommonEventConstants.FORM_COUNT_KEY)).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('{"publishCount":')));
      expect(result.startsWith('{"publishCount":')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBindingCount0009 end');
    })

    /**
     * @tc.name   testBindingCount0010
     * @tc.number SUB_CCER_BIND_0010
     * @tc.desc   发布次数 9 原值写入卡片绑定数据
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBindingCount0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBindingCount0010 begin');
      const result: string = String(FormEventService.createBindingData(9).data);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('{"publishCount":9}'));
      expect(result).assertEqual('{"publishCount":9}');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.indexOf(CommonEventConstants.FORM_COUNT_KEY)), String(2));
      expect(result.indexOf(CommonEventConstants.FORM_COUNT_KEY)).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('{"publishCount":')));
      expect(result.startsWith('{"publishCount":')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBindingCount0010 end');
    })

    /**
     * @tc.name   testBindingCount0011
     * @tc.number SUB_CCER_BIND_0011
     * @tc.desc   发布次数 10 原值写入卡片绑定数据
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBindingCount0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBindingCount0011 begin');
      const result: string = String(FormEventService.createBindingData(10).data);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('{"publishCount":10}'));
      expect(result).assertEqual('{"publishCount":10}');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.indexOf(CommonEventConstants.FORM_COUNT_KEY)), String(2));
      expect(result.indexOf(CommonEventConstants.FORM_COUNT_KEY)).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('{"publishCount":')));
      expect(result.startsWith('{"publishCount":')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBindingCount0011 end');
    })

    /**
     * @tc.name   testBindingCount0012
     * @tc.number SUB_CCER_BIND_0012
     * @tc.desc   发布次数 11 原值写入卡片绑定数据
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBindingCount0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBindingCount0012 begin');
      const result: string = String(FormEventService.createBindingData(11).data);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('{"publishCount":11}'));
      expect(result).assertEqual('{"publishCount":11}');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.indexOf(CommonEventConstants.FORM_COUNT_KEY)), String(2));
      expect(result.indexOf(CommonEventConstants.FORM_COUNT_KEY)).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('{"publishCount":')));
      expect(result.startsWith('{"publishCount":')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBindingCount0012 end');
    })

    /**
     * @tc.name   testBindingCount0013
     * @tc.number SUB_CCER_BIND_0013
     * @tc.desc   发布次数 12 原值写入卡片绑定数据
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBindingCount0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBindingCount0013 begin');
      const result: string = String(FormEventService.createBindingData(12).data);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('{"publishCount":12}'));
      expect(result).assertEqual('{"publishCount":12}');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.indexOf(CommonEventConstants.FORM_COUNT_KEY)), String(2));
      expect(result.indexOf(CommonEventConstants.FORM_COUNT_KEY)).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('{"publishCount":')));
      expect(result.startsWith('{"publishCount":')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBindingCount0013 end');
    })

    /**
     * @tc.name   testBindingCount0014
     * @tc.number SUB_CCER_BIND_0014
     * @tc.desc   发布次数 15 原值写入卡片绑定数据
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBindingCount0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBindingCount0014 begin');
      const result: string = String(FormEventService.createBindingData(15).data);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('{"publishCount":15}'));
      expect(result).assertEqual('{"publishCount":15}');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.indexOf(CommonEventConstants.FORM_COUNT_KEY)), String(2));
      expect(result.indexOf(CommonEventConstants.FORM_COUNT_KEY)).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('{"publishCount":')));
      expect(result.startsWith('{"publishCount":')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBindingCount0014 end');
    })

    /**
     * @tc.name   testBindingCount0015
     * @tc.number SUB_CCER_BIND_0015
     * @tc.desc   发布次数 16 原值写入卡片绑定数据
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBindingCount0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBindingCount0015 begin');
      const result: string = String(FormEventService.createBindingData(16).data);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('{"publishCount":16}'));
      expect(result).assertEqual('{"publishCount":16}');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.indexOf(CommonEventConstants.FORM_COUNT_KEY)), String(2));
      expect(result.indexOf(CommonEventConstants.FORM_COUNT_KEY)).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('{"publishCount":')));
      expect(result.startsWith('{"publishCount":')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBindingCount0015 end');
    })

    /**
     * @tc.name   testBindingCount0016
     * @tc.number SUB_CCER_BIND_0016
     * @tc.desc   发布次数 17 原值写入卡片绑定数据
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBindingCount0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBindingCount0016 begin');
      const result: string = String(FormEventService.createBindingData(17).data);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('{"publishCount":17}'));
      expect(result).assertEqual('{"publishCount":17}');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.indexOf(CommonEventConstants.FORM_COUNT_KEY)), String(2));
      expect(result.indexOf(CommonEventConstants.FORM_COUNT_KEY)).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('{"publishCount":')));
      expect(result.startsWith('{"publishCount":')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBindingCount0016 end');
    })

    /**
     * @tc.name   testBindingCount0017
     * @tc.number SUB_CCER_BIND_0017
     * @tc.desc   发布次数 18 原值写入卡片绑定数据
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBindingCount0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBindingCount0017 begin');
      const result: string = String(FormEventService.createBindingData(18).data);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('{"publishCount":18}'));
      expect(result).assertEqual('{"publishCount":18}');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.indexOf(CommonEventConstants.FORM_COUNT_KEY)), String(2));
      expect(result.indexOf(CommonEventConstants.FORM_COUNT_KEY)).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('{"publishCount":')));
      expect(result.startsWith('{"publishCount":')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBindingCount0017 end');
    })

    /**
     * @tc.name   testBindingCount0018
     * @tc.number SUB_CCER_BIND_0018
     * @tc.desc   发布次数 19 原值写入卡片绑定数据
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBindingCount0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBindingCount0018 begin');
      const result: string = String(FormEventService.createBindingData(19).data);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('{"publishCount":19}'));
      expect(result).assertEqual('{"publishCount":19}');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.indexOf(CommonEventConstants.FORM_COUNT_KEY)), String(2));
      expect(result.indexOf(CommonEventConstants.FORM_COUNT_KEY)).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('{"publishCount":')));
      expect(result.startsWith('{"publishCount":')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBindingCount0018 end');
    })

    /**
     * @tc.name   testBindingCount0019
     * @tc.number SUB_CCER_BIND_0019
     * @tc.desc   发布次数 20 原值写入卡片绑定数据
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBindingCount0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBindingCount0019 begin');
      const result: string = String(FormEventService.createBindingData(20).data);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('{"publishCount":20}'));
      expect(result).assertEqual('{"publishCount":20}');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.indexOf(CommonEventConstants.FORM_COUNT_KEY)), String(2));
      expect(result.indexOf(CommonEventConstants.FORM_COUNT_KEY)).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('{"publishCount":')));
      expect(result.startsWith('{"publishCount":')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBindingCount0019 end');
    })

    /**
     * @tc.name   testBindingCount0020
     * @tc.number SUB_CCER_BIND_0020
     * @tc.desc   发布次数 21 原值写入卡片绑定数据
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBindingCount0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBindingCount0020 begin');
      const result: string = String(FormEventService.createBindingData(21).data);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('{"publishCount":21}'));
      expect(result).assertEqual('{"publishCount":21}');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.indexOf(CommonEventConstants.FORM_COUNT_KEY)), String(2));
      expect(result.indexOf(CommonEventConstants.FORM_COUNT_KEY)).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('{"publishCount":')));
      expect(result.startsWith('{"publishCount":')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBindingCount0020 end');
    })

    /**
     * @tc.name   testBindingCount0021
     * @tc.number SUB_CCER_BIND_0021
     * @tc.desc   发布次数 24 原值写入卡片绑定数据
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBindingCount0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBindingCount0021 begin');
      const result: string = String(FormEventService.createBindingData(24).data);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('{"publishCount":24}'));
      expect(result).assertEqual('{"publishCount":24}');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.indexOf(CommonEventConstants.FORM_COUNT_KEY)), String(2));
      expect(result.indexOf(CommonEventConstants.FORM_COUNT_KEY)).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('{"publishCount":')));
      expect(result.startsWith('{"publishCount":')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBindingCount0021 end');
    })

    /**
     * @tc.name   testBindingCount0022
     * @tc.number SUB_CCER_BIND_0022
     * @tc.desc   发布次数 25 原值写入卡片绑定数据
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBindingCount0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBindingCount0022 begin');
      const result: string = String(FormEventService.createBindingData(25).data);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('{"publishCount":25}'));
      expect(result).assertEqual('{"publishCount":25}');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.indexOf(CommonEventConstants.FORM_COUNT_KEY)), String(2));
      expect(result.indexOf(CommonEventConstants.FORM_COUNT_KEY)).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('{"publishCount":')));
      expect(result.startsWith('{"publishCount":')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBindingCount0022 end');
    })

    /**
     * @tc.name   testBindingCount0023
     * @tc.number SUB_CCER_BIND_0023
     * @tc.desc   发布次数 99 原值写入卡片绑定数据
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBindingCount0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBindingCount0023 begin');
      const result: string = String(FormEventService.createBindingData(99).data);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('{"publishCount":99}'));
      expect(result).assertEqual('{"publishCount":99}');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.indexOf(CommonEventConstants.FORM_COUNT_KEY)), String(2));
      expect(result.indexOf(CommonEventConstants.FORM_COUNT_KEY)).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('{"publishCount":')));
      expect(result.startsWith('{"publishCount":')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBindingCount0023 end');
    })

    /**
     * @tc.name   testBindingCount0024
     * @tc.number SUB_CCER_BIND_0024
     * @tc.desc   发布次数 100 原值写入卡片绑定数据
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBindingCount0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBindingCount0024 begin');
      const result: string = String(FormEventService.createBindingData(100).data);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('{"publishCount":100}'));
      expect(result).assertEqual('{"publishCount":100}');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.indexOf(CommonEventConstants.FORM_COUNT_KEY)), String(2));
      expect(result.indexOf(CommonEventConstants.FORM_COUNT_KEY)).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('{"publishCount":')));
      expect(result.startsWith('{"publishCount":')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBindingCount0024 end');
    })

    /**
     * @tc.name   testBindingCount0025
     * @tc.number SUB_CCER_BIND_0025
     * @tc.desc   发布次数 101 原值写入卡片绑定数据
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBindingCount0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBindingCount0025 begin');
      const result: string = String(FormEventService.createBindingData(101).data);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('{"publishCount":101}'));
      expect(result).assertEqual('{"publishCount":101}');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.indexOf(CommonEventConstants.FORM_COUNT_KEY)), String(2));
      expect(result.indexOf(CommonEventConstants.FORM_COUNT_KEY)).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('{"publishCount":')));
      expect(result.startsWith('{"publishCount":')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBindingCount0025 end');
    })

    /**
     * @tc.name   testBindingCount0026
     * @tc.number SUB_CCER_BIND_0026
     * @tc.desc   发布次数 255 原值写入卡片绑定数据
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBindingCount0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBindingCount0026 begin');
      const result: string = String(FormEventService.createBindingData(255).data);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('{"publishCount":255}'));
      expect(result).assertEqual('{"publishCount":255}');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.indexOf(CommonEventConstants.FORM_COUNT_KEY)), String(2));
      expect(result.indexOf(CommonEventConstants.FORM_COUNT_KEY)).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('{"publishCount":')));
      expect(result.startsWith('{"publishCount":')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBindingCount0026 end');
    })

    /**
     * @tc.name   testBindingCount0027
     * @tc.number SUB_CCER_BIND_0027
     * @tc.desc   发布次数 256 原值写入卡片绑定数据
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBindingCount0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBindingCount0027 begin');
      const result: string = String(FormEventService.createBindingData(256).data);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('{"publishCount":256}'));
      expect(result).assertEqual('{"publishCount":256}');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.indexOf(CommonEventConstants.FORM_COUNT_KEY)), String(2));
      expect(result.indexOf(CommonEventConstants.FORM_COUNT_KEY)).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('{"publishCount":')));
      expect(result.startsWith('{"publishCount":')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBindingCount0027 end');
    })

    /**
     * @tc.name   testBindingCount0028
     * @tc.number SUB_CCER_BIND_0028
     * @tc.desc   发布次数 1023 原值写入卡片绑定数据
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBindingCount0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBindingCount0028 begin');
      const result: string = String(FormEventService.createBindingData(1023).data);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('{"publishCount":1023}'));
      expect(result).assertEqual('{"publishCount":1023}');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.indexOf(CommonEventConstants.FORM_COUNT_KEY)), String(2));
      expect(result.indexOf(CommonEventConstants.FORM_COUNT_KEY)).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('{"publishCount":')));
      expect(result.startsWith('{"publishCount":')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBindingCount0028 end');
    })

    /**
     * @tc.name   testBindingCount0029
     * @tc.number SUB_CCER_BIND_0029
     * @tc.desc   发布次数 1024 原值写入卡片绑定数据
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBindingCount0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBindingCount0029 begin');
      const result: string = String(FormEventService.createBindingData(1024).data);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('{"publishCount":1024}'));
      expect(result).assertEqual('{"publishCount":1024}');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.indexOf(CommonEventConstants.FORM_COUNT_KEY)), String(2));
      expect(result.indexOf(CommonEventConstants.FORM_COUNT_KEY)).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('{"publishCount":')));
      expect(result.startsWith('{"publishCount":')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBindingCount0029 end');
    })

    /**
     * @tc.name   testBindingCount0030
     * @tc.number SUB_CCER_BIND_0030
     * @tc.desc   发布次数 2048 原值写入卡片绑定数据
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBindingCount0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBindingCount0030 begin');
      const result: string = String(FormEventService.createBindingData(2048).data);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('{"publishCount":2048}'));
      expect(result).assertEqual('{"publishCount":2048}');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.indexOf(CommonEventConstants.FORM_COUNT_KEY)), String(2));
      expect(result.indexOf(CommonEventConstants.FORM_COUNT_KEY)).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('{"publishCount":')));
      expect(result.startsWith('{"publishCount":')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBindingCount0030 end');
    })

    /**
     * @tc.name   testBindingCount0031
     * @tc.number SUB_CCER_BIND_0031
     * @tc.desc   安全整数上界与 32 位下界的计数不被改写或缩写成指数
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBindingCount0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBindingCount0031 begin');
      const maxJson: string = String(FormEventService.createBindingData(Number.MAX_SAFE_INTEGER).data);
      expect(maxJson).assertEqual('{"publishCount":9007199254740991}');
      expect(maxJson).assertContain(CommonEventConstants.FORM_COUNT_KEY);
      const minJson: string = String(FormEventService.createBindingData(-2147483648).data);
      expect(minJson).assertEqual('{"publishCount":-2147483648}');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBindingCount0031 end');
    })
  })
}
