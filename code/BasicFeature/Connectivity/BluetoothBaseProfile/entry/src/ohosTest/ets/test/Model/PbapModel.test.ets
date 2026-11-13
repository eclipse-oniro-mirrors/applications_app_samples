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
import { hilog } from '@kit.PerformanceAnalysisKit';
import { BluetoothConnectionState, PbapModel, PbapState, PbapData, PbapModelJson } from 'library';

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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPbapModel0001', 'begin');
      const before: number = Date.now();
      const model: PbapModel = new PbapModel();
      const after: number = Date.now();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapModel0001',
        '#1 ' + "model.deviceId" + ' = ' + JSON.stringify(model.deviceId));
      expect(model.deviceId).assertEqual('');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapModel0001',
        '#2 ' + "model.state" + ' = ' + JSON.stringify(model.state));
      expect(model.state).assertEqual(PbapState.DISCONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapModel0001',
        '#3 ' + "model.data" + ' = ' + JSON.stringify(model.data));
      expect(model.data).assertEqual(null);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapModel0001',
        '#4 ' + "model.operationLog.length" + ' = ' + JSON.stringify(model.operationLog.length));
      expect(model.operationLog.length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapModel0001',
        '#5 ' + "model.operationCount" + ' = ' + JSON.stringify(model.operationCount));
      expect(model.operationCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapModel0001',
        '#6 ' + "model.retryCount" + ' = ' + JSON.stringify(model.retryCount));
      expect(model.retryCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapModel0001',
        '#7 ' + "model.errorMessage" + ' = ' + JSON.stringify(model.errorMessage));
      expect(model.errorMessage).assertEqual('');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapModel0001',
        '#8 ' + "model.errorCode" + ' = ' + JSON.stringify(model.errorCode));
      expect(model.errorCode).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapModel0001',
        '#9 ' + "model.connectionDuration" + ' = ' + JSON.stringify(model.connectionDuration));
      expect(model.connectionDuration).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapModel0001',
        '#10 ' + "model.connectionStartTime" + ' = ' + JSON.stringify(model.connectionStartTime));
      expect(model.connectionStartTime).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapModel0001',
        '#11 ' + "model.contacts.length" + ' = ' + JSON.stringify(model.contacts.length));
      expect(model.contacts.length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapModel0001',
        '#12 ' + "model.isSyncing" + ' = ' + JSON.stringify(model.isSyncing));
      expect(model.isSyncing).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapModel0001',
        '#13 ' + "model.lastSyncTime" + ' = ' + JSON.stringify(model.lastSyncTime));
      expect(model.lastSyncTime).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapModel0001',
        '#14 ' + "model.phonebookType" + ' = ' + JSON.stringify(model.phonebookType));
      expect(model.phonebookType).assertEqual(DEFAULT_PHONEBOOK_TYPE);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapModel0001',
        '#15 ' + "model.searchKeyword" + ' = ' + JSON.stringify(model.searchKeyword));
      expect(model.searchKeyword).assertEqual('');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapModel0001',
        '#16 ' + "model.sortOrder" + ' = ' + JSON.stringify(model.sortOrder));
      expect(model.sortOrder).assertEqual(DEFAULT_SORT_ORDER);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapModel0001',
        '#17 ' + "model.syncProgress" + ' = ' + JSON.stringify(model.syncProgress));
      expect(model.syncProgress).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapModel0001',
        '#18 ' + "model.syncedContacts" + ' = ' + JSON.stringify(model.syncedContacts));
      expect(model.syncedContacts).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapModel0001',
        '#19 ' + "model.totalContacts" + ' = ' + JSON.stringify(model.totalContacts));
      expect(model.totalContacts).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapModel0001',
        '#20 ' + "model.maxRetries" + ' = ' + JSON.stringify(model.maxRetries));
      expect(model.maxRetries).assertEqual(3);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapModel0001',
        '#21 ' + "model.timeoutMs" + ' = ' + JSON.stringify(model.timeoutMs));
      expect(model.timeoutMs).assertEqual(10000);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapModel0001',
        '#22 ' + "model.isInitialized" + ' = ' + JSON.stringify(model.isInitialized));
      expect(model.isInitialized).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapModel0001',
        '#23 ' + "model.lastUpdateTime >= before && model.lastUpdateTime <= after" + ' = ' +
        JSON.stringify(model.lastUpdateTime >= before && model.lastUpdateTime <= after));
      expect(model.lastUpdateTime >= before && model.lastUpdateTime <= after).assertTrue();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPbapModel0001', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPbapModel0002', 'begin');
      const model: PbapModel = new PbapModel(DEVICE_ID);
      const sibling: PbapModel = new PbapModel(SIBLING_ID);

      model.totalContacts = 250;
      model.syncedContacts = 120;
      model.searchKeyword = 'ali';
      model.markConnecting();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapModel0002',
        '#1 ' + "model.deviceId" + ' = ' + JSON.stringify(model.deviceId));
      expect(model.deviceId).assertEqual(DEVICE_ID);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapModel0002',
        '#2 ' + "model.state" + ' = ' + JSON.stringify(model.state));
      expect(model.state).assertEqual(PbapState.CONNECTING);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapModel0002',
        '#3 ' + "model.operationCount" + ' = ' + JSON.stringify(model.operationCount));
      expect(model.operationCount).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapModel0002',
        '#4 ' + "sibling.deviceId" + ' = ' + JSON.stringify(sibling.deviceId));
      expect(sibling.deviceId).assertEqual(SIBLING_ID);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapModel0002',
        '#5 ' + "sibling.state" + ' = ' + JSON.stringify(sibling.state));
      expect(sibling.state).assertEqual(PbapState.DISCONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapModel0002',
        '#6 ' + "sibling.totalContacts" + ' = ' + JSON.stringify(sibling.totalContacts));
      expect(sibling.totalContacts).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapModel0002',
        '#7 ' + "sibling.syncedContacts" + ' = ' + JSON.stringify(sibling.syncedContacts));
      expect(sibling.syncedContacts).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapModel0002',
        '#8 ' + "sibling.searchKeyword" + ' = ' + JSON.stringify(sibling.searchKeyword));
      expect(sibling.searchKeyword).assertEqual('');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapModel0002',
        '#9 ' + "sibling.phonebookType" + ' = ' + JSON.stringify(sibling.phonebookType));
      expect(sibling.phonebookType).assertEqual(DEFAULT_PHONEBOOK_TYPE);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapModel0002',
        '#10 assert ' + "expect(sibling.getLogs().length).assertEqual(0)");
      expect(sibling.getLogs().length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapModel0002',
        '#11 assert ' +
        "expect(model.toString().indexOf('PbapModel[deviceId=' + DEVICE_ID + ', state=connecting')).assertEqual(0)");
      expect(model.toString().indexOf('PbapModel[deviceId=' + DEVICE_ID + ', state=connecting')).assertEqual(0);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPbapModel0002', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPbapModel0003', 'begin');
      const model: PbapModel = new PbapModel(DEVICE_ID);
      const created: number = model.lastUpdateTime;

      model.markConnecting();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapModel0003',
        '#1 ' + "model.state" + ' = ' + JSON.stringify(model.state));
      expect(model.state).assertEqual(PbapState.CONNECTING);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapModel0003',
        '#2 assert ' + "expect(model.isConnecting()).assertTrue()");
      expect(model.isConnecting()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapModel0003',
        '#3 assert ' + "expect(model.isConnected()).assertFalse()");
      expect(model.isConnected()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapModel0003',
        '#4 ' + "model.connectionStartTime > 0" + ' = ' + JSON.stringify(model.connectionStartTime > 0));
      expect(model.connectionStartTime > 0).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapModel0003',
        '#5 ' + "model.connectionStartTime >= created" + ' = ' + JSON.stringify(model.connectionStartTime >= created));
      expect(model.connectionStartTime >= created).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapModel0003',
        '#6 ' + "model.operationCount" + ' = ' + JSON.stringify(model.operationCount));
      expect(model.operationCount).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapModel0003',
        '#7 assert ' + "expect(model.getLogs().length).assertEqual(1)");
      expect(model.getLogs().length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapModel0003',
        '#8 assert ' + "expect(lastLog(model)).assertEqual('Connecting to device')");
      expect(lastLog(model)).assertEqual('Connecting to device');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapModel0003',
        '#9 ' + "model.retryCount" + ' = ' + JSON.stringify(model.retryCount));
      expect(model.retryCount).assertEqual(0);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPbapModel0003', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPbapModel0004', 'begin');
      const model: PbapModel = new PbapModel(DEVICE_ID);
      model.markConnecting();
      model.markError('OBEX pull failed', 35200003);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapModel0004',
        '#1 ' + "model.retryCount" + ' = ' + JSON.stringify(model.retryCount));
      expect(model.retryCount).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapModel0004',
        '#2 ' + "model.errorCode" + ' = ' + JSON.stringify(model.errorCode));
      expect(model.errorCode).assertEqual(35200003);

      model.markConnected();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapModel0004',
        '#3 ' + "model.state" + ' = ' + JSON.stringify(model.state));
      expect(model.state).assertEqual(PbapState.CONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapModel0004',
        '#4 assert ' + "expect(model.isConnected()).assertTrue()");
      expect(model.isConnected()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapModel0004',
        '#5 assert ' + "expect(model.isConnecting()).assertFalse()");
      expect(model.isConnecting()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapModel0004',
        '#6 ' + "model.retryCount" + ' = ' + JSON.stringify(model.retryCount));
      expect(model.retryCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapModel0004',
        '#7 ' + "model.errorMessage" + ' = ' + JSON.stringify(model.errorMessage));
      expect(model.errorMessage).assertEqual('');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapModel0004',
        '#8 ' + "model.errorCode" + ' = ' + JSON.stringify(model.errorCode));
      expect(model.errorCode).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapModel0004',
        '#9 assert ' + "expect(model.getConnectionDuration() >= model.connectionDuration).assertTrue()");
      expect(model.getConnectionDuration() >= model.connectionDuration).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapModel0004',
        '#10 assert ' + "expect(model.getLogs().length).assertEqual(3)");
      expect(model.getLogs().length).assertEqual(3);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapModel0004',
        '#11 assert ' + "expect(lastLog(model)).assertEqual('Connected to device')");
      expect(lastLog(model)).assertEqual('Connected to device');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapModel0004',
        '#12 ' + "model.operationCount" + ' = ' + JSON.stringify(model.operationCount));
      expect(model.operationCount).assertEqual(3);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPbapModel0004', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPbapModel0005', 'begin');
      const model: PbapModel = new PbapModel(DEVICE_ID);
      model.markConnecting();
      model.markConnected();

      model.markDisconnecting();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapModel0005',
        '#1 ' + "model.state" + ' = ' + JSON.stringify(model.state));
      expect(model.state).assertEqual(PbapState.DISCONNECTING);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapModel0005',
        '#2 assert ' + "expect(model.isConnected()).assertFalse()");
      expect(model.isConnected()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapModel0005',
        '#3 assert ' + "expect(model.isConnecting()).assertFalse()");
      expect(model.isConnecting()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapModel0005',
        '#4 assert ' + "expect(lastLog(model)).assertEqual('Disconnecting from device')");
      expect(lastLog(model)).assertEqual('Disconnecting from device');

      model.markDisconnected();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapModel0005',
        '#5 ' + "model.state" + ' = ' + JSON.stringify(model.state));
      expect(model.state).assertEqual(PbapState.DISCONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapModel0005',
        '#6 ' + "model.connectionDuration" + ' = ' + JSON.stringify(model.connectionDuration));
      expect(model.connectionDuration).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapModel0005',
        '#7 assert ' + "expect(model.getConnectionDuration()).assertEqual(0)");
      expect(model.getConnectionDuration()).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapModel0005',
        '#8 assert ' + "expect(model.getLogs().length).assertEqual(4)");
      expect(model.getLogs().length).assertEqual(4);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapModel0005',
        '#9 assert ' + "expect(lastLog(model)).assertEqual('Disconnected from device')");
      expect(lastLog(model)).assertEqual('Disconnected from device');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapModel0005',
        '#10 ' + "model.operationCount" + ' = ' + JSON.stringify(model.operationCount));
      expect(model.operationCount).assertEqual(4);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPbapModel0005', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPbapModel0006', 'begin');
      const model: PbapModel = new PbapModel(DEVICE_ID);

      model.markError('access denied by user', 35200009);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapModel0006',
        '#1 ' + "model.state" + ' = ' + JSON.stringify(model.state));
      expect(model.state).assertEqual(PbapState.ERROR);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapModel0006',
        '#2 ' + "model.errorMessage" + ' = ' + JSON.stringify(model.errorMessage));
      expect(model.errorMessage).assertEqual('access denied by user');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapModel0006',
        '#3 ' + "model.errorCode" + ' = ' + JSON.stringify(model.errorCode));
      expect(model.errorCode).assertEqual(35200009);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapModel0006',
        '#4 ' + "model.retryCount" + ' = ' + JSON.stringify(model.retryCount));
      expect(model.retryCount).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapModel0006',
        '#5 assert ' + "expect(model.canRetry()).assertTrue()");
      expect(model.canRetry()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapModel0006',
        '#6 assert ' + "expect(lastLog(model)).assertEqual('Error: access denied by user')");
      expect(lastLog(model)).assertEqual('Error: access denied by user');

      model.markError('access denied by user', 35200009);
      model.markError('access denied by user', 35200009);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapModel0006',
        '#7 ' + "model.retryCount" + ' = ' + JSON.stringify(model.retryCount));
      expect(model.retryCount).assertEqual(3);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapModel0006',
        '#8 ' + "model.retryCount" + ' = ' + JSON.stringify(model.retryCount));
      expect(model.retryCount).assertEqual(model.maxRetries);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapModel0006',
        '#9 assert ' + "expect(model.canRetry()).assertFalse()");
      expect(model.canRetry()).assertFalse();

      model.markError('access denied by user', 35200009);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapModel0006',
        '#10 ' + "model.retryCount" + ' = ' + JSON.stringify(model.retryCount));
      expect(model.retryCount).assertEqual(4);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapModel0006',
        '#11 assert ' + "expect(model.canRetry()).assertFalse()");
      expect(model.canRetry()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapModel0006',
        '#12 assert ' + "expect(model.getLogs().length).assertEqual(4)");
      expect(model.getLogs().length).assertEqual(4);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapModel0006',
        '#13 ' + "model.operationCount" + ' = ' + JSON.stringify(model.operationCount));
      expect(model.operationCount).assertEqual(4);

      model.markConnected();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapModel0006',
        '#14 assert ' + "expect(model.canRetry()).assertTrue()");
      expect(model.canRetry()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapModel0006',
        '#15 ' + "model.retryCount" + ' = ' + JSON.stringify(model.retryCount));
      expect(model.retryCount).assertEqual(0);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPbapModel0006', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPbapModel0007', 'begin');
      const model: PbapModel = new PbapModel(DEVICE_ID);
      model.addLog('first entry');
      model.addLog('second entry');

      const logs = model.getLogs();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapModel0007',
        '#1 ' + "logs.length" + ' = ' + JSON.stringify(logs.length));
      expect(logs.length).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapModel0007',
        '#2 ' + "model.operationCount" + ' = ' + JSON.stringify(model.operationCount));
      expect(model.operationCount).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapModel0007',
        '#3 assert ' + "expect(logs[0].indexOf('[')).assertEqual(0)");
      expect(logs[0].indexOf('[')).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapModel0007',
        '#4 assert ' + "expect(logs[0].indexOf('first entry')).assertEqual(logs[0].length - 11)");
      expect(logs[0].indexOf('first entry')).assertEqual(logs[0].length - 11);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapModel0007',
        '#5 assert ' + "expect(logs[1].indexOf('T')).assertLarger(0)");
      expect(logs[1].indexOf('T')).assertLarger(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapModel0007',
        '#6 assert ' + "expect(logs[1].indexOf('Z] ')).assertLarger(0)");
      expect(logs[1].indexOf('Z] ')).assertLarger(0);

      logs.push('injected');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapModel0007',
        '#7 ' + "logs.length" + ' = ' + JSON.stringify(logs.length));
      expect(logs.length).assertEqual(3);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapModel0007',
        '#8 assert ' + "expect(model.getLogs().length).assertEqual(2)");
      expect(model.getLogs().length).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapModel0007',
        '#9 ' + "model.state" + ' = ' + JSON.stringify(model.state));
      expect(model.state).assertEqual(PbapState.DISCONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapModel0007',
        '#10 ' + "model.sortOrder" + ' = ' + JSON.stringify(model.sortOrder));
      expect(model.sortOrder).assertEqual(DEFAULT_SORT_ORDER);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPbapModel0007', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPbapModel0008', 'begin');
      const model: PbapModel = new PbapModel(DEVICE_ID);
      for (let i = 0; i < MAX_LOG + 5; i++) {
        model.addLog('log-' + i);
      }

      const logs = model.getLogs();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapModel0008',
        '#1 ' + "logs.length" + ' = ' + JSON.stringify(logs.length));
      expect(logs.length).assertEqual(MAX_LOG);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapModel0008',
        '#2 ' + "model.operationLog.length" + ' = ' + JSON.stringify(model.operationLog.length));
      expect(model.operationLog.length).assertEqual(MAX_LOG);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapModel0008',
        '#3 ' + "model.operationCount" + ' = ' + JSON.stringify(model.operationCount));
      expect(model.operationCount).assertEqual(MAX_LOG + 5);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapModel0008',
        '#4 assert ' + "expect(lastLog(model)).assertEqual('log-204')");
      expect(lastLog(model)).assertEqual('log-204');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapModel0008',
        '#5 assert ' + "expect(logs[0].indexOf('log-5')).assertLarger(0)");
      expect(logs[0].indexOf('log-5')).assertLarger(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapModel0008',
        '#6 assert ' + "expect(logs[0].indexOf('log-0 ')).assertEqual(-1)");
      expect(logs[0].indexOf('log-0 ')).assertEqual(-1);

      model.clearLogs();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapModel0008',
        '#7 assert ' + "expect(model.getLogs().length).assertEqual(0)");
      expect(model.getLogs().length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapModel0008',
        '#8 ' + "model.operationCount" + ' = ' + JSON.stringify(model.operationCount));
      expect(model.operationCount).assertEqual(MAX_LOG + 5);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapModel0008',
        '#9 ' + "model.state" + ' = ' + JSON.stringify(model.state));
      expect(model.state).assertEqual(PbapState.DISCONNECTED);

      model.addLog('gamma');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapModel0008',
        '#10 assert ' + "expect(model.getLogs().length).assertEqual(1)");
      expect(model.getLogs().length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapModel0008',
        '#11 ' + "model.operationCount" + ' = ' + JSON.stringify(model.operationCount));
      expect(model.operationCount).assertEqual(MAX_LOG + 6);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapModel0008',
        '#12 assert ' + "expect(lastLog(model)).assertEqual('gamma')");
      expect(lastLog(model)).assertEqual('gamma');
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPbapModel0008', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPbapModel0009', 'begin');
      const model: PbapModel = new PbapModel(DEVICE_ID);
      const created: number = model.lastUpdateTime;
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapModel0009',
        '#1 ' + "model.data" + ' = ' + JSON.stringify(model.data));
      expect(model.data).assertEqual(null);

      const payload: PbapDataPayload = buildPayload(80, 'local', 'bob');
      model.updateData(payload);

      const stored: PbapData | null = model.data;
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapModel0009',
        '#2 ' + "model.data !== null" + ' = ' + JSON.stringify(model.data !== null));
      expect(model.data !== null).assertTrue();
      if (stored !== null) {
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testPbapModel0009',
          '#3 ' + "stored.totalContacts" + ' = ' + JSON.stringify(stored.totalContacts));
        expect(stored.totalContacts).assertEqual(80);
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testPbapModel0009',
          '#4 ' + "stored.syncedContacts" + ' = ' + JSON.stringify(stored.syncedContacts));
        expect(stored.syncedContacts).assertEqual(12);
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testPbapModel0009',
          '#5 ' + "stored.syncProgress" + ' = ' + JSON.stringify(stored.syncProgress));
        expect(stored.syncProgress).assertEqual(60);
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testPbapModel0009',
          '#6 ' + "stored.isSyncing" + ' = ' + JSON.stringify(stored.isSyncing));
        expect(stored.isSyncing).assertTrue();
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testPbapModel0009',
          '#7 ' + "stored.lastSyncTime" + ' = ' + JSON.stringify(stored.lastSyncTime));
        expect(stored.lastSyncTime).assertEqual(1700000000000);
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testPbapModel0009',
          '#8 ' + "stored.phonebookType" + ' = ' + JSON.stringify(stored.phonebookType));
        expect(stored.phonebookType).assertEqual('local');
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testPbapModel0009',
          '#9 ' + "stored.sortOrder" + ' = ' + JSON.stringify(stored.sortOrder));
        expect(stored.sortOrder).assertEqual(DEFAULT_SORT_ORDER);
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testPbapModel0009',
          '#10 ' + "stored.searchKeyword" + ' = ' + JSON.stringify(stored.searchKeyword));
        expect(stored.searchKeyword).assertEqual('bob');
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testPbapModel0009',
          '#11 ' + "stored.contacts.length" + ' = ' + JSON.stringify(stored.contacts.length));
        expect(stored.contacts.length).assertEqual(2);
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testPbapModel0009',
          '#12 ' + "stored.contacts[0].name" + ' = ' + JSON.stringify(stored.contacts[0].name));
        expect(stored.contacts[0].name).assertEqual('Alice');
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testPbapModel0009',
          '#13 ' + "stored.contacts[1].number" + ' = ' + JSON.stringify(stored.contacts[1].number));
        expect(stored.contacts[1].number).assertEqual('13800000002');
      }
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapModel0009',
        '#14 assert ' + "expect(model.getLogs().length).assertEqual(0)");
      expect(model.getLogs().length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapModel0009',
        '#15 ' + "model.operationCount" + ' = ' + JSON.stringify(model.operationCount));
      expect(model.operationCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapModel0009',
        '#16 ' + "model.state" + ' = ' + JSON.stringify(model.state));
      expect(model.state).assertEqual(PbapState.DISCONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapModel0009',
        '#17 ' + "model.lastUpdateTime >= created" + ' = ' + JSON.stringify(model.lastUpdateTime >= created));
      expect(model.lastUpdateTime >= created).assertTrue();

      payload.totalContacts = 95;
      if (stored !== null) {
        hilog.info(0xF811,
          '[Sample_BluetoothBaseProfile] testPbapModel0009',
          '#18 ' + "stored.totalContacts" + ' = ' + JSON.stringify(stored.totalContacts));
        expect(stored.totalContacts).assertEqual(95);
      }
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapModel0009',
        '#19 ' + "model.contacts.length" + ' = ' + JSON.stringify(model.contacts.length));
      expect(model.contacts.length).assertEqual(0);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPbapModel0009', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPbapModel0010', 'begin');
      const model: PbapModel = new PbapModel(DEVICE_ID);
      model.markConnecting();
      const before: number = model.lastUpdateTime;

      model.updateConnectionState(BluetoothConnectionState.CONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapModel0010',
        '#1 ' + "model.state" + ' = ' + JSON.stringify(model.state));
      expect(model.state).assertEqual(PbapState.CONNECTING);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapModel0010',
        '#2 assert ' + "expect(model.isConnected()).assertFalse()");
      expect(model.isConnected()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapModel0010',
        '#3 assert ' + "expect(model.getLogs().length).assertEqual(1)");
      expect(model.getLogs().length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapModel0010',
        '#4 ' + "model.operationCount" + ' = ' + JSON.stringify(model.operationCount));
      expect(model.operationCount).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapModel0010',
        '#5 ' + "model.lastUpdateTime >= before" + ' = ' + JSON.stringify(model.lastUpdateTime >= before));
      expect(model.lastUpdateTime >= before).assertTrue();

      model.updateConnectionState(BluetoothConnectionState.DISCONNECTED);
      model.updateConnectionState(BluetoothConnectionState.DISCONNECTING);
      model.updateConnectionState(BluetoothConnectionState.CONNECTION_FAILED);
      model.updateConnectionState(BluetoothConnectionState.CONNECTION_TIMEOUT);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapModel0010',
        '#6 ' + "model.state" + ' = ' + JSON.stringify(model.state));
      expect(model.state).assertEqual(PbapState.CONNECTING);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapModel0010',
        '#7 assert ' + "expect(model.isConnecting()).assertTrue()");
      expect(model.isConnecting()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapModel0010',
        '#8 assert ' + "expect(model.getLogs().length).assertEqual(1)");
      expect(model.getLogs().length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapModel0010',
        '#9 ' + "model.operationCount" + ' = ' + JSON.stringify(model.operationCount));
      expect(model.operationCount).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapModel0010',
        '#10 ' + "model.errorMessage" + ' = ' + JSON.stringify(model.errorMessage));
      expect(model.errorMessage).assertEqual('');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapModel0010',
        '#11 ' + "model.errorCode" + ' = ' + JSON.stringify(model.errorCode));
      expect(model.errorCode).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapModel0010',
        '#12 ' + "model.connectionDuration" + ' = ' + JSON.stringify(model.connectionDuration));
      expect(model.connectionDuration).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapModel0010',
        '#13 ' + "model.data" + ' = ' + JSON.stringify(model.data));
      expect(model.data).assertEqual(null);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPbapModel0010', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPbapModel0011', 'begin');
      const model: PbapModel = new PbapModel(DEVICE_ID);
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
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapModel0011',
        '#1 assert ' + "expect(model.getLogs().length).assertEqual(3)");
      expect(model.getLogs().length).assertEqual(3);

      model.reset();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapModel0011',
        '#2 ' + "model.state" + ' = ' + JSON.stringify(model.state));
      expect(model.state).assertEqual(PbapState.DISCONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapModel0011',
        '#3 ' + "model.data" + ' = ' + JSON.stringify(model.data));
      expect(model.data).assertEqual(null);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapModel0011',
        '#4 assert ' + "expect(model.getLogs().length).assertEqual(0)");
      expect(model.getLogs().length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapModel0011',
        '#5 ' + "model.operationCount" + ' = ' + JSON.stringify(model.operationCount));
      expect(model.operationCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapModel0011',
        '#6 ' + "model.retryCount" + ' = ' + JSON.stringify(model.retryCount));
      expect(model.retryCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapModel0011',
        '#7 ' + "model.errorMessage" + ' = ' + JSON.stringify(model.errorMessage));
      expect(model.errorMessage).assertEqual('');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapModel0011',
        '#8 ' + "model.errorCode" + ' = ' + JSON.stringify(model.errorCode));
      expect(model.errorCode).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapModel0011',
        '#9 ' + "model.connectionDuration" + ' = ' + JSON.stringify(model.connectionDuration));
      expect(model.connectionDuration).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapModel0011',
        '#10 ' + "model.connectionStartTime" + ' = ' + JSON.stringify(model.connectionStartTime));
      expect(model.connectionStartTime).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapModel0011',
        '#11 assert ' + "expect(model.isConnected()).assertFalse()");
      expect(model.isConnected()).assertFalse();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapModel0011',
        '#12 ' + "model.totalContacts" + ' = ' + JSON.stringify(model.totalContacts));
      expect(model.totalContacts).assertEqual(40);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapModel0011',
        '#13 ' + "model.syncedContacts" + ' = ' + JSON.stringify(model.syncedContacts));
      expect(model.syncedContacts).assertEqual(17);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapModel0011',
        '#14 ' + "model.phonebookType" + ' = ' + JSON.stringify(model.phonebookType));
      expect(model.phonebookType).assertEqual(DEFAULT_PHONEBOOK_TYPE);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapModel0011',
        '#15 ' + "model.searchKeyword" + ' = ' + JSON.stringify(model.searchKeyword));
      expect(model.searchKeyword).assertEqual('car');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapModel0011',
        '#16 ' + "model.contacts.length" + ' = ' + JSON.stringify(model.contacts.length));
      expect(model.contacts.length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapModel0011',
        '#17 ' + "model.deviceId" + ' = ' + JSON.stringify(model.deviceId));
      expect(model.deviceId).assertEqual(DEVICE_ID);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapModel0011',
        '#18 ' + "model.isInitialized" + ' = ' + JSON.stringify(model.isInitialized));
      expect(model.isInitialized).assertTrue();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPbapModel0011', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPbapModel0012', 'begin');
      const model: PbapModel = new PbapModel(DEVICE_ID);
      model.markConnecting();
      model.markError('folder not available', 35200005);
      model.totalContacts = 9;
      model.syncProgress = 33;

      const json: PbapModelJson = model.toJSON();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapModel0012',
        '#1 ' + "json.state" + ' = ' + JSON.stringify(json.state));
      expect(json.state).assertEqual(PbapState.ERROR);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapModel0012',
        '#2 ' + "json.deviceId" + ' = ' + JSON.stringify(json.deviceId));
      expect(json.deviceId).assertEqual(DEVICE_ID);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapModel0012',
        '#3 ' + "json.retryCount" + ' = ' + JSON.stringify(json.retryCount));
      expect(json.retryCount).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapModel0012',
        '#4 ' + "json.errorMessage" + ' = ' + JSON.stringify(json.errorMessage));
      expect(json.errorMessage).assertEqual('folder not available');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapModel0012',
        '#5 ' + "json.errorCode" + ' = ' + JSON.stringify(json.errorCode));
      expect(json.errorCode).assertEqual(35200005);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapModel0012',
        '#6 ' + "json.operationCount" + ' = ' + JSON.stringify(json.operationCount));
      expect(json.operationCount).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapModel0012',
        '#7 ' + "json.connectionDuration" + ' = ' + JSON.stringify(json.connectionDuration));
      expect(json.connectionDuration).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapModel0012',
        '#8 ' + "json.data" + ' = ' + JSON.stringify(json.data));
      expect(json.data).assertEqual(null);
      const serialized: string = JSON.stringify(model.toJSON());
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapModel0012',
        '#9 assert ' + "expect(serialized.indexOf('totalContacts')).assertEqual(-1)");
      expect(serialized.indexOf('totalContacts')).assertEqual(-1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapModel0012',
        '#10 assert ' + "expect(serialized.indexOf('syncProgress')).assertEqual(-1)");
      expect(serialized.indexOf('syncProgress')).assertEqual(-1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapModel0012',
        '#11 assert ' + "expect(serialized.indexOf('maxRetries')).assertEqual(-1)");
      expect(serialized.indexOf('maxRetries')).assertEqual(-1);

      const summary: string = model.toString();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapModel0012',
        '#12 assert ' + "expect(summary.indexOf('PbapModel[deviceId=' + DEVICE_ID)).assertEqual(0)");
      expect(summary.indexOf('PbapModel[deviceId=' + DEVICE_ID)).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapModel0012',
        '#13 assert ' + "expect(summary.indexOf('state=error')).assertLarger(0)");
      expect(summary.indexOf('state=error')).assertLarger(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapModel0012',
        '#14 assert ' + "expect(summary.indexOf('retryCount=1')).assertLarger(0)");
      expect(summary.indexOf('retryCount=1')).assertLarger(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapModel0012',
        '#15 assert ' + "expect(summary.indexOf('ops=2')).assertLarger(0)");
      expect(summary.indexOf('ops=2')).assertLarger(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testPbapModel0012',
        '#16 assert ' + "expect(summary.charAt(summary.length - 1)).assertEqual(']')");
      expect(summary.charAt(summary.length - 1)).assertEqual(']');
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testPbapModel0012', 'end');
    });
  });
}
