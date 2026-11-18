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
const TAG: string = '[Sample_OAID]';

export default function oaidWantMatrixCoreTest(): void {
  describe('OaidWantMatrixCoreTest', () => {
    /**
     * @tc.number    SUB_OAID_WANT_0001
     * @tc.name      oaidWantMatrix0001
     * @tc.desc      Want(bundle=com.samples.oaid, ability=EntryAbility, action=action.system.home) 字段可读且值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantMatrix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantMatrix0001 begin');
      const wantBundle: string = 'com.samples.oaid';
      const wantAbility: string = 'EntryAbility';
      const wantAction: string = 'action.system.home';
      const wantUri: string = 'oaid://samples/page';
      const wantType: string = 'text/plain';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const wantBundleRead: string = want.bundleName ?? '';
      const wantAbilityRead: string = want.abilityName ?? '';
      const wantActionRead: string = want.action ?? '';
      const wantUriRead: string = want.uri ?? '';
      const wantTypeRead: string = want.type ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 wantBundleRead=${wantBundleRead}`);
      expect(wantBundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 wantBundleRead.length=${wantBundleRead.length}`);
      expect(wantBundleRead.length).assertEqual(16);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 wantAbilityRead=${wantAbilityRead}`);
      expect(wantAbilityRead).assertEqual(wantAbility);
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 wantActionRead=${wantActionRead}`);
      expect(wantActionRead).assertEqual(wantAction);
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 wantUriRead=${wantUriRead}`);
      expect(wantUriRead).assertEqual(wantUri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a6 wantTypeRead=${wantTypeRead}`);
      expect(wantTypeRead).assertEqual(wantType);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantMatrix0001 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_0002
     * @tc.name      oaidWantMatrix0002
     * @tc.desc      Want(bundle=com.samples.oaid, ability=EntryAbility, action=ohos.want.action.viewData) 字段可读且值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantMatrix0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantMatrix0002 begin');
      const wantBundle: string = 'com.samples.oaid';
      const wantAbility: string = 'EntryAbility';
      const wantAction: string = 'ohos.want.action.viewData';
      const wantUri: string = 'https://example.com/oaid?from=test';
      const wantType: string = 'application/json';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const wantBundleRead: string = want.bundleName ?? '';
      const wantAbilityRead: string = want.abilityName ?? '';
      const wantActionRead: string = want.action ?? '';
      const wantUriRead: string = want.uri ?? '';
      const wantTypeRead: string = want.type ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 wantBundleRead=${wantBundleRead}`);
      expect(wantBundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 wantBundleRead.length=${wantBundleRead.length}`);
      expect(wantBundleRead.length).assertEqual(16);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 wantAbilityRead=${wantAbilityRead}`);
      expect(wantAbilityRead).assertEqual(wantAbility);
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 wantActionRead=${wantActionRead}`);
      expect(wantActionRead).assertEqual(wantAction);
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 wantUriRead=${wantUriRead}`);
      expect(wantUriRead).assertEqual(wantUri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a6 wantTypeRead=${wantTypeRead}`);
      expect(wantTypeRead).assertEqual(wantType);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantMatrix0002 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_0003
     * @tc.name      oaidWantMatrix0003
     * @tc.desc      Want(bundle=com.samples.oaid, ability=EntryAbility, action=ohos.want.action.sendData) 字段可读且值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantMatrix0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantMatrix0003 begin');
      const wantBundle: string = 'com.samples.oaid';
      const wantAbility: string = 'EntryAbility';
      const wantAction: string = 'ohos.want.action.sendData';
      const wantUri: string = 'oaid://samples';
      const wantType: string = '';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const wantBundleRead: string = want.bundleName ?? '';
      const wantAbilityRead: string = want.abilityName ?? '';
      const wantActionRead: string = want.action ?? '';
      const wantUriRead: string = want.uri ?? '';
      const wantTypeRead: string = want.type ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 wantBundleRead=${wantBundleRead}`);
      expect(wantBundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 wantBundleRead.length=${wantBundleRead.length}`);
      expect(wantBundleRead.length).assertEqual(16);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 wantAbilityRead=${wantAbilityRead}`);
      expect(wantAbilityRead).assertEqual(wantAbility);
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 wantActionRead=${wantActionRead}`);
      expect(wantActionRead).assertEqual(wantAction);
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 wantUriRead=${wantUriRead}`);
      expect(wantUriRead).assertEqual(wantUri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a6 wantTypeRead=${wantTypeRead}`);
      expect(wantTypeRead).assertEqual(wantType);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantMatrix0003 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_0004
     * @tc.name      oaidWantMatrix0004
     * @tc.desc      Want(bundle=com.samples.oaid, ability=EntryAbility, action=空) 字段可读且值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantMatrix0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantMatrix0004 begin');
      const wantBundle: string = 'com.samples.oaid';
      const wantAbility: string = 'EntryAbility';
      const wantAction: string = '';
      const wantUri: string = 'oaid://samples/page';
      const wantType: string = 'text/plain';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const wantBundleRead: string = want.bundleName ?? '';
      const wantAbilityRead: string = want.abilityName ?? '';
      const wantActionRead: string = want.action ?? '';
      const wantUriRead: string = want.uri ?? '';
      const wantTypeRead: string = want.type ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 wantBundleRead=${wantBundleRead}`);
      expect(wantBundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 wantBundleRead.length=${wantBundleRead.length}`);
      expect(wantBundleRead.length).assertEqual(16);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 wantAbilityRead=${wantAbilityRead}`);
      expect(wantAbilityRead).assertEqual(wantAbility);
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 wantActionRead=${wantActionRead}`);
      expect(wantActionRead).assertEqual(wantAction);
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 wantUriRead=${wantUriRead}`);
      expect(wantUriRead).assertEqual(wantUri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a6 wantTypeRead=${wantTypeRead}`);
      expect(wantTypeRead).assertEqual(wantType);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantMatrix0004 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_0005
     * @tc.name      oaidWantMatrix0005
     * @tc.desc      Want(bundle=com.samples.oaid, ability=MainAbility, action=action.system.home) 字段可读且值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantMatrix0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantMatrix0005 begin');
      const wantBundle: string = 'com.samples.oaid';
      const wantAbility: string = 'MainAbility';
      const wantAction: string = 'action.system.home';
      const wantUri: string = 'https://example.com/oaid?from=test';
      const wantType: string = 'text/plain';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const wantBundleRead: string = want.bundleName ?? '';
      const wantAbilityRead: string = want.abilityName ?? '';
      const wantActionRead: string = want.action ?? '';
      const wantUriRead: string = want.uri ?? '';
      const wantTypeRead: string = want.type ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 wantBundleRead=${wantBundleRead}`);
      expect(wantBundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 wantBundleRead.length=${wantBundleRead.length}`);
      expect(wantBundleRead.length).assertEqual(16);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 wantAbilityRead=${wantAbilityRead}`);
      expect(wantAbilityRead).assertEqual(wantAbility);
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 wantActionRead=${wantActionRead}`);
      expect(wantActionRead).assertEqual(wantAction);
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 wantUriRead=${wantUriRead}`);
      expect(wantUriRead).assertEqual(wantUri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a6 wantTypeRead=${wantTypeRead}`);
      expect(wantTypeRead).assertEqual(wantType);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantMatrix0005 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_0006
     * @tc.name      oaidWantMatrix0006
     * @tc.desc      Want(bundle=com.samples.oaid, ability=MainAbility, action=ohos.want.action.viewData) 字段可读且值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantMatrix0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantMatrix0006 begin');
      const wantBundle: string = 'com.samples.oaid';
      const wantAbility: string = 'MainAbility';
      const wantAction: string = 'ohos.want.action.viewData';
      const wantUri: string = 'oaid://samples';
      const wantType: string = 'application/json';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const wantBundleRead: string = want.bundleName ?? '';
      const wantAbilityRead: string = want.abilityName ?? '';
      const wantActionRead: string = want.action ?? '';
      const wantUriRead: string = want.uri ?? '';
      const wantTypeRead: string = want.type ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 wantBundleRead=${wantBundleRead}`);
      expect(wantBundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 wantBundleRead.length=${wantBundleRead.length}`);
      expect(wantBundleRead.length).assertEqual(16);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 wantAbilityRead=${wantAbilityRead}`);
      expect(wantAbilityRead).assertEqual(wantAbility);
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 wantActionRead=${wantActionRead}`);
      expect(wantActionRead).assertEqual(wantAction);
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 wantUriRead=${wantUriRead}`);
      expect(wantUriRead).assertEqual(wantUri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a6 wantTypeRead=${wantTypeRead}`);
      expect(wantTypeRead).assertEqual(wantType);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantMatrix0006 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_0007
     * @tc.name      oaidWantMatrix0007
     * @tc.desc      Want(bundle=com.samples.oaid, ability=MainAbility, action=ohos.want.action.sendData) 字段可读且值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantMatrix0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantMatrix0007 begin');
      const wantBundle: string = 'com.samples.oaid';
      const wantAbility: string = 'MainAbility';
      const wantAction: string = 'ohos.want.action.sendData';
      const wantUri: string = 'oaid://samples/page';
      const wantType: string = '';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const wantBundleRead: string = want.bundleName ?? '';
      const wantAbilityRead: string = want.abilityName ?? '';
      const wantActionRead: string = want.action ?? '';
      const wantUriRead: string = want.uri ?? '';
      const wantTypeRead: string = want.type ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 wantBundleRead=${wantBundleRead}`);
      expect(wantBundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 wantBundleRead.length=${wantBundleRead.length}`);
      expect(wantBundleRead.length).assertEqual(16);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 wantAbilityRead=${wantAbilityRead}`);
      expect(wantAbilityRead).assertEqual(wantAbility);
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 wantActionRead=${wantActionRead}`);
      expect(wantActionRead).assertEqual(wantAction);
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 wantUriRead=${wantUriRead}`);
      expect(wantUriRead).assertEqual(wantUri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a6 wantTypeRead=${wantTypeRead}`);
      expect(wantTypeRead).assertEqual(wantType);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantMatrix0007 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_0008
     * @tc.name      oaidWantMatrix0008
     * @tc.desc      Want(bundle=com.samples.oaid, ability=MainAbility, action=空) 字段可读且值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantMatrix0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantMatrix0008 begin');
      const wantBundle: string = 'com.samples.oaid';
      const wantAbility: string = 'MainAbility';
      const wantAction: string = '';
      const wantUri: string = 'https://example.com/oaid?from=test';
      const wantType: string = 'text/plain';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const wantBundleRead: string = want.bundleName ?? '';
      const wantAbilityRead: string = want.abilityName ?? '';
      const wantActionRead: string = want.action ?? '';
      const wantUriRead: string = want.uri ?? '';
      const wantTypeRead: string = want.type ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 wantBundleRead=${wantBundleRead}`);
      expect(wantBundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 wantBundleRead.length=${wantBundleRead.length}`);
      expect(wantBundleRead.length).assertEqual(16);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 wantAbilityRead=${wantAbilityRead}`);
      expect(wantAbilityRead).assertEqual(wantAbility);
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 wantActionRead=${wantActionRead}`);
      expect(wantActionRead).assertEqual(wantAction);
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 wantUriRead=${wantUriRead}`);
      expect(wantUriRead).assertEqual(wantUri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a6 wantTypeRead=${wantTypeRead}`);
      expect(wantTypeRead).assertEqual(wantType);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantMatrix0008 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_0009
     * @tc.name      oaidWantMatrix0009
     * @tc.desc      Want(bundle=com.samples.oaid, ability=TestAbility, action=action.system.home) 字段可读且值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantMatrix0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantMatrix0009 begin');
      const wantBundle: string = 'com.samples.oaid';
      const wantAbility: string = 'TestAbility';
      const wantAction: string = 'action.system.home';
      const wantUri: string = 'oaid://samples';
      const wantType: string = 'text/plain';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const wantBundleRead: string = want.bundleName ?? '';
      const wantAbilityRead: string = want.abilityName ?? '';
      const wantActionRead: string = want.action ?? '';
      const wantUriRead: string = want.uri ?? '';
      const wantTypeRead: string = want.type ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 wantBundleRead=${wantBundleRead}`);
      expect(wantBundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 wantBundleRead.length=${wantBundleRead.length}`);
      expect(wantBundleRead.length).assertEqual(16);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 wantAbilityRead=${wantAbilityRead}`);
      expect(wantAbilityRead).assertEqual(wantAbility);
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 wantActionRead=${wantActionRead}`);
      expect(wantActionRead).assertEqual(wantAction);
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 wantUriRead=${wantUriRead}`);
      expect(wantUriRead).assertEqual(wantUri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a6 wantTypeRead=${wantTypeRead}`);
      expect(wantTypeRead).assertEqual(wantType);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantMatrix0009 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_0010
     * @tc.name      oaidWantMatrix0010
     * @tc.desc      Want(bundle=com.samples.oaid, ability=TestAbility, action=ohos.want.action.viewData) 字段可读且值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantMatrix0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantMatrix0010 begin');
      const wantBundle: string = 'com.samples.oaid';
      const wantAbility: string = 'TestAbility';
      const wantAction: string = 'ohos.want.action.viewData';
      const wantUri: string = 'oaid://samples/page';
      const wantType: string = 'application/json';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const wantBundleRead: string = want.bundleName ?? '';
      const wantAbilityRead: string = want.abilityName ?? '';
      const wantActionRead: string = want.action ?? '';
      const wantUriRead: string = want.uri ?? '';
      const wantTypeRead: string = want.type ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 wantBundleRead=${wantBundleRead}`);
      expect(wantBundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 wantBundleRead.length=${wantBundleRead.length}`);
      expect(wantBundleRead.length).assertEqual(16);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 wantAbilityRead=${wantAbilityRead}`);
      expect(wantAbilityRead).assertEqual(wantAbility);
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 wantActionRead=${wantActionRead}`);
      expect(wantActionRead).assertEqual(wantAction);
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 wantUriRead=${wantUriRead}`);
      expect(wantUriRead).assertEqual(wantUri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a6 wantTypeRead=${wantTypeRead}`);
      expect(wantTypeRead).assertEqual(wantType);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantMatrix0010 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_0011
     * @tc.name      oaidWantMatrix0011
     * @tc.desc      Want(bundle=com.samples.oaid, ability=TestAbility, action=ohos.want.action.sendData) 字段可读且值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantMatrix0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantMatrix0011 begin');
      const wantBundle: string = 'com.samples.oaid';
      const wantAbility: string = 'TestAbility';
      const wantAction: string = 'ohos.want.action.sendData';
      const wantUri: string = 'https://example.com/oaid?from=test';
      const wantType: string = '';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const wantBundleRead: string = want.bundleName ?? '';
      const wantAbilityRead: string = want.abilityName ?? '';
      const wantActionRead: string = want.action ?? '';
      const wantUriRead: string = want.uri ?? '';
      const wantTypeRead: string = want.type ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 wantBundleRead=${wantBundleRead}`);
      expect(wantBundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 wantBundleRead.length=${wantBundleRead.length}`);
      expect(wantBundleRead.length).assertEqual(16);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 wantAbilityRead=${wantAbilityRead}`);
      expect(wantAbilityRead).assertEqual(wantAbility);
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 wantActionRead=${wantActionRead}`);
      expect(wantActionRead).assertEqual(wantAction);
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 wantUriRead=${wantUriRead}`);
      expect(wantUriRead).assertEqual(wantUri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a6 wantTypeRead=${wantTypeRead}`);
      expect(wantTypeRead).assertEqual(wantType);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantMatrix0011 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_0012
     * @tc.name      oaidWantMatrix0012
     * @tc.desc      Want(bundle=com.samples.oaid, ability=TestAbility, action=空) 字段可读且值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantMatrix0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantMatrix0012 begin');
      const wantBundle: string = 'com.samples.oaid';
      const wantAbility: string = 'TestAbility';
      const wantAction: string = '';
      const wantUri: string = 'oaid://samples';
      const wantType: string = 'text/plain';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const wantBundleRead: string = want.bundleName ?? '';
      const wantAbilityRead: string = want.abilityName ?? '';
      const wantActionRead: string = want.action ?? '';
      const wantUriRead: string = want.uri ?? '';
      const wantTypeRead: string = want.type ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 wantBundleRead=${wantBundleRead}`);
      expect(wantBundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 wantBundleRead.length=${wantBundleRead.length}`);
      expect(wantBundleRead.length).assertEqual(16);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 wantAbilityRead=${wantAbilityRead}`);
      expect(wantAbilityRead).assertEqual(wantAbility);
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 wantActionRead=${wantActionRead}`);
      expect(wantActionRead).assertEqual(wantAction);
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 wantUriRead=${wantUriRead}`);
      expect(wantUriRead).assertEqual(wantUri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a6 wantTypeRead=${wantTypeRead}`);
      expect(wantTypeRead).assertEqual(wantType);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantMatrix0012 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_0013
     * @tc.name      oaidWantMatrix0013
     * @tc.desc      Want(bundle=com.samples.oaid, ability=A, action=action.system.home) 字段可读且值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantMatrix0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantMatrix0013 begin');
      const wantBundle: string = 'com.samples.oaid';
      const wantAbility: string = 'A';
      const wantAction: string = 'action.system.home';
      const wantUri: string = 'oaid://samples/page';
      const wantType: string = 'text/plain';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const wantBundleRead: string = want.bundleName ?? '';
      const wantAbilityRead: string = want.abilityName ?? '';
      const wantActionRead: string = want.action ?? '';
      const wantUriRead: string = want.uri ?? '';
      const wantTypeRead: string = want.type ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 wantBundleRead=${wantBundleRead}`);
      expect(wantBundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 wantBundleRead.length=${wantBundleRead.length}`);
      expect(wantBundleRead.length).assertEqual(16);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 wantAbilityRead=${wantAbilityRead}`);
      expect(wantAbilityRead).assertEqual(wantAbility);
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 wantActionRead=${wantActionRead}`);
      expect(wantActionRead).assertEqual(wantAction);
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 wantUriRead=${wantUriRead}`);
      expect(wantUriRead).assertEqual(wantUri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a6 wantTypeRead=${wantTypeRead}`);
      expect(wantTypeRead).assertEqual(wantType);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantMatrix0013 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_0014
     * @tc.name      oaidWantMatrix0014
     * @tc.desc      Want(bundle=com.samples.oaid, ability=A, action=ohos.want.action.viewData) 字段可读且值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantMatrix0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantMatrix0014 begin');
      const wantBundle: string = 'com.samples.oaid';
      const wantAbility: string = 'A';
      const wantAction: string = 'ohos.want.action.viewData';
      const wantUri: string = 'https://example.com/oaid?from=test';
      const wantType: string = 'application/json';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const wantBundleRead: string = want.bundleName ?? '';
      const wantAbilityRead: string = want.abilityName ?? '';
      const wantActionRead: string = want.action ?? '';
      const wantUriRead: string = want.uri ?? '';
      const wantTypeRead: string = want.type ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 wantBundleRead=${wantBundleRead}`);
      expect(wantBundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 wantBundleRead.length=${wantBundleRead.length}`);
      expect(wantBundleRead.length).assertEqual(16);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 wantAbilityRead=${wantAbilityRead}`);
      expect(wantAbilityRead).assertEqual(wantAbility);
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 wantActionRead=${wantActionRead}`);
      expect(wantActionRead).assertEqual(wantAction);
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 wantUriRead=${wantUriRead}`);
      expect(wantUriRead).assertEqual(wantUri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a6 wantTypeRead=${wantTypeRead}`);
      expect(wantTypeRead).assertEqual(wantType);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantMatrix0014 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_0015
     * @tc.name      oaidWantMatrix0015
     * @tc.desc      Want(bundle=com.samples.oaid, ability=A, action=ohos.want.action.sendData) 字段可读且值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantMatrix0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantMatrix0015 begin');
      const wantBundle: string = 'com.samples.oaid';
      const wantAbility: string = 'A';
      const wantAction: string = 'ohos.want.action.sendData';
      const wantUri: string = 'oaid://samples';
      const wantType: string = '';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const wantBundleRead: string = want.bundleName ?? '';
      const wantAbilityRead: string = want.abilityName ?? '';
      const wantActionRead: string = want.action ?? '';
      const wantUriRead: string = want.uri ?? '';
      const wantTypeRead: string = want.type ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 wantBundleRead=${wantBundleRead}`);
      expect(wantBundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 wantBundleRead.length=${wantBundleRead.length}`);
      expect(wantBundleRead.length).assertEqual(16);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 wantAbilityRead=${wantAbilityRead}`);
      expect(wantAbilityRead).assertEqual(wantAbility);
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 wantActionRead=${wantActionRead}`);
      expect(wantActionRead).assertEqual(wantAction);
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 wantUriRead=${wantUriRead}`);
      expect(wantUriRead).assertEqual(wantUri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a6 wantTypeRead=${wantTypeRead}`);
      expect(wantTypeRead).assertEqual(wantType);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantMatrix0015 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_0016
     * @tc.name      oaidWantMatrix0016
     * @tc.desc      Want(bundle=com.samples.oaid, ability=A, action=空) 字段可读且值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantMatrix0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantMatrix0016 begin');
      const wantBundle: string = 'com.samples.oaid';
      const wantAbility: string = 'A';
      const wantAction: string = '';
      const wantUri: string = 'oaid://samples/page';
      const wantType: string = 'text/plain';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const wantBundleRead: string = want.bundleName ?? '';
      const wantAbilityRead: string = want.abilityName ?? '';
      const wantActionRead: string = want.action ?? '';
      const wantUriRead: string = want.uri ?? '';
      const wantTypeRead: string = want.type ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 wantBundleRead=${wantBundleRead}`);
      expect(wantBundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 wantBundleRead.length=${wantBundleRead.length}`);
      expect(wantBundleRead.length).assertEqual(16);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 wantAbilityRead=${wantAbilityRead}`);
      expect(wantAbilityRead).assertEqual(wantAbility);
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 wantActionRead=${wantActionRead}`);
      expect(wantActionRead).assertEqual(wantAction);
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 wantUriRead=${wantUriRead}`);
      expect(wantUriRead).assertEqual(wantUri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a6 wantTypeRead=${wantTypeRead}`);
      expect(wantTypeRead).assertEqual(wantType);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantMatrix0016 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_0017
     * @tc.name      oaidWantMatrix0017
     * @tc.desc      Want(bundle=com.samples.oaid.test, ability=EntryAbility, action=action.system.home) 字段可读且值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantMatrix0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantMatrix0017 begin');
      const wantBundle: string = 'com.samples.oaid.test';
      const wantAbility: string = 'EntryAbility';
      const wantAction: string = 'action.system.home';
      const wantUri: string = 'https://example.com/oaid?from=test';
      const wantType: string = 'application/json';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const wantBundleRead: string = want.bundleName ?? '';
      const wantAbilityRead: string = want.abilityName ?? '';
      const wantActionRead: string = want.action ?? '';
      const wantUriRead: string = want.uri ?? '';
      const wantTypeRead: string = want.type ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 wantBundleRead=${wantBundleRead}`);
      expect(wantBundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 wantBundleRead.length=${wantBundleRead.length}`);
      expect(wantBundleRead.length).assertEqual(21);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 wantAbilityRead=${wantAbilityRead}`);
      expect(wantAbilityRead).assertEqual(wantAbility);
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 wantActionRead=${wantActionRead}`);
      expect(wantActionRead).assertEqual(wantAction);
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 wantUriRead=${wantUriRead}`);
      expect(wantUriRead).assertEqual(wantUri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a6 wantTypeRead=${wantTypeRead}`);
      expect(wantTypeRead).assertEqual(wantType);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantMatrix0017 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_0018
     * @tc.name      oaidWantMatrix0018
     * @tc.desc      Want(bundle=com.samples.oaid.test, ability=EntryAbility, action=ohos.want.action.viewData) 字段可读且值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantMatrix0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantMatrix0018 begin');
      const wantBundle: string = 'com.samples.oaid.test';
      const wantAbility: string = 'EntryAbility';
      const wantAction: string = 'ohos.want.action.viewData';
      const wantUri: string = 'oaid://samples';
      const wantType: string = '';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const wantBundleRead: string = want.bundleName ?? '';
      const wantAbilityRead: string = want.abilityName ?? '';
      const wantActionRead: string = want.action ?? '';
      const wantUriRead: string = want.uri ?? '';
      const wantTypeRead: string = want.type ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 wantBundleRead=${wantBundleRead}`);
      expect(wantBundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 wantBundleRead.length=${wantBundleRead.length}`);
      expect(wantBundleRead.length).assertEqual(21);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 wantAbilityRead=${wantAbilityRead}`);
      expect(wantAbilityRead).assertEqual(wantAbility);
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 wantActionRead=${wantActionRead}`);
      expect(wantActionRead).assertEqual(wantAction);
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 wantUriRead=${wantUriRead}`);
      expect(wantUriRead).assertEqual(wantUri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a6 wantTypeRead=${wantTypeRead}`);
      expect(wantTypeRead).assertEqual(wantType);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantMatrix0018 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_0019
     * @tc.name      oaidWantMatrix0019
     * @tc.desc      Want(bundle=com.samples.oaid.test, ability=EntryAbility, action=ohos.want.action.sendData) 字段可读且值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantMatrix0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantMatrix0019 begin');
      const wantBundle: string = 'com.samples.oaid.test';
      const wantAbility: string = 'EntryAbility';
      const wantAction: string = 'ohos.want.action.sendData';
      const wantUri: string = 'oaid://samples/page';
      const wantType: string = 'text/plain';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const wantBundleRead: string = want.bundleName ?? '';
      const wantAbilityRead: string = want.abilityName ?? '';
      const wantActionRead: string = want.action ?? '';
      const wantUriRead: string = want.uri ?? '';
      const wantTypeRead: string = want.type ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 wantBundleRead=${wantBundleRead}`);
      expect(wantBundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 wantBundleRead.length=${wantBundleRead.length}`);
      expect(wantBundleRead.length).assertEqual(21);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 wantAbilityRead=${wantAbilityRead}`);
      expect(wantAbilityRead).assertEqual(wantAbility);
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 wantActionRead=${wantActionRead}`);
      expect(wantActionRead).assertEqual(wantAction);
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 wantUriRead=${wantUriRead}`);
      expect(wantUriRead).assertEqual(wantUri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a6 wantTypeRead=${wantTypeRead}`);
      expect(wantTypeRead).assertEqual(wantType);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantMatrix0019 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_0020
     * @tc.name      oaidWantMatrix0020
     * @tc.desc      Want(bundle=com.samples.oaid.test, ability=EntryAbility, action=空) 字段可读且值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantMatrix0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantMatrix0020 begin');
      const wantBundle: string = 'com.samples.oaid.test';
      const wantAbility: string = 'EntryAbility';
      const wantAction: string = '';
      const wantUri: string = 'https://example.com/oaid?from=test';
      const wantType: string = 'application/json';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const wantBundleRead: string = want.bundleName ?? '';
      const wantAbilityRead: string = want.abilityName ?? '';
      const wantActionRead: string = want.action ?? '';
      const wantUriRead: string = want.uri ?? '';
      const wantTypeRead: string = want.type ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 wantBundleRead=${wantBundleRead}`);
      expect(wantBundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 wantBundleRead.length=${wantBundleRead.length}`);
      expect(wantBundleRead.length).assertEqual(21);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 wantAbilityRead=${wantAbilityRead}`);
      expect(wantAbilityRead).assertEqual(wantAbility);
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 wantActionRead=${wantActionRead}`);
      expect(wantActionRead).assertEqual(wantAction);
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 wantUriRead=${wantUriRead}`);
      expect(wantUriRead).assertEqual(wantUri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a6 wantTypeRead=${wantTypeRead}`);
      expect(wantTypeRead).assertEqual(wantType);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantMatrix0020 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_0021
     * @tc.name      oaidWantMatrix0021
     * @tc.desc      Want(bundle=com.samples.oaid.test, ability=MainAbility, action=action.system.home) 字段可读且值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantMatrix0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantMatrix0021 begin');
      const wantBundle: string = 'com.samples.oaid.test';
      const wantAbility: string = 'MainAbility';
      const wantAction: string = 'action.system.home';
      const wantUri: string = 'oaid://samples';
      const wantType: string = 'application/json';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const wantBundleRead: string = want.bundleName ?? '';
      const wantAbilityRead: string = want.abilityName ?? '';
      const wantActionRead: string = want.action ?? '';
      const wantUriRead: string = want.uri ?? '';
      const wantTypeRead: string = want.type ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 wantBundleRead=${wantBundleRead}`);
      expect(wantBundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 wantBundleRead.length=${wantBundleRead.length}`);
      expect(wantBundleRead.length).assertEqual(21);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 wantAbilityRead=${wantAbilityRead}`);
      expect(wantAbilityRead).assertEqual(wantAbility);
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 wantActionRead=${wantActionRead}`);
      expect(wantActionRead).assertEqual(wantAction);
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 wantUriRead=${wantUriRead}`);
      expect(wantUriRead).assertEqual(wantUri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a6 wantTypeRead=${wantTypeRead}`);
      expect(wantTypeRead).assertEqual(wantType);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantMatrix0021 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_0022
     * @tc.name      oaidWantMatrix0022
     * @tc.desc      Want(bundle=com.samples.oaid.test, ability=MainAbility, action=ohos.want.action.viewData) 字段可读且值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantMatrix0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantMatrix0022 begin');
      const wantBundle: string = 'com.samples.oaid.test';
      const wantAbility: string = 'MainAbility';
      const wantAction: string = 'ohos.want.action.viewData';
      const wantUri: string = 'oaid://samples/page';
      const wantType: string = '';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const wantBundleRead: string = want.bundleName ?? '';
      const wantAbilityRead: string = want.abilityName ?? '';
      const wantActionRead: string = want.action ?? '';
      const wantUriRead: string = want.uri ?? '';
      const wantTypeRead: string = want.type ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 wantBundleRead=${wantBundleRead}`);
      expect(wantBundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 wantBundleRead.length=${wantBundleRead.length}`);
      expect(wantBundleRead.length).assertEqual(21);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 wantAbilityRead=${wantAbilityRead}`);
      expect(wantAbilityRead).assertEqual(wantAbility);
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 wantActionRead=${wantActionRead}`);
      expect(wantActionRead).assertEqual(wantAction);
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 wantUriRead=${wantUriRead}`);
      expect(wantUriRead).assertEqual(wantUri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a6 wantTypeRead=${wantTypeRead}`);
      expect(wantTypeRead).assertEqual(wantType);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantMatrix0022 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_0023
     * @tc.name      oaidWantMatrix0023
     * @tc.desc      Want(bundle=com.samples.oaid.test, ability=MainAbility, action=ohos.want.action.sendData) 字段可读且值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantMatrix0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantMatrix0023 begin');
      const wantBundle: string = 'com.samples.oaid.test';
      const wantAbility: string = 'MainAbility';
      const wantAction: string = 'ohos.want.action.sendData';
      const wantUri: string = 'https://example.com/oaid?from=test';
      const wantType: string = 'text/plain';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const wantBundleRead: string = want.bundleName ?? '';
      const wantAbilityRead: string = want.abilityName ?? '';
      const wantActionRead: string = want.action ?? '';
      const wantUriRead: string = want.uri ?? '';
      const wantTypeRead: string = want.type ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 wantBundleRead=${wantBundleRead}`);
      expect(wantBundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 wantBundleRead.length=${wantBundleRead.length}`);
      expect(wantBundleRead.length).assertEqual(21);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 wantAbilityRead=${wantAbilityRead}`);
      expect(wantAbilityRead).assertEqual(wantAbility);
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 wantActionRead=${wantActionRead}`);
      expect(wantActionRead).assertEqual(wantAction);
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 wantUriRead=${wantUriRead}`);
      expect(wantUriRead).assertEqual(wantUri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a6 wantTypeRead=${wantTypeRead}`);
      expect(wantTypeRead).assertEqual(wantType);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantMatrix0023 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_0024
     * @tc.name      oaidWantMatrix0024
     * @tc.desc      Want(bundle=com.samples.oaid.test, ability=MainAbility, action=空) 字段可读且值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantMatrix0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantMatrix0024 begin');
      const wantBundle: string = 'com.samples.oaid.test';
      const wantAbility: string = 'MainAbility';
      const wantAction: string = '';
      const wantUri: string = 'oaid://samples';
      const wantType: string = 'application/json';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const wantBundleRead: string = want.bundleName ?? '';
      const wantAbilityRead: string = want.abilityName ?? '';
      const wantActionRead: string = want.action ?? '';
      const wantUriRead: string = want.uri ?? '';
      const wantTypeRead: string = want.type ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 wantBundleRead=${wantBundleRead}`);
      expect(wantBundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 wantBundleRead.length=${wantBundleRead.length}`);
      expect(wantBundleRead.length).assertEqual(21);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 wantAbilityRead=${wantAbilityRead}`);
      expect(wantAbilityRead).assertEqual(wantAbility);
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 wantActionRead=${wantActionRead}`);
      expect(wantActionRead).assertEqual(wantAction);
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 wantUriRead=${wantUriRead}`);
      expect(wantUriRead).assertEqual(wantUri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a6 wantTypeRead=${wantTypeRead}`);
      expect(wantTypeRead).assertEqual(wantType);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantMatrix0024 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_0025
     * @tc.name      oaidWantMatrix0025
     * @tc.desc      Want(bundle=com.samples.oaid.test, ability=TestAbility, action=action.system.home) 字段可读且值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantMatrix0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantMatrix0025 begin');
      const wantBundle: string = 'com.samples.oaid.test';
      const wantAbility: string = 'TestAbility';
      const wantAction: string = 'action.system.home';
      const wantUri: string = 'oaid://samples/page';
      const wantType: string = 'application/json';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const wantBundleRead: string = want.bundleName ?? '';
      const wantAbilityRead: string = want.abilityName ?? '';
      const wantActionRead: string = want.action ?? '';
      const wantUriRead: string = want.uri ?? '';
      const wantTypeRead: string = want.type ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 wantBundleRead=${wantBundleRead}`);
      expect(wantBundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 wantBundleRead.length=${wantBundleRead.length}`);
      expect(wantBundleRead.length).assertEqual(21);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 wantAbilityRead=${wantAbilityRead}`);
      expect(wantAbilityRead).assertEqual(wantAbility);
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 wantActionRead=${wantActionRead}`);
      expect(wantActionRead).assertEqual(wantAction);
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 wantUriRead=${wantUriRead}`);
      expect(wantUriRead).assertEqual(wantUri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a6 wantTypeRead=${wantTypeRead}`);
      expect(wantTypeRead).assertEqual(wantType);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantMatrix0025 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_0026
     * @tc.name      oaidWantMatrix0026
     * @tc.desc      Want(bundle=com.samples.oaid.test, ability=TestAbility, action=ohos.want.action.viewData) 字段可读且值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantMatrix0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantMatrix0026 begin');
      const wantBundle: string = 'com.samples.oaid.test';
      const wantAbility: string = 'TestAbility';
      const wantAction: string = 'ohos.want.action.viewData';
      const wantUri: string = 'https://example.com/oaid?from=test';
      const wantType: string = '';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const wantBundleRead: string = want.bundleName ?? '';
      const wantAbilityRead: string = want.abilityName ?? '';
      const wantActionRead: string = want.action ?? '';
      const wantUriRead: string = want.uri ?? '';
      const wantTypeRead: string = want.type ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 wantBundleRead=${wantBundleRead}`);
      expect(wantBundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 wantBundleRead.length=${wantBundleRead.length}`);
      expect(wantBundleRead.length).assertEqual(21);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 wantAbilityRead=${wantAbilityRead}`);
      expect(wantAbilityRead).assertEqual(wantAbility);
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 wantActionRead=${wantActionRead}`);
      expect(wantActionRead).assertEqual(wantAction);
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 wantUriRead=${wantUriRead}`);
      expect(wantUriRead).assertEqual(wantUri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a6 wantTypeRead=${wantTypeRead}`);
      expect(wantTypeRead).assertEqual(wantType);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantMatrix0026 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_0027
     * @tc.name      oaidWantMatrix0027
     * @tc.desc      Want(bundle=com.samples.oaid.test, ability=TestAbility, action=ohos.want.action.sendData) 字段可读且值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantMatrix0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantMatrix0027 begin');
      const wantBundle: string = 'com.samples.oaid.test';
      const wantAbility: string = 'TestAbility';
      const wantAction: string = 'ohos.want.action.sendData';
      const wantUri: string = 'oaid://samples';
      const wantType: string = 'text/plain';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const wantBundleRead: string = want.bundleName ?? '';
      const wantAbilityRead: string = want.abilityName ?? '';
      const wantActionRead: string = want.action ?? '';
      const wantUriRead: string = want.uri ?? '';
      const wantTypeRead: string = want.type ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 wantBundleRead=${wantBundleRead}`);
      expect(wantBundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 wantBundleRead.length=${wantBundleRead.length}`);
      expect(wantBundleRead.length).assertEqual(21);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 wantAbilityRead=${wantAbilityRead}`);
      expect(wantAbilityRead).assertEqual(wantAbility);
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 wantActionRead=${wantActionRead}`);
      expect(wantActionRead).assertEqual(wantAction);
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 wantUriRead=${wantUriRead}`);
      expect(wantUriRead).assertEqual(wantUri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a6 wantTypeRead=${wantTypeRead}`);
      expect(wantTypeRead).assertEqual(wantType);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantMatrix0027 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_0028
     * @tc.name      oaidWantMatrix0028
     * @tc.desc      Want(bundle=com.samples.oaid.test, ability=TestAbility, action=空) 字段可读且值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantMatrix0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantMatrix0028 begin');
      const wantBundle: string = 'com.samples.oaid.test';
      const wantAbility: string = 'TestAbility';
      const wantAction: string = '';
      const wantUri: string = 'oaid://samples/page';
      const wantType: string = 'application/json';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const wantBundleRead: string = want.bundleName ?? '';
      const wantAbilityRead: string = want.abilityName ?? '';
      const wantActionRead: string = want.action ?? '';
      const wantUriRead: string = want.uri ?? '';
      const wantTypeRead: string = want.type ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 wantBundleRead=${wantBundleRead}`);
      expect(wantBundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 wantBundleRead.length=${wantBundleRead.length}`);
      expect(wantBundleRead.length).assertEqual(21);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 wantAbilityRead=${wantAbilityRead}`);
      expect(wantAbilityRead).assertEqual(wantAbility);
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 wantActionRead=${wantActionRead}`);
      expect(wantActionRead).assertEqual(wantAction);
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 wantUriRead=${wantUriRead}`);
      expect(wantUriRead).assertEqual(wantUri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a6 wantTypeRead=${wantTypeRead}`);
      expect(wantTypeRead).assertEqual(wantType);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantMatrix0028 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_0029
     * @tc.name      oaidWantMatrix0029
     * @tc.desc      Want(bundle=com.samples.oaid.test, ability=A, action=action.system.home) 字段可读且值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantMatrix0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantMatrix0029 begin');
      const wantBundle: string = 'com.samples.oaid.test';
      const wantAbility: string = 'A';
      const wantAction: string = 'action.system.home';
      const wantUri: string = 'https://example.com/oaid?from=test';
      const wantType: string = 'application/json';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const wantBundleRead: string = want.bundleName ?? '';
      const wantAbilityRead: string = want.abilityName ?? '';
      const wantActionRead: string = want.action ?? '';
      const wantUriRead: string = want.uri ?? '';
      const wantTypeRead: string = want.type ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 wantBundleRead=${wantBundleRead}`);
      expect(wantBundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 wantBundleRead.length=${wantBundleRead.length}`);
      expect(wantBundleRead.length).assertEqual(21);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 wantAbilityRead=${wantAbilityRead}`);
      expect(wantAbilityRead).assertEqual(wantAbility);
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 wantActionRead=${wantActionRead}`);
      expect(wantActionRead).assertEqual(wantAction);
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 wantUriRead=${wantUriRead}`);
      expect(wantUriRead).assertEqual(wantUri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a6 wantTypeRead=${wantTypeRead}`);
      expect(wantTypeRead).assertEqual(wantType);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantMatrix0029 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_0030
     * @tc.name      oaidWantMatrix0030
     * @tc.desc      Want(bundle=com.samples.oaid.test, ability=A, action=ohos.want.action.viewData) 字段可读且值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantMatrix0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantMatrix0030 begin');
      const wantBundle: string = 'com.samples.oaid.test';
      const wantAbility: string = 'A';
      const wantAction: string = 'ohos.want.action.viewData';
      const wantUri: string = 'oaid://samples';
      const wantType: string = '';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const wantBundleRead: string = want.bundleName ?? '';
      const wantAbilityRead: string = want.abilityName ?? '';
      const wantActionRead: string = want.action ?? '';
      const wantUriRead: string = want.uri ?? '';
      const wantTypeRead: string = want.type ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 wantBundleRead=${wantBundleRead}`);
      expect(wantBundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 wantBundleRead.length=${wantBundleRead.length}`);
      expect(wantBundleRead.length).assertEqual(21);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 wantAbilityRead=${wantAbilityRead}`);
      expect(wantAbilityRead).assertEqual(wantAbility);
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 wantActionRead=${wantActionRead}`);
      expect(wantActionRead).assertEqual(wantAction);
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 wantUriRead=${wantUriRead}`);
      expect(wantUriRead).assertEqual(wantUri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a6 wantTypeRead=${wantTypeRead}`);
      expect(wantTypeRead).assertEqual(wantType);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantMatrix0030 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_0031
     * @tc.name      oaidWantMatrix0031
     * @tc.desc      Want(bundle=com.samples.oaid.test, ability=A, action=ohos.want.action.sendData) 字段可读且值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantMatrix0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantMatrix0031 begin');
      const wantBundle: string = 'com.samples.oaid.test';
      const wantAbility: string = 'A';
      const wantAction: string = 'ohos.want.action.sendData';
      const wantUri: string = 'oaid://samples/page';
      const wantType: string = 'text/plain';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const wantBundleRead: string = want.bundleName ?? '';
      const wantAbilityRead: string = want.abilityName ?? '';
      const wantActionRead: string = want.action ?? '';
      const wantUriRead: string = want.uri ?? '';
      const wantTypeRead: string = want.type ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 wantBundleRead=${wantBundleRead}`);
      expect(wantBundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 wantBundleRead.length=${wantBundleRead.length}`);
      expect(wantBundleRead.length).assertEqual(21);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 wantAbilityRead=${wantAbilityRead}`);
      expect(wantAbilityRead).assertEqual(wantAbility);
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 wantActionRead=${wantActionRead}`);
      expect(wantActionRead).assertEqual(wantAction);
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 wantUriRead=${wantUriRead}`);
      expect(wantUriRead).assertEqual(wantUri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a6 wantTypeRead=${wantTypeRead}`);
      expect(wantTypeRead).assertEqual(wantType);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantMatrix0031 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_0032
     * @tc.name      oaidWantMatrix0032
     * @tc.desc      Want(bundle=com.samples.oaid.test, ability=A, action=空) 字段可读且值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantMatrix0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantMatrix0032 begin');
      const wantBundle: string = 'com.samples.oaid.test';
      const wantAbility: string = 'A';
      const wantAction: string = '';
      const wantUri: string = 'https://example.com/oaid?from=test';
      const wantType: string = 'application/json';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const wantBundleRead: string = want.bundleName ?? '';
      const wantAbilityRead: string = want.abilityName ?? '';
      const wantActionRead: string = want.action ?? '';
      const wantUriRead: string = want.uri ?? '';
      const wantTypeRead: string = want.type ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 wantBundleRead=${wantBundleRead}`);
      expect(wantBundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 wantBundleRead.length=${wantBundleRead.length}`);
      expect(wantBundleRead.length).assertEqual(21);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 wantAbilityRead=${wantAbilityRead}`);
      expect(wantAbilityRead).assertEqual(wantAbility);
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 wantActionRead=${wantActionRead}`);
      expect(wantActionRead).assertEqual(wantAction);
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 wantUriRead=${wantUriRead}`);
      expect(wantUriRead).assertEqual(wantUri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a6 wantTypeRead=${wantTypeRead}`);
      expect(wantTypeRead).assertEqual(wantType);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantMatrix0032 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_0033
     * @tc.name      oaidWantMatrix0033
     * @tc.desc      Want(bundle=a, ability=EntryAbility, action=action.system.home) 字段可读且值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantMatrix0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantMatrix0033 begin');
      const wantBundle: string = 'a';
      const wantAbility: string = 'EntryAbility';
      const wantAction: string = 'action.system.home';
      const wantUri: string = 'oaid://samples';
      const wantType: string = '';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const wantBundleRead: string = want.bundleName ?? '';
      const wantAbilityRead: string = want.abilityName ?? '';
      const wantActionRead: string = want.action ?? '';
      const wantUriRead: string = want.uri ?? '';
      const wantTypeRead: string = want.type ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 wantBundleRead=${wantBundleRead}`);
      expect(wantBundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 wantBundleRead.length=${wantBundleRead.length}`);
      expect(wantBundleRead.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 wantAbilityRead=${wantAbilityRead}`);
      expect(wantAbilityRead).assertEqual(wantAbility);
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 wantActionRead=${wantActionRead}`);
      expect(wantActionRead).assertEqual(wantAction);
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 wantUriRead=${wantUriRead}`);
      expect(wantUriRead).assertEqual(wantUri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a6 wantTypeRead=${wantTypeRead}`);
      expect(wantTypeRead).assertEqual(wantType);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantMatrix0033 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_0034
     * @tc.name      oaidWantMatrix0034
     * @tc.desc      Want(bundle=a, ability=EntryAbility, action=ohos.want.action.viewData) 字段可读且值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantMatrix0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantMatrix0034 begin');
      const wantBundle: string = 'a';
      const wantAbility: string = 'EntryAbility';
      const wantAction: string = 'ohos.want.action.viewData';
      const wantUri: string = 'oaid://samples/page';
      const wantType: string = 'text/plain';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const wantBundleRead: string = want.bundleName ?? '';
      const wantAbilityRead: string = want.abilityName ?? '';
      const wantActionRead: string = want.action ?? '';
      const wantUriRead: string = want.uri ?? '';
      const wantTypeRead: string = want.type ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 wantBundleRead=${wantBundleRead}`);
      expect(wantBundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 wantBundleRead.length=${wantBundleRead.length}`);
      expect(wantBundleRead.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 wantAbilityRead=${wantAbilityRead}`);
      expect(wantAbilityRead).assertEqual(wantAbility);
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 wantActionRead=${wantActionRead}`);
      expect(wantActionRead).assertEqual(wantAction);
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 wantUriRead=${wantUriRead}`);
      expect(wantUriRead).assertEqual(wantUri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a6 wantTypeRead=${wantTypeRead}`);
      expect(wantTypeRead).assertEqual(wantType);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantMatrix0034 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_0035
     * @tc.name      oaidWantMatrix0035
     * @tc.desc      Want(bundle=a, ability=EntryAbility, action=ohos.want.action.sendData) 字段可读且值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantMatrix0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantMatrix0035 begin');
      const wantBundle: string = 'a';
      const wantAbility: string = 'EntryAbility';
      const wantAction: string = 'ohos.want.action.sendData';
      const wantUri: string = 'https://example.com/oaid?from=test';
      const wantType: string = 'application/json';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const wantBundleRead: string = want.bundleName ?? '';
      const wantAbilityRead: string = want.abilityName ?? '';
      const wantActionRead: string = want.action ?? '';
      const wantUriRead: string = want.uri ?? '';
      const wantTypeRead: string = want.type ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 wantBundleRead=${wantBundleRead}`);
      expect(wantBundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 wantBundleRead.length=${wantBundleRead.length}`);
      expect(wantBundleRead.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 wantAbilityRead=${wantAbilityRead}`);
      expect(wantAbilityRead).assertEqual(wantAbility);
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 wantActionRead=${wantActionRead}`);
      expect(wantActionRead).assertEqual(wantAction);
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 wantUriRead=${wantUriRead}`);
      expect(wantUriRead).assertEqual(wantUri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a6 wantTypeRead=${wantTypeRead}`);
      expect(wantTypeRead).assertEqual(wantType);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantMatrix0035 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_0036
     * @tc.name      oaidWantMatrix0036
     * @tc.desc      Want(bundle=a, ability=EntryAbility, action=空) 字段可读且值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantMatrix0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantMatrix0036 begin');
      const wantBundle: string = 'a';
      const wantAbility: string = 'EntryAbility';
      const wantAction: string = '';
      const wantUri: string = 'oaid://samples';
      const wantType: string = '';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const wantBundleRead: string = want.bundleName ?? '';
      const wantAbilityRead: string = want.abilityName ?? '';
      const wantActionRead: string = want.action ?? '';
      const wantUriRead: string = want.uri ?? '';
      const wantTypeRead: string = want.type ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 wantBundleRead=${wantBundleRead}`);
      expect(wantBundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 wantBundleRead.length=${wantBundleRead.length}`);
      expect(wantBundleRead.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 wantAbilityRead=${wantAbilityRead}`);
      expect(wantAbilityRead).assertEqual(wantAbility);
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 wantActionRead=${wantActionRead}`);
      expect(wantActionRead).assertEqual(wantAction);
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 wantUriRead=${wantUriRead}`);
      expect(wantUriRead).assertEqual(wantUri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a6 wantTypeRead=${wantTypeRead}`);
      expect(wantTypeRead).assertEqual(wantType);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantMatrix0036 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_0037
     * @tc.name      oaidWantMatrix0037
     * @tc.desc      Want(bundle=a, ability=MainAbility, action=action.system.home) 字段可读且值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantMatrix0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantMatrix0037 begin');
      const wantBundle: string = 'a';
      const wantAbility: string = 'MainAbility';
      const wantAction: string = 'action.system.home';
      const wantUri: string = 'oaid://samples/page';
      const wantType: string = '';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const wantBundleRead: string = want.bundleName ?? '';
      const wantAbilityRead: string = want.abilityName ?? '';
      const wantActionRead: string = want.action ?? '';
      const wantUriRead: string = want.uri ?? '';
      const wantTypeRead: string = want.type ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 wantBundleRead=${wantBundleRead}`);
      expect(wantBundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 wantBundleRead.length=${wantBundleRead.length}`);
      expect(wantBundleRead.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 wantAbilityRead=${wantAbilityRead}`);
      expect(wantAbilityRead).assertEqual(wantAbility);
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 wantActionRead=${wantActionRead}`);
      expect(wantActionRead).assertEqual(wantAction);
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 wantUriRead=${wantUriRead}`);
      expect(wantUriRead).assertEqual(wantUri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a6 wantTypeRead=${wantTypeRead}`);
      expect(wantTypeRead).assertEqual(wantType);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantMatrix0037 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_0038
     * @tc.name      oaidWantMatrix0038
     * @tc.desc      Want(bundle=a, ability=MainAbility, action=ohos.want.action.viewData) 字段可读且值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantMatrix0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantMatrix0038 begin');
      const wantBundle: string = 'a';
      const wantAbility: string = 'MainAbility';
      const wantAction: string = 'ohos.want.action.viewData';
      const wantUri: string = 'https://example.com/oaid?from=test';
      const wantType: string = 'text/plain';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const wantBundleRead: string = want.bundleName ?? '';
      const wantAbilityRead: string = want.abilityName ?? '';
      const wantActionRead: string = want.action ?? '';
      const wantUriRead: string = want.uri ?? '';
      const wantTypeRead: string = want.type ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 wantBundleRead=${wantBundleRead}`);
      expect(wantBundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 wantBundleRead.length=${wantBundleRead.length}`);
      expect(wantBundleRead.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 wantAbilityRead=${wantAbilityRead}`);
      expect(wantAbilityRead).assertEqual(wantAbility);
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 wantActionRead=${wantActionRead}`);
      expect(wantActionRead).assertEqual(wantAction);
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 wantUriRead=${wantUriRead}`);
      expect(wantUriRead).assertEqual(wantUri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a6 wantTypeRead=${wantTypeRead}`);
      expect(wantTypeRead).assertEqual(wantType);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantMatrix0038 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_0039
     * @tc.name      oaidWantMatrix0039
     * @tc.desc      Want(bundle=a, ability=MainAbility, action=ohos.want.action.sendData) 字段可读且值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantMatrix0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantMatrix0039 begin');
      const wantBundle: string = 'a';
      const wantAbility: string = 'MainAbility';
      const wantAction: string = 'ohos.want.action.sendData';
      const wantUri: string = 'oaid://samples';
      const wantType: string = 'application/json';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const wantBundleRead: string = want.bundleName ?? '';
      const wantAbilityRead: string = want.abilityName ?? '';
      const wantActionRead: string = want.action ?? '';
      const wantUriRead: string = want.uri ?? '';
      const wantTypeRead: string = want.type ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 wantBundleRead=${wantBundleRead}`);
      expect(wantBundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 wantBundleRead.length=${wantBundleRead.length}`);
      expect(wantBundleRead.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 wantAbilityRead=${wantAbilityRead}`);
      expect(wantAbilityRead).assertEqual(wantAbility);
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 wantActionRead=${wantActionRead}`);
      expect(wantActionRead).assertEqual(wantAction);
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 wantUriRead=${wantUriRead}`);
      expect(wantUriRead).assertEqual(wantUri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a6 wantTypeRead=${wantTypeRead}`);
      expect(wantTypeRead).assertEqual(wantType);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantMatrix0039 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_0040
     * @tc.name      oaidWantMatrix0040
     * @tc.desc      Want(bundle=a, ability=MainAbility, action=空) 字段可读且值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantMatrix0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantMatrix0040 begin');
      const wantBundle: string = 'a';
      const wantAbility: string = 'MainAbility';
      const wantAction: string = '';
      const wantUri: string = 'oaid://samples/page';
      const wantType: string = '';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const wantBundleRead: string = want.bundleName ?? '';
      const wantAbilityRead: string = want.abilityName ?? '';
      const wantActionRead: string = want.action ?? '';
      const wantUriRead: string = want.uri ?? '';
      const wantTypeRead: string = want.type ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 wantBundleRead=${wantBundleRead}`);
      expect(wantBundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 wantBundleRead.length=${wantBundleRead.length}`);
      expect(wantBundleRead.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 wantAbilityRead=${wantAbilityRead}`);
      expect(wantAbilityRead).assertEqual(wantAbility);
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 wantActionRead=${wantActionRead}`);
      expect(wantActionRead).assertEqual(wantAction);
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 wantUriRead=${wantUriRead}`);
      expect(wantUriRead).assertEqual(wantUri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a6 wantTypeRead=${wantTypeRead}`);
      expect(wantTypeRead).assertEqual(wantType);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantMatrix0040 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_0041
     * @tc.name      oaidWantMatrix0041
     * @tc.desc      Want(bundle=a, ability=TestAbility, action=action.system.home) 字段可读且值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantMatrix0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantMatrix0041 begin');
      const wantBundle: string = 'a';
      const wantAbility: string = 'TestAbility';
      const wantAction: string = 'action.system.home';
      const wantUri: string = 'https://example.com/oaid?from=test';
      const wantType: string = '';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const wantBundleRead: string = want.bundleName ?? '';
      const wantAbilityRead: string = want.abilityName ?? '';
      const wantActionRead: string = want.action ?? '';
      const wantUriRead: string = want.uri ?? '';
      const wantTypeRead: string = want.type ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 wantBundleRead=${wantBundleRead}`);
      expect(wantBundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 wantBundleRead.length=${wantBundleRead.length}`);
      expect(wantBundleRead.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 wantAbilityRead=${wantAbilityRead}`);
      expect(wantAbilityRead).assertEqual(wantAbility);
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 wantActionRead=${wantActionRead}`);
      expect(wantActionRead).assertEqual(wantAction);
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 wantUriRead=${wantUriRead}`);
      expect(wantUriRead).assertEqual(wantUri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a6 wantTypeRead=${wantTypeRead}`);
      expect(wantTypeRead).assertEqual(wantType);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantMatrix0041 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_0042
     * @tc.name      oaidWantMatrix0042
     * @tc.desc      Want(bundle=a, ability=TestAbility, action=ohos.want.action.viewData) 字段可读且值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantMatrix0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantMatrix0042 begin');
      const wantBundle: string = 'a';
      const wantAbility: string = 'TestAbility';
      const wantAction: string = 'ohos.want.action.viewData';
      const wantUri: string = 'oaid://samples';
      const wantType: string = 'text/plain';
      const want: Want = {
        bundleName: wantBundle,
        abilityName: wantAbility,
        action: wantAction,
        uri: wantUri,
        type: wantType
      };
      const wantBundleRead: string = want.bundleName ?? '';
      const wantAbilityRead: string = want.abilityName ?? '';
      const wantActionRead: string = want.action ?? '';
      const wantUriRead: string = want.uri ?? '';
      const wantTypeRead: string = want.type ?? '';
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 wantBundleRead=${wantBundleRead}`);
      expect(wantBundleRead).assertEqual(wantBundle);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 wantBundleRead.length=${wantBundleRead.length}`);
      expect(wantBundleRead.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 wantAbilityRead=${wantAbilityRead}`);
      expect(wantAbilityRead).assertEqual(wantAbility);
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 wantActionRead=${wantActionRead}`);
      expect(wantActionRead).assertEqual(wantAction);
      hilog.info(DOMAIN, TAG, '%{public}s', `a5 wantUriRead=${wantUriRead}`);
      expect(wantUriRead).assertEqual(wantUri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a6 wantTypeRead=${wantTypeRead}`);
      expect(wantTypeRead).assertEqual(wantType);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantMatrix0042 end');
    })
  })
}
