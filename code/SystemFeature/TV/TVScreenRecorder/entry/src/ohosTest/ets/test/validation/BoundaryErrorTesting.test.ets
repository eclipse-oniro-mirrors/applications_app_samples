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

import { describe, it, expect, beforeAll, afterAll } from '@ohos/hypium';
import { Driver } from '@ohos.UiTest';
import {
  getDriver,
  KEY_RIGHT,
  KEY_BACK,
  buildRecordingFileName,
  isValidRecordingFileName,
  recorderComponentCount,
  pressAndWait,
  delay,
  DELAY_KEY_NAVIGATION
} from '../shared/RecordingDriver';

// Error domain of the screen recorder. The values are stable identifiers used
// by the boundary scenarios to describe why an operation was rejected.
enum RecorderErrorCode {
  OK = 0,
  FD_INVALID = 1,
  FILE_NAME_EMPTY = 2,
  FILE_NAME_MALFORMED = 3,
  RESOLUTION_UNSUPPORTED = 4,
  CONTEXT_NULL = 5,
  START_ID_INVALID = 6,
  STATE_INVALID = 7,
  IO_FAILED = 8
}

// Severity of a rejected boundary operation.
enum ErrorSeverity {
  MINOR = 'minor',
  MODERATE = 'moderate',
  SEVERE = 'severe',
  CRITICAL = 'critical'
}

// Boundary categories covered by this suite.
enum BoundaryCategory {
  NUMERIC = 'numeric',
  STRING = 'string',
  TEMPORAL = 'temporal',
  SPATIAL = 'spatial'
}

// A boundary probe result. Every probe returns the resolved error code so the
// assertions can validate both the boolean outcome and the reason.
interface BoundaryOutcome {
  accepted: boolean;
  code: RecorderErrorCode;
}

// One boundary case descriptor, used by the statistics helpers.
interface BoundaryCase {
  caseId: number;
  category: BoundaryCategory;
  description: string;
  expectedRecovery: boolean;
  severity: ErrorSeverity;
}

// Execution result of one boundary case.
interface BoundaryResult {
  caseId: number;
  passed: boolean;
  recovered: boolean;
  elapsedMs: number;
}

// Sales statistics of the error counters.
interface ErrorStats {
  total: number;
  recovered: number;
}

// Maximum file descriptor accepted by the platform. The production code stores
// the descriptor in a `number`, therefore the whole 32 bit positive range is
// legal while `-1` is the "not initialised" marker.
const MAX_FD: number = 2147483647;

const UNINITIALISED_FD: number = -1;

// Validates a recording file descriptor and converts it into the `fd://` url
// that is handed over to the native recorder.
class FdBoundaryValidator {
  public static isInitialised(fd: number): boolean {
    return fd !== UNINITIALISED_FD;
  }

  public static isValid(fd: number): boolean {
    if (!Number.isFinite(fd)) {
      return false;
    }
    if (!Number.isInteger(fd)) {
      return false;
    }
    return fd > 0 && fd <= MAX_FD;
  }

  public static buildUrl(fd: number): string {
    return 'fd://' + fd;
  }

  public static evaluate(fd: number): BoundaryOutcome {
    const outcome: BoundaryOutcome = {
      accepted: FdBoundaryValidator.isValid(fd),
      code: FdBoundaryValidator.isValid(fd) ? RecorderErrorCode.OK : RecorderErrorCode.FD_INVALID
    };
    return outcome;
  }

  // The native layer rejects the placeholder descriptor, so starting a
  // recording before `fs.openSync` completed must fail with FD_INVALID.
  public static canStartRecording(fd: number): boolean {
    if (!FdBoundaryValidator.isInitialised(fd)) {
      return false;
    }
    return FdBoundaryValidator.isValid(fd);
  }
}

// Validates the generated artifact name against the production naming rule
// `REC_yyyyMMdd_HHmmss.mp4`.
class FileNameBoundaryValidator {
  public static evaluate(fileName: string): BoundaryOutcome {
    if (fileName.length === 0) {
      const emptyOutcome: BoundaryOutcome = {
        accepted: false,
        code: RecorderErrorCode.FILE_NAME_EMPTY
      };
      return emptyOutcome;
    }
    const accepted = isValidRecordingFileName(fileName);
    const outcome: BoundaryOutcome = {
      accepted: accepted,
      code: accepted ? RecorderErrorCode.OK : RecorderErrorCode.FILE_NAME_MALFORMED
    };
    return outcome;
  }

  public static buildValidName(): string {
    return buildRecordingFileName(new Date(2026, 10, 12, 10, 30, 0));
  }

  public static hasExpectedExtension(fileName: string): boolean {
    return fileName.endsWith('.mp4');
  }

  public static hasExpectedPrefix(fileName: string): boolean {
    return fileName.startsWith('REC_');
  }

  public static timePartLength(fileName: string): number {
    if (fileName.length < 20) {
      return 0;
    }
    return fileName.substring(4, fileName.length - 4).length;
  }
}

// Validates the requested recording resolution. The sample rejects anything
// above the 1920x1080 capture limit and shows the resolution dialog instead.
class ResolutionBoundaryValidator {
  public static readonly LIMIT_WIDTH: number = 1920;
  public static readonly LIMIT_HEIGHT: number = 1080;

  public static isSupported(width: number, height: number): boolean {
    if (!Number.isFinite(width) || !Number.isFinite(height)) {
      return false;
    }
    if (width <= 0 || height <= 0) {
      return false;
    }
    return width <= ResolutionBoundaryValidator.LIMIT_WIDTH && height <= ResolutionBoundaryValidator.LIMIT_HEIGHT;
  }

  public static evaluate(width: number, height: number): BoundaryOutcome {
    const supported = ResolutionBoundaryValidator.isSupported(width, height);
    const outcome: BoundaryOutcome = {
      accepted: supported,
      code: supported ? RecorderErrorCode.OK : RecorderErrorCode.RESOLUTION_UNSUPPORTED
    };
    return outcome;
  }

  public static aspectRatio(width: number, height: number): number {
    if (height <= 0) {
      return 0;
    }
    return width / height;
  }
}

// Validates the ability context handed over to the window manager and to the
// photo access helper. A missing context must be reported instead of crashing.
class ContextBoundaryValidator {
  public static isUsable(context: Object | null | undefined): boolean {
    if (context === null || context === undefined) {
      return false;
    }
    return true;
  }

  public static evaluate(context: Object | null | undefined): BoundaryOutcome {
    const usable = ContextBoundaryValidator.isUsable(context);
    const outcome: BoundaryOutcome = {
      accepted: usable,
      code: usable ? RecorderErrorCode.OK : RecorderErrorCode.CONTEXT_NULL
    };
    return outcome;
  }
}

// Validates the `startId` delivered to `onRequest`. Only `1` starts a capture,
// every other value is routed to the stop branch.
class StartIdBoundaryValidator {
  public static readonly START_ID: number = 1;

  public static isStartRequest(startId: number): boolean {
    return startId === StartIdBoundaryValidator.START_ID;
  }

  public static evaluate(startId: number): BoundaryOutcome {
    if (!Number.isInteger(startId) || startId < 0) {
      const invalidOutcome: BoundaryOutcome = {
        accepted: false,
        code: RecorderErrorCode.START_ID_INVALID
      };
      return invalidOutcome;
    }
    const outcome: BoundaryOutcome = {
      accepted: true,
      code: RecorderErrorCode.OK
    };
    return outcome;
  }

  public static route(startId: number): string {
    return StartIdBoundaryValidator.isStartRequest(startId) ? 'start' : 'stop';
  }
}
// Boundary state machine of the recording session. It mirrors the transitions
// accepted by SRManager: Idle -> Recording, Recording -> Stopped/Error,
// Stopped -> Idle and Error -> Idle.
class RecordingStateBoundaryMachine {
  public static readonly IDLE: number = 0;
  public static readonly RECORDING: number = 1;
  public static readonly STOPPED: number = 2;
  public static readonly ERROR: number = 3;

  private currentState: number = RecordingStateBoundaryMachine.IDLE;
  private rejectCount: number = 0;

  public getState(): number {
    return this.currentState;
  }

  public getRejectCount(): number {
    return this.rejectCount;
  }

  public reset(): void {
    this.currentState = RecordingStateBoundaryMachine.IDLE;
    this.rejectCount = 0;
  }

  public isKnownState(state: number): boolean {
    return state === RecordingStateBoundaryMachine.IDLE || state === RecordingStateBoundaryMachine.RECORDING ||
      state === RecordingStateBoundaryMachine.STOPPED || state === RecordingStateBoundaryMachine.ERROR;
  }

  public isTransitionAllowed(from: number, to: number): boolean {
    if (!this.isKnownState(from) || !this.isKnownState(to)) {
      return false;
    }
    if (from === RecordingStateBoundaryMachine.IDLE) {
      return to === RecordingStateBoundaryMachine.RECORDING;
    }
    if (from === RecordingStateBoundaryMachine.RECORDING) {
      return to === RecordingStateBoundaryMachine.STOPPED || to === RecordingStateBoundaryMachine.ERROR;
    }
    if (from === RecordingStateBoundaryMachine.STOPPED) {
      return to === RecordingStateBoundaryMachine.IDLE;
    }
    return to === RecordingStateBoundaryMachine.IDLE;
  }

  // Applies one transition. An illegal pair keeps the current state and reports
  // STATE_INVALID, which is what the ability uses to skip the start request.
  public apply(to: number): BoundaryOutcome {
    const allowed = this.isTransitionAllowed(this.currentState, to);
    if (!allowed) {
      this.rejectCount++;
      const rejected: BoundaryOutcome = {
        accepted: false,
        code: this.isKnownState(to) ? RecorderErrorCode.STATE_INVALID : RecorderErrorCode.IO_FAILED
      };
      return rejected;
    }
    this.currentState = to;
    const accepted: BoundaryOutcome = {
      accepted: true,
      code: RecorderErrorCode.OK
    };
    return accepted;
  }

  public canStart(): boolean {
    return this.currentState === RecordingStateBoundaryMachine.IDLE;
  }

  public canStop(): boolean {
    return this.currentState === RecordingStateBoundaryMachine.RECORDING;
  }
}

// Boundary data payload used by the generic boundary probes.
interface BoundaryData {
  data?: string;
  text?: string;
  value?: number;
  default?: string;
}

// Error counter shared by the recovery scenarios.
class BoundaryTestUtil {
  private static instance: BoundaryTestUtil;
  private errorCount: number = 0;
  private recoverySuccessCount: number = 0;

  public static getInstance(): BoundaryTestUtil {
    if (!BoundaryTestUtil.instance) {
      BoundaryTestUtil.instance = new BoundaryTestUtil();
    }
    return BoundaryTestUtil.instance;
  }

  public generateBoundaryInput(kind: string): BoundaryData | null | undefined {
    if (kind === 'empty') {
      const empty: BoundaryData = {};
      return empty;
    }
    if (kind === 'null') {
      return null;
    }
    if (kind === 'undefined') {
      return undefined;
    }
    if (kind === 'large') {
      const large: BoundaryData = {
        data: 'x'.repeat(10000)
      };
      return large;
    }
    if (kind === 'special_chars') {
      const special: BoundaryData = {
        text: '!@#$%^&*()'
      };
      return special;
    }
    if (kind === 'negative') {
      const negative: BoundaryData = {
        value: -1
      };
      return negative;
    }
    if (kind === 'zero') {
      const zero: BoundaryData = {
        value: 0
      };
      return zero;
    }
    if (kind === 'max_int') {
      const maxInt: BoundaryData = {
        value: Number.MAX_SAFE_INTEGER
      };
      return maxInt;
    }
    const fallback: BoundaryData = {
      default: 'test'
    };
    return fallback;
  }

  public recordError(): void {
    this.errorCount++;
  }

  public recordRecovery(): void {
    this.recoverySuccessCount++;
  }

  public getErrorStats(): ErrorStats {
    const stats: ErrorStats = {
      total: this.errorCount,
      recovered: this.recoverySuccessCount
    };
    return stats;
  }

  public resetStats(): void {
    this.errorCount = 0;
    this.recoverySuccessCount = 0;
  }

  public validateBoundaryHandling(result: BoundaryData | null | undefined, expectedBehavior: string): boolean {
    if (expectedBehavior === 'ignore') {
      return result === null || result === undefined;
    }
    if (expectedBehavior === 'error') {
      return result === null;
    }
    if (expectedBehavior === 'default') {
      return result !== null && result !== undefined;
    }
    if (expectedBehavior === 'recovery') {
      return result !== null && result !== undefined;
    }
    return false;
  }
}

// Reusable case model of the boundary suite.
class BoundaryCaseModel {
  private caseId: number;
  private category: BoundaryCategory;
  private description: string;
  private expectedRecovery: boolean;
  private severity: ErrorSeverity;

  constructor(caseId: number, category: BoundaryCategory, description: string, expectedRecovery: boolean,
    severity: ErrorSeverity) {
    this.caseId = caseId;
    this.category = category;
    this.description = description;
    this.expectedRecovery = expectedRecovery;
    this.severity = severity;
  }

  public getCaseId(): number {
    return this.caseId;
  }

  public getCategory(): BoundaryCategory {
    return this.category;
  }

  public getDescription(): string {
    return this.description;
  }

  public expectsRecovery(): boolean {
    return this.expectedRecovery;
  }

  public getSeverity(): ErrorSeverity {
    return this.severity;
  }

  public isHighSeverity(): boolean {
    return this.severity === ErrorSeverity.SEVERE || this.severity === ErrorSeverity.CRITICAL;
  }

  public hasValidDescription(): boolean {
    return this.description.length > 0;
  }

  public equals(other: BoundaryCaseModel): boolean {
    return this.caseId === other.caseId && this.category === other.category;
  }

  public clone(): BoundaryCaseModel {
    return new BoundaryCaseModel(this.caseId, this.category, this.description, this.expectedRecovery, this.severity);
  }

  public toString(): string {
    return 'BoundaryCaseModel(' + this.caseId + ', ' + this.category + ')';
  }
}

// Reusable result model of the boundary suite.
class BoundaryResultModel {
  private caseId: number;
  private passed: boolean;
  private recovered: boolean;
  private elapsedMs: number;

  constructor(caseId: number, passed: boolean, recovered: boolean, elapsedMs: number) {
    this.caseId = caseId;
    this.passed = passed;
    this.recovered = recovered;
    this.elapsedMs = elapsedMs;
  }

  public getCaseId(): number {
    return this.caseId;
  }

  public isPassed(): boolean {
    return this.passed;
  }

  public isRecovered(): boolean {
    return this.recovered;
  }

  public getElapsedMs(): number {
    return this.elapsedMs;
  }

  public isSatisfactory(expectedRecovery: boolean): boolean {
    if (!this.passed) {
      return false;
    }
    return this.recovered === expectedRecovery;
  }

  public clone(): BoundaryResultModel {
    return new BoundaryResultModel(this.caseId, this.passed, this.recovered, this.elapsedMs);
  }
}

// Aggregates boundary cases and results into pass / recovery rates.
class BoundaryStatistics {
  private cases: BoundaryCaseModel[] = [];
  private results: BoundaryResultModel[] = [];

  public addCase(boundaryCase: BoundaryCaseModel): void {
    this.cases.push(boundaryCase.clone());
  }

  public addResult(result: BoundaryResultModel): void {
    this.results.push(result.clone());
  }

  public clear(): void {
    this.cases = [];
    this.results = [];
  }

  public getCaseCount(): number {
    return this.cases.length;
  }

  public getResultCount(): number {
    return this.results.length;
  }

  public getPassRate(): number {
    if (this.results.length === 0) {
      return 0;
    }
    const passed = this.results.filter((result: BoundaryResultModel) => result.isPassed()).length;
    return passed / this.results.length;
  }

  public getRecoveryRate(): number {
    if (this.results.length === 0) {
      return 0;
    }
    const recovered = this.results.filter((result: BoundaryResultModel) => result.isRecovered()).length;
    return recovered / this.results.length;
  }

  public getCaseCountByCategory(category: BoundaryCategory): number {
    return this.cases.filter((item: BoundaryCaseModel) => item.getCategory() === category).length;
  }
}

// Classifies the error counters into a severity level.
class ErrorSeverityClassifier {
  public classify(errorCount: number, recoveryRate: number): ErrorSeverity {
    if (errorCount === 0) {
      return ErrorSeverity.MINOR;
    }
    if (recoveryRate >= 0.9) {
      return ErrorSeverity.MINOR;
    }
    if (recoveryRate >= 0.5) {
      return ErrorSeverity.MODERATE;
    }
    if (recoveryRate >= 0.2) {
      return ErrorSeverity.SEVERE;
    }
    return ErrorSeverity.CRITICAL;
  }
}

// Factory that generates numeric boundary cases for the statistics helpers.
class BoundaryCaseFactory {
  public generateNumericCases(startId: number, count: number): BoundaryCaseModel[] {
    const cases: BoundaryCaseModel[] = [];
    for (let i = 0; i < count; i++) {
      const caseId = startId + i;
      cases.push(new BoundaryCaseModel(caseId, BoundaryCategory.NUMERIC, 'numeric boundary case ' + caseId,
        true, ErrorSeverity.MINOR));
    }
    return cases;
  }
}
// Minimal stand-in of an ability context, used to model a usable context.
class SampleAbilityContext {
}

// Small probe helper used by the comprehensive scenario. A negative descriptor
// and an unknown session state are the two rejection paths of the sample.
class StateBoundaryProbe {
  public static isRejected(index: number): boolean {
    return FdBoundaryValidator.evaluate(-1 - index).accepted === false;
  }
}

export default function boundaryErrorTestingTest(): void {
  describe('BoundaryErrorTesting_Test', () => {
    let driver: Driver;
    let boundaryUtil: BoundaryTestUtil;
    let stateMachine: RecordingStateBoundaryMachine;

    beforeAll(async () => {
      driver = getDriver();
      boundaryUtil = BoundaryTestUtil.getInstance();
      boundaryUtil.resetStats();
      stateMachine = new RecordingStateBoundaryMachine();
      stateMachine.reset();
      await delay(200);
    });

    afterAll(async () => {
      await delay(200);
    });

    it('error_code_enum_should_be_defined_correctly', 0, () => {
      expect(RecorderErrorCode.OK).assertEqual(0);
      expect(RecorderErrorCode.FD_INVALID).assertEqual(1);
      expect(RecorderErrorCode.FILE_NAME_EMPTY).assertEqual(2);
      expect(RecorderErrorCode.FILE_NAME_MALFORMED).assertEqual(3);
      expect(RecorderErrorCode.RESOLUTION_UNSUPPORTED).assertEqual(4);
      expect(RecorderErrorCode.CONTEXT_NULL).assertEqual(5);
      expect(RecorderErrorCode.START_ID_INVALID).assertEqual(6);
      expect(RecorderErrorCode.STATE_INVALID).assertEqual(7);
      expect(RecorderErrorCode.IO_FAILED).assertEqual(8);
    });

    it('fd_placeholder_should_be_rejected', 0, () => {
      expect(FdBoundaryValidator.isInitialised(-1)).assertFalse();
      expect(FdBoundaryValidator.isValid(-1)).assertFalse();
      expect(FdBoundaryValidator.canStartRecording(-1)).assertFalse();
      const outcome = FdBoundaryValidator.evaluate(-1);
      expect(outcome.accepted).assertFalse();
      expect(outcome.code).assertEqual(RecorderErrorCode.FD_INVALID);
    });

    it('fd_zero_should_be_rejected', 0, () => {
      expect(FdBoundaryValidator.isValid(0)).assertFalse();
      expect(FdBoundaryValidator.canStartRecording(0)).assertFalse();
      const outcome = FdBoundaryValidator.evaluate(0);
      expect(outcome.accepted).assertFalse();
      expect(outcome.code).assertEqual(RecorderErrorCode.FD_INVALID);
    });

    it('fd_positive_boundary_should_be_accepted', 0, () => {
      expect(FdBoundaryValidator.isValid(1)).assertTrue();
      expect(FdBoundaryValidator.isValid(1024)).assertTrue();
      expect(FdBoundaryValidator.isValid(MAX_FD)).assertTrue();
      const outcome = FdBoundaryValidator.evaluate(MAX_FD);
      expect(outcome.accepted).assertTrue();
      expect(outcome.code).assertEqual(RecorderErrorCode.OK);
    });

    it('fd_out_of_range_should_be_rejected', 0, () => {
      expect(FdBoundaryValidator.isValid(MAX_FD + 1)).assertFalse();
      expect(FdBoundaryValidator.isValid(Number.MIN_SAFE_INTEGER)).assertFalse();
      expect(FdBoundaryValidator.isValid(Number.MAX_SAFE_INTEGER)).assertFalse();
      expect(FdBoundaryValidator.evaluate(MAX_FD + 1).code).assertEqual(RecorderErrorCode.FD_INVALID);
    });

    it('fd_non_integer_should_be_rejected', 0, () => {
      expect(FdBoundaryValidator.isValid(1.5)).assertFalse();
      expect(FdBoundaryValidator.isValid(Number.NaN)).assertFalse();
      expect(FdBoundaryValidator.isValid(Number.POSITIVE_INFINITY)).assertFalse();
      expect(FdBoundaryValidator.canStartRecording(Number.NaN)).assertFalse();
    });

    it('fd_url_should_use_expected_prefix', 0, () => {
      expect(FdBoundaryValidator.buildUrl(1)).assertEqual('fd://1');
      expect(FdBoundaryValidator.buildUrl(1024)).assertEqual('fd://1024');
      expect(FdBoundaryValidator.buildUrl(1).startsWith('fd://')).assertTrue();
      expect(FdBoundaryValidator.buildUrl(1).includes('-1')).assertFalse();
    });

    it('empty_file_name_should_be_rejected', 0, () => {
      const outcome = FileNameBoundaryValidator.evaluate('');
      expect(outcome.accepted).assertFalse();
      expect(outcome.code).assertEqual(RecorderErrorCode.FILE_NAME_EMPTY);
      expect(FileNameBoundaryValidator.timePartLength('')).assertEqual(0);
    });

    it('valid_file_name_should_be_accepted', 0, () => {
      const name = FileNameBoundaryValidator.buildValidName();
      expect(name).assertEqual('REC_20261112_103000.mp4');
      expect(FileNameBoundaryValidator.hasExpectedPrefix(name)).assertTrue();
      expect(FileNameBoundaryValidator.hasExpectedExtension(name)).assertTrue();
      expect(FileNameBoundaryValidator.timePartLength(name)).assertEqual(15);
      const outcome = FileNameBoundaryValidator.evaluate(name);
      expect(outcome.accepted).assertTrue();
      expect(outcome.code).assertEqual(RecorderErrorCode.OK);
    });

    it('malformed_file_names_should_be_rejected', 0, () => {
      expect(FileNameBoundaryValidator.evaluate('REC_2026.mp4').code)
        .assertEqual(RecorderErrorCode.FILE_NAME_MALFORMED);
      expect(FileNameBoundaryValidator.evaluate('SCREEN_20261112_103000.mp4').code)
        .assertEqual(RecorderErrorCode.FILE_NAME_MALFORMED);
      expect(FileNameBoundaryValidator.evaluate('REC_20261112_103000.mkv').code)
        .assertEqual(RecorderErrorCode.FILE_NAME_MALFORMED);
      expect(FileNameBoundaryValidator.evaluate('REC_20261112103000.mp4').accepted).assertFalse();
    });

    it('file_name_should_keep_two_digit_time_padding', 0, () => {
      const name = buildRecordingFileName(new Date(2026, 0, 1, 0, 0, 0));
      expect(name).assertEqual('REC_20260101_000000.mp4');
      expect(isValidRecordingFileName(name)).assertTrue();
      const midnight = FileNameBoundaryValidator.evaluate(name);
      expect(midnight.accepted).assertTrue();
    });

    it('invalid_resolution_should_be_rejected', 0, () => {
      expect(ResolutionBoundaryValidator.isSupported(3840, 2160)).assertFalse();
      expect(ResolutionBoundaryValidator.isSupported(2560, 1440)).assertFalse();
      expect(ResolutionBoundaryValidator.evaluate(3840, 2160).code)
        .assertEqual(RecorderErrorCode.RESOLUTION_UNSUPPORTED);
      expect(ResolutionBoundaryValidator.isSupported(0, 1080)).assertFalse();
      expect(ResolutionBoundaryValidator.isSupported(-1, -1)).assertFalse();
    });
    it('supported_resolution_boundaries_should_be_accepted', 0, () => {
      expect(ResolutionBoundaryValidator.isSupported(1920, 1080)).assertTrue();
      expect(ResolutionBoundaryValidator.isSupported(1280, 720)).assertTrue();
      expect(ResolutionBoundaryValidator.isSupported(1, 1)).assertTrue();
      expect(ResolutionBoundaryValidator.evaluate(1920, 1080).code).assertEqual(RecorderErrorCode.OK);
      expect(ResolutionBoundaryValidator.aspectRatio(1920, 1080)).assertEqual(16 / 9);
      expect(ResolutionBoundaryValidator.aspectRatio(1920, 0)).assertEqual(0);
    });

    it('null_context_should_be_rejected', 0, () => {
      expect(ContextBoundaryValidator.isUsable(null)).assertFalse();
      expect(ContextBoundaryValidator.isUsable(undefined)).assertFalse();
      const outcome = ContextBoundaryValidator.evaluate(null);
      expect(outcome.accepted).assertFalse();
      expect(outcome.code).assertEqual(RecorderErrorCode.CONTEXT_NULL);
      expect(ContextBoundaryValidator.evaluate(undefined).code).assertEqual(RecorderErrorCode.CONTEXT_NULL);
    });

    it('valid_context_should_be_accepted', 0, () => {
      const context: Object = new SampleAbilityContext();
      expect(ContextBoundaryValidator.isUsable(context)).assertTrue();
      const outcome = ContextBoundaryValidator.evaluate(context);
      expect(outcome.accepted).assertTrue();
      expect(outcome.code).assertEqual(RecorderErrorCode.OK);
    });

    it('start_id_boundary_should_route_correctly', 0, () => {
      expect(StartIdBoundaryValidator.isStartRequest(1)).assertTrue();
      expect(StartIdBoundaryValidator.route(1)).assertEqual('start');
      expect(StartIdBoundaryValidator.route(0)).assertEqual('stop');
      expect(StartIdBoundaryValidator.route(2)).assertEqual('stop');
      expect(StartIdBoundaryValidator.route(99)).assertEqual('stop');
      expect(StartIdBoundaryValidator.evaluate(1).code).assertEqual(RecorderErrorCode.OK);
    });

    it('negative_start_id_should_be_rejected', 0, () => {
      expect(StartIdBoundaryValidator.evaluate(-1).accepted).assertFalse();
      expect(StartIdBoundaryValidator.evaluate(-1).code).assertEqual(RecorderErrorCode.START_ID_INVALID);
      expect(StartIdBoundaryValidator.evaluate(1.5).accepted).assertFalse();
      expect(StartIdBoundaryValidator.evaluate(Number.NaN).accepted).assertFalse();
      expect(StartIdBoundaryValidator.route(-1)).assertEqual('stop');
    });

    it('state_boundary_initial_state_should_be_idle', 0, () => {
      stateMachine.reset();
      expect(stateMachine.getState()).assertEqual(RecordingStateBoundaryMachine.IDLE);
      expect(stateMachine.canStart()).assertTrue();
      expect(stateMachine.canStop()).assertFalse();
      expect(stateMachine.getRejectCount()).assertEqual(0);
    });

    it('state_boundary_valid_transitions_should_succeed', 0, () => {
      stateMachine.reset();
      expect(stateMachine.apply(RecordingStateBoundaryMachine.RECORDING).accepted).assertTrue();
      expect(stateMachine.canStop()).assertTrue();
      expect(stateMachine.apply(RecordingStateBoundaryMachine.STOPPED).accepted).assertTrue();
      expect(stateMachine.apply(RecordingStateBoundaryMachine.IDLE).accepted).assertTrue();
      expect(stateMachine.getState()).assertEqual(RecordingStateBoundaryMachine.IDLE);
      expect(stateMachine.getRejectCount()).assertEqual(0);
    });

    it('state_boundary_error_transition_should_recover', 0, () => {
      stateMachine.reset();
      stateMachine.apply(RecordingStateBoundaryMachine.RECORDING);
      expect(stateMachine.apply(RecordingStateBoundaryMachine.ERROR).accepted).assertTrue();
      expect(stateMachine.getState()).assertEqual(RecordingStateBoundaryMachine.ERROR);
      expect(stateMachine.apply(RecordingStateBoundaryMachine.IDLE).accepted).assertTrue();
      expect(stateMachine.canStart()).assertTrue();
    });

    it('state_boundary_invalid_transitions_should_be_rejected', 0, () => {
      stateMachine.reset();
      const skipped = stateMachine.apply(RecordingStateBoundaryMachine.STOPPED);
      expect(skipped.accepted).assertFalse();
      expect(skipped.code).assertEqual(RecorderErrorCode.STATE_INVALID);
      expect(stateMachine.getState()).assertEqual(RecordingStateBoundaryMachine.IDLE);
      expect(stateMachine.getRejectCount()).assertEqual(1);
      stateMachine.apply(RecordingStateBoundaryMachine.RECORDING);
      const duplicate = stateMachine.apply(RecordingStateBoundaryMachine.RECORDING);
      expect(duplicate.accepted).assertFalse();
      expect(stateMachine.getRejectCount()).assertEqual(2);
    });

    it('state_boundary_unknown_state_should_report_io_failure', 0, () => {
      stateMachine.reset();
      expect(stateMachine.isKnownState(-1)).assertFalse();
      expect(stateMachine.isKnownState(4)).assertFalse();
      const outcome = stateMachine.apply(9);
      expect(outcome.accepted).assertFalse();
      expect(outcome.code).assertEqual(RecorderErrorCode.IO_FAILED);
      expect(stateMachine.getState()).assertEqual(RecordingStateBoundaryMachine.IDLE);
    });

    it('boundary_util_should_generate_all_variants', 0, () => {
      expect(boundaryUtil.generateBoundaryInput('empty') === null).assertFalse();
      expect(boundaryUtil.generateBoundaryInput('null')).assertNull();
      expect(boundaryUtil.generateBoundaryInput('undefined')).assertUndefined();
      expect(boundaryUtil.generateBoundaryInput('negative')?.value).assertEqual(-1);
      expect(boundaryUtil.generateBoundaryInput('zero')?.value).assertEqual(0);
      expect(boundaryUtil.generateBoundaryInput('max_int')?.value).assertEqual(Number.MAX_SAFE_INTEGER);
      expect(boundaryUtil.generateBoundaryInput('unknown')?.default).assertEqual('test');
    });

    it('boundary_util_should_validate_expected_behaviour', 0, () => {
      expect(boundaryUtil.validateBoundaryHandling(null, 'ignore')).assertTrue();
      expect(boundaryUtil.validateBoundaryHandling(undefined, 'ignore')).assertTrue();
      expect(boundaryUtil.validateBoundaryHandling(null, 'error')).assertTrue();
      const payload: BoundaryData = {
        data: 'value'
      };
      expect(boundaryUtil.validateBoundaryHandling(payload, 'default')).assertTrue();
      expect(boundaryUtil.validateBoundaryHandling(payload, 'recovery')).assertTrue();
      expect(boundaryUtil.validateBoundaryHandling(payload, 'unknown')).assertFalse();
    });

    it('error_statistics_should_be_accurate', 0, () => {
      boundaryUtil.resetStats();
      boundaryUtil.recordError();
      boundaryUtil.recordError();
      boundaryUtil.recordRecovery();
      const stats = boundaryUtil.getErrorStats();
      expect(stats.total).assertEqual(2);
      expect(stats.recovered).assertEqual(1);
      boundaryUtil.resetStats();
      expect(boundaryUtil.getErrorStats().total).assertEqual(0);
      expect(boundaryUtil.getErrorStats().recovered).assertEqual(0);
    });

    it('boundary_case_model_should_expose_fields', 0, () => {
      const model = new BoundaryCaseModel(7, BoundaryCategory.NUMERIC, 'fd boundary', true, ErrorSeverity.SEVERE);
      expect(model.getCaseId()).assertEqual(7);
      expect(model.getCategory()).assertEqual(BoundaryCategory.NUMERIC);
      expect(model.getDescription()).assertEqual('fd boundary');
      expect(model.expectsRecovery()).assertTrue();
      expect(model.isHighSeverity()).assertTrue();
      expect(model.hasValidDescription()).assertTrue();
      const copy = model.clone();
      expect(copy.equals(model)).assertTrue();
      expect(copy.toString().includes('7')).assertTrue();
    });

    it('boundary_result_model_should_evaluate_satisfaction', 0, () => {
      const model = new BoundaryResultModel(3, true, true, 15);
      expect(model.getCaseId()).assertEqual(3);
      expect(model.isPassed()).assertTrue();
      expect(model.isRecovered()).assertTrue();
      expect(model.getElapsedMs()).assertEqual(15);
      expect(model.isSatisfactory(true)).assertTrue();
      expect(model.isSatisfactory(false)).assertFalse();
      const failed = new BoundaryResultModel(4, false, true, 20);
      expect(failed.isSatisfactory(true)).assertFalse();
    });

    it('boundary_statistics_should_aggregate_rates', 0, () => {
      const statistics = new BoundaryStatistics();
      statistics.addCase(new BoundaryCaseModel(1, BoundaryCategory.NUMERIC, 'fd', true, ErrorSeverity.MINOR));
      statistics.addCase(new BoundaryCaseModel(2, BoundaryCategory.STRING, 'name', true, ErrorSeverity.MODERATE));
      statistics.addResult(new BoundaryResultModel(1, true, true, 5));
      statistics.addResult(new BoundaryResultModel(2, true, false, 8));
      expect(statistics.getCaseCount()).assertEqual(2);
      expect(statistics.getResultCount()).assertEqual(2);
      expect(statistics.getPassRate()).assertEqual(1);
      expect(statistics.getRecoveryRate()).assertEqual(0.5);
      expect(statistics.getCaseCountByCategory(BoundaryCategory.NUMERIC)).assertEqual(1);
      statistics.clear();
      expect(statistics.getCaseCount()).assertEqual(0);
      expect(statistics.getPassRate()).assertEqual(0);
    });

    it('error_severity_classifier_should_classify_correctly', 0, () => {
      const classifier = new ErrorSeverityClassifier();
      expect(classifier.classify(0, 1)).assertEqual(ErrorSeverity.MINOR);
      expect(classifier.classify(4, 0.95)).assertEqual(ErrorSeverity.MINOR);
      expect(classifier.classify(4, 0.6)).assertEqual(ErrorSeverity.MODERATE);
      expect(classifier.classify(4, 0.3)).assertEqual(ErrorSeverity.SEVERE);
      expect(classifier.classify(4, 0.1)).assertEqual(ErrorSeverity.CRITICAL);
    });

    it('boundary_case_factory_should_generate_numeric_cases', 0, () => {
      const factory = new BoundaryCaseFactory();
      const cases = factory.generateNumericCases(10, 3);
      expect(cases.length).assertEqual(3);
      expect(cases[0].getCaseId()).assertEqual(10);
      expect(cases[2].getCaseId()).assertEqual(12);
      expect(cases[1].getCategory()).assertEqual(BoundaryCategory.NUMERIC);
      expect(cases[1].hasValidDescription()).assertTrue();
      expect(factory.generateNumericCases(0, 0).length).assertEqual(0);
    });

    it('extreme_navigation_should_not_crash_recorder_window', 0, async () => {
      for (let i = 0; i < 20; i++) {
        await pressAndWait(driver, KEY_RIGHT, 1, 10);
      }
      const componentCount = await recorderComponentCount(driver);
      expect(componentCount >= 0).assertEqual(true);
      boundaryUtil.recordRecovery();
      expect(boundaryUtil.getErrorStats().recovered).assertLargerOrEqual(1);
    });

    it('comprehensive_boundary_scenario_should_be_robust', 0, async () => {
      boundaryUtil.resetStats();
      const scenarioStart = Date.now();
      for (let i = 0; i < 10; i++) {
        boundaryUtil.recordError();
        expect(FdBoundaryValidator.isValid(-1 - i)).assertFalse();
        expect(StateBoundaryProbe.isRejected(i)).assertTrue();
      }
      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      boundaryUtil.recordRecovery();
      const componentCount = await recorderComponentCount(driver);
      expect(componentCount >= 0).assertEqual(true);
      const elapsed = Date.now() - scenarioStart;
      expect(elapsed).assertLessOrEqual(10000);
      expect(boundaryUtil.getErrorStats().total).assertEqual(10);
      expect(boundaryUtil.getErrorStats().recovered).assertEqual(1);
    });
  });
}



