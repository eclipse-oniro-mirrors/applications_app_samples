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
  ChannelConfigStatus,
  EventTypeName
} from 'library';

const DOMAIN: number = 0xF820;
const TAG: string = '[Sample_SystemConfig]';

/**
 * 集成测试扩展套件。
 * 补充覆盖服务间协同 / 事件与追踪联动 / 错误传播 /
 * 多实例隔离 / 生命周期交叉等集成场景。
 */
export default function IntegrationExtendedTest(): void {
  describe('IntegrationExtendedTest', () => {

    // ========================================
    // 事件上报与历史联动测试
    // ========================================

    /**
     * @tc.number SUB_MULTI_SERVICE_INTEGRATION_EXTENDED_0100
     * @tc.name testMultiServiceIntegrationExtended0001
     * @tc.desc 正向: EventService 上报事件后历史计数增加
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testMultiServiceIntegrationExtended0001', 0, () => {
      hilog.info(DOMAIN, TAG, 'testMultiServiceIntegrationExtended0001: begin');
      const eventService: EventService = new EventService();
      eventService.initialize();
      
      expect(eventService.getEventHistory().length).assertEqual(0);
      eventService.reportChannelFetched('ch-1', true);
      expect(eventService.getEventHistory().length).assertEqual(1);
      eventService.reportChannelFetched('ch-2', true);
      expect(eventService.getEventHistory().length).assertEqual(2);
      
      eventService.destroy();
    });

    // ========================================
    // 追踪与事件联动测试
    // ========================================

    /**
     * @tc.number SUB_MULTI_SERVICE_INTEGRATION_EXTENDED_0200
     * @tc.name testMultiServiceIntegrationExtended0002
     * @tc.desc 正向: 追踪完成后上报事件，两者互不干扰
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testMultiServiceIntegrationExtended0002', 0, () => {
      hilog.info(DOMAIN, TAG, 'testMultiServiceIntegrationExtended0002: begin');
      const traceService: TraceService = new TraceService();
      const eventService: EventService = new EventService();
      traceService.initialize();
      eventService.initialize();
      
      traceService.startTrace(TraceName.CUSTOM_CONFIG_GET_CHANNEL);
      expect(traceService.getActiveTraceCount()).assertEqual(1);
      expect(eventService.getEventHistory().length).assertEqual(0);
      
      traceService.finishTrace(TraceName.CUSTOM_CONFIG_GET_CHANNEL);
      eventService.reportChannelFetched('ch-1', true);
      
      expect(traceService.getActiveTraceCount()).assertEqual(0);
      expect(eventService.getEventHistory().length).assertEqual(1);
      
      traceService.destroy();
      eventService.destroy();
    });

    // ========================================
    // 多实例隔离测试
    // ========================================

    /**
     * @tc.number SUB_MULTI_SERVICE_INTEGRATION_EXTENDED_0300
     * @tc.name testMultiServiceIntegrationExtended0003
     * @tc.desc 正向: 多个 EventService 实例历史互不影响
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testMultiServiceIntegrationExtended0003', 0, () => {
      hilog.info(DOMAIN, TAG, 'testMultiServiceIntegrationExtended0003: begin');
      const eventService1: EventService = new EventService();
      const eventService2: EventService = new EventService();
      eventService1.initialize();
      eventService2.initialize();
      
      eventService1.reportChannelFetched('ch-1', true);
      expect(eventService1.getEventHistory().length).assertEqual(1);
      expect(eventService2.getEventHistory().length).assertEqual(0);
      
      eventService2.reportChannelFetched('ch-2', true);
      expect(eventService1.getEventHistory().length).assertEqual(1);
      expect(eventService2.getEventHistory().length).assertEqual(1);
      
      eventService1.destroy();
      eventService2.destroy();
    });

    // ========================================
    // 生命周期交叉测试
    // ========================================

    /**
     * @tc.number SUB_MULTI_SERVICE_INTEGRATION_EXTENDED_0400
     * @tc.name testMultiServiceIntegrationExtended0004
     * @tc.desc 边界: 先追踪后初始化服务，追踪仍生效
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testMultiServiceIntegrationExtended0004', 0, () => {
      hilog.info(DOMAIN, TAG, 'testMultiServiceIntegrationExtended0004: begin');
      const traceService: TraceService = new TraceService();
      traceService.initialize();
      
      traceService.startTrace(TraceName.SCENE_QUERY_DND);
      expect(traceService.getActiveTraceCount()).assertEqual(1);
      
      const eventService: EventService = new EventService();
      eventService.initialize();
      eventService.reportChannelFetched('ch-1', true);
      
      traceService.finishTrace(TraceName.SCENE_QUERY_DND);
      expect(traceService.getActiveTraceCount()).assertEqual(0);
      expect(eventService.getEventHistory().length).assertEqual(1);
      
      traceService.destroy();
      eventService.destroy();
    });

    // ========================================
    // CustomConfigService 状态与 EventService 联动
    // ========================================

    /**
     * @tc.number SUB_MULTI_SERVICE_INTEGRATION_EXTENDED_0500
     * @tc.name testMultiServiceIntegrationExtended0005
     * @tc.desc 正向: CustomConfigService 状态变更后上报事件
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testMultiServiceIntegrationExtended0005', 0, () => {
      hilog.info(DOMAIN, TAG, 'testMultiServiceIntegrationExtended0005: begin');
      const customService: CustomConfigService = new CustomConfigService();
      const eventService: EventService = new EventService();
      customService.initialize();
      eventService.initialize();
      
      expect(customService.getCurrentStatus()).assertEqual(ChannelConfigStatus.UNINITIALIZED);
      const channelId: string = customService.getChannelId();
      eventService.reportChannelFetched(channelId, channelId.length > 0);
      
      expect(customService.getCurrentStatus()).assertEqual(ChannelConfigStatus.SUCCESS);
      expect(eventService.getEventHistory().length).assertEqual(1);
      
      customService.destroy();
      eventService.destroy();
    });

    // ========================================
    // TraceService 多次 start/finish 循环
    // ========================================

    /**
     * @tc.number SUB_MULTI_SERVICE_INTEGRATION_EXTENDED_0600
     * @tc.name testMultiServiceIntegrationExtended0006
     * @tc.desc 正向: 多次 start/finish 循环，计数始终正确
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testMultiServiceIntegrationExtended0006', 0, () => {
      hilog.info(DOMAIN, TAG, 'testMultiServiceIntegrationExtended0006: begin');
      const traceService: TraceService = new TraceService();
      traceService.initialize();
      
      for (let i = 0; i < 5; i++) {
        traceService.startTrace(TraceName.CUSTOM_CONFIG_GET_CHANNEL);
        expect(traceService.getActiveTraceCount()).assertEqual(1);
        traceService.finishTrace(TraceName.CUSTOM_CONFIG_GET_CHANNEL);
        expect(traceService.getActiveTraceCount()).assertEqual(0);
      }
      
      traceService.startTrace(TraceName.CUSTOM_CONFIG_GET_CHANNEL, 'loop');
      expect(traceService.getActiveTraceCount()).assertEqual(1);
      traceService.reset();
      expect(traceService.getActiveTraceCount()).assertEqual(0);
      expect(traceService.isTraceEnabled()).assertTrue();
      
      traceService.destroy();
    });

    // ========================================
    // EventService 清空历史后重新计数
    // ========================================

    /**
     * @tc.number SUB_MULTI_SERVICE_INTEGRATION_EXTENDED_0700
     * @tc.name testMultiServiceIntegrationExtended0007
     * @tc.desc 正向: 清空历史后重新上报，计数从 0 开始
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testMultiServiceIntegrationExtended0007', 0, () => {
      hilog.info(DOMAIN, TAG, 'testMultiServiceIntegrationExtended0007: begin');
      const eventService: EventService = new EventService();
      eventService.initialize();
      
      eventService.reportChannelFetched('ch-1', true);
      eventService.reportChannelFetched('ch-2', true);
      expect(eventService.getEventHistory().length).assertEqual(2);
      
      eventService.clearHistory();
      expect(eventService.getEventHistory().length).assertEqual(0);
      
      eventService.reportChannelFetched('ch-3', true);
      expect(eventService.getEventHistory().length).assertEqual(1);
      
      eventService.destroy();
    });

    // ========================================
    // 服务销毁后不可再操作验证
    // ========================================

    /**
     * @tc.number SUB_MULTI_SERVICE_INTEGRATION_EXTENDED_0800
     * @tc.name testMultiServiceIntegrationExtended0008
     * @tc.desc 边界: 销毁后调用查询方法不崩溃
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testMultiServiceIntegrationExtended0008', 0, () => {
      hilog.info(DOMAIN, TAG, 'testMultiServiceIntegrationExtended0008: begin');
      const eventService: EventService = new EventService();
      eventService.initialize();
      eventService.reportChannelFetched('ch-1', true);
      expect(eventService.getEventHistory().length).assertEqual(1);
      
      eventService.destroy();
      expect(eventService.isServiceInitialized()).assertFalse();
      expect(eventService.getEventHistory().length).assertEqual(0);
    });

    // ========================================
    // 并行追踪不同 TraceName
    // ========================================

    /**
     * @tc.number SUB_MULTI_SERVICE_INTEGRATION_EXTENDED_0900
     * @tc.name testMultiServiceIntegrationExtended0009
     * @tc.desc 正向: 并行追踪多个不同 TraceName，计数独立累加
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testMultiServiceIntegrationExtended0009', 0, () => {
      hilog.info(DOMAIN, TAG, 'testMultiServiceIntegrationExtended0009: begin');
      const traceService: TraceService = new TraceService();
      traceService.initialize();
      
      traceService.startTrace(TraceName.CUSTOM_CONFIG_GET_CHANNEL);
      traceService.startTrace(TraceName.SCENE_QUERY_DND);
      traceService.startTrace(TraceName.SETTINGS_OPEN_PIN);
      expect(traceService.getActiveTraceCount()).assertEqual(3);
      
      traceService.finishTrace(TraceName.SCENE_QUERY_DND);
      expect(traceService.getActiveTraceCount()).assertEqual(2);
      
      traceService.finishTrace(TraceName.CUSTOM_CONFIG_GET_CHANNEL);
      traceService.finishTrace(TraceName.SETTINGS_OPEN_PIN);
      expect(traceService.getActiveTraceCount()).assertEqual(0);
      
      traceService.destroy();
    });

    // ========================================
    // 综合场景: 全服务协同
    // ========================================

    /**
     * @tc.number SUB_MULTI_SERVICE_INTEGRATION_EXTENDED_1000
     * @tc.name testMultiServiceIntegrationExtended0010
     * @tc.desc 综合: 三服务协同操作，各自状态正确
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testMultiServiceIntegrationExtended0010', 0, () => {
      hilog.info(DOMAIN, TAG, 'testMultiServiceIntegrationExtended0010: begin');
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
      
      expect(customService.getCurrentStatus()).assertEqual(ChannelConfigStatus.SUCCESS);
      expect(eventService.getEventHistory().length).assertEqual(1);
      expect(traceService.getActiveTraceCount()).assertEqual(0);
      
      customService.destroy();
      eventService.destroy();
      traceService.destroy();
    });
  });
}
