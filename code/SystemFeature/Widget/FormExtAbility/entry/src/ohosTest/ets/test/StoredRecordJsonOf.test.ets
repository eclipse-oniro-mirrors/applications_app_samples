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
import { storedRecordJsonOf } from './model/FormExtLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_FormExtAbility]';
const BUNDLE: string = 'FormExtAbility_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for storedRecordJsonOf (48 cases). */
export default function storedRecordJsonOfTest(): void {
  describe('StoredRecordJsonOfTest', (): void => {
    /**
     * @tc.number    SUB_FORMEXTABILITY_STORED_RECORD_JSON_OF_0001
     * @tc.name      FormExtAbility_StoredRecordJsonOf_0001
     * @tc.desc      storedRecordJsonOf(formName="Hello", tempFlag=true) returns "{?"formName?":?"Hello?",?"tempFlag?...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('FormExtAbility_StoredRecordJsonOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}StoredRecordJsonOf_0001 begin`);
      const actual: string = storedRecordJsonOf('Hello', true);
      logInfo(`storedRecordJsonOf(formName="Hello", temp...: actual=${actual}`);
      expect(actual).assertEqual('{"formName":"Hello","tempFlag":true,"updateCount":0}');
      logInfo(`${BUNDLE}StoredRecordJsonOf_0001 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_STORED_RECORD_JSON_OF_0002
     * @tc.name      FormExtAbility_StoredRecordJsonOf_0002
     * @tc.desc      storedRecordJsonOf(formName="Hello", tempFlag=false) returns "{?"formName?":?"Hello?",?"tempFlag...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('FormExtAbility_StoredRecordJsonOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}StoredRecordJsonOf_0002 begin`);
      const actual: string = storedRecordJsonOf('Hello', false);
      logInfo(`storedRecordJsonOf(formName="Hello", temp...: actual=${actual}`);
      expect(actual).assertEqual('{"formName":"Hello","tempFlag":false,"updateCount":0}');
      logInfo(`${BUNDLE}StoredRecordJsonOf_0002 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_STORED_RECORD_JSON_OF_0003
     * @tc.name      FormExtAbility_StoredRecordJsonOf_0003
     * @tc.desc      storedRecordJsonOf(formName="hello world", tempFlag=true) returns "{?"formName?":?"hello world?"...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_StoredRecordJsonOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}StoredRecordJsonOf_0003 begin`);
      const actual: string = storedRecordJsonOf('hello world', true);
      logInfo(`storedRecordJsonOf(formName="hello world"...: actual=${actual}`);
      expect(actual).assertEqual('{"formName":"hello world","tempFlag":true,"updateCount":0}');
      logInfo(`${BUNDLE}StoredRecordJsonOf_0003 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_STORED_RECORD_JSON_OF_0004
     * @tc.name      FormExtAbility_StoredRecordJsonOf_0004
     * @tc.desc      storedRecordJsonOf(formName="hello world", tempFlag=false) returns "{?"formName?":?"hello world?...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_StoredRecordJsonOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}StoredRecordJsonOf_0004 begin`);
      const actual: string = storedRecordJsonOf('hello world', false);
      logInfo(`storedRecordJsonOf(formName="hello world"...: actual=${actual}`);
      expect(actual).assertEqual('{"formName":"hello world","tempFlag":false,"updateCount":0}');
      logInfo(`${BUNDLE}StoredRecordJsonOf_0004 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_STORED_RECORD_JSON_OF_0005
     * @tc.name      FormExtAbility_StoredRecordJsonOf_0005
     * @tc.desc      storedRecordJsonOf(formName="", tempFlag=true) returns "{?"formName?":?"?",?"tempFlag?":true,?"u...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_StoredRecordJsonOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}StoredRecordJsonOf_0005 begin`);
      const actual: string = storedRecordJsonOf('', true);
      logInfo(`storedRecordJsonOf(formName="", tempFlag=...: actual=${actual}`);
      expect(actual).assertEqual('{"formName":"","tempFlag":true,"updateCount":0}');
      logInfo(`${BUNDLE}StoredRecordJsonOf_0005 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_STORED_RECORD_JSON_OF_0006
     * @tc.name      FormExtAbility_StoredRecordJsonOf_0006
     * @tc.desc      storedRecordJsonOf(formName="", tempFlag=false) returns "{?"formName?":?"?",?"tempFlag?":false,?...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_StoredRecordJsonOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}StoredRecordJsonOf_0006 begin`);
      const actual: string = storedRecordJsonOf('', false);
      logInfo(`storedRecordJsonOf(formName="", tempFlag=...: actual=${actual}`);
      expect(actual).assertEqual('{"formName":"","tempFlag":false,"updateCount":0}');
      logInfo(`${BUNDLE}StoredRecordJsonOf_0006 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_STORED_RECORD_JSON_OF_0007
     * @tc.name      FormExtAbility_StoredRecordJsonOf_0007
     * @tc.desc      storedRecordJsonOf(formName=" ", tempFlag=true) returns "{?"formName?":?" ?",?"tempFlag?":true,?...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_StoredRecordJsonOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}StoredRecordJsonOf_0007 begin`);
      const actual: string = storedRecordJsonOf(' ', true);
      logInfo(`storedRecordJsonOf(formName=" ", tempFlag...: actual=${actual}`);
      expect(actual).assertEqual('{"formName":" ","tempFlag":true,"updateCount":0}');
      logInfo(`${BUNDLE}StoredRecordJsonOf_0007 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_STORED_RECORD_JSON_OF_0008
     * @tc.name      FormExtAbility_StoredRecordJsonOf_0008
     * @tc.desc      storedRecordJsonOf(formName=" ", tempFlag=false) returns "{?"formName?":?" ?",?"tempFlag?":false...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_StoredRecordJsonOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}StoredRecordJsonOf_0008 begin`);
      const actual: string = storedRecordJsonOf(' ', false);
      logInfo(`storedRecordJsonOf(formName=" ", tempFlag...: actual=${actual}`);
      expect(actual).assertEqual('{"formName":" ","tempFlag":false,"updateCount":0}');
      logInfo(`${BUNDLE}StoredRecordJsonOf_0008 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_STORED_RECORD_JSON_OF_0009
     * @tc.name      FormExtAbility_StoredRecordJsonOf_0009
     * @tc.desc      storedRecordJsonOf(formName="A", tempFlag=true) returns "{?"formName?":?"A?",?"tempFlag?":true,?...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_StoredRecordJsonOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}StoredRecordJsonOf_0009 begin`);
      const actual: string = storedRecordJsonOf('A', true);
      logInfo(`storedRecordJsonOf(formName="A", tempFlag...: actual=${actual}`);
      expect(actual).assertEqual('{"formName":"A","tempFlag":true,"updateCount":0}');
      logInfo(`${BUNDLE}StoredRecordJsonOf_0009 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_STORED_RECORD_JSON_OF_0010
     * @tc.name      FormExtAbility_StoredRecordJsonOf_0010
     * @tc.desc      storedRecordJsonOf(formName="A", tempFlag=false) returns "{?"formName?":?"A?",?"tempFlag?":false...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_StoredRecordJsonOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}StoredRecordJsonOf_0010 begin`);
      const actual: string = storedRecordJsonOf('A', false);
      logInfo(`storedRecordJsonOf(formName="A", tempFlag...: actual=${actual}`);
      expect(actual).assertEqual('{"formName":"A","tempFlag":false,"updateCount":0}');
      logInfo(`${BUNDLE}StoredRecordJsonOf_0010 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_STORED_RECORD_JSON_OF_0011
     * @tc.name      FormExtAbility_StoredRecordJsonOf_0011
     * @tc.desc      storedRecordJsonOf(formName="Sample Title 123", tempFlag=true) returns "{?"formName?":?"Sample T...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_StoredRecordJsonOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}StoredRecordJsonOf_0011 begin`);
      const actual: string = storedRecordJsonOf('Sample Title 123', true);
      logInfo(`storedRecordJsonOf(formName="Sample Title...: actual=${actual}`);
      expect(actual).assertEqual('{"formName":"Sample Title 123","tempFlag":true,"updateCount":0}');
      logInfo(`${BUNDLE}StoredRecordJsonOf_0011 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_STORED_RECORD_JSON_OF_0012
     * @tc.name      FormExtAbility_StoredRecordJsonOf_0012
     * @tc.desc      storedRecordJsonOf(formName="Sample Title 123", tempFlag=false) returns "{?"formName?":?"Sample ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_StoredRecordJsonOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}StoredRecordJsonOf_0012 begin`);
      const actual: string = storedRecordJsonOf('Sample Title 123', false);
      logInfo(`storedRecordJsonOf(formName="Sample Title...: actual=${actual}`);
      expect(actual).assertEqual('{"formName":"Sample Title 123","tempFlag":false,"updateCount":0}');
      logInfo(`${BUNDLE}StoredRecordJsonOf_0012 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_STORED_RECORD_JSON_OF_0013
     * @tc.name      FormExtAbility_StoredRecordJsonOf_0013
     * @tc.desc      storedRecordJsonOf(formName="??", tempFlag=true) returns "{?"formName?":?"???",?"tempFlag?":true...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_StoredRecordJsonOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}StoredRecordJsonOf_0013 begin`);
      const actual: string = storedRecordJsonOf('\u4e2d\u6587', true);
      logInfo(`storedRecordJsonOf(formName="??", tempFla...: actual=${actual}`);
      expect(actual).assertEqual('{"formName":"\u4e2d\u6587","tempFlag":true,"updateCount":0}');
      logInfo(`${BUNDLE}StoredRecordJsonOf_0013 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_STORED_RECORD_JSON_OF_0014
     * @tc.name      FormExtAbility_StoredRecordJsonOf_0014
     * @tc.desc      storedRecordJsonOf(formName="??", tempFlag=false) returns "{?"formName?":?"???",?"tempFlag?":fal...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_StoredRecordJsonOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}StoredRecordJsonOf_0014 begin`);
      const actual: string = storedRecordJsonOf('\u4e2d\u6587', false);
      logInfo(`storedRecordJsonOf(formName="??", tempFla...: actual=${actual}`);
      expect(actual).assertEqual('{"formName":"\u4e2d\u6587","tempFlag":false,"updateCount":0}');
      logInfo(`${BUNDLE}StoredRecordJsonOf_0014 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_STORED_RECORD_JSON_OF_0015
     * @tc.name      FormExtAbility_StoredRecordJsonOf_0015
     * @tc.desc      storedRecordJsonOf(formName="a", tempFlag=true) returns "{?"formName?":?"a?",?"tempFlag?":true,?...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_StoredRecordJsonOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}StoredRecordJsonOf_0015 begin`);
      const actual: string = storedRecordJsonOf('a', true);
      logInfo(`storedRecordJsonOf(formName="a", tempFlag...: actual=${actual}`);
      expect(actual).assertEqual('{"formName":"a","tempFlag":true,"updateCount":0}');
      logInfo(`${BUNDLE}StoredRecordJsonOf_0015 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_STORED_RECORD_JSON_OF_0016
     * @tc.name      FormExtAbility_StoredRecordJsonOf_0016
     * @tc.desc      storedRecordJsonOf(formName="a", tempFlag=false) returns "{?"formName?":?"a?",?"tempFlag?":false...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_StoredRecordJsonOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}StoredRecordJsonOf_0016 begin`);
      const actual: string = storedRecordJsonOf('a', false);
      logInfo(`storedRecordJsonOf(formName="a", tempFlag...: actual=${actual}`);
      expect(actual).assertEqual('{"formName":"a","tempFlag":false,"updateCount":0}');
      logInfo(`${BUNDLE}StoredRecordJsonOf_0016 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_STORED_RECORD_JSON_OF_0017
     * @tc.name      FormExtAbility_StoredRecordJsonOf_0017
     * @tc.desc      storedRecordJsonOf(formName="abc", tempFlag=true) returns "{?"formName?":?"abc?",?"tempFlag?":tr...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_StoredRecordJsonOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}StoredRecordJsonOf_0017 begin`);
      const actual: string = storedRecordJsonOf('abc', true);
      logInfo(`storedRecordJsonOf(formName="abc", tempFl...: actual=${actual}`);
      expect(actual).assertEqual('{"formName":"abc","tempFlag":true,"updateCount":0}');
      logInfo(`${BUNDLE}StoredRecordJsonOf_0017 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_STORED_RECORD_JSON_OF_0018
     * @tc.name      FormExtAbility_StoredRecordJsonOf_0018
     * @tc.desc      storedRecordJsonOf(formName="abc", tempFlag=false) returns "{?"formName?":?"abc?",?"tempFlag?":f...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_StoredRecordJsonOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}StoredRecordJsonOf_0018 begin`);
      const actual: string = storedRecordJsonOf('abc', false);
      logInfo(`storedRecordJsonOf(formName="abc", tempFl...: actual=${actual}`);
      expect(actual).assertEqual('{"formName":"abc","tempFlag":false,"updateCount":0}');
      logInfo(`${BUNDLE}StoredRecordJsonOf_0018 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_STORED_RECORD_JSON_OF_0019
     * @tc.name      FormExtAbility_StoredRecordJsonOf_0019
     * @tc.desc      storedRecordJsonOf(formName="Hello World", tempFlag=true) returns "{?"formName?":?"Hello World?"...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_StoredRecordJsonOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}StoredRecordJsonOf_0019 begin`);
      const actual: string = storedRecordJsonOf('Hello World', true);
      logInfo(`storedRecordJsonOf(formName="Hello World"...: actual=${actual}`);
      expect(actual).assertEqual('{"formName":"Hello World","tempFlag":true,"updateCount":0}');
      logInfo(`${BUNDLE}StoredRecordJsonOf_0019 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_STORED_RECORD_JSON_OF_0020
     * @tc.name      FormExtAbility_StoredRecordJsonOf_0020
     * @tc.desc      storedRecordJsonOf(formName="Hello World", tempFlag=false) returns "{?"formName?":?"Hello World?...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_StoredRecordJsonOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}StoredRecordJsonOf_0020 begin`);
      const actual: string = storedRecordJsonOf('Hello World', false);
      logInfo(`storedRecordJsonOf(formName="Hello World"...: actual=${actual}`);
      expect(actual).assertEqual('{"formName":"Hello World","tempFlag":false,"updateCount":0}');
      logInfo(`${BUNDLE}StoredRecordJsonOf_0020 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_STORED_RECORD_JSON_OF_0021
     * @tc.name      FormExtAbility_StoredRecordJsonOf_0021
     * @tc.desc      storedRecordJsonOf(formName="123", tempFlag=true) returns "{?"formName?":?"123?",?"tempFlag?":tr...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_StoredRecordJsonOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}StoredRecordJsonOf_0021 begin`);
      const actual: string = storedRecordJsonOf('123', true);
      logInfo(`storedRecordJsonOf(formName="123", tempFl...: actual=${actual}`);
      expect(actual).assertEqual('{"formName":"123","tempFlag":true,"updateCount":0}');
      logInfo(`${BUNDLE}StoredRecordJsonOf_0021 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_STORED_RECORD_JSON_OF_0022
     * @tc.name      FormExtAbility_StoredRecordJsonOf_0022
     * @tc.desc      storedRecordJsonOf(formName="123", tempFlag=false) returns "{?"formName?":?"123?",?"tempFlag?":f...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_StoredRecordJsonOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}StoredRecordJsonOf_0022 begin`);
      const actual: string = storedRecordJsonOf('123', false);
      logInfo(`storedRecordJsonOf(formName="123", tempFl...: actual=${actual}`);
      expect(actual).assertEqual('{"formName":"123","tempFlag":false,"updateCount":0}');
      logInfo(`${BUNDLE}StoredRecordJsonOf_0022 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_STORED_RECORD_JSON_OF_0023
     * @tc.name      FormExtAbility_StoredRecordJsonOf_0023
     * @tc.desc      storedRecordJsonOf(formName=" Hello ", tempFlag=true) returns "{?"formName?":?" Hello ?",?"tempF...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_StoredRecordJsonOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}StoredRecordJsonOf_0023 begin`);
      const actual: string = storedRecordJsonOf(' Hello ', true);
      logInfo(`storedRecordJsonOf(formName=" Hello ", te...: actual=${actual}`);
      expect(actual).assertEqual('{"formName":" Hello ","tempFlag":true,"updateCount":0}');
      logInfo(`${BUNDLE}StoredRecordJsonOf_0023 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_STORED_RECORD_JSON_OF_0024
     * @tc.name      FormExtAbility_StoredRecordJsonOf_0024
     * @tc.desc      storedRecordJsonOf(formName=" Hello ", tempFlag=false) returns "{?"formName?":?" Hello ?",?"temp...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_StoredRecordJsonOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}StoredRecordJsonOf_0024 begin`);
      const actual: string = storedRecordJsonOf(' Hello ', false);
      logInfo(`storedRecordJsonOf(formName=" Hello ", te...: actual=${actual}`);
      expect(actual).assertEqual('{"formName":" Hello ","tempFlag":false,"updateCount":0}');
      logInfo(`${BUNDLE}StoredRecordJsonOf_0024 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_STORED_RECORD_JSON_OF_0025
     * @tc.name      FormExtAbility_StoredRecordJsonOf_0025
     * @tc.desc      storedRecordJsonOf(formName="HelloHello", tempFlag=true) returns "{?"formName?":?"HelloHello?",?...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_StoredRecordJsonOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}StoredRecordJsonOf_0025 begin`);
      const actual: string = storedRecordJsonOf('HelloHello', true);
      logInfo(`storedRecordJsonOf(formName="HelloHello",...: actual=${actual}`);
      expect(actual).assertEqual('{"formName":"HelloHello","tempFlag":true,"updateCount":0}');
      logInfo(`${BUNDLE}StoredRecordJsonOf_0025 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_STORED_RECORD_JSON_OF_0026
     * @tc.name      FormExtAbility_StoredRecordJsonOf_0026
     * @tc.desc      storedRecordJsonOf(formName="HelloHello", tempFlag=false) returns "{?"formName?":?"HelloHello?",...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_StoredRecordJsonOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}StoredRecordJsonOf_0026 begin`);
      const actual: string = storedRecordJsonOf('HelloHello', false);
      logInfo(`storedRecordJsonOf(formName="HelloHello",...: actual=${actual}`);
      expect(actual).assertEqual('{"formName":"HelloHello","tempFlag":false,"updateCount":0}');
      logInfo(`${BUNDLE}StoredRecordJsonOf_0026 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_STORED_RECORD_JSON_OF_0027
     * @tc.name      FormExtAbility_StoredRecordJsonOf_0027
     * @tc.desc      storedRecordJsonOf(formName="Hello_1", tempFlag=true) returns "{?"formName?":?"Hello_1?",?"tempF...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_StoredRecordJsonOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}StoredRecordJsonOf_0027 begin`);
      const actual: string = storedRecordJsonOf('Hello_1', true);
      logInfo(`storedRecordJsonOf(formName="Hello_1", te...: actual=${actual}`);
      expect(actual).assertEqual('{"formName":"Hello_1","tempFlag":true,"updateCount":0}');
      logInfo(`${BUNDLE}StoredRecordJsonOf_0027 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_STORED_RECORD_JSON_OF_0028
     * @tc.name      FormExtAbility_StoredRecordJsonOf_0028
     * @tc.desc      storedRecordJsonOf(formName="Hello_1", tempFlag=false) returns "{?"formName?":?"Hello_1?",?"temp...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_StoredRecordJsonOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}StoredRecordJsonOf_0028 begin`);
      const actual: string = storedRecordJsonOf('Hello_1', false);
      logInfo(`storedRecordJsonOf(formName="Hello_1", te...: actual=${actual}`);
      expect(actual).assertEqual('{"formName":"Hello_1","tempFlag":false,"updateCount":0}');
      logInfo(`${BUNDLE}StoredRecordJsonOf_0028 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_STORED_RECORD_JSON_OF_0029
     * @tc.name      FormExtAbility_StoredRecordJsonOf_0029
     * @tc.desc      storedRecordJsonOf(formName="xHello", tempFlag=true) returns "{?"formName?":?"xHello?",?"tempFla...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_StoredRecordJsonOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}StoredRecordJsonOf_0029 begin`);
      const actual: string = storedRecordJsonOf('xHello', true);
      logInfo(`storedRecordJsonOf(formName="xHello", tem...: actual=${actual}`);
      expect(actual).assertEqual('{"formName":"xHello","tempFlag":true,"updateCount":0}');
      logInfo(`${BUNDLE}StoredRecordJsonOf_0029 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_STORED_RECORD_JSON_OF_0030
     * @tc.name      FormExtAbility_StoredRecordJsonOf_0030
     * @tc.desc      storedRecordJsonOf(formName="xHello", tempFlag=false) returns "{?"formName?":?"xHello?",?"tempFl...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_StoredRecordJsonOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}StoredRecordJsonOf_0030 begin`);
      const actual: string = storedRecordJsonOf('xHello', false);
      logInfo(`storedRecordJsonOf(formName="xHello", tem...: actual=${actual}`);
      expect(actual).assertEqual('{"formName":"xHello","tempFlag":false,"updateCount":0}');
      logInfo(`${BUNDLE}StoredRecordJsonOf_0030 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_STORED_RECORD_JSON_OF_0031
     * @tc.name      FormExtAbility_StoredRecordJsonOf_0031
     * @tc.desc      storedRecordJsonOf(formName=" hello world ", tempFlag=true) returns "{?"formName?":?" hello worl...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_StoredRecordJsonOf_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}StoredRecordJsonOf_0031 begin`);
      const actual: string = storedRecordJsonOf(' hello world ', true);
      logInfo(`storedRecordJsonOf(formName=" hello world...: actual=${actual}`);
      expect(actual).assertEqual('{"formName":" hello world ","tempFlag":true,"updateCount":0}');
      logInfo(`${BUNDLE}StoredRecordJsonOf_0031 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_STORED_RECORD_JSON_OF_0032
     * @tc.name      FormExtAbility_StoredRecordJsonOf_0032
     * @tc.desc      storedRecordJsonOf(formName=" hello world ", tempFlag=false) returns "{?"formName?":?" hello wor...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_StoredRecordJsonOf_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}StoredRecordJsonOf_0032 begin`);
      const actual: string = storedRecordJsonOf(' hello world ', false);
      logInfo(`storedRecordJsonOf(formName=" hello world...: actual=${actual}`);
      expect(actual).assertEqual('{"formName":" hello world ","tempFlag":false,"updateCount":0}');
      logInfo(`${BUNDLE}StoredRecordJsonOf_0032 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_STORED_RECORD_JSON_OF_0033
     * @tc.name      FormExtAbility_StoredRecordJsonOf_0033
     * @tc.desc      storedRecordJsonOf(formName="hello worldhello world", tempFlag=true) returns "?"tempFlag?":true,...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_StoredRecordJsonOf_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}StoredRecordJsonOf_0033 begin`);
      const actual: string = storedRecordJsonOf('hello worldhello world', true);
      logInfo(`storedRecordJsonOf(formName="hello worldh...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(69);
      logInfo(`storedRecordJsonOf(formName="hello worldh...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"formName":"hello worldhello wo');
      logInfo(`storedRecordJsonOf(formName="hello worldh...: actual.substring(37)=${actual.substring(37)}`);
      expect(actual.substring(37)).assertEqual('"tempFlag":true,"updateCount":0}');
      logInfo(`${BUNDLE}StoredRecordJsonOf_0033 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_STORED_RECORD_JSON_OF_0034
     * @tc.name      FormExtAbility_StoredRecordJsonOf_0034
     * @tc.desc      storedRecordJsonOf(formName="hello worldhello world", tempFlag=false) returns "tempFlag?":false,...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_StoredRecordJsonOf_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}StoredRecordJsonOf_0034 begin`);
      const actual: string = storedRecordJsonOf('hello worldhello world', false);
      logInfo(`storedRecordJsonOf(formName="hello worldh...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(70);
      logInfo(`storedRecordJsonOf(formName="hello worldh...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('{"formName":"hello worldhello wo');
      logInfo(`storedRecordJsonOf(formName="hello worldh...: actual.substring(38)=${actual.substring(38)}`);
      expect(actual.substring(38)).assertEqual('tempFlag":false,"updateCount":0}');
      logInfo(`${BUNDLE}StoredRecordJsonOf_0034 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_STORED_RECORD_JSON_OF_0035
     * @tc.name      FormExtAbility_StoredRecordJsonOf_0035
     * @tc.desc      storedRecordJsonOf(formName="hello world_1", tempFlag=true) returns "{?"formName?":?"hello world...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_StoredRecordJsonOf_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}StoredRecordJsonOf_0035 begin`);
      const actual: string = storedRecordJsonOf('hello world_1', true);
      logInfo(`storedRecordJsonOf(formName="hello world_...: actual=${actual}`);
      expect(actual).assertEqual('{"formName":"hello world_1","tempFlag":true,"updateCount":0}');
      logInfo(`${BUNDLE}StoredRecordJsonOf_0035 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_STORED_RECORD_JSON_OF_0036
     * @tc.name      FormExtAbility_StoredRecordJsonOf_0036
     * @tc.desc      storedRecordJsonOf(formName="hello world_1", tempFlag=false) returns "{?"formName?":?"hello worl...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_StoredRecordJsonOf_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}StoredRecordJsonOf_0036 begin`);
      const actual: string = storedRecordJsonOf('hello world_1', false);
      logInfo(`storedRecordJsonOf(formName="hello world_...: actual=${actual}`);
      expect(actual).assertEqual('{"formName":"hello world_1","tempFlag":false,"updateCount":0}');
      logInfo(`${BUNDLE}StoredRecordJsonOf_0036 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_STORED_RECORD_JSON_OF_0037
     * @tc.name      FormExtAbility_StoredRecordJsonOf_0037
     * @tc.desc      storedRecordJsonOf(formName="xhello world", tempFlag=true) returns "{?"formName?":?"xhello world...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_StoredRecordJsonOf_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}StoredRecordJsonOf_0037 begin`);
      const actual: string = storedRecordJsonOf('xhello world', true);
      logInfo(`storedRecordJsonOf(formName="xhello world...: actual=${actual}`);
      expect(actual).assertEqual('{"formName":"xhello world","tempFlag":true,"updateCount":0}');
      logInfo(`${BUNDLE}StoredRecordJsonOf_0037 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_STORED_RECORD_JSON_OF_0038
     * @tc.name      FormExtAbility_StoredRecordJsonOf_0038
     * @tc.desc      storedRecordJsonOf(formName="xhello world", tempFlag=false) returns "{?"formName?":?"xhello worl...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_StoredRecordJsonOf_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}StoredRecordJsonOf_0038 begin`);
      const actual: string = storedRecordJsonOf('xhello world', false);
      logInfo(`storedRecordJsonOf(formName="xhello world...: actual=${actual}`);
      expect(actual).assertEqual('{"formName":"xhello world","tempFlag":false,"updateCount":0}');
      logInfo(`${BUNDLE}StoredRecordJsonOf_0038 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_STORED_RECORD_JSON_OF_0039
     * @tc.name      FormExtAbility_StoredRecordJsonOf_0039
     * @tc.desc      storedRecordJsonOf(formName="   ", tempFlag=true) returns "{?"formName?":?"   ?",?"tempFlag?":tr...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_StoredRecordJsonOf_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}StoredRecordJsonOf_0039 begin`);
      const actual: string = storedRecordJsonOf('   ', true);
      logInfo(`storedRecordJsonOf(formName="   ", tempFl...: actual=${actual}`);
      expect(actual).assertEqual('{"formName":"   ","tempFlag":true,"updateCount":0}');
      logInfo(`${BUNDLE}StoredRecordJsonOf_0039 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_STORED_RECORD_JSON_OF_0040
     * @tc.name      FormExtAbility_StoredRecordJsonOf_0040
     * @tc.desc      storedRecordJsonOf(formName="   ", tempFlag=false) returns "{?"formName?":?"   ?",?"tempFlag?":f...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_StoredRecordJsonOf_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}StoredRecordJsonOf_0040 begin`);
      const actual: string = storedRecordJsonOf('   ', false);
      logInfo(`storedRecordJsonOf(formName="   ", tempFl...: actual=${actual}`);
      expect(actual).assertEqual('{"formName":"   ","tempFlag":false,"updateCount":0}');
      logInfo(`${BUNDLE}StoredRecordJsonOf_0040 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_STORED_RECORD_JSON_OF_0041
     * @tc.name      FormExtAbility_StoredRecordJsonOf_0041
     * @tc.desc      storedRecordJsonOf(formName="  ", tempFlag=true) returns "{?"formName?":?"  ?",?"tempFlag?":true...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_StoredRecordJsonOf_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}StoredRecordJsonOf_0041 begin`);
      const actual: string = storedRecordJsonOf('  ', true);
      logInfo(`storedRecordJsonOf(formName="  ", tempFla...: actual=${actual}`);
      expect(actual).assertEqual('{"formName":"  ","tempFlag":true,"updateCount":0}');
      logInfo(`${BUNDLE}StoredRecordJsonOf_0041 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_STORED_RECORD_JSON_OF_0042
     * @tc.name      FormExtAbility_StoredRecordJsonOf_0042
     * @tc.desc      storedRecordJsonOf(formName="  ", tempFlag=false) returns "{?"formName?":?"  ?",?"tempFlag?":fal...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_StoredRecordJsonOf_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}StoredRecordJsonOf_0042 begin`);
      const actual: string = storedRecordJsonOf('  ', false);
      logInfo(`storedRecordJsonOf(formName="  ", tempFla...: actual=${actual}`);
      expect(actual).assertEqual('{"formName":"  ","tempFlag":false,"updateCount":0}');
      logInfo(`${BUNDLE}StoredRecordJsonOf_0042 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_STORED_RECORD_JSON_OF_0043
     * @tc.name      FormExtAbility_StoredRecordJsonOf_0043
     * @tc.desc      storedRecordJsonOf(formName=" _1", tempFlag=true) returns "{?"formName?":?" _1?",?"tempFlag?":tr...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_StoredRecordJsonOf_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}StoredRecordJsonOf_0043 begin`);
      const actual: string = storedRecordJsonOf(' _1', true);
      logInfo(`storedRecordJsonOf(formName=" _1", tempFl...: actual=${actual}`);
      expect(actual).assertEqual('{"formName":" _1","tempFlag":true,"updateCount":0}');
      logInfo(`${BUNDLE}StoredRecordJsonOf_0043 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_STORED_RECORD_JSON_OF_0044
     * @tc.name      FormExtAbility_StoredRecordJsonOf_0044
     * @tc.desc      storedRecordJsonOf(formName=" _1", tempFlag=false) returns "{?"formName?":?" _1?",?"tempFlag?":f...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_StoredRecordJsonOf_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}StoredRecordJsonOf_0044 begin`);
      const actual: string = storedRecordJsonOf(' _1', false);
      logInfo(`storedRecordJsonOf(formName=" _1", tempFl...: actual=${actual}`);
      expect(actual).assertEqual('{"formName":" _1","tempFlag":false,"updateCount":0}');
      logInfo(`${BUNDLE}StoredRecordJsonOf_0044 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_STORED_RECORD_JSON_OF_0045
     * @tc.name      FormExtAbility_StoredRecordJsonOf_0045
     * @tc.desc      storedRecordJsonOf(formName="x ", tempFlag=true) returns "{?"formName?":?"x ?",?"tempFlag?":true...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_StoredRecordJsonOf_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}StoredRecordJsonOf_0045 begin`);
      const actual: string = storedRecordJsonOf('x ', true);
      logInfo(`storedRecordJsonOf(formName="x ", tempFla...: actual=${actual}`);
      expect(actual).assertEqual('{"formName":"x ","tempFlag":true,"updateCount":0}');
      logInfo(`${BUNDLE}StoredRecordJsonOf_0045 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_STORED_RECORD_JSON_OF_0046
     * @tc.name      FormExtAbility_StoredRecordJsonOf_0046
     * @tc.desc      storedRecordJsonOf(formName="x ", tempFlag=false) returns "{?"formName?":?"x ?",?"tempFlag?":fal...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_StoredRecordJsonOf_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}StoredRecordJsonOf_0046 begin`);
      const actual: string = storedRecordJsonOf('x ', false);
      logInfo(`storedRecordJsonOf(formName="x ", tempFla...: actual=${actual}`);
      expect(actual).assertEqual('{"formName":"x ","tempFlag":false,"updateCount":0}');
      logInfo(`${BUNDLE}StoredRecordJsonOf_0046 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_STORED_RECORD_JSON_OF_0047
     * @tc.name      FormExtAbility_StoredRecordJsonOf_0047
     * @tc.desc      storedRecordJsonOf(formName=" A ", tempFlag=true) returns "{?"formName?":?" A ?",?"tempFlag?":tr...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_StoredRecordJsonOf_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}StoredRecordJsonOf_0047 begin`);
      const actual: string = storedRecordJsonOf(' A ', true);
      logInfo(`storedRecordJsonOf(formName=" A ", tempFl...: actual=${actual}`);
      expect(actual).assertEqual('{"formName":" A ","tempFlag":true,"updateCount":0}');
      logInfo(`${BUNDLE}StoredRecordJsonOf_0047 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_STORED_RECORD_JSON_OF_0048
     * @tc.name      FormExtAbility_StoredRecordJsonOf_0048
     * @tc.desc      storedRecordJsonOf(formName=" A ", tempFlag=false) returns "{?"formName?":?" A ?",?"tempFlag?":f...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_StoredRecordJsonOf_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}StoredRecordJsonOf_0048 begin`);
      const actual: string = storedRecordJsonOf(' A ', false);
      logInfo(`storedRecordJsonOf(formName=" A ", tempFl...: actual=${actual}`);
      expect(actual).assertEqual('{"formName":" A ","tempFlag":false,"updateCount":0}');
      logInfo(`${BUNDLE}StoredRecordJsonOf_0048 end`);
    });
  });
}
