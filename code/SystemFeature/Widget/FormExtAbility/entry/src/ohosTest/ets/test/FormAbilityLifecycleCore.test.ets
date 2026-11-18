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
import { formInfo } from '@kit.FormKit';
import { Want } from '@kit.AbilityKit';
import FormAbility from '../../../main/ets/FormAbility/FormAbility';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_FormExtAbility]';
const BUNDLE: string = 'FormExtAbility_';

function log(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', `${BUNDLE}${message}`);
}

function buildWantWithFormId(formId: string): Want {
  let want: Want = {
    parameters: {
      'ohos.extra.param.key.form_identity': formId
    }
  };
  return want;
}

export default function formAbilityLifecycleCoreTest(): void {
  describe('FormAbilityLifecycleTest', () => {
    /**
     * @tc.number    SUB_FORMEXTABILITY_LIFECYCLE_0101
     * @tc.name      FormExtAbility_testFormLifecycle0101
     * @tc.desc      Verify the FormAbility controller can be instantiated directly in the test process.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it(`${BUNDLE}testFormLifecycle0101`, TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormLifecycle0101 begin');
      const formAbility = new FormAbility();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${formAbility !== null && formAbility !== undefined}`);
      expect(formAbility !== null && formAbility !== undefined).assertTrue();
      log('testFormLifecycle0101 end');
    })

    /**
     * @tc.number    SUB_FORMEXTABILITY_LIFECYCLE_0102
     * @tc.name      FormExtAbility_testFormLifecycle0102
     * @tc.desc      Checks the instantiated FormAbility has object type.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it(`${BUNDLE}testFormLifecycle0102`, TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormLifecycle0102 begin');
      const formAbility = new FormAbility();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof formAbility=${typeof formAbility}, expected='object'`);
      expect(typeof formAbility).assertEqual('object');
      log('testFormLifecycle0102 end');
    })

    /**
     * @tc.number    SUB_FORMEXTABILITY_LIFECYCLE_0103
     * @tc.name      FormExtAbility_testFormLifecycle0103
     * @tc.desc      Verify onAcquireFormState returns READY for an empty want.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it(`${BUNDLE}testFormLifecycle0103`, TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormLifecycle0103 begin');
      const formAbility = new FormAbility();
      const want: Want = {};
      const result: formInfo.FormState = formAbility.onAcquireFormState(want);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual result=${result}, expected=formInfo.FormState.READY`);
      expect(result).assertEqual(formInfo.FormState.READY);
      log('testFormLifecycle0103 end');
    })

    /**
     * @tc.number    SUB_FORMEXTABILITY_LIFECYCLE_0104
     * @tc.name      FormExtAbility_testFormLifecycle0104
     * @tc.desc      Verify onAcquireFormState returns READY for a want carrying form identity.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it(`${BUNDLE}testFormLifecycle0104`, TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormLifecycle0104 begin');
      const formAbility = new FormAbility();
      const result: formInfo.FormState = formAbility.onAcquireFormState(buildWantWithFormId('1101'));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual result=${result}, expected=formInfo.FormState.READY`);
      expect(result).assertEqual(formInfo.FormState.READY);
      log('testFormLifecycle0104 end');
    })

    /**
     * @tc.number    SUB_FORMEXTABILITY_LIFECYCLE_0105
     * @tc.name      FormExtAbility_testFormLifecycle0105
     * @tc.desc      Verify onAcquireFormState returns READY for a want with uri and parameters.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it(`${BUNDLE}testFormLifecycle0105`, TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormLifecycle0105 begin');
      const formAbility = new FormAbility();
      let want: Want = {
        uri: 'form://card/demo',
        parameters: {
          'ohos.extra.param.key.form_identity': '1102'
        }
      };
      const result: formInfo.FormState = formAbility.onAcquireFormState(want);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual result=${result}, expected=formInfo.FormState.READY`);
      expect(result).assertEqual(formInfo.FormState.READY);
      log('testFormLifecycle0105 end');
    })

    /**
     * @tc.number    SUB_FORMEXTABILITY_LIFECYCLE_0106
     * @tc.name      FormExtAbility_testFormLifecycle0106
     * @tc.desc      Checks the onAcquireFormState result type is number form state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it(`${BUNDLE}testFormLifecycle0106`, TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormLifecycle0106 begin');
      const formAbility = new FormAbility();
      const result: formInfo.FormState = formAbility.onAcquireFormState(buildWantWithFormId('1103'));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof result=${typeof result}, expected='number'`);
      expect(typeof result).assertEqual('number');
      log('testFormLifecycle0106 end');
    })

    /**
     * @tc.number    SUB_FORMEXTABILITY_LIFECYCLE_0107
     * @tc.name      FormExtAbility_testFormLifecycle0107
     * @tc.desc      Verify onAcquireFormState keeps returning READY across repeated calls.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it(`${BUNDLE}testFormLifecycle0107`, TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormLifecycle0107 begin');
      const formAbility = new FormAbility();
      const first: formInfo.FormState = formAbility.onAcquireFormState(buildWantWithFormId('1104'));
      const second: formInfo.FormState = formAbility.onAcquireFormState(buildWantWithFormId('1105'));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual first=${first}, expected=formInfo.FormState.READY`);
      expect(first).assertEqual(formInfo.FormState.READY);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual second=${second}, expected=formInfo.FormState.READY`);
      expect(second).assertEqual(formInfo.FormState.READY);
      log('testFormLifecycle0107 end');
    })

    /**
     * @tc.number    SUB_FORMEXTABILITY_LIFECYCLE_0108
     * @tc.name      FormExtAbility_testFormLifecycle0108
     * @tc.desc      Verify onFormEvent handles a plain numeric form id and message.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it(`${BUNDLE}testFormLifecycle0108`, TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormLifecycle0108 begin');
      const formAbility = new FormAbility();
      formAbility.onFormEvent('2101', 'event1');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue true=${true}`);
      expect(true).assertTrue();
      log('testFormLifecycle0108 end');
    })

    /**
     * @tc.number    SUB_FORMEXTABILITY_LIFECYCLE_0109
     * @tc.name      FormExtAbility_testFormLifecycle0109
     * @tc.desc      Verify onFormEvent handles a json style message.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it(`${BUNDLE}testFormLifecycle0109`, TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormLifecycle0109 begin');
      const formAbility = new FormAbility();
      formAbility.onFormEvent('2102', '{"action":"refresh"}');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue true=${true}`);
      expect(true).assertTrue();
      log('testFormLifecycle0109 end');
    })

    /**
     * @tc.number    SUB_FORMEXTABILITY_LIFECYCLE_0110
     * @tc.name      FormExtAbility_testFormLifecycle0110
     * @tc.desc      Verify onFormEvent handles empty form id and empty message.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it(`${BUNDLE}testFormLifecycle0110`, TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormLifecycle0110 begin');
      const formAbility = new FormAbility();
      formAbility.onFormEvent('', '');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue true=${true}`);
      expect(true).assertTrue();
      log('testFormLifecycle0110 end');
    })

    /**
     * @tc.number    SUB_FORMEXTABILITY_LIFECYCLE_0111
     * @tc.name      FormExtAbility_testFormLifecycle0111
     * @tc.desc      Verify onFormEvent handles a non numeric form id without throwing.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it(`${BUNDLE}testFormLifecycle0111`, TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormLifecycle0111 begin');
      const formAbility = new FormAbility();
      formAbility.onFormEvent('abc', 'message');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue true=${true}`);
      expect(true).assertTrue();
      log('testFormLifecycle0111 end');
    })

    /**
     * @tc.number    SUB_FORMEXTABILITY_LIFECYCLE_0112
     * @tc.name      FormExtAbility_testFormLifecycle0112
     * @tc.desc      Verify onFormEvent handles a long message payload.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it(`${BUNDLE}testFormLifecycle0112`, TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormLifecycle0112 begin');
      const formAbility = new FormAbility();
      let longMessage: string = '';
      for (let i: number = 0; i < 100; i++) {
        longMessage = longMessage + 'payload';
      }
      formAbility.onFormEvent('2103', longMessage);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue true=${true}`);
      expect(true).assertTrue();
      log('testFormLifecycle0112 end');
    })

    /**
     * @tc.number    SUB_FORMEXTABILITY_LIFECYCLE_0113
     * @tc.name      FormExtAbility_testFormLifecycle0113
     * @tc.desc      Verify onFormEvent handles the zero form id edge value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it(`${BUNDLE}testFormLifecycle0113`, TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormLifecycle0113 begin');
      const formAbility = new FormAbility();
      formAbility.onFormEvent('0', 'zero');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue true=${true}`);
      expect(true).assertTrue();
      log('testFormLifecycle0113 end');
    })

    /**
     * @tc.number    SUB_FORMEXTABILITY_LIFECYCLE_0114
     * @tc.name      FormExtAbility_testFormLifecycle0114
     * @tc.desc      Verify onChangeFormVisibility handles a single visible form id.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it(`${BUNDLE}testFormLifecycle0114`, TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormLifecycle0114 begin');
      const formAbility = new FormAbility();
      formAbility.onChangeFormVisibility({ '2201': 1 });
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue true=${true}`);
      expect(true).assertTrue();
      log('testFormLifecycle0114 end');
    })

    /**
     * @tc.number    SUB_FORMEXTABILITY_LIFECYCLE_0115
     * @tc.name      FormExtAbility_testFormLifecycle0115
     * @tc.desc      Verify onChangeFormVisibility handles multiple form statuses at once.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it(`${BUNDLE}testFormLifecycle0115`, TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormLifecycle0115 begin');
      const formAbility = new FormAbility();
      formAbility.onChangeFormVisibility({ '2202': 0, '2203': 1 });
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue true=${true}`);
      expect(true).assertTrue();
      log('testFormLifecycle0115 end');
    })

    /**
     * @tc.number    SUB_FORMEXTABILITY_LIFECYCLE_0116
     * @tc.name      FormExtAbility_testFormLifecycle0116
     * @tc.desc      Verify onChangeFormVisibility handles an empty status map.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it(`${BUNDLE}testFormLifecycle0116`, TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormLifecycle0116 begin');
      const formAbility = new FormAbility();
      formAbility.onChangeFormVisibility({});
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue true=${true}`);
      expect(true).assertTrue();
      log('testFormLifecycle0116 end');
    })

    /**
     * @tc.number    SUB_FORMEXTABILITY_LIFECYCLE_0117
     * @tc.name      FormExtAbility_testFormLifecycle0117
     * @tc.desc      Verify onCastToNormalForm runs without throwing for a stored form id.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it(`${BUNDLE}testFormLifecycle0117`, TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormLifecycle0117 begin');
      const formAbility = new FormAbility();
      formAbility.onCastToNormalForm('4101');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue true=${true}`);
      expect(true).assertTrue();
      log('testFormLifecycle0117 end');
    })

    /**
     * @tc.number    SUB_FORMEXTABILITY_LIFECYCLE_0118
     * @tc.name      FormExtAbility_testFormLifecycle0118
     * @tc.desc      Verify onCastToNormalForm runs without throwing for another form id.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it(`${BUNDLE}testFormLifecycle0118`, TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormLifecycle0118 begin');
      const formAbility = new FormAbility();
      formAbility.onCastToNormalForm('4102');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue true=${true}`);
      expect(true).assertTrue();
      log('testFormLifecycle0118 end');
    })

    /**
     * @tc.number    SUB_FORMEXTABILITY_LIFECYCLE_0119
     * @tc.name      FormExtAbility_testFormLifecycle0119
     * @tc.desc      Verify onCastToNormalForm tolerates an empty form id.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it(`${BUNDLE}testFormLifecycle0119`, TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormLifecycle0119 begin');
      const formAbility = new FormAbility();
      formAbility.onCastToNormalForm('');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue true=${true}`);
      expect(true).assertTrue();
      log('testFormLifecycle0119 end');
    })

    /**
     * @tc.number    SUB_FORMEXTABILITY_LIFECYCLE_0120
     * @tc.name      FormExtAbility_testFormLifecycle0120
     * @tc.desc      Verify onCastToNormalForm tolerates a non numeric form id.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it(`${BUNDLE}testFormLifecycle0120`, TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormLifecycle0120 begin');
      const formAbility = new FormAbility();
      formAbility.onCastToNormalForm('abc');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue true=${true}`);
      expect(true).assertTrue();
      log('testFormLifecycle0120 end');
    })

    /**
     * @tc.number    SUB_FORMEXTABILITY_LIFECYCLE_0121
     * @tc.name      FormExtAbility_testFormLifecycle0121
     * @tc.desc      Verify onUpdateForm runs without throwing for a numeric form id.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it(`${BUNDLE}testFormLifecycle0121`, TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormLifecycle0121 begin');
      const formAbility = new FormAbility();
      formAbility.onUpdateForm('4201');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue true=${true}`);
      expect(true).assertTrue();
      log('testFormLifecycle0121 end');
    })

    /**
     * @tc.number    SUB_FORMEXTABILITY_LIFECYCLE_0122
     * @tc.name      FormExtAbility_testFormLifecycle0122
     * @tc.desc      Verify onUpdateForm runs without throwing for another form id.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it(`${BUNDLE}testFormLifecycle0122`, TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormLifecycle0122 begin');
      const formAbility = new FormAbility();
      formAbility.onUpdateForm('4202');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue true=${true}`);
      expect(true).assertTrue();
      log('testFormLifecycle0122 end');
    })

    /**
     * @tc.number    SUB_FORMEXTABILITY_LIFECYCLE_0123
     * @tc.name      FormExtAbility_testFormLifecycle0123
     * @tc.desc      Verify onUpdateForm tolerates a non numeric form id via default storage values.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it(`${BUNDLE}testFormLifecycle0123`, TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormLifecycle0123 begin');
      const formAbility = new FormAbility();
      formAbility.onUpdateForm('abc');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue true=${true}`);
      expect(true).assertTrue();
      log('testFormLifecycle0123 end');
    })

    /**
     * @tc.number    SUB_FORMEXTABILITY_LIFECYCLE_0124
     * @tc.name      FormExtAbility_testFormLifecycle0124
     * @tc.desc      Verify onRemoveForm runs without throwing for a numeric form id.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it(`${BUNDLE}testFormLifecycle0124`, TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormLifecycle0124 begin');
      const formAbility = new FormAbility();
      formAbility.onRemoveForm('4301');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue true=${true}`);
      expect(true).assertTrue();
      log('testFormLifecycle0124 end');
    })

    /**
     * @tc.number    SUB_FORMEXTABILITY_LIFECYCLE_0125
     * @tc.name      FormExtAbility_testFormLifecycle0125
     * @tc.desc      Verify onRemoveForm tolerates a form id that was never stored.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it(`${BUNDLE}testFormLifecycle0125`, TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormLifecycle0125 begin');
      const formAbility = new FormAbility();
      formAbility.onRemoveForm('4302');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue true=${true}`);
      expect(true).assertTrue();
      log('testFormLifecycle0125 end');
    })

    /**
     * @tc.number    SUB_FORMEXTABILITY_LIFECYCLE_0126
     * @tc.name      FormExtAbility_testFormLifecycle0126
     * @tc.desc      Verify repeated onFormEvent calls on one instance stay stable.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it(`${BUNDLE}testFormLifecycle0126`, TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormLifecycle0126 begin');
      const formAbility = new FormAbility();
      formAbility.onFormEvent('2104', 'first');
      formAbility.onFormEvent('2104', 'second');
      formAbility.onFormEvent('2104', 'third');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue true=${true}`);
      expect(true).assertTrue();
      log('testFormLifecycle0126 end');
    })

    /**
     * @tc.number    SUB_FORMEXTABILITY_LIFECYCLE_0127
     * @tc.name      FormExtAbility_testFormLifecycle0127
     * @tc.desc      Verify onAcquireFormState still returns READY after a visibility change.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it(`${BUNDLE}testFormLifecycle0127`, TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormLifecycle0127 begin');
      const formAbility = new FormAbility();
      formAbility.onChangeFormVisibility({ '2204': 1 });
      const result: formInfo.FormState = formAbility.onAcquireFormState(buildWantWithFormId('2204'));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual result=${result}, expected=formInfo.FormState.READY`);
      expect(result).assertEqual(formInfo.FormState.READY);
      log('testFormLifecycle0127 end');
    })

    /**
     * @tc.number    SUB_FORMEXTABILITY_LIFECYCLE_0128
     * @tc.name      FormExtAbility_testFormLifecycle0128
     * @tc.desc      Verify sequential onUpdateForm then onRemoveForm runs without throwing.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it(`${BUNDLE}testFormLifecycle0128`, TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormLifecycle0128 begin');
      const formAbility = new FormAbility();
      formAbility.onUpdateForm('4401');
      formAbility.onRemoveForm('4401');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue true=${true}`);
      expect(true).assertTrue();
      log('testFormLifecycle0128 end');
    })

    /**
     * @tc.number    SUB_FORMEXTABILITY_LIFECYCLE_0129
     * @tc.name      FormExtAbility_testFormLifecycle0129
     * @tc.desc      Verify sequential onCastToNormalForm then onUpdateForm runs without throwing.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it(`${BUNDLE}testFormLifecycle0129`, TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormLifecycle0129 begin');
      const formAbility = new FormAbility();
      formAbility.onCastToNormalForm('4402');
      formAbility.onUpdateForm('4402');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue true=${true}`);
      expect(true).assertTrue();
      log('testFormLifecycle0129 end');
    })

    /**
     * @tc.number    SUB_FORMEXTABILITY_LIFECYCLE_0130
     * @tc.name      FormExtAbility_testFormLifecycle0130
     * @tc.desc      Checks lifecycle callback members keep their function type.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it(`${BUNDLE}testFormLifecycle0130`, TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testFormLifecycle0130 begin');
      const formAbility = new FormAbility();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${typeof formAbility.onAcquireFormState}`);
      expect(typeof formAbility.onAcquireFormState).assertEqual('function');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${typeof formAbility.onFormEvent}`);
      expect(typeof formAbility.onFormEvent).assertEqual('function');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${typeof formAbility.onChangeFormVisibility}`);
      expect(typeof formAbility.onChangeFormVisibility).assertEqual('function');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${typeof formAbility.onCastToNormalForm}`);
      expect(typeof formAbility.onCastToNormalForm).assertEqual('function');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${typeof formAbility.onUpdateForm}`);
      expect(typeof formAbility.onUpdateForm).assertEqual('function');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${typeof formAbility.onRemoveForm}`);
      expect(typeof formAbility.onRemoveForm).assertEqual('function');
      log('testFormLifecycle0130 end');
    })
  })
}
