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
 * Registering 62 suites and 3,798 specs in one synchronous testsuite() call
 * already blocks the main thread long enough for the system watchdog to kill
 * the process before the first case runs. Register and execute one suite per
 * Hypium task, and end each task with a real bundle manager round trip so the
 * next batch starts with a fresh watchdog window.
 */
// Only model suites remain, so chunks of 18 keep the whole run to three Hypium
// tasks. Re-initialising Hypium once per suite stopped reporting after roughly
// six tasks, which is what ended earlier runs early.
const SUITES_PER_BATCH: number = 18;
// Only silence is fatal: a long but active suite keeps printing case results,
// so the watchdog is re-armed on every forwarded message instead of capping
// the total suite duration.
const SILENCE_MS: number = 180000;

let hasFailure: boolean = false;

class BatchDelegator {
  private readonly realDelegator: AbilityDelegatorRegistry.AbilityDelegator;
  private readonly finishHandler: (message: string, code: number, callback: () => void) => void;
  private readonly onActivity: () => void;

  constructor(realDelegator: AbilityDelegatorRegistry.AbilityDelegator,
    finishHandler: (message: string, code: number, callback: () => void) => void,
    onActivity: () => void) {
    this.realDelegator = realDelegator;
    this.finishHandler = finishHandler;
    this.onActivity = onActivity;
  }

  printSync(message: string): void {
    this.onActivity();
    if (message.includes('stream=Error in ')) {
      hasFailure = true;
    }
    // Hypium prints a Tests run summary for every task. Forwarding every batch
    // makes DevEco attach a summary to the last case of the batch and mark it
    // as an error even when all cases passed, so only the final one is sent.
    if (message.includes('OHOS_REPORT_RESULT')) {
      return;
    }
    this.realDelegator.printSync(message);
  }

  print(message: string): Promise<void> {
    this.onActivity();
    if (message.includes('OHOS_REPORT_RESULT')) {
      return Promise.resolve();
    }
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
  let batchFinished: boolean = false;
  let batchWatchdog: number = -1;
  hilog.info(0x0000, 'testTag', 'batch %{public}d start', startIndex);
  // A fixed per-batch timeout used to kill long UI suites halfway through.
  // Re-arm on every report instead: only a batch that stops reporting for
  // SILENCE_MS is treated as hung.
  const armWatchdog = (): void => {
    if (batchFinished) {
      return;
    }
    if (batchWatchdog !== -1) {
      clearTimeout(batchWatchdog);
    }
    batchWatchdog = setTimeout(() => {
      if (batchFinished) {
        return;
      }
      batchFinished = true;
      hilog.error(0x0000, 'testTag', 'batch %{public}d silent for %{public}d ms', startIndex, SILENCE_MS);
      realDelegator.finishTest('batch silent at ' + startIndex.toString(), -1, () => {
      });
    }, SILENCE_MS);
  };
  armWatchdog();
  const batchDelegator: BatchDelegator = new BatchDelegator(realDelegator,
    (message: string, code: number, callback: () => void): void => {
      if (!batchFinished) {
        batchFinished = true;
        clearTimeout(batchWatchdog);
      }
      hilog.info(0x0000, 'testTag', 'batch %{public}d done, cost %{public}d ms',
        startIndex, Date.now() - batchStartTime);
      if (isLastBatch) {
        hilog.info(0x0000, 'testTag', '%{public}s', 'all test suites finished');
        realDelegator.finishTest(message, hasFailure ? -1 : code, callback);
        return;
      }
      // A non-zero timer ends the batch task reliably; the bundle manager IPC
      // used before could stop resolving after several batches.
      setTimeout(() => {
        runBatch(realDelegator, abilityDelegatorArguments, groups, endIndex);
      }, 100);
    }, armWatchdog);
  Hypium.hypiumTest(batchDelegator, abilityDelegatorArguments, () => {
    for (let index: number = startIndex; index < endIndex; index++) {
      groups[index]();
    }
  });
}

export function runSuitesInBatches(groups: Array<() => void>): void {
  const abilityDelegator: AbilityDelegatorRegistry.AbilityDelegator =
    AbilityDelegatorRegistry.getAbilityDelegator();
  const abilityDelegatorArguments: AbilityDelegatorRegistry.AbilityDelegatorArgs =
    AbilityDelegatorRegistry.getArguments();
  const parameters: Record<string, string> =
    abilityDelegatorArguments.parameters as Record<string, string>;
  const classFilter: string = parameters['class'] ?? parameters['-s class'] ?? '';
  const classCount: number = classFilter === '' ? 0 : classFilter.split(',').length;
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
}
