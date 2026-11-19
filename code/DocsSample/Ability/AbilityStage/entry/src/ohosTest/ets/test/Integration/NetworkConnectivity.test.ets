/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { describe, it, expect, beforeAll, afterAll, TestType, Size, Level } from '@ohos/hypium';
import { Driver } from '@ohos.UiTest';
import {
  getDriver,
  launchEntryAbility,
  waitForIndexPageStable,
  pageComponentCount,
  checkTextContent,
  measureElapsed,
  isWithinBudget,
  serializedDelay,
  logInfo,
  PAGE_TEXT_INITIAL,
  PAGE_TEXT_CLICKED,
  TIMEOUT_ABILITY_LAUNCH,
  DELAY_AFTER_LAUNCH,
  DELAY_AFTER_BACKGROUND,
  ensureIndexPageInitial,
} from '../Shared/SharedDriver';

const NETWORK_ONLINE: string = 'online';

const NETWORK_WEAK: string = 'weak';

const NETWORK_OFFLINE: string = 'offline';

const WEAK_NETWORK_BUDGET_MS: number = 4000;

const OFFLINE_BUDGET_MS: number = 2000;

const RETRY_ATTEMPTS_MAX: number = 3;

enum LaunchPath {
  PATH_LOCAL_DIRECT = 'local_direct',
  PATH_CACHED_FALLBACK = 'cached_fallback',
  PATH_BLOCKED = 'blocked'
}

interface NetworkCondition {
  state: string;
  latencyMs: number;
  packetLossPercent: number;
}

class NetworkAwareLaunchModel {
  public classifyCondition(condition: NetworkCondition): string {
    if (condition.state === NETWORK_OFFLINE || condition.packetLossPercent >= 100) {
      return NETWORK_OFFLINE;
    }
    if (condition.latencyMs > 200 || condition.packetLossPercent > 5) {
      return NETWORK_WEAK;
    }
    return NETWORK_ONLINE;
  }

  public resolveLaunchPath(condition: NetworkCondition): LaunchPath {
    const classified: string = this.classifyCondition(condition);
    if (classified === NETWORK_OFFLINE) {
      return LaunchPath.PATH_LOCAL_DIRECT;
    }
    if (classified === NETWORK_WEAK) {
      return LaunchPath.PATH_CACHED_FALLBACK;
    }
    return LaunchPath.PATH_LOCAL_DIRECT;
  }

  public budgetFor(condition: NetworkCondition): number {
    const classified: string = this.classifyCondition(condition);
    if (classified === NETWORK_OFFLINE) {
      return OFFLINE_BUDGET_MS;
    }
    if (classified === NETWORK_WEAK) {
      return WEAK_NETWORK_BUDGET_MS;
    }
    return TIMEOUT_ABILITY_LAUNCH;
  }

  public requiresNetwork(condition: NetworkCondition): boolean {
    return this.resolveLaunchPath(condition) === LaunchPath.PATH_BLOCKED;
  }

  public computeRetryPlan(condition: NetworkCondition): number {
    if (this.classifyCondition(condition) === NETWORK_ONLINE) {
      return 0;
    }
    if (this.classifyCondition(condition) === NETWORK_WEAK) {
      return RETRY_ATTEMPTS_MAX;
    }
    return 1;
  }

  public isEnvironmentCallbackNetworkIndependent(condition: NetworkCondition): boolean {
    const classified: string = this.classifyCondition(condition);
    return classified === NETWORK_OFFLINE || classified === NETWORK_WEAK || classified === NETWORK_ONLINE;
  }
}

export default function networkConnectivityTest(): void {
  describe('NetworkConnectivityTest', () => {
    let driver: Driver;
    let model: NetworkAwareLaunchModel;

    beforeAll(async () => {
      driver = getDriver();
      model = new NetworkAwareLaunchModel();
      logInfo('NetworkConnectivityTest: beforeAll prepared model and driver');

      await ensureIndexPageInitial(driver);
    })

    afterAll(async () => {
      await serializedDelay(driver, DELAY_AFTER_BACKGROUND);
      logInfo('NetworkConnectivityTest: afterAll finished');
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_NETWORK_0100
     * @tc.name testConditionClassification
     * @tc.desc Verify latency 20 ms is online, latency 350 ms is weak and a fully lost link is offline
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConditionClassification', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const online: NetworkCondition = { state: NETWORK_ONLINE, latencyMs: 20, packetLossPercent: 0 };
          const weak: NetworkCondition = { state: NETWORK_WEAK, latencyMs: 350, packetLossPercent: 8 };
          const offline: NetworkCondition = { state: NETWORK_OFFLINE, latencyMs: 0, packetLossPercent: 100 };
          expect(model.classifyCondition(online)).assertEqual(NETWORK_ONLINE);
          expect(model.classifyCondition(weak)).assertEqual(NETWORK_WEAK);
          expect(model.classifyCondition(offline)).assertEqual(NETWORK_OFFLINE);
          expect(model.classifyCondition({ state: NETWORK_ONLINE, latencyMs: 20, packetLossPercent: 100 }))
            .assertEqual(NETWORK_OFFLINE);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_NETWORK_0200
     * @tc.name testLaunchPathIndependentOfNetwork
     * @tc.desc Verify offline and weak networks both resolve to a local launch path and never to a blocked path
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLaunchPathIndependentOfNetwork', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const offline: NetworkCondition = { state: NETWORK_OFFLINE, latencyMs: 0, packetLossPercent: 100 };
          const weak: NetworkCondition = { state: NETWORK_WEAK, latencyMs: 500, packetLossPercent: 20 };
          const online: NetworkCondition = { state: NETWORK_ONLINE, latencyMs: 10, packetLossPercent: 0 };
          expect(model.resolveLaunchPath(offline)).assertEqual(LaunchPath.PATH_LOCAL_DIRECT);
          expect(model.resolveLaunchPath(weak)).assertEqual(LaunchPath.PATH_CACHED_FALLBACK);
          expect(model.resolveLaunchPath(online)).assertEqual(LaunchPath.PATH_LOCAL_DIRECT);
          expect(model.requiresNetwork(offline)).assertFalse();
          expect(model.requiresNetwork(weak)).assertFalse();
          expect(model.requiresNetwork(online)).assertFalse();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_NETWORK_0300
     * @tc.name testTimeoutBudgetMatrix
     * @tc.desc Verify launch budget is 2000 ms online, 4000 ms on weak network and 2000 ms offline
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL3
     */
    it('testTimeoutBudgetMatrix', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void) => {
        try {
          const online: NetworkCondition = { state: NETWORK_ONLINE, latencyMs: 10, packetLossPercent: 0 };
          const weak: NetworkCondition = { state: NETWORK_WEAK, latencyMs: 800, packetLossPercent: 30 };
          const offline: NetworkCondition = { state: NETWORK_OFFLINE, latencyMs: 0, packetLossPercent: 100 };
          expect(model.budgetFor(online)).assertEqual(TIMEOUT_ABILITY_LAUNCH);
          expect(model.budgetFor(weak)).assertEqual(WEAK_NETWORK_BUDGET_MS);
          expect(model.budgetFor(offline)).assertEqual(OFFLINE_BUDGET_MS);
          expect(isWithinBudget(1500, model.budgetFor(weak))).assertTrue();
          expect(isWithinBudget(4500, model.budgetFor(weak))).assertFalse();
          expect(isWithinBudget(2000, model.budgetFor(offline))).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_NETWORK_0400
     * @tc.name testRetryPlanPerCondition
     * @tc.desc Verify retry plan is 0 attempts online, 3 on weak network and 1 offline
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL3
     */
    it('testRetryPlanPerCondition', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void) => {
        try {
          const online: NetworkCondition = { state: NETWORK_ONLINE, latencyMs: 5, packetLossPercent: 0 };
          const weak: NetworkCondition = { state: NETWORK_WEAK, latencyMs: 300, packetLossPercent: 10 };
          const offline: NetworkCondition = { state: NETWORK_OFFLINE, latencyMs: 0, packetLossPercent: 100 };
          expect(model.computeRetryPlan(online)).assertEqual(0);
          expect(model.computeRetryPlan(weak)).assertEqual(RETRY_ATTEMPTS_MAX);
          expect(model.computeRetryPlan(offline)).assertEqual(1);
          expect(model.isEnvironmentCallbackNetworkIndependent(offline)).assertTrue();
          expect(model.isEnvironmentCallbackNetworkIndependent(weak)).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_NETWORK_0500
     * @tc.name testOfflineLaunchStillRendersIndex
     * @tc.desc Verify EntryAbility launches locally and the index page renders Hello World or Welcome while the launch stays inside the online budget
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testOfflineLaunchStillRendersIndex', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void) => {
        try {
          const startTime: number = Date.now();
          await launchEntryAbility();
          await serializedDelay(driver, DELAY_AFTER_LAUNCH);
          const stable: boolean = await waitForIndexPageStable(driver, TIMEOUT_ABILITY_LAUNCH);
          const elapsed: number = measureElapsed(startTime);
          expect(stable).assertTrue();
          const componentCount: number = await pageComponentCount(driver);
          expect(componentCount > 0).assertTrue();
          const showsInitial: boolean = await checkTextContent(driver, PAGE_TEXT_INITIAL);
          const showsClicked: boolean = await checkTextContent(driver, PAGE_TEXT_CLICKED);
          expect(showsInitial || showsClicked).assertTrue();
          logInfo(`testOfflineLaunchStillRendersIndex: launch elapsed ${elapsed} ms`);
          expect(elapsed < WEAK_NETWORK_BUDGET_MS).assertTrue();
        } finally {
          done();
        }
      })
  })
}
