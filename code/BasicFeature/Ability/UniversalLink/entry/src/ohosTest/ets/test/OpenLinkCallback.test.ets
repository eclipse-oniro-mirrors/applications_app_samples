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
import { common, OpenLinkOptions } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import {
  closeOpenLinkAbility,
  dismissNoMatchDialog,
  LinkResultObservation,
  observeOpenLinkResult
} from './LinkHelper';
import { ENTRY_ABILITY, launchAbility } from './TestHelper';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_UniversalLink]';

export default function openLinkCallbackTest(): void {
  describe('UniversalLinkOpenLinkCallbackTest', () => {
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
     * @tc.number    SUB_UNIVERSAL_LINK_OPEN_LINK_CALLBACK_0001
     * @tc.name      testOpenLinkCallback0001
     * @tc.desc      OpenLinkAbility 以 resultCode=0、只带 resultCode结束时，openLink 回调收到同样的结果
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testOpenLinkCallback0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkCallback0001 begin');
      const options: OpenLinkOptions = { appLinkingOnly: false };
      const link: string = 'http://docs.openharmony.cn';
      const result: common.AbilityResult = { resultCode: 0 };
      const observation: LinkResultObservation = await observeOpenLinkResult(link, options, result);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.topName=${observation.topName}`);
      expect(observation.topName).assertEqual('OpenLinkAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.called=${observation.called}`);
      expect(observation.called).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 observation.callbackErrorCode=${observation.callbackErrorCode}`);
      expect(observation.callbackErrorCode).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 observation.resultCode=${observation.resultCode}`);
      expect(observation.resultCode).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkCallback0001 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_OPEN_LINK_CALLBACK_0002
     * @tc.name      testOpenLinkCallback0002
     * @tc.desc      OpenLinkAbility 以 resultCode=0、带一个字符串参数结束时，openLink 回调收到同样的结果
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testOpenLinkCallback0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkCallback0002 begin');
      const options: OpenLinkOptions = { appLinkingOnly: false };
      const link: string = 'http://docs.openharmony.cn';
      const result: common.AbilityResult = { resultCode: 0, want: { parameters: { 'r': 'ok' } } };
      const observation: LinkResultObservation = await observeOpenLinkResult(link, options, result);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.topName=${observation.topName}`);
      expect(observation.topName).assertEqual('OpenLinkAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.called=${observation.called}`);
      expect(observation.called).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 observation.callbackErrorCode=${observation.callbackErrorCode}`);
      expect(observation.callbackErrorCode).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 observation.resultCode=${observation.resultCode}`);
      expect(observation.resultCode).assertEqual(0);
      const actual6: Object = observation.resultParameters['r'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a6=${actual6}`);
      expect(actual6).assertEqual('ok');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkCallback0002 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_OPEN_LINK_CALLBACK_0003
     * @tc.name      testOpenLinkCallback0003
     * @tc.desc      OpenLinkAbility 以 resultCode=0、带字符串与数字两个参数结束时，openLink 回调收到同样的结果
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testOpenLinkCallback0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkCallback0003 begin');
      const options: OpenLinkOptions = { appLinkingOnly: false };
      const link: string = 'http://docs.openharmony.cn';
      const result: common.AbilityResult = { resultCode: 0, want: { parameters: { 'r': 'ok', 'n': 1 } } };
      const observation: LinkResultObservation = await observeOpenLinkResult(link, options, result);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.topName=${observation.topName}`);
      expect(observation.topName).assertEqual('OpenLinkAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.called=${observation.called}`);
      expect(observation.called).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 observation.callbackErrorCode=${observation.callbackErrorCode}`);
      expect(observation.callbackErrorCode).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 observation.resultCode=${observation.resultCode}`);
      expect(observation.resultCode).assertEqual(0);
      const actual6: Object = observation.resultParameters['r'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a6=${actual6}`);
      expect(actual6).assertEqual('ok');
      const actual7: Object = observation.resultParameters['n'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a7=${actual7}`);
      expect(actual7).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkCallback0003 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_OPEN_LINK_CALLBACK_0004
     * @tc.name      testOpenLinkCallback0004
     * @tc.desc      OpenLinkAbility 以 resultCode=1、只带 resultCode结束时，openLink 回调收到同样的结果
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testOpenLinkCallback0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkCallback0004 begin');
      const options: OpenLinkOptions = { appLinkingOnly: false };
      const link: string = 'http://docs.openharmony.cn';
      const result: common.AbilityResult = { resultCode: 1 };
      const observation: LinkResultObservation = await observeOpenLinkResult(link, options, result);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.topName=${observation.topName}`);
      expect(observation.topName).assertEqual('OpenLinkAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.called=${observation.called}`);
      expect(observation.called).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 observation.callbackErrorCode=${observation.callbackErrorCode}`);
      expect(observation.callbackErrorCode).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 observation.resultCode=${observation.resultCode}`);
      expect(observation.resultCode).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkCallback0004 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_OPEN_LINK_CALLBACK_0005
     * @tc.name      testOpenLinkCallback0005
     * @tc.desc      OpenLinkAbility 以 resultCode=1、带一个字符串参数结束时，openLink 回调收到同样的结果
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testOpenLinkCallback0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkCallback0005 begin');
      const options: OpenLinkOptions = { appLinkingOnly: false };
      const link: string = 'http://docs.openharmony.cn';
      const result: common.AbilityResult = { resultCode: 1, want: { parameters: { 'r': 'ok' } } };
      const observation: LinkResultObservation = await observeOpenLinkResult(link, options, result);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.topName=${observation.topName}`);
      expect(observation.topName).assertEqual('OpenLinkAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.called=${observation.called}`);
      expect(observation.called).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 observation.callbackErrorCode=${observation.callbackErrorCode}`);
      expect(observation.callbackErrorCode).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 observation.resultCode=${observation.resultCode}`);
      expect(observation.resultCode).assertEqual(1);
      const actual6: Object = observation.resultParameters['r'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a6=${actual6}`);
      expect(actual6).assertEqual('ok');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkCallback0005 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_OPEN_LINK_CALLBACK_0006
     * @tc.name      testOpenLinkCallback0006
     * @tc.desc      OpenLinkAbility 以 resultCode=1、带字符串与数字两个参数结束时，openLink 回调收到同样的结果
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testOpenLinkCallback0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkCallback0006 begin');
      const options: OpenLinkOptions = { appLinkingOnly: false };
      const link: string = 'http://docs.openharmony.cn';
      const result: common.AbilityResult = { resultCode: 1, want: { parameters: { 'r': 'ok', 'n': 1 } } };
      const observation: LinkResultObservation = await observeOpenLinkResult(link, options, result);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.topName=${observation.topName}`);
      expect(observation.topName).assertEqual('OpenLinkAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.called=${observation.called}`);
      expect(observation.called).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 observation.callbackErrorCode=${observation.callbackErrorCode}`);
      expect(observation.callbackErrorCode).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 observation.resultCode=${observation.resultCode}`);
      expect(observation.resultCode).assertEqual(1);
      const actual6: Object = observation.resultParameters['r'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a6=${actual6}`);
      expect(actual6).assertEqual('ok');
      const actual7: Object = observation.resultParameters['n'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a7=${actual7}`);
      expect(actual7).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkCallback0006 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_OPEN_LINK_CALLBACK_0007
     * @tc.name      testOpenLinkCallback0007
     * @tc.desc      OpenLinkAbility 以 resultCode=-1、只带 resultCode结束时，openLink 回调收到同样的结果
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testOpenLinkCallback0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkCallback0007 begin');
      const options: OpenLinkOptions = { appLinkingOnly: false };
      const link: string = 'http://docs.openharmony.cn';
      const result: common.AbilityResult = { resultCode: -1 };
      const observation: LinkResultObservation = await observeOpenLinkResult(link, options, result);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.topName=${observation.topName}`);
      expect(observation.topName).assertEqual('OpenLinkAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.called=${observation.called}`);
      expect(observation.called).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 observation.callbackErrorCode=${observation.callbackErrorCode}`);
      expect(observation.callbackErrorCode).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 observation.resultCode=${observation.resultCode}`);
      expect(observation.resultCode).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkCallback0007 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_OPEN_LINK_CALLBACK_0008
     * @tc.name      testOpenLinkCallback0008
     * @tc.desc      OpenLinkAbility 以 resultCode=-1、带一个字符串参数结束时，openLink 回调收到同样的结果
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testOpenLinkCallback0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkCallback0008 begin');
      const options: OpenLinkOptions = { appLinkingOnly: false };
      const link: string = 'http://docs.openharmony.cn';
      const result: common.AbilityResult = { resultCode: -1, want: { parameters: { 'r': 'ok' } } };
      const observation: LinkResultObservation = await observeOpenLinkResult(link, options, result);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.topName=${observation.topName}`);
      expect(observation.topName).assertEqual('OpenLinkAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.called=${observation.called}`);
      expect(observation.called).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 observation.callbackErrorCode=${observation.callbackErrorCode}`);
      expect(observation.callbackErrorCode).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 observation.resultCode=${observation.resultCode}`);
      expect(observation.resultCode).assertEqual(-1);
      const actual6: Object = observation.resultParameters['r'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a6=${actual6}`);
      expect(actual6).assertEqual('ok');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkCallback0008 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_OPEN_LINK_CALLBACK_0009
     * @tc.name      testOpenLinkCallback0009
     * @tc.desc      OpenLinkAbility 以 resultCode=-1、带字符串与数字两个参数结束时，openLink 回调收到同样的结果
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testOpenLinkCallback0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkCallback0009 begin');
      const options: OpenLinkOptions = { appLinkingOnly: false };
      const link: string = 'http://docs.openharmony.cn';
      const result: common.AbilityResult = { resultCode: -1, want: { parameters: { 'r': 'ok', 'n': 1 } } };
      const observation: LinkResultObservation = await observeOpenLinkResult(link, options, result);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.topName=${observation.topName}`);
      expect(observation.topName).assertEqual('OpenLinkAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.called=${observation.called}`);
      expect(observation.called).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 observation.callbackErrorCode=${observation.callbackErrorCode}`);
      expect(observation.callbackErrorCode).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 observation.resultCode=${observation.resultCode}`);
      expect(observation.resultCode).assertEqual(-1);
      const actual6: Object = observation.resultParameters['r'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a6=${actual6}`);
      expect(actual6).assertEqual('ok');
      const actual7: Object = observation.resultParameters['n'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a7=${actual7}`);
      expect(actual7).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkCallback0009 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_OPEN_LINK_CALLBACK_0010
     * @tc.name      testOpenLinkCallback0010
     * @tc.desc      OpenLinkAbility 以 resultCode=7、只带 resultCode结束时，openLink 回调收到同样的结果
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testOpenLinkCallback0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkCallback0010 begin');
      const options: OpenLinkOptions = { appLinkingOnly: false };
      const link: string = 'http://docs.openharmony.cn';
      const result: common.AbilityResult = { resultCode: 7 };
      const observation: LinkResultObservation = await observeOpenLinkResult(link, options, result);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.topName=${observation.topName}`);
      expect(observation.topName).assertEqual('OpenLinkAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.called=${observation.called}`);
      expect(observation.called).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 observation.callbackErrorCode=${observation.callbackErrorCode}`);
      expect(observation.callbackErrorCode).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 observation.resultCode=${observation.resultCode}`);
      expect(observation.resultCode).assertEqual(7);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkCallback0010 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_OPEN_LINK_CALLBACK_0011
     * @tc.name      testOpenLinkCallback0011
     * @tc.desc      OpenLinkAbility 以 resultCode=7、带一个字符串参数结束时，openLink 回调收到同样的结果
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testOpenLinkCallback0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkCallback0011 begin');
      const options: OpenLinkOptions = { appLinkingOnly: false };
      const link: string = 'http://docs.openharmony.cn';
      const result: common.AbilityResult = { resultCode: 7, want: { parameters: { 'r': 'ok' } } };
      const observation: LinkResultObservation = await observeOpenLinkResult(link, options, result);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.topName=${observation.topName}`);
      expect(observation.topName).assertEqual('OpenLinkAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.called=${observation.called}`);
      expect(observation.called).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 observation.callbackErrorCode=${observation.callbackErrorCode}`);
      expect(observation.callbackErrorCode).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 observation.resultCode=${observation.resultCode}`);
      expect(observation.resultCode).assertEqual(7);
      const actual6: Object = observation.resultParameters['r'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a6=${actual6}`);
      expect(actual6).assertEqual('ok');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkCallback0011 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_OPEN_LINK_CALLBACK_0012
     * @tc.name      testOpenLinkCallback0012
     * @tc.desc      OpenLinkAbility 以 resultCode=7、带字符串与数字两个参数结束时，openLink 回调收到同样的结果
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testOpenLinkCallback0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkCallback0012 begin');
      const options: OpenLinkOptions = { appLinkingOnly: false };
      const link: string = 'http://docs.openharmony.cn';
      const result: common.AbilityResult = { resultCode: 7, want: { parameters: { 'r': 'ok', 'n': 1 } } };
      const observation: LinkResultObservation = await observeOpenLinkResult(link, options, result);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.topName=${observation.topName}`);
      expect(observation.topName).assertEqual('OpenLinkAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.called=${observation.called}`);
      expect(observation.called).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 observation.callbackErrorCode=${observation.callbackErrorCode}`);
      expect(observation.callbackErrorCode).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 observation.resultCode=${observation.resultCode}`);
      expect(observation.resultCode).assertEqual(7);
      const actual6: Object = observation.resultParameters['r'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a6=${actual6}`);
      expect(actual6).assertEqual('ok');
      const actual7: Object = observation.resultParameters['n'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a7=${actual7}`);
      expect(actual7).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkCallback0012 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_OPEN_LINK_CALLBACK_0013
     * @tc.name      testOpenLinkCallback0013
     * @tc.desc      OpenLinkAbility 以 resultCode=100、只带 resultCode结束时，openLink 回调收到同样的结果
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testOpenLinkCallback0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkCallback0013 begin');
      const options: OpenLinkOptions = { appLinkingOnly: false };
      const link: string = 'http://docs.openharmony.cn';
      const result: common.AbilityResult = { resultCode: 100 };
      const observation: LinkResultObservation = await observeOpenLinkResult(link, options, result);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.topName=${observation.topName}`);
      expect(observation.topName).assertEqual('OpenLinkAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.called=${observation.called}`);
      expect(observation.called).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 observation.callbackErrorCode=${observation.callbackErrorCode}`);
      expect(observation.callbackErrorCode).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 observation.resultCode=${observation.resultCode}`);
      expect(observation.resultCode).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkCallback0013 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_OPEN_LINK_CALLBACK_0014
     * @tc.name      testOpenLinkCallback0014
     * @tc.desc      OpenLinkAbility 以 resultCode=100、带一个字符串参数结束时，openLink 回调收到同样的结果
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testOpenLinkCallback0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkCallback0014 begin');
      const options: OpenLinkOptions = { appLinkingOnly: false };
      const link: string = 'http://docs.openharmony.cn';
      const result: common.AbilityResult = { resultCode: 100, want: { parameters: { 'r': 'ok' } } };
      const observation: LinkResultObservation = await observeOpenLinkResult(link, options, result);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.topName=${observation.topName}`);
      expect(observation.topName).assertEqual('OpenLinkAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.called=${observation.called}`);
      expect(observation.called).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 observation.callbackErrorCode=${observation.callbackErrorCode}`);
      expect(observation.callbackErrorCode).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 observation.resultCode=${observation.resultCode}`);
      expect(observation.resultCode).assertEqual(100);
      const actual6: Object = observation.resultParameters['r'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a6=${actual6}`);
      expect(actual6).assertEqual('ok');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkCallback0014 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_OPEN_LINK_CALLBACK_0015
     * @tc.name      testOpenLinkCallback0015
     * @tc.desc      OpenLinkAbility 以 resultCode=100、带字符串与数字两个参数结束时，openLink 回调收到同样的结果
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testOpenLinkCallback0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkCallback0015 begin');
      const options: OpenLinkOptions = { appLinkingOnly: false };
      const link: string = 'http://docs.openharmony.cn';
      const result: common.AbilityResult = { resultCode: 100, want: { parameters: { 'r': 'ok', 'n': 1 } } };
      const observation: LinkResultObservation = await observeOpenLinkResult(link, options, result);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.topName=${observation.topName}`);
      expect(observation.topName).assertEqual('OpenLinkAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.called=${observation.called}`);
      expect(observation.called).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 observation.callbackErrorCode=${observation.callbackErrorCode}`);
      expect(observation.callbackErrorCode).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 observation.resultCode=${observation.resultCode}`);
      expect(observation.resultCode).assertEqual(100);
      const actual6: Object = observation.resultParameters['r'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a6=${actual6}`);
      expect(actual6).assertEqual('ok');
      const actual7: Object = observation.resultParameters['n'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a7=${actual7}`);
      expect(actual7).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkCallback0015 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_OPEN_LINK_CALLBACK_0016
     * @tc.name      testOpenLinkCallback0016
     * @tc.desc      OpenLinkAbility 以 resultCode=2147483647、只带 resultCode结束时，openLink 回调收到同样的结果
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testOpenLinkCallback0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkCallback0016 begin');
      const options: OpenLinkOptions = { appLinkingOnly: false };
      const link: string = 'http://docs.openharmony.cn';
      const result: common.AbilityResult = { resultCode: 2147483647 };
      const observation: LinkResultObservation = await observeOpenLinkResult(link, options, result);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.topName=${observation.topName}`);
      expect(observation.topName).assertEqual('OpenLinkAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.called=${observation.called}`);
      expect(observation.called).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 observation.callbackErrorCode=${observation.callbackErrorCode}`);
      expect(observation.callbackErrorCode).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 observation.resultCode=${observation.resultCode}`);
      expect(observation.resultCode).assertEqual(2147483647);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkCallback0016 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_OPEN_LINK_CALLBACK_0017
     * @tc.name      testOpenLinkCallback0017
     * @tc.desc      OpenLinkAbility 以 resultCode=2147483647、带一个字符串参数结束时，openLink 回调收到同样的结果
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testOpenLinkCallback0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkCallback0017 begin');
      const options: OpenLinkOptions = { appLinkingOnly: false };
      const link: string = 'http://docs.openharmony.cn';
      const result: common.AbilityResult = { resultCode: 2147483647, want: { parameters: { 'r': 'ok' } } };
      const observation: LinkResultObservation = await observeOpenLinkResult(link, options, result);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.topName=${observation.topName}`);
      expect(observation.topName).assertEqual('OpenLinkAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.called=${observation.called}`);
      expect(observation.called).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 observation.callbackErrorCode=${observation.callbackErrorCode}`);
      expect(observation.callbackErrorCode).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 observation.resultCode=${observation.resultCode}`);
      expect(observation.resultCode).assertEqual(2147483647);
      const actual6: Object = observation.resultParameters['r'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a6=${actual6}`);
      expect(actual6).assertEqual('ok');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkCallback0017 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_OPEN_LINK_CALLBACK_0018
     * @tc.name      testOpenLinkCallback0018
     * @tc.desc      OpenLinkAbility 以 resultCode=2147483647、带字符串与数字两个参数结束时，openLink 回调收到同样的结果
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testOpenLinkCallback0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkCallback0018 begin');
      const options: OpenLinkOptions = { appLinkingOnly: false };
      const link: string = 'http://docs.openharmony.cn';
      const result: common.AbilityResult = { resultCode: 2147483647, want: { parameters: { 'r': 'ok', 'n': 1 } } };
      const observation: LinkResultObservation = await observeOpenLinkResult(link, options, result);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.topName=${observation.topName}`);
      expect(observation.topName).assertEqual('OpenLinkAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.called=${observation.called}`);
      expect(observation.called).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 observation.callbackErrorCode=${observation.callbackErrorCode}`);
      expect(observation.callbackErrorCode).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 observation.resultCode=${observation.resultCode}`);
      expect(observation.resultCode).assertEqual(2147483647);
      const actual6: Object = observation.resultParameters['r'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a6=${actual6}`);
      expect(actual6).assertEqual('ok');
      const actual7: Object = observation.resultParameters['n'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a7=${actual7}`);
      expect(actual7).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkCallback0018 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_OPEN_LINK_CALLBACK_0019
     * @tc.name      testOpenLinkCallback0019
     * @tc.desc      OpenLinkAbility 以 resultCode=-100、只带 resultCode结束时，openLink 回调收到同样的结果
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testOpenLinkCallback0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkCallback0019 begin');
      const options: OpenLinkOptions = { appLinkingOnly: false };
      const link: string = 'http://docs.openharmony.cn';
      const result: common.AbilityResult = { resultCode: -100 };
      const observation: LinkResultObservation = await observeOpenLinkResult(link, options, result);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.topName=${observation.topName}`);
      expect(observation.topName).assertEqual('OpenLinkAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.called=${observation.called}`);
      expect(observation.called).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 observation.callbackErrorCode=${observation.callbackErrorCode}`);
      expect(observation.callbackErrorCode).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 observation.resultCode=${observation.resultCode}`);
      expect(observation.resultCode).assertEqual(-100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkCallback0019 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_OPEN_LINK_CALLBACK_0020
     * @tc.name      testOpenLinkCallback0020
     * @tc.desc      OpenLinkAbility 以 resultCode=-100、带一个字符串参数结束时，openLink 回调收到同样的结果
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testOpenLinkCallback0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkCallback0020 begin');
      const options: OpenLinkOptions = { appLinkingOnly: false };
      const link: string = 'http://docs.openharmony.cn';
      const result: common.AbilityResult = { resultCode: -100, want: { parameters: { 'r': 'ok' } } };
      const observation: LinkResultObservation = await observeOpenLinkResult(link, options, result);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.topName=${observation.topName}`);
      expect(observation.topName).assertEqual('OpenLinkAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.called=${observation.called}`);
      expect(observation.called).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 observation.callbackErrorCode=${observation.callbackErrorCode}`);
      expect(observation.callbackErrorCode).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 observation.resultCode=${observation.resultCode}`);
      expect(observation.resultCode).assertEqual(-100);
      const actual6: Object = observation.resultParameters['r'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a6=${actual6}`);
      expect(actual6).assertEqual('ok');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkCallback0020 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_OPEN_LINK_CALLBACK_0021
     * @tc.name      testOpenLinkCallback0021
     * @tc.desc      OpenLinkAbility 以 resultCode=-100、带字符串与数字两个参数结束时，openLink 回调收到同样的结果
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testOpenLinkCallback0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkCallback0021 begin');
      const options: OpenLinkOptions = { appLinkingOnly: false };
      const link: string = 'http://docs.openharmony.cn';
      const result: common.AbilityResult = { resultCode: -100, want: { parameters: { 'r': 'ok', 'n': 1 } } };
      const observation: LinkResultObservation = await observeOpenLinkResult(link, options, result);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.topName=${observation.topName}`);
      expect(observation.topName).assertEqual('OpenLinkAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.called=${observation.called}`);
      expect(observation.called).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 observation.callbackErrorCode=${observation.callbackErrorCode}`);
      expect(observation.callbackErrorCode).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 observation.resultCode=${observation.resultCode}`);
      expect(observation.resultCode).assertEqual(-100);
      const actual6: Object = observation.resultParameters['r'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a6=${actual6}`);
      expect(actual6).assertEqual('ok');
      const actual7: Object = observation.resultParameters['n'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a7=${actual7}`);
      expect(actual7).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkCallback0021 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_OPEN_LINK_CALLBACK_0022
     * @tc.name      testOpenLinkCallback0022
     * @tc.desc      openLink 打开 "http://docs.openharmony.cn" 后被打开方直接 terminateSelf，回调 resultCode=-1
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testOpenLinkCallback0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkCallback0022 begin');
      const link: string = 'http://docs.openharmony.cn';
      const options: OpenLinkOptions = { appLinkingOnly: false };
      const observation: LinkResultObservation = await observeOpenLinkResult(link, options);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.uri=${observation.uri}`);
      expect(observation.uri).assertEqual('http://docs.openharmony.cn');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.called=${observation.called}`);
      expect(observation.called).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 observation.callbackErrorCode=${observation.callbackErrorCode}`);
      expect(observation.callbackErrorCode).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 observation.resultCode=${observation.resultCode}`);
      expect(observation.resultCode).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkCallback0022 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_OPEN_LINK_CALLBACK_0023
     * @tc.name      testOpenLinkCallback0023
     * @tc.desc      openLink 打开 "http://docs.openharmony.cn/pages" 后被打开方直接 terminateSelf，回调 resultCode=-1
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testOpenLinkCallback0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkCallback0023 begin');
      const link: string = 'http://docs.openharmony.cn/pages';
      const options: OpenLinkOptions = { appLinkingOnly: false };
      const observation: LinkResultObservation = await observeOpenLinkResult(link, options);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.uri=${observation.uri}`);
      expect(observation.uri).assertEqual('http://docs.openharmony.cn/pages');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.called=${observation.called}`);
      expect(observation.called).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 observation.callbackErrorCode=${observation.callbackErrorCode}`);
      expect(observation.callbackErrorCode).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 observation.resultCode=${observation.resultCode}`);
      expect(observation.resultCode).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkCallback0023 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_OPEN_LINK_CALLBACK_0024
     * @tc.name      testOpenLinkCallback0024
     * @tc.desc      openLink 打开 "http://docs.openharmony.cn:8080" 后被打开方直接 terminateSelf，回调 resultCode=-1
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testOpenLinkCallback0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkCallback0024 begin');
      const link: string = 'http://docs.openharmony.cn:8080';
      const options: OpenLinkOptions = { appLinkingOnly: false };
      const observation: LinkResultObservation = await observeOpenLinkResult(link, options);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.uri=${observation.uri}`);
      expect(observation.uri).assertEqual('http://docs.openharmony.cn:8080');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.called=${observation.called}`);
      expect(observation.called).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 observation.callbackErrorCode=${observation.callbackErrorCode}`);
      expect(observation.callbackErrorCode).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 observation.resultCode=${observation.resultCode}`);
      expect(observation.resultCode).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkCallback0024 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_OPEN_LINK_CALLBACK_0025
     * @tc.name      testOpenLinkCallback0025
     * @tc.desc      openLink 打开 "HTTP://DOCS.OPENHARMONY.CN" 后被打开方直接 terminateSelf，回调 resultCode=-1
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testOpenLinkCallback0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkCallback0025 begin');
      const link: string = 'HTTP://DOCS.OPENHARMONY.CN';
      const options: OpenLinkOptions = { appLinkingOnly: false };
      const observation: LinkResultObservation = await observeOpenLinkResult(link, options);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.uri=${observation.uri}`);
      expect(observation.uri).assertEqual('HTTP://DOCS.OPENHARMONY.CN');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.called=${observation.called}`);
      expect(observation.called).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 observation.callbackErrorCode=${observation.callbackErrorCode}`);
      expect(observation.callbackErrorCode).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 observation.resultCode=${observation.resultCode}`);
      expect(observation.resultCode).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkCallback0025 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_OPEN_LINK_CALLBACK_0026
     * @tc.name      testOpenLinkCallback0026
     * @tc.desc      空 options下回调形态的 openLink 同样拉起 OpenLinkAbility 并收到 resultCode=5
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testOpenLinkCallback0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkCallback0026 begin');
      const link: string = 'http://docs.openharmony.cn';
      const options: OpenLinkOptions = {};
      const result: common.AbilityResult = { resultCode: 5 };
      const observation: LinkResultObservation = await observeOpenLinkResult(link, options, result);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.topName=${observation.topName}`);
      expect(observation.topName).assertEqual('OpenLinkAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.called=${observation.called}`);
      expect(observation.called).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 observation.resultCode=${observation.resultCode}`);
      expect(observation.resultCode).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkCallback0026 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_OPEN_LINK_CALLBACK_0027
     * @tc.name      testOpenLinkCallback0027
     * @tc.desc      带 parameters 的 options下回调形态的 openLink 同样拉起 OpenLinkAbility 并收到 resultCode=5
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testOpenLinkCallback0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkCallback0027 begin');
      const link: string = 'http://docs.openharmony.cn';
      const options: OpenLinkOptions = { appLinkingOnly: false, parameters: { 'from': 'callback' } };
      const result: common.AbilityResult = { resultCode: 5 };
      const observation: LinkResultObservation = await observeOpenLinkResult(link, options, result);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.topName=${observation.topName}`);
      expect(observation.topName).assertEqual('OpenLinkAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.called=${observation.called}`);
      expect(observation.called).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 observation.resultCode=${observation.resultCode}`);
      expect(observation.resultCode).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkCallback0027 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_OPEN_LINK_CALLBACK_0028
     * @tc.name      testOpenLinkCallback0028
     * @tc.desc      回调形态的 openLink 打开https 链接时直接抛 16000019，弹出系统提示，回调不会被调用
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testOpenLinkCallback0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkCallback0028 begin');
      const link: string = 'https://docs.openharmony.cn';
      const options: OpenLinkOptions = { appLinkingOnly: false };
      const observation: LinkResultObservation = await observeOpenLinkResult(link, options);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(16000019);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.dialogShown=${observation.dialogShown}`);
      expect(observation.dialogShown).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.called=${observation.called}`);
      expect(observation.called).assertFalse();
      const actual4: boolean = observation.topName === 'OpenLinkAbility';
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkCallback0028 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_OPEN_LINK_CALLBACK_0029
     * @tc.name      testOpenLinkCallback0029
     * @tc.desc      回调形态的 openLink 打开其他子域时直接抛 16000019，弹出系统提示，回调不会被调用
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testOpenLinkCallback0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkCallback0029 begin');
      const link: string = 'http://www.openharmony.cn';
      const options: OpenLinkOptions = { appLinkingOnly: false };
      const observation: LinkResultObservation = await observeOpenLinkResult(link, options);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(16000019);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.dialogShown=${observation.dialogShown}`);
      expect(observation.dialogShown).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.called=${observation.called}`);
      expect(observation.called).assertFalse();
      const actual4: boolean = observation.topName === 'OpenLinkAbility';
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkCallback0029 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_OPEN_LINK_CALLBACK_0030
     * @tc.name      testOpenLinkCallback0030
     * @tc.desc      回调形态的 openLink 打开ftp 链接时直接抛 16000019，弹出系统提示，回调不会被调用
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testOpenLinkCallback0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkCallback0030 begin');
      const link: string = 'ftp://docs.openharmony.cn';
      const options: OpenLinkOptions = { appLinkingOnly: false };
      const observation: LinkResultObservation = await observeOpenLinkResult(link, options);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(16000019);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.dialogShown=${observation.dialogShown}`);
      expect(observation.dialogShown).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.called=${observation.called}`);
      expect(observation.called).assertFalse();
      const actual4: boolean = observation.topName === 'OpenLinkAbility';
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkCallback0030 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_OPEN_LINK_CALLBACK_0031
     * @tc.name      testOpenLinkCallback0031
     * @tc.desc      回调形态的 openLink 打开appLinkingOnly=true 的匹配链接时直接抛 16000019，不弹系统提示，回调不会被调用
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testOpenLinkCallback0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkCallback0031 begin');
      const link: string = 'http://docs.openharmony.cn';
      const options: OpenLinkOptions = { appLinkingOnly: true };
      const observation: LinkResultObservation = await observeOpenLinkResult(link, options);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(16000019);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.dialogShown=${observation.dialogShown}`);
      expect(observation.dialogShown).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.called=${observation.called}`);
      expect(observation.called).assertFalse();
      const actual4: boolean = observation.topName === 'OpenLinkAbility';
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkCallback0031 end');
    })
  })
}
