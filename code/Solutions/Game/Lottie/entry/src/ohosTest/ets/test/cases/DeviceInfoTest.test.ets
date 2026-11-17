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

import { describe, it, expect } from '@ohos/hypium';
import deviceInfo from '@ohos.deviceInfo';
import Logger from '../../utils/Logger';
import { BUNDLE, SuiteTag } from '../common/TestConstant';

const TAG: string = SuiteTag.DEVICE;

/**
 * Static device metadata used by the sample at runtime. Every value is read
 * from the deviceInfo module, so the suite documents the device contract the
 * application can rely on without starting any UI. Optional product fields
 * that may be empty on a development board are not asserted.
 */
export default function deviceInfoTest(): void {
  describe('LottieDeviceInfoTest', (): void => {
    /**
     * @tc.number SUB_SAMPLE_LOTTIE_DEVICE_0100
     * @tc.name deviceTypeDeclared001
     * @tc.desc Verify the device reports a non empty type string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it(BUNDLE + 'deviceTypeDeclared_001', 0, async (): Promise<void> => {
      Logger.info(TAG, 'deviceTypeDeclared_001 begin');
      const check01: string = deviceInfo.deviceType;
      Logger.info(TAG, 'deviceTypeDeclared_001, check01=' + JSON.stringify(check01));
      expect(check01.length > 0).assertTrue();
      Logger.info(TAG, 'deviceTypeDeclared_001 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_DEVICE_0200
     * @tc.name brandDeclared002
     * @tc.desc Verify the device reports a non empty brand string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'brandDeclared_002', 0, async (): Promise<void> => {
      Logger.info(TAG, 'brandDeclared_002 begin');
      const check01: string = deviceInfo.brand;
      Logger.info(TAG, 'brandDeclared_002, check01=' + JSON.stringify(check01));
      expect(check01.length > 0).assertTrue();
      Logger.info(TAG, 'brandDeclared_002 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_DEVICE_0300
     * @tc.name manufactureDeclared003
     * @tc.desc Verify the device reports a non empty manufacturer string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'manufactureDeclared_003', 0, async (): Promise<void> => {
      Logger.info(TAG, 'manufactureDeclared_003 begin');
      const check01: string = deviceInfo.manufacture;
      Logger.info(TAG, 'manufactureDeclared_003, check01=' + JSON.stringify(check01));
      expect(check01.length > 0).assertTrue();
      Logger.info(TAG, 'manufactureDeclared_003 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_DEVICE_0400
     * @tc.name productModelDeclared004
     * @tc.desc Verify the device reports a non empty product model
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'productModelDeclared_004', 0, async (): Promise<void> => {
      Logger.info(TAG, 'productModelDeclared_004 begin');
      const check01: string = deviceInfo.productModel;
      Logger.info(TAG, 'productModelDeclared_004, check01=' + JSON.stringify(check01));
      expect(check01.length > 0).assertTrue();
      Logger.info(TAG, 'productModelDeclared_004 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_DEVICE_0500
     * @tc.name softwareModelDeclared005
     * @tc.desc Verify the device reports a non empty software model
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'softwareModelDeclared_005', 0, async (): Promise<void> => {
      Logger.info(TAG, 'softwareModelDeclared_005 begin');
      const check01: string = deviceInfo.softwareModel;
      Logger.info(TAG, 'softwareModelDeclared_005, check01=' + JSON.stringify(check01));
      expect(check01.length > 0).assertTrue();
      Logger.info(TAG, 'softwareModelDeclared_005 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_DEVICE_0600
     * @tc.name osFullNameDeclared006
     * @tc.desc Verify the system full name is reported and carries the major version
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'osFullNameDeclared_006', 0, async (): Promise<void> => {
      Logger.info(TAG, 'osFullNameDeclared_006 begin');
      const check01: string = deviceInfo.osFullName;
      Logger.info(TAG, 'osFullNameDeclared_006, check01=' + JSON.stringify(check01));
      expect(check01.length > 0).assertTrue();
      const major: string = deviceInfo.majorVersion.toString();
      const check02: boolean = check01.indexOf(major) >= 0;
      Logger.info(TAG, 'osFullNameDeclared_006, check02=' + JSON.stringify(check02));
      expect(check02).assertTrue();
      Logger.info(TAG, 'osFullNameDeclared_006 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_DEVICE_0700
     * @tc.name osReleaseTypeDeclared007
     * @tc.desc Verify the device reports a non empty release type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'osReleaseTypeDeclared_007', 0, async (): Promise<void> => {
      Logger.info(TAG, 'osReleaseTypeDeclared_007 begin');
      const check01: string = deviceInfo.osReleaseType;
      Logger.info(TAG, 'osReleaseTypeDeclared_007, check01=' + JSON.stringify(check01));
      expect(check01.length > 0).assertTrue();
      Logger.info(TAG, 'osReleaseTypeDeclared_007 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_DEVICE_0800
     * @tc.name majorVersionPositive008
     * @tc.desc Verify the major version is at least one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'majorVersionPositive_008', 0, async (): Promise<void> => {
      Logger.info(TAG, 'majorVersionPositive_008 begin');
      const check01: number = deviceInfo.majorVersion;
      Logger.info(TAG, 'majorVersionPositive_008, check01=' + JSON.stringify(check01));
      expect(check01 >= 1).assertTrue();
      Logger.info(TAG, 'majorVersionPositive_008 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_DEVICE_0900
     * @tc.name seniorVersionNonNegative009
     * @tc.desc Verify the senior version is not negative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'seniorVersionNonNegative_009', 0, async (): Promise<void> => {
      Logger.info(TAG, 'seniorVersionNonNegative_009 begin');
      const check01: number = deviceInfo.seniorVersion;
      Logger.info(TAG, 'seniorVersionNonNegative_009, check01=' + JSON.stringify(check01));
      expect(check01 >= 0).assertTrue();
      Logger.info(TAG, 'seniorVersionNonNegative_009 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_DEVICE_1000
     * @tc.name featureVersionNonNegative010
     * @tc.desc Verify the feature version is not negative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'featureVersionNonNegative_010', 0, async (): Promise<void> => {
      Logger.info(TAG, 'featureVersionNonNegative_010 begin');
      const check01: number = deviceInfo.featureVersion;
      Logger.info(TAG, 'featureVersionNonNegative_010, check01=' + JSON.stringify(check01));
      expect(check01 >= 0).assertTrue();
      Logger.info(TAG, 'featureVersionNonNegative_010 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_DEVICE_1100
     * @tc.name buildVersionNonNegative011
     * @tc.desc Verify the build version is not negative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'buildVersionNonNegative_011', 0, async (): Promise<void> => {
      Logger.info(TAG, 'buildVersionNonNegative_011 begin');
      const check01: number = deviceInfo.buildVersion;
      Logger.info(TAG, 'buildVersionNonNegative_011, check01=' + JSON.stringify(check01));
      expect(check01 >= 0).assertTrue();
      Logger.info(TAG, 'buildVersionNonNegative_011 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_DEVICE_1200
     * @tc.name sdkApiVersionAtLeastBaseline012
     * @tc.desc Verify the device API level is at least the SDK 9 baseline
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'sdkApiVersionAtLeastBaseline_012', 0, async (): Promise<void> => {
      Logger.info(TAG, 'sdkApiVersionAtLeastBaseline_012 begin');
      const check01: number = deviceInfo.sdkApiVersion;
      Logger.info(TAG, 'sdkApiVersionAtLeastBaseline_012, check01=' + JSON.stringify(check01));
      expect(check01 >= 9).assertTrue();
      Logger.info(TAG, 'sdkApiVersionAtLeastBaseline_012 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_DEVICE_1300
     * @tc.name sdkNotOlderThanFirst013
     * @tc.desc Verify the current API level is not older than the first API level
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'sdkNotOlderThanFirst_013', 0, async (): Promise<void> => {
      Logger.info(TAG, 'sdkNotOlderThanFirst_013 begin');
      const current: number = deviceInfo.sdkApiVersion;
      const first: number = deviceInfo.firstApiVersion;
      const check01: boolean = current >= first;
      Logger.info(TAG, 'sdkNotOlderThanFirst_013, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'sdkNotOlderThanFirst_013 end');
    });
  });
}
