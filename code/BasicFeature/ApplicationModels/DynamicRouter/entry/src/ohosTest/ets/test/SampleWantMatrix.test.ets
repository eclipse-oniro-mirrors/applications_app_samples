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
const TAG: string = '[Sample_DynamicRouter]';

export default function sampleWantMatrixTest(): void {
  describe('SampleWantMatrixTest', () => {
    /**
     * @tc.number    SUB_DYNAMIC_ROUTER_WANT_0001
     * @tc.name      sampleWantMatrix0001
     * @tc.desc      Want(com.samples.navigation/EntryAbility/home) 字段可读且值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantMatrix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantMatrix0001 begin');
      const wantBundle: string = 'com.samples.navigation';
      const wantAbility: string = 'EntryAbility';
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
     * @tc.number    SUB_DYNAMIC_ROUTER_WANT_0002
     * @tc.name      sampleWantMatrix0002
     * @tc.desc      Want(com.samples.navigation/EntryAbility/viewData) 字段可读且值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantMatrix0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantMatrix0002 begin');
      const wantBundle: string = 'com.samples.navigation';
      const wantAbility: string = 'EntryAbility';
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
     * @tc.number    SUB_DYNAMIC_ROUTER_WANT_0003
     * @tc.name      sampleWantMatrix0003
     * @tc.desc      Want(com.samples.navigation/EntryAbility/sendData) 字段可读且值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantMatrix0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantMatrix0003 begin');
      const wantBundle: string = 'com.samples.navigation';
      const wantAbility: string = 'EntryAbility';
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
     * @tc.number    SUB_DYNAMIC_ROUTER_WANT_0004
     * @tc.name      sampleWantMatrix0004
     * @tc.desc      Want(com.samples.navigation/EntryAbility/空) 字段可读且值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantMatrix0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantMatrix0004 begin');
      const wantBundle: string = 'com.samples.navigation';
      const wantAbility: string = 'EntryAbility';
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
     * @tc.number    SUB_DYNAMIC_ROUTER_WANT_0005
     * @tc.name      sampleWantMatrix0005
     * @tc.desc      Want(com.samples.navigation.hara/EntryAbility/home) 字段可读且值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantMatrix0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantMatrix0005 begin');
      const wantBundle: string = 'com.samples.navigation.hara';
      const wantAbility: string = 'EntryAbility';
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
      expect(bundleRead.length).assertEqual(27);
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
     * @tc.number    SUB_DYNAMIC_ROUTER_WANT_0006
     * @tc.name      sampleWantMatrix0006
     * @tc.desc      Want(com.samples.navigation.hara/EntryAbility/viewData) 字段可读且值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantMatrix0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantMatrix0006 begin');
      const wantBundle: string = 'com.samples.navigation.hara';
      const wantAbility: string = 'EntryAbility';
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
      expect(bundleRead.length).assertEqual(27);
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
     * @tc.number    SUB_DYNAMIC_ROUTER_WANT_0007
     * @tc.name      sampleWantMatrix0007
     * @tc.desc      Want(com.samples.navigation.hara/EntryAbility/sendData) 字段可读且值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantMatrix0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantMatrix0007 begin');
      const wantBundle: string = 'com.samples.navigation.hara';
      const wantAbility: string = 'EntryAbility';
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
      expect(bundleRead.length).assertEqual(27);
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
     * @tc.number    SUB_DYNAMIC_ROUTER_WANT_0008
     * @tc.name      sampleWantMatrix0008
     * @tc.desc      Want(com.samples.navigation.hara/EntryAbility/空) 字段可读且值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantMatrix0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantMatrix0008 begin');
      const wantBundle: string = 'com.samples.navigation.hara';
      const wantAbility: string = 'EntryAbility';
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
      expect(bundleRead.length).assertEqual(27);
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
     * @tc.number    SUB_DYNAMIC_ROUTER_WANT_0009
     * @tc.name      sampleWantMatrix0009
     * @tc.desc      Want(com.samples.navigation.harb/EntryAbility/home) 字段可读且值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantMatrix0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantMatrix0009 begin');
      const wantBundle: string = 'com.samples.navigation.harb';
      const wantAbility: string = 'EntryAbility';
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
      expect(bundleRead.length).assertEqual(27);
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
     * @tc.number    SUB_DYNAMIC_ROUTER_WANT_0010
     * @tc.name      sampleWantMatrix0010
     * @tc.desc      Want(com.samples.navigation.harb/EntryAbility/viewData) 字段可读且值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantMatrix0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantMatrix0010 begin');
      const wantBundle: string = 'com.samples.navigation.harb';
      const wantAbility: string = 'EntryAbility';
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
      expect(bundleRead.length).assertEqual(27);
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
     * @tc.number    SUB_DYNAMIC_ROUTER_WANT_0011
     * @tc.name      sampleWantMatrix0011
     * @tc.desc      Want(com.samples.navigation.harb/EntryAbility/sendData) 字段可读且值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantMatrix0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantMatrix0011 begin');
      const wantBundle: string = 'com.samples.navigation.harb';
      const wantAbility: string = 'EntryAbility';
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
      expect(bundleRead.length).assertEqual(27);
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
     * @tc.number    SUB_DYNAMIC_ROUTER_WANT_0012
     * @tc.name      sampleWantMatrix0012
     * @tc.desc      Want(com.samples.navigation.harb/EntryAbility/空) 字段可读且值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantMatrix0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantMatrix0012 begin');
      const wantBundle: string = 'com.samples.navigation.harb';
      const wantAbility: string = 'EntryAbility';
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
      expect(bundleRead.length).assertEqual(27);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 abilityRead=${abilityRead}`);
      expect(abilityRead).assertEqual(wantAbility);
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 actionRead=${actionRead}`);
      expect(actionRead).assertEqual(wantAction);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantMatrix0012 end');
    })
  })
}
