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

import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { FormStoreModel } from './model/FormExtLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_FormExtAbility]';
const BUNDLE: string = 'FormExtAbility_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for FormStoreModel.update (37 cases). */
export default function formStoreModelUpdate2Test(): void {
  describe('FormStoreModelUpdate2Test', (): void => {
    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_UPDATE_0054
     * @tc.name      FormExtAbility_FormStoreModelUpdate_0054
     * @tc.desc      FormStoreModel.update(formId="yc") yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelUpdate_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelUpdate_0054 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.update('yc');
      logInfo(`update(formId="yc"): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`update(formId="yc") state: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`update(formId="yc") state: JSON.stringify(subject.formIds)=${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["yc"]');
      logInfo(`update(formId="yc") state: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`update(formId="yc") state: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[""]');
      logInfo(`update(formId="yc") state: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`update(formId="yc") state: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelUpdate_0054 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_UPDATE_0055
     * @tc.name      FormExtAbility_FormStoreModelUpdate_0055
     * @tc.desc      FormStoreModel.update(formId="U") yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelUpdate_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelUpdate_0055 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.update('U');
      logInfo(`update(formId="U"): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`update(formId="U") state: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`update(formId="U") state: JSON.stringify(subject.formIds)=${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["U"]');
      logInfo(`update(formId="U") state: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`update(formId="U") state: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[""]');
      logInfo(`update(formId="U") state: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`update(formId="U") state: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelUpdate_0055 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_UPDATE_0056
     * @tc.name      FormExtAbility_FormStoreModelUpdate_0056
     * @tc.desc      FormStoreModel.update(formId="bc") yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelUpdate_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelUpdate_0056 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.update('bc');
      logInfo(`update(formId="bc"): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`update(formId="bc") state: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`update(formId="bc") state: JSON.stringify(subject.formIds)=${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["bc"]');
      logInfo(`update(formId="bc") state: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`update(formId="bc") state: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[""]');
      logInfo(`update(formId="bc") state: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`update(formId="bc") state: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelUpdate_0056 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_UPDATE_0057
     * @tc.name      FormExtAbility_FormStoreModelUpdate_0057
     * @tc.desc      FormStoreModel.update(formId="2l5Z8yY4") yields "11"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelUpdate_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelUpdate_0057 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.update('2l5Z8yY4');
      logInfo(`update(formId="2l5Z8yY4"): actual=${actual}`);
      expect(actual).assertEqual('11');
      logInfo(`update(formId="2l5Z8yY4") state: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`update(formId="2l5Z8yY4") state: JSON.stringify(subject.formIds)=${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["2l5Z8yY4"]');
      logInfo(`update(formId="2l5Z8yY4") state: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`update(formId="2l5Z8yY4") state: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[""]');
      logInfo(`update(formId="2l5Z8yY4") state: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`update(formId="2l5Z8yY4") state: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelUpdate_0057 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_UPDATE_0058
     * @tc.name      FormExtAbility_FormStoreModelUpdate_0058
     * @tc.desc      FormStoreModel.update(formId="B") yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelUpdate_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelUpdate_0058 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.update('B');
      logInfo(`update(formId="B"): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`update(formId="B") state: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`update(formId="B") state: JSON.stringify(subject.formIds)=${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["B"]');
      logInfo(`update(formId="B") state: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`update(formId="B") state: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[""]');
      logInfo(`update(formId="B") state: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`update(formId="B") state: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelUpdate_0058 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_UPDATE_0059
     * @tc.name      FormExtAbility_FormStoreModelUpdate_0059
     * @tc.desc      FormStoreModel.update(formId="S7obnGCuBA") yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelUpdate_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelUpdate_0059 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.update('S7obnGCuBA');
      logInfo(`update(formId="S7obnGCuBA"): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`update(formId="S7obnGCuBA") state: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`update(formId="S7obnGCuBA") state: JSON.stringify(subject.formIds)=${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["S7obnGCuBA"]');
      logInfo(`update(formId="S7obnGCuBA") state: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`update(formId="S7obnGCuBA") state: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[""]');
      logInfo(`update(formId="S7obnGCuBA") state: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`update(formId="S7obnGCuBA") state: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelUpdate_0059 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_UPDATE_0060
     * @tc.name      FormExtAbility_FormStoreModelUpdate_0060
     * @tc.desc      FormStoreModel.update(formId="pI2KPWeUyVaO") yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelUpdate_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelUpdate_0060 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.update('pI2KPWeUyVaO');
      logInfo(`update(formId="pI2KPWeUyVaO"): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`update(formId="pI2KPWeUyVaO") state: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`update(formId="pI2KPWeUyVaO") state: JSON.stringify(subject.formI...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["pI2KPWeUyVaO"]');
      logInfo(`update(formId="pI2KPWeUyVaO") state: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`update(formId="pI2KPWeUyVaO") state: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[""]');
      logInfo(`update(formId="pI2KPWeUyVaO") state: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`update(formId="pI2KPWeUyVaO") state: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelUpdate_0060 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_UPDATE_0061
     * @tc.name      FormExtAbility_FormStoreModelUpdate_0061
     * @tc.desc      FormStoreModel.update(formId="9xXqY") yields "18"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelUpdate_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelUpdate_0061 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.update('9xXqY');
      logInfo(`update(formId="9xXqY"): actual=${actual}`);
      expect(actual).assertEqual('18');
      logInfo(`update(formId="9xXqY") state: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`update(formId="9xXqY") state: JSON.stringify(subject.formIds)=${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["9xXqY"]');
      logInfo(`update(formId="9xXqY") state: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`update(formId="9xXqY") state: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[""]');
      logInfo(`update(formId="9xXqY") state: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`update(formId="9xXqY") state: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelUpdate_0061 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_UPDATE_0062
     * @tc.name      FormExtAbility_FormStoreModelUpdate_0062
     * @tc.desc      FormStoreModel.update(formId="XbUePPZy") yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelUpdate_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelUpdate_0062 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.update('XbUePPZy');
      logInfo(`update(formId="XbUePPZy"): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`update(formId="XbUePPZy") state: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`update(formId="XbUePPZy") state: JSON.stringify(subject.formIds)=${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["XbUePPZy"]');
      logInfo(`update(formId="XbUePPZy") state: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`update(formId="XbUePPZy") state: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[""]');
      logInfo(`update(formId="XbUePPZy") state: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`update(formId="XbUePPZy") state: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelUpdate_0062 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_UPDATE_0063
     * @tc.name      FormExtAbility_FormStoreModelUpdate_0063
     * @tc.desc      FormStoreModel.update(formId="YYiDdR7Fe") yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelUpdate_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelUpdate_0063 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.update('YYiDdR7Fe');
      logInfo(`update(formId="YYiDdR7Fe"): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`update(formId="YYiDdR7Fe") state: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`update(formId="YYiDdR7Fe") state: JSON.stringify(subject.formIds)=${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["YYiDdR7Fe"]');
      logInfo(`update(formId="YYiDdR7Fe") state: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`update(formId="YYiDdR7Fe") state: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[""]');
      logInfo(`update(formId="YYiDdR7Fe") state: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`update(formId="YYiDdR7Fe") state: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelUpdate_0063 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_UPDATE_0064
     * @tc.name      FormExtAbility_FormStoreModelUpdate_0064
     * @tc.desc      FormStoreModel.update(formId="QjDc3Yo2N6Lj") yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelUpdate_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelUpdate_0064 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.update('QjDc3Yo2N6Lj');
      logInfo(`update(formId="QjDc3Yo2N6Lj"): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`update(formId="QjDc3Yo2N6Lj") state: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`update(formId="QjDc3Yo2N6Lj") state: JSON.stringify(subject.formI...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["QjDc3Yo2N6Lj"]');
      logInfo(`update(formId="QjDc3Yo2N6Lj") state: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`update(formId="QjDc3Yo2N6Lj") state: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[""]');
      logInfo(`update(formId="QjDc3Yo2N6Lj") state: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`update(formId="QjDc3Yo2N6Lj") state: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelUpdate_0064 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_UPDATE_0065
     * @tc.name      FormExtAbility_FormStoreModelUpdate_0065
     * @tc.desc      FormStoreModel.update(formId="ceMh") yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelUpdate_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelUpdate_0065 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.update('ceMh');
      logInfo(`update(formId="ceMh"): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`update(formId="ceMh") state: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`update(formId="ceMh") state: JSON.stringify(subject.formIds)=${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["ceMh"]');
      logInfo(`update(formId="ceMh") state: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`update(formId="ceMh") state: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[""]');
      logInfo(`update(formId="ceMh") state: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`update(formId="ceMh") state: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelUpdate_0065 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_UPDATE_0066
     * @tc.name      FormExtAbility_FormStoreModelUpdate_0066
     * @tc.desc      FormStoreModel.update(formId="S9jQnJL") yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelUpdate_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelUpdate_0066 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.update('S9jQnJL');
      logInfo(`update(formId="S9jQnJL"): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`update(formId="S9jQnJL") state: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`update(formId="S9jQnJL") state: JSON.stringify(subject.formIds)=${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["S9jQnJL"]');
      logInfo(`update(formId="S9jQnJL") state: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`update(formId="S9jQnJL") state: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[""]');
      logInfo(`update(formId="S9jQnJL") state: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`update(formId="S9jQnJL") state: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelUpdate_0066 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_UPDATE_0067
     * @tc.name      FormExtAbility_FormStoreModelUpdate_0067
     * @tc.desc      FormStoreModel.update(formId="0L") yields "9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelUpdate_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelUpdate_0067 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.update('0L');
      logInfo(`update(formId="0L"): actual=${actual}`);
      expect(actual).assertEqual('9');
      logInfo(`update(formId="0L") state: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`update(formId="0L") state: JSON.stringify(subject.formIds)=${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["0L"]');
      logInfo(`update(formId="0L") state: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`update(formId="0L") state: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[""]');
      logInfo(`update(formId="0L") state: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`update(formId="0L") state: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelUpdate_0067 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_UPDATE_0068
     * @tc.name      FormExtAbility_FormStoreModelUpdate_0068
     * @tc.desc      FormStoreModel.update(formId="D") yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelUpdate_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelUpdate_0068 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.update('D');
      logInfo(`update(formId="D"): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`update(formId="D") state: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`update(formId="D") state: JSON.stringify(subject.formIds)=${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["D"]');
      logInfo(`update(formId="D") state: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`update(formId="D") state: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[""]');
      logInfo(`update(formId="D") state: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`update(formId="D") state: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelUpdate_0068 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_UPDATE_0069
     * @tc.name      FormExtAbility_FormStoreModelUpdate_0069
     * @tc.desc      FormStoreModel.update(formId="KeZBzgpEzO") yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelUpdate_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelUpdate_0069 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.update('KeZBzgpEzO');
      logInfo(`update(formId="KeZBzgpEzO"): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`update(formId="KeZBzgpEzO") state: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`update(formId="KeZBzgpEzO") state: JSON.stringify(subject.formIds)=${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["KeZBzgpEzO"]');
      logInfo(`update(formId="KeZBzgpEzO") state: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`update(formId="KeZBzgpEzO") state: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[""]');
      logInfo(`update(formId="KeZBzgpEzO") state: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`update(formId="KeZBzgpEzO") state: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelUpdate_0069 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_UPDATE_0070
     * @tc.name      FormExtAbility_FormStoreModelUpdate_0070
     * @tc.desc      FormStoreModel.update(formId="3faGjx") yields "12"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelUpdate_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelUpdate_0070 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.update('3faGjx');
      logInfo(`update(formId="3faGjx"): actual=${actual}`);
      expect(actual).assertEqual('12');
      logInfo(`update(formId="3faGjx") state: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`update(formId="3faGjx") state: JSON.stringify(subject.formIds)=${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["3faGjx"]');
      logInfo(`update(formId="3faGjx") state: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`update(formId="3faGjx") state: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[""]');
      logInfo(`update(formId="3faGjx") state: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`update(formId="3faGjx") state: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelUpdate_0070 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_UPDATE_0071
     * @tc.name      FormExtAbility_FormStoreModelUpdate_0071
     * @tc.desc      FormStoreModel.update(formId="P87hAVlYM") yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelUpdate_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelUpdate_0071 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.update('P87hAVlYM');
      logInfo(`update(formId="P87hAVlYM"): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`update(formId="P87hAVlYM") state: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`update(formId="P87hAVlYM") state: JSON.stringify(subject.formIds)=${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["P87hAVlYM"]');
      logInfo(`update(formId="P87hAVlYM") state: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`update(formId="P87hAVlYM") state: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[""]');
      logInfo(`update(formId="P87hAVlYM") state: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`update(formId="P87hAVlYM") state: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelUpdate_0071 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_UPDATE_0072
     * @tc.name      FormExtAbility_FormStoreModelUpdate_0072
     * @tc.desc      FormStoreModel.update(formId="W1rrx") yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelUpdate_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelUpdate_0072 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.update('W1rrx');
      logInfo(`update(formId="W1rrx"): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`update(formId="W1rrx") state: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`update(formId="W1rrx") state: JSON.stringify(subject.formIds)=${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["W1rrx"]');
      logInfo(`update(formId="W1rrx") state: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`update(formId="W1rrx") state: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[""]');
      logInfo(`update(formId="W1rrx") state: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`update(formId="W1rrx") state: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelUpdate_0072 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_UPDATE_0073
     * @tc.name      FormExtAbility_FormStoreModelUpdate_0073
     * @tc.desc      FormStoreModel.update(formId="AHmQ") yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelUpdate_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelUpdate_0073 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.update('AHmQ');
      logInfo(`update(formId="AHmQ"): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`update(formId="AHmQ") state: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`update(formId="AHmQ") state: JSON.stringify(subject.formIds)=${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["AHmQ"]');
      logInfo(`update(formId="AHmQ") state: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`update(formId="AHmQ") state: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[""]');
      logInfo(`update(formId="AHmQ") state: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`update(formId="AHmQ") state: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelUpdate_0073 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_UPDATE_0074
     * @tc.name      FormExtAbility_FormStoreModelUpdate_0074
     * @tc.desc      FormStoreModel.update(formId="BDh") yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelUpdate_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelUpdate_0074 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.update('BDh');
      logInfo(`update(formId="BDh"): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`update(formId="BDh") state: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`update(formId="BDh") state: JSON.stringify(subject.formIds)=${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["BDh"]');
      logInfo(`update(formId="BDh") state: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`update(formId="BDh") state: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[""]');
      logInfo(`update(formId="BDh") state: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`update(formId="BDh") state: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelUpdate_0074 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_UPDATE_0075
     * @tc.name      FormExtAbility_FormStoreModelUpdate_0075
     * @tc.desc      FormStoreModel.update(formId="s") yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelUpdate_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelUpdate_0075 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.update('s');
      logInfo(`update(formId="s"): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`update(formId="s") state: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`update(formId="s") state: JSON.stringify(subject.formIds)=${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["s"]');
      logInfo(`update(formId="s") state: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`update(formId="s") state: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[""]');
      logInfo(`update(formId="s") state: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`update(formId="s") state: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelUpdate_0075 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_UPDATE_0076
     * @tc.name      FormExtAbility_FormStoreModelUpdate_0076
     * @tc.desc      FormStoreModel.update(formId="hneFHN") yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelUpdate_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelUpdate_0076 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.update('hneFHN');
      logInfo(`update(formId="hneFHN"): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`update(formId="hneFHN") state: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`update(formId="hneFHN") state: JSON.stringify(subject.formIds)=${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["hneFHN"]');
      logInfo(`update(formId="hneFHN") state: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`update(formId="hneFHN") state: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[""]');
      logInfo(`update(formId="hneFHN") state: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`update(formId="hneFHN") state: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelUpdate_0076 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_UPDATE_0077
     * @tc.name      FormExtAbility_FormStoreModelUpdate_0077
     * @tc.desc      FormStoreModel.update(formId="OWHOCN9") yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelUpdate_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelUpdate_0077 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.update('OWHOCN9');
      logInfo(`update(formId="OWHOCN9"): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`update(formId="OWHOCN9") state: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`update(formId="OWHOCN9") state: JSON.stringify(subject.formIds)=${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["OWHOCN9"]');
      logInfo(`update(formId="OWHOCN9") state: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`update(formId="OWHOCN9") state: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[""]');
      logInfo(`update(formId="OWHOCN9") state: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`update(formId="OWHOCN9") state: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelUpdate_0077 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_UPDATE_0078
     * @tc.name      FormExtAbility_FormStoreModelUpdate_0078
     * @tc.desc      FormStoreModel.update(formId="J") yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelUpdate_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelUpdate_0078 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.update('J');
      logInfo(`update(formId="J"): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`update(formId="J") state: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`update(formId="J") state: JSON.stringify(subject.formIds)=${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["J"]');
      logInfo(`update(formId="J") state: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`update(formId="J") state: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[""]');
      logInfo(`update(formId="J") state: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`update(formId="J") state: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelUpdate_0078 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_UPDATE_0079
     * @tc.name      FormExtAbility_FormStoreModelUpdate_0079
     * @tc.desc      FormStoreModel.update(formId="I3owLXk") yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelUpdate_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelUpdate_0079 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.update('I3owLXk');
      logInfo(`update(formId="I3owLXk"): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`update(formId="I3owLXk") state: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`update(formId="I3owLXk") state: JSON.stringify(subject.formIds)=${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["I3owLXk"]');
      logInfo(`update(formId="I3owLXk") state: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`update(formId="I3owLXk") state: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[""]');
      logInfo(`update(formId="I3owLXk") state: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`update(formId="I3owLXk") state: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelUpdate_0079 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_UPDATE_0080
     * @tc.name      FormExtAbility_FormStoreModelUpdate_0080
     * @tc.desc      FormStoreModel.update(formId="ieTkUldtckSs") yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelUpdate_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelUpdate_0080 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.update('ieTkUldtckSs');
      logInfo(`update(formId="ieTkUldtckSs"): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`update(formId="ieTkUldtckSs") state: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`update(formId="ieTkUldtckSs") state: JSON.stringify(subject.formI...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["ieTkUldtckSs"]');
      logInfo(`update(formId="ieTkUldtckSs") state: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`update(formId="ieTkUldtckSs") state: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[""]');
      logInfo(`update(formId="ieTkUldtckSs") state: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`update(formId="ieTkUldtckSs") state: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelUpdate_0080 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_UPDATE_0081
     * @tc.name      FormExtAbility_FormStoreModelUpdate_0081
     * @tc.desc      FormStoreModel.update(formId="tWQ") yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelUpdate_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelUpdate_0081 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.update('tWQ');
      logInfo(`update(formId="tWQ"): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`update(formId="tWQ") state: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`update(formId="tWQ") state: JSON.stringify(subject.formIds)=${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["tWQ"]');
      logInfo(`update(formId="tWQ") state: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`update(formId="tWQ") state: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[""]');
      logInfo(`update(formId="tWQ") state: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`update(formId="tWQ") state: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelUpdate_0081 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_UPDATE_0082
     * @tc.name      FormExtAbility_FormStoreModelUpdate_0082
     * @tc.desc      FormStoreModel.update(formId="abHU1akRpQyE") yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelUpdate_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelUpdate_0082 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.update('abHU1akRpQyE');
      logInfo(`update(formId="abHU1akRpQyE"): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`update(formId="abHU1akRpQyE") state: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`update(formId="abHU1akRpQyE") state: JSON.stringify(subject.formI...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["abHU1akRpQyE"]');
      logInfo(`update(formId="abHU1akRpQyE") state: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`update(formId="abHU1akRpQyE") state: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[""]');
      logInfo(`update(formId="abHU1akRpQyE") state: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`update(formId="abHU1akRpQyE") state: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelUpdate_0082 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_UPDATE_0083
     * @tc.name      FormExtAbility_FormStoreModelUpdate_0083
     * @tc.desc      FormStoreModel.update(formId="LvrtP8oo") yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelUpdate_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelUpdate_0083 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.update('LvrtP8oo');
      logInfo(`update(formId="LvrtP8oo"): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`update(formId="LvrtP8oo") state: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`update(formId="LvrtP8oo") state: JSON.stringify(subject.formIds)=${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["LvrtP8oo"]');
      logInfo(`update(formId="LvrtP8oo") state: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`update(formId="LvrtP8oo") state: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[""]');
      logInfo(`update(formId="LvrtP8oo") state: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`update(formId="LvrtP8oo") state: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelUpdate_0083 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_UPDATE_0084
     * @tc.name      FormExtAbility_FormStoreModelUpdate_0084
     * @tc.desc      FormStoreModel.update(formId="VJUmCobs8o") yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelUpdate_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelUpdate_0084 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.update('VJUmCobs8o');
      logInfo(`update(formId="VJUmCobs8o"): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`update(formId="VJUmCobs8o") state: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`update(formId="VJUmCobs8o") state: JSON.stringify(subject.formIds)=${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["VJUmCobs8o"]');
      logInfo(`update(formId="VJUmCobs8o") state: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`update(formId="VJUmCobs8o") state: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[""]');
      logInfo(`update(formId="VJUmCobs8o") state: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`update(formId="VJUmCobs8o") state: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelUpdate_0084 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_UPDATE_0085
     * @tc.name      FormExtAbility_FormStoreModelUpdate_0085
     * @tc.desc      FormStoreModel.update(formId="xmcsPKMRBBav") yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelUpdate_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelUpdate_0085 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.update('xmcsPKMRBBav');
      logInfo(`update(formId="xmcsPKMRBBav"): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`update(formId="xmcsPKMRBBav") state: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`update(formId="xmcsPKMRBBav") state: JSON.stringify(subject.formI...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["xmcsPKMRBBav"]');
      logInfo(`update(formId="xmcsPKMRBBav") state: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`update(formId="xmcsPKMRBBav") state: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[""]');
      logInfo(`update(formId="xmcsPKMRBBav") state: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`update(formId="xmcsPKMRBBav") state: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelUpdate_0085 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_UPDATE_0086
     * @tc.name      FormExtAbility_FormStoreModelUpdate_0086
     * @tc.desc      FormStoreModel.update(formId="XTCQt") yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelUpdate_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelUpdate_0086 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.update('XTCQt');
      logInfo(`update(formId="XTCQt"): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`update(formId="XTCQt") state: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`update(formId="XTCQt") state: JSON.stringify(subject.formIds)=${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["XTCQt"]');
      logInfo(`update(formId="XTCQt") state: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`update(formId="XTCQt") state: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[""]');
      logInfo(`update(formId="XTCQt") state: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`update(formId="XTCQt") state: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelUpdate_0086 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_UPDATE_0087
     * @tc.name      FormExtAbility_FormStoreModelUpdate_0087
     * @tc.desc      FormStoreModel.update(formId="35bvadQURnd0") yields "24"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelUpdate_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelUpdate_0087 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.update('35bvadQURnd0');
      logInfo(`update(formId="35bvadQURnd0"): actual=${actual}`);
      expect(actual).assertEqual('24');
      logInfo(`update(formId="35bvadQURnd0") state: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`update(formId="35bvadQURnd0") state: JSON.stringify(subject.formI...${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["35bvadQURnd0"]');
      logInfo(`update(formId="35bvadQURnd0") state: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`update(formId="35bvadQURnd0") state: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[""]');
      logInfo(`update(formId="35bvadQURnd0") state: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`update(formId="35bvadQURnd0") state: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelUpdate_0087 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_UPDATE_0088
     * @tc.name      FormExtAbility_FormStoreModelUpdate_0088
     * @tc.desc      FormStoreModel.update(formId="z8tV4RGeuP7") yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelUpdate_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelUpdate_0088 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.update('z8tV4RGeuP7');
      logInfo(`update(formId="z8tV4RGeuP7"): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`update(formId="z8tV4RGeuP7") state: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`update(formId="z8tV4RGeuP7") state: JSON.stringify(subject.formIds)=${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["z8tV4RGeuP7"]');
      logInfo(`update(formId="z8tV4RGeuP7") state: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`update(formId="z8tV4RGeuP7") state: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[""]');
      logInfo(`update(formId="z8tV4RGeuP7") state: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`update(formId="z8tV4RGeuP7") state: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelUpdate_0088 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_UPDATE_0089
     * @tc.name      FormExtAbility_FormStoreModelUpdate_0089
     * @tc.desc      FormStoreModel.update(formId="MT7krsynX") yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelUpdate_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelUpdate_0089 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.update('MT7krsynX');
      logInfo(`update(formId="MT7krsynX"): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`update(formId="MT7krsynX") state: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`update(formId="MT7krsynX") state: JSON.stringify(subject.formIds)=${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["MT7krsynX"]');
      logInfo(`update(formId="MT7krsynX") state: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`update(formId="MT7krsynX") state: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[""]');
      logInfo(`update(formId="MT7krsynX") state: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`update(formId="MT7krsynX") state: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelUpdate_0089 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_STORE_MODEL_UPDATE_0090
     * @tc.name      FormExtAbility_FormStoreModelUpdate_0090
     * @tc.desc      FormStoreModel.update(formId="Dsm9CWBaO") yields "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormStoreModelUpdate_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormStoreModelUpdate_0090 begin`);
      const subject: FormStoreModel = new FormStoreModel();
      const actual: string = subject.update('Dsm9CWBaO');
      logInfo(`update(formId="Dsm9CWBaO"): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`update(formId="Dsm9CWBaO") state: subject.formIds.length=${subject.formIds.length}`);
      expect(subject.formIds.length).assertEqual(1);
      logInfo(`update(formId="Dsm9CWBaO") state: JSON.stringify(subject.formIds)=${JSON.stringify(subject.formIds)}`);
      expect(JSON.stringify(subject.formIds)).assertEqual('["Dsm9CWBaO"]');
      logInfo(`update(formId="Dsm9CWBaO") state: subject.names.length=${subject.names.length}`);
      expect(subject.names.length).assertEqual(1);
      logInfo(`update(formId="Dsm9CWBaO") state: JSON.stringify(subject.names)=${JSON.stringify(subject.names)}`);
      expect(JSON.stringify(subject.names)).assertEqual('[""]');
      logInfo(`update(formId="Dsm9CWBaO") state: subject.temps.length=${subject.temps.length}`);
      expect(subject.temps.length).assertEqual(1);
      logInfo(`update(formId="Dsm9CWBaO") state: JSON.stringify(subject.temps)=${JSON.stringify(subject.temps)}`);
      expect(JSON.stringify(subject.temps)).assertEqual('[false]');
      logInfo(`${BUNDLE}FormStoreModelUpdate_0090 end`);
    });
  });
}
