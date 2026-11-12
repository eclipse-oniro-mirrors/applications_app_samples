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
import {
  CustomConfigService,
  ChannelConfigModel,
  ChannelConfigStatus,
  SystemConfigConstants
} from 'library';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_SystemConfig]';

/**
 * CustomConfigService getChannelId interface test suite.
 * Verifies the correctness of obtaining the channel identifier via CustomConfigService,
 * format consistency, stability across repeated calls and exception-scenario handling.
 */
export default function CustomConfigGetChannelIdTest(): void {
  describe('CustomConfigGetChannelIdTest', () => {

    // ========================================
    // Positive cases
    // ========================================

    /**
     * @tc.number SUB_CUSTOM_CONFIG_GET_CHANNEL_ID_0100
     * @tc.name testCustomConfigGetChannelId0001
     * @tc.desc Verify the returned value, status and model stay consistent after fetching the channel id.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCustomConfigGetChannelId0001', 0, () => {
      hilog.info(DOMAIN, TAG, 'testCustomConfigGetChannelId0001: start test');
      const service: CustomConfigService = new CustomConfigService();
      service.initialize();
      const channelId: string = service.getChannelId();
      const model: ChannelConfigModel = service.getChannelConfigModel();
      expect(channelId).assertEqual(model.channelId);
      expect(service.getCurrentStatus()).assertEqual(model.status);
      expect(model.isSuccess()).assertEqual(model.status === ChannelConfigStatus.SUCCESS && channelId.length > 0);
      expect(model.fetchCount).assertEqual(1);
      expect(service.isServiceInitialized()).assertTrue();
      hilog.info(DOMAIN, TAG, 'testCustomConfigGetChannelId0001: channelId=%{public}s', channelId);
      service.destroy();
    });

    /**
     * @tc.number SUB_CUSTOM_CONFIG_GET_CHANNEL_ID_0200
     * @tc.name testCustomConfigGetChannelId0002
     * @tc.desc Verify the success or failed model against the device's actual channel id.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCustomConfigGetChannelId0002', 0, () => {
      hilog.info(DOMAIN, TAG, 'testCustomConfigGetChannelId0002: start test');
      const service: CustomConfigService = new CustomConfigService();
      service.initialize();
      const channelId: string = service.getChannelId();
      const model: ChannelConfigModel = service.getChannelConfigModel();
      expect(channelId).assertEqual(model.channelId);
      expect(service.getCurrentStatus()).assertEqual(model.status);
      expect(model.fetchCount).assertEqual(1);
      if (model.status === ChannelConfigStatus.SUCCESS) {
        expect(model.errorMessage).assertEqual('');
        expect(model.errorCode).assertEqual(0);
        expect(model.isSuccess()).assertEqual(channelId.length > 0);
      } else {
        expect(model.status).assertEqual(ChannelConfigStatus.FAILED);
        expect(channelId).assertEqual(SystemConfigConstants.DEFAULT_CHANNEL_ID);
        expect(model.errorMessage.length).assertLarger(0);
        expect(model.isSuccess()).assertFalse();
      }
      hilog.info(DOMAIN, TAG, 'testCustomConfigGetChannelId0002: length=%{public}d', channelId.length);
      service.destroy();
    });

    /**
     * @tc.number SUB_CUSTOM_CONFIG_GET_CHANNEL_ID_0300
     * @tc.name testCustomConfigGetChannelId0003
     * @tc.desc Verify repeated getChannelId calls return consistent results.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testCustomConfigGetChannelId0003', 0, () => {
      hilog.info(DOMAIN, TAG, 'testCustomConfigGetChannelId0003: start test');
      const service: CustomConfigService = new CustomConfigService();
      service.initialize();
      const first: string = service.getChannelId();
      const second: string = service.getChannelId();
      const third: string = service.getChannelId();
      const model: ChannelConfigModel = service.getChannelConfigModel();
      expect(first).assertEqual(second);
      expect(second).assertEqual(third);
      expect(third).assertEqual(model.channelId);
      expect(model.fetchCount).assertEqual(3);
      hilog.info(DOMAIN, TAG, 'getChannelIdConsistencyTest: all results consistent');
      service.destroy();
    });

    // ========================================
    // Negative cases
    // ========================================

    /**
     * @tc.number SUB_CUSTOM_CONFIG_GET_CHANNEL_ID_0400
     * @tc.name testCustomConfigGetChannelId0004
     * @tc.desc Verify reset clears the model and a re-initialized service fetches consistently.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testCustomConfigGetChannelId0004', 0, () => {
      hilog.info(DOMAIN, TAG, 'testCustomConfigGetChannelId0004: start test');
      const service: CustomConfigService = new CustomConfigService();
      service.initialize();
      service.getChannelId();
      service.reset();
      const resetModel: ChannelConfigModel = service.getChannelConfigModel();
      expect(service.isServiceInitialized()).assertFalse();
      expect(resetModel.status).assertEqual(ChannelConfigStatus.UNINITIALIZED);
      expect(resetModel.channelId).assertEqual('');
      expect(resetModel.lastFetchTime).assertEqual(0);
      expect(resetModel.errorMessage).assertEqual('');
      expect(resetModel.errorCode).assertEqual(0);
      expect(resetModel.fetchCount).assertEqual(0);
      service.initialize();
      const channelId: string = service.getChannelId();
      const fetchedModel: ChannelConfigModel = service.getChannelConfigModel();
      expect(channelId).assertEqual(fetchedModel.channelId);
      expect(service.getCurrentStatus()).assertEqual(fetchedModel.status);
      expect(fetchedModel.isSuccess()).assertEqual(
        fetchedModel.status === ChannelConfigStatus.SUCCESS && channelId.length > 0);
      expect(fetchedModel.fetchCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, 'testCustomConfigGetChannelId0004: channelId after reset=%{public}s', channelId);
      service.destroy();
    });

    /**
     * @tc.number SUB_CUSTOM_CONFIG_GET_CHANNEL_ID_0500
     * @tc.name testCustomConfigGetChannelId0005
     * @tc.desc Verify fetching the channel id on an uninitialized service keeps the model consistent and the init flag unchanged.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testCustomConfigGetChannelId0005', 0, () => {
      hilog.info(DOMAIN, TAG, 'testCustomConfigGetChannelId0005: start test');
      const service: CustomConfigService = new CustomConfigService();
      expect(service.isServiceInitialized()).assertFalse();
      const channelId: string = service.getChannelId();
      const model: ChannelConfigModel = service.getChannelConfigModel();
      expect(channelId).assertEqual(model.channelId);
      expect(service.getCurrentStatus()).assertEqual(model.status);
      expect(model.isSuccess()).assertEqual(model.status === ChannelConfigStatus.SUCCESS && channelId.length > 0);
      expect(model.fetchCount).assertEqual(1);
      expect(service.isServiceInitialized()).assertFalse();
      hilog.info(DOMAIN, TAG, 'testCustomConfigGetChannelId0005: channelId without init=%{public}s', channelId);
      service.destroy();
    });
  });
}
