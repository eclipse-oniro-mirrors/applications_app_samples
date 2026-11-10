import { describe, it, expect } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { EventService, EventTypeName } from 'library';
import type { EventFilter, EventStatistics, EventHistoryRecord, EventListener } from 'library';

const DOMAIN: number = 0xF820;
const TAG: string = '[Sample_SystemConfig]';

/**
 * EventService 接口测试套件。
 */
export default function EventServiceTest(): void {
  describe('EventServiceTest', () => {

    /**
     * @tc.number SUB_EVENT_SERVICE_0100
     * @tc.name testEventService0001
     * @tc.desc 正向: 初始化返回 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testEventService0001', 0, () => {
      hilog.info(DOMAIN, TAG, 'testEventService0001: begin');
      const service: EventService = new EventService();
      expect(service.isServiceInitialized()).assertFalse();
      const result: boolean = service.initialize();
      expect(result).assertTrue();
      expect(service.isServiceInitialized()).assertTrue();
      service.destroy();
    });

    /**
     * @tc.number SUB_EVENT_SERVICE_0200
     * @tc.name testEventService0002
     * @tc.desc 正向: 上报事件后历史记录增加
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testEventService0002', 0, () => {
      hilog.info(DOMAIN, TAG, 'testEventService0002: begin');
      const service: EventService = new EventService();
      service.initialize();
      service.reportChannelFetched('test-channel', true);
      const history: EventHistoryRecord[] = service.getEventHistory();
      expect(history.length).assertEqual(1);
      expect(history[0].name).assertEqual(EventTypeName.CHANNEL_FETCHED as string);
      expect(history[0].data['channelId']).assertEqual('test-channel');
      service.destroy();
    });

    /**
     * @tc.number SUB_EVENT_SERVICE_0300
     * @tc.name testEventService0003
     * @tc.desc 正向: 统计信息返回正确
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testEventService0003', 0, () => {
      hilog.info(DOMAIN, TAG, 'testEventService0003: begin');
      const service: EventService = new EventService();
      service.initialize();
      service.reportChannelFetched('ch-1', true);
      service.reportChannelFetched('ch-2', false);
      const stats: EventStatistics = service.getStatistics();
      expect(stats.totalCount).assertEqual(2);
      expect(stats.countByType.size).assertLarger(0);
      expect(stats.earliestTime).assertLarger(0);
      service.destroy();
    });

    /**
     * @tc.number SUB_EVENT_SERVICE_0400
     * @tc.name testEventService0004
     * @tc.desc 正向: 清除历史后记录为空
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testEventService0004', 0, () => {
      hilog.info(DOMAIN, TAG, 'testEventService0004: begin');
      const service: EventService = new EventService();
      service.initialize();
      service.reportChannelFetched('ch-1', true);
      expect(service.getEventHistory().length).assertLarger(0);
      service.clearHistory();
      expect(service.getEventHistory().length).assertEqual(0);
      const stats: EventStatistics = service.getStatistics();
      expect(stats.totalCount).assertEqual(0);
      service.destroy();
    });

    /**
     * @tc.number SUB_EVENT_SERVICE_0500
     * @tc.name testEventService0005
     * @tc.desc 正向: 上报错误事件
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testEventService0005', 0, () => {
      hilog.info(DOMAIN, TAG, 'testEventService0005: begin');
      const service: EventService = new EventService();
      service.initialize();
      service.reportError('test', 'test error', 1001);
      const history: EventHistoryRecord[] = service.getEventHistory();
      expect(history.length).assertEqual(1);
      expect(history[0].name).assertEqual(EventTypeName.ERROR_OCCURRED as string);
      expect(history[0].data['errorCode']).assertEqual(1001);
      service.destroy();
    });

    /**
     * @tc.number SUB_EVENT_SERVICE_0600
     * @tc.name testEventService0006
     * @tc.desc 正向: 销毁后状态重置
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testEventService0006', 0, () => {
      hilog.info(DOMAIN, TAG, 'testEventService0006: begin');
      const service: EventService = new EventService();
      service.initialize();
      expect(service.isServiceInitialized()).assertTrue();
      service.reportChannelFetched('ch-1', true);
      service.destroy();
      expect(service.isServiceInitialized()).assertFalse();
      expect(service.getEventHistory().length).assertEqual(0);
    });
  });
}
