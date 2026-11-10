import { describe, it, expect } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { DoNotDisturbModel, DoNotDisturbStatus } from 'library';
import type { DoNotDisturbModelJson } from 'library';

const DOMAIN: number = 0xF820;
const TAG: string = '[Sample_SystemConfig]';

/**
 * DoNotDisturbModel 扩展测试套件。
 * 补充覆盖 isReady / getTimeSinceLastQuery / toString /
 * 状态机完整流转 / toJSON 往返序列化 / 多次 markFailed 等场景。
 */
export default function DoNotDisturbModelExtendedTest(): void {
  describe('DoNotDisturbModelExtendedTest', () => {

    // ========================================
    // isReady 测试
    // ========================================

    /**
     * @tc.number SUB_DO_NOT_DISTURB_MODEL_EXTENDED_0100
     * @tc.name testDoNotDisturbModelExtended0001
     * @tc.desc 正向: 各状态下 isReady 仅 SUCCESS 返回 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDoNotDisturbModelExtended0001', 0, () => {
      hilog.info(DOMAIN, TAG, 'testDoNotDisturbModelExtended0001: begin');
      const model: DoNotDisturbModel = new DoNotDisturbModel();
      expect(model.isReady()).assertFalse();
      model.markQuerying();
      expect(model.isReady()).assertFalse();
      model.markSuccess(true, false);
      expect(model.isReady()).assertTrue();
      model.markFailed('err', 1);
      expect(model.isReady()).assertFalse();
    });

    // ========================================
    // getTimeSinceLastQuery 测试
    // ========================================

    /**
     * @tc.number SUB_DO_NOT_DISTURB_MODEL_EXTENDED_0200
     * @tc.name testDoNotDisturbModelExtended0002
     * @tc.desc 正向: 未查询返回 -1，查询后返回非负时间差
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDoNotDisturbModelExtended0002', 0, () => {
      hilog.info(DOMAIN, TAG, 'testDoNotDisturbModelExtended0002: begin');
      const model: DoNotDisturbModel = new DoNotDisturbModel();
      expect(model.getTimeSinceLastQuery()).assertEqual(-1);
      const before: number = Date.now();
      model.markSuccess(true, false);
      const elapsed: number = model.getTimeSinceLastQuery();
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed).assertLess(5000);
      expect(model.lastQueryTime).assertLargerOrEqual(before);
      expect(model.isReady()).assertTrue();
    });

    /**
     * @tc.number SUB_DO_NOT_DISTURB_MODEL_EXTENDED_0300
     * @tc.name testDoNotDisturbModelExtended0003
     * @tc.desc 边界: reset 后 getTimeSinceLastQuery 恢复为 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testDoNotDisturbModelExtended0003', 0, () => {
      hilog.info(DOMAIN, TAG, 'testDoNotDisturbModelExtended0003: begin');
      const model: DoNotDisturbModel = new DoNotDisturbModel();
      model.markSuccess(true, false);
      expect(model.getTimeSinceLastQuery()).assertLargerOrEqual(0);
      model.reset();
      expect(model.getTimeSinceLastQuery()).assertEqual(-1);
      expect(model.lastQueryTime).assertEqual(0);
    });

    // ========================================
    // toString 测试
    // ========================================

    /**
     * @tc.number SUB_DO_NOT_DISTURB_MODEL_EXTENDED_0400
     * @tc.name testDoNotDisturbModelExtended0004
     * @tc.desc 正向: toString 输出包含关键字段
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testDoNotDisturbModelExtended0004', 0, () => {
      hilog.info(DOMAIN, TAG, 'testDoNotDisturbModelExtended0004: begin');
      const model: DoNotDisturbModel = new DoNotDisturbModel();
      model.markSuccess(true, false);
      const str: string = model.toString();
      expect(str.indexOf('DoNotDisturbModel')).assertLarger(-1);
      expect(str.indexOf('dnd=true')).assertLarger(-1);
      expect(str.indexOf('notify=false')).assertLarger(-1);
      expect(str.indexOf('status=success')).assertLarger(-1);
    });

    // ========================================
    // 状态机完整流转测试
    // ========================================

    /**
     * @tc.number SUB_DO_NOT_DISTURB_MODEL_EXTENDED_0500
     * @tc.name testDoNotDisturbModelExtended0005
     * @tc.desc 正向: IDLE → QUERYING → SUCCESS → reset → IDLE 完整流转
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDoNotDisturbModelExtended0005', 0, () => {
      hilog.info(DOMAIN, TAG, 'testDoNotDisturbModelExtended0005: begin');
      const model: DoNotDisturbModel = new DoNotDisturbModel();
      expect(model.status).assertEqual(DoNotDisturbStatus.IDLE);
      expect(model.isReady()).assertFalse();
      model.markQuerying();
      expect(model.status).assertEqual(DoNotDisturbStatus.QUERYING);
      expect(model.errorMessage).assertEqual('');
      expect(model.errorCode).assertEqual(0);
      model.markSuccess(true, true);
      expect(model.status).assertEqual(DoNotDisturbStatus.SUCCESS);
      expect(model.isReady()).assertTrue();
      expect(model.isDndActive()).assertTrue();
      expect(model.canNotify()).assertTrue();
      model.reset();
      expect(model.status).assertEqual(DoNotDisturbStatus.IDLE);
      expect(model.isReady()).assertFalse();
      expect(model.isDndActive()).assertFalse();
      expect(model.canNotify()).assertFalse();
      expect(model.queryCount).assertEqual(0);
    });

    /**
     * @tc.number SUB_DO_NOT_DISTURB_MODEL_EXTENDED_0600
     * @tc.name testDoNotDisturbModelExtended0006
     * @tc.desc 正向: IDLE → QUERYING → FAILED → reset → IDLE 异常流转
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testDoNotDisturbModelExtended0006', 0, () => {
      hilog.info(DOMAIN, TAG, 'testDoNotDisturbModelExtended0006: begin');
      const model: DoNotDisturbModel = new DoNotDisturbModel();
      model.markQuerying();
      expect(model.status).assertEqual(DoNotDisturbStatus.QUERYING);
      model.markFailed('network error', 5001);
      expect(model.status).assertEqual(DoNotDisturbStatus.FAILED);
      expect(model.errorMessage).assertEqual('network error');
      expect(model.errorCode).assertEqual(5001);
      expect(model.isReady()).assertFalse();
      model.reset();
      expect(model.status).assertEqual(DoNotDisturbStatus.IDLE);
      expect(model.errorMessage).assertEqual('');
      expect(model.errorCode).assertEqual(0);
    });

    // ========================================
    // toJSON 往返序列化测试
    // ========================================

    /**
     * @tc.number SUB_DO_NOT_DISTURB_MODEL_EXTENDED_0700
     * @tc.name testDoNotDisturbModelExtended0007
     * @tc.desc 正向: toJSON 序列化后字段完整且值一致
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testDoNotDisturbModelExtended0007', 0, () => {
      hilog.info(DOMAIN, TAG, 'testDoNotDisturbModelExtended0007: begin');
      const model: DoNotDisturbModel = new DoNotDisturbModel();
      model.markSuccess(true, false);
      const json: DoNotDisturbModelJson = model.toJSON();
      expect(json.isDoNotDisturbEnabled).assertEqual(true);
      expect(json.isNotifyAllowed).assertEqual(false);
      expect(json.status).assertEqual(DoNotDisturbStatus.SUCCESS);
      expect(json.lastQueryTime).assertLarger(0);
      expect(json.queryCount).assertEqual(1);
      expect(json.errorMessage).assertEqual('');
      expect(json.errorCode).assertEqual(0);
    });

    // ========================================
    // 多次 markFailed 测试
    // ========================================

    /**
     * @tc.number SUB_DO_NOT_DISTURB_MODEL_EXTENDED_0800
     * @tc.name testDoNotDisturbModelExtended0008
     * @tc.desc 正向: 多次 markFailed 后 queryCount 累加
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testDoNotDisturbModelExtended0008', 0, () => {
      hilog.info(DOMAIN, TAG, 'testDoNotDisturbModelExtended0008: begin');
      const model: DoNotDisturbModel = new DoNotDisturbModel();
      model.markFailed('error 1', 1001);
      expect(model.queryCount).assertEqual(1);
      expect(model.status).assertEqual(DoNotDisturbStatus.FAILED);
      model.markFailed('error 2', 1002);
      expect(model.queryCount).assertEqual(2);
      expect(model.errorMessage).assertEqual('error 2');
      expect(model.errorCode).assertEqual(1002);
      model.markSuccess(false, true);
      expect(model.queryCount).assertEqual(3);
      expect(model.status).assertEqual(DoNotDisturbStatus.SUCCESS);
    });

    // ========================================
    // markSuccess + updateDndState + updateNotifyState 组合测试
    // ========================================

    /**
     * @tc.number SUB_DO_NOT_DISTURB_MODEL_EXTENDED_0900
     * @tc.name testDoNotDisturbModelExtended0009
     * @tc.desc 正向: markSuccess 后通过 updateDndState/updateNotifyState 单独更新
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testDoNotDisturbModelExtended0009', 0, () => {
      hilog.info(DOMAIN, TAG, 'testDoNotDisturbModelExtended0009: begin');
      const model: DoNotDisturbModel = new DoNotDisturbModel();
      model.markSuccess(true, true);
      expect(model.isDndActive()).assertTrue();
      expect(model.canNotify()).assertTrue();
      model.updateDndState(false);
      expect(model.isDndActive()).assertFalse();
      expect(model.canNotify()).assertTrue();
      model.updateNotifyState(false);
      expect(model.isDndActive()).assertFalse();
      expect(model.canNotify()).assertFalse();
      expect(model.status).assertEqual(DoNotDisturbStatus.SUCCESS);
      expect(model.queryCount).assertEqual(1);
    });

    // ========================================
    // 构造参数测试
    // ========================================

    /**
     * @tc.number SUB_DO_NOT_DISTURB_MODEL_EXTENDED_1000
     * @tc.name testDoNotDisturbModelExtended0010
     * @tc.desc 正向: 带参数构造后状态和查询方法正确
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDoNotDisturbModelExtended0010', 0, () => {
      hilog.info(DOMAIN, TAG, 'testDoNotDisturbModelExtended0010: begin');
      const model: DoNotDisturbModel = new DoNotDisturbModel(true, false, DoNotDisturbStatus.SUCCESS);
      expect(model.isDoNotDisturbEnabled).assertTrue();
      expect(model.isNotifyAllowed).assertFalse();
      expect(model.status).assertEqual(DoNotDisturbStatus.SUCCESS);
      expect(model.isDndActive()).assertTrue();
      expect(model.canNotify()).assertFalse();
      expect(model.isReady()).assertTrue();
    });
  });
}
