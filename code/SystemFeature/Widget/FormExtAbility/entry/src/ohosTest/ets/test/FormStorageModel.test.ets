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
import { describe, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import dataStorage from '@ohos.data.storage';
import FormAbility from '../../../main/ets/FormAbility/FormAbility';
import type Want from '@ohos.app.ability.Want';

const DOMAIN: number = 0xF814;
const TAG: string = 'FormStorageModelTest';

const DATA_STORAGE_PATH: string = '/data/storage/el2/base/haps/form_store';
const DEFAULT_FORM_INFO_JSON: string = '{"formName":"","tempFlag":false,"updateCount":0}';

const POLL_RETRY: number = 20;
const POLL_INTERVAL: number = 250;

function log(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

function sleep(duration: number): Promise<void> {
  return new Promise<void>((resolve: () => void) => {
    setTimeout(() => {
      resolve();
    }, duration);
  });
}

async function getFormStore() {
  return await dataStorage.getStorage(DATA_STORAGE_PATH);
}

async function readStoredFormInfo(formId: string): Promise<string> {
  const storage = await getFormStore();
  const data = await storage.get(formId, DEFAULT_FORM_INFO_JSON);
  return data.toString();
}

async function waitForStoredValue(formId: string, expected: string): Promise<boolean> {
  for (let i: number = 0; i < POLL_RETRY; i++) {
    const value: string = await readStoredFormInfo(formId);
    if (value === expected) {
      return true;
    }
    await sleep(POLL_INTERVAL);
  }
  const finalValue: string = await readStoredFormInfo(formId);
  return finalValue === expected;
}

async function waitForStoredContain(formId: string, fragment: string): Promise<boolean> {
  for (let i: number = 0; i < POLL_RETRY; i++) {
    const value: string = await readStoredFormInfo(formId);
    if (value.includes(fragment)) {
      return true;
    }
    await sleep(POLL_INTERVAL);
  }
  const finalValue: string = await readStoredFormInfo(formId);
  return finalValue.includes(fragment);
}

function buildAddFormWant(formId: string, formName: string, tempFlag: boolean): Want {
  let want: Want = {
    parameters: {
      'ohos.extra.param.key.form_identity': formId,
      'ohos.extra.param.key.form_name': formName,
      'ohos.extra.param.key.form_temporary': tempFlag
    }
  };
  return want;
}

export default function formStorageModelTest(): void {
  describe('FormStorageModelTest', () => {
    /**
     * @tc.number    SUB_FORMEXTABILITY_STORAGE_0301
     * @tc.name      testFormStorage0301
     * @tc.desc      Verify the form store preferences instance can be opened in the test process.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormStorage0301', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormStorage0301 begin');
      const storage = await getFormStore();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${storage !== null && storage !== undefined}`);
      expect(storage !== null && storage !== undefined).assertTrue();
      log('testFormStorage0301 end');
    })

    /**
     * @tc.number    SUB_FORMEXTABILITY_STORAGE_0302
     * @tc.name      testFormStorage0302
     * @tc.desc      Verify a string value round-trips through put and get on the form store.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormStorage0302', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormStorage0302 begin');
      const storage = await getFormStore();
      await storage.put('ut_direct_string', 'value-0302');
      await storage.flush();
      const data = await storage.get('ut_direct_string', 'default');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual data.toString()=${data.toString()}, expected='value-0302'`);
      expect(data.toString()).assertEqual('value-0302');
      log('testFormStorage0302 end');
    })

    /**
     * @tc.number    SUB_FORMEXTABILITY_STORAGE_0303
     * @tc.name      testFormStorage0303
     * @tc.desc      Verify getting a missing key returns the provided default form info json.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormStorage0303', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormStorage0303 begin');
      const storage = await getFormStore();
      const data = await storage.get('ut_direct_missing', DEFAULT_FORM_INFO_JSON);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual data.toString()=${data.toString()}`);
      expect(data.toString()).assertEqual(DEFAULT_FORM_INFO_JSON);
      log('testFormStorage0303 end');
    })

    /**
     * @tc.number    SUB_FORMEXTABILITY_STORAGE_0304
     * @tc.name      testFormStorage0304
     * @tc.desc      Verify putting the same key again overwrites the previous value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormStorage0304', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormStorage0304 begin');
      const storage = await getFormStore();
      await storage.put('ut_direct_overwrite', 'first');
      await storage.flush();
      await storage.put('ut_direct_overwrite', 'second');
      await storage.flush();
      const data = await storage.get('ut_direct_overwrite', 'default');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual data.toString()=${data.toString()}, expected='second'`);
      expect(data.toString()).assertEqual('second');
      log('testFormStorage0304 end');
    })

    /**
     * @tc.number    SUB_FORMEXTABILITY_STORAGE_0305
     * @tc.name      testFormStorage0305
     * @tc.desc      Verify a deleted key falls back to the default form info json.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormStorage0305', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormStorage0305 begin');
      const storage = await getFormStore();
      await storage.put('ut_direct_delete', 'value-0305');
      await storage.flush();
      await storage.delete('ut_direct_delete');
      await storage.flush();
      const data = await storage.get('ut_direct_delete', DEFAULT_FORM_INFO_JSON);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual data.toString()=${data.toString()}`);
      expect(data.toString()).assertEqual(DEFAULT_FORM_INFO_JSON);
      log('testFormStorage0305 end');
    })

    /**
     * @tc.number    SUB_FORMEXTABILITY_STORAGE_0306
     * @tc.name      testFormStorage0306
     * @tc.desc      Verify a boolean value round-trips through put and get.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormStorage0306', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormStorage0306 begin');
      const storage = await getFormStore();
      await storage.put('ut_direct_bool', true);
      await storage.flush();
      const data = await storage.get('ut_direct_bool', false);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual data.toString()=${data.toString()}, expected='true'`);
      expect(data.toString()).assertEqual('true');
      log('testFormStorage0306 end');
    })

    /**
     * @tc.number    SUB_FORMEXTABILITY_STORAGE_0307
     * @tc.name      testFormStorage0307
     * @tc.desc      Verify a number value round-trips through put and get.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormStorage0307', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormStorage0307 begin');
      const storage = await getFormStore();
      await storage.put('ut_direct_number', 7);
      await storage.flush();
      const data = await storage.get('ut_direct_number', 0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual data.toString()=${data.toString()}, expected='7'`);
      expect(data.toString()).assertEqual('7');
      log('testFormStorage0307 end');
    })

    /**
     * @tc.number    SUB_FORMEXTABILITY_STORAGE_0308
     * @tc.name      testFormStorage0308
     * @tc.desc      Verify flush on the form store completes without throwing.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormStorage0308', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormStorage0308 begin');
      const storage = await getFormStore();
      await storage.flush();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue true=${true}`);
      expect(true).assertTrue();
      log('testFormStorage0308 end');
    })

    /**
     * @tc.number    SUB_FORMEXTABILITY_STORAGE_0309
     * @tc.name      testFormStorage0309
     * @tc.desc      Verify two getStorage calls observe the same stored value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormStorage0309', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormStorage0309 begin');
      const first = await getFormStore();
      await first.put('ut_direct_shared', 'shared-0309');
      await first.flush();
      const second = await getFormStore();
      const data = await second.get('ut_direct_shared', 'default');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual data.toString()=${data.toString()}, expected='shared-0309'`);
      expect(data.toString()).assertEqual('shared-0309');
      log('testFormStorage0309 end');
    })

    /**
     * @tc.number    SUB_FORMEXTABILITY_STORAGE_0310
     * @tc.name      testFormStorage0310
     * @tc.desc      Verify a serialized form info json round-trips as a string value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormStorage0310', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormStorage0310 begin');
      const storage = await getFormStore();
      const formInfoJson: string = '{"formName":"Weather","tempFlag":true,"updateCount":0}';
      await storage.put('ut_direct_json', formInfoJson);
      await storage.flush();
      const data = await storage.get('ut_direct_json', DEFAULT_FORM_INFO_JSON);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual data.toString()=${data.toString()}, expected=formInfoJson`);
      expect(data.toString()).assertEqual(formInfoJson);
      log('testFormStorage0310 end');
    })

    /**
     * @tc.number    SUB_FORMEXTABILITY_STORAGE_0311
     * @tc.name      testFormStorage0311
     * @tc.desc      Verify writes to different keys do not interfere with each other.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormStorage0311', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormStorage0311 begin');
      const storage = await getFormStore();
      await storage.put('ut_direct_key_a', 'value-a');
      await storage.put('ut_direct_key_b', 'value-b');
      await storage.flush();
      const dataA = await storage.get('ut_direct_key_a', 'default');
      const dataB = await storage.get('ut_direct_key_b', 'default');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual dataA.toString()=${dataA.toString()}, expected='value-a'`);
      expect(dataA.toString()).assertEqual('value-a');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual dataB.toString()=${dataB.toString()}, expected='value-b'`);
      expect(dataB.toString()).assertEqual('value-b');
      log('testFormStorage0311 end');
    })

    /**
     * @tc.number    SUB_FORMEXTABILITY_STORAGE_0312
     * @tc.name      testFormStorage0312
     * @tc.desc      Verify multiple keys can be deleted independently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormStorage0312', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormStorage0312 begin');
      const storage = await getFormStore();
      await storage.put('ut_direct_del_a', 'value-a');
      await storage.put('ut_direct_del_b', 'value-b');
      await storage.flush();
      await storage.delete('ut_direct_del_a');
      await storage.flush();
      const dataA = await storage.get('ut_direct_del_a', 'gone');
      const dataB = await storage.get('ut_direct_del_b', 'gone');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual dataA.toString()=${dataA.toString()}, expected='gone'`);
      expect(dataA.toString()).assertEqual('gone');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual dataB.toString()=${dataB.toString()}, expected='value-b'`);
      expect(dataB.toString()).assertEqual('value-b');
      log('testFormStorage0312 end');
    })

    /**
     * @tc.number    SUB_FORMEXTABILITY_STORAGE_0313
     * @tc.name      testFormStorage0313
     * @tc.desc      Verify onAddForm persists the stored form name for id 6101.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormStorage0313', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormStorage0313 begin');
      const formAbility = new FormAbility();
      formAbility.onAddForm(buildAddFormWant('6101', 'Weather', false));
      const actual1: boolean = await waitForStoredContain('6101', '"formName":"Weather"');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${actual1}`);
      expect(actual1).assertTrue();
      log('testFormStorage0313 end');
    })

    /**
     * @tc.number    SUB_FORMEXTABILITY_STORAGE_0314
     * @tc.name      testFormStorage0314
     * @tc.desc      Verify onAddForm persists tempFlag true for a temporary form.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormStorage0314', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormStorage0314 begin');
      const formAbility = new FormAbility();
      formAbility.onAddForm(buildAddFormWant('6102', 'Weather', true));
      const actual2: boolean = await waitForStoredContain('6102', '"tempFlag":true');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue waitForStoredContain('6102', '"tempFlag":true')=${actual2}`);
      expect(actual2).assertTrue();
      log('testFormStorage0314 end');
    })

    /**
     * @tc.number    SUB_FORMEXTABILITY_STORAGE_0315
     * @tc.name      testFormStorage0315
     * @tc.desc      Verify onAddForm persists tempFlag false for a normal form.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormStorage0315', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormStorage0315 begin');
      const formAbility = new FormAbility();
      formAbility.onAddForm(buildAddFormWant('6103', 'Weather', false));
      const actual3: boolean = await waitForStoredContain('6103', '"tempFlag":false');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue waitForStoredContain('6103', '"tempFlag":false')=${actual3}`);
      expect(actual3).assertTrue();
      log('testFormStorage0315 end');
    })

    /**
     * @tc.number    SUB_FORMEXTABILITY_STORAGE_0316
     * @tc.name      testFormStorage0316
     * @tc.desc      Verify a freshly added form is stored with updateCount zero.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormStorage0316', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormStorage0316 begin');
      const formAbility = new FormAbility();
      formAbility.onAddForm(buildAddFormWant('6104', 'Weather', false));
      const actual4: boolean = await waitForStoredContain('6104', '"updateCount":0');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue waitForStoredContain('6104', '"updateCount":0')=${actual4}`);
      expect(actual4).assertTrue();
      log('testFormStorage0316 end');
    })

    /**
     * @tc.number    SUB_FORMEXTABILITY_STORAGE_0317
     * @tc.name      testFormStorage0317
     * @tc.desc      Verify onUpdateForm increments the persisted updateCount to one.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormStorage0317', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormStorage0317 begin');
      const formAbility = new FormAbility();
      formAbility.onAddForm(buildAddFormWant('6105', 'Weather', false));
      const actual5: boolean = await waitForStoredContain('6105', '"formName":"Weather"');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${actual5}`);
      expect(actual5).assertTrue();
      formAbility.onUpdateForm('6105');
      const actual6: boolean = await waitForStoredContain('6105', '"updateCount":1');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue waitForStoredContain('6105', '"updateCount":1')=${actual6}`);
      expect(actual6).assertTrue();
      log('testFormStorage0317 end');
    })

    /**
     * @tc.number    SUB_FORMEXTABILITY_STORAGE_0318
     * @tc.name      testFormStorage0318
     * @tc.desc      Verify onUpdateForm on an unknown form id stores updateCount one.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormStorage0318', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormStorage0318 begin');
      const formAbility = new FormAbility();
      formAbility.onUpdateForm('6106');
      const actual7: boolean = await waitForStoredContain('6106', '"updateCount":1');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue waitForStoredContain('6106', '"updateCount":1')=${actual7}`);
      expect(actual7).assertTrue();
      log('testFormStorage0318 end');
    })

    /**
     * @tc.number    SUB_FORMEXTABILITY_STORAGE_0319
     * @tc.name      testFormStorage0319
     * @tc.desc      Verify repeated onUpdateForm calls keep incrementing updateCount.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormStorage0319', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormStorage0319 begin');
      const formAbility = new FormAbility();
      formAbility.onUpdateForm('6107');
      const actual8: boolean = await waitForStoredContain('6107', '"updateCount":1');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue waitForStoredContain('6107', '"updateCount":1')=${actual8}`);
      expect(actual8).assertTrue();
      formAbility.onUpdateForm('6107');
      const actual9: boolean = await waitForStoredContain('6107', '"updateCount":2');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue waitForStoredContain('6107', '"updateCount":2')=${actual9}`);
      expect(actual9).assertTrue();
      log('testFormStorage0319 end');
    })

    /**
     * @tc.number    SUB_FORMEXTABILITY_STORAGE_0320
     * @tc.name      testFormStorage0320
     * @tc.desc      Verify onCastToNormalForm clears the temporary flag of a stored form.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormStorage0320', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormStorage0320 begin');
      const formAbility = new FormAbility();
      formAbility.onAddForm(buildAddFormWant('6108', 'Weather', true));
      const actual10: boolean = await waitForStoredContain('6108', '"tempFlag":true');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue waitForStoredContain('6108', '"tempFlag":true')=${actual10}`);
      expect(actual10).assertTrue();
      formAbility.onCastToNormalForm('6108');
      const actual11: boolean = await waitForStoredContain('6108', '"tempFlag":false');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue waitForStoredContain('6108', '"tempFlag":false')=${actual11}`);
      expect(actual11).assertTrue();
      log('testFormStorage0320 end');
    })

    /**
     * @tc.number    SUB_FORMEXTABILITY_STORAGE_0321
     * @tc.name      testFormStorage0321
     * @tc.desc      Verify onCastToNormalForm keeps a normal form flag unchanged.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormStorage0321', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormStorage0321 begin');
      const formAbility = new FormAbility();
      formAbility.onAddForm(buildAddFormWant('6109', 'Weather', false));
      const actual12: boolean = await waitForStoredContain('6109', '"tempFlag":false');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue waitForStoredContain('6109', '"tempFlag":false')=${actual12}`);
      expect(actual12).assertTrue();
      formAbility.onCastToNormalForm('6109');
      await sleep(POLL_INTERVAL);
      const actual13: boolean = await waitForStoredContain('6109', '"tempFlag":false');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue waitForStoredContain('6109', '"tempFlag":false')=${actual13}`);
      expect(actual13).assertTrue();
      log('testFormStorage0321 end');
    })

    /**
     * @tc.number    SUB_FORMEXTABILITY_STORAGE_0322
     * @tc.name      testFormStorage0322
     * @tc.desc      Verify onRemoveForm deletes the stored record back to the default json.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormStorage0322', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormStorage0322 begin');
      const formAbility = new FormAbility();
      formAbility.onAddForm(buildAddFormWant('6110', 'Weather', false));
      const actual14: boolean = await waitForStoredContain('6110', '"formName":"Weather"');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${actual14}`);
      expect(actual14).assertTrue();
      formAbility.onRemoveForm('6110');
      const actual15: boolean = await waitForStoredValue('6110', DEFAULT_FORM_INFO_JSON);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${actual15}`);
      expect(actual15).assertTrue();
      log('testFormStorage0322 end');
    })

    /**
     * @tc.number    SUB_FORMEXTABILITY_STORAGE_0323
     * @tc.name      testFormStorage0323
     * @tc.desc      Verify removing a form id that was never stored keeps the default value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormStorage0323', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormStorage0323 begin');
      const formAbility = new FormAbility();
      formAbility.onRemoveForm('6111');
      await sleep(POLL_INTERVAL);
      const value: string = await readStoredFormInfo('6111');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value=${value}, expected=DEFAULT_FORM_INFO_JSON`);
      expect(value).assertEqual(DEFAULT_FORM_INFO_JSON);
      log('testFormStorage0323 end');
    })

    /**
     * @tc.number    SUB_FORMEXTABILITY_STORAGE_0324
     * @tc.name      testFormStorage0324
     * @tc.desc      Verify a Chinese form name round-trips through the form store.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormStorage0324', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormStorage0324 begin');
      const formAbility = new FormAbility();
      formAbility.onAddForm(buildAddFormWant('6112', '温度卡片', false));
      const actual16: boolean = await waitForStoredContain('6112', '"formName":"温度卡片"');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue waitForStoredContain('6112', '"formName":"温度卡片"')=${actual16}`);
      expect(actual16).assertTrue();
      log('testFormStorage0324 end');
    })

    /**
     * @tc.number    SUB_FORMEXTABILITY_STORAGE_0325
     * @tc.name      testFormStorage0325
     * @tc.desc      Verify an empty form name is persisted as an empty string field.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormStorage0325', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormStorage0325 begin');
      const formAbility = new FormAbility();
      formAbility.onAddForm(buildAddFormWant('6113', '', true));
      const actual17: boolean = await waitForStoredValue('6113', '{"formName":"","tempFlag":true,"updateCount":0}');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${actual17}`);
      expect(actual17).assertTrue();
      log('testFormStorage0325 end');
    })

    /**
     * @tc.number    SUB_FORMEXTABILITY_STORAGE_0326
     * @tc.name      testFormStorage0326
     * @tc.desc      Verify a long form name is persisted without truncation.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormStorage0326', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormStorage0326 begin');
      const formAbility = new FormAbility();
      let longName: string = '';
      for (let i: number = 0; i < 50; i++) {
        longName = longName + 'Name';
      }
      formAbility.onAddForm(buildAddFormWant('6114', longName, false));
      const actual18: boolean = await waitForStoredContain('6114', `"formName":"${longName}"`);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${actual18}`);
      expect(actual18).assertTrue();
      log('testFormStorage0326 end');
    })

    /**
     * @tc.number    SUB_FORMEXTABILITY_STORAGE_0327
     * @tc.name      testFormStorage0327
     * @tc.desc      Verify adding the same form id again resets the stored updateCount.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormStorage0327', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormStorage0327 begin');
      const formAbility = new FormAbility();
      formAbility.onAddForm(buildAddFormWant('6115', 'Weather', false));
      const actual19: boolean = await waitForStoredContain('6115', '"formName":"Weather"');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${actual19}`);
      expect(actual19).assertTrue();
      formAbility.onUpdateForm('6115');
      const actual20: boolean = await waitForStoredContain('6115', '"updateCount":1');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue waitForStoredContain('6115', '"updateCount":1')=${actual20}`);
      expect(actual20).assertTrue();
      formAbility.onAddForm(buildAddFormWant('6115', 'Weather', false));
      const actual21: boolean = await waitForStoredContain('6115', '"updateCount":0');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue waitForStoredContain('6115', '"updateCount":0')=${actual21}`);
      expect(actual21).assertTrue();
      log('testFormStorage0327 end');
    })

    /**
     * @tc.number    SUB_FORMEXTABILITY_STORAGE_0328
     * @tc.name      testFormStorage0328
     * @tc.desc      Verify a deleted form id can be stored again by onAddForm.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormStorage0328', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormStorage0328 begin');
      const formAbility = new FormAbility();
      formAbility.onAddForm(buildAddFormWant('6116', 'Weather', false));
      const actual22: boolean = await waitForStoredContain('6116', '"formName":"Weather"');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${actual22}`);
      expect(actual22).assertTrue();
      formAbility.onRemoveForm('6116');
      const actual23: boolean = await waitForStoredValue('6116', DEFAULT_FORM_INFO_JSON);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${actual23}`);
      expect(actual23).assertTrue();
      formAbility.onAddForm(buildAddFormWant('6116', 'Weather', false));
      const actual24: boolean = await waitForStoredContain('6116', '"formName":"Weather"');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${actual24}`);
      expect(actual24).assertTrue();
      log('testFormStorage0328 end');
    })

    /**
     * @tc.number    SUB_FORMEXTABILITY_STORAGE_0329
     * @tc.name      testFormStorage0329
     * @tc.desc      Verify two different form ids are stored independently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormStorage0329', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormStorage0329 begin');
      const formAbility = new FormAbility();
      formAbility.onAddForm(buildAddFormWant('6117', 'Alpha', false));
      formAbility.onAddForm(buildAddFormWant('6118', 'Beta', true));
      const actual25: boolean = await waitForStoredContain('6117', '"formName":"Alpha"');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${actual25}`);
      expect(actual25).assertTrue();
      const actual26: boolean = await waitForStoredContain('6118', '"formName":"Beta"');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue waitForStoredContain('6118', '"formName":"Beta"')=${actual26}`);
      expect(actual26).assertTrue();
      log('testFormStorage0329 end');
    })

    /**
     * @tc.number    SUB_FORMEXTABILITY_STORAGE_0330
     * @tc.name      testFormStorage0330
     * @tc.desc      Verify the stored record for a temporary form keeps all three fields.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormStorage0330', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormStorage0330 begin');
      const formAbility = new FormAbility();
      formAbility.onAddForm(buildAddFormWant('6119', 'Weather', true));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue waitForStoredValue('6119', '{"formName":"Weather","tempFla...`);
      expect(await waitForStoredValue('6119', '{"formName":"Weather","tempFlag":true,"updateCount":0}')).assertTrue();
      log('testFormStorage0330 end');
    })
  })
}
