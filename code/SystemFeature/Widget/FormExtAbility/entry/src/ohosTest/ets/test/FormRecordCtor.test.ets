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

/** Logic checks for new FormRecord (77 cases). */
export default function formRecordCtorTest(): void {
  describe('FormRecordCtorTest', (): void => {
    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_RECORD_CTOR_0001
     * @tc.name      FormExtAbility_FormRecordCtor_0001
     * @tc.desc      new FormRecord("Hello", true, 1) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('FormExtAbility_FormRecordCtor_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}FormRecordCtor_0001 begin`);
      const subject: FormRecord = new FormRecord('Hello', true, 1);
      logInfo(`new FormRecord("Hello", true, 1): subject.formName=${subject.formName}`);
      expect(subject.formName).assertEqual('Hello');
      logInfo(`new FormRecord("Hello", true, 1): subject.tempFlag=${subject.tempFlag}`);
      expect(subject.tempFlag).assertTrue();
      logInfo(`new FormRecord("Hello", true, 1): subject.updateCount=${subject.updateCount}`);
      expect(subject.updateCount).assertEqual(1);
      logInfo(`${BUNDLE}FormRecordCtor_0001 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_RECORD_CTOR_0002
     * @tc.name      FormExtAbility_FormRecordCtor_0002
     * @tc.desc      new FormRecord("hello world", true, 1) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('FormExtAbility_FormRecordCtor_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}FormRecordCtor_0002 begin`);
      const subject: FormRecord = new FormRecord('hello world', true, 1);
      logInfo(`new FormRecord("hello world", true, 1): subject.formName=${subject.formName}`);
      expect(subject.formName).assertEqual('hello world');
      logInfo(`new FormRecord("hello world", true, 1): subject.tempFlag=${subject.tempFlag}`);
      expect(subject.tempFlag).assertTrue();
      logInfo(`new FormRecord("hello world", true, 1): subject.updateCount=${subject.updateCount}`);
      expect(subject.updateCount).assertEqual(1);
      logInfo(`${BUNDLE}FormRecordCtor_0002 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_RECORD_CTOR_0003
     * @tc.name      FormExtAbility_FormRecordCtor_0003
     * @tc.desc      new FormRecord("", true, 1) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormRecordCtor_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRecordCtor_0003 begin`);
      const subject: FormRecord = new FormRecord('', true, 1);
      logInfo(`new FormRecord("", true, 1): subject.formName=${subject.formName}`);
      expect(subject.formName).assertEqual('');
      logInfo(`new FormRecord("", true, 1): subject.tempFlag=${subject.tempFlag}`);
      expect(subject.tempFlag).assertTrue();
      logInfo(`new FormRecord("", true, 1): subject.updateCount=${subject.updateCount}`);
      expect(subject.updateCount).assertEqual(1);
      logInfo(`${BUNDLE}FormRecordCtor_0003 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_RECORD_CTOR_0004
     * @tc.name      FormExtAbility_FormRecordCtor_0004
     * @tc.desc      new FormRecord(" ", true, 1) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormRecordCtor_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRecordCtor_0004 begin`);
      const subject: FormRecord = new FormRecord(' ', true, 1);
      logInfo(`new FormRecord(" ", true, 1): subject.formName=${subject.formName}`);
      expect(subject.formName).assertEqual(' ');
      logInfo(`new FormRecord(" ", true, 1): subject.tempFlag=${subject.tempFlag}`);
      expect(subject.tempFlag).assertTrue();
      logInfo(`new FormRecord(" ", true, 1): subject.updateCount=${subject.updateCount}`);
      expect(subject.updateCount).assertEqual(1);
      logInfo(`${BUNDLE}FormRecordCtor_0004 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_RECORD_CTOR_0005
     * @tc.name      FormExtAbility_FormRecordCtor_0005
     * @tc.desc      new FormRecord("A", true, 1) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormRecordCtor_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRecordCtor_0005 begin`);
      const subject: FormRecord = new FormRecord('A', true, 1);
      logInfo(`new FormRecord("A", true, 1): subject.formName=${subject.formName}`);
      expect(subject.formName).assertEqual('A');
      logInfo(`new FormRecord("A", true, 1): subject.tempFlag=${subject.tempFlag}`);
      expect(subject.tempFlag).assertTrue();
      logInfo(`new FormRecord("A", true, 1): subject.updateCount=${subject.updateCount}`);
      expect(subject.updateCount).assertEqual(1);
      logInfo(`${BUNDLE}FormRecordCtor_0005 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_RECORD_CTOR_0006
     * @tc.name      FormExtAbility_FormRecordCtor_0006
     * @tc.desc      new FormRecord("Sample Title 123", true, 1) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormRecordCtor_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRecordCtor_0006 begin`);
      const subject: FormRecord = new FormRecord('Sample Title 123', true, 1);
      logInfo(`new FormRecord("Sample Title 123", true, 1): subject.formName=${subject.formName}`);
      expect(subject.formName).assertEqual('Sample Title 123');
      logInfo(`new FormRecord("Sample Title 123", true, 1): subject.tempFlag=${subject.tempFlag}`);
      expect(subject.tempFlag).assertTrue();
      logInfo(`new FormRecord("Sample Title 123", true, 1): subject.updateCount=${subject.updateCount}`);
      expect(subject.updateCount).assertEqual(1);
      logInfo(`${BUNDLE}FormRecordCtor_0006 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_RECORD_CTOR_0007
     * @tc.name      FormExtAbility_FormRecordCtor_0007
     * @tc.desc      new FormRecord("??", true, 1) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormRecordCtor_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRecordCtor_0007 begin`);
      const subject: FormRecord = new FormRecord('\u4e2d\u6587', true, 1);
      logInfo(`new FormRecord("??", true, 1): subject.formName=${subject.formName}`);
      expect(subject.formName).assertEqual('\u4e2d\u6587');
      logInfo(`new FormRecord("??", true, 1): subject.tempFlag=${subject.tempFlag}`);
      expect(subject.tempFlag).assertTrue();
      logInfo(`new FormRecord("??", true, 1): subject.updateCount=${subject.updateCount}`);
      expect(subject.updateCount).assertEqual(1);
      logInfo(`${BUNDLE}FormRecordCtor_0007 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_RECORD_CTOR_0008
     * @tc.name      FormExtAbility_FormRecordCtor_0008
     * @tc.desc      new FormRecord("a", true, 1) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormRecordCtor_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRecordCtor_0008 begin`);
      const subject: FormRecord = new FormRecord('a', true, 1);
      logInfo(`new FormRecord("a", true, 1): subject.formName=${subject.formName}`);
      expect(subject.formName).assertEqual('a');
      logInfo(`new FormRecord("a", true, 1): subject.tempFlag=${subject.tempFlag}`);
      expect(subject.tempFlag).assertTrue();
      logInfo(`new FormRecord("a", true, 1): subject.updateCount=${subject.updateCount}`);
      expect(subject.updateCount).assertEqual(1);
      logInfo(`${BUNDLE}FormRecordCtor_0008 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_RECORD_CTOR_0009
     * @tc.name      FormExtAbility_FormRecordCtor_0009
     * @tc.desc      new FormRecord("abc", true, 1) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormRecordCtor_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRecordCtor_0009 begin`);
      const subject: FormRecord = new FormRecord('abc', true, 1);
      logInfo(`new FormRecord("abc", true, 1): subject.formName=${subject.formName}`);
      expect(subject.formName).assertEqual('abc');
      logInfo(`new FormRecord("abc", true, 1): subject.tempFlag=${subject.tempFlag}`);
      expect(subject.tempFlag).assertTrue();
      logInfo(`new FormRecord("abc", true, 1): subject.updateCount=${subject.updateCount}`);
      expect(subject.updateCount).assertEqual(1);
      logInfo(`${BUNDLE}FormRecordCtor_0009 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_RECORD_CTOR_0010
     * @tc.name      FormExtAbility_FormRecordCtor_0010
     * @tc.desc      new FormRecord("Hello World", true, 1) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormRecordCtor_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRecordCtor_0010 begin`);
      const subject: FormRecord = new FormRecord('Hello World', true, 1);
      logInfo(`new FormRecord("Hello World", true, 1): subject.formName=${subject.formName}`);
      expect(subject.formName).assertEqual('Hello World');
      logInfo(`new FormRecord("Hello World", true, 1): subject.tempFlag=${subject.tempFlag}`);
      expect(subject.tempFlag).assertTrue();
      logInfo(`new FormRecord("Hello World", true, 1): subject.updateCount=${subject.updateCount}`);
      expect(subject.updateCount).assertEqual(1);
      logInfo(`${BUNDLE}FormRecordCtor_0010 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_RECORD_CTOR_0011
     * @tc.name      FormExtAbility_FormRecordCtor_0011
     * @tc.desc      new FormRecord("Hello", false, 1) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormRecordCtor_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRecordCtor_0011 begin`);
      const subject: FormRecord = new FormRecord('Hello', false, 1);
      logInfo(`new FormRecord("Hello", false, 1): subject.formName=${subject.formName}`);
      expect(subject.formName).assertEqual('Hello');
      logInfo(`new FormRecord("Hello", false, 1): subject.tempFlag=${subject.tempFlag}`);
      expect(subject.tempFlag).assertFalse();
      logInfo(`new FormRecord("Hello", false, 1): subject.updateCount=${subject.updateCount}`);
      expect(subject.updateCount).assertEqual(1);
      logInfo(`${BUNDLE}FormRecordCtor_0011 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_RECORD_CTOR_0012
     * @tc.name      FormExtAbility_FormRecordCtor_0012
     * @tc.desc      new FormRecord("Hello", true, 15) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormRecordCtor_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRecordCtor_0012 begin`);
      const subject: FormRecord = new FormRecord('Hello', true, 15);
      logInfo(`new FormRecord("Hello", true, 15): subject.formName=${subject.formName}`);
      expect(subject.formName).assertEqual('Hello');
      logInfo(`new FormRecord("Hello", true, 15): subject.tempFlag=${subject.tempFlag}`);
      expect(subject.tempFlag).assertTrue();
      logInfo(`new FormRecord("Hello", true, 15): subject.updateCount=${subject.updateCount}`);
      expect(subject.updateCount).assertEqual(15);
      logInfo(`${BUNDLE}FormRecordCtor_0012 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_RECORD_CTOR_0013
     * @tc.name      FormExtAbility_FormRecordCtor_0013
     * @tc.desc      new FormRecord("Hello", true, 28) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormRecordCtor_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRecordCtor_0013 begin`);
      const subject: FormRecord = new FormRecord('Hello', true, 28);
      logInfo(`new FormRecord("Hello", true, 28): subject.formName=${subject.formName}`);
      expect(subject.formName).assertEqual('Hello');
      logInfo(`new FormRecord("Hello", true, 28): subject.tempFlag=${subject.tempFlag}`);
      expect(subject.tempFlag).assertTrue();
      logInfo(`new FormRecord("Hello", true, 28): subject.updateCount=${subject.updateCount}`);
      expect(subject.updateCount).assertEqual(28);
      logInfo(`${BUNDLE}FormRecordCtor_0013 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_RECORD_CTOR_0014
     * @tc.name      FormExtAbility_FormRecordCtor_0014
     * @tc.desc      new FormRecord("Hello", true, 29) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormRecordCtor_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRecordCtor_0014 begin`);
      const subject: FormRecord = new FormRecord('Hello', true, 29);
      logInfo(`new FormRecord("Hello", true, 29): subject.formName=${subject.formName}`);
      expect(subject.formName).assertEqual('Hello');
      logInfo(`new FormRecord("Hello", true, 29): subject.tempFlag=${subject.tempFlag}`);
      expect(subject.tempFlag).assertTrue();
      logInfo(`new FormRecord("Hello", true, 29): subject.updateCount=${subject.updateCount}`);
      expect(subject.updateCount).assertEqual(29);
      logInfo(`${BUNDLE}FormRecordCtor_0014 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_RECORD_CTOR_0015
     * @tc.name      FormExtAbility_FormRecordCtor_0015
     * @tc.desc      new FormRecord("Hello", true, 30) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormRecordCtor_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRecordCtor_0015 begin`);
      const subject: FormRecord = new FormRecord('Hello', true, 30);
      logInfo(`new FormRecord("Hello", true, 30): subject.formName=${subject.formName}`);
      expect(subject.formName).assertEqual('Hello');
      logInfo(`new FormRecord("Hello", true, 30): subject.tempFlag=${subject.tempFlag}`);
      expect(subject.tempFlag).assertTrue();
      logInfo(`new FormRecord("Hello", true, 30): subject.updateCount=${subject.updateCount}`);
      expect(subject.updateCount).assertEqual(30);
      logInfo(`${BUNDLE}FormRecordCtor_0015 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_RECORD_CTOR_0016
     * @tc.name      FormExtAbility_FormRecordCtor_0016
     * @tc.desc      new FormRecord("Hello", true, 31) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormRecordCtor_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRecordCtor_0016 begin`);
      const subject: FormRecord = new FormRecord('Hello', true, 31);
      logInfo(`new FormRecord("Hello", true, 31): subject.formName=${subject.formName}`);
      expect(subject.formName).assertEqual('Hello');
      logInfo(`new FormRecord("Hello", true, 31): subject.tempFlag=${subject.tempFlag}`);
      expect(subject.tempFlag).assertTrue();
      logInfo(`new FormRecord("Hello", true, 31): subject.updateCount=${subject.updateCount}`);
      expect(subject.updateCount).assertEqual(31);
      logInfo(`${BUNDLE}FormRecordCtor_0016 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_RECORD_CTOR_0017
     * @tc.name      FormExtAbility_FormRecordCtor_0017
     * @tc.desc      new FormRecord("Hello", true, 0) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormRecordCtor_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRecordCtor_0017 begin`);
      const subject: FormRecord = new FormRecord('Hello', true, 0);
      logInfo(`new FormRecord("Hello", true, 0): subject.formName=${subject.formName}`);
      expect(subject.formName).assertEqual('Hello');
      logInfo(`new FormRecord("Hello", true, 0): subject.tempFlag=${subject.tempFlag}`);
      expect(subject.tempFlag).assertTrue();
      logInfo(`new FormRecord("Hello", true, 0): subject.updateCount=${subject.updateCount}`);
      expect(subject.updateCount).assertEqual(0);
      logInfo(`${BUNDLE}FormRecordCtor_0017 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_RECORD_CTOR_0018
     * @tc.name      FormExtAbility_FormRecordCtor_0018
     * @tc.desc      new FormRecord("Hello", true, -1) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormRecordCtor_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRecordCtor_0018 begin`);
      const subject: FormRecord = new FormRecord('Hello', true, -1);
      logInfo(`new FormRecord("Hello", true, -1): subject.formName=${subject.formName}`);
      expect(subject.formName).assertEqual('Hello');
      logInfo(`new FormRecord("Hello", true, -1): subject.tempFlag=${subject.tempFlag}`);
      expect(subject.tempFlag).assertTrue();
      logInfo(`new FormRecord("Hello", true, -1): subject.updateCount=${subject.updateCount}`);
      expect(subject.updateCount).assertEqual(-1);
      logInfo(`${BUNDLE}FormRecordCtor_0018 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_RECORD_CTOR_0019
     * @tc.name      FormExtAbility_FormRecordCtor_0019
     * @tc.desc      new FormRecord("Hello", true, 2) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormRecordCtor_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRecordCtor_0019 begin`);
      const subject: FormRecord = new FormRecord('Hello', true, 2);
      logInfo(`new FormRecord("Hello", true, 2): subject.formName=${subject.formName}`);
      expect(subject.formName).assertEqual('Hello');
      logInfo(`new FormRecord("Hello", true, 2): subject.tempFlag=${subject.tempFlag}`);
      expect(subject.tempFlag).assertTrue();
      logInfo(`new FormRecord("Hello", true, 2): subject.updateCount=${subject.updateCount}`);
      expect(subject.updateCount).assertEqual(2);
      logInfo(`${BUNDLE}FormRecordCtor_0019 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_RECORD_CTOR_0020
     * @tc.name      FormExtAbility_FormRecordCtor_0020
     * @tc.desc      new FormRecord("Hello", true, 3) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormRecordCtor_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRecordCtor_0020 begin`);
      const subject: FormRecord = new FormRecord('Hello', true, 3);
      logInfo(`new FormRecord("Hello", true, 3): subject.formName=${subject.formName}`);
      expect(subject.formName).assertEqual('Hello');
      logInfo(`new FormRecord("Hello", true, 3): subject.tempFlag=${subject.tempFlag}`);
      expect(subject.tempFlag).assertTrue();
      logInfo(`new FormRecord("Hello", true, 3): subject.updateCount=${subject.updateCount}`);
      expect(subject.updateCount).assertEqual(3);
      logInfo(`${BUNDLE}FormRecordCtor_0020 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_RECORD_CTOR_0021
     * @tc.name      FormExtAbility_FormRecordCtor_0021
     * @tc.desc      new FormRecord("Hello", true, 10) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormRecordCtor_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRecordCtor_0021 begin`);
      const subject: FormRecord = new FormRecord('Hello', true, 10);
      logInfo(`new FormRecord("Hello", true, 10): subject.formName=${subject.formName}`);
      expect(subject.formName).assertEqual('Hello');
      logInfo(`new FormRecord("Hello", true, 10): subject.tempFlag=${subject.tempFlag}`);
      expect(subject.tempFlag).assertTrue();
      logInfo(`new FormRecord("Hello", true, 10): subject.updateCount=${subject.updateCount}`);
      expect(subject.updateCount).assertEqual(10);
      logInfo(`${BUNDLE}FormRecordCtor_0021 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_RECORD_CTOR_0022
     * @tc.name      FormExtAbility_FormRecordCtor_0022
     * @tc.desc      new FormRecord("Hello", true, 100) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormRecordCtor_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRecordCtor_0022 begin`);
      const subject: FormRecord = new FormRecord('Hello', true, 100);
      logInfo(`new FormRecord("Hello", true, 100): subject.formName=${subject.formName}`);
      expect(subject.formName).assertEqual('Hello');
      logInfo(`new FormRecord("Hello", true, 100): subject.tempFlag=${subject.tempFlag}`);
      expect(subject.tempFlag).assertTrue();
      logInfo(`new FormRecord("Hello", true, 100): subject.updateCount=${subject.updateCount}`);
      expect(subject.updateCount).assertEqual(100);
      logInfo(`${BUNDLE}FormRecordCtor_0022 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_RECORD_CTOR_0023
     * @tc.name      FormExtAbility_FormRecordCtor_0023
     * @tc.desc      new FormRecord("A", false, 28) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormRecordCtor_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRecordCtor_0023 begin`);
      const subject: FormRecord = new FormRecord('A', false, 28);
      logInfo(`new FormRecord("A", false, 28): subject.formName=${subject.formName}`);
      expect(subject.formName).assertEqual('A');
      logInfo(`new FormRecord("A", false, 28): subject.tempFlag=${subject.tempFlag}`);
      expect(subject.tempFlag).assertFalse();
      logInfo(`new FormRecord("A", false, 28): subject.updateCount=${subject.updateCount}`);
      expect(subject.updateCount).assertEqual(28);
      logInfo(`${BUNDLE}FormRecordCtor_0023 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_RECORD_CTOR_0024
     * @tc.name      FormExtAbility_FormRecordCtor_0024
     * @tc.desc      new FormRecord("", false, 10) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormRecordCtor_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRecordCtor_0024 begin`);
      const subject: FormRecord = new FormRecord('', false, 10);
      logInfo(`new FormRecord("", false, 10): subject.formName=${subject.formName}`);
      expect(subject.formName).assertEqual('');
      logInfo(`new FormRecord("", false, 10): subject.tempFlag=${subject.tempFlag}`);
      expect(subject.tempFlag).assertFalse();
      logInfo(`new FormRecord("", false, 10): subject.updateCount=${subject.updateCount}`);
      expect(subject.updateCount).assertEqual(10);
      logInfo(`${BUNDLE}FormRecordCtor_0024 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_RECORD_CTOR_0025
     * @tc.name      FormExtAbility_FormRecordCtor_0025
     * @tc.desc      new FormRecord("A", true, 3) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormRecordCtor_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRecordCtor_0025 begin`);
      const subject: FormRecord = new FormRecord('A', true, 3);
      logInfo(`new FormRecord("A", true, 3): subject.formName=${subject.formName}`);
      expect(subject.formName).assertEqual('A');
      logInfo(`new FormRecord("A", true, 3): subject.tempFlag=${subject.tempFlag}`);
      expect(subject.tempFlag).assertTrue();
      logInfo(`new FormRecord("A", true, 3): subject.updateCount=${subject.updateCount}`);
      expect(subject.updateCount).assertEqual(3);
      logInfo(`${BUNDLE}FormRecordCtor_0025 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_RECORD_CTOR_0026
     * @tc.name      FormExtAbility_FormRecordCtor_0026
     * @tc.desc      new FormRecord("hello world", true, 100) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormRecordCtor_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRecordCtor_0026 begin`);
      const subject: FormRecord = new FormRecord('hello world', true, 100);
      logInfo(`new FormRecord("hello world", true, 100): subject.formName=${subject.formName}`);
      expect(subject.formName).assertEqual('hello world');
      logInfo(`new FormRecord("hello world", true, 100): subject.tempFlag=${subject.tempFlag}`);
      expect(subject.tempFlag).assertTrue();
      logInfo(`new FormRecord("hello world", true, 100): subject.updateCount=${subject.updateCount}`);
      expect(subject.updateCount).assertEqual(100);
      logInfo(`${BUNDLE}FormRecordCtor_0026 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_RECORD_CTOR_0027
     * @tc.name      FormExtAbility_FormRecordCtor_0027
     * @tc.desc      new FormRecord("A", false, 100) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormRecordCtor_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRecordCtor_0027 begin`);
      const subject: FormRecord = new FormRecord('A', false, 100);
      logInfo(`new FormRecord("A", false, 100): subject.formName=${subject.formName}`);
      expect(subject.formName).assertEqual('A');
      logInfo(`new FormRecord("A", false, 100): subject.tempFlag=${subject.tempFlag}`);
      expect(subject.tempFlag).assertFalse();
      logInfo(`new FormRecord("A", false, 100): subject.updateCount=${subject.updateCount}`);
      expect(subject.updateCount).assertEqual(100);
      logInfo(`${BUNDLE}FormRecordCtor_0027 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_RECORD_CTOR_0028
     * @tc.name      FormExtAbility_FormRecordCtor_0028
     * @tc.desc      new FormRecord("abc", false, 100) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormRecordCtor_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRecordCtor_0028 begin`);
      const subject: FormRecord = new FormRecord('abc', false, 100);
      logInfo(`new FormRecord("abc", false, 100): subject.formName=${subject.formName}`);
      expect(subject.formName).assertEqual('abc');
      logInfo(`new FormRecord("abc", false, 100): subject.tempFlag=${subject.tempFlag}`);
      expect(subject.tempFlag).assertFalse();
      logInfo(`new FormRecord("abc", false, 100): subject.updateCount=${subject.updateCount}`);
      expect(subject.updateCount).assertEqual(100);
      logInfo(`${BUNDLE}FormRecordCtor_0028 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_RECORD_CTOR_0029
     * @tc.name      FormExtAbility_FormRecordCtor_0029
     * @tc.desc      new FormRecord("Hello World", false, 28) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormRecordCtor_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRecordCtor_0029 begin`);
      const subject: FormRecord = new FormRecord('Hello World', false, 28);
      logInfo(`new FormRecord("Hello World", false, 28): subject.formName=${subject.formName}`);
      expect(subject.formName).assertEqual('Hello World');
      logInfo(`new FormRecord("Hello World", false, 28): subject.tempFlag=${subject.tempFlag}`);
      expect(subject.tempFlag).assertFalse();
      logInfo(`new FormRecord("Hello World", false, 28): subject.updateCount=${subject.updateCount}`);
      expect(subject.updateCount).assertEqual(28);
      logInfo(`${BUNDLE}FormRecordCtor_0029 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_RECORD_CTOR_0030
     * @tc.name      FormExtAbility_FormRecordCtor_0030
     * @tc.desc      new FormRecord("hello world", true, 31) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormRecordCtor_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRecordCtor_0030 begin`);
      const subject: FormRecord = new FormRecord('hello world', true, 31);
      logInfo(`new FormRecord("hello world", true, 31): subject.formName=${subject.formName}`);
      expect(subject.formName).assertEqual('hello world');
      logInfo(`new FormRecord("hello world", true, 31): subject.tempFlag=${subject.tempFlag}`);
      expect(subject.tempFlag).assertTrue();
      logInfo(`new FormRecord("hello world", true, 31): subject.updateCount=${subject.updateCount}`);
      expect(subject.updateCount).assertEqual(31);
      logInfo(`${BUNDLE}FormRecordCtor_0030 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_RECORD_CTOR_0031
     * @tc.name      FormExtAbility_FormRecordCtor_0031
     * @tc.desc      new FormRecord("abc", false, 2) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormRecordCtor_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRecordCtor_0031 begin`);
      const subject: FormRecord = new FormRecord('abc', false, 2);
      logInfo(`new FormRecord("abc", false, 2): subject.formName=${subject.formName}`);
      expect(subject.formName).assertEqual('abc');
      logInfo(`new FormRecord("abc", false, 2): subject.tempFlag=${subject.tempFlag}`);
      expect(subject.tempFlag).assertFalse();
      logInfo(`new FormRecord("abc", false, 2): subject.updateCount=${subject.updateCount}`);
      expect(subject.updateCount).assertEqual(2);
      logInfo(`${BUNDLE}FormRecordCtor_0031 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_RECORD_CTOR_0032
     * @tc.name      FormExtAbility_FormRecordCtor_0032
     * @tc.desc      new FormRecord("??", false, 10) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormRecordCtor_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRecordCtor_0032 begin`);
      const subject: FormRecord = new FormRecord('\u4e2d\u6587', false, 10);
      logInfo(`new FormRecord("??", false, 10): subject.formName=${subject.formName}`);
      expect(subject.formName).assertEqual('\u4e2d\u6587');
      logInfo(`new FormRecord("??", false, 10): subject.tempFlag=${subject.tempFlag}`);
      expect(subject.tempFlag).assertFalse();
      logInfo(`new FormRecord("??", false, 10): subject.updateCount=${subject.updateCount}`);
      expect(subject.updateCount).assertEqual(10);
      logInfo(`${BUNDLE}FormRecordCtor_0032 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_RECORD_CTOR_0033
     * @tc.name      FormExtAbility_FormRecordCtor_0033
     * @tc.desc      new FormRecord(" ", true, 30) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormRecordCtor_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRecordCtor_0033 begin`);
      const subject: FormRecord = new FormRecord(' ', true, 30);
      logInfo(`new FormRecord(" ", true, 30): subject.formName=${subject.formName}`);
      expect(subject.formName).assertEqual(' ');
      logInfo(`new FormRecord(" ", true, 30): subject.tempFlag=${subject.tempFlag}`);
      expect(subject.tempFlag).assertTrue();
      logInfo(`new FormRecord(" ", true, 30): subject.updateCount=${subject.updateCount}`);
      expect(subject.updateCount).assertEqual(30);
      logInfo(`${BUNDLE}FormRecordCtor_0033 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_RECORD_CTOR_0034
     * @tc.name      FormExtAbility_FormRecordCtor_0034
     * @tc.desc      new FormRecord("", false, 29) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormRecordCtor_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRecordCtor_0034 begin`);
      const subject: FormRecord = new FormRecord('', false, 29);
      logInfo(`new FormRecord("", false, 29): subject.formName=${subject.formName}`);
      expect(subject.formName).assertEqual('');
      logInfo(`new FormRecord("", false, 29): subject.tempFlag=${subject.tempFlag}`);
      expect(subject.tempFlag).assertFalse();
      logInfo(`new FormRecord("", false, 29): subject.updateCount=${subject.updateCount}`);
      expect(subject.updateCount).assertEqual(29);
      logInfo(`${BUNDLE}FormRecordCtor_0034 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_RECORD_CTOR_0035
     * @tc.name      FormExtAbility_FormRecordCtor_0035
     * @tc.desc      new FormRecord("abc", false, 30) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormRecordCtor_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRecordCtor_0035 begin`);
      const subject: FormRecord = new FormRecord('abc', false, 30);
      logInfo(`new FormRecord("abc", false, 30): subject.formName=${subject.formName}`);
      expect(subject.formName).assertEqual('abc');
      logInfo(`new FormRecord("abc", false, 30): subject.tempFlag=${subject.tempFlag}`);
      expect(subject.tempFlag).assertFalse();
      logInfo(`new FormRecord("abc", false, 30): subject.updateCount=${subject.updateCount}`);
      expect(subject.updateCount).assertEqual(30);
      logInfo(`${BUNDLE}FormRecordCtor_0035 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_RECORD_CTOR_0036
     * @tc.name      FormExtAbility_FormRecordCtor_0036
     * @tc.desc      new FormRecord("A", false, 2) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormRecordCtor_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRecordCtor_0036 begin`);
      const subject: FormRecord = new FormRecord('A', false, 2);
      logInfo(`new FormRecord("A", false, 2): subject.formName=${subject.formName}`);
      expect(subject.formName).assertEqual('A');
      logInfo(`new FormRecord("A", false, 2): subject.tempFlag=${subject.tempFlag}`);
      expect(subject.tempFlag).assertFalse();
      logInfo(`new FormRecord("A", false, 2): subject.updateCount=${subject.updateCount}`);
      expect(subject.updateCount).assertEqual(2);
      logInfo(`${BUNDLE}FormRecordCtor_0036 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_RECORD_CTOR_0037
     * @tc.name      FormExtAbility_FormRecordCtor_0037
     * @tc.desc      new FormRecord("hello world", true, 3) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormRecordCtor_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRecordCtor_0037 begin`);
      const subject: FormRecord = new FormRecord('hello world', true, 3);
      logInfo(`new FormRecord("hello world", true, 3): subject.formName=${subject.formName}`);
      expect(subject.formName).assertEqual('hello world');
      logInfo(`new FormRecord("hello world", true, 3): subject.tempFlag=${subject.tempFlag}`);
      expect(subject.tempFlag).assertTrue();
      logInfo(`new FormRecord("hello world", true, 3): subject.updateCount=${subject.updateCount}`);
      expect(subject.updateCount).assertEqual(3);
      logInfo(`${BUNDLE}FormRecordCtor_0037 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_RECORD_CTOR_0038
     * @tc.name      FormExtAbility_FormRecordCtor_0038
     * @tc.desc      new FormRecord("a", true, 29) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormRecordCtor_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRecordCtor_0038 begin`);
      const subject: FormRecord = new FormRecord('a', true, 29);
      logInfo(`new FormRecord("a", true, 29): subject.formName=${subject.formName}`);
      expect(subject.formName).assertEqual('a');
      logInfo(`new FormRecord("a", true, 29): subject.tempFlag=${subject.tempFlag}`);
      expect(subject.tempFlag).assertTrue();
      logInfo(`new FormRecord("a", true, 29): subject.updateCount=${subject.updateCount}`);
      expect(subject.updateCount).assertEqual(29);
      logInfo(`${BUNDLE}FormRecordCtor_0038 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_RECORD_CTOR_0039
     * @tc.name      FormExtAbility_FormRecordCtor_0039
     * @tc.desc      new FormRecord("Hello World", true, 31) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormRecordCtor_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRecordCtor_0039 begin`);
      const subject: FormRecord = new FormRecord('Hello World', true, 31);
      logInfo(`new FormRecord("Hello World", true, 31): subject.formName=${subject.formName}`);
      expect(subject.formName).assertEqual('Hello World');
      logInfo(`new FormRecord("Hello World", true, 31): subject.tempFlag=${subject.tempFlag}`);
      expect(subject.tempFlag).assertTrue();
      logInfo(`new FormRecord("Hello World", true, 31): subject.updateCount=${subject.updateCount}`);
      expect(subject.updateCount).assertEqual(31);
      logInfo(`${BUNDLE}FormRecordCtor_0039 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_RECORD_CTOR_0040
     * @tc.name      FormExtAbility_FormRecordCtor_0040
     * @tc.desc      new FormRecord("a", true, 10) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormRecordCtor_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRecordCtor_0040 begin`);
      const subject: FormRecord = new FormRecord('a', true, 10);
      logInfo(`new FormRecord("a", true, 10): subject.formName=${subject.formName}`);
      expect(subject.formName).assertEqual('a');
      logInfo(`new FormRecord("a", true, 10): subject.tempFlag=${subject.tempFlag}`);
      expect(subject.tempFlag).assertTrue();
      logInfo(`new FormRecord("a", true, 10): subject.updateCount=${subject.updateCount}`);
      expect(subject.updateCount).assertEqual(10);
      logInfo(`${BUNDLE}FormRecordCtor_0040 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_RECORD_CTOR_0041
     * @tc.name      FormExtAbility_FormRecordCtor_0041
     * @tc.desc      new FormRecord("abc", true, 10) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormRecordCtor_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRecordCtor_0041 begin`);
      const subject: FormRecord = new FormRecord('abc', true, 10);
      logInfo(`new FormRecord("abc", true, 10): subject.formName=${subject.formName}`);
      expect(subject.formName).assertEqual('abc');
      logInfo(`new FormRecord("abc", true, 10): subject.tempFlag=${subject.tempFlag}`);
      expect(subject.tempFlag).assertTrue();
      logInfo(`new FormRecord("abc", true, 10): subject.updateCount=${subject.updateCount}`);
      expect(subject.updateCount).assertEqual(10);
      logInfo(`${BUNDLE}FormRecordCtor_0041 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_RECORD_CTOR_0042
     * @tc.name      FormExtAbility_FormRecordCtor_0042
     * @tc.desc      new FormRecord("", false, 100) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormRecordCtor_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRecordCtor_0042 begin`);
      const subject: FormRecord = new FormRecord('', false, 100);
      logInfo(`new FormRecord("", false, 100): subject.formName=${subject.formName}`);
      expect(subject.formName).assertEqual('');
      logInfo(`new FormRecord("", false, 100): subject.tempFlag=${subject.tempFlag}`);
      expect(subject.tempFlag).assertFalse();
      logInfo(`new FormRecord("", false, 100): subject.updateCount=${subject.updateCount}`);
      expect(subject.updateCount).assertEqual(100);
      logInfo(`${BUNDLE}FormRecordCtor_0042 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_RECORD_CTOR_0043
     * @tc.name      FormExtAbility_FormRecordCtor_0043
     * @tc.desc      new FormRecord("a", false, 10) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormRecordCtor_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRecordCtor_0043 begin`);
      const subject: FormRecord = new FormRecord('a', false, 10);
      logInfo(`new FormRecord("a", false, 10): subject.formName=${subject.formName}`);
      expect(subject.formName).assertEqual('a');
      logInfo(`new FormRecord("a", false, 10): subject.tempFlag=${subject.tempFlag}`);
      expect(subject.tempFlag).assertFalse();
      logInfo(`new FormRecord("a", false, 10): subject.updateCount=${subject.updateCount}`);
      expect(subject.updateCount).assertEqual(10);
      logInfo(`${BUNDLE}FormRecordCtor_0043 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_RECORD_CTOR_0044
     * @tc.name      FormExtAbility_FormRecordCtor_0044
     * @tc.desc      new FormRecord("", true, -1) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormRecordCtor_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRecordCtor_0044 begin`);
      const subject: FormRecord = new FormRecord('', true, -1);
      logInfo(`new FormRecord("", true, -1): subject.formName=${subject.formName}`);
      expect(subject.formName).assertEqual('');
      logInfo(`new FormRecord("", true, -1): subject.tempFlag=${subject.tempFlag}`);
      expect(subject.tempFlag).assertTrue();
      logInfo(`new FormRecord("", true, -1): subject.updateCount=${subject.updateCount}`);
      expect(subject.updateCount).assertEqual(-1);
      logInfo(`${BUNDLE}FormRecordCtor_0044 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_RECORD_CTOR_0045
     * @tc.name      FormExtAbility_FormRecordCtor_0045
     * @tc.desc      new FormRecord("", false, 0) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormRecordCtor_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRecordCtor_0045 begin`);
      const subject: FormRecord = new FormRecord('', false, 0);
      logInfo(`new FormRecord("", false, 0): subject.formName=${subject.formName}`);
      expect(subject.formName).assertEqual('');
      logInfo(`new FormRecord("", false, 0): subject.tempFlag=${subject.tempFlag}`);
      expect(subject.tempFlag).assertFalse();
      logInfo(`new FormRecord("", false, 0): subject.updateCount=${subject.updateCount}`);
      expect(subject.updateCount).assertEqual(0);
      logInfo(`${BUNDLE}FormRecordCtor_0045 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_RECORD_CTOR_0046
     * @tc.name      FormExtAbility_FormRecordCtor_0046
     * @tc.desc      new FormRecord("Hello World", false, 30) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormRecordCtor_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRecordCtor_0046 begin`);
      const subject: FormRecord = new FormRecord('Hello World', false, 30);
      logInfo(`new FormRecord("Hello World", false, 30): subject.formName=${subject.formName}`);
      expect(subject.formName).assertEqual('Hello World');
      logInfo(`new FormRecord("Hello World", false, 30): subject.tempFlag=${subject.tempFlag}`);
      expect(subject.tempFlag).assertFalse();
      logInfo(`new FormRecord("Hello World", false, 30): subject.updateCount=${subject.updateCount}`);
      expect(subject.updateCount).assertEqual(30);
      logInfo(`${BUNDLE}FormRecordCtor_0046 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_RECORD_CTOR_0047
     * @tc.name      FormExtAbility_FormRecordCtor_0047
     * @tc.desc      new FormRecord("Hello World", false, 3) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormRecordCtor_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRecordCtor_0047 begin`);
      const subject: FormRecord = new FormRecord('Hello World', false, 3);
      logInfo(`new FormRecord("Hello World", false, 3): subject.formName=${subject.formName}`);
      expect(subject.formName).assertEqual('Hello World');
      logInfo(`new FormRecord("Hello World", false, 3): subject.tempFlag=${subject.tempFlag}`);
      expect(subject.tempFlag).assertFalse();
      logInfo(`new FormRecord("Hello World", false, 3): subject.updateCount=${subject.updateCount}`);
      expect(subject.updateCount).assertEqual(3);
      logInfo(`${BUNDLE}FormRecordCtor_0047 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_RECORD_CTOR_0048
     * @tc.name      FormExtAbility_FormRecordCtor_0048
     * @tc.desc      new FormRecord("a", true, 15) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormRecordCtor_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRecordCtor_0048 begin`);
      const subject: FormRecord = new FormRecord('a', true, 15);
      logInfo(`new FormRecord("a", true, 15): subject.formName=${subject.formName}`);
      expect(subject.formName).assertEqual('a');
      logInfo(`new FormRecord("a", true, 15): subject.tempFlag=${subject.tempFlag}`);
      expect(subject.tempFlag).assertTrue();
      logInfo(`new FormRecord("a", true, 15): subject.updateCount=${subject.updateCount}`);
      expect(subject.updateCount).assertEqual(15);
      logInfo(`${BUNDLE}FormRecordCtor_0048 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_RECORD_CTOR_0049
     * @tc.name      FormExtAbility_FormRecordCtor_0049
     * @tc.desc      new FormRecord(" ", true, 28) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormRecordCtor_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRecordCtor_0049 begin`);
      const subject: FormRecord = new FormRecord(' ', true, 28);
      logInfo(`new FormRecord(" ", true, 28): subject.formName=${subject.formName}`);
      expect(subject.formName).assertEqual(' ');
      logInfo(`new FormRecord(" ", true, 28): subject.tempFlag=${subject.tempFlag}`);
      expect(subject.tempFlag).assertTrue();
      logInfo(`new FormRecord(" ", true, 28): subject.updateCount=${subject.updateCount}`);
      expect(subject.updateCount).assertEqual(28);
      logInfo(`${BUNDLE}FormRecordCtor_0049 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_RECORD_CTOR_0050
     * @tc.name      FormExtAbility_FormRecordCtor_0050
     * @tc.desc      new FormRecord("??", true, 3) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormRecordCtor_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRecordCtor_0050 begin`);
      const subject: FormRecord = new FormRecord('\u4e2d\u6587', true, 3);
      logInfo(`new FormRecord("??", true, 3): subject.formName=${subject.formName}`);
      expect(subject.formName).assertEqual('\u4e2d\u6587');
      logInfo(`new FormRecord("??", true, 3): subject.tempFlag=${subject.tempFlag}`);
      expect(subject.tempFlag).assertTrue();
      logInfo(`new FormRecord("??", true, 3): subject.updateCount=${subject.updateCount}`);
      expect(subject.updateCount).assertEqual(3);
      logInfo(`${BUNDLE}FormRecordCtor_0050 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_RECORD_CTOR_0051
     * @tc.name      FormExtAbility_FormRecordCtor_0051
     * @tc.desc      new FormRecord("Sample Title 123", true, 0) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormRecordCtor_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRecordCtor_0051 begin`);
      const subject: FormRecord = new FormRecord('Sample Title 123', true, 0);
      logInfo(`new FormRecord("Sample Title 123", true, 0): subject.formName=${subject.formName}`);
      expect(subject.formName).assertEqual('Sample Title 123');
      logInfo(`new FormRecord("Sample Title 123", true, 0): subject.tempFlag=${subject.tempFlag}`);
      expect(subject.tempFlag).assertTrue();
      logInfo(`new FormRecord("Sample Title 123", true, 0): subject.updateCount=${subject.updateCount}`);
      expect(subject.updateCount).assertEqual(0);
      logInfo(`${BUNDLE}FormRecordCtor_0051 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_RECORD_CTOR_0052
     * @tc.name      FormExtAbility_FormRecordCtor_0052
     * @tc.desc      new FormRecord("", true, 31) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormRecordCtor_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRecordCtor_0052 begin`);
      const subject: FormRecord = new FormRecord('', true, 31);
      logInfo(`new FormRecord("", true, 31): subject.formName=${subject.formName}`);
      expect(subject.formName).assertEqual('');
      logInfo(`new FormRecord("", true, 31): subject.tempFlag=${subject.tempFlag}`);
      expect(subject.tempFlag).assertTrue();
      logInfo(`new FormRecord("", true, 31): subject.updateCount=${subject.updateCount}`);
      expect(subject.updateCount).assertEqual(31);
      logInfo(`${BUNDLE}FormRecordCtor_0052 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_RECORD_CTOR_0053
     * @tc.name      FormExtAbility_FormRecordCtor_0053
     * @tc.desc      new FormRecord("Hello", false, 10) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormRecordCtor_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRecordCtor_0053 begin`);
      const subject: FormRecord = new FormRecord('Hello', false, 10);
      logInfo(`new FormRecord("Hello", false, 10): subject.formName=${subject.formName}`);
      expect(subject.formName).assertEqual('Hello');
      logInfo(`new FormRecord("Hello", false, 10): subject.tempFlag=${subject.tempFlag}`);
      expect(subject.tempFlag).assertFalse();
      logInfo(`new FormRecord("Hello", false, 10): subject.updateCount=${subject.updateCount}`);
      expect(subject.updateCount).assertEqual(10);
      logInfo(`${BUNDLE}FormRecordCtor_0053 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_RECORD_CTOR_0054
     * @tc.name      FormExtAbility_FormRecordCtor_0054
     * @tc.desc      new FormRecord("a", false, 100) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormRecordCtor_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRecordCtor_0054 begin`);
      const subject: FormRecord = new FormRecord('a', false, 100);
      logInfo(`new FormRecord("a", false, 100): subject.formName=${subject.formName}`);
      expect(subject.formName).assertEqual('a');
      logInfo(`new FormRecord("a", false, 100): subject.tempFlag=${subject.tempFlag}`);
      expect(subject.tempFlag).assertFalse();
      logInfo(`new FormRecord("a", false, 100): subject.updateCount=${subject.updateCount}`);
      expect(subject.updateCount).assertEqual(100);
      logInfo(`${BUNDLE}FormRecordCtor_0054 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_RECORD_CTOR_0055
     * @tc.name      FormExtAbility_FormRecordCtor_0055
     * @tc.desc      new FormRecord("A", false, -1) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormRecordCtor_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRecordCtor_0055 begin`);
      const subject: FormRecord = new FormRecord('A', false, -1);
      logInfo(`new FormRecord("A", false, -1): subject.formName=${subject.formName}`);
      expect(subject.formName).assertEqual('A');
      logInfo(`new FormRecord("A", false, -1): subject.tempFlag=${subject.tempFlag}`);
      expect(subject.tempFlag).assertFalse();
      logInfo(`new FormRecord("A", false, -1): subject.updateCount=${subject.updateCount}`);
      expect(subject.updateCount).assertEqual(-1);
      logInfo(`${BUNDLE}FormRecordCtor_0055 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_RECORD_CTOR_0056
     * @tc.name      FormExtAbility_FormRecordCtor_0056
     * @tc.desc      new FormRecord("A", true, 30) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormRecordCtor_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRecordCtor_0056 begin`);
      const subject: FormRecord = new FormRecord('A', true, 30);
      logInfo(`new FormRecord("A", true, 30): subject.formName=${subject.formName}`);
      expect(subject.formName).assertEqual('A');
      logInfo(`new FormRecord("A", true, 30): subject.tempFlag=${subject.tempFlag}`);
      expect(subject.tempFlag).assertTrue();
      logInfo(`new FormRecord("A", true, 30): subject.updateCount=${subject.updateCount}`);
      expect(subject.updateCount).assertEqual(30);
      logInfo(`${BUNDLE}FormRecordCtor_0056 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_RECORD_CTOR_0057
     * @tc.name      FormExtAbility_FormRecordCtor_0057
     * @tc.desc      new FormRecord("Hello World", true, 0) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormRecordCtor_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRecordCtor_0057 begin`);
      const subject: FormRecord = new FormRecord('Hello World', true, 0);
      logInfo(`new FormRecord("Hello World", true, 0): subject.formName=${subject.formName}`);
      expect(subject.formName).assertEqual('Hello World');
      logInfo(`new FormRecord("Hello World", true, 0): subject.tempFlag=${subject.tempFlag}`);
      expect(subject.tempFlag).assertTrue();
      logInfo(`new FormRecord("Hello World", true, 0): subject.updateCount=${subject.updateCount}`);
      expect(subject.updateCount).assertEqual(0);
      logInfo(`${BUNDLE}FormRecordCtor_0057 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_RECORD_CTOR_0058
     * @tc.name      FormExtAbility_FormRecordCtor_0058
     * @tc.desc      new FormRecord("abc", true, -1) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormRecordCtor_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRecordCtor_0058 begin`);
      const subject: FormRecord = new FormRecord('abc', true, -1);
      logInfo(`new FormRecord("abc", true, -1): subject.formName=${subject.formName}`);
      expect(subject.formName).assertEqual('abc');
      logInfo(`new FormRecord("abc", true, -1): subject.tempFlag=${subject.tempFlag}`);
      expect(subject.tempFlag).assertTrue();
      logInfo(`new FormRecord("abc", true, -1): subject.updateCount=${subject.updateCount}`);
      expect(subject.updateCount).assertEqual(-1);
      logInfo(`${BUNDLE}FormRecordCtor_0058 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_RECORD_CTOR_0059
     * @tc.name      FormExtAbility_FormRecordCtor_0059
     * @tc.desc      new FormRecord("abc", false, 29) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormRecordCtor_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRecordCtor_0059 begin`);
      const subject: FormRecord = new FormRecord('abc', false, 29);
      logInfo(`new FormRecord("abc", false, 29): subject.formName=${subject.formName}`);
      expect(subject.formName).assertEqual('abc');
      logInfo(`new FormRecord("abc", false, 29): subject.tempFlag=${subject.tempFlag}`);
      expect(subject.tempFlag).assertFalse();
      logInfo(`new FormRecord("abc", false, 29): subject.updateCount=${subject.updateCount}`);
      expect(subject.updateCount).assertEqual(29);
      logInfo(`${BUNDLE}FormRecordCtor_0059 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_RECORD_CTOR_0060
     * @tc.name      FormExtAbility_FormRecordCtor_0060
     * @tc.desc      new FormRecord("abc", true, 3) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormRecordCtor_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRecordCtor_0060 begin`);
      const subject: FormRecord = new FormRecord('abc', true, 3);
      logInfo(`new FormRecord("abc", true, 3): subject.formName=${subject.formName}`);
      expect(subject.formName).assertEqual('abc');
      logInfo(`new FormRecord("abc", true, 3): subject.tempFlag=${subject.tempFlag}`);
      expect(subject.tempFlag).assertTrue();
      logInfo(`new FormRecord("abc", true, 3): subject.updateCount=${subject.updateCount}`);
      expect(subject.updateCount).assertEqual(3);
      logInfo(`${BUNDLE}FormRecordCtor_0060 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_RECORD_CTOR_0061
     * @tc.name      FormExtAbility_FormRecordCtor_0061
     * @tc.desc      new FormRecord("Hello World", true, 30) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormRecordCtor_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRecordCtor_0061 begin`);
      const subject: FormRecord = new FormRecord('Hello World', true, 30);
      logInfo(`new FormRecord("Hello World", true, 30): subject.formName=${subject.formName}`);
      expect(subject.formName).assertEqual('Hello World');
      logInfo(`new FormRecord("Hello World", true, 30): subject.tempFlag=${subject.tempFlag}`);
      expect(subject.tempFlag).assertTrue();
      logInfo(`new FormRecord("Hello World", true, 30): subject.updateCount=${subject.updateCount}`);
      expect(subject.updateCount).assertEqual(30);
      logInfo(`${BUNDLE}FormRecordCtor_0061 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_RECORD_CTOR_0062
     * @tc.name      FormExtAbility_FormRecordCtor_0062
     * @tc.desc      new FormRecord("hello world", true, 29) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormRecordCtor_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRecordCtor_0062 begin`);
      const subject: FormRecord = new FormRecord('hello world', true, 29);
      logInfo(`new FormRecord("hello world", true, 29): subject.formName=${subject.formName}`);
      expect(subject.formName).assertEqual('hello world');
      logInfo(`new FormRecord("hello world", true, 29): subject.tempFlag=${subject.tempFlag}`);
      expect(subject.tempFlag).assertTrue();
      logInfo(`new FormRecord("hello world", true, 29): subject.updateCount=${subject.updateCount}`);
      expect(subject.updateCount).assertEqual(29);
      logInfo(`${BUNDLE}FormRecordCtor_0062 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_RECORD_CTOR_0063
     * @tc.name      FormExtAbility_FormRecordCtor_0063
     * @tc.desc      new FormRecord("a", true, 0) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormRecordCtor_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRecordCtor_0063 begin`);
      const subject: FormRecord = new FormRecord('a', true, 0);
      logInfo(`new FormRecord("a", true, 0): subject.formName=${subject.formName}`);
      expect(subject.formName).assertEqual('a');
      logInfo(`new FormRecord("a", true, 0): subject.tempFlag=${subject.tempFlag}`);
      expect(subject.tempFlag).assertTrue();
      logInfo(`new FormRecord("a", true, 0): subject.updateCount=${subject.updateCount}`);
      expect(subject.updateCount).assertEqual(0);
      logInfo(`${BUNDLE}FormRecordCtor_0063 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_RECORD_CTOR_0064
     * @tc.name      FormExtAbility_FormRecordCtor_0064
     * @tc.desc      new FormRecord("Sample Title 123", false, 2) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormRecordCtor_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRecordCtor_0064 begin`);
      const subject: FormRecord = new FormRecord('Sample Title 123', false, 2);
      logInfo(`new FormRecord("Sample Title 123", false, 2): subject.formName=${subject.formName}`);
      expect(subject.formName).assertEqual('Sample Title 123');
      logInfo(`new FormRecord("Sample Title 123", false, 2): subject.tempFlag=${subject.tempFlag}`);
      expect(subject.tempFlag).assertFalse();
      logInfo(`new FormRecord("Sample Title 123", false, 2): subject.updateCount=${subject.updateCount}`);
      expect(subject.updateCount).assertEqual(2);
      logInfo(`${BUNDLE}FormRecordCtor_0064 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_RECORD_CTOR_0065
     * @tc.name      FormExtAbility_FormRecordCtor_0065
     * @tc.desc      new FormRecord("", false, 3) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormRecordCtor_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRecordCtor_0065 begin`);
      const subject: FormRecord = new FormRecord('', false, 3);
      logInfo(`new FormRecord("", false, 3): subject.formName=${subject.formName}`);
      expect(subject.formName).assertEqual('');
      logInfo(`new FormRecord("", false, 3): subject.tempFlag=${subject.tempFlag}`);
      expect(subject.tempFlag).assertFalse();
      logInfo(`new FormRecord("", false, 3): subject.updateCount=${subject.updateCount}`);
      expect(subject.updateCount).assertEqual(3);
      logInfo(`${BUNDLE}FormRecordCtor_0065 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_RECORD_CTOR_0066
     * @tc.name      FormExtAbility_FormRecordCtor_0066
     * @tc.desc      new FormRecord("hello world", false, 1) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormRecordCtor_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRecordCtor_0066 begin`);
      const subject: FormRecord = new FormRecord('hello world', false, 1);
      logInfo(`new FormRecord("hello world", false, 1): subject.formName=${subject.formName}`);
      expect(subject.formName).assertEqual('hello world');
      logInfo(`new FormRecord("hello world", false, 1): subject.tempFlag=${subject.tempFlag}`);
      expect(subject.tempFlag).assertFalse();
      logInfo(`new FormRecord("hello world", false, 1): subject.updateCount=${subject.updateCount}`);
      expect(subject.updateCount).assertEqual(1);
      logInfo(`${BUNDLE}FormRecordCtor_0066 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_RECORD_CTOR_0067
     * @tc.name      FormExtAbility_FormRecordCtor_0067
     * @tc.desc      new FormRecord("Hello World", false, 1) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormRecordCtor_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRecordCtor_0067 begin`);
      const subject: FormRecord = new FormRecord('Hello World', false, 1);
      logInfo(`new FormRecord("Hello World", false, 1): subject.formName=${subject.formName}`);
      expect(subject.formName).assertEqual('Hello World');
      logInfo(`new FormRecord("Hello World", false, 1): subject.tempFlag=${subject.tempFlag}`);
      expect(subject.tempFlag).assertFalse();
      logInfo(`new FormRecord("Hello World", false, 1): subject.updateCount=${subject.updateCount}`);
      expect(subject.updateCount).assertEqual(1);
      logInfo(`${BUNDLE}FormRecordCtor_0067 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_RECORD_CTOR_0068
     * @tc.name      FormExtAbility_FormRecordCtor_0068
     * @tc.desc      new FormRecord("Hello World", true, 28) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormRecordCtor_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRecordCtor_0068 begin`);
      const subject: FormRecord = new FormRecord('Hello World', true, 28);
      logInfo(`new FormRecord("Hello World", true, 28): subject.formName=${subject.formName}`);
      expect(subject.formName).assertEqual('Hello World');
      logInfo(`new FormRecord("Hello World", true, 28): subject.tempFlag=${subject.tempFlag}`);
      expect(subject.tempFlag).assertTrue();
      logInfo(`new FormRecord("Hello World", true, 28): subject.updateCount=${subject.updateCount}`);
      expect(subject.updateCount).assertEqual(28);
      logInfo(`${BUNDLE}FormRecordCtor_0068 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_RECORD_CTOR_0069
     * @tc.name      FormExtAbility_FormRecordCtor_0069
     * @tc.desc      new FormRecord("??", true, 2) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormRecordCtor_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRecordCtor_0069 begin`);
      const subject: FormRecord = new FormRecord('\u4e2d\u6587', true, 2);
      logInfo(`new FormRecord("??", true, 2): subject.formName=${subject.formName}`);
      expect(subject.formName).assertEqual('\u4e2d\u6587');
      logInfo(`new FormRecord("??", true, 2): subject.tempFlag=${subject.tempFlag}`);
      expect(subject.tempFlag).assertTrue();
      logInfo(`new FormRecord("??", true, 2): subject.updateCount=${subject.updateCount}`);
      expect(subject.updateCount).assertEqual(2);
      logInfo(`${BUNDLE}FormRecordCtor_0069 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_RECORD_CTOR_0070
     * @tc.name      FormExtAbility_FormRecordCtor_0070
     * @tc.desc      new FormRecord(" ", false, 0) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormRecordCtor_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRecordCtor_0070 begin`);
      const subject: FormRecord = new FormRecord(' ', false, 0);
      logInfo(`new FormRecord(" ", false, 0): subject.formName=${subject.formName}`);
      expect(subject.formName).assertEqual(' ');
      logInfo(`new FormRecord(" ", false, 0): subject.tempFlag=${subject.tempFlag}`);
      expect(subject.tempFlag).assertFalse();
      logInfo(`new FormRecord(" ", false, 0): subject.updateCount=${subject.updateCount}`);
      expect(subject.updateCount).assertEqual(0);
      logInfo(`${BUNDLE}FormRecordCtor_0070 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_RECORD_CTOR_0071
     * @tc.name      FormExtAbility_FormRecordCtor_0071
     * @tc.desc      new FormRecord("Sample Title 123", false, 100) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormRecordCtor_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRecordCtor_0071 begin`);
      const subject: FormRecord = new FormRecord('Sample Title 123', false, 100);
      logInfo(`new FormRecord("Sample Title 123", false,...: subject.formName=${subject.formName}`);
      expect(subject.formName).assertEqual('Sample Title 123');
      logInfo(`new FormRecord("Sample Title 123", false,...: subject.tempFlag=${subject.tempFlag}`);
      expect(subject.tempFlag).assertFalse();
      logInfo(`new FormRecord("Sample Title 123", false,...: subject.updateCount=${subject.updateCount}`);
      expect(subject.updateCount).assertEqual(100);
      logInfo(`${BUNDLE}FormRecordCtor_0071 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_RECORD_CTOR_0072
     * @tc.name      FormExtAbility_FormRecordCtor_0072
     * @tc.desc      new FormRecord("??", false, 15) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormRecordCtor_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRecordCtor_0072 begin`);
      const subject: FormRecord = new FormRecord('\u4e2d\u6587', false, 15);
      logInfo(`new FormRecord("??", false, 15): subject.formName=${subject.formName}`);
      expect(subject.formName).assertEqual('\u4e2d\u6587');
      logInfo(`new FormRecord("??", false, 15): subject.tempFlag=${subject.tempFlag}`);
      expect(subject.tempFlag).assertFalse();
      logInfo(`new FormRecord("??", false, 15): subject.updateCount=${subject.updateCount}`);
      expect(subject.updateCount).assertEqual(15);
      logInfo(`${BUNDLE}FormRecordCtor_0072 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_RECORD_CTOR_0073
     * @tc.name      FormExtAbility_FormRecordCtor_0073
     * @tc.desc      new FormRecord("hello world", false, 29) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormRecordCtor_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRecordCtor_0073 begin`);
      const subject: FormRecord = new FormRecord('hello world', false, 29);
      logInfo(`new FormRecord("hello world", false, 29): subject.formName=${subject.formName}`);
      expect(subject.formName).assertEqual('hello world');
      logInfo(`new FormRecord("hello world", false, 29): subject.tempFlag=${subject.tempFlag}`);
      expect(subject.tempFlag).assertFalse();
      logInfo(`new FormRecord("hello world", false, 29): subject.updateCount=${subject.updateCount}`);
      expect(subject.updateCount).assertEqual(29);
      logInfo(`${BUNDLE}FormRecordCtor_0073 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_RECORD_CTOR_0074
     * @tc.name      FormExtAbility_FormRecordCtor_0074
     * @tc.desc      new FormRecord("??", true, 30) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormRecordCtor_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRecordCtor_0074 begin`);
      const subject: FormRecord = new FormRecord('\u4e2d\u6587', true, 30);
      logInfo(`new FormRecord("??", true, 30): subject.formName=${subject.formName}`);
      expect(subject.formName).assertEqual('\u4e2d\u6587');
      logInfo(`new FormRecord("??", true, 30): subject.tempFlag=${subject.tempFlag}`);
      expect(subject.tempFlag).assertTrue();
      logInfo(`new FormRecord("??", true, 30): subject.updateCount=${subject.updateCount}`);
      expect(subject.updateCount).assertEqual(30);
      logInfo(`${BUNDLE}FormRecordCtor_0074 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_RECORD_CTOR_0075
     * @tc.name      FormExtAbility_FormRecordCtor_0075
     * @tc.desc      new FormRecord("a", false, 31) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormRecordCtor_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRecordCtor_0075 begin`);
      const subject: FormRecord = new FormRecord('a', false, 31);
      logInfo(`new FormRecord("a", false, 31): subject.formName=${subject.formName}`);
      expect(subject.formName).assertEqual('a');
      logInfo(`new FormRecord("a", false, 31): subject.tempFlag=${subject.tempFlag}`);
      expect(subject.tempFlag).assertFalse();
      logInfo(`new FormRecord("a", false, 31): subject.updateCount=${subject.updateCount}`);
      expect(subject.updateCount).assertEqual(31);
      logInfo(`${BUNDLE}FormRecordCtor_0075 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_RECORD_CTOR_0076
     * @tc.name      FormExtAbility_FormRecordCtor_0076
     * @tc.desc      new FormRecord("??", false, 29) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormRecordCtor_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRecordCtor_0076 begin`);
      const subject: FormRecord = new FormRecord('\u4e2d\u6587', false, 29);
      logInfo(`new FormRecord("??", false, 29): subject.formName=${subject.formName}`);
      expect(subject.formName).assertEqual('\u4e2d\u6587');
      logInfo(`new FormRecord("??", false, 29): subject.tempFlag=${subject.tempFlag}`);
      expect(subject.tempFlag).assertFalse();
      logInfo(`new FormRecord("??", false, 29): subject.updateCount=${subject.updateCount}`);
      expect(subject.updateCount).assertEqual(29);
      logInfo(`${BUNDLE}FormRecordCtor_0076 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_FORM_RECORD_CTOR_0077
     * @tc.name      FormExtAbility_FormRecordCtor_0077
     * @tc.desc      new FormRecord("", true, 15) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_FormRecordCtor_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}FormRecordCtor_0077 begin`);
      const subject: FormRecord = new FormRecord('', true, 15);
      logInfo(`new FormRecord("", true, 15): subject.formName=${subject.formName}`);
      expect(subject.formName).assertEqual('');
      logInfo(`new FormRecord("", true, 15): subject.tempFlag=${subject.tempFlag}`);
      expect(subject.tempFlag).assertTrue();
      logInfo(`new FormRecord("", true, 15): subject.updateCount=${subject.updateCount}`);
      expect(subject.updateCount).assertEqual(15);
      logInfo(`${BUNDLE}FormRecordCtor_0077 end`);
    });
  });
}
