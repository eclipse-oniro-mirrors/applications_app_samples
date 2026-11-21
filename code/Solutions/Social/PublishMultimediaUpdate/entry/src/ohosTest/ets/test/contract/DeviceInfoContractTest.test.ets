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

import { describe, it, expect, beforeAll } from '@ohos/hypium';
import deviceInfo from '@ohos.deviceInfo';
import Logger from '../Logger';
import { BUNDLE, TAG } from '../common/TestConstant';
import { yieldToEventLoop } from '../common/TestYield';
/**
 * Identity of the device the sample runs on.
 * A published row may carry the model in a diagnostics line, so the identity
 * fields must be readable without any permission. The cases pin the fields the
 * page can display and the api level used for feature decisions.
 */
export default function deviceInfoContractTest() {
  describe('DeviceInfoContractTest', () => {
    beforeAll(async (): Promise<void> => {
      await yieldToEventLoop();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_DEVICEINFO_0100
     * @tc.name DeviceTypeNonEmpty001
     * @tc.desc Verify the reported device type is a non empty name
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'DeviceTypeNonEmpty_001', 0, (): void => {
      Logger.info(TAG, 'DeviceTypeNonEmpty_001 begin');
      expect(deviceInfo.deviceType.length > 0).assertTrue();
      Logger.info(TAG, 'DeviceTypeNonEmpty_001 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_DEVICEINFO_0200
     * @tc.name ManufactureNonEmpty002
     * @tc.desc Verify the reported manufacturer is a non empty name
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ManufactureNonEmpty_002', 0, (): void => {
      Logger.info(TAG, 'ManufactureNonEmpty_002 begin');
      expect(deviceInfo.manufacture.length > 0).assertTrue();
      Logger.info(TAG, 'ManufactureNonEmpty_002 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_DEVICEINFO_0300
     * @tc.name BrandNonEmpty003
     * @tc.desc Verify the reported brand is a non empty name
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'BrandNonEmpty_003', 0, (): void => {
      Logger.info(TAG, 'BrandNonEmpty_003 begin');
      expect(deviceInfo.brand.length > 0).assertTrue();
      Logger.info(TAG, 'BrandNonEmpty_003 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_DEVICEINFO_0400
     * @tc.name ProductModelNonEmpty004
     * @tc.desc Verify the reported product model is a non empty name
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ProductModelNonEmpty_004', 0, (): void => {
      Logger.info(TAG, 'ProductModelNonEmpty_004 begin');
      expect(deviceInfo.productModel.length > 0).assertTrue();
      Logger.info(TAG, 'ProductModelNonEmpty_004 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_DEVICEINFO_0500
     * @tc.name SdkApiVersionPositive005
     * @tc.desc Verify the reported api level is a positive number
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'SdkApiVersionPositive_005', 0, (): void => {
      Logger.info(TAG, 'SdkApiVersionPositive_005 begin');
      expect(deviceInfo.sdkApiVersion > 0).assertTrue();
      Logger.info(TAG, 'SdkApiVersionPositive_005 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_DEVICEINFO_0600
     * @tc.name SdkApiVersionIsInteger006
     * @tc.desc Verify the reported api level has no fractional part
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'SdkApiVersionIsInteger_006', 0, (): void => {
      Logger.info(TAG, 'SdkApiVersionIsInteger_006 begin');
      expect(Number.isInteger(deviceInfo.sdkApiVersion)).assertTrue();
      Logger.info(TAG, 'SdkApiVersionIsInteger_006 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_DEVICEINFO_0700
     * @tc.name SdkApiVersionStable007
     * @tc.desc Verify two reads of the api level agree
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'SdkApiVersionStable_007', 0, (): void => {
      Logger.info(TAG, 'SdkApiVersionStable_007 begin');
      const first: number = deviceInfo.sdkApiVersion;
      const second: number = deviceInfo.sdkApiVersion;
      expect(second).assertEqual(first);
      Logger.info(TAG, 'SdkApiVersionStable_007 end');
    });
  });
}
