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

import { afterAll, beforeAll, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { OpenLinkOptions, Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import {
  closeOpenLinkAbility,
  dismissNoMatchDialog,
  LinkObservation,
  observeOpenLink,
  observeStart
} from './LinkHelper';
import { ENTRY_ABILITY, launchAbility } from './TestHelper';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_UniversalLink]';

export default function paramPassthroughTest(): void {
  describe('UniversalLinkParamPassthroughTest', () => {
    beforeAll(async (done: Function) => {
      await dismissNoMatchDialog(500);
      await launchAbility(ENTRY_ABILITY);
      done();
    })

    afterAll(async (done: Function) => {
      await dismissNoMatchDialog(500);
      await closeOpenLinkAbility();
      done();
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_PARAM_0001
     * @tc.name      testParamPassthrough0001
     * @tc.desc      startAbility 隐式拉起时 parameters 里的普通字符串 pString 原样传到 OpenLinkAbility
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testParamPassthrough0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParamPassthrough0001 begin');
      const parameters: Record<string, Object> = { 'pString': 'v' };
      const want: Want = {
        action: 'ohos.want.action.viewData',
        uri: 'http://docs.openharmony.cn',
        parameters: parameters
      };
      const observation: LinkObservation = await observeStart(want);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.topName=${observation.topName}`);
      expect(observation.topName).assertEqual('OpenLinkAbility');
      const actual3: string = JSON.stringify(observation.parameters['pString']);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('"v"');
      const actual4: string = typeof observation.parameters['pString'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('string');
      const actual5: Object = observation.parameters['ohos.aafwk.param.callerAbilityName'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParamPassthrough0001 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_PARAM_0002
     * @tc.name      testParamPassthrough0002
     * @tc.desc      startAbility 隐式拉起时 parameters 里的空字符串 pEmpty 原样传到 OpenLinkAbility
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testParamPassthrough0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParamPassthrough0002 begin');
      const parameters: Record<string, Object> = { 'pEmpty': '' };
      const want: Want = {
        action: 'ohos.want.action.viewData',
        uri: 'http://docs.openharmony.cn',
        parameters: parameters
      };
      const observation: LinkObservation = await observeStart(want);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.topName=${observation.topName}`);
      expect(observation.topName).assertEqual('OpenLinkAbility');
      const actual3: string = JSON.stringify(observation.parameters['pEmpty']);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('""');
      const actual4: string = typeof observation.parameters['pEmpty'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('string');
      const actual5: Object = observation.parameters['ohos.aafwk.param.callerAbilityName'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParamPassthrough0002 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_PARAM_0003
     * @tc.name      testParamPassthrough0003
     * @tc.desc      startAbility 隐式拉起时 parameters 里的中文字符串 pChinese 原样传到 OpenLinkAbility
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testParamPassthrough0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParamPassthrough0003 begin');
      const parameters: Record<string, Object> = { 'pChinese': '中文参数' };
      const want: Want = {
        action: 'ohos.want.action.viewData',
        uri: 'http://docs.openharmony.cn',
        parameters: parameters
      };
      const observation: LinkObservation = await observeStart(want);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.topName=${observation.topName}`);
      expect(observation.topName).assertEqual('OpenLinkAbility');
      const actual3: string = JSON.stringify(observation.parameters['pChinese']);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('"中文参数"');
      const actual4: string = typeof observation.parameters['pChinese'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('string');
      const actual5: Object = observation.parameters['ohos.aafwk.param.callerAbilityName'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParamPassthrough0003 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_PARAM_0004
     * @tc.name      testParamPassthrough0004
     * @tc.desc      startAbility 隐式拉起时 parameters 里的32 字符长串 pLong 原样传到 OpenLinkAbility
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testParamPassthrough0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParamPassthrough0004 begin');
      const parameters: Record<string, Object> = { 'pLong': 'LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL' };
      const want: Want = {
        action: 'ohos.want.action.viewData',
        uri: 'http://docs.openharmony.cn',
        parameters: parameters
      };
      const observation: LinkObservation = await observeStart(want);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.topName=${observation.topName}`);
      expect(observation.topName).assertEqual('OpenLinkAbility');
      const actual3: string = JSON.stringify(observation.parameters['pLong']);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('"LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL"');
      const actual4: string = typeof observation.parameters['pLong'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('string');
      const actual5: Object = observation.parameters['ohos.aafwk.param.callerAbilityName'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParamPassthrough0004 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_PARAM_0005
     * @tc.name      testParamPassthrough0005
     * @tc.desc      startAbility 隐式拉起时 parameters 里的正整数 pInt 原样传到 OpenLinkAbility
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testParamPassthrough0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParamPassthrough0005 begin');
      const parameters: Record<string, Object> = { 'pInt': 42 };
      const want: Want = {
        action: 'ohos.want.action.viewData',
        uri: 'http://docs.openharmony.cn',
        parameters: parameters
      };
      const observation: LinkObservation = await observeStart(want);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.topName=${observation.topName}`);
      expect(observation.topName).assertEqual('OpenLinkAbility');
      const actual3: string = JSON.stringify(observation.parameters['pInt']);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('42');
      const actual4: string = typeof observation.parameters['pInt'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('number');
      const actual5: Object = observation.parameters['ohos.aafwk.param.callerAbilityName'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParamPassthrough0005 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_PARAM_0006
     * @tc.name      testParamPassthrough0006
     * @tc.desc      startAbility 隐式拉起时 parameters 里的零 pZero 原样传到 OpenLinkAbility
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testParamPassthrough0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParamPassthrough0006 begin');
      const parameters: Record<string, Object> = { 'pZero': 0 };
      const want: Want = {
        action: 'ohos.want.action.viewData',
        uri: 'http://docs.openharmony.cn',
        parameters: parameters
      };
      const observation: LinkObservation = await observeStart(want);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.topName=${observation.topName}`);
      expect(observation.topName).assertEqual('OpenLinkAbility');
      const actual3: string = JSON.stringify(observation.parameters['pZero']);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('0');
      const actual4: string = typeof observation.parameters['pZero'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('number');
      const actual5: Object = observation.parameters['ohos.aafwk.param.callerAbilityName'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParamPassthrough0006 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_PARAM_0007
     * @tc.name      testParamPassthrough0007
     * @tc.desc      startAbility 隐式拉起时 parameters 里的负整数 pNeg 原样传到 OpenLinkAbility
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testParamPassthrough0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParamPassthrough0007 begin');
      const parameters: Record<string, Object> = { 'pNeg': -7 };
      const want: Want = {
        action: 'ohos.want.action.viewData',
        uri: 'http://docs.openharmony.cn',
        parameters: parameters
      };
      const observation: LinkObservation = await observeStart(want);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.topName=${observation.topName}`);
      expect(observation.topName).assertEqual('OpenLinkAbility');
      const actual3: string = JSON.stringify(observation.parameters['pNeg']);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('-7');
      const actual4: string = typeof observation.parameters['pNeg'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('number');
      const actual5: Object = observation.parameters['ohos.aafwk.param.callerAbilityName'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParamPassthrough0007 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_PARAM_0008
     * @tc.name      testParamPassthrough0008
     * @tc.desc      startAbility 隐式拉起时 parameters 里的int32 最大值 pMax 原样传到 OpenLinkAbility
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testParamPassthrough0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParamPassthrough0008 begin');
      const parameters: Record<string, Object> = { 'pMax': 2147483647 };
      const want: Want = {
        action: 'ohos.want.action.viewData',
        uri: 'http://docs.openharmony.cn',
        parameters: parameters
      };
      const observation: LinkObservation = await observeStart(want);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.topName=${observation.topName}`);
      expect(observation.topName).assertEqual('OpenLinkAbility');
      const actual3: string = JSON.stringify(observation.parameters['pMax']);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('2147483647');
      const actual4: string = typeof observation.parameters['pMax'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('number');
      const actual5: Object = observation.parameters['ohos.aafwk.param.callerAbilityName'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParamPassthrough0008 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_PARAM_0009
     * @tc.name      testParamPassthrough0009
     * @tc.desc      startAbility 隐式拉起时 parameters 里的小数 pFloat 原样传到 OpenLinkAbility
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testParamPassthrough0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParamPassthrough0009 begin');
      const parameters: Record<string, Object> = { 'pFloat': 3.5 };
      const want: Want = {
        action: 'ohos.want.action.viewData',
        uri: 'http://docs.openharmony.cn',
        parameters: parameters
      };
      const observation: LinkObservation = await observeStart(want);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.topName=${observation.topName}`);
      expect(observation.topName).assertEqual('OpenLinkAbility');
      const actual3: string = JSON.stringify(observation.parameters['pFloat']);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('3.5');
      const actual4: string = typeof observation.parameters['pFloat'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('number');
      const actual5: Object = observation.parameters['ohos.aafwk.param.callerAbilityName'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParamPassthrough0009 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_PARAM_0010
     * @tc.name      testParamPassthrough0010
     * @tc.desc      startAbility 隐式拉起时 parameters 里的true pTrue 原样传到 OpenLinkAbility
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testParamPassthrough0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParamPassthrough0010 begin');
      const parameters: Record<string, Object> = { 'pTrue': true };
      const want: Want = {
        action: 'ohos.want.action.viewData',
        uri: 'http://docs.openharmony.cn',
        parameters: parameters
      };
      const observation: LinkObservation = await observeStart(want);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.topName=${observation.topName}`);
      expect(observation.topName).assertEqual('OpenLinkAbility');
      const actual3: string = JSON.stringify(observation.parameters['pTrue']);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('true');
      const actual4: string = typeof observation.parameters['pTrue'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('boolean');
      const actual5: Object = observation.parameters['ohos.aafwk.param.callerAbilityName'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParamPassthrough0010 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_PARAM_0011
     * @tc.name      testParamPassthrough0011
     * @tc.desc      startAbility 隐式拉起时 parameters 里的false pFalse 原样传到 OpenLinkAbility
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testParamPassthrough0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParamPassthrough0011 begin');
      const parameters: Record<string, Object> = { 'pFalse': false };
      const want: Want = {
        action: 'ohos.want.action.viewData',
        uri: 'http://docs.openharmony.cn',
        parameters: parameters
      };
      const observation: LinkObservation = await observeStart(want);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.topName=${observation.topName}`);
      expect(observation.topName).assertEqual('OpenLinkAbility');
      const actual3: string = JSON.stringify(observation.parameters['pFalse']);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('false');
      const actual4: string = typeof observation.parameters['pFalse'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('boolean');
      const actual5: Object = observation.parameters['ohos.aafwk.param.callerAbilityName'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParamPassthrough0011 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_PARAM_0012
     * @tc.name      testParamPassthrough0012
     * @tc.desc      startAbility 隐式拉起时 parameters 里的字符串数组 pStrArr 原样传到 OpenLinkAbility
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testParamPassthrough0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParamPassthrough0012 begin');
      const parameters: Record<string, Object> = { 'pStrArr': ['a', 'b'] };
      const want: Want = {
        action: 'ohos.want.action.viewData',
        uri: 'http://docs.openharmony.cn',
        parameters: parameters
      };
      const observation: LinkObservation = await observeStart(want);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.topName=${observation.topName}`);
      expect(observation.topName).assertEqual('OpenLinkAbility');
      const actual3: string = JSON.stringify(observation.parameters['pStrArr']);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('["a","b"]');
      const actual4: string = typeof observation.parameters['pStrArr'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('object');
      const actual5: Object = observation.parameters['ohos.aafwk.param.callerAbilityName'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParamPassthrough0012 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_PARAM_0013
     * @tc.name      testParamPassthrough0013
     * @tc.desc      startAbility 隐式拉起时 parameters 里的数字数组 pNumArr 原样传到 OpenLinkAbility
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testParamPassthrough0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParamPassthrough0013 begin');
      const parameters: Record<string, Object> = { 'pNumArr': [1, 2, 3] };
      const want: Want = {
        action: 'ohos.want.action.viewData',
        uri: 'http://docs.openharmony.cn',
        parameters: parameters
      };
      const observation: LinkObservation = await observeStart(want);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.topName=${observation.topName}`);
      expect(observation.topName).assertEqual('OpenLinkAbility');
      const actual3: string = JSON.stringify(observation.parameters['pNumArr']);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('[1,2,3]');
      const actual4: string = typeof observation.parameters['pNumArr'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('object');
      const actual5: Object = observation.parameters['ohos.aafwk.param.callerAbilityName'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParamPassthrough0013 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_PARAM_0014
     * @tc.name      testParamPassthrough0014
     * @tc.desc      startAbility 隐式拉起时 parameters 里的布尔数组 pBoolArr 原样传到 OpenLinkAbility
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testParamPassthrough0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParamPassthrough0014 begin');
      const parameters: Record<string, Object> = { 'pBoolArr': [true, false] };
      const want: Want = {
        action: 'ohos.want.action.viewData',
        uri: 'http://docs.openharmony.cn',
        parameters: parameters
      };
      const observation: LinkObservation = await observeStart(want);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.topName=${observation.topName}`);
      expect(observation.topName).assertEqual('OpenLinkAbility');
      const actual3: string = JSON.stringify(observation.parameters['pBoolArr']);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('[true,false]');
      const actual4: string = typeof observation.parameters['pBoolArr'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('object');
      const actual5: Object = observation.parameters['ohos.aafwk.param.callerAbilityName'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParamPassthrough0014 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_PARAM_0015
     * @tc.name      testParamPassthrough0015
     * @tc.desc      openLink 的 OpenLinkOptions.parameters 里的普通字符串 pString 原样传到 OpenLinkAbility
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testParamPassthrough0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParamPassthrough0015 begin');
      const parameters: Record<string, Object> = { 'pString': 'v' };
      const options: OpenLinkOptions = { appLinkingOnly: false, parameters: parameters };
      const observation: LinkObservation = await observeOpenLink('http://docs.openharmony.cn', options);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.topName=${observation.topName}`);
      expect(observation.topName).assertEqual('OpenLinkAbility');
      const actual3: string = JSON.stringify(observation.parameters['pString']);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('"v"');
      const actual4: string = typeof observation.parameters['pString'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('string');
      const actual5: Object = observation.parameters['ohos.aafwk.param.callerAbilityName'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('EntryAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParamPassthrough0015 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_PARAM_0016
     * @tc.name      testParamPassthrough0016
     * @tc.desc      openLink 的 OpenLinkOptions.parameters 里的空字符串 pEmpty 原样传到 OpenLinkAbility
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testParamPassthrough0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParamPassthrough0016 begin');
      const parameters: Record<string, Object> = { 'pEmpty': '' };
      const options: OpenLinkOptions = { appLinkingOnly: false, parameters: parameters };
      const observation: LinkObservation = await observeOpenLink('http://docs.openharmony.cn', options);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.topName=${observation.topName}`);
      expect(observation.topName).assertEqual('OpenLinkAbility');
      const actual3: string = JSON.stringify(observation.parameters['pEmpty']);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('""');
      const actual4: string = typeof observation.parameters['pEmpty'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('string');
      const actual5: Object = observation.parameters['ohos.aafwk.param.callerAbilityName'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('EntryAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParamPassthrough0016 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_PARAM_0017
     * @tc.name      testParamPassthrough0017
     * @tc.desc      openLink 的 OpenLinkOptions.parameters 里的中文字符串 pChinese 原样传到 OpenLinkAbility
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testParamPassthrough0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParamPassthrough0017 begin');
      const parameters: Record<string, Object> = { 'pChinese': '中文参数' };
      const options: OpenLinkOptions = { appLinkingOnly: false, parameters: parameters };
      const observation: LinkObservation = await observeOpenLink('http://docs.openharmony.cn', options);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.topName=${observation.topName}`);
      expect(observation.topName).assertEqual('OpenLinkAbility');
      const actual3: string = JSON.stringify(observation.parameters['pChinese']);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('"中文参数"');
      const actual4: string = typeof observation.parameters['pChinese'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('string');
      const actual5: Object = observation.parameters['ohos.aafwk.param.callerAbilityName'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('EntryAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParamPassthrough0017 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_PARAM_0018
     * @tc.name      testParamPassthrough0018
     * @tc.desc      openLink 的 OpenLinkOptions.parameters 里的32 字符长串 pLong 原样传到 OpenLinkAbility
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testParamPassthrough0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParamPassthrough0018 begin');
      const parameters: Record<string, Object> = { 'pLong': 'LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL' };
      const options: OpenLinkOptions = { appLinkingOnly: false, parameters: parameters };
      const observation: LinkObservation = await observeOpenLink('http://docs.openharmony.cn', options);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.topName=${observation.topName}`);
      expect(observation.topName).assertEqual('OpenLinkAbility');
      const actual3: string = JSON.stringify(observation.parameters['pLong']);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('"LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL"');
      const actual4: string = typeof observation.parameters['pLong'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('string');
      const actual5: Object = observation.parameters['ohos.aafwk.param.callerAbilityName'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('EntryAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParamPassthrough0018 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_PARAM_0019
     * @tc.name      testParamPassthrough0019
     * @tc.desc      openLink 的 OpenLinkOptions.parameters 里的正整数 pInt 原样传到 OpenLinkAbility
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testParamPassthrough0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParamPassthrough0019 begin');
      const parameters: Record<string, Object> = { 'pInt': 42 };
      const options: OpenLinkOptions = { appLinkingOnly: false, parameters: parameters };
      const observation: LinkObservation = await observeOpenLink('http://docs.openharmony.cn', options);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.topName=${observation.topName}`);
      expect(observation.topName).assertEqual('OpenLinkAbility');
      const actual3: string = JSON.stringify(observation.parameters['pInt']);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('42');
      const actual4: string = typeof observation.parameters['pInt'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('number');
      const actual5: Object = observation.parameters['ohos.aafwk.param.callerAbilityName'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('EntryAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParamPassthrough0019 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_PARAM_0020
     * @tc.name      testParamPassthrough0020
     * @tc.desc      openLink 的 OpenLinkOptions.parameters 里的零 pZero 原样传到 OpenLinkAbility
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testParamPassthrough0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParamPassthrough0020 begin');
      const parameters: Record<string, Object> = { 'pZero': 0 };
      const options: OpenLinkOptions = { appLinkingOnly: false, parameters: parameters };
      const observation: LinkObservation = await observeOpenLink('http://docs.openharmony.cn', options);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.topName=${observation.topName}`);
      expect(observation.topName).assertEqual('OpenLinkAbility');
      const actual3: string = JSON.stringify(observation.parameters['pZero']);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('0');
      const actual4: string = typeof observation.parameters['pZero'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('number');
      const actual5: Object = observation.parameters['ohos.aafwk.param.callerAbilityName'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('EntryAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParamPassthrough0020 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_PARAM_0021
     * @tc.name      testParamPassthrough0021
     * @tc.desc      openLink 的 OpenLinkOptions.parameters 里的负整数 pNeg 原样传到 OpenLinkAbility
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testParamPassthrough0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParamPassthrough0021 begin');
      const parameters: Record<string, Object> = { 'pNeg': -7 };
      const options: OpenLinkOptions = { appLinkingOnly: false, parameters: parameters };
      const observation: LinkObservation = await observeOpenLink('http://docs.openharmony.cn', options);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.topName=${observation.topName}`);
      expect(observation.topName).assertEqual('OpenLinkAbility');
      const actual3: string = JSON.stringify(observation.parameters['pNeg']);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('-7');
      const actual4: string = typeof observation.parameters['pNeg'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('number');
      const actual5: Object = observation.parameters['ohos.aafwk.param.callerAbilityName'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('EntryAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParamPassthrough0021 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_PARAM_0022
     * @tc.name      testParamPassthrough0022
     * @tc.desc      openLink 的 OpenLinkOptions.parameters 里的int32 最大值 pMax 原样传到 OpenLinkAbility
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testParamPassthrough0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParamPassthrough0022 begin');
      const parameters: Record<string, Object> = { 'pMax': 2147483647 };
      const options: OpenLinkOptions = { appLinkingOnly: false, parameters: parameters };
      const observation: LinkObservation = await observeOpenLink('http://docs.openharmony.cn', options);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.topName=${observation.topName}`);
      expect(observation.topName).assertEqual('OpenLinkAbility');
      const actual3: string = JSON.stringify(observation.parameters['pMax']);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('2147483647');
      const actual4: string = typeof observation.parameters['pMax'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('number');
      const actual5: Object = observation.parameters['ohos.aafwk.param.callerAbilityName'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('EntryAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParamPassthrough0022 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_PARAM_0023
     * @tc.name      testParamPassthrough0023
     * @tc.desc      openLink 的 OpenLinkOptions.parameters 里的小数 pFloat 原样传到 OpenLinkAbility
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testParamPassthrough0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParamPassthrough0023 begin');
      const parameters: Record<string, Object> = { 'pFloat': 3.5 };
      const options: OpenLinkOptions = { appLinkingOnly: false, parameters: parameters };
      const observation: LinkObservation = await observeOpenLink('http://docs.openharmony.cn', options);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.topName=${observation.topName}`);
      expect(observation.topName).assertEqual('OpenLinkAbility');
      const actual3: string = JSON.stringify(observation.parameters['pFloat']);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('3.5');
      const actual4: string = typeof observation.parameters['pFloat'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('number');
      const actual5: Object = observation.parameters['ohos.aafwk.param.callerAbilityName'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('EntryAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParamPassthrough0023 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_PARAM_0024
     * @tc.name      testParamPassthrough0024
     * @tc.desc      openLink 的 OpenLinkOptions.parameters 里的true pTrue 原样传到 OpenLinkAbility
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testParamPassthrough0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParamPassthrough0024 begin');
      const parameters: Record<string, Object> = { 'pTrue': true };
      const options: OpenLinkOptions = { appLinkingOnly: false, parameters: parameters };
      const observation: LinkObservation = await observeOpenLink('http://docs.openharmony.cn', options);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.topName=${observation.topName}`);
      expect(observation.topName).assertEqual('OpenLinkAbility');
      const actual3: string = JSON.stringify(observation.parameters['pTrue']);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('true');
      const actual4: string = typeof observation.parameters['pTrue'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('boolean');
      const actual5: Object = observation.parameters['ohos.aafwk.param.callerAbilityName'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('EntryAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParamPassthrough0024 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_PARAM_0025
     * @tc.name      testParamPassthrough0025
     * @tc.desc      openLink 的 OpenLinkOptions.parameters 里的false pFalse 原样传到 OpenLinkAbility
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testParamPassthrough0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParamPassthrough0025 begin');
      const parameters: Record<string, Object> = { 'pFalse': false };
      const options: OpenLinkOptions = { appLinkingOnly: false, parameters: parameters };
      const observation: LinkObservation = await observeOpenLink('http://docs.openharmony.cn', options);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.topName=${observation.topName}`);
      expect(observation.topName).assertEqual('OpenLinkAbility');
      const actual3: string = JSON.stringify(observation.parameters['pFalse']);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('false');
      const actual4: string = typeof observation.parameters['pFalse'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('boolean');
      const actual5: Object = observation.parameters['ohos.aafwk.param.callerAbilityName'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('EntryAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParamPassthrough0025 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_PARAM_0026
     * @tc.name      testParamPassthrough0026
     * @tc.desc      openLink 的 OpenLinkOptions.parameters 里的字符串数组 pStrArr 原样传到 OpenLinkAbility
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testParamPassthrough0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParamPassthrough0026 begin');
      const parameters: Record<string, Object> = { 'pStrArr': ['a', 'b'] };
      const options: OpenLinkOptions = { appLinkingOnly: false, parameters: parameters };
      const observation: LinkObservation = await observeOpenLink('http://docs.openharmony.cn', options);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.topName=${observation.topName}`);
      expect(observation.topName).assertEqual('OpenLinkAbility');
      const actual3: string = JSON.stringify(observation.parameters['pStrArr']);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('["a","b"]');
      const actual4: string = typeof observation.parameters['pStrArr'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('object');
      const actual5: Object = observation.parameters['ohos.aafwk.param.callerAbilityName'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('EntryAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParamPassthrough0026 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_PARAM_0027
     * @tc.name      testParamPassthrough0027
     * @tc.desc      openLink 的 OpenLinkOptions.parameters 里的数字数组 pNumArr 原样传到 OpenLinkAbility
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testParamPassthrough0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParamPassthrough0027 begin');
      const parameters: Record<string, Object> = { 'pNumArr': [1, 2, 3] };
      const options: OpenLinkOptions = { appLinkingOnly: false, parameters: parameters };
      const observation: LinkObservation = await observeOpenLink('http://docs.openharmony.cn', options);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.topName=${observation.topName}`);
      expect(observation.topName).assertEqual('OpenLinkAbility');
      const actual3: string = JSON.stringify(observation.parameters['pNumArr']);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('[1,2,3]');
      const actual4: string = typeof observation.parameters['pNumArr'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('object');
      const actual5: Object = observation.parameters['ohos.aafwk.param.callerAbilityName'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('EntryAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParamPassthrough0027 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_PARAM_0028
     * @tc.name      testParamPassthrough0028
     * @tc.desc      openLink 的 OpenLinkOptions.parameters 里的布尔数组 pBoolArr 原样传到 OpenLinkAbility
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testParamPassthrough0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParamPassthrough0028 begin');
      const parameters: Record<string, Object> = { 'pBoolArr': [true, false] };
      const options: OpenLinkOptions = { appLinkingOnly: false, parameters: parameters };
      const observation: LinkObservation = await observeOpenLink('http://docs.openharmony.cn', options);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.topName=${observation.topName}`);
      expect(observation.topName).assertEqual('OpenLinkAbility');
      const actual3: string = JSON.stringify(observation.parameters['pBoolArr']);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('[true,false]');
      const actual4: string = typeof observation.parameters['pBoolArr'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('object');
      const actual5: Object = observation.parameters['ohos.aafwk.param.callerAbilityName'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('EntryAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParamPassthrough0028 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_PARAM_0029
     * @tc.name      testParamPassthrough0029
     * @tc.desc      startAbility 一次携带 5 个不同类型的自定义参数，全部原样透传
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testParamPassthrough0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParamPassthrough0029 begin');
      const parameters: Record<string, Object> = {
        'pString': 'v',
        'pEmpty': '',
        'pChinese': '中文参数',
        'pLong': 'LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL',
        'pInt': 42
      };
      const want: Want = {
        action: 'ohos.want.action.viewData',
        uri: 'http://docs.openharmony.cn',
        parameters: parameters
      };
      const observation: LinkObservation = await observeStart(want);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(0);
      const actual2: string = JSON.stringify(observation.parameters['pString']);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('"v"');
      const actual3: string = JSON.stringify(observation.parameters['pEmpty']);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('""');
      const actual4: string = JSON.stringify(observation.parameters['pChinese']);
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('"中文参数"');
      const actual5: string = JSON.stringify(observation.parameters['pLong']);
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('"LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL"');
      const actual6: string = JSON.stringify(observation.parameters['pInt']);
      hilog.info(DOMAIN, TAG, '%{public}s', `a6=${actual6}`);
      expect(actual6).assertEqual('42');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParamPassthrough0029 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_PARAM_0030
     * @tc.name      testParamPassthrough0030
     * @tc.desc      openLink 一次携带 5 个不同类型的自定义参数，全部原样透传
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testParamPassthrough0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParamPassthrough0030 begin');
      const parameters: Record<string, Object> = {
        'pString': 'v',
        'pEmpty': '',
        'pChinese': '中文参数',
        'pLong': 'LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL',
        'pInt': 42
      };
      const options: OpenLinkOptions = { appLinkingOnly: false, parameters: parameters };
      const observation: LinkObservation = await observeOpenLink('http://docs.openharmony.cn', options);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(0);
      const actual2: string = JSON.stringify(observation.parameters['pString']);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('"v"');
      const actual3: string = JSON.stringify(observation.parameters['pEmpty']);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('""');
      const actual4: string = JSON.stringify(observation.parameters['pChinese']);
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('"中文参数"');
      const actual5: string = JSON.stringify(observation.parameters['pLong']);
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('"LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL"');
      const actual6: string = JSON.stringify(observation.parameters['pInt']);
      hilog.info(DOMAIN, TAG, '%{public}s', `a6=${actual6}`);
      expect(actual6).assertEqual('42');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParamPassthrough0030 end');
    })
  })
}
