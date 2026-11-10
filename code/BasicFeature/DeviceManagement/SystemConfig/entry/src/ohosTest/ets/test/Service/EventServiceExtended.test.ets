import { describe, it, expect } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { EventService, EventTypeName } from 'library';
import type { EventFilter, EventStatistics, EventHistoryRecord, EventListener } from 'library';

const DOMAIN: number = 0xF820;
const TAG: string = '[Sample_SystemConfig]';

/**
 * EventListener 实现类，用于测试。
 * ArkTS 不允许使用未类型化的对象字面量。
 */
class TestEventListener implements EventListener {
  callbackCount: number = 0;
  lastEventName: string = '';
  shouldThrow: boolean = false;

  onEvent(eventName: string, _eventData: Record<string, Object>): void {
    if (this.shouldThrow) {
      throw new Error('listener error');
    }
    this.callbackCount++;
    this.lastEventName = eventName;
  }
}

/**
 * EventService 扩展测试套件。
 * 补充覆盖 reportDndStateChanged / reportSettingsPageOpened / reportDoubleClickQueried /
 * reportServiceInitialized / addListener / removeListener / getEventHistory(filter) /
 * 历史溢出 / 未初始化上报 等场景。
 */
export default function EventServiceExtendedTest(): void {
  describe('EventServiceExtendedTest', () => {

    // ========================================
    // reportDndStateChanged 测试
    // ========================================

    /**
     * @tc.number SUB_EVENT_SERVICE_EXTENDED_0100
     * @tc.name testEventServiceExtended0001
     * @tc.desc 正向: 上报免打扰状态变更(dnd=true, notify=true)后历史记录正确
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testEventServiceExtended0001', 0, () => {
      hilog.info(DOMAIN, TAG, 'testEventServiceExtended0001: begin');
      const service: EventService = new EventService();
      service.initialize();
      service.reportDndStateChanged(true, true);
      const history: EventHistoryRecord[] = service.getEventHistory();
      expect(history.length).assertEqual(1);
      expect(history[0].name).assertEqual(EventTypeName.DND_STATE_CHANGED as string);
      expect(history[0].data['dndEnabled']).assertEqual(true);
      expect(history[0].data['notifyAllowed']).assertEqual(true);
      expect(history[0].time).assertLarger(0);
      service.destroy();
    });

    /**
     * @tc.number SUB_EVENT_SERVICE_EXTENDED_0200
     * @tc.name testEventServiceExtended0002
     * @tc.desc 正向: 上报免打扰状态变更(dnd=false, notify=false)数据字段正确
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testEventServiceExtended0002', 0, () => {
      hilog.info(DOMAIN, TAG, 'testEventServiceExtended0002: begin');
      const service: EventService = new EventService();
      service.initialize();
      service.reportDndStateChanged(false, false);
      const history: EventHistoryRecord[] = service.getEventHistory();
      expect(history.length).assertEqual(1);
      expect(history[0].data['dndEnabled']).assertEqual(false);
      expect(history[0].data['notifyAllowed']).assertEqual(false);
      const stats: EventStatistics = service.getStatistics();
      expect(stats.totalCount).assertEqual(1);
      service.destroy();
    });

    // ========================================
    // reportSettingsPageOpened 测试
    // ========================================

    /**
     * @tc.number SUB_EVENT_SERVICE_EXTENDED_0300
     * @tc.name testEventServiceExtended0003
     * @tc.desc 正向: 上报打开 PIN 设置页面成功事件
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testEventServiceExtended0003', 0, () => {
      hilog.info(DOMAIN, TAG, 'testEventServiceExtended0003: begin');
      const service: EventService = new EventService();
      service.initialize();
      service.reportSettingsPageOpened('pin', true);
      const history: EventHistoryRecord[] = service.getEventHistory();
      expect(history.length).assertEqual(1);
      expect(history[0].name).assertEqual(EventTypeName.SETTINGS_PAGE_OPENED as string);
      expect(history[0].data['pageType']).assertEqual('pin');
      expect(history[0].data['success']).assertEqual(true);
      service.destroy();
    });

    /**
     * @tc.number SUB_EVENT_SERVICE_EXTENDED_0400
     * @tc.name testEventServiceExtended0004
     * @tc.desc 正向: 上报打开 NFC 设置页面失败事件
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testEventServiceExtended0004', 0, () => {
      hilog.info(DOMAIN, TAG, 'testEventServiceExtended0004: begin');
      const service: EventService = new EventService();
      service.initialize();
      service.reportSettingsPageOpened('nfc', false);
      const history: EventHistoryRecord[] = service.getEventHistory();
      expect(history.length).assertEqual(1);
      expect(history[0].data['pageType']).assertEqual('nfc');
      expect(history[0].data['success']).assertEqual(false);
      expect(history[0].time).assertLarger(0);
      service.destroy();
    });

    // ========================================
    // reportDoubleClickQueried 测试
    // ========================================

    /**
     * @tc.number SUB_EVENT_SERVICE_EXTENDED_0500
     * @tc.name testEventServiceExtended0005
     * @tc.desc 正向: 上报双击查询事件后记录正确
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testEventServiceExtended0005', 0, () => {
      hilog.info(DOMAIN, TAG, 'testEventServiceExtended0005: begin');
      const service: EventService = new EventService();
      service.initialize();
      service.reportDoubleClickQueried('isSelf');
      const history: EventHistoryRecord[] = service.getEventHistory();
      expect(history.length).assertEqual(1);
      expect(history[0].name).assertEqual(EventTypeName.DOUBLE_CLICK_QUERIED as string);
      expect(history[0].data['result']).assertEqual('isSelf');
      expect(history[0].time).assertLarger(0);
      service.destroy();
    });

    // ========================================
    // reportServiceInitialized 测试
    // ========================================

    /**
     * @tc.number SUB_EVENT_SERVICE_EXTENDED_0600
     * @tc.name testEventServiceExtended0006
     * @tc.desc 正向: 上报服务初始化事件后记录正确
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testEventServiceExtended0006', 0, () => {
      hilog.info(DOMAIN, TAG, 'testEventServiceExtended0006: begin');
      const service: EventService = new EventService();
      service.initialize();
      service.reportServiceInitialized('CustomConfigService');
      const history: EventHistoryRecord[] = service.getEventHistory();
      expect(history.length).assertEqual(1);
      expect(history[0].name).assertEqual(EventTypeName.SERVICE_INITIALIZED as string);
      expect(history[0].data['serviceName']).assertEqual('CustomConfigService');
      expect(history[0].time).assertLarger(0);
      service.destroy();
    });

    // ========================================
    // addListener / removeListener 测试
    // ========================================

    /**
     * @tc.number SUB_EVENT_SERVICE_EXTENDED_0700
     * @tc.name testEventServiceExtended0007
     * @tc.desc 正向: 添加监听器后上报事件触发回调
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testEventServiceExtended0007', 0, () => {
      hilog.info(DOMAIN, TAG, 'testEventServiceExtended0007: begin');
      const service: EventService = new EventService();
      service.initialize();
      const listener: TestEventListener = new TestEventListener();
      service.addListener(listener);
      service.reportChannelFetched('ch-1', true);
      expect(listener.callbackCount).assertEqual(1);
      expect(listener.lastEventName).assertEqual(EventTypeName.CHANNEL_FETCHED as string);
      const history: EventHistoryRecord[] = service.getEventHistory();
      expect(history.length).assertEqual(1);
      expect(history[0].data['channelId']).assertEqual('ch-1');
      service.destroy();
    });

    /**
     * @tc.number SUB_EVENT_SERVICE_EXTENDED_0800
     * @tc.name testEventServiceExtended0008
     * @tc.desc 正向: 移除监听器后上报事件不再触发回调
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testEventServiceExtended0008', 0, () => {
      hilog.info(DOMAIN, TAG, 'testEventServiceExtended0008: begin');
      const service: EventService = new EventService();
      service.initialize();
      const listener: TestEventListener = new TestEventListener();
      service.addListener(listener);
      service.reportChannelFetched('ch-1', true);
      expect(listener.callbackCount).assertEqual(1);
      service.removeListener(listener);
      service.reportChannelFetched('ch-2', true);
      expect(listener.callbackCount).assertEqual(1);
      const history: EventHistoryRecord[] = service.getEventHistory();
      expect(history.length).assertEqual(2);
      service.destroy();
    });

    /**
     * @tc.number SUB_EVENT_SERVICE_EXTENDED_0900
     * @tc.name testEventServiceExtended0009
     * @tc.desc 正向: 重复添加同一监听器，每次上报触发多次回调
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testEventServiceExtended0009', 0, () => {
      hilog.info(DOMAIN, TAG, 'testEventServiceExtended0009: begin');
      const service: EventService = new EventService();
      service.initialize();
      const listener: TestEventListener = new TestEventListener();
      service.addListener(listener);
      service.addListener(listener);
      service.reportChannelFetched('ch-1', true);
      expect(listener.callbackCount).assertEqual(2);
      service.removeListener(listener);
      service.reportChannelFetched('ch-2', true);
      expect(listener.callbackCount).assertEqual(3);
      const history: EventHistoryRecord[] = service.getEventHistory();
      expect(history.length).assertEqual(2);
      expect(history[1].data['channelId']).assertEqual('ch-2');
      service.destroy();
    });

    /**
     * @tc.number SUB_EVENT_SERVICE_EXTENDED_1000
     * @tc.name testEventServiceExtended0010
     * @tc.desc 边界: 移除未添加的监听器不报错
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testEventServiceExtended0010', 0, () => {
      hilog.info(DOMAIN, TAG, 'testEventServiceExtended0010: begin');
      const service: EventService = new EventService();
      service.initialize();
      const listener: TestEventListener = new TestEventListener();
      service.removeListener(listener);
      service.reportChannelFetched('ch-1', true);
      const history: EventHistoryRecord[] = service.getEventHistory();
      expect(history.length).assertEqual(1);
      expect(service.isServiceInitialized()).assertTrue();
      expect(listener.callbackCount).assertEqual(0);
      expect(history[0].name).assertEqual(EventTypeName.CHANNEL_FETCHED as string);
      service.destroy();
    });

    // ========================================
    // getEventHistory(filter) 过滤测试
    // ========================================

    /**
     * @tc.number SUB_EVENT_SERVICE_EXTENDED_1100
     * @tc.name testEventServiceExtended0011
     * @tc.desc 正向: 按事件类型过滤历史记录
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testEventServiceExtended0011', 0, () => {
      hilog.info(DOMAIN, TAG, 'testEventServiceExtended0011: begin');
      const service: EventService = new EventService();
      service.initialize();
      service.reportChannelFetched('ch-1', true);
      service.reportDndStateChanged(true, false);
      service.reportError('src', 'err', 100);
      const filter: EventFilter = {
        eventTypes: [EventTypeName.CHANNEL_FETCHED, EventTypeName.ERROR_OCCURRED]
      };
      const filtered: EventHistoryRecord[] = service.getEventHistory(filter);
      expect(filtered.length).assertEqual(2);
      expect(filtered[0].name).assertEqual(EventTypeName.CHANNEL_FETCHED as string);
      expect(filtered[1].name).assertEqual(EventTypeName.ERROR_OCCURRED as string);
      service.destroy();
    });

    /**
     * @tc.number SUB_EVENT_SERVICE_EXTENDED_1200
     * @tc.name testEventServiceExtended0012
     * @tc.desc 正向: 按时间范围过滤历史记录
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testEventServiceExtended0012', 0, () => {
      hilog.info(DOMAIN, TAG, 'testEventServiceExtended0012: begin');
      const service: EventService = new EventService();
      service.initialize();
      const beforeTime: number = Date.now();
      service.reportChannelFetched('ch-1', true);
      service.reportChannelFetched('ch-2', true);
      service.reportChannelFetched('ch-3', true);
      const afterTime: number = Date.now();
      const filter: EventFilter = { startTime: beforeTime, endTime: afterTime };
      const filtered: EventHistoryRecord[] = service.getEventHistory(filter);
      expect(filtered.length).assertEqual(3);
      expect(filtered[0].time).assertLargerOrEqual(beforeTime);
      expect(filtered[2].time).assertLargerOrEqual(beforeTime);
      const filterFuture: EventFilter = { startTime: afterTime + 10000 };
      const emptyResult: EventHistoryRecord[] = service.getEventHistory(filterFuture);
      expect(emptyResult.length).assertEqual(0);
      service.destroy();
    });

    /**
     * @tc.number SUB_EVENT_SERVICE_EXTENDED_1300
     * @tc.name testEventServiceExtended0013
     * @tc.desc 正向: 按最大数量过滤返回最新 N 条
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testEventServiceExtended0013', 0, () => {
      hilog.info(DOMAIN, TAG, 'testEventServiceExtended0013: begin');
      const service: EventService = new EventService();
      service.initialize();
      service.reportChannelFetched('ch-1', true);
      service.reportDndStateChanged(true, false);
      service.reportError('src', 'err', 100);
      service.reportSettingsPageOpened('pin', true);
      service.reportDoubleClickQueried('result');
      const filter: EventFilter = { maxCount: 2 };
      const filtered: EventHistoryRecord[] = service.getEventHistory(filter);
      expect(filtered.length).assertEqual(2);
      expect(filtered[0].name).assertEqual(EventTypeName.SETTINGS_PAGE_OPENED as string);
      expect(filtered[1].name).assertEqual(EventTypeName.DOUBLE_CLICK_QUERIED as string);
      const allHistory: EventHistoryRecord[] = service.getEventHistory();
      expect(allHistory.length).assertEqual(5);
      service.destroy();
    });

    /**
     * @tc.number SUB_EVENT_SERVICE_EXTENDED_1400
     * @tc.name testEventServiceExtended0014
     * @tc.desc 边界: 空过滤器返回全部历史
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testEventServiceExtended0014', 0, () => {
      hilog.info(DOMAIN, TAG, 'testEventServiceExtended0014: begin');
      const service: EventService = new EventService();
      service.initialize();
      service.reportChannelFetched('ch-1', true);
      service.reportDndStateChanged(false, true);
      const allHistory: EventHistoryRecord[] = service.getEventHistory();
      const filterAll: EventFilter = {};
      const filtered: EventHistoryRecord[] = service.getEventHistory(filterAll);
      expect(filtered.length).assertEqual(allHistory.length);
      expect(filtered.length).assertEqual(2);
      expect(filtered[0].time).assertEqual(allHistory[0].time);
      service.destroy();
    });

    // ========================================
    // 历史溢出测试
    // ========================================

    /**
     * @tc.number SUB_EVENT_SERVICE_EXTENDED_1500
     * @tc.name testEventServiceExtended0015
     * @tc.desc 边界: 上报事件超过 MAX_LOG_ENTRIES(200) 后历史被裁剪
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testEventServiceExtended0015', 0, () => {
      hilog.info(DOMAIN, TAG, 'testEventServiceExtended0015: begin');
      const service: EventService = new EventService();
      service.initialize();
      for (let i: number = 0; i < 210; i++) {
        service.reportChannelFetched(`ch-${i}`, true);
      }
      const history: EventHistoryRecord[] = service.getEventHistory();
      expect(history.length).assertEqual(200);
      expect(history[0].data['channelId']).assertEqual('ch-10');
      expect(history[199].data['channelId']).assertEqual('ch-209');
      const stats: EventStatistics = service.getStatistics();
      expect(stats.totalCount).assertEqual(200);
      service.destroy();
    });

    // ========================================
    // 未初始化上报测试
    // ========================================

    /**
     * @tc.number SUB_EVENT_SERVICE_EXTENDED_1600
     * @tc.name testEventServiceExtended0016
     * @tc.desc 边界: 未初始化直接上报事件仍记录到历史
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testEventServiceExtended0016', 0, () => {
      hilog.info(DOMAIN, TAG, 'testEventServiceExtended0016: begin');
      const service: EventService = new EventService();
      expect(service.isServiceInitialized()).assertFalse();
      service.reportChannelFetched('ch-before-init', true);
      const history: EventHistoryRecord[] = service.getEventHistory();
      expect(history.length).assertEqual(1);
      expect(history[0].data['channelId']).assertEqual('ch-before-init');
      expect(history[0].time).assertLarger(0);
      service.destroy();
    });

    // ========================================
    // 多类型事件统计测试
    // ========================================

    /**
     * @tc.number SUB_EVENT_SERVICE_EXTENDED_1700
     * @tc.name testEventServiceExtended0017
     * @tc.desc 正向: 多种类型事件上报后统计按类型分组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testEventServiceExtended0017', 0, () => {
      hilog.info(DOMAIN, TAG, 'testEventServiceExtended0017: begin');
      const service: EventService = new EventService();
      service.initialize();
      service.reportChannelFetched('ch-1', true);
      service.reportChannelFetched('ch-2', false);
      service.reportDndStateChanged(true, false);
      service.reportError('src', 'err', 100);
      const stats: EventStatistics = service.getStatistics();
      expect(stats.totalCount).assertEqual(4);
      expect(stats.countByType.size).assertEqual(3);
      expect(stats.countByType.get(EventTypeName.CHANNEL_FETCHED as string)).assertEqual(2);
      expect(stats.countByType.get(EventTypeName.DND_STATE_CHANGED as string)).assertEqual(1);
      expect(stats.countByType.get(EventTypeName.ERROR_OCCURRED as string)).assertEqual(1);
      expect(stats.latestTime).assertLargerOrEqual(stats.earliestTime);
      service.destroy();
    });

    // ========================================
    // 监听器异常容错测试
    // ========================================

    /**
     * @tc.number SUB_EVENT_SERVICE_EXTENDED_1800
     * @tc.name testEventServiceExtended0018
     * @tc.desc 边界: 监听器回调抛异常不影响其他监听器和历史记录
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testEventServiceExtended0018', 0, () => {
      hilog.info(DOMAIN, TAG, 'testEventServiceExtended0018: begin');
      const service: EventService = new EventService();
      service.initialize();
      const badListener: TestEventListener = new TestEventListener();
      badListener.shouldThrow = true;
      const goodListener: TestEventListener = new TestEventListener();
      service.addListener(badListener);
      service.addListener(goodListener);
      service.reportChannelFetched('ch-1', true);
      expect(goodListener.callbackCount).assertEqual(1);
      const history: EventHistoryRecord[] = service.getEventHistory();
      expect(history.length).assertEqual(1);
      expect(history[0].name).assertEqual(EventTypeName.CHANNEL_FETCHED as string);
      service.destroy();
    });

    // ========================================
    // destroy 清除监听器测试
    // ========================================

    /**
     * @tc.number SUB_EVENT_SERVICE_EXTENDED_1900
     * @tc.name testEventServiceExtended0019
     * @tc.desc 正向: destroy 后监听器被清除，重新初始化后无旧监听器
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testEventServiceExtended0019', 0, () => {
      hilog.info(DOMAIN, TAG, 'testEventServiceExtended0019: begin');
      const service: EventService = new EventService();
      service.initialize();
      const listener: TestEventListener = new TestEventListener();
      service.addListener(listener);
      service.reportChannelFetched('ch-1', true);
      expect(listener.callbackCount).assertEqual(1);
      service.destroy();
      service.initialize();
      service.reportChannelFetched('ch-2', true);
      expect(listener.callbackCount).assertEqual(1);
      const history: EventHistoryRecord[] = service.getEventHistory();
      expect(history.length).assertEqual(1);
      service.destroy();
    });

    // ========================================
    // 空统计信息测试
    // ========================================

    /**
     * @tc.number SUB_EVENT_SERVICE_EXTENDED_2000
     * @tc.name testEventServiceExtended0020
     * @tc.desc 边界: 无事件时统计信息返回零值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testEventServiceExtended0020', 0, () => {
      hilog.info(DOMAIN, TAG, 'testEventServiceExtended0020: begin');
      const service: EventService = new EventService();
      service.initialize();
      const stats: EventStatistics = service.getStatistics();
      expect(stats.totalCount).assertEqual(0);
      expect(stats.countByType.size).assertEqual(0);
      expect(stats.earliestTime).assertEqual(0);
      expect(stats.latestTime).assertEqual(0);
      service.destroy();
    });
  });
}
