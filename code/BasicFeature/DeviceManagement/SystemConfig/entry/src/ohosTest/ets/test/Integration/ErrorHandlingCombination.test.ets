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
  EventService,
  TraceService,
  ChannelConfigModel,
  ChannelConfigStatus,
  SystemConfigConstants
} from 'library';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_SystemConfig]';

/**
 * Error-handling combination test suite.
 * Verifies the behavior of each service under exception scenarios.
 */
export default function ErrorHandlingCombinationTest(): void {
  describe('ErrorHandlingCombinationTest', () => {

    /**
     * @tc.number SUB_ERROR_HANDLING_COMBINATION_0100
     * @tc.name testErrorHandlingCombination0001
     * @tc.desc Verify calling getChannelId on an uninitialized service throws no exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testErrorHandlingCombination0001', 0, () => {
      hilog.info(DOMAIN, TAG, 'testErrorHandlingCombination0001: begin');
      const service: CustomConfigService = new CustomConfigService();
      expect(service.isServiceInitialized()).assertFalse();
      const channelId: string = service.getChannelId();
      const model: ChannelConfigModel = service.getChannelConfigModel();
      expect(channelId).assertEqual(model.channelId);
      expect(service.getCurrentStatus()).assertEqual(model.status);
      expect(model.isSuccess()).assertEqual(model.status === ChannelConfigStatus.SUCCESS && channelId.length > 0);
      expect(model.fetchCount).assertEqual(1);
      expect(service.isServiceInitialized()).assertFalse();
      service.destroy();
    });

    /**
     * @tc.number SUB_ERROR_HANDLING_COMBINATION_0200
     * @tc.name testErrorHandlingCombination0002
     * @tc.desc Verify repeated destroy throws no exception and each time rebuilds the channel model to its initial state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testErrorHandlingCombination0002', 0, () => {
      hilog.info(DOMAIN, TAG, 'testErrorHandlingCombination0002: begin');
      const service: CustomConfigService = new CustomConfigService();
      service.initialize();
      expect(service.isServiceInitialized()).assertTrue();
      service.destroy();
      expect(service.isServiceInitialized()).assertFalse();
      // A second destroy is idempotent; if it throws, the test framework marks this case failed directly
      const modelAfterFirstDestroy: ChannelConfigModel = service.getChannelConfigModel();
      service.destroy();
      expect(service.isServiceInitialized()).assertFalse();
      expect(service.getChannelConfigModel() === modelAfterFirstDestroy).assertFalse();
      expect(service.getChannelConfigModel().channelId).assertEqual('');
      expect(service.getChannelConfigModel().status).assertEqual(ChannelConfigStatus.UNINITIALIZED);
      expect(service.getChannelConfigModel().lastFetchTime).assertEqual(0);
      expect(service.getChannelConfigModel().fetchCount).assertEqual(0);
    });

    /**
     * @tc.number SUB_ERROR_HANDLING_COMBINATION_0300
     * @tc.name testErrorHandlingCombination0003
     * @tc.desc Verify reporting an event on an uninitialized EventService throws no exception and writes it to history and statistics
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testErrorHandlingCombination0003', 0, () => {
      hilog.info(DOMAIN, TAG, 'testErrorHandlingCombination0003: begin');
      const service: EventService = new EventService();
      expect(service.isServiceInitialized()).assertFalse();
      // Reporting an event while uninitialized throws no exception; emitEvent has no initialization guard and still writes the history record
      const beforeReport: number = Date.now();
      service.reportChannelFetched('ch', true);
      const history = service.getEventHistory();
      expect(history.length).assertEqual(1);
      expect(history[0].name).assertEqual('channelFetched');
      expect(history[0].data['channelId'] as string).assertEqual('ch');
      expect(history[0].data['success'] as boolean).assertTrue();
      expect(history[0].time >= beforeReport).assertTrue();
      expect(service.getStatistics().totalCount).assertEqual(1);
      expect(service.getStatistics().countByType.get('channelFetched')).assertEqual(1);
      service.destroy();
    });

    /**
     * @tc.number SUB_ERROR_HANDLING_COMBINATION_0400
     * @tc.name testErrorHandlingCombination0004
     * @tc.desc Verify operations after disabling tracing report no error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testErrorHandlingCombination0004', 0, () => {
      hilog.info(DOMAIN, TAG, 'testErrorHandlingCombination0004: begin');
      const service: TraceService = new TraceService();
      service.initialize();
      service.setEnabled(false);
      expect(service.isTraceEnabled()).assertFalse();
      service.startTrace('test_trace');
      expect(service.getActiveTraceCount()).assertEqual(0);
      service.finishTrace('test_trace');
      expect(service.getActiveTraceCount()).assertEqual(0);
      service.destroy();
    });

    /**
     * @tc.number SUB_ERROR_HANDLING_COMBINATION_0500
     * @tc.name testErrorHandlingCombination0005
     * @tc.desc Verify reset after destroy can re-initialize the service
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testErrorHandlingCombination0005', 0, () => {
      hilog.info(DOMAIN, TAG, 'testErrorHandlingCombination0005: begin');
      const service: CustomConfigService = new CustomConfigService();
      service.initialize();
      expect(service.isServiceInitialized()).assertTrue();
      service.destroy();
      expect(service.isServiceInitialized()).assertFalse();
      service.initialize();
      expect(service.isServiceInitialized()).assertTrue();
      service.destroy();
    });

    /**
     * @tc.number SUB_ERROR_HANDLING_COMBINATION_0600
     * @tc.name testErrorHandlingCombination0006
     * @tc.desc Verify status consistency is preserved after fetching the channel id
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testErrorHandlingCombination0006', 0, () => {
      hilog.info(DOMAIN, TAG, 'testErrorHandlingCombination0006: begin');
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
      service.destroy();
    });
  });
}
