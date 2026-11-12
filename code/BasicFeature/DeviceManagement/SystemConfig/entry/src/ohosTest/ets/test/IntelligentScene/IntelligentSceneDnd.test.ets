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

import { describe, expect, it } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { DoNotDisturbModel, DoNotDisturbStatus, IntelligentSceneService } from 'library';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_SystemConfig]';

/**
 * Verifies that the state persisted after a query is self-consistent.
 * On success the error message must be cleared; on failure the service contract swallows the exception and returns false,
 * while recording the error code and message on the model. Both branches give deterministic expectations instead of reasoning by exclusion.
 * Business fields (do-not-disturb enabled / notify allowed) are written by queries outside this interface's scope, so isolation must be validated separately by each case.
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
 * IntelligentSceneService do-not-disturb query interface test suite.
 * Verifies the call counting of the do-not-disturb state query, notify-allowed query, and full query,
 * model field persistence, state-machine branches, and the service behavior in reset and uninitialized scenarios.
 */
export default function IntelligentSceneDndTest(): void {
  describe('IntelligentSceneDndTest', () => {

    /**
     * @tc.number SUB_INTELLIGENT_SCENE_DND_0100
     * @tc.name testIntelligentSceneDnd0001
     * @tc.desc Query DND enabled state once and verify model bookkeeping.
     * @tc.size MediumTest
     * @tc.type Function
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
      // Querying the do-not-disturb enabled state must not overwrite the notify-allowed state, in both success and failure branches
      expect(model.isNotifyAllowed).assertEqual(notifyBefore);
      // The success branch persists the interface return value; the failure branch's markFailed does not write business fields and keeps the pre-query value
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
     * @tc.number SUB_INTELLIGENT_SCENE_DND_0200
     * @tc.name testIntelligentSceneDnd0002
     * @tc.desc Query notify allowed state and verify DND field is untouched.
     * @tc.size MediumTest
     * @tc.type Function
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
      // Querying the notify-allowed state must not overwrite the do-not-disturb enabled state, in both success and failure branches
      expect(model.isDoNotDisturbEnabled).assertEqual(dndBefore);
      expect(service.getCurrentStatus()).assertEqual(model.status);
      // The success branch persists the interface return value; the failure branch's markFailed does not write business fields and keeps the pre-query value
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
     * @tc.number SUB_INTELLIGENT_SCENE_DND_0300
     * @tc.name testIntelligentSceneDnd0003
     * @tc.desc Query all DND states once and verify the returned live model counts.
     * @tc.size MediumTest
     * @tc.type Function
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
      // Querying the notify-allowed state must not overwrite the do-not-disturb enabled state, in both success and failure branches
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
     * @tc.number SUB_INTELLIGENT_SCENE_DND_0400
     * @tc.name testIntelligentSceneDnd0004
     * @tc.desc Reset and re-initialize the service, then verify field defaults and model instance replacement.
     * @tc.size MediumTest
     * @tc.type Function
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
      // initialize rebuilds the model instance, so the stale reference held before reset is no longer updated by the service
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
     * @tc.number SUB_INTELLIGENT_SCENE_DND_0500
     * @tc.name testIntelligentSceneDnd0005
     * @tc.desc Query DND state without initializing and verify service stays uninitialized.
     * @tc.size MediumTest
     * @tc.type Function
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
      // A query in the uninitialized state must likewise not overwrite the notify-allowed state
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
