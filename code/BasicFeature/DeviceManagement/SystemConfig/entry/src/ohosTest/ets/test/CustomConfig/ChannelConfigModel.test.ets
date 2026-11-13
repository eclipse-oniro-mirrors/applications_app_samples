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
import { ChannelConfigModel, ChannelConfigStatus, ChannelConfigJson } from 'library';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_SystemConfig]';

/**
 * ChannelConfigModel data model test suite.
 * Verifies the behavior of all public methods of the channel config model,
 * including construction, status marking, query checks, serialization and reset.
 */
export default function ChannelConfigModelTest(): void {
  describe('ChannelConfigModelTest', () => {

    // ========================================
    // Construction and default values
    // ========================================

    /**
     * @tc.number SUB_CHANNEL_CONFIG_MODEL_0100
     * @tc.name testChannelConfigModel0001
     * @tc.desc Verify all fields hold initial values after default construction.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testChannelConfigModel0001', 0, () => {
      hilog.info(DOMAIN, TAG, 'testChannelConfigModel0001: start test');
      const model: ChannelConfigModel = new ChannelConfigModel();
      expect(model.channelId).assertEqual('');
      expect(model.status).assertEqual(ChannelConfigStatus.UNINITIALIZED);
      expect(model.lastFetchTime).assertEqual(0);
      expect(model.errorMessage).assertEqual('');
      expect(model.errorCode).assertEqual(0);
      expect(model.fetchCount).assertEqual(0);
    });

    // ========================================
    // Status marking methods
    // ========================================

    /**
     * @tc.number SUB_CHANNEL_CONFIG_MODEL_0200
     * @tc.name testChannelConfigModel0002
     * @tc.desc Verify markSuccess switches status to SUCCESS, updates the channel id and increments the fetch count.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testChannelConfigModel0002', 0, () => {
      hilog.info(DOMAIN, TAG, 'testChannelConfigModel0002: start test');
      const model: ChannelConfigModel = new ChannelConfigModel();
      model.markSuccess('test-channel-001');
      expect(model.channelId).assertEqual('test-channel-001');
      expect(model.status).assertEqual(ChannelConfigStatus.SUCCESS);
      expect(model.fetchCount).assertEqual(1);
      expect(model.errorMessage).assertEqual('');
      expect(model.errorCode).assertEqual(0);
      expect(model.lastFetchTime).assertLarger(0);
    });

    /**
     * @tc.number SUB_CHANNEL_CONFIG_MODEL_0300
     * @tc.name testChannelConfigModel0003
     * @tc.desc Verify markFailed switches status to FAILED and records the error message correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testChannelConfigModel0003', 0, () => {
      hilog.info(DOMAIN, TAG, 'testChannelConfigModel0003: start test');
      const model: ChannelConfigModel = new ChannelConfigModel();
      model.markFailed('获取渠道号失败', 10001);
      expect(model.status).assertEqual(ChannelConfigStatus.FAILED);
      expect(model.errorMessage).assertEqual('获取渠道号失败');
      expect(model.errorCode).assertEqual(10001);
      expect(model.fetchCount).assertEqual(1);
    });

    /**
     * @tc.number SUB_CHANNEL_CONFIG_MODEL_0400
     * @tc.name testChannelConfigModel0004
     * @tc.desc Verify markLoading switches status to LOADING and clears the error message.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testChannelConfigModel0004', 0, () => {
      hilog.info(DOMAIN, TAG, 'testChannelConfigModel0004: start test');
      const model: ChannelConfigModel = new ChannelConfigModel();
      model.markFailed('previous error', 99);
      model.markLoading();
      expect(model.status).assertEqual(ChannelConfigStatus.LOADING);
      expect(model.errorMessage).assertEqual('');
      expect(model.errorCode).assertEqual(0);
    });

    // ========================================
    // Query check methods
    // ========================================

    /**
     * @tc.number SUB_CHANNEL_CONFIG_MODEL_0500
     * @tc.name testChannelConfigModel0005
     * @tc.desc Verify isSuccess returns true after markSuccess and false for other statuses.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testChannelConfigModel0005', 0, () => {
      hilog.info(DOMAIN, TAG, 'testChannelConfigModel0005: start test');
      const model: ChannelConfigModel = new ChannelConfigModel();
      expect(model.isSuccess()).assertEqual(false);
      model.markSuccess('ch-100');
      expect(model.isSuccess()).assertEqual(true);
      model.markFailed('err', 1);
      expect(model.isSuccess()).assertEqual(false);
    });

    // ========================================
    // Reset method
    // ========================================

    /**
     * @tc.number SUB_CHANNEL_CONFIG_MODEL_0600
     * @tc.name testChannelConfigModel0006
     * @tc.desc Verify all fields are restored to initial values after reset.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testChannelConfigModel0006', 0, () => {
      hilog.info(DOMAIN, TAG, 'testChannelConfigModel0006: start test');
      const model: ChannelConfigModel = new ChannelConfigModel();
      model.markSuccess('ch-reset');
      model.reset();
      expect(model.channelId).assertEqual('');
      expect(model.status).assertEqual(ChannelConfigStatus.UNINITIALIZED);
      expect(model.lastFetchTime).assertEqual(0);
      expect(model.errorMessage).assertEqual('');
      expect(model.errorCode).assertEqual(0);
      expect(model.fetchCount).assertEqual(0);
    });

    // ========================================
    // Serialization methods
    // ========================================

    /**
     * @tc.number SUB_CHANNEL_CONFIG_MODEL_0700
     * @tc.name testChannelConfigModel0007
     * @tc.desc Verify toJSON returns an object containing all fields.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testChannelConfigModel0007', 0, () => {
      hilog.info(DOMAIN, TAG, 'testChannelConfigModel0007: start test');
      const model: ChannelConfigModel = new ChannelConfigModel();
      model.markSuccess('ch-json');
      const json: ChannelConfigJson = model.toJSON();
      expect(json.channelId).assertEqual('ch-json');
      expect(json.status).assertEqual(ChannelConfigStatus.SUCCESS);
      expect(json.fetchCount).assertEqual(1);
      expect(json.lastFetchTime).assertLarger(0);
    });

    /**
     * @tc.number SUB_CHANNEL_CONFIG_MODEL_0800
     * @tc.name testChannelConfigModel0008
     * @tc.desc Verify toString returns a non-empty string containing the model info.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testChannelConfigModel0008', 0, () => {
      hilog.info(DOMAIN, TAG, 'testChannelConfigModel0008: start test');
      const model: ChannelConfigModel = new ChannelConfigModel();
      model.markSuccess('ch-str');
      const str: string = model.toString();
      expect(str.length).assertLarger(0);
      expect(str.indexOf('ch-str')).assertLarger(-1);
      expect(str.indexOf('success')).assertLarger(-1);
    });

    // ========================================
    // Statistics and time methods
    // ========================================

    /**
     * @tc.number SUB_CHANNEL_CONFIG_MODEL_0900
     * @tc.name testChannelConfigModel0009
     * @tc.desc Verify fetchCount accumulates correctly across multiple markSuccess and markFailed calls.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testChannelConfigModel0009', 0, () => {
      hilog.info(DOMAIN, TAG, 'testChannelConfigModel0009: start test');
      const model: ChannelConfigModel = new ChannelConfigModel();
      expect(model.fetchCount).assertEqual(0);
      model.markSuccess('ch-1');
      expect(model.fetchCount).assertEqual(1);
      model.markSuccess('ch-2');
      expect(model.fetchCount).assertEqual(2);
      model.markFailed('err', 1);
      expect(model.fetchCount).assertEqual(3);
    });

    /**
     * @tc.number SUB_CHANNEL_CONFIG_MODEL_1000
     * @tc.name testChannelConfigModel0010
     * @tc.desc Verify the time diff returns -1 before any fetch, and after markSuccess the status and channel id update together with the time diff falling inside the call interval.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testChannelConfigModel0010', 0, () => {
      hilog.info(DOMAIN, TAG, 'testChannelConfigModel0010: start test');
      const model: ChannelConfigModel = new ChannelConfigModel();
      expect(model.getTimeSinceLastFetch()).assertEqual(-1);
      expect(model.lastFetchTime).assertEqual(0);
      expect(model.fetchCount).assertEqual(0);
      const beforeMark: number = Date.now();
      model.markSuccess('ch-time');
      // The time diff must be read before capturing after: getTimeSinceLastFetch re-reads Date.now() on every call,
      // so capturing after first would make the upper-bound assertion fail sporadically across millisecond boundaries.
      const timeDiff: number = model.getTimeSinceLastFetch();
      const afterMark: number = Date.now();
      expect(model.channelId).assertEqual('ch-time');
      expect(model.status).assertEqual(ChannelConfigStatus.SUCCESS);
      expect(model.errorMessage).assertEqual('');
      expect(model.errorCode).assertEqual(0);
      expect(model.fetchCount).assertEqual(1);
      expect(model.isSuccess()).assertTrue();
      expect(model.lastFetchTime).assertLargerOrEqual(beforeMark);
      expect(model.lastFetchTime).assertLessOrEqual(afterMark);
      expect(timeDiff).assertLargerOrEqual(0);
      expect(timeDiff).assertLessOrEqual(afterMark - beforeMark);
    });
  });
}
