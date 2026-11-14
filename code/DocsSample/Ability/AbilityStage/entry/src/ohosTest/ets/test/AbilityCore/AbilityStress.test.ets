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
  ensureIndexPageInitial,
  logInfo,
  logError,
  sleepMs,
  launchEntryAbility,
  doAbilityForeground,
  doAbilityBackground,
  waitForIndexPageStable,
  waitForTextVisible,
  pageComponentCount,
  checkComponentExists,
  DELAY_AFTER_BACKGROUND,
  DELAY_AFTER_LAUNCH,
  STRESS_ROUNDS_LAUNCH,
  STRESS_ROUNDS_LIFECYCLE,
  TOLERANCE_COMPONENT_COUNT,
  PAGE_TEXT_INITIAL,
  PAGE_TEXT_CLICKED
} from '../Shared/SharedDriver';

interface StressRoundOutcome {
  round: number;
  readable: boolean;
  componentCount: number;
  elapsedMs: number;
}

class StressLedger {
  private outcomes: StressRoundOutcome[] = [];
  private failures: number = 0;

  public add(outcome: StressRoundOutcome): void {
    this.outcomes.push(outcome);
    if (!outcome.readable) {
      this.failures++;
    }
  }

  public getRoundCount(): number {
    return this.outcomes.length;
  }

  public getFailureCount(): number {
    return this.failures;
  }

  public getSuccessCount(): number {
    return this.outcomes.length - this.failures;
  }

  public getMinComponentCount(): number {
    if (this.outcomes.length === 0) {
      return 0;
    }
    let minValue: number = this.outcomes[0].componentCount;
    for (let i = 1; i < this.outcomes.length; i++) {
      if (this.outcomes[i].componentCount < minValue) {
        minValue = this.outcomes[i].componentCount;
      }
    }
    return minValue;
  }

  public getMaxComponentCount(): number {
    if (this.outcomes.length === 0) {
      return 0;
    }
    let maxValue: number = this.outcomes[0].componentCount;
    for (let i = 1; i < this.outcomes.length; i++) {
      if (this.outcomes[i].componentCount > maxValue) {
        maxValue = this.outcomes[i].componentCount;
      }
    }
    return maxValue;
  }

  public getSlowestRoundMs(): number {
    if (this.outcomes.length === 0) {
      return 0;
    }
    let slowest: number = this.outcomes[0].elapsedMs;
    for (let i = 1; i < this.outcomes.length; i++) {
      if (this.outcomes[i].elapsedMs > slowest) {
        slowest = this.outcomes[i].elapsedMs;
      }
    }
    return slowest;
  }

  public isWithinTolerance(): boolean {
    return this.getMaxComponentCount() - this.getMinComponentCount() <= TOLERANCE_COMPONENT_COUNT;
  }

  public allReadable(): boolean {
    return this.outcomes.length > 0 && this.failures === 0;
  }
}

export default function abilityStressTest(): void {
  describe('AbilityStressTest', () => {
    let driver: Driver = getDriver();

    beforeAll(async () => {
      logInfo('AbilityStressTest beforeAll: preparing EntryAbility for stress rounds');
      try {
        await launchEntryAbility();
        await waitForIndexPageStable(driver);
        await ensureIndexPageInitial(driver);
      } catch (e) {
        logError(`AbilityStressTest beforeAll error: ${e}`);
      }
    })

    afterAll(async () => {
      try {
        await doAbilityForeground();
        await sleepMs(DELAY_AFTER_BACKGROUND);
      } catch (e) {
        logError(`AbilityStressTest afterAll error: ${e}`);
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_ABILITYSTRESS_0100
     * @tc.name testStressRepeatedLaunchRounds
     * @tc.desc Verify STRESS_ROUNDS_LAUNCH rapid launch rounds all complete with readable page and no exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStressRepeatedLaunchRounds', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const ledger: StressLedger = new StressLedger();
          for (let round = 1; round <= STRESS_ROUNDS_LAUNCH; round++) {
            const startTime: number = Date.now();
            await launchEntryAbility();
            await sleepMs(DELAY_AFTER_LAUNCH);
            const stable: boolean = await waitForIndexPageStable(driver);
            const readable: boolean = stable && (await waitForTextVisible(driver, PAGE_TEXT_INITIAL, 500) ||
              await waitForTextVisible(driver, PAGE_TEXT_CLICKED, 500));
            ledger.add({
              round: round,
              readable: readable,
              componentCount: await pageComponentCount(driver),
              elapsedMs: Date.now() - startTime
            });
            logInfo(`testStressRepeatedLaunchRounds: round ${round} readable ${readable}`);
          }
          expect(ledger.getRoundCount()).assertEqual(STRESS_ROUNDS_LAUNCH);
          expect(ledger.getFailureCount()).assertEqual(0);
          expect(ledger.allReadable()).assertTrue();
          expect(ledger.getSuccessCount()).assertEqual(STRESS_ROUNDS_LAUNCH);
          expect(ledger.getMinComponentCount() > 0).assertTrue();
          expect(ledger.isWithinTolerance()).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ABILITYSTRESS_0200
     * @tc.name testStressBackgroundForegroundRounds
     * @tc.desc Verify STRESS_ROUNDS_LIFECYCLE foreground background switches keep the page readable every round
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStressBackgroundForegroundRounds', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const ledger: StressLedger = new StressLedger();
          for (let round = 1; round <= STRESS_ROUNDS_LIFECYCLE; round++) {
            const startTime: number = Date.now();
            await doAbilityBackground();
            await sleepMs(DELAY_AFTER_BACKGROUND);
            await doAbilityForeground();
            await sleepMs(DELAY_AFTER_BACKGROUND);
            const readable: boolean = await waitForIndexPageStable(driver);
            ledger.add({
              round: round,
              readable: readable,
              componentCount: await pageComponentCount(driver),
              elapsedMs: Date.now() - startTime
            });
            logInfo(`testStressBackgroundForegroundRounds: round ${round} readable ${readable}`);
          }
          expect(ledger.getRoundCount()).assertEqual(STRESS_ROUNDS_LIFECYCLE);
          expect(ledger.getFailureCount()).assertEqual(0);
          expect(ledger.getSlowestRoundMs() > 0).assertTrue();
          expect(ledger.isWithinTolerance()).assertTrue();
          expect(await checkComponentExists(driver, 'Text')).assertTrue();
        } finally {
          done();
        }
      })
  })
}
