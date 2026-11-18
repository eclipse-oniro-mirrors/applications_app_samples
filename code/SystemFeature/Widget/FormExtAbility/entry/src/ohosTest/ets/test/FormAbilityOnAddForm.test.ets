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
import { formBindingData } from '@kit.FormKit';
import { Want } from '@kit.AbilityKit';
import FormAbility from '../../../main/ets/FormAbility/FormAbility';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_FormExtAbility]';
const BUNDLE: string = 'FormExtAbility_';

function log(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', `${BUNDLE}${message}`);
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

function buildAddFormWantWithoutTemporary(formId: string, formName: string): Want {
  let want: Want = {
    parameters: {
      'ohos.extra.param.key.form_identity': formId,
      'ohos.extra.param.key.form_name': formName
    }
  };
  return want;
}

function assertAddFormResult(result: formBindingData.FormBindingData): void {
  hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${result !== null && result !== undefined}`);
  expect(result !== null && result !== undefined).assertTrue();
  hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof result=${typeof result}, expected='object'`);
  expect(typeof result).assertEqual('object');
  hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${result.data !== null && result.data !== undefined}`);
  expect(result.data !== null && result.data !== undefined).assertTrue();
}

export default function formAbilityOnAddFormTest(): void {
  describe('FormAbilityOnAddFormTest', () => {
    /**
     * @tc.number    SUB_FORMEXTABILITY_ONADD_0201
     * @tc.name      FormExtAbility_testFormOnAdd0201
     * @tc.desc      Verify onAddForm returns card data for id 5201 with name Widget and temp false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it(`${BUNDLE}testFormOnAdd0201`, TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormOnAdd0201 begin');
      const formAbility = new FormAbility();
      const result: formBindingData.FormBindingData =
        formAbility.onAddForm(buildAddFormWant('5201', 'Widget', false));
      assertAddFormResult(result);
      log('testFormOnAdd0201 end');
    })

    /**
     * @tc.number    SUB_FORMEXTABILITY_ONADD_0202
     * @tc.name      FormExtAbility_testFormOnAdd0202
     * @tc.desc      Verify onAddForm returns card data for id 5201 with name Widget and temp true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it(`${BUNDLE}testFormOnAdd0202`, TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormOnAdd0202 begin');
      const formAbility = new FormAbility();
      const result: formBindingData.FormBindingData =
        formAbility.onAddForm(buildAddFormWant('5201', 'Widget', true));
      assertAddFormResult(result);
      log('testFormOnAdd0202 end');
    })

    /**
     * @tc.number    SUB_FORMEXTABILITY_ONADD_0203
     * @tc.name      FormExtAbility_testFormOnAdd0203
     * @tc.desc      Verify onAddForm returns card data for id 5202 with a Chinese form name.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it(`${BUNDLE}testFormOnAdd0203`, TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormOnAdd0203 begin');
      const formAbility = new FormAbility();
      const result: formBindingData.FormBindingData =
        formAbility.onAddForm(buildAddFormWant('5202', '温度卡片', false));
      assertAddFormResult(result);
      log('testFormOnAdd0203 end');
    })

    /**
     * @tc.number    SUB_FORMEXTABILITY_ONADD_0204
     * @tc.name      FormExtAbility_testFormOnAdd0204
     * @tc.desc      Verify onAddForm returns card data for id 5202 with a Chinese form name and temp true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it(`${BUNDLE}testFormOnAdd0204`, TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormOnAdd0204 begin');
      const formAbility = new FormAbility();
      const result: formBindingData.FormBindingData =
        formAbility.onAddForm(buildAddFormWant('5202', '温度卡片', true));
      assertAddFormResult(result);
      log('testFormOnAdd0204 end');
    })

    /**
     * @tc.number    SUB_FORMEXTABILITY_ONADD_0205
     * @tc.name      FormExtAbility_testFormOnAdd0205
     * @tc.desc      Verify onAddForm returns card data for id 5203 with an empty form name.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it(`${BUNDLE}testFormOnAdd0205`, TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormOnAdd0205 begin');
      const formAbility = new FormAbility();
      const result: formBindingData.FormBindingData =
        formAbility.onAddForm(buildAddFormWant('5203', '', false));
      assertAddFormResult(result);
      log('testFormOnAdd0205 end');
    })

    /**
     * @tc.number    SUB_FORMEXTABILITY_ONADD_0206
     * @tc.name      FormExtAbility_testFormOnAdd0206
     * @tc.desc      Verify onAddForm returns card data for id 5203 with an empty name and temp true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it(`${BUNDLE}testFormOnAdd0206`, TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormOnAdd0206 begin');
      const formAbility = new FormAbility();
      const result: formBindingData.FormBindingData =
        formAbility.onAddForm(buildAddFormWant('5203', '', true));
      assertAddFormResult(result);
      log('testFormOnAdd0206 end');
    })

    /**
     * @tc.number    SUB_FORMEXTABILITY_ONADD_0207
     * @tc.name      FormExtAbility_testFormOnAdd0207
     * @tc.desc      Verify onAddForm returns card data for the zero form id edge value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it(`${BUNDLE}testFormOnAdd0207`, TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormOnAdd0207 begin');
      const formAbility = new FormAbility();
      const result: formBindingData.FormBindingData =
        formAbility.onAddForm(buildAddFormWant('0', 'Widget', false));
      assertAddFormResult(result);
      log('testFormOnAdd0207 end');
    })

    /**
     * @tc.number    SUB_FORMEXTABILITY_ONADD_0208
     * @tc.name      FormExtAbility_testFormOnAdd0208
     * @tc.desc      Verify onAddForm returns card data for a large numeric form id.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it(`${BUNDLE}testFormOnAdd0208`, TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormOnAdd0208 begin');
      const formAbility = new FormAbility();
      const result: formBindingData.FormBindingData =
        formAbility.onAddForm(buildAddFormWant('999999999999', 'Widget', false));
      assertAddFormResult(result);
      log('testFormOnAdd0208 end');
    })

    /**
     * @tc.number    SUB_FORMEXTABILITY_ONADD_0209
     * @tc.name      FormExtAbility_testFormOnAdd0209
     * @tc.desc      Verify onAddForm returns card data for a padded numeric form id.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it(`${BUNDLE}testFormOnAdd0209`, TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormOnAdd0209 begin');
      const formAbility = new FormAbility();
      const result: formBindingData.FormBindingData =
        formAbility.onAddForm(buildAddFormWant('007', 'Widget', false));
      assertAddFormResult(result);
      log('testFormOnAdd0209 end');
    })

    /**
     * @tc.number    SUB_FORMEXTABILITY_ONADD_0210
     * @tc.name      FormExtAbility_testFormOnAdd0210
     * @tc.desc      Verify onAddForm tolerates a non numeric form id without throwing.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it(`${BUNDLE}testFormOnAdd0210`, TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormOnAdd0210 begin');
      const formAbility = new FormAbility();
      const result: formBindingData.FormBindingData =
        formAbility.onAddForm(buildAddFormWant('abc', 'Widget', false));
      assertAddFormResult(result);
      log('testFormOnAdd0210 end');
    })

    /**
     * @tc.number    SUB_FORMEXTABILITY_ONADD_0211
     * @tc.name      FormExtAbility_testFormOnAdd0211
     * @tc.desc      Verify onAddForm tolerates a negative numeric form id.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it(`${BUNDLE}testFormOnAdd0211`, TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormOnAdd0211 begin');
      const formAbility = new FormAbility();
      const result: formBindingData.FormBindingData =
        formAbility.onAddForm(buildAddFormWant('-25', 'Widget', false));
      assertAddFormResult(result);
      log('testFormOnAdd0211 end');
    })

    /**
     * @tc.number    SUB_FORMEXTABILITY_ONADD_0212
     * @tc.name      FormExtAbility_testFormOnAdd0212
     * @tc.desc      Verify onAddForm works when the temporary parameter is omitted.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it(`${BUNDLE}testFormOnAdd0212`, TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormOnAdd0212 begin');
      const formAbility = new FormAbility();
      const result: formBindingData.FormBindingData =
        formAbility.onAddForm(buildAddFormWantWithoutTemporary('5204', 'Widget'));
      assertAddFormResult(result);
      log('testFormOnAdd0212 end');
    })

    /**
     * @tc.number    SUB_FORMEXTABILITY_ONADD_0213
     * @tc.name      FormExtAbility_testFormOnAdd0213
     * @tc.desc      Verify onAddForm accepts a string temporary parameter value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it(`${BUNDLE}testFormOnAdd0213`, TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormOnAdd0213 begin');
      const formAbility = new FormAbility();
      let want: Want = {
        parameters: {
          'ohos.extra.param.key.form_identity': '5205',
          'ohos.extra.param.key.form_name': 'Widget',
          'ohos.extra.param.key.form_temporary': 'true'
        }
      };
      const result: formBindingData.FormBindingData = formAbility.onAddForm(want);
      assertAddFormResult(result);
      log('testFormOnAdd0213 end');
    })

    /**
     * @tc.number    SUB_FORMEXTABILITY_ONADD_0214
     * @tc.name      FormExtAbility_testFormOnAdd0214
     * @tc.desc      Verify onAddForm accepts a numeric zero temporary parameter value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it(`${BUNDLE}testFormOnAdd0214`, TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormOnAdd0214 begin');
      const formAbility = new FormAbility();
      let want: Want = {
        parameters: {
          'ohos.extra.param.key.form_identity': '5206',
          'ohos.extra.param.key.form_name': 'Widget',
          'ohos.extra.param.key.form_temporary': 0
        }
      };
      const result: formBindingData.FormBindingData = formAbility.onAddForm(want);
      assertAddFormResult(result);
      log('testFormOnAdd0214 end');
    })

    /**
     * @tc.number    SUB_FORMEXTABILITY_ONADD_0215
     * @tc.name      FormExtAbility_testFormOnAdd0215
     * @tc.desc      Verify repeated onAddForm calls with the same form id stay stable.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it(`${BUNDLE}testFormOnAdd0215`, TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormOnAdd0215 begin');
      const formAbility = new FormAbility();
      const first: formBindingData.FormBindingData =
        formAbility.onAddForm(buildAddFormWant('5207', 'Widget', false));
      const second: formBindingData.FormBindingData =
        formAbility.onAddForm(buildAddFormWant('5207', 'Widget', false));
      assertAddFormResult(first);
      assertAddFormResult(second);
      log('testFormOnAdd0215 end');
    })

    /**
     * @tc.number    SUB_FORMEXTABILITY_ONADD_0216
     * @tc.name      FormExtAbility_testFormOnAdd0216
     * @tc.desc      Verify onAddForm results for different form ids are both valid objects.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it(`${BUNDLE}testFormOnAdd0216`, TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormOnAdd0216 begin');
      const formAbility = new FormAbility();
      const first: formBindingData.FormBindingData =
        formAbility.onAddForm(buildAddFormWant('5208', 'Widget', false));
      const second: formBindingData.FormBindingData =
        formAbility.onAddForm(buildAddFormWant('5209', 'Widget', true));
      assertAddFormResult(first);
      assertAddFormResult(second);
      log('testFormOnAdd0216 end');
    })

    /**
     * @tc.number    SUB_FORMEXTABILITY_ONADD_0217
     * @tc.name      FormExtAbility_testFormOnAdd0217
     * @tc.desc      Verify onAddForm card data keeps object type for temp flag true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it(`${BUNDLE}testFormOnAdd0217`, TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormOnAdd0217 begin');
      const formAbility = new FormAbility();
      const result: formBindingData.FormBindingData =
        formAbility.onAddForm(buildAddFormWant('5210', 'Widget', true));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof result=${typeof result}, expected='object'`);
      expect(typeof result).assertEqual('object');
      log('testFormOnAdd0217 end');
    })

    /**
     * @tc.number    SUB_FORMEXTABILITY_ONADD_0218
     * @tc.name      FormExtAbility_testFormOnAdd0218
     * @tc.desc      Verify onAddForm card data carries a non empty payload for a normal form.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it(`${BUNDLE}testFormOnAdd0218`, TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormOnAdd0218 begin');
      const formAbility = new FormAbility();
      const result: formBindingData.FormBindingData =
        formAbility.onAddForm(buildAddFormWant('5211', 'Widget', false));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${result.data !== null && result.data !== undefined}`);
      expect(result.data !== null && result.data !== undefined).assertTrue();
      log('testFormOnAdd0218 end');
    })

    /**
     * @tc.number    SUB_FORMEXTABILITY_ONADD_0219
     * @tc.name      FormExtAbility_testFormOnAdd0219
     * @tc.desc      Verify onAddForm card data carries a non empty payload for a temporary form.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it(`${BUNDLE}testFormOnAdd0219`, TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormOnAdd0219 begin');
      const formAbility = new FormAbility();
      const result: formBindingData.FormBindingData =
        formAbility.onAddForm(buildAddFormWant('5212', 'Widget', true));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${result.data !== null && result.data !== undefined}`);
      expect(result.data !== null && result.data !== undefined).assertTrue();
      log('testFormOnAdd0219 end');
    })

    /**
     * @tc.number    SUB_FORMEXTABILITY_ONADD_0220
     * @tc.name      FormExtAbility_testFormOnAdd0220
     * @tc.desc      Verify onAddForm does not throw for a form id with leading zeros and temp true.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it(`${BUNDLE}testFormOnAdd0220`, TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormOnAdd0220 begin');
      const formAbility = new FormAbility();
      const result: formBindingData.FormBindingData =
        formAbility.onAddForm(buildAddFormWant('0012', 'Widget', true));
      assertAddFormResult(result);
      log('testFormOnAdd0220 end');
    })
  })
}
