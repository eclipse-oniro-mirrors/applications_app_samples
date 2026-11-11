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
import { appMemoryOptimizer } from '@kit.AbilityKit';
import { fileIo } from '@kit.CoreFileKit';
import { BusinessError, deviceInfo, systemDateTime } from '@kit.BasicServicesKit';
import { hiTraceMeter } from '@kit.PerformanceAnalysisKit';
import { PageProbe, PageCalibration, MappedProbe, sampleFile, calibratePrivateFile,
  beginMappedFile, sampleMappedFile, rereadMappedFile, releaseMappedFile } from 'libpageprobe.so';

interface ResidentSample {
  scheduledAfterMs: number;
  sampleStartedElapsedMs: number;
  elapsedMs: number;
  deadlineMissMs: number;
  /** null = unobserved/invalid, never silently converted to zero. */
  residentDecreasePages: number | null;
  mappingPresentDecreasePages: number | null;
  mapping: MappedProbe;
  probe: PageProbe;
}

interface TraceEvent {
  name: string;
  action: string;
  taskId: number;
  wallTimeMs: number;
  uptimeMs: number;
  apiReturned: boolean;
  error: string;
}

interface MeasurementLeg {
  round: number;
  mode: string;
  apiStatus: string;
  apiCode: number;
  apiMessage: string;
  requestStartedUptimeMs: number;
  requestCompletedUptimeMs: number;
  requestElapsedMs: number;
  traceName: string;
  traceTaskId: number;
  traceCaptureEnabled: boolean | null;
  traceEvents: TraceEvent[];
  before: PageProbe;
  mappingBefore: MappedProbe;
  after: ResidentSample[];
  mappingBeforeReadback: MappedProbe | undefined;
  mappingAfterReadback: MappedProbe | undefined;
  integrityAfter: PageProbe;
  identicalFileAndWorkload: boolean;
  residencyObservation: string;
}

interface ProbeCandidate {
  path: string;
  probe: PageProbe;
}

export interface MeasurementOptions {
  mode: string;
  rounds: number;
}

interface MeasurementReport {
  schema: number;
  model: string;
  os: string;
  path: string;
  startedAt: number;
  completedAt: number;
  method: string;
  apiContract: string;
  limitations: string[];
  options: MeasurementOptions;
  calibration: PageCalibration | undefined;
  candidates: ProbeCandidate[];
  failurePhase: string;
  failureCode: number;
  failureMessage: string;
  legs: MeasurementLeg[];
}

function now(): number {
  return systemDateTime.getUptime(systemDateTime.TimeType.STARTUP, false);
}

function delay(ms: number): Promise<void> {
  return new Promise<void>((resolve): void => { setTimeout(resolve, Math.max(0, ms)); });
}

export function measurementOptions(mode: string, rounds: string): MeasurementOptions {
  const selected = mode.length === 0 ? 'all' : mode;
  if (['all', 'control', 'file', 'module'].indexOf(selected) < 0) {
    throw new Error('mode must be all|control|file|module');
  }
  const count = rounds.length === 0 ? 1 : Number(rounds);
  if (!Number.isSafeInteger(count) || count < 1 || count > 3) {
    throw new Error('rounds must be an integer from 1 to 3');
  }
  return { mode: selected, rounds: count };
}

function argument(name: string): string {
  const parameters = abilityDelegatorRegistry.getArguments().parameters;
  const plain = parameters[name];
  const prefixed = parameters[`-s ${name}`];
  return typeof plain === 'string' ? plain : (typeof prefixed === 'string' ? prefixed : '');
}

function sameFile(before: PageProbe, after: PageProbe): boolean {
  return before.deviceId.length > 0 && before.inodeNumber.length > 0 &&
    before.deviceId === after.deviceId && before.inodeNumber === after.inodeNumber &&
    before.fileBytes === after.fileBytes && before.pageBytes === after.pageBytes &&
    before.totalPages === after.totalPages;
}

/** Legacy mincore cache signal only; independent of exact held-mapping PRESENT observations. */
export function observedResidentDecrease(before: PageProbe, after: PageProbe,
  calibrationPassed: boolean): number | null {
  if (!calibrationPassed || !before.ok || !after.ok || !before.residencyTrusted ||
    !after.residencyTrusted || !sameFile(before, after) || before.residentPages <= 0 ||
    !Number.isSafeInteger(before.residentPages) || !Number.isSafeInteger(after.residentPages) ||
    before.residentPages > before.totalPages || after.residentPages < 0 ||
    after.residentPages > after.totalPages || before.sampleStartedMonotonicMs <= 0 ||
    before.sampleCompletedMonotonicMs < before.sampleStartedMonotonicMs ||
    after.sampleStartedMonotonicMs < before.sampleCompletedMonotonicMs ||
    after.sampleCompletedMonotonicMs < after.sampleStartedMonotonicMs) {
    return null;
  }
  return before.residentPages - after.residentPages;
}

function trace(leg: MeasurementLeg, action: string, suffix: string = ''): boolean {
  const name = suffix.length === 0 ? leg.traceName : `${leg.traceName}_${suffix}`;
  const event: TraceEvent = {
    name: name,
    action: action,
    taskId: leg.traceTaskId,
    wallTimeMs: Date.now(),
    uptimeMs: now(),
    apiReturned: false,
    error: ''
  };
  try {
    const level = hiTraceMeter.HiTraceOutputLevel.COMMERCIAL;
    if (action === 'begin') {
      const probe = leg.before;
      hiTraceMeter.startAsyncTrace(level, name, leg.traceTaskId, 'AppPerformanceFilePages',
        `dev=${probe.deviceMajor}:${probe.deviceMinor},ino_hex=${probe.inodeHex},bytes=${probe.fileBytes}`);
    } else if (action === 'end') {
      hiTraceMeter.finishAsyncTrace(level, name, leg.traceTaskId);
    } else {
      // A short synchronous trace is an instant landmark, NOT a request-duration metric.
      hiTraceMeter.startSyncTrace(level, name);
      hiTraceMeter.finishSyncTrace(level);
    }
    event.apiReturned = true;
  } catch (error) {
    event.error = (error as Error).message;
  }
  leg.traceEvents.push(event);
  return event.apiReturned;
}

async function measure(round: number, mode: string, path: string,
  calibrationPassed: boolean): Promise<MeasurementLeg> {
  const mapping = beginMappedFile(path);
  try {
    return await measureHeld(round, mode, calibrationPassed, mapping);
  } finally {
    releaseMappedFile(mapping.handle);
  }
}

async function measureHeld(round: number, mode: string,
  calibrationPassed: boolean, mappingBefore: MappedProbe): Promise<MeasurementLeg> {
  const before = mappingBefore.file;
  if (!mappingBefore.ok || mappingBefore.bytesTouched !== before.fileBytes) {
    throw new Error(`Mapped warm-up failed: ${JSON.stringify(mappingBefore)}`);
  }
  const leg: MeasurementLeg = {
    round: round,
    mode: mode,
    apiStatus: mode === 'control' ? 'not-requested' : 'pending',
    apiCode: 0,
    apiMessage: 'Promise<void> has no reclaimed-page count',
    requestStartedUptimeMs: 0,
    requestCompletedUptimeMs: 0,
    requestElapsedMs: 0,
    traceName: `AP_PAGE_${round}_${mode}`,
    traceTaskId: round * 10 + ['control', 'file', 'module'].indexOf(mode),
    traceCaptureEnabled: null,
    traceEvents: [],
    before: before,
    mappingBefore: mappingBefore,
    after: [],
    mappingBeforeReadback: undefined,
    mappingAfterReadback: undefined,
    integrityAfter: before,
    identicalFileAndWorkload: false,
    residencyObservation: 'mapping-PTE-unobserved'
  };
  try {
    leg.traceCaptureEnabled = hiTraceMeter.isTraceEnabled();
  } catch (error) {
    // Trace API availability must not alter the eviction result. Trace events retain call errors.
  }
  // The observation span begins AFTER warm-up, BEFORE dispatch; integrity readback is OUTSIDE it.
  const traceOpened = trace(leg, 'begin');
  const started = now();
  leg.requestStartedUptimeMs = started;
  try {
    if (mode !== 'control') {
      let timer: number = -1;
      try {
        trace(leg, 'point', 'DISPATCH');
        const request = mode === 'file' ? appMemoryOptimizer.evictFilePages(['entry.hap']) :
          appMemoryOptimizer.evictModuleFilePages(['entry']);
        const timeout = new Promise<void>((_resolve, reject): void => {
          timer = setTimeout((): void => {
            reject(new Error('Request timeout; do not dispatch another request'));
          }, 10000);
        });
        await Promise.race([request, timeout]);
        leg.apiStatus = 'returned';
        trace(leg, 'point', 'RESOLVE');
      } catch (error) {
        const detail = error as BusinessError;
        leg.apiCode = typeof detail.code === 'number' ? detail.code : -1;
        leg.apiMessage = typeof detail.message === 'string' ? detail.message : String(error);
        leg.apiStatus = leg.apiCode === -1 ? 'timeout-or-local-error' : 'rejected';
        trace(leg, 'point', leg.apiStatus === 'rejected' ? 'REJECT' : 'TIMEOUT_OR_LOCAL_ERROR');
      } finally {
        clearTimeout(timer);
      }
    } else {
      trace(leg, 'point', 'CONTROL_NO_REQUEST');
    }
    leg.requestCompletedUptimeMs = now();
    leg.requestElapsedMs = leg.requestCompletedUptimeMs - started;
    // Actual timestamps are recorded. A slow request never masquerades as an on-time sample.
    for (const deadline of [0, 100, 1000, 5000]) {
      await delay(deadline - (now() - started));
      const sampleStarted = now();
      const mapping = sampleMappedFile(mappingBefore.handle); // Passive PRESENT scan, no mapped data reads.
      const snapshot = mapping.file;
      const completed = now();
      const beforePresent = mappingBefore.presentPages;
      const afterPresent = mapping.presentPages;
      const mappedDecrease = beforePresent !== null && afterPresent !== null &&
        mapping.ok && mapping.handle === mappingBefore.handle && sameFile(before, snapshot) ?
        beforePresent - afterPresent : null;
      leg.after.push({
        scheduledAfterMs: deadline,
        sampleStartedElapsedMs: sampleStarted - started,
        elapsedMs: completed - started,
        deadlineMissMs: Math.max(0, sampleStarted - started - deadline),
        residentDecreasePages: observedResidentDecrease(before, snapshot, calibrationPassed),
        mappingPresentDecreasePages: mappedDecrease,
        mapping: mapping,
        probe: snapshot
      });
    }
  } finally {
    // Finish immediately after the final passive sample (or failure), before any integrity rewarming.
    if (traceOpened) {
      trace(leg, 'end');
    }
  }
  trace(leg, 'point', 'INTEGRITY_READ_OUTSIDE_SPAN');
  leg.mappingBeforeReadback = sampleMappedFile(mappingBefore.handle);
  const reread = rereadMappedFile(mappingBefore.handle);
  leg.mappingAfterReadback = reread;
  leg.integrityAfter = reread.file;
  leg.identicalFileAndWorkload = reread.ok && sameFile(before, reread.file) &&
    reread.bytesTouched === mappingBefore.bytesTouched && reread.checksum === mappingBefore.checksum &&
    leg.after.every((row: ResidentSample): boolean => sameFile(before, row.probe));
  if (!leg.identicalFileAndWorkload) {
    leg.after.forEach((row: ResidentSample): void => {
      row.residentDecreasePages = null;
      row.mappingPresentDecreasePages = null;
    });
  }
  leg.residencyObservation = leg.after.every((row: ResidentSample): boolean =>
    row.mappingPresentDecreasePages !== null) ?
    'exact-held-mapping-PRESENT-change-observed; NOT global-pagecache-returned' :
    'held-mapping-PRESENT-unobserved; inspect pagemap errors, never substitute mincore or process RSS';
  return leg;
}

/** Diagnostic completion is NOT a quantity of global filecache returned. */
export default class FilePageRunner implements TestRunner {
  onPrepare(): void {}

  async onRun(): Promise<void> {
    const delegator = abilityDelegatorRegistry.getAbilityDelegator();
    const context = delegator.getAppContext();
    const report: MeasurementReport = {
      schema: 3,
      model: deviceInfo.productModel,
      os: deviceInfo.osFullName,
      path: '',
      startedAt: Date.now(),
      completedAt: 0,
      method: 'held PROT_READ MAP_PRIVATE HAP; mapped full-byte checksum warm-up; ' +
        'passive self/pagemap PRESENT to 5s; checksum/refault readback after span',
      apiContract: 'Both eviction APIs return Promise<void>; return is not eviction guarantee or quantity',
      limitations: [
        'Exact held virtual range PRESENT bits measure process mapping residency. ' +
          'DONTNEED need not delete global filecache or emit filemap delete',
        'ok means syscall success only. residencyTrusted is conservative owner/effective-write-open eligibility, ' +
          'not a proven kernel gate',
        'HongMengKernel identity is recorded by uname; no Linux version or exact mincore permission policy is assumed',
        'Unknown residency produces residentDecreasePages=null, not zero. Raw residentPages remain for audit',
        'Private calibration proves responsiveness on that private inode only; ' +
          'it cannot grant HAP observation permission',
        'residentBytes/residentContentBytes are covered file CONTENT bytes, ' +
          'not physical allocation or API reclaimed bytes',
        'Unrelated reads/reclaim affect net change. Compare control at actual times ' +
          'and check trace loss before attributing events',
        'FNV-1a is noncryptographic. Device/inode/size/page size/bytes/checksum mismatches invalidate comparisons'
      ],
      options: { mode: 'all', rounds: 1 },
      calibration: undefined,
      candidates: [],
      failurePhase: '',
      failureCode: 0,
      failureMessage: '',
      legs: []
    };
    let failure = '';
    let phase = 'validate mode/rounds arguments';
    try {
      report.options = measurementOptions(argument('mode'), argument('rounds'));
      phase = 'calibratePrivateFile(context.cacheDir), ONLY newly created private file';
      const calibration = calibratePrivateFile(context.cacheDir);
      report.calibration = calibration;
      await delegator.print(`[FILE_PAGE_CALIBRATION] ${JSON.stringify(calibration)}`);
      const calibrationPassed = calibration.ok && calibration.passed;
      // Installed HAP parent may deny listing. Probe exact self paths without directory enumeration.
      phase = 'resolve self installed HAP path (no directory listing)';
      const candidates = ['/data/storage/el1/bundle/entry.hap'];
      const contextPath = `${context.bundleCodeDir}/entry.hap`;
      if (candidates.indexOf(contextPath) < 0) {
        candidates.push(contextPath);
      }
      for (const path of candidates) {
        phase = `native sampleFile(${path})`;
        const probe = sampleFile(path);
        const candidate: ProbeCandidate = { path: path, probe: probe };
        report.candidates.push(candidate);
        await delegator.print(`[FILE_PAGE_PATH] ${JSON.stringify(candidate)}`);
        if (probe.ok) { report.path = path; break; }
      }
      if (report.path.length === 0) {
        throw new Error('No successful self HAP sample; inspect FILE_PAGE_PATH operation/errno. ' +
          'This is not an eviction failure.');
      }
      const modes = ['control', 'file', 'module'];
      for (let round = 0; round < report.options.rounds; round++) {
        const selected = report.options.mode === 'all' ? modes.length : 1;
        for (let index = 0; index < selected; index++) {
          const mode = report.options.mode === 'all' ? modes[(round + index) % modes.length] : report.options.mode;
          phase = `round ${round + 1} ${mode}: warm-up / request / passive samples / integrity`;
          const leg = await measure(round + 1, mode, report.path, calibrationPassed);
          if (report.legs.length > 0) {
            const reference = report.legs[0].before;
            leg.identicalFileAndWorkload = leg.identicalFileAndWorkload && sameFile(reference, leg.before) &&
              leg.before.bytesRead === reference.bytesRead && leg.before.checksum === reference.checksum;
            if (!leg.identicalFileAndWorkload) {
              leg.after.forEach((row: ResidentSample): void => {
                row.residentDecreasePages = null;
                row.mappingPresentDecreasePages = null;
              });
              leg.residencyObservation = 'invalid-workload';
            }
          }
          report.legs.push(leg);
          await delegator.print(`[FILE_PAGE_MEASURE] ${JSON.stringify(leg)}`);
          if (!leg.identicalFileAndWorkload || leg.after.some((row: ResidentSample): boolean => !row.mapping.ok)) {
            throw new Error('Invalid file sample or workload; raw native errors retained. ' +
              'Unknown residency is not zero.');
          }
          if (leg.apiStatus === 'timeout-or-local-error') {
            throw new Error('Stopped: request may remain pending; no overlapping retry');
          }
        }
      }
    } catch (error) {
      const detail = error as BusinessError;
      report.failurePhase = phase;
      report.failureCode = typeof detail.code === 'number' ? detail.code : -1;
      report.failureMessage = typeof detail.message === 'string' ? detail.message : String(error);
      failure = `${phase}: code=${report.failureCode} ${report.failureMessage}`;
      await delegator.print(`[FILE_PAGE_ERROR] ${failure}`);
    }
    report.completedAt = Date.now();
    const serialized = JSON.stringify(report, null, 2);
    const reportPath = `${context.filesDir}/app-performance-file-pages.json`;
    try {
      const file = fileIo.openSync(reportPath,
        fileIo.OpenMode.CREATE | fileIo.OpenMode.WRITE_ONLY | fileIo.OpenMode.TRUNC);
      try { fileIo.writeSync(file.fd, serialized); } finally { fileIo.closeSync(file); }
      await delegator.print(`[FILE_PAGE_REPORT] ${reportPath}`);
    } catch (error) {
      failure = `Report write failed: ${(error as Error).message}`;
    }
    await delegator.print(`[FILE_PAGE_SUMMARY] ${serialized}`);
    await delegator.finishTest(failure.length > 0 ? failure :
      `Diagnostics captured: ${report.legs.length} legs. ` +
        'Mapping PRESENT loss/refault is not global-cache returned; null is unobserved.',
      failure.length > 0 ? 1 : 0);
  }
}
