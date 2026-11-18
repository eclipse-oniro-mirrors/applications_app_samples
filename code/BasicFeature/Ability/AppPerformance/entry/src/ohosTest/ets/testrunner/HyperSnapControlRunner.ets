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

import { abilityDelegatorRegistry, TestRunner } from '@kit.TestKit';
import { hyperSnapManager } from '@kit.AbilityKit';
import { BusinessError, systemDateTime } from '@kit.BasicServicesKit';
import { logInfo } from '../../../main/ets/core/Logger';
import { BUNDLE, parameterSummary, runRunner } from '../support/TestLog';

interface ControlResult {
  api: string;
  argument: string;
  status: string;
  code: number;
  message: string;
  wallTimeMs: number;
  requestElapsedMs: number;
  meaning: string;
}

function argument(name: string): string {
  const parameters = abilityDelegatorRegistry.getArguments().parameters;
  const plain = parameters[name];
  const prefixed = parameters[`-s ${name}`];
  return typeof plain === 'string' ? plain : (typeof prefixed === 'string' ? prefixed : '');
}

function control(api: string, value: string): ControlResult {
  logInfo(`${BUNDLE} HyperSnapControlRunner ${api} begin; enabledArgument=${value}`);
  const started = systemDateTime.getUptime(systemDateTime.TimeType.STARTUP, false);
  const row: ControlResult = {
    api: api,
    argument: value,
    status: 'returned',
    code: 0,
    message: '',
    wallTimeMs: Date.now(),
    requestElapsedMs: 0,
    meaning: 'Request returned only. Not proof of snapshot creation, use, or acceleration.'
  };
  try {
    if (api === 'hyperSnapManager.setHyperSnapEnabled') {
      if (typeof hyperSnapManager.setHyperSnapEnabled !== 'function') {
        row.status = 'unavailable';
        row.code = -1;
        row.message = 'Runtime setHyperSnapEnabled is not a function';
      } else {
        hyperSnapManager.setHyperSnapEnabled(value === 'true');
      }
    } else {
      if (typeof hyperSnapManager.requestRebuildHyperSnap !== 'function') {
        row.status = 'unavailable';
        row.code = -1;
        row.message = 'Runtime requestRebuildHyperSnap is not a function';
      } else {
        hyperSnapManager.requestRebuildHyperSnap();
      }
    }
  } catch (error) {
    const detail = error as BusinessError;
    row.status = 'rejected';
    row.code = detail !== null && detail !== undefined && typeof detail.code === 'number' ? detail.code : -1;
    row.message = detail !== null && detail !== undefined && typeof detail.message === 'string' ?
      detail.message : String(error);
  }
  row.requestElapsedMs = systemDateTime.getUptime(systemDateTime.TimeType.STARTUP, false) - started;
  logInfo(`${BUNDLE} HyperSnapControlRunner ${api} end; status=${row.status}, code=${row.code}`);
  return row;
}

/** Test-only control of EXISTING APIs. Run once before a group, never inside measured launches. */
export default class HyperSnapControlRunner implements TestRunner {
  onPrepare(): void { logInfo(`${BUNDLE} HyperSnapControlRunner prepare`); }

  async onRun(): Promise<void> {
    await runRunner('HyperSnapControlRunner', (): Promise<void> => this.run());
  }

  private async run(): Promise<void> {
    const delegator = abilityDelegatorRegistry.getAbilityDelegator();
    // Inspect only the documented controls; never dump arbitrary runner arguments or credentials.
    logInfo(`${BUNDLE} HyperSnapControlRunner arguments received; validating enabled/rebuild`);
    const enabled = argument('enabled');
    const rebuildValue = argument('rebuild');
    const rebuild = rebuildValue.length === 0 ? 'false' : rebuildValue;
    if ((enabled !== 'true' && enabled !== 'false') || (rebuild !== 'true' && rebuild !== 'false') ||
      (enabled === 'false' && rebuild === 'true')) {
      await delegator.finishTest('Argument error: -s enabled true|false [-s rebuild true|false]; ' +
        'rebuild requires enabled=true. No API dispatched.', 1);
      return;
    }
    const setting = control('hyperSnapManager.setHyperSnapEnabled', enabled);
    await delegator.print(`[HYPERSNAP_CONTROL] api=${setting.api}, status=${setting.status}, ` +
      `code=${setting.code}, elapsedMs=${setting.requestElapsedMs}, message=${parameterSummary(setting.message)}`);
    if (setting.status !== 'returned') {
      await delegator.finishTest(`${setting.api}: ${setting.status}, code=${setting.code}, ` +
        `message=${parameterSummary(setting.message)}`, 1);
      return;
    }
    if (rebuild === 'true') {
      const request = control('hyperSnapManager.requestRebuildHyperSnap', '');
      await delegator.print(`[HYPERSNAP_CONTROL] api=${request.api}, status=${request.status}, ` +
        `code=${request.code}, elapsedMs=${request.requestElapsedMs}, message=${parameterSummary(request.message)}`);
      if (request.status !== 'returned') {
        await delegator.finishTest(`${request.api}: ${request.status}, code=${request.code}, ` +
          `message=${parameterSummary(request.message)}`, 1);
        return;
      }
    }
    await delegator.finishTest(`HyperSnap control request returned: enabled=${enabled}, rebuild=${rebuild}. ` +
      'Actual use requires AbilityStage.onLaunchFromHyperSnap evidence.', 0);
  }
}
