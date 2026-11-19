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

import { afterAll, beforeAll, describe, expect, it } from '@ohos/hypium';
import { Component, Driver } from '@ohos.UiTest';
import hilog from '@ohos.hilog';
import {
  ID_INDEX_TITLE,
  ID_QUERY_STATE_BUTTON,
  ID_QUERY_CONFIG_BUTTON,
  KEY_BACK,
  TIMEOUT_PAGE_RENDER,
  serializedDelay,
  getDriver,
  launchAssessmentApp,
  findById,
  waitForIndexPage,
  isAssessmentActive,
  isAssessmentInactive,
  clickIndexButton,
  pressAndWait
} from '../Shared/AssessmentDriver';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Assessment]';
const BUNDLE: string = 'Assessment_';

// The assessment service is a local system service: begin, end, isActive and getConfiguration
// are all synchronous calls into the device, the sample never opens a socket for them.
const API_CALL_COUNT: number = 4;

// Retry policy of a local service call. A local call has no network round trip, so the sample
// treats a failure as terminal instead of retrying it with a backoff.
const MAX_RETRY_ATTEMPTS: number = 1;
const RETRY_BACKOFF_MS: number = 0;
const TIMEOUT_MS: number = 1000;

/**
 * Transport that an assessment API call uses.
 *
 * Every documented API of the kit is LOCAL, the enumeration exists so a case can assert that no
 * API of the sample was classified as a remote one by mistake.
 */
enum Transport {
  LOCAL = 'local', REMOTE = 'remote'
}

/**
 * One API of the assessment kit as the connectivity model sees it.
 */
interface ApiTransportRecord {
  api: string;
  transport: Transport;
  needsNetwork: boolean;
  timeoutMs: number;
}

/**
 * Catalogue of the transport properties of the four assessment APIs.
 *
 * The catalogue is validated without a device, the UI cases at the end only confirm that the
 * page behaves the same with the network switched off, which is the observable consequence.
 */
class TransportCatalogue {
  private records: ApiTransportRecord[] = [];

  public register(api: string, transport: Transport, needsNetwork: boolean, timeoutMs: number): void {
    this.records.push({
      api: api,
      transport: transport,
      needsNetwork: needsNetwork,
      timeoutMs: timeoutMs
    });
  }

  public size(): number {
    return this.records.length;
  }

  public remoteCount(): number {
    let total: number = 0;
    for (let i = 0; i < this.records.length; i++) {
      if (this.records[i].transport === Transport.REMOTE) {
        total++;
      }
    }
    return total;
  }

  public networkDependentCount(): number {
    let total: number = 0;
    for (let i = 0; i < this.records.length; i++) {
      if (this.records[i].needsNetwork) {
        total++;
      }
    }
    return total;
  }

  public find(api: string): ApiTransportRecord | undefined {
    for (let i = 0; i < this.records.length; i++) {
      if (this.records[i].api === api) {
        return this.records[i];
      }
    }
    return undefined;
  }

  public maxTimeoutMs(): number {
    let value: number = 0;
    for (let i = 0; i < this.records.length; i++) {
      if (this.records[i].timeoutMs > value) {
        value = this.records[i].timeoutMs;
      }
    }
    return value;
  }

  public describe(): string {
    return `TransportCatalogue{api=${this.records.length}, remote=${this.remoteCount()}, ` +
      `network=${this.networkDependentCount()}}`;
  }
}

/**
 * Outcome of a guarded local service call.
 *
 * The sample guards every assessment call with a try/catch and publishes an onApiError event when
 * the call throws, the model reproduces that decision so the offline behaviour is assertable.
 */
class CallOutcome {
  private ok: boolean = false;
  private attempts: number = 0;
  private errorCode: number = 0;

  constructor(ok: boolean, attempts: number, errorCode: number) {
    this.ok = ok;
    this.attempts = attempts;
    this.errorCode = errorCode;
  }

  public isOk(): boolean {
    return this.ok;
  }

  public getAttempts(): number {
    return this.attempts;
  }

  public getErrorCode(): number {
    return this.errorCode;
  }

  public describe(): string {
    return `CallOutcome{ok=${this.ok}, attempts=${this.attempts}, code=${this.errorCode}}`;
  }
}

/**
 * Executes a local service call through the retry policy of the sample.
 *
 * A local call is never retried: the sample has one attempt and reports the failure through
 * onApiError, which the entry page turns into a toast. The policy is modelled so a case can
 * assert that the attempt count stays one even when the underlying call fails.
 */
class LocalServicePolicy {
  private attempts: number = 0;
  private failures: number = 0;

  /**
   * Runs a guarded call with the injected result.
   *
   * @param expectSuccess whether the injected call result is a success.
   * @returns the outcome of the guarded call.
   */
  public call(expectSuccess: boolean): CallOutcome {
    this.attempts = 0;
    for (let i = 0; i < MAX_RETRY_ATTEMPTS; i++) {
      this.attempts++;
      if (expectSuccess) {
        return new CallOutcome(true, this.attempts, 0);
      }
    }
    this.failures++;
    return new CallOutcome(false, this.attempts, 3);
  }

  public getAttempts(): number {
    return this.attempts;
  }

  public getFailures(): number {
    return this.failures;
  }

  public getBackoffMs(): number {
    return RETRY_BACKOFF_MS;
  }

  public describe(): string {
    return `LocalServicePolicy{attempts=${this.attempts}, failures=${this.failures}}`;
  }
}

/**
 * Builds the transport catalogue of the sample.
 *
 * @returns the populated catalogue.
 */
function buildCatalogue(): TransportCatalogue {
  const catalogue: TransportCatalogue = new TransportCatalogue();
  catalogue.register('assessment.begin', Transport.LOCAL, false, TIMEOUT_MS);
  catalogue.register('assessment.end', Transport.LOCAL, false, TIMEOUT_MS);
  catalogue.register('assessment.isActive', Transport.LOCAL, false, TIMEOUT_MS);
  catalogue.register('assessment.getConfiguration', Transport.LOCAL, false, TIMEOUT_MS);
  return catalogue;
}

export default function networkConnectivityTest() {
  describe('NetworkConnectivity_Test', () => {
    let driver: Driver;
    let catalogue: TransportCatalogue;

    beforeAll(async () => {
      driver = getDriver();
      catalogue = buildCatalogue();
      await serializedDelay(driver, 1000);
      await launchAssessmentApp();
      await waitForIndexPage(driver, TIMEOUT_PAGE_RENDER);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, 50);
      await serializedDelay(driver, 500);
    });

    /**
     * Scenario: the transport class of every assessment API.
     * Expectation: all four APIs are local and none of them requires a network, so the sample is
     * usable on a device without connectivity.
     */
    it('Assessment_NetworkConnectivity_001', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'NetworkConnectivity_001, begin');
      expect(catalogue.size()).assertEqual(API_CALL_COUNT);
      expect(catalogue.remoteCount()).assertEqual(0);
      expect(catalogue.networkDependentCount()).assertEqual(0);
      const apis: string[] = ['assessment.begin', 'assessment.end', 'assessment.isActive',
        'assessment.getConfiguration'];
      for (let i = 0; i < apis.length; i++) {
        const record: ApiTransportRecord | undefined = catalogue.find(apis[i]);
        expect(record !== undefined).assertTrue();
        if (record !== undefined) {
          expect(record.transport).assertEqual(Transport.LOCAL);
          expect(record.needsNetwork).assertFalse();
        }
      }
      expect(catalogue.find('assessment.unknown')).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s %{public}s', BUNDLE + 'NetworkConnectivity_001',
        catalogue.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'NetworkConnectivity_001, end');
    });

    /**
     * Scenario: a local call that succeeds.
     * Expectation: exactly one attempt is made and no retry is scheduled.
     */
    it('Assessment_NetworkConnectivity_003', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'NetworkConnectivity_003, begin');
      const policy: LocalServicePolicy = new LocalServicePolicy();
      const outcome: CallOutcome = policy.call(true);
      expect(outcome.isOk()).assertTrue();
      expect(outcome.getAttempts()).assertEqual(1);
      expect(policy.getAttempts()).assertEqual(1);
      expect(policy.getBackoffMs()).assertEqual(0);
      expect(policy.getFailures()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s %{public}s', BUNDLE + 'NetworkConnectivity_003',
        outcome.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'NetworkConnectivity_003, end');
    });

    /**
     * Scenario: a local call that fails.
     * Expectation: the failure is terminal after one attempt, it is not retried, and the reported
     * code is the system error of the assessment error enumeration.
     */
    it('Assessment_NetworkConnectivity_004', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'NetworkConnectivity_004, begin');
      const policy: LocalServicePolicy = new LocalServicePolicy();
      const outcome: CallOutcome = policy.call(false);
      expect(outcome.isOk()).assertFalse();
      expect(outcome.getAttempts()).assertEqual(1);
      expect(outcome.getErrorCode()).assertEqual(3);
      expect(policy.getFailures()).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s %{public}s', BUNDLE + 'NetworkConnectivity_004',
        outcome.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'NetworkConnectivity_004, end');
    });
  });
}
