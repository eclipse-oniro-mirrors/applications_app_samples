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
  IntelligentSceneService,
  DoNotDisturbModel,
  DoNotDisturbStatus
} from 'library';

const DOMAIN: number = 0xF820;
const TAG: string = '[Sample_SystemConfig]';

/**
 * IntelligentSceneService 扩展测试套件。
 * 覆盖异步查询状态机编排 / 模型引用一致性 / 初始化与销毁生命周期。
 * 免打扰接口真实查询结果依赖系统通知管理服务，由 IntelligentSceneService 套件单独覆盖。
 */
export default function IntelligentSceneServiceExtendedTest(): void {
  describe('IntelligentSceneServiceExtendedTest', () => {

    // ========================================
    // 异步模拟测试
    // ========================================

    /**
     * @tc.number SUB_INTELLIGENT_SCENE_SERVICE_EXTENDED_0100
     * @tc.name testIntelligentSceneServiceExtended0001
     * @tc.desc 正向: 模拟异步查询成功流程
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testIntelligentSceneServiceExtended0001', 0, () => {
      hilog.info(DOMAIN, TAG, 'testIntelligentSceneServiceExtended0001: begin');
      const service: IntelligentSceneService = new IntelligentSceneService();
      service.initialize();

      const model: DoNotDisturbModel = service.getDoNotDisturbModel();
      expect(model.status).assertEqual(DoNotDisturbStatus.IDLE);

      model.markQuerying();
      expect(model.status).assertEqual(DoNotDisturbStatus.QUERYING);

      model.markSuccess(true, false);
      expect(model.status).assertEqual(DoNotDisturbStatus.SUCCESS);
      expect(model.isDoNotDisturbEnabled).assertTrue();
      expect(model.isNotifyAllowed).assertFalse();

      service.destroy();
    });

    /**
     * @tc.number SUB_INTELLIGENT_SCENE_SERVICE_EXTENDED_0200
     * @tc.name testIntelligentSceneServiceExtended0002
     * @tc.desc 边界: 模拟异步查询失败
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testIntelligentSceneServiceExtended0002', 0, () => {
      hilog.info(DOMAIN, TAG, 'testIntelligentSceneServiceExtended0002: begin');
      const service: IntelligentSceneService = new IntelligentSceneService();
      service.initialize();

      const model: DoNotDisturbModel = service.getDoNotDisturbModel();
      model.markQuerying();
      model.markFailed('timeout error', 504);

      expect(model.status).assertEqual(DoNotDisturbStatus.FAILED);
      expect(model.errorMessage).assertEqual('timeout error');
      expect(model.errorCode).assertEqual(504);
      expect(model.queryCount).assertEqual(1);

      service.destroy();
    });

    // ========================================
    // 状态缓存测试
    // ========================================

    /**
     * @tc.number SUB_INTELLIGENT_SCENE_SERVICE_EXTENDED_0300
     * @tc.name testIntelligentSceneServiceExtended0003
     * @tc.desc 边界: 模型引用一致性
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testIntelligentSceneServiceExtended0003', 0, () => {
      hilog.info(DOMAIN, TAG, 'testIntelligentSceneServiceExtended0003: begin');
      const service: IntelligentSceneService = new IntelligentSceneService();
      service.initialize();

      const model1: DoNotDisturbModel = service.getDoNotDisturbModel();
      const model2: DoNotDisturbModel = service.getDoNotDisturbModel();

      expect(model1).assertEqual(model2);
      expect(model1.status).assertEqual(model2.status);
      expect(model1.queryCount).assertEqual(model2.queryCount);
      service.destroy();
    });

    // ========================================
    // 异常恢复测试
    // ========================================

    /**
     * @tc.number SUB_INTELLIGENT_SCENE_SERVICE_EXTENDED_0400
     * @tc.name testIntelligentSceneServiceExtended0004
     * @tc.desc 边界: 多次销毁不报错
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testIntelligentSceneServiceExtended0004', 0, () => {
      hilog.info(DOMAIN, TAG, 'testIntelligentSceneServiceExtended0004: begin');
      const service: IntelligentSceneService = new IntelligentSceneService();

      service.initialize();
      service.destroy();
      service.destroy();
      service.destroy();

      expect(service.isServiceInitialized()).assertFalse();
      expect(service.getCurrentStatus()).assertEqual(DoNotDisturbStatus.IDLE);
      expect(service.getDoNotDisturbModel().queryCount).assertEqual(0);
    });

    /**
     * @tc.number SUB_INTELLIGENT_SCENE_SERVICE_EXTENDED_0500
     * @tc.name testIntelligentSceneServiceExtended0005
     * @tc.desc 边界: 反复初始化/销毁
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testIntelligentSceneServiceExtended0005', 0, async () => {
      hilog.info(DOMAIN, TAG, 'testIntelligentSceneServiceExtended0005: begin');
      const service: IntelligentSceneService = new IntelligentSceneService();

      for (let i: number = 0; i < 10; i++) {
        service.initialize();
        expect(service.isServiceInitialized()).assertTrue();
        await service.queryAllDndStates();
        service.destroy();
        expect(service.isServiceInitialized()).assertFalse();
      }
      expect(service.getCurrentStatus()).assertEqual(DoNotDisturbStatus.IDLE);
      expect(service.getDoNotDisturbModel().queryCount).assertEqual(0);
    });
  });
}
