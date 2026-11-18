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

export default function skillMatchUriTest(): void {
  describe('UniversalLinkSkillMatchUriTest', () => {
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
     * @tc.number    SUB_UNIVERSAL_LINK_SKILL_URI_0001
     * @tc.name      testSkillMatchUri0001
     * @tc.desc      隐式 Want 的 uri 为域名根地址 "http://docs.openharmony.cn"，匹配到 OpenLinkAbility 且 uri 不变
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testSkillMatchUri0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchUri0001 begin');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchUri0001 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_SKILL_URI_0002
     * @tc.name      testSkillMatchUri0002
     * @tc.desc      隐式 Want 的 uri 为根路径带斜杠 "http://docs.openharmony.cn/"，匹配到 OpenLinkAbility 且 uri 不变
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testSkillMatchUri0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchUri0002 begin');
      const want: Want = {
        action: 'ohos.want.action.viewData',
        uri: 'http://docs.openharmony.cn/'
      };
      const observation: LinkObservation = await observeStart(want);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.topName=${observation.topName}`);
      expect(observation.topName).assertEqual('OpenLinkAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.uri=${observation.uri}`);
      expect(observation.uri).assertEqual('http://docs.openharmony.cn/');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 observation.action=${observation.action}`);
      expect(observation.action).assertEqual('ohos.want.action.viewData');
      const actual5: string = JSON.stringify(observation.entities);
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('[]');
      const actual6: Object = observation.parameters['isDelegatorCall'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a6=${actual6}`);
      expect(actual6).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchUri0002 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_SKILL_URI_0003
     * @tc.name      testSkillMatchUri0003
     * @tc.desc      隐式 Want 的 uri 为一级路径 "http://docs.openharmony.cn/pages"，匹配到 OpenLinkAbility 且 uri 不变
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testSkillMatchUri0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchUri0003 begin');
      const want: Want = {
        action: 'ohos.want.action.viewData',
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
      expect(observation.action).assertEqual('ohos.want.action.viewData');
      const actual5: string = JSON.stringify(observation.entities);
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('[]');
      const actual6: Object = observation.parameters['isDelegatorCall'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a6=${actual6}`);
      expect(actual6).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchUri0003 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_SKILL_URI_0004
     * @tc.name      testSkillMatchUri0004
     * @tc.desc      隐式 Want 的 uri 为带版本号的多级路径 "http://docs.openharmony.cn/pages/v4.1"，匹配到 OpenLinkAbility 且 uri 不变
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSkillMatchUri0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchUri0004 begin');
      const want: Want = {
        action: 'ohos.want.action.viewData',
        uri: 'http://docs.openharmony.cn/pages/v4.1'
      };
      const observation: LinkObservation = await observeStart(want);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.topName=${observation.topName}`);
      expect(observation.topName).assertEqual('OpenLinkAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.uri=${observation.uri}`);
      expect(observation.uri).assertEqual('http://docs.openharmony.cn/pages/v4.1');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 observation.action=${observation.action}`);
      expect(observation.action).assertEqual('ohos.want.action.viewData');
      const actual5: string = JSON.stringify(observation.entities);
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('[]');
      const actual6: Object = observation.parameters['isDelegatorCall'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a6=${actual6}`);
      expect(actual6).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchUri0004 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_SKILL_URI_0005
     * @tc.name      testSkillMatchUri0005
     * @tc.desc      隐式 Want 的 uri 为带文件名的多级路径 "http://docs.openharmony.cn/a/b/c.html"，匹配到 OpenLinkAbility 且 uri 不变
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSkillMatchUri0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchUri0005 begin');
      const want: Want = {
        action: 'ohos.want.action.viewData',
        uri: 'http://docs.openharmony.cn/a/b/c.html'
      };
      const observation: LinkObservation = await observeStart(want);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.topName=${observation.topName}`);
      expect(observation.topName).assertEqual('OpenLinkAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.uri=${observation.uri}`);
      expect(observation.uri).assertEqual('http://docs.openharmony.cn/a/b/c.html');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 observation.action=${observation.action}`);
      expect(observation.action).assertEqual('ohos.want.action.viewData');
      const actual5: string = JSON.stringify(observation.entities);
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('[]');
      const actual6: Object = observation.parameters['isDelegatorCall'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a6=${actual6}`);
      expect(actual6).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchUri0005 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_SKILL_URI_0006
     * @tc.name      testSkillMatchUri0006
     * @tc.desc      隐式 Want 的 uri 为非默认端口 "http://docs.openharmony.cn:8080"，匹配到 OpenLinkAbility 且 uri 不变
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSkillMatchUri0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchUri0006 begin');
      const want: Want = {
        action: 'ohos.want.action.viewData',
        uri: 'http://docs.openharmony.cn:8080'
      };
      const observation: LinkObservation = await observeStart(want);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.topName=${observation.topName}`);
      expect(observation.topName).assertEqual('OpenLinkAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.uri=${observation.uri}`);
      expect(observation.uri).assertEqual('http://docs.openharmony.cn:8080');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 observation.action=${observation.action}`);
      expect(observation.action).assertEqual('ohos.want.action.viewData');
      const actual5: string = JSON.stringify(observation.entities);
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('[]');
      const actual6: Object = observation.parameters['isDelegatorCall'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a6=${actual6}`);
      expect(actual6).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchUri0006 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_SKILL_URI_0007
     * @tc.name      testSkillMatchUri0007
     * @tc.desc      隐式 Want 的 uri 为端口加路径 "http://docs.openharmony.cn:8080/x"，匹配到 OpenLinkAbility 且 uri 不变
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testSkillMatchUri0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchUri0007 begin');
      const want: Want = {
        action: 'ohos.want.action.viewData',
        uri: 'http://docs.openharmony.cn:8080/x'
      };
      const observation: LinkObservation = await observeStart(want);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.topName=${observation.topName}`);
      expect(observation.topName).assertEqual('OpenLinkAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.uri=${observation.uri}`);
      expect(observation.uri).assertEqual('http://docs.openharmony.cn:8080/x');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 observation.action=${observation.action}`);
      expect(observation.action).assertEqual('ohos.want.action.viewData');
      const actual5: string = JSON.stringify(observation.entities);
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('[]');
      const actual6: Object = observation.parameters['isDelegatorCall'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a6=${actual6}`);
      expect(actual6).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchUri0007 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_SKILL_URI_0008
     * @tc.name      testSkillMatchUri0008
     * @tc.desc      隐式 Want 的 uri 为显式写出默认端口 "http://docs.openharmony.cn:80"，匹配到 OpenLinkAbility 且 uri 不变
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testSkillMatchUri0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchUri0008 begin');
      const want: Want = {
        action: 'ohos.want.action.viewData',
        uri: 'http://docs.openharmony.cn:80'
      };
      const observation: LinkObservation = await observeStart(want);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.topName=${observation.topName}`);
      expect(observation.topName).assertEqual('OpenLinkAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.uri=${observation.uri}`);
      expect(observation.uri).assertEqual('http://docs.openharmony.cn:80');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 observation.action=${observation.action}`);
      expect(observation.action).assertEqual('ohos.want.action.viewData');
      const actual5: string = JSON.stringify(observation.entities);
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('[]');
      const actual6: Object = observation.parameters['isDelegatorCall'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a6=${actual6}`);
      expect(actual6).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchUri0008 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_SKILL_URI_0009
     * @tc.name      testSkillMatchUri0009
     * @tc.desc      隐式 Want 的 uri 为查询参数 "http://docs.openharmony.cn?x=1"，匹配到 OpenLinkAbility 且 uri 不变
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSkillMatchUri0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchUri0009 begin');
      const want: Want = {
        action: 'ohos.want.action.viewData',
        uri: 'http://docs.openharmony.cn?x=1'
      };
      const observation: LinkObservation = await observeStart(want);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.topName=${observation.topName}`);
      expect(observation.topName).assertEqual('OpenLinkAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.uri=${observation.uri}`);
      expect(observation.uri).assertEqual('http://docs.openharmony.cn?x=1');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 observation.action=${observation.action}`);
      expect(observation.action).assertEqual('ohos.want.action.viewData');
      const actual5: string = JSON.stringify(observation.entities);
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('[]');
      const actual6: Object = observation.parameters['isDelegatorCall'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a6=${actual6}`);
      expect(actual6).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchUri0009 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_SKILL_URI_0010
     * @tc.name      testSkillMatchUri0010
     * @tc.desc      隐式 Want 的 uri 为多个查询参数 "http://docs.openharmony.cn/?a=1&b=2"，匹配到 OpenLinkAbility 且 uri 不变
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testSkillMatchUri0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchUri0010 begin');
      const want: Want = {
        action: 'ohos.want.action.viewData',
        uri: 'http://docs.openharmony.cn/?a=1&b=2'
      };
      const observation: LinkObservation = await observeStart(want);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.topName=${observation.topName}`);
      expect(observation.topName).assertEqual('OpenLinkAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.uri=${observation.uri}`);
      expect(observation.uri).assertEqual('http://docs.openharmony.cn/?a=1&b=2');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 observation.action=${observation.action}`);
      expect(observation.action).assertEqual('ohos.want.action.viewData');
      const actual5: string = JSON.stringify(observation.entities);
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('[]');
      const actual6: Object = observation.parameters['isDelegatorCall'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a6=${actual6}`);
      expect(actual6).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchUri0010 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_SKILL_URI_0011
     * @tc.name      testSkillMatchUri0011
     * @tc.desc      隐式 Want 的 uri 为大写 scheme "HTTP://docs.openharmony.cn"，匹配到 OpenLinkAbility 且 uri 不变
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSkillMatchUri0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchUri0011 begin');
      const want: Want = {
        action: 'ohos.want.action.viewData',
        uri: 'HTTP://docs.openharmony.cn'
      };
      const observation: LinkObservation = await observeStart(want);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.topName=${observation.topName}`);
      expect(observation.topName).assertEqual('OpenLinkAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.uri=${observation.uri}`);
      expect(observation.uri).assertEqual('HTTP://docs.openharmony.cn');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 observation.action=${observation.action}`);
      expect(observation.action).assertEqual('ohos.want.action.viewData');
      const actual5: string = JSON.stringify(observation.entities);
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('[]');
      const actual6: Object = observation.parameters['isDelegatorCall'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a6=${actual6}`);
      expect(actual6).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchUri0011 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_SKILL_URI_0012
     * @tc.name      testSkillMatchUri0012
     * @tc.desc      隐式 Want 的 uri 为大写 host "http://DOCS.OPENHARMONY.CN"，匹配到 OpenLinkAbility 且 uri 不变
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSkillMatchUri0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchUri0012 begin');
      const want: Want = {
        action: 'ohos.want.action.viewData',
        uri: 'http://DOCS.OPENHARMONY.CN'
      };
      const observation: LinkObservation = await observeStart(want);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.topName=${observation.topName}`);
      expect(observation.topName).assertEqual('OpenLinkAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.uri=${observation.uri}`);
      expect(observation.uri).assertEqual('http://DOCS.OPENHARMONY.CN');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 observation.action=${observation.action}`);
      expect(observation.action).assertEqual('ohos.want.action.viewData');
      const actual5: string = JSON.stringify(observation.entities);
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('[]');
      const actual6: Object = observation.parameters['isDelegatorCall'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a6=${actual6}`);
      expect(actual6).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchUri0012 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_SKILL_URI_0013
     * @tc.name      testSkillMatchUri0013
     * @tc.desc      隐式 Want 的 uri 为大小写混合 "Http://Docs.OpenHarmony.Cn"，匹配到 OpenLinkAbility 且 uri 不变
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testSkillMatchUri0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchUri0013 begin');
      const want: Want = {
        action: 'ohos.want.action.viewData',
        uri: 'Http://Docs.OpenHarmony.Cn'
      };
      const observation: LinkObservation = await observeStart(want);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.topName=${observation.topName}`);
      expect(observation.topName).assertEqual('OpenLinkAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.uri=${observation.uri}`);
      expect(observation.uri).assertEqual('Http://Docs.OpenHarmony.Cn');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 observation.action=${observation.action}`);
      expect(observation.action).assertEqual('ohos.want.action.viewData');
      const actual5: string = JSON.stringify(observation.entities);
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('[]');
      const actual6: Object = observation.parameters['isDelegatorCall'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a6=${actual6}`);
      expect(actual6).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchUri0013 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_SKILL_URI_0014
     * @tc.name      testSkillMatchUri0014
     * @tc.desc      隐式 Want 的 uri 为编码的中文路径 "http://docs.openharmony.cn/%E4%B8%AD%E6%96%87"，匹配到 OpenLinkAbility 且 uri 不变
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testSkillMatchUri0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchUri0014 begin');
      const want: Want = {
        action: 'ohos.want.action.viewData',
        uri: 'http://docs.openharmony.cn/%E4%B8%AD%E6%96%87'
      };
      const observation: LinkObservation = await observeStart(want);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.topName=${observation.topName}`);
      expect(observation.topName).assertEqual('OpenLinkAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.uri=${observation.uri}`);
      expect(observation.uri).assertEqual('http://docs.openharmony.cn/%E4%B8%AD%E6%96%87');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 observation.action=${observation.action}`);
      expect(observation.action).assertEqual('ohos.want.action.viewData');
      const actual5: string = JSON.stringify(observation.entities);
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('[]');
      const actual6: Object = observation.parameters['isDelegatorCall'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a6=${actual6}`);
      expect(actual6).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchUri0014 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_SKILL_URI_0015
     * @tc.name      testSkillMatchUri0015
     * @tc.desc      隐式 Want 的 uri 为未编码的中文路径 "http://docs.openharmony.cn/中文"，匹配到 OpenLinkAbility 且 uri 不变
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testSkillMatchUri0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchUri0015 begin');
      const want: Want = {
        action: 'ohos.want.action.viewData',
        uri: 'http://docs.openharmony.cn/中文'
      };
      const observation: LinkObservation = await observeStart(want);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.topName=${observation.topName}`);
      expect(observation.topName).assertEqual('OpenLinkAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.uri=${observation.uri}`);
      expect(observation.uri).assertEqual('http://docs.openharmony.cn/中文');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 observation.action=${observation.action}`);
      expect(observation.action).assertEqual('ohos.want.action.viewData');
      const actual5: string = JSON.stringify(observation.entities);
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('[]');
      const actual6: Object = observation.parameters['isDelegatorCall'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a6=${actual6}`);
      expect(actual6).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchUri0015 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_SKILL_URI_0016
     * @tc.name      testSkillMatchUri0016
     * @tc.desc      隐式 Want 的 uri 为编码空格 "http://docs.openharmony.cn/a%20b"，匹配到 OpenLinkAbility 且 uri 不变
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testSkillMatchUri0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchUri0016 begin');
      const want: Want = {
        action: 'ohos.want.action.viewData',
        uri: 'http://docs.openharmony.cn/a%20b'
      };
      const observation: LinkObservation = await observeStart(want);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.topName=${observation.topName}`);
      expect(observation.topName).assertEqual('OpenLinkAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.uri=${observation.uri}`);
      expect(observation.uri).assertEqual('http://docs.openharmony.cn/a%20b');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 observation.action=${observation.action}`);
      expect(observation.action).assertEqual('ohos.want.action.viewData');
      const actual5: string = JSON.stringify(observation.entities);
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('[]');
      const actual6: Object = observation.parameters['isDelegatorCall'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a6=${actual6}`);
      expect(actual6).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchUri0016 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_SKILL_URI_0017
     * @tc.name      testSkillMatchUri0017
     * @tc.desc      隐式 Want 的 uri 为路径里有连续斜杠 "http://docs.openharmony.cn//double"，匹配到 OpenLinkAbility 且 uri 不变
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testSkillMatchUri0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchUri0017 begin');
      const want: Want = {
        action: 'ohos.want.action.viewData',
        uri: 'http://docs.openharmony.cn//double'
      };
      const observation: LinkObservation = await observeStart(want);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.topName=${observation.topName}`);
      expect(observation.topName).assertEqual('OpenLinkAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.uri=${observation.uri}`);
      expect(observation.uri).assertEqual('http://docs.openharmony.cn//double');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 observation.action=${observation.action}`);
      expect(observation.action).assertEqual('ohos.want.action.viewData');
      const actual5: string = JSON.stringify(observation.entities);
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('[]');
      const actual6: Object = observation.parameters['isDelegatorCall'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a6=${actual6}`);
      expect(actual6).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchUri0017 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_SKILL_URI_0018
     * @tc.name      testSkillMatchUri0018
     * @tc.desc      隐式 Want 的 uri 为路径加 fragment "http://docs.openharmony.cn/pages#top"，匹配到 OpenLinkAbility 且 uri 不变
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testSkillMatchUri0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchUri0018 begin');
      const want: Want = {
        action: 'ohos.want.action.viewData',
        uri: 'http://docs.openharmony.cn/pages#top'
      };
      const observation: LinkObservation = await observeStart(want);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.topName=${observation.topName}`);
      expect(observation.topName).assertEqual('OpenLinkAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.uri=${observation.uri}`);
      expect(observation.uri).assertEqual('http://docs.openharmony.cn/pages#top');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 observation.action=${observation.action}`);
      expect(observation.action).assertEqual('ohos.want.action.viewData');
      const actual5: string = JSON.stringify(observation.entities);
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('[]');
      const actual6: Object = observation.parameters['isDelegatorCall'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a6=${actual6}`);
      expect(actual6).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchUri0018 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_SKILL_URI_0019
     * @tc.name      testSkillMatchUri0019
     * @tc.desc      隐式 Want 的 uri 为https scheme "https://docs.openharmony.cn"，返回 16000019 并弹提示
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testSkillMatchUri0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchUri0019 begin');
      const want: Want = {
        action: 'ohos.want.action.viewData',
        uri: 'https://docs.openharmony.cn'
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchUri0019 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_SKILL_URI_0020
     * @tc.name      testSkillMatchUri0020
     * @tc.desc      隐式 Want 的 uri 为ftp scheme "ftp://docs.openharmony.cn"，返回 16000019 并弹提示
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSkillMatchUri0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchUri0020 begin');
      const want: Want = {
        action: 'ohos.want.action.viewData',
        uri: 'ftp://docs.openharmony.cn'
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchUri0020 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_SKILL_URI_0021
     * @tc.name      testSkillMatchUri0021
     * @tc.desc      隐式 Want 的 uri 为同主域的其他子域 "http://www.openharmony.cn"，返回 16000019 并弹提示
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testSkillMatchUri0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchUri0021 begin');
      const want: Want = {
        action: 'ohos.want.action.viewData',
        uri: 'http://www.openharmony.cn'
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchUri0021 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_SKILL_URI_0022
     * @tc.name      testSkillMatchUri0022
     * @tc.desc      隐式 Want 的 uri 为更深一级子域 "http://sub.docs.openharmony.cn"，返回 16000019 并弹提示
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSkillMatchUri0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchUri0022 begin');
      const want: Want = {
        action: 'ohos.want.action.viewData',
        uri: 'http://sub.docs.openharmony.cn'
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchUri0022 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_SKILL_URI_0023
     * @tc.name      testSkillMatchUri0023
     * @tc.desc      隐式 Want 的 uri 为缺 scheme "docs.openharmony.cn"，返回 16000019 并弹提示
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSkillMatchUri0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchUri0023 begin');
      const want: Want = {
        action: 'ohos.want.action.viewData',
        uri: 'docs.openharmony.cn'
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchUri0023 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_SKILL_URI_0024
     * @tc.name      testSkillMatchUri0024
     * @tc.desc      隐式 Want 的 uri 为只有 scheme "http://"，返回 16000019 并弹提示
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testSkillMatchUri0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchUri0024 begin');
      const want: Want = {
        action: 'ohos.want.action.viewData',
        uri: 'http://'
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchUri0024 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_SKILL_URI_0025
     * @tc.name      testSkillMatchUri0025
     * @tc.desc      隐式 Want 的 uri 为带 fragment "http://docs.openharmony.cn#f"，返回 16000019 并弹提示
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testSkillMatchUri0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchUri0025 begin');
      const want: Want = {
        action: 'ohos.want.action.viewData',
        uri: 'http://docs.openharmony.cn#f'
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchUri0025 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_SKILL_URI_0026
     * @tc.name      testSkillMatchUri0026
     * @tc.desc      隐式 Want 的 uri 为顶级域不同 "http://docs.openharmony.com"，返回 16000019 并弹提示
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSkillMatchUri0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchUri0026 begin');
      const want: Want = {
        action: 'ohos.want.action.viewData',
        uri: 'http://docs.openharmony.com'
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchUri0026 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_SKILL_URI_0027
     * @tc.name      testSkillMatchUri0027
     * @tc.desc      隐式 Want 的 uri 为少一级子域 "http://openharmony.cn"，返回 16000019 并弹提示
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSkillMatchUri0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchUri0027 begin');
      const want: Want = {
        action: 'ohos.want.action.viewData',
        uri: 'http://openharmony.cn'
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchUri0027 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_SKILL_URI_0028
     * @tc.name      testSkillMatchUri0028
     * @tc.desc      隐式 Want 的 uri 为点换成连字符 "http://docs-openharmony.cn"，返回 16000019 并弹提示
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testSkillMatchUri0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchUri0028 begin');
      const want: Want = {
        action: 'ohos.want.action.viewData',
        uri: 'http://docs-openharmony.cn'
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchUri0028 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_SKILL_URI_0029
     * @tc.name      testSkillMatchUri0029
     * @tc.desc      隐式 Want 的 uri 为以配置域名为前缀的其他域名 "http://docs.openharmony.cn.evil.com"，返回 16000019 并弹提示
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testSkillMatchUri0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchUri0029 begin');
      const want: Want = {
        action: 'ohos.want.action.viewData',
        uri: 'http://docs.openharmony.cn.evil.com'
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchUri0029 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_SKILL_URI_0030
     * @tc.name      testSkillMatchUri0030
     * @tc.desc      隐式 Want 的 uri 为file scheme "file:///data/storage/el2/base/files"，返回 16000019 并弹提示
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testSkillMatchUri0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchUri0030 begin');
      const want: Want = {
        action: 'ohos.want.action.viewData',
        uri: 'file:///data/storage/el2/base/files'
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchUri0030 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_SKILL_URI_0031
     * @tc.name      testSkillMatchUri0031
     * @tc.desc      隐式 Want 的 uri 为mailto scheme "mailto:a@docs.openharmony.cn"，返回 16000019 并弹提示
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testSkillMatchUri0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchUri0031 begin');
      const want: Want = {
        action: 'ohos.want.action.viewData',
        uri: 'mailto:a@docs.openharmony.cn'
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchUri0031 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_SKILL_URI_0032
     * @tc.name      testSkillMatchUri0032
     * @tc.desc      隐式 Want 的 uri 为tel scheme "tel:10086"，返回 16000019 并弹提示
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testSkillMatchUri0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchUri0032 begin');
      const want: Want = {
        action: 'ohos.want.action.viewData',
        uri: 'tel:10086'
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchUri0032 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_SKILL_URI_0033
     * @tc.name      testSkillMatchUri0033
     * @tc.desc      隐式 Want 的 uri 为自定义 scheme "myapp://docs.openharmony.cn"，返回 16000019 并弹提示
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSkillMatchUri0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchUri0033 begin');
      const want: Want = {
        action: 'ohos.want.action.viewData',
        uri: 'myapp://docs.openharmony.cn'
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchUri0033 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_SKILL_URI_0034
     * @tc.name      testSkillMatchUri0034
     * @tc.desc      隐式 Want 的 uri 为https 加路径 "https://docs.openharmony.cn/pages"，返回 16000019 并弹提示
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSkillMatchUri0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchUri0034 begin');
      const want: Want = {
        action: 'ohos.want.action.viewData',
        uri: 'https://docs.openharmony.cn/pages'
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchUri0034 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_SKILL_URI_0035
     * @tc.name      testSkillMatchUri0035
     * @tc.desc      隐式 Want 的 uri 为大写 https "HTTPS://DOCS.OPENHARMONY.CN"，返回 16000019 并弹提示
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testSkillMatchUri0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchUri0035 begin');
      const want: Want = {
        action: 'ohos.want.action.viewData',
        uri: 'HTTPS://DOCS.OPENHARMONY.CN'
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchUri0035 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_SKILL_URI_0036
     * @tc.name      testSkillMatchUri0036
     * @tc.desc      隐式 Want 的 uri 为ws scheme "ws://docs.openharmony.cn"，返回 16000019 并弹提示
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testSkillMatchUri0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchUri0036 begin');
      const want: Want = {
        action: 'ohos.want.action.viewData',
        uri: 'ws://docs.openharmony.cn'
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchUri0036 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_SKILL_URI_0037
     * @tc.name      testSkillMatchUri0037
     * @tc.desc      隐式 Want 的 uri 为缺顶级域 "http://docs.openharmony"，返回 16000019 并弹提示
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testSkillMatchUri0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchUri0037 begin');
      const want: Want = {
        action: 'ohos.want.action.viewData',
        uri: 'http://docs.openharmony'
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchUri0037 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_SKILL_URI_0038
     * @tc.name      testSkillMatchUri0038
     * @tc.desc      隐式 Want 的 uri 为IP 地址 "http://127.0.0.1"，返回 16000019 并弹提示
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testSkillMatchUri0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchUri0038 begin');
      const want: Want = {
        action: 'ohos.want.action.viewData',
        uri: 'http://127.0.0.1'
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchUri0038 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_SKILL_URI_0039
     * @tc.name      testSkillMatchUri0039
     * @tc.desc      隐式 Want 的 uri 为localhost "http://localhost"，返回 16000019 并弹提示
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testSkillMatchUri0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchUri0039 begin');
      const want: Want = {
        action: 'ohos.want.action.viewData',
        uri: 'http://localhost'
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchUri0039 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_SKILL_URI_0040
     * @tc.name      testSkillMatchUri0040
     * @tc.desc      隐式 Want 的 uri 为域名末尾带点 "http://docs.openharmony.cn."，返回 16000019 并弹提示
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testSkillMatchUri0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchUri0040 begin');
      const want: Want = {
        action: 'ohos.want.action.viewData',
        uri: 'http://docs.openharmony.cn.'
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchUri0040 end');
    })
  })
}
