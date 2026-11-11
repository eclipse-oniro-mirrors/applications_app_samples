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

const DOMAIN: number = 0xF820;
const TAG: string = '[Sample_SystemConfig]';

/**
 * CustomConfigService 接口测试套件。
 * 验证 CustomConfigService 的初始化、渠道号获取、状态管理、重置与销毁等能力。
 */
export default function CustomConfigServiceTest(): void {
  describe('CustomConfigServiceTest', () => {

    /**
     * @tc.number SUB_CUSTOM_CONFIG_SERVICE_0100
     * @tc.name testCustomConfigService0001
     * @tc.desc 正向: 初始化后 isServiceInitialized 返回 true
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
     * @tc.desc 正向: 连续获取渠道号时返回值与模型一致
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
     * @tc.desc 正向: 获取渠道号后模型与当前状态一致
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
     * @tc.desc 正向: 初始化后当前状态精确为 UNINITIALIZED
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
     * @tc.desc 正向: 重置后状态回到未初始化
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
     * @tc.desc 正向: 多次调用 getChannelId 返回一致结果
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
