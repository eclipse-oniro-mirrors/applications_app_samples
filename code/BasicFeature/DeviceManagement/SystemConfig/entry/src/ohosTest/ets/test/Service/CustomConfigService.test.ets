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
import { CustomConfigService, ChannelConfigModel, ChannelConfigStatus } from 'library';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_SystemConfig]';

/**
 * CustomConfigService interface test suite.
 * Verifies initialization, channel id fetching, status management, reset and destroy.
 */
export default function CustomConfigServiceTest(): void {
  describe('CustomConfigServiceTest', () => {

    /**
     * @tc.number SUB_CUSTOM_CONFIG_SERVICE_0100
     * @tc.name testCustomConfigService0001
     * @tc.desc Verify isServiceInitialized returns true after initialization
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCustomConfigService0001', 0, () => {
      hilog.info(DOMAIN, TAG, 'testCustomConfigService0001: begin');
      const service: CustomConfigService = new CustomConfigService();
      expect(service.isServiceInitialized()).assertFalse();
      service.initialize();
      expect(service.isServiceInitialized()).assertTrue();
      service.destroy();
      expect(service.isServiceInitialized()).assertFalse();
    });

    /**
     * @tc.number SUB_CUSTOM_CONFIG_SERVICE_0200
     * @tc.name testCustomConfigService0002
     * @tc.desc Verify the return value stays consistent with the model across consecutive fetches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCustomConfigService0002', 0, () => {
      hilog.info(DOMAIN, TAG, 'testCustomConfigService0002: begin');
      const service: CustomConfigService = new CustomConfigService();
      service.initialize();
      const channelId: string = service.getChannelId();
      const channelId2: string = service.getChannelId();
      const model: ChannelConfigModel = service.getChannelConfigModel();
      expect(channelId2).assertEqual(channelId);
      expect(model.channelId).assertEqual(channelId2);
      expect(model.fetchCount).assertEqual(2);
      expect(service.getCurrentStatus()).assertEqual(model.status);
      service.destroy();
    });

    /**
     * @tc.number SUB_CUSTOM_CONFIG_SERVICE_0300
     * @tc.name testCustomConfigService0003
     * @tc.desc Verify the model matches the current status after fetching the channel id
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCustomConfigService0003', 0, () => {
      hilog.info(DOMAIN, TAG, 'testCustomConfigService0003: begin');
      const service: CustomConfigService = new CustomConfigService();
      service.initialize();
      const channelId: string = service.getChannelId();
      const model: ChannelConfigModel = service.getChannelConfigModel();
      expect(model.channelId).assertEqual(channelId);
      expect(model.status).assertEqual(service.getCurrentStatus());
      expect(model.fetchCount).assertEqual(1);
      expect(model.isSuccess()).assertEqual(model.status === ChannelConfigStatus.SUCCESS && channelId.length > 0);
      service.destroy();
    });

    /**
     * @tc.number SUB_CUSTOM_CONFIG_SERVICE_0400
     * @tc.name testCustomConfigService0004
     * @tc.desc Verify the current status is exactly UNINITIALIZED after initialization
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCustomConfigService0004', 0, () => {
      hilog.info(DOMAIN, TAG, 'testCustomConfigService0004: begin');
      const service: CustomConfigService = new CustomConfigService();
      service.initialize();
      const status: ChannelConfigStatus = service.getCurrentStatus();
      const model: ChannelConfigModel = service.getChannelConfigModel();
      expect(status).assertEqual(ChannelConfigStatus.UNINITIALIZED);
      expect(service.isServiceInitialized()).assertTrue();
      expect(model.status).assertEqual(status);
      expect(model.channelId).assertEqual('');
      expect(model.lastFetchTime).assertEqual(0);
      expect(model.errorMessage).assertEqual('');
      expect(model.errorCode).assertEqual(0);
      expect(model.fetchCount).assertEqual(0);
      service.destroy();
    });

    /**
     * @tc.number SUB_CUSTOM_CONFIG_SERVICE_0500
     * @tc.name testCustomConfigService0005
     * @tc.desc Verify the status returns to uninitialized after reset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testCustomConfigService0005', 0, () => {
      hilog.info(DOMAIN, TAG, 'serviceResetTest: begin');
      const service: CustomConfigService = new CustomConfigService();
      service.initialize();
      expect(service.isServiceInitialized()).assertTrue();
      service.getChannelId();
      service.reset();
      expect(service.isServiceInitialized()).assertFalse();
      service.initialize();
      expect(service.isServiceInitialized()).assertTrue();
      service.destroy();
    });

    /**
     * @tc.number SUB_CUSTOM_CONFIG_SERVICE_0600
     * @tc.name testCustomConfigService0006
     * @tc.desc Verify repeated getChannelId calls return consistent results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testCustomConfigService0006', 0, () => {
      hilog.info(DOMAIN, TAG, 'getChannelIdConsistencyTest: begin');
      const service: CustomConfigService = new CustomConfigService();
      service.initialize();
      const first: string = service.getChannelId();
      const second: string = service.getChannelId();
      const third: string = service.getChannelId();
      const model: ChannelConfigModel = service.getChannelConfigModel();
      expect(first).assertEqual(second);
      expect(second).assertEqual(third);
      expect(model.channelId).assertEqual(third);
      expect(model.status).assertEqual(service.getCurrentStatus());
      expect(model.fetchCount).assertEqual(3);
      service.destroy();
    });
  });
}
