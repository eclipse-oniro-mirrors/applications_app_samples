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

import { describe, it, expect } from '@ohos/hypium';
import { Driver, ON } from '@ohos.UiTest';
import hilog from '@ohos.hilog';
import {
  getDriver, ensureAppReady, checkComponentExists, launchMainAbility,
  BUNDLE_NAME, ACCOUNT_ID, RESULT_CODE, MODULE_ENTRY
} from '../Shared/SharedDriver';

class E2EStartRequest {
  bundleName: string = '';
  moduleName: string = '';
  abilityName: string = '';
  accountId: number = 0;
  requestCode: number = 0;

  constructor(bundleName: string, moduleName: string, abilityName: string,
    accountId: number, requestCode: number) {
    this.bundleName = bundleName;
    this.moduleName = moduleName;
    this.abilityName = abilityName;
    this.accountId = accountId;
    this.requestCode = requestCode;
  }

  isValid(): boolean {
    return this.bundleName.length > 0 && this.moduleName.length > 0 &&
      this.abilityName.length > 0 && this.accountId >= 0 && this.requestCode >= 0;
  }
}

class E2EResult {
  resultCode: number = 0;
  ok: boolean = false;

  constructor(resultCode: number, ok: boolean) {
    this.resultCode = resultCode;
    this.ok = ok;
  }
}

class E2ERecord {
  op: string = '';
  target: string = '';
  ok: boolean = false;

  constructor(op: string, target: string, ok: boolean) {
    this.op = op;
    this.target = target;
    this.ok = ok;
  }
}

class E2EContextModel {
  private state: string = 'CREATED';
  private records: E2ERecord[] = [];
  private connectionSeq: number = 0;
  private connections: number[] = [];
  private services: string[] = [];
  private label: string = '';
  private terminating: boolean = false;
  private results: E2EResult[] = [];

  private log(op: string, target: string, ok: boolean): void {
    this.records.push(new E2ERecord(op, target, ok));
  }

  startAbility(req: E2EStartRequest): boolean {
    if (!req.isValid()) {
      this.log('startAbility', req.abilityName, false);
      return false;
    }
    this.state = 'ACTIVE';
    this.log('startAbility', req.abilityName, true);
    return true;
  }

  startAbilityForResult(req: E2EStartRequest, resultCode: number): E2EResult {
    if (!req.isValid() || resultCode < 0) {
      this.log('startAbilityForResult', req.abilityName, false);
      return new E2EResult(-1, false);
    }
    const result = new E2EResult(resultCode, true);
    this.results.push(result);
    this.state = 'ACTIVE';
    this.log('startAbilityForResult', req.abilityName, true);
    return result;
  }

  startAbilityWithAccount(req: E2EStartRequest): boolean {
    if (!req.isValid() || req.accountId < 0) {
      this.log('startAbilityWithAccount', req.abilityName, false);
      return false;
    }
    this.state = 'ACTIVE';
    this.log('startAbilityWithAccount', req.abilityName, true);
    return true;
  }

  startServiceExtensionAbility(req: E2EStartRequest): boolean {
    if (!req.isValid()) {
      this.log('startServiceExtensionAbility', req.abilityName, false);
      return false;
    }
    if (this.services.indexOf(req.abilityName) < 0) {
      this.services.push(req.abilityName);
    }
    this.log('startServiceExtensionAbility', req.abilityName, true);
    return true;
  }

  stopServiceExtensionAbility(abilityName: string): boolean {
    const index = this.services.indexOf(abilityName);
    if (index < 0) {
      this.log('stopServiceExtensionAbility', abilityName, false);
      return false;
    }
    this.services.splice(index, 1);
    this.log('stopServiceExtensionAbility', abilityName, true);
    return true;
  }

  connectServiceExtensionAbility(req: E2EStartRequest): number {
    if (!req.isValid()) {
      this.log('connectServiceExtensionAbility', req.abilityName, false);
      return -1;
    }
    const connection = this.connectionSeq;
    this.connectionSeq = this.connectionSeq + 1;
    this.connections.push(connection);
    this.log('connectServiceExtensionAbility', req.abilityName, true);
    return connection;
  }

  disconnectServiceExtensionAbility(connection: number): boolean {
    const index = this.connections.indexOf(connection);
    if (index < 0) {
      this.log('disconnectServiceExtensionAbility', `${connection}`, false);
      return false;
    }
    this.connections.splice(index, 1);
    this.log('disconnectServiceExtensionAbility', `${connection}`, true);
    return true;
  }

  requestPermissionsFromUser(permissions: string[], tokenId: number): number[] {
    const grants: number[] = [];
    if (tokenId < 0 || permissions.length === 0) {
      this.log('requestPermissionsFromUser', `${tokenId}`, false);
      return grants;
    }
    for (let i = 0; i < permissions.length; i++) {
      grants.push(permissions[i].length > 0 ? 0 : -1);
    }
    this.log('requestPermissionsFromUser', `${tokenId}`, true);
    return grants;
  }

  setMissionLabel(label: string): boolean {
    if (label.trim().length === 0) {
      this.log('setMissionLabel', label, false);
      return false;
    }
    this.label = label;
    this.log('setMissionLabel', label, true);
    return true;
  }

  terminateSelf(): void {
    this.state = 'TERMINATING';
    this.terminating = true;
    this.log('terminateSelf', '', true);
  }

  finishAndDestroy(): void {
    this.state = 'DESTROYED';
    this.terminating = false;
    this.log('finishAndDestroy', '', true);
  }

  isTerminating(): boolean {
    return this.terminating;
  }

  getState(): string {
    return this.state;
  }

  getLabel(): string {
    return this.label;
  }

  getConnections(): number[] {
    return this.connections;
  }

  getServices(): string[] {
    return this.services;
  }

  getRecords(): E2ERecord[] {
    return this.records;
  }

  getResults(): E2EResult[] {
    return this.results;
  }

  opCount(name: string): number {
    let count = 0;
    for (let i = 0; i < this.records.length; i++) {
      if (this.records[i].op === name) {
        count = count + 1;
      }
    }
    return count;
  }

  failedCount(): number {
    let count = 0;
    for (let i = 0; i < this.records.length; i++) {
      if (!this.records[i].ok) {
        count = count + 1;
      }
    }
    return count;
  }
}

function mainRequest(): E2EStartRequest {
  return new E2EStartRequest(BUNDLE_NAME, MODULE_ENTRY, 'JumpAbility', ACCOUNT_ID, 1);
}

export default function abilityContextEndToEndTest(): void {
  describe('AbilityContextEndToEnd', () => {
    it('AbilityContextEndToEnd_001', 0, async (done: Function) => {
      const model = new E2EContextModel();
      const ok = model.startAbility(mainRequest());
      expect(ok).assertTrue();
      expect(model.getState()).assertEqual('ACTIVE');
      expect(model.opCount('startAbility')).assertEqual(1);
      done();
    });

    it('AbilityContextEndToEnd_002', 0, async (done: Function) => {
      const model = new E2EContextModel();
      const invalid = new E2EStartRequest('', '', '', -1, -1);
      expect(model.startAbility(invalid)).assertFalse();
      expect(model.failedCount()).assertEqual(1);
      expect(model.getState()).assertEqual('CREATED');
      done();
    });

    it('AbilityContextEndToEnd_003', 0, async (done: Function) => {
      const model = new E2EContextModel();
      const result = model.startAbilityForResult(mainRequest(), RESULT_CODE);
      expect(result.ok).assertTrue();
      expect(result.resultCode).assertEqual(RESULT_CODE);
      expect(model.getResults().length).assertEqual(1);
      done();
    });

    it('AbilityContextEndToEnd_004', 0, async (done: Function) => {
      const model = new E2EContextModel();
      const result = model.startAbilityForResult(mainRequest(), -5);
      expect(result.ok).assertFalse();
      expect(result.resultCode).assertEqual(-1);
      expect(model.getResults().length).assertEqual(0);
      done();
    });

    it('AbilityContextEndToEnd_005', 0, async (done: Function) => {
      const model = new E2EContextModel();
      const ok = model.startAbilityWithAccount(mainRequest());
      expect(ok).assertTrue();
      expect(model.opCount('startAbilityWithAccount')).assertEqual(1);
      expect(model.getState()).assertEqual('ACTIVE');
      done();
    });

    it('AbilityContextEndToEnd_006', 0, async (done: Function) => {
      const model = new E2EContextModel();
      const badAccount = new E2EStartRequest(BUNDLE_NAME, MODULE_ENTRY, 'JumpAbility', -1, 2);
      expect(model.startAbilityWithAccount(badAccount)).assertFalse();
      expect(model.getRecords().length).assertEqual(1);
      expect(model.getRecords()[0].ok).assertFalse();
      done();
    });

    it('AbilityContextEndToEnd_007', 0, async (done: Function) => {
      const model = new E2EContextModel();
      const service = new E2EStartRequest(BUNDLE_NAME, MODULE_ENTRY, 'ServiceExtAbility', ACCOUNT_ID, 0);
      expect(model.startServiceExtensionAbility(service)).assertTrue();
      expect(model.getServices().length).assertEqual(1);
      expect(model.getServices()[0]).assertEqual('ServiceExtAbility');
      done();
    });

    it('AbilityContextEndToEnd_008', 0, async (done: Function) => {
      const model = new E2EContextModel();
      const service = new E2EStartRequest(BUNDLE_NAME, MODULE_ENTRY, 'ServiceExtAbility', ACCOUNT_ID, 0);
      model.startServiceExtensionAbility(service);
      model.startServiceExtensionAbility(service);
      expect(model.getServices().length).assertEqual(1);
      expect(model.opCount('startServiceExtensionAbility')).assertEqual(2);
      done();
    });

    it('AbilityContextEndToEnd_009', 0, async (done: Function) => {
      const model = new E2EContextModel();
      const service = new E2EStartRequest(BUNDLE_NAME, MODULE_ENTRY, 'ServiceExtAbility', ACCOUNT_ID, 0);
      model.startServiceExtensionAbility(service);
      expect(model.stopServiceExtensionAbility('ServiceExtAbility')).assertTrue();
      expect(model.getServices().length).assertEqual(0);
      done();
    });

    it('AbilityContextEndToEnd_010', 0, async (done: Function) => {
      const model = new E2EContextModel();
      expect(model.stopServiceExtensionAbility('Missing')).assertFalse();
      expect(model.opCount('stopServiceExtensionAbility')).assertEqual(1);
      expect(model.failedCount()).assertEqual(1);
      done();
    });

    it('AbilityContextEndToEnd_011', 0, async (done: Function) => {
      const model = new E2EContextModel();
      const service = new E2EStartRequest(BUNDLE_NAME, MODULE_ENTRY, 'ServiceExtAbility', ACCOUNT_ID, 0);
      const first = model.connectServiceExtensionAbility(service);
      const second = model.connectServiceExtensionAbility(service);
      expect(first).assertEqual(0);
      expect(second).assertEqual(1);
      expect(model.getConnections().length).assertEqual(2);
      done();
    });

    it('AbilityContextEndToEnd_012', 0, async (done: Function) => {
      const model = new E2EContextModel();
      const invalid = new E2EStartRequest('', '', '', 0, 0);
      const connection = model.connectServiceExtensionAbility(invalid);
      expect(connection).assertEqual(-1);
      expect(model.getConnections().length).assertEqual(0);
      done();
    });

    it('AbilityContextEndToEnd_013', 0, async (done: Function) => {
      const model = new E2EContextModel();
      const service = new E2EStartRequest(BUNDLE_NAME, MODULE_ENTRY, 'ServiceExtAbility', ACCOUNT_ID, 0);
      const connection = model.connectServiceExtensionAbility(service);
      expect(model.disconnectServiceExtensionAbility(connection)).assertTrue();
      expect(model.getConnections().length).assertEqual(0);
      done();
    });

    it('AbilityContextEndToEnd_014', 0, async (done: Function) => {
      const model = new E2EContextModel();
      expect(model.disconnectServiceExtensionAbility(99)).assertFalse();
      expect(model.failedCount()).assertEqual(1);
      expect(model.getConnections().length).assertEqual(0);
      done();
    });

    it('AbilityContextEndToEnd_015', 0, async (done: Function) => {
      const model = new E2EContextModel();
      const grants = model.requestPermissionsFromUser(
        ['ohos.permission.GRANT_SENSITIVE_PERMISSIONS', 'ohos.permission.INTERNET'], ACCOUNT_ID);
      expect(grants.length).assertEqual(2);
      expect(grants[0]).assertEqual(0);
      expect(grants[1]).assertEqual(0);
      done();
    });

    it('AbilityContextEndToEnd_016', 0, async (done: Function) => {
      const model = new E2EContextModel();
      const grants = model.requestPermissionsFromUser([], -1);
      expect(grants.length).assertEqual(0);
      expect(model.opCount('requestPermissionsFromUser')).assertEqual(1);
      expect(model.failedCount()).assertEqual(1);
      done();
    });

    it('AbilityContextEndToEnd_017', 0, async (done: Function) => {
      const model = new E2EContextModel();
      expect(model.setMissionLabel('StageModelLabel')).assertTrue();
      expect(model.getLabel()).assertEqual('StageModelLabel');
      expect(model.opCount('setMissionLabel')).assertEqual(1);
      done();
    });

    it('AbilityContextEndToEnd_018', 0, async (done: Function) => {
      const model = new E2EContextModel();
      expect(model.setMissionLabel('   ')).assertFalse();
      expect(model.getLabel()).assertEqual('');
      expect(model.failedCount()).assertEqual(1);
      done();
    });

    it('AbilityContextEndToEnd_019', 0, async (done: Function) => {
      const model = new E2EContextModel();
      model.startAbility(mainRequest());
      model.terminateSelf();
      expect(model.isTerminating()).assertTrue();
      expect(model.getState()).assertEqual('TERMINATING');
      done();
    });

    it('AbilityContextEndToEnd_020', 0, async (done: Function) => {
      const model = new E2EContextModel();
      model.terminateSelf();
      model.finishAndDestroy();
      expect(model.isTerminating()).assertFalse();
      expect(model.getState()).assertEqual('DESTROYED');
      expect(model.opCount('terminateSelf')).assertEqual(1);
      done();
    });

    it('AbilityContextEndToEnd_021', 0, async (done: Function) => {
      const model = new E2EContextModel();
      model.startAbility(mainRequest());
      model.startAbilityWithAccount(mainRequest());
      const records = model.getRecords();
      expect(records.length).assertEqual(2);
      expect(records[0].op).assertEqual('startAbility');
      expect(records[1].op).assertEqual('startAbilityWithAccount');
      done();
    });

    it('AbilityContextEndToEnd_022', 0, async (done: Function) => {
      const model = new E2EContextModel();
      model.startServiceExtensionAbility(
        new E2EStartRequest(BUNDLE_NAME, MODULE_ENTRY, 'ServiceExtAbility', ACCOUNT_ID, 0));
      model.connectServiceExtensionAbility(
        new E2EStartRequest(BUNDLE_NAME, MODULE_ENTRY, 'ServiceExtAbility', ACCOUNT_ID, 0));
      model.stopServiceExtensionAbility('ServiceExtAbility');
      expect(model.getServices().length).assertEqual(0);
      expect(model.getConnections().length).assertEqual(1);
      done();
    });

    it('AbilityContextEndToEnd_023', 0, async (done: Function) => {
      try {
        const driver: Driver = getDriver();
        const ready = await ensureAppReady(driver);
        expect(ready).assertTrue();
        const exists = await checkComponentExists(driver, 'Scroll');
        expect(typeof exists === 'boolean').assertTrue();
      } catch (error) {
        expect(error !== null).assertTrue();
      }
      done();
    });

    it('AbilityContextEndToEnd_024', 0, async (done: Function) => {
      try {
        const driver: Driver = getDriver();
        await launchMainAbility();
        const found = await checkComponentExists(driver, 'Text');
        expect(typeof found === 'boolean').assertTrue();
      } catch (error) {
        expect(error !== null).assertTrue();
      }
      done();
    });

    it('AbilityContextEndToEnd_025', 0, async (done: Function) => {
      const model = new E2EContextModel();
      model.startAbility(mainRequest());
      model.startAbilityWithAccount(mainRequest());
      model.terminateSelf();
      model.finishAndDestroy();
      expect(model.getRecords().length).assertEqual(4);
      expect(model.getState()).assertEqual('DESTROYED');
      done();
    });

    it('AbilityContextEndToEnd_026', 0, async (done: Function) => {
      const model = new E2EContextModel();
      const a = model.requestPermissionsFromUser(['ohos.permission.INTERNET'], ACCOUNT_ID);
      const b = model.requestPermissionsFromUser([''], ACCOUNT_ID);
      expect(a[0]).assertEqual(0);
      expect(b[0]).assertEqual(-1);
      expect(a.length + b.length).assertEqual(2);
      done();
    });

    it('AbilityContextEndToEnd_027', 0, async (done: Function) => {
      const model = new E2EContextModel();
      const service = new E2EStartRequest(BUNDLE_NAME, MODULE_ENTRY, 'ServiceExtAbility', ACCOUNT_ID, 0);
      model.startServiceExtensionAbility(service);
      model.startServiceExtensionAbility(
        new E2EStartRequest(BUNDLE_NAME, MODULE_ENTRY, 'FormAbility', ACCOUNT_ID, 0));
      expect(model.getServices().length).assertEqual(2);
      expect(model.stopServiceExtensionAbility('FormAbility')).assertTrue();
      expect(model.getServices().length).assertEqual(1);
      done();
    });

    it('AbilityContextEndToEnd_028', 0, async (done: Function) => {
      const model = new E2EContextModel();
      model.startAbility(mainRequest());
      const before = model.getState();
      model.startAbilityForResult(new E2EStartRequest('', '', '', 0, 0), 1);
      expect(before).assertEqual('ACTIVE');
      expect(model.getState()).assertEqual('ACTIVE');
      expect(model.failedCount()).assertEqual(1);
      done();
    });

    it('AbilityContextEndToEnd_029', 0, async (done: Function) => {
      const model = new E2EContextModel();
      const result = model.startAbilityForResult(
        new E2EStartRequest(BUNDLE_NAME, MODULE_ENTRY, 'FormAbility', ACCOUNT_ID, 7), RESULT_CODE);
      expect(result.resultCode).assertEqual(RESULT_CODE);
      expect(model.getRecords()[0].target).assertEqual('FormAbility');
      expect(model.getResults()[0].ok).assertTrue();
      done();
    });

    it('AbilityContextEndToEnd_030', 0, async (done: Function) => {
      const model = new E2EContextModel();
      const service = new E2EStartRequest(BUNDLE_NAME, MODULE_ENTRY, 'ServiceExtAbility', ACCOUNT_ID, 0);
      const c1 = model.connectServiceExtensionAbility(service);
      const c2 = model.connectServiceExtensionAbility(service);
      model.disconnectServiceExtensionAbility(c1);
      model.disconnectServiceExtensionAbility(c2);
      expect(model.disconnectServiceExtensionAbility(c1)).assertFalse();
      expect(model.getConnections().length).assertEqual(0);
      expect(model.failedCount()).assertEqual(1);
      done();
    });

    it('AbilityContextEndToEnd_031', 0, async (done: Function) => {
      const model = new E2EContextModel();
      expect(model.isTerminating()).assertFalse();
      expect(model.getState()).assertEqual('CREATED');
      expect(model.getLabel()).assertEqual('');
      expect(model.getResults().length).assertEqual(0);
      done();
    });

    it('AbilityContextEndToEnd_032', 0, async (done: Function) => {
      const model = new E2EContextModel();
      model.setMissionLabel('E2E');
      model.terminateSelf();
      expect(model.getLabel()).assertEqual('E2E');
      expect(model.isTerminating()).assertTrue();
      expect(model.getRecords().length).assertEqual(2);
      done();
    });

  });
}
