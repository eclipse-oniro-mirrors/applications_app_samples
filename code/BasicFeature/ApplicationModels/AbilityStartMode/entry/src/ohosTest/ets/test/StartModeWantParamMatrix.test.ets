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

import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { Want } from '@kit.AbilityKit';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_StartMode]';

export default function startModeWantParamMatrixTest(): void {
  describe('StartModeWantParamMatrixTest', () => {
    /**
     * @tc.number    SUB_START_MODE_WANT_PARAM_0001
     * @tc.name      startModeWantParamMatrix0001
     * @tc.desc      启动 MainAbility 的 Want 携带 instanceKey 参数可回读
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('startModeWantParamMatrix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'startModeWantParamMatrix0001 begin');
      const wantBundle: string = 'ohos.samples.startmode';
      const wantAbility: string = 'MainAbility';
      const wantAction: string = 'ohos.want.action.viewData';
      const params: Record<string, Object> = {};
      params['instanceKey'] = 'instance-001';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        parameters: params
      };
      const bundleRead: string = want.bundleName ?? '';
      const abilityRead: string = want.abilityName ?? '';
      const paramsRead: Record<string, Object> = want.parameters as Record<string, Object>;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 bundleRead=${bundleRead}`);
      expect(bundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 abilityRead=${abilityRead}`);
      expect(abilityRead).assertEqual(wantAbility);
      const actual3: number = Object.keys(paramsRead).length;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(1);
      const paramRead: string = paramsRead['instanceKey'] as string;
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 paramRead=${paramRead}`);
      expect(paramRead).assertEqual('instance-001');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'startModeWantParamMatrix0001 end');
    })

    /**
     * @tc.number    SUB_START_MODE_WANT_PARAM_0002
     * @tc.name      startModeWantParamMatrix0002
     * @tc.desc      启动 MainAbility 的 Want 携带 launchMode 参数可回读
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('startModeWantParamMatrix0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'startModeWantParamMatrix0002 begin');
      const wantBundle: string = 'ohos.samples.startmode';
      const wantAbility: string = 'MainAbility';
      const wantAction: string = 'ohos.want.action.sendData';
      const params: Record<string, Object> = {};
      params['launchMode'] = 'specified';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        parameters: params
      };
      const bundleRead: string = want.bundleName ?? '';
      const abilityRead: string = want.abilityName ?? '';
      const paramsRead: Record<string, Object> = want.parameters as Record<string, Object>;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 bundleRead=${bundleRead}`);
      expect(bundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 abilityRead=${abilityRead}`);
      expect(abilityRead).assertEqual(wantAbility);
      const actual3: number = Object.keys(paramsRead).length;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(1);
      const paramRead: string = paramsRead['launchMode'] as string;
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 paramRead=${paramRead}`);
      expect(paramRead).assertEqual('specified');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'startModeWantParamMatrix0002 end');
    })

    /**
     * @tc.number    SUB_START_MODE_WANT_PARAM_0003
     * @tc.name      startModeWantParamMatrix0003
     * @tc.desc      启动 MainAbility 的 Want 携带 foodId 参数可回读
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('startModeWantParamMatrix0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'startModeWantParamMatrix0003 begin');
      const wantBundle: string = 'ohos.samples.startmode';
      const wantAbility: string = 'MainAbility';
      const wantAction: string = 'action.system.home';
      const params: Record<string, Object> = {};
      params['foodId'] = '1001';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        parameters: params
      };
      const bundleRead: string = want.bundleName ?? '';
      const abilityRead: string = want.abilityName ?? '';
      const paramsRead: Record<string, Object> = want.parameters as Record<string, Object>;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 bundleRead=${bundleRead}`);
      expect(bundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 abilityRead=${abilityRead}`);
      expect(abilityRead).assertEqual(wantAbility);
      const actual3: number = Object.keys(paramsRead).length;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(1);
      const paramRead: string = paramsRead['foodId'] as string;
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 paramRead=${paramRead}`);
      expect(paramRead).assertEqual('1001');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'startModeWantParamMatrix0003 end');
    })

    /**
     * @tc.number    SUB_START_MODE_WANT_PARAM_0004
     * @tc.name      startModeWantParamMatrix0004
     * @tc.desc      启动 MainAbility 的 Want 携带 categoryId 参数可回读
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('startModeWantParamMatrix0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'startModeWantParamMatrix0004 begin');
      const wantBundle: string = 'ohos.samples.startmode';
      const wantAbility: string = 'MainAbility';
      const wantAction: string = 'ohos.want.action.viewData';
      const params: Record<string, Object> = {};
      params['categoryId'] = 'vegetable';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        parameters: params
      };
      const bundleRead: string = want.bundleName ?? '';
      const abilityRead: string = want.abilityName ?? '';
      const paramsRead: Record<string, Object> = want.parameters as Record<string, Object>;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 bundleRead=${bundleRead}`);
      expect(bundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 abilityRead=${abilityRead}`);
      expect(abilityRead).assertEqual(wantAbility);
      const actual3: number = Object.keys(paramsRead).length;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(1);
      const paramRead: string = paramsRead['categoryId'] as string;
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 paramRead=${paramRead}`);
      expect(paramRead).assertEqual('vegetable');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'startModeWantParamMatrix0004 end');
    })

    /**
     * @tc.number    SUB_START_MODE_WANT_PARAM_0005
     * @tc.name      startModeWantParamMatrix0005
     * @tc.desc      启动 MainAbility 的 Want 携带 fromPage 参数可回读
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('startModeWantParamMatrix0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'startModeWantParamMatrix0005 begin');
      const wantBundle: string = 'ohos.samples.startmode';
      const wantAbility: string = 'MainAbility';
      const wantAction: string = '';
      const params: Record<string, Object> = {};
      params['fromPage'] = 'Home';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        parameters: params
      };
      const bundleRead: string = want.bundleName ?? '';
      const abilityRead: string = want.abilityName ?? '';
      const paramsRead: Record<string, Object> = want.parameters as Record<string, Object>;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 bundleRead=${bundleRead}`);
      expect(bundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 abilityRead=${abilityRead}`);
      expect(abilityRead).assertEqual(wantAbility);
      const actual3: number = Object.keys(paramsRead).length;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(1);
      const paramRead: string = paramsRead['fromPage'] as string;
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 paramRead=${paramRead}`);
      expect(paramRead).assertEqual('Home');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'startModeWantParamMatrix0005 end');
    })

    /**
     * @tc.number    SUB_START_MODE_WANT_PARAM_0006
     * @tc.name      startModeWantParamMatrix0006
     * @tc.desc      启动 StandardAbility 的 Want 携带 instanceKey 参数可回读
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('startModeWantParamMatrix0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'startModeWantParamMatrix0006 begin');
      const wantBundle: string = 'ohos.samples.startmode';
      const wantAbility: string = 'StandardAbility';
      const wantAction: string = 'ohos.want.action.viewData';
      const params: Record<string, Object> = {};
      params['instanceKey'] = 'instance-001';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        parameters: params
      };
      const bundleRead: string = want.bundleName ?? '';
      const abilityRead: string = want.abilityName ?? '';
      const paramsRead: Record<string, Object> = want.parameters as Record<string, Object>;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 bundleRead=${bundleRead}`);
      expect(bundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 abilityRead=${abilityRead}`);
      expect(abilityRead).assertEqual(wantAbility);
      const actual3: number = Object.keys(paramsRead).length;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(1);
      const paramRead: string = paramsRead['instanceKey'] as string;
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 paramRead=${paramRead}`);
      expect(paramRead).assertEqual('instance-001');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'startModeWantParamMatrix0006 end');
    })

    /**
     * @tc.number    SUB_START_MODE_WANT_PARAM_0007
     * @tc.name      startModeWantParamMatrix0007
     * @tc.desc      启动 StandardAbility 的 Want 携带 launchMode 参数可回读
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('startModeWantParamMatrix0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'startModeWantParamMatrix0007 begin');
      const wantBundle: string = 'ohos.samples.startmode';
      const wantAbility: string = 'StandardAbility';
      const wantAction: string = 'ohos.want.action.sendData';
      const params: Record<string, Object> = {};
      params['launchMode'] = 'specified';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        parameters: params
      };
      const bundleRead: string = want.bundleName ?? '';
      const abilityRead: string = want.abilityName ?? '';
      const paramsRead: Record<string, Object> = want.parameters as Record<string, Object>;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 bundleRead=${bundleRead}`);
      expect(bundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 abilityRead=${abilityRead}`);
      expect(abilityRead).assertEqual(wantAbility);
      const actual3: number = Object.keys(paramsRead).length;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(1);
      const paramRead: string = paramsRead['launchMode'] as string;
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 paramRead=${paramRead}`);
      expect(paramRead).assertEqual('specified');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'startModeWantParamMatrix0007 end');
    })

    /**
     * @tc.number    SUB_START_MODE_WANT_PARAM_0008
     * @tc.name      startModeWantParamMatrix0008
     * @tc.desc      启动 StandardAbility 的 Want 携带 foodId 参数可回读
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('startModeWantParamMatrix0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'startModeWantParamMatrix0008 begin');
      const wantBundle: string = 'ohos.samples.startmode';
      const wantAbility: string = 'StandardAbility';
      const wantAction: string = 'action.system.home';
      const params: Record<string, Object> = {};
      params['foodId'] = '1001';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        parameters: params
      };
      const bundleRead: string = want.bundleName ?? '';
      const abilityRead: string = want.abilityName ?? '';
      const paramsRead: Record<string, Object> = want.parameters as Record<string, Object>;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 bundleRead=${bundleRead}`);
      expect(bundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 abilityRead=${abilityRead}`);
      expect(abilityRead).assertEqual(wantAbility);
      const actual3: number = Object.keys(paramsRead).length;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(1);
      const paramRead: string = paramsRead['foodId'] as string;
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 paramRead=${paramRead}`);
      expect(paramRead).assertEqual('1001');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'startModeWantParamMatrix0008 end');
    })

    /**
     * @tc.number    SUB_START_MODE_WANT_PARAM_0009
     * @tc.name      startModeWantParamMatrix0009
     * @tc.desc      启动 StandardAbility 的 Want 携带 categoryId 参数可回读
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('startModeWantParamMatrix0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'startModeWantParamMatrix0009 begin');
      const wantBundle: string = 'ohos.samples.startmode';
      const wantAbility: string = 'StandardAbility';
      const wantAction: string = 'ohos.want.action.viewData';
      const params: Record<string, Object> = {};
      params['categoryId'] = 'vegetable';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        parameters: params
      };
      const bundleRead: string = want.bundleName ?? '';
      const abilityRead: string = want.abilityName ?? '';
      const paramsRead: Record<string, Object> = want.parameters as Record<string, Object>;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 bundleRead=${bundleRead}`);
      expect(bundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 abilityRead=${abilityRead}`);
      expect(abilityRead).assertEqual(wantAbility);
      const actual3: number = Object.keys(paramsRead).length;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(1);
      const paramRead: string = paramsRead['categoryId'] as string;
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 paramRead=${paramRead}`);
      expect(paramRead).assertEqual('vegetable');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'startModeWantParamMatrix0009 end');
    })

    /**
     * @tc.number    SUB_START_MODE_WANT_PARAM_0010
     * @tc.name      startModeWantParamMatrix0010
     * @tc.desc      启动 StandardAbility 的 Want 携带 fromPage 参数可回读
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('startModeWantParamMatrix0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'startModeWantParamMatrix0010 begin');
      const wantBundle: string = 'ohos.samples.startmode';
      const wantAbility: string = 'StandardAbility';
      const wantAction: string = '';
      const params: Record<string, Object> = {};
      params['fromPage'] = 'Home';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        parameters: params
      };
      const bundleRead: string = want.bundleName ?? '';
      const abilityRead: string = want.abilityName ?? '';
      const paramsRead: Record<string, Object> = want.parameters as Record<string, Object>;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 bundleRead=${bundleRead}`);
      expect(bundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 abilityRead=${abilityRead}`);
      expect(abilityRead).assertEqual(wantAbility);
      const actual3: number = Object.keys(paramsRead).length;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(1);
      const paramRead: string = paramsRead['fromPage'] as string;
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 paramRead=${paramRead}`);
      expect(paramRead).assertEqual('Home');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'startModeWantParamMatrix0010 end');
    })

    /**
     * @tc.number    SUB_START_MODE_WANT_PARAM_0011
     * @tc.name      startModeWantParamMatrix0011
     * @tc.desc      启动 SingletonAbility 的 Want 携带 instanceKey 参数可回读
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('startModeWantParamMatrix0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'startModeWantParamMatrix0011 begin');
      const wantBundle: string = 'ohos.samples.startmode';
      const wantAbility: string = 'SingletonAbility';
      const wantAction: string = 'ohos.want.action.viewData';
      const params: Record<string, Object> = {};
      params['instanceKey'] = 'instance-001';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        parameters: params
      };
      const bundleRead: string = want.bundleName ?? '';
      const abilityRead: string = want.abilityName ?? '';
      const paramsRead: Record<string, Object> = want.parameters as Record<string, Object>;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 bundleRead=${bundleRead}`);
      expect(bundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 abilityRead=${abilityRead}`);
      expect(abilityRead).assertEqual(wantAbility);
      const actual3: number = Object.keys(paramsRead).length;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(1);
      const paramRead: string = paramsRead['instanceKey'] as string;
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 paramRead=${paramRead}`);
      expect(paramRead).assertEqual('instance-001');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'startModeWantParamMatrix0011 end');
    })

    /**
     * @tc.number    SUB_START_MODE_WANT_PARAM_0012
     * @tc.name      startModeWantParamMatrix0012
     * @tc.desc      启动 SingletonAbility 的 Want 携带 launchMode 参数可回读
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('startModeWantParamMatrix0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'startModeWantParamMatrix0012 begin');
      const wantBundle: string = 'ohos.samples.startmode';
      const wantAbility: string = 'SingletonAbility';
      const wantAction: string = 'ohos.want.action.sendData';
      const params: Record<string, Object> = {};
      params['launchMode'] = 'specified';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        parameters: params
      };
      const bundleRead: string = want.bundleName ?? '';
      const abilityRead: string = want.abilityName ?? '';
      const paramsRead: Record<string, Object> = want.parameters as Record<string, Object>;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 bundleRead=${bundleRead}`);
      expect(bundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 abilityRead=${abilityRead}`);
      expect(abilityRead).assertEqual(wantAbility);
      const actual3: number = Object.keys(paramsRead).length;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(1);
      const paramRead: string = paramsRead['launchMode'] as string;
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 paramRead=${paramRead}`);
      expect(paramRead).assertEqual('specified');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'startModeWantParamMatrix0012 end');
    })

    /**
     * @tc.number    SUB_START_MODE_WANT_PARAM_0013
     * @tc.name      startModeWantParamMatrix0013
     * @tc.desc      启动 SingletonAbility 的 Want 携带 foodId 参数可回读
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('startModeWantParamMatrix0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'startModeWantParamMatrix0013 begin');
      const wantBundle: string = 'ohos.samples.startmode';
      const wantAbility: string = 'SingletonAbility';
      const wantAction: string = 'action.system.home';
      const params: Record<string, Object> = {};
      params['foodId'] = '1001';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        parameters: params
      };
      const bundleRead: string = want.bundleName ?? '';
      const abilityRead: string = want.abilityName ?? '';
      const paramsRead: Record<string, Object> = want.parameters as Record<string, Object>;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 bundleRead=${bundleRead}`);
      expect(bundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 abilityRead=${abilityRead}`);
      expect(abilityRead).assertEqual(wantAbility);
      const actual3: number = Object.keys(paramsRead).length;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(1);
      const paramRead: string = paramsRead['foodId'] as string;
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 paramRead=${paramRead}`);
      expect(paramRead).assertEqual('1001');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'startModeWantParamMatrix0013 end');
    })

    /**
     * @tc.number    SUB_START_MODE_WANT_PARAM_0014
     * @tc.name      startModeWantParamMatrix0014
     * @tc.desc      启动 SingletonAbility 的 Want 携带 categoryId 参数可回读
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('startModeWantParamMatrix0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'startModeWantParamMatrix0014 begin');
      const wantBundle: string = 'ohos.samples.startmode';
      const wantAbility: string = 'SingletonAbility';
      const wantAction: string = 'ohos.want.action.viewData';
      const params: Record<string, Object> = {};
      params['categoryId'] = 'vegetable';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        parameters: params
      };
      const bundleRead: string = want.bundleName ?? '';
      const abilityRead: string = want.abilityName ?? '';
      const paramsRead: Record<string, Object> = want.parameters as Record<string, Object>;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 bundleRead=${bundleRead}`);
      expect(bundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 abilityRead=${abilityRead}`);
      expect(abilityRead).assertEqual(wantAbility);
      const actual3: number = Object.keys(paramsRead).length;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(1);
      const paramRead: string = paramsRead['categoryId'] as string;
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 paramRead=${paramRead}`);
      expect(paramRead).assertEqual('vegetable');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'startModeWantParamMatrix0014 end');
    })

    /**
     * @tc.number    SUB_START_MODE_WANT_PARAM_0015
     * @tc.name      startModeWantParamMatrix0015
     * @tc.desc      启动 SingletonAbility 的 Want 携带 fromPage 参数可回读
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('startModeWantParamMatrix0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'startModeWantParamMatrix0015 begin');
      const wantBundle: string = 'ohos.samples.startmode';
      const wantAbility: string = 'SingletonAbility';
      const wantAction: string = '';
      const params: Record<string, Object> = {};
      params['fromPage'] = 'Home';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        parameters: params
      };
      const bundleRead: string = want.bundleName ?? '';
      const abilityRead: string = want.abilityName ?? '';
      const paramsRead: Record<string, Object> = want.parameters as Record<string, Object>;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 bundleRead=${bundleRead}`);
      expect(bundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 abilityRead=${abilityRead}`);
      expect(abilityRead).assertEqual(wantAbility);
      const actual3: number = Object.keys(paramsRead).length;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(1);
      const paramRead: string = paramsRead['fromPage'] as string;
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 paramRead=${paramRead}`);
      expect(paramRead).assertEqual('Home');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'startModeWantParamMatrix0015 end');
    })

    /**
     * @tc.number    SUB_START_MODE_WANT_PARAM_0016
     * @tc.name      startModeWantParamMatrix0016
     * @tc.desc      启动 SpecifiedAbility 的 Want 携带 instanceKey 参数可回读
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('startModeWantParamMatrix0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'startModeWantParamMatrix0016 begin');
      const wantBundle: string = 'ohos.samples.startmode';
      const wantAbility: string = 'SpecifiedAbility';
      const wantAction: string = 'ohos.want.action.viewData';
      const params: Record<string, Object> = {};
      params['instanceKey'] = 'instance-001';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        parameters: params
      };
      const bundleRead: string = want.bundleName ?? '';
      const abilityRead: string = want.abilityName ?? '';
      const paramsRead: Record<string, Object> = want.parameters as Record<string, Object>;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 bundleRead=${bundleRead}`);
      expect(bundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 abilityRead=${abilityRead}`);
      expect(abilityRead).assertEqual(wantAbility);
      const actual3: number = Object.keys(paramsRead).length;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(1);
      const paramRead: string = paramsRead['instanceKey'] as string;
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 paramRead=${paramRead}`);
      expect(paramRead).assertEqual('instance-001');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'startModeWantParamMatrix0016 end');
    })

    /**
     * @tc.number    SUB_START_MODE_WANT_PARAM_0017
     * @tc.name      startModeWantParamMatrix0017
     * @tc.desc      启动 SpecifiedAbility 的 Want 携带 launchMode 参数可回读
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('startModeWantParamMatrix0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'startModeWantParamMatrix0017 begin');
      const wantBundle: string = 'ohos.samples.startmode';
      const wantAbility: string = 'SpecifiedAbility';
      const wantAction: string = 'ohos.want.action.sendData';
      const params: Record<string, Object> = {};
      params['launchMode'] = 'specified';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        parameters: params
      };
      const bundleRead: string = want.bundleName ?? '';
      const abilityRead: string = want.abilityName ?? '';
      const paramsRead: Record<string, Object> = want.parameters as Record<string, Object>;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 bundleRead=${bundleRead}`);
      expect(bundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 abilityRead=${abilityRead}`);
      expect(abilityRead).assertEqual(wantAbility);
      const actual3: number = Object.keys(paramsRead).length;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(1);
      const paramRead: string = paramsRead['launchMode'] as string;
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 paramRead=${paramRead}`);
      expect(paramRead).assertEqual('specified');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'startModeWantParamMatrix0017 end');
    })

    /**
     * @tc.number    SUB_START_MODE_WANT_PARAM_0018
     * @tc.name      startModeWantParamMatrix0018
     * @tc.desc      启动 SpecifiedAbility 的 Want 携带 foodId 参数可回读
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('startModeWantParamMatrix0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'startModeWantParamMatrix0018 begin');
      const wantBundle: string = 'ohos.samples.startmode';
      const wantAbility: string = 'SpecifiedAbility';
      const wantAction: string = 'action.system.home';
      const params: Record<string, Object> = {};
      params['foodId'] = '1001';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        parameters: params
      };
      const bundleRead: string = want.bundleName ?? '';
      const abilityRead: string = want.abilityName ?? '';
      const paramsRead: Record<string, Object> = want.parameters as Record<string, Object>;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 bundleRead=${bundleRead}`);
      expect(bundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 abilityRead=${abilityRead}`);
      expect(abilityRead).assertEqual(wantAbility);
      const actual3: number = Object.keys(paramsRead).length;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(1);
      const paramRead: string = paramsRead['foodId'] as string;
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 paramRead=${paramRead}`);
      expect(paramRead).assertEqual('1001');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'startModeWantParamMatrix0018 end');
    })

    /**
     * @tc.number    SUB_START_MODE_WANT_PARAM_0019
     * @tc.name      startModeWantParamMatrix0019
     * @tc.desc      启动 SpecifiedAbility 的 Want 携带 categoryId 参数可回读
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('startModeWantParamMatrix0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'startModeWantParamMatrix0019 begin');
      const wantBundle: string = 'ohos.samples.startmode';
      const wantAbility: string = 'SpecifiedAbility';
      const wantAction: string = 'ohos.want.action.viewData';
      const params: Record<string, Object> = {};
      params['categoryId'] = 'vegetable';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        parameters: params
      };
      const bundleRead: string = want.bundleName ?? '';
      const abilityRead: string = want.abilityName ?? '';
      const paramsRead: Record<string, Object> = want.parameters as Record<string, Object>;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 bundleRead=${bundleRead}`);
      expect(bundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 abilityRead=${abilityRead}`);
      expect(abilityRead).assertEqual(wantAbility);
      const actual3: number = Object.keys(paramsRead).length;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(1);
      const paramRead: string = paramsRead['categoryId'] as string;
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 paramRead=${paramRead}`);
      expect(paramRead).assertEqual('vegetable');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'startModeWantParamMatrix0019 end');
    })

    /**
     * @tc.number    SUB_START_MODE_WANT_PARAM_0020
     * @tc.name      startModeWantParamMatrix0020
     * @tc.desc      启动 SpecifiedAbility 的 Want 携带 fromPage 参数可回读
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('startModeWantParamMatrix0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'startModeWantParamMatrix0020 begin');
      const wantBundle: string = 'ohos.samples.startmode';
      const wantAbility: string = 'SpecifiedAbility';
      const wantAction: string = '';
      const params: Record<string, Object> = {};
      params['fromPage'] = 'Home';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        parameters: params
      };
      const bundleRead: string = want.bundleName ?? '';
      const abilityRead: string = want.abilityName ?? '';
      const paramsRead: Record<string, Object> = want.parameters as Record<string, Object>;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 bundleRead=${bundleRead}`);
      expect(bundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 abilityRead=${abilityRead}`);
      expect(abilityRead).assertEqual(wantAbility);
      const actual3: number = Object.keys(paramsRead).length;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(1);
      const paramRead: string = paramsRead['fromPage'] as string;
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 paramRead=${paramRead}`);
      expect(paramRead).assertEqual('Home');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'startModeWantParamMatrix0020 end');
    })
  })
}
