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
    row.code = typeof detail.code === 'number' ? detail.code : -1;
    row.message = typeof detail.message === 'string' ? detail.message : String(error);
  }
  row.requestElapsedMs = systemDateTime.getUptime(systemDateTime.TimeType.STARTUP, false) - started;
  return row;
}

/** Test-only control of EXISTING APIs. Run once before a group, never inside measured launches. */
export default class HyperSnapControlRunner implements TestRunner {
  onPrepare(): void {}

  async onRun(): Promise<void> {
    const delegator = abilityDelegatorRegistry.getAbilityDelegator();
    await delegator.print(
      `[HYPERSNAP_CONTROL_ARGS] ${JSON.stringify(abilityDelegatorRegistry.getArguments().parameters)}`);
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
    await delegator.print(`[HYPERSNAP_CONTROL] ${JSON.stringify(setting)}`);
    if (setting.status !== 'returned') {
      await delegator.finishTest(`${setting.api}: ${setting.status}, code=${setting.code}, ${setting.message}`, 1);
      return;
    }
    if (rebuild === 'true') {
      const request = control('hyperSnapManager.requestRebuildHyperSnap', '');
      await delegator.print(`[HYPERSNAP_CONTROL] ${JSON.stringify(request)}`);
      if (request.status !== 'returned') {
        await delegator.finishTest(`${request.api}: ${request.status}, code=${request.code}, ${request.message}`, 1);
        return;
      }
    }
    await delegator.finishTest(`HyperSnap control request returned: enabled=${enabled}, rebuild=${rebuild}. ` +
      'Actual use requires AbilityStage.onLaunchFromHyperSnap evidence.', 0);
  }
}
