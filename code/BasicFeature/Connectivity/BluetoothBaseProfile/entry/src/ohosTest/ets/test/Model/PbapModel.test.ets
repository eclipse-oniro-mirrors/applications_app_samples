/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, it, expect } from '@ohos/hypium';
import { BluetoothConnectionState, PbapModel, PbapState } from 'library';

const DEVICE_ID: string = 'pbap_model_device';
const SIBLING_ID: string = 'sibling_pbap_device';
const MAX_LOG: number = 200;
const DEFAULT_PHONEBOOK_TYPE: string = 'SIM';
const DEFAULT_SORT_ORDER: string = 'indexed';

interface ContactEntry {
  name: string;
  number: string;
}

interface PbapDataPayload {
  totalContacts: number;
  syncedContacts: number;
  syncProgress: number;
  isSyncing: boolean;
  lastSyncTime: number;
  phonebookType: string;
  sortOrder: string;
  searchKeyword: string;
  contacts: ContactEntry[];
}

/**
 * structure build a complete PBAP phonebook data payload.
 * @param {number} totalContacts - total contact count
 * @param {string} phonebookType - phonebook type
 * @param {string} searchKeyword - check index relate key character
 * @returns {PbapDataPayload} data payload
 */
function buildPayload(totalContacts: number, phonebookType: string, searchKeyword: string): PbapDataPayload {
  return {
    totalContacts: totalContacts,
    syncedContacts: 12,
    syncProgress: 60,
    isSyncing: true,
    lastSyncTime: 1700000000000,
    phonebookType: phonebookType,
    sortOrder: DEFAULT_SORT_ORDER,
    searchKeyword: searchKeyword,
    contacts: [{ name: 'Alice', number: '13800000001' }, { name: 'Bob', number: '13800000002' }]
  };
}

/**
 * read day log last internal content (remove drop timestamp prefix).
 * @param {PbapModel} model - passive test model type
 * @returns {string} last day log correct text, none day log time return empty string
 */
function lastLog(model: PbapModel): string {
  const logs = model.getLogs();
  if (logs.length === 0) {
    return '';
  }
  const entry: string = logs[logs.length - 1];
  return entry.substring(entry.indexOf('] ') + 2);
}

/**
 * @description Test suite for PbapModel
 * @since 26.0.0
 */
export default function pbapModelTest(): void {
  describe('PbapModelTest', () => {
    // ==================== structure build and instance isolation (2 cases) ====================

    /*
     * @tc.number: SUB_PBAP_MODEL_0100
     * @tc.name: testPbapModel0001
     * @tc.desc: Verify the default field values of a PBAP model created without arguments.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testPbapModel0001', 0, () => {
      const before: number = Date.now();
      const model = new PbapModel();
      const after: number = Date.now();

      expect(model.deviceId).assertEqual('');
      expect(model.state).assertEqual(PbapState.DISCONNECTED);
      expect(model.data).assertEqual(null);
      expect(model.operationLog.length).assertEqual(0);
      expect(model.operationCount).assertEqual(0);
      expect(model.retryCount).assertEqual(0);
      expect(model.errorMessage).assertEqual('');
      expect(model.errorCode).assertEqual(0);
      expect(model.connectionDuration).assertEqual(0);
      expect(model.connectionStartTime).assertEqual(0);
      expect(model.contacts.length).assertEqual(0);
      expect(model.isSyncing).assertFalse();
      expect(model.lastSyncTime).assertEqual(0);
      expect(model.phonebookType).assertEqual(DEFAULT_PHONEBOOK_TYPE);
      expect(model.searchKeyword).assertEqual('');
      expect(model.sortOrder).assertEqual(DEFAULT_SORT_ORDER);
      expect(model.syncProgress).assertEqual(0);
      expect(model.syncedContacts).assertEqual(0);
      expect(model.totalContacts).assertEqual(0);
      expect(model.maxRetries).assertEqual(3);
      expect(model.timeoutMs).assertEqual(10000);
      expect(model.isInitialized).assertTrue();
      expect(model.lastUpdateTime >= before && model.lastUpdateTime <= after).assertTrue();
    });

    /*
     * @tc.number: SUB_PBAP_MODEL_0200
     * @tc.name: testPbapModel0002
     * @tc.desc: Verify two models bound to different identifiers keep their own phonebook progress and counters.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testPbapModel0002', 0, () => {
      const model = new PbapModel(DEVICE_ID);
      const sibling = new PbapModel(SIBLING_ID);

      model.totalContacts = 250;
      model.syncedContacts = 120;
      model.searchKeyword = 'ali';
      model.markConnecting();

      expect(model.deviceId).assertEqual(DEVICE_ID);
      expect(model.state).assertEqual(PbapState.CONNECTING);
      expect(model.operationCount).assertEqual(1);
      expect(sibling.deviceId).assertEqual(SIBLING_ID);
      expect(sibling.state).assertEqual(PbapState.DISCONNECTED);
      expect(sibling.totalContacts).assertEqual(0);
      expect(sibling.syncedContacts).assertEqual(0);
      expect(sibling.searchKeyword).assertEqual('');
      expect(sibling.phonebookType).assertEqual(DEFAULT_PHONEBOOK_TYPE);
      expect(sibling.getLogs().length).assertEqual(0);
      expect(model.toString().indexOf('PbapModel[deviceId=' + DEVICE_ID + ', state=connecting')).assertEqual(0);
    });

    // ==================== connection state transitions (4 cases) ====================

    /*
     * @tc.number: SUB_PBAP_MODEL_0300
     * @tc.name: testPbapModel0003
     * @tc.desc: Verify entering the connecting state records the start time and one log entry.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testPbapModel0003', 0, () => {
      const model = new PbapModel(DEVICE_ID);
      const created: number = model.lastUpdateTime;

      model.markConnecting();

      expect(model.state).assertEqual(PbapState.CONNECTING);
      expect(model.isConnecting()).assertTrue();
      expect(model.isConnected()).assertFalse();
      expect(model.connectionStartTime > 0).assertTrue();
      expect(model.connectionStartTime >= created).assertTrue();
      expect(model.operationCount).assertEqual(1);
      expect(model.getLogs().length).assertEqual(1);
      expect(lastLog(model)).assertEqual('Connecting to device');
      expect(model.retryCount).assertEqual(0);
    });

    /*
     * @tc.number: SUB_PBAP_MODEL_0400
     * @tc.name: testPbapModel0004
     * @tc.desc: Verify a successful connection clears the previous error information and retry counter.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testPbapModel0004', 0, () => {
      const model = new PbapModel(DEVICE_ID);
      model.markConnecting();
      model.markError('OBEX pull failed', 35200003);
      expect(model.retryCount).assertEqual(1);
      expect(model.errorCode).assertEqual(35200003);

      model.markConnected();

      expect(model.state).assertEqual(PbapState.CONNECTED);
      expect(model.isConnected()).assertTrue();
      expect(model.isConnecting()).assertFalse();
      expect(model.retryCount).assertEqual(0);
      expect(model.errorMessage).assertEqual('');
      expect(model.errorCode).assertEqual(0);
      expect(model.getConnectionDuration() >= model.connectionDuration).assertTrue();
      expect(model.getLogs().length).assertEqual(3);
      expect(lastLog(model)).assertEqual('Connected to device');
      expect(model.operationCount).assertEqual(3);
    });

    /*
     * @tc.number: SUB_PBAP_MODEL_0500
     * @tc.name: testPbapModel0005
     * @tc.desc: Verify the disconnecting and disconnected transitions reset the connection duration.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testPbapModel0005', 0, () => {
      const model = new PbapModel(DEVICE_ID);
      model.markConnecting();
      model.markConnected();

      model.markDisconnecting();
      expect(model.state).assertEqual(PbapState.DISCONNECTING);
      expect(model.isConnected()).assertFalse();
      expect(model.isConnecting()).assertFalse();
      expect(lastLog(model)).assertEqual('Disconnecting from device');

      model.markDisconnected();
      expect(model.state).assertEqual(PbapState.DISCONNECTED);
      expect(model.connectionDuration).assertEqual(0);
      expect(model.getConnectionDuration()).assertEqual(0);
      expect(model.getLogs().length).assertEqual(4);
      expect(lastLog(model)).assertEqual('Disconnected from device');
      expect(model.operationCount).assertEqual(4);
    });

    /*
     * @tc.number: SUB_PBAP_MODEL_0600
     * @tc.name: testPbapModel0006
     * @tc.desc: Verify the retry allowance is exhausted exactly after the third failed attempt.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testPbapModel0006', 0, () => {
      const model = new PbapModel(DEVICE_ID);

      model.markError('access denied by user', 35200009);
      expect(model.state).assertEqual(PbapState.ERROR);
      expect(model.errorMessage).assertEqual('access denied by user');
      expect(model.errorCode).assertEqual(35200009);
      expect(model.retryCount).assertEqual(1);
      expect(model.canRetry()).assertTrue();
      expect(lastLog(model)).assertEqual('Error: access denied by user');

      model.markError('access denied by user', 35200009);
      model.markError('access denied by user', 35200009);
      expect(model.retryCount).assertEqual(3);
      expect(model.retryCount).assertEqual(model.maxRetries);
      expect(model.canRetry()).assertFalse();

      model.markError('access denied by user', 35200009);
      expect(model.retryCount).assertEqual(4);
      expect(model.canRetry()).assertFalse();
      expect(model.getLogs().length).assertEqual(4);
      expect(model.operationCount).assertEqual(4);

      model.markConnected();
      expect(model.canRetry()).assertTrue();
      expect(model.retryCount).assertEqual(0);
    });

    // ==================== operation log row for (2 cases) ====================

    /*
     * @tc.number: SUB_PBAP_MODEL_0700
     * @tc.name: testPbapModel0007
     * @tc.desc: Verify appended logs carry an ISO timestamp prefix and the accessor returns a defensive copy.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testPbapModel0007', 0, () => {
      const model = new PbapModel(DEVICE_ID);
      model.addLog('first entry');
      model.addLog('second entry');

      const logs = model.getLogs();
      expect(logs.length).assertEqual(2);
      expect(model.operationCount).assertEqual(2);
      expect(logs[0].indexOf('[')).assertEqual(0);
      expect(logs[0].indexOf('first entry')).assertEqual(logs[0].length - 11);
      expect(logs[1].indexOf('T')).assertLarger(0);
      expect(logs[1].indexOf('Z] ')).assertLarger(0);

      logs.push('injected');
      expect(logs.length).assertEqual(3);
      expect(model.getLogs().length).assertEqual(2);
      expect(model.state).assertEqual(PbapState.DISCONNECTED);
      expect(model.sortOrder).assertEqual(DEFAULT_SORT_ORDER);
    });

    /*
     * @tc.number: SUB_PBAP_MODEL_0800
     * @tc.name: testPbapModel0008
     * @tc.desc: Verify the log buffer is trimmed to the ceiling while clearing keeps the operation counter.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testPbapModel0008', 0, () => {
      const model = new PbapModel(DEVICE_ID);
      for (let i = 0; i < MAX_LOG + 5; i++) {
        model.addLog('log-' + i);
      }

      const logs = model.getLogs();
      expect(logs.length).assertEqual(MAX_LOG);
      expect(model.operationLog.length).assertEqual(MAX_LOG);
      expect(model.operationCount).assertEqual(MAX_LOG + 5);
      expect(lastLog(model)).assertEqual('log-204');
      expect(logs[0].indexOf('log-5')).assertLarger(0);
      expect(logs[0].indexOf('log-0 ')).assertEqual(-1);

      model.clearLogs();
      expect(model.getLogs().length).assertEqual(0);
      expect(model.operationCount).assertEqual(MAX_LOG + 5);
      expect(model.state).assertEqual(PbapState.DISCONNECTED);

      model.addLog('gamma');
      expect(model.getLogs().length).assertEqual(1);
      expect(model.operationCount).assertEqual(MAX_LOG + 6);
      expect(lastLog(model)).assertEqual('gamma');
    });

    // ==================== data payload and state entry (2 cases) ====================

    /*
     * @tc.number: SUB_PBAP_MODEL_0900
     * @tc.name: testPbapModel0009
     * @tc.desc: Verify updating phonebook data stores the payload by reference without touching logs or state.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testPbapModel0009', 0, () => {
      const model = new PbapModel(DEVICE_ID);
      const created: number = model.lastUpdateTime;
      expect(model.data).assertEqual(null);

      const payload: PbapDataPayload = buildPayload(80, 'local', 'bob');
      model.updateData(payload);

      const stored: ESObject = model.data;
      expect(model.data !== null).assertTrue();
      expect(stored.totalContacts).assertEqual(80);
      expect(stored.syncedContacts).assertEqual(12);
      expect(stored.syncProgress).assertEqual(60);
      expect(stored.isSyncing).assertTrue();
      expect(stored.lastSyncTime).assertEqual(1700000000000);
      expect(stored.phonebookType).assertEqual('local');
      expect(stored.sortOrder).assertEqual(DEFAULT_SORT_ORDER);
      expect(stored.searchKeyword).assertEqual('bob');
      expect(stored.contacts.length).assertEqual(2);
      expect(stored.contacts[0].name).assertEqual('Alice');
      expect(stored.contacts[1].number).assertEqual('13800000002');
      expect(model.getLogs().length).assertEqual(0);
      expect(model.operationCount).assertEqual(0);
      expect(model.state).assertEqual(PbapState.DISCONNECTED);
      expect(model.lastUpdateTime >= created).assertTrue();

      payload.totalContacts = 95;
      expect(stored.totalContacts).assertEqual(95);
      expect(model.contacts.length).assertEqual(0);
    });

    /*
     * @tc.number: SUB_PBAP_MODEL_1000
     * @tc.name: testPbapModel0010
     * @tc.desc: Verify the connection state entry point only refreshes the timestamp and never mutates the model.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testPbapModel0010', 0, () => {
      const model = new PbapModel(DEVICE_ID);
      model.markConnecting();
      const before: number = model.lastUpdateTime;

      model.updateConnectionState(BluetoothConnectionState.CONNECTED);
      expect(model.state).assertEqual(PbapState.CONNECTING);
      expect(model.isConnected()).assertFalse();
      expect(model.getLogs().length).assertEqual(1);
      expect(model.operationCount).assertEqual(1);
      expect(model.lastUpdateTime >= before).assertTrue();

      model.updateConnectionState(BluetoothConnectionState.DISCONNECTED);
      model.updateConnectionState(BluetoothConnectionState.DISCONNECTING);
      model.updateConnectionState(BluetoothConnectionState.CONNECTION_FAILED);
      model.updateConnectionState(BluetoothConnectionState.CONNECTION_TIMEOUT);

      expect(model.state).assertEqual(PbapState.CONNECTING);
      expect(model.isConnecting()).assertTrue();
      expect(model.getLogs().length).assertEqual(1);
      expect(model.operationCount).assertEqual(1);
      expect(model.errorMessage).assertEqual('');
      expect(model.errorCode).assertEqual(0);
      expect(model.connectionDuration).assertEqual(0);
      expect(model.data).assertEqual(null);
    });

    // ==================== reset and serialize (2 cases) ====================

    /*
     * @tc.number: SUB_PBAP_MODEL_1100
     * @tc.name: testPbapModel0011
     * @tc.desc: Verify reset clears session data while phonebook settings and the device binding survive.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testPbapModel0011', 0, () => {
      const model = new PbapModel(DEVICE_ID);
      model.markConnecting();
      model.markConnected();
      model.markError('transfer aborted', 35200002);
      model.updateData(buildPayload(40, 'SIM', 'car'));
      model.totalContacts = 40;
      model.syncedContacts = 17;
      model.phonebookType = 'SIM';
      model.searchKeyword = 'car';
      const extraContact: ContactEntry = { name: 'Carl', number: '13900000003' };
      model.contacts.push(extraContact);
      expect(model.getLogs().length).assertEqual(3);

      model.reset();

      expect(model.state).assertEqual(PbapState.DISCONNECTED);
      expect(model.data).assertEqual(null);
      expect(model.getLogs().length).assertEqual(0);
      expect(model.operationCount).assertEqual(0);
      expect(model.retryCount).assertEqual(0);
      expect(model.errorMessage).assertEqual('');
      expect(model.errorCode).assertEqual(0);
      expect(model.connectionDuration).assertEqual(0);
      expect(model.connectionStartTime).assertEqual(0);
      expect(model.isConnected()).assertFalse();

      expect(model.totalContacts).assertEqual(40);
      expect(model.syncedContacts).assertEqual(17);
      expect(model.phonebookType).assertEqual(DEFAULT_PHONEBOOK_TYPE);
      expect(model.searchKeyword).assertEqual('car');
      expect(model.contacts.length).assertEqual(1);
      expect(model.deviceId).assertEqual(DEVICE_ID);
      expect(model.isInitialized).assertTrue();
    });

    /*
     * @tc.number: SUB_PBAP_MODEL_1200
     * @tc.name: testPbapModel0012
     * @tc.desc: Verify the serialized object and the text summary expose session fields but omit phonebook settings.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testPbapModel0012', 0, () => {
      const model = new PbapModel(DEVICE_ID);
      model.markConnecting();
      model.markError('folder not available', 35200005);
      model.totalContacts = 9;
      model.syncProgress = 33;

      const json: ESObject = model.toJSON();
      expect(json.state).assertEqual(PbapState.ERROR);
      expect(json.deviceId).assertEqual(DEVICE_ID);
      expect(json.retryCount).assertEqual(1);
      expect(json.errorMessage).assertEqual('folder not available');
      expect(json.errorCode).assertEqual(35200005);
      expect(json.operationCount).assertEqual(2);
      expect(json.connectionDuration).assertEqual(0);
      expect(json.data).assertEqual(null);
      const serialized: string = JSON.stringify(model.toJSON());
      expect(serialized.indexOf('totalContacts')).assertEqual(-1);
      expect(serialized.indexOf('syncProgress')).assertEqual(-1);
      expect(serialized.indexOf('maxRetries')).assertEqual(-1);

      const summary: string = model.toString();
      expect(summary.indexOf('PbapModel[deviceId=' + DEVICE_ID)).assertEqual(0);
      expect(summary.indexOf('state=error')).assertLarger(0);
      expect(summary.indexOf('retryCount=1')).assertLarger(0);
      expect(summary.indexOf('ops=2')).assertLarger(0);
      expect(summary.charAt(summary.length - 1)).assertEqual(']');
    });
  });
}
