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
import launchFeature from '../../../main/ets/feature/LaunchFeature';
import { paramMap } from './helper/VolumeSupport';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[Sample_CustomCommonEvent]';

export default function launchDetailVolume01Test(): void {
  describe('LaunchDetailVolume01Test', () => {

    /**
     * @tc.name   testLaunchDetailVolume010001
     * @tc.number SUB_CCE_LAUNCHDET_01_0001
     * @tc.desc   已给键 0 个时组装 4 元素记录
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchDetailVolume010001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume010001 begin');
      const params: Record<string, string> = paramMap('');
      const result: Array<string> = launchFeature.buildDetail(params);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('[null,null,null,null]'));
      expect(JSON.stringify(result)).assertEqual('[null,null,null,null]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result[3])), String('undefined'));
      expect(String(result[3])).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume010001 end');
    })

    /**
     * @tc.name   testLaunchDetailVolume010002
     * @tc.number SUB_CCE_LAUNCHDET_01_0002
     * @tc.desc   已给键 1 个时组装 4 元素记录
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchDetailVolume010002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume010002 begin');
      const params: Record<string, string> = paramMap('startTime=1712');
      const result: Array<string> = launchFeature.buildDetail(params);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["1712",null,null,null]'));
      expect(JSON.stringify(result)).assertEqual('["1712",null,null,null]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result[3])), String('undefined'));
      expect(String(result[3])).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume010002 end');
    })

    /**
     * @tc.name   testLaunchDetailVolume010003
     * @tc.number SUB_CCE_LAUNCHDET_01_0003
     * @tc.desc   已给键 1 个时组装 4 元素记录
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchDetailVolume010003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume010003 begin');
      const params: Record<string, string> = paramMap('endTime=1713');
      const result: Array<string> = launchFeature.buildDetail(params);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('[null,"1713",null,null]'));
      expect(JSON.stringify(result)).assertEqual('[null,"1713",null,null]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result[3])), String('undefined'));
      expect(String(result[3])).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume010003 end');
    })

    /**
     * @tc.name   testLaunchDetailVolume010004
     * @tc.number SUB_CCE_LAUNCHDET_01_0004
     * @tc.desc   已给键 2 个时组装 4 元素记录
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchDetailVolume010004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume010004 begin');
      const params: Record<string, string> = paramMap('startTime=1712|endTime=1713');
      const result: Array<string> = launchFeature.buildDetail(params);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["1712","1713",null,null]'));
      expect(JSON.stringify(result)).assertEqual('["1712","1713",null,null]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result[3])), String('undefined'));
      expect(String(result[3])).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume010004 end');
    })

    /**
     * @tc.name   testLaunchDetailVolume010005
     * @tc.number SUB_CCE_LAUNCHDET_01_0005
     * @tc.desc   已给键 1 个时组装 4 元素记录
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchDetailVolume010005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume010005 begin');
      const params: Record<string, string> = paramMap('totalTime=00:01:01');
      const result: Array<string> = launchFeature.buildDetail(params);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('[null,null,"00:01:01",null]'));
      expect(JSON.stringify(result)).assertEqual('[null,null,"00:01:01",null]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result[3])), String('undefined'));
      expect(String(result[3])).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume010005 end');
    })

    /**
     * @tc.name   testLaunchDetailVolume010006
     * @tc.number SUB_CCE_LAUNCHDET_01_0006
     * @tc.desc   已给键 2 个时组装 4 元素记录
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchDetailVolume010006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume010006 begin');
      const params: Record<string, string> = paramMap('startTime=1712|totalTime=00:01:01');
      const result: Array<string> = launchFeature.buildDetail(params);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["1712",null,"00:01:01",null]'));
      expect(JSON.stringify(result)).assertEqual('["1712",null,"00:01:01",null]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result[3])), String('undefined'));
      expect(String(result[3])).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume010006 end');
    })

    /**
     * @tc.name   testLaunchDetailVolume010007
     * @tc.number SUB_CCE_LAUNCHDET_01_0007
     * @tc.desc   已给键 2 个时组装 4 元素记录
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchDetailVolume010007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume010007 begin');
      const params: Record<string, string> = paramMap('endTime=1713|totalTime=00:01:01');
      const result: Array<string> = launchFeature.buildDetail(params);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('[null,"1713","00:01:01",null]'));
      expect(JSON.stringify(result)).assertEqual('[null,"1713","00:01:01",null]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result[3])), String('undefined'));
      expect(String(result[3])).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume010007 end');
    })

    /**
     * @tc.name   testLaunchDetailVolume010008
     * @tc.number SUB_CCE_LAUNCHDET_01_0008
     * @tc.desc   已给键 3 个时组装 4 元素记录
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchDetailVolume010008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume010008 begin');
      const params: Record<string, string> = paramMap('startTime=1712|endTime=1713|totalTime=00:01:01');
      const result: Array<string> = launchFeature.buildDetail(params);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["1712","1713","00:01:01",null]'));
      expect(JSON.stringify(result)).assertEqual('["1712","1713","00:01:01",null]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result[3])), String('undefined'));
      expect(String(result[3])).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume010008 end');
    })

    /**
     * @tc.name   testLaunchDetailVolume010009
     * @tc.number SUB_CCE_LAUNCHDET_01_0009
     * @tc.desc   已给键 1 个时组装 4 元素记录
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchDetailVolume010009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume010009 begin');
      const params: Record<string, string> = paramMap('totalEvents=7');
      const result: Array<string> = launchFeature.buildDetail(params);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('[null,null,null,"7"]'));
      expect(JSON.stringify(result)).assertEqual('[null,null,null,"7"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result[3])), String('7'));
      expect(String(result[3])).assertEqual('7');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume010009 end');
    })

    /**
     * @tc.name   testLaunchDetailVolume010010
     * @tc.number SUB_CCE_LAUNCHDET_01_0010
     * @tc.desc   已给键 2 个时组装 4 元素记录
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchDetailVolume010010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume010010 begin');
      const params: Record<string, string> = paramMap('startTime=1712|totalEvents=7');
      const result: Array<string> = launchFeature.buildDetail(params);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["1712",null,null,"7"]'));
      expect(JSON.stringify(result)).assertEqual('["1712",null,null,"7"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result[3])), String('7'));
      expect(String(result[3])).assertEqual('7');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume010010 end');
    })

    /**
     * @tc.name   testLaunchDetailVolume010011
     * @tc.number SUB_CCE_LAUNCHDET_01_0011
     * @tc.desc   已给键 2 个时组装 4 元素记录
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchDetailVolume010011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume010011 begin');
      const params: Record<string, string> = paramMap('endTime=1713|totalEvents=7');
      const result: Array<string> = launchFeature.buildDetail(params);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('[null,"1713",null,"7"]'));
      expect(JSON.stringify(result)).assertEqual('[null,"1713",null,"7"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result[3])), String('7'));
      expect(String(result[3])).assertEqual('7');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume010011 end');
    })

    /**
     * @tc.name   testLaunchDetailVolume010012
     * @tc.number SUB_CCE_LAUNCHDET_01_0012
     * @tc.desc   已给键 3 个时组装 4 元素记录
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchDetailVolume010012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume010012 begin');
      const params: Record<string, string> = paramMap('startTime=1712|endTime=1713|totalEvents=7');
      const result: Array<string> = launchFeature.buildDetail(params);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["1712","1713",null,"7"]'));
      expect(JSON.stringify(result)).assertEqual('["1712","1713",null,"7"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result[3])), String('7'));
      expect(String(result[3])).assertEqual('7');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume010012 end');
    })

    /**
     * @tc.name   testLaunchDetailVolume010013
     * @tc.number SUB_CCE_LAUNCHDET_01_0013
     * @tc.desc   已给键 2 个时组装 4 元素记录
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchDetailVolume010013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume010013 begin');
      const params: Record<string, string> = paramMap('totalTime=00:01:01|totalEvents=7');
      const result: Array<string> = launchFeature.buildDetail(params);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('[null,null,"00:01:01","7"]'));
      expect(JSON.stringify(result)).assertEqual('[null,null,"00:01:01","7"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result[3])), String('7'));
      expect(String(result[3])).assertEqual('7');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume010013 end');
    })

    /**
     * @tc.name   testLaunchDetailVolume010014
     * @tc.number SUB_CCE_LAUNCHDET_01_0014
     * @tc.desc   已给键 3 个时组装 4 元素记录
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchDetailVolume010014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume010014 begin');
      const params: Record<string, string> = paramMap('startTime=1712|totalTime=00:01:01|totalEvents=7');
      const result: Array<string> = launchFeature.buildDetail(params);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["1712",null,"00:01:01","7"]'));
      expect(JSON.stringify(result)).assertEqual('["1712",null,"00:01:01","7"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result[3])), String('7'));
      expect(String(result[3])).assertEqual('7');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume010014 end');
    })

    /**
     * @tc.name   testLaunchDetailVolume010015
     * @tc.number SUB_CCE_LAUNCHDET_01_0015
     * @tc.desc   已给键 3 个时组装 4 元素记录
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchDetailVolume010015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume010015 begin');
      const params: Record<string, string> = paramMap('endTime=1713|totalTime=00:01:01|totalEvents=7');
      const result: Array<string> = launchFeature.buildDetail(params);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('[null,"1713","00:01:01","7"]'));
      expect(JSON.stringify(result)).assertEqual('[null,"1713","00:01:01","7"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result[3])), String('7'));
      expect(String(result[3])).assertEqual('7');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume010015 end');
    })

    /**
     * @tc.name   testLaunchDetailVolume010016
     * @tc.number SUB_CCE_LAUNCHDET_01_0016
     * @tc.desc   已给键 4 个时组装 4 元素记录
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchDetailVolume010016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume010016 begin');
      const params: Record<string, string> = paramMap('startTime=1712|endTime=1713|totalTime=00:01:01|totalEvents=7');
      const result: Array<string> = launchFeature.buildDetail(params);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["1712","1713","00:01:01","7"]'));
      expect(JSON.stringify(result)).assertEqual('["1712","1713","00:01:01","7"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result[3])), String('7'));
      expect(String(result[3])).assertEqual('7');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume010016 end');
    })

    /**
     * @tc.name   testLaunchDetailVolume010017
     * @tc.number SUB_CCE_LAUNCHDET_01_0017
     * @tc.desc   已给键 0 个时组装 4 元素记录
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchDetailVolume010017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume010017 begin');
      const params: Record<string, string> = paramMap('');
      const result: Array<string> = launchFeature.buildDetail(params);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('[null,null,null,null]'));
      expect(JSON.stringify(result)).assertEqual('[null,null,null,null]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result[3])), String('undefined'));
      expect(String(result[3])).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume010017 end');
    })

    /**
     * @tc.name   testLaunchDetailVolume010018
     * @tc.number SUB_CCE_LAUNCHDET_01_0018
     * @tc.desc   已给键 1 个时组装 4 元素记录
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchDetailVolume010018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume010018 begin');
      const params: Record<string, string> = paramMap('startTime=');
      const result: Array<string> = launchFeature.buildDetail(params);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["",null,null,null]'));
      expect(JSON.stringify(result)).assertEqual('["",null,null,null]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result[3])), String('undefined'));
      expect(String(result[3])).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume010018 end');
    })

    /**
     * @tc.name   testLaunchDetailVolume010019
     * @tc.number SUB_CCE_LAUNCHDET_01_0019
     * @tc.desc   已给键 1 个时组装 4 元素记录
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchDetailVolume010019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume010019 begin');
      const params: Record<string, string> = paramMap('endTime=');
      const result: Array<string> = launchFeature.buildDetail(params);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('[null,"",null,null]'));
      expect(JSON.stringify(result)).assertEqual('[null,"",null,null]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result[3])), String('undefined'));
      expect(String(result[3])).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume010019 end');
    })

    /**
     * @tc.name   testLaunchDetailVolume010020
     * @tc.number SUB_CCE_LAUNCHDET_01_0020
     * @tc.desc   已给键 2 个时组装 4 元素记录
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchDetailVolume010020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume010020 begin');
      const params: Record<string, string> = paramMap('startTime=|endTime=');
      const result: Array<string> = launchFeature.buildDetail(params);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["","",null,null]'));
      expect(JSON.stringify(result)).assertEqual('["","",null,null]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result[3])), String('undefined'));
      expect(String(result[3])).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume010020 end');
    })

    /**
     * @tc.name   testLaunchDetailVolume010021
     * @tc.number SUB_CCE_LAUNCHDET_01_0021
     * @tc.desc   已给键 1 个时组装 4 元素记录
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchDetailVolume010021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume010021 begin');
      const params: Record<string, string> = paramMap('totalTime=');
      const result: Array<string> = launchFeature.buildDetail(params);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('[null,null,"",null]'));
      expect(JSON.stringify(result)).assertEqual('[null,null,"",null]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result[3])), String('undefined'));
      expect(String(result[3])).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume010021 end');
    })

    /**
     * @tc.name   testLaunchDetailVolume010022
     * @tc.number SUB_CCE_LAUNCHDET_01_0022
     * @tc.desc   已给键 2 个时组装 4 元素记录
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchDetailVolume010022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume010022 begin');
      const params: Record<string, string> = paramMap('startTime=|totalTime=');
      const result: Array<string> = launchFeature.buildDetail(params);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["",null,"",null]'));
      expect(JSON.stringify(result)).assertEqual('["",null,"",null]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result[3])), String('undefined'));
      expect(String(result[3])).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume010022 end');
    })

    /**
     * @tc.name   testLaunchDetailVolume010023
     * @tc.number SUB_CCE_LAUNCHDET_01_0023
     * @tc.desc   已给键 2 个时组装 4 元素记录
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchDetailVolume010023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume010023 begin');
      const params: Record<string, string> = paramMap('endTime=|totalTime=');
      const result: Array<string> = launchFeature.buildDetail(params);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('[null,"","",null]'));
      expect(JSON.stringify(result)).assertEqual('[null,"","",null]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result[3])), String('undefined'));
      expect(String(result[3])).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume010023 end');
    })

    /**
     * @tc.name   testLaunchDetailVolume010024
     * @tc.number SUB_CCE_LAUNCHDET_01_0024
     * @tc.desc   已给键 3 个时组装 4 元素记录
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchDetailVolume010024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume010024 begin');
      const params: Record<string, string> = paramMap('startTime=|endTime=|totalTime=');
      const result: Array<string> = launchFeature.buildDetail(params);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["","","",null]'));
      expect(JSON.stringify(result)).assertEqual('["","","",null]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result[3])), String('undefined'));
      expect(String(result[3])).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume010024 end');
    })

    /**
     * @tc.name   testLaunchDetailVolume010025
     * @tc.number SUB_CCE_LAUNCHDET_01_0025
     * @tc.desc   已给键 1 个时组装 4 元素记录
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchDetailVolume010025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume010025 begin');
      const params: Record<string, string> = paramMap('totalEvents=');
      const result: Array<string> = launchFeature.buildDetail(params);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('[null,null,null,""]'));
      expect(JSON.stringify(result)).assertEqual('[null,null,null,""]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result[3])), String(''));
      expect(String(result[3])).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume010025 end');
    })

    /**
     * @tc.name   testLaunchDetailVolume010026
     * @tc.number SUB_CCE_LAUNCHDET_01_0026
     * @tc.desc   已给键 2 个时组装 4 元素记录
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchDetailVolume010026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume010026 begin');
      const params: Record<string, string> = paramMap('startTime=|totalEvents=');
      const result: Array<string> = launchFeature.buildDetail(params);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["",null,null,""]'));
      expect(JSON.stringify(result)).assertEqual('["",null,null,""]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result[3])), String(''));
      expect(String(result[3])).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume010026 end');
    })

    /**
     * @tc.name   testLaunchDetailVolume010027
     * @tc.number SUB_CCE_LAUNCHDET_01_0027
     * @tc.desc   已给键 2 个时组装 4 元素记录
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchDetailVolume010027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume010027 begin');
      const params: Record<string, string> = paramMap('endTime=|totalEvents=');
      const result: Array<string> = launchFeature.buildDetail(params);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('[null,"",null,""]'));
      expect(JSON.stringify(result)).assertEqual('[null,"",null,""]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result[3])), String(''));
      expect(String(result[3])).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume010027 end');
    })

    /**
     * @tc.name   testLaunchDetailVolume010028
     * @tc.number SUB_CCE_LAUNCHDET_01_0028
     * @tc.desc   已给键 3 个时组装 4 元素记录
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchDetailVolume010028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume010028 begin');
      const params: Record<string, string> = paramMap('startTime=|endTime=|totalEvents=');
      const result: Array<string> = launchFeature.buildDetail(params);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["","",null,""]'));
      expect(JSON.stringify(result)).assertEqual('["","",null,""]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result[3])), String(''));
      expect(String(result[3])).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume010028 end');
    })

    /**
     * @tc.name   testLaunchDetailVolume010029
     * @tc.number SUB_CCE_LAUNCHDET_01_0029
     * @tc.desc   已给键 2 个时组装 4 元素记录
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchDetailVolume010029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume010029 begin');
      const params: Record<string, string> = paramMap('totalTime=|totalEvents=');
      const result: Array<string> = launchFeature.buildDetail(params);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('[null,null,"",""]'));
      expect(JSON.stringify(result)).assertEqual('[null,null,"",""]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result[3])), String(''));
      expect(String(result[3])).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume010029 end');
    })

    /**
     * @tc.name   testLaunchDetailVolume010030
     * @tc.number SUB_CCE_LAUNCHDET_01_0030
     * @tc.desc   已给键 3 个时组装 4 元素记录
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchDetailVolume010030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume010030 begin');
      const params: Record<string, string> = paramMap('startTime=|totalTime=|totalEvents=');
      const result: Array<string> = launchFeature.buildDetail(params);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["",null,"",""]'));
      expect(JSON.stringify(result)).assertEqual('["",null,"",""]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result[3])), String(''));
      expect(String(result[3])).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume010030 end');
    })

    /**
     * @tc.name   testLaunchDetailVolume010031
     * @tc.number SUB_CCE_LAUNCHDET_01_0031
     * @tc.desc   已给键 3 个时组装 4 元素记录
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchDetailVolume010031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume010031 begin');
      const params: Record<string, string> = paramMap('endTime=|totalTime=|totalEvents=');
      const result: Array<string> = launchFeature.buildDetail(params);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('[null,"","",""]'));
      expect(JSON.stringify(result)).assertEqual('[null,"","",""]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result[3])), String(''));
      expect(String(result[3])).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume010031 end');
    })

    /**
     * @tc.name   testLaunchDetailVolume010032
     * @tc.number SUB_CCE_LAUNCHDET_01_0032
     * @tc.desc   已给键 4 个时组装 4 元素记录
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchDetailVolume010032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume010032 begin');
      const params: Record<string, string> = paramMap('startTime=|endTime=|totalTime=|totalEvents=');
      const result: Array<string> = launchFeature.buildDetail(params);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["","","",""]'));
      expect(JSON.stringify(result)).assertEqual('["","","",""]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result[3])), String(''));
      expect(String(result[3])).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume010032 end');
    })

    /**
     * @tc.name   testLaunchDetailVolume010033
     * @tc.number SUB_CCE_LAUNCHDET_01_0033
     * @tc.desc   已给键 0 个时组装 4 元素记录
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchDetailVolume010033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume010033 begin');
      const params: Record<string, string> = paramMap('');
      const result: Array<string> = launchFeature.buildDetail(params);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('[null,null,null,null]'));
      expect(JSON.stringify(result)).assertEqual('[null,null,null,null]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result[3])), String('undefined'));
      expect(String(result[3])).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume010033 end');
    })

    /**
     * @tc.name   testLaunchDetailVolume010034
     * @tc.number SUB_CCE_LAUNCHDET_01_0034
     * @tc.desc   已给键 1 个时组装 4 元素记录
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchDetailVolume010034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume010034 begin');
      const params: Record<string, string> = paramMap('startTime=2026-11-18 10:00:00');
      const result: Array<string> = launchFeature.buildDetail(params);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["2026-11-18 10:00:00",null,null,null]'));
      expect(JSON.stringify(result)).assertEqual('["2026-11-18 10:00:00",null,null,null]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result[3])), String('undefined'));
      expect(String(result[3])).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume010034 end');
    })

    /**
     * @tc.name   testLaunchDetailVolume010035
     * @tc.number SUB_CCE_LAUNCHDET_01_0035
     * @tc.desc   已给键 1 个时组装 4 元素记录
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchDetailVolume010035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume010035 begin');
      const params: Record<string, string> = paramMap('endTime=2026-11-18 10:01:01');
      const result: Array<string> = launchFeature.buildDetail(params);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('[null,"2026-11-18 10:01:01",null,null]'));
      expect(JSON.stringify(result)).assertEqual('[null,"2026-11-18 10:01:01",null,null]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result[3])), String('undefined'));
      expect(String(result[3])).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume010035 end');
    })

    /**
     * @tc.name   testLaunchDetailVolume010036
     * @tc.number SUB_CCE_LAUNCHDET_01_0036
     * @tc.desc   已给键 2 个时组装 4 元素记录
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchDetailVolume010036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume010036 begin');
      const params: Record<string, string> = paramMap('startTime=2026-11-18 10:00:00|endTime=2026-11-18 10:01:01');
      const result: Array<string> = launchFeature.buildDetail(params);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["2026-11-18 10:00:00","2026-11-18 10:01:01",null,null]'));
      expect(JSON.stringify(result)).assertEqual('["2026-11-18 10:00:00","2026-11-18 10:01:01",null,null]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result[3])), String('undefined'));
      expect(String(result[3])).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume010036 end');
    })

    /**
     * @tc.name   testLaunchDetailVolume010037
     * @tc.number SUB_CCE_LAUNCHDET_01_0037
     * @tc.desc   已给键 1 个时组装 4 元素记录
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchDetailVolume010037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume010037 begin');
      const params: Record<string, string> = paramMap('totalTime=00:01:01');
      const result: Array<string> = launchFeature.buildDetail(params);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('[null,null,"00:01:01",null]'));
      expect(JSON.stringify(result)).assertEqual('[null,null,"00:01:01",null]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result[3])), String('undefined'));
      expect(String(result[3])).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume010037 end');
    })

    /**
     * @tc.name   testLaunchDetailVolume010038
     * @tc.number SUB_CCE_LAUNCHDET_01_0038
     * @tc.desc   已给键 2 个时组装 4 元素记录
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchDetailVolume010038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume010038 begin');
      const params: Record<string, string> = paramMap('startTime=2026-11-18 10:00:00|totalTime=00:01:01');
      const result: Array<string> = launchFeature.buildDetail(params);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["2026-11-18 10:00:00",null,"00:01:01",null]'));
      expect(JSON.stringify(result)).assertEqual('["2026-11-18 10:00:00",null,"00:01:01",null]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result[3])), String('undefined'));
      expect(String(result[3])).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume010038 end');
    })

    /**
     * @tc.name   testLaunchDetailVolume010039
     * @tc.number SUB_CCE_LAUNCHDET_01_0039
     * @tc.desc   已给键 2 个时组装 4 元素记录
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchDetailVolume010039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume010039 begin');
      const params: Record<string, string> = paramMap('endTime=2026-11-18 10:01:01|totalTime=00:01:01');
      const result: Array<string> = launchFeature.buildDetail(params);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('[null,"2026-11-18 10:01:01","00:01:01",null]'));
      expect(JSON.stringify(result)).assertEqual('[null,"2026-11-18 10:01:01","00:01:01",null]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result[3])), String('undefined'));
      expect(String(result[3])).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume010039 end');
    })

    /**
     * @tc.name   testLaunchDetailVolume010040
     * @tc.number SUB_CCE_LAUNCHDET_01_0040
     * @tc.desc   已给键 3 个时组装 4 元素记录
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchDetailVolume010040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume010040 begin');
      const params: Record<string, string> = paramMap('startTime=2026-11-18 10:00:00|endTime=2026-11-18 10:01:01|totalTime=00:01:01');
      const result: Array<string> = launchFeature.buildDetail(params);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["2026-11-18 10:00:00","2026-11-18 10:01:01","00:01:01",null]'));
      expect(JSON.stringify(result)).assertEqual('["2026-11-18 10:00:00","2026-11-18 10:01:01","00:01:01",null]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result[3])), String('undefined'));
      expect(String(result[3])).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume010040 end');
    })

    /**
     * @tc.name   testLaunchDetailVolume010041
     * @tc.number SUB_CCE_LAUNCHDET_01_0041
     * @tc.desc   四键全缺时仍返回 4 元素记录，全部为 undefined 占位
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchDetailVolume010041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume010041 begin');
      const emptyParams: Record<string, string> = {};
      const detail: Array<string> = launchFeature.buildDetail(emptyParams);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(detail.length), '4');
      expect(detail.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(detail[0]), 'undefined');
      expect(String(detail[0])).assertEqual('undefined');
      expect(String(detail[3])).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume010041 end');
    })
  })
}
