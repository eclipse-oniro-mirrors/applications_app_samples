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

export default function skillMatchUriExtendedTest(): void {
  describe('UniversalLinkSkillMatchUriExtendedTest', () => {
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
     * @tc.number    SUB_UNIVERSAL_LINK_SKILL_URI_EXTENDED_0001
     * @tc.name      testSkillMatchUriExtended0001
     * @tc.desc      扩展：隐式 Want uri 多级路径带版本号 "http://docs.openharmony.cn/pages/v4.1/release" 匹配 OpenLinkAbility
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSkillMatchUriExtended0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchUriExtended0001 begin');
      const want: Want = {
        action: 'ohos.want.action.viewData',
        uri: 'http://docs.openharmony.cn/pages/v4.1/release'
      };
      const observation: LinkObservation = await observeStart(want);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.topName=${observation.topName}`);
      expect(observation.topName).assertEqual('OpenLinkAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.uri=${observation.uri}`);
      expect(observation.uri).assertEqual('http://docs.openharmony.cn/pages/v4.1/release');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 observation.action=${observation.action}`);
      expect(observation.action).assertEqual('ohos.want.action.viewData');
      const actual5: string = JSON.stringify(observation.entities);
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('[]');
      const actual6: Object = observation.parameters['isDelegatorCall'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a6=${actual6}`);
      expect(actual6).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchUriExtended0001 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_SKILL_URI_EXTENDED_0002
     * @tc.name      testSkillMatchUriExtended0002
     * @tc.desc      扩展：隐式 Want uri 四级路径带 html "http://docs.openharmony.cn/a/b/c/d.html" 匹配 OpenLinkAbility
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSkillMatchUriExtended0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchUriExtended0002 begin');
      const want: Want = {
        action: 'ohos.want.action.viewData',
        uri: 'http://docs.openharmony.cn/a/b/c/d.html'
      };
      const observation: LinkObservation = await observeStart(want);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.topName=${observation.topName}`);
      expect(observation.topName).assertEqual('OpenLinkAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.uri=${observation.uri}`);
      expect(observation.uri).assertEqual('http://docs.openharmony.cn/a/b/c/d.html');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 observation.action=${observation.action}`);
      expect(observation.action).assertEqual('ohos.want.action.viewData');
      const actual5: string = JSON.stringify(observation.entities);
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('[]');
      const actual6: Object = observation.parameters['isDelegatorCall'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a6=${actual6}`);
      expect(actual6).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchUriExtended0002 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_SKILL_URI_EXTENDED_0003
     * @tc.name      testSkillMatchUriExtended0003
     * @tc.desc      扩展：隐式 Want uri 路径加查询参数 "http://docs.openharmony.cn/index.html?from=home" 匹配 OpenLinkAbility
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSkillMatchUriExtended0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchUriExtended0003 begin');
      const want: Want = {
        action: 'ohos.want.action.viewData',
        uri: 'http://docs.openharmony.cn/index.html?from=home'
      };
      const observation: LinkObservation = await observeStart(want);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.topName=${observation.topName}`);
      expect(observation.topName).assertEqual('OpenLinkAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.uri=${observation.uri}`);
      expect(observation.uri).assertEqual('http://docs.openharmony.cn/index.html?from=home');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 observation.action=${observation.action}`);
      expect(observation.action).assertEqual('ohos.want.action.viewData');
      const actual5: string = JSON.stringify(observation.entities);
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('[]');
      const actual6: Object = observation.parameters['isDelegatorCall'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a6=${actual6}`);
      expect(actual6).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchUriExtended0003 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_SKILL_URI_EXTENDED_0004
     * @tc.name      testSkillMatchUriExtended0004
     * @tc.desc      扩展：隐式 Want uri 多查询参数 "http://docs.openharmony.cn/index.html?a=1&b=2&c=3" 匹配 OpenLinkAbility
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSkillMatchUriExtended0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchUriExtended0004 begin');
      const want: Want = {
        action: 'ohos.want.action.viewData',
        uri: 'http://docs.openharmony.cn/index.html?a=1&b=2&c=3'
      };
      const observation: LinkObservation = await observeStart(want);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.topName=${observation.topName}`);
      expect(observation.topName).assertEqual('OpenLinkAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.uri=${observation.uri}`);
      expect(observation.uri).assertEqual('http://docs.openharmony.cn/index.html?a=1&b=2&c=3');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 observation.action=${observation.action}`);
      expect(observation.action).assertEqual('ohos.want.action.viewData');
      const actual5: string = JSON.stringify(observation.entities);
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('[]');
      const actual6: Object = observation.parameters['isDelegatorCall'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a6=${actual6}`);
      expect(actual6).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchUriExtended0004 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_SKILL_URI_EXTENDED_0005
     * @tc.name      testSkillMatchUriExtended0005
     * @tc.desc      扩展：隐式 Want uri 路径带 fragment "http://docs.openharmony.cn/pages#section" 匹配 OpenLinkAbility
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSkillMatchUriExtended0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchUriExtended0005 begin');
      const want: Want = {
        action: 'ohos.want.action.viewData',
        uri: 'http://docs.openharmony.cn/pages#section'
      };
      const observation: LinkObservation = await observeStart(want);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.topName=${observation.topName}`);
      expect(observation.topName).assertEqual('OpenLinkAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.uri=${observation.uri}`);
      expect(observation.uri).assertEqual('http://docs.openharmony.cn/pages#section');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 observation.action=${observation.action}`);
      expect(observation.action).assertEqual('ohos.want.action.viewData');
      const actual5: string = JSON.stringify(observation.entities);
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('[]');
      const actual6: Object = observation.parameters['isDelegatorCall'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a6=${actual6}`);
      expect(actual6).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchUriExtended0005 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_SKILL_URI_EXTENDED_0006
     * @tc.name      testSkillMatchUriExtended0006
     * @tc.desc      扩展：隐式 Want uri txt 文件路径 "http://docs.openharmony.cn/path/to/file.txt" 匹配 OpenLinkAbility
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSkillMatchUriExtended0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchUriExtended0006 begin');
      const want: Want = {
        action: 'ohos.want.action.viewData',
        uri: 'http://docs.openharmony.cn/path/to/file.txt'
      };
      const observation: LinkObservation = await observeStart(want);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.topName=${observation.topName}`);
      expect(observation.topName).assertEqual('OpenLinkAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.uri=${observation.uri}`);
      expect(observation.uri).assertEqual('http://docs.openharmony.cn/path/to/file.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 observation.action=${observation.action}`);
      expect(observation.action).assertEqual('ohos.want.action.viewData');
      const actual5: string = JSON.stringify(observation.entities);
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('[]');
      const actual6: Object = observation.parameters['isDelegatorCall'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a6=${actual6}`);
      expect(actual6).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchUriExtended0006 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_SKILL_URI_EXTENDED_0007
     * @tc.name      testSkillMatchUriExtended0007
     * @tc.desc      扩展：隐式 Want uri 大写路径 "http://docs.openharmony.cn/UPPERCASE" 匹配 OpenLinkAbility
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSkillMatchUriExtended0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchUriExtended0007 begin');
      const want: Want = {
        action: 'ohos.want.action.viewData',
        uri: 'http://docs.openharmony.cn/UPPERCASE'
      };
      const observation: LinkObservation = await observeStart(want);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.topName=${observation.topName}`);
      expect(observation.topName).assertEqual('OpenLinkAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.uri=${observation.uri}`);
      expect(observation.uri).assertEqual('http://docs.openharmony.cn/UPPERCASE');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 observation.action=${observation.action}`);
      expect(observation.action).assertEqual('ohos.want.action.viewData');
      const actual5: string = JSON.stringify(observation.entities);
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('[]');
      const actual6: Object = observation.parameters['isDelegatorCall'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a6=${actual6}`);
      expect(actual6).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchUriExtended0007 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_SKILL_URI_EXTENDED_0008
     * @tc.name      testSkillMatchUriExtended0008
     * @tc.desc      扩展：隐式 Want uri 大小写混合路径 "http://docs.openharmony.cn/mixed/CaSe" 匹配 OpenLinkAbility
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSkillMatchUriExtended0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchUriExtended0008 begin');
      const want: Want = {
        action: 'ohos.want.action.viewData',
        uri: 'http://docs.openharmony.cn/mixed/CaSe'
      };
      const observation: LinkObservation = await observeStart(want);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.topName=${observation.topName}`);
      expect(observation.topName).assertEqual('OpenLinkAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.uri=${observation.uri}`);
      expect(observation.uri).assertEqual('http://docs.openharmony.cn/mixed/CaSe');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 observation.action=${observation.action}`);
      expect(observation.action).assertEqual('ohos.want.action.viewData');
      const actual5: string = JSON.stringify(observation.entities);
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('[]');
      const actual6: Object = observation.parameters['isDelegatorCall'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a6=${actual6}`);
      expect(actual6).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchUriExtended0008 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_SKILL_URI_EXTENDED_0009
     * @tc.name      testSkillMatchUriExtended0009
     * @tc.desc      扩展：隐式 Want uri 显式 80 端口加路径 "http://docs.openharmony.cn:80/pages" 匹配 OpenLinkAbility
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testSkillMatchUriExtended0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchUriExtended0009 begin');
      const want: Want = {
        action: 'ohos.want.action.viewData',
        uri: 'http://docs.openharmony.cn:80/pages'
      };
      const observation: LinkObservation = await observeStart(want);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.topName=${observation.topName}`);
      expect(observation.topName).assertEqual('OpenLinkAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.uri=${observation.uri}`);
      expect(observation.uri).assertEqual('http://docs.openharmony.cn:80/pages');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 observation.action=${observation.action}`);
      expect(observation.action).assertEqual('ohos.want.action.viewData');
      const actual5: string = JSON.stringify(observation.entities);
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('[]');
      const actual6: Object = observation.parameters['isDelegatorCall'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a6=${actual6}`);
      expect(actual6).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchUriExtended0009 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_SKILL_URI_EXTENDED_0010
     * @tc.name      testSkillMatchUriExtended0010
     * @tc.desc      扩展：隐式 Want uri 非默认端口加多级路径 "http://docs.openharmony.cn:8080/x/y" 匹配 OpenLinkAbility
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testSkillMatchUriExtended0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchUriExtended0010 begin');
      const want: Want = {
        action: 'ohos.want.action.viewData',
        uri: 'http://docs.openharmony.cn:8080/x/y'
      };
      const observation: LinkObservation = await observeStart(want);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.topName=${observation.topName}`);
      expect(observation.topName).assertEqual('OpenLinkAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.uri=${observation.uri}`);
      expect(observation.uri).assertEqual('http://docs.openharmony.cn:8080/x/y');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 observation.action=${observation.action}`);
      expect(observation.action).assertEqual('ohos.want.action.viewData');
      const actual5: string = JSON.stringify(observation.entities);
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('[]');
      const actual6: Object = observation.parameters['isDelegatorCall'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a6=${actual6}`);
      expect(actual6).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchUriExtended0010 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_SKILL_URI_EXTENDED_0011
     * @tc.name      testSkillMatchUriExtended0011
     * @tc.desc      扩展：隐式 Want uri 编码空格路径 "http://docs.openharmony.cn/a%20b/c" 匹配 OpenLinkAbility
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testSkillMatchUriExtended0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchUriExtended0011 begin');
      const want: Want = {
        action: 'ohos.want.action.viewData',
        uri: 'http://docs.openharmony.cn/a%20b/c'
      };
      const observation: LinkObservation = await observeStart(want);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.topName=${observation.topName}`);
      expect(observation.topName).assertEqual('OpenLinkAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.uri=${observation.uri}`);
      expect(observation.uri).assertEqual('http://docs.openharmony.cn/a%20b/c');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 observation.action=${observation.action}`);
      expect(observation.action).assertEqual('ohos.want.action.viewData');
      const actual5: string = JSON.stringify(observation.entities);
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('[]');
      const actual6: Object = observation.parameters['isDelegatorCall'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a6=${actual6}`);
      expect(actual6).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchUriExtended0011 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_SKILL_URI_EXTENDED_0012
     * @tc.name      testSkillMatchUriExtended0012
     * @tc.desc      扩展：隐式 Want uri 编码斜杠路径 "http://docs.openharmony.cn/path%2Fencoded" 匹配 OpenLinkAbility
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testSkillMatchUriExtended0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchUriExtended0012 begin');
      const want: Want = {
        action: 'ohos.want.action.viewData',
        uri: 'http://docs.openharmony.cn/path%2Fencoded'
      };
      const observation: LinkObservation = await observeStart(want);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.topName=${observation.topName}`);
      expect(observation.topName).assertEqual('OpenLinkAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.uri=${observation.uri}`);
      expect(observation.uri).assertEqual('http://docs.openharmony.cn/path%2Fencoded');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 observation.action=${observation.action}`);
      expect(observation.action).assertEqual('ohos.want.action.viewData');
      const actual5: string = JSON.stringify(observation.entities);
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('[]');
      const actual6: Object = observation.parameters['isDelegatorCall'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a6=${actual6}`);
      expect(actual6).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchUriExtended0012 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_SKILL_URI_EXTENDED_0013
     * @tc.name      testSkillMatchUriExtended0013
     * @tc.desc      扩展：隐式 Want uri 纯数字多级路径 "http://docs.openharmony.cn/123/456" 匹配 OpenLinkAbility
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testSkillMatchUriExtended0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchUriExtended0013 begin');
      const want: Want = {
        action: 'ohos.want.action.viewData',
        uri: 'http://docs.openharmony.cn/123/456'
      };
      const observation: LinkObservation = await observeStart(want);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.topName=${observation.topName}`);
      expect(observation.topName).assertEqual('OpenLinkAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.uri=${observation.uri}`);
      expect(observation.uri).assertEqual('http://docs.openharmony.cn/123/456');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 observation.action=${observation.action}`);
      expect(observation.action).assertEqual('ohos.want.action.viewData');
      const actual5: string = JSON.stringify(observation.entities);
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('[]');
      const actual6: Object = observation.parameters['isDelegatorCall'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a6=${actual6}`);
      expect(actual6).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchUriExtended0013 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_SKILL_URI_EXTENDED_0014
     * @tc.name      testSkillMatchUriExtended0014
     * @tc.desc      扩展：隐式 Want uri 六级深度路径 "http://docs.openharmony.cn/deep/a/b/c/d/e" 匹配 OpenLinkAbility
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testSkillMatchUriExtended0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchUriExtended0014 begin');
      const want: Want = {
        action: 'ohos.want.action.viewData',
        uri: 'http://docs.openharmony.cn/deep/a/b/c/d/e'
      };
      const observation: LinkObservation = await observeStart(want);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.topName=${observation.topName}`);
      expect(observation.topName).assertEqual('OpenLinkAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.uri=${observation.uri}`);
      expect(observation.uri).assertEqual('http://docs.openharmony.cn/deep/a/b/c/d/e');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 observation.action=${observation.action}`);
      expect(observation.action).assertEqual('ohos.want.action.viewData');
      const actual5: string = JSON.stringify(observation.entities);
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('[]');
      const actual6: Object = observation.parameters['isDelegatorCall'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a6=${actual6}`);
      expect(actual6).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchUriExtended0014 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_SKILL_URI_EXTENDED_0015
     * @tc.name      testSkillMatchUriExtended0015
     * @tc.desc      扩展：隐式 Want uri 点路径 "http://docs.openharmony.cn/pages/." 匹配 OpenLinkAbility
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testSkillMatchUriExtended0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchUriExtended0015 begin');
      const want: Want = {
        action: 'ohos.want.action.viewData',
        uri: 'http://docs.openharmony.cn/pages/.'
      };
      const observation: LinkObservation = await observeStart(want);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.topName=${observation.topName}`);
      expect(observation.topName).assertEqual('OpenLinkAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.uri=${observation.uri}`);
      expect(observation.uri).assertEqual('http://docs.openharmony.cn/pages/.');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 observation.action=${observation.action}`);
      expect(observation.action).assertEqual('ohos.want.action.viewData');
      const actual5: string = JSON.stringify(observation.entities);
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('[]');
      const actual6: Object = observation.parameters['isDelegatorCall'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a6=${actual6}`);
      expect(actual6).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchUriExtended0015 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_SKILL_URI_EXTENDED_0016
     * @tc.name      testSkillMatchUriExtended0016
     * @tc.desc      扩展：隐式 Want uri 双点路径 "http://docs.openharmony.cn/pages/.." 匹配 OpenLinkAbility
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testSkillMatchUriExtended0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchUriExtended0016 begin');
      const want: Want = {
        action: 'ohos.want.action.viewData',
        uri: 'http://docs.openharmony.cn/pages/..'
      };
      const observation: LinkObservation = await observeStart(want);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.topName=${observation.topName}`);
      expect(observation.topName).assertEqual('OpenLinkAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.uri=${observation.uri}`);
      expect(observation.uri).assertEqual('http://docs.openharmony.cn/pages/..');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 observation.action=${observation.action}`);
      expect(observation.action).assertEqual('ohos.want.action.viewData');
      const actual5: string = JSON.stringify(observation.entities);
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('[]');
      const actual6: Object = observation.parameters['isDelegatorCall'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a6=${actual6}`);
      expect(actual6).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchUriExtended0016 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_SKILL_URI_EXTENDED_0017
     * @tc.name      testSkillMatchUriExtended0017
     * @tc.desc      扩展：隐式 Want uri 无路径只带 query "http://docs.openharmony.cn?x=1" 匹配 OpenLinkAbility
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testSkillMatchUriExtended0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchUriExtended0017 begin');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchUriExtended0017 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_SKILL_URI_EXTENDED_0018
     * @tc.name      testSkillMatchUriExtended0018
     * @tc.desc      扩展：隐式 Want uri 空 query fragment "http://docs.openharmony.cn/?#" 匹配 OpenLinkAbility
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testSkillMatchUriExtended0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchUriExtended0018 begin');
      const want: Want = {
        action: 'ohos.want.action.viewData',
        uri: 'http://docs.openharmony.cn/?#'
      };
      const observation: LinkObservation = await observeStart(want);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.topName=${observation.topName}`);
      expect(observation.topName).assertEqual('OpenLinkAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.uri=${observation.uri}`);
      expect(observation.uri).assertEqual('http://docs.openharmony.cn/?#');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 observation.action=${observation.action}`);
      expect(observation.action).assertEqual('ohos.want.action.viewData');
      const actual5: string = JSON.stringify(observation.entities);
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('[]');
      const actual6: Object = observation.parameters['isDelegatorCall'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a6=${actual6}`);
      expect(actual6).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchUriExtended0018 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_SKILL_URI_EXTENDED_0019
     * @tc.name      testSkillMatchUriExtended0019
     * @tc.desc      扩展：隐式 Want uri 空端口 "http://docs.openharmony.cn:/pages" 匹配 OpenLinkAbility
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testSkillMatchUriExtended0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchUriExtended0019 begin');
      const want: Want = {
        action: 'ohos.want.action.viewData',
        uri: 'http://docs.openharmony.cn:/pages'
      };
      const observation: LinkObservation = await observeStart(want);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.topName=${observation.topName}`);
      expect(observation.topName).assertEqual('OpenLinkAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.uri=${observation.uri}`);
      expect(observation.uri).assertEqual('http://docs.openharmony.cn:/pages');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 observation.action=${observation.action}`);
      expect(observation.action).assertEqual('ohos.want.action.viewData');
      const actual5: string = JSON.stringify(observation.entities);
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('[]');
      const actual6: Object = observation.parameters['isDelegatorCall'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a6=${actual6}`);
      expect(actual6).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchUriExtended0019 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_SKILL_URI_EXTENDED_0020
     * @tc.name      testSkillMatchUriExtended0020
     * @tc.desc      扩展：隐式 Want uri query 后空 fragment "http://docs.openharmony.cn/pages?#frag" 匹配 OpenLinkAbility
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testSkillMatchUriExtended0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchUriExtended0020 begin');
      const want: Want = {
        action: 'ohos.want.action.viewData',
        uri: 'http://docs.openharmony.cn/pages?#frag'
      };
      const observation: LinkObservation = await observeStart(want);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.topName=${observation.topName}`);
      expect(observation.topName).assertEqual('OpenLinkAbility');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 observation.uri=${observation.uri}`);
      expect(observation.uri).assertEqual('http://docs.openharmony.cn/pages?#frag');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 observation.action=${observation.action}`);
      expect(observation.action).assertEqual('ohos.want.action.viewData');
      const actual5: string = JSON.stringify(observation.entities);
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('[]');
      const actual6: Object = observation.parameters['isDelegatorCall'];
      hilog.info(DOMAIN, TAG, '%{public}s', `a6=${actual6}`);
      expect(actual6).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchUriExtended0020 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_SKILL_URI_EXTENDED_0021
     * @tc.name      testSkillMatchUriExtended0021
     * @tc.desc      扩展：隐式 Want uri 双斜杠路径 "http://docs.openharmony.cn//double" 匹配 OpenLinkAbility
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testSkillMatchUriExtended0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchUriExtended0021 begin');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchUriExtended0021 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_SKILL_URI_EXTENDED_0022
     * @tc.name      testSkillMatchUriExtended0022
     * @tc.desc      扩展：隐式 Want uri https 加路径 "https://docs.openharmony.cn/pages" 无匹配，返回 16000019
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSkillMatchUriExtended0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchUriExtended0022 begin');
      const want: Want = {
        action: 'ohos.want.action.viewData',
        uri: 'https://docs.openharmony.cn/pages'
      };
      const observation: LinkObservation = await observeStart(want);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(16000019);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.dialogShown=${observation.dialogShown}`);
      expect(observation.dialogShown).assertTrue();
      const actual3: boolean = observation.topName === 'OpenLinkAbility';
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 observation.message=${observation.message}`);
      expect(observation.message).assertEqual('startAbility failed.');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchUriExtended0022 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_SKILL_URI_EXTENDED_0023
     * @tc.name      testSkillMatchUriExtended0023
     * @tc.desc      扩展：隐式 Want uri 不同子域加路径 "http://www.openharmony.cn/pages" 无匹配，返回 16000019
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSkillMatchUriExtended0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchUriExtended0023 begin');
      const want: Want = {
        action: 'ohos.want.action.viewData',
        uri: 'http://www.openharmony.cn/pages'
      };
      const observation: LinkObservation = await observeStart(want);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(16000019);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.dialogShown=${observation.dialogShown}`);
      expect(observation.dialogShown).assertTrue();
      const actual3: boolean = observation.topName === 'OpenLinkAbility';
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 observation.message=${observation.message}`);
      expect(observation.message).assertEqual('startAbility failed.');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchUriExtended0023 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_SKILL_URI_EXTENDED_0024
     * @tc.name      testSkillMatchUriExtended0024
     * @tc.desc      扩展：隐式 Want uri 不同顶级域加路径 "http://docs.openharmony.com/pages" 无匹配，返回 16000019
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSkillMatchUriExtended0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchUriExtended0024 begin');
      const want: Want = {
        action: 'ohos.want.action.viewData',
        uri: 'http://docs.openharmony.com/pages'
      };
      const observation: LinkObservation = await observeStart(want);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(16000019);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.dialogShown=${observation.dialogShown}`);
      expect(observation.dialogShown).assertTrue();
      const actual3: boolean = observation.topName === 'OpenLinkAbility';
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 observation.message=${observation.message}`);
      expect(observation.message).assertEqual('startAbility failed.');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchUriExtended0024 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_SKILL_URI_EXTENDED_0025
     * @tc.name      testSkillMatchUriExtended0025
     * @tc.desc      扩展：隐式 Want uri 少一级子域加路径 "http://openharmony.cn/pages" 无匹配，返回 16000019
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSkillMatchUriExtended0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchUriExtended0025 begin');
      const want: Want = {
        action: 'ohos.want.action.viewData',
        uri: 'http://openharmony.cn/pages'
      };
      const observation: LinkObservation = await observeStart(want);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(16000019);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.dialogShown=${observation.dialogShown}`);
      expect(observation.dialogShown).assertTrue();
      const actual3: boolean = observation.topName === 'OpenLinkAbility';
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 observation.message=${observation.message}`);
      expect(observation.message).assertEqual('startAbility failed.');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchUriExtended0025 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_SKILL_URI_EXTENDED_0026
     * @tc.name      testSkillMatchUriExtended0026
     * @tc.desc      扩展：隐式 Want uri 域名前缀拼接 "http://docs.openharmony.cn.evil.com/pages" 无匹配，返回 16000019
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSkillMatchUriExtended0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchUriExtended0026 begin');
      const want: Want = {
        action: 'ohos.want.action.viewData',
        uri: 'http://docs.openharmony.cn.evil.com/pages'
      };
      const observation: LinkObservation = await observeStart(want);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(16000019);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.dialogShown=${observation.dialogShown}`);
      expect(observation.dialogShown).assertTrue();
      const actual3: boolean = observation.topName === 'OpenLinkAbility';
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 observation.message=${observation.message}`);
      expect(observation.message).assertEqual('startAbility failed.');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchUriExtended0026 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_SKILL_URI_EXTENDED_0027
     * @tc.name      testSkillMatchUriExtended0027
     * @tc.desc      扩展：隐式 Want uri 连字符替代点 "http://docs-openharmony.cn/pages" 无匹配，返回 16000019
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSkillMatchUriExtended0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchUriExtended0027 begin');
      const want: Want = {
        action: 'ohos.want.action.viewData',
        uri: 'http://docs-openharmony.cn/pages'
      };
      const observation: LinkObservation = await observeStart(want);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(16000019);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.dialogShown=${observation.dialogShown}`);
      expect(observation.dialogShown).assertTrue();
      const actual3: boolean = observation.topName === 'OpenLinkAbility';
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 observation.message=${observation.message}`);
      expect(observation.message).assertEqual('startAbility failed.');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchUriExtended0027 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_SKILL_URI_EXTENDED_0028
     * @tc.name      testSkillMatchUriExtended0028
     * @tc.desc      扩展：隐式 Want uri file scheme "file:///data/storage/el2/base/files" 无匹配，返回 16000019
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSkillMatchUriExtended0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchUriExtended0028 begin');
      const want: Want = {
        action: 'ohos.want.action.viewData',
        uri: 'file:///data/storage/el2/base/files'
      };
      const observation: LinkObservation = await observeStart(want);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(16000019);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.dialogShown=${observation.dialogShown}`);
      expect(observation.dialogShown).assertTrue();
      const actual3: boolean = observation.topName === 'OpenLinkAbility';
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 observation.message=${observation.message}`);
      expect(observation.message).assertEqual('startAbility failed.');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchUriExtended0028 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_SKILL_URI_EXTENDED_0029
     * @tc.name      testSkillMatchUriExtended0029
     * @tc.desc      扩展：隐式 Want uri mailto "mailto:a@docs.openharmony.cn" 无匹配，返回 16000019
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSkillMatchUriExtended0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchUriExtended0029 begin');
      const want: Want = {
        action: 'ohos.want.action.viewData',
        uri: 'mailto:a@docs.openharmony.cn'
      };
      const observation: LinkObservation = await observeStart(want);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(16000019);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.dialogShown=${observation.dialogShown}`);
      expect(observation.dialogShown).assertTrue();
      const actual3: boolean = observation.topName === 'OpenLinkAbility';
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 observation.message=${observation.message}`);
      expect(observation.message).assertEqual('startAbility failed.');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchUriExtended0029 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_SKILL_URI_EXTENDED_0030
     * @tc.name      testSkillMatchUriExtended0030
     * @tc.desc      扩展：隐式 Want uri tel "tel:10086" 无匹配，返回 16000019
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSkillMatchUriExtended0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchUriExtended0030 begin');
      const want: Want = {
        action: 'ohos.want.action.viewData',
        uri: 'tel:10086'
      };
      const observation: LinkObservation = await observeStart(want);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(16000019);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.dialogShown=${observation.dialogShown}`);
      expect(observation.dialogShown).assertTrue();
      const actual3: boolean = observation.topName === 'OpenLinkAbility';
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 observation.message=${observation.message}`);
      expect(observation.message).assertEqual('startAbility failed.');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchUriExtended0030 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_SKILL_URI_EXTENDED_0031
     * @tc.name      testSkillMatchUriExtended0031
     * @tc.desc      扩展：隐式 Want uri 自定义 scheme "myapp://docs.openharmony.cn/pages" 无匹配，返回 16000019
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testSkillMatchUriExtended0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchUriExtended0031 begin');
      const want: Want = {
        action: 'ohos.want.action.viewData',
        uri: 'myapp://docs.openharmony.cn/pages'
      };
      const observation: LinkObservation = await observeStart(want);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(16000019);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.dialogShown=${observation.dialogShown}`);
      expect(observation.dialogShown).assertTrue();
      const actual3: boolean = observation.topName === 'OpenLinkAbility';
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 observation.message=${observation.message}`);
      expect(observation.message).assertEqual('startAbility failed.');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchUriExtended0031 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_SKILL_URI_EXTENDED_0032
     * @tc.name      testSkillMatchUriExtended0032
     * @tc.desc      扩展：隐式 Want uri IP 地址 "http://127.0.0.1/pages" 无匹配，返回 16000019
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testSkillMatchUriExtended0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchUriExtended0032 begin');
      const want: Want = {
        action: 'ohos.want.action.viewData',
        uri: 'http://127.0.0.1/pages'
      };
      const observation: LinkObservation = await observeStart(want);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(16000019);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.dialogShown=${observation.dialogShown}`);
      expect(observation.dialogShown).assertTrue();
      const actual3: boolean = observation.topName === 'OpenLinkAbility';
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 observation.message=${observation.message}`);
      expect(observation.message).assertEqual('startAbility failed.');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchUriExtended0032 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_SKILL_URI_EXTENDED_0033
     * @tc.name      testSkillMatchUriExtended0033
     * @tc.desc      扩展：隐式 Want uri localhost "http://localhost/pages" 无匹配，返回 16000019
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testSkillMatchUriExtended0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchUriExtended0033 begin');
      const want: Want = {
        action: 'ohos.want.action.viewData',
        uri: 'http://localhost/pages'
      };
      const observation: LinkObservation = await observeStart(want);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(16000019);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.dialogShown=${observation.dialogShown}`);
      expect(observation.dialogShown).assertTrue();
      const actual3: boolean = observation.topName === 'OpenLinkAbility';
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 observation.message=${observation.message}`);
      expect(observation.message).assertEqual('startAbility failed.');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchUriExtended0033 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_SKILL_URI_EXTENDED_0034
     * @tc.name      testSkillMatchUriExtended0034
     * @tc.desc      扩展：隐式 Want uri 末尾带点 "http://docs.openharmony.cn." 无匹配，返回 16000019
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testSkillMatchUriExtended0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchUriExtended0034 begin');
      const want: Want = {
        action: 'ohos.want.action.viewData',
        uri: 'http://docs.openharmony.cn.'
      };
      const observation: LinkObservation = await observeStart(want);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(16000019);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.dialogShown=${observation.dialogShown}`);
      expect(observation.dialogShown).assertTrue();
      const actual3: boolean = observation.topName === 'OpenLinkAbility';
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 observation.message=${observation.message}`);
      expect(observation.message).assertEqual('startAbility failed.');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchUriExtended0034 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_SKILL_URI_EXTENDED_0035
     * @tc.name      testSkillMatchUriExtended0035
     * @tc.desc      扩展：隐式 Want uri 缺顶级域 "http://docs.openharmony" 无匹配，返回 16000019
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testSkillMatchUriExtended0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchUriExtended0035 begin');
      const want: Want = {
        action: 'ohos.want.action.viewData',
        uri: 'http://docs.openharmony'
      };
      const observation: LinkObservation = await observeStart(want);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(16000019);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.dialogShown=${observation.dialogShown}`);
      expect(observation.dialogShown).assertTrue();
      const actual3: boolean = observation.topName === 'OpenLinkAbility';
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 observation.message=${observation.message}`);
      expect(observation.message).assertEqual('startAbility failed.');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchUriExtended0035 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_SKILL_URI_EXTENDED_0036
     * @tc.name      testSkillMatchUriExtended0036
     * @tc.desc      扩展：隐式 Want uri 缺 scheme "docs.openharmony.cn/pages" 无匹配，返回 16000019
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testSkillMatchUriExtended0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchUriExtended0036 begin');
      const want: Want = {
        action: 'ohos.want.action.viewData',
        uri: 'docs.openharmony.cn/pages'
      };
      const observation: LinkObservation = await observeStart(want);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(16000019);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.dialogShown=${observation.dialogShown}`);
      expect(observation.dialogShown).assertTrue();
      const actual3: boolean = observation.topName === 'OpenLinkAbility';
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 observation.message=${observation.message}`);
      expect(observation.message).assertEqual('startAbility failed.');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchUriExtended0036 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_SKILL_URI_EXTENDED_0037
     * @tc.name      testSkillMatchUriExtended0037
     * @tc.desc      扩展：隐式 Want uri 空 host "http:///pages" 无匹配，返回 16000019
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testSkillMatchUriExtended0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchUriExtended0037 begin');
      const want: Want = {
        action: 'ohos.want.action.viewData',
        uri: 'http:///pages'
      };
      const observation: LinkObservation = await observeStart(want);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(16000019);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.dialogShown=${observation.dialogShown}`);
      expect(observation.dialogShown).assertTrue();
      const actual3: boolean = observation.topName === 'OpenLinkAbility';
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 observation.message=${observation.message}`);
      expect(observation.message).assertEqual('startAbility failed.');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchUriExtended0037 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_SKILL_URI_EXTENDED_0038
     * @tc.name      testSkillMatchUriExtended0038
     * @tc.desc      扩展：隐式 Want uri 无路径只带 fragment "http://docs.openharmony.cn#f" 无匹配，返回 16000019
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testSkillMatchUriExtended0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchUriExtended0038 begin');
      const want: Want = {
        action: 'ohos.want.action.viewData',
        uri: 'http://docs.openharmony.cn#f'
      };
      const observation: LinkObservation = await observeStart(want);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(16000019);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.dialogShown=${observation.dialogShown}`);
      expect(observation.dialogShown).assertTrue();
      const actual3: boolean = observation.topName === 'OpenLinkAbility';
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 observation.message=${observation.message}`);
      expect(observation.message).assertEqual('startAbility failed.');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchUriExtended0038 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_SKILL_URI_EXTENDED_0039
     * @tc.name      testSkillMatchUriExtended0039
     * @tc.desc      扩展：隐式 Want uri ws scheme "ws://docs.openharmony.cn/pages" 无匹配，返回 16000019
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testSkillMatchUriExtended0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchUriExtended0039 begin');
      const want: Want = {
        action: 'ohos.want.action.viewData',
        uri: 'ws://docs.openharmony.cn/pages'
      };
      const observation: LinkObservation = await observeStart(want);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(16000019);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.dialogShown=${observation.dialogShown}`);
      expect(observation.dialogShown).assertTrue();
      const actual3: boolean = observation.topName === 'OpenLinkAbility';
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 observation.message=${observation.message}`);
      expect(observation.message).assertEqual('startAbility failed.');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchUriExtended0039 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_SKILL_URI_EXTENDED_0040
     * @tc.name      testSkillMatchUriExtended0040
     * @tc.desc      扩展：隐式 Want uri https 默认端口 "https://docs.openharmony.cn:443/pages" 无匹配，返回 16000019
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testSkillMatchUriExtended0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchUriExtended0040 begin');
      const want: Want = {
        action: 'ohos.want.action.viewData',
        uri: 'https://docs.openharmony.cn:443/pages'
      };
      const observation: LinkObservation = await observeStart(want);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(16000019);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.dialogShown=${observation.dialogShown}`);
      expect(observation.dialogShown).assertTrue();
      const actual3: boolean = observation.topName === 'OpenLinkAbility';
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 observation.message=${observation.message}`);
      expect(observation.message).assertEqual('startAbility failed.');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchUriExtended0040 end');
    })

    /**
     * @tc.number    SUB_UNIVERSAL_LINK_SKILL_URI_EXTENDED_0041
     * @tc.name      testSkillMatchUriExtended0041
     * @tc.desc      扩展：隐式 Want uri 大写不同顶级域 "http://DOCS.OPENHARMONY.COM/pages" 无匹配，返回 16000019
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testSkillMatchUriExtended0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchUriExtended0041 begin');
      const want: Want = {
        action: 'ohos.want.action.viewData',
        uri: 'http://DOCS.OPENHARMONY.COM/pages'
      };
      const observation: LinkObservation = await observeStart(want);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 observation.code=${observation.code}`);
      expect(observation.code).assertEqual(16000019);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 observation.dialogShown=${observation.dialogShown}`);
      expect(observation.dialogShown).assertTrue();
      const actual3: boolean = observation.topName === 'OpenLinkAbility';
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 observation.message=${observation.message}`);
      expect(observation.message).assertEqual('startAbility failed.');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSkillMatchUriExtended0041 end');
    })
  })
}
