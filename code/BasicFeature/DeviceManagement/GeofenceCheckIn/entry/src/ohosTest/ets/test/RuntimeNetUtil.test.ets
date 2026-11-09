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

import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { RuntimeNetUtil } from 'library';

const DOMAIN: number = 0xF811;
const SUITE_TAG: string = '[Sample_GeofenceCheckIn_Runtime]';
// Bundle identity and version configured in AppScope/app.json5.
const APP_BUNDLE: string = 'com.samples.geofencecheckin';
const APP_VERSION: string = '1.0.0';
// Display names the network type helper may return.
const KNOWN_NET_NAMES: string[] = ['None', 'Unknown', 'Wi-Fi', 'Cellular', 'Ethernet', 'Bluetooth', 'VPN'];
// Port 1 on the local loopback is closed, so requests always hit the failure branch.
const UNREACHABLE_URL: string = 'http://127.0.0.1:1/gc_no_such';
const HTTP_TIMEOUT_MS: number = 3000;
const REQUEST_FAILED_CODE: number = -1;
// Lowest SDK API version the sample supports.
const MIN_SDK_API_VERSION: number = 9;

export default function runtimeNetLogicTest() {
  describe('RuntimeNetUtilLogicTest', () => {
    /**
     * @tc.number    SUB_GEOFENCECHECKIN_RUNTIME_0100
     * @tc.name      testRuntimeDeviceInfo0001
     * @tc.desc      Verify device info helpers return the real device model, OS name
     *               and a modern SDK API version.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testRuntimeDeviceInfo0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testRuntimeDeviceInfo0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const deviceModel: string = RuntimeNetUtil.getDeviceModel();
      hilog.info(DOMAIN, TAG, '%{public}s', 'device model: ' + deviceModel);
      expect(deviceModel.length > 0).assertTrue();

      const osFullName: string = RuntimeNetUtil.getOsFullName();
      hilog.info(DOMAIN, TAG, '%{public}s', 'os full name: ' + osFullName);
      expect(osFullName.length > 0).assertTrue();

      const sdkApiVersion: number = RuntimeNetUtil.getSdkApiVersion();
      hilog.info(DOMAIN, TAG, '%{public}s', 'sdk api version: ' + sdkApiVersion);
      expect(sdkApiVersion >= MIN_SDK_API_VERSION).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_RUNTIME_0200
     * @tc.name      testRuntimeBundleInfo0001
     * @tc.desc      Verify bundle helpers return the bundle name and application
     *               version name configured in app.json5.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testRuntimeBundleInfo0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testRuntimeBundleInfo0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const bundleName: string = RuntimeNetUtil.getBundleName();
      hilog.info(DOMAIN, TAG, '%{public}s', 'bundle name: ' + bundleName);
      expect(bundleName).assertEqual(APP_BUNDLE);
      expect(bundleName.length > 0).assertTrue();

      const versionName: string = RuntimeNetUtil.getAppVersionName();
      hilog.info(DOMAIN, TAG, '%{public}s', 'version name: ' + versionName);
      expect(versionName).assertEqual(APP_VERSION);
      expect(versionName.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_RUNTIME_0300
     * @tc.name      testRuntimeNetTypeName0001
     * @tc.desc      Verify the network type name resolves to one of the supported
     *               display names and stays stable across calls.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testRuntimeNetTypeName0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testRuntimeNetTypeName0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const netTypeName: string = RuntimeNetUtil.getNetTypeName();
      hilog.info(DOMAIN, TAG, '%{public}s', 'net type name: ' + netTypeName);
      expect(KNOWN_NET_NAMES.indexOf(netTypeName) >= 0).assertTrue();
      expect(netTypeName.length > 0).assertTrue();

      const netTypeNameAgain: string = RuntimeNetUtil.getNetTypeName();
      expect(netTypeNameAgain === netTypeName).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_RUNTIME_0400
     * @tc.name      testRuntimeHttpFailure0001
     * @tc.desc      Verify HTTP GET and POST against a closed local port report a
     *               transport failure result instead of throwing.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testRuntimeHttpFailure0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testRuntimeHttpFailure0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const getResult = await RuntimeNetUtil.httpGet(UNREACHABLE_URL, HTTP_TIMEOUT_MS);
      hilog.info(DOMAIN, TAG, '%{public}s', 'get responseCode: ' + getResult.responseCode);
      expect(getResult.success).assertFalse();
      expect(getResult.responseCode).assertEqual(REQUEST_FAILED_CODE);
      expect(getResult.body).assertEqual('');
      expect(getResult.errorMessage.length > 0).assertTrue();

      const postResult = await RuntimeNetUtil.httpPost(UNREACHABLE_URL, 'payload', HTTP_TIMEOUT_MS);
      hilog.info(DOMAIN, TAG, '%{public}s', 'post responseCode: ' + postResult.responseCode);
      expect(postResult.success).assertFalse();
      expect(postResult.responseCode).assertEqual(REQUEST_FAILED_CODE);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
  });
}
