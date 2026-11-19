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
import { Driver, ON } from '@ohos.UiTest';
import hilog from '@ohos.hilog';
import { BUNDLE_NAME, MODULE_ENTRY, ABILITY_MAIN, ABILITY_SERVICE, ACCOUNT_ID, RESULT_CODE } from '../Shared/SharedDriver';

enum RequestMode {
  PLAIN = 0,
  WITH_ACCOUNT = 1,
  FOR_RESULT = 2,
  SERVICE = 3,
  SERVICE_WITH_ACCOUNT = 4
}

enum RequestFlag {
  NONE = 0,
  NEW_TASK = 1,
  CLEAR_TASK = 2,
  NO_ANIMATION = 4,
  GRANT_PERSISTABLE = 8
}

enum RequestState {
  DRAFT = 0,
  VALIDATED = 1,
  DISPATCHED = 2,
  SETTLED = 3,
  REJECTED = 4
}

class ParamEntry {
  readonly key: string;
  readonly value: string;

  constructor(key: string, value: string) {
    this.key = key;
    this.value = value;
  }

  describe(): string {
    return `${this.key}=${this.value}`;
  }

  isBlank(): boolean {
    return this.key.length === 0;
  }
}

class AbilityRequest {
  readonly requestId: number;
  bundleName: string;
  moduleName: string;
  abilityName: string;
  accountId: number;
  mode: RequestMode;
  flagBits: number;
  resultCode: number;
  state: RequestState;
  private params: ParamEntry[] = [];

  constructor(requestId: number, bundleName: string, moduleName: string, abilityName: string) {
    this.requestId = requestId;
    this.bundleName = bundleName;
    this.moduleName = moduleName;
    this.abilityName = abilityName;
    this.accountId = 0;
    this.mode = RequestMode.PLAIN;
    this.flagBits = RequestFlag.NONE;
    this.resultCode = 0;
    this.state = RequestState.DRAFT;
  }

  withAccount(accountId: number): AbilityRequest {
    this.accountId = accountId;
    this.mode = RequestMode.WITH_ACCOUNT;
    return this;
  }

  withResult(resultCode: number): AbilityRequest {
    this.resultCode = resultCode;
    this.mode = RequestMode.FOR_RESULT;
    return this;
  }

  asService(): AbilityRequest {
    this.mode = RequestMode.SERVICE;
    return this;
  }

  addFlag(flag: RequestFlag): AbilityRequest {
    this.flagBits = this.flagBits | flag;
    return this;
  }

  hasFlag(flag: RequestFlag): boolean {
    return (this.flagBits & flag) === flag;
  }

  hasAnyFlag(): boolean {
    return this.flagBits !== RequestFlag.NONE;
  }

  flagCount(): number {
    let count = 0;
    const values: RequestFlag[] = [RequestFlag.NEW_TASK, RequestFlag.CLEAR_TASK,
      RequestFlag.NO_ANIMATION, RequestFlag.GRANT_PERSISTABLE];
    for (const value of values) {
      if (this.hasFlag(value)) {
        count += 1;
      }
    }
    return count;
  }

  addParam(key: string, value: string): AbilityRequest {
    this.params.push(new ParamEntry(key, value));
    return this;
  }

  paramCount(): number {
    return this.params.length;
  }

  allParams(): ParamEntry[] {
    return this.params;
  }

  paramValue(key: string): string {
    for (const entry of this.params) {
      if (entry.key === key) {
        return entry.value;
      }
    }
    return '';
  }

  hasParam(key: string): boolean {
    for (const entry of this.params) {
      if (entry.key === key) {
        return true;
      }
    }
    return false;
  }

  isService(): boolean {
    return this.mode === RequestMode.SERVICE || this.mode === RequestMode.SERVICE_WITH_ACCOUNT;
  }

  isAccountScoped(): boolean {
    return this.mode === RequestMode.WITH_ACCOUNT || this.mode === RequestMode.SERVICE_WITH_ACCOUNT;
  }

  isResultOriented(): boolean {
    return this.mode === RequestMode.FOR_RESULT;
  }

  isValid(): boolean {
    return this.bundleName.length > 0 && this.moduleName.length > 0 && this.abilityName.length > 0;
  }

  describe(): string {
    return `${this.requestId}:${this.bundleName}/${this.moduleName}/${this.abilityName}`;
  }

  target(): string {
    return `${this.moduleName}/${this.abilityName}`;
  }

  transact(next: RequestState): boolean {
    if (this.state === RequestState.REJECTED || this.state === RequestState.SETTLED) {
      return false;
    }
    this.state = next;
    return true;
  }

  clone(): AbilityRequest {
    const copy = new AbilityRequest(this.requestId, this.bundleName, this.moduleName, this.abilityName);
    copy.accountId = this.accountId;
    copy.mode = this.mode;
    copy.flagBits = this.flagBits;
    copy.resultCode = this.resultCode;
    copy.state = this.state;
    for (const entry of this.params) {
      copy.addParam(entry.key, entry.value);
    }
    return copy;
  }

  equals(other: AbilityRequest): boolean {
    return this.requestId === other.requestId &&
      this.bundleName === other.bundleName &&
      this.moduleName === other.moduleName &&
      this.abilityName === other.abilityName &&
      this.mode === other.mode &&
      this.paramCount() === other.paramCount();
  }
}

class RequestValidator {
  private requiredModules: string[] = [MODULE_ENTRY];
  private maxParams: number;

  constructor(maxParams: number) {
    this.maxParams = maxParams;
  }

  isModuleAllowed(moduleName: string): boolean {
    for (const allowed of this.requiredModules) {
      if (allowed === moduleName) {
        return true;
      }
    }
    return false;
  }

  validate(request: AbilityRequest): boolean {
    if (!request.isValid()) {
      return false;
    }
    if (!this.isModuleAllowed(request.moduleName)) {
      return false;
    }
    if (request.paramCount() > this.maxParams) {
      return false;
    }
    return true;
  }

  firstFailure(request: AbilityRequest): string {
    if (request.bundleName.length === 0) {
      return 'bundleName';
    }
    if (request.moduleName.length === 0) {
      return 'moduleName';
    }
    if (request.abilityName.length === 0) {
      return 'abilityName';
    }
    if (!this.isModuleAllowed(request.moduleName)) {
      return 'moduleNotAllowed';
    }
    if (request.paramCount() > this.maxParams) {
      return 'tooManyParams';
    }
    return '';
  }
}

class RequestBuilder {
  private request: AbilityRequest;

  constructor(requestId: number) {
    this.request = new AbilityRequest(requestId, BUNDLE_NAME, MODULE_ENTRY, ABILITY_MAIN);
  }

  ability(name: string): RequestBuilder {
    this.request.abilityName = name;
    return this;
  }

  account(id: number): RequestBuilder {
    this.request.withAccount(id);
    return this;
  }

  result(code: number): RequestBuilder {
    this.request.withResult(code);
    return this;
  }

  service(): RequestBuilder {
    this.request.asService();
    return this;
  }

  flag(flag: RequestFlag): RequestBuilder {
    this.request.addFlag(flag);
    return this;
  }

  param(key: string, value: string): RequestBuilder {
    this.request.addParam(key, value);
    return this;
  }

  build(): AbilityRequest {
    return this.request;
  }
}

class RequestBatch {
  private requests: AbilityRequest[] = [];

  add(request: AbilityRequest): RequestBatch {
    this.requests.push(request);
    return this;
  }

  size(): number {
    return this.requests.length;
  }

  all(): AbilityRequest[] {
    return this.requests;
  }

  serviceCount(): number {
    let count = 0;
    for (const request of this.requests) {
      if (request.isService()) {
        count += 1;
      }
    }
    return count;
  }

  accountScopedCount(): number {
    let count = 0;
    for (const request of this.requests) {
      if (request.isAccountScoped()) {
        count += 1;
      }
    }
    return count;
  }

  validCount(validator: RequestValidator): number {
    let count = 0;
    for (const request of this.requests) {
      if (validator.validate(request)) {
        count += 1;
      }
    }
    return count;
  }

  totalParams(): number {
    let count = 0;
    for (const request of this.requests) {
      count += request.paramCount();
    }
    return count;
  }

  findById(id: number): AbilityRequest | null {
    for (const request of this.requests) {
      if (request.requestId === id) {
        return request;
      }
    }
    return null;
  }

  ids(): number[] {
    const result: number[] = [];
    for (const request of this.requests) {
      result.push(request.requestId);
    }
    return result;
  }
}

class RequestStats {
  private batch: RequestBatch;

  constructor(batch: RequestBatch) {
    this.batch = batch;
  }

  modeHistogram(mode: RequestMode): number {
    let count = 0;
    for (const request of this.batch.all()) {
      if (request.mode === mode) {
        count += 1;
      }
    }
    return count;
  }

  flaggedRequests(): number {
    let count = 0;
    for (const request of this.batch.all()) {
      if (request.hasAnyFlag()) {
        count += 1;
      }
    }
    return count;
  }

  averageParams(): number {
    const size = this.batch.size();
    if (size === 0) {
      return 0;
    }
    return this.batch.totalParams() / size;
  }

  describe(): string {
    return `requests=${this.batch.size()},params=${this.batch.totalParams()}`;
  }
}

function buildBatch(): RequestBatch {
  const batch = new RequestBatch();
  batch.add(new RequestBuilder(1).ability(ABILITY_MAIN).build());
  batch.add(new RequestBuilder(2).ability(ABILITY_MAIN).result(RESULT_CODE).build());
  batch.add(new RequestBuilder(3).ability(ABILITY_SERVICE).account(ACCOUNT_ID).service().build());
  batch.add(new RequestBuilder(4).ability(ABILITY_MAIN).flag(RequestFlag.NEW_TASK)
    .param('route', 'jump').build());
  batch.add(new RequestBuilder(5).ability(ABILITY_MAIN).account(ACCOUNT_ID)
    .flag(RequestFlag.CLEAR_TASK).param('mode', 'deep').param('origin', 'test').build());
  return batch;
}

export default function abilityRequestModelTest(): void {
  describe('AbilityRequestModelSuite', () => {
    let batch: RequestBatch = buildBatch();

    beforeAll(() => {
      batch = buildBatch();
      hilog.info(0x0000, 'StageModelTest', '%{public}s', 'request model suite start');
    });

    afterAll(() => {
      hilog.info(0x0000, 'StageModelTest', '%{public}s', 'request model suite end');
    });

    it('AbilityRequestModel_001', 0, async (done: Function) => {
      const request = new AbilityRequest(1, BUNDLE_NAME, MODULE_ENTRY, ABILITY_MAIN);
      expect(request.isValid()).assertTrue();
      expect(request.state).assertEqual(RequestState.DRAFT);
      expect(request.paramCount()).assertEqual(0);
      done();
    });

    it('AbilityRequestModel_002', 0, async (done: Function) => {
      const empty = new AbilityRequest(1, '', MODULE_ENTRY, ABILITY_MAIN);
      expect(empty.isValid()).assertFalse();
      const noModule = new AbilityRequest(2, BUNDLE_NAME, '', ABILITY_MAIN);
      expect(noModule.isValid()).assertFalse();
      const noAbility = new AbilityRequest(3, BUNDLE_NAME, MODULE_ENTRY, '');
      expect(noAbility.isValid()).assertFalse();
      done();
    });

    it('AbilityRequestModel_003', 0, async (done: Function) => {
      const request = new AbilityRequest(1, BUNDLE_NAME, MODULE_ENTRY, ABILITY_MAIN);
      request.withAccount(ACCOUNT_ID);
      expect(request.mode).assertEqual(RequestMode.WITH_ACCOUNT);
      expect(request.accountId).assertEqual(ACCOUNT_ID);
      expect(request.isAccountScoped()).assertTrue();
      done();
    });

    it('AbilityRequestModel_004', 0, async (done: Function) => {
      const request = new AbilityRequest(1, BUNDLE_NAME, MODULE_ENTRY, ABILITY_MAIN);
      request.withResult(RESULT_CODE);
      expect(request.mode).assertEqual(RequestMode.FOR_RESULT);
      expect(request.resultCode).assertEqual(RESULT_CODE);
      expect(request.isResultOriented()).assertTrue();
      expect(request.isService()).assertFalse();
      done();
    });

    it('AbilityRequestModel_005', 0, async (done: Function) => {
      const request = new AbilityRequest(1, BUNDLE_NAME, MODULE_ENTRY, ABILITY_SERVICE);
      request.asService();
      expect(request.mode).assertEqual(RequestMode.SERVICE);
      expect(request.isService()).assertTrue();
      expect(request.isAccountScoped()).assertFalse();
      expect(request.resultCode).assertEqual(0);
      done();
    });

    it('AbilityRequestModel_006', 0, async (done: Function) => {
      const request = new AbilityRequest(1, BUNDLE_NAME, MODULE_ENTRY, ABILITY_MAIN);
      expect(request.hasAnyFlag()).assertFalse();
      expect(request.flagCount()).assertEqual(0);
      request.addFlag(RequestFlag.NEW_TASK);
      expect(request.hasFlag(RequestFlag.NEW_TASK)).assertTrue();
      expect(request.hasFlag(RequestFlag.CLEAR_TASK)).assertFalse();
      expect(request.flagCount()).assertEqual(1);
      done();
    });

    it('AbilityRequestModel_007', 0, async (done: Function) => {
      const request = new AbilityRequest(1, BUNDLE_NAME, MODULE_ENTRY, ABILITY_MAIN);
      request.addFlag(RequestFlag.NEW_TASK).addFlag(RequestFlag.NO_ANIMATION);
      expect(request.hasAnyFlag()).assertTrue();
      expect(request.flagCount()).assertEqual(2);
      expect(request.hasFlag(RequestFlag.NEW_TASK)).assertTrue();
      expect(request.hasFlag(RequestFlag.NO_ANIMATION)).assertTrue();
      done();
    });

    it('AbilityRequestModel_008', 0, async (done: Function) => {
      const request = new AbilityRequest(1, BUNDLE_NAME, MODULE_ENTRY, ABILITY_MAIN);
      request.addFlag(RequestFlag.NEW_TASK).addFlag(RequestFlag.NEW_TASK);
      expect(request.flagCount()).assertEqual(1);
      expect(request.flagBits).assertEqual(RequestFlag.NEW_TASK);
      done();
    });

    it('AbilityRequestModel_009', 0, async (done: Function) => {
      const request = new AbilityRequest(1, BUNDLE_NAME, MODULE_ENTRY, ABILITY_MAIN);
      request.addParam('key1', 'value1');
      request.addParam('key2', 'value2');
      expect(request.paramCount()).assertEqual(2);
      expect(request.paramValue('key1')).assertEqual('value1');
      expect(request.paramValue('key2')).assertEqual('value2');
      expect(request.paramValue('missing')).assertEqual('');
      done();
    });

    it('AbilityRequestModel_010', 0, async (done: Function) => {
      const request = new AbilityRequest(1, BUNDLE_NAME, MODULE_ENTRY, ABILITY_MAIN);
      expect(request.hasParam('k')).assertFalse();
      request.addParam('k', 'v');
      expect(request.hasParam('k')).assertTrue();
      expect(request.allParams().length).assertEqual(1);
      expect(request.allParams()[0].describe()).assertEqual('k=v');
      done();
    });

    it('AbilityRequestModel_011', 0, async (done: Function) => {
      const entry = new ParamEntry('sample', 'demo');
      expect(entry.isBlank()).assertFalse();
      expect(entry.describe()).assertEqual('sample=demo');
      const blank = new ParamEntry('', 'x');
      expect(blank.isBlank()).assertTrue();
      done();
    });

    it('AbilityRequestModel_012', 0, async (done: Function) => {
      const request = new AbilityRequest(7, BUNDLE_NAME, MODULE_ENTRY, ABILITY_MAIN);
      expect(request.describe()).assertEqual(`7:${BUNDLE_NAME}/${MODULE_ENTRY}/${ABILITY_MAIN}`);
      expect(request.target()).assertEqual(`${MODULE_ENTRY}/${ABILITY_MAIN}`);
      expect(request.requestId).assertEqual(7);
      done();
    });

    it('AbilityRequestModel_013', 0, async (done: Function) => {
      const request = new AbilityRequest(1, BUNDLE_NAME, MODULE_ENTRY, ABILITY_MAIN);
      expect(request.transact(RequestState.VALIDATED)).assertTrue();
      expect(request.state).assertEqual(RequestState.VALIDATED);
      expect(request.transact(RequestState.DISPATCHED)).assertTrue();
      expect(request.state).assertEqual(RequestState.DISPATCHED);
      done();
    });

    it('AbilityRequestModel_014', 0, async (done: Function) => {
      const request = new AbilityRequest(1, BUNDLE_NAME, MODULE_ENTRY, ABILITY_MAIN);
      request.transact(RequestState.SETTLED);
      expect(request.transact(RequestState.DISPATCHED)).assertFalse();
      expect(request.state).assertEqual(RequestState.SETTLED);
      done();
    });

    it('AbilityRequestModel_015', 0, async (done: Function) => {
      const request = new AbilityRequest(1, BUNDLE_NAME, MODULE_ENTRY, ABILITY_MAIN);
      request.transact(RequestState.REJECTED);
      expect(request.transact(RequestState.VALIDATED)).assertFalse();
      expect(request.state).assertEqual(RequestState.REJECTED);
      done();
    });

    it('AbilityRequestModel_016', 0, async (done: Function) => {
      const source = new AbilityRequest(9, BUNDLE_NAME, MODULE_ENTRY, ABILITY_SERVICE);
      source.asService();
      source.addParam('a', '1');
      source.addFlag(RequestFlag.NEW_TASK);
      const copy = source.clone();
      expect(copy.equals(source)).assertTrue();
      expect(copy.isService()).assertTrue();
      expect(copy.paramCount()).assertEqual(1);
      expect(copy.flagBits).assertEqual(RequestFlag.NEW_TASK);
      done();
    });

    it('AbilityRequestModel_017', 0, async (done: Function) => {
      const source = new AbilityRequest(9, BUNDLE_NAME, MODULE_ENTRY, ABILITY_MAIN);
      source.addParam('a', '1');
      const copy = source.clone();
      copy.addParam('b', '2');
      expect(source.paramCount()).assertEqual(1);
      expect(copy.paramCount()).assertEqual(2);
      done();
    });

    it('AbilityRequestModel_018', 0, async (done: Function) => {
      const first = new AbilityRequest(1, BUNDLE_NAME, MODULE_ENTRY, ABILITY_MAIN);
      const second = new AbilityRequest(2, BUNDLE_NAME, MODULE_ENTRY, ABILITY_MAIN);
      expect(first.equals(second)).assertFalse();
      const third = new AbilityRequest(1, BUNDLE_NAME, MODULE_ENTRY, ABILITY_MAIN);
      expect(first.equals(third)).assertTrue();
      done();
    });

    it('AbilityRequestModel_019', 0, async (done: Function) => {
      const validator = new RequestValidator(2);
      expect(validator.isModuleAllowed(MODULE_ENTRY)).assertTrue();
      expect(validator.isModuleAllowed('other')).assertFalse();
      done();
    });

    it('AbilityRequestModel_020', 0, async (done: Function) => {
      const validator = new RequestValidator(2);
      const request = new AbilityRequest(1, BUNDLE_NAME, MODULE_ENTRY, ABILITY_MAIN);
      expect(validator.validate(request)).assertTrue();
      expect(validator.firstFailure(request)).assertEqual('');
      done();
    });

    it('AbilityRequestModel_021', 0, async (done: Function) => {
      const validator = new RequestValidator(1);
      const request = new AbilityRequest(1, BUNDLE_NAME, MODULE_ENTRY, ABILITY_MAIN);
      request.addParam('a', '1');
      request.addParam('b', '2');
      expect(validator.validate(request)).assertFalse();
      expect(validator.firstFailure(request)).assertEqual('tooManyParams');
      done();
    });

    it('AbilityRequestModel_022', 0, async (done: Function) => {
      const validator = new RequestValidator(5);
      const badModule = new AbilityRequest(1, BUNDLE_NAME, 'unknown', ABILITY_MAIN);
      expect(validator.validate(badModule)).assertFalse();
      expect(validator.firstFailure(badModule)).assertEqual('moduleNotAllowed');
      done();
    });

    it('AbilityRequestModel_023', 0, async (done: Function) => {
      const validator = new RequestValidator(5);
      const blank = new AbilityRequest(1, '', MODULE_ENTRY, ABILITY_MAIN);
      expect(validator.firstFailure(blank)).assertEqual('bundleName');
      const noModule = new AbilityRequest(2, BUNDLE_NAME, '', ABILITY_MAIN);
      expect(validator.firstFailure(noModule)).assertEqual('moduleName');
      done();
    });

    it('AbilityRequestModel_024', 0, async (done: Function) => {
      const validator = new RequestValidator(5);
      const noAbility = new AbilityRequest(1, BUNDLE_NAME, MODULE_ENTRY, '');
      expect(validator.firstFailure(noAbility)).assertEqual('abilityName');
      expect(validator.validate(noAbility)).assertFalse();
      done();
    });

    it('AbilityRequestModel_025', 0, async (done: Function) => {
      const built = new RequestBuilder(11).ability(ABILITY_SERVICE).account(ACCOUNT_ID).service().build();
      expect(built.requestId).assertEqual(11);
      expect(built.abilityName).assertEqual(ABILITY_SERVICE);
      expect(built.accountId).assertEqual(ACCOUNT_ID);
      expect(built.mode).assertEqual(RequestMode.SERVICE);
      done();
    });

    it('AbilityRequestModel_026', 0, async (done: Function) => {
      const built = new RequestBuilder(12).result(RESULT_CODE).param('mode', 'deep').build();
      expect(built.mode).assertEqual(RequestMode.FOR_RESULT);
      expect(built.resultCode).assertEqual(RESULT_CODE);
      expect(built.paramValue('mode')).assertEqual('deep');
      done();
    });

    it('AbilityRequestModel_027', 0, async (done: Function) => {
      const built = new RequestBuilder(13).flag(RequestFlag.NEW_TASK).flag(RequestFlag.CLEAR_TASK).build();
      expect(built.flagCount()).assertEqual(2);
      expect(built.hasFlag(RequestFlag.NEW_TASK)).assertTrue();
      expect(built.hasFlag(RequestFlag.CLEAR_TASK)).assertTrue();
      expect(built.hasFlag(RequestFlag.NO_ANIMATION)).assertFalse();
      done();
    });

    it('AbilityRequestModel_028', 0, async (done: Function) => {
      const built = new RequestBuilder(14).build();
      expect(built.bundleName).assertEqual(BUNDLE_NAME);
      expect(built.moduleName).assertEqual(MODULE_ENTRY);
      expect(built.abilityName).assertEqual(ABILITY_MAIN);
      expect(built.mode).assertEqual(RequestMode.PLAIN);
      done();
    });

    it('AbilityRequestModel_029', 0, async (done: Function) => {
      expect(batch.size()).assertEqual(5);
      expect(batch.all().length).assertEqual(5);
      expect(batch.ids().length).assertEqual(5);
      expect(batch.ids()[0]).assertEqual(1);
      expect(batch.ids()[4]).assertEqual(5);
      done();
    });

    it('AbilityRequestModel_030', 0, async (done: Function) => {
      expect(batch.serviceCount()).assertEqual(1);
      expect(batch.accountScopedCount()).assertEqual(1);
      expect(batch.totalParams()).assertEqual(3);
      done();
    });

    it('AbilityRequestModel_031', 0, async (done: Function) => {
      const validator = new RequestValidator(5);
      expect(batch.validCount(validator)).assertEqual(5);
      const strict = new RequestValidator(1);
      expect(batch.validCount(strict)).assertEqual(4);
      done();
    });

    it('AbilityRequestModel_032', 0, async (done: Function) => {
      const found = batch.findById(2);
      expect(found !== null).assertTrue();
      if (found !== null) {
        expect(found.isResultOriented()).assertTrue();
        expect(found.resultCode).assertEqual(RESULT_CODE);
      }
      expect(batch.findById(99)).assertNull();
      done();
    });

    it('AbilityRequestModel_033', 0, async (done: Function) => {
      const found = batch.findById(3);
      expect(found !== null).assertTrue();
      if (found !== null) {
        expect(found.isService()).assertTrue();
        expect(found.accountId).assertEqual(ACCOUNT_ID);
      }
      done();
    });

    it('AbilityRequestModel_034', 0, async (done: Function) => {
      const found = batch.findById(4);
      expect(found !== null).assertTrue();
      if (found !== null) {
        expect(found.hasFlag(RequestFlag.NEW_TASK)).assertTrue();
        expect(found.paramValue('route')).assertEqual('jump');
        expect(found.paramCount()).assertEqual(1);
      }
      done();
    });

    it('AbilityRequestModel_035', 0, async (done: Function) => {
      const found = batch.findById(5);
      expect(found !== null).assertTrue();
      if (found !== null) {
        expect(found.isAccountScoped()).assertTrue();
        expect(found.hasFlag(RequestFlag.CLEAR_TASK)).assertTrue();
        expect(found.paramCount()).assertEqual(2);
        expect(found.paramValue('origin')).assertEqual('test');
      }
      done();
    });

    it('AbilityRequestModel_036', 0, async (done: Function) => {
      const stats = new RequestStats(batch);
      expect(stats.modeHistogram(RequestMode.PLAIN)).assertEqual(2);
      expect(stats.modeHistogram(RequestMode.FOR_RESULT)).assertEqual(1);
      expect(stats.modeHistogram(RequestMode.SERVICE)).assertEqual(1);
      expect(stats.modeHistogram(RequestMode.WITH_ACCOUNT)).assertEqual(1);
      done();
    });

    it('AbilityRequestModel_037', 0, async (done: Function) => {
      const stats = new RequestStats(batch);
      expect(stats.flaggedRequests()).assertEqual(2);
      expect(stats.averageParams()).assertEqual(0.6);
      expect(stats.describe()).assertEqual('requests=5,params=3');
      done();
    });

    it('AbilityRequestModel_038', 0, async (done: Function) => {
      const empty = new RequestBatch();
      expect(empty.size()).assertEqual(0);
      expect(empty.serviceCount()).assertEqual(0);
      expect(empty.accountScopedCount()).assertEqual(0);
      expect(empty.totalParams()).assertEqual(0);
      expect(empty.findById(1)).assertNull();
      done();
    });

    it('AbilityRequestModel_039', 0, async (done: Function) => {
      const empty = new RequestBatch();
      const stats = new RequestStats(empty);
      expect(stats.averageParams()).assertEqual(0);
      expect(stats.flaggedRequests()).assertEqual(0);
      expect(stats.describe()).assertEqual('requests=0,params=0');
      done();
    });

    it('AbilityRequestModel_040', 0, async (done: Function) => {
      let plain = 0;
      let flagged = 0;
      for (const request of batch.all()) {
        if (request.mode === RequestMode.PLAIN) {
          plain += 1;
        }
        if (request.hasAnyFlag()) {
          flagged += 1;
        }
      }
      expect(plain).assertEqual(2);
      expect(flagged).assertEqual(2);
      done();
    });

    it('AbilityRequestModel_041', 0, async (done: Function) => {
      let paramSum = 0;
      for (const request of batch.all()) {
        paramSum += request.paramCount();
      }
      expect(paramSum).assertEqual(batch.totalParams());
      expect(paramSum).assertEqual(3);
      done();
    });

    it('AbilityRequestModel_042', 0, async (done: Function) => {
      let idSum = 0;
      for (const id of batch.ids()) {
        idSum += id;
      }
      expect(idSum).assertEqual(15);
      done();
    });

    it('AbilityRequestModel_043', 0, async (done: Function) => {
      const names: string[] = [];
      for (const request of batch.all()) {
        names.push(request.abilityName);
      }
      expect(names.length).assertEqual(5);
      expect(names[0]).assertEqual(ABILITY_MAIN);
      expect(names[2]).assertEqual(ABILITY_SERVICE);
      done();
    });

    it('AbilityRequestModel_044', 0, async (done: Function) => {
      const serviceRequests = batch.all().filter((request: AbilityRequest) => request.isService());
      expect(serviceRequests.length).assertEqual(1);
      expect(serviceRequests[0].requestId).assertEqual(3);
      done();
    });

    it('AbilityRequestModel_045', 0, async (done: Function) => {
      const targets = batch.all().map((request: AbilityRequest) => request.target());
      expect(targets.length).assertEqual(5);
      expect(targets[0]).assertEqual(`${MODULE_ENTRY}/${ABILITY_MAIN}`);
      done();
    });

    it('AbilityRequestModel_046', 0, async (done: Function) => {
      const sequential = new RequestBatch();
      let index = 0;
      for (const request of batch.all()) {
        request.transact(RequestState.VALIDATED);
        request.transact(RequestState.DISPATCHED);
        request.transact(RequestState.SETTLED);
        sequential.add(request);
        index += 1;
      }
      expect(index).assertEqual(5);
      let settled = 0;
      for (const request of sequential.all()) {
        if (request.state === RequestState.SETTLED) {
          settled += 1;
        }
      }
      expect(settled).assertEqual(5);
      done();
    });

    it('AbilityRequestModel_047', 0, async (done: Function) => {
      const request = new AbilityRequest(50, BUNDLE_NAME, MODULE_ENTRY, ABILITY_MAIN);
      expect(request.transact(RequestState.VALIDATED)).assertTrue();
      expect(request.transact(RequestState.REJECTED)).assertTrue();
      expect(request.state).assertEqual(RequestState.REJECTED);
      expect(request.transact(RequestState.SETTLED)).assertFalse();
      done();
    });

    it('AbilityRequestModel_048', 0, async (done: Function) => {
      const validator = new RequestValidator(3);
      const list: RequestBatch = new RequestBatch();
      for (let i = 1; i <= 3; i++) {
        const request = new AbilityRequest(i, BUNDLE_NAME, MODULE_ENTRY, ABILITY_MAIN);
        for (let j = 0; j < i; j++) {
          request.addParam(`k${j}`, `v${j}`);
        }
        list.add(request);
      }
      expect(list.size()).assertEqual(3);
      expect(list.totalParams()).assertEqual(6);
      expect(list.validCount(validator)).assertEqual(3);
      done();
    });

    it('AbilityRequestModel_049', 0, async (done: Function) => {
      const request = new AbilityRequest(60, BUNDLE_NAME, MODULE_ENTRY, ABILITY_MAIN);
      request.addFlag(RequestFlag.NO_ANIMATION).addFlag(RequestFlag.GRANT_PERSISTABLE);
      expect(request.hasFlag(RequestFlag.NO_ANIMATION)).assertTrue();
      expect(request.hasFlag(RequestFlag.GRANT_PERSISTABLE)).assertTrue();
      expect(request.hasFlag(RequestFlag.NEW_TASK)).assertFalse();
      expect(request.flagCount()).assertEqual(2);
      expect(request.flagBits).assertEqual(RequestFlag.NO_ANIMATION | RequestFlag.GRANT_PERSISTABLE);
      done();
    });

    it('AbilityRequestModel_050', 0, async (done: Function) => {
      const request = new AbilityRequest(61, BUNDLE_NAME, MODULE_ENTRY, ABILITY_MAIN);
      request.withAccount(ACCOUNT_ID);
      request.withResult(RESULT_CODE);
      expect(request.mode).assertEqual(RequestMode.FOR_RESULT);
      expect(request.accountId).assertEqual(ACCOUNT_ID);
      expect(request.isAccountScoped()).assertFalse();
      expect(request.isResultOriented()).assertTrue();
      done();
    });

    it('AbilityRequestModel_051', 0, async (done: Function) => {
      const requests: AbilityRequest[] = [];
      for (let i = 0; i < 4; i++) {
        const request = new AbilityRequest(i, BUNDLE_NAME, MODULE_ENTRY, ABILITY_MAIN);
        if (i % 2 === 0) {
          request.asService();
        }
        requests.push(request);
      }
      let service = 0;
      for (const request of requests) {
        if (request.isService()) {
          service += 1;
        }
      }
      expect(requests.length).assertEqual(4);
      expect(service).assertEqual(2);
      done();
    });

    it('AbilityRequestModel_052', 0, async (done: Function) => {
      const request = new AbilityRequest(70, BUNDLE_NAME, MODULE_ENTRY, ABILITY_MAIN);
      request.addParam('a', '1').addParam('b', '2').addParam('c', '3');
      expect(request.paramCount()).assertEqual(3);
      expect(request.allParams()[2].describe()).assertEqual('c=3');
      expect(request.paramValue('b')).assertEqual('2');
      done();
    });
  });
}




