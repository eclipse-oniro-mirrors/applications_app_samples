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
const TAG: string = '[Sample_BundleManagement]';

export default function sampleWantMatrixTest(): void {
  describe('SampleWantMatrixTest', () => {
    /**
     * @tc.number    SUB_BUNDLE_MGMT_WANT_0001
     * @tc.name      sampleWantMatrix0001
     * @tc.desc      Want(com.samples.bundlemanagement/EntryAbility/home) 字段可读且值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantMatrix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantMatrix0001 begin');
      const wantBundle: string = 'com.samples.bundlemanagement';
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
      expect(bundleRead.length).assertEqual(28);
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
     * @tc.number    SUB_BUNDLE_MGMT_WANT_0002
     * @tc.name      sampleWantMatrix0002
     * @tc.desc      Want(com.samples.bundlemanagement/EntryAbility/viewData) 字段可读且值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantMatrix0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantMatrix0002 begin');
      const wantBundle: string = 'com.samples.bundlemanagement';
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
      expect(bundleRead.length).assertEqual(28);
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
     * @tc.number    SUB_BUNDLE_MGMT_WANT_0003
     * @tc.name      sampleWantMatrix0003
     * @tc.desc      Want(com.samples.bundlemanagement/EntryAbility/sendData) 字段可读且值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantMatrix0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantMatrix0003 begin');
      const wantBundle: string = 'com.samples.bundlemanagement';
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
      expect(bundleRead.length).assertEqual(28);
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
     * @tc.number    SUB_BUNDLE_MGMT_WANT_0004
     * @tc.name      sampleWantMatrix0004
     * @tc.desc      Want(com.samples.bundlemanagement/EntryAbility/空) 字段可读且值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantMatrix0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantMatrix0004 begin');
      const wantBundle: string = 'com.samples.bundlemanagement';
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
      expect(bundleRead.length).assertEqual(28);
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
     * @tc.number    SUB_BUNDLE_MGMT_WANT_0005
     * @tc.name      sampleWantMatrix0005
     * @tc.desc      Want(com.samples.bundlemanagement/NewAbility/home) 字段可读且值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantMatrix0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantMatrix0005 begin');
      const wantBundle: string = 'com.samples.bundlemanagement';
      const wantAbility: string = 'NewAbility';
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
      expect(bundleRead.length).assertEqual(28);
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
     * @tc.number    SUB_BUNDLE_MGMT_WANT_0006
     * @tc.name      sampleWantMatrix0006
     * @tc.desc      Want(com.samples.bundlemanagement/NewAbility/viewData) 字段可读且值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantMatrix0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantMatrix0006 begin');
      const wantBundle: string = 'com.samples.bundlemanagement';
      const wantAbility: string = 'NewAbility';
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
      expect(bundleRead.length).assertEqual(28);
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
     * @tc.number    SUB_BUNDLE_MGMT_WANT_0007
     * @tc.name      sampleWantMatrix0007
     * @tc.desc      Want(com.samples.bundlemanagement/NewAbility/sendData) 字段可读且值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantMatrix0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantMatrix0007 begin');
      const wantBundle: string = 'com.samples.bundlemanagement';
      const wantAbility: string = 'NewAbility';
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
      expect(bundleRead.length).assertEqual(28);
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
     * @tc.number    SUB_BUNDLE_MGMT_WANT_0008
     * @tc.name      sampleWantMatrix0008
     * @tc.desc      Want(com.samples.bundlemanagement/NewAbility/空) 字段可读且值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantMatrix0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantMatrix0008 begin');
      const wantBundle: string = 'com.samples.bundlemanagement';
      const wantAbility: string = 'NewAbility';
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
      expect(bundleRead.length).assertEqual(28);
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
     * @tc.number    SUB_BUNDLE_MGMT_WANT_0009
     * @tc.name      sampleWantMatrix0009
     * @tc.desc      Want(com.samples.bundlemanagement.new/EntryAbility/home) 字段可读且值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantMatrix0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantMatrix0009 begin');
      const wantBundle: string = 'com.samples.bundlemanagement.new';
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
      expect(bundleRead.length).assertEqual(32);
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
     * @tc.number    SUB_BUNDLE_MGMT_WANT_0010
     * @tc.name      sampleWantMatrix0010
     * @tc.desc      Want(com.samples.bundlemanagement.new/EntryAbility/viewData) 字段可读且值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantMatrix0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantMatrix0010 begin');
      const wantBundle: string = 'com.samples.bundlemanagement.new';
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
      expect(bundleRead.length).assertEqual(32);
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
     * @tc.number    SUB_BUNDLE_MGMT_WANT_0011
     * @tc.name      sampleWantMatrix0011
     * @tc.desc      Want(com.samples.bundlemanagement.new/EntryAbility/sendData) 字段可读且值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantMatrix0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantMatrix0011 begin');
      const wantBundle: string = 'com.samples.bundlemanagement.new';
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
      expect(bundleRead.length).assertEqual(32);
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
     * @tc.number    SUB_BUNDLE_MGMT_WANT_0012
     * @tc.name      sampleWantMatrix0012
     * @tc.desc      Want(com.samples.bundlemanagement.new/EntryAbility/空) 字段可读且值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantMatrix0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantMatrix0012 begin');
      const wantBundle: string = 'com.samples.bundlemanagement.new';
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
      expect(bundleRead.length).assertEqual(32);
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
     * @tc.number    SUB_BUNDLE_MGMT_WANT_0013
     * @tc.name      sampleWantMatrix0013
     * @tc.desc      Want(com.samples.bundlemanagement.new/NewAbility/home) 字段可读且值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantMatrix0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantMatrix0013 begin');
      const wantBundle: string = 'com.samples.bundlemanagement.new';
      const wantAbility: string = 'NewAbility';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantMatrix0013 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_WANT_0014
     * @tc.name      sampleWantMatrix0014
     * @tc.desc      Want(com.samples.bundlemanagement.new/NewAbility/viewData) 字段可读且值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantMatrix0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantMatrix0014 begin');
      const wantBundle: string = 'com.samples.bundlemanagement.new';
      const wantAbility: string = 'NewAbility';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantMatrix0014 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_WANT_0015
     * @tc.name      sampleWantMatrix0015
     * @tc.desc      Want(com.samples.bundlemanagement.new/NewAbility/sendData) 字段可读且值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantMatrix0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantMatrix0015 begin');
      const wantBundle: string = 'com.samples.bundlemanagement.new';
      const wantAbility: string = 'NewAbility';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantMatrix0015 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_WANT_0016
     * @tc.name      sampleWantMatrix0016
     * @tc.desc      Want(com.samples.bundlemanagement.new/NewAbility/空) 字段可读且值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantMatrix0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantMatrix0016 begin');
      const wantBundle: string = 'com.samples.bundlemanagement.new';
      const wantAbility: string = 'NewAbility';
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantMatrix0016 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_WANT_0017
     * @tc.name      sampleWantMatrix0017
     * @tc.desc      Want(com.samples.bundle.query/EntryAbility/home) 字段可读且值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantMatrix0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantMatrix0017 begin');
      const wantBundle: string = 'com.samples.bundle.query';
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
      expect(bundleRead.length).assertEqual(24);
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
     * @tc.number    SUB_BUNDLE_MGMT_WANT_0018
     * @tc.name      sampleWantMatrix0018
     * @tc.desc      Want(com.samples.bundle.query/EntryAbility/viewData) 字段可读且值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantMatrix0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantMatrix0018 begin');
      const wantBundle: string = 'com.samples.bundle.query';
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
      expect(bundleRead.length).assertEqual(24);
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
     * @tc.number    SUB_BUNDLE_MGMT_WANT_0019
     * @tc.name      sampleWantMatrix0019
     * @tc.desc      Want(com.samples.bundle.query/EntryAbility/sendData) 字段可读且值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantMatrix0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantMatrix0019 begin');
      const wantBundle: string = 'com.samples.bundle.query';
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
      expect(bundleRead.length).assertEqual(24);
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
     * @tc.number    SUB_BUNDLE_MGMT_WANT_0020
     * @tc.name      sampleWantMatrix0020
     * @tc.desc      Want(com.samples.bundle.query/EntryAbility/空) 字段可读且值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantMatrix0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantMatrix0020 begin');
      const wantBundle: string = 'com.samples.bundle.query';
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
      expect(bundleRead.length).assertEqual(24);
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
     * @tc.number    SUB_BUNDLE_MGMT_WANT_0021
     * @tc.name      sampleWantMatrix0021
     * @tc.desc      Want(com.samples.bundle.query/NewAbility/home) 字段可读且值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantMatrix0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantMatrix0021 begin');
      const wantBundle: string = 'com.samples.bundle.query';
      const wantAbility: string = 'NewAbility';
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
      expect(bundleRead.length).assertEqual(24);
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
     * @tc.number    SUB_BUNDLE_MGMT_WANT_0022
     * @tc.name      sampleWantMatrix0022
     * @tc.desc      Want(com.samples.bundle.query/NewAbility/viewData) 字段可读且值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantMatrix0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantMatrix0022 begin');
      const wantBundle: string = 'com.samples.bundle.query';
      const wantAbility: string = 'NewAbility';
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
      expect(bundleRead.length).assertEqual(24);
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
     * @tc.number    SUB_BUNDLE_MGMT_WANT_0023
     * @tc.name      sampleWantMatrix0023
     * @tc.desc      Want(com.samples.bundle.query/NewAbility/sendData) 字段可读且值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantMatrix0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantMatrix0023 begin');
      const wantBundle: string = 'com.samples.bundle.query';
      const wantAbility: string = 'NewAbility';
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
      expect(bundleRead.length).assertEqual(24);
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
     * @tc.number    SUB_BUNDLE_MGMT_WANT_0024
     * @tc.name      sampleWantMatrix0024
     * @tc.desc      Want(com.samples.bundle.query/NewAbility/空) 字段可读且值一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sampleWantMatrix0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantMatrix0024 begin');
      const wantBundle: string = 'com.samples.bundle.query';
      const wantAbility: string = 'NewAbility';
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
      expect(bundleRead.length).assertEqual(24);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 abilityRead=${abilityRead}`);
      expect(abilityRead).assertEqual(wantAbility);
      hilog.info(DOMAIN, TAG, '%{public}s', `a4 actionRead=${actionRead}`);
      expect(actionRead).assertEqual(wantAction);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sampleWantMatrix0024 end');
    })
  })
}
