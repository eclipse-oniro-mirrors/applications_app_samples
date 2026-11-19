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
import { FormRecord } from './model/FormExtLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_FormExtAbility]';
const BUNDLE: string = 'FormExtAbility_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for new FormRecord (13 cases). */
export default function formRecordCtor2Test(): void {
  describe('FormRecordCtor2Test', (): void => {
    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_RECORD_CTOR_0078
     * @tc.name      FormExtAbility_FormRecordCtor_0078
     * @tc.desc      new FormRecord("hello world", false, 10) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormRecordCtor_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRecordCtor_0078 begin`);
      const subject: FormRecord = new FormRecord('hello world', false, 10);
      logInfo(`new FormRecord("hello world", false, 10): subject.formName=${subject.formName}`);
      expect(subject.formName).assertEqual('hello world');
      logInfo(`new FormRecord("hello world", false, 10): subject.tempFlag=${subject.tempFlag}`);
      expect(subject.tempFlag).assertFalse();
      logInfo(`new FormRecord("hello world", false, 10): subject.updateCount=${subject.updateCount}`);
      expect(subject.updateCount).assertEqual(10);
      logInfo(`${BUNDLE}FormRecordCtor_0078 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_RECORD_CTOR_0079
     * @tc.name      FormExtAbility_FormRecordCtor_0079
     * @tc.desc      new FormRecord("A", false, 15) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormRecordCtor_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRecordCtor_0079 begin`);
      const subject: FormRecord = new FormRecord('A', false, 15);
      logInfo(`new FormRecord("A", false, 15): subject.formName=${subject.formName}`);
      expect(subject.formName).assertEqual('A');
      logInfo(`new FormRecord("A", false, 15): subject.tempFlag=${subject.tempFlag}`);
      expect(subject.tempFlag).assertFalse();
      logInfo(`new FormRecord("A", false, 15): subject.updateCount=${subject.updateCount}`);
      expect(subject.updateCount).assertEqual(15);
      logInfo(`${BUNDLE}FormRecordCtor_0079 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_RECORD_CTOR_0080
     * @tc.name      FormExtAbility_FormRecordCtor_0080
     * @tc.desc      new FormRecord("Hello World", false, 31) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormRecordCtor_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRecordCtor_0080 begin`);
      const subject: FormRecord = new FormRecord('Hello World', false, 31);
      logInfo(`new FormRecord("Hello World", false, 31): subject.formName=${subject.formName}`);
      expect(subject.formName).assertEqual('Hello World');
      logInfo(`new FormRecord("Hello World", false, 31): subject.tempFlag=${subject.tempFlag}`);
      expect(subject.tempFlag).assertFalse();
      logInfo(`new FormRecord("Hello World", false, 31): subject.updateCount=${subject.updateCount}`);
      expect(subject.updateCount).assertEqual(31);
      logInfo(`${BUNDLE}FormRecordCtor_0080 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_RECORD_CTOR_0081
     * @tc.name      FormExtAbility_FormRecordCtor_0081
     * @tc.desc      new FormRecord("abc", true, 15) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormRecordCtor_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRecordCtor_0081 begin`);
      const subject: FormRecord = new FormRecord('abc', true, 15);
      logInfo(`new FormRecord("abc", true, 15): subject.formName=${subject.formName}`);
      expect(subject.formName).assertEqual('abc');
      logInfo(`new FormRecord("abc", true, 15): subject.tempFlag=${subject.tempFlag}`);
      expect(subject.tempFlag).assertTrue();
      logInfo(`new FormRecord("abc", true, 15): subject.updateCount=${subject.updateCount}`);
      expect(subject.updateCount).assertEqual(15);
      logInfo(`${BUNDLE}FormRecordCtor_0081 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_RECORD_CTOR_0082
     * @tc.name      FormExtAbility_FormRecordCtor_0082
     * @tc.desc      new FormRecord("??", true, 10) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormRecordCtor_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRecordCtor_0082 begin`);
      const subject: FormRecord = new FormRecord('\u4e2d\u6587', true, 10);
      logInfo(`new FormRecord("??", true, 10): subject.formName=${subject.formName}`);
      expect(subject.formName).assertEqual('\u4e2d\u6587');
      logInfo(`new FormRecord("??", true, 10): subject.tempFlag=${subject.tempFlag}`);
      expect(subject.tempFlag).assertTrue();
      logInfo(`new FormRecord("??", true, 10): subject.updateCount=${subject.updateCount}`);
      expect(subject.updateCount).assertEqual(10);
      logInfo(`${BUNDLE}FormRecordCtor_0082 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_RECORD_CTOR_0083
     * @tc.name      FormExtAbility_FormRecordCtor_0083
     * @tc.desc      new FormRecord("abc", true, 28) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormRecordCtor_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRecordCtor_0083 begin`);
      const subject: FormRecord = new FormRecord('abc', true, 28);
      logInfo(`new FormRecord("abc", true, 28): subject.formName=${subject.formName}`);
      expect(subject.formName).assertEqual('abc');
      logInfo(`new FormRecord("abc", true, 28): subject.tempFlag=${subject.tempFlag}`);
      expect(subject.tempFlag).assertTrue();
      logInfo(`new FormRecord("abc", true, 28): subject.updateCount=${subject.updateCount}`);
      expect(subject.updateCount).assertEqual(28);
      logInfo(`${BUNDLE}FormRecordCtor_0083 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_RECORD_CTOR_0084
     * @tc.name      FormExtAbility_FormRecordCtor_0084
     * @tc.desc      new FormRecord("hello world", true, -1) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormRecordCtor_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRecordCtor_0084 begin`);
      const subject: FormRecord = new FormRecord('hello world', true, -1);
      logInfo(`new FormRecord("hello world", true, -1): subject.formName=${subject.formName}`);
      expect(subject.formName).assertEqual('hello world');
      logInfo(`new FormRecord("hello world", true, -1): subject.tempFlag=${subject.tempFlag}`);
      expect(subject.tempFlag).assertTrue();
      logInfo(`new FormRecord("hello world", true, -1): subject.updateCount=${subject.updateCount}`);
      expect(subject.updateCount).assertEqual(-1);
      logInfo(`${BUNDLE}FormRecordCtor_0084 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_RECORD_CTOR_0085
     * @tc.name      FormExtAbility_FormRecordCtor_0085
     * @tc.desc      new FormRecord("abc", true, 29) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormRecordCtor_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRecordCtor_0085 begin`);
      const subject: FormRecord = new FormRecord('abc', true, 29);
      logInfo(`new FormRecord("abc", true, 29): subject.formName=${subject.formName}`);
      expect(subject.formName).assertEqual('abc');
      logInfo(`new FormRecord("abc", true, 29): subject.tempFlag=${subject.tempFlag}`);
      expect(subject.tempFlag).assertTrue();
      logInfo(`new FormRecord("abc", true, 29): subject.updateCount=${subject.updateCount}`);
      expect(subject.updateCount).assertEqual(29);
      logInfo(`${BUNDLE}FormRecordCtor_0085 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_RECORD_CTOR_0086
     * @tc.name      FormExtAbility_FormRecordCtor_0086
     * @tc.desc      new FormRecord("Hello World", false, 10) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormRecordCtor_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRecordCtor_0086 begin`);
      const subject: FormRecord = new FormRecord('Hello World', false, 10);
      logInfo(`new FormRecord("Hello World", false, 10): subject.formName=${subject.formName}`);
      expect(subject.formName).assertEqual('Hello World');
      logInfo(`new FormRecord("Hello World", false, 10): subject.tempFlag=${subject.tempFlag}`);
      expect(subject.tempFlag).assertFalse();
      logInfo(`new FormRecord("Hello World", false, 10): subject.updateCount=${subject.updateCount}`);
      expect(subject.updateCount).assertEqual(10);
      logInfo(`${BUNDLE}FormRecordCtor_0086 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_RECORD_CTOR_0087
     * @tc.name      FormExtAbility_FormRecordCtor_0087
     * @tc.desc      new FormRecord(" ", false, 30) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormRecordCtor_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRecordCtor_0087 begin`);
      const subject: FormRecord = new FormRecord(' ', false, 30);
      logInfo(`new FormRecord(" ", false, 30): subject.formName=${subject.formName}`);
      expect(subject.formName).assertEqual(' ');
      logInfo(`new FormRecord(" ", false, 30): subject.tempFlag=${subject.tempFlag}`);
      expect(subject.tempFlag).assertFalse();
      logInfo(`new FormRecord(" ", false, 30): subject.updateCount=${subject.updateCount}`);
      expect(subject.updateCount).assertEqual(30);
      logInfo(`${BUNDLE}FormRecordCtor_0087 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_RECORD_CTOR_0088
     * @tc.name      FormExtAbility_FormRecordCtor_0088
     * @tc.desc      new FormRecord("", true, 10) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormRecordCtor_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRecordCtor_0088 begin`);
      const subject: FormRecord = new FormRecord('', true, 10);
      logInfo(`new FormRecord("", true, 10): subject.formName=${subject.formName}`);
      expect(subject.formName).assertEqual('');
      logInfo(`new FormRecord("", true, 10): subject.tempFlag=${subject.tempFlag}`);
      expect(subject.tempFlag).assertTrue();
      logInfo(`new FormRecord("", true, 10): subject.updateCount=${subject.updateCount}`);
      expect(subject.updateCount).assertEqual(10);
      logInfo(`${BUNDLE}FormRecordCtor_0088 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_RECORD_CTOR_0089
     * @tc.name      FormExtAbility_FormRecordCtor_0089
     * @tc.desc      new FormRecord("A", false, 31) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormRecordCtor_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRecordCtor_0089 begin`);
      const subject: FormRecord = new FormRecord('A', false, 31);
      logInfo(`new FormRecord("A", false, 31): subject.formName=${subject.formName}`);
      expect(subject.formName).assertEqual('A');
      logInfo(`new FormRecord("A", false, 31): subject.tempFlag=${subject.tempFlag}`);
      expect(subject.tempFlag).assertFalse();
      logInfo(`new FormRecord("A", false, 31): subject.updateCount=${subject.updateCount}`);
      expect(subject.updateCount).assertEqual(31);
      logInfo(`${BUNDLE}FormRecordCtor_0089 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_RECORD_CTOR_0090
     * @tc.name      FormExtAbility_FormRecordCtor_0090
     * @tc.desc      new FormRecord("a", true, 100) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormRecordCtor_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRecordCtor_0090 begin`);
      const subject: FormRecord = new FormRecord('a', true, 100);
      logInfo(`new FormRecord("a", true, 100): subject.formName=${subject.formName}`);
      expect(subject.formName).assertEqual('a');
      logInfo(`new FormRecord("a", true, 100): subject.tempFlag=${subject.tempFlag}`);
      expect(subject.tempFlag).assertTrue();
      logInfo(`new FormRecord("a", true, 100): subject.updateCount=${subject.updateCount}`);
      expect(subject.updateCount).assertEqual(100);
      logInfo(`${BUNDLE}FormRecordCtor_0090 end`);
    });
  });
}
