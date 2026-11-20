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

import { it } from '@ohos/hypium';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { systemDateTime } from '@kit.BasicServicesKit';
import { logInfo, logWarn, logError } from '../../../main/ets/core/Logger';
import { testCaseName, parameterSummary } from './TestLog';
export { BUNDLE } from './TestLog';

export const CASE_TIMEOUT_MS: number = 10000;
export const RUNNER_TIMEOUT_MS: number = 12000;
export type ScenarioBody = () => void | Promise<void>;

export interface CaseResult {
  name: string;
  status: string;
  durationMs: number;
  error: string;
}

const results: CaseResult[] = [];

export function caseResults(): CaseResult[] {
  return results.slice();
}

export function boundedIt(name: string, level: number, body: ScenarioBody): void {
  scenario(name, body, level);
}

export function scenario(legacyName: string, body: ScenarioBody, level: number = 0): void {
  const name = testCaseName(legacyName);
  it(name, level, async (): Promise<void> => {
    logInfo(`${name} begin; legacy=${legacyName}`);
    const started = systemDateTime.getUptime(systemDateTime.TimeType.STARTUP, false);
    let timer: number = -1;
    let failed: boolean = false;
    let failure: Error | undefined = undefined;
    const deadline = new Promise<void>((_resolve, reject): void => {
      timer = setTimeout((): void => {
        reject(new Error(`Case exceeded ${CASE_TIMEOUT_MS} ms: ${name}`));
      }, CASE_TIMEOUT_MS);
    });
    try {
      await Promise.race([Promise.resolve().then(body), deadline]);
    } catch (error) {
      failed = true;
      failure = error as Error;
    } finally {
      clearTimeout(timer);
    }
    const duration = systemDateTime.getUptime(systemDateTime.TimeType.STARTUP, false) - started;
    if (duration > CASE_TIMEOUT_MS && !failed) {
      failed = true;
      failure = new Error(`Case exceeded ${CASE_TIMEOUT_MS} ms: ${name}`);
    }
    const result: CaseResult = {
      name: name,
      // Hypium may record failed expectations without throwing. This is body telemetry only.
      status: failed ? 'body-threw' : 'body-returned',
      durationMs: duration,
      error: failed ? parameterSummary(failure) : ''
    };
    results.push(result);
    try {
      await abilityDelegatorRegistry.getAbilityDelegator().print(`[AP_CASE] ${JSON.stringify(result)}`);
    } catch (error) {
      logWarn(`${name} result output failed: ${parameterSummary(error)}`);
      logInfo(`[AP_CASE] ${JSON.stringify(result)}`);
    }
    if (failed) {
      logError(`${name} failure: ${parameterSummary(failure)}`);
    }
    logInfo(`${name} end: ${result.status}; ${duration} ms; verdict=Hypium`);
    if (failed) {
      throw failure as Error;
    }
  });
}
