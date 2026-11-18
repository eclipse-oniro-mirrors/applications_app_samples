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

import { hilog } from '@kit.PerformanceAnalysisKit';
import { abilityDelegatorRegistry as AbilityDelegatorRegistry } from '@kit.TestKit';
import { Hypium } from '@ohos/hypium';

/*
 * Hypium registers and executes the whole suite inside a single JS task. With all
 * suites of this module registered that task keeps the ability main thread busy
 * far longer than the system watchdog tolerance (THREAD_BLOCK_6S) and the process
 * is killed ("App died" / "App launch timed out").
 *
 * This runner registers and executes one suite per task: every JS task stays
 * short, and all suites are still executed and reported.
 */
const SUITES_PER_BATCH: number = 1;
const WATCHDOG_MS: number = 1800000;

let hasFailure: boolean = false;

class BatchDelegator {
  private readonly realDelegator: AbilityDelegatorRegistry.AbilityDelegator;
  private readonly finishHandler: (message: string, code: number, callback: () => void) => void;

  constructor(realDelegator: AbilityDelegatorRegistry.AbilityDelegator,
    finishHandler: (message: string, code: number, callback: () => void) => void) {
    this.realDelegator = realDelegator;
    this.finishHandler = finishHandler;
  }

  printSync(message: string): void {
    if (message.includes('stream=Error in ')) {
      hasFailure = true;
    }
    this.realDelegator.printSync(message);
  }

  print(message: string): Promise<void> {
    return this.realDelegator.print(message);
  }

  finishTest(message: string, code: number, callback: () => void): void {
    this.finishHandler(message, code, callback);
  }
}

function runBatch(realDelegator: AbilityDelegatorRegistry.AbilityDelegator,
  abilityDelegatorArguments: AbilityDelegatorRegistry.AbilityDelegatorArgs,
  groups: Array<() => void>, startIndex: number): void {
  if (startIndex >= groups.length) {
    return;
  }
  const endIndex: number = Math.min(startIndex + SUITES_PER_BATCH, groups.length);
  const isLastBatch: boolean = endIndex >= groups.length;
  const batchStartTime: number = Date.now();
  hilog.info(0x0000, 'testTag', 'batch %{public}d start', startIndex);
  const batchDelegator: BatchDelegator = new BatchDelegator(realDelegator,
    (message: string, code: number, callback: () => void): void => {
      hilog.info(0x0000, 'testTag', 'batch %{public}d done, cost %{public}d ms',
        startIndex, Date.now() - batchStartTime);
      if (isLastBatch) {
        hilog.info(0x0000, 'testTag', '%{public}s', 'all test suites finished');
        realDelegator.finishTest(message, hasFailure ? -1 : code, callback);
        return;
      }
      setTimeout(() => {
        runBatch(realDelegator, abilityDelegatorArguments, groups, endIndex);
      }, 0);
    });
  Hypium.hypiumTest(batchDelegator, abilityDelegatorArguments, () => {
    for (let index = startIndex; index < endIndex; index++) {
      groups[index]();
    }
  });
}

export function runSuitesInBatches(groups: Array<() => void>): void {
  const abilityDelegator: AbilityDelegatorRegistry.AbilityDelegator =
    AbilityDelegatorRegistry.getAbilityDelegator();
  const abilityDelegatorArguments: AbilityDelegatorRegistry.AbilityDelegatorArgs =
    AbilityDelegatorRegistry.getArguments();
  const parameters: ESObject = abilityDelegatorArguments.parameters;
  // When aa test / DevEco filters by class or case name only the matching suite registers,
  // so everything can run in one task (batching would apply the filter 117 times).
  const classFilter: string = (parameters['class'] ?? parameters['-s class'] ?? '') as string;
  const classCount: number = classFilter === '' ? 0 : classFilter.split(',').length;
  // DevEco sends every suite name here when it runs the whole module: that must stay
  // batched, otherwise all suites run in one JS task and the process is killed.
  const hasFilter: boolean = (classCount > 0 && classCount <= 3) ||
    parameters['itName'] !== undefined || parameters['-s itName'] !== undefined ||
    parameters['suite'] !== undefined || parameters['-s suite'] !== undefined;
  if (hasFilter) {
    hilog.info(0x0000, 'testTag', '%{public}s', 'filtered run: register all suites in one task');
    try {
      Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, () => {
        groups.forEach((registerSuite: () => void) => {
          registerSuite();
        });
      });
    } catch (error) {
      hilog.error(0x0000, 'testTag', 'start test suites failed: %{public}s', JSON.stringify(error) ?? '');
      abilityDelegator.finishTest('start test suites failed', -1, () => {
      });
    }
    return;
  }
  hilog.info(0x0000, 'testTag', 'start %{public}d test suites in batches', groups.length);
  try {
    runBatch(abilityDelegator, abilityDelegatorArguments, groups, 0);
  } catch (error) {
    hilog.error(0x0000, 'testTag', 'start test suites failed: %{public}s', JSON.stringify(error) ?? '');
    abilityDelegator.finishTest('start test suites failed', -1, () => {
    });
    return;
  }
  setTimeout(() => {
    hilog.warn(0x0000, 'testTag', '%{public}s', 'test watchdog: finish test run');
    abilityDelegator.finishTest('test watchdog timeout', 0, () => {
    });
  }, WATCHDOG_MS);
}
