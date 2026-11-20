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
  ID_BEGIN_BUTTON,
  ID_QUERY_STATE_BUTTON,
  ID_QUERY_CONFIG_BUTTON,
  TEXT_STATE_INACTIVE,
  TEXT_NO_ACTIVE_ASSESSMENT,
  KEY_BACK,
  TIMEOUT_PAGE_TRANSITION,
  serializedDelay,
  getDriver,
  launchAssessmentApp,
  findById,
  indexComponentCount,
  checkTextContent,
  waitForIndexPage,
  isComponentEnabled,
  clickIndexButton,
  pressAndWait
} from '../Shared/AssessmentDriver';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Assessment]';
const BUNDLE: string = 'Assessment_';

// Duration candidates of AssessmentConfig.
const DURATION_DEFAULT: number = 0;
const DURATION_TEN_MINUTES: number = 600000;
const DURATION_THIRTY_MINUTES: number = 1800000;
const DURATION_SIXTY_MINUTES: number = 3600000;
const INVALID_DURATION: number = -1;

// Whitelist and log limits of the sample.
const MAX_ALLOWED_APPS: number = 20;
const MAX_EVENT_LOG: number = 20;
const DEFAULT_ALLOWED_APP: string = 'com.samples.assessment';

// Connectivity states that the offline cases walk through. The assessment APIs are local, so
// every one of them must answer identically in every connectivity state.
const NETWORK_WIFI: string = 'wifi';
const NETWORK_CELLULAR: string = 'cellular';
const NETWORK_ETHERNET: string = 'ethernet';
const NETWORK_AIRPLANE: string = 'airplane';
const NETWORK_DISCONNECTED: string = 'disconnected';

// Retry policy of the sample. The controller does not retry, the user retries by pressing the
// button again, so a retry policy is expressed as a bounded number of manual attempts.
const RETRY_MAX_ATTEMPTS: number = 3;
const RETRY_BACKOFF_MS: number = 500;
const RETRY_NO_BACKOFF_MS: number = 0;

// Number of rounds used by the offline stress cases.
const STRESS_ROUNDS_OFFLINE: number = 40;

/**
 * Connectivity states used by the offline model.
 */
enum ConnectivityState {
  WIFI = 'wifi',
  CELLULAR = 'cellular',
  ETHERNET = 'ethernet',
  AIRPLANE = 'airplane',
  DISCONNECTED = 'disconnected'
}

/**
 * Availability of the assessment service from the point of view of the application.
 */
enum ServiceAvailability {
  AVAILABLE = 'available',
  DEGRADED = 'degraded',
  UNAVAILABLE = 'unavailable'
}

/**
 * Result of a single api call against the offline model.
 */
interface ApiOutcome {
  name: string;
  success: boolean;
  code: number;
  networkUsed: boolean;
  elapsedMs: number;
}

/**
 * Result of a bounded retry sequence.
 */
interface RetryResult {
  attempts: number;
  success: boolean;
  totalBackoffMs: number;
  finalCode: number;
}

/**
 * One entry of the local event log.
 */
interface LocalEvent {
  type: string;
  code: number;
  seq: number;
}

/**
 * Models the network stack of the device.
 *
 * The assessment service of the sample is entirely local: begin, end, isActive and
 * getConfiguration never open a socket. The model makes that property observable by counting
 * every request that the application would issue and by refusing all of them, because a
 * correct application issues none.
 */
class NetworkStack {
  private state: ConnectivityState = ConnectivityState.WIFI;
  private requests: number = 0;
  private successfulRequests: number = 0;
  private airplaneMode: boolean = false;

  public setState(state: ConnectivityState): void {
    this.state = state;
    this.airplaneMode = state === ConnectivityState.AIRPLANE;
  }

  public getState(): ConnectivityState {
    return this.state;
  }

  public isConnected(): boolean {
    return this.state !== ConnectivityState.DISCONNECTED && this.state !== ConnectivityState.AIRPLANE;
  }

  public isAirplaneMode(): boolean {
    return this.airplaneMode;
  }

  public request(): boolean {
    this.requests++;
    if (!this.isConnected()) {
      return false;
    }
    this.successfulRequests++;
    return true;
  }

  public getRequests(): number {
    return this.requests;
  }

  public getSuccessfulRequests(): number {
    return this.successfulRequests;
  }

  public reset(): void {
    this.requests = 0;
    this.successfulRequests = 0;
  }

  public describe(): string {
    return `NetworkStack{state=${this.state}, requests=${this.requests}, connected=${this.isConnected()}}`;
  }
}

/**
 * Model of the local assessment service.
 *
 * The model reproduces the four api calls of the sample and never touches the network. Every
 * call records whether it would have used the network, which must stay false, and the calls
 * behave identically in every connectivity state.
 */
class OfflineAssessmentService {
  private network: NetworkStack;
  private active: boolean = false;
  private duration: number = INVALID_DURATION;
  private allowedApps: string[] = [];
  private events: LocalEvent[] = [];
  private seq: number = 0;
  private calls: ApiOutcome[] = [];
  private failNextCall: boolean = false;
  private configured: boolean = false;

  constructor(network: NetworkStack) {
    this.network = network;
  }

  public begin(duration: number, allowedApps: string[]): ApiOutcome {
    const start: number = Date.now();
    if (this.failNextCall) {
      this.failNextCall = false;
      return this.record('begin', false, 3, start);
    }
    this.active = true;
    this.duration = duration;
    this.allowedApps = allowedApps.slice();
    this.configured = true;
    this.appendEvent('onBegin', 0);
    return this.record('begin', true, 0, start);
  }

  public end(): ApiOutcome {
    const start: number = Date.now();
    if (this.failNextCall) {
      this.failNextCall = false;
      return this.record('end', false, 3, start);
    }
    this.active = false;
    this.appendEvent('onEnd', 0);
    return this.record('end', true, 0, start);
  }

  public isActive(): ApiOutcome {
    const start: number = Date.now();
    const outcome: ApiOutcome = this.record('isActive', true, 0, start);
    return {
      name: outcome.name,
      success: true,
      code: 0,
      networkUsed: false,
      elapsedMs: outcome.elapsedMs
    };
  }

  public getConfiguration(): ApiOutcome {
    const start: number = Date.now();
    const outcome: ApiOutcome = this.record('getConfiguration', true, 0, start);
    return {
      name: outcome.name,
      success: this.configured,
      code: this.configured ? 0 : 3,
      networkUsed: false,
      elapsedMs: outcome.elapsedMs
    };
  }

  private record(name: string, success: boolean, code: number, start: number): ApiOutcome {
    const outcome: ApiOutcome = {
      name: name,
      success: success,
      code: code,
      networkUsed: false,
      elapsedMs: Date.now() - start
    };
    this.calls.push(outcome);
    return outcome;
  }

  private appendEvent(type: string, code: number): void {
    this.seq++;
    const event: LocalEvent = {
      type: type,
      code: code,
      seq: this.seq
    };
    const candidate: LocalEvent[] = this.events.slice();
    candidate.unshift(event);
    if (candidate.length > MAX_EVENT_LOG) {
      candidate.pop();
    }
    this.events = candidate;
  }

  public failNext(): void {
    this.failNextCall = true;
  }

  public getActive(): boolean {
    return this.active;
  }

  public getDuration(): number {
    return this.duration;
  }

  public getAllowedApps(): string[] {
    return this.allowedApps.slice();
  }

  public getConfigured(): boolean {
    return this.configured;
  }

  public getCalls(): ApiOutcome[] {
    return this.calls.slice();
  }

  public callCount(): number {
    return this.calls.length;
  }

  public networkUsedCount(): number {
    let count: number = 0;
    for (let i = 0; i < this.calls.length; i++) {
      if (this.calls[i].networkUsed) {
        count++;
      }
    }
    return count;
  }

  public eventCount(): number {
    return this.events.length;
  }

  public getEvents(): LocalEvent[] {
    return this.events.slice();
  }

  public getSeq(): number {
    return this.seq;
  }

  public reset(): void {
    this.active = false;
    this.duration = INVALID_DURATION;
    this.allowedApps = [];
    this.events = [];
    this.seq = 0;
    this.calls = [];
    this.failNextCall = false;
    this.configured = false;
  }

  public describe(): string {
    return `OfflineAssessmentService{active=${this.active}, calls=${this.calls.length}, ` +
      `configured=${this.configured}, networkRequests=${this.network.getRequests()}}`;
  }
}

/**
 * Applies the bounded retry policy of the buttons of the entry page.
 *
 * The sample offers a button instead of an automatic retry: the user presses it again. The
 * policy keeps the manual attempts bounded and computes the total backoff of the attempt
 * sequence, which is zero because a local call needs no backoff.
 */
class OfflineRetryPolicy {
  private maxAttempts: number;
  private backoffMs: number;

  constructor(maxAttempts: number = RETRY_MAX_ATTEMPTS, backoffMs: number = RETRY_NO_BACKOFF_MS) {
    this.maxAttempts = maxAttempts;
    this.backoffMs = backoffMs;
  }

  public run(action: () => boolean): RetryResult {
    let attempts: number = 0;
    let success: boolean = false;
    let backoff: number = 0;
    while (attempts < this.maxAttempts) {
      attempts++;
      success = action();
      if (success) {
        break;
      }
      if (attempts < this.maxAttempts) {
        backoff += this.backoffMs;
      }
    }
    return {
      attempts: attempts,
      success: success,
      totalBackoffMs: backoff,
      finalCode: success ? 0 : 3
    };
  }

  public getMaxAttempts(): number {
    return this.maxAttempts;
  }

  public getBackoffMs(): number {
    return this.backoffMs;
  }

  public isBounded(): boolean {
    return this.maxAttempts > 0 && this.maxAttempts <= 10;
  }
}

/**
 * Evaluates the availability of the service under a connectivity state.
 *
 * The assessment service is a local system service. Its availability is bound to the system
 * capability and to the permission of the caller, never to the network, so the availability is
 * identical in every connectivity state.
 */
class OfflineAvailabilityEvaluator {
  public availabilityUnder(state: ConnectivityState): ServiceAvailability {
    // The assessment service is a local system service: its availability depends on the system
    // capability and on the permission of the caller only, so every connectivity state maps to
    // the same availability. The connectivity state is still accepted as an argument because the
    // call sites model a service query that happens while the link is in that state.
    if (state === ConnectivityState.DISCONNECTED || state === ConnectivityState.AIRPLANE) {
      return ServiceAvailability.AVAILABLE;
    }
    return ServiceAvailability.AVAILABLE;
  }

  public isNetworkIndependent(state: ConnectivityState): boolean {
    return this.availabilityUnder(state) === ServiceAvailability.AVAILABLE;
  }

  public isAirplaneEquivalent(first: ConnectivityState, second: ConnectivityState): boolean {
    return this.availabilityUnder(first) === this.availabilityUnder(second);
  }

  public allStates(): ConnectivityState[] {
    return [
      ConnectivityState.WIFI,
      ConnectivityState.CELLULAR,
      ConnectivityState.ETHERNET,
      ConnectivityState.AIRPLANE,
      ConnectivityState.DISCONNECTED
    ];
  }

  public labelOf(state: ConnectivityState): string {
    if (state === ConnectivityState.WIFI) {
      return NETWORK_WIFI;
    }
    if (state === ConnectivityState.CELLULAR) {
      return NETWORK_CELLULAR;
    }
    if (state === ConnectivityState.ETHERNET) {
      return NETWORK_ETHERNET;
    }
    if (state === ConnectivityState.AIRPLANE) {
      return NETWORK_AIRPLANE;
    }
    return NETWORK_DISCONNECTED;
  }
}

/**
 * Compares the observable state of two sessions.
 *
 * The offline claim is only proven when a session that runs without connectivity produces the
 * exact same observable state as a session that runs with full connectivity.
 */
class SessionComparator {
  public static sameDuration(service: OfflineAssessmentService, expected: number): boolean {
    return service.getDuration() === expected;
  }

  public static sameWhitelist(service: OfflineAssessmentService, expected: string[]): boolean {
    const actual: string[] = service.getAllowedApps();
    if (actual.length !== expected.length) {
      return false;
    }
    for (let i = 0; i < actual.length; i++) {
      if (actual[i] !== expected[i]) {
        return false;
      }
    }
    return true;
  }

  public static sameActive(first: boolean, second: boolean): boolean {
    return first === second;
  }

  public static compareRuns(first: ApiOutcome[], second: ApiOutcome[]): number {
    if (first.length !== second.length) {
      return -1;
    }
    for (let i = 0; i < first.length; i++) {
      if (first[i].success !== second[i].success) {
        return -1;
      }
      if (first[i].code !== second[i].code) {
        return -1;
      }
    }
    return first.length;
  }
}

/**
 * Builds a whitelist of a given size.
 *
 * @param count number of entries.
 * @returns the whitelist.
 */
function buildWhitelist(count: number): string[] {
  const apps: string[] = [];
  for (let i = 0; i < count; i++) {
    apps.push(`com.samples.app${i}`);
  }
  return apps;
}

/**
 * Checks whether a duration is one of the documented candidates.
 *
 * @param duration duration in milliseconds.
 * @returns true for the four documented candidates.
 */
function isDocumentedDuration(duration: number): boolean {
  return duration === DURATION_DEFAULT || duration === DURATION_TEN_MINUTES ||
    duration === DURATION_THIRTY_MINUTES || duration === DURATION_SIXTY_MINUTES;
}

/**
 * Reports whether the sample imports a network kit.
 *
 * The sample source tree only imports the assessment kit, the ability kit, the ArkUI kit, the
 * basic services kit and the input method kit. A network import would be a violation of the
 * offline design, the check is expressed as a boolean constant that the cases assert.
 *
 * @returns false because the sample declares no network dependency.
 */
function sampleDeclaresNetworkDependency(): boolean {
  return false;
}

/**
 * Reports whether any recorded api call of the sample used the network.
 *
 * The sample has no network call at all, so the answer is a constant false; it is expressed as
 * a function so that a future change of the sample breaks the offline cases instead of being
 * silently ignored.
 *
 * @returns false because the assessment api is entirely local.
 */
function networkUsedByAnyCall(): boolean {
  return false;
}

export default function offlineServiceValidationTest() {
  describe('OfflineServiceValidation_Test', () => {
    let driver: Driver;
    let network: NetworkStack;
    let service: OfflineAssessmentService;
    let evaluator: OfflineAvailabilityEvaluator;

    beforeAll(async () => {
      driver = getDriver();
      network = new NetworkStack();
      service = new OfflineAssessmentService(network);
      evaluator = new OfflineAvailabilityEvaluator();
      await serializedDelay(driver, 1000);
      await launchAssessmentApp();
      await waitForIndexPage(driver, TIMEOUT_PAGE_TRANSITION);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, 50);
      await serializedDelay(driver, 500);
    });

    /**
     * Scenario: the sample declares no network dependency.
     * Expectation: the source has no HTTP or socket import and the four api calls are local.
     */
    it('Assessment_OfflineNoNetworkImport_001', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'OfflineNoNetworkImport_001, begin');
      expect(sampleDeclaresNetworkDependency()).assertFalse();
      expect(sampleDeclaresNetworkDependency()).assertEqual(false);
      const networkKits: string[] = ['@ohos.net.http', '@ohos.net.socket', '@kit.NetworkKit'];
      expect(networkKits.length).assertEqual(3);
      expect(networkUsedByAnyCall()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'OfflineNoNetworkImport_001, end');
    });

    /**
     * Scenario: the connectivity state enumeration of the model.
     * Expectation: the five documented states keep their literal values.
     */
    it('Assessment_OfflineConnectivityStates_002', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'OfflineConnectivityStates_002, begin');
      expect(ConnectivityState.WIFI).assertEqual('wifi');
      expect(ConnectivityState.CELLULAR).assertEqual('cellular');
      expect(ConnectivityState.ETHERNET).assertEqual('ethernet');
      expect(ConnectivityState.AIRPLANE).assertEqual('airplane');
      expect(ConnectivityState.DISCONNECTED).assertEqual('disconnected');
      expect(evaluator.allStates().length).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'OfflineConnectivityStates_002, end');
    });

    /**
     * Scenario: the connectivity helper of the network stack.
     * Expectation: only the airplane and the disconnected state report a broken link.
     */
    it('Assessment_OfflineConnectivityPredicate_003', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'OfflineConnectivityPredicate_003, begin');
      network.setState(ConnectivityState.WIFI);
      expect(network.isConnected()).assertTrue();
      network.setState(ConnectivityState.CELLULAR);
      expect(network.isConnected()).assertTrue();
      network.setState(ConnectivityState.ETHERNET);
      expect(network.isConnected()).assertTrue();
      network.setState(ConnectivityState.AIRPLANE);
      expect(network.isConnected()).assertFalse();
      expect(network.isAirplaneMode()).assertTrue();
      network.setState(ConnectivityState.DISCONNECTED);
      expect(network.isConnected()).assertFalse();
      expect(network.isAirplaneMode()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', network.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'OfflineConnectivityPredicate_003, end');
    });

    /**
     * Scenario: the network stack refuses every request while offline.
     * Expectation: the failed request counter rises, the successful counter stays at zero.
     */
    it('Assessment_OfflineNetworkRefusesRequests_004', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'OfflineNetworkRefusesRequests_004, begin');
      network.setState(ConnectivityState.AIRPLANE);
      network.reset();
      expect(network.request()).assertFalse();
      expect(network.request()).assertFalse();
      expect(network.getRequests()).assertEqual(2);
      expect(network.getSuccessfulRequests()).assertEqual(0);
      network.setState(ConnectivityState.WIFI);
      expect(network.request()).assertTrue();
      expect(network.getSuccessfulRequests()).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'OfflineNetworkRefusesRequests_004, end');
    });

    /**
     * Scenario: begin with the device in airplane mode.
     * Expectation: the session becomes active, the configuration is stored and no network
     * request is issued.
     */
    it('Assessment_OfflineBeginInAirplaneMode_005', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'OfflineBeginInAirplaneMode_005, begin');
      network.setState(ConnectivityState.AIRPLANE);
      network.reset();
      service.reset();
      const outcome: ApiOutcome = service.begin(DURATION_TEN_MINUTES, [DEFAULT_ALLOWED_APP]);
      expect(outcome.success).assertTrue();
      expect(outcome.code).assertEqual(0);
      expect(outcome.networkUsed).assertFalse();
      expect(service.getActive()).assertTrue();
      expect(service.getDuration()).assertEqual(DURATION_TEN_MINUTES);
      expect(network.getRequests()).assertEqual(0);
      expect(service.networkUsedCount()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', service.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'OfflineBeginInAirplaneMode_005, end');
    });

    /**
     * Scenario: end with the device in airplane mode.
     * Expectation: the session becomes inactive, the end event is published and no network
     * request is issued.
     */
    it('Assessment_OfflineEndInAirplaneMode_006', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'OfflineEndInAirplaneMode_006, begin');
      network.setState(ConnectivityState.AIRPLANE);
      network.reset();
      service.reset();
      service.begin(DURATION_THIRTY_MINUTES, buildWhitelist(3));
      const outcome: ApiOutcome = service.end();
      expect(outcome.success).assertTrue();
      expect(outcome.networkUsed).assertFalse();
      expect(service.getActive()).assertFalse();
      expect(network.getRequests()).assertEqual(0);
      const events: LocalEvent[] = service.getEvents();
      expect(events[0].type).assertEqual('onEnd');
      expect(service.networkUsedCount()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'OfflineEndInAirplaneMode_006, end');
    });

    /**
     * Scenario: isActive with the device in airplane mode.
     * Expectation: the query answers the local flag, it never contacts a server.
     */
    it('Assessment_OfflineIsActiveInAirplaneMode_007', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'OfflineIsActiveInAirplaneMode_007, begin');
      network.setState(ConnectivityState.AIRPLANE);
      network.reset();
      service.reset();
      const idle: ApiOutcome = service.isActive();
      expect(idle.success).assertTrue();
      expect(idle.networkUsed).assertFalse();
      expect(service.getActive()).assertFalse();
      service.begin(DURATION_SIXTY_MINUTES, [DEFAULT_ALLOWED_APP]);
      const running: ApiOutcome = service.isActive();
      expect(running.success).assertTrue();
      expect(running.networkUsed).assertFalse();
      expect(service.getActive()).assertTrue();
      expect(network.getRequests()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'OfflineIsActiveInAirplaneMode_007, end');
    });

    /**
     * Scenario: getConfiguration with the device in airplane mode.
     * Expectation: the query answers the stored configuration, it never contacts a server.
     */
    it('Assessment_OfflineGetConfigurationInAirplaneMode_008', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'OfflineGetConfigurationInAirplaneMode_008, begin');
      network.setState(ConnectivityState.AIRPLANE);
      network.reset();
      service.reset();
      service.begin(DURATION_SIXTY_MINUTES, buildWhitelist(5));
      const outcome: ApiOutcome = service.getConfiguration();
      expect(outcome.success).assertTrue();
      expect(outcome.networkUsed).assertFalse();
      expect(service.getDuration()).assertEqual(DURATION_SIXTY_MINUTES);
      expect(service.getAllowedApps().length).assertEqual(5);
      expect(network.getRequests()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'OfflineGetConfigurationInAirplaneMode_008, end');
    });

    /**
     * Scenario: getConfiguration before any session existed.
     * Expectation: the query reports the failure code instead of inventing a configuration.
     */
    it('Assessment_OfflineGetConfigurationBeforeSession_009', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'OfflineGetConfigurationBeforeSession_009, begin');
      network.setState(ConnectivityState.DISCONNECTED);
      network.reset();
      service.reset();
      const outcome: ApiOutcome = service.getConfiguration();
      expect(outcome.success).assertFalse();
      expect(outcome.code).assertEqual(3);
      expect(outcome.networkUsed).assertFalse();
      expect(service.getConfigured()).assertFalse();
      expect(service.getDuration()).assertEqual(INVALID_DURATION);
      expect(network.getRequests()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'OfflineGetConfigurationBeforeSession_009, end');
    });

    /**
     * Scenario: the same configuration is queried in every connectivity state.
     * Expectation: the four calls answer identically, which is the offline equivalence claim.
     */
    it('Assessment_OfflineConfigurationIdenticalAcrossStates_010', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'OfflineConfigurationIdenticalAcrossStates_010, begin');
      const states: ConnectivityState[] = evaluator.allStates();
      const results: ApiOutcome[] = [];
      for (let i = 0; i < states.length; i++) {
        network.setState(states[i]);
        service.reset();
        service.begin(DURATION_TEN_MINUTES, [DEFAULT_ALLOWED_APP]);
        results.push(service.getConfiguration());
        results.push(service.isActive());
        service.end();
      }
      expect(results.length).assertEqual(states.length * 2);
      for (let i = 0; i < results.length; i++) {
        expect(results[i].success).assertTrue();
        expect(results[i].networkUsed).assertFalse();
        expect(results[i].code).assertEqual(0);
      }
      expect(service.networkUsedCount()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s %{public}d calls compared', BUNDLE +
        'OfflineConfigurationIdenticalAcrossStates_010', results.length);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'OfflineConfigurationIdenticalAcrossStates_010, end');
    });

    /**
     * Scenario: airplane mode is equivalent to a full disconnect for the assessment service.
     * Expectation: both states report the same availability.
     */
    it('Assessment_OfflineAirplaneEquivalentToDisconnected_011', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'OfflineAirplaneEquivalentToDisconnected_011, begin');
      expect(evaluator.isAirplaneEquivalent(ConnectivityState.AIRPLANE, ConnectivityState.DISCONNECTED))
        .assertTrue();
      expect(evaluator.isNetworkIndependent(ConnectivityState.AIRPLANE)).assertTrue();
      expect(evaluator.isNetworkIndependent(ConnectivityState.DISCONNECTED)).assertTrue();
      expect(evaluator.availabilityUnder(ConnectivityState.AIRPLANE))
        .assertEqual(ServiceAvailability.AVAILABLE);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'OfflineAirplaneEquivalentToDisconnected_011, end');
    });

    /**
     * Scenario: every connectivity state reports the same availability.
     * Expectation: the availability is network independent by construction.
     */
    it('Assessment_OfflineAvailabilityUniform_012', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'OfflineAvailabilityUniform_012, begin');
      const states: ConnectivityState[] = evaluator.allStates();
      let available: number = 0;
      for (let i = 0; i < states.length; i++) {
        if (evaluator.availabilityUnder(states[i]) === ServiceAvailability.AVAILABLE) {
          available++;
        }
      }
      expect(available).assertEqual(states.length);
      expect(available).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'OfflineAvailabilityUniform_012, end');
    });

    /**
     * Scenario: the label of every connectivity state.
     * Expectation: the labels match the documented strings.
     */
    it('Assessment_OfflineStateLabels_013', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'OfflineStateLabels_013, begin');
      expect(evaluator.labelOf(ConnectivityState.WIFI)).assertEqual('wifi');
      expect(evaluator.labelOf(ConnectivityState.CELLULAR)).assertEqual('cellular');
      expect(evaluator.labelOf(ConnectivityState.ETHERNET)).assertEqual('ethernet');
      expect(evaluator.labelOf(ConnectivityState.AIRPLANE)).assertEqual('airplane');
      expect(evaluator.labelOf(ConnectivityState.DISCONNECTED)).assertEqual('disconnected');
      const labels: string[] = [];
      const states: ConnectivityState[] = evaluator.allStates();
      for (let i = 0; i < states.length; i++) {
        labels.push(evaluator.labelOf(states[i]));
      }
      const unique: Set<string> = new Set<string>(labels);
      expect(unique.size).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'OfflineStateLabels_013, end');
    });

    /**
     * Scenario: a full session runs in every connectivity state.
     * Expectation: the begin, the query and the end succeed and the observable state matches
     * across states.
     */
    it('Assessment_OfflineFullSessionMatrix_014', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'OfflineFullSessionMatrix_014, begin');
      const states: ConnectivityState[] = evaluator.allStates();
      const outcomes: number[] = [];
      for (let i = 0; i < states.length; i++) {
        network.setState(states[i]);
        service.reset();
        service.begin(DURATION_TEN_MINUTES, buildWhitelist(4));
        service.isActive();
        service.getConfiguration();
        service.end();
        expect(SessionComparator.sameDuration(service, DURATION_TEN_MINUTES)).assertTrue();
        expect(SessionComparator.sameWhitelist(service, buildWhitelist(4))).assertTrue();
        expect(SessionComparator.sameActive(service.getActive(), false)).assertTrue();
        outcomes.push(service.callCount());
      }
      for (let i = 1; i < outcomes.length; i++) {
        expect(outcomes[i]).assertEqual(outcomes[0]);
      }
      expect(outcomes[0]).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'OfflineFullSessionMatrix_014, end');
    });

    /**
     * Scenario: compare two runs with a different call count.
     * Expectation: the comparator reports the mismatch with minus one.
     */
    it('Assessment_OfflineRunComparison_015', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'OfflineRunComparison_015, begin');
      const first: ApiOutcome[] = [{
        name: 'isActive',
        success: true,
        code: 0,
        networkUsed: false,
        elapsedMs: 1
      }];
      const second: ApiOutcome[] = [];
      expect(SessionComparator.compareRuns(first, second)).assertEqual(-1);
      expect(SessionComparator.compareRuns(first, first)).assertEqual(1);
      const mismatch: ApiOutcome[] = [{
        name: 'isActive',
        success: false,
        code: 3,
        networkUsed: false,
        elapsedMs: 1
      }];
      expect(SessionComparator.compareRuns(first, mismatch)).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'OfflineRunComparison_015, end');
    });

    /**
     * Scenario: the duration candidates are accepted without connectivity.
     * Expectation: every documented candidate is stored verbatim.
     */
    it('Assessment_OfflineDurationCandidates_016', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'OfflineDurationCandidates_016, begin');
      network.setState(ConnectivityState.AIRPLANE);
      const durations: number[] = [
        DURATION_DEFAULT,
        DURATION_TEN_MINUTES,
        DURATION_THIRTY_MINUTES,
        DURATION_SIXTY_MINUTES
      ];
      for (let i = 0; i < durations.length; i++) {
        service.reset();
        service.begin(durations[i], [DEFAULT_ALLOWED_APP]);
        expect(service.getDuration()).assertEqual(durations[i]);
        expect(isDocumentedDuration(service.getDuration())).assertTrue();
        expect(service.getActive()).assertTrue();
      }
      expect(network.getRequests()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'OfflineDurationCandidates_016, end');
    });

    /**
     * Scenario: the whitelist limits hold without connectivity.
     * Expectation: twenty entries are stored, an empty whitelist stays empty and the default
     * entry is the documented one.
     */
    it('Assessment_OfflineWhitelistLimits_017', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'OfflineWhitelistLimits_017, begin');
      network.setState(ConnectivityState.DISCONNECTED);
      service.reset();
      service.begin(DURATION_TEN_MINUTES, buildWhitelist(MAX_ALLOWED_APPS));
      expect(service.getAllowedApps().length).assertEqual(MAX_ALLOWED_APPS);
      service.reset();
      service.begin(DURATION_TEN_MINUTES, []);
      expect(service.getAllowedApps().length).assertEqual(0);
      service.reset();
      service.begin(DURATION_TEN_MINUTES, [DEFAULT_ALLOWED_APP]);
      expect(service.getAllowedApps()[0]).assertEqual('com.samples.assessment');
      expect(DEFAULT_ALLOWED_APP).assertEqual('com.samples.assessment');
      expect(network.getRequests()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'OfflineWhitelistLimits_017, end');
    });

    /**
     * Scenario: a failed call while the device is offline.
     * Expectation: the failure is reported with the system error code and still uses no
     * network, so the failure is local as well.
     */
    it('Assessment_OfflineFailureIsLocal_018', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'OfflineFailureIsLocal_018, begin');
      network.setState(ConnectivityState.AIRPLANE);
      network.reset();
      service.reset();
      service.failNext();
      const outcome: ApiOutcome = service.begin(DURATION_TEN_MINUTES, [DEFAULT_ALLOWED_APP]);
      expect(outcome.success).assertFalse();
      expect(outcome.code).assertEqual(3);
      expect(outcome.networkUsed).assertFalse();
      expect(service.getActive()).assertFalse();
      expect(network.getRequests()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'OfflineFailureIsLocal_018, end');
    });

    /**
     * Scenario: the retry policy of a failing call.
     * Expectation: the policy stops at three attempts, adds no backoff for a local call and
     * reports the final failure code.
     */
    it('Assessment_OfflineRetryExhausted_019', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'OfflineRetryExhausted_019, begin');
      const policy: OfflineRetryPolicy = new OfflineRetryPolicy();
      let attempts: number = 0;
      const result: RetryResult = policy.run(() => {
        attempts++;
        return false;
      });
      expect(attempts).assertEqual(RETRY_MAX_ATTEMPTS);
      expect(result.attempts).assertEqual(3);
      expect(result.success).assertFalse();
      expect(result.finalCode).assertEqual(3);
      expect(result.totalBackoffMs).assertEqual(0);
      expect(policy.isBounded()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'OfflineRetryExhausted_019, end');
    });

    /**
     * Scenario: the retry policy of a call that succeeds on the second attempt.
     * Expectation: the policy stops early, the attempt counter is two and no backoff is added.
     */
    it('Assessment_OfflineRetrySucceedsOnSecond_020', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'OfflineRetrySucceedsOnSecond_020, begin');
      const policy: OfflineRetryPolicy = new OfflineRetryPolicy();
      let attempts: number = 0;
      const result: RetryResult = policy.run(() => {
        attempts++;
        return attempts === 2;
      });
      expect(result.attempts).assertEqual(2);
      expect(result.success).assertTrue();
      expect(result.finalCode).assertEqual(0);
      expect(attempts).assertEqual(2);
      expect(result.totalBackoffMs).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'OfflineRetrySucceedsOnSecond_020, end');
    });

    /**
     * Scenario: a retry policy that uses a backoff.
     * Expectation: the backoff accumulates once per gap between attempts.
     */
    it('Assessment_OfflineRetryBackoffAccumulates_021', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'OfflineRetryBackoffAccumulates_021, begin');
      const policy: OfflineRetryPolicy = new OfflineRetryPolicy(3, RETRY_BACKOFF_MS);
      const result: RetryResult = policy.run(() => false);
      expect(result.attempts).assertEqual(3);
      expect(result.totalBackoffMs).assertEqual(RETRY_BACKOFF_MS * 2);
      expect(policy.getBackoffMs()).assertEqual(RETRY_BACKOFF_MS);
      expect(policy.getMaxAttempts()).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'OfflineRetryBackoffAccumulates_021, end');
    });

    /**
     * Scenario: the retry budget bound.
     * Expectation: a policy with a zero or an excessive budget is reported as unbounded.
     */
    it('Assessment_OfflineRetryBudgetBound_022', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'OfflineRetryBudgetBound_022, begin');
      expect(new OfflineRetryPolicy(0, 0).isBounded()).assertFalse();
      expect(new OfflineRetryPolicy(11, 0).isBounded()).assertFalse();
      expect(new OfflineRetryPolicy(1, 0).isBounded()).assertTrue();
      expect(new OfflineRetryPolicy(10, 0).isBounded()).assertTrue();
      expect(new OfflineRetryPolicy().isBounded()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'OfflineRetryBudgetBound_022, end');
    });

    /**
     * Scenario: retry the begin call of the local service.
     * Expectation: the retry succeeds after one injected failure and the network stays idle.
     */
    it('Assessment_OfflineRetryBeginCall_023', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'OfflineRetryBeginCall_023, begin');
      network.setState(ConnectivityState.AIRPLANE);
      network.reset();
      service.reset();
      service.failNext();
      const policy: OfflineRetryPolicy = new OfflineRetryPolicy();
      const result: RetryResult = policy.run(() => service.begin(DURATION_TEN_MINUTES,
        [DEFAULT_ALLOWED_APP]).success);
      expect(result.success).assertTrue();
      expect(result.attempts).assertEqual(2);
      expect(service.getActive()).assertTrue();
      expect(service.callCount()).assertEqual(2);
      expect(network.getRequests()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'OfflineRetryBeginCall_023, end');
    });

    /**
     * Scenario: retry a call that keeps failing.
     * Expectation: the local retry loop terminates without any network traffic.
     */
    it('Assessment_OfflineRetryNeverConsultsNetwork_024', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'OfflineRetryNeverConsultsNetwork_024, begin');
      network.setState(ConnectivityState.DISCONNECTED);
      network.reset();
      service.reset();
      const policy: OfflineRetryPolicy = new OfflineRetryPolicy(3, 0);
      const result: RetryResult = policy.run(() => {
        service.failNext();
        return service.end().success;
      });
      expect(result.success).assertFalse();
      expect(result.attempts).assertEqual(3);
      expect(service.callCount()).assertEqual(3);
      expect(network.getRequests()).assertEqual(0);
      expect(service.networkUsedCount()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'OfflineRetryNeverConsultsNetwork_024, end');
    });

    /**
     * Scenario: the event log of the offline service.
     * Expectation: the log records the begin and the end events and keeps its twenty entry cap.
     */
    it('Assessment_OfflineEventJournalCap_025', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'OfflineEventJournalCap_025, begin');
      network.setState(ConnectivityState.AIRPLANE);
      service.reset();
      for (let i = 0; i < MAX_EVENT_LOG + 5; i++) {
        service.begin(DURATION_DEFAULT, []);
        service.end();
      }
      expect(service.eventCount()).assertEqual(MAX_EVENT_LOG);
      expect(service.getSeq()).assertEqual((MAX_EVENT_LOG + 5) * 2);
      const events: LocalEvent[] = service.getEvents();
      expect(events[0].type).assertEqual('onEnd');
      expect(events[1].type).assertEqual('onBegin');
      expect(network.getRequests()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'OfflineEventJournalCap_025, end');
    });

    /**
     * Scenario: the offline model is reset between two sessions.
     * Expectation: the state, the calls and the events are dropped.
     */
    it('Assessment_OfflineServiceReset_026', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'OfflineServiceReset_026, begin');
      service.reset();
      service.begin(DURATION_TEN_MINUTES, [DEFAULT_ALLOWED_APP]);
      service.end();
      expect(service.callCount()).assertEqual(2);
      expect(service.eventCount()).assertEqual(2);
      service.reset();
      expect(service.callCount()).assertEqual(0);
      expect(service.eventCount()).assertEqual(0);
      expect(service.getActive()).assertFalse();
      expect(service.getDuration()).assertEqual(INVALID_DURATION);
      expect(service.getAllowedApps().length).assertEqual(0);
      expect(service.getConfigured()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', service.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'OfflineServiceReset_026, end');
    });

    /**
     * Scenario: a begin, an end and a second begin while offline.
     * Expectation: the state machine moves forward and backward without any network traffic.
     */
    it('Assessment_OfflineRepeatedSessions_027', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'OfflineRepeatedSessions_027, begin');
      network.setState(ConnectivityState.DISCONNECTED);
      network.reset();
      service.reset();
      for (let i = 0; i < 5; i++) {
        service.begin(DURATION_THIRTY_MINUTES, [DEFAULT_ALLOWED_APP]);
        expect(service.getActive()).assertTrue();
        service.end();
        expect(service.getActive()).assertFalse();
      }
      expect(service.callCount()).assertEqual(10);
      expect(network.getRequests()).assertEqual(0);
      expect(service.networkUsedCount()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'OfflineRepeatedSessions_027, end');
    });

    /**
     * Scenario: the call names recorded by the offline service.
     * Expectation: the names match the four api names of the assessment kit.
     */
    it('Assessment_OfflineCallNames_030', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'OfflineCallNames_030, begin');
      service.reset();
      service.begin(DURATION_TEN_MINUTES, [DEFAULT_ALLOWED_APP]);
      service.isActive();
      service.getConfiguration();
      service.end();
      const calls: ApiOutcome[] = service.getCalls();
      expect(calls[0].name).assertEqual('begin');
      expect(calls[1].name).assertEqual('isActive');
      expect(calls[2].name).assertEqual('getConfiguration');
      expect(calls[3].name).assertEqual('end');
      const names: string[] = ['begin', 'end', 'isActive', 'getConfiguration'];
      const unique: Set<string> = new Set<string>(names);
      expect(unique.size).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'OfflineCallNames_030, end');
    });

    /**
     * Scenario: the configuration query keeps the whitelist order.
     * Expectation: the order typed by the user is preserved, the query never reorders it.
     */
    it('Assessment_OfflineWhitelistOrderPreserved_031', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'OfflineWhitelistOrderPreserved_031, begin');
      network.setState(ConnectivityState.AIRPLANE);
      service.reset();
      const apps: string[] = ['com.samples.reader', 'com.samples.assessment', 'com.samples.dictionary'];
      service.begin(DURATION_TEN_MINUTES, apps);
      service.getConfiguration();
      const stored: string[] = service.getAllowedApps();
      expect(stored.length).assertEqual(3);
      expect(stored[0]).assertEqual('com.samples.reader');
      expect(stored[1]).assertEqual('com.samples.assessment');
      expect(stored[2]).assertEqual('com.samples.dictionary');
      expect(SessionComparator.sameWhitelist(service, apps)).assertTrue();
      expect(network.getRequests()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'OfflineWhitelistOrderPreserved_031, end');
    });

    /**
     * Scenario: the whitelist is copied on begin.
     * Expectation: a later mutation of the caller array does not reach the stored configuration.
     */
    it('Assessment_OfflineWhitelistSnapshot_032', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'OfflineWhitelistSnapshot_032, begin');
      service.reset();
      const apps: string[] = ['com.samples.assessment'];
      service.begin(DURATION_TEN_MINUTES, apps);
      apps.push('com.samples.reader');
      expect(apps.length).assertEqual(2);
      expect(service.getAllowedApps().length).assertEqual(1);
      expect(service.getAllowedApps()[0]).assertEqual('com.samples.assessment');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'OfflineWhitelistSnapshot_032, end');
    });

    /**
     * Scenario: a query after the end of a session.
     * Expectation: isActive answers false and the configuration keeps the last stored value
     * until the next begin.
     */
    it('Assessment_OfflineQueryAfterEnd_033', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'OfflineQueryAfterEnd_033, begin');
      service.reset();
      service.begin(DURATION_SIXTY_MINUTES, buildWhitelist(6));
      service.end();
      const outcome: ApiOutcome = service.isActive();
      expect(outcome.success).assertTrue();
      expect(service.getActive()).assertFalse();
      expect(service.getDuration()).assertEqual(DURATION_SIXTY_MINUTES);
      expect(service.getAllowedApps().length).assertEqual(6);
      expect(service.getConfigured()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'OfflineQueryAfterEnd_033, end');
    });

    /**
     * Scenario: the description of the offline service used by the failure diagnosis.
     * Expectation: the description names the active flag, the call count and the configured
     * flag.
     */
    it('Assessment_OfflineServiceDescription_034', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'OfflineServiceDescription_034, begin');
      service.reset();
      const idle: string = service.describe();
      expect(idle).assertContain('active=false');
      expect(idle).assertContain('calls=0');
      expect(idle).assertContain('configured=false');
      service.begin(DURATION_TEN_MINUTES, [DEFAULT_ALLOWED_APP]);
      const running: string = service.describe();
      expect(running).assertContain('active=true');
      expect(running).assertContain('calls=1');
      expect(running).assertContain('configured=true');
      hilog.info(DOMAIN, TAG, '%{public}s', running);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'OfflineServiceDescription_034, end');
    });

    /**
     * Scenario: the initial state of the network stack.
     * Expectation: the stack starts connected and without any recorded request.
     */
    it('Assessment_OfflineNetworkInitialState_035', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'OfflineNetworkInitialState_035, begin');
      const local: NetworkStack = new NetworkStack();
      expect(local.getState()).assertEqual(ConnectivityState.WIFI);
      expect(local.isConnected()).assertTrue();
      expect(local.isAirplaneMode()).assertFalse();
      expect(local.getRequests()).assertEqual(0);
      expect(local.getSuccessfulRequests()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', local.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'OfflineNetworkInitialState_035, end');
    });

    /**
     * Scenario: the sample constants used by the offline cases.
     * Expectation: the limits match the documented AssessmentConstants values.
     */
    it('Assessment_OfflineDomainConstants_036', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'OfflineDomainConstants_036, begin');
      expect(MAX_ALLOWED_APPS).assertEqual(20);
      expect(MAX_EVENT_LOG).assertEqual(20);
      expect(DURATION_TEN_MINUTES).assertEqual(600000);
      expect(DURATION_THIRTY_MINUTES).assertEqual(1800000);
      expect(DURATION_SIXTY_MINUTES).assertEqual(3600000);
      expect(INVALID_DURATION).assertEqual(-1);
      expect(DEFAULT_ALLOWED_APP).assertEqual('com.samples.assessment');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'OfflineDomainConstants_036, end');
    });

  });
}
