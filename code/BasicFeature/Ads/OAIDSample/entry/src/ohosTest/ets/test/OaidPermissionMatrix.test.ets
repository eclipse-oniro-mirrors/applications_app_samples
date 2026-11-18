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
import { abilityAccessCtrl, bundleManager } from '@kit.AbilityKit';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_OAID]';

export default function oaidPermissionMatrixTest(): void {
  describe('OaidPermissionMatrixTest', () => {
    /**
     * @tc.number    SUB_OAID_PERMISSION_0001
     * @tc.name      oaidPermissionMatrix0001
     * @tc.desc      checkAccessTokenSync(APP_TRACKING_CONSENT) 状态合法
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidPermissionMatrix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidPermissionMatrix0001 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      const selfToken: number = info.appInfo.accessTokenId;
      const tokenId: number = selfToken + 0;
      const atManager: abilityAccessCtrl.AtManager = abilityAccessCtrl.createAtManager();
      const status: abilityAccessCtrl.GrantStatus = atManager.checkAccessTokenSync(
        tokenId, 'ohos.permission.APP_TRACKING_CONSENT');
      const actual1: boolean = selfToken > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertTrue();
      const actual2: string = typeof status;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('number');
      expect(status === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED ||
        status === abilityAccessCtrl.GrantStatus.PERMISSION_DENIED).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidPermissionMatrix0001 end');
    })

    /**
     * @tc.number    SUB_OAID_PERMISSION_0002
     * @tc.name      oaidPermissionMatrix0002
     * @tc.desc      checkAccessTokenSync(INTERNET) 状态合法
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidPermissionMatrix0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidPermissionMatrix0002 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      const selfToken: number = info.appInfo.accessTokenId;
      const tokenId: number = selfToken + 0;
      const atManager: abilityAccessCtrl.AtManager = abilityAccessCtrl.createAtManager();
      const status: abilityAccessCtrl.GrantStatus = atManager.checkAccessTokenSync(
        tokenId, 'ohos.permission.INTERNET');
      const actual1: boolean = selfToken > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertTrue();
      const actual2: string = typeof status;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('number');
      expect(status === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED ||
        status === abilityAccessCtrl.GrantStatus.PERMISSION_DENIED).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidPermissionMatrix0002 end');
    })

    /**
     * @tc.number    SUB_OAID_PERMISSION_0003
     * @tc.name      oaidPermissionMatrix0003
     * @tc.desc      checkAccessTokenSync(KEEP_BACKGROUND_RUNNING) 状态合法
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidPermissionMatrix0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidPermissionMatrix0003 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      const selfToken: number = info.appInfo.accessTokenId;
      const tokenId: number = selfToken + 0;
      const atManager: abilityAccessCtrl.AtManager = abilityAccessCtrl.createAtManager();
      const status: abilityAccessCtrl.GrantStatus = atManager.checkAccessTokenSync(
        tokenId, 'ohos.permission.KEEP_BACKGROUND_RUNNING');
      const actual1: boolean = selfToken > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertTrue();
      const actual2: string = typeof status;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('number');
      expect(status === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED ||
        status === abilityAccessCtrl.GrantStatus.PERMISSION_DENIED).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidPermissionMatrix0003 end');
    })

    /**
     * @tc.number    SUB_OAID_PERMISSION_0004
     * @tc.name      oaidPermissionMatrix0004
     * @tc.desc      checkAccessTokenSync(DISTRIBUTED_DATASYNC) 状态合法
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidPermissionMatrix0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidPermissionMatrix0004 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      const selfToken: number = info.appInfo.accessTokenId;
      const tokenId: number = selfToken + 0;
      const atManager: abilityAccessCtrl.AtManager = abilityAccessCtrl.createAtManager();
      const status: abilityAccessCtrl.GrantStatus = atManager.checkAccessTokenSync(
        tokenId, 'ohos.permission.DISTRIBUTED_DATASYNC');
      const actual1: boolean = selfToken > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertTrue();
      const actual2: string = typeof status;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('number');
      expect(status === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED ||
        status === abilityAccessCtrl.GrantStatus.PERMISSION_DENIED).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidPermissionMatrix0004 end');
    })

    /**
     * @tc.number    SUB_OAID_PERMISSION_0005
     * @tc.name      oaidPermissionMatrix0005
     * @tc.desc      checkAccessTokenSync(CAMERA) 状态合法
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidPermissionMatrix0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidPermissionMatrix0005 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      const selfToken: number = info.appInfo.accessTokenId;
      const tokenId: number = selfToken + 0;
      const atManager: abilityAccessCtrl.AtManager = abilityAccessCtrl.createAtManager();
      const status: abilityAccessCtrl.GrantStatus = atManager.checkAccessTokenSync(
        tokenId, 'ohos.permission.CAMERA');
      const actual1: boolean = selfToken > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertTrue();
      const actual2: string = typeof status;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('number');
      expect(status === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED ||
        status === abilityAccessCtrl.GrantStatus.PERMISSION_DENIED).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidPermissionMatrix0005 end');
    })

    /**
     * @tc.number    SUB_OAID_PERMISSION_0006
     * @tc.name      oaidPermissionMatrix0006
     * @tc.desc      checkAccessTokenSync(MICROPHONE) 状态合法
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidPermissionMatrix0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidPermissionMatrix0006 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      const selfToken: number = info.appInfo.accessTokenId;
      const tokenId: number = selfToken + 0;
      const atManager: abilityAccessCtrl.AtManager = abilityAccessCtrl.createAtManager();
      const status: abilityAccessCtrl.GrantStatus = atManager.checkAccessTokenSync(
        tokenId, 'ohos.permission.MICROPHONE');
      const actual1: boolean = selfToken > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertTrue();
      const actual2: string = typeof status;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('number');
      expect(status === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED ||
        status === abilityAccessCtrl.GrantStatus.PERMISSION_DENIED).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidPermissionMatrix0006 end');
    })

    /**
     * @tc.number    SUB_OAID_PERMISSION_0007
     * @tc.name      oaidPermissionMatrix0007
     * @tc.desc      checkAccessTokenSync(READ_MEDIA) 状态合法
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidPermissionMatrix0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidPermissionMatrix0007 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      const selfToken: number = info.appInfo.accessTokenId;
      const tokenId: number = selfToken + 0;
      const atManager: abilityAccessCtrl.AtManager = abilityAccessCtrl.createAtManager();
      const status: abilityAccessCtrl.GrantStatus = atManager.checkAccessTokenSync(
        tokenId, 'ohos.permission.READ_MEDIA');
      const actual1: boolean = selfToken > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertTrue();
      const actual2: string = typeof status;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('number');
      expect(status === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED ||
        status === abilityAccessCtrl.GrantStatus.PERMISSION_DENIED).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidPermissionMatrix0007 end');
    })

    /**
     * @tc.number    SUB_OAID_PERMISSION_0008
     * @tc.name      oaidPermissionMatrix0008
     * @tc.desc      checkAccessTokenSync(WRITE_MEDIA) 状态合法
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidPermissionMatrix0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidPermissionMatrix0008 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      const selfToken: number = info.appInfo.accessTokenId;
      const tokenId: number = selfToken + 0;
      const atManager: abilityAccessCtrl.AtManager = abilityAccessCtrl.createAtManager();
      const status: abilityAccessCtrl.GrantStatus = atManager.checkAccessTokenSync(
        tokenId, 'ohos.permission.WRITE_MEDIA');
      const actual1: boolean = selfToken > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertTrue();
      const actual2: string = typeof status;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('number');
      expect(status === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED ||
        status === abilityAccessCtrl.GrantStatus.PERMISSION_DENIED).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidPermissionMatrix0008 end');
    })

    /**
     * @tc.number    SUB_OAID_PERMISSION_0009
     * @tc.name      oaidPermissionMatrix0009
     * @tc.desc      checkAccessTokenSync(LOCATION) 状态合法
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidPermissionMatrix0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidPermissionMatrix0009 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      const selfToken: number = info.appInfo.accessTokenId;
      const tokenId: number = selfToken + 0;
      const atManager: abilityAccessCtrl.AtManager = abilityAccessCtrl.createAtManager();
      const status: abilityAccessCtrl.GrantStatus = atManager.checkAccessTokenSync(
        tokenId, 'ohos.permission.LOCATION');
      const actual1: boolean = selfToken > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertTrue();
      const actual2: string = typeof status;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('number');
      expect(status === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED ||
        status === abilityAccessCtrl.GrantStatus.PERMISSION_DENIED).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidPermissionMatrix0009 end');
    })

    /**
     * @tc.number    SUB_OAID_PERMISSION_0010
     * @tc.name      oaidPermissionMatrix0010
     * @tc.desc      checkAccessTokenSync(APPROXIMATELY_LOCATION) 状态合法
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidPermissionMatrix0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidPermissionMatrix0010 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      const selfToken: number = info.appInfo.accessTokenId;
      const tokenId: number = selfToken + 0;
      const atManager: abilityAccessCtrl.AtManager = abilityAccessCtrl.createAtManager();
      const status: abilityAccessCtrl.GrantStatus = atManager.checkAccessTokenSync(
        tokenId, 'ohos.permission.APPROXIMATELY_LOCATION');
      const actual1: boolean = selfToken > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertTrue();
      const actual2: string = typeof status;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('number');
      expect(status === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED ||
        status === abilityAccessCtrl.GrantStatus.PERMISSION_DENIED).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidPermissionMatrix0010 end');
    })

    /**
     * @tc.number    SUB_OAID_PERMISSION_0011
     * @tc.name      oaidPermissionMatrix0011
     * @tc.desc      checkAccessTokenSync(READ_CONTACTS) 状态合法
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidPermissionMatrix0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidPermissionMatrix0011 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      const selfToken: number = info.appInfo.accessTokenId;
      const tokenId: number = selfToken + 0;
      const atManager: abilityAccessCtrl.AtManager = abilityAccessCtrl.createAtManager();
      const status: abilityAccessCtrl.GrantStatus = atManager.checkAccessTokenSync(
        tokenId, 'ohos.permission.READ_CONTACTS');
      const actual1: boolean = selfToken > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertTrue();
      const actual2: string = typeof status;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('number');
      expect(status === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED ||
        status === abilityAccessCtrl.GrantStatus.PERMISSION_DENIED).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidPermissionMatrix0011 end');
    })

    /**
     * @tc.number    SUB_OAID_PERMISSION_0012
     * @tc.name      oaidPermissionMatrix0012
     * @tc.desc      checkAccessTokenSync(WRITE_CONTACTS) 状态合法
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidPermissionMatrix0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidPermissionMatrix0012 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      const selfToken: number = info.appInfo.accessTokenId;
      const tokenId: number = selfToken + 0;
      const atManager: abilityAccessCtrl.AtManager = abilityAccessCtrl.createAtManager();
      const status: abilityAccessCtrl.GrantStatus = atManager.checkAccessTokenSync(
        tokenId, 'ohos.permission.WRITE_CONTACTS');
      const actual1: boolean = selfToken > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertTrue();
      const actual2: string = typeof status;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('number');
      expect(status === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED ||
        status === abilityAccessCtrl.GrantStatus.PERMISSION_DENIED).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidPermissionMatrix0012 end');
    })

    /**
     * @tc.number    SUB_OAID_PERMISSION_0013
     * @tc.name      oaidPermissionMatrix0013
     * @tc.desc      checkAccessTokenSync(APP_TRACKING_CONSENT+1) 状态合法
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidPermissionMatrix0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidPermissionMatrix0013 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      const selfToken: number = info.appInfo.accessTokenId;
      const tokenId: number = selfToken + 1;
      const atManager: abilityAccessCtrl.AtManager = abilityAccessCtrl.createAtManager();
      const status: abilityAccessCtrl.GrantStatus = atManager.checkAccessTokenSync(
        tokenId, 'ohos.permission.APP_TRACKING_CONSENT');
      const actual1: boolean = selfToken > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertTrue();
      const actual2: string = typeof status;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('number');
      expect(status === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED ||
        status === abilityAccessCtrl.GrantStatus.PERMISSION_DENIED).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidPermissionMatrix0013 end');
    })

    /**
     * @tc.number    SUB_OAID_PERMISSION_0014
     * @tc.name      oaidPermissionMatrix0014
     * @tc.desc      checkAccessTokenSync(INTERNET+1) 状态合法
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidPermissionMatrix0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidPermissionMatrix0014 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      const selfToken: number = info.appInfo.accessTokenId;
      const tokenId: number = selfToken + 1;
      const atManager: abilityAccessCtrl.AtManager = abilityAccessCtrl.createAtManager();
      const status: abilityAccessCtrl.GrantStatus = atManager.checkAccessTokenSync(
        tokenId, 'ohos.permission.INTERNET');
      const actual1: boolean = selfToken > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertTrue();
      const actual2: string = typeof status;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('number');
      expect(status === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED ||
        status === abilityAccessCtrl.GrantStatus.PERMISSION_DENIED).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidPermissionMatrix0014 end');
    })

    /**
     * @tc.number    SUB_OAID_PERMISSION_0015
     * @tc.name      oaidPermissionMatrix0015
     * @tc.desc      checkAccessTokenSync(KEEP_BACKGROUND_RUNNING+1) 状态合法
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidPermissionMatrix0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidPermissionMatrix0015 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      const selfToken: number = info.appInfo.accessTokenId;
      const tokenId: number = selfToken + 1;
      const atManager: abilityAccessCtrl.AtManager = abilityAccessCtrl.createAtManager();
      const status: abilityAccessCtrl.GrantStatus = atManager.checkAccessTokenSync(
        tokenId, 'ohos.permission.KEEP_BACKGROUND_RUNNING');
      const actual1: boolean = selfToken > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertTrue();
      const actual2: string = typeof status;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('number');
      expect(status === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED ||
        status === abilityAccessCtrl.GrantStatus.PERMISSION_DENIED).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidPermissionMatrix0015 end');
    })

    /**
     * @tc.number    SUB_OAID_PERMISSION_0016
     * @tc.name      oaidPermissionMatrix0016
     * @tc.desc      checkAccessTokenSync(DISTRIBUTED_DATASYNC+1) 状态合法
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidPermissionMatrix0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidPermissionMatrix0016 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      const selfToken: number = info.appInfo.accessTokenId;
      const tokenId: number = selfToken + 1;
      const atManager: abilityAccessCtrl.AtManager = abilityAccessCtrl.createAtManager();
      const status: abilityAccessCtrl.GrantStatus = atManager.checkAccessTokenSync(
        tokenId, 'ohos.permission.DISTRIBUTED_DATASYNC');
      const actual1: boolean = selfToken > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertTrue();
      const actual2: string = typeof status;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('number');
      expect(status === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED ||
        status === abilityAccessCtrl.GrantStatus.PERMISSION_DENIED).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidPermissionMatrix0016 end');
    })

    /**
     * @tc.number    SUB_OAID_PERMISSION_0017
     * @tc.name      oaidPermissionMatrix0017
     * @tc.desc      checkAccessTokenSync(CAMERA+1) 状态合法
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidPermissionMatrix0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidPermissionMatrix0017 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      const selfToken: number = info.appInfo.accessTokenId;
      const tokenId: number = selfToken + 1;
      const atManager: abilityAccessCtrl.AtManager = abilityAccessCtrl.createAtManager();
      const status: abilityAccessCtrl.GrantStatus = atManager.checkAccessTokenSync(
        tokenId, 'ohos.permission.CAMERA');
      const actual1: boolean = selfToken > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertTrue();
      const actual2: string = typeof status;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('number');
      expect(status === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED ||
        status === abilityAccessCtrl.GrantStatus.PERMISSION_DENIED).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidPermissionMatrix0017 end');
    })

    /**
     * @tc.number    SUB_OAID_PERMISSION_0018
     * @tc.name      oaidPermissionMatrix0018
     * @tc.desc      checkAccessTokenSync(MICROPHONE+1) 状态合法
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidPermissionMatrix0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidPermissionMatrix0018 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      const selfToken: number = info.appInfo.accessTokenId;
      const tokenId: number = selfToken + 1;
      const atManager: abilityAccessCtrl.AtManager = abilityAccessCtrl.createAtManager();
      const status: abilityAccessCtrl.GrantStatus = atManager.checkAccessTokenSync(
        tokenId, 'ohos.permission.MICROPHONE');
      const actual1: boolean = selfToken > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertTrue();
      const actual2: string = typeof status;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('number');
      expect(status === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED ||
        status === abilityAccessCtrl.GrantStatus.PERMISSION_DENIED).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidPermissionMatrix0018 end');
    })

    /**
     * @tc.number    SUB_OAID_PERMISSION_0019
     * @tc.name      oaidPermissionMatrix0019
     * @tc.desc      checkAccessTokenSync(READ_MEDIA+1) 状态合法
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidPermissionMatrix0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidPermissionMatrix0019 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      const selfToken: number = info.appInfo.accessTokenId;
      const tokenId: number = selfToken + 1;
      const atManager: abilityAccessCtrl.AtManager = abilityAccessCtrl.createAtManager();
      const status: abilityAccessCtrl.GrantStatus = atManager.checkAccessTokenSync(
        tokenId, 'ohos.permission.READ_MEDIA');
      const actual1: boolean = selfToken > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertTrue();
      const actual2: string = typeof status;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('number');
      expect(status === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED ||
        status === abilityAccessCtrl.GrantStatus.PERMISSION_DENIED).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidPermissionMatrix0019 end');
    })

    /**
     * @tc.number    SUB_OAID_PERMISSION_0020
     * @tc.name      oaidPermissionMatrix0020
     * @tc.desc      checkAccessTokenSync(WRITE_MEDIA+1) 状态合法
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidPermissionMatrix0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidPermissionMatrix0020 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      const selfToken: number = info.appInfo.accessTokenId;
      const tokenId: number = selfToken + 1;
      const atManager: abilityAccessCtrl.AtManager = abilityAccessCtrl.createAtManager();
      const status: abilityAccessCtrl.GrantStatus = atManager.checkAccessTokenSync(
        tokenId, 'ohos.permission.WRITE_MEDIA');
      const actual1: boolean = selfToken > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertTrue();
      const actual2: string = typeof status;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('number');
      expect(status === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED ||
        status === abilityAccessCtrl.GrantStatus.PERMISSION_DENIED).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidPermissionMatrix0020 end');
    })

    /**
     * @tc.number    SUB_OAID_PERMISSION_0021
     * @tc.name      oaidPermissionMatrix0021
     * @tc.desc      checkAccessTokenSync(LOCATION+1) 状态合法
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidPermissionMatrix0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidPermissionMatrix0021 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      const selfToken: number = info.appInfo.accessTokenId;
      const tokenId: number = selfToken + 1;
      const atManager: abilityAccessCtrl.AtManager = abilityAccessCtrl.createAtManager();
      const status: abilityAccessCtrl.GrantStatus = atManager.checkAccessTokenSync(
        tokenId, 'ohos.permission.LOCATION');
      const actual1: boolean = selfToken > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertTrue();
      const actual2: string = typeof status;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('number');
      expect(status === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED ||
        status === abilityAccessCtrl.GrantStatus.PERMISSION_DENIED).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidPermissionMatrix0021 end');
    })

    /**
     * @tc.number    SUB_OAID_PERMISSION_0022
     * @tc.name      oaidPermissionMatrix0022
     * @tc.desc      checkAccessTokenSync(APPROXIMATELY_LOCATION+1) 状态合法
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidPermissionMatrix0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidPermissionMatrix0022 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      const selfToken: number = info.appInfo.accessTokenId;
      const tokenId: number = selfToken + 1;
      const atManager: abilityAccessCtrl.AtManager = abilityAccessCtrl.createAtManager();
      const status: abilityAccessCtrl.GrantStatus = atManager.checkAccessTokenSync(
        tokenId, 'ohos.permission.APPROXIMATELY_LOCATION');
      const actual1: boolean = selfToken > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertTrue();
      const actual2: string = typeof status;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('number');
      expect(status === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED ||
        status === abilityAccessCtrl.GrantStatus.PERMISSION_DENIED).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidPermissionMatrix0022 end');
    })

    /**
     * @tc.number    SUB_OAID_PERMISSION_0023
     * @tc.name      oaidPermissionMatrix0023
     * @tc.desc      checkAccessTokenSync(READ_CONTACTS+1) 状态合法
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidPermissionMatrix0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidPermissionMatrix0023 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      const selfToken: number = info.appInfo.accessTokenId;
      const tokenId: number = selfToken + 1;
      const atManager: abilityAccessCtrl.AtManager = abilityAccessCtrl.createAtManager();
      const status: abilityAccessCtrl.GrantStatus = atManager.checkAccessTokenSync(
        tokenId, 'ohos.permission.READ_CONTACTS');
      const actual1: boolean = selfToken > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertTrue();
      const actual2: string = typeof status;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('number');
      expect(status === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED ||
        status === abilityAccessCtrl.GrantStatus.PERMISSION_DENIED).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidPermissionMatrix0023 end');
    })

    /**
     * @tc.number    SUB_OAID_PERMISSION_0024
     * @tc.name      oaidPermissionMatrix0024
     * @tc.desc      checkAccessTokenSync(WRITE_CONTACTS+1) 状态合法
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidPermissionMatrix0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidPermissionMatrix0024 begin');
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      const selfToken: number = info.appInfo.accessTokenId;
      const tokenId: number = selfToken + 1;
      const atManager: abilityAccessCtrl.AtManager = abilityAccessCtrl.createAtManager();
      const status: abilityAccessCtrl.GrantStatus = atManager.checkAccessTokenSync(
        tokenId, 'ohos.permission.WRITE_CONTACTS');
      const actual1: boolean = selfToken > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertTrue();
      const actual2: string = typeof status;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('number');
      expect(status === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED ||
        status === abilityAccessCtrl.GrantStatus.PERMISSION_DENIED).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidPermissionMatrix0024 end');
    })
  })
}
