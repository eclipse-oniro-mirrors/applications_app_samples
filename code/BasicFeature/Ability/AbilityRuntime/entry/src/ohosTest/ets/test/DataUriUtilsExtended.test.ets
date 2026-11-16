/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { dataUriUtils } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_AbilityRuntime]';

function errorOf(call: () => string | number): string {
  try {
    return String(call());
  } catch (error) {
    return `${(error as BusinessError).code}:${(error as BusinessError).message}`;
  }
}

export default function dataUriUtilsExtendedTest(): void {
  describe('AbilityRuntimeDataUriUtilsExtendedTest', () => {
    /**
     * @tc.number    SUB_ABILITY_RUNTIME_DATA_URI_EXTENDED_0001
     * @tc.name      testDataUriUtilsExtended0001
     * @tc.desc      扩展：getId("com.example/0")=0，deleteId 还原前缀，updateId 替换为 1122
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testDataUriUtilsExtended0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsExtended0001 begin');
      const uri: string = 'com.example/0';
      const actual1: number = dataUriUtils.getId(uri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(0);
      const actual2: string = dataUriUtils.deleteId(uri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('com.example');
      const updatedUri: string = dataUriUtils.updateId(uri, 1122);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 updatedUri=${updatedUri}`);
      expect(updatedUri).assertEqual('com.example/1122');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsExtended0001 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_DATA_URI_EXTENDED_0002
     * @tc.name      testDataUriUtilsExtended0002
     * @tc.desc      扩展：getId("com.example/1")=1，deleteId 还原前缀，updateId 替换为 1122
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testDataUriUtilsExtended0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsExtended0002 begin');
      const uri: string = 'com.example/1';
      const actual1: number = dataUriUtils.getId(uri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(1);
      const actual2: string = dataUriUtils.deleteId(uri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('com.example');
      const updatedUri: string = dataUriUtils.updateId(uri, 1122);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 updatedUri=${updatedUri}`);
      expect(updatedUri).assertEqual('com.example/1122');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsExtended0002 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_DATA_URI_EXTENDED_0003
     * @tc.name      testDataUriUtilsExtended0003
     * @tc.desc      扩展：getId("com.example/42")=42，deleteId 还原前缀，updateId 替换为 1122
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testDataUriUtilsExtended0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsExtended0003 begin');
      const uri: string = 'com.example/42';
      const actual1: number = dataUriUtils.getId(uri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(42);
      const actual2: string = dataUriUtils.deleteId(uri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('com.example');
      const updatedUri: string = dataUriUtils.updateId(uri, 1122);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 updatedUri=${updatedUri}`);
      expect(updatedUri).assertEqual('com.example/1122');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsExtended0003 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_DATA_URI_EXTENDED_0004
     * @tc.name      testDataUriUtilsExtended0004
     * @tc.desc      扩展：getId("com.example/99")=99，deleteId 还原前缀，updateId 替换为 1122
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testDataUriUtilsExtended0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsExtended0004 begin');
      const uri: string = 'com.example/99';
      const actual1: number = dataUriUtils.getId(uri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(99);
      const actual2: string = dataUriUtils.deleteId(uri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('com.example');
      const updatedUri: string = dataUriUtils.updateId(uri, 1122);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 updatedUri=${updatedUri}`);
      expect(updatedUri).assertEqual('com.example/1122');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsExtended0004 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_DATA_URI_EXTENDED_0005
     * @tc.name      testDataUriUtilsExtended0005
     * @tc.desc      扩展：getId("com.example/1000")=1000，deleteId 还原前缀，updateId 替换为 1122
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testDataUriUtilsExtended0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsExtended0005 begin');
      const uri: string = 'com.example/1000';
      const actual1: number = dataUriUtils.getId(uri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(1000);
      const actual2: string = dataUriUtils.deleteId(uri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('com.example');
      const updatedUri: string = dataUriUtils.updateId(uri, 1122);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 updatedUri=${updatedUri}`);
      expect(updatedUri).assertEqual('com.example/1122');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsExtended0005 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_DATA_URI_EXTENDED_0006
     * @tc.name      testDataUriUtilsExtended0006
     * @tc.desc      扩展：getId("com.example/2147483647")=2147483647，deleteId 还原前缀，updateId 替换为 1122
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testDataUriUtilsExtended0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsExtended0006 begin');
      const uri: string = 'com.example/2147483647';
      const actual1: number = dataUriUtils.getId(uri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(2147483647);
      const actual2: string = dataUriUtils.deleteId(uri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('com.example');
      const updatedUri: string = dataUriUtils.updateId(uri, 1122);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 updatedUri=${updatedUri}`);
      expect(updatedUri).assertEqual('com.example/1122');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsExtended0006 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_DATA_URI_EXTENDED_0007
     * @tc.name      testDataUriUtilsExtended0007
     * @tc.desc      扩展：getId("com.example/9007199254740991")=9007199254740991，deleteId 还原前缀，updateId 替换为 1122
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testDataUriUtilsExtended0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsExtended0007 begin');
      const uri: string = 'com.example/9007199254740991';
      const actual1: number = dataUriUtils.getId(uri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(9007199254740991);
      const actual2: string = dataUriUtils.deleteId(uri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('com.example');
      const updatedUri: string = dataUriUtils.updateId(uri, 1122);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 updatedUri=${updatedUri}`);
      expect(updatedUri).assertEqual('com.example/1122');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsExtended0007 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_DATA_URI_EXTENDED_0008
     * @tc.name      testDataUriUtilsExtended0008
     * @tc.desc      扩展：getId("a/0")=0，deleteId 还原前缀，updateId 替换为 1122
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testDataUriUtilsExtended0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsExtended0008 begin');
      const uri: string = 'a/0';
      const actual1: number = dataUriUtils.getId(uri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(0);
      const actual2: string = dataUriUtils.deleteId(uri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('a');
      const updatedUri: string = dataUriUtils.updateId(uri, 1122);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 updatedUri=${updatedUri}`);
      expect(updatedUri).assertEqual('a/1122');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsExtended0008 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_DATA_URI_EXTENDED_0009
     * @tc.name      testDataUriUtilsExtended0009
     * @tc.desc      扩展：getId("a/1")=1，deleteId 还原前缀，updateId 替换为 1122
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testDataUriUtilsExtended0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsExtended0009 begin');
      const uri: string = 'a/1';
      const actual1: number = dataUriUtils.getId(uri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(1);
      const actual2: string = dataUriUtils.deleteId(uri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('a');
      const updatedUri: string = dataUriUtils.updateId(uri, 1122);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 updatedUri=${updatedUri}`);
      expect(updatedUri).assertEqual('a/1122');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsExtended0009 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_DATA_URI_EXTENDED_0010
     * @tc.name      testDataUriUtilsExtended0010
     * @tc.desc      扩展：getId("a/42")=42，deleteId 还原前缀，updateId 替换为 1122
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testDataUriUtilsExtended0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsExtended0010 begin');
      const uri: string = 'a/42';
      const actual1: number = dataUriUtils.getId(uri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(42);
      const actual2: string = dataUriUtils.deleteId(uri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('a');
      const updatedUri: string = dataUriUtils.updateId(uri, 1122);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 updatedUri=${updatedUri}`);
      expect(updatedUri).assertEqual('a/1122');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsExtended0010 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_DATA_URI_EXTENDED_0011
     * @tc.name      testDataUriUtilsExtended0011
     * @tc.desc      扩展：getId("a/99")=99，deleteId 还原前缀，updateId 替换为 1122
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testDataUriUtilsExtended0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsExtended0011 begin');
      const uri: string = 'a/99';
      const actual1: number = dataUriUtils.getId(uri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(99);
      const actual2: string = dataUriUtils.deleteId(uri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('a');
      const updatedUri: string = dataUriUtils.updateId(uri, 1122);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 updatedUri=${updatedUri}`);
      expect(updatedUri).assertEqual('a/1122');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsExtended0011 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_DATA_URI_EXTENDED_0012
     * @tc.name      testDataUriUtilsExtended0012
     * @tc.desc      扩展：getId("a/1000")=1000，deleteId 还原前缀，updateId 替换为 1122
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testDataUriUtilsExtended0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsExtended0012 begin');
      const uri: string = 'a/1000';
      const actual1: number = dataUriUtils.getId(uri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(1000);
      const actual2: string = dataUriUtils.deleteId(uri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('a');
      const updatedUri: string = dataUriUtils.updateId(uri, 1122);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 updatedUri=${updatedUri}`);
      expect(updatedUri).assertEqual('a/1122');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsExtended0012 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_DATA_URI_EXTENDED_0013
     * @tc.name      testDataUriUtilsExtended0013
     * @tc.desc      扩展：getId("a/2147483647")=2147483647，deleteId 还原前缀，updateId 替换为 1122
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testDataUriUtilsExtended0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsExtended0013 begin');
      const uri: string = 'a/2147483647';
      const actual1: number = dataUriUtils.getId(uri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(2147483647);
      const actual2: string = dataUriUtils.deleteId(uri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('a');
      const updatedUri: string = dataUriUtils.updateId(uri, 1122);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 updatedUri=${updatedUri}`);
      expect(updatedUri).assertEqual('a/1122');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsExtended0013 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_DATA_URI_EXTENDED_0014
     * @tc.name      testDataUriUtilsExtended0014
     * @tc.desc      扩展：getId("a/9007199254740991")=9007199254740991，deleteId 还原前缀，updateId 替换为 1122
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testDataUriUtilsExtended0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsExtended0014 begin');
      const uri: string = 'a/9007199254740991';
      const actual1: number = dataUriUtils.getId(uri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(9007199254740991);
      const actual2: string = dataUriUtils.deleteId(uri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('a');
      const updatedUri: string = dataUriUtils.updateId(uri, 1122);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 updatedUri=${updatedUri}`);
      expect(updatedUri).assertEqual('a/1122');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsExtended0014 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_DATA_URI_EXTENDED_0015
     * @tc.name      testDataUriUtilsExtended0015
     * @tc.desc      扩展：getId("dataability:///com.samples.abilityruntime/entry/table/0")=0，deleteId 还原前缀，updateId 替换为
     *               1122
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testDataUriUtilsExtended0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsExtended0015 begin');
      const uri: string = 'dataability:///com.samples.abilityruntime/entry/table/0';
      const actual1: number = dataUriUtils.getId(uri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(0);
      const actual2: string = dataUriUtils.deleteId(uri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('dataability:///com.samples.abilityruntime/entry/table');
      const updatedUri: string = dataUriUtils.updateId(uri, 1122);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 updatedUri=${updatedUri}`);
      expect(updatedUri).assertEqual('dataability:///com.samples.abilityruntime/entry/table/1122');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsExtended0015 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_DATA_URI_EXTENDED_0016
     * @tc.name      testDataUriUtilsExtended0016
     * @tc.desc      扩展：getId("dataability:///com.samples.abilityruntime/entry/table/1")=1，deleteId 还原前缀，updateId 替换为
     *               1122
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testDataUriUtilsExtended0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsExtended0016 begin');
      const uri: string = 'dataability:///com.samples.abilityruntime/entry/table/1';
      const actual1: number = dataUriUtils.getId(uri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(1);
      const actual2: string = dataUriUtils.deleteId(uri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('dataability:///com.samples.abilityruntime/entry/table');
      const updatedUri: string = dataUriUtils.updateId(uri, 1122);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 updatedUri=${updatedUri}`);
      expect(updatedUri).assertEqual('dataability:///com.samples.abilityruntime/entry/table/1122');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsExtended0016 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_DATA_URI_EXTENDED_0017
     * @tc.name      testDataUriUtilsExtended0017
     * @tc.desc      扩展：getId("dataability:///com.samples.abilityruntime/entry/table/42")=42，deleteId 还原前缀，updateId 替换为
     *               1122
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testDataUriUtilsExtended0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsExtended0017 begin');
      const uri: string = 'dataability:///com.samples.abilityruntime/entry/table/42';
      const actual1: number = dataUriUtils.getId(uri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(42);
      const actual2: string = dataUriUtils.deleteId(uri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('dataability:///com.samples.abilityruntime/entry/table');
      const updatedUri: string = dataUriUtils.updateId(uri, 1122);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 updatedUri=${updatedUri}`);
      expect(updatedUri).assertEqual('dataability:///com.samples.abilityruntime/entry/table/1122');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsExtended0017 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_DATA_URI_EXTENDED_0018
     * @tc.name      testDataUriUtilsExtended0018
     * @tc.desc      扩展：getId("dataability:///com.samples.abilityruntime/entry/table/99")=99，deleteId 还原前缀，updateId 替换为
     *               1122
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testDataUriUtilsExtended0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsExtended0018 begin');
      const uri: string = 'dataability:///com.samples.abilityruntime/entry/table/99';
      const actual1: number = dataUriUtils.getId(uri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(99);
      const actual2: string = dataUriUtils.deleteId(uri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('dataability:///com.samples.abilityruntime/entry/table');
      const updatedUri: string = dataUriUtils.updateId(uri, 1122);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 updatedUri=${updatedUri}`);
      expect(updatedUri).assertEqual('dataability:///com.samples.abilityruntime/entry/table/1122');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsExtended0018 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_DATA_URI_EXTENDED_0019
     * @tc.name      testDataUriUtilsExtended0019
     * @tc.desc      扩展：getId("dataability:///com.samples.abilityruntime/entry/table/1000")=1000，deleteId 还原前缀，updateId
     *               替换为 1122
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testDataUriUtilsExtended0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsExtended0019 begin');
      const uri: string = 'dataability:///com.samples.abilityruntime/entry/table/1000';
      const actual1: number = dataUriUtils.getId(uri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(1000);
      const actual2: string = dataUriUtils.deleteId(uri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('dataability:///com.samples.abilityruntime/entry/table');
      const updatedUri: string = dataUriUtils.updateId(uri, 1122);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 updatedUri=${updatedUri}`);
      expect(updatedUri).assertEqual('dataability:///com.samples.abilityruntime/entry/table/1122');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsExtended0019 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_DATA_URI_EXTENDED_0020
     * @tc.name      testDataUriUtilsExtended0020
     * @tc.desc      扩展：getId("dataability:///com.samples.abilityruntime/entry/table/2147483647")=2147483647，deleteId
     *               还原前缀，updateId 替换为 1122
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testDataUriUtilsExtended0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsExtended0020 begin');
      const uri: string = 'dataability:///com.samples.abilityruntime/entry/table/2147483647';
      const actual1: number = dataUriUtils.getId(uri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(2147483647);
      const actual2: string = dataUriUtils.deleteId(uri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('dataability:///com.samples.abilityruntime/entry/table');
      const updatedUri: string = dataUriUtils.updateId(uri, 1122);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 updatedUri=${updatedUri}`);
      expect(updatedUri).assertEqual('dataability:///com.samples.abilityruntime/entry/table/1122');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsExtended0020 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_DATA_URI_EXTENDED_0021
     * @tc.name      testDataUriUtilsExtended0021
     * @tc.desc      扩展：getId("dataability:///com.samples.abilityruntime/entry/table/9007199254740991")=9007199254740991
     *               ，deleteId 还原前缀，updateId 替换为 1122
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testDataUriUtilsExtended0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsExtended0021 begin');
      const uri: string = 'dataability:///com.samples.abilityruntime/entry/table/9007199254740991';
      const actual1: number = dataUriUtils.getId(uri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(9007199254740991);
      const actual2: string = dataUriUtils.deleteId(uri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('dataability:///com.samples.abilityruntime/entry/table');
      const updatedUri: string = dataUriUtils.updateId(uri, 1122);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 updatedUri=${updatedUri}`);
      expect(updatedUri).assertEqual('dataability:///com.samples.abilityruntime/entry/table/1122');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsExtended0021 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_DATA_URI_EXTENDED_0022
     * @tc.name      testDataUriUtilsExtended0022
     * @tc.desc      扩展：getId("file://media/Photo/0")=0，deleteId 还原前缀，updateId 替换为 1122
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testDataUriUtilsExtended0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsExtended0022 begin');
      const uri: string = 'file://media/Photo/0';
      const actual1: number = dataUriUtils.getId(uri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(0);
      const actual2: string = dataUriUtils.deleteId(uri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('file://media/Photo');
      const updatedUri: string = dataUriUtils.updateId(uri, 1122);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 updatedUri=${updatedUri}`);
      expect(updatedUri).assertEqual('file://media/Photo/1122');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsExtended0022 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_DATA_URI_EXTENDED_0023
     * @tc.name      testDataUriUtilsExtended0023
     * @tc.desc      扩展：getId("file://media/Photo/1")=1，deleteId 还原前缀，updateId 替换为 1122
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testDataUriUtilsExtended0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsExtended0023 begin');
      const uri: string = 'file://media/Photo/1';
      const actual1: number = dataUriUtils.getId(uri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(1);
      const actual2: string = dataUriUtils.deleteId(uri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('file://media/Photo');
      const updatedUri: string = dataUriUtils.updateId(uri, 1122);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 updatedUri=${updatedUri}`);
      expect(updatedUri).assertEqual('file://media/Photo/1122');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsExtended0023 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_DATA_URI_EXTENDED_0024
     * @tc.name      testDataUriUtilsExtended0024
     * @tc.desc      扩展：getId("file://media/Photo/42")=42，deleteId 还原前缀，updateId 替换为 1122
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testDataUriUtilsExtended0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsExtended0024 begin');
      const uri: string = 'file://media/Photo/42';
      const actual1: number = dataUriUtils.getId(uri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(42);
      const actual2: string = dataUriUtils.deleteId(uri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('file://media/Photo');
      const updatedUri: string = dataUriUtils.updateId(uri, 1122);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 updatedUri=${updatedUri}`);
      expect(updatedUri).assertEqual('file://media/Photo/1122');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsExtended0024 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_DATA_URI_EXTENDED_0025
     * @tc.name      testDataUriUtilsExtended0025
     * @tc.desc      扩展：getId("file://media/Photo/99")=99，deleteId 还原前缀，updateId 替换为 1122
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testDataUriUtilsExtended0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsExtended0025 begin');
      const uri: string = 'file://media/Photo/99';
      const actual1: number = dataUriUtils.getId(uri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(99);
      const actual2: string = dataUriUtils.deleteId(uri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('file://media/Photo');
      const updatedUri: string = dataUriUtils.updateId(uri, 1122);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 updatedUri=${updatedUri}`);
      expect(updatedUri).assertEqual('file://media/Photo/1122');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsExtended0025 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_DATA_URI_EXTENDED_0026
     * @tc.name      testDataUriUtilsExtended0026
     * @tc.desc      扩展：getId("file://media/Photo/1000")=1000，deleteId 还原前缀，updateId 替换为 1122
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testDataUriUtilsExtended0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsExtended0026 begin');
      const uri: string = 'file://media/Photo/1000';
      const actual1: number = dataUriUtils.getId(uri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(1000);
      const actual2: string = dataUriUtils.deleteId(uri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('file://media/Photo');
      const updatedUri: string = dataUriUtils.updateId(uri, 1122);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 updatedUri=${updatedUri}`);
      expect(updatedUri).assertEqual('file://media/Photo/1122');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsExtended0026 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_DATA_URI_EXTENDED_0027
     * @tc.name      testDataUriUtilsExtended0027
     * @tc.desc      扩展：getId("file://media/Photo/2147483647")=2147483647，deleteId 还原前缀，updateId 替换为 1122
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testDataUriUtilsExtended0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsExtended0027 begin');
      const uri: string = 'file://media/Photo/2147483647';
      const actual1: number = dataUriUtils.getId(uri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(2147483647);
      const actual2: string = dataUriUtils.deleteId(uri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('file://media/Photo');
      const updatedUri: string = dataUriUtils.updateId(uri, 1122);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 updatedUri=${updatedUri}`);
      expect(updatedUri).assertEqual('file://media/Photo/1122');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsExtended0027 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_DATA_URI_EXTENDED_0028
     * @tc.name      testDataUriUtilsExtended0028
     * @tc.desc      扩展：getId("file://media/Photo/9007199254740991")=9007199254740991，deleteId 还原前缀，updateId 替换为 1122
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testDataUriUtilsExtended0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsExtended0028 begin');
      const uri: string = 'file://media/Photo/9007199254740991';
      const actual1: number = dataUriUtils.getId(uri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(9007199254740991);
      const actual2: string = dataUriUtils.deleteId(uri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('file://media/Photo');
      const updatedUri: string = dataUriUtils.updateId(uri, 1122);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 updatedUri=${updatedUri}`);
      expect(updatedUri).assertEqual('file://media/Photo/1122');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsExtended0028 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_DATA_URI_EXTENDED_0029
     * @tc.name      testDataUriUtilsExtended0029
     * @tc.desc      扩展特殊 uri 空格数字 "com.example/ 12"：getId 为 12，deleteId 为 "com.example"，updateId 为 "com.example/1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testDataUriUtilsExtended0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsExtended0029 begin');
      const uri: string = 'com.example/ 12';
      const actual1: number = dataUriUtils.getId(uri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(12);
      const actual2: string = dataUriUtils.deleteId(uri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('com.example');
      const actual3: string = dataUriUtils.updateId(uri, 1);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('com.example/1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsExtended0029 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_DATA_URI_EXTENDED_0030
     * @tc.name      testDataUriUtilsExtended0030
     * @tc.desc      扩展特殊 uri 负数 "com.example/-1"：getId 为 -1，deleteId 为 "com.example"，updateId 为 "com.example/1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testDataUriUtilsExtended0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsExtended0030 begin');
      const uri: string = 'com.example/-1';
      const actual1: number = dataUriUtils.getId(uri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(-1);
      const actual2: string = dataUriUtils.deleteId(uri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('com.example');
      const actual3: string = dataUriUtils.updateId(uri, 1);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('com.example/1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsExtended0030 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_DATA_URI_EXTENDED_0031
     * @tc.name      testDataUriUtilsExtended0031
     * @tc.desc      扩展特殊 uri 正号 "com.example/+1"：getId 为 1，deleteId 为 "com.example"，updateId 为 "com.example/1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testDataUriUtilsExtended0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsExtended0031 begin');
      const uri: string = 'com.example/+1';
      const actual1: number = dataUriUtils.getId(uri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(1);
      const actual2: string = dataUriUtils.deleteId(uri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('com.example');
      const actual3: string = dataUriUtils.updateId(uri, 1);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('com.example/1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsExtended0031 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_DATA_URI_EXTENDED_0032
     * @tc.name      testDataUriUtilsExtended0032
     * @tc.desc      扩展特殊 uri 小数 "com.example/1.5"：getId 为 1.5，deleteId 为 "com.example"，updateId 为 "com.example/1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testDataUriUtilsExtended0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsExtended0032 begin');
      const uri: string = 'com.example/1.5';
      const actual1: number = dataUriUtils.getId(uri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(1.5);
      const actual2: string = dataUriUtils.deleteId(uri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('com.example');
      const actual3: string = dataUriUtils.updateId(uri, 1);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('com.example/1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsExtended0032 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_DATA_URI_EXTENDED_0033
     * @tc.name      testDataUriUtilsExtended0033
     * @tc.desc      扩展特殊 uri 十六进制 "com.example/0x10"：getId 为 16，deleteId 为 "com.example"，updateId 为 "com.example/1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testDataUriUtilsExtended0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsExtended0033 begin');
      const uri: string = 'com.example/0x10';
      const actual1: number = dataUriUtils.getId(uri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(16);
      const actual2: string = dataUriUtils.deleteId(uri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('com.example');
      const actual3: string = dataUriUtils.updateId(uri, 1);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('com.example/1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsExtended0033 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_DATA_URI_EXTENDED_0034
     * @tc.name      testDataUriUtilsExtended0034
     * @tc.desc      扩展特殊 uri 双分隔符 "com.example//12"：getId 为 12，deleteId 为 "com.example/"，updateId 为 "com.example//1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testDataUriUtilsExtended0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsExtended0034 begin');
      const uri: string = 'com.example//12';
      const actual1: number = dataUriUtils.getId(uri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(12);
      const actual2: string = dataUriUtils.deleteId(uri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('com.example/');
      const actual3: string = dataUriUtils.updateId(uri, 1);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('com.example//1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsExtended0034 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_DATA_URI_EXTENDED_0035
     * @tc.name      testDataUriUtilsExtended0035
     * @tc.desc      扩展特殊 uri 纯空白 "com.example/  "：getId 为 0，deleteId 为 "com.example"，updateId 为 "com.example/1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testDataUriUtilsExtended0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsExtended0035 begin');
      const uri: string = 'com.example/  ';
      const actual1: number = dataUriUtils.getId(uri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(0);
      const actual2: string = dataUriUtils.deleteId(uri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('com.example');
      const actual3: string = dataUriUtils.updateId(uri, 1);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('com.example/1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsExtended0035 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_DATA_URI_EXTENDED_0036
     * @tc.name      testDataUriUtilsExtended0036
     * @tc.desc      扩展特殊 uri 制表符数字 "com.example/	1"：getId 为 1，deleteId 为 "com.example"，updateId 为 "com.example/1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testDataUriUtilsExtended0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsExtended0036 begin');
      const uri: string = 'com.example/\t1';
      const actual1: number = dataUriUtils.getId(uri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(1);
      const actual2: string = dataUriUtils.deleteId(uri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('com.example');
      const actual3: string = dataUriUtils.updateId(uri, 1);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('com.example/1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsExtended0036 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_DATA_URI_EXTENDED_0037
     * @tc.name      testDataUriUtilsExtended0037
     * @tc.desc      扩展非法 uri 末尾分隔符 "com.example/"：getId/deleteId/updateId 都抛 401
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testDataUriUtilsExtended0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsExtended0037 begin');
      const uri: string = 'com.example/';
      const actual1: string = errorOf(() => dataUriUtils.getId(uri));
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('401:Invalid input parameter.');
      const actual2: string = errorOf(() => dataUriUtils.deleteId(uri));
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('401:Invalid input parameter.');
      const actual3: string = errorOf(() => dataUriUtils.updateId(uri, 1));
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('401:Invalid input parameter.');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsExtended0037 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_DATA_URI_EXTENDED_0038
     * @tc.name      testDataUriUtilsExtended0038
     * @tc.desc      扩展非法 uri 数字后分隔符 "com.example/12/"：getId/deleteId/updateId 都抛 401
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testDataUriUtilsExtended0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsExtended0038 begin');
      const uri: string = 'com.example/12/';
      const actual1: string = errorOf(() => dataUriUtils.getId(uri));
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('401:Invalid input parameter.');
      const actual2: string = errorOf(() => dataUriUtils.deleteId(uri));
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('401:Invalid input parameter.');
      const actual3: string = errorOf(() => dataUriUtils.updateId(uri, 1));
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('401:Invalid input parameter.');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsExtended0038 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_DATA_URI_EXTENDED_0039
     * @tc.name      testDataUriUtilsExtended0039
     * @tc.desc      扩展非法 uri 数字后字母 "com.example/12a"：getId/deleteId/updateId 都抛 401
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testDataUriUtilsExtended0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsExtended0039 begin');
      const uri: string = 'com.example/12a';
      const actual1: string = errorOf(() => dataUriUtils.getId(uri));
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('401:Invalid input parameter.');
      const actual2: string = errorOf(() => dataUriUtils.deleteId(uri));
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('401:Invalid input parameter.');
      const actual3: string = errorOf(() => dataUriUtils.updateId(uri, 1));
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('401:Invalid input parameter.');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsExtended0039 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_DATA_URI_EXTENDED_0040
     * @tc.name      testDataUriUtilsExtended0040
     * @tc.desc      扩展非法 uri 带 query "com.example/12?x=1"：getId/deleteId/updateId 都抛 401
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testDataUriUtilsExtended0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsExtended0040 begin');
      const uri: string = 'com.example/12?x=1';
      const actual1: string = errorOf(() => dataUriUtils.getId(uri));
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('401:Invalid input parameter.');
      const actual2: string = errorOf(() => dataUriUtils.deleteId(uri));
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('401:Invalid input parameter.');
      const actual3: string = errorOf(() => dataUriUtils.updateId(uri, 1));
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('401:Invalid input parameter.');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsExtended0040 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_DATA_URI_EXTENDED_0041
     * @tc.name      testDataUriUtilsExtended0041
     * @tc.desc      扩展非法 uri 带 fragment "com.example/12#top"：getId/deleteId/updateId 都抛 401
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testDataUriUtilsExtended0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsExtended0041 begin');
      const uri: string = 'com.example/12#top';
      const actual1: string = errorOf(() => dataUriUtils.getId(uri));
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('401:Invalid input parameter.');
      const actual2: string = errorOf(() => dataUriUtils.deleteId(uri));
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('401:Invalid input parameter.');
      const actual3: string = errorOf(() => dataUriUtils.updateId(uri, 1));
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('401:Invalid input parameter.');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsExtended0041 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_DATA_URI_EXTENDED_0042
     * @tc.name      testDataUriUtilsExtended0042
     * @tc.desc      扩展非法 uri 空串 空串：getId/deleteId/updateId 都抛 401
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testDataUriUtilsExtended0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsExtended0042 begin');
      const uri: string = '';
      const actual1: string = errorOf(() => dataUriUtils.getId(uri));
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('401:Invalid input parameter.');
      const actual2: string = errorOf(() => dataUriUtils.deleteId(uri));
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('401:Invalid input parameter.');
      const actual3: string = errorOf(() => dataUriUtils.updateId(uri, 1));
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('401:Invalid input parameter.');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsExtended0042 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_DATA_URI_EXTENDED_0043
     * @tc.name      testDataUriUtilsExtended0043
     * @tc.desc      扩展非法 uri 无分隔符 "no-separator"：getId/deleteId/updateId 都抛 401
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testDataUriUtilsExtended0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsExtended0043 begin');
      const uri: string = 'no-separator';
      const actual1: string = errorOf(() => dataUriUtils.getId(uri));
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('401:Invalid input parameter.');
      const actual2: string = errorOf(() => dataUriUtils.deleteId(uri));
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('401:Invalid input parameter.');
      const actual3: string = errorOf(() => dataUriUtils.updateId(uri, 1));
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('401:Invalid input parameter.');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsExtended0043 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_DATA_URI_EXTENDED_0044
     * @tc.name      testDataUriUtilsExtended0044
     * @tc.desc      扩展非法 uri 末段非数字 "/abc"：getId/deleteId/updateId 都抛 401
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testDataUriUtilsExtended0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsExtended0044 begin');
      const uri: string = '/abc';
      const actual1: string = errorOf(() => dataUriUtils.getId(uri));
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('401:Invalid input parameter.');
      const actual2: string = errorOf(() => dataUriUtils.deleteId(uri));
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('401:Invalid input parameter.');
      const actual3: string = errorOf(() => dataUriUtils.updateId(uri, 1));
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('401:Invalid input parameter.');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsExtended0044 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_DATA_URI_EXTENDED_0045
     * @tc.name      testDataUriUtilsExtended0045
     * @tc.desc      扩展非法 uri query 在任意 uri "com.example/abc/12?x=1"：getId/deleteId/updateId 都抛 401
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testDataUriUtilsExtended0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsExtended0045 begin');
      const uri: string = 'com.example/abc/12?x=1';
      const actual1: string = errorOf(() => dataUriUtils.getId(uri));
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('401:Invalid input parameter.');
      const actual2: string = errorOf(() => dataUriUtils.deleteId(uri));
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('401:Invalid input parameter.');
      const actual3: string = errorOf(() => dataUriUtils.updateId(uri, 1));
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('401:Invalid input parameter.');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsExtended0045 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_DATA_URI_EXTENDED_0046
     * @tc.name      testDataUriUtilsExtended0046
     * @tc.desc      扩展非法 uri 末段非数字多级 "com.example/12/abc"：getId/deleteId/updateId 都抛 401
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testDataUriUtilsExtended0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsExtended0046 begin');
      const uri: string = 'com.example/12/abc';
      const actual1: string = errorOf(() => dataUriUtils.getId(uri));
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('401:Invalid input parameter.');
      const actual2: string = errorOf(() => dataUriUtils.deleteId(uri));
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('401:Invalid input parameter.');
      const actual3: string = errorOf(() => dataUriUtils.updateId(uri, 1));
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('401:Invalid input parameter.');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsExtended0046 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_DATA_URI_EXTENDED_0047
     * @tc.name      testDataUriUtilsExtended0047
     * @tc.desc      扩展非法 uri 多级路径末段非数字 "com.example/1/2/abc"：getId/deleteId/updateId 都抛 401
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testDataUriUtilsExtended0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsExtended0047 begin');
      const uri: string = 'com.example/1/2/abc';
      const actual1: string = errorOf(() => dataUriUtils.getId(uri));
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('401:Invalid input parameter.');
      const actual2: string = errorOf(() => dataUriUtils.deleteId(uri));
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('401:Invalid input parameter.');
      const actual3: string = errorOf(() => dataUriUtils.updateId(uri, 1));
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('401:Invalid input parameter.');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsExtended0047 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_DATA_URI_EXTENDED_0048
     * @tc.name      testDataUriUtilsExtended0048
     * @tc.desc      扩展非法 uri 换行数字 "com.example/1
2"：getId/deleteId/updateId 都抛 401
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testDataUriUtilsExtended0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsExtended0048 begin');
      const uri: string = 'com.example/1\n2';
      const actual1: string = errorOf(() => dataUriUtils.getId(uri));
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('401:Invalid input parameter.');
      const actual2: string = errorOf(() => dataUriUtils.deleteId(uri));
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('401:Invalid input parameter.');
      const actual3: string = errorOf(() => dataUriUtils.updateId(uri, 1));
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('401:Invalid input parameter.');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsExtended0048 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_DATA_URI_EXTENDED_0049
     * @tc.name      testDataUriUtilsExtended0049
     * @tc.desc      attachId("com.example", 0) 得到 "com.example/0"，getId 取回 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testDataUriUtilsExtended0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsExtended0049 begin');
      const uri: string = dataUriUtils.attachId('com.example', 0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 uri=${uri}`);
      expect(uri).assertEqual('com.example/0');
      const actual2: number = dataUriUtils.getId(uri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(0);
      const actual3: string = dataUriUtils.deleteId(uri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('com.example');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsExtended0049 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_DATA_URI_EXTENDED_0050
     * @tc.name      testDataUriUtilsExtended0050
     * @tc.desc      attachId("com.example", 1) 得到 "com.example/1"，getId 取回 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testDataUriUtilsExtended0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsExtended0050 begin');
      const uri: string = dataUriUtils.attachId('com.example', 1);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 uri=${uri}`);
      expect(uri).assertEqual('com.example/1');
      const actual2: number = dataUriUtils.getId(uri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(1);
      const actual3: string = dataUriUtils.deleteId(uri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('com.example');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsExtended0050 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_DATA_URI_EXTENDED_0051
     * @tc.name      testDataUriUtilsExtended0051
     * @tc.desc      attachId("com.example", 999) 得到 "com.example/999"，getId 取回 999
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testDataUriUtilsExtended0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsExtended0051 begin');
      const uri: string = dataUriUtils.attachId('com.example', 999);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 uri=${uri}`);
      expect(uri).assertEqual('com.example/999');
      const actual2: number = dataUriUtils.getId(uri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(999);
      const actual3: string = dataUriUtils.deleteId(uri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('com.example');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsExtended0051 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_DATA_URI_EXTENDED_0052
     * @tc.name      testDataUriUtilsExtended0052
     * @tc.desc      attachId("com.example", 2147483647) 得到 "com.example/2147483647"，getId 取回 2147483647
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testDataUriUtilsExtended0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsExtended0052 begin');
      const uri: string = dataUriUtils.attachId('com.example', 2147483647);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 uri=${uri}`);
      expect(uri).assertEqual('com.example/2147483647');
      const actual2: number = dataUriUtils.getId(uri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(2147483647);
      const actual3: string = dataUriUtils.deleteId(uri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('com.example');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsExtended0052 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_DATA_URI_EXTENDED_0053
     * @tc.name      testDataUriUtilsExtended0053
     * @tc.desc      attachId("a/b", 0) 得到 "a/b/0"，getId 取回 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testDataUriUtilsExtended0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsExtended0053 begin');
      const uri: string = dataUriUtils.attachId('a/b', 0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 uri=${uri}`);
      expect(uri).assertEqual('a/b/0');
      const actual2: number = dataUriUtils.getId(uri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(0);
      const actual3: string = dataUriUtils.deleteId(uri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('a/b');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsExtended0053 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_DATA_URI_EXTENDED_0054
     * @tc.name      testDataUriUtilsExtended0054
     * @tc.desc      attachId("a/b", 1) 得到 "a/b/1"，getId 取回 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testDataUriUtilsExtended0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsExtended0054 begin');
      const uri: string = dataUriUtils.attachId('a/b', 1);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 uri=${uri}`);
      expect(uri).assertEqual('a/b/1');
      const actual2: number = dataUriUtils.getId(uri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(1);
      const actual3: string = dataUriUtils.deleteId(uri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('a/b');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsExtended0054 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_DATA_URI_EXTENDED_0055
     * @tc.name      testDataUriUtilsExtended0055
     * @tc.desc      attachId("a/b", 999) 得到 "a/b/999"，getId 取回 999
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testDataUriUtilsExtended0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsExtended0055 begin');
      const uri: string = dataUriUtils.attachId('a/b', 999);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 uri=${uri}`);
      expect(uri).assertEqual('a/b/999');
      const actual2: number = dataUriUtils.getId(uri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(999);
      const actual3: string = dataUriUtils.deleteId(uri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('a/b');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsExtended0055 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_DATA_URI_EXTENDED_0056
     * @tc.name      testDataUriUtilsExtended0056
     * @tc.desc      attachId("a/b", 2147483647) 得到 "a/b/2147483647"，getId 取回 2147483647
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testDataUriUtilsExtended0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsExtended0056 begin');
      const uri: string = dataUriUtils.attachId('a/b', 2147483647);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 uri=${uri}`);
      expect(uri).assertEqual('a/b/2147483647');
      const actual2: number = dataUriUtils.getId(uri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(2147483647);
      const actual3: string = dataUriUtils.deleteId(uri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('a/b');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsExtended0056 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_DATA_URI_EXTENDED_0057
     * @tc.name      testDataUriUtilsExtended0057
     * @tc.desc      attachId("dataability:///x", 0) 得到 "dataability:///x/0"，getId 取回 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testDataUriUtilsExtended0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsExtended0057 begin');
      const uri: string = dataUriUtils.attachId('dataability:///x', 0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 uri=${uri}`);
      expect(uri).assertEqual('dataability:///x/0');
      const actual2: number = dataUriUtils.getId(uri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(0);
      const actual3: string = dataUriUtils.deleteId(uri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('dataability:///x');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsExtended0057 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_DATA_URI_EXTENDED_0058
     * @tc.name      testDataUriUtilsExtended0058
     * @tc.desc      attachId("dataability:///x", 1) 得到 "dataability:///x/1"，getId 取回 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testDataUriUtilsExtended0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsExtended0058 begin');
      const uri: string = dataUriUtils.attachId('dataability:///x', 1);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 uri=${uri}`);
      expect(uri).assertEqual('dataability:///x/1');
      const actual2: number = dataUriUtils.getId(uri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(1);
      const actual3: string = dataUriUtils.deleteId(uri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('dataability:///x');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsExtended0058 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_DATA_URI_EXTENDED_0059
     * @tc.name      testDataUriUtilsExtended0059
     * @tc.desc      attachId("dataability:///x", 999) 得到 "dataability:///x/999"，getId 取回 999
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testDataUriUtilsExtended0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsExtended0059 begin');
      const uri: string = dataUriUtils.attachId('dataability:///x', 999);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 uri=${uri}`);
      expect(uri).assertEqual('dataability:///x/999');
      const actual2: number = dataUriUtils.getId(uri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(999);
      const actual3: string = dataUriUtils.deleteId(uri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('dataability:///x');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsExtended0059 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_DATA_URI_EXTENDED_0060
     * @tc.name      testDataUriUtilsExtended0060
     * @tc.desc      attachId("dataability:///x", 2147483647) 得到 "dataability:///x/2147483647"，getId 取回 2147483647
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testDataUriUtilsExtended0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsExtended0060 begin');
      const uri: string = dataUriUtils.attachId('dataability:///x', 2147483647);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 uri=${uri}`);
      expect(uri).assertEqual('dataability:///x/2147483647');
      const actual2: number = dataUriUtils.getId(uri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(2147483647);
      const actual3: string = dataUriUtils.deleteId(uri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('dataability:///x');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsExtended0060 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_DATA_URI_EXTENDED_0061
     * @tc.name      testDataUriUtilsExtended0061
     * @tc.desc      attachId(空串, 0) 得到 "/0"，getId 取回 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testDataUriUtilsExtended0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsExtended0061 begin');
      const uri: string = dataUriUtils.attachId('', 0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 uri=${uri}`);
      expect(uri).assertEqual('/0');
      const actual2: number = dataUriUtils.getId(uri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(0);
      const actual3: string = dataUriUtils.deleteId(uri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsExtended0061 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_DATA_URI_EXTENDED_0062
     * @tc.name      testDataUriUtilsExtended0062
     * @tc.desc      attachId(空串, 1) 得到 "/1"，getId 取回 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testDataUriUtilsExtended0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsExtended0062 begin');
      const uri: string = dataUriUtils.attachId('', 1);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 uri=${uri}`);
      expect(uri).assertEqual('/1');
      const actual2: number = dataUriUtils.getId(uri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(1);
      const actual3: string = dataUriUtils.deleteId(uri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsExtended0062 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_DATA_URI_EXTENDED_0063
     * @tc.name      testDataUriUtilsExtended0063
     * @tc.desc      attachId(空串, 999) 得到 "/999"，getId 取回 999
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testDataUriUtilsExtended0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsExtended0063 begin');
      const uri: string = dataUriUtils.attachId('', 999);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 uri=${uri}`);
      expect(uri).assertEqual('/999');
      const actual2: number = dataUriUtils.getId(uri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(999);
      const actual3: string = dataUriUtils.deleteId(uri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsExtended0063 end');
    })

    /**
     * @tc.number    SUB_ABILITY_RUNTIME_DATA_URI_EXTENDED_0064
     * @tc.name      testDataUriUtilsExtended0064
     * @tc.desc      attachId(空串, 2147483647) 得到 "/2147483647"，getId 取回 2147483647
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testDataUriUtilsExtended0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsExtended0064 begin');
      const uri: string = dataUriUtils.attachId('', 2147483647);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 uri=${uri}`);
      expect(uri).assertEqual('/2147483647');
      const actual2: number = dataUriUtils.getId(uri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(2147483647);
      const actual3: string = dataUriUtils.deleteId(uri);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testDataUriUtilsExtended0064 end');
    })
  })
}
