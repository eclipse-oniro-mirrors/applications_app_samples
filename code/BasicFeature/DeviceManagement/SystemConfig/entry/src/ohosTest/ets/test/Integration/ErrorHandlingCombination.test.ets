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

const DOMAIN: number = 0xF820;
const TAG: string = '[Sample_SystemConfig]';

/**
 * 错误处理组合测试套件。
 * 验证各服务在异常场景下的行为。
 */
export default function ErrorHandlingCombinationTest(): void {
  describe('ErrorHandlingCombinationTest', () => {

    /**
     * @tc.number SUB_ERROR_HANDLING_COMBINATION_0100
     * @tc.name testErrorHandlingCombination0001
     * @tc.desc 反向: 未初始化服务调用 getChannelId 不抛异常
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
     * @tc.desc 反向: 多次销毁不抛异常且每次均重建渠道模型为初始状态
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
      // 二次销毁为幂等操作；若抛出异常则由测试框架直接判定本用例失败
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
     * @tc.desc 反向: 未初始化 EventService 上报事件不抛异常且事件正确写入历史与统计
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testErrorHandlingCombination0003', 0, () => {
      hilog.info(DOMAIN, TAG, 'testErrorHandlingCombination0003: begin');
      const service: EventService = new EventService();
      expect(service.isServiceInitialized()).assertFalse();
      // 未初始化时上报事件不抛异常；emitEvent 无初始化守卫，仍会写入历史记录
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
     * @tc.desc 反向: 禁用追踪后操作不报错
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
     * @tc.desc 反向: 销毁后重置可重新初始化
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
     * @tc.desc 反向: 获取渠道号后检查状态一致性
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
