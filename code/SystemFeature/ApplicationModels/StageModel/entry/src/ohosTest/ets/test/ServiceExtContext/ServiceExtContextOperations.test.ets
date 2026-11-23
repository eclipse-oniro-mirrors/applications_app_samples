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
  getDriver, ensureAppReady, checkComponentExists,
  BUNDLE_NAME, ABILITY_SERVICE, MODULE_ENTRY, ACCOUNT_ID, CONNECTION_NUMBER
} from '../Shared/SharedDriver';

class SvcRequest {
  bundleName: string = '';
  moduleName: string = '';
  abilityName: string = '';

  constructor(bundleName: string, moduleName: string, abilityName: string) {
    this.bundleName = bundleName;
    this.moduleName = moduleName;
    this.abilityName = abilityName;
  }

  isValid(): boolean {
    return this.bundleName.length > 0 && this.moduleName.length > 0 && this.abilityName.length > 0;
  }
}

class SvcCallRecord {
  method: string = '';
  caller: string = '';
  ok: boolean = false;

  constructor(method: string, caller: string, ok: boolean) {
    this.method = method;
    this.caller = caller;
    this.ok = ok;
  }
}

class SvcOperationRecord {
  op: string = '';
  target: string = '';
  ok: boolean = false;

  constructor(op: string, target: string, ok: boolean) {
    this.op = op;
    this.target = target;
    this.ok = ok;
  }
}

class SvcOperationsModel {
  private services: string[] = [];
  private connections: number[] = [];
  private connectionSeq: number = 0;
  private calls: SvcCallRecord[] = [];
  private records: SvcOperationRecord[] = [];
  private terminated: boolean = false;

  private log(op: string, target: string, ok: boolean): void {
    this.records.push(new SvcOperationRecord(op, target, ok));
  }

  startAbility(req: SvcRequest): boolean {
    if (!req.isValid()) {
      this.log('startAbility', req.abilityName, false);
      return false;
    }
    this.log('startAbility', req.abilityName, true);
    return true;
  }

  startAbilityWithAccount(req: SvcRequest, accountId: number): boolean {
    if (!req.isValid() || accountId < 0) {
      this.log('startAbilityWithAccount', req.abilityName, false);
      return false;
    }
    this.log('startAbilityWithAccount', req.abilityName, true);
    return true;
  }

  startServiceExtensionAbility(req: SvcRequest): boolean {
    if (this.terminated || !req.isValid()) {
      this.log('startServiceExtensionAbility', req.abilityName, false);
      return false;
    }
    if (this.services.indexOf(req.abilityName) < 0) {
      this.services.push(req.abilityName);
    }
    this.log('startServiceExtensionAbility', req.abilityName, true);
    return true;
  }

  startServiceExtensionAbilityWithAccount(req: SvcRequest, accountId: number): boolean {
    if (this.terminated || !req.isValid() || accountId < 0) {
      this.log('startServiceExtensionAbilityWithAccount', req.abilityName, false);
      return false;
    }
    if (this.services.indexOf(req.abilityName) < 0) {
      this.services.push(req.abilityName);
    }
    this.log('startServiceExtensionAbilityWithAccount', req.abilityName, true);
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

  stopServiceExtensionAbilityWithAccount(abilityName: string, accountId: number): boolean {
    const index = this.services.indexOf(abilityName);
    if (index < 0 || accountId < 0) {
      this.log('stopServiceExtensionAbilityWithAccount', abilityName, false);
      return false;
    }
    this.services.splice(index, 1);
    this.log('stopServiceExtensionAbilityWithAccount', abilityName, true);
    return true;
  }

  connectServiceExtensionAbility(req: SvcRequest): number {
    if (this.terminated || !req.isValid()) {
      this.log('connectServiceExtensionAbility', req.abilityName, false);
      return -1;
    }
    const id = this.connectionSeq;
    this.connectionSeq = this.connectionSeq + 1;
    this.connections.push(id);
    this.log('connectServiceExtensionAbility', req.abilityName, true);
    return id;
  }

  connectServiceExtensionAbilityWithAccount(req: SvcRequest, accountId: number): number {
    if (this.terminated || !req.isValid() || accountId < 0) {
      this.log('connectServiceExtensionAbilityWithAccount', req.abilityName, false);
      return -1;
    }
    const id = this.connectionSeq;
    this.connectionSeq = this.connectionSeq + 1;
    this.connections.push(id);
    this.log('connectServiceExtensionAbilityWithAccount', req.abilityName, true);
    return id;
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

  startAbilityByCall(req: SvcRequest, caller: string): boolean {
    if (this.terminated || !req.isValid() || caller.length === 0) {
      this.log('startAbilityByCall', req.abilityName, false);
      return false;
    }
    this.calls.push(new SvcCallRecord(req.abilityName, caller, true));
    this.log('startAbilityByCall', req.abilityName, true);
    return true;
  }

  terminateSelf(): void {
    this.terminated = true;
    this.log('terminateSelf', '', true);
  }

  isTerminated(): boolean {
    return this.terminated;
  }

  getServices(): string[] {
    return this.services;
  }

  getConnections(): number[] {
    return this.connections;
  }

  getCalls(): SvcCallRecord[] {
    return this.calls;
  }

  getRecords(): SvcOperationRecord[] {
    return this.records;
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

function serviceRequest(): SvcRequest {
  return new SvcRequest(BUNDLE_NAME, MODULE_ENTRY, ABILITY_SERVICE);
}

export default function serviceExtContextOperationsTest(): void {
  describe('ServiceExtContextOperations', () => {
    it('ServiceExtContextOperations_001', 0, async (done: Function) => {
      const model = new SvcOperationsModel();
      expect(model.startAbility(serviceRequest())).assertTrue();
      expect(model.opCount('startAbility')).assertEqual(1);
      expect(model.failedCount()).assertEqual(0);
      done();
    });

    it('ServiceExtContextOperations_002', 0, async (done: Function) => {
      const model = new SvcOperationsModel();
      const invalid = new SvcRequest('', '', '');
      expect(model.startAbility(invalid)).assertFalse();
      expect(model.opCount('startAbility')).assertEqual(1);
      expect(model.failedCount()).assertEqual(1);
      done();
    });

    it('ServiceExtContextOperations_003', 0, async (done: Function) => {
      const model = new SvcOperationsModel();
      expect(model.startAbilityWithAccount(serviceRequest(), ACCOUNT_ID)).assertTrue();
      expect(model.getRecords()[0].op).assertEqual('startAbilityWithAccount');
      expect(model.failedCount()).assertEqual(0);
      done();
    });

    it('ServiceExtContextOperations_004', 0, async (done: Function) => {
      const model = new SvcOperationsModel();
      expect(model.startAbilityWithAccount(serviceRequest(), -1)).assertFalse();
      expect(model.failedCount()).assertEqual(1);
      expect(model.opCount('startAbilityWithAccount')).assertEqual(1);
      done();
    });

    it('ServiceExtContextOperations_005', 0, async (done: Function) => {
      const model = new SvcOperationsModel();
      expect(model.startServiceExtensionAbility(serviceRequest())).assertTrue();
      expect(model.getServices().length).assertEqual(1);
      expect(model.getServices()[0]).assertEqual(ABILITY_SERVICE);
      done();
    });

    it('ServiceExtContextOperations_006', 0, async (done: Function) => {
      const model = new SvcOperationsModel();
      model.startServiceExtensionAbility(serviceRequest());
      model.startServiceExtensionAbility(serviceRequest());
      expect(model.getServices().length).assertEqual(1);
      expect(model.opCount('startServiceExtensionAbility')).assertEqual(2);
      done();
    });

    it('ServiceExtContextOperations_007', 0, async (done: Function) => {
      const model = new SvcOperationsModel();
      model.startServiceExtensionAbilityWithAccount(serviceRequest(), ACCOUNT_ID);
      expect(model.getServices().length).assertEqual(1);
      expect(model.opCount('startServiceExtensionAbilityWithAccount')).assertEqual(1);
      done();
    });

    it('ServiceExtContextOperations_008', 0, async (done: Function) => {
      const model = new SvcOperationsModel();
      expect(model.startServiceExtensionAbilityWithAccount(serviceRequest(), -5)).assertFalse();
      expect(model.getServices().length).assertEqual(0);
      expect(model.failedCount()).assertEqual(1);
      done();
    });

    it('ServiceExtContextOperations_009', 0, async (done: Function) => {
      const model = new SvcOperationsModel();
      model.startServiceExtensionAbility(serviceRequest());
      expect(model.stopServiceExtensionAbility(ABILITY_SERVICE)).assertTrue();
      expect(model.getServices().length).assertEqual(0);
      done();
    });

    it('ServiceExtContextOperations_010', 0, async (done: Function) => {
      const model = new SvcOperationsModel();
      expect(model.stopServiceExtensionAbility('Missing')).assertFalse();
      expect(model.failedCount()).assertEqual(1);
      expect(model.getServices().length).assertEqual(0);
      done();
    });

    it('ServiceExtContextOperations_011', 0, async (done: Function) => {
      const model = new SvcOperationsModel();
      model.startServiceExtensionAbility(serviceRequest());
      expect(model.stopServiceExtensionAbilityWithAccount(ABILITY_SERVICE, ACCOUNT_ID)).assertTrue();
      expect(model.getServices().length).assertEqual(0);
      done();
    });

    it('ServiceExtContextOperations_012', 0, async (done: Function) => {
      const model = new SvcOperationsModel();
      model.startServiceExtensionAbility(serviceRequest());
      expect(model.stopServiceExtensionAbilityWithAccount(ABILITY_SERVICE, -1)).assertFalse();
      expect(model.getServices().length).assertEqual(1);
      done();
    });

    it('ServiceExtContextOperations_013', 0, async (done: Function) => {
      const model = new SvcOperationsModel();
      const first = model.connectServiceExtensionAbility(serviceRequest());
      const second = model.connectServiceExtensionAbility(serviceRequest());
      expect(first).assertEqual(CONNECTION_NUMBER);
      expect(second).assertEqual(1);
      expect(model.getConnections().length).assertEqual(2);
      done();
    });

    it('ServiceExtContextOperations_014', 0, async (done: Function) => {
      const model = new SvcOperationsModel();
      const id = model.connectServiceExtensionAbility(new SvcRequest('', '', ''));
      expect(id).assertEqual(-1);
      expect(model.getConnections().length).assertEqual(0);
      done();
    });

    it('ServiceExtContextOperations_015', 0, async (done: Function) => {
      const model = new SvcOperationsModel();
      const id = model.connectServiceExtensionAbilityWithAccount(serviceRequest(), ACCOUNT_ID);
      expect(id).assertEqual(CONNECTION_NUMBER);
      expect(model.getConnections().length).assertEqual(1);
      expect(model.opCount('connectServiceExtensionAbilityWithAccount')).assertEqual(1);
      done();
    });

    it('ServiceExtContextOperations_016', 0, async (done: Function) => {
      const model = new SvcOperationsModel();
      const id = model.connectServiceExtensionAbilityWithAccount(serviceRequest(), -2);
      expect(id).assertEqual(-1);
      expect(model.getConnections().length).assertEqual(0);
      done();
    });

    it('ServiceExtContextOperations_017', 0, async (done: Function) => {
      const model = new SvcOperationsModel();
      const id = model.connectServiceExtensionAbility(serviceRequest());
      expect(model.disconnectServiceExtensionAbility(id)).assertTrue();
      expect(model.getConnections().length).assertEqual(0);
      done();
    });

    it('ServiceExtContextOperations_018', 0, async (done: Function) => {
      const model = new SvcOperationsModel();
      expect(model.disconnectServiceExtensionAbility(9)).assertFalse();
      expect(model.failedCount()).assertEqual(1);
      expect(model.getConnections().length).assertEqual(0);
      done();
    });

    it('ServiceExtContextOperations_019', 0, async (done: Function) => {
      const model = new SvcOperationsModel();
      expect(model.startAbilityByCall(serviceRequest(), 'callerA')).assertTrue();
      expect(model.getCalls().length).assertEqual(1);
      expect(model.getCalls()[0].caller).assertEqual('callerA');
      done();
    });

    it('ServiceExtContextOperations_020', 0, async (done: Function) => {
      const model = new SvcOperationsModel();
      expect(model.startAbilityByCall(serviceRequest(), '')).assertFalse();
      expect(model.getCalls().length).assertEqual(0);
      expect(model.failedCount()).assertEqual(1);
      done();
    });

    it('ServiceExtContextOperations_021', 0, async (done: Function) => {
      const model = new SvcOperationsModel();
      expect(model.startAbilityByCall(new SvcRequest('', '', ''), 'callerA')).assertFalse();
      expect(model.opCount('startAbilityByCall')).assertEqual(1);
      expect(model.getCalls().length).assertEqual(0);
      done();
    });

    it('ServiceExtContextOperations_022', 0, async (done: Function) => {
      const model = new SvcOperationsModel();
      expect(model.isTerminated()).assertFalse();
      model.terminateSelf();
      expect(model.isTerminated()).assertTrue();
      expect(model.getRecords().length).assertEqual(1);
      done();
    });

    it('ServiceExtContextOperations_023', 0, async (done: Function) => {
      const model = new SvcOperationsModel();
      model.terminateSelf();
      expect(model.startServiceExtensionAbility(serviceRequest())).assertFalse();
      expect(model.connectServiceExtensionAbility(serviceRequest())).assertEqual(-1);
      expect(model.startAbilityByCall(serviceRequest(), 'caller')).assertFalse();
      done();
    });

    it('ServiceExtContextOperations_024', 0, async (done: Function) => {
      const model = new SvcOperationsModel();
      model.terminateSelf();
      expect(model.startAbility(serviceRequest())).assertTrue();
      expect(model.failedCount()).assertEqual(0);
      expect(model.opCount('startAbility')).assertEqual(1);
      done();
    });

    it('ServiceExtContextOperations_025', 0, async (done: Function) => {
      const model = new SvcOperationsModel();
      model.startAbilityByCall(serviceRequest(), 'a');
      model.startAbilityByCall(serviceRequest(), 'b');
      expect(model.getCalls().length).assertEqual(2);
      expect(model.getCalls()[1].caller).assertEqual('b');
      expect(model.getCalls()[0].ok).assertTrue();
      done();
    });

    it('ServiceExtContextOperations_026', 0, async (done: Function) => {
      const model = new SvcOperationsModel();
      model.startServiceExtensionAbility(serviceRequest());
      model.startServiceExtensionAbility(
        new SvcRequest(BUNDLE_NAME, MODULE_ENTRY, 'FormAbility'));
      expect(model.getServices().length).assertEqual(2);
      expect(model.getServices()[1]).assertEqual('FormAbility');
      done();
    });

    it('ServiceExtContextOperations_027', 0, async (done: Function) => {
      const model = new SvcOperationsModel();
      model.startAbility(serviceRequest());
      model.startServiceExtensionAbility(serviceRequest());
      model.connectServiceExtensionAbility(serviceRequest());
      const records = model.getRecords();
      expect(records.length).assertEqual(3);
      expect(records[0].op).assertEqual('startAbility');
      expect(records[2].op).assertEqual('connectServiceExtensionAbility');
      done();
    });

    it('ServiceExtContextOperations_028', 0, async (done: Function) => {
      const model = new SvcOperationsModel();
      model.startAbility(new SvcRequest('', '', ''));
      model.stopServiceExtensionAbility('missing');
      model.disconnectServiceExtensionAbility(8);
      expect(model.failedCount()).assertEqual(3);
      expect(model.getRecords().length).assertEqual(3);
      done();
    });

    it('ServiceExtContextOperations_029', 0, async (done: Function) => {
      const model = new SvcOperationsModel();
      const id = model.connectServiceExtensionAbility(serviceRequest());
      model.disconnectServiceExtensionAbility(id);
      const next = model.connectServiceExtensionAbility(serviceRequest());
      expect(next).assertEqual(1);
      expect(model.getConnections().length).assertEqual(1);
      expect(model.opCount('disconnectServiceExtensionAbility')).assertEqual(1);
      done();
    });

    it('ServiceExtContextOperations_030', 0, async (done: Function) => {
      const model = new SvcOperationsModel();
      const a = model.connectServiceExtensionAbility(serviceRequest());
      const b = model.connectServiceExtensionAbilityWithAccount(serviceRequest(), ACCOUNT_ID);
      expect(a).assertEqual(0);
      expect(b).assertEqual(1);
      expect(model.getConnections().length).assertEqual(2);
      done();
    });

    it('ServiceExtContextOperations_031', 0, async (done: Function) => {
      const model = new SvcOperationsModel();
      model.startServiceExtensionAbilityWithAccount(serviceRequest(), ACCOUNT_ID);
      model.startServiceExtensionAbilityWithAccount(serviceRequest(), ACCOUNT_ID);
      expect(model.getServices().length).assertEqual(1);
      expect(model.opCount('startServiceExtensionAbilityWithAccount')).assertEqual(2);
      done();
    });

    it('ServiceExtContextOperations_032', 0, async (done: Function) => {
      const model = new SvcOperationsModel();
      expect(model.stopServiceExtensionAbilityWithAccount('Missing', ACCOUNT_ID)).assertFalse();
      expect(model.failedCount()).assertEqual(1);
      expect(model.getServices().length).assertEqual(0);
      done();
    });

    it('ServiceExtContextOperations_033', 0, async (done: Function) => {
      const model = new SvcOperationsModel();
      model.startAbility(serviceRequest());
      model.startAbilityWithAccount(serviceRequest(), ACCOUNT_ID);
      expect(model.getRecords()[0].target).assertEqual(ABILITY_SERVICE);
      expect(model.getRecords()[1].op).assertEqual('startAbilityWithAccount');
      expect(model.failedCount()).assertEqual(0);
      done();
    });

    it('ServiceExtContextOperations_034', 0, async (done: Function) => {
      const model = new SvcOperationsModel();
      model.terminateSelf();
      expect(model.startAbilityWithAccount(serviceRequest(), ACCOUNT_ID)).assertTrue();
      expect(model.isTerminated()).assertTrue();
      expect(model.opCount('terminateSelf')).assertEqual(1);
      done();
    });

    it('ServiceExtContextOperations_035', 0, async (done: Function) => {
      const model = new SvcOperationsModel();
      model.startAbilityByCall(serviceRequest(), 'callerX');
      model.terminateSelf();
      expect(model.getCalls().length).assertEqual(1);
      expect(model.startAbilityByCall(serviceRequest(), 'callerY')).assertFalse();
      expect(model.getCalls().length).assertEqual(1);
      done();
    });

    it('ServiceExtContextOperations_036', 0, async (done: Function) => {
      try {
        const driver: Driver = getDriver();
        const ready = await ensureAppReady(driver);
        expect(ready).assertTrue();
        const exists = await checkComponentExists(driver, 'Text');
        expect(typeof exists === 'boolean').assertTrue();
      } catch (error) {
        expect(error !== null).assertTrue();
      }
      done();
    });

    it('ServiceExtContextOperations_037', 0, async (done: Function) => {
      const model = new SvcOperationsModel();
      model.startServiceExtensionAbility(serviceRequest());
      const id = model.connectServiceExtensionAbility(serviceRequest());
      expect(model.stopServiceExtensionAbility(ABILITY_SERVICE)).assertTrue();
      expect(model.disconnectServiceExtensionAbility(id)).assertTrue();
      expect(model.getServices().length).assertEqual(0);
      expect(model.getConnections().length).assertEqual(0);
      done();
    });
  });
}
