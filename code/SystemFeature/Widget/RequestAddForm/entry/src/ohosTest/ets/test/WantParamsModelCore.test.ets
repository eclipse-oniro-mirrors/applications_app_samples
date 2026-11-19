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
import Want from '@ohos.app.ability.Want';

const DOMAIN: number = 0xF814;
const TAG: string = 'WantParamsModelCoreTest';

const KEY_DIM: string = 'ohos.extra.param.key.form_dimension';
const KEY_NAME: string = 'ohos.extra.param.key.form_name';
const KEY_MODULE: string = 'ohos.extra.param.key.module_name';
const FORM_ABILITY: string = 'EntryFormAbility';
const ARKTS_FORM_NAME: string = 'widget';
const JS_FORM_NAME: string = 'JsWidget';
const MODULE_NAME: string = 'entry';

function log(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

function buildArkTsWant(): Want {
  let want: Want = {
    abilityName: FORM_ABILITY,
    parameters: {
      'ohos.extra.param.key.form_dimension': FormDimension.Dimension_2_2,
      'ohos.extra.param.key.form_name': ARKTS_FORM_NAME,
      'ohos.extra.param.key.module_name': MODULE_NAME
    }
  };
  return want;
}

function buildJsWant(): Want {
  let want: Want = {
    abilityName: FORM_ABILITY,
    parameters: {
      'ohos.extra.param.key.form_dimension': FormDimension.Dimension_2_2,
      'ohos.extra.param.key.form_name': JS_FORM_NAME,
      'ohos.extra.param.key.module_name': MODULE_NAME
    }
  };
  return want;
}

function getNumberParam(want: Want, key: string): number {
  const params: Record<string, Object> | undefined = want.parameters;
  if (params === undefined) {
    return -1;
  }
  const value: Object | undefined = params[key];
  if (value === undefined) {
    return -1;
  }
  return Number(value);
}

function getStringParam(want: Want, key: string): string {
  const params: Record<string, Object> | undefined = want.parameters;
  if (params === undefined) {
    return '';
  }
  const value: Object | undefined = params[key];
  if (value === undefined) {
    return '';
  }
  return String(value);
}

function hasParam(want: Want, key: string): boolean {
  const params: Record<string, Object> | undefined = want.parameters;
  if (params === undefined) {
    return false;
  }
  return params[key] !== undefined;
}

export default function wantParamsModelCoreTest(): void {
  describe('WantParamsModelCoreTest', () => {
    /**
     * @tc.number    SUB_REQUESTADDFORM_WANTPARAMS_0101
     * @tc.name      testWantParams0101
     * @tc.desc      Verify the ArkTs publish want carries the 2x2 form dimension value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWantParams0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWantParams0101 begin');
      const actual: number = getNumberParam(buildArkTsWant(), KEY_DIM);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=FormDimension.Dimension_2_2`);
      expect(actual).assertEqual(FormDimension.Dimension_2_2);
      log('testWantParams0101 end');
    })

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANTPARAMS_0102
     * @tc.name      testWantParams0102
     * @tc.desc      Verify the ArkTs publish dimension parameter keeps the number type.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWantParams0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWantParams0102 begin');
      const actual: number = getNumberParam(buildArkTsWant(), KEY_DIM);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='number'`);
      expect(typeof actual).assertEqual('number');
      log('testWantParams0102 end');
    })

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANTPARAMS_0103
     * @tc.name      testWantParams0103
     * @tc.desc      Verify the ArkTs publish want targets the widget form name.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWantParams0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWantParams0103 begin');
      const actual: string = getStringParam(buildArkTsWant(), KEY_NAME);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=ARKTS_FORM_NAME`);
      expect(actual).assertEqual(ARKTS_FORM_NAME);
      log('testWantParams0103 end');
    })

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANTPARAMS_0104
     * @tc.name      testWantParams0104
     * @tc.desc      Verify the ArkTs form name parameter keeps the string type.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWantParams0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWantParams0104 begin');
      const actual: string = getStringParam(buildArkTsWant(), KEY_NAME);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='string'`);
      expect(typeof actual).assertEqual('string');
      log('testWantParams0104 end');
    })

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANTPARAMS_0105
     * @tc.name      testWantParams0105
     * @tc.desc      Verify the ArkTs publish want targets the entry module name.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWantParams0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWantParams0105 begin');
      const actual: string = getStringParam(buildArkTsWant(), KEY_MODULE);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=MODULE_NAME`);
      expect(actual).assertEqual(MODULE_NAME);
      log('testWantParams0105 end');
    })

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANTPARAMS_0106
     * @tc.name      testWantParams0106
     * @tc.desc      Verify the ArkTs publish want targets the EntryFormAbility.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWantParams0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWantParams0106 begin');
      const actual: string = buildArkTsWant().abilityName as string;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=FORM_ABILITY`);
      expect(actual).assertEqual(FORM_ABILITY);
      log('testWantParams0106 end');
    })

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANTPARAMS_0107
     * @tc.name      testWantParams0107
     * @tc.desc      Verify the ArkTs publish want always carries a parameters record.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWantParams0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWantParams0107 begin');
      const params: Record<string, Object> | undefined = buildArkTsWant().parameters;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue params !== undefined=${params !== undefined}`);
      expect(params !== undefined).assertTrue();
      log('testWantParams0107 end');
    })

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANTPARAMS_0108
     * @tc.name      testWantParams0108
     * @tc.desc      Verify the ArkTs parameters record exposes the object type.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWantParams0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWantParams0108 begin');
      const params: Record<string, Object> | undefined = buildArkTsWant().parameters;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof params=${typeof params}, expected='object'`);
      expect(typeof params).assertEqual('object');
      log('testWantParams0108 end');
    })

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANTPARAMS_0109
     * @tc.name      testWantParams0109
     * @tc.desc      Verify the form dimension key is present on the ArkTs want.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWantParams0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWantParams0109 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${hasParam(buildArkTsWant(), KEY_DIM)}`);
      expect(hasParam(buildArkTsWant(), KEY_DIM)).assertTrue();
      log('testWantParams0109 end');
    })

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANTPARAMS_0110
     * @tc.name      testWantParams0110
     * @tc.desc      Verify the form name key is present on the ArkTs want.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWantParams0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWantParams0110 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${hasParam(buildArkTsWant(), KEY_NAME)}`);
      expect(hasParam(buildArkTsWant(), KEY_NAME)).assertTrue();
      log('testWantParams0110 end');
    })

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANTPARAMS_0111
     * @tc.name      testWantParams0111
     * @tc.desc      Verify the module name key is present on the ArkTs want.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWantParams0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWantParams0111 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${hasParam(buildArkTsWant(), KEY_MODULE)}`);
      expect(hasParam(buildArkTsWant(), KEY_MODULE)).assertTrue();
      log('testWantParams0111 end');
    })

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANTPARAMS_0112
     * @tc.name      testWantParams0112
     * @tc.desc      Verify the ArkTs want exposes an abilityName field at the top level.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWantParams0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWantParams0112 begin');
      const actual: Want = buildArkTsWant();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${actual.abilityName !== undefined}`);
      expect(actual.abilityName !== undefined).assertTrue();
      log('testWantParams0112 end');
    })

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANTPARAMS_0113
     * @tc.name      testWantParams0113
     * @tc.desc      Verify the Js publish want carries the 2x2 form dimension value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWantParams0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWantParams0113 begin');
      const actual: number = getNumberParam(buildJsWant(), KEY_DIM);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=FormDimension.Dimension_2_2`);
      expect(actual).assertEqual(FormDimension.Dimension_2_2);
      log('testWantParams0113 end');
    })

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANTPARAMS_0114
     * @tc.name      testWantParams0114
     * @tc.desc      Verify the Js publish want targets the JsWidget form name.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWantParams0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWantParams0114 begin');
      const actual: string = getStringParam(buildJsWant(), KEY_NAME);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=JS_FORM_NAME`);
      expect(actual).assertEqual(JS_FORM_NAME);
      log('testWantParams0114 end');
    })

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANTPARAMS_0115
     * @tc.name      testWantParams0115
     * @tc.desc      Verify the Js form name parameter keeps the string type.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWantParams0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWantParams0115 begin');
      const actual: string = getStringParam(buildJsWant(), KEY_NAME);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='string'`);
      expect(typeof actual).assertEqual('string');
      log('testWantParams0115 end');
    })

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANTPARAMS_0116
     * @tc.name      testWantParams0116
     * @tc.desc      Verify the Js publish want targets the entry module name.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWantParams0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWantParams0116 begin');
      const actual: string = getStringParam(buildJsWant(), KEY_MODULE);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=MODULE_NAME`);
      expect(actual).assertEqual(MODULE_NAME);
      log('testWantParams0116 end');
    })

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANTPARAMS_0117
     * @tc.name      testWantParams0117
     * @tc.desc      Verify the Js publish want targets the EntryFormAbility.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWantParams0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWantParams0117 begin');
      const actual: string = buildJsWant().abilityName as string;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=FORM_ABILITY`);
      expect(actual).assertEqual(FORM_ABILITY);
      log('testWantParams0117 end');
    })

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANTPARAMS_0118
     * @tc.name      testWantParams0118
     * @tc.desc      Verify the Js publish want always carries a parameters record.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWantParams0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWantParams0118 begin');
      const params: Record<string, Object> | undefined = buildJsWant().parameters;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue params !== undefined=${params !== undefined}`);
      expect(params !== undefined).assertTrue();
      log('testWantParams0118 end');
    })

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANTPARAMS_0119
     * @tc.name      testWantParams0119
     * @tc.desc      Verify both publish paths request the same 2x2 dimension.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWantParams0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWantParams0119 begin');
      const arkTs: number = getNumberParam(buildArkTsWant(), KEY_DIM);
      const js: number = getNumberParam(buildJsWant(), KEY_DIM);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual arkTs=${arkTs}, expected=js`);
      expect(arkTs).assertEqual(js);
      log('testWantParams0119 end');
    })

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANTPARAMS_0120
     * @tc.name      testWantParams0120
     * @tc.desc      Verify the two publish paths request different form names.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWantParams0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWantParams0120 begin');
      const arkTs: string = getStringParam(buildArkTsWant(), KEY_NAME);
      const js: string = getStringParam(buildJsWant(), KEY_NAME);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue arkTs !== js=${arkTs !== js}`);
      expect(arkTs !== js).assertTrue();
      log('testWantParams0120 end');
    })

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANTPARAMS_0121
     * @tc.name      testWantParams0121
     * @tc.desc      Verify both publish paths target the same module name.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWantParams0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWantParams0121 begin');
      const arkTs: string = getStringParam(buildArkTsWant(), KEY_MODULE);
      const js: string = getStringParam(buildJsWant(), KEY_MODULE);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual arkTs=${arkTs}, expected=js`);
      expect(arkTs).assertEqual(js);
      log('testWantParams0121 end');
    })

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANTPARAMS_0122
     * @tc.name      testWantParams0122
     * @tc.desc      Verify the dimension key follows the ohos extra param prefix.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWantParams0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWantParams0122 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${KEY_DIM.startsWith('ohos.extra.param.key.')}`);
      expect(KEY_DIM.startsWith('ohos.extra.param.key.')).assertTrue();
      log('testWantParams0122 end');
    })

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANTPARAMS_0123
     * @tc.name      testWantParams0123
     * @tc.desc      Verify the form name key follows the ohos extra param prefix.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWantParams0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWantParams0123 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${KEY_NAME.startsWith('ohos.extra.param.key.')}`);
      expect(KEY_NAME.startsWith('ohos.extra.param.key.')).assertTrue();
      log('testWantParams0123 end');
    })

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANTPARAMS_0124
     * @tc.name      testWantParams0124
     * @tc.desc      Verify the module name key follows the ohos extra param prefix.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWantParams0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWantParams0124 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${KEY_MODULE.startsWith('ohos.extra.param.key.')}`);
      expect(KEY_MODULE.startsWith('ohos.extra.param.key.')).assertTrue();
      log('testWantParams0124 end');
    })

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANTPARAMS_0125
     * @tc.name      testWantParams0125
     * @tc.desc      Verify the dimension key ends with the form_dimension suffix.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWantParams0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWantParams0125 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${KEY_DIM.endsWith('form_dimension')}`);
      expect(KEY_DIM.endsWith('form_dimension')).assertTrue();
      log('testWantParams0125 end');
    })

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANTPARAMS_0126
     * @tc.name      testWantParams0126
     * @tc.desc      Verify the form name key ends with the form_name suffix.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWantParams0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWantParams0126 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${KEY_NAME.endsWith('form_name')}`);
      expect(KEY_NAME.endsWith('form_name')).assertTrue();
      log('testWantParams0126 end');
    })

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANTPARAMS_0127
     * @tc.name      testWantParams0127
     * @tc.desc      Verify the module name key ends with the module_name suffix.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWantParams0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWantParams0127 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${KEY_MODULE.endsWith('module_name')}`);
      expect(KEY_MODULE.endsWith('module_name')).assertTrue();
      log('testWantParams0127 end');
    })

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANTPARAMS_0128
     * @tc.name      testWantParams0128
     * @tc.desc      Verify want parameters can carry the DIMENSION_1_1 dimension value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWantParams0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWantParams0128 begin');
      let want: Want = buildArkTsWant();
      const params: Record<string, Object> | undefined = want.parameters;
      if (params !== undefined) {
        params[KEY_DIM] = FormDimension.DIMENSION_1_1;
      }
      const actual: number = getNumberParam(want, KEY_DIM);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=FormDimension.DIMENSION_1_1`);
      expect(actual).assertEqual(FormDimension.DIMENSION_1_1);
      log('testWantParams0128 end');
    })

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANTPARAMS_0129
     * @tc.name      testWantParams0129
     * @tc.desc      Verify want parameters can carry the 2x1 dimension value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWantParams0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWantParams0129 begin');
      let want: Want = buildArkTsWant();
      const params: Record<string, Object> | undefined = want.parameters;
      if (params !== undefined) {
        params[KEY_DIM] = FormDimension.Dimension_2_1;
      }
      const actual: number = getNumberParam(want, KEY_DIM);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=5`);
      expect(actual).assertEqual(5);
      log('testWantParams0129 end');
    })

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANTPARAMS_0130
     * @tc.name      testWantParams0130
     * @tc.desc      Verify want parameters can carry the 2x4 dimension value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWantParams0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWantParams0130 begin');
      let want: Want = buildArkTsWant();
      const params: Record<string, Object> | undefined = want.parameters;
      if (params !== undefined) {
        params[KEY_DIM] = FormDimension.Dimension_2_4;
      }
      const actual: number = getNumberParam(want, KEY_DIM);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=3`);
      expect(actual).assertEqual(3);
      log('testWantParams0130 end');
    })

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANTPARAMS_0131
     * @tc.name      testWantParams0131
     * @tc.desc      Verify want parameters can carry the DIMENSION_2_3 dimension value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWantParams0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWantParams0131 begin');
      let want: Want = buildArkTsWant();
      const params: Record<string, Object> | undefined = want.parameters;
      if (params !== undefined) {
        params[KEY_DIM] = FormDimension.DIMENSION_2_3;
      }
      const actual: number = getNumberParam(want, KEY_DIM);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=FormDimension.DIMENSION_2_3`);
      expect(actual).assertEqual(FormDimension.DIMENSION_2_3);
      log('testWantParams0131 end');
    })

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANTPARAMS_0132
     * @tc.name      testWantParams0132
     * @tc.desc      Verify dimension overrides on one want do not leak into another want.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWantParams0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWantParams0132 begin');
      let wantA: Want = buildArkTsWant();
      const paramsA: Record<string, Object> | undefined = wantA.parameters;
      if (paramsA !== undefined) {
        paramsA[KEY_DIM] = FormDimension.DIMENSION_1_1;
      }
      const actual: number = getNumberParam(buildArkTsWant(), KEY_DIM);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=FormDimension.Dimension_2_2`);
      expect(actual).assertEqual(FormDimension.Dimension_2_2);
      log('testWantParams0132 end');
    })

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANTPARAMS_0133
     * @tc.name      testWantParams0133
     * @tc.desc      Verify the string form of the dimension parameter equals 4.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWantParams0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWantParams0133 begin');
      const actual: string = getStringParam(buildArkTsWant(), KEY_DIM);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=String(FormDimension.Dimens...`);
      expect(actual).assertEqual(String(FormDimension.Dimension_2_2));
      log('testWantParams0133 end');
    })

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANTPARAMS_0134
     * @tc.name      testWantParams0134
     * @tc.desc      Verify the Js want dimension parameter keeps the number type.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWantParams0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWantParams0134 begin');
      const actual: number = getNumberParam(buildJsWant(), KEY_DIM);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='number'`);
      expect(typeof actual).assertEqual('number');
      log('testWantParams0134 end');
    })

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANTPARAMS_0135
     * @tc.name      testWantParams0135
     * @tc.desc      Verify two ArkTs want builds produce the same dimension value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWantParams0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWantParams0135 begin');
      const first: number = getNumberParam(buildArkTsWant(), KEY_DIM);
      const second: number = getNumberParam(buildArkTsWant(), KEY_DIM);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual first=${first}, expected=second`);
      expect(first).assertEqual(second);
      log('testWantParams0135 end');
    })

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANTPARAMS_0136
     * @tc.name      testWantParams0136
     * @tc.desc      Verify two ArkTs want builds produce the same form name.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWantParams0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWantParams0136 begin');
      const first: string = getStringParam(buildArkTsWant(), KEY_NAME);
      const second: string = getStringParam(buildArkTsWant(), KEY_NAME);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual first=${first}, expected=second`);
      expect(first).assertEqual(second);
      log('testWantParams0136 end');
    })

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANTPARAMS_0137
     * @tc.name      testWantParams0137
     * @tc.desc      Verify two Js want builds produce the same target ability.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWantParams0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWantParams0137 begin');
      const first: string = buildJsWant().abilityName as string;
      const second: string = buildJsWant().abilityName as string;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual first=${first}, expected=second`);
      expect(first).assertEqual(second);
      log('testWantParams0137 end');
    })

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANTPARAMS_0138
     * @tc.name      testWantParams0138
     * @tc.desc      Verify the ArkTs parameters record holds exactly three keys.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWantParams0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWantParams0138 begin');
      const params: Record<string, Object> | undefined = buildArkTsWant().parameters;
      let count: number = 0;
      if (params !== undefined) {
        count = Object.keys(params).length;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual count=${count}, expected=3`);
      expect(count).assertEqual(3);
      log('testWantParams0138 end');
    })

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANTPARAMS_0139
     * @tc.name      testWantParams0139
     * @tc.desc      Verify the Js parameters record holds exactly three keys.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWantParams0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWantParams0139 begin');
      const params: Record<string, Object> | undefined = buildJsWant().parameters;
      let count: number = 0;
      if (params !== undefined) {
        count = Object.keys(params).length;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual count=${count}, expected=3`);
      expect(count).assertEqual(3);
      log('testWantParams0139 end');
    })

    /**
     * @tc.number    SUB_REQUESTADDFORM_WANTPARAMS_0140
     * @tc.name      testWantParams0140
     * @tc.desc      Verify both publish wants expose the identical three key set.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWantParams0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWantParams0140 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue hasParam(buildArkTsWant(), KEY_DIM) && hasParam(buildJsWan...`);
      expect(hasParam(buildArkTsWant(), KEY_DIM) && hasParam(buildJsWant(), KEY_DIM)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue hasParam(buildArkTsWant(), KEY_NAME) && hasParam(buildJsWa...`);
      expect(hasParam(buildArkTsWant(), KEY_NAME) && hasParam(buildJsWant(), KEY_NAME)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue hasParam(buildArkTsWant(), KEY_MODULE) && hasParam(buildJs...`);
      expect(hasParam(buildArkTsWant(), KEY_MODULE) && hasParam(buildJsWant(), KEY_MODULE)).assertTrue();
      log('testWantParams0140 end');
    })
  })
}
