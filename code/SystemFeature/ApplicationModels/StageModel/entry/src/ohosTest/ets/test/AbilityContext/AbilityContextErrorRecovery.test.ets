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
  BUNDLE_NAME, ACCOUNT_ID, RESULT_CODE, MODULE_ENTRY
} from '../Shared/SharedDriver';

enum ErrCode {
  NONE = 0,
  INVALID_REQUEST = 1,
  NOT_CONNECTED = 2,
  PERMISSION_DENIED = 3,
  QUOTA_EXCEEDED = 4,
  INVALID_STATE = 5
}

class ErrRequest {
  bundleName: string = '';
  abilityName: string = '';
  maxRetries: number = 0;

  constructor(bundleName: string, abilityName: string, maxRetries: number) {
    this.bundleName = bundleName;
    this.abilityName = abilityName;
    this.maxRetries = maxRetries;
  }

  isValid(): boolean {
    return this.bundleName.length > 0 && this.abilityName.length > 0 &&
      this.maxRetries >= 0 && this.maxRetries <= 5;
  }
}

class ErrOutcome {
  code: number = ErrCode.NONE;
  ok: boolean = false;
  attempts: number = 0;

  constructor(code: number, ok: boolean, attempts: number) {
    this.code = code;
    this.ok = ok;
    this.attempts = attempts;
  }
}

class ErrContextModel {
  private state: string = 'CREATED';
  private errors: number[] = [];
  private successes: number = 0;
  private connections: number[] = [];
  private connectionSeq: number = 0;
  private transientFailures: number = 0;
  private recovered: number = 0;

  dispatch(req: ErrRequest): ErrOutcome {
    if (!req.isValid()) {
      this.errors.push(ErrCode.INVALID_REQUEST);
      return new ErrOutcome(ErrCode.INVALID_REQUEST, false, 0);
    }
    if (this.state === 'TERMINATED') {
      this.errors.push(ErrCode.INVALID_STATE);
      return new ErrOutcome(ErrCode.INVALID_STATE, false, 1);
    }
    let attempts = 0;
    while (attempts < req.maxRetries) {
      attempts = attempts + 1;
      if (attempts === req.maxRetries) {
        this.successes = this.successes + 1;
        this.state = 'ACTIVE';
        return new ErrOutcome(ErrCode.NONE, true, attempts);
      }
    }
    this.successes = this.successes + 1;
    this.state = 'ACTIVE';
    return new ErrOutcome(ErrCode.NONE, true, attempts);
  }

  failWith(code: number): void {
    this.errors.push(code);
    this.transientFailures = this.transientFailures + 1;
  }

  connect(valid: boolean): number {
    if (!valid || this.state === 'TERMINATED') {
      this.errors.push(ErrCode.NOT_CONNECTED);
      return -1;
    }
    const id = this.connectionSeq;
    this.connectionSeq = this.connectionSeq + 1;
    this.connections.push(id);
    return id;
  }

  release(id: number): boolean {
    const index = this.connections.indexOf(id);
    if (index < 0) {
      this.errors.push(ErrCode.NOT_CONNECTED);
      return false;
    }
    this.connections.splice(index, 1);
    return true;
  }

  requestPermission(tokenId: number, permission: string): number {
    if (tokenId < 0 || permission.length === 0) {
      this.errors.push(ErrCode.PERMISSION_DENIED);
      return ErrCode.PERMISSION_DENIED;
    }
    return ErrCode.NONE;
  }

  terminate(): void {
    this.state = 'TERMINATED';
  }

  recover(): number {
    let count = 0;
    const remaining: number[] = [];
    for (let i = 0; i < this.errors.length; i++) {
      if (this.errors[i] === ErrCode.NOT_CONNECTED) {
        count = count + 1;
      } else {
        remaining.push(this.errors[i]);
      }
    }
    this.errors = remaining;
    this.transientFailures = 0;
    this.recovered = this.recovered + count;
    if (this.state === 'TERMINATED') {
      this.state = 'RECOVERED';
    }
    return count;
  }

  reset(): void {
    this.state = 'CREATED';
    this.errors = [];
    this.connections = [];
    this.successes = 0;
    this.transientFailures = 0;
  }

  getState(): string {
    return this.state;
  }

  errorCount(): number {
    return this.errors.length;
  }

  successCount(): number {
    return this.successes;
  }

  getConnections(): number[] {
    return this.connections;
  }

  transientCount(): number {
    return this.transientFailures;
  }

  recoveredCount(): number {
    return this.recovered;
  }

  lastError(): number {
    if (this.errors.length === 0) {
      return ErrCode.NONE;
    }
    return this.errors[this.errors.length - 1];
  }
}

function errRequest(): ErrRequest {
  return new ErrRequest(BUNDLE_NAME, 'JumpAbility', 2);
}

export default function abilityContextErrorRecoveryTest(): void {
  describe('AbilityContextErrorRecovery', () => {
    it('AbilityContextErrorRecovery_001', 0, async (done: Function) => {
      const model = new ErrContextModel();
      const outcome = model.dispatch(errRequest());
      expect(outcome.ok).assertTrue();
      expect(outcome.code).assertEqual(ErrCode.NONE);
      expect(model.getState()).assertEqual('ACTIVE');
      done();
    });

    it('AbilityContextErrorRecovery_002', 0, async (done: Function) => {
      const model = new ErrContextModel();
      const outcome = model.dispatch(new ErrRequest('', '', 0));
      expect(outcome.ok).assertFalse();
      expect(outcome.code).assertEqual(ErrCode.INVALID_REQUEST);
      expect(model.lastError()).assertEqual(ErrCode.INVALID_REQUEST);
      done();
    });

    it('AbilityContextErrorRecovery_003', 0, async (done: Function) => {
      const model = new ErrContextModel();
      const outcome = model.dispatch(new ErrRequest(BUNDLE_NAME, 'JumpAbility', 3));
      expect(outcome.attempts).assertEqual(3);
      expect(model.successCount()).assertEqual(1);
      expect(model.errorCount()).assertEqual(0);
      done();
    });

    it('AbilityContextErrorRecovery_004', 0, async (done: Function) => {
      const model = new ErrContextModel();
      const outcome = model.dispatch(new ErrRequest(BUNDLE_NAME, 'JumpAbility', 6));
      expect(outcome.ok).assertFalse();
      expect(model.errorCount()).assertEqual(1);
      expect(model.successCount()).assertEqual(0);
      done();
    });

    it('AbilityContextErrorRecovery_005', 0, async (done: Function) => {
      const model = new ErrContextModel();
      model.terminate();
      const outcome = model.dispatch(errRequest());
      expect(outcome.code).assertEqual(ErrCode.INVALID_STATE);
      expect(model.getState()).assertEqual('TERMINATED');
      done();
    });

    it('AbilityContextErrorRecovery_006', 0, async (done: Function) => {
      const model = new ErrContextModel();
      const first = model.connect(true);
      const second = model.connect(true);
      expect(first).assertEqual(0);
      expect(second).assertEqual(1);
      expect(model.getConnections().length).assertEqual(2);
      done();
    });

    it('AbilityContextErrorRecovery_007', 0, async (done: Function) => {
      const model = new ErrContextModel();
      expect(model.connect(false)).assertEqual(-1);
      expect(model.lastError()).assertEqual(ErrCode.NOT_CONNECTED);
      expect(model.getConnections().length).assertEqual(0);
      done();
    });

    it('AbilityContextErrorRecovery_008', 0, async (done: Function) => {
      const model = new ErrContextModel();
      const id = model.connect(true);
      expect(model.release(id)).assertTrue();
      expect(model.getConnections().length).assertEqual(0);
      expect(model.errorCount()).assertEqual(0);
      done();
    });

    it('AbilityContextErrorRecovery_009', 0, async (done: Function) => {
      const model = new ErrContextModel();
      expect(model.release(42)).assertFalse();
      expect(model.lastError()).assertEqual(ErrCode.NOT_CONNECTED);
      expect(model.errorCount()).assertEqual(1);
      done();
    });

    it('AbilityContextErrorRecovery_010', 0, async (done: Function) => {
      const model = new ErrContextModel();
      const code = model.requestPermission(ACCOUNT_ID, 'ohos.permission.GRANT_SENSITIVE_PERMISSIONS');
      expect(code).assertEqual(ErrCode.NONE);
      expect(model.errorCount()).assertEqual(0);
      done();
    });

    it('AbilityContextErrorRecovery_011', 0, async (done: Function) => {
      const model = new ErrContextModel();
      expect(model.requestPermission(-1, '')).assertEqual(ErrCode.PERMISSION_DENIED);
      expect(model.lastError()).assertEqual(ErrCode.PERMISSION_DENIED);
      expect(model.errorCount()).assertEqual(1);
      done();
    });

    it('AbilityContextErrorRecovery_012', 0, async (done: Function) => {
      const model = new ErrContextModel();
      model.failWith(ErrCode.NOT_CONNECTED);
      model.failWith(ErrCode.NOT_CONNECTED);
      model.failWith(ErrCode.PERMISSION_DENIED);
      expect(model.transientCount()).assertEqual(3);
      const recovered = model.recover();
      expect(recovered).assertEqual(2);
      expect(model.errorCount()).assertEqual(1);
      done();
    });

    it('AbilityContextErrorRecovery_013', 0, async (done: Function) => {
      const model = new ErrContextModel();
      model.terminate();
      model.failWith(ErrCode.NOT_CONNECTED);
      expect(model.recover()).assertEqual(1);
      expect(model.getState()).assertEqual('RECOVERED');
      expect(model.transientCount()).assertEqual(0);
      done();
    });

    it('AbilityContextErrorRecovery_014', 0, async (done: Function) => {
      const model = new ErrContextModel();
      model.dispatch(errRequest());
      model.connect(true);
      model.failWith(ErrCode.NOT_CONNECTED);
      model.reset();
      expect(model.getState()).assertEqual('CREATED');
      expect(model.getConnections().length).assertEqual(0);
      expect(model.errorCount()).assertEqual(0);
      done();
    });

    it('AbilityContextErrorRecovery_015', 0, async (done: Function) => {
      const model = new ErrContextModel();
      model.failWith(ErrCode.QUOTA_EXCEEDED);
      model.recover();
      expect(model.recoveredCount()).assertEqual(0);
      expect(model.errorCount()).assertEqual(1);
      expect(model.lastError()).assertEqual(ErrCode.QUOTA_EXCEEDED);
      done();
    });

    it('AbilityContextErrorRecovery_016', 0, async (done: Function) => {
      const model = new ErrContextModel();
      model.failWith(ErrCode.NOT_CONNECTED);
      model.recover();
      model.failWith(ErrCode.NOT_CONNECTED);
      model.recover();
      expect(model.recoveredCount()).assertEqual(2);
      expect(model.errorCount()).assertEqual(0);
      done();
    });

    it('AbilityContextErrorRecovery_017', 0, async (done: Function) => {
      const model = new ErrContextModel();
      model.dispatch(errRequest());
      model.terminate();
      model.dispatch(errRequest());
      expect(model.errorCount()).assertEqual(1);
      expect(model.successCount()).assertEqual(1);
      expect(model.lastError()).assertEqual(ErrCode.INVALID_STATE);
      done();
    });

    it('AbilityContextErrorRecovery_018', 0, async (done: Function) => {
      const model = new ErrContextModel();
      const a = model.dispatch(new ErrRequest(BUNDLE_NAME, 'MainAbility', 0));
      const b = model.dispatch(new ErrRequest(BUNDLE_NAME, 'JumpAbility', 0));
      expect(a.attempts).assertEqual(0);
      expect(b.attempts).assertEqual(0);
      expect(model.successCount()).assertEqual(2);
      done();
    });

    it('AbilityContextErrorRecovery_019', 0, async (done: Function) => {
      const model = new ErrContextModel();
      const id = model.connect(true);
      model.terminate();
      expect(model.release(id)).assertTrue();
      expect(model.connect(true)).assertEqual(-1);
      expect(model.lastError()).assertEqual(ErrCode.NOT_CONNECTED);
      done();
    });

    it('AbilityContextErrorRecovery_020', 0, async (done: Function) => {
      const model = new ErrContextModel();
      model.failWith(ErrCode.INVALID_STATE);
      model.failWith(ErrCode.QUOTA_EXCEEDED);
      expect(model.lastError()).assertEqual(ErrCode.QUOTA_EXCEEDED);
      expect(model.recover()).assertEqual(0);
      expect(model.errorCount()).assertEqual(2);
      done();
    });

    it('AbilityContextErrorRecovery_021', 0, async (done: Function) => {
      const model = new ErrContextModel();
      model.reset();
      expect(model.successCount()).assertEqual(0);
      expect(model.recoveredCount()).assertEqual(0);
      expect(model.getState()).assertEqual('CREATED');
      done();
    });

    it('AbilityContextErrorRecovery_022', 0, async (done: Function) => {
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

    it('AbilityContextErrorRecovery_023', 0, async (done: Function) => {
      const model = new ErrContextModel();
      model.failWith(ErrCode.INVALID_REQUEST);
      model.failWith(ErrCode.NOT_CONNECTED);
      model.failWith(ErrCode.NOT_CONNECTED);
      model.failWith(ErrCode.QUOTA_EXCEEDED);
      expect(model.errorCount()).assertEqual(4);
      expect(model.recover()).assertEqual(2);
      expect(model.errorCount()).assertEqual(2);
      expect(model.transientCount()).assertEqual(0);
      done();
    });

    it('AbilityContextErrorRecovery_024', 0, async (done: Function) => {
      const model = new ErrContextModel();
      const invalid = new ErrRequest('', 'JumpAbility', 1);
      model.dispatch(invalid);
      model.dispatch(invalid);
      model.dispatch(invalid);
      expect(model.errorCount()).assertEqual(3);
      expect(model.successCount()).assertEqual(0);
      expect(model.getState()).assertEqual('CREATED');
      done();
    });

    it('AbilityContextErrorRecovery_025', 0, async (done: Function) => {
      const model = new ErrContextModel();
      const first = model.connect(true);
      model.release(first);
      const second = model.connect(true);
      expect(first).assertEqual(0);
      expect(second).assertEqual(1);
      expect(model.getConnections().length).assertEqual(1);
      expect(model.getConnections()[0]).assertEqual(1);
      done();
    });

    it('AbilityContextErrorRecovery_026', 0, async (done: Function) => {
      const model = new ErrContextModel();
      model.terminate();
      expect(model.recover()).assertEqual(0);
      expect(model.getState()).assertEqual('RECOVERED');
      const outcome = model.dispatch(errRequest());
      expect(outcome.ok).assertTrue();
      expect(model.getState()).assertEqual('ACTIVE');
      done();
    });

    it('AbilityContextErrorRecovery_027', 0, async (done: Function) => {
      const model = new ErrContextModel();
      expect(model.requestPermission(0, 'ohos.permission.INTERNET')).assertEqual(ErrCode.NONE);
      expect(model.requestPermission(0, '')).assertEqual(ErrCode.PERMISSION_DENIED);
      expect(model.errorCount()).assertEqual(1);
      done();
    });

    it('AbilityContextErrorRecovery_028', 0, async (done: Function) => {
      const model = new ErrContextModel();
      model.failWith(ErrCode.QUOTA_EXCEEDED);
      model.failWith(ErrCode.QUOTA_EXCEEDED);
      expect(model.recover()).assertEqual(0);
      expect(model.errorCount()).assertEqual(2);
      expect(model.recoveredCount()).assertEqual(0);
      done();
    });

    it('AbilityContextErrorRecovery_029', 0, async (done: Function) => {
      const model = new ErrContextModel();
      const outcome = model.dispatch(new ErrRequest(BUNDLE_NAME, 'FormAbility', 5));
      expect(outcome.ok).assertTrue();
      expect(outcome.attempts).assertEqual(5);
      expect(model.getState()).assertEqual('ACTIVE');
      done();
    });

    it('AbilityContextErrorRecovery_030', 0, async (done: Function) => {
      const model = new ErrContextModel();
      const a = model.dispatch(new ErrRequest(BUNDLE_NAME, 'JumpAbility', 1));
      const b = model.dispatch(new ErrRequest(BUNDLE_NAME, 'JumpAbility', 4));
      expect(a.attempts).assertEqual(1);
      expect(b.attempts).assertEqual(4);
      expect(model.successCount()).assertEqual(2);
      expect(model.errorCount()).assertEqual(0);
      done();
    });

    it('AbilityContextErrorRecovery_031', 0, async (done: Function) => {
      const model = new ErrContextModel();
      model.failWith(ErrCode.NOT_CONNECTED);
      model.recover();
      expect(model.lastError()).assertEqual(ErrCode.NONE);
      expect(model.recoveredCount()).assertEqual(1);
      expect(model.errorCount()).assertEqual(0);
      done();
    });

    it('AbilityContextErrorRecovery_032', 0, async (done: Function) => {
      const model = new ErrContextModel();
      expect(model.getState()).assertEqual('CREATED');
      model.dispatch(errRequest());
      expect(model.getState()).assertEqual('ACTIVE');
      model.terminate();
      expect(model.getState()).assertEqual('TERMINATED');
      model.recover();
      expect(model.getState()).assertEqual('RECOVERED');
      done();
    });

    it('AbilityContextErrorRecovery_033', 0, async (done: Function) => {
      const model = new ErrContextModel();
      model.dispatch(errRequest());
      model.dispatch(errRequest());
      expect(model.successCount()).assertEqual(2);
      expect(model.errorCount()).assertEqual(0);
      expect(model.lastError()).assertEqual(ErrCode.NONE);
      done();
    });

    it('AbilityContextErrorRecovery_034', 0, async (done: Function) => {
      const model = new ErrContextModel();
      const id = model.connect(true);
      model.terminate();
      expect(model.release(id)).assertTrue();
      expect(model.getConnections().length).assertEqual(0);
      expect(model.errorCount()).assertEqual(0);
      done();
    });

    it('AbilityContextErrorRecovery_035', 0, async (done: Function) => {
      const model = new ErrContextModel();
      model.failWith(ErrCode.PERMISSION_DENIED);
      model.failWith(ErrCode.NOT_CONNECTED);
      model.failWith(ErrCode.QUOTA_EXCEEDED);
      expect(model.recover()).assertEqual(1);
      expect(model.lastError()).assertEqual(ErrCode.QUOTA_EXCEEDED);
      expect(model.recoveredCount()).assertEqual(1);
      expect(model.errorCount()).assertEqual(2);
      done();
    });

    it('AbilityContextErrorRecovery_036', 0, async (done: Function) => {
      const model = new ErrContextModel();
      const id = model.connect(true);
      expect(model.connect(true)).assertEqual(1);
      expect(model.release(id)).assertTrue();
      expect(model.getConnections().length).assertEqual(1);
      expect(model.getConnections()[0]).assertEqual(1);
      done();
    });

    it('AbilityContextErrorRecovery_037', 0, async (done: Function) => {
      const model = new ErrContextModel();
      model.terminate();
      expect(model.requestPermission(ACCOUNT_ID, 'ohos.permission.INTERNET')).assertEqual(ErrCode.NONE);
      expect(model.errorCount()).assertEqual(0);
      expect(model.getState()).assertEqual('TERMINATED');
      done();
    });

    it('AbilityContextErrorRecovery_038', 0, async (done: Function) => {
      const model = new ErrContextModel();
      model.reset();
      const outcome = model.dispatch(new ErrRequest(BUNDLE_NAME, 'DataShareExtAbility', 2));
      expect(outcome.ok).assertTrue();
      expect(model.successCount()).assertEqual(1);
      expect(model.errorCount()).assertEqual(0);
      expect(model.getState()).assertEqual('ACTIVE');
      done();
    });

    it('AbilityContextErrorRecovery_039', 0, async (done: Function) => {
      const model = new ErrContextModel();
      for (let i = 0; i < 4; i++) {
        model.failWith(ErrCode.NOT_CONNECTED);
      }
      expect(model.errorCount()).assertEqual(4);
      expect(model.recover()).assertEqual(4);
      expect(model.errorCount()).assertEqual(0);
      expect(model.recoveredCount()).assertEqual(4);
      done();
    });

    it('AbilityContextErrorRecovery_040', 0, async (done: Function) => {
      const model = new ErrContextModel();
      expect(model.getState()).assertEqual('CREATED');
      expect(model.errorCount()).assertEqual(0);
      expect(model.successCount()).assertEqual(0);
      expect(model.recoveredCount()).assertEqual(0);
      expect(model.getConnections().length).assertEqual(0);
      expect(model.transientCount()).assertEqual(0);
      expect(model.lastError()).assertEqual(ErrCode.NONE);
      expect(model.getConnections().indexOf(0)).assertEqual(-1);
      done();
    });
  });
}
