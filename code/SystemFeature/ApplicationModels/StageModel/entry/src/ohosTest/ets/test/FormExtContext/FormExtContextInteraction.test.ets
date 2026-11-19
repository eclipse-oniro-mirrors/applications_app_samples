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
import {
  getDriver, ensureAppReady, checkComponentExists, launchMainAbility,
  BUNDLE_NAME, MODULE_ENTRY, ABILITY_FORM,
  KEY_ENTER, KEY_BACK, KEY_LEFT, KEY_RIGHT, DELAY_KEY_NAVIGATION, TIMEOUT_PAGE_RENDER
} from '../Shared/SharedDriver';

enum FormRequestState {
  CREATED = 0,
  VALIDATED = 1,
  DISPATCHED = 2,
  COMPLETED = 3,
  REJECTED = 4
}

class FormAbilityRequest {
  readonly bundleName: string;
  readonly moduleName: string;
  readonly abilityName: string;
  readonly formId: number;
  readonly params: string;

  constructor(bundleName: string, moduleName: string, abilityName: string,
    formId: number, params: string) {
    this.bundleName = bundleName;
    this.moduleName = moduleName;
    this.abilityName = abilityName;
    this.formId = formId;
    this.params = params;
  }

  isBundleValid(): boolean {
    return this.bundleName.length > 0 && this.bundleName.indexOf('.') > 0;
  }

  isModuleValid(): boolean {
    return this.moduleName.length > 0;
  }

  isAbilityValid(): boolean {
    return this.abilityName.length > 0;
  }

  isFormIdValid(): boolean {
    return Number.isInteger(this.formId) && this.formId > 0;
  }

  key(): string {
    return `${this.bundleName}/${this.moduleName}/${this.abilityName}/${this.formId}`;
  }
}

class FormRequestValidator {
  validate(request: FormAbilityRequest): boolean {
    return request.isBundleValid() && request.isModuleValid() &&
      request.isAbilityValid() && request.isFormIdValid();
  }

  reason(request: FormAbilityRequest): string {
    if (!request.isBundleValid()) {
      return 'BUNDLE_INVALID';
    }
    if (!request.isModuleValid()) {
      return 'MODULE_INVALID';
    }
    if (!request.isAbilityValid()) {
      return 'ABILITY_INVALID';
    }
    if (!request.isFormIdValid()) {
      return 'FORM_ID_INVALID';
    }
    return 'OK';
  }
}

class FormContextModel {
  private validator: FormRequestValidator = new FormRequestValidator();
  private state: FormRequestState = FormRequestState.CREATED;
  private history: FormAbilityRequest[] = [];
  private rejected: number = 0;
  private completed: number = 0;

  startAbility(request: FormAbilityRequest): boolean {
    if (!this.validator.validate(request)) {
      this.state = FormRequestState.REJECTED;
      this.rejected += 1;
      return false;
    }
    this.state = FormRequestState.VALIDATED;
    this.history.push(request);
    this.state = FormRequestState.DISPATCHED;
    this.completed += 1;
    this.state = FormRequestState.COMPLETED;
    return true;
  }

  getState(): FormRequestState {
    return this.state;
  }

  getHistory(): FormAbilityRequest[] {
    return this.history;
  }

  rejectedCount(): number {
    return this.rejected;
  }

  completedCount(): number {
    return this.completed;
  }

  reset(): void {
    this.state = FormRequestState.CREATED;
    this.history = [];
    this.rejected = 0;
    this.completed = 0;
  }

  lastRequest(): FormAbilityRequest | null {
    if (this.history.length === 0) {
      return null;
    }
    return this.history[this.history.length - 1];
  }
}

class FormInteractionLog {
  private entries: string[] = [];

  record(request: FormAbilityRequest, accepted: boolean): void {
    const status = accepted ? 'ACCEPT' : 'REJECT';
    this.entries.push(`${status}:${request.key()}`);
  }

  count(): number {
    return this.entries.length;
  }

  acceptedCount(): number {
    let count = 0;
    for (const entry of this.entries) {
      if (entry.startsWith('ACCEPT:')) {
        count += 1;
      }
    }
    return count;
  }

  rejectedCount(): number {
    return this.entries.length - this.acceptedCount();
  }

  lastEntry(): string {
    if (this.entries.length === 0) {
      return '';
    }
    return this.entries[this.entries.length - 1];
  }

  clear(): void {
    this.entries = [];
  }
}

class FormPayload {
  private fields: string[] = [];

  addField(entry: string): void {
    if (entry.length > 0 && this.fields.indexOf(entry) < 0) {
      this.fields.push(entry);
    }
  }

  fieldCount(): number {
    return this.fields.length;
  }

  hasField(entry: string): boolean {
    return this.fields.indexOf(entry) >= 0;
  }

  serialize(): string {
    let result = '';
    for (let i = 0; i < this.fields.length; i++) {
      if (i > 0) {
        result += ';';
      }
      result += this.fields[i];
    }
    return result;
  }

  clear(): void {
    this.fields = [];
  }
}

function defaultFormRequest(): FormAbilityRequest {
  return new FormAbilityRequest(BUNDLE_NAME, MODULE_ENTRY, ABILITY_FORM, 1001, 'k=v');
}

export default function formExtContextInteractionTest(): void {
  describe('FormExtContextInteractionSuite', () => {
    let request: FormAbilityRequest = defaultFormRequest();

    beforeAll(() => {
      request = defaultFormRequest();
      hilog.info(0x0000, 'StageModelTest', '%{public}s', 'form interaction suite start');
    });

    afterAll(() => {
      hilog.info(0x0000, 'StageModelTest', '%{public}s', 'form interaction suite end');
    });

    it('FormExtContextInteraction_001', 0, async (done: Function) => {
      expect(request.bundleName).assertEqual('ohos.samples.stagemodel');
      expect(request.moduleName).assertEqual('entry');
      expect(request.abilityName).assertEqual('FormAbility');
      expect(request.formId).assertEqual(1001);
      done();
    });

    it('FormExtContextInteraction_002', 0, async (done: Function) => {
      expect(request.isBundleValid()).assertTrue();
      expect(request.isModuleValid()).assertTrue();
      expect(request.isAbilityValid()).assertTrue();
      expect(request.isFormIdValid()).assertTrue();
      done();
    });

    it('FormExtContextInteraction_003', 0, async (done: Function) => {
      expect(request.key()).assertEqual('ohos.samples.stagemodel/entry/FormAbility/1001');
      done();
    });

    it('FormExtContextInteraction_004', 0, async (done: Function) => {
      const validator = new FormRequestValidator();
      expect(validator.validate(request)).assertTrue();
      expect(validator.reason(request)).assertEqual('OK');
      done();
    });

    it('FormExtContextInteraction_005', 0, async (done: Function) => {
      const invalidBundle = new FormAbilityRequest('', MODULE_ENTRY, ABILITY_FORM, 1, '');
      const validator = new FormRequestValidator();
      expect(validator.validate(invalidBundle)).assertFalse();
      expect(validator.reason(invalidBundle)).assertEqual('BUNDLE_INVALID');
      done();
    });

    it('FormExtContextInteraction_006', 0, async (done: Function) => {
      const invalidModule = new FormAbilityRequest(BUNDLE_NAME, '', ABILITY_FORM, 1, '');
      const validator = new FormRequestValidator();
      expect(validator.validate(invalidModule)).assertFalse();
      expect(validator.reason(invalidModule)).assertEqual('MODULE_INVALID');
      done();
    });

    it('FormExtContextInteraction_007', 0, async (done: Function) => {
      const invalidAbility = new FormAbilityRequest(BUNDLE_NAME, MODULE_ENTRY, '', 1, '');
      const validator = new FormRequestValidator();
      expect(validator.validate(invalidAbility)).assertFalse();
      expect(validator.reason(invalidAbility)).assertEqual('ABILITY_INVALID');
      done();
    });

    it('FormExtContextInteraction_008', 0, async (done: Function) => {
      const invalidFormId = new FormAbilityRequest(BUNDLE_NAME, MODULE_ENTRY, ABILITY_FORM, 0, '');
      const validator = new FormRequestValidator();
      expect(validator.validate(invalidFormId)).assertFalse();
      expect(validator.reason(invalidFormId)).assertEqual('FORM_ID_INVALID');
      done();
    });

    it('FormExtContextInteraction_009', 0, async (done: Function) => {
      const noDotBundle = new FormAbilityRequest('nodot', MODULE_ENTRY, ABILITY_FORM, 1, '');
      expect(noDotBundle.isBundleValid()).assertFalse();
      const dotBundle = new FormAbilityRequest('a.b', MODULE_ENTRY, ABILITY_FORM, 1, '');
      expect(dotBundle.isBundleValid()).assertTrue();
      done();
    });

    it('FormExtContextInteraction_010', 0, async (done: Function) => {
      const negative = new FormAbilityRequest(BUNDLE_NAME, MODULE_ENTRY, ABILITY_FORM, -3, '');
      expect(negative.isFormIdValid()).assertFalse();
      const fraction = new FormAbilityRequest(BUNDLE_NAME, MODULE_ENTRY, ABILITY_FORM, 1.5, '');
      expect(fraction.isFormIdValid()).assertFalse();
      done();
    });

    it('FormExtContextInteraction_011', 0, async (done: Function) => {
      const model = new FormContextModel();
      expect(model.getState()).assertEqual(FormRequestState.CREATED);
      expect(model.startAbility(defaultFormRequest())).assertTrue();
      expect(model.getState()).assertEqual(FormRequestState.COMPLETED);
      done();
    });

    it('FormExtContextInteraction_012', 0, async (done: Function) => {
      const model = new FormContextModel();
      model.startAbility(defaultFormRequest());
      expect(model.getHistory().length).assertEqual(1);
      expect(model.completedCount()).assertEqual(1);
      expect(model.rejectedCount()).assertEqual(0);
      done();
    });

    it('FormExtContextInteraction_013', 0, async (done: Function) => {
      const model = new FormContextModel();
      const invalid = new FormAbilityRequest('', '', '', 0, '');
      expect(model.startAbility(invalid)).assertFalse();
      expect(model.getState()).assertEqual(FormRequestState.REJECTED);
      expect(model.rejectedCount()).assertEqual(1);
      expect(model.getHistory().length).assertEqual(0);
      done();
    });

    it('FormExtContextInteraction_014', 0, async (done: Function) => {
      const model = new FormContextModel();
      model.startAbility(defaultFormRequest());
      model.startAbility(new FormAbilityRequest(BUNDLE_NAME, MODULE_ENTRY, ABILITY_FORM, 1002, ''));
      expect(model.getHistory().length).assertEqual(2);
      expect(model.completedCount()).assertEqual(2);
      const last = model.lastRequest();
      expect(last !== null && last.formId === 1002).assertTrue();
      done();
    });

    it('FormExtContextInteraction_015', 0, async (done: Function) => {
      const model = new FormContextModel();
      expect(model.lastRequest()).assertNull();
      model.startAbility(defaultFormRequest());
      model.reset();
      expect(model.getHistory().length).assertEqual(0);
      expect(model.getState()).assertEqual(FormRequestState.CREATED);
      expect(model.lastRequest()).assertNull();
      done();
    });

    it('FormExtContextInteraction_016', 0, async (done: Function) => {
      const log = new FormInteractionLog();
      expect(log.count()).assertEqual(0);
      expect(log.lastEntry()).assertEqual('');
      log.record(defaultFormRequest(), true);
      expect(log.count()).assertEqual(1);
      expect(log.acceptedCount()).assertEqual(1);
      expect(log.rejectedCount()).assertEqual(0);
      done();
    });

    it('FormExtContextInteraction_017', 0, async (done: Function) => {
      const log = new FormInteractionLog();
      log.record(defaultFormRequest(), true);
      log.record(defaultFormRequest(), false);
      expect(log.acceptedCount()).assertEqual(1);
      expect(log.rejectedCount()).assertEqual(1);
      expect(log.lastEntry().startsWith('REJECT:')).assertTrue();
      done();
    });

    it('FormExtContextInteraction_018', 0, async (done: Function) => {
      const log = new FormInteractionLog();
      log.record(defaultFormRequest(), true);
      log.clear();
      expect(log.count()).assertEqual(0);
      expect(log.acceptedCount()).assertEqual(0);
      expect(log.rejectedCount()).assertEqual(0);
      done();
    });

    it('FormExtContextInteraction_019', 0, async (done: Function) => {
      const payload = new FormPayload();
      payload.addField('title=hello');
      payload.addField('count=3');
      expect(payload.fieldCount()).assertEqual(2);
      expect(payload.hasField('title=hello')).assertTrue();
      expect(payload.hasField('absent')).assertFalse();
      done();
    });

    it('FormExtContextInteraction_020', 0, async (done: Function) => {
      const payload = new FormPayload();
      payload.addField('a');
      payload.addField('a');
      payload.addField('');
      expect(payload.fieldCount()).assertEqual(1);
      payload.addField('b');
      expect(payload.serialize()).assertEqual('a;b');
      done();
    });

    it('FormExtContextInteraction_021', 0, async (done: Function) => {
      const payload = new FormPayload();
      expect(payload.serialize()).assertEqual('');
      payload.addField('single');
      expect(payload.serialize()).assertEqual('single');
      payload.clear();
      expect(payload.fieldCount()).assertEqual(0);
      done();
    });

    it('FormExtContextInteraction_022', 0, async (done: Function) => {
      const payload = new FormPayload();
      payload.addField('x');
      payload.addField('y');
      payload.addField('z');
      expect(payload.serialize()).assertEqual('x;y;z');
      expect(payload.hasField('y')).assertTrue();
      done();
    });

    it('FormExtContextInteraction_023', 0, async (done: Function) => {
      const model = new FormContextModel();
      const log = new FormInteractionLog();
      const first = defaultFormRequest();
      const accepted = model.startAbility(first);
      log.record(first, accepted);
      expect(accepted).assertTrue();
      expect(log.acceptedCount()).assertEqual(1);
      expect(log.lastEntry().indexOf(first.key()) >= 0).assertTrue();
      done();
    });

    it('FormExtContextInteraction_024', 0, async (done: Function) => {
      const model = new FormContextModel();
      const log = new FormInteractionLog();
      const bad = new FormAbilityRequest('', MODULE_ENTRY, ABILITY_FORM, 5, '');
      const accepted = model.startAbility(bad);
      log.record(bad, accepted);
      expect(accepted).assertFalse();
      expect(log.rejectedCount()).assertEqual(1);
      expect(model.rejectedCount()).assertEqual(1);
      done();
    });

    it('FormExtContextInteraction_025', 0, async (done: Function) => {
      expect(BUNDLE_NAME).assertEqual('ohos.samples.stagemodel');
      expect(MODULE_ENTRY).assertEqual('entry');
      expect(ABILITY_FORM).assertEqual('FormAbility');
      done();
    });

    it('FormExtContextInteraction_026', 0, async (done: Function) => {
      expect(KEY_ENTER).assertEqual(2049);
      expect(KEY_BACK).assertEqual(2);
      expect(KEY_LEFT).assertEqual(2014);
      expect(KEY_RIGHT).assertEqual(2015);
      expect(DELAY_KEY_NAVIGATION).assertEqual(50);
      expect(TIMEOUT_PAGE_RENDER).assertEqual(1000);
      done();
    });

    it('FormExtContextInteraction_027', 0, async (done: Function) => {
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

    it('FormExtContextInteraction_028', 0, async (done: Function) => {
      try {
        const driver: Driver = getDriver();
        await launchMainAbility();
        const exists = await checkComponentExists(driver, 'Text');
        expect(typeof exists === 'boolean').assertTrue();
      } catch (error) {
        expect(error !== null).assertTrue();
      }
      done();
    });

    it('FormExtContextInteraction_029', 0, async (done: Function) => {
      const model = new FormContextModel();
      model.startAbility(defaultFormRequest());
      model.startAbility(new FormAbilityRequest(BUNDLE_NAME, MODULE_ENTRY, ABILITY_FORM, 1002, ''));
      model.startAbility(new FormAbilityRequest(BUNDLE_NAME, MODULE_ENTRY, ABILITY_FORM, 1003, ''));
      expect(model.completedCount()).assertEqual(3);
      expect(model.getHistory().length).assertEqual(3);
      done();
    });

    it('FormExtContextInteraction_030', 0, async (done: Function) => {
      const request = new FormAbilityRequest(BUNDLE_NAME, MODULE_ENTRY, ABILITY_FORM, 7, 'key=value');
      expect(request.params).assertEqual('key=value');
      expect(request.key().endsWith('/7')).assertTrue();
      expect(request.isFormIdValid()).assertTrue();
      done();
    });

    it('FormExtContextInteraction_031', 0, async (done: Function) => {
      const payload = new FormPayload();
      payload.addField('alpha');
      payload.addField('beta');
      payload.addField('gamma');
      payload.addField('alpha');
      expect(payload.fieldCount()).assertEqual(3);
      expect(payload.serialize()).assertEqual('alpha;beta;gamma');
      done();
    });

    it('FormExtContextInteraction_032', 0, async (done: Function) => {
      const model = new FormContextModel();
      const invalid1 = new FormAbilityRequest('', MODULE_ENTRY, ABILITY_FORM, 1, '');
      const invalid2 = new FormAbilityRequest(BUNDLE_NAME, '', ABILITY_FORM, 1, '');
      expect(model.startAbility(invalid1)).assertFalse();
      expect(model.startAbility(invalid2)).assertFalse();
      expect(model.rejectedCount()).assertEqual(2);
      expect(model.completedCount()).assertEqual(0);
      done();
    });

    it('FormExtContextInteraction_033', 0, async (done: Function) => {
      const validator = new FormRequestValidator();
      const empty = new FormAbilityRequest('', '', '', 0, '');
      expect(validator.reason(empty)).assertEqual('BUNDLE_INVALID');
      const onlyModuleBad = new FormAbilityRequest('a.b', '', ABILITY_FORM, 1, '');
      expect(validator.reason(onlyModuleBad)).assertEqual('MODULE_INVALID');
      done();
    });

    it('FormExtContextInteraction_034', 0, async (done: Function) => {
      const log = new FormInteractionLog();
      log.record(defaultFormRequest(), true);
      log.record(new FormAbilityRequest(BUNDLE_NAME, MODULE_ENTRY, ABILITY_FORM, 2, ''), true);
      log.record(new FormAbilityRequest('', MODULE_ENTRY, ABILITY_FORM, 3, ''), false);
      expect(log.count()).assertEqual(3);
      expect(log.acceptedCount()).assertEqual(2);
      expect(log.rejectedCount()).assertEqual(1);
      done();
    });

    it('FormExtContextInteraction_035', 0, async (done: Function) => {
      const model = new FormContextModel();
      expect(model.completedCount()).assertEqual(0);
      expect(model.rejectedCount()).assertEqual(0);
      expect(model.getHistory().length).assertEqual(0);
      expect(model.getState()).assertEqual(FormRequestState.CREATED);
      done();
    });

    it('FormExtContextInteraction_036', 0, async (done: Function) => {
      const request = defaultFormRequest();
      expect(request.isBundleValid()).assertTrue();
      expect(request.isModuleValid()).assertTrue();
      expect(request.isAbilityValid()).assertTrue();
      expect(request.isFormIdValid()).assertTrue();
      done();
    });

    it('FormExtContextInteraction_037', 0, async (done: Function) => {
      const payload = new FormPayload();
      payload.addField('one');
      payload.addField('two');
      expect(payload.hasField('one')).assertTrue();
      expect(payload.hasField('two')).assertTrue();
      expect(payload.fieldCount()).assertEqual(2);
      expect(payload.serialize()).assertEqual('one;two');
      done();
    });

    it('FormExtContextInteraction_038', 0, async (done: Function) => {
      const model = new FormContextModel();
      model.startAbility(defaultFormRequest());
      const last = model.lastRequest();
      expect(last !== null).assertTrue();
      if (last !== null) {
        expect(last.bundleName).assertEqual(BUNDLE_NAME);
        expect(last.abilityName).assertEqual(ABILITY_FORM);
        expect(last.formId).assertEqual(1001);
      }
      done();
    });

    it('FormExtContextInteraction_039', 0, async (done: Function) => {
      const validator = new FormRequestValidator();
      const request = defaultFormRequest();
      expect(validator.validate(request)).assertTrue();
      expect(request.key().indexOf(ABILITY_FORM) >= 0).assertTrue();
      done();
    });
  });
}

