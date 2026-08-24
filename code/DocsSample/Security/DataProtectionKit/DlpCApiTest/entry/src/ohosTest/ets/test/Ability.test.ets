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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import testNapi from 'libentry.so';

const TAG = '[Sample_MyApp]'
const DOMAIN = 0xF888
const BUNDLE = 'dlp_'

export default function localUnitTest() {
  describe('localUnitTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    });
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    });
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    });
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    });
    /**
     * 查询当前DLP沙箱的权限信息
     */
    it('GetDlpPermissionInfo_001', 0, () => {
      hilog.info(DOMAIN, TAG, BUNDLE + "GetDlpPermissionInfo_001, begin");


      const result = testNapi.GetDlpPermissionInfo();
      let message: string = result.toString();

      hilog.info(DOMAIN, TAG, BUNDLE + "GetDlpPermissionInfo_001, message" + message);
      expect(message).assertContain("19100006");
      hilog.info(DOMAIN, TAG, BUNDLE + "GetDlpPermissionInfo_001, begin");
    });

    /**
     * 获取指定DLP文件名的原始文件名
     */
    it('GetOriginalFileName_001', 0, () => {
      hilog.info(DOMAIN, TAG, BUNDLE + "GetOriginalFileName_001, begin");


      const result = testNapi.GetOriginalFileName();
      let message: string = result.toString();

      hilog.info(DOMAIN, TAG, BUNDLE + "GetOriginalFileName_001, message" + message);
      expect(message).assertContain("test.txt");
      hilog.info(DOMAIN, TAG, BUNDLE + "GetOriginalFileName_001, begin");
    });

    /**
     * 查询当前运行DLP沙箱环境
     */
    it('IsInSandbox_001', 0, () => {
      hilog.info(DOMAIN, TAG, BUNDLE + "IsInSandbox_001, begin");


      const result = testNapi.IsInSandbox();
      let message: string = result.toString();

      hilog.info(DOMAIN, TAG, BUNDLE + "IsInSandbox_001, message" + message);
      expect(message).assertContain("false");
      hilog.info(DOMAIN, TAG, BUNDLE + "IsInSandbox_001, begin");
    });

    /**
     * 设置沙箱应用配置信息
     */
    it('SetSandboxAppConfig_001', 0, () => {
      hilog.info(DOMAIN, TAG, BUNDLE + "SetSandboxAppConfig_001, begin");


      const result = testNapi.SetSandboxAppConfig();
      let message: string = result.toString();

      hilog.info(DOMAIN, TAG, BUNDLE + "SetSandboxAppConfig_001, message" + message);
      expect(message).assertContain("0");
      hilog.info(DOMAIN, TAG, BUNDLE + "SetSandboxAppConfig_001, begin");
    });

    /**
     * 获取沙箱应用配置信息
     */
    it('GetSandboxAppConfig_001', 0, () => {
      hilog.info(DOMAIN, TAG, BUNDLE + "GetSandboxAppConfig_001, begin");


      const result = testNapi.GetSandboxAppConfig();
      let message: string = result.toString();

      hilog.info(DOMAIN, TAG, BUNDLE + "GetSandboxAppConfig_001, message" + message);
      expect(message).assertContain("configInfo");
      hilog.info(DOMAIN, TAG, BUNDLE + "GetSandboxAppConfig_001, begin");
    });

    /**
     * 清理沙箱应用配置信息
     */
    it('CleanSandboxAppConfig_001', 0, () => {
      hilog.info(DOMAIN, TAG, BUNDLE + "CleanSandboxAppConfig_001, begin");


      const result = testNapi.CleanSandboxAppConfig();
      let message: string = result.toString();

      hilog.info(DOMAIN, TAG, BUNDLE + "CleanSandboxAppConfig_001, message" + message);
      expect(message).assertContain("0");
      hilog.info(DOMAIN, TAG, BUNDLE + "CleanSandboxAppConfig_001, begin");
    });
  });
}