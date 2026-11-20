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
import { OpenLinkOptions } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import {
  closeOpenLinkAbility,
  dismissNoMatchDialog,
  LinkObservation,
  observeOpenLink
} from './LinkHelper';
import { ENTRY_ABILITY, launchAbility } from './TestHelper';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_UniversalLink]';
const PARSE_FAILED: string = 'Parse param link or openLinkOptions failed, ' +
  'link must be string, openLinkOptions must be options.';

export default function openLinkMatrixCoreTest(): void {
  describe('UniversalLinkOpenLinkMatrixCoreTest', () => {
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
     * @tc.number    SUB_UNIVERSAL_LINK_OPEN_LINK_0001
     * @tc.name      testOpenLinkMatrix0001
     * @tc.desc      openLink "http://docs.openharmony.cn"，不传 options：拉起 OpenLinkAbility 且 uri 不变
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testOpenLinkMatrix0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkMatrix0001 begin');
      const link: string = 'http://docs.openharmony.cn';
      const observation: LinkObservation = await observeOpenLink(link);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.topName=${observation.topName}`);
      expect(observation.topName).assertEqual('OpenLinkAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.uri=${observation.uri}`);
      expect(observation.uri).assertEqual('http://docs.openharmony.cn');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 observation.action=${observation.action}`);
      expect(observation.action).assertEqual('ohos.want.action.viewData');
      const actual5: Object = observation.parameters['ohos.aafwk.param.callerAbilityName'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('EntryAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkMatrix0001 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_OPEN_LINK_0002
     * @tc.name      testOpenLinkMatrix0002
     * @tc.desc      openLink "http://docs.openharmony.cn"，空 options：拉起 OpenLinkAbility 且 uri 不变
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testOpenLinkMatrix0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkMatrix0002 begin');
      const link: string = 'http://docs.openharmony.cn';
      const options: OpenLinkOptions = {};
      const observation: LinkObservation = await observeOpenLink(link, options);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.topName=${observation.topName}`);
      expect(observation.topName).assertEqual('OpenLinkAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.uri=${observation.uri}`);
      expect(observation.uri).assertEqual('http://docs.openharmony.cn');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 observation.action=${observation.action}`);
      expect(observation.action).assertEqual('ohos.want.action.viewData');
      const actual5: Object = observation.parameters['ohos.aafwk.param.callerAbilityName'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('EntryAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkMatrix0002 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_OPEN_LINK_0003
     * @tc.name      testOpenLinkMatrix0003
     * @tc.desc      openLink "http://docs.openharmony.cn"，appLinkingOnly=false：拉起 OpenLinkAbility 且 uri 不变
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testOpenLinkMatrix0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkMatrix0003 begin');
      const link: string = 'http://docs.openharmony.cn';
      const options: OpenLinkOptions = { appLinkingOnly: false };
      const observation: LinkObservation = await observeOpenLink(link, options);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.topName=${observation.topName}`);
      expect(observation.topName).assertEqual('OpenLinkAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.uri=${observation.uri}`);
      expect(observation.uri).assertEqual('http://docs.openharmony.cn');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 observation.action=${observation.action}`);
      expect(observation.action).assertEqual('ohos.want.action.viewData');
      const actual5: Object = observation.parameters['ohos.aafwk.param.callerAbilityName'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('EntryAbility');
      const actual6: Object = observation.parameters['appLinkingOnly'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a6=${actual6}`);
      expect(actual6).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkMatrix0003 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_OPEN_LINK_0004
     * @tc.name      testOpenLinkMatrix0004
     * @tc.desc      openLink "http://docs.openharmony.cn"，appLinkingOnly=true：未做域名校验，返回 16000019 且不弹提示
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testOpenLinkMatrix0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkMatrix0004 begin');
      const link: string = 'http://docs.openharmony.cn';
      const options: OpenLinkOptions = { appLinkingOnly: true };
      const observation: LinkObservation = await observeOpenLink(link, options);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(16000019);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.message=${observation.message}`);
      expect(observation.message).assertEqual('No matching ability is found.');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.dialogShown=${observation.dialogShown}`);
      expect(observation.dialogShown).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 observation.topName=${observation.topName}`);
      expect(observation.topName).assertEqual('EntryAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkMatrix0004 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_OPEN_LINK_0005
     * @tc.name      testOpenLinkMatrix0005
     * @tc.desc      openLink "http://docs.openharmony.cn"，带 parameters：拉起 OpenLinkAbility 且 uri 不变
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testOpenLinkMatrix0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkMatrix0005 begin');
      const link: string = 'http://docs.openharmony.cn';
      const options: OpenLinkOptions = { appLinkingOnly: false, parameters: { 'from': 'matrix' } };
      const observation: LinkObservation = await observeOpenLink(link, options);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.topName=${observation.topName}`);
      expect(observation.topName).assertEqual('OpenLinkAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.uri=${observation.uri}`);
      expect(observation.uri).assertEqual('http://docs.openharmony.cn');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 observation.action=${observation.action}`);
      expect(observation.action).assertEqual('ohos.want.action.viewData');
      const actual5: Object = observation.parameters['ohos.aafwk.param.callerAbilityName'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('EntryAbility');
      const actual6: Object = observation.parameters['appLinkingOnly'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a6=${actual6}`);
      expect(actual6).assertEqual(false);
      const actual7: Object = observation.parameters['from'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a7=${actual7}`);
      expect(actual7).assertEqual('matrix');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkMatrix0005 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_OPEN_LINK_0006
     * @tc.name      testOpenLinkMatrix0006
     * @tc.desc      openLink "http://docs.openharmony.cn/"，不传 options：拉起 OpenLinkAbility 且 uri 不变
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testOpenLinkMatrix0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkMatrix0006 begin');
      const link: string = 'http://docs.openharmony.cn/';
      const observation: LinkObservation = await observeOpenLink(link);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.topName=${observation.topName}`);
      expect(observation.topName).assertEqual('OpenLinkAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.uri=${observation.uri}`);
      expect(observation.uri).assertEqual('http://docs.openharmony.cn/');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 observation.action=${observation.action}`);
      expect(observation.action).assertEqual('ohos.want.action.viewData');
      const actual5: Object = observation.parameters['ohos.aafwk.param.callerAbilityName'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('EntryAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkMatrix0006 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_OPEN_LINK_0007
     * @tc.name      testOpenLinkMatrix0007
     * @tc.desc      openLink "http://docs.openharmony.cn/"，空 options：拉起 OpenLinkAbility 且 uri 不变
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testOpenLinkMatrix0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkMatrix0007 begin');
      const link: string = 'http://docs.openharmony.cn/';
      const options: OpenLinkOptions = {};
      const observation: LinkObservation = await observeOpenLink(link, options);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.topName=${observation.topName}`);
      expect(observation.topName).assertEqual('OpenLinkAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.uri=${observation.uri}`);
      expect(observation.uri).assertEqual('http://docs.openharmony.cn/');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 observation.action=${observation.action}`);
      expect(observation.action).assertEqual('ohos.want.action.viewData');
      const actual5: Object = observation.parameters['ohos.aafwk.param.callerAbilityName'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('EntryAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkMatrix0007 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_OPEN_LINK_0008
     * @tc.name      testOpenLinkMatrix0008
     * @tc.desc      openLink "http://docs.openharmony.cn/"，appLinkingOnly=false：拉起 OpenLinkAbility 且 uri 不变
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testOpenLinkMatrix0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkMatrix0008 begin');
      const link: string = 'http://docs.openharmony.cn/';
      const options: OpenLinkOptions = { appLinkingOnly: false };
      const observation: LinkObservation = await observeOpenLink(link, options);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.topName=${observation.topName}`);
      expect(observation.topName).assertEqual('OpenLinkAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.uri=${observation.uri}`);
      expect(observation.uri).assertEqual('http://docs.openharmony.cn/');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 observation.action=${observation.action}`);
      expect(observation.action).assertEqual('ohos.want.action.viewData');
      const actual5: Object = observation.parameters['ohos.aafwk.param.callerAbilityName'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('EntryAbility');
      const actual6: Object = observation.parameters['appLinkingOnly'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a6=${actual6}`);
      expect(actual6).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkMatrix0008 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_OPEN_LINK_0009
     * @tc.name      testOpenLinkMatrix0009
     * @tc.desc      openLink "http://docs.openharmony.cn/"，appLinkingOnly=true：未做域名校验，返回 16000019 且不弹提示
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testOpenLinkMatrix0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkMatrix0009 begin');
      const link: string = 'http://docs.openharmony.cn/';
      const options: OpenLinkOptions = { appLinkingOnly: true };
      const observation: LinkObservation = await observeOpenLink(link, options);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(16000019);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.message=${observation.message}`);
      expect(observation.message).assertEqual('No matching ability is found.');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.dialogShown=${observation.dialogShown}`);
      expect(observation.dialogShown).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 observation.topName=${observation.topName}`);
      expect(observation.topName).assertEqual('EntryAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkMatrix0009 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_OPEN_LINK_0010
     * @tc.name      testOpenLinkMatrix0010
     * @tc.desc      openLink "http://docs.openharmony.cn/"，带 parameters：拉起 OpenLinkAbility 且 uri 不变
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testOpenLinkMatrix0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkMatrix0010 begin');
      const link: string = 'http://docs.openharmony.cn/';
      const options: OpenLinkOptions = { appLinkingOnly: false, parameters: { 'from': 'matrix' } };
      const observation: LinkObservation = await observeOpenLink(link, options);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.topName=${observation.topName}`);
      expect(observation.topName).assertEqual('OpenLinkAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.uri=${observation.uri}`);
      expect(observation.uri).assertEqual('http://docs.openharmony.cn/');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 observation.action=${observation.action}`);
      expect(observation.action).assertEqual('ohos.want.action.viewData');
      const actual5: Object = observation.parameters['ohos.aafwk.param.callerAbilityName'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('EntryAbility');
      const actual6: Object = observation.parameters['appLinkingOnly'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a6=${actual6}`);
      expect(actual6).assertEqual(false);
      const actual7: Object = observation.parameters['from'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a7=${actual7}`);
      expect(actual7).assertEqual('matrix');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkMatrix0010 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_OPEN_LINK_0011
     * @tc.name      testOpenLinkMatrix0011
     * @tc.desc      openLink "http://docs.openharmony.cn/pages/v4.1"，不传 options：拉起 OpenLinkAbility 且 uri 不变
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testOpenLinkMatrix0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkMatrix0011 begin');
      const link: string = 'http://docs.openharmony.cn/pages/v4.1';
      const observation: LinkObservation = await observeOpenLink(link);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.topName=${observation.topName}`);
      expect(observation.topName).assertEqual('OpenLinkAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.uri=${observation.uri}`);
      expect(observation.uri).assertEqual('http://docs.openharmony.cn/pages/v4.1');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 observation.action=${observation.action}`);
      expect(observation.action).assertEqual('ohos.want.action.viewData');
      const actual5: Object = observation.parameters['ohos.aafwk.param.callerAbilityName'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('EntryAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkMatrix0011 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_OPEN_LINK_0012
     * @tc.name      testOpenLinkMatrix0012
     * @tc.desc      openLink "http://docs.openharmony.cn/pages/v4.1"，空 options：拉起 OpenLinkAbility 且 uri 不变
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testOpenLinkMatrix0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkMatrix0012 begin');
      const link: string = 'http://docs.openharmony.cn/pages/v4.1';
      const options: OpenLinkOptions = {};
      const observation: LinkObservation = await observeOpenLink(link, options);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.topName=${observation.topName}`);
      expect(observation.topName).assertEqual('OpenLinkAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.uri=${observation.uri}`);
      expect(observation.uri).assertEqual('http://docs.openharmony.cn/pages/v4.1');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 observation.action=${observation.action}`);
      expect(observation.action).assertEqual('ohos.want.action.viewData');
      const actual5: Object = observation.parameters['ohos.aafwk.param.callerAbilityName'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('EntryAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkMatrix0012 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_OPEN_LINK_0013
     * @tc.name      testOpenLinkMatrix0013
     * @tc.desc      openLink "http://docs.openharmony.cn/pages/v4.1"，appLinkingOnly=false：拉起 OpenLinkAbility 且 uri 不变
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testOpenLinkMatrix0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkMatrix0013 begin');
      const link: string = 'http://docs.openharmony.cn/pages/v4.1';
      const options: OpenLinkOptions = { appLinkingOnly: false };
      const observation: LinkObservation = await observeOpenLink(link, options);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.topName=${observation.topName}`);
      expect(observation.topName).assertEqual('OpenLinkAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.uri=${observation.uri}`);
      expect(observation.uri).assertEqual('http://docs.openharmony.cn/pages/v4.1');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 observation.action=${observation.action}`);
      expect(observation.action).assertEqual('ohos.want.action.viewData');
      const actual5: Object = observation.parameters['ohos.aafwk.param.callerAbilityName'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('EntryAbility');
      const actual6: Object = observation.parameters['appLinkingOnly'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a6=${actual6}`);
      expect(actual6).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkMatrix0013 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_OPEN_LINK_0014
     * @tc.name      testOpenLinkMatrix0014
     * @tc.desc      openLink "http://docs.openharmony.cn/pages/v4.1"，appLinkingOnly=true：未做域名校验，返回 16000019 且不弹提示
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testOpenLinkMatrix0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkMatrix0014 begin');
      const link: string = 'http://docs.openharmony.cn/pages/v4.1';
      const options: OpenLinkOptions = { appLinkingOnly: true };
      const observation: LinkObservation = await observeOpenLink(link, options);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(16000019);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.message=${observation.message}`);
      expect(observation.message).assertEqual('No matching ability is found.');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.dialogShown=${observation.dialogShown}`);
      expect(observation.dialogShown).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 observation.topName=${observation.topName}`);
      expect(observation.topName).assertEqual('EntryAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkMatrix0014 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_OPEN_LINK_0015
     * @tc.name      testOpenLinkMatrix0015
     * @tc.desc      openLink "http://docs.openharmony.cn/pages/v4.1"，带 parameters：拉起 OpenLinkAbility 且 uri 不变
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testOpenLinkMatrix0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkMatrix0015 begin');
      const link: string = 'http://docs.openharmony.cn/pages/v4.1';
      const options: OpenLinkOptions = { appLinkingOnly: false, parameters: { 'from': 'matrix' } };
      const observation: LinkObservation = await observeOpenLink(link, options);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.topName=${observation.topName}`);
      expect(observation.topName).assertEqual('OpenLinkAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.uri=${observation.uri}`);
      expect(observation.uri).assertEqual('http://docs.openharmony.cn/pages/v4.1');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 observation.action=${observation.action}`);
      expect(observation.action).assertEqual('ohos.want.action.viewData');
      const actual5: Object = observation.parameters['ohos.aafwk.param.callerAbilityName'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('EntryAbility');
      const actual6: Object = observation.parameters['appLinkingOnly'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a6=${actual6}`);
      expect(actual6).assertEqual(false);
      const actual7: Object = observation.parameters['from'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a7=${actual7}`);
      expect(actual7).assertEqual('matrix');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkMatrix0015 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_OPEN_LINK_0016
     * @tc.name      testOpenLinkMatrix0016
     * @tc.desc      openLink "http://docs.openharmony.cn/a/b/c.html"，不传 options：拉起 OpenLinkAbility 且 uri 不变
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testOpenLinkMatrix0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkMatrix0016 begin');
      const link: string = 'http://docs.openharmony.cn/a/b/c.html';
      const observation: LinkObservation = await observeOpenLink(link);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.topName=${observation.topName}`);
      expect(observation.topName).assertEqual('OpenLinkAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.uri=${observation.uri}`);
      expect(observation.uri).assertEqual('http://docs.openharmony.cn/a/b/c.html');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 observation.action=${observation.action}`);
      expect(observation.action).assertEqual('ohos.want.action.viewData');
      const actual5: Object = observation.parameters['ohos.aafwk.param.callerAbilityName'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('EntryAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkMatrix0016 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_OPEN_LINK_0017
     * @tc.name      testOpenLinkMatrix0017
     * @tc.desc      openLink "http://docs.openharmony.cn/a/b/c.html"，空 options：拉起 OpenLinkAbility 且 uri 不变
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testOpenLinkMatrix0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkMatrix0017 begin');
      const link: string = 'http://docs.openharmony.cn/a/b/c.html';
      const options: OpenLinkOptions = {};
      const observation: LinkObservation = await observeOpenLink(link, options);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.topName=${observation.topName}`);
      expect(observation.topName).assertEqual('OpenLinkAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.uri=${observation.uri}`);
      expect(observation.uri).assertEqual('http://docs.openharmony.cn/a/b/c.html');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 observation.action=${observation.action}`);
      expect(observation.action).assertEqual('ohos.want.action.viewData');
      const actual5: Object = observation.parameters['ohos.aafwk.param.callerAbilityName'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('EntryAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkMatrix0017 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_OPEN_LINK_0018
     * @tc.name      testOpenLinkMatrix0018
     * @tc.desc      openLink "http://docs.openharmony.cn/a/b/c.html"，appLinkingOnly=false：拉起 OpenLinkAbility 且 uri 不变
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testOpenLinkMatrix0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkMatrix0018 begin');
      const link: string = 'http://docs.openharmony.cn/a/b/c.html';
      const options: OpenLinkOptions = { appLinkingOnly: false };
      const observation: LinkObservation = await observeOpenLink(link, options);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.topName=${observation.topName}`);
      expect(observation.topName).assertEqual('OpenLinkAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.uri=${observation.uri}`);
      expect(observation.uri).assertEqual('http://docs.openharmony.cn/a/b/c.html');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 observation.action=${observation.action}`);
      expect(observation.action).assertEqual('ohos.want.action.viewData');
      const actual5: Object = observation.parameters['ohos.aafwk.param.callerAbilityName'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('EntryAbility');
      const actual6: Object = observation.parameters['appLinkingOnly'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a6=${actual6}`);
      expect(actual6).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkMatrix0018 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_OPEN_LINK_0019
     * @tc.name      testOpenLinkMatrix0019
     * @tc.desc      openLink "http://docs.openharmony.cn/a/b/c.html"，appLinkingOnly=true：未做域名校验，返回 16000019 且不弹提示
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testOpenLinkMatrix0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkMatrix0019 begin');
      const link: string = 'http://docs.openharmony.cn/a/b/c.html';
      const options: OpenLinkOptions = { appLinkingOnly: true };
      const observation: LinkObservation = await observeOpenLink(link, options);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(16000019);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.message=${observation.message}`);
      expect(observation.message).assertEqual('No matching ability is found.');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.dialogShown=${observation.dialogShown}`);
      expect(observation.dialogShown).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 observation.topName=${observation.topName}`);
      expect(observation.topName).assertEqual('EntryAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkMatrix0019 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_OPEN_LINK_0020
     * @tc.name      testOpenLinkMatrix0020
     * @tc.desc      openLink "http://docs.openharmony.cn/a/b/c.html"，带 parameters：拉起 OpenLinkAbility 且 uri 不变
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testOpenLinkMatrix0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkMatrix0020 begin');
      const link: string = 'http://docs.openharmony.cn/a/b/c.html';
      const options: OpenLinkOptions = { appLinkingOnly: false, parameters: { 'from': 'matrix' } };
      const observation: LinkObservation = await observeOpenLink(link, options);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.topName=${observation.topName}`);
      expect(observation.topName).assertEqual('OpenLinkAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.uri=${observation.uri}`);
      expect(observation.uri).assertEqual('http://docs.openharmony.cn/a/b/c.html');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 observation.action=${observation.action}`);
      expect(observation.action).assertEqual('ohos.want.action.viewData');
      const actual5: Object = observation.parameters['ohos.aafwk.param.callerAbilityName'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('EntryAbility');
      const actual6: Object = observation.parameters['appLinkingOnly'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a6=${actual6}`);
      expect(actual6).assertEqual(false);
      const actual7: Object = observation.parameters['from'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a7=${actual7}`);
      expect(actual7).assertEqual('matrix');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkMatrix0020 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_OPEN_LINK_0021
     * @tc.name      testOpenLinkMatrix0021
     * @tc.desc      openLink "http://docs.openharmony.cn:8080"，不传 options：拉起 OpenLinkAbility 且 uri 不变
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testOpenLinkMatrix0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkMatrix0021 begin');
      const link: string = 'http://docs.openharmony.cn:8080';
      const observation: LinkObservation = await observeOpenLink(link);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.topName=${observation.topName}`);
      expect(observation.topName).assertEqual('OpenLinkAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.uri=${observation.uri}`);
      expect(observation.uri).assertEqual('http://docs.openharmony.cn:8080');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 observation.action=${observation.action}`);
      expect(observation.action).assertEqual('ohos.want.action.viewData');
      const actual5: Object = observation.parameters['ohos.aafwk.param.callerAbilityName'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('EntryAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkMatrix0021 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_OPEN_LINK_0022
     * @tc.name      testOpenLinkMatrix0022
     * @tc.desc      openLink "http://docs.openharmony.cn:8080"，空 options：拉起 OpenLinkAbility 且 uri 不变
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testOpenLinkMatrix0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkMatrix0022 begin');
      const link: string = 'http://docs.openharmony.cn:8080';
      const options: OpenLinkOptions = {};
      const observation: LinkObservation = await observeOpenLink(link, options);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.topName=${observation.topName}`);
      expect(observation.topName).assertEqual('OpenLinkAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.uri=${observation.uri}`);
      expect(observation.uri).assertEqual('http://docs.openharmony.cn:8080');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 observation.action=${observation.action}`);
      expect(observation.action).assertEqual('ohos.want.action.viewData');
      const actual5: Object = observation.parameters['ohos.aafwk.param.callerAbilityName'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('EntryAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkMatrix0022 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_OPEN_LINK_0023
     * @tc.name      testOpenLinkMatrix0023
     * @tc.desc      openLink "http://docs.openharmony.cn:8080"，appLinkingOnly=false：拉起 OpenLinkAbility 且 uri 不变
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testOpenLinkMatrix0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkMatrix0023 begin');
      const link: string = 'http://docs.openharmony.cn:8080';
      const options: OpenLinkOptions = { appLinkingOnly: false };
      const observation: LinkObservation = await observeOpenLink(link, options);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.topName=${observation.topName}`);
      expect(observation.topName).assertEqual('OpenLinkAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.uri=${observation.uri}`);
      expect(observation.uri).assertEqual('http://docs.openharmony.cn:8080');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 observation.action=${observation.action}`);
      expect(observation.action).assertEqual('ohos.want.action.viewData');
      const actual5: Object = observation.parameters['ohos.aafwk.param.callerAbilityName'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('EntryAbility');
      const actual6: Object = observation.parameters['appLinkingOnly'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a6=${actual6}`);
      expect(actual6).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkMatrix0023 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_OPEN_LINK_0024
     * @tc.name      testOpenLinkMatrix0024
     * @tc.desc      openLink "http://docs.openharmony.cn:8080"，appLinkingOnly=true：未做域名校验，返回 16000019 且不弹提示
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testOpenLinkMatrix0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkMatrix0024 begin');
      const link: string = 'http://docs.openharmony.cn:8080';
      const options: OpenLinkOptions = { appLinkingOnly: true };
      const observation: LinkObservation = await observeOpenLink(link, options);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(16000019);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.message=${observation.message}`);
      expect(observation.message).assertEqual('No matching ability is found.');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.dialogShown=${observation.dialogShown}`);
      expect(observation.dialogShown).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 observation.topName=${observation.topName}`);
      expect(observation.topName).assertEqual('EntryAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkMatrix0024 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_OPEN_LINK_0025
     * @tc.name      testOpenLinkMatrix0025
     * @tc.desc      openLink "http://docs.openharmony.cn:8080"，带 parameters：拉起 OpenLinkAbility 且 uri 不变
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testOpenLinkMatrix0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkMatrix0025 begin');
      const link: string = 'http://docs.openharmony.cn:8080';
      const options: OpenLinkOptions = { appLinkingOnly: false, parameters: { 'from': 'matrix' } };
      const observation: LinkObservation = await observeOpenLink(link, options);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.topName=${observation.topName}`);
      expect(observation.topName).assertEqual('OpenLinkAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.uri=${observation.uri}`);
      expect(observation.uri).assertEqual('http://docs.openharmony.cn:8080');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 observation.action=${observation.action}`);
      expect(observation.action).assertEqual('ohos.want.action.viewData');
      const actual5: Object = observation.parameters['ohos.aafwk.param.callerAbilityName'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('EntryAbility');
      const actual6: Object = observation.parameters['appLinkingOnly'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a6=${actual6}`);
      expect(actual6).assertEqual(false);
      const actual7: Object = observation.parameters['from'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a7=${actual7}`);
      expect(actual7).assertEqual('matrix');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkMatrix0025 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_OPEN_LINK_0026
     * @tc.name      testOpenLinkMatrix0026
     * @tc.desc      openLink "http://docs.openharmony.cn?x=1"，不传 options：拉起 OpenLinkAbility 且 uri 不变
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testOpenLinkMatrix0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkMatrix0026 begin');
      const link: string = 'http://docs.openharmony.cn?x=1';
      const observation: LinkObservation = await observeOpenLink(link);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.topName=${observation.topName}`);
      expect(observation.topName).assertEqual('OpenLinkAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.uri=${observation.uri}`);
      expect(observation.uri).assertEqual('http://docs.openharmony.cn?x=1');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 observation.action=${observation.action}`);
      expect(observation.action).assertEqual('ohos.want.action.viewData');
      const actual5: Object = observation.parameters['ohos.aafwk.param.callerAbilityName'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('EntryAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkMatrix0026 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_OPEN_LINK_0027
     * @tc.name      testOpenLinkMatrix0027
     * @tc.desc      openLink "http://docs.openharmony.cn?x=1"，空 options：拉起 OpenLinkAbility 且 uri 不变
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testOpenLinkMatrix0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkMatrix0027 begin');
      const link: string = 'http://docs.openharmony.cn?x=1';
      const options: OpenLinkOptions = {};
      const observation: LinkObservation = await observeOpenLink(link, options);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.topName=${observation.topName}`);
      expect(observation.topName).assertEqual('OpenLinkAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.uri=${observation.uri}`);
      expect(observation.uri).assertEqual('http://docs.openharmony.cn?x=1');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 observation.action=${observation.action}`);
      expect(observation.action).assertEqual('ohos.want.action.viewData');
      const actual5: Object = observation.parameters['ohos.aafwk.param.callerAbilityName'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('EntryAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkMatrix0027 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_OPEN_LINK_0028
     * @tc.name      testOpenLinkMatrix0028
     * @tc.desc      openLink "http://docs.openharmony.cn?x=1"，appLinkingOnly=false：拉起 OpenLinkAbility 且 uri 不变
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testOpenLinkMatrix0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkMatrix0028 begin');
      const link: string = 'http://docs.openharmony.cn?x=1';
      const options: OpenLinkOptions = { appLinkingOnly: false };
      const observation: LinkObservation = await observeOpenLink(link, options);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.topName=${observation.topName}`);
      expect(observation.topName).assertEqual('OpenLinkAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.uri=${observation.uri}`);
      expect(observation.uri).assertEqual('http://docs.openharmony.cn?x=1');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 observation.action=${observation.action}`);
      expect(observation.action).assertEqual('ohos.want.action.viewData');
      const actual5: Object = observation.parameters['ohos.aafwk.param.callerAbilityName'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('EntryAbility');
      const actual6: Object = observation.parameters['appLinkingOnly'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a6=${actual6}`);
      expect(actual6).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkMatrix0028 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_OPEN_LINK_0029
     * @tc.name      testOpenLinkMatrix0029
     * @tc.desc      openLink "http://docs.openharmony.cn?x=1"，appLinkingOnly=true：未做域名校验，返回 16000019 且不弹提示
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testOpenLinkMatrix0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkMatrix0029 begin');
      const link: string = 'http://docs.openharmony.cn?x=1';
      const options: OpenLinkOptions = { appLinkingOnly: true };
      const observation: LinkObservation = await observeOpenLink(link, options);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(16000019);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.message=${observation.message}`);
      expect(observation.message).assertEqual('No matching ability is found.');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.dialogShown=${observation.dialogShown}`);
      expect(observation.dialogShown).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 observation.topName=${observation.topName}`);
      expect(observation.topName).assertEqual('EntryAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkMatrix0029 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_OPEN_LINK_0030
     * @tc.name      testOpenLinkMatrix0030
     * @tc.desc      openLink "http://docs.openharmony.cn?x=1"，带 parameters：拉起 OpenLinkAbility 且 uri 不变
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testOpenLinkMatrix0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkMatrix0030 begin');
      const link: string = 'http://docs.openharmony.cn?x=1';
      const options: OpenLinkOptions = { appLinkingOnly: false, parameters: { 'from': 'matrix' } };
      const observation: LinkObservation = await observeOpenLink(link, options);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.topName=${observation.topName}`);
      expect(observation.topName).assertEqual('OpenLinkAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.uri=${observation.uri}`);
      expect(observation.uri).assertEqual('http://docs.openharmony.cn?x=1');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 observation.action=${observation.action}`);
      expect(observation.action).assertEqual('ohos.want.action.viewData');
      const actual5: Object = observation.parameters['ohos.aafwk.param.callerAbilityName'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('EntryAbility');
      const actual6: Object = observation.parameters['appLinkingOnly'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a6=${actual6}`);
      expect(actual6).assertEqual(false);
      const actual7: Object = observation.parameters['from'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a7=${actual7}`);
      expect(actual7).assertEqual('matrix');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkMatrix0030 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_OPEN_LINK_0031
     * @tc.name      testOpenLinkMatrix0031
     * @tc.desc      openLink "http://docs.openharmony.cn"，不传 options：拉起 OpenLinkAbility 且 uri 不变
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testOpenLinkMatrix0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkMatrix0031 begin');
      const link: string = 'http://docs.openharmony.cn';
      const observation: LinkObservation = await observeOpenLink(link);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.topName=${observation.topName}`);
      expect(observation.topName).assertEqual('OpenLinkAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.uri=${observation.uri}`);
      expect(observation.uri).assertEqual('http://docs.openharmony.cn');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 observation.action=${observation.action}`);
      expect(observation.action).assertEqual('ohos.want.action.viewData');
      const actual5: Object = observation.parameters['ohos.aafwk.param.callerAbilityName'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('EntryAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkMatrix0031 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_OPEN_LINK_0032
     * @tc.name      testOpenLinkMatrix0032
     * @tc.desc      openLink "http://docs.openharmony.cn"，空 options：拉起 OpenLinkAbility 且 uri 不变
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testOpenLinkMatrix0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkMatrix0032 begin');
      const link: string = 'http://docs.openharmony.cn';
      const options: OpenLinkOptions = {};
      const observation: LinkObservation = await observeOpenLink(link, options);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.topName=${observation.topName}`);
      expect(observation.topName).assertEqual('OpenLinkAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.uri=${observation.uri}`);
      expect(observation.uri).assertEqual('http://docs.openharmony.cn');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 observation.action=${observation.action}`);
      expect(observation.action).assertEqual('ohos.want.action.viewData');
      const actual5: Object = observation.parameters['ohos.aafwk.param.callerAbilityName'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('EntryAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkMatrix0032 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_OPEN_LINK_0033
     * @tc.name      testOpenLinkMatrix0033
     * @tc.desc      openLink "http://docs.openharmony.cn"，appLinkingOnly=false：拉起 OpenLinkAbility 且 uri 不变
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testOpenLinkMatrix0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkMatrix0033 begin');
      const link: string = 'http://docs.openharmony.cn';
      const options: OpenLinkOptions = { appLinkingOnly: false };
      const observation: LinkObservation = await observeOpenLink(link, options);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.topName=${observation.topName}`);
      expect(observation.topName).assertEqual('OpenLinkAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.uri=${observation.uri}`);
      expect(observation.uri).assertEqual('http://docs.openharmony.cn');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 observation.action=${observation.action}`);
      expect(observation.action).assertEqual('ohos.want.action.viewData');
      const actual5: Object = observation.parameters['ohos.aafwk.param.callerAbilityName'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('EntryAbility');
      const actual6: Object = observation.parameters['appLinkingOnly'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a6=${actual6}`);
      expect(actual6).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkMatrix0033 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_OPEN_LINK_0034
     * @tc.name      testOpenLinkMatrix0034
     * @tc.desc      openLink "http://docs.openharmony.cn"，appLinkingOnly=true：未做域名校验，返回 16000019 且不弹提示
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testOpenLinkMatrix0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkMatrix0034 begin');
      const link: string = 'http://docs.openharmony.cn';
      const options: OpenLinkOptions = { appLinkingOnly: true };
      const observation: LinkObservation = await observeOpenLink(link, options);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(16000019);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.message=${observation.message}`);
      expect(observation.message).assertEqual('No matching ability is found.');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.dialogShown=${observation.dialogShown}`);
      expect(observation.dialogShown).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 observation.topName=${observation.topName}`);
      expect(observation.topName).assertEqual('EntryAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkMatrix0034 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_OPEN_LINK_0035
     * @tc.name      testOpenLinkMatrix0035
     * @tc.desc      openLink "http://docs.openharmony.cn"，带 parameters：拉起 OpenLinkAbility 且 uri 不变
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testOpenLinkMatrix0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkMatrix0035 begin');
      const link: string = 'http://docs.openharmony.cn';
      const options: OpenLinkOptions = { appLinkingOnly: false, parameters: { 'from': 'matrix' } };
      const observation: LinkObservation = await observeOpenLink(link, options);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.topName=${observation.topName}`);
      expect(observation.topName).assertEqual('OpenLinkAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.uri=${observation.uri}`);
      expect(observation.uri).assertEqual('http://docs.openharmony.cn');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 observation.action=${observation.action}`);
      expect(observation.action).assertEqual('ohos.want.action.viewData');
      const actual5: Object = observation.parameters['ohos.aafwk.param.callerAbilityName'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('EntryAbility');
      const actual6: Object = observation.parameters['appLinkingOnly'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a6=${actual6}`);
      expect(actual6).assertEqual(false);
      const actual7: Object = observation.parameters['from'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a7=${actual7}`);
      expect(actual7).assertEqual('matrix');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkMatrix0035 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_OPEN_LINK_0036
     * @tc.name      testOpenLinkMatrix0036
     * @tc.desc      openLink "http://DOCS.OPENHARMONY.CN/Upper"，不传 options：拉起 OpenLinkAbility 且 uri 不变
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testOpenLinkMatrix0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkMatrix0036 begin');
      const link: string = 'http://DOCS.OPENHARMONY.CN/Upper';
      const observation: LinkObservation = await observeOpenLink(link);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.topName=${observation.topName}`);
      expect(observation.topName).assertEqual('OpenLinkAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.uri=${observation.uri}`);
      expect(observation.uri).assertEqual('http://DOCS.OPENHARMONY.CN/Upper');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 observation.action=${observation.action}`);
      expect(observation.action).assertEqual('ohos.want.action.viewData');
      const actual5: Object = observation.parameters['ohos.aafwk.param.callerAbilityName'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('EntryAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkMatrix0036 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_OPEN_LINK_0037
     * @tc.name      testOpenLinkMatrix0037
     * @tc.desc      openLink "http://DOCS.OPENHARMONY.CN/Upper"，空 options：拉起 OpenLinkAbility 且 uri 不变
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testOpenLinkMatrix0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkMatrix0037 begin');
      const link: string = 'http://DOCS.OPENHARMONY.CN/Upper';
      const options: OpenLinkOptions = {};
      const observation: LinkObservation = await observeOpenLink(link, options);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.topName=${observation.topName}`);
      expect(observation.topName).assertEqual('OpenLinkAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.uri=${observation.uri}`);
      expect(observation.uri).assertEqual('http://DOCS.OPENHARMONY.CN/Upper');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 observation.action=${observation.action}`);
      expect(observation.action).assertEqual('ohos.want.action.viewData');
      const actual5: Object = observation.parameters['ohos.aafwk.param.callerAbilityName'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('EntryAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkMatrix0037 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_OPEN_LINK_0038
     * @tc.name      testOpenLinkMatrix0038
     * @tc.desc      openLink "http://DOCS.OPENHARMONY.CN/Upper"，appLinkingOnly=false：拉起 OpenLinkAbility 且 uri 不变
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testOpenLinkMatrix0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkMatrix0038 begin');
      const link: string = 'http://DOCS.OPENHARMONY.CN/Upper';
      const options: OpenLinkOptions = { appLinkingOnly: false };
      const observation: LinkObservation = await observeOpenLink(link, options);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.topName=${observation.topName}`);
      expect(observation.topName).assertEqual('OpenLinkAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.uri=${observation.uri}`);
      expect(observation.uri).assertEqual('http://DOCS.OPENHARMONY.CN/Upper');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 observation.action=${observation.action}`);
      expect(observation.action).assertEqual('ohos.want.action.viewData');
      const actual5: Object = observation.parameters['ohos.aafwk.param.callerAbilityName'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('EntryAbility');
      const actual6: Object = observation.parameters['appLinkingOnly'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a6=${actual6}`);
      expect(actual6).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkMatrix0038 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_OPEN_LINK_0039
     * @tc.name      testOpenLinkMatrix0039
     * @tc.desc      openLink "http://DOCS.OPENHARMONY.CN/Upper"，appLinkingOnly=true：未做域名校验，返回 16000019 且不弹提示
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testOpenLinkMatrix0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkMatrix0039 begin');
      const link: string = 'http://DOCS.OPENHARMONY.CN/Upper';
      const options: OpenLinkOptions = { appLinkingOnly: true };
      const observation: LinkObservation = await observeOpenLink(link, options);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(16000019);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.message=${observation.message}`);
      expect(observation.message).assertEqual('No matching ability is found.');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.dialogShown=${observation.dialogShown}`);
      expect(observation.dialogShown).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 observation.topName=${observation.topName}`);
      expect(observation.topName).assertEqual('EntryAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkMatrix0039 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_OPEN_LINK_0040
     * @tc.name      testOpenLinkMatrix0040
     * @tc.desc      openLink "http://DOCS.OPENHARMONY.CN/Upper"，带 parameters：拉起 OpenLinkAbility 且 uri 不变
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testOpenLinkMatrix0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkMatrix0040 begin');
      const link: string = 'http://DOCS.OPENHARMONY.CN/Upper';
      const options: OpenLinkOptions = { appLinkingOnly: false, parameters: { 'from': 'matrix' } };
      const observation: LinkObservation = await observeOpenLink(link, options);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.topName=${observation.topName}`);
      expect(observation.topName).assertEqual('OpenLinkAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.uri=${observation.uri}`);
      expect(observation.uri).assertEqual('http://DOCS.OPENHARMONY.CN/Upper');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 observation.action=${observation.action}`);
      expect(observation.action).assertEqual('ohos.want.action.viewData');
      const actual5: Object = observation.parameters['ohos.aafwk.param.callerAbilityName'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('EntryAbility');
      const actual6: Object = observation.parameters['appLinkingOnly'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a6=${actual6}`);
      expect(actual6).assertEqual(false);
      const actual7: Object = observation.parameters['from'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a7=${actual7}`);
      expect(actual7).assertEqual('matrix');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkMatrix0040 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_OPEN_LINK_0041
     * @tc.name      testOpenLinkMatrix0041
     * @tc.desc      openLink "https://docs.openharmony.cn"，不传 options：无匹配，返回 16000019 并弹提示
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testOpenLinkMatrix0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkMatrix0041 begin');
      const link: string = 'https://docs.openharmony.cn';
      const observation: LinkObservation = await observeOpenLink(link);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(16000019);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.message=${observation.message}`);
      expect(observation.message).assertEqual('No matching ability is found.');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.dialogShown=${observation.dialogShown}`);
      expect(observation.dialogShown).assertTrue();
      const actual4: boolean = observation.topName === 'OpenLinkAbility';
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkMatrix0041 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_OPEN_LINK_0042
     * @tc.name      testOpenLinkMatrix0042
     * @tc.desc      openLink "https://docs.openharmony.cn"，空 options：无匹配，返回 16000019 并弹提示
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testOpenLinkMatrix0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkMatrix0042 begin');
      const link: string = 'https://docs.openharmony.cn';
      const options: OpenLinkOptions = {};
      const observation: LinkObservation = await observeOpenLink(link, options);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(16000019);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.message=${observation.message}`);
      expect(observation.message).assertEqual('No matching ability is found.');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.dialogShown=${observation.dialogShown}`);
      expect(observation.dialogShown).assertTrue();
      const actual4: boolean = observation.topName === 'OpenLinkAbility';
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkMatrix0042 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_OPEN_LINK_0043
     * @tc.name      testOpenLinkMatrix0043
     * @tc.desc      openLink "https://docs.openharmony.cn"，appLinkingOnly=false：无匹配，返回 16000019 并弹提示
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testOpenLinkMatrix0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkMatrix0043 begin');
      const link: string = 'https://docs.openharmony.cn';
      const options: OpenLinkOptions = { appLinkingOnly: false };
      const observation: LinkObservation = await observeOpenLink(link, options);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(16000019);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.message=${observation.message}`);
      expect(observation.message).assertEqual('No matching ability is found.');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.dialogShown=${observation.dialogShown}`);
      expect(observation.dialogShown).assertTrue();
      const actual4: boolean = observation.topName === 'OpenLinkAbility';
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkMatrix0043 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_OPEN_LINK_0044
     * @tc.name      testOpenLinkMatrix0044
     * @tc.desc      openLink "https://docs.openharmony.cn"，appLinkingOnly=true：未做域名校验，返回 16000019 且不弹提示
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testOpenLinkMatrix0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkMatrix0044 begin');
      const link: string = 'https://docs.openharmony.cn';
      const options: OpenLinkOptions = { appLinkingOnly: true };
      const observation: LinkObservation = await observeOpenLink(link, options);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(16000019);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.message=${observation.message}`);
      expect(observation.message).assertEqual('No matching ability is found.');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.dialogShown=${observation.dialogShown}`);
      expect(observation.dialogShown).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 observation.topName=${observation.topName}`);
      expect(observation.topName).assertEqual('EntryAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkMatrix0044 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_OPEN_LINK_0045
     * @tc.name      testOpenLinkMatrix0045
     * @tc.desc      openLink "https://docs.openharmony.cn"，带 parameters：无匹配，返回 16000019 并弹提示
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testOpenLinkMatrix0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkMatrix0045 begin');
      const link: string = 'https://docs.openharmony.cn';
      const options: OpenLinkOptions = { appLinkingOnly: false, parameters: { 'from': 'matrix' } };
      const observation: LinkObservation = await observeOpenLink(link, options);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(16000019);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.message=${observation.message}`);
      expect(observation.message).assertEqual('No matching ability is found.');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.dialogShown=${observation.dialogShown}`);
      expect(observation.dialogShown).assertTrue();
      const actual4: boolean = observation.topName === 'OpenLinkAbility';
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkMatrix0045 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_OPEN_LINK_0046
     * @tc.name      testOpenLinkMatrix0046
     * @tc.desc      openLink "http://www.openharmony.cn"，不传 options：无匹配，返回 16000019 并弹提示
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testOpenLinkMatrix0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkMatrix0046 begin');
      const link: string = 'http://www.openharmony.cn';
      const observation: LinkObservation = await observeOpenLink(link);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(16000019);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.message=${observation.message}`);
      expect(observation.message).assertEqual('No matching ability is found.');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.dialogShown=${observation.dialogShown}`);
      expect(observation.dialogShown).assertTrue();
      const actual4: boolean = observation.topName === 'OpenLinkAbility';
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkMatrix0046 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_OPEN_LINK_0047
     * @tc.name      testOpenLinkMatrix0047
     * @tc.desc      openLink "http://www.openharmony.cn"，空 options：无匹配，返回 16000019 并弹提示
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testOpenLinkMatrix0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkMatrix0047 begin');
      const link: string = 'http://www.openharmony.cn';
      const options: OpenLinkOptions = {};
      const observation: LinkObservation = await observeOpenLink(link, options);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(16000019);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.message=${observation.message}`);
      expect(observation.message).assertEqual('No matching ability is found.');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.dialogShown=${observation.dialogShown}`);
      expect(observation.dialogShown).assertTrue();
      const actual4: boolean = observation.topName === 'OpenLinkAbility';
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkMatrix0047 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_OPEN_LINK_0048
     * @tc.name      testOpenLinkMatrix0048
     * @tc.desc      openLink "http://www.openharmony.cn"，appLinkingOnly=false：无匹配，返回 16000019 并弹提示
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testOpenLinkMatrix0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkMatrix0048 begin');
      const link: string = 'http://www.openharmony.cn';
      const options: OpenLinkOptions = { appLinkingOnly: false };
      const observation: LinkObservation = await observeOpenLink(link, options);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(16000019);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.message=${observation.message}`);
      expect(observation.message).assertEqual('No matching ability is found.');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.dialogShown=${observation.dialogShown}`);
      expect(observation.dialogShown).assertTrue();
      const actual4: boolean = observation.topName === 'OpenLinkAbility';
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkMatrix0048 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_OPEN_LINK_0049
     * @tc.name      testOpenLinkMatrix0049
     * @tc.desc      openLink "http://www.openharmony.cn"，appLinkingOnly=true：未做域名校验，返回 16000019 且不弹提示
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testOpenLinkMatrix0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkMatrix0049 begin');
      const link: string = 'http://www.openharmony.cn';
      const options: OpenLinkOptions = { appLinkingOnly: true };
      const observation: LinkObservation = await observeOpenLink(link, options);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(16000019);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.message=${observation.message}`);
      expect(observation.message).assertEqual('No matching ability is found.');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.dialogShown=${observation.dialogShown}`);
      expect(observation.dialogShown).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 observation.topName=${observation.topName}`);
      expect(observation.topName).assertEqual('EntryAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkMatrix0049 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_OPEN_LINK_0050
     * @tc.name      testOpenLinkMatrix0050
     * @tc.desc      openLink "http://www.openharmony.cn"，带 parameters：无匹配，返回 16000019 并弹提示
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testOpenLinkMatrix0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkMatrix0050 begin');
      const link: string = 'http://www.openharmony.cn';
      const options: OpenLinkOptions = { appLinkingOnly: false, parameters: { 'from': 'matrix' } };
      const observation: LinkObservation = await observeOpenLink(link, options);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(16000019);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.message=${observation.message}`);
      expect(observation.message).assertEqual('No matching ability is found.');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.dialogShown=${observation.dialogShown}`);
      expect(observation.dialogShown).assertTrue();
      const actual4: boolean = observation.topName === 'OpenLinkAbility';
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkMatrix0050 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_OPEN_LINK_0051
     * @tc.name      testOpenLinkMatrix0051
     * @tc.desc      openLink "ftp://docs.openharmony.cn"，不传 options：无匹配，返回 16000019 并弹提示
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testOpenLinkMatrix0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkMatrix0051 begin');
      const link: string = 'ftp://docs.openharmony.cn';
      const observation: LinkObservation = await observeOpenLink(link);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(16000019);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.message=${observation.message}`);
      expect(observation.message).assertEqual('No matching ability is found.');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.dialogShown=${observation.dialogShown}`);
      expect(observation.dialogShown).assertTrue();
      const actual4: boolean = observation.topName === 'OpenLinkAbility';
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkMatrix0051 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_OPEN_LINK_0052
     * @tc.name      testOpenLinkMatrix0052
     * @tc.desc      openLink "ftp://docs.openharmony.cn"，空 options：无匹配，返回 16000019 并弹提示
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testOpenLinkMatrix0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkMatrix0052 begin');
      const link: string = 'ftp://docs.openharmony.cn';
      const options: OpenLinkOptions = {};
      const observation: LinkObservation = await observeOpenLink(link, options);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(16000019);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.message=${observation.message}`);
      expect(observation.message).assertEqual('No matching ability is found.');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.dialogShown=${observation.dialogShown}`);
      expect(observation.dialogShown).assertTrue();
      const actual4: boolean = observation.topName === 'OpenLinkAbility';
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkMatrix0052 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_OPEN_LINK_0053
     * @tc.name      testOpenLinkMatrix0053
     * @tc.desc      openLink "ftp://docs.openharmony.cn"，appLinkingOnly=false：无匹配，返回 16000019 并弹提示
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testOpenLinkMatrix0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkMatrix0053 begin');
      const link: string = 'ftp://docs.openharmony.cn';
      const options: OpenLinkOptions = { appLinkingOnly: false };
      const observation: LinkObservation = await observeOpenLink(link, options);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(16000019);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.message=${observation.message}`);
      expect(observation.message).assertEqual('No matching ability is found.');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.dialogShown=${observation.dialogShown}`);
      expect(observation.dialogShown).assertTrue();
      const actual4: boolean = observation.topName === 'OpenLinkAbility';
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkMatrix0053 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_OPEN_LINK_0054
     * @tc.name      testOpenLinkMatrix0054
     * @tc.desc      openLink "ftp://docs.openharmony.cn"，appLinkingOnly=true：未做域名校验，返回 16000019 且不弹提示
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testOpenLinkMatrix0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkMatrix0054 begin');
      const link: string = 'ftp://docs.openharmony.cn';
      const options: OpenLinkOptions = { appLinkingOnly: true };
      const observation: LinkObservation = await observeOpenLink(link, options);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(16000019);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.message=${observation.message}`);
      expect(observation.message).assertEqual('No matching ability is found.');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.dialogShown=${observation.dialogShown}`);
      expect(observation.dialogShown).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 observation.topName=${observation.topName}`);
      expect(observation.topName).assertEqual('EntryAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkMatrix0054 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_OPEN_LINK_0055
     * @tc.name      testOpenLinkMatrix0055
     * @tc.desc      openLink "ftp://docs.openharmony.cn"，带 parameters：无匹配，返回 16000019 并弹提示
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testOpenLinkMatrix0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkMatrix0055 begin');
      const link: string = 'ftp://docs.openharmony.cn';
      const options: OpenLinkOptions = { appLinkingOnly: false, parameters: { 'from': 'matrix' } };
      const observation: LinkObservation = await observeOpenLink(link, options);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(16000019);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.message=${observation.message}`);
      expect(observation.message).assertEqual('No matching ability is found.');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.dialogShown=${observation.dialogShown}`);
      expect(observation.dialogShown).assertTrue();
      const actual4: boolean = observation.topName === 'OpenLinkAbility';
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkMatrix0055 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_OPEN_LINK_0056
     * @tc.name      testOpenLinkMatrix0056
     * @tc.desc      openLink "http://sub.docs.openharmony.cn"，不传 options：无匹配，返回 16000019 并弹提示
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testOpenLinkMatrix0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkMatrix0056 begin');
      const link: string = 'http://sub.docs.openharmony.cn';
      const observation: LinkObservation = await observeOpenLink(link);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(16000019);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.message=${observation.message}`);
      expect(observation.message).assertEqual('No matching ability is found.');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.dialogShown=${observation.dialogShown}`);
      expect(observation.dialogShown).assertTrue();
      const actual4: boolean = observation.topName === 'OpenLinkAbility';
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkMatrix0056 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_OPEN_LINK_0057
     * @tc.name      testOpenLinkMatrix0057
     * @tc.desc      openLink "http://sub.docs.openharmony.cn"，空 options：无匹配，返回 16000019 并弹提示
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testOpenLinkMatrix0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkMatrix0057 begin');
      const link: string = 'http://sub.docs.openharmony.cn';
      const options: OpenLinkOptions = {};
      const observation: LinkObservation = await observeOpenLink(link, options);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(16000019);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.message=${observation.message}`);
      expect(observation.message).assertEqual('No matching ability is found.');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.dialogShown=${observation.dialogShown}`);
      expect(observation.dialogShown).assertTrue();
      const actual4: boolean = observation.topName === 'OpenLinkAbility';
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkMatrix0057 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_OPEN_LINK_0058
     * @tc.name      testOpenLinkMatrix0058
     * @tc.desc      openLink "http://sub.docs.openharmony.cn"，appLinkingOnly=false：无匹配，返回 16000019 并弹提示
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testOpenLinkMatrix0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkMatrix0058 begin');
      const link: string = 'http://sub.docs.openharmony.cn';
      const options: OpenLinkOptions = { appLinkingOnly: false };
      const observation: LinkObservation = await observeOpenLink(link, options);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(16000019);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.message=${observation.message}`);
      expect(observation.message).assertEqual('No matching ability is found.');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.dialogShown=${observation.dialogShown}`);
      expect(observation.dialogShown).assertTrue();
      const actual4: boolean = observation.topName === 'OpenLinkAbility';
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkMatrix0058 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_OPEN_LINK_0059
     * @tc.name      testOpenLinkMatrix0059
     * @tc.desc      openLink "http://sub.docs.openharmony.cn"，appLinkingOnly=true：未做域名校验，返回 16000019 且不弹提示
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testOpenLinkMatrix0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkMatrix0059 begin');
      const link: string = 'http://sub.docs.openharmony.cn';
      const options: OpenLinkOptions = { appLinkingOnly: true };
      const observation: LinkObservation = await observeOpenLink(link, options);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(16000019);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.message=${observation.message}`);
      expect(observation.message).assertEqual('No matching ability is found.');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.dialogShown=${observation.dialogShown}`);
      expect(observation.dialogShown).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 observation.topName=${observation.topName}`);
      expect(observation.topName).assertEqual('EntryAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkMatrix0059 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_OPEN_LINK_0060
     * @tc.name      testOpenLinkMatrix0060
     * @tc.desc      openLink "http://sub.docs.openharmony.cn"，带 parameters：无匹配，返回 16000019 并弹提示
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testOpenLinkMatrix0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkMatrix0060 begin');
      const link: string = 'http://sub.docs.openharmony.cn';
      const options: OpenLinkOptions = { appLinkingOnly: false, parameters: { 'from': 'matrix' } };
      const observation: LinkObservation = await observeOpenLink(link, options);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(16000019);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.message=${observation.message}`);
      expect(observation.message).assertEqual('No matching ability is found.');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.dialogShown=${observation.dialogShown}`);
      expect(observation.dialogShown).assertTrue();
      const actual4: boolean = observation.topName === 'OpenLinkAbility';
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkMatrix0060 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_OPEN_LINK_0061
     * @tc.name      testOpenLinkMatrix0061
     * @tc.desc      openLink "http://docs.openharmony.com"，不传 options：无匹配，返回 16000019 并弹提示
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testOpenLinkMatrix0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkMatrix0061 begin');
      const link: string = 'http://docs.openharmony.com';
      const observation: LinkObservation = await observeOpenLink(link);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(16000019);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.message=${observation.message}`);
      expect(observation.message).assertEqual('No matching ability is found.');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.dialogShown=${observation.dialogShown}`);
      expect(observation.dialogShown).assertTrue();
      const actual4: boolean = observation.topName === 'OpenLinkAbility';
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkMatrix0061 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_OPEN_LINK_0062
     * @tc.name      testOpenLinkMatrix0062
     * @tc.desc      openLink "http://docs.openharmony.com"，空 options：无匹配，返回 16000019 并弹提示
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testOpenLinkMatrix0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkMatrix0062 begin');
      const link: string = 'http://docs.openharmony.com';
      const options: OpenLinkOptions = {};
      const observation: LinkObservation = await observeOpenLink(link, options);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(16000019);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.message=${observation.message}`);
      expect(observation.message).assertEqual('No matching ability is found.');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.dialogShown=${observation.dialogShown}`);
      expect(observation.dialogShown).assertTrue();
      const actual4: boolean = observation.topName === 'OpenLinkAbility';
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkMatrix0062 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_OPEN_LINK_0063
     * @tc.name      testOpenLinkMatrix0063
     * @tc.desc      openLink "http://docs.openharmony.com"，appLinkingOnly=false：无匹配，返回 16000019 并弹提示
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testOpenLinkMatrix0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkMatrix0063 begin');
      const link: string = 'http://docs.openharmony.com';
      const options: OpenLinkOptions = { appLinkingOnly: false };
      const observation: LinkObservation = await observeOpenLink(link, options);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(16000019);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.message=${observation.message}`);
      expect(observation.message).assertEqual('No matching ability is found.');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.dialogShown=${observation.dialogShown}`);
      expect(observation.dialogShown).assertTrue();
      const actual4: boolean = observation.topName === 'OpenLinkAbility';
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkMatrix0063 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_OPEN_LINK_0064
     * @tc.name      testOpenLinkMatrix0064
     * @tc.desc      openLink "http://docs.openharmony.com"，appLinkingOnly=true：未做域名校验，返回 16000019 且不弹提示
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testOpenLinkMatrix0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkMatrix0064 begin');
      const link: string = 'http://docs.openharmony.com';
      const options: OpenLinkOptions = { appLinkingOnly: true };
      const observation: LinkObservation = await observeOpenLink(link, options);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(16000019);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.message=${observation.message}`);
      expect(observation.message).assertEqual('No matching ability is found.');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.dialogShown=${observation.dialogShown}`);
      expect(observation.dialogShown).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 observation.topName=${observation.topName}`);
      expect(observation.topName).assertEqual('EntryAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkMatrix0064 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_OPEN_LINK_0065
     * @tc.name      testOpenLinkMatrix0065
     * @tc.desc      openLink "http://docs.openharmony.com"，带 parameters：无匹配，返回 16000019 并弹提示
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testOpenLinkMatrix0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkMatrix0065 begin');
      const link: string = 'http://docs.openharmony.com';
      const options: OpenLinkOptions = { appLinkingOnly: false, parameters: { 'from': 'matrix' } };
      const observation: LinkObservation = await observeOpenLink(link, options);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(16000019);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.message=${observation.message}`);
      expect(observation.message).assertEqual('No matching ability is found.');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.dialogShown=${observation.dialogShown}`);
      expect(observation.dialogShown).assertTrue();
      const actual4: boolean = observation.topName === 'OpenLinkAbility';
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkMatrix0065 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_OPEN_LINK_0066
     * @tc.name      testOpenLinkMatrix0066
     * @tc.desc      openLink "myapp://docs.openharmony.cn"，不传 options：无匹配，返回 16000019 并弹提示
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testOpenLinkMatrix0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkMatrix0066 begin');
      const link: string = 'myapp://docs.openharmony.cn';
      const observation: LinkObservation = await observeOpenLink(link);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(16000019);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.message=${observation.message}`);
      expect(observation.message).assertEqual('No matching ability is found.');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.dialogShown=${observation.dialogShown}`);
      expect(observation.dialogShown).assertTrue();
      const actual4: boolean = observation.topName === 'OpenLinkAbility';
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkMatrix0066 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_OPEN_LINK_0067
     * @tc.name      testOpenLinkMatrix0067
     * @tc.desc      openLink "myapp://docs.openharmony.cn"，空 options：无匹配，返回 16000019 并弹提示
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testOpenLinkMatrix0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkMatrix0067 begin');
      const link: string = 'myapp://docs.openharmony.cn';
      const options: OpenLinkOptions = {};
      const observation: LinkObservation = await observeOpenLink(link, options);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(16000019);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.message=${observation.message}`);
      expect(observation.message).assertEqual('No matching ability is found.');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.dialogShown=${observation.dialogShown}`);
      expect(observation.dialogShown).assertTrue();
      const actual4: boolean = observation.topName === 'OpenLinkAbility';
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkMatrix0067 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_OPEN_LINK_0068
     * @tc.name      testOpenLinkMatrix0068
     * @tc.desc      openLink "myapp://docs.openharmony.cn"，appLinkingOnly=false：无匹配，返回 16000019 并弹提示
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testOpenLinkMatrix0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkMatrix0068 begin');
      const link: string = 'myapp://docs.openharmony.cn';
      const options: OpenLinkOptions = { appLinkingOnly: false };
      const observation: LinkObservation = await observeOpenLink(link, options);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(16000019);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.message=${observation.message}`);
      expect(observation.message).assertEqual('No matching ability is found.');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.dialogShown=${observation.dialogShown}`);
      expect(observation.dialogShown).assertTrue();
      const actual4: boolean = observation.topName === 'OpenLinkAbility';
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkMatrix0068 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_OPEN_LINK_0069
     * @tc.name      testOpenLinkMatrix0069
     * @tc.desc      openLink "myapp://docs.openharmony.cn"，appLinkingOnly=true：未做域名校验，返回 16000019 且不弹提示
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testOpenLinkMatrix0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkMatrix0069 begin');
      const link: string = 'myapp://docs.openharmony.cn';
      const options: OpenLinkOptions = { appLinkingOnly: true };
      const observation: LinkObservation = await observeOpenLink(link, options);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(16000019);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.message=${observation.message}`);
      expect(observation.message).assertEqual('No matching ability is found.');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.dialogShown=${observation.dialogShown}`);
      expect(observation.dialogShown).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 observation.topName=${observation.topName}`);
      expect(observation.topName).assertEqual('EntryAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkMatrix0069 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_OPEN_LINK_0070
     * @tc.name      testOpenLinkMatrix0070
     * @tc.desc      openLink "myapp://docs.openharmony.cn"，带 parameters：无匹配，返回 16000019 并弹提示
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testOpenLinkMatrix0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkMatrix0070 begin');
      const link: string = 'myapp://docs.openharmony.cn';
      const options: OpenLinkOptions = { appLinkingOnly: false, parameters: { 'from': 'matrix' } };
      const observation: LinkObservation = await observeOpenLink(link, options);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(16000019);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.message=${observation.message}`);
      expect(observation.message).assertEqual('No matching ability is found.');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.dialogShown=${observation.dialogShown}`);
      expect(observation.dialogShown).assertTrue();
      const actual4: boolean = observation.topName === 'OpenLinkAbility';
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkMatrix0070 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_OPEN_LINK_0071
     * @tc.name      testOpenLinkMatrix0071
     * @tc.desc      openLink "abc"，不传 options：参数校验失败返回 401，不弹提示
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testOpenLinkMatrix0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkMatrix0071 begin');
      const link: string = 'abc';
      const observation: LinkObservation = await observeOpenLink(link);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(401);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.message=${observation.message}`);
      expect(observation.message).assertEqual(PARSE_FAILED);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.dialogShown=${observation.dialogShown}`);
      expect(observation.dialogShown).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 observation.topName=${observation.topName}`);
      expect(observation.topName).assertEqual('EntryAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOpenLinkMatrix0071 end');
    })
  })
}
