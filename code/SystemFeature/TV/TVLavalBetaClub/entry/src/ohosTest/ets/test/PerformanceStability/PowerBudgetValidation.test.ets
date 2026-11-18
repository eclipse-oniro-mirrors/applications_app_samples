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

const MODE_LIGHT: string = 'light';

const MODE_NORMAL: string = 'normal';

const MODE_HEAVY: string = 'heavy';

const RATE_LIGHT: number = 5;

const RATE_NORMAL: number = 20;

const RATE_HEAVY: number = 60;

const DAILY_BUDGET_MWH: number = 200;

const RESERVE_PERCENT: number = 20;

// Computes energy rates for workload modes
class PowerBudgetPolicy {
  public static rateFor(mode: string): number {
    if (mode === MODE_LIGHT) {
      return RATE_LIGHT;
    }
    if (mode === MODE_NORMAL) {
      return RATE_NORMAL;
    }
    if (mode === MODE_HEAVY) {
      return RATE_HEAVY;
    }
    return 0;
  }

  public static isKnown(mode: string): boolean {
    return mode === MODE_LIGHT || mode === MODE_NORMAL || mode === MODE_HEAVY;
  }

  public static energyFor(mode: string, minutes: number): number {
    if (!PowerBudgetPolicy.isKnown(mode) || minutes <= 0) {
      return 0;
    }
    return PowerBudgetPolicy.rateFor(mode) * minutes / 60;
  }

  public static recommendedMode(remainingPercent: number): string {
    if (remainingPercent <= RESERVE_PERCENT) {
      return MODE_LIGHT;
    }
    if (remainingPercent <= 50) {
      return MODE_NORMAL;
    }
    return MODE_HEAVY;
  }
}

// Tracks daily energy budget with reserve protection
class PowerBudget {
  private readonly limitMwh: number;
  private consumedMwh: number = 0;

  constructor(limitMwh: number) {
    this.limitMwh = limitMwh;
  }

  public consume(mwh: number): boolean {
    if (mwh < 0) {
      return false;
    }
    this.consumedMwh += mwh;
    return true;
  }

  public canConsume(mwh: number): boolean {
    return mwh >= 0 && this.consumedMwh + mwh <= this.limitMwh;
  }

  public getConsumed(): number {
    return this.consumedMwh;
  }

  public getLimit(): number {
    return this.limitMwh;
  }

  public remaining(): number {
    const remaining = this.limitMwh - this.consumedMwh;
    return remaining < 0 ? 0 : remaining;
  }

  public remainingPercent(): number {
    return this.limitMwh <= 0 ? 0 : this.remaining() * 100 / this.limitMwh;
  }

  public isOverBudget(): boolean {
    return this.consumedMwh > this.limitMwh;
  }

  public isInReserve(): boolean {
    return this.remainingPercent() <= RESERVE_PERCENT;
  }

  public reset(): void {
    this.consumedMwh = 0;
  }
}

// Aggregates budget checks
class BudgetReport {
  private checks: string[] = [];
  private failureItems: string[] = [];

  public check(name: string, passed: boolean): void {
    this.checks.push(name);
    if (!passed) {
      this.failureItems.push(name);
    }
  }

  public count(): number {
    return this.checks.length;
  }

  public failures(): string[] {
    return [...this.failureItems];
  }

  public isPassed(): boolean {
    return this.checks.length > 0 && this.failureItems.length === 0;
  }

  public reset(): void {
    this.checks = [];
    this.failureItems = [];
  }
}

// Projects remaining runtime from the current consumption rate
class RuntimeProjector {
  public static hoursRemaining(remainingMwh: number, rateMwhPerHour: number): number {
    if (remainingMwh <= 0 || rateMwhPerHour <= 0) {
      return 0;
    }
    return remainingMwh / rateMwhPerHour;
  }

  public static minutesForMode(mode: string, budgetMwh: number): number {
    const rate = PowerBudgetPolicy.rateFor(mode);
    if (rate <= 0 || budgetMwh <= 0) {
      return 0;
    }
    return Math.floor(budgetMwh / rate * 60);
  }

  public static isProjectionAcceptable(minutes: number, targetMinutes: number): boolean {
    return minutes >= targetMinutes;
  }

  public static modeMix(lightMinutes: number, normalMinutes: number,
    heavyMinutes: number): number {
    return PowerBudgetPolicy.energyFor(MODE_LIGHT, lightMinutes) +
      PowerBudgetPolicy.energyFor(MODE_NORMAL, normalMinutes) +
      PowerBudgetPolicy.energyFor(MODE_HEAVY, heavyMinutes);
  }
}

export default function powerBudgetValidationTest() {
  describe('PowerBudgetValidation_Test', () => {

    it('policy_should_map_modes_to_rates', 0, () => {
      expect(PowerBudgetPolicy.rateFor(MODE_LIGHT)).assertEqual(RATE_LIGHT);
      expect(PowerBudgetPolicy.rateFor(MODE_NORMAL)).assertEqual(RATE_NORMAL);
      expect(PowerBudgetPolicy.rateFor(MODE_HEAVY)).assertEqual(RATE_HEAVY);
      expect(PowerBudgetPolicy.rateFor('unknown')).assertEqual(0);
      expect(PowerBudgetPolicy.isKnown(MODE_LIGHT)).assertTrue();
      expect(PowerBudgetPolicy.isKnown('unknown')).assertFalse();
    });

    it('policy_should_compute_energy', 0, () => {
      expect(PowerBudgetPolicy.energyFor(MODE_LIGHT, 60)).assertEqual(RATE_LIGHT);
      expect(PowerBudgetPolicy.energyFor(MODE_NORMAL, 30)).assertEqual(RATE_NORMAL / 2);
      expect(PowerBudgetPolicy.energyFor(MODE_HEAVY, 120)).assertEqual(RATE_HEAVY * 2);
      expect(PowerBudgetPolicy.energyFor(MODE_HEAVY, 0)).assertEqual(0);
      expect(PowerBudgetPolicy.energyFor('unknown', 60)).assertEqual(0);
    });

    it('policy_should_recommend_mode', 0, () => {
      expect(PowerBudgetPolicy.recommendedMode(RESERVE_PERCENT)).assertEqual(MODE_LIGHT);
      expect(PowerBudgetPolicy.recommendedMode(10)).assertEqual(MODE_LIGHT);
      expect(PowerBudgetPolicy.recommendedMode(30)).assertEqual(MODE_NORMAL);
      expect(PowerBudgetPolicy.recommendedMode(50)).assertEqual(MODE_NORMAL);
      expect(PowerBudgetPolicy.recommendedMode(80)).assertEqual(MODE_HEAVY);
    });

    it('budget_should_consume_and_report', 0, () => {
      const budget = new PowerBudget(DAILY_BUDGET_MWH);
      expect(budget.getLimit()).assertEqual(DAILY_BUDGET_MWH);
      expect(budget.canConsume(100)).assertTrue();
      expect(budget.consume(100)).assertTrue();
      expect(budget.getConsumed()).assertEqual(100);
      expect(budget.remaining()).assertEqual(100);
      expect(budget.remainingPercent()).assertEqual(50);
      expect(budget.isOverBudget()).assertFalse();
    });

    it('budget_should_reject_invalid_consumption', 0, () => {
      const budget = new PowerBudget(100);
      expect(budget.consume(-1)).assertFalse();
      expect(budget.canConsume(-1)).assertFalse();
      expect(budget.canConsume(60)).assertTrue();
      budget.consume(60);
      expect(budget.canConsume(50)).assertFalse();
      expect(budget.canConsume(40)).assertTrue();
      expect(budget.getConsumed()).assertEqual(60);
    });

    it('budget_should_detect_over_budget', 0, () => {
      const budget = new PowerBudget(100);
      budget.consume(120);
      expect(budget.isOverBudget()).assertTrue();
      expect(budget.remaining()).assertEqual(0);
      expect(budget.remainingPercent()).assertEqual(0);
      budget.reset();
      expect(budget.getConsumed()).assertEqual(0);
      expect(budget.isOverBudget()).assertFalse();
    });

    it('budget_should_detect_reserve', 0, () => {
      const budget = new PowerBudget(100);
      expect(budget.isInReserve()).assertFalse();
      budget.consume(80);
      expect(budget.remainingPercent()).assertEqual(20);
      expect(budget.isInReserve()).assertTrue();
      expect(PowerBudgetPolicy.recommendedMode(budget.remainingPercent())).assertEqual(MODE_LIGHT);
    });

    it('projector_should_estimate_runtime', 0, () => {
      expect(RuntimeProjector.hoursRemaining(100, 20)).assertEqual(5);
      expect(RuntimeProjector.hoursRemaining(100, 0)).assertEqual(0);
      expect(RuntimeProjector.hoursRemaining(0, 20)).assertEqual(0);
      expect(RuntimeProjector.minutesForMode(MODE_NORMAL, 20)).assertEqual(60);
      expect(RuntimeProjector.minutesForMode(MODE_HEAVY, RATE_HEAVY)).assertEqual(60);
    });

    it('projector_should_validate_projection', 0, () => {
      expect(RuntimeProjector.isProjectionAcceptable(60, 30)).assertTrue();
      expect(RuntimeProjector.isProjectionAcceptable(30, 60)).assertFalse();
      expect(RuntimeProjector.isProjectionAcceptable(60, 60)).assertTrue();
      expect(RuntimeProjector.minutesForMode('unknown', 100)).assertEqual(0);
      expect(RuntimeProjector.minutesForMode(MODE_LIGHT, 0)).assertEqual(0);
    });

    it('projector_should_compute_mode_mix', 0, () => {
      const mixed = RuntimeProjector.modeMix(60, 60, 60);
      expect(mixed).assertEqual(RATE_LIGHT + RATE_NORMAL + RATE_HEAVY);
      expect(RuntimeProjector.modeMix(0, 0, 0)).assertEqual(0);
      expect(RuntimeProjector.modeMix(60, 0, 0)).assertEqual(RATE_LIGHT);
      expect(RuntimeProjector.modeMix(0, 0, 60)).assertEqual(RATE_HEAVY);
    });

    it('budget_flow_should_plan_day', 0, () => {
      const budget = new PowerBudget(DAILY_BUDGET_MWH);
      const report = new BudgetReport();
      const lightMinutes = 120;
      const normalMinutes = 180;
      const heavyMinutes = 30;
      const energy = RuntimeProjector.modeMix(lightMinutes, normalMinutes, heavyMinutes);
      expect(budget.canConsume(energy)).assertTrue();
      budget.consume(energy);
      report.check('budget', !budget.isOverBudget());
      report.check('reserve', !budget.isInReserve());
      const remaining = budget.remaining();
      const hours = RuntimeProjector.hoursRemaining(remaining, RATE_NORMAL);
      report.check('runtime', hours > 0);
      expect(report.isPassed()).assertTrue();
      expect(remaining).assertEqual(DAILY_BUDGET_MWH - energy);
      expect(hours).assertEqual(remaining / RATE_NORMAL);
    });

    it('budget_constants_should_be_stable', 0, () => {
      expect(RATE_LIGHT).assertEqual(5);
      expect(RATE_NORMAL).assertEqual(20);
      expect(RATE_HEAVY).assertEqual(60);
      expect(DAILY_BUDGET_MWH).assertEqual(200);
      expect(RESERVE_PERCENT).assertEqual(20);
      expect(MODE_HEAVY).assertEqual('heavy');
    });
  });
}

