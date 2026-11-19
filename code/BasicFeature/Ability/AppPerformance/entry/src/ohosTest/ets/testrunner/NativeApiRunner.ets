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
import { appMemoryOptimizer, hyperSnapManager, bundleManager } from '@kit.AbilityKit';
import { fileIo } from '@kit.CoreFileKit';
import { deviceInfo, systemDateTime, BusinessError } from '@kit.BasicServicesKit';
import { logInfo } from '../../../main/ets/core/Logger';
import { BUNDLE, parameterSummary, runRunner } from '../support/TestLog';

interface NativeCallResult {
  api: string;
  parameters: string;
  status: string;
  elapsedMs: number;
  code: number;
  message: string;
  timedOut: boolean;
}

interface NativeProbeReport {
  model: string;
  os: string;
  startedAt: number;
  completedAt: number;
  bundle: string;
  modules: string[];
  calls: NativeCallResult[];
  plannedCalls: number;
  dispatchStopped: string;
}

type NativeAction = () => Promise<void>;

interface NativeInvocation {
  api: string;
  parameters: string;
  action: NativeAction;
}

async function invoke(api: string, parameters: string, action: NativeAction): Promise<NativeCallResult> {
  logInfo(`${BUNDLE} NativeApiRunner ${api} begin; parameters=${parameterSummary(parameters)}`);
  const started = systemDateTime.getUptime(systemDateTime.TimeType.STARTUP, false);
  let timer: number = -1;
  const row: NativeCallResult = {
    api: api,
    parameters: parameters,
    status: 'success',
    elapsedMs: 0,
    code: 0,
    message: '',
    timedOut: false
  };
  const deadline = new Promise<void>((_resolve, reject): void => {
    timer = setTimeout((): void => {
      row.timedOut = true;
      reject(new Error('Native API did not return within 10000 ms; underlying work is not cancelled'));
    }, 10000);
  });
  try {
    await Promise.race([Promise.resolve().then(action), deadline]);
  } catch (error) {
    const detail = error as BusinessError;
    row.status = row.timedOut ? 'timeout-unsettled' : 'failed';
    row.code = detail !== null && detail !== undefined && typeof detail.code === 'number' ? detail.code : -1;
    row.message = detail !== null && detail !== undefined && typeof detail.message === 'string' ?
      detail.message : String(error);
  } finally {
    clearTimeout(timer);
  }
  row.elapsedMs = systemDateTime.getUptime(systemDateTime.TimeType.STARTUP, false) - started;
  logInfo(`${BUNDLE} NativeApiRunner ${api} end; status=${row.status}, code=${row.code}, elapsedMs=${row.elapsedMs}`);
  await abilityDelegatorRegistry.getAbilityDelegator().print(`[NATIVE_API] ${JSON.stringify({
    api: row.api, parameters: parameterSummary(row.parameters), status: row.status,
    elapsedMs: row.elapsedMs, code: row.code, timedOut: row.timedOut, message: parameterSummary(row.message)
  })}`);
  return row;
}

export default class NativeApiRunner implements TestRunner {
  onPrepare(): void { logInfo(`${BUNDLE} NativeApiRunner prepare`); }

  async onRun(): Promise<void> {
    await runRunner('NativeApiRunner', (): Promise<void> => this.run());
  }

  private async run(): Promise<void> {
    const delegator = abilityDelegatorRegistry.getAbilityDelegator();
    const context = delegator.getAppContext();
    const report: NativeProbeReport = {
      model: deviceInfo.productModel,
      os: deviceInfo.osFullName,
      startedAt: Date.now(),
      completedAt: 0,
      bundle: BUNDLE,
      modules: [],
      calls: [],
      plannedCalls: 5,
      dispatchStopped: ''
    };
    try {
      const info = bundleManager.getBundleInfoForSelfSync(bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE);
      report.modules = info.hapModulesInfo.map((module: bundleManager.HapModuleInfo): string => module.name);
    } catch (error) {
      await delegator.print(`[NATIVE_CONTEXT] ${parameterSummary(error)}`);
    }

    const invocations: NativeInvocation[] = [
      { api: 'appMemoryOptimizer.evictFilePages', parameters: '["entry.hap"]',
        action: async (): Promise<void> => { await appMemoryOptimizer.evictFilePages(['entry.hap']); } },
      { api: 'appMemoryOptimizer.evictModuleFilePages', parameters: '["entry"]',
        action: async (): Promise<void> => { await appMemoryOptimizer.evictModuleFilePages(['entry']); } },
      { api: 'hyperSnapManager.setHyperSnapEnabled', parameters: 'false',
        action: async (): Promise<void> => { hyperSnapManager.setHyperSnapEnabled(false); } },
      { api: 'hyperSnapManager.setHyperSnapEnabled', parameters: 'true',
        action: async (): Promise<void> => { hyperSnapManager.setHyperSnapEnabled(true); } },
      { api: 'hyperSnapManager.requestRebuildHyperSnap', parameters: '',
        action: async (): Promise<void> => { hyperSnapManager.requestRebuildHyperSnap(); } }
    ];
    for (const invocation of invocations) {
      const row = await invoke(invocation.api, invocation.parameters, invocation.action);
      report.calls.push(row);
      if (row.timedOut) {
        report.dispatchStopped = 'unsettled-timeout; remaining calls were not dispatched';
        break;
      }
    }

    report.completedAt = Date.now();
    const serialized = JSON.stringify(report, null, 2);
    const path = `${context.filesDir}/app-performance-native-report.json`;
    try {
      const file = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.WRITE_ONLY | fileIo.OpenMode.TRUNC);
      try {
        fileIo.writeSync(file.fd, serialized);
      } finally {
        fileIo.closeSync(file);
      }
      await delegator.print('[NATIVE_REPORT] saved app-performance-native-report.json in app-private storage');
    } catch (error) {
      await delegator.print(`[NATIVE_REPORT_ERROR] ${parameterSummary(error)}`);
    }
    await delegator.print(`[NATIVE_SUMMARY] calls=${report.calls.length}, planned=${report.plannedCalls}, ` +
      `stopped=${report.dispatchStopped.length > 0}; raw diagnostics remain in app-private storage`);
    const failures = report.calls.filter((row: NativeCallResult): boolean => row.status !== 'success').length;
    await delegator.finishTest(`Native calls: ${report.calls.length}, failures: ${failures}`, failures > 0 ? 1 : 0);
  }
}
