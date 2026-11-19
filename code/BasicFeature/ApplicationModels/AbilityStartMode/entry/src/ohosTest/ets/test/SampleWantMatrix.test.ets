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

import { beforeEachIt, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { tick } from '../util/TestTick';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { Want } from '@kit.AbilityKit';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_StartMode]';

export default function sampleWantMatrixTest(): void {
  describe('SampleWantMatrixTest', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 util/TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });

    /**
     * @tc.number    SUB_START_MODE_WANT_0001
     * @tc.name      sampleWantMatrix0001
     * @tc.desc      Want(startmode/MainAbility/home) 字段可读且值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantMatrix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantMatrix0001 begin');
      const wantBundle: string = 'ohos.samples.startmode';
      const wantAbility: string = 'MainAbility';
      const wantAction: string = 'action.system.home';
      const wantUri: string = 'https://example.com/sample?from=test';
      const wantType: string = 'text/plain';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const bundleRead: string = want.bundleName ?? '';
      const abilityRead: string = want.abilityName ?? '';
      const actionRead: string = want.action ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 bundleRead=${bundleRead}`);
      expect(bundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 bundleRead.length=${bundleRead.length}`);
      expect(bundleRead.length).assertEqual(22);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 abilityRead=${abilityRead}`);
      expect(abilityRead).assertEqual(wantAbility);
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 actionRead=${actionRead}`);
      expect(actionRead).assertEqual(wantAction);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantMatrix0001 end');
    })

    /**
     * @tc.number    SUB_START_MODE_WANT_0002
     * @tc.name      sampleWantMatrix0002
     * @tc.desc      Want(startmode/MainAbility/viewData) 字段可读且值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantMatrix0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantMatrix0002 begin');
      const wantBundle: string = 'ohos.samples.startmode';
      const wantAbility: string = 'MainAbility';
      const wantAction: string = 'ohos.want.action.viewData';
      const wantUri: string = 'sample://demo/page?index=1';
      const wantType: string = 'application/json';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const bundleRead: string = want.bundleName ?? '';
      const abilityRead: string = want.abilityName ?? '';
      const actionRead: string = want.action ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 bundleRead=${bundleRead}`);
      expect(bundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 bundleRead.length=${bundleRead.length}`);
      expect(bundleRead.length).assertEqual(22);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 abilityRead=${abilityRead}`);
      expect(abilityRead).assertEqual(wantAbility);
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 actionRead=${actionRead}`);
      expect(actionRead).assertEqual(wantAction);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantMatrix0002 end');
    })

    /**
     * @tc.number    SUB_START_MODE_WANT_0003
     * @tc.name      sampleWantMatrix0003
     * @tc.desc      Want(startmode/MainAbility/sendData) 字段可读且值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantMatrix0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantMatrix0003 begin');
      const wantBundle: string = 'ohos.samples.startmode';
      const wantAbility: string = 'MainAbility';
      const wantAction: string = 'ohos.want.action.sendData';
      const wantUri: string = 'sample://demo';
      const wantType: string = '';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const bundleRead: string = want.bundleName ?? '';
      const abilityRead: string = want.abilityName ?? '';
      const actionRead: string = want.action ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 bundleRead=${bundleRead}`);
      expect(bundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 bundleRead.length=${bundleRead.length}`);
      expect(bundleRead.length).assertEqual(22);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 abilityRead=${abilityRead}`);
      expect(abilityRead).assertEqual(wantAbility);
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 actionRead=${actionRead}`);
      expect(actionRead).assertEqual(wantAction);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantMatrix0003 end');
    })

    /**
     * @tc.number    SUB_START_MODE_WANT_0004
     * @tc.name      sampleWantMatrix0004
     * @tc.desc      Want(startmode/MainAbility/空) 字段可读且值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantMatrix0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantMatrix0004 begin');
      const wantBundle: string = 'ohos.samples.startmode';
      const wantAbility: string = 'MainAbility';
      const wantAction: string = '';
      const wantUri: string = 'https://example.com/sample?from=test';
      const wantType: string = 'text/plain';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const bundleRead: string = want.bundleName ?? '';
      const abilityRead: string = want.abilityName ?? '';
      const actionRead: string = want.action ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 bundleRead=${bundleRead}`);
      expect(bundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 bundleRead.length=${bundleRead.length}`);
      expect(bundleRead.length).assertEqual(22);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 abilityRead=${abilityRead}`);
      expect(abilityRead).assertEqual(wantAbility);
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 actionRead=${actionRead}`);
      expect(actionRead).assertEqual(wantAction);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantMatrix0004 end');
    })

    /**
     * @tc.number    SUB_START_MODE_WANT_0005
     * @tc.name      sampleWantMatrix0005
     * @tc.desc      Want(startmode/StandardAbility/home) 字段可读且值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantMatrix0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantMatrix0005 begin');
      const wantBundle: string = 'ohos.samples.startmode';
      const wantAbility: string = 'StandardAbility';
      const wantAction: string = 'action.system.home';
      const wantUri: string = 'https://example.com/sample?from=test';
      const wantType: string = 'text/plain';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const bundleRead: string = want.bundleName ?? '';
      const abilityRead: string = want.abilityName ?? '';
      const actionRead: string = want.action ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 bundleRead=${bundleRead}`);
      expect(bundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 bundleRead.length=${bundleRead.length}`);
      expect(bundleRead.length).assertEqual(22);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 abilityRead=${abilityRead}`);
      expect(abilityRead).assertEqual(wantAbility);
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 actionRead=${actionRead}`);
      expect(actionRead).assertEqual(wantAction);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantMatrix0005 end');
    })

    /**
     * @tc.number    SUB_START_MODE_WANT_0006
     * @tc.name      sampleWantMatrix0006
     * @tc.desc      Want(startmode/StandardAbility/viewData) 字段可读且值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantMatrix0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantMatrix0006 begin');
      const wantBundle: string = 'ohos.samples.startmode';
      const wantAbility: string = 'StandardAbility';
      const wantAction: string = 'ohos.want.action.viewData';
      const wantUri: string = 'sample://demo/page?index=1';
      const wantType: string = 'application/json';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const bundleRead: string = want.bundleName ?? '';
      const abilityRead: string = want.abilityName ?? '';
      const actionRead: string = want.action ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 bundleRead=${bundleRead}`);
      expect(bundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 bundleRead.length=${bundleRead.length}`);
      expect(bundleRead.length).assertEqual(22);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 abilityRead=${abilityRead}`);
      expect(abilityRead).assertEqual(wantAbility);
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 actionRead=${actionRead}`);
      expect(actionRead).assertEqual(wantAction);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantMatrix0006 end');
    })

    /**
     * @tc.number    SUB_START_MODE_WANT_0007
     * @tc.name      sampleWantMatrix0007
     * @tc.desc      Want(startmode/StandardAbility/sendData) 字段可读且值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantMatrix0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantMatrix0007 begin');
      const wantBundle: string = 'ohos.samples.startmode';
      const wantAbility: string = 'StandardAbility';
      const wantAction: string = 'ohos.want.action.sendData';
      const wantUri: string = 'sample://demo';
      const wantType: string = '';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const bundleRead: string = want.bundleName ?? '';
      const abilityRead: string = want.abilityName ?? '';
      const actionRead: string = want.action ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 bundleRead=${bundleRead}`);
      expect(bundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 bundleRead.length=${bundleRead.length}`);
      expect(bundleRead.length).assertEqual(22);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 abilityRead=${abilityRead}`);
      expect(abilityRead).assertEqual(wantAbility);
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 actionRead=${actionRead}`);
      expect(actionRead).assertEqual(wantAction);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantMatrix0007 end');
    })

    /**
     * @tc.number    SUB_START_MODE_WANT_0008
     * @tc.name      sampleWantMatrix0008
     * @tc.desc      Want(startmode/StandardAbility/空) 字段可读且值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantMatrix0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantMatrix0008 begin');
      const wantBundle: string = 'ohos.samples.startmode';
      const wantAbility: string = 'StandardAbility';
      const wantAction: string = '';
      const wantUri: string = 'https://example.com/sample?from=test';
      const wantType: string = 'text/plain';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const bundleRead: string = want.bundleName ?? '';
      const abilityRead: string = want.abilityName ?? '';
      const actionRead: string = want.action ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 bundleRead=${bundleRead}`);
      expect(bundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 bundleRead.length=${bundleRead.length}`);
      expect(bundleRead.length).assertEqual(22);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 abilityRead=${abilityRead}`);
      expect(abilityRead).assertEqual(wantAbility);
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 actionRead=${actionRead}`);
      expect(actionRead).assertEqual(wantAction);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantMatrix0008 end');
    })

    /**
     * @tc.number    SUB_START_MODE_WANT_0009
     * @tc.name      sampleWantMatrix0009
     * @tc.desc      Want(startmode/SingletonAbility/home) 字段可读且值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantMatrix0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantMatrix0009 begin');
      const wantBundle: string = 'ohos.samples.startmode';
      const wantAbility: string = 'SingletonAbility';
      const wantAction: string = 'action.system.home';
      const wantUri: string = 'https://example.com/sample?from=test';
      const wantType: string = 'text/plain';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const bundleRead: string = want.bundleName ?? '';
      const abilityRead: string = want.abilityName ?? '';
      const actionRead: string = want.action ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 bundleRead=${bundleRead}`);
      expect(bundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 bundleRead.length=${bundleRead.length}`);
      expect(bundleRead.length).assertEqual(22);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 abilityRead=${abilityRead}`);
      expect(abilityRead).assertEqual(wantAbility);
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 actionRead=${actionRead}`);
      expect(actionRead).assertEqual(wantAction);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantMatrix0009 end');
    })

    /**
     * @tc.number    SUB_START_MODE_WANT_0010
     * @tc.name      sampleWantMatrix0010
     * @tc.desc      Want(startmode/SingletonAbility/viewData) 字段可读且值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantMatrix0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantMatrix0010 begin');
      const wantBundle: string = 'ohos.samples.startmode';
      const wantAbility: string = 'SingletonAbility';
      const wantAction: string = 'ohos.want.action.viewData';
      const wantUri: string = 'sample://demo/page?index=1';
      const wantType: string = 'application/json';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const bundleRead: string = want.bundleName ?? '';
      const abilityRead: string = want.abilityName ?? '';
      const actionRead: string = want.action ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 bundleRead=${bundleRead}`);
      expect(bundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 bundleRead.length=${bundleRead.length}`);
      expect(bundleRead.length).assertEqual(22);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 abilityRead=${abilityRead}`);
      expect(abilityRead).assertEqual(wantAbility);
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 actionRead=${actionRead}`);
      expect(actionRead).assertEqual(wantAction);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantMatrix0010 end');
    })

    /**
     * @tc.number    SUB_START_MODE_WANT_0011
     * @tc.name      sampleWantMatrix0011
     * @tc.desc      Want(startmode/SingletonAbility/sendData) 字段可读且值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantMatrix0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantMatrix0011 begin');
      const wantBundle: string = 'ohos.samples.startmode';
      const wantAbility: string = 'SingletonAbility';
      const wantAction: string = 'ohos.want.action.sendData';
      const wantUri: string = 'sample://demo';
      const wantType: string = '';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const bundleRead: string = want.bundleName ?? '';
      const abilityRead: string = want.abilityName ?? '';
      const actionRead: string = want.action ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 bundleRead=${bundleRead}`);
      expect(bundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 bundleRead.length=${bundleRead.length}`);
      expect(bundleRead.length).assertEqual(22);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 abilityRead=${abilityRead}`);
      expect(abilityRead).assertEqual(wantAbility);
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 actionRead=${actionRead}`);
      expect(actionRead).assertEqual(wantAction);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantMatrix0011 end');
    })

    /**
     * @tc.number    SUB_START_MODE_WANT_0012
     * @tc.name      sampleWantMatrix0012
     * @tc.desc      Want(startmode/SingletonAbility/空) 字段可读且值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantMatrix0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantMatrix0012 begin');
      const wantBundle: string = 'ohos.samples.startmode';
      const wantAbility: string = 'SingletonAbility';
      const wantAction: string = '';
      const wantUri: string = 'https://example.com/sample?from=test';
      const wantType: string = 'text/plain';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const bundleRead: string = want.bundleName ?? '';
      const abilityRead: string = want.abilityName ?? '';
      const actionRead: string = want.action ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 bundleRead=${bundleRead}`);
      expect(bundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 bundleRead.length=${bundleRead.length}`);
      expect(bundleRead.length).assertEqual(22);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 abilityRead=${abilityRead}`);
      expect(abilityRead).assertEqual(wantAbility);
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 actionRead=${actionRead}`);
      expect(actionRead).assertEqual(wantAction);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantMatrix0012 end');
    })

    /**
     * @tc.number    SUB_START_MODE_WANT_0013
     * @tc.name      sampleWantMatrix0013
     * @tc.desc      Want(startmode/SpecifiedAbility/home) 字段可读且值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantMatrix0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantMatrix0013 begin');
      const wantBundle: string = 'ohos.samples.startmode';
      const wantAbility: string = 'SpecifiedAbility';
      const wantAction: string = 'action.system.home';
      const wantUri: string = 'https://example.com/sample?from=test';
      const wantType: string = 'text/plain';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const bundleRead: string = want.bundleName ?? '';
      const abilityRead: string = want.abilityName ?? '';
      const actionRead: string = want.action ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 bundleRead=${bundleRead}`);
      expect(bundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 bundleRead.length=${bundleRead.length}`);
      expect(bundleRead.length).assertEqual(22);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 abilityRead=${abilityRead}`);
      expect(abilityRead).assertEqual(wantAbility);
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 actionRead=${actionRead}`);
      expect(actionRead).assertEqual(wantAction);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantMatrix0013 end');
    })

    /**
     * @tc.number    SUB_START_MODE_WANT_0014
     * @tc.name      sampleWantMatrix0014
     * @tc.desc      Want(startmode/SpecifiedAbility/viewData) 字段可读且值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantMatrix0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantMatrix0014 begin');
      const wantBundle: string = 'ohos.samples.startmode';
      const wantAbility: string = 'SpecifiedAbility';
      const wantAction: string = 'ohos.want.action.viewData';
      const wantUri: string = 'sample://demo/page?index=1';
      const wantType: string = 'application/json';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const bundleRead: string = want.bundleName ?? '';
      const abilityRead: string = want.abilityName ?? '';
      const actionRead: string = want.action ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 bundleRead=${bundleRead}`);
      expect(bundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 bundleRead.length=${bundleRead.length}`);
      expect(bundleRead.length).assertEqual(22);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 abilityRead=${abilityRead}`);
      expect(abilityRead).assertEqual(wantAbility);
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 actionRead=${actionRead}`);
      expect(actionRead).assertEqual(wantAction);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantMatrix0014 end');
    })

    /**
     * @tc.number    SUB_START_MODE_WANT_0015
     * @tc.name      sampleWantMatrix0015
     * @tc.desc      Want(startmode/SpecifiedAbility/sendData) 字段可读且值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantMatrix0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantMatrix0015 begin');
      const wantBundle: string = 'ohos.samples.startmode';
      const wantAbility: string = 'SpecifiedAbility';
      const wantAction: string = 'ohos.want.action.sendData';
      const wantUri: string = 'sample://demo';
      const wantType: string = '';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const bundleRead: string = want.bundleName ?? '';
      const abilityRead: string = want.abilityName ?? '';
      const actionRead: string = want.action ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 bundleRead=${bundleRead}`);
      expect(bundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 bundleRead.length=${bundleRead.length}`);
      expect(bundleRead.length).assertEqual(22);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 abilityRead=${abilityRead}`);
      expect(abilityRead).assertEqual(wantAbility);
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 actionRead=${actionRead}`);
      expect(actionRead).assertEqual(wantAction);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantMatrix0015 end');
    })

    /**
     * @tc.number    SUB_START_MODE_WANT_0016
     * @tc.name      sampleWantMatrix0016
     * @tc.desc      Want(startmode/SpecifiedAbility/空) 字段可读且值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantMatrix0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantMatrix0016 begin');
      const wantBundle: string = 'ohos.samples.startmode';
      const wantAbility: string = 'SpecifiedAbility';
      const wantAction: string = '';
      const wantUri: string = 'https://example.com/sample?from=test';
      const wantType: string = 'text/plain';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const bundleRead: string = want.bundleName ?? '';
      const abilityRead: string = want.abilityName ?? '';
      const actionRead: string = want.action ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 bundleRead=${bundleRead}`);
      expect(bundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 bundleRead.length=${bundleRead.length}`);
      expect(bundleRead.length).assertEqual(22);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 abilityRead=${abilityRead}`);
      expect(abilityRead).assertEqual(wantAbility);
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 actionRead=${actionRead}`);
      expect(actionRead).assertEqual(wantAction);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantMatrix0016 end');
    })

    /**
     * @tc.number    SUB_START_MODE_WANT_0017
     * @tc.name      sampleWantMatrix0017
     * @tc.desc      Want(startmode.standard/MainAbility/home) 字段可读且值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantMatrix0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantMatrix0017 begin');
      const wantBundle: string = 'ohos.samples.startmode.standard';
      const wantAbility: string = 'MainAbility';
      const wantAction: string = 'action.system.home';
      const wantUri: string = 'https://example.com/sample?from=test';
      const wantType: string = 'text/plain';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const bundleRead: string = want.bundleName ?? '';
      const abilityRead: string = want.abilityName ?? '';
      const actionRead: string = want.action ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 bundleRead=${bundleRead}`);
      expect(bundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 bundleRead.length=${bundleRead.length}`);
      expect(bundleRead.length).assertEqual(31);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 abilityRead=${abilityRead}`);
      expect(abilityRead).assertEqual(wantAbility);
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 actionRead=${actionRead}`);
      expect(actionRead).assertEqual(wantAction);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantMatrix0017 end');
    })

    /**
     * @tc.number    SUB_START_MODE_WANT_0018
     * @tc.name      sampleWantMatrix0018
     * @tc.desc      Want(startmode.standard/MainAbility/viewData) 字段可读且值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantMatrix0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantMatrix0018 begin');
      const wantBundle: string = 'ohos.samples.startmode.standard';
      const wantAbility: string = 'MainAbility';
      const wantAction: string = 'ohos.want.action.viewData';
      const wantUri: string = 'sample://demo/page?index=1';
      const wantType: string = 'application/json';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const bundleRead: string = want.bundleName ?? '';
      const abilityRead: string = want.abilityName ?? '';
      const actionRead: string = want.action ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 bundleRead=${bundleRead}`);
      expect(bundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 bundleRead.length=${bundleRead.length}`);
      expect(bundleRead.length).assertEqual(31);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 abilityRead=${abilityRead}`);
      expect(abilityRead).assertEqual(wantAbility);
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 actionRead=${actionRead}`);
      expect(actionRead).assertEqual(wantAction);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantMatrix0018 end');
    })

    /**
     * @tc.number    SUB_START_MODE_WANT_0019
     * @tc.name      sampleWantMatrix0019
     * @tc.desc      Want(startmode.standard/MainAbility/sendData) 字段可读且值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantMatrix0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantMatrix0019 begin');
      const wantBundle: string = 'ohos.samples.startmode.standard';
      const wantAbility: string = 'MainAbility';
      const wantAction: string = 'ohos.want.action.sendData';
      const wantUri: string = 'sample://demo';
      const wantType: string = '';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const bundleRead: string = want.bundleName ?? '';
      const abilityRead: string = want.abilityName ?? '';
      const actionRead: string = want.action ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 bundleRead=${bundleRead}`);
      expect(bundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 bundleRead.length=${bundleRead.length}`);
      expect(bundleRead.length).assertEqual(31);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 abilityRead=${abilityRead}`);
      expect(abilityRead).assertEqual(wantAbility);
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 actionRead=${actionRead}`);
      expect(actionRead).assertEqual(wantAction);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantMatrix0019 end');
    })

    /**
     * @tc.number    SUB_START_MODE_WANT_0020
     * @tc.name      sampleWantMatrix0020
     * @tc.desc      Want(startmode.standard/MainAbility/空) 字段可读且值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantMatrix0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantMatrix0020 begin');
      const wantBundle: string = 'ohos.samples.startmode.standard';
      const wantAbility: string = 'MainAbility';
      const wantAction: string = '';
      const wantUri: string = 'https://example.com/sample?from=test';
      const wantType: string = 'text/plain';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const bundleRead: string = want.bundleName ?? '';
      const abilityRead: string = want.abilityName ?? '';
      const actionRead: string = want.action ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 bundleRead=${bundleRead}`);
      expect(bundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 bundleRead.length=${bundleRead.length}`);
      expect(bundleRead.length).assertEqual(31);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 abilityRead=${abilityRead}`);
      expect(abilityRead).assertEqual(wantAbility);
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 actionRead=${actionRead}`);
      expect(actionRead).assertEqual(wantAction);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantMatrix0020 end');
    })

    /**
     * @tc.number    SUB_START_MODE_WANT_0021
     * @tc.name      sampleWantMatrix0021
     * @tc.desc      Want(startmode.standard/StandardAbility/home) 字段可读且值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantMatrix0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantMatrix0021 begin');
      const wantBundle: string = 'ohos.samples.startmode.standard';
      const wantAbility: string = 'StandardAbility';
      const wantAction: string = 'action.system.home';
      const wantUri: string = 'https://example.com/sample?from=test';
      const wantType: string = 'text/plain';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const bundleRead: string = want.bundleName ?? '';
      const abilityRead: string = want.abilityName ?? '';
      const actionRead: string = want.action ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 bundleRead=${bundleRead}`);
      expect(bundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 bundleRead.length=${bundleRead.length}`);
      expect(bundleRead.length).assertEqual(31);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 abilityRead=${abilityRead}`);
      expect(abilityRead).assertEqual(wantAbility);
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 actionRead=${actionRead}`);
      expect(actionRead).assertEqual(wantAction);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantMatrix0021 end');
    })

    /**
     * @tc.number    SUB_START_MODE_WANT_0022
     * @tc.name      sampleWantMatrix0022
     * @tc.desc      Want(startmode.standard/StandardAbility/viewData) 字段可读且值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantMatrix0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantMatrix0022 begin');
      const wantBundle: string = 'ohos.samples.startmode.standard';
      const wantAbility: string = 'StandardAbility';
      const wantAction: string = 'ohos.want.action.viewData';
      const wantUri: string = 'sample://demo/page?index=1';
      const wantType: string = 'application/json';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const bundleRead: string = want.bundleName ?? '';
      const abilityRead: string = want.abilityName ?? '';
      const actionRead: string = want.action ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 bundleRead=${bundleRead}`);
      expect(bundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 bundleRead.length=${bundleRead.length}`);
      expect(bundleRead.length).assertEqual(31);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 abilityRead=${abilityRead}`);
      expect(abilityRead).assertEqual(wantAbility);
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 actionRead=${actionRead}`);
      expect(actionRead).assertEqual(wantAction);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantMatrix0022 end');
    })

    /**
     * @tc.number    SUB_START_MODE_WANT_0023
     * @tc.name      sampleWantMatrix0023
     * @tc.desc      Want(startmode.standard/StandardAbility/sendData) 字段可读且值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantMatrix0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantMatrix0023 begin');
      const wantBundle: string = 'ohos.samples.startmode.standard';
      const wantAbility: string = 'StandardAbility';
      const wantAction: string = 'ohos.want.action.sendData';
      const wantUri: string = 'sample://demo';
      const wantType: string = '';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const bundleRead: string = want.bundleName ?? '';
      const abilityRead: string = want.abilityName ?? '';
      const actionRead: string = want.action ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 bundleRead=${bundleRead}`);
      expect(bundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 bundleRead.length=${bundleRead.length}`);
      expect(bundleRead.length).assertEqual(31);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 abilityRead=${abilityRead}`);
      expect(abilityRead).assertEqual(wantAbility);
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 actionRead=${actionRead}`);
      expect(actionRead).assertEqual(wantAction);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantMatrix0023 end');
    })

    /**
     * @tc.number    SUB_START_MODE_WANT_0024
     * @tc.name      sampleWantMatrix0024
     * @tc.desc      Want(startmode.standard/StandardAbility/空) 字段可读且值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantMatrix0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantMatrix0024 begin');
      const wantBundle: string = 'ohos.samples.startmode.standard';
      const wantAbility: string = 'StandardAbility';
      const wantAction: string = '';
      const wantUri: string = 'https://example.com/sample?from=test';
      const wantType: string = 'text/plain';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const bundleRead: string = want.bundleName ?? '';
      const abilityRead: string = want.abilityName ?? '';
      const actionRead: string = want.action ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 bundleRead=${bundleRead}`);
      expect(bundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 bundleRead.length=${bundleRead.length}`);
      expect(bundleRead.length).assertEqual(31);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 abilityRead=${abilityRead}`);
      expect(abilityRead).assertEqual(wantAbility);
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 actionRead=${actionRead}`);
      expect(actionRead).assertEqual(wantAction);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantMatrix0024 end');
    })

    /**
     * @tc.number    SUB_START_MODE_WANT_0025
     * @tc.name      sampleWantMatrix0025
     * @tc.desc      Want(startmode.standard/SingletonAbility/home) 字段可读且值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantMatrix0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantMatrix0025 begin');
      const wantBundle: string = 'ohos.samples.startmode.standard';
      const wantAbility: string = 'SingletonAbility';
      const wantAction: string = 'action.system.home';
      const wantUri: string = 'https://example.com/sample?from=test';
      const wantType: string = 'text/plain';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const bundleRead: string = want.bundleName ?? '';
      const abilityRead: string = want.abilityName ?? '';
      const actionRead: string = want.action ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 bundleRead=${bundleRead}`);
      expect(bundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 bundleRead.length=${bundleRead.length}`);
      expect(bundleRead.length).assertEqual(31);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 abilityRead=${abilityRead}`);
      expect(abilityRead).assertEqual(wantAbility);
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 actionRead=${actionRead}`);
      expect(actionRead).assertEqual(wantAction);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantMatrix0025 end');
    })

    /**
     * @tc.number    SUB_START_MODE_WANT_0026
     * @tc.name      sampleWantMatrix0026
     * @tc.desc      Want(startmode.standard/SingletonAbility/viewData) 字段可读且值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantMatrix0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantMatrix0026 begin');
      const wantBundle: string = 'ohos.samples.startmode.standard';
      const wantAbility: string = 'SingletonAbility';
      const wantAction: string = 'ohos.want.action.viewData';
      const wantUri: string = 'sample://demo/page?index=1';
      const wantType: string = 'application/json';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const bundleRead: string = want.bundleName ?? '';
      const abilityRead: string = want.abilityName ?? '';
      const actionRead: string = want.action ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 bundleRead=${bundleRead}`);
      expect(bundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 bundleRead.length=${bundleRead.length}`);
      expect(bundleRead.length).assertEqual(31);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 abilityRead=${abilityRead}`);
      expect(abilityRead).assertEqual(wantAbility);
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 actionRead=${actionRead}`);
      expect(actionRead).assertEqual(wantAction);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantMatrix0026 end');
    })

    /**
     * @tc.number    SUB_START_MODE_WANT_0027
     * @tc.name      sampleWantMatrix0027
     * @tc.desc      Want(startmode.standard/SingletonAbility/sendData) 字段可读且值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantMatrix0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantMatrix0027 begin');
      const wantBundle: string = 'ohos.samples.startmode.standard';
      const wantAbility: string = 'SingletonAbility';
      const wantAction: string = 'ohos.want.action.sendData';
      const wantUri: string = 'sample://demo';
      const wantType: string = '';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const bundleRead: string = want.bundleName ?? '';
      const abilityRead: string = want.abilityName ?? '';
      const actionRead: string = want.action ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 bundleRead=${bundleRead}`);
      expect(bundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 bundleRead.length=${bundleRead.length}`);
      expect(bundleRead.length).assertEqual(31);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 abilityRead=${abilityRead}`);
      expect(abilityRead).assertEqual(wantAbility);
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 actionRead=${actionRead}`);
      expect(actionRead).assertEqual(wantAction);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantMatrix0027 end');
    })

    /**
     * @tc.number    SUB_START_MODE_WANT_0028
     * @tc.name      sampleWantMatrix0028
     * @tc.desc      Want(startmode.standard/SingletonAbility/空) 字段可读且值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantMatrix0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantMatrix0028 begin');
      const wantBundle: string = 'ohos.samples.startmode.standard';
      const wantAbility: string = 'SingletonAbility';
      const wantAction: string = '';
      const wantUri: string = 'https://example.com/sample?from=test';
      const wantType: string = 'text/plain';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const bundleRead: string = want.bundleName ?? '';
      const abilityRead: string = want.abilityName ?? '';
      const actionRead: string = want.action ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 bundleRead=${bundleRead}`);
      expect(bundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 bundleRead.length=${bundleRead.length}`);
      expect(bundleRead.length).assertEqual(31);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 abilityRead=${abilityRead}`);
      expect(abilityRead).assertEqual(wantAbility);
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 actionRead=${actionRead}`);
      expect(actionRead).assertEqual(wantAction);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantMatrix0028 end');
    })

    /**
     * @tc.number    SUB_START_MODE_WANT_0029
     * @tc.name      sampleWantMatrix0029
     * @tc.desc      Want(startmode.standard/SpecifiedAbility/home) 字段可读且值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantMatrix0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantMatrix0029 begin');
      const wantBundle: string = 'ohos.samples.startmode.standard';
      const wantAbility: string = 'SpecifiedAbility';
      const wantAction: string = 'action.system.home';
      const wantUri: string = 'https://example.com/sample?from=test';
      const wantType: string = 'text/plain';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const bundleRead: string = want.bundleName ?? '';
      const abilityRead: string = want.abilityName ?? '';
      const actionRead: string = want.action ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 bundleRead=${bundleRead}`);
      expect(bundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 bundleRead.length=${bundleRead.length}`);
      expect(bundleRead.length).assertEqual(31);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 abilityRead=${abilityRead}`);
      expect(abilityRead).assertEqual(wantAbility);
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 actionRead=${actionRead}`);
      expect(actionRead).assertEqual(wantAction);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantMatrix0029 end');
    })

    /**
     * @tc.number    SUB_START_MODE_WANT_0030
     * @tc.name      sampleWantMatrix0030
     * @tc.desc      Want(startmode.standard/SpecifiedAbility/viewData) 字段可读且值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantMatrix0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantMatrix0030 begin');
      const wantBundle: string = 'ohos.samples.startmode.standard';
      const wantAbility: string = 'SpecifiedAbility';
      const wantAction: string = 'ohos.want.action.viewData';
      const wantUri: string = 'sample://demo/page?index=1';
      const wantType: string = 'application/json';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const bundleRead: string = want.bundleName ?? '';
      const abilityRead: string = want.abilityName ?? '';
      const actionRead: string = want.action ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 bundleRead=${bundleRead}`);
      expect(bundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 bundleRead.length=${bundleRead.length}`);
      expect(bundleRead.length).assertEqual(31);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 abilityRead=${abilityRead}`);
      expect(abilityRead).assertEqual(wantAbility);
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 actionRead=${actionRead}`);
      expect(actionRead).assertEqual(wantAction);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantMatrix0030 end');
    })

    /**
     * @tc.number    SUB_START_MODE_WANT_0031
     * @tc.name      sampleWantMatrix0031
     * @tc.desc      Want(startmode.standard/SpecifiedAbility/sendData) 字段可读且值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantMatrix0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantMatrix0031 begin');
      const wantBundle: string = 'ohos.samples.startmode.standard';
      const wantAbility: string = 'SpecifiedAbility';
      const wantAction: string = 'ohos.want.action.sendData';
      const wantUri: string = 'sample://demo';
      const wantType: string = '';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const bundleRead: string = want.bundleName ?? '';
      const abilityRead: string = want.abilityName ?? '';
      const actionRead: string = want.action ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 bundleRead=${bundleRead}`);
      expect(bundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 bundleRead.length=${bundleRead.length}`);
      expect(bundleRead.length).assertEqual(31);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 abilityRead=${abilityRead}`);
      expect(abilityRead).assertEqual(wantAbility);
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 actionRead=${actionRead}`);
      expect(actionRead).assertEqual(wantAction);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantMatrix0031 end');
    })

    /**
     * @tc.number    SUB_START_MODE_WANT_0032
     * @tc.name      sampleWantMatrix0032
     * @tc.desc      Want(startmode.standard/SpecifiedAbility/空) 字段可读且值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantMatrix0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantMatrix0032 begin');
      const wantBundle: string = 'ohos.samples.startmode.standard';
      const wantAbility: string = 'SpecifiedAbility';
      const wantAction: string = '';
      const wantUri: string = 'https://example.com/sample?from=test';
      const wantType: string = 'text/plain';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const bundleRead: string = want.bundleName ?? '';
      const abilityRead: string = want.abilityName ?? '';
      const actionRead: string = want.action ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 bundleRead=${bundleRead}`);
      expect(bundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 bundleRead.length=${bundleRead.length}`);
      expect(bundleRead.length).assertEqual(31);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 abilityRead=${abilityRead}`);
      expect(abilityRead).assertEqual(wantAbility);
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 actionRead=${actionRead}`);
      expect(actionRead).assertEqual(wantAction);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantMatrix0032 end');
    })

    /**
     * @tc.number    SUB_START_MODE_WANT_0033
     * @tc.name      sampleWantMatrix0033
     * @tc.desc      Want(startmode.singleton/MainAbility/home) 字段可读且值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantMatrix0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantMatrix0033 begin');
      const wantBundle: string = 'ohos.samples.startmode.singleton';
      const wantAbility: string = 'MainAbility';
      const wantAction: string = 'action.system.home';
      const wantUri: string = 'https://example.com/sample?from=test';
      const wantType: string = 'text/plain';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const bundleRead: string = want.bundleName ?? '';
      const abilityRead: string = want.abilityName ?? '';
      const actionRead: string = want.action ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 bundleRead=${bundleRead}`);
      expect(bundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 bundleRead.length=${bundleRead.length}`);
      expect(bundleRead.length).assertEqual(32);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 abilityRead=${abilityRead}`);
      expect(abilityRead).assertEqual(wantAbility);
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 actionRead=${actionRead}`);
      expect(actionRead).assertEqual(wantAction);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantMatrix0033 end');
    })

    /**
     * @tc.number    SUB_START_MODE_WANT_0034
     * @tc.name      sampleWantMatrix0034
     * @tc.desc      Want(startmode.singleton/MainAbility/viewData) 字段可读且值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantMatrix0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantMatrix0034 begin');
      const wantBundle: string = 'ohos.samples.startmode.singleton';
      const wantAbility: string = 'MainAbility';
      const wantAction: string = 'ohos.want.action.viewData';
      const wantUri: string = 'sample://demo/page?index=1';
      const wantType: string = 'application/json';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const bundleRead: string = want.bundleName ?? '';
      const abilityRead: string = want.abilityName ?? '';
      const actionRead: string = want.action ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 bundleRead=${bundleRead}`);
      expect(bundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 bundleRead.length=${bundleRead.length}`);
      expect(bundleRead.length).assertEqual(32);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 abilityRead=${abilityRead}`);
      expect(abilityRead).assertEqual(wantAbility);
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 actionRead=${actionRead}`);
      expect(actionRead).assertEqual(wantAction);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantMatrix0034 end');
    })

    /**
     * @tc.number    SUB_START_MODE_WANT_0035
     * @tc.name      sampleWantMatrix0035
     * @tc.desc      Want(startmode.singleton/MainAbility/sendData) 字段可读且值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantMatrix0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantMatrix0035 begin');
      const wantBundle: string = 'ohos.samples.startmode.singleton';
      const wantAbility: string = 'MainAbility';
      const wantAction: string = 'ohos.want.action.sendData';
      const wantUri: string = 'sample://demo';
      const wantType: string = '';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const bundleRead: string = want.bundleName ?? '';
      const abilityRead: string = want.abilityName ?? '';
      const actionRead: string = want.action ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 bundleRead=${bundleRead}`);
      expect(bundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 bundleRead.length=${bundleRead.length}`);
      expect(bundleRead.length).assertEqual(32);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 abilityRead=${abilityRead}`);
      expect(abilityRead).assertEqual(wantAbility);
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 actionRead=${actionRead}`);
      expect(actionRead).assertEqual(wantAction);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantMatrix0035 end');
    })

    /**
     * @tc.number    SUB_START_MODE_WANT_0036
     * @tc.name      sampleWantMatrix0036
     * @tc.desc      Want(startmode.singleton/MainAbility/空) 字段可读且值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantMatrix0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantMatrix0036 begin');
      const wantBundle: string = 'ohos.samples.startmode.singleton';
      const wantAbility: string = 'MainAbility';
      const wantAction: string = '';
      const wantUri: string = 'https://example.com/sample?from=test';
      const wantType: string = 'text/plain';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const bundleRead: string = want.bundleName ?? '';
      const abilityRead: string = want.abilityName ?? '';
      const actionRead: string = want.action ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 bundleRead=${bundleRead}`);
      expect(bundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 bundleRead.length=${bundleRead.length}`);
      expect(bundleRead.length).assertEqual(32);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 abilityRead=${abilityRead}`);
      expect(abilityRead).assertEqual(wantAbility);
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 actionRead=${actionRead}`);
      expect(actionRead).assertEqual(wantAction);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantMatrix0036 end');
    })

    /**
     * @tc.number    SUB_START_MODE_WANT_0037
     * @tc.name      sampleWantMatrix0037
     * @tc.desc      Want(startmode.singleton/StandardAbility/home) 字段可读且值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantMatrix0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantMatrix0037 begin');
      const wantBundle: string = 'ohos.samples.startmode.singleton';
      const wantAbility: string = 'StandardAbility';
      const wantAction: string = 'action.system.home';
      const wantUri: string = 'https://example.com/sample?from=test';
      const wantType: string = 'text/plain';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const bundleRead: string = want.bundleName ?? '';
      const abilityRead: string = want.abilityName ?? '';
      const actionRead: string = want.action ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 bundleRead=${bundleRead}`);
      expect(bundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 bundleRead.length=${bundleRead.length}`);
      expect(bundleRead.length).assertEqual(32);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 abilityRead=${abilityRead}`);
      expect(abilityRead).assertEqual(wantAbility);
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 actionRead=${actionRead}`);
      expect(actionRead).assertEqual(wantAction);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantMatrix0037 end');
    })

    /**
     * @tc.number    SUB_START_MODE_WANT_0038
     * @tc.name      sampleWantMatrix0038
     * @tc.desc      Want(startmode.singleton/StandardAbility/viewData) 字段可读且值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantMatrix0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantMatrix0038 begin');
      const wantBundle: string = 'ohos.samples.startmode.singleton';
      const wantAbility: string = 'StandardAbility';
      const wantAction: string = 'ohos.want.action.viewData';
      const wantUri: string = 'sample://demo/page?index=1';
      const wantType: string = 'application/json';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const bundleRead: string = want.bundleName ?? '';
      const abilityRead: string = want.abilityName ?? '';
      const actionRead: string = want.action ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 bundleRead=${bundleRead}`);
      expect(bundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 bundleRead.length=${bundleRead.length}`);
      expect(bundleRead.length).assertEqual(32);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 abilityRead=${abilityRead}`);
      expect(abilityRead).assertEqual(wantAbility);
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 actionRead=${actionRead}`);
      expect(actionRead).assertEqual(wantAction);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantMatrix0038 end');
    })

    /**
     * @tc.number    SUB_START_MODE_WANT_0039
     * @tc.name      sampleWantMatrix0039
     * @tc.desc      Want(startmode.singleton/StandardAbility/sendData) 字段可读且值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantMatrix0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantMatrix0039 begin');
      const wantBundle: string = 'ohos.samples.startmode.singleton';
      const wantAbility: string = 'StandardAbility';
      const wantAction: string = 'ohos.want.action.sendData';
      const wantUri: string = 'sample://demo';
      const wantType: string = '';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const bundleRead: string = want.bundleName ?? '';
      const abilityRead: string = want.abilityName ?? '';
      const actionRead: string = want.action ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 bundleRead=${bundleRead}`);
      expect(bundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 bundleRead.length=${bundleRead.length}`);
      expect(bundleRead.length).assertEqual(32);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 abilityRead=${abilityRead}`);
      expect(abilityRead).assertEqual(wantAbility);
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 actionRead=${actionRead}`);
      expect(actionRead).assertEqual(wantAction);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantMatrix0039 end');
    })

    /**
     * @tc.number    SUB_START_MODE_WANT_0040
     * @tc.name      sampleWantMatrix0040
     * @tc.desc      Want(startmode.singleton/StandardAbility/空) 字段可读且值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantMatrix0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantMatrix0040 begin');
      const wantBundle: string = 'ohos.samples.startmode.singleton';
      const wantAbility: string = 'StandardAbility';
      const wantAction: string = '';
      const wantUri: string = 'https://example.com/sample?from=test';
      const wantType: string = 'text/plain';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const bundleRead: string = want.bundleName ?? '';
      const abilityRead: string = want.abilityName ?? '';
      const actionRead: string = want.action ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 bundleRead=${bundleRead}`);
      expect(bundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 bundleRead.length=${bundleRead.length}`);
      expect(bundleRead.length).assertEqual(32);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 abilityRead=${abilityRead}`);
      expect(abilityRead).assertEqual(wantAbility);
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 actionRead=${actionRead}`);
      expect(actionRead).assertEqual(wantAction);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantMatrix0040 end');
    })

    /**
     * @tc.number    SUB_START_MODE_WANT_0041
     * @tc.name      sampleWantMatrix0041
     * @tc.desc      Want(startmode.singleton/SingletonAbility/home) 字段可读且值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantMatrix0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantMatrix0041 begin');
      const wantBundle: string = 'ohos.samples.startmode.singleton';
      const wantAbility: string = 'SingletonAbility';
      const wantAction: string = 'action.system.home';
      const wantUri: string = 'https://example.com/sample?from=test';
      const wantType: string = 'text/plain';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const bundleRead: string = want.bundleName ?? '';
      const abilityRead: string = want.abilityName ?? '';
      const actionRead: string = want.action ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 bundleRead=${bundleRead}`);
      expect(bundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 bundleRead.length=${bundleRead.length}`);
      expect(bundleRead.length).assertEqual(32);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 abilityRead=${abilityRead}`);
      expect(abilityRead).assertEqual(wantAbility);
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 actionRead=${actionRead}`);
      expect(actionRead).assertEqual(wantAction);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantMatrix0041 end');
    })

    /**
     * @tc.number    SUB_START_MODE_WANT_0042
     * @tc.name      sampleWantMatrix0042
     * @tc.desc      Want(startmode.singleton/SingletonAbility/viewData) 字段可读且值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantMatrix0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantMatrix0042 begin');
      const wantBundle: string = 'ohos.samples.startmode.singleton';
      const wantAbility: string = 'SingletonAbility';
      const wantAction: string = 'ohos.want.action.viewData';
      const wantUri: string = 'sample://demo/page?index=1';
      const wantType: string = 'application/json';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const bundleRead: string = want.bundleName ?? '';
      const abilityRead: string = want.abilityName ?? '';
      const actionRead: string = want.action ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 bundleRead=${bundleRead}`);
      expect(bundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 bundleRead.length=${bundleRead.length}`);
      expect(bundleRead.length).assertEqual(32);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 abilityRead=${abilityRead}`);
      expect(abilityRead).assertEqual(wantAbility);
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 actionRead=${actionRead}`);
      expect(actionRead).assertEqual(wantAction);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantMatrix0042 end');
    })

    /**
     * @tc.number    SUB_START_MODE_WANT_0043
     * @tc.name      sampleWantMatrix0043
     * @tc.desc      Want(startmode.singleton/SingletonAbility/sendData) 字段可读且值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantMatrix0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantMatrix0043 begin');
      const wantBundle: string = 'ohos.samples.startmode.singleton';
      const wantAbility: string = 'SingletonAbility';
      const wantAction: string = 'ohos.want.action.sendData';
      const wantUri: string = 'sample://demo';
      const wantType: string = '';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const bundleRead: string = want.bundleName ?? '';
      const abilityRead: string = want.abilityName ?? '';
      const actionRead: string = want.action ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 bundleRead=${bundleRead}`);
      expect(bundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 bundleRead.length=${bundleRead.length}`);
      expect(bundleRead.length).assertEqual(32);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 abilityRead=${abilityRead}`);
      expect(abilityRead).assertEqual(wantAbility);
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 actionRead=${actionRead}`);
      expect(actionRead).assertEqual(wantAction);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantMatrix0043 end');
    })

    /**
     * @tc.number    SUB_START_MODE_WANT_0044
     * @tc.name      sampleWantMatrix0044
     * @tc.desc      Want(startmode.singleton/SingletonAbility/空) 字段可读且值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantMatrix0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantMatrix0044 begin');
      const wantBundle: string = 'ohos.samples.startmode.singleton';
      const wantAbility: string = 'SingletonAbility';
      const wantAction: string = '';
      const wantUri: string = 'https://example.com/sample?from=test';
      const wantType: string = 'text/plain';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const bundleRead: string = want.bundleName ?? '';
      const abilityRead: string = want.abilityName ?? '';
      const actionRead: string = want.action ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 bundleRead=${bundleRead}`);
      expect(bundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 bundleRead.length=${bundleRead.length}`);
      expect(bundleRead.length).assertEqual(32);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 abilityRead=${abilityRead}`);
      expect(abilityRead).assertEqual(wantAbility);
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 actionRead=${actionRead}`);
      expect(actionRead).assertEqual(wantAction);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantMatrix0044 end');
    })

    /**
     * @tc.number    SUB_START_MODE_WANT_0045
     * @tc.name      sampleWantMatrix0045
     * @tc.desc      Want(startmode.singleton/SpecifiedAbility/home) 字段可读且值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantMatrix0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantMatrix0045 begin');
      const wantBundle: string = 'ohos.samples.startmode.singleton';
      const wantAbility: string = 'SpecifiedAbility';
      const wantAction: string = 'action.system.home';
      const wantUri: string = 'https://example.com/sample?from=test';
      const wantType: string = 'text/plain';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const bundleRead: string = want.bundleName ?? '';
      const abilityRead: string = want.abilityName ?? '';
      const actionRead: string = want.action ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 bundleRead=${bundleRead}`);
      expect(bundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 bundleRead.length=${bundleRead.length}`);
      expect(bundleRead.length).assertEqual(32);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 abilityRead=${abilityRead}`);
      expect(abilityRead).assertEqual(wantAbility);
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 actionRead=${actionRead}`);
      expect(actionRead).assertEqual(wantAction);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantMatrix0045 end');
    })

    /**
     * @tc.number    SUB_START_MODE_WANT_0046
     * @tc.name      sampleWantMatrix0046
     * @tc.desc      Want(startmode.singleton/SpecifiedAbility/viewData) 字段可读且值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantMatrix0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantMatrix0046 begin');
      const wantBundle: string = 'ohos.samples.startmode.singleton';
      const wantAbility: string = 'SpecifiedAbility';
      const wantAction: string = 'ohos.want.action.viewData';
      const wantUri: string = 'sample://demo/page?index=1';
      const wantType: string = 'application/json';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const bundleRead: string = want.bundleName ?? '';
      const abilityRead: string = want.abilityName ?? '';
      const actionRead: string = want.action ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 bundleRead=${bundleRead}`);
      expect(bundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 bundleRead.length=${bundleRead.length}`);
      expect(bundleRead.length).assertEqual(32);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 abilityRead=${abilityRead}`);
      expect(abilityRead).assertEqual(wantAbility);
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 actionRead=${actionRead}`);
      expect(actionRead).assertEqual(wantAction);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantMatrix0046 end');
    })

    /**
     * @tc.number    SUB_START_MODE_WANT_0047
     * @tc.name      sampleWantMatrix0047
     * @tc.desc      Want(startmode.singleton/SpecifiedAbility/sendData) 字段可读且值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantMatrix0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantMatrix0047 begin');
      const wantBundle: string = 'ohos.samples.startmode.singleton';
      const wantAbility: string = 'SpecifiedAbility';
      const wantAction: string = 'ohos.want.action.sendData';
      const wantUri: string = 'sample://demo';
      const wantType: string = '';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const bundleRead: string = want.bundleName ?? '';
      const abilityRead: string = want.abilityName ?? '';
      const actionRead: string = want.action ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 bundleRead=${bundleRead}`);
      expect(bundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 bundleRead.length=${bundleRead.length}`);
      expect(bundleRead.length).assertEqual(32);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 abilityRead=${abilityRead}`);
      expect(abilityRead).assertEqual(wantAbility);
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 actionRead=${actionRead}`);
      expect(actionRead).assertEqual(wantAction);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantMatrix0047 end');
    })

    /**
     * @tc.number    SUB_START_MODE_WANT_0048
     * @tc.name      sampleWantMatrix0048
     * @tc.desc      Want(startmode.singleton/SpecifiedAbility/空) 字段可读且值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantMatrix0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantMatrix0048 begin');
      const wantBundle: string = 'ohos.samples.startmode.singleton';
      const wantAbility: string = 'SpecifiedAbility';
      const wantAction: string = '';
      const wantUri: string = 'https://example.com/sample?from=test';
      const wantType: string = 'text/plain';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const bundleRead: string = want.bundleName ?? '';
      const abilityRead: string = want.abilityName ?? '';
      const actionRead: string = want.action ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 bundleRead=${bundleRead}`);
      expect(bundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 bundleRead.length=${bundleRead.length}`);
      expect(bundleRead.length).assertEqual(32);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 abilityRead=${abilityRead}`);
      expect(abilityRead).assertEqual(wantAbility);
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 actionRead=${actionRead}`);
      expect(actionRead).assertEqual(wantAction);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantMatrix0048 end');
    })
  })
}
