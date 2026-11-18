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

const DOMAIN = 0xF811;
const TAG = '[Sample_Hicollie]';
const BUNDLE = 'Hicollie_';

export default function abilityTest() {
  describe('ActsAbilityTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
    });
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
    });
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
    });
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
    });

    /**
     * 校验线程卡顿检测接口OH_HiCollie_Init_JankDetection，调用后应用正常完成卡顿检测任务。
     */
    it(BUNDLE + 'JankDetection_001', 0, () => {
      hilog.info(DOMAIN, TAG, `${BUNDLE}JankDetection_001 begin`);
      hilog.info(DOMAIN, TAG, 'check testHiCollieJankNdk: type is function');
      expect(typeof testNapi.testHiCollieJankNdk).assertEqual('function');
      hilog.info(DOMAIN, TAG, 'call testHiCollieJankNdk');
      testNapi.testHiCollieJankNdk();
      hilog.info(DOMAIN, TAG, `${BUNDLE}JankDetection_001 end`);
    });

    /**
     * 校验线程卡死检测接口OH_HiCollie_Init_StuckDetection，调用后卡死检测任务注册成功。
     */
    it(BUNDLE + 'StuckDetection_001', 0, () => {
      hilog.info(DOMAIN, TAG, `${BUNDLE}StuckDetection_001 begin`);
      hilog.info(DOMAIN, TAG, 'check testHiCollieStuckNdk: type is function');
      expect(typeof testNapi.testHiCollieStuckNdk).assertEqual('function');
      hilog.info(DOMAIN, TAG, 'call testHiCollieStuckNdk');
      testNapi.testHiCollieStuckNdk();
      hilog.info(DOMAIN, TAG, `${BUNDLE}StuckDetection_001 end`);
    });

    /**
     * 校验自定义检测时间的卡死检测接口OH_HiCollie_Init_StuckDetectionWithTimeout，调用后检测任务注册成功。
     */
    it(BUNDLE + 'StuckDetectionWithTimeout_001', 0, () => {
      hilog.info(DOMAIN, TAG, `${BUNDLE}StuckDetectionWithTimeout_001 begin`);
      hilog.info(DOMAIN, TAG, 'check testHiCollieStuckWithTimeoutNdk: type is function');
      expect(typeof testNapi.testHiCollieStuckWithTimeoutNdk).assertEqual('function');
      hilog.info(DOMAIN, TAG, 'call testHiCollieStuckWithTimeoutNdk');
      testNapi.testHiCollieStuckWithTimeoutNdk();
      hilog.info(DOMAIN, TAG, `${BUNDLE}StuckDetectionWithTimeout_001 end`);
    });

    /**
     * 校验输入无响应事件上报接口OH_HiCollie_ReportInputBlock，业务线程未卡死时不触发上报。
     */
    it(BUNDLE + 'InputBlock_001', 0, () => {
      hilog.info(DOMAIN, TAG, `${BUNDLE}InputBlock_001 begin`);
      hilog.info(DOMAIN, TAG, 'check testHiCollieInputBlock: type is function');
      expect(typeof testNapi.testHiCollieInputBlock).assertEqual('function');
      hilog.info(DOMAIN, TAG, 'call testHiCollieInputBlock');
      testNapi.testHiCollieInputBlock();
      hilog.info(DOMAIN, TAG, `${BUNDLE}InputBlock_001 end`);
    });

    /**
     * 校验冻屏回调设置接口OH_HiCollie_SetFreezeCallback，自定义冻屏日志回调设置成功。
     */
    it(BUNDLE + 'SetFreezeCallback_001', 0, () => {
      hilog.info(DOMAIN, TAG, `${BUNDLE}SetFreezeCallback_001 begin`);
      hilog.info(DOMAIN, TAG, 'check testHiCollieSetFreezeCallback: type is function');
      expect(typeof testNapi.testHiCollieSetFreezeCallback).assertEqual('function');
      hilog.info(DOMAIN, TAG, 'call testHiCollieSetFreezeCallback');
      testNapi.testHiCollieSetFreezeCallback();
      hilog.info(DOMAIN, TAG, `${BUNDLE}SetFreezeCallback_001 end`);
    });

    /**
     * 校验进程冻屏事件上报接口OH_HiCollie_AssociateProcessReport，可主动上报应用执行超时事件。
     */
    it(BUNDLE + 'AssociateProcessReport_001', 0, () => {
      hilog.info(DOMAIN, TAG, `${BUNDLE}AssociateProcessReport_001 begin`);
      hilog.info(DOMAIN, TAG, 'check testHiCollieAssociateProcessReport: type is function');
      expect(typeof testNapi.testHiCollieAssociateProcessReport).assertEqual('function');
      hilog.info(DOMAIN, TAG, 'call testHiCollieAssociateProcessReport');
      testNapi.testHiCollieAssociateProcessReport();
      hilog.info(DOMAIN, TAG, `${BUNDLE}AssociateProcessReport_001 end`);
    });
  });
}
