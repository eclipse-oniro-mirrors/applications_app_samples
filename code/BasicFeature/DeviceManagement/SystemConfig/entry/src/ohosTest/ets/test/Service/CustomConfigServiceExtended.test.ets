import { describe, it, expect } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { CustomConfigService, ChannelConfigModel, ChannelConfigStatus, SystemConfigConstants } from 'library';

const DOMAIN: number = 0xF820;
const TAG: string = '[Sample_SystemConfig]';

/**
 * 按设备实际结果检查非空成功、空成功或异常失败，不预设渠道号必须为空。
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
 * CustomConfigService 扩展测试套件。
 * 补充覆盖多次顺序调用 / 状态流转 / 异常恢复 / 边界值 / 长时间运行等场景。
 */
export default function CustomConfigServiceExtendedTest(): void {
  describe('CustomConfigServiceExtendedTest', () => {

    // ========================================
    // 多次顺序调用测试
    // ========================================

    /**
     * @tc.number SUB_CUSTOM_CONFIG_SERVICE_EXTENDED_0100
     * @tc.name testCustomConfigServiceExtended0001
     * @tc.desc 正向: 多次顺序调用 getChannelId 结果一致
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
     * @tc.desc 正向: 多次顺序调用后模型状态正确
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
    // 状态流转测试
    // ========================================

    /**
     * @tc.number SUB_CUSTOM_CONFIG_SERVICE_EXTENDED_0300
     * @tc.name testCustomConfigServiceExtended0003
     * @tc.desc 正向: 获取渠道号后状态与设备结果一致
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
     * @tc.desc 边界: 重置后状态回到 UNINITIALIZED
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
    // 异常恢复测试
    // ========================================

    /**
     * @tc.number SUB_CUSTOM_CONFIG_SERVICE_EXTENDED_0500
     * @tc.name testCustomConfigServiceExtended0005
     * @tc.desc 边界: 未初始化直接获取渠道号
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
     * @tc.desc 边界: 销毁后重新初始化
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
     * @tc.desc 边界: 多次销毁不报错
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
    // 边界值测试
    // ========================================

    /**
     * @tc.number SUB_CUSTOM_CONFIG_SERVICE_EXTENDED_0800
     * @tc.name testCustomConfigServiceExtended0008
     * @tc.desc 边界: 获取渠道号后立即重置
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
     * @tc.desc 边界: 重置后获取模型
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
     * @tc.desc 边界: 模型引用一致性
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
    // 长时间运行测试
    // ========================================

    /**
     * @tc.number SUB_CUSTOM_CONFIG_SERVICE_EXTENDED_1100
     * @tc.name testCustomConfigServiceExtended0011
     * @tc.desc 边界: 大量调用后内存稳定
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
     * @tc.desc 边界: 反复初始化/销毁
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
    // 综合场景测试
    // ========================================

    /**
     * @tc.number SUB_CUSTOM_CONFIG_SERVICE_EXTENDED_1300
     * @tc.name testCustomConfigServiceExtended0013
     * @tc.desc 综合: 初始化 → 获取 → 重置 → 重新获取
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
     * @tc.desc 综合: 获取 → 销毁 → 重新初始化
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
     * @tc.desc 综合: 多次获取后重置
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
