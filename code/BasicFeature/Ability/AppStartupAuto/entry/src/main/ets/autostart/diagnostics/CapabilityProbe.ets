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

import { formatResource, localText } from '../text/LocalizedText';

/** Independent real-API diagnostics. No inferred permission, enable/disable or settings-jump API. */
import {
  CapabilityEvaluation, CapabilityQuery, DeviceForm, SystemFlavor, evaluateCapability
} from '../rules/CapabilityMatrix';
import { describeError } from '../rules/ErrorCatalog';
import { QueryClock, SystemQueryClock, elapsedNow } from '../AutoStartupRuntime';
import { StartupTelemetry, SystemStartupTelemetry, safeBegin, safeEnd } from '../Telemetry';
import { reportFailure } from '../SampleLogger';

export interface AutoStartupProbePort {
  isSupported(): Promise<boolean>;
  isEnabledForSelf(): Promise<boolean>;
}
export enum ProbeStage {
  IDLE = 'idle', RUNNING = 'running', SUCCEEDED = 'succeeded', UNSUPPORTED = 'unsupported',
  FAILED = 'failed', TIMEOUT = 'timeout'
}
export class ProbeResult {
  public stage: ProbeStage = ProbeStage.IDLE;
  public value: boolean | null = null;
  public errorCode: string = '';
  public errorMessage: string = '';
  public elapsedMillis: number = 0;
  public conclusion: string = localText('startup_text_0208');
  public unsupportedEvidence: boolean = false;
  clone(): ProbeResult {
    const copy = new ProbeResult();
    copy.stage = this.stage; copy.value = this.value; copy.errorCode = this.errorCode;
    copy.errorMessage = this.errorMessage; copy.elapsedMillis = this.elapsedMillis;
    copy.conclusion = this.conclusion; copy.unsupportedEvidence = this.unsupportedEvidence;
    return copy;
  }
}
export class DiagnosticReport {
  public query: CapabilityQuery = new CapabilityQuery();
  /** Legacy rule-model evaluation is for controlled tests only, never runtime evidence. */
  public evaluation: CapabilityEvaluation = new CapabilityEvaluation();
  public ability: ProbeResult = new ProbeResult();
  public status: ProbeResult = new ProbeResult();
  public consistent: boolean = false;
  public headline: string = localText('startup_text_0209');
  public advice: string = '';
  clone(): DiagnosticReport {
    const copy = new DiagnosticReport();
    copy.query = this.query.clone(); copy.evaluation = this.evaluation;
    copy.ability = this.ability.clone(); copy.status = this.status.clone();
    copy.consistent = this.consistent; copy.headline = this.headline; copy.advice = this.advice;
    return copy;
  }
}
export function conclusionOf(stage: ProbeStage, value: boolean | null, code: string): string {
  switch (stage) {
    case ProbeStage.SUCCEEDED: return value === null ? localText('startup_text_0210') :
      (value ? localText('startup_text_0211') : localText('startup_text_0212'));
    case ProbeStage.UNSUPPORTED: return formatResource('startup_format_a1a8020de465', [String(code.length === 0 ? '801' : code)]);
    case ProbeStage.FAILED: return formatResource('startup_format_db1f6db77389', [String(code.length === 0 ? localText('startup_text_0005') : code)]);
    case ProbeStage.TIMEOUT: return localText('startup_text_0215');
    case ProbeStage.RUNNING: return localText('startup_text_0216');
    default: return localText('startup_text_0208');
  }
}
export function isUnsupportedError(code: string): boolean { return describeError(code).unsupported; }
export function buildResult(stage: ProbeStage, value: boolean | null, code: string,
  message: string, elapsed: number): ProbeResult {
  const result = new ProbeResult();
  result.stage = stage; result.value = value; result.errorCode = code;
  result.errorMessage = message.slice(0, 200); result.elapsedMillis = Math.max(0, elapsed);
  result.conclusion = conclusionOf(stage, value, code);
  result.unsupportedEvidence = stage === ProbeStage.UNSUPPORTED;
  return result;
}
export function checkConsistency(ability: ProbeResult, status: ProbeResult): boolean {
  return (ability.stage === ProbeStage.SUCCEEDED && status.stage === ProbeStage.SUCCEEDED) ||
    (ability.stage === ProbeStage.UNSUPPORTED && status.stage === ProbeStage.UNSUPPORTED);
}
export function adviceOf(ability: ProbeResult, status: ProbeResult, evaluation: CapabilityEvaluation): string {
  if (ability.stage === ProbeStage.UNSUPPORTED) { return localText('startup_text_0217'); }
  if (ability.stage === ProbeStage.FAILED || ability.stage === ProbeStage.TIMEOUT) {
    return localText('startup_text_0218');
  }
  if (status.stage === ProbeStage.FAILED || status.stage === ProbeStage.TIMEOUT) {
    return localText('startup_text_0219');
  }
  if (status.stage === ProbeStage.SUCCEEDED) {
    return status.value ? localText('startup_text_0220') :
      localText('startup_text_0221');
  }
  return localText('startup_text_0222');
}

export class CapabilityDiagnostic {
  private report: DiagnosticReport = new DiagnosticReport();
  private pending: boolean = false;
  private allRunning: boolean = false;
  private generation: number = 0;
  private sequence: number = 0;
  private timer: number = -1;
  private cancelWait: (() => void) | undefined = undefined;
  private listeners: (() => void)[] = [];
  private port: AutoStartupProbePort;
  private clock: () => number;
  private timeoutMillis: number = 3000;
  private timers: QueryClock;
  private telemetry: StartupTelemetry;

  constructor(port: AutoStartupProbePort, clock: () => number,
    timeoutMillis: number = 3000, timers: QueryClock = new SystemQueryClock(),
    telemetry: StartupTelemetry = new SystemStartupTelemetry()) {
    this.port = port;
    this.clock = clock;
    this.timeoutMillis = timeoutMillis;
    this.timers = timers;
    this.telemetry = telemetry;
  }

  configure(query: CapabilityQuery): void {
    this.report.query = query.clone();
    this.report.evaluation = evaluateCapability(query);
  }
  subscribe(listener: () => void): () => void {
    this.listeners.push(listener);
    return (): void => { this.listeners = this.listeners.filter((item: () => void): boolean => item !== listener); };
  }
  runAbilityProbe(): Promise<ProbeResult> { return this.runProbe(true); }
  runStatusProbe(): Promise<ProbeResult> { return this.runProbe(false); }
  async runAll(): Promise<DiagnosticReport> {
    if (this.isRunning()) { return this.report.clone(); }
    this.allRunning = true;
    const generation = this.generation;
    try {
      await this.runProbe(true);
      if (!this.pending && generation === this.generation) { await this.runProbe(false); }
    } finally { this.allRunning = false; this.notify(); }
    return this.report.clone();
  }
  private runProbe(ability: boolean): Promise<ProbeResult> {
    if (this.pending) { return Promise.resolve((ability ? this.report.ability : this.report.status).clone()); }
    this.pending = true;
    const generation = this.generation;
    const sequence = ++this.sequence;
    const operation = ability ? 'diagnostic_ability' : 'diagnostic_status';
    const started = this.clock();
    this.assign(ability, buildResult(ProbeStage.RUNNING, null, '', '', 0));
    safeBegin(this.telemetry, operation, sequence);
    return new Promise<ProbeResult>((resolve): void => {
      let terminal = false;
      const finish = (result: ProbeResult): void => {
        if (terminal) { return; }
        terminal = true;
        if (this.timer >= 0) { this.timers.clearTimeout(this.timer); this.timer = -1; }
        this.cancelWait = undefined;
        safeEnd(this.telemetry, operation, sequence, result.stage);
        if (generation === this.generation) { this.assign(ability, result); }
        resolve(result.clone());
      };
      this.cancelWait = (): void => finish(buildResult(
        ProbeStage.FAILED, null, 'CANCELLED', localText('startup_text_0223'), this.clock() - started));
      this.timer = this.timers.setTimeout((): void => {
        // Timeout ends the visible wait, NOT the underlying non-cancellable native call.
        finish(buildResult(
          ProbeStage.TIMEOUT, null, 'TIMEOUT', localText('startup_text_0224'), this.clock() - started));
      }, this.timeoutMillis);
      let request: Promise<boolean>;
      try {
        request = ability ? this.port.isSupported() : this.port.isEnabledForSelf();
      } catch (error) {
        this.pending = false;
        finish(this.failure(error as Object, this.clock() - started));
        this.notify();
        return;
      }
      request.then((value: boolean): void => {
        this.pending = false;
        const result = buildResult(ability && !value ? ProbeStage.UNSUPPORTED : ProbeStage.SUCCEEDED,
          value, ability && !value ? '801' : '0', '', this.clock() - started);
        if (ability && value) { result.conclusion = localText('startup_text_0225'); }
        finish(result);
        this.notify();
      }, (error: Object): void => {
        this.pending = false;
        finish(this.failure(error, this.clock() - started));
        this.notify();
      });
    });
  }
  private failure(error: Object, elapsed: number): ProbeResult {
    const candidate = error as Record<string, Object>;
    const code = candidate === null || candidate === undefined || candidate['code'] === undefined ?
      'UNKNOWN' : String(candidate['code']);
    const message = candidate === null || candidate === undefined || candidate['message'] === undefined ?
      localText('startup_text_0226') : String(candidate['message']);
    return buildResult(isUnsupportedError(code) ? ProbeStage.UNSUPPORTED : ProbeStage.FAILED,
      null, code, message, elapsed);
  }
  private assign(ability: boolean, result: ProbeResult): void {
    if (ability) { this.report.ability = result; } else { this.report.status = result; }
    this.report.consistent = checkConsistency(this.report.ability, this.report.status);
    this.report.advice = adviceOf(this.report.ability, this.report.status, this.report.evaluation);
    this.report.headline = formatResource('startup_format_43dd26b0d62d', [String(this.report.ability.conclusion), String(this.report.status.conclusion)]);
    this.notify();
  }
  /** Legacy display conversion only. Real timeout is implemented by the timer above. */
  degradeIfTimeout(result: ProbeResult): ProbeResult {
    return result.stage === ProbeStage.RUNNING || result.elapsedMillis > this.timeoutMillis ?
      buildResult(ProbeStage.TIMEOUT, result.value, 'TIMEOUT', localText('startup_text_0004'), result.elapsedMillis) : result;
  }
  dispose(): void {
    this.generation++;
    if (this.cancelWait !== undefined) { this.cancelWait(); }
    this.report = new DiagnosticReport();
    this.listeners = [];
    // pending remains true until the old native call settles: no overlapping retries.
  }
  reportSnapshot(): DiagnosticReport { return this.report.clone(); }
  isRunning(): boolean { return this.pending || this.allRunning; }
  private notify(): void {
    this.listeners.slice().forEach((listener: () => void): void => {
      try {
        listener();
      } catch (_) {
        // Subscriber isolation: a failing diagnostics listener must not stop the others.
        reportFailure('Diagnostics listener');
      }
    });
  }
}
export function deriveQuery(apiLevel: number, deviceType: string, isOpenHarmony: boolean,
  permissionGranted: boolean, settingsEntryAvailable: boolean): CapabilityQuery {
  let form = DeviceForm.UNKNOWN;
  if (deviceType === 'phone') {
    form = DeviceForm.PHONE;
  } else if (deviceType === 'tablet') {
    form = DeviceForm.TABLET;
  } else if (deviceType === 'tv') {
    form = DeviceForm.TV;
  } else if (deviceType === 'wearable') {
    form = DeviceForm.WEARABLE;
  }
  return new CapabilityQuery(apiLevel, form, isOpenHarmony ? SystemFlavor.OPEN_HARMONY :
    SystemFlavor.COMMERCIAL, permissionGranted, settingsEntryAvailable);
}
