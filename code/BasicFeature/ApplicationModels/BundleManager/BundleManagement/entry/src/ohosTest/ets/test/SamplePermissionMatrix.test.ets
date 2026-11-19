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
import { abilityAccessCtrl, bundleManager } from '@kit.AbilityKit';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_BundleManagement]';

export default function samplePermissionMatrixTest(): void {
  describe('SamplePermissionMatrixTest', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 util/TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });

    /**
     * @tc.number    SUB_BUNDLE_MGMT_PERMISSION_0001
     * @tc.name      samplePermissionMatrix0001
     * @tc.desc      checkAccessTokenSync(INTERNET) 状态合法
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('samplePermissionMatrix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'samplePermissionMatrix0001 begin');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'samplePermissionMatrix0001 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_PERMISSION_0002
     * @tc.name      samplePermissionMatrix0002
     * @tc.desc      checkAccessTokenSync(KEEP_BACKGROUND_RUNNING) 状态合法
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('samplePermissionMatrix0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'samplePermissionMatrix0002 begin');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'samplePermissionMatrix0002 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_PERMISSION_0003
     * @tc.name      samplePermissionMatrix0003
     * @tc.desc      checkAccessTokenSync(DISTRIBUTED_DATASYNC) 状态合法
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('samplePermissionMatrix0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'samplePermissionMatrix0003 begin');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'samplePermissionMatrix0003 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_PERMISSION_0004
     * @tc.name      samplePermissionMatrix0004
     * @tc.desc      checkAccessTokenSync(CAMERA) 状态合法
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('samplePermissionMatrix0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'samplePermissionMatrix0004 begin');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'samplePermissionMatrix0004 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_PERMISSION_0005
     * @tc.name      samplePermissionMatrix0005
     * @tc.desc      checkAccessTokenSync(MICROPHONE) 状态合法
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('samplePermissionMatrix0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'samplePermissionMatrix0005 begin');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'samplePermissionMatrix0005 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_PERMISSION_0006
     * @tc.name      samplePermissionMatrix0006
     * @tc.desc      checkAccessTokenSync(READ_MEDIA) 状态合法
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('samplePermissionMatrix0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'samplePermissionMatrix0006 begin');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'samplePermissionMatrix0006 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_PERMISSION_0007
     * @tc.name      samplePermissionMatrix0007
     * @tc.desc      checkAccessTokenSync(WRITE_MEDIA) 状态合法
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('samplePermissionMatrix0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'samplePermissionMatrix0007 begin');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'samplePermissionMatrix0007 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_PERMISSION_0008
     * @tc.name      samplePermissionMatrix0008
     * @tc.desc      checkAccessTokenSync(LOCATION) 状态合法
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('samplePermissionMatrix0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'samplePermissionMatrix0008 begin');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'samplePermissionMatrix0008 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_PERMISSION_0009
     * @tc.name      samplePermissionMatrix0009
     * @tc.desc      checkAccessTokenSync(APPROXIMATELY_LOCATION) 状态合法
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('samplePermissionMatrix0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'samplePermissionMatrix0009 begin');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'samplePermissionMatrix0009 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_PERMISSION_0010
     * @tc.name      samplePermissionMatrix0010
     * @tc.desc      checkAccessTokenSync(READ_CONTACTS) 状态合法
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('samplePermissionMatrix0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'samplePermissionMatrix0010 begin');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'samplePermissionMatrix0010 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_PERMISSION_0011
     * @tc.name      samplePermissionMatrix0011
     * @tc.desc      checkAccessTokenSync(WRITE_CONTACTS) 状态合法
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('samplePermissionMatrix0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'samplePermissionMatrix0011 begin');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'samplePermissionMatrix0011 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_PERMISSION_0012
     * @tc.name      samplePermissionMatrix0012
     * @tc.desc      checkAccessTokenSync(APP_TRACKING_CONSENT) 状态合法
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('samplePermissionMatrix0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'samplePermissionMatrix0012 begin');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'samplePermissionMatrix0012 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_PERMISSION_0013
     * @tc.name      samplePermissionMatrix0013
     * @tc.desc      checkAccessTokenSync(INTERNET+1) 状态合法
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('samplePermissionMatrix0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'samplePermissionMatrix0013 begin');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'samplePermissionMatrix0013 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_PERMISSION_0014
     * @tc.name      samplePermissionMatrix0014
     * @tc.desc      checkAccessTokenSync(KEEP_BACKGROUND_RUNNING+1) 状态合法
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('samplePermissionMatrix0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'samplePermissionMatrix0014 begin');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'samplePermissionMatrix0014 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_PERMISSION_0015
     * @tc.name      samplePermissionMatrix0015
     * @tc.desc      checkAccessTokenSync(DISTRIBUTED_DATASYNC+1) 状态合法
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('samplePermissionMatrix0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'samplePermissionMatrix0015 begin');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'samplePermissionMatrix0015 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_PERMISSION_0016
     * @tc.name      samplePermissionMatrix0016
     * @tc.desc      checkAccessTokenSync(CAMERA+1) 状态合法
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('samplePermissionMatrix0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'samplePermissionMatrix0016 begin');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'samplePermissionMatrix0016 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_PERMISSION_0017
     * @tc.name      samplePermissionMatrix0017
     * @tc.desc      checkAccessTokenSync(MICROPHONE+1) 状态合法
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('samplePermissionMatrix0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'samplePermissionMatrix0017 begin');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'samplePermissionMatrix0017 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_PERMISSION_0018
     * @tc.name      samplePermissionMatrix0018
     * @tc.desc      checkAccessTokenSync(READ_MEDIA+1) 状态合法
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('samplePermissionMatrix0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'samplePermissionMatrix0018 begin');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'samplePermissionMatrix0018 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_PERMISSION_0019
     * @tc.name      samplePermissionMatrix0019
     * @tc.desc      checkAccessTokenSync(WRITE_MEDIA+1) 状态合法
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('samplePermissionMatrix0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'samplePermissionMatrix0019 begin');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'samplePermissionMatrix0019 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_PERMISSION_0020
     * @tc.name      samplePermissionMatrix0020
     * @tc.desc      checkAccessTokenSync(LOCATION+1) 状态合法
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('samplePermissionMatrix0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'samplePermissionMatrix0020 begin');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'samplePermissionMatrix0020 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_PERMISSION_0021
     * @tc.name      samplePermissionMatrix0021
     * @tc.desc      checkAccessTokenSync(APPROXIMATELY_LOCATION+1) 状态合法
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('samplePermissionMatrix0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'samplePermissionMatrix0021 begin');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'samplePermissionMatrix0021 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_PERMISSION_0022
     * @tc.name      samplePermissionMatrix0022
     * @tc.desc      checkAccessTokenSync(READ_CONTACTS+1) 状态合法
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('samplePermissionMatrix0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'samplePermissionMatrix0022 begin');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'samplePermissionMatrix0022 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_PERMISSION_0023
     * @tc.name      samplePermissionMatrix0023
     * @tc.desc      checkAccessTokenSync(WRITE_CONTACTS+1) 状态合法
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('samplePermissionMatrix0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'samplePermissionMatrix0023 begin');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'samplePermissionMatrix0023 end');
    })

    /**
     * @tc.number    SUB_BUNDLE_MGMT_PERMISSION_0024
     * @tc.name      samplePermissionMatrix0024
     * @tc.desc      checkAccessTokenSync(APP_TRACKING_CONSENT+1) 状态合法
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('samplePermissionMatrix0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'samplePermissionMatrix0024 begin');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'samplePermissionMatrix0024 end');
    })
  })
}
