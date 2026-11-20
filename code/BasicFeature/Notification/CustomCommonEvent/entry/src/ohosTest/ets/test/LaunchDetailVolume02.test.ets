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

export default function launchDetailVolume02Test(): void {
  describe('LaunchDetailVolume02Test', () => {

    /**
     * @tc.name   testLaunchDetailVolume020001
     * @tc.number SUB_CCE_LAUNCHDET_02_0001
     * @tc.desc   第1槽取值『空串』时四槽组装按序原样透传
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchDetailVolume020001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume020001 begin');
      const params: Record<string, string> = paramMap('startTime=|endTime=v|totalTime=v|totalEvents=v');
      const result: Array<string> = launchFeature.buildDetail(params);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["","v","v","v"]'));
      expect(JSON.stringify(result)).assertEqual('["","v","v","v"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result[0])), String(''));
      expect(String(result[0])).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume020001 end');
    })

    /**
     * @tc.name   testLaunchDetailVolume020002
     * @tc.number SUB_CCE_LAUNCHDET_02_0002
     * @tc.desc   第2槽取值『空串』时四槽组装按序原样透传
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchDetailVolume020002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume020002 begin');
      const params: Record<string, string> = paramMap('startTime=v|endTime=|totalTime=v|totalEvents=v');
      const result: Array<string> = launchFeature.buildDetail(params);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["v","","v","v"]'));
      expect(JSON.stringify(result)).assertEqual('["v","","v","v"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result[0])), String('v'));
      expect(String(result[0])).assertEqual('v');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume020002 end');
    })

    /**
     * @tc.name   testLaunchDetailVolume020003
     * @tc.number SUB_CCE_LAUNCHDET_02_0003
     * @tc.desc   第3槽取值『空串』时四槽组装按序原样透传
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchDetailVolume020003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume020003 begin');
      const params: Record<string, string> = paramMap('startTime=v|endTime=v|totalTime=|totalEvents=v');
      const result: Array<string> = launchFeature.buildDetail(params);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["v","v","","v"]'));
      expect(JSON.stringify(result)).assertEqual('["v","v","","v"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result[0])), String('v'));
      expect(String(result[0])).assertEqual('v');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume020003 end');
    })

    /**
     * @tc.name   testLaunchDetailVolume020004
     * @tc.number SUB_CCE_LAUNCHDET_02_0004
     * @tc.desc   第4槽取值『空串』时四槽组装按序原样透传
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchDetailVolume020004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume020004 begin');
      const params: Record<string, string> = paramMap('startTime=v|endTime=v|totalTime=v|totalEvents=');
      const result: Array<string> = launchFeature.buildDetail(params);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["v","v","v",""]'));
      expect(JSON.stringify(result)).assertEqual('["v","v","v",""]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result[0])), String('v'));
      expect(String(result[0])).assertEqual('v');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume020004 end');
    })

    /**
     * @tc.name   testLaunchDetailVolume020005
     * @tc.number SUB_CCE_LAUNCHDET_02_0005
     * @tc.desc   第1槽取值『 』时四槽组装按序原样透传
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchDetailVolume020005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume020005 begin');
      const params: Record<string, string> = paramMap('startTime= |endTime=v|totalTime=v|totalEvents=v');
      const result: Array<string> = launchFeature.buildDetail(params);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('[" ","v","v","v"]'));
      expect(JSON.stringify(result)).assertEqual('[" ","v","v","v"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result[0])), String(' '));
      expect(String(result[0])).assertEqual(' ');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume020005 end');
    })

    /**
     * @tc.name   testLaunchDetailVolume020006
     * @tc.number SUB_CCE_LAUNCHDET_02_0006
     * @tc.desc   第2槽取值『 』时四槽组装按序原样透传
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchDetailVolume020006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume020006 begin');
      const params: Record<string, string> = paramMap('startTime=v|endTime= |totalTime=v|totalEvents=v');
      const result: Array<string> = launchFeature.buildDetail(params);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["v"," ","v","v"]'));
      expect(JSON.stringify(result)).assertEqual('["v"," ","v","v"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result[0])), String('v'));
      expect(String(result[0])).assertEqual('v');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume020006 end');
    })

    /**
     * @tc.name   testLaunchDetailVolume020007
     * @tc.number SUB_CCE_LAUNCHDET_02_0007
     * @tc.desc   第3槽取值『 』时四槽组装按序原样透传
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchDetailVolume020007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume020007 begin');
      const params: Record<string, string> = paramMap('startTime=v|endTime=v|totalTime= |totalEvents=v');
      const result: Array<string> = launchFeature.buildDetail(params);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["v","v"," ","v"]'));
      expect(JSON.stringify(result)).assertEqual('["v","v"," ","v"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result[0])), String('v'));
      expect(String(result[0])).assertEqual('v');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume020007 end');
    })

    /**
     * @tc.name   testLaunchDetailVolume020008
     * @tc.number SUB_CCE_LAUNCHDET_02_0008
     * @tc.desc   第4槽取值『 』时四槽组装按序原样透传
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchDetailVolume020008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume020008 begin');
      const params: Record<string, string> = paramMap('startTime=v|endTime=v|totalTime=v|totalEvents= ');
      const result: Array<string> = launchFeature.buildDetail(params);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["v","v","v"," "]'));
      expect(JSON.stringify(result)).assertEqual('["v","v","v"," "]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result[0])), String('v'));
      expect(String(result[0])).assertEqual('v');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume020008 end');
    })

    /**
     * @tc.name   testLaunchDetailVolume020009
     * @tc.number SUB_CCE_LAUNCHDET_02_0009
     * @tc.desc   第1槽取值『0』时四槽组装按序原样透传
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchDetailVolume020009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume020009 begin');
      const params: Record<string, string> = paramMap('startTime=0|endTime=v|totalTime=v|totalEvents=v');
      const result: Array<string> = launchFeature.buildDetail(params);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["0","v","v","v"]'));
      expect(JSON.stringify(result)).assertEqual('["0","v","v","v"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result[0])), String('0'));
      expect(String(result[0])).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume020009 end');
    })

    /**
     * @tc.name   testLaunchDetailVolume020010
     * @tc.number SUB_CCE_LAUNCHDET_02_0010
     * @tc.desc   第2槽取值『0』时四槽组装按序原样透传
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchDetailVolume020010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume020010 begin');
      const params: Record<string, string> = paramMap('startTime=v|endTime=0|totalTime=v|totalEvents=v');
      const result: Array<string> = launchFeature.buildDetail(params);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["v","0","v","v"]'));
      expect(JSON.stringify(result)).assertEqual('["v","0","v","v"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result[0])), String('v'));
      expect(String(result[0])).assertEqual('v');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume020010 end');
    })

    /**
     * @tc.name   testLaunchDetailVolume020011
     * @tc.number SUB_CCE_LAUNCHDET_02_0011
     * @tc.desc   第3槽取值『0』时四槽组装按序原样透传
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchDetailVolume020011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume020011 begin');
      const params: Record<string, string> = paramMap('startTime=v|endTime=v|totalTime=0|totalEvents=v');
      const result: Array<string> = launchFeature.buildDetail(params);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["v","v","0","v"]'));
      expect(JSON.stringify(result)).assertEqual('["v","v","0","v"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result[0])), String('v'));
      expect(String(result[0])).assertEqual('v');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume020011 end');
    })

    /**
     * @tc.name   testLaunchDetailVolume020012
     * @tc.number SUB_CCE_LAUNCHDET_02_0012
     * @tc.desc   第4槽取值『0』时四槽组装按序原样透传
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchDetailVolume020012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume020012 begin');
      const params: Record<string, string> = paramMap('startTime=v|endTime=v|totalTime=v|totalEvents=0');
      const result: Array<string> = launchFeature.buildDetail(params);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["v","v","v","0"]'));
      expect(JSON.stringify(result)).assertEqual('["v","v","v","0"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result[0])), String('v'));
      expect(String(result[0])).assertEqual('v');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume020012 end');
    })

    /**
     * @tc.name   testLaunchDetailVolume020013
     * @tc.number SUB_CCE_LAUNCHDET_02_0013
     * @tc.desc   第1槽取值『null』时四槽组装按序原样透传
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchDetailVolume020013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume020013 begin');
      const params: Record<string, string> = paramMap('startTime=null|endTime=v|totalTime=v|totalEvents=v');
      const result: Array<string> = launchFeature.buildDetail(params);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["null","v","v","v"]'));
      expect(JSON.stringify(result)).assertEqual('["null","v","v","v"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result[0])), String('null'));
      expect(String(result[0])).assertEqual('null');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume020013 end');
    })

    /**
     * @tc.name   testLaunchDetailVolume020014
     * @tc.number SUB_CCE_LAUNCHDET_02_0014
     * @tc.desc   第2槽取值『null』时四槽组装按序原样透传
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchDetailVolume020014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume020014 begin');
      const params: Record<string, string> = paramMap('startTime=v|endTime=null|totalTime=v|totalEvents=v');
      const result: Array<string> = launchFeature.buildDetail(params);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["v","null","v","v"]'));
      expect(JSON.stringify(result)).assertEqual('["v","null","v","v"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result[0])), String('v'));
      expect(String(result[0])).assertEqual('v');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume020014 end');
    })

    /**
     * @tc.name   testLaunchDetailVolume020015
     * @tc.number SUB_CCE_LAUNCHDET_02_0015
     * @tc.desc   第3槽取值『null』时四槽组装按序原样透传
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchDetailVolume020015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume020015 begin');
      const params: Record<string, string> = paramMap('startTime=v|endTime=v|totalTime=null|totalEvents=v');
      const result: Array<string> = launchFeature.buildDetail(params);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["v","v","null","v"]'));
      expect(JSON.stringify(result)).assertEqual('["v","v","null","v"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result[0])), String('v'));
      expect(String(result[0])).assertEqual('v');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume020015 end');
    })

    /**
     * @tc.name   testLaunchDetailVolume020016
     * @tc.number SUB_CCE_LAUNCHDET_02_0016
     * @tc.desc   第4槽取值『null』时四槽组装按序原样透传
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchDetailVolume020016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume020016 begin');
      const params: Record<string, string> = paramMap('startTime=v|endTime=v|totalTime=v|totalEvents=null');
      const result: Array<string> = launchFeature.buildDetail(params);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["v","v","v","null"]'));
      expect(JSON.stringify(result)).assertEqual('["v","v","v","null"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result[0])), String('v'));
      expect(String(result[0])).assertEqual('v');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume020016 end');
    })

    /**
     * @tc.name   testLaunchDetailVolume020017
     * @tc.number SUB_CCE_LAUNCHDET_02_0017
     * @tc.desc   第1槽取值『undefined』时四槽组装按序原样透传
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchDetailVolume020017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume020017 begin');
      const params: Record<string, string> = paramMap('startTime=undefined|endTime=v|totalTime=v|totalEvents=v');
      const result: Array<string> = launchFeature.buildDetail(params);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["undefined","v","v","v"]'));
      expect(JSON.stringify(result)).assertEqual('["undefined","v","v","v"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result[0])), String('undefined'));
      expect(String(result[0])).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume020017 end');
    })

    /**
     * @tc.name   testLaunchDetailVolume020018
     * @tc.number SUB_CCE_LAUNCHDET_02_0018
     * @tc.desc   第2槽取值『undefined』时四槽组装按序原样透传
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchDetailVolume020018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume020018 begin');
      const params: Record<string, string> = paramMap('startTime=v|endTime=undefined|totalTime=v|totalEvents=v');
      const result: Array<string> = launchFeature.buildDetail(params);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["v","undefined","v","v"]'));
      expect(JSON.stringify(result)).assertEqual('["v","undefined","v","v"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result[0])), String('v'));
      expect(String(result[0])).assertEqual('v');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume020018 end');
    })

    /**
     * @tc.name   testLaunchDetailVolume020019
     * @tc.number SUB_CCE_LAUNCHDET_02_0019
     * @tc.desc   第3槽取值『undefined』时四槽组装按序原样透传
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchDetailVolume020019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume020019 begin');
      const params: Record<string, string> = paramMap('startTime=v|endTime=v|totalTime=undefined|totalEvents=v');
      const result: Array<string> = launchFeature.buildDetail(params);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["v","v","undefined","v"]'));
      expect(JSON.stringify(result)).assertEqual('["v","v","undefined","v"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result[0])), String('v'));
      expect(String(result[0])).assertEqual('v');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume020019 end');
    })

    /**
     * @tc.name   testLaunchDetailVolume020020
     * @tc.number SUB_CCE_LAUNCHDET_02_0020
     * @tc.desc   第4槽取值『undefined』时四槽组装按序原样透传
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchDetailVolume020020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume020020 begin');
      const params: Record<string, string> = paramMap('startTime=v|endTime=v|totalTime=v|totalEvents=undefined');
      const result: Array<string> = launchFeature.buildDetail(params);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["v","v","v","undefined"]'));
      expect(JSON.stringify(result)).assertEqual('["v","v","v","undefined"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result[0])), String('v'));
      expect(String(result[0])).assertEqual('v');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume020020 end');
    })

    /**
     * @tc.name   testLaunchDetailVolume020021
     * @tc.number SUB_CCE_LAUNCHDET_02_0021
     * @tc.desc   第1槽取值『true』时四槽组装按序原样透传
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchDetailVolume020021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume020021 begin');
      const params: Record<string, string> = paramMap('startTime=true|endTime=v|totalTime=v|totalEvents=v');
      const result: Array<string> = launchFeature.buildDetail(params);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["true","v","v","v"]'));
      expect(JSON.stringify(result)).assertEqual('["true","v","v","v"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result[0])), String('true'));
      expect(String(result[0])).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume020021 end');
    })

    /**
     * @tc.name   testLaunchDetailVolume020022
     * @tc.number SUB_CCE_LAUNCHDET_02_0022
     * @tc.desc   第2槽取值『true』时四槽组装按序原样透传
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchDetailVolume020022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume020022 begin');
      const params: Record<string, string> = paramMap('startTime=v|endTime=true|totalTime=v|totalEvents=v');
      const result: Array<string> = launchFeature.buildDetail(params);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["v","true","v","v"]'));
      expect(JSON.stringify(result)).assertEqual('["v","true","v","v"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result[0])), String('v'));
      expect(String(result[0])).assertEqual('v');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume020022 end');
    })

    /**
     * @tc.name   testLaunchDetailVolume020023
     * @tc.number SUB_CCE_LAUNCHDET_02_0023
     * @tc.desc   第3槽取值『true』时四槽组装按序原样透传
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchDetailVolume020023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume020023 begin');
      const params: Record<string, string> = paramMap('startTime=v|endTime=v|totalTime=true|totalEvents=v');
      const result: Array<string> = launchFeature.buildDetail(params);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["v","v","true","v"]'));
      expect(JSON.stringify(result)).assertEqual('["v","v","true","v"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result[0])), String('v'));
      expect(String(result[0])).assertEqual('v');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume020023 end');
    })

    /**
     * @tc.name   testLaunchDetailVolume020024
     * @tc.number SUB_CCE_LAUNCHDET_02_0024
     * @tc.desc   第4槽取值『true』时四槽组装按序原样透传
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchDetailVolume020024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume020024 begin');
      const params: Record<string, string> = paramMap('startTime=v|endTime=v|totalTime=v|totalEvents=true');
      const result: Array<string> = launchFeature.buildDetail(params);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["v","v","v","true"]'));
      expect(JSON.stringify(result)).assertEqual('["v","v","v","true"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result[0])), String('v'));
      expect(String(result[0])).assertEqual('v');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume020024 end');
    })

    /**
     * @tc.name   testLaunchDetailVolume020025
     * @tc.number SUB_CCE_LAUNCHDET_02_0025
     * @tc.desc   第1槽取值『-1』时四槽组装按序原样透传
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchDetailVolume020025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume020025 begin');
      const params: Record<string, string> = paramMap('startTime=-1|endTime=v|totalTime=v|totalEvents=v');
      const result: Array<string> = launchFeature.buildDetail(params);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["-1","v","v","v"]'));
      expect(JSON.stringify(result)).assertEqual('["-1","v","v","v"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result[0])), String('-1'));
      expect(String(result[0])).assertEqual('-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume020025 end');
    })

    /**
     * @tc.name   testLaunchDetailVolume020026
     * @tc.number SUB_CCE_LAUNCHDET_02_0026
     * @tc.desc   第2槽取值『-1』时四槽组装按序原样透传
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchDetailVolume020026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume020026 begin');
      const params: Record<string, string> = paramMap('startTime=v|endTime=-1|totalTime=v|totalEvents=v');
      const result: Array<string> = launchFeature.buildDetail(params);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["v","-1","v","v"]'));
      expect(JSON.stringify(result)).assertEqual('["v","-1","v","v"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result[0])), String('v'));
      expect(String(result[0])).assertEqual('v');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume020026 end');
    })

    /**
     * @tc.name   testLaunchDetailVolume020027
     * @tc.number SUB_CCE_LAUNCHDET_02_0027
     * @tc.desc   第3槽取值『-1』时四槽组装按序原样透传
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchDetailVolume020027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume020027 begin');
      const params: Record<string, string> = paramMap('startTime=v|endTime=v|totalTime=-1|totalEvents=v');
      const result: Array<string> = launchFeature.buildDetail(params);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["v","v","-1","v"]'));
      expect(JSON.stringify(result)).assertEqual('["v","v","-1","v"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result[0])), String('v'));
      expect(String(result[0])).assertEqual('v');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume020027 end');
    })

    /**
     * @tc.name   testLaunchDetailVolume020028
     * @tc.number SUB_CCE_LAUNCHDET_02_0028
     * @tc.desc   第4槽取值『-1』时四槽组装按序原样透传
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchDetailVolume020028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume020028 begin');
      const params: Record<string, string> = paramMap('startTime=v|endTime=v|totalTime=v|totalEvents=-1');
      const result: Array<string> = launchFeature.buildDetail(params);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["v","v","v","-1"]'));
      expect(JSON.stringify(result)).assertEqual('["v","v","v","-1"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result[0])), String('v'));
      expect(String(result[0])).assertEqual('v');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume020028 end');
    })

    /**
     * @tc.name   testLaunchDetailVolume020029
     * @tc.number SUB_CCE_LAUNCHDET_02_0029
     * @tc.desc   第1槽取值『中文』时四槽组装按序原样透传
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchDetailVolume020029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume020029 begin');
      const params: Record<string, string> = paramMap('startTime=中文|endTime=v|totalTime=v|totalEvents=v');
      const result: Array<string> = launchFeature.buildDetail(params);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["中文","v","v","v"]'));
      expect(JSON.stringify(result)).assertEqual('["中文","v","v","v"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result[0])), String('中文'));
      expect(String(result[0])).assertEqual('中文');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume020029 end');
    })

    /**
     * @tc.name   testLaunchDetailVolume020030
     * @tc.number SUB_CCE_LAUNCHDET_02_0030
     * @tc.desc   第2槽取值『中文』时四槽组装按序原样透传
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchDetailVolume020030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume020030 begin');
      const params: Record<string, string> = paramMap('startTime=v|endTime=中文|totalTime=v|totalEvents=v');
      const result: Array<string> = launchFeature.buildDetail(params);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["v","中文","v","v"]'));
      expect(JSON.stringify(result)).assertEqual('["v","中文","v","v"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result[0])), String('v'));
      expect(String(result[0])).assertEqual('v');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume020030 end');
    })

    /**
     * @tc.name   testLaunchDetailVolume020031
     * @tc.number SUB_CCE_LAUNCHDET_02_0031
     * @tc.desc   第3槽取值『中文』时四槽组装按序原样透传
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchDetailVolume020031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume020031 begin');
      const params: Record<string, string> = paramMap('startTime=v|endTime=v|totalTime=中文|totalEvents=v');
      const result: Array<string> = launchFeature.buildDetail(params);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["v","v","中文","v"]'));
      expect(JSON.stringify(result)).assertEqual('["v","v","中文","v"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result[0])), String('v'));
      expect(String(result[0])).assertEqual('v');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume020031 end');
    })

    /**
     * @tc.name   testLaunchDetailVolume020032
     * @tc.number SUB_CCE_LAUNCHDET_02_0032
     * @tc.desc   第4槽取值『中文』时四槽组装按序原样透传
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchDetailVolume020032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume020032 begin');
      const params: Record<string, string> = paramMap('startTime=v|endTime=v|totalTime=v|totalEvents=中文');
      const result: Array<string> = launchFeature.buildDetail(params);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["v","v","v","中文"]'));
      expect(JSON.stringify(result)).assertEqual('["v","v","v","中文"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result[0])), String('v'));
      expect(String(result[0])).assertEqual('v');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume020032 end');
    })

    /**
     * @tc.name   testLaunchDetailVolume020033
     * @tc.number SUB_CCE_LAUNCHDET_02_0033
     * @tc.desc   第1槽取值『a b』时四槽组装按序原样透传
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchDetailVolume020033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume020033 begin');
      const params: Record<string, string> = paramMap('startTime=a b|endTime=v|totalTime=v|totalEvents=v');
      const result: Array<string> = launchFeature.buildDetail(params);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["a b","v","v","v"]'));
      expect(JSON.stringify(result)).assertEqual('["a b","v","v","v"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result[0])), String('a b'));
      expect(String(result[0])).assertEqual('a b');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume020033 end');
    })

    /**
     * @tc.name   testLaunchDetailVolume020034
     * @tc.number SUB_CCE_LAUNCHDET_02_0034
     * @tc.desc   第2槽取值『a b』时四槽组装按序原样透传
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchDetailVolume020034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume020034 begin');
      const params: Record<string, string> = paramMap('startTime=v|endTime=a b|totalTime=v|totalEvents=v');
      const result: Array<string> = launchFeature.buildDetail(params);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["v","a b","v","v"]'));
      expect(JSON.stringify(result)).assertEqual('["v","a b","v","v"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result[0])), String('v'));
      expect(String(result[0])).assertEqual('v');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume020034 end');
    })

    /**
     * @tc.name   testLaunchDetailVolume020035
     * @tc.number SUB_CCE_LAUNCHDET_02_0035
     * @tc.desc   第3槽取值『a b』时四槽组装按序原样透传
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchDetailVolume020035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume020035 begin');
      const params: Record<string, string> = paramMap('startTime=v|endTime=v|totalTime=a b|totalEvents=v');
      const result: Array<string> = launchFeature.buildDetail(params);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["v","v","a b","v"]'));
      expect(JSON.stringify(result)).assertEqual('["v","v","a b","v"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result[0])), String('v'));
      expect(String(result[0])).assertEqual('v');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume020035 end');
    })

    /**
     * @tc.name   testLaunchDetailVolume020036
     * @tc.number SUB_CCE_LAUNCHDET_02_0036
     * @tc.desc   第4槽取值『a b』时四槽组装按序原样透传
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchDetailVolume020036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume020036 begin');
      const params: Record<string, string> = paramMap('startTime=v|endTime=v|totalTime=v|totalEvents=a b');
      const result: Array<string> = launchFeature.buildDetail(params);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["v","v","v","a b"]'));
      expect(JSON.stringify(result)).assertEqual('["v","v","v","a b"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result[0])), String('v'));
      expect(String(result[0])).assertEqual('v');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume020036 end');
    })

    /**
     * @tc.name   testLaunchDetailVolume020037
     * @tc.number SUB_CCE_LAUNCHDET_02_0037
     * @tc.desc   第1槽取值『LLLLLLLLLLLLLLLLLLLL』时四槽组装按序原样透传
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchDetailVolume020037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume020037 begin');
      const params: Record<string, string> = paramMap('startTime=LLLLLLLLLLLLLLLLLLLL|endTime=v|totalTime=v|totalEvents=v');
      const result: Array<string> = launchFeature.buildDetail(params);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["LLLLLLLLLLLLLLLLLLLL","v","v","v"]'));
      expect(JSON.stringify(result)).assertEqual('["LLLLLLLLLLLLLLLLLLLL","v","v","v"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result[0])), String('LLLLLLLLLLLLLLLLLLLL'));
      expect(String(result[0])).assertEqual('LLLLLLLLLLLLLLLLLLLL');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume020037 end');
    })

    /**
     * @tc.name   testLaunchDetailVolume020038
     * @tc.number SUB_CCE_LAUNCHDET_02_0038
     * @tc.desc   第2槽取值『LLLLLLLLLLLLLLLLLLLL』时四槽组装按序原样透传
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchDetailVolume020038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume020038 begin');
      const params: Record<string, string> = paramMap('startTime=v|endTime=LLLLLLLLLLLLLLLLLLLL|totalTime=v|totalEvents=v');
      const result: Array<string> = launchFeature.buildDetail(params);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["v","LLLLLLLLLLLLLLLLLLLL","v","v"]'));
      expect(JSON.stringify(result)).assertEqual('["v","LLLLLLLLLLLLLLLLLLLL","v","v"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result[0])), String('v'));
      expect(String(result[0])).assertEqual('v');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume020038 end');
    })

    /**
     * @tc.name   testLaunchDetailVolume020039
     * @tc.number SUB_CCE_LAUNCHDET_02_0039
     * @tc.desc   第3槽取值『LLLLLLLLLLLLLLLLLLLL』时四槽组装按序原样透传
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchDetailVolume020039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume020039 begin');
      const params: Record<string, string> = paramMap('startTime=v|endTime=v|totalTime=LLLLLLLLLLLLLLLLLLLL|totalEvents=v');
      const result: Array<string> = launchFeature.buildDetail(params);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["v","v","LLLLLLLLLLLLLLLLLLLL","v"]'));
      expect(JSON.stringify(result)).assertEqual('["v","v","LLLLLLLLLLLLLLLLLLLL","v"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result[0])), String('v'));
      expect(String(result[0])).assertEqual('v');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume020039 end');
    })

    /**
     * @tc.name   testLaunchDetailVolume020040
     * @tc.number SUB_CCE_LAUNCHDET_02_0040
     * @tc.desc   第4槽取值『LLLLLLLLLLLLLLLLLLLL』时四槽组装按序原样透传
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchDetailVolume020040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume020040 begin');
      const params: Record<string, string> = paramMap('startTime=v|endTime=v|totalTime=v|totalEvents=LLLLLLLLLLLLLLLLLLLL');
      const result: Array<string> = launchFeature.buildDetail(params);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["v","v","v","LLLLLLLLLLLLLLLLLLLL"]'));
      expect(JSON.stringify(result)).assertEqual('["v","v","v","LLLLLLLLLLLLLLLLLLLL"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result[0])), String('v'));
      expect(String(result[0])).assertEqual('v');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume020040 end');
    })

    /**
     * @tc.name   testLaunchDetailVolume020041
     * @tc.number SUB_CCE_LAUNCHDET_02_0041
     * @tc.desc   四键异值组合时按固定顺序组装四元素记录
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchDetailVolume020041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume020041 begin');
      const params: Record<string, string> = paramMap('startTime=st|endTime=et|totalTime=tt|totalEvents=te');
      const result: Array<string> = launchFeature.buildDetail(params);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(JSON.stringify(result)), String('["st","et","tt","te"]'));
      expect(JSON.stringify(result)).assertEqual('["st","et","tt","te"]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result[0])), String('st'));
      expect(String(result[0])).assertEqual('st');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume020041 end');
    })

    /**
     * @tc.name   testLaunchDetailVolume020042
     * @tc.number SUB_CCE_LAUNCHDET_02_0042
     * @tc.desc   值含等号时 paramMap 以等号为界拆分，取等号右侧内容（main 现状，仅记录）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchDetailVolume020042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume020042 begin');
      const params: Record<string, string> = paramMap('startTime=a=b');
      const result: Array<string> = launchFeature.buildDetail(params);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', JSON.stringify(result), '["a",null,null,null]');
      expect(JSON.stringify(result)).assertEqual('["a",null,null,null]');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result[0]), 'a');
      expect(result[0]).assertEqual('a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(4));
      expect(result.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchDetailVolume020042 end');
    })
  })
}
