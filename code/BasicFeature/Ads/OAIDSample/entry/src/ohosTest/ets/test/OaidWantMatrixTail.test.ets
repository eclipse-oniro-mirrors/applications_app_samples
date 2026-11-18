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

export default function oaidWantMatrixTailTest(): void {
  describe('OaidWantMatrixTailTest', () => {
    /**
     * @tc.number    SUB_OAID_WANT_0043
     * @tc.name      oaidWantMatrix0043
     * @tc.desc      Want(bundle=a, ability=TestAbility, action=ohos.want.action.sendData) 字段可读且值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantMatrix0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantMatrix0043 begin');
      const wantBundle: string = 'a';
      const wantAbility: string = 'TestAbility';
      const wantAction: string = 'ohos.want.action.sendData';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantMatrix0043 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_0044
     * @tc.name      oaidWantMatrix0044
     * @tc.desc      Want(bundle=a, ability=TestAbility, action=空) 字段可读且值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantMatrix0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantMatrix0044 begin');
      const wantBundle: string = 'a';
      const wantAbility: string = 'TestAbility';
      const wantAction: string = '';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantMatrix0044 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_0045
     * @tc.name      oaidWantMatrix0045
     * @tc.desc      Want(bundle=a, ability=A, action=action.system.home) 字段可读且值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantMatrix0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantMatrix0045 begin');
      const wantBundle: string = 'a';
      const wantAbility: string = 'A';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantMatrix0045 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_0046
     * @tc.name      oaidWantMatrix0046
     * @tc.desc      Want(bundle=a, ability=A, action=ohos.want.action.viewData) 字段可读且值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantMatrix0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantMatrix0046 begin');
      const wantBundle: string = 'a';
      const wantAbility: string = 'A';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantMatrix0046 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_0047
     * @tc.name      oaidWantMatrix0047
     * @tc.desc      Want(bundle=a, ability=A, action=ohos.want.action.sendData) 字段可读且值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantMatrix0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantMatrix0047 begin');
      const wantBundle: string = 'a';
      const wantAbility: string = 'A';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantMatrix0047 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_0048
     * @tc.name      oaidWantMatrix0048
     * @tc.desc      Want(bundle=a, ability=A, action=空) 字段可读且值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantMatrix0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantMatrix0048 begin');
      const wantBundle: string = 'a';
      const wantAbility: string = 'A';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantMatrix0048 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_0049
     * @tc.name      oaidWantMatrix0049
     * @tc.desc      Want(bundle=com.samples, ability=EntryAbility, action=action.system.home) 字段可读且值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantMatrix0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantMatrix0049 begin');
      const wantBundle: string = 'com.samples';
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
      expect(wantBundleRead.length).assertEqual(11);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantMatrix0049 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_0050
     * @tc.name      oaidWantMatrix0050
     * @tc.desc      Want(bundle=com.samples, ability=EntryAbility, action=ohos.want.action.viewData) 字段可读且值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantMatrix0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantMatrix0050 begin');
      const wantBundle: string = 'com.samples';
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
      expect(wantBundleRead.length).assertEqual(11);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantMatrix0050 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_0051
     * @tc.name      oaidWantMatrix0051
     * @tc.desc      Want(bundle=com.samples, ability=EntryAbility, action=ohos.want.action.sendData) 字段可读且值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantMatrix0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantMatrix0051 begin');
      const wantBundle: string = 'com.samples';
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
      expect(wantBundleRead.length).assertEqual(11);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantMatrix0051 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_0052
     * @tc.name      oaidWantMatrix0052
     * @tc.desc      Want(bundle=com.samples, ability=EntryAbility, action=空) 字段可读且值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantMatrix0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantMatrix0052 begin');
      const wantBundle: string = 'com.samples';
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
      expect(wantBundleRead.length).assertEqual(11);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantMatrix0052 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_0053
     * @tc.name      oaidWantMatrix0053
     * @tc.desc      Want(bundle=com.samples, ability=MainAbility, action=action.system.home) 字段可读且值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantMatrix0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantMatrix0053 begin');
      const wantBundle: string = 'com.samples';
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
      expect(wantBundleRead.length).assertEqual(11);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantMatrix0053 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_0054
     * @tc.name      oaidWantMatrix0054
     * @tc.desc      Want(bundle=com.samples, ability=MainAbility, action=ohos.want.action.viewData) 字段可读且值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantMatrix0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantMatrix0054 begin');
      const wantBundle: string = 'com.samples';
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
      expect(wantBundleRead.length).assertEqual(11);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantMatrix0054 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_0055
     * @tc.name      oaidWantMatrix0055
     * @tc.desc      Want(bundle=com.samples, ability=MainAbility, action=ohos.want.action.sendData) 字段可读且值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantMatrix0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantMatrix0055 begin');
      const wantBundle: string = 'com.samples';
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
      expect(wantBundleRead.length).assertEqual(11);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantMatrix0055 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_0056
     * @tc.name      oaidWantMatrix0056
     * @tc.desc      Want(bundle=com.samples, ability=MainAbility, action=空) 字段可读且值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantMatrix0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantMatrix0056 begin');
      const wantBundle: string = 'com.samples';
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
      expect(wantBundleRead.length).assertEqual(11);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantMatrix0056 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_0057
     * @tc.name      oaidWantMatrix0057
     * @tc.desc      Want(bundle=com.samples, ability=TestAbility, action=action.system.home) 字段可读且值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantMatrix0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantMatrix0057 begin');
      const wantBundle: string = 'com.samples';
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
      expect(wantBundleRead.length).assertEqual(11);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantMatrix0057 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_0058
     * @tc.name      oaidWantMatrix0058
     * @tc.desc      Want(bundle=com.samples, ability=TestAbility, action=ohos.want.action.viewData) 字段可读且值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantMatrix0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantMatrix0058 begin');
      const wantBundle: string = 'com.samples';
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
      expect(wantBundleRead.length).assertEqual(11);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantMatrix0058 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_0059
     * @tc.name      oaidWantMatrix0059
     * @tc.desc      Want(bundle=com.samples, ability=TestAbility, action=ohos.want.action.sendData) 字段可读且值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantMatrix0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantMatrix0059 begin');
      const wantBundle: string = 'com.samples';
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
      expect(wantBundleRead.length).assertEqual(11);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantMatrix0059 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_0060
     * @tc.name      oaidWantMatrix0060
     * @tc.desc      Want(bundle=com.samples, ability=TestAbility, action=空) 字段可读且值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantMatrix0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantMatrix0060 begin');
      const wantBundle: string = 'com.samples';
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
      expect(wantBundleRead.length).assertEqual(11);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantMatrix0060 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_0061
     * @tc.name      oaidWantMatrix0061
     * @tc.desc      Want(bundle=com.samples, ability=A, action=action.system.home) 字段可读且值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantMatrix0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantMatrix0061 begin');
      const wantBundle: string = 'com.samples';
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
      expect(wantBundleRead.length).assertEqual(11);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantMatrix0061 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_0062
     * @tc.name      oaidWantMatrix0062
     * @tc.desc      Want(bundle=com.samples, ability=A, action=ohos.want.action.viewData) 字段可读且值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantMatrix0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantMatrix0062 begin');
      const wantBundle: string = 'com.samples';
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
      expect(wantBundleRead.length).assertEqual(11);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantMatrix0062 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_0063
     * @tc.name      oaidWantMatrix0063
     * @tc.desc      Want(bundle=com.samples, ability=A, action=ohos.want.action.sendData) 字段可读且值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantMatrix0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantMatrix0063 begin');
      const wantBundle: string = 'com.samples';
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
      expect(wantBundleRead.length).assertEqual(11);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantMatrix0063 end');
    })

    /**
     * @tc.number    SUB_OAID_WANT_0064
     * @tc.name      oaidWantMatrix0064
     * @tc.desc      Want(bundle=com.samples, ability=A, action=空) 字段可读且值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidWantMatrix0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantMatrix0064 begin');
      const wantBundle: string = 'com.samples';
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
      expect(wantBundleRead.length).assertEqual(11);
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidWantMatrix0064 end');
    })
  })
}
