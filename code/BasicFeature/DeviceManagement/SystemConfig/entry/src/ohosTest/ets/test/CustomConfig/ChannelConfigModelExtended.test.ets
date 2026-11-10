import { describe, it, expect } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { ChannelConfigModel, ChannelConfigStatus } from 'library';
import type { ChannelConfigJson } from 'library';

const DOMAIN: number = 0xF820;
const TAG: string = '[Sample_SystemConfig]';

/**
 * ChannelConfigModel 扩展测试套件。
 * 补充覆盖状态机完整流转 / toJSON 往返序列化 / 多次 markSuccess 累计 /
 * markLoading 边界 / getTimeSinceLastFetch 等场景。
 */
export default function ChannelConfigModelExtendedTest(): void {
  describe('ChannelConfigModelExtendedTest', () => {

    // ========================================
    // 状态机完整流转测试
    // ========================================

    /**
     * @tc.number SUB_CHANNEL_CONFIG_MODEL_EXTENDED_0100
     * @tc.name testChannelConfigModelExtended0001
     * @tc.desc 正向: UNINITIALIZED → LOADING → SUCCESS 完整流转
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testChannelConfigModelExtended0001', 0, () => {
      hilog.info(DOMAIN, TAG, 'testChannelConfigModelExtended0001: begin');
      const model: ChannelConfigModel = new ChannelConfigModel();
      expect(model.status).assertEqual(ChannelConfigStatus.UNINITIALIZED);
      expect(model.isLoading()).assertFalse();
      expect(model.isSuccess()).assertFalse();
      expect(model.isFailed()).assertFalse();
      model.markLoading();
      expect(model.status).assertEqual(ChannelConfigStatus.LOADING);
      expect(model.isLoading()).assertTrue();
      expect(model.errorMessage).assertEqual('');
      expect(model.errorCode).assertEqual(0);
      model.markSuccess('channel-001');
      expect(model.status).assertEqual(ChannelConfigStatus.SUCCESS);
      expect(model.isSuccess()).assertTrue();
      expect(model.channelId).assertEqual('channel-001');
      expect(model.fetchCount).assertEqual(1);
    });

    /**
     * @tc.number SUB_CHANNEL_CONFIG_MODEL_EXTENDED_0200
     * @tc.name testChannelConfigModelExtended0002
     * @tc.desc 正向: UNINITIALIZED → LOADING → FAILED → reset 异常流转
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testChannelConfigModelExtended0002', 0, () => {
      hilog.info(DOMAIN, TAG, 'testChannelConfigModelExtended0002: begin');
      const model: ChannelConfigModel = new ChannelConfigModel();
      model.markLoading();
      expect(model.isLoading()).assertTrue();
      model.markFailed('network error', 5001);
      expect(model.status).assertEqual(ChannelConfigStatus.FAILED);
      expect(model.isFailed()).assertTrue();
      expect(model.isSuccess()).assertFalse();
      expect(model.errorMessage).assertEqual('network error');
      expect(model.errorCode).assertEqual(5001);
      expect(model.fetchCount).assertEqual(1);
      model.reset();
      expect(model.status).assertEqual(ChannelConfigStatus.UNINITIALIZED);
      expect(model.channelId).assertEqual('');
      expect(model.fetchCount).assertEqual(0);
    });

    // ========================================
    // toJSON 往返序列化测试
    // ========================================

    /**
     * @tc.number SUB_CHANNEL_CONFIG_MODEL_EXTENDED_0300
     * @tc.name testChannelConfigModelExtended0003
     * @tc.desc 正向: toJSON 序列化后字段完整且值一致
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testChannelConfigModelExtended0003', 0, () => {
      hilog.info(DOMAIN, TAG, 'testChannelConfigModelExtended0003: begin');
      const model: ChannelConfigModel = new ChannelConfigModel();
      model.markSuccess('test-channel-id');
      const json: ChannelConfigJson = model.toJSON();
      expect(json.channelId).assertEqual('test-channel-id');
      expect(json.status).assertEqual(ChannelConfigStatus.SUCCESS);
      expect(json.lastFetchTime).assertLarger(0);
      expect(json.fetchCount).assertEqual(1);
      expect(json.errorMessage).assertEqual('');
      expect(json.errorCode).assertEqual(0);
    });

    // ========================================
    // 多次 markSuccess 累计测试
    // ========================================

    /**
     * @tc.number SUB_CHANNEL_CONFIG_MODEL_EXTENDED_0400
     * @tc.name testChannelConfigModelExtended0004
     * @tc.desc 正向: 多次 markSuccess 后 fetchCount 累加
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testChannelConfigModelExtended0004', 0, () => {
      hilog.info(DOMAIN, TAG, 'testChannelConfigModelExtended0004: begin');
      const model: ChannelConfigModel = new ChannelConfigModel();
      expect(model.fetchCount).assertEqual(0);
      model.markSuccess('ch-1');
      expect(model.fetchCount).assertEqual(1);
      expect(model.channelId).assertEqual('ch-1');
      model.markSuccess('ch-2');
      expect(model.fetchCount).assertEqual(2);
      expect(model.channelId).assertEqual('ch-2');
      model.markSuccess('ch-3');
      expect(model.fetchCount).assertEqual(3);
      expect(model.lastFetchTime).assertLarger(0);
    });

    // ========================================
    // getTimeSinceLastFetch 测试
    // ========================================

    /**
     * @tc.number SUB_CHANNEL_CONFIG_MODEL_EXTENDED_0500
     * @tc.name testChannelConfigModelExtended0005
     * @tc.desc 正向: 未获取返回 -1，获取后返回非负时间差
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testChannelConfigModelExtended0005', 0, () => {
      hilog.info(DOMAIN, TAG, 'testChannelConfigModelExtended0005: begin');
      const model: ChannelConfigModel = new ChannelConfigModel();
      expect(model.getTimeSinceLastFetch()).assertEqual(-1);
      const before: number = Date.now();
      model.markSuccess('ch-1');
      const elapsed: number = model.getTimeSinceLastFetch();
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed).assertLess(5000);
      expect(model.lastFetchTime).assertLargerOrEqual(before);
      expect(model.isSuccess()).assertTrue();
    });

    /**
     * @tc.number SUB_CHANNEL_CONFIG_MODEL_EXTENDED_0600
     * @tc.name testChannelConfigModelExtended0006
     * @tc.desc 边界: reset 后 getTimeSinceLastFetch 恢复为 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testChannelConfigModelExtended0006', 0, () => {
      hilog.info(DOMAIN, TAG, 'testChannelConfigModelExtended0006: begin');
      const model: ChannelConfigModel = new ChannelConfigModel();
      model.markSuccess('ch-1');
      expect(model.getTimeSinceLastFetch()).assertLargerOrEqual(0);
      model.reset();
      expect(model.getTimeSinceLastFetch()).assertEqual(-1);
      expect(model.lastFetchTime).assertEqual(0);
    });

    // ========================================
    // toString 测试
    // ========================================

    /**
     * @tc.number SUB_CHANNEL_CONFIG_MODEL_EXTENDED_0700
     * @tc.name testChannelConfigModelExtended0007
     * @tc.desc 正向: toString 输出包含关键字段
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testChannelConfigModelExtended0007', 0, () => {
      hilog.info(DOMAIN, TAG, 'testChannelConfigModelExtended0007: begin');
      const model: ChannelConfigModel = new ChannelConfigModel();
      model.markSuccess('my-channel');
      const str: string = model.toString();
      expect(str.indexOf('ChannelConfigModel')).assertLarger(-1);
      expect(str.indexOf('my-channel')).assertLarger(-1);
      expect(str.indexOf('success')).assertLarger(-1);
    });

    // ========================================
    // isSuccess 边界测试
    // ========================================

    /**
     * @tc.number SUB_CHANNEL_CONFIG_MODEL_EXTENDED_0800
     * @tc.name testChannelConfigModelExtended0008
     * @tc.desc 边界: SUCCESS 状态但 channelId 为空时 isSuccess 返回 false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testChannelConfigModelExtended0008', 0, () => {
      hilog.info(DOMAIN, TAG, 'testChannelConfigModelExtended0008: begin');
      const model: ChannelConfigModel = new ChannelConfigModel();
      model.markSuccess('valid-id');
      expect(model.isSuccess()).assertTrue();
      model.channelId = '';
      expect(model.status).assertEqual(ChannelConfigStatus.SUCCESS);
      expect(model.isSuccess()).assertFalse();
    });

    // ========================================
    // markLoading 清除错误信息测试
    // ========================================

    /**
     * @tc.number SUB_CHANNEL_CONFIG_MODEL_EXTENDED_0900
     * @tc.name testChannelConfigModelExtended0009
     * @tc.desc 正向: markLoading 清除之前的错误信息
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testChannelConfigModelExtended0009', 0, () => {
      hilog.info(DOMAIN, TAG, 'testChannelConfigModelExtended0009: begin');
      const model: ChannelConfigModel = new ChannelConfigModel();
      model.markFailed('prev error', 999);
      expect(model.errorMessage).assertEqual('prev error');
      expect(model.errorCode).assertEqual(999);
      model.markLoading();
      expect(model.errorMessage).assertEqual('');
      expect(model.errorCode).assertEqual(0);
      expect(model.status).assertEqual(ChannelConfigStatus.LOADING);
    });

    // ========================================
    // 构造参数测试
    // ========================================

    /**
     * @tc.number SUB_CHANNEL_CONFIG_MODEL_EXTENDED_1000
     * @tc.name testChannelConfigModelExtended0010
     * @tc.desc 正向: 默认构造后所有查询方法返回正确初始值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testChannelConfigModelExtended0010', 0, () => {
      hilog.info(DOMAIN, TAG, 'testChannelConfigModelExtended0010: begin');
      const model: ChannelConfigModel = new ChannelConfigModel();
      expect(model.channelId).assertEqual('');
      expect(model.status).assertEqual(ChannelConfigStatus.UNINITIALIZED);
      expect(model.lastFetchTime).assertEqual(0);
      expect(model.errorMessage).assertEqual('');
      expect(model.errorCode).assertEqual(0);
      expect(model.fetchCount).assertEqual(0);
      expect(model.isSuccess()).assertFalse();
      expect(model.isLoading()).assertFalse();
      expect(model.isFailed()).assertFalse();
      expect(model.getTimeSinceLastFetch()).assertEqual(-1);
    });
  });
}
