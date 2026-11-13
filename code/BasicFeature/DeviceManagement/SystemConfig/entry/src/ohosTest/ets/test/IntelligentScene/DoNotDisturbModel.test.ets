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
import { hilog } from '@kit.PerformanceAnalysisKit';
import { DoNotDisturbModel, DoNotDisturbStatus } from 'library';
import type { DoNotDisturbModelJson } from 'library';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_SystemConfig]';

/**
 * DoNotDisturbModel data model test suite.
 * Verifies the behavior of all public methods: model construction, status marking, do-not-disturb/notify state checks,
 * serialization, and reset.
 */
export default function DoNotDisturbModelTest(): void {
  describe('DoNotDisturbModelTest', () => {

    // ========================================
    // Construction and default values
    // ========================================

    /**
     * @tc.number SUB_DO_NOT_DISTURB_MODEL_0100
     * @tc.name testDoNotDisturbModel0001
     * @tc.desc Verify each field holds its initial value after the default constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDoNotDisturbModel0001', 0, () => {
      hilog.info(DOMAIN, TAG, 'testDoNotDisturbModel0001: start test');
      const model: DoNotDisturbModel = new DoNotDisturbModel();
      expect(model.isDoNotDisturbEnabled).assertEqual(false);
      expect(model.isNotifyAllowed).assertEqual(true);
      expect(model.status).assertEqual(DoNotDisturbStatus.IDLE);
      expect(model.lastQueryTime).assertEqual(0);
      expect(model.errorMessage).assertEqual('');
      expect(model.errorCode).assertEqual(0);
      expect(model.queryCount).assertEqual(0);
    });

    // ========================================
    // Status marking methods
    // ========================================

    /**
     * @tc.number SUB_DO_NOT_DISTURB_MODEL_0200
     * @tc.name testDoNotDisturbModel0002
     * @tc.desc Verify the status becomes SUCCESS and the query count increments after markSuccess
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDoNotDisturbModel0002', 0, () => {
      hilog.info(DOMAIN, TAG, 'testDoNotDisturbModel0002: start test');
      const model: DoNotDisturbModel = new DoNotDisturbModel();
      model.markSuccess(true, false);
      expect(model.status).assertEqual(DoNotDisturbStatus.SUCCESS);
      expect(model.isDoNotDisturbEnabled).assertEqual(true);
      expect(model.isNotifyAllowed).assertEqual(false);
      expect(model.queryCount).assertEqual(1);
      expect(model.lastQueryTime).assertLarger(0);
    });

    /**
     * @tc.number SUB_DO_NOT_DISTURB_MODEL_0300
     * @tc.name testDoNotDisturbModel0003
     * @tc.desc Verify the status becomes FAILED and the error message is recorded after markFailed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDoNotDisturbModel0003', 0, () => {
      hilog.info(DOMAIN, TAG, 'testDoNotDisturbModel0003: start test');
      const model: DoNotDisturbModel = new DoNotDisturbModel();
      model.markFailed('查询免打扰状态失败', 20001);
      expect(model.status).assertEqual(DoNotDisturbStatus.FAILED);
      expect(model.errorMessage).assertEqual('查询免打扰状态失败');
      expect(model.errorCode).assertEqual(20001);
      expect(model.queryCount).assertEqual(1);
    });

    /**
     * @tc.number SUB_DO_NOT_DISTURB_MODEL_0400
     * @tc.name testDoNotDisturbModel0004
     * @tc.desc Verify the status becomes QUERYING and the error message is cleared after markQuerying
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDoNotDisturbModel0004', 0, () => {
      hilog.info(DOMAIN, TAG, 'testDoNotDisturbModel0004: start test');
      const model: DoNotDisturbModel = new DoNotDisturbModel();
      model.markFailed('prev error', 99);
      model.markQuerying();
      expect(model.status).assertEqual(DoNotDisturbStatus.QUERYING);
      expect(model.errorMessage).assertEqual('');
      expect(model.errorCode).assertEqual(0);
    });

    // ========================================
    // Status update methods
    // ========================================

    /**
     * @tc.number SUB_DO_NOT_DISTURB_MODEL_0500
     * @tc.name testDoNotDisturbModel0005
     * @tc.desc Verify updateDndState updates the do-not-disturb enabled flag and the timestamp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDoNotDisturbModel0005', 0, () => {
      hilog.info(DOMAIN, TAG, 'testDoNotDisturbModel0005: start test');
      const model: DoNotDisturbModel = new DoNotDisturbModel();
      expect(model.isDoNotDisturbEnabled).assertEqual(false);
      model.updateDndState(true);
      expect(model.isDoNotDisturbEnabled).assertEqual(true);
      expect(model.lastQueryTime).assertLarger(0);
    });

    /**
     * @tc.number SUB_DO_NOT_DISTURB_MODEL_0600
     * @tc.name testDoNotDisturbModel0006
     * @tc.desc Verify updateNotifyState updates the notify-allowed flag and the timestamp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDoNotDisturbModel0006', 0, () => {
      hilog.info(DOMAIN, TAG, 'testDoNotDisturbModel0006: start test');
      const model: DoNotDisturbModel = new DoNotDisturbModel();
      expect(model.isNotifyAllowed).assertEqual(true);
      model.updateNotifyState(false);
      expect(model.isNotifyAllowed).assertEqual(false);
      expect(model.lastQueryTime).assertLarger(0);
    });

    // ========================================
    // Query check methods
    // ========================================

    /**
     * @tc.number SUB_DO_NOT_DISTURB_MODEL_0700
     * @tc.name testDoNotDisturbModel0007
     * @tc.desc Verify isDndActive returns true only when SUCCESS and do-not-disturb is enabled
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDoNotDisturbModel0007', 0, () => {
      hilog.info(DOMAIN, TAG, 'testDoNotDisturbModel0007: start test');
      const model: DoNotDisturbModel = new DoNotDisturbModel();
      expect(model.isDndActive()).assertEqual(false);
      model.markSuccess(true, true);
      expect(model.isDndActive()).assertEqual(true);
      model.markSuccess(false, true);
      expect(model.isDndActive()).assertEqual(false);
    });

    /**
     * @tc.number SUB_DO_NOT_DISTURB_MODEL_0800
     * @tc.name testDoNotDisturbModel0008
     * @tc.desc Verify canNotify returns true only when SUCCESS and notifications are allowed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDoNotDisturbModel0008', 0, () => {
      hilog.info(DOMAIN, TAG, 'testDoNotDisturbModel0008: start test');
      const model: DoNotDisturbModel = new DoNotDisturbModel();
      expect(model.canNotify()).assertEqual(false);
      model.markSuccess(false, true);
      expect(model.canNotify()).assertEqual(true);
      model.markSuccess(false, false);
      expect(model.canNotify()).assertEqual(false);
    });

    // ========================================
    // Reset and serialization
    // ========================================

    /**
     * @tc.number SUB_DO_NOT_DISTURB_MODEL_0900
     * @tc.name testDoNotDisturbModel0009
     * @tc.desc Verify all fields return to their initial values after reset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDoNotDisturbModel0009', 0, () => {
      hilog.info(DOMAIN, TAG, 'testDoNotDisturbModel0009: start test');
      const model: DoNotDisturbModel = new DoNotDisturbModel();
      model.markSuccess(true, false);
      model.reset();
      expect(model.isDoNotDisturbEnabled).assertEqual(false);
      expect(model.isNotifyAllowed).assertEqual(true);
      expect(model.status).assertEqual(DoNotDisturbStatus.IDLE);
      expect(model.lastQueryTime).assertEqual(0);
      expect(model.errorMessage).assertEqual('');
      expect(model.errorCode).assertEqual(0);
      expect(model.queryCount).assertEqual(0);
    });

    /**
     * @tc.number SUB_DO_NOT_DISTURB_MODEL_1000
     * @tc.name testDoNotDisturbModel0010
     * @tc.desc Verify toJSON returns an object containing all fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testDoNotDisturbModel0010', 0, () => {
      hilog.info(DOMAIN, TAG, 'testDoNotDisturbModel0010: start test');
      const model: DoNotDisturbModel = new DoNotDisturbModel();
      expect(model.queryCount).assertEqual(0);
      const before: number = Date.now();
      model.markSuccess(true, false);
      const json: DoNotDisturbModelJson = model.toJSON();
      expect(json.isDoNotDisturbEnabled).assertEqual(true);
      expect(json.isNotifyAllowed).assertEqual(false);
      expect(json.status).assertEqual(DoNotDisturbStatus.SUCCESS);
      expect(json.queryCount).assertEqual(1);
      expect(json.lastQueryTime).assertLargerOrEqual(before);
      expect(json.errorMessage).assertEqual('');
      expect(json.errorCode).assertEqual(0);
    });
  });
}
