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
import { Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import {
  closeOpenLinkAbility,
  dismissNoMatchDialog,
  LinkObservation,
  observeStart
} from './LinkHelper';
import { ENTRY_ABILITY, launchAbility } from './TestHelper';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_UniversalLink]';

export default function skillMatchActionEntityTest(): void {
  describe('UniversalLinkSkillMatchActionEntityTest', () => {
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
     * @tc.number    SUB_UNIVERSAL_LINK_SKILL_ACTION_0001
     * @tc.name      testSkillMatchActionEntity0001
     * @tc.desc      action 为不带 action、entities 为不带 entities的隐式 Want 匹配到 OpenLinkAbility 且原样透传
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testSkillMatchActionEntity0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchActionEntity0001 begin');
      const want: Want = {
        uri: 'http://docs.openharmony.cn'
      };
      const observation: LinkObservation = await observeStart(want);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.topName=${observation.topName}`);
      expect(observation.topName).assertEqual('OpenLinkAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.uri=${observation.uri}`);
      expect(observation.uri).assertEqual('http://docs.openharmony.cn');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 observation.action=${observation.action}`);
      expect(observation.action).assertEqual('');
      const actual5: string = JSON.stringify(observation.entities);
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('[]');
      const actual6: Object = observation.parameters['isDelegatorCall'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a6=${actual6}`);
      expect(actual6).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchActionEntity0001 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_SKILL_ACTION_0002
     * @tc.name      testSkillMatchActionEntity0002
     * @tc.desc      action 为不带 action、entities 为browsable的隐式 Want 匹配到 OpenLinkAbility 且原样透传
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testSkillMatchActionEntity0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchActionEntity0002 begin');
      const want: Want = {
        uri: 'http://docs.openharmony.cn',
        entities: ['entity.system.browsable']
      };
      const observation: LinkObservation = await observeStart(want);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.topName=${observation.topName}`);
      expect(observation.topName).assertEqual('OpenLinkAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.uri=${observation.uri}`);
      expect(observation.uri).assertEqual('http://docs.openharmony.cn');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 observation.action=${observation.action}`);
      expect(observation.action).assertEqual('');
      const actual5: string = JSON.stringify(observation.entities);
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('["entity.system.browsable"]');
      const actual6: Object = observation.parameters['isDelegatorCall'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a6=${actual6}`);
      expect(actual6).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchActionEntity0002 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_SKILL_ACTION_0003
     * @tc.name      testSkillMatchActionEntity0003
     * @tc.desc      action 为不带 action、entities 为home的隐式 Want 匹配到 OpenLinkAbility 且原样透传
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSkillMatchActionEntity0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchActionEntity0003 begin');
      const want: Want = {
        uri: 'http://docs.openharmony.cn',
        entities: ['entity.system.home']
      };
      const observation: LinkObservation = await observeStart(want);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.topName=${observation.topName}`);
      expect(observation.topName).assertEqual('OpenLinkAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.uri=${observation.uri}`);
      expect(observation.uri).assertEqual('http://docs.openharmony.cn');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 observation.action=${observation.action}`);
      expect(observation.action).assertEqual('');
      const actual5: string = JSON.stringify(observation.entities);
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('["entity.system.home"]');
      const actual6: Object = observation.parameters['isDelegatorCall'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a6=${actual6}`);
      expect(actual6).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchActionEntity0003 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_SKILL_ACTION_0004
     * @tc.name      testSkillMatchActionEntity0004
     * @tc.desc      action 为不带 action、entities 为home+browsable的隐式 Want 匹配到 OpenLinkAbility 且原样透传
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSkillMatchActionEntity0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchActionEntity0004 begin');
      const want: Want = {
        uri: 'http://docs.openharmony.cn',
        entities: ['entity.system.home', 'entity.system.browsable']
      };
      const observation: LinkObservation = await observeStart(want);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.topName=${observation.topName}`);
      expect(observation.topName).assertEqual('OpenLinkAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.uri=${observation.uri}`);
      expect(observation.uri).assertEqual('http://docs.openharmony.cn');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 observation.action=${observation.action}`);
      expect(observation.action).assertEqual('');
      const actual5: string = JSON.stringify(observation.entities);
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('["entity.system.home","entity.system.browsable"]');
      const actual6: Object = observation.parameters['isDelegatorCall'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a6=${actual6}`);
      expect(actual6).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchActionEntity0004 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_SKILL_ACTION_0005
     * @tc.name      testSkillMatchActionEntity0005
     * @tc.desc      action 为不带 action、entities 为default的隐式 Want 无匹配，返回 16000019
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSkillMatchActionEntity0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchActionEntity0005 begin');
      const want: Want = {
        uri: 'http://docs.openharmony.cn',
        entities: ['entity.system.default']
      };
      const observation: LinkObservation = await observeStart(want);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(16000019);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.message=${observation.message}`);
      expect(observation.message).assertEqual('startAbility failed.');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.dialogShown=${observation.dialogShown}`);
      expect(observation.dialogShown).assertTrue();
      const actual4: boolean = observation.topName === 'OpenLinkAbility';
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchActionEntity0005 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_SKILL_ACTION_0006
     * @tc.name      testSkillMatchActionEntity0006
     * @tc.desc      action 为不带 action、entities 为browsable+default的隐式 Want 无匹配，返回 16000019
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSkillMatchActionEntity0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchActionEntity0006 begin');
      const want: Want = {
        uri: 'http://docs.openharmony.cn',
        entities: ['entity.system.browsable', 'entity.system.default']
      };
      const observation: LinkObservation = await observeStart(want);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(16000019);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.message=${observation.message}`);
      expect(observation.message).assertEqual('startAbility failed.');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.dialogShown=${observation.dialogShown}`);
      expect(observation.dialogShown).assertTrue();
      const actual4: boolean = observation.topName === 'OpenLinkAbility';
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchActionEntity0006 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_SKILL_ACTION_0007
     * @tc.name      testSkillMatchActionEntity0007
     * @tc.desc      action 为viewData、entities 为不带 entities的隐式 Want 匹配到 OpenLinkAbility 且原样透传
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testSkillMatchActionEntity0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchActionEntity0007 begin');
      const want: Want = {
        action: 'ohos.want.action.viewData',
        uri: 'http://docs.openharmony.cn'
      };
      const observation: LinkObservation = await observeStart(want);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.topName=${observation.topName}`);
      expect(observation.topName).assertEqual('OpenLinkAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.uri=${observation.uri}`);
      expect(observation.uri).assertEqual('http://docs.openharmony.cn');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 observation.action=${observation.action}`);
      expect(observation.action).assertEqual('ohos.want.action.viewData');
      const actual5: string = JSON.stringify(observation.entities);
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('[]');
      const actual6: Object = observation.parameters['isDelegatorCall'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a6=${actual6}`);
      expect(actual6).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchActionEntity0007 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_SKILL_ACTION_0008
     * @tc.name      testSkillMatchActionEntity0008
     * @tc.desc      action 为viewData、entities 为browsable的隐式 Want 匹配到 OpenLinkAbility 且原样透传
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testSkillMatchActionEntity0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchActionEntity0008 begin');
      const want: Want = {
        action: 'ohos.want.action.viewData',
        uri: 'http://docs.openharmony.cn',
        entities: ['entity.system.browsable']
      };
      const observation: LinkObservation = await observeStart(want);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.topName=${observation.topName}`);
      expect(observation.topName).assertEqual('OpenLinkAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.uri=${observation.uri}`);
      expect(observation.uri).assertEqual('http://docs.openharmony.cn');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 observation.action=${observation.action}`);
      expect(observation.action).assertEqual('ohos.want.action.viewData');
      const actual5: string = JSON.stringify(observation.entities);
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('["entity.system.browsable"]');
      const actual6: Object = observation.parameters['isDelegatorCall'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a6=${actual6}`);
      expect(actual6).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchActionEntity0008 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_SKILL_ACTION_0009
     * @tc.name      testSkillMatchActionEntity0009
     * @tc.desc      action 为viewData、entities 为home的隐式 Want 匹配到 OpenLinkAbility 且原样透传
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSkillMatchActionEntity0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchActionEntity0009 begin');
      const want: Want = {
        action: 'ohos.want.action.viewData',
        uri: 'http://docs.openharmony.cn',
        entities: ['entity.system.home']
      };
      const observation: LinkObservation = await observeStart(want);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.topName=${observation.topName}`);
      expect(observation.topName).assertEqual('OpenLinkAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.uri=${observation.uri}`);
      expect(observation.uri).assertEqual('http://docs.openharmony.cn');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 observation.action=${observation.action}`);
      expect(observation.action).assertEqual('ohos.want.action.viewData');
      const actual5: string = JSON.stringify(observation.entities);
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('["entity.system.home"]');
      const actual6: Object = observation.parameters['isDelegatorCall'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a6=${actual6}`);
      expect(actual6).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchActionEntity0009 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_SKILL_ACTION_0010
     * @tc.name      testSkillMatchActionEntity0010
     * @tc.desc      action 为viewData、entities 为home+browsable的隐式 Want 匹配到 OpenLinkAbility 且原样透传
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSkillMatchActionEntity0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchActionEntity0010 begin');
      const want: Want = {
        action: 'ohos.want.action.viewData',
        uri: 'http://docs.openharmony.cn',
        entities: ['entity.system.home', 'entity.system.browsable']
      };
      const observation: LinkObservation = await observeStart(want);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.topName=${observation.topName}`);
      expect(observation.topName).assertEqual('OpenLinkAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.uri=${observation.uri}`);
      expect(observation.uri).assertEqual('http://docs.openharmony.cn');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 observation.action=${observation.action}`);
      expect(observation.action).assertEqual('ohos.want.action.viewData');
      const actual5: string = JSON.stringify(observation.entities);
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('["entity.system.home","entity.system.browsable"]');
      const actual6: Object = observation.parameters['isDelegatorCall'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a6=${actual6}`);
      expect(actual6).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchActionEntity0010 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_SKILL_ACTION_0011
     * @tc.name      testSkillMatchActionEntity0011
     * @tc.desc      action 为viewData、entities 为default的隐式 Want 无匹配，返回 16000019
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSkillMatchActionEntity0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchActionEntity0011 begin');
      const want: Want = {
        action: 'ohos.want.action.viewData',
        uri: 'http://docs.openharmony.cn',
        entities: ['entity.system.default']
      };
      const observation: LinkObservation = await observeStart(want);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(16000019);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.message=${observation.message}`);
      expect(observation.message).assertEqual('startAbility failed.');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.dialogShown=${observation.dialogShown}`);
      expect(observation.dialogShown).assertTrue();
      const actual4: boolean = observation.topName === 'OpenLinkAbility';
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchActionEntity0011 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_SKILL_ACTION_0012
     * @tc.name      testSkillMatchActionEntity0012
     * @tc.desc      action 为viewData、entities 为browsable+default的隐式 Want 无匹配，返回 16000019
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSkillMatchActionEntity0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchActionEntity0012 begin');
      const want: Want = {
        action: 'ohos.want.action.viewData',
        uri: 'http://docs.openharmony.cn',
        entities: ['entity.system.browsable', 'entity.system.default']
      };
      const observation: LinkObservation = await observeStart(want);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(16000019);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.message=${observation.message}`);
      expect(observation.message).assertEqual('startAbility failed.');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.dialogShown=${observation.dialogShown}`);
      expect(observation.dialogShown).assertTrue();
      const actual4: boolean = observation.topName === 'OpenLinkAbility';
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchActionEntity0012 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_SKILL_ACTION_0013
     * @tc.name      testSkillMatchActionEntity0013
     * @tc.desc      action 为action.system.home、entities 为不带 entities的隐式 Want 匹配到 OpenLinkAbility 且原样透传
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testSkillMatchActionEntity0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchActionEntity0013 begin');
      const want: Want = {
        action: 'action.system.home',
        uri: 'http://docs.openharmony.cn'
      };
      const observation: LinkObservation = await observeStart(want);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.topName=${observation.topName}`);
      expect(observation.topName).assertEqual('OpenLinkAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.uri=${observation.uri}`);
      expect(observation.uri).assertEqual('http://docs.openharmony.cn');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 observation.action=${observation.action}`);
      expect(observation.action).assertEqual('action.system.home');
      const actual5: string = JSON.stringify(observation.entities);
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('[]');
      const actual6: Object = observation.parameters['isDelegatorCall'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a6=${actual6}`);
      expect(actual6).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchActionEntity0013 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_SKILL_ACTION_0014
     * @tc.name      testSkillMatchActionEntity0014
     * @tc.desc      action 为action.system.home、entities 为browsable的隐式 Want 匹配到 OpenLinkAbility 且原样透传
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testSkillMatchActionEntity0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchActionEntity0014 begin');
      const want: Want = {
        action: 'action.system.home',
        uri: 'http://docs.openharmony.cn',
        entities: ['entity.system.browsable']
      };
      const observation: LinkObservation = await observeStart(want);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.topName=${observation.topName}`);
      expect(observation.topName).assertEqual('OpenLinkAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.uri=${observation.uri}`);
      expect(observation.uri).assertEqual('http://docs.openharmony.cn');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 observation.action=${observation.action}`);
      expect(observation.action).assertEqual('action.system.home');
      const actual5: string = JSON.stringify(observation.entities);
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('["entity.system.browsable"]');
      const actual6: Object = observation.parameters['isDelegatorCall'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a6=${actual6}`);
      expect(actual6).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchActionEntity0014 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_SKILL_ACTION_0015
     * @tc.name      testSkillMatchActionEntity0015
     * @tc.desc      action 为action.system.home、entities 为home的隐式 Want 匹配到 OpenLinkAbility 且原样透传
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSkillMatchActionEntity0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchActionEntity0015 begin');
      const want: Want = {
        action: 'action.system.home',
        uri: 'http://docs.openharmony.cn',
        entities: ['entity.system.home']
      };
      const observation: LinkObservation = await observeStart(want);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.topName=${observation.topName}`);
      expect(observation.topName).assertEqual('OpenLinkAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.uri=${observation.uri}`);
      expect(observation.uri).assertEqual('http://docs.openharmony.cn');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 observation.action=${observation.action}`);
      expect(observation.action).assertEqual('action.system.home');
      const actual5: string = JSON.stringify(observation.entities);
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('["entity.system.home"]');
      const actual6: Object = observation.parameters['isDelegatorCall'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a6=${actual6}`);
      expect(actual6).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchActionEntity0015 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_SKILL_ACTION_0016
     * @tc.name      testSkillMatchActionEntity0016
     * @tc.desc      action 为action.system.home、entities 为home+browsable的隐式 Want 匹配到 OpenLinkAbility 且原样透传
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSkillMatchActionEntity0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchActionEntity0016 begin');
      const want: Want = {
        action: 'action.system.home',
        uri: 'http://docs.openharmony.cn',
        entities: ['entity.system.home', 'entity.system.browsable']
      };
      const observation: LinkObservation = await observeStart(want);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.topName=${observation.topName}`);
      expect(observation.topName).assertEqual('OpenLinkAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.uri=${observation.uri}`);
      expect(observation.uri).assertEqual('http://docs.openharmony.cn');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 observation.action=${observation.action}`);
      expect(observation.action).assertEqual('action.system.home');
      const actual5: string = JSON.stringify(observation.entities);
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('["entity.system.home","entity.system.browsable"]');
      const actual6: Object = observation.parameters['isDelegatorCall'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a6=${actual6}`);
      expect(actual6).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchActionEntity0016 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_SKILL_ACTION_0017
     * @tc.name      testSkillMatchActionEntity0017
     * @tc.desc      action 为action.system.home、entities 为default的隐式 Want 无匹配，返回 16000019
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSkillMatchActionEntity0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchActionEntity0017 begin');
      const want: Want = {
        action: 'action.system.home',
        uri: 'http://docs.openharmony.cn',
        entities: ['entity.system.default']
      };
      const observation: LinkObservation = await observeStart(want);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(16000019);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.message=${observation.message}`);
      expect(observation.message).assertEqual('startAbility failed.');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.dialogShown=${observation.dialogShown}`);
      expect(observation.dialogShown).assertTrue();
      const actual4: boolean = observation.topName === 'OpenLinkAbility';
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchActionEntity0017 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_SKILL_ACTION_0018
     * @tc.name      testSkillMatchActionEntity0018
     * @tc.desc      action 为action.system.home、entities 为browsable+default的隐式 Want 无匹配，返回 16000019
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSkillMatchActionEntity0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchActionEntity0018 begin');
      const want: Want = {
        action: 'action.system.home',
        uri: 'http://docs.openharmony.cn',
        entities: ['entity.system.browsable', 'entity.system.default']
      };
      const observation: LinkObservation = await observeStart(want);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(16000019);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.message=${observation.message}`);
      expect(observation.message).assertEqual('startAbility failed.');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.dialogShown=${observation.dialogShown}`);
      expect(observation.dialogShown).assertTrue();
      const actual4: boolean = observation.topName === 'OpenLinkAbility';
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchActionEntity0018 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_SKILL_ACTION_0019
     * @tc.name      testSkillMatchActionEntity0019
     * @tc.desc      action 为sendData、entities 为不带 entities的隐式 Want 无匹配，返回 16000019
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSkillMatchActionEntity0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchActionEntity0019 begin');
      const want: Want = {
        action: 'ohos.want.action.sendData',
        uri: 'http://docs.openharmony.cn'
      };
      const observation: LinkObservation = await observeStart(want);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(16000019);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.message=${observation.message}`);
      expect(observation.message).assertEqual('startAbility failed.');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.dialogShown=${observation.dialogShown}`);
      expect(observation.dialogShown).assertTrue();
      const actual4: boolean = observation.topName === 'OpenLinkAbility';
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchActionEntity0019 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_SKILL_ACTION_0020
     * @tc.name      testSkillMatchActionEntity0020
     * @tc.desc      action 为sendData、entities 为browsable的隐式 Want 无匹配，返回 16000019
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSkillMatchActionEntity0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchActionEntity0020 begin');
      const want: Want = {
        action: 'ohos.want.action.sendData',
        uri: 'http://docs.openharmony.cn',
        entities: ['entity.system.browsable']
      };
      const observation: LinkObservation = await observeStart(want);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(16000019);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.message=${observation.message}`);
      expect(observation.message).assertEqual('startAbility failed.');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.dialogShown=${observation.dialogShown}`);
      expect(observation.dialogShown).assertTrue();
      const actual4: boolean = observation.topName === 'OpenLinkAbility';
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchActionEntity0020 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_SKILL_ACTION_0021
     * @tc.name      testSkillMatchActionEntity0021
     * @tc.desc      action 为sendData、entities 为home的隐式 Want 无匹配，返回 16000019
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSkillMatchActionEntity0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchActionEntity0021 begin');
      const want: Want = {
        action: 'ohos.want.action.sendData',
        uri: 'http://docs.openharmony.cn',
        entities: ['entity.system.home']
      };
      const observation: LinkObservation = await observeStart(want);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(16000019);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.message=${observation.message}`);
      expect(observation.message).assertEqual('startAbility failed.');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.dialogShown=${observation.dialogShown}`);
      expect(observation.dialogShown).assertTrue();
      const actual4: boolean = observation.topName === 'OpenLinkAbility';
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchActionEntity0021 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_SKILL_ACTION_0022
     * @tc.name      testSkillMatchActionEntity0022
     * @tc.desc      action 为sendData、entities 为home+browsable的隐式 Want 无匹配，返回 16000019
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSkillMatchActionEntity0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchActionEntity0022 begin');
      const want: Want = {
        action: 'ohos.want.action.sendData',
        uri: 'http://docs.openharmony.cn',
        entities: ['entity.system.home', 'entity.system.browsable']
      };
      const observation: LinkObservation = await observeStart(want);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(16000019);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.message=${observation.message}`);
      expect(observation.message).assertEqual('startAbility failed.');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.dialogShown=${observation.dialogShown}`);
      expect(observation.dialogShown).assertTrue();
      const actual4: boolean = observation.topName === 'OpenLinkAbility';
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchActionEntity0022 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_SKILL_ACTION_0023
     * @tc.name      testSkillMatchActionEntity0023
     * @tc.desc      action 为sendData、entities 为default的隐式 Want 无匹配，返回 16000019
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testSkillMatchActionEntity0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchActionEntity0023 begin');
      const want: Want = {
        action: 'ohos.want.action.sendData',
        uri: 'http://docs.openharmony.cn',
        entities: ['entity.system.default']
      };
      const observation: LinkObservation = await observeStart(want);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(16000019);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.message=${observation.message}`);
      expect(observation.message).assertEqual('startAbility failed.');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.dialogShown=${observation.dialogShown}`);
      expect(observation.dialogShown).assertTrue();
      const actual4: boolean = observation.topName === 'OpenLinkAbility';
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchActionEntity0023 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_SKILL_ACTION_0024
     * @tc.name      testSkillMatchActionEntity0024
     * @tc.desc      action 为sendData、entities 为browsable+default的隐式 Want 无匹配，返回 16000019
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testSkillMatchActionEntity0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchActionEntity0024 begin');
      const want: Want = {
        action: 'ohos.want.action.sendData',
        uri: 'http://docs.openharmony.cn',
        entities: ['entity.system.browsable', 'entity.system.default']
      };
      const observation: LinkObservation = await observeStart(want);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(16000019);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.message=${observation.message}`);
      expect(observation.message).assertEqual('startAbility failed.');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.dialogShown=${observation.dialogShown}`);
      expect(observation.dialogShown).assertTrue();
      const actual4: boolean = observation.topName === 'OpenLinkAbility';
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchActionEntity0024 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_SKILL_ACTION_0025
     * @tc.name      testSkillMatchActionEntity0025
     * @tc.desc      action 为search、entities 为不带 entities的隐式 Want 无匹配，返回 16000019
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSkillMatchActionEntity0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchActionEntity0025 begin');
      const want: Want = {
        action: 'ohos.want.action.search',
        uri: 'http://docs.openharmony.cn'
      };
      const observation: LinkObservation = await observeStart(want);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(16000019);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.message=${observation.message}`);
      expect(observation.message).assertEqual('startAbility failed.');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.dialogShown=${observation.dialogShown}`);
      expect(observation.dialogShown).assertTrue();
      const actual4: boolean = observation.topName === 'OpenLinkAbility';
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchActionEntity0025 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_SKILL_ACTION_0026
     * @tc.name      testSkillMatchActionEntity0026
     * @tc.desc      action 为search、entities 为browsable的隐式 Want 无匹配，返回 16000019
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSkillMatchActionEntity0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchActionEntity0026 begin');
      const want: Want = {
        action: 'ohos.want.action.search',
        uri: 'http://docs.openharmony.cn',
        entities: ['entity.system.browsable']
      };
      const observation: LinkObservation = await observeStart(want);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(16000019);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.message=${observation.message}`);
      expect(observation.message).assertEqual('startAbility failed.');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.dialogShown=${observation.dialogShown}`);
      expect(observation.dialogShown).assertTrue();
      const actual4: boolean = observation.topName === 'OpenLinkAbility';
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchActionEntity0026 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_SKILL_ACTION_0027
     * @tc.name      testSkillMatchActionEntity0027
     * @tc.desc      action 为search、entities 为home的隐式 Want 无匹配，返回 16000019
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSkillMatchActionEntity0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchActionEntity0027 begin');
      const want: Want = {
        action: 'ohos.want.action.search',
        uri: 'http://docs.openharmony.cn',
        entities: ['entity.system.home']
      };
      const observation: LinkObservation = await observeStart(want);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(16000019);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.message=${observation.message}`);
      expect(observation.message).assertEqual('startAbility failed.');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.dialogShown=${observation.dialogShown}`);
      expect(observation.dialogShown).assertTrue();
      const actual4: boolean = observation.topName === 'OpenLinkAbility';
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchActionEntity0027 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_SKILL_ACTION_0028
     * @tc.name      testSkillMatchActionEntity0028
     * @tc.desc      action 为search、entities 为home+browsable的隐式 Want 无匹配，返回 16000019
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSkillMatchActionEntity0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchActionEntity0028 begin');
      const want: Want = {
        action: 'ohos.want.action.search',
        uri: 'http://docs.openharmony.cn',
        entities: ['entity.system.home', 'entity.system.browsable']
      };
      const observation: LinkObservation = await observeStart(want);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(16000019);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.message=${observation.message}`);
      expect(observation.message).assertEqual('startAbility failed.');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.dialogShown=${observation.dialogShown}`);
      expect(observation.dialogShown).assertTrue();
      const actual4: boolean = observation.topName === 'OpenLinkAbility';
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchActionEntity0028 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_SKILL_ACTION_0029
     * @tc.name      testSkillMatchActionEntity0029
     * @tc.desc      action 为search、entities 为default的隐式 Want 无匹配，返回 16000019
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testSkillMatchActionEntity0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchActionEntity0029 begin');
      const want: Want = {
        action: 'ohos.want.action.search',
        uri: 'http://docs.openharmony.cn',
        entities: ['entity.system.default']
      };
      const observation: LinkObservation = await observeStart(want);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(16000019);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.message=${observation.message}`);
      expect(observation.message).assertEqual('startAbility failed.');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.dialogShown=${observation.dialogShown}`);
      expect(observation.dialogShown).assertTrue();
      const actual4: boolean = observation.topName === 'OpenLinkAbility';
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchActionEntity0029 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_SKILL_ACTION_0030
     * @tc.name      testSkillMatchActionEntity0030
     * @tc.desc      action 为search、entities 为browsable+default的隐式 Want 无匹配，返回 16000019
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testSkillMatchActionEntity0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchActionEntity0030 begin');
      const want: Want = {
        action: 'ohos.want.action.search',
        uri: 'http://docs.openharmony.cn',
        entities: ['entity.system.browsable', 'entity.system.default']
      };
      const observation: LinkObservation = await observeStart(want);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(16000019);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.message=${observation.message}`);
      expect(observation.message).assertEqual('startAbility failed.');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.dialogShown=${observation.dialogShown}`);
      expect(observation.dialogShown).assertTrue();
      const actual4: boolean = observation.topName === 'OpenLinkAbility';
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchActionEntity0030 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_SKILL_ACTION_0031
     * @tc.name      testSkillMatchActionEntity0031
     * @tc.desc      action 为editData、entities 为不带 entities的隐式 Want 无匹配，返回 16000019
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSkillMatchActionEntity0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchActionEntity0031 begin');
      const want: Want = {
        action: 'ohos.want.action.editData',
        uri: 'http://docs.openharmony.cn'
      };
      const observation: LinkObservation = await observeStart(want);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(16000019);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.message=${observation.message}`);
      expect(observation.message).assertEqual('startAbility failed.');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.dialogShown=${observation.dialogShown}`);
      expect(observation.dialogShown).assertTrue();
      const actual4: boolean = observation.topName === 'OpenLinkAbility';
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchActionEntity0031 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_SKILL_ACTION_0032
     * @tc.name      testSkillMatchActionEntity0032
     * @tc.desc      action 为editData、entities 为browsable的隐式 Want 无匹配，返回 16000019
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSkillMatchActionEntity0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchActionEntity0032 begin');
      const want: Want = {
        action: 'ohos.want.action.editData',
        uri: 'http://docs.openharmony.cn',
        entities: ['entity.system.browsable']
      };
      const observation: LinkObservation = await observeStart(want);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(16000019);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.message=${observation.message}`);
      expect(observation.message).assertEqual('startAbility failed.');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.dialogShown=${observation.dialogShown}`);
      expect(observation.dialogShown).assertTrue();
      const actual4: boolean = observation.topName === 'OpenLinkAbility';
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchActionEntity0032 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_SKILL_ACTION_0033
     * @tc.name      testSkillMatchActionEntity0033
     * @tc.desc      action 为editData、entities 为home的隐式 Want 无匹配，返回 16000019
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSkillMatchActionEntity0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchActionEntity0033 begin');
      const want: Want = {
        action: 'ohos.want.action.editData',
        uri: 'http://docs.openharmony.cn',
        entities: ['entity.system.home']
      };
      const observation: LinkObservation = await observeStart(want);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(16000019);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.message=${observation.message}`);
      expect(observation.message).assertEqual('startAbility failed.');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.dialogShown=${observation.dialogShown}`);
      expect(observation.dialogShown).assertTrue();
      const actual4: boolean = observation.topName === 'OpenLinkAbility';
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchActionEntity0033 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_SKILL_ACTION_0034
     * @tc.name      testSkillMatchActionEntity0034
     * @tc.desc      action 为editData、entities 为home+browsable的隐式 Want 无匹配，返回 16000019
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSkillMatchActionEntity0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchActionEntity0034 begin');
      const want: Want = {
        action: 'ohos.want.action.editData',
        uri: 'http://docs.openharmony.cn',
        entities: ['entity.system.home', 'entity.system.browsable']
      };
      const observation: LinkObservation = await observeStart(want);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(16000019);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.message=${observation.message}`);
      expect(observation.message).assertEqual('startAbility failed.');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.dialogShown=${observation.dialogShown}`);
      expect(observation.dialogShown).assertTrue();
      const actual4: boolean = observation.topName === 'OpenLinkAbility';
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchActionEntity0034 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_SKILL_ACTION_0035
     * @tc.name      testSkillMatchActionEntity0035
     * @tc.desc      action 为editData、entities 为default的隐式 Want 无匹配，返回 16000019
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testSkillMatchActionEntity0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchActionEntity0035 begin');
      const want: Want = {
        action: 'ohos.want.action.editData',
        uri: 'http://docs.openharmony.cn',
        entities: ['entity.system.default']
      };
      const observation: LinkObservation = await observeStart(want);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(16000019);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.message=${observation.message}`);
      expect(observation.message).assertEqual('startAbility failed.');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.dialogShown=${observation.dialogShown}`);
      expect(observation.dialogShown).assertTrue();
      const actual4: boolean = observation.topName === 'OpenLinkAbility';
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchActionEntity0035 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_SKILL_ACTION_0036
     * @tc.name      testSkillMatchActionEntity0036
     * @tc.desc      action 为editData、entities 为browsable+default的隐式 Want 无匹配，返回 16000019
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testSkillMatchActionEntity0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchActionEntity0036 begin');
      const want: Want = {
        action: 'ohos.want.action.editData',
        uri: 'http://docs.openharmony.cn',
        entities: ['entity.system.browsable', 'entity.system.default']
      };
      const observation: LinkObservation = await observeStart(want);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(16000019);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.message=${observation.message}`);
      expect(observation.message).assertEqual('startAbility failed.');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.dialogShown=${observation.dialogShown}`);
      expect(observation.dialogShown).assertTrue();
      const actual4: boolean = observation.topName === 'OpenLinkAbility';
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchActionEntity0036 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_SKILL_ACTION_0037
     * @tc.name      testSkillMatchActionEntity0037
     * @tc.desc      action 为未声明的自定义 action、entities 为不带 entities的隐式 Want 无匹配，返回 16000019
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSkillMatchActionEntity0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchActionEntity0037 begin');
      const want: Want = {
        action: 'action.system.unknown',
        uri: 'http://docs.openharmony.cn'
      };
      const observation: LinkObservation = await observeStart(want);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(16000019);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.message=${observation.message}`);
      expect(observation.message).assertEqual('startAbility failed.');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.dialogShown=${observation.dialogShown}`);
      expect(observation.dialogShown).assertTrue();
      const actual4: boolean = observation.topName === 'OpenLinkAbility';
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchActionEntity0037 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_SKILL_ACTION_0038
     * @tc.name      testSkillMatchActionEntity0038
     * @tc.desc      action 为未声明的自定义 action、entities 为browsable的隐式 Want 无匹配，返回 16000019
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSkillMatchActionEntity0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchActionEntity0038 begin');
      const want: Want = {
        action: 'action.system.unknown',
        uri: 'http://docs.openharmony.cn',
        entities: ['entity.system.browsable']
      };
      const observation: LinkObservation = await observeStart(want);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(16000019);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.message=${observation.message}`);
      expect(observation.message).assertEqual('startAbility failed.');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.dialogShown=${observation.dialogShown}`);
      expect(observation.dialogShown).assertTrue();
      const actual4: boolean = observation.topName === 'OpenLinkAbility';
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchActionEntity0038 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_SKILL_ACTION_0039
     * @tc.name      testSkillMatchActionEntity0039
     * @tc.desc      action 为未声明的自定义 action、entities 为home的隐式 Want 无匹配，返回 16000019
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSkillMatchActionEntity0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchActionEntity0039 begin');
      const want: Want = {
        action: 'action.system.unknown',
        uri: 'http://docs.openharmony.cn',
        entities: ['entity.system.home']
      };
      const observation: LinkObservation = await observeStart(want);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(16000019);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.message=${observation.message}`);
      expect(observation.message).assertEqual('startAbility failed.');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.dialogShown=${observation.dialogShown}`);
      expect(observation.dialogShown).assertTrue();
      const actual4: boolean = observation.topName === 'OpenLinkAbility';
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchActionEntity0039 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_SKILL_ACTION_0040
     * @tc.name      testSkillMatchActionEntity0040
     * @tc.desc      action 为未声明的自定义 action、entities 为home+browsable的隐式 Want 无匹配，返回 16000019
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSkillMatchActionEntity0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchActionEntity0040 begin');
      const want: Want = {
        action: 'action.system.unknown',
        uri: 'http://docs.openharmony.cn',
        entities: ['entity.system.home', 'entity.system.browsable']
      };
      const observation: LinkObservation = await observeStart(want);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(16000019);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.message=${observation.message}`);
      expect(observation.message).assertEqual('startAbility failed.');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.dialogShown=${observation.dialogShown}`);
      expect(observation.dialogShown).assertTrue();
      const actual4: boolean = observation.topName === 'OpenLinkAbility';
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchActionEntity0040 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_SKILL_ACTION_0041
     * @tc.name      testSkillMatchActionEntity0041
     * @tc.desc      action 为未声明的自定义 action、entities 为default的隐式 Want 无匹配，返回 16000019
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testSkillMatchActionEntity0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchActionEntity0041 begin');
      const want: Want = {
        action: 'action.system.unknown',
        uri: 'http://docs.openharmony.cn',
        entities: ['entity.system.default']
      };
      const observation: LinkObservation = await observeStart(want);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(16000019);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.message=${observation.message}`);
      expect(observation.message).assertEqual('startAbility failed.');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.dialogShown=${observation.dialogShown}`);
      expect(observation.dialogShown).assertTrue();
      const actual4: boolean = observation.topName === 'OpenLinkAbility';
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchActionEntity0041 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_SKILL_ACTION_0042
     * @tc.name      testSkillMatchActionEntity0042
     * @tc.desc      action 为未声明的自定义 action、entities 为browsable+default的隐式 Want 无匹配，返回 16000019
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testSkillMatchActionEntity0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchActionEntity0042 begin');
      const want: Want = {
        action: 'action.system.unknown',
        uri: 'http://docs.openharmony.cn',
        entities: ['entity.system.browsable', 'entity.system.default']
      };
      const observation: LinkObservation = await observeStart(want);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(16000019);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.message=${observation.message}`);
      expect(observation.message).assertEqual('startAbility failed.');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.dialogShown=${observation.dialogShown}`);
      expect(observation.dialogShown).assertTrue();
      const actual4: boolean = observation.topName === 'OpenLinkAbility';
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchActionEntity0042 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_SKILL_ACTION_0043
     * @tc.name      testSkillMatchActionEntity0043
     * @tc.desc      viewData 隐式 Want 的 type 为空串时等同未设置 type，匹配到 OpenLinkAbility
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSkillMatchActionEntity0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchActionEntity0043 begin');
      const want: Want = {
        action: 'ohos.want.action.viewData',
        uri: 'http://docs.openharmony.cn',
        type: ''
      };
      const observation: LinkObservation = await observeStart(want);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.topName=${observation.topName}`);
      expect(observation.topName).assertEqual('OpenLinkAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.uri=${observation.uri}`);
      expect(observation.uri).assertEqual('http://docs.openharmony.cn');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 observation.action=${observation.action}`);
      expect(observation.action).assertEqual('ohos.want.action.viewData');
      const actual5: string = JSON.stringify(observation.entities);
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('[]');
      const actual6: Object = observation.parameters['isDelegatorCall'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a6=${actual6}`);
      expect(actual6).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchActionEntity0043 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_SKILL_ACTION_0044
     * @tc.name      testSkillMatchActionEntity0044
     * @tc.desc      viewData 隐式 Want 的 type 为text/plain时与 skill 未声明 type 的 uri 不匹配，返回 16000019
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testSkillMatchActionEntity0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchActionEntity0044 begin');
      const want: Want = {
        action: 'ohos.want.action.viewData',
        uri: 'http://docs.openharmony.cn',
        type: 'text/plain'
      };
      const observation: LinkObservation = await observeStart(want);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(16000019);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.message=${observation.message}`);
      expect(observation.message).assertEqual('startAbility failed.');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.dialogShown=${observation.dialogShown}`);
      expect(observation.dialogShown).assertTrue();
      const actual4: boolean = observation.topName === 'OpenLinkAbility';
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchActionEntity0044 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_SKILL_ACTION_0045
     * @tc.name      testSkillMatchActionEntity0045
     * @tc.desc      viewData 隐式 Want 的 type 为text/html时与 skill 未声明 type 的 uri 不匹配，返回 16000019
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSkillMatchActionEntity0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchActionEntity0045 begin');
      const want: Want = {
        action: 'ohos.want.action.viewData',
        uri: 'http://docs.openharmony.cn',
        type: 'text/html'
      };
      const observation: LinkObservation = await observeStart(want);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(16000019);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.message=${observation.message}`);
      expect(observation.message).assertEqual('startAbility failed.');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.dialogShown=${observation.dialogShown}`);
      expect(observation.dialogShown).assertTrue();
      const actual4: boolean = observation.topName === 'OpenLinkAbility';
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchActionEntity0045 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_SKILL_ACTION_0046
     * @tc.name      testSkillMatchActionEntity0046
     * @tc.desc      viewData 隐式 Want 的 type 为全通配符时与 skill 未声明 type 的 uri 不匹配，返回 16000019
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testSkillMatchActionEntity0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchActionEntity0046 begin');
      const want: Want = {
        action: 'ohos.want.action.viewData',
        uri: 'http://docs.openharmony.cn',
        type: '*/*'
      };
      const observation: LinkObservation = await observeStart(want);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(16000019);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.message=${observation.message}`);
      expect(observation.message).assertEqual('startAbility failed.');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.dialogShown=${observation.dialogShown}`);
      expect(observation.dialogShown).assertTrue();
      const actual4: boolean = observation.topName === 'OpenLinkAbility';
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchActionEntity0046 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_SKILL_ACTION_0047
     * @tc.name      testSkillMatchActionEntity0047
     * @tc.desc      viewData 隐式 Want 的 type 为application/json时与 skill 未声明 type 的 uri 不匹配，返回 16000019
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testSkillMatchActionEntity0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchActionEntity0047 begin');
      const want: Want = {
        action: 'ohos.want.action.viewData',
        uri: 'http://docs.openharmony.cn',
        type: 'application/json'
      };
      const observation: LinkObservation = await observeStart(want);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(16000019);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.message=${observation.message}`);
      expect(observation.message).assertEqual('startAbility failed.');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.dialogShown=${observation.dialogShown}`);
      expect(observation.dialogShown).assertTrue();
      const actual4: boolean = observation.topName === 'OpenLinkAbility';
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchActionEntity0047 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_SKILL_ACTION_0048
     * @tc.name      testSkillMatchActionEntity0048
     * @tc.desc      限定本应用包名的隐式 Want 匹配到 OpenLinkAbility
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testSkillMatchActionEntity0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchActionEntity0048 begin');
      const want: Want = {
        bundleName: 'com.example.universallink',
        action: 'ohos.want.action.viewData',
        uri: 'http://docs.openharmony.cn'
      };
      const observation: LinkObservation = await observeStart(want);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.topName=${observation.topName}`);
      expect(observation.topName).assertEqual('OpenLinkAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.uri=${observation.uri}`);
      expect(observation.uri).assertEqual('http://docs.openharmony.cn');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 observation.action=${observation.action}`);
      expect(observation.action).assertEqual('ohos.want.action.viewData');
      const actual5: string = JSON.stringify(observation.entities);
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('[]');
      const actual6: Object = observation.parameters['isDelegatorCall'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a6=${actual6}`);
      expect(actual6).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchActionEntity0048 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_SKILL_ACTION_0049
     * @tc.name      testSkillMatchActionEntity0049
     * @tc.desc      限定本应用 entry 模块的隐式 Want 匹配到 OpenLinkAbility
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSkillMatchActionEntity0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchActionEntity0049 begin');
      const want: Want = {
        bundleName: 'com.example.universallink',
        moduleName: 'entry',
        action: 'ohos.want.action.viewData',
        uri: 'http://docs.openharmony.cn'
      };
      const observation: LinkObservation = await observeStart(want);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.topName=${observation.topName}`);
      expect(observation.topName).assertEqual('OpenLinkAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.uri=${observation.uri}`);
      expect(observation.uri).assertEqual('http://docs.openharmony.cn');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 observation.action=${observation.action}`);
      expect(observation.action).assertEqual('ohos.want.action.viewData');
      const actual5: string = JSON.stringify(observation.entities);
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('[]');
      const actual6: Object = observation.parameters['isDelegatorCall'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a6=${actual6}`);
      expect(actual6).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchActionEntity0049 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_SKILL_ACTION_0050
     * @tc.name      testSkillMatchActionEntity0050
     * @tc.desc      只限定包名不带 action的隐式 Want 匹配到 OpenLinkAbility
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSkillMatchActionEntity0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchActionEntity0050 begin');
      const want: Want = {
        bundleName: 'com.example.universallink',
        uri: 'http://docs.openharmony.cn/pages'
      };
      const observation: LinkObservation = await observeStart(want);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.topName=${observation.topName}`);
      expect(observation.topName).assertEqual('OpenLinkAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.uri=${observation.uri}`);
      expect(observation.uri).assertEqual('http://docs.openharmony.cn/pages');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 observation.action=${observation.action}`);
      expect(observation.action).assertEqual('');
      const actual5: string = JSON.stringify(observation.entities);
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('[]');
      const actual6: Object = observation.parameters['isDelegatorCall'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a6=${actual6}`);
      expect(actual6).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchActionEntity0050 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_SKILL_ACTION_0051
     * @tc.name      testSkillMatchActionEntity0051
     * @tc.desc      限定到没有该 skill 的 entry_test 模块的隐式 Want 没有 Ability 匹配，返回 16000019
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testSkillMatchActionEntity0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchActionEntity0051 begin');
      const want: Want = {
        bundleName: 'com.example.universallink',
        moduleName: 'entry_test',
        action: 'ohos.want.action.viewData',
        uri: 'http://docs.openharmony.cn'
      };
      const observation: LinkObservation = await observeStart(want);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(16000019);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.message=${observation.message}`);
      expect(observation.message).assertEqual('startAbility failed.');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.dialogShown=${observation.dialogShown}`);
      expect(observation.dialogShown).assertTrue();
      const actual4: boolean = observation.topName === 'OpenLinkAbility';
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchActionEntity0051 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_SKILL_ACTION_0052
     * @tc.name      testSkillMatchActionEntity0052
     * @tc.desc      限定其他包名的隐式 Want 没有 Ability 匹配，返回 16000019
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSkillMatchActionEntity0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchActionEntity0052 begin');
      const want: Want = {
        bundleName: 'com.example.other',
        action: 'ohos.want.action.viewData',
        uri: 'http://docs.openharmony.cn'
      };
      const observation: LinkObservation = await observeStart(want);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(16000019);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.message=${observation.message}`);
      expect(observation.message).assertEqual('startAbility failed.');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.dialogShown=${observation.dialogShown}`);
      expect(observation.dialogShown).assertTrue();
      const actual4: boolean = observation.topName === 'OpenLinkAbility';
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchActionEntity0052 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_SKILL_ACTION_0053
     * @tc.name      testSkillMatchActionEntity0053
     * @tc.desc      限定包名但不带 uri的隐式 Want 没有 Ability 匹配，返回 16000019
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSkillMatchActionEntity0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchActionEntity0053 begin');
      const want: Want = {
        bundleName: 'com.example.universallink',
        action: 'ohos.want.action.viewData'
      };
      const observation: LinkObservation = await observeStart(want);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(16000019);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.message=${observation.message}`);
      expect(observation.message).assertEqual('startAbility failed.');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.dialogShown=${observation.dialogShown}`);
      expect(observation.dialogShown).assertTrue();
      const actual4: boolean = observation.topName === 'OpenLinkAbility';
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchActionEntity0053 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_SKILL_ACTION_0054
     * @tc.name      testSkillMatchActionEntity0054
     * @tc.desc      只带 viewData 不带 uri的隐式 Want 没有 Ability 匹配，返回 16000019
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testSkillMatchActionEntity0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchActionEntity0054 begin');
      const want: Want = {
        action: 'ohos.want.action.viewData'
      };
      const observation: LinkObservation = await observeStart(want);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(16000019);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.message=${observation.message}`);
      expect(observation.message).assertEqual('startAbility failed.');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.dialogShown=${observation.dialogShown}`);
      expect(observation.dialogShown).assertTrue();
      const actual4: boolean = observation.topName === 'OpenLinkAbility';
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchActionEntity0054 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_SKILL_ACTION_0055
     * @tc.name      testSkillMatchActionEntity0055
     * @tc.desc      只带 browsable 不带 uri的隐式 Want 没有 Ability 匹配，返回 16000019
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testSkillMatchActionEntity0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchActionEntity0055 begin');
      const want: Want = {
        entities: ['entity.system.browsable']
      };
      const observation: LinkObservation = await observeStart(want);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(16000019);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.message=${observation.message}`);
      expect(observation.message).assertEqual('startAbility failed.');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.dialogShown=${observation.dialogShown}`);
      expect(observation.dialogShown).assertTrue();
      const actual4: boolean = observation.topName === 'OpenLinkAbility';
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchActionEntity0055 end');
    })
  })
}
