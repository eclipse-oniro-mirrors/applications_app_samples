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
import { bundleManager } from '@kit.AbilityKit';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_OAID]';

export default function oaidBundleInfoMatrixTest(): void {
  describe('OaidBundleInfoMatrixTest', () => {
    /**
     * @tc.number    SUB_OAID_BUNDLE_INFO_0001
     * @tc.name      oaidBundleInfoMatrix0001
     * @tc.desc      getBundleInfoForSelfSync 的 name 字段取值符合预期
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidBundleInfoMatrix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidBundleInfoMatrix0001 begin');
      const flags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SIGNATURE_INFO;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.name=${info.name}`);
      expect(info.name).assertEqual('com.samples.oaid');
      const actual2: string = typeof info.name;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('string');
      const actual3: boolean = info.name.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      const actual4: boolean = info.versionCode > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidBundleInfoMatrix0001 end');
    })

    /**
     * @tc.number    SUB_OAID_BUNDLE_INFO_0002
     * @tc.name      oaidBundleInfoMatrix0002
     * @tc.desc      getBundleInfoForSelfSync 的 vendor 字段取值符合预期
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidBundleInfoMatrix0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidBundleInfoMatrix0002 begin');
      const flags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SIGNATURE_INFO;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      const actual1: string = typeof info.vendor;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('string');
      const actual2: string = typeof info.name;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('string');
      const actual3: boolean = info.name.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      const actual4: boolean = info.versionCode > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidBundleInfoMatrix0002 end');
    })

    /**
     * @tc.number    SUB_OAID_BUNDLE_INFO_0003
     * @tc.name      oaidBundleInfoMatrix0003
     * @tc.desc      getBundleInfoForSelfSync 的 versionCode 字段取值符合预期
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidBundleInfoMatrix0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidBundleInfoMatrix0003 begin');
      const flags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SIGNATURE_INFO;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.versionCode=${info.versionCode}`);
      expect(info.versionCode).assertEqual(1000000);
      const actual2: string = typeof info.name;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('string');
      const actual3: boolean = info.name.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      const actual4: boolean = info.versionCode > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidBundleInfoMatrix0003 end');
    })

    /**
     * @tc.number    SUB_OAID_BUNDLE_INFO_0004
     * @tc.name      oaidBundleInfoMatrix0004
     * @tc.desc      getBundleInfoForSelfSync 的 versionName 字段取值符合预期
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidBundleInfoMatrix0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidBundleInfoMatrix0004 begin');
      const flags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SIGNATURE_INFO;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      const actual1: boolean = info.versionName.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertTrue();
      const actual2: string = typeof info.name;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('string');
      const actual3: boolean = info.name.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      const actual4: boolean = info.versionCode > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidBundleInfoMatrix0004 end');
    })

    /**
     * @tc.number    SUB_OAID_BUNDLE_INFO_0005
     * @tc.name      oaidBundleInfoMatrix0005
     * @tc.desc      getBundleInfoForSelfSync 的 minCompatibleVersionCode 字段取值符合预期
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidBundleInfoMatrix0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidBundleInfoMatrix0005 begin');
      const flags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SIGNATURE_INFO;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      const actual1: boolean = info.minCompatibleVersionCode >= 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertTrue();
      const actual2: string = typeof info.name;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('string');
      const actual3: boolean = info.name.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      const actual4: boolean = info.versionCode > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidBundleInfoMatrix0005 end');
    })

    /**
     * @tc.number    SUB_OAID_BUNDLE_INFO_0006
     * @tc.name      oaidBundleInfoMatrix0006
     * @tc.desc      getBundleInfoForSelfSync 的 targetVersion 字段取值符合预期
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidBundleInfoMatrix0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidBundleInfoMatrix0006 begin');
      const flags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SIGNATURE_INFO;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      const actual1: boolean = info.targetVersion >= 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertTrue();
      const actual2: string = typeof info.name;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('string');
      const actual3: boolean = info.name.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      const actual4: boolean = info.versionCode > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidBundleInfoMatrix0006 end');
    })

    /**
     * @tc.number    SUB_OAID_BUNDLE_INFO_0007
     * @tc.name      oaidBundleInfoMatrix0007
     * @tc.desc      getBundleInfoForSelfSync 的 signatureInfo.appId 字段取值符合预期
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidBundleInfoMatrix0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidBundleInfoMatrix0007 begin');
      const flags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SIGNATURE_INFO;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      const actual1: boolean = info.signatureInfo.appId.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertTrue();
      const actual2: string = typeof info.name;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('string');
      const actual3: boolean = info.name.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      const actual4: boolean = info.versionCode > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidBundleInfoMatrix0007 end');
    })

    /**
     * @tc.number    SUB_OAID_BUNDLE_INFO_0008
     * @tc.name      oaidBundleInfoMatrix0008
     * @tc.desc      getBundleInfoForSelfSync 的 signatureInfo.appIdentifier 字段取值符合预期
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidBundleInfoMatrix0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidBundleInfoMatrix0008 begin');
      const flags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SIGNATURE_INFO;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      const actual1: boolean = info.signatureInfo.appIdentifier.length >= 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertTrue();
      const actual2: string = typeof info.name;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('string');
      const actual3: boolean = info.name.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      const actual4: boolean = info.versionCode > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidBundleInfoMatrix0008 end');
    })

    /**
     * @tc.number    SUB_OAID_BUNDLE_INFO_0009
     * @tc.name      oaidBundleInfoMatrix0009
     * @tc.desc      getBundleInfoForSelfSync 的 signatureInfo.fingerprint 字段取值符合预期
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidBundleInfoMatrix0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidBundleInfoMatrix0009 begin');
      const flags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SIGNATURE_INFO;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      const actual1: boolean = info.signatureInfo.fingerprint.length >= 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertTrue();
      const actual2: string = typeof info.name;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('string');
      const actual3: boolean = info.name.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      const actual4: boolean = info.versionCode > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidBundleInfoMatrix0009 end');
    })

    /**
     * @tc.number    SUB_OAID_BUNDLE_INFO_0010
     * @tc.name      oaidBundleInfoMatrix0010
     * @tc.desc      getBundleInfoForSelfSync 的 installTime 字段取值符合预期
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidBundleInfoMatrix0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidBundleInfoMatrix0010 begin');
      const flags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SIGNATURE_INFO;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      const actual1: boolean = info.installTime > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertTrue();
      const actual2: string = typeof info.name;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('string');
      const actual3: boolean = info.name.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      const actual4: boolean = info.versionCode > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidBundleInfoMatrix0010 end');
    })

    /**
     * @tc.number    SUB_OAID_BUNDLE_INFO_0011
     * @tc.name      oaidBundleInfoMatrix0011
     * @tc.desc      getBundleInfoForSelfSync 的 updateTime 字段取值符合预期
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidBundleInfoMatrix0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidBundleInfoMatrix0011 begin');
      const flags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SIGNATURE_INFO;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      const actual1: boolean = info.updateTime > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertTrue();
      const actual2: string = typeof info.name;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('string');
      const actual3: boolean = info.name.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      const actual4: boolean = info.versionCode > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidBundleInfoMatrix0011 end');
    })

    /**
     * @tc.number    SUB_OAID_BUNDLE_INFO_0012
     * @tc.name      oaidBundleInfoMatrix0012
     * @tc.desc      getBundleInfoForSelfSync 的 appIndex 字段取值符合预期
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidBundleInfoMatrix0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidBundleInfoMatrix0012 begin');
      const flags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SIGNATURE_INFO;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.appIndex=${info.appIndex}`);
      expect(info.appIndex).assertEqual(0);
      const actual2: string = typeof info.name;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('string');
      const actual3: boolean = info.name.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      const actual4: boolean = info.versionCode > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidBundleInfoMatrix0012 end');
    })

    /**
     * @tc.number    SUB_OAID_BUNDLE_INFO_0013
     * @tc.name      oaidBundleInfoMatrix0013
     * @tc.desc      getBundleInfoForSelfSync 的 firstInstallTime 字段取值符合预期
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidBundleInfoMatrix0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidBundleInfoMatrix0013 begin');
      const flags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SIGNATURE_INFO;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      const actual1: boolean = (info.firstInstallTime ?? 0) >= 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertTrue();
      const actual2: string = typeof info.name;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('string');
      const actual3: boolean = info.name.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      const actual4: boolean = info.versionCode > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidBundleInfoMatrix0013 end');
    })

    /**
     * @tc.number    SUB_OAID_BUNDLE_INFO_0014
     * @tc.name      oaidBundleInfoMatrix0014
     * @tc.desc      getBundleInfoForSelfSync 的 buildVersion 字段取值符合预期
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidBundleInfoMatrix0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidBundleInfoMatrix0014 begin');
      const flags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SIGNATURE_INFO;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      const actual1: string = typeof (info.buildVersion ?? '');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('string');
      const actual2: string = typeof info.name;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('string');
      const actual3: boolean = info.name.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      const actual4: boolean = info.versionCode > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidBundleInfoMatrix0014 end');
    })

    /**
     * @tc.number    SUB_OAID_BUNDLE_INFO_0015
     * @tc.name      oaidBundleInfoMatrix0015
     * @tc.desc      getBundleInfoForSelfSync 的 appInfo.name 字段取值符合预期
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidBundleInfoMatrix0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidBundleInfoMatrix0015 begin');
      const flags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SIGNATURE_INFO;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.appInfo.name=${info.appInfo.name}`);
      expect(info.appInfo.name).assertEqual('com.samples.oaid');
      const actual2: string = typeof info.name;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('string');
      const actual3: boolean = info.name.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      const actual4: boolean = info.versionCode > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidBundleInfoMatrix0015 end');
    })

    /**
     * @tc.number    SUB_OAID_BUNDLE_INFO_0016
     * @tc.name      oaidBundleInfoMatrix0016
     * @tc.desc      getBundleInfoForSelfSync 的 appInfo.label 字段取值符合预期
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidBundleInfoMatrix0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidBundleInfoMatrix0016 begin');
      const flags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SIGNATURE_INFO;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      const actual1: boolean = info.appInfo.label.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertTrue();
      const actual2: string = typeof info.name;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('string');
      const actual3: boolean = info.name.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      const actual4: boolean = info.versionCode > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidBundleInfoMatrix0016 end');
    })

    /**
     * @tc.number    SUB_OAID_BUNDLE_INFO_0017
     * @tc.name      oaidBundleInfoMatrix0017
     * @tc.desc      getBundleInfoForSelfSync 的 appInfo.description 字段取值符合预期
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidBundleInfoMatrix0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidBundleInfoMatrix0017 begin');
      const flags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SIGNATURE_INFO;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      const actual1: boolean = info.appInfo.description.length >= 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertTrue();
      const actual2: string = typeof info.name;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('string');
      const actual3: boolean = info.name.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      const actual4: boolean = info.versionCode > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidBundleInfoMatrix0017 end');
    })

    /**
     * @tc.number    SUB_OAID_BUNDLE_INFO_0018
     * @tc.name      oaidBundleInfoMatrix0018
     * @tc.desc      getBundleInfoForSelfSync 的 appInfo.enabled 字段取值符合预期
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidBundleInfoMatrix0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidBundleInfoMatrix0018 begin');
      const flags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SIGNATURE_INFO;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.appInfo.enabled=${info.appInfo.enabled}`);
      expect(info.appInfo.enabled).assertTrue();
      const actual2: string = typeof info.name;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('string');
      const actual3: boolean = info.name.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      const actual4: boolean = info.versionCode > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidBundleInfoMatrix0018 end');
    })

    /**
     * @tc.number    SUB_OAID_BUNDLE_INFO_0019
     * @tc.name      oaidBundleInfoMatrix0019
     * @tc.desc      getBundleInfoForSelfSync 的 appInfo.systemApp 字段取值符合预期
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidBundleInfoMatrix0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidBundleInfoMatrix0019 begin');
      const flags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SIGNATURE_INFO;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.appInfo.systemApp=${info.appInfo.systemApp}`);
      expect(info.appInfo.systemApp).assertFalse();
      const actual2: string = typeof info.name;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('string');
      const actual3: boolean = info.name.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      const actual4: boolean = info.versionCode > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidBundleInfoMatrix0019 end');
    })

    /**
     * @tc.number    SUB_OAID_BUNDLE_INFO_0020
     * @tc.name      oaidBundleInfoMatrix0020
     * @tc.desc      getBundleInfoForSelfSync 的 appInfo.bundleType 字段取值符合预期
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidBundleInfoMatrix0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidBundleInfoMatrix0020 begin');
      const flags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SIGNATURE_INFO;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.appInfo.bundleType=${info.appInfo.bundleType}`);
      expect(info.appInfo.bundleType).assertEqual(0);
      const actual2: string = typeof info.name;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('string');
      const actual3: boolean = info.name.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      const actual4: boolean = info.versionCode > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidBundleInfoMatrix0020 end');
    })

    /**
     * @tc.number    SUB_OAID_BUNDLE_INFO_0021
     * @tc.name      oaidBundleInfoMatrix0021
     * @tc.desc      getBundleInfoForSelfSync 的 appInfo.uid 字段取值符合预期
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidBundleInfoMatrix0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidBundleInfoMatrix0021 begin');
      const flags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SIGNATURE_INFO;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      const actual1: boolean = info.appInfo.uid >= 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertTrue();
      const actual2: string = typeof info.name;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('string');
      const actual3: boolean = info.name.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      const actual4: boolean = info.versionCode > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidBundleInfoMatrix0021 end');
    })

    /**
     * @tc.number    SUB_OAID_BUNDLE_INFO_0022
     * @tc.name      oaidBundleInfoMatrix0022
     * @tc.desc      getBundleInfoForSelfSync 的 appInfo.accessTokenId 字段取值符合预期
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidBundleInfoMatrix0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidBundleInfoMatrix0022 begin');
      const flags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SIGNATURE_INFO;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      const actual1: boolean = info.appInfo.accessTokenId >= 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertTrue();
      const actual2: string = typeof info.name;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('string');
      const actual3: boolean = info.name.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      const actual4: boolean = info.versionCode > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidBundleInfoMatrix0022 end');
    })

    /**
     * @tc.number    SUB_OAID_BUNDLE_INFO_0023
     * @tc.name      oaidBundleInfoMatrix0023
     * @tc.desc      getBundleInfoForSelfSync 的 appInfo.codePath 字段取值符合预期
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidBundleInfoMatrix0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidBundleInfoMatrix0023 begin');
      const flags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SIGNATURE_INFO;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      const actual1: boolean = info.appInfo.codePath.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertTrue();
      const actual2: string = typeof info.name;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('string');
      const actual3: boolean = info.name.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      const actual4: boolean = info.versionCode > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidBundleInfoMatrix0023 end');
    })

    /**
     * @tc.number    SUB_OAID_BUNDLE_INFO_0024
     * @tc.name      oaidBundleInfoMatrix0024
     * @tc.desc      getBundleInfoForSelfSync 的 appInfo.process 字段取值符合预期
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidBundleInfoMatrix0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidBundleInfoMatrix0024 begin');
      const flags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SIGNATURE_INFO;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      const actual1: boolean = info.appInfo.process.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertTrue();
      const actual2: string = typeof info.name;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('string');
      const actual3: boolean = info.name.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      const actual4: boolean = info.versionCode > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidBundleInfoMatrix0024 end');
    })

    /**
     * @tc.number    SUB_OAID_BUNDLE_INFO_0025
     * @tc.name      oaidBundleInfoMatrix0025
     * @tc.desc      getBundleInfoForSelfSync 的 appInfo.removable 字段取值符合预期
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidBundleInfoMatrix0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidBundleInfoMatrix0025 begin');
      const flags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SIGNATURE_INFO;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      const actual1: string = typeof info.appInfo.removable;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('boolean');
      const actual2: string = typeof info.name;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('string');
      const actual3: boolean = info.name.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      const actual4: boolean = info.versionCode > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidBundleInfoMatrix0025 end');
    })

    /**
     * @tc.number    SUB_OAID_BUNDLE_INFO_0026
     * @tc.name      oaidBundleInfoMatrix0026
     * @tc.desc      getBundleInfoForSelfSync 的 appInfo.debug 字段取值符合预期
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidBundleInfoMatrix0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidBundleInfoMatrix0026 begin');
      const flags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SIGNATURE_INFO;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      const actual1: string = typeof info.appInfo.debug;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('boolean');
      const actual2: string = typeof info.name;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('string');
      const actual3: boolean = info.name.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      const actual4: boolean = info.versionCode > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidBundleInfoMatrix0026 end');
    })

    /**
     * @tc.number    SUB_OAID_BUNDLE_INFO_0027
     * @tc.name      oaidBundleInfoMatrix0027
     * @tc.desc      getBundleInfoForSelfSync 的 appInfo.appProvisionType 字段取值符合预期
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidBundleInfoMatrix0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidBundleInfoMatrix0027 begin');
      const flags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SIGNATURE_INFO;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      const actual1: boolean = info.appInfo.appProvisionType.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertTrue();
      const actual2: string = typeof info.name;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('string');
      const actual3: boolean = info.name.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      const actual4: boolean = info.versionCode > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidBundleInfoMatrix0027 end');
    })

    /**
     * @tc.number    SUB_OAID_BUNDLE_INFO_0028
     * @tc.name      oaidBundleInfoMatrix0028
     * @tc.desc      getBundleInfoForSelfSync 的 appInfo.appDistributionType 字段取值符合预期
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidBundleInfoMatrix0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidBundleInfoMatrix0028 begin');
      const flags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SIGNATURE_INFO;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      const actual1: boolean = info.appInfo.appDistributionType.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertTrue();
      const actual2: string = typeof info.name;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('string');
      const actual3: boolean = info.name.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      const actual4: boolean = info.versionCode > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidBundleInfoMatrix0028 end');
    })

    /**
     * @tc.number    SUB_OAID_BUNDLE_INFO_0029
     * @tc.name      oaidBundleInfoMatrix0029
     * @tc.desc      getBundleInfoForSelfSync 的 appInfo.installSource 字段取值符合预期
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidBundleInfoMatrix0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidBundleInfoMatrix0029 begin');
      const flags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SIGNATURE_INFO;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      const actual1: boolean = info.appInfo.installSource.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertTrue();
      const actual2: string = typeof info.name;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('string');
      const actual3: boolean = info.name.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      const actual4: boolean = info.versionCode > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidBundleInfoMatrix0029 end');
    })

    /**
     * @tc.number    SUB_OAID_BUNDLE_INFO_0030
     * @tc.name      oaidBundleInfoMatrix0030
     * @tc.desc      getBundleInfoForSelfSync 的 appInfo.releaseType 字段取值符合预期
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidBundleInfoMatrix0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidBundleInfoMatrix0030 begin');
      const flags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SIGNATURE_INFO;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      const actual1: boolean = info.appInfo.releaseType.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertTrue();
      const actual2: string = typeof info.name;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('string');
      const actual3: boolean = info.name.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      const actual4: boolean = info.versionCode > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidBundleInfoMatrix0030 end');
    })

    /**
     * @tc.number    SUB_OAID_BUNDLE_INFO_0031
     * @tc.name      oaidBundleInfoMatrix0031
     * @tc.desc      getBundleInfoForSelfSync 的 appInfo.dataUnclearable 字段取值符合预期
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidBundleInfoMatrix0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidBundleInfoMatrix0031 begin');
      const flags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SIGNATURE_INFO;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      const actual1: string = typeof info.appInfo.dataUnclearable;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('boolean');
      const actual2: string = typeof info.name;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('string');
      const actual3: boolean = info.name.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      const actual4: boolean = info.versionCode > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidBundleInfoMatrix0031 end');
    })

    /**
     * @tc.number    SUB_OAID_BUNDLE_INFO_0032
     * @tc.name      oaidBundleInfoMatrix0032
     * @tc.desc      getBundleInfoForSelfSync 的 appInfo.nativeLibraryPath 字段取值符合预期
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidBundleInfoMatrix0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidBundleInfoMatrix0032 begin');
      const flags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SIGNATURE_INFO;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      const actual1: string = typeof info.appInfo.nativeLibraryPath;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('string');
      const actual2: string = typeof info.name;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('string');
      const actual3: boolean = info.name.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      const actual4: boolean = info.versionCode > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidBundleInfoMatrix0032 end');
    })

    /**
     * @tc.number    SUB_OAID_BUNDLE_INFO_0033
     * @tc.name      oaidBundleInfoMatrix0033
     * @tc.desc      getBundleInfoForSelfSync 的 appInfo.appIndex 字段取值符合预期
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidBundleInfoMatrix0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidBundleInfoMatrix0033 begin');
      const flags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SIGNATURE_INFO;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 info.appInfo.appIndex=${info.appInfo.appIndex}`);
      expect(info.appInfo.appIndex).assertEqual(0);
      const actual2: string = typeof info.name;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('string');
      const actual3: boolean = info.name.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      const actual4: boolean = info.versionCode > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidBundleInfoMatrix0033 end');
    })

    /**
     * @tc.number    SUB_OAID_BUNDLE_INFO_0034
     * @tc.name      oaidBundleInfoMatrix0034
     * @tc.desc      getBundleInfoForSelfSync 的 appInfo.icon 字段取值符合预期
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidBundleInfoMatrix0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidBundleInfoMatrix0034 begin');
      const flags: number =
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_SIGNATURE_INFO;
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      const actual1: string = typeof info.appInfo.icon;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('string');
      const actual2: string = typeof info.name;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('string');
      const actual3: boolean = info.name.length > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      const actual4: boolean = info.versionCode > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidBundleInfoMatrix0034 end');
    })
  })
}
