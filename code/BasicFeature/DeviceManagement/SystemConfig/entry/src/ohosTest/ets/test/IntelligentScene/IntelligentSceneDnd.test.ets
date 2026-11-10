/*
 * Copyright (c) 2024 Hunan OpenValley Digital Industry Development Co., Ltd.
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

import { describe, expect, it } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { DoNotDisturbModel, DoNotDisturbStatus, IntelligentSceneService } from 'library';

const DOMAIN: number = 0xF820;
const TAG: string = '[Sample_SystemConfig]';

/**
 * 校验一次查询结束后的状态落库是否自洽。
 * 查询成功时错误信息必须被清空；查询失败时服务约定吞掉异常并返回 false，
 * 同时把错误码与错误信息落到模型上。两种分支都给出确定期望，不做排除法判断。
 * 业务字段（免打扰启用 / 通知允许）由本接口归属之外的查询写入，需由用例单独校验隔离性。
 */
function assertQueryContract(model: DoNotDisturbModel, returned: boolean): void {
  if (model.status === DoNotDisturbStatus.SUCCESS) {
    expect(model.errorCode).assertEqual(0);
    expect(model.errorMessage).assertEqual('');
    expect(model.isReady()).assertTrue();
  } else {
    expect(model.status).assertEqual(DoNotDisturbStatus.FAILED);
    expect(model.errorCode).assertLarger(0);
    expect(model.errorMessage.length).assertLarger(0);
    expect(model.isReady()).assertFalse();
    expect(returned).assertFalse();
  }
}

/**
 * IntelligentSceneService 免打扰查询接口测试套件。
 * 验证免打扰状态查询、通知允许状态查询与全量查询的调用计数、
 * 模型字段落库、状态机分支以及重置与未初始化场景下的服务行为。
 */
export default function IntelligentSceneDndTest(): void {
  describe('IntelligentSceneDndTest', () => {

    /**
     * @tc.number: SUB_INTELLIGENT_SCENE_DND_0100
     * @tc.name: testIntelligentSceneDnd0001
     * @tc.desc: Query DND enabled state once and verify model bookkeeping.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testIntelligentSceneDnd0001', 0, async () => {
      hilog.info(DOMAIN, TAG, 'testIntelligentSceneDnd0001: start test');
      const service: IntelligentSceneService = new IntelligentSceneService();
      service.initialize();
      const model: DoNotDisturbModel = service.getDoNotDisturbModel();
      expect(model.queryCount).assertEqual(0);
      expect(model.status).assertEqual(DoNotDisturbStatus.IDLE);
      expect(model.lastQueryTime).assertEqual(0);
      expect(model.getTimeSinceLastQuery()).assertEqual(-1);

      const startedAt: number = Date.now();
      const dndBefore: boolean = model.isDoNotDisturbEnabled;
      const notifyBefore: boolean = model.isNotifyAllowed;
      const result: boolean = await service.isDoNotDisturbEnabled();
      expect(model.queryCount).assertEqual(1);
      expect(model.lastQueryTime).assertLargerOrEqual(startedAt);
      expect(model.getTimeSinceLastQuery()).assertLargerOrEqual(0);
      // 免打扰启用状态查询不得改写通知允许状态，成功与失败分支均成立
      expect(model.isNotifyAllowed).assertEqual(notifyBefore);
      // 成功分支落库接口返回值；失败分支 markFailed 不写业务字段，保留查询前的值
      if (model.status === DoNotDisturbStatus.SUCCESS) {
        expect(model.isDoNotDisturbEnabled).assertEqual(result);
      } else {
        expect(result).assertFalse();
        expect(model.isDoNotDisturbEnabled).assertEqual(dndBefore);
      }
      assertQueryContract(model, result);
      hilog.info(DOMAIN, TAG, 'testIntelligentSceneDnd0001: queries=%{public}d status=%{public}s',
        model.queryCount, model.status);
      service.destroy();
    });

    /**
     * @tc.number: SUB_INTELLIGENT_SCENE_DND_0200
     * @tc.name: testIntelligentSceneDnd0002
     * @tc.desc: Query notify allowed state and verify DND field is untouched.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testIntelligentSceneDnd0002', 0, async () => {
      hilog.info(DOMAIN, TAG, 'testIntelligentSceneDnd0002: start test');
      const service: IntelligentSceneService = new IntelligentSceneService();
      service.initialize();
      const model: DoNotDisturbModel = service.getDoNotDisturbModel();
      expect(model.isNotifyAllowed).assertTrue();
      expect(model.isDoNotDisturbEnabled).assertFalse();

      const startedAt: number = Date.now();
      const dndBefore: boolean = model.isDoNotDisturbEnabled;
      const notifyBefore: boolean = model.isNotifyAllowed;
      const allowed: boolean = await service.isNotifyAllowedInDoNotDisturb();
      expect(model.queryCount).assertEqual(1);
      expect(model.lastQueryTime).assertLargerOrEqual(startedAt);
      // 通知允许状态查询不得改写免打扰启用状态，成功与失败分支均成立
      expect(model.isDoNotDisturbEnabled).assertEqual(dndBefore);
      expect(service.getCurrentStatus()).assertEqual(model.status);
      // 成功分支落库接口返回值；失败分支 markFailed 不写业务字段，保留查询前的值
      if (model.status === DoNotDisturbStatus.SUCCESS) {
        expect(model.isNotifyAllowed).assertEqual(allowed);
      } else {
        expect(allowed).assertFalse();
        expect(model.isNotifyAllowed).assertEqual(notifyBefore);
      }
      assertQueryContract(model, allowed);
      hilog.info(DOMAIN, TAG, 'testIntelligentSceneDnd0002: notify query completed');
      service.destroy();
    });

    /**
     * @tc.number: SUB_INTELLIGENT_SCENE_DND_0300
     * @tc.name: testIntelligentSceneDnd0003
     * @tc.desc: Query all DND states once and verify the returned live model counts.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testIntelligentSceneDnd0003', 0, async () => {
      hilog.info(DOMAIN, TAG, 'testIntelligentSceneDnd0003: start test');
      const service: IntelligentSceneService = new IntelligentSceneService();
      service.initialize();
      const startedAt: number = Date.now();
      const returned: DoNotDisturbModel = await service.queryAllDndStates();
      expect(returned.queryCount).assertEqual(1);
      expect(returned.lastQueryTime).assertLargerOrEqual(startedAt);
      expect(returned === service.getDoNotDisturbModel()).assertTrue();
      assertQueryContract(returned, returned.isDoNotDisturbEnabled);

      const dndBefore: boolean = returned.isDoNotDisturbEnabled;
      const notifyBefore: boolean = returned.isNotifyAllowed;
      const beforeNext: number = Date.now();
      const allowed: boolean = await service.isNotifyAllowedInDoNotDisturb();
      expect(returned.queryCount).assertEqual(2);
      expect(returned.lastQueryTime).assertLargerOrEqual(beforeNext);
      // 通知允许状态查询不得改写免打扰启用状态，成功与失败分支均成立
      expect(returned.isDoNotDisturbEnabled).assertEqual(dndBefore);
      if (returned.status === DoNotDisturbStatus.SUCCESS) {
        expect(returned.isNotifyAllowed).assertEqual(allowed);
      } else {
        expect(allowed).assertFalse();
        expect(returned.isNotifyAllowed).assertEqual(notifyBefore);
      }
      hilog.info(DOMAIN, TAG, 'testIntelligentSceneDnd0003: queries=%{public}d', returned.queryCount);
      service.destroy();
    });

    /**
     * @tc.number: SUB_INTELLIGENT_SCENE_DND_0400
     * @tc.name: testIntelligentSceneDnd0004
     * @tc.desc: Reset and re-initialize the service, then verify field defaults and model instance replacement.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testIntelligentSceneDnd0004', 0, async () => {
      hilog.info(DOMAIN, TAG, 'testIntelligentSceneDnd0004: start test');
      const service: IntelligentSceneService = new IntelligentSceneService();
      service.initialize();
      const model: DoNotDisturbModel = service.getDoNotDisturbModel();
      await service.isDoNotDisturbEnabled();
      expect(model.queryCount).assertEqual(1);
      expect(model.lastQueryTime).assertLarger(0);

      service.reset();
      expect(service.isServiceInitialized()).assertFalse();
      expect(model.queryCount).assertEqual(0);
      expect(model.status).assertEqual(DoNotDisturbStatus.IDLE);
      expect(model.lastQueryTime).assertEqual(0);
      expect(model.errorMessage).assertEqual('');
      expect(model.errorCode).assertEqual(0);
      expect(model.isDoNotDisturbEnabled).assertFalse();
      expect(model.isNotifyAllowed).assertTrue();
      expect(model.getTimeSinceLastQuery()).assertEqual(-1);

      service.initialize();
      expect(service.isServiceInitialized()).assertTrue();
      // initialize 重建模型实例，reset 前持有的旧引用不再被服务更新
      const liveModel: DoNotDisturbModel = service.getDoNotDisturbModel();
      expect(liveModel === model).assertFalse();
      const afterInit: boolean = await service.isDoNotDisturbEnabled();
      expect(liveModel.queryCount).assertEqual(1);
      expect(model.queryCount).assertEqual(0);
      expect(model.lastQueryTime).assertEqual(0);
      assertQueryContract(liveModel, afterInit);
      hilog.info(DOMAIN, TAG, 'testIntelligentSceneDnd0004: reset and re-query completed');
      service.destroy();
    });

    /**
     * @tc.number: SUB_INTELLIGENT_SCENE_DND_0500
     * @tc.name: testIntelligentSceneDnd0005
     * @tc.desc: Query DND state without initializing and verify service stays uninitialized.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testIntelligentSceneDnd0005', 0, async () => {
      hilog.info(DOMAIN, TAG, 'testIntelligentSceneDnd0005: start test');
      const service: IntelligentSceneService = new IntelligentSceneService();
      expect(service.isServiceInitialized()).assertFalse();
      const model: DoNotDisturbModel = service.getDoNotDisturbModel();
      expect(model.queryCount).assertEqual(0);

      const startedAt: number = Date.now();
      const dndBefore: boolean = model.isDoNotDisturbEnabled;
      const notifyBefore: boolean = model.isNotifyAllowed;
      const result: boolean = await service.isDoNotDisturbEnabled();
      expect(service.isServiceInitialized()).assertFalse();
      expect(model.queryCount).assertEqual(1);
      expect(model.lastQueryTime).assertLargerOrEqual(startedAt);
      // 未初始化状态下的查询同样不得改写通知允许状态
      expect(model.isNotifyAllowed).assertEqual(notifyBefore);
      if (model.status === DoNotDisturbStatus.SUCCESS) {
        expect(model.isDoNotDisturbEnabled).assertEqual(result);
      } else {
        expect(result).assertFalse();
        expect(model.isDoNotDisturbEnabled).assertEqual(dndBefore);
      }
      assertQueryContract(model, result);
      hilog.info(DOMAIN, TAG, 'testIntelligentSceneDnd0005: query without init completed');
      service.destroy();
    });
  });
}
