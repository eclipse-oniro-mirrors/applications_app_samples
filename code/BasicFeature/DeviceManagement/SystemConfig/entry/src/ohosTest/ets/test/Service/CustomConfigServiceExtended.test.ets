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
import { CustomConfigService, ChannelConfigModel, ChannelConfigStatus, SystemConfigConstants } from 'library';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_SystemConfig]';

/**
 * Check non-empty success, empty success or exception failure against the device's
 * actual result, without assuming the channel id must be empty.
 */
function assertFetchResult(service: CustomConfigService, channelId: string,
  expectedFetchCount: number): ChannelConfigModel {
  const model: ChannelConfigModel = service.getChannelConfigModel();
  expect(channelId).assertEqual(model.channelId);
  expect(model.fetchCount).assertEqual(expectedFetchCount);
  expect(model.lastFetchTime).assertLarger(0);
  expect(service.getCurrentStatus()).assertEqual(model.status);
  if (model.status === ChannelConfigStatus.SUCCESS) {
    expect(model.errorMessage).assertEqual('');
    expect(model.errorCode).assertEqual(0);
    expect(model.isFailed()).assertFalse();
    if (channelId.length > 0) {
      expect(model.isSuccess()).assertTrue();
    } else {
      expect(model.isSuccess()).assertFalse();
    }
  } else {
    expect(model.status).assertEqual(ChannelConfigStatus.FAILED);
    expect(channelId).assertEqual(SystemConfigConstants.DEFAULT_CHANNEL_ID);
    expect(model.isSuccess()).assertFalse();
    expect(model.isFailed()).assertTrue();
    expect(model.errorMessage.length).assertLarger(0);
    expect(model.errorCode).assertLarger(0);
  }
  return model;
}

/**
 * CustomConfigService extended test suite.
 * Adds coverage for repeated sequential calls / state transitions / exception recovery /
 * boundary values / long-running scenarios.
 */
export default function CustomConfigServiceExtendedTest(): void {
  describe('CustomConfigServiceExtendedTest', () => {

    // ========================================
    // Repeated sequential call tests
    // ========================================

    /**
     * @tc.number SUB_CUSTOM_CONFIG_SERVICE_EXTENDED_0100
     * @tc.name testCustomConfigServiceExtended0001
     * @tc.desc Verify repeated sequential getChannelId calls return consistent results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testCustomConfigServiceExtended0001', 0, () => {
      hilog.info(DOMAIN, TAG, 'testCustomConfigServiceExtended0001: begin');
      const service: CustomConfigService = new CustomConfigService();
      service.initialize();

      const results: string[] = [];
      for (let i: number = 0; i < 10; i++) {
        results.push(service.getChannelId());
      }

      for (let i: number = 1; i < results.length; i++) {
        expect(results[i]).assertEqual(results[0]);
      }
      expect(results.length).assertEqual(10);
      const model: ChannelConfigModel = assertFetchResult(service, results[0], 10);
      expect(service.getChannelConfigModel()).assertEqual(model);
      expect(model.getTimeSinceLastFetch()).assertLargerOrEqual(0);
      expect(service.isServiceInitialized()).assertTrue();
      service.destroy();
    });

    /**
     * @tc.number SUB_CUSTOM_CONFIG_SERVICE_EXTENDED_0200
     * @tc.name testCustomConfigServiceExtended0002
     * @tc.desc Verify the model status is correct after repeated sequential calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testCustomConfigServiceExtended0002', 0, () => {
      hilog.info(DOMAIN, TAG, 'testCustomConfigServiceExtended0002: begin');
      const service: CustomConfigService = new CustomConfigService();
      service.initialize();

      let channelId: string = '';
      for (let i: number = 0; i < 5; i++) {
        channelId = service.getChannelId();
      }

      const model: ChannelConfigModel = assertFetchResult(service, channelId, 5);
      expect(service.isServiceInitialized()).assertTrue();
      expect(model.isLoading()).assertFalse();
      expect(service.getChannelConfigModel()).assertEqual(model);
      expect(model.getTimeSinceLastFetch()).assertLargerOrEqual(0);
      service.destroy();
    });

    // ========================================
    // State transition tests
    // ========================================

    /**
     * @tc.number SUB_CUSTOM_CONFIG_SERVICE_EXTENDED_0300
     * @tc.name testCustomConfigServiceExtended0003
     * @tc.desc Verify the status matches the device result after fetching the channel id
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCustomConfigServiceExtended0003', 0, () => {
      hilog.info(DOMAIN, TAG, 'testCustomConfigServiceExtended0003: begin');
      const service: CustomConfigService = new CustomConfigService();

      expect(service.getCurrentStatus()).assertEqual(ChannelConfigStatus.UNINITIALIZED);

      service.initialize();
      expect(service.getCurrentStatus()).assertEqual(ChannelConfigStatus.UNINITIALIZED);

      const model: ChannelConfigModel = service.getChannelConfigModel();
      expect(model.status).assertEqual(ChannelConfigStatus.UNINITIALIZED);

      const channelId: string = service.getChannelId();
      const resultModel: ChannelConfigModel = assertFetchResult(service, channelId, 1);
      expect(resultModel).assertEqual(model);

      service.destroy();
    });

    /**
     * @tc.number SUB_CUSTOM_CONFIG_SERVICE_EXTENDED_0400
     * @tc.name testCustomConfigServiceExtended0004
     * @tc.desc Verify the status returns to UNINITIALIZED after reset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testCustomConfigServiceExtended0004', 0, () => {
      hilog.info(DOMAIN, TAG, 'testCustomConfigServiceExtended0004: begin');
      const service: CustomConfigService = new CustomConfigService();
      service.initialize();
      const channelId: string = service.getChannelId();
      const model: ChannelConfigModel = assertFetchResult(service, channelId, 1);

      service.reset();
      expect(service.getCurrentStatus()).assertEqual(ChannelConfigStatus.UNINITIALIZED);
      expect(service.isServiceInitialized()).assertFalse();
      expect(model.fetchCount).assertEqual(0);
      expect(model.channelId).assertEqual('');
    });

    // ========================================
    // Exception recovery tests
    // ========================================

    /**
     * @tc.number SUB_CUSTOM_CONFIG_SERVICE_EXTENDED_0500
     * @tc.name testCustomConfigServiceExtended0005
     * @tc.desc Verify fetching the channel id directly without initialization
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testCustomConfigServiceExtended0005', 0, () => {
      hilog.info(DOMAIN, TAG, 'testCustomConfigServiceExtended0005: begin');
      const service: CustomConfigService = new CustomConfigService();
      
      expect(service.isServiceInitialized()).assertFalse();
      
      const channelId: string = service.getChannelId();
      const model: ChannelConfigModel = assertFetchResult(service, channelId, 1);
      expect(service.isServiceInitialized()).assertFalse();
      expect(model.isLoading()).assertFalse();
    });

    /**
     * @tc.number SUB_CUSTOM_CONFIG_SERVICE_EXTENDED_0600
     * @tc.name testCustomConfigServiceExtended0006
     * @tc.desc Verify re-initialization after destroy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testCustomConfigServiceExtended0006', 0, () => {
      hilog.info(DOMAIN, TAG, 'testCustomConfigServiceExtended0006: begin');
      const service: CustomConfigService = new CustomConfigService();
      
      service.initialize();
      expect(service.isServiceInitialized()).assertTrue();
      
      service.destroy();
      expect(service.isServiceInitialized()).assertFalse();
      
      service.initialize();
      expect(service.isServiceInitialized()).assertTrue();
      
      const channelId: string = service.getChannelId();
      const model: ChannelConfigModel = assertFetchResult(service, channelId, 1);
      expect(model.fetchCount).assertEqual(1);
      expect(service.getCurrentStatus()).assertEqual(model.status);
      service.destroy();
    });

    /**
     * @tc.number SUB_CUSTOM_CONFIG_SERVICE_EXTENDED_0700
     * @tc.name testCustomConfigServiceExtended0007
     * @tc.desc Verify repeated destroy calls do not throw
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testCustomConfigServiceExtended0007', 0, () => {
      hilog.info(DOMAIN, TAG, 'testCustomConfigServiceExtended0007: begin');
      const service: CustomConfigService = new CustomConfigService();
      
      service.initialize();
      service.destroy();
      service.destroy();
      service.destroy();
      
      expect(service.isServiceInitialized()).assertFalse();
      expect(service.getCurrentStatus()).assertEqual(ChannelConfigStatus.UNINITIALIZED);
      expect(service.getChannelConfigModel().fetchCount).assertEqual(0);
    });

    // ========================================
    // Boundary value tests
    // ========================================

    /**
     * @tc.number SUB_CUSTOM_CONFIG_SERVICE_EXTENDED_0800
     * @tc.name testCustomConfigServiceExtended0008
     * @tc.desc Verify reset immediately after fetching the channel id
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testCustomConfigServiceExtended0008', 0, () => {
      hilog.info(DOMAIN, TAG, 'testCustomConfigServiceExtended0008: begin');
      const service: CustomConfigService = new CustomConfigService();
      service.initialize();
      
      const channelId: string = service.getChannelId();
      const model: ChannelConfigModel = assertFetchResult(service, channelId, 1);

      service.reset();
      expect(service.getCurrentStatus()).assertEqual(ChannelConfigStatus.UNINITIALIZED);
      expect(service.isServiceInitialized()).assertFalse();
      expect(model.fetchCount).assertEqual(0);
      expect(model.channelId).assertEqual('');
      expect(model.lastFetchTime).assertEqual(0);
    });

    /**
     * @tc.number SUB_CUSTOM_CONFIG_SERVICE_EXTENDED_0900
     * @tc.name testCustomConfigServiceExtended0009
     * @tc.desc Verify getting the model after reset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testCustomConfigServiceExtended0009', 0, () => {
      hilog.info(DOMAIN, TAG, 'testCustomConfigServiceExtended0009: begin');
      const service: CustomConfigService = new CustomConfigService();
      service.initialize();
      const channelId: string = service.getChannelId();
      const modelBefore: ChannelConfigModel = assertFetchResult(service, channelId, 1);

      service.reset();
      const modelAfter: ChannelConfigModel = service.getChannelConfigModel();
      expect(modelAfter).assertEqual(modelBefore);
      expect(modelAfter.fetchCount).assertEqual(0);
      expect(modelAfter.channelId).assertEqual('');
      expect(modelAfter.status).assertEqual(ChannelConfigStatus.UNINITIALIZED);
    });

    /**
     * @tc.number SUB_CUSTOM_CONFIG_SERVICE_EXTENDED_1000
     * @tc.name testCustomConfigServiceExtended0010
     * @tc.desc Verify model reference consistency
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testCustomConfigServiceExtended0010', 0, () => {
      hilog.info(DOMAIN, TAG, 'testCustomConfigServiceExtended0010: begin');
      const service: CustomConfigService = new CustomConfigService();
      service.initialize();
      
      const model1: ChannelConfigModel = service.getChannelConfigModel();
      const model2: ChannelConfigModel = service.getChannelConfigModel();
      
      expect(model1).assertEqual(model2);
      expect(model1.channelId).assertEqual(model2.channelId);
      expect(model1.status).assertEqual(model2.status);
    });

    // ========================================
    // Long-running tests
    // ========================================

    /**
     * @tc.number SUB_CUSTOM_CONFIG_SERVICE_EXTENDED_1100
     * @tc.name testCustomConfigServiceExtended0011
     * @tc.desc Verify memory stays stable after a large number of calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testCustomConfigServiceExtended0011', 0, () => {
      hilog.info(DOMAIN, TAG, 'testCustomConfigServiceExtended0011: begin');
      const service: CustomConfigService = new CustomConfigService();
      service.initialize();
      
      let channelId: string = '';
      for (let i: number = 0; i < 100; i++) {
        channelId = service.getChannelId();
      }

      const model: ChannelConfigModel = assertFetchResult(service, channelId, 100);
      expect(service.isServiceInitialized()).assertTrue();
      expect(model.isLoading()).assertFalse();
      expect(service.getChannelConfigModel()).assertEqual(model);
      expect(model.getTimeSinceLastFetch()).assertLargerOrEqual(0);

      service.destroy();
    });

    /**
     * @tc.number SUB_CUSTOM_CONFIG_SERVICE_EXTENDED_1200
     * @tc.name testCustomConfigServiceExtended0012
     * @tc.desc Verify repeated initialize/destroy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testCustomConfigServiceExtended0012', 0, () => {
      hilog.info(DOMAIN, TAG, 'testCustomConfigServiceExtended0012: begin');
      const service: CustomConfigService = new CustomConfigService();
      
      for (let i: number = 0; i < 10; i++) {
        service.initialize();
        expect(service.isServiceInitialized()).assertTrue();
        service.getChannelId();
        service.destroy();
        expect(service.isServiceInitialized()).assertFalse();
      }

      const model: ChannelConfigModel = service.getChannelConfigModel();
      expect(model.fetchCount).assertEqual(0);
      expect(model.status).assertEqual(ChannelConfigStatus.UNINITIALIZED);
      expect(model.channelId).assertEqual('');
    });

    // ========================================
    // Combined scenario tests
    // ========================================

    /**
     * @tc.number SUB_CUSTOM_CONFIG_SERVICE_EXTENDED_1300
     * @tc.name testCustomConfigServiceExtended0013
     * @tc.desc Verify initialize → fetch → reset → fetch again
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testCustomConfigServiceExtended0013', 0, () => {
      hilog.info(DOMAIN, TAG, 'testCustomConfigServiceExtended0013: begin');
      const service: CustomConfigService = new CustomConfigService();
      
      service.initialize();
      const firstId: string = service.getChannelId();
      assertFetchResult(service, firstId, 1);

      service.reset();
      expect(service.getCurrentStatus()).assertEqual(ChannelConfigStatus.UNINITIALIZED);
      expect(service.isServiceInitialized()).assertFalse();

      service.initialize();
      const secondId: string = service.getChannelId();
      const secondModel: ChannelConfigModel = assertFetchResult(service, secondId, 1);
      expect(secondModel.fetchCount).assertEqual(1);

      service.destroy();
    });

    /**
     * @tc.number SUB_CUSTOM_CONFIG_SERVICE_EXTENDED_1400
     * @tc.name testCustomConfigServiceExtended0014
     * @tc.desc Verify fetch → destroy → re-initialize
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testCustomConfigServiceExtended0014', 0, () => {
      hilog.info(DOMAIN, TAG, 'testCustomConfigServiceExtended0014: begin');
      const service: CustomConfigService = new CustomConfigService();
      
      service.initialize();
      const channelId: string = service.getChannelId();
      assertFetchResult(service, channelId, 1);

      service.destroy();
      expect(service.isServiceInitialized()).assertFalse();
      
      service.initialize();
      expect(service.isServiceInitialized()).assertTrue();
      expect(service.getCurrentStatus()).assertEqual(ChannelConfigStatus.UNINITIALIZED);
      
      service.destroy();
    });

    /**
     * @tc.number SUB_CUSTOM_CONFIG_SERVICE_EXTENDED_1500
     * @tc.name testCustomConfigServiceExtended0015
     * @tc.desc Verify reset after multiple fetches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testCustomConfigServiceExtended0015', 0, () => {
      hilog.info(DOMAIN, TAG, 'testCustomConfigServiceExtended0015: begin');
      const service: CustomConfigService = new CustomConfigService();
      service.initialize();
      
      let channelId: string = '';
      for (let i: number = 0; i < 5; i++) {
        channelId = service.getChannelId();
      }

      const model: ChannelConfigModel = assertFetchResult(service, channelId, 5);

      service.reset();
      expect(model.fetchCount).assertEqual(0);
      expect(model.channelId).assertEqual('');
      expect(model.status).assertEqual(ChannelConfigStatus.UNINITIALIZED);
      expect(service.isServiceInitialized()).assertFalse();
      
      service.destroy();
    });
  });
}
