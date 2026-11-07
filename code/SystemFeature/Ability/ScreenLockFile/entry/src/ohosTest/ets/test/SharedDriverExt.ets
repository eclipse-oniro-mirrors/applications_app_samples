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

/*
 * SharedDriverExt - Extended helper methods for UI testing.
 * Wraps SharedDriver with domain-specific verification utilities.
 */

import { Driver, Component, ON } from '@kit.TestKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { SharedDriver } from './SharedDriver';
import {
  DOMAIN, TAG, UI_IDLE_TIME, UI_IDLE_TIMEOUT,
  ID_OPERATION_RESULT, ID_PAIRING_STATUS, ID_NO_HISTORY_TEXT,
  ID_CLEAR_HISTORY_BUTTON, ID_QUERY_BUTTON, ID_ACQUIRE_BUTTON,
  ID_RELEASE_BUTTON, ID_QUERY_ALL_BUTTON,
  TEXT_KEY_STATE, TEXT_ACQUIRE, TEXT_RELEASE, TEXT_PENDING,
  MAX_HISTORY_SIZE
} from './TestConstants';
import { scrollToId } from '../testkit/SharedDriver';

interface PairingCounts {
  acquire: number;
  release: number;
  pending: number;
}

interface HistoryEntry {
  timestamp: string;
  operation: string;
  result: string;
}

export class SharedDriverExt {
  private driver: SharedDriver;

  constructor(driver: SharedDriver) {
    this.driver = driver;
  }

  async waitUiIdle(): Promise<void> {
    await this.driver.waitUiIdle();
  }

  async waitTimeout(): Promise<void> {
    await this.driver.waitTimeout();
  }

  async clickId(id: string): Promise<void> {
    await this.driver.clickId(id);
  }

  async getTextById(id: string): Promise<string> {
    return await this.driver.getTextById(id);
  }

  async existsId(id: string): Promise<boolean> {
    return await this.driver.existsId(id);
  }

  async assertComponentExist(id: string): Promise<void> {
    await this.driver.assertComponentExist(id);
  }

  hilogBegin(testName: string): void {
    this.driver.hilogBegin(testName);
  }

  hilogEnd(testName: string): void {
    this.driver.hilogEnd(testName);
  }

  async getOperationResult(): Promise<string> {
    return await this.driver.getTextById(ID_OPERATION_RESULT);
  }

  async getPairingStatusText(): Promise<string> {
    return await this.driver.getTextById(ID_PAIRING_STATUS);
  }

  async clickQueryButton(): Promise<string> {
    return await this.driver.clickAndGetResult(ID_QUERY_BUTTON, ID_OPERATION_RESULT);
  }

  async clickAcquireButton(): Promise<string> {
    return await this.driver.clickAndGetResult(ID_ACQUIRE_BUTTON, ID_OPERATION_RESULT);
  }

  async clickReleaseButton(): Promise<string> {
    return await this.driver.clickAndGetResult(ID_RELEASE_BUTTON, ID_OPERATION_RESULT);
  }

  async clickQueryAllButton(): Promise<string> {
    return await this.driver.clickAndGetResult(ID_QUERY_ALL_BUTTON, ID_OPERATION_RESULT);
  }

  async clearHistory(): Promise<void> {
    await this.driver.clickId(ID_CLEAR_HISTORY_BUTTON);
    await this.driver.waitUiIdle();
  }

  async clearHistoryAndWait(): Promise<void> {
    await this.clearHistory();
    await this.driver.waitTimeout();
  }

  async verifyResultContains(expected: string): Promise<boolean> {
    const resultText = await this.getOperationResult();
    return resultText.includes(expected);
  }

  async verifyResultNotContains(unexpected: string): Promise<boolean> {
    const resultText = await this.getOperationResult();
    return !resultText.includes(unexpected);
  }

  async getResultTextBeforeAndAfter(buttonId: string): Promise<string[]> {
    const beforeText = await this.getOperationResult();
    const afterText = await this.driver.clickAndGetResult(buttonId, ID_OPERATION_RESULT);
    const results: string[] = [];
    results.push(beforeText);
    results.push(afterText);
    return results;
  }

  async parsePairingCounts(): Promise<PairingCounts> {
    const pairingText = await this.getPairingStatusText();
    const counts: PairingCounts = { acquire: 0, release: 0, pending: 0 };

    const acquireMatch = new RegExp('Acquire:\\s*(\\d+)');
    const releaseMatch = new RegExp('Release:\\s*(\\d+)');
    const pendingMatch = new RegExp('Pending:\\s*(\\d+)');

    const acquireExec = acquireMatch.exec(pairingText);
    if (acquireExec !== null && acquireExec.length > 1) {
      counts.acquire = parseInt(acquireExec[1]);
    }

    const releaseExec = releaseMatch.exec(pairingText);
    if (releaseExec !== null && releaseExec.length > 1) {
      counts.release = parseInt(releaseExec[1]);
    }

    const pendingExec = pendingMatch.exec(pairingText);
    if (pendingExec !== null && pendingExec.length > 1) {
      counts.pending = parseInt(pendingExec[1]);
    }

    return counts;
  }

  async verifyPairingCounts(expectedAcquire: number, expectedRelease: number): Promise<boolean> {
    const counts = await this.parsePairingCounts();
    const expectedPending = expectedAcquire - expectedRelease >= 0 ? expectedAcquire - expectedRelease : 0;
    return counts.acquire === expectedAcquire &&
      counts.release === expectedRelease &&
      counts.pending === expectedPending;
  }

  async isHistoryEmpty(): Promise<boolean> {
    return await this.existsId(ID_NO_HISTORY_TEXT);
  }

  async getHistoryEntryCount(): Promise<number> {
    const isEmpty = await this.isHistoryEmpty();
    if (isEmpty) {
      return 0;
    }
    const driver = Driver.create();
    const allComponents = await driver.findComponents(ON.type('Text'));
    return allComponents.length;
  }

  async performMultipleQueries(count: number): Promise<string[]> {
    const results: string[] = [];
    for (let i = 0; i < count; i++) {
      const result = await this.clickQueryButton();
      results.push(result);
      await this.driver.waitUiIdle();
    }
    return results;
  }

  async performMultipleAcquires(count: number): Promise<string[]> {
    const results: string[] = [];
    for (let i = 0; i < count; i++) {
      const result = await this.clickAcquireButton();
      results.push(result);
      await this.driver.waitUiIdle();
    }
    return results;
  }

  async performMultipleReleases(count: number): Promise<string[]> {
    const results: string[] = [];
    for (let i = 0; i < count; i++) {
      const result = await this.clickReleaseButton();
      results.push(result);
      await this.driver.waitUiIdle();
    }
    return results;
  }

  async measureOperationLatency(buttonId: string): Promise<number> {
    const startTime = Date.now();
    await this.driver.clickId(buttonId);
    await this.driver.waitUiIdle();
    const endTime = Date.now();
    return endTime - startTime;
  }

  async measureMultipleLatencies(buttonId: string, count: number): Promise<number[]> {
    const latencies: number[] = [];
    for (let i = 0; i < count; i++) {
      const latency = await this.measureOperationLatency(buttonId);
      latencies.push(latency);
    }
    return latencies;
  }

  async calculateAverageLatency(latencies: number[]): Promise<number> {
    if (latencies.length === 0) {
      return 0;
    }
    let sum = 0;
    for (let i = 0; i < latencies.length; i++) {
      sum = sum + latencies[i];
    }
    return sum / latencies.length;
  }

  async verifyComponentHasText(id: string, expectedText: string): Promise<boolean> {
    try {
      const text = await this.driver.getTextById(id);
      return text === expectedText;
    } catch (error) {
      const err = error as Error;
      hilog.warn(DOMAIN, TAG, 'verifyComponentHasText failed for %{public}s: %{public}s', id, err.message);
      return false;
    }
  }

  async verifyComponentContainsText(id: string, expectedSubstring: string): Promise<boolean> {
    try {
      const text = await this.driver.getTextById(id);
      return text.includes(expectedSubstring);
    } catch (error) {
      const err = error as Error;
      hilog.warn(DOMAIN, TAG, 'verifyComponentContainsText failed for %{public}s: %{public}s', id, err.message);
      return false;
    }
  }

  async waitForComponentVisible(id: string, maxWaitMs: number): Promise<boolean> {
    const startTime = Date.now();
    while (Date.now() - startTime < maxWaitMs) {
      const exists = await this.existsId(id);
      if (exists) {
        return true;
      }
      await this.driver.waitUiIdle();
    }
    return false;
  }

  async waitForComponentHidden(id: string, maxWaitMs: number): Promise<boolean> {
    const startTime = Date.now();
    while (Date.now() - startTime < maxWaitMs) {
      const exists = await this.existsId(id);
      if (!exists) {
        return true;
      }
      await this.driver.waitUiIdle();
    }
    return false;
  }

  async fullWorkflowQuery(): Promise<string> {
    await this.clearHistoryAndWait();
    const result = await this.clickQueryButton();
    return result;
  }

  async fullWorkflowAcquireRelease(): Promise<string[]> {
    await this.clearHistoryAndWait();
    const acquireResult = await this.clickAcquireButton();
    const releaseResult = await this.clickReleaseButton();
    const results: string[] = [];
    results.push(acquireResult);
    results.push(releaseResult);
    return results;
  }

  async fullWorkflowMultipleOps(queryCount: number, acquireCount: number, releaseCount: number): Promise<void> {
    await this.clearHistoryAndWait();
    for (let i = 0; i < queryCount; i++) {
      await this.clickQueryButton();
    }
    for (let i = 0; i < acquireCount; i++) {
      await this.clickAcquireButton();
    }
    for (let i = 0; i < releaseCount; i++) {
      await this.clickReleaseButton();
    }
    await this.driver.waitTimeout();
  }

  async verifyQueryAllResult(): Promise<boolean> {
    const result = await this.clickQueryAllButton();
    const hasKeyState = result.includes(TEXT_KEY_STATE);
    const hasAcquire = result.includes(TEXT_ACQUIRE);
    const hasRelease = result.includes(TEXT_RELEASE);
    const hasPending = result.includes(TEXT_PENDING);
    return hasKeyState && hasAcquire && hasRelease && hasPending;
  }

  async verifyHistoryMaxSize(): Promise<boolean> {
    await this.clearHistoryAndWait();
    for (let i = 0; i < MAX_HISTORY_SIZE + 5; i++) {
      await this.clickQueryButton();
    }
    await this.driver.waitTimeout();
    const isEmpty = await this.isHistoryEmpty();
    return !isEmpty;
  }

  async getPairingStatusAfterOperations(acquireOps: number, releaseOps: number): Promise<PairingCounts> {
    await this.clearHistoryAndWait();
    for (let i = 0; i < acquireOps; i++) {
      await this.clickAcquireButton();
    }
    for (let i = 0; i < releaseOps; i++) {
      await this.clickReleaseButton();
    }
    await this.driver.waitTimeout();
    return await this.parsePairingCounts();
  }
}
