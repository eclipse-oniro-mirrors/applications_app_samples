import { abilityDelegatorRegistry, TestRunner } from '@kit.TestKit';
import { appMemoryOptimizer, hyperSnapManager, bundleManager } from '@kit.AbilityKit';
import { fileIo } from '@kit.CoreFileKit';
import { deviceInfo, systemDateTime, BusinessError } from '@kit.BasicServicesKit';

interface NativeCallResult {
  api: string;
  parameters: string;
  status: string;
  elapsedMs: number;
  code: number;
  message: string;
}

interface NativeProbeReport {
  model: string;
  os: string;
  startedAt: number;
  completedAt: number;
  bundle: string;
  modules: string[];
  calls: NativeCallResult[];
}

type NativeAction = () => Promise<void>;

async function invoke(api: string, parameters: string, action: NativeAction): Promise<NativeCallResult> {
  const started = systemDateTime.getUptime(systemDateTime.TimeType.STARTUP, false);
  let timer: number = -1;
  const row: NativeCallResult = {
    api: api,
    parameters: parameters,
    status: 'success',
    elapsedMs: 0,
    code: 0,
    message: ''
  };
  const deadline = new Promise<void>((_resolve, reject): void => {
    timer = setTimeout((): void => { reject(new Error('Native API did not return within 10000 ms')); }, 10000);
  });
  try {
    await Promise.race([Promise.resolve().then(action), deadline]);
  } catch (error) {
    const detail = error as BusinessError;
    row.status = 'failed';
    row.code = typeof detail.code === 'number' ? detail.code : -1;
    row.message = typeof detail.message === 'string' ? detail.message : String(error);
  } finally {
    clearTimeout(timer);
  }
  row.elapsedMs = systemDateTime.getUptime(systemDateTime.TimeType.STARTUP, false) - started;
  await abilityDelegatorRegistry.getAbilityDelegator().print(`[NATIVE_API] ${JSON.stringify(row)}`);
  return row;
}

export default class NativeApiRunner implements TestRunner {
  onPrepare(): void {}

  async onRun(): Promise<void> {
    const delegator = abilityDelegatorRegistry.getAbilityDelegator();
    const context = delegator.getAppContext();
    const report: NativeProbeReport = {
      model: deviceInfo.productModel,
      os: deviceInfo.osFullName,
      startedAt: Date.now(),
      completedAt: 0,
      bundle: 'com.example.appperformance',
      modules: [],
      calls: []
    };
    try {
      const info = bundleManager.getBundleInfoForSelfSync(bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE);
      report.modules = info.hapModulesInfo.map((module: bundleManager.HapModuleInfo): string => module.name);
    } catch (error) {
      await delegator.print(`[NATIVE_CONTEXT] ${(error as Error).message}`);
    }

    report.calls.push(await invoke('appMemoryOptimizer.evictFilePages', '["entry.hap"]',
      async (): Promise<undefined> => {
        await appMemoryOptimizer.evictFilePages(['entry.hap']);
        return undefined;
      }));
    report.calls.push(await invoke('appMemoryOptimizer.evictModuleFilePages', '["entry"]',
      async (): Promise<undefined> => {
        await appMemoryOptimizer.evictModuleFilePages(['entry']);
        return undefined;
      }));
    report.calls.push(await invoke('hyperSnapManager.setHyperSnapEnabled', 'false',
      async (): Promise<undefined> => {
        hyperSnapManager.setHyperSnapEnabled(false);
        return undefined;
      }));
    report.calls.push(await invoke('hyperSnapManager.setHyperSnapEnabled', 'true',
      async (): Promise<undefined> => {
        hyperSnapManager.setHyperSnapEnabled(true);
        return undefined;
      }));
    report.calls.push(await invoke('hyperSnapManager.requestRebuildHyperSnap', '',
      async (): Promise<undefined> => {
        hyperSnapManager.requestRebuildHyperSnap();
        return undefined;
      }));

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
      await delegator.print(`[NATIVE_REPORT] ${path}`);
    } catch (error) {
      await delegator.print(`[NATIVE_REPORT_ERROR] ${(error as Error).message}`);
    }
    await delegator.print(`[NATIVE_SUMMARY] ${serialized}`);
    const failures = report.calls.filter((row: NativeCallResult): boolean => row.status !== 'success').length;
    await delegator.finishTest(`Native calls: ${report.calls.length}, failures: ${failures}`, failures > 0 ? 1 : 0);
  }
}
