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
 * DoNotDisturbModel extended test suite.
 * Adds coverage for isReady / getTimeSinceLastQuery / toString /
 * full state-machine transitions / toJSON round-trip serialization / repeated markFailed scenarios.
 */
export default function DoNotDisturbModelExtendedTest(): void {
  describe('DoNotDisturbModelExtendedTest', () => {

    // ========================================
    // isReady tests
    // ========================================

    /**
     * @tc.number SUB_DO_NOT_DISTURB_MODEL_EXTENDED_0100
     * @tc.name testDoNotDisturbModelExtended0001
     * @tc.desc Verify isReady returns true only in the SUCCESS status
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDoNotDisturbModelExtended0001', 0, () => {
      hilog.info(DOMAIN, TAG, 'testDoNotDisturbModelExtended0001: begin');
      const model: DoNotDisturbModel = new DoNotDisturbModel();
      expect(model.isReady()).assertFalse();
      model.markQuerying();
      expect(model.isReady()).assertFalse();
      model.markSuccess(true, false);
      expect(model.isReady()).assertTrue();
      model.markFailed('err', 1);
      expect(model.isReady()).assertFalse();
    });

    // ========================================
    // getTimeSinceLastQuery tests
    // ========================================

    /**
     * @tc.number SUB_DO_NOT_DISTURB_MODEL_EXTENDED_0200
     * @tc.name testDoNotDisturbModelExtended0002
     * @tc.desc Verify the time diff is -1 before any query and non-negative after a query
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDoNotDisturbModelExtended0002', 0, () => {
      hilog.info(DOMAIN, TAG, 'testDoNotDisturbModelExtended0002: begin');
      const model: DoNotDisturbModel = new DoNotDisturbModel();
      expect(model.getTimeSinceLastQuery()).assertEqual(-1);
      const before: number = Date.now();
      model.markSuccess(true, false);
      const elapsed: number = model.getTimeSinceLastQuery();
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed).assertLess(5000);
      expect(model.lastQueryTime).assertLargerOrEqual(before);
      expect(model.isReady()).assertTrue();
    });

    /**
     * @tc.number SUB_DO_NOT_DISTURB_MODEL_EXTENDED_0300
     * @tc.name testDoNotDisturbModelExtended0003
     * @tc.desc Verify getTimeSinceLastQuery resets to -1 after reset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testDoNotDisturbModelExtended0003', 0, () => {
      hilog.info(DOMAIN, TAG, 'testDoNotDisturbModelExtended0003: begin');
      const model: DoNotDisturbModel = new DoNotDisturbModel();
      model.markSuccess(true, false);
      expect(model.getTimeSinceLastQuery()).assertLargerOrEqual(0);
      model.reset();
      expect(model.getTimeSinceLastQuery()).assertEqual(-1);
      expect(model.lastQueryTime).assertEqual(0);
    });

    // ========================================
    // toString tests
    // ========================================

    /**
     * @tc.number SUB_DO_NOT_DISTURB_MODEL_EXTENDED_0400
     * @tc.name testDoNotDisturbModelExtended0004
     * @tc.desc Verify the toString output contains the key fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testDoNotDisturbModelExtended0004', 0, () => {
      hilog.info(DOMAIN, TAG, 'testDoNotDisturbModelExtended0004: begin');
      const model: DoNotDisturbModel = new DoNotDisturbModel();
      model.markSuccess(true, false);
      const str: string = model.toString();
      expect(str.indexOf('DoNotDisturbModel')).assertLarger(-1);
      expect(str.indexOf('dnd=true')).assertLarger(-1);
      expect(str.indexOf('notify=false')).assertLarger(-1);
      expect(str.indexOf('status=success')).assertLarger(-1);
    });

    // ========================================
    // Full state-machine transition tests
    // ========================================

    /**
     * @tc.number SUB_DO_NOT_DISTURB_MODEL_EXTENDED_0500
     * @tc.name testDoNotDisturbModelExtended0005
     * @tc.desc Verify the full IDLE → QUERYING → SUCCESS → reset → IDLE transition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDoNotDisturbModelExtended0005', 0, () => {
      hilog.info(DOMAIN, TAG, 'testDoNotDisturbModelExtended0005: begin');
      const model: DoNotDisturbModel = new DoNotDisturbModel();
      expect(model.status).assertEqual(DoNotDisturbStatus.IDLE);
      expect(model.isReady()).assertFalse();
      model.markQuerying();
      expect(model.status).assertEqual(DoNotDisturbStatus.QUERYING);
      expect(model.errorMessage).assertEqual('');
      expect(model.errorCode).assertEqual(0);
      model.markSuccess(true, true);
      expect(model.status).assertEqual(DoNotDisturbStatus.SUCCESS);
      expect(model.isReady()).assertTrue();
      expect(model.isDndActive()).assertTrue();
      expect(model.canNotify()).assertTrue();
      model.reset();
      expect(model.status).assertEqual(DoNotDisturbStatus.IDLE);
      expect(model.isReady()).assertFalse();
      expect(model.isDndActive()).assertFalse();
      expect(model.canNotify()).assertFalse();
      expect(model.queryCount).assertEqual(0);
    });

    /**
     * @tc.number SUB_DO_NOT_DISTURB_MODEL_EXTENDED_0600
     * @tc.name testDoNotDisturbModelExtended0006
     * @tc.desc Verify the IDLE → QUERYING → FAILED → reset → IDLE error transition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testDoNotDisturbModelExtended0006', 0, () => {
      hilog.info(DOMAIN, TAG, 'testDoNotDisturbModelExtended0006: begin');
      const model: DoNotDisturbModel = new DoNotDisturbModel();
      model.markQuerying();
      expect(model.status).assertEqual(DoNotDisturbStatus.QUERYING);
      model.markFailed('network error', 5001);
      expect(model.status).assertEqual(DoNotDisturbStatus.FAILED);
      expect(model.errorMessage).assertEqual('network error');
      expect(model.errorCode).assertEqual(5001);
      expect(model.isReady()).assertFalse();
      model.reset();
      expect(model.status).assertEqual(DoNotDisturbStatus.IDLE);
      expect(model.errorMessage).assertEqual('');
      expect(model.errorCode).assertEqual(0);
    });

    // ========================================
    // toJSON round-trip serialization tests
    // ========================================

    /**
     * @tc.number SUB_DO_NOT_DISTURB_MODEL_EXTENDED_0700
     * @tc.name testDoNotDisturbModelExtended0007
     * @tc.desc Verify toJSON keeps all fields complete and consistent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testDoNotDisturbModelExtended0007', 0, () => {
      hilog.info(DOMAIN, TAG, 'testDoNotDisturbModelExtended0007: begin');
      const model: DoNotDisturbModel = new DoNotDisturbModel();
      model.markSuccess(true, false);
      const json: DoNotDisturbModelJson = model.toJSON();
      expect(json.isDoNotDisturbEnabled).assertEqual(true);
      expect(json.isNotifyAllowed).assertEqual(false);
      expect(json.status).assertEqual(DoNotDisturbStatus.SUCCESS);
      expect(json.lastQueryTime).assertLarger(0);
      expect(json.queryCount).assertEqual(1);
      expect(json.errorMessage).assertEqual('');
      expect(json.errorCode).assertEqual(0);
    });

    // ========================================
    // Repeated markFailed tests
    // ========================================

    /**
     * @tc.number SUB_DO_NOT_DISTURB_MODEL_EXTENDED_0800
     * @tc.name testDoNotDisturbModelExtended0008
     * @tc.desc Verify queryCount accumulates after repeated markFailed calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testDoNotDisturbModelExtended0008', 0, () => {
      hilog.info(DOMAIN, TAG, 'testDoNotDisturbModelExtended0008: begin');
      const model: DoNotDisturbModel = new DoNotDisturbModel();
      model.markFailed('error 1', 1001);
      expect(model.queryCount).assertEqual(1);
      expect(model.status).assertEqual(DoNotDisturbStatus.FAILED);
      model.markFailed('error 2', 1002);
      expect(model.queryCount).assertEqual(2);
      expect(model.errorMessage).assertEqual('error 2');
      expect(model.errorCode).assertEqual(1002);
      model.markSuccess(false, true);
      expect(model.queryCount).assertEqual(3);
      expect(model.status).assertEqual(DoNotDisturbStatus.SUCCESS);
    });

    // ========================================
    // markSuccess + updateDndState + updateNotifyState combination tests
    // ========================================

    /**
     * @tc.number SUB_DO_NOT_DISTURB_MODEL_EXTENDED_0900
     * @tc.name testDoNotDisturbModelExtended0009
     * @tc.desc Verify updateDndState/updateNotifyState can update a field in isolation after markSuccess
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testDoNotDisturbModelExtended0009', 0, () => {
      hilog.info(DOMAIN, TAG, 'testDoNotDisturbModelExtended0009: begin');
      const model: DoNotDisturbModel = new DoNotDisturbModel();
      model.markSuccess(true, true);
      expect(model.isDndActive()).assertTrue();
      expect(model.canNotify()).assertTrue();
      model.updateDndState(false);
      expect(model.isDndActive()).assertFalse();
      expect(model.canNotify()).assertTrue();
      model.updateNotifyState(false);
      expect(model.isDndActive()).assertFalse();
      expect(model.canNotify()).assertFalse();
      expect(model.status).assertEqual(DoNotDisturbStatus.SUCCESS);
      expect(model.queryCount).assertEqual(1);
    });

    // ========================================
    // Constructor parameter tests
    // ========================================

    /**
     * @tc.number SUB_DO_NOT_DISTURB_MODEL_EXTENDED_1000
     * @tc.name testDoNotDisturbModelExtended0010
     * @tc.desc Verify the status and query methods are correct after a parameterized construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDoNotDisturbModelExtended0010', 0, () => {
      hilog.info(DOMAIN, TAG, 'testDoNotDisturbModelExtended0010: begin');
      const model: DoNotDisturbModel = new DoNotDisturbModel(true, false, DoNotDisturbStatus.SUCCESS);
      expect(model.isDoNotDisturbEnabled).assertTrue();
      expect(model.isNotifyAllowed).assertFalse();
      expect(model.status).assertEqual(DoNotDisturbStatus.SUCCESS);
      expect(model.isDndActive()).assertTrue();
      expect(model.canNotify()).assertFalse();
      expect(model.isReady()).assertTrue();
    });
  });
}
