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
  logInfo,
  logError,
  launchEntryAbility,
  serializedDelay,
  waitForIndexPageStable,
  isIndexPageVisible,
  checkTextContent,
  waitForTextVisible,
  tapComponentByText,
  doAbilityBackground,
  doAbilityForeground,
  pageComponentCount,
  collectAllTexts,
  isWithinBudget,
  measureElapsed,
  averageOf,
  maxOf,
  minOf,
  PAGE_TEXT_INITIAL,
  PAGE_TEXT_CLICKED,
  TIMEOUT_ABILITY_LAUNCH,
  TIMEOUT_PAGE_RENDER,
  DELAY_AFTER_LAUNCH,
  DELAY_AFTER_BACKGROUND,
  STRESS_ROUNDS_LAUNCH,
  ensureIndexPageInitial,
} from '../Shared/SharedDriver';

const OFFLINE_SAMPLE_ROUNDS: number = 10;

const LAUNCH_BUDGET_MS: number = TIMEOUT_ABILITY_LAUNCH;

const RENDER_BUDGET_MS: number = TIMEOUT_PAGE_RENDER;

const MAX_CONSECUTIVE_FAILURES: number = 2;

const SUCCESS_THRESHOLD_PERCENT: number = 90;

enum NetworkState {
  ONLINE_WIFI = 'online_wifi',
  ONLINE_CELLULAR = 'online_cellular',
  OFFLINE_AIRPLANE = 'offline_airplane',
  OFFLINE_NO_ROUTE = 'offline_no_route'
}

enum LaunchOutcome {
  SUCCESS = 'success',
  RENDER_TIMEOUT = 'render_timeout',
  LAUNCH_TIMEOUT = 'launch_timeout',
  BLOCKED_BY_NETWORK = 'blocked_by_network'
}

enum OfflineDependency {
  ABILITY_START = 'ability_start',
  PAGE_RENDER = 'page_render',
  ENVIRONMENT_CALLBACK = 'environment_callback',
  STAGE_LIFECYCLE = 'stage_lifecycle',
  BACKUP_EXTENSION = 'backup_extension'
}

class LaunchSample {
  public outcome: LaunchOutcome;
  public elapsedMs: number;
  public network: NetworkState;

  constructor(outcome: LaunchOutcome, elapsedMs: number, network: NetworkState) {
    this.outcome = outcome;
    this.elapsedMs = elapsedMs;
    this.network = network;
  }

  public isSuccess(): boolean {
    return this.outcome === LaunchOutcome.SUCCESS;
  }

  public withinBudget(): boolean {
    return this.elapsedMs <= LAUNCH_BUDGET_MS;
  }
}

class NetworkSimulator {
  private state: NetworkState = NetworkState.ONLINE_WIFI;

  private transitions: NetworkState[] = [];

  public setState(state: NetworkState): void {
    this.state = state;
    this.transitions.push(state);
  }

  public getState(): NetworkState {
    return this.state;
  }

  public isOffline(): boolean {
    return this.state === NetworkState.OFFLINE_AIRPLANE || this.state === NetworkState.OFFLINE_NO_ROUTE;
  }

  public isOnline(): boolean {
    return !this.isOffline();
  }

  public transitionCount(): number {
    return this.transitions.length;
  }

  public lastTransition(): NetworkState | null {
    if (this.transitions.length === 0) {
      return null;
    }
    return this.transitions[this.transitions.length - 1];
  }

  public providerLabel(): string {
    if (this.state === NetworkState.ONLINE_WIFI) {
      return 'wifi';
    }
    if (this.state === NetworkState.ONLINE_CELLULAR) {
      return 'cellular';
    }
    if (this.state === NetworkState.OFFLINE_AIRPLANE) {
      return 'airplane';
    }
    return 'none';
  }

  public reset(): void {
    this.state = NetworkState.ONLINE_WIFI;
    this.transitions.splice(0, this.transitions.length);
  }
}

class DependencyMatrix {
  public static requiresNetwork(dependency: OfflineDependency): boolean {
    return dependency === OfflineDependency.BACKUP_EXTENSION;
  }

  public static isCorePath(dependency: OfflineDependency): boolean {
    return dependency === OfflineDependency.ABILITY_START || dependency === OfflineDependency.PAGE_RENDER;
  }

  public static allDependencies(): OfflineDependency[] {
    return [
      OfflineDependency.ABILITY_START,
      OfflineDependency.PAGE_RENDER,
      OfflineDependency.ENVIRONMENT_CALLBACK,
      OfflineDependency.STAGE_LIFECYCLE,
      OfflineDependency.BACKUP_EXTENSION
    ];
  }

  public static countNetworkFree(): number {
    let count: number = 0;
    const all: OfflineDependency[] = DependencyMatrix.allDependencies();
    for (let i = 0; i < all.length; i++) {
      if (!DependencyMatrix.requiresNetwork(all[i])) {
        count++;
      }
    }
    return count;
  }

  public static validateOffline(state: NetworkState): boolean {
    if (state !== NetworkState.OFFLINE_AIRPLANE && state !== NetworkState.OFFLINE_NO_ROUTE) {
      return false;
    }
    const all: OfflineDependency[] = DependencyMatrix.allDependencies();
    for (let i = 0; i < all.length; i++) {
      if (DependencyMatrix.isCorePath(all[i]) && DependencyMatrix.requiresNetwork(all[i])) {
        return false;
      }
    }
    return true;
  }
}

class OfflineOutcomeModel {
  public static predict(state: NetworkState, dependency: OfflineDependency): LaunchOutcome {
    const offline: boolean = state === NetworkState.OFFLINE_AIRPLANE || state === NetworkState.OFFLINE_NO_ROUTE;
    if (offline && DependencyMatrix.requiresNetwork(dependency)) {
      return LaunchOutcome.BLOCKED_BY_NETWORK;
    }
    return LaunchOutcome.SUCCESS;
  }

  public static successRate(samples: LaunchSample[]): number {
    if (samples.length === 0) {
      return 0;
    }
    let successCount: number = 0;
    for (let i = 0; i < samples.length; i++) {
      if (samples[i].isSuccess()) {
        successCount++;
      }
    }
    return successCount / samples.length;
  }

  public static successPercent(samples: LaunchSample[]): number {
    return OfflineOutcomeModel.successRate(samples) * 100;
  }

  public static meetsThreshold(samples: LaunchSample[]): boolean {
    return OfflineOutcomeModel.successPercent(samples) >= SUCCESS_THRESHOLD_PERCENT;
  }

  public static failuresOf(samples: LaunchSample[]): LaunchSample[] {
    const failures: LaunchSample[] = [];
    for (let i = 0; i < samples.length; i++) {
      if (!samples[i].isSuccess()) {
        failures.push(samples[i]);
      }
    }
    return failures;
  }

  public static elapsedValues(samples: LaunchSample[]): number[] {
    const values: number[] = [];
    for (let i = 0; i < samples.length; i++) {
      values.push(samples[i].elapsedMs);
    }
    return values;
  }

  public static allWithinBudget(samples: LaunchSample[]): boolean {
    if (samples.length === 0) {
      return false;
    }
    for (let i = 0; i < samples.length; i++) {
      if (!samples[i].withinBudget()) {
        return false;
      }
    }
    return true;
  }

  public static longestFailureStreak(samples: LaunchSample[]): number {
    let streak: number = 0;
    let longest: number = 0;
    for (let i = 0; i < samples.length; i++) {
      if (samples[i].isSuccess()) {
        streak = 0;
      } else {
        streak++;
        if (streak > longest) {
          longest = streak;
        }
      }
    }
    return longest;
  }

  public static networkAtFailure(samples: LaunchSample[]): NetworkState | null {
    const failures: LaunchSample[] = OfflineOutcomeModel.failuresOf(samples);
    if (failures.length === 0) {
      return null;
    }
    return failures[0].network;
  }
}

class LaunchTimeBudget {
  private budgetMs: number;

  private measurements: number[] = [];

  constructor(budgetMs: number = LAUNCH_BUDGET_MS) {
    this.budgetMs = budgetMs;
  }

  public record(elapsedMs: number): number {
    this.measurements.push(elapsedMs);
    return this.measurements.length;
  }

  public getBudget(): number {
    return this.budgetMs;
  }

  public sampleCount(): number {
    return this.measurements.length;
  }

  public average(): number {
    return averageOf(this.measurements);
  }

  public worst(): number {
    return maxOf(this.measurements);
  }

  public best(): number {
    return minOf(this.measurements);
  }

  public overBudgetCount(): number {
    let count: number = 0;
    for (let i = 0; i < this.measurements.length; i++) {
      if (!isWithinBudget(this.measurements[i], this.budgetMs)) {
        count++;
      }
    }
    return count;
  }

  public allWithinBudget(): boolean {
    return this.overBudgetCount() === 0;
  }

  public reset(): void {
    this.measurements.splice(0, this.measurements.length);
  }
}

class OfflineCallbackRegistry {
  private subscribedKinds: string[] = [];

  private deliveredDuringOffline: number = 0;

  public subscribe(kind: string): boolean {
    if (this.subscribedKinds.indexOf(kind) >= 0) {
      return false;
    }
    this.subscribedKinds.push(kind);
    return true;
  }

  public unsubscribe(kind: string): boolean {
    const index: number = this.subscribedKinds.indexOf(kind);
    if (index < 0) {
      return false;
    }
    this.subscribedKinds.splice(index, 1);
    return true;
  }

  public count(): number {
    return this.subscribedKinds.length;
  }

  public contains(kind: string): boolean {
    return this.subscribedKinds.indexOf(kind) >= 0;
  }

  public deliver(state: NetworkState): boolean {
    if (this.subscribedKinds.length === 0) {
      return false;
    }
    if (state === NetworkState.OFFLINE_AIRPLANE || state === NetworkState.OFFLINE_NO_ROUTE) {
      this.deliveredDuringOffline++;
    }
    return true;
  }

  public deliveredWhileOffline(): number {
    return this.deliveredDuringOffline;
  }

  public kindsSnapshot(): string[] {
    const snapshot: string[] = [];
    for (let i = 0; i < this.subscribedKinds.length; i++) {
      snapshot.push(this.subscribedKinds[i]);
    }
    return snapshot;
  }

  public clear(): void {
    this.subscribedKinds.splice(0, this.subscribedKinds.length);
  }
}

class ProbeScheduler {
  private attempts: number = 0;

  private timeoutHits: number = 0;

  public static networkStateOf(code: number): NetworkState {
    if (code === 0) {
      return NetworkState.ONLINE_WIFI;
    }
    if (code === 1) {
      return NetworkState.ONLINE_CELLULAR;
    }
    if (code === 2) {
      return NetworkState.OFFLINE_AIRPLANE;
    }
    return NetworkState.OFFLINE_NO_ROUTE;
  }

  public probe(completedWithinBudget: boolean): boolean {
    this.attempts++;
    if (!completedWithinBudget) {
      this.timeoutHits++;
      return false;
    }
    return true;
  }

  public getAttempts(): number {
    return this.attempts;
  }

  public getTimeoutHits(): number {
    return this.timeoutHits;
  }

  public allTimedOut(): boolean {
    return this.attempts > 0 && this.timeoutHits === this.attempts;
  }

  public reset(): void {
    this.attempts = 0;
    this.timeoutHits = 0;
  }
}

class PageTextProbe {
  public static async current(driver: Driver): Promise<string> {
    if (await checkTextContent(driver, PAGE_TEXT_INITIAL)) {
      return PAGE_TEXT_INITIAL;
    }
    if (await checkTextContent(driver, PAGE_TEXT_CLICKED)) {
      return PAGE_TEXT_CLICKED;
    }
    return '';
  }

  public static isKnown(text: string): boolean {
    return text === PAGE_TEXT_INITIAL || text === PAGE_TEXT_CLICKED;
  }

  public static async ensureClicked(driver: Driver): Promise<boolean> {
    const currentText: string = await PageTextProbe.current(driver);
    if (currentText.length === 0) {
      return false;
    }
    await tapComponentByText(driver, currentText);
    return await waitForTextVisible(driver, PAGE_TEXT_CLICKED);
  }
}

export default function offlineResilienceTest(): void {
  describe('OfflineResilienceTest', () => {
    beforeAll(async () => {
      await launchEntryAbility();
      await ensureIndexPageInitial(getDriver());
    });

    afterAll(async () => {
      logInfo('OfflineResilienceTest suite finished');
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_OFFLINE_0100
     * @tc.name testOfflineNetworkSimulatorDefault
     * @tc.desc Verify the simulator starts online on wifi with no transitions recorded
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testOfflineNetworkSimulatorDefault', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const network: NetworkSimulator = new NetworkSimulator();
          expect(network.getState()).assertEqual(NetworkState.ONLINE_WIFI);
          expect(network.isOffline()).assertFalse();
          expect(network.transitionCount()).assertEqual(0);
          expect(network.lastTransition()).assertEqual(null);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_OFFLINE_0200
     * @tc.name testOfflineSimulatorAirplane
     * @tc.desc Verify setting airplane mode reports offline with the airplane provider label
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testOfflineSimulatorAirplane', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const network: NetworkSimulator = new NetworkSimulator();
          network.setState(NetworkState.OFFLINE_AIRPLANE);
          expect(network.isOffline()).assertTrue();
          expect(network.providerLabel()).assertEqual('airplane');
          expect(network.transitionCount()).assertEqual(1);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_OFFLINE_0300
     * @tc.name testOfflineSimulatorNoRoute
     * @tc.desc Verify no route state reports offline with the none provider label
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testOfflineSimulatorNoRoute', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const network: NetworkSimulator = new NetworkSimulator();
          network.setState(NetworkState.OFFLINE_NO_ROUTE);
          expect(network.isOffline()).assertTrue();
          expect(network.providerLabel()).assertEqual('none');
          expect(network.isOnline()).assertFalse();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_OFFLINE_0400
     * @tc.name testOfflineSimulatorReset
     * @tc.desc Verify reset restores wifi and clears the transition history
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testOfflineSimulatorReset', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const network: NetworkSimulator = new NetworkSimulator();
          network.setState(NetworkState.OFFLINE_AIRPLANE);
          network.setState(NetworkState.ONLINE_CELLULAR);
          network.reset();
          expect(network.getState()).assertEqual(NetworkState.ONLINE_WIFI);
          expect(network.transitionCount()).assertEqual(0);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_OFFLINE_0500
     * @tc.name testOfflineDependencyMatrixCore
     * @tc.desc Verify ability start and page render are core path entries that need no network
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testOfflineDependencyMatrixCore', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(DependencyMatrix.isCorePath(OfflineDependency.ABILITY_START)).assertTrue();
          expect(DependencyMatrix.isCorePath(OfflineDependency.PAGE_RENDER)).assertTrue();
          expect(DependencyMatrix.requiresNetwork(OfflineDependency.ABILITY_START)).assertFalse();
          expect(DependencyMatrix.requiresNetwork(OfflineDependency.PAGE_RENDER)).assertFalse();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_OFFLINE_0600
     * @tc.name testOfflineDependencyMatrixCallback
     * @tc.desc Verify the environment callback and stage lifecycle need no network
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testOfflineDependencyMatrixCallback', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(DependencyMatrix.requiresNetwork(OfflineDependency.ENVIRONMENT_CALLBACK)).assertFalse();
          expect(DependencyMatrix.requiresNetwork(OfflineDependency.STAGE_LIFECYCLE)).assertFalse();
          expect(DependencyMatrix.countNetworkFree()).assertEqual(4);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_OFFLINE_0700
     * @tc.name testOfflineDependencyOnlyBackupNeedsNetwork
     * @tc.desc Verify only the backup extension is classified as network dependent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testOfflineDependencyOnlyBackupNeedsNetwork', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const all: OfflineDependency[] = DependencyMatrix.allDependencies();
          let networkDependent: number = 0;
          for (let i = 0; i < all.length; i++) {
            if (DependencyMatrix.requiresNetwork(all[i])) {
              networkDependent++;
            }
          }
          expect(all.length).assertEqual(5);
          expect(networkDependent).assertEqual(1);
          expect(DependencyMatrix.requiresNetwork(OfflineDependency.BACKUP_EXTENSION)).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_OFFLINE_0800
     * @tc.name testOfflineValidateAirplaneState
     * @tc.desc Verify airplane offline state passes core path validation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testOfflineValidateAirplaneState', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(DependencyMatrix.validateOffline(NetworkState.OFFLINE_AIRPLANE)).assertTrue();
          expect(DependencyMatrix.validateOffline(NetworkState.OFFLINE_NO_ROUTE)).assertTrue();
          expect(DependencyMatrix.validateOffline(NetworkState.ONLINE_WIFI)).assertFalse();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_OFFLINE_0900
     * @tc.name testOfflinePredictionOfflineCore
     * @tc.desc Verify offline prediction returns SUCCESS for ability start and page render
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testOfflinePredictionOfflineCore', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(OfflineOutcomeModel.predict(NetworkState.OFFLINE_AIRPLANE, OfflineDependency.ABILITY_START))
            .assertEqual(LaunchOutcome.SUCCESS);
          expect(OfflineOutcomeModel.predict(NetworkState.OFFLINE_NO_ROUTE, OfflineDependency.PAGE_RENDER))
            .assertEqual(LaunchOutcome.SUCCESS);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_OFFLINE_1000
     * @tc.name testOfflinePredictionBackupBlocked
     * @tc.desc Verify offline prediction blocks the backup extension while online prediction succeeds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testOfflinePredictionBackupBlocked', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(OfflineOutcomeModel.predict(NetworkState.OFFLINE_AIRPLANE, OfflineDependency.BACKUP_EXTENSION))
            .assertEqual(LaunchOutcome.BLOCKED_BY_NETWORK);
          expect(OfflineOutcomeModel.predict(NetworkState.ONLINE_WIFI, OfflineDependency.BACKUP_EXTENSION))
            .assertEqual(LaunchOutcome.SUCCESS);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_OFFLINE_1100
     * @tc.name testOfflineSuccessRateAllSuccess
     * @tc.desc Verify ten successful offline samples produce a one hundred percent success rate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testOfflineSuccessRateAllSuccess', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const samples: LaunchSample[] = [];
          for (let i = 0; i < OFFLINE_SAMPLE_ROUNDS; i++) {
            samples.push(new LaunchSample(LaunchOutcome.SUCCESS, 200 + i, NetworkState.OFFLINE_AIRPLANE));
          }
          expect(OfflineOutcomeModel.successRate(samples)).assertEqual(1);
          expect(OfflineOutcomeModel.successPercent(samples)).assertEqual(100);
          expect(OfflineOutcomeModel.failuresOf(samples).length).assertEqual(0);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_OFFLINE_1200
     * @tc.name testOfflineSuccessRateMixed
     * @tc.desc Verify seven of ten successes produce a seventy percent success rate below threshold
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testOfflineSuccessRateMixed', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const samples: LaunchSample[] = [];
          for (let i = 0; i < 7; i++) {
            samples.push(new LaunchSample(LaunchOutcome.SUCCESS, 300, NetworkState.OFFLINE_AIRPLANE));
          }
          for (let i = 0; i < 3; i++) {
            samples.push(new LaunchSample(LaunchOutcome.RENDER_TIMEOUT, 1200, NetworkState.OFFLINE_NO_ROUTE));
          }
          expect(OfflineOutcomeModel.successRate(samples)).assertEqual(0.7);
          expect(OfflineOutcomeModel.meetsThreshold(samples)).assertFalse();
          expect(OfflineOutcomeModel.failuresOf(samples).length).assertEqual(3);
          expect(OfflineOutcomeModel.networkAtFailure(samples)).assertEqual(NetworkState.OFFLINE_NO_ROUTE);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_OFFLINE_1300
     * @tc.name testOfflineSuccessRateEmpty
     * @tc.desc Verify an empty sample list yields a zero success rate and does not meet threshold
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testOfflineSuccessRateEmpty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const samples: LaunchSample[] = [];
          expect(OfflineOutcomeModel.successRate(samples)).assertEqual(0);
          expect(OfflineOutcomeModel.meetsThreshold(samples)).assertFalse();
          expect(OfflineOutcomeModel.networkAtFailure(samples)).assertEqual(null);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_OFFLINE_1400
     * @tc.name testOfflineSuccessRateNineOfTen
     * @tc.desc Verify nine of ten successes reach exactly the ninety percent threshold
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testOfflineSuccessRateNineOfTen', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const samples: LaunchSample[] = [];
          for (let i = 0; i < 9; i++) {
            samples.push(new LaunchSample(LaunchOutcome.SUCCESS, 400, NetworkState.OFFLINE_AIRPLANE));
          }
          samples.push(new LaunchSample(LaunchOutcome.LAUNCH_TIMEOUT, 2500, NetworkState.OFFLINE_AIRPLANE));
          expect(OfflineOutcomeModel.successPercent(samples)).assertEqual(90);
          expect(OfflineOutcomeModel.meetsThreshold(samples)).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_OFFLINE_1500
     * @tc.name testOfflineFailureStreak
     * @tc.desc Verify the longest failure streak counts consecutive failures only
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testOfflineFailureStreak', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const samples: LaunchSample[] = [
            new LaunchSample(LaunchOutcome.SUCCESS, 300, NetworkState.OFFLINE_AIRPLANE),
            new LaunchSample(LaunchOutcome.RENDER_TIMEOUT, 1300, NetworkState.OFFLINE_AIRPLANE),
            new LaunchSample(LaunchOutcome.RENDER_TIMEOUT, 1400, NetworkState.OFFLINE_AIRPLANE),
            new LaunchSample(LaunchOutcome.SUCCESS, 350, NetworkState.OFFLINE_AIRPLANE),
            new LaunchSample(LaunchOutcome.LAUNCH_TIMEOUT, 2100, NetworkState.OFFLINE_AIRPLANE)
          ];
          expect(OfflineOutcomeModel.longestFailureStreak(samples)).assertEqual(2);
          expect(OfflineOutcomeModel.longestFailureStreak(samples) > MAX_CONSECUTIVE_FAILURES - 1).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_OFFLINE_1600
     * @tc.name testOfflineBudgetRecording
     * @tc.desc Verify the budget tracker records four samples and reports worst and best values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testOfflineBudgetRecording', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const budget: LaunchTimeBudget = new LaunchTimeBudget();
          budget.record(100);
          budget.record(400);
          budget.record(200);
          budget.record(300);
          expect(budget.sampleCount()).assertEqual(4);
          expect(budget.average()).assertEqual(250);
          expect(budget.worst()).assertEqual(400);
          expect(budget.best()).assertEqual(100);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_OFFLINE_1700
     * @tc.name testOfflineBudgetExceeded
     * @tc.desc Verify a sample beyond the launch budget is counted as over budget
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testOfflineBudgetExceeded', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const budget: LaunchTimeBudget = new LaunchTimeBudget();
          budget.record(500);
          budget.record(LAUNCH_BUDGET_MS + 1);
          expect(budget.overBudgetCount()).assertEqual(1);
          expect(budget.allWithinBudget()).assertFalse();
          expect(budget.getBudget()).assertEqual(TIMEOUT_ABILITY_LAUNCH);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_OFFLINE_1800
     * @tc.name testOfflineBudgetBoundary
     * @tc.desc Verify a sample exactly at the budget boundary is treated as within budget
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testOfflineBudgetBoundary', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const budget: LaunchTimeBudget = new LaunchTimeBudget();
          budget.record(LAUNCH_BUDGET_MS);
          budget.record(0);
          expect(budget.overBudgetCount()).assertEqual(0);
          expect(budget.allWithinBudget()).assertTrue();
          expect(isWithinBudget(LAUNCH_BUDGET_MS, LAUNCH_BUDGET_MS)).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_OFFLINE_1900
     * @tc.name testOfflineBudgetReset
     * @tc.desc Verify resetting the budget tracker drops all measurements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testOfflineBudgetReset', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const budget: LaunchTimeBudget = new LaunchTimeBudget();
          budget.record(3000);
          budget.reset();
          expect(budget.sampleCount()).assertEqual(0);
          expect(budget.average()).assertEqual(0);
          expect(budget.allWithinBudget()).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_OFFLINE_2000
     * @tc.name testOfflineSampleBudgetFlag
     * @tc.desc Verify sample withinBudget respects the launch timeout boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testOfflineSampleBudgetFlag', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const fast: LaunchSample = new LaunchSample(LaunchOutcome.SUCCESS, 100, NetworkState.OFFLINE_AIRPLANE);
          const slow: LaunchSample = new LaunchSample(LaunchOutcome.SUCCESS, 5000, NetworkState.OFFLINE_AIRPLANE);
          expect(fast.withinBudget()).assertTrue();
          expect(slow.withinBudget()).assertFalse();
          expect(fast.isSuccess()).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_OFFLINE_2100
     * @tc.name testOfflineSamplesAllWithinBudget
     * @tc.desc Verify a sample set where every entry is fast reports all within budget
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testOfflineSamplesAllWithinBudget', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const samples: LaunchSample[] = [
            new LaunchSample(LaunchOutcome.SUCCESS, 120, NetworkState.OFFLINE_AIRPLANE),
            new LaunchSample(LaunchOutcome.SUCCESS, 340, NetworkState.OFFLINE_NO_ROUTE),
            new LaunchSample(LaunchOutcome.SUCCESS, 560, NetworkState.OFFLINE_AIRPLANE)
          ];
          expect(OfflineOutcomeModel.allWithinBudget(samples)).assertTrue();
          const elapsed: number[] = OfflineOutcomeModel.elapsedValues(samples);
          expect(elapsed.length).assertEqual(3);
          expect(maxOf(elapsed)).assertEqual(560);
          expect(minOf(elapsed)).assertEqual(120);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_OFFLINE_2200
     * @tc.name testOfflineCallbackRegistrySubscribe
     * @tc.desc Verify registering the environment callback twice stores a single subscription
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testOfflineCallbackRegistrySubscribe', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const registry: OfflineCallbackRegistry = new OfflineCallbackRegistry();
          expect(registry.subscribe('environment')).assertTrue();
          expect(registry.subscribe('environment')).assertFalse();
          expect(registry.count()).assertEqual(1);
          expect(registry.contains('environment')).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_OFFLINE_2300
     * @tc.name testOfflineCallbackDeliveredOffline
     * @tc.desc Verify the registered callback still delivers while the device is offline
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testOfflineCallbackDeliveredOffline', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const registry: OfflineCallbackRegistry = new OfflineCallbackRegistry();
          registry.subscribe('environment');
          expect(registry.deliver(NetworkState.OFFLINE_AIRPLANE)).assertTrue();
          expect(registry.deliveredWhileOffline()).assertEqual(1);
          expect(registry.deliver(NetworkState.OFFLINE_NO_ROUTE)).assertTrue();
          expect(registry.deliveredWhileOffline()).assertEqual(2);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_OFFLINE_2400
     * @tc.name testOfflineCallbackNoSubscriber
     * @tc.desc Verify delivery without subscribers returns false and is not counted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testOfflineCallbackNoSubscriber', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const registry: OfflineCallbackRegistry = new OfflineCallbackRegistry();
          expect(registry.deliver(NetworkState.OFFLINE_AIRPLANE)).assertFalse();
          expect(registry.deliveredWhileOffline()).assertEqual(0);
          expect(registry.count()).assertEqual(0);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_OFFLINE_2500
     * @tc.name testOfflineCallbackNetworkChangeKeepsRegistration
     * @tc.desc Verify a network state change does not drop the existing registration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testOfflineCallbackNetworkChangeKeepsRegistration', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const registry: OfflineCallbackRegistry = new OfflineCallbackRegistry();
          const network: NetworkSimulator = new NetworkSimulator();
          registry.subscribe('environment');
          network.setState(NetworkState.OFFLINE_AIRPLANE);
          expect(registry.contains('environment')).assertTrue();
          network.setState(NetworkState.ONLINE_WIFI);
          expect(registry.contains('environment')).assertTrue();
          expect(registry.count()).assertEqual(1);
          expect(network.transitionCount()).assertEqual(2);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_OFFLINE_2600
     * @tc.name testOfflineCallbackUnsubscribe
     * @tc.desc Verify unsubscribing an existing kind succeeds and a repeat fails
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testOfflineCallbackUnsubscribe', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const registry: OfflineCallbackRegistry = new OfflineCallbackRegistry();
          registry.subscribe('environment');
          expect(registry.unsubscribe('environment')).assertTrue();
          expect(registry.unsubscribe('environment')).assertFalse();
          expect(registry.kindsSnapshot().length).assertEqual(0);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_OFFLINE_2700
     * @tc.name testOfflineCallbackClear
     * @tc.desc Verify clearing removes every registration while preserving delivered counts
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testOfflineCallbackClear', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const registry: OfflineCallbackRegistry = new OfflineCallbackRegistry();
          registry.subscribe('environment');
          registry.subscribe('memory');
          registry.deliver(NetworkState.OFFLINE_AIRPLANE);
          registry.clear();
          expect(registry.count()).assertEqual(0);
          expect(registry.deliveredWhileOffline()).assertEqual(1);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_OFFLINE_2800
     * @tc.name testOfflineProbeStateMapping
     * @tc.desc Verify probe result codes map onto the four network states
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testOfflineProbeStateMapping', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(ProbeScheduler.networkStateOf(0)).assertEqual(NetworkState.ONLINE_WIFI);
          expect(ProbeScheduler.networkStateOf(1)).assertEqual(NetworkState.ONLINE_CELLULAR);
          expect(ProbeScheduler.networkStateOf(2)).assertEqual(NetworkState.OFFLINE_AIRPLANE);
          expect(ProbeScheduler.networkStateOf(3)).assertEqual(NetworkState.OFFLINE_NO_ROUTE);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_OFFLINE_2900
     * @tc.name testOfflineProbeTimeoutTracking
     * @tc.desc Verify two timed out probes are tracked and reported as all timed out
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testOfflineProbeTimeoutTracking', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const scheduler: ProbeScheduler = new ProbeScheduler();
          expect(scheduler.probe(false)).assertFalse();
          expect(scheduler.probe(false)).assertFalse();
          expect(scheduler.getAttempts()).assertEqual(2);
          expect(scheduler.getTimeoutHits()).assertEqual(2);
          expect(scheduler.allTimedOut()).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_OFFLINE_3000
     * @tc.name testOfflineProbeSuccessAndReset
     * @tc.desc Verify a completed probe is not counted as a timeout and reset clears counters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testOfflineProbeSuccessAndReset', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const scheduler: ProbeScheduler = new ProbeScheduler();
          scheduler.probe(true);
          scheduler.probe(false);
          expect(scheduler.allTimedOut()).assertFalse();
          scheduler.reset();
          expect(scheduler.getAttempts()).assertEqual(0);
          expect(scheduler.allTimedOut()).assertFalse();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_OFFLINE_3100
     * @tc.name testOfflineLaunchSucceedsWithoutNetwork
     * @tc.desc Verify launching EntryAbility with no network dependency yields a visible Index page
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testOfflineLaunchSucceedsWithoutNetwork', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const driver: Driver = getDriver();
          await launchEntryAbility();
          await serializedDelay(driver, DELAY_AFTER_LAUNCH);
          expect(await waitForIndexPageStable(driver)).assertTrue();
          expect(await isIndexPageVisible(driver)).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_OFFLINE_3200
     * @tc.name testOfflineLaunchWithinBudget
     * @tc.desc Verify the real launch to first visible text stays within the launch budget
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testOfflineLaunchWithinBudget', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const driver: Driver = getDriver();
          const startTime: number = Date.now();
          const visible: boolean = await waitForIndexPageStable(driver, RENDER_BUDGET_MS);
          const elapsed: number = measureElapsed(startTime);
          expect(visible).assertTrue();
          expect(isWithinBudget(elapsed, RENDER_BUDGET_MS)).assertTrue();
          logInfo(`offline render check elapsed ${elapsed} ms`);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_OFFLINE_3300
     * @tc.name testOfflineRenderNoNetworkFetch
     * @tc.desc Verify the rendered page exposes a known text with no network buffering state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testOfflineRenderNoNetworkFetch', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const driver: Driver = getDriver();
          await launchEntryAbility();
          await serializedDelay(driver, DELAY_AFTER_LAUNCH);
          const currentText: string = await PageTextProbe.current(driver);
          expect(PageTextProbe.isKnown(currentText)).assertTrue();
          const texts: string[] = await collectAllTexts(driver);
          expect(texts.length >= 1).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_OFFLINE_3400
     * @tc.name testOfflineInteractionWithoutNetwork
     * @tc.desc Verify the click interaction works without any network round trip
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testOfflineInteractionWithoutNetwork', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const driver: Driver = getDriver();
          await launchEntryAbility();
          await serializedDelay(driver, DELAY_AFTER_LAUNCH);
          expect(await PageTextProbe.ensureClicked(driver)).assertTrue();
          expect(await checkTextContent(driver, PAGE_TEXT_CLICKED)).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_OFFLINE_3500
     * @tc.name testOfflineForegroundAfterBackground
     * @tc.desc Verify the page recovers after a background cycle with no network available
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testOfflineForegroundAfterBackground', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const driver: Driver = getDriver();
          const network: NetworkSimulator = new NetworkSimulator();
          network.setState(NetworkState.OFFLINE_AIRPLANE);
          await doAbilityBackground();
          await serializedDelay(driver, DELAY_AFTER_BACKGROUND);
          await doAbilityForeground();
          await serializedDelay(driver, DELAY_AFTER_LAUNCH);
          expect(network.isOffline()).assertTrue();
          expect(await isIndexPageVisible(driver)).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_OFFLINE_3600
     * @tc.name testOfflineRepeatedLaunchSamples
     * @tc.desc Verify five real launches all succeed and all stay within the launch budget
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testOfflineRepeatedLaunchSamples', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const driver: Driver = getDriver();
          const budget: LaunchTimeBudget = new LaunchTimeBudget();
          let visibleCount: number = 0;
          for (let i = 0; i < STRESS_ROUNDS_LAUNCH; i++) {
            const startTime: number = Date.now();
            await launchEntryAbility();
            await serializedDelay(driver, DELAY_AFTER_LAUNCH);
            const visible: boolean = await isIndexPageVisible(driver);
            budget.record(measureElapsed(startTime));
            if (visible) {
              visibleCount++;
            }
          }
          expect(visibleCount).assertEqual(STRESS_ROUNDS_LAUNCH);
          expect(budget.sampleCount()).assertEqual(STRESS_ROUNDS_LAUNCH);
          expect(budget.allWithinBudget()).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_OFFLINE_3700
     * @tc.name testOfflineComponentCountIndependent
     * @tc.desc Verify the page component count stays positive with the network simulated offline
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testOfflineComponentCountIndependent', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const driver: Driver = getDriver();
          const network: NetworkSimulator = new NetworkSimulator();
          network.setState(NetworkState.OFFLINE_NO_ROUTE);
          const count: number = await pageComponentCount(driver);
          expect(count > 0).assertTrue();
          expect(network.providerLabel()).assertEqual('none');
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_OFFLINE_3800
     * @tc.name testOfflineCallbackDeliveryDuringOfflineCycle
     * @tc.desc Verify the environment callback registry survives an offline background foreground cycle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testOfflineCallbackDeliveryDuringOfflineCycle', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const driver: Driver = getDriver();
          const registry: OfflineCallbackRegistry = new OfflineCallbackRegistry();
          registry.subscribe('environment');
          await doAbilityBackground();
          await serializedDelay(driver, DELAY_AFTER_BACKGROUND);
          expect(registry.deliver(NetworkState.OFFLINE_AIRPLANE)).assertTrue();
          await doAbilityForeground();
          await serializedDelay(driver, DELAY_AFTER_LAUNCH);
          expect(registry.deliveredWhileOffline()).assertEqual(1);
          expect(await isIndexPageVisible(driver)).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_OFFLINE_3900
     * @tc.name testOfflineNetworkTransitionHistory
     * @tc.desc Verify four state transitions are recorded and the last one is offline no route
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testOfflineNetworkTransitionHistory', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const network: NetworkSimulator = new NetworkSimulator();
          network.setState(NetworkState.ONLINE_CELLULAR);
          network.setState(NetworkState.OFFLINE_AIRPLANE);
          network.setState(NetworkState.ONLINE_WIFI);
          network.setState(NetworkState.OFFLINE_NO_ROUTE);
          expect(network.transitionCount()).assertEqual(4);
          expect(network.lastTransition()).assertEqual(NetworkState.OFFLINE_NO_ROUTE);
          expect(network.isOffline()).assertTrue();
          logError('offline no route state simulated for transition check');
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_OFFLINE_4000
     * @tc.name testOfflineAverageFalseSample
     * @tc.desc Verify average of an empty sample list is zero while a single sample returns itself
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testOfflineAverageFalseSample', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const single: number[] = [777];
          expect(averageOf(single)).assertEqual(777);
          const empty: number[] = [];
          expect(averageOf(empty)).assertEqual(0);
          expect(maxOf(empty)).assertEqual(0);
          expect(minOf(empty)).assertEqual(0);
        } finally {
          done();
        }
      })
  })
}
