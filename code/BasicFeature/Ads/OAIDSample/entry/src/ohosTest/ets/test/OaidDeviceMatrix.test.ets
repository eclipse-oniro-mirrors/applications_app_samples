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
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { deviceInfo } from '@kit.BasicServicesKit';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_OAID]';

export default function oaidDeviceMatrixTest(): void {
  describe('OaidDeviceMatrixTest', () => {
    /**
     * @tc.number    SUB_OAID_DEVICE_0001
     * @tc.name      oaidDeviceMatrix0001
     * @tc.desc      deviceInfo.deviceType 为可读的字符串字段
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidDeviceMatrix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidDeviceMatrix0001 begin');
      const context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      const actual1: string = typeof context.applicationInfo.name;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('string');
      const actual2: string = typeof deviceInfo.deviceType;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('string');
      const actual3: boolean = deviceInfo.deviceType.length >= 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidDeviceMatrix0001 end');
    })

    /**
     * @tc.number    SUB_OAID_DEVICE_0002
     * @tc.name      oaidDeviceMatrix0002
     * @tc.desc      deviceInfo.manufacture 为可读的字符串字段
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidDeviceMatrix0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidDeviceMatrix0002 begin');
      const context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      const actual1: string = typeof context.applicationInfo.name;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('string');
      const actual2: string = typeof deviceInfo.manufacture;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('string');
      const actual3: boolean = deviceInfo.manufacture.length >= 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidDeviceMatrix0002 end');
    })

    /**
     * @tc.number    SUB_OAID_DEVICE_0003
     * @tc.name      oaidDeviceMatrix0003
     * @tc.desc      deviceInfo.brand 为可读的字符串字段
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidDeviceMatrix0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidDeviceMatrix0003 begin');
      const context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      const actual1: string = typeof context.applicationInfo.name;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('string');
      const actual2: string = typeof deviceInfo.brand;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('string');
      const actual3: boolean = deviceInfo.brand.length >= 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidDeviceMatrix0003 end');
    })

    /**
     * @tc.number    SUB_OAID_DEVICE_0004
     * @tc.name      oaidDeviceMatrix0004
     * @tc.desc      deviceInfo.marketName 为可读的字符串字段
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidDeviceMatrix0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidDeviceMatrix0004 begin');
      const context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      const actual1: string = typeof context.applicationInfo.name;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('string');
      const actual2: string = typeof deviceInfo.marketName;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('string');
      const actual3: boolean = deviceInfo.marketName.length >= 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidDeviceMatrix0004 end');
    })

    /**
     * @tc.number    SUB_OAID_DEVICE_0005
     * @tc.name      oaidDeviceMatrix0005
     * @tc.desc      deviceInfo.productSeries 为可读的字符串字段
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidDeviceMatrix0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidDeviceMatrix0005 begin');
      const context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      const actual1: string = typeof context.applicationInfo.name;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('string');
      const actual2: string = typeof deviceInfo.productSeries;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('string');
      const actual3: boolean = deviceInfo.productSeries.length >= 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidDeviceMatrix0005 end');
    })

    /**
     * @tc.number    SUB_OAID_DEVICE_0006
     * @tc.name      oaidDeviceMatrix0006
     * @tc.desc      deviceInfo.productModel 为可读的字符串字段
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidDeviceMatrix0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidDeviceMatrix0006 begin');
      const context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      const actual1: string = typeof context.applicationInfo.name;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('string');
      const actual2: string = typeof deviceInfo.productModel;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('string');
      const actual3: boolean = deviceInfo.productModel.length >= 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidDeviceMatrix0006 end');
    })

    /**
     * @tc.number    SUB_OAID_DEVICE_0007
     * @tc.name      oaidDeviceMatrix0007
     * @tc.desc      deviceInfo.productModelAlias 为可读的字符串字段
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidDeviceMatrix0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidDeviceMatrix0007 begin');
      const context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      const actual1: string = typeof context.applicationInfo.name;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('string');
      const actual2: string = typeof deviceInfo.productModelAlias;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('string');
      const actual3: boolean = deviceInfo.productModelAlias.length >= 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidDeviceMatrix0007 end');
    })

    /**
     * @tc.number    SUB_OAID_DEVICE_0008
     * @tc.name      oaidDeviceMatrix0008
     * @tc.desc      deviceInfo.softwareModel 为可读的字符串字段
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidDeviceMatrix0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidDeviceMatrix0008 begin');
      const context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      const actual1: string = typeof context.applicationInfo.name;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('string');
      const actual2: string = typeof deviceInfo.softwareModel;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('string');
      const actual3: boolean = deviceInfo.softwareModel.length >= 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidDeviceMatrix0008 end');
    })

    /**
     * @tc.number    SUB_OAID_DEVICE_0009
     * @tc.name      oaidDeviceMatrix0009
     * @tc.desc      deviceInfo.hardwareModel 为可读的字符串字段
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidDeviceMatrix0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidDeviceMatrix0009 begin');
      const context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      const actual1: string = typeof context.applicationInfo.name;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('string');
      const actual2: string = typeof deviceInfo.hardwareModel;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('string');
      const actual3: boolean = deviceInfo.hardwareModel.length >= 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidDeviceMatrix0009 end');
    })

    /**
     * @tc.number    SUB_OAID_DEVICE_0010
     * @tc.name      oaidDeviceMatrix0010
     * @tc.desc      deviceInfo.hardwareProfile 为可读的字符串字段
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidDeviceMatrix0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidDeviceMatrix0010 begin');
      const context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      const actual1: string = typeof context.applicationInfo.name;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('string');
      const actual2: string = typeof deviceInfo.hardwareProfile;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('string');
      const actual3: boolean = deviceInfo.hardwareProfile.length >= 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidDeviceMatrix0010 end');
    })

    /**
     * @tc.number    SUB_OAID_DEVICE_0011
     * @tc.name      oaidDeviceMatrix0011
     * @tc.desc      deviceInfo.bootloaderVersion 为可读的字符串字段
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidDeviceMatrix0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidDeviceMatrix0011 begin');
      const context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      const actual1: string = typeof context.applicationInfo.name;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('string');
      const actual2: string = typeof deviceInfo.bootloaderVersion;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('string');
      const actual3: boolean = deviceInfo.bootloaderVersion.length >= 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidDeviceMatrix0011 end');
    })

    /**
     * @tc.number    SUB_OAID_DEVICE_0012
     * @tc.name      oaidDeviceMatrix0012
     * @tc.desc      deviceInfo.abiList 为可读的字符串字段
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidDeviceMatrix0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidDeviceMatrix0012 begin');
      const context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      const actual1: string = typeof context.applicationInfo.name;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('string');
      const actual2: string = typeof deviceInfo.abiList;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('string');
      const actual3: boolean = deviceInfo.abiList.length >= 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidDeviceMatrix0012 end');
    })

    /**
     * @tc.number    SUB_OAID_DEVICE_0013
     * @tc.name      oaidDeviceMatrix0013
     * @tc.desc      deviceInfo.securityPatchTag 为可读的字符串字段
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidDeviceMatrix0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidDeviceMatrix0013 begin');
      const context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      const actual1: string = typeof context.applicationInfo.name;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('string');
      const actual2: string = typeof deviceInfo.securityPatchTag;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('string');
      const actual3: boolean = deviceInfo.securityPatchTag.length >= 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidDeviceMatrix0013 end');
    })

    /**
     * @tc.number    SUB_OAID_DEVICE_0014
     * @tc.name      oaidDeviceMatrix0014
     * @tc.desc      deviceInfo.displayVersion 为可读的字符串字段
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidDeviceMatrix0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidDeviceMatrix0014 begin');
      const context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      const actual1: string = typeof context.applicationInfo.name;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('string');
      const actual2: string = typeof deviceInfo.displayVersion;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('string');
      const actual3: boolean = deviceInfo.displayVersion.length >= 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidDeviceMatrix0014 end');
    })

    /**
     * @tc.number    SUB_OAID_DEVICE_0015
     * @tc.name      oaidDeviceMatrix0015
     * @tc.desc      deviceInfo.incrementalVersion 为可读的字符串字段
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidDeviceMatrix0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidDeviceMatrix0015 begin');
      const context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      const actual1: string = typeof context.applicationInfo.name;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('string');
      const actual2: string = typeof deviceInfo.incrementalVersion;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('string');
      const actual3: boolean = deviceInfo.incrementalVersion.length >= 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidDeviceMatrix0015 end');
    })

    /**
     * @tc.number    SUB_OAID_DEVICE_0016
     * @tc.name      oaidDeviceMatrix0016
     * @tc.desc      deviceInfo.osReleaseType 为可读的字符串字段
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidDeviceMatrix0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidDeviceMatrix0016 begin');
      const context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      const actual1: string = typeof context.applicationInfo.name;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('string');
      const actual2: string = typeof deviceInfo.osReleaseType;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('string');
      const actual3: boolean = deviceInfo.osReleaseType.length >= 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidDeviceMatrix0016 end');
    })

    /**
     * @tc.number    SUB_OAID_DEVICE_0017
     * @tc.name      oaidDeviceMatrix0017
     * @tc.desc      deviceInfo.osFullName 为可读的字符串字段
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidDeviceMatrix0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidDeviceMatrix0017 begin');
      const context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      const actual1: string = typeof context.applicationInfo.name;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('string');
      const actual2: string = typeof deviceInfo.osFullName;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('string');
      const actual3: boolean = deviceInfo.osFullName.length >= 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidDeviceMatrix0017 end');
    })

    /**
     * @tc.number    SUB_OAID_DEVICE_0018
     * @tc.name      oaidDeviceMatrix0018
     * @tc.desc      deviceInfo.versionId 为可读的字符串字段
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidDeviceMatrix0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidDeviceMatrix0018 begin');
      const context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      const actual1: string = typeof context.applicationInfo.name;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('string');
      const actual2: string = typeof deviceInfo.versionId;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('string');
      const actual3: boolean = deviceInfo.versionId.length >= 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidDeviceMatrix0018 end');
    })

    /**
     * @tc.number    SUB_OAID_DEVICE_0019
     * @tc.name      oaidDeviceMatrix0019
     * @tc.desc      deviceInfo.buildType 为可读的字符串字段
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidDeviceMatrix0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidDeviceMatrix0019 begin');
      const context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      const actual1: string = typeof context.applicationInfo.name;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('string');
      const actual2: string = typeof deviceInfo.buildType;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('string');
      const actual3: boolean = deviceInfo.buildType.length >= 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidDeviceMatrix0019 end');
    })

    /**
     * @tc.number    SUB_OAID_DEVICE_0020
     * @tc.name      oaidDeviceMatrix0020
     * @tc.desc      deviceInfo.buildUser 为可读的字符串字段
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidDeviceMatrix0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidDeviceMatrix0020 begin');
      const context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      const actual1: string = typeof context.applicationInfo.name;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('string');
      const actual2: string = typeof deviceInfo.buildUser;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('string');
      const actual3: boolean = deviceInfo.buildUser.length >= 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidDeviceMatrix0020 end');
    })

    /**
     * @tc.number    SUB_OAID_DEVICE_0021
     * @tc.name      oaidDeviceMatrix0021
     * @tc.desc      deviceInfo.buildHost 为可读的字符串字段
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidDeviceMatrix0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidDeviceMatrix0021 begin');
      const context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      const actual1: string = typeof context.applicationInfo.name;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('string');
      const actual2: string = typeof deviceInfo.buildHost;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('string');
      const actual3: boolean = deviceInfo.buildHost.length >= 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidDeviceMatrix0021 end');
    })

    /**
     * @tc.number    SUB_OAID_DEVICE_0022
     * @tc.name      oaidDeviceMatrix0022
     * @tc.desc      deviceInfo.buildTime 为可读的字符串字段
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidDeviceMatrix0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidDeviceMatrix0022 begin');
      const context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      const actual1: string = typeof context.applicationInfo.name;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('string');
      const actual2: string = typeof deviceInfo.buildTime;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('string');
      const actual3: boolean = deviceInfo.buildTime.length >= 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidDeviceMatrix0022 end');
    })

    /**
     * @tc.number    SUB_OAID_DEVICE_0023
     * @tc.name      oaidDeviceMatrix0023
     * @tc.desc      deviceInfo.buildRootHash 为可读的字符串字段
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidDeviceMatrix0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidDeviceMatrix0023 begin');
      const context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      const actual1: string = typeof context.applicationInfo.name;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('string');
      const actual2: string = typeof deviceInfo.buildRootHash;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('string');
      const actual3: boolean = deviceInfo.buildRootHash.length >= 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidDeviceMatrix0023 end');
    })

    /**
     * @tc.number    SUB_OAID_DEVICE_0024
     * @tc.name      oaidDeviceMatrix0024
     * @tc.desc      deviceInfo.distributionOSName 为可读的字符串字段
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidDeviceMatrix0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidDeviceMatrix0024 begin');
      const context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      const actual1: string = typeof context.applicationInfo.name;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('string');
      const actual2: string = typeof deviceInfo.distributionOSName;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('string');
      const actual3: boolean = deviceInfo.distributionOSName.length >= 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidDeviceMatrix0024 end');
    })

    /**
     * @tc.number    SUB_OAID_DEVICE_0025
     * @tc.name      oaidDeviceMatrix0025
     * @tc.desc      deviceInfo.distributionOSVersion 为可读的字符串字段
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidDeviceMatrix0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidDeviceMatrix0025 begin');
      const context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      const actual1: string = typeof context.applicationInfo.name;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('string');
      const actual2: string = typeof deviceInfo.distributionOSVersion;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('string');
      const actual3: boolean = deviceInfo.distributionOSVersion.length >= 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidDeviceMatrix0025 end');
    })

    /**
     * @tc.number    SUB_OAID_DEVICE_0026
     * @tc.name      oaidDeviceMatrix0026
     * @tc.desc      deviceInfo.distributionOSApiName 为可读的字符串字段
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidDeviceMatrix0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidDeviceMatrix0026 begin');
      const context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      const actual1: string = typeof context.applicationInfo.name;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('string');
      const actual2: string = typeof deviceInfo.distributionOSApiName;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('string');
      const actual3: boolean = deviceInfo.distributionOSApiName.length >= 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidDeviceMatrix0026 end');
    })

    /**
     * @tc.number    SUB_OAID_DEVICE_0027
     * @tc.name      oaidDeviceMatrix0027
     * @tc.desc      deviceInfo.distributionOSReleaseType 为可读的字符串字段
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidDeviceMatrix0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidDeviceMatrix0027 begin');
      const context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      const actual1: string = typeof context.applicationInfo.name;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('string');
      const actual2: string = typeof deviceInfo.distributionOSReleaseType;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('string');
      const actual3: boolean = deviceInfo.distributionOSReleaseType.length >= 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidDeviceMatrix0027 end');
    })

    /**
     * @tc.number    SUB_OAID_DEVICE_0028
     * @tc.name      oaidDeviceMatrix0028
     * @tc.desc      deviceInfo.chipType 为可读的字符串字段
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidDeviceMatrix0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidDeviceMatrix0028 begin');
      const context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      const actual1: string = typeof context.applicationInfo.name;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('string');
      const actual2: string = typeof deviceInfo.chipType;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('string');
      const actual3: boolean = deviceInfo.chipType.length >= 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidDeviceMatrix0028 end');
    })

    /**
     * @tc.number    SUB_OAID_DEVICE_0029
     * @tc.name      oaidDeviceMatrix0029
     * @tc.desc      deviceInfo.deviceColor 为可读的字符串字段
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidDeviceMatrix0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidDeviceMatrix0029 begin');
      const context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      const actual1: string = typeof context.applicationInfo.name;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('string');
      const actual2: string = typeof deviceInfo.deviceColor;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('string');
      const actual3: boolean = deviceInfo.deviceColor.length >= 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidDeviceMatrix0029 end');
    })

    /**
     * @tc.number    SUB_OAID_DEVICE_0030
     * @tc.name      oaidDeviceMatrix0030
     * @tc.desc      deviceInfo.majorVersion 为可读的数值字段
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidDeviceMatrix0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidDeviceMatrix0030 begin');
      const context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      const actual1: string = typeof context.applicationInfo.name;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('string');
      const actual2: string = typeof deviceInfo.majorVersion;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('number');
      const actual3: boolean = deviceInfo.majorVersion >= 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidDeviceMatrix0030 end');
    })

    /**
     * @tc.number    SUB_OAID_DEVICE_0031
     * @tc.name      oaidDeviceMatrix0031
     * @tc.desc      deviceInfo.seniorVersion 为可读的数值字段
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidDeviceMatrix0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidDeviceMatrix0031 begin');
      const context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      const actual1: string = typeof context.applicationInfo.name;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('string');
      const actual2: string = typeof deviceInfo.seniorVersion;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('number');
      const actual3: boolean = deviceInfo.seniorVersion >= 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidDeviceMatrix0031 end');
    })

    /**
     * @tc.number    SUB_OAID_DEVICE_0032
     * @tc.name      oaidDeviceMatrix0032
     * @tc.desc      deviceInfo.featureVersion 为可读的数值字段
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidDeviceMatrix0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidDeviceMatrix0032 begin');
      const context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      const actual1: string = typeof context.applicationInfo.name;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('string');
      const actual2: string = typeof deviceInfo.featureVersion;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('number');
      const actual3: boolean = deviceInfo.featureVersion >= 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidDeviceMatrix0032 end');
    })

    /**
     * @tc.number    SUB_OAID_DEVICE_0033
     * @tc.name      oaidDeviceMatrix0033
     * @tc.desc      deviceInfo.buildVersion 为可读的数值字段
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidDeviceMatrix0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidDeviceMatrix0033 begin');
      const context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      const actual1: string = typeof context.applicationInfo.name;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('string');
      const actual2: string = typeof deviceInfo.buildVersion;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('number');
      const actual3: boolean = deviceInfo.buildVersion >= 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidDeviceMatrix0033 end');
    })

    /**
     * @tc.number    SUB_OAID_DEVICE_0034
     * @tc.name      oaidDeviceMatrix0034
     * @tc.desc      deviceInfo.sdkApiVersion 为可读的数值字段
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidDeviceMatrix0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidDeviceMatrix0034 begin');
      const context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      const actual1: string = typeof context.applicationInfo.name;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('string');
      const actual2: string = typeof deviceInfo.sdkApiVersion;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('number');
      const actual3: boolean = deviceInfo.sdkApiVersion >= 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidDeviceMatrix0034 end');
    })

    /**
     * @tc.number    SUB_OAID_DEVICE_0035
     * @tc.name      oaidDeviceMatrix0035
     * @tc.desc      deviceInfo.sdkMinorApiVersion 为可读的数值字段
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidDeviceMatrix0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidDeviceMatrix0035 begin');
      const context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      const actual1: string = typeof context.applicationInfo.name;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('string');
      const actual2: string = typeof deviceInfo.sdkMinorApiVersion;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('number');
      const actual3: boolean = deviceInfo.sdkMinorApiVersion >= 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidDeviceMatrix0035 end');
    })

    /**
     * @tc.number    SUB_OAID_DEVICE_0036
     * @tc.name      oaidDeviceMatrix0036
     * @tc.desc      deviceInfo.sdkPatchApiVersion 为可读的数值字段
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidDeviceMatrix0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidDeviceMatrix0036 begin');
      const context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      const actual1: string = typeof context.applicationInfo.name;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('string');
      const actual2: string = typeof deviceInfo.sdkPatchApiVersion;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('number');
      const actual3: boolean = deviceInfo.sdkPatchApiVersion >= 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidDeviceMatrix0036 end');
    })

    /**
     * @tc.number    SUB_OAID_DEVICE_0037
     * @tc.name      oaidDeviceMatrix0037
     * @tc.desc      deviceInfo.firstApiVersion 为可读的数值字段
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidDeviceMatrix0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidDeviceMatrix0037 begin');
      const context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      const actual1: string = typeof context.applicationInfo.name;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('string');
      const actual2: string = typeof deviceInfo.firstApiVersion;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('number');
      const actual3: boolean = deviceInfo.firstApiVersion >= 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidDeviceMatrix0037 end');
    })

    /**
     * @tc.number    SUB_OAID_DEVICE_0038
     * @tc.name      oaidDeviceMatrix0038
     * @tc.desc      deviceInfo.distributionOSApiVersion 为可读的数值字段
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidDeviceMatrix0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidDeviceMatrix0038 begin');
      const context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      const actual1: string = typeof context.applicationInfo.name;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('string');
      const actual2: string = typeof deviceInfo.distributionOSApiVersion;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('number');
      const actual3: boolean = deviceInfo.distributionOSApiVersion >= 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidDeviceMatrix0038 end');
    })

    /**
     * @tc.number    SUB_OAID_DEVICE_0039
     * @tc.name      oaidDeviceMatrix0039
     * @tc.desc      deviceInfo.bootCount 为可读的数值字段
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('oaidDeviceMatrix0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidDeviceMatrix0039 begin');
      const context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
      const actual1: string = typeof context.applicationInfo.name;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('string');
      const actual2: string = typeof deviceInfo.bootCount;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('number');
      const actual3: boolean = deviceInfo.bootCount >= 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'oaidDeviceMatrix0039 end');
    })
  })
}
