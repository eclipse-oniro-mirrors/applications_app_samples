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

export default function publishDataFieldTest() {
  describe('PublishDataVolume01Test', () => {

    /**
     * @tc.name   testPublishDataField0001
     * @tc.number SUB_CCER_PUBDATA_0001
     * @tc.desc   data=InApp code=1001 ordered=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishDataField0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishDataField0001 begin');
      const result: string = JSON.stringify(CommonEventPublisher.buildPublishData('InApp', 1001, false));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('{"code":1001,"data":"InApp","isOrdered":false}'));
      expect(result).assertEqual('{"code":1001,"data":"InApp","isOrdered":false}');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('"data":"InApp"'));
      expect(result).assertContain('"data":"InApp"');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('"isOrdered":false'));
      expect(result).assertContain('"isOrdered":false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishDataField0001 end');
    })

    /**
     * @tc.name   testPublishDataField0002
     * @tc.number SUB_CCER_PUBDATA_0002
     * @tc.desc   data=InApp code=1001 ordered=true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishDataField0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishDataField0002 begin');
      const result: string = JSON.stringify(CommonEventPublisher.buildPublishData('InApp', 1001, true));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('{"code":1001,"data":"InApp","isOrdered":true}'));
      expect(result).assertEqual('{"code":1001,"data":"InApp","isOrdered":true}');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('"data":"InApp"'));
      expect(result).assertContain('"data":"InApp"');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('"isOrdered":true'));
      expect(result).assertContain('"isOrdered":true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishDataField0002 end');
    })

    /**
     * @tc.name   testPublishDataField0003
     * @tc.number SUB_CCER_PUBDATA_0003
     * @tc.desc   data=InApp code=1002 ordered=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishDataField0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishDataField0003 begin');
      const result: string = JSON.stringify(CommonEventPublisher.buildPublishData('InApp', 1002, false));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('{"code":1002,"data":"InApp","isOrdered":false}'));
      expect(result).assertEqual('{"code":1002,"data":"InApp","isOrdered":false}');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('"data":"InApp"'));
      expect(result).assertContain('"data":"InApp"');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('"isOrdered":false'));
      expect(result).assertContain('"isOrdered":false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishDataField0003 end');
    })

    /**
     * @tc.name   testPublishDataField0004
     * @tc.number SUB_CCER_PUBDATA_0004
     * @tc.desc   data=InApp code=1002 ordered=true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishDataField0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishDataField0004 begin');
      const result: string = JSON.stringify(CommonEventPublisher.buildPublishData('InApp', 1002, true));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('{"code":1002,"data":"InApp","isOrdered":true}'));
      expect(result).assertEqual('{"code":1002,"data":"InApp","isOrdered":true}');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('"data":"InApp"'));
      expect(result).assertContain('"data":"InApp"');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('"isOrdered":true'));
      expect(result).assertContain('"isOrdered":true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishDataField0004 end');
    })

    /**
     * @tc.name   testPublishDataField0005
     * @tc.number SUB_CCER_PUBDATA_0005
     * @tc.desc   data=InApp code=0 ordered=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishDataField0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishDataField0005 begin');
      const result: string = JSON.stringify(CommonEventPublisher.buildPublishData('InApp', 0, false));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('{"code":0,"data":"InApp","isOrdered":false}'));
      expect(result).assertEqual('{"code":0,"data":"InApp","isOrdered":false}');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('"data":"InApp"'));
      expect(result).assertContain('"data":"InApp"');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('"isOrdered":false'));
      expect(result).assertContain('"isOrdered":false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishDataField0005 end');
    })

    /**
     * @tc.name   testPublishDataField0006
     * @tc.number SUB_CCER_PUBDATA_0006
     * @tc.desc   data=InApp code=0 ordered=true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishDataField0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishDataField0006 begin');
      const result: string = JSON.stringify(CommonEventPublisher.buildPublishData('InApp', 0, true));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('{"code":0,"data":"InApp","isOrdered":true}'));
      expect(result).assertEqual('{"code":0,"data":"InApp","isOrdered":true}');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('"data":"InApp"'));
      expect(result).assertContain('"data":"InApp"');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('"isOrdered":true'));
      expect(result).assertContain('"isOrdered":true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishDataField0006 end');
    })

    /**
     * @tc.name   testPublishDataField0007
     * @tc.number SUB_CCER_PUBDATA_0007
     * @tc.desc   data=OutApp code=1001 ordered=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishDataField0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishDataField0007 begin');
      const result: string = JSON.stringify(CommonEventPublisher.buildPublishData('OutApp', 1001, false));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('{"code":1001,"data":"OutApp","isOrdered":false}'));
      expect(result).assertEqual('{"code":1001,"data":"OutApp","isOrdered":false}');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('"data":"OutApp"'));
      expect(result).assertContain('"data":"OutApp"');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('"isOrdered":false'));
      expect(result).assertContain('"isOrdered":false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishDataField0007 end');
    })

    /**
     * @tc.name   testPublishDataField0008
     * @tc.number SUB_CCER_PUBDATA_0008
     * @tc.desc   data=OutApp code=1001 ordered=true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishDataField0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishDataField0008 begin');
      const result: string = JSON.stringify(CommonEventPublisher.buildPublishData('OutApp', 1001, true));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('{"code":1001,"data":"OutApp","isOrdered":true}'));
      expect(result).assertEqual('{"code":1001,"data":"OutApp","isOrdered":true}');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('"data":"OutApp"'));
      expect(result).assertContain('"data":"OutApp"');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('"isOrdered":true'));
      expect(result).assertContain('"isOrdered":true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishDataField0008 end');
    })

    /**
     * @tc.name   testPublishDataField0009
     * @tc.number SUB_CCER_PUBDATA_0009
     * @tc.desc   data=OutApp code=1002 ordered=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishDataField0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishDataField0009 begin');
      const result: string = JSON.stringify(CommonEventPublisher.buildPublishData('OutApp', 1002, false));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('{"code":1002,"data":"OutApp","isOrdered":false}'));
      expect(result).assertEqual('{"code":1002,"data":"OutApp","isOrdered":false}');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('"data":"OutApp"'));
      expect(result).assertContain('"data":"OutApp"');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('"isOrdered":false'));
      expect(result).assertContain('"isOrdered":false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishDataField0009 end');
    })

    /**
     * @tc.name   testPublishDataField0010
     * @tc.number SUB_CCER_PUBDATA_0010
     * @tc.desc   data=OutApp code=1002 ordered=true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishDataField0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishDataField0010 begin');
      const result: string = JSON.stringify(CommonEventPublisher.buildPublishData('OutApp', 1002, true));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('{"code":1002,"data":"OutApp","isOrdered":true}'));
      expect(result).assertEqual('{"code":1002,"data":"OutApp","isOrdered":true}');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('"data":"OutApp"'));
      expect(result).assertContain('"data":"OutApp"');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('"isOrdered":true'));
      expect(result).assertContain('"isOrdered":true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishDataField0010 end');
    })

    /**
     * @tc.name   testPublishDataField0011
     * @tc.number SUB_CCER_PUBDATA_0011
     * @tc.desc   data=OutApp code=0 ordered=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishDataField0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishDataField0011 begin');
      const result: string = JSON.stringify(CommonEventPublisher.buildPublishData('OutApp', 0, false));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('{"code":0,"data":"OutApp","isOrdered":false}'));
      expect(result).assertEqual('{"code":0,"data":"OutApp","isOrdered":false}');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('"data":"OutApp"'));
      expect(result).assertContain('"data":"OutApp"');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('"isOrdered":false'));
      expect(result).assertContain('"isOrdered":false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishDataField0011 end');
    })

    /**
     * @tc.name   testPublishDataField0012
     * @tc.number SUB_CCER_PUBDATA_0012
     * @tc.desc   data=OutApp code=0 ordered=true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishDataField0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishDataField0012 begin');
      const result: string = JSON.stringify(CommonEventPublisher.buildPublishData('OutApp', 0, true));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('{"code":0,"data":"OutApp","isOrdered":true}'));
      expect(result).assertEqual('{"code":0,"data":"OutApp","isOrdered":true}');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('"data":"OutApp"'));
      expect(result).assertContain('"data":"OutApp"');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('"isOrdered":true'));
      expect(result).assertContain('"isOrdered":true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishDataField0012 end');
    })

    /**
     * @tc.name   testPublishDataField0013
     * @tc.number SUB_CCER_PUBDATA_0013
     * @tc.desc   data=empty code=1001 ordered=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishDataField0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishDataField0013 begin');
      const result: string = JSON.stringify(CommonEventPublisher.buildPublishData('', 1001, false));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('{"code":1001,"data":"","isOrdered":false}'));
      expect(result).assertEqual('{"code":1001,"data":"","isOrdered":false}');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('"data":""'));
      expect(result).assertContain('"data":""');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('"isOrdered":false'));
      expect(result).assertContain('"isOrdered":false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishDataField0013 end');
    })

    /**
     * @tc.name   testPublishDataField0014
     * @tc.number SUB_CCER_PUBDATA_0014
     * @tc.desc   data=empty code=1001 ordered=true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishDataField0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishDataField0014 begin');
      const result: string = JSON.stringify(CommonEventPublisher.buildPublishData('', 1001, true));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('{"code":1001,"data":"","isOrdered":true}'));
      expect(result).assertEqual('{"code":1001,"data":"","isOrdered":true}');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('"data":""'));
      expect(result).assertContain('"data":""');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('"isOrdered":true'));
      expect(result).assertContain('"isOrdered":true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishDataField0014 end');
    })

    /**
     * @tc.name   testPublishDataField0015
     * @tc.number SUB_CCER_PUBDATA_0015
     * @tc.desc   data=empty code=1002 ordered=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishDataField0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishDataField0015 begin');
      const result: string = JSON.stringify(CommonEventPublisher.buildPublishData('', 1002, false));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('{"code":1002,"data":"","isOrdered":false}'));
      expect(result).assertEqual('{"code":1002,"data":"","isOrdered":false}');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('"data":""'));
      expect(result).assertContain('"data":""');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('"isOrdered":false'));
      expect(result).assertContain('"isOrdered":false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishDataField0015 end');
    })

    /**
     * @tc.name   testPublishDataField0016
     * @tc.number SUB_CCER_PUBDATA_0016
     * @tc.desc   data=empty code=1002 ordered=true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishDataField0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishDataField0016 begin');
      const result: string = JSON.stringify(CommonEventPublisher.buildPublishData('', 1002, true));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('{"code":1002,"data":"","isOrdered":true}'));
      expect(result).assertEqual('{"code":1002,"data":"","isOrdered":true}');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('"data":""'));
      expect(result).assertContain('"data":""');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('"isOrdered":true'));
      expect(result).assertContain('"isOrdered":true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishDataField0016 end');
    })

    /**
     * @tc.name   testPublishDataField0017
     * @tc.number SUB_CCER_PUBDATA_0017
     * @tc.desc   data=empty code=0 ordered=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishDataField0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishDataField0017 begin');
      const result: string = JSON.stringify(CommonEventPublisher.buildPublishData('', 0, false));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('{"code":0,"data":"","isOrdered":false}'));
      expect(result).assertEqual('{"code":0,"data":"","isOrdered":false}');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('"data":""'));
      expect(result).assertContain('"data":""');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('"isOrdered":false'));
      expect(result).assertContain('"isOrdered":false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishDataField0017 end');
    })

    /**
     * @tc.name   testPublishDataField0018
     * @tc.number SUB_CCER_PUBDATA_0018
     * @tc.desc   data=empty code=0 ordered=true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishDataField0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishDataField0018 begin');
      const result: string = JSON.stringify(CommonEventPublisher.buildPublishData('', 0, true));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('{"code":0,"data":"","isOrdered":true}'));
      expect(result).assertEqual('{"code":0,"data":"","isOrdered":true}');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('"data":""'));
      expect(result).assertContain('"data":""');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('"isOrdered":true'));
      expect(result).assertContain('"isOrdered":true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishDataField0018 end');
    })

    /**
     * @tc.name   testPublishDataField0019
     * @tc.number SUB_CCER_PUBDATA_0019
     * @tc.desc   data=Custom code=1001 ordered=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishDataField0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishDataField0019 begin');
      const result: string = JSON.stringify(CommonEventPublisher.buildPublishData('Custom', 1001, false));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('{"code":1001,"data":"Custom","isOrdered":false}'));
      expect(result).assertEqual('{"code":1001,"data":"Custom","isOrdered":false}');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('"data":"Custom"'));
      expect(result).assertContain('"data":"Custom"');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('"isOrdered":false'));
      expect(result).assertContain('"isOrdered":false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishDataField0019 end');
    })

    /**
     * @tc.name   testPublishDataField0020
     * @tc.number SUB_CCER_PUBDATA_0020
     * @tc.desc   data=Custom code=1001 ordered=true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishDataField0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishDataField0020 begin');
      const result: string = JSON.stringify(CommonEventPublisher.buildPublishData('Custom', 1001, true));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('{"code":1001,"data":"Custom","isOrdered":true}'));
      expect(result).assertEqual('{"code":1001,"data":"Custom","isOrdered":true}');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('"data":"Custom"'));
      expect(result).assertContain('"data":"Custom"');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('"isOrdered":true'));
      expect(result).assertContain('"isOrdered":true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishDataField0020 end');
    })

    /**
     * @tc.name   testPublishDataField0021
     * @tc.number SUB_CCER_PUBDATA_0021
     * @tc.desc   data=Custom code=1002 ordered=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishDataField0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishDataField0021 begin');
      const result: string = JSON.stringify(CommonEventPublisher.buildPublishData('Custom', 1002, false));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('{"code":1002,"data":"Custom","isOrdered":false}'));
      expect(result).assertEqual('{"code":1002,"data":"Custom","isOrdered":false}');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('"data":"Custom"'));
      expect(result).assertContain('"data":"Custom"');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('"isOrdered":false'));
      expect(result).assertContain('"isOrdered":false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishDataField0021 end');
    })

    /**
     * @tc.name   testPublishDataField0022
     * @tc.number SUB_CCER_PUBDATA_0022
     * @tc.desc   data=Custom code=1002 ordered=true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishDataField0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishDataField0022 begin');
      const result: string = JSON.stringify(CommonEventPublisher.buildPublishData('Custom', 1002, true));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('{"code":1002,"data":"Custom","isOrdered":true}'));
      expect(result).assertEqual('{"code":1002,"data":"Custom","isOrdered":true}');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('"data":"Custom"'));
      expect(result).assertContain('"data":"Custom"');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('"isOrdered":true'));
      expect(result).assertContain('"isOrdered":true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishDataField0022 end');
    })

    /**
     * @tc.name   testPublishDataField0023
     * @tc.number SUB_CCER_PUBDATA_0023
     * @tc.desc   data=Custom code=0 ordered=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishDataField0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishDataField0023 begin');
      const result: string = JSON.stringify(CommonEventPublisher.buildPublishData('Custom', 0, false));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('{"code":0,"data":"Custom","isOrdered":false}'));
      expect(result).assertEqual('{"code":0,"data":"Custom","isOrdered":false}');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('"data":"Custom"'));
      expect(result).assertContain('"data":"Custom"');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('"isOrdered":false'));
      expect(result).assertContain('"isOrdered":false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishDataField0023 end');
    })

    /**
     * @tc.name   testPublishDataField0024
     * @tc.number SUB_CCER_PUBDATA_0024
     * @tc.desc   data=Custom code=0 ordered=true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishDataField0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishDataField0024 begin');
      const result: string = JSON.stringify(CommonEventPublisher.buildPublishData('Custom', 0, true));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('{"code":0,"data":"Custom","isOrdered":true}'));
      expect(result).assertEqual('{"code":0,"data":"Custom","isOrdered":true}');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('"data":"Custom"'));
      expect(result).assertContain('"data":"Custom"');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('"isOrdered":true'));
      expect(result).assertContain('"isOrdered":true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishDataField0024 end');
    })

    /**
     * @tc.name   testPublishDataField0025
     * @tc.number SUB_CCER_PUBDATA_0025
     * @tc.desc   data=InApp code=-1 ordered=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishDataField0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishDataField0025 begin');
      const result: string = JSON.stringify(CommonEventPublisher.buildPublishData('InApp', -1, false));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('{"code":-1,"data":"InApp","isOrdered":false}'));
      expect(result).assertEqual('{"code":-1,"data":"InApp","isOrdered":false}');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('"data":"InApp"'));
      expect(result).assertContain('"data":"InApp"');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('"isOrdered":false'));
      expect(result).assertContain('"isOrdered":false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishDataField0025 end');
    })

    /**
     * @tc.name   testPublishDataField0026
     * @tc.number SUB_CCER_PUBDATA_0026
     * @tc.desc   data=OutApp code=-1 ordered=true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishDataField0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishDataField0026 begin');
      const result: string = JSON.stringify(CommonEventPublisher.buildPublishData('OutApp', -1, true));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('{"code":-1,"data":"OutApp","isOrdered":true}'));
      expect(result).assertEqual('{"code":-1,"data":"OutApp","isOrdered":true}');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('"data":"OutApp"'));
      expect(result).assertContain('"data":"OutApp"');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('"isOrdered":true'));
      expect(result).assertContain('"isOrdered":true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishDataField0026 end');
    })

    /**
     * @tc.name   testPublishDataField0027
     * @tc.number SUB_CCER_PUBDATA_0027
     * @tc.desc   data=Custom code=65536 ordered=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishDataField0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishDataField0027 begin');
      const result: string = JSON.stringify(CommonEventPublisher.buildPublishData('Custom', 65536, false));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('{"code":65536,"data":"Custom","isOrdered":false}'));
      expect(result).assertEqual('{"code":65536,"data":"Custom","isOrdered":false}');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('"data":"Custom"'));
      expect(result).assertContain('"data":"Custom"');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('"isOrdered":false'));
      expect(result).assertContain('"isOrdered":false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishDataField0027 end');
    })

    /**
     * @tc.name   testPublishDataField0028
     * @tc.number SUB_CCER_PUBDATA_0028
     * @tc.desc   data=InApp code=2147483647 ordered=true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishDataField0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishDataField0028 begin');
      const result: string = JSON.stringify(CommonEventPublisher.buildPublishData('InApp', 2147483647, true));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('{"code":2147483647,"data":"InApp","isOrdered":true}'));
      expect(result).assertEqual('{"code":2147483647,"data":"InApp","isOrdered":true}');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('"data":"InApp"'));
      expect(result).assertContain('"data":"InApp"');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('"isOrdered":true'));
      expect(result).assertContain('"isOrdered":true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishDataField0028 end');
    })

    /**
     * @tc.name   testPublishDataField0029
     * @tc.number SUB_CCER_PUBDATA_0029
     * @tc.desc   data=OutApp code=-2147483648 ordered=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishDataField0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishDataField0029 begin');
      const result: string = JSON.stringify(CommonEventPublisher.buildPublishData('OutApp', -2147483648, false));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('{"code":-2147483648,"data":"OutApp","isOrdered":false}'));
      expect(result).assertEqual('{"code":-2147483648,"data":"OutApp","isOrdered":false}');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('"data":"OutApp"'));
      expect(result).assertContain('"data":"OutApp"');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('"isOrdered":false'));
      expect(result).assertContain('"isOrdered":false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishDataField0029 end');
    })

    /**
     * @tc.name   testPublishDataField0030
     * @tc.number SUB_CCER_PUBDATA_0030
     * @tc.desc   data=Custom code=999999 ordered=true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishDataField0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishDataField0030 begin');
      const result: string = JSON.stringify(CommonEventPublisher.buildPublishData('Custom', 999999, true));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('{"code":999999,"data":"Custom","isOrdered":true}'));
      expect(result).assertEqual('{"code":999999,"data":"Custom","isOrdered":true}');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('"data":"Custom"'));
      expect(result).assertContain('"data":"Custom"');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('"isOrdered":true'));
      expect(result).assertContain('"isOrdered":true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishDataField0030 end');
    })

    /**
     * @tc.name   testPublishDataField0031
     * @tc.number SUB_CCER_PUBDATA_0031
     * @tc.desc   省略有序参数默认非有序，显式置真后仅标记变化
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPublishDataField0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishDataField0031 begin');
      const inApp: string = CommonEventConstants.DATA_IN_APP;
      const plain: string = JSON.stringify(CommonEventPublisher.buildPublishData(inApp, EventSource.PAGE));
      expect(plain).assertContain('"isOrdered":false');
      expect(plain).assertContain('"code":1002');
      const empty: string = CommonEventConstants.EMPTY_VALUE;
      const forced: string = JSON.stringify(CommonEventPublisher.buildPublishData(empty, EventSource.UNKNOWN, true));
      expect(forced).assertContain('"isOrdered":true');
      expect(forced).assertContain('"data":""');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testPublishDataField0031 end');
    })
  })
}
