import { describe, it, expect } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import {
  IntelligentSceneService,
  DoNotDisturbModel,
  DoNotDisturbStatus
} from 'library';

const DOMAIN: number = 0xF820;
const TAG: string = '[Sample_SystemConfig]';

/**
 * IntelligentSceneService 情景模式服务测试套件。
 * 覆盖 initialize/reset/destroy 生命周期、isServiceInitialized、
 * getDoNotDisturbModel/getCurrentStatus 以及 DoNotDisturbModel 状态迁移。
 */
export default function IntelligentSceneServiceTest(): void {
  describe('IntelligentSceneServiceTest', () => {

    // ========================================
    // 生命周期
    // ========================================

    /**
     * @tc.number SUB_INTELLIGENT_SCENE_SERVICE_0100
     * @tc.name testIntelligentSceneService0001
     * @tc.desc 正向: initialize 后 isServiceInitialized 返回 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testIntelligentSceneService0001', 0, () => {
      hilog.info(DOMAIN, TAG, 'testIntelligentSceneService0001 begin');
      const service: IntelligentSceneService = new IntelligentSceneService();
      expect(service.isServiceInitialized()).assertFalse();
      service.initialize();
      expect(service.isServiceInitialized()).assertTrue();
      expect(service.getCurrentStatus()).assertEqual(DoNotDisturbStatus.IDLE);
      service.destroy();
    });

    /**
     * @tc.number SUB_INTELLIGENT_SCENE_SERVICE_0200
     * @tc.name testIntelligentSceneService0002
     * @tc.desc 正向: reset 后 isServiceInitialized 回到 false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testIntelligentSceneService0002', 0, () => {
      hilog.info(DOMAIN, TAG, 'testIntelligentSceneService0002 begin');
      const service: IntelligentSceneService = new IntelligentSceneService();
      service.initialize();
      expect(service.isServiceInitialized()).assertTrue();
      service.reset();
      expect(service.isServiceInitialized()).assertFalse();
      service.initialize();
      expect(service.isServiceInitialized()).assertTrue();
      service.destroy();
    });

    /**
     * @tc.number SUB_INTELLIGENT_SCENE_SERVICE_0300
     * @tc.name testIntelligentSceneService0003
     * @tc.desc 正向: destroy 后状态完全重置
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testIntelligentSceneService0003', 0, () => {
      hilog.info(DOMAIN, TAG, 'testIntelligentSceneService0003 begin');
      const service: IntelligentSceneService = new IntelligentSceneService();
      service.initialize();
      expect(service.isServiceInitialized()).assertTrue();
      service.destroy();
      expect(service.isServiceInitialized()).assertFalse();
      service.initialize();
      expect(service.isServiceInitialized()).assertTrue();
      service.destroy();
    });

    // ========================================
    // 模型访问
    // ========================================

    /**
     * @tc.number SUB_INTELLIGENT_SCENE_SERVICE_0400
     * @tc.name testIntelligentSceneService0004
     * @tc.desc 正向: initialize 重建免打扰模型并回到初始值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testIntelligentSceneService0004', 0, () => {
      hilog.info(DOMAIN, TAG, 'testIntelligentSceneService0004 begin');
      const service: IntelligentSceneService = new IntelligentSceneService();
      const stale: DoNotDisturbModel = service.getDoNotDisturbModel();
      stale.markSuccess(true, false);
      service.initialize();
      const model: DoNotDisturbModel = service.getDoNotDisturbModel();
      expect(model === stale).assertFalse();
      expect(stale.queryCount).assertEqual(1);
      expect(model.queryCount).assertEqual(0);
      expect(model.status).assertEqual(DoNotDisturbStatus.IDLE);
      expect(model.isDoNotDisturbEnabled).assertFalse();
      expect(model.isNotifyAllowed).assertTrue();
      expect(model.getTimeSinceLastQuery()).assertEqual(-1);
      expect(service.getCurrentStatus()).assertEqual(model.status);
      service.destroy();
    });

    /**
     * @tc.number SUB_INTELLIGENT_SCENE_SERVICE_0500
     * @tc.name testIntelligentSceneService0005
     * @tc.desc 正向: 初始化后 getCurrentStatus 返回 IDLE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testIntelligentSceneService0005', 0, () => {
      hilog.info(DOMAIN, TAG, 'testIntelligentSceneService0005 begin');
      const service: IntelligentSceneService = new IntelligentSceneService();
      service.initialize();
      const status: DoNotDisturbStatus = service.getCurrentStatus();
      expect(status).assertEqual(DoNotDisturbStatus.IDLE);
      expect(status).assertEqual('idle');
      expect(service.isServiceInitialized()).assertTrue();
      service.destroy();
    });

    // ========================================
    // DoNotDisturbModel 状态迁移
    // ========================================

    /**
     * @tc.number SUB_INTELLIGENT_SCENE_SERVICE_0600
     * @tc.name testIntelligentSceneService0006
     * @tc.desc 正向: markQuerying 将状态设为 QUERYING
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testIntelligentSceneService0006', 0, () => {
      hilog.info(DOMAIN, TAG, 'testIntelligentSceneService0006 begin');
      const model: DoNotDisturbModel = new DoNotDisturbModel();
      expect(model.status).assertEqual(DoNotDisturbStatus.IDLE);
      model.markQuerying();
      expect(model.status).assertEqual(DoNotDisturbStatus.QUERYING);
      expect(model.errorMessage).assertEqual('');
      expect(model.errorCode).assertEqual(0);
    });

    /**
     * @tc.number SUB_INTELLIGENT_SCENE_SERVICE_0700
     * @tc.name testIntelligentSceneService0007
     * @tc.desc 正向: markSuccess 更新状态和数据
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testIntelligentSceneService0007', 0, () => {
      hilog.info(DOMAIN, TAG, 'testIntelligentSceneService0007 begin');
      const model: DoNotDisturbModel = new DoNotDisturbModel();
      model.markQuerying();
      model.markSuccess(true, false);
      expect(model.status).assertEqual(DoNotDisturbStatus.SUCCESS);
      expect(model.isDoNotDisturbEnabled).assertTrue();
      expect(model.isNotifyAllowed).assertFalse();
      expect(model.queryCount).assertEqual(1);
      expect(model.lastQueryTime).assertLarger(0);
      expect(model.errorMessage).assertEqual('');
    });

    /**
     * @tc.number SUB_INTELLIGENT_SCENE_SERVICE_0800
     * @tc.name testIntelligentSceneService0008
     * @tc.desc 反向: markFailed 记录错误信息
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testIntelligentSceneService0008', 0, () => {
      hilog.info(DOMAIN, TAG, 'testIntelligentSceneService0008 begin');
      const model: DoNotDisturbModel = new DoNotDisturbModel();
      model.markQuerying();
      model.markFailed('network error', 500);
      expect(model.status).assertEqual(DoNotDisturbStatus.FAILED);
      expect(model.errorMessage).assertEqual('network error');
      expect(model.errorCode).assertEqual(500);
      expect(model.queryCount).assertEqual(1);
      expect(model.lastQueryTime).assertLarger(0);
    });

    /**
     * @tc.number SUB_INTELLIGENT_SCENE_SERVICE_0900
     * @tc.name testIntelligentSceneService0009
     * @tc.desc 正向: reset 后模型回到初始状态
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testIntelligentSceneService0009', 0, () => {
      hilog.info(DOMAIN, TAG, 'testIntelligentSceneService0009 begin');
      const model: DoNotDisturbModel = new DoNotDisturbModel();
      model.markSuccess(true, true);
      expect(model.queryCount).assertEqual(1);
      model.reset();
      expect(model.status).assertEqual(DoNotDisturbStatus.IDLE);
      expect(model.isDoNotDisturbEnabled).assertFalse();
      expect(model.isNotifyAllowed).assertTrue();
      expect(model.queryCount).assertEqual(0);
      expect(model.lastQueryTime).assertEqual(0);
      expect(model.errorMessage).assertEqual('');
    });

    // ========================================
    // DoNotDisturbModel 查询方法
    // ========================================

    /**
     * @tc.number SUB_INTELLIGENT_SCENE_SERVICE_1000
     * @tc.name testIntelligentSceneService0010
     * @tc.desc 正向: isDndActive 仅在 SUCCESS 且 dndEnabled 时返回 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testIntelligentSceneService0010', 0, () => {
      hilog.info(DOMAIN, TAG, 'testIntelligentSceneService0010 begin');
      const model: DoNotDisturbModel = new DoNotDisturbModel();
      expect(model.isDndActive()).assertFalse();
      model.markSuccess(true, false);
      expect(model.isDndActive()).assertTrue();
      model.reset();
      model.markSuccess(false, true);
      expect(model.isDndActive()).assertFalse();
    });

    /**
     * @tc.number SUB_INTELLIGENT_SCENE_SERVICE_1100
     * @tc.name testIntelligentSceneService0011
     * @tc.desc 正向: canNotify 仅在 SUCCESS 且 notifyAllowed 时返回 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testIntelligentSceneService0011', 0, () => {
      hilog.info(DOMAIN, TAG, 'testIntelligentSceneService0011 begin');
      const model: DoNotDisturbModel = new DoNotDisturbModel();
      expect(model.canNotify()).assertFalse();
      model.markSuccess(false, true);
      expect(model.canNotify()).assertTrue();
      model.reset();
      model.markSuccess(true, false);
      expect(model.canNotify()).assertFalse();
    });

    /**
     * @tc.number SUB_INTELLIGENT_SCENE_SERVICE_1200
     * @tc.name testIntelligentSceneService0012
     * @tc.desc 正向: isReady 仅在 SUCCESS 状态时返回 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testIntelligentSceneService0012', 0, () => {
      hilog.info(DOMAIN, TAG, 'testIntelligentSceneService0012 begin');
      const model: DoNotDisturbModel = new DoNotDisturbModel();
      expect(model.isReady()).assertFalse();
      model.markQuerying();
      expect(model.isReady()).assertFalse();
      model.markSuccess(true, true);
      expect(model.isReady()).assertTrue();
    });

    // ========================================
    // 序列化
    // ========================================

    /**
     * @tc.number SUB_INTELLIGENT_SCENE_SERVICE_1300
     * @tc.name testIntelligentSceneService0013
     * @tc.desc 正向: toJSON 返回完整字段
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testIntelligentSceneService0013', 0, () => {
      hilog.info(DOMAIN, TAG, 'testIntelligentSceneService0013 begin');
      const model: DoNotDisturbModel = new DoNotDisturbModel(true, false, DoNotDisturbStatus.SUCCESS);
      model.lastQueryTime = 1700000000000;
      model.queryCount = 5;
      const json = model.toJSON();
      expect(json.isDoNotDisturbEnabled).assertTrue();
      expect(json.isNotifyAllowed).assertFalse();
      expect(json.status).assertEqual(DoNotDisturbStatus.SUCCESS);
      expect(json.lastQueryTime).assertEqual(1700000000000);
      expect(json.queryCount).assertEqual(5);
    });

    /**
     * @tc.number SUB_INTELLIGENT_SCENE_SERVICE_1400
     * @tc.name testIntelligentSceneService0014
     * @tc.desc 正向: toString 返回包含关键字段的字符串
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testIntelligentSceneService0014', 0, () => {
      hilog.info(DOMAIN, TAG, 'testIntelligentSceneService0014 begin');
      const model: DoNotDisturbModel = new DoNotDisturbModel();
      model.markSuccess(true, false);
      const str: string = model.toString();
      expect(str.indexOf('DoNotDisturbModel')).assertEqual(0);
      expect(str.indexOf('dnd=true')).assertLarger(-1);
      expect(str.indexOf('notify=false')).assertLarger(-1);
    });

    /**
     * @tc.number SUB_INTELLIGENT_SCENE_SERVICE_1500
     * @tc.name testIntelligentSceneService0015
     * @tc.desc 正向: 未查询返回 -1，查询后返回正值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testIntelligentSceneService0015', 0, () => {
      hilog.info(DOMAIN, TAG, 'testIntelligentSceneService0015 begin');
      const model: DoNotDisturbModel = new DoNotDisturbModel();
      expect(model.getTimeSinceLastQuery()).assertEqual(-1);
      model.markSuccess(true, true);
      const elapsed: number = model.getTimeSinceLastQuery();
      expect(elapsed).assertLarger(-1);
      expect(elapsed).assertLess(5000);
    });
  });
}
