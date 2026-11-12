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
  TraceName,
  ChannelConfigStatus
} from 'library';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_SystemConfig]';

/**
 * Multi-service integration test suite.
 * Verifies CustomConfigService + EventService + TraceService working together.
 */
export default function MultiServiceIntegrationTest(): void {
  describe('MultiServiceIntegrationTest', () => {

    /**
     * @tc.number SUB_MULTI_SERVICE_INTEGRATION_0100
     * @tc.name testMultiServiceIntegration0001
     * @tc.desc Verify all three services can be initialized
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testMultiServiceIntegration0001', 0, () => {
      hilog.info(DOMAIN, TAG, 'testMultiServiceIntegration0001: begin');
      const customService: CustomConfigService = new CustomConfigService();
      const eventService: EventService = new EventService();
      const traceService: TraceService = new TraceService();

      customService.initialize();
      const eventInit: boolean = eventService.initialize();
      traceService.initialize();

      expect(customService.isServiceInitialized()).assertEqual(true);
      expect(eventInit).assertEqual(true);
      expect(traceService.isTraceEnabled()).assertEqual(true);
      expect(customService.getCurrentStatus()).assertEqual(ChannelConfigStatus.UNINITIALIZED);
      expect(eventService.getEventHistory().length).assertEqual(0);
      expect(traceService.getActiveTraceCount()).assertEqual(0);

      customService.destroy();
      eventService.destroy();
      traceService.destroy();
    });

    /**
     * @tc.number SUB_MULTI_SERVICE_INTEGRATION_0200
     * @tc.name testMultiServiceIntegration0002
     * @tc.desc Verify fetching the channel id with tracing and event reporting
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testMultiServiceIntegration0002', 0, () => {
      hilog.info(DOMAIN, TAG, 'testMultiServiceIntegration0002: begin');
      const customService: CustomConfigService = new CustomConfigService();
      const eventService: EventService = new EventService();
      const traceService: TraceService = new TraceService();

      customService.initialize();
      eventService.initialize();
      traceService.initialize();

      traceService.startTrace(TraceName.CUSTOM_CONFIG_GET_CHANNEL);
      const channelId: string = customService.getChannelId();
      traceService.finishTrace(TraceName.CUSTOM_CONFIG_GET_CHANNEL);

      eventService.reportChannelFetched(channelId, channelId.length > 0);

      const status: ChannelConfigStatus = customService.getCurrentStatus();
      expect(status).assertEqual(ChannelConfigStatus.SUCCESS);
      expect(eventService.getEventHistory().length).assertEqual(1);
      expect(traceService.getActiveTraceCount()).assertEqual(0);

      customService.destroy();
      eventService.destroy();
      traceService.destroy();
    });

    /**
     * @tc.number SUB_MULTI_SERVICE_INTEGRATION_0300
     * @tc.name testMultiServiceIntegration0003
     * @tc.desc Verify destroying services in order does not affect the other services
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testMultiServiceIntegration0003', 0, () => {
      hilog.info(DOMAIN, TAG, 'testMultiServiceIntegration0003: begin');
      const customService: CustomConfigService = new CustomConfigService();
      const eventService: EventService = new EventService();

      customService.initialize();
      eventService.initialize();

      customService.destroy();
      expect(eventService.isServiceInitialized()).assertEqual(true);
      expect(customService.isServiceInitialized()).assertEqual(false);

      eventService.destroy();
      expect(eventService.isServiceInitialized()).assertEqual(false);
      expect(customService.isServiceInitialized()).assertEqual(false);
    });

    /**
     * @tc.number SUB_MULTI_SERVICE_INTEGRATION_0400
     * @tc.name testMultiServiceIntegration0004
     * @tc.desc Verify multiple traces run in parallel with correct counts
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testMultiServiceIntegration0004', 0, () => {
      hilog.info(DOMAIN, TAG, 'testMultiServiceIntegration0004: begin');
      const traceService: TraceService = new TraceService();
      traceService.initialize();

      traceService.startTrace(TraceName.CUSTOM_CONFIG_GET_CHANNEL);
      traceService.startTrace(TraceName.SCENE_QUERY_DND);
      expect(traceService.getActiveTraceCount()).assertEqual(2);

      traceService.finishTrace(TraceName.CUSTOM_CONFIG_GET_CHANNEL);
      expect(traceService.getActiveTraceCount()).assertEqual(1);

      traceService.finishTrace(TraceName.SCENE_QUERY_DND);
      expect(traceService.getActiveTraceCount()).assertEqual(0);

      traceService.destroy();
    });
  });
}
