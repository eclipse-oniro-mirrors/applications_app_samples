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

import { describe, it, expect, beforeEach } from '@ohos/hypium'

// Business error codes thrown by the media and photo access APIs.
enum BusinessErrorCode {
  NONE = 0,
  PERMISSION_DENIED = 201,
  PARAM_INVALID = 401,
  SERVICE_UNAVAILABLE = 5400101,
  IO_ERROR = 5400102,
  RESOURCE_BUSY = 5400103
}

// Source category of a thrown exception.
enum ExceptionCategory {
  INPUT = 'input',
  STATE = 'state',
  RESOURCE = 'resource',
  ENVIRONMENT = 'environment'
}

// Handling strategy of a thrown exception.
enum ExceptionStrategy {
  RETRY = 'retry',
  ABORT = 'abort',
  SWALLOW = 'swallow',
  PROPAGATE = 'propagate'
}

// Normalized shape of a thrown exception.
interface NormalizedException {
  name: string
  code: number
  message: string
}

// One handled exception.
interface RecorderExceptionRecord {
  category: ExceptionCategory
  code: number
  operationName: string
  caught: boolean
  recovered: boolean
  responseMs: number
  timestamp: number
}

// Aggregated exception statistics.
interface RecorderExceptionSummary {
  totalExceptions: number
  caughtCount: number
  uncaughtCount: number
  recoveredCount: number
  catchRate: number
  recoveryRate: number
}

// Strategy configuration of one business error code.
interface ExceptionStrategyConfig {
  code: BusinessErrorCode
  strategy: ExceptionStrategy
  maxRetryCount: number
  enabled: boolean
}

// One disposition of a handled exception.
interface ExceptionDisposition {
  code: BusinessErrorCode
  operationName: string
  strategy: ExceptionStrategy
  retryCount: number
}

// Monitoring metrics of the exception handler.
interface ExceptionMonitorMetrics {
  observedExceptions: number
  alertedExceptions: number
  recoveredExceptions: number
  alertRate: number
}

// Stub of @ohos.base.BusinessError used to exercise the catch paths without
// depending on a concrete device capability.
class BusinessErrorStub extends Error {
  public code: number

  constructor(name: string, code: number, message: string) {
    super(message)
    this.name = name
    this.code = code
  }
}

// Plain thrown payload used to exercise the fallback branch of the normalizer.
class PlainThrownPayload {
  public toString(): string {
    return 'unexpected-value'
  }
}

// Normalizes any thrown value into a stable structure so that the state
// callback always receives a typed exception.
class BusinessErrorNormalizer {  public static normalize(error: Object | null | undefined): NormalizedException {
    if (error === null || error === undefined) {
      const nullError: NormalizedException = {
        name: 'NullError',
        code: BusinessErrorCode.NONE,
        message: 'null context'
      }
      return nullError
    }
    if (error instanceof BusinessErrorStub) {
      const business: NormalizedException = {
        name: error.name,
        code: error.code,
        message: error.message
      }
      return business
    }
    if (error instanceof Error) {
      const runtime: NormalizedException = {
        name: error.name,
        code: BusinessErrorCode.NONE,
        message: error.message
      }
      return runtime
    }
    const fallback: NormalizedException = {
      name: 'UnknownError',
      code: BusinessErrorCode.NONE,
      message: String(error)
    }
    return fallback
  }

  public static isBusinessError(error: NormalizedException): boolean {
    return error.code !== BusinessErrorCode.NONE
  }

  public static toDisplayText(error: NormalizedException): string {
    return `${error.name}(${error.code}): ${error.message}`
  }
}

// Runs one recorder operation and converts every thrown exception into a
// normalized record. The state callback receives the normalized exception so
// that no rejection escapes to the host process.
class RecorderOperationRunner {
  private records: RecorderExceptionRecord[] = []
  private callback: ((error: NormalizedException) => void) | null = null
  private propagationCount: number = 0
  private clock: number = 1700000000000

  public setStateCallback(callback: (error: NormalizedException) => void): void {
    this.callback = callback
  }

  public run(operationName: string, operation: () => void): boolean {
    try {
      operation()
      return true
    } catch (error) {
      const normalized = BusinessErrorNormalizer.normalize(error)
      this.record(operationName, normalized, true)
      this.propagate(normalized)
      return false
    }
  }

  private record(operationName: string, exception: NormalizedException, caught: boolean): void {
    const record: RecorderExceptionRecord = {
      category: new RecorderExceptionClassifier().classify(exception.code),
      code: exception.code,
      operationName: operationName,
      caught: caught,
      recovered: false,
      responseMs: 5,
      timestamp: this.clock
    }
    this.records.push(record)
    this.clock += 5
  }

  private propagate(exception: NormalizedException): void {
    if (this.callback !== null) {
      this.callback(exception)
      this.propagationCount += 1
    }
  }

  public getRecords(): RecorderExceptionRecord[] {
    return this.records.slice()
  }

  public getPropagationCount(): number {
    return this.propagationCount
  }

  public countOperation(operationName: string): number {
    let count = 0
    for (const record of this.records) {
      if (record.operationName === operationName) {
        count += 1
      }
    }
    return count
  }

  public reset(): void {
    this.records = []
    this.propagationCount = 0
    this.clock = 1700000000000
  }
}

// Classifies a business error code into an exception category.
class RecorderExceptionClassifier {
  public classify(code: number): ExceptionCategory {
    if (code === BusinessErrorCode.PARAM_INVALID) {
      return ExceptionCategory.INPUT
    }
    if (code === BusinessErrorCode.RESOURCE_BUSY) {
      return ExceptionCategory.STATE
    }
    if (code === BusinessErrorCode.IO_ERROR) {
      return ExceptionCategory.RESOURCE
    }
    if (code === BusinessErrorCode.SERVICE_UNAVAILABLE) {
      return ExceptionCategory.ENVIRONMENT
    }
    if (code === BusinessErrorCode.PERMISSION_DENIED) {
      return ExceptionCategory.ENVIRONMENT
    }
    return ExceptionCategory.INPUT
  }

  public isEnvironment(code: number): boolean {
    return this.classify(code) === ExceptionCategory.ENVIRONMENT
  }

  public isRecoverable(code: number): boolean {
    return this.classify(code) !== ExceptionCategory.INPUT
  }
}

// Journal that aggregates handled exceptions for the reports.
class RecorderExceptionTracker {
  private records: RecorderExceptionRecord[] = []

  public append(category: ExceptionCategory, code: number, operationName: string, caught: boolean,
    recovered: boolean, responseMs: number): void {
    const record: RecorderExceptionRecord = {
      category: category,
      code: code,
      operationName: operationName,
      caught: caught,
      recovered: recovered,
      responseMs: responseMs,
      timestamp: 1700000000000 + this.records.length * 5
    }
    this.records.push(record)
  }

  public getRecords(): RecorderExceptionRecord[] {
    return this.records.slice()
  }

  public getTotal(): number {
    return this.records.length
  }

  public countCaught(): number {
    let count = 0
    for (const record of this.records) {
      if (record.caught) {
        count += 1
      }
    }
    return count
  }

  public countRecovered(): number {
    let count = 0
    for (const record of this.records) {
      if (record.recovered) {
        count += 1
      }
    }
    return count
  }

  public countCategory(category: ExceptionCategory): number {
    let count = 0
    for (const record of this.records) {
      if (record.category === category) {
        count += 1
      }
    }
    return count
  }

  public countCode(code: number): number {
    let count = 0
    for (const record of this.records) {
      if (record.code === code) {
        count += 1
      }
    }
    return count
  }

  public getCatchRate(): number {
    if (this.records.length === 0) {
      return 0
    }
    return this.countCaught() / this.records.length
  }

  public getRecoveryRate(): number {
    if (this.records.length === 0) {
      return 0
    }
    return this.countRecovered() / this.records.length
  }

  public isChronological(): boolean {
    for (let i = 1; i < this.records.length; i++) {
      if (this.records[i - 1].timestamp > this.records[i].timestamp) {
        return false
      }
    }
    return true
  }

  public reset(): void {
    this.records = []
  }
}

// Strategy configuration of every business error code.
class RecorderStrategyConfigurator {
  private configs: ExceptionStrategyConfig[]

  constructor() {
    this.configs = [
      {
        code: BusinessErrorCode.PERMISSION_DENIED,
        strategy: ExceptionStrategy.ABORT,
        maxRetryCount: 0,
        enabled: true
      },
      {
        code: BusinessErrorCode.PARAM_INVALID,
        strategy: ExceptionStrategy.ABORT,
        maxRetryCount: 0,
        enabled: true
      },
      {
        code: BusinessErrorCode.SERVICE_UNAVAILABLE,
        strategy: ExceptionStrategy.RETRY,
        maxRetryCount: 3,
        enabled: true
      },
      {
        code: BusinessErrorCode.IO_ERROR,
        strategy: ExceptionStrategy.RETRY,
        maxRetryCount: 2,
        enabled: true
      },
      {
        code: BusinessErrorCode.RESOURCE_BUSY,
        strategy: ExceptionStrategy.SWALLOW,
        maxRetryCount: 1,
        enabled: false
      }
    ]
  }

  public findConfig(code: BusinessErrorCode): ExceptionStrategyConfig | null {
    for (const config of this.configs) {
      if (config.code === code) {
        return config
      }
    }
    return null
  }

  public getConfigs(): ExceptionStrategyConfig[] {
    return this.configs.slice()
  }

  public countEnabled(): number {
    let count = 0
    for (const config of this.configs) {
      if (config.enabled) {
        count += 1
      }
    }
    return count
  }
}

// Builds the exception summary from a record list.
class RecorderSummaryBuilder {
  private records: RecorderExceptionRecord[]

  constructor(records: RecorderExceptionRecord[]) {
    this.records = records.slice()
  }

  public buildSummary(): RecorderExceptionSummary {
    const caught = this.countCaught()
    const recovered = this.countRecovered()
    const summary: RecorderExceptionSummary = {
      totalExceptions: this.records.length,
      caughtCount: caught,
      uncaughtCount: this.records.length - caught,
      recoveredCount: recovered,
      catchRate: this.records.length === 0 ? 0 : caught / this.records.length,
      recoveryRate: this.records.length === 0 ? 0 : recovered / this.records.length
    }
    return summary
  }

  private countCaught(): number {
    let count = 0
    for (const record of this.records) {
      if (record.caught) {
        count += 1
      }
    }
    return count
  }

  private countRecovered(): number {
    let count = 0
    for (const record of this.records) {
      if (record.recovered) {
        count += 1
      }
    }
    return count
  }
}

// Manages the dispositions applied to handled exceptions.
class RecorderDispositionManager {
  private dispositions: ExceptionDisposition[] = []

  public append(disposition: ExceptionDisposition): void {
    this.dispositions.push(disposition)
  }

  public getDispositions(): ExceptionDisposition[] {
    return this.dispositions.slice()
  }

  public filterByStrategy(strategy: ExceptionStrategy): ExceptionDisposition[] {
    const filtered: ExceptionDisposition[] = []
    for (const disposition of this.dispositions) {
      if (disposition.strategy === strategy) {
        filtered.push(disposition)
      }
    }
    return filtered
  }

  public canRetry(disposition: ExceptionDisposition): boolean {
    if (disposition.strategy !== ExceptionStrategy.RETRY) {
      return false
    }
    return disposition.retryCount < 3
  }

  public count(): number {
    return this.dispositions.length
  }

  public clear(): void {
    this.dispositions = []
  }
}

// Monitors the exception flow of the recorder.
class RecorderExceptionMonitor {
  private observed: number = 0
  private alerted: number = 0
  private recovered: number = 0
  private alerting: boolean = false

  public observe(code: number, recovered: boolean): void {
    this.observed += 1
    if (recovered) {
      this.recovered += 1
    } else {
      this.alerted += 1
      this.alerting = true
    }
  }

  public isAlerting(): boolean {
    return this.alerting
  }

  public clearAlert(): void {
    this.alerting = false
  }

  public buildMetrics(): ExceptionMonitorMetrics {
    const metrics: ExceptionMonitorMetrics = {
      observedExceptions: this.observed,
      alertedExceptions: this.alerted,
      recoveredExceptions: this.recovered,
      alertRate: this.observed === 0 ? 0 : this.alerted / this.observed
    }
    return metrics
  }

  public reset(): void {
    this.observed = 0
    this.alerted = 0
    this.recovered = 0
    this.alerting = false
  }
}

// Counts the occurrence of business error codes.
class RecorderExceptionCounter {
  private counts: Map<number, number> = new Map<number, number>()

  public increment(code: number): void {
    const current = this.counts.get(code)
    if (current === undefined) {
      this.counts.set(code, 1)
    } else {
      this.counts.set(code, current + 1)
    }
  }

  public getCount(code: number): number {
    const current = this.counts.get(code)
    if (current === undefined) {
      return 0
    }
    return current
  }

  public getMostFrequent(): number {
    let bestCode = BusinessErrorCode.NONE
    let bestCount = 0
    const keys = this.counts.keys()
    for (const key of keys) {
      const value = this.counts.get(key)
      if (value !== undefined && value > bestCount) {
        bestCount = value
        bestCode = key
      }
    }
    return bestCode
  }

  public clear(): void {
    this.counts = new Map<number, number>()
  }
}

// One alert raised by the exception monitor.
class RecorderExceptionAlert {
  private code: number
  private message: string

  constructor(code: number, message: string) {
    this.code = code
    this.message = message
  }

  public getCode(): number {
    return this.code
  }

  public getMessage(): string {
    return this.message
  }

  public toString(): string {
    return `Alert(${this.code}): ${this.message}`
  }
}

// Collects the alerts of one recorder run.
class RecorderAlertManager {
  private alerts: RecorderExceptionAlert[] = []

  public append(alert: RecorderExceptionAlert): void {
    this.alerts.push(alert)
  }

  public filterByCode(code: number): RecorderExceptionAlert[] {
    const filtered: RecorderExceptionAlert[] = []
    for (const alert of this.alerts) {
      if (alert.getCode() === code) {
        filtered.push(alert)
      }
    }
    return filtered
  }

  public count(): number {
    return this.alerts.length
  }

  public clear(): void {
    this.alerts = []
  }
}

export default function exceptionHandlingTest(): void {
  describe('ExceptionHandling_Test', () => {
    let runner: RecorderOperationRunner
    let classifier: RecorderExceptionClassifier
    let tracker: RecorderExceptionTracker

    beforeEach(() => {
      runner = new RecorderOperationRunner()
      classifier = new RecorderExceptionClassifier()
      tracker = new RecorderExceptionTracker()
    })

    it('normalizer_should_map_error_instance', 0, () => {
      const normalized = BusinessErrorNormalizer.normalize(new Error('native start failed'))
      expect(normalized.name).assertEqual('Error')
      expect(normalized.code).assertEqual(BusinessErrorCode.NONE)
      expect(normalized.message).assertEqual('native start failed')
    })

    it('normalizer_should_map_business_error', 0, () => {
      const thrown = new BusinessErrorStub('BusinessError', BusinessErrorCode.IO_ERROR, 'io failure')
      const normalized = BusinessErrorNormalizer.normalize(thrown)
      expect(normalized.name).assertEqual('BusinessError')
      expect(normalized.code).assertEqual(5400102)
      expect(normalized.message).assertEqual('io failure')
    })

    it('normalizer_should_map_null_error', 0, () => {
      const normalized = BusinessErrorNormalizer.normalize(null)
      expect(normalized.name).assertEqual('NullError')
      expect(normalized.code).assertEqual(BusinessErrorCode.NONE)
      expect(normalized.message).assertContain('null')
    })

    it('normalizer_should_map_undefined_error', 0, () => {
      const normalized = BusinessErrorNormalizer.normalize(undefined)
      expect(normalized.name).assertEqual('NullError')
      expect(BusinessErrorNormalizer.isBusinessError(normalized)).assertFalse()
    })

    it('normalizer_should_map_plain_object', 0, () => {
      const normalized = BusinessErrorNormalizer.normalize(new PlainThrownPayload())
      expect(normalized.name).assertEqual('UnknownError')
      expect(normalized.message).assertEqual('unexpected-value')
    })

    it('normalizer_should_detect_business_error', 0, () => {
      const thrown = new BusinessErrorStub('BusinessError', BusinessErrorCode.PERMISSION_DENIED, 'denied')
      const normalized = BusinessErrorNormalizer.normalize(thrown)
      expect(BusinessErrorNormalizer.isBusinessError(normalized)).assertTrue()
      expect(normalized.code).assertEqual(201)
    })

    it('normalizer_should_render_display_text', 0, () => {
      const thrown = new BusinessErrorStub('BusinessError', BusinessErrorCode.RESOURCE_BUSY, 'busy')
      const text = BusinessErrorNormalizer.toDisplayText(BusinessErrorNormalizer.normalize(thrown))
      expect(text).assertContain('BusinessError')
      expect(text).assertContain('5400103')
      expect(text).assertContain('busy')
    })

    it('runner_should_execute_successful_operation', 0, () => {
      let executed = 0
      const succeed = runner.run('start_recording', () => {
        executed += 1
      })
      expect(succeed).assertTrue()
      expect(executed).assertEqual(1)
      expect(runner.getRecords().length).assertEqual(0)
      expect(runner.getPropagationCount()).assertEqual(0)
    })

    it('runner_should_catch_thrown_error', 0, () => {
      const succeed = runner.run('create_asset', () => {
        throw new Error('createAsset failed')
      })
      expect(succeed).assertFalse()
      const records = runner.getRecords()
      expect(records.length).assertEqual(1)
      expect(records[0].caught).assertTrue()
      expect(records[0].operationName).assertEqual('create_asset')
    })

    it('runner_should_normalize_business_error', 0, () => {
      runner.run('open_fd', () => {
        throw new BusinessErrorStub('BusinessError', BusinessErrorCode.IO_ERROR, 'openSync failed')
      })
      const record = runner.getRecords()[0]
      expect(record.code).assertEqual(BusinessErrorCode.IO_ERROR)
      expect(record.category).assertEqual(ExceptionCategory.RESOURCE)
    })

    it('runner_should_propagate_to_state_callback', 0, () => {
      let propagatedCode = -1
      runner.setStateCallback((error: NormalizedException) => {
        propagatedCode = error.code
      })
      runner.run('start_recording', () => {
        throw new BusinessErrorStub('BusinessError', BusinessErrorCode.SERVICE_UNAVAILABLE, 'service down')
      })
      expect(propagatedCode).assertEqual(BusinessErrorCode.SERVICE_UNAVAILABLE)
      expect(runner.getPropagationCount()).assertEqual(1)
    })

    it('runner_should_not_propagate_on_success', 0, () => {
      let callbackCount = 0
      runner.setStateCallback((_error: NormalizedException) => {
        callbackCount += 1
      })
      runner.run('stop_recording', () => {})
      expect(callbackCount).assertEqual(0)
      expect(runner.getPropagationCount()).assertEqual(0)
    })

    it('runner_should_avoid_unhandled_exception', 0, () => {
      const operations = ['start', 'stop', 'query']
      for (const operation of operations) {
        runner.run(operation, () => {
          throw new Error(`${operation} failed`)
        })
      }
      expect(runner.getRecords().length).assertEqual(3)
      expect(runner.countOperation('start')).assertEqual(1)
      expect(runner.countOperation('query')).assertEqual(1)
    })

    it('classifier_should_map_param_invalid', 0, () => {
      expect(classifier.classify(BusinessErrorCode.PARAM_INVALID)).assertEqual(ExceptionCategory.INPUT)
      expect(classifier.isRecoverable(BusinessErrorCode.PARAM_INVALID)).assertFalse()
    })

    it('classifier_should_map_resource_busy', 0, () => {
      expect(classifier.classify(BusinessErrorCode.RESOURCE_BUSY)).assertEqual(ExceptionCategory.STATE)
      expect(classifier.isRecoverable(BusinessErrorCode.RESOURCE_BUSY)).assertTrue()
    })

    it('classifier_should_map_io_error', 0, () => {
      expect(classifier.classify(BusinessErrorCode.IO_ERROR)).assertEqual(ExceptionCategory.RESOURCE)
      expect(classifier.isRecoverable(BusinessErrorCode.IO_ERROR)).assertTrue()
    })

    it('classifier_should_map_service_unavailable', 0, () => {
      expect(classifier.classify(BusinessErrorCode.SERVICE_UNAVAILABLE)).assertEqual(ExceptionCategory.ENVIRONMENT)
      expect(classifier.isEnvironment(BusinessErrorCode.SERVICE_UNAVAILABLE)).assertTrue()
    })

    it('classifier_should_map_permission_denied', 0, () => {
      expect(classifier.classify(BusinessErrorCode.PERMISSION_DENIED)).assertEqual(ExceptionCategory.ENVIRONMENT)
      expect(classifier.isEnvironment(BusinessErrorCode.PERMISSION_DENIED)).assertTrue()
    })

    it('classifier_should_default_to_input_category', 0, () => {
      expect(classifier.classify(BusinessErrorCode.NONE)).assertEqual(ExceptionCategory.INPUT)
      expect(classifier.isEnvironment(BusinessErrorCode.NONE)).assertFalse()
    })

    it('tracker_should_count_caught_exceptions', 0, () => {
      tracker.append(ExceptionCategory.RESOURCE, BusinessErrorCode.IO_ERROR, 'open_fd', true, true, 10)
      tracker.append(ExceptionCategory.ENVIRONMENT, BusinessErrorCode.SERVICE_UNAVAILABLE, 'start', true, false, 20)
      tracker.append(ExceptionCategory.INPUT, BusinessErrorCode.PARAM_INVALID, 'query', false, false, 5)
      expect(tracker.getTotal()).assertEqual(3)
      expect(tracker.countCaught()).assertEqual(2)
      expect(tracker.getCatchRate()).assertEqual(2 / 3)
    })

    it('tracker_should_compute_recovery_rate', 0, () => {
      tracker.append(ExceptionCategory.RESOURCE, BusinessErrorCode.IO_ERROR, 'open_fd', true, true, 10)
      tracker.append(ExceptionCategory.STATE, BusinessErrorCode.RESOURCE_BUSY, 'start', true, false, 10)
      expect(tracker.countRecovered()).assertEqual(1)
      expect(tracker.getRecoveryRate()).assertEqual(0.5)
    })

    it('tracker_should_count_categories', 0, () => {
      tracker.append(ExceptionCategory.RESOURCE, BusinessErrorCode.IO_ERROR, 'open_fd', true, true, 10)
      tracker.append(ExceptionCategory.RESOURCE, BusinessErrorCode.IO_ERROR, 'close_fd', true, true, 10)
      tracker.append(ExceptionCategory.ENVIRONMENT, BusinessErrorCode.PERMISSION_DENIED, 'start', true, false, 10)
      expect(tracker.countCategory(ExceptionCategory.RESOURCE)).assertEqual(2)
      expect(tracker.countCategory(ExceptionCategory.ENVIRONMENT)).assertEqual(1)
      expect(tracker.countCategory(ExceptionCategory.STATE)).assertEqual(0)
    })

    it('tracker_should_count_codes', 0, () => {
      tracker.append(ExceptionCategory.RESOURCE, BusinessErrorCode.IO_ERROR, 'open_fd', true, true, 10)
      tracker.append(ExceptionCategory.RESOURCE, BusinessErrorCode.IO_ERROR, 'read_fd', true, true, 10)
      tracker.append(ExceptionCategory.STATE, BusinessErrorCode.RESOURCE_BUSY, 'start', true, false, 10)
      expect(tracker.countCode(BusinessErrorCode.IO_ERROR)).assertEqual(2)
      expect(tracker.countCode(BusinessErrorCode.RESOURCE_BUSY)).assertEqual(1)
      expect(tracker.countCode(BusinessErrorCode.NONE)).assertEqual(0)
    })

    it('tracker_should_be_chronological', 0, () => {
      tracker.append(ExceptionCategory.RESOURCE, BusinessErrorCode.IO_ERROR, 'open_fd', true, true, 10)
      tracker.append(ExceptionCategory.STATE, BusinessErrorCode.RESOURCE_BUSY, 'start', true, true, 10)
      tracker.append(ExceptionCategory.ENVIRONMENT, BusinessErrorCode.PERMISSION_DENIED, 'start', true, false, 10)
      expect(tracker.isChronological()).assertTrue()
    })

    it('tracker_should_reset_records', 0, () => {
      tracker.append(ExceptionCategory.RESOURCE, BusinessErrorCode.IO_ERROR, 'open_fd', true, true, 10)
      tracker.reset()
      expect(tracker.getTotal()).assertEqual(0)
      expect(tracker.getCatchRate()).assertEqual(0)
      expect(tracker.getRecoveryRate()).assertEqual(0)
    })

    it('configurator_should_find_permission_config', 0, () => {
      const configurator = new RecorderStrategyConfigurator()
      const config = configurator.findConfig(BusinessErrorCode.PERMISSION_DENIED)
      expect(config === null).assertFalse()
      if (config !== null) {
        expect(config.strategy).assertEqual(ExceptionStrategy.ABORT)
        expect(config.maxRetryCount).assertEqual(0)
        expect(config.enabled).assertTrue()
      }
    })

    it('configurator_should_find_retry_config', 0, () => {
      const configurator = new RecorderStrategyConfigurator()
      const config = configurator.findConfig(BusinessErrorCode.SERVICE_UNAVAILABLE)
      expect(config === null).assertFalse()
      if (config !== null) {
        expect(config.strategy).assertEqual(ExceptionStrategy.RETRY)
        expect(config.maxRetryCount).assertEqual(3)
      }
    })

    it('configurator_should_find_disabled_config', 0, () => {
      const configurator = new RecorderStrategyConfigurator()
      const config = configurator.findConfig(BusinessErrorCode.RESOURCE_BUSY)
      expect(config === null).assertFalse()
      if (config !== null) {
        expect(config.strategy).assertEqual(ExceptionStrategy.SWALLOW)
        expect(config.enabled).assertFalse()
      }
    })

    it('configurator_should_count_enabled_configs', 0, () => {
      const configurator = new RecorderStrategyConfigurator()
      expect(configurator.getConfigs().length).assertEqual(5)
      expect(configurator.countEnabled()).assertEqual(4)
    })

    it('configurator_should_return_null_for_unknown_code', 0, () => {
      const configurator = new RecorderStrategyConfigurator()
      expect(configurator.findConfig(BusinessErrorCode.NONE) === null).assertTrue()
    })

    it('summary_should_aggregate_records', 0, () => {
      const records: RecorderExceptionRecord[] = [
        {
          category: ExceptionCategory.RESOURCE,
          code: BusinessErrorCode.IO_ERROR,
          operationName: 'open_fd',
          caught: true,
          recovered: true,
          responseMs: 10,
          timestamp: 1000
        },
        {
          category: ExceptionCategory.STATE,
          code: BusinessErrorCode.RESOURCE_BUSY,
          operationName: 'start',
          caught: true,
          recovered: false,
          responseMs: 20,
          timestamp: 2000
        },
        {
          category: ExceptionCategory.INPUT,
          code: BusinessErrorCode.PARAM_INVALID,
          operationName: 'query',
          caught: false,
          recovered: false,
          responseMs: 30,
          timestamp: 3000
        }
      ]
      const summary: RecorderExceptionSummary = new RecorderSummaryBuilder(records).buildSummary()
      expect(summary.totalExceptions).assertEqual(3)
      expect(summary.caughtCount).assertEqual(2)
      expect(summary.uncaughtCount).assertEqual(1)
      expect(summary.recoveredCount).assertEqual(1)
      expect(summary.catchRate).assertEqual(2 / 3)
      expect(summary.recoveryRate).assertEqual(1 / 3)
    })

    it('summary_should_handle_empty_records', 0, () => {
      const summary = new RecorderSummaryBuilder([]).buildSummary()
      expect(summary.totalExceptions).assertEqual(0)
      expect(summary.caughtCount).assertEqual(0)
      expect(summary.uncaughtCount).assertEqual(0)
      expect(summary.recoveredCount).assertEqual(0)
      expect(summary.catchRate).assertEqual(0)
      expect(summary.recoveryRate).assertEqual(0)
    })

    it('disposition_manager_should_filter_by_strategy', 0, () => {
      const manager = new RecorderDispositionManager()
      const retryDisposition: ExceptionDisposition = {
        code: BusinessErrorCode.SERVICE_UNAVAILABLE,
        operationName: 'start_recording',
        strategy: ExceptionStrategy.RETRY,
        retryCount: 1
      }
      const abortDisposition: ExceptionDisposition = {
        code: BusinessErrorCode.PERMISSION_DENIED,
        operationName: 'create_asset',
        strategy: ExceptionStrategy.ABORT,
        retryCount: 0
      }
      manager.append(retryDisposition)
      manager.append(abortDisposition)
      expect(manager.count()).assertEqual(2)
      expect(manager.filterByStrategy(ExceptionStrategy.RETRY).length).assertEqual(1)
      expect(manager.filterByStrategy(ExceptionStrategy.ABORT).length).assertEqual(1)
      expect(manager.filterByStrategy(ExceptionStrategy.SWALLOW).length).assertEqual(0)
    })

    it('disposition_manager_should_enforce_retry_policy', 0, () => {
      const manager = new RecorderDispositionManager()
      const retryable: ExceptionDisposition = {
        code: BusinessErrorCode.IO_ERROR,
        operationName: 'open_fd',
        strategy: ExceptionStrategy.RETRY,
        retryCount: 2
      }
      const exhausted: ExceptionDisposition = {
        code: BusinessErrorCode.IO_ERROR,
        operationName: 'open_fd',
        strategy: ExceptionStrategy.RETRY,
        retryCount: 3
      }
      const aborted: ExceptionDisposition = {
        code: BusinessErrorCode.PARAM_INVALID,
        operationName: 'query',
        strategy: ExceptionStrategy.ABORT,
        retryCount: 0
      }
      expect(manager.canRetry(retryable)).assertTrue()
      expect(manager.canRetry(exhausted)).assertFalse()
      expect(manager.canRetry(aborted)).assertFalse()
    })

    it('disposition_manager_should_clear_dispositions', 0, () => {
      const manager = new RecorderDispositionManager()
      const disposition: ExceptionDisposition = {
        code: BusinessErrorCode.RESOURCE_BUSY,
        operationName: 'start_recording',
        strategy: ExceptionStrategy.SWALLOW,
        retryCount: 0
      }
      manager.append(disposition)
      manager.clear()
      expect(manager.count()).assertEqual(0)
      expect(manager.getDispositions().length).assertEqual(0)
    })

    it('monitor_should_raise_alert_on_unrecovered_exception', 0, () => {
      const monitor = new RecorderExceptionMonitor()
      monitor.observe(BusinessErrorCode.IO_ERROR, true)
      expect(monitor.isAlerting()).assertFalse()
      monitor.observe(BusinessErrorCode.SERVICE_UNAVAILABLE, false)
      expect(monitor.isAlerting()).assertTrue()
      monitor.clearAlert()
      expect(monitor.isAlerting()).assertFalse()
    })

    it('monitor_should_build_metrics', 0, () => {
      const monitor = new RecorderExceptionMonitor()
      monitor.observe(BusinessErrorCode.IO_ERROR, true)
      monitor.observe(BusinessErrorCode.IO_ERROR, true)
      monitor.observe(BusinessErrorCode.RESOURCE_BUSY, false)
      const metrics: ExceptionMonitorMetrics = monitor.buildMetrics()
      expect(metrics.observedExceptions).assertEqual(3)
      expect(metrics.recoveredExceptions).assertEqual(2)
      expect(metrics.alertedExceptions).assertEqual(1)
      expect(metrics.alertRate).assertEqual(1 / 3)
    })

    it('monitor_should_reset_metrics', 0, () => {
      const monitor = new RecorderExceptionMonitor()
      monitor.observe(BusinessErrorCode.IO_ERROR, false)
      monitor.reset()
      const metrics = monitor.buildMetrics()
      expect(metrics.observedExceptions).assertEqual(0)
      expect(metrics.alertedExceptions).assertEqual(0)
      expect(metrics.alertRate).assertEqual(0)
      expect(monitor.isAlerting()).assertFalse()
    })

    it('counter_should_track_error_codes', 0, () => {
      const counter = new RecorderExceptionCounter()
      counter.increment(BusinessErrorCode.IO_ERROR)
      counter.increment(BusinessErrorCode.IO_ERROR)
      counter.increment(BusinessErrorCode.RESOURCE_BUSY)
      expect(counter.getCount(BusinessErrorCode.IO_ERROR)).assertEqual(2)
      expect(counter.getCount(BusinessErrorCode.RESOURCE_BUSY)).assertEqual(1)
      expect(counter.getCount(BusinessErrorCode.NONE)).assertEqual(0)
    })

    it('counter_should_find_most_frequent_code', 0, () => {
      const counter = new RecorderExceptionCounter()
      counter.increment(BusinessErrorCode.SERVICE_UNAVAILABLE)
      counter.increment(BusinessErrorCode.SERVICE_UNAVAILABLE)
      counter.increment(BusinessErrorCode.PERMISSION_DENIED)
      expect(counter.getMostFrequent()).assertEqual(BusinessErrorCode.SERVICE_UNAVAILABLE)
    })

    it('counter_should_clear_counts', 0, () => {
      const counter = new RecorderExceptionCounter()
      counter.increment(BusinessErrorCode.IO_ERROR)
      counter.clear()
      expect(counter.getCount(BusinessErrorCode.IO_ERROR)).assertEqual(0)
      expect(counter.getMostFrequent()).assertEqual(BusinessErrorCode.NONE)
    })

    it('alert_manager_should_filter_by_code', 0, () => {
      const manager = new RecorderAlertManager()
      manager.append(new RecorderExceptionAlert(BusinessErrorCode.IO_ERROR, 'openSync failed'))
      manager.append(new RecorderExceptionAlert(BusinessErrorCode.IO_ERROR, 'writeSync failed'))
      manager.append(new RecorderExceptionAlert(BusinessErrorCode.RESOURCE_BUSY, 'recorder busy'))
      expect(manager.count()).assertEqual(3)
      expect(manager.filterByCode(BusinessErrorCode.IO_ERROR).length).assertEqual(2)
      expect(manager.filterByCode(BusinessErrorCode.RESOURCE_BUSY).length).assertEqual(1)
      expect(manager.filterByCode(BusinessErrorCode.NONE).length).assertEqual(0)
    })

    it('alert_manager_should_render_alert_message', 0, () => {
      const alert = new RecorderExceptionAlert(BusinessErrorCode.PERMISSION_DENIED, 'camera permission denied')
      expect(alert.getCode()).assertEqual(BusinessErrorCode.PERMISSION_DENIED)
      expect(alert.getMessage()).assertEqual('camera permission denied')
      expect(alert.toString()).assertContain('Alert(201)')
      expect(alert.toString()).assertContain('permission denied')
    })

    it('alert_manager_should_clear_alerts', 0, () => {
      const manager = new RecorderAlertManager()
      manager.append(new RecorderExceptionAlert(BusinessErrorCode.IO_ERROR, 'io'))
      manager.clear()
      expect(manager.count()).assertEqual(0)
    })

    it('comprehensive_exception_handling_scenario', 0, () => {
      let propagated = -1
      runner.setStateCallback((error: NormalizedException) => {
        propagated = error.code
      })

      expect(runner.run('create_asset', () => {})).assertTrue()
      expect(runner.run('open_fd', () => {
        throw new BusinessErrorStub('BusinessError', BusinessErrorCode.IO_ERROR, 'openSync failed')
      })).assertFalse()
      expect(propagated).assertEqual(BusinessErrorCode.IO_ERROR)
      expect(runner.getPropagationCount()).assertEqual(1)

      for (const record of runner.getRecords()) {
        tracker.append(record.category, record.code, record.operationName, record.caught, true, record.responseMs)
      }
      const summary = new RecorderSummaryBuilder(tracker.getRecords()).buildSummary()
      expect(summary.totalExceptions).assertEqual(1)
      expect(summary.caughtCount).assertEqual(1)
      expect(summary.catchRate).assertEqual(1)
      expect(summary.recoveryRate).assertEqual(1)

      const configurator = new RecorderStrategyConfigurator()
      const config = configurator.findConfig(BusinessErrorCode.IO_ERROR)
      expect(config === null).assertFalse()
      if (config !== null) {
        expect(config.strategy).assertEqual(ExceptionStrategy.RETRY)
      }

      const monitor = new RecorderExceptionMonitor()
      monitor.observe(BusinessErrorCode.IO_ERROR, true)
      expect(monitor.buildMetrics().recoveredExceptions).assertEqual(1)

      const alertManager = new RecorderAlertManager()
      alertManager.append(new RecorderExceptionAlert(BusinessErrorCode.IO_ERROR, 'io recovered'))
      expect(alertManager.count()).assertEqual(1)
    })
  })
}
